module fft_32(
	input  wire [63:0] inr_0,
	input  wire [63:0] ini_0,
	input  wire [63:0] inr_1,
	input  wire [63:0] ini_1,
	input  wire [63:0] inr_2,
	input  wire [63:0] ini_2,
	input  wire [63:0] inr_3,
	input  wire [63:0] ini_3,
	input  wire [63:0] inr_4,
	input  wire [63:0] ini_4,
	input  wire [63:0] inr_5,
	input  wire [63:0] ini_5,
	input  wire [63:0] inr_6,
	input  wire [63:0] ini_6,
	input  wire [63:0] inr_7,
	input  wire [63:0] ini_7,
	input  wire [63:0] inr_8,
	input  wire [63:0] ini_8,
	input  wire [63:0] inr_9,
	input  wire [63:0] ini_9,
	input  wire [63:0] inr_10,
	input  wire [63:0] ini_10,
	input  wire [63:0] inr_11,
	input  wire [63:0] ini_11,
	input  wire [63:0] inr_12,
	input  wire [63:0] ini_12,
	input  wire [63:0] inr_13,
	input  wire [63:0] ini_13,
	input  wire [63:0] inr_14,
	input  wire [63:0] ini_14,
	input  wire [63:0] inr_15,
	input  wire [63:0] ini_15,
	input  wire [63:0] inr_16,
	input  wire [63:0] ini_16,
	input  wire [63:0] inr_17,
	input  wire [63:0] ini_17,
	input  wire [63:0] inr_18,
	input  wire [63:0] ini_18,
	input  wire [63:0] inr_19,
	input  wire [63:0] ini_19,
	input  wire [63:0] inr_20,
	input  wire [63:0] ini_20,
	input  wire [63:0] inr_21,
	input  wire [63:0] ini_21,
	input  wire [63:0] inr_22,
	input  wire [63:0] ini_22,
	input  wire [63:0] inr_23,
	input  wire [63:0] ini_23,
	input  wire [63:0] inr_24,
	input  wire [63:0] ini_24,
	input  wire [63:0] inr_25,
	input  wire [63:0] ini_25,
	input  wire [63:0] inr_26,
	input  wire [63:0] ini_26,
	input  wire [63:0] inr_27,
	input  wire [63:0] ini_27,
	input  wire [63:0] inr_28,
	input  wire [63:0] ini_28,
	input  wire [63:0] inr_29,
	input  wire [63:0] ini_29,
	input  wire [63:0] inr_30,
	input  wire [63:0] ini_30,
	input  wire [63:0] inr_31,
	input  wire [63:0] ini_31,
	output  wire [63:0] outr_0,
	output  wire [63:0] outi_0,
	output  wire [63:0] outr_1,
	output  wire [63:0] outi_1,
	output  wire [63:0] outr_2,
	output  wire [63:0] outi_2,
	output  wire [63:0] outr_3,
	output  wire [63:0] outi_3,
	output  wire [63:0] outr_4,
	output  wire [63:0] outi_4,
	output  wire [63:0] outr_5,
	output  wire [63:0] outi_5,
	output  wire [63:0] outr_6,
	output  wire [63:0] outi_6,
	output  wire [63:0] outr_7,
	output  wire [63:0] outi_7,
	output  wire [63:0] outr_8,
	output  wire [63:0] outi_8,
	output  wire [63:0] outr_9,
	output  wire [63:0] outi_9,
	output  wire [63:0] outr_10,
	output  wire [63:0] outi_10,
	output  wire [63:0] outr_11,
	output  wire [63:0] outi_11,
	output  wire [63:0] outr_12,
	output  wire [63:0] outi_12,
	output  wire [63:0] outr_13,
	output  wire [63:0] outi_13,
	output  wire [63:0] outr_14,
	output  wire [63:0] outi_14,
	output  wire [63:0] outr_15,
	output  wire [63:0] outi_15,
	output  wire [63:0] outr_16,
	output  wire [63:0] outi_16,
	output  wire [63:0] outr_17,
	output  wire [63:0] outi_17,
	output  wire [63:0] outr_18,
	output  wire [63:0] outi_18,
	output  wire [63:0] outr_19,
	output  wire [63:0] outi_19,
	output  wire [63:0] outr_20,
	output  wire [63:0] outi_20,
	output  wire [63:0] outr_21,
	output  wire [63:0] outi_21,
	output  wire [63:0] outr_22,
	output  wire [63:0] outi_22,
	output  wire [63:0] outr_23,
	output  wire [63:0] outi_23,
	output  wire [63:0] outr_24,
	output  wire [63:0] outi_24,
	output  wire [63:0] outr_25,
	output  wire [63:0] outi_25,
	output  wire [63:0] outr_26,
	output  wire [63:0] outi_26,
	output  wire [63:0] outr_27,
	output  wire [63:0] outi_27,
	output  wire [63:0] outr_28,
	output  wire [63:0] outi_28,
	output  wire [63:0] outr_29,
	output  wire [63:0] outi_29,
	output  wire [63:0] outr_30,
	output  wire [63:0] outi_30,
	output  wire [63:0] outr_31,
	output  wire [63:0] outi_31
);
	// Bit-reversed input wire assignment
	wire [63:0]			inr_rev_0;
	wire [63:0]			ini_rev_0;
	wire [63:0]			inr_rev_1;
	wire [63:0]			ini_rev_1;
	wire [63:0]			inr_rev_2;
	wire [63:0]			ini_rev_2;
	wire [63:0]			inr_rev_3;
	wire [63:0]			ini_rev_3;
	wire [63:0]			inr_rev_4;
	wire [63:0]			ini_rev_4;
	wire [63:0]			inr_rev_5;
	wire [63:0]			ini_rev_5;
	wire [63:0]			inr_rev_6;
	wire [63:0]			ini_rev_6;
	wire [63:0]			inr_rev_7;
	wire [63:0]			ini_rev_7;
	wire [63:0]			inr_rev_8;
	wire [63:0]			ini_rev_8;
	wire [63:0]			inr_rev_9;
	wire [63:0]			ini_rev_9;
	wire [63:0]			inr_rev_10;
	wire [63:0]			ini_rev_10;
	wire [63:0]			inr_rev_11;
	wire [63:0]			ini_rev_11;
	wire [63:0]			inr_rev_12;
	wire [63:0]			ini_rev_12;
	wire [63:0]			inr_rev_13;
	wire [63:0]			ini_rev_13;
	wire [63:0]			inr_rev_14;
	wire [63:0]			ini_rev_14;
	wire [63:0]			inr_rev_15;
	wire [63:0]			ini_rev_15;
	wire [63:0]			inr_rev_16;
	wire [63:0]			ini_rev_16;
	wire [63:0]			inr_rev_17;
	wire [63:0]			ini_rev_17;
	wire [63:0]			inr_rev_18;
	wire [63:0]			ini_rev_18;
	wire [63:0]			inr_rev_19;
	wire [63:0]			ini_rev_19;
	wire [63:0]			inr_rev_20;
	wire [63:0]			ini_rev_20;
	wire [63:0]			inr_rev_21;
	wire [63:0]			ini_rev_21;
	wire [63:0]			inr_rev_22;
	wire [63:0]			ini_rev_22;
	wire [63:0]			inr_rev_23;
	wire [63:0]			ini_rev_23;
	wire [63:0]			inr_rev_24;
	wire [63:0]			ini_rev_24;
	wire [63:0]			inr_rev_25;
	wire [63:0]			ini_rev_25;
	wire [63:0]			inr_rev_26;
	wire [63:0]			ini_rev_26;
	wire [63:0]			inr_rev_27;
	wire [63:0]			ini_rev_27;
	wire [63:0]			inr_rev_28;
	wire [63:0]			ini_rev_28;
	wire [63:0]			inr_rev_29;
	wire [63:0]			ini_rev_29;
	wire [63:0]			inr_rev_30;
	wire [63:0]			ini_rev_30;
	wire [63:0]			inr_rev_31;
	wire [63:0]			ini_rev_31;
	
	assign inr_rev_0 = inr_0;
	assign ini_rev_0 = ini_0;
	assign inr_rev_16 = inr_1;
	assign ini_rev_16 = ini_1;
	assign inr_rev_8 = inr_2;
	assign ini_rev_8 = ini_2;
	assign inr_rev_24 = inr_3;
	assign ini_rev_24 = ini_3;
	assign inr_rev_4 = inr_4;
	assign ini_rev_4 = ini_4;
	assign inr_rev_20 = inr_5;
	assign ini_rev_20 = ini_5;
	assign inr_rev_12 = inr_6;
	assign ini_rev_12 = ini_6;
	assign inr_rev_28 = inr_7;
	assign ini_rev_28 = ini_7;
	assign inr_rev_2 = inr_8;
	assign ini_rev_2 = ini_8;
	assign inr_rev_18 = inr_9;
	assign ini_rev_18 = ini_9;
	assign inr_rev_10 = inr_10;
	assign ini_rev_10 = ini_10;
	assign inr_rev_26 = inr_11;
	assign ini_rev_26 = ini_11;
	assign inr_rev_6 = inr_12;
	assign ini_rev_6 = ini_12;
	assign inr_rev_22 = inr_13;
	assign ini_rev_22 = ini_13;
	assign inr_rev_14 = inr_14;
	assign ini_rev_14 = ini_14;
	assign inr_rev_30 = inr_15;
	assign ini_rev_30 = ini_15;
	assign inr_rev_1 = inr_16;
	assign ini_rev_1 = ini_16;
	assign inr_rev_17 = inr_17;
	assign ini_rev_17 = ini_17;
	assign inr_rev_9 = inr_18;
	assign ini_rev_9 = ini_18;
	assign inr_rev_25 = inr_19;
	assign ini_rev_25 = ini_19;
	assign inr_rev_5 = inr_20;
	assign ini_rev_5 = ini_20;
	assign inr_rev_21 = inr_21;
	assign ini_rev_21 = ini_21;
	assign inr_rev_13 = inr_22;
	assign ini_rev_13 = ini_22;
	assign inr_rev_29 = inr_23;
	assign ini_rev_29 = ini_23;
	assign inr_rev_3 = inr_24;
	assign ini_rev_3 = ini_24;
	assign inr_rev_19 = inr_25;
	assign ini_rev_19 = ini_25;
	assign inr_rev_11 = inr_26;
	assign ini_rev_11 = ini_26;
	assign inr_rev_27 = inr_27;
	assign ini_rev_27 = ini_27;
	assign inr_rev_7 = inr_28;
	assign ini_rev_7 = ini_28;
	assign inr_rev_23 = inr_29;
	assign ini_rev_23 = ini_29;
	assign inr_rev_15 = inr_30;
	assign ini_rev_15 = ini_30;
	assign inr_rev_31 = inr_31;
	assign ini_rev_31 = ini_31;
	
	// Internal output wires	
    wire [63:0] outi_0_0;
    wire [63:0] outr_0_0;
    wire [63:0] outi_0_1;
    wire [63:0] outr_0_1;
    wire [63:0] outi_0_2;
    wire [63:0] outr_0_2;
    wire [63:0] outi_0_3;
    wire [63:0] outr_0_3;
    wire [63:0] outi_0_4;
    wire [63:0] outr_0_4;
    wire [63:0] outi_0_5;
    wire [63:0] outr_0_5;
    wire [63:0] outi_0_6;
    wire [63:0] outr_0_6;
    wire [63:0] outi_0_7;
    wire [63:0] outr_0_7;
    wire [63:0] outi_0_8;
    wire [63:0] outr_0_8;
    wire [63:0] outi_0_9;
    wire [63:0] outr_0_9;
    wire [63:0] outi_0_10;
    wire [63:0] outr_0_10;
    wire [63:0] outi_0_11;
    wire [63:0] outr_0_11;
    wire [63:0] outi_0_12;
    wire [63:0] outr_0_12;
    wire [63:0] outi_0_13;
    wire [63:0] outr_0_13;
    wire [63:0] outi_0_14;
    wire [63:0] outr_0_14;
    wire [63:0] outi_0_15;
    wire [63:0] outr_0_15;
    wire [63:0] outi_0_16;
    wire [63:0] outr_0_16;
    wire [63:0] outi_0_17;
    wire [63:0] outr_0_17;
    wire [63:0] outi_0_18;
    wire [63:0] outr_0_18;
    wire [63:0] outi_0_19;
    wire [63:0] outr_0_19;
    wire [63:0] outi_0_20;
    wire [63:0] outr_0_20;
    wire [63:0] outi_0_21;
    wire [63:0] outr_0_21;
    wire [63:0] outi_0_22;
    wire [63:0] outr_0_22;
    wire [63:0] outi_0_23;
    wire [63:0] outr_0_23;
    wire [63:0] outi_0_24;
    wire [63:0] outr_0_24;
    wire [63:0] outi_0_25;
    wire [63:0] outr_0_25;
    wire [63:0] outi_0_26;
    wire [63:0] outr_0_26;
    wire [63:0] outi_0_27;
    wire [63:0] outr_0_27;
    wire [63:0] outi_0_28;
    wire [63:0] outr_0_28;
    wire [63:0] outi_0_29;
    wire [63:0] outr_0_29;
    wire [63:0] outi_0_30;
    wire [63:0] outr_0_30;
    wire [63:0] outi_0_31;
    wire [63:0] outr_0_31;
    wire [63:0] outi_1_0;
    wire [63:0] outr_1_0;
    wire [63:0] outi_1_1;
    wire [63:0] outr_1_1;
    wire [63:0] outi_1_2;
    wire [63:0] outr_1_2;
    wire [63:0] outi_1_3;
    wire [63:0] outr_1_3;
    wire [63:0] outi_1_4;
    wire [63:0] outr_1_4;
    wire [63:0] outi_1_5;
    wire [63:0] outr_1_5;
    wire [63:0] outi_1_6;
    wire [63:0] outr_1_6;
    wire [63:0] outi_1_7;
    wire [63:0] outr_1_7;
    wire [63:0] outi_1_8;
    wire [63:0] outr_1_8;
    wire [63:0] outi_1_9;
    wire [63:0] outr_1_9;
    wire [63:0] outi_1_10;
    wire [63:0] outr_1_10;
    wire [63:0] outi_1_11;
    wire [63:0] outr_1_11;
    wire [63:0] outi_1_12;
    wire [63:0] outr_1_12;
    wire [63:0] outi_1_13;
    wire [63:0] outr_1_13;
    wire [63:0] outi_1_14;
    wire [63:0] outr_1_14;
    wire [63:0] outi_1_15;
    wire [63:0] outr_1_15;
    wire [63:0] outi_1_16;
    wire [63:0] outr_1_16;
    wire [63:0] outi_1_17;
    wire [63:0] outr_1_17;
    wire [63:0] outi_1_18;
    wire [63:0] outr_1_18;
    wire [63:0] outi_1_19;
    wire [63:0] outr_1_19;
    wire [63:0] outi_1_20;
    wire [63:0] outr_1_20;
    wire [63:0] outi_1_21;
    wire [63:0] outr_1_21;
    wire [63:0] outi_1_22;
    wire [63:0] outr_1_22;
    wire [63:0] outi_1_23;
    wire [63:0] outr_1_23;
    wire [63:0] outi_1_24;
    wire [63:0] outr_1_24;
    wire [63:0] outi_1_25;
    wire [63:0] outr_1_25;
    wire [63:0] outi_1_26;
    wire [63:0] outr_1_26;
    wire [63:0] outi_1_27;
    wire [63:0] outr_1_27;
    wire [63:0] outi_1_28;
    wire [63:0] outr_1_28;
    wire [63:0] outi_1_29;
    wire [63:0] outr_1_29;
    wire [63:0] outi_1_30;
    wire [63:0] outr_1_30;
    wire [63:0] outi_1_31;
    wire [63:0] outr_1_31;
    wire [63:0] outi_2_0;
    wire [63:0] outr_2_0;
    wire [63:0] outi_2_1;
    wire [63:0] outr_2_1;
    wire [63:0] outi_2_2;
    wire [63:0] outr_2_2;
    wire [63:0] outi_2_3;
    wire [63:0] outr_2_3;
    wire [63:0] outi_2_4;
    wire [63:0] outr_2_4;
    wire [63:0] outi_2_5;
    wire [63:0] outr_2_5;
    wire [63:0] outi_2_6;
    wire [63:0] outr_2_6;
    wire [63:0] outi_2_7;
    wire [63:0] outr_2_7;
    wire [63:0] outi_2_8;
    wire [63:0] outr_2_8;
    wire [63:0] outi_2_9;
    wire [63:0] outr_2_9;
    wire [63:0] outi_2_10;
    wire [63:0] outr_2_10;
    wire [63:0] outi_2_11;
    wire [63:0] outr_2_11;
    wire [63:0] outi_2_12;
    wire [63:0] outr_2_12;
    wire [63:0] outi_2_13;
    wire [63:0] outr_2_13;
    wire [63:0] outi_2_14;
    wire [63:0] outr_2_14;
    wire [63:0] outi_2_15;
    wire [63:0] outr_2_15;
    wire [63:0] outi_2_16;
    wire [63:0] outr_2_16;
    wire [63:0] outi_2_17;
    wire [63:0] outr_2_17;
    wire [63:0] outi_2_18;
    wire [63:0] outr_2_18;
    wire [63:0] outi_2_19;
    wire [63:0] outr_2_19;
    wire [63:0] outi_2_20;
    wire [63:0] outr_2_20;
    wire [63:0] outi_2_21;
    wire [63:0] outr_2_21;
    wire [63:0] outi_2_22;
    wire [63:0] outr_2_22;
    wire [63:0] outi_2_23;
    wire [63:0] outr_2_23;
    wire [63:0] outi_2_24;
    wire [63:0] outr_2_24;
    wire [63:0] outi_2_25;
    wire [63:0] outr_2_25;
    wire [63:0] outi_2_26;
    wire [63:0] outr_2_26;
    wire [63:0] outi_2_27;
    wire [63:0] outr_2_27;
    wire [63:0] outi_2_28;
    wire [63:0] outr_2_28;
    wire [63:0] outi_2_29;
    wire [63:0] outr_2_29;
    wire [63:0] outi_2_30;
    wire [63:0] outr_2_30;
    wire [63:0] outi_2_31;
    wire [63:0] outr_2_31;
    wire [63:0] outi_3_0;
    wire [63:0] outr_3_0;
    wire [63:0] outi_3_1;
    wire [63:0] outr_3_1;
    wire [63:0] outi_3_2;
    wire [63:0] outr_3_2;
    wire [63:0] outi_3_3;
    wire [63:0] outr_3_3;
    wire [63:0] outi_3_4;
    wire [63:0] outr_3_4;
    wire [63:0] outi_3_5;
    wire [63:0] outr_3_5;
    wire [63:0] outi_3_6;
    wire [63:0] outr_3_6;
    wire [63:0] outi_3_7;
    wire [63:0] outr_3_7;
    wire [63:0] outi_3_8;
    wire [63:0] outr_3_8;
    wire [63:0] outi_3_9;
    wire [63:0] outr_3_9;
    wire [63:0] outi_3_10;
    wire [63:0] outr_3_10;
    wire [63:0] outi_3_11;
    wire [63:0] outr_3_11;
    wire [63:0] outi_3_12;
    wire [63:0] outr_3_12;
    wire [63:0] outi_3_13;
    wire [63:0] outr_3_13;
    wire [63:0] outi_3_14;
    wire [63:0] outr_3_14;
    wire [63:0] outi_3_15;
    wire [63:0] outr_3_15;
    wire [63:0] outi_3_16;
    wire [63:0] outr_3_16;
    wire [63:0] outi_3_17;
    wire [63:0] outr_3_17;
    wire [63:0] outi_3_18;
    wire [63:0] outr_3_18;
    wire [63:0] outi_3_19;
    wire [63:0] outr_3_19;
    wire [63:0] outi_3_20;
    wire [63:0] outr_3_20;
    wire [63:0] outi_3_21;
    wire [63:0] outr_3_21;
    wire [63:0] outi_3_22;
    wire [63:0] outr_3_22;
    wire [63:0] outi_3_23;
    wire [63:0] outr_3_23;
    wire [63:0] outi_3_24;
    wire [63:0] outr_3_24;
    wire [63:0] outi_3_25;
    wire [63:0] outr_3_25;
    wire [63:0] outi_3_26;
    wire [63:0] outr_3_26;
    wire [63:0] outi_3_27;
    wire [63:0] outr_3_27;
    wire [63:0] outi_3_28;
    wire [63:0] outr_3_28;
    wire [63:0] outi_3_29;
    wire [63:0] outr_3_29;
    wire [63:0] outi_3_30;
    wire [63:0] outr_3_30;
    wire [63:0] outi_3_31;
    wire [63:0] outr_3_31;

