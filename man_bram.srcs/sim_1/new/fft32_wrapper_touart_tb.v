`timescale 1ns / 1ps

module fft32_wrapper_touart_tb;

    localparam integer DEPTH = 32;
    localparam integer FRAME_COUNT = 3;
    localparam integer ADDR_W = 5;
    localparam integer BYTES_PER_WORD = 16;
    localparam integer FRAME_BYTES = DEPTH * BYTES_PER_WORD;
    localparam integer FRAME_TIMEOUT_CYCLES = 12000;
    localparam integer GLOBAL_TIMEOUT_CYCLES = 40000;

    localparam [63:0] FP64_ZERO = 64'h0000_0000_0000_0000;
    localparam [63:0] FP64_ONE = 64'h3FF0_0000_0000_0000;
    localparam [63:0] FP64_NEG_ONE = 64'hBFF0_0000_0000_0000;
    localparam [63:0] FP64_THIRTY_TWO = 64'h4040_0000_0000_0000;

    reg clk = 1'b0;
    reg i_rst_n = 1'b0;

    // Wrapper preload interface
    reg [ADDR_W-1:0]   i_in_wr_addr = {ADDR_W{1'b0}};
    reg                i_in_wr_dv = 1'b0;
    reg [127:0]        i_in_wr_data = 128'd0;

    // Frame control
    reg                i_start = 1'b0;
    wire               o_busy;
    wire               o_done;

    // Wrapper output RAM read interface (driven by ToUART)
    wire [ADDR_W-1:0]  i_out_rd_addr;
    wire               i_out_rd_en;
    wire [127:0]       o_out_rd_data;
    wire               o_out_rd_dv;
    wire               o_out_ram_full;

    // UART side
    wire [7:0]         o_UART_Data;
    wire               o_UART_Valid;
    wire               o_Done_Pulse;
    wire               o_Done_Level;
    reg                i_UART_Ready = 1'b1;

    // Captured words per frame: [0..31] frame0, [32..63] frame1, [64..95] frame2
    reg [127:0] expected_words [0:(FRAME_COUNT*DEPTH)-1];
    reg [127:0] uart_words     [0:(FRAME_COUNT*DEPTH)-1];

    integer fail_count = 0;
    integer total_mismatch_count = 0;

    integer active_base = 0;
    integer frame_rx_byte_count = 0;
    integer frame_uart_word_count = 0;
    integer frame_cycle_count = 0;
    integer backpressure_phase = 0;
    integer tb_cycle = 0;

    time start_time_ns;
    time fft_ready_time_ns;
    time wrapper_done_time_ns;
    time tx_done_time_ns;
    reg  start_time_valid = 1'b0;
    reg  fft_ready_time_valid = 1'b0;
    reg  wrapper_done_time_valid = 1'b0;
    reg  tx_done_time_valid = 1'b0;
    integer tx_done_pulse_seen = 0;
    integer tx_done_level_seen = 0;

    reg frame_active = 1'b0;
    reg frame_backpressure = 1'b0;

    integer g_i;

    always #5 clk = ~clk;

    initial begin
        // Use explicit ns-formatted %t output for all timing displays.
        $timeformat(-9, 3, " ns", 12);
    end

    fft32_ram_wrapper u_wrapper (
        .i_clk(clk),
        .i_rst_n(i_rst_n),
        .i_in_wr_addr(i_in_wr_addr),
        .i_in_wr_dv(i_in_wr_dv),
        .i_in_wr_data(i_in_wr_data),
        .i_start(i_start),
        .o_busy(o_busy),
        .o_done(o_done),
        .i_out_rd_addr(i_out_rd_addr),
        .i_out_rd_en(i_out_rd_en),
        .o_out_rd_data(o_out_rd_data),
        .o_out_rd_dv(o_out_rd_dv),
        .o_out_ram_full(o_out_ram_full)
    );

    ToUART #(
        .DEPTH(DEPTH)
    ) u_touart (
        .i_clk(clk),
        .i_128(o_out_rd_data),
        .i_Valid(o_out_rd_dv),
        .i_Ram_Full(o_out_ram_full),
        .o_Ready(),
        .o_Done_Pulse(o_Done_Pulse),
        .o_Done_Level(o_Done_Level),
        .o_Rd_En(i_out_rd_en),
        .o_Rd_Addr(i_out_rd_addr),
        .o_UART_Data(o_UART_Data),
        .o_UART_Valid(o_UART_Valid),
        .i_UART_Ready(i_UART_Ready)
    );

    function [127:0] pack_complex;
        input [63:0] real_lane;
        input [63:0] imag_lane;
        begin
            pack_complex = {imag_lane, real_lane};
        end
    endfunction

    function [127:0] frame_input_word;
        input integer frame_id;
        input integer sample_idx;
        begin
            case (frame_id)
                0: begin
                    // Frame A: impulse
                    if (sample_idx == 0) begin
                        frame_input_word = pack_complex(FP64_ONE, FP64_ZERO);
                    end else begin
                        frame_input_word = pack_complex(FP64_ZERO, FP64_ZERO);
                    end
                end
                1: begin
                    // Frame B: DC 1.0
                    frame_input_word = pack_complex(FP64_ONE, FP64_ZERO);
                end
                default: begin
                    // Frame C: alternating +1/-1
                    if (sample_idx[0] == 1'b0) begin
                        frame_input_word = pack_complex(FP64_ONE, FP64_ZERO);
                    end else begin
                        frame_input_word = pack_complex(FP64_NEG_ONE, FP64_ZERO);
                    end
                end
            endcase
        end
    endfunction

    function [127:0] expected_fft_word;
        input integer frame_id;
        input integer bin_idx;
        begin
            case (frame_id)
                0: begin
                    // Impulse FFT: all bins are 1 + 0j.
                    expected_fft_word = pack_complex(FP64_ONE, FP64_ZERO);
                end
                1: begin
                    // DC FFT: bin0 = 32 + 0j, others = 0 + 0j.
                    if (bin_idx == 0) begin
                        expected_fft_word = pack_complex(FP64_THIRTY_TWO, FP64_ZERO);
                    end else begin
                        expected_fft_word = pack_complex(FP64_ZERO, FP64_ZERO);
                    end
                end
                default: begin
                    // Alternating FFT: bin16 = 32 + 0j, others = 0 + 0j.
                    if (bin_idx == 16) begin
                        expected_fft_word = pack_complex(FP64_THIRTY_TWO, FP64_ZERO);
                    end else begin
                        expected_fft_word = pack_complex(FP64_ZERO, FP64_ZERO);
                    end
                end
            endcase
        end
    endfunction

    task record_fail;
        input [1023:0] msg;
        begin
            fail_count = fail_count + 1;
            $display("ERROR: %0s @ t=%0t", msg, $time);
        end
    endtask

    task stop_with_summary;
        begin
            if (fail_count == 0) begin
                $display("PASS: 3 FFT frames verified. total_mismatches=%0d", total_mismatch_count);
            end else begin
                $display("FAIL: fail_count=%0d total_mismatches=%0d", fail_count, total_mismatch_count);
            end
            $finish;
        end
    endtask

    task run_frame;
        input integer frame_id;
        input integer use_backpressure;
        integer i;
        integer widx;
        integer bidx;
        integer local_mismatch_count;
        begin
            active_base = frame_id * DEPTH;
            frame_rx_byte_count = 0;
            frame_uart_word_count = 0;
            frame_cycle_count = 0;
            backpressure_phase = 0;
            frame_backpressure = (use_backpressure != 0);
            frame_active = 1'b1;
            i_UART_Ready = 1'b1;
            start_time_ns = 0;
            fft_ready_time_ns = 0;
            wrapper_done_time_ns = 0;
            tx_done_time_ns = 0;
            start_time_valid = 1'b0;
            fft_ready_time_valid = 1'b0;
            wrapper_done_time_valid = 1'b0;
            tx_done_time_valid = 1'b0;
            tx_done_pulse_seen = 0;
            tx_done_level_seen = 0;

            for (i = 0; i < DEPTH; i = i + 1) begin
                uart_words[active_base + i] = 128'd0;
                expected_words[active_base + i] = expected_fft_word(frame_id, i);
            end

            // Preload RAM64 with mathematically defined frame samples.
            for (i = 0; i < DEPTH; i = i + 1) begin
                @(negedge clk);
                i_in_wr_addr <= i[ADDR_W-1:0];
                i_in_wr_data <= frame_input_word(frame_id, i);
                i_in_wr_dv <= 1'b1;
            end
            @(negedge clk);
            i_in_wr_dv <= 1'b0;
            i_in_wr_addr <= {ADDR_W{1'b0}};
            i_in_wr_data <= 128'd0;

            // Start frame processing and timestamp start.
            @(negedge clk);
            i_start <= 1'b1;
            start_time_ns = $time;
            start_time_valid = 1'b1;
            @(negedge clk);
            i_start <= 1'b0;

            // Completion requires done pulse plus complete 512-byte UART capture.
            while (((tx_done_pulse_seen == 0) || (frame_rx_byte_count < FRAME_BYTES)) &&
                   (frame_cycle_count < FRAME_TIMEOUT_CYCLES)) begin
                @(negedge clk);
            end

            frame_active = 1'b0;
            i_UART_Ready = 1'b1;

            if (tx_done_pulse_seen == 0) begin
                record_fail("ToUART done pulse not observed before timeout");
            end
            if (frame_rx_byte_count != FRAME_BYTES) begin
                record_fail("UART byte count did not reach 512 before timeout");
            end
            if (frame_uart_word_count != DEPTH) begin
                record_fail("UART reconstructed word count did not reach 32");
            end
            if (fft_ready_time_valid == 1'b0) begin
                record_fail("Wrapper o_out_ram_full not observed for frame");
            end
            if (wrapper_done_time_valid == 1'b0) begin
                record_fail("Wrapper o_done not observed for frame");
            end
            if (tx_done_time_valid == 1'b0) begin
                record_fail("ToUART o_Done_Pulse cycle not captured");
            end

            local_mismatch_count = 0;
            for (i = 0; i < DEPTH; i = i + 1) begin
                if (uart_words[active_base + i] !== expected_words[active_base + i]) begin
                    local_mismatch_count = local_mismatch_count + 1;
                    total_mismatch_count = total_mismatch_count + 1;
                    $display("MISMATCH frame=%0d bin=%0d exp=0x%032h act=0x%032h",
                             frame_id, i, expected_words[active_base + i], uart_words[active_base + i]);
                end
            end

            // Sanity: each accepted UART byte must map into [0..31] words.
            widx = frame_rx_byte_count / BYTES_PER_WORD;
            bidx = frame_rx_byte_count % BYTES_PER_WORD;
            if ((widx > DEPTH) || (bidx >= BYTES_PER_WORD)) begin
                record_fail("Internal UART assembly index out of range");
            end

            if ((start_time_valid == 1'b1) && (fft_ready_time_valid == 1'b1) && (wrapper_done_time_valid == 1'b1)) begin
                $display("FRAME%0d latency (internal): Internal-RAM-ready=%0t Internal-wrapper-done=%0t",
                         frame_id,
                         (fft_ready_time_ns - start_time_ns),
                         (wrapper_done_time_ns - start_time_ns));
            end
            if ((start_time_valid == 1'b1) && (fft_ready_time_valid == 1'b1) && (tx_done_time_valid == 1'b1)) begin
                $display("FRAME%0d latency (UART-dependent): UART-drain=%0t End-to-end=%0t",
                         frame_id,
                         (tx_done_time_ns - fft_ready_time_ns),
                         (tx_done_time_ns - start_time_ns));
            end

            if (local_mismatch_count == 0) begin
                $display("FRAME%0d PASS: bytes=%0d words=%0d done_level_seen=%0d backpressure=%0d",
                         frame_id, frame_rx_byte_count, frame_uart_word_count, tx_done_level_seen, use_backpressure);
            end else begin
                record_fail("Frame compare mismatch detected");
            end

            // Let FSMs settle before next frame.
            repeat (8) @(negedge clk);
        end
    endtask

    // Capture status and UART bytes at negedge to avoid NBA race with DUT updates.
    always @(negedge clk) begin
        tb_cycle <= tb_cycle + 1;

        if (!i_rst_n) begin
            frame_rx_byte_count <= 0;
            frame_uart_word_count <= 0;
            frame_cycle_count <= 0;
            backpressure_phase <= 0;
            i_UART_Ready <= 1'b1;
            start_time_ns <= 0;
            fft_ready_time_ns <= 0;
            wrapper_done_time_ns <= 0;
            tx_done_time_ns <= 0;
            start_time_valid <= 1'b0;
            fft_ready_time_valid <= 1'b0;
            wrapper_done_time_valid <= 1'b0;
            tx_done_time_valid <= 1'b0;
            tx_done_pulse_seen <= 0;
            tx_done_level_seen <= 0;
        end else if (frame_active) begin
            if ((fft_ready_time_valid == 1'b0) && o_out_ram_full) begin
                fft_ready_time_ns <= $time;
                fft_ready_time_valid <= 1'b1;
            end

            if ((wrapper_done_time_valid == 1'b0) && o_done) begin
                wrapper_done_time_ns <= $time;
                wrapper_done_time_valid <= 1'b1;
            end

            if (o_Done_Pulse) begin
                tx_done_pulse_seen <= 1;
                if (tx_done_time_valid == 1'b0) begin
                    tx_done_time_ns <= $time;
                    tx_done_time_valid <= 1'b1;
                end
            end

            if (o_Done_Level) begin
                tx_done_level_seen <= 1;
            end

            if (o_UART_Valid && i_UART_Ready) begin
                if (frame_rx_byte_count < FRAME_BYTES) begin
                    uart_words[active_base + (frame_rx_byte_count / BYTES_PER_WORD)]
                        [((frame_rx_byte_count % BYTES_PER_WORD) * 8) +: 8] <= o_UART_Data;
                    frame_rx_byte_count <= frame_rx_byte_count + 1;
                    if ((frame_rx_byte_count % BYTES_PER_WORD) == (BYTES_PER_WORD - 1)) begin
                        frame_uart_word_count <= frame_uart_word_count + 1;
                    end
                end else begin
                    record_fail("Observed more than 512 accepted UART bytes in frame");
                end
            end

            frame_cycle_count <= frame_cycle_count + 1;

            if (frame_backpressure) begin
                // Periodic stalls to exercise WAIT_UART path.
                if ((backpressure_phase % 7) == 3) begin
                    i_UART_Ready <= 1'b0;
                end else begin
                    i_UART_Ready <= 1'b1;
                end
                backpressure_phase <= backpressure_phase + 1;
            end else begin
                i_UART_Ready <= 1'b1;
            end
        end
    end

    initial begin
        for (g_i = 0; g_i < (FRAME_COUNT*DEPTH); g_i = g_i + 1) begin
            expected_words[g_i] = 128'd0;
            uart_words[g_i] = 128'd0;
        end

        // Wrapper reset generation.
        repeat (6) @(negedge clk);
        i_rst_n <= 1'b1;

        run_frame(0, 0); // Frame A: impulse, always-ready UART
        run_frame(1, 0); // Frame B: DC, always-ready UART
        run_frame(2, 1); // Frame C: alternating, periodic backpressure UART

        if (total_mismatch_count != 0) begin
            record_fail("One or more frame word mismatches occurred");
        end

        stop_with_summary();
    end

    initial begin
        repeat (GLOBAL_TIMEOUT_CYCLES) @(posedge clk);
        record_fail("Global watchdog timeout");
        stop_with_summary();
    end

endmodule
