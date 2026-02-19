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


module DummyFFT #(parameter DEPTH = 256)
    (
    input                          i_clk,
    input [63:0]                   i_64,
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
            o_128 <= {2{i_64}};
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