// Internal twiddle wires
	wire [63:0]		re_0;     
    wire [63:0]		im_0;
	wire [63:0]		re_1;     
    wire [63:0]		im_1;
	wire [63:0]		re_2;     
    wire [63:0]		im_2;
	wire [63:0]		re_3;     
    wire [63:0]		im_3;
	wire [63:0]		re_4;     
    wire [63:0]		im_4;
	wire [63:0]		re_5;     
    wire [63:0]		im_5;
	wire [63:0]		re_6;     
    wire [63:0]		im_6;
	wire [63:0]		re_7;     
    wire [63:0]		im_7;
	wire [63:0]		re_8;     
    wire [63:0]		im_8;
	wire [63:0]		re_9;     
    wire [63:0]		im_9;
	wire [63:0]		re_10;     
    wire [63:0]		im_10;
	wire [63:0]		re_11;     
    wire [63:0]		im_11;
	wire [63:0]		re_12;     
    wire [63:0]		im_12;
	wire [63:0]		re_13;     
    wire [63:0]		im_13;
	wire [63:0]		re_14;     
    wire [63:0]		im_14;
	wire [63:0]		re_15;     
    wire [63:0]		im_15;
	
// Twiddle Rom Instance
	twiddle_rom trom (
        .re_0(re_0),     .im_0(im_0),
        .re_1(re_1),     .im_1(im_1),
        .re_2(re_2),     .im_2(im_2),
        .re_3(re_3),     .im_3(im_3),
        .re_4(re_4),     .im_4(im_4),
        .re_5(re_5),     .im_5(im_5),
        .re_6(re_6),     .im_6(im_6),
        .re_7(re_7),     .im_7(im_7),
        .re_8(re_8),     .im_8(im_8),
        .re_9(re_9),     .im_9(im_9),
        .re_10(re_10),     .im_10(im_10),
        .re_11(re_11),     .im_11(im_11),
        .re_12(re_12),     .im_12(im_12),
        .re_13(re_13),     .im_13(im_13),
        .re_14(re_14),     .im_14(im_14),
        .re_15(re_15),     .im_15(im_15)
	);

