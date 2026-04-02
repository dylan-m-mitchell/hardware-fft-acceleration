//////////////////////////////////////////////////////////////////////////////
// Module: twiddle_rom
// Description: 128-entry ROM with dedicated outputs for each twiddle factor.
//              All 128 complex twiddle factors (W_128^k) are available
//              simultaneously as constant wire outputs.
//
// Port List:
//   output [63:0] re_0  .. re_127  - Real parts (cosine)
//   output [63:0] im_0  .. im_127  - Imaginary parts (-sine)
//////////////////////////////////////////////////////////////////////////////

module twiddle_rom (
    output wire [63:0] re_0,   output wire [63:0] im_0,
    output wire [63:0] re_1,   output wire [63:0] im_1,
    output wire [63:0] re_2,   output wire [63:0] im_2,
    output wire [63:0] re_3,   output wire [63:0] im_3,
    output wire [63:0] re_4,   output wire [63:0] im_4,
    output wire [63:0] re_5,   output wire [63:0] im_5,
    output wire [63:0] re_6,   output wire [63:0] im_6,
    output wire [63:0] re_7,   output wire [63:0] im_7,
    output wire [63:0] re_8,   output wire [63:0] im_8,
    output wire [63:0] re_9,   output wire [63:0] im_9,
    output wire [63:0] re_10,  output wire [63:0] im_10,
    output wire [63:0] re_11,  output wire [63:0] im_11,
    output wire [63:0] re_12,  output wire [63:0] im_12,
    output wire [63:0] re_13,  output wire [63:0] im_13,
    output wire [63:0] re_14,  output wire [63:0] im_14,
    output wire [63:0] re_15,  output wire [63:0] im_15
);

	assign re_0 = 64'h3FF0000000000000; assign im_0 = 64'h0000000000000000;
	assign re_1 = 64'h3FEF6297CFF75CB0; assign im_1 = 64'hBFC8F8B83C69A60A;
	assign re_2 = 64'h3FED906BCF328D46; assign im_2 = 64'hBFD87DE2A6AEA963;
	assign re_3 = 64'h3FEA9B66290EA1A3; assign im_3 = 64'hBFE1C73B39AE68C8;
	assign re_4 = 64'h3FE6A09E667F3BCD; assign im_4 = 64'hBFE6A09E667F3BCD;
	assign re_5 = 64'h3FE1C73B39AE68C9; assign im_5 = 64'hBFEA9B66290EA1A3;
	assign re_6 = 64'h3FD87DE2A6AEA964; assign im_6 = 64'hBFED906BCF328D46;
	assign re_7 = 64'h3FC8F8B83C69A60D; assign im_7 = 64'hBFEF6297CFF75CB0;
	assign re_8 = 64'h0000000000000000; assign im_8 = 64'hBFF0000000000000;
	assign re_9 = 64'hBFC8F8B83C69A608; assign im_9 = 64'hBFEF6297CFF75CB0;
	assign re_10 = 64'hBFD87DE2A6AEA962; assign im_10 = 64'hBFED906BCF328D46;
	assign re_11 = 64'hBFE1C73B39AE68C6; assign im_11 = 64'hBFEA9B66290EA1A4;
	assign re_12 = 64'hBFE6A09E667F3BCC; assign im_12 = 64'hBFE6A09E667F3BCD;
	assign re_13 = 64'hBFEA9B66290EA1A4; assign im_13 = 64'hBFE1C73B39AE68C8;
	assign re_14 = 64'hBFED906BCF328D46; assign im_14 = 64'hBFD87DE2A6AEA965;
	assign re_15 = 64'hBFEF6297CFF75CB0; assign im_15 = 64'hBFC8F8B83C69A617;

endmodule
