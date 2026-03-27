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


module to_ram #(parameter DEPTH = 64)(
    input           i_clk,
    input [7:0]     i_data,
    input           i_d_valid,
    input           i_rst_n,  // Active-low reset
    // Write port
    output reg                     o_Data_Rd,
    output reg [$clog2(DEPTH)-1:0] o_wr_addr,
    output reg                     o_wr_dv,
    output reg [128-1:0]           o_wr_data
    );
    
    reg [127:0] shift_reg;
    reg [3:0]   byte_cnt;
    reg [1:0]   state;                  // 0 = NOT_FULL, 1 = WRITE

    localparam STATE_NOT_FULL = 2'd0;
    localparam STATE_WRITE    = 2'd1;

    always @(posedge i_clk) begin
        if (!i_rst_n) begin  // Active-low reset
            shift_reg <= 128'd0;
            byte_cnt <= 4'd0;
            state <= STATE_NOT_FULL;
            o_wr_addr <= {$clog2(DEPTH){1'b0}};
            o_wr_dv <= 1'b0;
            o_wr_data <= 128'd0;
            o_Data_Rd <= 1'b0;
        end else begin
            o_wr_dv <= 1'b0;
            o_Data_Rd <= 1'b0;

            case (state)
                STATE_NOT_FULL: begin         // NOT_FULL CASE
                    if (i_d_valid) begin
                        shift_reg <= {i_data, shift_reg[127:8]};
                        
                        if (byte_cnt == 4'd15) begin
                            // Received 16th byte (128 bits total)
                            o_wr_data <= {i_data, shift_reg[127:8]};
                            o_wr_dv <= 1'b1;
                            byte_cnt <= 4'd0;
                            state <= STATE_WRITE;
                        end else begin
                            byte_cnt <= byte_cnt + 4'd1;
                        end
                    end
                end

                STATE_WRITE: begin
                    if (o_wr_addr == DEPTH - 1'b1) begin
                        o_wr_addr <= {$clog2(DEPTH){1'b0}};
                        o_Data_Rd <= 1'b1;
                    end else begin
                        o_wr_addr <= o_wr_addr + 1'b1;
                    end
                    state <= STATE_NOT_FULL;
                end
            endcase
        end
    end

endmodule
