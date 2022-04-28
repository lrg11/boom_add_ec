module Arbiter_18(
  input         clock,
  input         reset,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input         io_in_0_bits_uop_switch,
  input         io_in_0_bits_uop_switch_off,
  input         io_in_0_bits_uop_is_unicore,
  input  [2:0]  io_in_0_bits_uop_shift,
  input  [1:0]  io_in_0_bits_uop_lrs3_rtype,
  input         io_in_0_bits_uop_rflag,
  input         io_in_0_bits_uop_wflag,
  input  [3:0]  io_in_0_bits_uop_prflag,
  input  [3:0]  io_in_0_bits_uop_pwflag,
  input         io_in_0_bits_uop_pflag_busy,
  input  [3:0]  io_in_0_bits_uop_stale_pflag,
  input  [3:0]  io_in_0_bits_uop_op1_sel,
  input  [3:0]  io_in_0_bits_uop_op2_sel,
  input  [5:0]  io_in_0_bits_uop_split_num,
  input  [5:0]  io_in_0_bits_uop_self_index,
  input  [5:0]  io_in_0_bits_uop_rob_inst_idx,
  input  [5:0]  io_in_0_bits_uop_address_num,
  input  [6:0]  io_in_0_bits_uop_uopc,
  input  [31:0] io_in_0_bits_uop_inst,
  input  [31:0] io_in_0_bits_uop_debug_inst,
  input         io_in_0_bits_uop_is_rvc,
  input  [39:0] io_in_0_bits_uop_debug_pc,
  input  [2:0]  io_in_0_bits_uop_iq_type,
  input  [9:0]  io_in_0_bits_uop_fu_code,
  input  [3:0]  io_in_0_bits_uop_ctrl_br_type,
  input  [1:0]  io_in_0_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_in_0_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_in_0_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_in_0_bits_uop_ctrl_op_fcn,
  input         io_in_0_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_in_0_bits_uop_ctrl_csr_cmd,
  input         io_in_0_bits_uop_ctrl_is_load,
  input         io_in_0_bits_uop_ctrl_is_sta,
  input         io_in_0_bits_uop_ctrl_is_std,
  input  [1:0]  io_in_0_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_in_0_bits_uop_iw_state,
  input         io_in_0_bits_uop_iw_p1_poisoned,
  input         io_in_0_bits_uop_iw_p2_poisoned,
  input         io_in_0_bits_uop_is_br,
  input         io_in_0_bits_uop_is_jalr,
  input         io_in_0_bits_uop_is_jal,
  input         io_in_0_bits_uop_is_sfb,
  input  [11:0] io_in_0_bits_uop_br_mask,
  input  [3:0]  io_in_0_bits_uop_br_tag,
  input  [4:0]  io_in_0_bits_uop_ftq_idx,
  input         io_in_0_bits_uop_edge_inst,
  input  [5:0]  io_in_0_bits_uop_pc_lob,
  input         io_in_0_bits_uop_taken,
  input  [19:0] io_in_0_bits_uop_imm_packed,
  input  [11:0] io_in_0_bits_uop_csr_addr,
  input  [5:0]  io_in_0_bits_uop_rob_idx,
  input  [4:0]  io_in_0_bits_uop_ldq_idx,
  input  [4:0]  io_in_0_bits_uop_stq_idx,
  input  [1:0]  io_in_0_bits_uop_rxq_idx,
  input  [6:0]  io_in_0_bits_uop_pdst,
  input  [6:0]  io_in_0_bits_uop_prs1,
  input  [6:0]  io_in_0_bits_uop_prs2,
  input  [6:0]  io_in_0_bits_uop_prs3,
  input  [4:0]  io_in_0_bits_uop_ppred,
  input         io_in_0_bits_uop_prs1_busy,
  input         io_in_0_bits_uop_prs2_busy,
  input         io_in_0_bits_uop_prs3_busy,
  input         io_in_0_bits_uop_ppred_busy,
  input  [6:0]  io_in_0_bits_uop_stale_pdst,
  input         io_in_0_bits_uop_exception,
  input  [63:0] io_in_0_bits_uop_exc_cause,
  input         io_in_0_bits_uop_bypassable,
  input  [4:0]  io_in_0_bits_uop_mem_cmd,
  input  [1:0]  io_in_0_bits_uop_mem_size,
  input         io_in_0_bits_uop_mem_signed,
  input         io_in_0_bits_uop_is_fence,
  input         io_in_0_bits_uop_is_fencei,
  input         io_in_0_bits_uop_is_amo,
  input         io_in_0_bits_uop_uses_ldq,
  input         io_in_0_bits_uop_uses_stq,
  input         io_in_0_bits_uop_is_sys_pc2epc,
  input         io_in_0_bits_uop_is_unique,
  input         io_in_0_bits_uop_flush_on_commit,
  input         io_in_0_bits_uop_ldst_is_rs1,
  input  [5:0]  io_in_0_bits_uop_ldst,
  input  [5:0]  io_in_0_bits_uop_lrs1,
  input  [5:0]  io_in_0_bits_uop_lrs2,
  input  [5:0]  io_in_0_bits_uop_lrs3,
  input         io_in_0_bits_uop_ldst_val,
  input  [1:0]  io_in_0_bits_uop_dst_rtype,
  input  [1:0]  io_in_0_bits_uop_lrs1_rtype,
  input  [1:0]  io_in_0_bits_uop_lrs2_rtype,
  input         io_in_0_bits_uop_frs3_en,
  input         io_in_0_bits_uop_fp_val,
  input         io_in_0_bits_uop_fp_single,
  input         io_in_0_bits_uop_xcpt_pf_if,
  input         io_in_0_bits_uop_xcpt_ae_if,
  input         io_in_0_bits_uop_xcpt_ma_if,
  input         io_in_0_bits_uop_bp_debug_if,
  input         io_in_0_bits_uop_bp_xcpt_if,
  input  [1:0]  io_in_0_bits_uop_debug_fsrc,
  input  [1:0]  io_in_0_bits_uop_debug_tsrc,
  input  [63:0] io_in_0_bits_data,
  input         io_in_0_bits_predicated,
  input         io_in_0_bits_fflags_valid,
  input         io_in_0_bits_fflags_bits_uop_switch,
  input         io_in_0_bits_fflags_bits_uop_switch_off,
  input         io_in_0_bits_fflags_bits_uop_is_unicore,
  input  [2:0]  io_in_0_bits_fflags_bits_uop_shift,
  input  [1:0]  io_in_0_bits_fflags_bits_uop_lrs3_rtype,
  input         io_in_0_bits_fflags_bits_uop_rflag,
  input         io_in_0_bits_fflags_bits_uop_wflag,
  input  [3:0]  io_in_0_bits_fflags_bits_uop_prflag,
  input  [3:0]  io_in_0_bits_fflags_bits_uop_pwflag,
  input         io_in_0_bits_fflags_bits_uop_pflag_busy,
  input  [3:0]  io_in_0_bits_fflags_bits_uop_stale_pflag,
  input  [3:0]  io_in_0_bits_fflags_bits_uop_op1_sel,
  input  [3:0]  io_in_0_bits_fflags_bits_uop_op2_sel,
  input  [5:0]  io_in_0_bits_fflags_bits_uop_split_num,
  input  [5:0]  io_in_0_bits_fflags_bits_uop_self_index,
  input  [5:0]  io_in_0_bits_fflags_bits_uop_rob_inst_idx,
  input  [5:0]  io_in_0_bits_fflags_bits_uop_address_num,
  input  [6:0]  io_in_0_bits_fflags_bits_uop_uopc,
  input  [31:0] io_in_0_bits_fflags_bits_uop_inst,
  input  [31:0] io_in_0_bits_fflags_bits_uop_debug_inst,
  input         io_in_0_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_in_0_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_in_0_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_in_0_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_in_0_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_in_0_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_in_0_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_in_0_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_in_0_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_in_0_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_in_0_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_in_0_bits_fflags_bits_uop_ctrl_is_load,
  input         io_in_0_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_in_0_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_in_0_bits_fflags_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_in_0_bits_fflags_bits_uop_iw_state,
  input         io_in_0_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_in_0_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_in_0_bits_fflags_bits_uop_is_br,
  input         io_in_0_bits_fflags_bits_uop_is_jalr,
  input         io_in_0_bits_fflags_bits_uop_is_jal,
  input         io_in_0_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_in_0_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_in_0_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_in_0_bits_fflags_bits_uop_ftq_idx,
  input         io_in_0_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_in_0_bits_fflags_bits_uop_pc_lob,
  input         io_in_0_bits_fflags_bits_uop_taken,
  input  [19:0] io_in_0_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_in_0_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_in_0_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_in_0_bits_fflags_bits_uop_ldq_idx,
  input  [4:0]  io_in_0_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_in_0_bits_fflags_bits_uop_rxq_idx,
  input  [6:0]  io_in_0_bits_fflags_bits_uop_pdst,
  input  [6:0]  io_in_0_bits_fflags_bits_uop_prs1,
  input  [6:0]  io_in_0_bits_fflags_bits_uop_prs2,
  input  [6:0]  io_in_0_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_in_0_bits_fflags_bits_uop_ppred,
  input         io_in_0_bits_fflags_bits_uop_prs1_busy,
  input         io_in_0_bits_fflags_bits_uop_prs2_busy,
  input         io_in_0_bits_fflags_bits_uop_prs3_busy,
  input         io_in_0_bits_fflags_bits_uop_ppred_busy,
  input  [6:0]  io_in_0_bits_fflags_bits_uop_stale_pdst,
  input         io_in_0_bits_fflags_bits_uop_exception,
  input  [63:0] io_in_0_bits_fflags_bits_uop_exc_cause,
  input         io_in_0_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_in_0_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_in_0_bits_fflags_bits_uop_mem_size,
  input         io_in_0_bits_fflags_bits_uop_mem_signed,
  input         io_in_0_bits_fflags_bits_uop_is_fence,
  input         io_in_0_bits_fflags_bits_uop_is_fencei,
  input         io_in_0_bits_fflags_bits_uop_is_amo,
  input         io_in_0_bits_fflags_bits_uop_uses_ldq,
  input         io_in_0_bits_fflags_bits_uop_uses_stq,
  input         io_in_0_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_in_0_bits_fflags_bits_uop_is_unique,
  input         io_in_0_bits_fflags_bits_uop_flush_on_commit,
  input         io_in_0_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_in_0_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_in_0_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_in_0_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_in_0_bits_fflags_bits_uop_lrs3,
  input         io_in_0_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_in_0_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_in_0_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_in_0_bits_fflags_bits_uop_lrs2_rtype,
  input         io_in_0_bits_fflags_bits_uop_frs3_en,
  input         io_in_0_bits_fflags_bits_uop_fp_val,
  input         io_in_0_bits_fflags_bits_uop_fp_single,
  input         io_in_0_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_in_0_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_in_0_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_in_0_bits_fflags_bits_uop_bp_debug_if,
  input         io_in_0_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_in_0_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_in_0_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_in_0_bits_fflags_bits_flags,
  input  [3:0]  io_in_0_bits_flagdata,
  input         io_in_0_bits_fflagdata_valid,
  input         io_in_0_bits_fflagdata_bits_uop_switch,
  input         io_in_0_bits_fflagdata_bits_uop_switch_off,
  input         io_in_0_bits_fflagdata_bits_uop_is_unicore,
  input  [2:0]  io_in_0_bits_fflagdata_bits_uop_shift,
  input  [1:0]  io_in_0_bits_fflagdata_bits_uop_lrs3_rtype,
  input         io_in_0_bits_fflagdata_bits_uop_rflag,
  input         io_in_0_bits_fflagdata_bits_uop_wflag,
  input  [3:0]  io_in_0_bits_fflagdata_bits_uop_prflag,
  input  [3:0]  io_in_0_bits_fflagdata_bits_uop_pwflag,
  input         io_in_0_bits_fflagdata_bits_uop_pflag_busy,
  input  [3:0]  io_in_0_bits_fflagdata_bits_uop_stale_pflag,
  input  [3:0]  io_in_0_bits_fflagdata_bits_uop_op1_sel,
  input  [3:0]  io_in_0_bits_fflagdata_bits_uop_op2_sel,
  input  [5:0]  io_in_0_bits_fflagdata_bits_uop_split_num,
  input  [5:0]  io_in_0_bits_fflagdata_bits_uop_self_index,
  input  [5:0]  io_in_0_bits_fflagdata_bits_uop_rob_inst_idx,
  input  [5:0]  io_in_0_bits_fflagdata_bits_uop_address_num,
  input  [6:0]  io_in_0_bits_fflagdata_bits_uop_uopc,
  input  [31:0] io_in_0_bits_fflagdata_bits_uop_inst,
  input  [31:0] io_in_0_bits_fflagdata_bits_uop_debug_inst,
  input         io_in_0_bits_fflagdata_bits_uop_is_rvc,
  input  [39:0] io_in_0_bits_fflagdata_bits_uop_debug_pc,
  input  [2:0]  io_in_0_bits_fflagdata_bits_uop_iq_type,
  input  [9:0]  io_in_0_bits_fflagdata_bits_uop_fu_code,
  input  [3:0]  io_in_0_bits_fflagdata_bits_uop_ctrl_br_type,
  input  [1:0]  io_in_0_bits_fflagdata_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_in_0_bits_fflagdata_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_in_0_bits_fflagdata_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_in_0_bits_fflagdata_bits_uop_ctrl_op_fcn,
  input         io_in_0_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_in_0_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  input         io_in_0_bits_fflagdata_bits_uop_ctrl_is_load,
  input         io_in_0_bits_fflagdata_bits_uop_ctrl_is_sta,
  input         io_in_0_bits_fflagdata_bits_uop_ctrl_is_std,
  input  [1:0]  io_in_0_bits_fflagdata_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_in_0_bits_fflagdata_bits_uop_iw_state,
  input         io_in_0_bits_fflagdata_bits_uop_iw_p1_poisoned,
  input         io_in_0_bits_fflagdata_bits_uop_iw_p2_poisoned,
  input         io_in_0_bits_fflagdata_bits_uop_is_br,
  input         io_in_0_bits_fflagdata_bits_uop_is_jalr,
  input         io_in_0_bits_fflagdata_bits_uop_is_jal,
  input         io_in_0_bits_fflagdata_bits_uop_is_sfb,
  input  [11:0] io_in_0_bits_fflagdata_bits_uop_br_mask,
  input  [3:0]  io_in_0_bits_fflagdata_bits_uop_br_tag,
  input  [4:0]  io_in_0_bits_fflagdata_bits_uop_ftq_idx,
  input         io_in_0_bits_fflagdata_bits_uop_edge_inst,
  input  [5:0]  io_in_0_bits_fflagdata_bits_uop_pc_lob,
  input         io_in_0_bits_fflagdata_bits_uop_taken,
  input  [19:0] io_in_0_bits_fflagdata_bits_uop_imm_packed,
  input  [11:0] io_in_0_bits_fflagdata_bits_uop_csr_addr,
  input  [5:0]  io_in_0_bits_fflagdata_bits_uop_rob_idx,
  input  [4:0]  io_in_0_bits_fflagdata_bits_uop_ldq_idx,
  input  [4:0]  io_in_0_bits_fflagdata_bits_uop_stq_idx,
  input  [1:0]  io_in_0_bits_fflagdata_bits_uop_rxq_idx,
  input  [6:0]  io_in_0_bits_fflagdata_bits_uop_pdst,
  input  [6:0]  io_in_0_bits_fflagdata_bits_uop_prs1,
  input  [6:0]  io_in_0_bits_fflagdata_bits_uop_prs2,
  input  [6:0]  io_in_0_bits_fflagdata_bits_uop_prs3,
  input  [4:0]  io_in_0_bits_fflagdata_bits_uop_ppred,
  input         io_in_0_bits_fflagdata_bits_uop_prs1_busy,
  input         io_in_0_bits_fflagdata_bits_uop_prs2_busy,
  input         io_in_0_bits_fflagdata_bits_uop_prs3_busy,
  input         io_in_0_bits_fflagdata_bits_uop_ppred_busy,
  input  [6:0]  io_in_0_bits_fflagdata_bits_uop_stale_pdst,
  input         io_in_0_bits_fflagdata_bits_uop_exception,
  input  [63:0] io_in_0_bits_fflagdata_bits_uop_exc_cause,
  input         io_in_0_bits_fflagdata_bits_uop_bypassable,
  input  [4:0]  io_in_0_bits_fflagdata_bits_uop_mem_cmd,
  input  [1:0]  io_in_0_bits_fflagdata_bits_uop_mem_size,
  input         io_in_0_bits_fflagdata_bits_uop_mem_signed,
  input         io_in_0_bits_fflagdata_bits_uop_is_fence,
  input         io_in_0_bits_fflagdata_bits_uop_is_fencei,
  input         io_in_0_bits_fflagdata_bits_uop_is_amo,
  input         io_in_0_bits_fflagdata_bits_uop_uses_ldq,
  input         io_in_0_bits_fflagdata_bits_uop_uses_stq,
  input         io_in_0_bits_fflagdata_bits_uop_is_sys_pc2epc,
  input         io_in_0_bits_fflagdata_bits_uop_is_unique,
  input         io_in_0_bits_fflagdata_bits_uop_flush_on_commit,
  input         io_in_0_bits_fflagdata_bits_uop_ldst_is_rs1,
  input  [5:0]  io_in_0_bits_fflagdata_bits_uop_ldst,
  input  [5:0]  io_in_0_bits_fflagdata_bits_uop_lrs1,
  input  [5:0]  io_in_0_bits_fflagdata_bits_uop_lrs2,
  input  [5:0]  io_in_0_bits_fflagdata_bits_uop_lrs3,
  input         io_in_0_bits_fflagdata_bits_uop_ldst_val,
  input  [1:0]  io_in_0_bits_fflagdata_bits_uop_dst_rtype,
  input  [1:0]  io_in_0_bits_fflagdata_bits_uop_lrs1_rtype,
  input  [1:0]  io_in_0_bits_fflagdata_bits_uop_lrs2_rtype,
  input         io_in_0_bits_fflagdata_bits_uop_frs3_en,
  input         io_in_0_bits_fflagdata_bits_uop_fp_val,
  input         io_in_0_bits_fflagdata_bits_uop_fp_single,
  input         io_in_0_bits_fflagdata_bits_uop_xcpt_pf_if,
  input         io_in_0_bits_fflagdata_bits_uop_xcpt_ae_if,
  input         io_in_0_bits_fflagdata_bits_uop_xcpt_ma_if,
  input         io_in_0_bits_fflagdata_bits_uop_bp_debug_if,
  input         io_in_0_bits_fflagdata_bits_uop_bp_xcpt_if,
  input  [1:0]  io_in_0_bits_fflagdata_bits_uop_debug_fsrc,
  input  [1:0]  io_in_0_bits_fflagdata_bits_uop_debug_tsrc,
  input  [31:0] io_in_0_bits_fflagdata_bits_fflag,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input         io_in_1_bits_uop_switch,
  input         io_in_1_bits_uop_switch_off,
  input         io_in_1_bits_uop_is_unicore,
  input  [2:0]  io_in_1_bits_uop_shift,
  input  [1:0]  io_in_1_bits_uop_lrs3_rtype,
  input         io_in_1_bits_uop_rflag,
  input         io_in_1_bits_uop_wflag,
  input  [3:0]  io_in_1_bits_uop_prflag,
  input  [3:0]  io_in_1_bits_uop_pwflag,
  input         io_in_1_bits_uop_pflag_busy,
  input  [3:0]  io_in_1_bits_uop_stale_pflag,
  input  [3:0]  io_in_1_bits_uop_op1_sel,
  input  [3:0]  io_in_1_bits_uop_op2_sel,
  input  [5:0]  io_in_1_bits_uop_split_num,
  input  [5:0]  io_in_1_bits_uop_self_index,
  input  [5:0]  io_in_1_bits_uop_rob_inst_idx,
  input  [5:0]  io_in_1_bits_uop_address_num,
  input  [6:0]  io_in_1_bits_uop_uopc,
  input  [31:0] io_in_1_bits_uop_inst,
  input  [31:0] io_in_1_bits_uop_debug_inst,
  input         io_in_1_bits_uop_is_rvc,
  input  [39:0] io_in_1_bits_uop_debug_pc,
  input  [2:0]  io_in_1_bits_uop_iq_type,
  input  [9:0]  io_in_1_bits_uop_fu_code,
  input  [3:0]  io_in_1_bits_uop_ctrl_br_type,
  input  [1:0]  io_in_1_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_in_1_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_in_1_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_in_1_bits_uop_ctrl_op_fcn,
  input         io_in_1_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_in_1_bits_uop_ctrl_csr_cmd,
  input         io_in_1_bits_uop_ctrl_is_load,
  input         io_in_1_bits_uop_ctrl_is_sta,
  input         io_in_1_bits_uop_ctrl_is_std,
  input  [1:0]  io_in_1_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_in_1_bits_uop_iw_state,
  input         io_in_1_bits_uop_iw_p1_poisoned,
  input         io_in_1_bits_uop_iw_p2_poisoned,
  input         io_in_1_bits_uop_is_br,
  input         io_in_1_bits_uop_is_jalr,
  input         io_in_1_bits_uop_is_jal,
  input         io_in_1_bits_uop_is_sfb,
  input  [11:0] io_in_1_bits_uop_br_mask,
  input  [3:0]  io_in_1_bits_uop_br_tag,
  input  [4:0]  io_in_1_bits_uop_ftq_idx,
  input         io_in_1_bits_uop_edge_inst,
  input  [5:0]  io_in_1_bits_uop_pc_lob,
  input         io_in_1_bits_uop_taken,
  input  [19:0] io_in_1_bits_uop_imm_packed,
  input  [11:0] io_in_1_bits_uop_csr_addr,
  input  [5:0]  io_in_1_bits_uop_rob_idx,
  input  [4:0]  io_in_1_bits_uop_ldq_idx,
  input  [4:0]  io_in_1_bits_uop_stq_idx,
  input  [1:0]  io_in_1_bits_uop_rxq_idx,
  input  [6:0]  io_in_1_bits_uop_pdst,
  input  [6:0]  io_in_1_bits_uop_prs1,
  input  [6:0]  io_in_1_bits_uop_prs2,
  input  [6:0]  io_in_1_bits_uop_prs3,
  input  [4:0]  io_in_1_bits_uop_ppred,
  input         io_in_1_bits_uop_prs1_busy,
  input         io_in_1_bits_uop_prs2_busy,
  input         io_in_1_bits_uop_prs3_busy,
  input         io_in_1_bits_uop_ppred_busy,
  input  [6:0]  io_in_1_bits_uop_stale_pdst,
  input         io_in_1_bits_uop_exception,
  input  [63:0] io_in_1_bits_uop_exc_cause,
  input         io_in_1_bits_uop_bypassable,
  input  [4:0]  io_in_1_bits_uop_mem_cmd,
  input  [1:0]  io_in_1_bits_uop_mem_size,
  input         io_in_1_bits_uop_mem_signed,
  input         io_in_1_bits_uop_is_fence,
  input         io_in_1_bits_uop_is_fencei,
  input         io_in_1_bits_uop_is_amo,
  input         io_in_1_bits_uop_uses_ldq,
  input         io_in_1_bits_uop_uses_stq,
  input         io_in_1_bits_uop_is_sys_pc2epc,
  input         io_in_1_bits_uop_is_unique,
  input         io_in_1_bits_uop_flush_on_commit,
  input         io_in_1_bits_uop_ldst_is_rs1,
  input  [5:0]  io_in_1_bits_uop_ldst,
  input  [5:0]  io_in_1_bits_uop_lrs1,
  input  [5:0]  io_in_1_bits_uop_lrs2,
  input  [5:0]  io_in_1_bits_uop_lrs3,
  input         io_in_1_bits_uop_ldst_val,
  input  [1:0]  io_in_1_bits_uop_dst_rtype,
  input  [1:0]  io_in_1_bits_uop_lrs1_rtype,
  input  [1:0]  io_in_1_bits_uop_lrs2_rtype,
  input         io_in_1_bits_uop_frs3_en,
  input         io_in_1_bits_uop_fp_val,
  input         io_in_1_bits_uop_fp_single,
  input         io_in_1_bits_uop_xcpt_pf_if,
  input         io_in_1_bits_uop_xcpt_ae_if,
  input         io_in_1_bits_uop_xcpt_ma_if,
  input         io_in_1_bits_uop_bp_debug_if,
  input         io_in_1_bits_uop_bp_xcpt_if,
  input  [1:0]  io_in_1_bits_uop_debug_fsrc,
  input  [1:0]  io_in_1_bits_uop_debug_tsrc,
  input  [63:0] io_in_1_bits_data,
  input         io_in_1_bits_predicated,
  input         io_in_1_bits_fflags_valid,
  input         io_in_1_bits_fflags_bits_uop_switch,
  input         io_in_1_bits_fflags_bits_uop_switch_off,
  input         io_in_1_bits_fflags_bits_uop_is_unicore,
  input  [2:0]  io_in_1_bits_fflags_bits_uop_shift,
  input  [1:0]  io_in_1_bits_fflags_bits_uop_lrs3_rtype,
  input         io_in_1_bits_fflags_bits_uop_rflag,
  input         io_in_1_bits_fflags_bits_uop_wflag,
  input  [3:0]  io_in_1_bits_fflags_bits_uop_prflag,
  input  [3:0]  io_in_1_bits_fflags_bits_uop_pwflag,
  input         io_in_1_bits_fflags_bits_uop_pflag_busy,
  input  [3:0]  io_in_1_bits_fflags_bits_uop_stale_pflag,
  input  [3:0]  io_in_1_bits_fflags_bits_uop_op1_sel,
  input  [3:0]  io_in_1_bits_fflags_bits_uop_op2_sel,
  input  [5:0]  io_in_1_bits_fflags_bits_uop_split_num,
  input  [5:0]  io_in_1_bits_fflags_bits_uop_self_index,
  input  [5:0]  io_in_1_bits_fflags_bits_uop_rob_inst_idx,
  input  [5:0]  io_in_1_bits_fflags_bits_uop_address_num,
  input  [6:0]  io_in_1_bits_fflags_bits_uop_uopc,
  input  [31:0] io_in_1_bits_fflags_bits_uop_inst,
  input  [31:0] io_in_1_bits_fflags_bits_uop_debug_inst,
  input         io_in_1_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_in_1_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_in_1_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_in_1_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_in_1_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_in_1_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_in_1_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_in_1_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_in_1_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_in_1_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_in_1_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_in_1_bits_fflags_bits_uop_ctrl_is_load,
  input         io_in_1_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_in_1_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_in_1_bits_fflags_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_in_1_bits_fflags_bits_uop_iw_state,
  input         io_in_1_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_in_1_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_in_1_bits_fflags_bits_uop_is_br,
  input         io_in_1_bits_fflags_bits_uop_is_jalr,
  input         io_in_1_bits_fflags_bits_uop_is_jal,
  input         io_in_1_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_in_1_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_in_1_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_in_1_bits_fflags_bits_uop_ftq_idx,
  input         io_in_1_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_in_1_bits_fflags_bits_uop_pc_lob,
  input         io_in_1_bits_fflags_bits_uop_taken,
  input  [19:0] io_in_1_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_in_1_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_in_1_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_in_1_bits_fflags_bits_uop_ldq_idx,
  input  [4:0]  io_in_1_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_in_1_bits_fflags_bits_uop_rxq_idx,
  input  [6:0]  io_in_1_bits_fflags_bits_uop_pdst,
  input  [6:0]  io_in_1_bits_fflags_bits_uop_prs1,
  input  [6:0]  io_in_1_bits_fflags_bits_uop_prs2,
  input  [6:0]  io_in_1_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_in_1_bits_fflags_bits_uop_ppred,
  input         io_in_1_bits_fflags_bits_uop_prs1_busy,
  input         io_in_1_bits_fflags_bits_uop_prs2_busy,
  input         io_in_1_bits_fflags_bits_uop_prs3_busy,
  input         io_in_1_bits_fflags_bits_uop_ppred_busy,
  input  [6:0]  io_in_1_bits_fflags_bits_uop_stale_pdst,
  input         io_in_1_bits_fflags_bits_uop_exception,
  input  [63:0] io_in_1_bits_fflags_bits_uop_exc_cause,
  input         io_in_1_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_in_1_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_in_1_bits_fflags_bits_uop_mem_size,
  input         io_in_1_bits_fflags_bits_uop_mem_signed,
  input         io_in_1_bits_fflags_bits_uop_is_fence,
  input         io_in_1_bits_fflags_bits_uop_is_fencei,
  input         io_in_1_bits_fflags_bits_uop_is_amo,
  input         io_in_1_bits_fflags_bits_uop_uses_ldq,
  input         io_in_1_bits_fflags_bits_uop_uses_stq,
  input         io_in_1_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_in_1_bits_fflags_bits_uop_is_unique,
  input         io_in_1_bits_fflags_bits_uop_flush_on_commit,
  input         io_in_1_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_in_1_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_in_1_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_in_1_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_in_1_bits_fflags_bits_uop_lrs3,
  input         io_in_1_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_in_1_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_in_1_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_in_1_bits_fflags_bits_uop_lrs2_rtype,
  input         io_in_1_bits_fflags_bits_uop_frs3_en,
  input         io_in_1_bits_fflags_bits_uop_fp_val,
  input         io_in_1_bits_fflags_bits_uop_fp_single,
  input         io_in_1_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_in_1_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_in_1_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_in_1_bits_fflags_bits_uop_bp_debug_if,
  input         io_in_1_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_in_1_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_in_1_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_in_1_bits_fflags_bits_flags,
  input  [3:0]  io_in_1_bits_flagdata,
  input         io_in_1_bits_fflagdata_valid,
  input         io_in_1_bits_fflagdata_bits_uop_switch,
  input         io_in_1_bits_fflagdata_bits_uop_switch_off,
  input         io_in_1_bits_fflagdata_bits_uop_is_unicore,
  input  [2:0]  io_in_1_bits_fflagdata_bits_uop_shift,
  input  [1:0]  io_in_1_bits_fflagdata_bits_uop_lrs3_rtype,
  input         io_in_1_bits_fflagdata_bits_uop_rflag,
  input         io_in_1_bits_fflagdata_bits_uop_wflag,
  input  [3:0]  io_in_1_bits_fflagdata_bits_uop_prflag,
  input  [3:0]  io_in_1_bits_fflagdata_bits_uop_pwflag,
  input         io_in_1_bits_fflagdata_bits_uop_pflag_busy,
  input  [3:0]  io_in_1_bits_fflagdata_bits_uop_stale_pflag,
  input  [3:0]  io_in_1_bits_fflagdata_bits_uop_op1_sel,
  input  [3:0]  io_in_1_bits_fflagdata_bits_uop_op2_sel,
  input  [5:0]  io_in_1_bits_fflagdata_bits_uop_split_num,
  input  [5:0]  io_in_1_bits_fflagdata_bits_uop_self_index,
  input  [5:0]  io_in_1_bits_fflagdata_bits_uop_rob_inst_idx,
  input  [5:0]  io_in_1_bits_fflagdata_bits_uop_address_num,
  input  [6:0]  io_in_1_bits_fflagdata_bits_uop_uopc,
  input  [31:0] io_in_1_bits_fflagdata_bits_uop_inst,
  input  [31:0] io_in_1_bits_fflagdata_bits_uop_debug_inst,
  input         io_in_1_bits_fflagdata_bits_uop_is_rvc,
  input  [39:0] io_in_1_bits_fflagdata_bits_uop_debug_pc,
  input  [2:0]  io_in_1_bits_fflagdata_bits_uop_iq_type,
  input  [9:0]  io_in_1_bits_fflagdata_bits_uop_fu_code,
  input  [3:0]  io_in_1_bits_fflagdata_bits_uop_ctrl_br_type,
  input  [1:0]  io_in_1_bits_fflagdata_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_in_1_bits_fflagdata_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_in_1_bits_fflagdata_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_in_1_bits_fflagdata_bits_uop_ctrl_op_fcn,
  input         io_in_1_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_in_1_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  input         io_in_1_bits_fflagdata_bits_uop_ctrl_is_load,
  input         io_in_1_bits_fflagdata_bits_uop_ctrl_is_sta,
  input         io_in_1_bits_fflagdata_bits_uop_ctrl_is_std,
  input  [1:0]  io_in_1_bits_fflagdata_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_in_1_bits_fflagdata_bits_uop_iw_state,
  input         io_in_1_bits_fflagdata_bits_uop_iw_p1_poisoned,
  input         io_in_1_bits_fflagdata_bits_uop_iw_p2_poisoned,
  input         io_in_1_bits_fflagdata_bits_uop_is_br,
  input         io_in_1_bits_fflagdata_bits_uop_is_jalr,
  input         io_in_1_bits_fflagdata_bits_uop_is_jal,
  input         io_in_1_bits_fflagdata_bits_uop_is_sfb,
  input  [11:0] io_in_1_bits_fflagdata_bits_uop_br_mask,
  input  [3:0]  io_in_1_bits_fflagdata_bits_uop_br_tag,
  input  [4:0]  io_in_1_bits_fflagdata_bits_uop_ftq_idx,
  input         io_in_1_bits_fflagdata_bits_uop_edge_inst,
  input  [5:0]  io_in_1_bits_fflagdata_bits_uop_pc_lob,
  input         io_in_1_bits_fflagdata_bits_uop_taken,
  input  [19:0] io_in_1_bits_fflagdata_bits_uop_imm_packed,
  input  [11:0] io_in_1_bits_fflagdata_bits_uop_csr_addr,
  input  [5:0]  io_in_1_bits_fflagdata_bits_uop_rob_idx,
  input  [4:0]  io_in_1_bits_fflagdata_bits_uop_ldq_idx,
  input  [4:0]  io_in_1_bits_fflagdata_bits_uop_stq_idx,
  input  [1:0]  io_in_1_bits_fflagdata_bits_uop_rxq_idx,
  input  [6:0]  io_in_1_bits_fflagdata_bits_uop_pdst,
  input  [6:0]  io_in_1_bits_fflagdata_bits_uop_prs1,
  input  [6:0]  io_in_1_bits_fflagdata_bits_uop_prs2,
  input  [6:0]  io_in_1_bits_fflagdata_bits_uop_prs3,
  input  [4:0]  io_in_1_bits_fflagdata_bits_uop_ppred,
  input         io_in_1_bits_fflagdata_bits_uop_prs1_busy,
  input         io_in_1_bits_fflagdata_bits_uop_prs2_busy,
  input         io_in_1_bits_fflagdata_bits_uop_prs3_busy,
  input         io_in_1_bits_fflagdata_bits_uop_ppred_busy,
  input  [6:0]  io_in_1_bits_fflagdata_bits_uop_stale_pdst,
  input         io_in_1_bits_fflagdata_bits_uop_exception,
  input  [63:0] io_in_1_bits_fflagdata_bits_uop_exc_cause,
  input         io_in_1_bits_fflagdata_bits_uop_bypassable,
  input  [4:0]  io_in_1_bits_fflagdata_bits_uop_mem_cmd,
  input  [1:0]  io_in_1_bits_fflagdata_bits_uop_mem_size,
  input         io_in_1_bits_fflagdata_bits_uop_mem_signed,
  input         io_in_1_bits_fflagdata_bits_uop_is_fence,
  input         io_in_1_bits_fflagdata_bits_uop_is_fencei,
  input         io_in_1_bits_fflagdata_bits_uop_is_amo,
  input         io_in_1_bits_fflagdata_bits_uop_uses_ldq,
  input         io_in_1_bits_fflagdata_bits_uop_uses_stq,
  input         io_in_1_bits_fflagdata_bits_uop_is_sys_pc2epc,
  input         io_in_1_bits_fflagdata_bits_uop_is_unique,
  input         io_in_1_bits_fflagdata_bits_uop_flush_on_commit,
  input         io_in_1_bits_fflagdata_bits_uop_ldst_is_rs1,
  input  [5:0]  io_in_1_bits_fflagdata_bits_uop_ldst,
  input  [5:0]  io_in_1_bits_fflagdata_bits_uop_lrs1,
  input  [5:0]  io_in_1_bits_fflagdata_bits_uop_lrs2,
  input  [5:0]  io_in_1_bits_fflagdata_bits_uop_lrs3,
  input         io_in_1_bits_fflagdata_bits_uop_ldst_val,
  input  [1:0]  io_in_1_bits_fflagdata_bits_uop_dst_rtype,
  input  [1:0]  io_in_1_bits_fflagdata_bits_uop_lrs1_rtype,
  input  [1:0]  io_in_1_bits_fflagdata_bits_uop_lrs2_rtype,
  input         io_in_1_bits_fflagdata_bits_uop_frs3_en,
  input         io_in_1_bits_fflagdata_bits_uop_fp_val,
  input         io_in_1_bits_fflagdata_bits_uop_fp_single,
  input         io_in_1_bits_fflagdata_bits_uop_xcpt_pf_if,
  input         io_in_1_bits_fflagdata_bits_uop_xcpt_ae_if,
  input         io_in_1_bits_fflagdata_bits_uop_xcpt_ma_if,
  input         io_in_1_bits_fflagdata_bits_uop_bp_debug_if,
  input         io_in_1_bits_fflagdata_bits_uop_bp_xcpt_if,
  input  [1:0]  io_in_1_bits_fflagdata_bits_uop_debug_fsrc,
  input  [1:0]  io_in_1_bits_fflagdata_bits_uop_debug_tsrc,
  input  [31:0] io_in_1_bits_fflagdata_bits_fflag,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_uop_switch,
  output        io_out_bits_uop_switch_off,
  output        io_out_bits_uop_is_unicore,
  output [2:0]  io_out_bits_uop_shift,
  output [1:0]  io_out_bits_uop_lrs3_rtype,
  output        io_out_bits_uop_rflag,
  output        io_out_bits_uop_wflag,
  output [3:0]  io_out_bits_uop_prflag,
  output [3:0]  io_out_bits_uop_pwflag,
  output        io_out_bits_uop_pflag_busy,
  output [3:0]  io_out_bits_uop_stale_pflag,
  output [3:0]  io_out_bits_uop_op1_sel,
  output [3:0]  io_out_bits_uop_op2_sel,
  output [5:0]  io_out_bits_uop_split_num,
  output [5:0]  io_out_bits_uop_self_index,
  output [5:0]  io_out_bits_uop_rob_inst_idx,
  output [5:0]  io_out_bits_uop_address_num,
  output [6:0]  io_out_bits_uop_uopc,
  output [31:0] io_out_bits_uop_inst,
  output [31:0] io_out_bits_uop_debug_inst,
  output        io_out_bits_uop_is_rvc,
  output [39:0] io_out_bits_uop_debug_pc,
  output [2:0]  io_out_bits_uop_iq_type,
  output [9:0]  io_out_bits_uop_fu_code,
  output [3:0]  io_out_bits_uop_ctrl_br_type,
  output [1:0]  io_out_bits_uop_ctrl_op1_sel,
  output [2:0]  io_out_bits_uop_ctrl_op2_sel,
  output [2:0]  io_out_bits_uop_ctrl_imm_sel,
  output [3:0]  io_out_bits_uop_ctrl_op_fcn,
  output        io_out_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_out_bits_uop_ctrl_csr_cmd,
  output        io_out_bits_uop_ctrl_is_load,
  output        io_out_bits_uop_ctrl_is_sta,
  output        io_out_bits_uop_ctrl_is_std,
  output [1:0]  io_out_bits_uop_ctrl_op3_sel,
  output [1:0]  io_out_bits_uop_iw_state,
  output        io_out_bits_uop_iw_p1_poisoned,
  output        io_out_bits_uop_iw_p2_poisoned,
  output        io_out_bits_uop_is_br,
  output        io_out_bits_uop_is_jalr,
  output        io_out_bits_uop_is_jal,
  output        io_out_bits_uop_is_sfb,
  output [11:0] io_out_bits_uop_br_mask,
  output [3:0]  io_out_bits_uop_br_tag,
  output [4:0]  io_out_bits_uop_ftq_idx,
  output        io_out_bits_uop_edge_inst,
  output [5:0]  io_out_bits_uop_pc_lob,
  output        io_out_bits_uop_taken,
  output [19:0] io_out_bits_uop_imm_packed,
  output [11:0] io_out_bits_uop_csr_addr,
  output [5:0]  io_out_bits_uop_rob_idx,
  output [4:0]  io_out_bits_uop_ldq_idx,
  output [4:0]  io_out_bits_uop_stq_idx,
  output [1:0]  io_out_bits_uop_rxq_idx,
  output [6:0]  io_out_bits_uop_pdst,
  output [6:0]  io_out_bits_uop_prs1,
  output [6:0]  io_out_bits_uop_prs2,
  output [6:0]  io_out_bits_uop_prs3,
  output [4:0]  io_out_bits_uop_ppred,
  output        io_out_bits_uop_prs1_busy,
  output        io_out_bits_uop_prs2_busy,
  output        io_out_bits_uop_prs3_busy,
  output        io_out_bits_uop_ppred_busy,
  output [6:0]  io_out_bits_uop_stale_pdst,
  output        io_out_bits_uop_exception,
  output [63:0] io_out_bits_uop_exc_cause,
  output        io_out_bits_uop_bypassable,
  output [4:0]  io_out_bits_uop_mem_cmd,
  output [1:0]  io_out_bits_uop_mem_size,
  output        io_out_bits_uop_mem_signed,
  output        io_out_bits_uop_is_fence,
  output        io_out_bits_uop_is_fencei,
  output        io_out_bits_uop_is_amo,
  output        io_out_bits_uop_uses_ldq,
  output        io_out_bits_uop_uses_stq,
  output        io_out_bits_uop_is_sys_pc2epc,
  output        io_out_bits_uop_is_unique,
  output        io_out_bits_uop_flush_on_commit,
  output        io_out_bits_uop_ldst_is_rs1,
  output [5:0]  io_out_bits_uop_ldst,
  output [5:0]  io_out_bits_uop_lrs1,
  output [5:0]  io_out_bits_uop_lrs2,
  output [5:0]  io_out_bits_uop_lrs3,
  output        io_out_bits_uop_ldst_val,
  output [1:0]  io_out_bits_uop_dst_rtype,
  output [1:0]  io_out_bits_uop_lrs1_rtype,
  output [1:0]  io_out_bits_uop_lrs2_rtype,
  output        io_out_bits_uop_frs3_en,
  output        io_out_bits_uop_fp_val,
  output        io_out_bits_uop_fp_single,
  output        io_out_bits_uop_xcpt_pf_if,
  output        io_out_bits_uop_xcpt_ae_if,
  output        io_out_bits_uop_xcpt_ma_if,
  output        io_out_bits_uop_bp_debug_if,
  output        io_out_bits_uop_bp_xcpt_if,
  output [1:0]  io_out_bits_uop_debug_fsrc,
  output [1:0]  io_out_bits_uop_debug_tsrc,
  output [63:0] io_out_bits_data,
  output        io_out_bits_predicated,
  output        io_out_bits_fflags_valid,
  output        io_out_bits_fflags_bits_uop_switch,
  output        io_out_bits_fflags_bits_uop_switch_off,
  output        io_out_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_out_bits_fflags_bits_uop_shift,
  output [1:0]  io_out_bits_fflags_bits_uop_lrs3_rtype,
  output        io_out_bits_fflags_bits_uop_rflag,
  output        io_out_bits_fflags_bits_uop_wflag,
  output [3:0]  io_out_bits_fflags_bits_uop_prflag,
  output [3:0]  io_out_bits_fflags_bits_uop_pwflag,
  output        io_out_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_out_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_out_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_out_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_out_bits_fflags_bits_uop_split_num,
  output [5:0]  io_out_bits_fflags_bits_uop_self_index,
  output [5:0]  io_out_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_out_bits_fflags_bits_uop_address_num,
  output [6:0]  io_out_bits_fflags_bits_uop_uopc,
  output [31:0] io_out_bits_fflags_bits_uop_inst,
  output [31:0] io_out_bits_fflags_bits_uop_debug_inst,
  output        io_out_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_out_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_out_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_out_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_out_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_out_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_out_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_out_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_out_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_out_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_out_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_out_bits_fflags_bits_uop_ctrl_is_load,
  output        io_out_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_out_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_out_bits_fflags_bits_uop_ctrl_op3_sel,
  output [1:0]  io_out_bits_fflags_bits_uop_iw_state,
  output        io_out_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_out_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_out_bits_fflags_bits_uop_is_br,
  output        io_out_bits_fflags_bits_uop_is_jalr,
  output        io_out_bits_fflags_bits_uop_is_jal,
  output        io_out_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_out_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_out_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_out_bits_fflags_bits_uop_ftq_idx,
  output        io_out_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_out_bits_fflags_bits_uop_pc_lob,
  output        io_out_bits_fflags_bits_uop_taken,
  output [19:0] io_out_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_out_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_out_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_out_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_out_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_out_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_out_bits_fflags_bits_uop_pdst,
  output [6:0]  io_out_bits_fflags_bits_uop_prs1,
  output [6:0]  io_out_bits_fflags_bits_uop_prs2,
  output [6:0]  io_out_bits_fflags_bits_uop_prs3,
  output [4:0]  io_out_bits_fflags_bits_uop_ppred,
  output        io_out_bits_fflags_bits_uop_prs1_busy,
  output        io_out_bits_fflags_bits_uop_prs2_busy,
  output        io_out_bits_fflags_bits_uop_prs3_busy,
  output        io_out_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_out_bits_fflags_bits_uop_stale_pdst,
  output        io_out_bits_fflags_bits_uop_exception,
  output [63:0] io_out_bits_fflags_bits_uop_exc_cause,
  output        io_out_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_out_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_out_bits_fflags_bits_uop_mem_size,
  output        io_out_bits_fflags_bits_uop_mem_signed,
  output        io_out_bits_fflags_bits_uop_is_fence,
  output        io_out_bits_fflags_bits_uop_is_fencei,
  output        io_out_bits_fflags_bits_uop_is_amo,
  output        io_out_bits_fflags_bits_uop_uses_ldq,
  output        io_out_bits_fflags_bits_uop_uses_stq,
  output        io_out_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_out_bits_fflags_bits_uop_is_unique,
  output        io_out_bits_fflags_bits_uop_flush_on_commit,
  output        io_out_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_out_bits_fflags_bits_uop_ldst,
  output [5:0]  io_out_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_out_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_out_bits_fflags_bits_uop_lrs3,
  output        io_out_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_out_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_out_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_out_bits_fflags_bits_uop_lrs2_rtype,
  output        io_out_bits_fflags_bits_uop_frs3_en,
  output        io_out_bits_fflags_bits_uop_fp_val,
  output        io_out_bits_fflags_bits_uop_fp_single,
  output        io_out_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_out_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_out_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_out_bits_fflags_bits_uop_bp_debug_if,
  output        io_out_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_out_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_out_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_out_bits_fflags_bits_flags,
  output [3:0]  io_out_bits_flagdata,
  output        io_out_bits_fflagdata_valid,
  output        io_out_bits_fflagdata_bits_uop_switch,
  output        io_out_bits_fflagdata_bits_uop_switch_off,
  output        io_out_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_out_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_out_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_out_bits_fflagdata_bits_uop_rflag,
  output        io_out_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_out_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_out_bits_fflagdata_bits_uop_pwflag,
  output        io_out_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_out_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_out_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_out_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_out_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_out_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_out_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_out_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_out_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_out_bits_fflagdata_bits_uop_inst,
  output [31:0] io_out_bits_fflagdata_bits_uop_debug_inst,
  output        io_out_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_out_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_out_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_out_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_out_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_out_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_out_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_out_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_out_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_out_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_out_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_out_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_out_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_out_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_out_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_out_bits_fflagdata_bits_uop_iw_state,
  output        io_out_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_out_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_out_bits_fflagdata_bits_uop_is_br,
  output        io_out_bits_fflagdata_bits_uop_is_jalr,
  output        io_out_bits_fflagdata_bits_uop_is_jal,
  output        io_out_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_out_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_out_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_out_bits_fflagdata_bits_uop_ftq_idx,
  output        io_out_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_out_bits_fflagdata_bits_uop_pc_lob,
  output        io_out_bits_fflagdata_bits_uop_taken,
  output [19:0] io_out_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_out_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_out_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_out_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_out_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_out_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_out_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_out_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_out_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_out_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_out_bits_fflagdata_bits_uop_ppred,
  output        io_out_bits_fflagdata_bits_uop_prs1_busy,
  output        io_out_bits_fflagdata_bits_uop_prs2_busy,
  output        io_out_bits_fflagdata_bits_uop_prs3_busy,
  output        io_out_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_out_bits_fflagdata_bits_uop_stale_pdst,
  output        io_out_bits_fflagdata_bits_uop_exception,
  output [63:0] io_out_bits_fflagdata_bits_uop_exc_cause,
  output        io_out_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_out_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_out_bits_fflagdata_bits_uop_mem_size,
  output        io_out_bits_fflagdata_bits_uop_mem_signed,
  output        io_out_bits_fflagdata_bits_uop_is_fence,
  output        io_out_bits_fflagdata_bits_uop_is_fencei,
  output        io_out_bits_fflagdata_bits_uop_is_amo,
  output        io_out_bits_fflagdata_bits_uop_uses_ldq,
  output        io_out_bits_fflagdata_bits_uop_uses_stq,
  output        io_out_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_out_bits_fflagdata_bits_uop_is_unique,
  output        io_out_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_out_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_out_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_out_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_out_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_out_bits_fflagdata_bits_uop_lrs3,
  output        io_out_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_out_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_out_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_out_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_out_bits_fflagdata_bits_uop_frs3_en,
  output        io_out_bits_fflagdata_bits_uop_fp_val,
  output        io_out_bits_fflagdata_bits_uop_fp_single,
  output        io_out_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_out_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_out_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_out_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_out_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_out_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_out_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_out_bits_fflagdata_bits_fflag,
  output        io_chosen
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 31:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 134:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 135:31]
  assign io_out_bits_uop_switch = io_in_0_valid ? io_in_0_bits_uop_switch : io_in_1_bits_uop_switch; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_switch_off = io_in_0_valid ? io_in_0_bits_uop_switch_off : io_in_1_bits_uop_switch_off; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_is_unicore = io_in_0_valid ? io_in_0_bits_uop_is_unicore : io_in_1_bits_uop_is_unicore; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_shift = io_in_0_valid ? io_in_0_bits_uop_shift : io_in_1_bits_uop_shift; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_lrs3_rtype = io_in_0_valid ? io_in_0_bits_uop_lrs3_rtype : io_in_1_bits_uop_lrs3_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_rflag = io_in_0_valid ? io_in_0_bits_uop_rflag : io_in_1_bits_uop_rflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_wflag = io_in_0_valid ? io_in_0_bits_uop_wflag : io_in_1_bits_uop_wflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_prflag = io_in_0_valid ? io_in_0_bits_uop_prflag : io_in_1_bits_uop_prflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_pwflag = io_in_0_valid ? io_in_0_bits_uop_pwflag : io_in_1_bits_uop_pwflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_pflag_busy = io_in_0_valid ? io_in_0_bits_uop_pflag_busy : io_in_1_bits_uop_pflag_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_stale_pflag = io_in_0_valid ? io_in_0_bits_uop_stale_pflag : io_in_1_bits_uop_stale_pflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_op1_sel = io_in_0_valid ? io_in_0_bits_uop_op1_sel : io_in_1_bits_uop_op1_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_op2_sel = io_in_0_valid ? io_in_0_bits_uop_op2_sel : io_in_1_bits_uop_op2_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_split_num = io_in_0_valid ? io_in_0_bits_uop_split_num : io_in_1_bits_uop_split_num; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_self_index = io_in_0_valid ? io_in_0_bits_uop_self_index : io_in_1_bits_uop_self_index; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_rob_inst_idx = io_in_0_valid ? io_in_0_bits_uop_rob_inst_idx : io_in_1_bits_uop_rob_inst_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_address_num = io_in_0_valid ? io_in_0_bits_uop_address_num : io_in_1_bits_uop_address_num; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_uopc = io_in_0_valid ? io_in_0_bits_uop_uopc : io_in_1_bits_uop_uopc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_inst = io_in_0_valid ? io_in_0_bits_uop_inst : io_in_1_bits_uop_inst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_debug_inst = io_in_0_valid ? io_in_0_bits_uop_debug_inst : io_in_1_bits_uop_debug_inst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_is_rvc = io_in_0_valid ? io_in_0_bits_uop_is_rvc : io_in_1_bits_uop_is_rvc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_debug_pc = io_in_0_valid ? io_in_0_bits_uop_debug_pc : io_in_1_bits_uop_debug_pc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_iq_type = io_in_0_valid ? io_in_0_bits_uop_iq_type : io_in_1_bits_uop_iq_type; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_fu_code = io_in_0_valid ? io_in_0_bits_uop_fu_code : io_in_1_bits_uop_fu_code; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ctrl_br_type = io_in_0_valid ? io_in_0_bits_uop_ctrl_br_type : io_in_1_bits_uop_ctrl_br_type; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ctrl_op1_sel = io_in_0_valid ? io_in_0_bits_uop_ctrl_op1_sel : io_in_1_bits_uop_ctrl_op1_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ctrl_op2_sel = io_in_0_valid ? io_in_0_bits_uop_ctrl_op2_sel : io_in_1_bits_uop_ctrl_op2_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ctrl_imm_sel = io_in_0_valid ? io_in_0_bits_uop_ctrl_imm_sel : io_in_1_bits_uop_ctrl_imm_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ctrl_op_fcn = io_in_0_valid ? io_in_0_bits_uop_ctrl_op_fcn : io_in_1_bits_uop_ctrl_op_fcn; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ctrl_fcn_dw = io_in_0_valid ? io_in_0_bits_uop_ctrl_fcn_dw : io_in_1_bits_uop_ctrl_fcn_dw; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ctrl_csr_cmd = io_in_0_valid ? io_in_0_bits_uop_ctrl_csr_cmd : io_in_1_bits_uop_ctrl_csr_cmd; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ctrl_is_load = io_in_0_valid ? io_in_0_bits_uop_ctrl_is_load : io_in_1_bits_uop_ctrl_is_load; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ctrl_is_sta = io_in_0_valid ? io_in_0_bits_uop_ctrl_is_sta : io_in_1_bits_uop_ctrl_is_sta; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ctrl_is_std = io_in_0_valid ? io_in_0_bits_uop_ctrl_is_std : io_in_1_bits_uop_ctrl_is_std; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ctrl_op3_sel = io_in_0_valid ? io_in_0_bits_uop_ctrl_op3_sel : io_in_1_bits_uop_ctrl_op3_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_iw_state = io_in_0_valid ? io_in_0_bits_uop_iw_state : io_in_1_bits_uop_iw_state; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_iw_p1_poisoned = io_in_0_valid ? io_in_0_bits_uop_iw_p1_poisoned :
    io_in_1_bits_uop_iw_p1_poisoned; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_iw_p2_poisoned = io_in_0_valid ? io_in_0_bits_uop_iw_p2_poisoned :
    io_in_1_bits_uop_iw_p2_poisoned; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_is_br = io_in_0_valid ? io_in_0_bits_uop_is_br : io_in_1_bits_uop_is_br; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_is_jalr = io_in_0_valid ? io_in_0_bits_uop_is_jalr : io_in_1_bits_uop_is_jalr; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_is_jal = io_in_0_valid ? io_in_0_bits_uop_is_jal : io_in_1_bits_uop_is_jal; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_is_sfb = io_in_0_valid ? io_in_0_bits_uop_is_sfb : io_in_1_bits_uop_is_sfb; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_br_mask = io_in_0_valid ? io_in_0_bits_uop_br_mask : io_in_1_bits_uop_br_mask; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_br_tag = io_in_0_valid ? io_in_0_bits_uop_br_tag : io_in_1_bits_uop_br_tag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ftq_idx = io_in_0_valid ? io_in_0_bits_uop_ftq_idx : io_in_1_bits_uop_ftq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_edge_inst = io_in_0_valid ? io_in_0_bits_uop_edge_inst : io_in_1_bits_uop_edge_inst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_pc_lob = io_in_0_valid ? io_in_0_bits_uop_pc_lob : io_in_1_bits_uop_pc_lob; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_taken = io_in_0_valid ? io_in_0_bits_uop_taken : io_in_1_bits_uop_taken; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_imm_packed = io_in_0_valid ? io_in_0_bits_uop_imm_packed : io_in_1_bits_uop_imm_packed; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_csr_addr = io_in_0_valid ? io_in_0_bits_uop_csr_addr : io_in_1_bits_uop_csr_addr; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_rob_idx = io_in_0_valid ? io_in_0_bits_uop_rob_idx : io_in_1_bits_uop_rob_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ldq_idx = io_in_0_valid ? io_in_0_bits_uop_ldq_idx : io_in_1_bits_uop_ldq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_stq_idx = io_in_0_valid ? io_in_0_bits_uop_stq_idx : io_in_1_bits_uop_stq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_rxq_idx = io_in_0_valid ? io_in_0_bits_uop_rxq_idx : io_in_1_bits_uop_rxq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_pdst = io_in_0_valid ? io_in_0_bits_uop_pdst : io_in_1_bits_uop_pdst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_prs1 = io_in_0_valid ? io_in_0_bits_uop_prs1 : io_in_1_bits_uop_prs1; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_prs2 = io_in_0_valid ? io_in_0_bits_uop_prs2 : io_in_1_bits_uop_prs2; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_prs3 = io_in_0_valid ? io_in_0_bits_uop_prs3 : io_in_1_bits_uop_prs3; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ppred = io_in_0_valid ? io_in_0_bits_uop_ppred : io_in_1_bits_uop_ppred; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_prs1_busy = io_in_0_valid ? io_in_0_bits_uop_prs1_busy : io_in_1_bits_uop_prs1_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_prs2_busy = io_in_0_valid ? io_in_0_bits_uop_prs2_busy : io_in_1_bits_uop_prs2_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_prs3_busy = io_in_0_valid ? io_in_0_bits_uop_prs3_busy : io_in_1_bits_uop_prs3_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ppred_busy = io_in_0_valid ? io_in_0_bits_uop_ppred_busy : io_in_1_bits_uop_ppred_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_stale_pdst = io_in_0_valid ? io_in_0_bits_uop_stale_pdst : io_in_1_bits_uop_stale_pdst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_exception = io_in_0_valid ? io_in_0_bits_uop_exception : io_in_1_bits_uop_exception; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_exc_cause = io_in_0_valid ? io_in_0_bits_uop_exc_cause : io_in_1_bits_uop_exc_cause; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_bypassable = io_in_0_valid ? io_in_0_bits_uop_bypassable : io_in_1_bits_uop_bypassable; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_mem_cmd = io_in_0_valid ? io_in_0_bits_uop_mem_cmd : io_in_1_bits_uop_mem_cmd; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_mem_size = io_in_0_valid ? io_in_0_bits_uop_mem_size : io_in_1_bits_uop_mem_size; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_mem_signed = io_in_0_valid ? io_in_0_bits_uop_mem_signed : io_in_1_bits_uop_mem_signed; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_is_fence = io_in_0_valid ? io_in_0_bits_uop_is_fence : io_in_1_bits_uop_is_fence; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_is_fencei = io_in_0_valid ? io_in_0_bits_uop_is_fencei : io_in_1_bits_uop_is_fencei; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_is_amo = io_in_0_valid ? io_in_0_bits_uop_is_amo : io_in_1_bits_uop_is_amo; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_uses_ldq = io_in_0_valid ? io_in_0_bits_uop_uses_ldq : io_in_1_bits_uop_uses_ldq; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_uses_stq = io_in_0_valid ? io_in_0_bits_uop_uses_stq : io_in_1_bits_uop_uses_stq; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_is_sys_pc2epc = io_in_0_valid ? io_in_0_bits_uop_is_sys_pc2epc : io_in_1_bits_uop_is_sys_pc2epc
    ; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_is_unique = io_in_0_valid ? io_in_0_bits_uop_is_unique : io_in_1_bits_uop_is_unique; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_flush_on_commit = io_in_0_valid ? io_in_0_bits_uop_flush_on_commit :
    io_in_1_bits_uop_flush_on_commit; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ldst_is_rs1 = io_in_0_valid ? io_in_0_bits_uop_ldst_is_rs1 : io_in_1_bits_uop_ldst_is_rs1; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ldst = io_in_0_valid ? io_in_0_bits_uop_ldst : io_in_1_bits_uop_ldst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_lrs1 = io_in_0_valid ? io_in_0_bits_uop_lrs1 : io_in_1_bits_uop_lrs1; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_lrs2 = io_in_0_valid ? io_in_0_bits_uop_lrs2 : io_in_1_bits_uop_lrs2; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_lrs3 = io_in_0_valid ? io_in_0_bits_uop_lrs3 : io_in_1_bits_uop_lrs3; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_ldst_val = io_in_0_valid ? io_in_0_bits_uop_ldst_val : io_in_1_bits_uop_ldst_val; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_dst_rtype = io_in_0_valid ? io_in_0_bits_uop_dst_rtype : io_in_1_bits_uop_dst_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_lrs1_rtype = io_in_0_valid ? io_in_0_bits_uop_lrs1_rtype : io_in_1_bits_uop_lrs1_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_lrs2_rtype = io_in_0_valid ? io_in_0_bits_uop_lrs2_rtype : io_in_1_bits_uop_lrs2_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_frs3_en = io_in_0_valid ? io_in_0_bits_uop_frs3_en : io_in_1_bits_uop_frs3_en; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_fp_val = io_in_0_valid ? io_in_0_bits_uop_fp_val : io_in_1_bits_uop_fp_val; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_fp_single = io_in_0_valid ? io_in_0_bits_uop_fp_single : io_in_1_bits_uop_fp_single; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_xcpt_pf_if = io_in_0_valid ? io_in_0_bits_uop_xcpt_pf_if : io_in_1_bits_uop_xcpt_pf_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_xcpt_ae_if = io_in_0_valid ? io_in_0_bits_uop_xcpt_ae_if : io_in_1_bits_uop_xcpt_ae_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_xcpt_ma_if = io_in_0_valid ? io_in_0_bits_uop_xcpt_ma_if : io_in_1_bits_uop_xcpt_ma_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_bp_debug_if = io_in_0_valid ? io_in_0_bits_uop_bp_debug_if : io_in_1_bits_uop_bp_debug_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_bp_xcpt_if = io_in_0_valid ? io_in_0_bits_uop_bp_xcpt_if : io_in_1_bits_uop_bp_xcpt_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_debug_fsrc = io_in_0_valid ? io_in_0_bits_uop_debug_fsrc : io_in_1_bits_uop_debug_fsrc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_uop_debug_tsrc = io_in_0_valid ? io_in_0_bits_uop_debug_tsrc : io_in_1_bits_uop_debug_tsrc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : io_in_1_bits_data; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_predicated = io_in_0_valid ? io_in_0_bits_predicated : io_in_1_bits_predicated; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_valid = io_in_0_valid ? io_in_0_bits_fflags_valid : io_in_1_bits_fflags_valid; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_switch = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_switch :
    io_in_1_bits_fflags_bits_uop_switch; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_switch_off = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_switch_off :
    io_in_1_bits_fflags_bits_uop_switch_off; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_is_unicore = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_is_unicore :
    io_in_1_bits_fflags_bits_uop_is_unicore; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_shift = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_shift :
    io_in_1_bits_fflags_bits_uop_shift; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_lrs3_rtype = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_lrs3_rtype :
    io_in_1_bits_fflags_bits_uop_lrs3_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_rflag = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_rflag :
    io_in_1_bits_fflags_bits_uop_rflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_wflag = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_wflag :
    io_in_1_bits_fflags_bits_uop_wflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_prflag = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_prflag :
    io_in_1_bits_fflags_bits_uop_prflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_pwflag = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_pwflag :
    io_in_1_bits_fflags_bits_uop_pwflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_pflag_busy = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_pflag_busy :
    io_in_1_bits_fflags_bits_uop_pflag_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_stale_pflag = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_stale_pflag :
    io_in_1_bits_fflags_bits_uop_stale_pflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_op1_sel = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_op1_sel :
    io_in_1_bits_fflags_bits_uop_op1_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_op2_sel = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_op2_sel :
    io_in_1_bits_fflags_bits_uop_op2_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_split_num = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_split_num :
    io_in_1_bits_fflags_bits_uop_split_num; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_self_index = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_self_index :
    io_in_1_bits_fflags_bits_uop_self_index; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_rob_inst_idx = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_rob_inst_idx :
    io_in_1_bits_fflags_bits_uop_rob_inst_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_address_num = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_address_num :
    io_in_1_bits_fflags_bits_uop_address_num; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_uopc = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_uopc :
    io_in_1_bits_fflags_bits_uop_uopc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_inst = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_inst :
    io_in_1_bits_fflags_bits_uop_inst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_debug_inst = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_debug_inst :
    io_in_1_bits_fflags_bits_uop_debug_inst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_is_rvc = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_is_rvc :
    io_in_1_bits_fflags_bits_uop_is_rvc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_debug_pc = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_debug_pc :
    io_in_1_bits_fflags_bits_uop_debug_pc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_iq_type = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_iq_type :
    io_in_1_bits_fflags_bits_uop_iq_type; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_fu_code = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_fu_code :
    io_in_1_bits_fflags_bits_uop_fu_code; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ctrl_br_type = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ctrl_br_type :
    io_in_1_bits_fflags_bits_uop_ctrl_br_type; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ctrl_op1_sel = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ctrl_op1_sel :
    io_in_1_bits_fflags_bits_uop_ctrl_op1_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ctrl_op2_sel = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ctrl_op2_sel :
    io_in_1_bits_fflags_bits_uop_ctrl_op2_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ctrl_imm_sel = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ctrl_imm_sel :
    io_in_1_bits_fflags_bits_uop_ctrl_imm_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ctrl_op_fcn = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ctrl_op_fcn :
    io_in_1_bits_fflags_bits_uop_ctrl_op_fcn; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ctrl_fcn_dw = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ctrl_fcn_dw :
    io_in_1_bits_fflags_bits_uop_ctrl_fcn_dw; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ctrl_csr_cmd = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ctrl_csr_cmd :
    io_in_1_bits_fflags_bits_uop_ctrl_csr_cmd; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ctrl_is_load = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ctrl_is_load :
    io_in_1_bits_fflags_bits_uop_ctrl_is_load; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ctrl_is_sta = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ctrl_is_sta :
    io_in_1_bits_fflags_bits_uop_ctrl_is_sta; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ctrl_is_std = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ctrl_is_std :
    io_in_1_bits_fflags_bits_uop_ctrl_is_std; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ctrl_op3_sel = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ctrl_op3_sel :
    io_in_1_bits_fflags_bits_uop_ctrl_op3_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_iw_state = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_iw_state :
    io_in_1_bits_fflags_bits_uop_iw_state; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_iw_p1_poisoned = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_iw_p1_poisoned :
    io_in_1_bits_fflags_bits_uop_iw_p1_poisoned; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_iw_p2_poisoned = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_iw_p2_poisoned :
    io_in_1_bits_fflags_bits_uop_iw_p2_poisoned; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_is_br = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_is_br :
    io_in_1_bits_fflags_bits_uop_is_br; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_is_jalr = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_is_jalr :
    io_in_1_bits_fflags_bits_uop_is_jalr; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_is_jal = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_is_jal :
    io_in_1_bits_fflags_bits_uop_is_jal; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_is_sfb = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_is_sfb :
    io_in_1_bits_fflags_bits_uop_is_sfb; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_br_mask = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_br_mask :
    io_in_1_bits_fflags_bits_uop_br_mask; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_br_tag = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_br_tag :
    io_in_1_bits_fflags_bits_uop_br_tag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ftq_idx = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ftq_idx :
    io_in_1_bits_fflags_bits_uop_ftq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_edge_inst = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_edge_inst :
    io_in_1_bits_fflags_bits_uop_edge_inst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_pc_lob = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_pc_lob :
    io_in_1_bits_fflags_bits_uop_pc_lob; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_taken = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_taken :
    io_in_1_bits_fflags_bits_uop_taken; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_imm_packed = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_imm_packed :
    io_in_1_bits_fflags_bits_uop_imm_packed; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_csr_addr = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_csr_addr :
    io_in_1_bits_fflags_bits_uop_csr_addr; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_rob_idx = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_rob_idx :
    io_in_1_bits_fflags_bits_uop_rob_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ldq_idx = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ldq_idx :
    io_in_1_bits_fflags_bits_uop_ldq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_stq_idx = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_stq_idx :
    io_in_1_bits_fflags_bits_uop_stq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_rxq_idx = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_rxq_idx :
    io_in_1_bits_fflags_bits_uop_rxq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_pdst = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_pdst :
    io_in_1_bits_fflags_bits_uop_pdst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_prs1 = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_prs1 :
    io_in_1_bits_fflags_bits_uop_prs1; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_prs2 = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_prs2 :
    io_in_1_bits_fflags_bits_uop_prs2; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_prs3 = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_prs3 :
    io_in_1_bits_fflags_bits_uop_prs3; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ppred = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ppred :
    io_in_1_bits_fflags_bits_uop_ppred; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_prs1_busy = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_prs1_busy :
    io_in_1_bits_fflags_bits_uop_prs1_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_prs2_busy = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_prs2_busy :
    io_in_1_bits_fflags_bits_uop_prs2_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_prs3_busy = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_prs3_busy :
    io_in_1_bits_fflags_bits_uop_prs3_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ppred_busy = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ppred_busy :
    io_in_1_bits_fflags_bits_uop_ppred_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_stale_pdst = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_stale_pdst :
    io_in_1_bits_fflags_bits_uop_stale_pdst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_exception = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_exception :
    io_in_1_bits_fflags_bits_uop_exception; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_exc_cause = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_exc_cause :
    io_in_1_bits_fflags_bits_uop_exc_cause; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_bypassable = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_bypassable :
    io_in_1_bits_fflags_bits_uop_bypassable; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_mem_cmd = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_mem_cmd :
    io_in_1_bits_fflags_bits_uop_mem_cmd; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_mem_size = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_mem_size :
    io_in_1_bits_fflags_bits_uop_mem_size; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_mem_signed = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_mem_signed :
    io_in_1_bits_fflags_bits_uop_mem_signed; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_is_fence = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_is_fence :
    io_in_1_bits_fflags_bits_uop_is_fence; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_is_fencei = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_is_fencei :
    io_in_1_bits_fflags_bits_uop_is_fencei; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_is_amo = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_is_amo :
    io_in_1_bits_fflags_bits_uop_is_amo; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_uses_ldq = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_uses_ldq :
    io_in_1_bits_fflags_bits_uop_uses_ldq; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_uses_stq = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_uses_stq :
    io_in_1_bits_fflags_bits_uop_uses_stq; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_is_sys_pc2epc = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_is_sys_pc2epc :
    io_in_1_bits_fflags_bits_uop_is_sys_pc2epc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_is_unique = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_is_unique :
    io_in_1_bits_fflags_bits_uop_is_unique; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_flush_on_commit = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_flush_on_commit :
    io_in_1_bits_fflags_bits_uop_flush_on_commit; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ldst_is_rs1 = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ldst_is_rs1 :
    io_in_1_bits_fflags_bits_uop_ldst_is_rs1; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ldst = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ldst :
    io_in_1_bits_fflags_bits_uop_ldst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_lrs1 = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_lrs1 :
    io_in_1_bits_fflags_bits_uop_lrs1; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_lrs2 = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_lrs2 :
    io_in_1_bits_fflags_bits_uop_lrs2; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_lrs3 = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_lrs3 :
    io_in_1_bits_fflags_bits_uop_lrs3; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_ldst_val = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_ldst_val :
    io_in_1_bits_fflags_bits_uop_ldst_val; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_dst_rtype = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_dst_rtype :
    io_in_1_bits_fflags_bits_uop_dst_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_lrs1_rtype = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_lrs1_rtype :
    io_in_1_bits_fflags_bits_uop_lrs1_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_lrs2_rtype = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_lrs2_rtype :
    io_in_1_bits_fflags_bits_uop_lrs2_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_frs3_en = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_frs3_en :
    io_in_1_bits_fflags_bits_uop_frs3_en; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_fp_val = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_fp_val :
    io_in_1_bits_fflags_bits_uop_fp_val; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_fp_single = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_fp_single :
    io_in_1_bits_fflags_bits_uop_fp_single; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_xcpt_pf_if = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_xcpt_pf_if :
    io_in_1_bits_fflags_bits_uop_xcpt_pf_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_xcpt_ae_if = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_xcpt_ae_if :
    io_in_1_bits_fflags_bits_uop_xcpt_ae_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_xcpt_ma_if = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_xcpt_ma_if :
    io_in_1_bits_fflags_bits_uop_xcpt_ma_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_bp_debug_if = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_bp_debug_if :
    io_in_1_bits_fflags_bits_uop_bp_debug_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_bp_xcpt_if = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_bp_xcpt_if :
    io_in_1_bits_fflags_bits_uop_bp_xcpt_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_debug_fsrc = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_debug_fsrc :
    io_in_1_bits_fflags_bits_uop_debug_fsrc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_uop_debug_tsrc = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_debug_tsrc :
    io_in_1_bits_fflags_bits_uop_debug_tsrc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflags_bits_flags = io_in_0_valid ? io_in_0_bits_fflags_bits_flags : io_in_1_bits_fflags_bits_flags
    ; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_flagdata = io_in_0_valid ? io_in_0_bits_flagdata : io_in_1_bits_flagdata; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_valid = io_in_0_valid ? io_in_0_bits_fflagdata_valid : io_in_1_bits_fflagdata_valid; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_switch = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_switch :
    io_in_1_bits_fflagdata_bits_uop_switch; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_switch_off = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_switch_off :
    io_in_1_bits_fflagdata_bits_uop_switch_off; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_is_unicore = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_is_unicore :
    io_in_1_bits_fflagdata_bits_uop_is_unicore; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_shift = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_shift :
    io_in_1_bits_fflagdata_bits_uop_shift; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_lrs3_rtype = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_lrs3_rtype :
    io_in_1_bits_fflagdata_bits_uop_lrs3_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_rflag = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_rflag :
    io_in_1_bits_fflagdata_bits_uop_rflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_wflag = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_wflag :
    io_in_1_bits_fflagdata_bits_uop_wflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_prflag = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_prflag :
    io_in_1_bits_fflagdata_bits_uop_prflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_pwflag = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_pwflag :
    io_in_1_bits_fflagdata_bits_uop_pwflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_pflag_busy = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_pflag_busy :
    io_in_1_bits_fflagdata_bits_uop_pflag_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_stale_pflag = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_stale_pflag :
    io_in_1_bits_fflagdata_bits_uop_stale_pflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_op1_sel = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_op1_sel :
    io_in_1_bits_fflagdata_bits_uop_op1_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_op2_sel = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_op2_sel :
    io_in_1_bits_fflagdata_bits_uop_op2_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_split_num = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_split_num :
    io_in_1_bits_fflagdata_bits_uop_split_num; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_self_index = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_self_index :
    io_in_1_bits_fflagdata_bits_uop_self_index; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_rob_inst_idx = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_rob_inst_idx :
    io_in_1_bits_fflagdata_bits_uop_rob_inst_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_address_num = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_address_num :
    io_in_1_bits_fflagdata_bits_uop_address_num; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_uopc = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_uopc :
    io_in_1_bits_fflagdata_bits_uop_uopc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_inst = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_inst :
    io_in_1_bits_fflagdata_bits_uop_inst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_debug_inst = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_debug_inst :
    io_in_1_bits_fflagdata_bits_uop_debug_inst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_is_rvc = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_is_rvc :
    io_in_1_bits_fflagdata_bits_uop_is_rvc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_debug_pc = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_debug_pc :
    io_in_1_bits_fflagdata_bits_uop_debug_pc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_iq_type = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_iq_type :
    io_in_1_bits_fflagdata_bits_uop_iq_type; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_fu_code = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_fu_code :
    io_in_1_bits_fflagdata_bits_uop_fu_code; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ctrl_br_type = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ctrl_br_type :
    io_in_1_bits_fflagdata_bits_uop_ctrl_br_type; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ctrl_op1_sel = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ctrl_op1_sel :
    io_in_1_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ctrl_op2_sel = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ctrl_op2_sel :
    io_in_1_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ctrl_imm_sel = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ctrl_imm_sel :
    io_in_1_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ctrl_op_fcn = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ctrl_op_fcn :
    io_in_1_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ctrl_fcn_dw = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ctrl_fcn_dw :
    io_in_1_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ctrl_csr_cmd = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ctrl_csr_cmd :
    io_in_1_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ctrl_is_load = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ctrl_is_load :
    io_in_1_bits_fflagdata_bits_uop_ctrl_is_load; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ctrl_is_sta = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ctrl_is_sta :
    io_in_1_bits_fflagdata_bits_uop_ctrl_is_sta; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ctrl_is_std = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ctrl_is_std :
    io_in_1_bits_fflagdata_bits_uop_ctrl_is_std; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ctrl_op3_sel = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ctrl_op3_sel :
    io_in_1_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_iw_state = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_iw_state :
    io_in_1_bits_fflagdata_bits_uop_iw_state; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_iw_p1_poisoned = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_iw_p1_poisoned
     : io_in_1_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_iw_p2_poisoned = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_iw_p2_poisoned
     : io_in_1_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_is_br = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_is_br :
    io_in_1_bits_fflagdata_bits_uop_is_br; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_is_jalr = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_is_jalr :
    io_in_1_bits_fflagdata_bits_uop_is_jalr; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_is_jal = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_is_jal :
    io_in_1_bits_fflagdata_bits_uop_is_jal; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_is_sfb = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_is_sfb :
    io_in_1_bits_fflagdata_bits_uop_is_sfb; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_br_mask = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_br_mask :
    io_in_1_bits_fflagdata_bits_uop_br_mask; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_br_tag = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_br_tag :
    io_in_1_bits_fflagdata_bits_uop_br_tag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ftq_idx = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ftq_idx :
    io_in_1_bits_fflagdata_bits_uop_ftq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_edge_inst = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_edge_inst :
    io_in_1_bits_fflagdata_bits_uop_edge_inst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_pc_lob = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_pc_lob :
    io_in_1_bits_fflagdata_bits_uop_pc_lob; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_taken = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_taken :
    io_in_1_bits_fflagdata_bits_uop_taken; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_imm_packed = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_imm_packed :
    io_in_1_bits_fflagdata_bits_uop_imm_packed; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_csr_addr = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_csr_addr :
    io_in_1_bits_fflagdata_bits_uop_csr_addr; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_rob_idx = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_rob_idx :
    io_in_1_bits_fflagdata_bits_uop_rob_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ldq_idx = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ldq_idx :
    io_in_1_bits_fflagdata_bits_uop_ldq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_stq_idx = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_stq_idx :
    io_in_1_bits_fflagdata_bits_uop_stq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_rxq_idx = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_rxq_idx :
    io_in_1_bits_fflagdata_bits_uop_rxq_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_pdst = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_pdst :
    io_in_1_bits_fflagdata_bits_uop_pdst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_prs1 = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_prs1 :
    io_in_1_bits_fflagdata_bits_uop_prs1; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_prs2 = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_prs2 :
    io_in_1_bits_fflagdata_bits_uop_prs2; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_prs3 = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_prs3 :
    io_in_1_bits_fflagdata_bits_uop_prs3; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ppred = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ppred :
    io_in_1_bits_fflagdata_bits_uop_ppred; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_prs1_busy = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_prs1_busy :
    io_in_1_bits_fflagdata_bits_uop_prs1_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_prs2_busy = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_prs2_busy :
    io_in_1_bits_fflagdata_bits_uop_prs2_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_prs3_busy = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_prs3_busy :
    io_in_1_bits_fflagdata_bits_uop_prs3_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ppred_busy = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ppred_busy :
    io_in_1_bits_fflagdata_bits_uop_ppred_busy; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_stale_pdst = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_stale_pdst :
    io_in_1_bits_fflagdata_bits_uop_stale_pdst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_exception = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_exception :
    io_in_1_bits_fflagdata_bits_uop_exception; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_exc_cause = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_exc_cause :
    io_in_1_bits_fflagdata_bits_uop_exc_cause; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_bypassable = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_bypassable :
    io_in_1_bits_fflagdata_bits_uop_bypassable; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_mem_cmd = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_mem_cmd :
    io_in_1_bits_fflagdata_bits_uop_mem_cmd; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_mem_size = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_mem_size :
    io_in_1_bits_fflagdata_bits_uop_mem_size; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_mem_signed = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_mem_signed :
    io_in_1_bits_fflagdata_bits_uop_mem_signed; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_is_fence = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_is_fence :
    io_in_1_bits_fflagdata_bits_uop_is_fence; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_is_fencei = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_is_fencei :
    io_in_1_bits_fflagdata_bits_uop_is_fencei; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_is_amo = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_is_amo :
    io_in_1_bits_fflagdata_bits_uop_is_amo; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_uses_ldq = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_uses_ldq :
    io_in_1_bits_fflagdata_bits_uop_uses_ldq; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_uses_stq = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_uses_stq :
    io_in_1_bits_fflagdata_bits_uop_uses_stq; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_is_sys_pc2epc = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_is_sys_pc2epc :
    io_in_1_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_is_unique = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_is_unique :
    io_in_1_bits_fflagdata_bits_uop_is_unique; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_flush_on_commit = io_in_0_valid ?
    io_in_0_bits_fflagdata_bits_uop_flush_on_commit : io_in_1_bits_fflagdata_bits_uop_flush_on_commit; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ldst_is_rs1 = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ldst_is_rs1 :
    io_in_1_bits_fflagdata_bits_uop_ldst_is_rs1; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ldst = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ldst :
    io_in_1_bits_fflagdata_bits_uop_ldst; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_lrs1 = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_lrs1 :
    io_in_1_bits_fflagdata_bits_uop_lrs1; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_lrs2 = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_lrs2 :
    io_in_1_bits_fflagdata_bits_uop_lrs2; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_lrs3 = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_lrs3 :
    io_in_1_bits_fflagdata_bits_uop_lrs3; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_ldst_val = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_ldst_val :
    io_in_1_bits_fflagdata_bits_uop_ldst_val; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_dst_rtype = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_dst_rtype :
    io_in_1_bits_fflagdata_bits_uop_dst_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_lrs1_rtype = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_lrs1_rtype :
    io_in_1_bits_fflagdata_bits_uop_lrs1_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_lrs2_rtype = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_lrs2_rtype :
    io_in_1_bits_fflagdata_bits_uop_lrs2_rtype; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_frs3_en = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_frs3_en :
    io_in_1_bits_fflagdata_bits_uop_frs3_en; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_fp_val = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_fp_val :
    io_in_1_bits_fflagdata_bits_uop_fp_val; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_fp_single = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_fp_single :
    io_in_1_bits_fflagdata_bits_uop_fp_single; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_xcpt_pf_if = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_xcpt_pf_if :
    io_in_1_bits_fflagdata_bits_uop_xcpt_pf_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_xcpt_ae_if = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_xcpt_ae_if :
    io_in_1_bits_fflagdata_bits_uop_xcpt_ae_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_xcpt_ma_if = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_xcpt_ma_if :
    io_in_1_bits_fflagdata_bits_uop_xcpt_ma_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_bp_debug_if = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_bp_debug_if :
    io_in_1_bits_fflagdata_bits_uop_bp_debug_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_bp_xcpt_if = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_bp_xcpt_if :
    io_in_1_bits_fflagdata_bits_uop_bp_xcpt_if; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_debug_fsrc = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_debug_fsrc :
    io_in_1_bits_fflagdata_bits_uop_debug_fsrc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_uop_debug_tsrc = io_in_0_valid ? io_in_0_bits_fflagdata_bits_uop_debug_tsrc :
    io_in_1_bits_fflagdata_bits_uop_debug_tsrc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_fflagdata_bits_fflag = io_in_0_valid ? io_in_0_bits_fflagdata_bits_fflag :
    io_in_1_bits_fflagdata_bits_fflag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_chosen = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 126:27 Arbiter.scala 127:17 Arbiter.scala 123:13]
endmodule
