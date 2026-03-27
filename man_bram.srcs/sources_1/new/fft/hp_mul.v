// built using instruction from https://www.youtube.com/playlist?list=PLlO9sSrh8HrwcDHAtwec1ycV-m50nfUVs
module hp_mul(a, b, p, qnan, infinity, zero, subnormal, normal, done);
	localparam NEXP = 11;
	localparam NSIG = 52;
	localparam BIAS = ((1 << (NEXP - 1)) - 1);
	localparam EMAX = BIAS;
	localparam EMIN = (1 - EMAX);
	localparam CLOG2_NSIG = $clog2(NSIG + 1);
	localparam [63:0] QNAN = 64'h7FF8_0000_0000_0000;
	
	input [NEXP+NSIG:0] a, b;
	output [NEXP+NSIG:0] p;
	output qnan,infinity, zero, subnormal, normal, done;
	reg qnan, infinity, zero, subnormal, normal;
	
	// flags for inputs a and b
	wire aQnan, aInfinity, aZero, aSubnormal, aNormal;
	wire bQnan, bInfinity, bZero, bSubnormal, bNormal;
	
	// wires and registers for a and b's actual exponents
	wire signed [NEXP+1:0] aExp, bExp;
	
	// registers to hold intermediary exponents
	reg signed [NEXP+1:0] pExp, t1Exp, t2Exp;
	
	// wires and registers for significands
	wire [NSIG:0] aSig, bSig;
	reg [NSIG:0] pSig, tSig;
	
	// register for pTmp and done
	reg [NEXP+NSIG:0] pTmp;	
	reg done_reg;
	assign done = done_reg;
	
	// register for raw significand 
	wire [2*NSIG+1:0] rawSignificand;
	
	reg pSign;
	
	// instances of hp_class for a and b with input and flags
	hp_class aClass(a, aExp, aSig, aQnan, aInfinity, aZero, aSubnormal, aNormal);
	hp_class bClass(b, bExp, bSig, bQnan, bInfinity, bZero, bSubnormal, bNormal);
	
	assign rawSignificand = aSig * bSig;
	
	// always is a wildcard so if any input value changes, the always block recomputes all values in the block
	always @(*)
	begin
	     done_reg = 0;
		// IEE 754-2019, section 6.3 requires that "when neither the inputs nor result are NaN, the sign
		// of a product ... is the exclusive OR of the operands' signs."
		pSign = a[NEXP+NSIG] ^ b[NEXP+NSIG];
		// Initialize pTmp to be a QNaN bit vector
		pTmp = QNAN;
		// Initialize all the 1-bit output flags to 0
		{qnan, infinity, zero, subnormal, normal} = 6'b000000;
		
		// Tests if either are qnans
        if ((aQnan | bQnan) == 1'b1)
			begin 
				pTmp = QNAN;
				qnan = 1;
			end
		// Tests if either are infinity
		// Infinity x infinity, subnormal, or normal = infinity
		// Infinity x zero becomes quiet NaN
		else if ((aInfinity | bInfinity) == 1'b1)
			begin
				if((aZero | bZero) == 1'b1)
					begin 
						pTmp = QNAN;
						qnan = 1;
					end
				else 
					begin 
						pTmp = {pSign, {NEXP{1'b1}}, {NSIG{1'b0}}};
						infinity = 1;
					end 
			end
		// Tests if either are zero
		// Two subnormal numbers multiplied will be too small to represent and therefore also zero
		else if ((aZero | bZero) == 1'b1 || (aSubnormal & bSubnormal) == 1'b1)
			begin 
				pTmp = {pSign, {NEXP+NSIG{1'b0}}};
				zero = 1;
			end
		// At least one operand is normal. Other may be normal or subnormal
		else 
			begin
				t1Exp = aExp + bExp;
				
				if(rawSignificand[2*NSIG+1] == 1'b1)
					begin 
						tSig = rawSignificand[2*NSIG+1:NSIG+1];
						t2Exp = t1Exp + 1;
					end 
				else 
					begin 
						tSig = rawSignificand[2*NSIG:NSIG];
						t2Exp = t1Exp;
					end
				
				// Too small to be rep'd as a subnormal, round to 0
				if(t2Exp < (EMIN - NSIG))
					begin
						pTmp = {pSign, {NEXP+NSIG{1'b0}}};
						zero = 1;
					end 
				// subnormal
				else if (t2Exp < EMIN)
					begin
						pSig = tSig >> (EMIN - t2Exp);
						// we can only store NSIG bits
						pTmp = {pSign, {NEXP{1'b0}}, pSig[NSIG-1:0]};
						subnormal = 1;
					end
				// infinity
				else if (t2Exp > EMAX)
					begin
						pTmp = {pSign, {NEXP{1'b1}}, {NSIG{1'b0}}};
						infinity = 1;
					end
				// normal
				else
					begin 
						pExp = t2Exp + BIAS;
						pSig = tSig;
						// For normals we assume the most significant bit is 1 so store only
						// the least significant NSIG bits in the significand
						pTmp = {pSign, pExp[NEXP-1:0], pSig[NSIG-1:0]};
						normal = 1;
						done_reg = 1;
					end
				end
			end
	assign p = pTmp;
endmodule
