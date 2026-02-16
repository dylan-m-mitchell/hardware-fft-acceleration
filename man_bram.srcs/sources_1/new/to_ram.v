`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2026 12:59:28 PM
// Design Name: 
// Module Name: to_ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module to_ram #(parameter DEPTH = 256)(
    input           i_clk,
    input [7:0]     i_data,
    input           i_d_valid,
    input           i_rst,
    // Write port
    output reg [$clog2(DEPTH)-1:0] o_wr_addr,
    output reg                     o_wr_dv,
    output reg [191:0]             o_wr_data,
    // Read port
    output reg [$clog2(DEPTH)-1:0] o_rd_addr,
    output reg                     o_rd_en,
    input                          i_rd_dv,
    input [127:0]                  i_rd_data_128
    );
    
    reg [63:0]  shift_reg;
    reg [2:0]   byte_cnt;
    reg [1:0]   state;                  // 0 = NOT_FULL, 1 = FULL, 2 = WRITE

    localparam STATE_NOT_FULL = 2'd0;
    localparam STATE_READ     = 2'd1;
    localparam STATE_WRITE    = 2'd2;

    always @(posedge i_clk) begin
        if (i_rst) begin
            shift_reg <= 64'd0;
            byte_cnt <= 3'd0;
            state <= STATE_NOT_FULL;
            o_wr_addr <= {$clog2(DEPTH){1'b0}};
            o_rd_addr <= {$clog2(DEPTH){1'b0}};
            o_wr_dv <= 1'b0;
            o_rd_en <= 1'b0;
            o_wr_data <= 192'd0;
        end else begin
            o_wr_dv <= 1'b0;
            o_rd_en <= 1'b0;

            case (state)
                STATE_NOT_FULL: begin         // NOT_FULL CASE
                    if (i_d_valid) begin
                        shift_reg <= {i_data, shift_reg[63:8]};
                        byte_cnt <= byte_cnt + 3'd1;
                        if (byte_cnt == 3'd7) begin
                            // Initiate read for RMW
                            o_rd_addr <= o_wr_addr;
                            o_rd_en <= 1'b1;
                            state <= STATE_READ;
                        end
                    end
                end

                STATE_READ: begin
                    if (i_rd_dv) begin
                        // MERGE the 64-bit portion with the 128-bit portion
                        o_wr_data <= { shift_reg, i_rd_data_128 };
                        o_wr_dv <= 1'b1;
                        state <= STATE_WRITE;
                    end
                end

                STATE_WRITE: begin
                    if (o_wr_addr == DEPTH - 1'b1) begin
                        o_wr_addr <= {$clog2(DEPTH){1'b0}};
                    end else begin
                        o_wr_addr <= o_wr_addr + 1'b1;
                    end
                    byte_cnt <= 3'd0;
                    state <= STATE_NOT_FULL;
                end
            endcase
        end
    end

endmodule
