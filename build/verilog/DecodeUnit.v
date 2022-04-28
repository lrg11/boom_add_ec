module DecodeUnit(
  input         clock,
  input         reset,
  input         io_enq_uop_switch,
  input         io_enq_uop_switch_off,
  input         io_enq_uop_is_unicore,
  input  [2:0]  io_enq_uop_shift,
  input  [1:0]  io_enq_uop_lrs3_rtype,
  input         io_enq_uop_rflag,
  input         io_enq_uop_wflag,
  input  [3:0]  io_enq_uop_prflag,
  input  [3:0]  io_enq_uop_pwflag,
  input         io_enq_uop_pflag_busy,
  input  [3:0]  io_enq_uop_stale_pflag,
  input  [3:0]  io_enq_uop_op1_sel,
  input  [3:0]  io_enq_uop_op2_sel,
  input  [5:0]  io_enq_uop_split_num,
  input  [5:0]  io_enq_uop_self_index,
  input  [5:0]  io_enq_uop_rob_inst_idx,
  input  [5:0]  io_enq_uop_address_num,
  input  [6:0]  io_enq_uop_uopc,
  input  [31:0] io_enq_uop_inst,
  input  [31:0] io_enq_uop_debug_inst,
  input         io_enq_uop_is_rvc,
  input  [39:0] io_enq_uop_debug_pc,
  input  [2:0]  io_enq_uop_iq_type,
  input  [9:0]  io_enq_uop_fu_code,
  input  [3:0]  io_enq_uop_ctrl_br_type,
  input  [1:0]  io_enq_uop_ctrl_op1_sel,
  input  [2:0]  io_enq_uop_ctrl_op2_sel,
  input  [2:0]  io_enq_uop_ctrl_imm_sel,
  input  [3:0]  io_enq_uop_ctrl_op_fcn,
  input         io_enq_uop_ctrl_fcn_dw,
  input  [2:0]  io_enq_uop_ctrl_csr_cmd,
  input         io_enq_uop_ctrl_is_load,
  input         io_enq_uop_ctrl_is_sta,
  input         io_enq_uop_ctrl_is_std,
  input  [1:0]  io_enq_uop_ctrl_op3_sel,
  input  [1:0]  io_enq_uop_iw_state,
  input         io_enq_uop_iw_p1_poisoned,
  input         io_enq_uop_iw_p2_poisoned,
  input         io_enq_uop_is_br,
  input         io_enq_uop_is_jalr,
  input         io_enq_uop_is_jal,
  input         io_enq_uop_is_sfb,
  input  [11:0] io_enq_uop_br_mask,
  input  [3:0]  io_enq_uop_br_tag,
  input  [4:0]  io_enq_uop_ftq_idx,
  input         io_enq_uop_edge_inst,
  input  [5:0]  io_enq_uop_pc_lob,
  input         io_enq_uop_taken,
  input  [19:0] io_enq_uop_imm_packed,
  input  [11:0] io_enq_uop_csr_addr,
  input  [5:0]  io_enq_uop_rob_idx,
  input  [4:0]  io_enq_uop_ldq_idx,
  input  [4:0]  io_enq_uop_stq_idx,
  input  [1:0]  io_enq_uop_rxq_idx,
  input  [6:0]  io_enq_uop_pdst,
  input  [6:0]  io_enq_uop_prs1,
  input  [6:0]  io_enq_uop_prs2,
  input  [6:0]  io_enq_uop_prs3,
  input  [4:0]  io_enq_uop_ppred,
  input         io_enq_uop_prs1_busy,
  input         io_enq_uop_prs2_busy,
  input         io_enq_uop_prs3_busy,
  input         io_enq_uop_ppred_busy,
  input  [6:0]  io_enq_uop_stale_pdst,
  input         io_enq_uop_exception,
  input  [63:0] io_enq_uop_exc_cause,
  input         io_enq_uop_bypassable,
  input  [4:0]  io_enq_uop_mem_cmd,
  input  [1:0]  io_enq_uop_mem_size,
  input         io_enq_uop_mem_signed,
  input         io_enq_uop_is_fence,
  input         io_enq_uop_is_fencei,
  input         io_enq_uop_is_amo,
  input         io_enq_uop_uses_ldq,
  input         io_enq_uop_uses_stq,
  input         io_enq_uop_is_sys_pc2epc,
  input         io_enq_uop_is_unique,
  input         io_enq_uop_flush_on_commit,
  input         io_enq_uop_ldst_is_rs1,
  input  [5:0]  io_enq_uop_ldst,
  input  [5:0]  io_enq_uop_lrs1,
  input  [5:0]  io_enq_uop_lrs2,
  input  [5:0]  io_enq_uop_lrs3,
  input         io_enq_uop_ldst_val,
  input  [1:0]  io_enq_uop_dst_rtype,
  input  [1:0]  io_enq_uop_lrs1_rtype,
  input  [1:0]  io_enq_uop_lrs2_rtype,
  input         io_enq_uop_frs3_en,
  input         io_enq_uop_fp_val,
  input         io_enq_uop_fp_single,
  input         io_enq_uop_xcpt_pf_if,
  input         io_enq_uop_xcpt_ae_if,
  input         io_enq_uop_xcpt_ma_if,
  input         io_enq_uop_bp_debug_if,
  input         io_enq_uop_bp_xcpt_if,
  input  [1:0]  io_enq_uop_debug_fsrc,
  input  [1:0]  io_enq_uop_debug_tsrc,
  output        io_deq_uops_0_switch,
  output        io_deq_uops_0_switch_off,
  output        io_deq_uops_0_is_unicore,
  output [2:0]  io_deq_uops_0_shift,
  output [1:0]  io_deq_uops_0_lrs3_rtype,
  output        io_deq_uops_0_rflag,
  output        io_deq_uops_0_wflag,
  output [3:0]  io_deq_uops_0_prflag,
  output [3:0]  io_deq_uops_0_pwflag,
  output        io_deq_uops_0_pflag_busy,
  output [3:0]  io_deq_uops_0_stale_pflag,
  output [3:0]  io_deq_uops_0_op1_sel,
  output [3:0]  io_deq_uops_0_op2_sel,
  output [5:0]  io_deq_uops_0_split_num,
  output [5:0]  io_deq_uops_0_self_index,
  output [5:0]  io_deq_uops_0_rob_inst_idx,
  output [5:0]  io_deq_uops_0_address_num,
  output [6:0]  io_deq_uops_0_uopc,
  output [31:0] io_deq_uops_0_inst,
  output [31:0] io_deq_uops_0_debug_inst,
  output        io_deq_uops_0_is_rvc,
  output [39:0] io_deq_uops_0_debug_pc,
  output [2:0]  io_deq_uops_0_iq_type,
  output [9:0]  io_deq_uops_0_fu_code,
  output [3:0]  io_deq_uops_0_ctrl_br_type,
  output [1:0]  io_deq_uops_0_ctrl_op1_sel,
  output [2:0]  io_deq_uops_0_ctrl_op2_sel,
  output [2:0]  io_deq_uops_0_ctrl_imm_sel,
  output [3:0]  io_deq_uops_0_ctrl_op_fcn,
  output        io_deq_uops_0_ctrl_fcn_dw,
  output [2:0]  io_deq_uops_0_ctrl_csr_cmd,
  output        io_deq_uops_0_ctrl_is_load,
  output        io_deq_uops_0_ctrl_is_sta,
  output        io_deq_uops_0_ctrl_is_std,
  output [1:0]  io_deq_uops_0_ctrl_op3_sel,
  output [1:0]  io_deq_uops_0_iw_state,
  output        io_deq_uops_0_iw_p1_poisoned,
  output        io_deq_uops_0_iw_p2_poisoned,
  output        io_deq_uops_0_is_br,
  output        io_deq_uops_0_is_jalr,
  output        io_deq_uops_0_is_jal,
  output        io_deq_uops_0_is_sfb,
  output [11:0] io_deq_uops_0_br_mask,
  output [3:0]  io_deq_uops_0_br_tag,
  output [4:0]  io_deq_uops_0_ftq_idx,
  output        io_deq_uops_0_edge_inst,
  output [5:0]  io_deq_uops_0_pc_lob,
  output        io_deq_uops_0_taken,
  output [19:0] io_deq_uops_0_imm_packed,
  output [11:0] io_deq_uops_0_csr_addr,
  output [5:0]  io_deq_uops_0_rob_idx,
  output [4:0]  io_deq_uops_0_ldq_idx,
  output [4:0]  io_deq_uops_0_stq_idx,
  output [1:0]  io_deq_uops_0_rxq_idx,
  output [6:0]  io_deq_uops_0_pdst,
  output [6:0]  io_deq_uops_0_prs1,
  output [6:0]  io_deq_uops_0_prs2,
  output [6:0]  io_deq_uops_0_prs3,
  output [4:0]  io_deq_uops_0_ppred,
  output        io_deq_uops_0_prs1_busy,
  output        io_deq_uops_0_prs2_busy,
  output        io_deq_uops_0_prs3_busy,
  output        io_deq_uops_0_ppred_busy,
  output [6:0]  io_deq_uops_0_stale_pdst,
  output        io_deq_uops_0_exception,
  output [63:0] io_deq_uops_0_exc_cause,
  output        io_deq_uops_0_bypassable,
  output [4:0]  io_deq_uops_0_mem_cmd,
  output [1:0]  io_deq_uops_0_mem_size,
  output        io_deq_uops_0_mem_signed,
  output        io_deq_uops_0_is_fence,
  output        io_deq_uops_0_is_fencei,
  output        io_deq_uops_0_is_amo,
  output        io_deq_uops_0_uses_ldq,
  output        io_deq_uops_0_uses_stq,
  output        io_deq_uops_0_is_sys_pc2epc,
  output        io_deq_uops_0_is_unique,
  output        io_deq_uops_0_flush_on_commit,
  output        io_deq_uops_0_ldst_is_rs1,
  output [5:0]  io_deq_uops_0_ldst,
  output [5:0]  io_deq_uops_0_lrs1,
  output [5:0]  io_deq_uops_0_lrs2,
  output [5:0]  io_deq_uops_0_lrs3,
  output        io_deq_uops_0_ldst_val,
  output [1:0]  io_deq_uops_0_dst_rtype,
  output [1:0]  io_deq_uops_0_lrs1_rtype,
  output [1:0]  io_deq_uops_0_lrs2_rtype,
  output        io_deq_uops_0_frs3_en,
  output        io_deq_uops_0_fp_val,
  output        io_deq_uops_0_fp_single,
  output        io_deq_uops_0_xcpt_pf_if,
  output        io_deq_uops_0_xcpt_ae_if,
  output        io_deq_uops_0_xcpt_ma_if,
  output        io_deq_uops_0_bp_debug_if,
  output        io_deq_uops_0_bp_xcpt_if,
  output [1:0]  io_deq_uops_0_debug_fsrc,
  output [1:0]  io_deq_uops_0_debug_tsrc,
  output        io_deq_uops_1_switch,
  output        io_deq_uops_1_switch_off,
  output        io_deq_uops_1_is_unicore,
  output [2:0]  io_deq_uops_1_shift,
  output [1:0]  io_deq_uops_1_lrs3_rtype,
  output        io_deq_uops_1_rflag,
  output        io_deq_uops_1_wflag,
  output [3:0]  io_deq_uops_1_prflag,
  output [3:0]  io_deq_uops_1_pwflag,
  output        io_deq_uops_1_pflag_busy,
  output [3:0]  io_deq_uops_1_stale_pflag,
  output [3:0]  io_deq_uops_1_op1_sel,
  output [3:0]  io_deq_uops_1_op2_sel,
  output [5:0]  io_deq_uops_1_split_num,
  output [5:0]  io_deq_uops_1_self_index,
  output [5:0]  io_deq_uops_1_rob_inst_idx,
  output [5:0]  io_deq_uops_1_address_num,
  output [6:0]  io_deq_uops_1_uopc,
  output [31:0] io_deq_uops_1_inst,
  output [31:0] io_deq_uops_1_debug_inst,
  output        io_deq_uops_1_is_rvc,
  output [39:0] io_deq_uops_1_debug_pc,
  output [2:0]  io_deq_uops_1_iq_type,
  output [9:0]  io_deq_uops_1_fu_code,
  output [3:0]  io_deq_uops_1_ctrl_br_type,
  output [1:0]  io_deq_uops_1_ctrl_op1_sel,
  output [2:0]  io_deq_uops_1_ctrl_op2_sel,
  output [2:0]  io_deq_uops_1_ctrl_imm_sel,
  output [3:0]  io_deq_uops_1_ctrl_op_fcn,
  output        io_deq_uops_1_ctrl_fcn_dw,
  output [2:0]  io_deq_uops_1_ctrl_csr_cmd,
  output        io_deq_uops_1_ctrl_is_load,
  output        io_deq_uops_1_ctrl_is_sta,
  output        io_deq_uops_1_ctrl_is_std,
  output [1:0]  io_deq_uops_1_ctrl_op3_sel,
  output [1:0]  io_deq_uops_1_iw_state,
  output        io_deq_uops_1_iw_p1_poisoned,
  output        io_deq_uops_1_iw_p2_poisoned,
  output        io_deq_uops_1_is_br,
  output        io_deq_uops_1_is_jalr,
  output        io_deq_uops_1_is_jal,
  output        io_deq_uops_1_is_sfb,
  output [11:0] io_deq_uops_1_br_mask,
  output [3:0]  io_deq_uops_1_br_tag,
  output [4:0]  io_deq_uops_1_ftq_idx,
  output        io_deq_uops_1_edge_inst,
  output [5:0]  io_deq_uops_1_pc_lob,
  output        io_deq_uops_1_taken,
  output [19:0] io_deq_uops_1_imm_packed,
  output [11:0] io_deq_uops_1_csr_addr,
  output [5:0]  io_deq_uops_1_rob_idx,
  output [4:0]  io_deq_uops_1_ldq_idx,
  output [4:0]  io_deq_uops_1_stq_idx,
  output [1:0]  io_deq_uops_1_rxq_idx,
  output [6:0]  io_deq_uops_1_pdst,
  output [6:0]  io_deq_uops_1_prs1,
  output [6:0]  io_deq_uops_1_prs2,
  output [6:0]  io_deq_uops_1_prs3,
  output [4:0]  io_deq_uops_1_ppred,
  output        io_deq_uops_1_prs1_busy,
  output        io_deq_uops_1_prs2_busy,
  output        io_deq_uops_1_prs3_busy,
  output        io_deq_uops_1_ppred_busy,
  output [6:0]  io_deq_uops_1_stale_pdst,
  output        io_deq_uops_1_exception,
  output [63:0] io_deq_uops_1_exc_cause,
  output        io_deq_uops_1_bypassable,
  output [4:0]  io_deq_uops_1_mem_cmd,
  output [1:0]  io_deq_uops_1_mem_size,
  output        io_deq_uops_1_mem_signed,
  output        io_deq_uops_1_is_fence,
  output        io_deq_uops_1_is_fencei,
  output        io_deq_uops_1_is_amo,
  output        io_deq_uops_1_uses_ldq,
  output        io_deq_uops_1_uses_stq,
  output        io_deq_uops_1_is_sys_pc2epc,
  output        io_deq_uops_1_is_unique,
  output        io_deq_uops_1_flush_on_commit,
  output        io_deq_uops_1_ldst_is_rs1,
  output [5:0]  io_deq_uops_1_ldst,
  output [5:0]  io_deq_uops_1_lrs1,
  output [5:0]  io_deq_uops_1_lrs2,
  output [5:0]  io_deq_uops_1_lrs3,
  output        io_deq_uops_1_ldst_val,
  output [1:0]  io_deq_uops_1_dst_rtype,
  output [1:0]  io_deq_uops_1_lrs1_rtype,
  output [1:0]  io_deq_uops_1_lrs2_rtype,
  output        io_deq_uops_1_frs3_en,
  output        io_deq_uops_1_fp_val,
  output        io_deq_uops_1_fp_single,
  output        io_deq_uops_1_xcpt_pf_if,
  output        io_deq_uops_1_xcpt_ae_if,
  output        io_deq_uops_1_xcpt_ma_if,
  output        io_deq_uops_1_bp_debug_if,
  output        io_deq_uops_1_bp_xcpt_if,
  output [1:0]  io_deq_uops_1_debug_fsrc,
  output [1:0]  io_deq_uops_1_debug_tsrc,
  output        io_deq_uops_2_switch,
  output        io_deq_uops_2_switch_off,
  output        io_deq_uops_2_is_unicore,
  output [2:0]  io_deq_uops_2_shift,
  output [1:0]  io_deq_uops_2_lrs3_rtype,
  output        io_deq_uops_2_rflag,
  output        io_deq_uops_2_wflag,
  output [3:0]  io_deq_uops_2_prflag,
  output [3:0]  io_deq_uops_2_pwflag,
  output        io_deq_uops_2_pflag_busy,
  output [3:0]  io_deq_uops_2_stale_pflag,
  output [3:0]  io_deq_uops_2_op1_sel,
  output [3:0]  io_deq_uops_2_op2_sel,
  output [5:0]  io_deq_uops_2_split_num,
  output [5:0]  io_deq_uops_2_self_index,
  output [5:0]  io_deq_uops_2_rob_inst_idx,
  output [5:0]  io_deq_uops_2_address_num,
  output [6:0]  io_deq_uops_2_uopc,
  output [31:0] io_deq_uops_2_inst,
  output [31:0] io_deq_uops_2_debug_inst,
  output        io_deq_uops_2_is_rvc,
  output [39:0] io_deq_uops_2_debug_pc,
  output [2:0]  io_deq_uops_2_iq_type,
  output [9:0]  io_deq_uops_2_fu_code,
  output [3:0]  io_deq_uops_2_ctrl_br_type,
  output [1:0]  io_deq_uops_2_ctrl_op1_sel,
  output [2:0]  io_deq_uops_2_ctrl_op2_sel,
  output [2:0]  io_deq_uops_2_ctrl_imm_sel,
  output [3:0]  io_deq_uops_2_ctrl_op_fcn,
  output        io_deq_uops_2_ctrl_fcn_dw,
  output [2:0]  io_deq_uops_2_ctrl_csr_cmd,
  output        io_deq_uops_2_ctrl_is_load,
  output        io_deq_uops_2_ctrl_is_sta,
  output        io_deq_uops_2_ctrl_is_std,
  output [1:0]  io_deq_uops_2_ctrl_op3_sel,
  output [1:0]  io_deq_uops_2_iw_state,
  output        io_deq_uops_2_iw_p1_poisoned,
  output        io_deq_uops_2_iw_p2_poisoned,
  output        io_deq_uops_2_is_br,
  output        io_deq_uops_2_is_jalr,
  output        io_deq_uops_2_is_jal,
  output        io_deq_uops_2_is_sfb,
  output [11:0] io_deq_uops_2_br_mask,
  output [3:0]  io_deq_uops_2_br_tag,
  output [4:0]  io_deq_uops_2_ftq_idx,
  output        io_deq_uops_2_edge_inst,
  output [5:0]  io_deq_uops_2_pc_lob,
  output        io_deq_uops_2_taken,
  output [19:0] io_deq_uops_2_imm_packed,
  output [11:0] io_deq_uops_2_csr_addr,
  output [5:0]  io_deq_uops_2_rob_idx,
  output [4:0]  io_deq_uops_2_ldq_idx,
  output [4:0]  io_deq_uops_2_stq_idx,
  output [1:0]  io_deq_uops_2_rxq_idx,
  output [6:0]  io_deq_uops_2_pdst,
  output [6:0]  io_deq_uops_2_prs1,
  output [6:0]  io_deq_uops_2_prs2,
  output [6:0]  io_deq_uops_2_prs3,
  output [4:0]  io_deq_uops_2_ppred,
  output        io_deq_uops_2_prs1_busy,
  output        io_deq_uops_2_prs2_busy,
  output        io_deq_uops_2_prs3_busy,
  output        io_deq_uops_2_ppred_busy,
  output [6:0]  io_deq_uops_2_stale_pdst,
  output        io_deq_uops_2_exception,
  output [63:0] io_deq_uops_2_exc_cause,
  output        io_deq_uops_2_bypassable,
  output [4:0]  io_deq_uops_2_mem_cmd,
  output [1:0]  io_deq_uops_2_mem_size,
  output        io_deq_uops_2_mem_signed,
  output        io_deq_uops_2_is_fence,
  output        io_deq_uops_2_is_fencei,
  output        io_deq_uops_2_is_amo,
  output        io_deq_uops_2_uses_ldq,
  output        io_deq_uops_2_uses_stq,
  output        io_deq_uops_2_is_sys_pc2epc,
  output        io_deq_uops_2_is_unique,
  output        io_deq_uops_2_flush_on_commit,
  output        io_deq_uops_2_ldst_is_rs1,
  output [5:0]  io_deq_uops_2_ldst,
  output [5:0]  io_deq_uops_2_lrs1,
  output [5:0]  io_deq_uops_2_lrs2,
  output [5:0]  io_deq_uops_2_lrs3,
  output        io_deq_uops_2_ldst_val,
  output [1:0]  io_deq_uops_2_dst_rtype,
  output [1:0]  io_deq_uops_2_lrs1_rtype,
  output [1:0]  io_deq_uops_2_lrs2_rtype,
  output        io_deq_uops_2_frs3_en,
  output        io_deq_uops_2_fp_val,
  output        io_deq_uops_2_fp_single,
  output        io_deq_uops_2_xcpt_pf_if,
  output        io_deq_uops_2_xcpt_ae_if,
  output        io_deq_uops_2_xcpt_ma_if,
  output        io_deq_uops_2_bp_debug_if,
  output        io_deq_uops_2_bp_xcpt_if,
  output [1:0]  io_deq_uops_2_debug_fsrc,
  output [1:0]  io_deq_uops_2_debug_tsrc,
  output        io_deq_uops_3_switch,
  output        io_deq_uops_3_switch_off,
  output        io_deq_uops_3_is_unicore,
  output [2:0]  io_deq_uops_3_shift,
  output [1:0]  io_deq_uops_3_lrs3_rtype,
  output        io_deq_uops_3_rflag,
  output        io_deq_uops_3_wflag,
  output [3:0]  io_deq_uops_3_prflag,
  output [3:0]  io_deq_uops_3_pwflag,
  output        io_deq_uops_3_pflag_busy,
  output [3:0]  io_deq_uops_3_stale_pflag,
  output [3:0]  io_deq_uops_3_op1_sel,
  output [3:0]  io_deq_uops_3_op2_sel,
  output [5:0]  io_deq_uops_3_split_num,
  output [5:0]  io_deq_uops_3_self_index,
  output [5:0]  io_deq_uops_3_rob_inst_idx,
  output [5:0]  io_deq_uops_3_address_num,
  output [6:0]  io_deq_uops_3_uopc,
  output [31:0] io_deq_uops_3_inst,
  output [31:0] io_deq_uops_3_debug_inst,
  output        io_deq_uops_3_is_rvc,
  output [39:0] io_deq_uops_3_debug_pc,
  output [2:0]  io_deq_uops_3_iq_type,
  output [9:0]  io_deq_uops_3_fu_code,
  output [3:0]  io_deq_uops_3_ctrl_br_type,
  output [1:0]  io_deq_uops_3_ctrl_op1_sel,
  output [2:0]  io_deq_uops_3_ctrl_op2_sel,
  output [2:0]  io_deq_uops_3_ctrl_imm_sel,
  output [3:0]  io_deq_uops_3_ctrl_op_fcn,
  output        io_deq_uops_3_ctrl_fcn_dw,
  output [2:0]  io_deq_uops_3_ctrl_csr_cmd,
  output        io_deq_uops_3_ctrl_is_load,
  output        io_deq_uops_3_ctrl_is_sta,
  output        io_deq_uops_3_ctrl_is_std,
  output [1:0]  io_deq_uops_3_ctrl_op3_sel,
  output [1:0]  io_deq_uops_3_iw_state,
  output        io_deq_uops_3_iw_p1_poisoned,
  output        io_deq_uops_3_iw_p2_poisoned,
  output        io_deq_uops_3_is_br,
  output        io_deq_uops_3_is_jalr,
  output        io_deq_uops_3_is_jal,
  output        io_deq_uops_3_is_sfb,
  output [11:0] io_deq_uops_3_br_mask,
  output [3:0]  io_deq_uops_3_br_tag,
  output [4:0]  io_deq_uops_3_ftq_idx,
  output        io_deq_uops_3_edge_inst,
  output [5:0]  io_deq_uops_3_pc_lob,
  output        io_deq_uops_3_taken,
  output [19:0] io_deq_uops_3_imm_packed,
  output [11:0] io_deq_uops_3_csr_addr,
  output [5:0]  io_deq_uops_3_rob_idx,
  output [4:0]  io_deq_uops_3_ldq_idx,
  output [4:0]  io_deq_uops_3_stq_idx,
  output [1:0]  io_deq_uops_3_rxq_idx,
  output [6:0]  io_deq_uops_3_pdst,
  output [6:0]  io_deq_uops_3_prs1,
  output [6:0]  io_deq_uops_3_prs2,
  output [6:0]  io_deq_uops_3_prs3,
  output [4:0]  io_deq_uops_3_ppred,
  output        io_deq_uops_3_prs1_busy,
  output        io_deq_uops_3_prs2_busy,
  output        io_deq_uops_3_prs3_busy,
  output        io_deq_uops_3_ppred_busy,
  output [6:0]  io_deq_uops_3_stale_pdst,
  output        io_deq_uops_3_exception,
  output [63:0] io_deq_uops_3_exc_cause,
  output        io_deq_uops_3_bypassable,
  output [4:0]  io_deq_uops_3_mem_cmd,
  output [1:0]  io_deq_uops_3_mem_size,
  output        io_deq_uops_3_mem_signed,
  output        io_deq_uops_3_is_fence,
  output        io_deq_uops_3_is_fencei,
  output        io_deq_uops_3_is_amo,
  output        io_deq_uops_3_uses_ldq,
  output        io_deq_uops_3_uses_stq,
  output        io_deq_uops_3_is_sys_pc2epc,
  output        io_deq_uops_3_is_unique,
  output        io_deq_uops_3_flush_on_commit,
  output        io_deq_uops_3_ldst_is_rs1,
  output [5:0]  io_deq_uops_3_ldst,
  output [5:0]  io_deq_uops_3_lrs1,
  output [5:0]  io_deq_uops_3_lrs2,
  output [5:0]  io_deq_uops_3_lrs3,
  output        io_deq_uops_3_ldst_val,
  output [1:0]  io_deq_uops_3_dst_rtype,
  output [1:0]  io_deq_uops_3_lrs1_rtype,
  output [1:0]  io_deq_uops_3_lrs2_rtype,
  output        io_deq_uops_3_frs3_en,
  output        io_deq_uops_3_fp_val,
  output        io_deq_uops_3_fp_single,
  output        io_deq_uops_3_xcpt_pf_if,
  output        io_deq_uops_3_xcpt_ae_if,
  output        io_deq_uops_3_xcpt_ma_if,
  output        io_deq_uops_3_bp_debug_if,
  output        io_deq_uops_3_bp_xcpt_if,
  output [1:0]  io_deq_uops_3_debug_fsrc,
  output [1:0]  io_deq_uops_3_debug_tsrc,
  output        io_deq_uop_valids_0,
  output        io_deq_uop_valids_1,
  output        io_deq_uop_valids_2,
  output        io_deq_uop_valids_3,
  output [4:0]  io_deq_num,
  output        io_deq_is_decoded,
  input         io_status_debug,
  input         io_status_cease,
  input         io_status_wfi,
  input  [31:0] io_status_isa,
  input  [1:0]  io_status_dprv,
  input  [1:0]  io_status_prv,
  input         io_status_sd,
  input  [26:0] io_status_zero2,
  input  [1:0]  io_status_sxl,
  input  [1:0]  io_status_uxl,
  input         io_status_sd_rv32,
  input  [7:0]  io_status_zero1,
  input         io_status_tsr,
  input         io_status_tw,
  input         io_status_tvm,
  input         io_status_mxr,
  input         io_status_sum,
  input         io_status_mprv,
  input  [1:0]  io_status_xs,
  input  [1:0]  io_status_fs,
  input  [1:0]  io_status_mpp,
  input  [1:0]  io_status_vs,
  input         io_status_spp,
  input         io_status_mpie,
  input         io_status_hpie,
  input         io_status_spie,
  input         io_status_upie,
  input         io_status_mie,
  input         io_status_hie,
  input         io_status_sie,
  input         io_status_uie,
  output [11:0] io_csr_decode_csr,
  input         io_csr_decode_fp_illegal,
  input         io_csr_decode_vector_illegal,
  input         io_csr_decode_fp_csr,
  input         io_csr_decode_rocc_illegal,
  input         io_csr_decode_read_illegal,
  input         io_csr_decode_write_illegal,
  input         io_csr_decode_write_flush,
  input         io_csr_decode_system_illegal,
  input         io_interrupt,
  input  [63:0] io_interrupt_cause,
  input         io_is_unicore
);
  wire  subDecUnit0_clock; // @[decode.scala 764:27]
  wire  subDecUnit0_reset; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_switch; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_switch_off; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_is_unicore; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_rawuop_shift; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_rawuop_lrs3_rtype; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_rflag; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_wflag; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_rawuop_prflag; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_rawuop_pwflag; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_pflag_busy; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_rawuop_stale_pflag; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_rawuop_op1_sel; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_rawuop_op2_sel; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_rawuop_split_num; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_rawuop_self_index; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_rawuop_rob_inst_idx; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_rawuop_address_num; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_rawuop_uopc; // @[decode.scala 764:27]
  wire [31:0] subDecUnit0_io_rawuop_inst; // @[decode.scala 764:27]
  wire [31:0] subDecUnit0_io_rawuop_debug_inst; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_is_rvc; // @[decode.scala 764:27]
  wire [39:0] subDecUnit0_io_rawuop_debug_pc; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_rawuop_iq_type; // @[decode.scala 764:27]
  wire [9:0] subDecUnit0_io_rawuop_fu_code; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_rawuop_ctrl_br_type; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_rawuop_ctrl_op1_sel; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_rawuop_ctrl_op2_sel; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_rawuop_ctrl_imm_sel; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_rawuop_ctrl_op_fcn; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_ctrl_fcn_dw; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_rawuop_ctrl_csr_cmd; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_ctrl_is_load; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_ctrl_is_sta; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_ctrl_is_std; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_rawuop_ctrl_op3_sel; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_rawuop_iw_state; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_iw_p1_poisoned; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_iw_p2_poisoned; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_is_br; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_is_jalr; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_is_jal; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_is_sfb; // @[decode.scala 764:27]
  wire [11:0] subDecUnit0_io_rawuop_br_mask; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_rawuop_br_tag; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_rawuop_ftq_idx; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_edge_inst; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_rawuop_pc_lob; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_taken; // @[decode.scala 764:27]
  wire [19:0] subDecUnit0_io_rawuop_imm_packed; // @[decode.scala 764:27]
  wire [11:0] subDecUnit0_io_rawuop_csr_addr; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_rawuop_rob_idx; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_rawuop_ldq_idx; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_rawuop_stq_idx; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_rawuop_rxq_idx; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_rawuop_pdst; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_rawuop_prs1; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_rawuop_prs2; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_rawuop_prs3; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_rawuop_ppred; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_prs1_busy; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_prs2_busy; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_prs3_busy; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_ppred_busy; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_rawuop_stale_pdst; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_exception; // @[decode.scala 764:27]
  wire [63:0] subDecUnit0_io_rawuop_exc_cause; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_bypassable; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_rawuop_mem_cmd; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_rawuop_mem_size; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_mem_signed; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_is_fence; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_is_fencei; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_is_amo; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_uses_ldq; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_uses_stq; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_is_sys_pc2epc; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_is_unique; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_flush_on_commit; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_ldst_is_rs1; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_rawuop_ldst; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_rawuop_lrs1; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_rawuop_lrs2; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_rawuop_lrs3; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_ldst_val; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_rawuop_dst_rtype; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_rawuop_lrs1_rtype; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_rawuop_lrs2_rtype; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_frs3_en; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_fp_val; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_fp_single; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_xcpt_pf_if; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_xcpt_ae_if; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_xcpt_ma_if; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_bp_debug_if; // @[decode.scala 764:27]
  wire  subDecUnit0_io_rawuop_bp_xcpt_if; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_rawuop_debug_fsrc; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_rawuop_debug_tsrc; // @[decode.scala 764:27]
  wire  subDecUnit0_io_cs_sub_valid; // @[decode.scala 764:27]
  wire  subDecUnit0_io_cs_sub_fp_val; // @[decode.scala 764:27]
  wire  subDecUnit0_io_cs_sub_fp_single; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_cs_sub_uopc; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_cs_sub_iq_type; // @[decode.scala 764:27]
  wire [9:0] subDecUnit0_io_cs_sub_fu_code; // @[decode.scala 764:27]
  wire  subDecUnit0_io_cs_sub_uses_ldq; // @[decode.scala 764:27]
  wire  subDecUnit0_io_cs_sub_uses_stq; // @[decode.scala 764:27]
  wire  subDecUnit0_io_cs_sub_is_br; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_cs_sub_dst_type; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_cs_sub_rs1_type; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_cs_sub_rs2_type; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_cs_sub_rtemp1; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_cs_sub_rtemp2; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_cs_sub_wtemp; // @[decode.scala 764:27]
  wire  subDecUnit0_io_cs_sub_wflag; // @[decode.scala 764:27]
  wire  subDecUnit0_io_cs_sub_rflag; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_cs_sub_imm_sel; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_cs_sub_wakeup_delay; // @[decode.scala 764:27]
  wire  subDecUnit0_io_cs_sub_bypassable; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_cs_sub_mem_cmd; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_cs_sub_mem_size; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_cs_sub_shift; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_cs_sub_split_num; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_cs_sub_op1_sel; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_cs_sub_op2_sel; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_switch; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_switch_off; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_is_unicore; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_subuop_shift; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_subuop_lrs3_rtype; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_rflag; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_wflag; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_subuop_prflag; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_subuop_pwflag; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_pflag_busy; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_subuop_stale_pflag; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_subuop_op1_sel; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_subuop_op2_sel; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_subuop_split_num; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_subuop_self_index; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_subuop_rob_inst_idx; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_subuop_address_num; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_subuop_uopc; // @[decode.scala 764:27]
  wire [31:0] subDecUnit0_io_subuop_inst; // @[decode.scala 764:27]
  wire [31:0] subDecUnit0_io_subuop_debug_inst; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_is_rvc; // @[decode.scala 764:27]
  wire [39:0] subDecUnit0_io_subuop_debug_pc; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_subuop_iq_type; // @[decode.scala 764:27]
  wire [9:0] subDecUnit0_io_subuop_fu_code; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_subuop_ctrl_br_type; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_subuop_ctrl_op1_sel; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_subuop_ctrl_op2_sel; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_subuop_ctrl_imm_sel; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_subuop_ctrl_op_fcn; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_ctrl_fcn_dw; // @[decode.scala 764:27]
  wire [2:0] subDecUnit0_io_subuop_ctrl_csr_cmd; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_ctrl_is_load; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_ctrl_is_sta; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_ctrl_is_std; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_subuop_ctrl_op3_sel; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_subuop_iw_state; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_iw_p1_poisoned; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_iw_p2_poisoned; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_is_br; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_is_jalr; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_is_jal; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_is_sfb; // @[decode.scala 764:27]
  wire [11:0] subDecUnit0_io_subuop_br_mask; // @[decode.scala 764:27]
  wire [3:0] subDecUnit0_io_subuop_br_tag; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_subuop_ftq_idx; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_edge_inst; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_subuop_pc_lob; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_taken; // @[decode.scala 764:27]
  wire [19:0] subDecUnit0_io_subuop_imm_packed; // @[decode.scala 764:27]
  wire [11:0] subDecUnit0_io_subuop_csr_addr; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_subuop_rob_idx; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_subuop_ldq_idx; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_subuop_stq_idx; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_subuop_rxq_idx; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_subuop_pdst; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_subuop_prs1; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_subuop_prs2; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_subuop_prs3; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_subuop_ppred; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_prs1_busy; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_prs2_busy; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_prs3_busy; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_ppred_busy; // @[decode.scala 764:27]
  wire [6:0] subDecUnit0_io_subuop_stale_pdst; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_exception; // @[decode.scala 764:27]
  wire [63:0] subDecUnit0_io_subuop_exc_cause; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_bypassable; // @[decode.scala 764:27]
  wire [4:0] subDecUnit0_io_subuop_mem_cmd; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_subuop_mem_size; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_mem_signed; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_is_fence; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_is_fencei; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_is_amo; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_uses_ldq; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_uses_stq; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_is_sys_pc2epc; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_is_unique; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_flush_on_commit; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_ldst_is_rs1; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_subuop_ldst; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_subuop_lrs1; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_subuop_lrs2; // @[decode.scala 764:27]
  wire [5:0] subDecUnit0_io_subuop_lrs3; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_ldst_val; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_subuop_dst_rtype; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_subuop_lrs1_rtype; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_subuop_lrs2_rtype; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_frs3_en; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_fp_val; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_fp_single; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_xcpt_pf_if; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_xcpt_ae_if; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_xcpt_ma_if; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_bp_debug_if; // @[decode.scala 764:27]
  wire  subDecUnit0_io_subuop_bp_xcpt_if; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_subuop_debug_fsrc; // @[decode.scala 764:27]
  wire [1:0] subDecUnit0_io_subuop_debug_tsrc; // @[decode.scala 764:27]
  wire  subDecUnit1_clock; // @[decode.scala 765:27]
  wire  subDecUnit1_reset; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_switch; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_switch_off; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_is_unicore; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_rawuop_shift; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_rawuop_lrs3_rtype; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_rflag; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_wflag; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_rawuop_prflag; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_rawuop_pwflag; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_pflag_busy; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_rawuop_stale_pflag; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_rawuop_op1_sel; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_rawuop_op2_sel; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_rawuop_split_num; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_rawuop_self_index; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_rawuop_rob_inst_idx; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_rawuop_address_num; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_rawuop_uopc; // @[decode.scala 765:27]
  wire [31:0] subDecUnit1_io_rawuop_inst; // @[decode.scala 765:27]
  wire [31:0] subDecUnit1_io_rawuop_debug_inst; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_is_rvc; // @[decode.scala 765:27]
  wire [39:0] subDecUnit1_io_rawuop_debug_pc; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_rawuop_iq_type; // @[decode.scala 765:27]
  wire [9:0] subDecUnit1_io_rawuop_fu_code; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_rawuop_ctrl_br_type; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_rawuop_ctrl_op1_sel; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_rawuop_ctrl_op2_sel; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_rawuop_ctrl_imm_sel; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_rawuop_ctrl_op_fcn; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_ctrl_fcn_dw; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_rawuop_ctrl_csr_cmd; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_ctrl_is_load; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_ctrl_is_sta; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_ctrl_is_std; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_rawuop_ctrl_op3_sel; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_rawuop_iw_state; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_iw_p1_poisoned; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_iw_p2_poisoned; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_is_br; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_is_jalr; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_is_jal; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_is_sfb; // @[decode.scala 765:27]
  wire [11:0] subDecUnit1_io_rawuop_br_mask; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_rawuop_br_tag; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_rawuop_ftq_idx; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_edge_inst; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_rawuop_pc_lob; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_taken; // @[decode.scala 765:27]
  wire [19:0] subDecUnit1_io_rawuop_imm_packed; // @[decode.scala 765:27]
  wire [11:0] subDecUnit1_io_rawuop_csr_addr; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_rawuop_rob_idx; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_rawuop_ldq_idx; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_rawuop_stq_idx; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_rawuop_rxq_idx; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_rawuop_pdst; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_rawuop_prs1; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_rawuop_prs2; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_rawuop_prs3; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_rawuop_ppred; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_prs1_busy; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_prs2_busy; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_prs3_busy; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_ppred_busy; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_rawuop_stale_pdst; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_exception; // @[decode.scala 765:27]
  wire [63:0] subDecUnit1_io_rawuop_exc_cause; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_bypassable; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_rawuop_mem_cmd; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_rawuop_mem_size; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_mem_signed; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_is_fence; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_is_fencei; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_is_amo; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_uses_ldq; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_uses_stq; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_is_sys_pc2epc; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_is_unique; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_flush_on_commit; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_ldst_is_rs1; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_rawuop_ldst; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_rawuop_lrs1; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_rawuop_lrs2; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_rawuop_lrs3; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_ldst_val; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_rawuop_dst_rtype; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_rawuop_lrs1_rtype; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_rawuop_lrs2_rtype; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_frs3_en; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_fp_val; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_fp_single; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_xcpt_pf_if; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_xcpt_ae_if; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_xcpt_ma_if; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_bp_debug_if; // @[decode.scala 765:27]
  wire  subDecUnit1_io_rawuop_bp_xcpt_if; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_rawuop_debug_fsrc; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_rawuop_debug_tsrc; // @[decode.scala 765:27]
  wire  subDecUnit1_io_cs_sub_valid; // @[decode.scala 765:27]
  wire  subDecUnit1_io_cs_sub_fp_val; // @[decode.scala 765:27]
  wire  subDecUnit1_io_cs_sub_fp_single; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_cs_sub_uopc; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_cs_sub_iq_type; // @[decode.scala 765:27]
  wire [9:0] subDecUnit1_io_cs_sub_fu_code; // @[decode.scala 765:27]
  wire  subDecUnit1_io_cs_sub_uses_ldq; // @[decode.scala 765:27]
  wire  subDecUnit1_io_cs_sub_uses_stq; // @[decode.scala 765:27]
  wire  subDecUnit1_io_cs_sub_is_br; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_cs_sub_dst_type; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_cs_sub_rs1_type; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_cs_sub_rs2_type; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_cs_sub_rtemp1; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_cs_sub_rtemp2; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_cs_sub_wtemp; // @[decode.scala 765:27]
  wire  subDecUnit1_io_cs_sub_wflag; // @[decode.scala 765:27]
  wire  subDecUnit1_io_cs_sub_rflag; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_cs_sub_imm_sel; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_cs_sub_wakeup_delay; // @[decode.scala 765:27]
  wire  subDecUnit1_io_cs_sub_bypassable; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_cs_sub_mem_cmd; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_cs_sub_mem_size; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_cs_sub_shift; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_cs_sub_split_num; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_cs_sub_op1_sel; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_cs_sub_op2_sel; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_switch; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_switch_off; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_is_unicore; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_subuop_shift; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_subuop_lrs3_rtype; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_rflag; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_wflag; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_subuop_prflag; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_subuop_pwflag; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_pflag_busy; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_subuop_stale_pflag; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_subuop_op1_sel; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_subuop_op2_sel; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_subuop_split_num; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_subuop_self_index; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_subuop_rob_inst_idx; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_subuop_address_num; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_subuop_uopc; // @[decode.scala 765:27]
  wire [31:0] subDecUnit1_io_subuop_inst; // @[decode.scala 765:27]
  wire [31:0] subDecUnit1_io_subuop_debug_inst; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_is_rvc; // @[decode.scala 765:27]
  wire [39:0] subDecUnit1_io_subuop_debug_pc; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_subuop_iq_type; // @[decode.scala 765:27]
  wire [9:0] subDecUnit1_io_subuop_fu_code; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_subuop_ctrl_br_type; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_subuop_ctrl_op1_sel; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_subuop_ctrl_op2_sel; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_subuop_ctrl_imm_sel; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_subuop_ctrl_op_fcn; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_ctrl_fcn_dw; // @[decode.scala 765:27]
  wire [2:0] subDecUnit1_io_subuop_ctrl_csr_cmd; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_ctrl_is_load; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_ctrl_is_sta; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_ctrl_is_std; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_subuop_ctrl_op3_sel; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_subuop_iw_state; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_iw_p1_poisoned; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_iw_p2_poisoned; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_is_br; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_is_jalr; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_is_jal; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_is_sfb; // @[decode.scala 765:27]
  wire [11:0] subDecUnit1_io_subuop_br_mask; // @[decode.scala 765:27]
  wire [3:0] subDecUnit1_io_subuop_br_tag; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_subuop_ftq_idx; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_edge_inst; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_subuop_pc_lob; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_taken; // @[decode.scala 765:27]
  wire [19:0] subDecUnit1_io_subuop_imm_packed; // @[decode.scala 765:27]
  wire [11:0] subDecUnit1_io_subuop_csr_addr; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_subuop_rob_idx; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_subuop_ldq_idx; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_subuop_stq_idx; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_subuop_rxq_idx; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_subuop_pdst; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_subuop_prs1; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_subuop_prs2; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_subuop_prs3; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_subuop_ppred; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_prs1_busy; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_prs2_busy; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_prs3_busy; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_ppred_busy; // @[decode.scala 765:27]
  wire [6:0] subDecUnit1_io_subuop_stale_pdst; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_exception; // @[decode.scala 765:27]
  wire [63:0] subDecUnit1_io_subuop_exc_cause; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_bypassable; // @[decode.scala 765:27]
  wire [4:0] subDecUnit1_io_subuop_mem_cmd; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_subuop_mem_size; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_mem_signed; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_is_fence; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_is_fencei; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_is_amo; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_uses_ldq; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_uses_stq; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_is_sys_pc2epc; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_is_unique; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_flush_on_commit; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_ldst_is_rs1; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_subuop_ldst; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_subuop_lrs1; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_subuop_lrs2; // @[decode.scala 765:27]
  wire [5:0] subDecUnit1_io_subuop_lrs3; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_ldst_val; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_subuop_dst_rtype; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_subuop_lrs1_rtype; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_subuop_lrs2_rtype; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_frs3_en; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_fp_val; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_fp_single; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_xcpt_pf_if; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_xcpt_ae_if; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_xcpt_ma_if; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_bp_debug_if; // @[decode.scala 765:27]
  wire  subDecUnit1_io_subuop_bp_xcpt_if; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_subuop_debug_fsrc; // @[decode.scala 765:27]
  wire [1:0] subDecUnit1_io_subuop_debug_tsrc; // @[decode.scala 765:27]
  wire  subDecUnit2_clock; // @[decode.scala 766:27]
  wire  subDecUnit2_reset; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_switch; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_switch_off; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_is_unicore; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_rawuop_shift; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_rawuop_lrs3_rtype; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_rflag; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_wflag; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_rawuop_prflag; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_rawuop_pwflag; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_pflag_busy; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_rawuop_stale_pflag; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_rawuop_op1_sel; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_rawuop_op2_sel; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_rawuop_split_num; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_rawuop_self_index; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_rawuop_rob_inst_idx; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_rawuop_address_num; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_rawuop_uopc; // @[decode.scala 766:27]
  wire [31:0] subDecUnit2_io_rawuop_inst; // @[decode.scala 766:27]
  wire [31:0] subDecUnit2_io_rawuop_debug_inst; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_is_rvc; // @[decode.scala 766:27]
  wire [39:0] subDecUnit2_io_rawuop_debug_pc; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_rawuop_iq_type; // @[decode.scala 766:27]
  wire [9:0] subDecUnit2_io_rawuop_fu_code; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_rawuop_ctrl_br_type; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_rawuop_ctrl_op1_sel; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_rawuop_ctrl_op2_sel; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_rawuop_ctrl_imm_sel; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_rawuop_ctrl_op_fcn; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_ctrl_fcn_dw; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_rawuop_ctrl_csr_cmd; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_ctrl_is_load; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_ctrl_is_sta; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_ctrl_is_std; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_rawuop_ctrl_op3_sel; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_rawuop_iw_state; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_iw_p1_poisoned; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_iw_p2_poisoned; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_is_br; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_is_jalr; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_is_jal; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_is_sfb; // @[decode.scala 766:27]
  wire [11:0] subDecUnit2_io_rawuop_br_mask; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_rawuop_br_tag; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_rawuop_ftq_idx; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_edge_inst; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_rawuop_pc_lob; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_taken; // @[decode.scala 766:27]
  wire [19:0] subDecUnit2_io_rawuop_imm_packed; // @[decode.scala 766:27]
  wire [11:0] subDecUnit2_io_rawuop_csr_addr; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_rawuop_rob_idx; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_rawuop_ldq_idx; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_rawuop_stq_idx; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_rawuop_rxq_idx; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_rawuop_pdst; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_rawuop_prs1; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_rawuop_prs2; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_rawuop_prs3; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_rawuop_ppred; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_prs1_busy; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_prs2_busy; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_prs3_busy; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_ppred_busy; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_rawuop_stale_pdst; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_exception; // @[decode.scala 766:27]
  wire [63:0] subDecUnit2_io_rawuop_exc_cause; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_bypassable; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_rawuop_mem_cmd; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_rawuop_mem_size; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_mem_signed; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_is_fence; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_is_fencei; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_is_amo; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_uses_ldq; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_uses_stq; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_is_sys_pc2epc; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_is_unique; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_flush_on_commit; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_ldst_is_rs1; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_rawuop_ldst; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_rawuop_lrs1; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_rawuop_lrs2; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_rawuop_lrs3; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_ldst_val; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_rawuop_dst_rtype; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_rawuop_lrs1_rtype; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_rawuop_lrs2_rtype; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_frs3_en; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_fp_val; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_fp_single; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_xcpt_pf_if; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_xcpt_ae_if; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_xcpt_ma_if; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_bp_debug_if; // @[decode.scala 766:27]
  wire  subDecUnit2_io_rawuop_bp_xcpt_if; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_rawuop_debug_fsrc; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_rawuop_debug_tsrc; // @[decode.scala 766:27]
  wire  subDecUnit2_io_cs_sub_valid; // @[decode.scala 766:27]
  wire  subDecUnit2_io_cs_sub_fp_val; // @[decode.scala 766:27]
  wire  subDecUnit2_io_cs_sub_fp_single; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_cs_sub_uopc; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_cs_sub_iq_type; // @[decode.scala 766:27]
  wire [9:0] subDecUnit2_io_cs_sub_fu_code; // @[decode.scala 766:27]
  wire  subDecUnit2_io_cs_sub_uses_ldq; // @[decode.scala 766:27]
  wire  subDecUnit2_io_cs_sub_uses_stq; // @[decode.scala 766:27]
  wire  subDecUnit2_io_cs_sub_is_br; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_cs_sub_dst_type; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_cs_sub_rs1_type; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_cs_sub_rs2_type; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_cs_sub_rtemp1; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_cs_sub_rtemp2; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_cs_sub_wtemp; // @[decode.scala 766:27]
  wire  subDecUnit2_io_cs_sub_wflag; // @[decode.scala 766:27]
  wire  subDecUnit2_io_cs_sub_rflag; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_cs_sub_imm_sel; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_cs_sub_wakeup_delay; // @[decode.scala 766:27]
  wire  subDecUnit2_io_cs_sub_bypassable; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_cs_sub_mem_cmd; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_cs_sub_mem_size; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_cs_sub_shift; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_cs_sub_split_num; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_cs_sub_op1_sel; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_cs_sub_op2_sel; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_switch; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_switch_off; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_is_unicore; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_subuop_shift; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_subuop_lrs3_rtype; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_rflag; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_wflag; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_subuop_prflag; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_subuop_pwflag; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_pflag_busy; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_subuop_stale_pflag; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_subuop_op1_sel; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_subuop_op2_sel; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_subuop_split_num; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_subuop_self_index; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_subuop_rob_inst_idx; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_subuop_address_num; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_subuop_uopc; // @[decode.scala 766:27]
  wire [31:0] subDecUnit2_io_subuop_inst; // @[decode.scala 766:27]
  wire [31:0] subDecUnit2_io_subuop_debug_inst; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_is_rvc; // @[decode.scala 766:27]
  wire [39:0] subDecUnit2_io_subuop_debug_pc; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_subuop_iq_type; // @[decode.scala 766:27]
  wire [9:0] subDecUnit2_io_subuop_fu_code; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_subuop_ctrl_br_type; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_subuop_ctrl_op1_sel; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_subuop_ctrl_op2_sel; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_subuop_ctrl_imm_sel; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_subuop_ctrl_op_fcn; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_ctrl_fcn_dw; // @[decode.scala 766:27]
  wire [2:0] subDecUnit2_io_subuop_ctrl_csr_cmd; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_ctrl_is_load; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_ctrl_is_sta; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_ctrl_is_std; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_subuop_ctrl_op3_sel; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_subuop_iw_state; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_iw_p1_poisoned; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_iw_p2_poisoned; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_is_br; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_is_jalr; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_is_jal; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_is_sfb; // @[decode.scala 766:27]
  wire [11:0] subDecUnit2_io_subuop_br_mask; // @[decode.scala 766:27]
  wire [3:0] subDecUnit2_io_subuop_br_tag; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_subuop_ftq_idx; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_edge_inst; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_subuop_pc_lob; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_taken; // @[decode.scala 766:27]
  wire [19:0] subDecUnit2_io_subuop_imm_packed; // @[decode.scala 766:27]
  wire [11:0] subDecUnit2_io_subuop_csr_addr; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_subuop_rob_idx; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_subuop_ldq_idx; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_subuop_stq_idx; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_subuop_rxq_idx; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_subuop_pdst; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_subuop_prs1; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_subuop_prs2; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_subuop_prs3; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_subuop_ppred; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_prs1_busy; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_prs2_busy; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_prs3_busy; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_ppred_busy; // @[decode.scala 766:27]
  wire [6:0] subDecUnit2_io_subuop_stale_pdst; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_exception; // @[decode.scala 766:27]
  wire [63:0] subDecUnit2_io_subuop_exc_cause; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_bypassable; // @[decode.scala 766:27]
  wire [4:0] subDecUnit2_io_subuop_mem_cmd; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_subuop_mem_size; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_mem_signed; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_is_fence; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_is_fencei; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_is_amo; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_uses_ldq; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_uses_stq; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_is_sys_pc2epc; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_is_unique; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_flush_on_commit; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_ldst_is_rs1; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_subuop_ldst; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_subuop_lrs1; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_subuop_lrs2; // @[decode.scala 766:27]
  wire [5:0] subDecUnit2_io_subuop_lrs3; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_ldst_val; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_subuop_dst_rtype; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_subuop_lrs1_rtype; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_subuop_lrs2_rtype; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_frs3_en; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_fp_val; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_fp_single; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_xcpt_pf_if; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_xcpt_ae_if; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_xcpt_ma_if; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_bp_debug_if; // @[decode.scala 766:27]
  wire  subDecUnit2_io_subuop_bp_xcpt_if; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_subuop_debug_fsrc; // @[decode.scala 766:27]
  wire [1:0] subDecUnit2_io_subuop_debug_tsrc; // @[decode.scala 766:27]
  wire  subDecUnit3_clock; // @[decode.scala 767:27]
  wire  subDecUnit3_reset; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_switch; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_switch_off; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_is_unicore; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_rawuop_shift; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_rawuop_lrs3_rtype; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_rflag; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_wflag; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_rawuop_prflag; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_rawuop_pwflag; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_pflag_busy; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_rawuop_stale_pflag; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_rawuop_op1_sel; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_rawuop_op2_sel; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_rawuop_split_num; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_rawuop_self_index; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_rawuop_rob_inst_idx; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_rawuop_address_num; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_rawuop_uopc; // @[decode.scala 767:27]
  wire [31:0] subDecUnit3_io_rawuop_inst; // @[decode.scala 767:27]
  wire [31:0] subDecUnit3_io_rawuop_debug_inst; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_is_rvc; // @[decode.scala 767:27]
  wire [39:0] subDecUnit3_io_rawuop_debug_pc; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_rawuop_iq_type; // @[decode.scala 767:27]
  wire [9:0] subDecUnit3_io_rawuop_fu_code; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_rawuop_ctrl_br_type; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_rawuop_ctrl_op1_sel; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_rawuop_ctrl_op2_sel; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_rawuop_ctrl_imm_sel; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_rawuop_ctrl_op_fcn; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_ctrl_fcn_dw; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_rawuop_ctrl_csr_cmd; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_ctrl_is_load; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_ctrl_is_sta; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_ctrl_is_std; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_rawuop_ctrl_op3_sel; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_rawuop_iw_state; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_iw_p1_poisoned; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_iw_p2_poisoned; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_is_br; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_is_jalr; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_is_jal; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_is_sfb; // @[decode.scala 767:27]
  wire [11:0] subDecUnit3_io_rawuop_br_mask; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_rawuop_br_tag; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_rawuop_ftq_idx; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_edge_inst; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_rawuop_pc_lob; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_taken; // @[decode.scala 767:27]
  wire [19:0] subDecUnit3_io_rawuop_imm_packed; // @[decode.scala 767:27]
  wire [11:0] subDecUnit3_io_rawuop_csr_addr; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_rawuop_rob_idx; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_rawuop_ldq_idx; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_rawuop_stq_idx; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_rawuop_rxq_idx; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_rawuop_pdst; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_rawuop_prs1; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_rawuop_prs2; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_rawuop_prs3; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_rawuop_ppred; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_prs1_busy; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_prs2_busy; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_prs3_busy; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_ppred_busy; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_rawuop_stale_pdst; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_exception; // @[decode.scala 767:27]
  wire [63:0] subDecUnit3_io_rawuop_exc_cause; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_bypassable; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_rawuop_mem_cmd; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_rawuop_mem_size; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_mem_signed; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_is_fence; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_is_fencei; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_is_amo; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_uses_ldq; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_uses_stq; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_is_sys_pc2epc; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_is_unique; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_flush_on_commit; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_ldst_is_rs1; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_rawuop_ldst; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_rawuop_lrs1; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_rawuop_lrs2; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_rawuop_lrs3; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_ldst_val; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_rawuop_dst_rtype; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_rawuop_lrs1_rtype; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_rawuop_lrs2_rtype; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_frs3_en; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_fp_val; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_fp_single; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_xcpt_pf_if; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_xcpt_ae_if; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_xcpt_ma_if; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_bp_debug_if; // @[decode.scala 767:27]
  wire  subDecUnit3_io_rawuop_bp_xcpt_if; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_rawuop_debug_fsrc; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_rawuop_debug_tsrc; // @[decode.scala 767:27]
  wire  subDecUnit3_io_cs_sub_valid; // @[decode.scala 767:27]
  wire  subDecUnit3_io_cs_sub_fp_val; // @[decode.scala 767:27]
  wire  subDecUnit3_io_cs_sub_fp_single; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_cs_sub_uopc; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_cs_sub_iq_type; // @[decode.scala 767:27]
  wire [9:0] subDecUnit3_io_cs_sub_fu_code; // @[decode.scala 767:27]
  wire  subDecUnit3_io_cs_sub_uses_ldq; // @[decode.scala 767:27]
  wire  subDecUnit3_io_cs_sub_uses_stq; // @[decode.scala 767:27]
  wire  subDecUnit3_io_cs_sub_is_br; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_cs_sub_dst_type; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_cs_sub_rs1_type; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_cs_sub_rs2_type; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_cs_sub_rtemp1; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_cs_sub_rtemp2; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_cs_sub_wtemp; // @[decode.scala 767:27]
  wire  subDecUnit3_io_cs_sub_wflag; // @[decode.scala 767:27]
  wire  subDecUnit3_io_cs_sub_rflag; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_cs_sub_imm_sel; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_cs_sub_wakeup_delay; // @[decode.scala 767:27]
  wire  subDecUnit3_io_cs_sub_bypassable; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_cs_sub_mem_cmd; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_cs_sub_mem_size; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_cs_sub_shift; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_cs_sub_split_num; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_cs_sub_op1_sel; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_cs_sub_op2_sel; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_switch; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_switch_off; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_is_unicore; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_subuop_shift; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_subuop_lrs3_rtype; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_rflag; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_wflag; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_subuop_prflag; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_subuop_pwflag; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_pflag_busy; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_subuop_stale_pflag; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_subuop_op1_sel; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_subuop_op2_sel; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_subuop_split_num; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_subuop_self_index; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_subuop_rob_inst_idx; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_subuop_address_num; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_subuop_uopc; // @[decode.scala 767:27]
  wire [31:0] subDecUnit3_io_subuop_inst; // @[decode.scala 767:27]
  wire [31:0] subDecUnit3_io_subuop_debug_inst; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_is_rvc; // @[decode.scala 767:27]
  wire [39:0] subDecUnit3_io_subuop_debug_pc; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_subuop_iq_type; // @[decode.scala 767:27]
  wire [9:0] subDecUnit3_io_subuop_fu_code; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_subuop_ctrl_br_type; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_subuop_ctrl_op1_sel; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_subuop_ctrl_op2_sel; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_subuop_ctrl_imm_sel; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_subuop_ctrl_op_fcn; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_ctrl_fcn_dw; // @[decode.scala 767:27]
  wire [2:0] subDecUnit3_io_subuop_ctrl_csr_cmd; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_ctrl_is_load; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_ctrl_is_sta; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_ctrl_is_std; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_subuop_ctrl_op3_sel; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_subuop_iw_state; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_iw_p1_poisoned; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_iw_p2_poisoned; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_is_br; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_is_jalr; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_is_jal; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_is_sfb; // @[decode.scala 767:27]
  wire [11:0] subDecUnit3_io_subuop_br_mask; // @[decode.scala 767:27]
  wire [3:0] subDecUnit3_io_subuop_br_tag; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_subuop_ftq_idx; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_edge_inst; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_subuop_pc_lob; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_taken; // @[decode.scala 767:27]
  wire [19:0] subDecUnit3_io_subuop_imm_packed; // @[decode.scala 767:27]
  wire [11:0] subDecUnit3_io_subuop_csr_addr; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_subuop_rob_idx; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_subuop_ldq_idx; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_subuop_stq_idx; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_subuop_rxq_idx; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_subuop_pdst; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_subuop_prs1; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_subuop_prs2; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_subuop_prs3; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_subuop_ppred; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_prs1_busy; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_prs2_busy; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_prs3_busy; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_ppred_busy; // @[decode.scala 767:27]
  wire [6:0] subDecUnit3_io_subuop_stale_pdst; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_exception; // @[decode.scala 767:27]
  wire [63:0] subDecUnit3_io_subuop_exc_cause; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_bypassable; // @[decode.scala 767:27]
  wire [4:0] subDecUnit3_io_subuop_mem_cmd; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_subuop_mem_size; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_mem_signed; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_is_fence; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_is_fencei; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_is_amo; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_uses_ldq; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_uses_stq; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_is_sys_pc2epc; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_is_unique; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_flush_on_commit; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_ldst_is_rs1; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_subuop_ldst; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_subuop_lrs1; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_subuop_lrs2; // @[decode.scala 767:27]
  wire [5:0] subDecUnit3_io_subuop_lrs3; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_ldst_val; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_subuop_dst_rtype; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_subuop_lrs1_rtype; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_subuop_lrs2_rtype; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_frs3_en; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_fp_val; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_fp_single; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_xcpt_pf_if; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_xcpt_ae_if; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_xcpt_ma_if; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_bp_debug_if; // @[decode.scala 767:27]
  wire  subDecUnit3_io_subuop_bp_xcpt_if; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_subuop_debug_fsrc; // @[decode.scala 767:27]
  wire [1:0] subDecUnit3_io_subuop_debug_tsrc; // @[decode.scala 767:27]
  wire  SubDecodeUnit_clock; // @[decode.scala 793:25]
  wire  SubDecodeUnit_reset; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_switch; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_switch_off; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_is_unicore; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_rawuop_shift; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_rawuop_lrs3_rtype; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_rflag; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_wflag; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_rawuop_prflag; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_rawuop_pwflag; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_pflag_busy; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_rawuop_stale_pflag; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_rawuop_op1_sel; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_rawuop_op2_sel; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_rawuop_split_num; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_rawuop_self_index; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_rawuop_rob_inst_idx; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_rawuop_address_num; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_rawuop_uopc; // @[decode.scala 793:25]
  wire [31:0] SubDecodeUnit_io_rawuop_inst; // @[decode.scala 793:25]
  wire [31:0] SubDecodeUnit_io_rawuop_debug_inst; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_is_rvc; // @[decode.scala 793:25]
  wire [39:0] SubDecodeUnit_io_rawuop_debug_pc; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_rawuop_iq_type; // @[decode.scala 793:25]
  wire [9:0] SubDecodeUnit_io_rawuop_fu_code; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_rawuop_ctrl_br_type; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_rawuop_ctrl_op1_sel; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_rawuop_ctrl_op2_sel; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_rawuop_ctrl_imm_sel; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_rawuop_ctrl_op_fcn; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_ctrl_fcn_dw; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_rawuop_ctrl_csr_cmd; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_ctrl_is_load; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_ctrl_is_sta; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_ctrl_is_std; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_rawuop_ctrl_op3_sel; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_rawuop_iw_state; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_iw_p1_poisoned; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_iw_p2_poisoned; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_is_br; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_is_jalr; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_is_jal; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_is_sfb; // @[decode.scala 793:25]
  wire [11:0] SubDecodeUnit_io_rawuop_br_mask; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_rawuop_br_tag; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_rawuop_ftq_idx; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_edge_inst; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_rawuop_pc_lob; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_taken; // @[decode.scala 793:25]
  wire [19:0] SubDecodeUnit_io_rawuop_imm_packed; // @[decode.scala 793:25]
  wire [11:0] SubDecodeUnit_io_rawuop_csr_addr; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_rawuop_rob_idx; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_rawuop_ldq_idx; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_rawuop_stq_idx; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_rawuop_rxq_idx; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_rawuop_pdst; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_rawuop_prs1; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_rawuop_prs2; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_rawuop_prs3; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_rawuop_ppred; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_prs1_busy; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_prs2_busy; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_prs3_busy; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_ppred_busy; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_rawuop_stale_pdst; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_exception; // @[decode.scala 793:25]
  wire [63:0] SubDecodeUnit_io_rawuop_exc_cause; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_bypassable; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_rawuop_mem_cmd; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_rawuop_mem_size; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_mem_signed; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_is_fence; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_is_fencei; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_is_amo; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_uses_ldq; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_uses_stq; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_is_sys_pc2epc; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_is_unique; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_flush_on_commit; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_ldst_is_rs1; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_rawuop_ldst; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_rawuop_lrs1; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_rawuop_lrs2; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_rawuop_lrs3; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_ldst_val; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_rawuop_dst_rtype; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_rawuop_lrs1_rtype; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_rawuop_lrs2_rtype; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_frs3_en; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_fp_val; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_fp_single; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_xcpt_pf_if; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_xcpt_ae_if; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_xcpt_ma_if; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_bp_debug_if; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_rawuop_bp_xcpt_if; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_rawuop_debug_fsrc; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_rawuop_debug_tsrc; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_cs_sub_valid; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_cs_sub_fp_val; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_cs_sub_fp_single; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_cs_sub_uopc; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_cs_sub_iq_type; // @[decode.scala 793:25]
  wire [9:0] SubDecodeUnit_io_cs_sub_fu_code; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_cs_sub_uses_ldq; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_cs_sub_uses_stq; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_cs_sub_is_br; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_cs_sub_dst_type; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_cs_sub_rs1_type; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_cs_sub_rs2_type; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_cs_sub_rtemp1; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_cs_sub_rtemp2; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_cs_sub_wtemp; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_cs_sub_wflag; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_cs_sub_rflag; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_cs_sub_imm_sel; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_cs_sub_wakeup_delay; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_cs_sub_bypassable; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_cs_sub_mem_cmd; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_cs_sub_mem_size; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_cs_sub_shift; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_cs_sub_split_num; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_cs_sub_op1_sel; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_cs_sub_op2_sel; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_switch; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_switch_off; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_is_unicore; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_subuop_shift; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_subuop_lrs3_rtype; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_rflag; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_wflag; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_subuop_prflag; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_subuop_pwflag; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_pflag_busy; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_subuop_stale_pflag; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_subuop_op1_sel; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_subuop_op2_sel; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_subuop_split_num; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_subuop_self_index; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_subuop_rob_inst_idx; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_subuop_address_num; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_subuop_uopc; // @[decode.scala 793:25]
  wire [31:0] SubDecodeUnit_io_subuop_inst; // @[decode.scala 793:25]
  wire [31:0] SubDecodeUnit_io_subuop_debug_inst; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_is_rvc; // @[decode.scala 793:25]
  wire [39:0] SubDecodeUnit_io_subuop_debug_pc; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_subuop_iq_type; // @[decode.scala 793:25]
  wire [9:0] SubDecodeUnit_io_subuop_fu_code; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_subuop_ctrl_br_type; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_subuop_ctrl_op1_sel; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_subuop_ctrl_op2_sel; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_subuop_ctrl_imm_sel; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_subuop_ctrl_op_fcn; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_ctrl_fcn_dw; // @[decode.scala 793:25]
  wire [2:0] SubDecodeUnit_io_subuop_ctrl_csr_cmd; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_ctrl_is_load; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_ctrl_is_sta; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_ctrl_is_std; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_subuop_ctrl_op3_sel; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_subuop_iw_state; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_iw_p1_poisoned; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_iw_p2_poisoned; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_is_br; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_is_jalr; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_is_jal; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_is_sfb; // @[decode.scala 793:25]
  wire [11:0] SubDecodeUnit_io_subuop_br_mask; // @[decode.scala 793:25]
  wire [3:0] SubDecodeUnit_io_subuop_br_tag; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_subuop_ftq_idx; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_edge_inst; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_subuop_pc_lob; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_taken; // @[decode.scala 793:25]
  wire [19:0] SubDecodeUnit_io_subuop_imm_packed; // @[decode.scala 793:25]
  wire [11:0] SubDecodeUnit_io_subuop_csr_addr; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_subuop_rob_idx; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_subuop_ldq_idx; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_subuop_stq_idx; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_subuop_rxq_idx; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_subuop_pdst; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_subuop_prs1; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_subuop_prs2; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_subuop_prs3; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_subuop_ppred; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_prs1_busy; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_prs2_busy; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_prs3_busy; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_ppred_busy; // @[decode.scala 793:25]
  wire [6:0] SubDecodeUnit_io_subuop_stale_pdst; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_exception; // @[decode.scala 793:25]
  wire [63:0] SubDecodeUnit_io_subuop_exc_cause; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_bypassable; // @[decode.scala 793:25]
  wire [4:0] SubDecodeUnit_io_subuop_mem_cmd; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_subuop_mem_size; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_mem_signed; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_is_fence; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_is_fencei; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_is_amo; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_uses_ldq; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_uses_stq; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_is_sys_pc2epc; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_is_unique; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_flush_on_commit; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_ldst_is_rs1; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_subuop_ldst; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_subuop_lrs1; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_subuop_lrs2; // @[decode.scala 793:25]
  wire [5:0] SubDecodeUnit_io_subuop_lrs3; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_ldst_val; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_subuop_dst_rtype; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_subuop_lrs1_rtype; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_subuop_lrs2_rtype; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_frs3_en; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_fp_val; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_fp_single; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_xcpt_pf_if; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_xcpt_ae_if; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_xcpt_ma_if; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_bp_debug_if; // @[decode.scala 793:25]
  wire  SubDecodeUnit_io_subuop_bp_xcpt_if; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_subuop_debug_fsrc; // @[decode.scala 793:25]
  wire [1:0] SubDecodeUnit_io_subuop_debug_tsrc; // @[decode.scala 793:25]
  wire [31:0] _bit_T = io_enq_uop_inst & 32'h707f; // @[Decode.scala 14:65]
  wire  _bit_T_1 = _bit_T == 32'h2003; // @[Decode.scala 14:121]
  wire  _bit_T_3 = _bit_T == 32'h1003; // @[Decode.scala 14:121]
  wire  _bit_T_5 = _bit_T == 32'h5003; // @[Decode.scala 14:121]
  wire  _bit_T_7 = _bit_T == 32'h3; // @[Decode.scala 14:121]
  wire  _bit_T_9 = _bit_T == 32'h4003; // @[Decode.scala 14:121]
  wire  _bit_T_11 = _bit_T == 32'h2023; // @[Decode.scala 14:121]
  wire  _bit_T_13 = _bit_T == 32'h1023; // @[Decode.scala 14:121]
  wire  _bit_T_15 = _bit_T == 32'h23; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_16 = io_enq_uop_inst & 32'h7f; // @[Decode.scala 14:65]
  wire  _bit_T_17 = _bit_T_16 == 32'h37; // @[Decode.scala 14:121]
  wire  _bit_T_19 = _bit_T == 32'h13; // @[Decode.scala 14:121]
  wire  _bit_T_21 = _bit_T == 32'h7013; // @[Decode.scala 14:121]
  wire  _bit_T_23 = _bit_T == 32'h6013; // @[Decode.scala 14:121]
  wire  _bit_T_25 = _bit_T == 32'h4013; // @[Decode.scala 14:121]
  wire  _bit_T_27 = _bit_T == 32'h2013; // @[Decode.scala 14:121]
  wire  _bit_T_29 = _bit_T == 32'h3013; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_30 = io_enq_uop_inst & 32'hfe00707f; // @[Decode.scala 14:65]
  wire  _bit_T_31 = _bit_T_30 == 32'h1033; // @[Decode.scala 14:121]
  wire  _bit_T_33 = _bit_T_30 == 32'h33; // @[Decode.scala 14:121]
  wire  _bit_T_35 = _bit_T_30 == 32'h40000033; // @[Decode.scala 14:121]
  wire  _bit_T_37 = _bit_T_30 == 32'h2033; // @[Decode.scala 14:121]
  wire  _bit_T_39 = _bit_T_30 == 32'h3033; // @[Decode.scala 14:121]
  wire  _bit_T_41 = _bit_T_30 == 32'h7033; // @[Decode.scala 14:121]
  wire  _bit_T_43 = _bit_T_30 == 32'h6033; // @[Decode.scala 14:121]
  wire  _bit_T_45 = _bit_T_30 == 32'h4033; // @[Decode.scala 14:121]
  wire  _bit_T_47 = _bit_T_30 == 32'h40005033; // @[Decode.scala 14:121]
  wire  _bit_T_49 = _bit_T_30 == 32'h5033; // @[Decode.scala 14:121]
  wire  _bit_T_51 = _bit_T_30 == 32'h2000033; // @[Decode.scala 14:121]
  wire  _bit_T_53 = _bit_T_30 == 32'h2001033; // @[Decode.scala 14:121]
  wire  _bit_T_55 = _bit_T_30 == 32'h2003033; // @[Decode.scala 14:121]
  wire  _bit_T_57 = _bit_T_30 == 32'h2002033; // @[Decode.scala 14:121]
  wire  _bit_T_59 = _bit_T_30 == 32'h200003b; // @[Decode.scala 14:121]
  wire  _bit_T_61 = _bit_T_30 == 32'h2004033; // @[Decode.scala 14:121]
  wire  _bit_T_63 = _bit_T_30 == 32'h2005033; // @[Decode.scala 14:121]
  wire  _bit_T_65 = _bit_T_30 == 32'h2006033; // @[Decode.scala 14:121]
  wire  _bit_T_67 = _bit_T_30 == 32'h2007033; // @[Decode.scala 14:121]
  wire  _bit_T_69 = _bit_T_30 == 32'h200403b; // @[Decode.scala 14:121]
  wire  _bit_T_71 = _bit_T_30 == 32'h200503b; // @[Decode.scala 14:121]
  wire  _bit_T_73 = _bit_T_30 == 32'h200603b; // @[Decode.scala 14:121]
  wire  _bit_T_75 = _bit_T_30 == 32'h200703b; // @[Decode.scala 14:121]
  wire  _bit_T_77 = _bit_T_16 == 32'h17; // @[Decode.scala 14:121]
  wire  _bit_T_79 = _bit_T_16 == 32'h6f; // @[Decode.scala 14:121]
  wire  _bit_T_81 = _bit_T == 32'h67; // @[Decode.scala 14:121]
  wire  _bit_T_83 = _bit_T == 32'h63; // @[Decode.scala 14:121]
  wire  _bit_T_85 = _bit_T == 32'h1063; // @[Decode.scala 14:121]
  wire  _bit_T_87 = _bit_T == 32'h5063; // @[Decode.scala 14:121]
  wire  _bit_T_89 = _bit_T == 32'h7063; // @[Decode.scala 14:121]
  wire  _bit_T_91 = _bit_T == 32'h4063; // @[Decode.scala 14:121]
  wire  _bit_T_93 = _bit_T == 32'h6063; // @[Decode.scala 14:121]
  wire  _bit_T_95 = _bit_T == 32'h1073; // @[Decode.scala 14:121]
  wire  _bit_T_97 = _bit_T == 32'h2073; // @[Decode.scala 14:121]
  wire  _bit_T_99 = _bit_T == 32'h3073; // @[Decode.scala 14:121]
  wire  _bit_T_101 = _bit_T == 32'h5073; // @[Decode.scala 14:121]
  wire  _bit_T_103 = _bit_T == 32'h6073; // @[Decode.scala 14:121]
  wire  _bit_T_105 = _bit_T == 32'h7073; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_106 = io_enq_uop_inst & 32'hfe007fff; // @[Decode.scala 14:65]
  wire  _bit_T_107 = _bit_T_106 == 32'h12000073; // @[Decode.scala 14:121]
  wire  _bit_T_108 = io_enq_uop_inst == 32'h73; // @[Decode.scala 14:121]
  wire  _bit_T_109 = io_enq_uop_inst == 32'h100073; // @[Decode.scala 14:121]
  wire  _bit_T_110 = io_enq_uop_inst == 32'h10200073; // @[Decode.scala 14:121]
  wire  _bit_T_111 = io_enq_uop_inst == 32'h30200073; // @[Decode.scala 14:121]
  wire  _bit_T_112 = io_enq_uop_inst == 32'h7b200073; // @[Decode.scala 14:121]
  wire  _bit_T_113 = io_enq_uop_inst == 32'h10500073; // @[Decode.scala 14:121]
  wire  bit_4 = _bit_T == 32'h100f; // @[Decode.scala 14:121]
  wire  _bit_T_117 = _bit_T == 32'hf; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_118 = io_enq_uop_inst & 32'hf800707f; // @[Decode.scala 14:65]
  wire  _bit_T_119 = _bit_T_118 == 32'h202f; // @[Decode.scala 14:121]
  wire  _bit_T_121 = _bit_T_118 == 32'h2000202f; // @[Decode.scala 14:121]
  wire  _bit_T_123 = _bit_T_118 == 32'h800202f; // @[Decode.scala 14:121]
  wire  _bit_T_125 = _bit_T_118 == 32'h6000202f; // @[Decode.scala 14:121]
  wire  _bit_T_127 = _bit_T_118 == 32'h4000202f; // @[Decode.scala 14:121]
  wire  _bit_T_129 = _bit_T_118 == 32'h8000202f; // @[Decode.scala 14:121]
  wire  _bit_T_131 = _bit_T_118 == 32'hc000202f; // @[Decode.scala 14:121]
  wire  _bit_T_133 = _bit_T_118 == 32'ha000202f; // @[Decode.scala 14:121]
  wire  _bit_T_135 = _bit_T_118 == 32'he000202f; // @[Decode.scala 14:121]
  wire  _bit_T_137 = _bit_T_118 == 32'h302f; // @[Decode.scala 14:121]
  wire  _bit_T_139 = _bit_T_118 == 32'h2000302f; // @[Decode.scala 14:121]
  wire  _bit_T_141 = _bit_T_118 == 32'h800302f; // @[Decode.scala 14:121]
  wire  _bit_T_143 = _bit_T_118 == 32'h6000302f; // @[Decode.scala 14:121]
  wire  _bit_T_145 = _bit_T_118 == 32'h4000302f; // @[Decode.scala 14:121]
  wire  _bit_T_147 = _bit_T_118 == 32'h8000302f; // @[Decode.scala 14:121]
  wire  _bit_T_149 = _bit_T_118 == 32'hc000302f; // @[Decode.scala 14:121]
  wire  _bit_T_151 = _bit_T_118 == 32'ha000302f; // @[Decode.scala 14:121]
  wire  _bit_T_153 = _bit_T_118 == 32'he000302f; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_154 = io_enq_uop_inst & 32'hf9f0707f; // @[Decode.scala 14:65]
  wire  _bit_T_155 = _bit_T_154 == 32'h1000202f; // @[Decode.scala 14:121]
  wire  _bit_T_157 = _bit_T_154 == 32'h1000302f; // @[Decode.scala 14:121]
  wire  _bit_T_159 = _bit_T_118 == 32'h1800202f; // @[Decode.scala 14:121]
  wire  _bit_T_161 = _bit_T_118 == 32'h1800302f; // @[Decode.scala 14:121]
  wire  _bit_T_163 = _bit_T == 32'h2007; // @[Decode.scala 14:121]
  wire  _bit_T_165 = _bit_T == 32'h3007; // @[Decode.scala 14:121]
  wire  _bit_T_167 = _bit_T == 32'h2027; // @[Decode.scala 14:121]
  wire  _bit_T_169 = _bit_T == 32'h3027; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_170 = io_enq_uop_inst & 32'hfff0707f; // @[Decode.scala 14:65]
  wire  _bit_T_171 = _bit_T_170 == 32'he0001053; // @[Decode.scala 14:121]
  wire  _bit_T_173 = _bit_T_170 == 32'he2001053; // @[Decode.scala 14:121]
  wire  _bit_T_175 = _bit_T_170 == 32'hf0000053; // @[Decode.scala 14:121]
  wire  _bit_T_177 = _bit_T_170 == 32'hf2000053; // @[Decode.scala 14:121]
  wire  _bit_T_179 = _bit_T_170 == 32'he0000053; // @[Decode.scala 14:121]
  wire  _bit_T_181 = _bit_T_170 == 32'he2000053; // @[Decode.scala 14:121]
  wire  _bit_T_183 = _bit_T_30 == 32'h20000053; // @[Decode.scala 14:121]
  wire  _bit_T_185 = _bit_T_30 == 32'h22000053; // @[Decode.scala 14:121]
  wire  _bit_T_187 = _bit_T_30 == 32'h20002053; // @[Decode.scala 14:121]
  wire  _bit_T_189 = _bit_T_30 == 32'h22002053; // @[Decode.scala 14:121]
  wire  _bit_T_191 = _bit_T_30 == 32'h20001053; // @[Decode.scala 14:121]
  wire  _bit_T_193 = _bit_T_30 == 32'h22001053; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_194 = io_enq_uop_inst & 32'hfff0007f; // @[Decode.scala 14:65]
  wire  _bit_T_195 = _bit_T_194 == 32'h40100053; // @[Decode.scala 14:121]
  wire  _bit_T_197 = _bit_T_194 == 32'h42000053; // @[Decode.scala 14:121]
  wire  _bit_T_199 = _bit_T_194 == 32'hd0000053; // @[Decode.scala 14:121]
  wire  _bit_T_201 = _bit_T_194 == 32'hd0100053; // @[Decode.scala 14:121]
  wire  _bit_T_203 = _bit_T_194 == 32'hd0200053; // @[Decode.scala 14:121]
  wire  _bit_T_205 = _bit_T_194 == 32'hd0300053; // @[Decode.scala 14:121]
  wire  _bit_T_207 = _bit_T_194 == 32'hd2000053; // @[Decode.scala 14:121]
  wire  _bit_T_209 = _bit_T_194 == 32'hd2100053; // @[Decode.scala 14:121]
  wire  _bit_T_211 = _bit_T_194 == 32'hd2200053; // @[Decode.scala 14:121]
  wire  _bit_T_213 = _bit_T_194 == 32'hd2300053; // @[Decode.scala 14:121]
  wire  _bit_T_215 = _bit_T_194 == 32'hc0000053; // @[Decode.scala 14:121]
  wire  _bit_T_217 = _bit_T_194 == 32'hc0100053; // @[Decode.scala 14:121]
  wire  _bit_T_219 = _bit_T_194 == 32'hc0200053; // @[Decode.scala 14:121]
  wire  _bit_T_221 = _bit_T_194 == 32'hc0300053; // @[Decode.scala 14:121]
  wire  _bit_T_223 = _bit_T_194 == 32'hc2000053; // @[Decode.scala 14:121]
  wire  _bit_T_225 = _bit_T_194 == 32'hc2100053; // @[Decode.scala 14:121]
  wire  _bit_T_227 = _bit_T_194 == 32'hc2200053; // @[Decode.scala 14:121]
  wire  _bit_T_229 = _bit_T_194 == 32'hc2300053; // @[Decode.scala 14:121]
  wire  _bit_T_231 = _bit_T_30 == 32'ha0002053; // @[Decode.scala 14:121]
  wire  _bit_T_233 = _bit_T_30 == 32'ha0001053; // @[Decode.scala 14:121]
  wire  _bit_T_235 = _bit_T_30 == 32'ha0000053; // @[Decode.scala 14:121]
  wire  _bit_T_237 = _bit_T_30 == 32'ha2002053; // @[Decode.scala 14:121]
  wire  _bit_T_239 = _bit_T_30 == 32'ha2001053; // @[Decode.scala 14:121]
  wire  _bit_T_241 = _bit_T_30 == 32'ha2000053; // @[Decode.scala 14:121]
  wire  _bit_T_243 = _bit_T_30 == 32'h28000053; // @[Decode.scala 14:121]
  wire  _bit_T_245 = _bit_T_30 == 32'h28001053; // @[Decode.scala 14:121]
  wire  _bit_T_247 = _bit_T_30 == 32'h2a000053; // @[Decode.scala 14:121]
  wire  _bit_T_249 = _bit_T_30 == 32'h2a001053; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_250 = io_enq_uop_inst & 32'hfe00007f; // @[Decode.scala 14:65]
  wire  _bit_T_251 = _bit_T_250 == 32'h53; // @[Decode.scala 14:121]
  wire  _bit_T_253 = _bit_T_250 == 32'h8000053; // @[Decode.scala 14:121]
  wire  _bit_T_255 = _bit_T_250 == 32'h10000053; // @[Decode.scala 14:121]
  wire  _bit_T_257 = _bit_T_250 == 32'h2000053; // @[Decode.scala 14:121]
  wire  _bit_T_259 = _bit_T_250 == 32'ha000053; // @[Decode.scala 14:121]
  wire  _bit_T_261 = _bit_T_250 == 32'h12000053; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_262 = io_enq_uop_inst & 32'h600007f; // @[Decode.scala 14:65]
  wire  _bit_T_263 = _bit_T_262 == 32'h43; // @[Decode.scala 14:121]
  wire  _bit_T_265 = _bit_T_262 == 32'h47; // @[Decode.scala 14:121]
  wire  _bit_T_267 = _bit_T_262 == 32'h4f; // @[Decode.scala 14:121]
  wire  _bit_T_269 = _bit_T_262 == 32'h4b; // @[Decode.scala 14:121]
  wire  _bit_T_271 = _bit_T_262 == 32'h2000043; // @[Decode.scala 14:121]
  wire  _bit_T_273 = _bit_T_262 == 32'h2000047; // @[Decode.scala 14:121]
  wire  _bit_T_275 = _bit_T_262 == 32'h200004f; // @[Decode.scala 14:121]
  wire  _bit_T_277 = _bit_T_262 == 32'h200004b; // @[Decode.scala 14:121]
  wire  _bit_T_279 = _bit_T_250 == 32'h18000053; // @[Decode.scala 14:121]
  wire  _bit_T_281 = _bit_T_250 == 32'h1a000053; // @[Decode.scala 14:121]
  wire  _bit_T_283 = _bit_T_194 == 32'h58000053; // @[Decode.scala 14:121]
  wire  _bit_T_285 = _bit_T_194 == 32'h5a000053; // @[Decode.scala 14:121]
  wire  _bit_T_287 = _bit_T == 32'h3003; // @[Decode.scala 14:121]
  wire  _bit_T_289 = _bit_T == 32'h6003; // @[Decode.scala 14:121]
  wire  _bit_T_291 = _bit_T == 32'h3023; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_292 = io_enq_uop_inst & 32'hfc00707f; // @[Decode.scala 14:65]
  wire  _bit_T_293 = _bit_T_292 == 32'h1013; // @[Decode.scala 14:121]
  wire  _bit_T_295 = _bit_T_292 == 32'h5013; // @[Decode.scala 14:121]
  wire  _bit_T_297 = _bit_T_292 == 32'h40005013; // @[Decode.scala 14:121]
  wire  _bit_T_299 = _bit_T == 32'h1b; // @[Decode.scala 14:121]
  wire  _bit_T_301 = _bit_T_30 == 32'h101b; // @[Decode.scala 14:121]
  wire  _bit_T_303 = _bit_T_30 == 32'h4000501b; // @[Decode.scala 14:121]
  wire  _bit_T_305 = _bit_T_30 == 32'h501b; // @[Decode.scala 14:121]
  wire  _bit_T_307 = _bit_T_30 == 32'h3b; // @[Decode.scala 14:121]
  wire  _bit_T_309 = _bit_T_30 == 32'h4000003b; // @[Decode.scala 14:121]
  wire  _bit_T_311 = _bit_T_30 == 32'h103b; // @[Decode.scala 14:121]
  wire  _bit_T_313 = _bit_T_30 == 32'h4000503b; // @[Decode.scala 14:121]
  wire  _bit_T_315 = _bit_T_30 == 32'h503b; // @[Decode.scala 14:121]
  wire  _bit_T_346 = _bit_T_1 | _bit_T_3 | _bit_T_5 | _bit_T_7 | _bit_T_9 | _bit_T_11 | _bit_T_13 | _bit_T_15 |
    _bit_T_17 | _bit_T_19 | _bit_T_21 | _bit_T_23 | _bit_T_25 | _bit_T_27 | _bit_T_29 | _bit_T_31 | _bit_T_33 |
    _bit_T_35 | _bit_T_37 | _bit_T_39 | _bit_T_41 | _bit_T_43 | _bit_T_45 | _bit_T_47 | _bit_T_49 | _bit_T_51 |
    _bit_T_53 | _bit_T_55 | _bit_T_57 | _bit_T_59 | _bit_T_61; // @[Decode.scala 15:30]
  wire  _bit_T_376 = _bit_T_346 | _bit_T_63 | _bit_T_65 | _bit_T_67 | _bit_T_69 | _bit_T_71 | _bit_T_73 | _bit_T_75 |
    _bit_T_77 | _bit_T_79 | _bit_T_81 | _bit_T_83 | _bit_T_85 | _bit_T_87 | _bit_T_89 | _bit_T_91 | _bit_T_93 |
    _bit_T_95 | _bit_T_97 | _bit_T_99 | _bit_T_101 | _bit_T_103 | _bit_T_105 | _bit_T_107 | _bit_T_108 | _bit_T_109 |
    _bit_T_110 | _bit_T_111 | _bit_T_112 | _bit_T_113 | bit_4; // @[Decode.scala 15:30]
  wire  _bit_T_406 = _bit_T_376 | _bit_T_117 | _bit_T_119 | _bit_T_121 | _bit_T_123 | _bit_T_125 | _bit_T_127 |
    _bit_T_129 | _bit_T_131 | _bit_T_133 | _bit_T_135 | _bit_T_137 | _bit_T_139 | _bit_T_141 | _bit_T_143 | _bit_T_145
     | _bit_T_147 | _bit_T_149 | _bit_T_151 | _bit_T_153 | _bit_T_155 | _bit_T_157 | _bit_T_159 | _bit_T_161 |
    _bit_T_163 | _bit_T_165 | _bit_T_167 | _bit_T_169 | _bit_T_171 | _bit_T_173 | _bit_T_175; // @[Decode.scala 15:30]
  wire  _bit_T_436 = _bit_T_406 | _bit_T_177 | _bit_T_179 | _bit_T_181 | _bit_T_183 | _bit_T_185 | _bit_T_187 |
    _bit_T_189 | _bit_T_191 | _bit_T_193 | _bit_T_195 | _bit_T_197 | _bit_T_199 | _bit_T_201 | _bit_T_203 | _bit_T_205
     | _bit_T_207 | _bit_T_209 | _bit_T_211 | _bit_T_213 | _bit_T_215 | _bit_T_217 | _bit_T_219 | _bit_T_221 |
    _bit_T_223 | _bit_T_225 | _bit_T_227 | _bit_T_229 | _bit_T_231 | _bit_T_233 | _bit_T_235; // @[Decode.scala 15:30]
  wire  _bit_T_466 = _bit_T_436 | _bit_T_237 | _bit_T_239 | _bit_T_241 | _bit_T_243 | _bit_T_245 | _bit_T_247 |
    _bit_T_249 | _bit_T_251 | _bit_T_253 | _bit_T_255 | _bit_T_257 | _bit_T_259 | _bit_T_261 | _bit_T_263 | _bit_T_265
     | _bit_T_267 | _bit_T_269 | _bit_T_271 | _bit_T_273 | _bit_T_275 | _bit_T_277 | _bit_T_279 | _bit_T_281 |
    _bit_T_283 | _bit_T_285 | _bit_T_287 | _bit_T_289 | _bit_T_291 | _bit_T_293 | _bit_T_295; // @[Decode.scala 15:30]
  wire  bit_ = _bit_T_466 | _bit_T_297 | _bit_T_299 | _bit_T_301 | _bit_T_303 | _bit_T_305 | _bit_T_307 | _bit_T_309 |
    _bit_T_311 | _bit_T_313 | _bit_T_315; // @[Decode.scala 15:30]
  wire  _bit_T_506 = _bit_T_163 | _bit_T_165 | _bit_T_167 | _bit_T_169 | _bit_T_171 | _bit_T_173 | _bit_T_175 |
    _bit_T_177 | _bit_T_179 | _bit_T_181 | _bit_T_183 | _bit_T_185 | _bit_T_187 | _bit_T_189 | _bit_T_191 | _bit_T_193
     | _bit_T_195 | _bit_T_197 | _bit_T_199 | _bit_T_201 | _bit_T_203 | _bit_T_205 | _bit_T_207 | _bit_T_209 |
    _bit_T_211 | _bit_T_213 | _bit_T_215 | _bit_T_217 | _bit_T_219 | _bit_T_221 | _bit_T_223; // @[Decode.scala 15:30]
  wire  _bit_T_536 = _bit_T_506 | _bit_T_225 | _bit_T_227 | _bit_T_229 | _bit_T_231 | _bit_T_233 | _bit_T_235 |
    _bit_T_237 | _bit_T_239 | _bit_T_241 | _bit_T_243 | _bit_T_245 | _bit_T_247 | _bit_T_249 | _bit_T_251 | _bit_T_253
     | _bit_T_255 | _bit_T_257 | _bit_T_259 | _bit_T_261 | _bit_T_263 | _bit_T_265 | _bit_T_267 | _bit_T_269 |
    _bit_T_271 | _bit_T_273 | _bit_T_275 | _bit_T_277 | _bit_T_279 | _bit_T_281 | _bit_T_283; // @[Decode.scala 15:30]
  wire  bit_1 = _bit_T_536 | _bit_T_285; // @[Decode.scala 15:30]
  wire [31:0] _T = io_enq_uop_inst & 32'h1040; // @[Decode.scala 14:65]
  wire  _T_1 = _T == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_2 = io_enq_uop_inst & 32'h2000040; // @[Decode.scala 14:65]
  wire  _T_3 = _T_2 == 32'h40; // @[Decode.scala 14:121]
  wire  cs__fp_single = _T_1 | _T_3; // @[Decode.scala 15:30]
  wire [31:0] _T_6 = io_enq_uop_inst & 32'h5064; // @[Decode.scala 14:65]
  wire  _T_7 = _T_6 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_8 = io_enq_uop_inst & 32'h3c; // @[Decode.scala 14:65]
  wire  _T_9 = _T_8 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_10 = io_enq_uop_inst & 32'h6c; // @[Decode.scala 14:65]
  wire  _T_11 = _T_10 == 32'h4; // @[Decode.scala 14:121]
  wire [31:0] _T_12 = io_enq_uop_inst & 32'h38; // @[Decode.scala 14:65]
  wire  _T_13 = _T_12 == 32'h28; // @[Decode.scala 14:121]
  wire [31:0] _T_14 = io_enq_uop_inst & 32'h6a00006c; // @[Decode.scala 14:65]
  wire  _T_15 = _T_14 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_16 = io_enq_uop_inst & 32'h4c; // @[Decode.scala 14:65]
  wire  _T_17 = _T_16 == 32'h4c; // @[Decode.scala 14:121]
  wire [31:0] _T_18 = io_enq_uop_inst & 32'h40003068; // @[Decode.scala 14:65]
  wire  _T_19 = _T_18 == 32'h1000; // @[Decode.scala 14:121]
  wire [31:0] _T_20 = io_enq_uop_inst & 32'h2001028; // @[Decode.scala 14:65]
  wire  _T_21 = _T_20 == 32'h1028; // @[Decode.scala 14:121]
  wire [31:0] _T_22 = io_enq_uop_inst & 32'h505c; // @[Decode.scala 14:65]
  wire  _T_23 = _T_22 == 32'h1040; // @[Decode.scala 14:121]
  wire [31:0] _T_24 = io_enq_uop_inst & 32'h3060; // @[Decode.scala 14:65]
  wire  _T_25 = _T_24 == 32'h2000; // @[Decode.scala 14:121]
  wire [31:0] _T_26 = io_enq_uop_inst & 32'h7060; // @[Decode.scala 14:65]
  wire  _T_27 = _T_26 == 32'h2060; // @[Decode.scala 14:121]
  wire [31:0] _T_28 = io_enq_uop_inst & 32'h42005064; // @[Decode.scala 14:65]
  wire  _T_29 = _T_28 == 32'h5020; // @[Decode.scala 14:121]
  wire [31:0] _T_30 = io_enq_uop_inst & 32'h5070; // @[Decode.scala 14:65]
  wire  _T_31 = _T_30 == 32'h5070; // @[Decode.scala 14:121]
  wire [31:0] _T_32 = io_enq_uop_inst & 32'h601c; // @[Decode.scala 14:65]
  wire  _T_33 = _T_32 == 32'h6000; // @[Decode.scala 14:121]
  wire [31:0] _T_34 = io_enq_uop_inst & 32'h2007054; // @[Decode.scala 14:65]
  wire  _T_35 = _T_34 == 32'h2001010; // @[Decode.scala 14:121]
  wire [31:0] _T_36 = io_enq_uop_inst & 32'h1a00006c; // @[Decode.scala 14:65]
  wire  _T_37 = _T_36 == 32'ha000040; // @[Decode.scala 14:121]
  wire [31:0] _T_38 = io_enq_uop_inst & 32'h92205014; // @[Decode.scala 14:65]
  wire  _T_39 = _T_38 == 32'h10000010; // @[Decode.scala 14:121]
  wire [31:0] _T_40 = io_enq_uop_inst & 32'h9200006c; // @[Decode.scala 14:65]
  wire  _T_41 = _T_40 == 32'h10000040; // @[Decode.scala 14:121]
  wire [31:0] _T_42 = io_enq_uop_inst & 32'h52005034; // @[Decode.scala 14:65]
  wire  _T_43 = _T_42 == 32'h12000030; // @[Decode.scala 14:121]
  wire [31:0] _T_44 = io_enq_uop_inst & 32'h2200602c; // @[Decode.scala 14:65]
  wire  _T_45 = _T_44 == 32'h22000000; // @[Decode.scala 14:121]
  wire [31:0] _T_46 = io_enq_uop_inst & 32'h2200502c; // @[Decode.scala 14:65]
  wire  _T_47 = _T_46 == 32'h22000000; // @[Decode.scala 14:121]
  wire [31:0] _T_48 = io_enq_uop_inst & 32'h4000404c; // @[Decode.scala 14:65]
  wire  _T_49 = _T_48 == 32'h40000008; // @[Decode.scala 14:121]
  wire [31:0] _T_50 = io_enq_uop_inst & 32'h5200006c; // @[Decode.scala 14:65]
  wire  _T_51 = _T_50 == 32'h42000040; // @[Decode.scala 14:121]
  wire [31:0] _T_52 = io_enq_uop_inst & 32'h8200006c; // @[Decode.scala 14:65]
  wire  _T_53 = _T_52 == 32'h82000040; // @[Decode.scala 14:121]
  wire [31:0] _T_54 = io_enq_uop_inst & 32'h4200505c; // @[Decode.scala 14:65]
  wire  _T_55 = _T_54 == 32'h10; // @[Decode.scala 14:121]
  wire [31:0] _T_56 = io_enq_uop_inst & 32'h7064; // @[Decode.scala 14:65]
  wire  _T_57 = _T_56 == 32'h4020; // @[Decode.scala 14:121]
  wire [31:0] _T_58 = io_enq_uop_inst & 32'h2003054; // @[Decode.scala 14:65]
  wire  _T_59 = _T_58 == 32'h2002010; // @[Decode.scala 14:121]
  wire  lo_lo = _T_7 | _T_9 | _T_11 | _T_13 | _T_15 | _T_17 | _T_19 | _T_21 | _T_23 | _T_25 | _T_27 | _T_29 | _T_31 |
    _T_33 | _T_35 | _T_37 | _T_39 | _T_41 | _T_43 | _T_45 | _T_47 | _T_49 | _T_51 | _T_53 | _T_55 | _T_57 | _T_59; // @[Decode.scala 15:30]
  wire [31:0] _T_86 = io_enq_uop_inst & 32'h201c; // @[Decode.scala 14:65]
  wire  _T_87 = _T_86 == 32'h4; // @[Decode.scala 14:121]
  wire [31:0] _T_88 = io_enq_uop_inst & 32'h1068; // @[Decode.scala 14:65]
  wire  _T_89 = _T_88 == 32'h8; // @[Decode.scala 14:121]
  wire [31:0] _T_90 = io_enq_uop_inst & 32'h34; // @[Decode.scala 14:65]
  wire  _T_91 = _T_90 == 32'h14; // @[Decode.scala 14:121]
  wire [31:0] _T_92 = io_enq_uop_inst & 32'h4200606c; // @[Decode.scala 14:65]
  wire  _T_93 = _T_92 == 32'h20; // @[Decode.scala 14:121]
  wire [31:0] _T_94 = io_enq_uop_inst & 32'h10000070; // @[Decode.scala 14:65]
  wire  _T_95 = _T_94 == 32'h20; // @[Decode.scala 14:121]
  wire [31:0] _T_96 = io_enq_uop_inst & 32'h78; // @[Decode.scala 14:65]
  wire  _T_97 = _T_96 == 32'h20; // @[Decode.scala 14:121]
  wire [31:0] _T_98 = io_enq_uop_inst & 32'h4240603c; // @[Decode.scala 14:65]
  wire  _T_99 = _T_98 == 32'h30; // @[Decode.scala 14:121]
  wire [31:0] _T_100 = io_enq_uop_inst & 32'h64; // @[Decode.scala 14:65]
  wire  _T_101 = _T_100 == 32'h44; // @[Decode.scala 14:121]
  wire [31:0] _T_102 = io_enq_uop_inst & 32'h38000070; // @[Decode.scala 14:65]
  wire  _T_103 = _T_102 == 32'h50; // @[Decode.scala 14:121]
  wire [31:0] _T_104 = io_enq_uop_inst & 32'h4200104c; // @[Decode.scala 14:65]
  wire  _T_105 = _T_104 == 32'h1008; // @[Decode.scala 14:121]
  wire [31:0] _T_106 = io_enq_uop_inst & 32'h38005030; // @[Decode.scala 14:65]
  wire  _T_107 = _T_106 == 32'h1010; // @[Decode.scala 14:121]
  wire [31:0] _T_108 = io_enq_uop_inst & 32'h200106c; // @[Decode.scala 14:65]
  wire  _T_109 = _T_108 == 32'h1020; // @[Decode.scala 14:121]
  wire [31:0] _T_110 = io_enq_uop_inst & 32'h7070; // @[Decode.scala 14:65]
  wire  _T_111 = _T_110 == 32'h1070; // @[Decode.scala 14:121]
  wire [31:0] _T_112 = io_enq_uop_inst & 32'h3070; // @[Decode.scala 14:65]
  wire  _T_113 = _T_112 == 32'h2070; // @[Decode.scala 14:121]
  wire  _T_115 = _T_112 == 32'h3010; // @[Decode.scala 14:121]
  wire [31:0] _T_116 = io_enq_uop_inst & 32'h40007064; // @[Decode.scala 14:65]
  wire  _T_117 = _T_116 == 32'h5020; // @[Decode.scala 14:121]
  wire [31:0] _T_118 = io_enq_uop_inst & 32'h5038; // @[Decode.scala 14:65]
  wire  _T_119 = _T_118 == 32'h5020; // @[Decode.scala 14:121]
  wire [31:0] _T_120 = io_enq_uop_inst & 32'h6070; // @[Decode.scala 14:65]
  wire  _T_121 = _T_120 == 32'h6010; // @[Decode.scala 14:121]
  wire [31:0] _T_122 = io_enq_uop_inst & 32'h2003064; // @[Decode.scala 14:65]
  wire  _T_123 = _T_122 == 32'h2002020; // @[Decode.scala 14:121]
  wire [31:0] _T_124 = io_enq_uop_inst & 32'h8000070; // @[Decode.scala 14:65]
  wire  _T_125 = _T_124 == 32'h8000020; // @[Decode.scala 14:121]
  wire [31:0] _T_126 = io_enq_uop_inst & 32'h6a000070; // @[Decode.scala 14:65]
  wire  _T_127 = _T_126 == 32'ha000050; // @[Decode.scala 14:121]
  wire [31:0] _T_128 = io_enq_uop_inst & 32'h12006034; // @[Decode.scala 14:65]
  wire  _T_129 = _T_128 == 32'h12000030; // @[Decode.scala 14:121]
  wire [31:0] _T_130 = io_enq_uop_inst & 32'hc2000070; // @[Decode.scala 14:65]
  wire  _T_131 = _T_130 == 32'h40000050; // @[Decode.scala 14:121]
  wire [31:0] _T_132 = io_enq_uop_inst & 32'h50006050; // @[Decode.scala 14:65]
  wire  _T_133 = _T_132 == 32'h40000050; // @[Decode.scala 14:121]
  wire  _T_135 = _T_56 == 32'h3020; // @[Decode.scala 14:121]
  wire  _T_137 = _T_120 == 32'h6070; // @[Decode.scala 14:121]
  wire  lo_hi_lo = _T_87 | _T_89 | _T_91 | _T_93 | _T_95 | _T_97 | _T_99 | _T_101 | _T_103 | _T_105 | _T_107 | _T_109 |
    _T_111 | _T_113 | _T_115 | _T_117 | _T_119 | _T_121 | _T_123 | _T_125 | _T_127 | _T_129 | _T_131 | _T_133 | _T_135
     | _T_137; // @[Decode.scala 15:30]
  wire [31:0] _T_163 = io_enq_uop_inst & 32'h7078; // @[Decode.scala 14:65]
  wire  _T_164 = _T_163 == 32'h10; // @[Decode.scala 14:121]
  wire [31:0] _T_165 = io_enq_uop_inst & 32'h14; // @[Decode.scala 14:65]
  wire  _T_166 = _T_165 == 32'h14; // @[Decode.scala 14:121]
  wire [31:0] _T_167 = io_enq_uop_inst & 32'h2024; // @[Decode.scala 14:65]
  wire  _T_168 = _T_167 == 32'h24; // @[Decode.scala 14:121]
  wire [31:0] _T_169 = io_enq_uop_inst & 32'h2006028; // @[Decode.scala 14:65]
  wire  _T_170 = _T_169 == 32'h28; // @[Decode.scala 14:121]
  wire [31:0] _T_171 = io_enq_uop_inst & 32'h7a000068; // @[Decode.scala 14:65]
  wire  _T_172 = _T_171 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_173 = io_enq_uop_inst & 32'h2000078; // @[Decode.scala 14:65]
  wire  _T_174 = _T_173 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_175 = io_enq_uop_inst & 32'h2000044; // @[Decode.scala 14:65]
  wire  _T_176 = _T_175 == 32'h44; // @[Decode.scala 14:121]
  wire [31:0] _T_177 = io_enq_uop_inst & 32'h68; // @[Decode.scala 14:65]
  wire  _T_178 = _T_177 == 32'h68; // @[Decode.scala 14:121]
  wire [31:0] _T_179 = io_enq_uop_inst & 32'h504c; // @[Decode.scala 14:65]
  wire  _T_180 = _T_179 == 32'h1008; // @[Decode.scala 14:121]
  wire [31:0] _T_181 = io_enq_uop_inst & 32'h7030; // @[Decode.scala 14:65]
  wire  _T_182 = _T_181 == 32'h1030; // @[Decode.scala 14:121]
  wire [31:0] _T_183 = io_enq_uop_inst & 32'h5048; // @[Decode.scala 14:65]
  wire  _T_184 = _T_183 == 32'h4008; // @[Decode.scala 14:121]
  wire [31:0] _T_185 = io_enq_uop_inst & 32'h2006068; // @[Decode.scala 14:65]
  wire  _T_186 = _T_185 == 32'h4020; // @[Decode.scala 14:121]
  wire [31:0] _T_187 = io_enq_uop_inst & 32'h2005060; // @[Decode.scala 14:65]
  wire  _T_188 = _T_187 == 32'h4020; // @[Decode.scala 14:121]
  wire [31:0] _T_189 = io_enq_uop_inst & 32'h5030; // @[Decode.scala 14:65]
  wire  _T_190 = _T_189 == 32'h4020; // @[Decode.scala 14:121]
  wire [31:0] _T_191 = io_enq_uop_inst & 32'h5078; // @[Decode.scala 14:65]
  wire  _T_192 = _T_191 == 32'h5010; // @[Decode.scala 14:121]
  wire [31:0] _T_193 = io_enq_uop_inst & 32'h200001c; // @[Decode.scala 14:65]
  wire  _T_194 = _T_193 == 32'h2000008; // @[Decode.scala 14:121]
  wire [31:0] _T_195 = io_enq_uop_inst & 32'h2004078; // @[Decode.scala 14:65]
  wire  _T_196 = _T_195 == 32'h2000030; // @[Decode.scala 14:121]
  wire [31:0] _T_197 = io_enq_uop_inst & 32'h2003078; // @[Decode.scala 14:65]
  wire  _T_198 = _T_197 == 32'h2003030; // @[Decode.scala 14:121]
  wire [31:0] _T_199 = io_enq_uop_inst & 32'h2006048; // @[Decode.scala 14:65]
  wire  _T_200 = _T_199 == 32'h2004008; // @[Decode.scala 14:121]
  wire [31:0] _T_201 = io_enq_uop_inst & 32'h52000070; // @[Decode.scala 14:65]
  wire  _T_202 = _T_201 == 32'h12000050; // @[Decode.scala 14:121]
  wire [31:0] _T_203 = io_enq_uop_inst & 32'h58000070; // @[Decode.scala 14:65]
  wire  _T_204 = _T_203 == 32'h18000050; // @[Decode.scala 14:121]
  wire [31:0] _T_205 = io_enq_uop_inst & 32'h68006018; // @[Decode.scala 14:65]
  wire  _T_206 = _T_205 == 32'h28000010; // @[Decode.scala 14:121]
  wire [31:0] _T_207 = io_enq_uop_inst & 32'hc2100068; // @[Decode.scala 14:65]
  wire  _T_208 = _T_207 == 32'h40000040; // @[Decode.scala 14:121]
  wire [31:0] _T_209 = io_enq_uop_inst & 32'ha0000070; // @[Decode.scala 14:65]
  wire  _T_210 = _T_209 == 32'h80000050; // @[Decode.scala 14:121]
  wire [31:0] _T_211 = io_enq_uop_inst & 32'hc0007018; // @[Decode.scala 14:65]
  wire  _T_212 = _T_211 == 32'hc0000010; // @[Decode.scala 14:121]
  wire [31:0] _T_213 = io_enq_uop_inst & 32'h42006070; // @[Decode.scala 14:65]
  wire  _T_214 = _T_213 == 32'h30; // @[Decode.scala 14:121]
  wire  lo_hi_hi = _T_164 | _T_166 | _T_168 | _T_170 | _T_172 | _T_174 | _T_176 | _T_178 | _T_180 | _T_182 | _T_27 |
    _T_184 | _T_186 | _T_188 | _T_190 | _T_192 | _T_121 | _T_194 | _T_196 | _T_198 | _T_200 | _T_202 | _T_204 | _T_206
     | _T_208 | _T_210 | _T_212 | _T_214; // @[Decode.scala 15:30]
  wire [31:0] _T_242 = io_enq_uop_inst & 32'h3048; // @[Decode.scala 14:65]
  wire  _T_243 = _T_242 == 32'h8; // @[Decode.scala 14:121]
  wire [31:0] _T_244 = io_enq_uop_inst & 32'h42006034; // @[Decode.scala 14:65]
  wire  _T_245 = _T_244 == 32'h30; // @[Decode.scala 14:121]
  wire [31:0] _T_246 = io_enq_uop_inst & 32'h2000064; // @[Decode.scala 14:65]
  wire  _T_247 = _T_246 == 32'h44; // @[Decode.scala 14:121]
  wire [31:0] _T_248 = io_enq_uop_inst & 32'h6064; // @[Decode.scala 14:65]
  wire  _T_249 = _T_248 == 32'h60; // @[Decode.scala 14:121]
  wire  _T_251 = _T_6 == 32'h60; // @[Decode.scala 14:121]
  wire [31:0] _T_252 = io_enq_uop_inst & 32'h74; // @[Decode.scala 14:65]
  wire  cs__is_br = _T_252 == 32'h60; // @[Decode.scala 14:121]
  wire  _T_255 = _T_34 == 32'h1010; // @[Decode.scala 14:121]
  wire [31:0] _T_256 = io_enq_uop_inst & 32'h307c; // @[Decode.scala 14:65]
  wire  _T_257 = _T_256 == 32'h1010; // @[Decode.scala 14:121]
  wire [31:0] _T_258 = io_enq_uop_inst & 32'h6074; // @[Decode.scala 14:65]
  wire  _T_259 = _T_258 == 32'h2010; // @[Decode.scala 14:121]
  wire [31:0] _T_260 = io_enq_uop_inst & 32'h2006064; // @[Decode.scala 14:65]
  wire  _T_261 = _T_260 == 32'h2004020; // @[Decode.scala 14:121]
  wire [31:0] _T_262 = io_enq_uop_inst & 32'h2005064; // @[Decode.scala 14:65]
  wire  _T_263 = _T_262 == 32'h2004020; // @[Decode.scala 14:121]
  wire [31:0] _T_264 = io_enq_uop_inst & 32'h200406c; // @[Decode.scala 14:65]
  wire  _T_265 = _T_264 == 32'h2004020; // @[Decode.scala 14:121]
  wire  _T_267 = _T_102 == 32'h8000050; // @[Decode.scala 14:121]
  wire [31:0] _T_268 = io_enq_uop_inst & 32'h98000070; // @[Decode.scala 14:65]
  wire  _T_269 = _T_268 == 32'h10000050; // @[Decode.scala 14:121]
  wire [31:0] _T_270 = io_enq_uop_inst & 32'ha8006050; // @[Decode.scala 14:65]
  wire  _T_271 = _T_270 == 32'h20000050; // @[Decode.scala 14:121]
  wire [31:0] _T_272 = io_enq_uop_inst & 32'ha8005050; // @[Decode.scala 14:65]
  wire  _T_273 = _T_272 == 32'h20000050; // @[Decode.scala 14:121]
  wire  _T_275 = _T_130 == 32'h42000050; // @[Decode.scala 14:121]
  wire [31:0] _T_276 = io_enq_uop_inst & 32'h7074; // @[Decode.scala 14:65]
  wire  _T_277 = _T_276 == 32'h4010; // @[Decode.scala 14:121]
  wire [31:0] _T_278 = io_enq_uop_inst & 32'h70000070; // @[Decode.scala 14:65]
  wire  _T_279 = _T_278 == 32'h40000050; // @[Decode.scala 14:121]
  wire [31:0] _T_280 = io_enq_uop_inst & 32'h8a000070; // @[Decode.scala 14:65]
  wire  _T_281 = _T_280 == 32'h2000050; // @[Decode.scala 14:121]
  wire  hi_lo_lo = _T_243 | _T_245 | _T_174 | _T_247 | _T_249 | _T_251 | cs__is_br | _T_255 | _T_257 | _T_259 | _T_261
     | _T_263 | _T_265 | _T_267 | _T_269 | _T_271 | _T_273 | _T_275 | _T_210 | _T_277 | _T_279 | _T_281; // @[Decode.scala 15:30]
  wire  _T_304 = _T_278 == 32'h50; // @[Decode.scala 14:121]
  wire [31:0] _T_305 = io_enq_uop_inst & 32'h68000070; // @[Decode.scala 14:65]
  wire  _T_306 = _T_305 == 32'h50; // @[Decode.scala 14:121]
  wire [31:0] _T_307 = io_enq_uop_inst & 32'h7068; // @[Decode.scala 14:65]
  wire  _T_308 = _T_307 == 32'h1060; // @[Decode.scala 14:121]
  wire [31:0] _T_309 = io_enq_uop_inst & 32'h207c; // @[Decode.scala 14:65]
  wire  _T_310 = _T_309 == 32'h2030; // @[Decode.scala 14:121]
  wire  _T_312 = _T_307 == 32'h2060; // @[Decode.scala 14:121]
  wire [31:0] _T_313 = io_enq_uop_inst & 32'h2004048; // @[Decode.scala 14:65]
  wire  _T_314 = _T_313 == 32'h4008; // @[Decode.scala 14:121]
  wire  _T_316 = _T_248 == 32'h4020; // @[Decode.scala 14:121]
  wire  _T_318 = _T_6 == 32'h4020; // @[Decode.scala 14:121]
  wire [31:0] _T_319 = io_enq_uop_inst & 32'h12003034; // @[Decode.scala 14:65]
  wire  _T_320 = _T_319 == 32'h2000030; // @[Decode.scala 14:121]
  wire [31:0] _T_321 = io_enq_uop_inst & 32'h200007c; // @[Decode.scala 14:65]
  wire  _T_322 = _T_321 == 32'h2000030; // @[Decode.scala 14:121]
  wire [31:0] _T_323 = io_enq_uop_inst & 32'h18006050; // @[Decode.scala 14:65]
  wire  _T_324 = _T_323 == 32'h8000050; // @[Decode.scala 14:121]
  wire [31:0] _T_325 = io_enq_uop_inst & 32'h6000603c; // @[Decode.scala 14:65]
  wire  _T_326 = _T_325 == 32'h40000030; // @[Decode.scala 14:121]
  wire [31:0] _T_327 = io_enq_uop_inst & 32'hc0005050; // @[Decode.scala 14:65]
  wire  _T_328 = _T_327 == 32'h80000050; // @[Decode.scala 14:121]
  wire [31:0] _T_329 = io_enq_uop_inst & 32'ha0007014; // @[Decode.scala 14:65]
  wire  _T_330 = _T_329 == 32'ha0001010; // @[Decode.scala 14:121]
  wire  hi_lo_hi = _T_174 | _T_247 | _T_304 | _T_306 | cs__is_br | _T_308 | _T_310 | _T_312 | _T_314 | _T_316 | _T_318
     | _T_320 | _T_322 | _T_324 | _T_326 | _T_328 | _T_330; // @[Decode.scala 15:30]
  wire [31:0] _T_347 = io_enq_uop_inst & 32'h2034; // @[Decode.scala 14:65]
  wire  _T_348 = _T_347 == 32'h24; // @[Decode.scala 14:121]
  wire  _T_350 = _T_112 == 32'h70; // @[Decode.scala 14:121]
  wire  _T_352 = _T_112 == 32'h3070; // @[Decode.scala 14:121]
  wire [31:0] _T_353 = io_enq_uop_inst & 32'h4070; // @[Decode.scala 14:65]
  wire  _T_354 = _T_353 == 32'h4070; // @[Decode.scala 14:121]
  wire [31:0] _T_355 = io_enq_uop_inst & 32'h2000070; // @[Decode.scala 14:65]
  wire  _T_356 = _T_355 == 32'h2000040; // @[Decode.scala 14:121]
  wire [31:0] _T_357 = io_enq_uop_inst & 32'h18000070; // @[Decode.scala 14:65]
  wire  hi_hi_lo_1 = _T_357 == 32'h18000050; // @[Decode.scala 14:121]
  wire [31:0] _T_359 = io_enq_uop_inst & 32'h200000c; // @[Decode.scala 14:65]
  wire  _T_360 = _T_359 == 32'h8; // @[Decode.scala 14:121]
  wire [31:0] _T_361 = io_enq_uop_inst & 32'h200c; // @[Decode.scala 14:65]
  wire  _T_362 = _T_361 == 32'h8; // @[Decode.scala 14:121]
  wire  hi_hi_lo = _T_243 | _T_91 | _T_348 | _T_178 | _T_350 | _T_352 | _T_354 | _T_322 | _T_356 | _T_263 | hi_hi_lo_1
     | _T_360 | _T_362; // @[Decode.scala 15:30]
  wire [31:0] _T_375 = io_enq_uop_inst & 32'h60; // @[Decode.scala 14:65]
  wire  _T_376 = _T_375 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_377 = io_enq_uop_inst & 32'h3050; // @[Decode.scala 14:65]
  wire  _T_378 = _T_377 == 32'h50; // @[Decode.scala 14:121]
  wire [31:0] _T_379 = io_enq_uop_inst & 32'h10006048; // @[Decode.scala 14:65]
  wire  _T_380 = _T_379 == 32'h2008; // @[Decode.scala 14:121]
  wire [31:0] _T_381 = io_enq_uop_inst & 32'h10003048; // @[Decode.scala 14:65]
  wire  _T_382 = _T_381 == 32'h3008; // @[Decode.scala 14:121]
  wire [31:0] _T_383 = io_enq_uop_inst & 32'h8002048; // @[Decode.scala 14:65]
  wire  _T_384 = _T_383 == 32'h8002008; // @[Decode.scala 14:121]
  wire  hi_hi_hi = _T_376 | _T_378 | _T_380 | _T_382 | _T_384; // @[Decode.scala 15:30]
  wire [2:0] lo = {lo_hi_hi,lo_hi_lo,lo_lo}; // @[Cat.scala 30:58]
  wire [3:0] hi = {hi_hi_hi,hi_hi_lo,hi_lo_hi,hi_lo_lo}; // @[Cat.scala 30:58]
  wire [6:0] cs__uopc = {hi_hi_hi,hi_hi_lo,hi_lo_hi,hi_lo_lo,lo_hi_hi,lo_hi_lo,lo_lo}; // @[Cat.scala 30:58]
  wire  _bit_T_567 = _bit_T_1 | _bit_T_3 | _bit_T_5 | _bit_T_7 | _bit_T_9 | _bit_T_11 | _bit_T_13 | _bit_T_15 |
    _bit_T_107 | _bit_T_119 | _bit_T_121 | _bit_T_123 | _bit_T_125 | _bit_T_127 | _bit_T_129 | _bit_T_131 | _bit_T_133
     | _bit_T_135 | _bit_T_137 | _bit_T_139 | _bit_T_141 | _bit_T_143 | _bit_T_145 | _bit_T_147 | _bit_T_149 |
    _bit_T_151 | _bit_T_153 | _bit_T_155 | _bit_T_157 | _bit_T_159 | _bit_T_161; // @[Decode.scala 15:30]
  wire  _bit_T_597 = _bit_T_567 | _bit_T_163 | _bit_T_165 | _bit_T_167 | _bit_T_169 | _bit_T_171 | _bit_T_173 |
    _bit_T_179 | _bit_T_181 | _bit_T_183 | _bit_T_185 | _bit_T_187 | _bit_T_189 | _bit_T_191 | _bit_T_193 | _bit_T_195
     | _bit_T_197 | _bit_T_215 | _bit_T_217 | _bit_T_219 | _bit_T_221 | _bit_T_223 | _bit_T_225 | _bit_T_227 |
    _bit_T_229 | _bit_T_231 | _bit_T_233 | _bit_T_235 | _bit_T_237 | _bit_T_239 | _bit_T_241; // @[Decode.scala 15:30]
  wire  bit_2 = _bit_T_597 | _bit_T_243 | _bit_T_245 | _bit_T_247 | _bit_T_249 | _bit_T_251 | _bit_T_253 | _bit_T_255 |
    _bit_T_257 | _bit_T_259 | _bit_T_261 | _bit_T_263 | _bit_T_265 | _bit_T_267 | _bit_T_269 | _bit_T_271 | _bit_T_273
     | _bit_T_275 | _bit_T_277 | _bit_T_279 | _bit_T_281 | _bit_T_283 | _bit_T_285 | _bit_T_287 | _bit_T_289 |
    _bit_T_291; // @[Decode.scala 15:30]
  wire  lo_1 = ~bit_2; // @[Decode.scala 40:35]
  wire  hi_lo_1 = _bit_T_567 | _bit_T_163 | _bit_T_165 | _bit_T_167 | _bit_T_169 | _bit_T_287 | _bit_T_289 | _bit_T_291; // @[Decode.scala 15:30]
  wire  _bit_T_689 = _bit_T_167 | _bit_T_169 | _bit_T_171 | _bit_T_173 | _bit_T_179 | _bit_T_181 | _bit_T_183 |
    _bit_T_185 | _bit_T_187 | _bit_T_189 | _bit_T_191 | _bit_T_193 | _bit_T_195 | _bit_T_197 | _bit_T_215 | _bit_T_217
     | _bit_T_219 | _bit_T_221 | _bit_T_223 | _bit_T_225 | _bit_T_227 | _bit_T_229 | _bit_T_231 | _bit_T_233 |
    _bit_T_235 | _bit_T_237 | _bit_T_239 | _bit_T_241 | _bit_T_243 | _bit_T_245 | _bit_T_247; // @[Decode.scala 15:30]
  wire  hi_hi_1 = _bit_T_689 | _bit_T_249 | _bit_T_251 | _bit_T_253 | _bit_T_255 | _bit_T_257 | _bit_T_259 | _bit_T_261
     | _bit_T_263 | _bit_T_265 | _bit_T_267 | _bit_T_269 | _bit_T_271 | _bit_T_273 | _bit_T_275 | _bit_T_277 |
    _bit_T_279 | _bit_T_281 | _bit_T_283 | _bit_T_285; // @[Decode.scala 15:30]
  wire [1:0] hi_1 = {hi_hi_1,hi_lo_1}; // @[Cat.scala 30:58]
  wire [2:0] cs__iq_type = {hi_hi_1,hi_lo_1,lo_1}; // @[Cat.scala 30:58]
  wire [31:0] _T_391 = io_enq_uop_inst & 32'h2000054; // @[Decode.scala 14:65]
  wire  _T_392 = _T_391 == 32'h10; // @[Decode.scala 14:121]
  wire  _T_394 = _T_252 == 32'h10; // @[Decode.scala 14:121]
  wire  _T_396 = _T_90 == 32'h34; // @[Decode.scala 14:121]
  wire  _T_399 = _T_392 | _T_394 | _T_396; // @[Decode.scala 15:30]
  wire  lo_lo_lo = _T_392 | _T_394 | _T_396 | cs__is_br; // @[Decode.scala 15:30]
  wire  lo_lo_hi = _T_91 | _T_348 | _T_178; // @[Decode.scala 15:30]
  wire [31:0] _T_402 = io_enq_uop_inst & 32'h50; // @[Decode.scala 14:65]
  wire  _T_403 = _T_402 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_404 = io_enq_uop_inst & 32'h52003034; // @[Decode.scala 14:65]
  wire  _T_405 = _T_404 == 32'h12000030; // @[Decode.scala 14:121]
  wire  lo_hi_lo_1 = _T_403 | _T_405; // @[Decode.scala 15:30]
  wire [31:0] _T_407 = io_enq_uop_inst & 32'h2004074; // @[Decode.scala 14:65]
  wire  lo_hi_hi_lo = _T_407 == 32'h2000030; // @[Decode.scala 14:121]
  wire [31:0] _T_409 = io_enq_uop_inst & 32'h2004064; // @[Decode.scala 14:65]
  wire  lo_hi_hi_hi = _T_409 == 32'h2004020; // @[Decode.scala 14:121]
  wire  _T_412 = _T_94 == 32'h70; // @[Decode.scala 14:121]
  wire [31:0] _T_413 = io_enq_uop_inst & 32'h1070; // @[Decode.scala 14:65]
  wire  lo_9 = _T_413 == 32'h1070; // @[Decode.scala 14:121]
  wire [31:0] _T_415 = io_enq_uop_inst & 32'h2070; // @[Decode.scala 14:65]
  wire  hi_lo_5 = _T_415 == 32'h2070; // @[Decode.scala 14:121]
  wire [31:0] _T_417 = io_enq_uop_inst & 32'h12000034; // @[Decode.scala 14:65]
  wire  _T_418 = _T_417 == 32'h10000030; // @[Decode.scala 14:121]
  wire [31:0] _T_419 = io_enq_uop_inst & 32'he0000050; // @[Decode.scala 14:65]
  wire  _T_420 = _T_419 == 32'h60000050; // @[Decode.scala 14:121]
  wire  hi_lo_lo_1 = _T_412 | lo_9 | hi_lo_5 | _T_418 | _T_420; // @[Decode.scala 15:30]
  wire [31:0] _T_425 = io_enq_uop_inst & 32'h90000060; // @[Decode.scala 14:65]
  wire  _T_426 = _T_425 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_427 = io_enq_uop_inst & 32'h88000060; // @[Decode.scala 14:65]
  wire  _T_428 = _T_427 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_429 = io_enq_uop_inst & 32'h70; // @[Decode.scala 14:65]
  wire  cs__frs3_en = _T_429 == 32'h40; // @[Decode.scala 14:121]
  wire  hi_lo_hi_1 = _T_426 | _T_428 | cs__frs3_en; // @[Decode.scala 15:30]
  wire [31:0] _T_433 = io_enq_uop_inst & 32'h90000070; // @[Decode.scala 14:65]
  wire  hi_hi_hi_lo = _T_433 == 32'h90000050; // @[Decode.scala 14:121]
  wire [31:0] _T_435 = io_enq_uop_inst & 32'h7c; // @[Decode.scala 14:65]
  wire  _T_436 = _T_435 == 32'h24; // @[Decode.scala 14:121]
  wire  _T_438 = _T_433 == 32'h80000050; // @[Decode.scala 14:121]
  wire  hi_hi_hi_hi = _T_436 | _T_438; // @[Decode.scala 15:30]
  wire [4:0] lo_2 = {lo_hi_hi_hi,lo_hi_hi_lo,lo_hi_lo_1,lo_lo_hi,lo_lo_lo}; // @[Cat.scala 30:58]
  wire [4:0] hi_2 = {hi_hi_hi_hi,hi_hi_hi_lo,hi_hi_lo_1,hi_lo_hi_1,hi_lo_lo_1}; // @[Cat.scala 30:58]
  wire [9:0] cs__fu_code = {hi_hi_hi_hi,hi_hi_hi_lo,hi_hi_lo_1,hi_lo_hi_1,hi_lo_lo_1,lo_hi_hi_hi,lo_hi_hi_lo,lo_hi_lo_1,
    lo_lo_hi,lo_lo_lo}; // @[Cat.scala 30:58]
  wire  _bit_T_738 = _bit_T_163 | _bit_T_165 | _bit_T_175 | _bit_T_177 | _bit_T_183 | _bit_T_185 | _bit_T_187 |
    _bit_T_189 | _bit_T_191 | _bit_T_193 | _bit_T_195 | _bit_T_197 | _bit_T_199 | _bit_T_201 | _bit_T_203 | _bit_T_205
     | _bit_T_207 | _bit_T_209 | _bit_T_211 | _bit_T_213 | _bit_T_243 | _bit_T_245 | _bit_T_247 | _bit_T_249 |
    _bit_T_251 | _bit_T_253 | _bit_T_255 | _bit_T_257 | _bit_T_259 | _bit_T_261 | _bit_T_263; // @[Decode.scala 15:30]
  wire  lo_3 = _bit_T_738 | _bit_T_265 | _bit_T_267 | _bit_T_269 | _bit_T_271 | _bit_T_273 | _bit_T_275 | _bit_T_277 |
    _bit_T_279 | _bit_T_281 | _bit_T_283 | _bit_T_285; // @[Decode.scala 15:30]
  wire  _bit_T_779 = _bit_T_1 | _bit_T_3 | _bit_T_5 | _bit_T_7 | _bit_T_9 | _bit_T_17 | _bit_T_19 | _bit_T_21 |
    _bit_T_23 | _bit_T_25 | _bit_T_27 | _bit_T_29 | _bit_T_31 | _bit_T_33 | _bit_T_35 | _bit_T_37 | _bit_T_39 |
    _bit_T_41 | _bit_T_43 | _bit_T_45 | _bit_T_47 | _bit_T_49 | _bit_T_51 | _bit_T_53 | _bit_T_55 | _bit_T_57 |
    _bit_T_59 | _bit_T_61 | _bit_T_63 | _bit_T_65 | _bit_T_67; // @[Decode.scala 15:30]
  wire  _bit_T_809 = _bit_T_779 | _bit_T_69 | _bit_T_71 | _bit_T_73 | _bit_T_75 | _bit_T_77 | _bit_T_79 | _bit_T_81 |
    _bit_T_95 | _bit_T_97 | _bit_T_99 | _bit_T_101 | _bit_T_103 | _bit_T_105 | _bit_T_119 | _bit_T_121 | _bit_T_123 |
    _bit_T_125 | _bit_T_127 | _bit_T_129 | _bit_T_131 | _bit_T_133 | _bit_T_135 | _bit_T_137 | _bit_T_139 | _bit_T_141
     | _bit_T_143 | _bit_T_145 | _bit_T_147 | _bit_T_149 | _bit_T_151; // @[Decode.scala 15:30]
  wire  _bit_T_839 = _bit_T_809 | _bit_T_153 | _bit_T_155 | _bit_T_157 | _bit_T_159 | _bit_T_161 | _bit_T_163 |
    _bit_T_165 | _bit_T_171 | _bit_T_173 | _bit_T_175 | _bit_T_177 | _bit_T_179 | _bit_T_181 | _bit_T_183 | _bit_T_185
     | _bit_T_187 | _bit_T_189 | _bit_T_191 | _bit_T_193 | _bit_T_195 | _bit_T_197 | _bit_T_199 | _bit_T_201 |
    _bit_T_203 | _bit_T_205 | _bit_T_207 | _bit_T_209 | _bit_T_211 | _bit_T_213 | _bit_T_215; // @[Decode.scala 15:30]
  wire  _bit_T_869 = _bit_T_839 | _bit_T_217 | _bit_T_219 | _bit_T_221 | _bit_T_223 | _bit_T_225 | _bit_T_227 |
    _bit_T_229 | _bit_T_231 | _bit_T_233 | _bit_T_235 | _bit_T_237 | _bit_T_239 | _bit_T_241 | _bit_T_243 | _bit_T_245
     | _bit_T_247 | _bit_T_249 | _bit_T_251 | _bit_T_253 | _bit_T_255 | _bit_T_257 | _bit_T_259 | _bit_T_261 |
    _bit_T_263 | _bit_T_265 | _bit_T_267 | _bit_T_269 | _bit_T_271 | _bit_T_273 | _bit_T_275; // @[Decode.scala 15:30]
  wire  bit_3 = _bit_T_869 | _bit_T_277 | _bit_T_279 | _bit_T_281 | _bit_T_283 | _bit_T_285 | _bit_T_287 | _bit_T_289 |
    _bit_T_293 | _bit_T_295 | _bit_T_297 | _bit_T_299 | _bit_T_301 | _bit_T_303 | _bit_T_305 | _bit_T_307 | _bit_T_309
     | _bit_T_311 | _bit_T_313 | _bit_T_315; // @[Decode.scala 15:30]
  wire  hi_3 = ~bit_3; // @[Decode.scala 40:35]
  wire [1:0] cs__dst_type = {hi_3,lo_3}; // @[Cat.scala 30:58]
  wire [31:0] _T_442 = io_enq_uop_inst & 32'h80000060; // @[Decode.scala 14:65]
  wire  _T_443 = _T_442 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_444 = io_enq_uop_inst & 32'h10000060; // @[Decode.scala 14:65]
  wire  _T_445 = _T_444 == 32'h40; // @[Decode.scala 14:121]
  wire  lo_4 = _T_443 | _T_445 | cs__frs3_en | _T_354; // @[Decode.scala 15:30]
  wire [31:0] _T_449 = io_enq_uop_inst & 32'h2058; // @[Decode.scala 14:65]
  wire  _T_450 = _T_449 == 32'h8; // @[Decode.scala 14:121]
  wire [31:0] _T_451 = io_enq_uop_inst & 32'h10003070; // @[Decode.scala 14:65]
  wire  _T_452 = _T_451 == 32'h70; // @[Decode.scala 14:121]
  wire [31:0] _T_453 = io_enq_uop_inst & 32'h12003030; // @[Decode.scala 14:65]
  wire  _T_454 = _T_453 == 32'h10000030; // @[Decode.scala 14:121]
  wire [31:0] _T_455 = io_enq_uop_inst & 32'he0003050; // @[Decode.scala 14:65]
  wire  _T_456 = _T_455 == 32'h60000050; // @[Decode.scala 14:121]
  wire  hi_4 = _T_450 | _T_166 | _T_178 | _T_452 | _T_354 | _T_454 | _T_456; // @[Decode.scala 15:30]
  wire [1:0] cs__rs1_type = {hi_4,lo_4}; // @[Cat.scala 30:58]
  wire [31:0] _T_464 = io_enq_uop_inst & 32'h40000060; // @[Decode.scala 14:65]
  wire  _T_465 = _T_464 == 32'h40; // @[Decode.scala 14:121]
  wire  lo_5 = _T_436 | _T_465 | cs__frs3_en; // @[Decode.scala 15:30]
  wire  _T_469 = _T_375 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_470 = io_enq_uop_inst & 32'h18000048; // @[Decode.scala 14:65]
  wire  _T_471 = _T_470 == 32'h10000008; // @[Decode.scala 14:121]
  wire [31:0] _T_472 = io_enq_uop_inst & 32'h12000030; // @[Decode.scala 14:65]
  wire  _T_473 = _T_472 == 32'h10000030; // @[Decode.scala 14:121]
  wire [31:0] _T_474 = io_enq_uop_inst & 32'h40000030; // @[Decode.scala 14:65]
  wire  _T_475 = _T_474 == 32'h40000010; // @[Decode.scala 14:121]
  wire [31:0] _T_476 = io_enq_uop_inst & 32'h60000010; // @[Decode.scala 14:65]
  wire  _T_477 = _T_476 == 32'h60000010; // @[Decode.scala 14:121]
  wire  hi_5 = _T_469 | _T_166 | _T_168 | _T_178 | _T_412 | lo_9 | hi_lo_5 | _T_471 | _T_473 | _T_475 | _T_477; // @[Decode.scala 15:30]
  wire [1:0] cs__rs2_type = {hi_5,lo_5}; // @[Cat.scala 30:58]
  wire  _T_491 = _T_429 == 32'h20; // @[Decode.scala 14:121]
  wire  lo_6 = _T_166 | _T_491; // @[Decode.scala 15:30]
  wire [31:0] _T_493 = io_enq_uop_inst & 32'h54; // @[Decode.scala 14:65]
  wire  _T_494 = _T_493 == 32'h40; // @[Decode.scala 14:121]
  wire  hi_lo_3 = _T_166 | _T_494; // @[Decode.scala 15:30]
  wire [31:0] _T_496 = io_enq_uop_inst & 32'h18; // @[Decode.scala 14:65]
  wire  hi_hi_3 = _T_496 == 32'h8; // @[Decode.scala 14:121]
  wire [2:0] cs__imm_sel = {hi_hi_3,hi_lo_3,lo_6}; // @[Cat.scala 30:58]
  wire  _T_500 = _T_96 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_501 = io_enq_uop_inst & 32'h18002048; // @[Decode.scala 14:65]
  wire  _T_502 = _T_501 == 32'h10002008; // @[Decode.scala 14:121]
  wire  cs__uses_ldq = _T_500 | _T_502; // @[Decode.scala 15:30]
  wire [31:0] _T_505 = io_enq_uop_inst & 32'h3058; // @[Decode.scala 14:65]
  wire  cs__is_fence = _T_505 == 32'h8; // @[Decode.scala 14:121]
  wire  cs__uses_stq = cs__is_fence | _T_95 | _T_97 | _T_125; // @[Decode.scala 15:30]
  wire  cs__is_amo = _T_380 | _T_384; // @[Decode.scala 15:30]
  wire  _T_515 = _T_177 == 32'h20; // @[Decode.scala 14:121]
  wire [31:0] _T_516 = io_enq_uop_inst & 32'h18000020; // @[Decode.scala 14:65]
  wire  _T_517 = _T_516 == 32'h18000020; // @[Decode.scala 14:121]
  wire [31:0] _T_518 = io_enq_uop_inst & 32'h20000020; // @[Decode.scala 14:65]
  wire  _T_519 = _T_518 == 32'h20000020; // @[Decode.scala 14:121]
  wire  lo_lo_2 = _T_515 | _T_517 | _T_519; // @[Decode.scala 15:30]
  wire [31:0] _T_522 = io_enq_uop_inst & 32'h10000008; // @[Decode.scala 14:65]
  wire  _T_523 = _T_522 == 32'h10000008; // @[Decode.scala 14:121]
  wire [31:0] _T_524 = io_enq_uop_inst & 32'h40000008; // @[Decode.scala 14:65]
  wire  _T_525 = _T_524 == 32'h40000008; // @[Decode.scala 14:121]
  wire  lo_hi_2 = _T_523 | _T_525; // @[Decode.scala 15:30]
  wire [31:0] _T_527 = io_enq_uop_inst & 32'h40; // @[Decode.scala 14:65]
  wire  hi_hi_hi_2 = _T_527 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_529 = io_enq_uop_inst & 32'h8000008; // @[Decode.scala 14:65]
  wire  _T_530 = _T_529 == 32'h8000008; // @[Decode.scala 14:121]
  wire [31:0] _T_531 = io_enq_uop_inst & 32'h80000008; // @[Decode.scala 14:65]
  wire  _T_532 = _T_531 == 32'h80000008; // @[Decode.scala 14:121]
  wire  hi_lo_4 = hi_hi_hi_2 | _T_530 | _T_523 | _T_532; // @[Decode.scala 15:30]
  wire [31:0] _T_536 = io_enq_uop_inst & 32'h18000008; // @[Decode.scala 14:65]
  wire  hi_hi_lo_2 = _T_536 == 32'h8; // @[Decode.scala 14:121]
  wire [1:0] lo_7 = {lo_hi_2,lo_lo_2}; // @[Cat.scala 30:58]
  wire [2:0] hi_7 = {hi_hi_hi_2,hi_hi_lo_2,hi_lo_4}; // @[Cat.scala 30:58]
  wire [4:0] cs__mem_cmd = {hi_hi_hi_2,hi_hi_lo_2,hi_lo_4,lo_hi_2,lo_lo_2}; // @[Cat.scala 30:58]
  wire  bit_5 = _bit_T_108 | _bit_T_109; // @[Decode.scala 15:30]
  wire  _bit_T_919 = _bit_T_95 | _bit_T_97 | _bit_T_99 | _bit_T_101 | _bit_T_103 | _bit_T_105 | _bit_T_107 | _bit_T_108
     | _bit_T_109 | _bit_T_110 | _bit_T_111 | _bit_T_112 | _bit_T_113 | bit_4 | _bit_T_117 | _bit_T_119 | _bit_T_121 |
    _bit_T_123 | _bit_T_125 | _bit_T_127 | _bit_T_129 | _bit_T_131 | _bit_T_133 | _bit_T_135 | _bit_T_137 | _bit_T_139
     | _bit_T_141 | _bit_T_143 | _bit_T_145 | _bit_T_147 | _bit_T_149; // @[Decode.scala 15:30]
  wire  bit_6 = _bit_T_919 | _bit_T_151 | _bit_T_153 | _bit_T_155 | _bit_T_157 | _bit_T_159 | _bit_T_161; // @[Decode.scala 15:30]
  wire [31:0] _T_554 = io_enq_uop_inst & 32'h58; // @[Decode.scala 14:65]
  wire  _T_555 = _T_554 == 32'h8; // @[Decode.scala 14:121]
  wire  _T_557 = _T_429 == 32'h70; // @[Decode.scala 14:121]
  wire  cs__flush_on_commit = _T_555 | _T_557; // @[Decode.scala 15:30]
  wire [2:0] cs__csr_cmd = {hi_lo_lo_1,hi_lo_5,lo_9}; // @[Cat.scala 30:58]
  wire [31:0] _bit_T_925 = io_enq_uop_inst & 32'hff0001c0; // @[Decode.scala 14:65]
  wire  _bit_T_926 = _bit_T_925 == 32'h99000000; // @[Decode.scala 14:121]
  wire  _bit_T_928 = _bit_T_925 == 32'h91000000; // @[Decode.scala 14:121]
  wire  _bit_T_930 = _bit_T_925 == 32'h99000040; // @[Decode.scala 14:121]
  wire  _bit_T_932 = _bit_T_925 == 32'h91000040; // @[Decode.scala 14:121]
  wire  _bit_T_934 = _bit_T_925 == 32'h9b000000; // @[Decode.scala 14:121]
  wire  _bit_T_936 = _bit_T_925 == 32'h93000000; // @[Decode.scala 14:121]
  wire  _bit_T_938 = _bit_T_925 == 32'h9b000040; // @[Decode.scala 14:121]
  wire  _bit_T_940 = _bit_T_925 == 32'h93000040; // @[Decode.scala 14:121]
  wire  _bit_T_942 = _bit_T_925 == 32'h8b000000; // @[Decode.scala 14:121]
  wire  _bit_T_944 = _bit_T_925 == 32'h83000000; // @[Decode.scala 14:121]
  wire  _bit_T_946 = _bit_T_925 == 32'h8b000040; // @[Decode.scala 14:121]
  wire  _bit_T_948 = _bit_T_925 == 32'h83000040; // @[Decode.scala 14:121]
  wire  _bit_T_950 = _bit_T_925 == 32'h89000000; // @[Decode.scala 14:121]
  wire  _bit_T_952 = _bit_T_925 == 32'h81000000; // @[Decode.scala 14:121]
  wire  _bit_T_954 = _bit_T_925 == 32'h89000040; // @[Decode.scala 14:121]
  wire  _bit_T_956 = _bit_T_925 == 32'h81000040; // @[Decode.scala 14:121]
  wire  _bit_T_958 = _bit_T_925 == 32'h98000000; // @[Decode.scala 14:121]
  wire  _bit_T_960 = _bit_T_925 == 32'h90000000; // @[Decode.scala 14:121]
  wire  _bit_T_962 = _bit_T_925 == 32'h98000040; // @[Decode.scala 14:121]
  wire  _bit_T_964 = _bit_T_925 == 32'h90000040; // @[Decode.scala 14:121]
  wire  _bit_T_966 = _bit_T_925 == 32'h9a000000; // @[Decode.scala 14:121]
  wire  _bit_T_968 = _bit_T_925 == 32'h92000000; // @[Decode.scala 14:121]
  wire  _bit_T_970 = _bit_T_925 == 32'h9a000040; // @[Decode.scala 14:121]
  wire  _bit_T_972 = _bit_T_925 == 32'h92000040; // @[Decode.scala 14:121]
  wire  _bit_T_974 = _bit_T_925 == 32'h8a000000; // @[Decode.scala 14:121]
  wire  _bit_T_976 = _bit_T_925 == 32'h82000000; // @[Decode.scala 14:121]
  wire  _bit_T_978 = _bit_T_925 == 32'h8a000040; // @[Decode.scala 14:121]
  wire  _bit_T_980 = _bit_T_925 == 32'h82000040; // @[Decode.scala 14:121]
  wire  _bit_T_982 = _bit_T_925 == 32'h88000000; // @[Decode.scala 14:121]
  wire  _bit_T_984 = _bit_T_925 == 32'h80000000; // @[Decode.scala 14:121]
  wire  _bit_T_986 = _bit_T_925 == 32'h88000040; // @[Decode.scala 14:121]
  wire  _bit_T_988 = _bit_T_925 == 32'h80000040; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_989 = io_enq_uop_inst & 32'hff07fc00; // @[Decode.scala 14:65]
  wire  _bit_T_990 = _bit_T_989 == 32'hdd000800; // @[Decode.scala 14:121]
  wire  _bit_T_992 = _bit_T_989 == 32'hd5000800; // @[Decode.scala 14:121]
  wire  _bit_T_994 = _bit_T_989 == 32'hcd000800; // @[Decode.scala 14:121]
  wire  _bit_T_996 = _bit_T_989 == 32'hc5000800; // @[Decode.scala 14:121]
  wire  _bit_T_998 = _bit_T_989 == 32'hdf000800; // @[Decode.scala 14:121]
  wire  _bit_T_1000 = _bit_T_989 == 32'hd7000800; // @[Decode.scala 14:121]
  wire  _bit_T_1002 = _bit_T_989 == 32'hcf000800; // @[Decode.scala 14:121]
  wire  _bit_T_1004 = _bit_T_989 == 32'hc7000800; // @[Decode.scala 14:121]
  wire  _bit_T_1006 = _bit_T_989 == 32'hdc000800; // @[Decode.scala 14:121]
  wire  _bit_T_1008 = _bit_T_989 == 32'hd4000800; // @[Decode.scala 14:121]
  wire  _bit_T_1010 = _bit_T_989 == 32'hcc000800; // @[Decode.scala 14:121]
  wire  _bit_T_1012 = _bit_T_989 == 32'hc4000800; // @[Decode.scala 14:121]
  wire  _bit_T_1014 = _bit_T_989 == 32'hde000800; // @[Decode.scala 14:121]
  wire  _bit_T_1016 = _bit_T_989 == 32'hd6000800; // @[Decode.scala 14:121]
  wire  _bit_T_1018 = _bit_T_989 == 32'hce000800; // @[Decode.scala 14:121]
  wire  _bit_T_1020 = _bit_T_989 == 32'hc6000800; // @[Decode.scala 14:121]
  wire  _bit_T_1051 = _bit_T_926 | _bit_T_928 | _bit_T_930 | _bit_T_932 | _bit_T_934 | _bit_T_936 | _bit_T_938 |
    _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 | _bit_T_948 | _bit_T_950 | _bit_T_952 | _bit_T_954 | _bit_T_956
     | _bit_T_958 | _bit_T_960 | _bit_T_962 | _bit_T_964 | _bit_T_966 | _bit_T_968 | _bit_T_970 | _bit_T_972 |
    _bit_T_974 | _bit_T_976 | _bit_T_978 | _bit_T_980 | _bit_T_982 | _bit_T_984 | _bit_T_986; // @[Decode.scala 15:30]
  wire  bit_7 = _bit_T_1051 | _bit_T_988 | _bit_T_990 | _bit_T_992 | _bit_T_994 | _bit_T_996 | _bit_T_998 | _bit_T_1000
     | _bit_T_1002 | _bit_T_1004 | _bit_T_1006 | _bit_T_1008 | _bit_T_1010 | _bit_T_1012 | _bit_T_1014 | _bit_T_1016 |
    _bit_T_1018 | _bit_T_1020; // @[Decode.scala 15:30]
  wire [31:0] _bit_T_1068 = io_enq_uop_inst & 32'hff003fe0; // @[Decode.scala 14:65]
  wire  _bit_T_1069 = _bit_T_1068 == 32'h44000120; // @[Decode.scala 14:121]
  wire  _bit_T_1071 = _bit_T_1068 == 32'h40000120; // @[Decode.scala 14:121]
  wire  bit_8 = _bit_T_1069 | _bit_T_1071; // @[Decode.scala 15:30]
  wire [31:0] _bit_T_1075 = io_enq_uop_inst & 32'hff000000; // @[Decode.scala 14:65]
  wire  _bit_T_1076 = _bit_T_1075 == 32'hbc000000; // @[Decode.scala 14:121]
  wire  _bit_T_1078 = _bit_T_1075 == 32'hbd000000; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_1079 = io_enq_uop_inst & 32'he9000000; // @[Decode.scala 14:65]
  wire  _bit_T_1080 = _bit_T_1079 == 32'ha0000000; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_1081 = io_enq_uop_inst & 32'hfd000000; // @[Decode.scala 14:65]
  wire  _bit_T_1082 = _bit_T_1081 == 32'hb8000000; // @[Decode.scala 14:121]
  wire  _bit_T_1084 = _bit_T_1079 == 32'ha1000000; // @[Decode.scala 14:121]
  wire  _bit_T_1086 = _bit_T_1081 == 32'hb9000000; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_1087 = io_enq_uop_inst & 32'hffffffe0; // @[Decode.scala 14:65]
  wire  _bit_T_1088 = _bit_T_1087 == 32'h10ffc120; // @[Decode.scala 14:121]
  wire  _bit_T_1090 = _bit_T_1087 == 32'h11ffc120; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_1091 = io_enq_uop_inst & 32'hff0001e0; // @[Decode.scala 14:65]
  wire  _bit_T_1092 = _bit_T_1091 == 32'h8000000; // @[Decode.scala 14:121]
  wire  _bit_T_1094 = _bit_T_1091 == 32'h9000000; // @[Decode.scala 14:121]
  wire  _bit_T_1096 = _bit_T_1091 == 32'h8000020; // @[Decode.scala 14:121]
  wire  _bit_T_1098 = _bit_T_1091 == 32'h9000020; // @[Decode.scala 14:121]
  wire  _bit_T_1100 = _bit_T_1091 == 32'h8000040; // @[Decode.scala 14:121]
  wire  _bit_T_1102 = _bit_T_1091 == 32'h9000040; // @[Decode.scala 14:121]
  wire  _bit_T_1104 = _bit_T_1091 == 32'h8000060; // @[Decode.scala 14:121]
  wire  _bit_T_1106 = _bit_T_1091 == 32'h9000060; // @[Decode.scala 14:121]
  wire  _bit_T_1108 = _bit_T_1091 == 32'h8000080; // @[Decode.scala 14:121]
  wire  _bit_T_1110 = _bit_T_1091 == 32'h9000080; // @[Decode.scala 14:121]
  wire  _bit_T_1112 = _bit_T_1091 == 32'h80000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1114 = _bit_T_1091 == 32'h90000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1116 = _bit_T_1091 == 32'h80000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1118 = _bit_T_1091 == 32'h90000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1120 = _bit_T_1091 == 32'h80000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1122 = _bit_T_1091 == 32'h90000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1124 = _bit_T_1075 == 32'h28000000; // @[Decode.scala 14:121]
  wire  _bit_T_1126 = _bit_T_1075 == 32'h29000000; // @[Decode.scala 14:121]
  wire  _bit_T_1128 = _bit_T_1091 == 32'ha000000; // @[Decode.scala 14:121]
  wire  _bit_T_1130 = _bit_T_1091 == 32'hb000000; // @[Decode.scala 14:121]
  wire  _bit_T_1132 = _bit_T_1091 == 32'ha000020; // @[Decode.scala 14:121]
  wire  _bit_T_1134 = _bit_T_1091 == 32'hb000020; // @[Decode.scala 14:121]
  wire  _bit_T_1136 = _bit_T_1091 == 32'ha000040; // @[Decode.scala 14:121]
  wire  _bit_T_1138 = _bit_T_1091 == 32'hb000040; // @[Decode.scala 14:121]
  wire  _bit_T_1140 = _bit_T_1091 == 32'ha000060; // @[Decode.scala 14:121]
  wire  _bit_T_1142 = _bit_T_1091 == 32'hb000060; // @[Decode.scala 14:121]
  wire  _bit_T_1144 = _bit_T_1091 == 32'ha000080; // @[Decode.scala 14:121]
  wire  _bit_T_1146 = _bit_T_1091 == 32'hb000080; // @[Decode.scala 14:121]
  wire  _bit_T_1148 = _bit_T_1091 == 32'ha0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1150 = _bit_T_1091 == 32'hb0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1152 = _bit_T_1091 == 32'ha0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1154 = _bit_T_1091 == 32'hb0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1156 = _bit_T_1091 == 32'ha0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1158 = _bit_T_1091 == 32'hb0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1160 = _bit_T_1075 == 32'h2a000000; // @[Decode.scala 14:121]
  wire  _bit_T_1162 = _bit_T_1075 == 32'h2b000000; // @[Decode.scala 14:121]
  wire  _bit_T_1164 = _bit_T_1091 == 32'h6000000; // @[Decode.scala 14:121]
  wire  _bit_T_1166 = _bit_T_1091 == 32'h7000000; // @[Decode.scala 14:121]
  wire  _bit_T_1168 = _bit_T_1091 == 32'h6000020; // @[Decode.scala 14:121]
  wire  _bit_T_1170 = _bit_T_1091 == 32'h7000020; // @[Decode.scala 14:121]
  wire  _bit_T_1172 = _bit_T_1091 == 32'h6000040; // @[Decode.scala 14:121]
  wire  _bit_T_1174 = _bit_T_1091 == 32'h7000040; // @[Decode.scala 14:121]
  wire  _bit_T_1176 = _bit_T_1091 == 32'h6000060; // @[Decode.scala 14:121]
  wire  _bit_T_1178 = _bit_T_1091 == 32'h7000060; // @[Decode.scala 14:121]
  wire  _bit_T_1180 = _bit_T_1091 == 32'h6000080; // @[Decode.scala 14:121]
  wire  _bit_T_1182 = _bit_T_1091 == 32'h7000080; // @[Decode.scala 14:121]
  wire  _bit_T_1184 = _bit_T_1091 == 32'h60000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1186 = _bit_T_1091 == 32'h70000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1188 = _bit_T_1091 == 32'h60000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1190 = _bit_T_1091 == 32'h70000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1192 = _bit_T_1091 == 32'h60000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1194 = _bit_T_1091 == 32'h70000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1196 = _bit_T_1075 == 32'h26000000; // @[Decode.scala 14:121]
  wire  _bit_T_1198 = _bit_T_1075 == 32'h27000000; // @[Decode.scala 14:121]
  wire  _bit_T_1200 = _bit_T_1091 == 32'he000000; // @[Decode.scala 14:121]
  wire  _bit_T_1202 = _bit_T_1091 == 32'hf000000; // @[Decode.scala 14:121]
  wire  _bit_T_1204 = _bit_T_1091 == 32'he000020; // @[Decode.scala 14:121]
  wire  _bit_T_1206 = _bit_T_1091 == 32'hf000020; // @[Decode.scala 14:121]
  wire  _bit_T_1208 = _bit_T_1091 == 32'he000040; // @[Decode.scala 14:121]
  wire  _bit_T_1210 = _bit_T_1091 == 32'hf000040; // @[Decode.scala 14:121]
  wire  _bit_T_1212 = _bit_T_1091 == 32'he000060; // @[Decode.scala 14:121]
  wire  _bit_T_1214 = _bit_T_1091 == 32'hf000060; // @[Decode.scala 14:121]
  wire  _bit_T_1216 = _bit_T_1091 == 32'he000080; // @[Decode.scala 14:121]
  wire  _bit_T_1218 = _bit_T_1091 == 32'hf000080; // @[Decode.scala 14:121]
  wire  _bit_T_1220 = _bit_T_1091 == 32'he0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1222 = _bit_T_1091 == 32'hf0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1224 = _bit_T_1091 == 32'he0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1226 = _bit_T_1091 == 32'hf0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1228 = _bit_T_1091 == 32'he0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1230 = _bit_T_1091 == 32'hf0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1232 = _bit_T_1075 == 32'h2e000000; // @[Decode.scala 14:121]
  wire  _bit_T_1234 = _bit_T_1075 == 32'h2f000000; // @[Decode.scala 14:121]
  wire  _bit_T_1236 = _bit_T_1091 == 32'h4000000; // @[Decode.scala 14:121]
  wire  _bit_T_1238 = _bit_T_1091 == 32'h5000000; // @[Decode.scala 14:121]
  wire  _bit_T_1240 = _bit_T_1091 == 32'h4000020; // @[Decode.scala 14:121]
  wire  _bit_T_1242 = _bit_T_1091 == 32'h5000020; // @[Decode.scala 14:121]
  wire  _bit_T_1244 = _bit_T_1091 == 32'h4000040; // @[Decode.scala 14:121]
  wire  _bit_T_1246 = _bit_T_1091 == 32'h5000040; // @[Decode.scala 14:121]
  wire  _bit_T_1248 = _bit_T_1091 == 32'h4000060; // @[Decode.scala 14:121]
  wire  _bit_T_1250 = _bit_T_1091 == 32'h5000060; // @[Decode.scala 14:121]
  wire  _bit_T_1252 = _bit_T_1091 == 32'h4000080; // @[Decode.scala 14:121]
  wire  _bit_T_1254 = _bit_T_1091 == 32'h5000080; // @[Decode.scala 14:121]
  wire  _bit_T_1256 = _bit_T_1091 == 32'h40000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1258 = _bit_T_1091 == 32'h50000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1260 = _bit_T_1091 == 32'h40000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1262 = _bit_T_1091 == 32'h50000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1264 = _bit_T_1091 == 32'h40000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1266 = _bit_T_1091 == 32'h50000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1268 = _bit_T_1075 == 32'h24000000; // @[Decode.scala 14:121]
  wire  _bit_T_1270 = _bit_T_1075 == 32'h25000000; // @[Decode.scala 14:121]
  wire  _bit_T_1272 = _bit_T_1091 == 32'hc000000; // @[Decode.scala 14:121]
  wire  _bit_T_1274 = _bit_T_1091 == 32'hd000000; // @[Decode.scala 14:121]
  wire  _bit_T_1276 = _bit_T_1091 == 32'hc000020; // @[Decode.scala 14:121]
  wire  _bit_T_1278 = _bit_T_1091 == 32'hd000020; // @[Decode.scala 14:121]
  wire  _bit_T_1280 = _bit_T_1091 == 32'hc000040; // @[Decode.scala 14:121]
  wire  _bit_T_1282 = _bit_T_1091 == 32'hd000040; // @[Decode.scala 14:121]
  wire  _bit_T_1284 = _bit_T_1091 == 32'hc000060; // @[Decode.scala 14:121]
  wire  _bit_T_1286 = _bit_T_1091 == 32'hd000060; // @[Decode.scala 14:121]
  wire  _bit_T_1288 = _bit_T_1091 == 32'hc000080; // @[Decode.scala 14:121]
  wire  _bit_T_1290 = _bit_T_1091 == 32'hd000080; // @[Decode.scala 14:121]
  wire  _bit_T_1292 = _bit_T_1091 == 32'hc0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1294 = _bit_T_1091 == 32'hd0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1296 = _bit_T_1091 == 32'hc0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1298 = _bit_T_1091 == 32'hd0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1300 = _bit_T_1091 == 32'hc0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1302 = _bit_T_1091 == 32'hd0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1304 = _bit_T_1075 == 32'h2c000000; // @[Decode.scala 14:121]
  wire  _bit_T_1306 = _bit_T_1075 == 32'h2d000000; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_1307 = io_enq_uop_inst & 32'hfff83fe0; // @[Decode.scala 14:65]
  wire  _bit_T_1308 = _bit_T_1307 == 32'h12f80120; // @[Decode.scala 14:121]
  wire  _bit_T_1310 = _bit_T_1307 == 32'h16f80120; // @[Decode.scala 14:121]
  wire  _bit_T_1312 = _bit_T_1068 == 32'h120; // @[Decode.scala 14:121]
  wire  _bit_T_1314 = _bit_T_1068 == 32'h1000120; // @[Decode.scala 14:121]
  wire  _bit_T_1316 = _bit_T_1091 == 32'h2000120; // @[Decode.scala 14:121]
  wire  _bit_T_1318 = _bit_T_1091 == 32'h3000120; // @[Decode.scala 14:121]
  wire  _bit_T_1320 = _bit_T_1091 == 32'hc000120; // @[Decode.scala 14:121]
  wire  _bit_T_1322 = _bit_T_1091 == 32'hd000120; // @[Decode.scala 14:121]
  wire  _bit_T_1324 = _bit_T_1091 == 32'he000120; // @[Decode.scala 14:121]
  wire  _bit_T_1326 = _bit_T_1091 == 32'hf000120; // @[Decode.scala 14:121]
  wire  _bit_T_1328 = _bit_T_1091 == 32'h8000120; // @[Decode.scala 14:121]
  wire  _bit_T_1330 = _bit_T_1091 == 32'h9000120; // @[Decode.scala 14:121]
  wire  _bit_T_1332 = _bit_T_1091 == 32'ha000120; // @[Decode.scala 14:121]
  wire  _bit_T_1334 = _bit_T_1091 == 32'hb000120; // @[Decode.scala 14:121]
  wire  _bit_T_1336 = _bit_T_1091 == 32'h0; // @[Decode.scala 14:121]
  wire  _bit_T_1338 = _bit_T_1091 == 32'h1000000; // @[Decode.scala 14:121]
  wire  _bit_T_1340 = _bit_T_1091 == 32'h40; // @[Decode.scala 14:121]
  wire  _bit_T_1342 = _bit_T_1091 == 32'h1000040; // @[Decode.scala 14:121]
  wire  _bit_T_1344 = _bit_T_1091 == 32'h80; // @[Decode.scala 14:121]
  wire  _bit_T_1346 = _bit_T_1091 == 32'h1000080; // @[Decode.scala 14:121]
  wire  _bit_T_1348 = _bit_T_1091 == 32'hc0; // @[Decode.scala 14:121]
  wire  _bit_T_1350 = _bit_T_1091 == 32'h10000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1352 = _bit_T_1091 == 32'h20; // @[Decode.scala 14:121]
  wire  _bit_T_1354 = _bit_T_1091 == 32'h1000020; // @[Decode.scala 14:121]
  wire  _bit_T_1356 = _bit_T_1091 == 32'h60; // @[Decode.scala 14:121]
  wire  _bit_T_1358 = _bit_T_1091 == 32'h1000060; // @[Decode.scala 14:121]
  wire  _bit_T_1360 = _bit_T_1091 == 32'ha0; // @[Decode.scala 14:121]
  wire  _bit_T_1362 = _bit_T_1091 == 32'h10000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1364 = _bit_T_1091 == 32'he0; // @[Decode.scala 14:121]
  wire  _bit_T_1366 = _bit_T_1091 == 32'h10000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1368 = _bit_T_1075 == 32'h20000000; // @[Decode.scala 14:121]
  wire  _bit_T_1370 = _bit_T_1075 == 32'h21000000; // @[Decode.scala 14:121]
  wire  _bit_T_1372 = _bit_T_1091 == 32'h18000000; // @[Decode.scala 14:121]
  wire  _bit_T_1374 = _bit_T_1091 == 32'h19000000; // @[Decode.scala 14:121]
  wire  _bit_T_1376 = _bit_T_1091 == 32'h18000040; // @[Decode.scala 14:121]
  wire  _bit_T_1378 = _bit_T_1091 == 32'h19000040; // @[Decode.scala 14:121]
  wire  _bit_T_1380 = _bit_T_1091 == 32'h18000080; // @[Decode.scala 14:121]
  wire  _bit_T_1382 = _bit_T_1091 == 32'h19000080; // @[Decode.scala 14:121]
  wire  _bit_T_1384 = _bit_T_1091 == 32'h180000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1386 = _bit_T_1091 == 32'h190000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1388 = _bit_T_1091 == 32'h18000020; // @[Decode.scala 14:121]
  wire  _bit_T_1390 = _bit_T_1091 == 32'h19000020; // @[Decode.scala 14:121]
  wire  _bit_T_1392 = _bit_T_1091 == 32'h18000060; // @[Decode.scala 14:121]
  wire  _bit_T_1394 = _bit_T_1091 == 32'h19000060; // @[Decode.scala 14:121]
  wire  _bit_T_1396 = _bit_T_1091 == 32'h180000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1398 = _bit_T_1091 == 32'h190000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1400 = _bit_T_1091 == 32'h180000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1402 = _bit_T_1091 == 32'h190000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1404 = _bit_T_1075 == 32'h38000000; // @[Decode.scala 14:121]
  wire  _bit_T_1406 = _bit_T_1075 == 32'h39000000; // @[Decode.scala 14:121]
  wire  _bit_T_1408 = _bit_T_1091 == 32'h2000000; // @[Decode.scala 14:121]
  wire  _bit_T_1410 = _bit_T_1091 == 32'h3000000; // @[Decode.scala 14:121]
  wire  _bit_T_1412 = _bit_T_1091 == 32'h2000040; // @[Decode.scala 14:121]
  wire  _bit_T_1414 = _bit_T_1091 == 32'h3000040; // @[Decode.scala 14:121]
  wire  _bit_T_1416 = _bit_T_1091 == 32'h2000080; // @[Decode.scala 14:121]
  wire  _bit_T_1418 = _bit_T_1091 == 32'h3000080; // @[Decode.scala 14:121]
  wire  _bit_T_1420 = _bit_T_1091 == 32'h20000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1422 = _bit_T_1091 == 32'h30000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1424 = _bit_T_1091 == 32'h2000020; // @[Decode.scala 14:121]
  wire  _bit_T_1426 = _bit_T_1091 == 32'h3000020; // @[Decode.scala 14:121]
  wire  _bit_T_1428 = _bit_T_1091 == 32'h2000060; // @[Decode.scala 14:121]
  wire  _bit_T_1430 = _bit_T_1091 == 32'h3000060; // @[Decode.scala 14:121]
  wire  _bit_T_1432 = _bit_T_1091 == 32'h20000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1434 = _bit_T_1091 == 32'h30000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1436 = _bit_T_1091 == 32'h20000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1438 = _bit_T_1091 == 32'h30000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1440 = _bit_T_1075 == 32'h22000000; // @[Decode.scala 14:121]
  wire  _bit_T_1442 = _bit_T_1075 == 32'h23000000; // @[Decode.scala 14:121]
  wire  _bit_T_1444 = _bit_T_1091 == 32'h1c000000; // @[Decode.scala 14:121]
  wire  _bit_T_1446 = _bit_T_1091 == 32'h1d000000; // @[Decode.scala 14:121]
  wire  _bit_T_1448 = _bit_T_1091 == 32'h1c000040; // @[Decode.scala 14:121]
  wire  _bit_T_1450 = _bit_T_1091 == 32'h1d000040; // @[Decode.scala 14:121]
  wire  _bit_T_1452 = _bit_T_1091 == 32'h1c000080; // @[Decode.scala 14:121]
  wire  _bit_T_1454 = _bit_T_1091 == 32'h1d000080; // @[Decode.scala 14:121]
  wire  _bit_T_1456 = _bit_T_1091 == 32'h1c0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1458 = _bit_T_1091 == 32'h1d0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1460 = _bit_T_1091 == 32'h1c000020; // @[Decode.scala 14:121]
  wire  _bit_T_1462 = _bit_T_1091 == 32'h1d000020; // @[Decode.scala 14:121]
  wire  _bit_T_1464 = _bit_T_1091 == 32'h1c000060; // @[Decode.scala 14:121]
  wire  _bit_T_1466 = _bit_T_1091 == 32'h1d000060; // @[Decode.scala 14:121]
  wire  _bit_T_1468 = _bit_T_1091 == 32'h1c0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1470 = _bit_T_1091 == 32'h1d0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1472 = _bit_T_1091 == 32'h1c0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1474 = _bit_T_1091 == 32'h1d0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1476 = _bit_T_1075 == 32'h3c000000; // @[Decode.scala 14:121]
  wire  _bit_T_1478 = _bit_T_1075 == 32'h3d000000; // @[Decode.scala 14:121]
  wire  _bit_T_1480 = _bit_T_1091 == 32'h1a000000; // @[Decode.scala 14:121]
  wire  _bit_T_1482 = _bit_T_1091 == 32'h1a000040; // @[Decode.scala 14:121]
  wire  _bit_T_1484 = _bit_T_1091 == 32'h1a000080; // @[Decode.scala 14:121]
  wire  _bit_T_1486 = _bit_T_1091 == 32'h1a0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1488 = _bit_T_1091 == 32'h1a000020; // @[Decode.scala 14:121]
  wire  _bit_T_1490 = _bit_T_1091 == 32'h1a000060; // @[Decode.scala 14:121]
  wire  _bit_T_1492 = _bit_T_1091 == 32'h1a0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1494 = _bit_T_1091 == 32'h1a0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1496 = _bit_T_1075 == 32'h3a000000; // @[Decode.scala 14:121]
  wire  _bit_T_1498 = _bit_T_1091 == 32'h1b000000; // @[Decode.scala 14:121]
  wire  _bit_T_1500 = _bit_T_1091 == 32'h1b000040; // @[Decode.scala 14:121]
  wire  _bit_T_1502 = _bit_T_1091 == 32'h1b000080; // @[Decode.scala 14:121]
  wire  _bit_T_1504 = _bit_T_1091 == 32'h1b0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1506 = _bit_T_1091 == 32'h1b000020; // @[Decode.scala 14:121]
  wire  _bit_T_1508 = _bit_T_1091 == 32'h1b000060; // @[Decode.scala 14:121]
  wire  _bit_T_1510 = _bit_T_1091 == 32'h1b0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1512 = _bit_T_1091 == 32'h1b0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1514 = _bit_T_1075 == 32'h3b000000; // @[Decode.scala 14:121]
  wire  _bit_T_1516 = _bit_T_1091 == 32'h1e000000; // @[Decode.scala 14:121]
  wire  _bit_T_1518 = _bit_T_1091 == 32'h1e000040; // @[Decode.scala 14:121]
  wire  _bit_T_1520 = _bit_T_1091 == 32'h1e000080; // @[Decode.scala 14:121]
  wire  _bit_T_1522 = _bit_T_1091 == 32'h1e0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1524 = _bit_T_1091 == 32'h1e000020; // @[Decode.scala 14:121]
  wire  _bit_T_1526 = _bit_T_1091 == 32'h1e000060; // @[Decode.scala 14:121]
  wire  _bit_T_1528 = _bit_T_1091 == 32'h1e0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1530 = _bit_T_1091 == 32'h1e0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1532 = _bit_T_1075 == 32'h3e000000; // @[Decode.scala 14:121]
  wire  _bit_T_1534 = _bit_T_1091 == 32'h1f000000; // @[Decode.scala 14:121]
  wire  _bit_T_1536 = _bit_T_1091 == 32'h1f000040; // @[Decode.scala 14:121]
  wire  _bit_T_1538 = _bit_T_1091 == 32'h1f000080; // @[Decode.scala 14:121]
  wire  _bit_T_1540 = _bit_T_1091 == 32'h1f0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1542 = _bit_T_1091 == 32'h1f000020; // @[Decode.scala 14:121]
  wire  _bit_T_1544 = _bit_T_1091 == 32'h1f000060; // @[Decode.scala 14:121]
  wire  _bit_T_1546 = _bit_T_1091 == 32'h1f0000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1548 = _bit_T_1091 == 32'h1f0000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1550 = _bit_T_1075 == 32'h3f000000; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_1551 = io_enq_uop_inst & 32'hff07c1e0; // @[Decode.scala 14:65]
  wire  _bit_T_1552 = _bit_T_1551 == 32'h17000000; // @[Decode.scala 14:121]
  wire  _bit_T_1554 = _bit_T_1551 == 32'h17000040; // @[Decode.scala 14:121]
  wire  _bit_T_1556 = _bit_T_1551 == 32'h17000080; // @[Decode.scala 14:121]
  wire  _bit_T_1558 = _bit_T_1551 == 32'h170000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1560 = _bit_T_1551 == 32'h17000020; // @[Decode.scala 14:121]
  wire  _bit_T_1562 = _bit_T_1551 == 32'h17000060; // @[Decode.scala 14:121]
  wire  _bit_T_1564 = _bit_T_1551 == 32'h170000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1566 = _bit_T_1551 == 32'h170000e0; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_1567 = io_enq_uop_inst & 32'hff07c000; // @[Decode.scala 14:65]
  wire  _bit_T_1568 = _bit_T_1567 == 32'h37000000; // @[Decode.scala 14:121]
  wire  _bit_T_1570 = _bit_T_1551 == 32'h11000000; // @[Decode.scala 14:121]
  wire  _bit_T_1572 = _bit_T_1551 == 32'h11000040; // @[Decode.scala 14:121]
  wire  _bit_T_1574 = _bit_T_1551 == 32'h11000080; // @[Decode.scala 14:121]
  wire  _bit_T_1576 = _bit_T_1551 == 32'h110000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1578 = _bit_T_1551 == 32'h11000020; // @[Decode.scala 14:121]
  wire  _bit_T_1580 = _bit_T_1551 == 32'h11000060; // @[Decode.scala 14:121]
  wire  _bit_T_1582 = _bit_T_1551 == 32'h110000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1584 = _bit_T_1551 == 32'h110000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1586 = _bit_T_1567 == 32'h31000000; // @[Decode.scala 14:121]
  wire  _bit_T_1588 = _bit_T_1551 == 32'h15000000; // @[Decode.scala 14:121]
  wire  _bit_T_1590 = _bit_T_1551 == 32'h15000040; // @[Decode.scala 14:121]
  wire  _bit_T_1592 = _bit_T_1551 == 32'h15000080; // @[Decode.scala 14:121]
  wire  _bit_T_1594 = _bit_T_1551 == 32'h150000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1596 = _bit_T_1551 == 32'h15000020; // @[Decode.scala 14:121]
  wire  _bit_T_1598 = _bit_T_1551 == 32'h15000060; // @[Decode.scala 14:121]
  wire  _bit_T_1600 = _bit_T_1551 == 32'h150000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1602 = _bit_T_1551 == 32'h150000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1604 = _bit_T_1567 == 32'h35000000; // @[Decode.scala 14:121]
  wire  _bit_T_1606 = _bit_T_1551 == 32'h13000000; // @[Decode.scala 14:121]
  wire  _bit_T_1608 = _bit_T_1551 == 32'h13000040; // @[Decode.scala 14:121]
  wire  _bit_T_1610 = _bit_T_1551 == 32'h13000080; // @[Decode.scala 14:121]
  wire  _bit_T_1612 = _bit_T_1551 == 32'h130000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1614 = _bit_T_1551 == 32'h13000020; // @[Decode.scala 14:121]
  wire  _bit_T_1616 = _bit_T_1551 == 32'h13000060; // @[Decode.scala 14:121]
  wire  _bit_T_1618 = _bit_T_1551 == 32'h130000a0; // @[Decode.scala 14:121]
  wire  _bit_T_1620 = _bit_T_1551 == 32'h130000e0; // @[Decode.scala 14:121]
  wire  _bit_T_1622 = _bit_T_1567 == 32'h33000000; // @[Decode.scala 14:121]
  wire  _bit_T_1624 = _bit_T_1091 == 32'h59000000; // @[Decode.scala 14:121]
  wire  _bit_T_1626 = _bit_T_1091 == 32'h59000040; // @[Decode.scala 14:121]
  wire  _bit_T_1628 = _bit_T_1091 == 32'h59000080; // @[Decode.scala 14:121]
  wire  _bit_T_1630 = _bit_T_1091 == 32'h590000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1632 = _bit_T_1091 == 32'h51000000; // @[Decode.scala 14:121]
  wire  _bit_T_1634 = _bit_T_1091 == 32'h51000040; // @[Decode.scala 14:121]
  wire  _bit_T_1636 = _bit_T_1091 == 32'h51000080; // @[Decode.scala 14:121]
  wire  _bit_T_1638 = _bit_T_1091 == 32'h510000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1640 = _bit_T_1091 == 32'h58000000; // @[Decode.scala 14:121]
  wire  _bit_T_1642 = _bit_T_1091 == 32'h58000040; // @[Decode.scala 14:121]
  wire  _bit_T_1644 = _bit_T_1091 == 32'h58000080; // @[Decode.scala 14:121]
  wire  _bit_T_1646 = _bit_T_1091 == 32'h580000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1648 = _bit_T_1091 == 32'h50000000; // @[Decode.scala 14:121]
  wire  _bit_T_1650 = _bit_T_1091 == 32'h50000040; // @[Decode.scala 14:121]
  wire  _bit_T_1652 = _bit_T_1091 == 32'h50000080; // @[Decode.scala 14:121]
  wire  _bit_T_1654 = _bit_T_1091 == 32'h500000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1656 = _bit_T_1091 == 32'h5d000000; // @[Decode.scala 14:121]
  wire  _bit_T_1658 = _bit_T_1091 == 32'h5d000040; // @[Decode.scala 14:121]
  wire  _bit_T_1660 = _bit_T_1091 == 32'h5d000080; // @[Decode.scala 14:121]
  wire  _bit_T_1662 = _bit_T_1091 == 32'h5d0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1664 = _bit_T_1091 == 32'h55000000; // @[Decode.scala 14:121]
  wire  _bit_T_1666 = _bit_T_1091 == 32'h55000040; // @[Decode.scala 14:121]
  wire  _bit_T_1668 = _bit_T_1091 == 32'h55000080; // @[Decode.scala 14:121]
  wire  _bit_T_1670 = _bit_T_1091 == 32'h550000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1672 = _bit_T_1091 == 32'h5c000000; // @[Decode.scala 14:121]
  wire  _bit_T_1674 = _bit_T_1091 == 32'h5c000040; // @[Decode.scala 14:121]
  wire  _bit_T_1676 = _bit_T_1091 == 32'h5c000080; // @[Decode.scala 14:121]
  wire  _bit_T_1678 = _bit_T_1091 == 32'h5c0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1680 = _bit_T_1091 == 32'h54000000; // @[Decode.scala 14:121]
  wire  _bit_T_1682 = _bit_T_1091 == 32'h54000040; // @[Decode.scala 14:121]
  wire  _bit_T_1684 = _bit_T_1091 == 32'h54000080; // @[Decode.scala 14:121]
  wire  _bit_T_1686 = _bit_T_1091 == 32'h540000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1688 = _bit_T_1075 == 32'h79000000; // @[Decode.scala 14:121]
  wire  _bit_T_1690 = _bit_T_1075 == 32'h78000000; // @[Decode.scala 14:121]
  wire  _bit_T_1692 = _bit_T_1075 == 32'h71000000; // @[Decode.scala 14:121]
  wire  _bit_T_1694 = _bit_T_1075 == 32'h70000000; // @[Decode.scala 14:121]
  wire  _bit_T_1696 = _bit_T_1075 == 32'h7d000000; // @[Decode.scala 14:121]
  wire  _bit_T_1698 = _bit_T_1075 == 32'h7c000000; // @[Decode.scala 14:121]
  wire  _bit_T_1700 = _bit_T_1075 == 32'h75000000; // @[Decode.scala 14:121]
  wire  _bit_T_1702 = _bit_T_1075 == 32'h74000000; // @[Decode.scala 14:121]
  wire  _bit_T_1704 = _bit_T_1091 == 32'h5d000160; // @[Decode.scala 14:121]
  wire  _bit_T_1706 = _bit_T_1091 == 32'h5c000160; // @[Decode.scala 14:121]
  wire  _bit_T_1708 = _bit_T_1091 == 32'h55000160; // @[Decode.scala 14:121]
  wire  _bit_T_1710 = _bit_T_1091 == 32'h54000160; // @[Decode.scala 14:121]
  wire  _bit_T_1712 = _bit_T_1068 == 32'h59000160; // @[Decode.scala 14:121]
  wire  _bit_T_1714 = _bit_T_1068 == 32'h58000160; // @[Decode.scala 14:121]
  wire  _bit_T_1716 = _bit_T_1068 == 32'h51000160; // @[Decode.scala 14:121]
  wire  _bit_T_1718 = _bit_T_1068 == 32'h50000160; // @[Decode.scala 14:121]
  wire  _bit_T_1720 = _bit_T_1091 == 32'h5d0001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1722 = _bit_T_1091 == 32'h550001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1724 = _bit_T_1091 == 32'h5d0001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1726 = _bit_T_1091 == 32'h550001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1728 = _bit_T_1068 == 32'h590001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1730 = _bit_T_1068 == 32'h510001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1732 = _bit_T_1068 == 32'h590001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1734 = _bit_T_1068 == 32'h510001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1736 = _bit_T_1091 == 32'h5c0001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1738 = _bit_T_1091 == 32'h540001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1740 = _bit_T_1091 == 32'h5c0001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1742 = _bit_T_1091 == 32'h540001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1744 = _bit_T_1068 == 32'h580001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1746 = _bit_T_1068 == 32'h500001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1748 = _bit_T_1068 == 32'h580001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1750 = _bit_T_1068 == 32'h500001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1752 = _bit_T_1091 == 32'h5b000000; // @[Decode.scala 14:121]
  wire  _bit_T_1754 = _bit_T_1091 == 32'h5b000040; // @[Decode.scala 14:121]
  wire  _bit_T_1756 = _bit_T_1091 == 32'h5b000080; // @[Decode.scala 14:121]
  wire  _bit_T_1758 = _bit_T_1091 == 32'h5b0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1760 = _bit_T_1091 == 32'h53000000; // @[Decode.scala 14:121]
  wire  _bit_T_1762 = _bit_T_1091 == 32'h53000040; // @[Decode.scala 14:121]
  wire  _bit_T_1764 = _bit_T_1091 == 32'h53000080; // @[Decode.scala 14:121]
  wire  _bit_T_1766 = _bit_T_1091 == 32'h530000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1768 = _bit_T_1091 == 32'h5a000000; // @[Decode.scala 14:121]
  wire  _bit_T_1770 = _bit_T_1091 == 32'h5a000040; // @[Decode.scala 14:121]
  wire  _bit_T_1772 = _bit_T_1091 == 32'h5a000080; // @[Decode.scala 14:121]
  wire  _bit_T_1774 = _bit_T_1091 == 32'h5a0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1776 = _bit_T_1091 == 32'h52000000; // @[Decode.scala 14:121]
  wire  _bit_T_1778 = _bit_T_1091 == 32'h52000040; // @[Decode.scala 14:121]
  wire  _bit_T_1780 = _bit_T_1091 == 32'h52000080; // @[Decode.scala 14:121]
  wire  _bit_T_1782 = _bit_T_1091 == 32'h520000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1784 = _bit_T_1091 == 32'h5f000000; // @[Decode.scala 14:121]
  wire  _bit_T_1786 = _bit_T_1091 == 32'h5f000040; // @[Decode.scala 14:121]
  wire  _bit_T_1788 = _bit_T_1091 == 32'h5f000080; // @[Decode.scala 14:121]
  wire  _bit_T_1790 = _bit_T_1091 == 32'h5f0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1792 = _bit_T_1091 == 32'h57000000; // @[Decode.scala 14:121]
  wire  _bit_T_1794 = _bit_T_1091 == 32'h57000040; // @[Decode.scala 14:121]
  wire  _bit_T_1796 = _bit_T_1091 == 32'h57000080; // @[Decode.scala 14:121]
  wire  _bit_T_1798 = _bit_T_1091 == 32'h570000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1800 = _bit_T_1091 == 32'h5e000000; // @[Decode.scala 14:121]
  wire  _bit_T_1802 = _bit_T_1091 == 32'h5e000040; // @[Decode.scala 14:121]
  wire  _bit_T_1804 = _bit_T_1091 == 32'h5e000080; // @[Decode.scala 14:121]
  wire  _bit_T_1806 = _bit_T_1091 == 32'h5e0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1808 = _bit_T_1091 == 32'h56000000; // @[Decode.scala 14:121]
  wire  _bit_T_1810 = _bit_T_1091 == 32'h56000040; // @[Decode.scala 14:121]
  wire  _bit_T_1812 = _bit_T_1091 == 32'h56000080; // @[Decode.scala 14:121]
  wire  _bit_T_1814 = _bit_T_1091 == 32'h560000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1816 = _bit_T_1075 == 32'h7b000000; // @[Decode.scala 14:121]
  wire  _bit_T_1818 = _bit_T_1075 == 32'h7a000000; // @[Decode.scala 14:121]
  wire  _bit_T_1820 = _bit_T_1075 == 32'h73000000; // @[Decode.scala 14:121]
  wire  _bit_T_1822 = _bit_T_1075 == 32'h72000000; // @[Decode.scala 14:121]
  wire  _bit_T_1824 = _bit_T_1075 == 32'h7f000000; // @[Decode.scala 14:121]
  wire  _bit_T_1826 = _bit_T_1075 == 32'h7e000000; // @[Decode.scala 14:121]
  wire  _bit_T_1828 = _bit_T_1075 == 32'h77000000; // @[Decode.scala 14:121]
  wire  _bit_T_1830 = _bit_T_1075 == 32'h76000000; // @[Decode.scala 14:121]
  wire  _bit_T_1832 = _bit_T_1091 == 32'h5f000160; // @[Decode.scala 14:121]
  wire  _bit_T_1834 = _bit_T_1091 == 32'h57000160; // @[Decode.scala 14:121]
  wire  _bit_T_1836 = _bit_T_1068 == 32'h5b000160; // @[Decode.scala 14:121]
  wire  _bit_T_1838 = _bit_T_1068 == 32'h53000160; // @[Decode.scala 14:121]
  wire  _bit_T_1840 = _bit_T_1091 == 32'h5e000160; // @[Decode.scala 14:121]
  wire  _bit_T_1842 = _bit_T_1091 == 32'h56000160; // @[Decode.scala 14:121]
  wire  _bit_T_1844 = _bit_T_1068 == 32'h5a000160; // @[Decode.scala 14:121]
  wire  _bit_T_1846 = _bit_T_1068 == 32'h52000160; // @[Decode.scala 14:121]
  wire  _bit_T_1848 = _bit_T_1091 == 32'h49000000; // @[Decode.scala 14:121]
  wire  _bit_T_1850 = _bit_T_1091 == 32'h49000040; // @[Decode.scala 14:121]
  wire  _bit_T_1852 = _bit_T_1091 == 32'h49000080; // @[Decode.scala 14:121]
  wire  _bit_T_1854 = _bit_T_1091 == 32'h490000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1856 = _bit_T_1091 == 32'h41000000; // @[Decode.scala 14:121]
  wire  _bit_T_1858 = _bit_T_1091 == 32'h41000040; // @[Decode.scala 14:121]
  wire  _bit_T_1860 = _bit_T_1091 == 32'h41000080; // @[Decode.scala 14:121]
  wire  _bit_T_1862 = _bit_T_1091 == 32'h410000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1864 = _bit_T_1091 == 32'h48000000; // @[Decode.scala 14:121]
  wire  _bit_T_1866 = _bit_T_1091 == 32'h48000040; // @[Decode.scala 14:121]
  wire  _bit_T_1868 = _bit_T_1091 == 32'h48000080; // @[Decode.scala 14:121]
  wire  _bit_T_1870 = _bit_T_1091 == 32'h480000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1872 = _bit_T_1091 == 32'h40000000; // @[Decode.scala 14:121]
  wire  _bit_T_1874 = _bit_T_1091 == 32'h40000040; // @[Decode.scala 14:121]
  wire  _bit_T_1876 = _bit_T_1091 == 32'h40000080; // @[Decode.scala 14:121]
  wire  _bit_T_1878 = _bit_T_1091 == 32'h400000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1880 = _bit_T_1091 == 32'h4d000000; // @[Decode.scala 14:121]
  wire  _bit_T_1882 = _bit_T_1091 == 32'h4d000040; // @[Decode.scala 14:121]
  wire  _bit_T_1884 = _bit_T_1091 == 32'h4d000080; // @[Decode.scala 14:121]
  wire  _bit_T_1886 = _bit_T_1091 == 32'h4d0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1888 = _bit_T_1091 == 32'h45000000; // @[Decode.scala 14:121]
  wire  _bit_T_1890 = _bit_T_1091 == 32'h45000040; // @[Decode.scala 14:121]
  wire  _bit_T_1892 = _bit_T_1091 == 32'h45000080; // @[Decode.scala 14:121]
  wire  _bit_T_1894 = _bit_T_1091 == 32'h450000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1896 = _bit_T_1091 == 32'h4c000000; // @[Decode.scala 14:121]
  wire  _bit_T_1898 = _bit_T_1091 == 32'h4c000040; // @[Decode.scala 14:121]
  wire  _bit_T_1900 = _bit_T_1091 == 32'h4c000080; // @[Decode.scala 14:121]
  wire  _bit_T_1902 = _bit_T_1091 == 32'h4c0000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1904 = _bit_T_1091 == 32'h44000000; // @[Decode.scala 14:121]
  wire  _bit_T_1906 = _bit_T_1091 == 32'h44000040; // @[Decode.scala 14:121]
  wire  _bit_T_1908 = _bit_T_1091 == 32'h44000080; // @[Decode.scala 14:121]
  wire  _bit_T_1910 = _bit_T_1091 == 32'h440000c0; // @[Decode.scala 14:121]
  wire  _bit_T_1912 = _bit_T_1075 == 32'h69000000; // @[Decode.scala 14:121]
  wire  _bit_T_1914 = _bit_T_1075 == 32'h68000000; // @[Decode.scala 14:121]
  wire  _bit_T_1916 = _bit_T_1075 == 32'h61000000; // @[Decode.scala 14:121]
  wire  _bit_T_1918 = _bit_T_1075 == 32'h60000000; // @[Decode.scala 14:121]
  wire  _bit_T_1920 = _bit_T_1075 == 32'h6d000000; // @[Decode.scala 14:121]
  wire  _bit_T_1922 = _bit_T_1075 == 32'h6c000000; // @[Decode.scala 14:121]
  wire  _bit_T_1924 = _bit_T_1075 == 32'h65000000; // @[Decode.scala 14:121]
  wire  _bit_T_1926 = _bit_T_1075 == 32'h64000000; // @[Decode.scala 14:121]
  wire  _bit_T_1928 = _bit_T_1091 == 32'h4d000160; // @[Decode.scala 14:121]
  wire  _bit_T_1930 = _bit_T_1091 == 32'h45000160; // @[Decode.scala 14:121]
  wire  _bit_T_1932 = _bit_T_1068 == 32'h49000160; // @[Decode.scala 14:121]
  wire  _bit_T_1934 = _bit_T_1068 == 32'h41000160; // @[Decode.scala 14:121]
  wire  _bit_T_1936 = _bit_T_1091 == 32'h4c000160; // @[Decode.scala 14:121]
  wire  _bit_T_1938 = _bit_T_1091 == 32'h44000160; // @[Decode.scala 14:121]
  wire  _bit_T_1940 = _bit_T_1068 == 32'h48000160; // @[Decode.scala 14:121]
  wire  _bit_T_1942 = _bit_T_1068 == 32'h40000160; // @[Decode.scala 14:121]
  wire  _bit_T_1944 = _bit_T_1091 == 32'h5f0001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1946 = _bit_T_1091 == 32'h570001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1948 = _bit_T_1091 == 32'h5f0001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1950 = _bit_T_1091 == 32'h570001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1952 = _bit_T_1068 == 32'h5b0001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1954 = _bit_T_1068 == 32'h530001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1956 = _bit_T_1068 == 32'h5b0001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1958 = _bit_T_1068 == 32'h530001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1960 = _bit_T_1091 == 32'h5e0001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1962 = _bit_T_1091 == 32'h560001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1964 = _bit_T_1091 == 32'h5e0001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1966 = _bit_T_1091 == 32'h560001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1968 = _bit_T_1068 == 32'h5a0001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1970 = _bit_T_1068 == 32'h520001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1972 = _bit_T_1068 == 32'h5a0001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1974 = _bit_T_1068 == 32'h520001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1976 = _bit_T_1091 == 32'h4d0001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1978 = _bit_T_1091 == 32'h450001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1980 = _bit_T_1091 == 32'h4d0001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1982 = _bit_T_1091 == 32'h450001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1984 = _bit_T_1068 == 32'h490001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1986 = _bit_T_1068 == 32'h410001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1988 = _bit_T_1068 == 32'h490001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1990 = _bit_T_1068 == 32'h410001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1992 = _bit_T_1091 == 32'h4c0001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1994 = _bit_T_1091 == 32'h440001a0; // @[Decode.scala 14:121]
  wire  _bit_T_1996 = _bit_T_1091 == 32'h4c0001e0; // @[Decode.scala 14:121]
  wire  _bit_T_1998 = _bit_T_1091 == 32'h440001e0; // @[Decode.scala 14:121]
  wire  _bit_T_2000 = _bit_T_1068 == 32'h480001a0; // @[Decode.scala 14:121]
  wire  _bit_T_2002 = _bit_T_1068 == 32'h400001a0; // @[Decode.scala 14:121]
  wire  _bit_T_2004 = _bit_T_1068 == 32'h480001e0; // @[Decode.scala 14:121]
  wire  _bit_T_2006 = _bit_T_1068 == 32'h400001e0; // @[Decode.scala 14:121]
  wire  _bit_T_2008 = _bit_T_1068 == 32'he0000820; // @[Decode.scala 14:121]
  wire  _bit_T_2010 = _bit_T_1068 == 32'he1000820; // @[Decode.scala 14:121]
  wire  _bit_T_2012 = _bit_T_1068 == 32'he0000920; // @[Decode.scala 14:121]
  wire  _bit_T_2014 = _bit_T_1068 == 32'he1000920; // @[Decode.scala 14:121]
  wire  _bit_T_2016 = _bit_T_1068 == 32'he00008a0; // @[Decode.scala 14:121]
  wire  _bit_T_2018 = _bit_T_1068 == 32'he10008a0; // @[Decode.scala 14:121]
  wire  _bit_T_2020 = _bit_T_1068 == 32'he0000860; // @[Decode.scala 14:121]
  wire  _bit_T_2022 = _bit_T_1068 == 32'he1000860; // @[Decode.scala 14:121]
  wire  _bit_T_2024 = _bit_T_1307 == 32'he0000960; // @[Decode.scala 14:121]
  wire  _bit_T_2026 = _bit_T_1307 == 32'he1000960; // @[Decode.scala 14:121]
  wire  _bit_T_2028 = _bit_T_1307 == 32'he00009e0; // @[Decode.scala 14:121]
  wire  _bit_T_2030 = _bit_T_1307 == 32'he10009e0; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_2031 = io_enq_uop_inst & 32'hfff83fff; // @[Decode.scala 14:65]
  wire  _bit_T_2032 = _bit_T_2031 == 32'he2f80800; // @[Decode.scala 14:121]
  wire  _bit_T_2034 = _bit_T_2031 == 32'he3f80800; // @[Decode.scala 14:121]
  wire  _bit_T_2036 = _bit_T_1068 == 32'he0000a60; // @[Decode.scala 14:121]
  wire  _bit_T_2038 = _bit_T_1068 == 32'he1000a60; // @[Decode.scala 14:121]
  wire  _bit_T_2040 = _bit_T_1068 == 32'he2000a60; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_2041 = io_enq_uop_inst & 32'hff003c20; // @[Decode.scala 14:65]
  wire  _bit_T_2042 = _bit_T_2041 == 32'hec000820; // @[Decode.scala 14:121]
  wire  _bit_T_2044 = _bit_T_2041 == 32'hed000820; // @[Decode.scala 14:121]
  wire  bit_30 = _bit_T_2041 == 32'he9000800; // @[Decode.scala 14:121]
  wire  _bit_T_2048 = _bit_T_2041 == 32'hed000800; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_2049 = io_enq_uop_inst & 32'hff003c00; // @[Decode.scala 14:65]
  wire  _bit_T_2050 = _bit_T_2049 == 32'hd9000800; // @[Decode.scala 14:121]
  wire  _bit_T_2052 = _bit_T_2049 == 32'hd1000800; // @[Decode.scala 14:121]
  wire  _bit_T_2054 = _bit_T_2049 == 32'hc9000800; // @[Decode.scala 14:121]
  wire  _bit_T_2056 = _bit_T_2049 == 32'hc1000800; // @[Decode.scala 14:121]
  wire  _bit_T_2058 = _bit_T_2049 == 32'hdb000800; // @[Decode.scala 14:121]
  wire  _bit_T_2060 = _bit_T_2049 == 32'hd3000800; // @[Decode.scala 14:121]
  wire  _bit_T_2062 = _bit_T_2049 == 32'hcb000800; // @[Decode.scala 14:121]
  wire  _bit_T_2064 = _bit_T_2049 == 32'hc3000800; // @[Decode.scala 14:121]
  wire  _bit_T_2066 = _bit_T_2049 == 32'hd8000800; // @[Decode.scala 14:121]
  wire  _bit_T_2068 = _bit_T_2049 == 32'hd0000800; // @[Decode.scala 14:121]
  wire  _bit_T_2070 = _bit_T_2049 == 32'hc8000800; // @[Decode.scala 14:121]
  wire  _bit_T_2072 = _bit_T_2049 == 32'hc0000800; // @[Decode.scala 14:121]
  wire  _bit_T_2074 = _bit_T_2049 == 32'hda000800; // @[Decode.scala 14:121]
  wire  _bit_T_2076 = _bit_T_2049 == 32'hd2000800; // @[Decode.scala 14:121]
  wire  _bit_T_2078 = _bit_T_2049 == 32'hca000800; // @[Decode.scala 14:121]
  wire  _bit_T_2080 = _bit_T_2049 == 32'hc2000800; // @[Decode.scala 14:121]
  wire  _bit_T_2082 = _bit_T_1068 == 32'he00009a0; // @[Decode.scala 14:121]
  wire  _bit_T_2084 = _bit_T_1068 == 32'he10009a0; // @[Decode.scala 14:121]
  wire  _bit_T_2086 = _bit_T_1068 == 32'he20009a0; // @[Decode.scala 14:121]
  wire  _bit_T_2088 = _bit_T_1068 == 32'he1000800; // @[Decode.scala 14:121]
  wire  _bit_T_2090 = _bit_T_1068 == 32'he0000800; // @[Decode.scala 14:121]
  wire  _bit_T_2092 = _bit_T_1307 == 32'he8000860; // @[Decode.scala 14:121]
  wire  _bit_T_2094 = _bit_T_1307 == 32'he9000820; // @[Decode.scala 14:121]
  wire  _bit_T_2096 = _bit_T_1307 == 32'he8000920; // @[Decode.scala 14:121]
  wire  _bit_T_2098 = _bit_T_1307 == 32'hea000820; // @[Decode.scala 14:121]
  wire  _bit_T_2100 = _bit_T_1307 == 32'hea000860; // @[Decode.scala 14:121]
  wire  _bit_T_2102 = _bit_T_1307 == 32'he9000920; // @[Decode.scala 14:121]
  wire  _bit_T_2134 = bit_8 | _bit_T_1076 | _bit_T_1078 | _bit_T_1080 | _bit_T_1082 | _bit_T_1084 | _bit_T_1086 |
    _bit_T_1088 | _bit_T_1090 | _bit_T_926 | _bit_T_928 | _bit_T_930 | _bit_T_932 | _bit_T_934 | _bit_T_936 | _bit_T_938
     | _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 | _bit_T_948 | _bit_T_950 | _bit_T_952 | _bit_T_954 |
    _bit_T_956 | _bit_T_958 | _bit_T_960 | _bit_T_962 | _bit_T_964 | _bit_T_966 | _bit_T_968; // @[Decode.scala 15:30]
  wire  _bit_T_2164 = _bit_T_2134 | _bit_T_970 | _bit_T_972 | _bit_T_974 | _bit_T_976 | _bit_T_978 | _bit_T_980 |
    _bit_T_982 | _bit_T_984 | _bit_T_986 | _bit_T_988 | _bit_T_1092 | _bit_T_1094 | _bit_T_1096 | _bit_T_1098 |
    _bit_T_1100 | _bit_T_1102 | _bit_T_1104 | _bit_T_1106 | _bit_T_1108 | _bit_T_1110 | _bit_T_1112 | _bit_T_1114 |
    _bit_T_1116 | _bit_T_1118 | _bit_T_1120 | _bit_T_1122 | _bit_T_1124 | _bit_T_1126 | _bit_T_1128 | _bit_T_1130; // @[Decode.scala 15:30]
  wire  _bit_T_2194 = _bit_T_2164 | _bit_T_1132 | _bit_T_1134 | _bit_T_1136 | _bit_T_1138 | _bit_T_1140 | _bit_T_1142 |
    _bit_T_1144 | _bit_T_1146 | _bit_T_1148 | _bit_T_1150 | _bit_T_1152 | _bit_T_1154 | _bit_T_1156 | _bit_T_1158 |
    _bit_T_1160 | _bit_T_1162 | _bit_T_1164 | _bit_T_1166 | _bit_T_1168 | _bit_T_1170 | _bit_T_1172 | _bit_T_1174 |
    _bit_T_1176 | _bit_T_1178 | _bit_T_1180 | _bit_T_1182 | _bit_T_1184 | _bit_T_1186 | _bit_T_1188 | _bit_T_1190; // @[Decode.scala 15:30]
  wire  _bit_T_2224 = _bit_T_2194 | _bit_T_1192 | _bit_T_1194 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200 | _bit_T_1202 |
    _bit_T_1204 | _bit_T_1206 | _bit_T_1208 | _bit_T_1210 | _bit_T_1212 | _bit_T_1214 | _bit_T_1216 | _bit_T_1218 |
    _bit_T_1220 | _bit_T_1222 | _bit_T_1224 | _bit_T_1226 | _bit_T_1228 | _bit_T_1230 | _bit_T_1232 | _bit_T_1234 |
    _bit_T_1236 | _bit_T_1238 | _bit_T_1240 | _bit_T_1242 | _bit_T_1244 | _bit_T_1246 | _bit_T_1248 | _bit_T_1250; // @[Decode.scala 15:30]
  wire  _bit_T_2254 = _bit_T_2224 | _bit_T_1252 | _bit_T_1254 | _bit_T_1256 | _bit_T_1258 | _bit_T_1260 | _bit_T_1262 |
    _bit_T_1264 | _bit_T_1266 | _bit_T_1268 | _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 |
    _bit_T_1280 | _bit_T_1282 | _bit_T_1284 | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 |
    _bit_T_1296 | _bit_T_1298 | _bit_T_1300 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1308 | _bit_T_1310; // @[Decode.scala 15:30]
  wire  _bit_T_2284 = _bit_T_2254 | _bit_T_1312 | _bit_T_1314 | _bit_T_1316 | _bit_T_1318 | _bit_T_1320 | _bit_T_1322 |
    _bit_T_1324 | _bit_T_1326 | _bit_T_1328 | _bit_T_1330 | _bit_T_1332 | _bit_T_1334 | _bit_T_1336 | _bit_T_1338 |
    _bit_T_1340 | _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 |
    _bit_T_1356 | _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368 | _bit_T_1370; // @[Decode.scala 15:30]
  wire  _bit_T_2314 = _bit_T_2284 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 | _bit_T_1382 |
    _bit_T_1384 | _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 |
    _bit_T_1400 | _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 |
    _bit_T_1416 | _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430; // @[Decode.scala 15:30]
  wire  _bit_T_2344 = _bit_T_2314 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 | _bit_T_1442 |
    _bit_T_1444 | _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 |
    _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 |
    _bit_T_1476 | _bit_T_1478 | _bit_T_1480 | _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1488 | _bit_T_1490; // @[Decode.scala 15:30]
  wire  _bit_T_2374 = _bit_T_2344 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 | _bit_T_1502 |
    _bit_T_1504 | _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516 | _bit_T_1518 |
    _bit_T_1520 | _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534 |
    _bit_T_1536 | _bit_T_1538 | _bit_T_1540 | _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1550; // @[Decode.scala 15:30]
  wire  _bit_T_2404 = _bit_T_2374 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 | _bit_T_1562 |
    _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 | _bit_T_1578 |
    _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 |
    _bit_T_1596 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610; // @[Decode.scala 15:30]
  wire  _bit_T_2434 = _bit_T_2404 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 | _bit_T_1622 |
    _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 |
    _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 |
    _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670; // @[Decode.scala 15:30]
  wire  _bit_T_2464 = _bit_T_2434 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 |
    _bit_T_1684 | _bit_T_1686 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696 | _bit_T_1698 |
    _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 | _bit_T_1710 | _bit_T_1712 | _bit_T_1714 |
    _bit_T_1716 | _bit_T_1718 | _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730; // @[Decode.scala 15:30]
  wire  _bit_T_2494 = _bit_T_2464 | _bit_T_1732 | _bit_T_1734 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 | _bit_T_1742 |
    _bit_T_1744 | _bit_T_1746 | _bit_T_1748 | _bit_T_1750 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 |
    _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 |
    _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790; // @[Decode.scala 15:30]
  wire  _bit_T_2524 = _bit_T_2494 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 | _bit_T_1802 |
    _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1816 | _bit_T_1818 |
    _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834 |
    _bit_T_1836 | _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_1848 | _bit_T_1850; // @[Decode.scala 15:30]
  wire  _bit_T_2554 = _bit_T_2524 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 | _bit_T_1862 |
    _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876 | _bit_T_1878 |
    _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892 | _bit_T_1894 |
    _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908 | _bit_T_1910; // @[Decode.scala 15:30]
  wire  _bit_T_2584 = _bit_T_2554 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 | _bit_T_1922 |
    _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936 | _bit_T_1938 |
    _bit_T_1940 | _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 |
    _bit_T_1956 | _bit_T_1958 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 | _bit_T_1970; // @[Decode.scala 15:30]
  wire  _bit_T_2614 = _bit_T_2584 | _bit_T_1972 | _bit_T_1974 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 |
    _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 |
    _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_990 | _bit_T_992 | _bit_T_994 | _bit_T_996 |
    _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1006 | _bit_T_1008 | _bit_T_1010 | _bit_T_1012; // @[Decode.scala 15:30]
  wire  _bit_T_2644 = _bit_T_2614 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | _bit_T_2008 | _bit_T_2010 |
    _bit_T_2012 | _bit_T_2014 | _bit_T_2016 | _bit_T_2018 | _bit_T_2020 | _bit_T_2022 | _bit_T_2024 | _bit_T_2026 |
    _bit_T_2028 | _bit_T_2030 | _bit_T_2032 | _bit_T_2034 | _bit_T_2036 | _bit_T_2038 | _bit_T_2040 | _bit_T_2042 |
    _bit_T_2044 | bit_30 | _bit_T_2048 | _bit_T_2050 | _bit_T_2052 | _bit_T_2054 | _bit_T_2056 | _bit_T_2058; // @[Decode.scala 15:30]
  wire  bit_11 = _bit_T_2644 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2066 | _bit_T_2068 | _bit_T_2070 |
    _bit_T_2072 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080 | _bit_T_2082 | _bit_T_2084 | _bit_T_2086 |
    _bit_T_2088 | _bit_T_2090 | _bit_T_2092 | _bit_T_2094 | _bit_T_2096 | _bit_T_2098 | _bit_T_2100 | _bit_T_2102; // @[Decode.scala 15:30]
  wire  _bit_T_2696 = _bit_T_990 | _bit_T_992 | _bit_T_994 | _bit_T_996 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 |
    _bit_T_1004 | _bit_T_1006 | _bit_T_1008 | _bit_T_1010 | _bit_T_1012 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 |
    _bit_T_1020 | _bit_T_2008 | _bit_T_2010 | _bit_T_2012 | _bit_T_2014 | _bit_T_2016 | _bit_T_2018 | _bit_T_2020 |
    _bit_T_2022 | _bit_T_2024 | _bit_T_2026 | _bit_T_2028 | _bit_T_2030 | _bit_T_2032 | _bit_T_2034 | _bit_T_2036; // @[Decode.scala 15:30]
  wire  _bit_T_2726 = _bit_T_2696 | _bit_T_2038 | _bit_T_2040 | _bit_T_2042 | _bit_T_2044 | bit_30 | _bit_T_2048 |
    _bit_T_2050 | _bit_T_2052 | _bit_T_2054 | _bit_T_2056 | _bit_T_2058 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 |
    _bit_T_2066 | _bit_T_2068 | _bit_T_2070 | _bit_T_2072 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080 |
    _bit_T_2082 | _bit_T_2084 | _bit_T_2086 | _bit_T_2088 | _bit_T_2090 | _bit_T_2092 | _bit_T_2094 | _bit_T_2096; // @[Decode.scala 15:30]
  wire [31:0] _bit_T_2729 = io_enq_uop_inst & 32'he4003c00; // @[Decode.scala 14:65]
  wire  _bit_T_2730 = _bit_T_2729 == 32'hc0000800; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_2731 = io_enq_uop_inst & 32'he407fc00; // @[Decode.scala 14:65]
  wire  _bit_T_2732 = _bit_T_2731 == 32'hc4000800; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_2733 = io_enq_uop_inst & 32'hfe003fc0; // @[Decode.scala 14:65]
  wire  _bit_T_2734 = _bit_T_2733 == 32'he0000800; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_2735 = io_enq_uop_inst & 32'hfe003fa0; // @[Decode.scala 14:65]
  wire  _bit_T_2736 = _bit_T_2735 == 32'he0000820; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_2737 = io_enq_uop_inst & 32'hfe003f60; // @[Decode.scala 14:65]
  wire  _bit_T_2738 = _bit_T_2737 == 32'he0000820; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_2739 = io_enq_uop_inst & 32'hfe003ee0; // @[Decode.scala 14:65]
  wire  _bit_T_2740 = _bit_T_2739 == 32'he0000820; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_2741 = io_enq_uop_inst & 32'hfff83f60; // @[Decode.scala 14:65]
  wire  _bit_T_2742 = _bit_T_2741 == 32'he0000960; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_2743 = io_enq_uop_inst & 32'hfd003fe0; // @[Decode.scala 14:65]
  wire  _bit_T_2744 = _bit_T_2743 == 32'he00009a0; // @[Decode.scala 14:121]
  wire  _bit_T_2746 = _bit_T_2743 == 32'he0000a60; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_2747 = io_enq_uop_inst & 32'hfef83fff; // @[Decode.scala 14:65]
  wire  _bit_T_2748 = _bit_T_2747 == 32'he2f80800; // @[Decode.scala 14:121]
  wire [31:0] _T_566 = io_enq_uop_inst & 32'hae000100; // @[Decode.scala 14:65]
  wire  _T_567 = _T_566 == 32'ha000100; // @[Decode.scala 14:121]
  wire [31:0] _T_568 = io_enq_uop_inst & 32'h5d000000; // @[Decode.scala 14:65]
  wire  _T_569 = _T_568 == 32'h14000000; // @[Decode.scala 14:121]
  wire [31:0] _T_570 = io_enq_uop_inst & 32'hb8000100; // @[Decode.scala 14:65]
  wire  _T_571 = _T_570 == 32'h18000100; // @[Decode.scala 14:121]
  wire [31:0] _T_572 = io_enq_uop_inst & 32'he00001c0; // @[Decode.scala 14:65]
  wire  _T_573 = _T_572 == 32'h40000100; // @[Decode.scala 14:121]
  wire [31:0] _T_574 = io_enq_uop_inst & 32'hd1000000; // @[Decode.scala 14:65]
  wire  _T_575 = _T_574 == 32'h41000000; // @[Decode.scala 14:121]
  wire [31:0] _T_576 = io_enq_uop_inst & 32'h59000240; // @[Decode.scala 14:65]
  wire  _T_577 = _T_576 == 32'h41000040; // @[Decode.scala 14:121]
  wire [31:0] _T_578 = io_enq_uop_inst & 32'h78000000; // @[Decode.scala 14:65]
  wire  _T_579 = _T_578 == 32'h78000000; // @[Decode.scala 14:121]
  wire [31:0] _T_580 = io_enq_uop_inst & 32'h89000180; // @[Decode.scala 14:65]
  wire  _T_581 = _T_580 == 32'h81000180; // @[Decode.scala 14:121]
  wire [31:0] _T_582 = io_enq_uop_inst & 32'h8d000120; // @[Decode.scala 14:65]
  wire  _T_583 = _T_582 == 32'h89000120; // @[Decode.scala 14:121]
  wire [31:0] _T_584 = io_enq_uop_inst & 32'hd8000000; // @[Decode.scala 14:65]
  wire  _T_585 = _T_584 == 32'h98000000; // @[Decode.scala 14:121]
  wire [31:0] _T_586 = io_enq_uop_inst & 32'he0000000; // @[Decode.scala 14:65]
  wire  _T_587 = _T_586 == 32'ha0000000; // @[Decode.scala 14:121]
  wire [31:0] _T_588 = io_enq_uop_inst & 32'ha9000160; // @[Decode.scala 14:65]
  wire  _T_589 = _T_588 == 32'ha0000020; // @[Decode.scala 14:121]
  wire [31:0] _T_590 = io_enq_uop_inst & 32'ha90000e0; // @[Decode.scala 14:65]
  wire  _T_591 = _T_590 == 32'ha0000020; // @[Decode.scala 14:121]
  wire [31:0] _T_592 = io_enq_uop_inst & 32'ha9000200; // @[Decode.scala 14:65]
  wire  _T_593 = _T_592 == 32'ha0000200; // @[Decode.scala 14:121]
  wire [31:0] _T_594 = io_enq_uop_inst & 32'hab000100; // @[Decode.scala 14:65]
  wire  _T_595 = _T_594 == 32'ha2000000; // @[Decode.scala 14:121]
  wire [31:0] _T_596 = io_enq_uop_inst & 32'ha4000020; // @[Decode.scala 14:65]
  wire  _T_597 = _T_596 == 32'ha4000000; // @[Decode.scala 14:121]
  wire [31:0] _T_598 = io_enq_uop_inst & 32'had000040; // @[Decode.scala 14:65]
  wire  _T_599 = _T_598 == 32'ha8000040; // @[Decode.scala 14:121]
  wire [31:0] _T_600 = io_enq_uop_inst & 32'he1000000; // @[Decode.scala 14:65]
  wire  _T_601 = _T_600 == 32'hc1000000; // @[Decode.scala 14:121]
  wire  lo_lo_3 = _T_567 | _T_569 | _T_571 | _T_573 | _T_575 | _T_577 | _T_579 | _T_581 | _T_583 | _T_585 | _T_587 |
    _T_589 | _T_591 | _T_593 | _T_595 | _T_597 | _T_599 | _T_601; // @[Decode.scala 15:30]
  wire [31:0] _T_619 = io_enq_uop_inst & 32'hc0000100; // @[Decode.scala 14:65]
  wire  _T_620 = _T_619 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_621 = io_enq_uop_inst & 32'hce000000; // @[Decode.scala 14:65]
  wire  _T_622 = _T_621 == 32'h8000000; // @[Decode.scala 14:121]
  wire [31:0] _T_623 = io_enq_uop_inst & 32'hd0000000; // @[Decode.scala 14:65]
  wire  _T_624 = _T_623 == 32'h10000000; // @[Decode.scala 14:121]
  wire [31:0] _T_625 = io_enq_uop_inst & 32'hb0000100; // @[Decode.scala 14:65]
  wire  _T_626 = _T_625 == 32'h10000000; // @[Decode.scala 14:121]
  wire [31:0] _T_627 = io_enq_uop_inst & 32'h98000000; // @[Decode.scala 14:65]
  wire  _T_628 = _T_627 == 32'h18000000; // @[Decode.scala 14:121]
  wire  _T_630 = _T_578 == 32'h18000000; // @[Decode.scala 14:121]
  wire  _T_632 = _T_586 == 32'h20000000; // @[Decode.scala 14:121]
  wire  _T_634 = _T_574 == 32'h40000000; // @[Decode.scala 14:121]
  wire [31:0] _T_635 = io_enq_uop_inst & 32'hba000020; // @[Decode.scala 14:65]
  wire  _T_636 = _T_635 == 32'ha8000020; // @[Decode.scala 14:121]
  wire  _T_638 = _T_600 == 32'hc0000000; // @[Decode.scala 14:121]
  wire [31:0] _T_639 = io_enq_uop_inst & 32'he80001e0; // @[Decode.scala 14:65]
  wire  _T_640 = _T_639 == 32'he0000020; // @[Decode.scala 14:121]
  wire [31:0] _T_641 = io_enq_uop_inst & 32'he9000180; // @[Decode.scala 14:65]
  wire  _T_642 = _T_641 == 32'he1000000; // @[Decode.scala 14:121]
  wire [31:0] _T_643 = io_enq_uop_inst & 32'he90000c0; // @[Decode.scala 14:65]
  wire  _T_644 = _T_643 == 32'he1000000; // @[Decode.scala 14:121]
  wire [31:0] _T_645 = io_enq_uop_inst & 32'h51000200; // @[Decode.scala 14:65]
  wire  _T_646 = _T_645 == 32'h40000200; // @[Decode.scala 14:121]
  wire  lo_hi_lo_2 = _T_620 | _T_622 | _T_624 | _T_626 | _T_628 | _T_630 | _T_632 | _T_634 | _T_636 | _T_638 | _T_640 |
    _T_642 | _T_644 | _T_646; // @[Decode.scala 15:30]
  wire  _T_661 = _T_584 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_662 = io_enq_uop_inst & 32'hc2000000; // @[Decode.scala 14:65]
  wire  _T_663 = _T_662 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_664 = io_enq_uop_inst & 32'h4e000000; // @[Decode.scala 14:65]
  wire  _T_665 = _T_664 == 32'hc000000; // @[Decode.scala 14:121]
  wire [31:0] _T_666 = io_enq_uop_inst & 32'h72000300; // @[Decode.scala 14:65]
  wire  _T_667 = _T_666 == 32'h62000000; // @[Decode.scala 14:121]
  wire [31:0] _T_668 = io_enq_uop_inst & 32'he8000020; // @[Decode.scala 14:65]
  wire  _T_669 = _T_668 == 32'he0000000; // @[Decode.scala 14:121]
  wire [31:0] _T_670 = io_enq_uop_inst & 32'he10000c0; // @[Decode.scala 14:65]
  wire  _T_671 = _T_670 == 32'he0000000; // @[Decode.scala 14:121]
  wire [31:0] _T_672 = io_enq_uop_inst & 32'he40001e0; // @[Decode.scala 14:65]
  wire  _T_673 = _T_672 == 32'he0000120; // @[Decode.scala 14:121]
  wire [31:0] _T_674 = io_enq_uop_inst & 32'he3000200; // @[Decode.scala 14:65]
  wire  _T_675 = _T_674 == 32'he0000200; // @[Decode.scala 14:121]
  wire  _T_677 = _T_641 == 32'he1000080; // @[Decode.scala 14:121]
  wire [31:0] _T_678 = io_enq_uop_inst & 32'he5000000; // @[Decode.scala 14:65]
  wire  _T_679 = _T_678 == 32'he4000000; // @[Decode.scala 14:121]
  wire  lo_hi_hi_2 = _T_661 | _T_663 | _T_620 | _T_665 | _T_626 | _T_628 | _T_630 | _T_632 | _T_667 | _T_669 | _T_671 |
    _T_673 | _T_675 | _T_677 | _T_679; // @[Decode.scala 15:30]
  wire [31:0] _T_694 = io_enq_uop_inst & 32'h8a000000; // @[Decode.scala 14:65]
  wire  _T_695 = _T_694 == 32'ha000000; // @[Decode.scala 14:121]
  wire [31:0] _T_696 = io_enq_uop_inst & 32'h72000000; // @[Decode.scala 14:65]
  wire  _T_697 = _T_696 == 32'h62000000; // @[Decode.scala 14:121]
  wire [31:0] _T_698 = io_enq_uop_inst & 32'hbc000020; // @[Decode.scala 14:65]
  wire  _T_699 = _T_698 == 32'ha8000020; // @[Decode.scala 14:121]
  wire [31:0] _T_700 = io_enq_uop_inst & 32'he8000040; // @[Decode.scala 14:65]
  wire  _T_701 = _T_700 == 32'he0000040; // @[Decode.scala 14:121]
  wire [31:0] _T_702 = io_enq_uop_inst & 32'he8000080; // @[Decode.scala 14:65]
  wire  _T_703 = _T_702 == 32'he0000080; // @[Decode.scala 14:121]
  wire [31:0] _T_704 = io_enq_uop_inst & 32'he9000120; // @[Decode.scala 14:65]
  wire  _T_705 = _T_704 == 32'he1000020; // @[Decode.scala 14:121]
  wire  hi_lo_lo_2 = _T_620 | _T_695 | _T_626 | _T_628 | _T_630 | _T_632 | _T_697 | _T_699 | _T_701 | _T_703 | _T_705; // @[Decode.scala 15:30]
  wire [31:0] _T_716 = io_enq_uop_inst & 32'h70000100; // @[Decode.scala 14:65]
  wire  lo_hi_hi_lo_1 = _T_716 == 32'h100; // @[Decode.scala 14:121]
  wire [31:0] _T_718 = io_enq_uop_inst & 32'h5b000000; // @[Decode.scala 14:65]
  wire  _T_719 = _T_718 == 32'h12000000; // @[Decode.scala 14:121]
  wire [31:0] _T_720 = io_enq_uop_inst & 32'hd8000100; // @[Decode.scala 14:65]
  wire  _T_721 = _T_720 == 32'h50000100; // @[Decode.scala 14:121]
  wire  _T_723 = _T_578 == 32'h70000000; // @[Decode.scala 14:121]
  wire  _T_725 = _T_623 == 32'h80000000; // @[Decode.scala 14:121]
  wire [31:0] _T_726 = io_enq_uop_inst & 32'hc8000000; // @[Decode.scala 14:65]
  wire  _T_727 = _T_726 == 32'h80000000; // @[Decode.scala 14:121]
  wire [31:0] _T_728 = io_enq_uop_inst & 32'he4000000; // @[Decode.scala 14:65]
  wire  _T_729 = _T_728 == 32'ha0000000; // @[Decode.scala 14:121]
  wire [31:0] _T_730 = io_enq_uop_inst & 32'ha8000120; // @[Decode.scala 14:65]
  wire  _T_731 = _T_730 == 32'ha0000020; // @[Decode.scala 14:121]
  wire [31:0] _T_732 = io_enq_uop_inst & 32'haa000100; // @[Decode.scala 14:65]
  wire  _T_733 = _T_732 == 32'ha2000000; // @[Decode.scala 14:121]
  wire [31:0] _T_734 = io_enq_uop_inst & 32'hb5000000; // @[Decode.scala 14:65]
  wire  _T_735 = _T_734 == 32'ha4000000; // @[Decode.scala 14:121]
  wire [31:0] _T_736 = io_enq_uop_inst & 32'hb8000020; // @[Decode.scala 14:65]
  wire  _T_737 = _T_736 == 32'ha8000000; // @[Decode.scala 14:121]
  wire  hi_lo_hi_2 = lo_hi_hi_lo_1 | _T_719 | _T_721 | _T_723 | _T_725 | _T_727 | _T_729 | _T_731 | _T_733 | _T_735 |
    _T_737; // @[Decode.scala 15:30]
  wire  _T_749 = _T_623 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_750 = io_enq_uop_inst & 32'h60000000; // @[Decode.scala 14:65]
  wire  _T_751 = _T_750 == 32'h20000000; // @[Decode.scala 14:121]
  wire [31:0] _T_752 = io_enq_uop_inst & 32'h3a000100; // @[Decode.scala 14:65]
  wire  _T_753 = _T_752 == 32'h22000000; // @[Decode.scala 14:121]
  wire [31:0] _T_754 = io_enq_uop_inst & 32'ha80001c0; // @[Decode.scala 14:65]
  wire  _T_755 = _T_754 == 32'ha0000100; // @[Decode.scala 14:121]
  wire [31:0] _T_756 = io_enq_uop_inst & 32'ha8000200; // @[Decode.scala 14:65]
  wire  _T_757 = _T_756 == 32'ha0000200; // @[Decode.scala 14:121]
  wire  hi_hi_lo_3 = _T_749 | _T_663 | _T_626 | _T_751 | _T_753 | _T_755 | _T_757; // @[Decode.scala 15:30]
  wire [31:0] _T_764 = io_enq_uop_inst & 32'hcc000000; // @[Decode.scala 14:65]
  wire  _T_765 = _T_764 == 32'h8000000; // @[Decode.scala 14:121]
  wire [31:0] _T_766 = io_enq_uop_inst & 32'hd2000000; // @[Decode.scala 14:65]
  wire  _T_767 = _T_766 == 32'h12000000; // @[Decode.scala 14:121]
  wire [31:0] _T_768 = io_enq_uop_inst & 32'h68000000; // @[Decode.scala 14:65]
  wire  _T_769 = _T_768 == 32'h20000000; // @[Decode.scala 14:121]
  wire [31:0] _T_770 = io_enq_uop_inst & 32'h64000000; // @[Decode.scala 14:65]
  wire  _T_771 = _T_770 == 32'h20000000; // @[Decode.scala 14:121]
  wire [31:0] _T_772 = io_enq_uop_inst & 32'hb0000000; // @[Decode.scala 14:65]
  wire  _T_773 = _T_772 == 32'ha0000000; // @[Decode.scala 14:121]
  wire  hi_hi_hi_3 = _T_620 | _T_765 | _T_626 | _T_767 | _T_632 | _T_769 | _T_771 | _T_573 | _T_773; // @[Decode.scala 15:30]
  wire [2:0] lo_10 = {lo_hi_hi_2,lo_hi_lo_2,lo_lo_3}; // @[Cat.scala 30:58]
  wire [3:0] hi_11 = {hi_hi_hi_3,hi_hi_lo_3,hi_lo_hi_2,hi_lo_lo_2}; // @[Cat.scala 30:58]
  wire [6:0] cs_sub0_uopc = {hi_hi_hi_3,hi_hi_lo_3,hi_lo_hi_2,hi_lo_lo_2,lo_hi_hi_2,lo_hi_lo_2,lo_lo_3}; // @[Cat.scala 30:58]
  wire  _bit_T_2794 = bit_8 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 |
    _bit_T_1860 | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 |
    _bit_T_1876 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 |
    _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906; // @[Decode.scala 15:30]
  wire  _bit_T_2824 = _bit_T_2794 | _bit_T_1908 | _bit_T_1910 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 |
    _bit_T_1920 | _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 |
    _bit_T_1936 | _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 |
    _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998; // @[Decode.scala 15:30]
  wire  _bit_T_2854 = _bit_T_2824 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_990 | _bit_T_992 |
    _bit_T_994 | _bit_T_996 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1006 | _bit_T_1008 |
    _bit_T_1010 | _bit_T_1012 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | _bit_T_2008 | _bit_T_2010 |
    _bit_T_2012 | _bit_T_2014 | _bit_T_2016 | _bit_T_2018 | _bit_T_2020 | _bit_T_2022 | _bit_T_2024 | _bit_T_2026; // @[Decode.scala 15:30]
  wire  _bit_T_2884 = _bit_T_2854 | _bit_T_2028 | _bit_T_2030 | _bit_T_2034 | _bit_T_2036 | _bit_T_2038 | _bit_T_2040 |
    _bit_T_2042 | _bit_T_2044 | bit_30 | _bit_T_2048 | _bit_T_2050 | _bit_T_2052 | _bit_T_2054 | _bit_T_2056 |
    _bit_T_2058 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2066 | _bit_T_2068 | _bit_T_2070 | _bit_T_2072 |
    _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080 | _bit_T_2082 | _bit_T_2084 | _bit_T_2086 | _bit_T_2088; // @[Decode.scala 15:30]
  wire  bit_14 = _bit_T_2884 | _bit_T_2092 | _bit_T_2094 | _bit_T_2096 | _bit_T_2098 | _bit_T_2100 | _bit_T_2102; // @[Decode.scala 15:30]
  wire  lo_11 = ~bit_14; // @[Decode.scala 40:35]
  wire  _bit_T_2981 = _bit_T_2824 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_990 | _bit_T_992 |
    _bit_T_994 | _bit_T_996 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1006 | _bit_T_1008 |
    _bit_T_1010 | _bit_T_1012 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | _bit_T_2050 | _bit_T_2052 |
    _bit_T_2054 | _bit_T_2056 | _bit_T_2058 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2066 | _bit_T_2068; // @[Decode.scala 15:30]
  wire  hi_lo_7 = _bit_T_2981 | _bit_T_2070 | _bit_T_2072 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080; // @[Decode.scala 15:30]
  wire  _bit_T_3017 = _bit_T_1006 | _bit_T_1008 | _bit_T_1010 | _bit_T_1012 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 |
    _bit_T_1020 | _bit_T_2008 | _bit_T_2010 | _bit_T_2012 | _bit_T_2014 | _bit_T_2016 | _bit_T_2018 | _bit_T_2020 |
    _bit_T_2022 | _bit_T_2024 | _bit_T_2026 | _bit_T_2028 | _bit_T_2030 | _bit_T_2034 | _bit_T_2036 | _bit_T_2038 |
    _bit_T_2040 | _bit_T_2042 | _bit_T_2044 | bit_30 | _bit_T_2048 | _bit_T_2066 | _bit_T_2068 | _bit_T_2070; // @[Decode.scala 15:30]
  wire  hi_hi_7 = _bit_T_3017 | _bit_T_2072 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080 | _bit_T_2082 |
    _bit_T_2084 | _bit_T_2086 | _bit_T_2088 | _bit_T_2092 | _bit_T_2094 | _bit_T_2096 | _bit_T_2098 | _bit_T_2100 |
    _bit_T_2102; // @[Decode.scala 15:30]
  wire [1:0] hi_12 = {hi_hi_7,hi_lo_7}; // @[Cat.scala 30:58]
  wire [31:0] _T_784 = io_enq_uop_inst & 32'h60000100; // @[Decode.scala 14:65]
  wire  _T_785 = _T_784 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_786 = io_enq_uop_inst & 32'h92000000; // @[Decode.scala 14:65]
  wire  _T_787 = _T_786 == 32'h12000000; // @[Decode.scala 14:121]
  wire  _T_789 = _T_623 == 32'h50000000; // @[Decode.scala 14:121]
  wire [31:0] _T_790 = io_enq_uop_inst & 32'h61000000; // @[Decode.scala 14:65]
  wire  _T_791 = _T_790 == 32'h20000000; // @[Decode.scala 14:121]
  wire  lo_lo_lo_1 = _T_785 | _T_787 | _T_632 | _T_789 | _T_791; // @[Decode.scala 15:30]
  wire [31:0] _T_796 = io_enq_uop_inst & 32'hda040000; // @[Decode.scala 14:65]
  wire  _T_797 = _T_796 == 32'h10040000; // @[Decode.scala 14:121]
  wire  _T_799 = _T_600 == 32'ha1000000; // @[Decode.scala 14:121]
  wire  lo_lo_hi_1 = _T_797 | _T_799; // @[Decode.scala 15:30]
  wire  _T_802 = _T_623 == 32'h40000000; // @[Decode.scala 14:121]
  wire  _T_804 = _T_586 == 32'hc0000000; // @[Decode.scala 14:121]
  wire  lo_hi_lo_3 = _T_802 | _T_804; // @[Decode.scala 15:30]
  wire  _T_807 = _T_736 == 32'ha8000020; // @[Decode.scala 14:121]
  wire [31:0] _T_808 = io_enq_uop_inst & 32'he0000120; // @[Decode.scala 14:65]
  wire  _T_809 = _T_808 == 32'he0000020; // @[Decode.scala 14:121]
  wire  hi_lo_hi_3 = _T_807 | _T_809 | _T_701 | _T_703; // @[Decode.scala 15:30]
  wire [31:0] _T_813 = io_enq_uop_inst & 32'he80001c0; // @[Decode.scala 14:65]
  wire  hi_hi_lo_4 = _T_813 == 32'he0000100; // @[Decode.scala 14:121]
  wire [31:0] _T_815 = io_enq_uop_inst & 32'he1000020; // @[Decode.scala 14:65]
  wire  hi_hi_hi_lo_1 = _T_815 == 32'he0000000; // @[Decode.scala 14:121]
  wire  _T_818 = _T_815 == 32'he1000000; // @[Decode.scala 14:121]
  wire  hi_hi_hi_hi_1 = _T_638 | _T_818; // @[Decode.scala 15:30]
  wire [4:0] lo_12 = {1'h0,lo_hi_hi_lo_1,lo_hi_lo_3,lo_lo_hi_1,lo_lo_lo_1}; // @[Cat.scala 30:58]
  wire [4:0] hi_13 = {hi_hi_hi_hi_1,hi_hi_hi_lo_1,hi_hi_lo_4,hi_lo_hi_3,1'h0}; // @[Cat.scala 30:58]
  wire [31:0] _T_825 = io_enq_uop_inst & 32'he8000000; // @[Decode.scala 14:65]
  wire  _T_826 = _T_825 == 32'ha0000000; // @[Decode.scala 14:121]
  wire  _bit_T_3063 = bit_8 | _bit_T_1078 | _bit_T_1084 | _bit_T_1086 | _bit_T_1090 | _bit_T_1308 | _bit_T_1310 |
    _bit_T_1312 | _bit_T_1314 | _bit_T_1320 | _bit_T_1322 | _bit_T_1328 | _bit_T_1330 | _bit_T_1816 | _bit_T_1818 |
    _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834 |
    _bit_T_1836 | _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_1848 | _bit_T_1850; // @[Decode.scala 15:30]
  wire  _bit_T_3093 = _bit_T_3063 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 | _bit_T_1862 |
    _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892 | _bit_T_1894 |
    _bit_T_1912 | _bit_T_1916 | _bit_T_1920 | _bit_T_1924 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 |
    _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958; // @[Decode.scala 15:30]
  wire  _bit_T_3123 = _bit_T_3093 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 | _bit_T_1970 |
    _bit_T_1972 | _bit_T_1974 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 | _bit_T_1986 |
    _bit_T_1988 | _bit_T_1990 | _bit_T_2008 | _bit_T_2010 | _bit_T_2012 | _bit_T_2014 | _bit_T_2016 | _bit_T_2018 |
    _bit_T_2020 | _bit_T_2022 | _bit_T_2024 | _bit_T_2026 | _bit_T_2028 | _bit_T_2030 | _bit_T_2036 | _bit_T_2038; // @[Decode.scala 15:30]
  wire  lo_13 = _bit_T_3123 | _bit_T_2040 | _bit_T_2050 | _bit_T_2052 | _bit_T_2054 | _bit_T_2056 | _bit_T_2058 |
    _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2082 | _bit_T_2084 | _bit_T_2086 | _bit_T_2090 | _bit_T_2092 |
    _bit_T_2094 | _bit_T_2096 | _bit_T_2098 | _bit_T_2100 | _bit_T_2102; // @[Decode.scala 15:30]
  wire  _bit_T_3172 = _bit_T_1078 | _bit_T_1084 | _bit_T_1086 | _bit_T_1090 | _bit_T_926 | _bit_T_928 | _bit_T_930 |
    _bit_T_932 | _bit_T_934 | _bit_T_936 | _bit_T_938 | _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 | _bit_T_948
     | _bit_T_950 | _bit_T_952 | _bit_T_954 | _bit_T_956 | _bit_T_958 | _bit_T_960 | _bit_T_962 | _bit_T_964 |
    _bit_T_966 | _bit_T_968 | _bit_T_970 | _bit_T_972 | _bit_T_974 | _bit_T_976 | _bit_T_978; // @[Decode.scala 15:30]
  wire  _bit_T_3202 = _bit_T_3172 | _bit_T_980 | _bit_T_982 | _bit_T_984 | _bit_T_986 | _bit_T_988 | _bit_T_1092 |
    _bit_T_1094 | _bit_T_1096 | _bit_T_1098 | _bit_T_1100 | _bit_T_1102 | _bit_T_1104 | _bit_T_1106 | _bit_T_1108 |
    _bit_T_1110 | _bit_T_1112 | _bit_T_1114 | _bit_T_1116 | _bit_T_1118 | _bit_T_1120 | _bit_T_1122 | _bit_T_1124 |
    _bit_T_1126 | _bit_T_1128 | _bit_T_1130 | _bit_T_1132 | _bit_T_1134 | _bit_T_1136 | _bit_T_1138 | _bit_T_1140; // @[Decode.scala 15:30]
  wire  _bit_T_3232 = _bit_T_3202 | _bit_T_1142 | _bit_T_1144 | _bit_T_1146 | _bit_T_1148 | _bit_T_1150 | _bit_T_1152 |
    _bit_T_1154 | _bit_T_1156 | _bit_T_1158 | _bit_T_1160 | _bit_T_1162 | _bit_T_1164 | _bit_T_1166 | _bit_T_1168 |
    _bit_T_1170 | _bit_T_1172 | _bit_T_1174 | _bit_T_1176 | _bit_T_1178 | _bit_T_1180 | _bit_T_1182 | _bit_T_1184 |
    _bit_T_1186 | _bit_T_1188 | _bit_T_1190 | _bit_T_1192 | _bit_T_1194 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200; // @[Decode.scala 15:30]
  wire  _bit_T_3262 = _bit_T_3232 | _bit_T_1202 | _bit_T_1204 | _bit_T_1206 | _bit_T_1208 | _bit_T_1210 | _bit_T_1212 |
    _bit_T_1214 | _bit_T_1216 | _bit_T_1218 | _bit_T_1220 | _bit_T_1222 | _bit_T_1224 | _bit_T_1226 | _bit_T_1228 |
    _bit_T_1230 | _bit_T_1232 | _bit_T_1234 | _bit_T_1236 | _bit_T_1238 | _bit_T_1240 | _bit_T_1242 | _bit_T_1244 |
    _bit_T_1246 | _bit_T_1248 | _bit_T_1250 | _bit_T_1252 | _bit_T_1254 | _bit_T_1256 | _bit_T_1258 | _bit_T_1260; // @[Decode.scala 15:30]
  wire  _bit_T_3292 = _bit_T_3262 | _bit_T_1262 | _bit_T_1264 | _bit_T_1266 | _bit_T_1268 | _bit_T_1270 | _bit_T_1272 |
    _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 | _bit_T_1282 | _bit_T_1284 | _bit_T_1286 | _bit_T_1288 |
    _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 | _bit_T_1298 | _bit_T_1300 | _bit_T_1302 | _bit_T_1304 |
    _bit_T_1306 | _bit_T_1316 | _bit_T_1318 | _bit_T_1324 | _bit_T_1326 | _bit_T_1332 | _bit_T_1334 | _bit_T_1336; // @[Decode.scala 15:30]
  wire  _bit_T_3322 = _bit_T_3292 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 |
    _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364 |
    _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 |
    _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396; // @[Decode.scala 15:30]
  wire  _bit_T_3352 = _bit_T_3322 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 |
    _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1424 |
    _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 |
    _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456; // @[Decode.scala 15:30]
  wire  _bit_T_3382 = _bit_T_3352 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 |
    _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 | _bit_T_1482 | _bit_T_1484 |
    _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 |
    _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516; // @[Decode.scala 15:30]
  wire  _bit_T_3412 = _bit_T_3382 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528 |
    _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540 | _bit_T_1542 | _bit_T_1544 |
    _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 |
    _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576; // @[Decode.scala 15:30]
  wire  _bit_T_3442 = _bit_T_3412 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 |
    _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 |
    _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 |
    _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636; // @[Decode.scala 15:30]
  wire  _bit_T_3472 = _bit_T_3442 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 |
    _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 |
    _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 |
    _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696; // @[Decode.scala 15:30]
  wire  _bit_T_3502 = _bit_T_3472 | _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 |
    _bit_T_1710 | _bit_T_1712 | _bit_T_1714 | _bit_T_1716 | _bit_T_1718 | _bit_T_1720 | _bit_T_1722 | _bit_T_1724 |
    _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 |
    _bit_T_1742 | _bit_T_1744 | _bit_T_1746 | _bit_T_1748 | _bit_T_1750 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756; // @[Decode.scala 15:30]
  wire  _bit_T_3532 = _bit_T_3502 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 |
    _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 |
    _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 |
    _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1816; // @[Decode.scala 15:30]
  wire  _bit_T_3562 = _bit_T_3532 | _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 |
    _bit_T_1830 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 |
    _bit_T_1846 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 |
    _bit_T_1958 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 | _bit_T_1970 | _bit_T_1972; // @[Decode.scala 15:30]
  wire  hi_lo_9 = _bit_T_3562 | _bit_T_1974 | _bit_T_2034 | bit_30 | _bit_T_2048 | _bit_T_2088 | _bit_T_2090; // @[Decode.scala 15:30]
  wire  hi_hi_9 = _bit_T_1078 | _bit_T_1084 | _bit_T_1086 | _bit_T_1090 | _bit_T_990 | _bit_T_992 | _bit_T_994 |
    _bit_T_996 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004; // @[Decode.scala 15:30]
  wire [1:0] hi_14 = {hi_hi_9,hi_lo_9}; // @[Cat.scala 30:58]
  wire  _bit_T_3610 = bit_8 | _bit_T_1084 | _bit_T_1086 | _bit_T_926 | _bit_T_928 | _bit_T_930 | _bit_T_932 | _bit_T_934
     | _bit_T_936 | _bit_T_938 | _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 | _bit_T_948 | _bit_T_950 |
    _bit_T_952 | _bit_T_954 | _bit_T_956 | _bit_T_958 | _bit_T_960 | _bit_T_962 | _bit_T_964 | _bit_T_966 | _bit_T_968
     | _bit_T_970 | _bit_T_972 | _bit_T_974 | _bit_T_976 | _bit_T_978 | _bit_T_980; // @[Decode.scala 15:30]
  wire  _bit_T_3640 = _bit_T_3610 | _bit_T_982 | _bit_T_984 | _bit_T_986 | _bit_T_988 | _bit_T_1688 | _bit_T_1690 |
    _bit_T_1692 | _bit_T_1694 | _bit_T_1696 | _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 |
    _bit_T_1708 | _bit_T_1710 | _bit_T_1712 | _bit_T_1714 | _bit_T_1716 | _bit_T_1718 | _bit_T_1720 | _bit_T_1722 |
    _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734 | _bit_T_1736 | _bit_T_1738; // @[Decode.scala 15:30]
  wire  _bit_T_3670 = _bit_T_3640 | _bit_T_1740 | _bit_T_1742 | _bit_T_1744 | _bit_T_1746 | _bit_T_1748 | _bit_T_1750 |
    _bit_T_1816 | _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 | _bit_T_1830 |
    _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 | _bit_T_1846 |
    _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 | _bit_T_1862; // @[Decode.scala 15:30]
  wire  _bit_T_3700 = _bit_T_3670 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 |
    _bit_T_1876 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 |
    _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 |
    _bit_T_1908 | _bit_T_1910 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 | _bit_T_1922; // @[Decode.scala 15:30]
  wire  _bit_T_3730 = _bit_T_3700 | _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 |
    _bit_T_1936 | _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 |
    _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 |
    _bit_T_1968 | _bit_T_1970 | _bit_T_1972 | _bit_T_1974 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982; // @[Decode.scala 15:30]
  wire  _bit_T_3760 = _bit_T_3730 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 |
    _bit_T_1996 | _bit_T_1998 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_990 | _bit_T_992 |
    _bit_T_994 | _bit_T_996 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1006 | _bit_T_1008 |
    _bit_T_1010 | _bit_T_1012 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | _bit_T_2008 | _bit_T_2010; // @[Decode.scala 15:30]
  wire  _bit_T_3790 = _bit_T_3760 | _bit_T_2012 | _bit_T_2014 | _bit_T_2016 | _bit_T_2018 | _bit_T_2020 | _bit_T_2022 |
    _bit_T_2032 | _bit_T_2036 | _bit_T_2038 | _bit_T_2040 | _bit_T_2042 | _bit_T_2044 | bit_30 | _bit_T_2048 |
    _bit_T_2050 | _bit_T_2052 | _bit_T_2054 | _bit_T_2056 | _bit_T_2058 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 |
    _bit_T_2066 | _bit_T_2068 | _bit_T_2070 | _bit_T_2072 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080; // @[Decode.scala 15:30]
  wire  lo_14 = _bit_T_3790 | _bit_T_2088 | _bit_T_2090; // @[Decode.scala 15:30]
  wire  _bit_T_3853 = _bit_T_3610 | _bit_T_982 | _bit_T_984 | _bit_T_986 | _bit_T_988 | _bit_T_1124 | _bit_T_1126 |
    _bit_T_1160 | _bit_T_1162 | _bit_T_1196 | _bit_T_1198 | _bit_T_1232 | _bit_T_1234 | _bit_T_1268 | _bit_T_1270 |
    _bit_T_1304 | _bit_T_1306 | _bit_T_1368 | _bit_T_1370 | _bit_T_1404 | _bit_T_1406 | _bit_T_1440 | _bit_T_1442 |
    _bit_T_1476 | _bit_T_1478 | _bit_T_1496 | _bit_T_1514 | _bit_T_1532 | _bit_T_1550 | _bit_T_1568 | _bit_T_1586; // @[Decode.scala 15:30]
  wire  _bit_T_3883 = _bit_T_3853 | _bit_T_1604 | _bit_T_1622 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 |
    _bit_T_1696 | _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 | _bit_T_1710 |
    _bit_T_1712 | _bit_T_1714 | _bit_T_1716 | _bit_T_1718 | _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 |
    _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 | _bit_T_1742; // @[Decode.scala 15:30]
  wire  _bit_T_3913 = _bit_T_3883 | _bit_T_1744 | _bit_T_1746 | _bit_T_1748 | _bit_T_1750 | _bit_T_1816 | _bit_T_1818 |
    _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834 |
    _bit_T_1836 | _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_1848 | _bit_T_1850 |
    _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 | _bit_T_1862 | _bit_T_1864 | _bit_T_1866; // @[Decode.scala 15:30]
  wire  _bit_T_3943 = _bit_T_3913 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876 | _bit_T_1878 |
    _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892 | _bit_T_1894 |
    _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908 | _bit_T_1910 |
    _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924 | _bit_T_1926; // @[Decode.scala 15:30]
  wire  _bit_T_3973 = _bit_T_3943 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936 | _bit_T_1938 |
    _bit_T_1940 | _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 |
    _bit_T_1956 | _bit_T_1958 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 | _bit_T_1970 |
    _bit_T_1972 | _bit_T_1974 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 | _bit_T_1986; // @[Decode.scala 15:30]
  wire  _bit_T_4003 = _bit_T_3973 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 |
    _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_990 | _bit_T_992 | _bit_T_994 | _bit_T_996 |
    _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1006 | _bit_T_1008 | _bit_T_1010 | _bit_T_1012 |
    _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | _bit_T_2008 | _bit_T_2010 | _bit_T_2012 | _bit_T_2014; // @[Decode.scala 15:30]
  wire  hi_lo_10 = _bit_T_4003 | _bit_T_2016 | _bit_T_2018 | _bit_T_2020 | _bit_T_2022 | _bit_T_2042 | _bit_T_2044 |
    bit_30 | _bit_T_2048 | _bit_T_2050 | _bit_T_2052 | _bit_T_2054 | _bit_T_2056 | _bit_T_2058 | _bit_T_2060 |
    _bit_T_2062 | _bit_T_2064 | _bit_T_2066 | _bit_T_2068 | _bit_T_2070 | _bit_T_2072 | _bit_T_2074 | _bit_T_2076 |
    _bit_T_2078 | _bit_T_2080 | _bit_T_2088; // @[Decode.scala 15:30]
  wire  _bit_T_4058 = _bit_T_1084 | _bit_T_1086 | _bit_T_1088 | _bit_T_1090 | _bit_T_1092 | _bit_T_1094 | _bit_T_1096 |
    _bit_T_1098 | _bit_T_1100 | _bit_T_1102 | _bit_T_1104 | _bit_T_1106 | _bit_T_1108 | _bit_T_1110 | _bit_T_1112 |
    _bit_T_1114 | _bit_T_1116 | _bit_T_1118 | _bit_T_1120 | _bit_T_1122 | _bit_T_1124 | _bit_T_1126 | _bit_T_1128 |
    _bit_T_1130 | _bit_T_1132 | _bit_T_1134 | _bit_T_1136 | _bit_T_1138 | _bit_T_1140 | _bit_T_1142 | _bit_T_1144; // @[Decode.scala 15:30]
  wire  _bit_T_4088 = _bit_T_4058 | _bit_T_1146 | _bit_T_1148 | _bit_T_1150 | _bit_T_1152 | _bit_T_1154 | _bit_T_1156 |
    _bit_T_1158 | _bit_T_1160 | _bit_T_1162 | _bit_T_1164 | _bit_T_1166 | _bit_T_1168 | _bit_T_1170 | _bit_T_1172 |
    _bit_T_1174 | _bit_T_1176 | _bit_T_1178 | _bit_T_1180 | _bit_T_1182 | _bit_T_1184 | _bit_T_1186 | _bit_T_1188 |
    _bit_T_1190 | _bit_T_1192 | _bit_T_1194 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200 | _bit_T_1202 | _bit_T_1204; // @[Decode.scala 15:30]
  wire  _bit_T_4118 = _bit_T_4088 | _bit_T_1206 | _bit_T_1208 | _bit_T_1210 | _bit_T_1212 | _bit_T_1214 | _bit_T_1216 |
    _bit_T_1218 | _bit_T_1220 | _bit_T_1222 | _bit_T_1224 | _bit_T_1226 | _bit_T_1228 | _bit_T_1230 | _bit_T_1232 |
    _bit_T_1234 | _bit_T_1236 | _bit_T_1238 | _bit_T_1240 | _bit_T_1242 | _bit_T_1244 | _bit_T_1246 | _bit_T_1248 |
    _bit_T_1250 | _bit_T_1252 | _bit_T_1254 | _bit_T_1256 | _bit_T_1258 | _bit_T_1260 | _bit_T_1262 | _bit_T_1264; // @[Decode.scala 15:30]
  wire  _bit_T_4148 = _bit_T_4118 | _bit_T_1266 | _bit_T_1268 | _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 |
    _bit_T_1278 | _bit_T_1280 | _bit_T_1282 | _bit_T_1284 | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 |
    _bit_T_1294 | _bit_T_1296 | _bit_T_1298 | _bit_T_1300 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1312 |
    _bit_T_1314 | _bit_T_1316 | _bit_T_1318 | _bit_T_1320 | _bit_T_1322 | _bit_T_1324 | _bit_T_1326 | _bit_T_1328; // @[Decode.scala 15:30]
  wire  _bit_T_4178 = _bit_T_4148 | _bit_T_1330 | _bit_T_1332 | _bit_T_1334 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 |
    _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 |
    _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 |
    _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388; // @[Decode.scala 15:30]
  wire  _bit_T_4208 = _bit_T_4178 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 |
    _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 |
    _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 |
    _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448; // @[Decode.scala 15:30]
  wire  _bit_T_4238 = _bit_T_4208 | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 |
    _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 |
    _bit_T_1478 | _bit_T_1480 | _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 |
    _bit_T_1494 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508; // @[Decode.scala 15:30]
  wire  _bit_T_4268 = _bit_T_4238 | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 |
    _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 |
    _bit_T_1538 | _bit_T_1540 | _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 |
    _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568; // @[Decode.scala 15:30]
  wire  _bit_T_4298 = _bit_T_4268 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 |
    _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 |
    _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 |
    _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628; // @[Decode.scala 15:30]
  wire  _bit_T_4328 = _bit_T_4298 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 |
    _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 |
    _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 |
    _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1752; // @[Decode.scala 15:30]
  wire  _bit_T_4358 = _bit_T_4328 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 |
    _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 |
    _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 |
    _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812; // @[Decode.scala 15:30]
  wire  hi_hi_10 = _bit_T_4358 | _bit_T_1814 | _bit_T_2024 | _bit_T_2026 | _bit_T_2028 | _bit_T_2030 | _bit_T_2082 |
    _bit_T_2084 | _bit_T_2086 | _bit_T_2092 | _bit_T_2094 | _bit_T_2096 | _bit_T_2098 | _bit_T_2100 | _bit_T_2102; // @[Decode.scala 15:30]
  wire [1:0] hi_15 = {hi_hi_10,hi_lo_10}; // @[Cat.scala 30:58]
  wire  _bit_T_4402 = _bit_T_1096 | _bit_T_1098 | _bit_T_1104 | _bit_T_1106 | _bit_T_1112 | _bit_T_1114 | _bit_T_1120 |
    _bit_T_1122 | _bit_T_1132 | _bit_T_1134 | _bit_T_1140 | _bit_T_1142 | _bit_T_1148 | _bit_T_1150 | _bit_T_1156 |
    _bit_T_1158 | _bit_T_1168 | _bit_T_1170 | _bit_T_1176 | _bit_T_1178 | _bit_T_1184 | _bit_T_1186 | _bit_T_1192 |
    _bit_T_1194 | _bit_T_1204 | _bit_T_1206 | _bit_T_1212 | _bit_T_1214 | _bit_T_1220 | _bit_T_1222 | _bit_T_1228; // @[Decode.scala 15:30]
  wire  _bit_T_4432 = _bit_T_4402 | _bit_T_1230 | _bit_T_1240 | _bit_T_1242 | _bit_T_1248 | _bit_T_1250 | _bit_T_1256 |
    _bit_T_1258 | _bit_T_1264 | _bit_T_1266 | _bit_T_1276 | _bit_T_1278 | _bit_T_1284 | _bit_T_1286 | _bit_T_1292 |
    _bit_T_1294 | _bit_T_1300 | _bit_T_1302 | _bit_T_1312 | _bit_T_1314 | _bit_T_1316 | _bit_T_1318 | _bit_T_1320 |
    _bit_T_1322 | _bit_T_1324 | _bit_T_1326 | _bit_T_1328 | _bit_T_1330 | _bit_T_1332 | _bit_T_1334 | _bit_T_1352; // @[Decode.scala 15:30]
  wire  _bit_T_4462 = _bit_T_4432 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364 |
    _bit_T_1366 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 |
    _bit_T_1402 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 |
    _bit_T_1438 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472; // @[Decode.scala 15:30]
  wire  _bit_T_4492 = _bit_T_4462 | _bit_T_1474 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1506 |
    _bit_T_1508 | _bit_T_1510 | _bit_T_1512 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528 | _bit_T_1530 | _bit_T_1542 |
    _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1560 | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1578 |
    _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1614; // @[Decode.scala 15:30]
  wire  _bit_T_4522 = _bit_T_4492 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 |
    _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876 | _bit_T_1878 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 |
    _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | _bit_T_1914 | _bit_T_1918 | _bit_T_1922 |
    _bit_T_1926 | _bit_T_1936 | _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996; // @[Decode.scala 15:30]
  wire  lo_15 = _bit_T_4522 | _bit_T_1998 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_2066 |
    _bit_T_2068 | _bit_T_2070 | _bit_T_2072 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080; // @[Decode.scala 15:30]
  wire  _bit_T_4565 = _bit_T_1092 | _bit_T_1094 | _bit_T_1100 | _bit_T_1102 | _bit_T_1108 | _bit_T_1110 | _bit_T_1116 |
    _bit_T_1118 | _bit_T_1124 | _bit_T_1126 | _bit_T_1128 | _bit_T_1130 | _bit_T_1136 | _bit_T_1138 | _bit_T_1144 |
    _bit_T_1146 | _bit_T_1152 | _bit_T_1154 | _bit_T_1160 | _bit_T_1162 | _bit_T_1164 | _bit_T_1166 | _bit_T_1172 |
    _bit_T_1174 | _bit_T_1180 | _bit_T_1182 | _bit_T_1188 | _bit_T_1190 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200; // @[Decode.scala 15:30]
  wire  _bit_T_4595 = _bit_T_4565 | _bit_T_1202 | _bit_T_1208 | _bit_T_1210 | _bit_T_1216 | _bit_T_1218 | _bit_T_1224 |
    _bit_T_1226 | _bit_T_1232 | _bit_T_1234 | _bit_T_1236 | _bit_T_1238 | _bit_T_1244 | _bit_T_1246 | _bit_T_1252 |
    _bit_T_1254 | _bit_T_1260 | _bit_T_1262 | _bit_T_1268 | _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1280 |
    _bit_T_1282 | _bit_T_1288 | _bit_T_1290 | _bit_T_1296 | _bit_T_1298 | _bit_T_1304 | _bit_T_1306 | _bit_T_1312; // @[Decode.scala 15:30]
  wire  _bit_T_4625 = _bit_T_4595 | _bit_T_1314 | _bit_T_1316 | _bit_T_1318 | _bit_T_1320 | _bit_T_1322 | _bit_T_1324 |
    _bit_T_1326 | _bit_T_1328 | _bit_T_1330 | _bit_T_1332 | _bit_T_1334 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 |
    _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 |
    _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1404; // @[Decode.scala 15:30]
  wire  _bit_T_4655 = _bit_T_4625 | _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 |
    _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 |
    _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 |
    _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504; // @[Decode.scala 15:30]
  wire  _bit_T_4685 = _bit_T_4655 | _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1532 |
    _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 |
    _bit_T_1558 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 | _bit_T_1586 | _bit_T_1588 |
    _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612; // @[Decode.scala 15:30]
  wire  _bit_T_4715 = _bit_T_4685 | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 |
    _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 |
    _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 |
    _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680; // @[Decode.scala 15:30]
  wire  _bit_T_4745 = _bit_T_4715 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 |
    _bit_T_1694 | _bit_T_1696 | _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 |
    _bit_T_1710 | _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 |
    _bit_T_1742 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764; // @[Decode.scala 15:30]
  wire  _bit_T_4775 = _bit_T_4745 | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 |
    _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 |
    _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 |
    _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1816 | _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824; // @[Decode.scala 15:30]
  wire  hi_lo_11 = _bit_T_4775 | _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834 | _bit_T_1840 |
    _bit_T_1842 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 |
    _bit_T_1966; // @[Decode.scala 15:30]
  wire  _bit_T_4821 = bit_8 | _bit_T_1092 | _bit_T_1094 | _bit_T_1096 | _bit_T_1098 | _bit_T_1100 | _bit_T_1102 |
    _bit_T_1104 | _bit_T_1106 | _bit_T_1108 | _bit_T_1110 | _bit_T_1112 | _bit_T_1114 | _bit_T_1116 | _bit_T_1118 |
    _bit_T_1120 | _bit_T_1122 | _bit_T_1124 | _bit_T_1126 | _bit_T_1128 | _bit_T_1130 | _bit_T_1132 | _bit_T_1134 |
    _bit_T_1136 | _bit_T_1138 | _bit_T_1140 | _bit_T_1142 | _bit_T_1144 | _bit_T_1146 | _bit_T_1148 | _bit_T_1150; // @[Decode.scala 15:30]
  wire  _bit_T_4851 = _bit_T_4821 | _bit_T_1152 | _bit_T_1154 | _bit_T_1156 | _bit_T_1158 | _bit_T_1160 | _bit_T_1162 |
    _bit_T_1164 | _bit_T_1166 | _bit_T_1168 | _bit_T_1170 | _bit_T_1172 | _bit_T_1174 | _bit_T_1176 | _bit_T_1178 |
    _bit_T_1180 | _bit_T_1182 | _bit_T_1184 | _bit_T_1186 | _bit_T_1188 | _bit_T_1190 | _bit_T_1192 | _bit_T_1194 |
    _bit_T_1196 | _bit_T_1198 | _bit_T_1200 | _bit_T_1202 | _bit_T_1204 | _bit_T_1206 | _bit_T_1208 | _bit_T_1210; // @[Decode.scala 15:30]
  wire  _bit_T_4881 = _bit_T_4851 | _bit_T_1212 | _bit_T_1214 | _bit_T_1216 | _bit_T_1218 | _bit_T_1220 | _bit_T_1222 |
    _bit_T_1224 | _bit_T_1226 | _bit_T_1228 | _bit_T_1230 | _bit_T_1232 | _bit_T_1234 | _bit_T_1236 | _bit_T_1238 |
    _bit_T_1240 | _bit_T_1242 | _bit_T_1244 | _bit_T_1246 | _bit_T_1248 | _bit_T_1250 | _bit_T_1252 | _bit_T_1254 |
    _bit_T_1256 | _bit_T_1258 | _bit_T_1260 | _bit_T_1262 | _bit_T_1264 | _bit_T_1266 | _bit_T_1268 | _bit_T_1270; // @[Decode.scala 15:30]
  wire  _bit_T_4911 = _bit_T_4881 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 | _bit_T_1282 |
    _bit_T_1284 | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 | _bit_T_1298 |
    _bit_T_1300 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1308 | _bit_T_1310 | _bit_T_1336 | _bit_T_1338 |
    _bit_T_1340 | _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354; // @[Decode.scala 15:30]
  wire  _bit_T_4941 = _bit_T_4911 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364 | _bit_T_1366 |
    _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 | _bit_T_1382 |
    _bit_T_1384 | _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 |
    _bit_T_1400 | _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414; // @[Decode.scala 15:30]
  wire  _bit_T_4971 = _bit_T_4941 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1424 | _bit_T_1426 |
    _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 | _bit_T_1442 |
    _bit_T_1444 | _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 |
    _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474; // @[Decode.scala 15:30]
  wire  _bit_T_5001 = _bit_T_4971 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 | _bit_T_1482 | _bit_T_1484 | _bit_T_1486 |
    _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 | _bit_T_1502 |
    _bit_T_1504 | _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516 | _bit_T_1518 |
    _bit_T_1520 | _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534; // @[Decode.scala 15:30]
  wire  _bit_T_5031 = _bit_T_5001 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540 | _bit_T_1542 | _bit_T_1544 | _bit_T_1546 |
    _bit_T_1548 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 | _bit_T_1562 |
    _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 | _bit_T_1578 |
    _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594; // @[Decode.scala 15:30]
  wire  _bit_T_5061 = _bit_T_5031 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 | _bit_T_1606 |
    _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 | _bit_T_1622 |
    _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 |
    _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654; // @[Decode.scala 15:30]
  wire  _bit_T_5091 = _bit_T_5061 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 |
    _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 |
    _bit_T_1684 | _bit_T_1686 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696 | _bit_T_1698 |
    _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 | _bit_T_1710 | _bit_T_1712 | _bit_T_1714; // @[Decode.scala 15:30]
  wire  _bit_T_5121 = _bit_T_5091 | _bit_T_1716 | _bit_T_1718 | _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 |
    _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 | _bit_T_1742 |
    _bit_T_1744 | _bit_T_1746 | _bit_T_1748 | _bit_T_1750 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 |
    _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774; // @[Decode.scala 15:30]
  wire  _bit_T_5151 = _bit_T_5121 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 |
    _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 | _bit_T_1802 |
    _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1816 | _bit_T_1818 |
    _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834; // @[Decode.scala 15:30]
  wire  _bit_T_5181 = _bit_T_5151 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 | _bit_T_1846 |
    _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 |
    _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 | _bit_T_1970 | _bit_T_1972 | _bit_T_1974 |
    _bit_T_1006 | _bit_T_1008 | _bit_T_1010 | _bit_T_1012 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020; // @[Decode.scala 15:30]
  wire  hi_hi_11 = _bit_T_5181 | _bit_T_2008 | _bit_T_2010 | _bit_T_2012 | _bit_T_2014 | _bit_T_2016 | _bit_T_2018 |
    _bit_T_2020 | _bit_T_2022 | _bit_T_2024 | _bit_T_2026 | _bit_T_2028 | _bit_T_2030 | _bit_T_2036 | _bit_T_2038 |
    _bit_T_2040 | _bit_T_2042 | _bit_T_2044 | bit_30 | _bit_T_2048 | _bit_T_2082 | _bit_T_2084 | _bit_T_2086; // @[Decode.scala 15:30]
  wire [1:0] hi_16 = {hi_hi_11,hi_lo_11}; // @[Cat.scala 30:58]
  wire  _bit_T_5210 = _bit_T_1076 | _bit_T_1078 | _bit_T_1080 | _bit_T_1082 | _bit_T_1084 | _bit_T_1086 | _bit_T_1088 |
    _bit_T_1090; // @[Decode.scala 15:30]
  wire  _bit_T_5233 = _bit_T_1076 | _bit_T_1078 | _bit_T_1080 | _bit_T_1082 | _bit_T_1084 | _bit_T_1086 | _bit_T_1088 |
    _bit_T_1090 | _bit_T_926 | _bit_T_928 | _bit_T_930 | _bit_T_932 | _bit_T_934 | _bit_T_936 | _bit_T_938 | _bit_T_940
     | _bit_T_942 | _bit_T_944 | _bit_T_946 | _bit_T_948 | _bit_T_950 | _bit_T_952 | _bit_T_954 | _bit_T_956 |
    _bit_T_958 | _bit_T_960 | _bit_T_962 | _bit_T_964 | _bit_T_966 | _bit_T_968 | _bit_T_970; // @[Decode.scala 15:30]
  wire  _bit_T_5263 = _bit_T_5233 | _bit_T_972 | _bit_T_974 | _bit_T_976 | _bit_T_978 | _bit_T_980 | _bit_T_982 |
    _bit_T_984 | _bit_T_986 | _bit_T_988 | _bit_T_1092 | _bit_T_1094 | _bit_T_1096 | _bit_T_1098 | _bit_T_1100 |
    _bit_T_1102 | _bit_T_1104 | _bit_T_1106 | _bit_T_1108 | _bit_T_1110 | _bit_T_1112 | _bit_T_1114 | _bit_T_1116 |
    _bit_T_1118 | _bit_T_1120 | _bit_T_1122 | _bit_T_1124 | _bit_T_1126 | _bit_T_1128 | _bit_T_1130 | _bit_T_1132; // @[Decode.scala 15:30]
  wire  _bit_T_5293 = _bit_T_5263 | _bit_T_1134 | _bit_T_1136 | _bit_T_1138 | _bit_T_1140 | _bit_T_1142 | _bit_T_1144 |
    _bit_T_1146 | _bit_T_1148 | _bit_T_1150 | _bit_T_1152 | _bit_T_1154 | _bit_T_1156 | _bit_T_1158 | _bit_T_1160 |
    _bit_T_1162 | _bit_T_1164 | _bit_T_1166 | _bit_T_1168 | _bit_T_1170 | _bit_T_1172 | _bit_T_1174 | _bit_T_1176 |
    _bit_T_1178 | _bit_T_1180 | _bit_T_1182 | _bit_T_1184 | _bit_T_1186 | _bit_T_1188 | _bit_T_1190 | _bit_T_1192; // @[Decode.scala 15:30]
  wire  _bit_T_5323 = _bit_T_5293 | _bit_T_1194 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200 | _bit_T_1202 | _bit_T_1204 |
    _bit_T_1206 | _bit_T_1208 | _bit_T_1210 | _bit_T_1212 | _bit_T_1214 | _bit_T_1216 | _bit_T_1218 | _bit_T_1220 |
    _bit_T_1222 | _bit_T_1224 | _bit_T_1226 | _bit_T_1228 | _bit_T_1230 | _bit_T_1232 | _bit_T_1234 | _bit_T_1236 |
    _bit_T_1238 | _bit_T_1240 | _bit_T_1242 | _bit_T_1244 | _bit_T_1246 | _bit_T_1248 | _bit_T_1250 | _bit_T_1252; // @[Decode.scala 15:30]
  wire  _bit_T_5353 = _bit_T_5323 | _bit_T_1254 | _bit_T_1256 | _bit_T_1258 | _bit_T_1260 | _bit_T_1262 | _bit_T_1264 |
    _bit_T_1266 | _bit_T_1268 | _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 |
    _bit_T_1282 | _bit_T_1284 | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 |
    _bit_T_1298 | _bit_T_1300 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1316 | _bit_T_1318 | _bit_T_1324; // @[Decode.scala 15:30]
  wire  _bit_T_5383 = _bit_T_5353 | _bit_T_1326 | _bit_T_1332 | _bit_T_1334 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 |
    _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 |
    _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 |
    _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388; // @[Decode.scala 15:30]
  wire  _bit_T_5413 = _bit_T_5383 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 |
    _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 |
    _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 |
    _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448; // @[Decode.scala 15:30]
  wire  _bit_T_5443 = _bit_T_5413 | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 |
    _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 |
    _bit_T_1478 | _bit_T_1480 | _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 |
    _bit_T_1494 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508; // @[Decode.scala 15:30]
  wire  _bit_T_5473 = _bit_T_5443 | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 |
    _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 |
    _bit_T_1538 | _bit_T_1540 | _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 |
    _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568; // @[Decode.scala 15:30]
  wire  _bit_T_5503 = _bit_T_5473 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 |
    _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 |
    _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 |
    _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628; // @[Decode.scala 15:30]
  wire  _bit_T_5533 = _bit_T_5503 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 |
    _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 |
    _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 |
    _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1688; // @[Decode.scala 15:30]
  wire  _bit_T_5563 = _bit_T_5533 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696 | _bit_T_1698 | _bit_T_1700 |
    _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 | _bit_T_1710 | _bit_T_1712 | _bit_T_1714 | _bit_T_1716 |
    _bit_T_1718 | _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 |
    _bit_T_1734 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 | _bit_T_1742 | _bit_T_1744 | _bit_T_1746 | _bit_T_1748; // @[Decode.scala 15:30]
  wire  _bit_T_5593 = _bit_T_5563 | _bit_T_1750 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 |
    _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 |
    _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 |
    _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808; // @[Decode.scala 15:30]
  wire  bit_15 = _bit_T_5593 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 |
    _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_2034 | bit_30 | _bit_T_2048 |
    _bit_T_2088; // @[Decode.scala 15:30]
  wire [31:0] _T_832 = io_enq_uop_inst & 32'hdd000000; // @[Decode.scala 14:65]
  wire  _T_833 = _T_832 == 32'h1000000; // @[Decode.scala 14:121]
  wire [31:0] _T_834 = io_enq_uop_inst & 32'h71000100; // @[Decode.scala 14:65]
  wire  _T_835 = _T_834 == 32'h1000100; // @[Decode.scala 14:121]
  wire [31:0] _T_836 = io_enq_uop_inst & 32'hdc000100; // @[Decode.scala 14:65]
  wire  _T_837 = _T_836 == 32'h10000000; // @[Decode.scala 14:121]
  wire [31:0] _T_838 = io_enq_uop_inst & 32'hd9000000; // @[Decode.scala 14:65]
  wire  _T_839 = _T_838 == 32'h19000000; // @[Decode.scala 14:121]
  wire [31:0] _T_840 = io_enq_uop_inst & 32'hfc000000; // @[Decode.scala 14:65]
  wire  _T_841 = _T_840 == 32'h30000000; // @[Decode.scala 14:121]
  wire [31:0] _T_842 = io_enq_uop_inst & 32'h73000300; // @[Decode.scala 14:65]
  wire  _T_843 = _T_842 == 32'h62000000; // @[Decode.scala 14:121]
  wire [31:0] _T_844 = io_enq_uop_inst & 32'he0000320; // @[Decode.scala 14:65]
  wire  _T_845 = _T_844 == 32'he0000020; // @[Decode.scala 14:121]
  wire [31:0] _T_846 = io_enq_uop_inst & 32'he00002a0; // @[Decode.scala 14:65]
  wire  _T_847 = _T_846 == 32'he0000020; // @[Decode.scala 14:121]
  wire [31:0] _T_848 = io_enq_uop_inst & 32'he8000240; // @[Decode.scala 14:65]
  wire  _T_849 = _T_848 == 32'he0000040; // @[Decode.scala 14:121]
  wire [31:0] _T_860 = io_enq_uop_inst & 32'hdd000100; // @[Decode.scala 14:65]
  wire  _T_861 = _T_860 == 32'h1000000; // @[Decode.scala 14:121]
  wire [31:0] _T_862 = io_enq_uop_inst & 32'h740000c0; // @[Decode.scala 14:65]
  wire  _T_863 = _T_862 == 32'h40000c0; // @[Decode.scala 14:121]
  wire [31:0] _T_864 = io_enq_uop_inst & 32'h780000c0; // @[Decode.scala 14:65]
  wire  _T_865 = _T_864 == 32'h80000c0; // @[Decode.scala 14:121]
  wire [31:0] _T_866 = io_enq_uop_inst & 32'hdb000000; // @[Decode.scala 14:65]
  wire  _T_867 = _T_866 == 32'h19000000; // @[Decode.scala 14:121]
  wire [31:0] _T_868 = io_enq_uop_inst & 32'h7d000000; // @[Decode.scala 14:65]
  wire  _T_869 = _T_868 == 32'h21000000; // @[Decode.scala 14:121]
  wire [31:0] _T_870 = io_enq_uop_inst & 32'h3f000000; // @[Decode.scala 14:65]
  wire  _T_871 = _T_870 == 32'h23000000; // @[Decode.scala 14:121]
  wire [31:0] _T_872 = io_enq_uop_inst & 32'hb0000120; // @[Decode.scala 14:65]
  wire  _T_873 = _T_872 == 32'ha0000020; // @[Decode.scala 14:121]
  wire [31:0] _T_874 = io_enq_uop_inst & 32'hb00000a0; // @[Decode.scala 14:65]
  wire  _T_875 = _T_874 == 32'ha0000020; // @[Decode.scala 14:121]
  wire [31:0] _T_876 = io_enq_uop_inst & 32'ha8000040; // @[Decode.scala 14:65]
  wire  _T_877 = _T_876 == 32'ha0000040; // @[Decode.scala 14:121]
  wire [31:0] _T_890 = io_enq_uop_inst & 32'ha4000000; // @[Decode.scala 14:65]
  wire  hi_lo_12 = _T_890 == 32'h84000000; // @[Decode.scala 14:121]
  wire  _T_893 = hi_lo_12 | _T_587; // @[Decode.scala 15:30]
  wire  lo_16 = hi_lo_12 | _T_587 | _T_638; // @[Decode.scala 15:30]
  wire [1:0] hi_17 = {_T_893,hi_lo_12}; // @[Cat.scala 30:58]
  wire  _bit_T_5758 = _bit_T_5323 | _bit_T_1254 | _bit_T_1256 | _bit_T_1258 | _bit_T_1260 | _bit_T_1262 | _bit_T_1264 |
    _bit_T_1266 | _bit_T_1268 | _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 |
    _bit_T_1282 | _bit_T_1284 | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 |
    _bit_T_1298 | _bit_T_1300 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1308 | _bit_T_1310 | _bit_T_1336; // @[Decode.scala 15:30]
  wire  _bit_T_5788 = _bit_T_5758 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 |
    _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364 |
    _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 |
    _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396; // @[Decode.scala 15:30]
  wire  _bit_T_5818 = _bit_T_5788 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 |
    _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1424 |
    _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 |
    _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456; // @[Decode.scala 15:30]
  wire  _bit_T_5848 = _bit_T_5818 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 |
    _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 | _bit_T_1482 | _bit_T_1484 |
    _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 |
    _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516; // @[Decode.scala 15:30]
  wire  _bit_T_5878 = _bit_T_5848 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528 |
    _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540 | _bit_T_1542 | _bit_T_1544 |
    _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 |
    _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576; // @[Decode.scala 15:30]
  wire  _bit_T_5908 = _bit_T_5878 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 |
    _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 |
    _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 |
    _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636; // @[Decode.scala 15:30]
  wire  _bit_T_5938 = _bit_T_5908 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 |
    _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 |
    _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 |
    _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696; // @[Decode.scala 15:30]
  wire  _bit_T_5968 = _bit_T_5938 | _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 |
    _bit_T_1710 | _bit_T_1712 | _bit_T_1714 | _bit_T_1716 | _bit_T_1718 | _bit_T_1720 | _bit_T_1722 | _bit_T_1724 |
    _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 |
    _bit_T_1742 | _bit_T_1744 | _bit_T_1746 | _bit_T_1748 | _bit_T_1750 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756; // @[Decode.scala 15:30]
  wire  _bit_T_5998 = _bit_T_5968 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 |
    _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 |
    _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 |
    _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1816; // @[Decode.scala 15:30]
  wire  _bit_T_6028 = _bit_T_5998 | _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 |
    _bit_T_1830 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 |
    _bit_T_1846 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 |
    _bit_T_1862 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892; // @[Decode.scala 15:30]
  wire  _bit_T_6058 = _bit_T_6028 | _bit_T_1894 | _bit_T_1912 | _bit_T_1916 | _bit_T_1920 | _bit_T_1924 | _bit_T_1928 |
    _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 |
    _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 |
    _bit_T_1970 | _bit_T_1972 | _bit_T_1974 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984; // @[Decode.scala 15:30]
  wire  lo_17 = _bit_T_6058 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990; // @[Decode.scala 15:30]
  wire  _bit_T_6091 = _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 |
    _bit_T_1862 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892 |
    _bit_T_1894 | _bit_T_1912 | _bit_T_1916 | _bit_T_1920 | _bit_T_1924 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 |
    _bit_T_1934 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988; // @[Decode.scala 15:30]
  wire  hi_18 = _bit_T_6091 | _bit_T_1990; // @[Decode.scala 15:30]
  wire [31:0] _T_897 = io_enq_uop_inst & 32'h1000100; // @[Decode.scala 14:65]
  wire  _T_898 = _T_897 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_899 = io_enq_uop_inst & 32'h1000040; // @[Decode.scala 14:65]
  wire  _T_900 = _T_899 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_901 = io_enq_uop_inst & 32'h1000080; // @[Decode.scala 14:65]
  wire  _T_902 = _T_901 == 32'h80; // @[Decode.scala 14:121]
  wire [31:0] _T_903 = io_enq_uop_inst & 32'h21000000; // @[Decode.scala 14:65]
  wire  _T_904 = _T_903 == 32'h20000000; // @[Decode.scala 14:121]
  wire [31:0] _T_905 = io_enq_uop_inst & 32'h81000000; // @[Decode.scala 14:65]
  wire  _T_906 = _T_905 == 32'h80000000; // @[Decode.scala 14:121]
  wire  lo_lo_5 = _T_898 | _T_900 | _T_902 | _T_904 | _T_906; // @[Decode.scala 15:30]
  wire [31:0] _T_911 = io_enq_uop_inst & 32'ha00001c0; // @[Decode.scala 14:65]
  wire  hi_lo_13 = _T_911 == 32'h100; // @[Decode.scala 14:121]
  wire [1:0] lo_18 = {1'h0,lo_lo_5}; // @[Cat.scala 30:58]
  wire [2:0] hi_19 = {2'h0,hi_lo_13}; // @[Cat.scala 30:58]
  wire  _bit_T_6606 = _bit_T_2794 | _bit_T_1908 | _bit_T_1910 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 |
    _bit_T_1920 | _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_1976 | _bit_T_1978 | _bit_T_1984 | _bit_T_1986 |
    _bit_T_1992 | _bit_T_1994 | _bit_T_2000 | _bit_T_2002 | _bit_T_990 | _bit_T_992 | _bit_T_994 | _bit_T_996 |
    _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1006 | _bit_T_1008 | _bit_T_1010 | _bit_T_1012; // @[Decode.scala 15:30]
  wire  bit_17 = _bit_T_6606 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | _bit_T_2050 | _bit_T_2052 |
    _bit_T_2054 | _bit_T_2056 | _bit_T_2058 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2066 | _bit_T_2068 |
    _bit_T_2070 | _bit_T_2072 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080 | _bit_T_2082 | _bit_T_2084 |
    _bit_T_2086 | _bit_T_2088 | _bit_T_2090; // @[Decode.scala 15:30]
  wire  lo_19 = ~bit_17; // @[Decode.scala 40:35]
  wire  _bit_T_6661 = _bit_T_1069 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 |
    _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 |
    _bit_T_1908 | _bit_T_1910 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 |
    _bit_T_1932 | _bit_T_1934 | _bit_T_1936 | _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1976 | _bit_T_1978; // @[Decode.scala 15:30]
  wire  bit_18 = _bit_T_6661 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 |
    _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006; // @[Decode.scala 15:30]
  wire  hi_20 = ~bit_18; // @[Decode.scala 40:35]
  wire  _bit_T_6705 = _bit_T_1092 | _bit_T_1094 | _bit_T_1096 | _bit_T_1098 | _bit_T_1116 | _bit_T_1118 | _bit_T_1120 |
    _bit_T_1122 | _bit_T_1124 | _bit_T_1126 | _bit_T_1128 | _bit_T_1130 | _bit_T_1132 | _bit_T_1134 | _bit_T_1152 |
    _bit_T_1154 | _bit_T_1156 | _bit_T_1158 | _bit_T_1160 | _bit_T_1162 | _bit_T_1164 | _bit_T_1166 | _bit_T_1168 |
    _bit_T_1170 | _bit_T_1188 | _bit_T_1190 | _bit_T_1192 | _bit_T_1194 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200; // @[Decode.scala 15:30]
  wire  _bit_T_6735 = _bit_T_6705 | _bit_T_1202 | _bit_T_1204 | _bit_T_1206 | _bit_T_1224 | _bit_T_1226 | _bit_T_1228 |
    _bit_T_1230 | _bit_T_1232 | _bit_T_1234 | _bit_T_1236 | _bit_T_1238 | _bit_T_1240 | _bit_T_1242 | _bit_T_1260 |
    _bit_T_1262 | _bit_T_1264 | _bit_T_1266 | _bit_T_1268 | _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 |
    _bit_T_1278 | _bit_T_1296 | _bit_T_1298 | _bit_T_1300 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1336; // @[Decode.scala 15:30]
  wire  _bit_T_6765 = _bit_T_6735 | _bit_T_1338 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1364 |
    _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388 |
    _bit_T_1390 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1420 |
    _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444; // @[Decode.scala 15:30]
  wire  _bit_T_6795 = _bit_T_6765 | _bit_T_1446 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1472 |
    _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 | _bit_T_1486 | _bit_T_1488 | _bit_T_1494 | _bit_T_1496 |
    _bit_T_1498 | _bit_T_1504 | _bit_T_1506 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516 | _bit_T_1522 | _bit_T_1524 |
    _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1540 | _bit_T_1542 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552; // @[Decode.scala 15:30]
  wire  _bit_T_6825 = _bit_T_6795 | _bit_T_1558 | _bit_T_1560 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1576 |
    _bit_T_1578 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 | _bit_T_1594 | _bit_T_1596 | _bit_T_1602 | _bit_T_1604 |
    _bit_T_1606 | _bit_T_1612 | _bit_T_1614 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624 | _bit_T_1630 | _bit_T_1632 |
    _bit_T_1638 | _bit_T_1640 | _bit_T_1646 | _bit_T_1648 | _bit_T_1654 | _bit_T_1656 | _bit_T_1662 | _bit_T_1664; // @[Decode.scala 15:30]
  wire  lo_20 = _bit_T_6825 | _bit_T_1670 | _bit_T_1672 | _bit_T_1678 | _bit_T_1680 | _bit_T_1686 | _bit_T_1752 |
    _bit_T_1758 | _bit_T_1760 | _bit_T_1766 | _bit_T_1768 | _bit_T_1774 | _bit_T_1776 | _bit_T_1782 | _bit_T_1784 |
    _bit_T_1790 | _bit_T_1792 | _bit_T_1798 | _bit_T_1800 | _bit_T_1806 | _bit_T_1808 | _bit_T_1814; // @[Decode.scala 15:30]
  wire  _bit_T_6876 = _bit_T_1092 | _bit_T_1094 | _bit_T_1096 | _bit_T_1098 | _bit_T_1100 | _bit_T_1102 | _bit_T_1104 |
    _bit_T_1106 | _bit_T_1128 | _bit_T_1130 | _bit_T_1132 | _bit_T_1134 | _bit_T_1136 | _bit_T_1138 | _bit_T_1140 |
    _bit_T_1142 | _bit_T_1164 | _bit_T_1166 | _bit_T_1168 | _bit_T_1170 | _bit_T_1172 | _bit_T_1174 | _bit_T_1176 |
    _bit_T_1178 | _bit_T_1200 | _bit_T_1202 | _bit_T_1204 | _bit_T_1206 | _bit_T_1208 | _bit_T_1210 | _bit_T_1212; // @[Decode.scala 15:30]
  wire  _bit_T_6906 = _bit_T_6876 | _bit_T_1214 | _bit_T_1236 | _bit_T_1238 | _bit_T_1240 | _bit_T_1242 | _bit_T_1244 |
    _bit_T_1246 | _bit_T_1248 | _bit_T_1250 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 |
    _bit_T_1282 | _bit_T_1284 | _bit_T_1286 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1352 |
    _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1388; // @[Decode.scala 15:30]
  wire  _bit_T_6936 = _bit_T_6906 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 |
    _bit_T_1414 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 |
    _bit_T_1450 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1480 | _bit_T_1482 | _bit_T_1488 |
    _bit_T_1490 | _bit_T_1498 | _bit_T_1500 | _bit_T_1506 | _bit_T_1508 | _bit_T_1516 | _bit_T_1518 | _bit_T_1524; // @[Decode.scala 15:30]
  wire  _bit_T_6966 = _bit_T_6936 | _bit_T_1526 | _bit_T_1534 | _bit_T_1536 | _bit_T_1542 | _bit_T_1544 | _bit_T_1552 |
    _bit_T_1554 | _bit_T_1560 | _bit_T_1562 | _bit_T_1570 | _bit_T_1572 | _bit_T_1578 | _bit_T_1580 | _bit_T_1588 |
    _bit_T_1590 | _bit_T_1596 | _bit_T_1598 | _bit_T_1606 | _bit_T_1608 | _bit_T_1614 | _bit_T_1616 | _bit_T_1624 |
    _bit_T_1626 | _bit_T_1632 | _bit_T_1634 | _bit_T_1640 | _bit_T_1642 | _bit_T_1648 | _bit_T_1650 | _bit_T_1656; // @[Decode.scala 15:30]
  wire  hi_lo_14 = _bit_T_6966 | _bit_T_1658 | _bit_T_1664 | _bit_T_1666 | _bit_T_1672 | _bit_T_1674 | _bit_T_1680 |
    _bit_T_1682 | _bit_T_1752 | _bit_T_1754 | _bit_T_1760 | _bit_T_1762 | _bit_T_1768 | _bit_T_1770 | _bit_T_1776 |
    _bit_T_1778 | _bit_T_1784 | _bit_T_1786 | _bit_T_1792 | _bit_T_1794 | _bit_T_1800 | _bit_T_1802 | _bit_T_1808 |
    _bit_T_1810; // @[Decode.scala 15:30]
  wire  _bit_T_7019 = _bit_T_1092 | _bit_T_1094 | _bit_T_1096 | _bit_T_1098 | _bit_T_1100 | _bit_T_1102 | _bit_T_1104 |
    _bit_T_1106 | _bit_T_1108 | _bit_T_1110 | _bit_T_1112 | _bit_T_1114 | _bit_T_1116 | _bit_T_1118 | _bit_T_1120 |
    _bit_T_1122 | _bit_T_1124 | _bit_T_1126 | _bit_T_1128 | _bit_T_1130 | _bit_T_1132 | _bit_T_1134 | _bit_T_1136 |
    _bit_T_1138 | _bit_T_1140 | _bit_T_1142 | _bit_T_1144 | _bit_T_1146 | _bit_T_1148 | _bit_T_1150 | _bit_T_1152; // @[Decode.scala 15:30]
  wire  _bit_T_7049 = _bit_T_7019 | _bit_T_1154 | _bit_T_1156 | _bit_T_1158 | _bit_T_1160 | _bit_T_1162 | _bit_T_1164 |
    _bit_T_1166 | _bit_T_1168 | _bit_T_1170 | _bit_T_1172 | _bit_T_1174 | _bit_T_1176 | _bit_T_1178 | _bit_T_1180 |
    _bit_T_1182 | _bit_T_1184 | _bit_T_1186 | _bit_T_1188 | _bit_T_1190 | _bit_T_1192 | _bit_T_1194 | _bit_T_1196 |
    _bit_T_1198 | _bit_T_1200 | _bit_T_1202 | _bit_T_1204 | _bit_T_1206 | _bit_T_1208 | _bit_T_1210 | _bit_T_1212; // @[Decode.scala 15:30]
  wire  _bit_T_7079 = _bit_T_7049 | _bit_T_1214 | _bit_T_1216 | _bit_T_1218 | _bit_T_1220 | _bit_T_1222 | _bit_T_1224 |
    _bit_T_1226 | _bit_T_1228 | _bit_T_1230 | _bit_T_1232 | _bit_T_1234 | _bit_T_1236 | _bit_T_1238 | _bit_T_1240 |
    _bit_T_1242 | _bit_T_1244 | _bit_T_1246 | _bit_T_1248 | _bit_T_1250 | _bit_T_1252 | _bit_T_1254 | _bit_T_1256 |
    _bit_T_1258 | _bit_T_1260 | _bit_T_1262 | _bit_T_1264 | _bit_T_1266 | _bit_T_1268 | _bit_T_1270 | _bit_T_1272; // @[Decode.scala 15:30]
  wire  _bit_T_7109 = _bit_T_7079 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 | _bit_T_1282 | _bit_T_1284 |
    _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 | _bit_T_1298 | _bit_T_1300 |
    _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 |
    _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360; // @[Decode.scala 15:30]
  wire  _bit_T_7139 = _bit_T_7109 | _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 |
    _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388 |
    _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 |
    _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420; // @[Decode.scala 15:30]
  wire  _bit_T_7169 = _bit_T_7139 | _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 |
    _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 |
    _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 |
    _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480; // @[Decode.scala 15:30]
  wire  _bit_T_7199 = _bit_T_7169 | _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 |
    _bit_T_1494 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508 |
    _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1524 |
    _bit_T_1526 | _bit_T_1528 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540; // @[Decode.scala 15:30]
  wire  _bit_T_7229 = _bit_T_7199 | _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 |
    _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568 |
    _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 |
    _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600; // @[Decode.scala 15:30]
  wire  _bit_T_7259 = _bit_T_7229 | _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 |
    _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 |
    _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 |
    _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660; // @[Decode.scala 15:30]
  wire  _bit_T_7289 = _bit_T_7259 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 |
    _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1752 |
    _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 |
    _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784; // @[Decode.scala 15:30]
  wire  hi_hi_14 = _bit_T_7289 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 |
    _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 |
    _bit_T_1814; // @[Decode.scala 15:30]
  wire [1:0] hi_21 = {hi_hi_14,hi_lo_14}; // @[Cat.scala 30:58]
  wire  _bit_T_7364 = _bit_T_1051 | _bit_T_988 | _bit_T_1092 | _bit_T_1094 | _bit_T_1096 | _bit_T_1098 | _bit_T_1100 |
    _bit_T_1102 | _bit_T_1104 | _bit_T_1106 | _bit_T_1108 | _bit_T_1110 | _bit_T_1112 | _bit_T_1114 | _bit_T_1116 |
    _bit_T_1118 | _bit_T_1120 | _bit_T_1122 | _bit_T_1124 | _bit_T_1126 | _bit_T_1128 | _bit_T_1130 | _bit_T_1132 |
    _bit_T_1134 | _bit_T_1136 | _bit_T_1138 | _bit_T_1140 | _bit_T_1142 | _bit_T_1144 | _bit_T_1146 | _bit_T_1148; // @[Decode.scala 15:30]
  wire  _bit_T_7394 = _bit_T_7364 | _bit_T_1150 | _bit_T_1152 | _bit_T_1154 | _bit_T_1156 | _bit_T_1158 | _bit_T_1160 |
    _bit_T_1162 | _bit_T_1164 | _bit_T_1166 | _bit_T_1168 | _bit_T_1170 | _bit_T_1172 | _bit_T_1174 | _bit_T_1176 |
    _bit_T_1178 | _bit_T_1180 | _bit_T_1182 | _bit_T_1184 | _bit_T_1186 | _bit_T_1188 | _bit_T_1190 | _bit_T_1192 |
    _bit_T_1194 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200 | _bit_T_1202 | _bit_T_1204 | _bit_T_1206 | _bit_T_1208; // @[Decode.scala 15:30]
  wire  _bit_T_7424 = _bit_T_7394 | _bit_T_1210 | _bit_T_1212 | _bit_T_1214 | _bit_T_1216 | _bit_T_1218 | _bit_T_1220 |
    _bit_T_1222 | _bit_T_1224 | _bit_T_1226 | _bit_T_1228 | _bit_T_1230 | _bit_T_1232 | _bit_T_1234 | _bit_T_1236 |
    _bit_T_1238 | _bit_T_1240 | _bit_T_1242 | _bit_T_1244 | _bit_T_1246 | _bit_T_1248 | _bit_T_1250 | _bit_T_1252 |
    _bit_T_1254 | _bit_T_1256 | _bit_T_1258 | _bit_T_1260 | _bit_T_1262 | _bit_T_1264 | _bit_T_1266 | _bit_T_1268; // @[Decode.scala 15:30]
  wire  _bit_T_7454 = _bit_T_7424 | _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 |
    _bit_T_1282 | _bit_T_1284 | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 |
    _bit_T_1298 | _bit_T_1300 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1316 | _bit_T_1318 | _bit_T_1320 |
    _bit_T_1322 | _bit_T_1324 | _bit_T_1326 | _bit_T_1328 | _bit_T_1330 | _bit_T_1332 | _bit_T_1334 | _bit_T_1336; // @[Decode.scala 15:30]
  wire  _bit_T_7484 = _bit_T_7454 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 |
    _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364 |
    _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 |
    _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396; // @[Decode.scala 15:30]
  wire  _bit_T_7514 = _bit_T_7484 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 |
    _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1424 |
    _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 |
    _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456; // @[Decode.scala 15:30]
  wire  _bit_T_7544 = _bit_T_7514 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 |
    _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 | _bit_T_1482 | _bit_T_1484 |
    _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 |
    _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516; // @[Decode.scala 15:30]
  wire  _bit_T_7574 = _bit_T_7544 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528 |
    _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540 | _bit_T_1542 | _bit_T_1544 |
    _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 |
    _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576; // @[Decode.scala 15:30]
  wire  _bit_T_7604 = _bit_T_7574 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 |
    _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 |
    _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 |
    _bit_T_1622 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696 | _bit_T_1698 | _bit_T_1700; // @[Decode.scala 15:30]
  wire  _bit_T_7634 = _bit_T_7604 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 | _bit_T_1710 | _bit_T_1712 |
    _bit_T_1714 | _bit_T_1716 | _bit_T_1718 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 | _bit_T_1742 | _bit_T_1744 |
    _bit_T_1746 | _bit_T_1748 | _bit_T_1750 | _bit_T_1816 | _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824 |
    _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840; // @[Decode.scala 15:30]
  wire  _bit_T_7664 = _bit_T_7634 | _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 |
    _bit_T_1918 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 |
    _bit_T_1934 | _bit_T_1936 | _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 |
    _bit_T_1966 | _bit_T_1968 | _bit_T_1970 | _bit_T_1972 | _bit_T_1974 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996; // @[Decode.scala 15:30]
  wire  _bit_T_7694 = _bit_T_7664 | _bit_T_1998 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_990 |
    _bit_T_992 | _bit_T_994 | _bit_T_996 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1006 |
    _bit_T_1008 | _bit_T_1010 | _bit_T_1012 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | _bit_T_2034 |
    _bit_T_2058 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080; // @[Decode.scala 15:30]
  wire  bit_19 = _bit_T_7694 | _bit_T_2088; // @[Decode.scala 15:30]
  wire  lo_21 = ~bit_19; // @[Decode.scala 40:35]
  wire  _bit_T_7815 = _bit_T_7079 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 | _bit_T_1282 | _bit_T_1284 |
    _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 | _bit_T_1298 | _bit_T_1300 |
    _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1316 | _bit_T_1318 | _bit_T_1320 | _bit_T_1322 | _bit_T_1328 |
    _bit_T_1330 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348; // @[Decode.scala 15:30]
  wire  _bit_T_7845 = _bit_T_7815 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360 |
    _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 |
    _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 |
    _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408; // @[Decode.scala 15:30]
  wire  _bit_T_7875 = _bit_T_7845 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420 |
    _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 |
    _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 |
    _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468; // @[Decode.scala 15:30]
  wire  _bit_T_7905 = _bit_T_7875 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 |
    _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496 |
    _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512 |
    _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528; // @[Decode.scala 15:30]
  wire  _bit_T_7935 = _bit_T_7905 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540 |
    _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 |
    _bit_T_1558 | _bit_T_1560 | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 |
    _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588; // @[Decode.scala 15:30]
  wire  _bit_T_7965 = _bit_T_7935 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 |
    _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 |
    _bit_T_1618 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 |
    _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648; // @[Decode.scala 15:30]
  wire  _bit_T_7995 = _bit_T_7965 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 |
    _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 |
    _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 |
    _bit_T_1694 | _bit_T_1696 | _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708; // @[Decode.scala 15:30]
  wire  _bit_T_8025 = _bit_T_7995 | _bit_T_1710 | _bit_T_1712 | _bit_T_1714 | _bit_T_1716 | _bit_T_1718 | _bit_T_1720 |
    _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734 | _bit_T_1736 |
    _bit_T_1738 | _bit_T_1740 | _bit_T_1742 | _bit_T_1744 | _bit_T_1746 | _bit_T_1748 | _bit_T_1750 | _bit_T_1752 |
    _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768; // @[Decode.scala 15:30]
  wire  _bit_T_8055 = _bit_T_8025 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 |
    _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 |
    _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 |
    _bit_T_1814 | _bit_T_1816 | _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828; // @[Decode.scala 15:30]
  wire  _bit_T_8085 = _bit_T_8055 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840 |
    _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 |
    _bit_T_1858 | _bit_T_1860 | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 |
    _bit_T_1874 | _bit_T_1876 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888; // @[Decode.scala 15:30]
  wire  _bit_T_8115 = _bit_T_8085 | _bit_T_1890 | _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 |
    _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 |
    _bit_T_1918 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 |
    _bit_T_1934 | _bit_T_1936 | _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948; // @[Decode.scala 15:30]
  wire  _bit_T_8145 = _bit_T_8115 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1960 |
    _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 | _bit_T_1970 | _bit_T_1972 | _bit_T_1974 | _bit_T_1976 |
    _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 |
    _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_2034; // @[Decode.scala 15:30]
  wire  hi_lo_15 = _bit_T_8145 | bit_30 | _bit_T_2048 | _bit_T_2058 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 |
    _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080 | _bit_T_2088; // @[Decode.scala 15:30]
  wire  hi_hi_15 = _bit_T_1324 | _bit_T_1326 | _bit_T_1332 | _bit_T_1334; // @[Decode.scala 15:30]
  wire [2:0] _T_916 = {hi_hi_15,hi_lo_15,lo_21}; // @[Cat.scala 30:58]
  wire  _bit_T_8310 = _bit_T_2224 | _bit_T_1252 | _bit_T_1254 | _bit_T_1256 | _bit_T_1258 | _bit_T_1260 | _bit_T_1262 |
    _bit_T_1264 | _bit_T_1266 | _bit_T_1268 | _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 |
    _bit_T_1280 | _bit_T_1282 | _bit_T_1284 | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 |
    _bit_T_1296 | _bit_T_1298 | _bit_T_1300 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1312 | _bit_T_1314; // @[Decode.scala 15:30]
  wire  _bit_T_8340 = _bit_T_8310 | _bit_T_1316 | _bit_T_1318 | _bit_T_1320 | _bit_T_1322 | _bit_T_1324 | _bit_T_1326 |
    _bit_T_1328 | _bit_T_1330 | _bit_T_1332 | _bit_T_1334 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 |
    _bit_T_1344 | _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 |
    _bit_T_1360 | _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374; // @[Decode.scala 15:30]
  wire  _bit_T_8370 = _bit_T_8340 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 |
    _bit_T_1388 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 |
    _bit_T_1404 | _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 |
    _bit_T_1420 | _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434; // @[Decode.scala 15:30]
  wire  _bit_T_8400 = _bit_T_8370 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 |
    _bit_T_1448 | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 |
    _bit_T_1464 | _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 |
    _bit_T_1480 | _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494; // @[Decode.scala 15:30]
  wire  _bit_T_8430 = _bit_T_8400 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504 | _bit_T_1506 |
    _bit_T_1508 | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 |
    _bit_T_1524 | _bit_T_1526 | _bit_T_1528 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 |
    _bit_T_1540 | _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554; // @[Decode.scala 15:30]
  wire  _bit_T_8460 = _bit_T_8430 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 |
    _bit_T_1568 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 |
    _bit_T_1584 | _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 |
    _bit_T_1600 | _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614; // @[Decode.scala 15:30]
  wire  _bit_T_8490 = _bit_T_8460 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 |
    _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 |
    _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 |
    _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674; // @[Decode.scala 15:30]
  wire  _bit_T_8520 = _bit_T_8490 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 |
    _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696 | _bit_T_1698 | _bit_T_1700 | _bit_T_1702 |
    _bit_T_1704 | _bit_T_1706 | _bit_T_1708 | _bit_T_1710 | _bit_T_1712 | _bit_T_1714 | _bit_T_1716 | _bit_T_1718 |
    _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734; // @[Decode.scala 15:30]
  wire  _bit_T_8550 = _bit_T_8520 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 | _bit_T_1742 | _bit_T_1744 | _bit_T_1746 |
    _bit_T_1748 | _bit_T_1750 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 |
    _bit_T_1764 | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 |
    _bit_T_1780 | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794; // @[Decode.scala 15:30]
  wire  _bit_T_8580 = _bit_T_8550 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 |
    _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1816 | _bit_T_1818 | _bit_T_1820 | _bit_T_1822 |
    _bit_T_1824 | _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 |
    _bit_T_1840 | _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854; // @[Decode.scala 15:30]
  wire  _bit_T_8610 = _bit_T_8580 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 |
    _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 |
    _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 |
    _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | _bit_T_1912 | _bit_T_1914; // @[Decode.scala 15:30]
  wire  _bit_T_8640 = _bit_T_8610 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924 | _bit_T_1926 |
    _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936 | _bit_T_1938 | _bit_T_1940 | _bit_T_1942 |
    _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 |
    _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 | _bit_T_1970 | _bit_T_1972 | _bit_T_1974; // @[Decode.scala 15:30]
  wire  _bit_T_8670 = _bit_T_8640 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 | _bit_T_1986 |
    _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | _bit_T_2000 | _bit_T_2002 |
    _bit_T_2004 | _bit_T_2006 | _bit_T_990 | _bit_T_992 | _bit_T_998 | _bit_T_1000 | _bit_T_1006 | _bit_T_1008 |
    _bit_T_1014 | _bit_T_1016 | _bit_T_2050 | _bit_T_2052 | _bit_T_2058 | _bit_T_2060 | _bit_T_2066 | _bit_T_2068; // @[Decode.scala 15:30]
  wire  lo_lo_6 = _bit_T_8670 | _bit_T_2074 | _bit_T_2076; // @[Decode.scala 15:30]
  wire  _bit_T_8709 = _bit_T_1076 | _bit_T_1078 | _bit_T_1080 | _bit_T_1082 | _bit_T_1084 | _bit_T_1086 | _bit_T_1088 |
    _bit_T_1090 | _bit_T_1124 | _bit_T_1126 | _bit_T_1160 | _bit_T_1162 | _bit_T_1196 | _bit_T_1198 | _bit_T_1232 |
    _bit_T_1234 | _bit_T_1268 | _bit_T_1270 | _bit_T_1304 | _bit_T_1306 | _bit_T_1368 | _bit_T_1370 | _bit_T_1404 |
    _bit_T_1406 | _bit_T_1440 | _bit_T_1442 | _bit_T_1476 | _bit_T_1478 | _bit_T_1496 | _bit_T_1514 | _bit_T_1532; // @[Decode.scala 15:30]
  wire  hi_lo_16 = _bit_T_8709 | _bit_T_1550 | _bit_T_1568 | _bit_T_1586 | _bit_T_1604 | _bit_T_1622; // @[Decode.scala 15:30]
  wire [1:0] lo_22 = {_bit_T_5210,lo_lo_6}; // @[Cat.scala 30:58]
  wire [1:0] hi_23 = {1'h0,hi_lo_16}; // @[Cat.scala 30:58]
  wire  _bit_T_8774 = _bit_T_1051 | _bit_T_988 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696 |
    _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1816 | _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824 |
    _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_990 | _bit_T_994 | _bit_T_998 | _bit_T_1002 | _bit_T_1006 |
    _bit_T_1010 | _bit_T_1014 | _bit_T_1018 | _bit_T_2050 | _bit_T_2054 | _bit_T_2058 | _bit_T_2062 | _bit_T_2066; // @[Decode.scala 15:30]
  wire  lo_lo_7 = _bit_T_8774 | _bit_T_2070 | _bit_T_2074 | _bit_T_2078; // @[Decode.scala 15:30]
  wire  _bit_T_8808 = bit_8 | _bit_T_1076 | _bit_T_1078 | _bit_T_1080 | _bit_T_1082 | _bit_T_1084 | _bit_T_1086 |
    _bit_T_1088 | _bit_T_1090 | _bit_T_1096 | _bit_T_1098 | _bit_T_1104 | _bit_T_1106 | _bit_T_1112 | _bit_T_1114 |
    _bit_T_1120 | _bit_T_1122 | _bit_T_1132 | _bit_T_1134 | _bit_T_1140 | _bit_T_1142 | _bit_T_1148 | _bit_T_1150 |
    _bit_T_1156 | _bit_T_1158 | _bit_T_1168 | _bit_T_1170 | _bit_T_1176 | _bit_T_1178 | _bit_T_1184 | _bit_T_1186; // @[Decode.scala 15:30]
  wire  _bit_T_8838 = _bit_T_8808 | _bit_T_1192 | _bit_T_1194 | _bit_T_1204 | _bit_T_1206 | _bit_T_1212 | _bit_T_1214 |
    _bit_T_1220 | _bit_T_1222 | _bit_T_1228 | _bit_T_1230 | _bit_T_1240 | _bit_T_1242 | _bit_T_1248 | _bit_T_1250 |
    _bit_T_1256 | _bit_T_1258 | _bit_T_1264 | _bit_T_1266 | _bit_T_1276 | _bit_T_1278 | _bit_T_1284 | _bit_T_1286 |
    _bit_T_1292 | _bit_T_1294 | _bit_T_1300 | _bit_T_1302 | _bit_T_1308 | _bit_T_1310 | _bit_T_1312 | _bit_T_1314; // @[Decode.scala 15:30]
  wire  _bit_T_8868 = _bit_T_8838 | _bit_T_1316 | _bit_T_1318 | _bit_T_1320 | _bit_T_1322 | _bit_T_1324 | _bit_T_1326 |
    _bit_T_1328 | _bit_T_1330 | _bit_T_1332 | _bit_T_1334 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 |
    _bit_T_1360 | _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 |
    _bit_T_1396 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430; // @[Decode.scala 15:30]
  wire  _bit_T_8898 = _bit_T_8868 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1460 | _bit_T_1462 |
    _bit_T_1464 | _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1488 | _bit_T_1490 |
    _bit_T_1492 | _bit_T_1494 | _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512 | _bit_T_1524 | _bit_T_1526 |
    _bit_T_1528 | _bit_T_1530 | _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1560 | _bit_T_1562; // @[Decode.scala 15:30]
  wire  _bit_T_8928 = _bit_T_8898 | _bit_T_1564 | _bit_T_1566 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 |
    _bit_T_1596 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 |
    _bit_T_1704 | _bit_T_1706 | _bit_T_1708 | _bit_T_1710 | _bit_T_1712 | _bit_T_1714 | _bit_T_1716 | _bit_T_1718 |
    _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734; // @[Decode.scala 15:30]
  wire  _bit_T_8958 = _bit_T_8928 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 | _bit_T_1742 | _bit_T_1744 | _bit_T_1746 |
    _bit_T_1748 | _bit_T_1750 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840 | _bit_T_1842 |
    _bit_T_1844 | _bit_T_1846 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 |
    _bit_T_1876 | _bit_T_1878 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906; // @[Decode.scala 15:30]
  wire  _bit_T_8988 = _bit_T_8958 | _bit_T_1908 | _bit_T_1910 | _bit_T_1914 | _bit_T_1918 | _bit_T_1922 | _bit_T_1926 |
    _bit_T_1936 | _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 |
    _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 |
    _bit_T_1968 | _bit_T_1970 | _bit_T_1972 | _bit_T_1974 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998; // @[Decode.scala 15:30]
  wire  lo_hi_6 = _bit_T_8988 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006; // @[Decode.scala 15:30]
  wire  _bit_T_9052 = _bit_T_5233 | _bit_T_972 | _bit_T_974 | _bit_T_976 | _bit_T_978 | _bit_T_980 | _bit_T_982 |
    _bit_T_984 | _bit_T_986 | _bit_T_988 | _bit_T_1092 | _bit_T_1094 | _bit_T_1100 | _bit_T_1102 | _bit_T_1108 |
    _bit_T_1110 | _bit_T_1116 | _bit_T_1118 | _bit_T_1124 | _bit_T_1126 | _bit_T_1128 | _bit_T_1130 | _bit_T_1136 |
    _bit_T_1138 | _bit_T_1144 | _bit_T_1146 | _bit_T_1152 | _bit_T_1154 | _bit_T_1160 | _bit_T_1162 | _bit_T_1164; // @[Decode.scala 15:30]
  wire  _bit_T_9082 = _bit_T_9052 | _bit_T_1166 | _bit_T_1172 | _bit_T_1174 | _bit_T_1180 | _bit_T_1182 | _bit_T_1188 |
    _bit_T_1190 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200 | _bit_T_1202 | _bit_T_1208 | _bit_T_1210 | _bit_T_1216 |
    _bit_T_1218 | _bit_T_1224 | _bit_T_1226 | _bit_T_1232 | _bit_T_1234 | _bit_T_1236 | _bit_T_1238 | _bit_T_1244 |
    _bit_T_1246 | _bit_T_1252 | _bit_T_1254 | _bit_T_1260 | _bit_T_1262 | _bit_T_1268 | _bit_T_1270 | _bit_T_1272; // @[Decode.scala 15:30]
  wire  _bit_T_9112 = _bit_T_9082 | _bit_T_1274 | _bit_T_1280 | _bit_T_1282 | _bit_T_1288 | _bit_T_1290 | _bit_T_1296 |
    _bit_T_1298 | _bit_T_1304 | _bit_T_1306 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 |
    _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 |
    _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408; // @[Decode.scala 15:30]
  wire  _bit_T_9142 = _bit_T_9112 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420 |
    _bit_T_1422 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 |
    _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 | _bit_T_1482 | _bit_T_1484 |
    _bit_T_1486 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504 | _bit_T_1514 | _bit_T_1516; // @[Decode.scala 15:30]
  wire  _bit_T_9172 = _bit_T_9142 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 |
    _bit_T_1538 | _bit_T_1540 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1568 |
    _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 | _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 |
    _bit_T_1594 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1622 | _bit_T_1624; // @[Decode.scala 15:30]
  wire  _bit_T_9202 = _bit_T_9172 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 |
    _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 |
    _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 |
    _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684; // @[Decode.scala 15:30]
  wire  _bit_T_9232 = _bit_T_9202 | _bit_T_1686 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 |
    _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 |
    _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 |
    _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808; // @[Decode.scala 15:30]
  wire  hi_lo_17 = _bit_T_9232 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814; // @[Decode.scala 15:30]
  wire  _bit_T_9265 = _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696 | _bit_T_1698 | _bit_T_1700 |
    _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 | _bit_T_1710 | _bit_T_1720 | _bit_T_1722 | _bit_T_1724 |
    _bit_T_1726 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 | _bit_T_1742 | _bit_T_1816 | _bit_T_1818 | _bit_T_1820 |
    _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834 | _bit_T_1840; // @[Decode.scala 15:30]
  wire  hi_hi_16 = _bit_T_9265 | _bit_T_1842 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1960 |
    _bit_T_1962 | _bit_T_1964 | _bit_T_1966; // @[Decode.scala 15:30]
  wire [1:0] lo_23 = {lo_hi_6,lo_lo_7}; // @[Cat.scala 30:58]
  wire [1:0] hi_24 = {hi_hi_16,hi_lo_17}; // @[Cat.scala 30:58]
  wire  _bit_T_9574 = _bit_T_7574 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 |
    _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 |
    _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 |
    _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636; // @[Decode.scala 15:30]
  wire  _bit_T_9604 = _bit_T_9574 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 |
    _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 |
    _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 |
    _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696; // @[Decode.scala 15:30]
  wire  _bit_T_9634 = _bit_T_9604 | _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 |
    _bit_T_1710 | _bit_T_1712 | _bit_T_1714 | _bit_T_1716 | _bit_T_1718 | _bit_T_1720 | _bit_T_1736 | _bit_T_1722 |
    _bit_T_1738 | _bit_T_1724 | _bit_T_1740 | _bit_T_1726 | _bit_T_1742 | _bit_T_1728 | _bit_T_1744 | _bit_T_1730 |
    _bit_T_1746 | _bit_T_1732 | _bit_T_1748 | _bit_T_1734 | _bit_T_1750 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756; // @[Decode.scala 15:30]
  wire  _bit_T_9664 = _bit_T_9634 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 |
    _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 |
    _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 |
    _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1816; // @[Decode.scala 15:30]
  wire  _bit_T_9694 = _bit_T_9664 | _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 |
    _bit_T_1830 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 |
    _bit_T_1846 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 |
    _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876; // @[Decode.scala 15:30]
  wire  _bit_T_9724 = _bit_T_9694 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 |
    _bit_T_1890 | _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 |
    _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 |
    _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936; // @[Decode.scala 15:30]
  wire  _bit_T_9754 = _bit_T_9724 | _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 |
    _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 |
    _bit_T_1966 | _bit_T_1968 | _bit_T_1970 | _bit_T_1972 | _bit_T_1974 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 |
    _bit_T_1982 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996; // @[Decode.scala 15:30]
  wire  bit_20 = _bit_T_9754 | _bit_T_1998 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_998 |
    _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | bit_30 |
    _bit_T_2048 | _bit_T_2058 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 |
    _bit_T_2080 | _bit_T_2088 | _bit_T_2034; // @[Decode.scala 15:30]
  wire  _T_920 = _T_764 == 32'h0; // @[Decode.scala 14:121]
  wire  _T_922 = _T_752 == 32'h8000100; // @[Decode.scala 14:121]
  wire [31:0] _T_923 = io_enq_uop_inst & 32'hb1000100; // @[Decode.scala 14:65]
  wire  _T_924 = _T_923 == 32'h11000100; // @[Decode.scala 14:121]
  wire [31:0] _T_925 = io_enq_uop_inst & 32'hda000000; // @[Decode.scala 14:65]
  wire  _T_926 = _T_925 == 32'h12000000; // @[Decode.scala 14:121]
  wire [31:0] _T_927 = io_enq_uop_inst & 32'h5e000000; // @[Decode.scala 14:65]
  wire  _T_928 = _T_927 == 32'h1c000000; // @[Decode.scala 14:121]
  wire [31:0] _T_929 = io_enq_uop_inst & 32'h66000000; // @[Decode.scala 14:65]
  wire  _T_930 = _T_929 == 32'h22000000; // @[Decode.scala 14:121]
  wire [31:0] _T_931 = io_enq_uop_inst & 32'hf8000100; // @[Decode.scala 14:65]
  wire  _T_932 = _T_931 == 32'h58000000; // @[Decode.scala 14:121]
  wire [31:0] _T_933 = io_enq_uop_inst & 32'hf8000000; // @[Decode.scala 14:65]
  wire  _T_934 = _T_933 == 32'h68000000; // @[Decode.scala 14:121]
  wire [31:0] _T_935 = io_enq_uop_inst & 32'h71000000; // @[Decode.scala 14:65]
  wire  _T_936 = _T_935 == 32'h71000000; // @[Decode.scala 14:121]
  wire [31:0] _T_937 = io_enq_uop_inst & 32'hc1000000; // @[Decode.scala 14:65]
  wire  _T_938 = _T_937 == 32'h81000000; // @[Decode.scala 14:121]
  wire [31:0] _T_939 = io_enq_uop_inst & 32'hd6000000; // @[Decode.scala 14:65]
  wire  _T_940 = _T_939 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_941 = io_enq_uop_inst & 32'hc6000100; // @[Decode.scala 14:65]
  wire  _T_942 = _T_941 == 32'h2000000; // @[Decode.scala 14:121]
  wire  lo_lo_8 = _T_920 | _T_922 | _T_924 | _T_926 | _T_928 | _T_930 | _T_932 | _T_934 | _T_936 | _T_938 | _T_940 |
    _T_942; // @[Decode.scala 15:30]
  wire  _T_955 = _T_621 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_956 = io_enq_uop_inst & 32'h68000100; // @[Decode.scala 14:65]
  wire  _T_957 = _T_956 == 32'h100; // @[Decode.scala 14:121]
  wire [31:0] _T_958 = io_enq_uop_inst & 32'h9c000100; // @[Decode.scala 14:65]
  wire  _T_959 = _T_958 == 32'h8000000; // @[Decode.scala 14:121]
  wire  _T_961 = _T_923 == 32'h10000100; // @[Decode.scala 14:121]
  wire [31:0] _T_962 = io_enq_uop_inst & 32'h56000000; // @[Decode.scala 14:65]
  wire  _T_963 = _T_962 == 32'h16000000; // @[Decode.scala 14:121]
  wire [31:0] _T_964 = io_enq_uop_inst & 32'h5c000000; // @[Decode.scala 14:65]
  wire  _T_965 = _T_964 == 32'h1c000000; // @[Decode.scala 14:121]
  wire [31:0] _T_966 = io_enq_uop_inst & 32'hbc000000; // @[Decode.scala 14:65]
  wire  _T_967 = _T_966 == 32'h28000000; // @[Decode.scala 14:121]
  wire [31:0] _T_968 = io_enq_uop_inst & 32'hf0000100; // @[Decode.scala 14:65]
  wire  _T_969 = _T_968 == 32'h40000000; // @[Decode.scala 14:121]
  wire [31:0] _T_970 = io_enq_uop_inst & 32'he8000100; // @[Decode.scala 14:65]
  wire  _T_971 = _T_970 == 32'h48000000; // @[Decode.scala 14:121]
  wire  _T_973 = _T_584 == 32'h48000000; // @[Decode.scala 14:121]
  wire  _T_975 = _T_935 == 32'h70000000; // @[Decode.scala 14:121]
  wire  _T_977 = _T_937 == 32'h80000000; // @[Decode.scala 14:121]
  wire  lo_hi_lo_4 = _T_955 | _T_957 | _T_959 | _T_961 | _T_963 | _T_965 | _T_967 | _T_969 | _T_971 | _T_973 | _T_975 |
    _T_977 | _T_940; // @[Decode.scala 15:30]
  wire  _T_991 = _T_784 == 32'h100; // @[Decode.scala 14:121]
  wire [31:0] _T_992 = io_enq_uop_inst & 32'hc6000000; // @[Decode.scala 14:65]
  wire  _T_993 = _T_992 == 32'h2000000; // @[Decode.scala 14:121]
  wire  _T_995 = _T_716 == 32'h40000000; // @[Decode.scala 14:121]
  wire  _T_997 = _T_956 == 32'h48000000; // @[Decode.scala 14:121]
  wire  _T_999 = _T_726 == 32'hc0000000; // @[Decode.scala 14:121]
  wire  lo_hi_hi_4 = _T_991 | _T_993 | _T_765 | _T_926 | _T_995 | _T_973 | _T_997 | _T_804 | _T_999; // @[Decode.scala 15:30]
  wire  _T_1009 = _T_927 == 32'h16000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1010 = io_enq_uop_inst & 32'h3c000000; // @[Decode.scala 14:65]
  wire  _T_1011 = _T_1010 == 32'h28000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1012 = io_enq_uop_inst & 32'h6e000000; // @[Decode.scala 14:65]
  wire  _T_1013 = _T_1012 == 32'h2a000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1014 = io_enq_uop_inst & 32'h58000000; // @[Decode.scala 14:65]
  wire  _T_1015 = _T_1014 == 32'h48000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1016 = io_enq_uop_inst & 32'hc0000000; // @[Decode.scala 14:65]
  wire  _T_1017 = _T_1016 == 32'hc0000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1018 = io_enq_uop_inst & 32'hce000100; // @[Decode.scala 14:65]
  wire  _T_1019 = _T_1018 == 32'ha000000; // @[Decode.scala 14:121]
  wire  hi_lo_lo_3 = _T_957 | _T_959 | _T_1009 | _T_1011 | _T_1013 | _T_995 | _T_997 | _T_1015 | _T_1017 | _T_1019; // @[Decode.scala 15:30]
  wire [31:0] _T_1029 = io_enq_uop_inst & 32'hcc000100; // @[Decode.scala 14:65]
  wire  _T_1030 = _T_1029 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_1031 = io_enq_uop_inst & 32'h1a000100; // @[Decode.scala 14:65]
  wire  _T_1032 = _T_1031 == 32'h100; // @[Decode.scala 14:121]
  wire  _T_1034 = _T_956 == 32'h8000100; // @[Decode.scala 14:121]
  wire [31:0] _T_1035 = io_enq_uop_inst & 32'h4c000000; // @[Decode.scala 14:65]
  wire  _T_1036 = _T_1035 == 32'hc000000; // @[Decode.scala 14:121]
  wire  _T_1038 = _T_766 == 32'h10000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1039 = io_enq_uop_inst & 32'hb8000000; // @[Decode.scala 14:65]
  wire  _T_1040 = _T_1039 == 32'h20000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1041 = io_enq_uop_inst & 32'h6c000000; // @[Decode.scala 14:65]
  wire  _T_1042 = _T_1041 == 32'h20000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1043 = io_enq_uop_inst & 32'h78000100; // @[Decode.scala 14:65]
  wire  _T_1044 = _T_1043 == 32'h50000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1045 = io_enq_uop_inst & 32'h54000000; // @[Decode.scala 14:65]
  wire  _T_1046 = _T_1045 == 32'h4000000; // @[Decode.scala 14:121]
  wire  hi_lo_hi_4 = _T_1030 | _T_1032 | _T_1034 | _T_1036 | _T_1038 | _T_1040 | _T_1042 | _T_1044 | _T_804 | _T_1046; // @[Decode.scala 15:30]
  wire  _T_1057 = _T_925 == 32'h1a000000; // @[Decode.scala 14:121]
  wire  hi_hi_lo_5 = _T_1034 | _T_1057 | _T_965 | _T_995 | _T_1017; // @[Decode.scala 15:30]
  wire [31:0] _T_1062 = io_enq_uop_inst & 32'h6c000100; // @[Decode.scala 14:65]
  wire  _T_1063 = _T_1062 == 32'h8000100; // @[Decode.scala 14:121]
  wire [31:0] _T_1064 = io_enq_uop_inst & 32'h6a000100; // @[Decode.scala 14:65]
  wire  _T_1065 = _T_1064 == 32'ha000100; // @[Decode.scala 14:121]
  wire  hi_hi_hi_5 = _T_1063 | _T_1065 | _T_1057 | _T_965 | _T_995 | _T_804 | _T_999; // @[Decode.scala 15:30]
  wire [2:0] lo_24 = {lo_hi_hi_4,lo_hi_lo_4,lo_lo_8}; // @[Cat.scala 30:58]
  wire [3:0] hi_25 = {hi_hi_hi_5,hi_hi_lo_5,hi_lo_hi_4,hi_lo_lo_3}; // @[Cat.scala 30:58]
  wire  _bit_T_9839 = _bit_T_1051 | _bit_T_988 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696 |
    _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 | _bit_T_1710 | _bit_T_1712 |
    _bit_T_1714 | _bit_T_1716 | _bit_T_1718 | _bit_T_1720 | _bit_T_1736 | _bit_T_1722 | _bit_T_1738 | _bit_T_1724 |
    _bit_T_1740 | _bit_T_1726 | _bit_T_1742 | _bit_T_1728 | _bit_T_1744 | _bit_T_1730 | _bit_T_1746 | _bit_T_1732; // @[Decode.scala 15:30]
  wire  _bit_T_9842 = _bit_T_9839 | _bit_T_1748 | _bit_T_1734 | _bit_T_1750; // @[Decode.scala 15:30]
  wire  _bit_T_9869 = _bit_T_9839 | _bit_T_1748 | _bit_T_1734 | _bit_T_1750 | _bit_T_1816 | _bit_T_1818 | _bit_T_1820 |
    _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 |
    _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 |
    _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964; // @[Decode.scala 15:30]
  wire  bit_21 = _bit_T_9869 | _bit_T_1966 | _bit_T_1968 | _bit_T_1970 | _bit_T_1972 | _bit_T_1974; // @[Decode.scala 15:30]
  wire  lo_25 = ~bit_21; // @[Decode.scala 40:35]
  wire [1:0] hi_26 = {1'h0,bit_21}; // @[Cat.scala 30:58]
  wire [31:0] _T_1074 = io_enq_uop_inst & 32'ha0000100; // @[Decode.scala 14:65]
  wire  _T_1075 = _T_1074 == 32'h0; // @[Decode.scala 14:121]
  wire  _T_1077 = _T_662 == 32'h2000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1078 = io_enq_uop_inst & 32'h50000000; // @[Decode.scala 14:65]
  wire  _T_1079 = _T_1078 == 32'h40000000; // @[Decode.scala 14:121]
  wire  lo_lo_lo_2 = _T_1075 | _T_1077 | _T_751 | _T_1079 | _T_1017; // @[Decode.scala 15:30]
  wire  _T_1085 = _T_625 == 32'h10000100; // @[Decode.scala 14:121]
  wire [31:0] _T_1086 = io_enq_uop_inst & 32'h70000000; // @[Decode.scala 14:65]
  wire  _T_1087 = _T_1086 == 32'h70000000; // @[Decode.scala 14:121]
  wire  _T_1089 = _T_1016 == 32'h80000000; // @[Decode.scala 14:121]
  wire  lo_hi_lo_5 = _T_1085 | _T_1087 | _T_1089; // @[Decode.scala 15:30]
  wire [31:0] _T_1092 = io_enq_uop_inst & 32'h62000100; // @[Decode.scala 14:65]
  wire  lo_hi_hi_lo_2 = _T_1092 == 32'h100; // @[Decode.scala 14:121]
  wire [4:0] lo_26 = {1'h0,lo_hi_hi_lo_2,lo_hi_lo_5,1'h0,lo_lo_lo_2}; // @[Cat.scala 30:58]
  wire  _bit_T_9999 = _bit_T_926 | _bit_T_928 | _bit_T_930 | _bit_T_932 | _bit_T_934 | _bit_T_936 | _bit_T_938 |
    _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 | _bit_T_948 | _bit_T_950 | _bit_T_952 | _bit_T_954 | _bit_T_956
     | _bit_T_1092 | _bit_T_1094 | _bit_T_1096 | _bit_T_1098 | _bit_T_1100 | _bit_T_1102 | _bit_T_1104 | _bit_T_1106 |
    _bit_T_1108 | _bit_T_1110 | _bit_T_1112 | _bit_T_1114 | _bit_T_1116 | _bit_T_1118 | _bit_T_1120; // @[Decode.scala 15:30]
  wire  _bit_T_10029 = _bit_T_9999 | _bit_T_1122 | _bit_T_1124 | _bit_T_1126 | _bit_T_1128 | _bit_T_1130 | _bit_T_1132
     | _bit_T_1134 | _bit_T_1136 | _bit_T_1138 | _bit_T_1140 | _bit_T_1142 | _bit_T_1144 | _bit_T_1146 | _bit_T_1148 |
    _bit_T_1150 | _bit_T_1152 | _bit_T_1154 | _bit_T_1156 | _bit_T_1158 | _bit_T_1160 | _bit_T_1162 | _bit_T_1164 |
    _bit_T_1166 | _bit_T_1168 | _bit_T_1170 | _bit_T_1172 | _bit_T_1174 | _bit_T_1176 | _bit_T_1178 | _bit_T_1180; // @[Decode.scala 15:30]
  wire  _bit_T_10059 = _bit_T_10029 | _bit_T_1182 | _bit_T_1184 | _bit_T_1186 | _bit_T_1188 | _bit_T_1190 | _bit_T_1192
     | _bit_T_1194 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200 | _bit_T_1202 | _bit_T_1204 | _bit_T_1206 | _bit_T_1208 |
    _bit_T_1210 | _bit_T_1212 | _bit_T_1214 | _bit_T_1216 | _bit_T_1218 | _bit_T_1220 | _bit_T_1222 | _bit_T_1224 |
    _bit_T_1226 | _bit_T_1228 | _bit_T_1230 | _bit_T_1232 | _bit_T_1234 | _bit_T_1236 | _bit_T_1238 | _bit_T_1240; // @[Decode.scala 15:30]
  wire  _bit_T_10089 = _bit_T_10059 | _bit_T_1242 | _bit_T_1244 | _bit_T_1246 | _bit_T_1248 | _bit_T_1250 | _bit_T_1252
     | _bit_T_1254 | _bit_T_1256 | _bit_T_1258 | _bit_T_1260 | _bit_T_1262 | _bit_T_1264 | _bit_T_1266 | _bit_T_1268 |
    _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 | _bit_T_1282 | _bit_T_1284 |
    _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 | _bit_T_1298 | _bit_T_1300; // @[Decode.scala 15:30]
  wire  _bit_T_10119 = _bit_T_10089 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1316 | _bit_T_1318 | _bit_T_1320
     | _bit_T_1322 | _bit_T_1328 | _bit_T_1330 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 |
    _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360 |
    _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376; // @[Decode.scala 15:30]
  wire  _bit_T_10149 = _bit_T_10119 | _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388
     | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 |
    _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420 |
    _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436; // @[Decode.scala 15:30]
  wire  _bit_T_10179 = _bit_T_10149 | _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448
     | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 |
    _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 |
    _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496; // @[Decode.scala 15:30]
  wire  _bit_T_10209 = _bit_T_10179 | _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508
     | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1524 |
    _bit_T_1526 | _bit_T_1528 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540 |
    _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1688 | _bit_T_1692 | _bit_T_1696; // @[Decode.scala 15:30]
  wire  _bit_T_10239 = _bit_T_10209 | _bit_T_1700 | _bit_T_1704 | _bit_T_1708 | _bit_T_1712 | _bit_T_1716 | _bit_T_1720
     | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734 | _bit_T_1752 |
    _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 |
    _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784; // @[Decode.scala 15:30]
  wire  _bit_T_10269 = _bit_T_10239 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796
     | _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 |
    _bit_T_1814 | _bit_T_1816 | _bit_T_1820 | _bit_T_1824 | _bit_T_1828 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 |
    _bit_T_1838 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924; // @[Decode.scala 15:30]
  wire  _bit_T_10299 = _bit_T_10269 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936
     | _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 |
    _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 |
    _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | _bit_T_2000; // @[Decode.scala 15:30]
  wire  lo_27 = _bit_T_10299 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 |
    _bit_T_1004 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | bit_30 | _bit_T_2048 | _bit_T_2058 |
    _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080 | _bit_T_2088 |
    _bit_T_2034; // @[Decode.scala 15:30]
  wire  _bit_T_10352 = _bit_T_926 | _bit_T_928 | _bit_T_930 | _bit_T_932 | _bit_T_934 | _bit_T_936 | _bit_T_938 |
    _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 | _bit_T_948 | _bit_T_950 | _bit_T_952 | _bit_T_954 | _bit_T_956
     | _bit_T_1324 | _bit_T_1326 | _bit_T_1332 | _bit_T_1334 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 |
    _bit_T_1560 | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572; // @[Decode.scala 15:30]
  wire  _bit_T_10382 = _bit_T_10352 | _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584
     | _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 |
    _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 |
    _bit_T_1618 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632; // @[Decode.scala 15:30]
  wire  _bit_T_10412 = _bit_T_10382 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644
     | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 |
    _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 |
    _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756; // @[Decode.scala 15:30]
  wire  _bit_T_10442 = _bit_T_10412 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768
     | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 |
    _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 |
    _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1848; // @[Decode.scala 15:30]
  wire  _bit_T_10472 = _bit_T_10442 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860
     | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876 |
    _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892 |
    _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908; // @[Decode.scala 15:30]
  wire  _bit_T_10502 = _bit_T_10472 | _bit_T_1910 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920
     | _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936 |
    _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 |
    _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | _bit_T_2000; // @[Decode.scala 15:30]
  wire  hi_lo_21 = _bit_T_10502 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 |
    _bit_T_1004 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | _bit_T_2058 | _bit_T_2060 | _bit_T_2062 |
    _bit_T_2064 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080; // @[Decode.scala 15:30]
  wire  hi_hi_19 = _bit_T_1320 | _bit_T_1322 | _bit_T_1328 | _bit_T_1330; // @[Decode.scala 15:30]
  wire [1:0] hi_28 = {hi_hi_19,hi_lo_21}; // @[Cat.scala 30:58]
  wire  _bit_T_10644 = _bit_T_7079 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 | _bit_T_1282 | _bit_T_1284
     | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 | _bit_T_1298 | _bit_T_1300 |
    _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1316 | _bit_T_1318 | _bit_T_1324 | _bit_T_1326 | _bit_T_1332 |
    _bit_T_1334 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348; // @[Decode.scala 15:30]
  wire  _bit_T_10674 = _bit_T_10644 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360
     | _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 |
    _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 |
    _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408; // @[Decode.scala 15:30]
  wire  _bit_T_10704 = _bit_T_10674 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420
     | _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 |
    _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 |
    _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468; // @[Decode.scala 15:30]
  wire  _bit_T_10734 = _bit_T_10704 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480
     | _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496 |
    _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512 |
    _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528; // @[Decode.scala 15:30]
  wire  _bit_T_10764 = _bit_T_10734 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540
     | _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 |
    _bit_T_1558 | _bit_T_1560 | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 |
    _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588; // @[Decode.scala 15:30]
  wire  _bit_T_10794 = _bit_T_10764 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600
     | _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 |
    _bit_T_1618 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 |
    _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648; // @[Decode.scala 15:30]
  wire  _bit_T_10824 = _bit_T_10794 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660
     | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 |
    _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 |
    _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772; // @[Decode.scala 15:30]
  wire  _bit_T_10854 = _bit_T_10824 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784
     | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 |
    _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1816 |
    _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1832; // @[Decode.scala 15:30]
  wire  _bit_T_10884 = _bit_T_10854 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844
     | _bit_T_1846 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924 |
    _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936 | _bit_T_1938 | _bit_T_1940 |
    _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956; // @[Decode.scala 15:30]
  wire  _bit_T_10914 = _bit_T_10884 | _bit_T_1958 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968
     | _bit_T_1970 | _bit_T_1972 | _bit_T_1974 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 |
    _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | _bit_T_2000 |
    _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1014; // @[Decode.scala 15:30]
  wire  lo_28 = _bit_T_10914 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | bit_30 | _bit_T_2048 | _bit_T_2058 |
    _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080 | _bit_T_2088 |
    _bit_T_2034; // @[Decode.scala 15:30]
  wire  _bit_T_11079 = _bit_T_7424 | _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280
     | _bit_T_1282 | _bit_T_1284 | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 |
    _bit_T_1298 | _bit_T_1300 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 |
    _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356; // @[Decode.scala 15:30]
  wire  _bit_T_11109 = _bit_T_11079 | _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368
     | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 |
    _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 |
    _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416; // @[Decode.scala 15:30]
  wire  _bit_T_11139 = _bit_T_11109 | _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428
     | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 |
    _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 |
    _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476; // @[Decode.scala 15:30]
  wire  _bit_T_11169 = _bit_T_11139 | _bit_T_1478 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560
     | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 |
    _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 |
    _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608; // @[Decode.scala 15:30]
  wire  _bit_T_11199 = _bit_T_11169 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620
     | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 |
    _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 |
    _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668; // @[Decode.scala 15:30]
  wire  _bit_T_11229 = _bit_T_11199 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680
     | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696 |
    _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708 | _bit_T_1710 | _bit_T_1712 |
    _bit_T_1714 | _bit_T_1716 | _bit_T_1718 | _bit_T_1720 | _bit_T_1736 | _bit_T_1722 | _bit_T_1738 | _bit_T_1724; // @[Decode.scala 15:30]
  wire  _bit_T_11259 = _bit_T_11229 | _bit_T_1740 | _bit_T_1726 | _bit_T_1742 | _bit_T_1728 | _bit_T_1744 | _bit_T_1730
     | _bit_T_1746 | _bit_T_1732 | _bit_T_1748 | _bit_T_1734 | _bit_T_1750 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 |
    _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 |
    _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788; // @[Decode.scala 15:30]
  wire  _bit_T_11289 = _bit_T_11259 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800
     | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1816 |
    _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1832 |
    _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_1912; // @[Decode.scala 15:30]
  wire  _bit_T_11319 = _bit_T_11289 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924
     | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936 | _bit_T_1938 | _bit_T_1940 |
    _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 |
    _bit_T_1958 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 | _bit_T_1970 | _bit_T_1972; // @[Decode.scala 15:30]
  wire  _bit_T_11349 = _bit_T_11319 | _bit_T_1974 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984
     | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | _bit_T_2000 |
    _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1014 |
    _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | _bit_T_2058 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2074; // @[Decode.scala 15:30]
  wire  hi_lo_22 = _bit_T_11349 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080; // @[Decode.scala 15:30]
  wire  _bit_T_11382 = _bit_T_1316 | _bit_T_1318 | _bit_T_1320 | _bit_T_1322 | _bit_T_1324 | _bit_T_1326 | _bit_T_1328
     | _bit_T_1330 | _bit_T_1332 | _bit_T_1334 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 |
    _bit_T_1858 | _bit_T_1860 | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 |
    _bit_T_1874 | _bit_T_1876 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888; // @[Decode.scala 15:30]
  wire  hi_hi_20 = _bit_T_11382 | _bit_T_1890 | _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 |
    _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908 | _bit_T_1910; // @[Decode.scala 15:30]
  wire [1:0] hi_29 = {hi_hi_20,hi_lo_22}; // @[Cat.scala 30:58]
  wire  _bit_T_11423 = _bit_T_958 | _bit_T_960 | _bit_T_962 | _bit_T_964 | _bit_T_966 | _bit_T_968 | _bit_T_970 |
    _bit_T_972 | _bit_T_974 | _bit_T_976 | _bit_T_978 | _bit_T_980 | _bit_T_982 | _bit_T_984 | _bit_T_986 | _bit_T_988
     | _bit_T_1320 | _bit_T_1322 | _bit_T_1324 | _bit_T_1326 | _bit_T_1328 | _bit_T_1330 | _bit_T_1332 | _bit_T_1334 |
    _bit_T_1690 | _bit_T_1694 | _bit_T_1698 | _bit_T_1702 | _bit_T_1706 | _bit_T_1710 | _bit_T_1714; // @[Decode.scala 15:30]
  wire  lo_29 = _bit_T_11423 | _bit_T_1718 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740 | _bit_T_1742 | _bit_T_1744 |
    _bit_T_1746 | _bit_T_1748 | _bit_T_1750 | _bit_T_1818 | _bit_T_1822 | _bit_T_1826 | _bit_T_1830 | _bit_T_1840 |
    _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 |
    _bit_T_1970 | _bit_T_1972 | _bit_T_1974; // @[Decode.scala 15:30]
  wire  _bit_T_11478 = _bit_T_958 | _bit_T_960 | _bit_T_962 | _bit_T_964 | _bit_T_966 | _bit_T_968 | _bit_T_970 |
    _bit_T_972 | _bit_T_974 | _bit_T_976 | _bit_T_978 | _bit_T_980 | _bit_T_982 | _bit_T_984 | _bit_T_986 | _bit_T_988
     | _bit_T_1092 | _bit_T_1094 | _bit_T_1096 | _bit_T_1098 | _bit_T_1100 | _bit_T_1102 | _bit_T_1104 | _bit_T_1106 |
    _bit_T_1108 | _bit_T_1110 | _bit_T_1112 | _bit_T_1114 | _bit_T_1116 | _bit_T_1118 | _bit_T_1120; // @[Decode.scala 15:30]
  wire  _bit_T_11508 = _bit_T_11478 | _bit_T_1122 | _bit_T_1124 | _bit_T_1126 | _bit_T_1128 | _bit_T_1130 | _bit_T_1132
     | _bit_T_1134 | _bit_T_1136 | _bit_T_1138 | _bit_T_1140 | _bit_T_1142 | _bit_T_1144 | _bit_T_1146 | _bit_T_1148 |
    _bit_T_1150 | _bit_T_1152 | _bit_T_1154 | _bit_T_1156 | _bit_T_1158 | _bit_T_1160 | _bit_T_1162 | _bit_T_1164 |
    _bit_T_1166 | _bit_T_1168 | _bit_T_1170 | _bit_T_1172 | _bit_T_1174 | _bit_T_1176 | _bit_T_1178 | _bit_T_1180; // @[Decode.scala 15:30]
  wire  _bit_T_11538 = _bit_T_11508 | _bit_T_1182 | _bit_T_1184 | _bit_T_1186 | _bit_T_1188 | _bit_T_1190 | _bit_T_1192
     | _bit_T_1194 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200 | _bit_T_1202 | _bit_T_1204 | _bit_T_1206 | _bit_T_1208 |
    _bit_T_1210 | _bit_T_1212 | _bit_T_1214 | _bit_T_1216 | _bit_T_1218 | _bit_T_1220 | _bit_T_1222 | _bit_T_1224 |
    _bit_T_1226 | _bit_T_1228 | _bit_T_1230 | _bit_T_1232 | _bit_T_1234 | _bit_T_1236 | _bit_T_1238 | _bit_T_1240; // @[Decode.scala 15:30]
  wire  _bit_T_11568 = _bit_T_11538 | _bit_T_1242 | _bit_T_1244 | _bit_T_1246 | _bit_T_1248 | _bit_T_1250 | _bit_T_1252
     | _bit_T_1254 | _bit_T_1256 | _bit_T_1258 | _bit_T_1260 | _bit_T_1262 | _bit_T_1264 | _bit_T_1266 | _bit_T_1268 |
    _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 | _bit_T_1282 | _bit_T_1284 |
    _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 | _bit_T_1298 | _bit_T_1300; // @[Decode.scala 15:30]
  wire  _bit_T_11598 = _bit_T_11568 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1316 | _bit_T_1318 | _bit_T_1320
     | _bit_T_1322 | _bit_T_1328 | _bit_T_1330 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 |
    _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360 |
    _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376; // @[Decode.scala 15:30]
  wire  _bit_T_11628 = _bit_T_11598 | _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388
     | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 |
    _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420 |
    _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436; // @[Decode.scala 15:30]
  wire  _bit_T_11658 = _bit_T_11628 | _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448
     | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 |
    _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 |
    _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496; // @[Decode.scala 15:30]
  wire  _bit_T_11688 = _bit_T_11658 | _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508
     | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1524 |
    _bit_T_1526 | _bit_T_1528 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540 |
    _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556; // @[Decode.scala 15:30]
  wire  _bit_T_11718 = _bit_T_11688 | _bit_T_1558 | _bit_T_1560 | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568
     | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 |
    _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 |
    _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616; // @[Decode.scala 15:30]
  wire  _bit_T_11748 = _bit_T_11718 | _bit_T_1618 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628
     | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 |
    _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 |
    _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676; // @[Decode.scala 15:30]
  wire  _bit_T_11778 = _bit_T_11748 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1752
     | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 |
    _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 |
    _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800; // @[Decode.scala 15:30]
  wire  _bit_T_11808 = _bit_T_11778 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812
     | _bit_T_1814 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 |
    _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876 |
    _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892; // @[Decode.scala 15:30]
  wire  _bit_T_11838 = _bit_T_11808 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904
     | _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 |
    _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1936 | _bit_T_1938 | _bit_T_1976 |
    _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | bit_30; // @[Decode.scala 15:30]
  wire  hi_lo_23 = _bit_T_11838 | _bit_T_2048 | _bit_T_2088 | _bit_T_2034; // @[Decode.scala 15:30]
  wire  _bit_T_11871 = _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860
     | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876 |
    _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892 |
    _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908; // @[Decode.scala 15:30]
  wire  _bit_T_11872 = _bit_T_11871 | _bit_T_1910; // @[Decode.scala 15:30]
  wire  _bit_T_11901 = _bit_T_11871 | _bit_T_1910 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920
     | _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936 |
    _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 |
    _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | _bit_T_2000; // @[Decode.scala 15:30]
  wire  hi_hi_21 = _bit_T_11901 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006; // @[Decode.scala 15:30]
  wire [1:0] hi_30 = {hi_hi_21,hi_lo_23}; // @[Cat.scala 30:58]
  wire  _bit_T_12087 = _bit_T_7079 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 | _bit_T_1282 | _bit_T_1284
     | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 | _bit_T_1298 | _bit_T_1300 |
    _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1316 | _bit_T_1318 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 |
    _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356; // @[Decode.scala 15:30]
  wire  _bit_T_12117 = _bit_T_12087 | _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368
     | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 |
    _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 |
    _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416; // @[Decode.scala 15:30]
  wire  _bit_T_12147 = _bit_T_12117 | _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428
     | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 |
    _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 |
    _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476; // @[Decode.scala 15:30]
  wire  _bit_T_12177 = _bit_T_12147 | _bit_T_1478 | _bit_T_1480 | _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1488
     | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504 |
    _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 |
    _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536; // @[Decode.scala 15:30]
  wire  _bit_T_12207 = _bit_T_12177 | _bit_T_1538 | _bit_T_1540 | _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548
     | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 | _bit_T_1562 | _bit_T_1564 |
    _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 |
    _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596; // @[Decode.scala 15:30]
  wire  _bit_T_12237 = _bit_T_12207 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608
     | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624 |
    _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 |
    _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656; // @[Decode.scala 15:30]
  wire  _bit_T_12267 = _bit_T_12237 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668
     | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 |
    _bit_T_1686 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 |
    _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780; // @[Decode.scala 15:30]
  wire  bit_23 = _bit_T_12267 | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 |
    _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 |
    _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | bit_30 | _bit_T_2048 | _bit_T_2088 | _bit_T_2034; // @[Decode.scala 15:30]
  wire  _bit_T_12318 = _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 | _bit_T_1562 | _bit_T_1564
     | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 |
    _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 |
    _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612; // @[Decode.scala 15:30]
  wire  _bit_T_12348 = _bit_T_12318 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624
     | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 |
    _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 |
    _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672; // @[Decode.scala 15:30]
  wire  _bit_T_12378 = _bit_T_12348 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684
     | _bit_T_1686 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 |
    _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876 |
    _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892; // @[Decode.scala 15:30]
  wire  lo_30 = _bit_T_12378 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 |
    _bit_T_1906 | _bit_T_1908 | _bit_T_1910; // @[Decode.scala 15:30]
  wire [1:0] _T_1104 = {hi_hi_15,lo_30}; // @[Cat.scala 30:58]
  wire  _T_1106 = _T_937 == 32'h1000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1107 = io_enq_uop_inst & 32'ha0000000; // @[Decode.scala 14:65]
  wire  _T_1108 = _T_1107 == 32'ha0000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1111 = io_enq_uop_inst & 32'hcd000100; // @[Decode.scala 14:65]
  wire  _T_1112 = _T_1111 == 32'h1000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1113 = io_enq_uop_inst & 32'hca000100; // @[Decode.scala 14:65]
  wire  _T_1114 = _T_1113 == 32'ha000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1115 = io_enq_uop_inst & 32'h5c000100; // @[Decode.scala 14:65]
  wire  _T_1116 = _T_1115 == 32'hc000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1117 = io_enq_uop_inst & 32'h6d000000; // @[Decode.scala 14:65]
  wire  _T_1118 = _T_1117 == 32'h21000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1119 = io_enq_uop_inst & 32'h6a000000; // @[Decode.scala 14:65]
  wire  _T_1120 = _T_1119 == 32'h2a000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1121 = io_enq_uop_inst & 32'h7c000000; // @[Decode.scala 14:65]
  wire  _T_1122 = _T_1121 == 32'h2c000000; // @[Decode.scala 14:121]
  wire  _T_1132 = _T_937 == 32'hc0000000; // @[Decode.scala 14:121]
  wire  lo_31 = hi_lo_12 | _T_1132; // @[Decode.scala 15:30]
  wire  hi_lo_24 = _T_1089 | hi_lo_12; // @[Decode.scala 15:30]
  wire [1:0] hi_32 = {hi_lo_24,hi_lo_24}; // @[Cat.scala 30:58]
  wire  _bit_T_12540 = _bit_T_10089 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1324 | _bit_T_1326 | _bit_T_1332
     | _bit_T_1334 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 |
    _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364 |
    _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380; // @[Decode.scala 15:30]
  wire  _bit_T_12570 = _bit_T_12540 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392
     | _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 |
    _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1424 |
    _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440; // @[Decode.scala 15:30]
  wire  _bit_T_12600 = _bit_T_12570 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452
     | _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 |
    _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 | _bit_T_1482 | _bit_T_1484 |
    _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500; // @[Decode.scala 15:30]
  wire  _bit_T_12630 = _bit_T_12600 | _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512
     | _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528 |
    _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540 | _bit_T_1542 | _bit_T_1544 |
    _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560; // @[Decode.scala 15:30]
  wire  _bit_T_12660 = _bit_T_12630 | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572
     | _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 |
    _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604 |
    _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620; // @[Decode.scala 15:30]
  wire  _bit_T_12690 = _bit_T_12660 | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632
     | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 |
    _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 |
    _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680; // @[Decode.scala 15:30]
  wire  _bit_T_12720 = _bit_T_12690 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1688 | _bit_T_1692 | _bit_T_1696
     | _bit_T_1700 | _bit_T_1704 | _bit_T_1708 | _bit_T_1712 | _bit_T_1716 | _bit_T_1720 | _bit_T_1722 | _bit_T_1724 |
    _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 |
    _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772; // @[Decode.scala 15:30]
  wire  _bit_T_12750 = _bit_T_12720 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784
     | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 |
    _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1816 |
    _bit_T_1820 | _bit_T_1824 | _bit_T_1828 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1848; // @[Decode.scala 15:30]
  wire  _bit_T_12780 = _bit_T_12750 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860
     | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876 |
    _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892 |
    _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908; // @[Decode.scala 15:30]
  wire  _bit_T_12810 = _bit_T_12780 | _bit_T_1910 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920
     | _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936 |
    _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 |
    _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984; // @[Decode.scala 15:30]
  wire  _bit_T_12840 = _bit_T_12810 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996
     | _bit_T_1998 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 |
    _bit_T_1004 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | bit_30 | _bit_T_2048 | _bit_T_2058 |
    _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080 | _bit_T_2088; // @[Decode.scala 15:30]
  wire  lo_32 = _bit_T_12840 | _bit_T_2034; // @[Decode.scala 15:30]
  wire  _bit_T_12871 = _bit_T_926 | _bit_T_928 | _bit_T_930 | _bit_T_932 | _bit_T_934 | _bit_T_936 | _bit_T_938 |
    _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 | _bit_T_948 | _bit_T_950 | _bit_T_952 | _bit_T_954 | _bit_T_956
     | _bit_T_1688 | _bit_T_1692 | _bit_T_1696 | _bit_T_1700 | _bit_T_1704 | _bit_T_1708 | _bit_T_1712 | _bit_T_1716 |
    _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732; // @[Decode.scala 15:30]
  wire  hi_33 = _bit_T_12871 | _bit_T_1734 | _bit_T_1816 | _bit_T_1820 | _bit_T_1824 | _bit_T_1828 | _bit_T_1832 |
    _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 |
    _bit_T_1954 | _bit_T_1956 | _bit_T_1958; // @[Decode.scala 15:30]
  wire  _bit_T_13008 = _bit_T_7079 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280 | _bit_T_1282 | _bit_T_1284
     | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292 | _bit_T_1294 | _bit_T_1296 | _bit_T_1298 | _bit_T_1300 |
    _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1324 | _bit_T_1326 | _bit_T_1332 | _bit_T_1334 | _bit_T_1336 |
    _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348 | _bit_T_1350 | _bit_T_1352; // @[Decode.scala 15:30]
  wire  _bit_T_13038 = _bit_T_13008 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360 | _bit_T_1362 | _bit_T_1364
     | _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 | _bit_T_1378 | _bit_T_1380 |
    _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 | _bit_T_1394 | _bit_T_1396 |
    _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408 | _bit_T_1410 | _bit_T_1412; // @[Decode.scala 15:30]
  wire  _bit_T_13068 = _bit_T_13038 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420 | _bit_T_1422 | _bit_T_1424
     | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 | _bit_T_1438 | _bit_T_1440 |
    _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 | _bit_T_1454 | _bit_T_1456 |
    _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468 | _bit_T_1470 | _bit_T_1472; // @[Decode.scala 15:30]
  wire  _bit_T_13098 = _bit_T_13068 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480 | _bit_T_1482 | _bit_T_1484
     | _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496 | _bit_T_1498 | _bit_T_1500 |
    _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512 | _bit_T_1514 | _bit_T_1516 |
    _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528 | _bit_T_1530 | _bit_T_1532; // @[Decode.scala 15:30]
  wire  _bit_T_13128 = _bit_T_13098 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540 | _bit_T_1542 | _bit_T_1544
     | _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 | _bit_T_1558 | _bit_T_1560 |
    _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 | _bit_T_1574 | _bit_T_1576 |
    _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588 | _bit_T_1590 | _bit_T_1592; // @[Decode.scala 15:30]
  wire  _bit_T_13158 = _bit_T_13128 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600 | _bit_T_1602 | _bit_T_1604
     | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 | _bit_T_1618 | _bit_T_1620 |
    _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636 |
    _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652; // @[Decode.scala 15:30]
  wire  _bit_T_13188 = _bit_T_13158 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664
     | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 |
    _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1688 | _bit_T_1692 | _bit_T_1696 | _bit_T_1700 | _bit_T_1704 |
    _bit_T_1708 | _bit_T_1712 | _bit_T_1716 | _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728; // @[Decode.scala 15:30]
  wire  _bit_T_13218 = _bit_T_13188 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756
     | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 |
    _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 |
    _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804; // @[Decode.scala 15:30]
  wire  _bit_T_13248 = _bit_T_13218 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1816
     | _bit_T_1820 | _bit_T_1824 | _bit_T_1828 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1848 |
    _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 | _bit_T_1862 | _bit_T_1864 |
    _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876 | _bit_T_1878 | _bit_T_1880; // @[Decode.scala 15:30]
  wire  _bit_T_13278 = _bit_T_13248 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892
     | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908 |
    _bit_T_1910 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924 |
    _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936 | _bit_T_1938 | _bit_T_1940; // @[Decode.scala 15:30]
  wire  _bit_T_13308 = _bit_T_13278 | _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952
     | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 |
    _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | _bit_T_2000 |
    _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1014; // @[Decode.scala 15:30]
  wire [31:0] _T_1138 = io_enq_uop_inst & 32'h1000000; // @[Decode.scala 14:65]
  wire  lo_lo_10 = _T_1138 == 32'h0; // @[Decode.scala 14:121]
  wire [1:0] lo_33 = {1'h0,lo_lo_10}; // @[Cat.scala 30:58]
  wire  _bit_T_13373 = _bit_T_1051 | _bit_T_988 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 | _bit_T_1694 | _bit_T_1696 |
    _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1720 | _bit_T_1736 | _bit_T_1722 | _bit_T_1738 | _bit_T_1728 |
    _bit_T_1744 | _bit_T_1730 | _bit_T_1746 | _bit_T_1816 | _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824 |
    _bit_T_1826 | _bit_T_1828 | _bit_T_1830 | _bit_T_1944 | _bit_T_1946 | _bit_T_1952 | _bit_T_1954 | _bit_T_1960; // @[Decode.scala 15:30]
  wire  bit_25 = _bit_T_13373 | _bit_T_1962 | _bit_T_1968 | _bit_T_1970 | _bit_T_2088 | _bit_T_2034; // @[Decode.scala 15:30]
  wire  lo_34 = ~bit_25; // @[Decode.scala 40:35]
  wire  _bit_T_13408 = _bit_T_1696 | _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708
     | _bit_T_1710 | _bit_T_1712 | _bit_T_1714 | _bit_T_1716 | _bit_T_1718 | _bit_T_1720 | _bit_T_1736 | _bit_T_1722 |
    _bit_T_1738 | _bit_T_1724 | _bit_T_1740 | _bit_T_1726 | _bit_T_1742 | _bit_T_1728 | _bit_T_1744 | _bit_T_1730 |
    _bit_T_1746 | _bit_T_1732 | _bit_T_1748 | _bit_T_1734 | _bit_T_1750 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828; // @[Decode.scala 15:30]
  wire  bit_26 = _bit_T_13408 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840 |
    _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 |
    _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 |
    _bit_T_1970 | _bit_T_1972 | _bit_T_1974; // @[Decode.scala 15:30]
  wire  hi_35 = ~bit_26; // @[Decode.scala 40:35]
  wire  lo_35 = _bit_T_1848 | _bit_T_1854 | _bit_T_1856 | _bit_T_1862 | _bit_T_1864 | _bit_T_1870 | _bit_T_1872 |
    _bit_T_1878 | _bit_T_1880 | _bit_T_1886 | _bit_T_1888 | _bit_T_1894 | _bit_T_1896 | _bit_T_1902 | _bit_T_1904 |
    _bit_T_1910; // @[Decode.scala 15:30]
  wire  hi_lo_25 = _bit_T_1848 | _bit_T_1850 | _bit_T_1856 | _bit_T_1858 | _bit_T_1864 | _bit_T_1866 | _bit_T_1872 |
    _bit_T_1874 | _bit_T_1880 | _bit_T_1882 | _bit_T_1888 | _bit_T_1890 | _bit_T_1896 | _bit_T_1898 | _bit_T_1904 |
    _bit_T_1906; // @[Decode.scala 15:30]
  wire [1:0] hi_36 = {_bit_T_11872,hi_lo_25}; // @[Cat.scala 30:58]
  wire  _T_1143 = ~bit_20; // @[Decode.scala 40:35]
  wire  _bit_T_14089 = _bit_T_7364 | _bit_T_1150 | _bit_T_1152 | _bit_T_1154 | _bit_T_1156 | _bit_T_1158 | _bit_T_1160
     | _bit_T_1162 | _bit_T_1236 | _bit_T_1238 | _bit_T_1240 | _bit_T_1242 | _bit_T_1244 | _bit_T_1246 | _bit_T_1248 |
    _bit_T_1250 | _bit_T_1252 | _bit_T_1254 | _bit_T_1256 | _bit_T_1258 | _bit_T_1260 | _bit_T_1262 | _bit_T_1264 |
    _bit_T_1266 | _bit_T_1268 | _bit_T_1270 | _bit_T_1272 | _bit_T_1274 | _bit_T_1276 | _bit_T_1278 | _bit_T_1280; // @[Decode.scala 15:30]
  wire  _bit_T_14119 = _bit_T_14089 | _bit_T_1282 | _bit_T_1284 | _bit_T_1286 | _bit_T_1288 | _bit_T_1290 | _bit_T_1292
     | _bit_T_1294 | _bit_T_1296 | _bit_T_1298 | _bit_T_1300 | _bit_T_1302 | _bit_T_1304 | _bit_T_1306 | _bit_T_1316 |
    _bit_T_1318 | _bit_T_1320 | _bit_T_1322 | _bit_T_1324 | _bit_T_1326 | _bit_T_1328 | _bit_T_1330 | _bit_T_1332 |
    _bit_T_1334 | _bit_T_1336 | _bit_T_1338 | _bit_T_1340 | _bit_T_1342 | _bit_T_1344 | _bit_T_1346 | _bit_T_1348; // @[Decode.scala 15:30]
  wire  _bit_T_14149 = _bit_T_14119 | _bit_T_1350 | _bit_T_1352 | _bit_T_1354 | _bit_T_1356 | _bit_T_1358 | _bit_T_1360
     | _bit_T_1362 | _bit_T_1364 | _bit_T_1366 | _bit_T_1368 | _bit_T_1370 | _bit_T_1372 | _bit_T_1374 | _bit_T_1376 |
    _bit_T_1378 | _bit_T_1380 | _bit_T_1382 | _bit_T_1384 | _bit_T_1386 | _bit_T_1388 | _bit_T_1390 | _bit_T_1392 |
    _bit_T_1394 | _bit_T_1396 | _bit_T_1398 | _bit_T_1400 | _bit_T_1402 | _bit_T_1404 | _bit_T_1406 | _bit_T_1408; // @[Decode.scala 15:30]
  wire  _bit_T_14179 = _bit_T_14149 | _bit_T_1410 | _bit_T_1412 | _bit_T_1414 | _bit_T_1416 | _bit_T_1418 | _bit_T_1420
     | _bit_T_1422 | _bit_T_1424 | _bit_T_1426 | _bit_T_1428 | _bit_T_1430 | _bit_T_1432 | _bit_T_1434 | _bit_T_1436 |
    _bit_T_1438 | _bit_T_1440 | _bit_T_1442 | _bit_T_1444 | _bit_T_1446 | _bit_T_1448 | _bit_T_1450 | _bit_T_1452 |
    _bit_T_1454 | _bit_T_1456 | _bit_T_1458 | _bit_T_1460 | _bit_T_1462 | _bit_T_1464 | _bit_T_1466 | _bit_T_1468; // @[Decode.scala 15:30]
  wire  _bit_T_14209 = _bit_T_14179 | _bit_T_1470 | _bit_T_1472 | _bit_T_1474 | _bit_T_1476 | _bit_T_1478 | _bit_T_1480
     | _bit_T_1482 | _bit_T_1484 | _bit_T_1486 | _bit_T_1488 | _bit_T_1490 | _bit_T_1492 | _bit_T_1494 | _bit_T_1496 |
    _bit_T_1498 | _bit_T_1500 | _bit_T_1502 | _bit_T_1504 | _bit_T_1506 | _bit_T_1508 | _bit_T_1510 | _bit_T_1512 |
    _bit_T_1514 | _bit_T_1516 | _bit_T_1518 | _bit_T_1520 | _bit_T_1522 | _bit_T_1524 | _bit_T_1526 | _bit_T_1528; // @[Decode.scala 15:30]
  wire  _bit_T_14239 = _bit_T_14209 | _bit_T_1530 | _bit_T_1532 | _bit_T_1534 | _bit_T_1536 | _bit_T_1538 | _bit_T_1540
     | _bit_T_1542 | _bit_T_1544 | _bit_T_1546 | _bit_T_1548 | _bit_T_1550 | _bit_T_1552 | _bit_T_1554 | _bit_T_1556 |
    _bit_T_1558 | _bit_T_1560 | _bit_T_1562 | _bit_T_1564 | _bit_T_1566 | _bit_T_1568 | _bit_T_1570 | _bit_T_1572 |
    _bit_T_1574 | _bit_T_1576 | _bit_T_1578 | _bit_T_1580 | _bit_T_1582 | _bit_T_1584 | _bit_T_1586 | _bit_T_1588; // @[Decode.scala 15:30]
  wire  _bit_T_14269 = _bit_T_14239 | _bit_T_1590 | _bit_T_1592 | _bit_T_1594 | _bit_T_1596 | _bit_T_1598 | _bit_T_1600
     | _bit_T_1602 | _bit_T_1604 | _bit_T_1606 | _bit_T_1608 | _bit_T_1610 | _bit_T_1612 | _bit_T_1614 | _bit_T_1616 |
    _bit_T_1618 | _bit_T_1620 | _bit_T_1622 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 |
    _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648; // @[Decode.scala 15:30]
  wire  _bit_T_14299 = _bit_T_14269 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660
     | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 |
    _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1688 | _bit_T_1690 | _bit_T_1692 |
    _bit_T_1694 | _bit_T_1696 | _bit_T_1698 | _bit_T_1700 | _bit_T_1702 | _bit_T_1704 | _bit_T_1706 | _bit_T_1708; // @[Decode.scala 15:30]
  wire  _bit_T_14329 = _bit_T_14299 | _bit_T_1710 | _bit_T_1712 | _bit_T_1714 | _bit_T_1716 | _bit_T_1718 | _bit_T_1720
     | _bit_T_1736 | _bit_T_1722 | _bit_T_1738 | _bit_T_1724 | _bit_T_1740 | _bit_T_1726 | _bit_T_1742 | _bit_T_1728 |
    _bit_T_1744 | _bit_T_1730 | _bit_T_1746 | _bit_T_1732 | _bit_T_1748 | _bit_T_1734 | _bit_T_1750 | _bit_T_1752 |
    _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768; // @[Decode.scala 15:30]
  wire  _bit_T_14359 = _bit_T_14329 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780
     | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 |
    _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 |
    _bit_T_1814 | _bit_T_1816 | _bit_T_1818 | _bit_T_1820 | _bit_T_1822 | _bit_T_1824 | _bit_T_1826 | _bit_T_1828; // @[Decode.scala 15:30]
  wire  _bit_T_14389 = _bit_T_14359 | _bit_T_1830 | _bit_T_1832 | _bit_T_1834 | _bit_T_1836 | _bit_T_1838 | _bit_T_1840
     | _bit_T_1842 | _bit_T_1844 | _bit_T_1846 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 |
    _bit_T_1858 | _bit_T_1860 | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 |
    _bit_T_1874 | _bit_T_1876 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888; // @[Decode.scala 15:30]
  wire  _bit_T_14419 = _bit_T_14389 | _bit_T_1890 | _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900
     | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | _bit_T_1912 | _bit_T_1914 | _bit_T_1916 |
    _bit_T_1918 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 |
    _bit_T_1934 | _bit_T_1936 | _bit_T_1938 | _bit_T_1940 | _bit_T_1942 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948; // @[Decode.scala 15:30]
  wire  _bit_T_14449 = _bit_T_14419 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1960
     | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 | _bit_T_1970 | _bit_T_1972 | _bit_T_1974 | _bit_T_1976 |
    _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 |
    _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_998; // @[Decode.scala 15:30]
  wire  lo_lo_11 = _bit_T_14449 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 |
    _bit_T_1020 | bit_30 | _bit_T_2048 | _bit_T_2058 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2074 |
    _bit_T_2076 | _bit_T_2078 | _bit_T_2080 | _bit_T_2088 | _bit_T_2034; // @[Decode.scala 15:30]
  wire  _bit_T_14498 = _bit_T_1164 | _bit_T_1166 | _bit_T_1168 | _bit_T_1170 | _bit_T_1172 | _bit_T_1174 | _bit_T_1176
     | _bit_T_1178 | _bit_T_1180 | _bit_T_1182 | _bit_T_1184 | _bit_T_1186 | _bit_T_1188 | _bit_T_1190 | _bit_T_1192 |
    _bit_T_1194 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200 | _bit_T_1202 | _bit_T_1204 | _bit_T_1206 | _bit_T_1208 |
    _bit_T_1210 | _bit_T_1212 | _bit_T_1214 | _bit_T_1216 | _bit_T_1218 | _bit_T_1220 | _bit_T_1222 | _bit_T_1224; // @[Decode.scala 15:30]
  wire  lo_hi_9 = _bit_T_14498 | _bit_T_1226 | _bit_T_1228 | _bit_T_1230 | _bit_T_1232 | _bit_T_1234; // @[Decode.scala 15:30]
  wire [1:0] lo_36 = {lo_hi_9,lo_lo_11}; // @[Cat.scala 30:58]
  wire  _bit_T_14533 = _bit_T_926 | _bit_T_928 | _bit_T_930 | _bit_T_932 | _bit_T_934 | _bit_T_936 | _bit_T_938 |
    _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 | _bit_T_948 | _bit_T_950 | _bit_T_952 | _bit_T_954 | _bit_T_956
     | _bit_T_1164 | _bit_T_1166 | _bit_T_1168 | _bit_T_1170 | _bit_T_1172 | _bit_T_1174 | _bit_T_1176 | _bit_T_1178 |
    _bit_T_1180 | _bit_T_1182 | _bit_T_1184 | _bit_T_1186 | _bit_T_1188 | _bit_T_1190 | _bit_T_1192; // @[Decode.scala 15:30]
  wire  _bit_T_14563 = _bit_T_14533 | _bit_T_1194 | _bit_T_1196 | _bit_T_1198 | _bit_T_1200 | _bit_T_1202 | _bit_T_1204
     | _bit_T_1206 | _bit_T_1208 | _bit_T_1210 | _bit_T_1212 | _bit_T_1214 | _bit_T_1216 | _bit_T_1218 | _bit_T_1220 |
    _bit_T_1222 | _bit_T_1224 | _bit_T_1226 | _bit_T_1228 | _bit_T_1230 | _bit_T_1232 | _bit_T_1234 | _bit_T_1912 |
    _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924 | _bit_T_1926 | _bit_T_998; // @[Decode.scala 15:30]
  wire  lo_lo_12 = _bit_T_14563 | _bit_T_1002 | _bit_T_1014 | _bit_T_1018 | _bit_T_2058 | _bit_T_2062 | _bit_T_2074 |
    _bit_T_2078; // @[Decode.scala 15:30]
  wire  _bit_T_14870 = _bit_T_14269 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660
     | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 |
    _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1690 | _bit_T_1694 | _bit_T_1698 |
    _bit_T_1702 | _bit_T_1706 | _bit_T_1710 | _bit_T_1714 | _bit_T_1718 | _bit_T_1736 | _bit_T_1738 | _bit_T_1740; // @[Decode.scala 15:30]
  wire  _bit_T_14900 = _bit_T_14870 | _bit_T_1742 | _bit_T_1744 | _bit_T_1746 | _bit_T_1748 | _bit_T_1750 | _bit_T_1752
     | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 |
    _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 |
    _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800; // @[Decode.scala 15:30]
  wire  _bit_T_14930 = _bit_T_14900 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812
     | _bit_T_1814 | _bit_T_1818 | _bit_T_1822 | _bit_T_1826 | _bit_T_1830 | _bit_T_1840 | _bit_T_1842 | _bit_T_1844 |
    _bit_T_1846 | _bit_T_1928 | _bit_T_1930 | _bit_T_1932 | _bit_T_1934 | _bit_T_1936 | _bit_T_1938 | _bit_T_1940 |
    _bit_T_1942 | _bit_T_1960 | _bit_T_1962 | _bit_T_1964 | _bit_T_1966 | _bit_T_1968 | _bit_T_1970 | _bit_T_1972; // @[Decode.scala 15:30]
  wire  lo_hi_10 = _bit_T_14930 | _bit_T_1974 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 |
    _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998 | _bit_T_2000 |
    _bit_T_2002 | _bit_T_2004 | _bit_T_2006 | _bit_T_998 | _bit_T_1000 | _bit_T_1014 | _bit_T_1016 | bit_30 |
    _bit_T_2048 | _bit_T_2058 | _bit_T_2060 | _bit_T_2074 | _bit_T_2076 | _bit_T_2088 | _bit_T_2034; // @[Decode.scala 15:30]
  wire  hi_hi_25 = _bit_T_1912 | _bit_T_1914 | _bit_T_1916 | _bit_T_1918 | _bit_T_1920 | _bit_T_1922 | _bit_T_1924 |
    _bit_T_1926 | _bit_T_1928 | _bit_T_1930 | _bit_T_1936 | _bit_T_1938 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 |
    _bit_T_1982 | _bit_T_1992 | _bit_T_1994 | _bit_T_1996 | _bit_T_1998; // @[Decode.scala 15:30]
  wire [1:0] lo_37 = {lo_hi_10,lo_lo_12}; // @[Cat.scala 30:58]
  wire [1:0] hi_38 = {hi_hi_25,_bit_T_11872}; // @[Cat.scala 30:58]
  wire  _bit_T_15024 = _bit_T_934 | _bit_T_936 | _bit_T_938 | _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 |
    _bit_T_948 | _bit_T_966 | _bit_T_968 | _bit_T_970 | _bit_T_972 | _bit_T_974 | _bit_T_976 | _bit_T_978 | _bit_T_980; // @[Decode.scala 15:30]
  wire  _bit_T_15039 = _bit_T_934 | _bit_T_936 | _bit_T_938 | _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 |
    _bit_T_948 | _bit_T_966 | _bit_T_968 | _bit_T_970 | _bit_T_972 | _bit_T_974 | _bit_T_976 | _bit_T_978 | _bit_T_980
     | _bit_T_1324 | _bit_T_1326 | _bit_T_1332 | _bit_T_1334 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 |
    _bit_T_1632 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644; // @[Decode.scala 15:30]
  wire  _bit_T_15060 = _bit_T_15039 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656
     | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 |
    _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686; // @[Decode.scala 15:30]
  wire  _bit_T_15069 = _bit_T_15039 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656
     | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 |
    _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1720 |
    _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734 | _bit_T_1752; // @[Decode.scala 15:30]
  wire  _bit_T_15099 = _bit_T_15069 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764
     | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 |
    _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 |
    _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812; // @[Decode.scala 15:30]
  wire  _bit_T_15129 = _bit_T_15099 | _bit_T_1814 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856
     | _bit_T_1858 | _bit_T_1860 | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 |
    _bit_T_1874 | _bit_T_1876 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 |
    _bit_T_1890 | _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904; // @[Decode.scala 15:30]
  wire  bit_28 = _bit_T_15129 | _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 |
    _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 |
    _bit_T_1982 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | bit_30 | _bit_T_2048; // @[Decode.scala 15:30]
  wire  bit_29 = bit_30 | _bit_T_2048; // @[Decode.scala 15:30]
  wire [31:0] _T_1146 = io_enq_uop_inst & 32'h40000000; // @[Decode.scala 14:65]
  wire  _T_1147 = _T_1146 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_1148 = io_enq_uop_inst & 32'h80000140; // @[Decode.scala 14:65]
  wire  _T_1149 = _T_1148 == 32'h140; // @[Decode.scala 14:121]
  wire [31:0] _T_1150 = io_enq_uop_inst & 32'h98000100; // @[Decode.scala 14:65]
  wire  _T_1151 = _T_1150 == 32'h8000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1152 = io_enq_uop_inst & 32'h11000100; // @[Decode.scala 14:65]
  wire  _T_1153 = _T_1152 == 32'h11000000; // @[Decode.scala 14:121]
  wire [31:0] _T_1154 = io_enq_uop_inst & 32'h84000000; // @[Decode.scala 14:65]
  wire  _T_1155 = _T_1154 == 32'h84000000; // @[Decode.scala 14:121]
  wire  _T_1158 = _T_1147 | _T_1149 | _T_1151; // @[Decode.scala 15:30]
  wire  lo_lo_13 = _T_1147 | _T_1149 | _T_1151 | _T_1153 | _T_1155; // @[Decode.scala 15:30]
  wire [31:0] _T_1160 = io_enq_uop_inst & 32'h11000000; // @[Decode.scala 14:65]
  wire  _T_1161 = _T_1160 == 32'h10000000; // @[Decode.scala 14:121]
  wire  lo_hi_lo_6 = _T_1147 | _T_1149 | _T_1151 | _T_1161; // @[Decode.scala 15:30]
  wire  _T_1170 = _T_1150 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_1171 = io_enq_uop_inst & 32'h40000140; // @[Decode.scala 14:65]
  wire  _T_1172 = _T_1171 == 32'h40000100; // @[Decode.scala 14:121]
  wire [31:0] _T_1173 = io_enq_uop_inst & 32'h82000000; // @[Decode.scala 14:65]
  wire  hi_lo_hi_6 = _T_1173 == 32'h80000000; // @[Decode.scala 14:121]
  wire  hi_lo_hi_5 = _T_1170 | _T_1172 | hi_lo_hi_6; // @[Decode.scala 15:30]
  wire  hi_hi_lo_6 = _T_619 == 32'h40000100; // @[Decode.scala 14:121]
  wire [31:0] _T_1179 = io_enq_uop_inst & 32'h40000100; // @[Decode.scala 14:65]
  wire  _T_1180 = _T_1179 == 32'h40000100; // @[Decode.scala 14:121]
  wire  hi_hi_hi_7 = _T_1180 | hi_lo_hi_6; // @[Decode.scala 15:30]
  wire [2:0] lo_38 = {_T_1158,lo_hi_lo_6,lo_lo_13}; // @[Cat.scala 30:58]
  wire [3:0] hi_39 = {hi_hi_hi_7,hi_hi_lo_6,hi_lo_hi_5,_T_1158}; // @[Cat.scala 30:58]
  wire  _bit_T_15181 = _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636
     | _bit_T_1638 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 |
    _bit_T_1654 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 |
    _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684; // @[Decode.scala 15:30]
  wire  _bit_T_15211 = _bit_T_15181 | _bit_T_1686 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760
     | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 |
    _bit_T_1778 | _bit_T_1780 | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 |
    _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808; // @[Decode.scala 15:30]
  wire  _bit_T_15214 = _bit_T_15211 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814; // @[Decode.scala 15:30]
  wire  bit_31 = _bit_T_15211 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | bit_30 | _bit_T_2048; // @[Decode.scala 15:30]
  wire  lo_39 = ~bit_31; // @[Decode.scala 40:35]
  wire [1:0] hi_40 = {bit_29,_bit_T_15214}; // @[Cat.scala 30:58]
  wire [31:0] _T_1184 = io_enq_uop_inst & 32'h90000000; // @[Decode.scala 14:65]
  wire  _T_1185 = _T_1184 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_1186 = io_enq_uop_inst & 32'h80000100; // @[Decode.scala 14:65]
  wire  _T_1187 = _T_1186 == 32'h100; // @[Decode.scala 14:121]
  wire  lo_lo_lo_3 = _T_1185 | _T_1147 | _T_1187; // @[Decode.scala 15:30]
  wire [31:0] _T_1190 = io_enq_uop_inst & 32'h90000100; // @[Decode.scala 14:65]
  wire  lo_hi_lo_7 = _T_1190 == 32'h10000000; // @[Decode.scala 14:121]
  wire [4:0] lo_40 = {2'h0,lo_hi_lo_7,1'h0,lo_lo_lo_3}; // @[Cat.scala 30:58]
  wire [4:0] hi_41 = {3'h0,hi_lo_hi_6,1'h0}; // @[Cat.scala 30:58]
  wire [31:0] _T_1193 = io_enq_uop_inst & 32'h91000100; // @[Decode.scala 14:65]
  wire [31:0] _T_1196 = io_enq_uop_inst & 32'h91000000; // @[Decode.scala 14:65]
  wire  _bit_T_15310 = _bit_T_934 | _bit_T_936 | _bit_T_938 | _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 |
    _bit_T_948 | _bit_T_966 | _bit_T_968 | _bit_T_970 | _bit_T_972 | _bit_T_974 | _bit_T_976 | _bit_T_978 | _bit_T_980
     | _bit_T_1324 | _bit_T_1326 | _bit_T_1332 | _bit_T_1334 | _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 |
    _bit_T_1632 | _bit_T_1634 | _bit_T_1636 | _bit_T_1638 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660; // @[Decode.scala 15:30]
  wire  _bit_T_15340 = _bit_T_15310 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1720
     | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 | _bit_T_1734 | _bit_T_1752 |
    _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1784 |
    _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 | _bit_T_1798 | _bit_T_1848; // @[Decode.scala 15:30]
  wire  _bit_T_15370 = _bit_T_15340 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860
     | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876 |
    _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892 |
    _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908; // @[Decode.scala 15:30]
  wire  lo_41 = _bit_T_15370 | _bit_T_1910 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 |
    _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 |
    _bit_T_1986 | _bit_T_1988 | _bit_T_1990; // @[Decode.scala 15:30]
  wire  _bit_T_15417 = _bit_T_934 | _bit_T_936 | _bit_T_938 | _bit_T_940 | _bit_T_942 | _bit_T_944 | _bit_T_946 |
    _bit_T_948 | _bit_T_966 | _bit_T_968 | _bit_T_970 | _bit_T_972 | _bit_T_974 | _bit_T_976 | _bit_T_978 | _bit_T_980
     | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860 | _bit_T_1862 |
    _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 | _bit_T_1876; // @[Decode.scala 15:30]
  wire  hi_lo_30 = _bit_T_15417 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 |
    _bit_T_1890 | _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 |
    _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | bit_30 | _bit_T_2048; // @[Decode.scala 15:30]
  wire [1:0] hi_42 = {1'h0,hi_lo_30}; // @[Cat.scala 30:58]
  wire  _bit_T_15466 = _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732
     | _bit_T_1734 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 |
    _bit_T_1766 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 |
    _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796; // @[Decode.scala 15:30]
  wire  _bit_T_15496 = _bit_T_15466 | _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808
     | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 |
    _bit_T_1858 | _bit_T_1860 | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 |
    _bit_T_1874 | _bit_T_1876 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888; // @[Decode.scala 15:30]
  wire  lo_42 = _bit_T_15496 | _bit_T_1890 | _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 |
    _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 |
    _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 |
    _bit_T_1982 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | bit_30 | _bit_T_2048; // @[Decode.scala 15:30]
  wire  _bit_T_15585 = _bit_T_15039 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652 | _bit_T_1654 | _bit_T_1656
     | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 | _bit_T_1670 | _bit_T_1672 |
    _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 | _bit_T_1686 | _bit_T_1752 |
    _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 | _bit_T_1766 | _bit_T_1768; // @[Decode.scala 15:30]
  wire  _bit_T_15615 = _bit_T_15585 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780
     | _bit_T_1782 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 |
    _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 |
    _bit_T_1814 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 | _bit_T_1860; // @[Decode.scala 15:30]
  wire  hi_lo_31 = _bit_T_15615 | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 |
    _bit_T_1874 | _bit_T_1876 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 |
    _bit_T_1890 | _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 |
    _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | bit_30 | _bit_T_2048; // @[Decode.scala 15:30]
  wire [1:0] hi_43 = {1'h0,hi_lo_31}; // @[Cat.scala 30:58]
  wire  _bit_T_15672 = _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 | _bit_T_1652
     | _bit_T_1654 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 |
    _bit_T_1686 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778 | _bit_T_1780 |
    _bit_T_1782 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812; // @[Decode.scala 15:30]
  wire  lo_43 = _bit_T_15672 | _bit_T_1814; // @[Decode.scala 15:30]
  wire  _bit_T_15706 = hi_hi_15 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 | _bit_T_1856 | _bit_T_1858 |
    _bit_T_1860 | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 | _bit_T_1872 | _bit_T_1874 |
    _bit_T_1876 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886 | _bit_T_1888 | _bit_T_1890 |
    _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 | _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906; // @[Decode.scala 15:30]
  wire  hi_lo_32 = _bit_T_15706 | _bit_T_1908 | _bit_T_1910; // @[Decode.scala 15:30]
  wire [1:0] hi_44 = {bit_29,hi_lo_32}; // @[Cat.scala 30:58]
  wire [1:0] _T_1202 = {hi_hi_15,_bit_T_11872}; // @[Cat.scala 30:58]
  wire  bit_33 = _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 | _bit_T_1732 |
    _bit_T_1734 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 |
    _bit_T_1958 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988 |
    _bit_T_1990 | bit_30 | _bit_T_2048; // @[Decode.scala 15:30]
  wire  _bit_T_15956 = _bit_T_1624 | _bit_T_1626 | _bit_T_1628 | _bit_T_1630 | _bit_T_1632 | _bit_T_1634 | _bit_T_1636
     | _bit_T_1638 | _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668 |
    _bit_T_1670 | _bit_T_1752 | _bit_T_1754 | _bit_T_1756 | _bit_T_1758 | _bit_T_1760 | _bit_T_1762 | _bit_T_1764 |
    _bit_T_1766 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796; // @[Decode.scala 15:30]
  wire  hi_47 = _bit_T_15956 | _bit_T_1798; // @[Decode.scala 15:30]
  wire  lo_47 = ~_bit_T_15214; // @[Decode.scala 40:35]
  wire  _bit_T_16157 = _bit_T_1656 | _bit_T_1658 | _bit_T_1660 | _bit_T_1662 | _bit_T_1664 | _bit_T_1666 | _bit_T_1668
     | _bit_T_1670 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 | _bit_T_1684 |
    _bit_T_1686 | _bit_T_1784 | _bit_T_1786 | _bit_T_1788 | _bit_T_1790 | _bit_T_1792 | _bit_T_1794 | _bit_T_1796 |
    _bit_T_1798 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806 | _bit_T_1808 | _bit_T_1810 | _bit_T_1812; // @[Decode.scala 15:30]
  wire  bit_36 = _bit_T_16157 | _bit_T_1814; // @[Decode.scala 15:30]
  wire  hi_49 = ~bit_36; // @[Decode.scala 40:35]
  wire  _T_1211 = ~bit_28; // @[Decode.scala 40:35]
  wire [1:0] lo_48 = {1'h0,bit_28}; // @[Cat.scala 30:58]
  wire  _bit_T_16488 = hi_hi_15 | _bit_T_1640 | _bit_T_1642 | _bit_T_1644 | _bit_T_1646 | _bit_T_1648 | _bit_T_1650 |
    _bit_T_1652 | _bit_T_1654 | _bit_T_1672 | _bit_T_1674 | _bit_T_1676 | _bit_T_1678 | _bit_T_1680 | _bit_T_1682 |
    _bit_T_1684 | _bit_T_1686 | _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1728 | _bit_T_1730 |
    _bit_T_1732 | _bit_T_1734 | _bit_T_1768 | _bit_T_1770 | _bit_T_1772 | _bit_T_1774 | _bit_T_1776 | _bit_T_1778; // @[Decode.scala 15:30]
  wire  _bit_T_16518 = _bit_T_16488 | _bit_T_1780 | _bit_T_1782 | _bit_T_1800 | _bit_T_1802 | _bit_T_1804 | _bit_T_1806
     | _bit_T_1808 | _bit_T_1810 | _bit_T_1812 | _bit_T_1814 | _bit_T_1848 | _bit_T_1850 | _bit_T_1852 | _bit_T_1854 |
    _bit_T_1856 | _bit_T_1858 | _bit_T_1860 | _bit_T_1862 | _bit_T_1864 | _bit_T_1866 | _bit_T_1868 | _bit_T_1870 |
    _bit_T_1872 | _bit_T_1874 | _bit_T_1876 | _bit_T_1878 | _bit_T_1880 | _bit_T_1882 | _bit_T_1884 | _bit_T_1886; // @[Decode.scala 15:30]
  wire  lo_hi_13 = _bit_T_16518 | _bit_T_1888 | _bit_T_1890 | _bit_T_1892 | _bit_T_1894 | _bit_T_1896 | _bit_T_1898 |
    _bit_T_1900 | _bit_T_1902 | _bit_T_1904 | _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | _bit_T_1944 | _bit_T_1946 |
    _bit_T_1948 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1976 | _bit_T_1978 |
    _bit_T_1980 | _bit_T_1982 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | bit_30 | _bit_T_2048; // @[Decode.scala 15:30]
  wire  hi_hi_31 = _bit_T_1720 | _bit_T_1722 | _bit_T_1724 | _bit_T_1726 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 |
    _bit_T_1950 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 | _bit_T_1982; // @[Decode.scala 15:30]
  wire [1:0] lo_49 = {lo_hi_13,_bit_T_15024}; // @[Cat.scala 30:58]
  wire [1:0] hi_52 = {hi_hi_31,_bit_T_15024}; // @[Cat.scala 30:58]
  wire [31:0] _T_1214 = io_enq_uop_inst & 32'h4000000; // @[Decode.scala 14:65]
  wire  lo_lo_18 = _T_1214 == 32'h4000000; // @[Decode.scala 14:121]
  wire  hi_lo_lo_5 = _T_1214 == 32'h0; // @[Decode.scala 14:121]
  wire [2:0] lo_50 = {lo_lo_18,1'h0,lo_lo_18}; // @[Cat.scala 30:58]
  wire [3:0] hi_53 = {2'h3,1'h1,hi_lo_lo_5}; // @[Cat.scala 30:58]
  wire [1:0] hi_56 = {hi_hi_15,1'h0}; // @[Cat.scala 30:58]
  wire [1:0] hi_57 = {1'h0,hi_hi_15}; // @[Cat.scala 30:58]
  wire  _T_1234 = ~hi_hi_15; // @[Decode.scala 40:35]
  wire  _T_1289 = cs__uopc == 7'hf; // @[decode.scala 688:30]
  wire  _T_1294 = io_enq_uop_inst[11:7] == 5'h0 & io_enq_uop_inst[19:15] == 5'h0; // @[decode.scala 688:74]
  wire  uop_switch_off = cs__uopc == 7'hf & (io_enq_uop_inst[11:7] == 5'h0 & io_enq_uop_inst[19:15] == 5'h0 &
    io_enq_uop_inst[24:20] == 5'h2); // @[decode.scala 688:42]
  wire  unicoreMode = io_is_unicore & ~uop_switch_off; // @[decode.scala 648:35]
  wire [2:0] cs_csr_cmd = unicoreMode ? 3'h0 : cs__csr_cmd; // @[decode.scala 653:23]
  wire  _T_1239 = cs_csr_cmd == 3'h6; // @[package.scala 15:47]
  wire  _T_1240 = cs_csr_cmd == 3'h7; // @[package.scala 15:47]
  wire  _T_1241 = cs_csr_cmd == 3'h5; // @[package.scala 15:47]
  wire  _T_1242 = _T_1239 | _T_1240; // @[package.scala 72:59]
  wire  csr_en = _T_1239 | _T_1240 | _T_1241; // @[package.scala 72:59]
  wire [5:0] uop_lrs1 = {{1'd0}, io_enq_uop_inst[19:15]}; // @[decode.scala 600:17]
  wire  csr_ren = _T_1242 & uop_lrs1 == 6'h0; // @[decode.scala 655:50]
  wire  system_insn = cs_csr_cmd == 3'h4; // @[decode.scala 656:32]
  wire  sfence = cs__uopc == 7'h6b; // @[decode.scala 657:24]
  wire  id_illegal_insn_unicore = ~bit_11; // @[decode.scala 659:33]
  wire  _T_1248 = bit_1 & io_csr_decode_fp_illegal; // @[decode.scala 661:15]
  wire  _T_1249 = ~bit_ | _T_1248; // @[decode.scala 660:43]
  wire  _T_1254 = cs__is_amo & ~io_status_isa[0]; // @[decode.scala 663:15]
  wire  _T_1255 = _T_1249 | _T_1254; // @[decode.scala 662:43]
  wire  _T_1260 = bit_1 & ~cs__fp_single & ~io_status_isa[3]; // @[decode.scala 664:34]
  wire  _T_1261 = _T_1255 | _T_1260; // @[decode.scala 663:43]
  wire  _T_1262 = ~csr_ren; // @[decode.scala 665:46]
  wire  _T_1265 = csr_en & (io_csr_decode_read_illegal | ~csr_ren & io_csr_decode_write_illegal); // @[decode.scala 665:12]
  wire  _T_1266 = _T_1261 | _T_1265; // @[decode.scala 664:61]
  wire  _T_1268 = (sfence | system_insn) & io_csr_decode_system_illegal; // @[decode.scala 666:30]
  wire  id_illegal_insn_riscv = _T_1266 | _T_1268; // @[decode.scala 665:87]
  wire  id_illegal_insn = unicoreMode ? id_illegal_insn_unicore : id_illegal_insn_riscv; // @[decode.scala 668:28]
  wire  _T_1270 = io_interrupt & ~io_enq_uop_is_sfb; // @[decode.scala 674:19]
  wire  xcpt_valid = _T_1270 | io_enq_uop_bp_debug_if | io_enq_uop_bp_xcpt_if | io_enq_uop_xcpt_pf_if |
    io_enq_uop_xcpt_ae_if | id_illegal_insn; // @[decode.scala 671:26]
  wire [1:0] _T_1275 = io_enq_uop_xcpt_ae_if ? 2'h1 : 2'h2; // @[Mux.scala 47:69]
  wire [3:0] _T_1276 = io_enq_uop_xcpt_pf_if ? 4'hc : {{2'd0}, _T_1275}; // @[Mux.scala 47:69]
  wire [3:0] _T_1277 = io_enq_uop_bp_xcpt_if ? 4'h3 : _T_1276; // @[Mux.scala 47:69]
  wire [3:0] _T_1278 = io_enq_uop_bp_debug_if ? 4'he : _T_1277; // @[Mux.scala 47:69]
  wire [63:0] xcpt_cause = _T_1270 ? io_interrupt_cause : {{60'd0}, _T_1278}; // @[Mux.scala 47:69]
  wire  uop_switch = _T_1289 & (_T_1294 & io_enq_uop_inst[24:20] == 5'h1); // @[decode.scala 687:38]
  wire  riscv_flush_on_commit = cs__flush_on_commit | csr_en & _T_1262 & io_csr_decode_write_flush; // @[decode.scala 690:50]
  wire [4:0] di24_20 = cs__imm_sel == 3'h2 | cs__imm_sel == 3'h1 ? io_enq_uop_inst[11:7] : io_enq_uop_inst[24:20]; // @[decode.scala 691:20]
  wire  uop_is_amo = unicoreMode ? bit_8 : cs__is_amo; // @[decode.scala 692:29]
  wire  uop_is_fence = unicoreMode ? 1'h0 : cs__is_fence; // @[decode.scala 693:29]
  wire  uop_is_fencei = unicoreMode ? 1'h0 : bit_4; // @[decode.scala 694:29]
  wire  uop_is_sys_pc2epc = unicoreMode ? 1'h0 : bit_5; // @[decode.scala 695:29]
  wire  uop_flush_on_commit = unicoreMode ? bit_8 : riscv_flush_on_commit; // @[decode.scala 696:29]
  wire [4:0] _T_1313 = unicoreMode ? 5'h0 : io_enq_uop_inst[31:27]; // @[decode.scala 698:29]
  wire  uop_frs3_en = unicoreMode ? 1'h0 : cs__frs3_en; // @[decode.scala 700:29]
  wire  uop_mem_signed = unicoreMode ? 1'h0 : ~io_enq_uop_inst[14]; // @[decode.scala 702:29]
  wire [6:0] hi_hi_36 = io_enq_uop_inst[31:25]; // @[decode.scala 703:64]
  wire [7:0] lo_58 = io_enq_uop_inst[19:12]; // @[decode.scala 703:86]
  wire [19:0] _T_1323 = {hi_hi_36,di24_20,lo_58}; // @[Cat.scala 30:58]
  wire [19:0] uop_imm_packed = unicoreMode ? io_enq_uop_inst[19:0] : _T_1323; // @[decode.scala 703:29]
  wire  _T_1326 = unicoreMode ? bit_8 : bit_6; // @[decode.scala 709:69]
  wire  uop_is_unique = uop_switch | uop_switch_off | _T_1326; // @[decode.scala 709:29]
  wire  uop_is_rvc = unicoreMode ? 1'h0 : io_enq_uop_is_rvc; // @[decode.scala 711:22 decode.scala 712:16 decode.scala 601:7]
  wire [5:0] uop_ldst = {{1'd0}, io_enq_uop_inst[11:7]}; // @[decode.scala 600:17 decode.scala 720:18]
  wire  uop_ldst_val = cs__dst_type != 2'h2 & ~(uop_ldst == 6'h0 & cs__dst_type == 2'h0); // @[decode.scala 723:42]
  wire  uop_is_jal = cs__uopc == 7'h25; // @[decode.scala 735:31]
  wire  uop_is_jalr = cs__uopc == 7'h26; // @[decode.scala 736:31]
  wire  _T_1339 = cs__mem_cmd == 5'h14; // @[package.scala 15:47]
  wire  _T_1340 = cs__mem_cmd == 5'h5; // @[package.scala 15:47]
  wire  _T_1341 = _T_1339 | _T_1340; // @[package.scala 72:59]
  wire [5:0] uop_lrs2 = {{1'd0}, io_enq_uop_inst[24:20]}; // @[decode.scala 600:17]
  wire  hi_67 = uop_lrs2 != 6'h0; // @[decode.scala 740:38]
  wire  lo_59 = uop_lrs1 != 6'h0; // @[decode.scala 740:56]
  wire [1:0] _T_1342 = {hi_67,lo_59}; // @[Cat.scala 30:58]
  wire [1:0] uop_mem_size = _T_1341 ? _T_1342 : io_enq_uop_inst[13:12]; // @[decode.scala 739:24]
  wire  r31_modified = bit_11 & subDecUnit0_io_subuop_ldst_val & subDecUnit0_io_subuop_dst_rtype == 2'h0 &
    subDecUnit0_io_subuop_ldst == 6'h1f | bit_20 & subDecUnit1_io_subuop_ldst_val & subDecUnit1_io_subuop_dst_rtype == 2'h0
     & subDecUnit1_io_subuop_ldst == 6'h1f | bit_28 & subDecUnit2_io_subuop_ldst_val & subDecUnit2_io_subuop_dst_rtype
     == 2'h0 & subDecUnit2_io_subuop_ldst == 6'h1f | hi_hi_15 & subDecUnit3_io_subuop_ldst_val &
    subDecUnit3_io_subuop_dst_rtype == 2'h0 & subDecUnit3_io_subuop_ldst == 6'h1f; // @[decode.scala 784:76]
  wire [4:0] cs_sub0_split_num = {{2'd0}, _T_916}; // @[decode.scala 643:21 subInstDecode.scala 86:44]
  wire [5:0] uop_lrs3 = {{1'd0}, _T_1313}; // @[decode.scala 600:17 decode.scala 698:23]
  wire [5:0] uop1_self_index = unicoreMode ? 6'h1 : 6'h0; // @[decode.scala 802:20 decode.scala 814:21 decode.scala 760:8]
  wire [5:0] _GEN_339 = 2'h1 == cs_sub0_split_num[1:0] ? uop1_self_index : 6'h0; // @[decode.scala 794:28 decode.scala 794:28]
  wire [5:0] uop2_self_index = unicoreMode ? 6'h2 : 6'h0; // @[decode.scala 802:20 decode.scala 815:21 decode.scala 761:8]
  wire [5:0] _GEN_340 = 2'h2 == cs_sub0_split_num[1:0] ? uop2_self_index : _GEN_339; // @[decode.scala 794:28 decode.scala 794:28]
  wire [5:0] uop3_self_index = unicoreMode ? 6'h3 : 6'h0; // @[decode.scala 802:20 decode.scala 816:21 decode.scala 762:8]
  wire [4:0] _T_1743 = cs_sub0_split_num + 5'h1; // @[decode.scala 799:36]
  wire [4:0] split_num = r31_modified & cs_sub0_uopc != 7'h43 ? _T_1743 : cs_sub0_split_num; // @[decode.scala 790:53 decode.scala 799:15]
  wire [4:0] _GEN_1179 = unicoreMode ? split_num : 5'h1; // @[decode.scala 802:20 decode.scala 803:20 decode.scala 827:20]
  wire [5:0] uop_split_num = {{1'd0}, _GEN_1179}; // @[decode.scala 600:17]
  wire [5:0] uop1_split_num = unicoreMode ? {{1'd0}, split_num} : uop_split_num; // @[decode.scala 802:20 decode.scala 804:20 decode.scala 760:8]
  wire [5:0] _GEN_343 = 2'h1 == cs_sub0_split_num[1:0] ? uop1_split_num : uop_split_num; // @[decode.scala 794:28 decode.scala 794:28]
  wire [5:0] _GEN_344 = 2'h2 == cs_sub0_split_num[1:0] ? uop1_split_num : _GEN_343; // @[decode.scala 794:28 decode.scala 794:28]
  wire  uop_is_unicore = unicoreMode | io_is_unicore; // @[decode.scala 802:20 decode.scala 808:22 decode.scala 686:23]
  wire  uop1_is_unicore = unicoreMode | uop_is_unicore; // @[decode.scala 802:20 decode.scala 809:22 decode.scala 760:8]
  wire  _GEN_387 = 2'h1 == cs_sub0_split_num[1:0] ? uop1_is_unicore : uop_is_unicore; // @[decode.scala 794:28 decode.scala 794:28]
  wire  _GEN_388 = 2'h2 == cs_sub0_split_num[1:0] ? uop1_is_unicore : _GEN_387; // @[decode.scala 794:28 decode.scala 794:28]
  wire [1:0] _appended_subuops_T_1740_debug_tsrc = SubDecodeUnit_io_subuop_debug_tsrc; // @[decode.scala 797:46 decode.scala 797:46]
  wire [1:0] _GEN_398 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_tsrc :
    subDecUnit0_io_subuop_debug_tsrc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_399 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_tsrc :
    subDecUnit1_io_subuop_debug_tsrc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_400 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_tsrc :
    subDecUnit2_io_subuop_debug_tsrc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_401 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_tsrc :
    subDecUnit3_io_subuop_debug_tsrc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _appended_subuops_T_1740_debug_fsrc = SubDecodeUnit_io_subuop_debug_fsrc; // @[decode.scala 797:46 decode.scala 797:46]
  wire [1:0] _GEN_402 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_fsrc :
    subDecUnit0_io_subuop_debug_fsrc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_403 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_fsrc :
    subDecUnit1_io_subuop_debug_fsrc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_404 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_fsrc :
    subDecUnit2_io_subuop_debug_fsrc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_405 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_fsrc :
    subDecUnit3_io_subuop_debug_fsrc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_406 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bp_xcpt_if :
    subDecUnit0_io_subuop_bp_xcpt_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_407 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bp_xcpt_if :
    subDecUnit1_io_subuop_bp_xcpt_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_408 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bp_xcpt_if :
    subDecUnit2_io_subuop_bp_xcpt_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_409 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bp_xcpt_if :
    subDecUnit3_io_subuop_bp_xcpt_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_410 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bp_debug_if :
    subDecUnit0_io_subuop_bp_debug_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_411 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bp_debug_if :
    subDecUnit1_io_subuop_bp_debug_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_412 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bp_debug_if :
    subDecUnit2_io_subuop_bp_debug_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_413 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bp_debug_if :
    subDecUnit3_io_subuop_bp_debug_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_414 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_ma_if :
    subDecUnit0_io_subuop_xcpt_ma_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_415 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_ma_if :
    subDecUnit1_io_subuop_xcpt_ma_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_416 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_ma_if :
    subDecUnit2_io_subuop_xcpt_ma_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_417 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_ma_if :
    subDecUnit3_io_subuop_xcpt_ma_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_418 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_ae_if :
    subDecUnit0_io_subuop_xcpt_ae_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_419 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_ae_if :
    subDecUnit1_io_subuop_xcpt_ae_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_420 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_ae_if :
    subDecUnit2_io_subuop_xcpt_ae_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_421 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_ae_if :
    subDecUnit3_io_subuop_xcpt_ae_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_422 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_pf_if :
    subDecUnit0_io_subuop_xcpt_pf_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_423 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_pf_if :
    subDecUnit1_io_subuop_xcpt_pf_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_424 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_pf_if :
    subDecUnit2_io_subuop_xcpt_pf_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_425 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_xcpt_pf_if :
    subDecUnit3_io_subuop_xcpt_pf_if; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_426 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_fp_single : subDecUnit0_io_subuop_fp_single; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_427 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_fp_single : subDecUnit1_io_subuop_fp_single; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_428 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_fp_single : subDecUnit2_io_subuop_fp_single; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_429 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_fp_single : subDecUnit3_io_subuop_fp_single; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_430 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_fp_val : subDecUnit0_io_subuop_fp_val; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_431 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_fp_val : subDecUnit1_io_subuop_fp_val; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_432 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_fp_val : subDecUnit2_io_subuop_fp_val; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_433 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_fp_val : subDecUnit3_io_subuop_fp_val; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_434 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_frs3_en : subDecUnit0_io_subuop_frs3_en; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_435 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_frs3_en : subDecUnit1_io_subuop_frs3_en; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_436 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_frs3_en : subDecUnit2_io_subuop_frs3_en; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_437 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_frs3_en : subDecUnit3_io_subuop_frs3_en; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _appended_subuops_T_1740_lrs2_rtype = SubDecodeUnit_io_subuop_lrs2_rtype; // @[decode.scala 797:46 decode.scala 797:46]
  wire [1:0] _GEN_438 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs2_rtype :
    subDecUnit0_io_subuop_lrs2_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_439 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs2_rtype :
    subDecUnit1_io_subuop_lrs2_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_440 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs2_rtype :
    subDecUnit2_io_subuop_lrs2_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_441 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs2_rtype :
    subDecUnit3_io_subuop_lrs2_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _appended_subuops_T_1740_lrs1_rtype = SubDecodeUnit_io_subuop_lrs1_rtype; // @[decode.scala 797:46 decode.scala 797:46]
  wire [1:0] _GEN_442 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs1_rtype :
    subDecUnit0_io_subuop_lrs1_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_443 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs1_rtype :
    subDecUnit1_io_subuop_lrs1_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_444 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs1_rtype :
    subDecUnit2_io_subuop_lrs1_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_445 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs1_rtype :
    subDecUnit3_io_subuop_lrs1_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _appended_subuops_T_1740_dst_rtype = SubDecodeUnit_io_subuop_dst_rtype; // @[decode.scala 797:46 decode.scala 797:46]
  wire [1:0] _GEN_446 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_dst_rtype :
    subDecUnit0_io_subuop_dst_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_447 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_dst_rtype :
    subDecUnit1_io_subuop_dst_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_448 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_dst_rtype :
    subDecUnit2_io_subuop_dst_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_449 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_dst_rtype :
    subDecUnit3_io_subuop_dst_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_450 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ldst_val : subDecUnit0_io_subuop_ldst_val; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_451 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ldst_val : subDecUnit1_io_subuop_ldst_val; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_452 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ldst_val : subDecUnit2_io_subuop_ldst_val; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_453 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ldst_val : subDecUnit3_io_subuop_ldst_val; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _appended_subuops_T_1740_lrs3 = SubDecodeUnit_io_subuop_lrs3; // @[decode.scala 797:46 decode.scala 797:46]
  wire [5:0] _GEN_454 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs3 : subDecUnit0_io_subuop_lrs3; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_455 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs3 : subDecUnit1_io_subuop_lrs3; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_456 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs3 : subDecUnit2_io_subuop_lrs3; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_457 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs3 : subDecUnit3_io_subuop_lrs3; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _appended_subuops_T_1740_lrs2 = SubDecodeUnit_io_subuop_lrs2; // @[decode.scala 797:46 decode.scala 797:46]
  wire [5:0] _GEN_458 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs2 : subDecUnit0_io_subuop_lrs2; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_459 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs2 : subDecUnit1_io_subuop_lrs2; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_460 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs2 : subDecUnit2_io_subuop_lrs2; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_461 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs2 : subDecUnit3_io_subuop_lrs2; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _appended_subuops_T_1740_lrs1 = SubDecodeUnit_io_subuop_lrs1; // @[decode.scala 797:46 decode.scala 797:46]
  wire [5:0] _GEN_462 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs1 : subDecUnit0_io_subuop_lrs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_463 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs1 : subDecUnit1_io_subuop_lrs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_464 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs1 : subDecUnit2_io_subuop_lrs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_465 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs1 : subDecUnit3_io_subuop_lrs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _appended_subuops_T_1740_ldst = SubDecodeUnit_io_subuop_ldst; // @[decode.scala 797:46 decode.scala 797:46]
  wire [5:0] _GEN_466 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ldst : subDecUnit0_io_subuop_ldst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_467 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ldst : subDecUnit1_io_subuop_ldst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_468 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ldst : subDecUnit2_io_subuop_ldst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_469 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ldst : subDecUnit3_io_subuop_ldst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_470 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ldst_is_rs1 :
    subDecUnit0_io_subuop_ldst_is_rs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_471 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ldst_is_rs1 :
    subDecUnit1_io_subuop_ldst_is_rs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_472 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ldst_is_rs1 :
    subDecUnit2_io_subuop_ldst_is_rs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_473 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ldst_is_rs1 :
    subDecUnit3_io_subuop_ldst_is_rs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_474 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_flush_on_commit :
    subDecUnit0_io_subuop_flush_on_commit; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_475 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_flush_on_commit :
    subDecUnit1_io_subuop_flush_on_commit; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_476 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_flush_on_commit :
    subDecUnit2_io_subuop_flush_on_commit; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_477 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_flush_on_commit :
    subDecUnit3_io_subuop_flush_on_commit; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_478 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_unique : subDecUnit0_io_subuop_is_unique; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_479 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_unique : subDecUnit1_io_subuop_is_unique; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_480 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_unique : subDecUnit2_io_subuop_is_unique; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_481 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_unique : subDecUnit3_io_subuop_is_unique; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_482 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_sys_pc2epc :
    subDecUnit0_io_subuop_is_sys_pc2epc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_483 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_sys_pc2epc :
    subDecUnit1_io_subuop_is_sys_pc2epc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_484 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_sys_pc2epc :
    subDecUnit2_io_subuop_is_sys_pc2epc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_485 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_sys_pc2epc :
    subDecUnit3_io_subuop_is_sys_pc2epc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_486 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_uses_stq : subDecUnit0_io_subuop_uses_stq; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_487 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_uses_stq : subDecUnit1_io_subuop_uses_stq; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_488 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_uses_stq : subDecUnit2_io_subuop_uses_stq; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_489 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_uses_stq : subDecUnit3_io_subuop_uses_stq; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_490 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_uses_ldq : subDecUnit0_io_subuop_uses_ldq; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_491 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_uses_ldq : subDecUnit1_io_subuop_uses_ldq; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_492 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_uses_ldq : subDecUnit2_io_subuop_uses_ldq; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_493 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_uses_ldq : subDecUnit3_io_subuop_uses_ldq; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_494 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_amo : subDecUnit0_io_subuop_is_amo; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_495 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_amo : subDecUnit1_io_subuop_is_amo; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_496 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_amo : subDecUnit2_io_subuop_is_amo; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_497 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_amo : subDecUnit3_io_subuop_is_amo; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_498 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_fencei : subDecUnit0_io_subuop_is_fencei; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_499 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_fencei : subDecUnit1_io_subuop_is_fencei; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_500 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_fencei : subDecUnit2_io_subuop_is_fencei; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_501 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_fencei : subDecUnit3_io_subuop_is_fencei; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_502 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_fence : subDecUnit0_io_subuop_is_fence; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_503 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_fence : subDecUnit1_io_subuop_is_fence; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_504 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_fence : subDecUnit2_io_subuop_is_fence; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_505 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_fence : subDecUnit3_io_subuop_is_fence; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_506 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_mem_signed :
    subDecUnit0_io_subuop_mem_signed; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_507 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_mem_signed :
    subDecUnit1_io_subuop_mem_signed; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_508 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_mem_signed :
    subDecUnit2_io_subuop_mem_signed; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_509 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_mem_signed :
    subDecUnit3_io_subuop_mem_signed; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _appended_subuops_T_1740_mem_size = SubDecodeUnit_io_subuop_mem_size; // @[decode.scala 797:46 decode.scala 797:46]
  wire [1:0] _GEN_510 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_mem_size :
    subDecUnit0_io_subuop_mem_size; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_511 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_mem_size :
    subDecUnit1_io_subuop_mem_size; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_512 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_mem_size :
    subDecUnit2_io_subuop_mem_size; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_513 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_mem_size :
    subDecUnit3_io_subuop_mem_size; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _appended_subuops_T_1740_mem_cmd = SubDecodeUnit_io_subuop_mem_cmd; // @[decode.scala 797:46 decode.scala 797:46]
  wire [4:0] _GEN_514 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_mem_cmd :
    subDecUnit0_io_subuop_mem_cmd; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_515 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_mem_cmd :
    subDecUnit1_io_subuop_mem_cmd; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_516 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_mem_cmd :
    subDecUnit2_io_subuop_mem_cmd; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_517 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_mem_cmd :
    subDecUnit3_io_subuop_mem_cmd; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_518 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bypassable :
    subDecUnit0_io_subuop_bypassable; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_519 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bypassable :
    subDecUnit1_io_subuop_bypassable; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_520 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bypassable :
    subDecUnit2_io_subuop_bypassable; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_521 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_bypassable :
    subDecUnit3_io_subuop_bypassable; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [63:0] _appended_subuops_T_1740_exc_cause = SubDecodeUnit_io_subuop_exc_cause; // @[decode.scala 797:46 decode.scala 797:46]
  wire [63:0] _GEN_522 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_exc_cause :
    subDecUnit0_io_subuop_exc_cause; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [63:0] _GEN_523 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_exc_cause :
    subDecUnit1_io_subuop_exc_cause; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [63:0] _GEN_524 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_exc_cause :
    subDecUnit2_io_subuop_exc_cause; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [63:0] _GEN_525 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_exc_cause :
    subDecUnit3_io_subuop_exc_cause; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_526 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_exception : subDecUnit0_io_subuop_exception; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_527 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_exception : subDecUnit1_io_subuop_exception; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_528 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_exception : subDecUnit2_io_subuop_exception; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_529 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_exception : subDecUnit3_io_subuop_exception; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _appended_subuops_T_1740_stale_pdst = SubDecodeUnit_io_subuop_stale_pdst; // @[decode.scala 797:46 decode.scala 797:46]
  wire [6:0] _GEN_530 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stale_pdst :
    subDecUnit0_io_subuop_stale_pdst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_531 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stale_pdst :
    subDecUnit1_io_subuop_stale_pdst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_532 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stale_pdst :
    subDecUnit2_io_subuop_stale_pdst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_533 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stale_pdst :
    subDecUnit3_io_subuop_stale_pdst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_534 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ppred_busy :
    subDecUnit0_io_subuop_ppred_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_535 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ppred_busy :
    subDecUnit1_io_subuop_ppred_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_536 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ppred_busy :
    subDecUnit2_io_subuop_ppred_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_537 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ppred_busy :
    subDecUnit3_io_subuop_ppred_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_538 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs3_busy : subDecUnit0_io_subuop_prs3_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_539 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs3_busy : subDecUnit1_io_subuop_prs3_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_540 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs3_busy : subDecUnit2_io_subuop_prs3_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_541 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs3_busy : subDecUnit3_io_subuop_prs3_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_542 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs2_busy : subDecUnit0_io_subuop_prs2_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_543 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs2_busy : subDecUnit1_io_subuop_prs2_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_544 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs2_busy : subDecUnit2_io_subuop_prs2_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_545 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs2_busy : subDecUnit3_io_subuop_prs2_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_546 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs1_busy : subDecUnit0_io_subuop_prs1_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_547 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs1_busy : subDecUnit1_io_subuop_prs1_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_548 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs1_busy : subDecUnit2_io_subuop_prs1_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_549 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_prs1_busy : subDecUnit3_io_subuop_prs1_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _appended_subuops_T_1740_ppred = SubDecodeUnit_io_subuop_ppred; // @[decode.scala 797:46 decode.scala 797:46]
  wire [4:0] _GEN_550 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ppred : subDecUnit0_io_subuop_ppred; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_551 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ppred : subDecUnit1_io_subuop_ppred; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_552 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ppred : subDecUnit2_io_subuop_ppred; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_553 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ppred : subDecUnit3_io_subuop_ppred; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _appended_subuops_T_1740_prs3 = SubDecodeUnit_io_subuop_prs3; // @[decode.scala 797:46 decode.scala 797:46]
  wire [6:0] _GEN_554 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs3 : subDecUnit0_io_subuop_prs3; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_555 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs3 : subDecUnit1_io_subuop_prs3; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_556 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs3 : subDecUnit2_io_subuop_prs3; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_557 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs3 : subDecUnit3_io_subuop_prs3; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _appended_subuops_T_1740_prs2 = SubDecodeUnit_io_subuop_prs2; // @[decode.scala 797:46 decode.scala 797:46]
  wire [6:0] _GEN_558 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs2 : subDecUnit0_io_subuop_prs2; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_559 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs2 : subDecUnit1_io_subuop_prs2; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_560 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs2 : subDecUnit2_io_subuop_prs2; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_561 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs2 : subDecUnit3_io_subuop_prs2; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _appended_subuops_T_1740_prs1 = SubDecodeUnit_io_subuop_prs1; // @[decode.scala 797:46 decode.scala 797:46]
  wire [6:0] _GEN_562 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs1 : subDecUnit0_io_subuop_prs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_563 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs1 : subDecUnit1_io_subuop_prs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_564 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs1 : subDecUnit2_io_subuop_prs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_565 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prs1 : subDecUnit3_io_subuop_prs1; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _appended_subuops_T_1740_pdst = SubDecodeUnit_io_subuop_pdst; // @[decode.scala 797:46 decode.scala 797:46]
  wire [6:0] _GEN_566 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pdst : subDecUnit0_io_subuop_pdst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_567 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pdst : subDecUnit1_io_subuop_pdst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_568 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pdst : subDecUnit2_io_subuop_pdst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_569 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pdst : subDecUnit3_io_subuop_pdst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _appended_subuops_T_1740_rxq_idx = SubDecodeUnit_io_subuop_rxq_idx; // @[decode.scala 797:46 decode.scala 797:46]
  wire [1:0] _GEN_570 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rxq_idx :
    subDecUnit0_io_subuop_rxq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_571 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rxq_idx :
    subDecUnit1_io_subuop_rxq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_572 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rxq_idx :
    subDecUnit2_io_subuop_rxq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_573 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rxq_idx :
    subDecUnit3_io_subuop_rxq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _appended_subuops_T_1740_stq_idx = SubDecodeUnit_io_subuop_stq_idx; // @[decode.scala 797:46 decode.scala 797:46]
  wire [4:0] _GEN_574 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stq_idx :
    subDecUnit0_io_subuop_stq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_575 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stq_idx :
    subDecUnit1_io_subuop_stq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_576 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stq_idx :
    subDecUnit2_io_subuop_stq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_577 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stq_idx :
    subDecUnit3_io_subuop_stq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _appended_subuops_T_1740_ldq_idx = SubDecodeUnit_io_subuop_ldq_idx; // @[decode.scala 797:46 decode.scala 797:46]
  wire [4:0] _GEN_578 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ldq_idx :
    subDecUnit0_io_subuop_ldq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_579 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ldq_idx :
    subDecUnit1_io_subuop_ldq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_580 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ldq_idx :
    subDecUnit2_io_subuop_ldq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_581 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ldq_idx :
    subDecUnit3_io_subuop_ldq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _appended_subuops_T_1740_rob_idx = SubDecodeUnit_io_subuop_rob_idx; // @[decode.scala 797:46 decode.scala 797:46]
  wire [5:0] _GEN_582 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rob_idx :
    subDecUnit0_io_subuop_rob_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_583 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rob_idx :
    subDecUnit1_io_subuop_rob_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_584 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rob_idx :
    subDecUnit2_io_subuop_rob_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_585 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rob_idx :
    subDecUnit3_io_subuop_rob_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [11:0] _appended_subuops_T_1740_csr_addr = SubDecodeUnit_io_subuop_csr_addr; // @[decode.scala 797:46 decode.scala 797:46]
  wire [11:0] _GEN_586 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_csr_addr :
    subDecUnit0_io_subuop_csr_addr; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [11:0] _GEN_587 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_csr_addr :
    subDecUnit1_io_subuop_csr_addr; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [11:0] _GEN_588 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_csr_addr :
    subDecUnit2_io_subuop_csr_addr; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [11:0] _GEN_589 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_csr_addr :
    subDecUnit3_io_subuop_csr_addr; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [19:0] _appended_subuops_T_1740_imm_packed = SubDecodeUnit_io_subuop_imm_packed; // @[decode.scala 797:46 decode.scala 797:46]
  wire [19:0] _GEN_590 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_imm_packed :
    subDecUnit0_io_subuop_imm_packed; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [19:0] _GEN_591 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_imm_packed :
    subDecUnit1_io_subuop_imm_packed; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [19:0] _GEN_592 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_imm_packed :
    subDecUnit2_io_subuop_imm_packed; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [19:0] _GEN_593 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_imm_packed :
    subDecUnit3_io_subuop_imm_packed; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_594 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_taken : subDecUnit0_io_subuop_taken; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_595 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_taken : subDecUnit1_io_subuop_taken; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_596 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_taken : subDecUnit2_io_subuop_taken; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_597 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_taken : subDecUnit3_io_subuop_taken; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _appended_subuops_T_1740_pc_lob = SubDecodeUnit_io_subuop_pc_lob; // @[decode.scala 797:46 decode.scala 797:46]
  wire [5:0] _GEN_598 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pc_lob : subDecUnit0_io_subuop_pc_lob; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_599 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pc_lob : subDecUnit1_io_subuop_pc_lob; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_600 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pc_lob : subDecUnit2_io_subuop_pc_lob; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_601 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pc_lob : subDecUnit3_io_subuop_pc_lob; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_602 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_edge_inst : subDecUnit0_io_subuop_edge_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_603 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_edge_inst : subDecUnit1_io_subuop_edge_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_604 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_edge_inst : subDecUnit2_io_subuop_edge_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_605 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_edge_inst : subDecUnit3_io_subuop_edge_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _appended_subuops_T_1740_ftq_idx = SubDecodeUnit_io_subuop_ftq_idx; // @[decode.scala 797:46 decode.scala 797:46]
  wire [4:0] _GEN_606 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ftq_idx :
    subDecUnit0_io_subuop_ftq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_607 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ftq_idx :
    subDecUnit1_io_subuop_ftq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_608 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ftq_idx :
    subDecUnit2_io_subuop_ftq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [4:0] _GEN_609 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ftq_idx :
    subDecUnit3_io_subuop_ftq_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _appended_subuops_T_1740_br_tag = SubDecodeUnit_io_subuop_br_tag; // @[decode.scala 797:46 decode.scala 797:46]
  wire [3:0] _GEN_610 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_br_tag : subDecUnit0_io_subuop_br_tag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_611 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_br_tag : subDecUnit1_io_subuop_br_tag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_612 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_br_tag : subDecUnit2_io_subuop_br_tag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_613 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_br_tag : subDecUnit3_io_subuop_br_tag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [11:0] _appended_subuops_T_1740_br_mask = SubDecodeUnit_io_subuop_br_mask; // @[decode.scala 797:46 decode.scala 797:46]
  wire [11:0] _GEN_614 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_br_mask :
    subDecUnit0_io_subuop_br_mask; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [11:0] _GEN_615 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_br_mask :
    subDecUnit1_io_subuop_br_mask; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [11:0] _GEN_616 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_br_mask :
    subDecUnit2_io_subuop_br_mask; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [11:0] _GEN_617 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_br_mask :
    subDecUnit3_io_subuop_br_mask; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_618 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_sfb : subDecUnit0_io_subuop_is_sfb; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_619 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_sfb : subDecUnit1_io_subuop_is_sfb; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_620 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_sfb : subDecUnit2_io_subuop_is_sfb; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_621 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_sfb : subDecUnit3_io_subuop_is_sfb; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_622 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_jal : subDecUnit0_io_subuop_is_jal; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_623 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_jal : subDecUnit1_io_subuop_is_jal; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_624 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_jal : subDecUnit2_io_subuop_is_jal; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_625 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_jal : subDecUnit3_io_subuop_is_jal; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_626 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_jalr : subDecUnit0_io_subuop_is_jalr; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_627 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_jalr : subDecUnit1_io_subuop_is_jalr; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_628 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_jalr : subDecUnit2_io_subuop_is_jalr; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_629 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_jalr : subDecUnit3_io_subuop_is_jalr; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_630 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_br : subDecUnit0_io_subuop_is_br; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_631 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_br : subDecUnit1_io_subuop_is_br; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_632 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_br : subDecUnit2_io_subuop_is_br; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_633 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_br : subDecUnit3_io_subuop_is_br; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_634 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_iw_p2_poisoned :
    subDecUnit0_io_subuop_iw_p2_poisoned; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_635 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_iw_p2_poisoned :
    subDecUnit1_io_subuop_iw_p2_poisoned; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_636 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_iw_p2_poisoned :
    subDecUnit2_io_subuop_iw_p2_poisoned; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_637 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_iw_p2_poisoned :
    subDecUnit3_io_subuop_iw_p2_poisoned; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_638 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_iw_p1_poisoned :
    subDecUnit0_io_subuop_iw_p1_poisoned; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_639 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_iw_p1_poisoned :
    subDecUnit1_io_subuop_iw_p1_poisoned; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_640 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_iw_p1_poisoned :
    subDecUnit2_io_subuop_iw_p1_poisoned; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_641 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_iw_p1_poisoned :
    subDecUnit3_io_subuop_iw_p1_poisoned; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _appended_subuops_T_1740_iw_state = SubDecodeUnit_io_subuop_iw_state; // @[decode.scala 797:46 decode.scala 797:46]
  wire [1:0] _GEN_642 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_iw_state :
    subDecUnit0_io_subuop_iw_state; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_643 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_iw_state :
    subDecUnit1_io_subuop_iw_state; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_644 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_iw_state :
    subDecUnit2_io_subuop_iw_state; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_645 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_iw_state :
    subDecUnit3_io_subuop_iw_state; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _appended_subuops_T_1740_ctrl_op3_sel = SubDecodeUnit_io_subuop_ctrl_op3_sel; // @[decode.scala 797:46 decode.scala 797:46]
  wire [1:0] _GEN_646 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op3_sel :
    subDecUnit0_io_subuop_ctrl_op3_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_647 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op3_sel :
    subDecUnit1_io_subuop_ctrl_op3_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_648 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op3_sel :
    subDecUnit2_io_subuop_ctrl_op3_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_649 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op3_sel :
    subDecUnit3_io_subuop_ctrl_op3_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_650 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_std :
    subDecUnit0_io_subuop_ctrl_is_std; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_651 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_std :
    subDecUnit1_io_subuop_ctrl_is_std; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_652 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_std :
    subDecUnit2_io_subuop_ctrl_is_std; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_653 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_std :
    subDecUnit3_io_subuop_ctrl_is_std; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_654 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_sta :
    subDecUnit0_io_subuop_ctrl_is_sta; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_655 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_sta :
    subDecUnit1_io_subuop_ctrl_is_sta; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_656 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_sta :
    subDecUnit2_io_subuop_ctrl_is_sta; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_657 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_sta :
    subDecUnit3_io_subuop_ctrl_is_sta; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_658 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_load :
    subDecUnit0_io_subuop_ctrl_is_load; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_659 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_load :
    subDecUnit1_io_subuop_ctrl_is_load; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_660 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_load :
    subDecUnit2_io_subuop_ctrl_is_load; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_661 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_is_load :
    subDecUnit3_io_subuop_ctrl_is_load; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _appended_subuops_T_1740_ctrl_csr_cmd = SubDecodeUnit_io_subuop_ctrl_csr_cmd; // @[decode.scala 797:46 decode.scala 797:46]
  wire [2:0] _GEN_662 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_csr_cmd :
    subDecUnit0_io_subuop_ctrl_csr_cmd; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_663 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_csr_cmd :
    subDecUnit1_io_subuop_ctrl_csr_cmd; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_664 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_csr_cmd :
    subDecUnit2_io_subuop_ctrl_csr_cmd; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_665 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_csr_cmd :
    subDecUnit3_io_subuop_ctrl_csr_cmd; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_666 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_fcn_dw :
    subDecUnit0_io_subuop_ctrl_fcn_dw; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_667 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_fcn_dw :
    subDecUnit1_io_subuop_ctrl_fcn_dw; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_668 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_fcn_dw :
    subDecUnit2_io_subuop_ctrl_fcn_dw; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_669 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_ctrl_fcn_dw :
    subDecUnit3_io_subuop_ctrl_fcn_dw; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _appended_subuops_T_1740_ctrl_op_fcn = SubDecodeUnit_io_subuop_ctrl_op_fcn; // @[decode.scala 797:46 decode.scala 797:46]
  wire [3:0] _GEN_670 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op_fcn :
    subDecUnit0_io_subuop_ctrl_op_fcn; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_671 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op_fcn :
    subDecUnit1_io_subuop_ctrl_op_fcn; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_672 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op_fcn :
    subDecUnit2_io_subuop_ctrl_op_fcn; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_673 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op_fcn :
    subDecUnit3_io_subuop_ctrl_op_fcn; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _appended_subuops_T_1740_ctrl_imm_sel = SubDecodeUnit_io_subuop_ctrl_imm_sel; // @[decode.scala 797:46 decode.scala 797:46]
  wire [2:0] _GEN_674 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_imm_sel :
    subDecUnit0_io_subuop_ctrl_imm_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_675 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_imm_sel :
    subDecUnit1_io_subuop_ctrl_imm_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_676 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_imm_sel :
    subDecUnit2_io_subuop_ctrl_imm_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_677 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_imm_sel :
    subDecUnit3_io_subuop_ctrl_imm_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _appended_subuops_T_1740_ctrl_op2_sel = SubDecodeUnit_io_subuop_ctrl_op2_sel; // @[decode.scala 797:46 decode.scala 797:46]
  wire [2:0] _GEN_678 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op2_sel :
    subDecUnit0_io_subuop_ctrl_op2_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_679 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op2_sel :
    subDecUnit1_io_subuop_ctrl_op2_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_680 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op2_sel :
    subDecUnit2_io_subuop_ctrl_op2_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_681 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op2_sel :
    subDecUnit3_io_subuop_ctrl_op2_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _appended_subuops_T_1740_ctrl_op1_sel = SubDecodeUnit_io_subuop_ctrl_op1_sel; // @[decode.scala 797:46 decode.scala 797:46]
  wire [1:0] _GEN_682 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op1_sel :
    subDecUnit0_io_subuop_ctrl_op1_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_683 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op1_sel :
    subDecUnit1_io_subuop_ctrl_op1_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_684 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op1_sel :
    subDecUnit2_io_subuop_ctrl_op1_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_685 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_op1_sel :
    subDecUnit3_io_subuop_ctrl_op1_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _appended_subuops_T_1740_ctrl_br_type = SubDecodeUnit_io_subuop_ctrl_br_type; // @[decode.scala 797:46 decode.scala 797:46]
  wire [3:0] _GEN_686 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_br_type :
    subDecUnit0_io_subuop_ctrl_br_type; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_687 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_br_type :
    subDecUnit1_io_subuop_ctrl_br_type; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_688 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_br_type :
    subDecUnit2_io_subuop_ctrl_br_type; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_689 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_ctrl_br_type :
    subDecUnit3_io_subuop_ctrl_br_type; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [9:0] _appended_subuops_T_1740_fu_code = SubDecodeUnit_io_subuop_fu_code; // @[decode.scala 797:46 decode.scala 797:46]
  wire [9:0] _GEN_690 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_fu_code :
    subDecUnit0_io_subuop_fu_code; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [9:0] _GEN_691 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_fu_code :
    subDecUnit1_io_subuop_fu_code; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [9:0] _GEN_692 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_fu_code :
    subDecUnit2_io_subuop_fu_code; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [9:0] _GEN_693 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_fu_code :
    subDecUnit3_io_subuop_fu_code; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _appended_subuops_T_1740_iq_type = SubDecodeUnit_io_subuop_iq_type; // @[decode.scala 797:46 decode.scala 797:46]
  wire [2:0] _GEN_694 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_iq_type :
    subDecUnit0_io_subuop_iq_type; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_695 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_iq_type :
    subDecUnit1_io_subuop_iq_type; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_696 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_iq_type :
    subDecUnit2_io_subuop_iq_type; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_697 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_iq_type :
    subDecUnit3_io_subuop_iq_type; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [39:0] _appended_subuops_T_1740_debug_pc = SubDecodeUnit_io_subuop_debug_pc; // @[decode.scala 797:46 decode.scala 797:46]
  wire [39:0] _GEN_698 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_pc :
    subDecUnit0_io_subuop_debug_pc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [39:0] _GEN_699 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_pc :
    subDecUnit1_io_subuop_debug_pc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [39:0] _GEN_700 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_pc :
    subDecUnit2_io_subuop_debug_pc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [39:0] _GEN_701 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_pc :
    subDecUnit3_io_subuop_debug_pc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_702 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_rvc : subDecUnit0_io_subuop_is_rvc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_703 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_rvc : subDecUnit1_io_subuop_is_rvc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_704 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_rvc : subDecUnit2_io_subuop_is_rvc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_705 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_rvc : subDecUnit3_io_subuop_is_rvc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [31:0] _appended_subuops_T_1740_debug_inst = SubDecodeUnit_io_subuop_debug_inst; // @[decode.scala 797:46 decode.scala 797:46]
  wire [31:0] _GEN_706 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_inst :
    subDecUnit0_io_subuop_debug_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [31:0] _GEN_707 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_inst :
    subDecUnit1_io_subuop_debug_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [31:0] _GEN_708 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_inst :
    subDecUnit2_io_subuop_debug_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [31:0] _GEN_709 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_debug_inst :
    subDecUnit3_io_subuop_debug_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [31:0] _appended_subuops_T_1740_inst = SubDecodeUnit_io_subuop_inst; // @[decode.scala 797:46 decode.scala 797:46]
  wire [31:0] _GEN_710 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_inst : subDecUnit0_io_subuop_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [31:0] _GEN_711 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_inst : subDecUnit1_io_subuop_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [31:0] _GEN_712 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_inst : subDecUnit2_io_subuop_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [31:0] _GEN_713 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_inst : subDecUnit3_io_subuop_inst; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _appended_subuops_T_1740_uopc = SubDecodeUnit_io_subuop_uopc; // @[decode.scala 797:46 decode.scala 797:46]
  wire [6:0] _GEN_714 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_uopc : subDecUnit0_io_subuop_uopc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_715 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_uopc : subDecUnit1_io_subuop_uopc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_716 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_uopc : subDecUnit2_io_subuop_uopc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [6:0] _GEN_717 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_uopc : subDecUnit3_io_subuop_uopc; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _appended_subuops_T_1740_address_num = SubDecodeUnit_io_subuop_address_num; // @[decode.scala 797:46 decode.scala 797:46]
  wire [5:0] _GEN_718 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_address_num :
    subDecUnit0_io_subuop_address_num; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_719 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_address_num :
    subDecUnit1_io_subuop_address_num; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_720 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_address_num :
    subDecUnit2_io_subuop_address_num; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_721 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_address_num :
    subDecUnit3_io_subuop_address_num; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _appended_subuops_T_1740_rob_inst_idx = SubDecodeUnit_io_subuop_rob_inst_idx; // @[decode.scala 797:46 decode.scala 797:46]
  wire [5:0] _GEN_722 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rob_inst_idx :
    subDecUnit0_io_subuop_rob_inst_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_723 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rob_inst_idx :
    subDecUnit1_io_subuop_rob_inst_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_724 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rob_inst_idx :
    subDecUnit2_io_subuop_rob_inst_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_725 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_rob_inst_idx :
    subDecUnit3_io_subuop_rob_inst_idx; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _appended_subuops_T_1740_self_index = SubDecodeUnit_io_subuop_self_index; // @[decode.scala 797:46 decode.scala 797:46]
  wire [5:0] _GEN_726 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_self_index :
    subDecUnit0_io_subuop_self_index; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_727 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_self_index :
    subDecUnit1_io_subuop_self_index; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_728 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_self_index :
    subDecUnit2_io_subuop_self_index; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_729 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_self_index :
    subDecUnit3_io_subuop_self_index; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _appended_subuops_T_1740_split_num = SubDecodeUnit_io_subuop_split_num; // @[decode.scala 797:46 decode.scala 797:46]
  wire [5:0] _GEN_730 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_split_num :
    subDecUnit0_io_subuop_split_num; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_731 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_split_num :
    subDecUnit1_io_subuop_split_num; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_732 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_split_num :
    subDecUnit2_io_subuop_split_num; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [5:0] _GEN_733 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_split_num :
    subDecUnit3_io_subuop_split_num; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _appended_subuops_T_1740_op2_sel = SubDecodeUnit_io_subuop_op2_sel; // @[decode.scala 797:46 decode.scala 797:46]
  wire [3:0] _GEN_734 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_op2_sel :
    subDecUnit0_io_subuop_op2_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_735 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_op2_sel :
    subDecUnit1_io_subuop_op2_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_736 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_op2_sel :
    subDecUnit2_io_subuop_op2_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_737 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_op2_sel :
    subDecUnit3_io_subuop_op2_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _appended_subuops_T_1740_op1_sel = SubDecodeUnit_io_subuop_op1_sel; // @[decode.scala 797:46 decode.scala 797:46]
  wire [3:0] _GEN_738 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_op1_sel :
    subDecUnit0_io_subuop_op1_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_739 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_op1_sel :
    subDecUnit1_io_subuop_op1_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_740 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_op1_sel :
    subDecUnit2_io_subuop_op1_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_741 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_op1_sel :
    subDecUnit3_io_subuop_op1_sel; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _appended_subuops_T_1740_stale_pflag = SubDecodeUnit_io_subuop_stale_pflag; // @[decode.scala 797:46 decode.scala 797:46]
  wire [3:0] _GEN_742 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stale_pflag :
    subDecUnit0_io_subuop_stale_pflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_743 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stale_pflag :
    subDecUnit1_io_subuop_stale_pflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_744 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stale_pflag :
    subDecUnit2_io_subuop_stale_pflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_745 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_stale_pflag :
    subDecUnit3_io_subuop_stale_pflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_746 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_pflag_busy :
    subDecUnit0_io_subuop_pflag_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_747 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_pflag_busy :
    subDecUnit1_io_subuop_pflag_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_748 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_pflag_busy :
    subDecUnit2_io_subuop_pflag_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_749 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_pflag_busy :
    subDecUnit3_io_subuop_pflag_busy; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _appended_subuops_T_1740_pwflag = SubDecodeUnit_io_subuop_pwflag; // @[decode.scala 797:46 decode.scala 797:46]
  wire [3:0] _GEN_750 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pwflag : subDecUnit0_io_subuop_pwflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_751 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pwflag : subDecUnit1_io_subuop_pwflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_752 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pwflag : subDecUnit2_io_subuop_pwflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_753 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_pwflag : subDecUnit3_io_subuop_pwflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _appended_subuops_T_1740_prflag = SubDecodeUnit_io_subuop_prflag; // @[decode.scala 797:46 decode.scala 797:46]
  wire [3:0] _GEN_754 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prflag : subDecUnit0_io_subuop_prflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_755 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prflag : subDecUnit1_io_subuop_prflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_756 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prflag : subDecUnit2_io_subuop_prflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [3:0] _GEN_757 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_prflag : subDecUnit3_io_subuop_prflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_758 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_wflag : subDecUnit0_io_subuop_wflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_759 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_wflag : subDecUnit1_io_subuop_wflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_760 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_wflag : subDecUnit2_io_subuop_wflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_761 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_wflag : subDecUnit3_io_subuop_wflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_762 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_rflag : subDecUnit0_io_subuop_rflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_763 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_rflag : subDecUnit1_io_subuop_rflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_764 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_rflag : subDecUnit2_io_subuop_rflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_765 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_rflag : subDecUnit3_io_subuop_rflag; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _appended_subuops_T_1740_lrs3_rtype = SubDecodeUnit_io_subuop_lrs3_rtype; // @[decode.scala 797:46 decode.scala 797:46]
  wire [1:0] _GEN_766 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs3_rtype :
    subDecUnit0_io_subuop_lrs3_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_767 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs3_rtype :
    subDecUnit1_io_subuop_lrs3_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_768 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs3_rtype :
    subDecUnit2_io_subuop_lrs3_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [1:0] _GEN_769 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_lrs3_rtype :
    subDecUnit3_io_subuop_lrs3_rtype; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _appended_subuops_T_1740_shift = SubDecodeUnit_io_subuop_shift; // @[decode.scala 797:46 decode.scala 797:46]
  wire [2:0] _GEN_770 = 2'h0 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_shift : subDecUnit0_io_subuop_shift; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_771 = 2'h1 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_shift : subDecUnit1_io_subuop_shift; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_772 = 2'h2 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_shift : subDecUnit2_io_subuop_shift; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [2:0] _GEN_773 = 2'h3 == cs_sub0_split_num[1:0] ? _appended_subuops_T_1740_shift : subDecUnit3_io_subuop_shift; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_774 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_unicore :
    subDecUnit0_io_subuop_is_unicore; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_775 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_unicore :
    subDecUnit1_io_subuop_is_unicore; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_776 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_unicore :
    subDecUnit2_io_subuop_is_unicore; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_777 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_is_unicore :
    subDecUnit3_io_subuop_is_unicore; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_778 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_switch_off :
    subDecUnit0_io_subuop_switch_off; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_779 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_switch_off :
    subDecUnit1_io_subuop_switch_off; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_780 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_switch_off :
    subDecUnit2_io_subuop_switch_off; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_781 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_switch_off :
    subDecUnit3_io_subuop_switch_off; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_782 = 2'h0 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_switch : subDecUnit0_io_subuop_switch; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_783 = 2'h1 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_switch : subDecUnit1_io_subuop_switch; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_784 = 2'h2 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_switch : subDecUnit2_io_subuop_switch; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire  _GEN_785 = 2'h3 == cs_sub0_split_num[1:0] ? SubDecodeUnit_io_subuop_switch : subDecUnit3_io_subuop_switch; // @[decode.scala 797:46 decode.scala 797:46 decode.scala 789:33]
  wire [31:0] _GEN_786 = 2'h0 == cs_sub0_split_num[1:0] ? io_enq_uop_inst : _GEN_710; // @[decode.scala 798:46 decode.scala 798:46]
  wire [31:0] _GEN_787 = 2'h1 == cs_sub0_split_num[1:0] ? io_enq_uop_inst : _GEN_711; // @[decode.scala 798:46 decode.scala 798:46]
  wire [31:0] _GEN_788 = 2'h2 == cs_sub0_split_num[1:0] ? io_enq_uop_inst : _GEN_712; // @[decode.scala 798:46 decode.scala 798:46]
  wire [31:0] _GEN_789 = 2'h3 == cs_sub0_split_num[1:0] ? io_enq_uop_inst : _GEN_713; // @[decode.scala 798:46 decode.scala 798:46]
  wire [1:0] appended_subuops_0_debug_tsrc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_398 :
    subDecUnit0_io_subuop_debug_tsrc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_1_debug_tsrc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_399 :
    subDecUnit1_io_subuop_debug_tsrc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_2_debug_tsrc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_400 :
    subDecUnit2_io_subuop_debug_tsrc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_3_debug_tsrc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_401 :
    subDecUnit3_io_subuop_debug_tsrc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_0_debug_fsrc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_402 :
    subDecUnit0_io_subuop_debug_fsrc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_1_debug_fsrc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_403 :
    subDecUnit1_io_subuop_debug_fsrc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_2_debug_fsrc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_404 :
    subDecUnit2_io_subuop_debug_fsrc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_3_debug_fsrc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_405 :
    subDecUnit3_io_subuop_debug_fsrc; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_bp_xcpt_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_406 :
    subDecUnit0_io_subuop_bp_xcpt_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_bp_xcpt_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_407 :
    subDecUnit1_io_subuop_bp_xcpt_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_bp_xcpt_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_408 :
    subDecUnit2_io_subuop_bp_xcpt_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_bp_xcpt_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_409 :
    subDecUnit3_io_subuop_bp_xcpt_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_bp_debug_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_410 :
    subDecUnit0_io_subuop_bp_debug_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_bp_debug_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_411 :
    subDecUnit1_io_subuop_bp_debug_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_bp_debug_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_412 :
    subDecUnit2_io_subuop_bp_debug_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_bp_debug_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_413 :
    subDecUnit3_io_subuop_bp_debug_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_xcpt_ma_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_414 :
    subDecUnit0_io_subuop_xcpt_ma_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_xcpt_ma_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_415 :
    subDecUnit1_io_subuop_xcpt_ma_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_xcpt_ma_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_416 :
    subDecUnit2_io_subuop_xcpt_ma_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_xcpt_ma_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_417 :
    subDecUnit3_io_subuop_xcpt_ma_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_xcpt_ae_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_418 :
    subDecUnit0_io_subuop_xcpt_ae_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_xcpt_ae_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_419 :
    subDecUnit1_io_subuop_xcpt_ae_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_xcpt_ae_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_420 :
    subDecUnit2_io_subuop_xcpt_ae_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_xcpt_ae_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_421 :
    subDecUnit3_io_subuop_xcpt_ae_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_xcpt_pf_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_422 :
    subDecUnit0_io_subuop_xcpt_pf_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_xcpt_pf_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_423 :
    subDecUnit1_io_subuop_xcpt_pf_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_xcpt_pf_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_424 :
    subDecUnit2_io_subuop_xcpt_pf_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_xcpt_pf_if = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_425 :
    subDecUnit3_io_subuop_xcpt_pf_if; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_fp_single = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_426 : subDecUnit0_io_subuop_fp_single
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_fp_single = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_427 : subDecUnit1_io_subuop_fp_single
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_fp_single = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_428 : subDecUnit2_io_subuop_fp_single
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_fp_single = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_429 : subDecUnit3_io_subuop_fp_single
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_fp_val = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_430 : subDecUnit0_io_subuop_fp_val; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_fp_val = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_431 : subDecUnit1_io_subuop_fp_val; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_fp_val = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_432 : subDecUnit2_io_subuop_fp_val; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_fp_val = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_433 : subDecUnit3_io_subuop_fp_val; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_frs3_en = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_434 : subDecUnit0_io_subuop_frs3_en; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_frs3_en = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_435 : subDecUnit1_io_subuop_frs3_en; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_frs3_en = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_436 : subDecUnit2_io_subuop_frs3_en; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_frs3_en = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_437 : subDecUnit3_io_subuop_frs3_en; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_0_lrs2_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_438 :
    subDecUnit0_io_subuop_lrs2_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_1_lrs2_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_439 :
    subDecUnit1_io_subuop_lrs2_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_2_lrs2_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_440 :
    subDecUnit2_io_subuop_lrs2_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_3_lrs2_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_441 :
    subDecUnit3_io_subuop_lrs2_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_0_lrs1_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_442 :
    subDecUnit0_io_subuop_lrs1_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_1_lrs1_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_443 :
    subDecUnit1_io_subuop_lrs1_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_2_lrs1_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_444 :
    subDecUnit2_io_subuop_lrs1_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_3_lrs1_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_445 :
    subDecUnit3_io_subuop_lrs1_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_0_dst_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_446 :
    subDecUnit0_io_subuop_dst_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_1_dst_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_447 :
    subDecUnit1_io_subuop_dst_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_2_dst_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_448 :
    subDecUnit2_io_subuop_dst_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_3_dst_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_449 :
    subDecUnit3_io_subuop_dst_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_ldst_val = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_450 : subDecUnit0_io_subuop_ldst_val; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_ldst_val = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_451 : subDecUnit1_io_subuop_ldst_val; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_ldst_val = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_452 : subDecUnit2_io_subuop_ldst_val; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_ldst_val = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_453 : subDecUnit3_io_subuop_ldst_val; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_0_lrs3 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_454 : subDecUnit0_io_subuop_lrs3; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_1_lrs3 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_455 : subDecUnit1_io_subuop_lrs3; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_2_lrs3 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_456 : subDecUnit2_io_subuop_lrs3; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_3_lrs3 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_457 : subDecUnit3_io_subuop_lrs3; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_0_lrs2 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_458 : subDecUnit0_io_subuop_lrs2; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_1_lrs2 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_459 : subDecUnit1_io_subuop_lrs2; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_2_lrs2 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_460 : subDecUnit2_io_subuop_lrs2; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_3_lrs2 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_461 : subDecUnit3_io_subuop_lrs2; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_0_lrs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_462 : subDecUnit0_io_subuop_lrs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_1_lrs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_463 : subDecUnit1_io_subuop_lrs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_2_lrs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_464 : subDecUnit2_io_subuop_lrs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_3_lrs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_465 : subDecUnit3_io_subuop_lrs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_0_ldst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_466 : subDecUnit0_io_subuop_ldst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_1_ldst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_467 : subDecUnit1_io_subuop_ldst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_2_ldst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_468 : subDecUnit2_io_subuop_ldst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_3_ldst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_469 : subDecUnit3_io_subuop_ldst; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_ldst_is_rs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_470 :
    subDecUnit0_io_subuop_ldst_is_rs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_ldst_is_rs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_471 :
    subDecUnit1_io_subuop_ldst_is_rs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_ldst_is_rs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_472 :
    subDecUnit2_io_subuop_ldst_is_rs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_ldst_is_rs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_473 :
    subDecUnit3_io_subuop_ldst_is_rs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_flush_on_commit = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_474 :
    subDecUnit0_io_subuop_flush_on_commit; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_flush_on_commit = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_475 :
    subDecUnit1_io_subuop_flush_on_commit; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_flush_on_commit = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_476 :
    subDecUnit2_io_subuop_flush_on_commit; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_flush_on_commit = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_477 :
    subDecUnit3_io_subuop_flush_on_commit; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_is_unique = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_478 : subDecUnit0_io_subuop_is_unique
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_is_unique = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_479 : subDecUnit1_io_subuop_is_unique
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_is_unique = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_480 : subDecUnit2_io_subuop_is_unique
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_is_unique = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_481 : subDecUnit3_io_subuop_is_unique
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_is_sys_pc2epc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_482 :
    subDecUnit0_io_subuop_is_sys_pc2epc; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_is_sys_pc2epc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_483 :
    subDecUnit1_io_subuop_is_sys_pc2epc; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_is_sys_pc2epc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_484 :
    subDecUnit2_io_subuop_is_sys_pc2epc; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_is_sys_pc2epc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_485 :
    subDecUnit3_io_subuop_is_sys_pc2epc; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_uses_stq = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_486 : subDecUnit0_io_subuop_uses_stq; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_uses_stq = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_487 : subDecUnit1_io_subuop_uses_stq; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_uses_stq = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_488 : subDecUnit2_io_subuop_uses_stq; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_uses_stq = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_489 : subDecUnit3_io_subuop_uses_stq; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_uses_ldq = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_490 : subDecUnit0_io_subuop_uses_ldq; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_uses_ldq = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_491 : subDecUnit1_io_subuop_uses_ldq; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_uses_ldq = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_492 : subDecUnit2_io_subuop_uses_ldq; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_uses_ldq = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_493 : subDecUnit3_io_subuop_uses_ldq; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_is_amo = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_494 : subDecUnit0_io_subuop_is_amo; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_is_amo = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_495 : subDecUnit1_io_subuop_is_amo; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_is_amo = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_496 : subDecUnit2_io_subuop_is_amo; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_is_amo = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_497 : subDecUnit3_io_subuop_is_amo; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_is_fencei = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_498 : subDecUnit0_io_subuop_is_fencei
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_is_fencei = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_499 : subDecUnit1_io_subuop_is_fencei
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_is_fencei = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_500 : subDecUnit2_io_subuop_is_fencei
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_is_fencei = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_501 : subDecUnit3_io_subuop_is_fencei
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_is_fence = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_502 : subDecUnit0_io_subuop_is_fence; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_is_fence = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_503 : subDecUnit1_io_subuop_is_fence; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_is_fence = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_504 : subDecUnit2_io_subuop_is_fence; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_is_fence = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_505 : subDecUnit3_io_subuop_is_fence; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_mem_signed = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_506 :
    subDecUnit0_io_subuop_mem_signed; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_mem_signed = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_507 :
    subDecUnit1_io_subuop_mem_signed; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_mem_signed = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_508 :
    subDecUnit2_io_subuop_mem_signed; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_mem_signed = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_509 :
    subDecUnit3_io_subuop_mem_signed; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_0_mem_size = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_510 :
    subDecUnit0_io_subuop_mem_size; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_1_mem_size = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_511 :
    subDecUnit1_io_subuop_mem_size; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_2_mem_size = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_512 :
    subDecUnit2_io_subuop_mem_size; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_3_mem_size = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_513 :
    subDecUnit3_io_subuop_mem_size; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_0_mem_cmd = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_514 :
    subDecUnit0_io_subuop_mem_cmd; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_1_mem_cmd = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_515 :
    subDecUnit1_io_subuop_mem_cmd; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_2_mem_cmd = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_516 :
    subDecUnit2_io_subuop_mem_cmd; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_3_mem_cmd = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_517 :
    subDecUnit3_io_subuop_mem_cmd; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_bypassable = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_518 :
    subDecUnit0_io_subuop_bypassable; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_bypassable = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_519 :
    subDecUnit1_io_subuop_bypassable; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_bypassable = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_520 :
    subDecUnit2_io_subuop_bypassable; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_bypassable = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_521 :
    subDecUnit3_io_subuop_bypassable; // @[decode.scala 790:53 decode.scala 789:33]
  wire [63:0] appended_subuops_0_exc_cause = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_522 :
    subDecUnit0_io_subuop_exc_cause; // @[decode.scala 790:53 decode.scala 789:33]
  wire [63:0] appended_subuops_1_exc_cause = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_523 :
    subDecUnit1_io_subuop_exc_cause; // @[decode.scala 790:53 decode.scala 789:33]
  wire [63:0] appended_subuops_2_exc_cause = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_524 :
    subDecUnit2_io_subuop_exc_cause; // @[decode.scala 790:53 decode.scala 789:33]
  wire [63:0] appended_subuops_3_exc_cause = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_525 :
    subDecUnit3_io_subuop_exc_cause; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_exception = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_526 : subDecUnit0_io_subuop_exception
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_exception = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_527 : subDecUnit1_io_subuop_exception
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_exception = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_528 : subDecUnit2_io_subuop_exception
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_exception = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_529 : subDecUnit3_io_subuop_exception
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_0_stale_pdst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_530 :
    subDecUnit0_io_subuop_stale_pdst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_1_stale_pdst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_531 :
    subDecUnit1_io_subuop_stale_pdst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_2_stale_pdst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_532 :
    subDecUnit2_io_subuop_stale_pdst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_3_stale_pdst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_533 :
    subDecUnit3_io_subuop_stale_pdst; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_ppred_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_534 :
    subDecUnit0_io_subuop_ppred_busy; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_ppred_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_535 :
    subDecUnit1_io_subuop_ppred_busy; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_ppred_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_536 :
    subDecUnit2_io_subuop_ppred_busy; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_ppred_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_537 :
    subDecUnit3_io_subuop_ppred_busy; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_prs3_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_538 : subDecUnit0_io_subuop_prs3_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_prs3_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_539 : subDecUnit1_io_subuop_prs3_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_prs3_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_540 : subDecUnit2_io_subuop_prs3_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_prs3_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_541 : subDecUnit3_io_subuop_prs3_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_prs2_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_542 : subDecUnit0_io_subuop_prs2_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_prs2_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_543 : subDecUnit1_io_subuop_prs2_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_prs2_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_544 : subDecUnit2_io_subuop_prs2_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_prs2_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_545 : subDecUnit3_io_subuop_prs2_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_prs1_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_546 : subDecUnit0_io_subuop_prs1_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_prs1_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_547 : subDecUnit1_io_subuop_prs1_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_prs1_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_548 : subDecUnit2_io_subuop_prs1_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_prs1_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_549 : subDecUnit3_io_subuop_prs1_busy
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_0_ppred = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_550 : subDecUnit0_io_subuop_ppred; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_1_ppred = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_551 : subDecUnit1_io_subuop_ppred; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_2_ppred = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_552 : subDecUnit2_io_subuop_ppred; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_3_ppred = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_553 : subDecUnit3_io_subuop_ppred; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_0_prs3 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_554 : subDecUnit0_io_subuop_prs3; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_1_prs3 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_555 : subDecUnit1_io_subuop_prs3; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_2_prs3 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_556 : subDecUnit2_io_subuop_prs3; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_3_prs3 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_557 : subDecUnit3_io_subuop_prs3; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_0_prs2 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_558 : subDecUnit0_io_subuop_prs2; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_1_prs2 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_559 : subDecUnit1_io_subuop_prs2; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_2_prs2 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_560 : subDecUnit2_io_subuop_prs2; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_3_prs2 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_561 : subDecUnit3_io_subuop_prs2; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_0_prs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_562 : subDecUnit0_io_subuop_prs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_1_prs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_563 : subDecUnit1_io_subuop_prs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_2_prs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_564 : subDecUnit2_io_subuop_prs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_3_prs1 = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_565 : subDecUnit3_io_subuop_prs1; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_0_pdst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_566 : subDecUnit0_io_subuop_pdst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_1_pdst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_567 : subDecUnit1_io_subuop_pdst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_2_pdst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_568 : subDecUnit2_io_subuop_pdst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_3_pdst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_569 : subDecUnit3_io_subuop_pdst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_0_rxq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_570 :
    subDecUnit0_io_subuop_rxq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_1_rxq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_571 :
    subDecUnit1_io_subuop_rxq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_2_rxq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_572 :
    subDecUnit2_io_subuop_rxq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_3_rxq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_573 :
    subDecUnit3_io_subuop_rxq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_0_stq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_574 :
    subDecUnit0_io_subuop_stq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_1_stq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_575 :
    subDecUnit1_io_subuop_stq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_2_stq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_576 :
    subDecUnit2_io_subuop_stq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_3_stq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_577 :
    subDecUnit3_io_subuop_stq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_0_ldq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_578 :
    subDecUnit0_io_subuop_ldq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_1_ldq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_579 :
    subDecUnit1_io_subuop_ldq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_2_ldq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_580 :
    subDecUnit2_io_subuop_ldq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_3_ldq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_581 :
    subDecUnit3_io_subuop_ldq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_0_rob_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_582 :
    subDecUnit0_io_subuop_rob_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_1_rob_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_583 :
    subDecUnit1_io_subuop_rob_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_2_rob_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_584 :
    subDecUnit2_io_subuop_rob_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_3_rob_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_585 :
    subDecUnit3_io_subuop_rob_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [11:0] appended_subuops_0_csr_addr = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_586 :
    subDecUnit0_io_subuop_csr_addr; // @[decode.scala 790:53 decode.scala 789:33]
  wire [11:0] appended_subuops_1_csr_addr = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_587 :
    subDecUnit1_io_subuop_csr_addr; // @[decode.scala 790:53 decode.scala 789:33]
  wire [11:0] appended_subuops_2_csr_addr = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_588 :
    subDecUnit2_io_subuop_csr_addr; // @[decode.scala 790:53 decode.scala 789:33]
  wire [11:0] appended_subuops_3_csr_addr = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_589 :
    subDecUnit3_io_subuop_csr_addr; // @[decode.scala 790:53 decode.scala 789:33]
  wire [19:0] appended_subuops_0_imm_packed = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_590 :
    subDecUnit0_io_subuop_imm_packed; // @[decode.scala 790:53 decode.scala 789:33]
  wire [19:0] appended_subuops_1_imm_packed = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_591 :
    subDecUnit1_io_subuop_imm_packed; // @[decode.scala 790:53 decode.scala 789:33]
  wire [19:0] appended_subuops_2_imm_packed = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_592 :
    subDecUnit2_io_subuop_imm_packed; // @[decode.scala 790:53 decode.scala 789:33]
  wire [19:0] appended_subuops_3_imm_packed = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_593 :
    subDecUnit3_io_subuop_imm_packed; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_taken = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_594 : subDecUnit0_io_subuop_taken; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_taken = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_595 : subDecUnit1_io_subuop_taken; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_taken = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_596 : subDecUnit2_io_subuop_taken; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_taken = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_597 : subDecUnit3_io_subuop_taken; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_0_pc_lob = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_598 : subDecUnit0_io_subuop_pc_lob; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_1_pc_lob = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_599 : subDecUnit1_io_subuop_pc_lob; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_2_pc_lob = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_600 : subDecUnit2_io_subuop_pc_lob; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_3_pc_lob = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_601 : subDecUnit3_io_subuop_pc_lob; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_edge_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_602 : subDecUnit0_io_subuop_edge_inst
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_edge_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_603 : subDecUnit1_io_subuop_edge_inst
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_edge_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_604 : subDecUnit2_io_subuop_edge_inst
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_edge_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_605 : subDecUnit3_io_subuop_edge_inst
    ; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_0_ftq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_606 :
    subDecUnit0_io_subuop_ftq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_1_ftq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_607 :
    subDecUnit1_io_subuop_ftq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_2_ftq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_608 :
    subDecUnit2_io_subuop_ftq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [4:0] appended_subuops_3_ftq_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_609 :
    subDecUnit3_io_subuop_ftq_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_0_br_tag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_610 : subDecUnit0_io_subuop_br_tag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_1_br_tag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_611 : subDecUnit1_io_subuop_br_tag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_2_br_tag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_612 : subDecUnit2_io_subuop_br_tag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_3_br_tag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_613 : subDecUnit3_io_subuop_br_tag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [11:0] appended_subuops_0_br_mask = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_614 :
    subDecUnit0_io_subuop_br_mask; // @[decode.scala 790:53 decode.scala 789:33]
  wire [11:0] appended_subuops_1_br_mask = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_615 :
    subDecUnit1_io_subuop_br_mask; // @[decode.scala 790:53 decode.scala 789:33]
  wire [11:0] appended_subuops_2_br_mask = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_616 :
    subDecUnit2_io_subuop_br_mask; // @[decode.scala 790:53 decode.scala 789:33]
  wire [11:0] appended_subuops_3_br_mask = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_617 :
    subDecUnit3_io_subuop_br_mask; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_is_sfb = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_618 : subDecUnit0_io_subuop_is_sfb; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_is_sfb = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_619 : subDecUnit1_io_subuop_is_sfb; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_is_sfb = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_620 : subDecUnit2_io_subuop_is_sfb; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_is_sfb = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_621 : subDecUnit3_io_subuop_is_sfb; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_is_jal = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_622 : subDecUnit0_io_subuop_is_jal; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_is_jal = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_623 : subDecUnit1_io_subuop_is_jal; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_is_jal = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_624 : subDecUnit2_io_subuop_is_jal; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_is_jal = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_625 : subDecUnit3_io_subuop_is_jal; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_is_jalr = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_626 : subDecUnit0_io_subuop_is_jalr; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_is_jalr = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_627 : subDecUnit1_io_subuop_is_jalr; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_is_jalr = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_628 : subDecUnit2_io_subuop_is_jalr; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_is_jalr = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_629 : subDecUnit3_io_subuop_is_jalr; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_is_br = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_630 : subDecUnit0_io_subuop_is_br; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_is_br = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_631 : subDecUnit1_io_subuop_is_br; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_is_br = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_632 : subDecUnit2_io_subuop_is_br; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_is_br = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_633 : subDecUnit3_io_subuop_is_br; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_iw_p2_poisoned = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_634 :
    subDecUnit0_io_subuop_iw_p2_poisoned; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_iw_p2_poisoned = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_635 :
    subDecUnit1_io_subuop_iw_p2_poisoned; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_iw_p2_poisoned = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_636 :
    subDecUnit2_io_subuop_iw_p2_poisoned; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_iw_p2_poisoned = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_637 :
    subDecUnit3_io_subuop_iw_p2_poisoned; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_iw_p1_poisoned = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_638 :
    subDecUnit0_io_subuop_iw_p1_poisoned; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_iw_p1_poisoned = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_639 :
    subDecUnit1_io_subuop_iw_p1_poisoned; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_iw_p1_poisoned = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_640 :
    subDecUnit2_io_subuop_iw_p1_poisoned; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_iw_p1_poisoned = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_641 :
    subDecUnit3_io_subuop_iw_p1_poisoned; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_0_iw_state = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_642 :
    subDecUnit0_io_subuop_iw_state; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_1_iw_state = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_643 :
    subDecUnit1_io_subuop_iw_state; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_2_iw_state = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_644 :
    subDecUnit2_io_subuop_iw_state; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_3_iw_state = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_645 :
    subDecUnit3_io_subuop_iw_state; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_0_ctrl_op3_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_646 :
    subDecUnit0_io_subuop_ctrl_op3_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_1_ctrl_op3_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_647 :
    subDecUnit1_io_subuop_ctrl_op3_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_2_ctrl_op3_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_648 :
    subDecUnit2_io_subuop_ctrl_op3_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_3_ctrl_op3_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_649 :
    subDecUnit3_io_subuop_ctrl_op3_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_ctrl_is_std = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_650 :
    subDecUnit0_io_subuop_ctrl_is_std; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_ctrl_is_std = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_651 :
    subDecUnit1_io_subuop_ctrl_is_std; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_ctrl_is_std = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_652 :
    subDecUnit2_io_subuop_ctrl_is_std; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_ctrl_is_std = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_653 :
    subDecUnit3_io_subuop_ctrl_is_std; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_ctrl_is_sta = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_654 :
    subDecUnit0_io_subuop_ctrl_is_sta; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_ctrl_is_sta = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_655 :
    subDecUnit1_io_subuop_ctrl_is_sta; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_ctrl_is_sta = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_656 :
    subDecUnit2_io_subuop_ctrl_is_sta; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_ctrl_is_sta = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_657 :
    subDecUnit3_io_subuop_ctrl_is_sta; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_ctrl_is_load = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_658 :
    subDecUnit0_io_subuop_ctrl_is_load; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_ctrl_is_load = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_659 :
    subDecUnit1_io_subuop_ctrl_is_load; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_ctrl_is_load = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_660 :
    subDecUnit2_io_subuop_ctrl_is_load; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_ctrl_is_load = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_661 :
    subDecUnit3_io_subuop_ctrl_is_load; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_0_ctrl_csr_cmd = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_662 :
    subDecUnit0_io_subuop_ctrl_csr_cmd; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_1_ctrl_csr_cmd = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_663 :
    subDecUnit1_io_subuop_ctrl_csr_cmd; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_2_ctrl_csr_cmd = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_664 :
    subDecUnit2_io_subuop_ctrl_csr_cmd; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_3_ctrl_csr_cmd = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_665 :
    subDecUnit3_io_subuop_ctrl_csr_cmd; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_ctrl_fcn_dw = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_666 :
    subDecUnit0_io_subuop_ctrl_fcn_dw; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_ctrl_fcn_dw = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_667 :
    subDecUnit1_io_subuop_ctrl_fcn_dw; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_ctrl_fcn_dw = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_668 :
    subDecUnit2_io_subuop_ctrl_fcn_dw; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_ctrl_fcn_dw = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_669 :
    subDecUnit3_io_subuop_ctrl_fcn_dw; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_0_ctrl_op_fcn = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_670 :
    subDecUnit0_io_subuop_ctrl_op_fcn; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_1_ctrl_op_fcn = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_671 :
    subDecUnit1_io_subuop_ctrl_op_fcn; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_2_ctrl_op_fcn = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_672 :
    subDecUnit2_io_subuop_ctrl_op_fcn; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_3_ctrl_op_fcn = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_673 :
    subDecUnit3_io_subuop_ctrl_op_fcn; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_0_ctrl_imm_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_674 :
    subDecUnit0_io_subuop_ctrl_imm_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_1_ctrl_imm_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_675 :
    subDecUnit1_io_subuop_ctrl_imm_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_2_ctrl_imm_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_676 :
    subDecUnit2_io_subuop_ctrl_imm_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_3_ctrl_imm_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_677 :
    subDecUnit3_io_subuop_ctrl_imm_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_0_ctrl_op2_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_678 :
    subDecUnit0_io_subuop_ctrl_op2_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_1_ctrl_op2_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_679 :
    subDecUnit1_io_subuop_ctrl_op2_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_2_ctrl_op2_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_680 :
    subDecUnit2_io_subuop_ctrl_op2_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_3_ctrl_op2_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_681 :
    subDecUnit3_io_subuop_ctrl_op2_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_0_ctrl_op1_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_682 :
    subDecUnit0_io_subuop_ctrl_op1_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_1_ctrl_op1_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_683 :
    subDecUnit1_io_subuop_ctrl_op1_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_2_ctrl_op1_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_684 :
    subDecUnit2_io_subuop_ctrl_op1_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_3_ctrl_op1_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_685 :
    subDecUnit3_io_subuop_ctrl_op1_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_0_ctrl_br_type = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_686 :
    subDecUnit0_io_subuop_ctrl_br_type; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_1_ctrl_br_type = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_687 :
    subDecUnit1_io_subuop_ctrl_br_type; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_2_ctrl_br_type = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_688 :
    subDecUnit2_io_subuop_ctrl_br_type; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_3_ctrl_br_type = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_689 :
    subDecUnit3_io_subuop_ctrl_br_type; // @[decode.scala 790:53 decode.scala 789:33]
  wire [9:0] appended_subuops_0_fu_code = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_690 :
    subDecUnit0_io_subuop_fu_code; // @[decode.scala 790:53 decode.scala 789:33]
  wire [9:0] appended_subuops_1_fu_code = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_691 :
    subDecUnit1_io_subuop_fu_code; // @[decode.scala 790:53 decode.scala 789:33]
  wire [9:0] appended_subuops_2_fu_code = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_692 :
    subDecUnit2_io_subuop_fu_code; // @[decode.scala 790:53 decode.scala 789:33]
  wire [9:0] appended_subuops_3_fu_code = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_693 :
    subDecUnit3_io_subuop_fu_code; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_0_iq_type = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_694 :
    subDecUnit0_io_subuop_iq_type; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_1_iq_type = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_695 :
    subDecUnit1_io_subuop_iq_type; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_2_iq_type = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_696 :
    subDecUnit2_io_subuop_iq_type; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_3_iq_type = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_697 :
    subDecUnit3_io_subuop_iq_type; // @[decode.scala 790:53 decode.scala 789:33]
  wire [39:0] appended_subuops_0_debug_pc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_698 :
    subDecUnit0_io_subuop_debug_pc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [39:0] appended_subuops_1_debug_pc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_699 :
    subDecUnit1_io_subuop_debug_pc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [39:0] appended_subuops_2_debug_pc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_700 :
    subDecUnit2_io_subuop_debug_pc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [39:0] appended_subuops_3_debug_pc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_701 :
    subDecUnit3_io_subuop_debug_pc; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_is_rvc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_702 : subDecUnit0_io_subuop_is_rvc; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_is_rvc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_703 : subDecUnit1_io_subuop_is_rvc; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_is_rvc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_704 : subDecUnit2_io_subuop_is_rvc; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_is_rvc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_705 : subDecUnit3_io_subuop_is_rvc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [31:0] appended_subuops_0_debug_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_706 :
    subDecUnit0_io_subuop_debug_inst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [31:0] appended_subuops_1_debug_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_707 :
    subDecUnit1_io_subuop_debug_inst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [31:0] appended_subuops_2_debug_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_708 :
    subDecUnit2_io_subuop_debug_inst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [31:0] appended_subuops_3_debug_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_709 :
    subDecUnit3_io_subuop_debug_inst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [31:0] appended_subuops_0_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_786 : subDecUnit0_io_subuop_inst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [31:0] appended_subuops_1_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_787 : subDecUnit1_io_subuop_inst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [31:0] appended_subuops_2_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_788 : subDecUnit2_io_subuop_inst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [31:0] appended_subuops_3_inst = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_789 : subDecUnit3_io_subuop_inst; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_0_uopc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_714 : subDecUnit0_io_subuop_uopc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_1_uopc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_715 : subDecUnit1_io_subuop_uopc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_2_uopc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_716 : subDecUnit2_io_subuop_uopc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [6:0] appended_subuops_3_uopc = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_717 : subDecUnit3_io_subuop_uopc; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_0_address_num = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_718 :
    subDecUnit0_io_subuop_address_num; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_1_address_num = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_719 :
    subDecUnit1_io_subuop_address_num; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_2_address_num = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_720 :
    subDecUnit2_io_subuop_address_num; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_3_address_num = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_721 :
    subDecUnit3_io_subuop_address_num; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_0_rob_inst_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_722 :
    subDecUnit0_io_subuop_rob_inst_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_1_rob_inst_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_723 :
    subDecUnit1_io_subuop_rob_inst_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_2_rob_inst_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_724 :
    subDecUnit2_io_subuop_rob_inst_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_3_rob_inst_idx = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_725 :
    subDecUnit3_io_subuop_rob_inst_idx; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_0_self_index = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_726 :
    subDecUnit0_io_subuop_self_index; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_1_self_index = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_727 :
    subDecUnit1_io_subuop_self_index; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_2_self_index = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_728 :
    subDecUnit2_io_subuop_self_index; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_3_self_index = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_729 :
    subDecUnit3_io_subuop_self_index; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_0_split_num = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_730 :
    subDecUnit0_io_subuop_split_num; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_1_split_num = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_731 :
    subDecUnit1_io_subuop_split_num; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_2_split_num = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_732 :
    subDecUnit2_io_subuop_split_num; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] appended_subuops_3_split_num = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_733 :
    subDecUnit3_io_subuop_split_num; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_0_op2_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_734 :
    subDecUnit0_io_subuop_op2_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_1_op2_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_735 :
    subDecUnit1_io_subuop_op2_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_2_op2_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_736 :
    subDecUnit2_io_subuop_op2_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_3_op2_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_737 :
    subDecUnit3_io_subuop_op2_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_0_op1_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_738 :
    subDecUnit0_io_subuop_op1_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_1_op1_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_739 :
    subDecUnit1_io_subuop_op1_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_2_op1_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_740 :
    subDecUnit2_io_subuop_op1_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_3_op1_sel = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_741 :
    subDecUnit3_io_subuop_op1_sel; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_0_stale_pflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_742 :
    subDecUnit0_io_subuop_stale_pflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_1_stale_pflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_743 :
    subDecUnit1_io_subuop_stale_pflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_2_stale_pflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_744 :
    subDecUnit2_io_subuop_stale_pflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_3_stale_pflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_745 :
    subDecUnit3_io_subuop_stale_pflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_pflag_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_746 :
    subDecUnit0_io_subuop_pflag_busy; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_pflag_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_747 :
    subDecUnit1_io_subuop_pflag_busy; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_pflag_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_748 :
    subDecUnit2_io_subuop_pflag_busy; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_pflag_busy = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_749 :
    subDecUnit3_io_subuop_pflag_busy; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_0_pwflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_750 : subDecUnit0_io_subuop_pwflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_1_pwflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_751 : subDecUnit1_io_subuop_pwflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_2_pwflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_752 : subDecUnit2_io_subuop_pwflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_3_pwflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_753 : subDecUnit3_io_subuop_pwflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_0_prflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_754 : subDecUnit0_io_subuop_prflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_1_prflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_755 : subDecUnit1_io_subuop_prflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_2_prflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_756 : subDecUnit2_io_subuop_prflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [3:0] appended_subuops_3_prflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_757 : subDecUnit3_io_subuop_prflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_wflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_758 : subDecUnit0_io_subuop_wflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_wflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_759 : subDecUnit1_io_subuop_wflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_wflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_760 : subDecUnit2_io_subuop_wflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_wflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_761 : subDecUnit3_io_subuop_wflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_rflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_762 : subDecUnit0_io_subuop_rflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_rflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_763 : subDecUnit1_io_subuop_rflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_rflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_764 : subDecUnit2_io_subuop_rflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_rflag = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_765 : subDecUnit3_io_subuop_rflag; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_0_lrs3_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_766 :
    subDecUnit0_io_subuop_lrs3_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_1_lrs3_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_767 :
    subDecUnit1_io_subuop_lrs3_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_2_lrs3_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_768 :
    subDecUnit2_io_subuop_lrs3_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [1:0] appended_subuops_3_lrs3_rtype = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_769 :
    subDecUnit3_io_subuop_lrs3_rtype; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_0_shift = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_770 : subDecUnit0_io_subuop_shift; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_1_shift = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_771 : subDecUnit1_io_subuop_shift; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_2_shift = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_772 : subDecUnit2_io_subuop_shift; // @[decode.scala 790:53 decode.scala 789:33]
  wire [2:0] appended_subuops_3_shift = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_773 : subDecUnit3_io_subuop_shift; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_is_unicore = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_774 :
    subDecUnit0_io_subuop_is_unicore; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_is_unicore = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_775 :
    subDecUnit1_io_subuop_is_unicore; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_is_unicore = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_776 :
    subDecUnit2_io_subuop_is_unicore; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_is_unicore = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_777 :
    subDecUnit3_io_subuop_is_unicore; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_switch_off = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_778 :
    subDecUnit0_io_subuop_switch_off; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_switch_off = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_779 :
    subDecUnit1_io_subuop_switch_off; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_switch_off = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_780 :
    subDecUnit2_io_subuop_switch_off; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_switch_off = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_781 :
    subDecUnit3_io_subuop_switch_off; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_0_switch = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_782 : subDecUnit0_io_subuop_switch; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_1_switch = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_783 : subDecUnit1_io_subuop_switch; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_2_switch = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_784 : subDecUnit2_io_subuop_switch; // @[decode.scala 790:53 decode.scala 789:33]
  wire  appended_subuops_3_switch = r31_modified & cs_sub0_uopc != 7'h43 ? _GEN_785 : subDecUnit3_io_subuop_switch; // @[decode.scala 790:53 decode.scala 789:33]
  wire [5:0] _T_1745 = io_deq_is_decoded ? uop_split_num : 6'h0; // @[decode.scala 819:22]
  wire [5:0] _GEN_1188 = unicoreMode ? _T_1745 : 6'h1; // @[decode.scala 802:20 decode.scala 819:16 decode.scala 840:16]
  SubDecodeUnit subDecUnit0 ( // @[decode.scala 764:27]
    .clock(subDecUnit0_clock),
    .reset(subDecUnit0_reset),
    .io_rawuop_switch(subDecUnit0_io_rawuop_switch),
    .io_rawuop_switch_off(subDecUnit0_io_rawuop_switch_off),
    .io_rawuop_is_unicore(subDecUnit0_io_rawuop_is_unicore),
    .io_rawuop_shift(subDecUnit0_io_rawuop_shift),
    .io_rawuop_lrs3_rtype(subDecUnit0_io_rawuop_lrs3_rtype),
    .io_rawuop_rflag(subDecUnit0_io_rawuop_rflag),
    .io_rawuop_wflag(subDecUnit0_io_rawuop_wflag),
    .io_rawuop_prflag(subDecUnit0_io_rawuop_prflag),
    .io_rawuop_pwflag(subDecUnit0_io_rawuop_pwflag),
    .io_rawuop_pflag_busy(subDecUnit0_io_rawuop_pflag_busy),
    .io_rawuop_stale_pflag(subDecUnit0_io_rawuop_stale_pflag),
    .io_rawuop_op1_sel(subDecUnit0_io_rawuop_op1_sel),
    .io_rawuop_op2_sel(subDecUnit0_io_rawuop_op2_sel),
    .io_rawuop_split_num(subDecUnit0_io_rawuop_split_num),
    .io_rawuop_self_index(subDecUnit0_io_rawuop_self_index),
    .io_rawuop_rob_inst_idx(subDecUnit0_io_rawuop_rob_inst_idx),
    .io_rawuop_address_num(subDecUnit0_io_rawuop_address_num),
    .io_rawuop_uopc(subDecUnit0_io_rawuop_uopc),
    .io_rawuop_inst(subDecUnit0_io_rawuop_inst),
    .io_rawuop_debug_inst(subDecUnit0_io_rawuop_debug_inst),
    .io_rawuop_is_rvc(subDecUnit0_io_rawuop_is_rvc),
    .io_rawuop_debug_pc(subDecUnit0_io_rawuop_debug_pc),
    .io_rawuop_iq_type(subDecUnit0_io_rawuop_iq_type),
    .io_rawuop_fu_code(subDecUnit0_io_rawuop_fu_code),
    .io_rawuop_ctrl_br_type(subDecUnit0_io_rawuop_ctrl_br_type),
    .io_rawuop_ctrl_op1_sel(subDecUnit0_io_rawuop_ctrl_op1_sel),
    .io_rawuop_ctrl_op2_sel(subDecUnit0_io_rawuop_ctrl_op2_sel),
    .io_rawuop_ctrl_imm_sel(subDecUnit0_io_rawuop_ctrl_imm_sel),
    .io_rawuop_ctrl_op_fcn(subDecUnit0_io_rawuop_ctrl_op_fcn),
    .io_rawuop_ctrl_fcn_dw(subDecUnit0_io_rawuop_ctrl_fcn_dw),
    .io_rawuop_ctrl_csr_cmd(subDecUnit0_io_rawuop_ctrl_csr_cmd),
    .io_rawuop_ctrl_is_load(subDecUnit0_io_rawuop_ctrl_is_load),
    .io_rawuop_ctrl_is_sta(subDecUnit0_io_rawuop_ctrl_is_sta),
    .io_rawuop_ctrl_is_std(subDecUnit0_io_rawuop_ctrl_is_std),
    .io_rawuop_ctrl_op3_sel(subDecUnit0_io_rawuop_ctrl_op3_sel),
    .io_rawuop_iw_state(subDecUnit0_io_rawuop_iw_state),
    .io_rawuop_iw_p1_poisoned(subDecUnit0_io_rawuop_iw_p1_poisoned),
    .io_rawuop_iw_p2_poisoned(subDecUnit0_io_rawuop_iw_p2_poisoned),
    .io_rawuop_is_br(subDecUnit0_io_rawuop_is_br),
    .io_rawuop_is_jalr(subDecUnit0_io_rawuop_is_jalr),
    .io_rawuop_is_jal(subDecUnit0_io_rawuop_is_jal),
    .io_rawuop_is_sfb(subDecUnit0_io_rawuop_is_sfb),
    .io_rawuop_br_mask(subDecUnit0_io_rawuop_br_mask),
    .io_rawuop_br_tag(subDecUnit0_io_rawuop_br_tag),
    .io_rawuop_ftq_idx(subDecUnit0_io_rawuop_ftq_idx),
    .io_rawuop_edge_inst(subDecUnit0_io_rawuop_edge_inst),
    .io_rawuop_pc_lob(subDecUnit0_io_rawuop_pc_lob),
    .io_rawuop_taken(subDecUnit0_io_rawuop_taken),
    .io_rawuop_imm_packed(subDecUnit0_io_rawuop_imm_packed),
    .io_rawuop_csr_addr(subDecUnit0_io_rawuop_csr_addr),
    .io_rawuop_rob_idx(subDecUnit0_io_rawuop_rob_idx),
    .io_rawuop_ldq_idx(subDecUnit0_io_rawuop_ldq_idx),
    .io_rawuop_stq_idx(subDecUnit0_io_rawuop_stq_idx),
    .io_rawuop_rxq_idx(subDecUnit0_io_rawuop_rxq_idx),
    .io_rawuop_pdst(subDecUnit0_io_rawuop_pdst),
    .io_rawuop_prs1(subDecUnit0_io_rawuop_prs1),
    .io_rawuop_prs2(subDecUnit0_io_rawuop_prs2),
    .io_rawuop_prs3(subDecUnit0_io_rawuop_prs3),
    .io_rawuop_ppred(subDecUnit0_io_rawuop_ppred),
    .io_rawuop_prs1_busy(subDecUnit0_io_rawuop_prs1_busy),
    .io_rawuop_prs2_busy(subDecUnit0_io_rawuop_prs2_busy),
    .io_rawuop_prs3_busy(subDecUnit0_io_rawuop_prs3_busy),
    .io_rawuop_ppred_busy(subDecUnit0_io_rawuop_ppred_busy),
    .io_rawuop_stale_pdst(subDecUnit0_io_rawuop_stale_pdst),
    .io_rawuop_exception(subDecUnit0_io_rawuop_exception),
    .io_rawuop_exc_cause(subDecUnit0_io_rawuop_exc_cause),
    .io_rawuop_bypassable(subDecUnit0_io_rawuop_bypassable),
    .io_rawuop_mem_cmd(subDecUnit0_io_rawuop_mem_cmd),
    .io_rawuop_mem_size(subDecUnit0_io_rawuop_mem_size),
    .io_rawuop_mem_signed(subDecUnit0_io_rawuop_mem_signed),
    .io_rawuop_is_fence(subDecUnit0_io_rawuop_is_fence),
    .io_rawuop_is_fencei(subDecUnit0_io_rawuop_is_fencei),
    .io_rawuop_is_amo(subDecUnit0_io_rawuop_is_amo),
    .io_rawuop_uses_ldq(subDecUnit0_io_rawuop_uses_ldq),
    .io_rawuop_uses_stq(subDecUnit0_io_rawuop_uses_stq),
    .io_rawuop_is_sys_pc2epc(subDecUnit0_io_rawuop_is_sys_pc2epc),
    .io_rawuop_is_unique(subDecUnit0_io_rawuop_is_unique),
    .io_rawuop_flush_on_commit(subDecUnit0_io_rawuop_flush_on_commit),
    .io_rawuop_ldst_is_rs1(subDecUnit0_io_rawuop_ldst_is_rs1),
    .io_rawuop_ldst(subDecUnit0_io_rawuop_ldst),
    .io_rawuop_lrs1(subDecUnit0_io_rawuop_lrs1),
    .io_rawuop_lrs2(subDecUnit0_io_rawuop_lrs2),
    .io_rawuop_lrs3(subDecUnit0_io_rawuop_lrs3),
    .io_rawuop_ldst_val(subDecUnit0_io_rawuop_ldst_val),
    .io_rawuop_dst_rtype(subDecUnit0_io_rawuop_dst_rtype),
    .io_rawuop_lrs1_rtype(subDecUnit0_io_rawuop_lrs1_rtype),
    .io_rawuop_lrs2_rtype(subDecUnit0_io_rawuop_lrs2_rtype),
    .io_rawuop_frs3_en(subDecUnit0_io_rawuop_frs3_en),
    .io_rawuop_fp_val(subDecUnit0_io_rawuop_fp_val),
    .io_rawuop_fp_single(subDecUnit0_io_rawuop_fp_single),
    .io_rawuop_xcpt_pf_if(subDecUnit0_io_rawuop_xcpt_pf_if),
    .io_rawuop_xcpt_ae_if(subDecUnit0_io_rawuop_xcpt_ae_if),
    .io_rawuop_xcpt_ma_if(subDecUnit0_io_rawuop_xcpt_ma_if),
    .io_rawuop_bp_debug_if(subDecUnit0_io_rawuop_bp_debug_if),
    .io_rawuop_bp_xcpt_if(subDecUnit0_io_rawuop_bp_xcpt_if),
    .io_rawuop_debug_fsrc(subDecUnit0_io_rawuop_debug_fsrc),
    .io_rawuop_debug_tsrc(subDecUnit0_io_rawuop_debug_tsrc),
    .io_cs_sub_valid(subDecUnit0_io_cs_sub_valid),
    .io_cs_sub_fp_val(subDecUnit0_io_cs_sub_fp_val),
    .io_cs_sub_fp_single(subDecUnit0_io_cs_sub_fp_single),
    .io_cs_sub_uopc(subDecUnit0_io_cs_sub_uopc),
    .io_cs_sub_iq_type(subDecUnit0_io_cs_sub_iq_type),
    .io_cs_sub_fu_code(subDecUnit0_io_cs_sub_fu_code),
    .io_cs_sub_uses_ldq(subDecUnit0_io_cs_sub_uses_ldq),
    .io_cs_sub_uses_stq(subDecUnit0_io_cs_sub_uses_stq),
    .io_cs_sub_is_br(subDecUnit0_io_cs_sub_is_br),
    .io_cs_sub_dst_type(subDecUnit0_io_cs_sub_dst_type),
    .io_cs_sub_rs1_type(subDecUnit0_io_cs_sub_rs1_type),
    .io_cs_sub_rs2_type(subDecUnit0_io_cs_sub_rs2_type),
    .io_cs_sub_rtemp1(subDecUnit0_io_cs_sub_rtemp1),
    .io_cs_sub_rtemp2(subDecUnit0_io_cs_sub_rtemp2),
    .io_cs_sub_wtemp(subDecUnit0_io_cs_sub_wtemp),
    .io_cs_sub_wflag(subDecUnit0_io_cs_sub_wflag),
    .io_cs_sub_rflag(subDecUnit0_io_cs_sub_rflag),
    .io_cs_sub_imm_sel(subDecUnit0_io_cs_sub_imm_sel),
    .io_cs_sub_wakeup_delay(subDecUnit0_io_cs_sub_wakeup_delay),
    .io_cs_sub_bypassable(subDecUnit0_io_cs_sub_bypassable),
    .io_cs_sub_mem_cmd(subDecUnit0_io_cs_sub_mem_cmd),
    .io_cs_sub_mem_size(subDecUnit0_io_cs_sub_mem_size),
    .io_cs_sub_shift(subDecUnit0_io_cs_sub_shift),
    .io_cs_sub_split_num(subDecUnit0_io_cs_sub_split_num),
    .io_cs_sub_op1_sel(subDecUnit0_io_cs_sub_op1_sel),
    .io_cs_sub_op2_sel(subDecUnit0_io_cs_sub_op2_sel),
    .io_subuop_switch(subDecUnit0_io_subuop_switch),
    .io_subuop_switch_off(subDecUnit0_io_subuop_switch_off),
    .io_subuop_is_unicore(subDecUnit0_io_subuop_is_unicore),
    .io_subuop_shift(subDecUnit0_io_subuop_shift),
    .io_subuop_lrs3_rtype(subDecUnit0_io_subuop_lrs3_rtype),
    .io_subuop_rflag(subDecUnit0_io_subuop_rflag),
    .io_subuop_wflag(subDecUnit0_io_subuop_wflag),
    .io_subuop_prflag(subDecUnit0_io_subuop_prflag),
    .io_subuop_pwflag(subDecUnit0_io_subuop_pwflag),
    .io_subuop_pflag_busy(subDecUnit0_io_subuop_pflag_busy),
    .io_subuop_stale_pflag(subDecUnit0_io_subuop_stale_pflag),
    .io_subuop_op1_sel(subDecUnit0_io_subuop_op1_sel),
    .io_subuop_op2_sel(subDecUnit0_io_subuop_op2_sel),
    .io_subuop_split_num(subDecUnit0_io_subuop_split_num),
    .io_subuop_self_index(subDecUnit0_io_subuop_self_index),
    .io_subuop_rob_inst_idx(subDecUnit0_io_subuop_rob_inst_idx),
    .io_subuop_address_num(subDecUnit0_io_subuop_address_num),
    .io_subuop_uopc(subDecUnit0_io_subuop_uopc),
    .io_subuop_inst(subDecUnit0_io_subuop_inst),
    .io_subuop_debug_inst(subDecUnit0_io_subuop_debug_inst),
    .io_subuop_is_rvc(subDecUnit0_io_subuop_is_rvc),
    .io_subuop_debug_pc(subDecUnit0_io_subuop_debug_pc),
    .io_subuop_iq_type(subDecUnit0_io_subuop_iq_type),
    .io_subuop_fu_code(subDecUnit0_io_subuop_fu_code),
    .io_subuop_ctrl_br_type(subDecUnit0_io_subuop_ctrl_br_type),
    .io_subuop_ctrl_op1_sel(subDecUnit0_io_subuop_ctrl_op1_sel),
    .io_subuop_ctrl_op2_sel(subDecUnit0_io_subuop_ctrl_op2_sel),
    .io_subuop_ctrl_imm_sel(subDecUnit0_io_subuop_ctrl_imm_sel),
    .io_subuop_ctrl_op_fcn(subDecUnit0_io_subuop_ctrl_op_fcn),
    .io_subuop_ctrl_fcn_dw(subDecUnit0_io_subuop_ctrl_fcn_dw),
    .io_subuop_ctrl_csr_cmd(subDecUnit0_io_subuop_ctrl_csr_cmd),
    .io_subuop_ctrl_is_load(subDecUnit0_io_subuop_ctrl_is_load),
    .io_subuop_ctrl_is_sta(subDecUnit0_io_subuop_ctrl_is_sta),
    .io_subuop_ctrl_is_std(subDecUnit0_io_subuop_ctrl_is_std),
    .io_subuop_ctrl_op3_sel(subDecUnit0_io_subuop_ctrl_op3_sel),
    .io_subuop_iw_state(subDecUnit0_io_subuop_iw_state),
    .io_subuop_iw_p1_poisoned(subDecUnit0_io_subuop_iw_p1_poisoned),
    .io_subuop_iw_p2_poisoned(subDecUnit0_io_subuop_iw_p2_poisoned),
    .io_subuop_is_br(subDecUnit0_io_subuop_is_br),
    .io_subuop_is_jalr(subDecUnit0_io_subuop_is_jalr),
    .io_subuop_is_jal(subDecUnit0_io_subuop_is_jal),
    .io_subuop_is_sfb(subDecUnit0_io_subuop_is_sfb),
    .io_subuop_br_mask(subDecUnit0_io_subuop_br_mask),
    .io_subuop_br_tag(subDecUnit0_io_subuop_br_tag),
    .io_subuop_ftq_idx(subDecUnit0_io_subuop_ftq_idx),
    .io_subuop_edge_inst(subDecUnit0_io_subuop_edge_inst),
    .io_subuop_pc_lob(subDecUnit0_io_subuop_pc_lob),
    .io_subuop_taken(subDecUnit0_io_subuop_taken),
    .io_subuop_imm_packed(subDecUnit0_io_subuop_imm_packed),
    .io_subuop_csr_addr(subDecUnit0_io_subuop_csr_addr),
    .io_subuop_rob_idx(subDecUnit0_io_subuop_rob_idx),
    .io_subuop_ldq_idx(subDecUnit0_io_subuop_ldq_idx),
    .io_subuop_stq_idx(subDecUnit0_io_subuop_stq_idx),
    .io_subuop_rxq_idx(subDecUnit0_io_subuop_rxq_idx),
    .io_subuop_pdst(subDecUnit0_io_subuop_pdst),
    .io_subuop_prs1(subDecUnit0_io_subuop_prs1),
    .io_subuop_prs2(subDecUnit0_io_subuop_prs2),
    .io_subuop_prs3(subDecUnit0_io_subuop_prs3),
    .io_subuop_ppred(subDecUnit0_io_subuop_ppred),
    .io_subuop_prs1_busy(subDecUnit0_io_subuop_prs1_busy),
    .io_subuop_prs2_busy(subDecUnit0_io_subuop_prs2_busy),
    .io_subuop_prs3_busy(subDecUnit0_io_subuop_prs3_busy),
    .io_subuop_ppred_busy(subDecUnit0_io_subuop_ppred_busy),
    .io_subuop_stale_pdst(subDecUnit0_io_subuop_stale_pdst),
    .io_subuop_exception(subDecUnit0_io_subuop_exception),
    .io_subuop_exc_cause(subDecUnit0_io_subuop_exc_cause),
    .io_subuop_bypassable(subDecUnit0_io_subuop_bypassable),
    .io_subuop_mem_cmd(subDecUnit0_io_subuop_mem_cmd),
    .io_subuop_mem_size(subDecUnit0_io_subuop_mem_size),
    .io_subuop_mem_signed(subDecUnit0_io_subuop_mem_signed),
    .io_subuop_is_fence(subDecUnit0_io_subuop_is_fence),
    .io_subuop_is_fencei(subDecUnit0_io_subuop_is_fencei),
    .io_subuop_is_amo(subDecUnit0_io_subuop_is_amo),
    .io_subuop_uses_ldq(subDecUnit0_io_subuop_uses_ldq),
    .io_subuop_uses_stq(subDecUnit0_io_subuop_uses_stq),
    .io_subuop_is_sys_pc2epc(subDecUnit0_io_subuop_is_sys_pc2epc),
    .io_subuop_is_unique(subDecUnit0_io_subuop_is_unique),
    .io_subuop_flush_on_commit(subDecUnit0_io_subuop_flush_on_commit),
    .io_subuop_ldst_is_rs1(subDecUnit0_io_subuop_ldst_is_rs1),
    .io_subuop_ldst(subDecUnit0_io_subuop_ldst),
    .io_subuop_lrs1(subDecUnit0_io_subuop_lrs1),
    .io_subuop_lrs2(subDecUnit0_io_subuop_lrs2),
    .io_subuop_lrs3(subDecUnit0_io_subuop_lrs3),
    .io_subuop_ldst_val(subDecUnit0_io_subuop_ldst_val),
    .io_subuop_dst_rtype(subDecUnit0_io_subuop_dst_rtype),
    .io_subuop_lrs1_rtype(subDecUnit0_io_subuop_lrs1_rtype),
    .io_subuop_lrs2_rtype(subDecUnit0_io_subuop_lrs2_rtype),
    .io_subuop_frs3_en(subDecUnit0_io_subuop_frs3_en),
    .io_subuop_fp_val(subDecUnit0_io_subuop_fp_val),
    .io_subuop_fp_single(subDecUnit0_io_subuop_fp_single),
    .io_subuop_xcpt_pf_if(subDecUnit0_io_subuop_xcpt_pf_if),
    .io_subuop_xcpt_ae_if(subDecUnit0_io_subuop_xcpt_ae_if),
    .io_subuop_xcpt_ma_if(subDecUnit0_io_subuop_xcpt_ma_if),
    .io_subuop_bp_debug_if(subDecUnit0_io_subuop_bp_debug_if),
    .io_subuop_bp_xcpt_if(subDecUnit0_io_subuop_bp_xcpt_if),
    .io_subuop_debug_fsrc(subDecUnit0_io_subuop_debug_fsrc),
    .io_subuop_debug_tsrc(subDecUnit0_io_subuop_debug_tsrc)
  );
  SubDecodeUnit subDecUnit1 ( // @[decode.scala 765:27]
    .clock(subDecUnit1_clock),
    .reset(subDecUnit1_reset),
    .io_rawuop_switch(subDecUnit1_io_rawuop_switch),
    .io_rawuop_switch_off(subDecUnit1_io_rawuop_switch_off),
    .io_rawuop_is_unicore(subDecUnit1_io_rawuop_is_unicore),
    .io_rawuop_shift(subDecUnit1_io_rawuop_shift),
    .io_rawuop_lrs3_rtype(subDecUnit1_io_rawuop_lrs3_rtype),
    .io_rawuop_rflag(subDecUnit1_io_rawuop_rflag),
    .io_rawuop_wflag(subDecUnit1_io_rawuop_wflag),
    .io_rawuop_prflag(subDecUnit1_io_rawuop_prflag),
    .io_rawuop_pwflag(subDecUnit1_io_rawuop_pwflag),
    .io_rawuop_pflag_busy(subDecUnit1_io_rawuop_pflag_busy),
    .io_rawuop_stale_pflag(subDecUnit1_io_rawuop_stale_pflag),
    .io_rawuop_op1_sel(subDecUnit1_io_rawuop_op1_sel),
    .io_rawuop_op2_sel(subDecUnit1_io_rawuop_op2_sel),
    .io_rawuop_split_num(subDecUnit1_io_rawuop_split_num),
    .io_rawuop_self_index(subDecUnit1_io_rawuop_self_index),
    .io_rawuop_rob_inst_idx(subDecUnit1_io_rawuop_rob_inst_idx),
    .io_rawuop_address_num(subDecUnit1_io_rawuop_address_num),
    .io_rawuop_uopc(subDecUnit1_io_rawuop_uopc),
    .io_rawuop_inst(subDecUnit1_io_rawuop_inst),
    .io_rawuop_debug_inst(subDecUnit1_io_rawuop_debug_inst),
    .io_rawuop_is_rvc(subDecUnit1_io_rawuop_is_rvc),
    .io_rawuop_debug_pc(subDecUnit1_io_rawuop_debug_pc),
    .io_rawuop_iq_type(subDecUnit1_io_rawuop_iq_type),
    .io_rawuop_fu_code(subDecUnit1_io_rawuop_fu_code),
    .io_rawuop_ctrl_br_type(subDecUnit1_io_rawuop_ctrl_br_type),
    .io_rawuop_ctrl_op1_sel(subDecUnit1_io_rawuop_ctrl_op1_sel),
    .io_rawuop_ctrl_op2_sel(subDecUnit1_io_rawuop_ctrl_op2_sel),
    .io_rawuop_ctrl_imm_sel(subDecUnit1_io_rawuop_ctrl_imm_sel),
    .io_rawuop_ctrl_op_fcn(subDecUnit1_io_rawuop_ctrl_op_fcn),
    .io_rawuop_ctrl_fcn_dw(subDecUnit1_io_rawuop_ctrl_fcn_dw),
    .io_rawuop_ctrl_csr_cmd(subDecUnit1_io_rawuop_ctrl_csr_cmd),
    .io_rawuop_ctrl_is_load(subDecUnit1_io_rawuop_ctrl_is_load),
    .io_rawuop_ctrl_is_sta(subDecUnit1_io_rawuop_ctrl_is_sta),
    .io_rawuop_ctrl_is_std(subDecUnit1_io_rawuop_ctrl_is_std),
    .io_rawuop_ctrl_op3_sel(subDecUnit1_io_rawuop_ctrl_op3_sel),
    .io_rawuop_iw_state(subDecUnit1_io_rawuop_iw_state),
    .io_rawuop_iw_p1_poisoned(subDecUnit1_io_rawuop_iw_p1_poisoned),
    .io_rawuop_iw_p2_poisoned(subDecUnit1_io_rawuop_iw_p2_poisoned),
    .io_rawuop_is_br(subDecUnit1_io_rawuop_is_br),
    .io_rawuop_is_jalr(subDecUnit1_io_rawuop_is_jalr),
    .io_rawuop_is_jal(subDecUnit1_io_rawuop_is_jal),
    .io_rawuop_is_sfb(subDecUnit1_io_rawuop_is_sfb),
    .io_rawuop_br_mask(subDecUnit1_io_rawuop_br_mask),
    .io_rawuop_br_tag(subDecUnit1_io_rawuop_br_tag),
    .io_rawuop_ftq_idx(subDecUnit1_io_rawuop_ftq_idx),
    .io_rawuop_edge_inst(subDecUnit1_io_rawuop_edge_inst),
    .io_rawuop_pc_lob(subDecUnit1_io_rawuop_pc_lob),
    .io_rawuop_taken(subDecUnit1_io_rawuop_taken),
    .io_rawuop_imm_packed(subDecUnit1_io_rawuop_imm_packed),
    .io_rawuop_csr_addr(subDecUnit1_io_rawuop_csr_addr),
    .io_rawuop_rob_idx(subDecUnit1_io_rawuop_rob_idx),
    .io_rawuop_ldq_idx(subDecUnit1_io_rawuop_ldq_idx),
    .io_rawuop_stq_idx(subDecUnit1_io_rawuop_stq_idx),
    .io_rawuop_rxq_idx(subDecUnit1_io_rawuop_rxq_idx),
    .io_rawuop_pdst(subDecUnit1_io_rawuop_pdst),
    .io_rawuop_prs1(subDecUnit1_io_rawuop_prs1),
    .io_rawuop_prs2(subDecUnit1_io_rawuop_prs2),
    .io_rawuop_prs3(subDecUnit1_io_rawuop_prs3),
    .io_rawuop_ppred(subDecUnit1_io_rawuop_ppred),
    .io_rawuop_prs1_busy(subDecUnit1_io_rawuop_prs1_busy),
    .io_rawuop_prs2_busy(subDecUnit1_io_rawuop_prs2_busy),
    .io_rawuop_prs3_busy(subDecUnit1_io_rawuop_prs3_busy),
    .io_rawuop_ppred_busy(subDecUnit1_io_rawuop_ppred_busy),
    .io_rawuop_stale_pdst(subDecUnit1_io_rawuop_stale_pdst),
    .io_rawuop_exception(subDecUnit1_io_rawuop_exception),
    .io_rawuop_exc_cause(subDecUnit1_io_rawuop_exc_cause),
    .io_rawuop_bypassable(subDecUnit1_io_rawuop_bypassable),
    .io_rawuop_mem_cmd(subDecUnit1_io_rawuop_mem_cmd),
    .io_rawuop_mem_size(subDecUnit1_io_rawuop_mem_size),
    .io_rawuop_mem_signed(subDecUnit1_io_rawuop_mem_signed),
    .io_rawuop_is_fence(subDecUnit1_io_rawuop_is_fence),
    .io_rawuop_is_fencei(subDecUnit1_io_rawuop_is_fencei),
    .io_rawuop_is_amo(subDecUnit1_io_rawuop_is_amo),
    .io_rawuop_uses_ldq(subDecUnit1_io_rawuop_uses_ldq),
    .io_rawuop_uses_stq(subDecUnit1_io_rawuop_uses_stq),
    .io_rawuop_is_sys_pc2epc(subDecUnit1_io_rawuop_is_sys_pc2epc),
    .io_rawuop_is_unique(subDecUnit1_io_rawuop_is_unique),
    .io_rawuop_flush_on_commit(subDecUnit1_io_rawuop_flush_on_commit),
    .io_rawuop_ldst_is_rs1(subDecUnit1_io_rawuop_ldst_is_rs1),
    .io_rawuop_ldst(subDecUnit1_io_rawuop_ldst),
    .io_rawuop_lrs1(subDecUnit1_io_rawuop_lrs1),
    .io_rawuop_lrs2(subDecUnit1_io_rawuop_lrs2),
    .io_rawuop_lrs3(subDecUnit1_io_rawuop_lrs3),
    .io_rawuop_ldst_val(subDecUnit1_io_rawuop_ldst_val),
    .io_rawuop_dst_rtype(subDecUnit1_io_rawuop_dst_rtype),
    .io_rawuop_lrs1_rtype(subDecUnit1_io_rawuop_lrs1_rtype),
    .io_rawuop_lrs2_rtype(subDecUnit1_io_rawuop_lrs2_rtype),
    .io_rawuop_frs3_en(subDecUnit1_io_rawuop_frs3_en),
    .io_rawuop_fp_val(subDecUnit1_io_rawuop_fp_val),
    .io_rawuop_fp_single(subDecUnit1_io_rawuop_fp_single),
    .io_rawuop_xcpt_pf_if(subDecUnit1_io_rawuop_xcpt_pf_if),
    .io_rawuop_xcpt_ae_if(subDecUnit1_io_rawuop_xcpt_ae_if),
    .io_rawuop_xcpt_ma_if(subDecUnit1_io_rawuop_xcpt_ma_if),
    .io_rawuop_bp_debug_if(subDecUnit1_io_rawuop_bp_debug_if),
    .io_rawuop_bp_xcpt_if(subDecUnit1_io_rawuop_bp_xcpt_if),
    .io_rawuop_debug_fsrc(subDecUnit1_io_rawuop_debug_fsrc),
    .io_rawuop_debug_tsrc(subDecUnit1_io_rawuop_debug_tsrc),
    .io_cs_sub_valid(subDecUnit1_io_cs_sub_valid),
    .io_cs_sub_fp_val(subDecUnit1_io_cs_sub_fp_val),
    .io_cs_sub_fp_single(subDecUnit1_io_cs_sub_fp_single),
    .io_cs_sub_uopc(subDecUnit1_io_cs_sub_uopc),
    .io_cs_sub_iq_type(subDecUnit1_io_cs_sub_iq_type),
    .io_cs_sub_fu_code(subDecUnit1_io_cs_sub_fu_code),
    .io_cs_sub_uses_ldq(subDecUnit1_io_cs_sub_uses_ldq),
    .io_cs_sub_uses_stq(subDecUnit1_io_cs_sub_uses_stq),
    .io_cs_sub_is_br(subDecUnit1_io_cs_sub_is_br),
    .io_cs_sub_dst_type(subDecUnit1_io_cs_sub_dst_type),
    .io_cs_sub_rs1_type(subDecUnit1_io_cs_sub_rs1_type),
    .io_cs_sub_rs2_type(subDecUnit1_io_cs_sub_rs2_type),
    .io_cs_sub_rtemp1(subDecUnit1_io_cs_sub_rtemp1),
    .io_cs_sub_rtemp2(subDecUnit1_io_cs_sub_rtemp2),
    .io_cs_sub_wtemp(subDecUnit1_io_cs_sub_wtemp),
    .io_cs_sub_wflag(subDecUnit1_io_cs_sub_wflag),
    .io_cs_sub_rflag(subDecUnit1_io_cs_sub_rflag),
    .io_cs_sub_imm_sel(subDecUnit1_io_cs_sub_imm_sel),
    .io_cs_sub_wakeup_delay(subDecUnit1_io_cs_sub_wakeup_delay),
    .io_cs_sub_bypassable(subDecUnit1_io_cs_sub_bypassable),
    .io_cs_sub_mem_cmd(subDecUnit1_io_cs_sub_mem_cmd),
    .io_cs_sub_mem_size(subDecUnit1_io_cs_sub_mem_size),
    .io_cs_sub_shift(subDecUnit1_io_cs_sub_shift),
    .io_cs_sub_split_num(subDecUnit1_io_cs_sub_split_num),
    .io_cs_sub_op1_sel(subDecUnit1_io_cs_sub_op1_sel),
    .io_cs_sub_op2_sel(subDecUnit1_io_cs_sub_op2_sel),
    .io_subuop_switch(subDecUnit1_io_subuop_switch),
    .io_subuop_switch_off(subDecUnit1_io_subuop_switch_off),
    .io_subuop_is_unicore(subDecUnit1_io_subuop_is_unicore),
    .io_subuop_shift(subDecUnit1_io_subuop_shift),
    .io_subuop_lrs3_rtype(subDecUnit1_io_subuop_lrs3_rtype),
    .io_subuop_rflag(subDecUnit1_io_subuop_rflag),
    .io_subuop_wflag(subDecUnit1_io_subuop_wflag),
    .io_subuop_prflag(subDecUnit1_io_subuop_prflag),
    .io_subuop_pwflag(subDecUnit1_io_subuop_pwflag),
    .io_subuop_pflag_busy(subDecUnit1_io_subuop_pflag_busy),
    .io_subuop_stale_pflag(subDecUnit1_io_subuop_stale_pflag),
    .io_subuop_op1_sel(subDecUnit1_io_subuop_op1_sel),
    .io_subuop_op2_sel(subDecUnit1_io_subuop_op2_sel),
    .io_subuop_split_num(subDecUnit1_io_subuop_split_num),
    .io_subuop_self_index(subDecUnit1_io_subuop_self_index),
    .io_subuop_rob_inst_idx(subDecUnit1_io_subuop_rob_inst_idx),
    .io_subuop_address_num(subDecUnit1_io_subuop_address_num),
    .io_subuop_uopc(subDecUnit1_io_subuop_uopc),
    .io_subuop_inst(subDecUnit1_io_subuop_inst),
    .io_subuop_debug_inst(subDecUnit1_io_subuop_debug_inst),
    .io_subuop_is_rvc(subDecUnit1_io_subuop_is_rvc),
    .io_subuop_debug_pc(subDecUnit1_io_subuop_debug_pc),
    .io_subuop_iq_type(subDecUnit1_io_subuop_iq_type),
    .io_subuop_fu_code(subDecUnit1_io_subuop_fu_code),
    .io_subuop_ctrl_br_type(subDecUnit1_io_subuop_ctrl_br_type),
    .io_subuop_ctrl_op1_sel(subDecUnit1_io_subuop_ctrl_op1_sel),
    .io_subuop_ctrl_op2_sel(subDecUnit1_io_subuop_ctrl_op2_sel),
    .io_subuop_ctrl_imm_sel(subDecUnit1_io_subuop_ctrl_imm_sel),
    .io_subuop_ctrl_op_fcn(subDecUnit1_io_subuop_ctrl_op_fcn),
    .io_subuop_ctrl_fcn_dw(subDecUnit1_io_subuop_ctrl_fcn_dw),
    .io_subuop_ctrl_csr_cmd(subDecUnit1_io_subuop_ctrl_csr_cmd),
    .io_subuop_ctrl_is_load(subDecUnit1_io_subuop_ctrl_is_load),
    .io_subuop_ctrl_is_sta(subDecUnit1_io_subuop_ctrl_is_sta),
    .io_subuop_ctrl_is_std(subDecUnit1_io_subuop_ctrl_is_std),
    .io_subuop_ctrl_op3_sel(subDecUnit1_io_subuop_ctrl_op3_sel),
    .io_subuop_iw_state(subDecUnit1_io_subuop_iw_state),
    .io_subuop_iw_p1_poisoned(subDecUnit1_io_subuop_iw_p1_poisoned),
    .io_subuop_iw_p2_poisoned(subDecUnit1_io_subuop_iw_p2_poisoned),
    .io_subuop_is_br(subDecUnit1_io_subuop_is_br),
    .io_subuop_is_jalr(subDecUnit1_io_subuop_is_jalr),
    .io_subuop_is_jal(subDecUnit1_io_subuop_is_jal),
    .io_subuop_is_sfb(subDecUnit1_io_subuop_is_sfb),
    .io_subuop_br_mask(subDecUnit1_io_subuop_br_mask),
    .io_subuop_br_tag(subDecUnit1_io_subuop_br_tag),
    .io_subuop_ftq_idx(subDecUnit1_io_subuop_ftq_idx),
    .io_subuop_edge_inst(subDecUnit1_io_subuop_edge_inst),
    .io_subuop_pc_lob(subDecUnit1_io_subuop_pc_lob),
    .io_subuop_taken(subDecUnit1_io_subuop_taken),
    .io_subuop_imm_packed(subDecUnit1_io_subuop_imm_packed),
    .io_subuop_csr_addr(subDecUnit1_io_subuop_csr_addr),
    .io_subuop_rob_idx(subDecUnit1_io_subuop_rob_idx),
    .io_subuop_ldq_idx(subDecUnit1_io_subuop_ldq_idx),
    .io_subuop_stq_idx(subDecUnit1_io_subuop_stq_idx),
    .io_subuop_rxq_idx(subDecUnit1_io_subuop_rxq_idx),
    .io_subuop_pdst(subDecUnit1_io_subuop_pdst),
    .io_subuop_prs1(subDecUnit1_io_subuop_prs1),
    .io_subuop_prs2(subDecUnit1_io_subuop_prs2),
    .io_subuop_prs3(subDecUnit1_io_subuop_prs3),
    .io_subuop_ppred(subDecUnit1_io_subuop_ppred),
    .io_subuop_prs1_busy(subDecUnit1_io_subuop_prs1_busy),
    .io_subuop_prs2_busy(subDecUnit1_io_subuop_prs2_busy),
    .io_subuop_prs3_busy(subDecUnit1_io_subuop_prs3_busy),
    .io_subuop_ppred_busy(subDecUnit1_io_subuop_ppred_busy),
    .io_subuop_stale_pdst(subDecUnit1_io_subuop_stale_pdst),
    .io_subuop_exception(subDecUnit1_io_subuop_exception),
    .io_subuop_exc_cause(subDecUnit1_io_subuop_exc_cause),
    .io_subuop_bypassable(subDecUnit1_io_subuop_bypassable),
    .io_subuop_mem_cmd(subDecUnit1_io_subuop_mem_cmd),
    .io_subuop_mem_size(subDecUnit1_io_subuop_mem_size),
    .io_subuop_mem_signed(subDecUnit1_io_subuop_mem_signed),
    .io_subuop_is_fence(subDecUnit1_io_subuop_is_fence),
    .io_subuop_is_fencei(subDecUnit1_io_subuop_is_fencei),
    .io_subuop_is_amo(subDecUnit1_io_subuop_is_amo),
    .io_subuop_uses_ldq(subDecUnit1_io_subuop_uses_ldq),
    .io_subuop_uses_stq(subDecUnit1_io_subuop_uses_stq),
    .io_subuop_is_sys_pc2epc(subDecUnit1_io_subuop_is_sys_pc2epc),
    .io_subuop_is_unique(subDecUnit1_io_subuop_is_unique),
    .io_subuop_flush_on_commit(subDecUnit1_io_subuop_flush_on_commit),
    .io_subuop_ldst_is_rs1(subDecUnit1_io_subuop_ldst_is_rs1),
    .io_subuop_ldst(subDecUnit1_io_subuop_ldst),
    .io_subuop_lrs1(subDecUnit1_io_subuop_lrs1),
    .io_subuop_lrs2(subDecUnit1_io_subuop_lrs2),
    .io_subuop_lrs3(subDecUnit1_io_subuop_lrs3),
    .io_subuop_ldst_val(subDecUnit1_io_subuop_ldst_val),
    .io_subuop_dst_rtype(subDecUnit1_io_subuop_dst_rtype),
    .io_subuop_lrs1_rtype(subDecUnit1_io_subuop_lrs1_rtype),
    .io_subuop_lrs2_rtype(subDecUnit1_io_subuop_lrs2_rtype),
    .io_subuop_frs3_en(subDecUnit1_io_subuop_frs3_en),
    .io_subuop_fp_val(subDecUnit1_io_subuop_fp_val),
    .io_subuop_fp_single(subDecUnit1_io_subuop_fp_single),
    .io_subuop_xcpt_pf_if(subDecUnit1_io_subuop_xcpt_pf_if),
    .io_subuop_xcpt_ae_if(subDecUnit1_io_subuop_xcpt_ae_if),
    .io_subuop_xcpt_ma_if(subDecUnit1_io_subuop_xcpt_ma_if),
    .io_subuop_bp_debug_if(subDecUnit1_io_subuop_bp_debug_if),
    .io_subuop_bp_xcpt_if(subDecUnit1_io_subuop_bp_xcpt_if),
    .io_subuop_debug_fsrc(subDecUnit1_io_subuop_debug_fsrc),
    .io_subuop_debug_tsrc(subDecUnit1_io_subuop_debug_tsrc)
  );
  SubDecodeUnit subDecUnit2 ( // @[decode.scala 766:27]
    .clock(subDecUnit2_clock),
    .reset(subDecUnit2_reset),
    .io_rawuop_switch(subDecUnit2_io_rawuop_switch),
    .io_rawuop_switch_off(subDecUnit2_io_rawuop_switch_off),
    .io_rawuop_is_unicore(subDecUnit2_io_rawuop_is_unicore),
    .io_rawuop_shift(subDecUnit2_io_rawuop_shift),
    .io_rawuop_lrs3_rtype(subDecUnit2_io_rawuop_lrs3_rtype),
    .io_rawuop_rflag(subDecUnit2_io_rawuop_rflag),
    .io_rawuop_wflag(subDecUnit2_io_rawuop_wflag),
    .io_rawuop_prflag(subDecUnit2_io_rawuop_prflag),
    .io_rawuop_pwflag(subDecUnit2_io_rawuop_pwflag),
    .io_rawuop_pflag_busy(subDecUnit2_io_rawuop_pflag_busy),
    .io_rawuop_stale_pflag(subDecUnit2_io_rawuop_stale_pflag),
    .io_rawuop_op1_sel(subDecUnit2_io_rawuop_op1_sel),
    .io_rawuop_op2_sel(subDecUnit2_io_rawuop_op2_sel),
    .io_rawuop_split_num(subDecUnit2_io_rawuop_split_num),
    .io_rawuop_self_index(subDecUnit2_io_rawuop_self_index),
    .io_rawuop_rob_inst_idx(subDecUnit2_io_rawuop_rob_inst_idx),
    .io_rawuop_address_num(subDecUnit2_io_rawuop_address_num),
    .io_rawuop_uopc(subDecUnit2_io_rawuop_uopc),
    .io_rawuop_inst(subDecUnit2_io_rawuop_inst),
    .io_rawuop_debug_inst(subDecUnit2_io_rawuop_debug_inst),
    .io_rawuop_is_rvc(subDecUnit2_io_rawuop_is_rvc),
    .io_rawuop_debug_pc(subDecUnit2_io_rawuop_debug_pc),
    .io_rawuop_iq_type(subDecUnit2_io_rawuop_iq_type),
    .io_rawuop_fu_code(subDecUnit2_io_rawuop_fu_code),
    .io_rawuop_ctrl_br_type(subDecUnit2_io_rawuop_ctrl_br_type),
    .io_rawuop_ctrl_op1_sel(subDecUnit2_io_rawuop_ctrl_op1_sel),
    .io_rawuop_ctrl_op2_sel(subDecUnit2_io_rawuop_ctrl_op2_sel),
    .io_rawuop_ctrl_imm_sel(subDecUnit2_io_rawuop_ctrl_imm_sel),
    .io_rawuop_ctrl_op_fcn(subDecUnit2_io_rawuop_ctrl_op_fcn),
    .io_rawuop_ctrl_fcn_dw(subDecUnit2_io_rawuop_ctrl_fcn_dw),
    .io_rawuop_ctrl_csr_cmd(subDecUnit2_io_rawuop_ctrl_csr_cmd),
    .io_rawuop_ctrl_is_load(subDecUnit2_io_rawuop_ctrl_is_load),
    .io_rawuop_ctrl_is_sta(subDecUnit2_io_rawuop_ctrl_is_sta),
    .io_rawuop_ctrl_is_std(subDecUnit2_io_rawuop_ctrl_is_std),
    .io_rawuop_ctrl_op3_sel(subDecUnit2_io_rawuop_ctrl_op3_sel),
    .io_rawuop_iw_state(subDecUnit2_io_rawuop_iw_state),
    .io_rawuop_iw_p1_poisoned(subDecUnit2_io_rawuop_iw_p1_poisoned),
    .io_rawuop_iw_p2_poisoned(subDecUnit2_io_rawuop_iw_p2_poisoned),
    .io_rawuop_is_br(subDecUnit2_io_rawuop_is_br),
    .io_rawuop_is_jalr(subDecUnit2_io_rawuop_is_jalr),
    .io_rawuop_is_jal(subDecUnit2_io_rawuop_is_jal),
    .io_rawuop_is_sfb(subDecUnit2_io_rawuop_is_sfb),
    .io_rawuop_br_mask(subDecUnit2_io_rawuop_br_mask),
    .io_rawuop_br_tag(subDecUnit2_io_rawuop_br_tag),
    .io_rawuop_ftq_idx(subDecUnit2_io_rawuop_ftq_idx),
    .io_rawuop_edge_inst(subDecUnit2_io_rawuop_edge_inst),
    .io_rawuop_pc_lob(subDecUnit2_io_rawuop_pc_lob),
    .io_rawuop_taken(subDecUnit2_io_rawuop_taken),
    .io_rawuop_imm_packed(subDecUnit2_io_rawuop_imm_packed),
    .io_rawuop_csr_addr(subDecUnit2_io_rawuop_csr_addr),
    .io_rawuop_rob_idx(subDecUnit2_io_rawuop_rob_idx),
    .io_rawuop_ldq_idx(subDecUnit2_io_rawuop_ldq_idx),
    .io_rawuop_stq_idx(subDecUnit2_io_rawuop_stq_idx),
    .io_rawuop_rxq_idx(subDecUnit2_io_rawuop_rxq_idx),
    .io_rawuop_pdst(subDecUnit2_io_rawuop_pdst),
    .io_rawuop_prs1(subDecUnit2_io_rawuop_prs1),
    .io_rawuop_prs2(subDecUnit2_io_rawuop_prs2),
    .io_rawuop_prs3(subDecUnit2_io_rawuop_prs3),
    .io_rawuop_ppred(subDecUnit2_io_rawuop_ppred),
    .io_rawuop_prs1_busy(subDecUnit2_io_rawuop_prs1_busy),
    .io_rawuop_prs2_busy(subDecUnit2_io_rawuop_prs2_busy),
    .io_rawuop_prs3_busy(subDecUnit2_io_rawuop_prs3_busy),
    .io_rawuop_ppred_busy(subDecUnit2_io_rawuop_ppred_busy),
    .io_rawuop_stale_pdst(subDecUnit2_io_rawuop_stale_pdst),
    .io_rawuop_exception(subDecUnit2_io_rawuop_exception),
    .io_rawuop_exc_cause(subDecUnit2_io_rawuop_exc_cause),
    .io_rawuop_bypassable(subDecUnit2_io_rawuop_bypassable),
    .io_rawuop_mem_cmd(subDecUnit2_io_rawuop_mem_cmd),
    .io_rawuop_mem_size(subDecUnit2_io_rawuop_mem_size),
    .io_rawuop_mem_signed(subDecUnit2_io_rawuop_mem_signed),
    .io_rawuop_is_fence(subDecUnit2_io_rawuop_is_fence),
    .io_rawuop_is_fencei(subDecUnit2_io_rawuop_is_fencei),
    .io_rawuop_is_amo(subDecUnit2_io_rawuop_is_amo),
    .io_rawuop_uses_ldq(subDecUnit2_io_rawuop_uses_ldq),
    .io_rawuop_uses_stq(subDecUnit2_io_rawuop_uses_stq),
    .io_rawuop_is_sys_pc2epc(subDecUnit2_io_rawuop_is_sys_pc2epc),
    .io_rawuop_is_unique(subDecUnit2_io_rawuop_is_unique),
    .io_rawuop_flush_on_commit(subDecUnit2_io_rawuop_flush_on_commit),
    .io_rawuop_ldst_is_rs1(subDecUnit2_io_rawuop_ldst_is_rs1),
    .io_rawuop_ldst(subDecUnit2_io_rawuop_ldst),
    .io_rawuop_lrs1(subDecUnit2_io_rawuop_lrs1),
    .io_rawuop_lrs2(subDecUnit2_io_rawuop_lrs2),
    .io_rawuop_lrs3(subDecUnit2_io_rawuop_lrs3),
    .io_rawuop_ldst_val(subDecUnit2_io_rawuop_ldst_val),
    .io_rawuop_dst_rtype(subDecUnit2_io_rawuop_dst_rtype),
    .io_rawuop_lrs1_rtype(subDecUnit2_io_rawuop_lrs1_rtype),
    .io_rawuop_lrs2_rtype(subDecUnit2_io_rawuop_lrs2_rtype),
    .io_rawuop_frs3_en(subDecUnit2_io_rawuop_frs3_en),
    .io_rawuop_fp_val(subDecUnit2_io_rawuop_fp_val),
    .io_rawuop_fp_single(subDecUnit2_io_rawuop_fp_single),
    .io_rawuop_xcpt_pf_if(subDecUnit2_io_rawuop_xcpt_pf_if),
    .io_rawuop_xcpt_ae_if(subDecUnit2_io_rawuop_xcpt_ae_if),
    .io_rawuop_xcpt_ma_if(subDecUnit2_io_rawuop_xcpt_ma_if),
    .io_rawuop_bp_debug_if(subDecUnit2_io_rawuop_bp_debug_if),
    .io_rawuop_bp_xcpt_if(subDecUnit2_io_rawuop_bp_xcpt_if),
    .io_rawuop_debug_fsrc(subDecUnit2_io_rawuop_debug_fsrc),
    .io_rawuop_debug_tsrc(subDecUnit2_io_rawuop_debug_tsrc),
    .io_cs_sub_valid(subDecUnit2_io_cs_sub_valid),
    .io_cs_sub_fp_val(subDecUnit2_io_cs_sub_fp_val),
    .io_cs_sub_fp_single(subDecUnit2_io_cs_sub_fp_single),
    .io_cs_sub_uopc(subDecUnit2_io_cs_sub_uopc),
    .io_cs_sub_iq_type(subDecUnit2_io_cs_sub_iq_type),
    .io_cs_sub_fu_code(subDecUnit2_io_cs_sub_fu_code),
    .io_cs_sub_uses_ldq(subDecUnit2_io_cs_sub_uses_ldq),
    .io_cs_sub_uses_stq(subDecUnit2_io_cs_sub_uses_stq),
    .io_cs_sub_is_br(subDecUnit2_io_cs_sub_is_br),
    .io_cs_sub_dst_type(subDecUnit2_io_cs_sub_dst_type),
    .io_cs_sub_rs1_type(subDecUnit2_io_cs_sub_rs1_type),
    .io_cs_sub_rs2_type(subDecUnit2_io_cs_sub_rs2_type),
    .io_cs_sub_rtemp1(subDecUnit2_io_cs_sub_rtemp1),
    .io_cs_sub_rtemp2(subDecUnit2_io_cs_sub_rtemp2),
    .io_cs_sub_wtemp(subDecUnit2_io_cs_sub_wtemp),
    .io_cs_sub_wflag(subDecUnit2_io_cs_sub_wflag),
    .io_cs_sub_rflag(subDecUnit2_io_cs_sub_rflag),
    .io_cs_sub_imm_sel(subDecUnit2_io_cs_sub_imm_sel),
    .io_cs_sub_wakeup_delay(subDecUnit2_io_cs_sub_wakeup_delay),
    .io_cs_sub_bypassable(subDecUnit2_io_cs_sub_bypassable),
    .io_cs_sub_mem_cmd(subDecUnit2_io_cs_sub_mem_cmd),
    .io_cs_sub_mem_size(subDecUnit2_io_cs_sub_mem_size),
    .io_cs_sub_shift(subDecUnit2_io_cs_sub_shift),
    .io_cs_sub_split_num(subDecUnit2_io_cs_sub_split_num),
    .io_cs_sub_op1_sel(subDecUnit2_io_cs_sub_op1_sel),
    .io_cs_sub_op2_sel(subDecUnit2_io_cs_sub_op2_sel),
    .io_subuop_switch(subDecUnit2_io_subuop_switch),
    .io_subuop_switch_off(subDecUnit2_io_subuop_switch_off),
    .io_subuop_is_unicore(subDecUnit2_io_subuop_is_unicore),
    .io_subuop_shift(subDecUnit2_io_subuop_shift),
    .io_subuop_lrs3_rtype(subDecUnit2_io_subuop_lrs3_rtype),
    .io_subuop_rflag(subDecUnit2_io_subuop_rflag),
    .io_subuop_wflag(subDecUnit2_io_subuop_wflag),
    .io_subuop_prflag(subDecUnit2_io_subuop_prflag),
    .io_subuop_pwflag(subDecUnit2_io_subuop_pwflag),
    .io_subuop_pflag_busy(subDecUnit2_io_subuop_pflag_busy),
    .io_subuop_stale_pflag(subDecUnit2_io_subuop_stale_pflag),
    .io_subuop_op1_sel(subDecUnit2_io_subuop_op1_sel),
    .io_subuop_op2_sel(subDecUnit2_io_subuop_op2_sel),
    .io_subuop_split_num(subDecUnit2_io_subuop_split_num),
    .io_subuop_self_index(subDecUnit2_io_subuop_self_index),
    .io_subuop_rob_inst_idx(subDecUnit2_io_subuop_rob_inst_idx),
    .io_subuop_address_num(subDecUnit2_io_subuop_address_num),
    .io_subuop_uopc(subDecUnit2_io_subuop_uopc),
    .io_subuop_inst(subDecUnit2_io_subuop_inst),
    .io_subuop_debug_inst(subDecUnit2_io_subuop_debug_inst),
    .io_subuop_is_rvc(subDecUnit2_io_subuop_is_rvc),
    .io_subuop_debug_pc(subDecUnit2_io_subuop_debug_pc),
    .io_subuop_iq_type(subDecUnit2_io_subuop_iq_type),
    .io_subuop_fu_code(subDecUnit2_io_subuop_fu_code),
    .io_subuop_ctrl_br_type(subDecUnit2_io_subuop_ctrl_br_type),
    .io_subuop_ctrl_op1_sel(subDecUnit2_io_subuop_ctrl_op1_sel),
    .io_subuop_ctrl_op2_sel(subDecUnit2_io_subuop_ctrl_op2_sel),
    .io_subuop_ctrl_imm_sel(subDecUnit2_io_subuop_ctrl_imm_sel),
    .io_subuop_ctrl_op_fcn(subDecUnit2_io_subuop_ctrl_op_fcn),
    .io_subuop_ctrl_fcn_dw(subDecUnit2_io_subuop_ctrl_fcn_dw),
    .io_subuop_ctrl_csr_cmd(subDecUnit2_io_subuop_ctrl_csr_cmd),
    .io_subuop_ctrl_is_load(subDecUnit2_io_subuop_ctrl_is_load),
    .io_subuop_ctrl_is_sta(subDecUnit2_io_subuop_ctrl_is_sta),
    .io_subuop_ctrl_is_std(subDecUnit2_io_subuop_ctrl_is_std),
    .io_subuop_ctrl_op3_sel(subDecUnit2_io_subuop_ctrl_op3_sel),
    .io_subuop_iw_state(subDecUnit2_io_subuop_iw_state),
    .io_subuop_iw_p1_poisoned(subDecUnit2_io_subuop_iw_p1_poisoned),
    .io_subuop_iw_p2_poisoned(subDecUnit2_io_subuop_iw_p2_poisoned),
    .io_subuop_is_br(subDecUnit2_io_subuop_is_br),
    .io_subuop_is_jalr(subDecUnit2_io_subuop_is_jalr),
    .io_subuop_is_jal(subDecUnit2_io_subuop_is_jal),
    .io_subuop_is_sfb(subDecUnit2_io_subuop_is_sfb),
    .io_subuop_br_mask(subDecUnit2_io_subuop_br_mask),
    .io_subuop_br_tag(subDecUnit2_io_subuop_br_tag),
    .io_subuop_ftq_idx(subDecUnit2_io_subuop_ftq_idx),
    .io_subuop_edge_inst(subDecUnit2_io_subuop_edge_inst),
    .io_subuop_pc_lob(subDecUnit2_io_subuop_pc_lob),
    .io_subuop_taken(subDecUnit2_io_subuop_taken),
    .io_subuop_imm_packed(subDecUnit2_io_subuop_imm_packed),
    .io_subuop_csr_addr(subDecUnit2_io_subuop_csr_addr),
    .io_subuop_rob_idx(subDecUnit2_io_subuop_rob_idx),
    .io_subuop_ldq_idx(subDecUnit2_io_subuop_ldq_idx),
    .io_subuop_stq_idx(subDecUnit2_io_subuop_stq_idx),
    .io_subuop_rxq_idx(subDecUnit2_io_subuop_rxq_idx),
    .io_subuop_pdst(subDecUnit2_io_subuop_pdst),
    .io_subuop_prs1(subDecUnit2_io_subuop_prs1),
    .io_subuop_prs2(subDecUnit2_io_subuop_prs2),
    .io_subuop_prs3(subDecUnit2_io_subuop_prs3),
    .io_subuop_ppred(subDecUnit2_io_subuop_ppred),
    .io_subuop_prs1_busy(subDecUnit2_io_subuop_prs1_busy),
    .io_subuop_prs2_busy(subDecUnit2_io_subuop_prs2_busy),
    .io_subuop_prs3_busy(subDecUnit2_io_subuop_prs3_busy),
    .io_subuop_ppred_busy(subDecUnit2_io_subuop_ppred_busy),
    .io_subuop_stale_pdst(subDecUnit2_io_subuop_stale_pdst),
    .io_subuop_exception(subDecUnit2_io_subuop_exception),
    .io_subuop_exc_cause(subDecUnit2_io_subuop_exc_cause),
    .io_subuop_bypassable(subDecUnit2_io_subuop_bypassable),
    .io_subuop_mem_cmd(subDecUnit2_io_subuop_mem_cmd),
    .io_subuop_mem_size(subDecUnit2_io_subuop_mem_size),
    .io_subuop_mem_signed(subDecUnit2_io_subuop_mem_signed),
    .io_subuop_is_fence(subDecUnit2_io_subuop_is_fence),
    .io_subuop_is_fencei(subDecUnit2_io_subuop_is_fencei),
    .io_subuop_is_amo(subDecUnit2_io_subuop_is_amo),
    .io_subuop_uses_ldq(subDecUnit2_io_subuop_uses_ldq),
    .io_subuop_uses_stq(subDecUnit2_io_subuop_uses_stq),
    .io_subuop_is_sys_pc2epc(subDecUnit2_io_subuop_is_sys_pc2epc),
    .io_subuop_is_unique(subDecUnit2_io_subuop_is_unique),
    .io_subuop_flush_on_commit(subDecUnit2_io_subuop_flush_on_commit),
    .io_subuop_ldst_is_rs1(subDecUnit2_io_subuop_ldst_is_rs1),
    .io_subuop_ldst(subDecUnit2_io_subuop_ldst),
    .io_subuop_lrs1(subDecUnit2_io_subuop_lrs1),
    .io_subuop_lrs2(subDecUnit2_io_subuop_lrs2),
    .io_subuop_lrs3(subDecUnit2_io_subuop_lrs3),
    .io_subuop_ldst_val(subDecUnit2_io_subuop_ldst_val),
    .io_subuop_dst_rtype(subDecUnit2_io_subuop_dst_rtype),
    .io_subuop_lrs1_rtype(subDecUnit2_io_subuop_lrs1_rtype),
    .io_subuop_lrs2_rtype(subDecUnit2_io_subuop_lrs2_rtype),
    .io_subuop_frs3_en(subDecUnit2_io_subuop_frs3_en),
    .io_subuop_fp_val(subDecUnit2_io_subuop_fp_val),
    .io_subuop_fp_single(subDecUnit2_io_subuop_fp_single),
    .io_subuop_xcpt_pf_if(subDecUnit2_io_subuop_xcpt_pf_if),
    .io_subuop_xcpt_ae_if(subDecUnit2_io_subuop_xcpt_ae_if),
    .io_subuop_xcpt_ma_if(subDecUnit2_io_subuop_xcpt_ma_if),
    .io_subuop_bp_debug_if(subDecUnit2_io_subuop_bp_debug_if),
    .io_subuop_bp_xcpt_if(subDecUnit2_io_subuop_bp_xcpt_if),
    .io_subuop_debug_fsrc(subDecUnit2_io_subuop_debug_fsrc),
    .io_subuop_debug_tsrc(subDecUnit2_io_subuop_debug_tsrc)
  );
  SubDecodeUnit subDecUnit3 ( // @[decode.scala 767:27]
    .clock(subDecUnit3_clock),
    .reset(subDecUnit3_reset),
    .io_rawuop_switch(subDecUnit3_io_rawuop_switch),
    .io_rawuop_switch_off(subDecUnit3_io_rawuop_switch_off),
    .io_rawuop_is_unicore(subDecUnit3_io_rawuop_is_unicore),
    .io_rawuop_shift(subDecUnit3_io_rawuop_shift),
    .io_rawuop_lrs3_rtype(subDecUnit3_io_rawuop_lrs3_rtype),
    .io_rawuop_rflag(subDecUnit3_io_rawuop_rflag),
    .io_rawuop_wflag(subDecUnit3_io_rawuop_wflag),
    .io_rawuop_prflag(subDecUnit3_io_rawuop_prflag),
    .io_rawuop_pwflag(subDecUnit3_io_rawuop_pwflag),
    .io_rawuop_pflag_busy(subDecUnit3_io_rawuop_pflag_busy),
    .io_rawuop_stale_pflag(subDecUnit3_io_rawuop_stale_pflag),
    .io_rawuop_op1_sel(subDecUnit3_io_rawuop_op1_sel),
    .io_rawuop_op2_sel(subDecUnit3_io_rawuop_op2_sel),
    .io_rawuop_split_num(subDecUnit3_io_rawuop_split_num),
    .io_rawuop_self_index(subDecUnit3_io_rawuop_self_index),
    .io_rawuop_rob_inst_idx(subDecUnit3_io_rawuop_rob_inst_idx),
    .io_rawuop_address_num(subDecUnit3_io_rawuop_address_num),
    .io_rawuop_uopc(subDecUnit3_io_rawuop_uopc),
    .io_rawuop_inst(subDecUnit3_io_rawuop_inst),
    .io_rawuop_debug_inst(subDecUnit3_io_rawuop_debug_inst),
    .io_rawuop_is_rvc(subDecUnit3_io_rawuop_is_rvc),
    .io_rawuop_debug_pc(subDecUnit3_io_rawuop_debug_pc),
    .io_rawuop_iq_type(subDecUnit3_io_rawuop_iq_type),
    .io_rawuop_fu_code(subDecUnit3_io_rawuop_fu_code),
    .io_rawuop_ctrl_br_type(subDecUnit3_io_rawuop_ctrl_br_type),
    .io_rawuop_ctrl_op1_sel(subDecUnit3_io_rawuop_ctrl_op1_sel),
    .io_rawuop_ctrl_op2_sel(subDecUnit3_io_rawuop_ctrl_op2_sel),
    .io_rawuop_ctrl_imm_sel(subDecUnit3_io_rawuop_ctrl_imm_sel),
    .io_rawuop_ctrl_op_fcn(subDecUnit3_io_rawuop_ctrl_op_fcn),
    .io_rawuop_ctrl_fcn_dw(subDecUnit3_io_rawuop_ctrl_fcn_dw),
    .io_rawuop_ctrl_csr_cmd(subDecUnit3_io_rawuop_ctrl_csr_cmd),
    .io_rawuop_ctrl_is_load(subDecUnit3_io_rawuop_ctrl_is_load),
    .io_rawuop_ctrl_is_sta(subDecUnit3_io_rawuop_ctrl_is_sta),
    .io_rawuop_ctrl_is_std(subDecUnit3_io_rawuop_ctrl_is_std),
    .io_rawuop_ctrl_op3_sel(subDecUnit3_io_rawuop_ctrl_op3_sel),
    .io_rawuop_iw_state(subDecUnit3_io_rawuop_iw_state),
    .io_rawuop_iw_p1_poisoned(subDecUnit3_io_rawuop_iw_p1_poisoned),
    .io_rawuop_iw_p2_poisoned(subDecUnit3_io_rawuop_iw_p2_poisoned),
    .io_rawuop_is_br(subDecUnit3_io_rawuop_is_br),
    .io_rawuop_is_jalr(subDecUnit3_io_rawuop_is_jalr),
    .io_rawuop_is_jal(subDecUnit3_io_rawuop_is_jal),
    .io_rawuop_is_sfb(subDecUnit3_io_rawuop_is_sfb),
    .io_rawuop_br_mask(subDecUnit3_io_rawuop_br_mask),
    .io_rawuop_br_tag(subDecUnit3_io_rawuop_br_tag),
    .io_rawuop_ftq_idx(subDecUnit3_io_rawuop_ftq_idx),
    .io_rawuop_edge_inst(subDecUnit3_io_rawuop_edge_inst),
    .io_rawuop_pc_lob(subDecUnit3_io_rawuop_pc_lob),
    .io_rawuop_taken(subDecUnit3_io_rawuop_taken),
    .io_rawuop_imm_packed(subDecUnit3_io_rawuop_imm_packed),
    .io_rawuop_csr_addr(subDecUnit3_io_rawuop_csr_addr),
    .io_rawuop_rob_idx(subDecUnit3_io_rawuop_rob_idx),
    .io_rawuop_ldq_idx(subDecUnit3_io_rawuop_ldq_idx),
    .io_rawuop_stq_idx(subDecUnit3_io_rawuop_stq_idx),
    .io_rawuop_rxq_idx(subDecUnit3_io_rawuop_rxq_idx),
    .io_rawuop_pdst(subDecUnit3_io_rawuop_pdst),
    .io_rawuop_prs1(subDecUnit3_io_rawuop_prs1),
    .io_rawuop_prs2(subDecUnit3_io_rawuop_prs2),
    .io_rawuop_prs3(subDecUnit3_io_rawuop_prs3),
    .io_rawuop_ppred(subDecUnit3_io_rawuop_ppred),
    .io_rawuop_prs1_busy(subDecUnit3_io_rawuop_prs1_busy),
    .io_rawuop_prs2_busy(subDecUnit3_io_rawuop_prs2_busy),
    .io_rawuop_prs3_busy(subDecUnit3_io_rawuop_prs3_busy),
    .io_rawuop_ppred_busy(subDecUnit3_io_rawuop_ppred_busy),
    .io_rawuop_stale_pdst(subDecUnit3_io_rawuop_stale_pdst),
    .io_rawuop_exception(subDecUnit3_io_rawuop_exception),
    .io_rawuop_exc_cause(subDecUnit3_io_rawuop_exc_cause),
    .io_rawuop_bypassable(subDecUnit3_io_rawuop_bypassable),
    .io_rawuop_mem_cmd(subDecUnit3_io_rawuop_mem_cmd),
    .io_rawuop_mem_size(subDecUnit3_io_rawuop_mem_size),
    .io_rawuop_mem_signed(subDecUnit3_io_rawuop_mem_signed),
    .io_rawuop_is_fence(subDecUnit3_io_rawuop_is_fence),
    .io_rawuop_is_fencei(subDecUnit3_io_rawuop_is_fencei),
    .io_rawuop_is_amo(subDecUnit3_io_rawuop_is_amo),
    .io_rawuop_uses_ldq(subDecUnit3_io_rawuop_uses_ldq),
    .io_rawuop_uses_stq(subDecUnit3_io_rawuop_uses_stq),
    .io_rawuop_is_sys_pc2epc(subDecUnit3_io_rawuop_is_sys_pc2epc),
    .io_rawuop_is_unique(subDecUnit3_io_rawuop_is_unique),
    .io_rawuop_flush_on_commit(subDecUnit3_io_rawuop_flush_on_commit),
    .io_rawuop_ldst_is_rs1(subDecUnit3_io_rawuop_ldst_is_rs1),
    .io_rawuop_ldst(subDecUnit3_io_rawuop_ldst),
    .io_rawuop_lrs1(subDecUnit3_io_rawuop_lrs1),
    .io_rawuop_lrs2(subDecUnit3_io_rawuop_lrs2),
    .io_rawuop_lrs3(subDecUnit3_io_rawuop_lrs3),
    .io_rawuop_ldst_val(subDecUnit3_io_rawuop_ldst_val),
    .io_rawuop_dst_rtype(subDecUnit3_io_rawuop_dst_rtype),
    .io_rawuop_lrs1_rtype(subDecUnit3_io_rawuop_lrs1_rtype),
    .io_rawuop_lrs2_rtype(subDecUnit3_io_rawuop_lrs2_rtype),
    .io_rawuop_frs3_en(subDecUnit3_io_rawuop_frs3_en),
    .io_rawuop_fp_val(subDecUnit3_io_rawuop_fp_val),
    .io_rawuop_fp_single(subDecUnit3_io_rawuop_fp_single),
    .io_rawuop_xcpt_pf_if(subDecUnit3_io_rawuop_xcpt_pf_if),
    .io_rawuop_xcpt_ae_if(subDecUnit3_io_rawuop_xcpt_ae_if),
    .io_rawuop_xcpt_ma_if(subDecUnit3_io_rawuop_xcpt_ma_if),
    .io_rawuop_bp_debug_if(subDecUnit3_io_rawuop_bp_debug_if),
    .io_rawuop_bp_xcpt_if(subDecUnit3_io_rawuop_bp_xcpt_if),
    .io_rawuop_debug_fsrc(subDecUnit3_io_rawuop_debug_fsrc),
    .io_rawuop_debug_tsrc(subDecUnit3_io_rawuop_debug_tsrc),
    .io_cs_sub_valid(subDecUnit3_io_cs_sub_valid),
    .io_cs_sub_fp_val(subDecUnit3_io_cs_sub_fp_val),
    .io_cs_sub_fp_single(subDecUnit3_io_cs_sub_fp_single),
    .io_cs_sub_uopc(subDecUnit3_io_cs_sub_uopc),
    .io_cs_sub_iq_type(subDecUnit3_io_cs_sub_iq_type),
    .io_cs_sub_fu_code(subDecUnit3_io_cs_sub_fu_code),
    .io_cs_sub_uses_ldq(subDecUnit3_io_cs_sub_uses_ldq),
    .io_cs_sub_uses_stq(subDecUnit3_io_cs_sub_uses_stq),
    .io_cs_sub_is_br(subDecUnit3_io_cs_sub_is_br),
    .io_cs_sub_dst_type(subDecUnit3_io_cs_sub_dst_type),
    .io_cs_sub_rs1_type(subDecUnit3_io_cs_sub_rs1_type),
    .io_cs_sub_rs2_type(subDecUnit3_io_cs_sub_rs2_type),
    .io_cs_sub_rtemp1(subDecUnit3_io_cs_sub_rtemp1),
    .io_cs_sub_rtemp2(subDecUnit3_io_cs_sub_rtemp2),
    .io_cs_sub_wtemp(subDecUnit3_io_cs_sub_wtemp),
    .io_cs_sub_wflag(subDecUnit3_io_cs_sub_wflag),
    .io_cs_sub_rflag(subDecUnit3_io_cs_sub_rflag),
    .io_cs_sub_imm_sel(subDecUnit3_io_cs_sub_imm_sel),
    .io_cs_sub_wakeup_delay(subDecUnit3_io_cs_sub_wakeup_delay),
    .io_cs_sub_bypassable(subDecUnit3_io_cs_sub_bypassable),
    .io_cs_sub_mem_cmd(subDecUnit3_io_cs_sub_mem_cmd),
    .io_cs_sub_mem_size(subDecUnit3_io_cs_sub_mem_size),
    .io_cs_sub_shift(subDecUnit3_io_cs_sub_shift),
    .io_cs_sub_split_num(subDecUnit3_io_cs_sub_split_num),
    .io_cs_sub_op1_sel(subDecUnit3_io_cs_sub_op1_sel),
    .io_cs_sub_op2_sel(subDecUnit3_io_cs_sub_op2_sel),
    .io_subuop_switch(subDecUnit3_io_subuop_switch),
    .io_subuop_switch_off(subDecUnit3_io_subuop_switch_off),
    .io_subuop_is_unicore(subDecUnit3_io_subuop_is_unicore),
    .io_subuop_shift(subDecUnit3_io_subuop_shift),
    .io_subuop_lrs3_rtype(subDecUnit3_io_subuop_lrs3_rtype),
    .io_subuop_rflag(subDecUnit3_io_subuop_rflag),
    .io_subuop_wflag(subDecUnit3_io_subuop_wflag),
    .io_subuop_prflag(subDecUnit3_io_subuop_prflag),
    .io_subuop_pwflag(subDecUnit3_io_subuop_pwflag),
    .io_subuop_pflag_busy(subDecUnit3_io_subuop_pflag_busy),
    .io_subuop_stale_pflag(subDecUnit3_io_subuop_stale_pflag),
    .io_subuop_op1_sel(subDecUnit3_io_subuop_op1_sel),
    .io_subuop_op2_sel(subDecUnit3_io_subuop_op2_sel),
    .io_subuop_split_num(subDecUnit3_io_subuop_split_num),
    .io_subuop_self_index(subDecUnit3_io_subuop_self_index),
    .io_subuop_rob_inst_idx(subDecUnit3_io_subuop_rob_inst_idx),
    .io_subuop_address_num(subDecUnit3_io_subuop_address_num),
    .io_subuop_uopc(subDecUnit3_io_subuop_uopc),
    .io_subuop_inst(subDecUnit3_io_subuop_inst),
    .io_subuop_debug_inst(subDecUnit3_io_subuop_debug_inst),
    .io_subuop_is_rvc(subDecUnit3_io_subuop_is_rvc),
    .io_subuop_debug_pc(subDecUnit3_io_subuop_debug_pc),
    .io_subuop_iq_type(subDecUnit3_io_subuop_iq_type),
    .io_subuop_fu_code(subDecUnit3_io_subuop_fu_code),
    .io_subuop_ctrl_br_type(subDecUnit3_io_subuop_ctrl_br_type),
    .io_subuop_ctrl_op1_sel(subDecUnit3_io_subuop_ctrl_op1_sel),
    .io_subuop_ctrl_op2_sel(subDecUnit3_io_subuop_ctrl_op2_sel),
    .io_subuop_ctrl_imm_sel(subDecUnit3_io_subuop_ctrl_imm_sel),
    .io_subuop_ctrl_op_fcn(subDecUnit3_io_subuop_ctrl_op_fcn),
    .io_subuop_ctrl_fcn_dw(subDecUnit3_io_subuop_ctrl_fcn_dw),
    .io_subuop_ctrl_csr_cmd(subDecUnit3_io_subuop_ctrl_csr_cmd),
    .io_subuop_ctrl_is_load(subDecUnit3_io_subuop_ctrl_is_load),
    .io_subuop_ctrl_is_sta(subDecUnit3_io_subuop_ctrl_is_sta),
    .io_subuop_ctrl_is_std(subDecUnit3_io_subuop_ctrl_is_std),
    .io_subuop_ctrl_op3_sel(subDecUnit3_io_subuop_ctrl_op3_sel),
    .io_subuop_iw_state(subDecUnit3_io_subuop_iw_state),
    .io_subuop_iw_p1_poisoned(subDecUnit3_io_subuop_iw_p1_poisoned),
    .io_subuop_iw_p2_poisoned(subDecUnit3_io_subuop_iw_p2_poisoned),
    .io_subuop_is_br(subDecUnit3_io_subuop_is_br),
    .io_subuop_is_jalr(subDecUnit3_io_subuop_is_jalr),
    .io_subuop_is_jal(subDecUnit3_io_subuop_is_jal),
    .io_subuop_is_sfb(subDecUnit3_io_subuop_is_sfb),
    .io_subuop_br_mask(subDecUnit3_io_subuop_br_mask),
    .io_subuop_br_tag(subDecUnit3_io_subuop_br_tag),
    .io_subuop_ftq_idx(subDecUnit3_io_subuop_ftq_idx),
    .io_subuop_edge_inst(subDecUnit3_io_subuop_edge_inst),
    .io_subuop_pc_lob(subDecUnit3_io_subuop_pc_lob),
    .io_subuop_taken(subDecUnit3_io_subuop_taken),
    .io_subuop_imm_packed(subDecUnit3_io_subuop_imm_packed),
    .io_subuop_csr_addr(subDecUnit3_io_subuop_csr_addr),
    .io_subuop_rob_idx(subDecUnit3_io_subuop_rob_idx),
    .io_subuop_ldq_idx(subDecUnit3_io_subuop_ldq_idx),
    .io_subuop_stq_idx(subDecUnit3_io_subuop_stq_idx),
    .io_subuop_rxq_idx(subDecUnit3_io_subuop_rxq_idx),
    .io_subuop_pdst(subDecUnit3_io_subuop_pdst),
    .io_subuop_prs1(subDecUnit3_io_subuop_prs1),
    .io_subuop_prs2(subDecUnit3_io_subuop_prs2),
    .io_subuop_prs3(subDecUnit3_io_subuop_prs3),
    .io_subuop_ppred(subDecUnit3_io_subuop_ppred),
    .io_subuop_prs1_busy(subDecUnit3_io_subuop_prs1_busy),
    .io_subuop_prs2_busy(subDecUnit3_io_subuop_prs2_busy),
    .io_subuop_prs3_busy(subDecUnit3_io_subuop_prs3_busy),
    .io_subuop_ppred_busy(subDecUnit3_io_subuop_ppred_busy),
    .io_subuop_stale_pdst(subDecUnit3_io_subuop_stale_pdst),
    .io_subuop_exception(subDecUnit3_io_subuop_exception),
    .io_subuop_exc_cause(subDecUnit3_io_subuop_exc_cause),
    .io_subuop_bypassable(subDecUnit3_io_subuop_bypassable),
    .io_subuop_mem_cmd(subDecUnit3_io_subuop_mem_cmd),
    .io_subuop_mem_size(subDecUnit3_io_subuop_mem_size),
    .io_subuop_mem_signed(subDecUnit3_io_subuop_mem_signed),
    .io_subuop_is_fence(subDecUnit3_io_subuop_is_fence),
    .io_subuop_is_fencei(subDecUnit3_io_subuop_is_fencei),
    .io_subuop_is_amo(subDecUnit3_io_subuop_is_amo),
    .io_subuop_uses_ldq(subDecUnit3_io_subuop_uses_ldq),
    .io_subuop_uses_stq(subDecUnit3_io_subuop_uses_stq),
    .io_subuop_is_sys_pc2epc(subDecUnit3_io_subuop_is_sys_pc2epc),
    .io_subuop_is_unique(subDecUnit3_io_subuop_is_unique),
    .io_subuop_flush_on_commit(subDecUnit3_io_subuop_flush_on_commit),
    .io_subuop_ldst_is_rs1(subDecUnit3_io_subuop_ldst_is_rs1),
    .io_subuop_ldst(subDecUnit3_io_subuop_ldst),
    .io_subuop_lrs1(subDecUnit3_io_subuop_lrs1),
    .io_subuop_lrs2(subDecUnit3_io_subuop_lrs2),
    .io_subuop_lrs3(subDecUnit3_io_subuop_lrs3),
    .io_subuop_ldst_val(subDecUnit3_io_subuop_ldst_val),
    .io_subuop_dst_rtype(subDecUnit3_io_subuop_dst_rtype),
    .io_subuop_lrs1_rtype(subDecUnit3_io_subuop_lrs1_rtype),
    .io_subuop_lrs2_rtype(subDecUnit3_io_subuop_lrs2_rtype),
    .io_subuop_frs3_en(subDecUnit3_io_subuop_frs3_en),
    .io_subuop_fp_val(subDecUnit3_io_subuop_fp_val),
    .io_subuop_fp_single(subDecUnit3_io_subuop_fp_single),
    .io_subuop_xcpt_pf_if(subDecUnit3_io_subuop_xcpt_pf_if),
    .io_subuop_xcpt_ae_if(subDecUnit3_io_subuop_xcpt_ae_if),
    .io_subuop_xcpt_ma_if(subDecUnit3_io_subuop_xcpt_ma_if),
    .io_subuop_bp_debug_if(subDecUnit3_io_subuop_bp_debug_if),
    .io_subuop_bp_xcpt_if(subDecUnit3_io_subuop_bp_xcpt_if),
    .io_subuop_debug_fsrc(subDecUnit3_io_subuop_debug_fsrc),
    .io_subuop_debug_tsrc(subDecUnit3_io_subuop_debug_tsrc)
  );
  SubDecodeUnit SubDecodeUnit ( // @[decode.scala 793:25]
    .clock(SubDecodeUnit_clock),
    .reset(SubDecodeUnit_reset),
    .io_rawuop_switch(SubDecodeUnit_io_rawuop_switch),
    .io_rawuop_switch_off(SubDecodeUnit_io_rawuop_switch_off),
    .io_rawuop_is_unicore(SubDecodeUnit_io_rawuop_is_unicore),
    .io_rawuop_shift(SubDecodeUnit_io_rawuop_shift),
    .io_rawuop_lrs3_rtype(SubDecodeUnit_io_rawuop_lrs3_rtype),
    .io_rawuop_rflag(SubDecodeUnit_io_rawuop_rflag),
    .io_rawuop_wflag(SubDecodeUnit_io_rawuop_wflag),
    .io_rawuop_prflag(SubDecodeUnit_io_rawuop_prflag),
    .io_rawuop_pwflag(SubDecodeUnit_io_rawuop_pwflag),
    .io_rawuop_pflag_busy(SubDecodeUnit_io_rawuop_pflag_busy),
    .io_rawuop_stale_pflag(SubDecodeUnit_io_rawuop_stale_pflag),
    .io_rawuop_op1_sel(SubDecodeUnit_io_rawuop_op1_sel),
    .io_rawuop_op2_sel(SubDecodeUnit_io_rawuop_op2_sel),
    .io_rawuop_split_num(SubDecodeUnit_io_rawuop_split_num),
    .io_rawuop_self_index(SubDecodeUnit_io_rawuop_self_index),
    .io_rawuop_rob_inst_idx(SubDecodeUnit_io_rawuop_rob_inst_idx),
    .io_rawuop_address_num(SubDecodeUnit_io_rawuop_address_num),
    .io_rawuop_uopc(SubDecodeUnit_io_rawuop_uopc),
    .io_rawuop_inst(SubDecodeUnit_io_rawuop_inst),
    .io_rawuop_debug_inst(SubDecodeUnit_io_rawuop_debug_inst),
    .io_rawuop_is_rvc(SubDecodeUnit_io_rawuop_is_rvc),
    .io_rawuop_debug_pc(SubDecodeUnit_io_rawuop_debug_pc),
    .io_rawuop_iq_type(SubDecodeUnit_io_rawuop_iq_type),
    .io_rawuop_fu_code(SubDecodeUnit_io_rawuop_fu_code),
    .io_rawuop_ctrl_br_type(SubDecodeUnit_io_rawuop_ctrl_br_type),
    .io_rawuop_ctrl_op1_sel(SubDecodeUnit_io_rawuop_ctrl_op1_sel),
    .io_rawuop_ctrl_op2_sel(SubDecodeUnit_io_rawuop_ctrl_op2_sel),
    .io_rawuop_ctrl_imm_sel(SubDecodeUnit_io_rawuop_ctrl_imm_sel),
    .io_rawuop_ctrl_op_fcn(SubDecodeUnit_io_rawuop_ctrl_op_fcn),
    .io_rawuop_ctrl_fcn_dw(SubDecodeUnit_io_rawuop_ctrl_fcn_dw),
    .io_rawuop_ctrl_csr_cmd(SubDecodeUnit_io_rawuop_ctrl_csr_cmd),
    .io_rawuop_ctrl_is_load(SubDecodeUnit_io_rawuop_ctrl_is_load),
    .io_rawuop_ctrl_is_sta(SubDecodeUnit_io_rawuop_ctrl_is_sta),
    .io_rawuop_ctrl_is_std(SubDecodeUnit_io_rawuop_ctrl_is_std),
    .io_rawuop_ctrl_op3_sel(SubDecodeUnit_io_rawuop_ctrl_op3_sel),
    .io_rawuop_iw_state(SubDecodeUnit_io_rawuop_iw_state),
    .io_rawuop_iw_p1_poisoned(SubDecodeUnit_io_rawuop_iw_p1_poisoned),
    .io_rawuop_iw_p2_poisoned(SubDecodeUnit_io_rawuop_iw_p2_poisoned),
    .io_rawuop_is_br(SubDecodeUnit_io_rawuop_is_br),
    .io_rawuop_is_jalr(SubDecodeUnit_io_rawuop_is_jalr),
    .io_rawuop_is_jal(SubDecodeUnit_io_rawuop_is_jal),
    .io_rawuop_is_sfb(SubDecodeUnit_io_rawuop_is_sfb),
    .io_rawuop_br_mask(SubDecodeUnit_io_rawuop_br_mask),
    .io_rawuop_br_tag(SubDecodeUnit_io_rawuop_br_tag),
    .io_rawuop_ftq_idx(SubDecodeUnit_io_rawuop_ftq_idx),
    .io_rawuop_edge_inst(SubDecodeUnit_io_rawuop_edge_inst),
    .io_rawuop_pc_lob(SubDecodeUnit_io_rawuop_pc_lob),
    .io_rawuop_taken(SubDecodeUnit_io_rawuop_taken),
    .io_rawuop_imm_packed(SubDecodeUnit_io_rawuop_imm_packed),
    .io_rawuop_csr_addr(SubDecodeUnit_io_rawuop_csr_addr),
    .io_rawuop_rob_idx(SubDecodeUnit_io_rawuop_rob_idx),
    .io_rawuop_ldq_idx(SubDecodeUnit_io_rawuop_ldq_idx),
    .io_rawuop_stq_idx(SubDecodeUnit_io_rawuop_stq_idx),
    .io_rawuop_rxq_idx(SubDecodeUnit_io_rawuop_rxq_idx),
    .io_rawuop_pdst(SubDecodeUnit_io_rawuop_pdst),
    .io_rawuop_prs1(SubDecodeUnit_io_rawuop_prs1),
    .io_rawuop_prs2(SubDecodeUnit_io_rawuop_prs2),
    .io_rawuop_prs3(SubDecodeUnit_io_rawuop_prs3),
    .io_rawuop_ppred(SubDecodeUnit_io_rawuop_ppred),
    .io_rawuop_prs1_busy(SubDecodeUnit_io_rawuop_prs1_busy),
    .io_rawuop_prs2_busy(SubDecodeUnit_io_rawuop_prs2_busy),
    .io_rawuop_prs3_busy(SubDecodeUnit_io_rawuop_prs3_busy),
    .io_rawuop_ppred_busy(SubDecodeUnit_io_rawuop_ppred_busy),
    .io_rawuop_stale_pdst(SubDecodeUnit_io_rawuop_stale_pdst),
    .io_rawuop_exception(SubDecodeUnit_io_rawuop_exception),
    .io_rawuop_exc_cause(SubDecodeUnit_io_rawuop_exc_cause),
    .io_rawuop_bypassable(SubDecodeUnit_io_rawuop_bypassable),
    .io_rawuop_mem_cmd(SubDecodeUnit_io_rawuop_mem_cmd),
    .io_rawuop_mem_size(SubDecodeUnit_io_rawuop_mem_size),
    .io_rawuop_mem_signed(SubDecodeUnit_io_rawuop_mem_signed),
    .io_rawuop_is_fence(SubDecodeUnit_io_rawuop_is_fence),
    .io_rawuop_is_fencei(SubDecodeUnit_io_rawuop_is_fencei),
    .io_rawuop_is_amo(SubDecodeUnit_io_rawuop_is_amo),
    .io_rawuop_uses_ldq(SubDecodeUnit_io_rawuop_uses_ldq),
    .io_rawuop_uses_stq(SubDecodeUnit_io_rawuop_uses_stq),
    .io_rawuop_is_sys_pc2epc(SubDecodeUnit_io_rawuop_is_sys_pc2epc),
    .io_rawuop_is_unique(SubDecodeUnit_io_rawuop_is_unique),
    .io_rawuop_flush_on_commit(SubDecodeUnit_io_rawuop_flush_on_commit),
    .io_rawuop_ldst_is_rs1(SubDecodeUnit_io_rawuop_ldst_is_rs1),
    .io_rawuop_ldst(SubDecodeUnit_io_rawuop_ldst),
    .io_rawuop_lrs1(SubDecodeUnit_io_rawuop_lrs1),
    .io_rawuop_lrs2(SubDecodeUnit_io_rawuop_lrs2),
    .io_rawuop_lrs3(SubDecodeUnit_io_rawuop_lrs3),
    .io_rawuop_ldst_val(SubDecodeUnit_io_rawuop_ldst_val),
    .io_rawuop_dst_rtype(SubDecodeUnit_io_rawuop_dst_rtype),
    .io_rawuop_lrs1_rtype(SubDecodeUnit_io_rawuop_lrs1_rtype),
    .io_rawuop_lrs2_rtype(SubDecodeUnit_io_rawuop_lrs2_rtype),
    .io_rawuop_frs3_en(SubDecodeUnit_io_rawuop_frs3_en),
    .io_rawuop_fp_val(SubDecodeUnit_io_rawuop_fp_val),
    .io_rawuop_fp_single(SubDecodeUnit_io_rawuop_fp_single),
    .io_rawuop_xcpt_pf_if(SubDecodeUnit_io_rawuop_xcpt_pf_if),
    .io_rawuop_xcpt_ae_if(SubDecodeUnit_io_rawuop_xcpt_ae_if),
    .io_rawuop_xcpt_ma_if(SubDecodeUnit_io_rawuop_xcpt_ma_if),
    .io_rawuop_bp_debug_if(SubDecodeUnit_io_rawuop_bp_debug_if),
    .io_rawuop_bp_xcpt_if(SubDecodeUnit_io_rawuop_bp_xcpt_if),
    .io_rawuop_debug_fsrc(SubDecodeUnit_io_rawuop_debug_fsrc),
    .io_rawuop_debug_tsrc(SubDecodeUnit_io_rawuop_debug_tsrc),
    .io_cs_sub_valid(SubDecodeUnit_io_cs_sub_valid),
    .io_cs_sub_fp_val(SubDecodeUnit_io_cs_sub_fp_val),
    .io_cs_sub_fp_single(SubDecodeUnit_io_cs_sub_fp_single),
    .io_cs_sub_uopc(SubDecodeUnit_io_cs_sub_uopc),
    .io_cs_sub_iq_type(SubDecodeUnit_io_cs_sub_iq_type),
    .io_cs_sub_fu_code(SubDecodeUnit_io_cs_sub_fu_code),
    .io_cs_sub_uses_ldq(SubDecodeUnit_io_cs_sub_uses_ldq),
    .io_cs_sub_uses_stq(SubDecodeUnit_io_cs_sub_uses_stq),
    .io_cs_sub_is_br(SubDecodeUnit_io_cs_sub_is_br),
    .io_cs_sub_dst_type(SubDecodeUnit_io_cs_sub_dst_type),
    .io_cs_sub_rs1_type(SubDecodeUnit_io_cs_sub_rs1_type),
    .io_cs_sub_rs2_type(SubDecodeUnit_io_cs_sub_rs2_type),
    .io_cs_sub_rtemp1(SubDecodeUnit_io_cs_sub_rtemp1),
    .io_cs_sub_rtemp2(SubDecodeUnit_io_cs_sub_rtemp2),
    .io_cs_sub_wtemp(SubDecodeUnit_io_cs_sub_wtemp),
    .io_cs_sub_wflag(SubDecodeUnit_io_cs_sub_wflag),
    .io_cs_sub_rflag(SubDecodeUnit_io_cs_sub_rflag),
    .io_cs_sub_imm_sel(SubDecodeUnit_io_cs_sub_imm_sel),
    .io_cs_sub_wakeup_delay(SubDecodeUnit_io_cs_sub_wakeup_delay),
    .io_cs_sub_bypassable(SubDecodeUnit_io_cs_sub_bypassable),
    .io_cs_sub_mem_cmd(SubDecodeUnit_io_cs_sub_mem_cmd),
    .io_cs_sub_mem_size(SubDecodeUnit_io_cs_sub_mem_size),
    .io_cs_sub_shift(SubDecodeUnit_io_cs_sub_shift),
    .io_cs_sub_split_num(SubDecodeUnit_io_cs_sub_split_num),
    .io_cs_sub_op1_sel(SubDecodeUnit_io_cs_sub_op1_sel),
    .io_cs_sub_op2_sel(SubDecodeUnit_io_cs_sub_op2_sel),
    .io_subuop_switch(SubDecodeUnit_io_subuop_switch),
    .io_subuop_switch_off(SubDecodeUnit_io_subuop_switch_off),
    .io_subuop_is_unicore(SubDecodeUnit_io_subuop_is_unicore),
    .io_subuop_shift(SubDecodeUnit_io_subuop_shift),
    .io_subuop_lrs3_rtype(SubDecodeUnit_io_subuop_lrs3_rtype),
    .io_subuop_rflag(SubDecodeUnit_io_subuop_rflag),
    .io_subuop_wflag(SubDecodeUnit_io_subuop_wflag),
    .io_subuop_prflag(SubDecodeUnit_io_subuop_prflag),
    .io_subuop_pwflag(SubDecodeUnit_io_subuop_pwflag),
    .io_subuop_pflag_busy(SubDecodeUnit_io_subuop_pflag_busy),
    .io_subuop_stale_pflag(SubDecodeUnit_io_subuop_stale_pflag),
    .io_subuop_op1_sel(SubDecodeUnit_io_subuop_op1_sel),
    .io_subuop_op2_sel(SubDecodeUnit_io_subuop_op2_sel),
    .io_subuop_split_num(SubDecodeUnit_io_subuop_split_num),
    .io_subuop_self_index(SubDecodeUnit_io_subuop_self_index),
    .io_subuop_rob_inst_idx(SubDecodeUnit_io_subuop_rob_inst_idx),
    .io_subuop_address_num(SubDecodeUnit_io_subuop_address_num),
    .io_subuop_uopc(SubDecodeUnit_io_subuop_uopc),
    .io_subuop_inst(SubDecodeUnit_io_subuop_inst),
    .io_subuop_debug_inst(SubDecodeUnit_io_subuop_debug_inst),
    .io_subuop_is_rvc(SubDecodeUnit_io_subuop_is_rvc),
    .io_subuop_debug_pc(SubDecodeUnit_io_subuop_debug_pc),
    .io_subuop_iq_type(SubDecodeUnit_io_subuop_iq_type),
    .io_subuop_fu_code(SubDecodeUnit_io_subuop_fu_code),
    .io_subuop_ctrl_br_type(SubDecodeUnit_io_subuop_ctrl_br_type),
    .io_subuop_ctrl_op1_sel(SubDecodeUnit_io_subuop_ctrl_op1_sel),
    .io_subuop_ctrl_op2_sel(SubDecodeUnit_io_subuop_ctrl_op2_sel),
    .io_subuop_ctrl_imm_sel(SubDecodeUnit_io_subuop_ctrl_imm_sel),
    .io_subuop_ctrl_op_fcn(SubDecodeUnit_io_subuop_ctrl_op_fcn),
    .io_subuop_ctrl_fcn_dw(SubDecodeUnit_io_subuop_ctrl_fcn_dw),
    .io_subuop_ctrl_csr_cmd(SubDecodeUnit_io_subuop_ctrl_csr_cmd),
    .io_subuop_ctrl_is_load(SubDecodeUnit_io_subuop_ctrl_is_load),
    .io_subuop_ctrl_is_sta(SubDecodeUnit_io_subuop_ctrl_is_sta),
    .io_subuop_ctrl_is_std(SubDecodeUnit_io_subuop_ctrl_is_std),
    .io_subuop_ctrl_op3_sel(SubDecodeUnit_io_subuop_ctrl_op3_sel),
    .io_subuop_iw_state(SubDecodeUnit_io_subuop_iw_state),
    .io_subuop_iw_p1_poisoned(SubDecodeUnit_io_subuop_iw_p1_poisoned),
    .io_subuop_iw_p2_poisoned(SubDecodeUnit_io_subuop_iw_p2_poisoned),
    .io_subuop_is_br(SubDecodeUnit_io_subuop_is_br),
    .io_subuop_is_jalr(SubDecodeUnit_io_subuop_is_jalr),
    .io_subuop_is_jal(SubDecodeUnit_io_subuop_is_jal),
    .io_subuop_is_sfb(SubDecodeUnit_io_subuop_is_sfb),
    .io_subuop_br_mask(SubDecodeUnit_io_subuop_br_mask),
    .io_subuop_br_tag(SubDecodeUnit_io_subuop_br_tag),
    .io_subuop_ftq_idx(SubDecodeUnit_io_subuop_ftq_idx),
    .io_subuop_edge_inst(SubDecodeUnit_io_subuop_edge_inst),
    .io_subuop_pc_lob(SubDecodeUnit_io_subuop_pc_lob),
    .io_subuop_taken(SubDecodeUnit_io_subuop_taken),
    .io_subuop_imm_packed(SubDecodeUnit_io_subuop_imm_packed),
    .io_subuop_csr_addr(SubDecodeUnit_io_subuop_csr_addr),
    .io_subuop_rob_idx(SubDecodeUnit_io_subuop_rob_idx),
    .io_subuop_ldq_idx(SubDecodeUnit_io_subuop_ldq_idx),
    .io_subuop_stq_idx(SubDecodeUnit_io_subuop_stq_idx),
    .io_subuop_rxq_idx(SubDecodeUnit_io_subuop_rxq_idx),
    .io_subuop_pdst(SubDecodeUnit_io_subuop_pdst),
    .io_subuop_prs1(SubDecodeUnit_io_subuop_prs1),
    .io_subuop_prs2(SubDecodeUnit_io_subuop_prs2),
    .io_subuop_prs3(SubDecodeUnit_io_subuop_prs3),
    .io_subuop_ppred(SubDecodeUnit_io_subuop_ppred),
    .io_subuop_prs1_busy(SubDecodeUnit_io_subuop_prs1_busy),
    .io_subuop_prs2_busy(SubDecodeUnit_io_subuop_prs2_busy),
    .io_subuop_prs3_busy(SubDecodeUnit_io_subuop_prs3_busy),
    .io_subuop_ppred_busy(SubDecodeUnit_io_subuop_ppred_busy),
    .io_subuop_stale_pdst(SubDecodeUnit_io_subuop_stale_pdst),
    .io_subuop_exception(SubDecodeUnit_io_subuop_exception),
    .io_subuop_exc_cause(SubDecodeUnit_io_subuop_exc_cause),
    .io_subuop_bypassable(SubDecodeUnit_io_subuop_bypassable),
    .io_subuop_mem_cmd(SubDecodeUnit_io_subuop_mem_cmd),
    .io_subuop_mem_size(SubDecodeUnit_io_subuop_mem_size),
    .io_subuop_mem_signed(SubDecodeUnit_io_subuop_mem_signed),
    .io_subuop_is_fence(SubDecodeUnit_io_subuop_is_fence),
    .io_subuop_is_fencei(SubDecodeUnit_io_subuop_is_fencei),
    .io_subuop_is_amo(SubDecodeUnit_io_subuop_is_amo),
    .io_subuop_uses_ldq(SubDecodeUnit_io_subuop_uses_ldq),
    .io_subuop_uses_stq(SubDecodeUnit_io_subuop_uses_stq),
    .io_subuop_is_sys_pc2epc(SubDecodeUnit_io_subuop_is_sys_pc2epc),
    .io_subuop_is_unique(SubDecodeUnit_io_subuop_is_unique),
    .io_subuop_flush_on_commit(SubDecodeUnit_io_subuop_flush_on_commit),
    .io_subuop_ldst_is_rs1(SubDecodeUnit_io_subuop_ldst_is_rs1),
    .io_subuop_ldst(SubDecodeUnit_io_subuop_ldst),
    .io_subuop_lrs1(SubDecodeUnit_io_subuop_lrs1),
    .io_subuop_lrs2(SubDecodeUnit_io_subuop_lrs2),
    .io_subuop_lrs3(SubDecodeUnit_io_subuop_lrs3),
    .io_subuop_ldst_val(SubDecodeUnit_io_subuop_ldst_val),
    .io_subuop_dst_rtype(SubDecodeUnit_io_subuop_dst_rtype),
    .io_subuop_lrs1_rtype(SubDecodeUnit_io_subuop_lrs1_rtype),
    .io_subuop_lrs2_rtype(SubDecodeUnit_io_subuop_lrs2_rtype),
    .io_subuop_frs3_en(SubDecodeUnit_io_subuop_frs3_en),
    .io_subuop_fp_val(SubDecodeUnit_io_subuop_fp_val),
    .io_subuop_fp_single(SubDecodeUnit_io_subuop_fp_single),
    .io_subuop_xcpt_pf_if(SubDecodeUnit_io_subuop_xcpt_pf_if),
    .io_subuop_xcpt_ae_if(SubDecodeUnit_io_subuop_xcpt_ae_if),
    .io_subuop_xcpt_ma_if(SubDecodeUnit_io_subuop_xcpt_ma_if),
    .io_subuop_bp_debug_if(SubDecodeUnit_io_subuop_bp_debug_if),
    .io_subuop_bp_xcpt_if(SubDecodeUnit_io_subuop_bp_xcpt_if),
    .io_subuop_debug_fsrc(SubDecodeUnit_io_subuop_debug_fsrc),
    .io_subuop_debug_tsrc(SubDecodeUnit_io_subuop_debug_tsrc)
  );
  assign io_deq_uops_0_switch = unicoreMode ? appended_subuops_0_switch : uop_switch; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_switch_off = unicoreMode ? appended_subuops_0_switch_off : uop_switch_off; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_is_unicore = unicoreMode ? appended_subuops_0_is_unicore : uop_is_unicore; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_shift = unicoreMode ? appended_subuops_0_shift : 3'h0; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_lrs3_rtype = unicoreMode ? appended_subuops_0_lrs3_rtype : 2'h2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_rflag = unicoreMode & appended_subuops_0_rflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_wflag = unicoreMode & appended_subuops_0_wflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_prflag = unicoreMode ? appended_subuops_0_prflag : io_enq_uop_prflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_pwflag = unicoreMode ? appended_subuops_0_pwflag : io_enq_uop_pwflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_pflag_busy = unicoreMode ? appended_subuops_0_pflag_busy : io_enq_uop_pflag_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_stale_pflag = unicoreMode ? appended_subuops_0_stale_pflag : io_enq_uop_stale_pflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_op1_sel = unicoreMode ? appended_subuops_0_op1_sel : io_enq_uop_op1_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_op2_sel = unicoreMode ? appended_subuops_0_op2_sel : io_enq_uop_op2_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_split_num = unicoreMode ? appended_subuops_0_split_num : uop_split_num; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_self_index = unicoreMode ? appended_subuops_0_self_index : 6'h0; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_rob_inst_idx = unicoreMode ? appended_subuops_0_rob_inst_idx : io_enq_uop_rob_inst_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_address_num = unicoreMode ? appended_subuops_0_address_num : io_enq_uop_address_num; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_uopc = unicoreMode ? appended_subuops_0_uopc : cs__uopc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_inst = unicoreMode ? appended_subuops_0_inst : io_enq_uop_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_debug_inst = unicoreMode ? appended_subuops_0_debug_inst : io_enq_uop_debug_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_is_rvc = unicoreMode ? appended_subuops_0_is_rvc : uop_is_rvc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_debug_pc = unicoreMode ? appended_subuops_0_debug_pc : io_enq_uop_debug_pc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_iq_type = unicoreMode ? appended_subuops_0_iq_type : cs__iq_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_fu_code = unicoreMode ? appended_subuops_0_fu_code : cs__fu_code; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ctrl_br_type = unicoreMode ? appended_subuops_0_ctrl_br_type : io_enq_uop_ctrl_br_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ctrl_op1_sel = unicoreMode ? appended_subuops_0_ctrl_op1_sel : io_enq_uop_ctrl_op1_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ctrl_op2_sel = unicoreMode ? appended_subuops_0_ctrl_op2_sel : io_enq_uop_ctrl_op2_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ctrl_imm_sel = unicoreMode ? appended_subuops_0_ctrl_imm_sel : io_enq_uop_ctrl_imm_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ctrl_op_fcn = unicoreMode ? appended_subuops_0_ctrl_op_fcn : io_enq_uop_ctrl_op_fcn; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ctrl_fcn_dw = unicoreMode ? appended_subuops_0_ctrl_fcn_dw : io_enq_uop_ctrl_fcn_dw; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ctrl_csr_cmd = unicoreMode ? appended_subuops_0_ctrl_csr_cmd : io_enq_uop_ctrl_csr_cmd; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ctrl_is_load = unicoreMode ? appended_subuops_0_ctrl_is_load : io_enq_uop_ctrl_is_load; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ctrl_is_sta = unicoreMode ? appended_subuops_0_ctrl_is_sta : io_enq_uop_ctrl_is_sta; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ctrl_is_std = unicoreMode ? appended_subuops_0_ctrl_is_std : io_enq_uop_ctrl_is_std; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ctrl_op3_sel = unicoreMode ? appended_subuops_0_ctrl_op3_sel : io_enq_uop_ctrl_op3_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_iw_state = unicoreMode ? appended_subuops_0_iw_state : io_enq_uop_iw_state; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_iw_p1_poisoned = unicoreMode ? appended_subuops_0_iw_p1_poisoned : io_enq_uop_iw_p1_poisoned; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_iw_p2_poisoned = unicoreMode ? appended_subuops_0_iw_p2_poisoned : io_enq_uop_iw_p2_poisoned; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_is_br = unicoreMode ? appended_subuops_0_is_br : cs__is_br; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_is_jalr = unicoreMode ? appended_subuops_0_is_jalr : uop_is_jalr; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_is_jal = unicoreMode ? appended_subuops_0_is_jal : uop_is_jal; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_is_sfb = unicoreMode ? appended_subuops_0_is_sfb : io_enq_uop_is_sfb; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_br_mask = unicoreMode ? appended_subuops_0_br_mask : io_enq_uop_br_mask; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_br_tag = unicoreMode ? appended_subuops_0_br_tag : io_enq_uop_br_tag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ftq_idx = unicoreMode ? appended_subuops_0_ftq_idx : io_enq_uop_ftq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_edge_inst = unicoreMode ? appended_subuops_0_edge_inst : io_enq_uop_edge_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_pc_lob = unicoreMode ? appended_subuops_0_pc_lob : io_enq_uop_pc_lob; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_taken = unicoreMode ? appended_subuops_0_taken : io_enq_uop_taken; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_imm_packed = unicoreMode ? appended_subuops_0_imm_packed : uop_imm_packed; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_csr_addr = unicoreMode ? appended_subuops_0_csr_addr : io_enq_uop_csr_addr; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_rob_idx = unicoreMode ? appended_subuops_0_rob_idx : io_enq_uop_rob_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ldq_idx = unicoreMode ? appended_subuops_0_ldq_idx : io_enq_uop_ldq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_stq_idx = unicoreMode ? appended_subuops_0_stq_idx : io_enq_uop_stq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_rxq_idx = unicoreMode ? appended_subuops_0_rxq_idx : io_enq_uop_rxq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_pdst = unicoreMode ? appended_subuops_0_pdst : io_enq_uop_pdst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_prs1 = unicoreMode ? appended_subuops_0_prs1 : io_enq_uop_prs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_prs2 = unicoreMode ? appended_subuops_0_prs2 : io_enq_uop_prs2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_prs3 = unicoreMode ? appended_subuops_0_prs3 : io_enq_uop_prs3; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ppred = unicoreMode ? appended_subuops_0_ppred : io_enq_uop_ppred; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_prs1_busy = unicoreMode ? appended_subuops_0_prs1_busy : io_enq_uop_prs1_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_prs2_busy = unicoreMode ? appended_subuops_0_prs2_busy : io_enq_uop_prs2_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_prs3_busy = unicoreMode ? appended_subuops_0_prs3_busy : io_enq_uop_prs3_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ppred_busy = unicoreMode ? appended_subuops_0_ppred_busy : io_enq_uop_ppred_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_stale_pdst = unicoreMode ? appended_subuops_0_stale_pdst : io_enq_uop_stale_pdst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_exception = unicoreMode ? appended_subuops_0_exception : xcpt_valid; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_exc_cause = unicoreMode ? appended_subuops_0_exc_cause : xcpt_cause; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_bypassable = unicoreMode ? appended_subuops_0_bypassable : _T_399; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_mem_cmd = unicoreMode ? appended_subuops_0_mem_cmd : cs__mem_cmd; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_mem_size = unicoreMode ? appended_subuops_0_mem_size : uop_mem_size; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_mem_signed = unicoreMode ? appended_subuops_0_mem_signed : uop_mem_signed; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_is_fence = unicoreMode ? appended_subuops_0_is_fence : uop_is_fence; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_is_fencei = unicoreMode ? appended_subuops_0_is_fencei : uop_is_fencei; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_is_amo = unicoreMode ? appended_subuops_0_is_amo : uop_is_amo; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_uses_ldq = unicoreMode ? appended_subuops_0_uses_ldq : cs__uses_ldq; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_uses_stq = unicoreMode ? appended_subuops_0_uses_stq : cs__uses_stq; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_is_sys_pc2epc = unicoreMode ? appended_subuops_0_is_sys_pc2epc : uop_is_sys_pc2epc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_is_unique = unicoreMode ? appended_subuops_0_is_unique : uop_is_unique; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_flush_on_commit = unicoreMode ? appended_subuops_0_flush_on_commit : uop_flush_on_commit; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ldst_is_rs1 = unicoreMode & appended_subuops_0_ldst_is_rs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ldst = unicoreMode ? appended_subuops_0_ldst : uop_ldst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_lrs1 = unicoreMode ? appended_subuops_0_lrs1 : uop_lrs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_lrs2 = unicoreMode ? appended_subuops_0_lrs2 : uop_lrs2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_lrs3 = unicoreMode ? appended_subuops_0_lrs3 : uop_lrs3; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_ldst_val = unicoreMode ? appended_subuops_0_ldst_val : uop_ldst_val; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_dst_rtype = unicoreMode ? appended_subuops_0_dst_rtype : cs__dst_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_lrs1_rtype = unicoreMode ? appended_subuops_0_lrs1_rtype : cs__rs1_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_lrs2_rtype = unicoreMode ? appended_subuops_0_lrs2_rtype : cs__rs2_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_frs3_en = unicoreMode ? appended_subuops_0_frs3_en : uop_frs3_en; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_fp_val = unicoreMode ? appended_subuops_0_fp_val : bit_1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_fp_single = unicoreMode ? appended_subuops_0_fp_single : cs__fp_single; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_xcpt_pf_if = unicoreMode ? appended_subuops_0_xcpt_pf_if : io_enq_uop_xcpt_pf_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_xcpt_ae_if = unicoreMode ? appended_subuops_0_xcpt_ae_if : io_enq_uop_xcpt_ae_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_xcpt_ma_if = unicoreMode ? appended_subuops_0_xcpt_ma_if : io_enq_uop_xcpt_ma_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_bp_debug_if = unicoreMode ? appended_subuops_0_bp_debug_if : io_enq_uop_bp_debug_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_bp_xcpt_if = unicoreMode ? appended_subuops_0_bp_xcpt_if : io_enq_uop_bp_xcpt_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_debug_fsrc = unicoreMode ? appended_subuops_0_debug_fsrc : io_enq_uop_debug_fsrc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_0_debug_tsrc = unicoreMode ? appended_subuops_0_debug_tsrc : io_enq_uop_debug_tsrc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 835:20]
  assign io_deq_uops_1_switch = unicoreMode ? appended_subuops_1_switch : uop_switch; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_switch_off = unicoreMode ? appended_subuops_1_switch_off : uop_switch_off; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_is_unicore = unicoreMode ? appended_subuops_1_is_unicore : uop_is_unicore; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_shift = unicoreMode ? appended_subuops_1_shift : 3'h0; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_lrs3_rtype = unicoreMode ? appended_subuops_1_lrs3_rtype : 2'h2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_rflag = unicoreMode & appended_subuops_1_rflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_wflag = unicoreMode & appended_subuops_1_wflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_prflag = unicoreMode ? appended_subuops_1_prflag : io_enq_uop_prflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_pwflag = unicoreMode ? appended_subuops_1_pwflag : io_enq_uop_pwflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_pflag_busy = unicoreMode ? appended_subuops_1_pflag_busy : io_enq_uop_pflag_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_stale_pflag = unicoreMode ? appended_subuops_1_stale_pflag : io_enq_uop_stale_pflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_op1_sel = unicoreMode ? appended_subuops_1_op1_sel : io_enq_uop_op1_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_op2_sel = unicoreMode ? appended_subuops_1_op2_sel : io_enq_uop_op2_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_split_num = unicoreMode ? appended_subuops_1_split_num : uop_split_num; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_self_index = unicoreMode ? appended_subuops_1_self_index : 6'h0; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_rob_inst_idx = unicoreMode ? appended_subuops_1_rob_inst_idx : io_enq_uop_rob_inst_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_address_num = unicoreMode ? appended_subuops_1_address_num : io_enq_uop_address_num; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_uopc = unicoreMode ? appended_subuops_1_uopc : cs__uopc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_inst = unicoreMode ? appended_subuops_1_inst : io_enq_uop_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_debug_inst = unicoreMode ? appended_subuops_1_debug_inst : io_enq_uop_debug_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_is_rvc = unicoreMode ? appended_subuops_1_is_rvc : uop_is_rvc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_debug_pc = unicoreMode ? appended_subuops_1_debug_pc : io_enq_uop_debug_pc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_iq_type = unicoreMode ? appended_subuops_1_iq_type : cs__iq_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_fu_code = unicoreMode ? appended_subuops_1_fu_code : cs__fu_code; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ctrl_br_type = unicoreMode ? appended_subuops_1_ctrl_br_type : io_enq_uop_ctrl_br_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ctrl_op1_sel = unicoreMode ? appended_subuops_1_ctrl_op1_sel : io_enq_uop_ctrl_op1_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ctrl_op2_sel = unicoreMode ? appended_subuops_1_ctrl_op2_sel : io_enq_uop_ctrl_op2_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ctrl_imm_sel = unicoreMode ? appended_subuops_1_ctrl_imm_sel : io_enq_uop_ctrl_imm_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ctrl_op_fcn = unicoreMode ? appended_subuops_1_ctrl_op_fcn : io_enq_uop_ctrl_op_fcn; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ctrl_fcn_dw = unicoreMode ? appended_subuops_1_ctrl_fcn_dw : io_enq_uop_ctrl_fcn_dw; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ctrl_csr_cmd = unicoreMode ? appended_subuops_1_ctrl_csr_cmd : io_enq_uop_ctrl_csr_cmd; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ctrl_is_load = unicoreMode ? appended_subuops_1_ctrl_is_load : io_enq_uop_ctrl_is_load; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ctrl_is_sta = unicoreMode ? appended_subuops_1_ctrl_is_sta : io_enq_uop_ctrl_is_sta; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ctrl_is_std = unicoreMode ? appended_subuops_1_ctrl_is_std : io_enq_uop_ctrl_is_std; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ctrl_op3_sel = unicoreMode ? appended_subuops_1_ctrl_op3_sel : io_enq_uop_ctrl_op3_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_iw_state = unicoreMode ? appended_subuops_1_iw_state : io_enq_uop_iw_state; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_iw_p1_poisoned = unicoreMode ? appended_subuops_1_iw_p1_poisoned : io_enq_uop_iw_p1_poisoned; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_iw_p2_poisoned = unicoreMode ? appended_subuops_1_iw_p2_poisoned : io_enq_uop_iw_p2_poisoned; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_is_br = unicoreMode ? appended_subuops_1_is_br : cs__is_br; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_is_jalr = unicoreMode ? appended_subuops_1_is_jalr : uop_is_jalr; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_is_jal = unicoreMode ? appended_subuops_1_is_jal : uop_is_jal; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_is_sfb = unicoreMode ? appended_subuops_1_is_sfb : io_enq_uop_is_sfb; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_br_mask = unicoreMode ? appended_subuops_1_br_mask : io_enq_uop_br_mask; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_br_tag = unicoreMode ? appended_subuops_1_br_tag : io_enq_uop_br_tag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ftq_idx = unicoreMode ? appended_subuops_1_ftq_idx : io_enq_uop_ftq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_edge_inst = unicoreMode ? appended_subuops_1_edge_inst : io_enq_uop_edge_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_pc_lob = unicoreMode ? appended_subuops_1_pc_lob : io_enq_uop_pc_lob; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_taken = unicoreMode ? appended_subuops_1_taken : io_enq_uop_taken; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_imm_packed = unicoreMode ? appended_subuops_1_imm_packed : uop_imm_packed; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_csr_addr = unicoreMode ? appended_subuops_1_csr_addr : io_enq_uop_csr_addr; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_rob_idx = unicoreMode ? appended_subuops_1_rob_idx : io_enq_uop_rob_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ldq_idx = unicoreMode ? appended_subuops_1_ldq_idx : io_enq_uop_ldq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_stq_idx = unicoreMode ? appended_subuops_1_stq_idx : io_enq_uop_stq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_rxq_idx = unicoreMode ? appended_subuops_1_rxq_idx : io_enq_uop_rxq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_pdst = unicoreMode ? appended_subuops_1_pdst : io_enq_uop_pdst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_prs1 = unicoreMode ? appended_subuops_1_prs1 : io_enq_uop_prs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_prs2 = unicoreMode ? appended_subuops_1_prs2 : io_enq_uop_prs2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_prs3 = unicoreMode ? appended_subuops_1_prs3 : io_enq_uop_prs3; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ppred = unicoreMode ? appended_subuops_1_ppred : io_enq_uop_ppred; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_prs1_busy = unicoreMode ? appended_subuops_1_prs1_busy : io_enq_uop_prs1_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_prs2_busy = unicoreMode ? appended_subuops_1_prs2_busy : io_enq_uop_prs2_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_prs3_busy = unicoreMode ? appended_subuops_1_prs3_busy : io_enq_uop_prs3_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ppred_busy = unicoreMode ? appended_subuops_1_ppred_busy : io_enq_uop_ppred_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_stale_pdst = unicoreMode ? appended_subuops_1_stale_pdst : io_enq_uop_stale_pdst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_exception = unicoreMode ? appended_subuops_1_exception : xcpt_valid; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_exc_cause = unicoreMode ? appended_subuops_1_exc_cause : xcpt_cause; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_bypassable = unicoreMode ? appended_subuops_1_bypassable : _T_399; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_mem_cmd = unicoreMode ? appended_subuops_1_mem_cmd : cs__mem_cmd; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_mem_size = unicoreMode ? appended_subuops_1_mem_size : uop_mem_size; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_mem_signed = unicoreMode ? appended_subuops_1_mem_signed : uop_mem_signed; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_is_fence = unicoreMode ? appended_subuops_1_is_fence : uop_is_fence; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_is_fencei = unicoreMode ? appended_subuops_1_is_fencei : uop_is_fencei; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_is_amo = unicoreMode ? appended_subuops_1_is_amo : uop_is_amo; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_uses_ldq = unicoreMode ? appended_subuops_1_uses_ldq : cs__uses_ldq; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_uses_stq = unicoreMode ? appended_subuops_1_uses_stq : cs__uses_stq; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_is_sys_pc2epc = unicoreMode ? appended_subuops_1_is_sys_pc2epc : uop_is_sys_pc2epc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_is_unique = unicoreMode ? appended_subuops_1_is_unique : uop_is_unique; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_flush_on_commit = unicoreMode ? appended_subuops_1_flush_on_commit : uop_flush_on_commit; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ldst_is_rs1 = unicoreMode & appended_subuops_1_ldst_is_rs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ldst = unicoreMode ? appended_subuops_1_ldst : uop_ldst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_lrs1 = unicoreMode ? appended_subuops_1_lrs1 : uop_lrs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_lrs2 = unicoreMode ? appended_subuops_1_lrs2 : uop_lrs2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_lrs3 = unicoreMode ? appended_subuops_1_lrs3 : uop_lrs3; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_ldst_val = unicoreMode ? appended_subuops_1_ldst_val : uop_ldst_val; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_dst_rtype = unicoreMode ? appended_subuops_1_dst_rtype : cs__dst_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_lrs1_rtype = unicoreMode ? appended_subuops_1_lrs1_rtype : cs__rs1_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_lrs2_rtype = unicoreMode ? appended_subuops_1_lrs2_rtype : cs__rs2_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_frs3_en = unicoreMode ? appended_subuops_1_frs3_en : uop_frs3_en; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_fp_val = unicoreMode ? appended_subuops_1_fp_val : bit_1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_fp_single = unicoreMode ? appended_subuops_1_fp_single : cs__fp_single; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_xcpt_pf_if = unicoreMode ? appended_subuops_1_xcpt_pf_if : io_enq_uop_xcpt_pf_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_xcpt_ae_if = unicoreMode ? appended_subuops_1_xcpt_ae_if : io_enq_uop_xcpt_ae_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_xcpt_ma_if = unicoreMode ? appended_subuops_1_xcpt_ma_if : io_enq_uop_xcpt_ma_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_bp_debug_if = unicoreMode ? appended_subuops_1_bp_debug_if : io_enq_uop_bp_debug_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_bp_xcpt_if = unicoreMode ? appended_subuops_1_bp_xcpt_if : io_enq_uop_bp_xcpt_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_debug_fsrc = unicoreMode ? appended_subuops_1_debug_fsrc : io_enq_uop_debug_fsrc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_1_debug_tsrc = unicoreMode ? appended_subuops_1_debug_tsrc : io_enq_uop_debug_tsrc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 836:20]
  assign io_deq_uops_2_switch = unicoreMode ? appended_subuops_2_switch : uop_switch; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_switch_off = unicoreMode ? appended_subuops_2_switch_off : uop_switch_off; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_is_unicore = unicoreMode ? appended_subuops_2_is_unicore : uop_is_unicore; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_shift = unicoreMode ? appended_subuops_2_shift : 3'h0; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_lrs3_rtype = unicoreMode ? appended_subuops_2_lrs3_rtype : 2'h2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_rflag = unicoreMode & appended_subuops_2_rflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_wflag = unicoreMode & appended_subuops_2_wflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_prflag = unicoreMode ? appended_subuops_2_prflag : io_enq_uop_prflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_pwflag = unicoreMode ? appended_subuops_2_pwflag : io_enq_uop_pwflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_pflag_busy = unicoreMode ? appended_subuops_2_pflag_busy : io_enq_uop_pflag_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_stale_pflag = unicoreMode ? appended_subuops_2_stale_pflag : io_enq_uop_stale_pflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_op1_sel = unicoreMode ? appended_subuops_2_op1_sel : io_enq_uop_op1_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_op2_sel = unicoreMode ? appended_subuops_2_op2_sel : io_enq_uop_op2_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_split_num = unicoreMode ? appended_subuops_2_split_num : uop_split_num; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_self_index = unicoreMode ? appended_subuops_2_self_index : 6'h0; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_rob_inst_idx = unicoreMode ? appended_subuops_2_rob_inst_idx : io_enq_uop_rob_inst_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_address_num = unicoreMode ? appended_subuops_2_address_num : io_enq_uop_address_num; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_uopc = unicoreMode ? appended_subuops_2_uopc : cs__uopc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_inst = unicoreMode ? appended_subuops_2_inst : io_enq_uop_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_debug_inst = unicoreMode ? appended_subuops_2_debug_inst : io_enq_uop_debug_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_is_rvc = unicoreMode ? appended_subuops_2_is_rvc : uop_is_rvc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_debug_pc = unicoreMode ? appended_subuops_2_debug_pc : io_enq_uop_debug_pc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_iq_type = unicoreMode ? appended_subuops_2_iq_type : cs__iq_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_fu_code = unicoreMode ? appended_subuops_2_fu_code : cs__fu_code; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ctrl_br_type = unicoreMode ? appended_subuops_2_ctrl_br_type : io_enq_uop_ctrl_br_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ctrl_op1_sel = unicoreMode ? appended_subuops_2_ctrl_op1_sel : io_enq_uop_ctrl_op1_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ctrl_op2_sel = unicoreMode ? appended_subuops_2_ctrl_op2_sel : io_enq_uop_ctrl_op2_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ctrl_imm_sel = unicoreMode ? appended_subuops_2_ctrl_imm_sel : io_enq_uop_ctrl_imm_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ctrl_op_fcn = unicoreMode ? appended_subuops_2_ctrl_op_fcn : io_enq_uop_ctrl_op_fcn; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ctrl_fcn_dw = unicoreMode ? appended_subuops_2_ctrl_fcn_dw : io_enq_uop_ctrl_fcn_dw; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ctrl_csr_cmd = unicoreMode ? appended_subuops_2_ctrl_csr_cmd : io_enq_uop_ctrl_csr_cmd; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ctrl_is_load = unicoreMode ? appended_subuops_2_ctrl_is_load : io_enq_uop_ctrl_is_load; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ctrl_is_sta = unicoreMode ? appended_subuops_2_ctrl_is_sta : io_enq_uop_ctrl_is_sta; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ctrl_is_std = unicoreMode ? appended_subuops_2_ctrl_is_std : io_enq_uop_ctrl_is_std; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ctrl_op3_sel = unicoreMode ? appended_subuops_2_ctrl_op3_sel : io_enq_uop_ctrl_op3_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_iw_state = unicoreMode ? appended_subuops_2_iw_state : io_enq_uop_iw_state; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_iw_p1_poisoned = unicoreMode ? appended_subuops_2_iw_p1_poisoned : io_enq_uop_iw_p1_poisoned; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_iw_p2_poisoned = unicoreMode ? appended_subuops_2_iw_p2_poisoned : io_enq_uop_iw_p2_poisoned; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_is_br = unicoreMode ? appended_subuops_2_is_br : cs__is_br; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_is_jalr = unicoreMode ? appended_subuops_2_is_jalr : uop_is_jalr; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_is_jal = unicoreMode ? appended_subuops_2_is_jal : uop_is_jal; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_is_sfb = unicoreMode ? appended_subuops_2_is_sfb : io_enq_uop_is_sfb; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_br_mask = unicoreMode ? appended_subuops_2_br_mask : io_enq_uop_br_mask; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_br_tag = unicoreMode ? appended_subuops_2_br_tag : io_enq_uop_br_tag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ftq_idx = unicoreMode ? appended_subuops_2_ftq_idx : io_enq_uop_ftq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_edge_inst = unicoreMode ? appended_subuops_2_edge_inst : io_enq_uop_edge_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_pc_lob = unicoreMode ? appended_subuops_2_pc_lob : io_enq_uop_pc_lob; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_taken = unicoreMode ? appended_subuops_2_taken : io_enq_uop_taken; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_imm_packed = unicoreMode ? appended_subuops_2_imm_packed : uop_imm_packed; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_csr_addr = unicoreMode ? appended_subuops_2_csr_addr : io_enq_uop_csr_addr; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_rob_idx = unicoreMode ? appended_subuops_2_rob_idx : io_enq_uop_rob_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ldq_idx = unicoreMode ? appended_subuops_2_ldq_idx : io_enq_uop_ldq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_stq_idx = unicoreMode ? appended_subuops_2_stq_idx : io_enq_uop_stq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_rxq_idx = unicoreMode ? appended_subuops_2_rxq_idx : io_enq_uop_rxq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_pdst = unicoreMode ? appended_subuops_2_pdst : io_enq_uop_pdst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_prs1 = unicoreMode ? appended_subuops_2_prs1 : io_enq_uop_prs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_prs2 = unicoreMode ? appended_subuops_2_prs2 : io_enq_uop_prs2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_prs3 = unicoreMode ? appended_subuops_2_prs3 : io_enq_uop_prs3; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ppred = unicoreMode ? appended_subuops_2_ppred : io_enq_uop_ppred; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_prs1_busy = unicoreMode ? appended_subuops_2_prs1_busy : io_enq_uop_prs1_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_prs2_busy = unicoreMode ? appended_subuops_2_prs2_busy : io_enq_uop_prs2_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_prs3_busy = unicoreMode ? appended_subuops_2_prs3_busy : io_enq_uop_prs3_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ppred_busy = unicoreMode ? appended_subuops_2_ppred_busy : io_enq_uop_ppred_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_stale_pdst = unicoreMode ? appended_subuops_2_stale_pdst : io_enq_uop_stale_pdst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_exception = unicoreMode ? appended_subuops_2_exception : xcpt_valid; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_exc_cause = unicoreMode ? appended_subuops_2_exc_cause : xcpt_cause; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_bypassable = unicoreMode ? appended_subuops_2_bypassable : _T_399; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_mem_cmd = unicoreMode ? appended_subuops_2_mem_cmd : cs__mem_cmd; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_mem_size = unicoreMode ? appended_subuops_2_mem_size : uop_mem_size; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_mem_signed = unicoreMode ? appended_subuops_2_mem_signed : uop_mem_signed; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_is_fence = unicoreMode ? appended_subuops_2_is_fence : uop_is_fence; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_is_fencei = unicoreMode ? appended_subuops_2_is_fencei : uop_is_fencei; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_is_amo = unicoreMode ? appended_subuops_2_is_amo : uop_is_amo; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_uses_ldq = unicoreMode ? appended_subuops_2_uses_ldq : cs__uses_ldq; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_uses_stq = unicoreMode ? appended_subuops_2_uses_stq : cs__uses_stq; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_is_sys_pc2epc = unicoreMode ? appended_subuops_2_is_sys_pc2epc : uop_is_sys_pc2epc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_is_unique = unicoreMode ? appended_subuops_2_is_unique : uop_is_unique; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_flush_on_commit = unicoreMode ? appended_subuops_2_flush_on_commit : uop_flush_on_commit; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ldst_is_rs1 = unicoreMode & appended_subuops_2_ldst_is_rs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ldst = unicoreMode ? appended_subuops_2_ldst : uop_ldst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_lrs1 = unicoreMode ? appended_subuops_2_lrs1 : uop_lrs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_lrs2 = unicoreMode ? appended_subuops_2_lrs2 : uop_lrs2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_lrs3 = unicoreMode ? appended_subuops_2_lrs3 : uop_lrs3; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_ldst_val = unicoreMode ? appended_subuops_2_ldst_val : uop_ldst_val; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_dst_rtype = unicoreMode ? appended_subuops_2_dst_rtype : cs__dst_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_lrs1_rtype = unicoreMode ? appended_subuops_2_lrs1_rtype : cs__rs1_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_lrs2_rtype = unicoreMode ? appended_subuops_2_lrs2_rtype : cs__rs2_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_frs3_en = unicoreMode ? appended_subuops_2_frs3_en : uop_frs3_en; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_fp_val = unicoreMode ? appended_subuops_2_fp_val : bit_1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_fp_single = unicoreMode ? appended_subuops_2_fp_single : cs__fp_single; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_xcpt_pf_if = unicoreMode ? appended_subuops_2_xcpt_pf_if : io_enq_uop_xcpt_pf_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_xcpt_ae_if = unicoreMode ? appended_subuops_2_xcpt_ae_if : io_enq_uop_xcpt_ae_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_xcpt_ma_if = unicoreMode ? appended_subuops_2_xcpt_ma_if : io_enq_uop_xcpt_ma_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_bp_debug_if = unicoreMode ? appended_subuops_2_bp_debug_if : io_enq_uop_bp_debug_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_bp_xcpt_if = unicoreMode ? appended_subuops_2_bp_xcpt_if : io_enq_uop_bp_xcpt_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_debug_fsrc = unicoreMode ? appended_subuops_2_debug_fsrc : io_enq_uop_debug_fsrc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_2_debug_tsrc = unicoreMode ? appended_subuops_2_debug_tsrc : io_enq_uop_debug_tsrc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 837:20]
  assign io_deq_uops_3_switch = unicoreMode ? appended_subuops_3_switch : uop_switch; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_switch_off = unicoreMode ? appended_subuops_3_switch_off : uop_switch_off; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_is_unicore = unicoreMode ? appended_subuops_3_is_unicore : uop_is_unicore; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_shift = unicoreMode ? appended_subuops_3_shift : 3'h0; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_lrs3_rtype = unicoreMode ? appended_subuops_3_lrs3_rtype : 2'h2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_rflag = unicoreMode & appended_subuops_3_rflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_wflag = unicoreMode & appended_subuops_3_wflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_prflag = unicoreMode ? appended_subuops_3_prflag : io_enq_uop_prflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_pwflag = unicoreMode ? appended_subuops_3_pwflag : io_enq_uop_pwflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_pflag_busy = unicoreMode ? appended_subuops_3_pflag_busy : io_enq_uop_pflag_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_stale_pflag = unicoreMode ? appended_subuops_3_stale_pflag : io_enq_uop_stale_pflag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_op1_sel = unicoreMode ? appended_subuops_3_op1_sel : io_enq_uop_op1_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_op2_sel = unicoreMode ? appended_subuops_3_op2_sel : io_enq_uop_op2_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_split_num = unicoreMode ? appended_subuops_3_split_num : uop_split_num; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_self_index = unicoreMode ? appended_subuops_3_self_index : 6'h0; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_rob_inst_idx = unicoreMode ? appended_subuops_3_rob_inst_idx : io_enq_uop_rob_inst_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_address_num = unicoreMode ? appended_subuops_3_address_num : io_enq_uop_address_num; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_uopc = unicoreMode ? appended_subuops_3_uopc : cs__uopc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_inst = unicoreMode ? appended_subuops_3_inst : io_enq_uop_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_debug_inst = unicoreMode ? appended_subuops_3_debug_inst : io_enq_uop_debug_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_is_rvc = unicoreMode ? appended_subuops_3_is_rvc : uop_is_rvc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_debug_pc = unicoreMode ? appended_subuops_3_debug_pc : io_enq_uop_debug_pc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_iq_type = unicoreMode ? appended_subuops_3_iq_type : cs__iq_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_fu_code = unicoreMode ? appended_subuops_3_fu_code : cs__fu_code; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ctrl_br_type = unicoreMode ? appended_subuops_3_ctrl_br_type : io_enq_uop_ctrl_br_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ctrl_op1_sel = unicoreMode ? appended_subuops_3_ctrl_op1_sel : io_enq_uop_ctrl_op1_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ctrl_op2_sel = unicoreMode ? appended_subuops_3_ctrl_op2_sel : io_enq_uop_ctrl_op2_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ctrl_imm_sel = unicoreMode ? appended_subuops_3_ctrl_imm_sel : io_enq_uop_ctrl_imm_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ctrl_op_fcn = unicoreMode ? appended_subuops_3_ctrl_op_fcn : io_enq_uop_ctrl_op_fcn; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ctrl_fcn_dw = unicoreMode ? appended_subuops_3_ctrl_fcn_dw : io_enq_uop_ctrl_fcn_dw; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ctrl_csr_cmd = unicoreMode ? appended_subuops_3_ctrl_csr_cmd : io_enq_uop_ctrl_csr_cmd; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ctrl_is_load = unicoreMode ? appended_subuops_3_ctrl_is_load : io_enq_uop_ctrl_is_load; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ctrl_is_sta = unicoreMode ? appended_subuops_3_ctrl_is_sta : io_enq_uop_ctrl_is_sta; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ctrl_is_std = unicoreMode ? appended_subuops_3_ctrl_is_std : io_enq_uop_ctrl_is_std; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ctrl_op3_sel = unicoreMode ? appended_subuops_3_ctrl_op3_sel : io_enq_uop_ctrl_op3_sel; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_iw_state = unicoreMode ? appended_subuops_3_iw_state : io_enq_uop_iw_state; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_iw_p1_poisoned = unicoreMode ? appended_subuops_3_iw_p1_poisoned : io_enq_uop_iw_p1_poisoned; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_iw_p2_poisoned = unicoreMode ? appended_subuops_3_iw_p2_poisoned : io_enq_uop_iw_p2_poisoned; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_is_br = unicoreMode ? appended_subuops_3_is_br : cs__is_br; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_is_jalr = unicoreMode ? appended_subuops_3_is_jalr : uop_is_jalr; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_is_jal = unicoreMode ? appended_subuops_3_is_jal : uop_is_jal; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_is_sfb = unicoreMode ? appended_subuops_3_is_sfb : io_enq_uop_is_sfb; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_br_mask = unicoreMode ? appended_subuops_3_br_mask : io_enq_uop_br_mask; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_br_tag = unicoreMode ? appended_subuops_3_br_tag : io_enq_uop_br_tag; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ftq_idx = unicoreMode ? appended_subuops_3_ftq_idx : io_enq_uop_ftq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_edge_inst = unicoreMode ? appended_subuops_3_edge_inst : io_enq_uop_edge_inst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_pc_lob = unicoreMode ? appended_subuops_3_pc_lob : io_enq_uop_pc_lob; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_taken = unicoreMode ? appended_subuops_3_taken : io_enq_uop_taken; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_imm_packed = unicoreMode ? appended_subuops_3_imm_packed : uop_imm_packed; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_csr_addr = unicoreMode ? appended_subuops_3_csr_addr : io_enq_uop_csr_addr; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_rob_idx = unicoreMode ? appended_subuops_3_rob_idx : io_enq_uop_rob_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ldq_idx = unicoreMode ? appended_subuops_3_ldq_idx : io_enq_uop_ldq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_stq_idx = unicoreMode ? appended_subuops_3_stq_idx : io_enq_uop_stq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_rxq_idx = unicoreMode ? appended_subuops_3_rxq_idx : io_enq_uop_rxq_idx; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_pdst = unicoreMode ? appended_subuops_3_pdst : io_enq_uop_pdst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_prs1 = unicoreMode ? appended_subuops_3_prs1 : io_enq_uop_prs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_prs2 = unicoreMode ? appended_subuops_3_prs2 : io_enq_uop_prs2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_prs3 = unicoreMode ? appended_subuops_3_prs3 : io_enq_uop_prs3; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ppred = unicoreMode ? appended_subuops_3_ppred : io_enq_uop_ppred; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_prs1_busy = unicoreMode ? appended_subuops_3_prs1_busy : io_enq_uop_prs1_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_prs2_busy = unicoreMode ? appended_subuops_3_prs2_busy : io_enq_uop_prs2_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_prs3_busy = unicoreMode ? appended_subuops_3_prs3_busy : io_enq_uop_prs3_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ppred_busy = unicoreMode ? appended_subuops_3_ppred_busy : io_enq_uop_ppred_busy; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_stale_pdst = unicoreMode ? appended_subuops_3_stale_pdst : io_enq_uop_stale_pdst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_exception = unicoreMode ? appended_subuops_3_exception : xcpt_valid; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_exc_cause = unicoreMode ? appended_subuops_3_exc_cause : xcpt_cause; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_bypassable = unicoreMode ? appended_subuops_3_bypassable : _T_399; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_mem_cmd = unicoreMode ? appended_subuops_3_mem_cmd : cs__mem_cmd; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_mem_size = unicoreMode ? appended_subuops_3_mem_size : uop_mem_size; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_mem_signed = unicoreMode ? appended_subuops_3_mem_signed : uop_mem_signed; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_is_fence = unicoreMode ? appended_subuops_3_is_fence : uop_is_fence; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_is_fencei = unicoreMode ? appended_subuops_3_is_fencei : uop_is_fencei; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_is_amo = unicoreMode ? appended_subuops_3_is_amo : uop_is_amo; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_uses_ldq = unicoreMode ? appended_subuops_3_uses_ldq : cs__uses_ldq; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_uses_stq = unicoreMode ? appended_subuops_3_uses_stq : cs__uses_stq; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_is_sys_pc2epc = unicoreMode ? appended_subuops_3_is_sys_pc2epc : uop_is_sys_pc2epc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_is_unique = unicoreMode ? appended_subuops_3_is_unique : uop_is_unique; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_flush_on_commit = unicoreMode ? appended_subuops_3_flush_on_commit : uop_flush_on_commit; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ldst_is_rs1 = unicoreMode & appended_subuops_3_ldst_is_rs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ldst = unicoreMode ? appended_subuops_3_ldst : uop_ldst; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_lrs1 = unicoreMode ? appended_subuops_3_lrs1 : uop_lrs1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_lrs2 = unicoreMode ? appended_subuops_3_lrs2 : uop_lrs2; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_lrs3 = unicoreMode ? appended_subuops_3_lrs3 : uop_lrs3; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_ldst_val = unicoreMode ? appended_subuops_3_ldst_val : uop_ldst_val; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_dst_rtype = unicoreMode ? appended_subuops_3_dst_rtype : cs__dst_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_lrs1_rtype = unicoreMode ? appended_subuops_3_lrs1_rtype : cs__rs1_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_lrs2_rtype = unicoreMode ? appended_subuops_3_lrs2_rtype : cs__rs2_type; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_frs3_en = unicoreMode ? appended_subuops_3_frs3_en : uop_frs3_en; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_fp_val = unicoreMode ? appended_subuops_3_fp_val : bit_1; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_fp_single = unicoreMode ? appended_subuops_3_fp_single : cs__fp_single; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_xcpt_pf_if = unicoreMode ? appended_subuops_3_xcpt_pf_if : io_enq_uop_xcpt_pf_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_xcpt_ae_if = unicoreMode ? appended_subuops_3_xcpt_ae_if : io_enq_uop_xcpt_ae_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_xcpt_ma_if = unicoreMode ? appended_subuops_3_xcpt_ma_if : io_enq_uop_xcpt_ma_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_bp_debug_if = unicoreMode ? appended_subuops_3_bp_debug_if : io_enq_uop_bp_debug_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_bp_xcpt_if = unicoreMode ? appended_subuops_3_bp_xcpt_if : io_enq_uop_bp_xcpt_if; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_debug_fsrc = unicoreMode ? appended_subuops_3_debug_fsrc : io_enq_uop_debug_fsrc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uops_3_debug_tsrc = unicoreMode ? appended_subuops_3_debug_tsrc : io_enq_uop_debug_tsrc; // @[decode.scala 802:20 decode.scala 823:9 decode.scala 838:20]
  assign io_deq_uop_valids_0 = unicoreMode ? 5'h0 < split_num & io_deq_is_decoded : 1'h1; // @[decode.scala 802:20 decode.scala 822:9 decode.scala 830:26]
  assign io_deq_uop_valids_1 = unicoreMode & (5'h1 < split_num & io_deq_is_decoded); // @[decode.scala 802:20 decode.scala 822:9 decode.scala 831:26]
  assign io_deq_uop_valids_2 = unicoreMode & (5'h2 < split_num & io_deq_is_decoded); // @[decode.scala 802:20 decode.scala 822:9 decode.scala 832:26]
  assign io_deq_uop_valids_3 = unicoreMode & (5'h3 < split_num & io_deq_is_decoded); // @[decode.scala 802:20 decode.scala 822:9 decode.scala 833:26]
  assign io_deq_num = _GEN_1188[4:0];
  assign io_deq_is_decoded = unicoreMode ? ~bit_7 : 1'h1; // @[decode.scala 802:20 decode.scala 818:23 decode.scala 841:23]
  assign io_csr_decode_csr = io_enq_uop_inst[31:20]; // @[decode.scala 652:28]
  assign subDecUnit0_clock = clock;
  assign subDecUnit0_reset = reset;
  assign subDecUnit0_io_rawuop_switch = _T_1289 & (_T_1294 & io_enq_uop_inst[24:20] == 5'h1); // @[decode.scala 687:38]
  assign subDecUnit0_io_rawuop_switch_off = cs__uopc == 7'hf & (io_enq_uop_inst[11:7] == 5'h0 & io_enq_uop_inst[19:15]
     == 5'h0 & io_enq_uop_inst[24:20] == 5'h2); // @[decode.scala 688:42]
  assign subDecUnit0_io_rawuop_is_unicore = unicoreMode | io_is_unicore; // @[decode.scala 802:20 decode.scala 808:22 decode.scala 686:23]
  assign subDecUnit0_io_rawuop_shift = 3'h0; // @[decode.scala 600:17 decode.scala 704:23]
  assign subDecUnit0_io_rawuop_lrs3_rtype = 2'h2; // @[decode.scala 600:17 decode.scala 699:23]
  assign subDecUnit0_io_rawuop_rflag = 1'h0; // @[decode.scala 600:17 decode.scala 706:23]
  assign subDecUnit0_io_rawuop_wflag = 1'h0; // @[decode.scala 600:17 decode.scala 705:23]
  assign subDecUnit0_io_rawuop_prflag = io_enq_uop_prflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_pwflag = io_enq_uop_pwflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_pflag_busy = io_enq_uop_pflag_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_stale_pflag = io_enq_uop_stale_pflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_op1_sel = io_enq_uop_op1_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_op2_sel = io_enq_uop_op2_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_split_num = {{1'd0}, _GEN_1179}; // @[decode.scala 600:17]
  assign subDecUnit0_io_rawuop_self_index = 6'h0; // @[decode.scala 600:17]
  assign subDecUnit0_io_rawuop_rob_inst_idx = io_enq_uop_rob_inst_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_address_num = io_enq_uop_address_num; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_uopc = {hi,lo}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_rawuop_inst = io_enq_uop_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_debug_inst = io_enq_uop_debug_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_is_rvc = unicoreMode ? 1'h0 : io_enq_uop_is_rvc; // @[decode.scala 711:22 decode.scala 712:16 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_debug_pc = io_enq_uop_debug_pc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_iq_type = {hi_1,lo_1}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_rawuop_fu_code = {hi_2,lo_2}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_rawuop_ctrl_br_type = io_enq_uop_ctrl_br_type; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ctrl_op1_sel = io_enq_uop_ctrl_op1_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ctrl_op2_sel = io_enq_uop_ctrl_op2_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ctrl_imm_sel = io_enq_uop_ctrl_imm_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ctrl_op_fcn = io_enq_uop_ctrl_op_fcn; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ctrl_fcn_dw = io_enq_uop_ctrl_fcn_dw; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ctrl_csr_cmd = io_enq_uop_ctrl_csr_cmd; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ctrl_is_load = io_enq_uop_ctrl_is_load; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ctrl_is_sta = io_enq_uop_ctrl_is_sta; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ctrl_is_std = io_enq_uop_ctrl_is_std; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ctrl_op3_sel = io_enq_uop_ctrl_op3_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_iw_state = io_enq_uop_iw_state; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_iw_p1_poisoned = io_enq_uop_iw_p1_poisoned; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_iw_p2_poisoned = io_enq_uop_iw_p2_poisoned; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_is_br = _T_252 == 32'h60; // @[Decode.scala 14:121]
  assign subDecUnit0_io_rawuop_is_jalr = cs__uopc == 7'h26; // @[decode.scala 736:31]
  assign subDecUnit0_io_rawuop_is_jal = cs__uopc == 7'h25; // @[decode.scala 735:31]
  assign subDecUnit0_io_rawuop_is_sfb = io_enq_uop_is_sfb; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_br_mask = io_enq_uop_br_mask; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_br_tag = io_enq_uop_br_tag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ftq_idx = io_enq_uop_ftq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_edge_inst = io_enq_uop_edge_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_pc_lob = io_enq_uop_pc_lob; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_taken = io_enq_uop_taken; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_imm_packed = unicoreMode ? io_enq_uop_inst[19:0] : _T_1323; // @[decode.scala 703:29]
  assign subDecUnit0_io_rawuop_csr_addr = io_enq_uop_csr_addr; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_rob_idx = io_enq_uop_rob_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ldq_idx = io_enq_uop_ldq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_stq_idx = io_enq_uop_stq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_rxq_idx = io_enq_uop_rxq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_pdst = io_enq_uop_pdst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_prs1 = io_enq_uop_prs1; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_prs2 = io_enq_uop_prs2; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_prs3 = io_enq_uop_prs3; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ppred = io_enq_uop_ppred; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_prs1_busy = io_enq_uop_prs1_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_prs2_busy = io_enq_uop_prs2_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_prs3_busy = io_enq_uop_prs3_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_ppred_busy = io_enq_uop_ppred_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_stale_pdst = io_enq_uop_stale_pdst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_exception = _T_1270 | io_enq_uop_bp_debug_if | io_enq_uop_bp_xcpt_if |
    io_enq_uop_xcpt_pf_if | io_enq_uop_xcpt_ae_if | id_illegal_insn; // @[decode.scala 671:26]
  assign subDecUnit0_io_rawuop_exc_cause = _T_1270 ? io_interrupt_cause : {{60'd0}, _T_1278}; // @[Mux.scala 47:69]
  assign subDecUnit0_io_rawuop_bypassable = _T_392 | _T_394 | _T_396; // @[Decode.scala 15:30]
  assign subDecUnit0_io_rawuop_mem_cmd = {hi_7,lo_7}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_rawuop_mem_size = _T_1341 ? _T_1342 : io_enq_uop_inst[13:12]; // @[decode.scala 739:24]
  assign subDecUnit0_io_rawuop_mem_signed = unicoreMode ? 1'h0 : ~io_enq_uop_inst[14]; // @[decode.scala 702:29]
  assign subDecUnit0_io_rawuop_is_fence = unicoreMode ? 1'h0 : cs__is_fence; // @[decode.scala 693:29]
  assign subDecUnit0_io_rawuop_is_fencei = unicoreMode ? 1'h0 : bit_4; // @[decode.scala 694:29]
  assign subDecUnit0_io_rawuop_is_amo = unicoreMode ? bit_8 : cs__is_amo; // @[decode.scala 692:29]
  assign subDecUnit0_io_rawuop_uses_ldq = _T_500 | _T_502; // @[Decode.scala 15:30]
  assign subDecUnit0_io_rawuop_uses_stq = cs__is_fence | _T_95 | _T_97 | _T_125; // @[Decode.scala 15:30]
  assign subDecUnit0_io_rawuop_is_sys_pc2epc = unicoreMode ? 1'h0 : bit_5; // @[decode.scala 695:29]
  assign subDecUnit0_io_rawuop_is_unique = uop_switch | uop_switch_off | _T_1326; // @[decode.scala 709:29]
  assign subDecUnit0_io_rawuop_flush_on_commit = unicoreMode ? bit_8 : riscv_flush_on_commit; // @[decode.scala 696:29]
  assign subDecUnit0_io_rawuop_ldst_is_rs1 = 1'h0; // @[decode.scala 742:52 decode.scala 745:21]
  assign subDecUnit0_io_rawuop_ldst = {{1'd0}, io_enq_uop_inst[11:7]}; // @[decode.scala 600:17 decode.scala 720:18]
  assign subDecUnit0_io_rawuop_lrs1 = {{1'd0}, io_enq_uop_inst[19:15]}; // @[decode.scala 600:17]
  assign subDecUnit0_io_rawuop_lrs2 = {{1'd0}, io_enq_uop_inst[24:20]}; // @[decode.scala 600:17]
  assign subDecUnit0_io_rawuop_lrs3 = {{1'd0}, _T_1313}; // @[decode.scala 600:17 decode.scala 698:23]
  assign subDecUnit0_io_rawuop_ldst_val = cs__dst_type != 2'h2 & ~(uop_ldst == 6'h0 & cs__dst_type == 2'h0); // @[decode.scala 723:42]
  assign subDecUnit0_io_rawuop_dst_rtype = {hi_3,lo_3}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_rawuop_lrs1_rtype = {hi_4,lo_4}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_rawuop_lrs2_rtype = {hi_5,lo_5}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_rawuop_frs3_en = unicoreMode ? 1'h0 : cs__frs3_en; // @[decode.scala 700:29]
  assign subDecUnit0_io_rawuop_fp_val = _bit_T_536 | _bit_T_285; // @[Decode.scala 15:30]
  assign subDecUnit0_io_rawuop_fp_single = _T_1 | _T_3; // @[Decode.scala 15:30]
  assign subDecUnit0_io_rawuop_xcpt_pf_if = io_enq_uop_xcpt_pf_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_xcpt_ae_if = io_enq_uop_xcpt_ae_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_xcpt_ma_if = io_enq_uop_xcpt_ma_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_bp_debug_if = io_enq_uop_bp_debug_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_bp_xcpt_if = io_enq_uop_bp_xcpt_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_debug_fsrc = io_enq_uop_debug_fsrc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_rawuop_debug_tsrc = io_enq_uop_debug_tsrc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit0_io_cs_sub_valid = _bit_T_2644 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2066 | _bit_T_2068
     | _bit_T_2070 | _bit_T_2072 | _bit_T_2074 | _bit_T_2076 | _bit_T_2078 | _bit_T_2080 | _bit_T_2082 | _bit_T_2084 |
    _bit_T_2086 | _bit_T_2088 | _bit_T_2090 | _bit_T_2092 | _bit_T_2094 | _bit_T_2096 | _bit_T_2098 | _bit_T_2100 |
    _bit_T_2102; // @[Decode.scala 15:30]
  assign subDecUnit0_io_cs_sub_fp_val = _bit_T_2726 | _bit_T_2098 | _bit_T_2100 | _bit_T_2102; // @[Decode.scala 15:30]
  assign subDecUnit0_io_cs_sub_fp_single = _bit_T_2730 | _bit_T_2732 | _bit_T_2734 | _bit_T_2736 | _bit_T_2738 |
    _bit_T_2740 | _bit_T_2742 | _bit_T_2744 | _bit_T_2746 | _bit_T_2748 | _bit_T_2096 | bit_30 | _bit_T_2094 |
    _bit_T_2098 | _bit_T_2042; // @[Decode.scala 15:30]
  assign subDecUnit0_io_cs_sub_uopc = {hi_11,lo_10}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_iq_type = {hi_12,lo_11}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_fu_code = {hi_13,lo_12}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_uses_ldq = _T_575 | _T_601; // @[Decode.scala 15:30]
  assign subDecUnit0_io_cs_sub_uses_stq = _T_634 | _T_638; // @[Decode.scala 15:30]
  assign subDecUnit0_io_cs_sub_is_br = _T_826 | _T_729; // @[Decode.scala 15:30]
  assign subDecUnit0_io_cs_sub_dst_type = {hi_14,lo_13}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_rs1_type = {hi_15,lo_14}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_rs2_type = {hi_16,lo_15}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_rtemp1 = 5'h0; // @[decode.scala 643:21 subInstDecode.scala 86:44]
  assign subDecUnit0_io_cs_sub_rtemp2 = 5'h0; // @[decode.scala 643:21 subInstDecode.scala 86:44]
  assign subDecUnit0_io_cs_sub_wtemp = {{4'd0}, bit_15}; // @[decode.scala 643:21 subInstDecode.scala 86:44]
  assign subDecUnit0_io_cs_sub_wflag = _T_833 | _T_835 | _T_837 | _T_839 | _T_841 | _T_843 | _T_807 | _T_845 | _T_847 |
    _T_849; // @[Decode.scala 15:30]
  assign subDecUnit0_io_cs_sub_rflag = _T_861 | _T_863 | _T_865 | _T_867 | _T_869 | _T_871 | _T_826 | _T_729 | _T_873 |
    _T_875 | _T_877 | _T_807; // @[Decode.scala 15:30]
  assign subDecUnit0_io_cs_sub_imm_sel = {hi_17,lo_16}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_wakeup_delay = {hi_18,lo_17}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_bypassable = _bit_T_6058 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990; // @[Decode.scala 15:30]
  assign subDecUnit0_io_cs_sub_mem_cmd = {hi_19,lo_18}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_mem_size = {hi_20,lo_19}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_shift = {hi_21,lo_20}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_split_num = {{2'd0}, _T_916}; // @[decode.scala 643:21 subInstDecode.scala 86:44]
  assign subDecUnit0_io_cs_sub_op1_sel = {hi_23,lo_22}; // @[Cat.scala 30:58]
  assign subDecUnit0_io_cs_sub_op2_sel = {hi_24,lo_23}; // @[Cat.scala 30:58]
  assign subDecUnit1_clock = clock;
  assign subDecUnit1_reset = reset;
  assign subDecUnit1_io_rawuop_switch = _T_1289 & (_T_1294 & io_enq_uop_inst[24:20] == 5'h1); // @[decode.scala 687:38]
  assign subDecUnit1_io_rawuop_switch_off = cs__uopc == 7'hf & (io_enq_uop_inst[11:7] == 5'h0 & io_enq_uop_inst[19:15]
     == 5'h0 & io_enq_uop_inst[24:20] == 5'h2); // @[decode.scala 688:42]
  assign subDecUnit1_io_rawuop_is_unicore = unicoreMode | uop_is_unicore; // @[decode.scala 802:20 decode.scala 809:22 decode.scala 760:8]
  assign subDecUnit1_io_rawuop_shift = 3'h0; // @[decode.scala 600:17 decode.scala 704:23]
  assign subDecUnit1_io_rawuop_lrs3_rtype = 2'h2; // @[decode.scala 600:17 decode.scala 699:23]
  assign subDecUnit1_io_rawuop_rflag = 1'h0; // @[decode.scala 600:17 decode.scala 706:23]
  assign subDecUnit1_io_rawuop_wflag = 1'h0; // @[decode.scala 600:17 decode.scala 705:23]
  assign subDecUnit1_io_rawuop_prflag = io_enq_uop_prflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_pwflag = io_enq_uop_pwflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_pflag_busy = io_enq_uop_pflag_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_stale_pflag = io_enq_uop_stale_pflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_op1_sel = io_enq_uop_op1_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_op2_sel = io_enq_uop_op2_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_split_num = unicoreMode ? {{1'd0}, split_num} : uop_split_num; // @[decode.scala 802:20 decode.scala 804:20 decode.scala 760:8]
  assign subDecUnit1_io_rawuop_self_index = unicoreMode ? 6'h1 : 6'h0; // @[decode.scala 802:20 decode.scala 814:21 decode.scala 760:8]
  assign subDecUnit1_io_rawuop_rob_inst_idx = io_enq_uop_rob_inst_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_address_num = io_enq_uop_address_num; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_uopc = {hi,lo}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_rawuop_inst = io_enq_uop_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_debug_inst = io_enq_uop_debug_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_is_rvc = unicoreMode ? 1'h0 : io_enq_uop_is_rvc; // @[decode.scala 711:22 decode.scala 712:16 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_debug_pc = io_enq_uop_debug_pc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_iq_type = {hi_1,lo_1}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_rawuop_fu_code = {hi_2,lo_2}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_rawuop_ctrl_br_type = io_enq_uop_ctrl_br_type; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ctrl_op1_sel = io_enq_uop_ctrl_op1_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ctrl_op2_sel = io_enq_uop_ctrl_op2_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ctrl_imm_sel = io_enq_uop_ctrl_imm_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ctrl_op_fcn = io_enq_uop_ctrl_op_fcn; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ctrl_fcn_dw = io_enq_uop_ctrl_fcn_dw; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ctrl_csr_cmd = io_enq_uop_ctrl_csr_cmd; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ctrl_is_load = io_enq_uop_ctrl_is_load; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ctrl_is_sta = io_enq_uop_ctrl_is_sta; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ctrl_is_std = io_enq_uop_ctrl_is_std; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ctrl_op3_sel = io_enq_uop_ctrl_op3_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_iw_state = io_enq_uop_iw_state; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_iw_p1_poisoned = io_enq_uop_iw_p1_poisoned; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_iw_p2_poisoned = io_enq_uop_iw_p2_poisoned; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_is_br = _T_252 == 32'h60; // @[Decode.scala 14:121]
  assign subDecUnit1_io_rawuop_is_jalr = cs__uopc == 7'h26; // @[decode.scala 736:31]
  assign subDecUnit1_io_rawuop_is_jal = cs__uopc == 7'h25; // @[decode.scala 735:31]
  assign subDecUnit1_io_rawuop_is_sfb = io_enq_uop_is_sfb; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_br_mask = io_enq_uop_br_mask; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_br_tag = io_enq_uop_br_tag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ftq_idx = io_enq_uop_ftq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_edge_inst = io_enq_uop_edge_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_pc_lob = io_enq_uop_pc_lob; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_taken = io_enq_uop_taken; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_imm_packed = unicoreMode ? io_enq_uop_inst[19:0] : _T_1323; // @[decode.scala 703:29]
  assign subDecUnit1_io_rawuop_csr_addr = io_enq_uop_csr_addr; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_rob_idx = io_enq_uop_rob_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ldq_idx = io_enq_uop_ldq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_stq_idx = io_enq_uop_stq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_rxq_idx = io_enq_uop_rxq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_pdst = io_enq_uop_pdst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_prs1 = io_enq_uop_prs1; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_prs2 = io_enq_uop_prs2; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_prs3 = io_enq_uop_prs3; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ppred = io_enq_uop_ppred; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_prs1_busy = io_enq_uop_prs1_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_prs2_busy = io_enq_uop_prs2_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_prs3_busy = io_enq_uop_prs3_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_ppred_busy = io_enq_uop_ppred_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_stale_pdst = io_enq_uop_stale_pdst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_exception = _T_1270 | io_enq_uop_bp_debug_if | io_enq_uop_bp_xcpt_if |
    io_enq_uop_xcpt_pf_if | io_enq_uop_xcpt_ae_if | id_illegal_insn; // @[decode.scala 671:26]
  assign subDecUnit1_io_rawuop_exc_cause = _T_1270 ? io_interrupt_cause : {{60'd0}, _T_1278}; // @[Mux.scala 47:69]
  assign subDecUnit1_io_rawuop_bypassable = _T_392 | _T_394 | _T_396; // @[Decode.scala 15:30]
  assign subDecUnit1_io_rawuop_mem_cmd = {hi_7,lo_7}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_rawuop_mem_size = _T_1341 ? _T_1342 : io_enq_uop_inst[13:12]; // @[decode.scala 739:24]
  assign subDecUnit1_io_rawuop_mem_signed = unicoreMode ? 1'h0 : ~io_enq_uop_inst[14]; // @[decode.scala 702:29]
  assign subDecUnit1_io_rawuop_is_fence = unicoreMode ? 1'h0 : cs__is_fence; // @[decode.scala 693:29]
  assign subDecUnit1_io_rawuop_is_fencei = unicoreMode ? 1'h0 : bit_4; // @[decode.scala 694:29]
  assign subDecUnit1_io_rawuop_is_amo = unicoreMode ? bit_8 : cs__is_amo; // @[decode.scala 692:29]
  assign subDecUnit1_io_rawuop_uses_ldq = _T_500 | _T_502; // @[Decode.scala 15:30]
  assign subDecUnit1_io_rawuop_uses_stq = cs__is_fence | _T_95 | _T_97 | _T_125; // @[Decode.scala 15:30]
  assign subDecUnit1_io_rawuop_is_sys_pc2epc = unicoreMode ? 1'h0 : bit_5; // @[decode.scala 695:29]
  assign subDecUnit1_io_rawuop_is_unique = uop_switch | uop_switch_off | _T_1326; // @[decode.scala 709:29]
  assign subDecUnit1_io_rawuop_flush_on_commit = unicoreMode ? bit_8 : riscv_flush_on_commit; // @[decode.scala 696:29]
  assign subDecUnit1_io_rawuop_ldst_is_rs1 = 1'h0; // @[decode.scala 742:52 decode.scala 745:21]
  assign subDecUnit1_io_rawuop_ldst = {{1'd0}, io_enq_uop_inst[11:7]}; // @[decode.scala 600:17 decode.scala 720:18]
  assign subDecUnit1_io_rawuop_lrs1 = {{1'd0}, io_enq_uop_inst[19:15]}; // @[decode.scala 600:17]
  assign subDecUnit1_io_rawuop_lrs2 = {{1'd0}, io_enq_uop_inst[24:20]}; // @[decode.scala 600:17]
  assign subDecUnit1_io_rawuop_lrs3 = {{1'd0}, _T_1313}; // @[decode.scala 600:17 decode.scala 698:23]
  assign subDecUnit1_io_rawuop_ldst_val = cs__dst_type != 2'h2 & ~(uop_ldst == 6'h0 & cs__dst_type == 2'h0); // @[decode.scala 723:42]
  assign subDecUnit1_io_rawuop_dst_rtype = {hi_3,lo_3}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_rawuop_lrs1_rtype = {hi_4,lo_4}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_rawuop_lrs2_rtype = {hi_5,lo_5}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_rawuop_frs3_en = unicoreMode ? 1'h0 : cs__frs3_en; // @[decode.scala 700:29]
  assign subDecUnit1_io_rawuop_fp_val = _bit_T_536 | _bit_T_285; // @[Decode.scala 15:30]
  assign subDecUnit1_io_rawuop_fp_single = _T_1 | _T_3; // @[Decode.scala 15:30]
  assign subDecUnit1_io_rawuop_xcpt_pf_if = io_enq_uop_xcpt_pf_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_xcpt_ae_if = io_enq_uop_xcpt_ae_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_xcpt_ma_if = io_enq_uop_xcpt_ma_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_bp_debug_if = io_enq_uop_bp_debug_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_bp_xcpt_if = io_enq_uop_bp_xcpt_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_debug_fsrc = io_enq_uop_debug_fsrc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_rawuop_debug_tsrc = io_enq_uop_debug_tsrc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit1_io_cs_sub_valid = _bit_T_9754 | _bit_T_1998 | _bit_T_2000 | _bit_T_2002 | _bit_T_2004 | _bit_T_2006
     | _bit_T_998 | _bit_T_1000 | _bit_T_1002 | _bit_T_1004 | _bit_T_1014 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 |
    bit_30 | _bit_T_2048 | _bit_T_2058 | _bit_T_2060 | _bit_T_2062 | _bit_T_2064 | _bit_T_2074 | _bit_T_2076 |
    _bit_T_2078 | _bit_T_2080 | _bit_T_2088 | _bit_T_2034; // @[Decode.scala 15:30]
  assign subDecUnit1_io_cs_sub_fp_val = 1'h0; // @[decode.scala 644:21 subInstDecode.scala 86:44]
  assign subDecUnit1_io_cs_sub_fp_single = 1'h0; // @[decode.scala 644:21 subInstDecode.scala 86:44]
  assign subDecUnit1_io_cs_sub_uopc = {hi_25,lo_24}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_iq_type = {hi_26,lo_25}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_fu_code = {5'h0,lo_26}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_uses_ldq = _T_924 | _T_936 | _T_938; // @[Decode.scala 15:30]
  assign subDecUnit1_io_cs_sub_uses_stq = _T_961 | _T_975 | _T_977; // @[Decode.scala 15:30]
  assign subDecUnit1_io_cs_sub_is_br = 1'h0; // @[decode.scala 644:21 subInstDecode.scala 86:44]
  assign subDecUnit1_io_cs_sub_dst_type = {hi_28,lo_27}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_rs1_type = {hi_29,lo_28}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_rs2_type = {hi_30,lo_29}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_rtemp1 = {{4'd0}, _bit_T_9842}; // @[decode.scala 644:21 subInstDecode.scala 86:44]
  assign subDecUnit1_io_cs_sub_rtemp2 = {{4'd0}, bit_23}; // @[decode.scala 644:21 subInstDecode.scala 86:44]
  assign subDecUnit1_io_cs_sub_wtemp = {{3'd0}, _T_1104}; // @[decode.scala 644:21 subInstDecode.scala 86:44]
  assign subDecUnit1_io_cs_sub_wflag = _T_1106 | _T_1108; // @[Decode.scala 15:30]
  assign subDecUnit1_io_cs_sub_rflag = _T_1112 | _T_1114 | _T_1116 | _T_839 | _T_1118 | _T_1120 | _T_1122 | _T_1108; // @[Decode.scala 15:30]
  assign subDecUnit1_io_cs_sub_imm_sel = {hi_32,lo_31}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_wakeup_delay = {hi_33,lo_32}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_bypassable = _bit_T_13308 | _bit_T_1016 | _bit_T_1018 | _bit_T_1020 | bit_30 |
    _bit_T_2048; // @[Decode.scala 15:30]
  assign subDecUnit1_io_cs_sub_mem_cmd = {3'h0,lo_33}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_mem_size = {hi_35,lo_34}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_shift = {hi_36,lo_35}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_split_num = {{4'd0}, _T_1143}; // @[decode.scala 644:21 subInstDecode.scala 86:44]
  assign subDecUnit1_io_cs_sub_op1_sel = {2'h0,lo_36}; // @[Cat.scala 30:58]
  assign subDecUnit1_io_cs_sub_op2_sel = {hi_38,lo_37}; // @[Cat.scala 30:58]
  assign subDecUnit2_clock = clock;
  assign subDecUnit2_reset = reset;
  assign subDecUnit2_io_rawuop_switch = _T_1289 & (_T_1294 & io_enq_uop_inst[24:20] == 5'h1); // @[decode.scala 687:38]
  assign subDecUnit2_io_rawuop_switch_off = cs__uopc == 7'hf & (io_enq_uop_inst[11:7] == 5'h0 & io_enq_uop_inst[19:15]
     == 5'h0 & io_enq_uop_inst[24:20] == 5'h2); // @[decode.scala 688:42]
  assign subDecUnit2_io_rawuop_is_unicore = unicoreMode | uop_is_unicore; // @[decode.scala 802:20 decode.scala 809:22 decode.scala 760:8]
  assign subDecUnit2_io_rawuop_shift = 3'h0; // @[decode.scala 600:17 decode.scala 704:23]
  assign subDecUnit2_io_rawuop_lrs3_rtype = 2'h2; // @[decode.scala 600:17 decode.scala 699:23]
  assign subDecUnit2_io_rawuop_rflag = 1'h0; // @[decode.scala 600:17 decode.scala 706:23]
  assign subDecUnit2_io_rawuop_wflag = 1'h0; // @[decode.scala 600:17 decode.scala 705:23]
  assign subDecUnit2_io_rawuop_prflag = io_enq_uop_prflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_pwflag = io_enq_uop_pwflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_pflag_busy = io_enq_uop_pflag_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_stale_pflag = io_enq_uop_stale_pflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_op1_sel = io_enq_uop_op1_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_op2_sel = io_enq_uop_op2_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_split_num = unicoreMode ? {{1'd0}, split_num} : uop_split_num; // @[decode.scala 802:20 decode.scala 804:20 decode.scala 760:8]
  assign subDecUnit2_io_rawuop_self_index = unicoreMode ? 6'h2 : 6'h0; // @[decode.scala 802:20 decode.scala 815:21 decode.scala 761:8]
  assign subDecUnit2_io_rawuop_rob_inst_idx = io_enq_uop_rob_inst_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_address_num = io_enq_uop_address_num; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_uopc = {hi,lo}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_rawuop_inst = io_enq_uop_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_debug_inst = io_enq_uop_debug_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_is_rvc = unicoreMode ? 1'h0 : io_enq_uop_is_rvc; // @[decode.scala 711:22 decode.scala 712:16 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_debug_pc = io_enq_uop_debug_pc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_iq_type = {hi_1,lo_1}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_rawuop_fu_code = {hi_2,lo_2}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_rawuop_ctrl_br_type = io_enq_uop_ctrl_br_type; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ctrl_op1_sel = io_enq_uop_ctrl_op1_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ctrl_op2_sel = io_enq_uop_ctrl_op2_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ctrl_imm_sel = io_enq_uop_ctrl_imm_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ctrl_op_fcn = io_enq_uop_ctrl_op_fcn; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ctrl_fcn_dw = io_enq_uop_ctrl_fcn_dw; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ctrl_csr_cmd = io_enq_uop_ctrl_csr_cmd; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ctrl_is_load = io_enq_uop_ctrl_is_load; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ctrl_is_sta = io_enq_uop_ctrl_is_sta; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ctrl_is_std = io_enq_uop_ctrl_is_std; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ctrl_op3_sel = io_enq_uop_ctrl_op3_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_iw_state = io_enq_uop_iw_state; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_iw_p1_poisoned = io_enq_uop_iw_p1_poisoned; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_iw_p2_poisoned = io_enq_uop_iw_p2_poisoned; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_is_br = _T_252 == 32'h60; // @[Decode.scala 14:121]
  assign subDecUnit2_io_rawuop_is_jalr = cs__uopc == 7'h26; // @[decode.scala 736:31]
  assign subDecUnit2_io_rawuop_is_jal = cs__uopc == 7'h25; // @[decode.scala 735:31]
  assign subDecUnit2_io_rawuop_is_sfb = io_enq_uop_is_sfb; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_br_mask = io_enq_uop_br_mask; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_br_tag = io_enq_uop_br_tag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ftq_idx = io_enq_uop_ftq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_edge_inst = io_enq_uop_edge_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_pc_lob = io_enq_uop_pc_lob; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_taken = io_enq_uop_taken; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_imm_packed = unicoreMode ? io_enq_uop_inst[19:0] : _T_1323; // @[decode.scala 703:29]
  assign subDecUnit2_io_rawuop_csr_addr = io_enq_uop_csr_addr; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_rob_idx = io_enq_uop_rob_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ldq_idx = io_enq_uop_ldq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_stq_idx = io_enq_uop_stq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_rxq_idx = io_enq_uop_rxq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_pdst = io_enq_uop_pdst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_prs1 = io_enq_uop_prs1; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_prs2 = io_enq_uop_prs2; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_prs3 = io_enq_uop_prs3; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ppred = io_enq_uop_ppred; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_prs1_busy = io_enq_uop_prs1_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_prs2_busy = io_enq_uop_prs2_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_prs3_busy = io_enq_uop_prs3_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_ppred_busy = io_enq_uop_ppred_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_stale_pdst = io_enq_uop_stale_pdst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_exception = _T_1270 | io_enq_uop_bp_debug_if | io_enq_uop_bp_xcpt_if |
    io_enq_uop_xcpt_pf_if | io_enq_uop_xcpt_ae_if | id_illegal_insn; // @[decode.scala 671:26]
  assign subDecUnit2_io_rawuop_exc_cause = _T_1270 ? io_interrupt_cause : {{60'd0}, _T_1278}; // @[Mux.scala 47:69]
  assign subDecUnit2_io_rawuop_bypassable = _T_392 | _T_394 | _T_396; // @[Decode.scala 15:30]
  assign subDecUnit2_io_rawuop_mem_cmd = {hi_7,lo_7}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_rawuop_mem_size = _T_1341 ? _T_1342 : io_enq_uop_inst[13:12]; // @[decode.scala 739:24]
  assign subDecUnit2_io_rawuop_mem_signed = unicoreMode ? 1'h0 : ~io_enq_uop_inst[14]; // @[decode.scala 702:29]
  assign subDecUnit2_io_rawuop_is_fence = unicoreMode ? 1'h0 : cs__is_fence; // @[decode.scala 693:29]
  assign subDecUnit2_io_rawuop_is_fencei = unicoreMode ? 1'h0 : bit_4; // @[decode.scala 694:29]
  assign subDecUnit2_io_rawuop_is_amo = unicoreMode ? bit_8 : cs__is_amo; // @[decode.scala 692:29]
  assign subDecUnit2_io_rawuop_uses_ldq = _T_500 | _T_502; // @[Decode.scala 15:30]
  assign subDecUnit2_io_rawuop_uses_stq = cs__is_fence | _T_95 | _T_97 | _T_125; // @[Decode.scala 15:30]
  assign subDecUnit2_io_rawuop_is_sys_pc2epc = unicoreMode ? 1'h0 : bit_5; // @[decode.scala 695:29]
  assign subDecUnit2_io_rawuop_is_unique = uop_switch | uop_switch_off | _T_1326; // @[decode.scala 709:29]
  assign subDecUnit2_io_rawuop_flush_on_commit = unicoreMode ? bit_8 : riscv_flush_on_commit; // @[decode.scala 696:29]
  assign subDecUnit2_io_rawuop_ldst_is_rs1 = 1'h0; // @[decode.scala 742:52 decode.scala 745:21]
  assign subDecUnit2_io_rawuop_ldst = {{1'd0}, io_enq_uop_inst[11:7]}; // @[decode.scala 600:17 decode.scala 720:18]
  assign subDecUnit2_io_rawuop_lrs1 = {{1'd0}, io_enq_uop_inst[19:15]}; // @[decode.scala 600:17]
  assign subDecUnit2_io_rawuop_lrs2 = {{1'd0}, io_enq_uop_inst[24:20]}; // @[decode.scala 600:17]
  assign subDecUnit2_io_rawuop_lrs3 = {{1'd0}, _T_1313}; // @[decode.scala 600:17 decode.scala 698:23]
  assign subDecUnit2_io_rawuop_ldst_val = cs__dst_type != 2'h2 & ~(uop_ldst == 6'h0 & cs__dst_type == 2'h0); // @[decode.scala 723:42]
  assign subDecUnit2_io_rawuop_dst_rtype = {hi_3,lo_3}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_rawuop_lrs1_rtype = {hi_4,lo_4}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_rawuop_lrs2_rtype = {hi_5,lo_5}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_rawuop_frs3_en = unicoreMode ? 1'h0 : cs__frs3_en; // @[decode.scala 700:29]
  assign subDecUnit2_io_rawuop_fp_val = _bit_T_536 | _bit_T_285; // @[Decode.scala 15:30]
  assign subDecUnit2_io_rawuop_fp_single = _T_1 | _T_3; // @[Decode.scala 15:30]
  assign subDecUnit2_io_rawuop_xcpt_pf_if = io_enq_uop_xcpt_pf_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_xcpt_ae_if = io_enq_uop_xcpt_ae_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_xcpt_ma_if = io_enq_uop_xcpt_ma_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_bp_debug_if = io_enq_uop_bp_debug_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_bp_xcpt_if = io_enq_uop_bp_xcpt_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_debug_fsrc = io_enq_uop_debug_fsrc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_rawuop_debug_tsrc = io_enq_uop_debug_tsrc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit2_io_cs_sub_valid = _bit_T_15129 | _bit_T_1906 | _bit_T_1908 | _bit_T_1910 | _bit_T_1944 |
    _bit_T_1946 | _bit_T_1948 | _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1976 |
    _bit_T_1978 | _bit_T_1980 | _bit_T_1982 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990 | bit_30 |
    _bit_T_2048; // @[Decode.scala 15:30]
  assign subDecUnit2_io_cs_sub_fp_val = bit_30 | _bit_T_2048; // @[Decode.scala 15:30]
  assign subDecUnit2_io_cs_sub_fp_single = _bit_T_2041 == 32'he9000800; // @[Decode.scala 14:121]
  assign subDecUnit2_io_cs_sub_uopc = {hi_39,lo_38}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_iq_type = {hi_40,lo_39}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_fu_code = {hi_41,lo_40}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_uses_ldq = _T_1193 == 32'h11000000; // @[Decode.scala 14:121]
  assign subDecUnit2_io_cs_sub_uses_stq = _T_1196 == 32'h10000000; // @[Decode.scala 14:121]
  assign subDecUnit2_io_cs_sub_is_br = 1'h0; // @[decode.scala 645:21 subInstDecode.scala 86:44]
  assign subDecUnit2_io_cs_sub_dst_type = {hi_42,lo_41}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_rs1_type = {hi_43,lo_42}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_rs2_type = {hi_44,lo_43}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_rtemp1 = {{4'd0}, _bit_T_15060}; // @[decode.scala 645:21 subInstDecode.scala 86:44]
  assign subDecUnit2_io_cs_sub_rtemp2 = {{3'd0}, _T_1202}; // @[decode.scala 645:21 subInstDecode.scala 86:44]
  assign subDecUnit2_io_cs_sub_wtemp = {{4'd0}, bit_33}; // @[decode.scala 645:21 subInstDecode.scala 86:44]
  assign subDecUnit2_io_cs_sub_wflag = _T_1106 | hi_lo_hi_6; // @[Decode.scala 15:30]
  assign subDecUnit2_io_cs_sub_rflag = _T_1173 == 32'h80000000; // @[Decode.scala 14:121]
  assign subDecUnit2_io_cs_sub_imm_sel = 3'h0; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_wakeup_delay = {hi_47,lo_41}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_bypassable = _bit_T_15370 | _bit_T_1910 | _bit_T_1944 | _bit_T_1946 | _bit_T_1948 |
    _bit_T_1950 | _bit_T_1952 | _bit_T_1954 | _bit_T_1956 | _bit_T_1958 | _bit_T_1976 | _bit_T_1978 | _bit_T_1980 |
    _bit_T_1982 | _bit_T_1984 | _bit_T_1986 | _bit_T_1988 | _bit_T_1990; // @[Decode.scala 15:30]
  assign subDecUnit2_io_cs_sub_mem_cmd = {3'h0,lo_33}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_mem_size = {hi_49,lo_47}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_shift = 3'h0; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_split_num = {{4'd0}, _T_1211}; // @[decode.scala 645:21 subInstDecode.scala 86:44]
  assign subDecUnit2_io_cs_sub_op1_sel = {2'h0,lo_48}; // @[Cat.scala 30:58]
  assign subDecUnit2_io_cs_sub_op2_sel = {hi_52,lo_49}; // @[Cat.scala 30:58]
  assign subDecUnit3_clock = clock;
  assign subDecUnit3_reset = reset;
  assign subDecUnit3_io_rawuop_switch = _T_1289 & (_T_1294 & io_enq_uop_inst[24:20] == 5'h1); // @[decode.scala 687:38]
  assign subDecUnit3_io_rawuop_switch_off = cs__uopc == 7'hf & (io_enq_uop_inst[11:7] == 5'h0 & io_enq_uop_inst[19:15]
     == 5'h0 & io_enq_uop_inst[24:20] == 5'h2); // @[decode.scala 688:42]
  assign subDecUnit3_io_rawuop_is_unicore = unicoreMode | uop_is_unicore; // @[decode.scala 802:20 decode.scala 809:22 decode.scala 760:8]
  assign subDecUnit3_io_rawuop_shift = 3'h0; // @[decode.scala 600:17 decode.scala 704:23]
  assign subDecUnit3_io_rawuop_lrs3_rtype = 2'h2; // @[decode.scala 600:17 decode.scala 699:23]
  assign subDecUnit3_io_rawuop_rflag = 1'h0; // @[decode.scala 600:17 decode.scala 706:23]
  assign subDecUnit3_io_rawuop_wflag = 1'h0; // @[decode.scala 600:17 decode.scala 705:23]
  assign subDecUnit3_io_rawuop_prflag = io_enq_uop_prflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_pwflag = io_enq_uop_pwflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_pflag_busy = io_enq_uop_pflag_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_stale_pflag = io_enq_uop_stale_pflag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_op1_sel = io_enq_uop_op1_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_op2_sel = io_enq_uop_op2_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_split_num = unicoreMode ? {{1'd0}, split_num} : uop_split_num; // @[decode.scala 802:20 decode.scala 804:20 decode.scala 760:8]
  assign subDecUnit3_io_rawuop_self_index = unicoreMode ? 6'h3 : 6'h0; // @[decode.scala 802:20 decode.scala 816:21 decode.scala 762:8]
  assign subDecUnit3_io_rawuop_rob_inst_idx = io_enq_uop_rob_inst_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_address_num = io_enq_uop_address_num; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_uopc = {hi,lo}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_rawuop_inst = io_enq_uop_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_debug_inst = io_enq_uop_debug_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_is_rvc = unicoreMode ? 1'h0 : io_enq_uop_is_rvc; // @[decode.scala 711:22 decode.scala 712:16 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_debug_pc = io_enq_uop_debug_pc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_iq_type = {hi_1,lo_1}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_rawuop_fu_code = {hi_2,lo_2}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_rawuop_ctrl_br_type = io_enq_uop_ctrl_br_type; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ctrl_op1_sel = io_enq_uop_ctrl_op1_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ctrl_op2_sel = io_enq_uop_ctrl_op2_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ctrl_imm_sel = io_enq_uop_ctrl_imm_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ctrl_op_fcn = io_enq_uop_ctrl_op_fcn; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ctrl_fcn_dw = io_enq_uop_ctrl_fcn_dw; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ctrl_csr_cmd = io_enq_uop_ctrl_csr_cmd; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ctrl_is_load = io_enq_uop_ctrl_is_load; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ctrl_is_sta = io_enq_uop_ctrl_is_sta; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ctrl_is_std = io_enq_uop_ctrl_is_std; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ctrl_op3_sel = io_enq_uop_ctrl_op3_sel; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_iw_state = io_enq_uop_iw_state; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_iw_p1_poisoned = io_enq_uop_iw_p1_poisoned; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_iw_p2_poisoned = io_enq_uop_iw_p2_poisoned; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_is_br = _T_252 == 32'h60; // @[Decode.scala 14:121]
  assign subDecUnit3_io_rawuop_is_jalr = cs__uopc == 7'h26; // @[decode.scala 736:31]
  assign subDecUnit3_io_rawuop_is_jal = cs__uopc == 7'h25; // @[decode.scala 735:31]
  assign subDecUnit3_io_rawuop_is_sfb = io_enq_uop_is_sfb; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_br_mask = io_enq_uop_br_mask; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_br_tag = io_enq_uop_br_tag; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ftq_idx = io_enq_uop_ftq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_edge_inst = io_enq_uop_edge_inst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_pc_lob = io_enq_uop_pc_lob; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_taken = io_enq_uop_taken; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_imm_packed = unicoreMode ? io_enq_uop_inst[19:0] : _T_1323; // @[decode.scala 703:29]
  assign subDecUnit3_io_rawuop_csr_addr = io_enq_uop_csr_addr; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_rob_idx = io_enq_uop_rob_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ldq_idx = io_enq_uop_ldq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_stq_idx = io_enq_uop_stq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_rxq_idx = io_enq_uop_rxq_idx; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_pdst = io_enq_uop_pdst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_prs1 = io_enq_uop_prs1; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_prs2 = io_enq_uop_prs2; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_prs3 = io_enq_uop_prs3; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ppred = io_enq_uop_ppred; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_prs1_busy = io_enq_uop_prs1_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_prs2_busy = io_enq_uop_prs2_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_prs3_busy = io_enq_uop_prs3_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_ppred_busy = io_enq_uop_ppred_busy; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_stale_pdst = io_enq_uop_stale_pdst; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_exception = _T_1270 | io_enq_uop_bp_debug_if | io_enq_uop_bp_xcpt_if |
    io_enq_uop_xcpt_pf_if | io_enq_uop_xcpt_ae_if | id_illegal_insn; // @[decode.scala 671:26]
  assign subDecUnit3_io_rawuop_exc_cause = _T_1270 ? io_interrupt_cause : {{60'd0}, _T_1278}; // @[Mux.scala 47:69]
  assign subDecUnit3_io_rawuop_bypassable = _T_392 | _T_394 | _T_396; // @[Decode.scala 15:30]
  assign subDecUnit3_io_rawuop_mem_cmd = {hi_7,lo_7}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_rawuop_mem_size = _T_1341 ? _T_1342 : io_enq_uop_inst[13:12]; // @[decode.scala 739:24]
  assign subDecUnit3_io_rawuop_mem_signed = unicoreMode ? 1'h0 : ~io_enq_uop_inst[14]; // @[decode.scala 702:29]
  assign subDecUnit3_io_rawuop_is_fence = unicoreMode ? 1'h0 : cs__is_fence; // @[decode.scala 693:29]
  assign subDecUnit3_io_rawuop_is_fencei = unicoreMode ? 1'h0 : bit_4; // @[decode.scala 694:29]
  assign subDecUnit3_io_rawuop_is_amo = unicoreMode ? bit_8 : cs__is_amo; // @[decode.scala 692:29]
  assign subDecUnit3_io_rawuop_uses_ldq = _T_500 | _T_502; // @[Decode.scala 15:30]
  assign subDecUnit3_io_rawuop_uses_stq = cs__is_fence | _T_95 | _T_97 | _T_125; // @[Decode.scala 15:30]
  assign subDecUnit3_io_rawuop_is_sys_pc2epc = unicoreMode ? 1'h0 : bit_5; // @[decode.scala 695:29]
  assign subDecUnit3_io_rawuop_is_unique = uop_switch | uop_switch_off | _T_1326; // @[decode.scala 709:29]
  assign subDecUnit3_io_rawuop_flush_on_commit = unicoreMode ? bit_8 : riscv_flush_on_commit; // @[decode.scala 696:29]
  assign subDecUnit3_io_rawuop_ldst_is_rs1 = 1'h0; // @[decode.scala 742:52 decode.scala 745:21]
  assign subDecUnit3_io_rawuop_ldst = {{1'd0}, io_enq_uop_inst[11:7]}; // @[decode.scala 600:17 decode.scala 720:18]
  assign subDecUnit3_io_rawuop_lrs1 = {{1'd0}, io_enq_uop_inst[19:15]}; // @[decode.scala 600:17]
  assign subDecUnit3_io_rawuop_lrs2 = {{1'd0}, io_enq_uop_inst[24:20]}; // @[decode.scala 600:17]
  assign subDecUnit3_io_rawuop_lrs3 = {{1'd0}, _T_1313}; // @[decode.scala 600:17 decode.scala 698:23]
  assign subDecUnit3_io_rawuop_ldst_val = cs__dst_type != 2'h2 & ~(uop_ldst == 6'h0 & cs__dst_type == 2'h0); // @[decode.scala 723:42]
  assign subDecUnit3_io_rawuop_dst_rtype = {hi_3,lo_3}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_rawuop_lrs1_rtype = {hi_4,lo_4}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_rawuop_lrs2_rtype = {hi_5,lo_5}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_rawuop_frs3_en = unicoreMode ? 1'h0 : cs__frs3_en; // @[decode.scala 700:29]
  assign subDecUnit3_io_rawuop_fp_val = _bit_T_536 | _bit_T_285; // @[Decode.scala 15:30]
  assign subDecUnit3_io_rawuop_fp_single = _T_1 | _T_3; // @[Decode.scala 15:30]
  assign subDecUnit3_io_rawuop_xcpt_pf_if = io_enq_uop_xcpt_pf_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_xcpt_ae_if = io_enq_uop_xcpt_ae_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_xcpt_ma_if = io_enq_uop_xcpt_ma_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_bp_debug_if = io_enq_uop_bp_debug_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_bp_xcpt_if = io_enq_uop_bp_xcpt_if; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_debug_fsrc = io_enq_uop_debug_fsrc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_rawuop_debug_tsrc = io_enq_uop_debug_tsrc; // @[decode.scala 600:17 decode.scala 601:7]
  assign subDecUnit3_io_cs_sub_valid = _bit_T_1324 | _bit_T_1326 | _bit_T_1332 | _bit_T_1334; // @[Decode.scala 15:30]
  assign subDecUnit3_io_cs_sub_fp_val = 1'h0; // @[decode.scala 646:21 subInstDecode.scala 86:44]
  assign subDecUnit3_io_cs_sub_fp_single = 1'h0; // @[decode.scala 646:21 subInstDecode.scala 86:44]
  assign subDecUnit3_io_cs_sub_uopc = {hi_53,lo_50}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_cs_sub_iq_type = 3'h1; // @[Cat.scala 30:58]
  assign subDecUnit3_io_cs_sub_fu_code = 10'h1; // @[Cat.scala 30:58]
  assign subDecUnit3_io_cs_sub_uses_ldq = 1'h0; // @[decode.scala 646:21 subInstDecode.scala 86:44]
  assign subDecUnit3_io_cs_sub_uses_stq = 1'h0; // @[decode.scala 646:21 subInstDecode.scala 86:44]
  assign subDecUnit3_io_cs_sub_is_br = 1'h0; // @[decode.scala 646:21 subInstDecode.scala 86:44]
  assign subDecUnit3_io_cs_sub_dst_type = {hi_56,hi_hi_15}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_cs_sub_rs1_type = {hi_57,1'h0}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_cs_sub_rs2_type = {hi_57,1'h0}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_cs_sub_rtemp1 = {{4'd0}, hi_hi_15}; // @[decode.scala 646:21 subInstDecode.scala 86:44]
  assign subDecUnit3_io_cs_sub_rtemp2 = {{3'd0}, hi_56}; // @[decode.scala 646:21 subInstDecode.scala 86:44]
  assign subDecUnit3_io_cs_sub_wtemp = 5'h0; // @[decode.scala 646:21 subInstDecode.scala 86:44]
  assign subDecUnit3_io_cs_sub_wflag = _T_1138 == 32'h1000000; // @[Decode.scala 14:121]
  assign subDecUnit3_io_cs_sub_rflag = 1'h0; // @[decode.scala 646:21 subInstDecode.scala 86:44]
  assign subDecUnit3_io_cs_sub_imm_sel = 3'h0; // @[Cat.scala 30:58]
  assign subDecUnit3_io_cs_sub_wakeup_delay = {{1'd0}, hi_hi_15}; // @[decode.scala 646:21 subInstDecode.scala 86:44]
  assign subDecUnit3_io_cs_sub_bypassable = _bit_T_1324 | _bit_T_1326 | _bit_T_1332 | _bit_T_1334; // @[Decode.scala 15:30]
  assign subDecUnit3_io_cs_sub_mem_cmd = 5'h0; // @[Cat.scala 30:58]
  assign subDecUnit3_io_cs_sub_mem_size = 2'h3; // @[Cat.scala 30:58]
  assign subDecUnit3_io_cs_sub_shift = 3'h0; // @[Cat.scala 30:58]
  assign subDecUnit3_io_cs_sub_split_num = {{4'd0}, _T_1234}; // @[decode.scala 646:21 subInstDecode.scala 86:44]
  assign subDecUnit3_io_cs_sub_op1_sel = {2'h0,hi_57}; // @[Cat.scala 30:58]
  assign subDecUnit3_io_cs_sub_op2_sel = {2'h0,hi_56}; // @[Cat.scala 30:58]
  assign SubDecodeUnit_clock = clock;
  assign SubDecodeUnit_reset = reset;
  assign SubDecodeUnit_io_rawuop_switch = _T_1289 & (_T_1294 & io_enq_uop_inst[24:20] == 5'h1); // @[decode.scala 687:38]
  assign SubDecodeUnit_io_rawuop_switch_off = cs__uopc == 7'hf & (io_enq_uop_inst[11:7] == 5'h0 & io_enq_uop_inst[19:15]
     == 5'h0 & io_enq_uop_inst[24:20] == 5'h2); // @[decode.scala 688:42]
  assign SubDecodeUnit_io_rawuop_is_unicore = 2'h3 == cs_sub0_split_num[1:0] ? uop1_is_unicore : _GEN_388; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_shift = 3'h0; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_lrs3_rtype = 2'h2; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_rflag = 1'h0; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_wflag = 1'h0; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_prflag = io_enq_uop_prflag; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_pwflag = io_enq_uop_pwflag; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_pflag_busy = io_enq_uop_pflag_busy; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_stale_pflag = io_enq_uop_stale_pflag; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_op1_sel = io_enq_uop_op1_sel; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_op2_sel = io_enq_uop_op2_sel; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_split_num = 2'h3 == cs_sub0_split_num[1:0] ? uop1_split_num : _GEN_344; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_self_index = 2'h3 == cs_sub0_split_num[1:0] ? uop3_self_index : _GEN_340; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_rob_inst_idx = io_enq_uop_rob_inst_idx; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_address_num = io_enq_uop_address_num; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_uopc = {hi,lo}; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_rawuop_inst = 32'h10ffc13f; // @[decode.scala 795:28]
  assign SubDecodeUnit_io_rawuop_debug_inst = io_enq_uop_debug_inst; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_is_rvc = unicoreMode ? 1'h0 : io_enq_uop_is_rvc; // @[decode.scala 711:22 decode.scala 712:16 decode.scala 601:7]
  assign SubDecodeUnit_io_rawuop_debug_pc = io_enq_uop_debug_pc; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_iq_type = {hi_1,lo_1}; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_rawuop_fu_code = {hi_2,lo_2}; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_rawuop_ctrl_br_type = io_enq_uop_ctrl_br_type; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ctrl_op1_sel = io_enq_uop_ctrl_op1_sel; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ctrl_op2_sel = io_enq_uop_ctrl_op2_sel; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ctrl_imm_sel = io_enq_uop_ctrl_imm_sel; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ctrl_op_fcn = io_enq_uop_ctrl_op_fcn; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ctrl_fcn_dw = io_enq_uop_ctrl_fcn_dw; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ctrl_csr_cmd = io_enq_uop_ctrl_csr_cmd; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ctrl_is_load = io_enq_uop_ctrl_is_load; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ctrl_is_sta = io_enq_uop_ctrl_is_sta; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ctrl_is_std = io_enq_uop_ctrl_is_std; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ctrl_op3_sel = io_enq_uop_ctrl_op3_sel; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_iw_state = io_enq_uop_iw_state; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_iw_p1_poisoned = io_enq_uop_iw_p1_poisoned; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_iw_p2_poisoned = io_enq_uop_iw_p2_poisoned; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_is_br = _T_252 == 32'h60; // @[Decode.scala 14:121]
  assign SubDecodeUnit_io_rawuop_is_jalr = cs__uopc == 7'h26; // @[decode.scala 736:31]
  assign SubDecodeUnit_io_rawuop_is_jal = cs__uopc == 7'h25; // @[decode.scala 735:31]
  assign SubDecodeUnit_io_rawuop_is_sfb = io_enq_uop_is_sfb; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_br_mask = io_enq_uop_br_mask; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_br_tag = io_enq_uop_br_tag; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ftq_idx = io_enq_uop_ftq_idx; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_edge_inst = io_enq_uop_edge_inst; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_pc_lob = io_enq_uop_pc_lob; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_taken = io_enq_uop_taken; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_imm_packed = unicoreMode ? io_enq_uop_inst[19:0] : _T_1323; // @[decode.scala 703:29]
  assign SubDecodeUnit_io_rawuop_csr_addr = io_enq_uop_csr_addr; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_rob_idx = io_enq_uop_rob_idx; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ldq_idx = io_enq_uop_ldq_idx; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_stq_idx = io_enq_uop_stq_idx; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_rxq_idx = io_enq_uop_rxq_idx; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_pdst = io_enq_uop_pdst; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_prs1 = io_enq_uop_prs1; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_prs2 = io_enq_uop_prs2; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_prs3 = io_enq_uop_prs3; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ppred = io_enq_uop_ppred; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_prs1_busy = io_enq_uop_prs1_busy; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_prs2_busy = io_enq_uop_prs2_busy; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_prs3_busy = io_enq_uop_prs3_busy; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ppred_busy = io_enq_uop_ppred_busy; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_stale_pdst = io_enq_uop_stale_pdst; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_exception = _T_1270 | io_enq_uop_bp_debug_if | io_enq_uop_bp_xcpt_if |
    io_enq_uop_xcpt_pf_if | io_enq_uop_xcpt_ae_if | id_illegal_insn; // @[decode.scala 671:26]
  assign SubDecodeUnit_io_rawuop_exc_cause = _T_1270 ? io_interrupt_cause : {{60'd0}, _T_1278}; // @[Mux.scala 47:69]
  assign SubDecodeUnit_io_rawuop_bypassable = _T_392 | _T_394 | _T_396; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_rawuop_mem_cmd = {hi_7,lo_7}; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_rawuop_mem_size = _T_1341 ? _T_1342 : io_enq_uop_inst[13:12]; // @[decode.scala 739:24]
  assign SubDecodeUnit_io_rawuop_mem_signed = unicoreMode ? 1'h0 : ~io_enq_uop_inst[14]; // @[decode.scala 702:29]
  assign SubDecodeUnit_io_rawuop_is_fence = unicoreMode ? 1'h0 : cs__is_fence; // @[decode.scala 693:29]
  assign SubDecodeUnit_io_rawuop_is_fencei = unicoreMode ? 1'h0 : bit_4; // @[decode.scala 694:29]
  assign SubDecodeUnit_io_rawuop_is_amo = unicoreMode ? bit_8 : cs__is_amo; // @[decode.scala 692:29]
  assign SubDecodeUnit_io_rawuop_uses_ldq = _T_500 | _T_502; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_rawuop_uses_stq = cs__is_fence | _T_95 | _T_97 | _T_125; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_rawuop_is_sys_pc2epc = unicoreMode ? 1'h0 : bit_5; // @[decode.scala 695:29]
  assign SubDecodeUnit_io_rawuop_is_unique = uop_switch | uop_switch_off | _T_1326; // @[decode.scala 709:29]
  assign SubDecodeUnit_io_rawuop_flush_on_commit = unicoreMode ? bit_8 : riscv_flush_on_commit; // @[decode.scala 696:29]
  assign SubDecodeUnit_io_rawuop_ldst_is_rs1 = 1'h0; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_ldst = {{1'd0}, io_enq_uop_inst[11:7]}; // @[decode.scala 600:17 decode.scala 720:18]
  assign SubDecodeUnit_io_rawuop_lrs1 = {{1'd0}, io_enq_uop_inst[19:15]}; // @[decode.scala 600:17]
  assign SubDecodeUnit_io_rawuop_lrs2 = {{1'd0}, io_enq_uop_inst[24:20]}; // @[decode.scala 600:17]
  assign SubDecodeUnit_io_rawuop_lrs3 = {{1'd0}, _T_1313}; // @[decode.scala 600:17 decode.scala 698:23]
  assign SubDecodeUnit_io_rawuop_ldst_val = cs__dst_type != 2'h2 & ~(uop_ldst == 6'h0 & cs__dst_type == 2'h0); // @[decode.scala 723:42]
  assign SubDecodeUnit_io_rawuop_dst_rtype = {hi_3,lo_3}; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_rawuop_lrs1_rtype = {hi_4,lo_4}; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_rawuop_lrs2_rtype = {hi_5,lo_5}; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_rawuop_frs3_en = unicoreMode ? 1'h0 : cs__frs3_en; // @[decode.scala 700:29]
  assign SubDecodeUnit_io_rawuop_fp_val = _bit_T_536 | _bit_T_285; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_rawuop_fp_single = _T_1 | _T_3; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_rawuop_xcpt_pf_if = io_enq_uop_xcpt_pf_if; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_xcpt_ae_if = io_enq_uop_xcpt_ae_if; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_xcpt_ma_if = io_enq_uop_xcpt_ma_if; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_bp_debug_if = io_enq_uop_bp_debug_if; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_bp_xcpt_if = io_enq_uop_bp_xcpt_if; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_debug_fsrc = io_enq_uop_debug_fsrc; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_rawuop_debug_tsrc = io_enq_uop_debug_tsrc; // @[decode.scala 794:28 decode.scala 794:28]
  assign SubDecodeUnit_io_cs_sub_valid = 1'h1; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_cs_sub_fp_val = 1'h0; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_cs_sub_fp_single = 1'h0; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_cs_sub_uopc = 7'h26; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_iq_type = 3'h1; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_fu_code = 10'h2; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_uses_ldq = 1'h0; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_cs_sub_uses_stq = 1'h0; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_cs_sub_is_br = 1'h0; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_cs_sub_dst_type = 3'h0; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_rs1_type = 3'h4; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_rs2_type = 3'h0; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_rtemp1 = 5'h0; // @[decode.scala 792:31 subInstDecode.scala 86:44]
  assign SubDecodeUnit_io_cs_sub_rtemp2 = 5'h0; // @[decode.scala 792:31 subInstDecode.scala 86:44]
  assign SubDecodeUnit_io_cs_sub_wtemp = 5'h1; // @[decode.scala 792:31 subInstDecode.scala 86:44]
  assign SubDecodeUnit_io_cs_sub_wflag = 1'h0; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_cs_sub_rflag = 1'h0; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_cs_sub_imm_sel = 3'h0; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_wakeup_delay = 2'h1; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_bypassable = 1'h1; // @[Decode.scala 15:30]
  assign SubDecodeUnit_io_cs_sub_mem_cmd = 5'h4; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_mem_size = 2'h3; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_shift = 3'h0; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_split_num = 5'h1; // @[decode.scala 792:31 subInstDecode.scala 86:44]
  assign SubDecodeUnit_io_cs_sub_op1_sel = 4'h7; // @[Cat.scala 30:58]
  assign SubDecodeUnit_io_cs_sub_op2_sel = 4'h6; // @[Cat.scala 30:58]
endmodule
