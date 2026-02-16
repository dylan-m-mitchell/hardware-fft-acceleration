module RAM_2port_tb();
    // Clock
    reg r_clk = 1'b0;
    
    // Write Interface
    reg [7:0]   r_Wr_Addr = 8'b0;
    reg         r_Wr_DV = 1'b0;
    reg [191:0] r_Wr_Data = 192'b0;
    
    // Read Interface
    reg [7:0]   r_Rd_Addr = 8'b0;
    reg         r_Rd_En = 1'b0;
    reg         r_Rd_Sel = 1'b0;  // 0 = lower 128 bits, 1 = upper 64 bits
    wire        w_Rd_DV;
    wire [63:0] w_Rd_Data_64;
    wire [127:0] w_Rd_Data_128;
    
    // Clock generation
    always #5 r_clk <= ~r_clk;

    RAM_2Port #(.WIDTH(192), .DEPTH(256)) UUT
        (
        // Write Interface
        .i_Wr_Clk(r_clk),
        .i_Wr_Addr(r_Wr_Addr),
        .i_Wr_DV(r_Wr_DV),
        .i_Wr_Data(r_Wr_Data),
        // Read Interface
        .i_Rd_Clk(r_clk),
        .i_Rd_Addr(r_Rd_Addr),
        .i_Rd_En(r_Rd_En),
        .o_Rd_DV(w_Rd_DV),
        .o_Rd_Data_64(w_Rd_Data_64),
        .o_Rd_Data_128(w_Rd_Data_128)
        );

        initial begin

            r_Rd_En <= 1'b1;
            r_Rd_Addr <= r_Wr_Addr; 

            #10;
            
            r_Rd_En <= 1'b0;
            r_Wr_Data <= { {8{8'hAA}}, {16{8'hBB}} };
            r_Wr_DV <= 1'b1;
            
            #10;  // Wait 1 clock cycle (pulse for one cycle)
            r_Wr_DV <= 1'b0;
            
            #10;  // Wait 1 more clock cycle
            
            // Read upper 64 bits (A values)
            r_Rd_En <= 1'b1;
            r_Rd_Addr <= r_Wr_Addr;  // Read from same address
            
            #10;  // Wait for read data
            
            r_Rd_En <= 1'b0;
            
            #10;  // Wait for read data

            r_Wr_Data <= { {8{8'hCC}}, {16{8'hDD}} };
            r_Wr_Addr <= r_Wr_Addr + 1;

            #10;

            r_Wr_DV <= 1'b1;
            
            #10;  // Wait 1 clock cycle (pulse for one cycle)
            r_Wr_DV <= 1'b0;
            
            #10;  // Wait 1 more clock cycle
            
            // Read upper 64 bits (C values)
            r_Rd_En <= 1'b1;
            r_Rd_Addr <= r_Wr_Addr;
            
            #10;  // Wait for read data
            r_Rd_En <= 1'b0;
            r_Rd_Addr <= r_Wr_Addr - 1;
            
            #10;  // Wait for read data
            
            r_Rd_En <= 1'b1;
            
            $finish;
        end

endmodule