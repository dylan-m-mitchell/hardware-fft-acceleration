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
    input                          i_Ram_Full,
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
    localparam [1:0] IDLE      = 2'b00;
    localparam [1:0] WAIT_DATA = 2'b01;
    localparam [1:0] LOAD      = 2'b10;
    localparam [1:0] WAIT_UART = 2'b11;

    reg [1:0]   state;
    reg [127:0] r_Data;
    reg [3:0]   byte_count;

    // Initialize outputs/registers
    initial state = IDLE;
    initial o_Rd_Addr = {$clog2(DEPTH){1'b0}};
    initial o_Rd_En = 1'b0;
    initial o_UART_Data = 8'b0;
    initial o_UART_Valid = 1'b0;
    initial o_Ready = 1'b1;
    initial byte_count = 4'b0;
    initial r_Data = 128'b0;

    always @(posedge i_clk) begin
        o_Rd_En <= 1'b0;

        case (state)
            IDLE: begin
                o_Ready <= 1'b1;
                o_UART_Valid <= 1'b0;
                byte_count <= 4'b0;

                // Stay idle until RAM128 reports full, then start from address 0
                if (i_Ram_Full) begin
                    o_Ready <= 1'b0;
                    o_Rd_Addr <= {$clog2(DEPTH){1'b0}};
                    o_Rd_En <= 1'b1;
                    state <= WAIT_DATA;
                end
            end

            WAIT_DATA: begin
                o_Ready <= 1'b0;
                o_UART_Valid <= 1'b0;

                // Capture data only when RAM128 marks it valid
                if (i_Valid) begin
                    r_Data <= i_128;
                    byte_count <= 4'b0;
                    state <= LOAD;
                end
            end

            LOAD: begin
                // Send bytes [7:0] ... [127:120] (little-endian)
                o_UART_Data <= r_Data[(byte_count * 8) +: 8];
                o_UART_Valid <= 1'b1;
                state <= WAIT_UART;
            end

            WAIT_UART: begin
                if (i_UART_Ready) begin
                    o_UART_Valid <= 1'b0;

                    if (byte_count == 4'd15) begin
                        // Completed this 128-bit word
                        if (o_Rd_Addr == DEPTH - 1) begin
                            state <= IDLE;
                        end else begin
                            o_Rd_Addr <= o_Rd_Addr + 1'b1;
                            o_Rd_En <= 1'b1;
                            state <= WAIT_DATA;
                        end
                    end else begin
                        byte_count <= byte_count + 1'b1;
                        state <= LOAD;
                    end
                end
            end

            default: state <= IDLE;
        endcase
    end
    
endmodule
