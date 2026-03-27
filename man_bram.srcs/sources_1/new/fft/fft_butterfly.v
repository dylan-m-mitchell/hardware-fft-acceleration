//////////////////////////////////////////////////////////////////////////////
// Module: FFT Butterfly
// Description: Double-Precision (64-bit) Floating Point FFT multiplier.
//
//////////////////////////////////////////////////////////////////////////////

module fft_butterfly(
	input wire 			clk,
	input wire 			rst,
	input wire [63:0] 	a_imag,
	input wire [63:0] 	a_real,
	input wire [63:0] 	b_imag, 
	input wire [63:0] 	b_real,
	input wire [63:0] 	w_imag, 
	input wire [63:0] 	w_real,
	output wire	[63:0] 	x_imag,
	output wire	[63:0]	x_real,
	output wire [63:0]  y_imag,
	output wire [63:0] 	y_real
	);

	
	// -----------------------------------------------------------------------
    // Regs and wires
    // -----------------------------------------------------------------------
	reg [1:0] fpu1_op, fpu2_op, fpu3_op, fpu4_op;
	reg [63:0] xi_mux, xr_mux, yi_mux, yr_mux;
	
	wire[63:0] xi, xr, yi, yr;
	wire [63:0] mult_resulti, mult_resultr;
	
	assign x_imag = xi_mux;
	assign x_real = xr_mux;
	assign y_imag = yi_mux;
	assign y_real = yr_mux;
	
	// -----------------------------------------------------------------------
    // Operation encoding for FPUs
    // -----------------------------------------------------------------------
    localparam OP_ADD = 2'b00;
    localparam OP_SUB = 2'b01;
    localparam OP_MUL = 2'b10;
	
	// -----------------------------------------------------------------------
    // Submodules
    // -----------------------------------------------------------------------
	complex_mult cmult(
		.clk		    (clk),
		.rst			(rst),
		.a_data			(b_real),
		.b_data			(b_imag),
		.c_data			(w_real),
		.d_data			(w_imag),
		.outi_data		(mult_resulti),
		.outr_data		(mult_resultr)
	);
	
	fp64_fpu fpu1(
		.a_data			(a_imag),
		.b_data			(mult_resulti),
		.op				(fpu1_op),
		.result			(yi),
		.flags			(fpu1_flags)
	);
	
	fp64_fpu fpu2(
		.a_data			(a_imag),
		.b_data			(mult_resulti),
		.op				(fpu2_op),
		.result			(xi),
		.flags			(fpu2_flags)
	);
	
	fp64_fpu fpu3(
		.a_data			(a_real),
		.b_data			(mult_resultr),
		.op				(fpu3_op),
		.result			(yr),
		.flags			(fpu3_flags)
	);
	
	fp64_fpu fpu4(
		.a_data			(a_real),
		.b_data			(mult_resultr),
		.op				(fpu4_op),
		.result			(xr),
		.flags			(fpu4_flags)
	);
	
	initial begin
		fpu1_op = OP_SUB;
		fpu2_op = OP_ADD;
		fpu3_op = OP_SUB;
		fpu4_op = OP_ADD;
	end
	
	always @(*) begin
		xi_mux = xi;
		xr_mux = xr;
		yi_mux = yi;
		yr_mux = yr;
	end
endmodule