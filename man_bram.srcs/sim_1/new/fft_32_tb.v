`timescale 1ns / 1ps

module fft_32_tb;

    localparam integer DEPTH = 32;
    localparam integer TIMEOUT_CYCLES = 2000;
    localparam integer SETTLE_CYCLES = 3;

    // Common fp64 constants.
    localparam [63:0] FP64_ZERO      = 64'h0000_0000_0000_0000;
    localparam [63:0] FP64_ONE       = 64'h3ff0_0000_0000_0000;
    localparam [63:0] FP64_MINUS_ONE = 64'hbff0_0000_0000_0000;
    localparam [63:0] FP64_THIRTYTWO = 64'h4040_0000_0000_0000;

    reg clk = 1'b0;

    integer i;
    integer cycle_counter = 0;
    integer test_count = 0;

    integer start_cycle = 0;
    integer first_change_cycle = 0;
    integer settle_cycle = 0;
    integer latency_first_cycles = 0;
    integer latency_settle_cycles = 0;

    time start_time = 0;
    time first_change_time = 0;
    time settle_time = 0;
    time latency_first_time = 0;
    time latency_settle_time = 0;

    reg [63:0] inr [0:DEPTH-1];
    reg [63:0] ini [0:DEPTH-1];
    reg [63:0] exp_r [0:DEPTH-1];
    reg [63:0] exp_i [0:DEPTH-1];

    wire [63:0] outr [0:DEPTH-1];
    wire [63:0] outi [0:DEPTH-1];

    wire [4095:0] out_bus_r;
    wire [4095:0] out_bus_i;
    wire [8191:0] out_bus;

    // 100 MHz local TB clock for latency accounting around combinational DUT behavior.
    always #5 clk = ~clk;

    always @(posedge clk) begin
        cycle_counter <= cycle_counter + 1;
    end

    // Preserve repo packing convention for complex words used elsewhere in project:
    // [127:64] = imag, [63:0] = real.
    function [127:0] pack_complex;
        input [63:0] real_word;
        input [63:0] imag_word;
        begin
            pack_complex = {imag_word, real_word};
        end
    endfunction

    task automatic fail_now;
        input [1023:0] msg;
        begin
            $display("FAIL: %0s @ t=%0t (cycle=%0d)", msg, $time, cycle_counter);
            $finish;
        end
    endtask

    task automatic clear_inputs;
        begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                inr[i] = FP64_ZERO;
                ini[i] = FP64_ZERO;
            end
        end
    endtask

    task automatic clear_expected;
        begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                exp_r[i] = FP64_ZERO;
                exp_i[i] = FP64_ZERO;
            end
        end
    endtask

    task automatic set_case_impulse_real;
        begin
            clear_inputs();
            clear_expected();

            inr[0] = FP64_ONE;
            for (i = 0; i < DEPTH; i = i + 1) begin
                exp_r[i] = FP64_ONE;
                exp_i[i] = FP64_ZERO;
            end
        end
    endtask

    task automatic set_case_constant_real;
        begin
            clear_inputs();
            clear_expected();

            for (i = 0; i < DEPTH; i = i + 1) begin
                inr[i] = FP64_ONE;
            end

            exp_r[0] = FP64_THIRTYTWO;
            exp_i[0] = FP64_ZERO;
        end
    endtask

    task automatic set_case_impulse_imag;
        begin
            clear_inputs();
            clear_expected();

            ini[0] = FP64_ONE;
            for (i = 0; i < DEPTH; i = i + 1) begin
                exp_r[i] = FP64_ZERO;
                exp_i[i] = FP64_ONE;
            end
        end
    endtask

    task automatic set_case_constant_minus_one_real;
        begin
            clear_inputs();
            clear_expected();

            for (i = 0; i < DEPTH; i = i + 1) begin
                inr[i] = FP64_MINUS_ONE;
            end

            exp_r[0] = 64'hc040_0000_0000_0000; // -32.0
            exp_i[0] = FP64_ZERO;
        end
    endtask

    function automatic outputs_match_expected_now;
        input dummy;
        integer k;
        begin
            outputs_match_expected_now = 1'b1;
            for (k = 0; k < DEPTH; k = k + 1) begin
                if ((outr[k] !== exp_r[k]) || (outi[k] !== exp_i[k])) begin
                    outputs_match_expected_now = 1'b0;
                end
            end
        end
    endfunction

    task automatic wait_for_settle_and_report;
        input [1023:0] case_name;
        integer wait_cycles;
        integer stable_count;
        reg transition_seen;
        reg [8191:0] prev_sample;
        begin
            start_cycle = cycle_counter;
            start_time = $time;
            first_change_cycle = start_cycle;
            first_change_time = start_time;
            settle_cycle = start_cycle;
            settle_time = start_time;
            latency_first_cycles = 0;
            latency_settle_cycles = 0;
            latency_first_time = 0;
            latency_settle_time = 0;

            wait_cycles = 0;
            stable_count = 0;
            transition_seen = 1'b0;
            prev_sample = out_bus;

            while (wait_cycles < TIMEOUT_CYCLES) begin
                @(posedge clk);
                wait_cycles = wait_cycles + 1;

                if (out_bus !== prev_sample) begin
                    prev_sample = out_bus;
                    stable_count = 0;
                    if (!transition_seen) begin
                        transition_seen = 1'b1;
                        first_change_cycle = cycle_counter;
                        first_change_time = $time;
                        latency_first_cycles = cycle_counter - start_cycle;
                        latency_first_time = $time - start_time;
                    end
                end else begin
                    stable_count = stable_count + 1;
                end

                if ((transition_seen && (stable_count >= SETTLE_CYCLES)) ||
                    ((!transition_seen) && (stable_count >= SETTLE_CYCLES) && outputs_match_expected_now(1'b0))) begin
                    settle_cycle = cycle_counter;
                    settle_time = $time;
                    latency_settle_cycles = cycle_counter - start_cycle;
                    latency_settle_time = $time - start_time;
                    if (transition_seen) begin
                        $display("LATENCY[%0s]: first_change=%0d cycles (%0t), settled=%0d cycles (%0t), settle_guard=%0d cycles",
                                 case_name,
                                 latency_first_cycles,
                                 latency_first_time,
                                 latency_settle_cycles,
                                 latency_settle_time,
                                 SETTLE_CYCLES);
                    end else begin
                        $display("LATENCY[%0s]: first_change=0 cycles (0) [no transition observed], settled=%0d cycles (%0t), settle_guard=%0d cycles",
                                 case_name,
                                 latency_settle_cycles,
                                 latency_settle_time,
                                 SETTLE_CYCLES);
                    end
                    disable wait_for_settle_and_report;
                end
            end

            fail_now("Watchdog timeout waiting for output settle");
        end
    endtask

    task automatic check_outputs_exact;
        input [1023:0] case_name;
        reg [127:0] exp_pack;
        reg [127:0] got_pack;
        begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                if ((outr[i] !== exp_r[i]) || (outi[i] !== exp_i[i])) begin
                    exp_pack = pack_complex(exp_r[i], exp_i[i]);
                    got_pack = pack_complex(outr[i], outi[i]);
                    $display("MISMATCH[%0s] bin=%0d", case_name, i);
                    $display("  expected real=0x%016h imag=0x%016h packed=0x%032h", exp_r[i], exp_i[i], exp_pack);
                    $display("  observed real=0x%016h imag=0x%016h packed=0x%032h", outr[i], outi[i], got_pack);
                    fail_now("FFT output mismatch");
                end
            end
        end
    endtask

    task automatic run_case;
        input [1023:0] case_name;
        begin
            test_count = test_count + 1;
            @(negedge clk);
            wait_for_settle_and_report(case_name);
            check_outputs_exact(case_name);
            $display("PASS[%0s]: all %0d bins matched expected fp64 words", case_name, DEPTH);
        end
    endtask

    // Flatten output vectors for cheap transition/stability tracking.
    assign out_bus_r = {
        outr[31], outr[30], outr[29], outr[28], outr[27], outr[26], outr[25], outr[24],
        outr[23], outr[22], outr[21], outr[20], outr[19], outr[18], outr[17], outr[16],
        outr[15], outr[14], outr[13], outr[12], outr[11], outr[10], outr[9],  outr[8],
        outr[7],  outr[6],  outr[5],  outr[4],  outr[3],  outr[2],  outr[1],  outr[0]
    };

    assign out_bus_i = {
        outi[31], outi[30], outi[29], outi[28], outi[27], outi[26], outi[25], outi[24],
        outi[23], outi[22], outi[21], outi[20], outi[19], outi[18], outi[17], outi[16],
        outi[15], outi[14], outi[13], outi[12], outi[11], outi[10], outi[9],  outi[8],
        outi[7],  outi[6],  outi[5],  outi[4],  outi[3],  outi[2],  outi[1],  outi[0]
    };

    assign out_bus = {out_bus_i, out_bus_r};

    fft_32_local dut (
        .inr_0(inr[0]),   .ini_0(ini[0]),
        .inr_1(inr[1]),   .ini_1(ini[1]),
        .inr_2(inr[2]),   .ini_2(ini[2]),
        .inr_3(inr[3]),   .ini_3(ini[3]),
        .inr_4(inr[4]),   .ini_4(ini[4]),
        .inr_5(inr[5]),   .ini_5(ini[5]),
        .inr_6(inr[6]),   .ini_6(ini[6]),
        .inr_7(inr[7]),   .ini_7(ini[7]),
        .inr_8(inr[8]),   .ini_8(ini[8]),
        .inr_9(inr[9]),   .ini_9(ini[9]),
        .inr_10(inr[10]), .ini_10(ini[10]),
        .inr_11(inr[11]), .ini_11(ini[11]),
        .inr_12(inr[12]), .ini_12(ini[12]),
        .inr_13(inr[13]), .ini_13(ini[13]),
        .inr_14(inr[14]), .ini_14(ini[14]),
        .inr_15(inr[15]), .ini_15(ini[15]),
        .inr_16(inr[16]), .ini_16(ini[16]),
        .inr_17(inr[17]), .ini_17(ini[17]),
        .inr_18(inr[18]), .ini_18(ini[18]),
        .inr_19(inr[19]), .ini_19(ini[19]),
        .inr_20(inr[20]), .ini_20(ini[20]),
        .inr_21(inr[21]), .ini_21(ini[21]),
        .inr_22(inr[22]), .ini_22(ini[22]),
        .inr_23(inr[23]), .ini_23(ini[23]),
        .inr_24(inr[24]), .ini_24(ini[24]),
        .inr_25(inr[25]), .ini_25(ini[25]),
        .inr_26(inr[26]), .ini_26(ini[26]),
        .inr_27(inr[27]), .ini_27(ini[27]),
        .inr_28(inr[28]), .ini_28(ini[28]),
        .inr_29(inr[29]), .ini_29(ini[29]),
        .inr_30(inr[30]), .ini_30(ini[30]),
        .inr_31(inr[31]), .ini_31(ini[31]),

        .outr_0(outr[0]),   .outi_0(outi[0]),
        .outr_1(outr[1]),   .outi_1(outi[1]),
        .outr_2(outr[2]),   .outi_2(outi[2]),
        .outr_3(outr[3]),   .outi_3(outi[3]),
        .outr_4(outr[4]),   .outi_4(outi[4]),
        .outr_5(outr[5]),   .outi_5(outi[5]),
        .outr_6(outr[6]),   .outi_6(outi[6]),
        .outr_7(outr[7]),   .outi_7(outi[7]),
        .outr_8(outr[8]),   .outi_8(outi[8]),
        .outr_9(outr[9]),   .outi_9(outi[9]),
        .outr_10(outr[10]), .outi_10(outi[10]),
        .outr_11(outr[11]), .outi_11(outi[11]),
        .outr_12(outr[12]), .outi_12(outi[12]),
        .outr_13(outr[13]), .outi_13(outi[13]),
        .outr_14(outr[14]), .outi_14(outi[14]),
        .outr_15(outr[15]), .outi_15(outi[15]),
        .outr_16(outr[16]), .outi_16(outi[16]),
        .outr_17(outr[17]), .outi_17(outi[17]),
        .outr_18(outr[18]), .outi_18(outi[18]),
        .outr_19(outr[19]), .outi_19(outi[19]),
        .outr_20(outr[20]), .outi_20(outi[20]),
        .outr_21(outr[21]), .outi_21(outi[21]),
        .outr_22(outr[22]), .outi_22(outi[22]),
        .outr_23(outr[23]), .outi_23(outi[23]),
        .outr_24(outr[24]), .outi_24(outi[24]),
        .outr_25(outr[25]), .outi_25(outi[25]),
        .outr_26(outr[26]), .outi_26(outi[26]),
        .outr_27(outr[27]), .outi_27(outi[27]),
        .outr_28(outr[28]), .outi_28(outi[28]),
        .outr_29(outr[29]), .outi_29(outi[29]),
        .outr_30(outr[30]), .outi_30(outi[30]),
        .outr_31(outr[31]), .outi_31(outi[31])
    );

    initial begin
        clear_inputs();
        clear_expected();

        // Give DUT outputs a few cycles to leave unknown startup states.
        repeat (4) @(posedge clk);

        set_case_impulse_real();
        run_case("impulse_real_n0");

        set_case_constant_real();
        run_case("constant_real_ones");

        set_case_impulse_imag();
        run_case("impulse_imag_n0");

        set_case_constant_minus_one_real();
        run_case("constant_real_minus_ones");

        $display("PASS: fft_32_tb completed %0d deterministic self-checking vectors", test_count);
        $finish;
    end

    initial begin
        repeat (TIMEOUT_CYCLES) @(posedge clk);
        fail_now("Global watchdog timeout");
    end

endmodule