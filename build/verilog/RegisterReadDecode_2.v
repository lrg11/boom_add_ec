module RegisterReadDecode_2(
  input         clock,
  input         reset,
  input         io_iss_valid,
  input         io_iss_uop_switch,
  input         io_iss_uop_switch_off,
  input         io_iss_uop_is_unicore,
  input  [2:0]  io_iss_uop_shift,
  input  [1:0]  io_iss_uop_lrs3_rtype,
  input         io_iss_uop_rflag,
  input         io_iss_uop_wflag,
  input  [3:0]  io_iss_uop_prflag,
  input  [3:0]  io_iss_uop_pwflag,
  input         io_iss_uop_pflag_busy,
  input  [3:0]  io_iss_uop_stale_pflag,
  input  [3:0]  io_iss_uop_op1_sel,
  input  [3:0]  io_iss_uop_op2_sel,
  input  [5:0]  io_iss_uop_split_num,
  input  [5:0]  io_iss_uop_self_index,
  input  [5:0]  io_iss_uop_rob_inst_idx,
  input  [5:0]  io_iss_uop_address_num,
  input  [6:0]  io_iss_uop_uopc,
  input  [31:0] io_iss_uop_inst,
  input  [31:0] io_iss_uop_debug_inst,
  input         io_iss_uop_is_rvc,
  input  [39:0] io_iss_uop_debug_pc,
  input  [2:0]  io_iss_uop_iq_type,
  input  [9:0]  io_iss_uop_fu_code,
  input  [3:0]  io_iss_uop_ctrl_br_type,
  input  [1:0]  io_iss_uop_ctrl_op1_sel,
  input  [2:0]  io_iss_uop_ctrl_op2_sel,
  input  [2:0]  io_iss_uop_ctrl_imm_sel,
  input  [3:0]  io_iss_uop_ctrl_op_fcn,
  input         io_iss_uop_ctrl_fcn_dw,
  input  [2:0]  io_iss_uop_ctrl_csr_cmd,
  input         io_iss_uop_ctrl_is_load,
  input         io_iss_uop_ctrl_is_sta,
  input         io_iss_uop_ctrl_is_std,
  input  [1:0]  io_iss_uop_ctrl_op3_sel,
  input  [1:0]  io_iss_uop_iw_state,
  input         io_iss_uop_iw_p1_poisoned,
  input         io_iss_uop_iw_p2_poisoned,
  input         io_iss_uop_is_br,
  input         io_iss_uop_is_jalr,
  input         io_iss_uop_is_jal,
  input         io_iss_uop_is_sfb,
  input  [11:0] io_iss_uop_br_mask,
  input  [3:0]  io_iss_uop_br_tag,
  input  [4:0]  io_iss_uop_ftq_idx,
  input         io_iss_uop_edge_inst,
  input  [5:0]  io_iss_uop_pc_lob,
  input         io_iss_uop_taken,
  input  [19:0] io_iss_uop_imm_packed,
  input  [11:0] io_iss_uop_csr_addr,
  input  [5:0]  io_iss_uop_rob_idx,
  input  [4:0]  io_iss_uop_ldq_idx,
  input  [4:0]  io_iss_uop_stq_idx,
  input  [1:0]  io_iss_uop_rxq_idx,
  input  [6:0]  io_iss_uop_pdst,
  input  [6:0]  io_iss_uop_prs1,
  input  [6:0]  io_iss_uop_prs2,
  input  [6:0]  io_iss_uop_prs3,
  input  [4:0]  io_iss_uop_ppred,
  input         io_iss_uop_prs1_busy,
  input         io_iss_uop_prs2_busy,
  input         io_iss_uop_prs3_busy,
  input         io_iss_uop_ppred_busy,
  input  [6:0]  io_iss_uop_stale_pdst,
  input         io_iss_uop_exception,
  input  [63:0] io_iss_uop_exc_cause,
  input         io_iss_uop_bypassable,
  input  [4:0]  io_iss_uop_mem_cmd,
  input  [1:0]  io_iss_uop_mem_size,
  input         io_iss_uop_mem_signed,
  input         io_iss_uop_is_fence,
  input         io_iss_uop_is_fencei,
  input         io_iss_uop_is_amo,
  input         io_iss_uop_uses_ldq,
  input         io_iss_uop_uses_stq,
  input         io_iss_uop_is_sys_pc2epc,
  input         io_iss_uop_is_unique,
  input         io_iss_uop_flush_on_commit,
  input         io_iss_uop_ldst_is_rs1,
  input  [5:0]  io_iss_uop_ldst,
  input  [5:0]  io_iss_uop_lrs1,
  input  [5:0]  io_iss_uop_lrs2,
  input  [5:0]  io_iss_uop_lrs3,
  input         io_iss_uop_ldst_val,
  input  [1:0]  io_iss_uop_dst_rtype,
  input  [1:0]  io_iss_uop_lrs1_rtype,
  input  [1:0]  io_iss_uop_lrs2_rtype,
  input         io_iss_uop_frs3_en,
  input         io_iss_uop_fp_val,
  input         io_iss_uop_fp_single,
  input         io_iss_uop_xcpt_pf_if,
  input         io_iss_uop_xcpt_ae_if,
  input         io_iss_uop_xcpt_ma_if,
  input         io_iss_uop_bp_debug_if,
  input         io_iss_uop_bp_xcpt_if,
  input  [1:0]  io_iss_uop_debug_fsrc,
  input  [1:0]  io_iss_uop_debug_tsrc,
  output        io_rrd_valid,
  output        io_rrd_uop_switch,
  output        io_rrd_uop_switch_off,
  output        io_rrd_uop_is_unicore,
  output [2:0]  io_rrd_uop_shift,
  output [1:0]  io_rrd_uop_lrs3_rtype,
  output        io_rrd_uop_rflag,
  output        io_rrd_uop_wflag,
  output [3:0]  io_rrd_uop_prflag,
  output [3:0]  io_rrd_uop_pwflag,
  output        io_rrd_uop_pflag_busy,
  output [3:0]  io_rrd_uop_stale_pflag,
  output [3:0]  io_rrd_uop_op1_sel,
  output [3:0]  io_rrd_uop_op2_sel,
  output [5:0]  io_rrd_uop_split_num,
  output [5:0]  io_rrd_uop_self_index,
  output [5:0]  io_rrd_uop_rob_inst_idx,
  output [5:0]  io_rrd_uop_address_num,
  output [6:0]  io_rrd_uop_uopc,
  output [31:0] io_rrd_uop_inst,
  output [31:0] io_rrd_uop_debug_inst,
  output        io_rrd_uop_is_rvc,
  output [39:0] io_rrd_uop_debug_pc,
  output [2:0]  io_rrd_uop_iq_type,
  output [9:0]  io_rrd_uop_fu_code,
  output [3:0]  io_rrd_uop_ctrl_br_type,
  output [1:0]  io_rrd_uop_ctrl_op1_sel,
  output [2:0]  io_rrd_uop_ctrl_op2_sel,
  output [2:0]  io_rrd_uop_ctrl_imm_sel,
  output [3:0]  io_rrd_uop_ctrl_op_fcn,
  output        io_rrd_uop_ctrl_fcn_dw,
  output [2:0]  io_rrd_uop_ctrl_csr_cmd,
  output        io_rrd_uop_ctrl_is_load,
  output        io_rrd_uop_ctrl_is_sta,
  output        io_rrd_uop_ctrl_is_std,
  output [1:0]  io_rrd_uop_ctrl_op3_sel,
  output [1:0]  io_rrd_uop_iw_state,
  output        io_rrd_uop_iw_p1_poisoned,
  output        io_rrd_uop_iw_p2_poisoned,
  output        io_rrd_uop_is_br,
  output        io_rrd_uop_is_jalr,
  output        io_rrd_uop_is_jal,
  output        io_rrd_uop_is_sfb,
  output [11:0] io_rrd_uop_br_mask,
  output [3:0]  io_rrd_uop_br_tag,
  output [4:0]  io_rrd_uop_ftq_idx,
  output        io_rrd_uop_edge_inst,
  output [5:0]  io_rrd_uop_pc_lob,
  output        io_rrd_uop_taken,
  output [19:0] io_rrd_uop_imm_packed,
  output [11:0] io_rrd_uop_csr_addr,
  output [5:0]  io_rrd_uop_rob_idx,
  output [4:0]  io_rrd_uop_ldq_idx,
  output [4:0]  io_rrd_uop_stq_idx,
  output [1:0]  io_rrd_uop_rxq_idx,
  output [6:0]  io_rrd_uop_pdst,
  output [6:0]  io_rrd_uop_prs1,
  output [6:0]  io_rrd_uop_prs2,
  output [6:0]  io_rrd_uop_prs3,
  output [4:0]  io_rrd_uop_ppred,
  output        io_rrd_uop_prs1_busy,
  output        io_rrd_uop_prs2_busy,
  output        io_rrd_uop_prs3_busy,
  output        io_rrd_uop_ppred_busy,
  output [6:0]  io_rrd_uop_stale_pdst,
  output        io_rrd_uop_exception,
  output [63:0] io_rrd_uop_exc_cause,
  output        io_rrd_uop_bypassable,
  output [4:0]  io_rrd_uop_mem_cmd,
  output [1:0]  io_rrd_uop_mem_size,
  output        io_rrd_uop_mem_signed,
  output        io_rrd_uop_is_fence,
  output        io_rrd_uop_is_fencei,
  output        io_rrd_uop_is_amo,
  output        io_rrd_uop_uses_ldq,
  output        io_rrd_uop_uses_stq,
  output        io_rrd_uop_is_sys_pc2epc,
  output        io_rrd_uop_is_unique,
  output        io_rrd_uop_flush_on_commit,
  output        io_rrd_uop_ldst_is_rs1,
  output [5:0]  io_rrd_uop_ldst,
  output [5:0]  io_rrd_uop_lrs1,
  output [5:0]  io_rrd_uop_lrs2,
  output [5:0]  io_rrd_uop_lrs3,
  output        io_rrd_uop_ldst_val,
  output [1:0]  io_rrd_uop_dst_rtype,
  output [1:0]  io_rrd_uop_lrs1_rtype,
  output [1:0]  io_rrd_uop_lrs2_rtype,
  output        io_rrd_uop_frs3_en,
  output        io_rrd_uop_fp_val,
  output        io_rrd_uop_fp_single,
  output        io_rrd_uop_xcpt_pf_if,
  output        io_rrd_uop_xcpt_ae_if,
  output        io_rrd_uop_xcpt_ma_if,
  output        io_rrd_uop_bp_debug_if,
  output        io_rrd_uop_bp_xcpt_if,
  output [1:0]  io_rrd_uop_debug_fsrc,
  output [1:0]  io_rrd_uop_debug_tsrc
);
  wire  _bit_T = io_rrd_uop_uopc == 7'h19; // @[Decode.scala 14:121]
  wire  _bit_T_1 = io_rrd_uop_uopc == 7'h1a; // @[Decode.scala 14:121]
  wire  _bit_T_2 = io_rrd_uop_uopc == 7'h1c; // @[Decode.scala 14:121]
  wire  lo_hi_2 = io_rrd_uop_uopc == 7'h25; // @[Decode.scala 14:121]
  wire  lo_lo = _bit_T | _bit_T_1 | _bit_T_2 | lo_hi_2; // @[Decode.scala 15:30]
  wire  _bit_T_7 = io_rrd_uop_uopc == 7'h18; // @[Decode.scala 14:121]
  wire  _bit_T_8 = io_rrd_uop_uopc == 7'h1d; // @[Decode.scala 14:121]
  wire  lo_hi = _bit_T_7 | _bit_T_1 | _bit_T_8 | lo_hi_2; // @[Decode.scala 15:30]
  wire  _bit_T_12 = io_rrd_uop_uopc == 7'h1b; // @[Decode.scala 14:121]
  wire  hi_lo = _bit_T_12 | _bit_T_2 | _bit_T_8 | lo_hi_2; // @[Decode.scala 15:30]
  wire  hi_hi = io_rrd_uop_uopc == 7'h26; // @[Decode.scala 14:121]
  wire [3:0] rrd_cs_riscv_br_type = {hi_hi,hi_lo,lo_hi,lo_lo}; // @[Cat.scala 30:58]
  wire  _bit_T_21 = io_rrd_uop_uopc == 7'h38; // @[Decode.scala 14:121]
  wire  _bit_T_25 = io_rrd_uop_uopc == 7'h3c; // @[Decode.scala 14:121]
  wire  _bit_T_26 = io_rrd_uop_uopc == 7'h3d; // @[Decode.scala 14:121]
  wire  _bit_T_27 = io_rrd_uop_uopc == 7'h3e; // @[Decode.scala 14:121]
  wire  _bit_T_28 = io_rrd_uop_uopc == 7'h3f; // @[Decode.scala 14:121]
  wire  _bit_T_29 = io_rrd_uop_uopc == 7'h40; // @[Decode.scala 14:121]
  wire  _bit_T_54 = io_rrd_uop_uopc == 7'hb; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_55 = io_rrd_uop_uopc & 7'h3e; // @[Decode.scala 14:65]
  wire  _bit_T_56 = _bit_T_55 == 7'hc; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_57 = io_rrd_uop_uopc & 7'h7e; // @[Decode.scala 14:65]
  wire  _bit_T_58 = _bit_T_57 == 7'h2e; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_59 = io_rrd_uop_uopc & 7'h7c; // @[Decode.scala 14:65]
  wire  _bit_T_60 = _bit_T_59 == 7'h30; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_61 = io_rrd_uop_uopc & 7'h7b; // @[Decode.scala 14:65]
  wire  _bit_T_62 = _bit_T_61 == 7'h31; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_63 = io_rrd_uop_uopc & 7'h73; // @[Decode.scala 14:65]
  wire  _bit_T_64 = _bit_T_63 == 7'h32; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_65 = io_rrd_uop_uopc & 7'h7d; // @[Decode.scala 14:65]
  wire  _bit_T_66 = _bit_T_65 == 7'h3c; // @[Decode.scala 14:121]
  wire  _bit_T_68 = _bit_T_61 == 7'h40; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_69 = io_rrd_uop_uopc & 7'h77; // @[Decode.scala 14:65]
  wire  _bit_T_70 = _bit_T_69 == 7'h6; // @[Decode.scala 14:121]
  wire  _bit_T_72 = _bit_T_61 == 7'h13; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_73 = io_rrd_uop_uopc & 7'h6f; // @[Decode.scala 14:65]
  wire  _bit_T_74 = _bit_T_73 == 7'h6; // @[Decode.scala 14:121]
  wire  lo_lo_1 = _bit_T_54 | _bit_T_56 | _bit_T_58 | _bit_T_60 | _bit_T_62 | _bit_T_64 | _bit_T_66 | _bit_T_68 |
    _bit_T_70 | _bit_T_72 | _bit_T_74; // @[Decode.scala 15:30]
  wire  _bit_T_86 = _bit_T_57 == 7'h6; // @[Decode.scala 14:121]
  wire  _bit_T_87 = io_rrd_uop_uopc == 7'ha; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_88 = io_rrd_uop_uopc & 7'h3f; // @[Decode.scala 14:65]
  wire  _bit_T_89 = _bit_T_88 == 7'hc; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_90 = io_rrd_uop_uopc & 7'h79; // @[Decode.scala 14:65]
  wire  _bit_T_91 = _bit_T_90 == 7'h10; // @[Decode.scala 14:121]
  wire  _bit_T_93 = _bit_T_61 == 7'h19; // @[Decode.scala 14:121]
  wire  _bit_T_94 = io_rrd_uop_uopc == 7'h2d; // @[Decode.scala 14:121]
  wire  _bit_T_96 = _bit_T_57 == 7'h30; // @[Decode.scala 14:121]
  wire  _bit_T_98 = _bit_T_69 == 7'h13; // @[Decode.scala 14:121]
  wire  _bit_T_100 = _bit_T_69 == 7'h10; // @[Decode.scala 14:121]
  wire  _bit_T_102 = _bit_T_57 == 7'h36; // @[Decode.scala 14:121]
  wire  _bit_T_104 = _bit_T_61 == 7'h3b; // @[Decode.scala 14:121]
  wire  lo_hi_1 = _bit_T_86 | _bit_T_87 | _bit_T_89 | _bit_T_91 | _bit_T_93 | _bit_T_94 | _bit_T_96 | _bit_T_25 |
    _bit_T_68 | _bit_T_98 | _bit_T_100 | _bit_T_102 | _bit_T_104; // @[Decode.scala 15:30]
  wire  _bit_T_118 = _bit_T_90 == 7'h11; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_119 = io_rrd_uop_uopc & 7'h56; // @[Decode.scala 14:65]
  wire  _bit_T_120 = _bit_T_119 == 7'h12; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_121 = io_rrd_uop_uopc & 7'h76; // @[Decode.scala 14:65]
  wire  _bit_T_122 = _bit_T_121 == 7'h14; // @[Decode.scala 14:121]
  wire  _bit_T_124 = _bit_T_90 == 7'h39; // @[Decode.scala 14:121]
  wire  _bit_T_126 = _bit_T_65 == 7'h8; // @[Decode.scala 14:121]
  wire  _bit_T_128 = _bit_T_61 == 7'h9; // @[Decode.scala 14:121]
  wire  _bit_T_130 = _bit_T_59 == 7'h3c; // @[Decode.scala 14:121]
  wire  hi_lo_1 = _bit_T_86 | _bit_T_118 | _bit_T_120 | _bit_T_122 | _bit_T_124 | _bit_T_68 | _bit_T_126 | _bit_T_128 |
    _bit_T_130; // @[Decode.scala 15:30]
  wire  _bit_T_140 = _bit_T_73 == 7'h9; // @[Decode.scala 14:121]
  wire  _bit_T_142 = _bit_T_73 == 7'ha; // @[Decode.scala 14:121]
  wire  _bit_T_144 = _bit_T_73 == 7'hc; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_145 = io_rrd_uop_uopc & 7'h5e; // @[Decode.scala 14:65]
  wire  _bit_T_146 = _bit_T_145 == 7'h10; // @[Decode.scala 14:121]
  wire  _bit_T_148 = _bit_T_61 == 7'h12; // @[Decode.scala 14:121]
  wire  _bit_T_150 = _bit_T_59 == 7'h18; // @[Decode.scala 14:121]
  wire [6:0] _bit_T_151 = io_rrd_uop_uopc & 7'h7a; // @[Decode.scala 14:65]
  wire  _bit_T_152 = _bit_T_151 == 7'h18; // @[Decode.scala 14:121]
  wire  hi_hi_1 = _bit_T_140 | _bit_T_142 | _bit_T_144 | _bit_T_146 | _bit_T_148 | _bit_T_150 | _bit_T_152 | _bit_T_94; // @[Decode.scala 15:30]
  wire [3:0] rrd_cs_riscv_op_fcn = {hi_hi_1,hi_lo_1,lo_hi_1,lo_lo_1}; // @[Cat.scala 30:58]
  wire  _bit_T_160 = io_rrd_uop_uopc == 7'h2b; // @[Decode.scala 14:121]
  wire  _bit_T_161 = io_rrd_uop_uopc == 7'h2e; // @[Decode.scala 14:121]
  wire  _bit_T_162 = io_rrd_uop_uopc == 7'h30; // @[Decode.scala 14:121]
  wire  _bit_T_163 = io_rrd_uop_uopc == 7'h32; // @[Decode.scala 14:121]
  wire  _bit_T_164 = io_rrd_uop_uopc == 7'h2c; // @[Decode.scala 14:121]
  wire  _bit_T_165 = io_rrd_uop_uopc == 7'h2f; // @[Decode.scala 14:121]
  wire  _bit_T_166 = io_rrd_uop_uopc == 7'h31; // @[Decode.scala 14:121]
  wire  _bit_T_167 = io_rrd_uop_uopc == 7'h33; // @[Decode.scala 14:121]
  wire  bit_2 = _bit_T_160 | _bit_T_161 | _bit_T_162 | _bit_T_163 | _bit_T_164 | _bit_T_94 | _bit_T_165 | _bit_T_166 |
    _bit_T_167 | _bit_T_21 | _bit_T_26 | _bit_T_27 | _bit_T_28 | _bit_T_29; // @[Decode.scala 15:30]
  wire  rrd_cs_riscv_fcn_dw = ~bit_2; // @[Decode.scala 40:35]
  wire [6:0] _T_4 = io_rrd_uop_uopc & 7'h5b; // @[Decode.scala 14:65]
  wire  lo_2 = _T_4 == 7'h0; // @[Decode.scala 14:121]
  wire [6:0] _T_6 = io_rrd_uop_uopc & 7'h38; // @[Decode.scala 14:65]
  wire  hi_2 = _T_6 == 7'h20; // @[Decode.scala 14:121]
  wire [1:0] rrd_cs_riscv_op1_sel = {hi_2,lo_2}; // @[Cat.scala 30:58]
  wire [6:0] _T_9 = io_rrd_uop_uopc & 7'h72; // @[Decode.scala 14:65]
  wire  _T_10 = _T_9 == 7'h0; // @[Decode.scala 14:121]
  wire [6:0] _T_11 = io_rrd_uop_uopc & 7'h58; // @[Decode.scala 14:65]
  wire  _T_12 = _T_11 == 7'h0; // @[Decode.scala 14:121]
  wire [6:0] _T_13 = io_rrd_uop_uopc & 7'h54; // @[Decode.scala 14:65]
  wire  _T_14 = _T_13 == 7'h0; // @[Decode.scala 14:121]
  wire [6:0] _T_15 = io_rrd_uop_uopc & 7'h2d; // @[Decode.scala 14:65]
  wire  _T_16 = _T_15 == 7'h20; // @[Decode.scala 14:121]
  wire [6:0] _T_17 = io_rrd_uop_uopc & 7'h33; // @[Decode.scala 14:65]
  wire  _T_18 = _T_17 == 7'h22; // @[Decode.scala 14:121]
  wire  lo_3 = _T_10 | _T_12 | _T_14 | _T_16 | _T_18; // @[Decode.scala 15:30]
  wire [6:0] _T_23 = io_rrd_uop_uopc & 7'h3a; // @[Decode.scala 14:65]
  wire  _T_24 = _T_23 == 7'h20; // @[Decode.scala 14:121]
  wire [6:0] _T_25 = io_rrd_uop_uopc & 7'h39; // @[Decode.scala 14:65]
  wire  _T_26 = _T_25 == 7'h20; // @[Decode.scala 14:121]
  wire  hi_lo_2 = _T_24 | _T_26; // @[Decode.scala 15:30]
  wire [2:0] rrd_cs_riscv_op2_sel = {1'h0,hi_lo_2,lo_3}; // @[Cat.scala 30:58]
  wire [6:0] _T_29 = io_rrd_uop_uopc & 7'h2b; // @[Decode.scala 14:65]
  wire  _T_30 = _T_29 == 7'h0; // @[Decode.scala 14:121]
  wire  _T_32 = _T_29 == 7'h23; // @[Decode.scala 14:121]
  wire  lo_4 = _T_30 | _T_32; // @[Decode.scala 15:30]
  wire [6:0] _T_34 = io_rrd_uop_uopc & 7'h30; // @[Decode.scala 14:65]
  wire  _T_35 = _T_34 == 7'h10; // @[Decode.scala 14:121]
  wire  hi_lo_3 = _T_30 | _T_35 | _T_32; // @[Decode.scala 15:30]
  wire [6:0] _T_38 = io_rrd_uop_uopc & 7'h32; // @[Decode.scala 14:65]
  wire  hi_hi_2 = _T_38 == 7'h20; // @[Decode.scala 14:121]
  wire [2:0] rrd_cs_riscv_imm_sel = {hi_hi_2,hi_lo_3,lo_4}; // @[Cat.scala 30:58]
  wire  _bit_T_182 = io_rrd_uop_uopc == 7'h5; // @[Decode.scala 14:121]
  wire  _bit_T_189 = io_rrd_uop_uopc == 7'hf; // @[Decode.scala 14:121]
  wire  lo_hi_3 = io_rrd_uop_uopc == 7'h10; // @[Decode.scala 14:121]
  wire  _bit_T_252 = io_rrd_uop_uopc == 7'h71; // @[Decode.scala 14:121]
  wire  lo_lo_2 = lo_hi_2 | _bit_T_252; // @[Decode.scala 15:30]
  wire  hi_hi_3 = hi_hi | _bit_T_252; // @[Decode.scala 15:30]
  wire [3:0] rrd_cs_unicore_br_type = {hi_hi_3,lo_hi_2,lo_hi_2,lo_lo_2}; // @[Cat.scala 30:58]
  wire [3:0] rrd_cs_unicore_op_fcn = {lo_hi_3,1'h0,lo_hi_3,1'h0}; // @[Cat.scala 30:58]
  wire  bit_6 = _bit_T_182 | _bit_T_189 | lo_hi_3 | lo_hi_2 | hi_hi | _bit_T_252; // @[Decode.scala 15:30]
  wire  rrd_cs_unicore_fcn_dw = ~bit_6; // @[Decode.scala 40:35]
  wire  _T_47 = _T_34 == 7'h20; // @[Decode.scala 14:121]
  wire [6:0] _T_48 = io_rrd_uop_uopc & 7'h40; // @[Decode.scala 14:65]
  wire  _T_49 = _T_48 == 7'h40; // @[Decode.scala 14:121]
  wire  hi_8 = _T_47 | _T_49; // @[Decode.scala 15:30]
  wire [1:0] rrd_cs_unicore_op1_sel = {hi_8,1'h0}; // @[Cat.scala 30:58]
  wire  lo_7 = _T_6 == 7'h0; // @[Decode.scala 14:121]
  wire [2:0] rrd_cs_unicore_op2_sel = {1'h0,hi_8,lo_7}; // @[Cat.scala 30:58]
  wire  _T_69 = io_rrd_uop_uopc == 7'h43; // @[func-unit-decode.scala 429:26]
  assign io_rrd_valid = io_iss_valid; // @[func-unit-decode.scala 467:16]
  assign io_rrd_uop_switch = io_iss_uop_switch; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_switch_off = io_iss_uop_switch_off; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_is_unicore = io_iss_uop_is_unicore; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_shift = io_iss_uop_shift; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_lrs3_rtype = io_iss_uop_lrs3_rtype; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_rflag = io_iss_uop_rflag; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_wflag = io_iss_uop_wflag; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_prflag = io_iss_uop_prflag; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_pwflag = io_iss_uop_pwflag; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_pflag_busy = io_iss_uop_pflag_busy; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_stale_pflag = io_iss_uop_stale_pflag; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_op1_sel = io_iss_uop_op1_sel; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_op2_sel = io_iss_uop_op2_sel; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_split_num = io_iss_uop_split_num; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_self_index = io_iss_uop_self_index; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_rob_inst_idx = io_iss_uop_rob_inst_idx; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_address_num = io_iss_uop_address_num; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_uopc = io_iss_uop_uopc; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_inst = io_iss_uop_inst; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_debug_inst = io_iss_uop_debug_inst; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_is_rvc = io_iss_uop_is_rvc; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_debug_pc = io_iss_uop_debug_pc; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_iq_type = io_iss_uop_iq_type; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_fu_code = io_iss_uop_fu_code; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_ctrl_br_type = io_rrd_uop_is_unicore ? rrd_cs_unicore_br_type : rrd_cs_riscv_br_type; // @[func-unit-decode.scala 414:33]
  assign io_rrd_uop_ctrl_op1_sel = io_rrd_uop_is_unicore ? rrd_cs_unicore_op1_sel : rrd_cs_riscv_op1_sel; // @[func-unit-decode.scala 415:33]
  assign io_rrd_uop_ctrl_op2_sel = io_rrd_uop_is_unicore ? rrd_cs_unicore_op2_sel : rrd_cs_riscv_op2_sel; // @[func-unit-decode.scala 416:33]
  assign io_rrd_uop_ctrl_imm_sel = ~io_rrd_uop_is_unicore ? rrd_cs_riscv_imm_sel : io_iss_uop_ctrl_imm_sel; // @[func-unit-decode.scala 423:33 func-unit-decode.scala 424:29 func-unit-decode.scala 397:16]
  assign io_rrd_uop_ctrl_op_fcn = io_rrd_uop_is_unicore ? rrd_cs_unicore_op_fcn : rrd_cs_riscv_op_fcn; // @[func-unit-decode.scala 418:33]
  assign io_rrd_uop_ctrl_fcn_dw = io_rrd_uop_is_unicore ? rrd_cs_unicore_fcn_dw : rrd_cs_riscv_fcn_dw; // @[func-unit-decode.scala 419:33]
  assign io_rrd_uop_ctrl_csr_cmd = 3'h0; // @[func-unit-decode.scala 440:33]
  assign io_rrd_uop_ctrl_is_load = io_rrd_uop_uopc == 7'h1; // @[func-unit-decode.scala 434:46]
  assign io_rrd_uop_ctrl_is_sta = io_rrd_uop_uopc == 7'h2 | _T_69; // @[func-unit-decode.scala 435:57]
  assign io_rrd_uop_ctrl_is_std = io_rrd_uop_uopc == 7'h3 | io_rrd_uop_ctrl_is_sta & io_rrd_uop_lrs2_rtype == 2'h0; // @[func-unit-decode.scala 436:57]
  assign io_rrd_uop_ctrl_op3_sel = io_rrd_uop_is_unicore ? io_rrd_uop_lrs3_rtype : 2'h0; // @[func-unit-decode.scala 420:33]
  assign io_rrd_uop_iw_state = io_iss_uop_iw_state; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_iw_p1_poisoned = io_iss_uop_iw_p1_poisoned; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_iw_p2_poisoned = io_iss_uop_iw_p2_poisoned; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_is_br = io_iss_uop_is_br; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_is_jalr = io_iss_uop_is_jalr; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_is_jal = io_iss_uop_is_jal; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_is_sfb = io_iss_uop_is_sfb; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_br_mask = io_iss_uop_br_mask; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_br_tag = io_iss_uop_br_tag; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_ftq_idx = io_iss_uop_ftq_idx; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_edge_inst = io_iss_uop_edge_inst; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_pc_lob = io_iss_uop_pc_lob; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_taken = io_iss_uop_taken; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_imm_packed = io_rrd_uop_uopc == 7'h43 | io_rrd_uop_uopc == 7'h1 & io_rrd_uop_mem_cmd == 5'h6 ? 20'h0
     : io_iss_uop_imm_packed; // @[func-unit-decode.scala 429:105 func-unit-decode.scala 430:27 func-unit-decode.scala 397:16]
  assign io_rrd_uop_csr_addr = io_iss_uop_csr_addr; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_rob_idx = io_iss_uop_rob_idx; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_ldq_idx = io_iss_uop_ldq_idx; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_stq_idx = io_iss_uop_stq_idx; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_rxq_idx = io_iss_uop_rxq_idx; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_pdst = io_iss_uop_pdst; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_prs1 = io_iss_uop_prs1; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_prs2 = io_iss_uop_prs2; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_prs3 = io_iss_uop_prs3; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_ppred = io_iss_uop_ppred; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_prs1_busy = io_iss_uop_prs1_busy; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_prs2_busy = io_iss_uop_prs2_busy; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_prs3_busy = io_iss_uop_prs3_busy; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_ppred_busy = io_iss_uop_ppred_busy; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_stale_pdst = io_iss_uop_stale_pdst; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_exception = io_iss_uop_exception; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_exc_cause = io_iss_uop_exc_cause; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_bypassable = io_iss_uop_bypassable; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_mem_cmd = io_iss_uop_mem_cmd; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_mem_size = io_iss_uop_mem_size; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_mem_signed = io_iss_uop_mem_signed; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_is_fence = io_iss_uop_is_fence; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_is_fencei = io_iss_uop_is_fencei; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_is_amo = io_iss_uop_is_amo; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_uses_ldq = io_iss_uop_uses_ldq; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_uses_stq = io_iss_uop_uses_stq; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_is_sys_pc2epc = io_iss_uop_is_sys_pc2epc; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_is_unique = io_iss_uop_is_unique; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_flush_on_commit = io_iss_uop_flush_on_commit; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_ldst_is_rs1 = io_iss_uop_ldst_is_rs1; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_ldst = io_iss_uop_ldst; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_lrs1 = io_iss_uop_lrs1; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_lrs2 = io_iss_uop_lrs2; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_lrs3 = io_iss_uop_lrs3; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_ldst_val = io_iss_uop_ldst_val; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_dst_rtype = io_iss_uop_dst_rtype; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_lrs1_rtype = io_iss_uop_lrs1_rtype; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_lrs2_rtype = io_iss_uop_lrs2_rtype; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_frs3_en = io_iss_uop_frs3_en; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_fp_val = io_iss_uop_fp_val; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_fp_single = io_iss_uop_fp_single; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_xcpt_pf_if = io_iss_uop_xcpt_pf_if; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_xcpt_ae_if = io_iss_uop_xcpt_ae_if; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_xcpt_ma_if = io_iss_uop_xcpt_ma_if; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_bp_debug_if = io_iss_uop_bp_debug_if; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_bp_xcpt_if = io_iss_uop_bp_xcpt_if; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_debug_fsrc = io_iss_uop_debug_fsrc; // @[func-unit-decode.scala 397:16]
  assign io_rrd_uop_debug_tsrc = io_iss_uop_debug_tsrc; // @[func-unit-decode.scala 397:16]
endmodule
