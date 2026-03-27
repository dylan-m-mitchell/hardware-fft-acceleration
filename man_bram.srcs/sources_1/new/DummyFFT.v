`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2026 10:38:36 PM
// Design Name: 
// Module Name: DummyFFT
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   Reads 64-bit data from external RAM sequentially and outputs it duplicated
//   as 128-bit data. Triggered by a single-cycle pulse on i_Data_Rd, then
//   continuously reads all addresses in the RAM without further input.
//
// Dependencies: 
//   - Assumes external RAM with o_Rd_DV output indicating valid data
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DummyFFT #(parameter DEPTH = 64)
    (
    input                          i_clk,
    input [127:0]                  i_128,
    input                          i_Rd_DV,
    input                          i_Data_Rd,
    output reg [127:0]             o_128,
    output reg                     o_DV,
    output reg                     o_Rd_En,
    output reg [$clog2(DEPTH)-1:0] o_Rd_Addr,
    output reg [$clog2(DEPTH)-1:0] o_Wr_Addr
    );
    
    reg reading = 1'b0; // READING = 1, NOT READING = 0
    reg [$clog2(DEPTH)-1:0] r_rd_addr = {$clog2(DEPTH){1'b0}};
    reg [$clog2(DEPTH)-1:0] r_wr_addr = {$clog2(DEPTH){1'b0}};
    
    always @(posedge i_clk) begin
        o_DV <= 1'b0;
        o_Rd_En <= 1'b0;

        if (i_Data_Rd && !reading) begin
            reading <= 1'b1;
            r_rd_addr <= {$clog2(DEPTH){1'b0}};
            r_wr_addr <= {$clog2(DEPTH){1'b0}};
            o_Rd_Addr <= {$clog2(DEPTH){1'b0}};
            o_Wr_Addr <= {$clog2(DEPTH){1'b0}};
            o_Rd_En <= 1'b1;
        end else if (reading && i_Rd_DV) begin
            o_128 <= {i_128[0], i_128[1], i_128[2], i_128[3], i_128[4], i_128[5], i_128[6], i_128[7],
                      i_128[8], i_128[9], i_128[10], i_128[11], i_128[12], i_128[13], i_128[14], i_128[15],
                      i_128[16], i_128[17], i_128[18], i_128[19], i_128[20], i_128[21], i_128[22], i_128[23],
                      i_128[24], i_128[25], i_128[26], i_128[27], i_128[28], i_128[29], i_128[30], i_128[31],
                      i_128[32], i_128[33], i_128[34], i_128[35], i_128[36], i_128[37], i_128[38], i_128[39],
                      i_128[40], i_128[41], i_128[42], i_128[43], i_128[44], i_128[45], i_128[46], i_128[47],
                      i_128[48], i_128[49], i_128[50], i_128[51], i_128[52], i_128[53], i_128[54], i_128[55],
                      i_128[56], i_128[57], i_128[58], i_128[59], i_128[60], i_128[61], i_128[62], i_128[63],
                      i_128[64], i_128[65], i_128[66], i_128[67], i_128[68], i_128[69], i_128[70], i_128[71],
                      i_128[72], i_128[73], i_128[74], i_128[75], i_128[76], i_128[77], i_128[78], i_128[79],
                      i_128[80], i_128[81], i_128[82], i_128[83], i_128[84], i_128[85], i_128[86], i_128[87],
                      i_128[88], i_128[89], i_128[90], i_128[91], i_128[92], i_128[93], i_128[94], i_128[95],
                      i_128[96], i_128[97], i_128[98], i_128[99], i_128[100], i_128[101], i_128[102], i_128[103],
                      i_128[104], i_128[105], i_128[106], i_128[107], i_128[108], i_128[109], i_128[110], i_128[111],
                      i_128[112], i_128[113], i_128[114], i_128[115], i_128[116], i_128[117], i_128[118], i_128[119],
                      i_128[120], i_128[121], i_128[122], i_128[123], i_128[124], i_128[125], i_128[126], i_128[127]};
            o_DV <= 1'b1;
            o_Wr_Addr <= r_wr_addr;

            if (r_wr_addr == DEPTH - 1) begin
                reading <= 1'b0;
            end else begin
                r_wr_addr <= r_wr_addr + 1;
            end

            if (r_rd_addr != DEPTH - 1) begin
                r_rd_addr <= r_rd_addr + 1;
                o_Rd_Addr <= r_rd_addr + 1;
                o_Rd_En <= 1'b1;
            end
        end
    end
        
endmodule
