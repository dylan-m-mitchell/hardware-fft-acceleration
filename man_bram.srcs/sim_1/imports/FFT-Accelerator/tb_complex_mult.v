`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////
// Testbench: tb_complex_mult
// Description: Verifies the complex_mult module
//
//////////////////////////////////////////////////////////////////////////////

module tb_complex_mult;
	reg clk;
	reg rst;
	reg [63:0] a_data;
	reg [63:0] b_data;
	reg [63:0] c_data;
	reg [63:0] d_data;
	reg input_valid;
	reg output_ready;
	wire [63:0] outi_data;
	wire [63:0] outr_data;
	wire input_ready;
	wire output_valid;
	
	// Initialize clock
	initial clk = 0;
    always #5 clk = ~clk;
	
	// Instantiate Complex Multiplier
	complex_mult uut(
		.clk		    (clk),
		.rst			(rst),
		.a_data			(a_data),
		.b_data			(b_data),
		.c_data			(c_data),
		.d_data			(d_data),
		.input_valid	(input_valid),
		.output_ready	(output_ready),
		.outi_data		(outi_data),
		.outr_data		(outr_data),
		.input_ready	(input_ready),
		.output_valid	(output_valid)
	);
	
	// -------------------------------------------------------------------
    // IEEE 754 double constants
    // -------------------------------------------------------------------
    localparam [63:0] POS_ZERO  = 64'h0000_0000_0000_0000;
    localparam [63:0] NEG_ZERO  = 64'h8000_0000_0000_0000;
    localparam [63:0] ONE       = 64'h3FF0_0000_0000_0000; // 1.0
    localparam [63:0] TWO       = 64'h4000_0000_0000_0000; // 2.0
    localparam [63:0] THREE     = 64'h4008_0000_0000_0000; // 3.0
    localparam [63:0] FOUR      = 64'h4010_0000_0000_0000; // 4.0
    localparam [63:0] HALF      = 64'h3FE0_0000_0000_0000; // 0.5
    localparam [63:0] ONE_HALF  = 64'h3FF8_0000_0000_0000; // 1.5
    localparam [63:0] NEG_ONE   = 64'hBFF0_0000_0000_0000; // -1.0
    localparam [63:0] NEG_TWO   = 64'hC000_0000_0000_0000; // -2.0
    localparam [63:0] TEN       = 64'h4024_0000_0000_0000; // 10.0
    localparam [63:0] FIVE      = 64'h4014_0000_0000_0000; // 5.0
    localparam [63:0] SIX       = 64'h4018_0000_0000_0000; // 6.0
    localparam [63:0] EIGHT     = 64'h4020_0000_0000_0000; // 8.0
    localparam [63:0] TWENTY    = 64'h4034_0000_0000_0000; // 20.0
    localparam [63:0] POS_INF   = 64'h7FF0_0000_0000_0000;
    localparam [63:0] NEG_INF   = 64'hFFF0_0000_0000_0000;
    localparam [63:0] QNAN      = 64'h7FF8_0000_0000_0000;
	
	// -------------------------------------------------------------------
    // Timekeeping, pass/fail, and test count variables
    // -------------------------------------------------------------------
	integer start_time, end_time, time_taken, total_time;
	integer pass_count, fail_count;
	integer test_count;
	
	// -------------------------------------------------------------------
    // Check task
    // -------------------------------------------------------------------
    task check;
        input [63:0] real_expected, imag_expected;
        input [255:0] test_name;
        begin
			time_taken = end_time - start_time;
			total_time = total_time + time_taken;
			test_count = test_count + 1;
            #10;
            if (outr_data === real_expected && outi_data === imag_expected) begin
                $display("[PASS] Test%d: %0s | a=%f b=%f c=%f d=%f ===> real:%f imag:%f | time taken=%d ns",
                         test_count, test_name, $bitstoreal(a_data), $bitstoreal(b_data), $bitstoreal(c_data), $bitstoreal(d_data), $bitstoreal(outr_data), $bitstoreal(outi_data), time_taken);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] Test%d: %0s | a=%f b=%f c=%f d=%f ===> real:%f imag:%f (expected real:%f imag:%f)| time taken=%d ns",
                         test_count, test_name, $bitstoreal(a_data), $bitstoreal(b_data), $bitstoreal(c_data), $bitstoreal(d_data), $bitstoreal(outr_data), $bitstoreal(outi_data), $bitstoreal(real_expected), $bitstoreal(imag_expected), time_taken);
                fail_count = fail_count + 1;
            end
        end
    endtask
	
	
	
	initial 
	begin
		rst = 1;
		pass_count = 0;
		fail_count = 0;
		start_time = 0;
		end_time = 0;
		total_time = 0;
		test_count = 0;
		#20
		rst = 0;
		#20
		
		$display("==========================================================");
        $display("              Complex Multiplier Testbench");
        $display("==========================================================");
		
		// Test (1+2i)(1+0i) = 1 + 2i
		@(posedge clk);
		start_time = $time;
        a_data = ONE; b_data = TWO; c_data = ONE; d_data = POS_ZERO;
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
		input_valid = 0;
		output_ready = 0;
		check(ONE, TWO, "(1+2i)(1+0i)");
		
		// Test (-1+2i)(0-1i) = 2 + 1i
		@(posedge clk);
		start_time = $time;
        a_data = NEG_ONE; b_data = TWO; c_data = POS_ZERO; d_data = NEG_ONE;
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
		input_valid = 0;
		output_ready = 0;
		check(TWO, ONE, "(-1+2i)(0-1i)");
		
		// Test (3.33-1.4i)(1.2345+888i) = 1247.3108849999999 + 2955.3116999999997i
		@(posedge clk);
		start_time = $time;
        a_data = 64'h400AA3D70A3D70A4; b_data = 64'hBFF6666666666666; c_data =64'h3FF3C083126E978D; d_data = 64'h408BC00000000000;
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
		input_valid = 0;
		output_ready = 0;
		check(64'h40937D3E58A32F44, 64'h40A7169F97247453, "(3.33-1.4i)(1.2345+888i)");
		
		$display("==========================================================");
		$display("           Equivalents of BxW in FFT Testbench");
		$display("==========================================================");
		// Test (2+0i)(1+0i) = 2 + 0i, complex mult part of Test 1 in tb_fft_butterfly
		@(posedge clk);
		start_time = $time;
        a_data = TWO; b_data = POS_ZERO; c_data = ONE; d_data = POS_ZERO;
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
		input_valid = 0;
		output_ready = 0;
		check(TWO, POS_ZERO, "(2+0i)(1+0i)");
		
		// Test (0+2i)(1+0i) = 0 + 2i, complex mult part of Test 2 in tb_fft_butterfly
		@(posedge clk);
		start_time = $time;
        a_data = POS_ZERO; b_data = TWO; c_data = ONE; d_data = POS_ZERO;
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
		input_valid = 0;
		output_ready = 0;
		check(POS_ZERO, TWO, "(0+2i)(1+0i)");
		
		// Test (20+2i)(1+0i) = 20 + 2i, complex mult part of Test 3 in tb_fft_butterfly
		@(posedge clk);
		start_time = $time;
        a_data = TWENTY; b_data = TWO; c_data = ONE; d_data = POS_ZERO;
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
		input_valid = 0;
		output_ready = 0;
		check(TWENTY, TWO, "(0+2i)(1+0i)");
		
		#10;
	    $display("==========================================================");
        $display("  Results: %0d PASSED, %0d FAILED out of %0d tests",
                 pass_count, fail_count, pass_count + fail_count);
		$display("  Total Time Taken: %d ns, Average Time Taken: %d ns",
				 total_time, total_time / test_count);
        $display("==========================================================");

        $finish;
	end
endmodule