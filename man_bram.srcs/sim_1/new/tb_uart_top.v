`timescale 1ns/1ps

module tb_design_1;

  // DUT ports
  reg  clk_in1_0      = 0;
  reg  ext_reset_in_0 = 1;
  reg  UART_RXD_0;
  wire UART_TXD_0;

  // Instantiate the block-design wrapper
  design_1_wrapper DUT (
    .UART_RXD_0    (UART_RXD_0),
    .UART_TXD_0    (UART_TXD_0),
    .clk_in1_0     (clk_in1_0),
    .ext_reset_in_0(ext_reset_in_0)
  );

  // 100 MHz system clock (10 ns period)
  always #5 clk_in1_0 = ~clk_in1_0;

  // Initialize and release reset, initialize UART RX line
  initial begin
    UART_RXD_0     = 1'b1;   // idle high
    ext_reset_in_0 = 1'b1;   // assert reset (active high)
    #200;
    ext_reset_in_0 = 1'b0;   // release reset
  end

  // UART send task (115200 baud, 1 start, 8 data, 1 stop, LSB first)
  task send_uart_byte(input [7:0] data);
    integer i;
    integer bit_time;
    begin
      bit_time = 8680;              // ~8.680 us in ns (100 MHz / 115200)
      // start bit
      UART_RXD_0 = 1'b0;
      #(bit_time);
      // 8 data bits, LSB first
      for (i = 0; i < 8; i = i+1) begin
        UART_RXD_0 = data[i];
        #(bit_time);
      end
      // stop bit
      UART_RXD_0 = 1'b1;
      #(bit_time);
    end
  endtask

  // Pack and send a 64-bit IEEE-754 double as 8 UART bytes
  task send_double(input real value);
    reg [63:0] bits;
    integer i;
    begin
      bits = $realtobits(value);    // reinterpret real as 64-bit
      // MSB first so first byte becomes high byte in shift_reg (matches your FSM)
      for (i = 7; i >= 0; i = i-1) begin
        send_uart_byte(bits[i*8 +: 8]);
      end
    end
  endtask

  // Stimulus
  initial begin
    // Wait until reset is deasserted
    @(negedge ext_reset_in_0);
    #1000;

    // First sanity test: single known byte
    send_uart_byte(8'hA5);

    // Wait long enough to see DOUT/DOUT_VLD change
    #200000;

    // Then send one 64-bit double
    send_double(3.14159);

    // Run a bit longer to see RAM write etc.
    #500000;
    $stop;
  end

endmodule
