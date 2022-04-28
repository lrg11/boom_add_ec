module FlagRenameFreeList(
  input         clock,
  input         reset,
  input         io_reqs_0,
  input         io_reqs_1,
  output        io_alloc_pregs_0_valid,
  output [3:0]  io_alloc_pregs_0_bits,
  output        io_alloc_pregs_1_valid,
  output [3:0]  io_alloc_pregs_1_bits,
  input         io_dealloc_pregs_0_valid,
  input  [3:0]  io_dealloc_pregs_0_bits,
  input         io_dealloc_pregs_1_valid,
  input  [3:0]  io_dealloc_pregs_1_bits,
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
  output [15:0] io_debug_freelist,
  output [15:0] io_debug_isprlist
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
`endif // RANDOMIZE_REG_INIT
  reg [15:0] free_list; // @[rename-freelist.scala 137:26]
  reg [15:0] br_alloc_lists_0; // @[rename-freelist.scala 138:27]
  reg [15:0] br_alloc_lists_1; // @[rename-freelist.scala 138:27]
  reg [15:0] br_alloc_lists_2; // @[rename-freelist.scala 138:27]
  reg [15:0] br_alloc_lists_3; // @[rename-freelist.scala 138:27]
  reg [15:0] br_alloc_lists_4; // @[rename-freelist.scala 138:27]
  reg [15:0] br_alloc_lists_5; // @[rename-freelist.scala 138:27]
  reg [15:0] br_alloc_lists_6; // @[rename-freelist.scala 138:27]
  reg [15:0] br_alloc_lists_7; // @[rename-freelist.scala 138:27]
  reg [15:0] br_alloc_lists_8; // @[rename-freelist.scala 138:27]
  reg [15:0] br_alloc_lists_9; // @[rename-freelist.scala 138:27]
  reg [15:0] br_alloc_lists_10; // @[rename-freelist.scala 138:27]
  reg [15:0] br_alloc_lists_11; // @[rename-freelist.scala 138:27]
  wire [15:0] _T_17 = free_list[15] ? 16'h8000 : 16'h0; // @[Mux.scala 47:69]
  wire [15:0] _T_18 = free_list[14] ? 16'h4000 : _T_17; // @[Mux.scala 47:69]
  wire [15:0] _T_19 = free_list[13] ? 16'h2000 : _T_18; // @[Mux.scala 47:69]
  wire [15:0] _T_20 = free_list[12] ? 16'h1000 : _T_19; // @[Mux.scala 47:69]
  wire [15:0] _T_21 = free_list[11] ? 16'h800 : _T_20; // @[Mux.scala 47:69]
  wire [15:0] _T_22 = free_list[10] ? 16'h400 : _T_21; // @[Mux.scala 47:69]
  wire [15:0] _T_23 = free_list[9] ? 16'h200 : _T_22; // @[Mux.scala 47:69]
  wire [15:0] _T_24 = free_list[8] ? 16'h100 : _T_23; // @[Mux.scala 47:69]
  wire [15:0] _T_25 = free_list[7] ? 16'h80 : _T_24; // @[Mux.scala 47:69]
  wire [15:0] _T_26 = free_list[6] ? 16'h40 : _T_25; // @[Mux.scala 47:69]
  wire [15:0] _T_27 = free_list[5] ? 16'h20 : _T_26; // @[Mux.scala 47:69]
  wire [15:0] _T_28 = free_list[4] ? 16'h10 : _T_27; // @[Mux.scala 47:69]
  wire [15:0] _T_29 = free_list[3] ? 16'h8 : _T_28; // @[Mux.scala 47:69]
  wire [15:0] _T_30 = free_list[2] ? 16'h4 : _T_29; // @[Mux.scala 47:69]
  wire [15:0] _T_31 = free_list[1] ? 16'h2 : _T_30; // @[Mux.scala 47:69]
  wire [15:0] sels_0 = free_list[0] ? 16'h1 : _T_31; // @[Mux.scala 47:69]
  wire [15:0] _T_33 = ~sels_0; // @[util.scala 481:21]
  wire [15:0] _T_34 = free_list & _T_33; // @[util.scala 481:19]
  wire [15:0] _T_51 = _T_34[15] ? 16'h8000 : 16'h0; // @[Mux.scala 47:69]
  wire [15:0] _T_52 = _T_34[14] ? 16'h4000 : _T_51; // @[Mux.scala 47:69]
  wire [15:0] _T_53 = _T_34[13] ? 16'h2000 : _T_52; // @[Mux.scala 47:69]
  wire [15:0] _T_54 = _T_34[12] ? 16'h1000 : _T_53; // @[Mux.scala 47:69]
  wire [15:0] _T_55 = _T_34[11] ? 16'h800 : _T_54; // @[Mux.scala 47:69]
  wire [15:0] _T_56 = _T_34[10] ? 16'h400 : _T_55; // @[Mux.scala 47:69]
  wire [15:0] _T_57 = _T_34[9] ? 16'h200 : _T_56; // @[Mux.scala 47:69]
  wire [15:0] _T_58 = _T_34[8] ? 16'h100 : _T_57; // @[Mux.scala 47:69]
  wire [15:0] _T_59 = _T_34[7] ? 16'h80 : _T_58; // @[Mux.scala 47:69]
  wire [15:0] _T_60 = _T_34[6] ? 16'h40 : _T_59; // @[Mux.scala 47:69]
  wire [15:0] _T_61 = _T_34[5] ? 16'h20 : _T_60; // @[Mux.scala 47:69]
  wire [15:0] _T_62 = _T_34[4] ? 16'h10 : _T_61; // @[Mux.scala 47:69]
  wire [15:0] _T_63 = _T_34[3] ? 16'h8 : _T_62; // @[Mux.scala 47:69]
  wire [15:0] _T_64 = _T_34[2] ? 16'h4 : _T_63; // @[Mux.scala 47:69]
  wire [15:0] _T_65 = _T_34[1] ? 16'h2 : _T_64; // @[Mux.scala 47:69]
  wire [15:0] sels_1 = _T_34[0] ? 16'h1 : _T_65; // @[Mux.scala 47:69]
  wire [15:0] allocs_0 = 16'h1 << io_alloc_pregs_0_bits; // @[OneHot.scala 58:35]
  wire [15:0] allocs_1 = 16'h1 << io_alloc_pregs_1_bits; // @[OneHot.scala 58:35]
  wire [15:0] _T_70 = io_reqs_1 ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] alloc_masks_1 = allocs_1 & _T_70; // @[rename-freelist.scala 146:88]
  wire [15:0] _T_73 = io_reqs_0 ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_74 = allocs_0 & _T_73; // @[rename-freelist.scala 146:88]
  wire [15:0] alloc_masks_0 = alloc_masks_1 | _T_74; // @[rename-freelist.scala 146:84]
  reg  REG; // @[rename-freelist.scala 169:26]
  wire  _T_291 = |sels_0; // @[rename-freelist.scala 168:27]
  wire  sel_fire_0 = (~REG | io_reqs_0) & _T_291; // @[rename-freelist.scala 180:45]
  wire [15:0] _T_76 = sel_fire_0 ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_77 = sels_0 & _T_76; // @[rename-freelist.scala 150:60]
  reg  REG_1; // @[rename-freelist.scala 169:26]
  wire  _T_302 = |sels_1; // @[rename-freelist.scala 168:27]
  wire  sel_fire_1 = (~REG_1 | io_reqs_1) & _T_302; // @[rename-freelist.scala 180:45]
  wire [15:0] _T_79 = sel_fire_1 ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_80 = sels_1 & _T_79; // @[rename-freelist.scala 150:60]
  wire [15:0] sel_mask = _T_77 | _T_80; // @[rename-freelist.scala 150:82]
  wire [15:0] _T_82 = io_brupdate_b2_mispredict ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _GEN_1 = 4'h1 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_1 : br_alloc_lists_0; // @[rename-freelist.scala 151:63 rename-freelist.scala 151:63]
  wire [15:0] _GEN_2 = 4'h2 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_2 : _GEN_1; // @[rename-freelist.scala 151:63 rename-freelist.scala 151:63]
  wire [15:0] _GEN_3 = 4'h3 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_3 : _GEN_2; // @[rename-freelist.scala 151:63 rename-freelist.scala 151:63]
  wire [15:0] _GEN_4 = 4'h4 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_4 : _GEN_3; // @[rename-freelist.scala 151:63 rename-freelist.scala 151:63]
  wire [15:0] _GEN_5 = 4'h5 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_5 : _GEN_4; // @[rename-freelist.scala 151:63 rename-freelist.scala 151:63]
  wire [15:0] _GEN_6 = 4'h6 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_6 : _GEN_5; // @[rename-freelist.scala 151:63 rename-freelist.scala 151:63]
  wire [15:0] _GEN_7 = 4'h7 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_7 : _GEN_6; // @[rename-freelist.scala 151:63 rename-freelist.scala 151:63]
  wire [15:0] _GEN_8 = 4'h8 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_8 : _GEN_7; // @[rename-freelist.scala 151:63 rename-freelist.scala 151:63]
  wire [15:0] _GEN_9 = 4'h9 == io_brupdate_b2_uop_br_tag ? br_alloc_lists_9 : _GEN_8; // @[rename-freelist.scala 151:63 rename-freelist.scala 151:63]
  wire [15:0] _GEN_10 = 4'ha == io_brupdate_b2_uop_br_tag ? br_alloc_lists_10 : _GEN_9; // @[rename-freelist.scala 151:63 rename-freelist.scala 151:63]
  wire [15:0] _GEN_11 = 4'hb == io_brupdate_b2_uop_br_tag ? br_alloc_lists_11 : _GEN_10; // @[rename-freelist.scala 151:63 rename-freelist.scala 151:63]
  wire [15:0] br_deallocs = _GEN_11 & _T_82; // @[rename-freelist.scala 151:63]
  wire [15:0] _T_83 = 16'h1 << io_dealloc_pregs_0_bits; // @[OneHot.scala 58:35]
  wire [15:0] _T_86 = io_dealloc_pregs_0_valid ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_87 = _T_83 & _T_86; // @[rename-freelist.scala 152:79]
  wire [15:0] _T_88 = 16'h1 << io_dealloc_pregs_1_bits; // @[OneHot.scala 58:35]
  wire [15:0] _T_91 = io_dealloc_pregs_1_valid ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_92 = _T_88 & _T_91; // @[rename-freelist.scala 152:79]
  wire [15:0] _T_93 = _T_87 | _T_92; // @[rename-freelist.scala 152:106]
  wire [15:0] dealloc_mask = _T_93 | br_deallocs; // @[rename-freelist.scala 152:110]
  wire [1:0] br_slots = {io_ren_br_tags_1_valid,io_ren_br_tags_0_valid}; // @[rename-freelist.scala 154:64]
  wire [15:0] _T_94 = 16'h1 << io_ren_br_tags_0_bits; // @[OneHot.scala 58:35]
  wire [15:0] _T_96 = 16'h1 << io_ren_br_tags_1_bits; // @[OneHot.scala 58:35]
  wire [1:0] _T_98 = {_T_96[0],_T_94[0]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_99 = _T_98 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_100 = |_T_99; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_106 = ~br_deallocs; // @[rename-freelist.scala 160:60]
  wire [15:0] _T_107 = br_alloc_lists_0 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_108 = _T_107 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [1:0] _T_114 = {_T_96[1],_T_94[1]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_115 = _T_114 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_116 = |_T_115; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_123 = br_alloc_lists_1 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_124 = _T_123 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [1:0] _T_130 = {_T_96[2],_T_94[2]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_131 = _T_130 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_132 = |_T_131; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_139 = br_alloc_lists_2 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_140 = _T_139 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [1:0] _T_146 = {_T_96[3],_T_94[3]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_147 = _T_146 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_148 = |_T_147; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_155 = br_alloc_lists_3 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_156 = _T_155 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [1:0] _T_162 = {_T_96[4],_T_94[4]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_163 = _T_162 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_164 = |_T_163; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_171 = br_alloc_lists_4 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_172 = _T_171 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [1:0] _T_178 = {_T_96[5],_T_94[5]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_179 = _T_178 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_180 = |_T_179; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_187 = br_alloc_lists_5 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_188 = _T_187 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [1:0] _T_194 = {_T_96[6],_T_94[6]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_195 = _T_194 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_196 = |_T_195; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_203 = br_alloc_lists_6 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_204 = _T_203 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [1:0] _T_210 = {_T_96[7],_T_94[7]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_211 = _T_210 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_212 = |_T_211; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_219 = br_alloc_lists_7 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_220 = _T_219 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [1:0] _T_226 = {_T_96[8],_T_94[8]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_227 = _T_226 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_228 = |_T_227; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_235 = br_alloc_lists_8 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_236 = _T_235 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [1:0] _T_242 = {_T_96[9],_T_94[9]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_243 = _T_242 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_244 = |_T_243; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_251 = br_alloc_lists_9 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_252 = _T_251 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [1:0] _T_258 = {_T_96[10],_T_94[10]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_259 = _T_258 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_260 = |_T_259; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_267 = br_alloc_lists_10 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_268 = _T_267 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [1:0] _T_274 = {_T_96[11],_T_94[11]}; // @[rename-freelist.scala 157:78]
  wire [1:0] _T_275 = _T_274 & br_slots; // @[rename-freelist.scala 157:85]
  wire  _T_276 = |_T_275; // @[rename-freelist.scala 158:29]
  wire [15:0] _T_283 = br_alloc_lists_11 & _T_106; // @[rename-freelist.scala 160:58]
  wire [15:0] _T_284 = _T_283 | alloc_masks_0; // @[rename-freelist.scala 160:73]
  wire [15:0] _T_286 = ~sel_mask; // @[rename-freelist.scala 164:29]
  wire [15:0] _T_287 = free_list & _T_286; // @[rename-freelist.scala 164:27]
  wire [15:0] _T_288 = _T_287 | dealloc_mask; // @[rename-freelist.scala 164:39]
  wire [15:0] _T_290 = _T_288 & 16'hfffe; // @[rename-freelist.scala 164:55]
  wire [7:0] hi = sels_0[15:8]; // @[OneHot.scala 30:18]
  wire [7:0] lo = sels_0[7:0]; // @[OneHot.scala 31:18]
  wire  hi_1 = |hi; // @[OneHot.scala 32:14]
  wire [7:0] _T_292 = hi | lo; // @[OneHot.scala 32:28]
  wire [3:0] hi_2 = _T_292[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] lo_1 = _T_292[3:0]; // @[OneHot.scala 31:18]
  wire  hi_3 = |hi_2; // @[OneHot.scala 32:14]
  wire [3:0] _T_293 = hi_2 | lo_1; // @[OneHot.scala 32:28]
  wire [1:0] hi_4 = _T_293[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_2 = _T_293[1:0]; // @[OneHot.scala 31:18]
  wire  hi_5 = |hi_4; // @[OneHot.scala 32:14]
  wire [1:0] _T_294 = hi_4 | lo_2; // @[OneHot.scala 32:28]
  wire  lo_3 = _T_294[1]; // @[CircuitMath.scala 30:8]
  wire [3:0] _T_295 = {hi_1,hi_3,hi_5,lo_3}; // @[Cat.scala 30:58]
  reg [3:0] r; // @[Reg.scala 15:16]
  wire [7:0] hi_6 = sels_1[15:8]; // @[OneHot.scala 30:18]
  wire [7:0] lo_6 = sels_1[7:0]; // @[OneHot.scala 31:18]
  wire  hi_7 = |hi_6; // @[OneHot.scala 32:14]
  wire [7:0] _T_303 = hi_6 | lo_6; // @[OneHot.scala 32:28]
  wire [3:0] hi_8 = _T_303[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] lo_7 = _T_303[3:0]; // @[OneHot.scala 31:18]
  wire  hi_9 = |hi_8; // @[OneHot.scala 32:14]
  wire [3:0] _T_304 = hi_8 | lo_7; // @[OneHot.scala 32:28]
  wire [1:0] hi_10 = _T_304[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_8 = _T_304[1:0]; // @[OneHot.scala 31:18]
  wire  hi_11 = |hi_10; // @[OneHot.scala 32:14]
  wire [1:0] _T_305 = hi_10 | lo_8; // @[OneHot.scala 32:28]
  wire  lo_9 = _T_305[1]; // @[CircuitMath.scala 30:8]
  wire [3:0] _T_306 = {hi_7,hi_9,hi_11,lo_9}; // @[Cat.scala 30:58]
  reg [3:0] r_1; // @[Reg.scala 15:16]
  wire [15:0] _T_315 = io_alloc_pregs_0_valid ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_316 = allocs_0 & _T_315; // @[rename-freelist.scala 188:77]
  wire [15:0] _T_319 = io_alloc_pregs_1_valid ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_320 = allocs_1 & _T_319; // @[rename-freelist.scala 188:77]
  wire [15:0] _T_321 = _T_316 | _T_320; // @[rename-freelist.scala 188:104]
  wire [15:0] _T_323 = io_debug_freelist & dealloc_mask; // @[rename-freelist.scala 191:31]
  wire [1:0] _T_346 = io_debug_freelist[0] + io_debug_freelist[1]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_348 = io_debug_freelist[2] + io_debug_freelist[3]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_350 = _T_346 + _T_348; // @[Bitwise.scala 47:55]
  wire [1:0] _T_352 = io_debug_freelist[4] + io_debug_freelist[5]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_354 = io_debug_freelist[6] + io_debug_freelist[7]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_356 = _T_352 + _T_354; // @[Bitwise.scala 47:55]
  wire [3:0] _T_358 = _T_350 + _T_356; // @[Bitwise.scala 47:55]
  wire [1:0] _T_360 = io_debug_freelist[8] + io_debug_freelist[9]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_362 = io_debug_freelist[10] + io_debug_freelist[11]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_364 = _T_360 + _T_362; // @[Bitwise.scala 47:55]
  wire [1:0] _T_366 = io_debug_freelist[12] + io_debug_freelist[13]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_368 = io_debug_freelist[14] + io_debug_freelist[15]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_370 = _T_366 + _T_368; // @[Bitwise.scala 47:55]
  wire [3:0] _T_372 = _T_364 + _T_370; // @[Bitwise.scala 47:55]
  wire [4:0] _T_374 = _T_358 + _T_372; // @[Bitwise.scala 47:55]
  assign io_alloc_pregs_0_valid = REG; // @[rename-freelist.scala 184:29]
  assign io_alloc_pregs_0_bits = r; // @[rename-freelist.scala 183:29]
  assign io_alloc_pregs_1_valid = REG_1; // @[rename-freelist.scala 184:29]
  assign io_alloc_pregs_1_bits = r_1; // @[rename-freelist.scala 183:29]
  assign io_debug_freelist = free_list | _T_321; // @[rename-freelist.scala 188:34]
  assign io_debug_isprlist = 16'h0; // @[rename-freelist.scala 189:21]
  always @(posedge clock) begin
    if (reset) begin // @[rename-freelist.scala 137:26]
      free_list <= 16'hfffe; // @[rename-freelist.scala 137:26]
    end else begin
      free_list <= _T_290; // @[rename-freelist.scala 164:13]
    end
    if (_T_100) begin // @[rename-freelist.scala 159:29]
      if (_T_99[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_0 <= alloc_masks_1;
      end else begin
        br_alloc_lists_0 <= 16'h0;
      end
    end else begin
      br_alloc_lists_0 <= _T_108;
    end
    if (_T_116) begin // @[rename-freelist.scala 159:29]
      if (_T_115[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_1 <= alloc_masks_1;
      end else begin
        br_alloc_lists_1 <= 16'h0;
      end
    end else begin
      br_alloc_lists_1 <= _T_124;
    end
    if (_T_132) begin // @[rename-freelist.scala 159:29]
      if (_T_131[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_2 <= alloc_masks_1;
      end else begin
        br_alloc_lists_2 <= 16'h0;
      end
    end else begin
      br_alloc_lists_2 <= _T_140;
    end
    if (_T_148) begin // @[rename-freelist.scala 159:29]
      if (_T_147[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_3 <= alloc_masks_1;
      end else begin
        br_alloc_lists_3 <= 16'h0;
      end
    end else begin
      br_alloc_lists_3 <= _T_156;
    end
    if (_T_164) begin // @[rename-freelist.scala 159:29]
      if (_T_163[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_4 <= alloc_masks_1;
      end else begin
        br_alloc_lists_4 <= 16'h0;
      end
    end else begin
      br_alloc_lists_4 <= _T_172;
    end
    if (_T_180) begin // @[rename-freelist.scala 159:29]
      if (_T_179[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_5 <= alloc_masks_1;
      end else begin
        br_alloc_lists_5 <= 16'h0;
      end
    end else begin
      br_alloc_lists_5 <= _T_188;
    end
    if (_T_196) begin // @[rename-freelist.scala 159:29]
      if (_T_195[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_6 <= alloc_masks_1;
      end else begin
        br_alloc_lists_6 <= 16'h0;
      end
    end else begin
      br_alloc_lists_6 <= _T_204;
    end
    if (_T_212) begin // @[rename-freelist.scala 159:29]
      if (_T_211[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_7 <= alloc_masks_1;
      end else begin
        br_alloc_lists_7 <= 16'h0;
      end
    end else begin
      br_alloc_lists_7 <= _T_220;
    end
    if (_T_228) begin // @[rename-freelist.scala 159:29]
      if (_T_227[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_8 <= alloc_masks_1;
      end else begin
        br_alloc_lists_8 <= 16'h0;
      end
    end else begin
      br_alloc_lists_8 <= _T_236;
    end
    if (_T_244) begin // @[rename-freelist.scala 159:29]
      if (_T_243[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_9 <= alloc_masks_1;
      end else begin
        br_alloc_lists_9 <= 16'h0;
      end
    end else begin
      br_alloc_lists_9 <= _T_252;
    end
    if (_T_260) begin // @[rename-freelist.scala 159:29]
      if (_T_259[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_10 <= alloc_masks_1;
      end else begin
        br_alloc_lists_10 <= 16'h0;
      end
    end else begin
      br_alloc_lists_10 <= _T_268;
    end
    if (_T_276) begin // @[rename-freelist.scala 159:29]
      if (_T_275[0]) begin // @[Mux.scala 27:72]
        br_alloc_lists_11 <= alloc_masks_1;
      end else begin
        br_alloc_lists_11 <= 16'h0;
      end
    end else begin
      br_alloc_lists_11 <= _T_284;
    end
    if (reset) begin // @[rename-freelist.scala 169:26]
      REG <= 1'h0; // @[rename-freelist.scala 169:26]
    end else begin
      REG <= REG & ~io_reqs_0 | _T_291; // @[rename-freelist.scala 177:13]
    end
    if (reset) begin // @[rename-freelist.scala 169:26]
      REG_1 <= 1'h0; // @[rename-freelist.scala 169:26]
    end else begin
      REG_1 <= REG_1 & ~io_reqs_1 | _T_302; // @[rename-freelist.scala 177:13]
    end
    if (sel_fire_0) begin // @[Reg.scala 16:19]
      r <= _T_295; // @[Reg.scala 16:23]
    end
    if (sel_fire_1) begin // @[Reg.scala 16:19]
      r_1 <= _T_306; // @[Reg.scala 16:23]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(|_T_323) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [freelist] Returning a free physical register.\n    at rename-freelist.scala:191 assert (!(io.debug.freelist & dealloc_mask).orR, \"[freelist] Returning a free physical register.\")\n"
            ); // @[rename-freelist.scala 191:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(|_T_323) | reset)) begin
          $fatal; // @[rename-freelist.scala 191:10]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~io_debug_pipeline_empty | _T_374 >= 5'he | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [freelist] Leaking physical registers.\n    at rename-freelist.scala:192 assert (!io.debug.pipeline_empty || PopCount(io.debug.freelist) >= (numPregs - numLregs - 1).U,\n"
            ); // @[rename-freelist.scala 192:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~io_debug_pipeline_empty | _T_374 >= 5'he | reset)) begin
          $fatal; // @[rename-freelist.scala 192:10]
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
  free_list = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  br_alloc_lists_0 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  br_alloc_lists_1 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  br_alloc_lists_2 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  br_alloc_lists_3 = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  br_alloc_lists_4 = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  br_alloc_lists_5 = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  br_alloc_lists_6 = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  br_alloc_lists_7 = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  br_alloc_lists_8 = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  br_alloc_lists_9 = _RAND_10[15:0];
  _RAND_11 = {1{`RANDOM}};
  br_alloc_lists_10 = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  br_alloc_lists_11 = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  REG = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  REG_1 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  r = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  r_1 = _RAND_16[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