// Five stages- five instances of fft_32_butterfly
fft_32_butterfly fft0 (
		.inr_0			(inr_rev_0),
		.ini_0			(ini_rev_0),
		.inr_1			(inr_rev_1),
		.ini_1			(ini_rev_1),
		.inr_2			(inr_rev_2),
		.ini_2			(ini_rev_2),
		.inr_3			(inr_rev_3),
		.ini_3			(ini_rev_3),
		.inr_4			(inr_rev_4),
		.ini_4			(ini_rev_4),
		.inr_5			(inr_rev_5),
		.ini_5			(ini_rev_5),
		.inr_6			(inr_rev_6),
		.ini_6			(ini_rev_6),
		.inr_7			(inr_rev_7),
		.ini_7			(ini_rev_7),
		.inr_8			(inr_rev_8),
		.ini_8			(ini_rev_8),
		.inr_9			(inr_rev_9),
		.ini_9			(ini_rev_9),
		.inr_10			(inr_rev_10),
		.ini_10			(ini_rev_10),
		.inr_11			(inr_rev_11),
		.ini_11			(ini_rev_11),
		.inr_12			(inr_rev_12),
		.ini_12			(ini_rev_12),
		.inr_13			(inr_rev_13),
		.ini_13			(ini_rev_13),
		.inr_14			(inr_rev_14),
		.ini_14			(ini_rev_14),
		.inr_15			(inr_rev_15),
		.ini_15			(ini_rev_15),
		.inr_16			(inr_rev_16),
		.ini_16			(ini_rev_16),
		.inr_17			(inr_rev_17),
		.ini_17			(ini_rev_17),
		.inr_18			(inr_rev_18),
		.ini_18			(ini_rev_18),
		.inr_19			(inr_rev_19),
		.ini_19			(ini_rev_19),
		.inr_20			(inr_rev_20),
		.ini_20			(ini_rev_20),
		.inr_21			(inr_rev_21),
		.ini_21			(ini_rev_21),
		.inr_22			(inr_rev_22),
		.ini_22			(ini_rev_22),
		.inr_23			(inr_rev_23),
		.ini_23			(ini_rev_23),
		.inr_24			(inr_rev_24),
		.ini_24			(ini_rev_24),
		.inr_25			(inr_rev_25),
		.ini_25			(ini_rev_25),
		.inr_26			(inr_rev_26),
		.ini_26			(ini_rev_26),
		.inr_27			(inr_rev_27),
		.ini_27			(ini_rev_27),
		.inr_28			(inr_rev_28),
		.ini_28			(ini_rev_28),
		.inr_29			(inr_rev_29),
		.ini_29			(ini_rev_29),
		.inr_30			(inr_rev_30),
		.ini_30			(ini_rev_30),
		.inr_31			(inr_rev_31),
		.ini_31			(ini_rev_31),
		.wr_0			(re_0),
		.wi_0			(im_0),
		.wr_1			(re_0),
		.wi_1			(im_0),
		.wr_2			(re_0),
		.wi_2			(im_0),
		.wr_3			(re_0),
		.wi_3			(im_0),
		.wr_4			(re_0),
		.wi_4			(im_0),
		.wr_5			(re_0),
		.wi_5			(im_0),
		.wr_6			(re_0),
		.wi_6			(im_0),
		.wr_7			(re_0),
		.wi_7			(im_0),
		.wr_8			(re_0),
		.wi_8			(im_0),
		.wr_9			(re_0),
		.wi_9			(im_0),
		.wr_10			(re_0),
		.wi_10			(im_0),
		.wr_11			(re_0),
		.wi_11			(im_0),
		.wr_12			(re_0),
		.wi_12			(im_0),
		.wr_13			(re_0),
		.wi_13			(im_0),
		.wr_14			(re_0),
		.wi_14			(im_0),
		.wr_15			(re_0),
		.wi_15			(im_0),
		.outr_0			(outr_0_0),
		.outi_0			(outi_0_0),
		.outr_1			(outr_0_1),
		.outi_1			(outi_0_1),
		.outr_2			(outr_0_2),
		.outi_2			(outi_0_2),
		.outr_3			(outr_0_3),
		.outi_3			(outi_0_3),
		.outr_4			(outr_0_4),
		.outi_4			(outi_0_4),
		.outr_5			(outr_0_5),
		.outi_5			(outi_0_5),
		.outr_6			(outr_0_6),
		.outi_6			(outi_0_6),
		.outr_7			(outr_0_7),
		.outi_7			(outi_0_7),
		.outr_8			(outr_0_8),
		.outi_8			(outi_0_8),
		.outr_9			(outr_0_9),
		.outi_9			(outi_0_9),
		.outr_10		(outr_0_10),
		.outi_10		(outi_0_10),
		.outr_11		(outr_0_11),
		.outi_11		(outi_0_11),
		.outr_12		(outr_0_12),
		.outi_12		(outi_0_12),
		.outr_13		(outr_0_13),
		.outi_13		(outi_0_13),
		.outr_14		(outr_0_14),
		.outi_14		(outi_0_14),
		.outr_15		(outr_0_15),
		.outi_15		(outi_0_15),
		.outr_16		(outr_0_16),
		.outi_16		(outi_0_16),
		.outr_17		(outr_0_17),
		.outi_17		(outi_0_17),
		.outr_18		(outr_0_18),
		.outi_18		(outi_0_18),
		.outr_19		(outr_0_19),
		.outi_19		(outi_0_19),
		.outr_20		(outr_0_20),
		.outi_20		(outi_0_20),
		.outr_21		(outr_0_21),
		.outi_21		(outi_0_21),
		.outr_22		(outr_0_22),
		.outi_22		(outi_0_22),
		.outr_23		(outr_0_23),
		.outi_23		(outi_0_23),
		.outr_24		(outr_0_24),
		.outi_24		(outi_0_24),
		.outr_25		(outr_0_25),
		.outi_25		(outi_0_25),
		.outr_26		(outr_0_26),
		.outi_26		(outi_0_26),
		.outr_27		(outr_0_27),
		.outi_27		(outi_0_27),
		.outr_28		(outr_0_28),
		.outi_28		(outi_0_28),
		.outr_29		(outr_0_29),
		.outi_29		(outi_0_29),
		.outr_30		(outr_0_30),
		.outi_30		(outi_0_30),
		.outr_31		(outr_0_31),
		.outi_31		(outi_0_31)
);

