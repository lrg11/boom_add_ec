module UOPCodeFPUDecoder(
  input        clock,
  input        reset,
  input  [6:0] io_uopc,
  output       io_sigs_ldst,
  output       io_sigs_wen,
  output       io_sigs_ren1,
  output       io_sigs_ren2,
  output       io_sigs_ren3,
  output       io_sigs_swap12,
  output       io_sigs_swap23,
  output [1:0] io_sigs_typeTagIn,
  output [1:0] io_sigs_typeTagOut,
  output       io_sigs_fromint,
  output       io_sigs_toint,
  output       io_sigs_fastpipe,
  output       io_sigs_fma,
  output       io_sigs_div,
  output       io_sigs_sqrt,
  output       io_sigs_wflags
);
  wire  _bit_T = io_uopc == 7'h52; // @[Decode.scala 14:121]
  wire  _bit_T_1 = io_uopc == 7'h46; // @[Decode.scala 14:121]
  wire  _bit_T_2 = io_uopc == 7'h4e; // @[Decode.scala 14:121]
  wire  _bit_T_3 = io_uopc == 7'h50; // @[Decode.scala 14:121]
  wire  _bit_T_4 = io_uopc == 7'h48; // @[Decode.scala 14:121]
  wire  _bit_T_5 = io_uopc == 7'h54; // @[Decode.scala 14:121]
  wire  _bit_T_6 = io_uopc == 7'h57; // @[Decode.scala 14:121]
  wire  _bit_T_7 = io_uopc == 7'h58; // @[Decode.scala 14:121]
  wire  _bit_T_8 = io_uopc == 7'h59; // @[Decode.scala 14:121]
  wire  _bit_T_9 = io_uopc == 7'h5d; // @[Decode.scala 14:121]
  wire  _bit_T_10 = io_uopc == 7'h5e; // @[Decode.scala 14:121]
  wire  _bit_T_11 = io_uopc == 7'h5f; // @[Decode.scala 14:121]
  wire  _bit_T_12 = io_uopc == 7'h60; // @[Decode.scala 14:121]
  wire  _bit_T_13 = io_uopc == 7'h7f; // @[Decode.scala 14:121]
  wire  _bit_T_14 = io_uopc == 7'h7b; // @[Decode.scala 14:121]
  wire  _bit_T_15 = io_uopc == 7'h56; // @[Decode.scala 14:121]
  wire  _bit_T_16 = io_uopc == 7'h53; // @[Decode.scala 14:121]
  wire  _bit_T_17 = io_uopc == 7'h47; // @[Decode.scala 14:121]
  wire  _bit_T_18 = io_uopc == 7'h4a; // @[Decode.scala 14:121]
  wire  _bit_T_19 = io_uopc == 7'h4b; // @[Decode.scala 14:121]
  wire  _bit_T_20 = io_uopc == 7'h4f; // @[Decode.scala 14:121]
  wire  _bit_T_21 = io_uopc == 7'h51; // @[Decode.scala 14:121]
  wire  _bit_T_22 = io_uopc == 7'h49; // @[Decode.scala 14:121]
  wire  _bit_T_23 = io_uopc == 7'h55; // @[Decode.scala 14:121]
  wire  _bit_T_24 = io_uopc == 7'h5a; // @[Decode.scala 14:121]
  wire  _bit_T_25 = io_uopc == 7'h5b; // @[Decode.scala 14:121]
  wire  _bit_T_26 = io_uopc == 7'h5c; // @[Decode.scala 14:121]
  wire  _bit_T_27 = io_uopc == 7'h61; // @[Decode.scala 14:121]
  wire  _bit_T_28 = io_uopc == 7'h62; // @[Decode.scala 14:121]
  wire  _bit_T_29 = io_uopc == 7'h63; // @[Decode.scala 14:121]
  wire  _bit_T_30 = io_uopc == 7'h64; // @[Decode.scala 14:121]
  wire  _bit_T_31 = io_uopc == 7'h7a; // @[Decode.scala 14:121]
  wire  _bit_T_32 = io_uopc == 7'h42; // @[Decode.scala 14:121]
  wire  _bit_T_63 = _bit_T | _bit_T_1 | _bit_T_2 | _bit_T_3 | _bit_T_4 | _bit_T_5 | _bit_T_6 | _bit_T_7 | _bit_T_8 |
    _bit_T_9 | _bit_T_10 | _bit_T_11 | _bit_T_12 | _bit_T_13 | _bit_T_14 | _bit_T_15 | _bit_T_16 | _bit_T_17 | _bit_T_18
     | _bit_T_19 | _bit_T_20 | _bit_T_21 | _bit_T_22 | _bit_T_23 | _bit_T_24 | _bit_T_25 | _bit_T_26 | _bit_T_27 |
    _bit_T_28 | _bit_T_29 | _bit_T_30; // @[Decode.scala 15:30]
  wire  _bit_T_99 = io_uopc == 7'h45; // @[Decode.scala 14:121]
  wire  _bit_T_100 = io_uopc == 7'h4d; // @[Decode.scala 14:121]
  wire  decoder_7 = _bit_T_1 | _bit_T_16 | _bit_T_99 | _bit_T_17 | _bit_T_18 | _bit_T_100 | _bit_T_20 | _bit_T_21 |
    _bit_T_22 | _bit_T_23 | _bit_T_24 | _bit_T_25 | _bit_T_26 | _bit_T_27 | _bit_T_28 | _bit_T_29 | _bit_T_30 |
    _bit_T_31 | _bit_T_32; // @[Decode.scala 15:30]
  wire  _bit_T_119 = io_uopc == 7'h44; // @[Decode.scala 14:121]
  wire  decoder_8 = _bit_T_119 | _bit_T_16 | _bit_T_99 | _bit_T_17 | _bit_T_19 | _bit_T_100 | _bit_T_20 | _bit_T_21 |
    _bit_T_22 | _bit_T_23 | _bit_T_24 | _bit_T_25 | _bit_T_26 | _bit_T_27 | _bit_T_28 | _bit_T_29 | _bit_T_30 |
    _bit_T_31 | _bit_T_32; // @[Decode.scala 15:30]
  wire  _bit_T_138 = io_uopc == 7'h4c; // @[Decode.scala 14:121]
  wire  _bit_T_139 = io_uopc == 7'h7d; // @[Decode.scala 14:121]
  wire  _bit_T_144 = io_uopc == 7'h7e; // @[Decode.scala 14:121]
  assign io_sigs_ldst = 1'h0; // @[fpu.scala 125:40]
  assign io_sigs_wen = 1'h0; // @[fpu.scala 125:40]
  assign io_sigs_ren1 = _bit_T_63 | _bit_T_31 | _bit_T_32; // @[Decode.scala 15:30]
  assign io_sigs_ren2 = _bit_T_3 | _bit_T_4 | _bit_T_5 | _bit_T_6 | _bit_T_7 | _bit_T_8 | _bit_T_9 | _bit_T_10 |
    _bit_T_11 | _bit_T_12 | _bit_T_13 | _bit_T_14 | _bit_T_15 | _bit_T_21 | _bit_T_22 | _bit_T_23 | _bit_T_24 |
    _bit_T_25 | _bit_T_26 | _bit_T_27 | _bit_T_28 | _bit_T_29 | _bit_T_30 | _bit_T_31 | _bit_T_32; // @[Decode.scala 15:30]
  assign io_sigs_ren3 = _bit_T_9 | _bit_T_10 | _bit_T_11 | _bit_T_12 | _bit_T_27 | _bit_T_28 | _bit_T_29 | _bit_T_30; // @[Decode.scala 15:30]
  assign io_sigs_swap12 = 1'h0; // @[fpu.scala 125:40]
  assign io_sigs_swap23 = _bit_T_6 | _bit_T_7 | _bit_T_24 | _bit_T_25; // @[Decode.scala 15:30]
  assign io_sigs_typeTagIn = {{1'd0}, decoder_7}; // @[Decode.scala 15:30]
  assign io_sigs_typeTagOut = {{1'd0}, decoder_8}; // @[Decode.scala 15:30]
  assign io_sigs_fromint = _bit_T_119 | _bit_T_138 | _bit_T_139 | _bit_T_99 | _bit_T_100; // @[Decode.scala 15:30]
  assign io_sigs_toint = _bit_T | _bit_T_1 | _bit_T_2 | _bit_T_3 | _bit_T_144 | _bit_T_15 | _bit_T_16 | _bit_T_17 |
    _bit_T_20 | _bit_T_21 | _bit_T_32; // @[Decode.scala 15:30]
  assign io_sigs_fastpipe = _bit_T_4 | _bit_T_5 | _bit_T_13 | _bit_T_14 | _bit_T_18 | _bit_T_19 | _bit_T_22 | _bit_T_23
     | _bit_T_31; // @[Decode.scala 15:30]
  assign io_sigs_fma = _bit_T_6 | _bit_T_7 | _bit_T_8 | _bit_T_9 | _bit_T_10 | _bit_T_11 | _bit_T_12 | _bit_T_24 |
    _bit_T_25 | _bit_T_26 | _bit_T_27 | _bit_T_28 | _bit_T_29 | _bit_T_30; // @[Decode.scala 15:30]
  assign io_sigs_div = 1'h0; // @[fpu.scala 125:40]
  assign io_sigs_sqrt = 1'h0; // @[fpu.scala 125:40]
  assign io_sigs_wflags = _bit_T_138 | _bit_T_2 | _bit_T_3 | _bit_T_5 | _bit_T_6 | _bit_T_7 | _bit_T_8 | _bit_T_9 |
    _bit_T_10 | _bit_T_11 | _bit_T_12 | _bit_T_139 | _bit_T_144 | _bit_T_15 | _bit_T_18 | _bit_T_19 | _bit_T_100 |
    _bit_T_20 | _bit_T_21 | _bit_T_23 | _bit_T_24 | _bit_T_25 | _bit_T_26 | _bit_T_27 | _bit_T_28 | _bit_T_29 |
    _bit_T_30 | _bit_T_32; // @[Decode.scala 15:30]
endmodule
