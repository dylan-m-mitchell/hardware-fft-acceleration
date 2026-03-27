`timescale 1ns / 1ps

module ram_to_fft256_bridge_tb;
    localparam integer DEPTH = 256;
    localparam integer TIMEOUT_CYCLES = 5000;

    reg          i_clk;
    reg          i_rst_n;
    reg          i_start;

    wire         o_ram_rd_en;
    wire [7:0]   o_ram_rd_addr;
    reg          i_ram_rd_dv;
    reg [127:0]  i_ram_rd_data;

    wire         o_ram_wr_en;
    wire [7:0]   o_ram_wr_addr;
    wire [127:0] o_ram_wr_data;

    wire         o_done;

    reg [127:0] ram_in  [0:DEPTH-1];
    reg [127:0] ram_out [0:DEPTH-1];

    integer i;
    integer out_fd;
    integer cycles;

    ram_to_fft256_bridge #(
        .DEPTH(DEPTH)
    ) dut (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_start(i_start),
        .o_ram_rd_en(o_ram_rd_en),
        .o_ram_rd_addr(o_ram_rd_addr),
        .i_ram_rd_dv(i_ram_rd_dv),
        .i_ram_rd_data(i_ram_rd_data),
        .o_ram_wr_en(o_ram_wr_en),
        .o_ram_wr_addr(o_ram_wr_addr),
        .o_ram_wr_data(o_ram_wr_data),
        .o_done(o_done)
    );

    always #5 i_clk = ~i_clk;

    // Simple RAM read model: valid in same cycle as read enable.
    always @(*) begin
        i_ram_rd_dv = o_ram_rd_en;
        i_ram_rd_data = ram_in[o_ram_rd_addr];
    end

    // Capture DUT writes to output RAM model.
    always @(posedge i_clk) begin
        if (o_ram_wr_en) begin
            ram_out[o_ram_wr_addr] <= o_ram_wr_data;
        end
    end

    initial begin
        i_clk = 1'b0;
        i_rst_n = 1'b0;
        i_start = 1'b0;
        cycles = 0;

        for (i = 0; i < DEPTH; i = i + 1) begin
            ram_out[i] = 128'd0;
        end

        $readmemh("ram_to_fft256_bridge_input.hex", ram_in);

        repeat (5) @(posedge i_clk);
        i_rst_n <= 1'b1;

        @(posedge i_clk);
        i_start <= 1'b1;
        @(posedge i_clk);
        i_start <= 1'b0;

        while (!o_done && cycles < TIMEOUT_CYCLES) begin
            @(posedge i_clk);
            cycles = cycles + 1;
        end

        if (!o_done) begin
            $fatal(1, "Timeout waiting for o_done");
        end

        out_fd = $fopen("ram_to_fft256_bridge_output.hex", "w");
        if (out_fd == 0) begin
            $fatal(1, "Failed to open output file");
        end

        for (i = 0; i < DEPTH; i = i + 1) begin
            $fwrite(out_fd, "%032x\n", ram_out[i]);
        end
        $fclose(out_fd);

        $display("Simulation complete. Output written to ram_to_fft256_bridge_output.hex");
        $finish;
    end

endmodule
