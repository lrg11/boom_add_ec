module GenericDeserializer(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [3:0]  io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_chanId,
  output [2:0]  io_out_bits_opcode,
  output [2:0]  io_out_bits_param,
  output [3:0]  io_out_bits_size,
  output [3:0]  io_out_bits_source,
  output [31:0] io_out_bits_address,
  output [63:0] io_out_bits_data,
  output        io_out_bits_corrupt,
  output [7:0]  io_out_bits_union,
  output        io_out_bits_last
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
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] data_0; // @[Serdes.scala 202:17]
  reg [3:0] data_1; // @[Serdes.scala 202:17]
  reg [3:0] data_2; // @[Serdes.scala 202:17]
  reg [3:0] data_3; // @[Serdes.scala 202:17]
  reg [3:0] data_4; // @[Serdes.scala 202:17]
  reg [3:0] data_5; // @[Serdes.scala 202:17]
  reg [3:0] data_6; // @[Serdes.scala 202:17]
  reg [3:0] data_7; // @[Serdes.scala 202:17]
  reg [3:0] data_8; // @[Serdes.scala 202:17]
  reg [3:0] data_9; // @[Serdes.scala 202:17]
  reg [3:0] data_10; // @[Serdes.scala 202:17]
  reg [3:0] data_11; // @[Serdes.scala 202:17]
  reg [3:0] data_12; // @[Serdes.scala 202:17]
  reg [3:0] data_13; // @[Serdes.scala 202:17]
  reg [3:0] data_14; // @[Serdes.scala 202:17]
  reg [3:0] data_15; // @[Serdes.scala 202:17]
  reg [3:0] data_16; // @[Serdes.scala 202:17]
  reg [3:0] data_17; // @[Serdes.scala 202:17]
  reg [3:0] data_18; // @[Serdes.scala 202:17]
  reg [3:0] data_19; // @[Serdes.scala 202:17]
  reg [3:0] data_20; // @[Serdes.scala 202:17]
  reg [3:0] data_21; // @[Serdes.scala 202:17]
  reg [3:0] data_22; // @[Serdes.scala 202:17]
  reg [3:0] data_23; // @[Serdes.scala 202:17]
  reg [3:0] data_24; // @[Serdes.scala 202:17]
  reg [3:0] data_25; // @[Serdes.scala 202:17]
  reg [3:0] data_26; // @[Serdes.scala 202:17]
  reg [3:0] data_27; // @[Serdes.scala 202:17]
  reg [3:0] data_28; // @[Serdes.scala 202:17]
  reg [3:0] data_29; // @[Serdes.scala 202:17]
  reg [3:0] data_30; // @[Serdes.scala 202:17]
  reg  receiving; // @[Serdes.scala 204:26]
  wire  _T = io_in_ready & io_in_valid; // @[Decoupled.scala 40:37]
  reg [4:0] recvCount; // @[Counter.scala 60:40]
  wire  wrap_wrap = recvCount == 5'h1e; // @[Counter.scala 72:24]
  wire [4:0] _wrap_value_T_1 = recvCount + 5'h1; // @[Counter.scala 76:24]
  wire  recvDone = _T & wrap_wrap; // @[Counter.scala 118:17 Counter.scala 118:24]
  wire [27:0] lo_lo = {data_6,data_5,data_4,data_3,data_2,data_1,data_0}; // @[Serdes.scala 209:23]
  wire [59:0] lo = {data_14,data_13,data_12,data_11,data_10,data_9,data_8,data_7,lo_lo}; // @[Serdes.scala 209:23]
  wire [31:0] hi_lo = {data_22,data_21,data_20,data_19,data_18,data_17,data_16,data_15}; // @[Serdes.scala 209:23]
  wire [123:0] _T_2 = {data_30,data_29,data_28,data_27,data_26,data_25,data_24,data_23,hi_lo,lo}; // @[Serdes.scala 209:23]
  wire  _GEN_65 = recvDone ? 1'h0 : receiving; // @[Serdes.scala 215:19 Serdes.scala 215:31 Serdes.scala 204:26]
  wire  _T_14 = io_out_ready & io_out_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_66 = _T_14 | _GEN_65; // @[Serdes.scala 217:24 Serdes.scala 217:36]
  assign io_in_ready = receiving; // @[Serdes.scala 207:15]
  assign io_out_valid = ~receiving; // @[Serdes.scala 208:19]
  assign io_out_bits_chanId = _T_2[122:120]; // @[Serdes.scala 209:38]
  assign io_out_bits_opcode = _T_2[119:117]; // @[Serdes.scala 209:38]
  assign io_out_bits_param = _T_2[116:114]; // @[Serdes.scala 209:38]
  assign io_out_bits_size = _T_2[113:110]; // @[Serdes.scala 209:38]
  assign io_out_bits_source = _T_2[109:106]; // @[Serdes.scala 209:38]
  assign io_out_bits_address = _T_2[105:74]; // @[Serdes.scala 209:38]
  assign io_out_bits_data = _T_2[73:10]; // @[Serdes.scala 209:38]
  assign io_out_bits_corrupt = _T_2[9]; // @[Serdes.scala 209:38]
  assign io_out_bits_union = _T_2[8:1]; // @[Serdes.scala 209:38]
  assign io_out_bits_last = _T_2[0]; // @[Serdes.scala 209:38]
  always @(posedge clock) begin
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h0 == recvCount) begin // @[Serdes.scala 212:21]
        data_0 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h1 == recvCount) begin // @[Serdes.scala 212:21]
        data_1 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h2 == recvCount) begin // @[Serdes.scala 212:21]
        data_2 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h3 == recvCount) begin // @[Serdes.scala 212:21]
        data_3 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h4 == recvCount) begin // @[Serdes.scala 212:21]
        data_4 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h5 == recvCount) begin // @[Serdes.scala 212:21]
        data_5 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h6 == recvCount) begin // @[Serdes.scala 212:21]
        data_6 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h7 == recvCount) begin // @[Serdes.scala 212:21]
        data_7 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h8 == recvCount) begin // @[Serdes.scala 212:21]
        data_8 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h9 == recvCount) begin // @[Serdes.scala 212:21]
        data_9 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'ha == recvCount) begin // @[Serdes.scala 212:21]
        data_10 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'hb == recvCount) begin // @[Serdes.scala 212:21]
        data_11 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'hc == recvCount) begin // @[Serdes.scala 212:21]
        data_12 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'hd == recvCount) begin // @[Serdes.scala 212:21]
        data_13 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'he == recvCount) begin // @[Serdes.scala 212:21]
        data_14 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'hf == recvCount) begin // @[Serdes.scala 212:21]
        data_15 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h10 == recvCount) begin // @[Serdes.scala 212:21]
        data_16 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h11 == recvCount) begin // @[Serdes.scala 212:21]
        data_17 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h12 == recvCount) begin // @[Serdes.scala 212:21]
        data_18 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h13 == recvCount) begin // @[Serdes.scala 212:21]
        data_19 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h14 == recvCount) begin // @[Serdes.scala 212:21]
        data_20 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h15 == recvCount) begin // @[Serdes.scala 212:21]
        data_21 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h16 == recvCount) begin // @[Serdes.scala 212:21]
        data_22 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h17 == recvCount) begin // @[Serdes.scala 212:21]
        data_23 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h18 == recvCount) begin // @[Serdes.scala 212:21]
        data_24 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h19 == recvCount) begin // @[Serdes.scala 212:21]
        data_25 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h1a == recvCount) begin // @[Serdes.scala 212:21]
        data_26 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h1b == recvCount) begin // @[Serdes.scala 212:21]
        data_27 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h1c == recvCount) begin // @[Serdes.scala 212:21]
        data_28 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h1d == recvCount) begin // @[Serdes.scala 212:21]
        data_29 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    if (_T) begin // @[Serdes.scala 211:23]
      if (5'h1e == recvCount) begin // @[Serdes.scala 212:21]
        data_30 <= io_in_bits; // @[Serdes.scala 212:21]
      end
    end
    receiving <= reset | _GEN_66; // @[Serdes.scala 204:26 Serdes.scala 204:26]
    if (reset) begin // @[Counter.scala 60:40]
      recvCount <= 5'h0; // @[Counter.scala 60:40]
    end else if (_T) begin // @[Counter.scala 118:17]
      if (wrap_wrap) begin // @[Counter.scala 86:20]
        recvCount <= 5'h0; // @[Counter.scala 86:28]
      end else begin
        recvCount <= _wrap_value_T_1; // @[Counter.scala 76:15]
      end
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
  data_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  data_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  data_2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  data_3 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  data_4 = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  data_5 = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  data_6 = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  data_7 = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  data_8 = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  data_9 = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  data_10 = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  data_11 = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  data_12 = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  data_13 = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  data_14 = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  data_15 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  data_16 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  data_17 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  data_18 = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  data_19 = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  data_20 = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  data_21 = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  data_22 = _RAND_22[3:0];
  _RAND_23 = {1{`RANDOM}};
  data_23 = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  data_24 = _RAND_24[3:0];
  _RAND_25 = {1{`RANDOM}};
  data_25 = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  data_26 = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  data_27 = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  data_28 = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  data_29 = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  data_30 = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  receiving = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  recvCount = _RAND_32[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
