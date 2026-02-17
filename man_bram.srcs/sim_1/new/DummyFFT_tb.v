`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2026 10:59:07 PM
// Design Name: 
// Module Name: DummyFFT_tb
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


module DummyFFT_tb(

    );
    
    // Parameters
    localparam DEPTH = 256;
    
    // Loop variable
    integer i;

    // Testbench signals - Inputs to DUV
    reg tb_clk;
    reg [63:0] tb_i_64;
    reg tb_i_Rd_DV;
    reg tb_i_Data_Rd;
    
    // Testbench signals - Outputs from DUV
    wire [127:0] tb_o_128;
    wire tb_o_Rd_En;
    wire [$clog2(DEPTH)-1:0] tb_o_Rd_Addr;
    
    // Clock generation
    initial tb_clk = 1'b0;
    always #5 tb_clk = ~tb_clk;
    
    // DUV instantiation
    DummyFFT #(.DEPTH(DEPTH)) UUT (
        .i_clk(tb_clk),
        .i_64(tb_i_64),
        .i_Rd_DV(tb_i_Rd_DV),
        .i_Data_Rd(tb_i_Data_Rd),
        .o_128(tb_o_128),
        .o_Rd_En(tb_o_Rd_En),
        .o_Rd_Addr(tb_o_Rd_Addr)
    );
    
    // Test stimulus
    initial begin
        // Initialize inputs
        tb_i_64 = 64'b0;
        tb_i_Rd_DV = 1'b0;
        tb_i_Data_Rd = 1'b0;
        
        // Wait for a few clock cycles
        #50;
        
        // Trigger the module to start reading
        @(posedge tb_clk);
        tb_i_Data_Rd = 1'b1;
        @(posedge tb_clk);
        tb_i_Data_Rd = 1'b0;
        
        // Simulate reading all 256 addresses from RAM
        for (i = 0; i < DEPTH; i = i + 1) begin
            @(posedge tb_clk);
            tb_i_Rd_DV = 1'b1;
            tb_i_64 = {8{i[7:0]}};  // Repeating pattern: 0x0101010101010101, 0x0202020202020202, etc.
            
            @(posedge tb_clk);
            tb_i_Rd_DV = 1'b0;  // Keep DV high for one cycle only
        end
        
        // Wait a few more cycles to verify module has stopped
        repeat(5) @(posedge tb_clk);
        
        // Verify that o_Rd_En is low (module is idle) and address is at max
        if (tb_o_Rd_En == 1'b0 && tb_o_Rd_Addr == (DEPTH - 1)) begin
            $display("SUCCESS: Module correctly stopped after 256 reads");
        end else begin
            $display("ERROR: Module did not stop correctly. o_Rd_En=%b, o_Rd_Addr=%d", 
                     tb_o_Rd_En, tb_o_Rd_Addr);
        end
        
        $stop;
    end
    
endmodule
