module RenameStage(
  input         clock,
  input         reset,
  output        io_ren_stalls_0,
  output        io_ren_stalls_1,
  input         io_kill,
  input         io_dec_fire_0,
  input         io_dec_fire_1,
  input         io_dec_uops_0_switch,
  input         io_dec_uops_0_switch_off,
  input         io_dec_uops_0_is_unicore,
  input  [2:0]  io_dec_uops_0_shift,
  input  [1:0]  io_dec_uops_0_lrs3_rtype,
  input         io_dec_uops_0_rflag,
  input         io_dec_uops_0_wflag,
  input  [3:0]  io_dec_uops_0_prflag,
  input  [3:0]  io_dec_uops_0_pwflag,
  input         io_dec_uops_0_pflag_busy,
  input  [3:0]  io_dec_uops_0_stale_pflag,
  input  [3:0]  io_dec_uops_0_op1_sel,
  input  [3:0]  io_dec_uops_0_op2_sel,
  input  [5:0]  io_dec_uops_0_split_num,
  input  [5:0]  io_dec_uops_0_self_index,
  input  [5:0]  io_dec_uops_0_rob_inst_idx,
  input  [5:0]  io_dec_uops_0_address_num,
  input  [6:0]  io_dec_uops_0_uopc,
  input  [31:0] io_dec_uops_0_inst,
  input  [31:0] io_dec_uops_0_debug_inst,
  input         io_dec_uops_0_is_rvc,
  input  [39:0] io_dec_uops_0_debug_pc,
  input  [2:0]  io_dec_uops_0_iq_type,
  input  [9:0]  io_dec_uops_0_fu_code,
  input  [3:0]  io_dec_uops_0_ctrl_br_type,
  input  [1:0]  io_dec_uops_0_ctrl_op1_sel,
  input  [2:0]  io_dec_uops_0_ctrl_op2_sel,
  input  [2:0]  io_dec_uops_0_ctrl_imm_sel,
  input  [3:0]  io_dec_uops_0_ctrl_op_fcn,
  input         io_dec_uops_0_ctrl_fcn_dw,
  input  [2:0]  io_dec_uops_0_ctrl_csr_cmd,
  input         io_dec_uops_0_ctrl_is_load,
  input         io_dec_uops_0_ctrl_is_sta,
  input         io_dec_uops_0_ctrl_is_std,
  input  [1:0]  io_dec_uops_0_ctrl_op3_sel,
  input  [1:0]  io_dec_uops_0_iw_state,
  input         io_dec_uops_0_iw_p1_poisoned,
  input         io_dec_uops_0_iw_p2_poisoned,
  input         io_dec_uops_0_is_br,
  input         io_dec_uops_0_is_jalr,
  input         io_dec_uops_0_is_jal,
  input         io_dec_uops_0_is_sfb,
  input  [11:0] io_dec_uops_0_br_mask,
  input  [3:0]  io_dec_uops_0_br_tag,
  input  [4:0]  io_dec_uops_0_ftq_idx,
  input         io_dec_uops_0_edge_inst,
  input  [5:0]  io_dec_uops_0_pc_lob,
  input         io_dec_uops_0_taken,
  input  [19:0] io_dec_uops_0_imm_packed,
  input  [11:0] io_dec_uops_0_csr_addr,
  input  [5:0]  io_dec_uops_0_rob_idx,
  input  [4:0]  io_dec_uops_0_ldq_idx,
  input  [4:0]  io_dec_uops_0_stq_idx,
  input  [1:0]  io_dec_uops_0_rxq_idx,
  input  [6:0]  io_dec_uops_0_pdst,
  input  [6:0]  io_dec_uops_0_prs1,
  input  [6:0]  io_dec_uops_0_prs2,
  input  [6:0]  io_dec_uops_0_prs3,
  input  [4:0]  io_dec_uops_0_ppred,
  input         io_dec_uops_0_prs1_busy,
  input         io_dec_uops_0_prs2_busy,
  input         io_dec_uops_0_prs3_busy,
  input         io_dec_uops_0_ppred_busy,
  input  [6:0]  io_dec_uops_0_stale_pdst,
  input         io_dec_uops_0_exception,
  input  [63:0] io_dec_uops_0_exc_cause,
  input         io_dec_uops_0_bypassable,
  input  [4:0]  io_dec_uops_0_mem_cmd,
  input  [1:0]  io_dec_uops_0_mem_size,
  input         io_dec_uops_0_mem_signed,
  input         io_dec_uops_0_is_fence,
  input         io_dec_uops_0_is_fencei,
  input         io_dec_uops_0_is_amo,
  input         io_dec_uops_0_uses_ldq,
  input         io_dec_uops_0_uses_stq,
  input         io_dec_uops_0_is_sys_pc2epc,
  input         io_dec_uops_0_is_unique,
  input         io_dec_uops_0_flush_on_commit,
  input         io_dec_uops_0_ldst_is_rs1,
  input  [5:0]  io_dec_uops_0_ldst,
  input  [5:0]  io_dec_uops_0_lrs1,
  input  [5:0]  io_dec_uops_0_lrs2,
  input  [5:0]  io_dec_uops_0_lrs3,
  input         io_dec_uops_0_ldst_val,
  input  [1:0]  io_dec_uops_0_dst_rtype,
  input  [1:0]  io_dec_uops_0_lrs1_rtype,
  input  [1:0]  io_dec_uops_0_lrs2_rtype,
  input         io_dec_uops_0_frs3_en,
  input         io_dec_uops_0_fp_val,
  input         io_dec_uops_0_fp_single,
  input         io_dec_uops_0_xcpt_pf_if,
  input         io_dec_uops_0_xcpt_ae_if,
  input         io_dec_uops_0_xcpt_ma_if,
  input         io_dec_uops_0_bp_debug_if,
  input         io_dec_uops_0_bp_xcpt_if,
  input  [1:0]  io_dec_uops_0_debug_fsrc,
  input  [1:0]  io_dec_uops_0_debug_tsrc,
  input         io_dec_uops_1_switch,
  input         io_dec_uops_1_switch_off,
  input         io_dec_uops_1_is_unicore,
  input  [2:0]  io_dec_uops_1_shift,
  input  [1:0]  io_dec_uops_1_lrs3_rtype,
  input         io_dec_uops_1_rflag,
  input         io_dec_uops_1_wflag,
  input  [3:0]  io_dec_uops_1_prflag,
  input  [3:0]  io_dec_uops_1_pwflag,
  input         io_dec_uops_1_pflag_busy,
  input  [3:0]  io_dec_uops_1_stale_pflag,
  input  [3:0]  io_dec_uops_1_op1_sel,
  input  [3:0]  io_dec_uops_1_op2_sel,
  input  [5:0]  io_dec_uops_1_split_num,
  input  [5:0]  io_dec_uops_1_self_index,
  input  [5:0]  io_dec_uops_1_rob_inst_idx,
  input  [5:0]  io_dec_uops_1_address_num,
  input  [6:0]  io_dec_uops_1_uopc,
  input  [31:0] io_dec_uops_1_inst,
  input  [31:0] io_dec_uops_1_debug_inst,
  input         io_dec_uops_1_is_rvc,
  input  [39:0] io_dec_uops_1_debug_pc,
  input  [2:0]  io_dec_uops_1_iq_type,
  input  [9:0]  io_dec_uops_1_fu_code,
  input  [3:0]  io_dec_uops_1_ctrl_br_type,
  input  [1:0]  io_dec_uops_1_ctrl_op1_sel,
  input  [2:0]  io_dec_uops_1_ctrl_op2_sel,
  input  [2:0]  io_dec_uops_1_ctrl_imm_sel,
  input  [3:0]  io_dec_uops_1_ctrl_op_fcn,
  input         io_dec_uops_1_ctrl_fcn_dw,
  input  [2:0]  io_dec_uops_1_ctrl_csr_cmd,
  input         io_dec_uops_1_ctrl_is_load,
  input         io_dec_uops_1_ctrl_is_sta,
  input         io_dec_uops_1_ctrl_is_std,
  input  [1:0]  io_dec_uops_1_ctrl_op3_sel,
  input  [1:0]  io_dec_uops_1_iw_state,
  input         io_dec_uops_1_iw_p1_poisoned,
  input         io_dec_uops_1_iw_p2_poisoned,
  input         io_dec_uops_1_is_br,
  input         io_dec_uops_1_is_jalr,
  input         io_dec_uops_1_is_jal,
  input         io_dec_uops_1_is_sfb,
  input  [11:0] io_dec_uops_1_br_mask,
  input  [3:0]  io_dec_uops_1_br_tag,
  input  [4:0]  io_dec_uops_1_ftq_idx,
  input         io_dec_uops_1_edge_inst,
  input  [5:0]  io_dec_uops_1_pc_lob,
  input         io_dec_uops_1_taken,
  input  [19:0] io_dec_uops_1_imm_packed,
  input  [11:0] io_dec_uops_1_csr_addr,
  input  [5:0]  io_dec_uops_1_rob_idx,
  input  [4:0]  io_dec_uops_1_ldq_idx,
  input  [4:0]  io_dec_uops_1_stq_idx,
  input  [1:0]  io_dec_uops_1_rxq_idx,
  input  [6:0]  io_dec_uops_1_pdst,
  input  [6:0]  io_dec_uops_1_prs1,
  input  [6:0]  io_dec_uops_1_prs2,
  input  [6:0]  io_dec_uops_1_prs3,
  input  [4:0]  io_dec_uops_1_ppred,
  input         io_dec_uops_1_prs1_busy,
  input         io_dec_uops_1_prs2_busy,
  input         io_dec_uops_1_prs3_busy,
  input         io_dec_uops_1_ppred_busy,
  input  [6:0]  io_dec_uops_1_stale_pdst,
  input         io_dec_uops_1_exception,
  input  [63:0] io_dec_uops_1_exc_cause,
  input         io_dec_uops_1_bypassable,
  input  [4:0]  io_dec_uops_1_mem_cmd,
  input  [1:0]  io_dec_uops_1_mem_size,
  input         io_dec_uops_1_mem_signed,
  input         io_dec_uops_1_is_fence,
  input         io_dec_uops_1_is_fencei,
  input         io_dec_uops_1_is_amo,
  input         io_dec_uops_1_uses_ldq,
  input         io_dec_uops_1_uses_stq,
  input         io_dec_uops_1_is_sys_pc2epc,
  input         io_dec_uops_1_is_unique,
  input         io_dec_uops_1_flush_on_commit,
  input         io_dec_uops_1_ldst_is_rs1,
  input  [5:0]  io_dec_uops_1_ldst,
  input  [5:0]  io_dec_uops_1_lrs1,
  input  [5:0]  io_dec_uops_1_lrs2,
  input  [5:0]  io_dec_uops_1_lrs3,
  input         io_dec_uops_1_ldst_val,
  input  [1:0]  io_dec_uops_1_dst_rtype,
  input  [1:0]  io_dec_uops_1_lrs1_rtype,
  input  [1:0]  io_dec_uops_1_lrs2_rtype,
  input         io_dec_uops_1_frs3_en,
  input         io_dec_uops_1_fp_val,
  input         io_dec_uops_1_fp_single,
  input         io_dec_uops_1_xcpt_pf_if,
  input         io_dec_uops_1_xcpt_ae_if,
  input         io_dec_uops_1_xcpt_ma_if,
  input         io_dec_uops_1_bp_debug_if,
  input         io_dec_uops_1_bp_xcpt_if,
  input  [1:0]  io_dec_uops_1_debug_fsrc,
  input  [1:0]  io_dec_uops_1_debug_tsrc,
  output        io_ren2_mask_0,
  output        io_ren2_mask_1,
  output        io_ren2_uops_0_switch,
  output        io_ren2_uops_0_switch_off,
  output        io_ren2_uops_0_is_unicore,
  output [2:0]  io_ren2_uops_0_shift,
  output [1:0]  io_ren2_uops_0_lrs3_rtype,
  output        io_ren2_uops_0_rflag,
  output        io_ren2_uops_0_wflag,
  output [3:0]  io_ren2_uops_0_prflag,
  output [3:0]  io_ren2_uops_0_pwflag,
  output        io_ren2_uops_0_pflag_busy,
  output [3:0]  io_ren2_uops_0_stale_pflag,
  output [3:0]  io_ren2_uops_0_op1_sel,
  output [3:0]  io_ren2_uops_0_op2_sel,
  output [5:0]  io_ren2_uops_0_split_num,
  output [5:0]  io_ren2_uops_0_self_index,
  output [5:0]  io_ren2_uops_0_rob_inst_idx,
  output [5:0]  io_ren2_uops_0_address_num,
  output [6:0]  io_ren2_uops_0_uopc,
  output [31:0] io_ren2_uops_0_inst,
  output [31:0] io_ren2_uops_0_debug_inst,
  output        io_ren2_uops_0_is_rvc,
  output [39:0] io_ren2_uops_0_debug_pc,
  output [2:0]  io_ren2_uops_0_iq_type,
  output [9:0]  io_ren2_uops_0_fu_code,
  output [3:0]  io_ren2_uops_0_ctrl_br_type,
  output [1:0]  io_ren2_uops_0_ctrl_op1_sel,
  output [2:0]  io_ren2_uops_0_ctrl_op2_sel,
  output [2:0]  io_ren2_uops_0_ctrl_imm_sel,
  output [3:0]  io_ren2_uops_0_ctrl_op_fcn,
  output        io_ren2_uops_0_ctrl_fcn_dw,
  output [2:0]  io_ren2_uops_0_ctrl_csr_cmd,
  output        io_ren2_uops_0_ctrl_is_load,
  output        io_ren2_uops_0_ctrl_is_sta,
  output        io_ren2_uops_0_ctrl_is_std,
  output [1:0]  io_ren2_uops_0_ctrl_op3_sel,
  output [1:0]  io_ren2_uops_0_iw_state,
  output        io_ren2_uops_0_iw_p1_poisoned,
  output        io_ren2_uops_0_iw_p2_poisoned,
  output        io_ren2_uops_0_is_br,
  output        io_ren2_uops_0_is_jalr,
  output        io_ren2_uops_0_is_jal,
  output        io_ren2_uops_0_is_sfb,
  output [11:0] io_ren2_uops_0_br_mask,
  output [3:0]  io_ren2_uops_0_br_tag,
  output [4:0]  io_ren2_uops_0_ftq_idx,
  output        io_ren2_uops_0_edge_inst,
  output [5:0]  io_ren2_uops_0_pc_lob,
  output        io_ren2_uops_0_taken,
  output [19:0] io_ren2_uops_0_imm_packed,
  output [11:0] io_ren2_uops_0_csr_addr,
  output [5:0]  io_ren2_uops_0_rob_idx,
  output [4:0]  io_ren2_uops_0_ldq_idx,
  output [4:0]  io_ren2_uops_0_stq_idx,
  output [1:0]  io_ren2_uops_0_rxq_idx,
  output [6:0]  io_ren2_uops_0_pdst,
  output [6:0]  io_ren2_uops_0_prs1,
  output [6:0]  io_ren2_uops_0_prs2,
  output [6:0]  io_ren2_uops_0_prs3,
  output [4:0]  io_ren2_uops_0_ppred,
  output        io_ren2_uops_0_prs1_busy,
  output        io_ren2_uops_0_prs2_busy,
  output        io_ren2_uops_0_prs3_busy,
  output        io_ren2_uops_0_ppred_busy,
  output [6:0]  io_ren2_uops_0_stale_pdst,
  output        io_ren2_uops_0_exception,
  output [63:0] io_ren2_uops_0_exc_cause,
  output        io_ren2_uops_0_bypassable,
  output [4:0]  io_ren2_uops_0_mem_cmd,
  output [1:0]  io_ren2_uops_0_mem_size,
  output        io_ren2_uops_0_mem_signed,
  output        io_ren2_uops_0_is_fence,
  output        io_ren2_uops_0_is_fencei,
  output        io_ren2_uops_0_is_amo,
  output        io_ren2_uops_0_uses_ldq,
  output        io_ren2_uops_0_uses_stq,
  output        io_ren2_uops_0_is_sys_pc2epc,
  output        io_ren2_uops_0_is_unique,
  output        io_ren2_uops_0_flush_on_commit,
  output        io_ren2_uops_0_ldst_is_rs1,
  output [5:0]  io_ren2_uops_0_ldst,
  output [5:0]  io_ren2_uops_0_lrs1,
  output [5:0]  io_ren2_uops_0_lrs2,
  output [5:0]  io_ren2_uops_0_lrs3,
  output        io_ren2_uops_0_ldst_val,
  output [1:0]  io_ren2_uops_0_dst_rtype,
  output [1:0]  io_ren2_uops_0_lrs1_rtype,
  output [1:0]  io_ren2_uops_0_lrs2_rtype,
  output        io_ren2_uops_0_frs3_en,
  output        io_ren2_uops_0_fp_val,
  output        io_ren2_uops_0_fp_single,
  output        io_ren2_uops_0_xcpt_pf_if,
  output        io_ren2_uops_0_xcpt_ae_if,
  output        io_ren2_uops_0_xcpt_ma_if,
  output        io_ren2_uops_0_bp_debug_if,
  output        io_ren2_uops_0_bp_xcpt_if,
  output [1:0]  io_ren2_uops_0_debug_fsrc,
  output [1:0]  io_ren2_uops_0_debug_tsrc,
  output        io_ren2_uops_1_switch,
  output        io_ren2_uops_1_switch_off,
  output        io_ren2_uops_1_is_unicore,
  output [2:0]  io_ren2_uops_1_shift,
  output [1:0]  io_ren2_uops_1_lrs3_rtype,
  output        io_ren2_uops_1_rflag,
  output        io_ren2_uops_1_wflag,
  output [3:0]  io_ren2_uops_1_prflag,
  output [3:0]  io_ren2_uops_1_pwflag,
  output        io_ren2_uops_1_pflag_busy,
  output [3:0]  io_ren2_uops_1_stale_pflag,
  output [3:0]  io_ren2_uops_1_op1_sel,
  output [3:0]  io_ren2_uops_1_op2_sel,
  output [5:0]  io_ren2_uops_1_split_num,
  output [5:0]  io_ren2_uops_1_self_index,
  output [5:0]  io_ren2_uops_1_rob_inst_idx,
  output [5:0]  io_ren2_uops_1_address_num,
  output [6:0]  io_ren2_uops_1_uopc,
  output [31:0] io_ren2_uops_1_inst,
  output [31:0] io_ren2_uops_1_debug_inst,
  output        io_ren2_uops_1_is_rvc,
  output [39:0] io_ren2_uops_1_debug_pc,
  output [2:0]  io_ren2_uops_1_iq_type,
  output [9:0]  io_ren2_uops_1_fu_code,
  output [3:0]  io_ren2_uops_1_ctrl_br_type,
  output [1:0]  io_ren2_uops_1_ctrl_op1_sel,
  output [2:0]  io_ren2_uops_1_ctrl_op2_sel,
  output [2:0]  io_ren2_uops_1_ctrl_imm_sel,
  output [3:0]  io_ren2_uops_1_ctrl_op_fcn,
  output        io_ren2_uops_1_ctrl_fcn_dw,
  output [2:0]  io_ren2_uops_1_ctrl_csr_cmd,
  output        io_ren2_uops_1_ctrl_is_load,
  output        io_ren2_uops_1_ctrl_is_sta,
  output        io_ren2_uops_1_ctrl_is_std,
  output [1:0]  io_ren2_uops_1_ctrl_op3_sel,
  output [1:0]  io_ren2_uops_1_iw_state,
  output        io_ren2_uops_1_iw_p1_poisoned,
  output        io_ren2_uops_1_iw_p2_poisoned,
  output        io_ren2_uops_1_is_br,
  output        io_ren2_uops_1_is_jalr,
  output        io_ren2_uops_1_is_jal,
  output        io_ren2_uops_1_is_sfb,
  output [11:0] io_ren2_uops_1_br_mask,
  output [3:0]  io_ren2_uops_1_br_tag,
  output [4:0]  io_ren2_uops_1_ftq_idx,
  output        io_ren2_uops_1_edge_inst,
  output [5:0]  io_ren2_uops_1_pc_lob,
  output        io_ren2_uops_1_taken,
  output [19:0] io_ren2_uops_1_imm_packed,
  output [11:0] io_ren2_uops_1_csr_addr,
  output [5:0]  io_ren2_uops_1_rob_idx,
  output [4:0]  io_ren2_uops_1_ldq_idx,
  output [4:0]  io_ren2_uops_1_stq_idx,
  output [1:0]  io_ren2_uops_1_rxq_idx,
  output [6:0]  io_ren2_uops_1_pdst,
  output [6:0]  io_ren2_uops_1_prs1,
  output [6:0]  io_ren2_uops_1_prs2,
  output [6:0]  io_ren2_uops_1_prs3,
  output [4:0]  io_ren2_uops_1_ppred,
  output        io_ren2_uops_1_prs1_busy,
  output        io_ren2_uops_1_prs2_busy,
  output        io_ren2_uops_1_prs3_busy,
  output        io_ren2_uops_1_ppred_busy,
  output [6:0]  io_ren2_uops_1_stale_pdst,
  output        io_ren2_uops_1_exception,
  output [63:0] io_ren2_uops_1_exc_cause,
  output        io_ren2_uops_1_bypassable,
  output [4:0]  io_ren2_uops_1_mem_cmd,
  output [1:0]  io_ren2_uops_1_mem_size,
  output        io_ren2_uops_1_mem_signed,
  output        io_ren2_uops_1_is_fence,
  output        io_ren2_uops_1_is_fencei,
  output        io_ren2_uops_1_is_amo,
  output        io_ren2_uops_1_uses_ldq,
  output        io_ren2_uops_1_uses_stq,
  output        io_ren2_uops_1_is_sys_pc2epc,
  output        io_ren2_uops_1_is_unique,
  output        io_ren2_uops_1_flush_on_commit,
  output        io_ren2_uops_1_ldst_is_rs1,
  output [5:0]  io_ren2_uops_1_ldst,
  output [5:0]  io_ren2_uops_1_lrs1,
  output [5:0]  io_ren2_uops_1_lrs2,
  output [5:0]  io_ren2_uops_1_lrs3,
  output        io_ren2_uops_1_ldst_val,
  output [1:0]  io_ren2_uops_1_dst_rtype,
  output [1:0]  io_ren2_uops_1_lrs1_rtype,
  output [1:0]  io_ren2_uops_1_lrs2_rtype,
  output        io_ren2_uops_1_frs3_en,
  output        io_ren2_uops_1_fp_val,
  output        io_ren2_uops_1_fp_single,
  output        io_ren2_uops_1_xcpt_pf_if,
  output        io_ren2_uops_1_xcpt_ae_if,
  output        io_ren2_uops_1_xcpt_ma_if,
  output        io_ren2_uops_1_bp_debug_if,
  output        io_ren2_uops_1_bp_xcpt_if,
  output [1:0]  io_ren2_uops_1_debug_fsrc,
  output [1:0]  io_ren2_uops_1_debug_tsrc,
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
  input         io_dis_fire_0,
  input         io_dis_fire_1,
  input         io_dis_ready,
  input         io_wakeups_0_valid,
  input         io_wakeups_0_bits_uop_switch,
  input         io_wakeups_0_bits_uop_switch_off,
  input         io_wakeups_0_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_0_bits_uop_shift,
  input  [1:0]  io_wakeups_0_bits_uop_lrs3_rtype,
  input         io_wakeups_0_bits_uop_rflag,
  input         io_wakeups_0_bits_uop_wflag,
  input  [3:0]  io_wakeups_0_bits_uop_prflag,
  input  [3:0]  io_wakeups_0_bits_uop_pwflag,
  input         io_wakeups_0_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_0_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_0_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_0_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_0_bits_uop_split_num,
  input  [5:0]  io_wakeups_0_bits_uop_self_index,
  input  [5:0]  io_wakeups_0_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_0_bits_uop_address_num,
  input  [6:0]  io_wakeups_0_bits_uop_uopc,
  input  [31:0] io_wakeups_0_bits_uop_inst,
  input  [31:0] io_wakeups_0_bits_uop_debug_inst,
  input         io_wakeups_0_bits_uop_is_rvc,
  input  [39:0] io_wakeups_0_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_0_bits_uop_iq_type,
  input  [9:0]  io_wakeups_0_bits_uop_fu_code,
  input  [3:0]  io_wakeups_0_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_0_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_0_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_0_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_0_bits_uop_ctrl_op_fcn,
  input         io_wakeups_0_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_0_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_0_bits_uop_ctrl_is_load,
  input         io_wakeups_0_bits_uop_ctrl_is_sta,
  input         io_wakeups_0_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_0_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_0_bits_uop_iw_state,
  input         io_wakeups_0_bits_uop_iw_p1_poisoned,
  input         io_wakeups_0_bits_uop_iw_p2_poisoned,
  input         io_wakeups_0_bits_uop_is_br,
  input         io_wakeups_0_bits_uop_is_jalr,
  input         io_wakeups_0_bits_uop_is_jal,
  input         io_wakeups_0_bits_uop_is_sfb,
  input  [11:0] io_wakeups_0_bits_uop_br_mask,
  input  [3:0]  io_wakeups_0_bits_uop_br_tag,
  input  [4:0]  io_wakeups_0_bits_uop_ftq_idx,
  input         io_wakeups_0_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_0_bits_uop_pc_lob,
  input         io_wakeups_0_bits_uop_taken,
  input  [19:0] io_wakeups_0_bits_uop_imm_packed,
  input  [11:0] io_wakeups_0_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_0_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_0_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_0_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_0_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_0_bits_uop_pdst,
  input  [6:0]  io_wakeups_0_bits_uop_prs1,
  input  [6:0]  io_wakeups_0_bits_uop_prs2,
  input  [6:0]  io_wakeups_0_bits_uop_prs3,
  input  [4:0]  io_wakeups_0_bits_uop_ppred,
  input         io_wakeups_0_bits_uop_prs1_busy,
  input         io_wakeups_0_bits_uop_prs2_busy,
  input         io_wakeups_0_bits_uop_prs3_busy,
  input         io_wakeups_0_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_0_bits_uop_stale_pdst,
  input         io_wakeups_0_bits_uop_exception,
  input  [63:0] io_wakeups_0_bits_uop_exc_cause,
  input         io_wakeups_0_bits_uop_bypassable,
  input  [4:0]  io_wakeups_0_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_0_bits_uop_mem_size,
  input         io_wakeups_0_bits_uop_mem_signed,
  input         io_wakeups_0_bits_uop_is_fence,
  input         io_wakeups_0_bits_uop_is_fencei,
  input         io_wakeups_0_bits_uop_is_amo,
  input         io_wakeups_0_bits_uop_uses_ldq,
  input         io_wakeups_0_bits_uop_uses_stq,
  input         io_wakeups_0_bits_uop_is_sys_pc2epc,
  input         io_wakeups_0_bits_uop_is_unique,
  input         io_wakeups_0_bits_uop_flush_on_commit,
  input         io_wakeups_0_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_0_bits_uop_ldst,
  input  [5:0]  io_wakeups_0_bits_uop_lrs1,
  input  [5:0]  io_wakeups_0_bits_uop_lrs2,
  input  [5:0]  io_wakeups_0_bits_uop_lrs3,
  input         io_wakeups_0_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_0_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_0_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_0_bits_uop_lrs2_rtype,
  input         io_wakeups_0_bits_uop_frs3_en,
  input         io_wakeups_0_bits_uop_fp_val,
  input         io_wakeups_0_bits_uop_fp_single,
  input         io_wakeups_0_bits_uop_xcpt_pf_if,
  input         io_wakeups_0_bits_uop_xcpt_ae_if,
  input         io_wakeups_0_bits_uop_xcpt_ma_if,
  input         io_wakeups_0_bits_uop_bp_debug_if,
  input         io_wakeups_0_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_0_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_0_bits_uop_debug_tsrc,
  input  [63:0] io_wakeups_0_bits_data,
  input         io_wakeups_0_bits_predicated,
  input         io_wakeups_0_bits_fflags_valid,
  input         io_wakeups_0_bits_fflags_bits_uop_switch,
  input         io_wakeups_0_bits_fflags_bits_uop_switch_off,
  input         io_wakeups_0_bits_fflags_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_0_bits_fflags_bits_uop_shift,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_lrs3_rtype,
  input         io_wakeups_0_bits_fflags_bits_uop_rflag,
  input         io_wakeups_0_bits_fflags_bits_uop_wflag,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_prflag,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_pwflag,
  input         io_wakeups_0_bits_fflags_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_split_num,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_self_index,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_address_num,
  input  [6:0]  io_wakeups_0_bits_fflags_bits_uop_uopc,
  input  [31:0] io_wakeups_0_bits_fflags_bits_uop_inst,
  input  [31:0] io_wakeups_0_bits_fflags_bits_uop_debug_inst,
  input         io_wakeups_0_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_wakeups_0_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_0_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_wakeups_0_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_wakeups_0_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_0_bits_fflags_bits_uop_ctrl_is_load,
  input         io_wakeups_0_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_wakeups_0_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_iw_state,
  input         io_wakeups_0_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_wakeups_0_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_wakeups_0_bits_fflags_bits_uop_is_br,
  input         io_wakeups_0_bits_fflags_bits_uop_is_jalr,
  input         io_wakeups_0_bits_fflags_bits_uop_is_jal,
  input         io_wakeups_0_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_wakeups_0_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_wakeups_0_bits_fflags_bits_uop_ftq_idx,
  input         io_wakeups_0_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_pc_lob,
  input         io_wakeups_0_bits_fflags_bits_uop_taken,
  input  [19:0] io_wakeups_0_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_wakeups_0_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_0_bits_fflags_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_0_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_0_bits_fflags_bits_uop_pdst,
  input  [6:0]  io_wakeups_0_bits_fflags_bits_uop_prs1,
  input  [6:0]  io_wakeups_0_bits_fflags_bits_uop_prs2,
  input  [6:0]  io_wakeups_0_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_wakeups_0_bits_fflags_bits_uop_ppred,
  input         io_wakeups_0_bits_fflags_bits_uop_prs1_busy,
  input         io_wakeups_0_bits_fflags_bits_uop_prs2_busy,
  input         io_wakeups_0_bits_fflags_bits_uop_prs3_busy,
  input         io_wakeups_0_bits_fflags_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_0_bits_fflags_bits_uop_stale_pdst,
  input         io_wakeups_0_bits_fflags_bits_uop_exception,
  input  [63:0] io_wakeups_0_bits_fflags_bits_uop_exc_cause,
  input         io_wakeups_0_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_wakeups_0_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_mem_size,
  input         io_wakeups_0_bits_fflags_bits_uop_mem_signed,
  input         io_wakeups_0_bits_fflags_bits_uop_is_fence,
  input         io_wakeups_0_bits_fflags_bits_uop_is_fencei,
  input         io_wakeups_0_bits_fflags_bits_uop_is_amo,
  input         io_wakeups_0_bits_fflags_bits_uop_uses_ldq,
  input         io_wakeups_0_bits_fflags_bits_uop_uses_stq,
  input         io_wakeups_0_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_wakeups_0_bits_fflags_bits_uop_is_unique,
  input         io_wakeups_0_bits_fflags_bits_uop_flush_on_commit,
  input         io_wakeups_0_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_lrs3,
  input         io_wakeups_0_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_lrs2_rtype,
  input         io_wakeups_0_bits_fflags_bits_uop_frs3_en,
  input         io_wakeups_0_bits_fflags_bits_uop_fp_val,
  input         io_wakeups_0_bits_fflags_bits_uop_fp_single,
  input         io_wakeups_0_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_wakeups_0_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_wakeups_0_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_wakeups_0_bits_fflags_bits_uop_bp_debug_if,
  input         io_wakeups_0_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_wakeups_0_bits_fflags_bits_flags,
  input  [3:0]  io_wakeups_0_bits_flagdata,
  input         io_wakeups_0_bits_fflagdata_valid,
  input         io_wakeups_0_bits_fflagdata_bits_uop_switch,
  input         io_wakeups_0_bits_fflagdata_bits_uop_switch_off,
  input         io_wakeups_0_bits_fflagdata_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_0_bits_fflagdata_bits_uop_shift,
  input  [1:0]  io_wakeups_0_bits_fflagdata_bits_uop_lrs3_rtype,
  input         io_wakeups_0_bits_fflagdata_bits_uop_rflag,
  input         io_wakeups_0_bits_fflagdata_bits_uop_wflag,
  input  [3:0]  io_wakeups_0_bits_fflagdata_bits_uop_prflag,
  input  [3:0]  io_wakeups_0_bits_fflagdata_bits_uop_pwflag,
  input         io_wakeups_0_bits_fflagdata_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_0_bits_fflagdata_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_0_bits_fflagdata_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_0_bits_fflagdata_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_0_bits_fflagdata_bits_uop_split_num,
  input  [5:0]  io_wakeups_0_bits_fflagdata_bits_uop_self_index,
  input  [5:0]  io_wakeups_0_bits_fflagdata_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_0_bits_fflagdata_bits_uop_address_num,
  input  [6:0]  io_wakeups_0_bits_fflagdata_bits_uop_uopc,
  input  [31:0] io_wakeups_0_bits_fflagdata_bits_uop_inst,
  input  [31:0] io_wakeups_0_bits_fflagdata_bits_uop_debug_inst,
  input         io_wakeups_0_bits_fflagdata_bits_uop_is_rvc,
  input  [39:0] io_wakeups_0_bits_fflagdata_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_0_bits_fflagdata_bits_uop_iq_type,
  input  [9:0]  io_wakeups_0_bits_fflagdata_bits_uop_fu_code,
  input  [3:0]  io_wakeups_0_bits_fflagdata_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_0_bits_fflagdata_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_0_bits_fflagdata_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_0_bits_fflagdata_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_0_bits_fflagdata_bits_uop_ctrl_op_fcn,
  input         io_wakeups_0_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_0_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_0_bits_fflagdata_bits_uop_ctrl_is_load,
  input         io_wakeups_0_bits_fflagdata_bits_uop_ctrl_is_sta,
  input         io_wakeups_0_bits_fflagdata_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_0_bits_fflagdata_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_0_bits_fflagdata_bits_uop_iw_state,
  input         io_wakeups_0_bits_fflagdata_bits_uop_iw_p1_poisoned,
  input         io_wakeups_0_bits_fflagdata_bits_uop_iw_p2_poisoned,
  input         io_wakeups_0_bits_fflagdata_bits_uop_is_br,
  input         io_wakeups_0_bits_fflagdata_bits_uop_is_jalr,
  input         io_wakeups_0_bits_fflagdata_bits_uop_is_jal,
  input         io_wakeups_0_bits_fflagdata_bits_uop_is_sfb,
  input  [11:0] io_wakeups_0_bits_fflagdata_bits_uop_br_mask,
  input  [3:0]  io_wakeups_0_bits_fflagdata_bits_uop_br_tag,
  input  [4:0]  io_wakeups_0_bits_fflagdata_bits_uop_ftq_idx,
  input         io_wakeups_0_bits_fflagdata_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_0_bits_fflagdata_bits_uop_pc_lob,
  input         io_wakeups_0_bits_fflagdata_bits_uop_taken,
  input  [19:0] io_wakeups_0_bits_fflagdata_bits_uop_imm_packed,
  input  [11:0] io_wakeups_0_bits_fflagdata_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_0_bits_fflagdata_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_0_bits_fflagdata_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_0_bits_fflagdata_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_0_bits_fflagdata_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_0_bits_fflagdata_bits_uop_pdst,
  input  [6:0]  io_wakeups_0_bits_fflagdata_bits_uop_prs1,
  input  [6:0]  io_wakeups_0_bits_fflagdata_bits_uop_prs2,
  input  [6:0]  io_wakeups_0_bits_fflagdata_bits_uop_prs3,
  input  [4:0]  io_wakeups_0_bits_fflagdata_bits_uop_ppred,
  input         io_wakeups_0_bits_fflagdata_bits_uop_prs1_busy,
  input         io_wakeups_0_bits_fflagdata_bits_uop_prs2_busy,
  input         io_wakeups_0_bits_fflagdata_bits_uop_prs3_busy,
  input         io_wakeups_0_bits_fflagdata_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_0_bits_fflagdata_bits_uop_stale_pdst,
  input         io_wakeups_0_bits_fflagdata_bits_uop_exception,
  input  [63:0] io_wakeups_0_bits_fflagdata_bits_uop_exc_cause,
  input         io_wakeups_0_bits_fflagdata_bits_uop_bypassable,
  input  [4:0]  io_wakeups_0_bits_fflagdata_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_0_bits_fflagdata_bits_uop_mem_size,
  input         io_wakeups_0_bits_fflagdata_bits_uop_mem_signed,
  input         io_wakeups_0_bits_fflagdata_bits_uop_is_fence,
  input         io_wakeups_0_bits_fflagdata_bits_uop_is_fencei,
  input         io_wakeups_0_bits_fflagdata_bits_uop_is_amo,
  input         io_wakeups_0_bits_fflagdata_bits_uop_uses_ldq,
  input         io_wakeups_0_bits_fflagdata_bits_uop_uses_stq,
  input         io_wakeups_0_bits_fflagdata_bits_uop_is_sys_pc2epc,
  input         io_wakeups_0_bits_fflagdata_bits_uop_is_unique,
  input         io_wakeups_0_bits_fflagdata_bits_uop_flush_on_commit,
  input         io_wakeups_0_bits_fflagdata_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_0_bits_fflagdata_bits_uop_ldst,
  input  [5:0]  io_wakeups_0_bits_fflagdata_bits_uop_lrs1,
  input  [5:0]  io_wakeups_0_bits_fflagdata_bits_uop_lrs2,
  input  [5:0]  io_wakeups_0_bits_fflagdata_bits_uop_lrs3,
  input         io_wakeups_0_bits_fflagdata_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_0_bits_fflagdata_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_0_bits_fflagdata_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_0_bits_fflagdata_bits_uop_lrs2_rtype,
  input         io_wakeups_0_bits_fflagdata_bits_uop_frs3_en,
  input         io_wakeups_0_bits_fflagdata_bits_uop_fp_val,
  input         io_wakeups_0_bits_fflagdata_bits_uop_fp_single,
  input         io_wakeups_0_bits_fflagdata_bits_uop_xcpt_pf_if,
  input         io_wakeups_0_bits_fflagdata_bits_uop_xcpt_ae_if,
  input         io_wakeups_0_bits_fflagdata_bits_uop_xcpt_ma_if,
  input         io_wakeups_0_bits_fflagdata_bits_uop_bp_debug_if,
  input         io_wakeups_0_bits_fflagdata_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_0_bits_fflagdata_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_0_bits_fflagdata_bits_uop_debug_tsrc,
  input  [31:0] io_wakeups_0_bits_fflagdata_bits_fflag,
  input         io_wakeups_1_valid,
  input         io_wakeups_1_bits_uop_switch,
  input         io_wakeups_1_bits_uop_switch_off,
  input         io_wakeups_1_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_1_bits_uop_shift,
  input  [1:0]  io_wakeups_1_bits_uop_lrs3_rtype,
  input         io_wakeups_1_bits_uop_rflag,
  input         io_wakeups_1_bits_uop_wflag,
  input  [3:0]  io_wakeups_1_bits_uop_prflag,
  input  [3:0]  io_wakeups_1_bits_uop_pwflag,
  input         io_wakeups_1_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_1_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_1_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_1_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_1_bits_uop_split_num,
  input  [5:0]  io_wakeups_1_bits_uop_self_index,
  input  [5:0]  io_wakeups_1_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_1_bits_uop_address_num,
  input  [6:0]  io_wakeups_1_bits_uop_uopc,
  input  [31:0] io_wakeups_1_bits_uop_inst,
  input  [31:0] io_wakeups_1_bits_uop_debug_inst,
  input         io_wakeups_1_bits_uop_is_rvc,
  input  [39:0] io_wakeups_1_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_1_bits_uop_iq_type,
  input  [9:0]  io_wakeups_1_bits_uop_fu_code,
  input  [3:0]  io_wakeups_1_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_1_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_1_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_1_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_1_bits_uop_ctrl_op_fcn,
  input         io_wakeups_1_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_1_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_1_bits_uop_ctrl_is_load,
  input         io_wakeups_1_bits_uop_ctrl_is_sta,
  input         io_wakeups_1_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_1_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_1_bits_uop_iw_state,
  input         io_wakeups_1_bits_uop_iw_p1_poisoned,
  input         io_wakeups_1_bits_uop_iw_p2_poisoned,
  input         io_wakeups_1_bits_uop_is_br,
  input         io_wakeups_1_bits_uop_is_jalr,
  input         io_wakeups_1_bits_uop_is_jal,
  input         io_wakeups_1_bits_uop_is_sfb,
  input  [11:0] io_wakeups_1_bits_uop_br_mask,
  input  [3:0]  io_wakeups_1_bits_uop_br_tag,
  input  [4:0]  io_wakeups_1_bits_uop_ftq_idx,
  input         io_wakeups_1_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_1_bits_uop_pc_lob,
  input         io_wakeups_1_bits_uop_taken,
  input  [19:0] io_wakeups_1_bits_uop_imm_packed,
  input  [11:0] io_wakeups_1_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_1_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_1_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_1_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_1_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_1_bits_uop_pdst,
  input  [6:0]  io_wakeups_1_bits_uop_prs1,
  input  [6:0]  io_wakeups_1_bits_uop_prs2,
  input  [6:0]  io_wakeups_1_bits_uop_prs3,
  input  [4:0]  io_wakeups_1_bits_uop_ppred,
  input         io_wakeups_1_bits_uop_prs1_busy,
  input         io_wakeups_1_bits_uop_prs2_busy,
  input         io_wakeups_1_bits_uop_prs3_busy,
  input         io_wakeups_1_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_1_bits_uop_stale_pdst,
  input         io_wakeups_1_bits_uop_exception,
  input  [63:0] io_wakeups_1_bits_uop_exc_cause,
  input         io_wakeups_1_bits_uop_bypassable,
  input  [4:0]  io_wakeups_1_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_1_bits_uop_mem_size,
  input         io_wakeups_1_bits_uop_mem_signed,
  input         io_wakeups_1_bits_uop_is_fence,
  input         io_wakeups_1_bits_uop_is_fencei,
  input         io_wakeups_1_bits_uop_is_amo,
  input         io_wakeups_1_bits_uop_uses_ldq,
  input         io_wakeups_1_bits_uop_uses_stq,
  input         io_wakeups_1_bits_uop_is_sys_pc2epc,
  input         io_wakeups_1_bits_uop_is_unique,
  input         io_wakeups_1_bits_uop_flush_on_commit,
  input         io_wakeups_1_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_1_bits_uop_ldst,
  input  [5:0]  io_wakeups_1_bits_uop_lrs1,
  input  [5:0]  io_wakeups_1_bits_uop_lrs2,
  input  [5:0]  io_wakeups_1_bits_uop_lrs3,
  input         io_wakeups_1_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_1_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_1_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_1_bits_uop_lrs2_rtype,
  input         io_wakeups_1_bits_uop_frs3_en,
  input         io_wakeups_1_bits_uop_fp_val,
  input         io_wakeups_1_bits_uop_fp_single,
  input         io_wakeups_1_bits_uop_xcpt_pf_if,
  input         io_wakeups_1_bits_uop_xcpt_ae_if,
  input         io_wakeups_1_bits_uop_xcpt_ma_if,
  input         io_wakeups_1_bits_uop_bp_debug_if,
  input         io_wakeups_1_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_1_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_1_bits_uop_debug_tsrc,
  input  [63:0] io_wakeups_1_bits_data,
  input         io_wakeups_1_bits_predicated,
  input         io_wakeups_1_bits_fflags_valid,
  input         io_wakeups_1_bits_fflags_bits_uop_switch,
  input         io_wakeups_1_bits_fflags_bits_uop_switch_off,
  input         io_wakeups_1_bits_fflags_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_1_bits_fflags_bits_uop_shift,
  input  [1:0]  io_wakeups_1_bits_fflags_bits_uop_lrs3_rtype,
  input         io_wakeups_1_bits_fflags_bits_uop_rflag,
  input         io_wakeups_1_bits_fflags_bits_uop_wflag,
  input  [3:0]  io_wakeups_1_bits_fflags_bits_uop_prflag,
  input  [3:0]  io_wakeups_1_bits_fflags_bits_uop_pwflag,
  input         io_wakeups_1_bits_fflags_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_1_bits_fflags_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_1_bits_fflags_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_1_bits_fflags_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_1_bits_fflags_bits_uop_split_num,
  input  [5:0]  io_wakeups_1_bits_fflags_bits_uop_self_index,
  input  [5:0]  io_wakeups_1_bits_fflags_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_1_bits_fflags_bits_uop_address_num,
  input  [6:0]  io_wakeups_1_bits_fflags_bits_uop_uopc,
  input  [31:0] io_wakeups_1_bits_fflags_bits_uop_inst,
  input  [31:0] io_wakeups_1_bits_fflags_bits_uop_debug_inst,
  input         io_wakeups_1_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_wakeups_1_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_1_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_wakeups_1_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_wakeups_1_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_1_bits_fflags_bits_uop_ctrl_is_load,
  input         io_wakeups_1_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_wakeups_1_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_1_bits_fflags_bits_uop_iw_state,
  input         io_wakeups_1_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_wakeups_1_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_wakeups_1_bits_fflags_bits_uop_is_br,
  input         io_wakeups_1_bits_fflags_bits_uop_is_jalr,
  input         io_wakeups_1_bits_fflags_bits_uop_is_jal,
  input         io_wakeups_1_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_wakeups_1_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_wakeups_1_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_wakeups_1_bits_fflags_bits_uop_ftq_idx,
  input         io_wakeups_1_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_1_bits_fflags_bits_uop_pc_lob,
  input         io_wakeups_1_bits_fflags_bits_uop_taken,
  input  [19:0] io_wakeups_1_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_wakeups_1_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_1_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_1_bits_fflags_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_1_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_1_bits_fflags_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_1_bits_fflags_bits_uop_pdst,
  input  [6:0]  io_wakeups_1_bits_fflags_bits_uop_prs1,
  input  [6:0]  io_wakeups_1_bits_fflags_bits_uop_prs2,
  input  [6:0]  io_wakeups_1_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_wakeups_1_bits_fflags_bits_uop_ppred,
  input         io_wakeups_1_bits_fflags_bits_uop_prs1_busy,
  input         io_wakeups_1_bits_fflags_bits_uop_prs2_busy,
  input         io_wakeups_1_bits_fflags_bits_uop_prs3_busy,
  input         io_wakeups_1_bits_fflags_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_1_bits_fflags_bits_uop_stale_pdst,
  input         io_wakeups_1_bits_fflags_bits_uop_exception,
  input  [63:0] io_wakeups_1_bits_fflags_bits_uop_exc_cause,
  input         io_wakeups_1_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_wakeups_1_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_1_bits_fflags_bits_uop_mem_size,
  input         io_wakeups_1_bits_fflags_bits_uop_mem_signed,
  input         io_wakeups_1_bits_fflags_bits_uop_is_fence,
  input         io_wakeups_1_bits_fflags_bits_uop_is_fencei,
  input         io_wakeups_1_bits_fflags_bits_uop_is_amo,
  input         io_wakeups_1_bits_fflags_bits_uop_uses_ldq,
  input         io_wakeups_1_bits_fflags_bits_uop_uses_stq,
  input         io_wakeups_1_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_wakeups_1_bits_fflags_bits_uop_is_unique,
  input         io_wakeups_1_bits_fflags_bits_uop_flush_on_commit,
  input         io_wakeups_1_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_1_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_wakeups_1_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_wakeups_1_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_wakeups_1_bits_fflags_bits_uop_lrs3,
  input         io_wakeups_1_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_1_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_1_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_1_bits_fflags_bits_uop_lrs2_rtype,
  input         io_wakeups_1_bits_fflags_bits_uop_frs3_en,
  input         io_wakeups_1_bits_fflags_bits_uop_fp_val,
  input         io_wakeups_1_bits_fflags_bits_uop_fp_single,
  input         io_wakeups_1_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_wakeups_1_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_wakeups_1_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_wakeups_1_bits_fflags_bits_uop_bp_debug_if,
  input         io_wakeups_1_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_1_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_1_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_wakeups_1_bits_fflags_bits_flags,
  input  [3:0]  io_wakeups_1_bits_flagdata,
  input         io_wakeups_1_bits_fflagdata_valid,
  input         io_wakeups_1_bits_fflagdata_bits_uop_switch,
  input         io_wakeups_1_bits_fflagdata_bits_uop_switch_off,
  input         io_wakeups_1_bits_fflagdata_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_1_bits_fflagdata_bits_uop_shift,
  input  [1:0]  io_wakeups_1_bits_fflagdata_bits_uop_lrs3_rtype,
  input         io_wakeups_1_bits_fflagdata_bits_uop_rflag,
  input         io_wakeups_1_bits_fflagdata_bits_uop_wflag,
  input  [3:0]  io_wakeups_1_bits_fflagdata_bits_uop_prflag,
  input  [3:0]  io_wakeups_1_bits_fflagdata_bits_uop_pwflag,
  input         io_wakeups_1_bits_fflagdata_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_1_bits_fflagdata_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_1_bits_fflagdata_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_1_bits_fflagdata_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_1_bits_fflagdata_bits_uop_split_num,
  input  [5:0]  io_wakeups_1_bits_fflagdata_bits_uop_self_index,
  input  [5:0]  io_wakeups_1_bits_fflagdata_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_1_bits_fflagdata_bits_uop_address_num,
  input  [6:0]  io_wakeups_1_bits_fflagdata_bits_uop_uopc,
  input  [31:0] io_wakeups_1_bits_fflagdata_bits_uop_inst,
  input  [31:0] io_wakeups_1_bits_fflagdata_bits_uop_debug_inst,
  input         io_wakeups_1_bits_fflagdata_bits_uop_is_rvc,
  input  [39:0] io_wakeups_1_bits_fflagdata_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_1_bits_fflagdata_bits_uop_iq_type,
  input  [9:0]  io_wakeups_1_bits_fflagdata_bits_uop_fu_code,
  input  [3:0]  io_wakeups_1_bits_fflagdata_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_1_bits_fflagdata_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_1_bits_fflagdata_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_1_bits_fflagdata_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_1_bits_fflagdata_bits_uop_ctrl_op_fcn,
  input         io_wakeups_1_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_1_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_1_bits_fflagdata_bits_uop_ctrl_is_load,
  input         io_wakeups_1_bits_fflagdata_bits_uop_ctrl_is_sta,
  input         io_wakeups_1_bits_fflagdata_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_1_bits_fflagdata_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_1_bits_fflagdata_bits_uop_iw_state,
  input         io_wakeups_1_bits_fflagdata_bits_uop_iw_p1_poisoned,
  input         io_wakeups_1_bits_fflagdata_bits_uop_iw_p2_poisoned,
  input         io_wakeups_1_bits_fflagdata_bits_uop_is_br,
  input         io_wakeups_1_bits_fflagdata_bits_uop_is_jalr,
  input         io_wakeups_1_bits_fflagdata_bits_uop_is_jal,
  input         io_wakeups_1_bits_fflagdata_bits_uop_is_sfb,
  input  [11:0] io_wakeups_1_bits_fflagdata_bits_uop_br_mask,
  input  [3:0]  io_wakeups_1_bits_fflagdata_bits_uop_br_tag,
  input  [4:0]  io_wakeups_1_bits_fflagdata_bits_uop_ftq_idx,
  input         io_wakeups_1_bits_fflagdata_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_1_bits_fflagdata_bits_uop_pc_lob,
  input         io_wakeups_1_bits_fflagdata_bits_uop_taken,
  input  [19:0] io_wakeups_1_bits_fflagdata_bits_uop_imm_packed,
  input  [11:0] io_wakeups_1_bits_fflagdata_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_1_bits_fflagdata_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_1_bits_fflagdata_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_1_bits_fflagdata_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_1_bits_fflagdata_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_1_bits_fflagdata_bits_uop_pdst,
  input  [6:0]  io_wakeups_1_bits_fflagdata_bits_uop_prs1,
  input  [6:0]  io_wakeups_1_bits_fflagdata_bits_uop_prs2,
  input  [6:0]  io_wakeups_1_bits_fflagdata_bits_uop_prs3,
  input  [4:0]  io_wakeups_1_bits_fflagdata_bits_uop_ppred,
  input         io_wakeups_1_bits_fflagdata_bits_uop_prs1_busy,
  input         io_wakeups_1_bits_fflagdata_bits_uop_prs2_busy,
  input         io_wakeups_1_bits_fflagdata_bits_uop_prs3_busy,
  input         io_wakeups_1_bits_fflagdata_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_1_bits_fflagdata_bits_uop_stale_pdst,
  input         io_wakeups_1_bits_fflagdata_bits_uop_exception,
  input  [63:0] io_wakeups_1_bits_fflagdata_bits_uop_exc_cause,
  input         io_wakeups_1_bits_fflagdata_bits_uop_bypassable,
  input  [4:0]  io_wakeups_1_bits_fflagdata_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_1_bits_fflagdata_bits_uop_mem_size,
  input         io_wakeups_1_bits_fflagdata_bits_uop_mem_signed,
  input         io_wakeups_1_bits_fflagdata_bits_uop_is_fence,
  input         io_wakeups_1_bits_fflagdata_bits_uop_is_fencei,
  input         io_wakeups_1_bits_fflagdata_bits_uop_is_amo,
  input         io_wakeups_1_bits_fflagdata_bits_uop_uses_ldq,
  input         io_wakeups_1_bits_fflagdata_bits_uop_uses_stq,
  input         io_wakeups_1_bits_fflagdata_bits_uop_is_sys_pc2epc,
  input         io_wakeups_1_bits_fflagdata_bits_uop_is_unique,
  input         io_wakeups_1_bits_fflagdata_bits_uop_flush_on_commit,
  input         io_wakeups_1_bits_fflagdata_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_1_bits_fflagdata_bits_uop_ldst,
  input  [5:0]  io_wakeups_1_bits_fflagdata_bits_uop_lrs1,
  input  [5:0]  io_wakeups_1_bits_fflagdata_bits_uop_lrs2,
  input  [5:0]  io_wakeups_1_bits_fflagdata_bits_uop_lrs3,
  input         io_wakeups_1_bits_fflagdata_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_1_bits_fflagdata_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_1_bits_fflagdata_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_1_bits_fflagdata_bits_uop_lrs2_rtype,
  input         io_wakeups_1_bits_fflagdata_bits_uop_frs3_en,
  input         io_wakeups_1_bits_fflagdata_bits_uop_fp_val,
  input         io_wakeups_1_bits_fflagdata_bits_uop_fp_single,
  input         io_wakeups_1_bits_fflagdata_bits_uop_xcpt_pf_if,
  input         io_wakeups_1_bits_fflagdata_bits_uop_xcpt_ae_if,
  input         io_wakeups_1_bits_fflagdata_bits_uop_xcpt_ma_if,
  input         io_wakeups_1_bits_fflagdata_bits_uop_bp_debug_if,
  input         io_wakeups_1_bits_fflagdata_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_1_bits_fflagdata_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_1_bits_fflagdata_bits_uop_debug_tsrc,
  input  [31:0] io_wakeups_1_bits_fflagdata_bits_fflag,
  input         io_wakeups_2_valid,
  input         io_wakeups_2_bits_uop_switch,
  input         io_wakeups_2_bits_uop_switch_off,
  input         io_wakeups_2_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_2_bits_uop_shift,
  input  [1:0]  io_wakeups_2_bits_uop_lrs3_rtype,
  input         io_wakeups_2_bits_uop_rflag,
  input         io_wakeups_2_bits_uop_wflag,
  input  [3:0]  io_wakeups_2_bits_uop_prflag,
  input  [3:0]  io_wakeups_2_bits_uop_pwflag,
  input         io_wakeups_2_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_2_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_2_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_2_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_2_bits_uop_split_num,
  input  [5:0]  io_wakeups_2_bits_uop_self_index,
  input  [5:0]  io_wakeups_2_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_2_bits_uop_address_num,
  input  [6:0]  io_wakeups_2_bits_uop_uopc,
  input  [31:0] io_wakeups_2_bits_uop_inst,
  input  [31:0] io_wakeups_2_bits_uop_debug_inst,
  input         io_wakeups_2_bits_uop_is_rvc,
  input  [39:0] io_wakeups_2_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_2_bits_uop_iq_type,
  input  [9:0]  io_wakeups_2_bits_uop_fu_code,
  input  [3:0]  io_wakeups_2_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_2_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_2_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_2_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_2_bits_uop_ctrl_op_fcn,
  input         io_wakeups_2_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_2_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_2_bits_uop_ctrl_is_load,
  input         io_wakeups_2_bits_uop_ctrl_is_sta,
  input         io_wakeups_2_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_2_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_2_bits_uop_iw_state,
  input         io_wakeups_2_bits_uop_iw_p1_poisoned,
  input         io_wakeups_2_bits_uop_iw_p2_poisoned,
  input         io_wakeups_2_bits_uop_is_br,
  input         io_wakeups_2_bits_uop_is_jalr,
  input         io_wakeups_2_bits_uop_is_jal,
  input         io_wakeups_2_bits_uop_is_sfb,
  input  [11:0] io_wakeups_2_bits_uop_br_mask,
  input  [3:0]  io_wakeups_2_bits_uop_br_tag,
  input  [4:0]  io_wakeups_2_bits_uop_ftq_idx,
  input         io_wakeups_2_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_2_bits_uop_pc_lob,
  input         io_wakeups_2_bits_uop_taken,
  input  [19:0] io_wakeups_2_bits_uop_imm_packed,
  input  [11:0] io_wakeups_2_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_2_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_2_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_2_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_2_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_2_bits_uop_pdst,
  input  [6:0]  io_wakeups_2_bits_uop_prs1,
  input  [6:0]  io_wakeups_2_bits_uop_prs2,
  input  [6:0]  io_wakeups_2_bits_uop_prs3,
  input  [4:0]  io_wakeups_2_bits_uop_ppred,
  input         io_wakeups_2_bits_uop_prs1_busy,
  input         io_wakeups_2_bits_uop_prs2_busy,
  input         io_wakeups_2_bits_uop_prs3_busy,
  input         io_wakeups_2_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_2_bits_uop_stale_pdst,
  input         io_wakeups_2_bits_uop_exception,
  input  [63:0] io_wakeups_2_bits_uop_exc_cause,
  input         io_wakeups_2_bits_uop_bypassable,
  input  [4:0]  io_wakeups_2_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_2_bits_uop_mem_size,
  input         io_wakeups_2_bits_uop_mem_signed,
  input         io_wakeups_2_bits_uop_is_fence,
  input         io_wakeups_2_bits_uop_is_fencei,
  input         io_wakeups_2_bits_uop_is_amo,
  input         io_wakeups_2_bits_uop_uses_ldq,
  input         io_wakeups_2_bits_uop_uses_stq,
  input         io_wakeups_2_bits_uop_is_sys_pc2epc,
  input         io_wakeups_2_bits_uop_is_unique,
  input         io_wakeups_2_bits_uop_flush_on_commit,
  input         io_wakeups_2_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_2_bits_uop_ldst,
  input  [5:0]  io_wakeups_2_bits_uop_lrs1,
  input  [5:0]  io_wakeups_2_bits_uop_lrs2,
  input  [5:0]  io_wakeups_2_bits_uop_lrs3,
  input         io_wakeups_2_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_2_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_2_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_2_bits_uop_lrs2_rtype,
  input         io_wakeups_2_bits_uop_frs3_en,
  input         io_wakeups_2_bits_uop_fp_val,
  input         io_wakeups_2_bits_uop_fp_single,
  input         io_wakeups_2_bits_uop_xcpt_pf_if,
  input         io_wakeups_2_bits_uop_xcpt_ae_if,
  input         io_wakeups_2_bits_uop_xcpt_ma_if,
  input         io_wakeups_2_bits_uop_bp_debug_if,
  input         io_wakeups_2_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_2_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_2_bits_uop_debug_tsrc,
  input  [63:0] io_wakeups_2_bits_data,
  input         io_wakeups_2_bits_predicated,
  input         io_wakeups_2_bits_fflags_valid,
  input         io_wakeups_2_bits_fflags_bits_uop_switch,
  input         io_wakeups_2_bits_fflags_bits_uop_switch_off,
  input         io_wakeups_2_bits_fflags_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_2_bits_fflags_bits_uop_shift,
  input  [1:0]  io_wakeups_2_bits_fflags_bits_uop_lrs3_rtype,
  input         io_wakeups_2_bits_fflags_bits_uop_rflag,
  input         io_wakeups_2_bits_fflags_bits_uop_wflag,
  input  [3:0]  io_wakeups_2_bits_fflags_bits_uop_prflag,
  input  [3:0]  io_wakeups_2_bits_fflags_bits_uop_pwflag,
  input         io_wakeups_2_bits_fflags_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_2_bits_fflags_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_2_bits_fflags_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_2_bits_fflags_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_2_bits_fflags_bits_uop_split_num,
  input  [5:0]  io_wakeups_2_bits_fflags_bits_uop_self_index,
  input  [5:0]  io_wakeups_2_bits_fflags_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_2_bits_fflags_bits_uop_address_num,
  input  [6:0]  io_wakeups_2_bits_fflags_bits_uop_uopc,
  input  [31:0] io_wakeups_2_bits_fflags_bits_uop_inst,
  input  [31:0] io_wakeups_2_bits_fflags_bits_uop_debug_inst,
  input         io_wakeups_2_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_wakeups_2_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_2_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_wakeups_2_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_wakeups_2_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_2_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_2_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_2_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_2_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_wakeups_2_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_2_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_2_bits_fflags_bits_uop_ctrl_is_load,
  input         io_wakeups_2_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_wakeups_2_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_2_bits_fflags_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_2_bits_fflags_bits_uop_iw_state,
  input         io_wakeups_2_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_wakeups_2_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_wakeups_2_bits_fflags_bits_uop_is_br,
  input         io_wakeups_2_bits_fflags_bits_uop_is_jalr,
  input         io_wakeups_2_bits_fflags_bits_uop_is_jal,
  input         io_wakeups_2_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_wakeups_2_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_wakeups_2_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_wakeups_2_bits_fflags_bits_uop_ftq_idx,
  input         io_wakeups_2_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_2_bits_fflags_bits_uop_pc_lob,
  input         io_wakeups_2_bits_fflags_bits_uop_taken,
  input  [19:0] io_wakeups_2_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_wakeups_2_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_2_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_2_bits_fflags_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_2_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_2_bits_fflags_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_2_bits_fflags_bits_uop_pdst,
  input  [6:0]  io_wakeups_2_bits_fflags_bits_uop_prs1,
  input  [6:0]  io_wakeups_2_bits_fflags_bits_uop_prs2,
  input  [6:0]  io_wakeups_2_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_wakeups_2_bits_fflags_bits_uop_ppred,
  input         io_wakeups_2_bits_fflags_bits_uop_prs1_busy,
  input         io_wakeups_2_bits_fflags_bits_uop_prs2_busy,
  input         io_wakeups_2_bits_fflags_bits_uop_prs3_busy,
  input         io_wakeups_2_bits_fflags_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_2_bits_fflags_bits_uop_stale_pdst,
  input         io_wakeups_2_bits_fflags_bits_uop_exception,
  input  [63:0] io_wakeups_2_bits_fflags_bits_uop_exc_cause,
  input         io_wakeups_2_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_wakeups_2_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_2_bits_fflags_bits_uop_mem_size,
  input         io_wakeups_2_bits_fflags_bits_uop_mem_signed,
  input         io_wakeups_2_bits_fflags_bits_uop_is_fence,
  input         io_wakeups_2_bits_fflags_bits_uop_is_fencei,
  input         io_wakeups_2_bits_fflags_bits_uop_is_amo,
  input         io_wakeups_2_bits_fflags_bits_uop_uses_ldq,
  input         io_wakeups_2_bits_fflags_bits_uop_uses_stq,
  input         io_wakeups_2_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_wakeups_2_bits_fflags_bits_uop_is_unique,
  input         io_wakeups_2_bits_fflags_bits_uop_flush_on_commit,
  input         io_wakeups_2_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_2_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_wakeups_2_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_wakeups_2_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_wakeups_2_bits_fflags_bits_uop_lrs3,
  input         io_wakeups_2_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_2_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_2_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_2_bits_fflags_bits_uop_lrs2_rtype,
  input         io_wakeups_2_bits_fflags_bits_uop_frs3_en,
  input         io_wakeups_2_bits_fflags_bits_uop_fp_val,
  input         io_wakeups_2_bits_fflags_bits_uop_fp_single,
  input         io_wakeups_2_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_wakeups_2_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_wakeups_2_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_wakeups_2_bits_fflags_bits_uop_bp_debug_if,
  input         io_wakeups_2_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_2_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_2_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_wakeups_2_bits_fflags_bits_flags,
  input  [3:0]  io_wakeups_2_bits_flagdata,
  input         io_wakeups_2_bits_fflagdata_valid,
  input         io_wakeups_2_bits_fflagdata_bits_uop_switch,
  input         io_wakeups_2_bits_fflagdata_bits_uop_switch_off,
  input         io_wakeups_2_bits_fflagdata_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_2_bits_fflagdata_bits_uop_shift,
  input  [1:0]  io_wakeups_2_bits_fflagdata_bits_uop_lrs3_rtype,
  input         io_wakeups_2_bits_fflagdata_bits_uop_rflag,
  input         io_wakeups_2_bits_fflagdata_bits_uop_wflag,
  input  [3:0]  io_wakeups_2_bits_fflagdata_bits_uop_prflag,
  input  [3:0]  io_wakeups_2_bits_fflagdata_bits_uop_pwflag,
  input         io_wakeups_2_bits_fflagdata_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_2_bits_fflagdata_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_2_bits_fflagdata_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_2_bits_fflagdata_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_2_bits_fflagdata_bits_uop_split_num,
  input  [5:0]  io_wakeups_2_bits_fflagdata_bits_uop_self_index,
  input  [5:0]  io_wakeups_2_bits_fflagdata_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_2_bits_fflagdata_bits_uop_address_num,
  input  [6:0]  io_wakeups_2_bits_fflagdata_bits_uop_uopc,
  input  [31:0] io_wakeups_2_bits_fflagdata_bits_uop_inst,
  input  [31:0] io_wakeups_2_bits_fflagdata_bits_uop_debug_inst,
  input         io_wakeups_2_bits_fflagdata_bits_uop_is_rvc,
  input  [39:0] io_wakeups_2_bits_fflagdata_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_2_bits_fflagdata_bits_uop_iq_type,
  input  [9:0]  io_wakeups_2_bits_fflagdata_bits_uop_fu_code,
  input  [3:0]  io_wakeups_2_bits_fflagdata_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_2_bits_fflagdata_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_2_bits_fflagdata_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_2_bits_fflagdata_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_2_bits_fflagdata_bits_uop_ctrl_op_fcn,
  input         io_wakeups_2_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_2_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_2_bits_fflagdata_bits_uop_ctrl_is_load,
  input         io_wakeups_2_bits_fflagdata_bits_uop_ctrl_is_sta,
  input         io_wakeups_2_bits_fflagdata_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_2_bits_fflagdata_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_2_bits_fflagdata_bits_uop_iw_state,
  input         io_wakeups_2_bits_fflagdata_bits_uop_iw_p1_poisoned,
  input         io_wakeups_2_bits_fflagdata_bits_uop_iw_p2_poisoned,
  input         io_wakeups_2_bits_fflagdata_bits_uop_is_br,
  input         io_wakeups_2_bits_fflagdata_bits_uop_is_jalr,
  input         io_wakeups_2_bits_fflagdata_bits_uop_is_jal,
  input         io_wakeups_2_bits_fflagdata_bits_uop_is_sfb,
  input  [11:0] io_wakeups_2_bits_fflagdata_bits_uop_br_mask,
  input  [3:0]  io_wakeups_2_bits_fflagdata_bits_uop_br_tag,
  input  [4:0]  io_wakeups_2_bits_fflagdata_bits_uop_ftq_idx,
  input         io_wakeups_2_bits_fflagdata_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_2_bits_fflagdata_bits_uop_pc_lob,
  input         io_wakeups_2_bits_fflagdata_bits_uop_taken,
  input  [19:0] io_wakeups_2_bits_fflagdata_bits_uop_imm_packed,
  input  [11:0] io_wakeups_2_bits_fflagdata_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_2_bits_fflagdata_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_2_bits_fflagdata_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_2_bits_fflagdata_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_2_bits_fflagdata_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_2_bits_fflagdata_bits_uop_pdst,
  input  [6:0]  io_wakeups_2_bits_fflagdata_bits_uop_prs1,
  input  [6:0]  io_wakeups_2_bits_fflagdata_bits_uop_prs2,
  input  [6:0]  io_wakeups_2_bits_fflagdata_bits_uop_prs3,
  input  [4:0]  io_wakeups_2_bits_fflagdata_bits_uop_ppred,
  input         io_wakeups_2_bits_fflagdata_bits_uop_prs1_busy,
  input         io_wakeups_2_bits_fflagdata_bits_uop_prs2_busy,
  input         io_wakeups_2_bits_fflagdata_bits_uop_prs3_busy,
  input         io_wakeups_2_bits_fflagdata_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_2_bits_fflagdata_bits_uop_stale_pdst,
  input         io_wakeups_2_bits_fflagdata_bits_uop_exception,
  input  [63:0] io_wakeups_2_bits_fflagdata_bits_uop_exc_cause,
  input         io_wakeups_2_bits_fflagdata_bits_uop_bypassable,
  input  [4:0]  io_wakeups_2_bits_fflagdata_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_2_bits_fflagdata_bits_uop_mem_size,
  input         io_wakeups_2_bits_fflagdata_bits_uop_mem_signed,
  input         io_wakeups_2_bits_fflagdata_bits_uop_is_fence,
  input         io_wakeups_2_bits_fflagdata_bits_uop_is_fencei,
  input         io_wakeups_2_bits_fflagdata_bits_uop_is_amo,
  input         io_wakeups_2_bits_fflagdata_bits_uop_uses_ldq,
  input         io_wakeups_2_bits_fflagdata_bits_uop_uses_stq,
  input         io_wakeups_2_bits_fflagdata_bits_uop_is_sys_pc2epc,
  input         io_wakeups_2_bits_fflagdata_bits_uop_is_unique,
  input         io_wakeups_2_bits_fflagdata_bits_uop_flush_on_commit,
  input         io_wakeups_2_bits_fflagdata_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_2_bits_fflagdata_bits_uop_ldst,
  input  [5:0]  io_wakeups_2_bits_fflagdata_bits_uop_lrs1,
  input  [5:0]  io_wakeups_2_bits_fflagdata_bits_uop_lrs2,
  input  [5:0]  io_wakeups_2_bits_fflagdata_bits_uop_lrs3,
  input         io_wakeups_2_bits_fflagdata_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_2_bits_fflagdata_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_2_bits_fflagdata_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_2_bits_fflagdata_bits_uop_lrs2_rtype,
  input         io_wakeups_2_bits_fflagdata_bits_uop_frs3_en,
  input         io_wakeups_2_bits_fflagdata_bits_uop_fp_val,
  input         io_wakeups_2_bits_fflagdata_bits_uop_fp_single,
  input         io_wakeups_2_bits_fflagdata_bits_uop_xcpt_pf_if,
  input         io_wakeups_2_bits_fflagdata_bits_uop_xcpt_ae_if,
  input         io_wakeups_2_bits_fflagdata_bits_uop_xcpt_ma_if,
  input         io_wakeups_2_bits_fflagdata_bits_uop_bp_debug_if,
  input         io_wakeups_2_bits_fflagdata_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_2_bits_fflagdata_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_2_bits_fflagdata_bits_uop_debug_tsrc,
  input  [31:0] io_wakeups_2_bits_fflagdata_bits_fflag,
  input         io_wakeups_3_valid,
  input         io_wakeups_3_bits_uop_switch,
  input         io_wakeups_3_bits_uop_switch_off,
  input         io_wakeups_3_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_3_bits_uop_shift,
  input  [1:0]  io_wakeups_3_bits_uop_lrs3_rtype,
  input         io_wakeups_3_bits_uop_rflag,
  input         io_wakeups_3_bits_uop_wflag,
  input  [3:0]  io_wakeups_3_bits_uop_prflag,
  input  [3:0]  io_wakeups_3_bits_uop_pwflag,
  input         io_wakeups_3_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_3_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_3_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_3_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_3_bits_uop_split_num,
  input  [5:0]  io_wakeups_3_bits_uop_self_index,
  input  [5:0]  io_wakeups_3_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_3_bits_uop_address_num,
  input  [6:0]  io_wakeups_3_bits_uop_uopc,
  input  [31:0] io_wakeups_3_bits_uop_inst,
  input  [31:0] io_wakeups_3_bits_uop_debug_inst,
  input         io_wakeups_3_bits_uop_is_rvc,
  input  [39:0] io_wakeups_3_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_3_bits_uop_iq_type,
  input  [9:0]  io_wakeups_3_bits_uop_fu_code,
  input  [3:0]  io_wakeups_3_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_3_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_3_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_3_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_3_bits_uop_ctrl_op_fcn,
  input         io_wakeups_3_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_3_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_3_bits_uop_ctrl_is_load,
  input         io_wakeups_3_bits_uop_ctrl_is_sta,
  input         io_wakeups_3_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_3_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_3_bits_uop_iw_state,
  input         io_wakeups_3_bits_uop_iw_p1_poisoned,
  input         io_wakeups_3_bits_uop_iw_p2_poisoned,
  input         io_wakeups_3_bits_uop_is_br,
  input         io_wakeups_3_bits_uop_is_jalr,
  input         io_wakeups_3_bits_uop_is_jal,
  input         io_wakeups_3_bits_uop_is_sfb,
  input  [11:0] io_wakeups_3_bits_uop_br_mask,
  input  [3:0]  io_wakeups_3_bits_uop_br_tag,
  input  [4:0]  io_wakeups_3_bits_uop_ftq_idx,
  input         io_wakeups_3_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_3_bits_uop_pc_lob,
  input         io_wakeups_3_bits_uop_taken,
  input  [19:0] io_wakeups_3_bits_uop_imm_packed,
  input  [11:0] io_wakeups_3_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_3_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_3_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_3_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_3_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_3_bits_uop_pdst,
  input  [6:0]  io_wakeups_3_bits_uop_prs1,
  input  [6:0]  io_wakeups_3_bits_uop_prs2,
  input  [6:0]  io_wakeups_3_bits_uop_prs3,
  input  [4:0]  io_wakeups_3_bits_uop_ppred,
  input         io_wakeups_3_bits_uop_prs1_busy,
  input         io_wakeups_3_bits_uop_prs2_busy,
  input         io_wakeups_3_bits_uop_prs3_busy,
  input         io_wakeups_3_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_3_bits_uop_stale_pdst,
  input         io_wakeups_3_bits_uop_exception,
  input  [63:0] io_wakeups_3_bits_uop_exc_cause,
  input         io_wakeups_3_bits_uop_bypassable,
  input  [4:0]  io_wakeups_3_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_3_bits_uop_mem_size,
  input         io_wakeups_3_bits_uop_mem_signed,
  input         io_wakeups_3_bits_uop_is_fence,
  input         io_wakeups_3_bits_uop_is_fencei,
  input         io_wakeups_3_bits_uop_is_amo,
  input         io_wakeups_3_bits_uop_uses_ldq,
  input         io_wakeups_3_bits_uop_uses_stq,
  input         io_wakeups_3_bits_uop_is_sys_pc2epc,
  input         io_wakeups_3_bits_uop_is_unique,
  input         io_wakeups_3_bits_uop_flush_on_commit,
  input         io_wakeups_3_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_3_bits_uop_ldst,
  input  [5:0]  io_wakeups_3_bits_uop_lrs1,
  input  [5:0]  io_wakeups_3_bits_uop_lrs2,
  input  [5:0]  io_wakeups_3_bits_uop_lrs3,
  input         io_wakeups_3_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_3_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_3_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_3_bits_uop_lrs2_rtype,
  input         io_wakeups_3_bits_uop_frs3_en,
  input         io_wakeups_3_bits_uop_fp_val,
  input         io_wakeups_3_bits_uop_fp_single,
  input         io_wakeups_3_bits_uop_xcpt_pf_if,
  input         io_wakeups_3_bits_uop_xcpt_ae_if,
  input         io_wakeups_3_bits_uop_xcpt_ma_if,
  input         io_wakeups_3_bits_uop_bp_debug_if,
  input         io_wakeups_3_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_3_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_3_bits_uop_debug_tsrc,
  input  [63:0] io_wakeups_3_bits_data,
  input         io_wakeups_3_bits_predicated,
  input         io_wakeups_3_bits_fflags_valid,
  input         io_wakeups_3_bits_fflags_bits_uop_switch,
  input         io_wakeups_3_bits_fflags_bits_uop_switch_off,
  input         io_wakeups_3_bits_fflags_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_3_bits_fflags_bits_uop_shift,
  input  [1:0]  io_wakeups_3_bits_fflags_bits_uop_lrs3_rtype,
  input         io_wakeups_3_bits_fflags_bits_uop_rflag,
  input         io_wakeups_3_bits_fflags_bits_uop_wflag,
  input  [3:0]  io_wakeups_3_bits_fflags_bits_uop_prflag,
  input  [3:0]  io_wakeups_3_bits_fflags_bits_uop_pwflag,
  input         io_wakeups_3_bits_fflags_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_3_bits_fflags_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_3_bits_fflags_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_3_bits_fflags_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_3_bits_fflags_bits_uop_split_num,
  input  [5:0]  io_wakeups_3_bits_fflags_bits_uop_self_index,
  input  [5:0]  io_wakeups_3_bits_fflags_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_3_bits_fflags_bits_uop_address_num,
  input  [6:0]  io_wakeups_3_bits_fflags_bits_uop_uopc,
  input  [31:0] io_wakeups_3_bits_fflags_bits_uop_inst,
  input  [31:0] io_wakeups_3_bits_fflags_bits_uop_debug_inst,
  input         io_wakeups_3_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_wakeups_3_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_3_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_wakeups_3_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_wakeups_3_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_3_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_3_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_3_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_3_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_wakeups_3_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_3_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_3_bits_fflags_bits_uop_ctrl_is_load,
  input         io_wakeups_3_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_wakeups_3_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_3_bits_fflags_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_3_bits_fflags_bits_uop_iw_state,
  input         io_wakeups_3_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_wakeups_3_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_wakeups_3_bits_fflags_bits_uop_is_br,
  input         io_wakeups_3_bits_fflags_bits_uop_is_jalr,
  input         io_wakeups_3_bits_fflags_bits_uop_is_jal,
  input         io_wakeups_3_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_wakeups_3_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_wakeups_3_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_wakeups_3_bits_fflags_bits_uop_ftq_idx,
  input         io_wakeups_3_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_3_bits_fflags_bits_uop_pc_lob,
  input         io_wakeups_3_bits_fflags_bits_uop_taken,
  input  [19:0] io_wakeups_3_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_wakeups_3_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_3_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_3_bits_fflags_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_3_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_3_bits_fflags_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_3_bits_fflags_bits_uop_pdst,
  input  [6:0]  io_wakeups_3_bits_fflags_bits_uop_prs1,
  input  [6:0]  io_wakeups_3_bits_fflags_bits_uop_prs2,
  input  [6:0]  io_wakeups_3_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_wakeups_3_bits_fflags_bits_uop_ppred,
  input         io_wakeups_3_bits_fflags_bits_uop_prs1_busy,
  input         io_wakeups_3_bits_fflags_bits_uop_prs2_busy,
  input         io_wakeups_3_bits_fflags_bits_uop_prs3_busy,
  input         io_wakeups_3_bits_fflags_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_3_bits_fflags_bits_uop_stale_pdst,
  input         io_wakeups_3_bits_fflags_bits_uop_exception,
  input  [63:0] io_wakeups_3_bits_fflags_bits_uop_exc_cause,
  input         io_wakeups_3_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_wakeups_3_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_3_bits_fflags_bits_uop_mem_size,
  input         io_wakeups_3_bits_fflags_bits_uop_mem_signed,
  input         io_wakeups_3_bits_fflags_bits_uop_is_fence,
  input         io_wakeups_3_bits_fflags_bits_uop_is_fencei,
  input         io_wakeups_3_bits_fflags_bits_uop_is_amo,
  input         io_wakeups_3_bits_fflags_bits_uop_uses_ldq,
  input         io_wakeups_3_bits_fflags_bits_uop_uses_stq,
  input         io_wakeups_3_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_wakeups_3_bits_fflags_bits_uop_is_unique,
  input         io_wakeups_3_bits_fflags_bits_uop_flush_on_commit,
  input         io_wakeups_3_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_3_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_wakeups_3_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_wakeups_3_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_wakeups_3_bits_fflags_bits_uop_lrs3,
  input         io_wakeups_3_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_3_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_3_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_3_bits_fflags_bits_uop_lrs2_rtype,
  input         io_wakeups_3_bits_fflags_bits_uop_frs3_en,
  input         io_wakeups_3_bits_fflags_bits_uop_fp_val,
  input         io_wakeups_3_bits_fflags_bits_uop_fp_single,
  input         io_wakeups_3_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_wakeups_3_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_wakeups_3_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_wakeups_3_bits_fflags_bits_uop_bp_debug_if,
  input         io_wakeups_3_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_3_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_3_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_wakeups_3_bits_fflags_bits_flags,
  input  [3:0]  io_wakeups_3_bits_flagdata,
  input         io_wakeups_3_bits_fflagdata_valid,
  input         io_wakeups_3_bits_fflagdata_bits_uop_switch,
  input         io_wakeups_3_bits_fflagdata_bits_uop_switch_off,
  input         io_wakeups_3_bits_fflagdata_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_3_bits_fflagdata_bits_uop_shift,
  input  [1:0]  io_wakeups_3_bits_fflagdata_bits_uop_lrs3_rtype,
  input         io_wakeups_3_bits_fflagdata_bits_uop_rflag,
  input         io_wakeups_3_bits_fflagdata_bits_uop_wflag,
  input  [3:0]  io_wakeups_3_bits_fflagdata_bits_uop_prflag,
  input  [3:0]  io_wakeups_3_bits_fflagdata_bits_uop_pwflag,
  input         io_wakeups_3_bits_fflagdata_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_3_bits_fflagdata_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_3_bits_fflagdata_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_3_bits_fflagdata_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_3_bits_fflagdata_bits_uop_split_num,
  input  [5:0]  io_wakeups_3_bits_fflagdata_bits_uop_self_index,
  input  [5:0]  io_wakeups_3_bits_fflagdata_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_3_bits_fflagdata_bits_uop_address_num,
  input  [6:0]  io_wakeups_3_bits_fflagdata_bits_uop_uopc,
  input  [31:0] io_wakeups_3_bits_fflagdata_bits_uop_inst,
  input  [31:0] io_wakeups_3_bits_fflagdata_bits_uop_debug_inst,
  input         io_wakeups_3_bits_fflagdata_bits_uop_is_rvc,
  input  [39:0] io_wakeups_3_bits_fflagdata_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_3_bits_fflagdata_bits_uop_iq_type,
  input  [9:0]  io_wakeups_3_bits_fflagdata_bits_uop_fu_code,
  input  [3:0]  io_wakeups_3_bits_fflagdata_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_3_bits_fflagdata_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_3_bits_fflagdata_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_3_bits_fflagdata_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_3_bits_fflagdata_bits_uop_ctrl_op_fcn,
  input         io_wakeups_3_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_3_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_3_bits_fflagdata_bits_uop_ctrl_is_load,
  input         io_wakeups_3_bits_fflagdata_bits_uop_ctrl_is_sta,
  input         io_wakeups_3_bits_fflagdata_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_3_bits_fflagdata_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_3_bits_fflagdata_bits_uop_iw_state,
  input         io_wakeups_3_bits_fflagdata_bits_uop_iw_p1_poisoned,
  input         io_wakeups_3_bits_fflagdata_bits_uop_iw_p2_poisoned,
  input         io_wakeups_3_bits_fflagdata_bits_uop_is_br,
  input         io_wakeups_3_bits_fflagdata_bits_uop_is_jalr,
  input         io_wakeups_3_bits_fflagdata_bits_uop_is_jal,
  input         io_wakeups_3_bits_fflagdata_bits_uop_is_sfb,
  input  [11:0] io_wakeups_3_bits_fflagdata_bits_uop_br_mask,
  input  [3:0]  io_wakeups_3_bits_fflagdata_bits_uop_br_tag,
  input  [4:0]  io_wakeups_3_bits_fflagdata_bits_uop_ftq_idx,
  input         io_wakeups_3_bits_fflagdata_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_3_bits_fflagdata_bits_uop_pc_lob,
  input         io_wakeups_3_bits_fflagdata_bits_uop_taken,
  input  [19:0] io_wakeups_3_bits_fflagdata_bits_uop_imm_packed,
  input  [11:0] io_wakeups_3_bits_fflagdata_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_3_bits_fflagdata_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_3_bits_fflagdata_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_3_bits_fflagdata_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_3_bits_fflagdata_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_3_bits_fflagdata_bits_uop_pdst,
  input  [6:0]  io_wakeups_3_bits_fflagdata_bits_uop_prs1,
  input  [6:0]  io_wakeups_3_bits_fflagdata_bits_uop_prs2,
  input  [6:0]  io_wakeups_3_bits_fflagdata_bits_uop_prs3,
  input  [4:0]  io_wakeups_3_bits_fflagdata_bits_uop_ppred,
  input         io_wakeups_3_bits_fflagdata_bits_uop_prs1_busy,
  input         io_wakeups_3_bits_fflagdata_bits_uop_prs2_busy,
  input         io_wakeups_3_bits_fflagdata_bits_uop_prs3_busy,
  input         io_wakeups_3_bits_fflagdata_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_3_bits_fflagdata_bits_uop_stale_pdst,
  input         io_wakeups_3_bits_fflagdata_bits_uop_exception,
  input  [63:0] io_wakeups_3_bits_fflagdata_bits_uop_exc_cause,
  input         io_wakeups_3_bits_fflagdata_bits_uop_bypassable,
  input  [4:0]  io_wakeups_3_bits_fflagdata_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_3_bits_fflagdata_bits_uop_mem_size,
  input         io_wakeups_3_bits_fflagdata_bits_uop_mem_signed,
  input         io_wakeups_3_bits_fflagdata_bits_uop_is_fence,
  input         io_wakeups_3_bits_fflagdata_bits_uop_is_fencei,
  input         io_wakeups_3_bits_fflagdata_bits_uop_is_amo,
  input         io_wakeups_3_bits_fflagdata_bits_uop_uses_ldq,
  input         io_wakeups_3_bits_fflagdata_bits_uop_uses_stq,
  input         io_wakeups_3_bits_fflagdata_bits_uop_is_sys_pc2epc,
  input         io_wakeups_3_bits_fflagdata_bits_uop_is_unique,
  input         io_wakeups_3_bits_fflagdata_bits_uop_flush_on_commit,
  input         io_wakeups_3_bits_fflagdata_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_3_bits_fflagdata_bits_uop_ldst,
  input  [5:0]  io_wakeups_3_bits_fflagdata_bits_uop_lrs1,
  input  [5:0]  io_wakeups_3_bits_fflagdata_bits_uop_lrs2,
  input  [5:0]  io_wakeups_3_bits_fflagdata_bits_uop_lrs3,
  input         io_wakeups_3_bits_fflagdata_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_3_bits_fflagdata_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_3_bits_fflagdata_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_3_bits_fflagdata_bits_uop_lrs2_rtype,
  input         io_wakeups_3_bits_fflagdata_bits_uop_frs3_en,
  input         io_wakeups_3_bits_fflagdata_bits_uop_fp_val,
  input         io_wakeups_3_bits_fflagdata_bits_uop_fp_single,
  input         io_wakeups_3_bits_fflagdata_bits_uop_xcpt_pf_if,
  input         io_wakeups_3_bits_fflagdata_bits_uop_xcpt_ae_if,
  input         io_wakeups_3_bits_fflagdata_bits_uop_xcpt_ma_if,
  input         io_wakeups_3_bits_fflagdata_bits_uop_bp_debug_if,
  input         io_wakeups_3_bits_fflagdata_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_3_bits_fflagdata_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_3_bits_fflagdata_bits_uop_debug_tsrc,
  input  [31:0] io_wakeups_3_bits_fflagdata_bits_fflag,
  input         io_wakeups_4_valid,
  input         io_wakeups_4_bits_uop_switch,
  input         io_wakeups_4_bits_uop_switch_off,
  input         io_wakeups_4_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_4_bits_uop_shift,
  input  [1:0]  io_wakeups_4_bits_uop_lrs3_rtype,
  input         io_wakeups_4_bits_uop_rflag,
  input         io_wakeups_4_bits_uop_wflag,
  input  [3:0]  io_wakeups_4_bits_uop_prflag,
  input  [3:0]  io_wakeups_4_bits_uop_pwflag,
  input         io_wakeups_4_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_4_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_4_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_4_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_4_bits_uop_split_num,
  input  [5:0]  io_wakeups_4_bits_uop_self_index,
  input  [5:0]  io_wakeups_4_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_4_bits_uop_address_num,
  input  [6:0]  io_wakeups_4_bits_uop_uopc,
  input  [31:0] io_wakeups_4_bits_uop_inst,
  input  [31:0] io_wakeups_4_bits_uop_debug_inst,
  input         io_wakeups_4_bits_uop_is_rvc,
  input  [39:0] io_wakeups_4_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_4_bits_uop_iq_type,
  input  [9:0]  io_wakeups_4_bits_uop_fu_code,
  input  [3:0]  io_wakeups_4_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_4_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_4_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_4_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_4_bits_uop_ctrl_op_fcn,
  input         io_wakeups_4_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_4_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_4_bits_uop_ctrl_is_load,
  input         io_wakeups_4_bits_uop_ctrl_is_sta,
  input         io_wakeups_4_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_4_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_4_bits_uop_iw_state,
  input         io_wakeups_4_bits_uop_iw_p1_poisoned,
  input         io_wakeups_4_bits_uop_iw_p2_poisoned,
  input         io_wakeups_4_bits_uop_is_br,
  input         io_wakeups_4_bits_uop_is_jalr,
  input         io_wakeups_4_bits_uop_is_jal,
  input         io_wakeups_4_bits_uop_is_sfb,
  input  [11:0] io_wakeups_4_bits_uop_br_mask,
  input  [3:0]  io_wakeups_4_bits_uop_br_tag,
  input  [4:0]  io_wakeups_4_bits_uop_ftq_idx,
  input         io_wakeups_4_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_4_bits_uop_pc_lob,
  input         io_wakeups_4_bits_uop_taken,
  input  [19:0] io_wakeups_4_bits_uop_imm_packed,
  input  [11:0] io_wakeups_4_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_4_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_4_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_4_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_4_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_4_bits_uop_pdst,
  input  [6:0]  io_wakeups_4_bits_uop_prs1,
  input  [6:0]  io_wakeups_4_bits_uop_prs2,
  input  [6:0]  io_wakeups_4_bits_uop_prs3,
  input  [4:0]  io_wakeups_4_bits_uop_ppred,
  input         io_wakeups_4_bits_uop_prs1_busy,
  input         io_wakeups_4_bits_uop_prs2_busy,
  input         io_wakeups_4_bits_uop_prs3_busy,
  input         io_wakeups_4_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_4_bits_uop_stale_pdst,
  input         io_wakeups_4_bits_uop_exception,
  input  [63:0] io_wakeups_4_bits_uop_exc_cause,
  input         io_wakeups_4_bits_uop_bypassable,
  input  [4:0]  io_wakeups_4_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_4_bits_uop_mem_size,
  input         io_wakeups_4_bits_uop_mem_signed,
  input         io_wakeups_4_bits_uop_is_fence,
  input         io_wakeups_4_bits_uop_is_fencei,
  input         io_wakeups_4_bits_uop_is_amo,
  input         io_wakeups_4_bits_uop_uses_ldq,
  input         io_wakeups_4_bits_uop_uses_stq,
  input         io_wakeups_4_bits_uop_is_sys_pc2epc,
  input         io_wakeups_4_bits_uop_is_unique,
  input         io_wakeups_4_bits_uop_flush_on_commit,
  input         io_wakeups_4_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_4_bits_uop_ldst,
  input  [5:0]  io_wakeups_4_bits_uop_lrs1,
  input  [5:0]  io_wakeups_4_bits_uop_lrs2,
  input  [5:0]  io_wakeups_4_bits_uop_lrs3,
  input         io_wakeups_4_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_4_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_4_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_4_bits_uop_lrs2_rtype,
  input         io_wakeups_4_bits_uop_frs3_en,
  input         io_wakeups_4_bits_uop_fp_val,
  input         io_wakeups_4_bits_uop_fp_single,
  input         io_wakeups_4_bits_uop_xcpt_pf_if,
  input         io_wakeups_4_bits_uop_xcpt_ae_if,
  input         io_wakeups_4_bits_uop_xcpt_ma_if,
  input         io_wakeups_4_bits_uop_bp_debug_if,
  input         io_wakeups_4_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_4_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_4_bits_uop_debug_tsrc,
  input  [63:0] io_wakeups_4_bits_data,
  input         io_wakeups_4_bits_predicated,
  input         io_wakeups_4_bits_fflags_valid,
  input         io_wakeups_4_bits_fflags_bits_uop_switch,
  input         io_wakeups_4_bits_fflags_bits_uop_switch_off,
  input         io_wakeups_4_bits_fflags_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_4_bits_fflags_bits_uop_shift,
  input  [1:0]  io_wakeups_4_bits_fflags_bits_uop_lrs3_rtype,
  input         io_wakeups_4_bits_fflags_bits_uop_rflag,
  input         io_wakeups_4_bits_fflags_bits_uop_wflag,
  input  [3:0]  io_wakeups_4_bits_fflags_bits_uop_prflag,
  input  [3:0]  io_wakeups_4_bits_fflags_bits_uop_pwflag,
  input         io_wakeups_4_bits_fflags_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_4_bits_fflags_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_4_bits_fflags_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_4_bits_fflags_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_4_bits_fflags_bits_uop_split_num,
  input  [5:0]  io_wakeups_4_bits_fflags_bits_uop_self_index,
  input  [5:0]  io_wakeups_4_bits_fflags_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_4_bits_fflags_bits_uop_address_num,
  input  [6:0]  io_wakeups_4_bits_fflags_bits_uop_uopc,
  input  [31:0] io_wakeups_4_bits_fflags_bits_uop_inst,
  input  [31:0] io_wakeups_4_bits_fflags_bits_uop_debug_inst,
  input         io_wakeups_4_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_wakeups_4_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_4_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_wakeups_4_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_wakeups_4_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_4_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_4_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_4_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_4_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_wakeups_4_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_4_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_4_bits_fflags_bits_uop_ctrl_is_load,
  input         io_wakeups_4_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_wakeups_4_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_4_bits_fflags_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_4_bits_fflags_bits_uop_iw_state,
  input         io_wakeups_4_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_wakeups_4_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_wakeups_4_bits_fflags_bits_uop_is_br,
  input         io_wakeups_4_bits_fflags_bits_uop_is_jalr,
  input         io_wakeups_4_bits_fflags_bits_uop_is_jal,
  input         io_wakeups_4_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_wakeups_4_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_wakeups_4_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_wakeups_4_bits_fflags_bits_uop_ftq_idx,
  input         io_wakeups_4_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_4_bits_fflags_bits_uop_pc_lob,
  input         io_wakeups_4_bits_fflags_bits_uop_taken,
  input  [19:0] io_wakeups_4_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_wakeups_4_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_4_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_4_bits_fflags_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_4_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_4_bits_fflags_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_4_bits_fflags_bits_uop_pdst,
  input  [6:0]  io_wakeups_4_bits_fflags_bits_uop_prs1,
  input  [6:0]  io_wakeups_4_bits_fflags_bits_uop_prs2,
  input  [6:0]  io_wakeups_4_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_wakeups_4_bits_fflags_bits_uop_ppred,
  input         io_wakeups_4_bits_fflags_bits_uop_prs1_busy,
  input         io_wakeups_4_bits_fflags_bits_uop_prs2_busy,
  input         io_wakeups_4_bits_fflags_bits_uop_prs3_busy,
  input         io_wakeups_4_bits_fflags_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_4_bits_fflags_bits_uop_stale_pdst,
  input         io_wakeups_4_bits_fflags_bits_uop_exception,
  input  [63:0] io_wakeups_4_bits_fflags_bits_uop_exc_cause,
  input         io_wakeups_4_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_wakeups_4_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_4_bits_fflags_bits_uop_mem_size,
  input         io_wakeups_4_bits_fflags_bits_uop_mem_signed,
  input         io_wakeups_4_bits_fflags_bits_uop_is_fence,
  input         io_wakeups_4_bits_fflags_bits_uop_is_fencei,
  input         io_wakeups_4_bits_fflags_bits_uop_is_amo,
  input         io_wakeups_4_bits_fflags_bits_uop_uses_ldq,
  input         io_wakeups_4_bits_fflags_bits_uop_uses_stq,
  input         io_wakeups_4_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_wakeups_4_bits_fflags_bits_uop_is_unique,
  input         io_wakeups_4_bits_fflags_bits_uop_flush_on_commit,
  input         io_wakeups_4_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_4_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_wakeups_4_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_wakeups_4_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_wakeups_4_bits_fflags_bits_uop_lrs3,
  input         io_wakeups_4_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_4_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_4_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_4_bits_fflags_bits_uop_lrs2_rtype,
  input         io_wakeups_4_bits_fflags_bits_uop_frs3_en,
  input         io_wakeups_4_bits_fflags_bits_uop_fp_val,
  input         io_wakeups_4_bits_fflags_bits_uop_fp_single,
  input         io_wakeups_4_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_wakeups_4_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_wakeups_4_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_wakeups_4_bits_fflags_bits_uop_bp_debug_if,
  input         io_wakeups_4_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_4_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_4_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_wakeups_4_bits_fflags_bits_flags,
  input  [3:0]  io_wakeups_4_bits_flagdata,
  input         io_wakeups_4_bits_fflagdata_valid,
  input         io_wakeups_4_bits_fflagdata_bits_uop_switch,
  input         io_wakeups_4_bits_fflagdata_bits_uop_switch_off,
  input         io_wakeups_4_bits_fflagdata_bits_uop_is_unicore,
  input  [2:0]  io_wakeups_4_bits_fflagdata_bits_uop_shift,
  input  [1:0]  io_wakeups_4_bits_fflagdata_bits_uop_lrs3_rtype,
  input         io_wakeups_4_bits_fflagdata_bits_uop_rflag,
  input         io_wakeups_4_bits_fflagdata_bits_uop_wflag,
  input  [3:0]  io_wakeups_4_bits_fflagdata_bits_uop_prflag,
  input  [3:0]  io_wakeups_4_bits_fflagdata_bits_uop_pwflag,
  input         io_wakeups_4_bits_fflagdata_bits_uop_pflag_busy,
  input  [3:0]  io_wakeups_4_bits_fflagdata_bits_uop_stale_pflag,
  input  [3:0]  io_wakeups_4_bits_fflagdata_bits_uop_op1_sel,
  input  [3:0]  io_wakeups_4_bits_fflagdata_bits_uop_op2_sel,
  input  [5:0]  io_wakeups_4_bits_fflagdata_bits_uop_split_num,
  input  [5:0]  io_wakeups_4_bits_fflagdata_bits_uop_self_index,
  input  [5:0]  io_wakeups_4_bits_fflagdata_bits_uop_rob_inst_idx,
  input  [5:0]  io_wakeups_4_bits_fflagdata_bits_uop_address_num,
  input  [6:0]  io_wakeups_4_bits_fflagdata_bits_uop_uopc,
  input  [31:0] io_wakeups_4_bits_fflagdata_bits_uop_inst,
  input  [31:0] io_wakeups_4_bits_fflagdata_bits_uop_debug_inst,
  input         io_wakeups_4_bits_fflagdata_bits_uop_is_rvc,
  input  [39:0] io_wakeups_4_bits_fflagdata_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_4_bits_fflagdata_bits_uop_iq_type,
  input  [9:0]  io_wakeups_4_bits_fflagdata_bits_uop_fu_code,
  input  [3:0]  io_wakeups_4_bits_fflagdata_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_4_bits_fflagdata_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_4_bits_fflagdata_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_4_bits_fflagdata_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_4_bits_fflagdata_bits_uop_ctrl_op_fcn,
  input         io_wakeups_4_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_4_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_4_bits_fflagdata_bits_uop_ctrl_is_load,
  input         io_wakeups_4_bits_fflagdata_bits_uop_ctrl_is_sta,
  input         io_wakeups_4_bits_fflagdata_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_4_bits_fflagdata_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_wakeups_4_bits_fflagdata_bits_uop_iw_state,
  input         io_wakeups_4_bits_fflagdata_bits_uop_iw_p1_poisoned,
  input         io_wakeups_4_bits_fflagdata_bits_uop_iw_p2_poisoned,
  input         io_wakeups_4_bits_fflagdata_bits_uop_is_br,
  input         io_wakeups_4_bits_fflagdata_bits_uop_is_jalr,
  input         io_wakeups_4_bits_fflagdata_bits_uop_is_jal,
  input         io_wakeups_4_bits_fflagdata_bits_uop_is_sfb,
  input  [11:0] io_wakeups_4_bits_fflagdata_bits_uop_br_mask,
  input  [3:0]  io_wakeups_4_bits_fflagdata_bits_uop_br_tag,
  input  [4:0]  io_wakeups_4_bits_fflagdata_bits_uop_ftq_idx,
  input         io_wakeups_4_bits_fflagdata_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_4_bits_fflagdata_bits_uop_pc_lob,
  input         io_wakeups_4_bits_fflagdata_bits_uop_taken,
  input  [19:0] io_wakeups_4_bits_fflagdata_bits_uop_imm_packed,
  input  [11:0] io_wakeups_4_bits_fflagdata_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_4_bits_fflagdata_bits_uop_rob_idx,
  input  [4:0]  io_wakeups_4_bits_fflagdata_bits_uop_ldq_idx,
  input  [4:0]  io_wakeups_4_bits_fflagdata_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_4_bits_fflagdata_bits_uop_rxq_idx,
  input  [6:0]  io_wakeups_4_bits_fflagdata_bits_uop_pdst,
  input  [6:0]  io_wakeups_4_bits_fflagdata_bits_uop_prs1,
  input  [6:0]  io_wakeups_4_bits_fflagdata_bits_uop_prs2,
  input  [6:0]  io_wakeups_4_bits_fflagdata_bits_uop_prs3,
  input  [4:0]  io_wakeups_4_bits_fflagdata_bits_uop_ppred,
  input         io_wakeups_4_bits_fflagdata_bits_uop_prs1_busy,
  input         io_wakeups_4_bits_fflagdata_bits_uop_prs2_busy,
  input         io_wakeups_4_bits_fflagdata_bits_uop_prs3_busy,
  input         io_wakeups_4_bits_fflagdata_bits_uop_ppred_busy,
  input  [6:0]  io_wakeups_4_bits_fflagdata_bits_uop_stale_pdst,
  input         io_wakeups_4_bits_fflagdata_bits_uop_exception,
  input  [63:0] io_wakeups_4_bits_fflagdata_bits_uop_exc_cause,
  input         io_wakeups_4_bits_fflagdata_bits_uop_bypassable,
  input  [4:0]  io_wakeups_4_bits_fflagdata_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_4_bits_fflagdata_bits_uop_mem_size,
  input         io_wakeups_4_bits_fflagdata_bits_uop_mem_signed,
  input         io_wakeups_4_bits_fflagdata_bits_uop_is_fence,
  input         io_wakeups_4_bits_fflagdata_bits_uop_is_fencei,
  input         io_wakeups_4_bits_fflagdata_bits_uop_is_amo,
  input         io_wakeups_4_bits_fflagdata_bits_uop_uses_ldq,
  input         io_wakeups_4_bits_fflagdata_bits_uop_uses_stq,
  input         io_wakeups_4_bits_fflagdata_bits_uop_is_sys_pc2epc,
  input         io_wakeups_4_bits_fflagdata_bits_uop_is_unique,
  input         io_wakeups_4_bits_fflagdata_bits_uop_flush_on_commit,
  input         io_wakeups_4_bits_fflagdata_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_4_bits_fflagdata_bits_uop_ldst,
  input  [5:0]  io_wakeups_4_bits_fflagdata_bits_uop_lrs1,
  input  [5:0]  io_wakeups_4_bits_fflagdata_bits_uop_lrs2,
  input  [5:0]  io_wakeups_4_bits_fflagdata_bits_uop_lrs3,
  input         io_wakeups_4_bits_fflagdata_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_4_bits_fflagdata_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_4_bits_fflagdata_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_4_bits_fflagdata_bits_uop_lrs2_rtype,
  input         io_wakeups_4_bits_fflagdata_bits_uop_frs3_en,
  input         io_wakeups_4_bits_fflagdata_bits_uop_fp_val,
  input         io_wakeups_4_bits_fflagdata_bits_uop_fp_single,
  input         io_wakeups_4_bits_fflagdata_bits_uop_xcpt_pf_if,
  input         io_wakeups_4_bits_fflagdata_bits_uop_xcpt_ae_if,
  input         io_wakeups_4_bits_fflagdata_bits_uop_xcpt_ma_if,
  input         io_wakeups_4_bits_fflagdata_bits_uop_bp_debug_if,
  input         io_wakeups_4_bits_fflagdata_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_4_bits_fflagdata_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_4_bits_fflagdata_bits_uop_debug_tsrc,
  input  [31:0] io_wakeups_4_bits_fflagdata_bits_fflag,
  input         io_com_valids_0,
  input         io_com_valids_1,
  input         io_com_uops_0_switch,
  input         io_com_uops_0_switch_off,
  input         io_com_uops_0_is_unicore,
  input  [2:0]  io_com_uops_0_shift,
  input  [1:0]  io_com_uops_0_lrs3_rtype,
  input         io_com_uops_0_rflag,
  input         io_com_uops_0_wflag,
  input  [3:0]  io_com_uops_0_prflag,
  input  [3:0]  io_com_uops_0_pwflag,
  input         io_com_uops_0_pflag_busy,
  input  [3:0]  io_com_uops_0_stale_pflag,
  input  [3:0]  io_com_uops_0_op1_sel,
  input  [3:0]  io_com_uops_0_op2_sel,
  input  [5:0]  io_com_uops_0_split_num,
  input  [5:0]  io_com_uops_0_self_index,
  input  [5:0]  io_com_uops_0_rob_inst_idx,
  input  [5:0]  io_com_uops_0_address_num,
  input  [6:0]  io_com_uops_0_uopc,
  input  [31:0] io_com_uops_0_inst,
  input  [31:0] io_com_uops_0_debug_inst,
  input         io_com_uops_0_is_rvc,
  input  [39:0] io_com_uops_0_debug_pc,
  input  [2:0]  io_com_uops_0_iq_type,
  input  [9:0]  io_com_uops_0_fu_code,
  input  [3:0]  io_com_uops_0_ctrl_br_type,
  input  [1:0]  io_com_uops_0_ctrl_op1_sel,
  input  [2:0]  io_com_uops_0_ctrl_op2_sel,
  input  [2:0]  io_com_uops_0_ctrl_imm_sel,
  input  [3:0]  io_com_uops_0_ctrl_op_fcn,
  input         io_com_uops_0_ctrl_fcn_dw,
  input  [2:0]  io_com_uops_0_ctrl_csr_cmd,
  input         io_com_uops_0_ctrl_is_load,
  input         io_com_uops_0_ctrl_is_sta,
  input         io_com_uops_0_ctrl_is_std,
  input  [1:0]  io_com_uops_0_ctrl_op3_sel,
  input  [1:0]  io_com_uops_0_iw_state,
  input         io_com_uops_0_iw_p1_poisoned,
  input         io_com_uops_0_iw_p2_poisoned,
  input         io_com_uops_0_is_br,
  input         io_com_uops_0_is_jalr,
  input         io_com_uops_0_is_jal,
  input         io_com_uops_0_is_sfb,
  input  [11:0] io_com_uops_0_br_mask,
  input  [3:0]  io_com_uops_0_br_tag,
  input  [4:0]  io_com_uops_0_ftq_idx,
  input         io_com_uops_0_edge_inst,
  input  [5:0]  io_com_uops_0_pc_lob,
  input         io_com_uops_0_taken,
  input  [19:0] io_com_uops_0_imm_packed,
  input  [11:0] io_com_uops_0_csr_addr,
  input  [5:0]  io_com_uops_0_rob_idx,
  input  [4:0]  io_com_uops_0_ldq_idx,
  input  [4:0]  io_com_uops_0_stq_idx,
  input  [1:0]  io_com_uops_0_rxq_idx,
  input  [6:0]  io_com_uops_0_pdst,
  input  [6:0]  io_com_uops_0_prs1,
  input  [6:0]  io_com_uops_0_prs2,
  input  [6:0]  io_com_uops_0_prs3,
  input  [4:0]  io_com_uops_0_ppred,
  input         io_com_uops_0_prs1_busy,
  input         io_com_uops_0_prs2_busy,
  input         io_com_uops_0_prs3_busy,
  input         io_com_uops_0_ppred_busy,
  input  [6:0]  io_com_uops_0_stale_pdst,
  input         io_com_uops_0_exception,
  input  [63:0] io_com_uops_0_exc_cause,
  input         io_com_uops_0_bypassable,
  input  [4:0]  io_com_uops_0_mem_cmd,
  input  [1:0]  io_com_uops_0_mem_size,
  input         io_com_uops_0_mem_signed,
  input         io_com_uops_0_is_fence,
  input         io_com_uops_0_is_fencei,
  input         io_com_uops_0_is_amo,
  input         io_com_uops_0_uses_ldq,
  input         io_com_uops_0_uses_stq,
  input         io_com_uops_0_is_sys_pc2epc,
  input         io_com_uops_0_is_unique,
  input         io_com_uops_0_flush_on_commit,
  input         io_com_uops_0_ldst_is_rs1,
  input  [5:0]  io_com_uops_0_ldst,
  input  [5:0]  io_com_uops_0_lrs1,
  input  [5:0]  io_com_uops_0_lrs2,
  input  [5:0]  io_com_uops_0_lrs3,
  input         io_com_uops_0_ldst_val,
  input  [1:0]  io_com_uops_0_dst_rtype,
  input  [1:0]  io_com_uops_0_lrs1_rtype,
  input  [1:0]  io_com_uops_0_lrs2_rtype,
  input         io_com_uops_0_frs3_en,
  input         io_com_uops_0_fp_val,
  input         io_com_uops_0_fp_single,
  input         io_com_uops_0_xcpt_pf_if,
  input         io_com_uops_0_xcpt_ae_if,
  input         io_com_uops_0_xcpt_ma_if,
  input         io_com_uops_0_bp_debug_if,
  input         io_com_uops_0_bp_xcpt_if,
  input  [1:0]  io_com_uops_0_debug_fsrc,
  input  [1:0]  io_com_uops_0_debug_tsrc,
  input         io_com_uops_1_switch,
  input         io_com_uops_1_switch_off,
  input         io_com_uops_1_is_unicore,
  input  [2:0]  io_com_uops_1_shift,
  input  [1:0]  io_com_uops_1_lrs3_rtype,
  input         io_com_uops_1_rflag,
  input         io_com_uops_1_wflag,
  input  [3:0]  io_com_uops_1_prflag,
  input  [3:0]  io_com_uops_1_pwflag,
  input         io_com_uops_1_pflag_busy,
  input  [3:0]  io_com_uops_1_stale_pflag,
  input  [3:0]  io_com_uops_1_op1_sel,
  input  [3:0]  io_com_uops_1_op2_sel,
  input  [5:0]  io_com_uops_1_split_num,
  input  [5:0]  io_com_uops_1_self_index,
  input  [5:0]  io_com_uops_1_rob_inst_idx,
  input  [5:0]  io_com_uops_1_address_num,
  input  [6:0]  io_com_uops_1_uopc,
  input  [31:0] io_com_uops_1_inst,
  input  [31:0] io_com_uops_1_debug_inst,
  input         io_com_uops_1_is_rvc,
  input  [39:0] io_com_uops_1_debug_pc,
  input  [2:0]  io_com_uops_1_iq_type,
  input  [9:0]  io_com_uops_1_fu_code,
  input  [3:0]  io_com_uops_1_ctrl_br_type,
  input  [1:0]  io_com_uops_1_ctrl_op1_sel,
  input  [2:0]  io_com_uops_1_ctrl_op2_sel,
  input  [2:0]  io_com_uops_1_ctrl_imm_sel,
  input  [3:0]  io_com_uops_1_ctrl_op_fcn,
  input         io_com_uops_1_ctrl_fcn_dw,
  input  [2:0]  io_com_uops_1_ctrl_csr_cmd,
  input         io_com_uops_1_ctrl_is_load,
  input         io_com_uops_1_ctrl_is_sta,
  input         io_com_uops_1_ctrl_is_std,
  input  [1:0]  io_com_uops_1_ctrl_op3_sel,
  input  [1:0]  io_com_uops_1_iw_state,
  input         io_com_uops_1_iw_p1_poisoned,
  input         io_com_uops_1_iw_p2_poisoned,
  input         io_com_uops_1_is_br,
  input         io_com_uops_1_is_jalr,
  input         io_com_uops_1_is_jal,
  input         io_com_uops_1_is_sfb,
  input  [11:0] io_com_uops_1_br_mask,
  input  [3:0]  io_com_uops_1_br_tag,
  input  [4:0]  io_com_uops_1_ftq_idx,
  input         io_com_uops_1_edge_inst,
  input  [5:0]  io_com_uops_1_pc_lob,
  input         io_com_uops_1_taken,
  input  [19:0] io_com_uops_1_imm_packed,
  input  [11:0] io_com_uops_1_csr_addr,
  input  [5:0]  io_com_uops_1_rob_idx,
  input  [4:0]  io_com_uops_1_ldq_idx,
  input  [4:0]  io_com_uops_1_stq_idx,
  input  [1:0]  io_com_uops_1_rxq_idx,
  input  [6:0]  io_com_uops_1_pdst,
  input  [6:0]  io_com_uops_1_prs1,
  input  [6:0]  io_com_uops_1_prs2,
  input  [6:0]  io_com_uops_1_prs3,
  input  [4:0]  io_com_uops_1_ppred,
  input         io_com_uops_1_prs1_busy,
  input         io_com_uops_1_prs2_busy,
  input         io_com_uops_1_prs3_busy,
  input         io_com_uops_1_ppred_busy,
  input  [6:0]  io_com_uops_1_stale_pdst,
  input         io_com_uops_1_exception,
  input  [63:0] io_com_uops_1_exc_cause,
  input         io_com_uops_1_bypassable,
  input  [4:0]  io_com_uops_1_mem_cmd,
  input  [1:0]  io_com_uops_1_mem_size,
  input         io_com_uops_1_mem_signed,
  input         io_com_uops_1_is_fence,
  input         io_com_uops_1_is_fencei,
  input         io_com_uops_1_is_amo,
  input         io_com_uops_1_uses_ldq,
  input         io_com_uops_1_uses_stq,
  input         io_com_uops_1_is_sys_pc2epc,
  input         io_com_uops_1_is_unique,
  input         io_com_uops_1_flush_on_commit,
  input         io_com_uops_1_ldst_is_rs1,
  input  [5:0]  io_com_uops_1_ldst,
  input  [5:0]  io_com_uops_1_lrs1,
  input  [5:0]  io_com_uops_1_lrs2,
  input  [5:0]  io_com_uops_1_lrs3,
  input         io_com_uops_1_ldst_val,
  input  [1:0]  io_com_uops_1_dst_rtype,
  input  [1:0]  io_com_uops_1_lrs1_rtype,
  input  [1:0]  io_com_uops_1_lrs2_rtype,
  input         io_com_uops_1_frs3_en,
  input         io_com_uops_1_fp_val,
  input         io_com_uops_1_fp_single,
  input         io_com_uops_1_xcpt_pf_if,
  input         io_com_uops_1_xcpt_ae_if,
  input         io_com_uops_1_xcpt_ma_if,
  input         io_com_uops_1_bp_debug_if,
  input         io_com_uops_1_bp_xcpt_if,
  input  [1:0]  io_com_uops_1_debug_fsrc,
  input  [1:0]  io_com_uops_1_debug_tsrc,
  input         io_rbk_valids_0,
  input         io_rbk_valids_1,
  input         io_rollback,
  input         io_debug_rob_empty,
  output [79:0] io_debug_freelist,
  output [79:0] io_debug_isprlist,
  output [79:0] io_debug_busytable,
  input         io_is_unicore
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
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [31:0] _RAND_23;
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
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
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
  reg [63:0] _RAND_62;
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
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
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
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
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
  reg [63:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
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
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [63:0] _RAND_159;
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
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
`endif // RANDOMIZE_REG_INIT
  wire  maptable_clock; // @[rename-stage.scala 217:24]
  wire  maptable_reset; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_map_reqs_0_lrs1; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_map_reqs_0_lrs2; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_map_reqs_0_lrs3; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_map_reqs_0_ldst; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_map_reqs_1_lrs1; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_map_reqs_1_lrs2; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_map_reqs_1_lrs3; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_map_reqs_1_ldst; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_map_resps_0_prs1; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_map_resps_0_prs2; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_map_resps_0_prs3; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_map_resps_0_stale_pdst; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_map_resps_1_prs1; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_map_resps_1_prs2; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_map_resps_1_prs3; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_map_resps_1_stale_pdst; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_remap_reqs_0_ldst; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_remap_reqs_0_pdst; // @[rename-stage.scala 217:24]
  wire  maptable_io_remap_reqs_0_valid; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_remap_reqs_1_ldst; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_remap_reqs_1_pdst; // @[rename-stage.scala 217:24]
  wire  maptable_io_remap_reqs_1_valid; // @[rename-stage.scala 217:24]
  wire  maptable_io_ren_br_tags_0_valid; // @[rename-stage.scala 217:24]
  wire [3:0] maptable_io_ren_br_tags_0_bits; // @[rename-stage.scala 217:24]
  wire  maptable_io_ren_br_tags_1_valid; // @[rename-stage.scala 217:24]
  wire [3:0] maptable_io_ren_br_tags_1_bits; // @[rename-stage.scala 217:24]
  wire [11:0] maptable_io_brupdate_b1_resolve_mask; // @[rename-stage.scala 217:24]
  wire [11:0] maptable_io_brupdate_b1_mispredict_mask; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_switch; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_switch_off; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_is_unicore; // @[rename-stage.scala 217:24]
  wire [2:0] maptable_io_brupdate_b2_uop_shift; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_uop_lrs3_rtype; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_rflag; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_wflag; // @[rename-stage.scala 217:24]
  wire [3:0] maptable_io_brupdate_b2_uop_prflag; // @[rename-stage.scala 217:24]
  wire [3:0] maptable_io_brupdate_b2_uop_pwflag; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_pflag_busy; // @[rename-stage.scala 217:24]
  wire [3:0] maptable_io_brupdate_b2_uop_stale_pflag; // @[rename-stage.scala 217:24]
  wire [3:0] maptable_io_brupdate_b2_uop_op1_sel; // @[rename-stage.scala 217:24]
  wire [3:0] maptable_io_brupdate_b2_uop_op2_sel; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_brupdate_b2_uop_split_num; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_brupdate_b2_uop_self_index; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_brupdate_b2_uop_rob_inst_idx; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_brupdate_b2_uop_address_num; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_brupdate_b2_uop_uopc; // @[rename-stage.scala 217:24]
  wire [31:0] maptable_io_brupdate_b2_uop_inst; // @[rename-stage.scala 217:24]
  wire [31:0] maptable_io_brupdate_b2_uop_debug_inst; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_is_rvc; // @[rename-stage.scala 217:24]
  wire [39:0] maptable_io_brupdate_b2_uop_debug_pc; // @[rename-stage.scala 217:24]
  wire [2:0] maptable_io_brupdate_b2_uop_iq_type; // @[rename-stage.scala 217:24]
  wire [9:0] maptable_io_brupdate_b2_uop_fu_code; // @[rename-stage.scala 217:24]
  wire [3:0] maptable_io_brupdate_b2_uop_ctrl_br_type; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_uop_ctrl_op1_sel; // @[rename-stage.scala 217:24]
  wire [2:0] maptable_io_brupdate_b2_uop_ctrl_op2_sel; // @[rename-stage.scala 217:24]
  wire [2:0] maptable_io_brupdate_b2_uop_ctrl_imm_sel; // @[rename-stage.scala 217:24]
  wire [3:0] maptable_io_brupdate_b2_uop_ctrl_op_fcn; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_ctrl_fcn_dw; // @[rename-stage.scala 217:24]
  wire [2:0] maptable_io_brupdate_b2_uop_ctrl_csr_cmd; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_ctrl_is_load; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_ctrl_is_sta; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_ctrl_is_std; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_uop_ctrl_op3_sel; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_uop_iw_state; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_iw_p1_poisoned; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_iw_p2_poisoned; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_is_br; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_is_jalr; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_is_jal; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_is_sfb; // @[rename-stage.scala 217:24]
  wire [11:0] maptable_io_brupdate_b2_uop_br_mask; // @[rename-stage.scala 217:24]
  wire [3:0] maptable_io_brupdate_b2_uop_br_tag; // @[rename-stage.scala 217:24]
  wire [4:0] maptable_io_brupdate_b2_uop_ftq_idx; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_edge_inst; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_brupdate_b2_uop_pc_lob; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_taken; // @[rename-stage.scala 217:24]
  wire [19:0] maptable_io_brupdate_b2_uop_imm_packed; // @[rename-stage.scala 217:24]
  wire [11:0] maptable_io_brupdate_b2_uop_csr_addr; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_brupdate_b2_uop_rob_idx; // @[rename-stage.scala 217:24]
  wire [4:0] maptable_io_brupdate_b2_uop_ldq_idx; // @[rename-stage.scala 217:24]
  wire [4:0] maptable_io_brupdate_b2_uop_stq_idx; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_uop_rxq_idx; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_brupdate_b2_uop_pdst; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_brupdate_b2_uop_prs1; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_brupdate_b2_uop_prs2; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_brupdate_b2_uop_prs3; // @[rename-stage.scala 217:24]
  wire [4:0] maptable_io_brupdate_b2_uop_ppred; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_prs1_busy; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_prs2_busy; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_prs3_busy; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_ppred_busy; // @[rename-stage.scala 217:24]
  wire [6:0] maptable_io_brupdate_b2_uop_stale_pdst; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_exception; // @[rename-stage.scala 217:24]
  wire [63:0] maptable_io_brupdate_b2_uop_exc_cause; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_bypassable; // @[rename-stage.scala 217:24]
  wire [4:0] maptable_io_brupdate_b2_uop_mem_cmd; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_uop_mem_size; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_mem_signed; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_is_fence; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_is_fencei; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_is_amo; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_uses_ldq; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_uses_stq; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_is_sys_pc2epc; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_is_unique; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_flush_on_commit; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_ldst_is_rs1; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_brupdate_b2_uop_ldst; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_brupdate_b2_uop_lrs1; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_brupdate_b2_uop_lrs2; // @[rename-stage.scala 217:24]
  wire [5:0] maptable_io_brupdate_b2_uop_lrs3; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_ldst_val; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_uop_dst_rtype; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_uop_lrs1_rtype; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_uop_lrs2_rtype; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_frs3_en; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_fp_val; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_fp_single; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_xcpt_pf_if; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_xcpt_ae_if; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_xcpt_ma_if; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_bp_debug_if; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_uop_bp_xcpt_if; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_uop_debug_fsrc; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_uop_debug_tsrc; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_valid; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_mispredict; // @[rename-stage.scala 217:24]
  wire  maptable_io_brupdate_b2_taken; // @[rename-stage.scala 217:24]
  wire [2:0] maptable_io_brupdate_b2_cfi_type; // @[rename-stage.scala 217:24]
  wire [1:0] maptable_io_brupdate_b2_pc_sel; // @[rename-stage.scala 217:24]
  wire [39:0] maptable_io_brupdate_b2_jalr_target; // @[rename-stage.scala 217:24]
  wire [31:0] maptable_io_brupdate_b2_target_offset; // @[rename-stage.scala 217:24]
  wire  maptable_io_rollback; // @[rename-stage.scala 217:24]
  wire  maptable_io_is_unicore; // @[rename-stage.scala 217:24]
  wire  freelist_clock; // @[rename-stage.scala 219:24]
  wire  freelist_reset; // @[rename-stage.scala 219:24]
  wire  freelist_io_reqs_0; // @[rename-stage.scala 219:24]
  wire  freelist_io_reqs_1; // @[rename-stage.scala 219:24]
  wire  freelist_io_alloc_pregs_0_valid; // @[rename-stage.scala 219:24]
  wire [6:0] freelist_io_alloc_pregs_0_bits; // @[rename-stage.scala 219:24]
  wire  freelist_io_alloc_pregs_1_valid; // @[rename-stage.scala 219:24]
  wire [6:0] freelist_io_alloc_pregs_1_bits; // @[rename-stage.scala 219:24]
  wire  freelist_io_dealloc_pregs_0_valid; // @[rename-stage.scala 219:24]
  wire [6:0] freelist_io_dealloc_pregs_0_bits; // @[rename-stage.scala 219:24]
  wire  freelist_io_dealloc_pregs_1_valid; // @[rename-stage.scala 219:24]
  wire [6:0] freelist_io_dealloc_pregs_1_bits; // @[rename-stage.scala 219:24]
  wire  freelist_io_ren_br_tags_0_valid; // @[rename-stage.scala 219:24]
  wire [3:0] freelist_io_ren_br_tags_0_bits; // @[rename-stage.scala 219:24]
  wire  freelist_io_ren_br_tags_1_valid; // @[rename-stage.scala 219:24]
  wire [3:0] freelist_io_ren_br_tags_1_bits; // @[rename-stage.scala 219:24]
  wire [11:0] freelist_io_brupdate_b1_resolve_mask; // @[rename-stage.scala 219:24]
  wire [11:0] freelist_io_brupdate_b1_mispredict_mask; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_switch; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_switch_off; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_is_unicore; // @[rename-stage.scala 219:24]
  wire [2:0] freelist_io_brupdate_b2_uop_shift; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_uop_lrs3_rtype; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_rflag; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_wflag; // @[rename-stage.scala 219:24]
  wire [3:0] freelist_io_brupdate_b2_uop_prflag; // @[rename-stage.scala 219:24]
  wire [3:0] freelist_io_brupdate_b2_uop_pwflag; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_pflag_busy; // @[rename-stage.scala 219:24]
  wire [3:0] freelist_io_brupdate_b2_uop_stale_pflag; // @[rename-stage.scala 219:24]
  wire [3:0] freelist_io_brupdate_b2_uop_op1_sel; // @[rename-stage.scala 219:24]
  wire [3:0] freelist_io_brupdate_b2_uop_op2_sel; // @[rename-stage.scala 219:24]
  wire [5:0] freelist_io_brupdate_b2_uop_split_num; // @[rename-stage.scala 219:24]
  wire [5:0] freelist_io_brupdate_b2_uop_self_index; // @[rename-stage.scala 219:24]
  wire [5:0] freelist_io_brupdate_b2_uop_rob_inst_idx; // @[rename-stage.scala 219:24]
  wire [5:0] freelist_io_brupdate_b2_uop_address_num; // @[rename-stage.scala 219:24]
  wire [6:0] freelist_io_brupdate_b2_uop_uopc; // @[rename-stage.scala 219:24]
  wire [31:0] freelist_io_brupdate_b2_uop_inst; // @[rename-stage.scala 219:24]
  wire [31:0] freelist_io_brupdate_b2_uop_debug_inst; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_is_rvc; // @[rename-stage.scala 219:24]
  wire [39:0] freelist_io_brupdate_b2_uop_debug_pc; // @[rename-stage.scala 219:24]
  wire [2:0] freelist_io_brupdate_b2_uop_iq_type; // @[rename-stage.scala 219:24]
  wire [9:0] freelist_io_brupdate_b2_uop_fu_code; // @[rename-stage.scala 219:24]
  wire [3:0] freelist_io_brupdate_b2_uop_ctrl_br_type; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_uop_ctrl_op1_sel; // @[rename-stage.scala 219:24]
  wire [2:0] freelist_io_brupdate_b2_uop_ctrl_op2_sel; // @[rename-stage.scala 219:24]
  wire [2:0] freelist_io_brupdate_b2_uop_ctrl_imm_sel; // @[rename-stage.scala 219:24]
  wire [3:0] freelist_io_brupdate_b2_uop_ctrl_op_fcn; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_ctrl_fcn_dw; // @[rename-stage.scala 219:24]
  wire [2:0] freelist_io_brupdate_b2_uop_ctrl_csr_cmd; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_ctrl_is_load; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_ctrl_is_sta; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_ctrl_is_std; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_uop_ctrl_op3_sel; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_uop_iw_state; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_iw_p1_poisoned; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_iw_p2_poisoned; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_is_br; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_is_jalr; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_is_jal; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_is_sfb; // @[rename-stage.scala 219:24]
  wire [11:0] freelist_io_brupdate_b2_uop_br_mask; // @[rename-stage.scala 219:24]
  wire [3:0] freelist_io_brupdate_b2_uop_br_tag; // @[rename-stage.scala 219:24]
  wire [4:0] freelist_io_brupdate_b2_uop_ftq_idx; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_edge_inst; // @[rename-stage.scala 219:24]
  wire [5:0] freelist_io_brupdate_b2_uop_pc_lob; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_taken; // @[rename-stage.scala 219:24]
  wire [19:0] freelist_io_brupdate_b2_uop_imm_packed; // @[rename-stage.scala 219:24]
  wire [11:0] freelist_io_brupdate_b2_uop_csr_addr; // @[rename-stage.scala 219:24]
  wire [5:0] freelist_io_brupdate_b2_uop_rob_idx; // @[rename-stage.scala 219:24]
  wire [4:0] freelist_io_brupdate_b2_uop_ldq_idx; // @[rename-stage.scala 219:24]
  wire [4:0] freelist_io_brupdate_b2_uop_stq_idx; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_uop_rxq_idx; // @[rename-stage.scala 219:24]
  wire [6:0] freelist_io_brupdate_b2_uop_pdst; // @[rename-stage.scala 219:24]
  wire [6:0] freelist_io_brupdate_b2_uop_prs1; // @[rename-stage.scala 219:24]
  wire [6:0] freelist_io_brupdate_b2_uop_prs2; // @[rename-stage.scala 219:24]
  wire [6:0] freelist_io_brupdate_b2_uop_prs3; // @[rename-stage.scala 219:24]
  wire [4:0] freelist_io_brupdate_b2_uop_ppred; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_prs1_busy; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_prs2_busy; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_prs3_busy; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_ppred_busy; // @[rename-stage.scala 219:24]
  wire [6:0] freelist_io_brupdate_b2_uop_stale_pdst; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_exception; // @[rename-stage.scala 219:24]
  wire [63:0] freelist_io_brupdate_b2_uop_exc_cause; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_bypassable; // @[rename-stage.scala 219:24]
  wire [4:0] freelist_io_brupdate_b2_uop_mem_cmd; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_uop_mem_size; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_mem_signed; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_is_fence; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_is_fencei; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_is_amo; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_uses_ldq; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_uses_stq; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_is_sys_pc2epc; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_is_unique; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_flush_on_commit; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_ldst_is_rs1; // @[rename-stage.scala 219:24]
  wire [5:0] freelist_io_brupdate_b2_uop_ldst; // @[rename-stage.scala 219:24]
  wire [5:0] freelist_io_brupdate_b2_uop_lrs1; // @[rename-stage.scala 219:24]
  wire [5:0] freelist_io_brupdate_b2_uop_lrs2; // @[rename-stage.scala 219:24]
  wire [5:0] freelist_io_brupdate_b2_uop_lrs3; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_ldst_val; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_uop_dst_rtype; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_uop_lrs1_rtype; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_uop_lrs2_rtype; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_frs3_en; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_fp_val; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_fp_single; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_xcpt_pf_if; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_xcpt_ae_if; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_xcpt_ma_if; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_bp_debug_if; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_uop_bp_xcpt_if; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_uop_debug_fsrc; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_uop_debug_tsrc; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_valid; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_mispredict; // @[rename-stage.scala 219:24]
  wire  freelist_io_brupdate_b2_taken; // @[rename-stage.scala 219:24]
  wire [2:0] freelist_io_brupdate_b2_cfi_type; // @[rename-stage.scala 219:24]
  wire [1:0] freelist_io_brupdate_b2_pc_sel; // @[rename-stage.scala 219:24]
  wire [39:0] freelist_io_brupdate_b2_jalr_target; // @[rename-stage.scala 219:24]
  wire [31:0] freelist_io_brupdate_b2_target_offset; // @[rename-stage.scala 219:24]
  wire  freelist_io_is_print; // @[rename-stage.scala 219:24]
  wire  freelist_io_debug_pipeline_empty; // @[rename-stage.scala 219:24]
  wire [79:0] freelist_io_debug_freelist; // @[rename-stage.scala 219:24]
  wire [79:0] freelist_io_debug_isprlist; // @[rename-stage.scala 219:24]
  wire  busytable_clock; // @[rename-stage.scala 220:25]
  wire  busytable_reset; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_switch; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_switch_off; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_is_unicore; // @[rename-stage.scala 220:25]
  wire [2:0] busytable_io_ren_uops_0_shift; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_0_lrs3_rtype; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_rflag; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_wflag; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_0_prflag; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_0_pwflag; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_pflag_busy; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_0_stale_pflag; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_0_op1_sel; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_0_op2_sel; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_0_split_num; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_0_self_index; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_0_rob_inst_idx; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_0_address_num; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_0_uopc; // @[rename-stage.scala 220:25]
  wire [31:0] busytable_io_ren_uops_0_inst; // @[rename-stage.scala 220:25]
  wire [31:0] busytable_io_ren_uops_0_debug_inst; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_is_rvc; // @[rename-stage.scala 220:25]
  wire [39:0] busytable_io_ren_uops_0_debug_pc; // @[rename-stage.scala 220:25]
  wire [2:0] busytable_io_ren_uops_0_iq_type; // @[rename-stage.scala 220:25]
  wire [9:0] busytable_io_ren_uops_0_fu_code; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_0_ctrl_br_type; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_0_ctrl_op1_sel; // @[rename-stage.scala 220:25]
  wire [2:0] busytable_io_ren_uops_0_ctrl_op2_sel; // @[rename-stage.scala 220:25]
  wire [2:0] busytable_io_ren_uops_0_ctrl_imm_sel; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_0_ctrl_op_fcn; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_ctrl_fcn_dw; // @[rename-stage.scala 220:25]
  wire [2:0] busytable_io_ren_uops_0_ctrl_csr_cmd; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_ctrl_is_load; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_ctrl_is_sta; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_ctrl_is_std; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_0_ctrl_op3_sel; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_0_iw_state; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_iw_p1_poisoned; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_iw_p2_poisoned; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_is_br; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_is_jalr; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_is_jal; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_is_sfb; // @[rename-stage.scala 220:25]
  wire [11:0] busytable_io_ren_uops_0_br_mask; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_0_br_tag; // @[rename-stage.scala 220:25]
  wire [4:0] busytable_io_ren_uops_0_ftq_idx; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_edge_inst; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_0_pc_lob; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_taken; // @[rename-stage.scala 220:25]
  wire [19:0] busytable_io_ren_uops_0_imm_packed; // @[rename-stage.scala 220:25]
  wire [11:0] busytable_io_ren_uops_0_csr_addr; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_0_rob_idx; // @[rename-stage.scala 220:25]
  wire [4:0] busytable_io_ren_uops_0_ldq_idx; // @[rename-stage.scala 220:25]
  wire [4:0] busytable_io_ren_uops_0_stq_idx; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_0_rxq_idx; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_0_pdst; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_0_prs1; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_0_prs2; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_0_prs3; // @[rename-stage.scala 220:25]
  wire [4:0] busytable_io_ren_uops_0_ppred; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_prs1_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_prs2_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_prs3_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_ppred_busy; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_0_stale_pdst; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_exception; // @[rename-stage.scala 220:25]
  wire [63:0] busytable_io_ren_uops_0_exc_cause; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_bypassable; // @[rename-stage.scala 220:25]
  wire [4:0] busytable_io_ren_uops_0_mem_cmd; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_0_mem_size; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_mem_signed; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_is_fence; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_is_fencei; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_is_amo; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_uses_ldq; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_uses_stq; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_is_sys_pc2epc; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_is_unique; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_flush_on_commit; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_ldst_is_rs1; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_0_ldst; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_0_lrs1; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_0_lrs2; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_0_lrs3; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_ldst_val; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_0_dst_rtype; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_0_lrs1_rtype; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_0_lrs2_rtype; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_frs3_en; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_fp_val; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_fp_single; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_xcpt_pf_if; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_xcpt_ae_if; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_xcpt_ma_if; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_bp_debug_if; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_0_bp_xcpt_if; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_0_debug_fsrc; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_0_debug_tsrc; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_switch; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_switch_off; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_is_unicore; // @[rename-stage.scala 220:25]
  wire [2:0] busytable_io_ren_uops_1_shift; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_1_lrs3_rtype; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_rflag; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_wflag; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_1_prflag; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_1_pwflag; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_pflag_busy; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_1_stale_pflag; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_1_op1_sel; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_1_op2_sel; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_1_split_num; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_1_self_index; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_1_rob_inst_idx; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_1_address_num; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_1_uopc; // @[rename-stage.scala 220:25]
  wire [31:0] busytable_io_ren_uops_1_inst; // @[rename-stage.scala 220:25]
  wire [31:0] busytable_io_ren_uops_1_debug_inst; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_is_rvc; // @[rename-stage.scala 220:25]
  wire [39:0] busytable_io_ren_uops_1_debug_pc; // @[rename-stage.scala 220:25]
  wire [2:0] busytable_io_ren_uops_1_iq_type; // @[rename-stage.scala 220:25]
  wire [9:0] busytable_io_ren_uops_1_fu_code; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_1_ctrl_br_type; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_1_ctrl_op1_sel; // @[rename-stage.scala 220:25]
  wire [2:0] busytable_io_ren_uops_1_ctrl_op2_sel; // @[rename-stage.scala 220:25]
  wire [2:0] busytable_io_ren_uops_1_ctrl_imm_sel; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_1_ctrl_op_fcn; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_ctrl_fcn_dw; // @[rename-stage.scala 220:25]
  wire [2:0] busytable_io_ren_uops_1_ctrl_csr_cmd; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_ctrl_is_load; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_ctrl_is_sta; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_ctrl_is_std; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_1_ctrl_op3_sel; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_1_iw_state; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_iw_p1_poisoned; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_iw_p2_poisoned; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_is_br; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_is_jalr; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_is_jal; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_is_sfb; // @[rename-stage.scala 220:25]
  wire [11:0] busytable_io_ren_uops_1_br_mask; // @[rename-stage.scala 220:25]
  wire [3:0] busytable_io_ren_uops_1_br_tag; // @[rename-stage.scala 220:25]
  wire [4:0] busytable_io_ren_uops_1_ftq_idx; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_edge_inst; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_1_pc_lob; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_taken; // @[rename-stage.scala 220:25]
  wire [19:0] busytable_io_ren_uops_1_imm_packed; // @[rename-stage.scala 220:25]
  wire [11:0] busytable_io_ren_uops_1_csr_addr; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_1_rob_idx; // @[rename-stage.scala 220:25]
  wire [4:0] busytable_io_ren_uops_1_ldq_idx; // @[rename-stage.scala 220:25]
  wire [4:0] busytable_io_ren_uops_1_stq_idx; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_1_rxq_idx; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_1_pdst; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_1_prs1; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_1_prs2; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_1_prs3; // @[rename-stage.scala 220:25]
  wire [4:0] busytable_io_ren_uops_1_ppred; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_prs1_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_prs2_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_prs3_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_ppred_busy; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_ren_uops_1_stale_pdst; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_exception; // @[rename-stage.scala 220:25]
  wire [63:0] busytable_io_ren_uops_1_exc_cause; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_bypassable; // @[rename-stage.scala 220:25]
  wire [4:0] busytable_io_ren_uops_1_mem_cmd; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_1_mem_size; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_mem_signed; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_is_fence; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_is_fencei; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_is_amo; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_uses_ldq; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_uses_stq; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_is_sys_pc2epc; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_is_unique; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_flush_on_commit; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_ldst_is_rs1; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_1_ldst; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_1_lrs1; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_1_lrs2; // @[rename-stage.scala 220:25]
  wire [5:0] busytable_io_ren_uops_1_lrs3; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_ldst_val; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_1_dst_rtype; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_1_lrs1_rtype; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_1_lrs2_rtype; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_frs3_en; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_fp_val; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_fp_single; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_xcpt_pf_if; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_xcpt_ae_if; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_xcpt_ma_if; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_bp_debug_if; // @[rename-stage.scala 220:25]
  wire  busytable_io_ren_uops_1_bp_xcpt_if; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_1_debug_fsrc; // @[rename-stage.scala 220:25]
  wire [1:0] busytable_io_ren_uops_1_debug_tsrc; // @[rename-stage.scala 220:25]
  wire  busytable_io_busy_resps_0_prs1_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_busy_resps_0_prs2_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_busy_resps_0_prs3_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_busy_resps_1_prs1_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_busy_resps_1_prs2_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_busy_resps_1_prs3_busy; // @[rename-stage.scala 220:25]
  wire  busytable_io_rebusy_reqs_0; // @[rename-stage.scala 220:25]
  wire  busytable_io_rebusy_reqs_1; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_wb_pdsts_0; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_wb_pdsts_1; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_wb_pdsts_2; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_wb_pdsts_3; // @[rename-stage.scala 220:25]
  wire [6:0] busytable_io_wb_pdsts_4; // @[rename-stage.scala 220:25]
  wire  busytable_io_wb_valids_0; // @[rename-stage.scala 220:25]
  wire  busytable_io_wb_valids_1; // @[rename-stage.scala 220:25]
  wire  busytable_io_wb_valids_2; // @[rename-stage.scala 220:25]
  wire  busytable_io_wb_valids_3; // @[rename-stage.scala 220:25]
  wire  busytable_io_wb_valids_4; // @[rename-stage.scala 220:25]
  wire  busytable_io_is_unicore; // @[rename-stage.scala 220:25]
  wire [79:0] busytable_io_debug_busytable; // @[rename-stage.scala 220:25]
  reg  REG; // @[rename-stage.scala 122:27]
  reg  REG_1_switch; // @[rename-stage.scala 123:23]
  reg  REG_1_switch_off; // @[rename-stage.scala 123:23]
  reg  REG_1_is_unicore; // @[rename-stage.scala 123:23]
  reg [2:0] REG_1_shift; // @[rename-stage.scala 123:23]
  reg [1:0] REG_1_lrs3_rtype; // @[rename-stage.scala 123:23]
  reg  REG_1_rflag; // @[rename-stage.scala 123:23]
  reg  REG_1_wflag; // @[rename-stage.scala 123:23]
  reg [3:0] REG_1_prflag; // @[rename-stage.scala 123:23]
  reg [3:0] REG_1_pwflag; // @[rename-stage.scala 123:23]
  reg  REG_1_pflag_busy; // @[rename-stage.scala 123:23]
  reg [3:0] REG_1_stale_pflag; // @[rename-stage.scala 123:23]
  reg [3:0] REG_1_op1_sel; // @[rename-stage.scala 123:23]
  reg [3:0] REG_1_op2_sel; // @[rename-stage.scala 123:23]
  reg [5:0] REG_1_split_num; // @[rename-stage.scala 123:23]
  reg [5:0] REG_1_self_index; // @[rename-stage.scala 123:23]
  reg [5:0] REG_1_rob_inst_idx; // @[rename-stage.scala 123:23]
  reg [5:0] REG_1_address_num; // @[rename-stage.scala 123:23]
  reg [6:0] REG_1_uopc; // @[rename-stage.scala 123:23]
  reg [31:0] REG_1_inst; // @[rename-stage.scala 123:23]
  reg [31:0] REG_1_debug_inst; // @[rename-stage.scala 123:23]
  reg  REG_1_is_rvc; // @[rename-stage.scala 123:23]
  reg [39:0] REG_1_debug_pc; // @[rename-stage.scala 123:23]
  reg [2:0] REG_1_iq_type; // @[rename-stage.scala 123:23]
  reg [9:0] REG_1_fu_code; // @[rename-stage.scala 123:23]
  reg [3:0] REG_1_ctrl_br_type; // @[rename-stage.scala 123:23]
  reg [1:0] REG_1_ctrl_op1_sel; // @[rename-stage.scala 123:23]
  reg [2:0] REG_1_ctrl_op2_sel; // @[rename-stage.scala 123:23]
  reg [2:0] REG_1_ctrl_imm_sel; // @[rename-stage.scala 123:23]
  reg [3:0] REG_1_ctrl_op_fcn; // @[rename-stage.scala 123:23]
  reg  REG_1_ctrl_fcn_dw; // @[rename-stage.scala 123:23]
  reg [2:0] REG_1_ctrl_csr_cmd; // @[rename-stage.scala 123:23]
  reg  REG_1_ctrl_is_load; // @[rename-stage.scala 123:23]
  reg  REG_1_ctrl_is_sta; // @[rename-stage.scala 123:23]
  reg  REG_1_ctrl_is_std; // @[rename-stage.scala 123:23]
  reg [1:0] REG_1_ctrl_op3_sel; // @[rename-stage.scala 123:23]
  reg [1:0] REG_1_iw_state; // @[rename-stage.scala 123:23]
  reg  REG_1_iw_p1_poisoned; // @[rename-stage.scala 123:23]
  reg  REG_1_iw_p2_poisoned; // @[rename-stage.scala 123:23]
  reg  REG_1_is_br; // @[rename-stage.scala 123:23]
  reg  REG_1_is_jalr; // @[rename-stage.scala 123:23]
  reg  REG_1_is_jal; // @[rename-stage.scala 123:23]
  reg  REG_1_is_sfb; // @[rename-stage.scala 123:23]
  reg [11:0] REG_1_br_mask; // @[rename-stage.scala 123:23]
  reg [3:0] REG_1_br_tag; // @[rename-stage.scala 123:23]
  reg [4:0] REG_1_ftq_idx; // @[rename-stage.scala 123:23]
  reg  REG_1_edge_inst; // @[rename-stage.scala 123:23]
  reg [5:0] REG_1_pc_lob; // @[rename-stage.scala 123:23]
  reg  REG_1_taken; // @[rename-stage.scala 123:23]
  reg [19:0] REG_1_imm_packed; // @[rename-stage.scala 123:23]
  reg [11:0] REG_1_csr_addr; // @[rename-stage.scala 123:23]
  reg [5:0] REG_1_rob_idx; // @[rename-stage.scala 123:23]
  reg [4:0] REG_1_ldq_idx; // @[rename-stage.scala 123:23]
  reg [4:0] REG_1_stq_idx; // @[rename-stage.scala 123:23]
  reg [1:0] REG_1_rxq_idx; // @[rename-stage.scala 123:23]
  reg [6:0] REG_1_prs1; // @[rename-stage.scala 123:23]
  reg [6:0] REG_1_prs2; // @[rename-stage.scala 123:23]
  reg [6:0] REG_1_prs3; // @[rename-stage.scala 123:23]
  reg [4:0] REG_1_ppred; // @[rename-stage.scala 123:23]
  reg  REG_1_ppred_busy; // @[rename-stage.scala 123:23]
  reg [6:0] REG_1_stale_pdst; // @[rename-stage.scala 123:23]
  reg  REG_1_exception; // @[rename-stage.scala 123:23]
  reg [63:0] REG_1_exc_cause; // @[rename-stage.scala 123:23]
  reg  REG_1_bypassable; // @[rename-stage.scala 123:23]
  reg [4:0] REG_1_mem_cmd; // @[rename-stage.scala 123:23]
  reg [1:0] REG_1_mem_size; // @[rename-stage.scala 123:23]
  reg  REG_1_mem_signed; // @[rename-stage.scala 123:23]
  reg  REG_1_is_fence; // @[rename-stage.scala 123:23]
  reg  REG_1_is_fencei; // @[rename-stage.scala 123:23]
  reg  REG_1_is_amo; // @[rename-stage.scala 123:23]
  reg  REG_1_uses_ldq; // @[rename-stage.scala 123:23]
  reg  REG_1_uses_stq; // @[rename-stage.scala 123:23]
  reg  REG_1_is_sys_pc2epc; // @[rename-stage.scala 123:23]
  reg  REG_1_is_unique; // @[rename-stage.scala 123:23]
  reg  REG_1_flush_on_commit; // @[rename-stage.scala 123:23]
  reg  REG_1_ldst_is_rs1; // @[rename-stage.scala 123:23]
  reg [5:0] REG_1_ldst; // @[rename-stage.scala 123:23]
  reg [5:0] REG_1_lrs1; // @[rename-stage.scala 123:23]
  reg [5:0] REG_1_lrs2; // @[rename-stage.scala 123:23]
  reg [5:0] REG_1_lrs3; // @[rename-stage.scala 123:23]
  reg  REG_1_ldst_val; // @[rename-stage.scala 123:23]
  reg [1:0] REG_1_dst_rtype; // @[rename-stage.scala 123:23]
  reg [1:0] REG_1_lrs1_rtype; // @[rename-stage.scala 123:23]
  reg [1:0] REG_1_lrs2_rtype; // @[rename-stage.scala 123:23]
  reg  REG_1_frs3_en; // @[rename-stage.scala 123:23]
  reg  REG_1_fp_val; // @[rename-stage.scala 123:23]
  reg  REG_1_fp_single; // @[rename-stage.scala 123:23]
  reg  REG_1_xcpt_pf_if; // @[rename-stage.scala 123:23]
  reg  REG_1_xcpt_ae_if; // @[rename-stage.scala 123:23]
  reg  REG_1_xcpt_ma_if; // @[rename-stage.scala 123:23]
  reg  REG_1_bp_debug_if; // @[rename-stage.scala 123:23]
  reg  REG_1_bp_xcpt_if; // @[rename-stage.scala 123:23]
  reg [1:0] REG_1_debug_fsrc; // @[rename-stage.scala 123:23]
  reg [1:0] REG_1_debug_tsrc; // @[rename-stage.scala 123:23]
  wire [1:0] _GEN_11 = io_dis_ready ? io_dec_uops_0_lrs2_rtype : REG_1_lrs2_rtype; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [1:0] _GEN_12 = io_dis_ready ? io_dec_uops_0_lrs1_rtype : REG_1_lrs1_rtype; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [1:0] _GEN_13 = io_dis_ready ? io_dec_uops_0_dst_rtype : REG_1_dst_rtype; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [5:0] _GEN_15 = io_dis_ready ? io_dec_uops_0_lrs3 : REG_1_lrs3; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [5:0] _GEN_16 = io_dis_ready ? io_dec_uops_0_lrs2 : REG_1_lrs2; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [5:0] _GEN_17 = io_dis_ready ? io_dec_uops_0_lrs1 : REG_1_lrs1; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [5:0] _GEN_18 = io_dis_ready ? io_dec_uops_0_ldst : REG_1_ldst; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [6:0] ren1_uops_0_stale_pdst = maptable_io_map_resps_0_stale_pdst; // @[rename-stage.scala 102:29 rename-stage.scala 296:20]
  wire [6:0] ren1_uops_0_prs3 = maptable_io_map_resps_0_prs3; // @[rename-stage.scala 102:29 rename-stage.scala 295:20]
  wire [6:0] ren1_uops_0_prs2 = maptable_io_map_resps_0_prs2; // @[rename-stage.scala 102:29 rename-stage.scala 294:20]
  wire [6:0] ren1_uops_0_prs1 = maptable_io_map_resps_0_prs1; // @[rename-stage.scala 102:29 rename-stage.scala 293:20]
  wire [11:0] _GEN_55 = io_dis_ready ? io_dec_uops_0_br_mask : REG_1_br_mask; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [1:0] _GEN_93 = io_dis_ready ? io_dec_uops_0_lrs3_rtype : REG_1_lrs3_rtype; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [1:0] _GEN_109 = io_kill ? REG_1_lrs2_rtype : _GEN_11; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [1:0] _GEN_110 = io_kill ? REG_1_lrs1_rtype : _GEN_12; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [1:0] _GEN_111 = io_kill ? REG_1_dst_rtype : _GEN_13; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [5:0] _GEN_113 = io_kill ? REG_1_lrs3 : _GEN_15; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [5:0] _GEN_114 = io_kill ? REG_1_lrs2 : _GEN_16; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [5:0] _GEN_115 = io_kill ? REG_1_lrs1 : _GEN_17; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [5:0] _GEN_116 = io_kill ? REG_1_ldst : _GEN_18; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [11:0] _GEN_153 = io_kill ? REG_1_br_mask : _GEN_55; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [1:0] _GEN_191 = io_kill ? REG_1_lrs3_rtype : _GEN_93; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire  _T_142 = REG_1_dst_rtype == 2'h0; // @[rename-stage.scala 234:78]
  wire  ren2_alloc_reqs_0 = REG_1_ldst_val & REG_1_dst_rtype == 2'h0 & io_dis_fire_0; // @[rename-stage.scala 234:88]
  wire  _T_5 = ren2_alloc_reqs_0 & REG_1_ldst == _GEN_115 & REG_1_dst_rtype == _GEN_110; // @[rename-stage.scala 183:100]
  reg [5:0] REG_3_ldst; // @[rename-stage.scala 123:23]
  reg  REG_3_ldst_val; // @[rename-stage.scala 123:23]
  reg [1:0] REG_3_dst_rtype; // @[rename-stage.scala 123:23]
  wire  _T_155 = REG_3_dst_rtype == 2'h0; // @[rename-stage.scala 234:78]
  wire  ren2_alloc_reqs_1 = REG_3_ldst_val & REG_3_dst_rtype == 2'h0 & io_dis_fire_1; // @[rename-stage.scala 234:88]
  wire  _T_9 = ren2_alloc_reqs_1 & REG_3_ldst == _GEN_115 & REG_3_dst_rtype == _GEN_110; // @[rename-stage.scala 183:100]
  wire  _T_13 = ren2_alloc_reqs_0 & REG_1_ldst == _GEN_114 & REG_1_dst_rtype == _GEN_109; // @[rename-stage.scala 184:100]
  wire  _T_17 = ren2_alloc_reqs_1 & REG_3_ldst == _GEN_114 & REG_3_dst_rtype == _GEN_109; // @[rename-stage.scala 184:100]
  wire  _T_21 = ren2_alloc_reqs_0 & REG_1_ldst == _GEN_113 & REG_1_dst_rtype == _GEN_191; // @[rename-stage.scala 185:100]
  wire  _T_25 = ren2_alloc_reqs_1 & REG_3_ldst == _GEN_113 & REG_3_dst_rtype == _GEN_191; // @[rename-stage.scala 185:100]
  wire  _T_29 = ren2_alloc_reqs_0 & REG_1_ldst == _GEN_116 & REG_1_dst_rtype == _GEN_111; // @[rename-stage.scala 186:100]
  wire  _T_33 = ren2_alloc_reqs_1 & REG_3_ldst == _GEN_116 & REG_3_dst_rtype == _GEN_111; // @[rename-stage.scala 186:100]
  wire [1:0] _enc_T = _T_5 ? 2'h2 : 2'h0; // @[Mux.scala 47:69]
  wire [1:0] enc = _T_9 ? 2'h1 : _enc_T; // @[Mux.scala 47:69]
  wire [1:0] _enc_T_1 = _T_13 ? 2'h2 : 2'h0; // @[Mux.scala 47:69]
  wire [1:0] enc_1 = _T_17 ? 2'h1 : _enc_T_1; // @[Mux.scala 47:69]
  wire [1:0] _enc_T_2 = _T_21 ? 2'h2 : 2'h0; // @[Mux.scala 47:69]
  wire [1:0] enc_2 = _T_25 ? 2'h1 : _enc_T_2; // @[Mux.scala 47:69]
  wire [1:0] _enc_T_3 = _T_29 ? 2'h2 : 2'h0; // @[Mux.scala 47:69]
  wire [1:0] enc_3 = _T_33 ? 2'h1 : _enc_T_3; // @[Mux.scala 47:69]
  wire  _T_42 = _T_5 | _T_9; // @[rename-stage.scala 193:49]
  wire  _T_43 = _T_13 | _T_17; // @[rename-stage.scala 194:49]
  wire  _T_44 = _T_21 | _T_25; // @[rename-stage.scala 195:49]
  wire  _T_45 = _T_29 | _T_33; // @[rename-stage.scala 196:49]
  wire [6:0] ren2_uops_0_pdst = REG_1_ldst != 6'h0 | io_is_unicore ? freelist_io_alloc_pregs_0_bits : 7'h0; // @[rename-stage.scala 321:20]
  wire [6:0] _T_46 = enc[1] ? ren2_uops_0_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] ren2_uops_1_pdst = REG_3_ldst != 6'h0 | io_is_unicore ? freelist_io_alloc_pregs_1_bits : 7'h0; // @[rename-stage.scala 321:20]
  wire [6:0] _T_47 = enc[0] ? ren2_uops_1_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_48 = _T_46 | _T_47; // @[Mux.scala 27:72]
  wire [6:0] _T_49 = enc_1[1] ? ren2_uops_0_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_50 = enc_1[0] ? ren2_uops_1_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_51 = _T_49 | _T_50; // @[Mux.scala 27:72]
  wire  _T_53 = ~io_is_unicore; // @[rename-stage.scala 203:66]
  wire [6:0] _T_55 = enc_2[1] ? ren2_uops_0_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_56 = enc_2[0] ? ren2_uops_1_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_57 = _T_55 | _T_56; // @[Mux.scala 27:72]
  wire [6:0] _T_59 = enc_3[1] ? ren2_uops_0_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_60 = enc_3[0] ? ren2_uops_1_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_61 = _T_59 | _T_60; // @[Mux.scala 27:72]
  wire [11:0] _T_69 = ~io_brupdate_b1_resolve_mask; // @[util.scala 131:37]
  reg  REG_2; // @[rename-stage.scala 122:27]
  reg  REG_3_switch; // @[rename-stage.scala 123:23]
  reg  REG_3_switch_off; // @[rename-stage.scala 123:23]
  reg  REG_3_is_unicore; // @[rename-stage.scala 123:23]
  reg [2:0] REG_3_shift; // @[rename-stage.scala 123:23]
  reg [1:0] REG_3_lrs3_rtype; // @[rename-stage.scala 123:23]
  reg  REG_3_rflag; // @[rename-stage.scala 123:23]
  reg  REG_3_wflag; // @[rename-stage.scala 123:23]
  reg [3:0] REG_3_prflag; // @[rename-stage.scala 123:23]
  reg [3:0] REG_3_pwflag; // @[rename-stage.scala 123:23]
  reg  REG_3_pflag_busy; // @[rename-stage.scala 123:23]
  reg [3:0] REG_3_stale_pflag; // @[rename-stage.scala 123:23]
  reg [3:0] REG_3_op1_sel; // @[rename-stage.scala 123:23]
  reg [3:0] REG_3_op2_sel; // @[rename-stage.scala 123:23]
  reg [5:0] REG_3_split_num; // @[rename-stage.scala 123:23]
  reg [5:0] REG_3_self_index; // @[rename-stage.scala 123:23]
  reg [5:0] REG_3_rob_inst_idx; // @[rename-stage.scala 123:23]
  reg [5:0] REG_3_address_num; // @[rename-stage.scala 123:23]
  reg [6:0] REG_3_uopc; // @[rename-stage.scala 123:23]
  reg [31:0] REG_3_inst; // @[rename-stage.scala 123:23]
  reg [31:0] REG_3_debug_inst; // @[rename-stage.scala 123:23]
  reg  REG_3_is_rvc; // @[rename-stage.scala 123:23]
  reg [39:0] REG_3_debug_pc; // @[rename-stage.scala 123:23]
  reg [2:0] REG_3_iq_type; // @[rename-stage.scala 123:23]
  reg [9:0] REG_3_fu_code; // @[rename-stage.scala 123:23]
  reg [3:0] REG_3_ctrl_br_type; // @[rename-stage.scala 123:23]
  reg [1:0] REG_3_ctrl_op1_sel; // @[rename-stage.scala 123:23]
  reg [2:0] REG_3_ctrl_op2_sel; // @[rename-stage.scala 123:23]
  reg [2:0] REG_3_ctrl_imm_sel; // @[rename-stage.scala 123:23]
  reg [3:0] REG_3_ctrl_op_fcn; // @[rename-stage.scala 123:23]
  reg  REG_3_ctrl_fcn_dw; // @[rename-stage.scala 123:23]
  reg [2:0] REG_3_ctrl_csr_cmd; // @[rename-stage.scala 123:23]
  reg  REG_3_ctrl_is_load; // @[rename-stage.scala 123:23]
  reg  REG_3_ctrl_is_sta; // @[rename-stage.scala 123:23]
  reg  REG_3_ctrl_is_std; // @[rename-stage.scala 123:23]
  reg [1:0] REG_3_ctrl_op3_sel; // @[rename-stage.scala 123:23]
  reg [1:0] REG_3_iw_state; // @[rename-stage.scala 123:23]
  reg  REG_3_iw_p1_poisoned; // @[rename-stage.scala 123:23]
  reg  REG_3_iw_p2_poisoned; // @[rename-stage.scala 123:23]
  reg  REG_3_is_br; // @[rename-stage.scala 123:23]
  reg  REG_3_is_jalr; // @[rename-stage.scala 123:23]
  reg  REG_3_is_jal; // @[rename-stage.scala 123:23]
  reg  REG_3_is_sfb; // @[rename-stage.scala 123:23]
  reg [11:0] REG_3_br_mask; // @[rename-stage.scala 123:23]
  reg [3:0] REG_3_br_tag; // @[rename-stage.scala 123:23]
  reg [4:0] REG_3_ftq_idx; // @[rename-stage.scala 123:23]
  reg  REG_3_edge_inst; // @[rename-stage.scala 123:23]
  reg [5:0] REG_3_pc_lob; // @[rename-stage.scala 123:23]
  reg  REG_3_taken; // @[rename-stage.scala 123:23]
  reg [19:0] REG_3_imm_packed; // @[rename-stage.scala 123:23]
  reg [11:0] REG_3_csr_addr; // @[rename-stage.scala 123:23]
  reg [5:0] REG_3_rob_idx; // @[rename-stage.scala 123:23]
  reg [4:0] REG_3_ldq_idx; // @[rename-stage.scala 123:23]
  reg [4:0] REG_3_stq_idx; // @[rename-stage.scala 123:23]
  reg [1:0] REG_3_rxq_idx; // @[rename-stage.scala 123:23]
  reg [6:0] REG_3_prs1; // @[rename-stage.scala 123:23]
  reg [6:0] REG_3_prs2; // @[rename-stage.scala 123:23]
  reg [6:0] REG_3_prs3; // @[rename-stage.scala 123:23]
  reg [4:0] REG_3_ppred; // @[rename-stage.scala 123:23]
  reg  REG_3_ppred_busy; // @[rename-stage.scala 123:23]
  reg [6:0] REG_3_stale_pdst; // @[rename-stage.scala 123:23]
  reg  REG_3_exception; // @[rename-stage.scala 123:23]
  reg [63:0] REG_3_exc_cause; // @[rename-stage.scala 123:23]
  reg  REG_3_bypassable; // @[rename-stage.scala 123:23]
  reg [4:0] REG_3_mem_cmd; // @[rename-stage.scala 123:23]
  reg [1:0] REG_3_mem_size; // @[rename-stage.scala 123:23]
  reg  REG_3_mem_signed; // @[rename-stage.scala 123:23]
  reg  REG_3_is_fence; // @[rename-stage.scala 123:23]
  reg  REG_3_is_fencei; // @[rename-stage.scala 123:23]
  reg  REG_3_is_amo; // @[rename-stage.scala 123:23]
  reg  REG_3_uses_ldq; // @[rename-stage.scala 123:23]
  reg  REG_3_uses_stq; // @[rename-stage.scala 123:23]
  reg  REG_3_is_sys_pc2epc; // @[rename-stage.scala 123:23]
  reg  REG_3_is_unique; // @[rename-stage.scala 123:23]
  reg  REG_3_flush_on_commit; // @[rename-stage.scala 123:23]
  reg  REG_3_ldst_is_rs1; // @[rename-stage.scala 123:23]
  reg [5:0] REG_3_lrs1; // @[rename-stage.scala 123:23]
  reg [5:0] REG_3_lrs2; // @[rename-stage.scala 123:23]
  reg [5:0] REG_3_lrs3; // @[rename-stage.scala 123:23]
  reg [1:0] REG_3_lrs1_rtype; // @[rename-stage.scala 123:23]
  reg [1:0] REG_3_lrs2_rtype; // @[rename-stage.scala 123:23]
  reg  REG_3_frs3_en; // @[rename-stage.scala 123:23]
  reg  REG_3_fp_val; // @[rename-stage.scala 123:23]
  reg  REG_3_fp_single; // @[rename-stage.scala 123:23]
  reg  REG_3_xcpt_pf_if; // @[rename-stage.scala 123:23]
  reg  REG_3_xcpt_ae_if; // @[rename-stage.scala 123:23]
  reg  REG_3_xcpt_ma_if; // @[rename-stage.scala 123:23]
  reg  REG_3_bp_debug_if; // @[rename-stage.scala 123:23]
  reg  REG_3_bp_xcpt_if; // @[rename-stage.scala 123:23]
  reg [1:0] REG_3_debug_fsrc; // @[rename-stage.scala 123:23]
  reg [1:0] REG_3_debug_tsrc; // @[rename-stage.scala 123:23]
  wire [1:0] _GEN_211 = io_dis_ready ? io_dec_uops_1_lrs2_rtype : REG_3_lrs2_rtype; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [1:0] _GEN_212 = io_dis_ready ? io_dec_uops_1_lrs1_rtype : REG_3_lrs1_rtype; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [1:0] _GEN_213 = io_dis_ready ? io_dec_uops_1_dst_rtype : REG_3_dst_rtype; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [5:0] _GEN_215 = io_dis_ready ? io_dec_uops_1_lrs3 : REG_3_lrs3; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [5:0] _GEN_216 = io_dis_ready ? io_dec_uops_1_lrs2 : REG_3_lrs2; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [5:0] _GEN_217 = io_dis_ready ? io_dec_uops_1_lrs1 : REG_3_lrs1; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [5:0] _GEN_218 = io_dis_ready ? io_dec_uops_1_ldst : REG_3_ldst; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [6:0] ren1_uops_1_stale_pdst = maptable_io_map_resps_1_stale_pdst; // @[rename-stage.scala 102:29 rename-stage.scala 296:20]
  wire [6:0] ren1_uops_1_prs3 = maptable_io_map_resps_1_prs3; // @[rename-stage.scala 102:29 rename-stage.scala 295:20]
  wire [6:0] ren1_uops_1_prs2 = maptable_io_map_resps_1_prs2; // @[rename-stage.scala 102:29 rename-stage.scala 294:20]
  wire [6:0] ren1_uops_1_prs1 = maptable_io_map_resps_1_prs1; // @[rename-stage.scala 102:29 rename-stage.scala 293:20]
  wire [11:0] _GEN_255 = io_dis_ready ? io_dec_uops_1_br_mask : REG_3_br_mask; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [1:0] _GEN_293 = io_dis_ready ? io_dec_uops_1_lrs3_rtype : REG_3_lrs3_rtype; // @[rename-stage.scala 130:30 rename-stage.scala 132:16 rename-stage.scala 135:16]
  wire [1:0] _GEN_309 = io_kill ? REG_3_lrs2_rtype : _GEN_211; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [1:0] _GEN_310 = io_kill ? REG_3_lrs1_rtype : _GEN_212; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [1:0] _GEN_311 = io_kill ? REG_3_dst_rtype : _GEN_213; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [5:0] _GEN_313 = io_kill ? REG_3_lrs3 : _GEN_215; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [5:0] _GEN_314 = io_kill ? REG_3_lrs2 : _GEN_216; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [5:0] _GEN_315 = io_kill ? REG_3_lrs1 : _GEN_217; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [5:0] _GEN_316 = io_kill ? REG_3_ldst : _GEN_218; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [11:0] _GEN_353 = io_kill ? REG_3_br_mask : _GEN_255; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire [1:0] _GEN_391 = io_kill ? REG_3_lrs3_rtype : _GEN_293; // @[rename-stage.scala 128:20 rename-stage.scala 126:14]
  wire  _T_76 = ren2_alloc_reqs_0 & REG_1_ldst == _GEN_315 & REG_1_dst_rtype == _GEN_310; // @[rename-stage.scala 183:100]
  wire  _T_80 = ren2_alloc_reqs_1 & REG_3_ldst == _GEN_315 & REG_3_dst_rtype == _GEN_310; // @[rename-stage.scala 183:100]
  wire  _T_84 = ren2_alloc_reqs_0 & REG_1_ldst == _GEN_314 & REG_1_dst_rtype == _GEN_309; // @[rename-stage.scala 184:100]
  wire  _T_88 = ren2_alloc_reqs_1 & REG_3_ldst == _GEN_314 & REG_3_dst_rtype == _GEN_309; // @[rename-stage.scala 184:100]
  wire  _T_92 = ren2_alloc_reqs_0 & REG_1_ldst == _GEN_313 & REG_1_dst_rtype == _GEN_391; // @[rename-stage.scala 185:100]
  wire  _T_96 = ren2_alloc_reqs_1 & REG_3_ldst == _GEN_313 & REG_3_dst_rtype == _GEN_391; // @[rename-stage.scala 185:100]
  wire  _T_100 = ren2_alloc_reqs_0 & REG_1_ldst == _GEN_316 & REG_1_dst_rtype == _GEN_311; // @[rename-stage.scala 186:100]
  wire  _T_104 = ren2_alloc_reqs_1 & REG_3_ldst == _GEN_316 & REG_3_dst_rtype == _GEN_311; // @[rename-stage.scala 186:100]
  wire [1:0] _enc_T_4 = _T_76 ? 2'h2 : 2'h0; // @[Mux.scala 47:69]
  wire [1:0] enc_4 = _T_80 ? 2'h1 : _enc_T_4; // @[Mux.scala 47:69]
  wire [1:0] _enc_T_5 = _T_84 ? 2'h2 : 2'h0; // @[Mux.scala 47:69]
  wire [1:0] enc_5 = _T_88 ? 2'h1 : _enc_T_5; // @[Mux.scala 47:69]
  wire [1:0] _enc_T_6 = _T_92 ? 2'h2 : 2'h0; // @[Mux.scala 47:69]
  wire [1:0] enc_6 = _T_96 ? 2'h1 : _enc_T_6; // @[Mux.scala 47:69]
  wire [1:0] _enc_T_7 = _T_100 ? 2'h2 : 2'h0; // @[Mux.scala 47:69]
  wire [1:0] enc_7 = _T_104 ? 2'h1 : _enc_T_7; // @[Mux.scala 47:69]
  wire  _T_113 = _T_76 | _T_80; // @[rename-stage.scala 193:49]
  wire  _T_114 = _T_84 | _T_88; // @[rename-stage.scala 194:49]
  wire  _T_115 = _T_92 | _T_96; // @[rename-stage.scala 195:49]
  wire  _T_116 = _T_100 | _T_104; // @[rename-stage.scala 196:49]
  wire [6:0] _T_117 = enc_4[1] ? ren2_uops_0_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_118 = enc_4[0] ? ren2_uops_1_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_119 = _T_117 | _T_118; // @[Mux.scala 27:72]
  wire [6:0] _T_120 = enc_5[1] ? ren2_uops_0_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_121 = enc_5[0] ? ren2_uops_1_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_122 = _T_120 | _T_121; // @[Mux.scala 27:72]
  wire [6:0] _T_126 = enc_6[1] ? ren2_uops_0_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_127 = enc_6[0] ? ren2_uops_1_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_128 = _T_126 | _T_127; // @[Mux.scala 27:72]
  wire [6:0] _T_130 = enc_7[1] ? ren2_uops_0_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_131 = enc_7[0] ? ren2_uops_1_pdst : 7'h0; // @[Mux.scala 27:72]
  wire [6:0] _T_132 = _T_130 | _T_131; // @[Mux.scala 27:72]
  wire  _T_147 = REG_1_is_br & ~REG_1_is_sfb | REG_1_is_jalr; // @[micro-op.scala 181:45]
  wire  _T_150 = io_com_uops_0_ldst_val & io_com_uops_0_dst_rtype == 2'h0; // @[rename-stage.scala 237:54]
  wire  com_valids_0 = io_com_uops_0_ldst_val & io_com_uops_0_dst_rtype == 2'h0 & io_com_valids_0; // @[rename-stage.scala 237:92]
  wire  rbk_valids_0 = _T_150 & io_rbk_valids_0; // @[rename-stage.scala 238:92]
  wire  _T_160 = REG_3_is_br & ~REG_3_is_sfb | REG_3_is_jalr; // @[micro-op.scala 181:45]
  wire  _T_163 = io_com_uops_1_ldst_val & io_com_uops_1_dst_rtype == 2'h0; // @[rename-stage.scala 237:54]
  wire  com_valids_1 = io_com_uops_1_ldst_val & io_com_uops_1_dst_rtype == 2'h0 & io_com_valids_1; // @[rename-stage.scala 237:92]
  wire  rbk_valids_1 = _T_163 & io_rbk_valids_1; // @[rename-stage.scala 238:92]
  reg [4:0] value_lo; // @[Counters.scala 45:37]
  wire [5:0] nextSmall = value_lo + 5'h1; // @[Counters.scala 46:33]
  reg [26:0] value_hi; // @[Counters.scala 50:27]
  wire [26:0] _large_r_T_1 = value_hi + 27'h1; // @[Counters.scala 51:55]
  wire [31:0] value = {value_hi,value_lo}; // @[Cat.scala 30:58]
  reg [4:0] value_lo_1; // @[Counters.scala 45:37]
  wire [5:0] nextSmall_1 = value_lo_1 + 5'h1; // @[Counters.scala 46:33]
  reg [26:0] value_hi_1; // @[Counters.scala 50:27]
  wire [26:0] _large_r_T_3 = value_hi_1 + 27'h1; // @[Counters.scala 51:55]
  wire [31:0] value_1 = {value_hi_1,value_lo_1}; // @[Cat.scala 30:58]
  wire  ren2_uops_1_prs1_busy = REG_3_lrs1_rtype == 2'h0 & busytable_io_busy_resps_1_prs1_busy; // @[rename-stage.scala 338:47]
  wire  ren2_uops_1_prs2_busy = REG_3_lrs2_rtype == 2'h0 & busytable_io_busy_resps_1_prs2_busy; // @[rename-stage.scala 339:47]
  wire  ren2_uops_1_prs3_busy = io_is_unicore ? REG_3_lrs3_rtype == 2'h0 & busytable_io_busy_resps_1_prs3_busy :
    REG_3_frs3_en & busytable_io_busy_resps_1_prs3_busy; // @[rename-stage.scala 341:25]
  wire  enc_8 = ren2_alloc_reqs_0 & REG_1_ldst == REG_3_lrs1 & REG_1_dst_rtype == REG_3_lrs1_rtype; // @[rename-stage.scala 183:100]
  wire  enc_9 = ren2_alloc_reqs_0 & REG_1_ldst == REG_3_lrs2 & REG_1_dst_rtype == REG_3_lrs2_rtype; // @[rename-stage.scala 184:100]
  wire  enc_10 = ren2_alloc_reqs_0 & REG_1_ldst == REG_3_lrs3 & REG_1_dst_rtype == REG_3_lrs3_rtype; // @[rename-stage.scala 185:100]
  wire  enc_11 = ren2_alloc_reqs_0 & REG_1_ldst == REG_3_ldst & REG_1_dst_rtype == REG_3_dst_rtype; // @[rename-stage.scala 186:100]
  wire [6:0] _T_309 = ~io_is_unicore ? 7'h0 : ren2_uops_0_pdst; // @[rename-stage.scala 203:53]
  RenameMapTable maptable ( // @[rename-stage.scala 217:24]
    .clock(maptable_clock),
    .reset(maptable_reset),
    .io_map_reqs_0_lrs1(maptable_io_map_reqs_0_lrs1),
    .io_map_reqs_0_lrs2(maptable_io_map_reqs_0_lrs2),
    .io_map_reqs_0_lrs3(maptable_io_map_reqs_0_lrs3),
    .io_map_reqs_0_ldst(maptable_io_map_reqs_0_ldst),
    .io_map_reqs_1_lrs1(maptable_io_map_reqs_1_lrs1),
    .io_map_reqs_1_lrs2(maptable_io_map_reqs_1_lrs2),
    .io_map_reqs_1_lrs3(maptable_io_map_reqs_1_lrs3),
    .io_map_reqs_1_ldst(maptable_io_map_reqs_1_ldst),
    .io_map_resps_0_prs1(maptable_io_map_resps_0_prs1),
    .io_map_resps_0_prs2(maptable_io_map_resps_0_prs2),
    .io_map_resps_0_prs3(maptable_io_map_resps_0_prs3),
    .io_map_resps_0_stale_pdst(maptable_io_map_resps_0_stale_pdst),
    .io_map_resps_1_prs1(maptable_io_map_resps_1_prs1),
    .io_map_resps_1_prs2(maptable_io_map_resps_1_prs2),
    .io_map_resps_1_prs3(maptable_io_map_resps_1_prs3),
    .io_map_resps_1_stale_pdst(maptable_io_map_resps_1_stale_pdst),
    .io_remap_reqs_0_ldst(maptable_io_remap_reqs_0_ldst),
    .io_remap_reqs_0_pdst(maptable_io_remap_reqs_0_pdst),
    .io_remap_reqs_0_valid(maptable_io_remap_reqs_0_valid),
    .io_remap_reqs_1_ldst(maptable_io_remap_reqs_1_ldst),
    .io_remap_reqs_1_pdst(maptable_io_remap_reqs_1_pdst),
    .io_remap_reqs_1_valid(maptable_io_remap_reqs_1_valid),
    .io_ren_br_tags_0_valid(maptable_io_ren_br_tags_0_valid),
    .io_ren_br_tags_0_bits(maptable_io_ren_br_tags_0_bits),
    .io_ren_br_tags_1_valid(maptable_io_ren_br_tags_1_valid),
    .io_ren_br_tags_1_bits(maptable_io_ren_br_tags_1_bits),
    .io_brupdate_b1_resolve_mask(maptable_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(maptable_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_switch(maptable_io_brupdate_b2_uop_switch),
    .io_brupdate_b2_uop_switch_off(maptable_io_brupdate_b2_uop_switch_off),
    .io_brupdate_b2_uop_is_unicore(maptable_io_brupdate_b2_uop_is_unicore),
    .io_brupdate_b2_uop_shift(maptable_io_brupdate_b2_uop_shift),
    .io_brupdate_b2_uop_lrs3_rtype(maptable_io_brupdate_b2_uop_lrs3_rtype),
    .io_brupdate_b2_uop_rflag(maptable_io_brupdate_b2_uop_rflag),
    .io_brupdate_b2_uop_wflag(maptable_io_brupdate_b2_uop_wflag),
    .io_brupdate_b2_uop_prflag(maptable_io_brupdate_b2_uop_prflag),
    .io_brupdate_b2_uop_pwflag(maptable_io_brupdate_b2_uop_pwflag),
    .io_brupdate_b2_uop_pflag_busy(maptable_io_brupdate_b2_uop_pflag_busy),
    .io_brupdate_b2_uop_stale_pflag(maptable_io_brupdate_b2_uop_stale_pflag),
    .io_brupdate_b2_uop_op1_sel(maptable_io_brupdate_b2_uop_op1_sel),
    .io_brupdate_b2_uop_op2_sel(maptable_io_brupdate_b2_uop_op2_sel),
    .io_brupdate_b2_uop_split_num(maptable_io_brupdate_b2_uop_split_num),
    .io_brupdate_b2_uop_self_index(maptable_io_brupdate_b2_uop_self_index),
    .io_brupdate_b2_uop_rob_inst_idx(maptable_io_brupdate_b2_uop_rob_inst_idx),
    .io_brupdate_b2_uop_address_num(maptable_io_brupdate_b2_uop_address_num),
    .io_brupdate_b2_uop_uopc(maptable_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(maptable_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(maptable_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(maptable_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(maptable_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(maptable_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(maptable_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(maptable_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(maptable_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(maptable_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(maptable_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(maptable_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(maptable_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(maptable_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(maptable_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(maptable_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(maptable_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_ctrl_op3_sel(maptable_io_brupdate_b2_uop_ctrl_op3_sel),
    .io_brupdate_b2_uop_iw_state(maptable_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(maptable_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(maptable_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(maptable_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(maptable_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(maptable_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(maptable_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(maptable_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(maptable_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(maptable_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(maptable_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(maptable_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(maptable_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(maptable_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(maptable_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(maptable_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(maptable_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(maptable_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(maptable_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(maptable_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(maptable_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(maptable_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(maptable_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(maptable_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(maptable_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(maptable_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(maptable_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(maptable_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(maptable_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(maptable_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(maptable_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(maptable_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(maptable_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(maptable_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(maptable_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(maptable_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(maptable_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(maptable_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(maptable_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(maptable_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(maptable_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(maptable_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(maptable_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(maptable_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(maptable_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(maptable_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(maptable_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(maptable_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(maptable_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(maptable_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(maptable_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(maptable_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(maptable_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(maptable_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(maptable_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(maptable_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(maptable_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(maptable_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(maptable_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(maptable_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(maptable_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(maptable_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(maptable_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(maptable_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(maptable_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(maptable_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(maptable_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(maptable_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(maptable_io_brupdate_b2_target_offset),
    .io_rollback(maptable_io_rollback),
    .io_is_unicore(maptable_io_is_unicore)
  );
  RenameFreeList freelist ( // @[rename-stage.scala 219:24]
    .clock(freelist_clock),
    .reset(freelist_reset),
    .io_reqs_0(freelist_io_reqs_0),
    .io_reqs_1(freelist_io_reqs_1),
    .io_alloc_pregs_0_valid(freelist_io_alloc_pregs_0_valid),
    .io_alloc_pregs_0_bits(freelist_io_alloc_pregs_0_bits),
    .io_alloc_pregs_1_valid(freelist_io_alloc_pregs_1_valid),
    .io_alloc_pregs_1_bits(freelist_io_alloc_pregs_1_bits),
    .io_dealloc_pregs_0_valid(freelist_io_dealloc_pregs_0_valid),
    .io_dealloc_pregs_0_bits(freelist_io_dealloc_pregs_0_bits),
    .io_dealloc_pregs_1_valid(freelist_io_dealloc_pregs_1_valid),
    .io_dealloc_pregs_1_bits(freelist_io_dealloc_pregs_1_bits),
    .io_ren_br_tags_0_valid(freelist_io_ren_br_tags_0_valid),
    .io_ren_br_tags_0_bits(freelist_io_ren_br_tags_0_bits),
    .io_ren_br_tags_1_valid(freelist_io_ren_br_tags_1_valid),
    .io_ren_br_tags_1_bits(freelist_io_ren_br_tags_1_bits),
    .io_brupdate_b1_resolve_mask(freelist_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(freelist_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_switch(freelist_io_brupdate_b2_uop_switch),
    .io_brupdate_b2_uop_switch_off(freelist_io_brupdate_b2_uop_switch_off),
    .io_brupdate_b2_uop_is_unicore(freelist_io_brupdate_b2_uop_is_unicore),
    .io_brupdate_b2_uop_shift(freelist_io_brupdate_b2_uop_shift),
    .io_brupdate_b2_uop_lrs3_rtype(freelist_io_brupdate_b2_uop_lrs3_rtype),
    .io_brupdate_b2_uop_rflag(freelist_io_brupdate_b2_uop_rflag),
    .io_brupdate_b2_uop_wflag(freelist_io_brupdate_b2_uop_wflag),
    .io_brupdate_b2_uop_prflag(freelist_io_brupdate_b2_uop_prflag),
    .io_brupdate_b2_uop_pwflag(freelist_io_brupdate_b2_uop_pwflag),
    .io_brupdate_b2_uop_pflag_busy(freelist_io_brupdate_b2_uop_pflag_busy),
    .io_brupdate_b2_uop_stale_pflag(freelist_io_brupdate_b2_uop_stale_pflag),
    .io_brupdate_b2_uop_op1_sel(freelist_io_brupdate_b2_uop_op1_sel),
    .io_brupdate_b2_uop_op2_sel(freelist_io_brupdate_b2_uop_op2_sel),
    .io_brupdate_b2_uop_split_num(freelist_io_brupdate_b2_uop_split_num),
    .io_brupdate_b2_uop_self_index(freelist_io_brupdate_b2_uop_self_index),
    .io_brupdate_b2_uop_rob_inst_idx(freelist_io_brupdate_b2_uop_rob_inst_idx),
    .io_brupdate_b2_uop_address_num(freelist_io_brupdate_b2_uop_address_num),
    .io_brupdate_b2_uop_uopc(freelist_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(freelist_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(freelist_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(freelist_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(freelist_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(freelist_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(freelist_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(freelist_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(freelist_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(freelist_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(freelist_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(freelist_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(freelist_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(freelist_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(freelist_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(freelist_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(freelist_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_ctrl_op3_sel(freelist_io_brupdate_b2_uop_ctrl_op3_sel),
    .io_brupdate_b2_uop_iw_state(freelist_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(freelist_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(freelist_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(freelist_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(freelist_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(freelist_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(freelist_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(freelist_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(freelist_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(freelist_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(freelist_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(freelist_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(freelist_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(freelist_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(freelist_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(freelist_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(freelist_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(freelist_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(freelist_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(freelist_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(freelist_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(freelist_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(freelist_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(freelist_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(freelist_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(freelist_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(freelist_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(freelist_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(freelist_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(freelist_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(freelist_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(freelist_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(freelist_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(freelist_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(freelist_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(freelist_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(freelist_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(freelist_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(freelist_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(freelist_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(freelist_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(freelist_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(freelist_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(freelist_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(freelist_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(freelist_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(freelist_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(freelist_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(freelist_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(freelist_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(freelist_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(freelist_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(freelist_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(freelist_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(freelist_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(freelist_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(freelist_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(freelist_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(freelist_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(freelist_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(freelist_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(freelist_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(freelist_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(freelist_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(freelist_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(freelist_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(freelist_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(freelist_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(freelist_io_brupdate_b2_target_offset),
    .io_is_print(freelist_io_is_print),
    .io_debug_pipeline_empty(freelist_io_debug_pipeline_empty),
    .io_debug_freelist(freelist_io_debug_freelist),
    .io_debug_isprlist(freelist_io_debug_isprlist)
  );
  RenameBusyTable busytable ( // @[rename-stage.scala 220:25]
    .clock(busytable_clock),
    .reset(busytable_reset),
    .io_ren_uops_0_switch(busytable_io_ren_uops_0_switch),
    .io_ren_uops_0_switch_off(busytable_io_ren_uops_0_switch_off),
    .io_ren_uops_0_is_unicore(busytable_io_ren_uops_0_is_unicore),
    .io_ren_uops_0_shift(busytable_io_ren_uops_0_shift),
    .io_ren_uops_0_lrs3_rtype(busytable_io_ren_uops_0_lrs3_rtype),
    .io_ren_uops_0_rflag(busytable_io_ren_uops_0_rflag),
    .io_ren_uops_0_wflag(busytable_io_ren_uops_0_wflag),
    .io_ren_uops_0_prflag(busytable_io_ren_uops_0_prflag),
    .io_ren_uops_0_pwflag(busytable_io_ren_uops_0_pwflag),
    .io_ren_uops_0_pflag_busy(busytable_io_ren_uops_0_pflag_busy),
    .io_ren_uops_0_stale_pflag(busytable_io_ren_uops_0_stale_pflag),
    .io_ren_uops_0_op1_sel(busytable_io_ren_uops_0_op1_sel),
    .io_ren_uops_0_op2_sel(busytable_io_ren_uops_0_op2_sel),
    .io_ren_uops_0_split_num(busytable_io_ren_uops_0_split_num),
    .io_ren_uops_0_self_index(busytable_io_ren_uops_0_self_index),
    .io_ren_uops_0_rob_inst_idx(busytable_io_ren_uops_0_rob_inst_idx),
    .io_ren_uops_0_address_num(busytable_io_ren_uops_0_address_num),
    .io_ren_uops_0_uopc(busytable_io_ren_uops_0_uopc),
    .io_ren_uops_0_inst(busytable_io_ren_uops_0_inst),
    .io_ren_uops_0_debug_inst(busytable_io_ren_uops_0_debug_inst),
    .io_ren_uops_0_is_rvc(busytable_io_ren_uops_0_is_rvc),
    .io_ren_uops_0_debug_pc(busytable_io_ren_uops_0_debug_pc),
    .io_ren_uops_0_iq_type(busytable_io_ren_uops_0_iq_type),
    .io_ren_uops_0_fu_code(busytable_io_ren_uops_0_fu_code),
    .io_ren_uops_0_ctrl_br_type(busytable_io_ren_uops_0_ctrl_br_type),
    .io_ren_uops_0_ctrl_op1_sel(busytable_io_ren_uops_0_ctrl_op1_sel),
    .io_ren_uops_0_ctrl_op2_sel(busytable_io_ren_uops_0_ctrl_op2_sel),
    .io_ren_uops_0_ctrl_imm_sel(busytable_io_ren_uops_0_ctrl_imm_sel),
    .io_ren_uops_0_ctrl_op_fcn(busytable_io_ren_uops_0_ctrl_op_fcn),
    .io_ren_uops_0_ctrl_fcn_dw(busytable_io_ren_uops_0_ctrl_fcn_dw),
    .io_ren_uops_0_ctrl_csr_cmd(busytable_io_ren_uops_0_ctrl_csr_cmd),
    .io_ren_uops_0_ctrl_is_load(busytable_io_ren_uops_0_ctrl_is_load),
    .io_ren_uops_0_ctrl_is_sta(busytable_io_ren_uops_0_ctrl_is_sta),
    .io_ren_uops_0_ctrl_is_std(busytable_io_ren_uops_0_ctrl_is_std),
    .io_ren_uops_0_ctrl_op3_sel(busytable_io_ren_uops_0_ctrl_op3_sel),
    .io_ren_uops_0_iw_state(busytable_io_ren_uops_0_iw_state),
    .io_ren_uops_0_iw_p1_poisoned(busytable_io_ren_uops_0_iw_p1_poisoned),
    .io_ren_uops_0_iw_p2_poisoned(busytable_io_ren_uops_0_iw_p2_poisoned),
    .io_ren_uops_0_is_br(busytable_io_ren_uops_0_is_br),
    .io_ren_uops_0_is_jalr(busytable_io_ren_uops_0_is_jalr),
    .io_ren_uops_0_is_jal(busytable_io_ren_uops_0_is_jal),
    .io_ren_uops_0_is_sfb(busytable_io_ren_uops_0_is_sfb),
    .io_ren_uops_0_br_mask(busytable_io_ren_uops_0_br_mask),
    .io_ren_uops_0_br_tag(busytable_io_ren_uops_0_br_tag),
    .io_ren_uops_0_ftq_idx(busytable_io_ren_uops_0_ftq_idx),
    .io_ren_uops_0_edge_inst(busytable_io_ren_uops_0_edge_inst),
    .io_ren_uops_0_pc_lob(busytable_io_ren_uops_0_pc_lob),
    .io_ren_uops_0_taken(busytable_io_ren_uops_0_taken),
    .io_ren_uops_0_imm_packed(busytable_io_ren_uops_0_imm_packed),
    .io_ren_uops_0_csr_addr(busytable_io_ren_uops_0_csr_addr),
    .io_ren_uops_0_rob_idx(busytable_io_ren_uops_0_rob_idx),
    .io_ren_uops_0_ldq_idx(busytable_io_ren_uops_0_ldq_idx),
    .io_ren_uops_0_stq_idx(busytable_io_ren_uops_0_stq_idx),
    .io_ren_uops_0_rxq_idx(busytable_io_ren_uops_0_rxq_idx),
    .io_ren_uops_0_pdst(busytable_io_ren_uops_0_pdst),
    .io_ren_uops_0_prs1(busytable_io_ren_uops_0_prs1),
    .io_ren_uops_0_prs2(busytable_io_ren_uops_0_prs2),
    .io_ren_uops_0_prs3(busytable_io_ren_uops_0_prs3),
    .io_ren_uops_0_ppred(busytable_io_ren_uops_0_ppred),
    .io_ren_uops_0_prs1_busy(busytable_io_ren_uops_0_prs1_busy),
    .io_ren_uops_0_prs2_busy(busytable_io_ren_uops_0_prs2_busy),
    .io_ren_uops_0_prs3_busy(busytable_io_ren_uops_0_prs3_busy),
    .io_ren_uops_0_ppred_busy(busytable_io_ren_uops_0_ppred_busy),
    .io_ren_uops_0_stale_pdst(busytable_io_ren_uops_0_stale_pdst),
    .io_ren_uops_0_exception(busytable_io_ren_uops_0_exception),
    .io_ren_uops_0_exc_cause(busytable_io_ren_uops_0_exc_cause),
    .io_ren_uops_0_bypassable(busytable_io_ren_uops_0_bypassable),
    .io_ren_uops_0_mem_cmd(busytable_io_ren_uops_0_mem_cmd),
    .io_ren_uops_0_mem_size(busytable_io_ren_uops_0_mem_size),
    .io_ren_uops_0_mem_signed(busytable_io_ren_uops_0_mem_signed),
    .io_ren_uops_0_is_fence(busytable_io_ren_uops_0_is_fence),
    .io_ren_uops_0_is_fencei(busytable_io_ren_uops_0_is_fencei),
    .io_ren_uops_0_is_amo(busytable_io_ren_uops_0_is_amo),
    .io_ren_uops_0_uses_ldq(busytable_io_ren_uops_0_uses_ldq),
    .io_ren_uops_0_uses_stq(busytable_io_ren_uops_0_uses_stq),
    .io_ren_uops_0_is_sys_pc2epc(busytable_io_ren_uops_0_is_sys_pc2epc),
    .io_ren_uops_0_is_unique(busytable_io_ren_uops_0_is_unique),
    .io_ren_uops_0_flush_on_commit(busytable_io_ren_uops_0_flush_on_commit),
    .io_ren_uops_0_ldst_is_rs1(busytable_io_ren_uops_0_ldst_is_rs1),
    .io_ren_uops_0_ldst(busytable_io_ren_uops_0_ldst),
    .io_ren_uops_0_lrs1(busytable_io_ren_uops_0_lrs1),
    .io_ren_uops_0_lrs2(busytable_io_ren_uops_0_lrs2),
    .io_ren_uops_0_lrs3(busytable_io_ren_uops_0_lrs3),
    .io_ren_uops_0_ldst_val(busytable_io_ren_uops_0_ldst_val),
    .io_ren_uops_0_dst_rtype(busytable_io_ren_uops_0_dst_rtype),
    .io_ren_uops_0_lrs1_rtype(busytable_io_ren_uops_0_lrs1_rtype),
    .io_ren_uops_0_lrs2_rtype(busytable_io_ren_uops_0_lrs2_rtype),
    .io_ren_uops_0_frs3_en(busytable_io_ren_uops_0_frs3_en),
    .io_ren_uops_0_fp_val(busytable_io_ren_uops_0_fp_val),
    .io_ren_uops_0_fp_single(busytable_io_ren_uops_0_fp_single),
    .io_ren_uops_0_xcpt_pf_if(busytable_io_ren_uops_0_xcpt_pf_if),
    .io_ren_uops_0_xcpt_ae_if(busytable_io_ren_uops_0_xcpt_ae_if),
    .io_ren_uops_0_xcpt_ma_if(busytable_io_ren_uops_0_xcpt_ma_if),
    .io_ren_uops_0_bp_debug_if(busytable_io_ren_uops_0_bp_debug_if),
    .io_ren_uops_0_bp_xcpt_if(busytable_io_ren_uops_0_bp_xcpt_if),
    .io_ren_uops_0_debug_fsrc(busytable_io_ren_uops_0_debug_fsrc),
    .io_ren_uops_0_debug_tsrc(busytable_io_ren_uops_0_debug_tsrc),
    .io_ren_uops_1_switch(busytable_io_ren_uops_1_switch),
    .io_ren_uops_1_switch_off(busytable_io_ren_uops_1_switch_off),
    .io_ren_uops_1_is_unicore(busytable_io_ren_uops_1_is_unicore),
    .io_ren_uops_1_shift(busytable_io_ren_uops_1_shift),
    .io_ren_uops_1_lrs3_rtype(busytable_io_ren_uops_1_lrs3_rtype),
    .io_ren_uops_1_rflag(busytable_io_ren_uops_1_rflag),
    .io_ren_uops_1_wflag(busytable_io_ren_uops_1_wflag),
    .io_ren_uops_1_prflag(busytable_io_ren_uops_1_prflag),
    .io_ren_uops_1_pwflag(busytable_io_ren_uops_1_pwflag),
    .io_ren_uops_1_pflag_busy(busytable_io_ren_uops_1_pflag_busy),
    .io_ren_uops_1_stale_pflag(busytable_io_ren_uops_1_stale_pflag),
    .io_ren_uops_1_op1_sel(busytable_io_ren_uops_1_op1_sel),
    .io_ren_uops_1_op2_sel(busytable_io_ren_uops_1_op2_sel),
    .io_ren_uops_1_split_num(busytable_io_ren_uops_1_split_num),
    .io_ren_uops_1_self_index(busytable_io_ren_uops_1_self_index),
    .io_ren_uops_1_rob_inst_idx(busytable_io_ren_uops_1_rob_inst_idx),
    .io_ren_uops_1_address_num(busytable_io_ren_uops_1_address_num),
    .io_ren_uops_1_uopc(busytable_io_ren_uops_1_uopc),
    .io_ren_uops_1_inst(busytable_io_ren_uops_1_inst),
    .io_ren_uops_1_debug_inst(busytable_io_ren_uops_1_debug_inst),
    .io_ren_uops_1_is_rvc(busytable_io_ren_uops_1_is_rvc),
    .io_ren_uops_1_debug_pc(busytable_io_ren_uops_1_debug_pc),
    .io_ren_uops_1_iq_type(busytable_io_ren_uops_1_iq_type),
    .io_ren_uops_1_fu_code(busytable_io_ren_uops_1_fu_code),
    .io_ren_uops_1_ctrl_br_type(busytable_io_ren_uops_1_ctrl_br_type),
    .io_ren_uops_1_ctrl_op1_sel(busytable_io_ren_uops_1_ctrl_op1_sel),
    .io_ren_uops_1_ctrl_op2_sel(busytable_io_ren_uops_1_ctrl_op2_sel),
    .io_ren_uops_1_ctrl_imm_sel(busytable_io_ren_uops_1_ctrl_imm_sel),
    .io_ren_uops_1_ctrl_op_fcn(busytable_io_ren_uops_1_ctrl_op_fcn),
    .io_ren_uops_1_ctrl_fcn_dw(busytable_io_ren_uops_1_ctrl_fcn_dw),
    .io_ren_uops_1_ctrl_csr_cmd(busytable_io_ren_uops_1_ctrl_csr_cmd),
    .io_ren_uops_1_ctrl_is_load(busytable_io_ren_uops_1_ctrl_is_load),
    .io_ren_uops_1_ctrl_is_sta(busytable_io_ren_uops_1_ctrl_is_sta),
    .io_ren_uops_1_ctrl_is_std(busytable_io_ren_uops_1_ctrl_is_std),
    .io_ren_uops_1_ctrl_op3_sel(busytable_io_ren_uops_1_ctrl_op3_sel),
    .io_ren_uops_1_iw_state(busytable_io_ren_uops_1_iw_state),
    .io_ren_uops_1_iw_p1_poisoned(busytable_io_ren_uops_1_iw_p1_poisoned),
    .io_ren_uops_1_iw_p2_poisoned(busytable_io_ren_uops_1_iw_p2_poisoned),
    .io_ren_uops_1_is_br(busytable_io_ren_uops_1_is_br),
    .io_ren_uops_1_is_jalr(busytable_io_ren_uops_1_is_jalr),
    .io_ren_uops_1_is_jal(busytable_io_ren_uops_1_is_jal),
    .io_ren_uops_1_is_sfb(busytable_io_ren_uops_1_is_sfb),
    .io_ren_uops_1_br_mask(busytable_io_ren_uops_1_br_mask),
    .io_ren_uops_1_br_tag(busytable_io_ren_uops_1_br_tag),
    .io_ren_uops_1_ftq_idx(busytable_io_ren_uops_1_ftq_idx),
    .io_ren_uops_1_edge_inst(busytable_io_ren_uops_1_edge_inst),
    .io_ren_uops_1_pc_lob(busytable_io_ren_uops_1_pc_lob),
    .io_ren_uops_1_taken(busytable_io_ren_uops_1_taken),
    .io_ren_uops_1_imm_packed(busytable_io_ren_uops_1_imm_packed),
    .io_ren_uops_1_csr_addr(busytable_io_ren_uops_1_csr_addr),
    .io_ren_uops_1_rob_idx(busytable_io_ren_uops_1_rob_idx),
    .io_ren_uops_1_ldq_idx(busytable_io_ren_uops_1_ldq_idx),
    .io_ren_uops_1_stq_idx(busytable_io_ren_uops_1_stq_idx),
    .io_ren_uops_1_rxq_idx(busytable_io_ren_uops_1_rxq_idx),
    .io_ren_uops_1_pdst(busytable_io_ren_uops_1_pdst),
    .io_ren_uops_1_prs1(busytable_io_ren_uops_1_prs1),
    .io_ren_uops_1_prs2(busytable_io_ren_uops_1_prs2),
    .io_ren_uops_1_prs3(busytable_io_ren_uops_1_prs3),
    .io_ren_uops_1_ppred(busytable_io_ren_uops_1_ppred),
    .io_ren_uops_1_prs1_busy(busytable_io_ren_uops_1_prs1_busy),
    .io_ren_uops_1_prs2_busy(busytable_io_ren_uops_1_prs2_busy),
    .io_ren_uops_1_prs3_busy(busytable_io_ren_uops_1_prs3_busy),
    .io_ren_uops_1_ppred_busy(busytable_io_ren_uops_1_ppred_busy),
    .io_ren_uops_1_stale_pdst(busytable_io_ren_uops_1_stale_pdst),
    .io_ren_uops_1_exception(busytable_io_ren_uops_1_exception),
    .io_ren_uops_1_exc_cause(busytable_io_ren_uops_1_exc_cause),
    .io_ren_uops_1_bypassable(busytable_io_ren_uops_1_bypassable),
    .io_ren_uops_1_mem_cmd(busytable_io_ren_uops_1_mem_cmd),
    .io_ren_uops_1_mem_size(busytable_io_ren_uops_1_mem_size),
    .io_ren_uops_1_mem_signed(busytable_io_ren_uops_1_mem_signed),
    .io_ren_uops_1_is_fence(busytable_io_ren_uops_1_is_fence),
    .io_ren_uops_1_is_fencei(busytable_io_ren_uops_1_is_fencei),
    .io_ren_uops_1_is_amo(busytable_io_ren_uops_1_is_amo),
    .io_ren_uops_1_uses_ldq(busytable_io_ren_uops_1_uses_ldq),
    .io_ren_uops_1_uses_stq(busytable_io_ren_uops_1_uses_stq),
    .io_ren_uops_1_is_sys_pc2epc(busytable_io_ren_uops_1_is_sys_pc2epc),
    .io_ren_uops_1_is_unique(busytable_io_ren_uops_1_is_unique),
    .io_ren_uops_1_flush_on_commit(busytable_io_ren_uops_1_flush_on_commit),
    .io_ren_uops_1_ldst_is_rs1(busytable_io_ren_uops_1_ldst_is_rs1),
    .io_ren_uops_1_ldst(busytable_io_ren_uops_1_ldst),
    .io_ren_uops_1_lrs1(busytable_io_ren_uops_1_lrs1),
    .io_ren_uops_1_lrs2(busytable_io_ren_uops_1_lrs2),
    .io_ren_uops_1_lrs3(busytable_io_ren_uops_1_lrs3),
    .io_ren_uops_1_ldst_val(busytable_io_ren_uops_1_ldst_val),
    .io_ren_uops_1_dst_rtype(busytable_io_ren_uops_1_dst_rtype),
    .io_ren_uops_1_lrs1_rtype(busytable_io_ren_uops_1_lrs1_rtype),
    .io_ren_uops_1_lrs2_rtype(busytable_io_ren_uops_1_lrs2_rtype),
    .io_ren_uops_1_frs3_en(busytable_io_ren_uops_1_frs3_en),
    .io_ren_uops_1_fp_val(busytable_io_ren_uops_1_fp_val),
    .io_ren_uops_1_fp_single(busytable_io_ren_uops_1_fp_single),
    .io_ren_uops_1_xcpt_pf_if(busytable_io_ren_uops_1_xcpt_pf_if),
    .io_ren_uops_1_xcpt_ae_if(busytable_io_ren_uops_1_xcpt_ae_if),
    .io_ren_uops_1_xcpt_ma_if(busytable_io_ren_uops_1_xcpt_ma_if),
    .io_ren_uops_1_bp_debug_if(busytable_io_ren_uops_1_bp_debug_if),
    .io_ren_uops_1_bp_xcpt_if(busytable_io_ren_uops_1_bp_xcpt_if),
    .io_ren_uops_1_debug_fsrc(busytable_io_ren_uops_1_debug_fsrc),
    .io_ren_uops_1_debug_tsrc(busytable_io_ren_uops_1_debug_tsrc),
    .io_busy_resps_0_prs1_busy(busytable_io_busy_resps_0_prs1_busy),
    .io_busy_resps_0_prs2_busy(busytable_io_busy_resps_0_prs2_busy),
    .io_busy_resps_0_prs3_busy(busytable_io_busy_resps_0_prs3_busy),
    .io_busy_resps_1_prs1_busy(busytable_io_busy_resps_1_prs1_busy),
    .io_busy_resps_1_prs2_busy(busytable_io_busy_resps_1_prs2_busy),
    .io_busy_resps_1_prs3_busy(busytable_io_busy_resps_1_prs3_busy),
    .io_rebusy_reqs_0(busytable_io_rebusy_reqs_0),
    .io_rebusy_reqs_1(busytable_io_rebusy_reqs_1),
    .io_wb_pdsts_0(busytable_io_wb_pdsts_0),
    .io_wb_pdsts_1(busytable_io_wb_pdsts_1),
    .io_wb_pdsts_2(busytable_io_wb_pdsts_2),
    .io_wb_pdsts_3(busytable_io_wb_pdsts_3),
    .io_wb_pdsts_4(busytable_io_wb_pdsts_4),
    .io_wb_valids_0(busytable_io_wb_valids_0),
    .io_wb_valids_1(busytable_io_wb_valids_1),
    .io_wb_valids_2(busytable_io_wb_valids_2),
    .io_wb_valids_3(busytable_io_wb_valids_3),
    .io_wb_valids_4(busytable_io_wb_valids_4),
    .io_is_unicore(busytable_io_is_unicore),
    .io_debug_busytable(busytable_io_debug_busytable)
  );
  assign io_ren_stalls_0 = _T_142 & ~freelist_io_alloc_pregs_0_valid; // @[rename-stage.scala 356:60]
  assign io_ren_stalls_1 = _T_155 & ~freelist_io_alloc_pregs_1_valid; // @[rename-stage.scala 356:60]
  assign io_ren2_mask_0 = REG; // @[rename-stage.scala 108:29 rename-stage.scala 140:20]
  assign io_ren2_mask_1 = REG_2; // @[rename-stage.scala 108:29 rename-stage.scala 140:20]
  assign io_ren2_uops_0_switch = REG_1_switch; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_switch_off = REG_1_switch_off; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_is_unicore = REG_1_is_unicore; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_shift = REG_1_shift; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_lrs3_rtype = REG_1_lrs3_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_rflag = REG_1_rflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_wflag = REG_1_wflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_prflag = REG_1_prflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_pwflag = REG_1_pwflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_pflag_busy = REG_1_pflag_busy; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_stale_pflag = REG_1_stale_pflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_op1_sel = REG_1_op1_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_op2_sel = REG_1_op2_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_split_num = REG_1_split_num; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_self_index = REG_1_self_index; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_rob_inst_idx = REG_1_rob_inst_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_address_num = REG_1_address_num; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_uopc = REG_1_uopc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_inst = REG_1_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_debug_inst = REG_1_debug_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_is_rvc = REG_1_is_rvc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_debug_pc = REG_1_debug_pc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_iq_type = REG_1_iq_type; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_fu_code = REG_1_fu_code; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ctrl_br_type = REG_1_ctrl_br_type; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ctrl_op1_sel = REG_1_ctrl_op1_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ctrl_op2_sel = REG_1_ctrl_op2_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ctrl_imm_sel = REG_1_ctrl_imm_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ctrl_op_fcn = REG_1_ctrl_op_fcn; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ctrl_fcn_dw = REG_1_ctrl_fcn_dw; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ctrl_csr_cmd = REG_1_ctrl_csr_cmd; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ctrl_is_load = REG_1_ctrl_is_load; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ctrl_is_sta = REG_1_ctrl_is_sta; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ctrl_is_std = REG_1_ctrl_is_std; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ctrl_op3_sel = REG_1_ctrl_op3_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_iw_state = REG_1_iw_state; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_iw_p1_poisoned = REG_1_iw_p1_poisoned; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_iw_p2_poisoned = REG_1_iw_p2_poisoned; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_is_br = REG_1_is_br; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_is_jalr = REG_1_is_jalr; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_is_jal = REG_1_is_jal; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_is_sfb = REG_1_is_sfb; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_br_mask = REG_1_br_mask & _T_69; // @[util.scala 131:35]
  assign io_ren2_uops_0_br_tag = REG_1_br_tag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ftq_idx = REG_1_ftq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_edge_inst = REG_1_edge_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_pc_lob = REG_1_pc_lob; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_taken = REG_1_taken; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_imm_packed = REG_1_imm_packed; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_csr_addr = REG_1_csr_addr; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_rob_idx = REG_1_rob_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ldq_idx = REG_1_ldq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_stq_idx = REG_1_stq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_rxq_idx = REG_1_rxq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_pdst = REG_1_ldst != 6'h0 | io_is_unicore ? freelist_io_alloc_pregs_0_bits : 7'h0; // @[rename-stage.scala 321:20]
  assign io_ren2_uops_0_prs1 = REG_1_prs1; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_prs2 = REG_1_prs2; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_prs3 = REG_1_prs3; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ppred = REG_1_ppred; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_prs1_busy = REG_1_lrs1_rtype == 2'h0 & busytable_io_busy_resps_0_prs1_busy; // @[rename-stage.scala 338:47]
  assign io_ren2_uops_0_prs2_busy = REG_1_lrs2_rtype == 2'h0 & busytable_io_busy_resps_0_prs2_busy; // @[rename-stage.scala 339:47]
  assign io_ren2_uops_0_prs3_busy = io_is_unicore ? REG_1_lrs3_rtype == 2'h0 & busytable_io_busy_resps_0_prs3_busy :
    REG_1_frs3_en & busytable_io_busy_resps_0_prs3_busy; // @[rename-stage.scala 341:25]
  assign io_ren2_uops_0_ppred_busy = REG_1_ppred_busy; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_stale_pdst = REG_1_stale_pdst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_exception = REG_1_exception; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_exc_cause = REG_1_exc_cause; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_bypassable = REG_1_bypassable; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_mem_cmd = REG_1_mem_cmd; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_mem_size = REG_1_mem_size; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_mem_signed = REG_1_mem_signed; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_is_fence = REG_1_is_fence; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_is_fencei = REG_1_is_fencei; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_is_amo = REG_1_is_amo; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_uses_ldq = REG_1_uses_ldq; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_uses_stq = REG_1_uses_stq; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_is_sys_pc2epc = REG_1_is_sys_pc2epc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_is_unique = REG_1_is_unique; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_flush_on_commit = REG_1_flush_on_commit; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ldst_is_rs1 = REG_1_ldst_is_rs1; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ldst = REG_1_ldst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_lrs1 = REG_1_lrs1; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_lrs2 = REG_1_lrs2; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_lrs3 = REG_1_lrs3; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_ldst_val = REG_1_ldst_val; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_dst_rtype = REG_1_dst_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_lrs1_rtype = REG_1_lrs1_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_lrs2_rtype = REG_1_lrs2_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_frs3_en = REG_1_frs3_en; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_fp_val = REG_1_fp_val; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_fp_single = REG_1_fp_single; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_xcpt_pf_if = REG_1_xcpt_pf_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_xcpt_ae_if = REG_1_xcpt_ae_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_xcpt_ma_if = REG_1_xcpt_ma_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_bp_debug_if = REG_1_bp_debug_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_bp_xcpt_if = REG_1_bp_xcpt_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_debug_fsrc = REG_1_debug_fsrc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_0_debug_tsrc = REG_1_debug_tsrc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_switch = REG_3_switch; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_switch_off = REG_3_switch_off; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_is_unicore = REG_3_is_unicore; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_shift = REG_3_shift; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_lrs3_rtype = REG_3_lrs3_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_rflag = REG_3_rflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_wflag = REG_3_wflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_prflag = REG_3_prflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_pwflag = REG_3_pwflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_pflag_busy = REG_3_pflag_busy; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_stale_pflag = REG_3_stale_pflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_op1_sel = REG_3_op1_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_op2_sel = REG_3_op2_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_split_num = REG_3_split_num; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_self_index = REG_3_self_index; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_rob_inst_idx = REG_3_rob_inst_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_address_num = REG_3_address_num; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_uopc = REG_3_uopc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_inst = REG_3_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_debug_inst = REG_3_debug_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_is_rvc = REG_3_is_rvc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_debug_pc = REG_3_debug_pc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_iq_type = REG_3_iq_type; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_fu_code = REG_3_fu_code; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ctrl_br_type = REG_3_ctrl_br_type; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ctrl_op1_sel = REG_3_ctrl_op1_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ctrl_op2_sel = REG_3_ctrl_op2_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ctrl_imm_sel = REG_3_ctrl_imm_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ctrl_op_fcn = REG_3_ctrl_op_fcn; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ctrl_fcn_dw = REG_3_ctrl_fcn_dw; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ctrl_csr_cmd = REG_3_ctrl_csr_cmd; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ctrl_is_load = REG_3_ctrl_is_load; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ctrl_is_sta = REG_3_ctrl_is_sta; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ctrl_is_std = REG_3_ctrl_is_std; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ctrl_op3_sel = REG_3_ctrl_op3_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_iw_state = REG_3_iw_state; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_iw_p1_poisoned = REG_3_iw_p1_poisoned; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_iw_p2_poisoned = REG_3_iw_p2_poisoned; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_is_br = REG_3_is_br; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_is_jalr = REG_3_is_jalr; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_is_jal = REG_3_is_jal; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_is_sfb = REG_3_is_sfb; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_br_mask = REG_3_br_mask & _T_69; // @[util.scala 131:35]
  assign io_ren2_uops_1_br_tag = REG_3_br_tag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ftq_idx = REG_3_ftq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_edge_inst = REG_3_edge_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_pc_lob = REG_3_pc_lob; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_taken = REG_3_taken; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_imm_packed = REG_3_imm_packed; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_csr_addr = REG_3_csr_addr; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_rob_idx = REG_3_rob_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ldq_idx = REG_3_ldq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_stq_idx = REG_3_stq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_rxq_idx = REG_3_rxq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_pdst = REG_3_ldst != 6'h0 | io_is_unicore ? freelist_io_alloc_pregs_1_bits : 7'h0; // @[rename-stage.scala 321:20]
  assign io_ren2_uops_1_prs1 = enc_8 ? ren2_uops_0_pdst : REG_3_prs1; // @[rename-stage.scala 200:26 rename-stage.scala 200:52 rename-stage.scala 176:18]
  assign io_ren2_uops_1_prs2 = enc_9 ? ren2_uops_0_pdst : REG_3_prs2; // @[rename-stage.scala 201:26 rename-stage.scala 201:52 rename-stage.scala 176:18]
  assign io_ren2_uops_1_prs3 = enc_10 ? _T_309 : REG_3_prs3; // @[rename-stage.scala 203:26 rename-stage.scala 203:47 rename-stage.scala 176:18]
  assign io_ren2_uops_1_ppred = REG_3_ppred; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_prs1_busy = ren2_uops_1_prs1_busy | enc_8; // @[rename-stage.scala 206:45]
  assign io_ren2_uops_1_prs2_busy = ren2_uops_1_prs2_busy | enc_9; // @[rename-stage.scala 207:45]
  assign io_ren2_uops_1_prs3_busy = _T_53 ? 1'h0 : ren2_uops_1_prs3_busy | enc_10; // @[rename-stage.scala 208:34]
  assign io_ren2_uops_1_ppred_busy = REG_3_ppred_busy; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_stale_pdst = enc_11 ? ren2_uops_0_pdst : REG_3_stale_pdst; // @[rename-stage.scala 204:26 rename-stage.scala 204:52 rename-stage.scala 176:18]
  assign io_ren2_uops_1_exception = REG_3_exception; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_exc_cause = REG_3_exc_cause; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_bypassable = REG_3_bypassable; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_mem_cmd = REG_3_mem_cmd; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_mem_size = REG_3_mem_size; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_mem_signed = REG_3_mem_signed; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_is_fence = REG_3_is_fence; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_is_fencei = REG_3_is_fencei; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_is_amo = REG_3_is_amo; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_uses_ldq = REG_3_uses_ldq; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_uses_stq = REG_3_uses_stq; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_is_sys_pc2epc = REG_3_is_sys_pc2epc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_is_unique = REG_3_is_unique; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_flush_on_commit = REG_3_flush_on_commit; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ldst_is_rs1 = REG_3_ldst_is_rs1; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ldst = REG_3_ldst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_lrs1 = REG_3_lrs1; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_lrs2 = REG_3_lrs2; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_lrs3 = REG_3_lrs3; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_ldst_val = REG_3_ldst_val; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_dst_rtype = REG_3_dst_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_lrs1_rtype = REG_3_lrs1_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_lrs2_rtype = REG_3_lrs2_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_frs3_en = REG_3_frs3_en; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_fp_val = REG_3_fp_val; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_fp_single = REG_3_fp_single; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_xcpt_pf_if = REG_3_xcpt_pf_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_xcpt_ae_if = REG_3_xcpt_ae_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_xcpt_ma_if = REG_3_xcpt_ma_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_bp_debug_if = REG_3_bp_debug_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_bp_xcpt_if = REG_3_bp_xcpt_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_debug_fsrc = REG_3_debug_fsrc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_ren2_uops_1_debug_tsrc = REG_3_debug_tsrc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign io_debug_freelist = freelist_io_debug_freelist; // @[rename-stage.scala 368:22]
  assign io_debug_isprlist = freelist_io_debug_isprlist; // @[rename-stage.scala 369:22]
  assign io_debug_busytable = busytable_io_debug_busytable; // @[rename-stage.scala 370:22]
  assign maptable_clock = clock;
  assign maptable_reset = reset;
  assign maptable_io_map_reqs_0_lrs1 = io_dec_uops_0_lrs1; // @[rename-stage.scala 102:29 rename-stage.scala 118:27]
  assign maptable_io_map_reqs_0_lrs2 = io_dec_uops_0_lrs2; // @[rename-stage.scala 102:29 rename-stage.scala 118:27]
  assign maptable_io_map_reqs_0_lrs3 = io_dec_uops_0_lrs3; // @[rename-stage.scala 102:29 rename-stage.scala 118:27]
  assign maptable_io_map_reqs_0_ldst = io_dec_uops_0_ldst; // @[rename-stage.scala 102:29 rename-stage.scala 118:27]
  assign maptable_io_map_reqs_1_lrs1 = io_dec_uops_1_lrs1; // @[rename-stage.scala 102:29 rename-stage.scala 118:27]
  assign maptable_io_map_reqs_1_lrs2 = io_dec_uops_1_lrs2; // @[rename-stage.scala 102:29 rename-stage.scala 118:27]
  assign maptable_io_map_reqs_1_lrs3 = io_dec_uops_1_lrs3; // @[rename-stage.scala 102:29 rename-stage.scala 118:27]
  assign maptable_io_map_reqs_1_ldst = io_dec_uops_1_ldst; // @[rename-stage.scala 102:29 rename-stage.scala 118:27]
  assign maptable_io_remap_reqs_0_ldst = io_rollback ? io_com_uops_1_ldst : REG_1_ldst; // @[rename-stage.scala 256:30]
  assign maptable_io_remap_reqs_0_pdst = io_rollback ? io_com_uops_1_stale_pdst : ren2_uops_0_pdst; // @[rename-stage.scala 257:30]
  assign maptable_io_remap_reqs_0_valid = ren2_alloc_reqs_0 | rbk_valids_1; // @[rename-stage.scala 260:38]
  assign maptable_io_remap_reqs_1_ldst = io_rollback ? io_com_uops_0_ldst : REG_3_ldst; // @[rename-stage.scala 256:30]
  assign maptable_io_remap_reqs_1_pdst = io_rollback ? io_com_uops_0_stale_pdst : ren2_uops_1_pdst; // @[rename-stage.scala 257:30]
  assign maptable_io_remap_reqs_1_valid = ren2_alloc_reqs_1 | rbk_valids_0; // @[rename-stage.scala 260:38]
  assign maptable_io_ren_br_tags_0_valid = io_dis_fire_0 & _T_147; // @[rename-stage.scala 235:43]
  assign maptable_io_ren_br_tags_0_bits = REG_1_br_tag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign maptable_io_ren_br_tags_1_valid = io_dis_fire_1 & _T_160; // @[rename-stage.scala 235:43]
  assign maptable_io_ren_br_tags_1_bits = REG_3_br_tag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign maptable_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_switch = io_brupdate_b2_uop_switch; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_switch_off = io_brupdate_b2_uop_switch_off; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_is_unicore = io_brupdate_b2_uop_is_unicore; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_shift = io_brupdate_b2_uop_shift; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_lrs3_rtype = io_brupdate_b2_uop_lrs3_rtype; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_rflag = io_brupdate_b2_uop_rflag; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_wflag = io_brupdate_b2_uop_wflag; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_prflag = io_brupdate_b2_uop_prflag; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_pwflag = io_brupdate_b2_uop_pwflag; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_pflag_busy = io_brupdate_b2_uop_pflag_busy; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_stale_pflag = io_brupdate_b2_uop_stale_pflag; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_op1_sel = io_brupdate_b2_uop_op1_sel; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_op2_sel = io_brupdate_b2_uop_op2_sel; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_split_num = io_brupdate_b2_uop_split_num; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_self_index = io_brupdate_b2_uop_self_index; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_rob_inst_idx = io_brupdate_b2_uop_rob_inst_idx; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_address_num = io_brupdate_b2_uop_address_num; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ctrl_op3_sel = io_brupdate_b2_uop_ctrl_op3_sel; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[rename-stage.scala 286:29]
  assign maptable_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[rename-stage.scala 286:29]
  assign maptable_io_rollback = io_rollback; // @[rename-stage.scala 287:27]
  assign maptable_io_is_unicore = io_is_unicore; // @[rename-stage.scala 223:26]
  assign freelist_clock = clock;
  assign freelist_reset = reset;
  assign freelist_io_reqs_0 = REG_1_ldst_val & REG_1_dst_rtype == 2'h0 & io_dis_fire_0; // @[rename-stage.scala 234:88]
  assign freelist_io_reqs_1 = REG_3_ldst_val & REG_3_dst_rtype == 2'h0 & io_dis_fire_1; // @[rename-stage.scala 234:88]
  assign freelist_io_dealloc_pregs_0_valid = com_valids_0 | rbk_valids_0; // @[rename-stage.scala 307:37]
  assign freelist_io_dealloc_pregs_0_bits = io_rollback ? io_com_uops_0_pdst : io_com_uops_0_stale_pdst; // @[rename-stage.scala 309:33]
  assign freelist_io_dealloc_pregs_1_valid = com_valids_1 | rbk_valids_1; // @[rename-stage.scala 307:37]
  assign freelist_io_dealloc_pregs_1_bits = io_rollback ? io_com_uops_1_pdst : io_com_uops_1_stale_pdst; // @[rename-stage.scala 309:33]
  assign freelist_io_ren_br_tags_0_valid = io_dis_fire_0 & _T_147; // @[rename-stage.scala 235:43]
  assign freelist_io_ren_br_tags_0_bits = REG_1_br_tag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign freelist_io_ren_br_tags_1_valid = io_dis_fire_1 & _T_160; // @[rename-stage.scala 235:43]
  assign freelist_io_ren_br_tags_1_bits = REG_3_br_tag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign freelist_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_switch = io_brupdate_b2_uop_switch; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_switch_off = io_brupdate_b2_uop_switch_off; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_is_unicore = io_brupdate_b2_uop_is_unicore; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_shift = io_brupdate_b2_uop_shift; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_lrs3_rtype = io_brupdate_b2_uop_lrs3_rtype; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_rflag = io_brupdate_b2_uop_rflag; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_wflag = io_brupdate_b2_uop_wflag; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_prflag = io_brupdate_b2_uop_prflag; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_pwflag = io_brupdate_b2_uop_pwflag; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_pflag_busy = io_brupdate_b2_uop_pflag_busy; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_stale_pflag = io_brupdate_b2_uop_stale_pflag; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_op1_sel = io_brupdate_b2_uop_op1_sel; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_op2_sel = io_brupdate_b2_uop_op2_sel; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_split_num = io_brupdate_b2_uop_split_num; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_self_index = io_brupdate_b2_uop_self_index; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_rob_inst_idx = io_brupdate_b2_uop_rob_inst_idx; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_address_num = io_brupdate_b2_uop_address_num; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ctrl_op3_sel = io_brupdate_b2_uop_ctrl_op3_sel; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[rename-stage.scala 311:24]
  assign freelist_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[rename-stage.scala 311:24]
  assign freelist_io_is_print = io_is_unicore; // @[rename-stage.scala 225:23]
  assign freelist_io_debug_pipeline_empty = io_debug_rob_empty; // @[rename-stage.scala 312:36]
  assign busytable_clock = clock;
  assign busytable_reset = reset;
  assign busytable_io_ren_uops_0_switch = REG_1_switch; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_switch_off = REG_1_switch_off; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_is_unicore = REG_1_is_unicore; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_shift = REG_1_shift; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_lrs3_rtype = REG_1_lrs3_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_rflag = REG_1_rflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_wflag = REG_1_wflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_prflag = REG_1_prflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_pwflag = REG_1_pwflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_pflag_busy = REG_1_pflag_busy; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_stale_pflag = REG_1_stale_pflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_op1_sel = REG_1_op1_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_op2_sel = REG_1_op2_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_split_num = REG_1_split_num; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_self_index = REG_1_self_index; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_rob_inst_idx = REG_1_rob_inst_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_address_num = REG_1_address_num; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_uopc = REG_1_uopc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_inst = REG_1_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_debug_inst = REG_1_debug_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_is_rvc = REG_1_is_rvc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_debug_pc = REG_1_debug_pc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_iq_type = REG_1_iq_type; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_fu_code = REG_1_fu_code; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ctrl_br_type = REG_1_ctrl_br_type; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ctrl_op1_sel = REG_1_ctrl_op1_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ctrl_op2_sel = REG_1_ctrl_op2_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ctrl_imm_sel = REG_1_ctrl_imm_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ctrl_op_fcn = REG_1_ctrl_op_fcn; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ctrl_fcn_dw = REG_1_ctrl_fcn_dw; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ctrl_csr_cmd = REG_1_ctrl_csr_cmd; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ctrl_is_load = REG_1_ctrl_is_load; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ctrl_is_sta = REG_1_ctrl_is_sta; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ctrl_is_std = REG_1_ctrl_is_std; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ctrl_op3_sel = REG_1_ctrl_op3_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_iw_state = REG_1_iw_state; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_iw_p1_poisoned = REG_1_iw_p1_poisoned; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_iw_p2_poisoned = REG_1_iw_p2_poisoned; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_is_br = REG_1_is_br; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_is_jalr = REG_1_is_jalr; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_is_jal = REG_1_is_jal; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_is_sfb = REG_1_is_sfb; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_br_mask = REG_1_br_mask; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_br_tag = REG_1_br_tag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ftq_idx = REG_1_ftq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_edge_inst = REG_1_edge_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_pc_lob = REG_1_pc_lob; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_taken = REG_1_taken; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_imm_packed = REG_1_imm_packed; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_csr_addr = REG_1_csr_addr; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_rob_idx = REG_1_rob_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ldq_idx = REG_1_ldq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_stq_idx = REG_1_stq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_rxq_idx = REG_1_rxq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_pdst = REG_1_ldst != 6'h0 | io_is_unicore ? freelist_io_alloc_pregs_0_bits : 7'h0; // @[rename-stage.scala 321:20]
  assign busytable_io_ren_uops_0_prs1 = REG_1_prs1; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_prs2 = REG_1_prs2; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_prs3 = REG_1_prs3; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ppred = REG_1_ppred; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_prs1_busy = REG_1_lrs1_rtype == 2'h0 & busytable_io_busy_resps_0_prs1_busy; // @[rename-stage.scala 338:47]
  assign busytable_io_ren_uops_0_prs2_busy = REG_1_lrs2_rtype == 2'h0 & busytable_io_busy_resps_0_prs2_busy; // @[rename-stage.scala 339:47]
  assign busytable_io_ren_uops_0_prs3_busy = io_is_unicore ? REG_1_lrs3_rtype == 2'h0 &
    busytable_io_busy_resps_0_prs3_busy : REG_1_frs3_en & busytable_io_busy_resps_0_prs3_busy; // @[rename-stage.scala 341:25]
  assign busytable_io_ren_uops_0_ppred_busy = REG_1_ppred_busy; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_stale_pdst = REG_1_stale_pdst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_exception = REG_1_exception; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_exc_cause = REG_1_exc_cause; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_bypassable = REG_1_bypassable; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_mem_cmd = REG_1_mem_cmd; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_mem_size = REG_1_mem_size; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_mem_signed = REG_1_mem_signed; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_is_fence = REG_1_is_fence; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_is_fencei = REG_1_is_fencei; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_is_amo = REG_1_is_amo; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_uses_ldq = REG_1_uses_ldq; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_uses_stq = REG_1_uses_stq; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_is_sys_pc2epc = REG_1_is_sys_pc2epc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_is_unique = REG_1_is_unique; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_flush_on_commit = REG_1_flush_on_commit; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ldst_is_rs1 = REG_1_ldst_is_rs1; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ldst = REG_1_ldst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_lrs1 = REG_1_lrs1; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_lrs2 = REG_1_lrs2; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_lrs3 = REG_1_lrs3; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_ldst_val = REG_1_ldst_val; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_dst_rtype = REG_1_dst_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_lrs1_rtype = REG_1_lrs1_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_lrs2_rtype = REG_1_lrs2_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_frs3_en = REG_1_frs3_en; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_fp_val = REG_1_fp_val; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_fp_single = REG_1_fp_single; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_xcpt_pf_if = REG_1_xcpt_pf_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_xcpt_ae_if = REG_1_xcpt_ae_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_xcpt_ma_if = REG_1_xcpt_ma_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_bp_debug_if = REG_1_bp_debug_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_bp_xcpt_if = REG_1_bp_xcpt_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_debug_fsrc = REG_1_debug_fsrc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_0_debug_tsrc = REG_1_debug_tsrc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_switch = REG_3_switch; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_switch_off = REG_3_switch_off; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_is_unicore = REG_3_is_unicore; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_shift = REG_3_shift; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_lrs3_rtype = REG_3_lrs3_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_rflag = REG_3_rflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_wflag = REG_3_wflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_prflag = REG_3_prflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_pwflag = REG_3_pwflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_pflag_busy = REG_3_pflag_busy; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_stale_pflag = REG_3_stale_pflag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_op1_sel = REG_3_op1_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_op2_sel = REG_3_op2_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_split_num = REG_3_split_num; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_self_index = REG_3_self_index; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_rob_inst_idx = REG_3_rob_inst_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_address_num = REG_3_address_num; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_uopc = REG_3_uopc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_inst = REG_3_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_debug_inst = REG_3_debug_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_is_rvc = REG_3_is_rvc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_debug_pc = REG_3_debug_pc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_iq_type = REG_3_iq_type; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_fu_code = REG_3_fu_code; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ctrl_br_type = REG_3_ctrl_br_type; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ctrl_op1_sel = REG_3_ctrl_op1_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ctrl_op2_sel = REG_3_ctrl_op2_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ctrl_imm_sel = REG_3_ctrl_imm_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ctrl_op_fcn = REG_3_ctrl_op_fcn; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ctrl_fcn_dw = REG_3_ctrl_fcn_dw; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ctrl_csr_cmd = REG_3_ctrl_csr_cmd; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ctrl_is_load = REG_3_ctrl_is_load; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ctrl_is_sta = REG_3_ctrl_is_sta; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ctrl_is_std = REG_3_ctrl_is_std; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ctrl_op3_sel = REG_3_ctrl_op3_sel; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_iw_state = REG_3_iw_state; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_iw_p1_poisoned = REG_3_iw_p1_poisoned; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_iw_p2_poisoned = REG_3_iw_p2_poisoned; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_is_br = REG_3_is_br; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_is_jalr = REG_3_is_jalr; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_is_jal = REG_3_is_jal; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_is_sfb = REG_3_is_sfb; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_br_mask = REG_3_br_mask; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_br_tag = REG_3_br_tag; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ftq_idx = REG_3_ftq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_edge_inst = REG_3_edge_inst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_pc_lob = REG_3_pc_lob; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_taken = REG_3_taken; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_imm_packed = REG_3_imm_packed; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_csr_addr = REG_3_csr_addr; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_rob_idx = REG_3_rob_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ldq_idx = REG_3_ldq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_stq_idx = REG_3_stq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_rxq_idx = REG_3_rxq_idx; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_pdst = REG_3_ldst != 6'h0 | io_is_unicore ? freelist_io_alloc_pregs_1_bits : 7'h0; // @[rename-stage.scala 321:20]
  assign busytable_io_ren_uops_1_prs1 = REG_3_prs1; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_prs2 = REG_3_prs2; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_prs3 = REG_3_prs3; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ppred = REG_3_ppred; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_prs1_busy = REG_3_lrs1_rtype == 2'h0 & busytable_io_busy_resps_1_prs1_busy; // @[rename-stage.scala 338:47]
  assign busytable_io_ren_uops_1_prs2_busy = REG_3_lrs2_rtype == 2'h0 & busytable_io_busy_resps_1_prs2_busy; // @[rename-stage.scala 339:47]
  assign busytable_io_ren_uops_1_prs3_busy = io_is_unicore ? REG_3_lrs3_rtype == 2'h0 &
    busytable_io_busy_resps_1_prs3_busy : REG_3_frs3_en & busytable_io_busy_resps_1_prs3_busy; // @[rename-stage.scala 341:25]
  assign busytable_io_ren_uops_1_ppred_busy = REG_3_ppred_busy; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_stale_pdst = REG_3_stale_pdst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_exception = REG_3_exception; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_exc_cause = REG_3_exc_cause; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_bypassable = REG_3_bypassable; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_mem_cmd = REG_3_mem_cmd; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_mem_size = REG_3_mem_size; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_mem_signed = REG_3_mem_signed; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_is_fence = REG_3_is_fence; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_is_fencei = REG_3_is_fencei; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_is_amo = REG_3_is_amo; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_uses_ldq = REG_3_uses_ldq; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_uses_stq = REG_3_uses_stq; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_is_sys_pc2epc = REG_3_is_sys_pc2epc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_is_unique = REG_3_is_unique; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_flush_on_commit = REG_3_flush_on_commit; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ldst_is_rs1 = REG_3_ldst_is_rs1; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ldst = REG_3_ldst; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_lrs1 = REG_3_lrs1; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_lrs2 = REG_3_lrs2; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_lrs3 = REG_3_lrs3; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_ldst_val = REG_3_ldst_val; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_dst_rtype = REG_3_dst_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_lrs1_rtype = REG_3_lrs1_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_lrs2_rtype = REG_3_lrs2_rtype; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_frs3_en = REG_3_frs3_en; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_fp_val = REG_3_fp_val; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_fp_single = REG_3_fp_single; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_xcpt_pf_if = REG_3_xcpt_pf_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_xcpt_ae_if = REG_3_xcpt_ae_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_xcpt_ma_if = REG_3_xcpt_ma_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_bp_debug_if = REG_3_bp_debug_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_bp_xcpt_if = REG_3_bp_xcpt_if; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_debug_fsrc = REG_3_debug_fsrc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_ren_uops_1_debug_tsrc = REG_3_debug_tsrc; // @[rename-stage.scala 109:29 rename-stage.scala 141:20]
  assign busytable_io_rebusy_reqs_0 = REG_1_ldst_val & REG_1_dst_rtype == 2'h0 & io_dis_fire_0; // @[rename-stage.scala 234:88]
  assign busytable_io_rebusy_reqs_1 = REG_3_ldst_val & REG_3_dst_rtype == 2'h0 & io_dis_fire_1; // @[rename-stage.scala 234:88]
  assign busytable_io_wb_pdsts_0 = io_wakeups_0_bits_uop_pdst; // @[rename-stage.scala 330:25]
  assign busytable_io_wb_pdsts_1 = io_wakeups_1_bits_uop_pdst; // @[rename-stage.scala 330:25]
  assign busytable_io_wb_pdsts_2 = io_wakeups_2_bits_uop_pdst; // @[rename-stage.scala 330:25]
  assign busytable_io_wb_pdsts_3 = io_wakeups_3_bits_uop_pdst; // @[rename-stage.scala 330:25]
  assign busytable_io_wb_pdsts_4 = io_wakeups_4_bits_uop_pdst; // @[rename-stage.scala 330:25]
  assign busytable_io_wb_valids_0 = io_wakeups_0_valid & io_wakeups_0_bits_uop_dst_rtype == 2'h0; // @[rename-stage.scala 329:57]
  assign busytable_io_wb_valids_1 = io_wakeups_1_valid & io_wakeups_1_bits_uop_dst_rtype == 2'h0; // @[rename-stage.scala 329:57]
  assign busytable_io_wb_valids_2 = io_wakeups_2_valid & io_wakeups_2_bits_uop_dst_rtype == 2'h0; // @[rename-stage.scala 329:57]
  assign busytable_io_wb_valids_3 = io_wakeups_3_valid & io_wakeups_3_bits_uop_dst_rtype == 2'h0; // @[rename-stage.scala 329:57]
  assign busytable_io_wb_valids_4 = io_wakeups_4_valid & io_wakeups_4_bits_uop_dst_rtype == 2'h0; // @[rename-stage.scala 329:57]
  assign busytable_io_is_unicore = io_is_unicore; // @[rename-stage.scala 224:27]
  always @(posedge clock) begin
    if (reset) begin // @[rename-stage.scala 122:27]
      REG <= 1'h0; // @[rename-stage.scala 122:27]
    end else if (io_kill) begin // @[rename-stage.scala 128:20]
      REG <= 1'h0; // @[rename-stage.scala 129:15]
    end else if (io_dis_ready) begin // @[rename-stage.scala 130:30]
      REG <= io_dec_fire_0; // @[rename-stage.scala 131:15]
    end else begin
      REG <= REG & ~io_dis_fire_0; // @[rename-stage.scala 134:15]
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_switch <= io_dec_uops_0_switch; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_switch_off <= io_dec_uops_0_switch_off; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_is_unicore <= io_dec_uops_0_is_unicore; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_shift <= io_dec_uops_0_shift; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_lrs3_rtype <= io_dec_uops_0_lrs3_rtype; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_rflag <= io_dec_uops_0_rflag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_wflag <= io_dec_uops_0_wflag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_prflag <= io_dec_uops_0_prflag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_pwflag <= io_dec_uops_0_pwflag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_pflag_busy <= io_dec_uops_0_pflag_busy; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_stale_pflag <= io_dec_uops_0_stale_pflag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_op1_sel <= io_dec_uops_0_op1_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_op2_sel <= io_dec_uops_0_op2_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_split_num <= io_dec_uops_0_split_num; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_self_index <= io_dec_uops_0_self_index; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_rob_inst_idx <= io_dec_uops_0_rob_inst_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_address_num <= io_dec_uops_0_address_num; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_uopc <= io_dec_uops_0_uopc; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_inst <= io_dec_uops_0_inst; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_debug_inst <= io_dec_uops_0_debug_inst; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_is_rvc <= io_dec_uops_0_is_rvc; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_debug_pc <= io_dec_uops_0_debug_pc; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_iq_type <= io_dec_uops_0_iq_type; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_fu_code <= io_dec_uops_0_fu_code; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ctrl_br_type <= io_dec_uops_0_ctrl_br_type; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ctrl_op1_sel <= io_dec_uops_0_ctrl_op1_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ctrl_op2_sel <= io_dec_uops_0_ctrl_op2_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ctrl_imm_sel <= io_dec_uops_0_ctrl_imm_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ctrl_op_fcn <= io_dec_uops_0_ctrl_op_fcn; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ctrl_fcn_dw <= io_dec_uops_0_ctrl_fcn_dw; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ctrl_csr_cmd <= io_dec_uops_0_ctrl_csr_cmd; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ctrl_is_load <= io_dec_uops_0_ctrl_is_load; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ctrl_is_sta <= io_dec_uops_0_ctrl_is_sta; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ctrl_is_std <= io_dec_uops_0_ctrl_is_std; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ctrl_op3_sel <= io_dec_uops_0_ctrl_op3_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_iw_state <= io_dec_uops_0_iw_state; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_iw_p1_poisoned <= io_dec_uops_0_iw_p1_poisoned; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_iw_p2_poisoned <= io_dec_uops_0_iw_p2_poisoned; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_is_br <= io_dec_uops_0_is_br; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_is_jalr <= io_dec_uops_0_is_jalr; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_is_jal <= io_dec_uops_0_is_jal; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_is_sfb <= io_dec_uops_0_is_sfb; // @[rename-stage.scala 132:16]
      end
    end
    REG_1_br_mask <= _GEN_153 & _T_69; // @[util.scala 131:35]
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_br_tag <= io_dec_uops_0_br_tag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ftq_idx <= io_dec_uops_0_ftq_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_edge_inst <= io_dec_uops_0_edge_inst; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_pc_lob <= io_dec_uops_0_pc_lob; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_taken <= io_dec_uops_0_taken; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_imm_packed <= io_dec_uops_0_imm_packed; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_csr_addr <= io_dec_uops_0_csr_addr; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_rob_idx <= io_dec_uops_0_rob_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ldq_idx <= io_dec_uops_0_ldq_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_stq_idx <= io_dec_uops_0_stq_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_rxq_idx <= io_dec_uops_0_rxq_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (_T_42) begin // @[rename-stage.scala 200:26]
      REG_1_prs1 <= _T_48; // @[rename-stage.scala 200:52]
    end else if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_prs1 <= ren1_uops_0_prs1; // @[rename-stage.scala 132:16]
      end
    end
    if (_T_43) begin // @[rename-stage.scala 201:26]
      REG_1_prs2 <= _T_51; // @[rename-stage.scala 201:52]
    end else if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_prs2 <= ren1_uops_0_prs2; // @[rename-stage.scala 132:16]
      end
    end
    if (_T_44) begin // @[rename-stage.scala 203:26]
      if (~io_is_unicore) begin // @[rename-stage.scala 203:53]
        REG_1_prs3 <= 7'h0;
      end else begin
        REG_1_prs3 <= _T_57;
      end
    end else if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_prs3 <= ren1_uops_0_prs3; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ppred <= io_dec_uops_0_ppred; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ppred_busy <= io_dec_uops_0_ppred_busy; // @[rename-stage.scala 132:16]
      end
    end
    if (_T_45) begin // @[rename-stage.scala 204:26]
      REG_1_stale_pdst <= _T_61; // @[rename-stage.scala 204:52]
    end else if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_stale_pdst <= ren1_uops_0_stale_pdst; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_exception <= io_dec_uops_0_exception; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_exc_cause <= io_dec_uops_0_exc_cause; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_bypassable <= io_dec_uops_0_bypassable; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_mem_cmd <= io_dec_uops_0_mem_cmd; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_mem_size <= io_dec_uops_0_mem_size; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_mem_signed <= io_dec_uops_0_mem_signed; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_is_fence <= io_dec_uops_0_is_fence; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_is_fencei <= io_dec_uops_0_is_fencei; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_is_amo <= io_dec_uops_0_is_amo; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_uses_ldq <= io_dec_uops_0_uses_ldq; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_uses_stq <= io_dec_uops_0_uses_stq; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_is_sys_pc2epc <= io_dec_uops_0_is_sys_pc2epc; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_is_unique <= io_dec_uops_0_is_unique; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_flush_on_commit <= io_dec_uops_0_flush_on_commit; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ldst_is_rs1 <= io_dec_uops_0_ldst_is_rs1; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ldst <= io_dec_uops_0_ldst; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_lrs1 <= io_dec_uops_0_lrs1; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_lrs2 <= io_dec_uops_0_lrs2; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_lrs3 <= io_dec_uops_0_lrs3; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_ldst_val <= io_dec_uops_0_ldst_val; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_dst_rtype <= io_dec_uops_0_dst_rtype; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_lrs1_rtype <= io_dec_uops_0_lrs1_rtype; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_lrs2_rtype <= io_dec_uops_0_lrs2_rtype; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_frs3_en <= io_dec_uops_0_frs3_en; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_fp_val <= io_dec_uops_0_fp_val; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_fp_single <= io_dec_uops_0_fp_single; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_xcpt_pf_if <= io_dec_uops_0_xcpt_pf_if; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_xcpt_ae_if <= io_dec_uops_0_xcpt_ae_if; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_xcpt_ma_if <= io_dec_uops_0_xcpt_ma_if; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_bp_debug_if <= io_dec_uops_0_bp_debug_if; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_bp_xcpt_if <= io_dec_uops_0_bp_xcpt_if; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_debug_fsrc <= io_dec_uops_0_debug_fsrc; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_1_debug_tsrc <= io_dec_uops_0_debug_tsrc; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ldst <= io_dec_uops_1_ldst; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ldst_val <= io_dec_uops_1_ldst_val; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_dst_rtype <= io_dec_uops_1_dst_rtype; // @[rename-stage.scala 132:16]
      end
    end
    if (reset) begin // @[rename-stage.scala 122:27]
      REG_2 <= 1'h0; // @[rename-stage.scala 122:27]
    end else if (io_kill) begin // @[rename-stage.scala 128:20]
      REG_2 <= 1'h0; // @[rename-stage.scala 129:15]
    end else if (io_dis_ready) begin // @[rename-stage.scala 130:30]
      REG_2 <= io_dec_fire_1; // @[rename-stage.scala 131:15]
    end else begin
      REG_2 <= REG_2 & ~io_dis_fire_1; // @[rename-stage.scala 134:15]
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_switch <= io_dec_uops_1_switch; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_switch_off <= io_dec_uops_1_switch_off; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_is_unicore <= io_dec_uops_1_is_unicore; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_shift <= io_dec_uops_1_shift; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_lrs3_rtype <= io_dec_uops_1_lrs3_rtype; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_rflag <= io_dec_uops_1_rflag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_wflag <= io_dec_uops_1_wflag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_prflag <= io_dec_uops_1_prflag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_pwflag <= io_dec_uops_1_pwflag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_pflag_busy <= io_dec_uops_1_pflag_busy; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_stale_pflag <= io_dec_uops_1_stale_pflag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_op1_sel <= io_dec_uops_1_op1_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_op2_sel <= io_dec_uops_1_op2_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_split_num <= io_dec_uops_1_split_num; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_self_index <= io_dec_uops_1_self_index; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_rob_inst_idx <= io_dec_uops_1_rob_inst_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_address_num <= io_dec_uops_1_address_num; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_uopc <= io_dec_uops_1_uopc; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_inst <= io_dec_uops_1_inst; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_debug_inst <= io_dec_uops_1_debug_inst; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_is_rvc <= io_dec_uops_1_is_rvc; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_debug_pc <= io_dec_uops_1_debug_pc; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_iq_type <= io_dec_uops_1_iq_type; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_fu_code <= io_dec_uops_1_fu_code; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ctrl_br_type <= io_dec_uops_1_ctrl_br_type; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ctrl_op1_sel <= io_dec_uops_1_ctrl_op1_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ctrl_op2_sel <= io_dec_uops_1_ctrl_op2_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ctrl_imm_sel <= io_dec_uops_1_ctrl_imm_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ctrl_op_fcn <= io_dec_uops_1_ctrl_op_fcn; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ctrl_fcn_dw <= io_dec_uops_1_ctrl_fcn_dw; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ctrl_csr_cmd <= io_dec_uops_1_ctrl_csr_cmd; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ctrl_is_load <= io_dec_uops_1_ctrl_is_load; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ctrl_is_sta <= io_dec_uops_1_ctrl_is_sta; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ctrl_is_std <= io_dec_uops_1_ctrl_is_std; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ctrl_op3_sel <= io_dec_uops_1_ctrl_op3_sel; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_iw_state <= io_dec_uops_1_iw_state; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_iw_p1_poisoned <= io_dec_uops_1_iw_p1_poisoned; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_iw_p2_poisoned <= io_dec_uops_1_iw_p2_poisoned; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_is_br <= io_dec_uops_1_is_br; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_is_jalr <= io_dec_uops_1_is_jalr; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_is_jal <= io_dec_uops_1_is_jal; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_is_sfb <= io_dec_uops_1_is_sfb; // @[rename-stage.scala 132:16]
      end
    end
    REG_3_br_mask <= _GEN_353 & _T_69; // @[util.scala 131:35]
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_br_tag <= io_dec_uops_1_br_tag; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ftq_idx <= io_dec_uops_1_ftq_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_edge_inst <= io_dec_uops_1_edge_inst; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_pc_lob <= io_dec_uops_1_pc_lob; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_taken <= io_dec_uops_1_taken; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_imm_packed <= io_dec_uops_1_imm_packed; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_csr_addr <= io_dec_uops_1_csr_addr; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_rob_idx <= io_dec_uops_1_rob_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ldq_idx <= io_dec_uops_1_ldq_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_stq_idx <= io_dec_uops_1_stq_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_rxq_idx <= io_dec_uops_1_rxq_idx; // @[rename-stage.scala 132:16]
      end
    end
    if (_T_113) begin // @[rename-stage.scala 200:26]
      REG_3_prs1 <= _T_119; // @[rename-stage.scala 200:52]
    end else if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_prs1 <= ren1_uops_1_prs1; // @[rename-stage.scala 132:16]
      end
    end
    if (_T_114) begin // @[rename-stage.scala 201:26]
      REG_3_prs2 <= _T_122; // @[rename-stage.scala 201:52]
    end else if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_prs2 <= ren1_uops_1_prs2; // @[rename-stage.scala 132:16]
      end
    end
    if (_T_115) begin // @[rename-stage.scala 203:26]
      if (~io_is_unicore) begin // @[rename-stage.scala 203:53]
        REG_3_prs3 <= 7'h0;
      end else begin
        REG_3_prs3 <= _T_128;
      end
    end else if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_prs3 <= ren1_uops_1_prs3; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ppred <= io_dec_uops_1_ppred; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ppred_busy <= io_dec_uops_1_ppred_busy; // @[rename-stage.scala 132:16]
      end
    end
    if (_T_116) begin // @[rename-stage.scala 204:26]
      REG_3_stale_pdst <= _T_132; // @[rename-stage.scala 204:52]
    end else if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_stale_pdst <= ren1_uops_1_stale_pdst; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_exception <= io_dec_uops_1_exception; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_exc_cause <= io_dec_uops_1_exc_cause; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_bypassable <= io_dec_uops_1_bypassable; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_mem_cmd <= io_dec_uops_1_mem_cmd; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_mem_size <= io_dec_uops_1_mem_size; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_mem_signed <= io_dec_uops_1_mem_signed; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_is_fence <= io_dec_uops_1_is_fence; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_is_fencei <= io_dec_uops_1_is_fencei; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_is_amo <= io_dec_uops_1_is_amo; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_uses_ldq <= io_dec_uops_1_uses_ldq; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_uses_stq <= io_dec_uops_1_uses_stq; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_is_sys_pc2epc <= io_dec_uops_1_is_sys_pc2epc; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_is_unique <= io_dec_uops_1_is_unique; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_flush_on_commit <= io_dec_uops_1_flush_on_commit; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_ldst_is_rs1 <= io_dec_uops_1_ldst_is_rs1; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_lrs1 <= io_dec_uops_1_lrs1; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_lrs2 <= io_dec_uops_1_lrs2; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_lrs3 <= io_dec_uops_1_lrs3; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_lrs1_rtype <= io_dec_uops_1_lrs1_rtype; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_lrs2_rtype <= io_dec_uops_1_lrs2_rtype; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_frs3_en <= io_dec_uops_1_frs3_en; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_fp_val <= io_dec_uops_1_fp_val; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_fp_single <= io_dec_uops_1_fp_single; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_xcpt_pf_if <= io_dec_uops_1_xcpt_pf_if; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_xcpt_ae_if <= io_dec_uops_1_xcpt_ae_if; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_xcpt_ma_if <= io_dec_uops_1_xcpt_ma_if; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_bp_debug_if <= io_dec_uops_1_bp_debug_if; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_bp_xcpt_if <= io_dec_uops_1_bp_xcpt_if; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_debug_fsrc <= io_dec_uops_1_debug_fsrc; // @[rename-stage.scala 132:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 128:20]
      if (io_dis_ready) begin // @[rename-stage.scala 130:30]
        REG_3_debug_tsrc <= io_dec_uops_1_debug_tsrc; // @[rename-stage.scala 132:16]
      end
    end
    if (reset) begin // @[Counters.scala 45:37]
      value_lo <= 5'h0; // @[Counters.scala 45:37]
    end else begin
      value_lo <= nextSmall[4:0];
    end
    if (reset) begin // @[Counters.scala 50:27]
      value_hi <= 27'h0; // @[Counters.scala 50:27]
    end else if (nextSmall[5]) begin // @[Counters.scala 51:46]
      value_hi <= _large_r_T_1; // @[Counters.scala 51:50]
    end
    if (reset) begin // @[Counters.scala 45:37]
      value_lo_1 <= 5'h0; // @[Counters.scala 45:37]
    end else begin
      value_lo_1 <= nextSmall_1[4:0];
    end
    if (reset) begin // @[Counters.scala 50:27]
      value_hi_1 <= 27'h0; // @[Counters.scala 50:27]
    end else if (nextSmall_1[5]) begin // @[Counters.scala 51:46]
      value_hi_1 <= _large_r_T_3; // @[Counters.scala 51:50]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_is_unicore & io_rollback & rbk_valids_0 & ~reset) begin
          $fwrite(32'h80000002,
            "{\"module\":\"RenameStage\",\"source\":\"rename-stage.scala:275\",\"cycle\":%d,\"type\":\"[Pipeline--Rename]: Rollback Remap stale_pdst\",\"pc\":\"0x%x\",\"inst\":\"0x%x\",\"split_num\":%d,\"self_index\":%d,\"uopc\":%d,\"ldst\":%d,\"pdst\":%d,\"stale-pdst\":%d}\n"
            ,value,io_com_uops_0_debug_pc,io_com_uops_0_inst,io_com_uops_0_split_num,io_com_uops_0_self_index,
            io_com_uops_0_uopc,io_com_uops_0_ldst,io_com_uops_0_pdst,io_com_uops_0_stale_pdst); // @[logging.scala 34:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_is_unicore & io_rollback & rbk_valids_1 & ~reset) begin
          $fwrite(32'h80000002,
            "{\"module\":\"RenameStage\",\"source\":\"rename-stage.scala:275\",\"cycle\":%d,\"type\":\"[Pipeline--Rename]: Rollback Remap stale_pdst\",\"pc\":\"0x%x\",\"inst\":\"0x%x\",\"split_num\":%d,\"self_index\":%d,\"uopc\":%d,\"ldst\":%d,\"pdst\":%d,\"stale-pdst\":%d}\n"
            ,value_1,io_com_uops_1_debug_pc,io_com_uops_1_inst,io_com_uops_1_split_num,io_com_uops_1_self_index,
            io_com_uops_1_uopc,io_com_uops_1_ldst,io_com_uops_1_pdst,io_com_uops_1_stale_pdst); // @[logging.scala 34:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~((~ren2_alloc_reqs_0 | freelist_io_alloc_pregs_0_bits != 7'h0 | freelist_io_alloc_pregs_0_bits == 7'h0 &
          io_is_unicore) & (~ren2_alloc_reqs_1 | freelist_io_alloc_pregs_1_bits != 7'h0 | freelist_io_alloc_pregs_1_bits
           == 7'h0 & io_is_unicore) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [rename-stage] A uop is trying to allocate the zero physical register.\n    at rename-stage.scala:314 assert (ren2_alloc_reqs zip freelist.io.alloc_pregs map {case (r,p) => !r || p.bits =/= 0.U || (p.bits === 0.U && io.is_unicore)} reduce (_&&_),\n"
            ); // @[rename-stage.scala 314:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~((~ren2_alloc_reqs_0 | freelist_io_alloc_pregs_0_bits != 7'h0 | freelist_io_alloc_pregs_0_bits == 7'h0 &
          io_is_unicore) & (~ren2_alloc_reqs_1 | freelist_io_alloc_pregs_1_bits != 7'h0 | freelist_io_alloc_pregs_1_bits
           == 7'h0 & io_is_unicore) | reset)) begin
          $fatal; // @[rename-stage.scala 314:10]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(REG & busytable_io_busy_resps_0_prs1_busy & REG_1_lrs1 == 6'h0 & _T_53) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:345 assert (!(valid && busy.prs1_busy && rtype === RT_FIX && uop.lrs1 === 0.U && !io.is_unicore), \"[rename] x0 is busy??\")\n"
            ); // @[rename-stage.scala 345:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(REG & busytable_io_busy_resps_0_prs1_busy & REG_1_lrs1 == 6'h0 & _T_53) | reset)) begin
          $fatal; // @[rename-stage.scala 345:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(REG & busytable_io_busy_resps_0_prs2_busy & REG_1_lrs2 == 6'h0 & _T_53) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:346 assert (!(valid && busy.prs2_busy && rtype === RT_FIX && uop.lrs2 === 0.U && !io.is_unicore), \"[rename] x0 is busy??\")\n"
            ); // @[rename-stage.scala 346:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(REG & busytable_io_busy_resps_0_prs2_busy & REG_1_lrs2 == 6'h0 & _T_53) | reset)) begin
          $fatal; // @[rename-stage.scala 346:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(REG_2 & busytable_io_busy_resps_1_prs1_busy & REG_3_lrs1 == 6'h0 & _T_53) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:345 assert (!(valid && busy.prs1_busy && rtype === RT_FIX && uop.lrs1 === 0.U && !io.is_unicore), \"[rename] x0 is busy??\")\n"
            ); // @[rename-stage.scala 345:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(REG_2 & busytable_io_busy_resps_1_prs1_busy & REG_3_lrs1 == 6'h0 & _T_53) | reset)) begin
          $fatal; // @[rename-stage.scala 345:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(REG_2 & busytable_io_busy_resps_1_prs2_busy & REG_3_lrs2 == 6'h0 & _T_53) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:346 assert (!(valid && busy.prs2_busy && rtype === RT_FIX && uop.lrs2 === 0.U && !io.is_unicore), \"[rename] x0 is busy??\")\n"
            ); // @[rename-stage.scala 346:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(REG_2 & busytable_io_busy_resps_1_prs2_busy & REG_3_lrs2 == 6'h0 & _T_53) | reset)) begin
          $fatal; // @[rename-stage.scala 346:12]
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
  REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  REG_1_switch = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  REG_1_switch_off = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG_1_is_unicore = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  REG_1_shift = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  REG_1_lrs3_rtype = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  REG_1_rflag = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  REG_1_wflag = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  REG_1_prflag = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  REG_1_pwflag = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  REG_1_pflag_busy = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  REG_1_stale_pflag = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  REG_1_op1_sel = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  REG_1_op2_sel = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  REG_1_split_num = _RAND_14[5:0];
  _RAND_15 = {1{`RANDOM}};
  REG_1_self_index = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  REG_1_rob_inst_idx = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  REG_1_address_num = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  REG_1_uopc = _RAND_18[6:0];
  _RAND_19 = {1{`RANDOM}};
  REG_1_inst = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  REG_1_debug_inst = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  REG_1_is_rvc = _RAND_21[0:0];
  _RAND_22 = {2{`RANDOM}};
  REG_1_debug_pc = _RAND_22[39:0];
  _RAND_23 = {1{`RANDOM}};
  REG_1_iq_type = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  REG_1_fu_code = _RAND_24[9:0];
  _RAND_25 = {1{`RANDOM}};
  REG_1_ctrl_br_type = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  REG_1_ctrl_op1_sel = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  REG_1_ctrl_op2_sel = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  REG_1_ctrl_imm_sel = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  REG_1_ctrl_op_fcn = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  REG_1_ctrl_fcn_dw = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  REG_1_ctrl_csr_cmd = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  REG_1_ctrl_is_load = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  REG_1_ctrl_is_sta = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  REG_1_ctrl_is_std = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  REG_1_ctrl_op3_sel = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  REG_1_iw_state = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  REG_1_iw_p1_poisoned = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  REG_1_iw_p2_poisoned = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  REG_1_is_br = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  REG_1_is_jalr = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  REG_1_is_jal = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  REG_1_is_sfb = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  REG_1_br_mask = _RAND_43[11:0];
  _RAND_44 = {1{`RANDOM}};
  REG_1_br_tag = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  REG_1_ftq_idx = _RAND_45[4:0];
  _RAND_46 = {1{`RANDOM}};
  REG_1_edge_inst = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  REG_1_pc_lob = _RAND_47[5:0];
  _RAND_48 = {1{`RANDOM}};
  REG_1_taken = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  REG_1_imm_packed = _RAND_49[19:0];
  _RAND_50 = {1{`RANDOM}};
  REG_1_csr_addr = _RAND_50[11:0];
  _RAND_51 = {1{`RANDOM}};
  REG_1_rob_idx = _RAND_51[5:0];
  _RAND_52 = {1{`RANDOM}};
  REG_1_ldq_idx = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  REG_1_stq_idx = _RAND_53[4:0];
  _RAND_54 = {1{`RANDOM}};
  REG_1_rxq_idx = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  REG_1_prs1 = _RAND_55[6:0];
  _RAND_56 = {1{`RANDOM}};
  REG_1_prs2 = _RAND_56[6:0];
  _RAND_57 = {1{`RANDOM}};
  REG_1_prs3 = _RAND_57[6:0];
  _RAND_58 = {1{`RANDOM}};
  REG_1_ppred = _RAND_58[4:0];
  _RAND_59 = {1{`RANDOM}};
  REG_1_ppred_busy = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  REG_1_stale_pdst = _RAND_60[6:0];
  _RAND_61 = {1{`RANDOM}};
  REG_1_exception = _RAND_61[0:0];
  _RAND_62 = {2{`RANDOM}};
  REG_1_exc_cause = _RAND_62[63:0];
  _RAND_63 = {1{`RANDOM}};
  REG_1_bypassable = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  REG_1_mem_cmd = _RAND_64[4:0];
  _RAND_65 = {1{`RANDOM}};
  REG_1_mem_size = _RAND_65[1:0];
  _RAND_66 = {1{`RANDOM}};
  REG_1_mem_signed = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  REG_1_is_fence = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  REG_1_is_fencei = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  REG_1_is_amo = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  REG_1_uses_ldq = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  REG_1_uses_stq = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  REG_1_is_sys_pc2epc = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  REG_1_is_unique = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  REG_1_flush_on_commit = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  REG_1_ldst_is_rs1 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  REG_1_ldst = _RAND_76[5:0];
  _RAND_77 = {1{`RANDOM}};
  REG_1_lrs1 = _RAND_77[5:0];
  _RAND_78 = {1{`RANDOM}};
  REG_1_lrs2 = _RAND_78[5:0];
  _RAND_79 = {1{`RANDOM}};
  REG_1_lrs3 = _RAND_79[5:0];
  _RAND_80 = {1{`RANDOM}};
  REG_1_ldst_val = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  REG_1_dst_rtype = _RAND_81[1:0];
  _RAND_82 = {1{`RANDOM}};
  REG_1_lrs1_rtype = _RAND_82[1:0];
  _RAND_83 = {1{`RANDOM}};
  REG_1_lrs2_rtype = _RAND_83[1:0];
  _RAND_84 = {1{`RANDOM}};
  REG_1_frs3_en = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  REG_1_fp_val = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  REG_1_fp_single = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  REG_1_xcpt_pf_if = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  REG_1_xcpt_ae_if = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  REG_1_xcpt_ma_if = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  REG_1_bp_debug_if = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  REG_1_bp_xcpt_if = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  REG_1_debug_fsrc = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  REG_1_debug_tsrc = _RAND_93[1:0];
  _RAND_94 = {1{`RANDOM}};
  REG_3_ldst = _RAND_94[5:0];
  _RAND_95 = {1{`RANDOM}};
  REG_3_ldst_val = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  REG_3_dst_rtype = _RAND_96[1:0];
  _RAND_97 = {1{`RANDOM}};
  REG_2 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  REG_3_switch = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  REG_3_switch_off = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  REG_3_is_unicore = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  REG_3_shift = _RAND_101[2:0];
  _RAND_102 = {1{`RANDOM}};
  REG_3_lrs3_rtype = _RAND_102[1:0];
  _RAND_103 = {1{`RANDOM}};
  REG_3_rflag = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  REG_3_wflag = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  REG_3_prflag = _RAND_105[3:0];
  _RAND_106 = {1{`RANDOM}};
  REG_3_pwflag = _RAND_106[3:0];
  _RAND_107 = {1{`RANDOM}};
  REG_3_pflag_busy = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  REG_3_stale_pflag = _RAND_108[3:0];
  _RAND_109 = {1{`RANDOM}};
  REG_3_op1_sel = _RAND_109[3:0];
  _RAND_110 = {1{`RANDOM}};
  REG_3_op2_sel = _RAND_110[3:0];
  _RAND_111 = {1{`RANDOM}};
  REG_3_split_num = _RAND_111[5:0];
  _RAND_112 = {1{`RANDOM}};
  REG_3_self_index = _RAND_112[5:0];
  _RAND_113 = {1{`RANDOM}};
  REG_3_rob_inst_idx = _RAND_113[5:0];
  _RAND_114 = {1{`RANDOM}};
  REG_3_address_num = _RAND_114[5:0];
  _RAND_115 = {1{`RANDOM}};
  REG_3_uopc = _RAND_115[6:0];
  _RAND_116 = {1{`RANDOM}};
  REG_3_inst = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  REG_3_debug_inst = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  REG_3_is_rvc = _RAND_118[0:0];
  _RAND_119 = {2{`RANDOM}};
  REG_3_debug_pc = _RAND_119[39:0];
  _RAND_120 = {1{`RANDOM}};
  REG_3_iq_type = _RAND_120[2:0];
  _RAND_121 = {1{`RANDOM}};
  REG_3_fu_code = _RAND_121[9:0];
  _RAND_122 = {1{`RANDOM}};
  REG_3_ctrl_br_type = _RAND_122[3:0];
  _RAND_123 = {1{`RANDOM}};
  REG_3_ctrl_op1_sel = _RAND_123[1:0];
  _RAND_124 = {1{`RANDOM}};
  REG_3_ctrl_op2_sel = _RAND_124[2:0];
  _RAND_125 = {1{`RANDOM}};
  REG_3_ctrl_imm_sel = _RAND_125[2:0];
  _RAND_126 = {1{`RANDOM}};
  REG_3_ctrl_op_fcn = _RAND_126[3:0];
  _RAND_127 = {1{`RANDOM}};
  REG_3_ctrl_fcn_dw = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  REG_3_ctrl_csr_cmd = _RAND_128[2:0];
  _RAND_129 = {1{`RANDOM}};
  REG_3_ctrl_is_load = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  REG_3_ctrl_is_sta = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  REG_3_ctrl_is_std = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  REG_3_ctrl_op3_sel = _RAND_132[1:0];
  _RAND_133 = {1{`RANDOM}};
  REG_3_iw_state = _RAND_133[1:0];
  _RAND_134 = {1{`RANDOM}};
  REG_3_iw_p1_poisoned = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  REG_3_iw_p2_poisoned = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  REG_3_is_br = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  REG_3_is_jalr = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  REG_3_is_jal = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  REG_3_is_sfb = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  REG_3_br_mask = _RAND_140[11:0];
  _RAND_141 = {1{`RANDOM}};
  REG_3_br_tag = _RAND_141[3:0];
  _RAND_142 = {1{`RANDOM}};
  REG_3_ftq_idx = _RAND_142[4:0];
  _RAND_143 = {1{`RANDOM}};
  REG_3_edge_inst = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  REG_3_pc_lob = _RAND_144[5:0];
  _RAND_145 = {1{`RANDOM}};
  REG_3_taken = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  REG_3_imm_packed = _RAND_146[19:0];
  _RAND_147 = {1{`RANDOM}};
  REG_3_csr_addr = _RAND_147[11:0];
  _RAND_148 = {1{`RANDOM}};
  REG_3_rob_idx = _RAND_148[5:0];
  _RAND_149 = {1{`RANDOM}};
  REG_3_ldq_idx = _RAND_149[4:0];
  _RAND_150 = {1{`RANDOM}};
  REG_3_stq_idx = _RAND_150[4:0];
  _RAND_151 = {1{`RANDOM}};
  REG_3_rxq_idx = _RAND_151[1:0];
  _RAND_152 = {1{`RANDOM}};
  REG_3_prs1 = _RAND_152[6:0];
  _RAND_153 = {1{`RANDOM}};
  REG_3_prs2 = _RAND_153[6:0];
  _RAND_154 = {1{`RANDOM}};
  REG_3_prs3 = _RAND_154[6:0];
  _RAND_155 = {1{`RANDOM}};
  REG_3_ppred = _RAND_155[4:0];
  _RAND_156 = {1{`RANDOM}};
  REG_3_ppred_busy = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  REG_3_stale_pdst = _RAND_157[6:0];
  _RAND_158 = {1{`RANDOM}};
  REG_3_exception = _RAND_158[0:0];
  _RAND_159 = {2{`RANDOM}};
  REG_3_exc_cause = _RAND_159[63:0];
  _RAND_160 = {1{`RANDOM}};
  REG_3_bypassable = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  REG_3_mem_cmd = _RAND_161[4:0];
  _RAND_162 = {1{`RANDOM}};
  REG_3_mem_size = _RAND_162[1:0];
  _RAND_163 = {1{`RANDOM}};
  REG_3_mem_signed = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  REG_3_is_fence = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  REG_3_is_fencei = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  REG_3_is_amo = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  REG_3_uses_ldq = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  REG_3_uses_stq = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  REG_3_is_sys_pc2epc = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  REG_3_is_unique = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  REG_3_flush_on_commit = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  REG_3_ldst_is_rs1 = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  REG_3_lrs1 = _RAND_173[5:0];
  _RAND_174 = {1{`RANDOM}};
  REG_3_lrs2 = _RAND_174[5:0];
  _RAND_175 = {1{`RANDOM}};
  REG_3_lrs3 = _RAND_175[5:0];
  _RAND_176 = {1{`RANDOM}};
  REG_3_lrs1_rtype = _RAND_176[1:0];
  _RAND_177 = {1{`RANDOM}};
  REG_3_lrs2_rtype = _RAND_177[1:0];
  _RAND_178 = {1{`RANDOM}};
  REG_3_frs3_en = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  REG_3_fp_val = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  REG_3_fp_single = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  REG_3_xcpt_pf_if = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  REG_3_xcpt_ae_if = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  REG_3_xcpt_ma_if = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  REG_3_bp_debug_if = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  REG_3_bp_xcpt_if = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  REG_3_debug_fsrc = _RAND_186[1:0];
  _RAND_187 = {1{`RANDOM}};
  REG_3_debug_tsrc = _RAND_187[1:0];
  _RAND_188 = {1{`RANDOM}};
  value_lo = _RAND_188[4:0];
  _RAND_189 = {1{`RANDOM}};
  value_hi = _RAND_189[26:0];
  _RAND_190 = {1{`RANDOM}};
  value_lo_1 = _RAND_190[4:0];
  _RAND_191 = {1{`RANDOM}};
  value_hi_1 = _RAND_191[26:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
