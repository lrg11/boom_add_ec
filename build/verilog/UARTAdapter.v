module UARTAdapter(
  input   clock,
  input   reset,
  input   io_uart_txd,
  output  io_uart_rxd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  txfifo_clock; // @[UARTAdapter.scala 32:22]
  wire  txfifo_reset; // @[UARTAdapter.scala 32:22]
  wire  txfifo_io_enq_ready; // @[UARTAdapter.scala 32:22]
  wire  txfifo_io_enq_valid; // @[UARTAdapter.scala 32:22]
  wire [7:0] txfifo_io_enq_bits; // @[UARTAdapter.scala 32:22]
  wire  txfifo_io_deq_ready; // @[UARTAdapter.scala 32:22]
  wire  txfifo_io_deq_valid; // @[UARTAdapter.scala 32:22]
  wire [7:0] txfifo_io_deq_bits; // @[UARTAdapter.scala 32:22]
  wire [7:0] txfifo_io_count; // @[UARTAdapter.scala 32:22]
  wire  rxfifo_clock; // @[UARTAdapter.scala 33:22]
  wire  rxfifo_reset; // @[UARTAdapter.scala 33:22]
  wire  rxfifo_io_enq_ready; // @[UARTAdapter.scala 33:22]
  wire  rxfifo_io_enq_valid; // @[UARTAdapter.scala 33:22]
  wire [7:0] rxfifo_io_enq_bits; // @[UARTAdapter.scala 33:22]
  wire  rxfifo_io_deq_ready; // @[UARTAdapter.scala 33:22]
  wire  rxfifo_io_deq_valid; // @[UARTAdapter.scala 33:22]
  wire [7:0] rxfifo_io_deq_bits; // @[UARTAdapter.scala 33:22]
  wire [7:0] rxfifo_io_count; // @[UARTAdapter.scala 33:22]
  wire  sim_clock; // @[UARTAdapter.scala 108:19]
  wire  sim_reset; // @[UARTAdapter.scala 108:19]
  wire  sim_serial_in_ready; // @[UARTAdapter.scala 108:19]
  wire  sim_serial_in_valid; // @[UARTAdapter.scala 108:19]
  wire [7:0] sim_serial_in_bits; // @[UARTAdapter.scala 108:19]
  wire  sim_serial_out_ready; // @[UARTAdapter.scala 108:19]
  wire  sim_serial_out_valid; // @[UARTAdapter.scala 108:19]
  wire [7:0] sim_serial_out_bits; // @[UARTAdapter.scala 108:19]
  reg [1:0] txState; // @[UARTAdapter.scala 38:24]
  reg [7:0] txData; // @[UARTAdapter.scala 39:19]
  wire  _T_1 = txState == 2'h2 & txfifo_io_enq_ready; // @[UARTAdapter.scala 41:61]
  reg [2:0] txDataIdx; // @[Counter.scala 60:40]
  wire  wrap_wrap = txDataIdx == 3'h7; // @[Counter.scala 72:24]
  wire [2:0] _wrap_value_T_1 = txDataIdx + 3'h1; // @[Counter.scala 76:24]
  wire  txDataWrap = _T_1 & wrap_wrap; // @[Counter.scala 118:17 Counter.scala 118:24]
  wire  _T_3 = txState == 2'h1 & txfifo_io_enq_ready; // @[UARTAdapter.scala 43:63]
  reg [9:0] txBaudCount; // @[Counter.scala 60:40]
  wire  wrap_wrap_1 = txBaudCount == 10'h363; // @[Counter.scala 72:24]
  wire [9:0] _wrap_value_T_3 = txBaudCount + 10'h1; // @[Counter.scala 76:24]
  wire  txBaudWrap = _T_3 & wrap_wrap_1; // @[Counter.scala 118:17 Counter.scala 118:24]
  wire  _T_7 = txState == 2'h0 & ~io_uart_txd & txfifo_io_enq_ready; // @[UARTAdapter.scala 44:88]
  reg [1:0] txSlackCount; // @[Counter.scala 60:40]
  wire  wrap_wrap_2 = txSlackCount == 2'h3; // @[Counter.scala 72:24]
  wire [1:0] _wrap_value_T_5 = txSlackCount + 2'h1; // @[Counter.scala 76:24]
  wire  txSlackWrap = _T_7 & wrap_wrap_2; // @[Counter.scala 118:17 Counter.scala 118:24]
  wire  _T_8 = 2'h0 == txState; // @[Conditional.scala 37:30]
  wire  _T_9 = 2'h1 == txState; // @[Conditional.scala 37:30]
  wire  _T_10 = 2'h2 == txState; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_35 = {{7'd0}, io_uart_txd}; // @[UARTAdapter.scala 60:41]
  wire [7:0] _T_11 = _GEN_35 << txDataIdx; // @[UARTAdapter.scala 60:41]
  wire [7:0] _T_12 = txData | _T_11; // @[UARTAdapter.scala 60:26]
  wire [1:0] _T_14 = io_uart_txd ? 2'h0 : 2'h3; // @[UARTAdapter.scala 63:23]
  wire [1:0] _GEN_11 = txfifo_io_enq_ready ? 2'h1 : txState; // @[UARTAdapter.scala 64:39 UARTAdapter.scala 65:17 UARTAdapter.scala 38:24]
  wire [1:0] _GEN_12 = txDataWrap ? _T_14 : _GEN_11; // @[UARTAdapter.scala 62:24 UARTAdapter.scala 63:17]
  wire  _T_15 = 2'h3 == txState; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_13 = io_uart_txd & txfifo_io_enq_ready ? 2'h0 : txState; // @[UARTAdapter.scala 69:56 UARTAdapter.scala 70:17 UARTAdapter.scala 38:24]
  wire [1:0] _GEN_14 = _T_15 ? _GEN_13 : txState; // @[Conditional.scala 39:67 UARTAdapter.scala 38:24]
  reg [1:0] rxState; // @[UARTAdapter.scala 79:24]
  reg [9:0] rxBaudCount; // @[Counter.scala 60:40]
  wire  wrap_wrap_3 = rxBaudCount == 10'h363; // @[Counter.scala 72:24]
  wire [9:0] _wrap_value_T_7 = rxBaudCount + 10'h1; // @[Counter.scala 76:24]
  wire  rxBaudWrap = txfifo_io_enq_ready & wrap_wrap_3; // @[Counter.scala 118:17 Counter.scala 118:24]
  wire  _T_18 = rxState == 2'h2; // @[UARTAdapter.scala 83:49]
  wire  _T_20 = rxState == 2'h2 & txfifo_io_enq_ready & rxBaudWrap; // @[UARTAdapter.scala 83:84]
  reg [2:0] rxDataIdx; // @[Counter.scala 60:40]
  wire  wrap_wrap_4 = rxDataIdx == 3'h7; // @[Counter.scala 72:24]
  wire [2:0] _wrap_value_T_9 = rxDataIdx + 3'h1; // @[Counter.scala 76:24]
  wire  rxDataWrap = _T_20 & wrap_wrap_4; // @[Counter.scala 118:17 Counter.scala 118:24]
  wire  _T_21 = 2'h0 == rxState; // @[Conditional.scala 37:30]
  wire  _T_23 = 2'h1 == rxState; // @[Conditional.scala 37:30]
  wire  _T_24 = 2'h2 == rxState; // @[Conditional.scala 37:30]
  wire [7:0] _T_25 = rxfifo_io_deq_bits >> rxDataIdx; // @[UARTAdapter.scala 100:42]
  wire [1:0] _GEN_28 = rxDataWrap & rxBaudWrap ? 2'h0 : rxState; // @[UARTAdapter.scala 101:38 UARTAdapter.scala 102:17 UARTAdapter.scala 79:24]
  wire  _GEN_29 = _T_24 ? _T_25[0] : 1'h1; // @[Conditional.scala 39:67 UARTAdapter.scala 100:19 UARTAdapter.scala 85:15]
  wire  _GEN_31 = _T_23 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67 UARTAdapter.scala 94:19]
  Queue_37 txfifo ( // @[UARTAdapter.scala 32:22]
    .clock(txfifo_clock),
    .reset(txfifo_reset),
    .io_enq_ready(txfifo_io_enq_ready),
    .io_enq_valid(txfifo_io_enq_valid),
    .io_enq_bits(txfifo_io_enq_bits),
    .io_deq_ready(txfifo_io_deq_ready),
    .io_deq_valid(txfifo_io_deq_valid),
    .io_deq_bits(txfifo_io_deq_bits),
    .io_count(txfifo_io_count)
  );
  Queue_37 rxfifo ( // @[UARTAdapter.scala 33:22]
    .clock(rxfifo_clock),
    .reset(rxfifo_reset),
    .io_enq_ready(rxfifo_io_enq_ready),
    .io_enq_valid(rxfifo_io_enq_valid),
    .io_enq_bits(rxfifo_io_enq_bits),
    .io_deq_ready(rxfifo_io_deq_ready),
    .io_deq_valid(rxfifo_io_deq_valid),
    .io_deq_bits(rxfifo_io_deq_bits),
    .io_count(rxfifo_io_count)
  );
  SimUART #(.UARTNO(0)) sim ( // @[UARTAdapter.scala 108:19]
    .clock(sim_clock),
    .reset(sim_reset),
    .serial_in_ready(sim_serial_in_ready),
    .serial_in_valid(sim_serial_in_valid),
    .serial_in_bits(sim_serial_in_bits),
    .serial_out_ready(sim_serial_out_ready),
    .serial_out_valid(sim_serial_out_valid),
    .serial_out_bits(sim_serial_out_bits)
  );
  assign io_uart_rxd = _T_21 | _GEN_31; // @[Conditional.scala 40:58 UARTAdapter.scala 88:19]
  assign txfifo_clock = clock;
  assign txfifo_reset = reset;
  assign txfifo_io_enq_valid = _T_1 & wrap_wrap; // @[Counter.scala 118:17 Counter.scala 118:24]
  assign txfifo_io_enq_bits = txData; // @[UARTAdapter.scala 75:23]
  assign txfifo_io_deq_ready = sim_serial_out_ready; // @[UARTAdapter.scala 115:23]
  assign rxfifo_clock = clock;
  assign rxfifo_reset = reset;
  assign rxfifo_io_enq_valid = sim_serial_in_valid; // @[UARTAdapter.scala 118:23]
  assign rxfifo_io_enq_bits = sim_serial_in_bits; // @[UARTAdapter.scala 117:22]
  assign rxfifo_io_deq_ready = _T_18 & rxDataWrap & rxBaudWrap & txfifo_io_enq_ready; // @[UARTAdapter.scala 106:76]
  assign sim_clock = clock; // @[UARTAdapter.scala 110:16]
  assign sim_reset = reset; // @[UARTAdapter.scala 111:25]
  assign sim_serial_in_ready = rxfifo_io_enq_ready; // @[UARTAdapter.scala 119:26]
  assign sim_serial_out_valid = txfifo_io_deq_valid; // @[UARTAdapter.scala 114:27]
  assign sim_serial_out_bits = txfifo_io_deq_bits; // @[UARTAdapter.scala 113:26]
  always @(posedge clock) begin
    if (reset) begin // @[UARTAdapter.scala 38:24]
      txState <= 2'h0; // @[UARTAdapter.scala 38:24]
    end else if (_T_8) begin // @[Conditional.scala 40:58]
      if (txSlackWrap) begin // @[UARTAdapter.scala 48:25]
        txState <= 2'h1; // @[UARTAdapter.scala 50:17]
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      if (txBaudWrap) begin // @[UARTAdapter.scala 54:24]
        txState <= 2'h2; // @[UARTAdapter.scala 55:17]
      end
    end else if (_T_10) begin // @[Conditional.scala 39:67]
      txState <= _GEN_12;
    end else begin
      txState <= _GEN_14;
    end
    if (_T_8) begin // @[Conditional.scala 40:58]
      if (txSlackWrap) begin // @[UARTAdapter.scala 48:25]
        txData <= 8'h0; // @[UARTAdapter.scala 49:17]
      end
    end else if (!(_T_9)) begin // @[Conditional.scala 39:67]
      if (_T_10) begin // @[Conditional.scala 39:67]
        if (txfifo_io_enq_ready) begin // @[UARTAdapter.scala 59:34]
          txData <= _T_12; // @[UARTAdapter.scala 60:16]
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      txDataIdx <= 3'h0; // @[Counter.scala 60:40]
    end else if (_T_1) begin // @[Counter.scala 118:17]
      txDataIdx <= _wrap_value_T_1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Counter.scala 60:40]
      txBaudCount <= 10'h0; // @[Counter.scala 60:40]
    end else if (_T_3) begin // @[Counter.scala 118:17]
      if (wrap_wrap_1) begin // @[Counter.scala 86:20]
        txBaudCount <= 10'h0; // @[Counter.scala 86:28]
      end else begin
        txBaudCount <= _wrap_value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      txSlackCount <= 2'h0; // @[Counter.scala 60:40]
    end else if (_T_7) begin // @[Counter.scala 118:17]
      txSlackCount <= _wrap_value_T_5; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[UARTAdapter.scala 79:24]
      rxState <= 2'h0; // @[UARTAdapter.scala 79:24]
    end else if (_T_21) begin // @[Conditional.scala 40:58]
      if (rxBaudWrap & rxfifo_io_deq_valid) begin // @[UARTAdapter.scala 89:48]
        rxState <= 2'h1; // @[UARTAdapter.scala 90:17]
      end
    end else if (_T_23) begin // @[Conditional.scala 39:67]
      if (rxBaudWrap) begin // @[UARTAdapter.scala 95:24]
        rxState <= 2'h2; // @[UARTAdapter.scala 96:17]
      end
    end else if (_T_24) begin // @[Conditional.scala 39:67]
      rxState <= _GEN_28;
    end
    if (reset) begin // @[Counter.scala 60:40]
      rxBaudCount <= 10'h0; // @[Counter.scala 60:40]
    end else if (txfifo_io_enq_ready) begin // @[Counter.scala 118:17]
      if (wrap_wrap_3) begin // @[Counter.scala 86:20]
        rxBaudCount <= 10'h0; // @[Counter.scala 86:28]
      end else begin
        rxBaudCount <= _wrap_value_T_7; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      rxDataIdx <= 3'h0; // @[Counter.scala 60:40]
    end else if (_T_20) begin // @[Counter.scala 118:17]
      rxDataIdx <= _wrap_value_T_9; // @[Counter.scala 76:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  txState = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  txData = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  txDataIdx = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  txBaudCount = _RAND_3[9:0];
  _RAND_4 = {1{`RANDOM}};
  txSlackCount = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  rxState = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  rxBaudCount = _RAND_6[9:0];
  _RAND_7 = {1{`RANDOM}};
  rxDataIdx = _RAND_7[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
