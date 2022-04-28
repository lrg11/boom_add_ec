module CaptureChain(
  input         clock,
  input         reset,
  input         io_chainIn_shift,
  input         io_chainIn_data,
  input         io_chainIn_capture,
  input         io_chainIn_update,
  output        io_chainOut_shift,
  output        io_chainOut_data,
  output        io_chainOut_capture,
  output        io_chainOut_update,
  input  [3:0]  io_capture_bits_version,
  input  [15:0] io_capture_bits_partNumber,
  input  [10:0] io_capture_bits_mfrId,
  input         io_capture_bits_always1,
  output        io_capture_capture
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
`endif // RANDOMIZE_REG_INIT
  reg  regs_0; // @[JtagShifter.scala 102:39]
  reg  regs_1; // @[JtagShifter.scala 102:39]
  reg  regs_2; // @[JtagShifter.scala 102:39]
  reg  regs_3; // @[JtagShifter.scala 102:39]
  reg  regs_4; // @[JtagShifter.scala 102:39]
  reg  regs_5; // @[JtagShifter.scala 102:39]
  reg  regs_6; // @[JtagShifter.scala 102:39]
  reg  regs_7; // @[JtagShifter.scala 102:39]
  reg  regs_8; // @[JtagShifter.scala 102:39]
  reg  regs_9; // @[JtagShifter.scala 102:39]
  reg  regs_10; // @[JtagShifter.scala 102:39]
  reg  regs_11; // @[JtagShifter.scala 102:39]
  reg  regs_12; // @[JtagShifter.scala 102:39]
  reg  regs_13; // @[JtagShifter.scala 102:39]
  reg  regs_14; // @[JtagShifter.scala 102:39]
  reg  regs_15; // @[JtagShifter.scala 102:39]
  reg  regs_16; // @[JtagShifter.scala 102:39]
  reg  regs_17; // @[JtagShifter.scala 102:39]
  reg  regs_18; // @[JtagShifter.scala 102:39]
  reg  regs_19; // @[JtagShifter.scala 102:39]
  reg  regs_20; // @[JtagShifter.scala 102:39]
  reg  regs_21; // @[JtagShifter.scala 102:39]
  reg  regs_22; // @[JtagShifter.scala 102:39]
  reg  regs_23; // @[JtagShifter.scala 102:39]
  reg  regs_24; // @[JtagShifter.scala 102:39]
  reg  regs_25; // @[JtagShifter.scala 102:39]
  reg  regs_26; // @[JtagShifter.scala 102:39]
  reg  regs_27; // @[JtagShifter.scala 102:39]
  reg  regs_28; // @[JtagShifter.scala 102:39]
  reg  regs_29; // @[JtagShifter.scala 102:39]
  reg  regs_30; // @[JtagShifter.scala 102:39]
  reg  regs_31; // @[JtagShifter.scala 102:39]
  wire [31:0] _regs_0_T = {io_capture_bits_version,io_capture_bits_partNumber,io_capture_bits_mfrId,
    io_capture_bits_always1}; // @[JtagShifter.scala 109:60]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 118:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 119:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 120:7]
  assign io_chainOut_shift = io_chainIn_shift; // @[JtagShifter.scala 25:11]
  assign io_chainOut_data = regs_0; // @[JtagShifter.scala 104:20]
  assign io_chainOut_capture = io_chainIn_capture; // @[JtagShifter.scala 26:13]
  assign io_chainOut_update = io_chainIn_update; // @[JtagShifter.scala 27:12]
  assign io_capture_capture = io_chainIn_capture; // @[JtagShifter.scala 108:29 JtagShifter.scala 110:24]
  always @(posedge clock) begin
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_0 <= _regs_0_T[0]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_0 <= regs_1; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_1 <= _regs_0_T[1]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_1 <= regs_2; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_2 <= _regs_0_T[2]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_2 <= regs_3; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_3 <= _regs_0_T[3]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_3 <= regs_4; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_4 <= _regs_0_T[4]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_4 <= regs_5; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_5 <= _regs_0_T[5]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_5 <= regs_6; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_6 <= _regs_0_T[6]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_6 <= regs_7; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_7 <= _regs_0_T[7]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_7 <= regs_8; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_8 <= _regs_0_T[8]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_8 <= regs_9; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_9 <= _regs_0_T[9]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_9 <= regs_10; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_10 <= _regs_0_T[10]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_10 <= regs_11; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_11 <= _regs_0_T[11]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_11 <= regs_12; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_12 <= _regs_0_T[12]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_12 <= regs_13; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_13 <= _regs_0_T[13]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_13 <= regs_14; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_14 <= _regs_0_T[14]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_14 <= regs_15; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_15 <= _regs_0_T[15]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_15 <= regs_16; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_16 <= _regs_0_T[16]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_16 <= regs_17; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_17 <= _regs_0_T[17]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_17 <= regs_18; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_18 <= _regs_0_T[18]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_18 <= regs_19; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_19 <= _regs_0_T[19]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_19 <= regs_20; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_20 <= _regs_0_T[20]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_20 <= regs_21; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_21 <= _regs_0_T[21]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_21 <= regs_22; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_22 <= _regs_0_T[22]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_22 <= regs_23; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_23 <= _regs_0_T[23]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_23 <= regs_24; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_24 <= _regs_0_T[24]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_24 <= regs_25; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_25 <= _regs_0_T[25]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_25 <= regs_26; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_26 <= _regs_0_T[26]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_26 <= regs_27; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_27 <= _regs_0_T[27]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_27 <= regs_28; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_28 <= _regs_0_T[28]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_28 <= regs_29; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_29 <= _regs_0_T[29]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_29 <= regs_30; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_30 <= _regs_0_T[30]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_30 <= regs_31; // @[JtagShifter.scala 113:37]
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 108:29]
      regs_31 <= _regs_0_T[31]; // @[JtagShifter.scala 109:35]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 111:34]
      regs_31 <= io_chainIn_data; // @[JtagShifter.scala 112:15]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_7 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at JtagShifter.scala:118 assert(!(io.chainIn.capture && io.chainIn.update)\n"); // @[JtagShifter.scala 118:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_7 | reset)) begin
          $fatal; // @[JtagShifter.scala 118:9]
        end
    `ifdef STOP_COND
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
  regs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  regs_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  regs_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  regs_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  regs_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  regs_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  regs_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  regs_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  regs_16 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  regs_17 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  regs_18 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  regs_19 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  regs_20 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  regs_21 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  regs_22 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  regs_23 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  regs_24 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  regs_25 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  regs_26 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  regs_27 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  regs_28 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  regs_29 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  regs_30 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  regs_31 = _RAND_31[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