fft_32_butterfly fft1 (
		.inr_0			(outr_0_0),
		.ini_0			(outi_0_0),
  		.inr_1			(outr_0_2),
		.ini_1			(outi_0_2),
		.inr_2			(outr_0_1),
		.ini_2			(outi_0_1),
  		.inr_3			(outr_0_3),
		.ini_3			(outi_0_3),
		.inr_4			(outr_0_4),
		.ini_4			(outi_0_4),
  		.inr_5			(outr_0_6),
		.ini_5			(outi_0_6),
		.inr_6			(outr_0_5),
		.ini_6			(outi_0_5),
  		.inr_7			(outr_0_7),
		.ini_7			(outi_0_7),
		.inr_8			(outr_0_8),
		.ini_8			(outi_0_8),
  		.inr_9			(outr_0_10),
		.ini_9			(outi_0_10),
		.inr_10			(outr_0_9),
		.ini_10			(outi_0_9),
  		.inr_11			(outr_0_11),
		.ini_11			(outi_0_11),
		.inr_12			(outr_0_12),
		.ini_12			(outi_0_12),
  		.inr_13			(outr_0_14),
		.ini_13			(outi_0_14),
		.inr_14			(outr_0_13),
		.ini_14			(outi_0_13),
  		.inr_15			(outr_0_15),
		.ini_15			(outi_0_15),
		.inr_16			(outr_0_16),
		.ini_16			(outi_0_16),
  		.inr_17			(outr_0_18),
		.ini_17			(outi_0_18),
		.inr_18			(outr_0_17),
		.ini_18			(outi_0_17),
  		.inr_19			(outr_0_19),
		.ini_19			(outi_0_19),
		.inr_20			(outr_0_20),
		.ini_20			(outi_0_20),
  		.inr_21			(outr_0_22),
		.ini_21			(outi_0_22),
		.inr_22			(outr_0_21),
		.ini_22			(outi_0_21),
  		.inr_23			(outr_0_23),
		.ini_23			(outi_0_23),
		.inr_24			(outr_0_24),
		.ini_24			(outi_0_24),
  		.inr_25			(outr_0_26),
		.ini_25			(outi_0_26),
		.inr_26			(outr_0_25),
		.ini_26			(outi_0_25),
  		.inr_27			(outr_0_27),
		.ini_27			(outi_0_27),
		.inr_28			(outr_0_28),
		.ini_28			(outi_0_28),
  		.inr_29			(outr_0_30),
		.ini_29			(outi_0_30),
		.inr_30			(outr_0_29),
		.ini_30			(outi_0_29),
  		.inr_31			(outr_0_31),
		.ini_31			(outi_0_31),
		.wr_0			(re_0),
		.wi_0			(im_0),
		.wr_1			(re_8),
		.wi_1			(im_8),
		.wr_2			(re_0),
		.wi_2			(im_0),
		.wr_3			(re_8),
		.wi_3			(im_8),
		.wr_4			(re_0),
		.wi_4			(im_0),
		.wr_5			(re_8),
		.wi_5			(im_8),
		.wr_6			(re_0),
		.wi_6			(im_0),
		.wr_7			(re_8),
		.wi_7			(im_8),
		.wr_8			(re_0),
		.wi_8			(im_0),
		.wr_9			(re_8),
		.wi_9			(im_8),
		.wr_10			(re_0),
		.wi_10			(im_0),
		.wr_11			(re_8),
		.wi_11			(im_8),
		.wr_12			(re_0),
		.wi_12			(im_0),
		.wr_13			(re_8),
		.wi_13			(im_8),
		.wr_14			(re_0),
		.wi_14			(im_0),
		.wr_15			(re_8),
		.wi_15			(im_8),
		.outr_0			(outr_1_0),
		.outi_0			(outi_1_0),
		.outr_1			(outr_1_1),
		.outi_1			(outi_1_1),
		.outr_2			(outr_1_2),
		.outi_2			(outi_1_2),
		.outr_3			(outr_1_3),
		.outi_3			(outi_1_3),
		.outr_4			(outr_1_4),
		.outi_4			(outi_1_4),
		.outr_5			(outr_1_5),
		.outi_5			(outi_1_5),
		.outr_6			(outr_1_6),
		.outi_6			(outi_1_6),
		.outr_7			(outr_1_7),
		.outi_7			(outi_1_7),
		.outr_8			(outr_1_8),
		.outi_8			(outi_1_8),
		.outr_9			(outr_1_9),
		.outi_9			(outi_1_9),
		.outr_10			(outr_1_10),
		.outi_10			(outi_1_10),
		.outr_11			(outr_1_11),
		.outi_11			(outi_1_11),
		.outr_12			(outr_1_12),
		.outi_12			(outi_1_12),
		.outr_13			(outr_1_13),
		.outi_13			(outi_1_13),
		.outr_14			(outr_1_14),
		.outi_14			(outi_1_14),
		.outr_15			(outr_1_15),
		.outi_15			(outi_1_15),
		.outr_16			(outr_1_16),
		.outi_16			(outi_1_16),
		.outr_17			(outr_1_17),
		.outi_17			(outi_1_17),
		.outr_18			(outr_1_18),
		.outi_18			(outi_1_18),
		.outr_19			(outr_1_19),
		.outi_19			(outi_1_19),
		.outr_20			(outr_1_20),
		.outi_20			(outi_1_20),
		.outr_21			(outr_1_21),
		.outi_21			(outi_1_21),
		.outr_22			(outr_1_22),
		.outi_22			(outi_1_22),
		.outr_23			(outr_1_23),
		.outi_23			(outi_1_23),
		.outr_24			(outr_1_24),
		.outi_24			(outi_1_24),
		.outr_25			(outr_1_25),
		.outi_25			(outi_1_25),
		.outr_26			(outr_1_26),
		.outi_26			(outi_1_26),
		.outr_27			(outr_1_27),
		.outi_27			(outi_1_27),
		.outr_28			(outr_1_28),
		.outi_28			(outi_1_28),
		.outr_29			(outr_1_29),
		.outi_29			(outi_1_29),
		.outr_30			(outr_1_30),
		.outi_30			(outi_1_30),
		.outr_31			(outr_1_31),
		.outi_31			(outi_1_31)
);

