module BoomRAS(
  input         clock,
  input         reset,
  input  [4:0]  io_read_idx,
  output [39:0] io_read_addr,
  input         io_write_valid,
  input  [4:0]  io_write_idx,
  input  [39:0] io_write_addr
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
`endif // RANDOMIZE_REG_INIT
  reg [39:0] ras_0; // @[ras.scala 37:16]
  reg [39:0] ras_1; // @[ras.scala 37:16]
  reg [39:0] ras_2; // @[ras.scala 37:16]
  reg [39:0] ras_3; // @[ras.scala 37:16]
  reg [39:0] ras_4; // @[ras.scala 37:16]
  reg [39:0] ras_5; // @[ras.scala 37:16]
  reg [39:0] ras_6; // @[ras.scala 37:16]
  reg [39:0] ras_7; // @[ras.scala 37:16]
  reg [39:0] ras_8; // @[ras.scala 37:16]
  reg [39:0] ras_9; // @[ras.scala 37:16]
  reg [39:0] ras_10; // @[ras.scala 37:16]
  reg [39:0] ras_11; // @[ras.scala 37:16]
  reg [39:0] ras_12; // @[ras.scala 37:16]
  reg [39:0] ras_13; // @[ras.scala 37:16]
  reg [39:0] ras_14; // @[ras.scala 37:16]
  reg [39:0] ras_15; // @[ras.scala 37:16]
  reg [39:0] ras_16; // @[ras.scala 37:16]
  reg [39:0] ras_17; // @[ras.scala 37:16]
  reg [39:0] ras_18; // @[ras.scala 37:16]
  reg [39:0] ras_19; // @[ras.scala 37:16]
  reg [39:0] ras_20; // @[ras.scala 37:16]
  reg [39:0] ras_21; // @[ras.scala 37:16]
  reg [39:0] ras_22; // @[ras.scala 37:16]
  reg [39:0] ras_23; // @[ras.scala 37:16]
  reg [39:0] ras_24; // @[ras.scala 37:16]
  reg [39:0] ras_25; // @[ras.scala 37:16]
  reg [39:0] ras_26; // @[ras.scala 37:16]
  reg [39:0] ras_27; // @[ras.scala 37:16]
  reg [39:0] ras_28; // @[ras.scala 37:16]
  reg [39:0] ras_29; // @[ras.scala 37:16]
  reg [39:0] ras_30; // @[ras.scala 37:16]
  reg [39:0] ras_31; // @[ras.scala 37:16]
  reg  REG; // @[ras.scala 39:30]
  reg [39:0] REG_1; // @[ras.scala 40:12]
  reg [39:0] REG_2; // @[ras.scala 41:12]
  wire [39:0] _GEN_1 = 5'h1 == io_read_idx ? ras_1 : ras_0; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_2 = 5'h2 == io_read_idx ? ras_2 : _GEN_1; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_3 = 5'h3 == io_read_idx ? ras_3 : _GEN_2; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_4 = 5'h4 == io_read_idx ? ras_4 : _GEN_3; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_5 = 5'h5 == io_read_idx ? ras_5 : _GEN_4; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_6 = 5'h6 == io_read_idx ? ras_6 : _GEN_5; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_7 = 5'h7 == io_read_idx ? ras_7 : _GEN_6; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_8 = 5'h8 == io_read_idx ? ras_8 : _GEN_7; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_9 = 5'h9 == io_read_idx ? ras_9 : _GEN_8; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_10 = 5'ha == io_read_idx ? ras_10 : _GEN_9; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_11 = 5'hb == io_read_idx ? ras_11 : _GEN_10; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_12 = 5'hc == io_read_idx ? ras_12 : _GEN_11; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_13 = 5'hd == io_read_idx ? ras_13 : _GEN_12; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_14 = 5'he == io_read_idx ? ras_14 : _GEN_13; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_15 = 5'hf == io_read_idx ? ras_15 : _GEN_14; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_16 = 5'h10 == io_read_idx ? ras_16 : _GEN_15; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_17 = 5'h11 == io_read_idx ? ras_17 : _GEN_16; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_18 = 5'h12 == io_read_idx ? ras_18 : _GEN_17; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_19 = 5'h13 == io_read_idx ? ras_19 : _GEN_18; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_20 = 5'h14 == io_read_idx ? ras_20 : _GEN_19; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_21 = 5'h15 == io_read_idx ? ras_21 : _GEN_20; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_22 = 5'h16 == io_read_idx ? ras_22 : _GEN_21; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_23 = 5'h17 == io_read_idx ? ras_23 : _GEN_22; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_24 = 5'h18 == io_read_idx ? ras_24 : _GEN_23; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_25 = 5'h19 == io_read_idx ? ras_25 : _GEN_24; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_26 = 5'h1a == io_read_idx ? ras_26 : _GEN_25; // @[ras.scala 41:12 ras.scala 41:12]
  wire [39:0] _GEN_27 = 5'h1b == io_read_idx ? ras_27 : _GEN_26; // @[ras.scala 41:12 ras.scala 41:12]
  assign io_read_addr = REG ? REG_1 : REG_2; // @[ras.scala 39:22]
  always @(posedge clock) begin
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h0 == io_write_idx) begin // @[ras.scala 44:23]
        ras_0 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h1 == io_write_idx) begin // @[ras.scala 44:23]
        ras_1 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h2 == io_write_idx) begin // @[ras.scala 44:23]
        ras_2 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h3 == io_write_idx) begin // @[ras.scala 44:23]
        ras_3 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h4 == io_write_idx) begin // @[ras.scala 44:23]
        ras_4 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h5 == io_write_idx) begin // @[ras.scala 44:23]
        ras_5 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h6 == io_write_idx) begin // @[ras.scala 44:23]
        ras_6 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h7 == io_write_idx) begin // @[ras.scala 44:23]
        ras_7 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h8 == io_write_idx) begin // @[ras.scala 44:23]
        ras_8 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h9 == io_write_idx) begin // @[ras.scala 44:23]
        ras_9 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'ha == io_write_idx) begin // @[ras.scala 44:23]
        ras_10 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'hb == io_write_idx) begin // @[ras.scala 44:23]
        ras_11 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'hc == io_write_idx) begin // @[ras.scala 44:23]
        ras_12 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'hd == io_write_idx) begin // @[ras.scala 44:23]
        ras_13 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'he == io_write_idx) begin // @[ras.scala 44:23]
        ras_14 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'hf == io_write_idx) begin // @[ras.scala 44:23]
        ras_15 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h10 == io_write_idx) begin // @[ras.scala 44:23]
        ras_16 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h11 == io_write_idx) begin // @[ras.scala 44:23]
        ras_17 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h12 == io_write_idx) begin // @[ras.scala 44:23]
        ras_18 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h13 == io_write_idx) begin // @[ras.scala 44:23]
        ras_19 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h14 == io_write_idx) begin // @[ras.scala 44:23]
        ras_20 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h15 == io_write_idx) begin // @[ras.scala 44:23]
        ras_21 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h16 == io_write_idx) begin // @[ras.scala 44:23]
        ras_22 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h17 == io_write_idx) begin // @[ras.scala 44:23]
        ras_23 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h18 == io_write_idx) begin // @[ras.scala 44:23]
        ras_24 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h19 == io_write_idx) begin // @[ras.scala 44:23]
        ras_25 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h1a == io_write_idx) begin // @[ras.scala 44:23]
        ras_26 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h1b == io_write_idx) begin // @[ras.scala 44:23]
        ras_27 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h1c == io_write_idx) begin // @[ras.scala 44:23]
        ras_28 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h1d == io_write_idx) begin // @[ras.scala 44:23]
        ras_29 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h1e == io_write_idx) begin // @[ras.scala 44:23]
        ras_30 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    if (io_write_valid) begin // @[ras.scala 43:25]
      if (5'h1f == io_write_idx) begin // @[ras.scala 44:23]
        ras_31 <= io_write_addr; // @[ras.scala 44:23]
      end
    end
    REG <= io_write_valid & io_write_idx == io_read_idx; // @[ras.scala 39:46]
    REG_1 <= io_write_addr; // @[ras.scala 40:12]
    if (5'h1f == io_read_idx) begin // @[ras.scala 41:12]
      REG_2 <= ras_31; // @[ras.scala 41:12]
    end else if (5'h1e == io_read_idx) begin // @[ras.scala 41:12]
      REG_2 <= ras_30; // @[ras.scala 41:12]
    end else if (5'h1d == io_read_idx) begin // @[ras.scala 41:12]
      REG_2 <= ras_29; // @[ras.scala 41:12]
    end else if (5'h1c == io_read_idx) begin // @[ras.scala 41:12]
      REG_2 <= ras_28; // @[ras.scala 41:12]
    end else begin
      REG_2 <= _GEN_27;
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
  _RAND_0 = {2{`RANDOM}};
  ras_0 = _RAND_0[39:0];
  _RAND_1 = {2{`RANDOM}};
  ras_1 = _RAND_1[39:0];
  _RAND_2 = {2{`RANDOM}};
  ras_2 = _RAND_2[39:0];
  _RAND_3 = {2{`RANDOM}};
  ras_3 = _RAND_3[39:0];
  _RAND_4 = {2{`RANDOM}};
  ras_4 = _RAND_4[39:0];
  _RAND_5 = {2{`RANDOM}};
  ras_5 = _RAND_5[39:0];
  _RAND_6 = {2{`RANDOM}};
  ras_6 = _RAND_6[39:0];
  _RAND_7 = {2{`RANDOM}};
  ras_7 = _RAND_7[39:0];
  _RAND_8 = {2{`RANDOM}};
  ras_8 = _RAND_8[39:0];
  _RAND_9 = {2{`RANDOM}};
  ras_9 = _RAND_9[39:0];
  _RAND_10 = {2{`RANDOM}};
  ras_10 = _RAND_10[39:0];
  _RAND_11 = {2{`RANDOM}};
  ras_11 = _RAND_11[39:0];
  _RAND_12 = {2{`RANDOM}};
  ras_12 = _RAND_12[39:0];
  _RAND_13 = {2{`RANDOM}};
  ras_13 = _RAND_13[39:0];
  _RAND_14 = {2{`RANDOM}};
  ras_14 = _RAND_14[39:0];
  _RAND_15 = {2{`RANDOM}};
  ras_15 = _RAND_15[39:0];
  _RAND_16 = {2{`RANDOM}};
  ras_16 = _RAND_16[39:0];
  _RAND_17 = {2{`RANDOM}};
  ras_17 = _RAND_17[39:0];
  _RAND_18 = {2{`RANDOM}};
  ras_18 = _RAND_18[39:0];
  _RAND_19 = {2{`RANDOM}};
  ras_19 = _RAND_19[39:0];
  _RAND_20 = {2{`RANDOM}};
  ras_20 = _RAND_20[39:0];
  _RAND_21 = {2{`RANDOM}};
  ras_21 = _RAND_21[39:0];
  _RAND_22 = {2{`RANDOM}};
  ras_22 = _RAND_22[39:0];
  _RAND_23 = {2{`RANDOM}};
  ras_23 = _RAND_23[39:0];
  _RAND_24 = {2{`RANDOM}};
  ras_24 = _RAND_24[39:0];
  _RAND_25 = {2{`RANDOM}};
  ras_25 = _RAND_25[39:0];
  _RAND_26 = {2{`RANDOM}};
  ras_26 = _RAND_26[39:0];
  _RAND_27 = {2{`RANDOM}};
  ras_27 = _RAND_27[39:0];
  _RAND_28 = {2{`RANDOM}};
  ras_28 = _RAND_28[39:0];
  _RAND_29 = {2{`RANDOM}};
  ras_29 = _RAND_29[39:0];
  _RAND_30 = {2{`RANDOM}};
  ras_30 = _RAND_30[39:0];
  _RAND_31 = {2{`RANDOM}};
  ras_31 = _RAND_31[39:0];
  _RAND_32 = {1{`RANDOM}};
  REG = _RAND_32[0:0];
  _RAND_33 = {2{`RANDOM}};
  REG_1 = _RAND_33[39:0];
  _RAND_34 = {2{`RANDOM}};
  REG_2 = _RAND_34[39:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
