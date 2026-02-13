`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2026 11:11:27 PM
// Design Name: 
// Module Name: to_ram_tb
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


module to_ram_tb();
    // Clock and control
    reg r_clk = 1'b0;
    reg r_rst = 1'b0;
    
    // Input signals
    reg [7:0] r_data;
    reg r_d_valid = 1'b0;
    reg [63:0] r_double_bits;
    real r_double;
    integer i;
    
    // RAM read port (simulated)
    reg r_rd_dv = 1'b0;
    reg [191:0] r_rd_data = 192'b0;
    
    // Output signals (captured from UUT)
    wire [$clog2(256)-1:0] w_wr_addr;
    wire w_wr_dv;
    wire [191:0] w_wr_data;
    wire [$clog2(256)-1:0] w_rd_addr;
    wire w_rd_en;

    // Clock generation: 10 ns period (100 MHz)
    always #5 r_clk <= ~r_clk;
    
    // Instantiate the module under test
    to_ram #(.DEPTH(256)) UUT(
        .i_clk(r_clk),
        .i_data(r_data),
        .i_d_valid(r_d_valid),
        .i_rst(r_rst),
        .o_wr_addr(w_wr_addr),
        .o_wr_dv(w_wr_dv),
        .o_wr_data(w_wr_data),
        .o_rd_addr(w_rd_addr),
        .o_rd_en(w_rd_en),
        .i_rd_dv(r_rd_dv),
        .i_rd_data(r_rd_data)
    );
    
    // Task to send a byte with valid pulse
    // Simulates UART behavior: DOUT available early, DOUT_VLD pulses 1-2 cycles later
    task send_byte(input [7:0] byte_val);
        begin
            @(posedge r_clk);
            r_data <= byte_val;  // Data available now
            // Simulate 1-2 cycle delay before valid pulse
            @(posedge r_clk);
            r_d_valid <= 1'b1;   // Valid pulse (after delay)
            @(posedge r_clk);
            r_d_valid <= 1'b0;
        end
    endtask
    
    initial begin
        // Reset
        r_rst <= 1'b1;
        r_data <= 8'h00;
        @(posedge r_clk);
        @(posedge r_clk);
        r_rst <= 1'b0;
        
        $display("Starting to_ram testbench...");
        
        // Send a single double value as 8 bytes (MSB first)
        r_double = 3.141592653589793;
        r_double_bits = $realtobits(r_double);
        for (i = 7; i >= 0; i = i - 1) begin
            send_byte(r_double_bits[i*8 +: 8]);
        end
        
        // Wait for FSM to enter READ state
        @(posedge r_clk);
        @(posedge r_clk);
        
        // Simulate RAM read response
        @(posedge r_clk);
        r_rd_dv <= 1'b1;
        r_rd_data <= 192'h0000000000000000AAAAAAAAAAAAAAAA;  // Dummy data in lower 128 bits
        @(posedge r_clk);
        r_rd_dv <= 1'b0;
        
        // Wait for write to complete
        @(posedge r_clk);
        @(posedge r_clk);
        
        $display("Test complete.");
        $finish;
    end

endmodule