fft_32_butterfly fft2 (
		.inr_0			(outr_1_0),
		.ini_0			(outi_1_0),
  		.inr_1			(outr_1_4),
		.ini_1			(outi_1_4),
		.inr_2			(outr_1_2),
		.ini_2			(outi_1_2),
  		.inr_3			(outr_1_6),
		.ini_3			(outi_1_6),
		.inr_4			(outr_1_1),
		.ini_4			(outi_1_1),
  		.inr_5			(outr_1_5),
		.ini_5			(outi_1_5),
		.inr_6			(outr_1_3),
		.ini_6			(outi_1_3),
  		.inr_7			(outr_1_7),
		.ini_7			(outi_1_7),
		.inr_8			(outr_1_8),
		.ini_8			(outi_1_8),
  		.inr_9			(outr_1_12),
		.ini_9			(outi_1_12),
		.inr_10			(outr_1_10),
		.ini_10			(outi_1_10),
  		.inr_11			(outr_1_14),
		.ini_11			(outi_1_14),
		.inr_12			(outr_1_9),
		.ini_12			(outi_1_9),
  		.inr_13			(outr_1_13),
		.ini_13			(outi_1_13),
		.inr_14			(outr_1_11),
		.ini_14			(outi_1_11),
  		.inr_15			(outr_1_15),
		.ini_15			(outi_1_15),
		.inr_16			(outr_1_16),
		.ini_16			(outi_1_16),
  		.inr_17			(outr_1_20),
		.ini_17			(outi_1_20),
		.inr_18			(outr_1_18),
		.ini_18			(outi_1_18),
  		.inr_19			(outr_1_22),
		.ini_19			(outi_1_22),
		.inr_20			(outr_1_17),
		.ini_20			(outi_1_17),
  		.inr_21			(outr_1_21),
		.ini_21			(outi_1_21),
		.inr_22			(outr_1_19),
		.ini_22			(outi_1_19),
  		.inr_23			(outr_1_23),
		.ini_23			(outi_1_23),
		.inr_24			(outr_1_24),
		.ini_24			(outi_1_24),
  		.inr_25			(outr_1_28),
		.ini_25			(outi_1_28),
		.inr_26			(outr_1_26),
		.ini_26			(outi_1_26),
  		.inr_27			(outr_1_30),
		.ini_27			(outi_1_30),
		.inr_28			(outr_1_25),
		.ini_28			(outi_1_25),
  		.inr_29			(outr_1_29),
		.ini_29			(outi_1_29),
		.inr_30			(outr_1_27),
		.ini_30			(outi_1_27),
  		.inr_31			(outr_1_31),
		.ini_31			(outi_1_31),
		.wr_0			(re_0),
		.wi_0			(im_0),
		.wr_1			(re_4),
		.wi_1			(im_4),
		.wr_2			(re_8),
		.wi_2			(im_8),
		.wr_3			(re_12),
		.wi_3			(im_12),
		.wr_4			(re_0),
		.wi_4			(im_0),
		.wr_5			(re_4),
		.wi_5			(im_4),
		.wr_6			(re_8),
		.wi_6			(im_8),
		.wr_7			(re_12),
		.wi_7			(im_12),
		.wr_8			(re_0),
		.wi_8			(im_0),
		.wr_9			(re_4),
		.wi_9			(im_4),
		.wr_10			(re_8),
		.wi_10			(im_8),
		.wr_11			(re_12),
		.wi_11			(im_12),
		.wr_12			(re_0),
		.wi_12			(im_0),
		.wr_13			(re_4),
		.wi_13			(im_4),
		.wr_14			(re_8),
		.wi_14			(im_8),
		.wr_15			(re_12),
		.wi_15			(im_12),
		.outr_0			(outr_2_0),
		.outi_0			(outi_2_0),
		.outr_1			(outr_2_1),
		.outi_1			(outi_2_1),
		.outr_2			(outr_2_2),
		.outi_2			(outi_2_2),
		.outr_3			(outr_2_3),
		.outi_3			(outi_2_3),
		.outr_4			(outr_2_4),
		.outi_4			(outi_2_4),
		.outr_5			(outr_2_5),
		.outi_5			(outi_2_5),
		.outr_6			(outr_2_6),
		.outi_6			(outi_2_6),
		.outr_7			(outr_2_7),
		.outi_7			(outi_2_7),
		.outr_8			(outr_2_8),
		.outi_8			(outi_2_8),
		.outr_9			(outr_2_9),
		.outi_9			(outi_2_9),
		.outr_10			(outr_2_10),
		.outi_10			(outi_2_10),
		.outr_11			(outr_2_11),
		.outi_11			(outi_2_11),
		.outr_12			(outr_2_12),
		.outi_12			(outi_2_12),
		.outr_13			(outr_2_13),
		.outi_13			(outi_2_13),
		.outr_14			(outr_2_14),
		.outi_14			(outi_2_14),
		.outr_15			(outr_2_15),
		.outi_15			(outi_2_15),
		.outr_16			(outr_2_16),
		.outi_16			(outi_2_16),
		.outr_17			(outr_2_17),
		.outi_17			(outi_2_17),
		.outr_18			(outr_2_18),
		.outi_18			(outi_2_18),
		.outr_19			(outr_2_19),
		.outi_19			(outi_2_19),
		.outr_20			(outr_2_20),
		.outi_20			(outi_2_20),
		.outr_21			(outr_2_21),
		.outi_21			(outi_2_21),
		.outr_22			(outr_2_22),
		.outi_22			(outi_2_22),
		.outr_23			(outr_2_23),
		.outi_23			(outi_2_23),
		.outr_24			(outr_2_24),
		.outi_24			(outi_2_24),
		.outr_25			(outr_2_25),
		.outi_25			(outi_2_25),
		.outr_26			(outr_2_26),
		.outi_26			(outi_2_26),
		.outr_27			(outr_2_27),
		.outi_27			(outi_2_27),
		.outr_28			(outr_2_28),
		.outi_28			(outi_2_28),
		.outr_29			(outr_2_29),
		.outi_29			(outi_2_29),
		.outr_30			(outr_2_30),
		.outi_30			(outi_2_30),
		.outr_31			(outr_2_31),
		.outi_31			(outi_2_31)
);

