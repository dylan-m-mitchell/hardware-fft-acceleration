// Fixed version of hp_class
// Original source: https://www.youtube.com/playlist?list=PLlO9sSrh8HrwcDHAtwec1ycV-m50nfUVs
// Fixes applied:
//   1. Missing semicolon after module port list
//   2. Output port names matched to actual signal names
//   3. fSig zero-extended to full [NSIG:0] width in default case

module hp_class(f, fExp, fSig, qnan, infinity, zero, subnormal, normal);
	localparam NEXP = 11;
	localparam NSIG = 52;
	localparam BIAS = ((1 << (NEXP - 1)) - 1);
	localparam EMAX = BIAS;
	localparam EMIN = (1 - EMAX);
	localparam CLOG2_NSIG = $clog2(NSIG + 1);
	
	input wire [NEXP+NSIG:0] f;
	output reg signed [NEXP+1:0] fExp;
	output reg [NSIG:0] fSig;
	output qnan, infinity, zero, subnormal, normal;
	
	wire expOnes, expZeroes, sigZeroes;
	
	// sets expOnes to 1 if all exponents are one
	assign expOnes = &f[NEXP+NSIG-1:NSIG];
	
	// sets expZeroes to 1 if all exponents are 0
	assign expZeroes = ~|f[NEXP+NSIG-1:NSIG];
	
	// sets sigZeroes to 1 if all significands are 0
	assign sigZeroes = ~|f[NSIG-1:0];
	
	// sets qnan to 1 if it is a quiet nan (exponents all 1 and at least bit 51 is 1)
	assign qnan = expOnes & f[NSIG-1];
	
	// sets infinity to 1 if it is infinity (exponents all 1 and sigs all 0)
	assign infinity = expOnes & sigZeroes;
	
	// sets zero to 1 if it is zero value (exponents all 0 and sigs all 0)
	assign zero = expZeroes & sigZeroes;
	
	// sets subnormal to 1 if it is subnormal value (exponents all 0 and sig has at least one 1)
	assign subnormal = expZeroes & ~sigZeroes;
	
	// sets normal to 1 if exponents are not all 0's and not all 1's
	assign normal = ~expOnes & ~expZeroes;
	
	reg [NSIG:0] mask = ~0;
	reg [CLOG2_NSIG-1:0] sa;
	
	integer i;
	always @(*)
		begin
			// Default: use raw exponent, zero-extend significand to [NSIG:0]
			fExp = f[NEXP+NSIG-1:NSIG];
			fSig = f[NSIG:0];
			
			sa = 0;
			
			if(normal)
				{fExp, fSig} = {f[NEXP+NSIG-1:NSIG] - BIAS, 1'b1, f[NSIG-1:0]};
			else if (subnormal)
				begin
				// Shift the most significant bit into the position
				// of the Normal's implied 1. Keep track of how many
				// places were needed to shift the most significant
				// set bit so we can adjust the exponent when we're
				// done.
					for(i = (1 << (CLOG2_NSIG - 1)); i > 0; i = i >> 1)
						begin
							if ((fSig & (mask << (NSIG + 1 - i))) == 0)
								begin
									fSig = fSig << i;
									sa = sa | i;
								end
						end
					fExp = EMIN - sa;
				end
		end
	
endmodule
