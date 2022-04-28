module FMADecoder(
  input        clock,
  input        reset,
  input  [6:0] io_uopc,
  output [1:0] io_cmd
);
  wire [6:0] _T = io_uopc & 7'h27; // @[Decode.scala 14:65]
  wire  _T_1 = _T == 7'h0; // @[Decode.scala 14:121]
  wire [6:0] _T_2 = io_uopc & 7'h12; // @[Decode.scala 14:65]
  wire  _T_3 = _T_2 == 7'h2; // @[Decode.scala 14:121]
  wire [6:0] _T_4 = io_uopc & 7'hb; // @[Decode.scala 14:65]
  wire  _T_5 = _T_4 == 7'hb; // @[Decode.scala 14:121]
  wire [6:0] _T_6 = io_uopc & 7'he; // @[Decode.scala 14:65]
  wire  _T_7 = _T_6 == 7'he; // @[Decode.scala 14:121]
  wire  lo = _T_1 | _T_3 | _T_5 | _T_7; // @[Decode.scala 15:30]
  wire [6:0] _T_11 = io_uopc & 7'h13; // @[Decode.scala 14:65]
  wire  _T_12 = _T_11 == 7'h0; // @[Decode.scala 14:121]
  wire  _T_14 = _T_11 == 7'h3; // @[Decode.scala 14:121]
  wire [6:0] _T_15 = io_uopc & 7'hf; // @[Decode.scala 14:65]
  wire  _T_16 = _T_15 == 7'hf; // @[Decode.scala 14:121]
  wire  hi = _T_12 | _T_14 | _T_16; // @[Decode.scala 15:30]
  assign io_cmd = {hi,lo}; // @[Cat.scala 30:58]
endmodule