fft_32_butterfly fft3 (
		.inr_0			(outr_2_0),
		.ini_0			(outi_2_0),
  		.inr_1			(outr_2_8),
		.ini_1			(outi_2_8),
		.inr_2			(outr_2_2),
		.ini_2			(outi_2_2),
  		.inr_3			(outr_2_10),
		.ini_3			(outi_2_10),
		.inr_4			(outr_2_4),
		.ini_4			(outi_2_4),
  		.inr_5			(outr_2_12),
		.ini_5			(outi_2_12),
		.inr_6			(outr_2_6),
		.ini_6			(outi_2_6),
  		.inr_7			(outr_2_14),
		.ini_7			(outi_2_14),
		.inr_8			(outr_2_1),
		.ini_8			(outi_2_1),
  		.inr_9			(outr_2_9),
		.ini_9			(outi_2_9),
		.inr_10			(outr_2_3),
		.ini_10			(outi_2_3),
  		.inr_11			(outr_2_11),
		.ini_11			(outi_2_11),
		.inr_12			(outr_2_5),
		.ini_12			(outi_2_5),
  		.inr_13			(outr_2_13),
		.ini_13			(outi_2_13),
		.inr_14			(outr_2_7),
		.ini_14			(outi_2_7),
  		.inr_15			(outr_2_15),
		.ini_15			(outi_2_15),
		.inr_16			(outr_2_16),
		.ini_16			(outi_2_16),
  		.inr_17			(outr_2_24),
		.ini_17			(outi_2_24),
		.inr_18			(outr_2_18),
		.ini_18			(outi_2_18),
  		.inr_19			(outr_2_26),
		.ini_19			(outi_2_26),
		.inr_20			(outr_2_20),
		.ini_20			(outi_2_20),
  		.inr_21			(outr_2_28),
		.ini_21			(outi_2_28),
		.inr_22			(outr_2_22),
		.ini_22			(outi_2_22),
  		.inr_23			(outr_2_30),
		.ini_23			(outi_2_30),
		.inr_24			(outr_2_17),
		.ini_24			(outi_2_17),
  		.inr_25			(outr_2_25),
		.ini_25			(outi_2_25),
		.inr_26			(outr_2_19),
		.ini_26			(outi_2_19),
  		.inr_27			(outr_2_27),
		.ini_27			(outi_2_27),
		.inr_28			(outr_2_21),
		.ini_28			(outi_2_21),
  		.inr_29			(outr_2_29),
		.ini_29			(outi_2_29),
		.inr_30			(outr_2_23),
		.ini_30			(outi_2_23),
  		.inr_31			(outr_2_31),
		.ini_31			(outi_2_31),
		.wr_0			(re_0),
		.wi_0			(im_0),
		.wr_1			(re_2),
		.wi_1			(im_2),
		.wr_2			(re_4),
		.wi_2			(im_4),
		.wr_3			(re_6),
		.wi_3			(im_6),
		.wr_4			(re_8),
		.wi_4			(im_8),
		.wr_5			(re_10),
		.wi_5			(im_10),
		.wr_6			(re_12),
		.wi_6			(im_12),
		.wr_7			(re_14),
		.wi_7			(im_14),
		.wr_8			(re_0),
		.wi_8			(im_0),
		.wr_9			(re_2),
		.wi_9			(im_2),
		.wr_10			(re_4),
		.wi_10			(im_4),
		.wr_11			(re_6),
		.wi_11			(im_6),
		.wr_12			(re_8),
		.wi_12			(im_8),
		.wr_13			(re_10),
		.wi_13			(im_10),
		.wr_14			(re_12),
		.wi_14			(im_12),
		.wr_15			(re_14),
		.wi_15			(im_14),
		.outr_0			(outr_3_0),
		.outi_0			(outi_3_0),
		.outr_1			(outr_3_1),
		.outi_1			(outi_3_1),
		.outr_2			(outr_3_2),
		.outi_2			(outi_3_2),
		.outr_3			(outr_3_3),
		.outi_3			(outi_3_3),
		.outr_4			(outr_3_4),
		.outi_4			(outi_3_4),
		.outr_5			(outr_3_5),
		.outi_5			(outi_3_5),
		.outr_6			(outr_3_6),
		.outi_6			(outi_3_6),
		.outr_7			(outr_3_7),
		.outi_7			(outi_3_7),
		.outr_8			(outr_3_8),
		.outi_8			(outi_3_8),
		.outr_9			(outr_3_9),
		.outi_9			(outi_3_9),
		.outr_10			(outr_3_10),
		.outi_10			(outi_3_10),
		.outr_11			(outr_3_11),
		.outi_11			(outi_3_11),
		.outr_12			(outr_3_12),
		.outi_12			(outi_3_12),
		.outr_13			(outr_3_13),
		.outi_13			(outi_3_13),
		.outr_14			(outr_3_14),
		.outi_14			(outi_3_14),
		.outr_15			(outr_3_15),
		.outi_15			(outi_3_15),
		.outr_16			(outr_3_16),
		.outi_16			(outi_3_16),
		.outr_17			(outr_3_17),
		.outi_17			(outi_3_17),
		.outr_18			(outr_3_18),
		.outi_18			(outi_3_18),
		.outr_19			(outr_3_19),
		.outi_19			(outi_3_19),
		.outr_20			(outr_3_20),
		.outi_20			(outi_3_20),
		.outr_21			(outr_3_21),
		.outi_21			(outi_3_21),
		.outr_22			(outr_3_22),
		.outi_22			(outi_3_22),
		.outr_23			(outr_3_23),
		.outi_23			(outi_3_23),
		.outr_24			(outr_3_24),
		.outi_24			(outi_3_24),
		.outr_25			(outr_3_25),
		.outi_25			(outi_3_25),
		.outr_26			(outr_3_26),
		.outi_26			(outi_3_26),
		.outr_27			(outr_3_27),
		.outi_27			(outi_3_27),
		.outr_28			(outr_3_28),
		.outi_28			(outi_3_28),
		.outr_29			(outr_3_29),
		.outi_29			(outi_3_29),
		.outr_30			(outr_3_30),
		.outi_30			(outi_3_30),
		.outr_31			(outr_3_31),
		.outi_31			(outi_3_31)
);

