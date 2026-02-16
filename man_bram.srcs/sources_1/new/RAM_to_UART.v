`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2026
// Design Name: 
// Module Name: RAM_to_UART
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// State machine that unpacks 64-bit RAM data into 8-bit chunks
// and sends to UART in little-endian format
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RAM_to_UART (
    input                   i_Clk,
    input                   i_Rst,
    
    // RAM Interface
    input [63:0]            i_Ram_Data,
    input                   i_Ram_Valid,
    output reg              o_Ram_Rd_En,
    
    // UART Interface
    output reg [7:0]        o_DIN,
    output reg              o_DIN_Valid,
    input                   i_DIN_Ready,
    
    // Status
    output reg              o_Busy
);

    // State machine states
    localparam IDLE = 3'b000;
    localparam WAIT_READY = 3'b001;
    localparam SEND_BYTE = 3'b010;
    localparam INCREMENT = 3'b011;
    localparam DONE = 3'b100;
    
    reg [2:0]   r_State;
    reg [2:0]   r_Byte_Count;      // Count 0-7 for 8 bytes
    reg [63:0]  r_Data;            // Store the 64-bit data
    
    always @(posedge i_Clk) begin
        if (i_Rst) begin
            r_State <= IDLE;
            r_Byte_Count <= 3'b0;
            r_Data <= 64'b0;
            o_DIN <= 8'b0;
            o_DIN_Valid <= 1'b0;
            o_Ram_Rd_En <= 1'b0;
            o_Busy <= 1'b0;
        end else begin
            case (r_State)
                
                IDLE: begin
                    o_DIN_Valid <= 1'b0;
                    o_Ram_Rd_En <= 1'b0;
                    o_Busy <= 1'b0;
                    
                    if (i_Ram_Valid) begin
                        // Capture the 64-bit data
                        r_Data <= i_Ram_Data;
                        r_Byte_Count <= 3'b0;
                        o_Ram_Rd_En <= 1'b1;
                        r_State <= SEND_BYTE;
                        o_Busy <= 1'b1;
                    end
                end
                
                SEND_BYTE: begin
                    // Extract byte in little-endian order (LSB first)
                    case (r_Byte_Count)
                        3'd0: o_DIN <= r_Data[7:0];
                        3'd1: o_DIN <= r_Data[15:8];
                        3'd2: o_DIN <= r_Data[23:16];
                        3'd3: o_DIN <= r_Data[31:24];
                        3'd4: o_DIN <= r_Data[39:32];
                        3'd5: o_DIN <= r_Data[47:40];
                        3'd6: o_DIN <= r_Data[55:48];
                        3'd7: o_DIN <= r_Data[63:56];
                    endcase
                    
                    o_Ram_Rd_En <= 1'b0;
                    o_DIN_Valid <= 1'b1;
                    r_State <= WAIT_READY;
                end
                
                WAIT_READY: begin
                    // Wait for UART to be ready for next byte
                    if (i_DIN_Ready) begin
                        r_State <= INCREMENT;
                    end
                end
                
                INCREMENT: begin
                    o_DIN_Valid <= 1'b0;
                    
                    if (r_Byte_Count == 3'd7) begin
                        // Finished sending all 8 bytes
                        r_State <= DONE;
                    end else begin
                        r_Byte_Count <= r_Byte_Count + 1'b1;
                        r_State <= SEND_BYTE;
                    end
                end
                
                DONE: begin
                    r_State <= IDLE;
                    o_Busy <= 1'b0;
                end
                
                default: begin
                    r_State <= IDLE;
                end
            endcase
        end
    end

endmodule
