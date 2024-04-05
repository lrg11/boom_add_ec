module BTBBranchPredictorBank(
  input          clock,
  input          reset,
  input          io_f0_valid,
  input  [39:0]  io_f0_pc,
  input  [3:0]   io_f0_mask,
  input  [63:0]  io_f1_ghist,
  input          io_f1_lhist,
  input          io_resp_in_0_f1_0_taken,
  input          io_resp_in_0_f1_0_is_br,
  input          io_resp_in_0_f1_0_is_jal,
  input          io_resp_in_0_f1_0_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f1_0_predicted_pc_bits,
  input          io_resp_in_0_f1_1_taken,
  input          io_resp_in_0_f1_1_is_br,
  input          io_resp_in_0_f1_1_is_jal,
  input          io_resp_in_0_f1_1_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f1_1_predicted_pc_bits,
  input          io_resp_in_0_f1_2_taken,
  input          io_resp_in_0_f1_2_is_br,
  input          io_resp_in_0_f1_2_is_jal,
  input          io_resp_in_0_f1_2_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f1_2_predicted_pc_bits,
  input          io_resp_in_0_f1_3_taken,
  input          io_resp_in_0_f1_3_is_br,
  input          io_resp_in_0_f1_3_is_jal,
  input          io_resp_in_0_f1_3_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f1_3_predicted_pc_bits,
  input          io_resp_in_0_f2_0_taken,
  input          io_resp_in_0_f2_0_is_br,
  input          io_resp_in_0_f2_0_is_jal,
  input          io_resp_in_0_f2_0_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f2_0_predicted_pc_bits,
  input          io_resp_in_0_f2_1_taken,
  input          io_resp_in_0_f2_1_is_br,
  input          io_resp_in_0_f2_1_is_jal,
  input          io_resp_in_0_f2_1_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f2_1_predicted_pc_bits,
  input          io_resp_in_0_f2_2_taken,
  input          io_resp_in_0_f2_2_is_br,
  input          io_resp_in_0_f2_2_is_jal,
  input          io_resp_in_0_f2_2_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f2_2_predicted_pc_bits,
  input          io_resp_in_0_f2_3_taken,
  input          io_resp_in_0_f2_3_is_br,
  input          io_resp_in_0_f2_3_is_jal,
  input          io_resp_in_0_f2_3_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f2_3_predicted_pc_bits,
  input          io_resp_in_0_f3_0_taken,
  input          io_resp_in_0_f3_0_is_br,
  input          io_resp_in_0_f3_0_is_jal,
  input          io_resp_in_0_f3_0_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f3_0_predicted_pc_bits,
  input          io_resp_in_0_f3_1_taken,
  input          io_resp_in_0_f3_1_is_br,
  input          io_resp_in_0_f3_1_is_jal,
  input          io_resp_in_0_f3_1_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f3_1_predicted_pc_bits,
  input          io_resp_in_0_f3_2_taken,
  input          io_resp_in_0_f3_2_is_br,
  input          io_resp_in_0_f3_2_is_jal,
  input          io_resp_in_0_f3_2_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f3_2_predicted_pc_bits,
  input          io_resp_in_0_f3_3_taken,
  input          io_resp_in_0_f3_3_is_br,
  input          io_resp_in_0_f3_3_is_jal,
  input          io_resp_in_0_f3_3_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f3_3_predicted_pc_bits,
  output         io_resp_f1_0_taken,
  output         io_resp_f1_0_is_br,
  output         io_resp_f1_0_is_jal,
  output         io_resp_f1_0_predicted_pc_valid,
  output [39:0]  io_resp_f1_0_predicted_pc_bits,
  output         io_resp_f1_1_taken,
  output         io_resp_f1_1_is_br,
  output         io_resp_f1_1_is_jal,
  output         io_resp_f1_1_predicted_pc_valid,
  output [39:0]  io_resp_f1_1_predicted_pc_bits,
  output         io_resp_f1_2_taken,
  output         io_resp_f1_2_is_br,
  output         io_resp_f1_2_is_jal,
  output         io_resp_f1_2_predicted_pc_valid,
  output [39:0]  io_resp_f1_2_predicted_pc_bits,
  output         io_resp_f1_3_taken,
  output         io_resp_f1_3_is_br,
  output         io_resp_f1_3_is_jal,
  output         io_resp_f1_3_predicted_pc_valid,
  output [39:0]  io_resp_f1_3_predicted_pc_bits,
  output         io_resp_f2_0_taken,
  output         io_resp_f2_0_is_br,
  output         io_resp_f2_0_is_jal,
  output         io_resp_f2_0_predicted_pc_valid,
  output [39:0]  io_resp_f2_0_predicted_pc_bits,
  output         io_resp_f2_1_taken,
  output         io_resp_f2_1_is_br,
  output         io_resp_f2_1_is_jal,
  output         io_resp_f2_1_predicted_pc_valid,
  output [39:0]  io_resp_f2_1_predicted_pc_bits,
  output         io_resp_f2_2_taken,
  output         io_resp_f2_2_is_br,
  output         io_resp_f2_2_is_jal,
  output         io_resp_f2_2_predicted_pc_valid,
  output [39:0]  io_resp_f2_2_predicted_pc_bits,
  output         io_resp_f2_3_taken,
  output         io_resp_f2_3_is_br,
  output         io_resp_f2_3_is_jal,
  output         io_resp_f2_3_predicted_pc_valid,
  output [39:0]  io_resp_f2_3_predicted_pc_bits,
  output         io_resp_f3_0_taken,
  output         io_resp_f3_0_is_br,
  output         io_resp_f3_0_is_jal,
  output         io_resp_f3_0_predicted_pc_valid,
  output [39:0]  io_resp_f3_0_predicted_pc_bits,
  output         io_resp_f3_1_taken,
  output         io_resp_f3_1_is_br,
  output         io_resp_f3_1_is_jal,
  output         io_resp_f3_1_predicted_pc_valid,
  output [39:0]  io_resp_f3_1_predicted_pc_bits,
  output         io_resp_f3_2_taken,
  output         io_resp_f3_2_is_br,
  output         io_resp_f3_2_is_jal,
  output         io_resp_f3_2_predicted_pc_valid,
  output [39:0]  io_resp_f3_2_predicted_pc_bits,
  output         io_resp_f3_3_taken,
  output         io_resp_f3_3_is_br,
  output         io_resp_f3_3_is_jal,
  output         io_resp_f3_3_predicted_pc_valid,
  output [39:0]  io_resp_f3_3_predicted_pc_bits,
  output [119:0] io_f3_meta,
  input          io_f3_fire,
  input          io_update_valid,
  input          io_update_bits_is_mispredict_update,
  input          io_update_bits_is_repair_update,
  input  [3:0]   io_update_bits_btb_mispredicts,
  input  [39:0]  io_update_bits_pc,
  input  [3:0]   io_update_bits_br_mask,
  input          io_update_bits_cfi_idx_valid,
  input  [1:0]   io_update_bits_cfi_idx_bits,
  input          io_update_bits_cfi_taken,
  input          io_update_bits_cfi_mispredicted,
  input          io_update_bits_cfi_is_br,
  input          io_update_bits_cfi_is_jal,
  input          io_update_bits_cfi_is_jalr,
  input  [63:0]  io_update_bits_ghist,
  input          io_update_bits_lhist,
  input  [39:0]  io_update_bits_target,
  input  [119:0] io_update_bits_meta
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_45;
  reg [63:0] _RAND_48;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [63:0] _RAND_63;
  reg [127:0] _RAND_64;
  reg [63:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [63:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [63:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [63:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [63:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [63:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [63:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [63:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [63:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
`endif // RANDOMIZE_REG_INIT
  reg [30:0] meta_0_0 [0:127]; // @[btb.scala 65:47]
  wire [30:0] meta_0_0_MPORT_2_data; // @[btb.scala 65:47]
  wire [6:0] meta_0_0_MPORT_2_addr; // @[btb.scala 65:47]
  wire [30:0] meta_0_0_MPORT_5_data; // @[btb.scala 65:47]
  wire [6:0] meta_0_0_MPORT_5_addr; // @[btb.scala 65:47]
  wire  meta_0_0_MPORT_5_mask; // @[btb.scala 65:47]
  wire  meta_0_0_MPORT_5_en; // @[btb.scala 65:47]
  reg  meta_0_0_MPORT_2_en_pipe_0;
  reg [6:0] meta_0_0_MPORT_2_addr_pipe_0;
  reg [30:0] meta_0_1 [0:127]; // @[btb.scala 65:47]
  wire [30:0] meta_0_1_MPORT_2_data; // @[btb.scala 65:47]
  wire [6:0] meta_0_1_MPORT_2_addr; // @[btb.scala 65:47]
  wire [30:0] meta_0_1_MPORT_5_data; // @[btb.scala 65:47]
  wire [6:0] meta_0_1_MPORT_5_addr; // @[btb.scala 65:47]
  wire  meta_0_1_MPORT_5_mask; // @[btb.scala 65:47]
  wire  meta_0_1_MPORT_5_en; // @[btb.scala 65:47]
  reg  meta_0_1_MPORT_2_en_pipe_0;
  reg [6:0] meta_0_1_MPORT_2_addr_pipe_0;
  reg [30:0] meta_0_2 [0:127]; // @[btb.scala 65:47]
  wire [30:0] meta_0_2_MPORT_2_data; // @[btb.scala 65:47]
  wire [6:0] meta_0_2_MPORT_2_addr; // @[btb.scala 65:47]
  wire [30:0] meta_0_2_MPORT_5_data; // @[btb.scala 65:47]
  wire [6:0] meta_0_2_MPORT_5_addr; // @[btb.scala 65:47]
  wire  meta_0_2_MPORT_5_mask; // @[btb.scala 65:47]
  wire  meta_0_2_MPORT_5_en; // @[btb.scala 65:47]
  reg  meta_0_2_MPORT_2_en_pipe_0;
  reg [6:0] meta_0_2_MPORT_2_addr_pipe_0;
  reg [30:0] meta_0_3 [0:127]; // @[btb.scala 65:47]
  wire [30:0] meta_0_3_MPORT_2_data; // @[btb.scala 65:47]
  wire [6:0] meta_0_3_MPORT_2_addr; // @[btb.scala 65:47]
  wire [30:0] meta_0_3_MPORT_5_data; // @[btb.scala 65:47]
  wire [6:0] meta_0_3_MPORT_5_addr; // @[btb.scala 65:47]
  wire  meta_0_3_MPORT_5_mask; // @[btb.scala 65:47]
  wire  meta_0_3_MPORT_5_en; // @[btb.scala 65:47]
  reg  meta_0_3_MPORT_2_en_pipe_0;
  reg [6:0] meta_0_3_MPORT_2_addr_pipe_0;
  reg [30:0] meta_1_0 [0:127]; // @[btb.scala 65:47]
  wire [30:0] meta_1_0_MPORT_3_data; // @[btb.scala 65:47]
  wire [6:0] meta_1_0_MPORT_3_addr; // @[btb.scala 65:47]
  wire [30:0] meta_1_0_MPORT_7_data; // @[btb.scala 65:47]
  wire [6:0] meta_1_0_MPORT_7_addr; // @[btb.scala 65:47]
  wire  meta_1_0_MPORT_7_mask; // @[btb.scala 65:47]
  wire  meta_1_0_MPORT_7_en; // @[btb.scala 65:47]
  reg  meta_1_0_MPORT_3_en_pipe_0;
  reg [6:0] meta_1_0_MPORT_3_addr_pipe_0;
  reg [30:0] meta_1_1 [0:127]; // @[btb.scala 65:47]
  wire [30:0] meta_1_1_MPORT_3_data; // @[btb.scala 65:47]
  wire [6:0] meta_1_1_MPORT_3_addr; // @[btb.scala 65:47]
  wire [30:0] meta_1_1_MPORT_7_data; // @[btb.scala 65:47]
  wire [6:0] meta_1_1_MPORT_7_addr; // @[btb.scala 65:47]
  wire  meta_1_1_MPORT_7_mask; // @[btb.scala 65:47]
  wire  meta_1_1_MPORT_7_en; // @[btb.scala 65:47]
  reg  meta_1_1_MPORT_3_en_pipe_0;
  reg [6:0] meta_1_1_MPORT_3_addr_pipe_0;
  reg [30:0] meta_1_2 [0:127]; // @[btb.scala 65:47]
  wire [30:0] meta_1_2_MPORT_3_data; // @[btb.scala 65:47]
  wire [6:0] meta_1_2_MPORT_3_addr; // @[btb.scala 65:47]
  wire [30:0] meta_1_2_MPORT_7_data; // @[btb.scala 65:47]
  wire [6:0] meta_1_2_MPORT_7_addr; // @[btb.scala 65:47]
  wire  meta_1_2_MPORT_7_mask; // @[btb.scala 65:47]
  wire  meta_1_2_MPORT_7_en; // @[btb.scala 65:47]
  reg  meta_1_2_MPORT_3_en_pipe_0;
  reg [6:0] meta_1_2_MPORT_3_addr_pipe_0;
  reg [30:0] meta_1_3 [0:127]; // @[btb.scala 65:47]
  wire [30:0] meta_1_3_MPORT_3_data; // @[btb.scala 65:47]
  wire [6:0] meta_1_3_MPORT_3_addr; // @[btb.scala 65:47]
  wire [30:0] meta_1_3_MPORT_7_data; // @[btb.scala 65:47]
  wire [6:0] meta_1_3_MPORT_7_addr; // @[btb.scala 65:47]
  wire  meta_1_3_MPORT_7_mask; // @[btb.scala 65:47]
  wire  meta_1_3_MPORT_7_en; // @[btb.scala 65:47]
  reg  meta_1_3_MPORT_3_en_pipe_0;
  reg [6:0] meta_1_3_MPORT_3_addr_pipe_0;
  reg [13:0] btb_0_0 [0:127]; // @[btb.scala 66:47]
  wire [13:0] btb_0_0_MPORT_data; // @[btb.scala 66:47]
  wire [6:0] btb_0_0_MPORT_addr; // @[btb.scala 66:47]
  wire [13:0] btb_0_0_MPORT_4_data; // @[btb.scala 66:47]
  wire [6:0] btb_0_0_MPORT_4_addr; // @[btb.scala 66:47]
  wire  btb_0_0_MPORT_4_mask; // @[btb.scala 66:47]
  wire  btb_0_0_MPORT_4_en; // @[btb.scala 66:47]
  reg  btb_0_0_MPORT_en_pipe_0;
  reg [6:0] btb_0_0_MPORT_addr_pipe_0;
  reg [13:0] btb_0_1 [0:127]; // @[btb.scala 66:47]
  wire [13:0] btb_0_1_MPORT_data; // @[btb.scala 66:47]
  wire [6:0] btb_0_1_MPORT_addr; // @[btb.scala 66:47]
  wire [13:0] btb_0_1_MPORT_4_data; // @[btb.scala 66:47]
  wire [6:0] btb_0_1_MPORT_4_addr; // @[btb.scala 66:47]
  wire  btb_0_1_MPORT_4_mask; // @[btb.scala 66:47]
  wire  btb_0_1_MPORT_4_en; // @[btb.scala 66:47]
  reg  btb_0_1_MPORT_en_pipe_0;
  reg [6:0] btb_0_1_MPORT_addr_pipe_0;
  reg [13:0] btb_0_2 [0:127]; // @[btb.scala 66:47]
  wire [13:0] btb_0_2_MPORT_data; // @[btb.scala 66:47]
  wire [6:0] btb_0_2_MPORT_addr; // @[btb.scala 66:47]
  wire [13:0] btb_0_2_MPORT_4_data; // @[btb.scala 66:47]
  wire [6:0] btb_0_2_MPORT_4_addr; // @[btb.scala 66:47]
  wire  btb_0_2_MPORT_4_mask; // @[btb.scala 66:47]
  wire  btb_0_2_MPORT_4_en; // @[btb.scala 66:47]
  reg  btb_0_2_MPORT_en_pipe_0;
  reg [6:0] btb_0_2_MPORT_addr_pipe_0;
  reg [13:0] btb_0_3 [0:127]; // @[btb.scala 66:47]
  wire [13:0] btb_0_3_MPORT_data; // @[btb.scala 66:47]
  wire [6:0] btb_0_3_MPORT_addr; // @[btb.scala 66:47]
  wire [13:0] btb_0_3_MPORT_4_data; // @[btb.scala 66:47]
  wire [6:0] btb_0_3_MPORT_4_addr; // @[btb.scala 66:47]
  wire  btb_0_3_MPORT_4_mask; // @[btb.scala 66:47]
  wire  btb_0_3_MPORT_4_en; // @[btb.scala 66:47]
  reg  btb_0_3_MPORT_en_pipe_0;
  reg [6:0] btb_0_3_MPORT_addr_pipe_0;
  reg [13:0] btb_1_0 [0:127]; // @[btb.scala 66:47]
  wire [13:0] btb_1_0_MPORT_1_data; // @[btb.scala 66:47]
  wire [6:0] btb_1_0_MPORT_1_addr; // @[btb.scala 66:47]
  wire [13:0] btb_1_0_MPORT_6_data; // @[btb.scala 66:47]
  wire [6:0] btb_1_0_MPORT_6_addr; // @[btb.scala 66:47]
  wire  btb_1_0_MPORT_6_mask; // @[btb.scala 66:47]
  wire  btb_1_0_MPORT_6_en; // @[btb.scala 66:47]
  reg  btb_1_0_MPORT_1_en_pipe_0;
  reg [6:0] btb_1_0_MPORT_1_addr_pipe_0;
  reg [13:0] btb_1_1 [0:127]; // @[btb.scala 66:47]
  wire [13:0] btb_1_1_MPORT_1_data; // @[btb.scala 66:47]
  wire [6:0] btb_1_1_MPORT_1_addr; // @[btb.scala 66:47]
  wire [13:0] btb_1_1_MPORT_6_data; // @[btb.scala 66:47]
  wire [6:0] btb_1_1_MPORT_6_addr; // @[btb.scala 66:47]
  wire  btb_1_1_MPORT_6_mask; // @[btb.scala 66:47]
  wire  btb_1_1_MPORT_6_en; // @[btb.scala 66:47]
  reg  btb_1_1_MPORT_1_en_pipe_0;
  reg [6:0] btb_1_1_MPORT_1_addr_pipe_0;
  reg [13:0] btb_1_2 [0:127]; // @[btb.scala 66:47]
  wire [13:0] btb_1_2_MPORT_1_data; // @[btb.scala 66:47]
  wire [6:0] btb_1_2_MPORT_1_addr; // @[btb.scala 66:47]
  wire [13:0] btb_1_2_MPORT_6_data; // @[btb.scala 66:47]
  wire [6:0] btb_1_2_MPORT_6_addr; // @[btb.scala 66:47]
  wire  btb_1_2_MPORT_6_mask; // @[btb.scala 66:47]
  wire  btb_1_2_MPORT_6_en; // @[btb.scala 66:47]
  reg  btb_1_2_MPORT_1_en_pipe_0;
  reg [6:0] btb_1_2_MPORT_1_addr_pipe_0;
  reg [13:0] btb_1_3 [0:127]; // @[btb.scala 66:47]
  wire [13:0] btb_1_3_MPORT_1_data; // @[btb.scala 66:47]
  wire [6:0] btb_1_3_MPORT_1_addr; // @[btb.scala 66:47]
  wire [13:0] btb_1_3_MPORT_6_data; // @[btb.scala 66:47]
  wire [6:0] btb_1_3_MPORT_6_addr; // @[btb.scala 66:47]
  wire  btb_1_3_MPORT_6_mask; // @[btb.scala 66:47]
  wire  btb_1_3_MPORT_6_en; // @[btb.scala 66:47]
  reg  btb_1_3_MPORT_1_en_pipe_0;
  reg [6:0] btb_1_3_MPORT_1_addr_pipe_0;
  reg [39:0] ebtb [0:127]; // @[btb.scala 67:29]
  wire [39:0] ebtb_s1_req_rebtb_data; // @[btb.scala 67:29]
  wire [6:0] ebtb_s1_req_rebtb_addr; // @[btb.scala 67:29]
  wire [39:0] ebtb_MPORT_8_data; // @[btb.scala 67:29]
  wire [6:0] ebtb_MPORT_8_addr; // @[btb.scala 67:29]
  wire  ebtb_MPORT_8_mask; // @[btb.scala 67:29]
  wire  ebtb_MPORT_8_en; // @[btb.scala 67:29]
  reg  ebtb_s1_req_rebtb_en_pipe_0;
  reg [6:0] ebtb_s1_req_rebtb_addr_pipe_0;
  wire [36:0] s0_idx = io_f0_pc[39:3]; // @[frontend.scala 163:35]
  reg [36:0] s1_idx; // @[predictor.scala 163:29]
  reg  s1_valid; // @[predictor.scala 168:25]
  reg [39:0] s1_pc; // @[predictor.scala 178:22]
  reg  s1_update__valid; // @[predictor.scala 184:30]
  reg  s1_update__bits_is_mispredict_update; // @[predictor.scala 184:30]
  reg  s1_update__bits_is_repair_update; // @[predictor.scala 184:30]
  reg [3:0] s1_update__bits_btb_mispredicts; // @[predictor.scala 184:30]
  reg [39:0] s1_update__bits_pc; // @[predictor.scala 184:30]
  reg [3:0] s1_update__bits_br_mask; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_idx_valid; // @[predictor.scala 184:30]
  reg [1:0] s1_update__bits_cfi_idx_bits; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_taken; // @[predictor.scala 184:30]
  reg [39:0] s1_update__bits_target; // @[predictor.scala 184:30]
  reg [119:0] s1_update__bits_meta; // @[predictor.scala 184:30]
  reg [36:0] s1_update_idx; // @[predictor.scala 185:30]
  reg  REG_write_way; // @[btb.scala 53:32]
  reg  f3_meta_write_way; // @[btb.scala 53:24]
  reg  doing_reset; // @[btb.scala 60:28]
  reg [6:0] reset_idx; // @[btb.scala 61:28]
  wire [6:0] _GEN_158 = {{6'd0}, doing_reset}; // @[btb.scala 62:26]
  wire [6:0] _T_1 = reset_idx + _GEN_158; // @[btb.scala 62:26]
  wire  _GEN_0 = reset_idx == 7'h7f ? 1'h0 : doing_reset; // @[btb.scala 63:36 btb.scala 63:50 btb.scala 60:28]
  wire [13:0] _WIRE_2 = btb_0_0_MPORT_data;
  wire  s1_req_rbtb_0_0_extended = _WIRE_2[0]; // @[btb.scala 73:93]
  wire [12:0] s1_req_rbtb_0_0_offset = _WIRE_2[13:1]; // @[btb.scala 73:93]
  wire [13:0] _WIRE_4 = btb_0_1_MPORT_data;
  wire  s1_req_rbtb_0_1_extended = _WIRE_4[0]; // @[btb.scala 73:93]
  wire [12:0] s1_req_rbtb_0_1_offset = _WIRE_4[13:1]; // @[btb.scala 73:93]
  wire [13:0] _WIRE_6 = btb_0_2_MPORT_data;
  wire  s1_req_rbtb_0_2_extended = _WIRE_6[0]; // @[btb.scala 73:93]
  wire [12:0] s1_req_rbtb_0_2_offset = _WIRE_6[13:1]; // @[btb.scala 73:93]
  wire [13:0] _WIRE_8 = btb_0_3_MPORT_data;
  wire  s1_req_rbtb_0_3_extended = _WIRE_8[0]; // @[btb.scala 73:93]
  wire [12:0] s1_req_rbtb_0_3_offset = _WIRE_8[13:1]; // @[btb.scala 73:93]
  wire [13:0] _WIRE_12 = btb_1_0_MPORT_1_data;
  wire  s1_req_rbtb_1_0_extended = _WIRE_12[0]; // @[btb.scala 73:93]
  wire [12:0] s1_req_rbtb_1_0_offset = _WIRE_12[13:1]; // @[btb.scala 73:93]
  wire [13:0] _WIRE_14 = btb_1_1_MPORT_1_data;
  wire  s1_req_rbtb_1_1_extended = _WIRE_14[0]; // @[btb.scala 73:93]
  wire [12:0] s1_req_rbtb_1_1_offset = _WIRE_14[13:1]; // @[btb.scala 73:93]
  wire [13:0] _WIRE_16 = btb_1_2_MPORT_1_data;
  wire  s1_req_rbtb_1_2_extended = _WIRE_16[0]; // @[btb.scala 73:93]
  wire [12:0] s1_req_rbtb_1_2_offset = _WIRE_16[13:1]; // @[btb.scala 73:93]
  wire [13:0] _WIRE_18 = btb_1_3_MPORT_1_data;
  wire  s1_req_rbtb_1_3_extended = _WIRE_18[0]; // @[btb.scala 73:93]
  wire [12:0] s1_req_rbtb_1_3_offset = _WIRE_18[13:1]; // @[btb.scala 73:93]
  wire [30:0] _WIRE_22 = meta_0_0_MPORT_2_data;
  wire [29:0] s1_req_rmeta_0_0_tag = _WIRE_22[29:0]; // @[btb.scala 74:93]
  wire  s1_req_rmeta_0_0_is_br = _WIRE_22[30]; // @[btb.scala 74:93]
  wire [30:0] _WIRE_24 = meta_0_1_MPORT_2_data;
  wire [29:0] s1_req_rmeta_0_1_tag = _WIRE_24[29:0]; // @[btb.scala 74:93]
  wire  s1_req_rmeta_0_1_is_br = _WIRE_24[30]; // @[btb.scala 74:93]
  wire [30:0] _WIRE_26 = meta_0_2_MPORT_2_data;
  wire [29:0] s1_req_rmeta_0_2_tag = _WIRE_26[29:0]; // @[btb.scala 74:93]
  wire  s1_req_rmeta_0_2_is_br = _WIRE_26[30]; // @[btb.scala 74:93]
  wire [30:0] _WIRE_28 = meta_0_3_MPORT_2_data;
  wire [29:0] s1_req_rmeta_0_3_tag = _WIRE_28[29:0]; // @[btb.scala 74:93]
  wire  s1_req_rmeta_0_3_is_br = _WIRE_28[30]; // @[btb.scala 74:93]
  wire [30:0] _WIRE_32 = meta_1_0_MPORT_3_data;
  wire [29:0] s1_req_rmeta_1_0_tag = _WIRE_32[29:0]; // @[btb.scala 74:93]
  wire  s1_req_rmeta_1_0_is_br = _WIRE_32[30]; // @[btb.scala 74:93]
  wire [30:0] _WIRE_34 = meta_1_1_MPORT_3_data;
  wire [29:0] s1_req_rmeta_1_1_tag = _WIRE_34[29:0]; // @[btb.scala 74:93]
  wire  s1_req_rmeta_1_1_is_br = _WIRE_34[30]; // @[btb.scala 74:93]
  wire [30:0] _WIRE_36 = meta_1_2_MPORT_3_data;
  wire [29:0] s1_req_rmeta_1_2_tag = _WIRE_36[29:0]; // @[btb.scala 74:93]
  wire  s1_req_rmeta_1_2_is_br = _WIRE_36[30]; // @[btb.scala 74:93]
  wire [30:0] _WIRE_38 = meta_1_3_MPORT_3_data;
  wire [29:0] s1_req_rmeta_1_3_tag = _WIRE_38[29:0]; // @[btb.scala 74:93]
  wire  s1_req_rmeta_1_3_is_br = _WIRE_38[30]; // @[btb.scala 74:93]
  wire [29:0] s1_req_tag = s1_idx[36:7]; // @[btb.scala 76:29]
  wire  s1_hit_ohs_0_0 = s1_req_rmeta_0_0_tag == s1_req_tag; // @[btb.scala 84:30]
  wire  s1_hit_ohs_0_1 = s1_req_rmeta_1_0_tag == s1_req_tag; // @[btb.scala 84:30]
  wire  s1_hit_ohs_1_0 = s1_req_rmeta_0_1_tag == s1_req_tag; // @[btb.scala 84:30]
  wire  s1_hit_ohs_1_1 = s1_req_rmeta_1_1_tag == s1_req_tag; // @[btb.scala 84:30]
  wire  s1_hit_ohs_2_0 = s1_req_rmeta_0_2_tag == s1_req_tag; // @[btb.scala 84:30]
  wire  s1_hit_ohs_2_1 = s1_req_rmeta_1_2_tag == s1_req_tag; // @[btb.scala 84:30]
  wire  s1_hit_ohs_3_0 = s1_req_rmeta_0_3_tag == s1_req_tag; // @[btb.scala 84:30]
  wire  s1_hit_ohs_3_1 = s1_req_rmeta_1_3_tag == s1_req_tag; // @[btb.scala 84:30]
  wire  s1_hits_0 = s1_hit_ohs_0_0 | s1_hit_ohs_0_1; // @[btb.scala 87:55]
  wire  s1_hits_1 = s1_hit_ohs_1_0 | s1_hit_ohs_1_1; // @[btb.scala 87:55]
  wire  s1_hits_2 = s1_hit_ohs_2_0 | s1_hit_ohs_2_1; // @[btb.scala 87:55]
  wire  s1_hits_3 = s1_hit_ohs_3_0 | s1_hit_ohs_3_1; // @[btb.scala 87:55]
  wire  s1_hit_ways_0 = s1_hit_ohs_0_0 ? 1'h0 : 1'h1; // @[Mux.scala 47:69]
  wire  s1_hit_ways_1 = s1_hit_ohs_1_0 ? 1'h0 : 1'h1; // @[Mux.scala 47:69]
  wire  s1_hit_ways_2 = s1_hit_ohs_2_0 ? 1'h0 : 1'h1; // @[Mux.scala 47:69]
  wire  s1_hit_ways_3 = s1_hit_ohs_3_0 ? 1'h0 : 1'h1; // @[Mux.scala 47:69]
  wire  _T_69 = ~doing_reset; // @[btb.scala 93:25]
  wire  s1_resp_0_valid = ~doing_reset & s1_valid & s1_hits_0; // @[btb.scala 93:50]
  wire [39:0] _T_72 = s1_pc; // @[btb.scala 97:14]
  wire [40:0] _T_73 = {{1{_T_72[39]}},_T_72}; // @[btb.scala 97:21]
  wire [39:0] _T_75 = _T_73[39:0]; // @[btb.scala 97:21]
  wire [12:0] _GEN_10 = s1_hit_ways_0 ? $signed(s1_req_rbtb_1_0_offset) : $signed(s1_req_rbtb_0_0_offset); // @[btb.scala 97:34 btb.scala 97:34]
  wire [39:0] _GEN_159 = {{27{_GEN_10[12]}},_GEN_10}; // @[btb.scala 97:34]
  wire [39:0] _T_79 = $signed(_T_75) + $signed(_GEN_159); // @[btb.scala 97:54]
  wire  _GEN_12 = s1_hit_ways_0 ? s1_req_rbtb_1_0_extended : s1_req_rbtb_0_0_extended; // @[btb.scala 94:28 btb.scala 94:28]
  wire  _T_82 = _T_69 & s1_resp_0_valid; // @[btb.scala 98:34]
  wire  _GEN_14 = s1_hit_ways_0 ? s1_req_rmeta_1_0_is_br : s1_req_rmeta_0_0_is_br; // @[btb.scala 98:54 btb.scala 98:54]
  reg  REG_1; // @[btb.scala 104:18]
  reg  REG_2_valid; // @[btb.scala 105:44]
  reg [39:0] REG_2_bits; // @[btb.scala 105:44]
  reg  REG_3; // @[btb.scala 106:44]
  reg  REG_4; // @[btb.scala 107:44]
  reg  REG_5; // @[btb.scala 108:20]
  wire  _GEN_15 = REG_5 | io_resp_in_0_f2_0_taken; // @[btb.scala 108:36 btb.scala 109:34 btb.scala 102:19]
  reg  REG_6; // @[btb.scala 112:26]
  reg  REG_7; // @[btb.scala 112:18]
  reg  REG_8_valid; // @[btb.scala 113:44]
  reg [39:0] REG_8_bits; // @[btb.scala 113:44]
  reg  REG_9; // @[btb.scala 114:44]
  reg  REG_10; // @[btb.scala 115:44]
  reg  REG_11; // @[btb.scala 116:28]
  reg  REG_12; // @[btb.scala 116:20]
  wire  _GEN_21 = REG_12 | io_resp_in_0_f3_0_taken; // @[btb.scala 116:45 btb.scala 117:34 btb.scala 103:19]
  wire  s1_resp_1_valid = ~doing_reset & s1_valid & s1_hits_1; // @[btb.scala 93:50]
  wire [39:0] _T_94 = $signed(s1_pc) + 40'sh2; // @[btb.scala 97:21]
  wire [12:0] _GEN_28 = s1_hit_ways_1 ? $signed(s1_req_rbtb_1_1_offset) : $signed(s1_req_rbtb_0_1_offset); // @[btb.scala 97:34 btb.scala 97:34]
  wire [39:0] _GEN_160 = {{27{_GEN_28[12]}},_GEN_28}; // @[btb.scala 97:34]
  wire [39:0] _T_98 = $signed(_T_94) + $signed(_GEN_160); // @[btb.scala 97:54]
  wire  _GEN_30 = s1_hit_ways_1 ? s1_req_rbtb_1_1_extended : s1_req_rbtb_0_1_extended; // @[btb.scala 94:28 btb.scala 94:28]
  wire  _T_101 = _T_69 & s1_resp_1_valid; // @[btb.scala 98:34]
  wire  _GEN_32 = s1_hit_ways_1 ? s1_req_rmeta_1_1_is_br : s1_req_rmeta_0_1_is_br; // @[btb.scala 98:54 btb.scala 98:54]
  reg  REG_13; // @[btb.scala 104:18]
  reg  REG_14_valid; // @[btb.scala 105:44]
  reg [39:0] REG_14_bits; // @[btb.scala 105:44]
  reg  REG_15; // @[btb.scala 106:44]
  reg  REG_16; // @[btb.scala 107:44]
  reg  REG_17; // @[btb.scala 108:20]
  wire  _GEN_33 = REG_17 | io_resp_in_0_f2_1_taken; // @[btb.scala 108:36 btb.scala 109:34 btb.scala 102:19]
  reg  REG_18; // @[btb.scala 112:26]
  reg  REG_19; // @[btb.scala 112:18]
  reg  REG_20_valid; // @[btb.scala 113:44]
  reg [39:0] REG_20_bits; // @[btb.scala 113:44]
  reg  REG_21; // @[btb.scala 114:44]
  reg  REG_22; // @[btb.scala 115:44]
  reg  REG_23; // @[btb.scala 116:28]
  reg  REG_24; // @[btb.scala 116:20]
  wire  _GEN_39 = REG_24 | io_resp_in_0_f3_1_taken; // @[btb.scala 116:45 btb.scala 117:34 btb.scala 103:19]
  wire  s1_resp_2_valid = ~doing_reset & s1_valid & s1_hits_2; // @[btb.scala 93:50]
  wire [39:0] _T_113 = $signed(s1_pc) + 40'sh4; // @[btb.scala 97:21]
  wire [12:0] _GEN_46 = s1_hit_ways_2 ? $signed(s1_req_rbtb_1_2_offset) : $signed(s1_req_rbtb_0_2_offset); // @[btb.scala 97:34 btb.scala 97:34]
  wire [39:0] _GEN_161 = {{27{_GEN_46[12]}},_GEN_46}; // @[btb.scala 97:34]
  wire [39:0] _T_117 = $signed(_T_113) + $signed(_GEN_161); // @[btb.scala 97:54]
  wire  _GEN_48 = s1_hit_ways_2 ? s1_req_rbtb_1_2_extended : s1_req_rbtb_0_2_extended; // @[btb.scala 94:28 btb.scala 94:28]
  wire  _T_120 = _T_69 & s1_resp_2_valid; // @[btb.scala 98:34]
  wire  _GEN_50 = s1_hit_ways_2 ? s1_req_rmeta_1_2_is_br : s1_req_rmeta_0_2_is_br; // @[btb.scala 98:54 btb.scala 98:54]
  reg  REG_25; // @[btb.scala 104:18]
  reg  REG_26_valid; // @[btb.scala 105:44]
  reg [39:0] REG_26_bits; // @[btb.scala 105:44]
  reg  REG_27; // @[btb.scala 106:44]
  reg  REG_28; // @[btb.scala 107:44]
  reg  REG_29; // @[btb.scala 108:20]
  wire  _GEN_51 = REG_29 | io_resp_in_0_f2_2_taken; // @[btb.scala 108:36 btb.scala 109:34 btb.scala 102:19]
  reg  REG_30; // @[btb.scala 112:26]
  reg  REG_31; // @[btb.scala 112:18]
  reg  REG_32_valid; // @[btb.scala 113:44]
  reg [39:0] REG_32_bits; // @[btb.scala 113:44]
  reg  REG_33; // @[btb.scala 114:44]
  reg  REG_34; // @[btb.scala 115:44]
  reg  REG_35; // @[btb.scala 116:28]
  reg  REG_36; // @[btb.scala 116:20]
  wire  _GEN_57 = REG_36 | io_resp_in_0_f3_2_taken; // @[btb.scala 116:45 btb.scala 117:34 btb.scala 103:19]
  wire  s1_resp_3_valid = ~doing_reset & s1_valid & s1_hits_3; // @[btb.scala 93:50]
  wire [39:0] _T_132 = $signed(s1_pc) + 40'sh6; // @[btb.scala 97:21]
  wire [12:0] _GEN_64 = s1_hit_ways_3 ? $signed(s1_req_rbtb_1_3_offset) : $signed(s1_req_rbtb_0_3_offset); // @[btb.scala 97:34 btb.scala 97:34]
  wire [39:0] _GEN_162 = {{27{_GEN_64[12]}},_GEN_64}; // @[btb.scala 97:34]
  wire [39:0] _T_136 = $signed(_T_132) + $signed(_GEN_162); // @[btb.scala 97:54]
  wire  _GEN_66 = s1_hit_ways_3 ? s1_req_rbtb_1_3_extended : s1_req_rbtb_0_3_extended; // @[btb.scala 94:28 btb.scala 94:28]
  wire  _T_139 = _T_69 & s1_resp_3_valid; // @[btb.scala 98:34]
  wire  _GEN_68 = s1_hit_ways_3 ? s1_req_rmeta_1_3_is_br : s1_req_rmeta_0_3_is_br; // @[btb.scala 98:54 btb.scala 98:54]
  reg  REG_37; // @[btb.scala 104:18]
  reg  REG_38_valid; // @[btb.scala 105:44]
  reg [39:0] REG_38_bits; // @[btb.scala 105:44]
  reg  REG_39; // @[btb.scala 106:44]
  reg  REG_40; // @[btb.scala 107:44]
  reg  REG_41; // @[btb.scala 108:20]
  wire  _GEN_69 = REG_41 | io_resp_in_0_f2_3_taken; // @[btb.scala 108:36 btb.scala 109:34 btb.scala 102:19]
  reg  REG_42; // @[btb.scala 112:26]
  reg  REG_43; // @[btb.scala 112:18]
  reg  REG_44_valid; // @[btb.scala 113:44]
  reg [39:0] REG_44_bits; // @[btb.scala 113:44]
  reg  REG_45; // @[btb.scala 114:44]
  reg  REG_46; // @[btb.scala 115:44]
  reg  REG_47; // @[btb.scala 116:28]
  reg  REG_48; // @[btb.scala 116:20]
  wire  _GEN_75 = REG_48 | io_resp_in_0_f3_3_taken; // @[btb.scala 116:45 btb.scala 117:34 btb.scala 103:19]
  wire [269:0] _T_145 = {s1_req_rmeta_1_3_tag,s1_req_rmeta_1_2_tag,s1_req_rmeta_1_1_tag,s1_req_rmeta_1_0_tag,
    s1_req_rmeta_0_3_tag,s1_req_rmeta_0_2_tag,s1_req_rmeta_0_1_tag,s1_req_rmeta_0_0_tag,s1_req_tag}; // @[Cat.scala 30:58]
  wire  _T_445 = _T_145[0] ^ _T_145[1] ^ _T_145[2] ^ _T_145[3] ^ _T_145[4] ^ _T_145[5] ^ _T_145[6] ^ _T_145[7] ^ _T_145[
    8] ^ _T_145[9] ^ _T_145[10] ^ _T_145[11] ^ _T_145[12] ^ _T_145[13] ^ _T_145[14] ^ _T_145[15] ^ _T_145[16] ^ _T_145[
    17] ^ _T_145[18] ^ _T_145[19] ^ _T_145[20] ^ _T_145[21] ^ _T_145[22] ^ _T_145[23] ^ _T_145[24] ^ _T_145[25] ^ _T_145
    [26] ^ _T_145[27] ^ _T_145[28] ^ _T_145[29] ^ _T_145[30]; // @[btb.scala 129:20]
  wire  _T_475 = _T_445 ^ _T_145[31] ^ _T_145[32] ^ _T_145[33] ^ _T_145[34] ^ _T_145[35] ^ _T_145[36] ^ _T_145[37] ^
    _T_145[38] ^ _T_145[39] ^ _T_145[40] ^ _T_145[41] ^ _T_145[42] ^ _T_145[43] ^ _T_145[44] ^ _T_145[45] ^ _T_145[46]
     ^ _T_145[47] ^ _T_145[48] ^ _T_145[49] ^ _T_145[50] ^ _T_145[51] ^ _T_145[52] ^ _T_145[53] ^ _T_145[54] ^ _T_145[55
    ] ^ _T_145[56] ^ _T_145[57] ^ _T_145[58] ^ _T_145[59] ^ _T_145[60]; // @[btb.scala 129:20]
  wire  _T_505 = _T_475 ^ _T_145[61] ^ _T_145[62] ^ _T_145[63] ^ _T_145[64] ^ _T_145[65] ^ _T_145[66] ^ _T_145[67] ^
    _T_145[68] ^ _T_145[69] ^ _T_145[70] ^ _T_145[71] ^ _T_145[72] ^ _T_145[73] ^ _T_145[74] ^ _T_145[75] ^ _T_145[76]
     ^ _T_145[77] ^ _T_145[78] ^ _T_145[79] ^ _T_145[80] ^ _T_145[81] ^ _T_145[82] ^ _T_145[83] ^ _T_145[84] ^ _T_145[85
    ] ^ _T_145[86] ^ _T_145[87] ^ _T_145[88] ^ _T_145[89] ^ _T_145[90]; // @[btb.scala 129:20]
  wire  _T_535 = _T_505 ^ _T_145[91] ^ _T_145[92] ^ _T_145[93] ^ _T_145[94] ^ _T_145[95] ^ _T_145[96] ^ _T_145[97] ^
    _T_145[98] ^ _T_145[99] ^ _T_145[100] ^ _T_145[101] ^ _T_145[102] ^ _T_145[103] ^ _T_145[104] ^ _T_145[105] ^ _T_145
    [106] ^ _T_145[107] ^ _T_145[108] ^ _T_145[109] ^ _T_145[110] ^ _T_145[111] ^ _T_145[112] ^ _T_145[113] ^ _T_145[114
    ] ^ _T_145[115] ^ _T_145[116] ^ _T_145[117] ^ _T_145[118] ^ _T_145[119] ^ _T_145[120]; // @[btb.scala 129:20]
  wire  _T_565 = _T_535 ^ _T_145[121] ^ _T_145[122] ^ _T_145[123] ^ _T_145[124] ^ _T_145[125] ^ _T_145[126] ^ _T_145[127
    ] ^ _T_145[128] ^ _T_145[129] ^ _T_145[130] ^ _T_145[131] ^ _T_145[132] ^ _T_145[133] ^ _T_145[134] ^ _T_145[135] ^
    _T_145[136] ^ _T_145[137] ^ _T_145[138] ^ _T_145[139] ^ _T_145[140] ^ _T_145[141] ^ _T_145[142] ^ _T_145[143] ^
    _T_145[144] ^ _T_145[145] ^ _T_145[146] ^ _T_145[147] ^ _T_145[148] ^ _T_145[149] ^ _T_145[150]; // @[btb.scala 129:20]
  wire  _T_595 = _T_565 ^ _T_145[151] ^ _T_145[152] ^ _T_145[153] ^ _T_145[154] ^ _T_145[155] ^ _T_145[156] ^ _T_145[157
    ] ^ _T_145[158] ^ _T_145[159] ^ _T_145[160] ^ _T_145[161] ^ _T_145[162] ^ _T_145[163] ^ _T_145[164] ^ _T_145[165] ^
    _T_145[166] ^ _T_145[167] ^ _T_145[168] ^ _T_145[169] ^ _T_145[170] ^ _T_145[171] ^ _T_145[172] ^ _T_145[173] ^
    _T_145[174] ^ _T_145[175] ^ _T_145[176] ^ _T_145[177] ^ _T_145[178] ^ _T_145[179] ^ _T_145[180]; // @[btb.scala 129:20]
  wire  _T_625 = _T_595 ^ _T_145[181] ^ _T_145[182] ^ _T_145[183] ^ _T_145[184] ^ _T_145[185] ^ _T_145[186] ^ _T_145[187
    ] ^ _T_145[188] ^ _T_145[189] ^ _T_145[190] ^ _T_145[191] ^ _T_145[192] ^ _T_145[193] ^ _T_145[194] ^ _T_145[195] ^
    _T_145[196] ^ _T_145[197] ^ _T_145[198] ^ _T_145[199] ^ _T_145[200] ^ _T_145[201] ^ _T_145[202] ^ _T_145[203] ^
    _T_145[204] ^ _T_145[205] ^ _T_145[206] ^ _T_145[207] ^ _T_145[208] ^ _T_145[209] ^ _T_145[210]; // @[btb.scala 129:20]
  wire  _T_655 = _T_625 ^ _T_145[211] ^ _T_145[212] ^ _T_145[213] ^ _T_145[214] ^ _T_145[215] ^ _T_145[216] ^ _T_145[217
    ] ^ _T_145[218] ^ _T_145[219] ^ _T_145[220] ^ _T_145[221] ^ _T_145[222] ^ _T_145[223] ^ _T_145[224] ^ _T_145[225] ^
    _T_145[226] ^ _T_145[227] ^ _T_145[228] ^ _T_145[229] ^ _T_145[230] ^ _T_145[231] ^ _T_145[232] ^ _T_145[233] ^
    _T_145[234] ^ _T_145[235] ^ _T_145[236] ^ _T_145[237] ^ _T_145[238] ^ _T_145[239] ^ _T_145[240]; // @[btb.scala 129:20]
  wire  alloc_way = _T_655 ^ _T_145[241] ^ _T_145[242] ^ _T_145[243] ^ _T_145[244] ^ _T_145[245] ^ _T_145[246] ^ _T_145[
    247] ^ _T_145[248] ^ _T_145[249] ^ _T_145[250] ^ _T_145[251] ^ _T_145[252] ^ _T_145[253] ^ _T_145[254] ^ _T_145[255]
     ^ _T_145[256] ^ _T_145[257] ^ _T_145[258] ^ _T_145[259] ^ _T_145[260] ^ _T_145[261] ^ _T_145[262] ^ _T_145[263] ^
    _T_145[264] ^ _T_145[265] ^ _T_145[266] ^ _T_145[267] ^ _T_145[268] ^ _T_145[269]; // @[btb.scala 129:20]
  wire [1:0] _T_687 = {s1_hit_ohs_0_1,s1_hit_ohs_0_0}; // @[btb.scala 134:38]
  wire [1:0] _T_688 = {s1_hit_ohs_1_1,s1_hit_ohs_1_0}; // @[btb.scala 134:38]
  wire [1:0] _T_689 = {s1_hit_ohs_2_1,s1_hit_ohs_2_0}; // @[btb.scala 134:38]
  wire [1:0] _T_690 = {s1_hit_ohs_3_1,s1_hit_ohs_3_0}; // @[btb.scala 134:38]
  wire [1:0] _T_691 = _T_687 | _T_688; // @[btb.scala 134:54]
  wire [1:0] _T_692 = _T_691 | _T_689; // @[btb.scala 134:54]
  wire [1:0] _T_693 = _T_692 | _T_690; // @[btb.scala 134:54]
  wire  s1_update_meta_write_way = s1_update__bits_meta[0];
  wire [2:0] _T_702 = {s1_update__bits_cfi_idx_bits, 1'h0}; // @[btb.scala 143:55]
  wire [39:0] _GEN_163 = {{37'd0}, _T_702}; // @[btb.scala 143:24]
  wire [39:0] _T_705 = s1_update__bits_pc + _GEN_163; // @[btb.scala 143:62]
  wire [39:0] new_offset_value = $signed(s1_update__bits_target) - $signed(_T_705); // @[btb.scala 142:56]
  wire  _T_709 = $signed(new_offset_value) < -40'sh1000; // @[btb.scala 145:46]
  wire  offset_is_extended = $signed(new_offset_value) > 40'shfff | _T_709; // @[btb.scala 144:65]
  wire [3:0] _T_710 = 4'h1 << s1_update__bits_cfi_idx_bits; // @[OneHot.scala 58:35]
  wire  _T_714 = s1_update__bits_btb_mispredicts != 4'h0; // @[predictor.scala 94:50]
  wire  _T_716 = ~(s1_update__bits_is_mispredict_update | s1_update__bits_is_repair_update | _T_714); // @[predictor.scala 96:26]
  wire  _T_717 = s1_update__bits_cfi_idx_valid & s1_update__valid & s1_update__bits_cfi_taken & _T_716; // @[btb.scala 152:97]
  wire [3:0] _T_719 = _T_717 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] s1_update_wbtb_mask = _T_710 & _T_719; // @[btb.scala 151:58]
  wire [3:0] _T_720 = s1_update_wbtb_mask | s1_update__bits_br_mask; // @[btb.scala 154:52]
  wire  _T_725 = s1_update__valid & _T_716; // @[btb.scala 155:38]
  wire [3:0] _T_727 = _T_725 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_729 = s1_update__valid ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_730 = _T_729 & s1_update__bits_btb_mispredicts; // @[btb.scala 156:40]
  wire [3:0] _T_731 = _T_727 | _T_730; // @[btb.scala 155:74]
  wire [3:0] s1_update_wmeta_mask = _T_720 & _T_731; // @[btb.scala 154:78]
  wire [29:0] s1_update_wmeta_data_0_tag = s1_update__bits_btb_mispredicts[0] ? 30'h0 : s1_update_idx[36:7]; // @[btb.scala 162:43]
  wire  s1_update_wmeta_data_0_is_br = s1_update__bits_br_mask[0]; // @[btb.scala 163:62]
  wire [29:0] s1_update_wmeta_data_1_tag = s1_update__bits_btb_mispredicts[1] ? 30'h0 : s1_update_idx[36:7]; // @[btb.scala 162:43]
  wire  s1_update_wmeta_data_1_is_br = s1_update__bits_br_mask[1]; // @[btb.scala 163:62]
  wire [29:0] s1_update_wmeta_data_2_tag = s1_update__bits_btb_mispredicts[2] ? 30'h0 : s1_update_idx[36:7]; // @[btb.scala 162:43]
  wire  s1_update_wmeta_data_2_is_br = s1_update__bits_br_mask[2]; // @[btb.scala 163:62]
  wire [29:0] s1_update_wmeta_data_3_tag = s1_update__bits_btb_mispredicts[3] ? 30'h0 : s1_update_idx[36:7]; // @[btb.scala 162:43]
  wire  s1_update_wmeta_data_3_is_br = s1_update__bits_br_mask[3]; // @[btb.scala 163:62]
  wire  _T_748 = ~s1_update_meta_write_way; // @[btb.scala 167:51]
  wire [36:0] _T_751 = doing_reset ? {{30'd0}, reset_idx} : s1_update_idx; // @[btb.scala 169:12]
  wire [12:0] hi_2 = new_offset_value[12:0]; // @[btb.scala 174:61]
  wire [13:0] _T_752 = {hi_2,offset_is_extended}; // @[btb.scala 174:61]
  wire [3:0] _T_758 = doing_reset ? 4'hf : s1_update_wbtb_mask; // @[btb.scala 175:12]
  wire [30:0] _T_766 = {s1_update_wmeta_data_0_is_br,s1_update_wmeta_data_0_tag}; // @[btb.scala 185:46]
  wire [30:0] _T_767 = {s1_update_wmeta_data_1_is_br,s1_update_wmeta_data_1_tag}; // @[btb.scala 185:46]
  wire [30:0] _T_768 = {s1_update_wmeta_data_2_is_br,s1_update_wmeta_data_2_tag}; // @[btb.scala 185:46]
  wire [30:0] _T_769 = {s1_update_wmeta_data_3_is_br,s1_update_wmeta_data_3_tag}; // @[btb.scala 185:46]
  wire [3:0] _T_772 = doing_reset ? 4'hf : s1_update_wmeta_mask; // @[btb.scala 186:12]
  wire  _T_810 = s1_update_wbtb_mask != 4'h0; // @[btb.scala 194:29]
  assign meta_0_0_MPORT_2_addr = meta_0_0_MPORT_2_addr_pipe_0;
  assign meta_0_0_MPORT_2_data = meta_0_0[meta_0_0_MPORT_2_addr]; // @[btb.scala 65:47]
  assign meta_0_0_MPORT_5_data = doing_reset ? 31'h0 : _T_766;
  assign meta_0_0_MPORT_5_addr = _T_751[6:0];
  assign meta_0_0_MPORT_5_mask = _T_772[0];
  assign meta_0_0_MPORT_5_en = doing_reset | _T_748;
  assign meta_0_1_MPORT_2_addr = meta_0_1_MPORT_2_addr_pipe_0;
  assign meta_0_1_MPORT_2_data = meta_0_1[meta_0_1_MPORT_2_addr]; // @[btb.scala 65:47]
  assign meta_0_1_MPORT_5_data = doing_reset ? 31'h0 : _T_767;
  assign meta_0_1_MPORT_5_addr = _T_751[6:0];
  assign meta_0_1_MPORT_5_mask = _T_772[1];
  assign meta_0_1_MPORT_5_en = doing_reset | _T_748;
  assign meta_0_2_MPORT_2_addr = meta_0_2_MPORT_2_addr_pipe_0;
  assign meta_0_2_MPORT_2_data = meta_0_2[meta_0_2_MPORT_2_addr]; // @[btb.scala 65:47]
  assign meta_0_2_MPORT_5_data = doing_reset ? 31'h0 : _T_768;
  assign meta_0_2_MPORT_5_addr = _T_751[6:0];
  assign meta_0_2_MPORT_5_mask = _T_772[2];
  assign meta_0_2_MPORT_5_en = doing_reset | _T_748;
  assign meta_0_3_MPORT_2_addr = meta_0_3_MPORT_2_addr_pipe_0;
  assign meta_0_3_MPORT_2_data = meta_0_3[meta_0_3_MPORT_2_addr]; // @[btb.scala 65:47]
  assign meta_0_3_MPORT_5_data = doing_reset ? 31'h0 : _T_769;
  assign meta_0_3_MPORT_5_addr = _T_751[6:0];
  assign meta_0_3_MPORT_5_mask = _T_772[3];
  assign meta_0_3_MPORT_5_en = doing_reset | _T_748;
  assign meta_1_0_MPORT_3_addr = meta_1_0_MPORT_3_addr_pipe_0;
  assign meta_1_0_MPORT_3_data = meta_1_0[meta_1_0_MPORT_3_addr]; // @[btb.scala 65:47]
  assign meta_1_0_MPORT_7_data = doing_reset ? 31'h0 : _T_766;
  assign meta_1_0_MPORT_7_addr = _T_751[6:0];
  assign meta_1_0_MPORT_7_mask = _T_772[0];
  assign meta_1_0_MPORT_7_en = doing_reset | s1_update_meta_write_way;
  assign meta_1_1_MPORT_3_addr = meta_1_1_MPORT_3_addr_pipe_0;
  assign meta_1_1_MPORT_3_data = meta_1_1[meta_1_1_MPORT_3_addr]; // @[btb.scala 65:47]
  assign meta_1_1_MPORT_7_data = doing_reset ? 31'h0 : _T_767;
  assign meta_1_1_MPORT_7_addr = _T_751[6:0];
  assign meta_1_1_MPORT_7_mask = _T_772[1];
  assign meta_1_1_MPORT_7_en = doing_reset | s1_update_meta_write_way;
  assign meta_1_2_MPORT_3_addr = meta_1_2_MPORT_3_addr_pipe_0;
  assign meta_1_2_MPORT_3_data = meta_1_2[meta_1_2_MPORT_3_addr]; // @[btb.scala 65:47]
  assign meta_1_2_MPORT_7_data = doing_reset ? 31'h0 : _T_768;
  assign meta_1_2_MPORT_7_addr = _T_751[6:0];
  assign meta_1_2_MPORT_7_mask = _T_772[2];
  assign meta_1_2_MPORT_7_en = doing_reset | s1_update_meta_write_way;
  assign meta_1_3_MPORT_3_addr = meta_1_3_MPORT_3_addr_pipe_0;
  assign meta_1_3_MPORT_3_data = meta_1_3[meta_1_3_MPORT_3_addr]; // @[btb.scala 65:47]
  assign meta_1_3_MPORT_7_data = doing_reset ? 31'h0 : _T_769;
  assign meta_1_3_MPORT_7_addr = _T_751[6:0];
  assign meta_1_3_MPORT_7_mask = _T_772[3];
  assign meta_1_3_MPORT_7_en = doing_reset | s1_update_meta_write_way;
  assign btb_0_0_MPORT_addr = btb_0_0_MPORT_addr_pipe_0;
  assign btb_0_0_MPORT_data = btb_0_0[btb_0_0_MPORT_addr]; // @[btb.scala 66:47]
  assign btb_0_0_MPORT_4_data = doing_reset ? 14'h0 : _T_752;
  assign btb_0_0_MPORT_4_addr = _T_751[6:0];
  assign btb_0_0_MPORT_4_mask = _T_758[0];
  assign btb_0_0_MPORT_4_en = doing_reset | _T_748;
  assign btb_0_1_MPORT_addr = btb_0_1_MPORT_addr_pipe_0;
  assign btb_0_1_MPORT_data = btb_0_1[btb_0_1_MPORT_addr]; // @[btb.scala 66:47]
  assign btb_0_1_MPORT_4_data = doing_reset ? 14'h0 : _T_752;
  assign btb_0_1_MPORT_4_addr = _T_751[6:0];
  assign btb_0_1_MPORT_4_mask = _T_758[1];
  assign btb_0_1_MPORT_4_en = doing_reset | _T_748;
  assign btb_0_2_MPORT_addr = btb_0_2_MPORT_addr_pipe_0;
  assign btb_0_2_MPORT_data = btb_0_2[btb_0_2_MPORT_addr]; // @[btb.scala 66:47]
  assign btb_0_2_MPORT_4_data = doing_reset ? 14'h0 : _T_752;
  assign btb_0_2_MPORT_4_addr = _T_751[6:0];
  assign btb_0_2_MPORT_4_mask = _T_758[2];
  assign btb_0_2_MPORT_4_en = doing_reset | _T_748;
  assign btb_0_3_MPORT_addr = btb_0_3_MPORT_addr_pipe_0;
  assign btb_0_3_MPORT_data = btb_0_3[btb_0_3_MPORT_addr]; // @[btb.scala 66:47]
  assign btb_0_3_MPORT_4_data = doing_reset ? 14'h0 : _T_752;
  assign btb_0_3_MPORT_4_addr = _T_751[6:0];
  assign btb_0_3_MPORT_4_mask = _T_758[3];
  assign btb_0_3_MPORT_4_en = doing_reset | _T_748;
  assign btb_1_0_MPORT_1_addr = btb_1_0_MPORT_1_addr_pipe_0;
  assign btb_1_0_MPORT_1_data = btb_1_0[btb_1_0_MPORT_1_addr]; // @[btb.scala 66:47]
  assign btb_1_0_MPORT_6_data = doing_reset ? 14'h0 : _T_752;
  assign btb_1_0_MPORT_6_addr = _T_751[6:0];
  assign btb_1_0_MPORT_6_mask = _T_758[0];
  assign btb_1_0_MPORT_6_en = doing_reset | s1_update_meta_write_way;
  assign btb_1_1_MPORT_1_addr = btb_1_1_MPORT_1_addr_pipe_0;
  assign btb_1_1_MPORT_1_data = btb_1_1[btb_1_1_MPORT_1_addr]; // @[btb.scala 66:47]
  assign btb_1_1_MPORT_6_data = doing_reset ? 14'h0 : _T_752;
  assign btb_1_1_MPORT_6_addr = _T_751[6:0];
  assign btb_1_1_MPORT_6_mask = _T_758[1];
  assign btb_1_1_MPORT_6_en = doing_reset | s1_update_meta_write_way;
  assign btb_1_2_MPORT_1_addr = btb_1_2_MPORT_1_addr_pipe_0;
  assign btb_1_2_MPORT_1_data = btb_1_2[btb_1_2_MPORT_1_addr]; // @[btb.scala 66:47]
  assign btb_1_2_MPORT_6_data = doing_reset ? 14'h0 : _T_752;
  assign btb_1_2_MPORT_6_addr = _T_751[6:0];
  assign btb_1_2_MPORT_6_mask = _T_758[2];
  assign btb_1_2_MPORT_6_en = doing_reset | s1_update_meta_write_way;
  assign btb_1_3_MPORT_1_addr = btb_1_3_MPORT_1_addr_pipe_0;
  assign btb_1_3_MPORT_1_data = btb_1_3[btb_1_3_MPORT_1_addr]; // @[btb.scala 66:47]
  assign btb_1_3_MPORT_6_data = doing_reset ? 14'h0 : _T_752;
  assign btb_1_3_MPORT_6_addr = _T_751[6:0];
  assign btb_1_3_MPORT_6_mask = _T_758[3];
  assign btb_1_3_MPORT_6_en = doing_reset | s1_update_meta_write_way;
  assign ebtb_s1_req_rebtb_addr = ebtb_s1_req_rebtb_addr_pipe_0;
  assign ebtb_s1_req_rebtb_data = ebtb[ebtb_s1_req_rebtb_addr]; // @[btb.scala 67:29]
  assign ebtb_MPORT_8_data = s1_update__bits_target;
  assign ebtb_MPORT_8_addr = s1_update_idx[6:0];
  assign ebtb_MPORT_8_mask = 1'h1;
  assign ebtb_MPORT_8_en = _T_810 & offset_is_extended;
  assign io_resp_f1_0_taken = io_resp_in_0_f1_0_taken; // @[predictor.scala 158:11]
  assign io_resp_f1_0_is_br = io_resp_in_0_f1_0_is_br; // @[predictor.scala 158:11]
  assign io_resp_f1_0_is_jal = io_resp_in_0_f1_0_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f1_0_predicted_pc_valid = io_resp_in_0_f1_0_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f1_0_predicted_pc_bits = io_resp_in_0_f1_0_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f1_1_taken = io_resp_in_0_f1_1_taken; // @[predictor.scala 158:11]
  assign io_resp_f1_1_is_br = io_resp_in_0_f1_1_is_br; // @[predictor.scala 158:11]
  assign io_resp_f1_1_is_jal = io_resp_in_0_f1_1_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f1_1_predicted_pc_valid = io_resp_in_0_f1_1_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f1_1_predicted_pc_bits = io_resp_in_0_f1_1_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f1_2_taken = io_resp_in_0_f1_2_taken; // @[predictor.scala 158:11]
  assign io_resp_f1_2_is_br = io_resp_in_0_f1_2_is_br; // @[predictor.scala 158:11]
  assign io_resp_f1_2_is_jal = io_resp_in_0_f1_2_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f1_2_predicted_pc_valid = io_resp_in_0_f1_2_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f1_2_predicted_pc_bits = io_resp_in_0_f1_2_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f1_3_taken = io_resp_in_0_f1_3_taken; // @[predictor.scala 158:11]
  assign io_resp_f1_3_is_br = io_resp_in_0_f1_3_is_br; // @[predictor.scala 158:11]
  assign io_resp_f1_3_is_jal = io_resp_in_0_f1_3_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f1_3_predicted_pc_valid = io_resp_in_0_f1_3_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f1_3_predicted_pc_bits = io_resp_in_0_f1_3_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f2_0_taken = REG_1 ? _GEN_15 : io_resp_in_0_f2_0_taken; // @[btb.scala 104:32 btb.scala 102:19]
  assign io_resp_f2_0_is_br = REG_1 ? REG_3 : io_resp_in_0_f2_0_is_br; // @[btb.scala 104:32 btb.scala 106:34 btb.scala 102:19]
  assign io_resp_f2_0_is_jal = REG_1 ? REG_4 : io_resp_in_0_f2_0_is_jal; // @[btb.scala 104:32 btb.scala 107:34 btb.scala 102:19]
  assign io_resp_f2_0_predicted_pc_valid = REG_1 ? REG_2_valid : io_resp_in_0_f2_0_predicted_pc_valid; // @[btb.scala 104:32 btb.scala 105:34 btb.scala 102:19]
  assign io_resp_f2_0_predicted_pc_bits = REG_1 ? REG_2_bits : io_resp_in_0_f2_0_predicted_pc_bits; // @[btb.scala 104:32 btb.scala 105:34 btb.scala 102:19]
  assign io_resp_f2_1_taken = REG_13 ? _GEN_33 : io_resp_in_0_f2_1_taken; // @[btb.scala 104:32 btb.scala 102:19]
  assign io_resp_f2_1_is_br = REG_13 ? REG_15 : io_resp_in_0_f2_1_is_br; // @[btb.scala 104:32 btb.scala 106:34 btb.scala 102:19]
  assign io_resp_f2_1_is_jal = REG_13 ? REG_16 : io_resp_in_0_f2_1_is_jal; // @[btb.scala 104:32 btb.scala 107:34 btb.scala 102:19]
  assign io_resp_f2_1_predicted_pc_valid = REG_13 ? REG_14_valid : io_resp_in_0_f2_1_predicted_pc_valid; // @[btb.scala 104:32 btb.scala 105:34 btb.scala 102:19]
  assign io_resp_f2_1_predicted_pc_bits = REG_13 ? REG_14_bits : io_resp_in_0_f2_1_predicted_pc_bits; // @[btb.scala 104:32 btb.scala 105:34 btb.scala 102:19]
  assign io_resp_f2_2_taken = REG_25 ? _GEN_51 : io_resp_in_0_f2_2_taken; // @[btb.scala 104:32 btb.scala 102:19]
  assign io_resp_f2_2_is_br = REG_25 ? REG_27 : io_resp_in_0_f2_2_is_br; // @[btb.scala 104:32 btb.scala 106:34 btb.scala 102:19]
  assign io_resp_f2_2_is_jal = REG_25 ? REG_28 : io_resp_in_0_f2_2_is_jal; // @[btb.scala 104:32 btb.scala 107:34 btb.scala 102:19]
  assign io_resp_f2_2_predicted_pc_valid = REG_25 ? REG_26_valid : io_resp_in_0_f2_2_predicted_pc_valid; // @[btb.scala 104:32 btb.scala 105:34 btb.scala 102:19]
  assign io_resp_f2_2_predicted_pc_bits = REG_25 ? REG_26_bits : io_resp_in_0_f2_2_predicted_pc_bits; // @[btb.scala 104:32 btb.scala 105:34 btb.scala 102:19]
  assign io_resp_f2_3_taken = REG_37 ? _GEN_69 : io_resp_in_0_f2_3_taken; // @[btb.scala 104:32 btb.scala 102:19]
  assign io_resp_f2_3_is_br = REG_37 ? REG_39 : io_resp_in_0_f2_3_is_br; // @[btb.scala 104:32 btb.scala 106:34 btb.scala 102:19]
  assign io_resp_f2_3_is_jal = REG_37 ? REG_40 : io_resp_in_0_f2_3_is_jal; // @[btb.scala 104:32 btb.scala 107:34 btb.scala 102:19]
  assign io_resp_f2_3_predicted_pc_valid = REG_37 ? REG_38_valid : io_resp_in_0_f2_3_predicted_pc_valid; // @[btb.scala 104:32 btb.scala 105:34 btb.scala 102:19]
  assign io_resp_f2_3_predicted_pc_bits = REG_37 ? REG_38_bits : io_resp_in_0_f2_3_predicted_pc_bits; // @[btb.scala 104:32 btb.scala 105:34 btb.scala 102:19]
  assign io_resp_f3_0_taken = REG_7 ? _GEN_21 : io_resp_in_0_f3_0_taken; // @[btb.scala 112:41 btb.scala 103:19]
  assign io_resp_f3_0_is_br = REG_7 ? REG_9 : io_resp_in_0_f3_0_is_br; // @[btb.scala 112:41 btb.scala 114:34 btb.scala 103:19]
  assign io_resp_f3_0_is_jal = REG_7 ? REG_10 : io_resp_in_0_f3_0_is_jal; // @[btb.scala 112:41 btb.scala 115:34 btb.scala 103:19]
  assign io_resp_f3_0_predicted_pc_valid = REG_7 ? REG_8_valid : io_resp_in_0_f3_0_predicted_pc_valid; // @[btb.scala 112:41 btb.scala 113:34 btb.scala 103:19]
  assign io_resp_f3_0_predicted_pc_bits = REG_7 ? REG_8_bits : io_resp_in_0_f3_0_predicted_pc_bits; // @[btb.scala 112:41 btb.scala 113:34 btb.scala 103:19]
  assign io_resp_f3_1_taken = REG_19 ? _GEN_39 : io_resp_in_0_f3_1_taken; // @[btb.scala 112:41 btb.scala 103:19]
  assign io_resp_f3_1_is_br = REG_19 ? REG_21 : io_resp_in_0_f3_1_is_br; // @[btb.scala 112:41 btb.scala 114:34 btb.scala 103:19]
  assign io_resp_f3_1_is_jal = REG_19 ? REG_22 : io_resp_in_0_f3_1_is_jal; // @[btb.scala 112:41 btb.scala 115:34 btb.scala 103:19]
  assign io_resp_f3_1_predicted_pc_valid = REG_19 ? REG_20_valid : io_resp_in_0_f3_1_predicted_pc_valid; // @[btb.scala 112:41 btb.scala 113:34 btb.scala 103:19]
  assign io_resp_f3_1_predicted_pc_bits = REG_19 ? REG_20_bits : io_resp_in_0_f3_1_predicted_pc_bits; // @[btb.scala 112:41 btb.scala 113:34 btb.scala 103:19]
  assign io_resp_f3_2_taken = REG_31 ? _GEN_57 : io_resp_in_0_f3_2_taken; // @[btb.scala 112:41 btb.scala 103:19]
  assign io_resp_f3_2_is_br = REG_31 ? REG_33 : io_resp_in_0_f3_2_is_br; // @[btb.scala 112:41 btb.scala 114:34 btb.scala 103:19]
  assign io_resp_f3_2_is_jal = REG_31 ? REG_34 : io_resp_in_0_f3_2_is_jal; // @[btb.scala 112:41 btb.scala 115:34 btb.scala 103:19]
  assign io_resp_f3_2_predicted_pc_valid = REG_31 ? REG_32_valid : io_resp_in_0_f3_2_predicted_pc_valid; // @[btb.scala 112:41 btb.scala 113:34 btb.scala 103:19]
  assign io_resp_f3_2_predicted_pc_bits = REG_31 ? REG_32_bits : io_resp_in_0_f3_2_predicted_pc_bits; // @[btb.scala 112:41 btb.scala 113:34 btb.scala 103:19]
  assign io_resp_f3_3_taken = REG_43 ? _GEN_75 : io_resp_in_0_f3_3_taken; // @[btb.scala 112:41 btb.scala 103:19]
  assign io_resp_f3_3_is_br = REG_43 ? REG_45 : io_resp_in_0_f3_3_is_br; // @[btb.scala 112:41 btb.scala 114:34 btb.scala 103:19]
  assign io_resp_f3_3_is_jal = REG_43 ? REG_46 : io_resp_in_0_f3_3_is_jal; // @[btb.scala 112:41 btb.scala 115:34 btb.scala 103:19]
  assign io_resp_f3_3_predicted_pc_valid = REG_43 ? REG_44_valid : io_resp_in_0_f3_3_predicted_pc_valid; // @[btb.scala 112:41 btb.scala 113:34 btb.scala 103:19]
  assign io_resp_f3_3_predicted_pc_bits = REG_43 ? REG_44_bits : io_resp_in_0_f3_3_predicted_pc_bits; // @[btb.scala 112:41 btb.scala 113:34 btb.scala 103:19]
  assign io_f3_meta = {{119'd0}, f3_meta_write_way}; // @[btb.scala 56:14]
  always @(posedge clock) begin
    if(meta_0_0_MPORT_5_en & meta_0_0_MPORT_5_mask) begin
      meta_0_0[meta_0_0_MPORT_5_addr] <= meta_0_0_MPORT_5_data; // @[btb.scala 65:47]
    end
    meta_0_0_MPORT_2_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      meta_0_0_MPORT_2_addr_pipe_0 <= s0_idx[6:0];
    end
    if(meta_0_1_MPORT_5_en & meta_0_1_MPORT_5_mask) begin
      meta_0_1[meta_0_1_MPORT_5_addr] <= meta_0_1_MPORT_5_data; // @[btb.scala 65:47]
    end
    meta_0_1_MPORT_2_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      meta_0_1_MPORT_2_addr_pipe_0 <= s0_idx[6:0];
    end
    if(meta_0_2_MPORT_5_en & meta_0_2_MPORT_5_mask) begin
      meta_0_2[meta_0_2_MPORT_5_addr] <= meta_0_2_MPORT_5_data; // @[btb.scala 65:47]
    end
    meta_0_2_MPORT_2_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      meta_0_2_MPORT_2_addr_pipe_0 <= s0_idx[6:0];
    end
    if(meta_0_3_MPORT_5_en & meta_0_3_MPORT_5_mask) begin
      meta_0_3[meta_0_3_MPORT_5_addr] <= meta_0_3_MPORT_5_data; // @[btb.scala 65:47]
    end
    meta_0_3_MPORT_2_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      meta_0_3_MPORT_2_addr_pipe_0 <= s0_idx[6:0];
    end
    if(meta_1_0_MPORT_7_en & meta_1_0_MPORT_7_mask) begin
      meta_1_0[meta_1_0_MPORT_7_addr] <= meta_1_0_MPORT_7_data; // @[btb.scala 65:47]
    end
    meta_1_0_MPORT_3_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      meta_1_0_MPORT_3_addr_pipe_0 <= s0_idx[6:0];
    end
    if(meta_1_1_MPORT_7_en & meta_1_1_MPORT_7_mask) begin
      meta_1_1[meta_1_1_MPORT_7_addr] <= meta_1_1_MPORT_7_data; // @[btb.scala 65:47]
    end
    meta_1_1_MPORT_3_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      meta_1_1_MPORT_3_addr_pipe_0 <= s0_idx[6:0];
    end
    if(meta_1_2_MPORT_7_en & meta_1_2_MPORT_7_mask) begin
      meta_1_2[meta_1_2_MPORT_7_addr] <= meta_1_2_MPORT_7_data; // @[btb.scala 65:47]
    end
    meta_1_2_MPORT_3_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      meta_1_2_MPORT_3_addr_pipe_0 <= s0_idx[6:0];
    end
    if(meta_1_3_MPORT_7_en & meta_1_3_MPORT_7_mask) begin
      meta_1_3[meta_1_3_MPORT_7_addr] <= meta_1_3_MPORT_7_data; // @[btb.scala 65:47]
    end
    meta_1_3_MPORT_3_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      meta_1_3_MPORT_3_addr_pipe_0 <= s0_idx[6:0];
    end
    if(btb_0_0_MPORT_4_en & btb_0_0_MPORT_4_mask) begin
      btb_0_0[btb_0_0_MPORT_4_addr] <= btb_0_0_MPORT_4_data; // @[btb.scala 66:47]
    end
    btb_0_0_MPORT_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      btb_0_0_MPORT_addr_pipe_0 <= s0_idx[6:0];
    end
    if(btb_0_1_MPORT_4_en & btb_0_1_MPORT_4_mask) begin
      btb_0_1[btb_0_1_MPORT_4_addr] <= btb_0_1_MPORT_4_data; // @[btb.scala 66:47]
    end
    btb_0_1_MPORT_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      btb_0_1_MPORT_addr_pipe_0 <= s0_idx[6:0];
    end
    if(btb_0_2_MPORT_4_en & btb_0_2_MPORT_4_mask) begin
      btb_0_2[btb_0_2_MPORT_4_addr] <= btb_0_2_MPORT_4_data; // @[btb.scala 66:47]
    end
    btb_0_2_MPORT_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      btb_0_2_MPORT_addr_pipe_0 <= s0_idx[6:0];
    end
    if(btb_0_3_MPORT_4_en & btb_0_3_MPORT_4_mask) begin
      btb_0_3[btb_0_3_MPORT_4_addr] <= btb_0_3_MPORT_4_data; // @[btb.scala 66:47]
    end
    btb_0_3_MPORT_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      btb_0_3_MPORT_addr_pipe_0 <= s0_idx[6:0];
    end
    if(btb_1_0_MPORT_6_en & btb_1_0_MPORT_6_mask) begin
      btb_1_0[btb_1_0_MPORT_6_addr] <= btb_1_0_MPORT_6_data; // @[btb.scala 66:47]
    end
    btb_1_0_MPORT_1_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      btb_1_0_MPORT_1_addr_pipe_0 <= s0_idx[6:0];
    end
    if(btb_1_1_MPORT_6_en & btb_1_1_MPORT_6_mask) begin
      btb_1_1[btb_1_1_MPORT_6_addr] <= btb_1_1_MPORT_6_data; // @[btb.scala 66:47]
    end
    btb_1_1_MPORT_1_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      btb_1_1_MPORT_1_addr_pipe_0 <= s0_idx[6:0];
    end
    if(btb_1_2_MPORT_6_en & btb_1_2_MPORT_6_mask) begin
      btb_1_2[btb_1_2_MPORT_6_addr] <= btb_1_2_MPORT_6_data; // @[btb.scala 66:47]
    end
    btb_1_2_MPORT_1_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      btb_1_2_MPORT_1_addr_pipe_0 <= s0_idx[6:0];
    end
    if(btb_1_3_MPORT_6_en & btb_1_3_MPORT_6_mask) begin
      btb_1_3[btb_1_3_MPORT_6_addr] <= btb_1_3_MPORT_6_data; // @[btb.scala 66:47]
    end
    btb_1_3_MPORT_1_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      btb_1_3_MPORT_1_addr_pipe_0 <= s0_idx[6:0];
    end
    if(ebtb_MPORT_8_en & ebtb_MPORT_8_mask) begin
      ebtb[ebtb_MPORT_8_addr] <= ebtb_MPORT_8_data; // @[btb.scala 67:29]
    end
    ebtb_s1_req_rebtb_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      ebtb_s1_req_rebtb_addr_pipe_0 <= s0_idx[6:0];
    end
    s1_idx <= io_f0_pc[39:3]; // @[frontend.scala 163:35]
    s1_valid <= io_f0_valid; // @[predictor.scala 168:25]
    s1_pc <= io_f0_pc; // @[predictor.scala 178:22]
    s1_update__valid <= io_update_valid; // @[predictor.scala 184:30]
    s1_update__bits_is_mispredict_update <= io_update_bits_is_mispredict_update; // @[predictor.scala 184:30]
    s1_update__bits_is_repair_update <= io_update_bits_is_repair_update; // @[predictor.scala 184:30]
    s1_update__bits_btb_mispredicts <= io_update_bits_btb_mispredicts; // @[predictor.scala 184:30]
    s1_update__bits_pc <= io_update_bits_pc; // @[predictor.scala 184:30]
    s1_update__bits_br_mask <= io_update_bits_br_mask; // @[predictor.scala 184:30]
    s1_update__bits_cfi_idx_valid <= io_update_bits_cfi_idx_valid; // @[predictor.scala 184:30]
    s1_update__bits_cfi_idx_bits <= io_update_bits_cfi_idx_bits; // @[predictor.scala 184:30]
    s1_update__bits_cfi_taken <= io_update_bits_cfi_taken; // @[predictor.scala 184:30]
    s1_update__bits_target <= io_update_bits_target; // @[predictor.scala 184:30]
    s1_update__bits_meta <= io_update_bits_meta; // @[predictor.scala 184:30]
    s1_update_idx <= io_update_bits_pc[39:3]; // @[frontend.scala 163:35]
    if (s1_hits_0 | s1_hits_1 | s1_hits_2 | s1_hits_3) begin // @[btb.scala 133:27]
      if (_T_693[0]) begin // @[Mux.scala 47:69]
        REG_write_way <= 1'h0;
      end else begin
        REG_write_way <= 1'h1;
      end
    end else begin
      REG_write_way <= alloc_way;
    end
    f3_meta_write_way <= REG_write_way; // @[btb.scala 53:24]
    doing_reset <= reset | _GEN_0; // @[btb.scala 60:28 btb.scala 60:28]
    if (reset) begin // @[btb.scala 61:28]
      reset_idx <= 7'h0; // @[btb.scala 61:28]
    end else begin
      reset_idx <= _T_1; // @[btb.scala 62:13]
    end
    REG_1 <= s1_hit_ohs_0_0 | s1_hit_ohs_0_1; // @[btb.scala 87:55]
    REG_2_valid <= ~doing_reset & s1_valid & s1_hits_0; // @[btb.scala 93:50]
    if (_GEN_12) begin // @[btb.scala 94:28]
      REG_2_bits <= ebtb_s1_req_rebtb_data;
    end else begin
      REG_2_bits <= _T_79;
    end
    REG_3 <= _T_69 & s1_resp_0_valid & _GEN_14; // @[btb.scala 98:54]
    REG_4 <= _T_82 & ~_GEN_14; // @[btb.scala 99:54]
    REG_5 <= _T_82 & ~_GEN_14; // @[btb.scala 99:54]
    REG_6 <= s1_hit_ohs_0_0 | s1_hit_ohs_0_1; // @[btb.scala 87:55]
    REG_7 <= REG_6; // @[btb.scala 112:18]
    REG_8_valid <= io_resp_f2_0_predicted_pc_valid; // @[btb.scala 113:44]
    REG_8_bits <= io_resp_f2_0_predicted_pc_bits; // @[btb.scala 113:44]
    REG_9 <= io_resp_f2_0_is_br; // @[btb.scala 114:44]
    REG_10 <= io_resp_f2_0_is_jal; // @[btb.scala 115:44]
    REG_11 <= _T_82 & ~_GEN_14; // @[btb.scala 99:54]
    REG_12 <= REG_11; // @[btb.scala 116:20]
    REG_13 <= s1_hit_ohs_1_0 | s1_hit_ohs_1_1; // @[btb.scala 87:55]
    REG_14_valid <= ~doing_reset & s1_valid & s1_hits_1; // @[btb.scala 93:50]
    if (_GEN_30) begin // @[btb.scala 94:28]
      REG_14_bits <= ebtb_s1_req_rebtb_data;
    end else begin
      REG_14_bits <= _T_98;
    end
    REG_15 <= _T_69 & s1_resp_1_valid & _GEN_32; // @[btb.scala 98:54]
    REG_16 <= _T_101 & ~_GEN_32; // @[btb.scala 99:54]
    REG_17 <= _T_101 & ~_GEN_32; // @[btb.scala 99:54]
    REG_18 <= s1_hit_ohs_1_0 | s1_hit_ohs_1_1; // @[btb.scala 87:55]
    REG_19 <= REG_18; // @[btb.scala 112:18]
    REG_20_valid <= io_resp_f2_1_predicted_pc_valid; // @[btb.scala 113:44]
    REG_20_bits <= io_resp_f2_1_predicted_pc_bits; // @[btb.scala 113:44]
    REG_21 <= io_resp_f2_1_is_br; // @[btb.scala 114:44]
    REG_22 <= io_resp_f2_1_is_jal; // @[btb.scala 115:44]
    REG_23 <= _T_101 & ~_GEN_32; // @[btb.scala 99:54]
    REG_24 <= REG_23; // @[btb.scala 116:20]
    REG_25 <= s1_hit_ohs_2_0 | s1_hit_ohs_2_1; // @[btb.scala 87:55]
    REG_26_valid <= ~doing_reset & s1_valid & s1_hits_2; // @[btb.scala 93:50]
    if (_GEN_48) begin // @[btb.scala 94:28]
      REG_26_bits <= ebtb_s1_req_rebtb_data;
    end else begin
      REG_26_bits <= _T_117;
    end
    REG_27 <= _T_69 & s1_resp_2_valid & _GEN_50; // @[btb.scala 98:54]
    REG_28 <= _T_120 & ~_GEN_50; // @[btb.scala 99:54]
    REG_29 <= _T_120 & ~_GEN_50; // @[btb.scala 99:54]
    REG_30 <= s1_hit_ohs_2_0 | s1_hit_ohs_2_1; // @[btb.scala 87:55]
    REG_31 <= REG_30; // @[btb.scala 112:18]
    REG_32_valid <= io_resp_f2_2_predicted_pc_valid; // @[btb.scala 113:44]
    REG_32_bits <= io_resp_f2_2_predicted_pc_bits; // @[btb.scala 113:44]
    REG_33 <= io_resp_f2_2_is_br; // @[btb.scala 114:44]
    REG_34 <= io_resp_f2_2_is_jal; // @[btb.scala 115:44]
    REG_35 <= _T_120 & ~_GEN_50; // @[btb.scala 99:54]
    REG_36 <= REG_35; // @[btb.scala 116:20]
    REG_37 <= s1_hit_ohs_3_0 | s1_hit_ohs_3_1; // @[btb.scala 87:55]
    REG_38_valid <= ~doing_reset & s1_valid & s1_hits_3; // @[btb.scala 93:50]
    if (_GEN_66) begin // @[btb.scala 94:28]
      REG_38_bits <= ebtb_s1_req_rebtb_data;
    end else begin
      REG_38_bits <= _T_136;
    end
    REG_39 <= _T_69 & s1_resp_3_valid & _GEN_68; // @[btb.scala 98:54]
    REG_40 <= _T_139 & ~_GEN_68; // @[btb.scala 99:54]
    REG_41 <= _T_139 & ~_GEN_68; // @[btb.scala 99:54]
    REG_42 <= s1_hit_ohs_3_0 | s1_hit_ohs_3_1; // @[btb.scala 87:55]
    REG_43 <= REG_42; // @[btb.scala 112:18]
    REG_44_valid <= io_resp_f2_3_predicted_pc_valid; // @[btb.scala 113:44]
    REG_44_bits <= io_resp_f2_3_predicted_pc_bits; // @[btb.scala 113:44]
    REG_45 <= io_resp_f2_3_is_br; // @[btb.scala 114:44]
    REG_46 <= io_resp_f2_3_is_jal; // @[btb.scala 115:44]
    REG_47 <= _T_139 & ~_GEN_68; // @[btb.scala 99:54]
    REG_48 <= REG_47; // @[btb.scala 116:20]
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
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    meta_0_0[initvar] = _RAND_0[30:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    meta_0_1[initvar] = _RAND_3[30:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    meta_0_2[initvar] = _RAND_6[30:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    meta_0_3[initvar] = _RAND_9[30:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    meta_1_0[initvar] = _RAND_12[30:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    meta_1_1[initvar] = _RAND_15[30:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    meta_1_2[initvar] = _RAND_18[30:0];
  _RAND_21 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    meta_1_3[initvar] = _RAND_21[30:0];
  _RAND_24 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    btb_0_0[initvar] = _RAND_24[13:0];
  _RAND_27 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    btb_0_1[initvar] = _RAND_27[13:0];
  _RAND_30 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    btb_0_2[initvar] = _RAND_30[13:0];
  _RAND_33 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    btb_0_3[initvar] = _RAND_33[13:0];
  _RAND_36 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    btb_1_0[initvar] = _RAND_36[13:0];
  _RAND_39 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    btb_1_1[initvar] = _RAND_39[13:0];
  _RAND_42 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    btb_1_2[initvar] = _RAND_42[13:0];
  _RAND_45 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    btb_1_3[initvar] = _RAND_45[13:0];
  _RAND_48 = {2{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ebtb[initvar] = _RAND_48[39:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  meta_0_0_MPORT_2_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  meta_0_0_MPORT_2_addr_pipe_0 = _RAND_2[6:0];
  _RAND_4 = {1{`RANDOM}};
  meta_0_1_MPORT_2_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  meta_0_1_MPORT_2_addr_pipe_0 = _RAND_5[6:0];
  _RAND_7 = {1{`RANDOM}};
  meta_0_2_MPORT_2_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  meta_0_2_MPORT_2_addr_pipe_0 = _RAND_8[6:0];
  _RAND_10 = {1{`RANDOM}};
  meta_0_3_MPORT_2_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  meta_0_3_MPORT_2_addr_pipe_0 = _RAND_11[6:0];
  _RAND_13 = {1{`RANDOM}};
  meta_1_0_MPORT_3_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  meta_1_0_MPORT_3_addr_pipe_0 = _RAND_14[6:0];
  _RAND_16 = {1{`RANDOM}};
  meta_1_1_MPORT_3_en_pipe_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  meta_1_1_MPORT_3_addr_pipe_0 = _RAND_17[6:0];
  _RAND_19 = {1{`RANDOM}};
  meta_1_2_MPORT_3_en_pipe_0 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  meta_1_2_MPORT_3_addr_pipe_0 = _RAND_20[6:0];
  _RAND_22 = {1{`RANDOM}};
  meta_1_3_MPORT_3_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  meta_1_3_MPORT_3_addr_pipe_0 = _RAND_23[6:0];
  _RAND_25 = {1{`RANDOM}};
  btb_0_0_MPORT_en_pipe_0 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  btb_0_0_MPORT_addr_pipe_0 = _RAND_26[6:0];
  _RAND_28 = {1{`RANDOM}};
  btb_0_1_MPORT_en_pipe_0 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  btb_0_1_MPORT_addr_pipe_0 = _RAND_29[6:0];
  _RAND_31 = {1{`RANDOM}};
  btb_0_2_MPORT_en_pipe_0 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  btb_0_2_MPORT_addr_pipe_0 = _RAND_32[6:0];
  _RAND_34 = {1{`RANDOM}};
  btb_0_3_MPORT_en_pipe_0 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  btb_0_3_MPORT_addr_pipe_0 = _RAND_35[6:0];
  _RAND_37 = {1{`RANDOM}};
  btb_1_0_MPORT_1_en_pipe_0 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  btb_1_0_MPORT_1_addr_pipe_0 = _RAND_38[6:0];
  _RAND_40 = {1{`RANDOM}};
  btb_1_1_MPORT_1_en_pipe_0 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  btb_1_1_MPORT_1_addr_pipe_0 = _RAND_41[6:0];
  _RAND_43 = {1{`RANDOM}};
  btb_1_2_MPORT_1_en_pipe_0 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  btb_1_2_MPORT_1_addr_pipe_0 = _RAND_44[6:0];
  _RAND_46 = {1{`RANDOM}};
  btb_1_3_MPORT_1_en_pipe_0 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  btb_1_3_MPORT_1_addr_pipe_0 = _RAND_47[6:0];
  _RAND_49 = {1{`RANDOM}};
  ebtb_s1_req_rebtb_en_pipe_0 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  ebtb_s1_req_rebtb_addr_pipe_0 = _RAND_50[6:0];
  _RAND_51 = {2{`RANDOM}};
  s1_idx = _RAND_51[36:0];
  _RAND_52 = {1{`RANDOM}};
  s1_valid = _RAND_52[0:0];
  _RAND_53 = {2{`RANDOM}};
  s1_pc = _RAND_53[39:0];
  _RAND_54 = {1{`RANDOM}};
  s1_update__valid = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  s1_update__bits_is_mispredict_update = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  s1_update__bits_is_repair_update = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  s1_update__bits_btb_mispredicts = _RAND_57[3:0];
  _RAND_58 = {2{`RANDOM}};
  s1_update__bits_pc = _RAND_58[39:0];
  _RAND_59 = {1{`RANDOM}};
  s1_update__bits_br_mask = _RAND_59[3:0];
  _RAND_60 = {1{`RANDOM}};
  s1_update__bits_cfi_idx_valid = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  s1_update__bits_cfi_idx_bits = _RAND_61[1:0];
  _RAND_62 = {1{`RANDOM}};
  s1_update__bits_cfi_taken = _RAND_62[0:0];
  _RAND_63 = {2{`RANDOM}};
  s1_update__bits_target = _RAND_63[39:0];
  _RAND_64 = {4{`RANDOM}};
  s1_update__bits_meta = _RAND_64[119:0];
  _RAND_65 = {2{`RANDOM}};
  s1_update_idx = _RAND_65[36:0];
  _RAND_66 = {1{`RANDOM}};
  REG_write_way = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  f3_meta_write_way = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  doing_reset = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  reset_idx = _RAND_69[6:0];
  _RAND_70 = {1{`RANDOM}};
  REG_1 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  REG_2_valid = _RAND_71[0:0];
  _RAND_72 = {2{`RANDOM}};
  REG_2_bits = _RAND_72[39:0];
  _RAND_73 = {1{`RANDOM}};
  REG_3 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  REG_4 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  REG_5 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  REG_6 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  REG_7 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  REG_8_valid = _RAND_78[0:0];
  _RAND_79 = {2{`RANDOM}};
  REG_8_bits = _RAND_79[39:0];
  _RAND_80 = {1{`RANDOM}};
  REG_9 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  REG_10 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  REG_11 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  REG_12 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  REG_13 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  REG_14_valid = _RAND_85[0:0];
  _RAND_86 = {2{`RANDOM}};
  REG_14_bits = _RAND_86[39:0];
  _RAND_87 = {1{`RANDOM}};
  REG_15 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  REG_16 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  REG_17 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  REG_18 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  REG_19 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  REG_20_valid = _RAND_92[0:0];
  _RAND_93 = {2{`RANDOM}};
  REG_20_bits = _RAND_93[39:0];
  _RAND_94 = {1{`RANDOM}};
  REG_21 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  REG_22 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  REG_23 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  REG_24 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  REG_25 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  REG_26_valid = _RAND_99[0:0];
  _RAND_100 = {2{`RANDOM}};
  REG_26_bits = _RAND_100[39:0];
  _RAND_101 = {1{`RANDOM}};
  REG_27 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  REG_28 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  REG_29 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  REG_30 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  REG_31 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  REG_32_valid = _RAND_106[0:0];
  _RAND_107 = {2{`RANDOM}};
  REG_32_bits = _RAND_107[39:0];
  _RAND_108 = {1{`RANDOM}};
  REG_33 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  REG_34 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  REG_35 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  REG_36 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  REG_37 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  REG_38_valid = _RAND_113[0:0];
  _RAND_114 = {2{`RANDOM}};
  REG_38_bits = _RAND_114[39:0];
  _RAND_115 = {1{`RANDOM}};
  REG_39 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  REG_40 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  REG_41 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  REG_42 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  REG_43 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  REG_44_valid = _RAND_120[0:0];
  _RAND_121 = {2{`RANDOM}};
  REG_44_bits = _RAND_121[39:0];
  _RAND_122 = {1{`RANDOM}};
  REG_45 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  REG_46 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  REG_47 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  REG_48 = _RAND_125[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