fft_32_butterfly fft4 (
		.inr_0			(outr_3_0),
		.ini_0			(outi_3_0),
  		.inr_1			(outr_3_16),
		.ini_1			(outi_3_16),		
		.inr_2			(outr_3_2),
		.ini_2			(outi_3_2),
  		.inr_3			(outr_3_18),
		.ini_3			(outi_3_18),		
		.inr_4			(outr_3_4),
		.ini_4			(outi_3_4),
  		.inr_5			(outr_3_20),
		.ini_5			(outi_3_20),		
		.inr_6			(outr_3_6),
		.ini_6			(outi_3_6),
  		.inr_7			(outr_3_22),
		.ini_7			(outi_3_22),		
		.inr_8			(outr_3_8),
		.ini_8			(outi_3_8),
  		.inr_9			(outr_3_24),
		.ini_9			(outi_3_24),		
		.inr_10			(outr_3_10),
		.ini_10			(outi_3_10),
  		.inr_11			(outr_3_26),
		.ini_11			(outi_3_26),		
		.inr_12			(outr_3_12),
		.ini_12			(outi_3_12),
  		.inr_13			(outr_3_28),
		.ini_13			(outi_3_28),		
		.inr_14			(outr_3_14),
		.ini_14			(outi_3_14),
  		.inr_15			(outr_3_30),
		.ini_15			(outi_3_30),		
		.inr_16			(outr_3_1),
		.ini_16			(outi_3_1),
  		.inr_17			(outr_3_17),
		.ini_17			(outi_3_17),
		.inr_18			(outr_3_3),
		.ini_18			(outi_3_3),
  		.inr_19			(outr_3_19),
		.ini_19			(outi_3_19),
		.inr_20			(outr_3_5),
		.ini_20			(outi_3_5),
  		.inr_21			(outr_3_21),
		.ini_21			(outi_3_21),
		.inr_22			(outr_3_7),
		.ini_22			(outi_3_7),
  		.inr_23			(outr_3_23),
		.ini_23			(outi_3_23),
		.inr_24			(outr_3_9),
		.ini_24			(outi_3_9),
  		.inr_25			(outr_3_25),
		.ini_25			(outi_3_25),
		.inr_26			(outr_3_11),
		.ini_26			(outi_3_11),
  		.inr_27			(outr_3_27),
		.ini_27			(outi_3_27),
		.inr_28			(outr_3_13),
		.ini_28			(outi_3_13),
  		.inr_29			(outr_3_29),
		.ini_29			(outi_3_29),
		.inr_30			(outr_3_15),
		.ini_30			(outi_3_15),
  		.inr_31			(outr_3_31),
		.ini_31			(outi_3_31),
		.wr_0			(re_0),
		.wi_0			(im_0),
		.wr_1			(re_1),
		.wi_1			(im_1),
		.wr_2			(re_2),
		.wi_2			(im_2),
		.wr_3			(re_3),
		.wi_3			(im_3),
		.wr_4			(re_4),
		.wi_4			(im_4),
		.wr_5			(re_5),
		.wi_5			(im_5),
		.wr_6			(re_6),
		.wi_6			(im_6),
		.wr_7			(re_7),
		.wi_7			(im_7),
		.wr_8			(re_8),
		.wi_8			(im_8),
		.wr_9			(re_9),
		.wi_9			(im_9),
		.wr_10			(re_10),
		.wi_10			(im_10),
		.wr_11			(re_11),
		.wi_11			(im_11),
		.wr_12			(re_12),
		.wi_12			(im_12),
		.wr_13			(re_13),
		.wi_13			(im_13),
		.wr_14			(re_14),
		.wi_14			(im_14),
		.wr_15			(re_15),
		.wi_15			(im_15),
		.outr_0			(outr_0),
		.outi_0			(outi_0),
		.outr_1			(outr_1),
		.outi_1			(outi_1),
		.outr_2			(outr_2),
		.outi_2			(outi_2),
		.outr_3			(outr_3),
		.outi_3			(outi_3),
		.outr_4			(outr_4),
		.outi_4			(outi_4),
		.outr_5			(outr_5),
		.outi_5			(outi_5),
		.outr_6			(outr_6),
		.outi_6			(outi_6),
		.outr_7			(outr_7),
		.outi_7			(outi_7),
		.outr_8			(outr_8),
		.outi_8			(outi_8),
		.outr_9			(outr_9),
		.outi_9			(outi_9),
		.outr_10			(outr_10),
		.outi_10			(outi_10),
		.outr_11			(outr_11),
		.outi_11			(outi_11),
		.outr_12			(outr_12),
		.outi_12			(outi_12),
		.outr_13			(outr_13),
		.outi_13			(outi_13),
		.outr_14			(outr_14),
		.outi_14			(outi_14),
		.outr_15			(outr_15),
		.outi_15			(outi_15),
		.outr_16			(outr_16),
		.outi_16			(outi_16),
		.outr_17			(outr_17),
		.outi_17			(outi_17),
		.outr_18			(outr_18),
		.outi_18			(outi_18),
		.outr_19			(outr_19),
		.outi_19			(outi_19),
		.outr_20			(outr_20),
		.outi_20			(outi_20),
		.outr_21			(outr_21),
		.outi_21			(outi_21),
		.outr_22			(outr_22),
		.outi_22			(outi_22),
		.outr_23			(outr_23),
		.outi_23			(outi_23),
		.outr_24			(outr_24),
		.outi_24			(outi_24),
		.outr_25			(outr_25),
		.outi_25			(outi_25),
		.outr_26			(outr_26),
		.outi_26			(outi_26),
		.outr_27			(outr_27),
		.outi_27			(outi_27),
		.outr_28			(outr_28),
		.outi_28			(outi_28),
		.outr_29			(outr_29),
		.outi_29			(outi_29),
		.outr_30			(outr_30),
		.outi_30			(outi_30),
		.outr_31			(outr_31),
		.outi_31			(outi_31)
);

endmodule