`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2026 11:23:34 PM
// Design Name: 
// Module Name: uart_echo_top
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


module uart_echo_top (
    input  wire clk_100mhz,
    input  wire uart_rx,    // from FTDI TX pin
    output wire uart_tx     // to FTDI RX pin
);
    uart_echo u0 (
        .i_Clock    (clk_100mhz),
        .i_Rx_Serial(uart_rx),
        .o_Tx_Serial(uart_tx)
    );
endmodule

