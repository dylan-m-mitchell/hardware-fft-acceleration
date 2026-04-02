//////////////////////////////////////////////////////////////////////////////
// Module: complex_mult
// Description: Double-Precision (64-bit) Floating Point complex multiplier. 
//
// IEEE 754 Double Format:
//   [63]    Sign (1 bit)
//   [62:52] Exponent (11 bits, bias <= 1023)
//   [51:0]  Mantissa/Fraction (52 bits, implicit leading 1 for normals)
//////////////////////////////////////////////////////////////////////////////

module complex_mult(
	input wire [63:0] a_data,
	input wire [63:0] b_data,
	input wire [63:0] c_data,
	input wire [63:0] d_data,
	output wire [63:0] outi_data,
	output wire [63:0] outr_data
	);
	
	// -----------------------------------------------------------------------
    // Internal regs for intermediate values and fpus
    // -----------------------------------------------------------------------
	
	wire [63:0] p1_result, p2_result, apb_result, cpd_result, p3_result, p3mp2_result, p1mp2_result, p32mp1_result;

	assign outr_data = p1mp2_result;
	assign outi_data = p32mp1_result;
	// -----------------------------------------------------------------------
    // Operation encoding for FPUs
    // -----------------------------------------------------------------------
    localparam OP_ADD = 2'b00;
    localparam OP_SUB = 2'b01;
    localparam OP_MUL = 2'b10;
	
	// -----------------------------------------------------------------------
    // FPU instances
    // -----------------------------------------------------------------------
	fp64_fpu #(
		.STATIC_OP			(OP_MUL)
	) p1(
		.a_data			(a_data),
		.b_data			(c_data),
		.op				(OP_MUL),
		.result			(p1_result)
	);
	
	fp64_fpu #(
		.STATIC_OP			(OP_MUL)
	) p2(
		.a_data			(b_data),
		.b_data			(d_data),
		.op				(OP_MUL),
		.result			(p2_result)
	);
	
	fp64_fpu #(
		.STATIC_OP			(OP_ADD)
	) apb(
		.a_data			(a_data),
		.b_data			(b_data),
		.op				(OP_ADD),
		.result			(apb_result)
	);
	
	fp64_fpu #(
		.STATIC_OP			(OP_ADD)
	) cpd(
		.a_data			(c_data),
		.b_data			(d_data),
		.op				(OP_ADD),
		.result			(cpd_result)
	);
	
	fp64_fpu #(
		.STATIC_OP			(OP_MUL)
	) p3(
		.a_data			(apb_result),
		.b_data			(cpd_result),
		.op				(OP_MUL),
		.result			(p3_result)
	);
	
	fp64_fpu #(
		.STATIC_OP			(OP_SUB)
	) p1mp2(
		.a_data			(p1_result),
		.b_data			(p2_result),
		.op				(OP_SUB),
		.result			(p1mp2_result)
	);
	
	fp64_fpu #(
		.STATIC_OP			(OP_SUB)
	) p3mp2(
		.a_data			(p3_result),
		.b_data			(p2_result),
		.op				(OP_SUB),
		.result			(p3mp2_result)
	);
	
	fp64_fpu #(
		.STATIC_OP			(OP_SUB)
	) p32mp1(
		.a_data			(p3mp2_result),
		.b_data			(p1_result),
		.op				(OP_SUB),
		.result			(p32mp1_result)
	);
endmodule