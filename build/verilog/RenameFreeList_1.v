module RenameFreeList_1(
  input         clock,
  input         reset,
  input         io_reqs_0,
  input         io_reqs_1,
  output        io_alloc_pregs_0_valid,
  output [5:0]  io_alloc_pregs_0_bits,
  output        io_alloc_pregs_1_valid,
  output [5:0]  io_alloc_pregs_1_bits,
  input         io_dealloc_pregs_0_valid,
  input  [5:0]  io_dealloc_pregs_0_bits,
  input         io_dealloc_pregs_1_valid,
  input  [5:0]  io_dealloc_pregs_1_bits,
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
  output [63:0] io_debug_freelist,
  output [63:0] io_debug_isprlist
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
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] free_list; // @[rename-freelist.scala 53:26]
  reg [63:0] br_alloc_lists_0; // @[rename-freelist.scala 54:27]
  reg [63:0] br_alloc_lists_1; // @[rename-freelist.scala 54:27]
  reg [63:0] br_alloc_lists_2; // @[rename-freelist.scala 54:27]
  reg [63:0] br_alloc_lists_3; // @[rename-freelist.scala 54:27]
  reg [63:0] br_alloc_lists_4; // @[rename-freelist.scala 54:27]
  reg [63:0] br_alloc_lists_5; // @[rename-freelist.scala 54:27]
  reg [63:0] br_alloc_lists_6; // @[rename-freelist.scala 54:27]
  reg [63:0] br_alloc_lists_7; // @[rename-freelist.scala 54:27]
  reg [63:0] br_alloc_lists_8; // @[rename-freelist.scala 54:27]
  reg [63:0] br_alloc_lists_9; // @[rename-freelist.scala 54:27]
  reg [63:0] br_alloc_lists_10; // @[rename-freelist.scala 54:27]
  reg [63:0] br_alloc_lists_11; // @[rename-freelist.scala 54:27]
  wire [63:0] _T_65 = free_list[63] ? 64'h8000000000000000 : 64'h0; // @[Mux.scala 47:69]
  wire [63:0] _T_66 = free_list[62] ? 64'h4000000000000000 : _T_65; // @[Mux.scala 47:69]
  wire [63:0] _T_67 = free_list[61] ? 64'h2000000000000000 : _T_66; // @[Mux.scala 47:69]
  wire [63:0] _T_68 = free_list[60] ? 64'h1000000000000000 : _T_67; // @[Mux.scala 47:69]
  wire [63:0] _T_69 = free_list[59] ? 64'h800000000000000 : _T_68; // @[Mux.scala 47:69]
  wire [63:0] _T_70 = free_list[58] ? 64'h400000000000000 : _T_69; // @[Mux.scala 47:69]
  wire [63:0] _T_71 = free_list[57] ? 64'h200000000000000 : _T_70; // @[Mux.scala 47:69]
  wire [63:0] _T_72 = free_list[56] ? 64'h100000000000000 : _T_71; // @[Mux.scala 47:69]
  wire [63:0] _T_73 = free_list[55] ? 64'h80000000000000 : _T_72; // @[Mux.scala 47:69]
  wire [63:0] _T_74 = free_list[54] ? 64'h40000000000000 : _T_73; // @[Mux.scala 47:69]
  wire [63:0] _T_75 = free_list[53] ? 64'h20000000000000 : _T_74; // @[Mux.scala 47:69]
  wire [63:0] _T_76 = free_list[52] ? 64'h10000000000000 : _T_75; // @[Mux.scala 47:69]
  wire [63:0] _T_77 = free_list[51] ? 64'h8000000000000 : _T_76; // @[Mux.scala 47:69]
  wire [63:0] _T_78 = free_list[50] ? 64'h4000000000000 : _T_77; // @[Mux.scala 47:69]
  wire [63:0] _T_79 = free_list[49] ? 64'h2000000000000 : _T_78; // @[Mux.scala 47:69]
  wire [63:0] _T_80 = free_list[48] ? 64'h1000000000000 : _T_79; // @[Mux.scala 47:69]
  wire [63:0] _T_81 = free_list[47] ? 64'h800000000000 : _T_80; // @[Mux.scala 47:69]
  wire [63:0] _T_82 = free_list[46] ? 64'h400000000000 : _T_81; // @[Mux.scala 47:69]
  wire [63:0] _T_83 = free_list[45] ? 64'h200000000000 : _T_82; // @[Mux.scala 47:69]
  wire [63:0] _T_84 = free_list[44] ? 64'h100000000000 : _T_83; // @[Mux.scala 47:69]
  wire [63:0] _T_85 = free_list[43] ? 64'h80000000000 : _T_84; // @[Mux.scala 47:69]
  wire [63:0] _T_86 = free_list[42] ? 64'h40000000000 : _T_85; // @[Mux.scala 47:69]
  wire [63:0] _T_87 = free_list[41] ? 64'h20000000000 : _T_86; // @[Mux.scala 47:69]
  wire [63:0] _T_88 = free_list[40] ? 64'h10000000000 : _T_87; // @[Mux.scala 47:69]
  wire [63:0] _T_89 = free_list[39] ? 64'h8000000000 : _T_88; // @[Mux.scala 47:69]
  wire [63:0] _T_90 = free_list[38] ? 64'h4000000000 : _T_89; // @[Mux.scala 47:69]
  wire [63:0] _T_91 = free_list[37] ? 64'h2000000000 : _T_90; // @[Mux.scala 47:69]
  wire [63:0] _T_92 = free_list[36] ? 64'h1000000000 : _T_91; // @[Mux.scala 47:69]
  wire [63:0] _T_93 = free_list[35] ? 64'h800000000 : _T_92; // @[Mux.scala 47:69]
  wire [63:0] _T_94 = free_list[34] ? 64'h400000000 : _T_93; // @[Mux.scala 47:69]
  wire [63:0] _T_95 = free_list[33] ? 64'h200000000 : _T_94; // @[Mux.scala 47:69]
  wire [63:0] _T_96 = free_list[32] ? 64'h100000000 : _T_95; // @[Mux.scala 47:69]
  wire [63:0] _T_97 = free_list[31] ? 64'h80000000 : _T_96; // @[Mux.scala 47:69]
  wire [63:0] _T_98 = free_list[30] ? 64'h40000000 : _T_97; // @[Mux.scala 47:69]
  wire [63:0] _T_99 = free_list[29] ? 64'h20000000 : _T_98; // @[Mux.scala 47:69]
  wire [63:0] _T_100 = free_list[28] ? 64'h10000000 : _T_99; // @[Mux.scala 47:69]
  wire [63:0] _T_101 = free_list[27] ? 64'h8000000 : _T_100; // @[Mux.scala 47:69]
  wire [63:0] _T_102 = free_list[26] ? 64'h4000000 : _T_101; // @[Mux.scala 47:69]
  wire [63:0] _T_103 = free_list[25] ? 64'h2000000 : _T_102; // @[Mux.scala 47:69]
  wire [63:0] _T_104 = free_list[24] ? 64'h1000000 : _T_103; // @[Mux.scala 47:69]
  wire [63:0] _T_105 = free_list[23] ? 64'h800000 : _T_104; // @[Mux.scala 47:69]
  wire [63:0] _T_106 = free_list[22] ? 64'h400000 : _T_105; // @[Mux.scala 47:69]
  wire [63:0] _T_107 = free_list[21] ? 64'h200000 : _T_106; // @[Mux.scala 47:69]
  wire [63:0] _T_108 = free_list[20] ? 64'h100000 : _T_107; // @[Mux.scala 47:69]
  wire [63:0] _T_109 = free_list[19] ? 64'h80000 : _T_108; // @[Mux.scala 47:69]
  wire [63:0] _T_110 = free_list[18] ? 64'h40000 : _T_109; // @[Mux.scala 47:69]
  wire [63:0] _T_111 = free_list[17] ? 64'h20000 : _T_110; // @[Mux.scala 47:69]
  wire [63:0] _T_112 = free_list[16] ? 64'h10000 : _T_111; // @[Mux.scala 47:69]
  wire [63:0] _T_113 = free_list[15] ? 64'h8000 : _T_112; // @[Mux.scala 47:69]
  wire [63:0] _T_114 = free_list[14] ? 64'h4000 : _T_113; // @[Mux.scala 47:69]
  wire [63:0] _T_115 = free_list[13] ? 64'h2000 : _T_114; // @[Mux.scala 47:69]
  wire [63:0] _T_116 = free_list[12] ? 64'h1000 : _T_115; // @[Mux.scala 47:69]
  wire [63:0] _T_117 = free_list[11] ? 64'h800 : _T_116; // @[Mux.scala 47:69]
  wire [63:0] _T_118 = free_list[10] ? 64'h400 : _T_117; // @[Mux.scala 47:69]
  wire [63:0] _T_119 = free_list[9] ? 64'h200 : _T_118; // @[Mux.scala 47:69]
  wire [63:0] _T_120 = free_list[8] ? 64'h100 : _T_119; // @[Mux.scala 47:69]
  wire [63:0] _T_121 = free_list[7] ? 64'h80 : _T_120; // @[Mux.scala 47:69]
  wire [63:0] _T_122 = free_list[6] ? 64'h40 : _T_121; // @[Mux.scala 47:69]
  wire [63:0] _T_123 = free_list[5] ? 64'h20 : _T_122; // @[Mux.scala 47:69]
  wire [63:0] _T_124 = free_list[4] ? 64'h10 : _T_123; // @[Mux.scala 47:69]
  wire [63:0] _T_125 = free_list[3] ? 64'h8 : _T_124; // @[Mux.scala 47:69]
  wire [63:0] _T_126 = free_list[2] ? 64'h4 : _T_125; // @[Mux.scala 47:69]
  wire [63:0] _T_127 = free_list[1] ? 64'h2 : _T_126; // @[Mux.scala 47:69]
  wire [63:0] sels_0 = free_list[0] ? 64'h1 : _T_127; // @[Mux.scala 47:69]
  wire [63:0] _T_129 = ~sels_0; // @[util.scala 481:21]
  wire [63:0] _T_130 = free_list & _T_129; // @[util.scala 481:19]
  wire [63:0] _T_195 = _T_130[63] ? 64'h8000000000000000 : 64'h0; // @[Mux.scala 47:69]
  wire [63:0] _T_196 = _T_130[62] ? 64'h4000000000000000 : _T_195; // @[Mux.scala 47:69]
  wire [63:0] _T_197 = _T_130[61] ? 64'h2000000000000000 : _T_196; // @[Mux.scala 47:69]
  wire [63:0] _T_198 = _T_130[60] ? 64'h1000000000000000 : _T_197; // @[Mux.scala 47:69]
  wire [63:0] _T_199 = _T_130[59] ? 64'h800000000000000 : _T_198; // @[Mux.scala 47:69]
  wire [63:0] _T_200 = _T_130[58] ? 64'h400000000000000 : _T_199; // @[Mux.scala 47:69]
  wire [63:0] _T_201 = _T_130[57] ? 64'h200000000000000 : _T_200; // @[Mux.scala 47:69]
  wire [63:0] _T_202 = _T_130[56] ? 64'h100000000000000 : _T_201; // @[Mux.scala 47:69]
  wire [63:0] _T_203 = _T_130[55] ? 64'h80000000000000 : _T_202; // @[Mux.scala 47:69]
  wire [63:0] _T_204 = _T_130[54] ? 64'h40000000000000 : _T_203; // @[Mux.scala 47:69]
  wire [63:0] _T_205 = _T_130[53] ? 64'h20000000000000 : _T_204; // @[Mux.scala 47:69]
  wire [63:0] _T_206 = _T_130[52] ? 64'h10000000000000 : _T_205; // @[Mux.scala 47:69]
  wire [63:0] _T_207 = _T_130[51] ? 64'h8000000000000 : _T_206; // @[Mux.scala 47:69]
  wire [63:0] _T_208 = _T_130[50] ? 64'h4000000000000 : _T_207; // @[Mux.scala 47:69]
  wire [63:0] _T_209 = _T_130[49] ? 64'h2000000000000 : _T_208; // @[Mux.scala 47:69]
  wire [63:0] _T_210 = _T_130[48] ? 64'h1000000000000 : _T_209; // @[Mux.scala 47:69]
  wire [63:0] _T_211 = _T_130[47] ? 64'h800000000000 : _T_210; // @[Mux.scala 47:69]
  wire [63:0] _T_212 = _T_130[46] ? 64'h400000000000 : _T_211; // @[Mux.scala 47:69]
  wire [63:0] _T_213 = _T_130[45] ? 64'h200000000000 : _T_212; // @[Mux.scala 47:69]
  wire [63:0] _T_214 = _T_130[44] ? 64'h100000000000 : _T_213; // @[Mux.scala 47:69]
  wire [63:0] _T_215 = _T_130[43] ? 64'h80000000000 : _T_214; // @[Mux.scala 47:69]
  wire [63:0] _T_216 = _T_130[42] ? 64'h40000000000 : _T_215; // @[Mux.scala 47:69]
  wire [63:0] _T_217 = _T_130[41] ? 64'h20000000000 : _T_216; // @[Mux.scala 47:69]
  wire [63:0] _T_218 = _T_130[40] ? 64'h10000000000 : _T_217; // @[Mux.scala 47:69]
  wire [63:0] _T_219 = _T_130[39] ? 64'h8000000000 : _T_218; // @[Mux.scala 47:69]
  wire [63:0] _T_220 = _T_130[38] ? 64'h4000000000 : _T_219; // @[Mux.scala 47:69]
  wire [63:0] _T_221 = _T_130[37] ? 64'h2000000000 : _T_220; // @[Mux.scala 47:69]
  wire [63:0] _T_222 = _T_130[36] ? 64'h1000000000 : _T_221; // @[Mux.scala 47:69]
  wire [63:0] _T_223 = _T_130[35] ? 64'h800000000 : _T_222; // @[Mux.scala 47:69]
  wire [63:0] _T_224 = _T_130[34] ? 64'h400000000 : _T_223; // @[Mux.scala 47:69]
  wire [63:0] _T_225 = _T_130[33] ? 64'h200000000 : _T_224; // @[Mux.scala 47:69]
  wire [63:0] _T_226 = _T_130[32] ? 64'h100000000 : _T_225; // @[Mux.scala 47:69]
  wire [63:0] _T_227 = _T_130[31] ? 64'h80000000 : _T_226; // @[Mux.scala 47:69]
  wire [63:0] _T_228 = _T_130[30] ? 64'h40000000 : _T_227; // @[Mux.scala 47:69]
  wire [63:0] _T_229 = _T_130[29] ? 64'h20000000 : _T_228; // @[Mux.scala 47:69]
  wire [63:0] _T_230 = _T_130[28] ? 64'h10000000 : _T_229; // @[Mux.scala 47:69]
  wire [63:0] _T_231 = _T_130[27] ? 64'h8000000 : _T_230; // @[Mux.scala 47:69]
  wire [63:0] _T_232 = _T_130[26] ? 64'h4000000 : _T_231; // @[Mux.scala 47:69]
  wire [63:0] _T_233 = _T_130[25] ? 64'h2000000 : _T_232; // @[Mux.scala 47:69]
  wire [63:0] _T_234 = _T_130[24] ? 64'h1000000 : _T_233; // @[Mux.scala 47:69]
  wire [63:0] _T_235 = _T_130[23] ? 64'h800000 : _T_234; // @[Mux.scala 47:69]
  wire [63:0] _T_236 = _T_130[22] ? 64'h400000 : _T_235; // @[Mux.scala 47:69]
  wire [63:0] _T_237 = _T_130[21] ? 64'h200000 : _T_236; // @[Mux.scala 47:69]
  wire [63:0] _T_238 = _T_130[20] ? 64'h100000 : _T_237; // @[Mux.scala 47:69]
  wire [63:0] _T_239 = _T_130[19] ? 64'h80000 : _T_238; // @[Mux.scala 47:69]
  wire [63:0] _T_240 = _T_130[18] ? 64'h40000 : _T_239; // @[Mux.scala 47:69]
  wire [63:0] _T_241 = _T_130[17] ? 64'h20000 : _T_240; // @[Mux.scala 47:69]
  wire [63:0] _T_242 = _T_130[16] ? 64'h10000 : _T_241; // @[Mux.scala 47:69]
  wire [63:0] _T_243 = _T_130[15] ? 64'h8000 : _T_242; // @[Mux.scala 47:69]
  wire [63:0] _T_244 = _T_130[14] ? 64'h4000 : _T_243; // @[Mux.scala 47:69]
  wire [63:0] _T_245 = _T_130[13] ? 64'h2000 : _T_244; // @[Mux.scala 47:69]
  wire [63:0] _T_246 = _T_130[12] ? 64'h1000 : _T_245; // @[Mux.scala 47:69]
  wire [63:0] _T_247 = _T_130[11] ? 64'h800 : _T_246; // @[Mux.scala 47:69]
  wire [63:0] _T_248 = _T_130[10] ? 64'h400 : _T_247; // @[Mux.scala 47:69]
  wire [63:0] _T_249 = _T_130[9] ? 64'h200 : _T_248; // @[Mux.scala 47:69]
  wire [63:0] _T_250 = _T_130[8] ? 64'h100 : _T_249; // @[Mux.scala 47:69]
  wire [63:0] _T_251 = _T_130[7] ? 64'h80 : _T_250; // @[Mux.scala 47:69]
  wire [63:0] _T_252 = _T_130[6] ? 64'h40 : _T_251; // @[Mux.scala 47:69]
  wire [63:0] _T_253 = _T_130[5] ? 64'h20 : _T_252; // @[Mux.scala 47:69]
  wire [63:0] _T_254 = _T_130[4] ? 64'h10 : _T_253; // @[Mux.scala 47:69]
  wire [63:0] _T_255 = _T_130[3] ? 64'h8 : _T_254; // @[Mux.scala 47:69]
  wire [63:0] _T_256 = _T_130[2] ? 64'h4 : _T_255; // @[Mux.scala 47:69]
  wire [63:0] _T_257 = _T_130[1] ? 64'h2 : _T_256; // @[Mux.scala 47:69]
  wire [63:0] sels_1 = _T_130[0] ? 64'h1 : _T_257; // @[Mux.scala 47:69]
  wire [63:0] allocs_0 = 64'h1 << io_alloc_pregs_0_bits; // @[OneHot.scala 58:35]
  wire [63:0] allocs_1 = 64'h1 << io_alloc_pregs_1_bits; // @[OneHot.scala 58:35]
  wire [63:0] _T_262 = io_reqs_1 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] alloc_masks_1 = allocs_1 & _T_262; // @[rename-freelist.scala 62:88]
  wire [63:0] _T_265 = io_reqs_0 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_266 = allocs_0 & _T_265; // @[rename-freelist.scala 62:88]
  wire [63:0] alloc_masks_0 = alloc_masks_1 | _T_266; // @[rename-freelist.scala 62:84]
  reg  REG; // @[rename-freelist.scala 84:26]
  wire  _T_483 = |sels_0; // @[rename-freelist.scala 83:27]
  wire  sel_fire_0 = (~REG | io_reqs_0) & _T_483; // @[rename-freelist.scala 88:45]
  wire [63:0] _T_268 = sel_fire_0 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_269 = sels_0 & _T_268; // @[rename-freelist.scala 65:60]
  reg  REG_1; // @[rename-freelist.scala 84:26]
  wire  _T_496 = |sels_1; // @[rename-freelist.scala 83:27]
  wire  sel_fire_1 = (~REG_1 | io_reqs_1) & _T_496; // @[rename-freelist.scala 88:45]
  wire [63:0] _T_271 = sel_fire_1 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_272 = sels_1 & _T_271; // @[rename-freelist.scala 65:60]
  wire [63:0] sel_mask = _T_269 | _T_272; // @[rename-freelist.scala 65:82]
  wire [63:0] _T_274 = io_brupdate_b2_mispredict ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _GEN_1 = 4'h1 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_1 : br_alloc_lists_0; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [63:0] _GEN_2 = 4'h2 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_2 : _GEN_1; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [63:0] _GEN_3 = 4'h3 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_3 : _GEN_2; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [63:0] _GEN_4 = 4'h4 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_4 : _GEN_3; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [63:0] _GEN_5 = 4'h5 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_5 : _GEN_4; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [63:0] _GEN_6 = 4'h6 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_6 : _GEN_5; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [63:0] _GEN_7 = 4'h7 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_7 : _GEN_6; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [63:0] _GEN_8 = 4'h8 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_8 : _GEN_7; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [63:0] _GEN_9 = 4'h9 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_9 : _GEN_8; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [63:0] _GEN_10 = 4'ha == io_brupdate_b2_uop_br_tag ? br_alloc_lists_10 : _GEN_9; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [63:0] _GEN_11 = 4'hb == io_brupdate_b2_uop_br_tag ? br_alloc_lists_11 : _GEN_10; // @[rename-freelist.scala 66:63 rename-freelist.scala 66:63]
  wire [63:0] br_deallocs = _GEN_11 & _T_274; // @[rename-freelist.scala 66:63]
  wire [63:0] _T_275 = 64'h1 << io_dealloc_pregs_0_bits; // @[OneHot.scala 58:35]
  wire [63:0] _T_278 = io_dealloc_pregs_0_valid ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_279 = _T_275 & _T_278; // @[rename-freelist.scala 67:79]
  wire [63:0] _T_280 = 64'h1 << io_dealloc_pregs_1_bits; // @[OneHot.scala 58:35]
  wire [63:0] _T_283 = io_dealloc_pregs_1_valid ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_284 = _T_280 & _T_283; // @[rename-freelist.scala 67:79]
  wire [63:0] _T_285 = _T_279 | _T_284; // @[rename-freelist.scala 67:106]
  wire [63:0] dealloc_mask = _T_285 | br_deallocs; // @[rename-freelist.scala 67:110]
  wire [1:0] br_slots = {io_ren_br_tags_1_valid,io_ren_br_tags_0_valid}; // @[rename-freelist.scala 69:64]
  wire [15:0] _T_286 = 16'h1 << io_ren_br_tags_0_bits; // @[OneHot.scala 58:35]
  wire [15:0] _T_288 = 16'h1 << io_ren_br_tags_1_bits; // @[OneHot.scala 58:35]
  wire [1:0] _T_290 = {_T_288[0],_T_286[0]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_291 = _T_290 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_292 = |_T_291; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_298 = ~br_deallocs; // @[rename-freelist.scala 75:60]
  wire [63:0] _T_299 = br_alloc_lists_0 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_300 = _T_299 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [1:0] _T_306 = {_T_288[1],_T_286[1]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_307 = _T_306 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_308 = |_T_307; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_315 = br_alloc_lists_1 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_316 = _T_315 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [1:0] _T_322 = {_T_288[2],_T_286[2]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_323 = _T_322 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_324 = |_T_323; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_331 = br_alloc_lists_2 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_332 = _T_331 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [1:0] _T_338 = {_T_288[3],_T_286[3]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_339 = _T_338 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_340 = |_T_339; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_347 = br_alloc_lists_3 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_348 = _T_347 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [1:0] _T_354 = {_T_288[4],_T_286[4]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_355 = _T_354 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_356 = |_T_355; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_363 = br_alloc_lists_4 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_364 = _T_363 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [1:0] _T_370 = {_T_288[5],_T_286[5]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_371 = _T_370 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_372 = |_T_371; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_379 = br_alloc_lists_5 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_380 = _T_379 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [1:0] _T_386 = {_T_288[6],_T_286[6]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_387 = _T_386 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_388 = |_T_387; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_395 = br_alloc_lists_6 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_396 = _T_395 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [1:0] _T_402 = {_T_288[7],_T_286[7]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_403 = _T_402 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_404 = |_T_403; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_411 = br_alloc_lists_7 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_412 = _T_411 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [1:0] _T_418 = {_T_288[8],_T_286[8]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_419 = _T_418 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_420 = |_T_419; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_427 = br_alloc_lists_8 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_428 = _T_427 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [1:0] _T_434 = {_T_288[9],_T_286[9]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_435 = _T_434 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_436 = |_T_435; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_443 = br_alloc_lists_9 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_444 = _T_443 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [1:0] _T_450 = {_T_288[10],_T_286[10]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_451 = _T_450 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_452 = |_T_451; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_459 = br_alloc_lists_10 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_460 = _T_459 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [1:0] _T_466 = {_T_288[11],_T_286[11]}; // @[rename-freelist.scala 72:78]
  wire [1:0] _T_467 = _T_466 & br_slots; // @[rename-freelist.scala 72:85]
  wire  _T_468 = |_T_467; // @[rename-freelist.scala 73:29]
  wire [63:0] _T_475 = br_alloc_lists_11 & _T_298; // @[rename-freelist.scala 75:58]
  wire [63:0] _T_476 = _T_475 | alloc_masks_0; // @[rename-freelist.scala 75:73]
  wire [63:0] _T_478 = ~sel_mask; // @[rename-freelist.scala 79:29]
  wire [63:0] _T_479 = free_list & _T_478; // @[rename-freelist.scala 79:27]
  wire [63:0] _T_480 = _T_479 | dealloc_mask; // @[rename-freelist.scala 79:39]
  wire [63:0] _T_482 = _T_480 & 64'hfffffffffffffffe; // @[rename-freelist.scala 79:55]
  wire [31:0] hi = sels_0[63:32]; // @[OneHot.scala 30:18]
  wire [31:0] lo = sels_0[31:0]; // @[OneHot.scala 31:18]
  wire  hi_1 = |hi; // @[OneHot.scala 32:14]
  wire [31:0] _T_484 = hi | lo; // @[OneHot.scala 32:28]
  wire [15:0] hi_2 = _T_484[31:16]; // @[OneHot.scala 30:18]
  wire [15:0] lo_1 = _T_484[15:0]; // @[OneHot.scala 31:18]
  wire  hi_3 = |hi_2; // @[OneHot.scala 32:14]
  wire [15:0] _T_485 = hi_2 | lo_1; // @[OneHot.scala 32:28]
  wire [7:0] hi_4 = _T_485[15:8]; // @[OneHot.scala 30:18]
  wire [7:0] lo_2 = _T_485[7:0]; // @[OneHot.scala 31:18]
  wire  hi_5 = |hi_4; // @[OneHot.scala 32:14]
  wire [7:0] _T_486 = hi_4 | lo_2; // @[OneHot.scala 32:28]
  wire [3:0] hi_6 = _T_486[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] lo_3 = _T_486[3:0]; // @[OneHot.scala 31:18]
  wire  hi_7 = |hi_6; // @[OneHot.scala 32:14]
  wire [3:0] _T_487 = hi_6 | lo_3; // @[OneHot.scala 32:28]
  wire [1:0] hi_8 = _T_487[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_4 = _T_487[1:0]; // @[OneHot.scala 31:18]
  wire  hi_9 = |hi_8; // @[OneHot.scala 32:14]
  wire [1:0] _T_488 = hi_8 | lo_4; // @[OneHot.scala 32:28]
  wire  lo_5 = _T_488[1]; // @[CircuitMath.scala 30:8]
  wire [5:0] _T_489 = {hi_1,hi_3,hi_5,hi_7,hi_9,lo_5}; // @[Cat.scala 30:58]
  reg [5:0] r; // @[Reg.scala 15:16]
  wire [31:0] hi_10 = sels_1[63:32]; // @[OneHot.scala 30:18]
  wire [31:0] lo_10 = sels_1[31:0]; // @[OneHot.scala 31:18]
  wire  hi_11 = |hi_10; // @[OneHot.scala 32:14]
  wire [31:0] _T_497 = hi_10 | lo_10; // @[OneHot.scala 32:28]
  wire [15:0] hi_12 = _T_497[31:16]; // @[OneHot.scala 30:18]
  wire [15:0] lo_11 = _T_497[15:0]; // @[OneHot.scala 31:18]
  wire  hi_13 = |hi_12; // @[OneHot.scala 32:14]
  wire [15:0] _T_498 = hi_12 | lo_11; // @[OneHot.scala 32:28]
  wire [7:0] hi_14 = _T_498[15:8]; // @[OneHot.scala 30:18]
  wire [7:0] lo_12 = _T_498[7:0]; // @[OneHot.scala 31:18]
  wire  hi_15 = |hi_14; // @[OneHot.scala 32:14]
  wire [7:0] _T_499 = hi_14 | lo_12; // @[OneHot.scala 32:28]
  wire [3:0] hi_16 = _T_499[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] lo_13 = _T_499[3:0]; // @[OneHot.scala 31:18]
  wire  hi_17 = |hi_16; // @[OneHot.scala 32:14]
  wire [3:0] _T_500 = hi_16 | lo_13; // @[OneHot.scala 32:28]
  wire [1:0] hi_18 = _T_500[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_14 = _T_500[1:0]; // @[OneHot.scala 31:18]
  wire  hi_19 = |hi_18; // @[OneHot.scala 32:14]
  wire [1:0] _T_501 = hi_18 | lo_14; // @[OneHot.scala 32:28]
  wire  lo_15 = _T_501[1]; // @[CircuitMath.scala 30:8]
  wire [5:0] _T_502 = {hi_11,hi_13,hi_15,hi_17,hi_19,lo_15}; // @[Cat.scala 30:58]
  reg [5:0] r_1; // @[Reg.scala 15:16]
  wire [63:0] _T_511 = io_alloc_pregs_0_valid ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_512 = allocs_0 & _T_511; // @[rename-freelist.scala 94:77]
  wire [63:0] _T_515 = io_alloc_pregs_1_valid ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_516 = allocs_1 & _T_515; // @[rename-freelist.scala 94:77]
  wire [63:0] _T_517 = _T_512 | _T_516; // @[rename-freelist.scala 94:104]
  wire [63:0] _T_519 = io_debug_freelist & dealloc_mask; // @[rename-freelist.scala 97:31]
  wire [1:0] _T_590 = io_debug_freelist[0] + io_debug_freelist[1]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_592 = io_debug_freelist[2] + io_debug_freelist[3]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_594 = _T_590 + _T_592; // @[Bitwise.scala 47:55]
  wire [1:0] _T_596 = io_debug_freelist[4] + io_debug_freelist[5]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_598 = io_debug_freelist[6] + io_debug_freelist[7]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_600 = _T_596 + _T_598; // @[Bitwise.scala 47:55]
  wire [3:0] _T_602 = _T_594 + _T_600; // @[Bitwise.scala 47:55]
  wire [1:0] _T_604 = io_debug_freelist[8] + io_debug_freelist[9]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_606 = io_debug_freelist[10] + io_debug_freelist[11]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_608 = _T_604 + _T_606; // @[Bitwise.scala 47:55]
  wire [1:0] _T_610 = io_debug_freelist[12] + io_debug_freelist[13]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_612 = io_debug_freelist[14] + io_debug_freelist[15]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_614 = _T_610 + _T_612; // @[Bitwise.scala 47:55]
  wire [3:0] _T_616 = _T_608 + _T_614; // @[Bitwise.scala 47:55]
  wire [4:0] _T_618 = _T_602 + _T_616; // @[Bitwise.scala 47:55]
  wire [1:0] _T_620 = io_debug_freelist[16] + io_debug_freelist[17]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_622 = io_debug_freelist[18] + io_debug_freelist[19]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_624 = _T_620 + _T_622; // @[Bitwise.scala 47:55]
  wire [1:0] _T_626 = io_debug_freelist[20] + io_debug_freelist[21]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_628 = io_debug_freelist[22] + io_debug_freelist[23]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_630 = _T_626 + _T_628; // @[Bitwise.scala 47:55]
  wire [3:0] _T_632 = _T_624 + _T_630; // @[Bitwise.scala 47:55]
  wire [1:0] _T_634 = io_debug_freelist[24] + io_debug_freelist[25]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_636 = io_debug_freelist[26] + io_debug_freelist[27]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_638 = _T_634 + _T_636; // @[Bitwise.scala 47:55]
  wire [1:0] _T_640 = io_debug_freelist[28] + io_debug_freelist[29]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_642 = io_debug_freelist[30] + io_debug_freelist[31]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_644 = _T_640 + _T_642; // @[Bitwise.scala 47:55]
  wire [3:0] _T_646 = _T_638 + _T_644; // @[Bitwise.scala 47:55]
  wire [4:0] _T_648 = _T_632 + _T_646; // @[Bitwise.scala 47:55]
  wire [5:0] _T_650 = _T_618 + _T_648; // @[Bitwise.scala 47:55]
  wire [1:0] _T_652 = io_debug_freelist[32] + io_debug_freelist[33]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_654 = io_debug_freelist[34] + io_debug_freelist[35]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_656 = _T_652 + _T_654; // @[Bitwise.scala 47:55]
  wire [1:0] _T_658 = io_debug_freelist[36] + io_debug_freelist[37]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_660 = io_debug_freelist[38] + io_debug_freelist[39]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_662 = _T_658 + _T_660; // @[Bitwise.scala 47:55]
  wire [3:0] _T_664 = _T_656 + _T_662; // @[Bitwise.scala 47:55]
  wire [1:0] _T_666 = io_debug_freelist[40] + io_debug_freelist[41]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_668 = io_debug_freelist[42] + io_debug_freelist[43]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_670 = _T_666 + _T_668; // @[Bitwise.scala 47:55]
  wire [1:0] _T_672 = io_debug_freelist[44] + io_debug_freelist[45]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_674 = io_debug_freelist[46] + io_debug_freelist[47]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_676 = _T_672 + _T_674; // @[Bitwise.scala 47:55]
  wire [3:0] _T_678 = _T_670 + _T_676; // @[Bitwise.scala 47:55]
  wire [4:0] _T_680 = _T_664 + _T_678; // @[Bitwise.scala 47:55]
  wire [1:0] _T_682 = io_debug_freelist[48] + io_debug_freelist[49]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_684 = io_debug_freelist[50] + io_debug_freelist[51]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_686 = _T_682 + _T_684; // @[Bitwise.scala 47:55]
  wire [1:0] _T_688 = io_debug_freelist[52] + io_debug_freelist[53]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_690 = io_debug_freelist[54] + io_debug_freelist[55]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_692 = _T_688 + _T_690; // @[Bitwise.scala 47:55]
  wire [3:0] _T_694 = _T_686 + _T_692; // @[Bitwise.scala 47:55]
  wire [1:0] _T_696 = io_debug_freelist[56] + io_debug_freelist[57]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_698 = io_debug_freelist[58] + io_debug_freelist[59]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_700 = _T_696 + _T_698; // @[Bitwise.scala 47:55]
  wire [1:0] _T_702 = io_debug_freelist[60] + io_debug_freelist[61]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_704 = io_debug_freelist[62] + io_debug_freelist[63]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_706 = _T_702 + _T_704; // @[Bitwise.scala 47:55]
  wire [3:0] _T_708 = _T_700 + _T_706; // @[Bitwise.scala 47:55]
  wire [4:0] _T_710 = _T_694 + _T_708; // @[Bitwise.scala 47:55]
  wire [5:0] _T_712 = _T_680 + _T_710; // @[Bitwise.scala 47:55]
  wire [6:0] _T_714 = _T_650 + _T_712; // @[Bitwise.scala 47:55]
  assign io_alloc_pregs_0_valid = REG; // @[rename-freelist.scala 91:29]
  assign io_alloc_pregs_0_bits = r; // @[rename-freelist.scala 90:29]
  assign io_alloc_pregs_1_valid = REG_1; // @[rename-freelist.scala 91:29]
  assign io_alloc_pregs_1_bits = r_1; // @[rename-freelist.scala 90:29]
  assign io_debug_freelist = free_list | _T_517; // @[rename-freelist.scala 94:34]
  assign io_debug_isprlist = 64'h0; // @[rename-freelist.scala 95:21]
  always @(posedge clock) begin
    if (reset) begin // @[rename-freelist.scala 53:26]
      free_list <= 64'hfffffffffffffffe; // @[rename-freelist.scala 53:26]
    end else begin
      free_list <= _T_482; // @[rename-freelist.scala 79:13]
    end
    if (_T_292) begin // @[rename-freelist.scala 74:29]
      if (_T_291[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_0 <= alloc_masks_1;
      end else begin
        br_alloc_lists_0 <= 64'h0;
      end
    end else begin
      br_alloc_lists_0 <= _T_300;
    end
    if (_T_308) begin // @[rename-freelist.scala 74:29]
      if (_T_307[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_1 <= alloc_masks_1;
      end else begin
        br_alloc_lists_1 <= 64'h0;
      end
    end else begin
      br_alloc_lists_1 <= _T_316;
    end
    if (_T_324) begin // @[rename-freelist.scala 74:29]
      if (_T_323[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_2 <= alloc_masks_1;
      end else begin
        br_alloc_lists_2 <= 64'h0;
      end
    end else begin
      br_alloc_lists_2 <= _T_332;
    end
    if (_T_340) begin // @[rename-freelist.scala 74:29]
      if (_T_339[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_3 <= alloc_masks_1;
      end else begin
        br_alloc_lists_3 <= 64'h0;
      end
    end else begin
      br_alloc_lists_3 <= _T_348;
    end
    if (_T_356) begin // @[rename-freelist.scala 74:29]
      if (_T_355[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_4 <= alloc_masks_1;
      end else begin
        br_alloc_lists_4 <= 64'h0;
      end
    end else begin
      br_alloc_lists_4 <= _T_364;
    end
    if (_T_372) begin // @[rename-freelist.scala 74:29]
      if (_T_371[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_5 <= alloc_masks_1;
      end else begin
        br_alloc_lists_5 <= 64'h0;
      end
    end else begin
      br_alloc_lists_5 <= _T_380;
    end
    if (_T_388) begin // @[rename-freelist.scala 74:29]
      if (_T_387[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_6 <= alloc_masks_1;
      end else begin
        br_alloc_lists_6 <= 64'h0;
      end
    end else begin
      br_alloc_lists_6 <= _T_396;
    end
    if (_T_404) begin // @[rename-freelist.scala 74:29]
      if (_T_403[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_7 <= alloc_masks_1;
      end else begin
        br_alloc_lists_7 <= 64'h0;
      end
    end else begin
      br_alloc_lists_7 <= _T_412;
    end
    if (_T_420) begin // @[rename-freelist.scala 74:29]
      if (_T_419[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_8 <= alloc_masks_1;
      end else begin
        br_alloc_lists_8 <= 64'h0;
      end
    end else begin
      br_alloc_lists_8 <= _T_428;
    end
    if (_T_436) begin // @[rename-freelist.scala 74:29]
      if (_T_435[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_9 <= alloc_masks_1;
      end else begin
        br_alloc_lists_9 <= 64'h0;
      end
    end else begin
      br_alloc_lists_9 <= _T_444;
    end
    if (_T_452) begin // @[rename-freelist.scala 74:29]
      if (_T_451[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_10 <= alloc_masks_1;
      end else begin
        br_alloc_lists_10 <= 64'h0;
      end
    end else begin
      br_alloc_lists_10 <= _T_460;
    end
    if (_T_468) begin // @[rename-freelist.scala 74:29]
      if (_T_467[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_11 <= alloc_masks_1;
      end else begin
        br_alloc_lists_11 <= 64'h0;
      end
    end else begin
      br_alloc_lists_11 <= _T_476;
    end
    if (reset) begin // @[rename-freelist.scala 84:26]
      REG <= 1'h0; // @[rename-freelist.scala 84:26]
    end else begin
      REG <= REG & ~io_reqs_0 | _T_483; // @[rename-freelist.scala 87:13]
    end
    if (reset) begin // @[rename-freelist.scala 84:26]
      REG_1 <= 1'h0; // @[rename-freelist.scala 84:26]
    end else begin
      REG_1 <= REG_1 & ~io_reqs_1 | _T_496; // @[rename-freelist.scala 87:13]
    end
    if (sel_fire_0) begin // @[Reg.scala 16:19]
      r <= _T_489; // @[Reg.scala 16:23]
    end
    if (sel_fire_1) begin // @[Reg.scala 16:19]
      r_1 <= _T_502; // @[Reg.scala 16:23]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(|_T_519) | reset)) begin
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
        if (~(~(|_T_519) | reset)) begin
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
        if (~(~io_debug_pipeline_empty | _T_714 >= 7'h1b | reset)) begin
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
        if (~(~io_debug_pipeline_empty | _T_714 >= 7'h1b | reset)) begin
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
  _RAND_0 = {2{`RANDOM}};
  free_list = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  br_alloc_lists_0 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  br_alloc_lists_1 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  br_alloc_lists_2 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  br_alloc_lists_3 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  br_alloc_lists_4 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  br_alloc_lists_5 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  br_alloc_lists_6 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  br_alloc_lists_7 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  br_alloc_lists_8 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  br_alloc_lists_9 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  br_alloc_lists_10 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  br_alloc_lists_11 = _RAND_12[63:0];
  _RAND_13 = {1{`RANDOM}};
  REG = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  REG_1 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  r = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  r_1 = _RAND_16[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
