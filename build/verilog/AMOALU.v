module AMOALU(
  input         clock,
  input         reset,
  input  [7:0]  io_mask,
  input  [4:0]  io_cmd,
  input  [63:0] io_lhs,
  input  [63:0] io_rhs,
  output [63:0] io_out,
  output [63:0] io_out_unmasked
);
  wire  max = io_cmd == 5'hd | io_cmd == 5'hf; // @[AMOALU.scala 64:33]
  wire  min = io_cmd == 5'hc | io_cmd == 5'he; // @[AMOALU.scala 65:33]
  wire  add = io_cmd == 5'h8; // @[AMOALU.scala 66:20]
  wire  _logic_and_T = io_cmd == 5'ha; // @[AMOALU.scala 67:26]
  wire  logic_and = io_cmd == 5'ha | io_cmd == 5'hb; // @[AMOALU.scala 67:38]
  wire  logic_xor = io_cmd == 5'h9 | _logic_and_T; // @[AMOALU.scala 68:39]
  wire  _adder_out_mask_T_1 = ~io_mask[3]; // @[AMOALU.scala 72:63]
  wire [31:0] _adder_out_mask_T_2 = {_adder_out_mask_T_1, 31'h0}; // @[AMOALU.scala 72:79]
  wire [63:0] _adder_out_mask_T_3 = {{32'd0}, _adder_out_mask_T_2}; // @[AMOALU.scala 72:98]
  wire [63:0] adder_out_mask = ~_adder_out_mask_T_3; // @[AMOALU.scala 72:16]
  wire [63:0] _adder_out_T = io_lhs & adder_out_mask; // @[AMOALU.scala 73:13]
  wire [63:0] _adder_out_T_1 = io_rhs & adder_out_mask; // @[AMOALU.scala 73:31]
  wire [63:0] adder_out = _adder_out_T + _adder_out_T_1; // @[AMOALU.scala 73:21]
  wire [4:0] _less_signed_T = io_cmd & 5'h2; // @[AMOALU.scala 86:17]
  wire  less_signed = _less_signed_T == 5'h0; // @[AMOALU.scala 86:25]
  wire  _less_T_12 = io_lhs[31:0] < io_rhs[31:0]; // @[AMOALU.scala 79:35]
  wire  _less_T_14 = io_lhs[63:32] < io_rhs[63:32] | io_lhs[63:32] == io_rhs[63:32] & _less_T_12; // @[AMOALU.scala 80:38]
  wire  _less_T_17 = less_signed ? io_lhs[63] : io_rhs[63]; // @[AMOALU.scala 88:58]
  wire  _less_T_18 = io_lhs[63] == io_rhs[63] ? _less_T_14 : _less_T_17; // @[AMOALU.scala 88:10]
  wire  _less_T_28 = less_signed ? io_lhs[31] : io_rhs[31]; // @[AMOALU.scala 88:58]
  wire  _less_T_29 = io_lhs[31] == io_rhs[31] ? _less_T_12 : _less_T_28; // @[AMOALU.scala 88:10]
  wire  less = io_mask[4] ? _less_T_18 : _less_T_29; // @[Mux.scala 47:69]
  wire  _minmax_T = less ? min : max; // @[AMOALU.scala 94:23]
  wire [63:0] minmax = _minmax_T ? io_lhs : io_rhs; // @[AMOALU.scala 94:19]
  wire [63:0] _logic_T = io_lhs & io_rhs; // @[AMOALU.scala 96:27]
  wire [63:0] _logic_T_1 = logic_and ? _logic_T : 64'h0; // @[AMOALU.scala 96:8]
  wire [63:0] _logic_T_2 = io_lhs ^ io_rhs; // @[AMOALU.scala 97:27]
  wire [63:0] _logic_T_3 = logic_xor ? _logic_T_2 : 64'h0; // @[AMOALU.scala 97:8]
  wire [63:0] logic_ = _logic_T_1 | _logic_T_3; // @[AMOALU.scala 96:42]
  wire [63:0] _out_T_1 = logic_and | logic_xor ? logic_ : minmax; // @[AMOALU.scala 100:8]
  wire [63:0] out = add ? adder_out : _out_T_1; // @[AMOALU.scala 99:8]
  wire [7:0] wmask_lo_lo_lo = io_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wmask_lo_lo_hi = io_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wmask_lo_hi_lo = io_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wmask_lo_hi_hi = io_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wmask_hi_lo_lo = io_mask[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wmask_hi_lo_hi = io_mask[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wmask_hi_hi_lo = io_mask[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wmask_hi_hi_hi = io_mask[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] wmask = {wmask_hi_hi_hi,wmask_hi_hi_lo,wmask_hi_lo_hi,wmask_hi_lo_lo,wmask_lo_hi_hi,wmask_lo_hi_lo,
    wmask_lo_lo_hi,wmask_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [63:0] _io_out_T = wmask & out; // @[AMOALU.scala 104:19]
  wire [63:0] _io_out_T_1 = ~wmask; // @[AMOALU.scala 104:27]
  wire [63:0] _io_out_T_2 = _io_out_T_1 & io_lhs; // @[AMOALU.scala 104:34]
  assign io_out = _io_out_T | _io_out_T_2; // @[AMOALU.scala 104:25]
  assign io_out_unmasked = add ? adder_out : _out_T_1; // @[AMOALU.scala 99:8]
endmodule
