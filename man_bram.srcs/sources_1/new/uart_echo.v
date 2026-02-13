`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2026 11:23:09 PM
// Design Name: 
// Module Name: uart_echo
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


module uart_echo (
    input  wire       i_Clock,      // 100 MHz
    input  wire       i_Rx_Serial,  // from FTDI (UART RX line)
    output wire       o_Tx_Serial   // to FTDI (UART TX line)
);

    // Nandland UART RX
    wire       w_Rx_DV;
    wire [7:0] w_Rx_Byte;

    uart_rx #(
        .CLKS_PER_BIT(868)          // 100e6 / 115200 ≈ 868.055 -> 869
    ) uart_rx_inst (
        .i_Clock    (i_Clock),
        .i_Rx_Serial(i_Rx_Serial),
        .o_Rx_DV    (w_Rx_DV),
        .o_Rx_Byte  (w_Rx_Byte)
    );

    // Nandland UART TX
    wire w_Tx_Active;
    wire w_Tx_Done;

    uart_tx #(
        .CLKS_PER_BIT(868)
    ) uart_tx_inst (
        .i_Clock    (i_Clock),
        .i_Tx_DV    (w_Rx_DV),      // when RX has a byte, start TX
        .i_Tx_Byte  (w_Rx_Byte),    // echo same byte
        .o_Tx_Active(w_Tx_Active),
        .o_Tx_Serial(o_Tx_Serial),
        .o_Tx_Done  (w_Tx_Done)
    );

endmodule

