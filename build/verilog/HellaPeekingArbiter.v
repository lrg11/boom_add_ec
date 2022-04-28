module HellaPeekingArbiter(
  input         clock,
  input         reset,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [2:0]  io_in_0_bits_chanId,
  input  [2:0]  io_in_0_bits_opcode,
  input  [2:0]  io_in_0_bits_param,
  input  [3:0]  io_in_0_bits_size,
  input  [3:0]  io_in_0_bits_source,
  input  [31:0] io_in_0_bits_address,
  input  [63:0] io_in_0_bits_data,
  input         io_in_0_bits_corrupt,
  input  [7:0]  io_in_0_bits_union,
  input         io_in_0_bits_last,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [2:0]  io_in_1_bits_chanId,
  input  [2:0]  io_in_1_bits_opcode,
  input  [2:0]  io_in_1_bits_param,
  input  [3:0]  io_in_1_bits_size,
  input  [3:0]  io_in_1_bits_source,
  input  [31:0] io_in_1_bits_address,
  input  [63:0] io_in_1_bits_data,
  input         io_in_1_bits_corrupt,
  input  [7:0]  io_in_1_bits_union,
  input         io_in_1_bits_last,
  output        io_in_2_ready,
  input         io_in_2_valid,
  input  [2:0]  io_in_2_bits_chanId,
  input  [2:0]  io_in_2_bits_opcode,
  input  [2:0]  io_in_2_bits_param,
  input  [3:0]  io_in_2_bits_size,
  input  [3:0]  io_in_2_bits_source,
  input  [31:0] io_in_2_bits_address,
  input  [63:0] io_in_2_bits_data,
  input         io_in_2_bits_corrupt,
  input  [7:0]  io_in_2_bits_union,
  input         io_in_2_bits_last,
  output        io_in_3_ready,
  input         io_in_3_valid,
  input  [2:0]  io_in_3_bits_chanId,
  input  [2:0]  io_in_3_bits_opcode,
  input  [2:0]  io_in_3_bits_param,
  input  [3:0]  io_in_3_bits_size,
  input  [3:0]  io_in_3_bits_source,
  input  [31:0] io_in_3_bits_address,
  input  [63:0] io_in_3_bits_data,
  input         io_in_3_bits_corrupt,
  input  [7:0]  io_in_3_bits_union,
  input         io_in_3_bits_last,
  output        io_in_4_ready,
  input         io_in_4_valid,
  input  [2:0]  io_in_4_bits_chanId,
  input  [2:0]  io_in_4_bits_opcode,
  input  [2:0]  io_in_4_bits_param,
  input  [3:0]  io_in_4_bits_size,
  input  [3:0]  io_in_4_bits_source,
  input  [31:0] io_in_4_bits_address,
  input  [63:0] io_in_4_bits_data,
  input         io_in_4_bits_corrupt,
  input  [7:0]  io_in_4_bits_union,
  input         io_in_4_bits_last,
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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] lockIdx; // @[Arbiters.scala 25:20]
  reg  locked; // @[Arbiters.scala 26:19]
  wire [2:0] _choice_T = io_in_3_valid ? 3'h3 : 3'h4; // @[Mux.scala 47:69]
  wire [2:0] _choice_T_1 = io_in_2_valid ? 3'h2 : _choice_T; // @[Mux.scala 47:69]
  wire [2:0] _choice_T_2 = io_in_1_valid ? 3'h1 : _choice_T_1; // @[Mux.scala 47:69]
  wire [2:0] choice = io_in_0_valid ? 3'h0 : _choice_T_2; // @[Mux.scala 47:69]
  wire [2:0] chosen = locked ? lockIdx : choice; // @[Arbiters.scala 36:19]
  wire  _GEN_1 = 3'h1 == chosen ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 42:16 Arbiters.scala 42:16]
  wire  _GEN_2 = 3'h2 == chosen ? io_in_2_valid : _GEN_1; // @[Arbiters.scala 42:16 Arbiters.scala 42:16]
  wire  _GEN_3 = 3'h3 == chosen ? io_in_3_valid : _GEN_2; // @[Arbiters.scala 42:16 Arbiters.scala 42:16]
  wire [2:0] _GEN_6 = 3'h1 == chosen ? io_in_1_bits_chanId : io_in_0_bits_chanId; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [2:0] _GEN_7 = 3'h2 == chosen ? io_in_2_bits_chanId : _GEN_6; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [2:0] _GEN_8 = 3'h3 == chosen ? io_in_3_bits_chanId : _GEN_7; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [2:0] _GEN_11 = 3'h1 == chosen ? io_in_1_bits_opcode : io_in_0_bits_opcode; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [2:0] _GEN_12 = 3'h2 == chosen ? io_in_2_bits_opcode : _GEN_11; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [2:0] _GEN_13 = 3'h3 == chosen ? io_in_3_bits_opcode : _GEN_12; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [2:0] _GEN_16 = 3'h1 == chosen ? io_in_1_bits_param : io_in_0_bits_param; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [2:0] _GEN_17 = 3'h2 == chosen ? io_in_2_bits_param : _GEN_16; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [2:0] _GEN_18 = 3'h3 == chosen ? io_in_3_bits_param : _GEN_17; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [3:0] _GEN_21 = 3'h1 == chosen ? io_in_1_bits_size : io_in_0_bits_size; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [3:0] _GEN_22 = 3'h2 == chosen ? io_in_2_bits_size : _GEN_21; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [3:0] _GEN_23 = 3'h3 == chosen ? io_in_3_bits_size : _GEN_22; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [3:0] _GEN_26 = 3'h1 == chosen ? io_in_1_bits_source : io_in_0_bits_source; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [3:0] _GEN_27 = 3'h2 == chosen ? io_in_2_bits_source : _GEN_26; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [3:0] _GEN_28 = 3'h3 == chosen ? io_in_3_bits_source : _GEN_27; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [31:0] _GEN_31 = 3'h1 == chosen ? io_in_1_bits_address : io_in_0_bits_address; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [31:0] _GEN_32 = 3'h2 == chosen ? io_in_2_bits_address : _GEN_31; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [31:0] _GEN_33 = 3'h3 == chosen ? io_in_3_bits_address : _GEN_32; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [63:0] _GEN_36 = 3'h1 == chosen ? io_in_1_bits_data : io_in_0_bits_data; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [63:0] _GEN_37 = 3'h2 == chosen ? io_in_2_bits_data : _GEN_36; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [63:0] _GEN_38 = 3'h3 == chosen ? io_in_3_bits_data : _GEN_37; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire  _GEN_41 = 3'h1 == chosen ? io_in_1_bits_corrupt : io_in_0_bits_corrupt; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire  _GEN_42 = 3'h2 == chosen ? io_in_2_bits_corrupt : _GEN_41; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire  _GEN_43 = 3'h3 == chosen ? io_in_3_bits_corrupt : _GEN_42; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [7:0] _GEN_46 = 3'h1 == chosen ? io_in_1_bits_union : io_in_0_bits_union; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [7:0] _GEN_47 = 3'h2 == chosen ? io_in_2_bits_union : _GEN_46; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire [7:0] _GEN_48 = 3'h3 == chosen ? io_in_3_bits_union : _GEN_47; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire  _GEN_51 = 3'h1 == chosen ? io_in_1_bits_last : io_in_0_bits_last; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire  _GEN_52 = 3'h2 == chosen ? io_in_2_bits_last : _GEN_51; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire  _GEN_53 = 3'h3 == chosen ? io_in_3_bits_last : _GEN_52; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  wire  _T = io_out_ready & io_out_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_56 = ~locked | locked; // @[Arbiters.scala 59:50 Arbiters.scala 61:14 Arbiters.scala 26:19]
  assign io_in_0_ready = io_out_ready & chosen == 3'h0; // @[Arbiters.scala 39:36]
  assign io_in_1_ready = io_out_ready & chosen == 3'h1; // @[Arbiters.scala 39:36]
  assign io_in_2_ready = io_out_ready & chosen == 3'h2; // @[Arbiters.scala 39:36]
  assign io_in_3_ready = io_out_ready & chosen == 3'h3; // @[Arbiters.scala 39:36]
  assign io_in_4_ready = io_out_ready & chosen == 3'h4; // @[Arbiters.scala 39:36]
  assign io_out_valid = 3'h4 == chosen ? io_in_4_valid : _GEN_3; // @[Arbiters.scala 42:16 Arbiters.scala 42:16]
  assign io_out_bits_chanId = 3'h4 == chosen ? io_in_4_bits_chanId : _GEN_8; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  assign io_out_bits_opcode = 3'h4 == chosen ? io_in_4_bits_opcode : _GEN_13; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  assign io_out_bits_param = 3'h4 == chosen ? io_in_4_bits_param : _GEN_18; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  assign io_out_bits_size = 3'h4 == chosen ? io_in_4_bits_size : _GEN_23; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  assign io_out_bits_source = 3'h4 == chosen ? io_in_4_bits_source : _GEN_28; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  assign io_out_bits_address = 3'h4 == chosen ? io_in_4_bits_address : _GEN_33; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  assign io_out_bits_data = 3'h4 == chosen ? io_in_4_bits_data : _GEN_38; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  assign io_out_bits_corrupt = 3'h4 == chosen ? io_in_4_bits_corrupt : _GEN_43; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  assign io_out_bits_union = 3'h4 == chosen ? io_in_4_bits_union : _GEN_48; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  assign io_out_bits_last = 3'h4 == chosen ? io_in_4_bits_last : _GEN_53; // @[Arbiters.scala 43:15 Arbiters.scala 43:15]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiters.scala 25:20]
      lockIdx <= 3'h0; // @[Arbiters.scala 25:20]
    end else if (_T) begin // @[Arbiters.scala 58:24]
      if (~locked) begin // @[Arbiters.scala 59:50]
        if (io_in_0_valid) begin // @[Mux.scala 47:69]
          lockIdx <= 3'h0;
        end else begin
          lockIdx <= _choice_T_2;
        end
      end
    end
    if (reset) begin // @[Arbiters.scala 26:19]
      locked <= 1'h0; // @[Arbiters.scala 26:19]
    end else if (_T) begin // @[Arbiters.scala 58:24]
      if (io_out_bits_last) begin // @[Arbiters.scala 64:35]
        locked <= 1'h0; // @[Arbiters.scala 65:14]
      end else begin
        locked <= _GEN_56;
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
  lockIdx = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  locked = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
