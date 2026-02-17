`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2026
// Design Name: 
// Module Name: ToUART
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   State machine that unpacks 128-bit data from DummyFFT into individual bytes
//   and sends them sequentially over UART. Takes a 128-bit value and transmits
//   16 bytes, one at a time through a UART interface.
//
// Dependencies: 
//   - DummyFFT module (provides 128-bit data)
//   - UART TX module (byte-level transmission)
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ToUART #(parameter DEPTH = 256)
    (
    input                          i_clk,
    input [127:0]                  i_128,
    input                          i_Valid,
    output reg                     o_Ready,
    // RAM128 Read interface
    output reg                     o_Rd_En,
    output reg [$clog2(DEPTH)-1:0] o_Rd_Addr,
    // UART TX interface
    output reg [7:0]               o_UART_Data,
    output reg                     o_UART_Valid,
    input                          i_UART_Ready
    );
    
    // State definitions
    localparam [2:0] IDLE = 3'b000;
    localparam [2:0] LOAD = 3'b001;
    localparam [2:0] SEND = 3'b010;
    localparam [2:0] WAIT = 3'b011;
    
    reg [2:0] state;
    reg [127:0] r_Data;  // Buffer to hold 128-bit input
    reg [3:0] byte_count;  // Counter for which byte (0-15)
    
    // Initialize o_Rd_Addr
    initial o_Rd_Addr = {$clog2(DEPTH){1'b0}};
    
    always @(posedge i_clk) begin
        o_Rd_En <= 1'b0;  // Default read enable to low - ensures o_Rd_En pulses for only one cycle
        
        case (state)
            IDLE: begin
                o_Ready <= 1'b1;
                o_UART_Valid <= 1'b0;
                
                // Wait for valid input data
                if (i_Valid) begin
                    r_Data <= i_128;
                    byte_count <= 4'b0;
                    state <= LOAD;
                    o_Ready <= 1'b0;
                    o_Rd_En <= 1'b1;  // Pulse for one cycle, then defaults to 0 next cycle
                end
            end
            
            LOAD: begin
                // Extract the current byte and send to UART
                // Bytes are packed as: [127:120], [119:112], ..., [7:0]
                o_UART_Data <= r_Data[127 - (byte_count * 8) -: 8];
                o_UART_Valid <= 1'b1;
                state <= WAIT;
            end
            
            WAIT: begin
                // Wait for UART to be ready and accept the byte
                if (i_UART_Ready) begin
                    o_UART_Valid <= 1'b0;
                    
                    // Check if we've sent all 16 bytes
                    if (byte_count == 4'd15) begin
                        state <= IDLE;
                        // Increment read address after finishing this 128-bit word
                        if (o_Rd_Addr == DEPTH - 1) begin
                            o_Rd_Addr <= o_Rd_Addr;  // Hold at max
                        end else begin
                            o_Rd_Addr <= o_Rd_Addr + 1;
                        end
                    end else begin
                        byte_count <= byte_count + 1;
                        state <= LOAD;
                    end
                end
            end
            
            default: state <= IDLE;
        endcase
    end
    
endmodule
