module RenameFreeList(
  input         clock,
  input         reset,
  input         io_reqs_0,
  input         io_reqs_1,
  output        io_alloc_pregs_0_valid,
  output [6:0]  io_alloc_pregs_0_bits,
  output        io_alloc_pregs_1_valid,
  output [6:0]  io_alloc_pregs_1_bits,
  input         io_dealloc_pregs_0_valid,
  input  [6:0]  io_dealloc_pregs_0_bits,
  input         io_dealloc_pregs_1_valid,
  input  [6:0]  io_dealloc_pregs_1_bits,
  input         io_ren_br_tags_0_valid,
  input  [3:0]  io_ren_br_tags_0_bits,
  input         io_ren_br_tags_1_valid,
  input  [3:0]  io_ren_br_tags_1_bits,
  input  [11:0] io_brupdate_b1_resolve_mask,
  input  [11:0] io_brupdate_b1_mispredict_mask,
  input         io_brupdate_b2_uop_switch,
  input         io_brupdate_b2_uop_switch_off,
  input         io_brupdate_b2_uop_is_unicore,
  input  [2:0]  io_brupdate_b2_uop_shift,
  input  [1:0]  io_brupdate_b2_uop_lrs3_rtype,
  input         io_brupdate_b2_uop_rflag,
  input         io_brupdate_b2_uop_wflag,
  input  [3:0]  io_brupdate_b2_uop_prflag,
  input  [3:0]  io_brupdate_b2_uop_pwflag,
  input         io_brupdate_b2_uop_pflag_busy,
  input  [3:0]  io_brupdate_b2_uop_stale_pflag,
  input  [3:0]  io_brupdate_b2_uop_op1_sel,
  input  [3:0]  io_brupdate_b2_uop_op2_sel,
  input  [5:0]  io_brupdate_b2_uop_split_num,
  input  [5:0]  io_brupdate_b2_uop_self_index,
  input  [5:0]  io_brupdate_b2_uop_rob_inst_idx,
  input  [5:0]  io_brupdate_b2_uop_address_num,
  input  [6:0]  io_brupdate_b2_uop_uopc,
  input  [31:0] io_brupdate_b2_uop_inst,
  input  [31:0] io_brupdate_b2_uop_debug_inst,
  input         io_brupdate_b2_uop_is_rvc,
  input  [39:0] io_brupdate_b2_uop_debug_pc,
  input  [2:0]  io_brupdate_b2_uop_iq_type,
  input  [9:0]  io_brupdate_b2_uop_fu_code,
  input  [3:0]  io_brupdate_b2_uop_ctrl_br_type,
  input  [1:0]  io_brupdate_b2_uop_ctrl_op1_sel,
  input  [2:0]  io_brupdate_b2_uop_ctrl_op2_sel,
  input  [2:0]  io_brupdate_b2_uop_ctrl_imm_sel,
  input  [3:0]  io_brupdate_b2_uop_ctrl_op_fcn,
  input         io_brupdate_b2_uop_ctrl_fcn_dw,
  input  [2:0]  io_brupdate_b2_uop_ctrl_csr_cmd,
  input         io_brupdate_b2_uop_ctrl_is_load,
  input         io_brupdate_b2_uop_ctrl_is_sta,
  input         io_brupdate_b2_uop_ctrl_is_std,
  input  [1:0]  io_brupdate_b2_uop_ctrl_op3_sel,
  input  [1:0]  io_brupdate_b2_uop_iw_state,
  input         io_brupdate_b2_uop_iw_p1_poisoned,
  input         io_brupdate_b2_uop_iw_p2_poisoned,
  input         io_brupdate_b2_uop_is_br,
  input         io_brupdate_b2_uop_is_jalr,
  input         io_brupdate_b2_uop_is_jal,
  input         io_brupdate_b2_uop_is_sfb,
  input  [11:0] io_brupdate_b2_uop_br_mask,
  input  [3:0]  io_brupdate_b2_uop_br_tag,
  input  [4:0]  io_brupdate_b2_uop_ftq_idx,
  input         io_brupdate_b2_uop_edge_inst,
  input  [5:0]  io_brupdate_b2_uop_pc_lob,
  input         io_brupdate_b2_uop_taken,
  input  [19:0] io_brupdate_b2_uop_imm_packed,
  input  [11:0] io_brupdate_b2_uop_csr_addr,
  input  [5:0]  io_brupdate_b2_uop_rob_idx,
  input  [4:0]  io_brupdate_b2_uop_ldq_idx,
  input  [4:0]  io_brupdate_b2_uop_stq_idx,
  input  [1:0]  io_brupdate_b2_uop_rxq_idx,
  input  [6:0]  io_brupdate_b2_uop_pdst,
  input  [6:0]  io_brupdate_b2_uop_prs1,
  input  [6:0]  io_brupdate_b2_uop_prs2,
  input  [6:0]  io_brupdate_b2_uop_prs3,
  input  [4:0]  io_brupdate_b2_uop_ppred,
  input         io_brupdate_b2_uop_prs1_busy,
  input         io_brupdate_b2_uop_prs2_busy,
  input         io_brupdate_b2_uop_prs3_busy,
  input         io_brupdate_b2_uop_ppred_busy,
  input  [6:0]  io_brupdate_b2_uop_stale_pdst,
  input         io_brupdate_b2_uop_exception,
  input  [63:0] io_brupdate_b2_uop_exc_cause,
  input         io_brupdate_b2_uop_bypassable,
  input  [4:0]  io_brupdate_b2_uop_mem_cmd,
  input  [1:0]  io_brupdate_b2_uop_mem_size,
  input         io_brupdate_b2_uop_mem_signed,
  input         io_brupdate_b2_uop_is_fence,
  input         io_brupdate_b2_uop_is_fencei,
  input         io_brupdate_b2_uop_is_amo,
  input         io_brupdate_b2_uop_uses_ldq,
  input         io_brupdate_b2_uop_uses_stq,
  input         io_brupdate_b2_uop_is_sys_pc2epc,
  input         io_brupdate_b2_uop_is_unique,
  input         io_brupdate_b2_uop_flush_on_commit,
  input         io_brupdate_b2_uop_ldst_is_rs1,
  input  [5:0]  io_brupdate_b2_uop_ldst,
  input  [5:0]  io_brupdate_b2_uop_lrs1,
  input  [5:0]  io_brupdate_b2_uop_lrs2,
  input  [5:0]  io_brupdate_b2_uop_lrs3,
  input         io_brupdate_b2_uop_ldst_val,
  input  [1:0]  io_brupdate_b2_uop_dst_rtype,
  input  [1:0]  io_brupdate_b2_uop_lrs1_rtype,
  input  [1:0]  io_brupdate_b2_uop_lrs2_rtype,
  input         io_brupdate_b2_uop_frs3_en,
  input         io_brupdate_b2_uop_fp_val,
  input         io_brupdate_b2_uop_fp_single,
  input         io_brupdate_b2_uop_xcpt_pf_if,
  input         io_brupdate_b2_uop_xcpt_ae_if,
  input         io_brupdate_b2_uop_xcpt_ma_if,
  input         io_brupdate_b2_uop_bp_debug_if,
  input         io_brupdate_b2_uop_bp_xcpt_if,
  input  [1:0]  io_brupdate_b2_uop_debug_fsrc,
  input  [1:0]  io_brupdate_b2_uop_debug_tsrc,
  input         io_brupdate_b2_valid,
  input         io_brupdate_b2_mispredict,
  input         io_brupdate_b2_taken,
  input  [2:0]  io_brupdate_b2_cfi_type,
  input  [1:0]  io_brupdate_b2_pc_sel,
  input  [39:0] io_brupdate_b2_jalr_target,
  input  [31:0] io_brupdate_b2_target_offset,
  input         io_is_print,
  input         io_debug_pipeline_empty,
  output [79:0] io_debug_freelist,
  output [79:0] io_debug_isprlist
);
`ifdef RANDOMIZE_REG_INIT
  reg [95:0] _RAND_0;
  reg [95:0] _RAND_1;
  reg [95:0] _RAND_2;
  reg [95:0] _RAND_3;
  reg [95:0] _RAND_4;
  reg [95:0] _RAND_5;
  reg [95:0] _RAND_6;
  reg [95:0] _RAND_7;
  reg [95:0] _RAND_8;
  reg [95:0] _RAND_9;
  reg [95:0] _RAND_10;
  reg [95:0] _RAND_11;
  reg [95:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg [79:0] free_list; // @[rename-freelist.scala 53:26]
  reg [79:0] br_alloc_lists_0; // @[rename-freelist.scala 54:27]
  reg [79:0] br_alloc_lists_1; // @[rename-freelist.scala 54:27]
  reg [79:0] br_alloc_lists_2; // @[rename-freelist.scala 54:27]
  reg [79:0] br_alloc_lists_3; // @[rename-freelist.scala 54:27]
  reg [79:0] br_alloc_lists_4; // @[rename-freelist.scala 54:27]
  reg [79:0] br_alloc_lists_5; // @[rename-freelist.scala 54:27]
  reg [79:0] br_alloc_lists_6; // @[rename-freelist.scala 54:27]
  reg [79:0] br_alloc_lists_7; // @[rename-freelist.scala 54:27]
  reg [79:0] br_alloc_lists_8; // @[rename-freelist.scala 54:27]
  reg [79:0] br_alloc_lists_9; // @[rename-freelist.scala 54:27]
  reg [79:0] br_alloc_lists_10; // @[rename-freelist.scala 54:27]
  reg [79:0] br_alloc_lists_11; // @[rename-freelist.scala 54:27]
  wire [79:0] _T_81 = free_list[79] ? 80'h80000000000000000000 : 80'h0; // @[Mux.scala 47:69]
  wire [79:0] _T_82 = free_list[78] ? 80'h40000000000000000000 : _T_81; // @[Mux.scala 47:69]
  wire [79:0] _T_83 = free_list[77] ? 80'h20000000000000000000 : _T_82; // @[Mux.scala 47:69]
  wire [79:0] _T_84 = free_list[76] ? 80'h10000000000000000000 : _T_83; // @[Mux.scala 47:69]
  wire [79:0] _T_85 = free_list[75] ? 80'h8000000000000000000 : _T_84; // @[Mux.scala 47:69]
  wire [79:0] _T_86 = free_list[74] ? 80'h4000000000000000000 : _T_85; // @[Mux.scala 47:69]
  wire [79:0] _T_87 = free_list[73] ? 80'h2000000000000000000 : _T_86; // @[Mux.scala 47:69]
  wire [79:0] _T_88 = free_list[72] ? 80'h1000000000000000000 : _T_87; // @[Mux.scala 47:69]
  wire [79:0] _T_89 = free_list[71] ? 80'h800000000000000000 : _T_88; // @[Mux.scala 47:69]
  wire [79:0] _T_90 = free_list[70] ? 80'h400000000000000000 : _T_89; // @[Mux.scala 47:69]
  wire [79:0] _T_91 = free_list[69] ? 80'h200000000000000000 : _T_90; // @[Mux.scala 47:69]
  wire [79:0] _T_92 = free_list[68] ? 80'h100000000000000000 : _T_91; // @[Mux.scala 47:69]
  wire [79:0] _T_93 = free_list[67] ? 80'h80000000000000000 : _T_92; // @[Mux.scala 47:69]
  wire [79:0] _T_94 = free_list[66] ? 80'h40000000000000000 : _T_93; // @[Mux.scala 47:69]
  wire [79:0] _T_95 = free_list[65] ? 80'h20000000000000000 : _T_94; // @[Mux.scala 47:69]
  wire [79:0] _T_96 = free_list[64] ? 80'h10000000000000000 : _T_95; // @[Mux.scala 47:69]
  wire [79:0] _T_97 = free_list[63] ? 80'h8000000000000000 : _T_96; // @[Mux.scala 47:69]
  wire [79:0] _T_98 = free_list[62] ? 80'h4000000000000000 : _T_97; // @[Mux.scala 47:69]
  wire [79:0] _T_99 = free_list[61] ? 80'h2000000000000000 : _T_98; // @[Mux.scala 47:69]
  wire [79:0] _T_100 = free_list[60] ? 80'h1000000000000000 : _T_99; // @[Mux.scala 47:69]
  wire [79:0] _T_101 = free_list[59] ? 80'h800000000000000 : _T_100; // @[Mux.scala 47:69]
  wire [79:0] _T_102 = free_list[58] ? 80'h400000000000000 : _T_101; // @[Mux.scala 47:69]
  wire [79:0] _T_103 = free_list[57] ? 80'h200000000000000 : _T_102; // @[Mux.scala 47:69]
  wire [79:0] _T_104 = free_list[56] ? 80'h100000000000000 : _T_103; // @[Mux.scala 47:69]
  wire [79:0] _T_105 = free_list[55] ? 80'h80000000000000 : _T_104; // @[Mux.scala 47:69]
  wire [79:0] _T_106 = free_list[54] ? 80'h40000000000000 : _T_105; // @[Mux.scala 47:69]
  wire [79:0] _T_107 = free_list[53] ? 80'h20000000000000 : _T_106; // @[Mux.scala 47:69]
  wire [79:0] _T_108 = free_list[52] ? 80'h10000000000000 : _T_107; // @[Mux.scala 47:69]
  wire [79:0] _T_109 = free_list[51] ? 80'h8000000000000 : _T_108; // @[Mux.scala 47:69]
  wire [79:0] _T_110 = free_list[50] ? 80'h4000000000000 : _T_109; // @[Mux.scala 47:69]
  wire [79:0] _T_111 = free_list[49] ? 80'h2000000000000 : _T_110; // @[Mux.scala 47:69]
  wire [79:0] _T_112 = free_list[48] ? 80'h1000000000000 : _T_111; // @[Mux.scala 47:69]
  wire [79:0] _T_113 = free_list[47] ? 80'h800000000000 : _T_112; // @[Mux.scala 47:69]
  wire [79:0] _T_114 = free_list[46] ? 80'h400000000000 : _T_113; // @[Mux.scala 47:69]
  wire [79:0] _T_115 = free_list[45] ? 80'h200000000000 : _T_114; // @[Mux.scala 47:69]
  wire [79:0] _T_116 = free_list[44] ? 80'h100000000000 : _T_115; // @[Mux.scala 47:69]
  wire [79:0] _T_117 = free_list[43] ? 80'h80000000000 : _T_116; // @[Mux.scala 47:69]
  wire [79:0] _T_118 = free_list[42] ? 80'h40000000000 : _T_117; // @[Mux.scala 47:69]
  wire [79:0] _T_119 = free_list[41] ? 80'h20000000000 : _T_118; // @[Mux.scala 47:69]
  wire [79:0] _T_120 = free_list[40] ? 80'h10000000000 : _T_119; // @[Mux.scala 47:69]
  wire [79:0] _T_121 = free_list[39] ? 80'h8000000000 : _T_120; // @[Mux.scala 47:69]
  wire [79:0] _T_122 = free_list[38] ? 80'h4000000000 : _T_121; // @[Mux.scala 47:69]
  wire [79:0] _T_123 = free_list[37] ? 80'h2000000000 : _T_122; // @[Mux.scala 47:69]
  wire [79:0] _T_124 = free_list[36] ? 80'h1000000000 : _T_123; // @[Mux.scala 47:69]
  wire [79:0] _T_125 = free_list[35] ? 80'h800000000 : _T_124; // @[Mux.scala 47:69]
  wire [79:0] _T_126 = free_list[34] ? 80'h400000000 : _T_125; // @[Mux.scala 47:69]
  wire [79:0] _T_127 = free_list[33] ? 80'h200000000 : _T_126; // @[Mux.scala 47:69]
  wire [79:0] _T_128 = free_list[32] ? 80'h100000000 : _T_127; // @[Mux.scala 47:69]
  wire [79:0] _T_129 = free_list[31] ? 80'h80000000 : _T_128; // @[Mux.scala 47:69]
  wire [79:0] _T_130 = free_list[30] ? 80'h40000000 : _T_129; // @[Mux.scala 47:69]
  wire [79:0] _T_131 = free_list[29] ? 80'h20000000 : _T_130; // @[Mux.scala 47:69]
  wire [79:0] _T_132 = free_list[28] ? 80'h10000000 : _T_131; // @[Mux.scala 47:69]
  wire [79:0] _T_133 = free_list[27] ? 80'h8000000 : _T_132; // @[Mux.scala 47:69]
  wire [79:0] _T_134 = free_list[26] ? 80'h4000000 : _T_133; // @[Mux.scala 47:69]
  wire [79:0] _T_135 = free_list[25] ? 80'h2000000 : _T_134; // @[Mux.scala 47:69]
  wire [79:0] _T_136 = free_list[24] ? 80'h1000000 : _T_135; // @[Mux.scala 47:69]
  wire [79:0] _T_137 = free_list[23] ? 80'h800000 : _T_136; // @[Mux.scala 47:69]
  wire [79:0] _T_138 = free_list[22] ? 80'h400000 : _T_137; // @[Mux.scala 47:69]
  wire [79:0] _T_139 = free_list[21] ? 80'h200000 : _T_138; // @[Mux.scala 47:69]
  wire [79:0] _T_140 = free_list[20] ? 80'h100000 : _T_139; // @[Mux.scala 47:69]
  wire [79:0] _T_141 = free_list[19] ? 80'h80000 : _T_140; // @[Mux.scala 47:69]
  wire [79:0] _T_142 = free_list[18] ? 80'h40000 : _T_141; // @[Mux.scala 47:69]
  wire [79:0] _T_143 = free_list[17] ? 80'h20000 : _T_142; // @[Mux.scala 47:69]
  wire [79:0] _T_144 = free_list[16] ? 80'h10000 : _T_143; // @[Mux.scala 47:69]
  wire [79:0] _T_145 = free_list[15] ? 80'h8000 : _T_144; // @[Mux.scala 47:69]
  wire [79:0] _T_146 = free_list[14] ? 80'h4000 : _T_145; // @[Mux.scala 47:69]
  wire [79:0] _T_147 = free_list[13] ? 80'h2000 : _T_146; // @[Mux.scala 47:69]
  wire [79:0] _T_148 = free_list[12] ? 80'h1000 : _T_147; // @[Mux.scala 47:69]
  wire [79:0] _T_149 = free_list[11] ? 80'h800 : _T_148; // @[Mux.scala 47:69]
  wire [79:0] _T_150 = free_list[10] ? 80'h400 : _T_149; // @[Mux.scala 47:69]
  wire [79:0] _T_151 = free_list[9] ? 80'h200 : _T_150; // @[Mux.scala 47:69]
  wire [79:0] _T_152 = free_list[8] ? 80'h100 : _T_151; // @[Mux.scala 47:69]
  wire [79:0] _T_153 = free_list[7] ? 80'h80 : _T_152; // @[Mux.scala 47:69]
  wire [79:0] _T_154 = free_list[6] ? 80'h40 : _T_153; // @[Mux.scala 47:69]
  wire [79:0] _T_155 = free_list[5] ? 80'h20 : _T_154; // @[Mux.scala 47:69]
  wire [79:0] _T_156 = free_list[4] ? 80'h10 : _T_155; // @[Mux.scala 47:69]
  wire [79:0] _T_157 = free_list[3] ? 80'h8 : _T_156; // @[Mux.scala 47:69]
  wire [79:0] _T_158 = free_list[2] ? 80'h4 : _T_157; // @[Mux.scala 47:69]
  wire [79:0] _T_159 = free_list[1] ? 80'h2 : _T_158; // @[Mux.scala 47:69]
  wire [79:0] sels_0 = free_list[0] ? 80'h1 : _T_159; // @[Mux.scala 47:69]
  wire [79:0] _T_161 = ~sels_0; // @[util.scala 481:21]
  wire [79:0] _T_162 = free_list & _T_161; // @[util.scala 481:19]
  wire [79:0] _T_243 = _T_162[79] ? 80'h80000000000000000000 : 80'h0; // @[Mux.scala 47:69]
  wire [79:0] _T_244 = _T_162[78] ? 80'h40000000000000000000 : _T_243; // @[Mux.scala 47:69]
  wire [79:0] _T_245 = _T_162[77] ? 80'h20000000000000000000 : _T_244; // @[Mux.scala 47:69]
  wire [79:0] _T_246 = _T_162[76] ? 80'h10000000000000000000 : _T_245; // @[Mux.scala 47:69]
  wire [79:0] _T_247 = _T_162[75] ? 80'h8000000000000000000 : _T_246; // @[Mux.scala 47:69]
  wire [79:0] _T_248 = _T_162[74] ? 80'h4000000000000000000 : _T_247; // @[Mux.scala 47:69]
  wire [79:0] _T_249 = _T_162[73] ? 80'h2000000000000000000 : _T_248; // @[Mux.scala 47:69]
  wire [79:0] _T_250 = _T_162[72] ? 80'h1000000000000000000 : _T_249; // @[Mux.scala 47:69]
  wire [79:0] _T_251 = _T_162[71] ? 80'h800000000000000000 : _T_250; // @[Mux.scala 47:69]
  wire [79:0] _T_252 = _T_162[70] ? 80'h400000000000000000 : _T_251; // @[Mux.scala 47:69]
  wire [79:0] _T_253 = _T_162[69] ? 80'h200000000000000000 : _T_252; // @[Mux.scala 47:69]
  wire [79:0] _T_254 = _T_162[68] ? 80'h100000000000000000 : _T_253; // @[Mux.scala 47:69]
  wire [79:0] _T_255 = _T_162[67] ? 80'h80000000000000000 : _T_254; // @[Mux.scala 47:69]
  wire [79:0] _T_256 = _T_162[66] ? 80'h40000000000000000 : _T_255; // @[Mux.scala 47:69]
  wire [79:0] _T_257 = _T_162[65] ? 80'h20000000000000000 : _T_256; // @[Mux.scala 47:69]
  wire [79:0] _T_258 = _T_162[64] ? 80'h10000000000000000 : _T_257; // @[Mux.scala 47:69]
  wire [79:0] _T_259 = _T_162[63] ? 80'h8000000000000000 : _T_258; // @[Mux.scala 47:69]
  wire [79:0] _T_260 = _T_162[62] ? 80'h4000000000000000 : _T_259; // @[Mux.scala 47:69]
  wire [79:0] _T_261 = _T_162[61] ? 80'h2000000000000000 : _T_260; // @[Mux.scala 47:69]
  wire [79:0] _T_262 = _T_162[60] ? 80'h1000000000000000 : _T_261; // @[Mux.scala 47:69]
  wire [79:0] _T_263 = _T_162[59] ? 80'h800000000000000 : _T_262; // @[Mux.scala 47:69]
  wire [79:0] _T_264 = _T_162[58] ? 80'h400000000000000 : _T_263; // @[Mux.scala 47:69]
  wire [79:0] _T_265 = _T_162[57] ? 80'h200000000000000 : _T_264; // @[Mux.scala 47:69]
  wire [79:0] _T_266 = _T_162[56] ? 80'h100000000000000 : _T_265; // @[Mux.scala 47:69]
  wire [79:0] _T_267 = _T_162[55] ? 80'h80000000000000 : _T_266; // @[Mux.scala 47:69]
  wire [79:0] _T_268 = _T_162[54] ? 80'h40000000000000 : _T_267; // @[Mux.scala 47:69]
  wire [79:0] _T_269 = _T_162[53] ? 80'h20000000000000 : _T_268; // @[Mux.scala 47:69]
  wire [79:0] _T_270 = _T_162[52] ? 80'h10000000000000 : _T_269; // @[Mux.scala 47:69]
  wire [79:0] _T_271 = _T_162[51] ? 80'h8000000000000 : _T_270; // @[Mux.scala 47:69]
  wire [79:0] _T_272 = _T_162[50] ? 80'h4000000000000 : _T_271; // @[Mux.scala 47:69]
  wire [79:0] _T_273 = _T_162[49] ? 80'h2000000000000 : _T_272; // @[Mux.scala 47:69]
  wire [79:0] _T_274 = _T_162[48] ? 80'h1000000000000 : _T_273; // @[Mux.scala 47:69]
  wire [79:0] _T_275 = _T_162[47] ? 80'h800000000000 : _T_274; // @[Mux.scala 47:69]
  wire [79:0] _T_276 = _T_162[46] ? 80'h400000000000 : _T_275; // @[Mux.scala 47:69]
  wire [79:0] _T_277 = _T_162[45] ? 80'h200000000000 : _T_276; // @[Mux.scala 47:69]
  wire [79:0] _T_278 = _T_162[44] ? 80'h100000000000 : _T_277; // @[Mux.scala 47:69]
  wire [79:0] _T_279 = _T_162[43] ? 80'h80000000000 : _T_278; // @[Mux.scala 47:69]
  wire [79:0] _T_280 = _T_162[42] ? 80'h40000000000 : _T_279; // @[Mux.scala 47:69]
  wire [79:0] _T_281 = _T_162[41] ? 80'h20000000000 : _T_280; // @[Mux.scala 47:69]
  wire [79:0] _T_282 = _T_162[40] ? 80'h10000000000 : _T_281; // @[Mux.scala 47:69]
  wire [79:0] _T_283 = _T_162[39] ? 80'h8000000000 : _T_282; // @[Mux.scala 47:69]
  wire [79:0] _T_284 = _T_162[38] ? 80'h4000000000 : _T_283; // @[Mux.scala 47:69]
  wire [79:0] _T_285 = _T_162[37] ? 80'h2000000000 : _T_284; // @[Mux.scala 47:69]
  wire [79:0] _T_286 = _T_162[36] ? 80'h1000000000 : _T_285; // @[Mux.scala 47:69]
  wire [79:0] _T_287 = _T_162[35] ? 80'h800000000 : _T_286; // @[Mux.scala 47:69]
  wire [79:0] _T_288 = _T_162[34] ? 80'h400000000 : _T_287; // @[Mux.scala 47:69]
  wire [79:0] _T_289 = _T_162[33] ? 80'h200000000 : _T_288; // @[Mux.scala 47:69]
  wire [79:0] _T_290 = _T_162[32] ? 80'h100000000 : _T_289; // @[Mux.scala 47:69]
  wire [79:0] _T_291 = _T_162[31] ? 80'h80000000 : _T_290; // @[Mux.scala 47:69]
  wire [79:0] _T_292 = _T_162[30] ? 80'h40000000 : _T_291; // @[Mux.scala 47:69]
  wire [79:0] _T_293 = _T_162[29] ? 80'h20000000 : _T_292; // @[Mux.scala 47:69]
  wire [79:0] _T_294 = _T_162[28] ? 80'h10000000 : _T_293; // @[Mux.scala 47:69]
  wire [79:0] _T_295 = _T_162[27] ? 80'h8000000 : _T_294; // @[Mux.scala 47:69]
  wire [79:0] _T_296 = _T_162[26] ? 80'h4000000 : _T_295; // @[Mux.scala 47:69]
  wire [79:0] _T_297 = _T_162[25] ? 80'h2000000 : _T_296; // @[Mux.scala 47:69]
  wire [79:0] _T_298 = _T_162[24] ? 80'h1000000 : _T_297; // @[Mux.scala 47:69]
  wire [79:0] _T_299 = _T_162[23] ? 80'h800000 : _T_298; // @[Mux.scala 47:69]
  wire [79:0] _T_300 = _T_162[22] ? 80'h400000 : _T_299; // @[Mux.scala 47:69]
  wire [79:0] _T_301 = _T_162[21] ? 80'h200000 : _T_300; // @[Mux.scala 47:69]
  wire [79:0] _T_302 = _T_162[20] ? 80'h100000 : _T_301; // @[Mux.scala 47:69]
  wire [79:0] _T_303 = _T_162[19] ? 80'h80000 : _T_302; // @[Mux.scala 47:69]
  wire [79:0] _T_304 = _T_162[18] ? 80'h40000 : _T_303; // @[Mux.scala 47:69]
  wire [79:0] _T_305 = _T_162[17] ? 80'h20000 : _T_304; // @[Mux.scala 47:69]
  wire [79:0] _T_306 = _T_162[16] ? 80'h10000 : _T_305; // @[Mux.scala 47:69]
  wire [79:0] _T_307 = _T_162[15] ? 80'h8000 : _T_306; // @[Mux.scala 47:69]
  wire [79:0] _T_308 = _T_162[14] ? 80'h4000 : _T_307; // @[Mux.scala 47:69]
  wire [79:0] _T_309 = _T_162[13] ? 80'h2000 : _T_308; // @[Mux.scala 47:69]
  wire [79:0] _T_310 = _T_162[12] ? 80'h1000 : _T_309; // @[Mux.scala 47:69]
  wire [79:0] _T_311 = _T_162[11] ? 80'h800 : _T_310; // @[Mux.scala 47:69]
  wire [79:0] _T_312 = _T_162[10] ? 80'h400 : _T_311; // @[Mux.scala 47:69]
  wire [79:0] _T_313 = _T_162[9] ? 80'h200 : _T_312; // @[Mux.scala 47:69]
  wire [79:0] _T_314 = _T_162[8] ? 80'h100 : _T_313; // @[Mux.scala 47:69]
  wire [79:0] _T_315 = _T_162[7] ? 80'h80 : _T_314; // @[Mux.scala 47:69]
  wire [79:0] _T_316 = _T_162[6] ? 80'h40 : _T_315; // @[Mux.scala 47:69]
  wire [79:0] _T_317 = _T_162[5] ? 80'h20 : _T_316; // @[Mux.scala 47:69]
  wire [79:0] _T_318 = _T_162[4] ? 80'h10 : _T_317; // @[Mux.scala 47:69]
  wire [79:0] _T_319 = _T_162[3] ? 80'h8 : _T_318; // @[Mux.scala 47:69]
  wire [79:0] _T_320 = _T_162[2] ? 80'h4 : _T_319; // @[Mux.scala 47:69]
  wire [79:0] _T_321 = _T_162[1] ? 80'h2 : _T_320; // @[Mux.scala 47:69]
  wire [79:0] sels_1 = _T_162[0] ? 80'h1 : _T_321; // @[Mux.scala 47:69]
  wire [127:0] allocs_0 = 128'h1 << io_alloc_pregs_0_bits; // @[OneHot.scala 58:35]
  wire [127:0] allocs_1 = 128'h1 << io_alloc_pregs_1_bits; // @[OneHot.scala 58:35]
  wire [79:0] _T_326 = io_reqs_1 ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [127:0] _GEN_14 = {{48'd0}, _T_326}; // @[rename-freelist.scala 62:88]
  wire [127:0] alloc_masks_1 = allocs_1 & _GEN_14; // @[rename-freelist.scala 62:88]
  wire [79:0] _T_329 = io_reqs_0 ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [127:0] _GEN_15 = {{48'd0}, _T_329}; // @[rename-freelist.scala 62:88]
  wire [127:0] _T_330 = allocs_0 & _GEN_15; // @[rename-freelist.scala 62:88]
  wire [127:0] alloc_masks_0 = alloc_masks_1 | _T_330; // @[rename-freelist.scala 62:84]
  reg  REG; // @[rename-freelist.scala 84:26]
  wire  _T_547 = |sels_0; // @[rename-freelist.scala 83:27]
  wire  sel_fire_0 = (~REG | io_reqs_0) & _T_547; // @[rename-freelist.scala 88:45]
  wire [79:0] _T_332 = sel_fire_0 ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [79:0] _T_333 = sels_0 & _T_332; // @[rename-freelist.scala 65:60]
  reg  REG_1; // @[rename-freelist.scala 84:26]
  wire  _T_561 = |sels_1; // @[rename-freelist.scala 83:27]
  wire  sel_fire_1 = (~REG_1 | io_reqs_1) & _T_561; // @[rename-freelist.scala 88:45]
  wire [79:0] _T_335 = sel_fire_1 ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [79:0] _T_336 = sels_1 & _T_335; // @[rename-freelist.scala 65:60]
  wire [79:0] sel_mask = _T_333 | _T_336; // @[rename-freelist.scala 65:82]
  wire [79:0] _T_338 = io_brupdate_b2_mispredict ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [79:0] _GEN_1 = 4'h1 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_1 : br_alloc_lists_0; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [79:0] _GEN_2 = 4'h2 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_2 : _GEN_1; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [79:0] _GEN_3 = 4'h3 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_3 : _GEN_2; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [79:0] _GEN_4 = 4'h4 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_4 : _GEN_3; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [79:0] _GEN_5 = 4'h5 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_5 : _GEN_4; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [79:0] _GEN_6 = 4'h6 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_6 : _GEN_5; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [79:0] _GEN_7 = 4'h7 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_7 : _GEN_6; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [79:0] _GEN_8 = 4'h8 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_8 : _GEN_7; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [79:0] _GEN_9 = 4'h9 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_9 : _GEN_8; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [79:0] _GEN_10 = 4'ha == io_brupdate_b2_uop_br_tag ? br_alloc_lists_10 : _GEN_9; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [79:0] _GEN_11 = 4'hb == io_brupdate_b2_uop_br_tag ? br_alloc_lists_11 : _GEN_10; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [79:0] br_deallocs = _GEN_11 & _T_338; // @[rename-freelist.scala 66:63]
  wire [127:0] _T_339 = 128'h1 << io_dealloc_pregs_0_bits; // @[OneHot.scala 58:35]
  wire [79:0] _T_342 = io_dealloc_pregs_0_valid ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [79:0] _T_343 = _T_339[79:0] & _T_342; // @[rename-freelist.scala 67:79]
  wire [127:0] _T_344 = 128'h1 << io_dealloc_pregs_1_bits; // @[OneHot.scala 58:35]
  wire [79:0] _T_347 = io_dealloc_pregs_1_valid ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [79:0] _T_348 = _T_344[79:0] & _T_347; // @[rename-freelist.scala 67:79]
  wire [79:0] _T_349 = _T_343 | _T_348; // @[rename-freelist.scala 67:106]
  wire [79:0] dealloc_mask = _T_349 | br_deallocs; // @[rename-freelist.scala 67:110]
  wire [1:0] br_slots = {io_ren_br_tags_1_valid,io_ren_br_tags_0_valid}; // @[rename-freelist.scala 69:64]
  wire [15:0] _T_350 = 16'h1 << io_ren_br_tags_0_bits; // @[OneHot.scala 58:35]
  wire [15:0] _T_352 = 16'h1 << io_ren_br_tags_1_bits; // @[OneHot.scala 58:35]
  wire [1:0] _T_354 = {_T_352[0],_T_350[0]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_355 = _T_354 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_356 = |_T_355; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_359 = _T_355[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_362 = ~br_deallocs; // @[rename-freelist.scala 75:60]
  wire [79:0] _T_363 = br_alloc_lists_0 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_16 = {{48'd0}, _T_363}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_364 = _GEN_16 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_365 = _T_356 ? _T_359 : _T_364; // @[rename-freelist.scala 74:29]
  wire [1:0] _T_370 = {_T_352[1],_T_350[1]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_371 = _T_370 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_372 = |_T_371; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_375 = _T_371[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_379 = br_alloc_lists_1 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_17 = {{48'd0}, _T_379}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_380 = _GEN_17 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_381 = _T_372 ? _T_375 : _T_380; // @[rename-freelist.scala 74:29]
  wire [1:0] _T_386 = {_T_352[2],_T_350[2]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_387 = _T_386 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_388 = |_T_387; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_391 = _T_387[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_395 = br_alloc_lists_2 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_18 = {{48'd0}, _T_395}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_396 = _GEN_18 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_397 = _T_388 ? _T_391 : _T_396; // @[rename-freelist.scala 74:29]
  wire [1:0] _T_402 = {_T_352[3],_T_350[3]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_403 = _T_402 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_404 = |_T_403; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_407 = _T_403[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_411 = br_alloc_lists_3 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_19 = {{48'd0}, _T_411}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_412 = _GEN_19 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_413 = _T_404 ? _T_407 : _T_412; // @[rename-freelist.scala 74:29]
  wire [1:0] _T_418 = {_T_352[4],_T_350[4]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_419 = _T_418 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_420 = |_T_419; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_423 = _T_419[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_427 = br_alloc_lists_4 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_20 = {{48'd0}, _T_427}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_428 = _GEN_20 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_429 = _T_420 ? _T_423 : _T_428; // @[rename-freelist.scala 74:29]
  wire [1:0] _T_434 = {_T_352[5],_T_350[5]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_435 = _T_434 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_436 = |_T_435; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_439 = _T_435[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_443 = br_alloc_lists_5 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_21 = {{48'd0}, _T_443}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_444 = _GEN_21 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_445 = _T_436 ? _T_439 : _T_444; // @[rename-freelist.scala 74:29]
  wire [1:0] _T_450 = {_T_352[6],_T_350[6]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_451 = _T_450 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_452 = |_T_451; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_455 = _T_451[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_459 = br_alloc_lists_6 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_22 = {{48'd0}, _T_459}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_460 = _GEN_22 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_461 = _T_452 ? _T_455 : _T_460; // @[rename-freelist.scala 74:29]
  wire [1:0] _T_466 = {_T_352[7],_T_350[7]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_467 = _T_466 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_468 = |_T_467; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_471 = _T_467[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_475 = br_alloc_lists_7 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_23 = {{48'd0}, _T_475}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_476 = _GEN_23 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_477 = _T_468 ? _T_471 : _T_476; // @[rename-freelist.scala 74:29]
  wire [1:0] _T_482 = {_T_352[8],_T_350[8]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_483 = _T_482 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_484 = |_T_483; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_487 = _T_483[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_491 = br_alloc_lists_8 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_24 = {{48'd0}, _T_491}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_492 = _GEN_24 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_493 = _T_484 ? _T_487 : _T_492; // @[rename-freelist.scala 74:29]
  wire [1:0] _T_498 = {_T_352[9],_T_350[9]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_499 = _T_498 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_500 = |_T_499; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_503 = _T_499[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_507 = br_alloc_lists_9 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_25 = {{48'd0}, _T_507}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_508 = _GEN_25 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_509 = _T_500 ? _T_503 : _T_508; // @[rename-freelist.scala 74:29]
  wire [1:0] _T_514 = {_T_352[10],_T_350[10]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_515 = _T_514 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_516 = |_T_515; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_519 = _T_515[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_523 = br_alloc_lists_10 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_26 = {{48'd0}, _T_523}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_524 = _GEN_26 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_525 = _T_516 ? _T_519 : _T_524; // @[rename-freelist.scala 74:29]
  wire [1:0] _T_530 = {_T_352[11],_T_350[11]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_531 = _T_530 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_532 = |_T_531; // @[rename-freelist.scala 73:29]
  wire [127:0] _T_535 = _T_531[0] ? alloc_masks_1 : 128'h0; // @[Mux.scala 27:72]
  wire [79:0] _T_539 = br_alloc_lists_11 & _T_362; // @[rename-freelist.scala 75:58]
  wire [127:0] _GEN_27 = {{48'd0}, _T_539}; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_540 = _GEN_27 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [127:0] _T_541 = _T_532 ? _T_535 : _T_540; // @[rename-freelist.scala 74:29]
  wire [79:0] _T_542 = ~sel_mask; // @[rename-freelist.scala 79:29]
  wire [79:0] _T_543 = free_list & _T_542; // @[rename-freelist.scala 79:27]
  wire [79:0] _T_544 = _T_543 | dealloc_mask; // @[rename-freelist.scala 79:39]
  wire [79:0] _T_546 = _T_544 & 80'hfffffffffffffffffffe; // @[rename-freelist.scala 79:55]
  wire [15:0] hi = sels_0[79:64]; // @[OneHot.scala 30:18]
  wire [63:0] lo = sels_0[63:0]; // @[OneHot.scala 31:18]
  wire  hi_1 = |hi; // @[OneHot.scala 32:14]
  wire [63:0] _GEN_28 = {{48'd0}, hi}; // @[OneHot.scala 32:28]
  wire [63:0] _T_548 = _GEN_28 | lo; // @[OneHot.scala 32:28]
  wire [31:0] hi_2 = _T_548[63:32]; // @[OneHot.scala 30:18]
  wire [31:0] lo_1 = _T_548[31:0]; // @[OneHot.scala 31:18]
  wire  hi_3 = |hi_2; // @[OneHot.scala 32:14]
  wire [31:0] _T_549 = hi_2 | lo_1; // @[OneHot.scala 32:28]
  wire [15:0] hi_4 = _T_549[31:16]; // @[OneHot.scala 30:18]
  wire [15:0] lo_2 = _T_549[15:0]; // @[OneHot.scala 31:18]
  wire  hi_5 = |hi_4; // @[OneHot.scala 32:14]
  wire [15:0] _T_550 = hi_4 | lo_2; // @[OneHot.scala 32:28]
  wire [7:0] hi_6 = _T_550[15:8]; // @[OneHot.scala 30:18]
  wire [7:0] lo_3 = _T_550[7:0]; // @[OneHot.scala 31:18]
  wire  hi_7 = |hi_6; // @[OneHot.scala 32:14]
  wire [7:0] _T_551 = hi_6 | lo_3; // @[OneHot.scala 32:28]
  wire [3:0] hi_8 = _T_551[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] lo_4 = _T_551[3:0]; // @[OneHot.scala 31:18]
  wire  hi_9 = |hi_8; // @[OneHot.scala 32:14]
  wire [3:0] _T_552 = hi_8 | lo_4; // @[OneHot.scala 32:28]
  wire [1:0] hi_10 = _T_552[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_5 = _T_552[1:0]; // @[OneHot.scala 31:18]
  wire  hi_11 = |hi_10; // @[OneHot.scala 32:14]
  wire [1:0] _T_553 = hi_10 | lo_5; // @[OneHot.scala 32:28]
  wire  lo_6 = _T_553[1]; // @[CircuitMath.scala 30:8]
  wire [6:0] _T_554 = {hi_1,hi_3,hi_5,hi_7,hi_9,hi_11,lo_6}; // @[Cat.scala 30:58]
  reg [6:0] r; // @[Reg.scala 15:16]
  wire [15:0] hi_12 = sels_1[79:64]; // @[OneHot.scala 30:18]
  wire [63:0] lo_12 = sels_1[63:0]; // @[OneHot.scala 31:18]
  wire  hi_13 = |hi_12; // @[OneHot.scala 32:14]
  wire [63:0] _GEN_29 = {{48'd0}, hi_12}; // @[OneHot.scala 32:28]
  wire [63:0] _T_562 = _GEN_29 | lo_12; // @[OneHot.scala 32:28]
  wire [31:0] hi_14 = _T_562[63:32]; // @[OneHot.scala 30:18]
  wire [31:0] lo_13 = _T_562[31:0]; // @[OneHot.scala 31:18]
  wire  hi_15 = |hi_14; // @[OneHot.scala 32:14]
  wire [31:0] _T_563 = hi_14 | lo_13; // @[OneHot.scala 32:28]
  wire [15:0] hi_16 = _T_563[31:16]; // @[OneHot.scala 30:18]
  wire [15:0] lo_14 = _T_563[15:0]; // @[OneHot.scala 31:18]
  wire  hi_17 = |hi_16; // @[OneHot.scala 32:14]
  wire [15:0] _T_564 = hi_16 | lo_14; // @[OneHot.scala 32:28]
  wire [7:0] hi_18 = _T_564[15:8]; // @[OneHot.scala 30:18]
  wire [7:0] lo_15 = _T_564[7:0]; // @[OneHot.scala 31:18]
  wire  hi_19 = |hi_18; // @[OneHot.scala 32:14]
  wire [7:0] _T_565 = hi_18 | lo_15; // @[OneHot.scala 32:28]
  wire [3:0] hi_20 = _T_565[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] lo_16 = _T_565[3:0]; // @[OneHot.scala 31:18]
  wire  hi_21 = |hi_20; // @[OneHot.scala 32:14]
  wire [3:0] _T_566 = hi_20 | lo_16; // @[OneHot.scala 32:28]
  wire [1:0] hi_22 = _T_566[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_17 = _T_566[1:0]; // @[OneHot.scala 31:18]
  wire  hi_23 = |hi_22; // @[OneHot.scala 32:14]
  wire [1:0] _T_567 = hi_22 | lo_17; // @[OneHot.scala 32:28]
  wire  lo_18 = _T_567[1]; // @[CircuitMath.scala 30:8]
  wire [6:0] _T_568 = {hi_13,hi_15,hi_17,hi_19,hi_21,hi_23,lo_18}; // @[Cat.scala 30:58]
  reg [6:0] r_1; // @[Reg.scala 15:16]
  wire [79:0] _T_577 = io_alloc_pregs_0_valid ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [127:0] _GEN_30 = {{48'd0}, _T_577}; // @[rename-freelist.scala 94:77]
  wire [127:0] _T_578 = allocs_0 & _GEN_30; // @[rename-freelist.scala 94:77]
  wire [79:0] _T_581 = io_alloc_pregs_1_valid ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [127:0] _GEN_31 = {{48'd0}, _T_581}; // @[rename-freelist.scala 94:77]
  wire [127:0] _T_582 = allocs_1 & _GEN_31; // @[rename-freelist.scala 94:77]
  wire [127:0] _T_583 = _T_578 | _T_582; // @[rename-freelist.scala 94:104]
  wire [127:0] _GEN_32 = {{48'd0}, free_list}; // @[rename-freelist.scala 94:34]
  wire [127:0] _T_584 = _GEN_32 | _T_583; // @[rename-freelist.scala 94:34]
  wire [79:0] _T_585 = io_debug_freelist & dealloc_mask; // @[rename-freelist.scala 97:31]
  wire [1:0] _T_672 = io_debug_freelist[0] + io_debug_freelist[1]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_674 = io_debug_freelist[3] + io_debug_freelist[4]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_33 = {{1'd0}, io_debug_freelist[2]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_676 = _GEN_33 + _T_674; // @[Bitwise.scala 47:55]
  wire [2:0] _T_678 = _T_672 + _T_676[1:0]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_680 = io_debug_freelist[5] + io_debug_freelist[6]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_682 = io_debug_freelist[8] + io_debug_freelist[9]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_34 = {{1'd0}, io_debug_freelist[7]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_684 = _GEN_34 + _T_682; // @[Bitwise.scala 47:55]
  wire [2:0] _T_686 = _T_680 + _T_684[1:0]; // @[Bitwise.scala 47:55]
  wire [3:0] _T_688 = _T_678 + _T_686; // @[Bitwise.scala 47:55]
  wire [1:0] _T_690 = io_debug_freelist[10] + io_debug_freelist[11]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_692 = io_debug_freelist[13] + io_debug_freelist[14]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_35 = {{1'd0}, io_debug_freelist[12]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_694 = _GEN_35 + _T_692; // @[Bitwise.scala 47:55]
  wire [2:0] _T_696 = _T_690 + _T_694[1:0]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_698 = io_debug_freelist[15] + io_debug_freelist[16]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_700 = io_debug_freelist[18] + io_debug_freelist[19]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_36 = {{1'd0}, io_debug_freelist[17]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_702 = _GEN_36 + _T_700; // @[Bitwise.scala 47:55]
  wire [2:0] _T_704 = _T_698 + _T_702[1:0]; // @[Bitwise.scala 47:55]
  wire [3:0] _T_706 = _T_696 + _T_704; // @[Bitwise.scala 47:55]
  wire [4:0] _T_708 = _T_688 + _T_706; // @[Bitwise.scala 47:55]
  wire [1:0] _T_710 = io_debug_freelist[20] + io_debug_freelist[21]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_712 = io_debug_freelist[23] + io_debug_freelist[24]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_37 = {{1'd0}, io_debug_freelist[22]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_714 = _GEN_37 + _T_712; // @[Bitwise.scala 47:55]
  wire [2:0] _T_716 = _T_710 + _T_714[1:0]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_718 = io_debug_freelist[25] + io_debug_freelist[26]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_720 = io_debug_freelist[28] + io_debug_freelist[29]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_38 = {{1'd0}, io_debug_freelist[27]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_722 = _GEN_38 + _T_720; // @[Bitwise.scala 47:55]
  wire [2:0] _T_724 = _T_718 + _T_722[1:0]; // @[Bitwise.scala 47:55]
  wire [3:0] _T_726 = _T_716 + _T_724; // @[Bitwise.scala 47:55]
  wire [1:0] _T_728 = io_debug_freelist[30] + io_debug_freelist[31]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_730 = io_debug_freelist[33] + io_debug_freelist[34]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_39 = {{1'd0}, io_debug_freelist[32]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_732 = _GEN_39 + _T_730; // @[Bitwise.scala 47:55]
  wire [2:0] _T_734 = _T_728 + _T_732[1:0]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_736 = io_debug_freelist[35] + io_debug_freelist[36]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_738 = io_debug_freelist[38] + io_debug_freelist[39]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_40 = {{1'd0}, io_debug_freelist[37]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_740 = _GEN_40 + _T_738; // @[Bitwise.scala 47:55]
  wire [2:0] _T_742 = _T_736 + _T_740[1:0]; // @[Bitwise.scala 47:55]
  wire [3:0] _T_744 = _T_734 + _T_742; // @[Bitwise.scala 47:55]
  wire [4:0] _T_746 = _T_726 + _T_744; // @[Bitwise.scala 47:55]
  wire [5:0] _T_748 = _T_708 + _T_746; // @[Bitwise.scala 47:55]
  wire [1:0] _T_750 = io_debug_freelist[40] + io_debug_freelist[41]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_752 = io_debug_freelist[43] + io_debug_freelist[44]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_41 = {{1'd0}, io_debug_freelist[42]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_754 = _GEN_41 + _T_752; // @[Bitwise.scala 47:55]
  wire [2:0] _T_756 = _T_750 + _T_754[1:0]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_758 = io_debug_freelist[45] + io_debug_freelist[46]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_760 = io_debug_freelist[48] + io_debug_freelist[49]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_42 = {{1'd0}, io_debug_freelist[47]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_762 = _GEN_42 + _T_760; // @[Bitwise.scala 47:55]
  wire [2:0] _T_764 = _T_758 + _T_762[1:0]; // @[Bitwise.scala 47:55]
  wire [3:0] _T_766 = _T_756 + _T_764; // @[Bitwise.scala 47:55]
  wire [1:0] _T_768 = io_debug_freelist[50] + io_debug_freelist[51]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_770 = io_debug_freelist[53] + io_debug_freelist[54]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_43 = {{1'd0}, io_debug_freelist[52]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_772 = _GEN_43 + _T_770; // @[Bitwise.scala 47:55]
  wire [2:0] _T_774 = _T_768 + _T_772[1:0]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_776 = io_debug_freelist[55] + io_debug_freelist[56]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_778 = io_debug_freelist[58] + io_debug_freelist[59]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_44 = {{1'd0}, io_debug_freelist[57]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_780 = _GEN_44 + _T_778; // @[Bitwise.scala 47:55]
  wire [2:0] _T_782 = _T_776 + _T_780[1:0]; // @[Bitwise.scala 47:55]
  wire [3:0] _T_784 = _T_774 + _T_782; // @[Bitwise.scala 47:55]
  wire [4:0] _T_786 = _T_766 + _T_784; // @[Bitwise.scala 47:55]
  wire [1:0] _T_788 = io_debug_freelist[60] + io_debug_freelist[61]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_790 = io_debug_freelist[63] + io_debug_freelist[64]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_45 = {{1'd0}, io_debug_freelist[62]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_792 = _GEN_45 + _T_790; // @[Bitwise.scala 47:55]
  wire [2:0] _T_794 = _T_788 + _T_792[1:0]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_796 = io_debug_freelist[65] + io_debug_freelist[66]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_798 = io_debug_freelist[68] + io_debug_freelist[69]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_46 = {{1'd0}, io_debug_freelist[67]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_800 = _GEN_46 + _T_798; // @[Bitwise.scala 47:55]
  wire [2:0] _T_802 = _T_796 + _T_800[1:0]; // @[Bitwise.scala 47:55]
  wire [3:0] _T_804 = _T_794 + _T_802; // @[Bitwise.scala 47:55]
  wire [1:0] _T_806 = io_debug_freelist[70] + io_debug_freelist[71]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_808 = io_debug_freelist[73] + io_debug_freelist[74]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_47 = {{1'd0}, io_debug_freelist[72]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_810 = _GEN_47 + _T_808; // @[Bitwise.scala 47:55]
  wire [2:0] _T_812 = _T_806 + _T_810[1:0]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_814 = io_debug_freelist[75] + io_debug_freelist[76]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_816 = io_debug_freelist[78] + io_debug_freelist[79]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_48 = {{1'd0}, io_debug_freelist[77]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_818 = _GEN_48 + _T_816; // @[Bitwise.scala 47:55]
  wire [2:0] _T_820 = _T_814 + _T_818[1:0]; // @[Bitwise.scala 47:55]
  wire [3:0] _T_822 = _T_812 + _T_820; // @[Bitwise.scala 47:55]
  wire [4:0] _T_824 = _T_804 + _T_822; // @[Bitwise.scala 47:55]
  wire [5:0] _T_826 = _T_786 + _T_824; // @[Bitwise.scala 47:55]
  wire [6:0] _T_828 = _T_748 + _T_826; // @[Bitwise.scala 47:55]
  assign io_alloc_pregs_0_valid = REG; // @[rename-freelist.scala 91:29]
  assign io_alloc_pregs_0_bits = r; // @[rename-freelist.scala 90:29]
  assign io_alloc_pregs_1_valid = REG_1; // @[rename-freelist.scala 91:29]
  assign io_alloc_pregs_1_bits = r_1; // @[rename-freelist.scala 90:29]
  assign io_debug_freelist = _T_584[79:0]; // @[rename-freelist.scala 94:21]
  assign io_debug_isprlist = 80'h0; // @[rename-freelist.scala 95:21]
  always @(posedge clock) begin
    if (reset) begin // @[rename-freelist.scala 53:26]
      free_list <= 80'hfffffffffffffffffffe; // @[rename-freelist.scala 53:26]
    end else begin
      free_list <= _T_546; // @[rename-freelist.scala 79:13]
    end
    br_alloc_lists_0 <= _T_365[79:0]; // @[rename-freelist.scala 74:23]
    br_alloc_lists_1 <= _T_381[79:0]; // @[rename-freelist.scala 74:23]
    br_alloc_lists_2 <= _T_397[79:0]; // @[rename-freelist.scala 74:23]
    br_alloc_lists_3 <= _T_413[79:0]; // @[rename-freelist.scala 74:23]
    br_alloc_lists_4 <= _T_429[79:0]; // @[rename-freelist.scala 74:23]
    br_alloc_lists_5 <= _T_445[79:0]; // @[rename-freelist.scala 74:23]
    br_alloc_lists_6 <= _T_461[79:0]; // @[rename-freelist.scala 74:23]
    br_alloc_lists_7 <= _T_477[79:0]; // @[rename-freelist.scala 74:23]
    br_alloc_lists_8 <= _T_493[79:0]; // @[rename-freelist.scala 74:23]
    br_alloc_lists_9 <= _T_509[79:0]; // @[rename-freelist.scala 74:23]
    br_alloc_lists_10 <= _T_525[79:0]; // @[rename-freelist.scala 74:23]
    br_alloc_lists_11 <= _T_541[79:0]; // @[rename-freelist.scala 74:23]
    if (reset) begin // @[rename-freelist.scala 84:26]
      REG <= 1'h0; // @[rename-freelist.scala 84:26]
    end else begin
      REG <= REG & ~io_reqs_0 | _T_547; // @[rename-freelist.scala 87:13]
    end
    if (reset) begin // @[rename-freelist.scala 84:26]
      REG_1 <= 1'h0; // @[rename-freelist.scala 84:26]
    end else begin
      REG_1 <= REG_1 & ~io_reqs_1 | _T_561; // @[rename-freelist.scala 87:13]
    end
    if (sel_fire_0) begin // @[Reg.scala 16:19]
      r <= _T_554; // @[Reg.scala 16:23]
    end
    if (sel_fire_1) begin // @[Reg.scala 16:19]
      r_1 <= _T_568; // @[Reg.scala 16:23]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(|_T_585) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [freelist] Returning a free physical register.\n    at rename-freelist.scala:97 assert (!(io.debug.freelist & dealloc_mask).orR, \"[freelist] Returning a free physical register.\")\n"
            ); // @[rename-freelist.scala 97:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(|_T_585) | reset)) begin
          $fatal; // @[rename-freelist.scala 97:10]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~io_debug_pipeline_empty | _T_828 >= 7'h2b | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [freelist] Leaking physical registers.\n    at rename-freelist.scala:98 assert (!io.debug.pipeline_empty || PopCount(io.debug.freelist) >= (numPregs - numLregs - 1).U,\n"
            ); // @[rename-freelist.scala 98:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~io_debug_pipeline_empty | _T_828 >= 7'h2b | reset)) begin
          $fatal; // @[rename-freelist.scala 98:10]
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
  _RAND_0 = {3{`RANDOM}};
  free_list = _RAND_0[79:0];
  _RAND_1 = {3{`RANDOM}};
  br_alloc_lists_0 = _RAND_1[79:0];
  _RAND_2 = {3{`RANDOM}};
  br_alloc_lists_1 = _RAND_2[79:0];
  _RAND_3 = {3{`RANDOM}};
  br_alloc_lists_2 = _RAND_3[79:0];
  _RAND_4 = {3{`RANDOM}};
  br_alloc_lists_3 = _RAND_4[79:0];
  _RAND_5 = {3{`RANDOM}};
  br_alloc_lists_4 = _RAND_5[79:0];
  _RAND_6 = {3{`RANDOM}};
  br_alloc_lists_5 = _RAND_6[79:0];
  _RAND_7 = {3{`RANDOM}};
  br_alloc_lists_6 = _RAND_7[79:0];
  _RAND_8 = {3{`RANDOM}};
  br_alloc_lists_7 = _RAND_8[79:0];
  _RAND_9 = {3{`RANDOM}};
  br_alloc_lists_8 = _RAND_9[79:0];
  _RAND_10 = {3{`RANDOM}};
  br_alloc_lists_9 = _RAND_10[79:0];
  _RAND_11 = {3{`RANDOM}};
  br_alloc_lists_10 = _RAND_11[79:0];
  _RAND_12 = {3{`RANDOM}};
  br_alloc_lists_11 = _RAND_12[79:0];
  _RAND_13 = {1{`RANDOM}};
  REG = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  REG_1 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  r = _RAND_15[6:0];
  _RAND_16 = {1{`RANDOM}};
  r_1 = _RAND_16[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
