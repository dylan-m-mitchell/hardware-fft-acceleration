`timescale 1ns / 1ps

module fft32_ram_wrapper (
    input               i_clk,
    input               i_rst_n,

    // External RAM64 load interface
    input       [4:0]   i_in_wr_addr,
    input               i_in_wr_dv,
    input       [127:0] i_in_wr_data,

    // Frame control
    input               i_start,
    output              o_busy,
    output reg          o_done,

    // External RAM128 read interface
    input       [4:0]   i_out_rd_addr,
    input               i_out_rd_en,
    output      [127:0] o_out_rd_data,
    output              o_out_rd_dv,
    output              o_out_ram_full
);

    localparam S_IDLE   = 3'd0;
    localparam S_LOAD   = 3'd1;
    localparam S_LATCH  = 3'd2;
    localparam S_STREAM = 3'd3;
    localparam S_DONE   = 3'd4;

    reg [2:0] r_state;

    // RAM64 read controls
    reg [4:0] r_ram64_rd_addr;
    reg       r_ram64_rd_en;
    wire      w_ram64_rd_dv;
    wire [127:0] w_ram64_rd_data;

    // Input sample and FFT output storage
    reg [127:0] r_samples [0:31];
    reg [127:0] r_fft_words [0:31];

    // FFT IO buses
    wire [63:0] w_fft_inr [0:31];
    wire [63:0] w_fft_ini [0:31];
    wire [63:0] w_fft_outr [0:31];
    wire [63:0] w_fft_outi [0:31];

    // LOAD counters
    reg [5:0] r_load_req_cnt;
    reg [5:0] r_load_cap_cnt;

    // STREAM controls
    reg [4:0] r_stream_bin;
    reg [3:0] r_stream_byte;
    reg       r_stream_gap;
    reg [7:0] r_to_ram_data;
    reg       r_to_ram_dv;

    // to_ram -> RAM128 write path
    wire [4:0]   w_ram128_wr_addr;
    wire         w_ram128_wr_dv;
    wire [127:0] w_ram128_wr_data;
    wire         w_to_ram_data_rd;

    integer k;

    genvar gi;
    generate
        for (gi = 0; gi < 32; gi = gi + 1) begin : GEN_FFT_IN_MAP
            assign w_fft_inr[gi] = r_samples[gi][63:0];
            assign w_fft_ini[gi] = r_samples[gi][127:64];
        end
    endgenerate

    assign o_busy = (r_state != S_IDLE);

    RAM64 u_ram64 (
        .i_Wr_Clk(i_clk),
        .i_Wr_Addr(i_in_wr_addr),
        .i_Wr_DV(i_in_wr_dv),
        .i_Wr_Data(i_in_wr_data),
        .i_Rd_Clk(i_clk),
        .i_Rd_Addr(r_ram64_rd_addr),
        .i_Rd_En(r_ram64_rd_en),
        .o_Rd_DV(w_ram64_rd_dv),
        .o_Rd_Data(w_ram64_rd_data)
    );

    fft_32 u_fft_32 (
        .inr_0(w_fft_inr[0]),   .ini_0(w_fft_ini[0]),
        .inr_1(w_fft_inr[1]),   .ini_1(w_fft_ini[1]),
        .inr_2(w_fft_inr[2]),   .ini_2(w_fft_ini[2]),
        .inr_3(w_fft_inr[3]),   .ini_3(w_fft_ini[3]),
        .inr_4(w_fft_inr[4]),   .ini_4(w_fft_ini[4]),
        .inr_5(w_fft_inr[5]),   .ini_5(w_fft_ini[5]),
        .inr_6(w_fft_inr[6]),   .ini_6(w_fft_ini[6]),
        .inr_7(w_fft_inr[7]),   .ini_7(w_fft_ini[7]),
        .inr_8(w_fft_inr[8]),   .ini_8(w_fft_ini[8]),
        .inr_9(w_fft_inr[9]),   .ini_9(w_fft_ini[9]),
        .inr_10(w_fft_inr[10]), .ini_10(w_fft_ini[10]),
        .inr_11(w_fft_inr[11]), .ini_11(w_fft_ini[11]),
        .inr_12(w_fft_inr[12]), .ini_12(w_fft_ini[12]),
        .inr_13(w_fft_inr[13]), .ini_13(w_fft_ini[13]),
        .inr_14(w_fft_inr[14]), .ini_14(w_fft_ini[14]),
        .inr_15(w_fft_inr[15]), .ini_15(w_fft_ini[15]),
        .inr_16(w_fft_inr[16]), .ini_16(w_fft_ini[16]),
        .inr_17(w_fft_inr[17]), .ini_17(w_fft_ini[17]),
        .inr_18(w_fft_inr[18]), .ini_18(w_fft_ini[18]),
        .inr_19(w_fft_inr[19]), .ini_19(w_fft_ini[19]),
        .inr_20(w_fft_inr[20]), .ini_20(w_fft_ini[20]),
        .inr_21(w_fft_inr[21]), .ini_21(w_fft_ini[21]),
        .inr_22(w_fft_inr[22]), .ini_22(w_fft_ini[22]),
        .inr_23(w_fft_inr[23]), .ini_23(w_fft_ini[23]),
        .inr_24(w_fft_inr[24]), .ini_24(w_fft_ini[24]),
        .inr_25(w_fft_inr[25]), .ini_25(w_fft_ini[25]),
        .inr_26(w_fft_inr[26]), .ini_26(w_fft_ini[26]),
        .inr_27(w_fft_inr[27]), .ini_27(w_fft_ini[27]),
        .inr_28(w_fft_inr[28]), .ini_28(w_fft_ini[28]),
        .inr_29(w_fft_inr[29]), .ini_29(w_fft_ini[29]),
        .inr_30(w_fft_inr[30]), .ini_30(w_fft_ini[30]),
        .inr_31(w_fft_inr[31]), .ini_31(w_fft_ini[31]),

        .outr_0(w_fft_outr[0]),   .outi_0(w_fft_outi[0]),
        .outr_1(w_fft_outr[1]),   .outi_1(w_fft_outi[1]),
        .outr_2(w_fft_outr[2]),   .outi_2(w_fft_outi[2]),
        .outr_3(w_fft_outr[3]),   .outi_3(w_fft_outi[3]),
        .outr_4(w_fft_outr[4]),   .outi_4(w_fft_outi[4]),
        .outr_5(w_fft_outr[5]),   .outi_5(w_fft_outi[5]),
        .outr_6(w_fft_outr[6]),   .outi_6(w_fft_outi[6]),
        .outr_7(w_fft_outr[7]),   .outi_7(w_fft_outi[7]),
        .outr_8(w_fft_outr[8]),   .outi_8(w_fft_outi[8]),
        .outr_9(w_fft_outr[9]),   .outi_9(w_fft_outi[9]),
        .outr_10(w_fft_outr[10]), .outi_10(w_fft_outi[10]),
        .outr_11(w_fft_outr[11]), .outi_11(w_fft_outi[11]),
        .outr_12(w_fft_outr[12]), .outi_12(w_fft_outi[12]),
        .outr_13(w_fft_outr[13]), .outi_13(w_fft_outi[13]),
        .outr_14(w_fft_outr[14]), .outi_14(w_fft_outi[14]),
        .outr_15(w_fft_outr[15]), .outi_15(w_fft_outi[15]),
        .outr_16(w_fft_outr[16]), .outi_16(w_fft_outi[16]),
        .outr_17(w_fft_outr[17]), .outi_17(w_fft_outi[17]),
        .outr_18(w_fft_outr[18]), .outi_18(w_fft_outi[18]),
        .outr_19(w_fft_outr[19]), .outi_19(w_fft_outi[19]),
        .outr_20(w_fft_outr[20]), .outi_20(w_fft_outi[20]),
        .outr_21(w_fft_outr[21]), .outi_21(w_fft_outi[21]),
        .outr_22(w_fft_outr[22]), .outi_22(w_fft_outi[22]),
        .outr_23(w_fft_outr[23]), .outi_23(w_fft_outi[23]),
        .outr_24(w_fft_outr[24]), .outi_24(w_fft_outi[24]),
        .outr_25(w_fft_outr[25]), .outi_25(w_fft_outi[25]),
        .outr_26(w_fft_outr[26]), .outi_26(w_fft_outi[26]),
        .outr_27(w_fft_outr[27]), .outi_27(w_fft_outi[27]),
        .outr_28(w_fft_outr[28]), .outi_28(w_fft_outi[28]),
        .outr_29(w_fft_outr[29]), .outi_29(w_fft_outi[29]),
        .outr_30(w_fft_outr[30]), .outi_30(w_fft_outi[30]),
        .outr_31(w_fft_outr[31]), .outi_31(w_fft_outi[31])
    );

    to_ram #(.DEPTH(32)) u_to_ram (
        .i_clk(i_clk),
        .i_data(r_to_ram_data),
        .i_d_valid(r_to_ram_dv),
        .i_rst_n(i_rst_n),
        .o_Data_Rd(w_to_ram_data_rd),
        .o_wr_addr(w_ram128_wr_addr),
        .o_wr_dv(w_ram128_wr_dv),
        .o_wr_data(w_ram128_wr_data)
    );

    RAM128 u_ram128 (
        .i_Wr_Clk(i_clk),
        .i_Wr_Addr(w_ram128_wr_addr),
        .i_Wr_DV(w_ram128_wr_dv),
        .i_Wr_Data(w_ram128_wr_data),
        .i_Rd_Clk(i_clk),
        .i_Rd_Addr(i_out_rd_addr),
        .i_Rd_En(i_out_rd_en),
        .o_Rd_DV(o_out_rd_dv),
        .o_Rd_Data(o_out_rd_data),
        .o_RAM_Full(o_out_ram_full)
    );

    always @(posedge i_clk) begin
        if (!i_rst_n) begin
            r_state <= S_IDLE;
            o_done <= 1'b0;

            r_ram64_rd_addr <= 5'd0;
            r_ram64_rd_en <= 1'b0;
            r_load_req_cnt <= 6'd0;
            r_load_cap_cnt <= 6'd0;

            r_stream_bin <= 5'd0;
            r_stream_byte <= 4'd0;
            r_stream_gap <= 1'b0;
            r_to_ram_data <= 8'd0;
            r_to_ram_dv <= 1'b0;

            for (k = 0; k < 32; k = k + 1) begin
                r_samples[k] <= 128'd0;
                r_fft_words[k] <= 128'd0;
            end
        end else begin
            o_done <= 1'b0;
            r_to_ram_dv <= 1'b0;

            case (r_state)
                S_IDLE: begin
                    r_ram64_rd_en <= 1'b0;
                    r_ram64_rd_addr <= 5'd0;
                    r_load_req_cnt <= 6'd0;
                    r_load_cap_cnt <= 6'd0;
                    r_stream_bin <= 5'd0;
                    r_stream_byte <= 4'd0;
                    r_stream_gap <= 1'b0;

                    if (i_start) begin
                        r_state <= S_LOAD;
                    end
                end

                S_LOAD: begin
                    if (r_load_req_cnt < 6'd32) begin
                        r_ram64_rd_en <= 1'b1;
                        r_ram64_rd_addr <= r_load_req_cnt[4:0];
                        r_load_req_cnt <= r_load_req_cnt + 6'd1;
                    end else begin
                        r_ram64_rd_en <= 1'b0;
                    end

                    if (w_ram64_rd_dv) begin
                        r_samples[r_load_cap_cnt[4:0]] <= w_ram64_rd_data;
                        if (r_load_cap_cnt == 6'd31) begin
                            r_load_cap_cnt <= 6'd32;
                            r_state <= S_LATCH;
                            r_ram64_rd_en <= 1'b0;
                        end else begin
                            r_load_cap_cnt <= r_load_cap_cnt + 6'd1;
                        end
                    end
                end

                S_LATCH: begin
                    for (k = 0; k < 32; k = k + 1) begin
                        r_fft_words[k] <= {w_fft_outi[k], w_fft_outr[k]};
                    end

                    r_stream_bin <= 5'd0;
                    r_stream_byte <= 4'd0;
                    r_stream_gap <= 1'b0;
                    r_state <= S_STREAM;
                end

                S_STREAM: begin
                    if (r_stream_gap) begin
                        r_stream_gap <= 1'b0;

                        if (r_stream_bin == 5'd31) begin
                            r_state <= S_DONE;
                        end else begin
                            r_stream_bin <= r_stream_bin + 5'd1;
                            r_stream_byte <= 4'd0;
                        end
                    end else begin
                        r_to_ram_data <= r_fft_words[r_stream_bin][(r_stream_byte * 8) +: 8];
                        r_to_ram_dv <= 1'b1;

                        if (r_stream_byte == 4'd15) begin
                            r_stream_gap <= 1'b1;
                        end else begin
                            r_stream_byte <= r_stream_byte + 4'd1;
                        end
                    end
                end

                S_DONE: begin
                    o_done <= 1'b1;
                    r_state <= S_IDLE;
                end

                default: begin
                    r_state <= S_IDLE;
                end
            endcase
        end
    end

endmodule
