module UARTRx(
  input         clock,
  input         reset,
  input         io_en,
  input         io_in,
  output        io_out_valid,
  output [7:0]  io_out_bits,
  input  [15:0] io_div
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
  reg [1:0] debounce; // @[UARTRx.scala 24:21]
  wire  debounce_max = debounce == 2'h3; // @[UARTRx.scala 25:32]
  wire  debounce_min = debounce == 2'h0; // @[UARTRx.scala 26:32]
  reg [12:0] prescaler; // @[UARTRx.scala 28:22]
  wire  pulse = prescaler == 13'h0; // @[UARTRx.scala 30:26]
  reg [3:0] data_count; // @[UARTRx.scala 34:23]
  wire  data_last = data_count == 4'h0; // @[UARTRx.scala 35:31]
  reg [3:0] sample_count; // @[UARTRx.scala 37:25]
  wire  sample_mid = sample_count == 4'h7; // @[UARTRx.scala 38:34]
  wire [7:0] _T_1 = {data_count,sample_count}; // @[Cat.scala 30:58]
  wire [7:0] countdown = _T_1 - 8'h1; // @[UARTRx.scala 40:49]
  wire [3:0] remainder = io_div[3:0]; // @[UARTRx.scala 45:25]
  wire  extend = sample_count < remainder; // @[UARTRx.scala 46:30]
  reg  state; // @[UARTRx.scala 61:18]
  wire  _T_14 = ~state; // @[Conditional.scala 37:30]
  wire  _T_21 = ~io_in; // @[UARTRx.scala 68:13]
  wire  _GEN_8 = ~io_in & debounce_max; // @[UARTRx.scala 68:21]
  wire  start = _T_14 & _GEN_8; // @[Conditional.scala 40:58]
  wire  restore = start | pulse; // @[UARTRx.scala 47:23]
  wire [12:0] prescaler_in = restore ? {{1'd0}, io_div[15:4]} : prescaler; // @[UARTRx.scala 48:25]
  wire  _T_5 = restore & extend ? 1'h0 : 1'h1; // @[UARTRx.scala 49:42]
  wire [12:0] _GEN_41 = {{12'd0}, _T_5}; // @[UARTRx.scala 49:37]
  wire [12:0] prescaler_next = prescaler_in - _GEN_41; // @[UARTRx.scala 49:37]
  reg [2:0] sample; // @[UARTRx.scala 51:19]
  wire  _T_10 = sample[0] & sample[1]; // @[Misc.scala 166:48]
  wire  _T_11 = sample[0] & sample[2]; // @[Misc.scala 166:48]
  wire  _T_13 = sample[1] & sample[2]; // @[Misc.scala 166:48]
  wire  voter = _T_10 | _T_11 | _T_13; // @[Misc.scala 167:22]
  reg [7:0] shifter; // @[UARTRx.scala 53:20]
  reg  valid; // @[UARTRx.scala 55:18]
  wire [1:0] _T_20 = debounce - 2'h1; // @[UARTRx.scala 66:30]
  wire [1:0] _GEN_0 = ~_T_21 & ~debounce_min ? _T_20 : debounce; // @[UARTRx.scala 65:41 UARTRx.scala 66:18 UARTRx.scala 24:21]
  wire [1:0] _T_23 = debounce + 2'h1; // @[UARTRx.scala 69:30]
  wire [3:0] _hi_T_3 = 4'h9 - 4'h0; // @[UARTRx.scala 74:94]
  wire  _GEN_1 = debounce_max | state; // @[UARTRx.scala 70:29 UARTRx.scala 71:17 UARTRx.scala 61:18]
  wire [3:0] _T_25 = {sample,io_in}; // @[Cat.scala 30:58]
  wire [6:0] lo = shifter[7:1]; // @[UARTRx.scala 106:45]
  wire [7:0] _T_26 = {voter,lo}; // @[Cat.scala 30:58]
  wire  _GEN_12 = data_last ? 1'h0 : state; // @[UARTRx.scala 102:30 UARTRx.scala 103:21 UARTRx.scala 61:18]
  wire [7:0] _GEN_14 = data_last ? shifter : _T_26; // @[UARTRx.scala 102:30 UARTRx.scala 53:20 UARTRx.scala 106:23]
  wire  _GEN_15 = sample_mid ? _GEN_12 : state; // @[UARTRx.scala 87:27 UARTRx.scala 61:18]
  wire  _GEN_16 = sample_mid & data_last; // @[UARTRx.scala 87:27 UARTRx.scala 56:9]
  wire [3:0] _GEN_18 = pulse ? _T_25 : {{1'd0}, sample}; // @[UARTRx.scala 82:20 UARTRx.scala 83:16 UARTRx.scala 51:19]
  wire  _GEN_22 = pulse & _GEN_16; // @[UARTRx.scala 82:20 UARTRx.scala 56:9]
  wire [3:0] _GEN_25 = state ? _GEN_18 : {{1'd0}, sample}; // @[Conditional.scala 39:67 UARTRx.scala 51:19]
  wire  _GEN_29 = state & _GEN_22; // @[Conditional.scala 39:67 UARTRx.scala 56:9]
  wire [3:0] _GEN_37 = _T_14 ? {{1'd0}, sample} : _GEN_25; // @[Conditional.scala 40:58 UARTRx.scala 51:19]
  assign io_out_valid = valid; // @[UARTRx.scala 57:16]
  assign io_out_bits = shifter; // @[UARTRx.scala 58:15]
  always @(posedge clock) begin
    if (reset) begin // @[UARTRx.scala 24:21]
      debounce <= 2'h0; // @[UARTRx.scala 24:21]
    end else if (~io_en) begin // @[UARTRx.scala 114:17]
      debounce <= 2'h0; // @[UARTRx.scala 115:14]
    end else if (_T_14) begin // @[Conditional.scala 40:58]
      if (~io_in) begin // @[UARTRx.scala 68:21]
        debounce <= _T_23; // @[UARTRx.scala 69:18]
      end else begin
        debounce <= _GEN_0;
      end
    end
    if (_T_14) begin // @[Conditional.scala 40:58]
      if (~io_in) begin // @[UARTRx.scala 68:21]
        if (debounce_max) begin // @[UARTRx.scala 70:29]
          prescaler <= prescaler_next; // @[UARTRx.scala 73:21]
        end
      end
    end else if (state) begin // @[Conditional.scala 39:67]
      prescaler <= prescaler_next; // @[UARTRx.scala 81:17]
    end
    if (_T_14) begin // @[Conditional.scala 40:58]
      if (~io_in) begin // @[UARTRx.scala 68:21]
        if (debounce_max) begin // @[UARTRx.scala 70:29]
          data_count <= _hi_T_3; // @[UARTRx.scala 74:22]
        end
      end
    end else if (state) begin // @[Conditional.scala 39:67]
      if (pulse) begin // @[UARTRx.scala 82:20]
        data_count <= countdown[7:4]; // @[UARTRx.scala 84:20]
      end
    end
    if (_T_14) begin // @[Conditional.scala 40:58]
      if (~io_in) begin // @[UARTRx.scala 68:21]
        if (debounce_max) begin // @[UARTRx.scala 70:29]
          sample_count <= 4'hf; // @[UARTRx.scala 75:24]
        end
      end
    end else if (state) begin // @[Conditional.scala 39:67]
      if (pulse) begin // @[UARTRx.scala 82:20]
        sample_count <= countdown[3:0]; // @[UARTRx.scala 85:22]
      end
    end
    if (reset) begin // @[UARTRx.scala 61:18]
      state <= 1'h0; // @[UARTRx.scala 61:18]
    end else if (_T_14) begin // @[Conditional.scala 40:58]
      if (~io_in) begin // @[UARTRx.scala 68:21]
        state <= _GEN_1;
      end
    end else if (state) begin // @[Conditional.scala 39:67]
      if (pulse) begin // @[UARTRx.scala 82:20]
        state <= _GEN_15;
      end
    end
    sample <= _GEN_37[2:0];
    if (!(_T_14)) begin // @[Conditional.scala 40:58]
      if (state) begin // @[Conditional.scala 39:67]
        if (pulse) begin // @[UARTRx.scala 82:20]
          if (sample_mid) begin // @[UARTRx.scala 87:27]
            shifter <= _GEN_14;
          end
        end
      end
    end
    if (reset) begin // @[UARTRx.scala 55:18]
      valid <= 1'h0; // @[UARTRx.scala 55:18]
    end else if (_T_14) begin // @[Conditional.scala 40:58]
      valid <= 1'h0; // @[UARTRx.scala 56:9]
    end else begin
      valid <= _GEN_29;
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
  debounce = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  prescaler = _RAND_1[12:0];
  _RAND_2 = {1{`RANDOM}};
  data_count = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  sample_count = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  state = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  sample = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  shifter = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  valid = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
