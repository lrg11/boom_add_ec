module Queue_22(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [39:0] io_enq_bits_pc,
  input         io_enq_bits_preds_0_taken,
  input         io_enq_bits_preds_0_is_br,
  input         io_enq_bits_preds_0_is_jal,
  input         io_enq_bits_preds_0_predicted_pc_valid,
  input  [39:0] io_enq_bits_preds_0_predicted_pc_bits,
  input         io_enq_bits_preds_1_taken,
  input         io_enq_bits_preds_1_is_br,
  input         io_enq_bits_preds_1_is_jal,
  input         io_enq_bits_preds_1_predicted_pc_valid,
  input  [39:0] io_enq_bits_preds_1_predicted_pc_bits,
  input         io_enq_bits_preds_2_taken,
  input         io_enq_bits_preds_2_is_br,
  input         io_enq_bits_preds_2_is_jal,
  input         io_enq_bits_preds_2_predicted_pc_valid,
  input  [39:0] io_enq_bits_preds_2_predicted_pc_bits,
  input         io_enq_bits_preds_3_taken,
  input         io_enq_bits_preds_3_is_br,
  input         io_enq_bits_preds_3_is_jal,
  input         io_enq_bits_preds_3_predicted_pc_valid,
  input  [39:0] io_enq_bits_preds_3_predicted_pc_bits,
  input  [44:0] io_enq_bits_meta_0,
  input         io_enq_bits_lhist_0,
  input         io_deq_ready,
  output        io_deq_valid,
  output [39:0] io_deq_bits_pc,
  output        io_deq_bits_preds_0_taken,
  output        io_deq_bits_preds_0_is_br,
  output        io_deq_bits_preds_0_is_jal,
  output        io_deq_bits_preds_0_predicted_pc_valid,
  output [39:0] io_deq_bits_preds_0_predicted_pc_bits,
  output        io_deq_bits_preds_1_taken,
  output        io_deq_bits_preds_1_is_br,
  output        io_deq_bits_preds_1_is_jal,
  output        io_deq_bits_preds_1_predicted_pc_valid,
  output [39:0] io_deq_bits_preds_1_predicted_pc_bits,
  output        io_deq_bits_preds_2_taken,
  output        io_deq_bits_preds_2_is_br,
  output        io_deq_bits_preds_2_is_jal,
  output        io_deq_bits_preds_2_predicted_pc_valid,
  output [39:0] io_deq_bits_preds_2_predicted_pc_bits,
  output        io_deq_bits_preds_3_taken,
  output        io_deq_bits_preds_3_is_br,
  output        io_deq_bits_preds_3_is_jal,
  output        io_deq_bits_preds_3_predicted_pc_valid,
  output [39:0] io_deq_bits_preds_3_predicted_pc_bits,
  output [44:0] io_deq_bits_meta_0,
  output        io_deq_bits_lhist_0,
  output        io_count
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [31:0] _RAND_22;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_23;
`endif // RANDOMIZE_REG_INIT
  reg [39:0] ram_pc [0:0]; // @[Decoupled.scala 218:16]
  wire [39:0] ram_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_pc_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [39:0] ram_pc_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_0_taken [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_0_is_br [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_br_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_br_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_br_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_br_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_br_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_br_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_0_is_jal [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_jal_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_jal_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_jal_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_jal_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_jal_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_is_jal_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_0_predicted_pc_valid [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_predicted_pc_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_predicted_pc_valid_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_predicted_pc_valid_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_predicted_pc_valid_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_predicted_pc_valid_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_predicted_pc_valid_MPORT_en; // @[Decoupled.scala 218:16]
  reg [39:0] ram_preds_0_predicted_pc_bits [0:0]; // @[Decoupled.scala 218:16]
  wire [39:0] ram_preds_0_predicted_pc_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_predicted_pc_bits_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [39:0] ram_preds_0_predicted_pc_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_predicted_pc_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_predicted_pc_bits_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_0_predicted_pc_bits_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_1_taken [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_1_is_br [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_br_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_br_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_br_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_br_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_br_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_br_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_1_is_jal [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_jal_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_jal_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_jal_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_jal_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_jal_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_is_jal_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_1_predicted_pc_valid [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_predicted_pc_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_predicted_pc_valid_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_predicted_pc_valid_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_predicted_pc_valid_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_predicted_pc_valid_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_predicted_pc_valid_MPORT_en; // @[Decoupled.scala 218:16]
  reg [39:0] ram_preds_1_predicted_pc_bits [0:0]; // @[Decoupled.scala 218:16]
  wire [39:0] ram_preds_1_predicted_pc_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_predicted_pc_bits_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [39:0] ram_preds_1_predicted_pc_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_predicted_pc_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_predicted_pc_bits_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_1_predicted_pc_bits_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_2_taken [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_2_is_br [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_br_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_br_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_br_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_br_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_br_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_br_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_2_is_jal [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_jal_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_jal_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_jal_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_jal_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_jal_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_is_jal_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_2_predicted_pc_valid [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_predicted_pc_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_predicted_pc_valid_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_predicted_pc_valid_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_predicted_pc_valid_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_predicted_pc_valid_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_predicted_pc_valid_MPORT_en; // @[Decoupled.scala 218:16]
  reg [39:0] ram_preds_2_predicted_pc_bits [0:0]; // @[Decoupled.scala 218:16]
  wire [39:0] ram_preds_2_predicted_pc_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_predicted_pc_bits_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [39:0] ram_preds_2_predicted_pc_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_predicted_pc_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_predicted_pc_bits_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_2_predicted_pc_bits_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_3_taken [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_3_is_br [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_br_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_br_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_br_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_br_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_br_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_br_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_3_is_jal [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_jal_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_jal_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_jal_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_jal_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_jal_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_is_jal_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_preds_3_predicted_pc_valid [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_predicted_pc_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_predicted_pc_valid_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_predicted_pc_valid_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_predicted_pc_valid_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_predicted_pc_valid_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_predicted_pc_valid_MPORT_en; // @[Decoupled.scala 218:16]
  reg [39:0] ram_preds_3_predicted_pc_bits [0:0]; // @[Decoupled.scala 218:16]
  wire [39:0] ram_preds_3_predicted_pc_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_predicted_pc_bits_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [39:0] ram_preds_3_predicted_pc_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_predicted_pc_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_predicted_pc_bits_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_preds_3_predicted_pc_bits_MPORT_en; // @[Decoupled.scala 218:16]
  reg [44:0] ram_meta_0 [0:0]; // @[Decoupled.scala 218:16]
  wire [44:0] ram_meta_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_meta_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [44:0] ram_meta_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_meta_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_meta_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_meta_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_lhist_0 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 224:28]
  wire  _do_enq_T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  _do_deq_T = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_29 = io_deq_ready ? 1'h0 : _do_enq_T; // @[Decoupled.scala 249:27 Decoupled.scala 249:36]
  wire  do_enq = empty ? _GEN_29 : _do_enq_T; // @[Decoupled.scala 246:18]
  wire  do_deq = empty ? 1'h0 : _do_deq_T; // @[Decoupled.scala 246:18 Decoupled.scala 248:14]
  assign ram_pc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_pc_io_deq_bits_MPORT_data = ram_pc[ram_pc_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_pc_MPORT_data = io_enq_bits_pc;
  assign ram_pc_MPORT_addr = 1'h0;
  assign ram_pc_MPORT_mask = 1'h1;
  assign ram_pc_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_0_taken_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_0_taken_io_deq_bits_MPORT_data = ram_preds_0_taken[ram_preds_0_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_0_taken_MPORT_data = io_enq_bits_preds_0_taken;
  assign ram_preds_0_taken_MPORT_addr = 1'h0;
  assign ram_preds_0_taken_MPORT_mask = 1'h1;
  assign ram_preds_0_taken_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_0_is_br_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_0_is_br_io_deq_bits_MPORT_data = ram_preds_0_is_br[ram_preds_0_is_br_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_0_is_br_MPORT_data = io_enq_bits_preds_0_is_br;
  assign ram_preds_0_is_br_MPORT_addr = 1'h0;
  assign ram_preds_0_is_br_MPORT_mask = 1'h1;
  assign ram_preds_0_is_br_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_0_is_jal_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_0_is_jal_io_deq_bits_MPORT_data = ram_preds_0_is_jal[ram_preds_0_is_jal_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_0_is_jal_MPORT_data = io_enq_bits_preds_0_is_jal;
  assign ram_preds_0_is_jal_MPORT_addr = 1'h0;
  assign ram_preds_0_is_jal_MPORT_mask = 1'h1;
  assign ram_preds_0_is_jal_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_0_predicted_pc_valid_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_0_predicted_pc_valid_io_deq_bits_MPORT_data =
    ram_preds_0_predicted_pc_valid[ram_preds_0_predicted_pc_valid_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_0_predicted_pc_valid_MPORT_data = io_enq_bits_preds_0_predicted_pc_valid;
  assign ram_preds_0_predicted_pc_valid_MPORT_addr = 1'h0;
  assign ram_preds_0_predicted_pc_valid_MPORT_mask = 1'h1;
  assign ram_preds_0_predicted_pc_valid_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_0_predicted_pc_bits_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_0_predicted_pc_bits_io_deq_bits_MPORT_data =
    ram_preds_0_predicted_pc_bits[ram_preds_0_predicted_pc_bits_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_0_predicted_pc_bits_MPORT_data = io_enq_bits_preds_0_predicted_pc_bits;
  assign ram_preds_0_predicted_pc_bits_MPORT_addr = 1'h0;
  assign ram_preds_0_predicted_pc_bits_MPORT_mask = 1'h1;
  assign ram_preds_0_predicted_pc_bits_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_1_taken_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_1_taken_io_deq_bits_MPORT_data = ram_preds_1_taken[ram_preds_1_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_1_taken_MPORT_data = io_enq_bits_preds_1_taken;
  assign ram_preds_1_taken_MPORT_addr = 1'h0;
  assign ram_preds_1_taken_MPORT_mask = 1'h1;
  assign ram_preds_1_taken_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_1_is_br_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_1_is_br_io_deq_bits_MPORT_data = ram_preds_1_is_br[ram_preds_1_is_br_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_1_is_br_MPORT_data = io_enq_bits_preds_1_is_br;
  assign ram_preds_1_is_br_MPORT_addr = 1'h0;
  assign ram_preds_1_is_br_MPORT_mask = 1'h1;
  assign ram_preds_1_is_br_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_1_is_jal_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_1_is_jal_io_deq_bits_MPORT_data = ram_preds_1_is_jal[ram_preds_1_is_jal_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_1_is_jal_MPORT_data = io_enq_bits_preds_1_is_jal;
  assign ram_preds_1_is_jal_MPORT_addr = 1'h0;
  assign ram_preds_1_is_jal_MPORT_mask = 1'h1;
  assign ram_preds_1_is_jal_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_1_predicted_pc_valid_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_1_predicted_pc_valid_io_deq_bits_MPORT_data =
    ram_preds_1_predicted_pc_valid[ram_preds_1_predicted_pc_valid_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_1_predicted_pc_valid_MPORT_data = io_enq_bits_preds_1_predicted_pc_valid;
  assign ram_preds_1_predicted_pc_valid_MPORT_addr = 1'h0;
  assign ram_preds_1_predicted_pc_valid_MPORT_mask = 1'h1;
  assign ram_preds_1_predicted_pc_valid_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_1_predicted_pc_bits_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_1_predicted_pc_bits_io_deq_bits_MPORT_data =
    ram_preds_1_predicted_pc_bits[ram_preds_1_predicted_pc_bits_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_1_predicted_pc_bits_MPORT_data = io_enq_bits_preds_1_predicted_pc_bits;
  assign ram_preds_1_predicted_pc_bits_MPORT_addr = 1'h0;
  assign ram_preds_1_predicted_pc_bits_MPORT_mask = 1'h1;
  assign ram_preds_1_predicted_pc_bits_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_2_taken_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_2_taken_io_deq_bits_MPORT_data = ram_preds_2_taken[ram_preds_2_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_2_taken_MPORT_data = io_enq_bits_preds_2_taken;
  assign ram_preds_2_taken_MPORT_addr = 1'h0;
  assign ram_preds_2_taken_MPORT_mask = 1'h1;
  assign ram_preds_2_taken_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_2_is_br_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_2_is_br_io_deq_bits_MPORT_data = ram_preds_2_is_br[ram_preds_2_is_br_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_2_is_br_MPORT_data = io_enq_bits_preds_2_is_br;
  assign ram_preds_2_is_br_MPORT_addr = 1'h0;
  assign ram_preds_2_is_br_MPORT_mask = 1'h1;
  assign ram_preds_2_is_br_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_2_is_jal_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_2_is_jal_io_deq_bits_MPORT_data = ram_preds_2_is_jal[ram_preds_2_is_jal_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_2_is_jal_MPORT_data = io_enq_bits_preds_2_is_jal;
  assign ram_preds_2_is_jal_MPORT_addr = 1'h0;
  assign ram_preds_2_is_jal_MPORT_mask = 1'h1;
  assign ram_preds_2_is_jal_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_2_predicted_pc_valid_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_2_predicted_pc_valid_io_deq_bits_MPORT_data =
    ram_preds_2_predicted_pc_valid[ram_preds_2_predicted_pc_valid_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_2_predicted_pc_valid_MPORT_data = io_enq_bits_preds_2_predicted_pc_valid;
  assign ram_preds_2_predicted_pc_valid_MPORT_addr = 1'h0;
  assign ram_preds_2_predicted_pc_valid_MPORT_mask = 1'h1;
  assign ram_preds_2_predicted_pc_valid_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_2_predicted_pc_bits_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_2_predicted_pc_bits_io_deq_bits_MPORT_data =
    ram_preds_2_predicted_pc_bits[ram_preds_2_predicted_pc_bits_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_2_predicted_pc_bits_MPORT_data = io_enq_bits_preds_2_predicted_pc_bits;
  assign ram_preds_2_predicted_pc_bits_MPORT_addr = 1'h0;
  assign ram_preds_2_predicted_pc_bits_MPORT_mask = 1'h1;
  assign ram_preds_2_predicted_pc_bits_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_3_taken_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_3_taken_io_deq_bits_MPORT_data = ram_preds_3_taken[ram_preds_3_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_3_taken_MPORT_data = io_enq_bits_preds_3_taken;
  assign ram_preds_3_taken_MPORT_addr = 1'h0;
  assign ram_preds_3_taken_MPORT_mask = 1'h1;
  assign ram_preds_3_taken_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_3_is_br_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_3_is_br_io_deq_bits_MPORT_data = ram_preds_3_is_br[ram_preds_3_is_br_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_3_is_br_MPORT_data = io_enq_bits_preds_3_is_br;
  assign ram_preds_3_is_br_MPORT_addr = 1'h0;
  assign ram_preds_3_is_br_MPORT_mask = 1'h1;
  assign ram_preds_3_is_br_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_3_is_jal_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_3_is_jal_io_deq_bits_MPORT_data = ram_preds_3_is_jal[ram_preds_3_is_jal_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_3_is_jal_MPORT_data = io_enq_bits_preds_3_is_jal;
  assign ram_preds_3_is_jal_MPORT_addr = 1'h0;
  assign ram_preds_3_is_jal_MPORT_mask = 1'h1;
  assign ram_preds_3_is_jal_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_3_predicted_pc_valid_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_3_predicted_pc_valid_io_deq_bits_MPORT_data =
    ram_preds_3_predicted_pc_valid[ram_preds_3_predicted_pc_valid_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_3_predicted_pc_valid_MPORT_data = io_enq_bits_preds_3_predicted_pc_valid;
  assign ram_preds_3_predicted_pc_valid_MPORT_addr = 1'h0;
  assign ram_preds_3_predicted_pc_valid_MPORT_mask = 1'h1;
  assign ram_preds_3_predicted_pc_valid_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_preds_3_predicted_pc_bits_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_preds_3_predicted_pc_bits_io_deq_bits_MPORT_data =
    ram_preds_3_predicted_pc_bits[ram_preds_3_predicted_pc_bits_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_preds_3_predicted_pc_bits_MPORT_data = io_enq_bits_preds_3_predicted_pc_bits;
  assign ram_preds_3_predicted_pc_bits_MPORT_addr = 1'h0;
  assign ram_preds_3_predicted_pc_bits_MPORT_mask = 1'h1;
  assign ram_preds_3_predicted_pc_bits_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_meta_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_meta_0_io_deq_bits_MPORT_data = ram_meta_0[ram_meta_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_meta_0_MPORT_data = io_enq_bits_meta_0;
  assign ram_meta_0_MPORT_addr = 1'h0;
  assign ram_meta_0_MPORT_mask = 1'h1;
  assign ram_meta_0_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign ram_lhist_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_lhist_0_io_deq_bits_MPORT_data = ram_lhist_0[ram_lhist_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_lhist_0_MPORT_data = io_enq_bits_lhist_0;
  assign ram_lhist_0_MPORT_addr = 1'h0;
  assign ram_lhist_0_MPORT_mask = 1'h1;
  assign ram_lhist_0_MPORT_en = empty ? _GEN_29 : _do_enq_T;
  assign io_enq_ready = io_deq_ready | empty; // @[Decoupled.scala 254:25 Decoupled.scala 254:40 Decoupled.scala 241:16]
  assign io_deq_valid = io_enq_valid | ~empty; // @[Decoupled.scala 245:25 Decoupled.scala 245:40 Decoupled.scala 240:16]
  assign io_deq_bits_pc = empty ? io_enq_bits_pc : ram_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_0_taken = empty ? io_enq_bits_preds_0_taken : ram_preds_0_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_0_is_br = empty ? io_enq_bits_preds_0_is_br : ram_preds_0_is_br_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_0_is_jal = empty ? io_enq_bits_preds_0_is_jal : ram_preds_0_is_jal_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_0_predicted_pc_valid = empty ? io_enq_bits_preds_0_predicted_pc_valid :
    ram_preds_0_predicted_pc_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_0_predicted_pc_bits = empty ? io_enq_bits_preds_0_predicted_pc_bits :
    ram_preds_0_predicted_pc_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_1_taken = empty ? io_enq_bits_preds_1_taken : ram_preds_1_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_1_is_br = empty ? io_enq_bits_preds_1_is_br : ram_preds_1_is_br_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_1_is_jal = empty ? io_enq_bits_preds_1_is_jal : ram_preds_1_is_jal_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_1_predicted_pc_valid = empty ? io_enq_bits_preds_1_predicted_pc_valid :
    ram_preds_1_predicted_pc_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_1_predicted_pc_bits = empty ? io_enq_bits_preds_1_predicted_pc_bits :
    ram_preds_1_predicted_pc_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_2_taken = empty ? io_enq_bits_preds_2_taken : ram_preds_2_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_2_is_br = empty ? io_enq_bits_preds_2_is_br : ram_preds_2_is_br_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_2_is_jal = empty ? io_enq_bits_preds_2_is_jal : ram_preds_2_is_jal_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_2_predicted_pc_valid = empty ? io_enq_bits_preds_2_predicted_pc_valid :
    ram_preds_2_predicted_pc_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_2_predicted_pc_bits = empty ? io_enq_bits_preds_2_predicted_pc_bits :
    ram_preds_2_predicted_pc_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_3_taken = empty ? io_enq_bits_preds_3_taken : ram_preds_3_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_3_is_br = empty ? io_enq_bits_preds_3_is_br : ram_preds_3_is_br_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_3_is_jal = empty ? io_enq_bits_preds_3_is_jal : ram_preds_3_is_jal_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_3_predicted_pc_valid = empty ? io_enq_bits_preds_3_predicted_pc_valid :
    ram_preds_3_predicted_pc_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_preds_3_predicted_pc_bits = empty ? io_enq_bits_preds_3_predicted_pc_bits :
    ram_preds_3_predicted_pc_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_meta_0 = empty ? io_enq_bits_meta_0 : ram_meta_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_deq_bits_lhist_0 = empty ? io_enq_bits_lhist_0 : ram_lhist_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 246:18 Decoupled.scala 247:19 Decoupled.scala 242:15]
  assign io_count = maybe_full; // @[Decoupled.scala 259:62]
  always @(posedge clock) begin
    if(ram_pc_MPORT_en & ram_pc_MPORT_mask) begin
      ram_pc[ram_pc_MPORT_addr] <= ram_pc_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_0_taken_MPORT_en & ram_preds_0_taken_MPORT_mask) begin
      ram_preds_0_taken[ram_preds_0_taken_MPORT_addr] <= ram_preds_0_taken_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_0_is_br_MPORT_en & ram_preds_0_is_br_MPORT_mask) begin
      ram_preds_0_is_br[ram_preds_0_is_br_MPORT_addr] <= ram_preds_0_is_br_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_0_is_jal_MPORT_en & ram_preds_0_is_jal_MPORT_mask) begin
      ram_preds_0_is_jal[ram_preds_0_is_jal_MPORT_addr] <= ram_preds_0_is_jal_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_0_predicted_pc_valid_MPORT_en & ram_preds_0_predicted_pc_valid_MPORT_mask) begin
      ram_preds_0_predicted_pc_valid[ram_preds_0_predicted_pc_valid_MPORT_addr] <=
        ram_preds_0_predicted_pc_valid_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_0_predicted_pc_bits_MPORT_en & ram_preds_0_predicted_pc_bits_MPORT_mask) begin
      ram_preds_0_predicted_pc_bits[ram_preds_0_predicted_pc_bits_MPORT_addr] <=
        ram_preds_0_predicted_pc_bits_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_1_taken_MPORT_en & ram_preds_1_taken_MPORT_mask) begin
      ram_preds_1_taken[ram_preds_1_taken_MPORT_addr] <= ram_preds_1_taken_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_1_is_br_MPORT_en & ram_preds_1_is_br_MPORT_mask) begin
      ram_preds_1_is_br[ram_preds_1_is_br_MPORT_addr] <= ram_preds_1_is_br_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_1_is_jal_MPORT_en & ram_preds_1_is_jal_MPORT_mask) begin
      ram_preds_1_is_jal[ram_preds_1_is_jal_MPORT_addr] <= ram_preds_1_is_jal_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_1_predicted_pc_valid_MPORT_en & ram_preds_1_predicted_pc_valid_MPORT_mask) begin
      ram_preds_1_predicted_pc_valid[ram_preds_1_predicted_pc_valid_MPORT_addr] <=
        ram_preds_1_predicted_pc_valid_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_1_predicted_pc_bits_MPORT_en & ram_preds_1_predicted_pc_bits_MPORT_mask) begin
      ram_preds_1_predicted_pc_bits[ram_preds_1_predicted_pc_bits_MPORT_addr] <=
        ram_preds_1_predicted_pc_bits_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_2_taken_MPORT_en & ram_preds_2_taken_MPORT_mask) begin
      ram_preds_2_taken[ram_preds_2_taken_MPORT_addr] <= ram_preds_2_taken_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_2_is_br_MPORT_en & ram_preds_2_is_br_MPORT_mask) begin
      ram_preds_2_is_br[ram_preds_2_is_br_MPORT_addr] <= ram_preds_2_is_br_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_2_is_jal_MPORT_en & ram_preds_2_is_jal_MPORT_mask) begin
      ram_preds_2_is_jal[ram_preds_2_is_jal_MPORT_addr] <= ram_preds_2_is_jal_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_2_predicted_pc_valid_MPORT_en & ram_preds_2_predicted_pc_valid_MPORT_mask) begin
      ram_preds_2_predicted_pc_valid[ram_preds_2_predicted_pc_valid_MPORT_addr] <=
        ram_preds_2_predicted_pc_valid_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_2_predicted_pc_bits_MPORT_en & ram_preds_2_predicted_pc_bits_MPORT_mask) begin
      ram_preds_2_predicted_pc_bits[ram_preds_2_predicted_pc_bits_MPORT_addr] <=
        ram_preds_2_predicted_pc_bits_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_3_taken_MPORT_en & ram_preds_3_taken_MPORT_mask) begin
      ram_preds_3_taken[ram_preds_3_taken_MPORT_addr] <= ram_preds_3_taken_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_3_is_br_MPORT_en & ram_preds_3_is_br_MPORT_mask) begin
      ram_preds_3_is_br[ram_preds_3_is_br_MPORT_addr] <= ram_preds_3_is_br_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_3_is_jal_MPORT_en & ram_preds_3_is_jal_MPORT_mask) begin
      ram_preds_3_is_jal[ram_preds_3_is_jal_MPORT_addr] <= ram_preds_3_is_jal_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_3_predicted_pc_valid_MPORT_en & ram_preds_3_predicted_pc_valid_MPORT_mask) begin
      ram_preds_3_predicted_pc_valid[ram_preds_3_predicted_pc_valid_MPORT_addr] <=
        ram_preds_3_predicted_pc_valid_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_preds_3_predicted_pc_bits_MPORT_en & ram_preds_3_predicted_pc_bits_MPORT_mask) begin
      ram_preds_3_predicted_pc_bits[ram_preds_3_predicted_pc_bits_MPORT_addr] <=
        ram_preds_3_predicted_pc_bits_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_meta_0_MPORT_en & ram_meta_0_MPORT_mask) begin
      ram_meta_0[ram_meta_0_MPORT_addr] <= ram_meta_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_lhist_0_MPORT_en & ram_lhist_0_MPORT_mask) begin
      ram_lhist_0[ram_lhist_0_MPORT_addr] <= ram_lhist_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      if (empty) begin // @[Decoupled.scala 246:18]
        if (io_deq_ready) begin // @[Decoupled.scala 249:27]
          maybe_full <= 1'h0; // @[Decoupled.scala 249:36]
        end else begin
          maybe_full <= _do_enq_T;
        end
      end else begin
        maybe_full <= _do_enq_T;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_pc[initvar] = _RAND_0[39:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_0_taken[initvar] = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_0_is_br[initvar] = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_0_is_jal[initvar] = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_0_predicted_pc_valid[initvar] = _RAND_4[0:0];
  _RAND_5 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_0_predicted_pc_bits[initvar] = _RAND_5[39:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_1_taken[initvar] = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_1_is_br[initvar] = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_1_is_jal[initvar] = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_1_predicted_pc_valid[initvar] = _RAND_9[0:0];
  _RAND_10 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_1_predicted_pc_bits[initvar] = _RAND_10[39:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_2_taken[initvar] = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_2_is_br[initvar] = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_2_is_jal[initvar] = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_2_predicted_pc_valid[initvar] = _RAND_14[0:0];
  _RAND_15 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_2_predicted_pc_bits[initvar] = _RAND_15[39:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_3_taken[initvar] = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_3_is_br[initvar] = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_3_is_jal[initvar] = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_3_predicted_pc_valid[initvar] = _RAND_19[0:0];
  _RAND_20 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_preds_3_predicted_pc_bits[initvar] = _RAND_20[39:0];
  _RAND_21 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_meta_0[initvar] = _RAND_21[44:0];
  _RAND_22 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_lhist_0[initvar] = _RAND_22[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  maybe_full = _RAND_23[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
