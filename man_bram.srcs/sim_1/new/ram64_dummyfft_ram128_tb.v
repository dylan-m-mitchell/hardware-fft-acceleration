`timescale 1ns / 1ps

module ram64_dummyfft_ram128_tb;

    localparam integer WIDTH = 128;
    localparam integer DEPTH = 32;
    localparam integer ADDR_W = $clog2(DEPTH);
    localparam integer TIMEOUT_CYCLES = 2000;

    reg clk = 1'b0;
    reg rst_n = 1'b0;

    // RAM64 write preload interface
    reg [ADDR_W-1:0] ram64_wr_addr = {ADDR_W{1'b0}};
    reg              ram64_wr_dv   = 1'b0;
    reg [WIDTH-1:0]  ram64_wr_data = {WIDTH{1'b0}};

    // RAM64 <-> DummyFFT read interface
    wire [ADDR_W-1:0] ram64_rd_addr;
    wire              ram64_rd_en;
    wire              ram64_rd_dv;
    wire [WIDTH-1:0]  ram64_rd_data;

    // DummyFFT control
    reg fft_start = 1'b0;

    // DummyFFT outputs to RAM128 write interface
    wire [WIDTH-1:0]  fft_o_128;
    wire              fft_o_dv;
    wire [ADDR_W-1:0] fft_o_wr_addr;

    // RAM128 readback interface
    reg [ADDR_W-1:0] ram128_rd_addr = {ADDR_W{1'b0}};
    reg              ram128_rd_en   = 1'b0;
    wire             ram128_rd_dv;
    wire [WIDTH-1:0] ram128_rd_data;
    wire             ram128_full;

    integer i;
    integer read_req_count = 0;
    integer write_count = 0;
    integer expected_read_addr = 0;
    integer expected_write_addr = 0;
    integer ram128_wait_cycles = 0;
    integer cycle_counter = 0;
    integer start_cycle = 0;
    integer first_full_cycle = 0;
    integer latency_cycles = 0;
    time start_time = 0;
    time first_full_time = 0;
    time latency_time = 0;
    reg ram_full_seen = 1'b0;
    reg start_seen = 1'b0;
    reg latency_captured = 1'b0;
    reg prev_ram64_rd_en = 1'b0;
    reg prev_ram128_full = 1'b0;

    reg [WIDTH-1:0] exp_in [0:DEPTH-1];
    reg [WIDTH-1:0] exp_out [0:DEPTH-1];

    // 100 MHz clock
    always #5 clk = ~clk;

    RAM64 #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) u_ram64 (
        .i_Wr_Clk(clk),
        .i_Wr_Addr(ram64_wr_addr),
        .i_Wr_DV(ram64_wr_dv),
        .i_Wr_Data(ram64_wr_data),
        .i_Rd_Clk(clk),
        .i_Rd_Addr(ram64_rd_addr),
        .i_Rd_En(ram64_rd_en),
        .o_Rd_DV(ram64_rd_dv),
        .o_Rd_Data(ram64_rd_data)
    );

    DummyFFT #(
        .DEPTH(DEPTH)
    ) u_dummyfft (
        .i_clk(clk),
        .i_128(ram64_rd_data),
        .i_Rd_DV(ram64_rd_dv),
        .i_Data_Rd(fft_start),
        .o_128(fft_o_128),
        .o_DV(fft_o_dv),
        .o_Rd_En(ram64_rd_en),
        .o_Rd_Addr(ram64_rd_addr),
        .o_Wr_Addr(fft_o_wr_addr)
    );

    RAM128 #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) u_ram128 (
        .i_Wr_Clk(clk),
        .i_Wr_Addr(fft_o_wr_addr),
        .i_Wr_DV(fft_o_dv),
        .i_Wr_Data(fft_o_128),
        .i_Rd_Clk(clk),
        .i_Rd_Addr(ram128_rd_addr),
        .i_Rd_En(ram128_rd_en),
        .o_Rd_DV(ram128_rd_dv),
        .o_Rd_Data(ram128_rd_data),
        .o_RAM_Full(ram128_full)
    );

    function [WIDTH-1:0] make_vector;
        input integer idx;
        begin
            make_vector = {
                (32'h1000_0000 + idx[31:0]),
                (32'h2000_0000 + (idx[31:0] << 1)),
                (32'h3000_0000 + (idx[31:0] << 2)),
                (32'h4000_0000 + (idx[31:0] << 3))
            };
        end
    endfunction

    function [WIDTH-1:0] reverse_bits_128;
        input [WIDTH-1:0] din;
        integer b;
        begin
            for (b = 0; b < WIDTH; b = b + 1) begin
                reverse_bits_128[WIDTH-1-b] = din[b];
            end
        end
    endfunction

    task automatic fail_now;
        input [1023:0] msg;
        begin
            $display("FAIL: %0s @ t=%0t", msg, $time);
            $finish;
        end
    endtask

    // Monitor on negedge to avoid race with DUT non-blocking assignments.
    always @(negedge clk) begin
        if (!rst_n) begin
            read_req_count <= 0;
            write_count <= 0;
            expected_read_addr <= 0;
            expected_write_addr <= 0;
            ram_full_seen <= 1'b0;
            cycle_counter <= 0;
            start_cycle <= 0;
            first_full_cycle <= 0;
            latency_cycles <= 0;
            start_time <= 0;
            first_full_time <= 0;
            latency_time <= 0;
            start_seen <= 1'b0;
            latency_captured <= 1'b0;
            prev_ram64_rd_en <= 1'b0;
            prev_ram128_full <= 1'b0;
        end else begin
            cycle_counter <= cycle_counter + 1;

            if (!start_seen && fft_start) begin
                start_seen <= 1'b1;
                start_cycle <= cycle_counter + 1;
                start_time <= $time;
            end

            if (start_seen && !latency_captured && ram128_full && !prev_ram128_full) begin
                first_full_cycle <= cycle_counter + 1;
                first_full_time <= $time;
                latency_cycles <= (cycle_counter + 1) - start_cycle;
                latency_time <= $time - start_time;
                latency_captured <= 1'b1;
                $display("LATENCY: start->o_RAM_Full first assert = %0d cycles (%0t) [start=%0t, full=%0t]",
                         (cycle_counter + 1) - start_cycle, $time - start_time, start_time, $time);
            end

            // RAM64 model is synchronous: o_Rd_DV should mirror prior-cycle read enable.
            if (ram64_rd_dv !== prev_ram64_rd_en) begin
                fail_now("RAM64 o_Rd_DV timing mismatch (expected 1-cycle latency)");
            end

            if (ram64_rd_en) begin
                if (ram64_rd_addr !== expected_read_addr[ADDR_W-1:0]) begin
                    fail_now("DummyFFT read address progression error");
                end
                expected_read_addr <= expected_read_addr + 1;
                read_req_count <= read_req_count + 1;
            end

            if (fft_o_dv) begin
                if (fft_o_wr_addr !== expected_write_addr[ADDR_W-1:0]) begin
                    fail_now("DummyFFT write address progression error");
                end
                if (write_count >= DEPTH) begin
                    fail_now("More than DEPTH writes observed");
                end
                write_count <= write_count + 1;
                expected_write_addr <= expected_write_addr + 1;
            end

            if (ram128_full) begin
                ram_full_seen <= 1'b1;
            end

            prev_ram64_rd_en <= ram64_rd_en;
            prev_ram128_full <= ram128_full;
        end
    end

    initial begin
        // Build deterministic vectors and expected transformed outputs.
        for (i = 0; i < DEPTH; i = i + 1) begin
            exp_in[i] = make_vector(i);
            exp_out[i] = reverse_bits_128(exp_in[i]);
        end

        // Local reset for testbench sequencing.
        repeat (4) @(posedge clk);
        rst_n <= 1'b1;

        // Preload RAM64 with DEPTH vectors.
        for (i = 0; i < DEPTH; i = i + 1) begin
            @(negedge clk);
            ram64_wr_addr <= i[ADDR_W-1:0];
            ram64_wr_data <= exp_in[i];
            ram64_wr_dv <= 1'b1;
        end
        @(negedge clk);
        ram64_wr_dv <= 1'b0;
        ram64_wr_addr <= {ADDR_W{1'b0}};
        ram64_wr_data <= {WIDTH{1'b0}};

        // One-cycle start pulse.
        @(negedge clk);
        fft_start <= 1'b1;
        @(negedge clk);
        fft_start <= 1'b0;

        // Wait for frame completion or timeout in watchdog.
        wait (write_count == DEPTH);
        repeat (3) @(posedge clk);

        if (read_req_count != DEPTH) begin
            fail_now("Read request count is not exactly DEPTH");
        end
        if (write_count != DEPTH) begin
            fail_now("Write count is not exactly DEPTH");
        end
        if (!ram_full_seen) begin
            fail_now("RAM128 o_RAM_Full not observed");
        end

        // Read back RAM128 and verify all words.
        for (i = 0; i < DEPTH; i = i + 1) begin
            @(negedge clk);
            ram128_rd_addr <= i[ADDR_W-1:0];
            ram128_rd_en <= 1'b1;

            // RAM128 read is synchronous; bound wait to one cycle for robustness.
            ram128_wait_cycles = 0;
            while (!ram128_rd_dv && (ram128_wait_cycles < 2)) begin
                @(negedge clk);
                ram128_wait_cycles = ram128_wait_cycles + 1;
            end

            @(negedge clk);
            ram128_rd_en <= 1'b0;

            if (!ram128_rd_dv) begin
                fail_now("RAM128 read DV not asserted during readback");
            end
            if (ram128_rd_data !== exp_out[i]) begin
                $display("Expected[%0d]=0x%032h", i, exp_out[i]);
                $display("Observed[%0d]=0x%032h", i, ram128_rd_data);
                fail_now("RAM128 data mismatch");
            end
        end

        $display("PASS: RAM64 -> DummyFFT -> RAM128 chain verified for DEPTH=%0d", DEPTH);
        $finish;
    end

    initial begin
        repeat (TIMEOUT_CYCLES) @(posedge clk);
        fail_now("Watchdog timeout");
    end

endmodule
