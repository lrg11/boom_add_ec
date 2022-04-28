module UARTTx(
  input         clock,
  input         reset,
  input         io_en,
  output        io_in_ready,
  input         io_in_valid,
  input  [7:0]  io_in_bits,
  output        io_out,
  input  [15:0] io_div,
  input         io_nstop,
  output        io_tx_busy
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] plusarg_reader_out; // @[PlusArg.scala 80:11]
  reg [15:0] prescaler; // @[UARTTx.scala 23:22]
  wire  pulse = prescaler == 16'h0; // @[UARTTx.scala 24:26]
  reg [3:0] counter; // @[UARTTx.scala 27:20]
  reg [8:0] shifter; // @[UARTTx.scala 28:20]
  reg  out; // @[UARTTx.scala 29:16]
  wire  plusarg_tx = |plusarg_reader_out; // @[UARTTx.scala 32:90]
  wire  busy = counter != 4'h0; // @[UARTTx.scala 34:23]
  wire  _T_2 = io_in_ready & io_in_valid; // @[Decoupled.scala 40:37]
  wire [9:0] _T_7 = {1'h1,io_in_bits,1'h0}; // @[Cat.scala 30:58]
  wire  _T_8 = ~io_nstop; // @[UARTTx.scala 57:19]
  wire [3:0] _T_10 = _T_8 ? 4'ha : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_11 = io_nstop ? 4'hb : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_12 = _T_10 | _T_11; // @[Mux.scala 27:72]
  wire [3:0] _T_14 = _T_12 - 4'h0; // @[UARTTx.scala 57:53]
  wire [9:0] _GEN_0 = _T_2 & plusarg_tx ? _T_7 : {{1'd0}, shifter}; // @[UARTTx.scala 40:37 UARTTx.scala 55:15 UARTTx.scala 28:20]
  wire [15:0] _T_17 = prescaler - 16'h1; // @[UARTTx.scala 61:78]
  wire [3:0] _T_21 = counter - 4'h1; // @[UARTTx.scala 64:24]
  wire [7:0] lo = shifter[8:1]; // @[UARTTx.scala 65:40]
  wire [8:0] _T_22 = {1'h1,lo}; // @[Cat.scala 30:58]
  wire [9:0] _GEN_4 = pulse & busy ? {{1'd0}, _T_22} : _GEN_0; // @[UARTTx.scala 63:24 UARTTx.scala 65:13]
  wire  _GEN_5 = pulse & busy ? shifter[0] : out; // @[UARTTx.scala 63:24 UARTTx.scala 66:9 UARTTx.scala 29:16]
  plusarg_reader #(.FORMAT("uart_tx=%d"), .DEFAULT(1), .WIDTH(32)) plusarg_reader ( // @[PlusArg.scala 80:11]
    .out(plusarg_reader_out)
  );
  assign io_in_ready = io_en & ~busy; // @[UARTTx.scala 35:24]
  assign io_out = out; // @[UARTTx.scala 30:10]
  assign io_tx_busy = counter != 4'h0; // @[UARTTx.scala 34:23]
  always @(posedge clock) begin
    if (reset) begin // @[UARTTx.scala 23:22]
      prescaler <= 16'h0; // @[UARTTx.scala 23:22]
    end else if (busy) begin // @[UARTTx.scala 60:15]
      if (pulse) begin // @[UARTTx.scala 61:21]
        prescaler <= io_div;
      end else begin
        prescaler <= _T_17;
      end
    end
    if (reset) begin // @[UARTTx.scala 27:20]
      counter <= 4'h0; // @[UARTTx.scala 27:20]
    end else if (pulse & busy) begin // @[UARTTx.scala 63:24]
      counter <= _T_21; // @[UARTTx.scala 64:13]
    end else if (_T_2 & plusarg_tx) begin // @[UARTTx.scala 40:37]
      counter <= _T_14; // @[UARTTx.scala 56:15]
    end
    shifter <= _GEN_4[8:0];
    out <= reset | _GEN_5; // @[UARTTx.scala 29:16 UARTTx.scala 29:16]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2 & ~reset) begin
          $fwrite(32'h80000002,"UART TX (%x): %c\n",io_in_bits,io_in_bits); // @[UARTTx.scala 38:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  prescaler = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  counter = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  shifter = _RAND_2[8:0];
  _RAND_3 = {1{`RANDOM}};
  out = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
