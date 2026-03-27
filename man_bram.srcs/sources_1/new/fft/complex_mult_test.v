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
	input wire clk,
	input wire rst,
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
	
    reg [1:0] add, sub, mul;	
	reg [63:0] outi_mux, outr_mux;
	wire [4:0] p1_flags, p2_flags, apb_flags, cpd_flags, p3_flags, p1mp2_flags, p3mp2_flags, p32mp1_flags;
	wire [63:0] p1_result, p2_result, apb_result, cpd_result, p3_result, p3mp2_result, p1mp2_result, p32mp1_result;

	assign outi_data = outi_mux;
	assign outr_data = outr_mux;
	// -----------------------------------------------------------------------
    // Operation encoding for FPUs
    // -----------------------------------------------------------------------
    localparam OP_ADD = 2'b00;
    localparam OP_SUB = 2'b01;
    localparam OP_MUL = 2'b10;
	
	// -----------------------------------------------------------------------
    // FPU instances
    // -----------------------------------------------------------------------
	fp64_fpu p1(
		.a_data			(a_data),
		.b_data			(c_data),
		.op				(mul),
		.result			(p1_result),
		.flags			(p1_flags)
	);
	
	fp64_fpu p2(
		.a_data			(b_data),
		.b_data			(d_data),
		.op				(mul),
		.result			(p2_result),
		.flags			(p2_flags)
	);
	
	fp64_fpu apb(
		.a_data			(a_data),
		.b_data			(b_data),
		.op				(add),
		.result			(apb_result),
		.flags			(apb_flags)
	);
	
	fp64_fpu cpd(
		.a_data			(c_data),
		.b_data			(d_data),
		.op				(add),
		.result			(cpd_result),
		.flags			(cpd_flags)
	);
	
	fp64_fpu p3(
		.a_data			(apb_result),
		.b_data			(cpd_result),
		.op				(mul),
		.result			(p3_result),
		.flags			(p3_flags)
	);
	
	fp64_fpu p1mp2(
		.a_data			(p1_result),
		.b_data			(p2_result),
		.op				(sub),
		.result			(p1mp2_result),
		.flags			(p1mp2_flags)
	);
	
	fp64_fpu p3mp2(
		.a_data			(p3_result),
		.b_data			(p2_result),
		.op				(sub),
		.result			(p3mp2_result),
		.flags			(p3mp2_flags)
	);
	
	fp64_fpu p32mp1(
		.a_data			(p3mp2_result),
		.b_data			(p1_result),
		.op				(sub),
		.result			(p32mp1_result),
		.flags			(p32mp1_flags)
	);
	
	initial begin
		add = OP_ADD;
		sub = OP_SUB;
		mul = OP_MUL;
	end
	
	always @(*) begin
		outr_mux = p1mp2_result;
		outi_mux = p32mp1_result;
	end
endmodule