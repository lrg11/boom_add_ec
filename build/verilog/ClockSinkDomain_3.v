module ClockSinkDomain_3(
  output        auto_uart_0_int_xing_out_sync_0,
  output        auto_uart_0_control_xing_in_a_ready,
  input         auto_uart_0_control_xing_in_a_valid,
  input  [2:0]  auto_uart_0_control_xing_in_a_bits_opcode,
  input  [2:0]  auto_uart_0_control_xing_in_a_bits_param,
  input  [1:0]  auto_uart_0_control_xing_in_a_bits_size,
  input  [8:0]  auto_uart_0_control_xing_in_a_bits_source,
  input  [30:0] auto_uart_0_control_xing_in_a_bits_address,
  input  [7:0]  auto_uart_0_control_xing_in_a_bits_mask,
  input  [63:0] auto_uart_0_control_xing_in_a_bits_data,
  input         auto_uart_0_control_xing_in_a_bits_corrupt,
  input         auto_uart_0_control_xing_in_d_ready,
  output        auto_uart_0_control_xing_in_d_valid,
  output [2:0]  auto_uart_0_control_xing_in_d_bits_opcode,
  output [1:0]  auto_uart_0_control_xing_in_d_bits_param,
  output [1:0]  auto_uart_0_control_xing_in_d_bits_size,
  output [8:0]  auto_uart_0_control_xing_in_d_bits_source,
  output        auto_uart_0_control_xing_in_d_bits_sink,
  output        auto_uart_0_control_xing_in_d_bits_denied,
  output [63:0] auto_uart_0_control_xing_in_d_bits_data,
  output        auto_uart_0_control_xing_in_d_bits_corrupt,
  output        auto_uart_0_io_out_txd,
  input         auto_uart_0_io_out_rxd,
  input         auto_clock_in_clock,
  input         auto_clock_in_reset,
  output        clock,
  output        reset
);
  wire  uart_0_clock; // @[UART.scala 243:51]
  wire  uart_0_reset; // @[UART.scala 243:51]
  wire  uart_0_auto_int_xing_out_sync_0; // @[UART.scala 243:51]
  wire  uart_0_auto_control_xing_in_a_ready; // @[UART.scala 243:51]
  wire  uart_0_auto_control_xing_in_a_valid; // @[UART.scala 243:51]
  wire [2:0] uart_0_auto_control_xing_in_a_bits_opcode; // @[UART.scala 243:51]
  wire [2:0] uart_0_auto_control_xing_in_a_bits_param; // @[UART.scala 243:51]
  wire [1:0] uart_0_auto_control_xing_in_a_bits_size; // @[UART.scala 243:51]
  wire [8:0] uart_0_auto_control_xing_in_a_bits_source; // @[UART.scala 243:51]
  wire [30:0] uart_0_auto_control_xing_in_a_bits_address; // @[UART.scala 243:51]
  wire [7:0] uart_0_auto_control_xing_in_a_bits_mask; // @[UART.scala 243:51]
  wire [63:0] uart_0_auto_control_xing_in_a_bits_data; // @[UART.scala 243:51]
  wire  uart_0_auto_control_xing_in_a_bits_corrupt; // @[UART.scala 243:51]
  wire  uart_0_auto_control_xing_in_d_ready; // @[UART.scala 243:51]
  wire  uart_0_auto_control_xing_in_d_valid; // @[UART.scala 243:51]
  wire [2:0] uart_0_auto_control_xing_in_d_bits_opcode; // @[UART.scala 243:51]
  wire [1:0] uart_0_auto_control_xing_in_d_bits_param; // @[UART.scala 243:51]
  wire [1:0] uart_0_auto_control_xing_in_d_bits_size; // @[UART.scala 243:51]
  wire [8:0] uart_0_auto_control_xing_in_d_bits_source; // @[UART.scala 243:51]
  wire  uart_0_auto_control_xing_in_d_bits_sink; // @[UART.scala 243:51]
  wire  uart_0_auto_control_xing_in_d_bits_denied; // @[UART.scala 243:51]
  wire [63:0] uart_0_auto_control_xing_in_d_bits_data; // @[UART.scala 243:51]
  wire  uart_0_auto_control_xing_in_d_bits_corrupt; // @[UART.scala 243:51]
  wire  uart_0_auto_io_out_txd; // @[UART.scala 243:51]
  wire  uart_0_auto_io_out_rxd; // @[UART.scala 243:51]
  TLUART uart_0 ( // @[UART.scala 243:51]
    .clock(uart_0_clock),
    .reset(uart_0_reset),
    .auto_int_xing_out_sync_0(uart_0_auto_int_xing_out_sync_0),
    .auto_control_xing_in_a_ready(uart_0_auto_control_xing_in_a_ready),
    .auto_control_xing_in_a_valid(uart_0_auto_control_xing_in_a_valid),
    .auto_control_xing_in_a_bits_opcode(uart_0_auto_control_xing_in_a_bits_opcode),
    .auto_control_xing_in_a_bits_param(uart_0_auto_control_xing_in_a_bits_param),
    .auto_control_xing_in_a_bits_size(uart_0_auto_control_xing_in_a_bits_size),
    .auto_control_xing_in_a_bits_source(uart_0_auto_control_xing_in_a_bits_source),
    .auto_control_xing_in_a_bits_address(uart_0_auto_control_xing_in_a_bits_address),
    .auto_control_xing_in_a_bits_mask(uart_0_auto_control_xing_in_a_bits_mask),
    .auto_control_xing_in_a_bits_data(uart_0_auto_control_xing_in_a_bits_data),
    .auto_control_xing_in_a_bits_corrupt(uart_0_auto_control_xing_in_a_bits_corrupt),
    .auto_control_xing_in_d_ready(uart_0_auto_control_xing_in_d_ready),
    .auto_control_xing_in_d_valid(uart_0_auto_control_xing_in_d_valid),
    .auto_control_xing_in_d_bits_opcode(uart_0_auto_control_xing_in_d_bits_opcode),
    .auto_control_xing_in_d_bits_param(uart_0_auto_control_xing_in_d_bits_param),
    .auto_control_xing_in_d_bits_size(uart_0_auto_control_xing_in_d_bits_size),
    .auto_control_xing_in_d_bits_source(uart_0_auto_control_xing_in_d_bits_source),
    .auto_control_xing_in_d_bits_sink(uart_0_auto_control_xing_in_d_bits_sink),
    .auto_control_xing_in_d_bits_denied(uart_0_auto_control_xing_in_d_bits_denied),
    .auto_control_xing_in_d_bits_data(uart_0_auto_control_xing_in_d_bits_data),
    .auto_control_xing_in_d_bits_corrupt(uart_0_auto_control_xing_in_d_bits_corrupt),
    .auto_io_out_txd(uart_0_auto_io_out_txd),
    .auto_io_out_rxd(uart_0_auto_io_out_rxd)
  );
  assign auto_uart_0_int_xing_out_sync_0 = uart_0_auto_int_xing_out_sync_0; // @[LazyModule.scala 311:12]
  assign auto_uart_0_control_xing_in_a_ready = uart_0_auto_control_xing_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_uart_0_control_xing_in_d_valid = uart_0_auto_control_xing_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_uart_0_control_xing_in_d_bits_opcode = uart_0_auto_control_xing_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_uart_0_control_xing_in_d_bits_param = uart_0_auto_control_xing_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_uart_0_control_xing_in_d_bits_size = uart_0_auto_control_xing_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_uart_0_control_xing_in_d_bits_source = uart_0_auto_control_xing_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_uart_0_control_xing_in_d_bits_sink = uart_0_auto_control_xing_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_uart_0_control_xing_in_d_bits_denied = uart_0_auto_control_xing_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_uart_0_control_xing_in_d_bits_data = uart_0_auto_control_xing_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_uart_0_control_xing_in_d_bits_corrupt = uart_0_auto_control_xing_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign auto_uart_0_io_out_txd = uart_0_auto_io_out_txd; // @[LazyModule.scala 311:12]
  assign clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign uart_0_clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign uart_0_reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign uart_0_auto_control_xing_in_a_valid = auto_uart_0_control_xing_in_a_valid; // @[LazyModule.scala 309:16]
  assign uart_0_auto_control_xing_in_a_bits_opcode = auto_uart_0_control_xing_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign uart_0_auto_control_xing_in_a_bits_param = auto_uart_0_control_xing_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign uart_0_auto_control_xing_in_a_bits_size = auto_uart_0_control_xing_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign uart_0_auto_control_xing_in_a_bits_source = auto_uart_0_control_xing_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign uart_0_auto_control_xing_in_a_bits_address = auto_uart_0_control_xing_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign uart_0_auto_control_xing_in_a_bits_mask = auto_uart_0_control_xing_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign uart_0_auto_control_xing_in_a_bits_data = auto_uart_0_control_xing_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign uart_0_auto_control_xing_in_a_bits_corrupt = auto_uart_0_control_xing_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign uart_0_auto_control_xing_in_d_ready = auto_uart_0_control_xing_in_d_ready; // @[LazyModule.scala 309:16]
  assign uart_0_auto_io_out_rxd = auto_uart_0_io_out_rxd; // @[LazyModule.scala 311:12]
endmodule
