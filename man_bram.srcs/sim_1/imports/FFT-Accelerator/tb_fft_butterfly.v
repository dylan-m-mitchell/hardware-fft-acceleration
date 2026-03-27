`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////
// Testbench: tb_fft_butterfly
// Description: Verifies the fft_butterfly module
//
//////////////////////////////////////////////////////////////////////////////

module tb_fft_butterfly;
	reg clk;
	reg rst;
	reg [63:0] ai_data;
	reg [63:0] ar_data;
	reg [63:0] bi_data;
	reg [63:0] br_data;
	reg [63:0] wi_data;
	reg [63:0] wr_data;
	reg input_valid;
	reg output_ready;
	wire [63:0] xi_data;
	wire [63:0] xr_data;
	wire [63:0] yi_data;
	wire [63:0] yr_data;
	wire input_ready;
	wire output_valid;
	
	// Initialize clock
	initial clk = 0;
    always #5 clk = ~clk;
	
	// Module for test
	fft_butterfly uut(
		.clk		    (clk),
		.rst			(rst),
		.a_real			(ar_data),
		.a_imag			(ai_data),
		.b_real			(br_data),
		.b_imag			(bi_data),
		.w_real			(wr_data),
		.w_imag			(wi_data),
		.input_valid	(input_valid),
		.output_ready	(output_ready),
		.x_imag			(xi_data),
		.x_real			(xr_data),
		.y_imag			(yi_data),
		.y_real			(yr_data),
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
        input [63:0] xr_expected, xi_expected, yr_expected, yi_expected;
        input [319:0] test_name;
        begin
			time_taken = end_time - start_time;
			total_time = total_time + time_taken;
			test_count = test_count + 1;
            #10;
            if (xr_expected === xr_data && xi_expected === xi_data && yr_expected === yr_data && yi_expected === yi_data) begin
                $display("[PASS] %0s | ar=%f ai=%f br=%f bi=%f ===> xr=%f xi=%f yr=%f yi=%f | time taken = %d ns",
                         test_name, $bitstoreal(ar_data), $bitstoreal(ai_data), $bitstoreal(br_data), $bitstoreal(bi_data), $bitstoreal(xr_data), $bitstoreal(xi_data), $bitstoreal(yr_data), $bitstoreal(yi_data), time_taken);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] %0s | ar=%f ai=%f br=%f bi=%f ===> xr=%f xi=%f yr=%f yi=%f (expected: xr=%f xi=%f yr=%f yi=%f) | time taken = %d ns",
                         test_name, $bitstoreal(ar_data), $bitstoreal(ai_data), $bitstoreal(br_data), $bitstoreal(bi_data), $bitstoreal(xr_data), $bitstoreal(xi_data), $bitstoreal(yr_data), $bitstoreal(yi_data), $bitstoreal(xr_expected), $bitstoreal(xi_expected), $bitstoreal(yr_expected), $bitstoreal(yi_expected), time_taken);
                fail_count = fail_count + 1;
            end
        end
    endtask
	
	/*
	            end else begin
				
				$display("[FAIL] %0s | ar=%h ai=%h br=%h bi=%h ===> xr=%h xi=%h yr=%h yi=%h (expected: xr=%h xi=%h yr=%h yi=%h) | time taken = %d ns",
                         test_name, ar_data, ai_data, br_data, bi_data, xr_data, xi_data, yr_data, yi_data, xr_expected, xi_expected, yr_expected, yi_expected, time_taken);
                fail_count = fail_count + 1;
	*/
	
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
        $display("              FFT Butterfly Testbench");
        $display("==========================================================");
		
		// Test 1 (1 + 0i) and (2 + 0i)
		@(posedge clk);
		start_time = $time;
        ar_data = ONE;
		ai_data = POS_ZERO;
		br_data = TWO;
		bi_data = POS_ZERO;
		wr_data = ONE;
		wi_data = POS_ZERO;
		
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
		input_valid = 0;
		output_ready = 0;
		check(THREE, POS_ZERO, NEG_ONE, POS_ZERO, "Test 1: (1 + 0i) and (2 + 0i)");
		
		// Test 2 (0 + 1i) and (0 + 2i)
		@(posedge clk);
		start_time = $time;
        ar_data = POS_ZERO;
		ai_data = ONE;
		br_data = POS_ZERO;
		bi_data = TWO;
		
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
	    input_valid = 0;
		output_ready = 0;
		check(POS_ZERO, THREE, POS_ZERO, NEG_ONE, "Test 2: (0 + 1i) and (0 + 2i)");
		
		// Test 3 (1.5 + 1i) and (20 + 2i) ==> (21.5 + 3i) and (-18.5 - 1i)
		@(posedge clk);
		start_time = $time;
        ar_data = ONE_HALF;
		ai_data = ONE;
		br_data = TWENTY;
		bi_data = TWO;
		
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
	    input_valid = 0;
		output_ready = 0;
		check(64'h4035800000000000, THREE, 64'hC032800000000000, NEG_ONE, "Test 3: (1.5 + 1i) and (20 + 2i)");
		
		// Test 4 (3.33 - 1.4i) and (1.2345 + 888i) ==> (4.564500 + 886.600000i) and (2.095500 - 889.400000i)
		@(posedge clk);
		start_time = $time;
        ar_data = 64'h400AA3D70A3D70A4;
		ai_data = 64'hBFF6666666666666;
		br_data = 64'h3FF3C083126E978D;
		bi_data = 64'h408BC00000000000;
		
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
	    input_valid = 0;
		output_ready = 0;
		check(64'h4012420C49BA5E35, 64'h408BB4CCCCCCCCCD, 64'h4000C395810624DE, 64'hC08BCB3333333333, "Test 4: (3.33 - 1.4i) and (1.2345 + 888i)");
		
		// Test 5 (5E-324 - 1i) and (1 + 0i) ==> (1 - 1i) and (-1 - 1i)
		@(posedge clk);
		start_time = $time;
        ar_data = 64'h0000000000000001;
		ai_data = NEG_ONE;
		br_data = ONE;
		bi_data = POS_ZERO;
		
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
	    input_valid = 0;
		output_ready = 0;
		check(ONE, NEG_ONE, NEG_ONE, NEG_ONE, "Test 5: (5E-324 - 1i) and (1 + 0i)");
		
		// Test 6 (1 - 1i) and (5E-324 + 0i) ==> (1 - 1i) and (1 - 1i)
		@(posedge clk);
		start_time = $time;
        ar_data = ONE;
		ai_data = NEG_ONE;
		br_data = 64'h0000000000000001;
		bi_data = POS_ZERO;
		
		input_valid = 1;
		output_ready = 1;
		
		@(posedge output_valid)
		end_time = $time;
		
		@(posedge clk)
	    input_valid = 0;
		output_ready = 0;
		check(ONE, NEG_ONE, ONE, NEG_ONE, "Test 6: (1 - 1i) and (5E-324 + 0i)");
		
        // Summary
        $display("==========================================================");
        $display("  Results: %0d PASSED, %0d FAILED out of %0d tests",
                 pass_count, fail_count, pass_count + fail_count);
		$display("  Total Time Taken: %d ns, Average Time Taken: %d ns",
				 total_time, total_time / test_count);
        $display("==========================================================");

        $finish;
	end
endmodule