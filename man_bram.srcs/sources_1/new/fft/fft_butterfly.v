//////////////////////////////////////////////////////////////////////////////
// Module: FFT Butterfly
// Description: Double-Precision (64-bit) Floating Point FFT multiplier.
//
//////////////////////////////////////////////////////////////////////////////

module fft_butterfly(
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
	wire[63:0] xi, xr, yi, yr;
	wire [63:0] mult_resulti, mult_resultr;
	
	assign x_imag = xi;
	assign x_real = xr;
	assign y_imag = yi;
	assign y_real = yr;
	
	// -----------------------------------------------------------------------
    // Operation encoding for FPUs
    // -----------------------------------------------------------------------
    localparam OP_ADD = 2'b00;
    localparam OP_SUB = 2'b01;
	
	// -----------------------------------------------------------------------
    // Submodules
    // -----------------------------------------------------------------------
	complex_mult cmult(
		.a_data			(b_real),
		.b_data			(b_imag),
		.c_data			(w_real),
		.d_data			(w_imag),
		.outi_data		(mult_resulti),
		.outr_data		(mult_resultr)
	);
	
	fp64_fpu #(
		.STATIC_OP		(OP_SUB)
	) fpu1(
		.a_data			(a_imag),
		.b_data			(mult_resulti),
		.op				(OP_SUB),
		.result			(yi)
	);
	
	fp64_fpu #(
		.STATIC_OP		(OP_ADD)
	) fpu2(
		.a_data			(a_imag),
		.b_data			(mult_resulti),
		.op				(OP_ADD),
		.result			(xi)
	);
	
	fp64_fpu #(
		.STATIC_OP		(OP_SUB)
	) fpu3(
		.a_data			(a_real),
		.b_data			(mult_resultr),
		.op				(OP_SUB),
		.result			(yr)
	);
	
	fp64_fpu #(
		.STATIC_OP		(OP_ADD)
	) fpu4(
		.a_data			(a_real),
		.b_data			(mult_resultr),
		.op				(OP_ADD),
		.result			(xr)
	);
endmodule