//////////////////////////////////////////////////////////////////////////////
// Module: fp64_fpu
// Description: IEEE 754 Double-Precision (64-bit) Floating Point Unit
//              Supports ADD, SUB, and MUL operations.
//              Purely combinational design.
//
// Port List:
//   input  [63:0]  a        - Operand A (IEEE 754 double)
//   input  [63:0]  b        - Operand B (IEEE 754 double)
//   input  [1:0]   op       - Operation select:
//                                2'b00 = ADD
//                                2'b01 = SUB
//                                2'b10 = MUL
//
//   output [63:0]  result   - Result (IEEE 754 double)
//   output [4:0]   flags    - Status flags:
//
//                                [3] = invalid   (NaN result from invalid op)
//                                [2] = overflow  (result overflowed to inf)
//                                [1] = underflow (result is denormal or flushed to zero)
//                                [0] = inexact   (result was rounded)
//////////////////////////////////////////////////////////////////////////////

module fp64_fpu (
    input  wire [63:0] a_data,
    input  wire [63:0] b_data,
    input  wire [1:0]  op,
    output wire [63:0] result,
    output wire [4:0]  flags
);

    // -----------------------------------------------------------------------
    // Operation encoding
    // -----------------------------------------------------------------------
    localparam OP_ADD = 2'b00;
    localparam OP_SUB = 2'b01;
    localparam OP_MUL = 2'b10;

    // -----------------------------------------------------------------------
    // Internal wires for sub-unit results
    // -----------------------------------------------------------------------
    wire [63:0] add_result;
    wire [63:0] mul_result;

    // Multiplier status flags
    wire mul_qnan, mul_infinity, mul_zero, mul_subnormal, mul_normal;

    // -----------------------------------------------------------------------
    // SUB is ADD with b's sign flipped
    // -----------------------------------------------------------------------
    wire [63:0] adder_b = (op == OP_SUB) ? {~b_data[63], b_data[62:0]} : b_data;
    
    // -----------------------------------------------------------------------
    // Adder instance (handles both ADD and SUB)
    // -----------------------------------------------------------------------
    fp64_adder u_adder (
        .a_data (a_data),
        .b_data (adder_b),
        .result (add_result)
    );

    // -----------------------------------------------------------------------
    // Multiplier instance
    // -----------------------------------------------------------------------
    hp_mul u_mul (
        .a         (a_data),
        .b         (b_data),
        .p         (mul_result),
        .qnan      (mul_qnan),
        .infinity  (mul_infinity),
        .zero      (mul_zero),
        .subnormal (mul_subnormal),
        .normal    (mul_normal),
        .done      (mul_done)
    );

    // -----------------------------------------------------------------------
    // Result MUX
    // -----------------------------------------------------------------------
    reg [63:0] result_mux;
    assign result = result_mux;
	
	always @(*) begin
	// Get result to result mux.
        case (op)
            OP_ADD:  result_mux = add_result;
            OP_SUB:  result_mux = add_result;
            OP_MUL:  result_mux = mul_result;
            default: result_mux = 64'h7FF8_0000_0000_0000; // QNaN
        endcase
    end
	

    // -----------------------------------------------------------------------
    // Flag generation
    // -----------------------------------------------------------------------
    // Extract fields from result for flag detection
    wire [10:0] res_exp  = result_mux[62:52];
    wire [51:0] res_frac = result_mux[51:0];

    wire res_is_nan   = (res_exp == 11'h7FF) && (res_frac != 52'b0);
    wire res_is_inf   = (res_exp == 11'h7FF) && (res_frac == 52'b0);
    wire res_is_denorm = (res_exp == 11'h000) && (res_frac != 52'b0);
    wire res_is_zero  = (res_exp == 11'h000) && (res_frac == 52'b0);

    // Input classification for flag logic
    wire [10:0] a_exp = a_data[62:52];
    wire [51:0] a_frac = a_data[51:0];
    wire [10:0] b_exp = b_data[62:52];
    wire [51:0] b_frac = b_data[51:0];

    wire a_is_nan  = (a_exp == 11'h7FF) && (a_frac != 52'b0);
    wire b_is_nan  = (b_exp == 11'h7FF) && (b_frac != 52'b0);
    wire a_is_inf  = (a_exp == 11'h7FF) && (a_frac == 52'b0);
    wire b_is_inf  = (b_exp == 11'h7FF) && (b_frac == 52'b0);
    wire a_is_zero = (a_exp == 11'h000) && (a_frac == 52'b0);
    wire b_is_zero = (b_exp == 11'h000) && (b_frac == 52'b0);

    reg flag_invalid, flag_overflow, flag_underflow, flag_inexact;

    always @(*) begin
        flag_invalid   = 1'b0;
        flag_overflow  = 1'b0;
        flag_underflow = 1'b0;
        flag_inexact   = 1'b0;

        // ------ Invalid operation ------
        // NaN input always signals invalid (unless input was already QNaN)
        if (a_is_nan || b_is_nan) begin
            flag_invalid = 1'b1;
        end
        // inf - inf or inf + (-inf)
        else if ((op == OP_ADD || op == OP_SUB) && a_is_inf && res_is_nan) begin
            flag_invalid = 1'b1;
        end
        // inf * 0 or 0 * inf
        else if (op == OP_MUL && ((a_is_inf && b_is_zero) || (a_is_zero && b_is_inf))) begin
            flag_invalid = 1'b1;
        end

        // ------ Overflow ------
        // Result is infinity but neither input was infinity (and not invalid)
        if (res_is_inf && !a_is_inf && !b_is_inf && !flag_invalid) begin
            flag_overflow = 1'b1;
            flag_inexact  = 1'b1; // Overflow implies inexact
        end

        // ------ Underflow ------
        // Result is denormal or flushed to zero from non-zero inputs
        if (res_is_denorm) begin
            flag_underflow = 1'b1;
        end
        if (res_is_zero && !a_is_zero && !b_is_zero && !flag_invalid) begin
            // Only flag underflow if both inputs were non-zero finite
            if (!a_is_inf && !b_is_inf) begin
                // For MUL: two subnormals multiply to zero
                if (op == OP_MUL)
                    flag_underflow = 1'b1;
            end
        end

        // ------ Inexact (simplified) ------
        // A precise inexact flag requires tracking rounding through each unit.
        // This approximation flags when result is denormal (likely rounded)
        // or when overflow occurred.
        if (res_is_denorm && !flag_invalid)
            flag_inexact = 1'b1;
    end

    assign flags = {flag_invalid, flag_overflow, flag_underflow, flag_inexact};
	
endmodule
