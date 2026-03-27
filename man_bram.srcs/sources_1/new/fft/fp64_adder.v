//////////////////////////////////////////////////////////////////////////////
// Module: fp64_adder
// Description: IEEE 754 Double-Precision (64-bit) Floating Point Adder
//              Supports normal, denormal, zero, infinity, and NaN operands.
//              Combinational design (single-cycle, no pipeline).
//
// Port List:
//   input  [63:0] a       - Operand A (IEEE 754 double)
//   input  [63:0] b       - Operand B (IEEE 754 double)
//   output [63:0] result  - Sum (IEEE 754 double) — wire output
//
// IEEE 754 Double Format:
//   [63]    Sign (1 bit)
//   [62:52] Exponent (11 bits, bias = 1023)
//   [51:0]  Mantissa/Fraction (52 bits, implicit leading 1 for normals)
//////////////////////////////////////////////////////////////////////////////

module fp64_adder (
    input  wire [63:0] a_data,
    input  wire [63:0] b_data,
    output wire [63:0] result
);
    // -----------------------------------------------------------------------
    // Data
    // -----------------------------------------------------------------------
    reg [63:0] a, b;
    
    always @(*) begin
        a = a_data;
        b = b_data;
    end
    
    
    // -----------------------------------------------------------------------
    // Field extraction
    // -----------------------------------------------------------------------
    wire        sign_a    = a[63];
    wire [10:0] exp_a     = a[62:52];
    wire [51:0] frac_a    = a[51:0];

    wire        sign_b    = b[63];
    wire [10:0] exp_b     = b[62:52];
    wire [51:0] frac_b    = b[51:0];

    // -----------------------------------------------------------------------
    // Special-value detection
    // -----------------------------------------------------------------------
    wire a_is_zero   = (exp_a == 11'h000) && (frac_a == 52'b0);
    wire b_is_zero   = (exp_b == 11'h000) && (frac_b == 52'b0);
    wire a_is_denorm = (exp_a == 11'h000) && (frac_a != 52'b0);
    wire b_is_denorm = (exp_b == 11'h000) && (frac_b != 52'b0);
    wire a_is_inf    = (exp_a == 11'h7FF) && (frac_a == 52'b0);
    wire b_is_inf    = (exp_b == 11'h7FF) && (frac_b == 52'b0);
    wire a_is_nan    = (exp_a == 11'h7FF) && (frac_a != 52'b0);
    wire b_is_nan    = (exp_b == 11'h7FF) && (frac_b != 52'b0);

    // -----------------------------------------------------------------------
    // Build full mantissas with implicit bit and 3 guard bits (GRS)
    // Format: {implicit_bit, 52-bit fraction, 3 guard bits} = 56 bits
    // -----------------------------------------------------------------------
    wire [55:0] mant_a_full = a_is_denorm ? {1'b0, frac_a, 3'b000} :
                              (a_is_zero  ? 56'b0 : {1'b1, frac_a, 3'b000});

    wire [55:0] mant_b_full = b_is_denorm ? {1'b0, frac_b, 3'b000} :
                              (b_is_zero  ? 56'b0 : {1'b1, frac_b, 3'b000});

    // Effective exponents (denormals have exponent = 1, not 0)
    wire [10:0] eff_exp_a = a_is_denorm ? 11'h001 : exp_a;
    wire [10:0] eff_exp_b = b_is_denorm ? 11'h001 : exp_b;

    // -----------------------------------------------------------------------
    // Exponent difference & alignment
    // -----------------------------------------------------------------------
    reg  [10:0] exp_diff;
    reg  [10:0] exp_large;
    reg  [55:0] mant_large, mant_small;
    reg         sign_large, sign_small;
    reg  [55:0] mant_small_shifted;
    reg         sticky_bit;

    integer i;

    always @(*) begin
        if (eff_exp_a >= eff_exp_b) begin
            exp_diff   = eff_exp_a - eff_exp_b;
            exp_large  = eff_exp_a;
            mant_large = mant_a_full;
            mant_small = mant_b_full;
            sign_large = sign_a;
            sign_small = sign_b;
        end else begin
            exp_diff   = eff_exp_b - eff_exp_a;
            exp_large  = eff_exp_b;
            mant_large = mant_b_full;
            mant_small = mant_a_full;
            sign_large = sign_b;
            sign_small = sign_a;
        end

        // Compute sticky bit (OR of all bits shifted out)
        sticky_bit = 1'b0;
        for (i = 0; i < 56; i = i + 1) begin
            if (i < exp_diff)
                sticky_bit = sticky_bit | mant_small[i];
        end

        // Right-shift the smaller mantissa to align
        if (exp_diff >= 56)
            mant_small_shifted = 56'b0;
        else
            mant_small_shifted = mant_small >> exp_diff;

        // Preserve sticky bit in the LSB
        mant_small_shifted[0] = mant_small_shifted[0] | sticky_bit;
    end

    // -----------------------------------------------------------------------
    // Mantissa addition / subtraction
    // -----------------------------------------------------------------------
    reg [56:0] mant_sum; // 57 bits to handle carry-out
    reg        result_sign;
    reg        effective_sub;

    always @(*) begin
        effective_sub = sign_large ^ sign_small;

        if (!effective_sub) begin
            // Same signs -> add mantissas
            mant_sum    = {1'b0, mant_large} + {1'b0, mant_small_shifted};
            result_sign = sign_large;
        end else begin
            // Different signs -> subtract mantissas
            if (mant_large >= mant_small_shifted) begin
                mant_sum    = {1'b0, mant_large} - {1'b0, mant_small_shifted};
                result_sign = sign_large;
            end else begin
                mant_sum    = {1'b0, mant_small_shifted} - {1'b0, mant_large};
                result_sign = sign_small;
            end
        end
    end

    // -----------------------------------------------------------------------
    // Normalization (leading-zero count + shift)
    // -----------------------------------------------------------------------
    reg [5:0]  lzc;  // Leading zero count (max 56)
    reg [56:0] mant_norm;
    reg [11:0] exp_norm; // 12 bits to detect underflow/overflow

    always @(*) begin
        // Count leading zeros in mant_sum[55:0]
        lzc = 6'd0;
        if (mant_sum[56]) begin
            lzc = 6'd0; // Carry out — need right shift
        end else begin
            // Find position of leading 1
            lzc = 6'd57; // default: all zeros
            for (i = 55; i >= 0; i = i - 1) begin
                if (mant_sum[i] && (lzc == 6'd57))
                    lzc = 55 - i[5:0];
            end
        end

        // Normalize
        if (mant_sum == 57'b0) begin
            // Result is zero
            mant_norm = 57'b0;
            exp_norm  = 12'b0;
        end else if (mant_sum[56]) begin
            // Overflow bit set: shift right by 1, increment exponent
            mant_norm = mant_sum >> 1;
            // Preserve sticky in LSB
            mant_norm[0] = mant_norm[0] | mant_sum[0];
            exp_norm  = {1'b0, exp_large} + 12'd1;
        end else if (lzc == 6'd57) begin
            // Should not happen if mant_sum != 0, but safety
            mant_norm = 57'b0;
            exp_norm  = 12'b0;
        end else if (lzc <= 1) begin
            // Already normalized (leading 1 is at bit 55)
            mant_norm = mant_sum << lzc;
            exp_norm  = {1'b0, exp_large} - {6'b0, lzc};
        end else begin
            // Need left shift by lzc
            // Check for exponent underflow (subnormal result)
            if ({1'b0, exp_large} > {6'b0, lzc}) begin
                mant_norm = mant_sum << lzc;
                exp_norm  = {1'b0, exp_large} - {6'b0, lzc};
            end else begin
                // Shift as much as exponent allows -> denormal
                if (exp_large == 11'b0) begin
                    mant_norm = mant_sum;
                    exp_norm  = 12'b0;
                end else begin
                    mant_norm = mant_sum << (exp_large - 11'd1);
                    exp_norm  = 12'b0;
                end
            end
        end
    end

    // -----------------------------------------------------------------------
    // Rounding (Round to Nearest, ties to Even — IEEE default)
    // -----------------------------------------------------------------------
    reg [51:0] frac_out;
    reg [11:0] exp_rounded;
    reg        round_up;

    always @(*) begin
        round_up = 1'b0;

        // Guard, Round, Sticky
        case ({mant_norm[2], mant_norm[1], mant_norm[0]})
            3'b000: round_up = 1'b0;
            3'b001: round_up = 1'b0;
            3'b010: round_up = 1'b0;
            3'b011: round_up = 1'b0;
            3'b100: round_up = mant_norm[3]; // Tie: round to even
            3'b101: round_up = 1'b1;
            3'b110: round_up = 1'b1;
            3'b111: round_up = 1'b1;
        endcase

        if (round_up) begin
            {exp_rounded, frac_out} = {exp_norm, mant_norm[54:3]} + 1;
        end else begin
            frac_out    = mant_norm[54:3];
            exp_rounded = exp_norm;
        end
    end

    // -----------------------------------------------------------------------
    // Final result assembly with special-case handling
    // Internal reg computed combinationally, drives the wire output
    // -----------------------------------------------------------------------
    reg [63:0] result_internal;

    assign result = result_internal;
    
    always @(*) begin
        result_internal = 64'b0;
        // --- NaN propagation ---
        if (a_is_nan || b_is_nan) begin
            result_internal = {1'b0, 11'h7FF, 1'b1, 51'b0};
        end
        // --- Infinity handling ---
        else if (a_is_inf && b_is_inf) begin
            if (sign_a == sign_b)
                begin
                    result_internal = {sign_a, 11'h7FF, 52'b0};
               end
            else
                begin
                    result_internal = {1'b0, 11'h7FF, 1'b1, 51'b0};
                end
        end
        else if (a_is_inf) begin
            result_internal = a;
        end
        else if (b_is_inf) begin
            result_internal = b;
        end
        // --- Zero handling ---
        else if (a_is_zero && b_is_zero) begin
            result_internal = {sign_a & sign_b, 11'b0, 52'b0};
        end
        else if (a_is_zero) begin
            result_internal = b;
        end
        else if (b_is_zero) begin
            result_internal = a;
        end
        // --- Overflow to infinity ---
        else if (exp_rounded >= 12'h7FF) begin
            result_internal = {result_sign, 11'h7FF, 52'b0};
        end
        // --- Normal / Denormal result ---
        else if (mant_sum == 57'b0) begin
            result_internal = 64'b0;
        end
        else begin
            result_internal = {result_sign, exp_rounded[10:0], frac_out};
        end
    end

endmodule
