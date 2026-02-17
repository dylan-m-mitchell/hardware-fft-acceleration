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
    
    reg reading; // READING = 1, NOT READING = 0
    
    always @(posedge i_clk) begin
        o_DV <= 1'b0;  // Default to low
        
        // Trigger: i_Data_Rd pulses high when RAM is full
        if (i_Data_Rd) begin
            reading <= 1'b1;
            o_Rd_Addr <= {$clog2(DEPTH){1'b0}};
            o_Wr_Addr <= {$clog2(DEPTH){1'b0}};
            o_Rd_En <= 1'b1;  // Pulse for initial address 0
        end else if (reading) begin
            // Pulse o_Rd_En only when we need the next address
            if (i_Rd_DV) begin
                // Duplicate 64-bit input to 128-bit output
                o_128 <= {2{i_64}};
                o_DV <= 1'b1;  // Pulse high to indicate valid data
                o_Rd_En <= 1'b1;  // Pulse for next address
                
                // Increment write address when data is valid
                if (o_Wr_Addr == DEPTH - 1) begin
                    o_Wr_Addr <= o_Wr_Addr;  // Hold at max
                end else begin
                    o_Wr_Addr <= o_Wr_Addr + 1;
                end
                
                // Stop after reading all DEPTH addresses
                if (o_Rd_Addr == DEPTH - 1) begin
                    reading <= 1'b0;
                end else begin
                    o_Rd_Addr <= o_Rd_Addr + 1;
                end
            end else begin
                o_Rd_En <= 1'b0;  // Keep low until next i_Rd_DV
            end
        end else begin
            o_Rd_En <= 1'b0;
        end
    end
        
endmodule
