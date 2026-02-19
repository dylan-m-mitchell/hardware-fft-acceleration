`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2026 05:39:33 PM
// Design Name: 
// Module Name: RAM128_tb
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


module RAM128_tb(

    );

    localparam WIDTH = 128;
    localparam DEPTH = 256;
    localparam ADDR_W = $clog2(DEPTH);

    reg tb_clk = 1'b0;
    

    reg [ADDR_W-1:0]     tb_i_Wr_Addr = {ADDR_W{1'b0}};
    reg                  tb_i_Wr_DV   = 1'b0;
    reg [WIDTH-1:0]      tb_i_Wr_Data = {WIDTH{1'b0}};
    reg [ADDR_W-1:0]     tb_i_Rd_Addr = {ADDR_W{1'b0}};
    reg                  tb_i_Rd_En   = 1'b0;
    wire                 tb_o_Rd_DV;
    wire [WIDTH-1:0]     tb_o_Rd_Data;
    wire                 tb_o_RAM_Full;

    always #5 tb_clk = ~tb_clk;

    RAM128 #(.WIDTH(WIDTH), .DEPTH(DEPTH)) UUT(
        .i_Wr_Clk (tb_clk),
        .i_Wr_Addr(tb_i_Wr_Addr),
        .i_Wr_DV  (tb_i_Wr_DV),
        .i_Wr_Data(tb_i_Wr_Data),
        .i_Rd_Clk (tb_clk),
        .i_Rd_Addr(tb_i_Rd_Addr),
        .i_Rd_En  (tb_i_Rd_En),
        .o_Rd_DV  (tb_o_Rd_DV),
        .o_Rd_Data(tb_o_Rd_Data),
        .o_RAM_Full(tb_o_RAM_Full)
    );

    integer wr_count;

    initial begin
        tb_i_Wr_DV   = 1'b0;
        tb_i_Wr_Addr = {ADDR_W{1'b0}};
        tb_i_Wr_Data = {WIDTH{1'b0}};

        @(posedge tb_clk);
        tb_i_Wr_DV = 1'b1;
        wr_count = 0;

        repeat (DEPTH) begin
            tb_i_Wr_Addr = wr_count[ADDR_W-1:0];
            tb_i_Wr_Data = {4{32'hA5A50000 | wr_count[31:0]}};
            @(posedge tb_clk);
            wr_count = wr_count + 1;
        end

        tb_i_Wr_DV = 1'b0;
        repeat (2) @(posedge tb_clk);
        $finish;
    end
    

endmodule
