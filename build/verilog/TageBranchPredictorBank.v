module TageBranchPredictorBank(
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
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [127:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [63:0] _RAND_74;
  reg [63:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [63:0] _RAND_100;
  reg [63:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [63:0] _RAND_126;
  reg [63:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [63:0] _RAND_152;
  reg [63:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [63:0] _RAND_178;
  reg [63:0] _RAND_179;
`endif // RANDOMIZE_REG_INIT
  wire  tables_0_clock; // @[tage.scala 224:21]
  wire  tables_0_reset; // @[tage.scala 224:21]
  wire  tables_0_io_f1_req_valid; // @[tage.scala 224:21]
  wire [39:0] tables_0_io_f1_req_pc; // @[tage.scala 224:21]
  wire [63:0] tables_0_io_f1_req_ghist; // @[tage.scala 224:21]
  wire  tables_0_io_f3_resp_0_valid; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_f3_resp_0_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_f3_resp_0_bits_u; // @[tage.scala 224:21]
  wire  tables_0_io_f3_resp_1_valid; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_f3_resp_1_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_f3_resp_1_bits_u; // @[tage.scala 224:21]
  wire  tables_0_io_f3_resp_2_valid; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_f3_resp_2_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_f3_resp_2_bits_u; // @[tage.scala 224:21]
  wire  tables_0_io_f3_resp_3_valid; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_f3_resp_3_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_f3_resp_3_bits_u; // @[tage.scala 224:21]
  wire  tables_0_io_update_mask_0; // @[tage.scala 224:21]
  wire  tables_0_io_update_mask_1; // @[tage.scala 224:21]
  wire  tables_0_io_update_mask_2; // @[tage.scala 224:21]
  wire  tables_0_io_update_mask_3; // @[tage.scala 224:21]
  wire  tables_0_io_update_taken_0; // @[tage.scala 224:21]
  wire  tables_0_io_update_taken_1; // @[tage.scala 224:21]
  wire  tables_0_io_update_taken_2; // @[tage.scala 224:21]
  wire  tables_0_io_update_taken_3; // @[tage.scala 224:21]
  wire  tables_0_io_update_alloc_0; // @[tage.scala 224:21]
  wire  tables_0_io_update_alloc_1; // @[tage.scala 224:21]
  wire  tables_0_io_update_alloc_2; // @[tage.scala 224:21]
  wire  tables_0_io_update_alloc_3; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_update_old_ctr_0; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_update_old_ctr_1; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_update_old_ctr_2; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_update_old_ctr_3; // @[tage.scala 224:21]
  wire [39:0] tables_0_io_update_pc; // @[tage.scala 224:21]
  wire [63:0] tables_0_io_update_hist; // @[tage.scala 224:21]
  wire  tables_0_io_update_u_mask_0; // @[tage.scala 224:21]
  wire  tables_0_io_update_u_mask_1; // @[tage.scala 224:21]
  wire  tables_0_io_update_u_mask_2; // @[tage.scala 224:21]
  wire  tables_0_io_update_u_mask_3; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_update_u_0; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_update_u_1; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_update_u_2; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_update_u_3; // @[tage.scala 224:21]
  wire  tables_1_clock; // @[tage.scala 224:21]
  wire  tables_1_reset; // @[tage.scala 224:21]
  wire  tables_1_io_f1_req_valid; // @[tage.scala 224:21]
  wire [39:0] tables_1_io_f1_req_pc; // @[tage.scala 224:21]
  wire [63:0] tables_1_io_f1_req_ghist; // @[tage.scala 224:21]
  wire  tables_1_io_f3_resp_0_valid; // @[tage.scala 224:21]
  wire [2:0] tables_1_io_f3_resp_0_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_1_io_f3_resp_0_bits_u; // @[tage.scala 224:21]
  wire  tables_1_io_f3_resp_1_valid; // @[tage.scala 224:21]
  wire [2:0] tables_1_io_f3_resp_1_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_1_io_f3_resp_1_bits_u; // @[tage.scala 224:21]
  wire  tables_1_io_f3_resp_2_valid; // @[tage.scala 224:21]
  wire [2:0] tables_1_io_f3_resp_2_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_1_io_f3_resp_2_bits_u; // @[tage.scala 224:21]
  wire  tables_1_io_f3_resp_3_valid; // @[tage.scala 224:21]
  wire [2:0] tables_1_io_f3_resp_3_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_1_io_f3_resp_3_bits_u; // @[tage.scala 224:21]
  wire  tables_1_io_update_mask_0; // @[tage.scala 224:21]
  wire  tables_1_io_update_mask_1; // @[tage.scala 224:21]
  wire  tables_1_io_update_mask_2; // @[tage.scala 224:21]
  wire  tables_1_io_update_mask_3; // @[tage.scala 224:21]
  wire  tables_1_io_update_taken_0; // @[tage.scala 224:21]
  wire  tables_1_io_update_taken_1; // @[tage.scala 224:21]
  wire  tables_1_io_update_taken_2; // @[tage.scala 224:21]
  wire  tables_1_io_update_taken_3; // @[tage.scala 224:21]
  wire  tables_1_io_update_alloc_0; // @[tage.scala 224:21]
  wire  tables_1_io_update_alloc_1; // @[tage.scala 224:21]
  wire  tables_1_io_update_alloc_2; // @[tage.scala 224:21]
  wire  tables_1_io_update_alloc_3; // @[tage.scala 224:21]
  wire [2:0] tables_1_io_update_old_ctr_0; // @[tage.scala 224:21]
  wire [2:0] tables_1_io_update_old_ctr_1; // @[tage.scala 224:21]
  wire [2:0] tables_1_io_update_old_ctr_2; // @[tage.scala 224:21]
  wire [2:0] tables_1_io_update_old_ctr_3; // @[tage.scala 224:21]
  wire [39:0] tables_1_io_update_pc; // @[tage.scala 224:21]
  wire [63:0] tables_1_io_update_hist; // @[tage.scala 224:21]
  wire  tables_1_io_update_u_mask_0; // @[tage.scala 224:21]
  wire  tables_1_io_update_u_mask_1; // @[tage.scala 224:21]
  wire  tables_1_io_update_u_mask_2; // @[tage.scala 224:21]
  wire  tables_1_io_update_u_mask_3; // @[tage.scala 224:21]
  wire [1:0] tables_1_io_update_u_0; // @[tage.scala 224:21]
  wire [1:0] tables_1_io_update_u_1; // @[tage.scala 224:21]
  wire [1:0] tables_1_io_update_u_2; // @[tage.scala 224:21]
  wire [1:0] tables_1_io_update_u_3; // @[tage.scala 224:21]
  wire  tables_2_clock; // @[tage.scala 224:21]
  wire  tables_2_reset; // @[tage.scala 224:21]
  wire  tables_2_io_f1_req_valid; // @[tage.scala 224:21]
  wire [39:0] tables_2_io_f1_req_pc; // @[tage.scala 224:21]
  wire [63:0] tables_2_io_f1_req_ghist; // @[tage.scala 224:21]
  wire  tables_2_io_f3_resp_0_valid; // @[tage.scala 224:21]
  wire [2:0] tables_2_io_f3_resp_0_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_2_io_f3_resp_0_bits_u; // @[tage.scala 224:21]
  wire  tables_2_io_f3_resp_1_valid; // @[tage.scala 224:21]
  wire [2:0] tables_2_io_f3_resp_1_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_2_io_f3_resp_1_bits_u; // @[tage.scala 224:21]
  wire  tables_2_io_f3_resp_2_valid; // @[tage.scala 224:21]
  wire [2:0] tables_2_io_f3_resp_2_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_2_io_f3_resp_2_bits_u; // @[tage.scala 224:21]
  wire  tables_2_io_f3_resp_3_valid; // @[tage.scala 224:21]
  wire [2:0] tables_2_io_f3_resp_3_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_2_io_f3_resp_3_bits_u; // @[tage.scala 224:21]
  wire  tables_2_io_update_mask_0; // @[tage.scala 224:21]
  wire  tables_2_io_update_mask_1; // @[tage.scala 224:21]
  wire  tables_2_io_update_mask_2; // @[tage.scala 224:21]
  wire  tables_2_io_update_mask_3; // @[tage.scala 224:21]
  wire  tables_2_io_update_taken_0; // @[tage.scala 224:21]
  wire  tables_2_io_update_taken_1; // @[tage.scala 224:21]
  wire  tables_2_io_update_taken_2; // @[tage.scala 224:21]
  wire  tables_2_io_update_taken_3; // @[tage.scala 224:21]
  wire  tables_2_io_update_alloc_0; // @[tage.scala 224:21]
  wire  tables_2_io_update_alloc_1; // @[tage.scala 224:21]
  wire  tables_2_io_update_alloc_2; // @[tage.scala 224:21]
  wire  tables_2_io_update_alloc_3; // @[tage.scala 224:21]
  wire [2:0] tables_2_io_update_old_ctr_0; // @[tage.scala 224:21]
  wire [2:0] tables_2_io_update_old_ctr_1; // @[tage.scala 224:21]
  wire [2:0] tables_2_io_update_old_ctr_2; // @[tage.scala 224:21]
  wire [2:0] tables_2_io_update_old_ctr_3; // @[tage.scala 224:21]
  wire [39:0] tables_2_io_update_pc; // @[tage.scala 224:21]
  wire [63:0] tables_2_io_update_hist; // @[tage.scala 224:21]
  wire  tables_2_io_update_u_mask_0; // @[tage.scala 224:21]
  wire  tables_2_io_update_u_mask_1; // @[tage.scala 224:21]
  wire  tables_2_io_update_u_mask_2; // @[tage.scala 224:21]
  wire  tables_2_io_update_u_mask_3; // @[tage.scala 224:21]
  wire [1:0] tables_2_io_update_u_0; // @[tage.scala 224:21]
  wire [1:0] tables_2_io_update_u_1; // @[tage.scala 224:21]
  wire [1:0] tables_2_io_update_u_2; // @[tage.scala 224:21]
  wire [1:0] tables_2_io_update_u_3; // @[tage.scala 224:21]
  wire  tables_3_clock; // @[tage.scala 224:21]
  wire  tables_3_reset; // @[tage.scala 224:21]
  wire  tables_3_io_f1_req_valid; // @[tage.scala 224:21]
  wire [39:0] tables_3_io_f1_req_pc; // @[tage.scala 224:21]
  wire [63:0] tables_3_io_f1_req_ghist; // @[tage.scala 224:21]
  wire  tables_3_io_f3_resp_0_valid; // @[tage.scala 224:21]
  wire [2:0] tables_3_io_f3_resp_0_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_3_io_f3_resp_0_bits_u; // @[tage.scala 224:21]
  wire  tables_3_io_f3_resp_1_valid; // @[tage.scala 224:21]
  wire [2:0] tables_3_io_f3_resp_1_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_3_io_f3_resp_1_bits_u; // @[tage.scala 224:21]
  wire  tables_3_io_f3_resp_2_valid; // @[tage.scala 224:21]
  wire [2:0] tables_3_io_f3_resp_2_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_3_io_f3_resp_2_bits_u; // @[tage.scala 224:21]
  wire  tables_3_io_f3_resp_3_valid; // @[tage.scala 224:21]
  wire [2:0] tables_3_io_f3_resp_3_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_3_io_f3_resp_3_bits_u; // @[tage.scala 224:21]
  wire  tables_3_io_update_mask_0; // @[tage.scala 224:21]
  wire  tables_3_io_update_mask_1; // @[tage.scala 224:21]
  wire  tables_3_io_update_mask_2; // @[tage.scala 224:21]
  wire  tables_3_io_update_mask_3; // @[tage.scala 224:21]
  wire  tables_3_io_update_taken_0; // @[tage.scala 224:21]
  wire  tables_3_io_update_taken_1; // @[tage.scala 224:21]
  wire  tables_3_io_update_taken_2; // @[tage.scala 224:21]
  wire  tables_3_io_update_taken_3; // @[tage.scala 224:21]
  wire  tables_3_io_update_alloc_0; // @[tage.scala 224:21]
  wire  tables_3_io_update_alloc_1; // @[tage.scala 224:21]
  wire  tables_3_io_update_alloc_2; // @[tage.scala 224:21]
  wire  tables_3_io_update_alloc_3; // @[tage.scala 224:21]
  wire [2:0] tables_3_io_update_old_ctr_0; // @[tage.scala 224:21]
  wire [2:0] tables_3_io_update_old_ctr_1; // @[tage.scala 224:21]
  wire [2:0] tables_3_io_update_old_ctr_2; // @[tage.scala 224:21]
  wire [2:0] tables_3_io_update_old_ctr_3; // @[tage.scala 224:21]
  wire [39:0] tables_3_io_update_pc; // @[tage.scala 224:21]
  wire [63:0] tables_3_io_update_hist; // @[tage.scala 224:21]
  wire  tables_3_io_update_u_mask_0; // @[tage.scala 224:21]
  wire  tables_3_io_update_u_mask_1; // @[tage.scala 224:21]
  wire  tables_3_io_update_u_mask_2; // @[tage.scala 224:21]
  wire  tables_3_io_update_u_mask_3; // @[tage.scala 224:21]
  wire [1:0] tables_3_io_update_u_0; // @[tage.scala 224:21]
  wire [1:0] tables_3_io_update_u_1; // @[tage.scala 224:21]
  wire [1:0] tables_3_io_update_u_2; // @[tage.scala 224:21]
  wire [1:0] tables_3_io_update_u_3; // @[tage.scala 224:21]
  wire  tables_4_clock; // @[tage.scala 224:21]
  wire  tables_4_reset; // @[tage.scala 224:21]
  wire  tables_4_io_f1_req_valid; // @[tage.scala 224:21]
  wire [39:0] tables_4_io_f1_req_pc; // @[tage.scala 224:21]
  wire [63:0] tables_4_io_f1_req_ghist; // @[tage.scala 224:21]
  wire  tables_4_io_f3_resp_0_valid; // @[tage.scala 224:21]
  wire [2:0] tables_4_io_f3_resp_0_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_4_io_f3_resp_0_bits_u; // @[tage.scala 224:21]
  wire  tables_4_io_f3_resp_1_valid; // @[tage.scala 224:21]
  wire [2:0] tables_4_io_f3_resp_1_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_4_io_f3_resp_1_bits_u; // @[tage.scala 224:21]
  wire  tables_4_io_f3_resp_2_valid; // @[tage.scala 224:21]
  wire [2:0] tables_4_io_f3_resp_2_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_4_io_f3_resp_2_bits_u; // @[tage.scala 224:21]
  wire  tables_4_io_f3_resp_3_valid; // @[tage.scala 224:21]
  wire [2:0] tables_4_io_f3_resp_3_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_4_io_f3_resp_3_bits_u; // @[tage.scala 224:21]
  wire  tables_4_io_update_mask_0; // @[tage.scala 224:21]
  wire  tables_4_io_update_mask_1; // @[tage.scala 224:21]
  wire  tables_4_io_update_mask_2; // @[tage.scala 224:21]
  wire  tables_4_io_update_mask_3; // @[tage.scala 224:21]
  wire  tables_4_io_update_taken_0; // @[tage.scala 224:21]
  wire  tables_4_io_update_taken_1; // @[tage.scala 224:21]
  wire  tables_4_io_update_taken_2; // @[tage.scala 224:21]
  wire  tables_4_io_update_taken_3; // @[tage.scala 224:21]
  wire  tables_4_io_update_alloc_0; // @[tage.scala 224:21]
  wire  tables_4_io_update_alloc_1; // @[tage.scala 224:21]
  wire  tables_4_io_update_alloc_2; // @[tage.scala 224:21]
  wire  tables_4_io_update_alloc_3; // @[tage.scala 224:21]
  wire [2:0] tables_4_io_update_old_ctr_0; // @[tage.scala 224:21]
  wire [2:0] tables_4_io_update_old_ctr_1; // @[tage.scala 224:21]
  wire [2:0] tables_4_io_update_old_ctr_2; // @[tage.scala 224:21]
  wire [2:0] tables_4_io_update_old_ctr_3; // @[tage.scala 224:21]
  wire [39:0] tables_4_io_update_pc; // @[tage.scala 224:21]
  wire [63:0] tables_4_io_update_hist; // @[tage.scala 224:21]
  wire  tables_4_io_update_u_mask_0; // @[tage.scala 224:21]
  wire  tables_4_io_update_u_mask_1; // @[tage.scala 224:21]
  wire  tables_4_io_update_u_mask_2; // @[tage.scala 224:21]
  wire  tables_4_io_update_u_mask_3; // @[tage.scala 224:21]
  wire [1:0] tables_4_io_update_u_0; // @[tage.scala 224:21]
  wire [1:0] tables_4_io_update_u_1; // @[tage.scala 224:21]
  wire [1:0] tables_4_io_update_u_2; // @[tage.scala 224:21]
  wire [1:0] tables_4_io_update_u_3; // @[tage.scala 224:21]
  wire  tables_5_clock; // @[tage.scala 224:21]
  wire  tables_5_reset; // @[tage.scala 224:21]
  wire  tables_5_io_f1_req_valid; // @[tage.scala 224:21]
  wire [39:0] tables_5_io_f1_req_pc; // @[tage.scala 224:21]
  wire [63:0] tables_5_io_f1_req_ghist; // @[tage.scala 224:21]
  wire  tables_5_io_f3_resp_0_valid; // @[tage.scala 224:21]
  wire [2:0] tables_5_io_f3_resp_0_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_5_io_f3_resp_0_bits_u; // @[tage.scala 224:21]
  wire  tables_5_io_f3_resp_1_valid; // @[tage.scala 224:21]
  wire [2:0] tables_5_io_f3_resp_1_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_5_io_f3_resp_1_bits_u; // @[tage.scala 224:21]
  wire  tables_5_io_f3_resp_2_valid; // @[tage.scala 224:21]
  wire [2:0] tables_5_io_f3_resp_2_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_5_io_f3_resp_2_bits_u; // @[tage.scala 224:21]
  wire  tables_5_io_f3_resp_3_valid; // @[tage.scala 224:21]
  wire [2:0] tables_5_io_f3_resp_3_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_5_io_f3_resp_3_bits_u; // @[tage.scala 224:21]
  wire  tables_5_io_update_mask_0; // @[tage.scala 224:21]
  wire  tables_5_io_update_mask_1; // @[tage.scala 224:21]
  wire  tables_5_io_update_mask_2; // @[tage.scala 224:21]
  wire  tables_5_io_update_mask_3; // @[tage.scala 224:21]
  wire  tables_5_io_update_taken_0; // @[tage.scala 224:21]
  wire  tables_5_io_update_taken_1; // @[tage.scala 224:21]
  wire  tables_5_io_update_taken_2; // @[tage.scala 224:21]
  wire  tables_5_io_update_taken_3; // @[tage.scala 224:21]
  wire  tables_5_io_update_alloc_0; // @[tage.scala 224:21]
  wire  tables_5_io_update_alloc_1; // @[tage.scala 224:21]
  wire  tables_5_io_update_alloc_2; // @[tage.scala 224:21]
  wire  tables_5_io_update_alloc_3; // @[tage.scala 224:21]
  wire [2:0] tables_5_io_update_old_ctr_0; // @[tage.scala 224:21]
  wire [2:0] tables_5_io_update_old_ctr_1; // @[tage.scala 224:21]
  wire [2:0] tables_5_io_update_old_ctr_2; // @[tage.scala 224:21]
  wire [2:0] tables_5_io_update_old_ctr_3; // @[tage.scala 224:21]
  wire [39:0] tables_5_io_update_pc; // @[tage.scala 224:21]
  wire [63:0] tables_5_io_update_hist; // @[tage.scala 224:21]
  wire  tables_5_io_update_u_mask_0; // @[tage.scala 224:21]
  wire  tables_5_io_update_u_mask_1; // @[tage.scala 224:21]
  wire  tables_5_io_update_u_mask_2; // @[tage.scala 224:21]
  wire  tables_5_io_update_u_mask_3; // @[tage.scala 224:21]
  wire [1:0] tables_5_io_update_u_0; // @[tage.scala 224:21]
  wire [1:0] tables_5_io_update_u_1; // @[tage.scala 224:21]
  wire [1:0] tables_5_io_update_u_2; // @[tage.scala 224:21]
  wire [1:0] tables_5_io_update_u_3; // @[tage.scala 224:21]
  wire  prng_clock; // @[PRNG.scala 82:22]
  wire  prng_reset; // @[PRNG.scala 82:22]
  wire  prng_io_seed_valid; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_0; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_1; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_2; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_3; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_4; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_5; // @[PRNG.scala 82:22]
  wire  prng_io_increment; // @[PRNG.scala 82:22]
  wire  prng_io_out_0; // @[PRNG.scala 82:22]
  wire  prng_io_out_1; // @[PRNG.scala 82:22]
  wire  prng_io_out_2; // @[PRNG.scala 82:22]
  wire  prng_io_out_3; // @[PRNG.scala 82:22]
  wire  prng_io_out_4; // @[PRNG.scala 82:22]
  wire  prng_io_out_5; // @[PRNG.scala 82:22]
  wire  prng_1_clock; // @[PRNG.scala 82:22]
  wire  prng_1_reset; // @[PRNG.scala 82:22]
  wire  prng_1_io_seed_valid; // @[PRNG.scala 82:22]
  wire  prng_1_io_seed_bits_0; // @[PRNG.scala 82:22]
  wire  prng_1_io_seed_bits_1; // @[PRNG.scala 82:22]
  wire  prng_1_io_seed_bits_2; // @[PRNG.scala 82:22]
  wire  prng_1_io_seed_bits_3; // @[PRNG.scala 82:22]
  wire  prng_1_io_seed_bits_4; // @[PRNG.scala 82:22]
  wire  prng_1_io_seed_bits_5; // @[PRNG.scala 82:22]
  wire  prng_1_io_increment; // @[PRNG.scala 82:22]
  wire  prng_1_io_out_0; // @[PRNG.scala 82:22]
  wire  prng_1_io_out_1; // @[PRNG.scala 82:22]
  wire  prng_1_io_out_2; // @[PRNG.scala 82:22]
  wire  prng_1_io_out_3; // @[PRNG.scala 82:22]
  wire  prng_1_io_out_4; // @[PRNG.scala 82:22]
  wire  prng_1_io_out_5; // @[PRNG.scala 82:22]
  wire  prng_2_clock; // @[PRNG.scala 82:22]
  wire  prng_2_reset; // @[PRNG.scala 82:22]
  wire  prng_2_io_seed_valid; // @[PRNG.scala 82:22]
  wire  prng_2_io_seed_bits_0; // @[PRNG.scala 82:22]
  wire  prng_2_io_seed_bits_1; // @[PRNG.scala 82:22]
  wire  prng_2_io_seed_bits_2; // @[PRNG.scala 82:22]
  wire  prng_2_io_seed_bits_3; // @[PRNG.scala 82:22]
  wire  prng_2_io_seed_bits_4; // @[PRNG.scala 82:22]
  wire  prng_2_io_seed_bits_5; // @[PRNG.scala 82:22]
  wire  prng_2_io_increment; // @[PRNG.scala 82:22]
  wire  prng_2_io_out_0; // @[PRNG.scala 82:22]
  wire  prng_2_io_out_1; // @[PRNG.scala 82:22]
  wire  prng_2_io_out_2; // @[PRNG.scala 82:22]
  wire  prng_2_io_out_3; // @[PRNG.scala 82:22]
  wire  prng_2_io_out_4; // @[PRNG.scala 82:22]
  wire  prng_2_io_out_5; // @[PRNG.scala 82:22]
  wire  prng_3_clock; // @[PRNG.scala 82:22]
  wire  prng_3_reset; // @[PRNG.scala 82:22]
  wire  prng_3_io_seed_valid; // @[PRNG.scala 82:22]
  wire  prng_3_io_seed_bits_0; // @[PRNG.scala 82:22]
  wire  prng_3_io_seed_bits_1; // @[PRNG.scala 82:22]
  wire  prng_3_io_seed_bits_2; // @[PRNG.scala 82:22]
  wire  prng_3_io_seed_bits_3; // @[PRNG.scala 82:22]
  wire  prng_3_io_seed_bits_4; // @[PRNG.scala 82:22]
  wire  prng_3_io_seed_bits_5; // @[PRNG.scala 82:22]
  wire  prng_3_io_increment; // @[PRNG.scala 82:22]
  wire  prng_3_io_out_0; // @[PRNG.scala 82:22]
  wire  prng_3_io_out_1; // @[PRNG.scala 82:22]
  wire  prng_3_io_out_2; // @[PRNG.scala 82:22]
  wire  prng_3_io_out_3; // @[PRNG.scala 82:22]
  wire  prng_3_io_out_4; // @[PRNG.scala 82:22]
  wire  prng_3_io_out_5; // @[PRNG.scala 82:22]
  reg  s1_update__valid; // @[predictor.scala 184:30]
  reg  s1_update__bits_is_mispredict_update; // @[predictor.scala 184:30]
  reg  s1_update__bits_is_repair_update; // @[predictor.scala 184:30]
  reg [3:0] s1_update__bits_btb_mispredicts; // @[predictor.scala 184:30]
  reg [39:0] s1_update__bits_pc; // @[predictor.scala 184:30]
  reg [3:0] s1_update__bits_br_mask; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_idx_valid; // @[predictor.scala 184:30]
  reg [1:0] s1_update__bits_cfi_idx_bits; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_taken; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_mispredicted; // @[predictor.scala 184:30]
  reg [63:0] s1_update__bits_ghist; // @[predictor.scala 184:30]
  reg [119:0] s1_update__bits_meta; // @[predictor.scala 184:30]
  wire  f3_resps_5_1_valid = tables_5_io_f3_resp_1_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_5_1_bits_u = tables_5_io_f3_resp_1_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_257 = ~f3_resps_5_1_valid & f3_resps_5_1_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_4_1_valid = tables_4_io_f3_resp_1_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_4_1_bits_u = tables_4_io_f3_resp_1_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_254 = ~f3_resps_4_1_valid & f3_resps_4_1_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_3_1_valid = tables_3_io_f3_resp_1_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_3_1_bits_u = tables_3_io_f3_resp_1_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_251 = ~f3_resps_3_1_valid & f3_resps_3_1_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_2_1_valid = tables_2_io_f3_resp_1_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_2_1_bits_u = tables_2_io_f3_resp_1_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_248 = ~f3_resps_2_1_valid & f3_resps_2_1_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_1_1_valid = tables_1_io_f3_resp_1_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_1_1_bits_u = tables_1_io_f3_resp_1_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_245 = ~f3_resps_1_1_valid & f3_resps_1_1_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_0_1_valid = tables_0_io_f3_resp_1_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_0_1_bits_u = tables_0_io_f3_resp_1_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_242 = ~f3_resps_0_1_valid & f3_resps_0_1_bits_u == 2'h0; // @[tage.scala 282:45]
  wire [5:0] _T_258 = {_T_257,_T_254,_T_251,_T_248,_T_245,_T_242}; // @[tage.scala 282:70]
  wire [1:0] _T_209 = f3_resps_2_1_valid ? 2'h2 : {{1'd0}, f3_resps_1_1_valid}; // @[tage.scala 270:21]
  wire [1:0] _T_218 = f3_resps_3_1_valid ? 2'h3 : _T_209; // @[tage.scala 270:21]
  wire [2:0] _T_227 = f3_resps_4_1_valid ? 3'h4 : {{1'd0}, _T_218}; // @[tage.scala 270:21]
  wire [2:0] f3_meta_provider_1_bits = f3_resps_5_1_valid ? 3'h5 : _T_227; // @[tage.scala 270:21]
  wire [7:0] _T_259 = 8'h1 << f3_meta_provider_1_bits; // @[OneHot.scala 58:35]
  wire [7:0] _T_261 = {{1'd0}, _T_259[7:1]}; // @[util.scala 373:29]
  wire [7:0] _T_268 = _T_259 | _T_261; // @[util.scala 373:45]
  wire [7:0] _T_262 = {{2'd0}, _T_259[7:2]}; // @[util.scala 373:29]
  wire [7:0] _T_269 = _T_268 | _T_262; // @[util.scala 373:45]
  wire [7:0] _T_263 = {{3'd0}, _T_259[7:3]}; // @[util.scala 373:29]
  wire [7:0] _T_270 = _T_269 | _T_263; // @[util.scala 373:45]
  wire [7:0] _T_264 = {{4'd0}, _T_259[7:4]}; // @[util.scala 373:29]
  wire [7:0] _T_271 = _T_270 | _T_264; // @[util.scala 373:45]
  wire [7:0] _T_265 = {{5'd0}, _T_259[7:5]}; // @[util.scala 373:29]
  wire [7:0] _T_272 = _T_271 | _T_265; // @[util.scala 373:45]
  wire [7:0] _T_266 = {{6'd0}, _T_259[7:6]}; // @[util.scala 373:29]
  wire [7:0] _T_273 = _T_272 | _T_266; // @[util.scala 373:45]
  wire [7:0] _T_267 = {{7'd0}, _T_259[7]}; // @[util.scala 373:29]
  wire [7:0] _T_274 = _T_273 | _T_267; // @[util.scala 373:45]
  wire  f3_meta_provider_1_valid = f3_resps_0_1_valid | f3_resps_1_1_valid | f3_resps_2_1_valid | f3_resps_3_1_valid |
    f3_resps_4_1_valid | f3_resps_5_1_valid; // @[tage.scala 269:27]
  wire [5:0] _T_276 = f3_meta_provider_1_valid ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _GEN_1007 = {{2'd0}, _T_276}; // @[tage.scala 283:39]
  wire [7:0] _T_277 = _T_274 & _GEN_1007; // @[tage.scala 283:39]
  wire [7:0] _T_278 = ~_T_277; // @[tage.scala 283:7]
  wire [7:0] _GEN_1008 = {{2'd0}, _T_258}; // @[tage.scala 282:77]
  wire [7:0] _T_279 = _GEN_1008 & _T_278; // @[tage.scala 282:77]
  wire [5:0] _T_280 = {prng_1_io_out_5,prng_1_io_out_4,prng_1_io_out_3,prng_1_io_out_2,prng_1_io_out_1,prng_1_io_out_0}; // @[PRNG.scala 86:17]
  wire [7:0] _GEN_1009 = {{2'd0}, _T_280}; // @[tage.scala 288:58]
  wire [7:0] _T_296 = _T_279 & _GEN_1009; // @[tage.scala 288:58]
  wire [2:0] _T_305 = _T_296[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_306 = _T_296[5] ? 3'h5 : _T_305; // @[Mux.scala 47:69]
  wire [2:0] _T_307 = _T_296[4] ? 3'h4 : _T_306; // @[Mux.scala 47:69]
  wire [2:0] _T_308 = _T_296[3] ? 3'h3 : _T_307; // @[Mux.scala 47:69]
  wire [2:0] _T_309 = _T_296[2] ? 3'h2 : _T_308; // @[Mux.scala 47:69]
  wire [2:0] _T_310 = _T_296[1] ? 3'h1 : _T_309; // @[Mux.scala 47:69]
  wire [2:0] _T_311 = _T_296[0] ? 3'h0 : _T_310; // @[Mux.scala 47:69]
  wire [7:0] _T_312 = _T_279 >> _T_311; // @[tage.scala 289:44]
  wire [2:0] _T_289 = _T_279[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_290 = _T_279[5] ? 3'h5 : _T_289; // @[Mux.scala 47:69]
  wire [2:0] _T_291 = _T_279[4] ? 3'h4 : _T_290; // @[Mux.scala 47:69]
  wire [2:0] _T_292 = _T_279[3] ? 3'h3 : _T_291; // @[Mux.scala 47:69]
  wire [2:0] _T_293 = _T_279[2] ? 3'h2 : _T_292; // @[Mux.scala 47:69]
  wire [2:0] _T_294 = _T_279[1] ? 3'h1 : _T_293; // @[Mux.scala 47:69]
  wire [2:0] _T_295 = _T_279[0] ? 3'h0 : _T_294; // @[Mux.scala 47:69]
  wire [2:0] f3_meta_allocate_1_bits = _T_312[0] ? _T_311 : _T_295; // @[tage.scala 289:26]
  wire  f3_resps_5_0_valid = tables_5_io_f3_resp_0_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_5_0_bits_u = tables_5_io_f3_resp_0_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_104 = ~f3_resps_5_0_valid & f3_resps_5_0_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_4_0_valid = tables_4_io_f3_resp_0_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_4_0_bits_u = tables_4_io_f3_resp_0_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_101 = ~f3_resps_4_0_valid & f3_resps_4_0_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_3_0_valid = tables_3_io_f3_resp_0_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_3_0_bits_u = tables_3_io_f3_resp_0_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_98 = ~f3_resps_3_0_valid & f3_resps_3_0_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_2_0_valid = tables_2_io_f3_resp_0_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_2_0_bits_u = tables_2_io_f3_resp_0_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_95 = ~f3_resps_2_0_valid & f3_resps_2_0_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_1_0_valid = tables_1_io_f3_resp_0_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_1_0_bits_u = tables_1_io_f3_resp_0_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_92 = ~f3_resps_1_0_valid & f3_resps_1_0_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_0_0_valid = tables_0_io_f3_resp_0_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_0_0_bits_u = tables_0_io_f3_resp_0_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_89 = ~f3_resps_0_0_valid & f3_resps_0_0_bits_u == 2'h0; // @[tage.scala 282:45]
  wire [5:0] _T_105 = {_T_104,_T_101,_T_98,_T_95,_T_92,_T_89}; // @[tage.scala 282:70]
  wire [1:0] _T_56 = f3_resps_2_0_valid ? 2'h2 : {{1'd0}, f3_resps_1_0_valid}; // @[tage.scala 270:21]
  wire [1:0] _T_65 = f3_resps_3_0_valid ? 2'h3 : _T_56; // @[tage.scala 270:21]
  wire [2:0] _T_74 = f3_resps_4_0_valid ? 3'h4 : {{1'd0}, _T_65}; // @[tage.scala 270:21]
  wire [2:0] f3_meta_provider_0_bits = f3_resps_5_0_valid ? 3'h5 : _T_74; // @[tage.scala 270:21]
  wire [7:0] _T_106 = 8'h1 << f3_meta_provider_0_bits; // @[OneHot.scala 58:35]
  wire [7:0] _T_108 = {{1'd0}, _T_106[7:1]}; // @[util.scala 373:29]
  wire [7:0] _T_115 = _T_106 | _T_108; // @[util.scala 373:45]
  wire [7:0] _T_109 = {{2'd0}, _T_106[7:2]}; // @[util.scala 373:29]
  wire [7:0] _T_116 = _T_115 | _T_109; // @[util.scala 373:45]
  wire [7:0] _T_110 = {{3'd0}, _T_106[7:3]}; // @[util.scala 373:29]
  wire [7:0] _T_117 = _T_116 | _T_110; // @[util.scala 373:45]
  wire [7:0] _T_111 = {{4'd0}, _T_106[7:4]}; // @[util.scala 373:29]
  wire [7:0] _T_118 = _T_117 | _T_111; // @[util.scala 373:45]
  wire [7:0] _T_112 = {{5'd0}, _T_106[7:5]}; // @[util.scala 373:29]
  wire [7:0] _T_119 = _T_118 | _T_112; // @[util.scala 373:45]
  wire [7:0] _T_113 = {{6'd0}, _T_106[7:6]}; // @[util.scala 373:29]
  wire [7:0] _T_120 = _T_119 | _T_113; // @[util.scala 373:45]
  wire [7:0] _T_114 = {{7'd0}, _T_106[7]}; // @[util.scala 373:29]
  wire [7:0] _T_121 = _T_120 | _T_114; // @[util.scala 373:45]
  wire  f3_meta_provider_0_valid = f3_resps_0_0_valid | f3_resps_1_0_valid | f3_resps_2_0_valid | f3_resps_3_0_valid |
    f3_resps_4_0_valid | f3_resps_5_0_valid; // @[tage.scala 269:27]
  wire [5:0] _T_123 = f3_meta_provider_0_valid ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _GEN_1017 = {{2'd0}, _T_123}; // @[tage.scala 283:39]
  wire [7:0] _T_124 = _T_121 & _GEN_1017; // @[tage.scala 283:39]
  wire [7:0] _T_125 = ~_T_124; // @[tage.scala 283:7]
  wire [7:0] _GEN_1018 = {{2'd0}, _T_105}; // @[tage.scala 282:77]
  wire [7:0] _T_126 = _GEN_1018 & _T_125; // @[tage.scala 282:77]
  wire  f3_meta_allocate_0_valid = _T_126 != 8'h0; // @[tage.scala 293:52]
  wire [5:0] _T_127 = {prng_io_out_5,prng_io_out_4,prng_io_out_3,prng_io_out_2,prng_io_out_1,prng_io_out_0}; // @[PRNG.scala 86:17]
  wire [7:0] _GEN_1019 = {{2'd0}, _T_127}; // @[tage.scala 288:58]
  wire [7:0] _T_143 = _T_126 & _GEN_1019; // @[tage.scala 288:58]
  wire [2:0] _T_152 = _T_143[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_153 = _T_143[5] ? 3'h5 : _T_152; // @[Mux.scala 47:69]
  wire [2:0] _T_154 = _T_143[4] ? 3'h4 : _T_153; // @[Mux.scala 47:69]
  wire [2:0] _T_155 = _T_143[3] ? 3'h3 : _T_154; // @[Mux.scala 47:69]
  wire [2:0] _T_156 = _T_143[2] ? 3'h2 : _T_155; // @[Mux.scala 47:69]
  wire [2:0] _T_157 = _T_143[1] ? 3'h1 : _T_156; // @[Mux.scala 47:69]
  wire [2:0] _T_158 = _T_143[0] ? 3'h0 : _T_157; // @[Mux.scala 47:69]
  wire [7:0] _T_159 = _T_126 >> _T_158; // @[tage.scala 289:44]
  wire [2:0] _T_136 = _T_126[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_137 = _T_126[5] ? 3'h5 : _T_136; // @[Mux.scala 47:69]
  wire [2:0] _T_138 = _T_126[4] ? 3'h4 : _T_137; // @[Mux.scala 47:69]
  wire [2:0] _T_139 = _T_126[3] ? 3'h3 : _T_138; // @[Mux.scala 47:69]
  wire [2:0] _T_140 = _T_126[2] ? 3'h2 : _T_139; // @[Mux.scala 47:69]
  wire [2:0] _T_141 = _T_126[1] ? 3'h1 : _T_140; // @[Mux.scala 47:69]
  wire [2:0] _T_142 = _T_126[0] ? 3'h0 : _T_141; // @[Mux.scala 47:69]
  wire [2:0] f3_meta_allocate_0_bits = _T_159[0] ? _T_158 : _T_142; // @[tage.scala 289:26]
  wire  f3_resps_5_2_valid = tables_5_io_f3_resp_2_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_5_2_bits_u = tables_5_io_f3_resp_2_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_410 = ~f3_resps_5_2_valid & f3_resps_5_2_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_4_2_valid = tables_4_io_f3_resp_2_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_4_2_bits_u = tables_4_io_f3_resp_2_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_407 = ~f3_resps_4_2_valid & f3_resps_4_2_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_3_2_valid = tables_3_io_f3_resp_2_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_3_2_bits_u = tables_3_io_f3_resp_2_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_404 = ~f3_resps_3_2_valid & f3_resps_3_2_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_2_2_valid = tables_2_io_f3_resp_2_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_2_2_bits_u = tables_2_io_f3_resp_2_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_401 = ~f3_resps_2_2_valid & f3_resps_2_2_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_1_2_valid = tables_1_io_f3_resp_2_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_1_2_bits_u = tables_1_io_f3_resp_2_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_398 = ~f3_resps_1_2_valid & f3_resps_1_2_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_0_2_valid = tables_0_io_f3_resp_2_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_0_2_bits_u = tables_0_io_f3_resp_2_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_395 = ~f3_resps_0_2_valid & f3_resps_0_2_bits_u == 2'h0; // @[tage.scala 282:45]
  wire [5:0] _T_411 = {_T_410,_T_407,_T_404,_T_401,_T_398,_T_395}; // @[tage.scala 282:70]
  wire [1:0] _T_362 = f3_resps_2_2_valid ? 2'h2 : {{1'd0}, f3_resps_1_2_valid}; // @[tage.scala 270:21]
  wire [1:0] _T_371 = f3_resps_3_2_valid ? 2'h3 : _T_362; // @[tage.scala 270:21]
  wire [2:0] _T_380 = f3_resps_4_2_valid ? 3'h4 : {{1'd0}, _T_371}; // @[tage.scala 270:21]
  wire [2:0] f3_meta_provider_2_bits = f3_resps_5_2_valid ? 3'h5 : _T_380; // @[tage.scala 270:21]
  wire [7:0] _T_412 = 8'h1 << f3_meta_provider_2_bits; // @[OneHot.scala 58:35]
  wire [7:0] _T_414 = {{1'd0}, _T_412[7:1]}; // @[util.scala 373:29]
  wire [7:0] _T_421 = _T_412 | _T_414; // @[util.scala 373:45]
  wire [7:0] _T_415 = {{2'd0}, _T_412[7:2]}; // @[util.scala 373:29]
  wire [7:0] _T_422 = _T_421 | _T_415; // @[util.scala 373:45]
  wire [7:0] _T_416 = {{3'd0}, _T_412[7:3]}; // @[util.scala 373:29]
  wire [7:0] _T_423 = _T_422 | _T_416; // @[util.scala 373:45]
  wire [7:0] _T_417 = {{4'd0}, _T_412[7:4]}; // @[util.scala 373:29]
  wire [7:0] _T_424 = _T_423 | _T_417; // @[util.scala 373:45]
  wire [7:0] _T_418 = {{5'd0}, _T_412[7:5]}; // @[util.scala 373:29]
  wire [7:0] _T_425 = _T_424 | _T_418; // @[util.scala 373:45]
  wire [7:0] _T_419 = {{6'd0}, _T_412[7:6]}; // @[util.scala 373:29]
  wire [7:0] _T_426 = _T_425 | _T_419; // @[util.scala 373:45]
  wire [7:0] _T_420 = {{7'd0}, _T_412[7]}; // @[util.scala 373:29]
  wire [7:0] _T_427 = _T_426 | _T_420; // @[util.scala 373:45]
  wire  f3_meta_provider_2_valid = f3_resps_0_2_valid | f3_resps_1_2_valid | f3_resps_2_2_valid | f3_resps_3_2_valid |
    f3_resps_4_2_valid | f3_resps_5_2_valid; // @[tage.scala 269:27]
  wire [5:0] _T_429 = f3_meta_provider_2_valid ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _GEN_1027 = {{2'd0}, _T_429}; // @[tage.scala 283:39]
  wire [7:0] _T_430 = _T_427 & _GEN_1027; // @[tage.scala 283:39]
  wire [7:0] _T_431 = ~_T_430; // @[tage.scala 283:7]
  wire [7:0] _GEN_1028 = {{2'd0}, _T_411}; // @[tage.scala 282:77]
  wire [7:0] _T_432 = _GEN_1028 & _T_431; // @[tage.scala 282:77]
  wire [5:0] _T_433 = {prng_2_io_out_5,prng_2_io_out_4,prng_2_io_out_3,prng_2_io_out_2,prng_2_io_out_1,prng_2_io_out_0}; // @[PRNG.scala 86:17]
  wire [7:0] _GEN_1029 = {{2'd0}, _T_433}; // @[tage.scala 288:58]
  wire [7:0] _T_449 = _T_432 & _GEN_1029; // @[tage.scala 288:58]
  wire [2:0] _T_458 = _T_449[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_459 = _T_449[5] ? 3'h5 : _T_458; // @[Mux.scala 47:69]
  wire [2:0] _T_460 = _T_449[4] ? 3'h4 : _T_459; // @[Mux.scala 47:69]
  wire [2:0] _T_461 = _T_449[3] ? 3'h3 : _T_460; // @[Mux.scala 47:69]
  wire [2:0] _T_462 = _T_449[2] ? 3'h2 : _T_461; // @[Mux.scala 47:69]
  wire [2:0] _T_463 = _T_449[1] ? 3'h1 : _T_462; // @[Mux.scala 47:69]
  wire [2:0] _T_464 = _T_449[0] ? 3'h0 : _T_463; // @[Mux.scala 47:69]
  wire [7:0] _T_465 = _T_432 >> _T_464; // @[tage.scala 289:44]
  wire [2:0] _T_442 = _T_432[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_443 = _T_432[5] ? 3'h5 : _T_442; // @[Mux.scala 47:69]
  wire [2:0] _T_444 = _T_432[4] ? 3'h4 : _T_443; // @[Mux.scala 47:69]
  wire [2:0] _T_445 = _T_432[3] ? 3'h3 : _T_444; // @[Mux.scala 47:69]
  wire [2:0] _T_446 = _T_432[2] ? 3'h2 : _T_445; // @[Mux.scala 47:69]
  wire [2:0] _T_447 = _T_432[1] ? 3'h1 : _T_446; // @[Mux.scala 47:69]
  wire [2:0] _T_448 = _T_432[0] ? 3'h0 : _T_447; // @[Mux.scala 47:69]
  wire [2:0] f3_meta_allocate_2_bits = _T_465[0] ? _T_464 : _T_448; // @[tage.scala 289:26]
  wire  f3_meta_allocate_1_valid = _T_279 != 8'h0; // @[tage.scala 293:52]
  wire  f3_resps_5_3_valid = tables_5_io_f3_resp_3_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_5_3_bits_u = tables_5_io_f3_resp_3_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_563 = ~f3_resps_5_3_valid & f3_resps_5_3_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_4_3_valid = tables_4_io_f3_resp_3_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_4_3_bits_u = tables_4_io_f3_resp_3_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_560 = ~f3_resps_4_3_valid & f3_resps_4_3_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_3_3_valid = tables_3_io_f3_resp_3_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_3_3_bits_u = tables_3_io_f3_resp_3_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_557 = ~f3_resps_3_3_valid & f3_resps_3_3_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_2_3_valid = tables_2_io_f3_resp_3_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_2_3_bits_u = tables_2_io_f3_resp_3_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_554 = ~f3_resps_2_3_valid & f3_resps_2_3_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_1_3_valid = tables_1_io_f3_resp_3_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_1_3_bits_u = tables_1_io_f3_resp_3_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_551 = ~f3_resps_1_3_valid & f3_resps_1_3_bits_u == 2'h0; // @[tage.scala 282:45]
  wire  f3_resps_0_3_valid = tables_0_io_f3_resp_3_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_0_3_bits_u = tables_0_io_f3_resp_3_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_548 = ~f3_resps_0_3_valid & f3_resps_0_3_bits_u == 2'h0; // @[tage.scala 282:45]
  wire [5:0] _T_564 = {_T_563,_T_560,_T_557,_T_554,_T_551,_T_548}; // @[tage.scala 282:70]
  wire [1:0] _T_515 = f3_resps_2_3_valid ? 2'h2 : {{1'd0}, f3_resps_1_3_valid}; // @[tage.scala 270:21]
  wire [1:0] _T_524 = f3_resps_3_3_valid ? 2'h3 : _T_515; // @[tage.scala 270:21]
  wire [2:0] _T_533 = f3_resps_4_3_valid ? 3'h4 : {{1'd0}, _T_524}; // @[tage.scala 270:21]
  wire [2:0] f3_meta_provider_3_bits = f3_resps_5_3_valid ? 3'h5 : _T_533; // @[tage.scala 270:21]
  wire [7:0] _T_565 = 8'h1 << f3_meta_provider_3_bits; // @[OneHot.scala 58:35]
  wire [7:0] _T_567 = {{1'd0}, _T_565[7:1]}; // @[util.scala 373:29]
  wire [7:0] _T_574 = _T_565 | _T_567; // @[util.scala 373:45]
  wire [7:0] _T_568 = {{2'd0}, _T_565[7:2]}; // @[util.scala 373:29]
  wire [7:0] _T_575 = _T_574 | _T_568; // @[util.scala 373:45]
  wire [7:0] _T_569 = {{3'd0}, _T_565[7:3]}; // @[util.scala 373:29]
  wire [7:0] _T_576 = _T_575 | _T_569; // @[util.scala 373:45]
  wire [7:0] _T_570 = {{4'd0}, _T_565[7:4]}; // @[util.scala 373:29]
  wire [7:0] _T_577 = _T_576 | _T_570; // @[util.scala 373:45]
  wire [7:0] _T_571 = {{5'd0}, _T_565[7:5]}; // @[util.scala 373:29]
  wire [7:0] _T_578 = _T_577 | _T_571; // @[util.scala 373:45]
  wire [7:0] _T_572 = {{6'd0}, _T_565[7:6]}; // @[util.scala 373:29]
  wire [7:0] _T_579 = _T_578 | _T_572; // @[util.scala 373:45]
  wire [7:0] _T_573 = {{7'd0}, _T_565[7]}; // @[util.scala 373:29]
  wire [7:0] _T_580 = _T_579 | _T_573; // @[util.scala 373:45]
  wire  f3_meta_provider_3_valid = f3_resps_0_3_valid | f3_resps_1_3_valid | f3_resps_2_3_valid | f3_resps_3_3_valid |
    f3_resps_4_3_valid | f3_resps_5_3_valid; // @[tage.scala 269:27]
  wire [5:0] _T_582 = f3_meta_provider_3_valid ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _GEN_1037 = {{2'd0}, _T_582}; // @[tage.scala 283:39]
  wire [7:0] _T_583 = _T_580 & _GEN_1037; // @[tage.scala 283:39]
  wire [7:0] _T_584 = ~_T_583; // @[tage.scala 283:7]
  wire [7:0] _GEN_1038 = {{2'd0}, _T_564}; // @[tage.scala 282:77]
  wire [7:0] _T_585 = _GEN_1038 & _T_584; // @[tage.scala 282:77]
  wire [5:0] _T_586 = {prng_3_io_out_5,prng_3_io_out_4,prng_3_io_out_3,prng_3_io_out_2,prng_3_io_out_1,prng_3_io_out_0}; // @[PRNG.scala 86:17]
  wire [7:0] _GEN_1039 = {{2'd0}, _T_586}; // @[tage.scala 288:58]
  wire [7:0] _T_602 = _T_585 & _GEN_1039; // @[tage.scala 288:58]
  wire [2:0] _T_611 = _T_602[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_612 = _T_602[5] ? 3'h5 : _T_611; // @[Mux.scala 47:69]
  wire [2:0] _T_613 = _T_602[4] ? 3'h4 : _T_612; // @[Mux.scala 47:69]
  wire [2:0] _T_614 = _T_602[3] ? 3'h3 : _T_613; // @[Mux.scala 47:69]
  wire [2:0] _T_615 = _T_602[2] ? 3'h2 : _T_614; // @[Mux.scala 47:69]
  wire [2:0] _T_616 = _T_602[1] ? 3'h1 : _T_615; // @[Mux.scala 47:69]
  wire [2:0] _T_617 = _T_602[0] ? 3'h0 : _T_616; // @[Mux.scala 47:69]
  wire [7:0] _T_618 = _T_585 >> _T_617; // @[tage.scala 289:44]
  wire [2:0] _T_595 = _T_585[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_596 = _T_585[5] ? 3'h5 : _T_595; // @[Mux.scala 47:69]
  wire [2:0] _T_597 = _T_585[4] ? 3'h4 : _T_596; // @[Mux.scala 47:69]
  wire [2:0] _T_598 = _T_585[3] ? 3'h3 : _T_597; // @[Mux.scala 47:69]
  wire [2:0] _T_599 = _T_585[2] ? 3'h2 : _T_598; // @[Mux.scala 47:69]
  wire [2:0] _T_600 = _T_585[1] ? 3'h1 : _T_599; // @[Mux.scala 47:69]
  wire [2:0] _T_601 = _T_585[0] ? 3'h0 : _T_600; // @[Mux.scala 47:69]
  wire [2:0] f3_meta_allocate_3_bits = _T_618[0] ? _T_617 : _T_601; // @[tage.scala 289:26]
  wire  f3_meta_allocate_2_valid = _T_432 != 8'h0; // @[tage.scala 293:52]
  wire [14:0] lo_lo = {f3_meta_allocate_3_bits,f3_meta_allocate_2_valid,f3_meta_allocate_2_bits,f3_meta_allocate_1_valid
    ,f3_meta_allocate_1_bits,f3_meta_allocate_0_valid,f3_meta_allocate_0_bits}; // @[tage.scala 213:33]
  wire [2:0] f3_resps_5_1_bits_ctr = tables_5_io_f3_resp_1_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_4_1_bits_ctr = tables_4_io_f3_resp_1_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_3_1_bits_ctr = tables_3_io_f3_resp_1_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_2_1_bits_ctr = tables_2_io_f3_resp_1_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_1_1_bits_ctr = tables_1_io_f3_resp_1_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_0_1_bits_ctr = tables_0_io_f3_resp_1_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] _GEN_151 = 3'h1 == f3_meta_provider_1_bits ? f3_resps_1_1_bits_ctr : f3_resps_0_1_bits_ctr; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_152 = 3'h2 == f3_meta_provider_1_bits ? f3_resps_2_1_bits_ctr : _GEN_151; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_153 = 3'h3 == f3_meta_provider_1_bits ? f3_resps_3_1_bits_ctr : _GEN_152; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_154 = 3'h4 == f3_meta_provider_1_bits ? f3_resps_4_1_bits_ctr : _GEN_153; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] f3_meta_provider_ctr_1 = 3'h5 == f3_meta_provider_1_bits ? f3_resps_5_1_bits_ctr : _GEN_154; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] f3_resps_5_0_bits_ctr = tables_5_io_f3_resp_0_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_4_0_bits_ctr = tables_4_io_f3_resp_0_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_3_0_bits_ctr = tables_3_io_f3_resp_0_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_2_0_bits_ctr = tables_2_io_f3_resp_0_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_1_0_bits_ctr = tables_1_io_f3_resp_0_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_0_0_bits_ctr = tables_0_io_f3_resp_0_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] _GEN_19 = 3'h1 == f3_meta_provider_0_bits ? f3_resps_1_0_bits_ctr : f3_resps_0_0_bits_ctr; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_20 = 3'h2 == f3_meta_provider_0_bits ? f3_resps_2_0_bits_ctr : _GEN_19; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_21 = 3'h3 == f3_meta_provider_0_bits ? f3_resps_3_0_bits_ctr : _GEN_20; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_22 = 3'h4 == f3_meta_provider_0_bits ? f3_resps_4_0_bits_ctr : _GEN_21; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] f3_meta_provider_ctr_0 = 3'h5 == f3_meta_provider_0_bits ? f3_resps_5_0_bits_ctr : _GEN_22; // @[tage.scala 277:31 tage.scala 277:31]
  wire  f3_meta_allocate_3_valid = _T_585 != 8'h0; // @[tage.scala 293:52]
  wire [2:0] f3_resps_5_3_bits_ctr = tables_5_io_f3_resp_3_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_4_3_bits_ctr = tables_4_io_f3_resp_3_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_3_3_bits_ctr = tables_3_io_f3_resp_3_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_2_3_bits_ctr = tables_2_io_f3_resp_3_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_1_3_bits_ctr = tables_1_io_f3_resp_3_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_0_3_bits_ctr = tables_0_io_f3_resp_3_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] _GEN_415 = 3'h1 == f3_meta_provider_3_bits ? f3_resps_1_3_bits_ctr : f3_resps_0_3_bits_ctr; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_416 = 3'h2 == f3_meta_provider_3_bits ? f3_resps_2_3_bits_ctr : _GEN_415; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_417 = 3'h3 == f3_meta_provider_3_bits ? f3_resps_3_3_bits_ctr : _GEN_416; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_418 = 3'h4 == f3_meta_provider_3_bits ? f3_resps_4_3_bits_ctr : _GEN_417; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] f3_meta_provider_ctr_3 = 3'h5 == f3_meta_provider_3_bits ? f3_resps_5_3_bits_ctr : _GEN_418; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] f3_resps_5_2_bits_ctr = tables_5_io_f3_resp_2_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_4_2_bits_ctr = tables_4_io_f3_resp_2_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_3_2_bits_ctr = tables_3_io_f3_resp_2_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_2_2_bits_ctr = tables_2_io_f3_resp_2_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_1_2_bits_ctr = tables_1_io_f3_resp_2_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_0_2_bits_ctr = tables_0_io_f3_resp_2_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] _GEN_283 = 3'h1 == f3_meta_provider_2_bits ? f3_resps_1_2_bits_ctr : f3_resps_0_2_bits_ctr; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_284 = 3'h2 == f3_meta_provider_2_bits ? f3_resps_2_2_bits_ctr : _GEN_283; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_285 = 3'h3 == f3_meta_provider_2_bits ? f3_resps_3_2_bits_ctr : _GEN_284; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] _GEN_286 = 3'h4 == f3_meta_provider_2_bits ? f3_resps_4_2_bits_ctr : _GEN_285; // @[tage.scala 277:31 tage.scala 277:31]
  wire [2:0] f3_meta_provider_ctr_2 = 3'h5 == f3_meta_provider_2_bits ? f3_resps_5_2_bits_ctr : _GEN_286; // @[tage.scala 277:31 tage.scala 277:31]
  wire [1:0] _GEN_145 = 3'h1 == f3_meta_provider_1_bits ? f3_resps_1_1_bits_u : f3_resps_0_1_bits_u; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_146 = 3'h2 == f3_meta_provider_1_bits ? f3_resps_2_1_bits_u : _GEN_145; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_147 = 3'h3 == f3_meta_provider_1_bits ? f3_resps_3_1_bits_u : _GEN_146; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_148 = 3'h4 == f3_meta_provider_1_bits ? f3_resps_4_1_bits_u : _GEN_147; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] f3_meta_provider_u_1 = 3'h5 == f3_meta_provider_1_bits ? f3_resps_5_1_bits_u : _GEN_148; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_13 = 3'h1 == f3_meta_provider_0_bits ? f3_resps_1_0_bits_u : f3_resps_0_0_bits_u; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_14 = 3'h2 == f3_meta_provider_0_bits ? f3_resps_2_0_bits_u : _GEN_13; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_15 = 3'h3 == f3_meta_provider_0_bits ? f3_resps_3_0_bits_u : _GEN_14; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_16 = 3'h4 == f3_meta_provider_0_bits ? f3_resps_4_0_bits_u : _GEN_15; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] f3_meta_provider_u_0 = 3'h5 == f3_meta_provider_0_bits ? f3_resps_5_0_bits_u : _GEN_16; // @[tage.scala 276:31 tage.scala 276:31]
  wire [31:0] lo = {f3_meta_provider_u_1,f3_meta_provider_u_0,f3_meta_provider_ctr_3,f3_meta_provider_ctr_2,
    f3_meta_provider_ctr_1,f3_meta_provider_ctr_0,f3_meta_allocate_3_valid,lo_lo}; // @[tage.scala 213:33]
  wire  _T_40 = f3_resps_0_0_valid ? f3_resps_0_0_bits_ctr[2] : io_resp_in_0_f3_0_taken; // @[tage.scala 271:21]
  wire  _T_49 = f3_resps_1_0_valid ? f3_resps_1_0_bits_ctr[2] : _T_40; // @[tage.scala 271:21]
  wire  _T_58 = f3_resps_2_0_valid ? f3_resps_2_0_bits_ctr[2] : _T_49; // @[tage.scala 271:21]
  wire  _T_67 = f3_resps_3_0_valid ? f3_resps_3_0_bits_ctr[2] : _T_58; // @[tage.scala 271:21]
  wire  _T_76 = f3_resps_4_0_valid ? f3_resps_4_0_bits_ctr[2] : _T_67; // @[tage.scala 271:21]
  wire  _GEN_3 = f3_resps_1_0_valid ? _T_40 : io_resp_in_0_f3_0_taken; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_5 = f3_resps_2_0_valid ? _T_49 : _GEN_3; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_7 = f3_resps_3_0_valid ? _T_58 : _GEN_5; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_9 = f3_resps_4_0_valid ? _T_67 : _GEN_7; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_11 = f3_resps_5_0_valid ? _T_76 : _GEN_9; // @[tage.scala 264:18 tage.scala 266:29]
  wire  f3_meta_alt_differs_0 = _GEN_11 != io_resp_f3_0_taken; // @[tage.scala 275:48]
  wire [1:0] _GEN_409 = 3'h1 == f3_meta_provider_3_bits ? f3_resps_1_3_bits_u : f3_resps_0_3_bits_u; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_410 = 3'h2 == f3_meta_provider_3_bits ? f3_resps_2_3_bits_u : _GEN_409; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_411 = 3'h3 == f3_meta_provider_3_bits ? f3_resps_3_3_bits_u : _GEN_410; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_412 = 3'h4 == f3_meta_provider_3_bits ? f3_resps_4_3_bits_u : _GEN_411; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] f3_meta_provider_u_3 = 3'h5 == f3_meta_provider_3_bits ? f3_resps_5_3_bits_u : _GEN_412; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_277 = 3'h1 == f3_meta_provider_2_bits ? f3_resps_1_2_bits_u : f3_resps_0_2_bits_u; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_278 = 3'h2 == f3_meta_provider_2_bits ? f3_resps_2_2_bits_u : _GEN_277; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_279 = 3'h3 == f3_meta_provider_2_bits ? f3_resps_3_2_bits_u : _GEN_278; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] _GEN_280 = 3'h4 == f3_meta_provider_2_bits ? f3_resps_4_2_bits_u : _GEN_279; // @[tage.scala 276:31 tage.scala 276:31]
  wire [1:0] f3_meta_provider_u_2 = 3'h5 == f3_meta_provider_2_bits ? f3_resps_5_2_bits_u : _GEN_280; // @[tage.scala 276:31 tage.scala 276:31]
  wire  _T_346 = f3_resps_0_2_valid ? f3_resps_0_2_bits_ctr[2] : io_resp_in_0_f3_2_taken; // @[tage.scala 271:21]
  wire  _T_355 = f3_resps_1_2_valid ? f3_resps_1_2_bits_ctr[2] : _T_346; // @[tage.scala 271:21]
  wire  _T_364 = f3_resps_2_2_valid ? f3_resps_2_2_bits_ctr[2] : _T_355; // @[tage.scala 271:21]
  wire  _T_373 = f3_resps_3_2_valid ? f3_resps_3_2_bits_ctr[2] : _T_364; // @[tage.scala 271:21]
  wire  _T_382 = f3_resps_4_2_valid ? f3_resps_4_2_bits_ctr[2] : _T_373; // @[tage.scala 271:21]
  wire  _GEN_267 = f3_resps_1_2_valid ? _T_346 : io_resp_in_0_f3_2_taken; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_269 = f3_resps_2_2_valid ? _T_355 : _GEN_267; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_271 = f3_resps_3_2_valid ? _T_364 : _GEN_269; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_273 = f3_resps_4_2_valid ? _T_373 : _GEN_271; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_275 = f3_resps_5_2_valid ? _T_382 : _GEN_273; // @[tage.scala 264:18 tage.scala 266:29]
  wire  f3_meta_alt_differs_2 = _GEN_275 != io_resp_f3_2_taken; // @[tage.scala 275:48]
  wire  _T_193 = f3_resps_0_1_valid ? f3_resps_0_1_bits_ctr[2] : io_resp_in_0_f3_1_taken; // @[tage.scala 271:21]
  wire  _T_202 = f3_resps_1_1_valid ? f3_resps_1_1_bits_ctr[2] : _T_193; // @[tage.scala 271:21]
  wire  _T_211 = f3_resps_2_1_valid ? f3_resps_2_1_bits_ctr[2] : _T_202; // @[tage.scala 271:21]
  wire  _T_220 = f3_resps_3_1_valid ? f3_resps_3_1_bits_ctr[2] : _T_211; // @[tage.scala 271:21]
  wire  _T_229 = f3_resps_4_1_valid ? f3_resps_4_1_bits_ctr[2] : _T_220; // @[tage.scala 271:21]
  wire  _GEN_135 = f3_resps_1_1_valid ? _T_193 : io_resp_in_0_f3_1_taken; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_137 = f3_resps_2_1_valid ? _T_202 : _GEN_135; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_139 = f3_resps_3_1_valid ? _T_211 : _GEN_137; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_141 = f3_resps_4_1_valid ? _T_220 : _GEN_139; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_143 = f3_resps_5_1_valid ? _T_229 : _GEN_141; // @[tage.scala 264:18 tage.scala 266:29]
  wire  f3_meta_alt_differs_1 = _GEN_143 != io_resp_f3_1_taken; // @[tage.scala 275:48]
  wire  _T_499 = f3_resps_0_3_valid ? f3_resps_0_3_bits_ctr[2] : io_resp_in_0_f3_3_taken; // @[tage.scala 271:21]
  wire  _T_508 = f3_resps_1_3_valid ? f3_resps_1_3_bits_ctr[2] : _T_499; // @[tage.scala 271:21]
  wire  _T_517 = f3_resps_2_3_valid ? f3_resps_2_3_bits_ctr[2] : _T_508; // @[tage.scala 271:21]
  wire  _T_526 = f3_resps_3_3_valid ? f3_resps_3_3_bits_ctr[2] : _T_517; // @[tage.scala 271:21]
  wire  _T_535 = f3_resps_4_3_valid ? f3_resps_4_3_bits_ctr[2] : _T_526; // @[tage.scala 271:21]
  wire  _GEN_399 = f3_resps_1_3_valid ? _T_499 : io_resp_in_0_f3_3_taken; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_401 = f3_resps_2_3_valid ? _T_508 : _GEN_399; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_403 = f3_resps_3_3_valid ? _T_517 : _GEN_401; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_405 = f3_resps_4_3_valid ? _T_526 : _GEN_403; // @[tage.scala 264:18 tage.scala 266:29]
  wire  _GEN_407 = f3_resps_5_3_valid ? _T_535 : _GEN_405; // @[tage.scala 264:18 tage.scala 266:29]
  wire  f3_meta_alt_differs_3 = _GEN_407 != io_resp_f3_3_taken; // @[tage.scala 275:48]
  wire [10:0] hi_lo = {f3_meta_provider_0_bits,f3_meta_alt_differs_3,f3_meta_alt_differs_2,f3_meta_alt_differs_1,
    f3_meta_alt_differs_0,f3_meta_provider_u_3,f3_meta_provider_u_2}; // @[tage.scala 213:33]
  wire [55:0] _T = {f3_meta_provider_3_valid,f3_meta_provider_3_bits,f3_meta_provider_2_valid,f3_meta_provider_2_bits,
    f3_meta_provider_1_valid,f3_meta_provider_1_bits,f3_meta_provider_0_valid,hi_lo,lo}; // @[tage.scala 213:33]
  reg  REG; // @[tage.scala 225:35]
  reg [39:0] REG_1; // @[tage.scala 226:35]
  reg  REG_2; // @[tage.scala 225:35]
  reg [39:0] REG_3; // @[tage.scala 226:35]
  reg  REG_4; // @[tage.scala 225:35]
  reg [39:0] REG_5; // @[tage.scala 226:35]
  reg  REG_6; // @[tage.scala 225:35]
  reg [39:0] REG_7; // @[tage.scala 226:35]
  reg  REG_8; // @[tage.scala 225:35]
  reg [39:0] REG_9; // @[tage.scala 226:35]
  reg  REG_10; // @[tage.scala 225:35]
  reg [39:0] REG_11; // @[tage.scala 226:35]
  wire [2:0] s1_update_meta_allocate_0_bits = s1_update__bits_meta[2:0]; // @[tage.scala 236:52]
  wire  s1_update_meta_allocate_0_valid = s1_update__bits_meta[3]; // @[tage.scala 236:52]
  wire [2:0] s1_update_meta_allocate_1_bits = s1_update__bits_meta[6:4]; // @[tage.scala 236:52]
  wire  s1_update_meta_allocate_1_valid = s1_update__bits_meta[7]; // @[tage.scala 236:52]
  wire [2:0] s1_update_meta_allocate_2_bits = s1_update__bits_meta[10:8]; // @[tage.scala 236:52]
  wire  s1_update_meta_allocate_2_valid = s1_update__bits_meta[11]; // @[tage.scala 236:52]
  wire [2:0] s1_update_meta_allocate_3_bits = s1_update__bits_meta[14:12]; // @[tage.scala 236:52]
  wire  s1_update_meta_allocate_3_valid = s1_update__bits_meta[15]; // @[tage.scala 236:52]
  wire [1:0] s1_update_meta_provider_u_0 = s1_update__bits_meta[29:28]; // @[tage.scala 236:52]
  wire [1:0] s1_update_meta_provider_u_1 = s1_update__bits_meta[31:30]; // @[tage.scala 236:52]
  wire [1:0] s1_update_meta_provider_u_2 = s1_update__bits_meta[33:32]; // @[tage.scala 236:52]
  wire [1:0] s1_update_meta_provider_u_3 = s1_update__bits_meta[35:34]; // @[tage.scala 236:52]
  wire  s1_update_meta_alt_differs_0 = s1_update__bits_meta[36]; // @[tage.scala 236:52]
  wire  s1_update_meta_alt_differs_1 = s1_update__bits_meta[37]; // @[tage.scala 236:52]
  wire  s1_update_meta_alt_differs_2 = s1_update__bits_meta[38]; // @[tage.scala 236:52]
  wire  s1_update_meta_alt_differs_3 = s1_update__bits_meta[39]; // @[tage.scala 236:52]
  wire [2:0] s1_update_meta_provider_0_bits = s1_update__bits_meta[42:40]; // @[tage.scala 236:52]
  wire  s1_update_meta_provider_0_valid = s1_update__bits_meta[43]; // @[tage.scala 236:52]
  wire [2:0] s1_update_meta_provider_1_bits = s1_update__bits_meta[46:44]; // @[tage.scala 236:52]
  wire  s1_update_meta_provider_1_valid = s1_update__bits_meta[47]; // @[tage.scala 236:52]
  wire [2:0] s1_update_meta_provider_2_bits = s1_update__bits_meta[50:48]; // @[tage.scala 236:52]
  wire  s1_update_meta_provider_2_valid = s1_update__bits_meta[51]; // @[tage.scala 236:52]
  wire [2:0] s1_update_meta_provider_3_bits = s1_update__bits_meta[54:52]; // @[tage.scala 236:52]
  wire  s1_update_meta_provider_3_valid = s1_update__bits_meta[55]; // @[tage.scala 236:52]
  wire [3:0] _T_29 = 4'h1 << s1_update__bits_cfi_idx_bits; // @[OneHot.scala 58:35]
  wire [3:0] _T_31 = s1_update__bits_cfi_mispredicted ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] s1_update_mispredict_mask = _T_29 & _T_31; // @[tage.scala 237:73]
  wire  _T_36 = f3_resps_0_0_bits_ctr == 3'h3 | f3_resps_0_0_bits_ctr == 3'h4 ? io_resp_in_0_f3_0_taken :
    f3_resps_0_0_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_0 = f3_resps_0_0_valid ? _T_36 : io_resp_in_0_f3_0_taken; // @[tage.scala 264:18 tage.scala 265:29 tage.scala 259:25]
  wire  _T_45 = f3_resps_1_0_bits_ctr == 3'h3 | f3_resps_1_0_bits_ctr == 3'h4 ? _T_40 : f3_resps_1_0_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_2 = f3_resps_1_0_valid ? _T_45 : _GEN_0; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_54 = f3_resps_2_0_bits_ctr == 3'h3 | f3_resps_2_0_bits_ctr == 3'h4 ? _T_49 : f3_resps_2_0_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_4 = f3_resps_2_0_valid ? _T_54 : _GEN_2; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_63 = f3_resps_3_0_bits_ctr == 3'h3 | f3_resps_3_0_bits_ctr == 3'h4 ? _T_58 : f3_resps_3_0_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_6 = f3_resps_3_0_valid ? _T_63 : _GEN_4; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_72 = f3_resps_4_0_bits_ctr == 3'h3 | f3_resps_4_0_bits_ctr == 3'h4 ? _T_67 : f3_resps_4_0_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_8 = f3_resps_4_0_valid ? _T_72 : _GEN_6; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_81 = f3_resps_5_0_bits_ctr == 3'h3 | f3_resps_5_0_bits_ctr == 3'h4 ? _T_76 : f3_resps_5_0_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _T_163 = s1_update__bits_cfi_idx_bits == 2'h0; // @[tage.scala 297:58]
  wire  _T_164 = s1_update__bits_cfi_idx_valid & _T_163; // @[tage.scala 296:58]
  wire  _T_165 = _T_164 & s1_update__bits_cfi_taken; // @[tage.scala 297:67]
  wire  _T_169 = s1_update__bits_btb_mispredicts != 4'h0; // @[predictor.scala 94:50]
  wire  _T_171 = ~(s1_update__bits_is_mispredict_update | s1_update__bits_is_repair_update | _T_169); // @[predictor.scala 96:26]
  wire  _GEN_24 = 3'h0 == s1_update_meta_provider_0_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_25 = 3'h1 == s1_update_meta_provider_0_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_26 = 3'h2 == s1_update_meta_provider_0_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_27 = 3'h3 == s1_update_meta_provider_0_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_28 = 3'h4 == s1_update_meta_provider_0_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_29 = 3'h5 == s1_update_meta_provider_0_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire [1:0] _T_177 = s1_update_meta_provider_u_0 - 2'h1; // @[tage.scala 218:43]
  wire [1:0] _T_178 = s1_update_meta_provider_u_0 == 2'h0 ? 2'h0 : _T_177; // @[tage.scala 218:24]
  wire [1:0] _T_181 = s1_update_meta_provider_u_0 + 2'h1; // @[tage.scala 219:43]
  wire [1:0] _T_182 = s1_update_meta_provider_u_0 == 2'h3 ? 2'h3 : _T_181; // @[tage.scala 219:24]
  wire [1:0] _T_183 = s1_update_mispredict_mask[0] ? _T_178 : _T_182; // @[tage.scala 218:8]
  wire [1:0] _T_184 = ~s1_update_meta_alt_differs_0 ? s1_update_meta_provider_u_0 : _T_183; // @[tage.scala 217:8]
  wire  _GEN_60 = s1_update_meta_provider_0_valid & _GEN_24; // @[tage.scala 300:47]
  wire  _GEN_61 = s1_update_meta_provider_0_valid & _GEN_25; // @[tage.scala 300:47]
  wire  _GEN_62 = s1_update_meta_provider_0_valid & _GEN_26; // @[tage.scala 300:47]
  wire  _GEN_63 = s1_update_meta_provider_0_valid & _GEN_27; // @[tage.scala 300:47]
  wire  _GEN_64 = s1_update_meta_provider_0_valid & _GEN_28; // @[tage.scala 300:47]
  wire  _GEN_65 = s1_update_meta_provider_0_valid & _GEN_29; // @[tage.scala 300:47]
  wire  _GEN_96 = s1_update__bits_br_mask[0] & s1_update__valid & _T_171 & _GEN_60; // @[tage.scala 299:92]
  wire  _GEN_97 = s1_update__bits_br_mask[0] & s1_update__valid & _T_171 & _GEN_61; // @[tage.scala 299:92]
  wire  _GEN_98 = s1_update__bits_br_mask[0] & s1_update__valid & _T_171 & _GEN_62; // @[tage.scala 299:92]
  wire  _GEN_99 = s1_update__bits_br_mask[0] & s1_update__valid & _T_171 & _GEN_63; // @[tage.scala 299:92]
  wire  _GEN_100 = s1_update__bits_br_mask[0] & s1_update__valid & _T_171 & _GEN_64; // @[tage.scala 299:92]
  wire  _GEN_101 = s1_update__bits_br_mask[0] & s1_update__valid & _T_171 & _GEN_65; // @[tage.scala 299:92]
  wire  _T_189 = f3_resps_0_1_bits_ctr == 3'h3 | f3_resps_0_1_bits_ctr == 3'h4 ? io_resp_in_0_f3_1_taken :
    f3_resps_0_1_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_132 = f3_resps_0_1_valid ? _T_189 : io_resp_in_0_f3_1_taken; // @[tage.scala 264:18 tage.scala 265:29 tage.scala 259:25]
  wire  _T_198 = f3_resps_1_1_bits_ctr == 3'h3 | f3_resps_1_1_bits_ctr == 3'h4 ? _T_193 : f3_resps_1_1_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_134 = f3_resps_1_1_valid ? _T_198 : _GEN_132; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_207 = f3_resps_2_1_bits_ctr == 3'h3 | f3_resps_2_1_bits_ctr == 3'h4 ? _T_202 : f3_resps_2_1_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_136 = f3_resps_2_1_valid ? _T_207 : _GEN_134; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_216 = f3_resps_3_1_bits_ctr == 3'h3 | f3_resps_3_1_bits_ctr == 3'h4 ? _T_211 : f3_resps_3_1_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_138 = f3_resps_3_1_valid ? _T_216 : _GEN_136; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_225 = f3_resps_4_1_bits_ctr == 3'h3 | f3_resps_4_1_bits_ctr == 3'h4 ? _T_220 : f3_resps_4_1_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_140 = f3_resps_4_1_valid ? _T_225 : _GEN_138; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_234 = f3_resps_5_1_bits_ctr == 3'h3 | f3_resps_5_1_bits_ctr == 3'h4 ? _T_229 : f3_resps_5_1_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _T_316 = s1_update__bits_cfi_idx_bits == 2'h1; // @[tage.scala 297:58]
  wire  _T_317 = s1_update__bits_cfi_idx_valid & _T_316; // @[tage.scala 296:58]
  wire  _T_318 = _T_317 & s1_update__bits_cfi_taken; // @[tage.scala 297:67]
  wire  _GEN_156 = 3'h0 == s1_update_meta_provider_1_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_157 = 3'h1 == s1_update_meta_provider_1_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_158 = 3'h2 == s1_update_meta_provider_1_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_159 = 3'h3 == s1_update_meta_provider_1_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_160 = 3'h4 == s1_update_meta_provider_1_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_161 = 3'h5 == s1_update_meta_provider_1_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire [1:0] _T_330 = s1_update_meta_provider_u_1 - 2'h1; // @[tage.scala 218:43]
  wire [1:0] _T_331 = s1_update_meta_provider_u_1 == 2'h0 ? 2'h0 : _T_330; // @[tage.scala 218:24]
  wire [1:0] _T_334 = s1_update_meta_provider_u_1 + 2'h1; // @[tage.scala 219:43]
  wire [1:0] _T_335 = s1_update_meta_provider_u_1 == 2'h3 ? 2'h3 : _T_334; // @[tage.scala 219:24]
  wire [1:0] _T_336 = s1_update_mispredict_mask[1] ? _T_331 : _T_335; // @[tage.scala 218:8]
  wire [1:0] _T_337 = ~s1_update_meta_alt_differs_1 ? s1_update_meta_provider_u_1 : _T_336; // @[tage.scala 217:8]
  wire  _GEN_192 = s1_update_meta_provider_1_valid & _GEN_156; // @[tage.scala 300:47]
  wire  _GEN_193 = s1_update_meta_provider_1_valid & _GEN_157; // @[tage.scala 300:47]
  wire  _GEN_194 = s1_update_meta_provider_1_valid & _GEN_158; // @[tage.scala 300:47]
  wire  _GEN_195 = s1_update_meta_provider_1_valid & _GEN_159; // @[tage.scala 300:47]
  wire  _GEN_196 = s1_update_meta_provider_1_valid & _GEN_160; // @[tage.scala 300:47]
  wire  _GEN_197 = s1_update_meta_provider_1_valid & _GEN_161; // @[tage.scala 300:47]
  wire  _GEN_228 = s1_update__bits_br_mask[1] & s1_update__valid & _T_171 & _GEN_192; // @[tage.scala 299:92]
  wire  _GEN_229 = s1_update__bits_br_mask[1] & s1_update__valid & _T_171 & _GEN_193; // @[tage.scala 299:92]
  wire  _GEN_230 = s1_update__bits_br_mask[1] & s1_update__valid & _T_171 & _GEN_194; // @[tage.scala 299:92]
  wire  _GEN_231 = s1_update__bits_br_mask[1] & s1_update__valid & _T_171 & _GEN_195; // @[tage.scala 299:92]
  wire  _GEN_232 = s1_update__bits_br_mask[1] & s1_update__valid & _T_171 & _GEN_196; // @[tage.scala 299:92]
  wire  _GEN_233 = s1_update__bits_br_mask[1] & s1_update__valid & _T_171 & _GEN_197; // @[tage.scala 299:92]
  wire  _T_342 = f3_resps_0_2_bits_ctr == 3'h3 | f3_resps_0_2_bits_ctr == 3'h4 ? io_resp_in_0_f3_2_taken :
    f3_resps_0_2_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_264 = f3_resps_0_2_valid ? _T_342 : io_resp_in_0_f3_2_taken; // @[tage.scala 264:18 tage.scala 265:29 tage.scala 259:25]
  wire  _T_351 = f3_resps_1_2_bits_ctr == 3'h3 | f3_resps_1_2_bits_ctr == 3'h4 ? _T_346 : f3_resps_1_2_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_266 = f3_resps_1_2_valid ? _T_351 : _GEN_264; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_360 = f3_resps_2_2_bits_ctr == 3'h3 | f3_resps_2_2_bits_ctr == 3'h4 ? _T_355 : f3_resps_2_2_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_268 = f3_resps_2_2_valid ? _T_360 : _GEN_266; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_369 = f3_resps_3_2_bits_ctr == 3'h3 | f3_resps_3_2_bits_ctr == 3'h4 ? _T_364 : f3_resps_3_2_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_270 = f3_resps_3_2_valid ? _T_369 : _GEN_268; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_378 = f3_resps_4_2_bits_ctr == 3'h3 | f3_resps_4_2_bits_ctr == 3'h4 ? _T_373 : f3_resps_4_2_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_272 = f3_resps_4_2_valid ? _T_378 : _GEN_270; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_387 = f3_resps_5_2_bits_ctr == 3'h3 | f3_resps_5_2_bits_ctr == 3'h4 ? _T_382 : f3_resps_5_2_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _T_469 = s1_update__bits_cfi_idx_bits == 2'h2; // @[tage.scala 297:58]
  wire  _T_470 = s1_update__bits_cfi_idx_valid & _T_469; // @[tage.scala 296:58]
  wire  _T_471 = _T_470 & s1_update__bits_cfi_taken; // @[tage.scala 297:67]
  wire  _GEN_288 = 3'h0 == s1_update_meta_provider_2_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_289 = 3'h1 == s1_update_meta_provider_2_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_290 = 3'h2 == s1_update_meta_provider_2_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_291 = 3'h3 == s1_update_meta_provider_2_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_292 = 3'h4 == s1_update_meta_provider_2_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_293 = 3'h5 == s1_update_meta_provider_2_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire [1:0] _T_483 = s1_update_meta_provider_u_2 - 2'h1; // @[tage.scala 218:43]
  wire [1:0] _T_484 = s1_update_meta_provider_u_2 == 2'h0 ? 2'h0 : _T_483; // @[tage.scala 218:24]
  wire [1:0] _T_487 = s1_update_meta_provider_u_2 + 2'h1; // @[tage.scala 219:43]
  wire [1:0] _T_488 = s1_update_meta_provider_u_2 == 2'h3 ? 2'h3 : _T_487; // @[tage.scala 219:24]
  wire [1:0] _T_489 = s1_update_mispredict_mask[2] ? _T_484 : _T_488; // @[tage.scala 218:8]
  wire [1:0] _T_490 = ~s1_update_meta_alt_differs_2 ? s1_update_meta_provider_u_2 : _T_489; // @[tage.scala 217:8]
  wire  _GEN_324 = s1_update_meta_provider_2_valid & _GEN_288; // @[tage.scala 300:47]
  wire  _GEN_325 = s1_update_meta_provider_2_valid & _GEN_289; // @[tage.scala 300:47]
  wire  _GEN_326 = s1_update_meta_provider_2_valid & _GEN_290; // @[tage.scala 300:47]
  wire  _GEN_327 = s1_update_meta_provider_2_valid & _GEN_291; // @[tage.scala 300:47]
  wire  _GEN_328 = s1_update_meta_provider_2_valid & _GEN_292; // @[tage.scala 300:47]
  wire  _GEN_329 = s1_update_meta_provider_2_valid & _GEN_293; // @[tage.scala 300:47]
  wire  _GEN_360 = s1_update__bits_br_mask[2] & s1_update__valid & _T_171 & _GEN_324; // @[tage.scala 299:92]
  wire  _GEN_361 = s1_update__bits_br_mask[2] & s1_update__valid & _T_171 & _GEN_325; // @[tage.scala 299:92]
  wire  _GEN_362 = s1_update__bits_br_mask[2] & s1_update__valid & _T_171 & _GEN_326; // @[tage.scala 299:92]
  wire  _GEN_363 = s1_update__bits_br_mask[2] & s1_update__valid & _T_171 & _GEN_327; // @[tage.scala 299:92]
  wire  _GEN_364 = s1_update__bits_br_mask[2] & s1_update__valid & _T_171 & _GEN_328; // @[tage.scala 299:92]
  wire  _GEN_365 = s1_update__bits_br_mask[2] & s1_update__valid & _T_171 & _GEN_329; // @[tage.scala 299:92]
  wire  _T_495 = f3_resps_0_3_bits_ctr == 3'h3 | f3_resps_0_3_bits_ctr == 3'h4 ? io_resp_in_0_f3_3_taken :
    f3_resps_0_3_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_396 = f3_resps_0_3_valid ? _T_495 : io_resp_in_0_f3_3_taken; // @[tage.scala 264:18 tage.scala 265:29 tage.scala 259:25]
  wire  _T_504 = f3_resps_1_3_bits_ctr == 3'h3 | f3_resps_1_3_bits_ctr == 3'h4 ? _T_499 : f3_resps_1_3_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_398 = f3_resps_1_3_valid ? _T_504 : _GEN_396; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_513 = f3_resps_2_3_bits_ctr == 3'h3 | f3_resps_2_3_bits_ctr == 3'h4 ? _T_508 : f3_resps_2_3_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_400 = f3_resps_2_3_valid ? _T_513 : _GEN_398; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_522 = f3_resps_3_3_bits_ctr == 3'h3 | f3_resps_3_3_bits_ctr == 3'h4 ? _T_517 : f3_resps_3_3_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_402 = f3_resps_3_3_valid ? _T_522 : _GEN_400; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_531 = f3_resps_4_3_bits_ctr == 3'h3 | f3_resps_4_3_bits_ctr == 3'h4 ? _T_526 : f3_resps_4_3_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _GEN_404 = f3_resps_4_3_valid ? _T_531 : _GEN_402; // @[tage.scala 264:18 tage.scala 265:29]
  wire  _T_540 = f3_resps_5_3_bits_ctr == 3'h3 | f3_resps_5_3_bits_ctr == 3'h4 ? _T_535 : f3_resps_5_3_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _T_622 = s1_update__bits_cfi_idx_bits == 2'h3; // @[tage.scala 297:58]
  wire  _T_623 = s1_update__bits_cfi_idx_valid & _T_622; // @[tage.scala 296:58]
  wire  _T_624 = _T_623 & s1_update__bits_cfi_taken; // @[tage.scala 297:67]
  wire  _GEN_420 = 3'h0 == s1_update_meta_provider_3_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_421 = 3'h1 == s1_update_meta_provider_3_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_422 = 3'h2 == s1_update_meta_provider_3_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_423 = 3'h3 == s1_update_meta_provider_3_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_424 = 3'h4 == s1_update_meta_provider_3_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire  _GEN_425 = 3'h5 == s1_update_meta_provider_3_bits; // @[tage.scala 303:37 tage.scala 303:37]
  wire [1:0] _T_636 = s1_update_meta_provider_u_3 - 2'h1; // @[tage.scala 218:43]
  wire [1:0] _T_637 = s1_update_meta_provider_u_3 == 2'h0 ? 2'h0 : _T_636; // @[tage.scala 218:24]
  wire [1:0] _T_640 = s1_update_meta_provider_u_3 + 2'h1; // @[tage.scala 219:43]
  wire [1:0] _T_641 = s1_update_meta_provider_u_3 == 2'h3 ? 2'h3 : _T_640; // @[tage.scala 219:24]
  wire [1:0] _T_642 = s1_update_mispredict_mask[3] ? _T_637 : _T_641; // @[tage.scala 218:8]
  wire [1:0] _T_643 = ~s1_update_meta_alt_differs_3 ? s1_update_meta_provider_u_3 : _T_642; // @[tage.scala 217:8]
  wire  _GEN_456 = s1_update_meta_provider_3_valid & _GEN_420; // @[tage.scala 300:47]
  wire  _GEN_457 = s1_update_meta_provider_3_valid & _GEN_421; // @[tage.scala 300:47]
  wire  _GEN_458 = s1_update_meta_provider_3_valid & _GEN_422; // @[tage.scala 300:47]
  wire  _GEN_459 = s1_update_meta_provider_3_valid & _GEN_423; // @[tage.scala 300:47]
  wire  _GEN_460 = s1_update_meta_provider_3_valid & _GEN_424; // @[tage.scala 300:47]
  wire  _GEN_461 = s1_update_meta_provider_3_valid & _GEN_425; // @[tage.scala 300:47]
  wire  _GEN_492 = s1_update__bits_br_mask[3] & s1_update__valid & _T_171 & _GEN_456; // @[tage.scala 299:92]
  wire  _GEN_493 = s1_update__bits_br_mask[3] & s1_update__valid & _T_171 & _GEN_457; // @[tage.scala 299:92]
  wire  _GEN_494 = s1_update__bits_br_mask[3] & s1_update__valid & _T_171 & _GEN_458; // @[tage.scala 299:92]
  wire  _GEN_495 = s1_update__bits_br_mask[3] & s1_update__valid & _T_171 & _GEN_459; // @[tage.scala 299:92]
  wire  _GEN_496 = s1_update__bits_br_mask[3] & s1_update__valid & _T_171 & _GEN_460; // @[tage.scala 299:92]
  wire  _GEN_497 = s1_update__bits_br_mask[3] & s1_update__valid & _T_171 & _GEN_461; // @[tage.scala 299:92]
  wire  _GEN_529 = 2'h1 == s1_update__bits_cfi_idx_bits ? s1_update_meta_allocate_1_valid :
    s1_update_meta_allocate_0_valid; // @[tage.scala 320:27 tage.scala 320:27]
  wire  _GEN_530 = 2'h2 == s1_update__bits_cfi_idx_bits ? s1_update_meta_allocate_2_valid : _GEN_529; // @[tage.scala 320:27 tage.scala 320:27]
  wire  _GEN_531 = 2'h3 == s1_update__bits_cfi_idx_bits ? s1_update_meta_allocate_3_valid : _GEN_530; // @[tage.scala 320:27 tage.scala 320:27]
  wire [2:0] _GEN_533 = 2'h1 == s1_update__bits_cfi_idx_bits ? s1_update_meta_allocate_1_bits :
    s1_update_meta_allocate_0_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire [2:0] _GEN_534 = 2'h2 == s1_update__bits_cfi_idx_bits ? s1_update_meta_allocate_2_bits : _GEN_533; // @[tage.scala 321:43 tage.scala 321:43]
  wire [2:0] _GEN_535 = 2'h3 == s1_update__bits_cfi_idx_bits ? s1_update_meta_allocate_3_bits : _GEN_534; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1040 = 3'h0 == _GEN_535; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1041 = 2'h0 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1042 = 3'h0 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_536 = 3'h0 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits | _GEN_96; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1044 = 2'h1 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1045 = 3'h0 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_537 = 3'h0 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits | _GEN_228; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1047 = 2'h2 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1048 = 3'h0 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_538 = 3'h0 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits | _GEN_360; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1050 = 2'h3 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1051 = 3'h0 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_539 = 3'h0 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits | _GEN_492; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1052 = 3'h1 == _GEN_535; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1054 = 3'h1 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_540 = 3'h1 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits | _GEN_97; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1057 = 3'h1 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_541 = 3'h1 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits | _GEN_229; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1060 = 3'h1 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_542 = 3'h1 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits | _GEN_361; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1063 = 3'h1 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_543 = 3'h1 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits | _GEN_493; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1064 = 3'h2 == _GEN_535; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1066 = 3'h2 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_544 = 3'h2 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits | _GEN_98; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1069 = 3'h2 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_545 = 3'h2 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits | _GEN_230; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1072 = 3'h2 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_546 = 3'h2 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits | _GEN_362; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1075 = 3'h2 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_547 = 3'h2 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits | _GEN_494; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1076 = 3'h3 == _GEN_535; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1078 = 3'h3 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_548 = 3'h3 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits | _GEN_99; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1081 = 3'h3 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_549 = 3'h3 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits | _GEN_231; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1084 = 3'h3 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_550 = 3'h3 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits | _GEN_363; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1087 = 3'h3 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_551 = 3'h3 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits | _GEN_495; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1088 = 3'h4 == _GEN_535; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1090 = 3'h4 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_552 = 3'h4 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits | _GEN_100; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1093 = 3'h4 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_553 = 3'h4 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits | _GEN_232; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1096 = 3'h4 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_554 = 3'h4 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits | _GEN_364; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1099 = 3'h4 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_555 = 3'h4 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits | _GEN_496; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1100 = 3'h5 == _GEN_535; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1102 = 3'h5 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_556 = 3'h5 == _GEN_535 & 2'h0 == s1_update__bits_cfi_idx_bits | _GEN_101; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1105 = 3'h5 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_557 = 3'h5 == _GEN_535 & 2'h1 == s1_update__bits_cfi_idx_bits | _GEN_233; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1108 = 3'h5 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_558 = 3'h5 == _GEN_535 & 2'h2 == s1_update__bits_cfi_idx_bits | _GEN_365; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_1111 = 3'h5 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_559 = 3'h5 == _GEN_535 & 2'h3 == s1_update__bits_cfi_idx_bits | _GEN_497; // @[tage.scala 321:43 tage.scala 321:43]
  wire [2:0] _GEN_657 = 2'h1 == s1_update__bits_cfi_idx_bits ? s1_update_meta_provider_1_bits :
    s1_update_meta_provider_0_bits; // @[OneHot.scala 58:35 OneHot.scala 58:35]
  wire [2:0] _GEN_658 = 2'h2 == s1_update__bits_cfi_idx_bits ? s1_update_meta_provider_2_bits : _GEN_657; // @[OneHot.scala 58:35 OneHot.scala 58:35]
  wire [2:0] _GEN_659 = 2'h3 == s1_update__bits_cfi_idx_bits ? s1_update_meta_provider_3_bits : _GEN_658; // @[OneHot.scala 58:35 OneHot.scala 58:35]
  wire [7:0] _T_651 = 8'h1 << _GEN_659; // @[OneHot.scala 58:35]
  wire [7:0] _T_653 = {{1'd0}, _T_651[7:1]}; // @[util.scala 373:29]
  wire [7:0] _T_654 = {{2'd0}, _T_651[7:2]}; // @[util.scala 373:29]
  wire [7:0] _T_655 = {{3'd0}, _T_651[7:3]}; // @[util.scala 373:29]
  wire [7:0] _T_656 = {{4'd0}, _T_651[7:4]}; // @[util.scala 373:29]
  wire [7:0] _T_657 = {{5'd0}, _T_651[7:5]}; // @[util.scala 373:29]
  wire [7:0] _T_658 = {{6'd0}, _T_651[7:6]}; // @[util.scala 373:29]
  wire [7:0] _T_659 = {{7'd0}, _T_651[7]}; // @[util.scala 373:29]
  wire [7:0] _T_660 = _T_651 | _T_653; // @[util.scala 373:45]
  wire [7:0] _T_661 = _T_660 | _T_654; // @[util.scala 373:45]
  wire [7:0] _T_662 = _T_661 | _T_655; // @[util.scala 373:45]
  wire [7:0] _T_663 = _T_662 | _T_656; // @[util.scala 373:45]
  wire [7:0] _T_664 = _T_663 | _T_657; // @[util.scala 373:45]
  wire [7:0] _T_665 = _T_664 | _T_658; // @[util.scala 373:45]
  wire [7:0] _T_666 = _T_665 | _T_659; // @[util.scala 373:45]
  wire [7:0] _T_667 = ~_T_666; // @[tage.scala 330:43]
  wire  _GEN_661 = 2'h1 == s1_update__bits_cfi_idx_bits ? s1_update_meta_provider_1_valid :
    s1_update_meta_provider_0_valid; // @[tage.scala 330:26 tage.scala 330:26]
  wire  _GEN_662 = 2'h2 == s1_update__bits_cfi_idx_bits ? s1_update_meta_provider_2_valid : _GEN_661; // @[tage.scala 330:26 tage.scala 330:26]
  wire  _GEN_663 = 2'h3 == s1_update__bits_cfi_idx_bits ? s1_update_meta_provider_3_valid : _GEN_662; // @[tage.scala 330:26 tage.scala 330:26]
  wire [7:0] _T_668 = _GEN_663 ? _T_667 : 8'h0; // @[tage.scala 330:26]
  wire  _GEN_664 = _GEN_1041 | _GEN_96; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_665 = _GEN_1044 | _GEN_228; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_666 = _GEN_1047 | _GEN_360; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_667 = _GEN_1050 | _GEN_492; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_680 = _GEN_1041 | _GEN_97; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_681 = _GEN_1044 | _GEN_229; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_682 = _GEN_1047 | _GEN_361; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_683 = _GEN_1050 | _GEN_493; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_696 = _GEN_1041 | _GEN_98; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_697 = _GEN_1044 | _GEN_230; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_698 = _GEN_1047 | _GEN_362; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_699 = _GEN_1050 | _GEN_494; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_712 = _GEN_1041 | _GEN_99; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_713 = _GEN_1044 | _GEN_231; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_714 = _GEN_1047 | _GEN_363; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_715 = _GEN_1050 | _GEN_495; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_728 = _GEN_1041 | _GEN_100; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_729 = _GEN_1044 | _GEN_232; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_730 = _GEN_1047 | _GEN_364; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_731 = _GEN_1050 | _GEN_496; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_744 = _GEN_1041 | _GEN_101; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_745 = _GEN_1044 | _GEN_233; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_746 = _GEN_1047 | _GEN_365; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_747 = _GEN_1050 | _GEN_497; // @[tage.scala 334:36 tage.scala 334:36]
  wire  _GEN_808 = _GEN_531 & _GEN_1042; // @[tage.scala 320:27]
  wire  _GEN_809 = _GEN_531 & _GEN_1045; // @[tage.scala 320:27]
  wire  _GEN_810 = _GEN_531 & _GEN_1048; // @[tage.scala 320:27]
  wire  _GEN_811 = _GEN_531 & _GEN_1051; // @[tage.scala 320:27]
  wire  _GEN_812 = _GEN_531 & _GEN_1054; // @[tage.scala 320:27]
  wire  _GEN_813 = _GEN_531 & _GEN_1057; // @[tage.scala 320:27]
  wire  _GEN_814 = _GEN_531 & _GEN_1060; // @[tage.scala 320:27]
  wire  _GEN_815 = _GEN_531 & _GEN_1063; // @[tage.scala 320:27]
  wire  _GEN_816 = _GEN_531 & _GEN_1066; // @[tage.scala 320:27]
  wire  _GEN_817 = _GEN_531 & _GEN_1069; // @[tage.scala 320:27]
  wire  _GEN_818 = _GEN_531 & _GEN_1072; // @[tage.scala 320:27]
  wire  _GEN_819 = _GEN_531 & _GEN_1075; // @[tage.scala 320:27]
  wire  _GEN_820 = _GEN_531 & _GEN_1078; // @[tage.scala 320:27]
  wire  _GEN_821 = _GEN_531 & _GEN_1081; // @[tage.scala 320:27]
  wire  _GEN_822 = _GEN_531 & _GEN_1084; // @[tage.scala 320:27]
  wire  _GEN_823 = _GEN_531 & _GEN_1087; // @[tage.scala 320:27]
  wire  _GEN_824 = _GEN_531 & _GEN_1090; // @[tage.scala 320:27]
  wire  _GEN_825 = _GEN_531 & _GEN_1093; // @[tage.scala 320:27]
  wire  _GEN_826 = _GEN_531 & _GEN_1096; // @[tage.scala 320:27]
  wire  _GEN_827 = _GEN_531 & _GEN_1099; // @[tage.scala 320:27]
  wire  _GEN_828 = _GEN_531 & _GEN_1102; // @[tage.scala 320:27]
  wire  _GEN_829 = _GEN_531 & _GEN_1105; // @[tage.scala 320:27]
  wire  _GEN_830 = _GEN_531 & _GEN_1108; // @[tage.scala 320:27]
  wire  _GEN_831 = _GEN_531 & _GEN_1111; // @[tage.scala 320:27]
  reg  REG_12; // @[tage.scala 345:48]
  reg  REG_13; // @[tage.scala 346:48]
  reg  REG_14; // @[tage.scala 347:48]
  reg [2:0] REG_15; // @[tage.scala 348:48]
  reg  REG_16; // @[tage.scala 350:47]
  reg [1:0] REG_17; // @[tage.scala 351:47]
  reg  REG_18; // @[tage.scala 345:48]
  reg  REG_19; // @[tage.scala 346:48]
  reg  REG_20; // @[tage.scala 347:48]
  reg [2:0] REG_21; // @[tage.scala 348:48]
  reg  REG_22; // @[tage.scala 350:47]
  reg [1:0] REG_23; // @[tage.scala 351:47]
  reg  REG_24; // @[tage.scala 345:48]
  reg  REG_25; // @[tage.scala 346:48]
  reg  REG_26; // @[tage.scala 347:48]
  reg [2:0] REG_27; // @[tage.scala 348:48]
  reg  REG_28; // @[tage.scala 350:47]
  reg [1:0] REG_29; // @[tage.scala 351:47]
  reg  REG_30; // @[tage.scala 345:48]
  reg  REG_31; // @[tage.scala 346:48]
  reg  REG_32; // @[tage.scala 347:48]
  reg [2:0] REG_33; // @[tage.scala 348:48]
  reg  REG_34; // @[tage.scala 350:47]
  reg [1:0] REG_35; // @[tage.scala 351:47]
  reg [39:0] REG_36; // @[tage.scala 353:41]
  reg [63:0] REG_37; // @[tage.scala 354:41]
  reg  REG_38; // @[tage.scala 345:48]
  reg  REG_39; // @[tage.scala 346:48]
  reg  REG_40; // @[tage.scala 347:48]
  reg [2:0] REG_41; // @[tage.scala 348:48]
  reg  REG_42; // @[tage.scala 350:47]
  reg [1:0] REG_43; // @[tage.scala 351:47]
  reg  REG_44; // @[tage.scala 345:48]
  reg  REG_45; // @[tage.scala 346:48]
  reg  REG_46; // @[tage.scala 347:48]
  reg [2:0] REG_47; // @[tage.scala 348:48]
  reg  REG_48; // @[tage.scala 350:47]
  reg [1:0] REG_49; // @[tage.scala 351:47]
  reg  REG_50; // @[tage.scala 345:48]
  reg  REG_51; // @[tage.scala 346:48]
  reg  REG_52; // @[tage.scala 347:48]
  reg [2:0] REG_53; // @[tage.scala 348:48]
  reg  REG_54; // @[tage.scala 350:47]
  reg [1:0] REG_55; // @[tage.scala 351:47]
  reg  REG_56; // @[tage.scala 345:48]
  reg  REG_57; // @[tage.scala 346:48]
  reg  REG_58; // @[tage.scala 347:48]
  reg [2:0] REG_59; // @[tage.scala 348:48]
  reg  REG_60; // @[tage.scala 350:47]
  reg [1:0] REG_61; // @[tage.scala 351:47]
  reg [39:0] REG_62; // @[tage.scala 353:41]
  reg [63:0] REG_63; // @[tage.scala 354:41]
  reg  REG_64; // @[tage.scala 345:48]
  reg  REG_65; // @[tage.scala 346:48]
  reg  REG_66; // @[tage.scala 347:48]
  reg [2:0] REG_67; // @[tage.scala 348:48]
  reg  REG_68; // @[tage.scala 350:47]
  reg [1:0] REG_69; // @[tage.scala 351:47]
  reg  REG_70; // @[tage.scala 345:48]
  reg  REG_71; // @[tage.scala 346:48]
  reg  REG_72; // @[tage.scala 347:48]
  reg [2:0] REG_73; // @[tage.scala 348:48]
  reg  REG_74; // @[tage.scala 350:47]
  reg [1:0] REG_75; // @[tage.scala 351:47]
  reg  REG_76; // @[tage.scala 345:48]
  reg  REG_77; // @[tage.scala 346:48]
  reg  REG_78; // @[tage.scala 347:48]
  reg [2:0] REG_79; // @[tage.scala 348:48]
  reg  REG_80; // @[tage.scala 350:47]
  reg [1:0] REG_81; // @[tage.scala 351:47]
  reg  REG_82; // @[tage.scala 345:48]
  reg  REG_83; // @[tage.scala 346:48]
  reg  REG_84; // @[tage.scala 347:48]
  reg [2:0] REG_85; // @[tage.scala 348:48]
  reg  REG_86; // @[tage.scala 350:47]
  reg [1:0] REG_87; // @[tage.scala 351:47]
  reg [39:0] REG_88; // @[tage.scala 353:41]
  reg [63:0] REG_89; // @[tage.scala 354:41]
  reg  REG_90; // @[tage.scala 345:48]
  reg  REG_91; // @[tage.scala 346:48]
  reg  REG_92; // @[tage.scala 347:48]
  reg [2:0] REG_93; // @[tage.scala 348:48]
  reg  REG_94; // @[tage.scala 350:47]
  reg [1:0] REG_95; // @[tage.scala 351:47]
  reg  REG_96; // @[tage.scala 345:48]
  reg  REG_97; // @[tage.scala 346:48]
  reg  REG_98; // @[tage.scala 347:48]
  reg [2:0] REG_99; // @[tage.scala 348:48]
  reg  REG_100; // @[tage.scala 350:47]
  reg [1:0] REG_101; // @[tage.scala 351:47]
  reg  REG_102; // @[tage.scala 345:48]
  reg  REG_103; // @[tage.scala 346:48]
  reg  REG_104; // @[tage.scala 347:48]
  reg [2:0] REG_105; // @[tage.scala 348:48]
  reg  REG_106; // @[tage.scala 350:47]
  reg [1:0] REG_107; // @[tage.scala 351:47]
  reg  REG_108; // @[tage.scala 345:48]
  reg  REG_109; // @[tage.scala 346:48]
  reg  REG_110; // @[tage.scala 347:48]
  reg [2:0] REG_111; // @[tage.scala 348:48]
  reg  REG_112; // @[tage.scala 350:47]
  reg [1:0] REG_113; // @[tage.scala 351:47]
  reg [39:0] REG_114; // @[tage.scala 353:41]
  reg [63:0] REG_115; // @[tage.scala 354:41]
  reg  REG_116; // @[tage.scala 345:48]
  reg  REG_117; // @[tage.scala 346:48]
  reg  REG_118; // @[tage.scala 347:48]
  reg [2:0] REG_119; // @[tage.scala 348:48]
  reg  REG_120; // @[tage.scala 350:47]
  reg [1:0] REG_121; // @[tage.scala 351:47]
  reg  REG_122; // @[tage.scala 345:48]
  reg  REG_123; // @[tage.scala 346:48]
  reg  REG_124; // @[tage.scala 347:48]
  reg [2:0] REG_125; // @[tage.scala 348:48]
  reg  REG_126; // @[tage.scala 350:47]
  reg [1:0] REG_127; // @[tage.scala 351:47]
  reg  REG_128; // @[tage.scala 345:48]
  reg  REG_129; // @[tage.scala 346:48]
  reg  REG_130; // @[tage.scala 347:48]
  reg [2:0] REG_131; // @[tage.scala 348:48]
  reg  REG_132; // @[tage.scala 350:47]
  reg [1:0] REG_133; // @[tage.scala 351:47]
  reg  REG_134; // @[tage.scala 345:48]
  reg  REG_135; // @[tage.scala 346:48]
  reg  REG_136; // @[tage.scala 347:48]
  reg [2:0] REG_137; // @[tage.scala 348:48]
  reg  REG_138; // @[tage.scala 350:47]
  reg [1:0] REG_139; // @[tage.scala 351:47]
  reg [39:0] REG_140; // @[tage.scala 353:41]
  reg [63:0] REG_141; // @[tage.scala 354:41]
  reg  REG_142; // @[tage.scala 345:48]
  reg  REG_143; // @[tage.scala 346:48]
  reg  REG_144; // @[tage.scala 347:48]
  reg [2:0] REG_145; // @[tage.scala 348:48]
  reg  REG_146; // @[tage.scala 350:47]
  reg [1:0] REG_147; // @[tage.scala 351:47]
  reg  REG_148; // @[tage.scala 345:48]
  reg  REG_149; // @[tage.scala 346:48]
  reg  REG_150; // @[tage.scala 347:48]
  reg [2:0] REG_151; // @[tage.scala 348:48]
  reg  REG_152; // @[tage.scala 350:47]
  reg [1:0] REG_153; // @[tage.scala 351:47]
  reg  REG_154; // @[tage.scala 345:48]
  reg  REG_155; // @[tage.scala 346:48]
  reg  REG_156; // @[tage.scala 347:48]
  reg [2:0] REG_157; // @[tage.scala 348:48]
  reg  REG_158; // @[tage.scala 350:47]
  reg [1:0] REG_159; // @[tage.scala 351:47]
  reg  REG_160; // @[tage.scala 345:48]
  reg  REG_161; // @[tage.scala 346:48]
  reg  REG_162; // @[tage.scala 347:48]
  reg [2:0] REG_163; // @[tage.scala 348:48]
  reg  REG_164; // @[tage.scala 350:47]
  reg [1:0] REG_165; // @[tage.scala 351:47]
  reg [39:0] REG_166; // @[tage.scala 353:41]
  reg [63:0] REG_167; // @[tage.scala 354:41]
  TageTable tables_0 ( // @[tage.scala 224:21]
    .clock(tables_0_clock),
    .reset(tables_0_reset),
    .io_f1_req_valid(tables_0_io_f1_req_valid),
    .io_f1_req_pc(tables_0_io_f1_req_pc),
    .io_f1_req_ghist(tables_0_io_f1_req_ghist),
    .io_f3_resp_0_valid(tables_0_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr(tables_0_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u(tables_0_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid(tables_0_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr(tables_0_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u(tables_0_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid(tables_0_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr(tables_0_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u(tables_0_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid(tables_0_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr(tables_0_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u(tables_0_io_f3_resp_3_bits_u),
    .io_update_mask_0(tables_0_io_update_mask_0),
    .io_update_mask_1(tables_0_io_update_mask_1),
    .io_update_mask_2(tables_0_io_update_mask_2),
    .io_update_mask_3(tables_0_io_update_mask_3),
    .io_update_taken_0(tables_0_io_update_taken_0),
    .io_update_taken_1(tables_0_io_update_taken_1),
    .io_update_taken_2(tables_0_io_update_taken_2),
    .io_update_taken_3(tables_0_io_update_taken_3),
    .io_update_alloc_0(tables_0_io_update_alloc_0),
    .io_update_alloc_1(tables_0_io_update_alloc_1),
    .io_update_alloc_2(tables_0_io_update_alloc_2),
    .io_update_alloc_3(tables_0_io_update_alloc_3),
    .io_update_old_ctr_0(tables_0_io_update_old_ctr_0),
    .io_update_old_ctr_1(tables_0_io_update_old_ctr_1),
    .io_update_old_ctr_2(tables_0_io_update_old_ctr_2),
    .io_update_old_ctr_3(tables_0_io_update_old_ctr_3),
    .io_update_pc(tables_0_io_update_pc),
    .io_update_hist(tables_0_io_update_hist),
    .io_update_u_mask_0(tables_0_io_update_u_mask_0),
    .io_update_u_mask_1(tables_0_io_update_u_mask_1),
    .io_update_u_mask_2(tables_0_io_update_u_mask_2),
    .io_update_u_mask_3(tables_0_io_update_u_mask_3),
    .io_update_u_0(tables_0_io_update_u_0),
    .io_update_u_1(tables_0_io_update_u_1),
    .io_update_u_2(tables_0_io_update_u_2),
    .io_update_u_3(tables_0_io_update_u_3)
  );
  TageTable_1 tables_1 ( // @[tage.scala 224:21]
    .clock(tables_1_clock),
    .reset(tables_1_reset),
    .io_f1_req_valid(tables_1_io_f1_req_valid),
    .io_f1_req_pc(tables_1_io_f1_req_pc),
    .io_f1_req_ghist(tables_1_io_f1_req_ghist),
    .io_f3_resp_0_valid(tables_1_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr(tables_1_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u(tables_1_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid(tables_1_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr(tables_1_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u(tables_1_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid(tables_1_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr(tables_1_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u(tables_1_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid(tables_1_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr(tables_1_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u(tables_1_io_f3_resp_3_bits_u),
    .io_update_mask_0(tables_1_io_update_mask_0),
    .io_update_mask_1(tables_1_io_update_mask_1),
    .io_update_mask_2(tables_1_io_update_mask_2),
    .io_update_mask_3(tables_1_io_update_mask_3),
    .io_update_taken_0(tables_1_io_update_taken_0),
    .io_update_taken_1(tables_1_io_update_taken_1),
    .io_update_taken_2(tables_1_io_update_taken_2),
    .io_update_taken_3(tables_1_io_update_taken_3),
    .io_update_alloc_0(tables_1_io_update_alloc_0),
    .io_update_alloc_1(tables_1_io_update_alloc_1),
    .io_update_alloc_2(tables_1_io_update_alloc_2),
    .io_update_alloc_3(tables_1_io_update_alloc_3),
    .io_update_old_ctr_0(tables_1_io_update_old_ctr_0),
    .io_update_old_ctr_1(tables_1_io_update_old_ctr_1),
    .io_update_old_ctr_2(tables_1_io_update_old_ctr_2),
    .io_update_old_ctr_3(tables_1_io_update_old_ctr_3),
    .io_update_pc(tables_1_io_update_pc),
    .io_update_hist(tables_1_io_update_hist),
    .io_update_u_mask_0(tables_1_io_update_u_mask_0),
    .io_update_u_mask_1(tables_1_io_update_u_mask_1),
    .io_update_u_mask_2(tables_1_io_update_u_mask_2),
    .io_update_u_mask_3(tables_1_io_update_u_mask_3),
    .io_update_u_0(tables_1_io_update_u_0),
    .io_update_u_1(tables_1_io_update_u_1),
    .io_update_u_2(tables_1_io_update_u_2),
    .io_update_u_3(tables_1_io_update_u_3)
  );
  TageTable_2 tables_2 ( // @[tage.scala 224:21]
    .clock(tables_2_clock),
    .reset(tables_2_reset),
    .io_f1_req_valid(tables_2_io_f1_req_valid),
    .io_f1_req_pc(tables_2_io_f1_req_pc),
    .io_f1_req_ghist(tables_2_io_f1_req_ghist),
    .io_f3_resp_0_valid(tables_2_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr(tables_2_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u(tables_2_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid(tables_2_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr(tables_2_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u(tables_2_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid(tables_2_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr(tables_2_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u(tables_2_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid(tables_2_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr(tables_2_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u(tables_2_io_f3_resp_3_bits_u),
    .io_update_mask_0(tables_2_io_update_mask_0),
    .io_update_mask_1(tables_2_io_update_mask_1),
    .io_update_mask_2(tables_2_io_update_mask_2),
    .io_update_mask_3(tables_2_io_update_mask_3),
    .io_update_taken_0(tables_2_io_update_taken_0),
    .io_update_taken_1(tables_2_io_update_taken_1),
    .io_update_taken_2(tables_2_io_update_taken_2),
    .io_update_taken_3(tables_2_io_update_taken_3),
    .io_update_alloc_0(tables_2_io_update_alloc_0),
    .io_update_alloc_1(tables_2_io_update_alloc_1),
    .io_update_alloc_2(tables_2_io_update_alloc_2),
    .io_update_alloc_3(tables_2_io_update_alloc_3),
    .io_update_old_ctr_0(tables_2_io_update_old_ctr_0),
    .io_update_old_ctr_1(tables_2_io_update_old_ctr_1),
    .io_update_old_ctr_2(tables_2_io_update_old_ctr_2),
    .io_update_old_ctr_3(tables_2_io_update_old_ctr_3),
    .io_update_pc(tables_2_io_update_pc),
    .io_update_hist(tables_2_io_update_hist),
    .io_update_u_mask_0(tables_2_io_update_u_mask_0),
    .io_update_u_mask_1(tables_2_io_update_u_mask_1),
    .io_update_u_mask_2(tables_2_io_update_u_mask_2),
    .io_update_u_mask_3(tables_2_io_update_u_mask_3),
    .io_update_u_0(tables_2_io_update_u_0),
    .io_update_u_1(tables_2_io_update_u_1),
    .io_update_u_2(tables_2_io_update_u_2),
    .io_update_u_3(tables_2_io_update_u_3)
  );
  TageTable_3 tables_3 ( // @[tage.scala 224:21]
    .clock(tables_3_clock),
    .reset(tables_3_reset),
    .io_f1_req_valid(tables_3_io_f1_req_valid),
    .io_f1_req_pc(tables_3_io_f1_req_pc),
    .io_f1_req_ghist(tables_3_io_f1_req_ghist),
    .io_f3_resp_0_valid(tables_3_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr(tables_3_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u(tables_3_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid(tables_3_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr(tables_3_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u(tables_3_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid(tables_3_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr(tables_3_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u(tables_3_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid(tables_3_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr(tables_3_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u(tables_3_io_f3_resp_3_bits_u),
    .io_update_mask_0(tables_3_io_update_mask_0),
    .io_update_mask_1(tables_3_io_update_mask_1),
    .io_update_mask_2(tables_3_io_update_mask_2),
    .io_update_mask_3(tables_3_io_update_mask_3),
    .io_update_taken_0(tables_3_io_update_taken_0),
    .io_update_taken_1(tables_3_io_update_taken_1),
    .io_update_taken_2(tables_3_io_update_taken_2),
    .io_update_taken_3(tables_3_io_update_taken_3),
    .io_update_alloc_0(tables_3_io_update_alloc_0),
    .io_update_alloc_1(tables_3_io_update_alloc_1),
    .io_update_alloc_2(tables_3_io_update_alloc_2),
    .io_update_alloc_3(tables_3_io_update_alloc_3),
    .io_update_old_ctr_0(tables_3_io_update_old_ctr_0),
    .io_update_old_ctr_1(tables_3_io_update_old_ctr_1),
    .io_update_old_ctr_2(tables_3_io_update_old_ctr_2),
    .io_update_old_ctr_3(tables_3_io_update_old_ctr_3),
    .io_update_pc(tables_3_io_update_pc),
    .io_update_hist(tables_3_io_update_hist),
    .io_update_u_mask_0(tables_3_io_update_u_mask_0),
    .io_update_u_mask_1(tables_3_io_update_u_mask_1),
    .io_update_u_mask_2(tables_3_io_update_u_mask_2),
    .io_update_u_mask_3(tables_3_io_update_u_mask_3),
    .io_update_u_0(tables_3_io_update_u_0),
    .io_update_u_1(tables_3_io_update_u_1),
    .io_update_u_2(tables_3_io_update_u_2),
    .io_update_u_3(tables_3_io_update_u_3)
  );
  TageTable_4 tables_4 ( // @[tage.scala 224:21]
    .clock(tables_4_clock),
    .reset(tables_4_reset),
    .io_f1_req_valid(tables_4_io_f1_req_valid),
    .io_f1_req_pc(tables_4_io_f1_req_pc),
    .io_f1_req_ghist(tables_4_io_f1_req_ghist),
    .io_f3_resp_0_valid(tables_4_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr(tables_4_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u(tables_4_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid(tables_4_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr(tables_4_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u(tables_4_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid(tables_4_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr(tables_4_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u(tables_4_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid(tables_4_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr(tables_4_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u(tables_4_io_f3_resp_3_bits_u),
    .io_update_mask_0(tables_4_io_update_mask_0),
    .io_update_mask_1(tables_4_io_update_mask_1),
    .io_update_mask_2(tables_4_io_update_mask_2),
    .io_update_mask_3(tables_4_io_update_mask_3),
    .io_update_taken_0(tables_4_io_update_taken_0),
    .io_update_taken_1(tables_4_io_update_taken_1),
    .io_update_taken_2(tables_4_io_update_taken_2),
    .io_update_taken_3(tables_4_io_update_taken_3),
    .io_update_alloc_0(tables_4_io_update_alloc_0),
    .io_update_alloc_1(tables_4_io_update_alloc_1),
    .io_update_alloc_2(tables_4_io_update_alloc_2),
    .io_update_alloc_3(tables_4_io_update_alloc_3),
    .io_update_old_ctr_0(tables_4_io_update_old_ctr_0),
    .io_update_old_ctr_1(tables_4_io_update_old_ctr_1),
    .io_update_old_ctr_2(tables_4_io_update_old_ctr_2),
    .io_update_old_ctr_3(tables_4_io_update_old_ctr_3),
    .io_update_pc(tables_4_io_update_pc),
    .io_update_hist(tables_4_io_update_hist),
    .io_update_u_mask_0(tables_4_io_update_u_mask_0),
    .io_update_u_mask_1(tables_4_io_update_u_mask_1),
    .io_update_u_mask_2(tables_4_io_update_u_mask_2),
    .io_update_u_mask_3(tables_4_io_update_u_mask_3),
    .io_update_u_0(tables_4_io_update_u_0),
    .io_update_u_1(tables_4_io_update_u_1),
    .io_update_u_2(tables_4_io_update_u_2),
    .io_update_u_3(tables_4_io_update_u_3)
  );
  TageTable_5 tables_5 ( // @[tage.scala 224:21]
    .clock(tables_5_clock),
    .reset(tables_5_reset),
    .io_f1_req_valid(tables_5_io_f1_req_valid),
    .io_f1_req_pc(tables_5_io_f1_req_pc),
    .io_f1_req_ghist(tables_5_io_f1_req_ghist),
    .io_f3_resp_0_valid(tables_5_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr(tables_5_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u(tables_5_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid(tables_5_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr(tables_5_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u(tables_5_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid(tables_5_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr(tables_5_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u(tables_5_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid(tables_5_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr(tables_5_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u(tables_5_io_f3_resp_3_bits_u),
    .io_update_mask_0(tables_5_io_update_mask_0),
    .io_update_mask_1(tables_5_io_update_mask_1),
    .io_update_mask_2(tables_5_io_update_mask_2),
    .io_update_mask_3(tables_5_io_update_mask_3),
    .io_update_taken_0(tables_5_io_update_taken_0),
    .io_update_taken_1(tables_5_io_update_taken_1),
    .io_update_taken_2(tables_5_io_update_taken_2),
    .io_update_taken_3(tables_5_io_update_taken_3),
    .io_update_alloc_0(tables_5_io_update_alloc_0),
    .io_update_alloc_1(tables_5_io_update_alloc_1),
    .io_update_alloc_2(tables_5_io_update_alloc_2),
    .io_update_alloc_3(tables_5_io_update_alloc_3),
    .io_update_old_ctr_0(tables_5_io_update_old_ctr_0),
    .io_update_old_ctr_1(tables_5_io_update_old_ctr_1),
    .io_update_old_ctr_2(tables_5_io_update_old_ctr_2),
    .io_update_old_ctr_3(tables_5_io_update_old_ctr_3),
    .io_update_pc(tables_5_io_update_pc),
    .io_update_hist(tables_5_io_update_hist),
    .io_update_u_mask_0(tables_5_io_update_u_mask_0),
    .io_update_u_mask_1(tables_5_io_update_u_mask_1),
    .io_update_u_mask_2(tables_5_io_update_u_mask_2),
    .io_update_u_mask_3(tables_5_io_update_u_mask_3),
    .io_update_u_0(tables_5_io_update_u_0),
    .io_update_u_1(tables_5_io_update_u_1),
    .io_update_u_2(tables_5_io_update_u_2),
    .io_update_u_3(tables_5_io_update_u_3)
  );
  MaxPeriodFibonacciLFSR_2 prng ( // @[PRNG.scala 82:22]
    .clock(prng_clock),
    .reset(prng_reset),
    .io_seed_valid(prng_io_seed_valid),
    .io_seed_bits_0(prng_io_seed_bits_0),
    .io_seed_bits_1(prng_io_seed_bits_1),
    .io_seed_bits_2(prng_io_seed_bits_2),
    .io_seed_bits_3(prng_io_seed_bits_3),
    .io_seed_bits_4(prng_io_seed_bits_4),
    .io_seed_bits_5(prng_io_seed_bits_5),
    .io_increment(prng_io_increment),
    .io_out_0(prng_io_out_0),
    .io_out_1(prng_io_out_1),
    .io_out_2(prng_io_out_2),
    .io_out_3(prng_io_out_3),
    .io_out_4(prng_io_out_4),
    .io_out_5(prng_io_out_5)
  );
  MaxPeriodFibonacciLFSR_2 prng_1 ( // @[PRNG.scala 82:22]
    .clock(prng_1_clock),
    .reset(prng_1_reset),
    .io_seed_valid(prng_1_io_seed_valid),
    .io_seed_bits_0(prng_1_io_seed_bits_0),
    .io_seed_bits_1(prng_1_io_seed_bits_1),
    .io_seed_bits_2(prng_1_io_seed_bits_2),
    .io_seed_bits_3(prng_1_io_seed_bits_3),
    .io_seed_bits_4(prng_1_io_seed_bits_4),
    .io_seed_bits_5(prng_1_io_seed_bits_5),
    .io_increment(prng_1_io_increment),
    .io_out_0(prng_1_io_out_0),
    .io_out_1(prng_1_io_out_1),
    .io_out_2(prng_1_io_out_2),
    .io_out_3(prng_1_io_out_3),
    .io_out_4(prng_1_io_out_4),
    .io_out_5(prng_1_io_out_5)
  );
  MaxPeriodFibonacciLFSR_2 prng_2 ( // @[PRNG.scala 82:22]
    .clock(prng_2_clock),
    .reset(prng_2_reset),
    .io_seed_valid(prng_2_io_seed_valid),
    .io_seed_bits_0(prng_2_io_seed_bits_0),
    .io_seed_bits_1(prng_2_io_seed_bits_1),
    .io_seed_bits_2(prng_2_io_seed_bits_2),
    .io_seed_bits_3(prng_2_io_seed_bits_3),
    .io_seed_bits_4(prng_2_io_seed_bits_4),
    .io_seed_bits_5(prng_2_io_seed_bits_5),
    .io_increment(prng_2_io_increment),
    .io_out_0(prng_2_io_out_0),
    .io_out_1(prng_2_io_out_1),
    .io_out_2(prng_2_io_out_2),
    .io_out_3(prng_2_io_out_3),
    .io_out_4(prng_2_io_out_4),
    .io_out_5(prng_2_io_out_5)
  );
  MaxPeriodFibonacciLFSR_2 prng_3 ( // @[PRNG.scala 82:22]
    .clock(prng_3_clock),
    .reset(prng_3_reset),
    .io_seed_valid(prng_3_io_seed_valid),
    .io_seed_bits_0(prng_3_io_seed_bits_0),
    .io_seed_bits_1(prng_3_io_seed_bits_1),
    .io_seed_bits_2(prng_3_io_seed_bits_2),
    .io_seed_bits_3(prng_3_io_seed_bits_3),
    .io_seed_bits_4(prng_3_io_seed_bits_4),
    .io_seed_bits_5(prng_3_io_seed_bits_5),
    .io_increment(prng_3_io_increment),
    .io_out_0(prng_3_io_out_0),
    .io_out_1(prng_3_io_out_1),
    .io_out_2(prng_3_io_out_2),
    .io_out_3(prng_3_io_out_3),
    .io_out_4(prng_3_io_out_4),
    .io_out_5(prng_3_io_out_5)
  );
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
  assign io_resp_f2_0_taken = io_resp_in_0_f2_0_taken; // @[predictor.scala 158:11]
  assign io_resp_f2_0_is_br = io_resp_in_0_f2_0_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_0_is_jal = io_resp_in_0_f2_0_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_0_predicted_pc_valid = io_resp_in_0_f2_0_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_0_predicted_pc_bits = io_resp_in_0_f2_0_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f2_1_taken = io_resp_in_0_f2_1_taken; // @[predictor.scala 158:11]
  assign io_resp_f2_1_is_br = io_resp_in_0_f2_1_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_1_is_jal = io_resp_in_0_f2_1_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_1_predicted_pc_valid = io_resp_in_0_f2_1_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_1_predicted_pc_bits = io_resp_in_0_f2_1_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f2_2_taken = io_resp_in_0_f2_2_taken; // @[predictor.scala 158:11]
  assign io_resp_f2_2_is_br = io_resp_in_0_f2_2_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_2_is_jal = io_resp_in_0_f2_2_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_2_predicted_pc_valid = io_resp_in_0_f2_2_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_2_predicted_pc_bits = io_resp_in_0_f2_2_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f2_3_taken = io_resp_in_0_f2_3_taken; // @[predictor.scala 158:11]
  assign io_resp_f2_3_is_br = io_resp_in_0_f2_3_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_3_is_jal = io_resp_in_0_f2_3_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_3_predicted_pc_valid = io_resp_in_0_f2_3_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_3_predicted_pc_bits = io_resp_in_0_f2_3_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_0_taken = f3_resps_5_0_valid ? _T_81 : _GEN_8; // @[tage.scala 264:18 tage.scala 265:29]
  assign io_resp_f3_0_is_br = io_resp_in_0_f3_0_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_0_is_jal = io_resp_in_0_f3_0_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_0_predicted_pc_valid = io_resp_in_0_f3_0_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_0_predicted_pc_bits = io_resp_in_0_f3_0_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_1_taken = f3_resps_5_1_valid ? _T_234 : _GEN_140; // @[tage.scala 264:18 tage.scala 265:29]
  assign io_resp_f3_1_is_br = io_resp_in_0_f3_1_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_1_is_jal = io_resp_in_0_f3_1_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_1_predicted_pc_valid = io_resp_in_0_f3_1_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_1_predicted_pc_bits = io_resp_in_0_f3_1_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_2_taken = f3_resps_5_2_valid ? _T_387 : _GEN_272; // @[tage.scala 264:18 tage.scala 265:29]
  assign io_resp_f3_2_is_br = io_resp_in_0_f3_2_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_2_is_jal = io_resp_in_0_f3_2_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_2_predicted_pc_valid = io_resp_in_0_f3_2_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_2_predicted_pc_bits = io_resp_in_0_f3_2_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_3_taken = f3_resps_5_3_valid ? _T_540 : _GEN_404; // @[tage.scala 264:18 tage.scala 265:29]
  assign io_resp_f3_3_is_br = io_resp_in_0_f3_3_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_3_is_jal = io_resp_in_0_f3_3_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_3_predicted_pc_valid = io_resp_in_0_f3_3_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_3_predicted_pc_bits = io_resp_in_0_f3_3_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_f3_meta = {{64'd0}, _T}; // @[tage.scala 359:25]
  assign tables_0_clock = clock;
  assign tables_0_reset = reset;
  assign tables_0_io_f1_req_valid = REG; // @[tage.scala 225:25]
  assign tables_0_io_f1_req_pc = REG_1; // @[tage.scala 226:25]
  assign tables_0_io_f1_req_ghist = io_f1_ghist; // @[tage.scala 227:25]
  assign tables_0_io_update_mask_0 = REG_12; // @[tage.scala 345:38]
  assign tables_0_io_update_mask_1 = REG_18; // @[tage.scala 345:38]
  assign tables_0_io_update_mask_2 = REG_24; // @[tage.scala 345:38]
  assign tables_0_io_update_mask_3 = REG_30; // @[tage.scala 345:38]
  assign tables_0_io_update_taken_0 = REG_13; // @[tage.scala 346:38]
  assign tables_0_io_update_taken_1 = REG_19; // @[tage.scala 346:38]
  assign tables_0_io_update_taken_2 = REG_25; // @[tage.scala 346:38]
  assign tables_0_io_update_taken_3 = REG_31; // @[tage.scala 346:38]
  assign tables_0_io_update_alloc_0 = REG_14; // @[tage.scala 347:38]
  assign tables_0_io_update_alloc_1 = REG_20; // @[tage.scala 347:38]
  assign tables_0_io_update_alloc_2 = REG_26; // @[tage.scala 347:38]
  assign tables_0_io_update_alloc_3 = REG_32; // @[tage.scala 347:38]
  assign tables_0_io_update_old_ctr_0 = REG_15; // @[tage.scala 348:38]
  assign tables_0_io_update_old_ctr_1 = REG_21; // @[tage.scala 348:38]
  assign tables_0_io_update_old_ctr_2 = REG_27; // @[tage.scala 348:38]
  assign tables_0_io_update_old_ctr_3 = REG_33; // @[tage.scala 348:38]
  assign tables_0_io_update_pc = REG_36; // @[tage.scala 353:31]
  assign tables_0_io_update_hist = REG_37; // @[tage.scala 354:31]
  assign tables_0_io_update_u_mask_0 = REG_16; // @[tage.scala 350:37]
  assign tables_0_io_update_u_mask_1 = REG_22; // @[tage.scala 350:37]
  assign tables_0_io_update_u_mask_2 = REG_28; // @[tage.scala 350:37]
  assign tables_0_io_update_u_mask_3 = REG_34; // @[tage.scala 350:37]
  assign tables_0_io_update_u_0 = REG_17; // @[tage.scala 351:37]
  assign tables_0_io_update_u_1 = REG_23; // @[tage.scala 351:37]
  assign tables_0_io_update_u_2 = REG_29; // @[tage.scala 351:37]
  assign tables_0_io_update_u_3 = REG_35; // @[tage.scala 351:37]
  assign tables_1_clock = clock;
  assign tables_1_reset = reset;
  assign tables_1_io_f1_req_valid = REG_2; // @[tage.scala 225:25]
  assign tables_1_io_f1_req_pc = REG_3; // @[tage.scala 226:25]
  assign tables_1_io_f1_req_ghist = io_f1_ghist; // @[tage.scala 227:25]
  assign tables_1_io_update_mask_0 = REG_38; // @[tage.scala 345:38]
  assign tables_1_io_update_mask_1 = REG_44; // @[tage.scala 345:38]
  assign tables_1_io_update_mask_2 = REG_50; // @[tage.scala 345:38]
  assign tables_1_io_update_mask_3 = REG_56; // @[tage.scala 345:38]
  assign tables_1_io_update_taken_0 = REG_39; // @[tage.scala 346:38]
  assign tables_1_io_update_taken_1 = REG_45; // @[tage.scala 346:38]
  assign tables_1_io_update_taken_2 = REG_51; // @[tage.scala 346:38]
  assign tables_1_io_update_taken_3 = REG_57; // @[tage.scala 346:38]
  assign tables_1_io_update_alloc_0 = REG_40; // @[tage.scala 347:38]
  assign tables_1_io_update_alloc_1 = REG_46; // @[tage.scala 347:38]
  assign tables_1_io_update_alloc_2 = REG_52; // @[tage.scala 347:38]
  assign tables_1_io_update_alloc_3 = REG_58; // @[tage.scala 347:38]
  assign tables_1_io_update_old_ctr_0 = REG_41; // @[tage.scala 348:38]
  assign tables_1_io_update_old_ctr_1 = REG_47; // @[tage.scala 348:38]
  assign tables_1_io_update_old_ctr_2 = REG_53; // @[tage.scala 348:38]
  assign tables_1_io_update_old_ctr_3 = REG_59; // @[tage.scala 348:38]
  assign tables_1_io_update_pc = REG_62; // @[tage.scala 353:31]
  assign tables_1_io_update_hist = REG_63; // @[tage.scala 354:31]
  assign tables_1_io_update_u_mask_0 = REG_42; // @[tage.scala 350:37]
  assign tables_1_io_update_u_mask_1 = REG_48; // @[tage.scala 350:37]
  assign tables_1_io_update_u_mask_2 = REG_54; // @[tage.scala 350:37]
  assign tables_1_io_update_u_mask_3 = REG_60; // @[tage.scala 350:37]
  assign tables_1_io_update_u_0 = REG_43; // @[tage.scala 351:37]
  assign tables_1_io_update_u_1 = REG_49; // @[tage.scala 351:37]
  assign tables_1_io_update_u_2 = REG_55; // @[tage.scala 351:37]
  assign tables_1_io_update_u_3 = REG_61; // @[tage.scala 351:37]
  assign tables_2_clock = clock;
  assign tables_2_reset = reset;
  assign tables_2_io_f1_req_valid = REG_4; // @[tage.scala 225:25]
  assign tables_2_io_f1_req_pc = REG_5; // @[tage.scala 226:25]
  assign tables_2_io_f1_req_ghist = io_f1_ghist; // @[tage.scala 227:25]
  assign tables_2_io_update_mask_0 = REG_64; // @[tage.scala 345:38]
  assign tables_2_io_update_mask_1 = REG_70; // @[tage.scala 345:38]
  assign tables_2_io_update_mask_2 = REG_76; // @[tage.scala 345:38]
  assign tables_2_io_update_mask_3 = REG_82; // @[tage.scala 345:38]
  assign tables_2_io_update_taken_0 = REG_65; // @[tage.scala 346:38]
  assign tables_2_io_update_taken_1 = REG_71; // @[tage.scala 346:38]
  assign tables_2_io_update_taken_2 = REG_77; // @[tage.scala 346:38]
  assign tables_2_io_update_taken_3 = REG_83; // @[tage.scala 346:38]
  assign tables_2_io_update_alloc_0 = REG_66; // @[tage.scala 347:38]
  assign tables_2_io_update_alloc_1 = REG_72; // @[tage.scala 347:38]
  assign tables_2_io_update_alloc_2 = REG_78; // @[tage.scala 347:38]
  assign tables_2_io_update_alloc_3 = REG_84; // @[tage.scala 347:38]
  assign tables_2_io_update_old_ctr_0 = REG_67; // @[tage.scala 348:38]
  assign tables_2_io_update_old_ctr_1 = REG_73; // @[tage.scala 348:38]
  assign tables_2_io_update_old_ctr_2 = REG_79; // @[tage.scala 348:38]
  assign tables_2_io_update_old_ctr_3 = REG_85; // @[tage.scala 348:38]
  assign tables_2_io_update_pc = REG_88; // @[tage.scala 353:31]
  assign tables_2_io_update_hist = REG_89; // @[tage.scala 354:31]
  assign tables_2_io_update_u_mask_0 = REG_68; // @[tage.scala 350:37]
  assign tables_2_io_update_u_mask_1 = REG_74; // @[tage.scala 350:37]
  assign tables_2_io_update_u_mask_2 = REG_80; // @[tage.scala 350:37]
  assign tables_2_io_update_u_mask_3 = REG_86; // @[tage.scala 350:37]
  assign tables_2_io_update_u_0 = REG_69; // @[tage.scala 351:37]
  assign tables_2_io_update_u_1 = REG_75; // @[tage.scala 351:37]
  assign tables_2_io_update_u_2 = REG_81; // @[tage.scala 351:37]
  assign tables_2_io_update_u_3 = REG_87; // @[tage.scala 351:37]
  assign tables_3_clock = clock;
  assign tables_3_reset = reset;
  assign tables_3_io_f1_req_valid = REG_6; // @[tage.scala 225:25]
  assign tables_3_io_f1_req_pc = REG_7; // @[tage.scala 226:25]
  assign tables_3_io_f1_req_ghist = io_f1_ghist; // @[tage.scala 227:25]
  assign tables_3_io_update_mask_0 = REG_90; // @[tage.scala 345:38]
  assign tables_3_io_update_mask_1 = REG_96; // @[tage.scala 345:38]
  assign tables_3_io_update_mask_2 = REG_102; // @[tage.scala 345:38]
  assign tables_3_io_update_mask_3 = REG_108; // @[tage.scala 345:38]
  assign tables_3_io_update_taken_0 = REG_91; // @[tage.scala 346:38]
  assign tables_3_io_update_taken_1 = REG_97; // @[tage.scala 346:38]
  assign tables_3_io_update_taken_2 = REG_103; // @[tage.scala 346:38]
  assign tables_3_io_update_taken_3 = REG_109; // @[tage.scala 346:38]
  assign tables_3_io_update_alloc_0 = REG_92; // @[tage.scala 347:38]
  assign tables_3_io_update_alloc_1 = REG_98; // @[tage.scala 347:38]
  assign tables_3_io_update_alloc_2 = REG_104; // @[tage.scala 347:38]
  assign tables_3_io_update_alloc_3 = REG_110; // @[tage.scala 347:38]
  assign tables_3_io_update_old_ctr_0 = REG_93; // @[tage.scala 348:38]
  assign tables_3_io_update_old_ctr_1 = REG_99; // @[tage.scala 348:38]
  assign tables_3_io_update_old_ctr_2 = REG_105; // @[tage.scala 348:38]
  assign tables_3_io_update_old_ctr_3 = REG_111; // @[tage.scala 348:38]
  assign tables_3_io_update_pc = REG_114; // @[tage.scala 353:31]
  assign tables_3_io_update_hist = REG_115; // @[tage.scala 354:31]
  assign tables_3_io_update_u_mask_0 = REG_94; // @[tage.scala 350:37]
  assign tables_3_io_update_u_mask_1 = REG_100; // @[tage.scala 350:37]
  assign tables_3_io_update_u_mask_2 = REG_106; // @[tage.scala 350:37]
  assign tables_3_io_update_u_mask_3 = REG_112; // @[tage.scala 350:37]
  assign tables_3_io_update_u_0 = REG_95; // @[tage.scala 351:37]
  assign tables_3_io_update_u_1 = REG_101; // @[tage.scala 351:37]
  assign tables_3_io_update_u_2 = REG_107; // @[tage.scala 351:37]
  assign tables_3_io_update_u_3 = REG_113; // @[tage.scala 351:37]
  assign tables_4_clock = clock;
  assign tables_4_reset = reset;
  assign tables_4_io_f1_req_valid = REG_8; // @[tage.scala 225:25]
  assign tables_4_io_f1_req_pc = REG_9; // @[tage.scala 226:25]
  assign tables_4_io_f1_req_ghist = io_f1_ghist; // @[tage.scala 227:25]
  assign tables_4_io_update_mask_0 = REG_116; // @[tage.scala 345:38]
  assign tables_4_io_update_mask_1 = REG_122; // @[tage.scala 345:38]
  assign tables_4_io_update_mask_2 = REG_128; // @[tage.scala 345:38]
  assign tables_4_io_update_mask_3 = REG_134; // @[tage.scala 345:38]
  assign tables_4_io_update_taken_0 = REG_117; // @[tage.scala 346:38]
  assign tables_4_io_update_taken_1 = REG_123; // @[tage.scala 346:38]
  assign tables_4_io_update_taken_2 = REG_129; // @[tage.scala 346:38]
  assign tables_4_io_update_taken_3 = REG_135; // @[tage.scala 346:38]
  assign tables_4_io_update_alloc_0 = REG_118; // @[tage.scala 347:38]
  assign tables_4_io_update_alloc_1 = REG_124; // @[tage.scala 347:38]
  assign tables_4_io_update_alloc_2 = REG_130; // @[tage.scala 347:38]
  assign tables_4_io_update_alloc_3 = REG_136; // @[tage.scala 347:38]
  assign tables_4_io_update_old_ctr_0 = REG_119; // @[tage.scala 348:38]
  assign tables_4_io_update_old_ctr_1 = REG_125; // @[tage.scala 348:38]
  assign tables_4_io_update_old_ctr_2 = REG_131; // @[tage.scala 348:38]
  assign tables_4_io_update_old_ctr_3 = REG_137; // @[tage.scala 348:38]
  assign tables_4_io_update_pc = REG_140; // @[tage.scala 353:31]
  assign tables_4_io_update_hist = REG_141; // @[tage.scala 354:31]
  assign tables_4_io_update_u_mask_0 = REG_120; // @[tage.scala 350:37]
  assign tables_4_io_update_u_mask_1 = REG_126; // @[tage.scala 350:37]
  assign tables_4_io_update_u_mask_2 = REG_132; // @[tage.scala 350:37]
  assign tables_4_io_update_u_mask_3 = REG_138; // @[tage.scala 350:37]
  assign tables_4_io_update_u_0 = REG_121; // @[tage.scala 351:37]
  assign tables_4_io_update_u_1 = REG_127; // @[tage.scala 351:37]
  assign tables_4_io_update_u_2 = REG_133; // @[tage.scala 351:37]
  assign tables_4_io_update_u_3 = REG_139; // @[tage.scala 351:37]
  assign tables_5_clock = clock;
  assign tables_5_reset = reset;
  assign tables_5_io_f1_req_valid = REG_10; // @[tage.scala 225:25]
  assign tables_5_io_f1_req_pc = REG_11; // @[tage.scala 226:25]
  assign tables_5_io_f1_req_ghist = io_f1_ghist; // @[tage.scala 227:25]
  assign tables_5_io_update_mask_0 = REG_142; // @[tage.scala 345:38]
  assign tables_5_io_update_mask_1 = REG_148; // @[tage.scala 345:38]
  assign tables_5_io_update_mask_2 = REG_154; // @[tage.scala 345:38]
  assign tables_5_io_update_mask_3 = REG_160; // @[tage.scala 345:38]
  assign tables_5_io_update_taken_0 = REG_143; // @[tage.scala 346:38]
  assign tables_5_io_update_taken_1 = REG_149; // @[tage.scala 346:38]
  assign tables_5_io_update_taken_2 = REG_155; // @[tage.scala 346:38]
  assign tables_5_io_update_taken_3 = REG_161; // @[tage.scala 346:38]
  assign tables_5_io_update_alloc_0 = REG_144; // @[tage.scala 347:38]
  assign tables_5_io_update_alloc_1 = REG_150; // @[tage.scala 347:38]
  assign tables_5_io_update_alloc_2 = REG_156; // @[tage.scala 347:38]
  assign tables_5_io_update_alloc_3 = REG_162; // @[tage.scala 347:38]
  assign tables_5_io_update_old_ctr_0 = REG_145; // @[tage.scala 348:38]
  assign tables_5_io_update_old_ctr_1 = REG_151; // @[tage.scala 348:38]
  assign tables_5_io_update_old_ctr_2 = REG_157; // @[tage.scala 348:38]
  assign tables_5_io_update_old_ctr_3 = REG_163; // @[tage.scala 348:38]
  assign tables_5_io_update_pc = REG_166; // @[tage.scala 353:31]
  assign tables_5_io_update_hist = REG_167; // @[tage.scala 354:31]
  assign tables_5_io_update_u_mask_0 = REG_146; // @[tage.scala 350:37]
  assign tables_5_io_update_u_mask_1 = REG_152; // @[tage.scala 350:37]
  assign tables_5_io_update_u_mask_2 = REG_158; // @[tage.scala 350:37]
  assign tables_5_io_update_u_mask_3 = REG_164; // @[tage.scala 350:37]
  assign tables_5_io_update_u_0 = REG_147; // @[tage.scala 351:37]
  assign tables_5_io_update_u_1 = REG_153; // @[tage.scala 351:37]
  assign tables_5_io_update_u_2 = REG_159; // @[tage.scala 351:37]
  assign tables_5_io_update_u_3 = REG_165; // @[tage.scala 351:37]
  assign prng_clock = clock;
  assign prng_reset = reset;
  assign prng_io_seed_valid = 1'h0; // @[PRNG.scala 83:24]
  assign prng_io_seed_bits_0 = 1'h0;
  assign prng_io_seed_bits_1 = 1'h0;
  assign prng_io_seed_bits_2 = 1'h0;
  assign prng_io_seed_bits_3 = 1'h0;
  assign prng_io_seed_bits_4 = 1'h0;
  assign prng_io_seed_bits_5 = 1'h0;
  assign prng_io_increment = 1'h1; // @[PRNG.scala 85:23]
  assign prng_1_clock = clock;
  assign prng_1_reset = reset;
  assign prng_1_io_seed_valid = 1'h0; // @[PRNG.scala 83:24]
  assign prng_1_io_seed_bits_0 = 1'h0;
  assign prng_1_io_seed_bits_1 = 1'h0;
  assign prng_1_io_seed_bits_2 = 1'h0;
  assign prng_1_io_seed_bits_3 = 1'h0;
  assign prng_1_io_seed_bits_4 = 1'h0;
  assign prng_1_io_seed_bits_5 = 1'h0;
  assign prng_1_io_increment = 1'h1; // @[PRNG.scala 85:23]
  assign prng_2_clock = clock;
  assign prng_2_reset = reset;
  assign prng_2_io_seed_valid = 1'h0; // @[PRNG.scala 83:24]
  assign prng_2_io_seed_bits_0 = 1'h0;
  assign prng_2_io_seed_bits_1 = 1'h0;
  assign prng_2_io_seed_bits_2 = 1'h0;
  assign prng_2_io_seed_bits_3 = 1'h0;
  assign prng_2_io_seed_bits_4 = 1'h0;
  assign prng_2_io_seed_bits_5 = 1'h0;
  assign prng_2_io_increment = 1'h1; // @[PRNG.scala 85:23]
  assign prng_3_clock = clock;
  assign prng_3_reset = reset;
  assign prng_3_io_seed_valid = 1'h0; // @[PRNG.scala 83:24]
  assign prng_3_io_seed_bits_0 = 1'h0;
  assign prng_3_io_seed_bits_1 = 1'h0;
  assign prng_3_io_seed_bits_2 = 1'h0;
  assign prng_3_io_seed_bits_3 = 1'h0;
  assign prng_3_io_seed_bits_4 = 1'h0;
  assign prng_3_io_seed_bits_5 = 1'h0;
  assign prng_3_io_increment = 1'h1; // @[PRNG.scala 85:23]
  always @(posedge clock) begin
    s1_update__valid <= io_update_valid; // @[predictor.scala 184:30]
    s1_update__bits_is_mispredict_update <= io_update_bits_is_mispredict_update; // @[predictor.scala 184:30]
    s1_update__bits_is_repair_update <= io_update_bits_is_repair_update; // @[predictor.scala 184:30]
    s1_update__bits_btb_mispredicts <= io_update_bits_btb_mispredicts; // @[predictor.scala 184:30]
    s1_update__bits_pc <= io_update_bits_pc; // @[predictor.scala 184:30]
    s1_update__bits_br_mask <= io_update_bits_br_mask; // @[predictor.scala 184:30]
    s1_update__bits_cfi_idx_valid <= io_update_bits_cfi_idx_valid; // @[predictor.scala 184:30]
    s1_update__bits_cfi_idx_bits <= io_update_bits_cfi_idx_bits; // @[predictor.scala 184:30]
    s1_update__bits_cfi_taken <= io_update_bits_cfi_taken; // @[predictor.scala 184:30]
    s1_update__bits_cfi_mispredicted <= io_update_bits_cfi_mispredicted; // @[predictor.scala 184:30]
    s1_update__bits_ghist <= io_update_bits_ghist; // @[predictor.scala 184:30]
    s1_update__bits_meta <= io_update_bits_meta; // @[predictor.scala 184:30]
    REG <= io_f0_valid; // @[tage.scala 225:35]
    REG_1 <= io_f0_pc; // @[tage.scala 226:35]
    REG_2 <= io_f0_valid; // @[tage.scala 225:35]
    REG_3 <= io_f0_pc; // @[tage.scala 226:35]
    REG_4 <= io_f0_valid; // @[tage.scala 225:35]
    REG_5 <= io_f0_pc; // @[tage.scala 226:35]
    REG_6 <= io_f0_valid; // @[tage.scala 225:35]
    REG_7 <= io_f0_pc; // @[tage.scala 226:35]
    REG_8 <= io_f0_valid; // @[tage.scala 225:35]
    REG_9 <= io_f0_pc; // @[tage.scala 226:35]
    REG_10 <= io_f0_valid; // @[tage.scala 225:35]
    REG_11 <= io_f0_pc; // @[tage.scala 226:35]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_12 <= _GEN_536;
      end else begin
        REG_12 <= _GEN_96;
      end
    end else begin
      REG_12 <= _GEN_96;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1040 & _GEN_1041) begin // @[tage.scala 322:43]
          REG_13 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_13 <= _T_165;
        end
      end else begin
        REG_13 <= _T_165;
      end
    end else begin
      REG_13 <= _T_165;
    end
    REG_14 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_808; // @[tage.scala 317:128]
    REG_15 <= s1_update__bits_meta[18:16]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_16 <= _GEN_536;
      end else if (_T_668[0]) begin // @[tage.scala 333:29]
        REG_16 <= _GEN_664;
      end else begin
        REG_16 <= _GEN_96;
      end
    end else begin
      REG_16 <= _GEN_96;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1040 & _GEN_1041) begin // @[tage.scala 326:44]
          REG_17 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_17 <= _T_184;
        end
      end else if (_T_668[0]) begin // @[tage.scala 333:29]
        if (2'h0 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_17 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_17 <= _T_184;
        end
      end else begin
        REG_17 <= _T_184;
      end
    end else begin
      REG_17 <= _T_184;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_18 <= _GEN_537;
      end else begin
        REG_18 <= _GEN_228;
      end
    end else begin
      REG_18 <= _GEN_228;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1040 & _GEN_1044) begin // @[tage.scala 322:43]
          REG_19 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_19 <= _T_318;
        end
      end else begin
        REG_19 <= _T_318;
      end
    end else begin
      REG_19 <= _T_318;
    end
    REG_20 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_809; // @[tage.scala 317:128]
    REG_21 <= s1_update__bits_meta[21:19]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_22 <= _GEN_537;
      end else if (_T_668[0]) begin // @[tage.scala 333:29]
        REG_22 <= _GEN_665;
      end else begin
        REG_22 <= _GEN_228;
      end
    end else begin
      REG_22 <= _GEN_228;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1040 & _GEN_1044) begin // @[tage.scala 326:44]
          REG_23 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_23 <= _T_337;
        end
      end else if (_T_668[0]) begin // @[tage.scala 333:29]
        if (2'h1 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_23 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_23 <= _T_337;
        end
      end else begin
        REG_23 <= _T_337;
      end
    end else begin
      REG_23 <= _T_337;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_24 <= _GEN_538;
      end else begin
        REG_24 <= _GEN_360;
      end
    end else begin
      REG_24 <= _GEN_360;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1040 & _GEN_1047) begin // @[tage.scala 322:43]
          REG_25 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_25 <= _T_471;
        end
      end else begin
        REG_25 <= _T_471;
      end
    end else begin
      REG_25 <= _T_471;
    end
    REG_26 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_810; // @[tage.scala 317:128]
    REG_27 <= s1_update__bits_meta[24:22]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_28 <= _GEN_538;
      end else if (_T_668[0]) begin // @[tage.scala 333:29]
        REG_28 <= _GEN_666;
      end else begin
        REG_28 <= _GEN_360;
      end
    end else begin
      REG_28 <= _GEN_360;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1040 & _GEN_1047) begin // @[tage.scala 326:44]
          REG_29 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_29 <= _T_490;
        end
      end else if (_T_668[0]) begin // @[tage.scala 333:29]
        if (2'h2 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_29 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_29 <= _T_490;
        end
      end else begin
        REG_29 <= _T_490;
      end
    end else begin
      REG_29 <= _T_490;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_30 <= _GEN_539;
      end else begin
        REG_30 <= _GEN_492;
      end
    end else begin
      REG_30 <= _GEN_492;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1040 & _GEN_1050) begin // @[tage.scala 322:43]
          REG_31 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_31 <= _T_624;
        end
      end else begin
        REG_31 <= _T_624;
      end
    end else begin
      REG_31 <= _T_624;
    end
    REG_32 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_811; // @[tage.scala 317:128]
    REG_33 <= s1_update__bits_meta[27:25]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_34 <= _GEN_539;
      end else if (_T_668[0]) begin // @[tage.scala 333:29]
        REG_34 <= _GEN_667;
      end else begin
        REG_34 <= _GEN_492;
      end
    end else begin
      REG_34 <= _GEN_492;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1040 & _GEN_1050) begin // @[tage.scala 326:44]
          REG_35 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_35 <= _T_643;
        end
      end else if (_T_668[0]) begin // @[tage.scala 333:29]
        if (2'h3 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_35 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_35 <= _T_643;
        end
      end else begin
        REG_35 <= _T_643;
      end
    end else begin
      REG_35 <= _T_643;
    end
    REG_36 <= s1_update__bits_pc; // @[tage.scala 353:41]
    REG_37 <= s1_update__bits_ghist; // @[tage.scala 354:41]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_38 <= _GEN_540;
      end else begin
        REG_38 <= _GEN_97;
      end
    end else begin
      REG_38 <= _GEN_97;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1052 & _GEN_1041) begin // @[tage.scala 322:43]
          REG_39 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_39 <= _T_165;
        end
      end else begin
        REG_39 <= _T_165;
      end
    end else begin
      REG_39 <= _T_165;
    end
    REG_40 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_812; // @[tage.scala 317:128]
    REG_41 <= s1_update__bits_meta[18:16]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_42 <= _GEN_540;
      end else if (_T_668[1]) begin // @[tage.scala 333:29]
        REG_42 <= _GEN_680;
      end else begin
        REG_42 <= _GEN_97;
      end
    end else begin
      REG_42 <= _GEN_97;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1052 & _GEN_1041) begin // @[tage.scala 326:44]
          REG_43 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_43 <= _T_184;
        end
      end else if (_T_668[1]) begin // @[tage.scala 333:29]
        if (2'h0 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_43 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_43 <= _T_184;
        end
      end else begin
        REG_43 <= _T_184;
      end
    end else begin
      REG_43 <= _T_184;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_44 <= _GEN_541;
      end else begin
        REG_44 <= _GEN_229;
      end
    end else begin
      REG_44 <= _GEN_229;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1052 & _GEN_1044) begin // @[tage.scala 322:43]
          REG_45 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_45 <= _T_318;
        end
      end else begin
        REG_45 <= _T_318;
      end
    end else begin
      REG_45 <= _T_318;
    end
    REG_46 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_813; // @[tage.scala 317:128]
    REG_47 <= s1_update__bits_meta[21:19]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_48 <= _GEN_541;
      end else if (_T_668[1]) begin // @[tage.scala 333:29]
        REG_48 <= _GEN_681;
      end else begin
        REG_48 <= _GEN_229;
      end
    end else begin
      REG_48 <= _GEN_229;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1052 & _GEN_1044) begin // @[tage.scala 326:44]
          REG_49 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_49 <= _T_337;
        end
      end else if (_T_668[1]) begin // @[tage.scala 333:29]
        if (2'h1 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_49 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_49 <= _T_337;
        end
      end else begin
        REG_49 <= _T_337;
      end
    end else begin
      REG_49 <= _T_337;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_50 <= _GEN_542;
      end else begin
        REG_50 <= _GEN_361;
      end
    end else begin
      REG_50 <= _GEN_361;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1052 & _GEN_1047) begin // @[tage.scala 322:43]
          REG_51 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_51 <= _T_471;
        end
      end else begin
        REG_51 <= _T_471;
      end
    end else begin
      REG_51 <= _T_471;
    end
    REG_52 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_814; // @[tage.scala 317:128]
    REG_53 <= s1_update__bits_meta[24:22]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_54 <= _GEN_542;
      end else if (_T_668[1]) begin // @[tage.scala 333:29]
        REG_54 <= _GEN_682;
      end else begin
        REG_54 <= _GEN_361;
      end
    end else begin
      REG_54 <= _GEN_361;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1052 & _GEN_1047) begin // @[tage.scala 326:44]
          REG_55 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_55 <= _T_490;
        end
      end else if (_T_668[1]) begin // @[tage.scala 333:29]
        if (2'h2 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_55 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_55 <= _T_490;
        end
      end else begin
        REG_55 <= _T_490;
      end
    end else begin
      REG_55 <= _T_490;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_56 <= _GEN_543;
      end else begin
        REG_56 <= _GEN_493;
      end
    end else begin
      REG_56 <= _GEN_493;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1052 & _GEN_1050) begin // @[tage.scala 322:43]
          REG_57 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_57 <= _T_624;
        end
      end else begin
        REG_57 <= _T_624;
      end
    end else begin
      REG_57 <= _T_624;
    end
    REG_58 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_815; // @[tage.scala 317:128]
    REG_59 <= s1_update__bits_meta[27:25]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_60 <= _GEN_543;
      end else if (_T_668[1]) begin // @[tage.scala 333:29]
        REG_60 <= _GEN_683;
      end else begin
        REG_60 <= _GEN_493;
      end
    end else begin
      REG_60 <= _GEN_493;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1052 & _GEN_1050) begin // @[tage.scala 326:44]
          REG_61 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_61 <= _T_643;
        end
      end else if (_T_668[1]) begin // @[tage.scala 333:29]
        if (2'h3 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_61 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_61 <= _T_643;
        end
      end else begin
        REG_61 <= _T_643;
      end
    end else begin
      REG_61 <= _T_643;
    end
    REG_62 <= s1_update__bits_pc; // @[tage.scala 353:41]
    REG_63 <= s1_update__bits_ghist; // @[tage.scala 354:41]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_64 <= _GEN_544;
      end else begin
        REG_64 <= _GEN_98;
      end
    end else begin
      REG_64 <= _GEN_98;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1064 & _GEN_1041) begin // @[tage.scala 322:43]
          REG_65 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_65 <= _T_165;
        end
      end else begin
        REG_65 <= _T_165;
      end
    end else begin
      REG_65 <= _T_165;
    end
    REG_66 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_816; // @[tage.scala 317:128]
    REG_67 <= s1_update__bits_meta[18:16]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_68 <= _GEN_544;
      end else if (_T_668[2]) begin // @[tage.scala 333:29]
        REG_68 <= _GEN_696;
      end else begin
        REG_68 <= _GEN_98;
      end
    end else begin
      REG_68 <= _GEN_98;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1064 & _GEN_1041) begin // @[tage.scala 326:44]
          REG_69 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_69 <= _T_184;
        end
      end else if (_T_668[2]) begin // @[tage.scala 333:29]
        if (2'h0 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_69 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_69 <= _T_184;
        end
      end else begin
        REG_69 <= _T_184;
      end
    end else begin
      REG_69 <= _T_184;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_70 <= _GEN_545;
      end else begin
        REG_70 <= _GEN_230;
      end
    end else begin
      REG_70 <= _GEN_230;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1064 & _GEN_1044) begin // @[tage.scala 322:43]
          REG_71 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_71 <= _T_318;
        end
      end else begin
        REG_71 <= _T_318;
      end
    end else begin
      REG_71 <= _T_318;
    end
    REG_72 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_817; // @[tage.scala 317:128]
    REG_73 <= s1_update__bits_meta[21:19]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_74 <= _GEN_545;
      end else if (_T_668[2]) begin // @[tage.scala 333:29]
        REG_74 <= _GEN_697;
      end else begin
        REG_74 <= _GEN_230;
      end
    end else begin
      REG_74 <= _GEN_230;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1064 & _GEN_1044) begin // @[tage.scala 326:44]
          REG_75 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_75 <= _T_337;
        end
      end else if (_T_668[2]) begin // @[tage.scala 333:29]
        if (2'h1 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_75 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_75 <= _T_337;
        end
      end else begin
        REG_75 <= _T_337;
      end
    end else begin
      REG_75 <= _T_337;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_76 <= _GEN_546;
      end else begin
        REG_76 <= _GEN_362;
      end
    end else begin
      REG_76 <= _GEN_362;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1064 & _GEN_1047) begin // @[tage.scala 322:43]
          REG_77 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_77 <= _T_471;
        end
      end else begin
        REG_77 <= _T_471;
      end
    end else begin
      REG_77 <= _T_471;
    end
    REG_78 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_818; // @[tage.scala 317:128]
    REG_79 <= s1_update__bits_meta[24:22]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_80 <= _GEN_546;
      end else if (_T_668[2]) begin // @[tage.scala 333:29]
        REG_80 <= _GEN_698;
      end else begin
        REG_80 <= _GEN_362;
      end
    end else begin
      REG_80 <= _GEN_362;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1064 & _GEN_1047) begin // @[tage.scala 326:44]
          REG_81 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_81 <= _T_490;
        end
      end else if (_T_668[2]) begin // @[tage.scala 333:29]
        if (2'h2 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_81 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_81 <= _T_490;
        end
      end else begin
        REG_81 <= _T_490;
      end
    end else begin
      REG_81 <= _T_490;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_82 <= _GEN_547;
      end else begin
        REG_82 <= _GEN_494;
      end
    end else begin
      REG_82 <= _GEN_494;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1064 & _GEN_1050) begin // @[tage.scala 322:43]
          REG_83 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_83 <= _T_624;
        end
      end else begin
        REG_83 <= _T_624;
      end
    end else begin
      REG_83 <= _T_624;
    end
    REG_84 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_819; // @[tage.scala 317:128]
    REG_85 <= s1_update__bits_meta[27:25]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_86 <= _GEN_547;
      end else if (_T_668[2]) begin // @[tage.scala 333:29]
        REG_86 <= _GEN_699;
      end else begin
        REG_86 <= _GEN_494;
      end
    end else begin
      REG_86 <= _GEN_494;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1064 & _GEN_1050) begin // @[tage.scala 326:44]
          REG_87 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_87 <= _T_643;
        end
      end else if (_T_668[2]) begin // @[tage.scala 333:29]
        if (2'h3 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_87 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_87 <= _T_643;
        end
      end else begin
        REG_87 <= _T_643;
      end
    end else begin
      REG_87 <= _T_643;
    end
    REG_88 <= s1_update__bits_pc; // @[tage.scala 353:41]
    REG_89 <= s1_update__bits_ghist; // @[tage.scala 354:41]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_90 <= _GEN_548;
      end else begin
        REG_90 <= _GEN_99;
      end
    end else begin
      REG_90 <= _GEN_99;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1076 & _GEN_1041) begin // @[tage.scala 322:43]
          REG_91 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_91 <= _T_165;
        end
      end else begin
        REG_91 <= _T_165;
      end
    end else begin
      REG_91 <= _T_165;
    end
    REG_92 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_820; // @[tage.scala 317:128]
    REG_93 <= s1_update__bits_meta[18:16]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_94 <= _GEN_548;
      end else if (_T_668[3]) begin // @[tage.scala 333:29]
        REG_94 <= _GEN_712;
      end else begin
        REG_94 <= _GEN_99;
      end
    end else begin
      REG_94 <= _GEN_99;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1076 & _GEN_1041) begin // @[tage.scala 326:44]
          REG_95 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_95 <= _T_184;
        end
      end else if (_T_668[3]) begin // @[tage.scala 333:29]
        if (2'h0 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_95 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_95 <= _T_184;
        end
      end else begin
        REG_95 <= _T_184;
      end
    end else begin
      REG_95 <= _T_184;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_96 <= _GEN_549;
      end else begin
        REG_96 <= _GEN_231;
      end
    end else begin
      REG_96 <= _GEN_231;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1076 & _GEN_1044) begin // @[tage.scala 322:43]
          REG_97 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_97 <= _T_318;
        end
      end else begin
        REG_97 <= _T_318;
      end
    end else begin
      REG_97 <= _T_318;
    end
    REG_98 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_821; // @[tage.scala 317:128]
    REG_99 <= s1_update__bits_meta[21:19]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_100 <= _GEN_549;
      end else if (_T_668[3]) begin // @[tage.scala 333:29]
        REG_100 <= _GEN_713;
      end else begin
        REG_100 <= _GEN_231;
      end
    end else begin
      REG_100 <= _GEN_231;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1076 & _GEN_1044) begin // @[tage.scala 326:44]
          REG_101 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_101 <= _T_337;
        end
      end else if (_T_668[3]) begin // @[tage.scala 333:29]
        if (2'h1 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_101 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_101 <= _T_337;
        end
      end else begin
        REG_101 <= _T_337;
      end
    end else begin
      REG_101 <= _T_337;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_102 <= _GEN_550;
      end else begin
        REG_102 <= _GEN_363;
      end
    end else begin
      REG_102 <= _GEN_363;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1076 & _GEN_1047) begin // @[tage.scala 322:43]
          REG_103 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_103 <= _T_471;
        end
      end else begin
        REG_103 <= _T_471;
      end
    end else begin
      REG_103 <= _T_471;
    end
    REG_104 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_822; // @[tage.scala 317:128]
    REG_105 <= s1_update__bits_meta[24:22]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_106 <= _GEN_550;
      end else if (_T_668[3]) begin // @[tage.scala 333:29]
        REG_106 <= _GEN_714;
      end else begin
        REG_106 <= _GEN_363;
      end
    end else begin
      REG_106 <= _GEN_363;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1076 & _GEN_1047) begin // @[tage.scala 326:44]
          REG_107 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_107 <= _T_490;
        end
      end else if (_T_668[3]) begin // @[tage.scala 333:29]
        if (2'h2 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_107 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_107 <= _T_490;
        end
      end else begin
        REG_107 <= _T_490;
      end
    end else begin
      REG_107 <= _T_490;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_108 <= _GEN_551;
      end else begin
        REG_108 <= _GEN_495;
      end
    end else begin
      REG_108 <= _GEN_495;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1076 & _GEN_1050) begin // @[tage.scala 322:43]
          REG_109 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_109 <= _T_624;
        end
      end else begin
        REG_109 <= _T_624;
      end
    end else begin
      REG_109 <= _T_624;
    end
    REG_110 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_823; // @[tage.scala 317:128]
    REG_111 <= s1_update__bits_meta[27:25]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_112 <= _GEN_551;
      end else if (_T_668[3]) begin // @[tage.scala 333:29]
        REG_112 <= _GEN_715;
      end else begin
        REG_112 <= _GEN_495;
      end
    end else begin
      REG_112 <= _GEN_495;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1076 & _GEN_1050) begin // @[tage.scala 326:44]
          REG_113 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_113 <= _T_643;
        end
      end else if (_T_668[3]) begin // @[tage.scala 333:29]
        if (2'h3 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_113 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_113 <= _T_643;
        end
      end else begin
        REG_113 <= _T_643;
      end
    end else begin
      REG_113 <= _T_643;
    end
    REG_114 <= s1_update__bits_pc; // @[tage.scala 353:41]
    REG_115 <= s1_update__bits_ghist; // @[tage.scala 354:41]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_116 <= _GEN_552;
      end else begin
        REG_116 <= _GEN_100;
      end
    end else begin
      REG_116 <= _GEN_100;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1088 & _GEN_1041) begin // @[tage.scala 322:43]
          REG_117 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_117 <= _T_165;
        end
      end else begin
        REG_117 <= _T_165;
      end
    end else begin
      REG_117 <= _T_165;
    end
    REG_118 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_824; // @[tage.scala 317:128]
    REG_119 <= s1_update__bits_meta[18:16]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_120 <= _GEN_552;
      end else if (_T_668[4]) begin // @[tage.scala 333:29]
        REG_120 <= _GEN_728;
      end else begin
        REG_120 <= _GEN_100;
      end
    end else begin
      REG_120 <= _GEN_100;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1088 & _GEN_1041) begin // @[tage.scala 326:44]
          REG_121 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_121 <= _T_184;
        end
      end else if (_T_668[4]) begin // @[tage.scala 333:29]
        if (2'h0 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_121 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_121 <= _T_184;
        end
      end else begin
        REG_121 <= _T_184;
      end
    end else begin
      REG_121 <= _T_184;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_122 <= _GEN_553;
      end else begin
        REG_122 <= _GEN_232;
      end
    end else begin
      REG_122 <= _GEN_232;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1088 & _GEN_1044) begin // @[tage.scala 322:43]
          REG_123 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_123 <= _T_318;
        end
      end else begin
        REG_123 <= _T_318;
      end
    end else begin
      REG_123 <= _T_318;
    end
    REG_124 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_825; // @[tage.scala 317:128]
    REG_125 <= s1_update__bits_meta[21:19]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_126 <= _GEN_553;
      end else if (_T_668[4]) begin // @[tage.scala 333:29]
        REG_126 <= _GEN_729;
      end else begin
        REG_126 <= _GEN_232;
      end
    end else begin
      REG_126 <= _GEN_232;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1088 & _GEN_1044) begin // @[tage.scala 326:44]
          REG_127 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_127 <= _T_337;
        end
      end else if (_T_668[4]) begin // @[tage.scala 333:29]
        if (2'h1 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_127 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_127 <= _T_337;
        end
      end else begin
        REG_127 <= _T_337;
      end
    end else begin
      REG_127 <= _T_337;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_128 <= _GEN_554;
      end else begin
        REG_128 <= _GEN_364;
      end
    end else begin
      REG_128 <= _GEN_364;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1088 & _GEN_1047) begin // @[tage.scala 322:43]
          REG_129 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_129 <= _T_471;
        end
      end else begin
        REG_129 <= _T_471;
      end
    end else begin
      REG_129 <= _T_471;
    end
    REG_130 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_826; // @[tage.scala 317:128]
    REG_131 <= s1_update__bits_meta[24:22]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_132 <= _GEN_554;
      end else if (_T_668[4]) begin // @[tage.scala 333:29]
        REG_132 <= _GEN_730;
      end else begin
        REG_132 <= _GEN_364;
      end
    end else begin
      REG_132 <= _GEN_364;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1088 & _GEN_1047) begin // @[tage.scala 326:44]
          REG_133 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_133 <= _T_490;
        end
      end else if (_T_668[4]) begin // @[tage.scala 333:29]
        if (2'h2 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_133 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_133 <= _T_490;
        end
      end else begin
        REG_133 <= _T_490;
      end
    end else begin
      REG_133 <= _T_490;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_134 <= _GEN_555;
      end else begin
        REG_134 <= _GEN_496;
      end
    end else begin
      REG_134 <= _GEN_496;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1088 & _GEN_1050) begin // @[tage.scala 322:43]
          REG_135 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_135 <= _T_624;
        end
      end else begin
        REG_135 <= _T_624;
      end
    end else begin
      REG_135 <= _T_624;
    end
    REG_136 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_827; // @[tage.scala 317:128]
    REG_137 <= s1_update__bits_meta[27:25]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_138 <= _GEN_555;
      end else if (_T_668[4]) begin // @[tage.scala 333:29]
        REG_138 <= _GEN_731;
      end else begin
        REG_138 <= _GEN_496;
      end
    end else begin
      REG_138 <= _GEN_496;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1088 & _GEN_1050) begin // @[tage.scala 326:44]
          REG_139 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_139 <= _T_643;
        end
      end else if (_T_668[4]) begin // @[tage.scala 333:29]
        if (2'h3 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_139 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_139 <= _T_643;
        end
      end else begin
        REG_139 <= _T_643;
      end
    end else begin
      REG_139 <= _T_643;
    end
    REG_140 <= s1_update__bits_pc; // @[tage.scala 353:41]
    REG_141 <= s1_update__bits_ghist; // @[tage.scala 354:41]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_142 <= _GEN_556;
      end else begin
        REG_142 <= _GEN_101;
      end
    end else begin
      REG_142 <= _GEN_101;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1100 & _GEN_1041) begin // @[tage.scala 322:43]
          REG_143 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_143 <= _T_165;
        end
      end else begin
        REG_143 <= _T_165;
      end
    end else begin
      REG_143 <= _T_165;
    end
    REG_144 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_828; // @[tage.scala 317:128]
    REG_145 <= s1_update__bits_meta[18:16]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_146 <= _GEN_556;
      end else if (_T_668[5]) begin // @[tage.scala 333:29]
        REG_146 <= _GEN_744;
      end else begin
        REG_146 <= _GEN_101;
      end
    end else begin
      REG_146 <= _GEN_101;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1100 & _GEN_1041) begin // @[tage.scala 326:44]
          REG_147 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_147 <= _T_184;
        end
      end else if (_T_668[5]) begin // @[tage.scala 333:29]
        if (2'h0 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_147 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_147 <= _T_184;
        end
      end else begin
        REG_147 <= _T_184;
      end
    end else begin
      REG_147 <= _T_184;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_148 <= _GEN_557;
      end else begin
        REG_148 <= _GEN_233;
      end
    end else begin
      REG_148 <= _GEN_233;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1100 & _GEN_1044) begin // @[tage.scala 322:43]
          REG_149 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_149 <= _T_318;
        end
      end else begin
        REG_149 <= _T_318;
      end
    end else begin
      REG_149 <= _T_318;
    end
    REG_150 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_829; // @[tage.scala 317:128]
    REG_151 <= s1_update__bits_meta[21:19]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_152 <= _GEN_557;
      end else if (_T_668[5]) begin // @[tage.scala 333:29]
        REG_152 <= _GEN_745;
      end else begin
        REG_152 <= _GEN_233;
      end
    end else begin
      REG_152 <= _GEN_233;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1100 & _GEN_1044) begin // @[tage.scala 326:44]
          REG_153 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_153 <= _T_337;
        end
      end else if (_T_668[5]) begin // @[tage.scala 333:29]
        if (2'h1 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_153 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_153 <= _T_337;
        end
      end else begin
        REG_153 <= _T_337;
      end
    end else begin
      REG_153 <= _T_337;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_154 <= _GEN_558;
      end else begin
        REG_154 <= _GEN_365;
      end
    end else begin
      REG_154 <= _GEN_365;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1100 & _GEN_1047) begin // @[tage.scala 322:43]
          REG_155 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_155 <= _T_471;
        end
      end else begin
        REG_155 <= _T_471;
      end
    end else begin
      REG_155 <= _T_471;
    end
    REG_156 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_830; // @[tage.scala 317:128]
    REG_157 <= s1_update__bits_meta[24:22]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_158 <= _GEN_558;
      end else if (_T_668[5]) begin // @[tage.scala 333:29]
        REG_158 <= _GEN_746;
      end else begin
        REG_158 <= _GEN_365;
      end
    end else begin
      REG_158 <= _GEN_365;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1100 & _GEN_1047) begin // @[tage.scala 326:44]
          REG_159 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_159 <= _T_490;
        end
      end else if (_T_668[5]) begin // @[tage.scala 333:29]
        if (2'h2 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_159 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_159 <= _T_490;
        end
      end else begin
        REG_159 <= _T_490;
      end
    end else begin
      REG_159 <= _T_490;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_160 <= _GEN_559;
      end else begin
        REG_160 <= _GEN_497;
      end
    end else begin
      REG_160 <= _GEN_497;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1100 & _GEN_1050) begin // @[tage.scala 322:43]
          REG_161 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_161 <= _T_624;
        end
      end else begin
        REG_161 <= _T_624;
      end
    end else begin
      REG_161 <= _T_624;
    end
    REG_162 <= s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_831; // @[tage.scala 317:128]
    REG_163 <= s1_update__bits_meta[27:25]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        REG_164 <= _GEN_559;
      end else if (_T_668[5]) begin // @[tage.scala 333:29]
        REG_164 <= _GEN_747;
      end else begin
        REG_164 <= _GEN_497;
      end
    end else begin
      REG_164 <= _GEN_497;
    end
    if (s1_update__valid & _T_171 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_531) begin // @[tage.scala 320:27]
        if (_GEN_1100 & _GEN_1050) begin // @[tage.scala 326:44]
          REG_165 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_165 <= _T_643;
        end
      end else if (_T_668[5]) begin // @[tage.scala 333:29]
        if (2'h3 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 335:36]
          REG_165 <= 2'h0; // @[tage.scala 335:36]
        end else begin
          REG_165 <= _T_643;
        end
      end else begin
        REG_165 <= _T_643;
      end
    end else begin
      REG_165 <= _T_643;
    end
    REG_166 <= s1_update__bits_pc; // @[tage.scala 353:41]
    REG_167 <= s1_update__bits_ghist; // @[tage.scala 354:41]
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
  s1_update__valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_update__bits_is_mispredict_update = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s1_update__bits_is_repair_update = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_update__bits_btb_mispredicts = _RAND_3[3:0];
  _RAND_4 = {2{`RANDOM}};
  s1_update__bits_pc = _RAND_4[39:0];
  _RAND_5 = {1{`RANDOM}};
  s1_update__bits_br_mask = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  s1_update__bits_cfi_idx_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s1_update__bits_cfi_idx_bits = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  s1_update__bits_cfi_taken = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s1_update__bits_cfi_mispredicted = _RAND_9[0:0];
  _RAND_10 = {2{`RANDOM}};
  s1_update__bits_ghist = _RAND_10[63:0];
  _RAND_11 = {4{`RANDOM}};
  s1_update__bits_meta = _RAND_11[119:0];
  _RAND_12 = {1{`RANDOM}};
  REG = _RAND_12[0:0];
  _RAND_13 = {2{`RANDOM}};
  REG_1 = _RAND_13[39:0];
  _RAND_14 = {1{`RANDOM}};
  REG_2 = _RAND_14[0:0];
  _RAND_15 = {2{`RANDOM}};
  REG_3 = _RAND_15[39:0];
  _RAND_16 = {1{`RANDOM}};
  REG_4 = _RAND_16[0:0];
  _RAND_17 = {2{`RANDOM}};
  REG_5 = _RAND_17[39:0];
  _RAND_18 = {1{`RANDOM}};
  REG_6 = _RAND_18[0:0];
  _RAND_19 = {2{`RANDOM}};
  REG_7 = _RAND_19[39:0];
  _RAND_20 = {1{`RANDOM}};
  REG_8 = _RAND_20[0:0];
  _RAND_21 = {2{`RANDOM}};
  REG_9 = _RAND_21[39:0];
  _RAND_22 = {1{`RANDOM}};
  REG_10 = _RAND_22[0:0];
  _RAND_23 = {2{`RANDOM}};
  REG_11 = _RAND_23[39:0];
  _RAND_24 = {1{`RANDOM}};
  REG_12 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  REG_13 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  REG_14 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  REG_15 = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  REG_16 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  REG_17 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  REG_18 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  REG_19 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  REG_20 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  REG_21 = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  REG_22 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  REG_23 = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  REG_24 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  REG_25 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  REG_26 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  REG_27 = _RAND_39[2:0];
  _RAND_40 = {1{`RANDOM}};
  REG_28 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  REG_29 = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  REG_30 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  REG_31 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  REG_32 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  REG_33 = _RAND_45[2:0];
  _RAND_46 = {1{`RANDOM}};
  REG_34 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  REG_35 = _RAND_47[1:0];
  _RAND_48 = {2{`RANDOM}};
  REG_36 = _RAND_48[39:0];
  _RAND_49 = {2{`RANDOM}};
  REG_37 = _RAND_49[63:0];
  _RAND_50 = {1{`RANDOM}};
  REG_38 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  REG_39 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  REG_40 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  REG_41 = _RAND_53[2:0];
  _RAND_54 = {1{`RANDOM}};
  REG_42 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  REG_43 = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  REG_44 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  REG_45 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  REG_46 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  REG_47 = _RAND_59[2:0];
  _RAND_60 = {1{`RANDOM}};
  REG_48 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  REG_49 = _RAND_61[1:0];
  _RAND_62 = {1{`RANDOM}};
  REG_50 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  REG_51 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  REG_52 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  REG_53 = _RAND_65[2:0];
  _RAND_66 = {1{`RANDOM}};
  REG_54 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  REG_55 = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  REG_56 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  REG_57 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  REG_58 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  REG_59 = _RAND_71[2:0];
  _RAND_72 = {1{`RANDOM}};
  REG_60 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  REG_61 = _RAND_73[1:0];
  _RAND_74 = {2{`RANDOM}};
  REG_62 = _RAND_74[39:0];
  _RAND_75 = {2{`RANDOM}};
  REG_63 = _RAND_75[63:0];
  _RAND_76 = {1{`RANDOM}};
  REG_64 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  REG_65 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  REG_66 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  REG_67 = _RAND_79[2:0];
  _RAND_80 = {1{`RANDOM}};
  REG_68 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  REG_69 = _RAND_81[1:0];
  _RAND_82 = {1{`RANDOM}};
  REG_70 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  REG_71 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  REG_72 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  REG_73 = _RAND_85[2:0];
  _RAND_86 = {1{`RANDOM}};
  REG_74 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  REG_75 = _RAND_87[1:0];
  _RAND_88 = {1{`RANDOM}};
  REG_76 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  REG_77 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  REG_78 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  REG_79 = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  REG_80 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  REG_81 = _RAND_93[1:0];
  _RAND_94 = {1{`RANDOM}};
  REG_82 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  REG_83 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  REG_84 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  REG_85 = _RAND_97[2:0];
  _RAND_98 = {1{`RANDOM}};
  REG_86 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  REG_87 = _RAND_99[1:0];
  _RAND_100 = {2{`RANDOM}};
  REG_88 = _RAND_100[39:0];
  _RAND_101 = {2{`RANDOM}};
  REG_89 = _RAND_101[63:0];
  _RAND_102 = {1{`RANDOM}};
  REG_90 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  REG_91 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  REG_92 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  REG_93 = _RAND_105[2:0];
  _RAND_106 = {1{`RANDOM}};
  REG_94 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  REG_95 = _RAND_107[1:0];
  _RAND_108 = {1{`RANDOM}};
  REG_96 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  REG_97 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  REG_98 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  REG_99 = _RAND_111[2:0];
  _RAND_112 = {1{`RANDOM}};
  REG_100 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  REG_101 = _RAND_113[1:0];
  _RAND_114 = {1{`RANDOM}};
  REG_102 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  REG_103 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  REG_104 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  REG_105 = _RAND_117[2:0];
  _RAND_118 = {1{`RANDOM}};
  REG_106 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  REG_107 = _RAND_119[1:0];
  _RAND_120 = {1{`RANDOM}};
  REG_108 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  REG_109 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  REG_110 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  REG_111 = _RAND_123[2:0];
  _RAND_124 = {1{`RANDOM}};
  REG_112 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  REG_113 = _RAND_125[1:0];
  _RAND_126 = {2{`RANDOM}};
  REG_114 = _RAND_126[39:0];
  _RAND_127 = {2{`RANDOM}};
  REG_115 = _RAND_127[63:0];
  _RAND_128 = {1{`RANDOM}};
  REG_116 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  REG_117 = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  REG_118 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  REG_119 = _RAND_131[2:0];
  _RAND_132 = {1{`RANDOM}};
  REG_120 = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  REG_121 = _RAND_133[1:0];
  _RAND_134 = {1{`RANDOM}};
  REG_122 = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  REG_123 = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  REG_124 = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  REG_125 = _RAND_137[2:0];
  _RAND_138 = {1{`RANDOM}};
  REG_126 = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  REG_127 = _RAND_139[1:0];
  _RAND_140 = {1{`RANDOM}};
  REG_128 = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  REG_129 = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  REG_130 = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  REG_131 = _RAND_143[2:0];
  _RAND_144 = {1{`RANDOM}};
  REG_132 = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  REG_133 = _RAND_145[1:0];
  _RAND_146 = {1{`RANDOM}};
  REG_134 = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  REG_135 = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  REG_136 = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  REG_137 = _RAND_149[2:0];
  _RAND_150 = {1{`RANDOM}};
  REG_138 = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  REG_139 = _RAND_151[1:0];
  _RAND_152 = {2{`RANDOM}};
  REG_140 = _RAND_152[39:0];
  _RAND_153 = {2{`RANDOM}};
  REG_141 = _RAND_153[63:0];
  _RAND_154 = {1{`RANDOM}};
  REG_142 = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  REG_143 = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  REG_144 = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  REG_145 = _RAND_157[2:0];
  _RAND_158 = {1{`RANDOM}};
  REG_146 = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  REG_147 = _RAND_159[1:0];
  _RAND_160 = {1{`RANDOM}};
  REG_148 = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  REG_149 = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  REG_150 = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  REG_151 = _RAND_163[2:0];
  _RAND_164 = {1{`RANDOM}};
  REG_152 = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  REG_153 = _RAND_165[1:0];
  _RAND_166 = {1{`RANDOM}};
  REG_154 = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  REG_155 = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  REG_156 = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  REG_157 = _RAND_169[2:0];
  _RAND_170 = {1{`RANDOM}};
  REG_158 = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  REG_159 = _RAND_171[1:0];
  _RAND_172 = {1{`RANDOM}};
  REG_160 = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  REG_161 = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  REG_162 = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  REG_163 = _RAND_175[2:0];
  _RAND_176 = {1{`RANDOM}};
  REG_164 = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  REG_165 = _RAND_177[1:0];
  _RAND_178 = {2{`RANDOM}};
  REG_166 = _RAND_178[39:0];
  _RAND_179 = {2{`RANDOM}};
  REG_167 = _RAND_179[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
