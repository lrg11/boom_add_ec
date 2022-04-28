module BranchKillableQueue_4(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_uop_switch,
  input         io_enq_bits_uop_switch_off,
  input         io_enq_bits_uop_is_unicore,
  input  [2:0]  io_enq_bits_uop_shift,
  input  [1:0]  io_enq_bits_uop_lrs3_rtype,
  input         io_enq_bits_uop_rflag,
  input         io_enq_bits_uop_wflag,
  input  [3:0]  io_enq_bits_uop_prflag,
  input  [3:0]  io_enq_bits_uop_pwflag,
  input         io_enq_bits_uop_pflag_busy,
  input  [3:0]  io_enq_bits_uop_stale_pflag,
  input  [3:0]  io_enq_bits_uop_op1_sel,
  input  [3:0]  io_enq_bits_uop_op2_sel,
  input  [5:0]  io_enq_bits_uop_split_num,
  input  [5:0]  io_enq_bits_uop_self_index,
  input  [5:0]  io_enq_bits_uop_rob_inst_idx,
  input  [5:0]  io_enq_bits_uop_address_num,
  input  [6:0]  io_enq_bits_uop_uopc,
  input  [31:0] io_enq_bits_uop_inst,
  input  [31:0] io_enq_bits_uop_debug_inst,
  input         io_enq_bits_uop_is_rvc,
  input  [39:0] io_enq_bits_uop_debug_pc,
  input  [2:0]  io_enq_bits_uop_iq_type,
  input  [9:0]  io_enq_bits_uop_fu_code,
  input  [3:0]  io_enq_bits_uop_ctrl_br_type,
  input  [1:0]  io_enq_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_enq_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_enq_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_enq_bits_uop_ctrl_op_fcn,
  input         io_enq_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_enq_bits_uop_ctrl_csr_cmd,
  input         io_enq_bits_uop_ctrl_is_load,
  input         io_enq_bits_uop_ctrl_is_sta,
  input         io_enq_bits_uop_ctrl_is_std,
  input  [1:0]  io_enq_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_enq_bits_uop_iw_state,
  input         io_enq_bits_uop_iw_p1_poisoned,
  input         io_enq_bits_uop_iw_p2_poisoned,
  input         io_enq_bits_uop_is_br,
  input         io_enq_bits_uop_is_jalr,
  input         io_enq_bits_uop_is_jal,
  input         io_enq_bits_uop_is_sfb,
  input  [11:0] io_enq_bits_uop_br_mask,
  input  [3:0]  io_enq_bits_uop_br_tag,
  input  [4:0]  io_enq_bits_uop_ftq_idx,
  input         io_enq_bits_uop_edge_inst,
  input  [5:0]  io_enq_bits_uop_pc_lob,
  input         io_enq_bits_uop_taken,
  input  [19:0] io_enq_bits_uop_imm_packed,
  input  [11:0] io_enq_bits_uop_csr_addr,
  input  [5:0]  io_enq_bits_uop_rob_idx,
  input  [4:0]  io_enq_bits_uop_ldq_idx,
  input  [4:0]  io_enq_bits_uop_stq_idx,
  input  [1:0]  io_enq_bits_uop_rxq_idx,
  input  [6:0]  io_enq_bits_uop_pdst,
  input  [6:0]  io_enq_bits_uop_prs1,
  input  [6:0]  io_enq_bits_uop_prs2,
  input  [6:0]  io_enq_bits_uop_prs3,
  input  [4:0]  io_enq_bits_uop_ppred,
  input         io_enq_bits_uop_prs1_busy,
  input         io_enq_bits_uop_prs2_busy,
  input         io_enq_bits_uop_prs3_busy,
  input         io_enq_bits_uop_ppred_busy,
  input  [6:0]  io_enq_bits_uop_stale_pdst,
  input         io_enq_bits_uop_exception,
  input  [63:0] io_enq_bits_uop_exc_cause,
  input         io_enq_bits_uop_bypassable,
  input  [4:0]  io_enq_bits_uop_mem_cmd,
  input  [1:0]  io_enq_bits_uop_mem_size,
  input         io_enq_bits_uop_mem_signed,
  input         io_enq_bits_uop_is_fence,
  input         io_enq_bits_uop_is_fencei,
  input         io_enq_bits_uop_is_amo,
  input         io_enq_bits_uop_uses_ldq,
  input         io_enq_bits_uop_uses_stq,
  input         io_enq_bits_uop_is_sys_pc2epc,
  input         io_enq_bits_uop_is_unique,
  input         io_enq_bits_uop_flush_on_commit,
  input         io_enq_bits_uop_ldst_is_rs1,
  input  [5:0]  io_enq_bits_uop_ldst,
  input  [5:0]  io_enq_bits_uop_lrs1,
  input  [5:0]  io_enq_bits_uop_lrs2,
  input  [5:0]  io_enq_bits_uop_lrs3,
  input         io_enq_bits_uop_ldst_val,
  input  [1:0]  io_enq_bits_uop_dst_rtype,
  input  [1:0]  io_enq_bits_uop_lrs1_rtype,
  input  [1:0]  io_enq_bits_uop_lrs2_rtype,
  input         io_enq_bits_uop_frs3_en,
  input         io_enq_bits_uop_fp_val,
  input         io_enq_bits_uop_fp_single,
  input         io_enq_bits_uop_xcpt_pf_if,
  input         io_enq_bits_uop_xcpt_ae_if,
  input         io_enq_bits_uop_xcpt_ma_if,
  input         io_enq_bits_uop_bp_debug_if,
  input         io_enq_bits_uop_bp_xcpt_if,
  input  [1:0]  io_enq_bits_uop_debug_fsrc,
  input  [1:0]  io_enq_bits_uop_debug_tsrc,
  input  [64:0] io_enq_bits_data,
  input         io_enq_bits_predicated,
  input         io_enq_bits_fflags_valid,
  input         io_enq_bits_fflags_bits_uop_switch,
  input         io_enq_bits_fflags_bits_uop_switch_off,
  input         io_enq_bits_fflags_bits_uop_is_unicore,
  input  [2:0]  io_enq_bits_fflags_bits_uop_shift,
  input  [1:0]  io_enq_bits_fflags_bits_uop_lrs3_rtype,
  input         io_enq_bits_fflags_bits_uop_rflag,
  input         io_enq_bits_fflags_bits_uop_wflag,
  input  [3:0]  io_enq_bits_fflags_bits_uop_prflag,
  input  [3:0]  io_enq_bits_fflags_bits_uop_pwflag,
  input         io_enq_bits_fflags_bits_uop_pflag_busy,
  input  [3:0]  io_enq_bits_fflags_bits_uop_stale_pflag,
  input  [3:0]  io_enq_bits_fflags_bits_uop_op1_sel,
  input  [3:0]  io_enq_bits_fflags_bits_uop_op2_sel,
  input  [5:0]  io_enq_bits_fflags_bits_uop_split_num,
  input  [5:0]  io_enq_bits_fflags_bits_uop_self_index,
  input  [5:0]  io_enq_bits_fflags_bits_uop_rob_inst_idx,
  input  [5:0]  io_enq_bits_fflags_bits_uop_address_num,
  input  [6:0]  io_enq_bits_fflags_bits_uop_uopc,
  input  [31:0] io_enq_bits_fflags_bits_uop_inst,
  input  [31:0] io_enq_bits_fflags_bits_uop_debug_inst,
  input         io_enq_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_enq_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_enq_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_enq_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_enq_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_enq_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_enq_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_enq_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_enq_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_enq_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_enq_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_enq_bits_fflags_bits_uop_ctrl_is_load,
  input         io_enq_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_enq_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_enq_bits_fflags_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_enq_bits_fflags_bits_uop_iw_state,
  input         io_enq_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_enq_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_enq_bits_fflags_bits_uop_is_br,
  input         io_enq_bits_fflags_bits_uop_is_jalr,
  input         io_enq_bits_fflags_bits_uop_is_jal,
  input         io_enq_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_enq_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_enq_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_enq_bits_fflags_bits_uop_ftq_idx,
  input         io_enq_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_enq_bits_fflags_bits_uop_pc_lob,
  input         io_enq_bits_fflags_bits_uop_taken,
  input  [19:0] io_enq_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_enq_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_enq_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_enq_bits_fflags_bits_uop_ldq_idx,
  input  [4:0]  io_enq_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_enq_bits_fflags_bits_uop_rxq_idx,
  input  [6:0]  io_enq_bits_fflags_bits_uop_pdst,
  input  [6:0]  io_enq_bits_fflags_bits_uop_prs1,
  input  [6:0]  io_enq_bits_fflags_bits_uop_prs2,
  input  [6:0]  io_enq_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_enq_bits_fflags_bits_uop_ppred,
  input         io_enq_bits_fflags_bits_uop_prs1_busy,
  input         io_enq_bits_fflags_bits_uop_prs2_busy,
  input         io_enq_bits_fflags_bits_uop_prs3_busy,
  input         io_enq_bits_fflags_bits_uop_ppred_busy,
  input  [6:0]  io_enq_bits_fflags_bits_uop_stale_pdst,
  input         io_enq_bits_fflags_bits_uop_exception,
  input  [63:0] io_enq_bits_fflags_bits_uop_exc_cause,
  input         io_enq_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_enq_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_enq_bits_fflags_bits_uop_mem_size,
  input         io_enq_bits_fflags_bits_uop_mem_signed,
  input         io_enq_bits_fflags_bits_uop_is_fence,
  input         io_enq_bits_fflags_bits_uop_is_fencei,
  input         io_enq_bits_fflags_bits_uop_is_amo,
  input         io_enq_bits_fflags_bits_uop_uses_ldq,
  input         io_enq_bits_fflags_bits_uop_uses_stq,
  input         io_enq_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_enq_bits_fflags_bits_uop_is_unique,
  input         io_enq_bits_fflags_bits_uop_flush_on_commit,
  input         io_enq_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_enq_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_enq_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_enq_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_enq_bits_fflags_bits_uop_lrs3,
  input         io_enq_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_enq_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_enq_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_enq_bits_fflags_bits_uop_lrs2_rtype,
  input         io_enq_bits_fflags_bits_uop_frs3_en,
  input         io_enq_bits_fflags_bits_uop_fp_val,
  input         io_enq_bits_fflags_bits_uop_fp_single,
  input         io_enq_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_enq_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_enq_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_enq_bits_fflags_bits_uop_bp_debug_if,
  input         io_enq_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_enq_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_enq_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_enq_bits_fflags_bits_flags,
  input  [3:0]  io_enq_bits_flagdata,
  input         io_enq_bits_fflagdata_valid,
  input         io_enq_bits_fflagdata_bits_uop_switch,
  input         io_enq_bits_fflagdata_bits_uop_switch_off,
  input         io_enq_bits_fflagdata_bits_uop_is_unicore,
  input  [2:0]  io_enq_bits_fflagdata_bits_uop_shift,
  input  [1:0]  io_enq_bits_fflagdata_bits_uop_lrs3_rtype,
  input         io_enq_bits_fflagdata_bits_uop_rflag,
  input         io_enq_bits_fflagdata_bits_uop_wflag,
  input  [3:0]  io_enq_bits_fflagdata_bits_uop_prflag,
  input  [3:0]  io_enq_bits_fflagdata_bits_uop_pwflag,
  input         io_enq_bits_fflagdata_bits_uop_pflag_busy,
  input  [3:0]  io_enq_bits_fflagdata_bits_uop_stale_pflag,
  input  [3:0]  io_enq_bits_fflagdata_bits_uop_op1_sel,
  input  [3:0]  io_enq_bits_fflagdata_bits_uop_op2_sel,
  input  [5:0]  io_enq_bits_fflagdata_bits_uop_split_num,
  input  [5:0]  io_enq_bits_fflagdata_bits_uop_self_index,
  input  [5:0]  io_enq_bits_fflagdata_bits_uop_rob_inst_idx,
  input  [5:0]  io_enq_bits_fflagdata_bits_uop_address_num,
  input  [6:0]  io_enq_bits_fflagdata_bits_uop_uopc,
  input  [31:0] io_enq_bits_fflagdata_bits_uop_inst,
  input  [31:0] io_enq_bits_fflagdata_bits_uop_debug_inst,
  input         io_enq_bits_fflagdata_bits_uop_is_rvc,
  input  [39:0] io_enq_bits_fflagdata_bits_uop_debug_pc,
  input  [2:0]  io_enq_bits_fflagdata_bits_uop_iq_type,
  input  [9:0]  io_enq_bits_fflagdata_bits_uop_fu_code,
  input  [3:0]  io_enq_bits_fflagdata_bits_uop_ctrl_br_type,
  input  [1:0]  io_enq_bits_fflagdata_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_enq_bits_fflagdata_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_enq_bits_fflagdata_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_enq_bits_fflagdata_bits_uop_ctrl_op_fcn,
  input         io_enq_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_enq_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  input         io_enq_bits_fflagdata_bits_uop_ctrl_is_load,
  input         io_enq_bits_fflagdata_bits_uop_ctrl_is_sta,
  input         io_enq_bits_fflagdata_bits_uop_ctrl_is_std,
  input  [1:0]  io_enq_bits_fflagdata_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_enq_bits_fflagdata_bits_uop_iw_state,
  input         io_enq_bits_fflagdata_bits_uop_iw_p1_poisoned,
  input         io_enq_bits_fflagdata_bits_uop_iw_p2_poisoned,
  input         io_enq_bits_fflagdata_bits_uop_is_br,
  input         io_enq_bits_fflagdata_bits_uop_is_jalr,
  input         io_enq_bits_fflagdata_bits_uop_is_jal,
  input         io_enq_bits_fflagdata_bits_uop_is_sfb,
  input  [11:0] io_enq_bits_fflagdata_bits_uop_br_mask,
  input  [3:0]  io_enq_bits_fflagdata_bits_uop_br_tag,
  input  [4:0]  io_enq_bits_fflagdata_bits_uop_ftq_idx,
  input         io_enq_bits_fflagdata_bits_uop_edge_inst,
  input  [5:0]  io_enq_bits_fflagdata_bits_uop_pc_lob,
  input         io_enq_bits_fflagdata_bits_uop_taken,
  input  [19:0] io_enq_bits_fflagdata_bits_uop_imm_packed,
  input  [11:0] io_enq_bits_fflagdata_bits_uop_csr_addr,
  input  [5:0]  io_enq_bits_fflagdata_bits_uop_rob_idx,
  input  [4:0]  io_enq_bits_fflagdata_bits_uop_ldq_idx,
  input  [4:0]  io_enq_bits_fflagdata_bits_uop_stq_idx,
  input  [1:0]  io_enq_bits_fflagdata_bits_uop_rxq_idx,
  input  [6:0]  io_enq_bits_fflagdata_bits_uop_pdst,
  input  [6:0]  io_enq_bits_fflagdata_bits_uop_prs1,
  input  [6:0]  io_enq_bits_fflagdata_bits_uop_prs2,
  input  [6:0]  io_enq_bits_fflagdata_bits_uop_prs3,
  input  [4:0]  io_enq_bits_fflagdata_bits_uop_ppred,
  input         io_enq_bits_fflagdata_bits_uop_prs1_busy,
  input         io_enq_bits_fflagdata_bits_uop_prs2_busy,
  input         io_enq_bits_fflagdata_bits_uop_prs3_busy,
  input         io_enq_bits_fflagdata_bits_uop_ppred_busy,
  input  [6:0]  io_enq_bits_fflagdata_bits_uop_stale_pdst,
  input         io_enq_bits_fflagdata_bits_uop_exception,
  input  [63:0] io_enq_bits_fflagdata_bits_uop_exc_cause,
  input         io_enq_bits_fflagdata_bits_uop_bypassable,
  input  [4:0]  io_enq_bits_fflagdata_bits_uop_mem_cmd,
  input  [1:0]  io_enq_bits_fflagdata_bits_uop_mem_size,
  input         io_enq_bits_fflagdata_bits_uop_mem_signed,
  input         io_enq_bits_fflagdata_bits_uop_is_fence,
  input         io_enq_bits_fflagdata_bits_uop_is_fencei,
  input         io_enq_bits_fflagdata_bits_uop_is_amo,
  input         io_enq_bits_fflagdata_bits_uop_uses_ldq,
  input         io_enq_bits_fflagdata_bits_uop_uses_stq,
  input         io_enq_bits_fflagdata_bits_uop_is_sys_pc2epc,
  input         io_enq_bits_fflagdata_bits_uop_is_unique,
  input         io_enq_bits_fflagdata_bits_uop_flush_on_commit,
  input         io_enq_bits_fflagdata_bits_uop_ldst_is_rs1,
  input  [5:0]  io_enq_bits_fflagdata_bits_uop_ldst,
  input  [5:0]  io_enq_bits_fflagdata_bits_uop_lrs1,
  input  [5:0]  io_enq_bits_fflagdata_bits_uop_lrs2,
  input  [5:0]  io_enq_bits_fflagdata_bits_uop_lrs3,
  input         io_enq_bits_fflagdata_bits_uop_ldst_val,
  input  [1:0]  io_enq_bits_fflagdata_bits_uop_dst_rtype,
  input  [1:0]  io_enq_bits_fflagdata_bits_uop_lrs1_rtype,
  input  [1:0]  io_enq_bits_fflagdata_bits_uop_lrs2_rtype,
  input         io_enq_bits_fflagdata_bits_uop_frs3_en,
  input         io_enq_bits_fflagdata_bits_uop_fp_val,
  input         io_enq_bits_fflagdata_bits_uop_fp_single,
  input         io_enq_bits_fflagdata_bits_uop_xcpt_pf_if,
  input         io_enq_bits_fflagdata_bits_uop_xcpt_ae_if,
  input         io_enq_bits_fflagdata_bits_uop_xcpt_ma_if,
  input         io_enq_bits_fflagdata_bits_uop_bp_debug_if,
  input         io_enq_bits_fflagdata_bits_uop_bp_xcpt_if,
  input  [1:0]  io_enq_bits_fflagdata_bits_uop_debug_fsrc,
  input  [1:0]  io_enq_bits_fflagdata_bits_uop_debug_tsrc,
  input  [31:0] io_enq_bits_fflagdata_bits_fflag,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_uop_switch,
  output        io_deq_bits_uop_switch_off,
  output        io_deq_bits_uop_is_unicore,
  output [2:0]  io_deq_bits_uop_shift,
  output [1:0]  io_deq_bits_uop_lrs3_rtype,
  output        io_deq_bits_uop_rflag,
  output        io_deq_bits_uop_wflag,
  output [3:0]  io_deq_bits_uop_prflag,
  output [3:0]  io_deq_bits_uop_pwflag,
  output        io_deq_bits_uop_pflag_busy,
  output [3:0]  io_deq_bits_uop_stale_pflag,
  output [3:0]  io_deq_bits_uop_op1_sel,
  output [3:0]  io_deq_bits_uop_op2_sel,
  output [5:0]  io_deq_bits_uop_split_num,
  output [5:0]  io_deq_bits_uop_self_index,
  output [5:0]  io_deq_bits_uop_rob_inst_idx,
  output [5:0]  io_deq_bits_uop_address_num,
  output [6:0]  io_deq_bits_uop_uopc,
  output [31:0] io_deq_bits_uop_inst,
  output [31:0] io_deq_bits_uop_debug_inst,
  output        io_deq_bits_uop_is_rvc,
  output [39:0] io_deq_bits_uop_debug_pc,
  output [2:0]  io_deq_bits_uop_iq_type,
  output [9:0]  io_deq_bits_uop_fu_code,
  output [3:0]  io_deq_bits_uop_ctrl_br_type,
  output [1:0]  io_deq_bits_uop_ctrl_op1_sel,
  output [2:0]  io_deq_bits_uop_ctrl_op2_sel,
  output [2:0]  io_deq_bits_uop_ctrl_imm_sel,
  output [3:0]  io_deq_bits_uop_ctrl_op_fcn,
  output        io_deq_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_deq_bits_uop_ctrl_csr_cmd,
  output        io_deq_bits_uop_ctrl_is_load,
  output        io_deq_bits_uop_ctrl_is_sta,
  output        io_deq_bits_uop_ctrl_is_std,
  output [1:0]  io_deq_bits_uop_ctrl_op3_sel,
  output [1:0]  io_deq_bits_uop_iw_state,
  output        io_deq_bits_uop_iw_p1_poisoned,
  output        io_deq_bits_uop_iw_p2_poisoned,
  output        io_deq_bits_uop_is_br,
  output        io_deq_bits_uop_is_jalr,
  output        io_deq_bits_uop_is_jal,
  output        io_deq_bits_uop_is_sfb,
  output [11:0] io_deq_bits_uop_br_mask,
  output [3:0]  io_deq_bits_uop_br_tag,
  output [4:0]  io_deq_bits_uop_ftq_idx,
  output        io_deq_bits_uop_edge_inst,
  output [5:0]  io_deq_bits_uop_pc_lob,
  output        io_deq_bits_uop_taken,
  output [19:0] io_deq_bits_uop_imm_packed,
  output [11:0] io_deq_bits_uop_csr_addr,
  output [5:0]  io_deq_bits_uop_rob_idx,
  output [4:0]  io_deq_bits_uop_ldq_idx,
  output [4:0]  io_deq_bits_uop_stq_idx,
  output [1:0]  io_deq_bits_uop_rxq_idx,
  output [6:0]  io_deq_bits_uop_pdst,
  output [6:0]  io_deq_bits_uop_prs1,
  output [6:0]  io_deq_bits_uop_prs2,
  output [6:0]  io_deq_bits_uop_prs3,
  output [4:0]  io_deq_bits_uop_ppred,
  output        io_deq_bits_uop_prs1_busy,
  output        io_deq_bits_uop_prs2_busy,
  output        io_deq_bits_uop_prs3_busy,
  output        io_deq_bits_uop_ppred_busy,
  output [6:0]  io_deq_bits_uop_stale_pdst,
  output        io_deq_bits_uop_exception,
  output [63:0] io_deq_bits_uop_exc_cause,
  output        io_deq_bits_uop_bypassable,
  output [4:0]  io_deq_bits_uop_mem_cmd,
  output [1:0]  io_deq_bits_uop_mem_size,
  output        io_deq_bits_uop_mem_signed,
  output        io_deq_bits_uop_is_fence,
  output        io_deq_bits_uop_is_fencei,
  output        io_deq_bits_uop_is_amo,
  output        io_deq_bits_uop_uses_ldq,
  output        io_deq_bits_uop_uses_stq,
  output        io_deq_bits_uop_is_sys_pc2epc,
  output        io_deq_bits_uop_is_unique,
  output        io_deq_bits_uop_flush_on_commit,
  output        io_deq_bits_uop_ldst_is_rs1,
  output [5:0]  io_deq_bits_uop_ldst,
  output [5:0]  io_deq_bits_uop_lrs1,
  output [5:0]  io_deq_bits_uop_lrs2,
  output [5:0]  io_deq_bits_uop_lrs3,
  output        io_deq_bits_uop_ldst_val,
  output [1:0]  io_deq_bits_uop_dst_rtype,
  output [1:0]  io_deq_bits_uop_lrs1_rtype,
  output [1:0]  io_deq_bits_uop_lrs2_rtype,
  output        io_deq_bits_uop_frs3_en,
  output        io_deq_bits_uop_fp_val,
  output        io_deq_bits_uop_fp_single,
  output        io_deq_bits_uop_xcpt_pf_if,
  output        io_deq_bits_uop_xcpt_ae_if,
  output        io_deq_bits_uop_xcpt_ma_if,
  output        io_deq_bits_uop_bp_debug_if,
  output        io_deq_bits_uop_bp_xcpt_if,
  output [1:0]  io_deq_bits_uop_debug_fsrc,
  output [1:0]  io_deq_bits_uop_debug_tsrc,
  output [64:0] io_deq_bits_data,
  output        io_deq_bits_predicated,
  output        io_deq_bits_fflags_valid,
  output        io_deq_bits_fflags_bits_uop_switch,
  output        io_deq_bits_fflags_bits_uop_switch_off,
  output        io_deq_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_deq_bits_fflags_bits_uop_shift,
  output [1:0]  io_deq_bits_fflags_bits_uop_lrs3_rtype,
  output        io_deq_bits_fflags_bits_uop_rflag,
  output        io_deq_bits_fflags_bits_uop_wflag,
  output [3:0]  io_deq_bits_fflags_bits_uop_prflag,
  output [3:0]  io_deq_bits_fflags_bits_uop_pwflag,
  output        io_deq_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_deq_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_deq_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_deq_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_deq_bits_fflags_bits_uop_split_num,
  output [5:0]  io_deq_bits_fflags_bits_uop_self_index,
  output [5:0]  io_deq_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_deq_bits_fflags_bits_uop_address_num,
  output [6:0]  io_deq_bits_fflags_bits_uop_uopc,
  output [31:0] io_deq_bits_fflags_bits_uop_inst,
  output [31:0] io_deq_bits_fflags_bits_uop_debug_inst,
  output        io_deq_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_deq_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_deq_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_deq_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_deq_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_deq_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_deq_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_deq_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_deq_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_deq_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_deq_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_deq_bits_fflags_bits_uop_ctrl_is_load,
  output        io_deq_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_deq_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_deq_bits_fflags_bits_uop_ctrl_op3_sel,
  output [1:0]  io_deq_bits_fflags_bits_uop_iw_state,
  output        io_deq_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_deq_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_deq_bits_fflags_bits_uop_is_br,
  output        io_deq_bits_fflags_bits_uop_is_jalr,
  output        io_deq_bits_fflags_bits_uop_is_jal,
  output        io_deq_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_deq_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_deq_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_deq_bits_fflags_bits_uop_ftq_idx,
  output        io_deq_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_deq_bits_fflags_bits_uop_pc_lob,
  output        io_deq_bits_fflags_bits_uop_taken,
  output [19:0] io_deq_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_deq_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_deq_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_deq_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_deq_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_deq_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_deq_bits_fflags_bits_uop_pdst,
  output [6:0]  io_deq_bits_fflags_bits_uop_prs1,
  output [6:0]  io_deq_bits_fflags_bits_uop_prs2,
  output [6:0]  io_deq_bits_fflags_bits_uop_prs3,
  output [4:0]  io_deq_bits_fflags_bits_uop_ppred,
  output        io_deq_bits_fflags_bits_uop_prs1_busy,
  output        io_deq_bits_fflags_bits_uop_prs2_busy,
  output        io_deq_bits_fflags_bits_uop_prs3_busy,
  output        io_deq_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_deq_bits_fflags_bits_uop_stale_pdst,
  output        io_deq_bits_fflags_bits_uop_exception,
  output [63:0] io_deq_bits_fflags_bits_uop_exc_cause,
  output        io_deq_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_deq_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_deq_bits_fflags_bits_uop_mem_size,
  output        io_deq_bits_fflags_bits_uop_mem_signed,
  output        io_deq_bits_fflags_bits_uop_is_fence,
  output        io_deq_bits_fflags_bits_uop_is_fencei,
  output        io_deq_bits_fflags_bits_uop_is_amo,
  output        io_deq_bits_fflags_bits_uop_uses_ldq,
  output        io_deq_bits_fflags_bits_uop_uses_stq,
  output        io_deq_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_deq_bits_fflags_bits_uop_is_unique,
  output        io_deq_bits_fflags_bits_uop_flush_on_commit,
  output        io_deq_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_deq_bits_fflags_bits_uop_ldst,
  output [5:0]  io_deq_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_deq_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_deq_bits_fflags_bits_uop_lrs3,
  output        io_deq_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_deq_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_deq_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_deq_bits_fflags_bits_uop_lrs2_rtype,
  output        io_deq_bits_fflags_bits_uop_frs3_en,
  output        io_deq_bits_fflags_bits_uop_fp_val,
  output        io_deq_bits_fflags_bits_uop_fp_single,
  output        io_deq_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_deq_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_deq_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_deq_bits_fflags_bits_uop_bp_debug_if,
  output        io_deq_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_deq_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_deq_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_deq_bits_fflags_bits_flags,
  output [3:0]  io_deq_bits_flagdata,
  output        io_deq_bits_fflagdata_valid,
  output        io_deq_bits_fflagdata_bits_uop_switch,
  output        io_deq_bits_fflagdata_bits_uop_switch_off,
  output        io_deq_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_deq_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_deq_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_deq_bits_fflagdata_bits_uop_rflag,
  output        io_deq_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_deq_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_deq_bits_fflagdata_bits_uop_pwflag,
  output        io_deq_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_deq_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_deq_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_deq_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_deq_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_deq_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_deq_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_deq_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_deq_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_deq_bits_fflagdata_bits_uop_inst,
  output [31:0] io_deq_bits_fflagdata_bits_uop_debug_inst,
  output        io_deq_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_deq_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_deq_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_deq_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_deq_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_deq_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_deq_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_deq_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_deq_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_deq_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_deq_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_deq_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_deq_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_deq_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_deq_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_deq_bits_fflagdata_bits_uop_iw_state,
  output        io_deq_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_deq_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_deq_bits_fflagdata_bits_uop_is_br,
  output        io_deq_bits_fflagdata_bits_uop_is_jalr,
  output        io_deq_bits_fflagdata_bits_uop_is_jal,
  output        io_deq_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_deq_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_deq_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_deq_bits_fflagdata_bits_uop_ftq_idx,
  output        io_deq_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_deq_bits_fflagdata_bits_uop_pc_lob,
  output        io_deq_bits_fflagdata_bits_uop_taken,
  output [19:0] io_deq_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_deq_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_deq_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_deq_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_deq_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_deq_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_deq_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_deq_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_deq_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_deq_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_deq_bits_fflagdata_bits_uop_ppred,
  output        io_deq_bits_fflagdata_bits_uop_prs1_busy,
  output        io_deq_bits_fflagdata_bits_uop_prs2_busy,
  output        io_deq_bits_fflagdata_bits_uop_prs3_busy,
  output        io_deq_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_deq_bits_fflagdata_bits_uop_stale_pdst,
  output        io_deq_bits_fflagdata_bits_uop_exception,
  output [63:0] io_deq_bits_fflagdata_bits_uop_exc_cause,
  output        io_deq_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_deq_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_deq_bits_fflagdata_bits_uop_mem_size,
  output        io_deq_bits_fflagdata_bits_uop_mem_signed,
  output        io_deq_bits_fflagdata_bits_uop_is_fence,
  output        io_deq_bits_fflagdata_bits_uop_is_fencei,
  output        io_deq_bits_fflagdata_bits_uop_is_amo,
  output        io_deq_bits_fflagdata_bits_uop_uses_ldq,
  output        io_deq_bits_fflagdata_bits_uop_uses_stq,
  output        io_deq_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_deq_bits_fflagdata_bits_uop_is_unique,
  output        io_deq_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_deq_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_deq_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_deq_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_deq_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_deq_bits_fflagdata_bits_uop_lrs3,
  output        io_deq_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_deq_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_deq_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_deq_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_deq_bits_fflagdata_bits_uop_frs3_en,
  output        io_deq_bits_fflagdata_bits_uop_fp_val,
  output        io_deq_bits_fflagdata_bits_uop_fp_single,
  output        io_deq_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_deq_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_deq_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_deq_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_deq_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_deq_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_deq_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_deq_bits_fflagdata_bits_fflag,
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
  input         io_flush,
  output        io_empty,
  output [2:0]  io_count
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [95:0] _RAND_1;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_47;
  reg [63:0] _RAND_49;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_135;
  reg [63:0] _RAND_137;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_247;
  reg [63:0] _RAND_249;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_265;
  reg [31:0] _RAND_267;
  reg [31:0] _RAND_269;
  reg [31:0] _RAND_271;
  reg [31:0] _RAND_273;
  reg [31:0] _RAND_275;
  reg [31:0] _RAND_277;
  reg [31:0] _RAND_279;
  reg [31:0] _RAND_281;
  reg [31:0] _RAND_283;
  reg [31:0] _RAND_285;
  reg [31:0] _RAND_287;
  reg [31:0] _RAND_289;
  reg [31:0] _RAND_291;
  reg [31:0] _RAND_293;
  reg [31:0] _RAND_295;
  reg [31:0] _RAND_297;
  reg [31:0] _RAND_299;
  reg [31:0] _RAND_301;
  reg [31:0] _RAND_303;
  reg [31:0] _RAND_305;
  reg [31:0] _RAND_307;
  reg [31:0] _RAND_309;
  reg [31:0] _RAND_311;
  reg [31:0] _RAND_313;
  reg [31:0] _RAND_315;
  reg [31:0] _RAND_317;
  reg [31:0] _RAND_319;
  reg [31:0] _RAND_321;
  reg [31:0] _RAND_323;
  reg [31:0] _RAND_325;
  reg [31:0] _RAND_327;
  reg [31:0] _RAND_329;
  reg [31:0] _RAND_331;
  reg [31:0] _RAND_333;
  reg [31:0] _RAND_335;
  reg [63:0] _RAND_337;
  reg [31:0] _RAND_339;
  reg [31:0] _RAND_341;
  reg [31:0] _RAND_343;
  reg [31:0] _RAND_345;
  reg [31:0] _RAND_347;
  reg [31:0] _RAND_349;
  reg [31:0] _RAND_351;
  reg [31:0] _RAND_353;
  reg [31:0] _RAND_355;
  reg [31:0] _RAND_357;
  reg [31:0] _RAND_359;
  reg [31:0] _RAND_361;
  reg [31:0] _RAND_363;
  reg [31:0] _RAND_365;
  reg [31:0] _RAND_367;
  reg [31:0] _RAND_369;
  reg [31:0] _RAND_371;
  reg [31:0] _RAND_373;
  reg [31:0] _RAND_375;
  reg [31:0] _RAND_377;
  reg [31:0] _RAND_379;
  reg [31:0] _RAND_381;
  reg [31:0] _RAND_383;
  reg [31:0] _RAND_385;
  reg [31:0] _RAND_387;
  reg [31:0] _RAND_389;
  reg [31:0] _RAND_391;
  reg [31:0] _RAND_393;
  reg [31:0] _RAND_395;
  reg [31:0] _RAND_397;
  reg [31:0] _RAND_399;
  reg [31:0] _RAND_401;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [95:0] _RAND_0;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_46;
  reg [63:0] _RAND_48;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_134;
  reg [63:0] _RAND_136;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_246;
  reg [63:0] _RAND_248;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_264;
  reg [31:0] _RAND_266;
  reg [31:0] _RAND_268;
  reg [31:0] _RAND_270;
  reg [31:0] _RAND_272;
  reg [31:0] _RAND_274;
  reg [31:0] _RAND_276;
  reg [31:0] _RAND_278;
  reg [31:0] _RAND_280;
  reg [31:0] _RAND_282;
  reg [31:0] _RAND_284;
  reg [31:0] _RAND_286;
  reg [31:0] _RAND_288;
  reg [31:0] _RAND_290;
  reg [31:0] _RAND_292;
  reg [31:0] _RAND_294;
  reg [31:0] _RAND_296;
  reg [31:0] _RAND_298;
  reg [31:0] _RAND_300;
  reg [31:0] _RAND_302;
  reg [31:0] _RAND_304;
  reg [31:0] _RAND_306;
  reg [31:0] _RAND_308;
  reg [31:0] _RAND_310;
  reg [31:0] _RAND_312;
  reg [31:0] _RAND_314;
  reg [31:0] _RAND_316;
  reg [31:0] _RAND_318;
  reg [31:0] _RAND_320;
  reg [31:0] _RAND_322;
  reg [31:0] _RAND_324;
  reg [31:0] _RAND_326;
  reg [31:0] _RAND_328;
  reg [31:0] _RAND_330;
  reg [31:0] _RAND_332;
  reg [31:0] _RAND_334;
  reg [63:0] _RAND_336;
  reg [31:0] _RAND_338;
  reg [31:0] _RAND_340;
  reg [31:0] _RAND_342;
  reg [31:0] _RAND_344;
  reg [31:0] _RAND_346;
  reg [31:0] _RAND_348;
  reg [31:0] _RAND_350;
  reg [31:0] _RAND_352;
  reg [31:0] _RAND_354;
  reg [31:0] _RAND_356;
  reg [31:0] _RAND_358;
  reg [31:0] _RAND_360;
  reg [31:0] _RAND_362;
  reg [31:0] _RAND_364;
  reg [31:0] _RAND_366;
  reg [31:0] _RAND_368;
  reg [31:0] _RAND_370;
  reg [31:0] _RAND_372;
  reg [31:0] _RAND_374;
  reg [31:0] _RAND_376;
  reg [31:0] _RAND_378;
  reg [31:0] _RAND_380;
  reg [31:0] _RAND_382;
  reg [31:0] _RAND_384;
  reg [31:0] _RAND_386;
  reg [31:0] _RAND_388;
  reg [31:0] _RAND_390;
  reg [31:0] _RAND_392;
  reg [31:0] _RAND_394;
  reg [31:0] _RAND_396;
  reg [31:0] _RAND_398;
  reg [31:0] _RAND_400;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_402;
  reg [31:0] _RAND_403;
  reg [31:0] _RAND_404;
  reg [31:0] _RAND_405;
  reg [31:0] _RAND_406;
  reg [31:0] _RAND_407;
  reg [31:0] _RAND_408;
  reg [31:0] _RAND_409;
  reg [31:0] _RAND_410;
  reg [31:0] _RAND_411;
  reg [31:0] _RAND_412;
  reg [31:0] _RAND_413;
  reg [31:0] _RAND_414;
  reg [31:0] _RAND_415;
  reg [31:0] _RAND_416;
  reg [31:0] _RAND_417;
  reg [31:0] _RAND_418;
  reg [31:0] _RAND_419;
  reg [31:0] _RAND_420;
  reg [31:0] _RAND_421;
  reg [31:0] _RAND_422;
  reg [31:0] _RAND_423;
  reg [31:0] _RAND_424;
  reg [31:0] _RAND_425;
  reg [31:0] _RAND_426;
  reg [31:0] _RAND_427;
  reg [31:0] _RAND_428;
  reg [31:0] _RAND_429;
  reg [63:0] _RAND_430;
  reg [31:0] _RAND_431;
  reg [31:0] _RAND_432;
  reg [31:0] _RAND_433;
  reg [31:0] _RAND_434;
  reg [31:0] _RAND_435;
  reg [31:0] _RAND_436;
  reg [31:0] _RAND_437;
  reg [31:0] _RAND_438;
  reg [31:0] _RAND_439;
  reg [31:0] _RAND_440;
  reg [31:0] _RAND_441;
  reg [31:0] _RAND_442;
  reg [31:0] _RAND_443;
  reg [31:0] _RAND_444;
  reg [31:0] _RAND_445;
  reg [31:0] _RAND_446;
  reg [31:0] _RAND_447;
  reg [31:0] _RAND_448;
  reg [31:0] _RAND_449;
  reg [31:0] _RAND_450;
  reg [31:0] _RAND_451;
  reg [31:0] _RAND_452;
  reg [31:0] _RAND_453;
  reg [31:0] _RAND_454;
  reg [31:0] _RAND_455;
  reg [31:0] _RAND_456;
  reg [31:0] _RAND_457;
  reg [31:0] _RAND_458;
  reg [31:0] _RAND_459;
  reg [31:0] _RAND_460;
  reg [31:0] _RAND_461;
  reg [31:0] _RAND_462;
  reg [31:0] _RAND_463;
  reg [31:0] _RAND_464;
  reg [31:0] _RAND_465;
  reg [31:0] _RAND_466;
  reg [31:0] _RAND_467;
  reg [31:0] _RAND_468;
  reg [31:0] _RAND_469;
  reg [31:0] _RAND_470;
  reg [31:0] _RAND_471;
  reg [31:0] _RAND_472;
  reg [31:0] _RAND_473;
  reg [63:0] _RAND_474;
  reg [31:0] _RAND_475;
  reg [31:0] _RAND_476;
  reg [31:0] _RAND_477;
  reg [31:0] _RAND_478;
  reg [31:0] _RAND_479;
  reg [31:0] _RAND_480;
  reg [31:0] _RAND_481;
  reg [31:0] _RAND_482;
  reg [31:0] _RAND_483;
  reg [31:0] _RAND_484;
  reg [31:0] _RAND_485;
  reg [31:0] _RAND_486;
  reg [31:0] _RAND_487;
  reg [31:0] _RAND_488;
  reg [31:0] _RAND_489;
  reg [31:0] _RAND_490;
  reg [31:0] _RAND_491;
  reg [31:0] _RAND_492;
  reg [31:0] _RAND_493;
  reg [31:0] _RAND_494;
  reg [31:0] _RAND_495;
  reg [31:0] _RAND_496;
  reg [31:0] _RAND_497;
  reg [31:0] _RAND_498;
  reg [31:0] _RAND_499;
  reg [31:0] _RAND_500;
  reg [31:0] _RAND_501;
  reg [31:0] _RAND_502;
  reg [31:0] _RAND_503;
  reg [31:0] _RAND_504;
  reg [31:0] _RAND_505;
  reg [31:0] _RAND_506;
  reg [31:0] _RAND_507;
  reg [31:0] _RAND_508;
  reg [31:0] _RAND_509;
  reg [31:0] _RAND_510;
  reg [31:0] _RAND_511;
  reg [31:0] _RAND_512;
  reg [31:0] _RAND_513;
  reg [31:0] _RAND_514;
  reg [31:0] _RAND_515;
  reg [31:0] _RAND_516;
  reg [31:0] _RAND_517;
  reg [31:0] _RAND_518;
  reg [31:0] _RAND_519;
  reg [31:0] _RAND_520;
  reg [31:0] _RAND_521;
  reg [31:0] _RAND_522;
  reg [31:0] _RAND_523;
  reg [31:0] _RAND_524;
  reg [31:0] _RAND_525;
  reg [31:0] _RAND_526;
  reg [63:0] _RAND_527;
  reg [31:0] _RAND_528;
  reg [31:0] _RAND_529;
  reg [31:0] _RAND_530;
  reg [31:0] _RAND_531;
  reg [31:0] _RAND_532;
  reg [31:0] _RAND_533;
  reg [31:0] _RAND_534;
  reg [31:0] _RAND_535;
  reg [31:0] _RAND_536;
  reg [31:0] _RAND_537;
  reg [31:0] _RAND_538;
  reg [31:0] _RAND_539;
  reg [31:0] _RAND_540;
  reg [31:0] _RAND_541;
  reg [31:0] _RAND_542;
  reg [31:0] _RAND_543;
  reg [31:0] _RAND_544;
  reg [31:0] _RAND_545;
  reg [31:0] _RAND_546;
  reg [31:0] _RAND_547;
  reg [31:0] _RAND_548;
  reg [31:0] _RAND_549;
  reg [31:0] _RAND_550;
  reg [31:0] _RAND_551;
  reg [31:0] _RAND_552;
  reg [31:0] _RAND_553;
  reg [31:0] _RAND_554;
  reg [31:0] _RAND_555;
  reg [31:0] _RAND_556;
  reg [31:0] _RAND_557;
  reg [31:0] _RAND_558;
  reg [31:0] _RAND_559;
  reg [31:0] _RAND_560;
  reg [31:0] _RAND_561;
  reg [31:0] _RAND_562;
  reg [31:0] _RAND_563;
  reg [31:0] _RAND_564;
  reg [31:0] _RAND_565;
  reg [31:0] _RAND_566;
  reg [31:0] _RAND_567;
  reg [31:0] _RAND_568;
  reg [31:0] _RAND_569;
  reg [31:0] _RAND_570;
  reg [63:0] _RAND_571;
  reg [31:0] _RAND_572;
  reg [31:0] _RAND_573;
  reg [31:0] _RAND_574;
  reg [31:0] _RAND_575;
  reg [31:0] _RAND_576;
  reg [31:0] _RAND_577;
  reg [31:0] _RAND_578;
  reg [31:0] _RAND_579;
  reg [31:0] _RAND_580;
  reg [31:0] _RAND_581;
  reg [31:0] _RAND_582;
  reg [31:0] _RAND_583;
  reg [31:0] _RAND_584;
  reg [31:0] _RAND_585;
  reg [31:0] _RAND_586;
  reg [31:0] _RAND_587;
  reg [31:0] _RAND_588;
  reg [31:0] _RAND_589;
  reg [31:0] _RAND_590;
  reg [31:0] _RAND_591;
  reg [31:0] _RAND_592;
  reg [31:0] _RAND_593;
  reg [31:0] _RAND_594;
  reg [31:0] _RAND_595;
  reg [31:0] _RAND_596;
  reg [31:0] _RAND_597;
  reg [31:0] _RAND_598;
  reg [31:0] _RAND_599;
  reg [31:0] _RAND_600;
  reg [31:0] _RAND_601;
  reg [31:0] _RAND_602;
  reg [31:0] _RAND_603;
  reg [31:0] _RAND_604;
  reg [31:0] _RAND_605;
  reg [31:0] _RAND_606;
  reg [31:0] _RAND_607;
  reg [31:0] _RAND_608;
  reg [31:0] _RAND_609;
  reg [31:0] _RAND_610;
  reg [31:0] _RAND_611;
  reg [31:0] _RAND_612;
  reg [31:0] _RAND_613;
  reg [31:0] _RAND_614;
  reg [31:0] _RAND_615;
  reg [31:0] _RAND_616;
  reg [31:0] _RAND_617;
  reg [31:0] _RAND_618;
  reg [31:0] _RAND_619;
  reg [31:0] _RAND_620;
  reg [31:0] _RAND_621;
  reg [31:0] _RAND_622;
  reg [31:0] _RAND_623;
  reg [63:0] _RAND_624;
  reg [31:0] _RAND_625;
  reg [31:0] _RAND_626;
  reg [31:0] _RAND_627;
  reg [31:0] _RAND_628;
  reg [31:0] _RAND_629;
  reg [31:0] _RAND_630;
  reg [31:0] _RAND_631;
  reg [31:0] _RAND_632;
  reg [31:0] _RAND_633;
  reg [31:0] _RAND_634;
  reg [31:0] _RAND_635;
  reg [31:0] _RAND_636;
  reg [31:0] _RAND_637;
  reg [31:0] _RAND_638;
  reg [31:0] _RAND_639;
  reg [31:0] _RAND_640;
  reg [31:0] _RAND_641;
  reg [31:0] _RAND_642;
  reg [31:0] _RAND_643;
  reg [31:0] _RAND_644;
  reg [31:0] _RAND_645;
  reg [31:0] _RAND_646;
  reg [31:0] _RAND_647;
  reg [31:0] _RAND_648;
  reg [31:0] _RAND_649;
  reg [31:0] _RAND_650;
  reg [31:0] _RAND_651;
  reg [31:0] _RAND_652;
  reg [31:0] _RAND_653;
  reg [31:0] _RAND_654;
  reg [31:0] _RAND_655;
  reg [31:0] _RAND_656;
  reg [31:0] _RAND_657;
  reg [31:0] _RAND_658;
  reg [31:0] _RAND_659;
  reg [31:0] _RAND_660;
  reg [31:0] _RAND_661;
  reg [31:0] _RAND_662;
  reg [31:0] _RAND_663;
  reg [31:0] _RAND_664;
  reg [31:0] _RAND_665;
  reg [31:0] _RAND_666;
  reg [31:0] _RAND_667;
  reg [63:0] _RAND_668;
  reg [31:0] _RAND_669;
  reg [31:0] _RAND_670;
  reg [31:0] _RAND_671;
  reg [31:0] _RAND_672;
  reg [31:0] _RAND_673;
  reg [31:0] _RAND_674;
  reg [31:0] _RAND_675;
  reg [31:0] _RAND_676;
  reg [31:0] _RAND_677;
  reg [31:0] _RAND_678;
  reg [31:0] _RAND_679;
  reg [31:0] _RAND_680;
  reg [31:0] _RAND_681;
  reg [31:0] _RAND_682;
  reg [31:0] _RAND_683;
  reg [31:0] _RAND_684;
  reg [31:0] _RAND_685;
  reg [31:0] _RAND_686;
  reg [31:0] _RAND_687;
  reg [31:0] _RAND_688;
  reg [31:0] _RAND_689;
  reg [31:0] _RAND_690;
  reg [31:0] _RAND_691;
  reg [31:0] _RAND_692;
  reg [31:0] _RAND_693;
  reg [31:0] _RAND_694;
  reg [31:0] _RAND_695;
  reg [31:0] _RAND_696;
  reg [31:0] _RAND_697;
  reg [31:0] _RAND_698;
  reg [31:0] _RAND_699;
  reg [31:0] _RAND_700;
  reg [31:0] _RAND_701;
  reg [31:0] _RAND_702;
  reg [31:0] _RAND_703;
  reg [31:0] _RAND_704;
  reg [31:0] _RAND_705;
  reg [31:0] _RAND_706;
  reg [31:0] _RAND_707;
  reg [31:0] _RAND_708;
  reg [31:0] _RAND_709;
  reg [31:0] _RAND_710;
  reg [31:0] _RAND_711;
  reg [31:0] _RAND_712;
  reg [31:0] _RAND_713;
  reg [31:0] _RAND_714;
  reg [31:0] _RAND_715;
  reg [31:0] _RAND_716;
  reg [31:0] _RAND_717;
  reg [31:0] _RAND_718;
  reg [31:0] _RAND_719;
  reg [31:0] _RAND_720;
  reg [63:0] _RAND_721;
  reg [31:0] _RAND_722;
  reg [31:0] _RAND_723;
  reg [31:0] _RAND_724;
  reg [31:0] _RAND_725;
  reg [31:0] _RAND_726;
  reg [31:0] _RAND_727;
  reg [31:0] _RAND_728;
  reg [31:0] _RAND_729;
  reg [31:0] _RAND_730;
  reg [31:0] _RAND_731;
  reg [31:0] _RAND_732;
  reg [31:0] _RAND_733;
  reg [31:0] _RAND_734;
  reg [31:0] _RAND_735;
  reg [31:0] _RAND_736;
  reg [31:0] _RAND_737;
  reg [31:0] _RAND_738;
  reg [31:0] _RAND_739;
  reg [31:0] _RAND_740;
  reg [31:0] _RAND_741;
  reg [31:0] _RAND_742;
  reg [31:0] _RAND_743;
  reg [31:0] _RAND_744;
  reg [31:0] _RAND_745;
  reg [31:0] _RAND_746;
  reg [31:0] _RAND_747;
  reg [31:0] _RAND_748;
  reg [31:0] _RAND_749;
  reg [31:0] _RAND_750;
  reg [31:0] _RAND_751;
  reg [31:0] _RAND_752;
  reg [31:0] _RAND_753;
  reg [31:0] _RAND_754;
  reg [31:0] _RAND_755;
  reg [31:0] _RAND_756;
  reg [31:0] _RAND_757;
  reg [31:0] _RAND_758;
  reg [31:0] _RAND_759;
  reg [31:0] _RAND_760;
  reg [31:0] _RAND_761;
  reg [31:0] _RAND_762;
  reg [31:0] _RAND_763;
  reg [31:0] _RAND_764;
  reg [63:0] _RAND_765;
  reg [31:0] _RAND_766;
  reg [31:0] _RAND_767;
  reg [31:0] _RAND_768;
  reg [31:0] _RAND_769;
  reg [31:0] _RAND_770;
  reg [31:0] _RAND_771;
  reg [31:0] _RAND_772;
  reg [31:0] _RAND_773;
  reg [31:0] _RAND_774;
  reg [31:0] _RAND_775;
  reg [31:0] _RAND_776;
  reg [31:0] _RAND_777;
  reg [31:0] _RAND_778;
  reg [31:0] _RAND_779;
  reg [31:0] _RAND_780;
  reg [31:0] _RAND_781;
  reg [31:0] _RAND_782;
  reg [31:0] _RAND_783;
  reg [31:0] _RAND_784;
  reg [31:0] _RAND_785;
  reg [31:0] _RAND_786;
  reg [31:0] _RAND_787;
  reg [31:0] _RAND_788;
  reg [31:0] _RAND_789;
  reg [31:0] _RAND_790;
  reg [31:0] _RAND_791;
  reg [31:0] _RAND_792;
  reg [31:0] _RAND_793;
  reg [31:0] _RAND_794;
  reg [31:0] _RAND_795;
  reg [31:0] _RAND_796;
  reg [31:0] _RAND_797;
  reg [31:0] _RAND_798;
  reg [31:0] _RAND_799;
  reg [31:0] _RAND_800;
  reg [31:0] _RAND_801;
  reg [31:0] _RAND_802;
  reg [31:0] _RAND_803;
  reg [31:0] _RAND_804;
  reg [31:0] _RAND_805;
  reg [31:0] _RAND_806;
  reg [31:0] _RAND_807;
  reg [31:0] _RAND_808;
  reg [31:0] _RAND_809;
  reg [31:0] _RAND_810;
  reg [31:0] _RAND_811;
  reg [31:0] _RAND_812;
  reg [31:0] _RAND_813;
  reg [31:0] _RAND_814;
  reg [31:0] _RAND_815;
  reg [31:0] _RAND_816;
  reg [31:0] _RAND_817;
  reg [63:0] _RAND_818;
  reg [31:0] _RAND_819;
  reg [31:0] _RAND_820;
  reg [31:0] _RAND_821;
  reg [31:0] _RAND_822;
  reg [31:0] _RAND_823;
  reg [31:0] _RAND_824;
  reg [31:0] _RAND_825;
  reg [31:0] _RAND_826;
  reg [31:0] _RAND_827;
  reg [31:0] _RAND_828;
  reg [31:0] _RAND_829;
  reg [31:0] _RAND_830;
  reg [31:0] _RAND_831;
  reg [31:0] _RAND_832;
  reg [31:0] _RAND_833;
  reg [31:0] _RAND_834;
  reg [31:0] _RAND_835;
  reg [31:0] _RAND_836;
  reg [31:0] _RAND_837;
  reg [31:0] _RAND_838;
  reg [31:0] _RAND_839;
  reg [31:0] _RAND_840;
  reg [31:0] _RAND_841;
  reg [31:0] _RAND_842;
  reg [31:0] _RAND_843;
  reg [31:0] _RAND_844;
  reg [31:0] _RAND_845;
  reg [31:0] _RAND_846;
  reg [31:0] _RAND_847;
  reg [31:0] _RAND_848;
  reg [31:0] _RAND_849;
  reg [31:0] _RAND_850;
  reg [31:0] _RAND_851;
  reg [31:0] _RAND_852;
  reg [31:0] _RAND_853;
  reg [31:0] _RAND_854;
  reg [31:0] _RAND_855;
  reg [31:0] _RAND_856;
  reg [31:0] _RAND_857;
  reg [31:0] _RAND_858;
  reg [31:0] _RAND_859;
  reg [31:0] _RAND_860;
  reg [31:0] _RAND_861;
  reg [63:0] _RAND_862;
  reg [31:0] _RAND_863;
  reg [31:0] _RAND_864;
  reg [31:0] _RAND_865;
  reg [31:0] _RAND_866;
  reg [31:0] _RAND_867;
  reg [31:0] _RAND_868;
  reg [31:0] _RAND_869;
  reg [31:0] _RAND_870;
  reg [31:0] _RAND_871;
  reg [31:0] _RAND_872;
  reg [31:0] _RAND_873;
  reg [31:0] _RAND_874;
  reg [31:0] _RAND_875;
  reg [31:0] _RAND_876;
  reg [31:0] _RAND_877;
  reg [31:0] _RAND_878;
  reg [31:0] _RAND_879;
  reg [31:0] _RAND_880;
  reg [31:0] _RAND_881;
  reg [31:0] _RAND_882;
  reg [31:0] _RAND_883;
  reg [31:0] _RAND_884;
  reg [31:0] _RAND_885;
  reg [31:0] _RAND_886;
  reg [31:0] _RAND_887;
  reg [31:0] _RAND_888;
  reg [31:0] _RAND_889;
  reg [31:0] _RAND_890;
  reg [31:0] _RAND_891;
  reg [31:0] _RAND_892;
  reg [31:0] _RAND_893;
  reg [31:0] _RAND_894;
  reg [31:0] _RAND_895;
  reg [31:0] _RAND_896;
  reg [31:0] _RAND_897;
  reg [31:0] _RAND_898;
  reg [31:0] _RAND_899;
  reg [31:0] _RAND_900;
  reg [31:0] _RAND_901;
  reg [31:0] _RAND_902;
  reg [31:0] _RAND_903;
  reg [31:0] _RAND_904;
  reg [31:0] _RAND_905;
  reg [31:0] _RAND_906;
  reg [31:0] _RAND_907;
  reg [31:0] _RAND_908;
  reg [31:0] _RAND_909;
  reg [31:0] _RAND_910;
  reg [31:0] _RAND_911;
  reg [31:0] _RAND_912;
  reg [31:0] _RAND_913;
  reg [31:0] _RAND_914;
  reg [63:0] _RAND_915;
  reg [31:0] _RAND_916;
  reg [31:0] _RAND_917;
  reg [31:0] _RAND_918;
  reg [31:0] _RAND_919;
  reg [31:0] _RAND_920;
  reg [31:0] _RAND_921;
  reg [31:0] _RAND_922;
  reg [31:0] _RAND_923;
  reg [31:0] _RAND_924;
  reg [31:0] _RAND_925;
  reg [31:0] _RAND_926;
  reg [31:0] _RAND_927;
  reg [31:0] _RAND_928;
  reg [31:0] _RAND_929;
  reg [31:0] _RAND_930;
  reg [31:0] _RAND_931;
  reg [31:0] _RAND_932;
  reg [31:0] _RAND_933;
  reg [31:0] _RAND_934;
  reg [31:0] _RAND_935;
  reg [31:0] _RAND_936;
  reg [31:0] _RAND_937;
  reg [31:0] _RAND_938;
  reg [31:0] _RAND_939;
  reg [31:0] _RAND_940;
  reg [31:0] _RAND_941;
  reg [31:0] _RAND_942;
  reg [31:0] _RAND_943;
  reg [31:0] _RAND_944;
  reg [31:0] _RAND_945;
  reg [31:0] _RAND_946;
  reg [31:0] _RAND_947;
  reg [31:0] _RAND_948;
  reg [31:0] _RAND_949;
  reg [31:0] _RAND_950;
  reg [31:0] _RAND_951;
  reg [31:0] _RAND_952;
  reg [31:0] _RAND_953;
  reg [31:0] _RAND_954;
  reg [31:0] _RAND_955;
  reg [31:0] _RAND_956;
  reg [31:0] _RAND_957;
  reg [31:0] _RAND_958;
  reg [63:0] _RAND_959;
  reg [31:0] _RAND_960;
  reg [31:0] _RAND_961;
  reg [31:0] _RAND_962;
  reg [31:0] _RAND_963;
  reg [31:0] _RAND_964;
  reg [31:0] _RAND_965;
  reg [31:0] _RAND_966;
  reg [31:0] _RAND_967;
  reg [31:0] _RAND_968;
  reg [31:0] _RAND_969;
  reg [31:0] _RAND_970;
  reg [31:0] _RAND_971;
  reg [31:0] _RAND_972;
  reg [31:0] _RAND_973;
  reg [31:0] _RAND_974;
  reg [31:0] _RAND_975;
  reg [31:0] _RAND_976;
  reg [31:0] _RAND_977;
  reg [31:0] _RAND_978;
  reg [31:0] _RAND_979;
  reg [31:0] _RAND_980;
  reg [31:0] _RAND_981;
  reg [31:0] _RAND_982;
  reg [31:0] _RAND_983;
  reg [31:0] _RAND_984;
  reg [31:0] _RAND_985;
  reg [31:0] _RAND_986;
  reg [31:0] _RAND_987;
  reg [31:0] _RAND_988;
  reg [31:0] _RAND_989;
  reg [31:0] _RAND_990;
  reg [31:0] _RAND_991;
  reg [31:0] _RAND_992;
  reg [31:0] _RAND_993;
  reg [31:0] _RAND_994;
  reg [31:0] _RAND_995;
  reg [31:0] _RAND_996;
  reg [31:0] _RAND_997;
  reg [31:0] _RAND_998;
  reg [31:0] _RAND_999;
  reg [31:0] _RAND_1000;
  reg [31:0] _RAND_1001;
  reg [31:0] _RAND_1002;
  reg [31:0] _RAND_1003;
  reg [31:0] _RAND_1004;
  reg [31:0] _RAND_1005;
  reg [31:0] _RAND_1006;
  reg [31:0] _RAND_1007;
  reg [31:0] _RAND_1008;
  reg [31:0] _RAND_1009;
  reg [31:0] _RAND_1010;
  reg [31:0] _RAND_1011;
  reg [63:0] _RAND_1012;
  reg [31:0] _RAND_1013;
  reg [31:0] _RAND_1014;
  reg [31:0] _RAND_1015;
  reg [31:0] _RAND_1016;
  reg [31:0] _RAND_1017;
  reg [31:0] _RAND_1018;
  reg [31:0] _RAND_1019;
  reg [31:0] _RAND_1020;
  reg [31:0] _RAND_1021;
  reg [31:0] _RAND_1022;
  reg [31:0] _RAND_1023;
  reg [31:0] _RAND_1024;
  reg [31:0] _RAND_1025;
  reg [31:0] _RAND_1026;
  reg [31:0] _RAND_1027;
  reg [31:0] _RAND_1028;
  reg [31:0] _RAND_1029;
  reg [31:0] _RAND_1030;
  reg [31:0] _RAND_1031;
  reg [31:0] _RAND_1032;
  reg [31:0] _RAND_1033;
  reg [31:0] _RAND_1034;
  reg [31:0] _RAND_1035;
  reg [31:0] _RAND_1036;
  reg [31:0] _RAND_1037;
  reg [31:0] _RAND_1038;
  reg [31:0] _RAND_1039;
  reg [31:0] _RAND_1040;
  reg [31:0] _RAND_1041;
  reg [31:0] _RAND_1042;
  reg [31:0] _RAND_1043;
  reg [31:0] _RAND_1044;
  reg [31:0] _RAND_1045;
  reg [31:0] _RAND_1046;
  reg [31:0] _RAND_1047;
  reg [31:0] _RAND_1048;
  reg [31:0] _RAND_1049;
  reg [31:0] _RAND_1050;
  reg [31:0] _RAND_1051;
  reg [31:0] _RAND_1052;
  reg [31:0] _RAND_1053;
  reg [31:0] _RAND_1054;
  reg [31:0] _RAND_1055;
  reg [63:0] _RAND_1056;
  reg [31:0] _RAND_1057;
  reg [31:0] _RAND_1058;
  reg [31:0] _RAND_1059;
  reg [31:0] _RAND_1060;
  reg [31:0] _RAND_1061;
  reg [31:0] _RAND_1062;
  reg [31:0] _RAND_1063;
  reg [31:0] _RAND_1064;
  reg [31:0] _RAND_1065;
  reg [31:0] _RAND_1066;
  reg [31:0] _RAND_1067;
  reg [31:0] _RAND_1068;
  reg [31:0] _RAND_1069;
  reg [31:0] _RAND_1070;
  reg [31:0] _RAND_1071;
  reg [31:0] _RAND_1072;
  reg [31:0] _RAND_1073;
  reg [31:0] _RAND_1074;
  reg [31:0] _RAND_1075;
  reg [31:0] _RAND_1076;
  reg [31:0] _RAND_1077;
  reg [31:0] _RAND_1078;
  reg [31:0] _RAND_1079;
  reg [31:0] _RAND_1080;
  reg [31:0] _RAND_1081;
  reg [31:0] _RAND_1082;
  reg [31:0] _RAND_1083;
  reg [31:0] _RAND_1084;
  reg [31:0] _RAND_1085;
  reg [31:0] _RAND_1086;
  reg [31:0] _RAND_1087;
  reg [31:0] _RAND_1088;
  reg [31:0] _RAND_1089;
  reg [31:0] _RAND_1090;
`endif // RANDOMIZE_REG_INIT
  reg [64:0] ram_data [0:6]; // @[util.scala 535:20]
  wire [64:0] ram_data_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_data_MPORT_1_addr; // @[util.scala 535:20]
  wire [64:0] ram_data_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_data_MPORT_addr; // @[util.scala 535:20]
  wire  ram_data_MPORT_mask; // @[util.scala 535:20]
  wire  ram_data_MPORT_en; // @[util.scala 535:20]
  reg  ram_predicated [0:6]; // @[util.scala 535:20]
  wire  ram_predicated_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_predicated_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_predicated_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_predicated_MPORT_addr; // @[util.scala 535:20]
  wire  ram_predicated_MPORT_mask; // @[util.scala 535:20]
  wire  ram_predicated_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_valid [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_valid_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_valid_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_valid_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_valid_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_valid_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_valid_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_switch [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_switch_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_switch_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_switch_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_switch_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_switch_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_switch_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_switch_off [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_switch_off_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_switch_off_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_switch_off_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_switch_off_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_switch_off_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_switch_off_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_is_unicore [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_unicore_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_unicore_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_unicore_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_unicore_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_unicore_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_unicore_MPORT_en; // @[util.scala 535:20]
  reg [2:0] ram_fflags_bits_uop_shift [0:6]; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_shift_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_shift_MPORT_1_addr; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_shift_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_shift_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_shift_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_shift_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflags_bits_uop_lrs3_rtype [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_lrs3_rtype_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs3_rtype_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_lrs3_rtype_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs3_rtype_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs3_rtype_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs3_rtype_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_rflag [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_rflag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_rflag_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_rflag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_rflag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_rflag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_rflag_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_wflag [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_wflag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_wflag_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_wflag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_wflag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_wflag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_wflag_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflags_bits_uop_prflag [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_prflag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prflag_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_prflag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prflag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prflag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prflag_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflags_bits_uop_pwflag [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_pwflag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_pwflag_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_pwflag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_pwflag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_pwflag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_pwflag_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_pflag_busy [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_pflag_busy_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_pflag_busy_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_pflag_busy_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_pflag_busy_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_pflag_busy_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_pflag_busy_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflags_bits_uop_stale_pflag [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_stale_pflag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_stale_pflag_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_stale_pflag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_stale_pflag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_stale_pflag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_stale_pflag_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflags_bits_uop_op1_sel [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_op1_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_op1_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_op1_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_op1_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_op1_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_op1_sel_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflags_bits_uop_op2_sel [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_op2_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_op2_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_op2_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_op2_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_op2_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_op2_sel_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflags_bits_uop_split_num [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_split_num_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_split_num_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_split_num_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_split_num_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_split_num_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_split_num_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflags_bits_uop_self_index [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_self_index_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_self_index_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_self_index_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_self_index_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_self_index_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_self_index_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflags_bits_uop_rob_inst_idx [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_rob_inst_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_rob_inst_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_rob_inst_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_rob_inst_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_rob_inst_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_rob_inst_idx_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflags_bits_uop_address_num [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_address_num_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_address_num_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_address_num_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_address_num_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_address_num_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_address_num_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflags_bits_uop_uopc [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_uopc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_uopc_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_uopc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_uopc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_uopc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_uopc_MPORT_en; // @[util.scala 535:20]
  reg [31:0] ram_fflags_bits_uop_inst [0:6]; // @[util.scala 535:20]
  wire [31:0] ram_fflags_bits_uop_inst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_inst_MPORT_1_addr; // @[util.scala 535:20]
  wire [31:0] ram_fflags_bits_uop_inst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_inst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_inst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_inst_MPORT_en; // @[util.scala 535:20]
  reg [31:0] ram_fflags_bits_uop_debug_inst [0:6]; // @[util.scala 535:20]
  wire [31:0] ram_fflags_bits_uop_debug_inst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_debug_inst_MPORT_1_addr; // @[util.scala 535:20]
  wire [31:0] ram_fflags_bits_uop_debug_inst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_debug_inst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_debug_inst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_debug_inst_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_is_rvc [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_rvc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_rvc_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_rvc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_rvc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_rvc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_rvc_MPORT_en; // @[util.scala 535:20]
  reg [39:0] ram_fflags_bits_uop_debug_pc [0:6]; // @[util.scala 535:20]
  wire [39:0] ram_fflags_bits_uop_debug_pc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_debug_pc_MPORT_1_addr; // @[util.scala 535:20]
  wire [39:0] ram_fflags_bits_uop_debug_pc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_debug_pc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_debug_pc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_debug_pc_MPORT_en; // @[util.scala 535:20]
  reg [2:0] ram_fflags_bits_uop_iq_type [0:6]; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_iq_type_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_iq_type_MPORT_1_addr; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_iq_type_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_iq_type_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iq_type_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iq_type_MPORT_en; // @[util.scala 535:20]
  reg [9:0] ram_fflags_bits_uop_fu_code [0:6]; // @[util.scala 535:20]
  wire [9:0] ram_fflags_bits_uop_fu_code_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_fu_code_MPORT_1_addr; // @[util.scala 535:20]
  wire [9:0] ram_fflags_bits_uop_fu_code_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_fu_code_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_fu_code_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_fu_code_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflags_bits_uop_ctrl_br_type [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_ctrl_br_type_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_br_type_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_ctrl_br_type_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_br_type_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_br_type_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_br_type_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflags_bits_uop_ctrl_op1_sel [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_ctrl_op1_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op1_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_op1_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_op1_sel_MPORT_en; // @[util.scala 535:20]
  reg [2:0] ram_fflags_bits_uop_ctrl_op2_sel [0:6]; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op2_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op2_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_op2_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_op2_sel_MPORT_en; // @[util.scala 535:20]
  reg [2:0] ram_fflags_bits_uop_ctrl_imm_sel [0:6]; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_imm_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_imm_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_imm_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_imm_sel_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflags_bits_uop_ctrl_op_fcn [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_ctrl_op_fcn_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op_fcn_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_op_fcn_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_op_fcn_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_ctrl_fcn_dw [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_en; // @[util.scala 535:20]
  reg [2:0] ram_fflags_bits_uop_ctrl_csr_cmd [0:6]; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_addr; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_ctrl_is_load [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_load_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_load_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_load_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_load_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_load_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_load_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_ctrl_is_sta [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_sta_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_sta_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_sta_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_sta_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_ctrl_is_std [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_std_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_std_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_std_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_std_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_std_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_is_std_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflags_bits_uop_ctrl_op3_sel [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_ctrl_op3_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op3_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_ctrl_op3_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op3_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_op3_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ctrl_op3_sel_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflags_bits_uop_iw_state [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_iw_state_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_iw_state_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_iw_state_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_iw_state_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iw_state_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iw_state_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_iw_p1_poisoned [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iw_p1_poisoned_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_iw_p1_poisoned_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iw_p1_poisoned_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iw_p1_poisoned_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_iw_p2_poisoned [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iw_p2_poisoned_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_iw_p2_poisoned_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iw_p2_poisoned_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_iw_p2_poisoned_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_is_br [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_br_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_br_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_br_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_br_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_br_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_br_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_is_jalr [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_jalr_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_jalr_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_jalr_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_jalr_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_jalr_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_jalr_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_is_jal [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_jal_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_jal_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_jal_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_jal_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_jal_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_jal_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_is_sfb [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_sfb_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_sfb_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_sfb_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_sfb_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_sfb_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_sfb_MPORT_en; // @[util.scala 535:20]
  reg [11:0] ram_fflags_bits_uop_br_mask [0:6]; // @[util.scala 535:20]
  wire [11:0] ram_fflags_bits_uop_br_mask_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_br_mask_MPORT_1_addr; // @[util.scala 535:20]
  wire [11:0] ram_fflags_bits_uop_br_mask_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_br_mask_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_br_mask_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_br_mask_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflags_bits_uop_br_tag [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_br_tag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_br_tag_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflags_bits_uop_br_tag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_br_tag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_br_tag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_br_tag_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_fflags_bits_uop_ftq_idx [0:6]; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_uop_ftq_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ftq_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_uop_ftq_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ftq_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ftq_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ftq_idx_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_edge_inst [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_edge_inst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_edge_inst_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_edge_inst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_edge_inst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_edge_inst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_edge_inst_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflags_bits_uop_pc_lob [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_pc_lob_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_pc_lob_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_pc_lob_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_pc_lob_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_pc_lob_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_pc_lob_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_taken [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_taken_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_taken_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_taken_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_taken_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_taken_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_taken_MPORT_en; // @[util.scala 535:20]
  reg [19:0] ram_fflags_bits_uop_imm_packed [0:6]; // @[util.scala 535:20]
  wire [19:0] ram_fflags_bits_uop_imm_packed_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_imm_packed_MPORT_1_addr; // @[util.scala 535:20]
  wire [19:0] ram_fflags_bits_uop_imm_packed_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_imm_packed_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_imm_packed_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_imm_packed_MPORT_en; // @[util.scala 535:20]
  reg [11:0] ram_fflags_bits_uop_csr_addr [0:6]; // @[util.scala 535:20]
  wire [11:0] ram_fflags_bits_uop_csr_addr_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_csr_addr_MPORT_1_addr; // @[util.scala 535:20]
  wire [11:0] ram_fflags_bits_uop_csr_addr_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_csr_addr_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_csr_addr_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_csr_addr_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflags_bits_uop_rob_idx [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_rob_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_rob_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_rob_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_rob_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_rob_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_rob_idx_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_fflags_bits_uop_ldq_idx [0:6]; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_uop_ldq_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ldq_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_uop_ldq_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ldq_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldq_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldq_idx_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_fflags_bits_uop_stq_idx [0:6]; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_uop_stq_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_stq_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_uop_stq_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_stq_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_stq_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_stq_idx_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflags_bits_uop_rxq_idx [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_rxq_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_rxq_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_rxq_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_rxq_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_rxq_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_rxq_idx_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflags_bits_uop_pdst [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_pdst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_pdst_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_pdst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_pdst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_pdst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_pdst_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflags_bits_uop_prs1 [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_prs1_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs1_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_prs1_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs1_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs1_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs1_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflags_bits_uop_prs2 [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_prs2_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs2_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_prs2_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs2_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs2_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs2_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflags_bits_uop_prs3 [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_prs3_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs3_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_prs3_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs3_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs3_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs3_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_fflags_bits_uop_ppred [0:6]; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_uop_ppred_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ppred_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_uop_ppred_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ppred_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ppred_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ppred_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_prs1_busy [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs1_busy_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs1_busy_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs1_busy_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs1_busy_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs1_busy_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs1_busy_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_prs2_busy [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs2_busy_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs2_busy_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs2_busy_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs2_busy_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs2_busy_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs2_busy_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_prs3_busy [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs3_busy_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs3_busy_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs3_busy_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_prs3_busy_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs3_busy_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_prs3_busy_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_ppred_busy [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ppred_busy_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ppred_busy_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ppred_busy_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ppred_busy_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ppred_busy_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ppred_busy_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflags_bits_uop_stale_pdst [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_stale_pdst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_stale_pdst_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflags_bits_uop_stale_pdst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_stale_pdst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_stale_pdst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_stale_pdst_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_exception [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_exception_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_exception_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_exception_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_exception_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_exception_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_exception_MPORT_en; // @[util.scala 535:20]
  reg [63:0] ram_fflags_bits_uop_exc_cause [0:6]; // @[util.scala 535:20]
  wire [63:0] ram_fflags_bits_uop_exc_cause_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_exc_cause_MPORT_1_addr; // @[util.scala 535:20]
  wire [63:0] ram_fflags_bits_uop_exc_cause_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_exc_cause_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_exc_cause_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_exc_cause_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_bypassable [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bypassable_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_bypassable_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bypassable_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_bypassable_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bypassable_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bypassable_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_fflags_bits_uop_mem_cmd [0:6]; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_uop_mem_cmd_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_mem_cmd_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_uop_mem_cmd_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_mem_cmd_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_mem_cmd_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_mem_cmd_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflags_bits_uop_mem_size [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_mem_size_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_mem_size_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_mem_size_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_mem_size_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_mem_size_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_mem_size_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_mem_signed [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_mem_signed_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_mem_signed_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_mem_signed_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_mem_signed_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_mem_signed_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_mem_signed_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_is_fence [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_fence_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_fence_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_fence_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_fence_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_fence_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_fence_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_is_fencei [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_fencei_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_fencei_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_fencei_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_fencei_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_fencei_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_fencei_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_is_amo [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_amo_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_amo_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_amo_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_amo_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_amo_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_amo_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_uses_ldq [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_uses_ldq_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_uses_ldq_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_uses_ldq_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_uses_ldq_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_uses_ldq_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_uses_ldq_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_uses_stq [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_uses_stq_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_uses_stq_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_uses_stq_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_uses_stq_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_uses_stq_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_uses_stq_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_is_sys_pc2epc [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_sys_pc2epc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_sys_pc2epc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_sys_pc2epc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_sys_pc2epc_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_is_unique [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_unique_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_unique_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_unique_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_is_unique_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_unique_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_is_unique_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_flush_on_commit [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_flush_on_commit_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_flush_on_commit_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_flush_on_commit_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_flush_on_commit_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_flush_on_commit_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_flush_on_commit_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_ldst_is_rs1 [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldst_is_rs1_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ldst_is_rs1_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldst_is_rs1_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldst_is_rs1_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflags_bits_uop_ldst [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_ldst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ldst_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_ldst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ldst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldst_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflags_bits_uop_lrs1 [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_lrs1_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs1_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_lrs1_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs1_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs1_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs1_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflags_bits_uop_lrs2 [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_lrs2_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs2_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_lrs2_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs2_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs2_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs2_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflags_bits_uop_lrs3 [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_lrs3_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs3_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflags_bits_uop_lrs3_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs3_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs3_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs3_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_ldst_val [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldst_val_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ldst_val_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldst_val_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_ldst_val_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldst_val_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_ldst_val_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflags_bits_uop_dst_rtype [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_dst_rtype_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_dst_rtype_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_dst_rtype_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_dst_rtype_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_dst_rtype_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_dst_rtype_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflags_bits_uop_lrs1_rtype [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_lrs1_rtype_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs1_rtype_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_lrs1_rtype_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs1_rtype_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs1_rtype_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs1_rtype_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflags_bits_uop_lrs2_rtype [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_lrs2_rtype_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs2_rtype_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_lrs2_rtype_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_lrs2_rtype_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs2_rtype_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_lrs2_rtype_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_frs3_en [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_frs3_en_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_frs3_en_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_frs3_en_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_frs3_en_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_frs3_en_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_frs3_en_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_fp_val [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_fp_val_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_fp_val_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_fp_val_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_fp_val_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_fp_val_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_fp_val_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_fp_single [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_fp_single_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_fp_single_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_fp_single_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_fp_single_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_fp_single_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_fp_single_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_xcpt_pf_if [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_pf_if_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_pf_if_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_pf_if_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_pf_if_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_xcpt_ae_if [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_ae_if_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_ae_if_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_ae_if_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_ae_if_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_xcpt_ma_if [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_ma_if_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_ma_if_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_ma_if_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_xcpt_ma_if_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_bp_debug_if [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bp_debug_if_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_bp_debug_if_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bp_debug_if_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_bp_debug_if_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bp_debug_if_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bp_debug_if_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflags_bits_uop_bp_xcpt_if [0:6]; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bp_xcpt_if_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_bp_xcpt_if_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bp_xcpt_if_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_bp_xcpt_if_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflags_bits_uop_debug_fsrc [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_debug_fsrc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_debug_fsrc_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_debug_fsrc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_debug_fsrc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_debug_fsrc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_debug_fsrc_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflags_bits_uop_debug_tsrc [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_debug_tsrc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_debug_tsrc_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflags_bits_uop_debug_tsrc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_uop_debug_tsrc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_debug_tsrc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_uop_debug_tsrc_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_fflags_bits_flags [0:6]; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_flags_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_flags_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_fflags_bits_flags_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflags_bits_flags_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflags_bits_flags_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflags_bits_flags_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_flagdata [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_flagdata_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_flagdata_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_flagdata_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_flagdata_MPORT_addr; // @[util.scala 535:20]
  wire  ram_flagdata_MPORT_mask; // @[util.scala 535:20]
  wire  ram_flagdata_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_valid [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_valid_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_valid_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_valid_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_valid_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_valid_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_valid_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_switch [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_switch_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_switch_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_switch_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_switch_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_switch_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_switch_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_switch_off [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_switch_off_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_switch_off_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_switch_off_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_switch_off_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_switch_off_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_switch_off_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_is_unicore [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_unicore_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_unicore_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_unicore_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_unicore_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_unicore_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_unicore_MPORT_en; // @[util.scala 535:20]
  reg [2:0] ram_fflagdata_bits_uop_shift [0:6]; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_shift_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_shift_MPORT_1_addr; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_shift_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_shift_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_shift_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_shift_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflagdata_bits_uop_lrs3_rtype [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_lrs3_rtype_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs3_rtype_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_lrs3_rtype_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs3_rtype_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs3_rtype_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs3_rtype_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_rflag [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_rflag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_rflag_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_rflag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_rflag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_rflag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_rflag_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_wflag [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_wflag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_wflag_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_wflag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_wflag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_wflag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_wflag_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflagdata_bits_uop_prflag [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_prflag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prflag_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_prflag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prflag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prflag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prflag_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflagdata_bits_uop_pwflag [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_pwflag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_pwflag_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_pwflag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_pwflag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_pwflag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_pwflag_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_pflag_busy [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_pflag_busy_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_pflag_busy_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_pflag_busy_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_pflag_busy_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_pflag_busy_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_pflag_busy_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflagdata_bits_uop_stale_pflag [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_stale_pflag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_stale_pflag_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_stale_pflag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_stale_pflag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_stale_pflag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_stale_pflag_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflagdata_bits_uop_op1_sel [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_op1_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_op1_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_op1_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_op1_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_op1_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_op1_sel_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflagdata_bits_uop_op2_sel [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_op2_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_op2_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_op2_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_op2_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_op2_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_op2_sel_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflagdata_bits_uop_split_num [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_split_num_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_split_num_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_split_num_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_split_num_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_split_num_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_split_num_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflagdata_bits_uop_self_index [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_self_index_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_self_index_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_self_index_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_self_index_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_self_index_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_self_index_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflagdata_bits_uop_rob_inst_idx [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_rob_inst_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_rob_inst_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_rob_inst_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_rob_inst_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_rob_inst_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_rob_inst_idx_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflagdata_bits_uop_address_num [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_address_num_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_address_num_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_address_num_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_address_num_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_address_num_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_address_num_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflagdata_bits_uop_uopc [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_uopc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_uopc_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_uopc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_uopc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_uopc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_uopc_MPORT_en; // @[util.scala 535:20]
  reg [31:0] ram_fflagdata_bits_uop_inst [0:6]; // @[util.scala 535:20]
  wire [31:0] ram_fflagdata_bits_uop_inst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_inst_MPORT_1_addr; // @[util.scala 535:20]
  wire [31:0] ram_fflagdata_bits_uop_inst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_inst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_inst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_inst_MPORT_en; // @[util.scala 535:20]
  reg [31:0] ram_fflagdata_bits_uop_debug_inst [0:6]; // @[util.scala 535:20]
  wire [31:0] ram_fflagdata_bits_uop_debug_inst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_debug_inst_MPORT_1_addr; // @[util.scala 535:20]
  wire [31:0] ram_fflagdata_bits_uop_debug_inst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_debug_inst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_debug_inst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_debug_inst_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_is_rvc [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_rvc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_rvc_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_rvc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_rvc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_rvc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_rvc_MPORT_en; // @[util.scala 535:20]
  reg [39:0] ram_fflagdata_bits_uop_debug_pc [0:6]; // @[util.scala 535:20]
  wire [39:0] ram_fflagdata_bits_uop_debug_pc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_debug_pc_MPORT_1_addr; // @[util.scala 535:20]
  wire [39:0] ram_fflagdata_bits_uop_debug_pc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_debug_pc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_debug_pc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_debug_pc_MPORT_en; // @[util.scala 535:20]
  reg [2:0] ram_fflagdata_bits_uop_iq_type [0:6]; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_iq_type_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_iq_type_MPORT_1_addr; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_iq_type_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_iq_type_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iq_type_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iq_type_MPORT_en; // @[util.scala 535:20]
  reg [9:0] ram_fflagdata_bits_uop_fu_code [0:6]; // @[util.scala 535:20]
  wire [9:0] ram_fflagdata_bits_uop_fu_code_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_fu_code_MPORT_1_addr; // @[util.scala 535:20]
  wire [9:0] ram_fflagdata_bits_uop_fu_code_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_fu_code_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_fu_code_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_fu_code_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflagdata_bits_uop_ctrl_br_type [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_ctrl_br_type_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_br_type_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_ctrl_br_type_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_br_type_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_br_type_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_br_type_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflagdata_bits_uop_ctrl_op1_sel [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_en; // @[util.scala 535:20]
  reg [2:0] ram_fflagdata_bits_uop_ctrl_op2_sel [0:6]; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_en; // @[util.scala 535:20]
  reg [2:0] ram_fflagdata_bits_uop_ctrl_imm_sel [0:6]; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflagdata_bits_uop_ctrl_op_fcn [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_ctrl_fcn_dw [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_en; // @[util.scala 535:20]
  reg [2:0] ram_fflagdata_bits_uop_ctrl_csr_cmd [0:6]; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_1_addr; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_ctrl_is_load [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_load_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_is_load_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_load_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_is_load_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_load_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_load_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_ctrl_is_sta [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_ctrl_is_std [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_std_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_is_std_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_std_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_is_std_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_std_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_is_std_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflagdata_bits_uop_ctrl_op3_sel [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflagdata_bits_uop_iw_state [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_iw_state_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_iw_state_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_iw_state_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_iw_state_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iw_state_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iw_state_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_iw_p1_poisoned [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_iw_p2_poisoned [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_is_br [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_br_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_br_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_br_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_br_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_br_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_br_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_is_jalr [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_jalr_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_jalr_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_jalr_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_jalr_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_jalr_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_jalr_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_is_jal [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_jal_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_jal_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_jal_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_jal_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_jal_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_jal_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_is_sfb [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_sfb_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_sfb_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_sfb_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_sfb_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_sfb_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_sfb_MPORT_en; // @[util.scala 535:20]
  reg [11:0] ram_fflagdata_bits_uop_br_mask [0:6]; // @[util.scala 535:20]
  wire [11:0] ram_fflagdata_bits_uop_br_mask_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_br_mask_MPORT_1_addr; // @[util.scala 535:20]
  wire [11:0] ram_fflagdata_bits_uop_br_mask_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_br_mask_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_br_mask_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_br_mask_MPORT_en; // @[util.scala 535:20]
  reg [3:0] ram_fflagdata_bits_uop_br_tag [0:6]; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_br_tag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_br_tag_MPORT_1_addr; // @[util.scala 535:20]
  wire [3:0] ram_fflagdata_bits_uop_br_tag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_br_tag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_br_tag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_br_tag_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_fflagdata_bits_uop_ftq_idx [0:6]; // @[util.scala 535:20]
  wire [4:0] ram_fflagdata_bits_uop_ftq_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ftq_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_fflagdata_bits_uop_ftq_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ftq_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ftq_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ftq_idx_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_edge_inst [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_edge_inst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_edge_inst_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_edge_inst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_edge_inst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_edge_inst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_edge_inst_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflagdata_bits_uop_pc_lob [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_pc_lob_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_pc_lob_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_pc_lob_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_pc_lob_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_pc_lob_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_pc_lob_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_taken [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_taken_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_taken_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_taken_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_taken_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_taken_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_taken_MPORT_en; // @[util.scala 535:20]
  reg [19:0] ram_fflagdata_bits_uop_imm_packed [0:6]; // @[util.scala 535:20]
  wire [19:0] ram_fflagdata_bits_uop_imm_packed_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_imm_packed_MPORT_1_addr; // @[util.scala 535:20]
  wire [19:0] ram_fflagdata_bits_uop_imm_packed_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_imm_packed_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_imm_packed_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_imm_packed_MPORT_en; // @[util.scala 535:20]
  reg [11:0] ram_fflagdata_bits_uop_csr_addr [0:6]; // @[util.scala 535:20]
  wire [11:0] ram_fflagdata_bits_uop_csr_addr_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_csr_addr_MPORT_1_addr; // @[util.scala 535:20]
  wire [11:0] ram_fflagdata_bits_uop_csr_addr_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_csr_addr_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_csr_addr_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_csr_addr_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflagdata_bits_uop_rob_idx [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_rob_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_rob_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_rob_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_rob_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_rob_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_rob_idx_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_fflagdata_bits_uop_ldq_idx [0:6]; // @[util.scala 535:20]
  wire [4:0] ram_fflagdata_bits_uop_ldq_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ldq_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_fflagdata_bits_uop_ldq_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ldq_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldq_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldq_idx_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_fflagdata_bits_uop_stq_idx [0:6]; // @[util.scala 535:20]
  wire [4:0] ram_fflagdata_bits_uop_stq_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_stq_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_fflagdata_bits_uop_stq_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_stq_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_stq_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_stq_idx_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflagdata_bits_uop_rxq_idx [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_rxq_idx_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_rxq_idx_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_rxq_idx_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_rxq_idx_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_rxq_idx_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_rxq_idx_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflagdata_bits_uop_pdst [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_pdst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_pdst_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_pdst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_pdst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_pdst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_pdst_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflagdata_bits_uop_prs1 [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_prs1_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs1_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_prs1_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs1_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs1_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs1_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflagdata_bits_uop_prs2 [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_prs2_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs2_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_prs2_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs2_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs2_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs2_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflagdata_bits_uop_prs3 [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_prs3_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs3_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_prs3_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs3_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs3_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs3_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_fflagdata_bits_uop_ppred [0:6]; // @[util.scala 535:20]
  wire [4:0] ram_fflagdata_bits_uop_ppred_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ppred_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_fflagdata_bits_uop_ppred_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ppred_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ppred_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ppred_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_prs1_busy [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs1_busy_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs1_busy_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs1_busy_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs1_busy_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs1_busy_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs1_busy_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_prs2_busy [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs2_busy_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs2_busy_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs2_busy_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs2_busy_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs2_busy_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs2_busy_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_prs3_busy [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs3_busy_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs3_busy_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs3_busy_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_prs3_busy_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs3_busy_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_prs3_busy_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_ppred_busy [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ppred_busy_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ppred_busy_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ppred_busy_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ppred_busy_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ppred_busy_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ppred_busy_MPORT_en; // @[util.scala 535:20]
  reg [6:0] ram_fflagdata_bits_uop_stale_pdst [0:6]; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_stale_pdst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_stale_pdst_MPORT_1_addr; // @[util.scala 535:20]
  wire [6:0] ram_fflagdata_bits_uop_stale_pdst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_stale_pdst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_stale_pdst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_stale_pdst_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_exception [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_exception_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_exception_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_exception_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_exception_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_exception_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_exception_MPORT_en; // @[util.scala 535:20]
  reg [63:0] ram_fflagdata_bits_uop_exc_cause [0:6]; // @[util.scala 535:20]
  wire [63:0] ram_fflagdata_bits_uop_exc_cause_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_exc_cause_MPORT_1_addr; // @[util.scala 535:20]
  wire [63:0] ram_fflagdata_bits_uop_exc_cause_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_exc_cause_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_exc_cause_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_exc_cause_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_bypassable [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bypassable_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_bypassable_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bypassable_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_bypassable_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bypassable_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bypassable_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_fflagdata_bits_uop_mem_cmd [0:6]; // @[util.scala 535:20]
  wire [4:0] ram_fflagdata_bits_uop_mem_cmd_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_mem_cmd_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_fflagdata_bits_uop_mem_cmd_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_mem_cmd_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_mem_cmd_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_mem_cmd_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflagdata_bits_uop_mem_size [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_mem_size_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_mem_size_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_mem_size_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_mem_size_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_mem_size_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_mem_size_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_mem_signed [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_mem_signed_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_mem_signed_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_mem_signed_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_mem_signed_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_mem_signed_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_mem_signed_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_is_fence [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_fence_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_fence_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_fence_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_fence_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_fence_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_fence_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_is_fencei [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_fencei_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_fencei_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_fencei_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_fencei_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_fencei_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_fencei_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_is_amo [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_amo_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_amo_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_amo_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_amo_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_amo_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_amo_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_uses_ldq [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_uses_ldq_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_uses_ldq_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_uses_ldq_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_uses_ldq_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_uses_ldq_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_uses_ldq_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_uses_stq [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_uses_stq_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_uses_stq_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_uses_stq_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_uses_stq_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_uses_stq_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_uses_stq_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_is_sys_pc2epc [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_is_unique [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_unique_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_unique_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_unique_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_is_unique_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_unique_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_is_unique_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_flush_on_commit [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_flush_on_commit_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_flush_on_commit_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_flush_on_commit_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_flush_on_commit_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_flush_on_commit_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_flush_on_commit_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_ldst_is_rs1 [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflagdata_bits_uop_ldst [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_ldst_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ldst_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_ldst_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ldst_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldst_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldst_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflagdata_bits_uop_lrs1 [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_lrs1_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs1_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_lrs1_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs1_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs1_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs1_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflagdata_bits_uop_lrs2 [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_lrs2_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs2_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_lrs2_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs2_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs2_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs2_MPORT_en; // @[util.scala 535:20]
  reg [5:0] ram_fflagdata_bits_uop_lrs3 [0:6]; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_lrs3_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs3_MPORT_1_addr; // @[util.scala 535:20]
  wire [5:0] ram_fflagdata_bits_uop_lrs3_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs3_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs3_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs3_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_ldst_val [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldst_val_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ldst_val_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldst_val_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_ldst_val_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldst_val_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_ldst_val_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflagdata_bits_uop_dst_rtype [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_dst_rtype_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_dst_rtype_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_dst_rtype_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_dst_rtype_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_dst_rtype_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_dst_rtype_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflagdata_bits_uop_lrs1_rtype [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_lrs1_rtype_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs1_rtype_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_lrs1_rtype_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs1_rtype_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs1_rtype_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs1_rtype_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflagdata_bits_uop_lrs2_rtype [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_lrs2_rtype_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs2_rtype_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_lrs2_rtype_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_lrs2_rtype_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs2_rtype_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_lrs2_rtype_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_frs3_en [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_frs3_en_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_frs3_en_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_frs3_en_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_frs3_en_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_frs3_en_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_frs3_en_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_fp_val [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_fp_val_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_fp_val_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_fp_val_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_fp_val_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_fp_val_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_fp_val_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_fp_single [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_fp_single_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_fp_single_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_fp_single_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_fp_single_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_fp_single_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_fp_single_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_xcpt_pf_if [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_xcpt_ae_if [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_xcpt_ma_if [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_bp_debug_if [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bp_debug_if_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_bp_debug_if_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bp_debug_if_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_bp_debug_if_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bp_debug_if_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bp_debug_if_MPORT_en; // @[util.scala 535:20]
  reg  ram_fflagdata_bits_uop_bp_xcpt_if [0:6]; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflagdata_bits_uop_debug_fsrc [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_debug_fsrc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_debug_fsrc_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_debug_fsrc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_debug_fsrc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_debug_fsrc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_debug_fsrc_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_fflagdata_bits_uop_debug_tsrc [0:6]; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_debug_tsrc_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_debug_tsrc_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_fflagdata_bits_uop_debug_tsrc_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_uop_debug_tsrc_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_debug_tsrc_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_uop_debug_tsrc_MPORT_en; // @[util.scala 535:20]
  reg [31:0] ram_fflagdata_bits_fflag [0:6]; // @[util.scala 535:20]
  wire [31:0] ram_fflagdata_bits_fflag_MPORT_1_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_fflag_MPORT_1_addr; // @[util.scala 535:20]
  wire [31:0] ram_fflagdata_bits_fflag_MPORT_data; // @[util.scala 535:20]
  wire [2:0] ram_fflagdata_bits_fflag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_fflag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_fflagdata_bits_fflag_MPORT_en; // @[util.scala 535:20]
  reg  valids_0; // @[util.scala 536:24]
  reg  valids_1; // @[util.scala 536:24]
  reg  valids_2; // @[util.scala 536:24]
  reg  valids_3; // @[util.scala 536:24]
  reg  valids_4; // @[util.scala 536:24]
  reg  valids_5; // @[util.scala 536:24]
  reg  valids_6; // @[util.scala 536:24]
  reg  uops_0_switch; // @[util.scala 537:20]
  reg  uops_0_switch_off; // @[util.scala 537:20]
  reg  uops_0_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_0_shift; // @[util.scala 537:20]
  reg [1:0] uops_0_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_0_rflag; // @[util.scala 537:20]
  reg  uops_0_wflag; // @[util.scala 537:20]
  reg [3:0] uops_0_prflag; // @[util.scala 537:20]
  reg [3:0] uops_0_pwflag; // @[util.scala 537:20]
  reg  uops_0_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_0_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_0_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_0_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_0_split_num; // @[util.scala 537:20]
  reg [5:0] uops_0_self_index; // @[util.scala 537:20]
  reg [5:0] uops_0_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_0_address_num; // @[util.scala 537:20]
  reg [6:0] uops_0_uopc; // @[util.scala 537:20]
  reg [31:0] uops_0_inst; // @[util.scala 537:20]
  reg [31:0] uops_0_debug_inst; // @[util.scala 537:20]
  reg  uops_0_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_0_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_0_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_0_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_0_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_0_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_0_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_0_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_0_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_0_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_0_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_0_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_0_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_0_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_0_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_0_iw_state; // @[util.scala 537:20]
  reg  uops_0_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_0_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_0_is_br; // @[util.scala 537:20]
  reg  uops_0_is_jalr; // @[util.scala 537:20]
  reg  uops_0_is_jal; // @[util.scala 537:20]
  reg  uops_0_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_0_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_0_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_0_ftq_idx; // @[util.scala 537:20]
  reg  uops_0_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_0_pc_lob; // @[util.scala 537:20]
  reg  uops_0_taken; // @[util.scala 537:20]
  reg [19:0] uops_0_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_0_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_0_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_0_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_0_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_0_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_0_pdst; // @[util.scala 537:20]
  reg [6:0] uops_0_prs1; // @[util.scala 537:20]
  reg [6:0] uops_0_prs2; // @[util.scala 537:20]
  reg [6:0] uops_0_prs3; // @[util.scala 537:20]
  reg [4:0] uops_0_ppred; // @[util.scala 537:20]
  reg  uops_0_prs1_busy; // @[util.scala 537:20]
  reg  uops_0_prs2_busy; // @[util.scala 537:20]
  reg  uops_0_prs3_busy; // @[util.scala 537:20]
  reg  uops_0_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_0_stale_pdst; // @[util.scala 537:20]
  reg  uops_0_exception; // @[util.scala 537:20]
  reg [63:0] uops_0_exc_cause; // @[util.scala 537:20]
  reg  uops_0_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_0_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_0_mem_size; // @[util.scala 537:20]
  reg  uops_0_mem_signed; // @[util.scala 537:20]
  reg  uops_0_is_fence; // @[util.scala 537:20]
  reg  uops_0_is_fencei; // @[util.scala 537:20]
  reg  uops_0_is_amo; // @[util.scala 537:20]
  reg  uops_0_uses_ldq; // @[util.scala 537:20]
  reg  uops_0_uses_stq; // @[util.scala 537:20]
  reg  uops_0_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_0_is_unique; // @[util.scala 537:20]
  reg  uops_0_flush_on_commit; // @[util.scala 537:20]
  reg  uops_0_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_0_ldst; // @[util.scala 537:20]
  reg [5:0] uops_0_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_0_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_0_lrs3; // @[util.scala 537:20]
  reg  uops_0_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_0_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_0_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_0_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_0_frs3_en; // @[util.scala 537:20]
  reg  uops_0_fp_val; // @[util.scala 537:20]
  reg  uops_0_fp_single; // @[util.scala 537:20]
  reg  uops_0_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_0_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_0_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_0_bp_debug_if; // @[util.scala 537:20]
  reg  uops_0_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_0_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_0_debug_tsrc; // @[util.scala 537:20]
  reg  uops_1_switch; // @[util.scala 537:20]
  reg  uops_1_switch_off; // @[util.scala 537:20]
  reg  uops_1_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_1_shift; // @[util.scala 537:20]
  reg [1:0] uops_1_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_1_rflag; // @[util.scala 537:20]
  reg  uops_1_wflag; // @[util.scala 537:20]
  reg [3:0] uops_1_prflag; // @[util.scala 537:20]
  reg [3:0] uops_1_pwflag; // @[util.scala 537:20]
  reg  uops_1_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_1_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_1_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_1_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_1_split_num; // @[util.scala 537:20]
  reg [5:0] uops_1_self_index; // @[util.scala 537:20]
  reg [5:0] uops_1_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_1_address_num; // @[util.scala 537:20]
  reg [6:0] uops_1_uopc; // @[util.scala 537:20]
  reg [31:0] uops_1_inst; // @[util.scala 537:20]
  reg [31:0] uops_1_debug_inst; // @[util.scala 537:20]
  reg  uops_1_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_1_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_1_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_1_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_1_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_1_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_1_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_1_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_1_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_1_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_1_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_1_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_1_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_1_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_1_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_1_iw_state; // @[util.scala 537:20]
  reg  uops_1_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_1_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_1_is_br; // @[util.scala 537:20]
  reg  uops_1_is_jalr; // @[util.scala 537:20]
  reg  uops_1_is_jal; // @[util.scala 537:20]
  reg  uops_1_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_1_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_1_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_1_ftq_idx; // @[util.scala 537:20]
  reg  uops_1_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_1_pc_lob; // @[util.scala 537:20]
  reg  uops_1_taken; // @[util.scala 537:20]
  reg [19:0] uops_1_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_1_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_1_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_1_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_1_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_1_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_1_pdst; // @[util.scala 537:20]
  reg [6:0] uops_1_prs1; // @[util.scala 537:20]
  reg [6:0] uops_1_prs2; // @[util.scala 537:20]
  reg [6:0] uops_1_prs3; // @[util.scala 537:20]
  reg [4:0] uops_1_ppred; // @[util.scala 537:20]
  reg  uops_1_prs1_busy; // @[util.scala 537:20]
  reg  uops_1_prs2_busy; // @[util.scala 537:20]
  reg  uops_1_prs3_busy; // @[util.scala 537:20]
  reg  uops_1_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_1_stale_pdst; // @[util.scala 537:20]
  reg  uops_1_exception; // @[util.scala 537:20]
  reg [63:0] uops_1_exc_cause; // @[util.scala 537:20]
  reg  uops_1_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_1_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_1_mem_size; // @[util.scala 537:20]
  reg  uops_1_mem_signed; // @[util.scala 537:20]
  reg  uops_1_is_fence; // @[util.scala 537:20]
  reg  uops_1_is_fencei; // @[util.scala 537:20]
  reg  uops_1_is_amo; // @[util.scala 537:20]
  reg  uops_1_uses_ldq; // @[util.scala 537:20]
  reg  uops_1_uses_stq; // @[util.scala 537:20]
  reg  uops_1_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_1_is_unique; // @[util.scala 537:20]
  reg  uops_1_flush_on_commit; // @[util.scala 537:20]
  reg  uops_1_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_1_ldst; // @[util.scala 537:20]
  reg [5:0] uops_1_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_1_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_1_lrs3; // @[util.scala 537:20]
  reg  uops_1_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_1_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_1_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_1_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_1_frs3_en; // @[util.scala 537:20]
  reg  uops_1_fp_val; // @[util.scala 537:20]
  reg  uops_1_fp_single; // @[util.scala 537:20]
  reg  uops_1_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_1_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_1_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_1_bp_debug_if; // @[util.scala 537:20]
  reg  uops_1_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_1_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_1_debug_tsrc; // @[util.scala 537:20]
  reg  uops_2_switch; // @[util.scala 537:20]
  reg  uops_2_switch_off; // @[util.scala 537:20]
  reg  uops_2_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_2_shift; // @[util.scala 537:20]
  reg [1:0] uops_2_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_2_rflag; // @[util.scala 537:20]
  reg  uops_2_wflag; // @[util.scala 537:20]
  reg [3:0] uops_2_prflag; // @[util.scala 537:20]
  reg [3:0] uops_2_pwflag; // @[util.scala 537:20]
  reg  uops_2_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_2_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_2_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_2_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_2_split_num; // @[util.scala 537:20]
  reg [5:0] uops_2_self_index; // @[util.scala 537:20]
  reg [5:0] uops_2_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_2_address_num; // @[util.scala 537:20]
  reg [6:0] uops_2_uopc; // @[util.scala 537:20]
  reg [31:0] uops_2_inst; // @[util.scala 537:20]
  reg [31:0] uops_2_debug_inst; // @[util.scala 537:20]
  reg  uops_2_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_2_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_2_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_2_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_2_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_2_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_2_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_2_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_2_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_2_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_2_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_2_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_2_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_2_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_2_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_2_iw_state; // @[util.scala 537:20]
  reg  uops_2_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_2_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_2_is_br; // @[util.scala 537:20]
  reg  uops_2_is_jalr; // @[util.scala 537:20]
  reg  uops_2_is_jal; // @[util.scala 537:20]
  reg  uops_2_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_2_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_2_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_2_ftq_idx; // @[util.scala 537:20]
  reg  uops_2_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_2_pc_lob; // @[util.scala 537:20]
  reg  uops_2_taken; // @[util.scala 537:20]
  reg [19:0] uops_2_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_2_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_2_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_2_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_2_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_2_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_2_pdst; // @[util.scala 537:20]
  reg [6:0] uops_2_prs1; // @[util.scala 537:20]
  reg [6:0] uops_2_prs2; // @[util.scala 537:20]
  reg [6:0] uops_2_prs3; // @[util.scala 537:20]
  reg [4:0] uops_2_ppred; // @[util.scala 537:20]
  reg  uops_2_prs1_busy; // @[util.scala 537:20]
  reg  uops_2_prs2_busy; // @[util.scala 537:20]
  reg  uops_2_prs3_busy; // @[util.scala 537:20]
  reg  uops_2_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_2_stale_pdst; // @[util.scala 537:20]
  reg  uops_2_exception; // @[util.scala 537:20]
  reg [63:0] uops_2_exc_cause; // @[util.scala 537:20]
  reg  uops_2_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_2_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_2_mem_size; // @[util.scala 537:20]
  reg  uops_2_mem_signed; // @[util.scala 537:20]
  reg  uops_2_is_fence; // @[util.scala 537:20]
  reg  uops_2_is_fencei; // @[util.scala 537:20]
  reg  uops_2_is_amo; // @[util.scala 537:20]
  reg  uops_2_uses_ldq; // @[util.scala 537:20]
  reg  uops_2_uses_stq; // @[util.scala 537:20]
  reg  uops_2_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_2_is_unique; // @[util.scala 537:20]
  reg  uops_2_flush_on_commit; // @[util.scala 537:20]
  reg  uops_2_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_2_ldst; // @[util.scala 537:20]
  reg [5:0] uops_2_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_2_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_2_lrs3; // @[util.scala 537:20]
  reg  uops_2_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_2_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_2_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_2_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_2_frs3_en; // @[util.scala 537:20]
  reg  uops_2_fp_val; // @[util.scala 537:20]
  reg  uops_2_fp_single; // @[util.scala 537:20]
  reg  uops_2_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_2_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_2_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_2_bp_debug_if; // @[util.scala 537:20]
  reg  uops_2_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_2_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_2_debug_tsrc; // @[util.scala 537:20]
  reg  uops_3_switch; // @[util.scala 537:20]
  reg  uops_3_switch_off; // @[util.scala 537:20]
  reg  uops_3_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_3_shift; // @[util.scala 537:20]
  reg [1:0] uops_3_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_3_rflag; // @[util.scala 537:20]
  reg  uops_3_wflag; // @[util.scala 537:20]
  reg [3:0] uops_3_prflag; // @[util.scala 537:20]
  reg [3:0] uops_3_pwflag; // @[util.scala 537:20]
  reg  uops_3_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_3_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_3_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_3_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_3_split_num; // @[util.scala 537:20]
  reg [5:0] uops_3_self_index; // @[util.scala 537:20]
  reg [5:0] uops_3_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_3_address_num; // @[util.scala 537:20]
  reg [6:0] uops_3_uopc; // @[util.scala 537:20]
  reg [31:0] uops_3_inst; // @[util.scala 537:20]
  reg [31:0] uops_3_debug_inst; // @[util.scala 537:20]
  reg  uops_3_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_3_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_3_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_3_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_3_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_3_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_3_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_3_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_3_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_3_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_3_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_3_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_3_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_3_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_3_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_3_iw_state; // @[util.scala 537:20]
  reg  uops_3_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_3_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_3_is_br; // @[util.scala 537:20]
  reg  uops_3_is_jalr; // @[util.scala 537:20]
  reg  uops_3_is_jal; // @[util.scala 537:20]
  reg  uops_3_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_3_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_3_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_3_ftq_idx; // @[util.scala 537:20]
  reg  uops_3_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_3_pc_lob; // @[util.scala 537:20]
  reg  uops_3_taken; // @[util.scala 537:20]
  reg [19:0] uops_3_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_3_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_3_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_3_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_3_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_3_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_3_pdst; // @[util.scala 537:20]
  reg [6:0] uops_3_prs1; // @[util.scala 537:20]
  reg [6:0] uops_3_prs2; // @[util.scala 537:20]
  reg [6:0] uops_3_prs3; // @[util.scala 537:20]
  reg [4:0] uops_3_ppred; // @[util.scala 537:20]
  reg  uops_3_prs1_busy; // @[util.scala 537:20]
  reg  uops_3_prs2_busy; // @[util.scala 537:20]
  reg  uops_3_prs3_busy; // @[util.scala 537:20]
  reg  uops_3_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_3_stale_pdst; // @[util.scala 537:20]
  reg  uops_3_exception; // @[util.scala 537:20]
  reg [63:0] uops_3_exc_cause; // @[util.scala 537:20]
  reg  uops_3_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_3_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_3_mem_size; // @[util.scala 537:20]
  reg  uops_3_mem_signed; // @[util.scala 537:20]
  reg  uops_3_is_fence; // @[util.scala 537:20]
  reg  uops_3_is_fencei; // @[util.scala 537:20]
  reg  uops_3_is_amo; // @[util.scala 537:20]
  reg  uops_3_uses_ldq; // @[util.scala 537:20]
  reg  uops_3_uses_stq; // @[util.scala 537:20]
  reg  uops_3_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_3_is_unique; // @[util.scala 537:20]
  reg  uops_3_flush_on_commit; // @[util.scala 537:20]
  reg  uops_3_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_3_ldst; // @[util.scala 537:20]
  reg [5:0] uops_3_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_3_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_3_lrs3; // @[util.scala 537:20]
  reg  uops_3_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_3_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_3_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_3_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_3_frs3_en; // @[util.scala 537:20]
  reg  uops_3_fp_val; // @[util.scala 537:20]
  reg  uops_3_fp_single; // @[util.scala 537:20]
  reg  uops_3_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_3_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_3_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_3_bp_debug_if; // @[util.scala 537:20]
  reg  uops_3_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_3_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_3_debug_tsrc; // @[util.scala 537:20]
  reg  uops_4_switch; // @[util.scala 537:20]
  reg  uops_4_switch_off; // @[util.scala 537:20]
  reg  uops_4_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_4_shift; // @[util.scala 537:20]
  reg [1:0] uops_4_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_4_rflag; // @[util.scala 537:20]
  reg  uops_4_wflag; // @[util.scala 537:20]
  reg [3:0] uops_4_prflag; // @[util.scala 537:20]
  reg [3:0] uops_4_pwflag; // @[util.scala 537:20]
  reg  uops_4_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_4_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_4_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_4_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_4_split_num; // @[util.scala 537:20]
  reg [5:0] uops_4_self_index; // @[util.scala 537:20]
  reg [5:0] uops_4_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_4_address_num; // @[util.scala 537:20]
  reg [6:0] uops_4_uopc; // @[util.scala 537:20]
  reg [31:0] uops_4_inst; // @[util.scala 537:20]
  reg [31:0] uops_4_debug_inst; // @[util.scala 537:20]
  reg  uops_4_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_4_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_4_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_4_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_4_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_4_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_4_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_4_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_4_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_4_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_4_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_4_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_4_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_4_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_4_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_4_iw_state; // @[util.scala 537:20]
  reg  uops_4_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_4_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_4_is_br; // @[util.scala 537:20]
  reg  uops_4_is_jalr; // @[util.scala 537:20]
  reg  uops_4_is_jal; // @[util.scala 537:20]
  reg  uops_4_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_4_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_4_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_4_ftq_idx; // @[util.scala 537:20]
  reg  uops_4_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_4_pc_lob; // @[util.scala 537:20]
  reg  uops_4_taken; // @[util.scala 537:20]
  reg [19:0] uops_4_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_4_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_4_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_4_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_4_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_4_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_4_pdst; // @[util.scala 537:20]
  reg [6:0] uops_4_prs1; // @[util.scala 537:20]
  reg [6:0] uops_4_prs2; // @[util.scala 537:20]
  reg [6:0] uops_4_prs3; // @[util.scala 537:20]
  reg [4:0] uops_4_ppred; // @[util.scala 537:20]
  reg  uops_4_prs1_busy; // @[util.scala 537:20]
  reg  uops_4_prs2_busy; // @[util.scala 537:20]
  reg  uops_4_prs3_busy; // @[util.scala 537:20]
  reg  uops_4_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_4_stale_pdst; // @[util.scala 537:20]
  reg  uops_4_exception; // @[util.scala 537:20]
  reg [63:0] uops_4_exc_cause; // @[util.scala 537:20]
  reg  uops_4_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_4_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_4_mem_size; // @[util.scala 537:20]
  reg  uops_4_mem_signed; // @[util.scala 537:20]
  reg  uops_4_is_fence; // @[util.scala 537:20]
  reg  uops_4_is_fencei; // @[util.scala 537:20]
  reg  uops_4_is_amo; // @[util.scala 537:20]
  reg  uops_4_uses_ldq; // @[util.scala 537:20]
  reg  uops_4_uses_stq; // @[util.scala 537:20]
  reg  uops_4_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_4_is_unique; // @[util.scala 537:20]
  reg  uops_4_flush_on_commit; // @[util.scala 537:20]
  reg  uops_4_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_4_ldst; // @[util.scala 537:20]
  reg [5:0] uops_4_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_4_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_4_lrs3; // @[util.scala 537:20]
  reg  uops_4_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_4_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_4_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_4_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_4_frs3_en; // @[util.scala 537:20]
  reg  uops_4_fp_val; // @[util.scala 537:20]
  reg  uops_4_fp_single; // @[util.scala 537:20]
  reg  uops_4_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_4_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_4_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_4_bp_debug_if; // @[util.scala 537:20]
  reg  uops_4_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_4_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_4_debug_tsrc; // @[util.scala 537:20]
  reg  uops_5_switch; // @[util.scala 537:20]
  reg  uops_5_switch_off; // @[util.scala 537:20]
  reg  uops_5_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_5_shift; // @[util.scala 537:20]
  reg [1:0] uops_5_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_5_rflag; // @[util.scala 537:20]
  reg  uops_5_wflag; // @[util.scala 537:20]
  reg [3:0] uops_5_prflag; // @[util.scala 537:20]
  reg [3:0] uops_5_pwflag; // @[util.scala 537:20]
  reg  uops_5_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_5_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_5_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_5_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_5_split_num; // @[util.scala 537:20]
  reg [5:0] uops_5_self_index; // @[util.scala 537:20]
  reg [5:0] uops_5_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_5_address_num; // @[util.scala 537:20]
  reg [6:0] uops_5_uopc; // @[util.scala 537:20]
  reg [31:0] uops_5_inst; // @[util.scala 537:20]
  reg [31:0] uops_5_debug_inst; // @[util.scala 537:20]
  reg  uops_5_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_5_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_5_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_5_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_5_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_5_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_5_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_5_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_5_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_5_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_5_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_5_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_5_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_5_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_5_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_5_iw_state; // @[util.scala 537:20]
  reg  uops_5_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_5_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_5_is_br; // @[util.scala 537:20]
  reg  uops_5_is_jalr; // @[util.scala 537:20]
  reg  uops_5_is_jal; // @[util.scala 537:20]
  reg  uops_5_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_5_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_5_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_5_ftq_idx; // @[util.scala 537:20]
  reg  uops_5_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_5_pc_lob; // @[util.scala 537:20]
  reg  uops_5_taken; // @[util.scala 537:20]
  reg [19:0] uops_5_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_5_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_5_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_5_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_5_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_5_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_5_pdst; // @[util.scala 537:20]
  reg [6:0] uops_5_prs1; // @[util.scala 537:20]
  reg [6:0] uops_5_prs2; // @[util.scala 537:20]
  reg [6:0] uops_5_prs3; // @[util.scala 537:20]
  reg [4:0] uops_5_ppred; // @[util.scala 537:20]
  reg  uops_5_prs1_busy; // @[util.scala 537:20]
  reg  uops_5_prs2_busy; // @[util.scala 537:20]
  reg  uops_5_prs3_busy; // @[util.scala 537:20]
  reg  uops_5_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_5_stale_pdst; // @[util.scala 537:20]
  reg  uops_5_exception; // @[util.scala 537:20]
  reg [63:0] uops_5_exc_cause; // @[util.scala 537:20]
  reg  uops_5_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_5_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_5_mem_size; // @[util.scala 537:20]
  reg  uops_5_mem_signed; // @[util.scala 537:20]
  reg  uops_5_is_fence; // @[util.scala 537:20]
  reg  uops_5_is_fencei; // @[util.scala 537:20]
  reg  uops_5_is_amo; // @[util.scala 537:20]
  reg  uops_5_uses_ldq; // @[util.scala 537:20]
  reg  uops_5_uses_stq; // @[util.scala 537:20]
  reg  uops_5_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_5_is_unique; // @[util.scala 537:20]
  reg  uops_5_flush_on_commit; // @[util.scala 537:20]
  reg  uops_5_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_5_ldst; // @[util.scala 537:20]
  reg [5:0] uops_5_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_5_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_5_lrs3; // @[util.scala 537:20]
  reg  uops_5_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_5_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_5_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_5_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_5_frs3_en; // @[util.scala 537:20]
  reg  uops_5_fp_val; // @[util.scala 537:20]
  reg  uops_5_fp_single; // @[util.scala 537:20]
  reg  uops_5_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_5_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_5_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_5_bp_debug_if; // @[util.scala 537:20]
  reg  uops_5_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_5_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_5_debug_tsrc; // @[util.scala 537:20]
  reg  uops_6_switch; // @[util.scala 537:20]
  reg  uops_6_switch_off; // @[util.scala 537:20]
  reg  uops_6_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_6_shift; // @[util.scala 537:20]
  reg [1:0] uops_6_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_6_rflag; // @[util.scala 537:20]
  reg  uops_6_wflag; // @[util.scala 537:20]
  reg [3:0] uops_6_prflag; // @[util.scala 537:20]
  reg [3:0] uops_6_pwflag; // @[util.scala 537:20]
  reg  uops_6_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_6_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_6_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_6_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_6_split_num; // @[util.scala 537:20]
  reg [5:0] uops_6_self_index; // @[util.scala 537:20]
  reg [5:0] uops_6_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_6_address_num; // @[util.scala 537:20]
  reg [6:0] uops_6_uopc; // @[util.scala 537:20]
  reg [31:0] uops_6_inst; // @[util.scala 537:20]
  reg [31:0] uops_6_debug_inst; // @[util.scala 537:20]
  reg  uops_6_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_6_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_6_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_6_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_6_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_6_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_6_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_6_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_6_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_6_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_6_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_6_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_6_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_6_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_6_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_6_iw_state; // @[util.scala 537:20]
  reg  uops_6_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_6_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_6_is_br; // @[util.scala 537:20]
  reg  uops_6_is_jalr; // @[util.scala 537:20]
  reg  uops_6_is_jal; // @[util.scala 537:20]
  reg  uops_6_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_6_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_6_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_6_ftq_idx; // @[util.scala 537:20]
  reg  uops_6_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_6_pc_lob; // @[util.scala 537:20]
  reg  uops_6_taken; // @[util.scala 537:20]
  reg [19:0] uops_6_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_6_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_6_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_6_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_6_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_6_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_6_pdst; // @[util.scala 537:20]
  reg [6:0] uops_6_prs1; // @[util.scala 537:20]
  reg [6:0] uops_6_prs2; // @[util.scala 537:20]
  reg [6:0] uops_6_prs3; // @[util.scala 537:20]
  reg [4:0] uops_6_ppred; // @[util.scala 537:20]
  reg  uops_6_prs1_busy; // @[util.scala 537:20]
  reg  uops_6_prs2_busy; // @[util.scala 537:20]
  reg  uops_6_prs3_busy; // @[util.scala 537:20]
  reg  uops_6_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_6_stale_pdst; // @[util.scala 537:20]
  reg  uops_6_exception; // @[util.scala 537:20]
  reg [63:0] uops_6_exc_cause; // @[util.scala 537:20]
  reg  uops_6_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_6_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_6_mem_size; // @[util.scala 537:20]
  reg  uops_6_mem_signed; // @[util.scala 537:20]
  reg  uops_6_is_fence; // @[util.scala 537:20]
  reg  uops_6_is_fencei; // @[util.scala 537:20]
  reg  uops_6_is_amo; // @[util.scala 537:20]
  reg  uops_6_uses_ldq; // @[util.scala 537:20]
  reg  uops_6_uses_stq; // @[util.scala 537:20]
  reg  uops_6_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_6_is_unique; // @[util.scala 537:20]
  reg  uops_6_flush_on_commit; // @[util.scala 537:20]
  reg  uops_6_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_6_ldst; // @[util.scala 537:20]
  reg [5:0] uops_6_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_6_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_6_lrs3; // @[util.scala 537:20]
  reg  uops_6_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_6_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_6_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_6_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_6_frs3_en; // @[util.scala 537:20]
  reg  uops_6_fp_val; // @[util.scala 537:20]
  reg  uops_6_fp_single; // @[util.scala 537:20]
  reg  uops_6_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_6_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_6_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_6_bp_debug_if; // @[util.scala 537:20]
  reg  uops_6_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_6_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_6_debug_tsrc; // @[util.scala 537:20]
  reg [2:0] value; // @[Counter.scala 60:40]
  reg [2:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[util.scala 541:27]
  wire  ptr_match = value == value_1; // @[util.scala 543:33]
  wire  full = ptr_match & maybe_full; // @[util.scala 545:24]
  wire  _T_2 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_1 = 3'h1 == value_1 ? valids_1 : valids_0; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_2 = 3'h2 == value_1 ? valids_2 : _GEN_1; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_3 = 3'h3 == value_1 ? valids_3 : _GEN_2; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_4 = 3'h4 == value_1 ? valids_4 : _GEN_3; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_5 = 3'h5 == value_1 ? valids_5 : _GEN_4; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_6 = 3'h6 == value_1 ? valids_6 : _GEN_5; // @[util.scala 547:42 util.scala 547:42]
  wire  _T_5 = ~io_empty; // @[util.scala 547:69]
  wire  _T_6 = (io_deq_ready | ~_GEN_6) & ~io_empty; // @[util.scala 547:66]
  wire [11:0] _T_7 = io_brupdate_b1_mispredict_mask & uops_0_br_mask; // @[util.scala 175:51]
  wire  _T_8 = _T_7 != 12'h0; // @[util.scala 175:59]
  wire  _T_12 = ~io_flush; // @[util.scala 552:72]
  wire [11:0] _T_14 = ~io_brupdate_b1_resolve_mask; // @[util.scala 146:23]
  wire [11:0] _T_15 = uops_0_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_7 = valids_0 ? _T_15 : uops_0_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_16 = io_brupdate_b1_mispredict_mask & uops_1_br_mask; // @[util.scala 175:51]
  wire  _T_17 = _T_16 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_24 = uops_1_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_8 = valids_1 ? _T_24 : uops_1_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_25 = io_brupdate_b1_mispredict_mask & uops_2_br_mask; // @[util.scala 175:51]
  wire  _T_26 = _T_25 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_33 = uops_2_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_9 = valids_2 ? _T_33 : uops_2_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_34 = io_brupdate_b1_mispredict_mask & uops_3_br_mask; // @[util.scala 175:51]
  wire  _T_35 = _T_34 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_42 = uops_3_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_10 = valids_3 ? _T_42 : uops_3_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_43 = io_brupdate_b1_mispredict_mask & uops_4_br_mask; // @[util.scala 175:51]
  wire  _T_44 = _T_43 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_51 = uops_4_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_11 = valids_4 ? _T_51 : uops_4_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_52 = io_brupdate_b1_mispredict_mask & uops_5_br_mask; // @[util.scala 175:51]
  wire  _T_53 = _T_52 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_60 = uops_5_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_12 = valids_5 ? _T_60 : uops_5_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_61 = io_brupdate_b1_mispredict_mask & uops_6_br_mask; // @[util.scala 175:51]
  wire  _T_62 = _T_61 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_69 = uops_6_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_13 = valids_6 ? _T_69 : uops_6_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire  _GEN_14 = 3'h0 == value | valids_0 & ~_T_8 & ~io_flush; // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_15 = 3'h1 == value | valids_1 & ~_T_17 & ~io_flush; // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_16 = 3'h2 == value | valids_2 & ~_T_26 & ~io_flush; // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_17 = 3'h3 == value | valids_3 & ~_T_35 & ~io_flush; // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_18 = 3'h4 == value | valids_4 & ~_T_44 & ~io_flush; // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_19 = 3'h5 == value | valids_5 & ~_T_53 & ~io_flush; // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_20 = 3'h6 == value | valids_6 & ~_T_62 & ~io_flush; // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire [11:0] _T_71 = io_enq_bits_uop_br_mask & _T_14; // @[util.scala 142:25]
  wire  wrap = value == 3'h6; // @[Counter.scala 72:24]
  wire [2:0] _value_T_1 = value + 3'h1; // @[Counter.scala 76:24]
  wire  _GEN_2393 = io_deq_ready ? 1'h0 : _T_2; // @[util.scala 592:27 util.scala 592:36]
  wire  do_enq = io_empty ? _GEN_2393 : _T_2; // @[util.scala 586:21]
  wire  _GEN_1010 = do_enq ? _GEN_14 : valids_0 & ~_T_8 & ~io_flush; // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1011 = do_enq ? _GEN_15 : valids_1 & ~_T_17 & ~io_flush; // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1012 = do_enq ? _GEN_16 : valids_2 & ~_T_26 & ~io_flush; // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1013 = do_enq ? _GEN_17 : valids_3 & ~_T_35 & ~io_flush; // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1014 = do_enq ? _GEN_18 : valids_4 & ~_T_44 & ~io_flush; // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1015 = do_enq ? _GEN_19 : valids_5 & ~_T_53 & ~io_flush; // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1016 = do_enq ? _GEN_20 : valids_6 & ~_T_62 & ~io_flush; // @[util.scala 558:17 util.scala 552:16]
  wire  wrap_1 = value_1 == 3'h6; // @[Counter.scala 72:24]
  wire [2:0] _value_T_3 = value_1 + 3'h1; // @[Counter.scala 76:24]
  wire  do_deq = io_empty ? 1'h0 : _T_6; // @[util.scala 586:21 util.scala 591:14]
  wire [1:0] _GEN_1715 = 3'h1 == value_1 ? uops_1_debug_tsrc : uops_0_debug_tsrc; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1716 = 3'h2 == value_1 ? uops_2_debug_tsrc : _GEN_1715; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1717 = 3'h3 == value_1 ? uops_3_debug_tsrc : _GEN_1716; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1718 = 3'h4 == value_1 ? uops_4_debug_tsrc : _GEN_1717; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1719 = 3'h5 == value_1 ? uops_5_debug_tsrc : _GEN_1718; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] out_uop_debug_tsrc = 3'h6 == value_1 ? uops_6_debug_tsrc : _GEN_1719; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1722 = 3'h1 == value_1 ? uops_1_debug_fsrc : uops_0_debug_fsrc; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1723 = 3'h2 == value_1 ? uops_2_debug_fsrc : _GEN_1722; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1724 = 3'h3 == value_1 ? uops_3_debug_fsrc : _GEN_1723; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1725 = 3'h4 == value_1 ? uops_4_debug_fsrc : _GEN_1724; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1726 = 3'h5 == value_1 ? uops_5_debug_fsrc : _GEN_1725; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] out_uop_debug_fsrc = 3'h6 == value_1 ? uops_6_debug_fsrc : _GEN_1726; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1729 = 3'h1 == value_1 ? uops_1_bp_xcpt_if : uops_0_bp_xcpt_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1730 = 3'h2 == value_1 ? uops_2_bp_xcpt_if : _GEN_1729; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1731 = 3'h3 == value_1 ? uops_3_bp_xcpt_if : _GEN_1730; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1732 = 3'h4 == value_1 ? uops_4_bp_xcpt_if : _GEN_1731; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1733 = 3'h5 == value_1 ? uops_5_bp_xcpt_if : _GEN_1732; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_bp_xcpt_if = 3'h6 == value_1 ? uops_6_bp_xcpt_if : _GEN_1733; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1736 = 3'h1 == value_1 ? uops_1_bp_debug_if : uops_0_bp_debug_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1737 = 3'h2 == value_1 ? uops_2_bp_debug_if : _GEN_1736; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1738 = 3'h3 == value_1 ? uops_3_bp_debug_if : _GEN_1737; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1739 = 3'h4 == value_1 ? uops_4_bp_debug_if : _GEN_1738; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1740 = 3'h5 == value_1 ? uops_5_bp_debug_if : _GEN_1739; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_bp_debug_if = 3'h6 == value_1 ? uops_6_bp_debug_if : _GEN_1740; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1743 = 3'h1 == value_1 ? uops_1_xcpt_ma_if : uops_0_xcpt_ma_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1744 = 3'h2 == value_1 ? uops_2_xcpt_ma_if : _GEN_1743; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1745 = 3'h3 == value_1 ? uops_3_xcpt_ma_if : _GEN_1744; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1746 = 3'h4 == value_1 ? uops_4_xcpt_ma_if : _GEN_1745; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1747 = 3'h5 == value_1 ? uops_5_xcpt_ma_if : _GEN_1746; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_xcpt_ma_if = 3'h6 == value_1 ? uops_6_xcpt_ma_if : _GEN_1747; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1750 = 3'h1 == value_1 ? uops_1_xcpt_ae_if : uops_0_xcpt_ae_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1751 = 3'h2 == value_1 ? uops_2_xcpt_ae_if : _GEN_1750; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1752 = 3'h3 == value_1 ? uops_3_xcpt_ae_if : _GEN_1751; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1753 = 3'h4 == value_1 ? uops_4_xcpt_ae_if : _GEN_1752; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1754 = 3'h5 == value_1 ? uops_5_xcpt_ae_if : _GEN_1753; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_xcpt_ae_if = 3'h6 == value_1 ? uops_6_xcpt_ae_if : _GEN_1754; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1757 = 3'h1 == value_1 ? uops_1_xcpt_pf_if : uops_0_xcpt_pf_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1758 = 3'h2 == value_1 ? uops_2_xcpt_pf_if : _GEN_1757; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1759 = 3'h3 == value_1 ? uops_3_xcpt_pf_if : _GEN_1758; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1760 = 3'h4 == value_1 ? uops_4_xcpt_pf_if : _GEN_1759; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1761 = 3'h5 == value_1 ? uops_5_xcpt_pf_if : _GEN_1760; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_xcpt_pf_if = 3'h6 == value_1 ? uops_6_xcpt_pf_if : _GEN_1761; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1764 = 3'h1 == value_1 ? uops_1_fp_single : uops_0_fp_single; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1765 = 3'h2 == value_1 ? uops_2_fp_single : _GEN_1764; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1766 = 3'h3 == value_1 ? uops_3_fp_single : _GEN_1765; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1767 = 3'h4 == value_1 ? uops_4_fp_single : _GEN_1766; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1768 = 3'h5 == value_1 ? uops_5_fp_single : _GEN_1767; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_fp_single = 3'h6 == value_1 ? uops_6_fp_single : _GEN_1768; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1771 = 3'h1 == value_1 ? uops_1_fp_val : uops_0_fp_val; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1772 = 3'h2 == value_1 ? uops_2_fp_val : _GEN_1771; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1773 = 3'h3 == value_1 ? uops_3_fp_val : _GEN_1772; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1774 = 3'h4 == value_1 ? uops_4_fp_val : _GEN_1773; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1775 = 3'h5 == value_1 ? uops_5_fp_val : _GEN_1774; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_fp_val = 3'h6 == value_1 ? uops_6_fp_val : _GEN_1775; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1778 = 3'h1 == value_1 ? uops_1_frs3_en : uops_0_frs3_en; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1779 = 3'h2 == value_1 ? uops_2_frs3_en : _GEN_1778; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1780 = 3'h3 == value_1 ? uops_3_frs3_en : _GEN_1779; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1781 = 3'h4 == value_1 ? uops_4_frs3_en : _GEN_1780; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1782 = 3'h5 == value_1 ? uops_5_frs3_en : _GEN_1781; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_frs3_en = 3'h6 == value_1 ? uops_6_frs3_en : _GEN_1782; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1785 = 3'h1 == value_1 ? uops_1_lrs2_rtype : uops_0_lrs2_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1786 = 3'h2 == value_1 ? uops_2_lrs2_rtype : _GEN_1785; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1787 = 3'h3 == value_1 ? uops_3_lrs2_rtype : _GEN_1786; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1788 = 3'h4 == value_1 ? uops_4_lrs2_rtype : _GEN_1787; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1789 = 3'h5 == value_1 ? uops_5_lrs2_rtype : _GEN_1788; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] out_uop_lrs2_rtype = 3'h6 == value_1 ? uops_6_lrs2_rtype : _GEN_1789; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1792 = 3'h1 == value_1 ? uops_1_lrs1_rtype : uops_0_lrs1_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1793 = 3'h2 == value_1 ? uops_2_lrs1_rtype : _GEN_1792; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1794 = 3'h3 == value_1 ? uops_3_lrs1_rtype : _GEN_1793; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1795 = 3'h4 == value_1 ? uops_4_lrs1_rtype : _GEN_1794; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1796 = 3'h5 == value_1 ? uops_5_lrs1_rtype : _GEN_1795; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] out_uop_lrs1_rtype = 3'h6 == value_1 ? uops_6_lrs1_rtype : _GEN_1796; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1799 = 3'h1 == value_1 ? uops_1_dst_rtype : uops_0_dst_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1800 = 3'h2 == value_1 ? uops_2_dst_rtype : _GEN_1799; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1801 = 3'h3 == value_1 ? uops_3_dst_rtype : _GEN_1800; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1802 = 3'h4 == value_1 ? uops_4_dst_rtype : _GEN_1801; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1803 = 3'h5 == value_1 ? uops_5_dst_rtype : _GEN_1802; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] out_uop_dst_rtype = 3'h6 == value_1 ? uops_6_dst_rtype : _GEN_1803; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1806 = 3'h1 == value_1 ? uops_1_ldst_val : uops_0_ldst_val; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1807 = 3'h2 == value_1 ? uops_2_ldst_val : _GEN_1806; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1808 = 3'h3 == value_1 ? uops_3_ldst_val : _GEN_1807; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1809 = 3'h4 == value_1 ? uops_4_ldst_val : _GEN_1808; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1810 = 3'h5 == value_1 ? uops_5_ldst_val : _GEN_1809; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_ldst_val = 3'h6 == value_1 ? uops_6_ldst_val : _GEN_1810; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1813 = 3'h1 == value_1 ? uops_1_lrs3 : uops_0_lrs3; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1814 = 3'h2 == value_1 ? uops_2_lrs3 : _GEN_1813; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1815 = 3'h3 == value_1 ? uops_3_lrs3 : _GEN_1814; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1816 = 3'h4 == value_1 ? uops_4_lrs3 : _GEN_1815; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1817 = 3'h5 == value_1 ? uops_5_lrs3 : _GEN_1816; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] out_uop_lrs3 = 3'h6 == value_1 ? uops_6_lrs3 : _GEN_1817; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1820 = 3'h1 == value_1 ? uops_1_lrs2 : uops_0_lrs2; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1821 = 3'h2 == value_1 ? uops_2_lrs2 : _GEN_1820; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1822 = 3'h3 == value_1 ? uops_3_lrs2 : _GEN_1821; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1823 = 3'h4 == value_1 ? uops_4_lrs2 : _GEN_1822; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1824 = 3'h5 == value_1 ? uops_5_lrs2 : _GEN_1823; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] out_uop_lrs2 = 3'h6 == value_1 ? uops_6_lrs2 : _GEN_1824; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1827 = 3'h1 == value_1 ? uops_1_lrs1 : uops_0_lrs1; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1828 = 3'h2 == value_1 ? uops_2_lrs1 : _GEN_1827; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1829 = 3'h3 == value_1 ? uops_3_lrs1 : _GEN_1828; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1830 = 3'h4 == value_1 ? uops_4_lrs1 : _GEN_1829; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1831 = 3'h5 == value_1 ? uops_5_lrs1 : _GEN_1830; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] out_uop_lrs1 = 3'h6 == value_1 ? uops_6_lrs1 : _GEN_1831; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1834 = 3'h1 == value_1 ? uops_1_ldst : uops_0_ldst; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1835 = 3'h2 == value_1 ? uops_2_ldst : _GEN_1834; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1836 = 3'h3 == value_1 ? uops_3_ldst : _GEN_1835; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1837 = 3'h4 == value_1 ? uops_4_ldst : _GEN_1836; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1838 = 3'h5 == value_1 ? uops_5_ldst : _GEN_1837; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] out_uop_ldst = 3'h6 == value_1 ? uops_6_ldst : _GEN_1838; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1841 = 3'h1 == value_1 ? uops_1_ldst_is_rs1 : uops_0_ldst_is_rs1; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1842 = 3'h2 == value_1 ? uops_2_ldst_is_rs1 : _GEN_1841; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1843 = 3'h3 == value_1 ? uops_3_ldst_is_rs1 : _GEN_1842; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1844 = 3'h4 == value_1 ? uops_4_ldst_is_rs1 : _GEN_1843; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1845 = 3'h5 == value_1 ? uops_5_ldst_is_rs1 : _GEN_1844; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_ldst_is_rs1 = 3'h6 == value_1 ? uops_6_ldst_is_rs1 : _GEN_1845; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1848 = 3'h1 == value_1 ? uops_1_flush_on_commit : uops_0_flush_on_commit; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1849 = 3'h2 == value_1 ? uops_2_flush_on_commit : _GEN_1848; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1850 = 3'h3 == value_1 ? uops_3_flush_on_commit : _GEN_1849; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1851 = 3'h4 == value_1 ? uops_4_flush_on_commit : _GEN_1850; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1852 = 3'h5 == value_1 ? uops_5_flush_on_commit : _GEN_1851; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_flush_on_commit = 3'h6 == value_1 ? uops_6_flush_on_commit : _GEN_1852; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1855 = 3'h1 == value_1 ? uops_1_is_unique : uops_0_is_unique; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1856 = 3'h2 == value_1 ? uops_2_is_unique : _GEN_1855; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1857 = 3'h3 == value_1 ? uops_3_is_unique : _GEN_1856; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1858 = 3'h4 == value_1 ? uops_4_is_unique : _GEN_1857; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1859 = 3'h5 == value_1 ? uops_5_is_unique : _GEN_1858; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_is_unique = 3'h6 == value_1 ? uops_6_is_unique : _GEN_1859; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1862 = 3'h1 == value_1 ? uops_1_is_sys_pc2epc : uops_0_is_sys_pc2epc; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1863 = 3'h2 == value_1 ? uops_2_is_sys_pc2epc : _GEN_1862; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1864 = 3'h3 == value_1 ? uops_3_is_sys_pc2epc : _GEN_1863; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1865 = 3'h4 == value_1 ? uops_4_is_sys_pc2epc : _GEN_1864; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1866 = 3'h5 == value_1 ? uops_5_is_sys_pc2epc : _GEN_1865; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_is_sys_pc2epc = 3'h6 == value_1 ? uops_6_is_sys_pc2epc : _GEN_1866; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1869 = 3'h1 == value_1 ? uops_1_uses_stq : uops_0_uses_stq; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1870 = 3'h2 == value_1 ? uops_2_uses_stq : _GEN_1869; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1871 = 3'h3 == value_1 ? uops_3_uses_stq : _GEN_1870; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1872 = 3'h4 == value_1 ? uops_4_uses_stq : _GEN_1871; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1873 = 3'h5 == value_1 ? uops_5_uses_stq : _GEN_1872; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_uses_stq = 3'h6 == value_1 ? uops_6_uses_stq : _GEN_1873; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1876 = 3'h1 == value_1 ? uops_1_uses_ldq : uops_0_uses_ldq; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1877 = 3'h2 == value_1 ? uops_2_uses_ldq : _GEN_1876; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1878 = 3'h3 == value_1 ? uops_3_uses_ldq : _GEN_1877; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1879 = 3'h4 == value_1 ? uops_4_uses_ldq : _GEN_1878; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1880 = 3'h5 == value_1 ? uops_5_uses_ldq : _GEN_1879; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_uses_ldq = 3'h6 == value_1 ? uops_6_uses_ldq : _GEN_1880; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1883 = 3'h1 == value_1 ? uops_1_is_amo : uops_0_is_amo; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1884 = 3'h2 == value_1 ? uops_2_is_amo : _GEN_1883; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1885 = 3'h3 == value_1 ? uops_3_is_amo : _GEN_1884; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1886 = 3'h4 == value_1 ? uops_4_is_amo : _GEN_1885; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1887 = 3'h5 == value_1 ? uops_5_is_amo : _GEN_1886; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_is_amo = 3'h6 == value_1 ? uops_6_is_amo : _GEN_1887; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1890 = 3'h1 == value_1 ? uops_1_is_fencei : uops_0_is_fencei; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1891 = 3'h2 == value_1 ? uops_2_is_fencei : _GEN_1890; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1892 = 3'h3 == value_1 ? uops_3_is_fencei : _GEN_1891; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1893 = 3'h4 == value_1 ? uops_4_is_fencei : _GEN_1892; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1894 = 3'h5 == value_1 ? uops_5_is_fencei : _GEN_1893; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_is_fencei = 3'h6 == value_1 ? uops_6_is_fencei : _GEN_1894; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1897 = 3'h1 == value_1 ? uops_1_is_fence : uops_0_is_fence; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1898 = 3'h2 == value_1 ? uops_2_is_fence : _GEN_1897; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1899 = 3'h3 == value_1 ? uops_3_is_fence : _GEN_1898; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1900 = 3'h4 == value_1 ? uops_4_is_fence : _GEN_1899; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1901 = 3'h5 == value_1 ? uops_5_is_fence : _GEN_1900; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_is_fence = 3'h6 == value_1 ? uops_6_is_fence : _GEN_1901; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1904 = 3'h1 == value_1 ? uops_1_mem_signed : uops_0_mem_signed; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1905 = 3'h2 == value_1 ? uops_2_mem_signed : _GEN_1904; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1906 = 3'h3 == value_1 ? uops_3_mem_signed : _GEN_1905; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1907 = 3'h4 == value_1 ? uops_4_mem_signed : _GEN_1906; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1908 = 3'h5 == value_1 ? uops_5_mem_signed : _GEN_1907; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_mem_signed = 3'h6 == value_1 ? uops_6_mem_signed : _GEN_1908; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1911 = 3'h1 == value_1 ? uops_1_mem_size : uops_0_mem_size; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1912 = 3'h2 == value_1 ? uops_2_mem_size : _GEN_1911; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1913 = 3'h3 == value_1 ? uops_3_mem_size : _GEN_1912; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1914 = 3'h4 == value_1 ? uops_4_mem_size : _GEN_1913; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1915 = 3'h5 == value_1 ? uops_5_mem_size : _GEN_1914; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] out_uop_mem_size = 3'h6 == value_1 ? uops_6_mem_size : _GEN_1915; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1918 = 3'h1 == value_1 ? uops_1_mem_cmd : uops_0_mem_cmd; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1919 = 3'h2 == value_1 ? uops_2_mem_cmd : _GEN_1918; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1920 = 3'h3 == value_1 ? uops_3_mem_cmd : _GEN_1919; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1921 = 3'h4 == value_1 ? uops_4_mem_cmd : _GEN_1920; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1922 = 3'h5 == value_1 ? uops_5_mem_cmd : _GEN_1921; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] out_uop_mem_cmd = 3'h6 == value_1 ? uops_6_mem_cmd : _GEN_1922; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1925 = 3'h1 == value_1 ? uops_1_bypassable : uops_0_bypassable; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1926 = 3'h2 == value_1 ? uops_2_bypassable : _GEN_1925; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1927 = 3'h3 == value_1 ? uops_3_bypassable : _GEN_1926; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1928 = 3'h4 == value_1 ? uops_4_bypassable : _GEN_1927; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1929 = 3'h5 == value_1 ? uops_5_bypassable : _GEN_1928; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_bypassable = 3'h6 == value_1 ? uops_6_bypassable : _GEN_1929; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_1932 = 3'h1 == value_1 ? uops_1_exc_cause : uops_0_exc_cause; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_1933 = 3'h2 == value_1 ? uops_2_exc_cause : _GEN_1932; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_1934 = 3'h3 == value_1 ? uops_3_exc_cause : _GEN_1933; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_1935 = 3'h4 == value_1 ? uops_4_exc_cause : _GEN_1934; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_1936 = 3'h5 == value_1 ? uops_5_exc_cause : _GEN_1935; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] out_uop_exc_cause = 3'h6 == value_1 ? uops_6_exc_cause : _GEN_1936; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1939 = 3'h1 == value_1 ? uops_1_exception : uops_0_exception; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1940 = 3'h2 == value_1 ? uops_2_exception : _GEN_1939; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1941 = 3'h3 == value_1 ? uops_3_exception : _GEN_1940; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1942 = 3'h4 == value_1 ? uops_4_exception : _GEN_1941; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1943 = 3'h5 == value_1 ? uops_5_exception : _GEN_1942; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_exception = 3'h6 == value_1 ? uops_6_exception : _GEN_1943; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1946 = 3'h1 == value_1 ? uops_1_stale_pdst : uops_0_stale_pdst; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1947 = 3'h2 == value_1 ? uops_2_stale_pdst : _GEN_1946; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1948 = 3'h3 == value_1 ? uops_3_stale_pdst : _GEN_1947; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1949 = 3'h4 == value_1 ? uops_4_stale_pdst : _GEN_1948; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1950 = 3'h5 == value_1 ? uops_5_stale_pdst : _GEN_1949; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] out_uop_stale_pdst = 3'h6 == value_1 ? uops_6_stale_pdst : _GEN_1950; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1953 = 3'h1 == value_1 ? uops_1_ppred_busy : uops_0_ppred_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1954 = 3'h2 == value_1 ? uops_2_ppred_busy : _GEN_1953; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1955 = 3'h3 == value_1 ? uops_3_ppred_busy : _GEN_1954; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1956 = 3'h4 == value_1 ? uops_4_ppred_busy : _GEN_1955; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1957 = 3'h5 == value_1 ? uops_5_ppred_busy : _GEN_1956; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_ppred_busy = 3'h6 == value_1 ? uops_6_ppred_busy : _GEN_1957; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1960 = 3'h1 == value_1 ? uops_1_prs3_busy : uops_0_prs3_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1961 = 3'h2 == value_1 ? uops_2_prs3_busy : _GEN_1960; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1962 = 3'h3 == value_1 ? uops_3_prs3_busy : _GEN_1961; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1963 = 3'h4 == value_1 ? uops_4_prs3_busy : _GEN_1962; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1964 = 3'h5 == value_1 ? uops_5_prs3_busy : _GEN_1963; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_prs3_busy = 3'h6 == value_1 ? uops_6_prs3_busy : _GEN_1964; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1967 = 3'h1 == value_1 ? uops_1_prs2_busy : uops_0_prs2_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1968 = 3'h2 == value_1 ? uops_2_prs2_busy : _GEN_1967; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1969 = 3'h3 == value_1 ? uops_3_prs2_busy : _GEN_1968; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1970 = 3'h4 == value_1 ? uops_4_prs2_busy : _GEN_1969; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1971 = 3'h5 == value_1 ? uops_5_prs2_busy : _GEN_1970; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_prs2_busy = 3'h6 == value_1 ? uops_6_prs2_busy : _GEN_1971; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1974 = 3'h1 == value_1 ? uops_1_prs1_busy : uops_0_prs1_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1975 = 3'h2 == value_1 ? uops_2_prs1_busy : _GEN_1974; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1976 = 3'h3 == value_1 ? uops_3_prs1_busy : _GEN_1975; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1977 = 3'h4 == value_1 ? uops_4_prs1_busy : _GEN_1976; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1978 = 3'h5 == value_1 ? uops_5_prs1_busy : _GEN_1977; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_prs1_busy = 3'h6 == value_1 ? uops_6_prs1_busy : _GEN_1978; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1981 = 3'h1 == value_1 ? uops_1_ppred : uops_0_ppred; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1982 = 3'h2 == value_1 ? uops_2_ppred : _GEN_1981; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1983 = 3'h3 == value_1 ? uops_3_ppred : _GEN_1982; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1984 = 3'h4 == value_1 ? uops_4_ppred : _GEN_1983; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1985 = 3'h5 == value_1 ? uops_5_ppred : _GEN_1984; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] out_uop_ppred = 3'h6 == value_1 ? uops_6_ppred : _GEN_1985; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1988 = 3'h1 == value_1 ? uops_1_prs3 : uops_0_prs3; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1989 = 3'h2 == value_1 ? uops_2_prs3 : _GEN_1988; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1990 = 3'h3 == value_1 ? uops_3_prs3 : _GEN_1989; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1991 = 3'h4 == value_1 ? uops_4_prs3 : _GEN_1990; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1992 = 3'h5 == value_1 ? uops_5_prs3 : _GEN_1991; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] out_uop_prs3 = 3'h6 == value_1 ? uops_6_prs3 : _GEN_1992; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1995 = 3'h1 == value_1 ? uops_1_prs2 : uops_0_prs2; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1996 = 3'h2 == value_1 ? uops_2_prs2 : _GEN_1995; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1997 = 3'h3 == value_1 ? uops_3_prs2 : _GEN_1996; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1998 = 3'h4 == value_1 ? uops_4_prs2 : _GEN_1997; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1999 = 3'h5 == value_1 ? uops_5_prs2 : _GEN_1998; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] out_uop_prs2 = 3'h6 == value_1 ? uops_6_prs2 : _GEN_1999; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2002 = 3'h1 == value_1 ? uops_1_prs1 : uops_0_prs1; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2003 = 3'h2 == value_1 ? uops_2_prs1 : _GEN_2002; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2004 = 3'h3 == value_1 ? uops_3_prs1 : _GEN_2003; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2005 = 3'h4 == value_1 ? uops_4_prs1 : _GEN_2004; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2006 = 3'h5 == value_1 ? uops_5_prs1 : _GEN_2005; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] out_uop_prs1 = 3'h6 == value_1 ? uops_6_prs1 : _GEN_2006; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2009 = 3'h1 == value_1 ? uops_1_pdst : uops_0_pdst; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2010 = 3'h2 == value_1 ? uops_2_pdst : _GEN_2009; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2011 = 3'h3 == value_1 ? uops_3_pdst : _GEN_2010; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2012 = 3'h4 == value_1 ? uops_4_pdst : _GEN_2011; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2013 = 3'h5 == value_1 ? uops_5_pdst : _GEN_2012; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] out_uop_pdst = 3'h6 == value_1 ? uops_6_pdst : _GEN_2013; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2016 = 3'h1 == value_1 ? uops_1_rxq_idx : uops_0_rxq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2017 = 3'h2 == value_1 ? uops_2_rxq_idx : _GEN_2016; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2018 = 3'h3 == value_1 ? uops_3_rxq_idx : _GEN_2017; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2019 = 3'h4 == value_1 ? uops_4_rxq_idx : _GEN_2018; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2020 = 3'h5 == value_1 ? uops_5_rxq_idx : _GEN_2019; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] out_uop_rxq_idx = 3'h6 == value_1 ? uops_6_rxq_idx : _GEN_2020; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2023 = 3'h1 == value_1 ? uops_1_stq_idx : uops_0_stq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2024 = 3'h2 == value_1 ? uops_2_stq_idx : _GEN_2023; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2025 = 3'h3 == value_1 ? uops_3_stq_idx : _GEN_2024; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2026 = 3'h4 == value_1 ? uops_4_stq_idx : _GEN_2025; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2027 = 3'h5 == value_1 ? uops_5_stq_idx : _GEN_2026; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] out_uop_stq_idx = 3'h6 == value_1 ? uops_6_stq_idx : _GEN_2027; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2030 = 3'h1 == value_1 ? uops_1_ldq_idx : uops_0_ldq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2031 = 3'h2 == value_1 ? uops_2_ldq_idx : _GEN_2030; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2032 = 3'h3 == value_1 ? uops_3_ldq_idx : _GEN_2031; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2033 = 3'h4 == value_1 ? uops_4_ldq_idx : _GEN_2032; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2034 = 3'h5 == value_1 ? uops_5_ldq_idx : _GEN_2033; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] out_uop_ldq_idx = 3'h6 == value_1 ? uops_6_ldq_idx : _GEN_2034; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2037 = 3'h1 == value_1 ? uops_1_rob_idx : uops_0_rob_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2038 = 3'h2 == value_1 ? uops_2_rob_idx : _GEN_2037; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2039 = 3'h3 == value_1 ? uops_3_rob_idx : _GEN_2038; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2040 = 3'h4 == value_1 ? uops_4_rob_idx : _GEN_2039; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2041 = 3'h5 == value_1 ? uops_5_rob_idx : _GEN_2040; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] out_uop_rob_idx = 3'h6 == value_1 ? uops_6_rob_idx : _GEN_2041; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_2044 = 3'h1 == value_1 ? uops_1_csr_addr : uops_0_csr_addr; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_2045 = 3'h2 == value_1 ? uops_2_csr_addr : _GEN_2044; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_2046 = 3'h3 == value_1 ? uops_3_csr_addr : _GEN_2045; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_2047 = 3'h4 == value_1 ? uops_4_csr_addr : _GEN_2046; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_2048 = 3'h5 == value_1 ? uops_5_csr_addr : _GEN_2047; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] out_uop_csr_addr = 3'h6 == value_1 ? uops_6_csr_addr : _GEN_2048; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_2051 = 3'h1 == value_1 ? uops_1_imm_packed : uops_0_imm_packed; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_2052 = 3'h2 == value_1 ? uops_2_imm_packed : _GEN_2051; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_2053 = 3'h3 == value_1 ? uops_3_imm_packed : _GEN_2052; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_2054 = 3'h4 == value_1 ? uops_4_imm_packed : _GEN_2053; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_2055 = 3'h5 == value_1 ? uops_5_imm_packed : _GEN_2054; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] out_uop_imm_packed = 3'h6 == value_1 ? uops_6_imm_packed : _GEN_2055; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2058 = 3'h1 == value_1 ? uops_1_taken : uops_0_taken; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2059 = 3'h2 == value_1 ? uops_2_taken : _GEN_2058; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2060 = 3'h3 == value_1 ? uops_3_taken : _GEN_2059; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2061 = 3'h4 == value_1 ? uops_4_taken : _GEN_2060; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2062 = 3'h5 == value_1 ? uops_5_taken : _GEN_2061; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_taken = 3'h6 == value_1 ? uops_6_taken : _GEN_2062; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2065 = 3'h1 == value_1 ? uops_1_pc_lob : uops_0_pc_lob; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2066 = 3'h2 == value_1 ? uops_2_pc_lob : _GEN_2065; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2067 = 3'h3 == value_1 ? uops_3_pc_lob : _GEN_2066; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2068 = 3'h4 == value_1 ? uops_4_pc_lob : _GEN_2067; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2069 = 3'h5 == value_1 ? uops_5_pc_lob : _GEN_2068; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] out_uop_pc_lob = 3'h6 == value_1 ? uops_6_pc_lob : _GEN_2069; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2072 = 3'h1 == value_1 ? uops_1_edge_inst : uops_0_edge_inst; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2073 = 3'h2 == value_1 ? uops_2_edge_inst : _GEN_2072; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2074 = 3'h3 == value_1 ? uops_3_edge_inst : _GEN_2073; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2075 = 3'h4 == value_1 ? uops_4_edge_inst : _GEN_2074; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2076 = 3'h5 == value_1 ? uops_5_edge_inst : _GEN_2075; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_edge_inst = 3'h6 == value_1 ? uops_6_edge_inst : _GEN_2076; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2079 = 3'h1 == value_1 ? uops_1_ftq_idx : uops_0_ftq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2080 = 3'h2 == value_1 ? uops_2_ftq_idx : _GEN_2079; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2081 = 3'h3 == value_1 ? uops_3_ftq_idx : _GEN_2080; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2082 = 3'h4 == value_1 ? uops_4_ftq_idx : _GEN_2081; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_2083 = 3'h5 == value_1 ? uops_5_ftq_idx : _GEN_2082; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] out_uop_ftq_idx = 3'h6 == value_1 ? uops_6_ftq_idx : _GEN_2083; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2086 = 3'h1 == value_1 ? uops_1_br_tag : uops_0_br_tag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2087 = 3'h2 == value_1 ? uops_2_br_tag : _GEN_2086; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2088 = 3'h3 == value_1 ? uops_3_br_tag : _GEN_2087; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2089 = 3'h4 == value_1 ? uops_4_br_tag : _GEN_2088; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2090 = 3'h5 == value_1 ? uops_5_br_tag : _GEN_2089; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] out_uop_br_tag = 3'h6 == value_1 ? uops_6_br_tag : _GEN_2090; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_2093 = 3'h1 == value_1 ? uops_1_br_mask : uops_0_br_mask; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_2094 = 3'h2 == value_1 ? uops_2_br_mask : _GEN_2093; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_2095 = 3'h3 == value_1 ? uops_3_br_mask : _GEN_2094; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_2096 = 3'h4 == value_1 ? uops_4_br_mask : _GEN_2095; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_2097 = 3'h5 == value_1 ? uops_5_br_mask : _GEN_2096; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] out_uop_br_mask = 3'h6 == value_1 ? uops_6_br_mask : _GEN_2097; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2100 = 3'h1 == value_1 ? uops_1_is_sfb : uops_0_is_sfb; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2101 = 3'h2 == value_1 ? uops_2_is_sfb : _GEN_2100; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2102 = 3'h3 == value_1 ? uops_3_is_sfb : _GEN_2101; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2103 = 3'h4 == value_1 ? uops_4_is_sfb : _GEN_2102; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2104 = 3'h5 == value_1 ? uops_5_is_sfb : _GEN_2103; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_is_sfb = 3'h6 == value_1 ? uops_6_is_sfb : _GEN_2104; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2107 = 3'h1 == value_1 ? uops_1_is_jal : uops_0_is_jal; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2108 = 3'h2 == value_1 ? uops_2_is_jal : _GEN_2107; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2109 = 3'h3 == value_1 ? uops_3_is_jal : _GEN_2108; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2110 = 3'h4 == value_1 ? uops_4_is_jal : _GEN_2109; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2111 = 3'h5 == value_1 ? uops_5_is_jal : _GEN_2110; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_is_jal = 3'h6 == value_1 ? uops_6_is_jal : _GEN_2111; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2114 = 3'h1 == value_1 ? uops_1_is_jalr : uops_0_is_jalr; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2115 = 3'h2 == value_1 ? uops_2_is_jalr : _GEN_2114; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2116 = 3'h3 == value_1 ? uops_3_is_jalr : _GEN_2115; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2117 = 3'h4 == value_1 ? uops_4_is_jalr : _GEN_2116; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2118 = 3'h5 == value_1 ? uops_5_is_jalr : _GEN_2117; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_is_jalr = 3'h6 == value_1 ? uops_6_is_jalr : _GEN_2118; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2121 = 3'h1 == value_1 ? uops_1_is_br : uops_0_is_br; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2122 = 3'h2 == value_1 ? uops_2_is_br : _GEN_2121; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2123 = 3'h3 == value_1 ? uops_3_is_br : _GEN_2122; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2124 = 3'h4 == value_1 ? uops_4_is_br : _GEN_2123; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2125 = 3'h5 == value_1 ? uops_5_is_br : _GEN_2124; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_is_br = 3'h6 == value_1 ? uops_6_is_br : _GEN_2125; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2128 = 3'h1 == value_1 ? uops_1_iw_p2_poisoned : uops_0_iw_p2_poisoned; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2129 = 3'h2 == value_1 ? uops_2_iw_p2_poisoned : _GEN_2128; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2130 = 3'h3 == value_1 ? uops_3_iw_p2_poisoned : _GEN_2129; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2131 = 3'h4 == value_1 ? uops_4_iw_p2_poisoned : _GEN_2130; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2132 = 3'h5 == value_1 ? uops_5_iw_p2_poisoned : _GEN_2131; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_iw_p2_poisoned = 3'h6 == value_1 ? uops_6_iw_p2_poisoned : _GEN_2132; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2135 = 3'h1 == value_1 ? uops_1_iw_p1_poisoned : uops_0_iw_p1_poisoned; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2136 = 3'h2 == value_1 ? uops_2_iw_p1_poisoned : _GEN_2135; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2137 = 3'h3 == value_1 ? uops_3_iw_p1_poisoned : _GEN_2136; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2138 = 3'h4 == value_1 ? uops_4_iw_p1_poisoned : _GEN_2137; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2139 = 3'h5 == value_1 ? uops_5_iw_p1_poisoned : _GEN_2138; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_iw_p1_poisoned = 3'h6 == value_1 ? uops_6_iw_p1_poisoned : _GEN_2139; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2142 = 3'h1 == value_1 ? uops_1_iw_state : uops_0_iw_state; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2143 = 3'h2 == value_1 ? uops_2_iw_state : _GEN_2142; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2144 = 3'h3 == value_1 ? uops_3_iw_state : _GEN_2143; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2145 = 3'h4 == value_1 ? uops_4_iw_state : _GEN_2144; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2146 = 3'h5 == value_1 ? uops_5_iw_state : _GEN_2145; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] out_uop_iw_state = 3'h6 == value_1 ? uops_6_iw_state : _GEN_2146; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2149 = 3'h1 == value_1 ? uops_1_ctrl_op3_sel : uops_0_ctrl_op3_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2150 = 3'h2 == value_1 ? uops_2_ctrl_op3_sel : _GEN_2149; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2151 = 3'h3 == value_1 ? uops_3_ctrl_op3_sel : _GEN_2150; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2152 = 3'h4 == value_1 ? uops_4_ctrl_op3_sel : _GEN_2151; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2153 = 3'h5 == value_1 ? uops_5_ctrl_op3_sel : _GEN_2152; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] out_uop_ctrl_op3_sel = 3'h6 == value_1 ? uops_6_ctrl_op3_sel : _GEN_2153; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2156 = 3'h1 == value_1 ? uops_1_ctrl_is_std : uops_0_ctrl_is_std; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2157 = 3'h2 == value_1 ? uops_2_ctrl_is_std : _GEN_2156; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2158 = 3'h3 == value_1 ? uops_3_ctrl_is_std : _GEN_2157; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2159 = 3'h4 == value_1 ? uops_4_ctrl_is_std : _GEN_2158; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2160 = 3'h5 == value_1 ? uops_5_ctrl_is_std : _GEN_2159; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_ctrl_is_std = 3'h6 == value_1 ? uops_6_ctrl_is_std : _GEN_2160; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2163 = 3'h1 == value_1 ? uops_1_ctrl_is_sta : uops_0_ctrl_is_sta; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2164 = 3'h2 == value_1 ? uops_2_ctrl_is_sta : _GEN_2163; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2165 = 3'h3 == value_1 ? uops_3_ctrl_is_sta : _GEN_2164; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2166 = 3'h4 == value_1 ? uops_4_ctrl_is_sta : _GEN_2165; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2167 = 3'h5 == value_1 ? uops_5_ctrl_is_sta : _GEN_2166; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_ctrl_is_sta = 3'h6 == value_1 ? uops_6_ctrl_is_sta : _GEN_2167; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2170 = 3'h1 == value_1 ? uops_1_ctrl_is_load : uops_0_ctrl_is_load; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2171 = 3'h2 == value_1 ? uops_2_ctrl_is_load : _GEN_2170; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2172 = 3'h3 == value_1 ? uops_3_ctrl_is_load : _GEN_2171; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2173 = 3'h4 == value_1 ? uops_4_ctrl_is_load : _GEN_2172; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2174 = 3'h5 == value_1 ? uops_5_ctrl_is_load : _GEN_2173; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_ctrl_is_load = 3'h6 == value_1 ? uops_6_ctrl_is_load : _GEN_2174; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2177 = 3'h1 == value_1 ? uops_1_ctrl_csr_cmd : uops_0_ctrl_csr_cmd; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2178 = 3'h2 == value_1 ? uops_2_ctrl_csr_cmd : _GEN_2177; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2179 = 3'h3 == value_1 ? uops_3_ctrl_csr_cmd : _GEN_2178; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2180 = 3'h4 == value_1 ? uops_4_ctrl_csr_cmd : _GEN_2179; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2181 = 3'h5 == value_1 ? uops_5_ctrl_csr_cmd : _GEN_2180; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] out_uop_ctrl_csr_cmd = 3'h6 == value_1 ? uops_6_ctrl_csr_cmd : _GEN_2181; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2184 = 3'h1 == value_1 ? uops_1_ctrl_fcn_dw : uops_0_ctrl_fcn_dw; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2185 = 3'h2 == value_1 ? uops_2_ctrl_fcn_dw : _GEN_2184; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2186 = 3'h3 == value_1 ? uops_3_ctrl_fcn_dw : _GEN_2185; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2187 = 3'h4 == value_1 ? uops_4_ctrl_fcn_dw : _GEN_2186; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2188 = 3'h5 == value_1 ? uops_5_ctrl_fcn_dw : _GEN_2187; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_ctrl_fcn_dw = 3'h6 == value_1 ? uops_6_ctrl_fcn_dw : _GEN_2188; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2191 = 3'h1 == value_1 ? uops_1_ctrl_op_fcn : uops_0_ctrl_op_fcn; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2192 = 3'h2 == value_1 ? uops_2_ctrl_op_fcn : _GEN_2191; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2193 = 3'h3 == value_1 ? uops_3_ctrl_op_fcn : _GEN_2192; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2194 = 3'h4 == value_1 ? uops_4_ctrl_op_fcn : _GEN_2193; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2195 = 3'h5 == value_1 ? uops_5_ctrl_op_fcn : _GEN_2194; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] out_uop_ctrl_op_fcn = 3'h6 == value_1 ? uops_6_ctrl_op_fcn : _GEN_2195; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2198 = 3'h1 == value_1 ? uops_1_ctrl_imm_sel : uops_0_ctrl_imm_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2199 = 3'h2 == value_1 ? uops_2_ctrl_imm_sel : _GEN_2198; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2200 = 3'h3 == value_1 ? uops_3_ctrl_imm_sel : _GEN_2199; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2201 = 3'h4 == value_1 ? uops_4_ctrl_imm_sel : _GEN_2200; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2202 = 3'h5 == value_1 ? uops_5_ctrl_imm_sel : _GEN_2201; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] out_uop_ctrl_imm_sel = 3'h6 == value_1 ? uops_6_ctrl_imm_sel : _GEN_2202; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2205 = 3'h1 == value_1 ? uops_1_ctrl_op2_sel : uops_0_ctrl_op2_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2206 = 3'h2 == value_1 ? uops_2_ctrl_op2_sel : _GEN_2205; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2207 = 3'h3 == value_1 ? uops_3_ctrl_op2_sel : _GEN_2206; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2208 = 3'h4 == value_1 ? uops_4_ctrl_op2_sel : _GEN_2207; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2209 = 3'h5 == value_1 ? uops_5_ctrl_op2_sel : _GEN_2208; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] out_uop_ctrl_op2_sel = 3'h6 == value_1 ? uops_6_ctrl_op2_sel : _GEN_2209; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2212 = 3'h1 == value_1 ? uops_1_ctrl_op1_sel : uops_0_ctrl_op1_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2213 = 3'h2 == value_1 ? uops_2_ctrl_op1_sel : _GEN_2212; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2214 = 3'h3 == value_1 ? uops_3_ctrl_op1_sel : _GEN_2213; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2215 = 3'h4 == value_1 ? uops_4_ctrl_op1_sel : _GEN_2214; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2216 = 3'h5 == value_1 ? uops_5_ctrl_op1_sel : _GEN_2215; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] out_uop_ctrl_op1_sel = 3'h6 == value_1 ? uops_6_ctrl_op1_sel : _GEN_2216; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2219 = 3'h1 == value_1 ? uops_1_ctrl_br_type : uops_0_ctrl_br_type; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2220 = 3'h2 == value_1 ? uops_2_ctrl_br_type : _GEN_2219; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2221 = 3'h3 == value_1 ? uops_3_ctrl_br_type : _GEN_2220; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2222 = 3'h4 == value_1 ? uops_4_ctrl_br_type : _GEN_2221; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2223 = 3'h5 == value_1 ? uops_5_ctrl_br_type : _GEN_2222; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] out_uop_ctrl_br_type = 3'h6 == value_1 ? uops_6_ctrl_br_type : _GEN_2223; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_2226 = 3'h1 == value_1 ? uops_1_fu_code : uops_0_fu_code; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_2227 = 3'h2 == value_1 ? uops_2_fu_code : _GEN_2226; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_2228 = 3'h3 == value_1 ? uops_3_fu_code : _GEN_2227; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_2229 = 3'h4 == value_1 ? uops_4_fu_code : _GEN_2228; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_2230 = 3'h5 == value_1 ? uops_5_fu_code : _GEN_2229; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] out_uop_fu_code = 3'h6 == value_1 ? uops_6_fu_code : _GEN_2230; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2233 = 3'h1 == value_1 ? uops_1_iq_type : uops_0_iq_type; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2234 = 3'h2 == value_1 ? uops_2_iq_type : _GEN_2233; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2235 = 3'h3 == value_1 ? uops_3_iq_type : _GEN_2234; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2236 = 3'h4 == value_1 ? uops_4_iq_type : _GEN_2235; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2237 = 3'h5 == value_1 ? uops_5_iq_type : _GEN_2236; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] out_uop_iq_type = 3'h6 == value_1 ? uops_6_iq_type : _GEN_2237; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_2240 = 3'h1 == value_1 ? uops_1_debug_pc : uops_0_debug_pc; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_2241 = 3'h2 == value_1 ? uops_2_debug_pc : _GEN_2240; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_2242 = 3'h3 == value_1 ? uops_3_debug_pc : _GEN_2241; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_2243 = 3'h4 == value_1 ? uops_4_debug_pc : _GEN_2242; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_2244 = 3'h5 == value_1 ? uops_5_debug_pc : _GEN_2243; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] out_uop_debug_pc = 3'h6 == value_1 ? uops_6_debug_pc : _GEN_2244; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2247 = 3'h1 == value_1 ? uops_1_is_rvc : uops_0_is_rvc; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2248 = 3'h2 == value_1 ? uops_2_is_rvc : _GEN_2247; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2249 = 3'h3 == value_1 ? uops_3_is_rvc : _GEN_2248; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2250 = 3'h4 == value_1 ? uops_4_is_rvc : _GEN_2249; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2251 = 3'h5 == value_1 ? uops_5_is_rvc : _GEN_2250; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_is_rvc = 3'h6 == value_1 ? uops_6_is_rvc : _GEN_2251; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_2254 = 3'h1 == value_1 ? uops_1_debug_inst : uops_0_debug_inst; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_2255 = 3'h2 == value_1 ? uops_2_debug_inst : _GEN_2254; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_2256 = 3'h3 == value_1 ? uops_3_debug_inst : _GEN_2255; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_2257 = 3'h4 == value_1 ? uops_4_debug_inst : _GEN_2256; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_2258 = 3'h5 == value_1 ? uops_5_debug_inst : _GEN_2257; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] out_uop_debug_inst = 3'h6 == value_1 ? uops_6_debug_inst : _GEN_2258; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_2261 = 3'h1 == value_1 ? uops_1_inst : uops_0_inst; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_2262 = 3'h2 == value_1 ? uops_2_inst : _GEN_2261; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_2263 = 3'h3 == value_1 ? uops_3_inst : _GEN_2262; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_2264 = 3'h4 == value_1 ? uops_4_inst : _GEN_2263; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_2265 = 3'h5 == value_1 ? uops_5_inst : _GEN_2264; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] out_uop_inst = 3'h6 == value_1 ? uops_6_inst : _GEN_2265; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2268 = 3'h1 == value_1 ? uops_1_uopc : uops_0_uopc; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2269 = 3'h2 == value_1 ? uops_2_uopc : _GEN_2268; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2270 = 3'h3 == value_1 ? uops_3_uopc : _GEN_2269; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2271 = 3'h4 == value_1 ? uops_4_uopc : _GEN_2270; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_2272 = 3'h5 == value_1 ? uops_5_uopc : _GEN_2271; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] out_uop_uopc = 3'h6 == value_1 ? uops_6_uopc : _GEN_2272; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2275 = 3'h1 == value_1 ? uops_1_address_num : uops_0_address_num; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2276 = 3'h2 == value_1 ? uops_2_address_num : _GEN_2275; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2277 = 3'h3 == value_1 ? uops_3_address_num : _GEN_2276; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2278 = 3'h4 == value_1 ? uops_4_address_num : _GEN_2277; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2279 = 3'h5 == value_1 ? uops_5_address_num : _GEN_2278; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] out_uop_address_num = 3'h6 == value_1 ? uops_6_address_num : _GEN_2279; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2282 = 3'h1 == value_1 ? uops_1_rob_inst_idx : uops_0_rob_inst_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2283 = 3'h2 == value_1 ? uops_2_rob_inst_idx : _GEN_2282; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2284 = 3'h3 == value_1 ? uops_3_rob_inst_idx : _GEN_2283; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2285 = 3'h4 == value_1 ? uops_4_rob_inst_idx : _GEN_2284; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2286 = 3'h5 == value_1 ? uops_5_rob_inst_idx : _GEN_2285; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] out_uop_rob_inst_idx = 3'h6 == value_1 ? uops_6_rob_inst_idx : _GEN_2286; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2289 = 3'h1 == value_1 ? uops_1_self_index : uops_0_self_index; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2290 = 3'h2 == value_1 ? uops_2_self_index : _GEN_2289; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2291 = 3'h3 == value_1 ? uops_3_self_index : _GEN_2290; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2292 = 3'h4 == value_1 ? uops_4_self_index : _GEN_2291; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2293 = 3'h5 == value_1 ? uops_5_self_index : _GEN_2292; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] out_uop_self_index = 3'h6 == value_1 ? uops_6_self_index : _GEN_2293; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2296 = 3'h1 == value_1 ? uops_1_split_num : uops_0_split_num; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2297 = 3'h2 == value_1 ? uops_2_split_num : _GEN_2296; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2298 = 3'h3 == value_1 ? uops_3_split_num : _GEN_2297; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2299 = 3'h4 == value_1 ? uops_4_split_num : _GEN_2298; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_2300 = 3'h5 == value_1 ? uops_5_split_num : _GEN_2299; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] out_uop_split_num = 3'h6 == value_1 ? uops_6_split_num : _GEN_2300; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2303 = 3'h1 == value_1 ? uops_1_op2_sel : uops_0_op2_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2304 = 3'h2 == value_1 ? uops_2_op2_sel : _GEN_2303; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2305 = 3'h3 == value_1 ? uops_3_op2_sel : _GEN_2304; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2306 = 3'h4 == value_1 ? uops_4_op2_sel : _GEN_2305; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2307 = 3'h5 == value_1 ? uops_5_op2_sel : _GEN_2306; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] out_uop_op2_sel = 3'h6 == value_1 ? uops_6_op2_sel : _GEN_2307; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2310 = 3'h1 == value_1 ? uops_1_op1_sel : uops_0_op1_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2311 = 3'h2 == value_1 ? uops_2_op1_sel : _GEN_2310; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2312 = 3'h3 == value_1 ? uops_3_op1_sel : _GEN_2311; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2313 = 3'h4 == value_1 ? uops_4_op1_sel : _GEN_2312; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2314 = 3'h5 == value_1 ? uops_5_op1_sel : _GEN_2313; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] out_uop_op1_sel = 3'h6 == value_1 ? uops_6_op1_sel : _GEN_2314; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2317 = 3'h1 == value_1 ? uops_1_stale_pflag : uops_0_stale_pflag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2318 = 3'h2 == value_1 ? uops_2_stale_pflag : _GEN_2317; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2319 = 3'h3 == value_1 ? uops_3_stale_pflag : _GEN_2318; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2320 = 3'h4 == value_1 ? uops_4_stale_pflag : _GEN_2319; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2321 = 3'h5 == value_1 ? uops_5_stale_pflag : _GEN_2320; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] out_uop_stale_pflag = 3'h6 == value_1 ? uops_6_stale_pflag : _GEN_2321; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2324 = 3'h1 == value_1 ? uops_1_pflag_busy : uops_0_pflag_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2325 = 3'h2 == value_1 ? uops_2_pflag_busy : _GEN_2324; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2326 = 3'h3 == value_1 ? uops_3_pflag_busy : _GEN_2325; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2327 = 3'h4 == value_1 ? uops_4_pflag_busy : _GEN_2326; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2328 = 3'h5 == value_1 ? uops_5_pflag_busy : _GEN_2327; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_pflag_busy = 3'h6 == value_1 ? uops_6_pflag_busy : _GEN_2328; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2331 = 3'h1 == value_1 ? uops_1_pwflag : uops_0_pwflag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2332 = 3'h2 == value_1 ? uops_2_pwflag : _GEN_2331; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2333 = 3'h3 == value_1 ? uops_3_pwflag : _GEN_2332; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2334 = 3'h4 == value_1 ? uops_4_pwflag : _GEN_2333; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2335 = 3'h5 == value_1 ? uops_5_pwflag : _GEN_2334; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] out_uop_pwflag = 3'h6 == value_1 ? uops_6_pwflag : _GEN_2335; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2338 = 3'h1 == value_1 ? uops_1_prflag : uops_0_prflag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2339 = 3'h2 == value_1 ? uops_2_prflag : _GEN_2338; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2340 = 3'h3 == value_1 ? uops_3_prflag : _GEN_2339; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2341 = 3'h4 == value_1 ? uops_4_prflag : _GEN_2340; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_2342 = 3'h5 == value_1 ? uops_5_prflag : _GEN_2341; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] out_uop_prflag = 3'h6 == value_1 ? uops_6_prflag : _GEN_2342; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2345 = 3'h1 == value_1 ? uops_1_wflag : uops_0_wflag; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2346 = 3'h2 == value_1 ? uops_2_wflag : _GEN_2345; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2347 = 3'h3 == value_1 ? uops_3_wflag : _GEN_2346; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2348 = 3'h4 == value_1 ? uops_4_wflag : _GEN_2347; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2349 = 3'h5 == value_1 ? uops_5_wflag : _GEN_2348; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_wflag = 3'h6 == value_1 ? uops_6_wflag : _GEN_2349; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2352 = 3'h1 == value_1 ? uops_1_rflag : uops_0_rflag; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2353 = 3'h2 == value_1 ? uops_2_rflag : _GEN_2352; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2354 = 3'h3 == value_1 ? uops_3_rflag : _GEN_2353; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2355 = 3'h4 == value_1 ? uops_4_rflag : _GEN_2354; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2356 = 3'h5 == value_1 ? uops_5_rflag : _GEN_2355; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_rflag = 3'h6 == value_1 ? uops_6_rflag : _GEN_2356; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2359 = 3'h1 == value_1 ? uops_1_lrs3_rtype : uops_0_lrs3_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2360 = 3'h2 == value_1 ? uops_2_lrs3_rtype : _GEN_2359; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2361 = 3'h3 == value_1 ? uops_3_lrs3_rtype : _GEN_2360; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2362 = 3'h4 == value_1 ? uops_4_lrs3_rtype : _GEN_2361; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_2363 = 3'h5 == value_1 ? uops_5_lrs3_rtype : _GEN_2362; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] out_uop_lrs3_rtype = 3'h6 == value_1 ? uops_6_lrs3_rtype : _GEN_2363; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2366 = 3'h1 == value_1 ? uops_1_shift : uops_0_shift; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2367 = 3'h2 == value_1 ? uops_2_shift : _GEN_2366; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2368 = 3'h3 == value_1 ? uops_3_shift : _GEN_2367; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2369 = 3'h4 == value_1 ? uops_4_shift : _GEN_2368; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_2370 = 3'h5 == value_1 ? uops_5_shift : _GEN_2369; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] out_uop_shift = 3'h6 == value_1 ? uops_6_shift : _GEN_2370; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2373 = 3'h1 == value_1 ? uops_1_is_unicore : uops_0_is_unicore; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2374 = 3'h2 == value_1 ? uops_2_is_unicore : _GEN_2373; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2375 = 3'h3 == value_1 ? uops_3_is_unicore : _GEN_2374; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2376 = 3'h4 == value_1 ? uops_4_is_unicore : _GEN_2375; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2377 = 3'h5 == value_1 ? uops_5_is_unicore : _GEN_2376; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_is_unicore = 3'h6 == value_1 ? uops_6_is_unicore : _GEN_2377; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2380 = 3'h1 == value_1 ? uops_1_switch_off : uops_0_switch_off; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2381 = 3'h2 == value_1 ? uops_2_switch_off : _GEN_2380; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2382 = 3'h3 == value_1 ? uops_3_switch_off : _GEN_2381; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2383 = 3'h4 == value_1 ? uops_4_switch_off : _GEN_2382; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2384 = 3'h5 == value_1 ? uops_5_switch_off : _GEN_2383; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_switch_off = 3'h6 == value_1 ? uops_6_switch_off : _GEN_2384; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2387 = 3'h1 == value_1 ? uops_1_switch : uops_0_switch; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2388 = 3'h2 == value_1 ? uops_2_switch : _GEN_2387; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2389 = 3'h3 == value_1 ? uops_3_switch : _GEN_2388; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2390 = 3'h4 == value_1 ? uops_4_switch : _GEN_2389; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_2391 = 3'h5 == value_1 ? uops_5_switch : _GEN_2390; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_switch = 3'h6 == value_1 ? uops_6_switch : _GEN_2391; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _T_76 = io_brupdate_b1_mispredict_mask & out_uop_br_mask; // @[util.scala 175:51]
  wire  _T_77 = _T_76 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_84 = out_uop_br_mask & _T_14; // @[util.scala 142:25]
  wire [31:0] out_fflagdata_bits_fflag = ram_fflagdata_bits_fflag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflagdata_bits_uop_debug_tsrc = ram_fflagdata_bits_uop_debug_tsrc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflagdata_bits_uop_debug_fsrc = ram_fflagdata_bits_uop_debug_fsrc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_bp_xcpt_if = ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_bp_debug_if = ram_fflagdata_bits_uop_bp_debug_if_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_xcpt_ma_if = ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_xcpt_ae_if = ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_xcpt_pf_if = ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_fp_single = ram_fflagdata_bits_uop_fp_single_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_fp_val = ram_fflagdata_bits_uop_fp_val_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_frs3_en = ram_fflagdata_bits_uop_frs3_en_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflagdata_bits_uop_lrs2_rtype = ram_fflagdata_bits_uop_lrs2_rtype_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflagdata_bits_uop_lrs1_rtype = ram_fflagdata_bits_uop_lrs1_rtype_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflagdata_bits_uop_dst_rtype = ram_fflagdata_bits_uop_dst_rtype_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_ldst_val = ram_fflagdata_bits_uop_ldst_val_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflagdata_bits_uop_lrs3 = ram_fflagdata_bits_uop_lrs3_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflagdata_bits_uop_lrs2 = ram_fflagdata_bits_uop_lrs2_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflagdata_bits_uop_lrs1 = ram_fflagdata_bits_uop_lrs1_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflagdata_bits_uop_ldst = ram_fflagdata_bits_uop_ldst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_ldst_is_rs1 = ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_flush_on_commit = ram_fflagdata_bits_uop_flush_on_commit_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_is_unique = ram_fflagdata_bits_uop_is_unique_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_is_sys_pc2epc = ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_uses_stq = ram_fflagdata_bits_uop_uses_stq_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_uses_ldq = ram_fflagdata_bits_uop_uses_ldq_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_is_amo = ram_fflagdata_bits_uop_is_amo_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_is_fencei = ram_fflagdata_bits_uop_is_fencei_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_is_fence = ram_fflagdata_bits_uop_is_fence_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_mem_signed = ram_fflagdata_bits_uop_mem_signed_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflagdata_bits_uop_mem_size = ram_fflagdata_bits_uop_mem_size_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [4:0] out_fflagdata_bits_uop_mem_cmd = ram_fflagdata_bits_uop_mem_cmd_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_bypassable = ram_fflagdata_bits_uop_bypassable_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [63:0] out_fflagdata_bits_uop_exc_cause = ram_fflagdata_bits_uop_exc_cause_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_exception = ram_fflagdata_bits_uop_exception_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflagdata_bits_uop_stale_pdst = ram_fflagdata_bits_uop_stale_pdst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_ppred_busy = ram_fflagdata_bits_uop_ppred_busy_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_prs3_busy = ram_fflagdata_bits_uop_prs3_busy_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_prs2_busy = ram_fflagdata_bits_uop_prs2_busy_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_prs1_busy = ram_fflagdata_bits_uop_prs1_busy_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [4:0] out_fflagdata_bits_uop_ppred = ram_fflagdata_bits_uop_ppred_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflagdata_bits_uop_prs3 = ram_fflagdata_bits_uop_prs3_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflagdata_bits_uop_prs2 = ram_fflagdata_bits_uop_prs2_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflagdata_bits_uop_prs1 = ram_fflagdata_bits_uop_prs1_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflagdata_bits_uop_pdst = ram_fflagdata_bits_uop_pdst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflagdata_bits_uop_rxq_idx = ram_fflagdata_bits_uop_rxq_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [4:0] out_fflagdata_bits_uop_stq_idx = ram_fflagdata_bits_uop_stq_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [4:0] out_fflagdata_bits_uop_ldq_idx = ram_fflagdata_bits_uop_ldq_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflagdata_bits_uop_rob_idx = ram_fflagdata_bits_uop_rob_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [11:0] out_fflagdata_bits_uop_csr_addr = ram_fflagdata_bits_uop_csr_addr_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [19:0] out_fflagdata_bits_uop_imm_packed = ram_fflagdata_bits_uop_imm_packed_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_taken = ram_fflagdata_bits_uop_taken_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflagdata_bits_uop_pc_lob = ram_fflagdata_bits_uop_pc_lob_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_edge_inst = ram_fflagdata_bits_uop_edge_inst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [4:0] out_fflagdata_bits_uop_ftq_idx = ram_fflagdata_bits_uop_ftq_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflagdata_bits_uop_br_tag = ram_fflagdata_bits_uop_br_tag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [11:0] out_fflagdata_bits_uop_br_mask = ram_fflagdata_bits_uop_br_mask_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_is_sfb = ram_fflagdata_bits_uop_is_sfb_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_is_jal = ram_fflagdata_bits_uop_is_jal_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_is_jalr = ram_fflagdata_bits_uop_is_jalr_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_is_br = ram_fflagdata_bits_uop_is_br_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_iw_p2_poisoned = ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_iw_p1_poisoned = ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflagdata_bits_uop_iw_state = ram_fflagdata_bits_uop_iw_state_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflagdata_bits_uop_ctrl_op3_sel = ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_ctrl_is_std = ram_fflagdata_bits_uop_ctrl_is_std_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_ctrl_is_sta = ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_ctrl_is_load = ram_fflagdata_bits_uop_ctrl_is_load_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [2:0] out_fflagdata_bits_uop_ctrl_csr_cmd = ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_ctrl_fcn_dw = ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflagdata_bits_uop_ctrl_op_fcn = ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [2:0] out_fflagdata_bits_uop_ctrl_imm_sel = ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [2:0] out_fflagdata_bits_uop_ctrl_op2_sel = ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflagdata_bits_uop_ctrl_op1_sel = ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflagdata_bits_uop_ctrl_br_type = ram_fflagdata_bits_uop_ctrl_br_type_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [9:0] out_fflagdata_bits_uop_fu_code = ram_fflagdata_bits_uop_fu_code_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [2:0] out_fflagdata_bits_uop_iq_type = ram_fflagdata_bits_uop_iq_type_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [39:0] out_fflagdata_bits_uop_debug_pc = ram_fflagdata_bits_uop_debug_pc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_is_rvc = ram_fflagdata_bits_uop_is_rvc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [31:0] out_fflagdata_bits_uop_debug_inst = ram_fflagdata_bits_uop_debug_inst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [31:0] out_fflagdata_bits_uop_inst = ram_fflagdata_bits_uop_inst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflagdata_bits_uop_uopc = ram_fflagdata_bits_uop_uopc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflagdata_bits_uop_address_num = ram_fflagdata_bits_uop_address_num_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflagdata_bits_uop_rob_inst_idx = ram_fflagdata_bits_uop_rob_inst_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflagdata_bits_uop_self_index = ram_fflagdata_bits_uop_self_index_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflagdata_bits_uop_split_num = ram_fflagdata_bits_uop_split_num_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflagdata_bits_uop_op2_sel = ram_fflagdata_bits_uop_op2_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflagdata_bits_uop_op1_sel = ram_fflagdata_bits_uop_op1_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflagdata_bits_uop_stale_pflag = ram_fflagdata_bits_uop_stale_pflag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_pflag_busy = ram_fflagdata_bits_uop_pflag_busy_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflagdata_bits_uop_pwflag = ram_fflagdata_bits_uop_pwflag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflagdata_bits_uop_prflag = ram_fflagdata_bits_uop_prflag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_wflag = ram_fflagdata_bits_uop_wflag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_rflag = ram_fflagdata_bits_uop_rflag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflagdata_bits_uop_lrs3_rtype = ram_fflagdata_bits_uop_lrs3_rtype_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [2:0] out_fflagdata_bits_uop_shift = ram_fflagdata_bits_uop_shift_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_is_unicore = ram_fflagdata_bits_uop_is_unicore_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_switch_off = ram_fflagdata_bits_uop_switch_off_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_bits_uop_switch = ram_fflagdata_bits_uop_switch_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflagdata_valid = ram_fflagdata_valid_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_flagdata = ram_flagdata_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [4:0] out_fflags_bits_flags = ram_fflags_bits_flags_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflags_bits_uop_debug_tsrc = ram_fflags_bits_uop_debug_tsrc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflags_bits_uop_debug_fsrc = ram_fflags_bits_uop_debug_fsrc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_bp_xcpt_if = ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_bp_debug_if = ram_fflags_bits_uop_bp_debug_if_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_xcpt_ma_if = ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_xcpt_ae_if = ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_xcpt_pf_if = ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_fp_single = ram_fflags_bits_uop_fp_single_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_fp_val = ram_fflags_bits_uop_fp_val_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_frs3_en = ram_fflags_bits_uop_frs3_en_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflags_bits_uop_lrs2_rtype = ram_fflags_bits_uop_lrs2_rtype_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflags_bits_uop_lrs1_rtype = ram_fflags_bits_uop_lrs1_rtype_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflags_bits_uop_dst_rtype = ram_fflags_bits_uop_dst_rtype_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_ldst_val = ram_fflags_bits_uop_ldst_val_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflags_bits_uop_lrs3 = ram_fflags_bits_uop_lrs3_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflags_bits_uop_lrs2 = ram_fflags_bits_uop_lrs2_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflags_bits_uop_lrs1 = ram_fflags_bits_uop_lrs1_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflags_bits_uop_ldst = ram_fflags_bits_uop_ldst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_ldst_is_rs1 = ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_flush_on_commit = ram_fflags_bits_uop_flush_on_commit_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_is_unique = ram_fflags_bits_uop_is_unique_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_is_sys_pc2epc = ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_uses_stq = ram_fflags_bits_uop_uses_stq_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_uses_ldq = ram_fflags_bits_uop_uses_ldq_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_is_amo = ram_fflags_bits_uop_is_amo_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_is_fencei = ram_fflags_bits_uop_is_fencei_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_is_fence = ram_fflags_bits_uop_is_fence_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_mem_signed = ram_fflags_bits_uop_mem_signed_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflags_bits_uop_mem_size = ram_fflags_bits_uop_mem_size_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [4:0] out_fflags_bits_uop_mem_cmd = ram_fflags_bits_uop_mem_cmd_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_bypassable = ram_fflags_bits_uop_bypassable_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [63:0] out_fflags_bits_uop_exc_cause = ram_fflags_bits_uop_exc_cause_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_exception = ram_fflags_bits_uop_exception_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflags_bits_uop_stale_pdst = ram_fflags_bits_uop_stale_pdst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_ppred_busy = ram_fflags_bits_uop_ppred_busy_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_prs3_busy = ram_fflags_bits_uop_prs3_busy_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_prs2_busy = ram_fflags_bits_uop_prs2_busy_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_prs1_busy = ram_fflags_bits_uop_prs1_busy_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [4:0] out_fflags_bits_uop_ppred = ram_fflags_bits_uop_ppred_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflags_bits_uop_prs3 = ram_fflags_bits_uop_prs3_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflags_bits_uop_prs2 = ram_fflags_bits_uop_prs2_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflags_bits_uop_prs1 = ram_fflags_bits_uop_prs1_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflags_bits_uop_pdst = ram_fflags_bits_uop_pdst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflags_bits_uop_rxq_idx = ram_fflags_bits_uop_rxq_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [4:0] out_fflags_bits_uop_stq_idx = ram_fflags_bits_uop_stq_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [4:0] out_fflags_bits_uop_ldq_idx = ram_fflags_bits_uop_ldq_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflags_bits_uop_rob_idx = ram_fflags_bits_uop_rob_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [11:0] out_fflags_bits_uop_csr_addr = ram_fflags_bits_uop_csr_addr_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [19:0] out_fflags_bits_uop_imm_packed = ram_fflags_bits_uop_imm_packed_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_taken = ram_fflags_bits_uop_taken_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflags_bits_uop_pc_lob = ram_fflags_bits_uop_pc_lob_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_edge_inst = ram_fflags_bits_uop_edge_inst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [4:0] out_fflags_bits_uop_ftq_idx = ram_fflags_bits_uop_ftq_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflags_bits_uop_br_tag = ram_fflags_bits_uop_br_tag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [11:0] out_fflags_bits_uop_br_mask = ram_fflags_bits_uop_br_mask_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_is_sfb = ram_fflags_bits_uop_is_sfb_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_is_jal = ram_fflags_bits_uop_is_jal_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_is_jalr = ram_fflags_bits_uop_is_jalr_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_is_br = ram_fflags_bits_uop_is_br_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_iw_p2_poisoned = ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_iw_p1_poisoned = ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflags_bits_uop_iw_state = ram_fflags_bits_uop_iw_state_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflags_bits_uop_ctrl_op3_sel = ram_fflags_bits_uop_ctrl_op3_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_ctrl_is_std = ram_fflags_bits_uop_ctrl_is_std_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_ctrl_is_sta = ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_ctrl_is_load = ram_fflags_bits_uop_ctrl_is_load_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [2:0] out_fflags_bits_uop_ctrl_csr_cmd = ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_ctrl_fcn_dw = ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflags_bits_uop_ctrl_op_fcn = ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [2:0] out_fflags_bits_uop_ctrl_imm_sel = ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [2:0] out_fflags_bits_uop_ctrl_op2_sel = ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflags_bits_uop_ctrl_op1_sel = ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflags_bits_uop_ctrl_br_type = ram_fflags_bits_uop_ctrl_br_type_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [9:0] out_fflags_bits_uop_fu_code = ram_fflags_bits_uop_fu_code_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [2:0] out_fflags_bits_uop_iq_type = ram_fflags_bits_uop_iq_type_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [39:0] out_fflags_bits_uop_debug_pc = ram_fflags_bits_uop_debug_pc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_is_rvc = ram_fflags_bits_uop_is_rvc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [31:0] out_fflags_bits_uop_debug_inst = ram_fflags_bits_uop_debug_inst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [31:0] out_fflags_bits_uop_inst = ram_fflags_bits_uop_inst_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [6:0] out_fflags_bits_uop_uopc = ram_fflags_bits_uop_uopc_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflags_bits_uop_address_num = ram_fflags_bits_uop_address_num_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflags_bits_uop_rob_inst_idx = ram_fflags_bits_uop_rob_inst_idx_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflags_bits_uop_self_index = ram_fflags_bits_uop_self_index_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [5:0] out_fflags_bits_uop_split_num = ram_fflags_bits_uop_split_num_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflags_bits_uop_op2_sel = ram_fflags_bits_uop_op2_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflags_bits_uop_op1_sel = ram_fflags_bits_uop_op1_sel_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflags_bits_uop_stale_pflag = ram_fflags_bits_uop_stale_pflag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_pflag_busy = ram_fflags_bits_uop_pflag_busy_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflags_bits_uop_pwflag = ram_fflags_bits_uop_pwflag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [3:0] out_fflags_bits_uop_prflag = ram_fflags_bits_uop_prflag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_wflag = ram_fflags_bits_uop_wflag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_rflag = ram_fflags_bits_uop_rflag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [1:0] out_fflags_bits_uop_lrs3_rtype = ram_fflags_bits_uop_lrs3_rtype_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [2:0] out_fflags_bits_uop_shift = ram_fflags_bits_uop_shift_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_is_unicore = ram_fflags_bits_uop_is_unicore_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_switch_off = ram_fflags_bits_uop_switch_off_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_bits_uop_switch = ram_fflags_bits_uop_switch_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_fflags_valid = ram_fflags_valid_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire  out_predicated = ram_predicated_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [64:0] out_data = ram_data_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  wire [2:0] _T_88 = value - value_1; // @[util.scala 595:40]
  wire [2:0] _T_89 = maybe_full ? 3'h7 : 3'h0; // @[util.scala 601:24]
  wire [2:0] _T_92 = 3'h7 + _T_88; // @[util.scala 604:40]
  wire [2:0] _T_93 = value_1 > value ? _T_92 : _T_88; // @[util.scala 603:24]
  assign ram_data_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_data_MPORT_1_data = ram_data[ram_data_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_data_MPORT_1_data = ram_data_MPORT_1_addr >= 3'h7 ? _RAND_1[64:0] : ram_data[ram_data_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_predicated_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_predicated_MPORT_1_data = ram_predicated[ram_predicated_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_predicated_MPORT_1_data = ram_predicated_MPORT_1_addr >= 3'h7 ? _RAND_3[0:0] :
    ram_predicated[ram_predicated_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_predicated_MPORT_data = io_enq_bits_predicated;
  assign ram_predicated_MPORT_addr = value;
  assign ram_predicated_MPORT_mask = 1'h1;
  assign ram_predicated_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_valid_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_valid_MPORT_1_data = ram_fflags_valid[ram_fflags_valid_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_valid_MPORT_1_data = ram_fflags_valid_MPORT_1_addr >= 3'h7 ? _RAND_5[0:0] :
    ram_fflags_valid[ram_fflags_valid_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_valid_MPORT_data = io_enq_bits_fflags_valid;
  assign ram_fflags_valid_MPORT_addr = value;
  assign ram_fflags_valid_MPORT_mask = 1'h1;
  assign ram_fflags_valid_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_switch_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_switch_MPORT_1_data = ram_fflags_bits_uop_switch[ram_fflags_bits_uop_switch_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_switch_MPORT_1_data = ram_fflags_bits_uop_switch_MPORT_1_addr >= 3'h7 ? _RAND_7[0:0] :
    ram_fflags_bits_uop_switch[ram_fflags_bits_uop_switch_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_switch_MPORT_data = io_enq_bits_fflags_bits_uop_switch;
  assign ram_fflags_bits_uop_switch_MPORT_addr = value;
  assign ram_fflags_bits_uop_switch_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_switch_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_switch_off_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_switch_off_MPORT_1_data =
    ram_fflags_bits_uop_switch_off[ram_fflags_bits_uop_switch_off_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_switch_off_MPORT_1_data = ram_fflags_bits_uop_switch_off_MPORT_1_addr >= 3'h7 ? _RAND_9[0
    :0] : ram_fflags_bits_uop_switch_off[ram_fflags_bits_uop_switch_off_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_switch_off_MPORT_data = io_enq_bits_fflags_bits_uop_switch_off;
  assign ram_fflags_bits_uop_switch_off_MPORT_addr = value;
  assign ram_fflags_bits_uop_switch_off_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_switch_off_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_is_unicore_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_unicore_MPORT_1_data =
    ram_fflags_bits_uop_is_unicore[ram_fflags_bits_uop_is_unicore_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_is_unicore_MPORT_1_data = ram_fflags_bits_uop_is_unicore_MPORT_1_addr >= 3'h7 ? _RAND_11[0
    :0] : ram_fflags_bits_uop_is_unicore[ram_fflags_bits_uop_is_unicore_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_unicore_MPORT_data = io_enq_bits_fflags_bits_uop_is_unicore;
  assign ram_fflags_bits_uop_is_unicore_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_unicore_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_unicore_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_shift_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_shift_MPORT_1_data = ram_fflags_bits_uop_shift[ram_fflags_bits_uop_shift_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_shift_MPORT_1_data = ram_fflags_bits_uop_shift_MPORT_1_addr >= 3'h7 ? _RAND_13[2:0] :
    ram_fflags_bits_uop_shift[ram_fflags_bits_uop_shift_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_shift_MPORT_data = io_enq_bits_fflags_bits_uop_shift;
  assign ram_fflags_bits_uop_shift_MPORT_addr = value;
  assign ram_fflags_bits_uop_shift_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_shift_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_lrs3_rtype_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs3_rtype_MPORT_1_data =
    ram_fflags_bits_uop_lrs3_rtype[ram_fflags_bits_uop_lrs3_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_lrs3_rtype_MPORT_1_data = ram_fflags_bits_uop_lrs3_rtype_MPORT_1_addr >= 3'h7 ? _RAND_15[1
    :0] : ram_fflags_bits_uop_lrs3_rtype[ram_fflags_bits_uop_lrs3_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs3_rtype_MPORT_data = io_enq_bits_fflags_bits_uop_lrs3_rtype;
  assign ram_fflags_bits_uop_lrs3_rtype_MPORT_addr = value;
  assign ram_fflags_bits_uop_lrs3_rtype_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_lrs3_rtype_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_rflag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rflag_MPORT_1_data = ram_fflags_bits_uop_rflag[ram_fflags_bits_uop_rflag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_rflag_MPORT_1_data = ram_fflags_bits_uop_rflag_MPORT_1_addr >= 3'h7 ? _RAND_17[0:0] :
    ram_fflags_bits_uop_rflag[ram_fflags_bits_uop_rflag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rflag_MPORT_data = io_enq_bits_fflags_bits_uop_rflag;
  assign ram_fflags_bits_uop_rflag_MPORT_addr = value;
  assign ram_fflags_bits_uop_rflag_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_rflag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_wflag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_wflag_MPORT_1_data = ram_fflags_bits_uop_wflag[ram_fflags_bits_uop_wflag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_wflag_MPORT_1_data = ram_fflags_bits_uop_wflag_MPORT_1_addr >= 3'h7 ? _RAND_19[0:0] :
    ram_fflags_bits_uop_wflag[ram_fflags_bits_uop_wflag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_wflag_MPORT_data = io_enq_bits_fflags_bits_uop_wflag;
  assign ram_fflags_bits_uop_wflag_MPORT_addr = value;
  assign ram_fflags_bits_uop_wflag_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_wflag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_prflag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prflag_MPORT_1_data = ram_fflags_bits_uop_prflag[ram_fflags_bits_uop_prflag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_prflag_MPORT_1_data = ram_fflags_bits_uop_prflag_MPORT_1_addr >= 3'h7 ? _RAND_21[3:0] :
    ram_fflags_bits_uop_prflag[ram_fflags_bits_uop_prflag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prflag_MPORT_data = io_enq_bits_fflags_bits_uop_prflag;
  assign ram_fflags_bits_uop_prflag_MPORT_addr = value;
  assign ram_fflags_bits_uop_prflag_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prflag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_pwflag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pwflag_MPORT_1_data = ram_fflags_bits_uop_pwflag[ram_fflags_bits_uop_pwflag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_pwflag_MPORT_1_data = ram_fflags_bits_uop_pwflag_MPORT_1_addr >= 3'h7 ? _RAND_23[3:0] :
    ram_fflags_bits_uop_pwflag[ram_fflags_bits_uop_pwflag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pwflag_MPORT_data = io_enq_bits_fflags_bits_uop_pwflag;
  assign ram_fflags_bits_uop_pwflag_MPORT_addr = value;
  assign ram_fflags_bits_uop_pwflag_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_pwflag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_pflag_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pflag_busy_MPORT_1_data =
    ram_fflags_bits_uop_pflag_busy[ram_fflags_bits_uop_pflag_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_pflag_busy_MPORT_1_data = ram_fflags_bits_uop_pflag_busy_MPORT_1_addr >= 3'h7 ? _RAND_25[0
    :0] : ram_fflags_bits_uop_pflag_busy[ram_fflags_bits_uop_pflag_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pflag_busy_MPORT_data = io_enq_bits_fflags_bits_uop_pflag_busy;
  assign ram_fflags_bits_uop_pflag_busy_MPORT_addr = value;
  assign ram_fflags_bits_uop_pflag_busy_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_pflag_busy_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_stale_pflag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_stale_pflag_MPORT_1_data =
    ram_fflags_bits_uop_stale_pflag[ram_fflags_bits_uop_stale_pflag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_stale_pflag_MPORT_1_data = ram_fflags_bits_uop_stale_pflag_MPORT_1_addr >= 3'h7 ? _RAND_27[
    3:0] : ram_fflags_bits_uop_stale_pflag[ram_fflags_bits_uop_stale_pflag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_stale_pflag_MPORT_data = io_enq_bits_fflags_bits_uop_stale_pflag;
  assign ram_fflags_bits_uop_stale_pflag_MPORT_addr = value;
  assign ram_fflags_bits_uop_stale_pflag_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_stale_pflag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_op1_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_op1_sel_MPORT_1_data =
    ram_fflags_bits_uop_op1_sel[ram_fflags_bits_uop_op1_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_op1_sel_MPORT_1_data = ram_fflags_bits_uop_op1_sel_MPORT_1_addr >= 3'h7 ? _RAND_29[3:0] :
    ram_fflags_bits_uop_op1_sel[ram_fflags_bits_uop_op1_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_op1_sel_MPORT_data = io_enq_bits_fflags_bits_uop_op1_sel;
  assign ram_fflags_bits_uop_op1_sel_MPORT_addr = value;
  assign ram_fflags_bits_uop_op1_sel_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_op1_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_op2_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_op2_sel_MPORT_1_data =
    ram_fflags_bits_uop_op2_sel[ram_fflags_bits_uop_op2_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_op2_sel_MPORT_1_data = ram_fflags_bits_uop_op2_sel_MPORT_1_addr >= 3'h7 ? _RAND_31[3:0] :
    ram_fflags_bits_uop_op2_sel[ram_fflags_bits_uop_op2_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_op2_sel_MPORT_data = io_enq_bits_fflags_bits_uop_op2_sel;
  assign ram_fflags_bits_uop_op2_sel_MPORT_addr = value;
  assign ram_fflags_bits_uop_op2_sel_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_op2_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_split_num_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_split_num_MPORT_1_data =
    ram_fflags_bits_uop_split_num[ram_fflags_bits_uop_split_num_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_split_num_MPORT_1_data = ram_fflags_bits_uop_split_num_MPORT_1_addr >= 3'h7 ? _RAND_33[5:0]
     : ram_fflags_bits_uop_split_num[ram_fflags_bits_uop_split_num_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_split_num_MPORT_data = io_enq_bits_fflags_bits_uop_split_num;
  assign ram_fflags_bits_uop_split_num_MPORT_addr = value;
  assign ram_fflags_bits_uop_split_num_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_split_num_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_self_index_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_self_index_MPORT_1_data =
    ram_fflags_bits_uop_self_index[ram_fflags_bits_uop_self_index_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_self_index_MPORT_1_data = ram_fflags_bits_uop_self_index_MPORT_1_addr >= 3'h7 ? _RAND_35[5
    :0] : ram_fflags_bits_uop_self_index[ram_fflags_bits_uop_self_index_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_self_index_MPORT_data = io_enq_bits_fflags_bits_uop_self_index;
  assign ram_fflags_bits_uop_self_index_MPORT_addr = value;
  assign ram_fflags_bits_uop_self_index_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_self_index_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_rob_inst_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rob_inst_idx_MPORT_1_data =
    ram_fflags_bits_uop_rob_inst_idx[ram_fflags_bits_uop_rob_inst_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_rob_inst_idx_MPORT_1_data = ram_fflags_bits_uop_rob_inst_idx_MPORT_1_addr >= 3'h7 ?
    _RAND_37[5:0] : ram_fflags_bits_uop_rob_inst_idx[ram_fflags_bits_uop_rob_inst_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rob_inst_idx_MPORT_data = io_enq_bits_fflags_bits_uop_rob_inst_idx;
  assign ram_fflags_bits_uop_rob_inst_idx_MPORT_addr = value;
  assign ram_fflags_bits_uop_rob_inst_idx_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_rob_inst_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_address_num_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_address_num_MPORT_1_data =
    ram_fflags_bits_uop_address_num[ram_fflags_bits_uop_address_num_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_address_num_MPORT_1_data = ram_fflags_bits_uop_address_num_MPORT_1_addr >= 3'h7 ? _RAND_39[
    5:0] : ram_fflags_bits_uop_address_num[ram_fflags_bits_uop_address_num_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_address_num_MPORT_data = io_enq_bits_fflags_bits_uop_address_num;
  assign ram_fflags_bits_uop_address_num_MPORT_addr = value;
  assign ram_fflags_bits_uop_address_num_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_address_num_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_uopc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uopc_MPORT_1_data = ram_fflags_bits_uop_uopc[ram_fflags_bits_uop_uopc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_uopc_MPORT_1_data = ram_fflags_bits_uop_uopc_MPORT_1_addr >= 3'h7 ? _RAND_41[6:0] :
    ram_fflags_bits_uop_uopc[ram_fflags_bits_uop_uopc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uopc_MPORT_data = io_enq_bits_fflags_bits_uop_uopc;
  assign ram_fflags_bits_uop_uopc_MPORT_addr = value;
  assign ram_fflags_bits_uop_uopc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_uopc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_inst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_inst_MPORT_1_data = ram_fflags_bits_uop_inst[ram_fflags_bits_uop_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_inst_MPORT_1_data = ram_fflags_bits_uop_inst_MPORT_1_addr >= 3'h7 ? _RAND_43[31:0] :
    ram_fflags_bits_uop_inst[ram_fflags_bits_uop_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_inst_MPORT_data = io_enq_bits_fflags_bits_uop_inst;
  assign ram_fflags_bits_uop_inst_MPORT_addr = value;
  assign ram_fflags_bits_uop_inst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_inst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_debug_inst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_inst_MPORT_1_data =
    ram_fflags_bits_uop_debug_inst[ram_fflags_bits_uop_debug_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_debug_inst_MPORT_1_data = ram_fflags_bits_uop_debug_inst_MPORT_1_addr >= 3'h7 ? _RAND_45[31
    :0] : ram_fflags_bits_uop_debug_inst[ram_fflags_bits_uop_debug_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_inst_MPORT_data = io_enq_bits_fflags_bits_uop_debug_inst;
  assign ram_fflags_bits_uop_debug_inst_MPORT_addr = value;
  assign ram_fflags_bits_uop_debug_inst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_debug_inst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_is_rvc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_rvc_MPORT_1_data = ram_fflags_bits_uop_is_rvc[ram_fflags_bits_uop_is_rvc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_is_rvc_MPORT_1_data = ram_fflags_bits_uop_is_rvc_MPORT_1_addr >= 3'h7 ? _RAND_47[0:0] :
    ram_fflags_bits_uop_is_rvc[ram_fflags_bits_uop_is_rvc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_rvc_MPORT_data = io_enq_bits_fflags_bits_uop_is_rvc;
  assign ram_fflags_bits_uop_is_rvc_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_rvc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_rvc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_debug_pc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_pc_MPORT_1_data =
    ram_fflags_bits_uop_debug_pc[ram_fflags_bits_uop_debug_pc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_debug_pc_MPORT_1_data = ram_fflags_bits_uop_debug_pc_MPORT_1_addr >= 3'h7 ? _RAND_49[39:0]
     : ram_fflags_bits_uop_debug_pc[ram_fflags_bits_uop_debug_pc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_pc_MPORT_data = io_enq_bits_fflags_bits_uop_debug_pc;
  assign ram_fflags_bits_uop_debug_pc_MPORT_addr = value;
  assign ram_fflags_bits_uop_debug_pc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_debug_pc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_iq_type_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iq_type_MPORT_1_data =
    ram_fflags_bits_uop_iq_type[ram_fflags_bits_uop_iq_type_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_iq_type_MPORT_1_data = ram_fflags_bits_uop_iq_type_MPORT_1_addr >= 3'h7 ? _RAND_51[2:0] :
    ram_fflags_bits_uop_iq_type[ram_fflags_bits_uop_iq_type_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iq_type_MPORT_data = io_enq_bits_fflags_bits_uop_iq_type;
  assign ram_fflags_bits_uop_iq_type_MPORT_addr = value;
  assign ram_fflags_bits_uop_iq_type_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_iq_type_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_fu_code_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fu_code_MPORT_1_data =
    ram_fflags_bits_uop_fu_code[ram_fflags_bits_uop_fu_code_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_fu_code_MPORT_1_data = ram_fflags_bits_uop_fu_code_MPORT_1_addr >= 3'h7 ? _RAND_53[9:0] :
    ram_fflags_bits_uop_fu_code[ram_fflags_bits_uop_fu_code_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fu_code_MPORT_data = io_enq_bits_fflags_bits_uop_fu_code;
  assign ram_fflags_bits_uop_fu_code_MPORT_addr = value;
  assign ram_fflags_bits_uop_fu_code_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_fu_code_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_br_type[ram_fflags_bits_uop_ctrl_br_type_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_1_data = ram_fflags_bits_uop_ctrl_br_type_MPORT_1_addr >= 3'h7 ?
    _RAND_55[3:0] : ram_fflags_bits_uop_ctrl_br_type[ram_fflags_bits_uop_ctrl_br_type_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_br_type;
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_op1_sel[ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_data = ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_addr >= 3'h7 ?
    _RAND_57[1:0] : ram_fflags_bits_uop_ctrl_op1_sel[ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_op1_sel;
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_op2_sel[ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_data = ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_addr >= 3'h7 ?
    _RAND_59[2:0] : ram_fflags_bits_uop_ctrl_op2_sel[ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_op2_sel;
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_imm_sel[ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_data = ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_addr >= 3'h7 ?
    _RAND_61[2:0] : ram_fflags_bits_uop_ctrl_imm_sel[ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_imm_sel;
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_op_fcn[ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_data = ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_addr >= 3'h7 ? _RAND_63[
    3:0] : ram_fflags_bits_uop_ctrl_op_fcn[ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_op_fcn;
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_fcn_dw[ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_data = ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_addr >= 3'h7 ? _RAND_65[
    0:0] : ram_fflags_bits_uop_ctrl_fcn_dw[ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_fcn_dw;
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_csr_cmd[ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_data = ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_addr >= 3'h7 ?
    _RAND_67[2:0] : ram_fflags_bits_uop_ctrl_csr_cmd[ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_csr_cmd;
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_is_load[ram_fflags_bits_uop_ctrl_is_load_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_1_data = ram_fflags_bits_uop_ctrl_is_load_MPORT_1_addr >= 3'h7 ?
    _RAND_69[0:0] : ram_fflags_bits_uop_ctrl_is_load[ram_fflags_bits_uop_ctrl_is_load_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_is_load;
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_is_sta[ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_data = ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_addr >= 3'h7 ? _RAND_71[
    0:0] : ram_fflags_bits_uop_ctrl_is_sta[ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_is_sta;
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_is_std[ram_fflags_bits_uop_ctrl_is_std_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_1_data = ram_fflags_bits_uop_ctrl_is_std_MPORT_1_addr >= 3'h7 ? _RAND_73[
    0:0] : ram_fflags_bits_uop_ctrl_is_std[ram_fflags_bits_uop_ctrl_is_std_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_is_std;
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ctrl_op3_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op3_sel_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_op3_sel[ram_fflags_bits_uop_ctrl_op3_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ctrl_op3_sel_MPORT_1_data = ram_fflags_bits_uop_ctrl_op3_sel_MPORT_1_addr >= 3'h7 ?
    _RAND_75[1:0] : ram_fflags_bits_uop_ctrl_op3_sel[ram_fflags_bits_uop_ctrl_op3_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op3_sel_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_op3_sel;
  assign ram_fflags_bits_uop_ctrl_op3_sel_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_op3_sel_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_op3_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_iw_state_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_state_MPORT_1_data =
    ram_fflags_bits_uop_iw_state[ram_fflags_bits_uop_iw_state_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_iw_state_MPORT_1_data = ram_fflags_bits_uop_iw_state_MPORT_1_addr >= 3'h7 ? _RAND_77[1:0]
     : ram_fflags_bits_uop_iw_state[ram_fflags_bits_uop_iw_state_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_state_MPORT_data = io_enq_bits_fflags_bits_uop_iw_state;
  assign ram_fflags_bits_uop_iw_state_MPORT_addr = value;
  assign ram_fflags_bits_uop_iw_state_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_iw_state_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_data =
    ram_fflags_bits_uop_iw_p1_poisoned[ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_data = ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_addr >= 3'h7 ?
    _RAND_79[0:0] : ram_fflags_bits_uop_iw_p1_poisoned[ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_data = io_enq_bits_fflags_bits_uop_iw_p1_poisoned;
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_addr = value;
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_data =
    ram_fflags_bits_uop_iw_p2_poisoned[ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_data = ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_addr >= 3'h7 ?
    _RAND_81[0:0] : ram_fflags_bits_uop_iw_p2_poisoned[ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_data = io_enq_bits_fflags_bits_uop_iw_p2_poisoned;
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_addr = value;
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_is_br_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_br_MPORT_1_data = ram_fflags_bits_uop_is_br[ram_fflags_bits_uop_is_br_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_is_br_MPORT_1_data = ram_fflags_bits_uop_is_br_MPORT_1_addr >= 3'h7 ? _RAND_83[0:0] :
    ram_fflags_bits_uop_is_br[ram_fflags_bits_uop_is_br_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_br_MPORT_data = io_enq_bits_fflags_bits_uop_is_br;
  assign ram_fflags_bits_uop_is_br_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_br_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_br_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_is_jalr_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_jalr_MPORT_1_data =
    ram_fflags_bits_uop_is_jalr[ram_fflags_bits_uop_is_jalr_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_is_jalr_MPORT_1_data = ram_fflags_bits_uop_is_jalr_MPORT_1_addr >= 3'h7 ? _RAND_85[0:0] :
    ram_fflags_bits_uop_is_jalr[ram_fflags_bits_uop_is_jalr_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_jalr_MPORT_data = io_enq_bits_fflags_bits_uop_is_jalr;
  assign ram_fflags_bits_uop_is_jalr_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_jalr_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_jalr_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_is_jal_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_jal_MPORT_1_data = ram_fflags_bits_uop_is_jal[ram_fflags_bits_uop_is_jal_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_is_jal_MPORT_1_data = ram_fflags_bits_uop_is_jal_MPORT_1_addr >= 3'h7 ? _RAND_87[0:0] :
    ram_fflags_bits_uop_is_jal[ram_fflags_bits_uop_is_jal_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_jal_MPORT_data = io_enq_bits_fflags_bits_uop_is_jal;
  assign ram_fflags_bits_uop_is_jal_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_jal_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_jal_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_is_sfb_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_sfb_MPORT_1_data = ram_fflags_bits_uop_is_sfb[ram_fflags_bits_uop_is_sfb_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_is_sfb_MPORT_1_data = ram_fflags_bits_uop_is_sfb_MPORT_1_addr >= 3'h7 ? _RAND_89[0:0] :
    ram_fflags_bits_uop_is_sfb[ram_fflags_bits_uop_is_sfb_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_sfb_MPORT_data = io_enq_bits_fflags_bits_uop_is_sfb;
  assign ram_fflags_bits_uop_is_sfb_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_sfb_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_sfb_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_br_mask_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_br_mask_MPORT_1_data =
    ram_fflags_bits_uop_br_mask[ram_fflags_bits_uop_br_mask_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_br_mask_MPORT_1_data = ram_fflags_bits_uop_br_mask_MPORT_1_addr >= 3'h7 ? _RAND_91[11:0] :
    ram_fflags_bits_uop_br_mask[ram_fflags_bits_uop_br_mask_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_br_mask_MPORT_data = io_enq_bits_fflags_bits_uop_br_mask;
  assign ram_fflags_bits_uop_br_mask_MPORT_addr = value;
  assign ram_fflags_bits_uop_br_mask_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_br_mask_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_br_tag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_br_tag_MPORT_1_data = ram_fflags_bits_uop_br_tag[ram_fflags_bits_uop_br_tag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_br_tag_MPORT_1_data = ram_fflags_bits_uop_br_tag_MPORT_1_addr >= 3'h7 ? _RAND_93[3:0] :
    ram_fflags_bits_uop_br_tag[ram_fflags_bits_uop_br_tag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_br_tag_MPORT_data = io_enq_bits_fflags_bits_uop_br_tag;
  assign ram_fflags_bits_uop_br_tag_MPORT_addr = value;
  assign ram_fflags_bits_uop_br_tag_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_br_tag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ftq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ftq_idx_MPORT_1_data =
    ram_fflags_bits_uop_ftq_idx[ram_fflags_bits_uop_ftq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ftq_idx_MPORT_1_data = ram_fflags_bits_uop_ftq_idx_MPORT_1_addr >= 3'h7 ? _RAND_95[4:0] :
    ram_fflags_bits_uop_ftq_idx[ram_fflags_bits_uop_ftq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ftq_idx_MPORT_data = io_enq_bits_fflags_bits_uop_ftq_idx;
  assign ram_fflags_bits_uop_ftq_idx_MPORT_addr = value;
  assign ram_fflags_bits_uop_ftq_idx_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ftq_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_edge_inst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_edge_inst_MPORT_1_data =
    ram_fflags_bits_uop_edge_inst[ram_fflags_bits_uop_edge_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_edge_inst_MPORT_1_data = ram_fflags_bits_uop_edge_inst_MPORT_1_addr >= 3'h7 ? _RAND_97[0:0]
     : ram_fflags_bits_uop_edge_inst[ram_fflags_bits_uop_edge_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_edge_inst_MPORT_data = io_enq_bits_fflags_bits_uop_edge_inst;
  assign ram_fflags_bits_uop_edge_inst_MPORT_addr = value;
  assign ram_fflags_bits_uop_edge_inst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_edge_inst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_pc_lob_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pc_lob_MPORT_1_data = ram_fflags_bits_uop_pc_lob[ram_fflags_bits_uop_pc_lob_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_pc_lob_MPORT_1_data = ram_fflags_bits_uop_pc_lob_MPORT_1_addr >= 3'h7 ? _RAND_99[5:0] :
    ram_fflags_bits_uop_pc_lob[ram_fflags_bits_uop_pc_lob_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pc_lob_MPORT_data = io_enq_bits_fflags_bits_uop_pc_lob;
  assign ram_fflags_bits_uop_pc_lob_MPORT_addr = value;
  assign ram_fflags_bits_uop_pc_lob_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_pc_lob_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_taken_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_taken_MPORT_1_data = ram_fflags_bits_uop_taken[ram_fflags_bits_uop_taken_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_taken_MPORT_1_data = ram_fflags_bits_uop_taken_MPORT_1_addr >= 3'h7 ? _RAND_101[0:0] :
    ram_fflags_bits_uop_taken[ram_fflags_bits_uop_taken_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_taken_MPORT_data = io_enq_bits_fflags_bits_uop_taken;
  assign ram_fflags_bits_uop_taken_MPORT_addr = value;
  assign ram_fflags_bits_uop_taken_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_taken_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_imm_packed_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_imm_packed_MPORT_1_data =
    ram_fflags_bits_uop_imm_packed[ram_fflags_bits_uop_imm_packed_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_imm_packed_MPORT_1_data = ram_fflags_bits_uop_imm_packed_MPORT_1_addr >= 3'h7 ? _RAND_103[
    19:0] : ram_fflags_bits_uop_imm_packed[ram_fflags_bits_uop_imm_packed_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_imm_packed_MPORT_data = io_enq_bits_fflags_bits_uop_imm_packed;
  assign ram_fflags_bits_uop_imm_packed_MPORT_addr = value;
  assign ram_fflags_bits_uop_imm_packed_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_imm_packed_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_csr_addr_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_csr_addr_MPORT_1_data =
    ram_fflags_bits_uop_csr_addr[ram_fflags_bits_uop_csr_addr_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_csr_addr_MPORT_1_data = ram_fflags_bits_uop_csr_addr_MPORT_1_addr >= 3'h7 ? _RAND_105[11:0]
     : ram_fflags_bits_uop_csr_addr[ram_fflags_bits_uop_csr_addr_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_csr_addr_MPORT_data = io_enq_bits_fflags_bits_uop_csr_addr;
  assign ram_fflags_bits_uop_csr_addr_MPORT_addr = value;
  assign ram_fflags_bits_uop_csr_addr_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_csr_addr_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_rob_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rob_idx_MPORT_1_data =
    ram_fflags_bits_uop_rob_idx[ram_fflags_bits_uop_rob_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_rob_idx_MPORT_1_data = ram_fflags_bits_uop_rob_idx_MPORT_1_addr >= 3'h7 ? _RAND_107[5:0] :
    ram_fflags_bits_uop_rob_idx[ram_fflags_bits_uop_rob_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rob_idx_MPORT_data = io_enq_bits_fflags_bits_uop_rob_idx;
  assign ram_fflags_bits_uop_rob_idx_MPORT_addr = value;
  assign ram_fflags_bits_uop_rob_idx_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_rob_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ldq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldq_idx_MPORT_1_data =
    ram_fflags_bits_uop_ldq_idx[ram_fflags_bits_uop_ldq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ldq_idx_MPORT_1_data = ram_fflags_bits_uop_ldq_idx_MPORT_1_addr >= 3'h7 ? _RAND_109[4:0] :
    ram_fflags_bits_uop_ldq_idx[ram_fflags_bits_uop_ldq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldq_idx_MPORT_data = io_enq_bits_fflags_bits_uop_ldq_idx;
  assign ram_fflags_bits_uop_ldq_idx_MPORT_addr = value;
  assign ram_fflags_bits_uop_ldq_idx_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ldq_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_stq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_stq_idx_MPORT_1_data =
    ram_fflags_bits_uop_stq_idx[ram_fflags_bits_uop_stq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_stq_idx_MPORT_1_data = ram_fflags_bits_uop_stq_idx_MPORT_1_addr >= 3'h7 ? _RAND_111[4:0] :
    ram_fflags_bits_uop_stq_idx[ram_fflags_bits_uop_stq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_stq_idx_MPORT_data = io_enq_bits_fflags_bits_uop_stq_idx;
  assign ram_fflags_bits_uop_stq_idx_MPORT_addr = value;
  assign ram_fflags_bits_uop_stq_idx_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_stq_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_rxq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rxq_idx_MPORT_1_data =
    ram_fflags_bits_uop_rxq_idx[ram_fflags_bits_uop_rxq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_rxq_idx_MPORT_1_data = ram_fflags_bits_uop_rxq_idx_MPORT_1_addr >= 3'h7 ? _RAND_113[1:0] :
    ram_fflags_bits_uop_rxq_idx[ram_fflags_bits_uop_rxq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rxq_idx_MPORT_data = io_enq_bits_fflags_bits_uop_rxq_idx;
  assign ram_fflags_bits_uop_rxq_idx_MPORT_addr = value;
  assign ram_fflags_bits_uop_rxq_idx_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_rxq_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_pdst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pdst_MPORT_1_data = ram_fflags_bits_uop_pdst[ram_fflags_bits_uop_pdst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_pdst_MPORT_1_data = ram_fflags_bits_uop_pdst_MPORT_1_addr >= 3'h7 ? _RAND_115[6:0] :
    ram_fflags_bits_uop_pdst[ram_fflags_bits_uop_pdst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pdst_MPORT_data = io_enq_bits_fflags_bits_uop_pdst;
  assign ram_fflags_bits_uop_pdst_MPORT_addr = value;
  assign ram_fflags_bits_uop_pdst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_pdst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_prs1_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs1_MPORT_1_data = ram_fflags_bits_uop_prs1[ram_fflags_bits_uop_prs1_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_prs1_MPORT_1_data = ram_fflags_bits_uop_prs1_MPORT_1_addr >= 3'h7 ? _RAND_117[6:0] :
    ram_fflags_bits_uop_prs1[ram_fflags_bits_uop_prs1_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs1_MPORT_data = io_enq_bits_fflags_bits_uop_prs1;
  assign ram_fflags_bits_uop_prs1_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs1_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs1_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_prs2_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs2_MPORT_1_data = ram_fflags_bits_uop_prs2[ram_fflags_bits_uop_prs2_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_prs2_MPORT_1_data = ram_fflags_bits_uop_prs2_MPORT_1_addr >= 3'h7 ? _RAND_119[6:0] :
    ram_fflags_bits_uop_prs2[ram_fflags_bits_uop_prs2_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs2_MPORT_data = io_enq_bits_fflags_bits_uop_prs2;
  assign ram_fflags_bits_uop_prs2_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs2_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs2_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_prs3_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs3_MPORT_1_data = ram_fflags_bits_uop_prs3[ram_fflags_bits_uop_prs3_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_prs3_MPORT_1_data = ram_fflags_bits_uop_prs3_MPORT_1_addr >= 3'h7 ? _RAND_121[6:0] :
    ram_fflags_bits_uop_prs3[ram_fflags_bits_uop_prs3_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs3_MPORT_data = io_enq_bits_fflags_bits_uop_prs3;
  assign ram_fflags_bits_uop_prs3_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs3_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs3_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ppred_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ppred_MPORT_1_data = ram_fflags_bits_uop_ppred[ram_fflags_bits_uop_ppred_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ppred_MPORT_1_data = ram_fflags_bits_uop_ppred_MPORT_1_addr >= 3'h7 ? _RAND_123[4:0] :
    ram_fflags_bits_uop_ppred[ram_fflags_bits_uop_ppred_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ppred_MPORT_data = io_enq_bits_fflags_bits_uop_ppred;
  assign ram_fflags_bits_uop_ppred_MPORT_addr = value;
  assign ram_fflags_bits_uop_ppred_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ppred_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_prs1_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs1_busy_MPORT_1_data =
    ram_fflags_bits_uop_prs1_busy[ram_fflags_bits_uop_prs1_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_prs1_busy_MPORT_1_data = ram_fflags_bits_uop_prs1_busy_MPORT_1_addr >= 3'h7 ? _RAND_125[0
    :0] : ram_fflags_bits_uop_prs1_busy[ram_fflags_bits_uop_prs1_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs1_busy_MPORT_data = io_enq_bits_fflags_bits_uop_prs1_busy;
  assign ram_fflags_bits_uop_prs1_busy_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs1_busy_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs1_busy_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_prs2_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs2_busy_MPORT_1_data =
    ram_fflags_bits_uop_prs2_busy[ram_fflags_bits_uop_prs2_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_prs2_busy_MPORT_1_data = ram_fflags_bits_uop_prs2_busy_MPORT_1_addr >= 3'h7 ? _RAND_127[0
    :0] : ram_fflags_bits_uop_prs2_busy[ram_fflags_bits_uop_prs2_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs2_busy_MPORT_data = io_enq_bits_fflags_bits_uop_prs2_busy;
  assign ram_fflags_bits_uop_prs2_busy_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs2_busy_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs2_busy_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_prs3_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs3_busy_MPORT_1_data =
    ram_fflags_bits_uop_prs3_busy[ram_fflags_bits_uop_prs3_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_prs3_busy_MPORT_1_data = ram_fflags_bits_uop_prs3_busy_MPORT_1_addr >= 3'h7 ? _RAND_129[0
    :0] : ram_fflags_bits_uop_prs3_busy[ram_fflags_bits_uop_prs3_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs3_busy_MPORT_data = io_enq_bits_fflags_bits_uop_prs3_busy;
  assign ram_fflags_bits_uop_prs3_busy_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs3_busy_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs3_busy_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ppred_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ppred_busy_MPORT_1_data =
    ram_fflags_bits_uop_ppred_busy[ram_fflags_bits_uop_ppred_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ppred_busy_MPORT_1_data = ram_fflags_bits_uop_ppred_busy_MPORT_1_addr >= 3'h7 ? _RAND_131[0
    :0] : ram_fflags_bits_uop_ppred_busy[ram_fflags_bits_uop_ppred_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ppred_busy_MPORT_data = io_enq_bits_fflags_bits_uop_ppred_busy;
  assign ram_fflags_bits_uop_ppred_busy_MPORT_addr = value;
  assign ram_fflags_bits_uop_ppred_busy_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ppred_busy_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_stale_pdst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_stale_pdst_MPORT_1_data =
    ram_fflags_bits_uop_stale_pdst[ram_fflags_bits_uop_stale_pdst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_stale_pdst_MPORT_1_data = ram_fflags_bits_uop_stale_pdst_MPORT_1_addr >= 3'h7 ? _RAND_133[6
    :0] : ram_fflags_bits_uop_stale_pdst[ram_fflags_bits_uop_stale_pdst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_stale_pdst_MPORT_data = io_enq_bits_fflags_bits_uop_stale_pdst;
  assign ram_fflags_bits_uop_stale_pdst_MPORT_addr = value;
  assign ram_fflags_bits_uop_stale_pdst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_stale_pdst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_exception_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_exception_MPORT_1_data =
    ram_fflags_bits_uop_exception[ram_fflags_bits_uop_exception_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_exception_MPORT_1_data = ram_fflags_bits_uop_exception_MPORT_1_addr >= 3'h7 ? _RAND_135[0
    :0] : ram_fflags_bits_uop_exception[ram_fflags_bits_uop_exception_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_exception_MPORT_data = io_enq_bits_fflags_bits_uop_exception;
  assign ram_fflags_bits_uop_exception_MPORT_addr = value;
  assign ram_fflags_bits_uop_exception_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_exception_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_exc_cause_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_exc_cause_MPORT_1_data =
    ram_fflags_bits_uop_exc_cause[ram_fflags_bits_uop_exc_cause_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_exc_cause_MPORT_1_data = ram_fflags_bits_uop_exc_cause_MPORT_1_addr >= 3'h7 ? _RAND_137[63
    :0] : ram_fflags_bits_uop_exc_cause[ram_fflags_bits_uop_exc_cause_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_exc_cause_MPORT_data = io_enq_bits_fflags_bits_uop_exc_cause;
  assign ram_fflags_bits_uop_exc_cause_MPORT_addr = value;
  assign ram_fflags_bits_uop_exc_cause_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_exc_cause_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_bypassable_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bypassable_MPORT_1_data =
    ram_fflags_bits_uop_bypassable[ram_fflags_bits_uop_bypassable_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_bypassable_MPORT_1_data = ram_fflags_bits_uop_bypassable_MPORT_1_addr >= 3'h7 ? _RAND_139[0
    :0] : ram_fflags_bits_uop_bypassable[ram_fflags_bits_uop_bypassable_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bypassable_MPORT_data = io_enq_bits_fflags_bits_uop_bypassable;
  assign ram_fflags_bits_uop_bypassable_MPORT_addr = value;
  assign ram_fflags_bits_uop_bypassable_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_bypassable_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_mem_cmd_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_cmd_MPORT_1_data =
    ram_fflags_bits_uop_mem_cmd[ram_fflags_bits_uop_mem_cmd_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_mem_cmd_MPORT_1_data = ram_fflags_bits_uop_mem_cmd_MPORT_1_addr >= 3'h7 ? _RAND_141[4:0] :
    ram_fflags_bits_uop_mem_cmd[ram_fflags_bits_uop_mem_cmd_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_cmd_MPORT_data = io_enq_bits_fflags_bits_uop_mem_cmd;
  assign ram_fflags_bits_uop_mem_cmd_MPORT_addr = value;
  assign ram_fflags_bits_uop_mem_cmd_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_mem_cmd_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_mem_size_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_size_MPORT_1_data =
    ram_fflags_bits_uop_mem_size[ram_fflags_bits_uop_mem_size_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_mem_size_MPORT_1_data = ram_fflags_bits_uop_mem_size_MPORT_1_addr >= 3'h7 ? _RAND_143[1:0]
     : ram_fflags_bits_uop_mem_size[ram_fflags_bits_uop_mem_size_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_size_MPORT_data = io_enq_bits_fflags_bits_uop_mem_size;
  assign ram_fflags_bits_uop_mem_size_MPORT_addr = value;
  assign ram_fflags_bits_uop_mem_size_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_mem_size_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_mem_signed_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_signed_MPORT_1_data =
    ram_fflags_bits_uop_mem_signed[ram_fflags_bits_uop_mem_signed_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_mem_signed_MPORT_1_data = ram_fflags_bits_uop_mem_signed_MPORT_1_addr >= 3'h7 ? _RAND_145[0
    :0] : ram_fflags_bits_uop_mem_signed[ram_fflags_bits_uop_mem_signed_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_signed_MPORT_data = io_enq_bits_fflags_bits_uop_mem_signed;
  assign ram_fflags_bits_uop_mem_signed_MPORT_addr = value;
  assign ram_fflags_bits_uop_mem_signed_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_mem_signed_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_is_fence_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_fence_MPORT_1_data =
    ram_fflags_bits_uop_is_fence[ram_fflags_bits_uop_is_fence_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_is_fence_MPORT_1_data = ram_fflags_bits_uop_is_fence_MPORT_1_addr >= 3'h7 ? _RAND_147[0:0]
     : ram_fflags_bits_uop_is_fence[ram_fflags_bits_uop_is_fence_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_fence_MPORT_data = io_enq_bits_fflags_bits_uop_is_fence;
  assign ram_fflags_bits_uop_is_fence_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_fence_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_fence_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_is_fencei_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_fencei_MPORT_1_data =
    ram_fflags_bits_uop_is_fencei[ram_fflags_bits_uop_is_fencei_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_is_fencei_MPORT_1_data = ram_fflags_bits_uop_is_fencei_MPORT_1_addr >= 3'h7 ? _RAND_149[0
    :0] : ram_fflags_bits_uop_is_fencei[ram_fflags_bits_uop_is_fencei_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_fencei_MPORT_data = io_enq_bits_fflags_bits_uop_is_fencei;
  assign ram_fflags_bits_uop_is_fencei_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_fencei_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_fencei_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_is_amo_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_amo_MPORT_1_data = ram_fflags_bits_uop_is_amo[ram_fflags_bits_uop_is_amo_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_is_amo_MPORT_1_data = ram_fflags_bits_uop_is_amo_MPORT_1_addr >= 3'h7 ? _RAND_151[0:0] :
    ram_fflags_bits_uop_is_amo[ram_fflags_bits_uop_is_amo_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_amo_MPORT_data = io_enq_bits_fflags_bits_uop_is_amo;
  assign ram_fflags_bits_uop_is_amo_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_amo_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_amo_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_uses_ldq_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uses_ldq_MPORT_1_data =
    ram_fflags_bits_uop_uses_ldq[ram_fflags_bits_uop_uses_ldq_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_uses_ldq_MPORT_1_data = ram_fflags_bits_uop_uses_ldq_MPORT_1_addr >= 3'h7 ? _RAND_153[0:0]
     : ram_fflags_bits_uop_uses_ldq[ram_fflags_bits_uop_uses_ldq_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uses_ldq_MPORT_data = io_enq_bits_fflags_bits_uop_uses_ldq;
  assign ram_fflags_bits_uop_uses_ldq_MPORT_addr = value;
  assign ram_fflags_bits_uop_uses_ldq_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_uses_ldq_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_uses_stq_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uses_stq_MPORT_1_data =
    ram_fflags_bits_uop_uses_stq[ram_fflags_bits_uop_uses_stq_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_uses_stq_MPORT_1_data = ram_fflags_bits_uop_uses_stq_MPORT_1_addr >= 3'h7 ? _RAND_155[0:0]
     : ram_fflags_bits_uop_uses_stq[ram_fflags_bits_uop_uses_stq_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uses_stq_MPORT_data = io_enq_bits_fflags_bits_uop_uses_stq;
  assign ram_fflags_bits_uop_uses_stq_MPORT_addr = value;
  assign ram_fflags_bits_uop_uses_stq_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_uses_stq_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_data =
    ram_fflags_bits_uop_is_sys_pc2epc[ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_data = ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_addr >= 3'h7 ?
    _RAND_157[0:0] : ram_fflags_bits_uop_is_sys_pc2epc[ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_data = io_enq_bits_fflags_bits_uop_is_sys_pc2epc;
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_is_unique_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_unique_MPORT_1_data =
    ram_fflags_bits_uop_is_unique[ram_fflags_bits_uop_is_unique_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_is_unique_MPORT_1_data = ram_fflags_bits_uop_is_unique_MPORT_1_addr >= 3'h7 ? _RAND_159[0
    :0] : ram_fflags_bits_uop_is_unique[ram_fflags_bits_uop_is_unique_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_unique_MPORT_data = io_enq_bits_fflags_bits_uop_is_unique;
  assign ram_fflags_bits_uop_is_unique_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_unique_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_unique_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_1_data =
    ram_fflags_bits_uop_flush_on_commit[ram_fflags_bits_uop_flush_on_commit_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_1_data = ram_fflags_bits_uop_flush_on_commit_MPORT_1_addr >= 3'h7 ?
    _RAND_161[0:0] : ram_fflags_bits_uop_flush_on_commit[ram_fflags_bits_uop_flush_on_commit_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_data = io_enq_bits_fflags_bits_uop_flush_on_commit;
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_addr = value;
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_data =
    ram_fflags_bits_uop_ldst_is_rs1[ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_data = ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_addr >= 3'h7 ? _RAND_163
    [0:0] : ram_fflags_bits_uop_ldst_is_rs1[ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_data = io_enq_bits_fflags_bits_uop_ldst_is_rs1;
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_addr = value;
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ldst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_MPORT_1_data = ram_fflags_bits_uop_ldst[ram_fflags_bits_uop_ldst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ldst_MPORT_1_data = ram_fflags_bits_uop_ldst_MPORT_1_addr >= 3'h7 ? _RAND_165[5:0] :
    ram_fflags_bits_uop_ldst[ram_fflags_bits_uop_ldst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_MPORT_data = io_enq_bits_fflags_bits_uop_ldst;
  assign ram_fflags_bits_uop_ldst_MPORT_addr = value;
  assign ram_fflags_bits_uop_ldst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ldst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_lrs1_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs1_MPORT_1_data = ram_fflags_bits_uop_lrs1[ram_fflags_bits_uop_lrs1_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_lrs1_MPORT_1_data = ram_fflags_bits_uop_lrs1_MPORT_1_addr >= 3'h7 ? _RAND_167[5:0] :
    ram_fflags_bits_uop_lrs1[ram_fflags_bits_uop_lrs1_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs1_MPORT_data = io_enq_bits_fflags_bits_uop_lrs1;
  assign ram_fflags_bits_uop_lrs1_MPORT_addr = value;
  assign ram_fflags_bits_uop_lrs1_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_lrs1_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_lrs2_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs2_MPORT_1_data = ram_fflags_bits_uop_lrs2[ram_fflags_bits_uop_lrs2_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_lrs2_MPORT_1_data = ram_fflags_bits_uop_lrs2_MPORT_1_addr >= 3'h7 ? _RAND_169[5:0] :
    ram_fflags_bits_uop_lrs2[ram_fflags_bits_uop_lrs2_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs2_MPORT_data = io_enq_bits_fflags_bits_uop_lrs2;
  assign ram_fflags_bits_uop_lrs2_MPORT_addr = value;
  assign ram_fflags_bits_uop_lrs2_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_lrs2_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_lrs3_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs3_MPORT_1_data = ram_fflags_bits_uop_lrs3[ram_fflags_bits_uop_lrs3_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_lrs3_MPORT_1_data = ram_fflags_bits_uop_lrs3_MPORT_1_addr >= 3'h7 ? _RAND_171[5:0] :
    ram_fflags_bits_uop_lrs3[ram_fflags_bits_uop_lrs3_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs3_MPORT_data = io_enq_bits_fflags_bits_uop_lrs3;
  assign ram_fflags_bits_uop_lrs3_MPORT_addr = value;
  assign ram_fflags_bits_uop_lrs3_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_lrs3_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_ldst_val_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_val_MPORT_1_data =
    ram_fflags_bits_uop_ldst_val[ram_fflags_bits_uop_ldst_val_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_ldst_val_MPORT_1_data = ram_fflags_bits_uop_ldst_val_MPORT_1_addr >= 3'h7 ? _RAND_173[0:0]
     : ram_fflags_bits_uop_ldst_val[ram_fflags_bits_uop_ldst_val_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_val_MPORT_data = io_enq_bits_fflags_bits_uop_ldst_val;
  assign ram_fflags_bits_uop_ldst_val_MPORT_addr = value;
  assign ram_fflags_bits_uop_ldst_val_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ldst_val_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_dst_rtype_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_dst_rtype_MPORT_1_data =
    ram_fflags_bits_uop_dst_rtype[ram_fflags_bits_uop_dst_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_dst_rtype_MPORT_1_data = ram_fflags_bits_uop_dst_rtype_MPORT_1_addr >= 3'h7 ? _RAND_175[1
    :0] : ram_fflags_bits_uop_dst_rtype[ram_fflags_bits_uop_dst_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_dst_rtype_MPORT_data = io_enq_bits_fflags_bits_uop_dst_rtype;
  assign ram_fflags_bits_uop_dst_rtype_MPORT_addr = value;
  assign ram_fflags_bits_uop_dst_rtype_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_dst_rtype_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_1_data =
    ram_fflags_bits_uop_lrs1_rtype[ram_fflags_bits_uop_lrs1_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_1_data = ram_fflags_bits_uop_lrs1_rtype_MPORT_1_addr >= 3'h7 ? _RAND_177[1
    :0] : ram_fflags_bits_uop_lrs1_rtype[ram_fflags_bits_uop_lrs1_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_data = io_enq_bits_fflags_bits_uop_lrs1_rtype;
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_addr = value;
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_1_data =
    ram_fflags_bits_uop_lrs2_rtype[ram_fflags_bits_uop_lrs2_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_1_data = ram_fflags_bits_uop_lrs2_rtype_MPORT_1_addr >= 3'h7 ? _RAND_179[1
    :0] : ram_fflags_bits_uop_lrs2_rtype[ram_fflags_bits_uop_lrs2_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_data = io_enq_bits_fflags_bits_uop_lrs2_rtype;
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_addr = value;
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_frs3_en_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_frs3_en_MPORT_1_data =
    ram_fflags_bits_uop_frs3_en[ram_fflags_bits_uop_frs3_en_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_frs3_en_MPORT_1_data = ram_fflags_bits_uop_frs3_en_MPORT_1_addr >= 3'h7 ? _RAND_181[0:0] :
    ram_fflags_bits_uop_frs3_en[ram_fflags_bits_uop_frs3_en_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_frs3_en_MPORT_data = io_enq_bits_fflags_bits_uop_frs3_en;
  assign ram_fflags_bits_uop_frs3_en_MPORT_addr = value;
  assign ram_fflags_bits_uop_frs3_en_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_frs3_en_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_fp_val_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fp_val_MPORT_1_data = ram_fflags_bits_uop_fp_val[ram_fflags_bits_uop_fp_val_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_fp_val_MPORT_1_data = ram_fflags_bits_uop_fp_val_MPORT_1_addr >= 3'h7 ? _RAND_183[0:0] :
    ram_fflags_bits_uop_fp_val[ram_fflags_bits_uop_fp_val_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fp_val_MPORT_data = io_enq_bits_fflags_bits_uop_fp_val;
  assign ram_fflags_bits_uop_fp_val_MPORT_addr = value;
  assign ram_fflags_bits_uop_fp_val_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_fp_val_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_fp_single_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fp_single_MPORT_1_data =
    ram_fflags_bits_uop_fp_single[ram_fflags_bits_uop_fp_single_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_fp_single_MPORT_1_data = ram_fflags_bits_uop_fp_single_MPORT_1_addr >= 3'h7 ? _RAND_185[0
    :0] : ram_fflags_bits_uop_fp_single[ram_fflags_bits_uop_fp_single_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fp_single_MPORT_data = io_enq_bits_fflags_bits_uop_fp_single;
  assign ram_fflags_bits_uop_fp_single_MPORT_addr = value;
  assign ram_fflags_bits_uop_fp_single_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_fp_single_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_data =
    ram_fflags_bits_uop_xcpt_pf_if[ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_data = ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_addr >= 3'h7 ? _RAND_187[0
    :0] : ram_fflags_bits_uop_xcpt_pf_if[ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_data = io_enq_bits_fflags_bits_uop_xcpt_pf_if;
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_addr = value;
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_data =
    ram_fflags_bits_uop_xcpt_ae_if[ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_data = ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_addr >= 3'h7 ? _RAND_189[0
    :0] : ram_fflags_bits_uop_xcpt_ae_if[ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_data = io_enq_bits_fflags_bits_uop_xcpt_ae_if;
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_addr = value;
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_data =
    ram_fflags_bits_uop_xcpt_ma_if[ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_data = ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_addr >= 3'h7 ? _RAND_191[0
    :0] : ram_fflags_bits_uop_xcpt_ma_if[ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_data = io_enq_bits_fflags_bits_uop_xcpt_ma_if;
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_addr = value;
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_1_data =
    ram_fflags_bits_uop_bp_debug_if[ram_fflags_bits_uop_bp_debug_if_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_1_data = ram_fflags_bits_uop_bp_debug_if_MPORT_1_addr >= 3'h7 ? _RAND_193
    [0:0] : ram_fflags_bits_uop_bp_debug_if[ram_fflags_bits_uop_bp_debug_if_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_data = io_enq_bits_fflags_bits_uop_bp_debug_if;
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_addr = value;
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_data =
    ram_fflags_bits_uop_bp_xcpt_if[ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_data = ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_addr >= 3'h7 ? _RAND_195[0
    :0] : ram_fflags_bits_uop_bp_xcpt_if[ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_data = io_enq_bits_fflags_bits_uop_bp_xcpt_if;
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_addr = value;
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_1_data =
    ram_fflags_bits_uop_debug_fsrc[ram_fflags_bits_uop_debug_fsrc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_1_data = ram_fflags_bits_uop_debug_fsrc_MPORT_1_addr >= 3'h7 ? _RAND_197[1
    :0] : ram_fflags_bits_uop_debug_fsrc[ram_fflags_bits_uop_debug_fsrc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_data = io_enq_bits_fflags_bits_uop_debug_fsrc;
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_addr = value;
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_1_data =
    ram_fflags_bits_uop_debug_tsrc[ram_fflags_bits_uop_debug_tsrc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_1_data = ram_fflags_bits_uop_debug_tsrc_MPORT_1_addr >= 3'h7 ? _RAND_199[1
    :0] : ram_fflags_bits_uop_debug_tsrc[ram_fflags_bits_uop_debug_tsrc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_data = io_enq_bits_fflags_bits_uop_debug_tsrc;
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_addr = value;
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflags_bits_flags_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_flags_MPORT_1_data = ram_fflags_bits_flags[ram_fflags_bits_flags_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflags_bits_flags_MPORT_1_data = ram_fflags_bits_flags_MPORT_1_addr >= 3'h7 ? _RAND_201[4:0] :
    ram_fflags_bits_flags[ram_fflags_bits_flags_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_flags_MPORT_data = io_enq_bits_fflags_bits_flags;
  assign ram_fflags_bits_flags_MPORT_addr = value;
  assign ram_fflags_bits_flags_MPORT_mask = 1'h1;
  assign ram_fflags_bits_flags_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_flagdata_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_flagdata_MPORT_1_data = ram_flagdata[ram_flagdata_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_flagdata_MPORT_1_data = ram_flagdata_MPORT_1_addr >= 3'h7 ? _RAND_203[3:0] :
    ram_flagdata[ram_flagdata_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_flagdata_MPORT_data = io_enq_bits_flagdata;
  assign ram_flagdata_MPORT_addr = value;
  assign ram_flagdata_MPORT_mask = 1'h1;
  assign ram_flagdata_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_valid_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_valid_MPORT_1_data = ram_fflagdata_valid[ram_fflagdata_valid_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_valid_MPORT_1_data = ram_fflagdata_valid_MPORT_1_addr >= 3'h7 ? _RAND_205[0:0] :
    ram_fflagdata_valid[ram_fflagdata_valid_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_valid_MPORT_data = io_enq_bits_fflagdata_valid;
  assign ram_fflagdata_valid_MPORT_addr = value;
  assign ram_fflagdata_valid_MPORT_mask = 1'h1;
  assign ram_fflagdata_valid_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_switch_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_switch_MPORT_1_data =
    ram_fflagdata_bits_uop_switch[ram_fflagdata_bits_uop_switch_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_switch_MPORT_1_data = ram_fflagdata_bits_uop_switch_MPORT_1_addr >= 3'h7 ? _RAND_207[0
    :0] : ram_fflagdata_bits_uop_switch[ram_fflagdata_bits_uop_switch_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_switch_MPORT_data = io_enq_bits_fflagdata_bits_uop_switch;
  assign ram_fflagdata_bits_uop_switch_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_switch_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_switch_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_switch_off_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_switch_off_MPORT_1_data =
    ram_fflagdata_bits_uop_switch_off[ram_fflagdata_bits_uop_switch_off_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_switch_off_MPORT_1_data = ram_fflagdata_bits_uop_switch_off_MPORT_1_addr >= 3'h7 ?
    _RAND_209[0:0] : ram_fflagdata_bits_uop_switch_off[ram_fflagdata_bits_uop_switch_off_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_switch_off_MPORT_data = io_enq_bits_fflagdata_bits_uop_switch_off;
  assign ram_fflagdata_bits_uop_switch_off_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_switch_off_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_switch_off_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_is_unicore_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_unicore_MPORT_1_data =
    ram_fflagdata_bits_uop_is_unicore[ram_fflagdata_bits_uop_is_unicore_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_is_unicore_MPORT_1_data = ram_fflagdata_bits_uop_is_unicore_MPORT_1_addr >= 3'h7 ?
    _RAND_211[0:0] : ram_fflagdata_bits_uop_is_unicore[ram_fflagdata_bits_uop_is_unicore_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_unicore_MPORT_data = io_enq_bits_fflagdata_bits_uop_is_unicore;
  assign ram_fflagdata_bits_uop_is_unicore_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_is_unicore_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_is_unicore_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_shift_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_shift_MPORT_1_data =
    ram_fflagdata_bits_uop_shift[ram_fflagdata_bits_uop_shift_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_shift_MPORT_1_data = ram_fflagdata_bits_uop_shift_MPORT_1_addr >= 3'h7 ? _RAND_213[2:0]
     : ram_fflagdata_bits_uop_shift[ram_fflagdata_bits_uop_shift_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_shift_MPORT_data = io_enq_bits_fflagdata_bits_uop_shift;
  assign ram_fflagdata_bits_uop_shift_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_shift_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_shift_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_lrs3_rtype_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs3_rtype_MPORT_1_data =
    ram_fflagdata_bits_uop_lrs3_rtype[ram_fflagdata_bits_uop_lrs3_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_lrs3_rtype_MPORT_1_data = ram_fflagdata_bits_uop_lrs3_rtype_MPORT_1_addr >= 3'h7 ?
    _RAND_215[1:0] : ram_fflagdata_bits_uop_lrs3_rtype[ram_fflagdata_bits_uop_lrs3_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs3_rtype_MPORT_data = io_enq_bits_fflagdata_bits_uop_lrs3_rtype;
  assign ram_fflagdata_bits_uop_lrs3_rtype_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_lrs3_rtype_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_lrs3_rtype_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_rflag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_rflag_MPORT_1_data =
    ram_fflagdata_bits_uop_rflag[ram_fflagdata_bits_uop_rflag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_rflag_MPORT_1_data = ram_fflagdata_bits_uop_rflag_MPORT_1_addr >= 3'h7 ? _RAND_217[0:0]
     : ram_fflagdata_bits_uop_rflag[ram_fflagdata_bits_uop_rflag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_rflag_MPORT_data = io_enq_bits_fflagdata_bits_uop_rflag;
  assign ram_fflagdata_bits_uop_rflag_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_rflag_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_rflag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_wflag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_wflag_MPORT_1_data =
    ram_fflagdata_bits_uop_wflag[ram_fflagdata_bits_uop_wflag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_wflag_MPORT_1_data = ram_fflagdata_bits_uop_wflag_MPORT_1_addr >= 3'h7 ? _RAND_219[0:0]
     : ram_fflagdata_bits_uop_wflag[ram_fflagdata_bits_uop_wflag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_wflag_MPORT_data = io_enq_bits_fflagdata_bits_uop_wflag;
  assign ram_fflagdata_bits_uop_wflag_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_wflag_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_wflag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_prflag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prflag_MPORT_1_data =
    ram_fflagdata_bits_uop_prflag[ram_fflagdata_bits_uop_prflag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_prflag_MPORT_1_data = ram_fflagdata_bits_uop_prflag_MPORT_1_addr >= 3'h7 ? _RAND_221[3
    :0] : ram_fflagdata_bits_uop_prflag[ram_fflagdata_bits_uop_prflag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prflag_MPORT_data = io_enq_bits_fflagdata_bits_uop_prflag;
  assign ram_fflagdata_bits_uop_prflag_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_prflag_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_prflag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_pwflag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_pwflag_MPORT_1_data =
    ram_fflagdata_bits_uop_pwflag[ram_fflagdata_bits_uop_pwflag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_pwflag_MPORT_1_data = ram_fflagdata_bits_uop_pwflag_MPORT_1_addr >= 3'h7 ? _RAND_223[3
    :0] : ram_fflagdata_bits_uop_pwflag[ram_fflagdata_bits_uop_pwflag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_pwflag_MPORT_data = io_enq_bits_fflagdata_bits_uop_pwflag;
  assign ram_fflagdata_bits_uop_pwflag_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_pwflag_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_pwflag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_pflag_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_pflag_busy_MPORT_1_data =
    ram_fflagdata_bits_uop_pflag_busy[ram_fflagdata_bits_uop_pflag_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_pflag_busy_MPORT_1_data = ram_fflagdata_bits_uop_pflag_busy_MPORT_1_addr >= 3'h7 ?
    _RAND_225[0:0] : ram_fflagdata_bits_uop_pflag_busy[ram_fflagdata_bits_uop_pflag_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_pflag_busy_MPORT_data = io_enq_bits_fflagdata_bits_uop_pflag_busy;
  assign ram_fflagdata_bits_uop_pflag_busy_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_pflag_busy_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_pflag_busy_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_stale_pflag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_stale_pflag_MPORT_1_data =
    ram_fflagdata_bits_uop_stale_pflag[ram_fflagdata_bits_uop_stale_pflag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_stale_pflag_MPORT_1_data = ram_fflagdata_bits_uop_stale_pflag_MPORT_1_addr >= 3'h7 ?
    _RAND_227[3:0] : ram_fflagdata_bits_uop_stale_pflag[ram_fflagdata_bits_uop_stale_pflag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_stale_pflag_MPORT_data = io_enq_bits_fflagdata_bits_uop_stale_pflag;
  assign ram_fflagdata_bits_uop_stale_pflag_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_stale_pflag_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_stale_pflag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_op1_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_op1_sel_MPORT_1_data =
    ram_fflagdata_bits_uop_op1_sel[ram_fflagdata_bits_uop_op1_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_op1_sel_MPORT_1_data = ram_fflagdata_bits_uop_op1_sel_MPORT_1_addr >= 3'h7 ? _RAND_229[3
    :0] : ram_fflagdata_bits_uop_op1_sel[ram_fflagdata_bits_uop_op1_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_op1_sel_MPORT_data = io_enq_bits_fflagdata_bits_uop_op1_sel;
  assign ram_fflagdata_bits_uop_op1_sel_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_op1_sel_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_op1_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_op2_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_op2_sel_MPORT_1_data =
    ram_fflagdata_bits_uop_op2_sel[ram_fflagdata_bits_uop_op2_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_op2_sel_MPORT_1_data = ram_fflagdata_bits_uop_op2_sel_MPORT_1_addr >= 3'h7 ? _RAND_231[3
    :0] : ram_fflagdata_bits_uop_op2_sel[ram_fflagdata_bits_uop_op2_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_op2_sel_MPORT_data = io_enq_bits_fflagdata_bits_uop_op2_sel;
  assign ram_fflagdata_bits_uop_op2_sel_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_op2_sel_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_op2_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_split_num_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_split_num_MPORT_1_data =
    ram_fflagdata_bits_uop_split_num[ram_fflagdata_bits_uop_split_num_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_split_num_MPORT_1_data = ram_fflagdata_bits_uop_split_num_MPORT_1_addr >= 3'h7 ?
    _RAND_233[5:0] : ram_fflagdata_bits_uop_split_num[ram_fflagdata_bits_uop_split_num_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_split_num_MPORT_data = io_enq_bits_fflagdata_bits_uop_split_num;
  assign ram_fflagdata_bits_uop_split_num_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_split_num_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_split_num_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_self_index_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_self_index_MPORT_1_data =
    ram_fflagdata_bits_uop_self_index[ram_fflagdata_bits_uop_self_index_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_self_index_MPORT_1_data = ram_fflagdata_bits_uop_self_index_MPORT_1_addr >= 3'h7 ?
    _RAND_235[5:0] : ram_fflagdata_bits_uop_self_index[ram_fflagdata_bits_uop_self_index_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_self_index_MPORT_data = io_enq_bits_fflagdata_bits_uop_self_index;
  assign ram_fflagdata_bits_uop_self_index_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_self_index_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_self_index_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_rob_inst_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_rob_inst_idx_MPORT_1_data =
    ram_fflagdata_bits_uop_rob_inst_idx[ram_fflagdata_bits_uop_rob_inst_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_rob_inst_idx_MPORT_1_data = ram_fflagdata_bits_uop_rob_inst_idx_MPORT_1_addr >= 3'h7 ?
    _RAND_237[5:0] : ram_fflagdata_bits_uop_rob_inst_idx[ram_fflagdata_bits_uop_rob_inst_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_rob_inst_idx_MPORT_data = io_enq_bits_fflagdata_bits_uop_rob_inst_idx;
  assign ram_fflagdata_bits_uop_rob_inst_idx_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_rob_inst_idx_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_rob_inst_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_address_num_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_address_num_MPORT_1_data =
    ram_fflagdata_bits_uop_address_num[ram_fflagdata_bits_uop_address_num_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_address_num_MPORT_1_data = ram_fflagdata_bits_uop_address_num_MPORT_1_addr >= 3'h7 ?
    _RAND_239[5:0] : ram_fflagdata_bits_uop_address_num[ram_fflagdata_bits_uop_address_num_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_address_num_MPORT_data = io_enq_bits_fflagdata_bits_uop_address_num;
  assign ram_fflagdata_bits_uop_address_num_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_address_num_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_address_num_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_uopc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_uopc_MPORT_1_data =
    ram_fflagdata_bits_uop_uopc[ram_fflagdata_bits_uop_uopc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_uopc_MPORT_1_data = ram_fflagdata_bits_uop_uopc_MPORT_1_addr >= 3'h7 ? _RAND_241[6:0] :
    ram_fflagdata_bits_uop_uopc[ram_fflagdata_bits_uop_uopc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_uopc_MPORT_data = io_enq_bits_fflagdata_bits_uop_uopc;
  assign ram_fflagdata_bits_uop_uopc_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_uopc_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_uopc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_inst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_inst_MPORT_1_data =
    ram_fflagdata_bits_uop_inst[ram_fflagdata_bits_uop_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_inst_MPORT_1_data = ram_fflagdata_bits_uop_inst_MPORT_1_addr >= 3'h7 ? _RAND_243[31:0]
     : ram_fflagdata_bits_uop_inst[ram_fflagdata_bits_uop_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_inst_MPORT_data = io_enq_bits_fflagdata_bits_uop_inst;
  assign ram_fflagdata_bits_uop_inst_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_inst_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_inst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_debug_inst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_debug_inst_MPORT_1_data =
    ram_fflagdata_bits_uop_debug_inst[ram_fflagdata_bits_uop_debug_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_debug_inst_MPORT_1_data = ram_fflagdata_bits_uop_debug_inst_MPORT_1_addr >= 3'h7 ?
    _RAND_245[31:0] : ram_fflagdata_bits_uop_debug_inst[ram_fflagdata_bits_uop_debug_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_debug_inst_MPORT_data = io_enq_bits_fflagdata_bits_uop_debug_inst;
  assign ram_fflagdata_bits_uop_debug_inst_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_debug_inst_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_debug_inst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_is_rvc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_rvc_MPORT_1_data =
    ram_fflagdata_bits_uop_is_rvc[ram_fflagdata_bits_uop_is_rvc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_is_rvc_MPORT_1_data = ram_fflagdata_bits_uop_is_rvc_MPORT_1_addr >= 3'h7 ? _RAND_247[0
    :0] : ram_fflagdata_bits_uop_is_rvc[ram_fflagdata_bits_uop_is_rvc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_rvc_MPORT_data = io_enq_bits_fflagdata_bits_uop_is_rvc;
  assign ram_fflagdata_bits_uop_is_rvc_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_is_rvc_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_is_rvc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_debug_pc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_debug_pc_MPORT_1_data =
    ram_fflagdata_bits_uop_debug_pc[ram_fflagdata_bits_uop_debug_pc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_debug_pc_MPORT_1_data = ram_fflagdata_bits_uop_debug_pc_MPORT_1_addr >= 3'h7 ? _RAND_249
    [39:0] : ram_fflagdata_bits_uop_debug_pc[ram_fflagdata_bits_uop_debug_pc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_debug_pc_MPORT_data = io_enq_bits_fflagdata_bits_uop_debug_pc;
  assign ram_fflagdata_bits_uop_debug_pc_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_debug_pc_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_debug_pc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_iq_type_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_iq_type_MPORT_1_data =
    ram_fflagdata_bits_uop_iq_type[ram_fflagdata_bits_uop_iq_type_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_iq_type_MPORT_1_data = ram_fflagdata_bits_uop_iq_type_MPORT_1_addr >= 3'h7 ? _RAND_251[2
    :0] : ram_fflagdata_bits_uop_iq_type[ram_fflagdata_bits_uop_iq_type_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_iq_type_MPORT_data = io_enq_bits_fflagdata_bits_uop_iq_type;
  assign ram_fflagdata_bits_uop_iq_type_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_iq_type_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_iq_type_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_fu_code_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_fu_code_MPORT_1_data =
    ram_fflagdata_bits_uop_fu_code[ram_fflagdata_bits_uop_fu_code_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_fu_code_MPORT_1_data = ram_fflagdata_bits_uop_fu_code_MPORT_1_addr >= 3'h7 ? _RAND_253[9
    :0] : ram_fflagdata_bits_uop_fu_code[ram_fflagdata_bits_uop_fu_code_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_fu_code_MPORT_data = io_enq_bits_fflagdata_bits_uop_fu_code;
  assign ram_fflagdata_bits_uop_fu_code_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_fu_code_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_fu_code_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ctrl_br_type_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_br_type_MPORT_1_data =
    ram_fflagdata_bits_uop_ctrl_br_type[ram_fflagdata_bits_uop_ctrl_br_type_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ctrl_br_type_MPORT_1_data = ram_fflagdata_bits_uop_ctrl_br_type_MPORT_1_addr >= 3'h7 ?
    _RAND_255[3:0] : ram_fflagdata_bits_uop_ctrl_br_type[ram_fflagdata_bits_uop_ctrl_br_type_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_br_type_MPORT_data = io_enq_bits_fflagdata_bits_uop_ctrl_br_type;
  assign ram_fflagdata_bits_uop_ctrl_br_type_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ctrl_br_type_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ctrl_br_type_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_1_data =
    ram_fflagdata_bits_uop_ctrl_op1_sel[ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_1_data = ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_1_addr >= 3'h7 ?
    _RAND_257[1:0] : ram_fflagdata_bits_uop_ctrl_op1_sel[ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_data = io_enq_bits_fflagdata_bits_uop_ctrl_op1_sel;
  assign ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_1_data =
    ram_fflagdata_bits_uop_ctrl_op2_sel[ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_1_data = ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_1_addr >= 3'h7 ?
    _RAND_259[2:0] : ram_fflagdata_bits_uop_ctrl_op2_sel[ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_data = io_enq_bits_fflagdata_bits_uop_ctrl_op2_sel;
  assign ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_1_data =
    ram_fflagdata_bits_uop_ctrl_imm_sel[ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_1_data = ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_1_addr >= 3'h7 ?
    _RAND_261[2:0] : ram_fflagdata_bits_uop_ctrl_imm_sel[ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_data = io_enq_bits_fflagdata_bits_uop_ctrl_imm_sel;
  assign ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_1_data =
    ram_fflagdata_bits_uop_ctrl_op_fcn[ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_1_data = ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_1_addr >= 3'h7 ?
    _RAND_263[3:0] : ram_fflagdata_bits_uop_ctrl_op_fcn[ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_data = io_enq_bits_fflagdata_bits_uop_ctrl_op_fcn;
  assign ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_1_data =
    ram_fflagdata_bits_uop_ctrl_fcn_dw[ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_1_data = ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_1_addr >= 3'h7 ?
    _RAND_265[0:0] : ram_fflagdata_bits_uop_ctrl_fcn_dw[ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_data = io_enq_bits_fflagdata_bits_uop_ctrl_fcn_dw;
  assign ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_1_data =
    ram_fflagdata_bits_uop_ctrl_csr_cmd[ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_1_data = ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_1_addr >= 3'h7 ?
    _RAND_267[2:0] : ram_fflagdata_bits_uop_ctrl_csr_cmd[ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_data = io_enq_bits_fflagdata_bits_uop_ctrl_csr_cmd;
  assign ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ctrl_is_load_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_is_load_MPORT_1_data =
    ram_fflagdata_bits_uop_ctrl_is_load[ram_fflagdata_bits_uop_ctrl_is_load_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ctrl_is_load_MPORT_1_data = ram_fflagdata_bits_uop_ctrl_is_load_MPORT_1_addr >= 3'h7 ?
    _RAND_269[0:0] : ram_fflagdata_bits_uop_ctrl_is_load[ram_fflagdata_bits_uop_ctrl_is_load_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_is_load_MPORT_data = io_enq_bits_fflagdata_bits_uop_ctrl_is_load;
  assign ram_fflagdata_bits_uop_ctrl_is_load_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ctrl_is_load_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ctrl_is_load_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_1_data =
    ram_fflagdata_bits_uop_ctrl_is_sta[ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_1_data = ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_1_addr >= 3'h7 ?
    _RAND_271[0:0] : ram_fflagdata_bits_uop_ctrl_is_sta[ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_data = io_enq_bits_fflagdata_bits_uop_ctrl_is_sta;
  assign ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ctrl_is_std_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_is_std_MPORT_1_data =
    ram_fflagdata_bits_uop_ctrl_is_std[ram_fflagdata_bits_uop_ctrl_is_std_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ctrl_is_std_MPORT_1_data = ram_fflagdata_bits_uop_ctrl_is_std_MPORT_1_addr >= 3'h7 ?
    _RAND_273[0:0] : ram_fflagdata_bits_uop_ctrl_is_std[ram_fflagdata_bits_uop_ctrl_is_std_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_is_std_MPORT_data = io_enq_bits_fflagdata_bits_uop_ctrl_is_std;
  assign ram_fflagdata_bits_uop_ctrl_is_std_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ctrl_is_std_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ctrl_is_std_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_1_data =
    ram_fflagdata_bits_uop_ctrl_op3_sel[ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_1_data = ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_1_addr >= 3'h7 ?
    _RAND_275[1:0] : ram_fflagdata_bits_uop_ctrl_op3_sel[ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_data = io_enq_bits_fflagdata_bits_uop_ctrl_op3_sel;
  assign ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_iw_state_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_iw_state_MPORT_1_data =
    ram_fflagdata_bits_uop_iw_state[ram_fflagdata_bits_uop_iw_state_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_iw_state_MPORT_1_data = ram_fflagdata_bits_uop_iw_state_MPORT_1_addr >= 3'h7 ? _RAND_277
    [1:0] : ram_fflagdata_bits_uop_iw_state[ram_fflagdata_bits_uop_iw_state_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_iw_state_MPORT_data = io_enq_bits_fflagdata_bits_uop_iw_state;
  assign ram_fflagdata_bits_uop_iw_state_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_iw_state_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_iw_state_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_1_data =
    ram_fflagdata_bits_uop_iw_p1_poisoned[ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_1_data = ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_1_addr >= 3'h7
     ? _RAND_279[0:0] : ram_fflagdata_bits_uop_iw_p1_poisoned[ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_data = io_enq_bits_fflagdata_bits_uop_iw_p1_poisoned;
  assign ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_1_data =
    ram_fflagdata_bits_uop_iw_p2_poisoned[ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_1_data = ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_1_addr >= 3'h7
     ? _RAND_281[0:0] : ram_fflagdata_bits_uop_iw_p2_poisoned[ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_data = io_enq_bits_fflagdata_bits_uop_iw_p2_poisoned;
  assign ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_is_br_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_br_MPORT_1_data =
    ram_fflagdata_bits_uop_is_br[ram_fflagdata_bits_uop_is_br_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_is_br_MPORT_1_data = ram_fflagdata_bits_uop_is_br_MPORT_1_addr >= 3'h7 ? _RAND_283[0:0]
     : ram_fflagdata_bits_uop_is_br[ram_fflagdata_bits_uop_is_br_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_br_MPORT_data = io_enq_bits_fflagdata_bits_uop_is_br;
  assign ram_fflagdata_bits_uop_is_br_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_is_br_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_is_br_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_is_jalr_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_jalr_MPORT_1_data =
    ram_fflagdata_bits_uop_is_jalr[ram_fflagdata_bits_uop_is_jalr_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_is_jalr_MPORT_1_data = ram_fflagdata_bits_uop_is_jalr_MPORT_1_addr >= 3'h7 ? _RAND_285[0
    :0] : ram_fflagdata_bits_uop_is_jalr[ram_fflagdata_bits_uop_is_jalr_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_jalr_MPORT_data = io_enq_bits_fflagdata_bits_uop_is_jalr;
  assign ram_fflagdata_bits_uop_is_jalr_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_is_jalr_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_is_jalr_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_is_jal_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_jal_MPORT_1_data =
    ram_fflagdata_bits_uop_is_jal[ram_fflagdata_bits_uop_is_jal_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_is_jal_MPORT_1_data = ram_fflagdata_bits_uop_is_jal_MPORT_1_addr >= 3'h7 ? _RAND_287[0
    :0] : ram_fflagdata_bits_uop_is_jal[ram_fflagdata_bits_uop_is_jal_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_jal_MPORT_data = io_enq_bits_fflagdata_bits_uop_is_jal;
  assign ram_fflagdata_bits_uop_is_jal_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_is_jal_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_is_jal_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_is_sfb_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_sfb_MPORT_1_data =
    ram_fflagdata_bits_uop_is_sfb[ram_fflagdata_bits_uop_is_sfb_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_is_sfb_MPORT_1_data = ram_fflagdata_bits_uop_is_sfb_MPORT_1_addr >= 3'h7 ? _RAND_289[0
    :0] : ram_fflagdata_bits_uop_is_sfb[ram_fflagdata_bits_uop_is_sfb_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_sfb_MPORT_data = io_enq_bits_fflagdata_bits_uop_is_sfb;
  assign ram_fflagdata_bits_uop_is_sfb_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_is_sfb_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_is_sfb_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_br_mask_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_br_mask_MPORT_1_data =
    ram_fflagdata_bits_uop_br_mask[ram_fflagdata_bits_uop_br_mask_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_br_mask_MPORT_1_data = ram_fflagdata_bits_uop_br_mask_MPORT_1_addr >= 3'h7 ? _RAND_291[
    11:0] : ram_fflagdata_bits_uop_br_mask[ram_fflagdata_bits_uop_br_mask_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_br_mask_MPORT_data = io_enq_bits_fflagdata_bits_uop_br_mask;
  assign ram_fflagdata_bits_uop_br_mask_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_br_mask_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_br_mask_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_br_tag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_br_tag_MPORT_1_data =
    ram_fflagdata_bits_uop_br_tag[ram_fflagdata_bits_uop_br_tag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_br_tag_MPORT_1_data = ram_fflagdata_bits_uop_br_tag_MPORT_1_addr >= 3'h7 ? _RAND_293[3
    :0] : ram_fflagdata_bits_uop_br_tag[ram_fflagdata_bits_uop_br_tag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_br_tag_MPORT_data = io_enq_bits_fflagdata_bits_uop_br_tag;
  assign ram_fflagdata_bits_uop_br_tag_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_br_tag_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_br_tag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ftq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ftq_idx_MPORT_1_data =
    ram_fflagdata_bits_uop_ftq_idx[ram_fflagdata_bits_uop_ftq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ftq_idx_MPORT_1_data = ram_fflagdata_bits_uop_ftq_idx_MPORT_1_addr >= 3'h7 ? _RAND_295[4
    :0] : ram_fflagdata_bits_uop_ftq_idx[ram_fflagdata_bits_uop_ftq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ftq_idx_MPORT_data = io_enq_bits_fflagdata_bits_uop_ftq_idx;
  assign ram_fflagdata_bits_uop_ftq_idx_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ftq_idx_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ftq_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_edge_inst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_edge_inst_MPORT_1_data =
    ram_fflagdata_bits_uop_edge_inst[ram_fflagdata_bits_uop_edge_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_edge_inst_MPORT_1_data = ram_fflagdata_bits_uop_edge_inst_MPORT_1_addr >= 3'h7 ?
    _RAND_297[0:0] : ram_fflagdata_bits_uop_edge_inst[ram_fflagdata_bits_uop_edge_inst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_edge_inst_MPORT_data = io_enq_bits_fflagdata_bits_uop_edge_inst;
  assign ram_fflagdata_bits_uop_edge_inst_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_edge_inst_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_edge_inst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_pc_lob_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_pc_lob_MPORT_1_data =
    ram_fflagdata_bits_uop_pc_lob[ram_fflagdata_bits_uop_pc_lob_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_pc_lob_MPORT_1_data = ram_fflagdata_bits_uop_pc_lob_MPORT_1_addr >= 3'h7 ? _RAND_299[5
    :0] : ram_fflagdata_bits_uop_pc_lob[ram_fflagdata_bits_uop_pc_lob_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_pc_lob_MPORT_data = io_enq_bits_fflagdata_bits_uop_pc_lob;
  assign ram_fflagdata_bits_uop_pc_lob_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_pc_lob_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_pc_lob_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_taken_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_taken_MPORT_1_data =
    ram_fflagdata_bits_uop_taken[ram_fflagdata_bits_uop_taken_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_taken_MPORT_1_data = ram_fflagdata_bits_uop_taken_MPORT_1_addr >= 3'h7 ? _RAND_301[0:0]
     : ram_fflagdata_bits_uop_taken[ram_fflagdata_bits_uop_taken_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_taken_MPORT_data = io_enq_bits_fflagdata_bits_uop_taken;
  assign ram_fflagdata_bits_uop_taken_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_taken_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_taken_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_imm_packed_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_imm_packed_MPORT_1_data =
    ram_fflagdata_bits_uop_imm_packed[ram_fflagdata_bits_uop_imm_packed_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_imm_packed_MPORT_1_data = ram_fflagdata_bits_uop_imm_packed_MPORT_1_addr >= 3'h7 ?
    _RAND_303[19:0] : ram_fflagdata_bits_uop_imm_packed[ram_fflagdata_bits_uop_imm_packed_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_imm_packed_MPORT_data = io_enq_bits_fflagdata_bits_uop_imm_packed;
  assign ram_fflagdata_bits_uop_imm_packed_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_imm_packed_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_imm_packed_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_csr_addr_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_csr_addr_MPORT_1_data =
    ram_fflagdata_bits_uop_csr_addr[ram_fflagdata_bits_uop_csr_addr_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_csr_addr_MPORT_1_data = ram_fflagdata_bits_uop_csr_addr_MPORT_1_addr >= 3'h7 ? _RAND_305
    [11:0] : ram_fflagdata_bits_uop_csr_addr[ram_fflagdata_bits_uop_csr_addr_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_csr_addr_MPORT_data = io_enq_bits_fflagdata_bits_uop_csr_addr;
  assign ram_fflagdata_bits_uop_csr_addr_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_csr_addr_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_csr_addr_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_rob_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_rob_idx_MPORT_1_data =
    ram_fflagdata_bits_uop_rob_idx[ram_fflagdata_bits_uop_rob_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_rob_idx_MPORT_1_data = ram_fflagdata_bits_uop_rob_idx_MPORT_1_addr >= 3'h7 ? _RAND_307[5
    :0] : ram_fflagdata_bits_uop_rob_idx[ram_fflagdata_bits_uop_rob_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_rob_idx_MPORT_data = io_enq_bits_fflagdata_bits_uop_rob_idx;
  assign ram_fflagdata_bits_uop_rob_idx_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_rob_idx_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_rob_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ldq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ldq_idx_MPORT_1_data =
    ram_fflagdata_bits_uop_ldq_idx[ram_fflagdata_bits_uop_ldq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ldq_idx_MPORT_1_data = ram_fflagdata_bits_uop_ldq_idx_MPORT_1_addr >= 3'h7 ? _RAND_309[4
    :0] : ram_fflagdata_bits_uop_ldq_idx[ram_fflagdata_bits_uop_ldq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ldq_idx_MPORT_data = io_enq_bits_fflagdata_bits_uop_ldq_idx;
  assign ram_fflagdata_bits_uop_ldq_idx_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ldq_idx_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ldq_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_stq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_stq_idx_MPORT_1_data =
    ram_fflagdata_bits_uop_stq_idx[ram_fflagdata_bits_uop_stq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_stq_idx_MPORT_1_data = ram_fflagdata_bits_uop_stq_idx_MPORT_1_addr >= 3'h7 ? _RAND_311[4
    :0] : ram_fflagdata_bits_uop_stq_idx[ram_fflagdata_bits_uop_stq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_stq_idx_MPORT_data = io_enq_bits_fflagdata_bits_uop_stq_idx;
  assign ram_fflagdata_bits_uop_stq_idx_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_stq_idx_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_stq_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_rxq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_rxq_idx_MPORT_1_data =
    ram_fflagdata_bits_uop_rxq_idx[ram_fflagdata_bits_uop_rxq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_rxq_idx_MPORT_1_data = ram_fflagdata_bits_uop_rxq_idx_MPORT_1_addr >= 3'h7 ? _RAND_313[1
    :0] : ram_fflagdata_bits_uop_rxq_idx[ram_fflagdata_bits_uop_rxq_idx_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_rxq_idx_MPORT_data = io_enq_bits_fflagdata_bits_uop_rxq_idx;
  assign ram_fflagdata_bits_uop_rxq_idx_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_rxq_idx_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_rxq_idx_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_pdst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_pdst_MPORT_1_data =
    ram_fflagdata_bits_uop_pdst[ram_fflagdata_bits_uop_pdst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_pdst_MPORT_1_data = ram_fflagdata_bits_uop_pdst_MPORT_1_addr >= 3'h7 ? _RAND_315[6:0] :
    ram_fflagdata_bits_uop_pdst[ram_fflagdata_bits_uop_pdst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_pdst_MPORT_data = io_enq_bits_fflagdata_bits_uop_pdst;
  assign ram_fflagdata_bits_uop_pdst_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_pdst_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_pdst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_prs1_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs1_MPORT_1_data =
    ram_fflagdata_bits_uop_prs1[ram_fflagdata_bits_uop_prs1_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_prs1_MPORT_1_data = ram_fflagdata_bits_uop_prs1_MPORT_1_addr >= 3'h7 ? _RAND_317[6:0] :
    ram_fflagdata_bits_uop_prs1[ram_fflagdata_bits_uop_prs1_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs1_MPORT_data = io_enq_bits_fflagdata_bits_uop_prs1;
  assign ram_fflagdata_bits_uop_prs1_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_prs1_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_prs1_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_prs2_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs2_MPORT_1_data =
    ram_fflagdata_bits_uop_prs2[ram_fflagdata_bits_uop_prs2_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_prs2_MPORT_1_data = ram_fflagdata_bits_uop_prs2_MPORT_1_addr >= 3'h7 ? _RAND_319[6:0] :
    ram_fflagdata_bits_uop_prs2[ram_fflagdata_bits_uop_prs2_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs2_MPORT_data = io_enq_bits_fflagdata_bits_uop_prs2;
  assign ram_fflagdata_bits_uop_prs2_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_prs2_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_prs2_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_prs3_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs3_MPORT_1_data =
    ram_fflagdata_bits_uop_prs3[ram_fflagdata_bits_uop_prs3_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_prs3_MPORT_1_data = ram_fflagdata_bits_uop_prs3_MPORT_1_addr >= 3'h7 ? _RAND_321[6:0] :
    ram_fflagdata_bits_uop_prs3[ram_fflagdata_bits_uop_prs3_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs3_MPORT_data = io_enq_bits_fflagdata_bits_uop_prs3;
  assign ram_fflagdata_bits_uop_prs3_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_prs3_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_prs3_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ppred_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ppred_MPORT_1_data =
    ram_fflagdata_bits_uop_ppred[ram_fflagdata_bits_uop_ppred_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ppred_MPORT_1_data = ram_fflagdata_bits_uop_ppred_MPORT_1_addr >= 3'h7 ? _RAND_323[4:0]
     : ram_fflagdata_bits_uop_ppred[ram_fflagdata_bits_uop_ppred_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ppred_MPORT_data = io_enq_bits_fflagdata_bits_uop_ppred;
  assign ram_fflagdata_bits_uop_ppred_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ppred_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ppred_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_prs1_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs1_busy_MPORT_1_data =
    ram_fflagdata_bits_uop_prs1_busy[ram_fflagdata_bits_uop_prs1_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_prs1_busy_MPORT_1_data = ram_fflagdata_bits_uop_prs1_busy_MPORT_1_addr >= 3'h7 ?
    _RAND_325[0:0] : ram_fflagdata_bits_uop_prs1_busy[ram_fflagdata_bits_uop_prs1_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs1_busy_MPORT_data = io_enq_bits_fflagdata_bits_uop_prs1_busy;
  assign ram_fflagdata_bits_uop_prs1_busy_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_prs1_busy_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_prs1_busy_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_prs2_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs2_busy_MPORT_1_data =
    ram_fflagdata_bits_uop_prs2_busy[ram_fflagdata_bits_uop_prs2_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_prs2_busy_MPORT_1_data = ram_fflagdata_bits_uop_prs2_busy_MPORT_1_addr >= 3'h7 ?
    _RAND_327[0:0] : ram_fflagdata_bits_uop_prs2_busy[ram_fflagdata_bits_uop_prs2_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs2_busy_MPORT_data = io_enq_bits_fflagdata_bits_uop_prs2_busy;
  assign ram_fflagdata_bits_uop_prs2_busy_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_prs2_busy_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_prs2_busy_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_prs3_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs3_busy_MPORT_1_data =
    ram_fflagdata_bits_uop_prs3_busy[ram_fflagdata_bits_uop_prs3_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_prs3_busy_MPORT_1_data = ram_fflagdata_bits_uop_prs3_busy_MPORT_1_addr >= 3'h7 ?
    _RAND_329[0:0] : ram_fflagdata_bits_uop_prs3_busy[ram_fflagdata_bits_uop_prs3_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_prs3_busy_MPORT_data = io_enq_bits_fflagdata_bits_uop_prs3_busy;
  assign ram_fflagdata_bits_uop_prs3_busy_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_prs3_busy_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_prs3_busy_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ppred_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ppred_busy_MPORT_1_data =
    ram_fflagdata_bits_uop_ppred_busy[ram_fflagdata_bits_uop_ppred_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ppred_busy_MPORT_1_data = ram_fflagdata_bits_uop_ppred_busy_MPORT_1_addr >= 3'h7 ?
    _RAND_331[0:0] : ram_fflagdata_bits_uop_ppred_busy[ram_fflagdata_bits_uop_ppred_busy_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ppred_busy_MPORT_data = io_enq_bits_fflagdata_bits_uop_ppred_busy;
  assign ram_fflagdata_bits_uop_ppred_busy_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ppred_busy_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ppred_busy_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_stale_pdst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_stale_pdst_MPORT_1_data =
    ram_fflagdata_bits_uop_stale_pdst[ram_fflagdata_bits_uop_stale_pdst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_stale_pdst_MPORT_1_data = ram_fflagdata_bits_uop_stale_pdst_MPORT_1_addr >= 3'h7 ?
    _RAND_333[6:0] : ram_fflagdata_bits_uop_stale_pdst[ram_fflagdata_bits_uop_stale_pdst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_stale_pdst_MPORT_data = io_enq_bits_fflagdata_bits_uop_stale_pdst;
  assign ram_fflagdata_bits_uop_stale_pdst_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_stale_pdst_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_stale_pdst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_exception_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_exception_MPORT_1_data =
    ram_fflagdata_bits_uop_exception[ram_fflagdata_bits_uop_exception_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_exception_MPORT_1_data = ram_fflagdata_bits_uop_exception_MPORT_1_addr >= 3'h7 ?
    _RAND_335[0:0] : ram_fflagdata_bits_uop_exception[ram_fflagdata_bits_uop_exception_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_exception_MPORT_data = io_enq_bits_fflagdata_bits_uop_exception;
  assign ram_fflagdata_bits_uop_exception_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_exception_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_exception_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_exc_cause_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_exc_cause_MPORT_1_data =
    ram_fflagdata_bits_uop_exc_cause[ram_fflagdata_bits_uop_exc_cause_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_exc_cause_MPORT_1_data = ram_fflagdata_bits_uop_exc_cause_MPORT_1_addr >= 3'h7 ?
    _RAND_337[63:0] : ram_fflagdata_bits_uop_exc_cause[ram_fflagdata_bits_uop_exc_cause_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_exc_cause_MPORT_data = io_enq_bits_fflagdata_bits_uop_exc_cause;
  assign ram_fflagdata_bits_uop_exc_cause_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_exc_cause_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_exc_cause_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_bypassable_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_bypassable_MPORT_1_data =
    ram_fflagdata_bits_uop_bypassable[ram_fflagdata_bits_uop_bypassable_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_bypassable_MPORT_1_data = ram_fflagdata_bits_uop_bypassable_MPORT_1_addr >= 3'h7 ?
    _RAND_339[0:0] : ram_fflagdata_bits_uop_bypassable[ram_fflagdata_bits_uop_bypassable_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_bypassable_MPORT_data = io_enq_bits_fflagdata_bits_uop_bypassable;
  assign ram_fflagdata_bits_uop_bypassable_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_bypassable_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_bypassable_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_mem_cmd_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_mem_cmd_MPORT_1_data =
    ram_fflagdata_bits_uop_mem_cmd[ram_fflagdata_bits_uop_mem_cmd_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_mem_cmd_MPORT_1_data = ram_fflagdata_bits_uop_mem_cmd_MPORT_1_addr >= 3'h7 ? _RAND_341[4
    :0] : ram_fflagdata_bits_uop_mem_cmd[ram_fflagdata_bits_uop_mem_cmd_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_mem_cmd_MPORT_data = io_enq_bits_fflagdata_bits_uop_mem_cmd;
  assign ram_fflagdata_bits_uop_mem_cmd_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_mem_cmd_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_mem_cmd_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_mem_size_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_mem_size_MPORT_1_data =
    ram_fflagdata_bits_uop_mem_size[ram_fflagdata_bits_uop_mem_size_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_mem_size_MPORT_1_data = ram_fflagdata_bits_uop_mem_size_MPORT_1_addr >= 3'h7 ? _RAND_343
    [1:0] : ram_fflagdata_bits_uop_mem_size[ram_fflagdata_bits_uop_mem_size_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_mem_size_MPORT_data = io_enq_bits_fflagdata_bits_uop_mem_size;
  assign ram_fflagdata_bits_uop_mem_size_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_mem_size_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_mem_size_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_mem_signed_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_mem_signed_MPORT_1_data =
    ram_fflagdata_bits_uop_mem_signed[ram_fflagdata_bits_uop_mem_signed_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_mem_signed_MPORT_1_data = ram_fflagdata_bits_uop_mem_signed_MPORT_1_addr >= 3'h7 ?
    _RAND_345[0:0] : ram_fflagdata_bits_uop_mem_signed[ram_fflagdata_bits_uop_mem_signed_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_mem_signed_MPORT_data = io_enq_bits_fflagdata_bits_uop_mem_signed;
  assign ram_fflagdata_bits_uop_mem_signed_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_mem_signed_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_mem_signed_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_is_fence_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_fence_MPORT_1_data =
    ram_fflagdata_bits_uop_is_fence[ram_fflagdata_bits_uop_is_fence_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_is_fence_MPORT_1_data = ram_fflagdata_bits_uop_is_fence_MPORT_1_addr >= 3'h7 ? _RAND_347
    [0:0] : ram_fflagdata_bits_uop_is_fence[ram_fflagdata_bits_uop_is_fence_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_fence_MPORT_data = io_enq_bits_fflagdata_bits_uop_is_fence;
  assign ram_fflagdata_bits_uop_is_fence_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_is_fence_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_is_fence_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_is_fencei_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_fencei_MPORT_1_data =
    ram_fflagdata_bits_uop_is_fencei[ram_fflagdata_bits_uop_is_fencei_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_is_fencei_MPORT_1_data = ram_fflagdata_bits_uop_is_fencei_MPORT_1_addr >= 3'h7 ?
    _RAND_349[0:0] : ram_fflagdata_bits_uop_is_fencei[ram_fflagdata_bits_uop_is_fencei_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_fencei_MPORT_data = io_enq_bits_fflagdata_bits_uop_is_fencei;
  assign ram_fflagdata_bits_uop_is_fencei_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_is_fencei_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_is_fencei_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_is_amo_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_amo_MPORT_1_data =
    ram_fflagdata_bits_uop_is_amo[ram_fflagdata_bits_uop_is_amo_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_is_amo_MPORT_1_data = ram_fflagdata_bits_uop_is_amo_MPORT_1_addr >= 3'h7 ? _RAND_351[0
    :0] : ram_fflagdata_bits_uop_is_amo[ram_fflagdata_bits_uop_is_amo_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_amo_MPORT_data = io_enq_bits_fflagdata_bits_uop_is_amo;
  assign ram_fflagdata_bits_uop_is_amo_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_is_amo_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_is_amo_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_uses_ldq_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_uses_ldq_MPORT_1_data =
    ram_fflagdata_bits_uop_uses_ldq[ram_fflagdata_bits_uop_uses_ldq_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_uses_ldq_MPORT_1_data = ram_fflagdata_bits_uop_uses_ldq_MPORT_1_addr >= 3'h7 ? _RAND_353
    [0:0] : ram_fflagdata_bits_uop_uses_ldq[ram_fflagdata_bits_uop_uses_ldq_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_uses_ldq_MPORT_data = io_enq_bits_fflagdata_bits_uop_uses_ldq;
  assign ram_fflagdata_bits_uop_uses_ldq_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_uses_ldq_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_uses_ldq_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_uses_stq_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_uses_stq_MPORT_1_data =
    ram_fflagdata_bits_uop_uses_stq[ram_fflagdata_bits_uop_uses_stq_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_uses_stq_MPORT_1_data = ram_fflagdata_bits_uop_uses_stq_MPORT_1_addr >= 3'h7 ? _RAND_355
    [0:0] : ram_fflagdata_bits_uop_uses_stq[ram_fflagdata_bits_uop_uses_stq_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_uses_stq_MPORT_data = io_enq_bits_fflagdata_bits_uop_uses_stq;
  assign ram_fflagdata_bits_uop_uses_stq_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_uses_stq_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_uses_stq_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_1_data =
    ram_fflagdata_bits_uop_is_sys_pc2epc[ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_1_data = ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_1_addr >= 3'h7
     ? _RAND_357[0:0] : ram_fflagdata_bits_uop_is_sys_pc2epc[ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_data = io_enq_bits_fflagdata_bits_uop_is_sys_pc2epc;
  assign ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_is_unique_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_unique_MPORT_1_data =
    ram_fflagdata_bits_uop_is_unique[ram_fflagdata_bits_uop_is_unique_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_is_unique_MPORT_1_data = ram_fflagdata_bits_uop_is_unique_MPORT_1_addr >= 3'h7 ?
    _RAND_359[0:0] : ram_fflagdata_bits_uop_is_unique[ram_fflagdata_bits_uop_is_unique_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_is_unique_MPORT_data = io_enq_bits_fflagdata_bits_uop_is_unique;
  assign ram_fflagdata_bits_uop_is_unique_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_is_unique_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_is_unique_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_flush_on_commit_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_flush_on_commit_MPORT_1_data =
    ram_fflagdata_bits_uop_flush_on_commit[ram_fflagdata_bits_uop_flush_on_commit_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_flush_on_commit_MPORT_1_data = ram_fflagdata_bits_uop_flush_on_commit_MPORT_1_addr >= 3'h7
     ? _RAND_361[0:0] : ram_fflagdata_bits_uop_flush_on_commit[ram_fflagdata_bits_uop_flush_on_commit_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_flush_on_commit_MPORT_data = io_enq_bits_fflagdata_bits_uop_flush_on_commit;
  assign ram_fflagdata_bits_uop_flush_on_commit_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_flush_on_commit_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_flush_on_commit_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_1_data =
    ram_fflagdata_bits_uop_ldst_is_rs1[ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_1_data = ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_1_addr >= 3'h7 ?
    _RAND_363[0:0] : ram_fflagdata_bits_uop_ldst_is_rs1[ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_data = io_enq_bits_fflagdata_bits_uop_ldst_is_rs1;
  assign ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ldst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ldst_MPORT_1_data =
    ram_fflagdata_bits_uop_ldst[ram_fflagdata_bits_uop_ldst_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ldst_MPORT_1_data = ram_fflagdata_bits_uop_ldst_MPORT_1_addr >= 3'h7 ? _RAND_365[5:0] :
    ram_fflagdata_bits_uop_ldst[ram_fflagdata_bits_uop_ldst_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ldst_MPORT_data = io_enq_bits_fflagdata_bits_uop_ldst;
  assign ram_fflagdata_bits_uop_ldst_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ldst_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ldst_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_lrs1_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs1_MPORT_1_data =
    ram_fflagdata_bits_uop_lrs1[ram_fflagdata_bits_uop_lrs1_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_lrs1_MPORT_1_data = ram_fflagdata_bits_uop_lrs1_MPORT_1_addr >= 3'h7 ? _RAND_367[5:0] :
    ram_fflagdata_bits_uop_lrs1[ram_fflagdata_bits_uop_lrs1_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs1_MPORT_data = io_enq_bits_fflagdata_bits_uop_lrs1;
  assign ram_fflagdata_bits_uop_lrs1_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_lrs1_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_lrs1_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_lrs2_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs2_MPORT_1_data =
    ram_fflagdata_bits_uop_lrs2[ram_fflagdata_bits_uop_lrs2_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_lrs2_MPORT_1_data = ram_fflagdata_bits_uop_lrs2_MPORT_1_addr >= 3'h7 ? _RAND_369[5:0] :
    ram_fflagdata_bits_uop_lrs2[ram_fflagdata_bits_uop_lrs2_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs2_MPORT_data = io_enq_bits_fflagdata_bits_uop_lrs2;
  assign ram_fflagdata_bits_uop_lrs2_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_lrs2_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_lrs2_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_lrs3_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs3_MPORT_1_data =
    ram_fflagdata_bits_uop_lrs3[ram_fflagdata_bits_uop_lrs3_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_lrs3_MPORT_1_data = ram_fflagdata_bits_uop_lrs3_MPORT_1_addr >= 3'h7 ? _RAND_371[5:0] :
    ram_fflagdata_bits_uop_lrs3[ram_fflagdata_bits_uop_lrs3_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs3_MPORT_data = io_enq_bits_fflagdata_bits_uop_lrs3;
  assign ram_fflagdata_bits_uop_lrs3_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_lrs3_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_lrs3_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_ldst_val_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ldst_val_MPORT_1_data =
    ram_fflagdata_bits_uop_ldst_val[ram_fflagdata_bits_uop_ldst_val_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_ldst_val_MPORT_1_data = ram_fflagdata_bits_uop_ldst_val_MPORT_1_addr >= 3'h7 ? _RAND_373
    [0:0] : ram_fflagdata_bits_uop_ldst_val[ram_fflagdata_bits_uop_ldst_val_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_ldst_val_MPORT_data = io_enq_bits_fflagdata_bits_uop_ldst_val;
  assign ram_fflagdata_bits_uop_ldst_val_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_ldst_val_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_ldst_val_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_dst_rtype_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_dst_rtype_MPORT_1_data =
    ram_fflagdata_bits_uop_dst_rtype[ram_fflagdata_bits_uop_dst_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_dst_rtype_MPORT_1_data = ram_fflagdata_bits_uop_dst_rtype_MPORT_1_addr >= 3'h7 ?
    _RAND_375[1:0] : ram_fflagdata_bits_uop_dst_rtype[ram_fflagdata_bits_uop_dst_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_dst_rtype_MPORT_data = io_enq_bits_fflagdata_bits_uop_dst_rtype;
  assign ram_fflagdata_bits_uop_dst_rtype_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_dst_rtype_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_dst_rtype_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_lrs1_rtype_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs1_rtype_MPORT_1_data =
    ram_fflagdata_bits_uop_lrs1_rtype[ram_fflagdata_bits_uop_lrs1_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_lrs1_rtype_MPORT_1_data = ram_fflagdata_bits_uop_lrs1_rtype_MPORT_1_addr >= 3'h7 ?
    _RAND_377[1:0] : ram_fflagdata_bits_uop_lrs1_rtype[ram_fflagdata_bits_uop_lrs1_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs1_rtype_MPORT_data = io_enq_bits_fflagdata_bits_uop_lrs1_rtype;
  assign ram_fflagdata_bits_uop_lrs1_rtype_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_lrs1_rtype_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_lrs1_rtype_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_lrs2_rtype_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs2_rtype_MPORT_1_data =
    ram_fflagdata_bits_uop_lrs2_rtype[ram_fflagdata_bits_uop_lrs2_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_lrs2_rtype_MPORT_1_data = ram_fflagdata_bits_uop_lrs2_rtype_MPORT_1_addr >= 3'h7 ?
    _RAND_379[1:0] : ram_fflagdata_bits_uop_lrs2_rtype[ram_fflagdata_bits_uop_lrs2_rtype_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_lrs2_rtype_MPORT_data = io_enq_bits_fflagdata_bits_uop_lrs2_rtype;
  assign ram_fflagdata_bits_uop_lrs2_rtype_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_lrs2_rtype_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_lrs2_rtype_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_frs3_en_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_frs3_en_MPORT_1_data =
    ram_fflagdata_bits_uop_frs3_en[ram_fflagdata_bits_uop_frs3_en_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_frs3_en_MPORT_1_data = ram_fflagdata_bits_uop_frs3_en_MPORT_1_addr >= 3'h7 ? _RAND_381[0
    :0] : ram_fflagdata_bits_uop_frs3_en[ram_fflagdata_bits_uop_frs3_en_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_frs3_en_MPORT_data = io_enq_bits_fflagdata_bits_uop_frs3_en;
  assign ram_fflagdata_bits_uop_frs3_en_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_frs3_en_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_frs3_en_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_fp_val_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_fp_val_MPORT_1_data =
    ram_fflagdata_bits_uop_fp_val[ram_fflagdata_bits_uop_fp_val_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_fp_val_MPORT_1_data = ram_fflagdata_bits_uop_fp_val_MPORT_1_addr >= 3'h7 ? _RAND_383[0
    :0] : ram_fflagdata_bits_uop_fp_val[ram_fflagdata_bits_uop_fp_val_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_fp_val_MPORT_data = io_enq_bits_fflagdata_bits_uop_fp_val;
  assign ram_fflagdata_bits_uop_fp_val_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_fp_val_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_fp_val_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_fp_single_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_fp_single_MPORT_1_data =
    ram_fflagdata_bits_uop_fp_single[ram_fflagdata_bits_uop_fp_single_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_fp_single_MPORT_1_data = ram_fflagdata_bits_uop_fp_single_MPORT_1_addr >= 3'h7 ?
    _RAND_385[0:0] : ram_fflagdata_bits_uop_fp_single[ram_fflagdata_bits_uop_fp_single_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_fp_single_MPORT_data = io_enq_bits_fflagdata_bits_uop_fp_single;
  assign ram_fflagdata_bits_uop_fp_single_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_fp_single_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_fp_single_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_1_data =
    ram_fflagdata_bits_uop_xcpt_pf_if[ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_1_data = ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_1_addr >= 3'h7 ?
    _RAND_387[0:0] : ram_fflagdata_bits_uop_xcpt_pf_if[ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_data = io_enq_bits_fflagdata_bits_uop_xcpt_pf_if;
  assign ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_1_data =
    ram_fflagdata_bits_uop_xcpt_ae_if[ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_1_data = ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_1_addr >= 3'h7 ?
    _RAND_389[0:0] : ram_fflagdata_bits_uop_xcpt_ae_if[ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_data = io_enq_bits_fflagdata_bits_uop_xcpt_ae_if;
  assign ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_1_data =
    ram_fflagdata_bits_uop_xcpt_ma_if[ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_1_data = ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_1_addr >= 3'h7 ?
    _RAND_391[0:0] : ram_fflagdata_bits_uop_xcpt_ma_if[ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_data = io_enq_bits_fflagdata_bits_uop_xcpt_ma_if;
  assign ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_bp_debug_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_bp_debug_if_MPORT_1_data =
    ram_fflagdata_bits_uop_bp_debug_if[ram_fflagdata_bits_uop_bp_debug_if_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_bp_debug_if_MPORT_1_data = ram_fflagdata_bits_uop_bp_debug_if_MPORT_1_addr >= 3'h7 ?
    _RAND_393[0:0] : ram_fflagdata_bits_uop_bp_debug_if[ram_fflagdata_bits_uop_bp_debug_if_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_bp_debug_if_MPORT_data = io_enq_bits_fflagdata_bits_uop_bp_debug_if;
  assign ram_fflagdata_bits_uop_bp_debug_if_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_bp_debug_if_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_bp_debug_if_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_1_data =
    ram_fflagdata_bits_uop_bp_xcpt_if[ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_1_data = ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_1_addr >= 3'h7 ?
    _RAND_395[0:0] : ram_fflagdata_bits_uop_bp_xcpt_if[ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_data = io_enq_bits_fflagdata_bits_uop_bp_xcpt_if;
  assign ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_debug_fsrc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_debug_fsrc_MPORT_1_data =
    ram_fflagdata_bits_uop_debug_fsrc[ram_fflagdata_bits_uop_debug_fsrc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_debug_fsrc_MPORT_1_data = ram_fflagdata_bits_uop_debug_fsrc_MPORT_1_addr >= 3'h7 ?
    _RAND_397[1:0] : ram_fflagdata_bits_uop_debug_fsrc[ram_fflagdata_bits_uop_debug_fsrc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_debug_fsrc_MPORT_data = io_enq_bits_fflagdata_bits_uop_debug_fsrc;
  assign ram_fflagdata_bits_uop_debug_fsrc_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_debug_fsrc_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_debug_fsrc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_uop_debug_tsrc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_debug_tsrc_MPORT_1_data =
    ram_fflagdata_bits_uop_debug_tsrc[ram_fflagdata_bits_uop_debug_tsrc_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_uop_debug_tsrc_MPORT_1_data = ram_fflagdata_bits_uop_debug_tsrc_MPORT_1_addr >= 3'h7 ?
    _RAND_399[1:0] : ram_fflagdata_bits_uop_debug_tsrc[ram_fflagdata_bits_uop_debug_tsrc_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_uop_debug_tsrc_MPORT_data = io_enq_bits_fflagdata_bits_uop_debug_tsrc;
  assign ram_fflagdata_bits_uop_debug_tsrc_MPORT_addr = value;
  assign ram_fflagdata_bits_uop_debug_tsrc_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_uop_debug_tsrc_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign ram_fflagdata_bits_fflag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_fflag_MPORT_1_data = ram_fflagdata_bits_fflag[ram_fflagdata_bits_fflag_MPORT_1_addr]; // @[util.scala 535:20]
  `else
  assign ram_fflagdata_bits_fflag_MPORT_1_data = ram_fflagdata_bits_fflag_MPORT_1_addr >= 3'h7 ? _RAND_401[31:0] :
    ram_fflagdata_bits_fflag[ram_fflagdata_bits_fflag_MPORT_1_addr]; // @[util.scala 535:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflagdata_bits_fflag_MPORT_data = io_enq_bits_fflagdata_bits_fflag;
  assign ram_fflagdata_bits_fflag_MPORT_addr = value;
  assign ram_fflagdata_bits_fflag_MPORT_mask = 1'h1;
  assign ram_fflagdata_bits_fflag_MPORT_en = io_empty ? _GEN_2393 : _T_2;
  assign io_enq_ready = ~full; // @[util.scala 575:19]
  assign io_deq_valid = io_empty ? io_enq_valid : _T_5 & _GEN_6 & ~_T_77 & _T_12; // @[util.scala 586:21 util.scala 587:20 util.scala 580:27]
  assign io_deq_bits_uop_switch = io_empty ? io_enq_bits_uop_switch : out_uop_switch; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_switch_off = io_empty ? io_enq_bits_uop_switch_off : out_uop_switch_off; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_is_unicore = io_empty ? io_enq_bits_uop_is_unicore : out_uop_is_unicore; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_shift = io_empty ? io_enq_bits_uop_shift : out_uop_shift; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_lrs3_rtype = io_empty ? io_enq_bits_uop_lrs3_rtype : out_uop_lrs3_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_rflag = io_empty ? io_enq_bits_uop_rflag : out_uop_rflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_wflag = io_empty ? io_enq_bits_uop_wflag : out_uop_wflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_prflag = io_empty ? io_enq_bits_uop_prflag : out_uop_prflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_pwflag = io_empty ? io_enq_bits_uop_pwflag : out_uop_pwflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_pflag_busy = io_empty ? io_enq_bits_uop_pflag_busy : out_uop_pflag_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_stale_pflag = io_empty ? io_enq_bits_uop_stale_pflag : out_uop_stale_pflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_op1_sel = io_empty ? io_enq_bits_uop_op1_sel : out_uop_op1_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_op2_sel = io_empty ? io_enq_bits_uop_op2_sel : out_uop_op2_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_split_num = io_empty ? io_enq_bits_uop_split_num : out_uop_split_num; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_self_index = io_empty ? io_enq_bits_uop_self_index : out_uop_self_index; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_rob_inst_idx = io_empty ? io_enq_bits_uop_rob_inst_idx : out_uop_rob_inst_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_address_num = io_empty ? io_enq_bits_uop_address_num : out_uop_address_num; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_uopc = io_empty ? io_enq_bits_uop_uopc : out_uop_uopc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_inst = io_empty ? io_enq_bits_uop_inst : out_uop_inst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_debug_inst = io_empty ? io_enq_bits_uop_debug_inst : out_uop_debug_inst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_is_rvc = io_empty ? io_enq_bits_uop_is_rvc : out_uop_is_rvc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_debug_pc = io_empty ? io_enq_bits_uop_debug_pc : out_uop_debug_pc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_iq_type = io_empty ? io_enq_bits_uop_iq_type : out_uop_iq_type; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_fu_code = io_empty ? io_enq_bits_uop_fu_code : out_uop_fu_code; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ctrl_br_type = io_empty ? io_enq_bits_uop_ctrl_br_type : out_uop_ctrl_br_type; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ctrl_op1_sel = io_empty ? io_enq_bits_uop_ctrl_op1_sel : out_uop_ctrl_op1_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ctrl_op2_sel = io_empty ? io_enq_bits_uop_ctrl_op2_sel : out_uop_ctrl_op2_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ctrl_imm_sel = io_empty ? io_enq_bits_uop_ctrl_imm_sel : out_uop_ctrl_imm_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ctrl_op_fcn = io_empty ? io_enq_bits_uop_ctrl_op_fcn : out_uop_ctrl_op_fcn; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ctrl_fcn_dw = io_empty ? io_enq_bits_uop_ctrl_fcn_dw : out_uop_ctrl_fcn_dw; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ctrl_csr_cmd = io_empty ? io_enq_bits_uop_ctrl_csr_cmd : out_uop_ctrl_csr_cmd; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ctrl_is_load = io_empty ? io_enq_bits_uop_ctrl_is_load : out_uop_ctrl_is_load; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ctrl_is_sta = io_empty ? io_enq_bits_uop_ctrl_is_sta : out_uop_ctrl_is_sta; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ctrl_is_std = io_empty ? io_enq_bits_uop_ctrl_is_std : out_uop_ctrl_is_std; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ctrl_op3_sel = io_empty ? io_enq_bits_uop_ctrl_op3_sel : out_uop_ctrl_op3_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_iw_state = io_empty ? io_enq_bits_uop_iw_state : out_uop_iw_state; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_iw_p1_poisoned = io_empty ? io_enq_bits_uop_iw_p1_poisoned : out_uop_iw_p1_poisoned; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_iw_p2_poisoned = io_empty ? io_enq_bits_uop_iw_p2_poisoned : out_uop_iw_p2_poisoned; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_is_br = io_empty ? io_enq_bits_uop_is_br : out_uop_is_br; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_is_jalr = io_empty ? io_enq_bits_uop_is_jalr : out_uop_is_jalr; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_is_jal = io_empty ? io_enq_bits_uop_is_jal : out_uop_is_jal; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_is_sfb = io_empty ? io_enq_bits_uop_is_sfb : out_uop_is_sfb; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_br_mask = io_empty ? _T_71 : _T_84; // @[util.scala 586:21 util.scala 589:31 util.scala 582:27]
  assign io_deq_bits_uop_br_tag = io_empty ? io_enq_bits_uop_br_tag : out_uop_br_tag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ftq_idx = io_empty ? io_enq_bits_uop_ftq_idx : out_uop_ftq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_edge_inst = io_empty ? io_enq_bits_uop_edge_inst : out_uop_edge_inst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_pc_lob = io_empty ? io_enq_bits_uop_pc_lob : out_uop_pc_lob; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_taken = io_empty ? io_enq_bits_uop_taken : out_uop_taken; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_imm_packed = io_empty ? io_enq_bits_uop_imm_packed : out_uop_imm_packed; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_csr_addr = io_empty ? io_enq_bits_uop_csr_addr : out_uop_csr_addr; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_rob_idx = io_empty ? io_enq_bits_uop_rob_idx : out_uop_rob_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ldq_idx = io_empty ? io_enq_bits_uop_ldq_idx : out_uop_ldq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_stq_idx = io_empty ? io_enq_bits_uop_stq_idx : out_uop_stq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_rxq_idx = io_empty ? io_enq_bits_uop_rxq_idx : out_uop_rxq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_pdst = io_empty ? io_enq_bits_uop_pdst : out_uop_pdst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_prs1 = io_empty ? io_enq_bits_uop_prs1 : out_uop_prs1; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_prs2 = io_empty ? io_enq_bits_uop_prs2 : out_uop_prs2; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_prs3 = io_empty ? io_enq_bits_uop_prs3 : out_uop_prs3; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ppred = io_empty ? io_enq_bits_uop_ppred : out_uop_ppred; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_prs1_busy = io_empty ? io_enq_bits_uop_prs1_busy : out_uop_prs1_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_prs2_busy = io_empty ? io_enq_bits_uop_prs2_busy : out_uop_prs2_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_prs3_busy = io_empty ? io_enq_bits_uop_prs3_busy : out_uop_prs3_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ppred_busy = io_empty ? io_enq_bits_uop_ppred_busy : out_uop_ppred_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_stale_pdst = io_empty ? io_enq_bits_uop_stale_pdst : out_uop_stale_pdst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_exception = io_empty ? io_enq_bits_uop_exception : out_uop_exception; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_exc_cause = io_empty ? io_enq_bits_uop_exc_cause : out_uop_exc_cause; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_bypassable = io_empty ? io_enq_bits_uop_bypassable : out_uop_bypassable; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_mem_cmd = io_empty ? io_enq_bits_uop_mem_cmd : out_uop_mem_cmd; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_mem_size = io_empty ? io_enq_bits_uop_mem_size : out_uop_mem_size; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_mem_signed = io_empty ? io_enq_bits_uop_mem_signed : out_uop_mem_signed; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_is_fence = io_empty ? io_enq_bits_uop_is_fence : out_uop_is_fence; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_is_fencei = io_empty ? io_enq_bits_uop_is_fencei : out_uop_is_fencei; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_is_amo = io_empty ? io_enq_bits_uop_is_amo : out_uop_is_amo; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_uses_ldq = io_empty ? io_enq_bits_uop_uses_ldq : out_uop_uses_ldq; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_uses_stq = io_empty ? io_enq_bits_uop_uses_stq : out_uop_uses_stq; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_is_sys_pc2epc = io_empty ? io_enq_bits_uop_is_sys_pc2epc : out_uop_is_sys_pc2epc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_is_unique = io_empty ? io_enq_bits_uop_is_unique : out_uop_is_unique; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_flush_on_commit = io_empty ? io_enq_bits_uop_flush_on_commit : out_uop_flush_on_commit; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ldst_is_rs1 = io_empty ? io_enq_bits_uop_ldst_is_rs1 : out_uop_ldst_is_rs1; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ldst = io_empty ? io_enq_bits_uop_ldst : out_uop_ldst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_lrs1 = io_empty ? io_enq_bits_uop_lrs1 : out_uop_lrs1; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_lrs2 = io_empty ? io_enq_bits_uop_lrs2 : out_uop_lrs2; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_lrs3 = io_empty ? io_enq_bits_uop_lrs3 : out_uop_lrs3; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_ldst_val = io_empty ? io_enq_bits_uop_ldst_val : out_uop_ldst_val; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_dst_rtype = io_empty ? io_enq_bits_uop_dst_rtype : out_uop_dst_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_lrs1_rtype = io_empty ? io_enq_bits_uop_lrs1_rtype : out_uop_lrs1_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_lrs2_rtype = io_empty ? io_enq_bits_uop_lrs2_rtype : out_uop_lrs2_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_frs3_en = io_empty ? io_enq_bits_uop_frs3_en : out_uop_frs3_en; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_fp_val = io_empty ? io_enq_bits_uop_fp_val : out_uop_fp_val; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_fp_single = io_empty ? io_enq_bits_uop_fp_single : out_uop_fp_single; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_xcpt_pf_if = io_empty ? io_enq_bits_uop_xcpt_pf_if : out_uop_xcpt_pf_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_xcpt_ae_if = io_empty ? io_enq_bits_uop_xcpt_ae_if : out_uop_xcpt_ae_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_xcpt_ma_if = io_empty ? io_enq_bits_uop_xcpt_ma_if : out_uop_xcpt_ma_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_bp_debug_if = io_empty ? io_enq_bits_uop_bp_debug_if : out_uop_bp_debug_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_bp_xcpt_if = io_empty ? io_enq_bits_uop_bp_xcpt_if : out_uop_bp_xcpt_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_debug_fsrc = io_empty ? io_enq_bits_uop_debug_fsrc : out_uop_debug_fsrc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_uop_debug_tsrc = io_empty ? io_enq_bits_uop_debug_tsrc : out_uop_debug_tsrc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_data = io_empty ? io_enq_bits_data : out_data; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_predicated = io_empty ? io_enq_bits_predicated : out_predicated; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_valid = io_empty ? io_enq_bits_fflags_valid : out_fflags_valid; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_switch = io_empty ? io_enq_bits_fflags_bits_uop_switch : out_fflags_bits_uop_switch
    ; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_switch_off = io_empty ? io_enq_bits_fflags_bits_uop_switch_off :
    out_fflags_bits_uop_switch_off; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_is_unicore = io_empty ? io_enq_bits_fflags_bits_uop_is_unicore :
    out_fflags_bits_uop_is_unicore; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_shift = io_empty ? io_enq_bits_fflags_bits_uop_shift : out_fflags_bits_uop_shift; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_lrs3_rtype = io_empty ? io_enq_bits_fflags_bits_uop_lrs3_rtype :
    out_fflags_bits_uop_lrs3_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_rflag = io_empty ? io_enq_bits_fflags_bits_uop_rflag : out_fflags_bits_uop_rflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_wflag = io_empty ? io_enq_bits_fflags_bits_uop_wflag : out_fflags_bits_uop_wflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_prflag = io_empty ? io_enq_bits_fflags_bits_uop_prflag : out_fflags_bits_uop_prflag
    ; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_pwflag = io_empty ? io_enq_bits_fflags_bits_uop_pwflag : out_fflags_bits_uop_pwflag
    ; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_pflag_busy = io_empty ? io_enq_bits_fflags_bits_uop_pflag_busy :
    out_fflags_bits_uop_pflag_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_stale_pflag = io_empty ? io_enq_bits_fflags_bits_uop_stale_pflag :
    out_fflags_bits_uop_stale_pflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_op1_sel = io_empty ? io_enq_bits_fflags_bits_uop_op1_sel :
    out_fflags_bits_uop_op1_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_op2_sel = io_empty ? io_enq_bits_fflags_bits_uop_op2_sel :
    out_fflags_bits_uop_op2_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_split_num = io_empty ? io_enq_bits_fflags_bits_uop_split_num :
    out_fflags_bits_uop_split_num; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_self_index = io_empty ? io_enq_bits_fflags_bits_uop_self_index :
    out_fflags_bits_uop_self_index; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_rob_inst_idx = io_empty ? io_enq_bits_fflags_bits_uop_rob_inst_idx :
    out_fflags_bits_uop_rob_inst_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_address_num = io_empty ? io_enq_bits_fflags_bits_uop_address_num :
    out_fflags_bits_uop_address_num; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_uopc = io_empty ? io_enq_bits_fflags_bits_uop_uopc : out_fflags_bits_uop_uopc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_inst = io_empty ? io_enq_bits_fflags_bits_uop_inst : out_fflags_bits_uop_inst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_debug_inst = io_empty ? io_enq_bits_fflags_bits_uop_debug_inst :
    out_fflags_bits_uop_debug_inst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_is_rvc = io_empty ? io_enq_bits_fflags_bits_uop_is_rvc : out_fflags_bits_uop_is_rvc
    ; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_debug_pc = io_empty ? io_enq_bits_fflags_bits_uop_debug_pc :
    out_fflags_bits_uop_debug_pc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_iq_type = io_empty ? io_enq_bits_fflags_bits_uop_iq_type :
    out_fflags_bits_uop_iq_type; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_fu_code = io_empty ? io_enq_bits_fflags_bits_uop_fu_code :
    out_fflags_bits_uop_fu_code; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_br_type = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_br_type :
    out_fflags_bits_uop_ctrl_br_type; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_op1_sel = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_op1_sel :
    out_fflags_bits_uop_ctrl_op1_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_op2_sel = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_op2_sel :
    out_fflags_bits_uop_ctrl_op2_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_imm_sel = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_imm_sel :
    out_fflags_bits_uop_ctrl_imm_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_op_fcn = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_op_fcn :
    out_fflags_bits_uop_ctrl_op_fcn; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_fcn_dw = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_fcn_dw :
    out_fflags_bits_uop_ctrl_fcn_dw; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_csr_cmd = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_csr_cmd :
    out_fflags_bits_uop_ctrl_csr_cmd; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_is_load = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_is_load :
    out_fflags_bits_uop_ctrl_is_load; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_is_sta = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_is_sta :
    out_fflags_bits_uop_ctrl_is_sta; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_is_std = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_is_std :
    out_fflags_bits_uop_ctrl_is_std; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_op3_sel = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_op3_sel :
    out_fflags_bits_uop_ctrl_op3_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_iw_state = io_empty ? io_enq_bits_fflags_bits_uop_iw_state :
    out_fflags_bits_uop_iw_state; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_iw_p1_poisoned = io_empty ? io_enq_bits_fflags_bits_uop_iw_p1_poisoned :
    out_fflags_bits_uop_iw_p1_poisoned; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_iw_p2_poisoned = io_empty ? io_enq_bits_fflags_bits_uop_iw_p2_poisoned :
    out_fflags_bits_uop_iw_p2_poisoned; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_is_br = io_empty ? io_enq_bits_fflags_bits_uop_is_br : out_fflags_bits_uop_is_br; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_is_jalr = io_empty ? io_enq_bits_fflags_bits_uop_is_jalr :
    out_fflags_bits_uop_is_jalr; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_is_jal = io_empty ? io_enq_bits_fflags_bits_uop_is_jal : out_fflags_bits_uop_is_jal
    ; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_is_sfb = io_empty ? io_enq_bits_fflags_bits_uop_is_sfb : out_fflags_bits_uop_is_sfb
    ; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_br_mask = io_empty ? io_enq_bits_fflags_bits_uop_br_mask :
    out_fflags_bits_uop_br_mask; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_br_tag = io_empty ? io_enq_bits_fflags_bits_uop_br_tag : out_fflags_bits_uop_br_tag
    ; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ftq_idx = io_empty ? io_enq_bits_fflags_bits_uop_ftq_idx :
    out_fflags_bits_uop_ftq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_edge_inst = io_empty ? io_enq_bits_fflags_bits_uop_edge_inst :
    out_fflags_bits_uop_edge_inst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_pc_lob = io_empty ? io_enq_bits_fflags_bits_uop_pc_lob : out_fflags_bits_uop_pc_lob
    ; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_taken = io_empty ? io_enq_bits_fflags_bits_uop_taken : out_fflags_bits_uop_taken; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_imm_packed = io_empty ? io_enq_bits_fflags_bits_uop_imm_packed :
    out_fflags_bits_uop_imm_packed; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_csr_addr = io_empty ? io_enq_bits_fflags_bits_uop_csr_addr :
    out_fflags_bits_uop_csr_addr; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_rob_idx = io_empty ? io_enq_bits_fflags_bits_uop_rob_idx :
    out_fflags_bits_uop_rob_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ldq_idx = io_empty ? io_enq_bits_fflags_bits_uop_ldq_idx :
    out_fflags_bits_uop_ldq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_stq_idx = io_empty ? io_enq_bits_fflags_bits_uop_stq_idx :
    out_fflags_bits_uop_stq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_rxq_idx = io_empty ? io_enq_bits_fflags_bits_uop_rxq_idx :
    out_fflags_bits_uop_rxq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_pdst = io_empty ? io_enq_bits_fflags_bits_uop_pdst : out_fflags_bits_uop_pdst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_prs1 = io_empty ? io_enq_bits_fflags_bits_uop_prs1 : out_fflags_bits_uop_prs1; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_prs2 = io_empty ? io_enq_bits_fflags_bits_uop_prs2 : out_fflags_bits_uop_prs2; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_prs3 = io_empty ? io_enq_bits_fflags_bits_uop_prs3 : out_fflags_bits_uop_prs3; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ppred = io_empty ? io_enq_bits_fflags_bits_uop_ppred : out_fflags_bits_uop_ppred; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_prs1_busy = io_empty ? io_enq_bits_fflags_bits_uop_prs1_busy :
    out_fflags_bits_uop_prs1_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_prs2_busy = io_empty ? io_enq_bits_fflags_bits_uop_prs2_busy :
    out_fflags_bits_uop_prs2_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_prs3_busy = io_empty ? io_enq_bits_fflags_bits_uop_prs3_busy :
    out_fflags_bits_uop_prs3_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ppred_busy = io_empty ? io_enq_bits_fflags_bits_uop_ppred_busy :
    out_fflags_bits_uop_ppred_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_stale_pdst = io_empty ? io_enq_bits_fflags_bits_uop_stale_pdst :
    out_fflags_bits_uop_stale_pdst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_exception = io_empty ? io_enq_bits_fflags_bits_uop_exception :
    out_fflags_bits_uop_exception; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_exc_cause = io_empty ? io_enq_bits_fflags_bits_uop_exc_cause :
    out_fflags_bits_uop_exc_cause; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_bypassable = io_empty ? io_enq_bits_fflags_bits_uop_bypassable :
    out_fflags_bits_uop_bypassable; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_mem_cmd = io_empty ? io_enq_bits_fflags_bits_uop_mem_cmd :
    out_fflags_bits_uop_mem_cmd; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_mem_size = io_empty ? io_enq_bits_fflags_bits_uop_mem_size :
    out_fflags_bits_uop_mem_size; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_mem_signed = io_empty ? io_enq_bits_fflags_bits_uop_mem_signed :
    out_fflags_bits_uop_mem_signed; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_is_fence = io_empty ? io_enq_bits_fflags_bits_uop_is_fence :
    out_fflags_bits_uop_is_fence; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_is_fencei = io_empty ? io_enq_bits_fflags_bits_uop_is_fencei :
    out_fflags_bits_uop_is_fencei; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_is_amo = io_empty ? io_enq_bits_fflags_bits_uop_is_amo : out_fflags_bits_uop_is_amo
    ; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_uses_ldq = io_empty ? io_enq_bits_fflags_bits_uop_uses_ldq :
    out_fflags_bits_uop_uses_ldq; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_uses_stq = io_empty ? io_enq_bits_fflags_bits_uop_uses_stq :
    out_fflags_bits_uop_uses_stq; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_is_sys_pc2epc = io_empty ? io_enq_bits_fflags_bits_uop_is_sys_pc2epc :
    out_fflags_bits_uop_is_sys_pc2epc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_is_unique = io_empty ? io_enq_bits_fflags_bits_uop_is_unique :
    out_fflags_bits_uop_is_unique; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_flush_on_commit = io_empty ? io_enq_bits_fflags_bits_uop_flush_on_commit :
    out_fflags_bits_uop_flush_on_commit; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ldst_is_rs1 = io_empty ? io_enq_bits_fflags_bits_uop_ldst_is_rs1 :
    out_fflags_bits_uop_ldst_is_rs1; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ldst = io_empty ? io_enq_bits_fflags_bits_uop_ldst : out_fflags_bits_uop_ldst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_lrs1 = io_empty ? io_enq_bits_fflags_bits_uop_lrs1 : out_fflags_bits_uop_lrs1; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_lrs2 = io_empty ? io_enq_bits_fflags_bits_uop_lrs2 : out_fflags_bits_uop_lrs2; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_lrs3 = io_empty ? io_enq_bits_fflags_bits_uop_lrs3 : out_fflags_bits_uop_lrs3; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_ldst_val = io_empty ? io_enq_bits_fflags_bits_uop_ldst_val :
    out_fflags_bits_uop_ldst_val; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_dst_rtype = io_empty ? io_enq_bits_fflags_bits_uop_dst_rtype :
    out_fflags_bits_uop_dst_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_lrs1_rtype = io_empty ? io_enq_bits_fflags_bits_uop_lrs1_rtype :
    out_fflags_bits_uop_lrs1_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_lrs2_rtype = io_empty ? io_enq_bits_fflags_bits_uop_lrs2_rtype :
    out_fflags_bits_uop_lrs2_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_frs3_en = io_empty ? io_enq_bits_fflags_bits_uop_frs3_en :
    out_fflags_bits_uop_frs3_en; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_fp_val = io_empty ? io_enq_bits_fflags_bits_uop_fp_val : out_fflags_bits_uop_fp_val
    ; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_fp_single = io_empty ? io_enq_bits_fflags_bits_uop_fp_single :
    out_fflags_bits_uop_fp_single; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_xcpt_pf_if = io_empty ? io_enq_bits_fflags_bits_uop_xcpt_pf_if :
    out_fflags_bits_uop_xcpt_pf_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_xcpt_ae_if = io_empty ? io_enq_bits_fflags_bits_uop_xcpt_ae_if :
    out_fflags_bits_uop_xcpt_ae_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_xcpt_ma_if = io_empty ? io_enq_bits_fflags_bits_uop_xcpt_ma_if :
    out_fflags_bits_uop_xcpt_ma_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_bp_debug_if = io_empty ? io_enq_bits_fflags_bits_uop_bp_debug_if :
    out_fflags_bits_uop_bp_debug_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_bp_xcpt_if = io_empty ? io_enq_bits_fflags_bits_uop_bp_xcpt_if :
    out_fflags_bits_uop_bp_xcpt_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_debug_fsrc = io_empty ? io_enq_bits_fflags_bits_uop_debug_fsrc :
    out_fflags_bits_uop_debug_fsrc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_uop_debug_tsrc = io_empty ? io_enq_bits_fflags_bits_uop_debug_tsrc :
    out_fflags_bits_uop_debug_tsrc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflags_bits_flags = io_empty ? io_enq_bits_fflags_bits_flags : out_fflags_bits_flags; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_flagdata = io_empty ? io_enq_bits_flagdata : out_flagdata; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_valid = io_empty ? io_enq_bits_fflagdata_valid : out_fflagdata_valid; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_switch = io_empty ? io_enq_bits_fflagdata_bits_uop_switch :
    out_fflagdata_bits_uop_switch; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_switch_off = io_empty ? io_enq_bits_fflagdata_bits_uop_switch_off :
    out_fflagdata_bits_uop_switch_off; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_is_unicore = io_empty ? io_enq_bits_fflagdata_bits_uop_is_unicore :
    out_fflagdata_bits_uop_is_unicore; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_shift = io_empty ? io_enq_bits_fflagdata_bits_uop_shift :
    out_fflagdata_bits_uop_shift; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_lrs3_rtype = io_empty ? io_enq_bits_fflagdata_bits_uop_lrs3_rtype :
    out_fflagdata_bits_uop_lrs3_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_rflag = io_empty ? io_enq_bits_fflagdata_bits_uop_rflag :
    out_fflagdata_bits_uop_rflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_wflag = io_empty ? io_enq_bits_fflagdata_bits_uop_wflag :
    out_fflagdata_bits_uop_wflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_prflag = io_empty ? io_enq_bits_fflagdata_bits_uop_prflag :
    out_fflagdata_bits_uop_prflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_pwflag = io_empty ? io_enq_bits_fflagdata_bits_uop_pwflag :
    out_fflagdata_bits_uop_pwflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_pflag_busy = io_empty ? io_enq_bits_fflagdata_bits_uop_pflag_busy :
    out_fflagdata_bits_uop_pflag_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_stale_pflag = io_empty ? io_enq_bits_fflagdata_bits_uop_stale_pflag :
    out_fflagdata_bits_uop_stale_pflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_op1_sel = io_empty ? io_enq_bits_fflagdata_bits_uop_op1_sel :
    out_fflagdata_bits_uop_op1_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_op2_sel = io_empty ? io_enq_bits_fflagdata_bits_uop_op2_sel :
    out_fflagdata_bits_uop_op2_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_split_num = io_empty ? io_enq_bits_fflagdata_bits_uop_split_num :
    out_fflagdata_bits_uop_split_num; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_self_index = io_empty ? io_enq_bits_fflagdata_bits_uop_self_index :
    out_fflagdata_bits_uop_self_index; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_rob_inst_idx = io_empty ? io_enq_bits_fflagdata_bits_uop_rob_inst_idx :
    out_fflagdata_bits_uop_rob_inst_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_address_num = io_empty ? io_enq_bits_fflagdata_bits_uop_address_num :
    out_fflagdata_bits_uop_address_num; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_uopc = io_empty ? io_enq_bits_fflagdata_bits_uop_uopc :
    out_fflagdata_bits_uop_uopc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_inst = io_empty ? io_enq_bits_fflagdata_bits_uop_inst :
    out_fflagdata_bits_uop_inst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_debug_inst = io_empty ? io_enq_bits_fflagdata_bits_uop_debug_inst :
    out_fflagdata_bits_uop_debug_inst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_is_rvc = io_empty ? io_enq_bits_fflagdata_bits_uop_is_rvc :
    out_fflagdata_bits_uop_is_rvc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_debug_pc = io_empty ? io_enq_bits_fflagdata_bits_uop_debug_pc :
    out_fflagdata_bits_uop_debug_pc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_iq_type = io_empty ? io_enq_bits_fflagdata_bits_uop_iq_type :
    out_fflagdata_bits_uop_iq_type; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_fu_code = io_empty ? io_enq_bits_fflagdata_bits_uop_fu_code :
    out_fflagdata_bits_uop_fu_code; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ctrl_br_type = io_empty ? io_enq_bits_fflagdata_bits_uop_ctrl_br_type :
    out_fflagdata_bits_uop_ctrl_br_type; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ctrl_op1_sel = io_empty ? io_enq_bits_fflagdata_bits_uop_ctrl_op1_sel :
    out_fflagdata_bits_uop_ctrl_op1_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ctrl_op2_sel = io_empty ? io_enq_bits_fflagdata_bits_uop_ctrl_op2_sel :
    out_fflagdata_bits_uop_ctrl_op2_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ctrl_imm_sel = io_empty ? io_enq_bits_fflagdata_bits_uop_ctrl_imm_sel :
    out_fflagdata_bits_uop_ctrl_imm_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ctrl_op_fcn = io_empty ? io_enq_bits_fflagdata_bits_uop_ctrl_op_fcn :
    out_fflagdata_bits_uop_ctrl_op_fcn; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ctrl_fcn_dw = io_empty ? io_enq_bits_fflagdata_bits_uop_ctrl_fcn_dw :
    out_fflagdata_bits_uop_ctrl_fcn_dw; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ctrl_csr_cmd = io_empty ? io_enq_bits_fflagdata_bits_uop_ctrl_csr_cmd :
    out_fflagdata_bits_uop_ctrl_csr_cmd; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ctrl_is_load = io_empty ? io_enq_bits_fflagdata_bits_uop_ctrl_is_load :
    out_fflagdata_bits_uop_ctrl_is_load; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ctrl_is_sta = io_empty ? io_enq_bits_fflagdata_bits_uop_ctrl_is_sta :
    out_fflagdata_bits_uop_ctrl_is_sta; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ctrl_is_std = io_empty ? io_enq_bits_fflagdata_bits_uop_ctrl_is_std :
    out_fflagdata_bits_uop_ctrl_is_std; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ctrl_op3_sel = io_empty ? io_enq_bits_fflagdata_bits_uop_ctrl_op3_sel :
    out_fflagdata_bits_uop_ctrl_op3_sel; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_iw_state = io_empty ? io_enq_bits_fflagdata_bits_uop_iw_state :
    out_fflagdata_bits_uop_iw_state; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_iw_p1_poisoned = io_empty ? io_enq_bits_fflagdata_bits_uop_iw_p1_poisoned :
    out_fflagdata_bits_uop_iw_p1_poisoned; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_iw_p2_poisoned = io_empty ? io_enq_bits_fflagdata_bits_uop_iw_p2_poisoned :
    out_fflagdata_bits_uop_iw_p2_poisoned; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_is_br = io_empty ? io_enq_bits_fflagdata_bits_uop_is_br :
    out_fflagdata_bits_uop_is_br; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_is_jalr = io_empty ? io_enq_bits_fflagdata_bits_uop_is_jalr :
    out_fflagdata_bits_uop_is_jalr; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_is_jal = io_empty ? io_enq_bits_fflagdata_bits_uop_is_jal :
    out_fflagdata_bits_uop_is_jal; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_is_sfb = io_empty ? io_enq_bits_fflagdata_bits_uop_is_sfb :
    out_fflagdata_bits_uop_is_sfb; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_br_mask = io_empty ? io_enq_bits_fflagdata_bits_uop_br_mask :
    out_fflagdata_bits_uop_br_mask; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_br_tag = io_empty ? io_enq_bits_fflagdata_bits_uop_br_tag :
    out_fflagdata_bits_uop_br_tag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ftq_idx = io_empty ? io_enq_bits_fflagdata_bits_uop_ftq_idx :
    out_fflagdata_bits_uop_ftq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_edge_inst = io_empty ? io_enq_bits_fflagdata_bits_uop_edge_inst :
    out_fflagdata_bits_uop_edge_inst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_pc_lob = io_empty ? io_enq_bits_fflagdata_bits_uop_pc_lob :
    out_fflagdata_bits_uop_pc_lob; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_taken = io_empty ? io_enq_bits_fflagdata_bits_uop_taken :
    out_fflagdata_bits_uop_taken; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_imm_packed = io_empty ? io_enq_bits_fflagdata_bits_uop_imm_packed :
    out_fflagdata_bits_uop_imm_packed; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_csr_addr = io_empty ? io_enq_bits_fflagdata_bits_uop_csr_addr :
    out_fflagdata_bits_uop_csr_addr; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_rob_idx = io_empty ? io_enq_bits_fflagdata_bits_uop_rob_idx :
    out_fflagdata_bits_uop_rob_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ldq_idx = io_empty ? io_enq_bits_fflagdata_bits_uop_ldq_idx :
    out_fflagdata_bits_uop_ldq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_stq_idx = io_empty ? io_enq_bits_fflagdata_bits_uop_stq_idx :
    out_fflagdata_bits_uop_stq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_rxq_idx = io_empty ? io_enq_bits_fflagdata_bits_uop_rxq_idx :
    out_fflagdata_bits_uop_rxq_idx; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_pdst = io_empty ? io_enq_bits_fflagdata_bits_uop_pdst :
    out_fflagdata_bits_uop_pdst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_prs1 = io_empty ? io_enq_bits_fflagdata_bits_uop_prs1 :
    out_fflagdata_bits_uop_prs1; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_prs2 = io_empty ? io_enq_bits_fflagdata_bits_uop_prs2 :
    out_fflagdata_bits_uop_prs2; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_prs3 = io_empty ? io_enq_bits_fflagdata_bits_uop_prs3 :
    out_fflagdata_bits_uop_prs3; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ppred = io_empty ? io_enq_bits_fflagdata_bits_uop_ppred :
    out_fflagdata_bits_uop_ppred; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_prs1_busy = io_empty ? io_enq_bits_fflagdata_bits_uop_prs1_busy :
    out_fflagdata_bits_uop_prs1_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_prs2_busy = io_empty ? io_enq_bits_fflagdata_bits_uop_prs2_busy :
    out_fflagdata_bits_uop_prs2_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_prs3_busy = io_empty ? io_enq_bits_fflagdata_bits_uop_prs3_busy :
    out_fflagdata_bits_uop_prs3_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ppred_busy = io_empty ? io_enq_bits_fflagdata_bits_uop_ppred_busy :
    out_fflagdata_bits_uop_ppred_busy; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_stale_pdst = io_empty ? io_enq_bits_fflagdata_bits_uop_stale_pdst :
    out_fflagdata_bits_uop_stale_pdst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_exception = io_empty ? io_enq_bits_fflagdata_bits_uop_exception :
    out_fflagdata_bits_uop_exception; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_exc_cause = io_empty ? io_enq_bits_fflagdata_bits_uop_exc_cause :
    out_fflagdata_bits_uop_exc_cause; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_bypassable = io_empty ? io_enq_bits_fflagdata_bits_uop_bypassable :
    out_fflagdata_bits_uop_bypassable; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_mem_cmd = io_empty ? io_enq_bits_fflagdata_bits_uop_mem_cmd :
    out_fflagdata_bits_uop_mem_cmd; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_mem_size = io_empty ? io_enq_bits_fflagdata_bits_uop_mem_size :
    out_fflagdata_bits_uop_mem_size; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_mem_signed = io_empty ? io_enq_bits_fflagdata_bits_uop_mem_signed :
    out_fflagdata_bits_uop_mem_signed; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_is_fence = io_empty ? io_enq_bits_fflagdata_bits_uop_is_fence :
    out_fflagdata_bits_uop_is_fence; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_is_fencei = io_empty ? io_enq_bits_fflagdata_bits_uop_is_fencei :
    out_fflagdata_bits_uop_is_fencei; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_is_amo = io_empty ? io_enq_bits_fflagdata_bits_uop_is_amo :
    out_fflagdata_bits_uop_is_amo; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_uses_ldq = io_empty ? io_enq_bits_fflagdata_bits_uop_uses_ldq :
    out_fflagdata_bits_uop_uses_ldq; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_uses_stq = io_empty ? io_enq_bits_fflagdata_bits_uop_uses_stq :
    out_fflagdata_bits_uop_uses_stq; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_is_sys_pc2epc = io_empty ? io_enq_bits_fflagdata_bits_uop_is_sys_pc2epc :
    out_fflagdata_bits_uop_is_sys_pc2epc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_is_unique = io_empty ? io_enq_bits_fflagdata_bits_uop_is_unique :
    out_fflagdata_bits_uop_is_unique; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_flush_on_commit = io_empty ? io_enq_bits_fflagdata_bits_uop_flush_on_commit :
    out_fflagdata_bits_uop_flush_on_commit; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ldst_is_rs1 = io_empty ? io_enq_bits_fflagdata_bits_uop_ldst_is_rs1 :
    out_fflagdata_bits_uop_ldst_is_rs1; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ldst = io_empty ? io_enq_bits_fflagdata_bits_uop_ldst :
    out_fflagdata_bits_uop_ldst; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_lrs1 = io_empty ? io_enq_bits_fflagdata_bits_uop_lrs1 :
    out_fflagdata_bits_uop_lrs1; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_lrs2 = io_empty ? io_enq_bits_fflagdata_bits_uop_lrs2 :
    out_fflagdata_bits_uop_lrs2; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_lrs3 = io_empty ? io_enq_bits_fflagdata_bits_uop_lrs3 :
    out_fflagdata_bits_uop_lrs3; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_ldst_val = io_empty ? io_enq_bits_fflagdata_bits_uop_ldst_val :
    out_fflagdata_bits_uop_ldst_val; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_dst_rtype = io_empty ? io_enq_bits_fflagdata_bits_uop_dst_rtype :
    out_fflagdata_bits_uop_dst_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_lrs1_rtype = io_empty ? io_enq_bits_fflagdata_bits_uop_lrs1_rtype :
    out_fflagdata_bits_uop_lrs1_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_lrs2_rtype = io_empty ? io_enq_bits_fflagdata_bits_uop_lrs2_rtype :
    out_fflagdata_bits_uop_lrs2_rtype; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_frs3_en = io_empty ? io_enq_bits_fflagdata_bits_uop_frs3_en :
    out_fflagdata_bits_uop_frs3_en; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_fp_val = io_empty ? io_enq_bits_fflagdata_bits_uop_fp_val :
    out_fflagdata_bits_uop_fp_val; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_fp_single = io_empty ? io_enq_bits_fflagdata_bits_uop_fp_single :
    out_fflagdata_bits_uop_fp_single; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_xcpt_pf_if = io_empty ? io_enq_bits_fflagdata_bits_uop_xcpt_pf_if :
    out_fflagdata_bits_uop_xcpt_pf_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_xcpt_ae_if = io_empty ? io_enq_bits_fflagdata_bits_uop_xcpt_ae_if :
    out_fflagdata_bits_uop_xcpt_ae_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_xcpt_ma_if = io_empty ? io_enq_bits_fflagdata_bits_uop_xcpt_ma_if :
    out_fflagdata_bits_uop_xcpt_ma_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_bp_debug_if = io_empty ? io_enq_bits_fflagdata_bits_uop_bp_debug_if :
    out_fflagdata_bits_uop_bp_debug_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_bp_xcpt_if = io_empty ? io_enq_bits_fflagdata_bits_uop_bp_xcpt_if :
    out_fflagdata_bits_uop_bp_xcpt_if; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_debug_fsrc = io_empty ? io_enq_bits_fflagdata_bits_uop_debug_fsrc :
    out_fflagdata_bits_uop_debug_fsrc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_uop_debug_tsrc = io_empty ? io_enq_bits_fflagdata_bits_uop_debug_tsrc :
    out_fflagdata_bits_uop_debug_tsrc; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_deq_bits_fflagdata_bits_fflag = io_empty ? io_enq_bits_fflagdata_bits_fflag : out_fflagdata_bits_fflag; // @[util.scala 586:21 util.scala 588:19 util.scala 581:27]
  assign io_empty = ptr_match & ~maybe_full; // @[util.scala 544:25]
  assign io_count = ptr_match ? _T_89 : _T_93; // @[util.scala 600:20]
  always @(posedge clock) begin
    if(ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_predicated_MPORT_en & ram_predicated_MPORT_mask) begin
      ram_predicated[ram_predicated_MPORT_addr] <= ram_predicated_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_valid_MPORT_en & ram_fflags_valid_MPORT_mask) begin
      ram_fflags_valid[ram_fflags_valid_MPORT_addr] <= ram_fflags_valid_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_switch_MPORT_en & ram_fflags_bits_uop_switch_MPORT_mask) begin
      ram_fflags_bits_uop_switch[ram_fflags_bits_uop_switch_MPORT_addr] <= ram_fflags_bits_uop_switch_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_switch_off_MPORT_en & ram_fflags_bits_uop_switch_off_MPORT_mask) begin
      ram_fflags_bits_uop_switch_off[ram_fflags_bits_uop_switch_off_MPORT_addr] <=
        ram_fflags_bits_uop_switch_off_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_is_unicore_MPORT_en & ram_fflags_bits_uop_is_unicore_MPORT_mask) begin
      ram_fflags_bits_uop_is_unicore[ram_fflags_bits_uop_is_unicore_MPORT_addr] <=
        ram_fflags_bits_uop_is_unicore_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_shift_MPORT_en & ram_fflags_bits_uop_shift_MPORT_mask) begin
      ram_fflags_bits_uop_shift[ram_fflags_bits_uop_shift_MPORT_addr] <= ram_fflags_bits_uop_shift_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_lrs3_rtype_MPORT_en & ram_fflags_bits_uop_lrs3_rtype_MPORT_mask) begin
      ram_fflags_bits_uop_lrs3_rtype[ram_fflags_bits_uop_lrs3_rtype_MPORT_addr] <=
        ram_fflags_bits_uop_lrs3_rtype_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_rflag_MPORT_en & ram_fflags_bits_uop_rflag_MPORT_mask) begin
      ram_fflags_bits_uop_rflag[ram_fflags_bits_uop_rflag_MPORT_addr] <= ram_fflags_bits_uop_rflag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_wflag_MPORT_en & ram_fflags_bits_uop_wflag_MPORT_mask) begin
      ram_fflags_bits_uop_wflag[ram_fflags_bits_uop_wflag_MPORT_addr] <= ram_fflags_bits_uop_wflag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_prflag_MPORT_en & ram_fflags_bits_uop_prflag_MPORT_mask) begin
      ram_fflags_bits_uop_prflag[ram_fflags_bits_uop_prflag_MPORT_addr] <= ram_fflags_bits_uop_prflag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_pwflag_MPORT_en & ram_fflags_bits_uop_pwflag_MPORT_mask) begin
      ram_fflags_bits_uop_pwflag[ram_fflags_bits_uop_pwflag_MPORT_addr] <= ram_fflags_bits_uop_pwflag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_pflag_busy_MPORT_en & ram_fflags_bits_uop_pflag_busy_MPORT_mask) begin
      ram_fflags_bits_uop_pflag_busy[ram_fflags_bits_uop_pflag_busy_MPORT_addr] <=
        ram_fflags_bits_uop_pflag_busy_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_stale_pflag_MPORT_en & ram_fflags_bits_uop_stale_pflag_MPORT_mask) begin
      ram_fflags_bits_uop_stale_pflag[ram_fflags_bits_uop_stale_pflag_MPORT_addr] <=
        ram_fflags_bits_uop_stale_pflag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_op1_sel_MPORT_en & ram_fflags_bits_uop_op1_sel_MPORT_mask) begin
      ram_fflags_bits_uop_op1_sel[ram_fflags_bits_uop_op1_sel_MPORT_addr] <= ram_fflags_bits_uop_op1_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_op2_sel_MPORT_en & ram_fflags_bits_uop_op2_sel_MPORT_mask) begin
      ram_fflags_bits_uop_op2_sel[ram_fflags_bits_uop_op2_sel_MPORT_addr] <= ram_fflags_bits_uop_op2_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_split_num_MPORT_en & ram_fflags_bits_uop_split_num_MPORT_mask) begin
      ram_fflags_bits_uop_split_num[ram_fflags_bits_uop_split_num_MPORT_addr] <=
        ram_fflags_bits_uop_split_num_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_self_index_MPORT_en & ram_fflags_bits_uop_self_index_MPORT_mask) begin
      ram_fflags_bits_uop_self_index[ram_fflags_bits_uop_self_index_MPORT_addr] <=
        ram_fflags_bits_uop_self_index_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_rob_inst_idx_MPORT_en & ram_fflags_bits_uop_rob_inst_idx_MPORT_mask) begin
      ram_fflags_bits_uop_rob_inst_idx[ram_fflags_bits_uop_rob_inst_idx_MPORT_addr] <=
        ram_fflags_bits_uop_rob_inst_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_address_num_MPORT_en & ram_fflags_bits_uop_address_num_MPORT_mask) begin
      ram_fflags_bits_uop_address_num[ram_fflags_bits_uop_address_num_MPORT_addr] <=
        ram_fflags_bits_uop_address_num_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_uopc_MPORT_en & ram_fflags_bits_uop_uopc_MPORT_mask) begin
      ram_fflags_bits_uop_uopc[ram_fflags_bits_uop_uopc_MPORT_addr] <= ram_fflags_bits_uop_uopc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_inst_MPORT_en & ram_fflags_bits_uop_inst_MPORT_mask) begin
      ram_fflags_bits_uop_inst[ram_fflags_bits_uop_inst_MPORT_addr] <= ram_fflags_bits_uop_inst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_debug_inst_MPORT_en & ram_fflags_bits_uop_debug_inst_MPORT_mask) begin
      ram_fflags_bits_uop_debug_inst[ram_fflags_bits_uop_debug_inst_MPORT_addr] <=
        ram_fflags_bits_uop_debug_inst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_is_rvc_MPORT_en & ram_fflags_bits_uop_is_rvc_MPORT_mask) begin
      ram_fflags_bits_uop_is_rvc[ram_fflags_bits_uop_is_rvc_MPORT_addr] <= ram_fflags_bits_uop_is_rvc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_debug_pc_MPORT_en & ram_fflags_bits_uop_debug_pc_MPORT_mask) begin
      ram_fflags_bits_uop_debug_pc[ram_fflags_bits_uop_debug_pc_MPORT_addr] <= ram_fflags_bits_uop_debug_pc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_iq_type_MPORT_en & ram_fflags_bits_uop_iq_type_MPORT_mask) begin
      ram_fflags_bits_uop_iq_type[ram_fflags_bits_uop_iq_type_MPORT_addr] <= ram_fflags_bits_uop_iq_type_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_fu_code_MPORT_en & ram_fflags_bits_uop_fu_code_MPORT_mask) begin
      ram_fflags_bits_uop_fu_code[ram_fflags_bits_uop_fu_code_MPORT_addr] <= ram_fflags_bits_uop_fu_code_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ctrl_br_type_MPORT_en & ram_fflags_bits_uop_ctrl_br_type_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_br_type[ram_fflags_bits_uop_ctrl_br_type_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_br_type_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ctrl_op1_sel_MPORT_en & ram_fflags_bits_uop_ctrl_op1_sel_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_op1_sel[ram_fflags_bits_uop_ctrl_op1_sel_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_op1_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ctrl_op2_sel_MPORT_en & ram_fflags_bits_uop_ctrl_op2_sel_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_op2_sel[ram_fflags_bits_uop_ctrl_op2_sel_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_op2_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ctrl_imm_sel_MPORT_en & ram_fflags_bits_uop_ctrl_imm_sel_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_imm_sel[ram_fflags_bits_uop_ctrl_imm_sel_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_imm_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ctrl_op_fcn_MPORT_en & ram_fflags_bits_uop_ctrl_op_fcn_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_op_fcn[ram_fflags_bits_uop_ctrl_op_fcn_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_op_fcn_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_en & ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_fcn_dw[ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_en & ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_csr_cmd[ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ctrl_is_load_MPORT_en & ram_fflags_bits_uop_ctrl_is_load_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_is_load[ram_fflags_bits_uop_ctrl_is_load_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_is_load_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ctrl_is_sta_MPORT_en & ram_fflags_bits_uop_ctrl_is_sta_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_is_sta[ram_fflags_bits_uop_ctrl_is_sta_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_is_sta_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ctrl_is_std_MPORT_en & ram_fflags_bits_uop_ctrl_is_std_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_is_std[ram_fflags_bits_uop_ctrl_is_std_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_is_std_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ctrl_op3_sel_MPORT_en & ram_fflags_bits_uop_ctrl_op3_sel_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_op3_sel[ram_fflags_bits_uop_ctrl_op3_sel_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_op3_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_iw_state_MPORT_en & ram_fflags_bits_uop_iw_state_MPORT_mask) begin
      ram_fflags_bits_uop_iw_state[ram_fflags_bits_uop_iw_state_MPORT_addr] <= ram_fflags_bits_uop_iw_state_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_iw_p1_poisoned_MPORT_en & ram_fflags_bits_uop_iw_p1_poisoned_MPORT_mask) begin
      ram_fflags_bits_uop_iw_p1_poisoned[ram_fflags_bits_uop_iw_p1_poisoned_MPORT_addr] <=
        ram_fflags_bits_uop_iw_p1_poisoned_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_iw_p2_poisoned_MPORT_en & ram_fflags_bits_uop_iw_p2_poisoned_MPORT_mask) begin
      ram_fflags_bits_uop_iw_p2_poisoned[ram_fflags_bits_uop_iw_p2_poisoned_MPORT_addr] <=
        ram_fflags_bits_uop_iw_p2_poisoned_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_is_br_MPORT_en & ram_fflags_bits_uop_is_br_MPORT_mask) begin
      ram_fflags_bits_uop_is_br[ram_fflags_bits_uop_is_br_MPORT_addr] <= ram_fflags_bits_uop_is_br_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_is_jalr_MPORT_en & ram_fflags_bits_uop_is_jalr_MPORT_mask) begin
      ram_fflags_bits_uop_is_jalr[ram_fflags_bits_uop_is_jalr_MPORT_addr] <= ram_fflags_bits_uop_is_jalr_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_is_jal_MPORT_en & ram_fflags_bits_uop_is_jal_MPORT_mask) begin
      ram_fflags_bits_uop_is_jal[ram_fflags_bits_uop_is_jal_MPORT_addr] <= ram_fflags_bits_uop_is_jal_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_is_sfb_MPORT_en & ram_fflags_bits_uop_is_sfb_MPORT_mask) begin
      ram_fflags_bits_uop_is_sfb[ram_fflags_bits_uop_is_sfb_MPORT_addr] <= ram_fflags_bits_uop_is_sfb_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_br_mask_MPORT_en & ram_fflags_bits_uop_br_mask_MPORT_mask) begin
      ram_fflags_bits_uop_br_mask[ram_fflags_bits_uop_br_mask_MPORT_addr] <= ram_fflags_bits_uop_br_mask_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_br_tag_MPORT_en & ram_fflags_bits_uop_br_tag_MPORT_mask) begin
      ram_fflags_bits_uop_br_tag[ram_fflags_bits_uop_br_tag_MPORT_addr] <= ram_fflags_bits_uop_br_tag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ftq_idx_MPORT_en & ram_fflags_bits_uop_ftq_idx_MPORT_mask) begin
      ram_fflags_bits_uop_ftq_idx[ram_fflags_bits_uop_ftq_idx_MPORT_addr] <= ram_fflags_bits_uop_ftq_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_edge_inst_MPORT_en & ram_fflags_bits_uop_edge_inst_MPORT_mask) begin
      ram_fflags_bits_uop_edge_inst[ram_fflags_bits_uop_edge_inst_MPORT_addr] <=
        ram_fflags_bits_uop_edge_inst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_pc_lob_MPORT_en & ram_fflags_bits_uop_pc_lob_MPORT_mask) begin
      ram_fflags_bits_uop_pc_lob[ram_fflags_bits_uop_pc_lob_MPORT_addr] <= ram_fflags_bits_uop_pc_lob_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_taken_MPORT_en & ram_fflags_bits_uop_taken_MPORT_mask) begin
      ram_fflags_bits_uop_taken[ram_fflags_bits_uop_taken_MPORT_addr] <= ram_fflags_bits_uop_taken_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_imm_packed_MPORT_en & ram_fflags_bits_uop_imm_packed_MPORT_mask) begin
      ram_fflags_bits_uop_imm_packed[ram_fflags_bits_uop_imm_packed_MPORT_addr] <=
        ram_fflags_bits_uop_imm_packed_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_csr_addr_MPORT_en & ram_fflags_bits_uop_csr_addr_MPORT_mask) begin
      ram_fflags_bits_uop_csr_addr[ram_fflags_bits_uop_csr_addr_MPORT_addr] <= ram_fflags_bits_uop_csr_addr_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_rob_idx_MPORT_en & ram_fflags_bits_uop_rob_idx_MPORT_mask) begin
      ram_fflags_bits_uop_rob_idx[ram_fflags_bits_uop_rob_idx_MPORT_addr] <= ram_fflags_bits_uop_rob_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ldq_idx_MPORT_en & ram_fflags_bits_uop_ldq_idx_MPORT_mask) begin
      ram_fflags_bits_uop_ldq_idx[ram_fflags_bits_uop_ldq_idx_MPORT_addr] <= ram_fflags_bits_uop_ldq_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_stq_idx_MPORT_en & ram_fflags_bits_uop_stq_idx_MPORT_mask) begin
      ram_fflags_bits_uop_stq_idx[ram_fflags_bits_uop_stq_idx_MPORT_addr] <= ram_fflags_bits_uop_stq_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_rxq_idx_MPORT_en & ram_fflags_bits_uop_rxq_idx_MPORT_mask) begin
      ram_fflags_bits_uop_rxq_idx[ram_fflags_bits_uop_rxq_idx_MPORT_addr] <= ram_fflags_bits_uop_rxq_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_pdst_MPORT_en & ram_fflags_bits_uop_pdst_MPORT_mask) begin
      ram_fflags_bits_uop_pdst[ram_fflags_bits_uop_pdst_MPORT_addr] <= ram_fflags_bits_uop_pdst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_prs1_MPORT_en & ram_fflags_bits_uop_prs1_MPORT_mask) begin
      ram_fflags_bits_uop_prs1[ram_fflags_bits_uop_prs1_MPORT_addr] <= ram_fflags_bits_uop_prs1_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_prs2_MPORT_en & ram_fflags_bits_uop_prs2_MPORT_mask) begin
      ram_fflags_bits_uop_prs2[ram_fflags_bits_uop_prs2_MPORT_addr] <= ram_fflags_bits_uop_prs2_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_prs3_MPORT_en & ram_fflags_bits_uop_prs3_MPORT_mask) begin
      ram_fflags_bits_uop_prs3[ram_fflags_bits_uop_prs3_MPORT_addr] <= ram_fflags_bits_uop_prs3_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ppred_MPORT_en & ram_fflags_bits_uop_ppred_MPORT_mask) begin
      ram_fflags_bits_uop_ppred[ram_fflags_bits_uop_ppred_MPORT_addr] <= ram_fflags_bits_uop_ppred_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_prs1_busy_MPORT_en & ram_fflags_bits_uop_prs1_busy_MPORT_mask) begin
      ram_fflags_bits_uop_prs1_busy[ram_fflags_bits_uop_prs1_busy_MPORT_addr] <=
        ram_fflags_bits_uop_prs1_busy_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_prs2_busy_MPORT_en & ram_fflags_bits_uop_prs2_busy_MPORT_mask) begin
      ram_fflags_bits_uop_prs2_busy[ram_fflags_bits_uop_prs2_busy_MPORT_addr] <=
        ram_fflags_bits_uop_prs2_busy_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_prs3_busy_MPORT_en & ram_fflags_bits_uop_prs3_busy_MPORT_mask) begin
      ram_fflags_bits_uop_prs3_busy[ram_fflags_bits_uop_prs3_busy_MPORT_addr] <=
        ram_fflags_bits_uop_prs3_busy_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ppred_busy_MPORT_en & ram_fflags_bits_uop_ppred_busy_MPORT_mask) begin
      ram_fflags_bits_uop_ppred_busy[ram_fflags_bits_uop_ppred_busy_MPORT_addr] <=
        ram_fflags_bits_uop_ppred_busy_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_stale_pdst_MPORT_en & ram_fflags_bits_uop_stale_pdst_MPORT_mask) begin
      ram_fflags_bits_uop_stale_pdst[ram_fflags_bits_uop_stale_pdst_MPORT_addr] <=
        ram_fflags_bits_uop_stale_pdst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_exception_MPORT_en & ram_fflags_bits_uop_exception_MPORT_mask) begin
      ram_fflags_bits_uop_exception[ram_fflags_bits_uop_exception_MPORT_addr] <=
        ram_fflags_bits_uop_exception_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_exc_cause_MPORT_en & ram_fflags_bits_uop_exc_cause_MPORT_mask) begin
      ram_fflags_bits_uop_exc_cause[ram_fflags_bits_uop_exc_cause_MPORT_addr] <=
        ram_fflags_bits_uop_exc_cause_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_bypassable_MPORT_en & ram_fflags_bits_uop_bypassable_MPORT_mask) begin
      ram_fflags_bits_uop_bypassable[ram_fflags_bits_uop_bypassable_MPORT_addr] <=
        ram_fflags_bits_uop_bypassable_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_mem_cmd_MPORT_en & ram_fflags_bits_uop_mem_cmd_MPORT_mask) begin
      ram_fflags_bits_uop_mem_cmd[ram_fflags_bits_uop_mem_cmd_MPORT_addr] <= ram_fflags_bits_uop_mem_cmd_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_mem_size_MPORT_en & ram_fflags_bits_uop_mem_size_MPORT_mask) begin
      ram_fflags_bits_uop_mem_size[ram_fflags_bits_uop_mem_size_MPORT_addr] <= ram_fflags_bits_uop_mem_size_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_mem_signed_MPORT_en & ram_fflags_bits_uop_mem_signed_MPORT_mask) begin
      ram_fflags_bits_uop_mem_signed[ram_fflags_bits_uop_mem_signed_MPORT_addr] <=
        ram_fflags_bits_uop_mem_signed_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_is_fence_MPORT_en & ram_fflags_bits_uop_is_fence_MPORT_mask) begin
      ram_fflags_bits_uop_is_fence[ram_fflags_bits_uop_is_fence_MPORT_addr] <= ram_fflags_bits_uop_is_fence_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_is_fencei_MPORT_en & ram_fflags_bits_uop_is_fencei_MPORT_mask) begin
      ram_fflags_bits_uop_is_fencei[ram_fflags_bits_uop_is_fencei_MPORT_addr] <=
        ram_fflags_bits_uop_is_fencei_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_is_amo_MPORT_en & ram_fflags_bits_uop_is_amo_MPORT_mask) begin
      ram_fflags_bits_uop_is_amo[ram_fflags_bits_uop_is_amo_MPORT_addr] <= ram_fflags_bits_uop_is_amo_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_uses_ldq_MPORT_en & ram_fflags_bits_uop_uses_ldq_MPORT_mask) begin
      ram_fflags_bits_uop_uses_ldq[ram_fflags_bits_uop_uses_ldq_MPORT_addr] <= ram_fflags_bits_uop_uses_ldq_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_uses_stq_MPORT_en & ram_fflags_bits_uop_uses_stq_MPORT_mask) begin
      ram_fflags_bits_uop_uses_stq[ram_fflags_bits_uop_uses_stq_MPORT_addr] <= ram_fflags_bits_uop_uses_stq_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_is_sys_pc2epc_MPORT_en & ram_fflags_bits_uop_is_sys_pc2epc_MPORT_mask) begin
      ram_fflags_bits_uop_is_sys_pc2epc[ram_fflags_bits_uop_is_sys_pc2epc_MPORT_addr] <=
        ram_fflags_bits_uop_is_sys_pc2epc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_is_unique_MPORT_en & ram_fflags_bits_uop_is_unique_MPORT_mask) begin
      ram_fflags_bits_uop_is_unique[ram_fflags_bits_uop_is_unique_MPORT_addr] <=
        ram_fflags_bits_uop_is_unique_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_flush_on_commit_MPORT_en & ram_fflags_bits_uop_flush_on_commit_MPORT_mask) begin
      ram_fflags_bits_uop_flush_on_commit[ram_fflags_bits_uop_flush_on_commit_MPORT_addr] <=
        ram_fflags_bits_uop_flush_on_commit_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ldst_is_rs1_MPORT_en & ram_fflags_bits_uop_ldst_is_rs1_MPORT_mask) begin
      ram_fflags_bits_uop_ldst_is_rs1[ram_fflags_bits_uop_ldst_is_rs1_MPORT_addr] <=
        ram_fflags_bits_uop_ldst_is_rs1_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ldst_MPORT_en & ram_fflags_bits_uop_ldst_MPORT_mask) begin
      ram_fflags_bits_uop_ldst[ram_fflags_bits_uop_ldst_MPORT_addr] <= ram_fflags_bits_uop_ldst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_lrs1_MPORT_en & ram_fflags_bits_uop_lrs1_MPORT_mask) begin
      ram_fflags_bits_uop_lrs1[ram_fflags_bits_uop_lrs1_MPORT_addr] <= ram_fflags_bits_uop_lrs1_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_lrs2_MPORT_en & ram_fflags_bits_uop_lrs2_MPORT_mask) begin
      ram_fflags_bits_uop_lrs2[ram_fflags_bits_uop_lrs2_MPORT_addr] <= ram_fflags_bits_uop_lrs2_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_lrs3_MPORT_en & ram_fflags_bits_uop_lrs3_MPORT_mask) begin
      ram_fflags_bits_uop_lrs3[ram_fflags_bits_uop_lrs3_MPORT_addr] <= ram_fflags_bits_uop_lrs3_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_ldst_val_MPORT_en & ram_fflags_bits_uop_ldst_val_MPORT_mask) begin
      ram_fflags_bits_uop_ldst_val[ram_fflags_bits_uop_ldst_val_MPORT_addr] <= ram_fflags_bits_uop_ldst_val_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_dst_rtype_MPORT_en & ram_fflags_bits_uop_dst_rtype_MPORT_mask) begin
      ram_fflags_bits_uop_dst_rtype[ram_fflags_bits_uop_dst_rtype_MPORT_addr] <=
        ram_fflags_bits_uop_dst_rtype_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_lrs1_rtype_MPORT_en & ram_fflags_bits_uop_lrs1_rtype_MPORT_mask) begin
      ram_fflags_bits_uop_lrs1_rtype[ram_fflags_bits_uop_lrs1_rtype_MPORT_addr] <=
        ram_fflags_bits_uop_lrs1_rtype_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_lrs2_rtype_MPORT_en & ram_fflags_bits_uop_lrs2_rtype_MPORT_mask) begin
      ram_fflags_bits_uop_lrs2_rtype[ram_fflags_bits_uop_lrs2_rtype_MPORT_addr] <=
        ram_fflags_bits_uop_lrs2_rtype_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_frs3_en_MPORT_en & ram_fflags_bits_uop_frs3_en_MPORT_mask) begin
      ram_fflags_bits_uop_frs3_en[ram_fflags_bits_uop_frs3_en_MPORT_addr] <= ram_fflags_bits_uop_frs3_en_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_fp_val_MPORT_en & ram_fflags_bits_uop_fp_val_MPORT_mask) begin
      ram_fflags_bits_uop_fp_val[ram_fflags_bits_uop_fp_val_MPORT_addr] <= ram_fflags_bits_uop_fp_val_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_fp_single_MPORT_en & ram_fflags_bits_uop_fp_single_MPORT_mask) begin
      ram_fflags_bits_uop_fp_single[ram_fflags_bits_uop_fp_single_MPORT_addr] <=
        ram_fflags_bits_uop_fp_single_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_xcpt_pf_if_MPORT_en & ram_fflags_bits_uop_xcpt_pf_if_MPORT_mask) begin
      ram_fflags_bits_uop_xcpt_pf_if[ram_fflags_bits_uop_xcpt_pf_if_MPORT_addr] <=
        ram_fflags_bits_uop_xcpt_pf_if_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_xcpt_ae_if_MPORT_en & ram_fflags_bits_uop_xcpt_ae_if_MPORT_mask) begin
      ram_fflags_bits_uop_xcpt_ae_if[ram_fflags_bits_uop_xcpt_ae_if_MPORT_addr] <=
        ram_fflags_bits_uop_xcpt_ae_if_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_xcpt_ma_if_MPORT_en & ram_fflags_bits_uop_xcpt_ma_if_MPORT_mask) begin
      ram_fflags_bits_uop_xcpt_ma_if[ram_fflags_bits_uop_xcpt_ma_if_MPORT_addr] <=
        ram_fflags_bits_uop_xcpt_ma_if_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_bp_debug_if_MPORT_en & ram_fflags_bits_uop_bp_debug_if_MPORT_mask) begin
      ram_fflags_bits_uop_bp_debug_if[ram_fflags_bits_uop_bp_debug_if_MPORT_addr] <=
        ram_fflags_bits_uop_bp_debug_if_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_bp_xcpt_if_MPORT_en & ram_fflags_bits_uop_bp_xcpt_if_MPORT_mask) begin
      ram_fflags_bits_uop_bp_xcpt_if[ram_fflags_bits_uop_bp_xcpt_if_MPORT_addr] <=
        ram_fflags_bits_uop_bp_xcpt_if_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_debug_fsrc_MPORT_en & ram_fflags_bits_uop_debug_fsrc_MPORT_mask) begin
      ram_fflags_bits_uop_debug_fsrc[ram_fflags_bits_uop_debug_fsrc_MPORT_addr] <=
        ram_fflags_bits_uop_debug_fsrc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_uop_debug_tsrc_MPORT_en & ram_fflags_bits_uop_debug_tsrc_MPORT_mask) begin
      ram_fflags_bits_uop_debug_tsrc[ram_fflags_bits_uop_debug_tsrc_MPORT_addr] <=
        ram_fflags_bits_uop_debug_tsrc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflags_bits_flags_MPORT_en & ram_fflags_bits_flags_MPORT_mask) begin
      ram_fflags_bits_flags[ram_fflags_bits_flags_MPORT_addr] <= ram_fflags_bits_flags_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_flagdata_MPORT_en & ram_flagdata_MPORT_mask) begin
      ram_flagdata[ram_flagdata_MPORT_addr] <= ram_flagdata_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_valid_MPORT_en & ram_fflagdata_valid_MPORT_mask) begin
      ram_fflagdata_valid[ram_fflagdata_valid_MPORT_addr] <= ram_fflagdata_valid_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_switch_MPORT_en & ram_fflagdata_bits_uop_switch_MPORT_mask) begin
      ram_fflagdata_bits_uop_switch[ram_fflagdata_bits_uop_switch_MPORT_addr] <=
        ram_fflagdata_bits_uop_switch_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_switch_off_MPORT_en & ram_fflagdata_bits_uop_switch_off_MPORT_mask) begin
      ram_fflagdata_bits_uop_switch_off[ram_fflagdata_bits_uop_switch_off_MPORT_addr] <=
        ram_fflagdata_bits_uop_switch_off_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_is_unicore_MPORT_en & ram_fflagdata_bits_uop_is_unicore_MPORT_mask) begin
      ram_fflagdata_bits_uop_is_unicore[ram_fflagdata_bits_uop_is_unicore_MPORT_addr] <=
        ram_fflagdata_bits_uop_is_unicore_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_shift_MPORT_en & ram_fflagdata_bits_uop_shift_MPORT_mask) begin
      ram_fflagdata_bits_uop_shift[ram_fflagdata_bits_uop_shift_MPORT_addr] <= ram_fflagdata_bits_uop_shift_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_lrs3_rtype_MPORT_en & ram_fflagdata_bits_uop_lrs3_rtype_MPORT_mask) begin
      ram_fflagdata_bits_uop_lrs3_rtype[ram_fflagdata_bits_uop_lrs3_rtype_MPORT_addr] <=
        ram_fflagdata_bits_uop_lrs3_rtype_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_rflag_MPORT_en & ram_fflagdata_bits_uop_rflag_MPORT_mask) begin
      ram_fflagdata_bits_uop_rflag[ram_fflagdata_bits_uop_rflag_MPORT_addr] <= ram_fflagdata_bits_uop_rflag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_wflag_MPORT_en & ram_fflagdata_bits_uop_wflag_MPORT_mask) begin
      ram_fflagdata_bits_uop_wflag[ram_fflagdata_bits_uop_wflag_MPORT_addr] <= ram_fflagdata_bits_uop_wflag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_prflag_MPORT_en & ram_fflagdata_bits_uop_prflag_MPORT_mask) begin
      ram_fflagdata_bits_uop_prflag[ram_fflagdata_bits_uop_prflag_MPORT_addr] <=
        ram_fflagdata_bits_uop_prflag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_pwflag_MPORT_en & ram_fflagdata_bits_uop_pwflag_MPORT_mask) begin
      ram_fflagdata_bits_uop_pwflag[ram_fflagdata_bits_uop_pwflag_MPORT_addr] <=
        ram_fflagdata_bits_uop_pwflag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_pflag_busy_MPORT_en & ram_fflagdata_bits_uop_pflag_busy_MPORT_mask) begin
      ram_fflagdata_bits_uop_pflag_busy[ram_fflagdata_bits_uop_pflag_busy_MPORT_addr] <=
        ram_fflagdata_bits_uop_pflag_busy_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_stale_pflag_MPORT_en & ram_fflagdata_bits_uop_stale_pflag_MPORT_mask) begin
      ram_fflagdata_bits_uop_stale_pflag[ram_fflagdata_bits_uop_stale_pflag_MPORT_addr] <=
        ram_fflagdata_bits_uop_stale_pflag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_op1_sel_MPORT_en & ram_fflagdata_bits_uop_op1_sel_MPORT_mask) begin
      ram_fflagdata_bits_uop_op1_sel[ram_fflagdata_bits_uop_op1_sel_MPORT_addr] <=
        ram_fflagdata_bits_uop_op1_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_op2_sel_MPORT_en & ram_fflagdata_bits_uop_op2_sel_MPORT_mask) begin
      ram_fflagdata_bits_uop_op2_sel[ram_fflagdata_bits_uop_op2_sel_MPORT_addr] <=
        ram_fflagdata_bits_uop_op2_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_split_num_MPORT_en & ram_fflagdata_bits_uop_split_num_MPORT_mask) begin
      ram_fflagdata_bits_uop_split_num[ram_fflagdata_bits_uop_split_num_MPORT_addr] <=
        ram_fflagdata_bits_uop_split_num_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_self_index_MPORT_en & ram_fflagdata_bits_uop_self_index_MPORT_mask) begin
      ram_fflagdata_bits_uop_self_index[ram_fflagdata_bits_uop_self_index_MPORT_addr] <=
        ram_fflagdata_bits_uop_self_index_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_rob_inst_idx_MPORT_en & ram_fflagdata_bits_uop_rob_inst_idx_MPORT_mask) begin
      ram_fflagdata_bits_uop_rob_inst_idx[ram_fflagdata_bits_uop_rob_inst_idx_MPORT_addr] <=
        ram_fflagdata_bits_uop_rob_inst_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_address_num_MPORT_en & ram_fflagdata_bits_uop_address_num_MPORT_mask) begin
      ram_fflagdata_bits_uop_address_num[ram_fflagdata_bits_uop_address_num_MPORT_addr] <=
        ram_fflagdata_bits_uop_address_num_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_uopc_MPORT_en & ram_fflagdata_bits_uop_uopc_MPORT_mask) begin
      ram_fflagdata_bits_uop_uopc[ram_fflagdata_bits_uop_uopc_MPORT_addr] <= ram_fflagdata_bits_uop_uopc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_inst_MPORT_en & ram_fflagdata_bits_uop_inst_MPORT_mask) begin
      ram_fflagdata_bits_uop_inst[ram_fflagdata_bits_uop_inst_MPORT_addr] <= ram_fflagdata_bits_uop_inst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_debug_inst_MPORT_en & ram_fflagdata_bits_uop_debug_inst_MPORT_mask) begin
      ram_fflagdata_bits_uop_debug_inst[ram_fflagdata_bits_uop_debug_inst_MPORT_addr] <=
        ram_fflagdata_bits_uop_debug_inst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_is_rvc_MPORT_en & ram_fflagdata_bits_uop_is_rvc_MPORT_mask) begin
      ram_fflagdata_bits_uop_is_rvc[ram_fflagdata_bits_uop_is_rvc_MPORT_addr] <=
        ram_fflagdata_bits_uop_is_rvc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_debug_pc_MPORT_en & ram_fflagdata_bits_uop_debug_pc_MPORT_mask) begin
      ram_fflagdata_bits_uop_debug_pc[ram_fflagdata_bits_uop_debug_pc_MPORT_addr] <=
        ram_fflagdata_bits_uop_debug_pc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_iq_type_MPORT_en & ram_fflagdata_bits_uop_iq_type_MPORT_mask) begin
      ram_fflagdata_bits_uop_iq_type[ram_fflagdata_bits_uop_iq_type_MPORT_addr] <=
        ram_fflagdata_bits_uop_iq_type_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_fu_code_MPORT_en & ram_fflagdata_bits_uop_fu_code_MPORT_mask) begin
      ram_fflagdata_bits_uop_fu_code[ram_fflagdata_bits_uop_fu_code_MPORT_addr] <=
        ram_fflagdata_bits_uop_fu_code_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ctrl_br_type_MPORT_en & ram_fflagdata_bits_uop_ctrl_br_type_MPORT_mask) begin
      ram_fflagdata_bits_uop_ctrl_br_type[ram_fflagdata_bits_uop_ctrl_br_type_MPORT_addr] <=
        ram_fflagdata_bits_uop_ctrl_br_type_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_en & ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_mask) begin
      ram_fflagdata_bits_uop_ctrl_op1_sel[ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_addr] <=
        ram_fflagdata_bits_uop_ctrl_op1_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_en & ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_mask) begin
      ram_fflagdata_bits_uop_ctrl_op2_sel[ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_addr] <=
        ram_fflagdata_bits_uop_ctrl_op2_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_en & ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_mask) begin
      ram_fflagdata_bits_uop_ctrl_imm_sel[ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_addr] <=
        ram_fflagdata_bits_uop_ctrl_imm_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_en & ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_mask) begin
      ram_fflagdata_bits_uop_ctrl_op_fcn[ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_addr] <=
        ram_fflagdata_bits_uop_ctrl_op_fcn_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_en & ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_mask) begin
      ram_fflagdata_bits_uop_ctrl_fcn_dw[ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_addr] <=
        ram_fflagdata_bits_uop_ctrl_fcn_dw_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_en & ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_mask) begin
      ram_fflagdata_bits_uop_ctrl_csr_cmd[ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_addr] <=
        ram_fflagdata_bits_uop_ctrl_csr_cmd_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ctrl_is_load_MPORT_en & ram_fflagdata_bits_uop_ctrl_is_load_MPORT_mask) begin
      ram_fflagdata_bits_uop_ctrl_is_load[ram_fflagdata_bits_uop_ctrl_is_load_MPORT_addr] <=
        ram_fflagdata_bits_uop_ctrl_is_load_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_en & ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_mask) begin
      ram_fflagdata_bits_uop_ctrl_is_sta[ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_addr] <=
        ram_fflagdata_bits_uop_ctrl_is_sta_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ctrl_is_std_MPORT_en & ram_fflagdata_bits_uop_ctrl_is_std_MPORT_mask) begin
      ram_fflagdata_bits_uop_ctrl_is_std[ram_fflagdata_bits_uop_ctrl_is_std_MPORT_addr] <=
        ram_fflagdata_bits_uop_ctrl_is_std_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_en & ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_mask) begin
      ram_fflagdata_bits_uop_ctrl_op3_sel[ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_addr] <=
        ram_fflagdata_bits_uop_ctrl_op3_sel_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_iw_state_MPORT_en & ram_fflagdata_bits_uop_iw_state_MPORT_mask) begin
      ram_fflagdata_bits_uop_iw_state[ram_fflagdata_bits_uop_iw_state_MPORT_addr] <=
        ram_fflagdata_bits_uop_iw_state_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_en & ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_mask) begin
      ram_fflagdata_bits_uop_iw_p1_poisoned[ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_addr] <=
        ram_fflagdata_bits_uop_iw_p1_poisoned_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_en & ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_mask) begin
      ram_fflagdata_bits_uop_iw_p2_poisoned[ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_addr] <=
        ram_fflagdata_bits_uop_iw_p2_poisoned_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_is_br_MPORT_en & ram_fflagdata_bits_uop_is_br_MPORT_mask) begin
      ram_fflagdata_bits_uop_is_br[ram_fflagdata_bits_uop_is_br_MPORT_addr] <= ram_fflagdata_bits_uop_is_br_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_is_jalr_MPORT_en & ram_fflagdata_bits_uop_is_jalr_MPORT_mask) begin
      ram_fflagdata_bits_uop_is_jalr[ram_fflagdata_bits_uop_is_jalr_MPORT_addr] <=
        ram_fflagdata_bits_uop_is_jalr_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_is_jal_MPORT_en & ram_fflagdata_bits_uop_is_jal_MPORT_mask) begin
      ram_fflagdata_bits_uop_is_jal[ram_fflagdata_bits_uop_is_jal_MPORT_addr] <=
        ram_fflagdata_bits_uop_is_jal_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_is_sfb_MPORT_en & ram_fflagdata_bits_uop_is_sfb_MPORT_mask) begin
      ram_fflagdata_bits_uop_is_sfb[ram_fflagdata_bits_uop_is_sfb_MPORT_addr] <=
        ram_fflagdata_bits_uop_is_sfb_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_br_mask_MPORT_en & ram_fflagdata_bits_uop_br_mask_MPORT_mask) begin
      ram_fflagdata_bits_uop_br_mask[ram_fflagdata_bits_uop_br_mask_MPORT_addr] <=
        ram_fflagdata_bits_uop_br_mask_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_br_tag_MPORT_en & ram_fflagdata_bits_uop_br_tag_MPORT_mask) begin
      ram_fflagdata_bits_uop_br_tag[ram_fflagdata_bits_uop_br_tag_MPORT_addr] <=
        ram_fflagdata_bits_uop_br_tag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ftq_idx_MPORT_en & ram_fflagdata_bits_uop_ftq_idx_MPORT_mask) begin
      ram_fflagdata_bits_uop_ftq_idx[ram_fflagdata_bits_uop_ftq_idx_MPORT_addr] <=
        ram_fflagdata_bits_uop_ftq_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_edge_inst_MPORT_en & ram_fflagdata_bits_uop_edge_inst_MPORT_mask) begin
      ram_fflagdata_bits_uop_edge_inst[ram_fflagdata_bits_uop_edge_inst_MPORT_addr] <=
        ram_fflagdata_bits_uop_edge_inst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_pc_lob_MPORT_en & ram_fflagdata_bits_uop_pc_lob_MPORT_mask) begin
      ram_fflagdata_bits_uop_pc_lob[ram_fflagdata_bits_uop_pc_lob_MPORT_addr] <=
        ram_fflagdata_bits_uop_pc_lob_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_taken_MPORT_en & ram_fflagdata_bits_uop_taken_MPORT_mask) begin
      ram_fflagdata_bits_uop_taken[ram_fflagdata_bits_uop_taken_MPORT_addr] <= ram_fflagdata_bits_uop_taken_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_imm_packed_MPORT_en & ram_fflagdata_bits_uop_imm_packed_MPORT_mask) begin
      ram_fflagdata_bits_uop_imm_packed[ram_fflagdata_bits_uop_imm_packed_MPORT_addr] <=
        ram_fflagdata_bits_uop_imm_packed_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_csr_addr_MPORT_en & ram_fflagdata_bits_uop_csr_addr_MPORT_mask) begin
      ram_fflagdata_bits_uop_csr_addr[ram_fflagdata_bits_uop_csr_addr_MPORT_addr] <=
        ram_fflagdata_bits_uop_csr_addr_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_rob_idx_MPORT_en & ram_fflagdata_bits_uop_rob_idx_MPORT_mask) begin
      ram_fflagdata_bits_uop_rob_idx[ram_fflagdata_bits_uop_rob_idx_MPORT_addr] <=
        ram_fflagdata_bits_uop_rob_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ldq_idx_MPORT_en & ram_fflagdata_bits_uop_ldq_idx_MPORT_mask) begin
      ram_fflagdata_bits_uop_ldq_idx[ram_fflagdata_bits_uop_ldq_idx_MPORT_addr] <=
        ram_fflagdata_bits_uop_ldq_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_stq_idx_MPORT_en & ram_fflagdata_bits_uop_stq_idx_MPORT_mask) begin
      ram_fflagdata_bits_uop_stq_idx[ram_fflagdata_bits_uop_stq_idx_MPORT_addr] <=
        ram_fflagdata_bits_uop_stq_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_rxq_idx_MPORT_en & ram_fflagdata_bits_uop_rxq_idx_MPORT_mask) begin
      ram_fflagdata_bits_uop_rxq_idx[ram_fflagdata_bits_uop_rxq_idx_MPORT_addr] <=
        ram_fflagdata_bits_uop_rxq_idx_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_pdst_MPORT_en & ram_fflagdata_bits_uop_pdst_MPORT_mask) begin
      ram_fflagdata_bits_uop_pdst[ram_fflagdata_bits_uop_pdst_MPORT_addr] <= ram_fflagdata_bits_uop_pdst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_prs1_MPORT_en & ram_fflagdata_bits_uop_prs1_MPORT_mask) begin
      ram_fflagdata_bits_uop_prs1[ram_fflagdata_bits_uop_prs1_MPORT_addr] <= ram_fflagdata_bits_uop_prs1_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_prs2_MPORT_en & ram_fflagdata_bits_uop_prs2_MPORT_mask) begin
      ram_fflagdata_bits_uop_prs2[ram_fflagdata_bits_uop_prs2_MPORT_addr] <= ram_fflagdata_bits_uop_prs2_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_prs3_MPORT_en & ram_fflagdata_bits_uop_prs3_MPORT_mask) begin
      ram_fflagdata_bits_uop_prs3[ram_fflagdata_bits_uop_prs3_MPORT_addr] <= ram_fflagdata_bits_uop_prs3_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ppred_MPORT_en & ram_fflagdata_bits_uop_ppred_MPORT_mask) begin
      ram_fflagdata_bits_uop_ppred[ram_fflagdata_bits_uop_ppred_MPORT_addr] <= ram_fflagdata_bits_uop_ppred_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_prs1_busy_MPORT_en & ram_fflagdata_bits_uop_prs1_busy_MPORT_mask) begin
      ram_fflagdata_bits_uop_prs1_busy[ram_fflagdata_bits_uop_prs1_busy_MPORT_addr] <=
        ram_fflagdata_bits_uop_prs1_busy_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_prs2_busy_MPORT_en & ram_fflagdata_bits_uop_prs2_busy_MPORT_mask) begin
      ram_fflagdata_bits_uop_prs2_busy[ram_fflagdata_bits_uop_prs2_busy_MPORT_addr] <=
        ram_fflagdata_bits_uop_prs2_busy_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_prs3_busy_MPORT_en & ram_fflagdata_bits_uop_prs3_busy_MPORT_mask) begin
      ram_fflagdata_bits_uop_prs3_busy[ram_fflagdata_bits_uop_prs3_busy_MPORT_addr] <=
        ram_fflagdata_bits_uop_prs3_busy_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ppred_busy_MPORT_en & ram_fflagdata_bits_uop_ppred_busy_MPORT_mask) begin
      ram_fflagdata_bits_uop_ppred_busy[ram_fflagdata_bits_uop_ppred_busy_MPORT_addr] <=
        ram_fflagdata_bits_uop_ppred_busy_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_stale_pdst_MPORT_en & ram_fflagdata_bits_uop_stale_pdst_MPORT_mask) begin
      ram_fflagdata_bits_uop_stale_pdst[ram_fflagdata_bits_uop_stale_pdst_MPORT_addr] <=
        ram_fflagdata_bits_uop_stale_pdst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_exception_MPORT_en & ram_fflagdata_bits_uop_exception_MPORT_mask) begin
      ram_fflagdata_bits_uop_exception[ram_fflagdata_bits_uop_exception_MPORT_addr] <=
        ram_fflagdata_bits_uop_exception_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_exc_cause_MPORT_en & ram_fflagdata_bits_uop_exc_cause_MPORT_mask) begin
      ram_fflagdata_bits_uop_exc_cause[ram_fflagdata_bits_uop_exc_cause_MPORT_addr] <=
        ram_fflagdata_bits_uop_exc_cause_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_bypassable_MPORT_en & ram_fflagdata_bits_uop_bypassable_MPORT_mask) begin
      ram_fflagdata_bits_uop_bypassable[ram_fflagdata_bits_uop_bypassable_MPORT_addr] <=
        ram_fflagdata_bits_uop_bypassable_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_mem_cmd_MPORT_en & ram_fflagdata_bits_uop_mem_cmd_MPORT_mask) begin
      ram_fflagdata_bits_uop_mem_cmd[ram_fflagdata_bits_uop_mem_cmd_MPORT_addr] <=
        ram_fflagdata_bits_uop_mem_cmd_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_mem_size_MPORT_en & ram_fflagdata_bits_uop_mem_size_MPORT_mask) begin
      ram_fflagdata_bits_uop_mem_size[ram_fflagdata_bits_uop_mem_size_MPORT_addr] <=
        ram_fflagdata_bits_uop_mem_size_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_mem_signed_MPORT_en & ram_fflagdata_bits_uop_mem_signed_MPORT_mask) begin
      ram_fflagdata_bits_uop_mem_signed[ram_fflagdata_bits_uop_mem_signed_MPORT_addr] <=
        ram_fflagdata_bits_uop_mem_signed_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_is_fence_MPORT_en & ram_fflagdata_bits_uop_is_fence_MPORT_mask) begin
      ram_fflagdata_bits_uop_is_fence[ram_fflagdata_bits_uop_is_fence_MPORT_addr] <=
        ram_fflagdata_bits_uop_is_fence_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_is_fencei_MPORT_en & ram_fflagdata_bits_uop_is_fencei_MPORT_mask) begin
      ram_fflagdata_bits_uop_is_fencei[ram_fflagdata_bits_uop_is_fencei_MPORT_addr] <=
        ram_fflagdata_bits_uop_is_fencei_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_is_amo_MPORT_en & ram_fflagdata_bits_uop_is_amo_MPORT_mask) begin
      ram_fflagdata_bits_uop_is_amo[ram_fflagdata_bits_uop_is_amo_MPORT_addr] <=
        ram_fflagdata_bits_uop_is_amo_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_uses_ldq_MPORT_en & ram_fflagdata_bits_uop_uses_ldq_MPORT_mask) begin
      ram_fflagdata_bits_uop_uses_ldq[ram_fflagdata_bits_uop_uses_ldq_MPORT_addr] <=
        ram_fflagdata_bits_uop_uses_ldq_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_uses_stq_MPORT_en & ram_fflagdata_bits_uop_uses_stq_MPORT_mask) begin
      ram_fflagdata_bits_uop_uses_stq[ram_fflagdata_bits_uop_uses_stq_MPORT_addr] <=
        ram_fflagdata_bits_uop_uses_stq_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_en & ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_mask) begin
      ram_fflagdata_bits_uop_is_sys_pc2epc[ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_addr] <=
        ram_fflagdata_bits_uop_is_sys_pc2epc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_is_unique_MPORT_en & ram_fflagdata_bits_uop_is_unique_MPORT_mask) begin
      ram_fflagdata_bits_uop_is_unique[ram_fflagdata_bits_uop_is_unique_MPORT_addr] <=
        ram_fflagdata_bits_uop_is_unique_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_flush_on_commit_MPORT_en & ram_fflagdata_bits_uop_flush_on_commit_MPORT_mask) begin
      ram_fflagdata_bits_uop_flush_on_commit[ram_fflagdata_bits_uop_flush_on_commit_MPORT_addr] <=
        ram_fflagdata_bits_uop_flush_on_commit_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_en & ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_mask) begin
      ram_fflagdata_bits_uop_ldst_is_rs1[ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_addr] <=
        ram_fflagdata_bits_uop_ldst_is_rs1_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ldst_MPORT_en & ram_fflagdata_bits_uop_ldst_MPORT_mask) begin
      ram_fflagdata_bits_uop_ldst[ram_fflagdata_bits_uop_ldst_MPORT_addr] <= ram_fflagdata_bits_uop_ldst_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_lrs1_MPORT_en & ram_fflagdata_bits_uop_lrs1_MPORT_mask) begin
      ram_fflagdata_bits_uop_lrs1[ram_fflagdata_bits_uop_lrs1_MPORT_addr] <= ram_fflagdata_bits_uop_lrs1_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_lrs2_MPORT_en & ram_fflagdata_bits_uop_lrs2_MPORT_mask) begin
      ram_fflagdata_bits_uop_lrs2[ram_fflagdata_bits_uop_lrs2_MPORT_addr] <= ram_fflagdata_bits_uop_lrs2_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_lrs3_MPORT_en & ram_fflagdata_bits_uop_lrs3_MPORT_mask) begin
      ram_fflagdata_bits_uop_lrs3[ram_fflagdata_bits_uop_lrs3_MPORT_addr] <= ram_fflagdata_bits_uop_lrs3_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_ldst_val_MPORT_en & ram_fflagdata_bits_uop_ldst_val_MPORT_mask) begin
      ram_fflagdata_bits_uop_ldst_val[ram_fflagdata_bits_uop_ldst_val_MPORT_addr] <=
        ram_fflagdata_bits_uop_ldst_val_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_dst_rtype_MPORT_en & ram_fflagdata_bits_uop_dst_rtype_MPORT_mask) begin
      ram_fflagdata_bits_uop_dst_rtype[ram_fflagdata_bits_uop_dst_rtype_MPORT_addr] <=
        ram_fflagdata_bits_uop_dst_rtype_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_lrs1_rtype_MPORT_en & ram_fflagdata_bits_uop_lrs1_rtype_MPORT_mask) begin
      ram_fflagdata_bits_uop_lrs1_rtype[ram_fflagdata_bits_uop_lrs1_rtype_MPORT_addr] <=
        ram_fflagdata_bits_uop_lrs1_rtype_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_lrs2_rtype_MPORT_en & ram_fflagdata_bits_uop_lrs2_rtype_MPORT_mask) begin
      ram_fflagdata_bits_uop_lrs2_rtype[ram_fflagdata_bits_uop_lrs2_rtype_MPORT_addr] <=
        ram_fflagdata_bits_uop_lrs2_rtype_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_frs3_en_MPORT_en & ram_fflagdata_bits_uop_frs3_en_MPORT_mask) begin
      ram_fflagdata_bits_uop_frs3_en[ram_fflagdata_bits_uop_frs3_en_MPORT_addr] <=
        ram_fflagdata_bits_uop_frs3_en_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_fp_val_MPORT_en & ram_fflagdata_bits_uop_fp_val_MPORT_mask) begin
      ram_fflagdata_bits_uop_fp_val[ram_fflagdata_bits_uop_fp_val_MPORT_addr] <=
        ram_fflagdata_bits_uop_fp_val_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_fp_single_MPORT_en & ram_fflagdata_bits_uop_fp_single_MPORT_mask) begin
      ram_fflagdata_bits_uop_fp_single[ram_fflagdata_bits_uop_fp_single_MPORT_addr] <=
        ram_fflagdata_bits_uop_fp_single_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_en & ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_mask) begin
      ram_fflagdata_bits_uop_xcpt_pf_if[ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_addr] <=
        ram_fflagdata_bits_uop_xcpt_pf_if_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_en & ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_mask) begin
      ram_fflagdata_bits_uop_xcpt_ae_if[ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_addr] <=
        ram_fflagdata_bits_uop_xcpt_ae_if_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_en & ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_mask) begin
      ram_fflagdata_bits_uop_xcpt_ma_if[ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_addr] <=
        ram_fflagdata_bits_uop_xcpt_ma_if_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_bp_debug_if_MPORT_en & ram_fflagdata_bits_uop_bp_debug_if_MPORT_mask) begin
      ram_fflagdata_bits_uop_bp_debug_if[ram_fflagdata_bits_uop_bp_debug_if_MPORT_addr] <=
        ram_fflagdata_bits_uop_bp_debug_if_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_en & ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_mask) begin
      ram_fflagdata_bits_uop_bp_xcpt_if[ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_addr] <=
        ram_fflagdata_bits_uop_bp_xcpt_if_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_debug_fsrc_MPORT_en & ram_fflagdata_bits_uop_debug_fsrc_MPORT_mask) begin
      ram_fflagdata_bits_uop_debug_fsrc[ram_fflagdata_bits_uop_debug_fsrc_MPORT_addr] <=
        ram_fflagdata_bits_uop_debug_fsrc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_uop_debug_tsrc_MPORT_en & ram_fflagdata_bits_uop_debug_tsrc_MPORT_mask) begin
      ram_fflagdata_bits_uop_debug_tsrc[ram_fflagdata_bits_uop_debug_tsrc_MPORT_addr] <=
        ram_fflagdata_bits_uop_debug_tsrc_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_fflagdata_bits_fflag_MPORT_en & ram_fflagdata_bits_fflag_MPORT_mask) begin
      ram_fflagdata_bits_fflag[ram_fflagdata_bits_fflag_MPORT_addr] <= ram_fflagdata_bits_fflag_MPORT_data; // @[util.scala 535:20]
    end
    if (reset) begin // @[util.scala 536:24]
      valids_0 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (3'h0 == value_1) begin // @[util.scala 567:27]
        valids_0 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_0 <= _GEN_1010;
      end
    end else begin
      valids_0 <= _GEN_1010;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_1 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (3'h1 == value_1) begin // @[util.scala 567:27]
        valids_1 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_1 <= _GEN_1011;
      end
    end else begin
      valids_1 <= _GEN_1011;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_2 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (3'h2 == value_1) begin // @[util.scala 567:27]
        valids_2 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_2 <= _GEN_1012;
      end
    end else begin
      valids_2 <= _GEN_1012;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_3 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (3'h3 == value_1) begin // @[util.scala 567:27]
        valids_3 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_3 <= _GEN_1013;
      end
    end else begin
      valids_3 <= _GEN_1013;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_4 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (3'h4 == value_1) begin // @[util.scala 567:27]
        valids_4 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_4 <= _GEN_1014;
      end
    end else begin
      valids_4 <= _GEN_1014;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_5 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (3'h5 == value_1) begin // @[util.scala 567:27]
        valids_5 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_5 <= _GEN_1015;
      end
    end else begin
      valids_5 <= _GEN_1015;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_6 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (3'h6 == value_1) begin // @[util.scala 567:27]
        valids_6 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_6 <= _GEN_1016;
      end
    end else begin
      valids_6 <= _GEN_1016;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 562:33]
        uops_0_br_mask <= _T_71; // @[util.scala 562:33]
      end else if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_0_br_mask <= _GEN_7;
      end
    end else begin
      uops_0_br_mask <= _GEN_7;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 562:33]
        uops_1_br_mask <= _T_71; // @[util.scala 562:33]
      end else if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_1_br_mask <= _GEN_8;
      end
    end else begin
      uops_1_br_mask <= _GEN_8;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 562:33]
        uops_2_br_mask <= _T_71; // @[util.scala 562:33]
      end else if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_2_br_mask <= _GEN_9;
      end
    end else begin
      uops_2_br_mask <= _GEN_9;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 562:33]
        uops_3_br_mask <= _T_71; // @[util.scala 562:33]
      end else if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_3_br_mask <= _GEN_10;
      end
    end else begin
      uops_3_br_mask <= _GEN_10;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 562:33]
        uops_4_br_mask <= _T_71; // @[util.scala 562:33]
      end else if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_4_br_mask <= _GEN_11;
      end
    end else begin
      uops_4_br_mask <= _GEN_11;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h4 == value) begin // @[util.scala 561:33]
        uops_4_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 562:33]
        uops_5_br_mask <= _T_71; // @[util.scala 562:33]
      end else if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_5_br_mask <= _GEN_12;
      end
    end else begin
      uops_5_br_mask <= _GEN_12;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h5 == value) begin // @[util.scala 561:33]
        uops_5_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 562:33]
        uops_6_br_mask <= _T_71; // @[util.scala 562:33]
      end else if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_6_br_mask <= _GEN_13;
      end
    end else begin
      uops_6_br_mask <= _GEN_13;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (3'h6 == value) begin // @[util.scala 561:33]
        uops_6_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 3'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[util.scala 558:17]
      if (wrap) begin // @[Counter.scala 86:20]
        value <= 3'h0; // @[Counter.scala 86:28]
      end else begin
        value <= _value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 3'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (wrap_1) begin // @[Counter.scala 86:20]
        value_1 <= 3'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[util.scala 541:27]
      maybe_full <= 1'h0; // @[util.scala 541:27]
    end else if (do_enq != do_deq) begin // @[util.scala 571:28]
      if (io_empty) begin // @[util.scala 586:21]
        if (io_deq_ready) begin // @[util.scala 592:27]
          maybe_full <= 1'h0; // @[util.scala 592:36]
        end else begin
          maybe_full <= _T_2;
        end
      end else begin
        maybe_full <= _T_2;
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {3{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
  _RAND_7 = {1{`RANDOM}};
  _RAND_9 = {1{`RANDOM}};
  _RAND_11 = {1{`RANDOM}};
  _RAND_13 = {1{`RANDOM}};
  _RAND_15 = {1{`RANDOM}};
  _RAND_17 = {1{`RANDOM}};
  _RAND_19 = {1{`RANDOM}};
  _RAND_21 = {1{`RANDOM}};
  _RAND_23 = {1{`RANDOM}};
  _RAND_25 = {1{`RANDOM}};
  _RAND_27 = {1{`RANDOM}};
  _RAND_29 = {1{`RANDOM}};
  _RAND_31 = {1{`RANDOM}};
  _RAND_33 = {1{`RANDOM}};
  _RAND_35 = {1{`RANDOM}};
  _RAND_37 = {1{`RANDOM}};
  _RAND_39 = {1{`RANDOM}};
  _RAND_41 = {1{`RANDOM}};
  _RAND_43 = {1{`RANDOM}};
  _RAND_45 = {1{`RANDOM}};
  _RAND_47 = {1{`RANDOM}};
  _RAND_49 = {2{`RANDOM}};
  _RAND_51 = {1{`RANDOM}};
  _RAND_53 = {1{`RANDOM}};
  _RAND_55 = {1{`RANDOM}};
  _RAND_57 = {1{`RANDOM}};
  _RAND_59 = {1{`RANDOM}};
  _RAND_61 = {1{`RANDOM}};
  _RAND_63 = {1{`RANDOM}};
  _RAND_65 = {1{`RANDOM}};
  _RAND_67 = {1{`RANDOM}};
  _RAND_69 = {1{`RANDOM}};
  _RAND_71 = {1{`RANDOM}};
  _RAND_73 = {1{`RANDOM}};
  _RAND_75 = {1{`RANDOM}};
  _RAND_77 = {1{`RANDOM}};
  _RAND_79 = {1{`RANDOM}};
  _RAND_81 = {1{`RANDOM}};
  _RAND_83 = {1{`RANDOM}};
  _RAND_85 = {1{`RANDOM}};
  _RAND_87 = {1{`RANDOM}};
  _RAND_89 = {1{`RANDOM}};
  _RAND_91 = {1{`RANDOM}};
  _RAND_93 = {1{`RANDOM}};
  _RAND_95 = {1{`RANDOM}};
  _RAND_97 = {1{`RANDOM}};
  _RAND_99 = {1{`RANDOM}};
  _RAND_101 = {1{`RANDOM}};
  _RAND_103 = {1{`RANDOM}};
  _RAND_105 = {1{`RANDOM}};
  _RAND_107 = {1{`RANDOM}};
  _RAND_109 = {1{`RANDOM}};
  _RAND_111 = {1{`RANDOM}};
  _RAND_113 = {1{`RANDOM}};
  _RAND_115 = {1{`RANDOM}};
  _RAND_117 = {1{`RANDOM}};
  _RAND_119 = {1{`RANDOM}};
  _RAND_121 = {1{`RANDOM}};
  _RAND_123 = {1{`RANDOM}};
  _RAND_125 = {1{`RANDOM}};
  _RAND_127 = {1{`RANDOM}};
  _RAND_129 = {1{`RANDOM}};
  _RAND_131 = {1{`RANDOM}};
  _RAND_133 = {1{`RANDOM}};
  _RAND_135 = {1{`RANDOM}};
  _RAND_137 = {2{`RANDOM}};
  _RAND_139 = {1{`RANDOM}};
  _RAND_141 = {1{`RANDOM}};
  _RAND_143 = {1{`RANDOM}};
  _RAND_145 = {1{`RANDOM}};
  _RAND_147 = {1{`RANDOM}};
  _RAND_149 = {1{`RANDOM}};
  _RAND_151 = {1{`RANDOM}};
  _RAND_153 = {1{`RANDOM}};
  _RAND_155 = {1{`RANDOM}};
  _RAND_157 = {1{`RANDOM}};
  _RAND_159 = {1{`RANDOM}};
  _RAND_161 = {1{`RANDOM}};
  _RAND_163 = {1{`RANDOM}};
  _RAND_165 = {1{`RANDOM}};
  _RAND_167 = {1{`RANDOM}};
  _RAND_169 = {1{`RANDOM}};
  _RAND_171 = {1{`RANDOM}};
  _RAND_173 = {1{`RANDOM}};
  _RAND_175 = {1{`RANDOM}};
  _RAND_177 = {1{`RANDOM}};
  _RAND_179 = {1{`RANDOM}};
  _RAND_181 = {1{`RANDOM}};
  _RAND_183 = {1{`RANDOM}};
  _RAND_185 = {1{`RANDOM}};
  _RAND_187 = {1{`RANDOM}};
  _RAND_189 = {1{`RANDOM}};
  _RAND_191 = {1{`RANDOM}};
  _RAND_193 = {1{`RANDOM}};
  _RAND_195 = {1{`RANDOM}};
  _RAND_197 = {1{`RANDOM}};
  _RAND_199 = {1{`RANDOM}};
  _RAND_201 = {1{`RANDOM}};
  _RAND_203 = {1{`RANDOM}};
  _RAND_205 = {1{`RANDOM}};
  _RAND_207 = {1{`RANDOM}};
  _RAND_209 = {1{`RANDOM}};
  _RAND_211 = {1{`RANDOM}};
  _RAND_213 = {1{`RANDOM}};
  _RAND_215 = {1{`RANDOM}};
  _RAND_217 = {1{`RANDOM}};
  _RAND_219 = {1{`RANDOM}};
  _RAND_221 = {1{`RANDOM}};
  _RAND_223 = {1{`RANDOM}};
  _RAND_225 = {1{`RANDOM}};
  _RAND_227 = {1{`RANDOM}};
  _RAND_229 = {1{`RANDOM}};
  _RAND_231 = {1{`RANDOM}};
  _RAND_233 = {1{`RANDOM}};
  _RAND_235 = {1{`RANDOM}};
  _RAND_237 = {1{`RANDOM}};
  _RAND_239 = {1{`RANDOM}};
  _RAND_241 = {1{`RANDOM}};
  _RAND_243 = {1{`RANDOM}};
  _RAND_245 = {1{`RANDOM}};
  _RAND_247 = {1{`RANDOM}};
  _RAND_249 = {2{`RANDOM}};
  _RAND_251 = {1{`RANDOM}};
  _RAND_253 = {1{`RANDOM}};
  _RAND_255 = {1{`RANDOM}};
  _RAND_257 = {1{`RANDOM}};
  _RAND_259 = {1{`RANDOM}};
  _RAND_261 = {1{`RANDOM}};
  _RAND_263 = {1{`RANDOM}};
  _RAND_265 = {1{`RANDOM}};
  _RAND_267 = {1{`RANDOM}};
  _RAND_269 = {1{`RANDOM}};
  _RAND_271 = {1{`RANDOM}};
  _RAND_273 = {1{`RANDOM}};
  _RAND_275 = {1{`RANDOM}};
  _RAND_277 = {1{`RANDOM}};
  _RAND_279 = {1{`RANDOM}};
  _RAND_281 = {1{`RANDOM}};
  _RAND_283 = {1{`RANDOM}};
  _RAND_285 = {1{`RANDOM}};
  _RAND_287 = {1{`RANDOM}};
  _RAND_289 = {1{`RANDOM}};
  _RAND_291 = {1{`RANDOM}};
  _RAND_293 = {1{`RANDOM}};
  _RAND_295 = {1{`RANDOM}};
  _RAND_297 = {1{`RANDOM}};
  _RAND_299 = {1{`RANDOM}};
  _RAND_301 = {1{`RANDOM}};
  _RAND_303 = {1{`RANDOM}};
  _RAND_305 = {1{`RANDOM}};
  _RAND_307 = {1{`RANDOM}};
  _RAND_309 = {1{`RANDOM}};
  _RAND_311 = {1{`RANDOM}};
  _RAND_313 = {1{`RANDOM}};
  _RAND_315 = {1{`RANDOM}};
  _RAND_317 = {1{`RANDOM}};
  _RAND_319 = {1{`RANDOM}};
  _RAND_321 = {1{`RANDOM}};
  _RAND_323 = {1{`RANDOM}};
  _RAND_325 = {1{`RANDOM}};
  _RAND_327 = {1{`RANDOM}};
  _RAND_329 = {1{`RANDOM}};
  _RAND_331 = {1{`RANDOM}};
  _RAND_333 = {1{`RANDOM}};
  _RAND_335 = {1{`RANDOM}};
  _RAND_337 = {2{`RANDOM}};
  _RAND_339 = {1{`RANDOM}};
  _RAND_341 = {1{`RANDOM}};
  _RAND_343 = {1{`RANDOM}};
  _RAND_345 = {1{`RANDOM}};
  _RAND_347 = {1{`RANDOM}};
  _RAND_349 = {1{`RANDOM}};
  _RAND_351 = {1{`RANDOM}};
  _RAND_353 = {1{`RANDOM}};
  _RAND_355 = {1{`RANDOM}};
  _RAND_357 = {1{`RANDOM}};
  _RAND_359 = {1{`RANDOM}};
  _RAND_361 = {1{`RANDOM}};
  _RAND_363 = {1{`RANDOM}};
  _RAND_365 = {1{`RANDOM}};
  _RAND_367 = {1{`RANDOM}};
  _RAND_369 = {1{`RANDOM}};
  _RAND_371 = {1{`RANDOM}};
  _RAND_373 = {1{`RANDOM}};
  _RAND_375 = {1{`RANDOM}};
  _RAND_377 = {1{`RANDOM}};
  _RAND_379 = {1{`RANDOM}};
  _RAND_381 = {1{`RANDOM}};
  _RAND_383 = {1{`RANDOM}};
  _RAND_385 = {1{`RANDOM}};
  _RAND_387 = {1{`RANDOM}};
  _RAND_389 = {1{`RANDOM}};
  _RAND_391 = {1{`RANDOM}};
  _RAND_393 = {1{`RANDOM}};
  _RAND_395 = {1{`RANDOM}};
  _RAND_397 = {1{`RANDOM}};
  _RAND_399 = {1{`RANDOM}};
  _RAND_401 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {3{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[64:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_predicated[initvar] = _RAND_2[0:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_valid[initvar] = _RAND_4[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_switch[initvar] = _RAND_6[0:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_switch_off[initvar] = _RAND_8[0:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_unicore[initvar] = _RAND_10[0:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_shift[initvar] = _RAND_12[2:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_lrs3_rtype[initvar] = _RAND_14[1:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_rflag[initvar] = _RAND_16[0:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_wflag[initvar] = _RAND_18[0:0];
  _RAND_20 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prflag[initvar] = _RAND_20[3:0];
  _RAND_22 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_pwflag[initvar] = _RAND_22[3:0];
  _RAND_24 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_pflag_busy[initvar] = _RAND_24[0:0];
  _RAND_26 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_stale_pflag[initvar] = _RAND_26[3:0];
  _RAND_28 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_op1_sel[initvar] = _RAND_28[3:0];
  _RAND_30 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_op2_sel[initvar] = _RAND_30[3:0];
  _RAND_32 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_split_num[initvar] = _RAND_32[5:0];
  _RAND_34 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_self_index[initvar] = _RAND_34[5:0];
  _RAND_36 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_rob_inst_idx[initvar] = _RAND_36[5:0];
  _RAND_38 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_address_num[initvar] = _RAND_38[5:0];
  _RAND_40 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_uopc[initvar] = _RAND_40[6:0];
  _RAND_42 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_inst[initvar] = _RAND_42[31:0];
  _RAND_44 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_debug_inst[initvar] = _RAND_44[31:0];
  _RAND_46 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_rvc[initvar] = _RAND_46[0:0];
  _RAND_48 = {2{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_debug_pc[initvar] = _RAND_48[39:0];
  _RAND_50 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_iq_type[initvar] = _RAND_50[2:0];
  _RAND_52 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_fu_code[initvar] = _RAND_52[9:0];
  _RAND_54 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_br_type[initvar] = _RAND_54[3:0];
  _RAND_56 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_op1_sel[initvar] = _RAND_56[1:0];
  _RAND_58 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_op2_sel[initvar] = _RAND_58[2:0];
  _RAND_60 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_imm_sel[initvar] = _RAND_60[2:0];
  _RAND_62 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_op_fcn[initvar] = _RAND_62[3:0];
  _RAND_64 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_fcn_dw[initvar] = _RAND_64[0:0];
  _RAND_66 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_csr_cmd[initvar] = _RAND_66[2:0];
  _RAND_68 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_is_load[initvar] = _RAND_68[0:0];
  _RAND_70 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_is_sta[initvar] = _RAND_70[0:0];
  _RAND_72 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_is_std[initvar] = _RAND_72[0:0];
  _RAND_74 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_op3_sel[initvar] = _RAND_74[1:0];
  _RAND_76 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_iw_state[initvar] = _RAND_76[1:0];
  _RAND_78 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_iw_p1_poisoned[initvar] = _RAND_78[0:0];
  _RAND_80 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_iw_p2_poisoned[initvar] = _RAND_80[0:0];
  _RAND_82 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_br[initvar] = _RAND_82[0:0];
  _RAND_84 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_jalr[initvar] = _RAND_84[0:0];
  _RAND_86 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_jal[initvar] = _RAND_86[0:0];
  _RAND_88 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_sfb[initvar] = _RAND_88[0:0];
  _RAND_90 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_br_mask[initvar] = _RAND_90[11:0];
  _RAND_92 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_br_tag[initvar] = _RAND_92[3:0];
  _RAND_94 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ftq_idx[initvar] = _RAND_94[4:0];
  _RAND_96 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_edge_inst[initvar] = _RAND_96[0:0];
  _RAND_98 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_pc_lob[initvar] = _RAND_98[5:0];
  _RAND_100 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_taken[initvar] = _RAND_100[0:0];
  _RAND_102 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_imm_packed[initvar] = _RAND_102[19:0];
  _RAND_104 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_csr_addr[initvar] = _RAND_104[11:0];
  _RAND_106 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_rob_idx[initvar] = _RAND_106[5:0];
  _RAND_108 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ldq_idx[initvar] = _RAND_108[4:0];
  _RAND_110 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_stq_idx[initvar] = _RAND_110[4:0];
  _RAND_112 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_rxq_idx[initvar] = _RAND_112[1:0];
  _RAND_114 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_pdst[initvar] = _RAND_114[6:0];
  _RAND_116 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs1[initvar] = _RAND_116[6:0];
  _RAND_118 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs2[initvar] = _RAND_118[6:0];
  _RAND_120 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs3[initvar] = _RAND_120[6:0];
  _RAND_122 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ppred[initvar] = _RAND_122[4:0];
  _RAND_124 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs1_busy[initvar] = _RAND_124[0:0];
  _RAND_126 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs2_busy[initvar] = _RAND_126[0:0];
  _RAND_128 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs3_busy[initvar] = _RAND_128[0:0];
  _RAND_130 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ppred_busy[initvar] = _RAND_130[0:0];
  _RAND_132 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_stale_pdst[initvar] = _RAND_132[6:0];
  _RAND_134 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_exception[initvar] = _RAND_134[0:0];
  _RAND_136 = {2{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_exc_cause[initvar] = _RAND_136[63:0];
  _RAND_138 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_bypassable[initvar] = _RAND_138[0:0];
  _RAND_140 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_mem_cmd[initvar] = _RAND_140[4:0];
  _RAND_142 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_mem_size[initvar] = _RAND_142[1:0];
  _RAND_144 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_mem_signed[initvar] = _RAND_144[0:0];
  _RAND_146 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_fence[initvar] = _RAND_146[0:0];
  _RAND_148 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_fencei[initvar] = _RAND_148[0:0];
  _RAND_150 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_amo[initvar] = _RAND_150[0:0];
  _RAND_152 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_uses_ldq[initvar] = _RAND_152[0:0];
  _RAND_154 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_uses_stq[initvar] = _RAND_154[0:0];
  _RAND_156 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_sys_pc2epc[initvar] = _RAND_156[0:0];
  _RAND_158 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_unique[initvar] = _RAND_158[0:0];
  _RAND_160 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_flush_on_commit[initvar] = _RAND_160[0:0];
  _RAND_162 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ldst_is_rs1[initvar] = _RAND_162[0:0];
  _RAND_164 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ldst[initvar] = _RAND_164[5:0];
  _RAND_166 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_lrs1[initvar] = _RAND_166[5:0];
  _RAND_168 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_lrs2[initvar] = _RAND_168[5:0];
  _RAND_170 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_lrs3[initvar] = _RAND_170[5:0];
  _RAND_172 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ldst_val[initvar] = _RAND_172[0:0];
  _RAND_174 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_dst_rtype[initvar] = _RAND_174[1:0];
  _RAND_176 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_lrs1_rtype[initvar] = _RAND_176[1:0];
  _RAND_178 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_lrs2_rtype[initvar] = _RAND_178[1:0];
  _RAND_180 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_frs3_en[initvar] = _RAND_180[0:0];
  _RAND_182 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_fp_val[initvar] = _RAND_182[0:0];
  _RAND_184 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_fp_single[initvar] = _RAND_184[0:0];
  _RAND_186 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_xcpt_pf_if[initvar] = _RAND_186[0:0];
  _RAND_188 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_xcpt_ae_if[initvar] = _RAND_188[0:0];
  _RAND_190 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_xcpt_ma_if[initvar] = _RAND_190[0:0];
  _RAND_192 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_bp_debug_if[initvar] = _RAND_192[0:0];
  _RAND_194 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_bp_xcpt_if[initvar] = _RAND_194[0:0];
  _RAND_196 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_debug_fsrc[initvar] = _RAND_196[1:0];
  _RAND_198 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_debug_tsrc[initvar] = _RAND_198[1:0];
  _RAND_200 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_flags[initvar] = _RAND_200[4:0];
  _RAND_202 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_flagdata[initvar] = _RAND_202[3:0];
  _RAND_204 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_valid[initvar] = _RAND_204[0:0];
  _RAND_206 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_switch[initvar] = _RAND_206[0:0];
  _RAND_208 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_switch_off[initvar] = _RAND_208[0:0];
  _RAND_210 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_is_unicore[initvar] = _RAND_210[0:0];
  _RAND_212 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_shift[initvar] = _RAND_212[2:0];
  _RAND_214 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_lrs3_rtype[initvar] = _RAND_214[1:0];
  _RAND_216 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_rflag[initvar] = _RAND_216[0:0];
  _RAND_218 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_wflag[initvar] = _RAND_218[0:0];
  _RAND_220 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_prflag[initvar] = _RAND_220[3:0];
  _RAND_222 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_pwflag[initvar] = _RAND_222[3:0];
  _RAND_224 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_pflag_busy[initvar] = _RAND_224[0:0];
  _RAND_226 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_stale_pflag[initvar] = _RAND_226[3:0];
  _RAND_228 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_op1_sel[initvar] = _RAND_228[3:0];
  _RAND_230 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_op2_sel[initvar] = _RAND_230[3:0];
  _RAND_232 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_split_num[initvar] = _RAND_232[5:0];
  _RAND_234 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_self_index[initvar] = _RAND_234[5:0];
  _RAND_236 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_rob_inst_idx[initvar] = _RAND_236[5:0];
  _RAND_238 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_address_num[initvar] = _RAND_238[5:0];
  _RAND_240 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_uopc[initvar] = _RAND_240[6:0];
  _RAND_242 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_inst[initvar] = _RAND_242[31:0];
  _RAND_244 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_debug_inst[initvar] = _RAND_244[31:0];
  _RAND_246 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_is_rvc[initvar] = _RAND_246[0:0];
  _RAND_248 = {2{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_debug_pc[initvar] = _RAND_248[39:0];
  _RAND_250 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_iq_type[initvar] = _RAND_250[2:0];
  _RAND_252 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_fu_code[initvar] = _RAND_252[9:0];
  _RAND_254 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ctrl_br_type[initvar] = _RAND_254[3:0];
  _RAND_256 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ctrl_op1_sel[initvar] = _RAND_256[1:0];
  _RAND_258 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ctrl_op2_sel[initvar] = _RAND_258[2:0];
  _RAND_260 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ctrl_imm_sel[initvar] = _RAND_260[2:0];
  _RAND_262 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ctrl_op_fcn[initvar] = _RAND_262[3:0];
  _RAND_264 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ctrl_fcn_dw[initvar] = _RAND_264[0:0];
  _RAND_266 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ctrl_csr_cmd[initvar] = _RAND_266[2:0];
  _RAND_268 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ctrl_is_load[initvar] = _RAND_268[0:0];
  _RAND_270 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ctrl_is_sta[initvar] = _RAND_270[0:0];
  _RAND_272 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ctrl_is_std[initvar] = _RAND_272[0:0];
  _RAND_274 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ctrl_op3_sel[initvar] = _RAND_274[1:0];
  _RAND_276 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_iw_state[initvar] = _RAND_276[1:0];
  _RAND_278 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_iw_p1_poisoned[initvar] = _RAND_278[0:0];
  _RAND_280 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_iw_p2_poisoned[initvar] = _RAND_280[0:0];
  _RAND_282 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_is_br[initvar] = _RAND_282[0:0];
  _RAND_284 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_is_jalr[initvar] = _RAND_284[0:0];
  _RAND_286 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_is_jal[initvar] = _RAND_286[0:0];
  _RAND_288 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_is_sfb[initvar] = _RAND_288[0:0];
  _RAND_290 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_br_mask[initvar] = _RAND_290[11:0];
  _RAND_292 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_br_tag[initvar] = _RAND_292[3:0];
  _RAND_294 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ftq_idx[initvar] = _RAND_294[4:0];
  _RAND_296 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_edge_inst[initvar] = _RAND_296[0:0];
  _RAND_298 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_pc_lob[initvar] = _RAND_298[5:0];
  _RAND_300 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_taken[initvar] = _RAND_300[0:0];
  _RAND_302 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_imm_packed[initvar] = _RAND_302[19:0];
  _RAND_304 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_csr_addr[initvar] = _RAND_304[11:0];
  _RAND_306 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_rob_idx[initvar] = _RAND_306[5:0];
  _RAND_308 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ldq_idx[initvar] = _RAND_308[4:0];
  _RAND_310 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_stq_idx[initvar] = _RAND_310[4:0];
  _RAND_312 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_rxq_idx[initvar] = _RAND_312[1:0];
  _RAND_314 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_pdst[initvar] = _RAND_314[6:0];
  _RAND_316 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_prs1[initvar] = _RAND_316[6:0];
  _RAND_318 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_prs2[initvar] = _RAND_318[6:0];
  _RAND_320 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_prs3[initvar] = _RAND_320[6:0];
  _RAND_322 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ppred[initvar] = _RAND_322[4:0];
  _RAND_324 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_prs1_busy[initvar] = _RAND_324[0:0];
  _RAND_326 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_prs2_busy[initvar] = _RAND_326[0:0];
  _RAND_328 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_prs3_busy[initvar] = _RAND_328[0:0];
  _RAND_330 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ppred_busy[initvar] = _RAND_330[0:0];
  _RAND_332 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_stale_pdst[initvar] = _RAND_332[6:0];
  _RAND_334 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_exception[initvar] = _RAND_334[0:0];
  _RAND_336 = {2{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_exc_cause[initvar] = _RAND_336[63:0];
  _RAND_338 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_bypassable[initvar] = _RAND_338[0:0];
  _RAND_340 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_mem_cmd[initvar] = _RAND_340[4:0];
  _RAND_342 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_mem_size[initvar] = _RAND_342[1:0];
  _RAND_344 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_mem_signed[initvar] = _RAND_344[0:0];
  _RAND_346 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_is_fence[initvar] = _RAND_346[0:0];
  _RAND_348 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_is_fencei[initvar] = _RAND_348[0:0];
  _RAND_350 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_is_amo[initvar] = _RAND_350[0:0];
  _RAND_352 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_uses_ldq[initvar] = _RAND_352[0:0];
  _RAND_354 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_uses_stq[initvar] = _RAND_354[0:0];
  _RAND_356 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_is_sys_pc2epc[initvar] = _RAND_356[0:0];
  _RAND_358 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_is_unique[initvar] = _RAND_358[0:0];
  _RAND_360 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_flush_on_commit[initvar] = _RAND_360[0:0];
  _RAND_362 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ldst_is_rs1[initvar] = _RAND_362[0:0];
  _RAND_364 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ldst[initvar] = _RAND_364[5:0];
  _RAND_366 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_lrs1[initvar] = _RAND_366[5:0];
  _RAND_368 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_lrs2[initvar] = _RAND_368[5:0];
  _RAND_370 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_lrs3[initvar] = _RAND_370[5:0];
  _RAND_372 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_ldst_val[initvar] = _RAND_372[0:0];
  _RAND_374 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_dst_rtype[initvar] = _RAND_374[1:0];
  _RAND_376 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_lrs1_rtype[initvar] = _RAND_376[1:0];
  _RAND_378 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_lrs2_rtype[initvar] = _RAND_378[1:0];
  _RAND_380 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_frs3_en[initvar] = _RAND_380[0:0];
  _RAND_382 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_fp_val[initvar] = _RAND_382[0:0];
  _RAND_384 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_fp_single[initvar] = _RAND_384[0:0];
  _RAND_386 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_xcpt_pf_if[initvar] = _RAND_386[0:0];
  _RAND_388 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_xcpt_ae_if[initvar] = _RAND_388[0:0];
  _RAND_390 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_xcpt_ma_if[initvar] = _RAND_390[0:0];
  _RAND_392 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_bp_debug_if[initvar] = _RAND_392[0:0];
  _RAND_394 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_bp_xcpt_if[initvar] = _RAND_394[0:0];
  _RAND_396 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_debug_fsrc[initvar] = _RAND_396[1:0];
  _RAND_398 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_uop_debug_tsrc[initvar] = _RAND_398[1:0];
  _RAND_400 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflagdata_bits_fflag[initvar] = _RAND_400[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_402 = {1{`RANDOM}};
  valids_0 = _RAND_402[0:0];
  _RAND_403 = {1{`RANDOM}};
  valids_1 = _RAND_403[0:0];
  _RAND_404 = {1{`RANDOM}};
  valids_2 = _RAND_404[0:0];
  _RAND_405 = {1{`RANDOM}};
  valids_3 = _RAND_405[0:0];
  _RAND_406 = {1{`RANDOM}};
  valids_4 = _RAND_406[0:0];
  _RAND_407 = {1{`RANDOM}};
  valids_5 = _RAND_407[0:0];
  _RAND_408 = {1{`RANDOM}};
  valids_6 = _RAND_408[0:0];
  _RAND_409 = {1{`RANDOM}};
  uops_0_switch = _RAND_409[0:0];
  _RAND_410 = {1{`RANDOM}};
  uops_0_switch_off = _RAND_410[0:0];
  _RAND_411 = {1{`RANDOM}};
  uops_0_is_unicore = _RAND_411[0:0];
  _RAND_412 = {1{`RANDOM}};
  uops_0_shift = _RAND_412[2:0];
  _RAND_413 = {1{`RANDOM}};
  uops_0_lrs3_rtype = _RAND_413[1:0];
  _RAND_414 = {1{`RANDOM}};
  uops_0_rflag = _RAND_414[0:0];
  _RAND_415 = {1{`RANDOM}};
  uops_0_wflag = _RAND_415[0:0];
  _RAND_416 = {1{`RANDOM}};
  uops_0_prflag = _RAND_416[3:0];
  _RAND_417 = {1{`RANDOM}};
  uops_0_pwflag = _RAND_417[3:0];
  _RAND_418 = {1{`RANDOM}};
  uops_0_pflag_busy = _RAND_418[0:0];
  _RAND_419 = {1{`RANDOM}};
  uops_0_stale_pflag = _RAND_419[3:0];
  _RAND_420 = {1{`RANDOM}};
  uops_0_op1_sel = _RAND_420[3:0];
  _RAND_421 = {1{`RANDOM}};
  uops_0_op2_sel = _RAND_421[3:0];
  _RAND_422 = {1{`RANDOM}};
  uops_0_split_num = _RAND_422[5:0];
  _RAND_423 = {1{`RANDOM}};
  uops_0_self_index = _RAND_423[5:0];
  _RAND_424 = {1{`RANDOM}};
  uops_0_rob_inst_idx = _RAND_424[5:0];
  _RAND_425 = {1{`RANDOM}};
  uops_0_address_num = _RAND_425[5:0];
  _RAND_426 = {1{`RANDOM}};
  uops_0_uopc = _RAND_426[6:0];
  _RAND_427 = {1{`RANDOM}};
  uops_0_inst = _RAND_427[31:0];
  _RAND_428 = {1{`RANDOM}};
  uops_0_debug_inst = _RAND_428[31:0];
  _RAND_429 = {1{`RANDOM}};
  uops_0_is_rvc = _RAND_429[0:0];
  _RAND_430 = {2{`RANDOM}};
  uops_0_debug_pc = _RAND_430[39:0];
  _RAND_431 = {1{`RANDOM}};
  uops_0_iq_type = _RAND_431[2:0];
  _RAND_432 = {1{`RANDOM}};
  uops_0_fu_code = _RAND_432[9:0];
  _RAND_433 = {1{`RANDOM}};
  uops_0_ctrl_br_type = _RAND_433[3:0];
  _RAND_434 = {1{`RANDOM}};
  uops_0_ctrl_op1_sel = _RAND_434[1:0];
  _RAND_435 = {1{`RANDOM}};
  uops_0_ctrl_op2_sel = _RAND_435[2:0];
  _RAND_436 = {1{`RANDOM}};
  uops_0_ctrl_imm_sel = _RAND_436[2:0];
  _RAND_437 = {1{`RANDOM}};
  uops_0_ctrl_op_fcn = _RAND_437[3:0];
  _RAND_438 = {1{`RANDOM}};
  uops_0_ctrl_fcn_dw = _RAND_438[0:0];
  _RAND_439 = {1{`RANDOM}};
  uops_0_ctrl_csr_cmd = _RAND_439[2:0];
  _RAND_440 = {1{`RANDOM}};
  uops_0_ctrl_is_load = _RAND_440[0:0];
  _RAND_441 = {1{`RANDOM}};
  uops_0_ctrl_is_sta = _RAND_441[0:0];
  _RAND_442 = {1{`RANDOM}};
  uops_0_ctrl_is_std = _RAND_442[0:0];
  _RAND_443 = {1{`RANDOM}};
  uops_0_ctrl_op3_sel = _RAND_443[1:0];
  _RAND_444 = {1{`RANDOM}};
  uops_0_iw_state = _RAND_444[1:0];
  _RAND_445 = {1{`RANDOM}};
  uops_0_iw_p1_poisoned = _RAND_445[0:0];
  _RAND_446 = {1{`RANDOM}};
  uops_0_iw_p2_poisoned = _RAND_446[0:0];
  _RAND_447 = {1{`RANDOM}};
  uops_0_is_br = _RAND_447[0:0];
  _RAND_448 = {1{`RANDOM}};
  uops_0_is_jalr = _RAND_448[0:0];
  _RAND_449 = {1{`RANDOM}};
  uops_0_is_jal = _RAND_449[0:0];
  _RAND_450 = {1{`RANDOM}};
  uops_0_is_sfb = _RAND_450[0:0];
  _RAND_451 = {1{`RANDOM}};
  uops_0_br_mask = _RAND_451[11:0];
  _RAND_452 = {1{`RANDOM}};
  uops_0_br_tag = _RAND_452[3:0];
  _RAND_453 = {1{`RANDOM}};
  uops_0_ftq_idx = _RAND_453[4:0];
  _RAND_454 = {1{`RANDOM}};
  uops_0_edge_inst = _RAND_454[0:0];
  _RAND_455 = {1{`RANDOM}};
  uops_0_pc_lob = _RAND_455[5:0];
  _RAND_456 = {1{`RANDOM}};
  uops_0_taken = _RAND_456[0:0];
  _RAND_457 = {1{`RANDOM}};
  uops_0_imm_packed = _RAND_457[19:0];
  _RAND_458 = {1{`RANDOM}};
  uops_0_csr_addr = _RAND_458[11:0];
  _RAND_459 = {1{`RANDOM}};
  uops_0_rob_idx = _RAND_459[5:0];
  _RAND_460 = {1{`RANDOM}};
  uops_0_ldq_idx = _RAND_460[4:0];
  _RAND_461 = {1{`RANDOM}};
  uops_0_stq_idx = _RAND_461[4:0];
  _RAND_462 = {1{`RANDOM}};
  uops_0_rxq_idx = _RAND_462[1:0];
  _RAND_463 = {1{`RANDOM}};
  uops_0_pdst = _RAND_463[6:0];
  _RAND_464 = {1{`RANDOM}};
  uops_0_prs1 = _RAND_464[6:0];
  _RAND_465 = {1{`RANDOM}};
  uops_0_prs2 = _RAND_465[6:0];
  _RAND_466 = {1{`RANDOM}};
  uops_0_prs3 = _RAND_466[6:0];
  _RAND_467 = {1{`RANDOM}};
  uops_0_ppred = _RAND_467[4:0];
  _RAND_468 = {1{`RANDOM}};
  uops_0_prs1_busy = _RAND_468[0:0];
  _RAND_469 = {1{`RANDOM}};
  uops_0_prs2_busy = _RAND_469[0:0];
  _RAND_470 = {1{`RANDOM}};
  uops_0_prs3_busy = _RAND_470[0:0];
  _RAND_471 = {1{`RANDOM}};
  uops_0_ppred_busy = _RAND_471[0:0];
  _RAND_472 = {1{`RANDOM}};
  uops_0_stale_pdst = _RAND_472[6:0];
  _RAND_473 = {1{`RANDOM}};
  uops_0_exception = _RAND_473[0:0];
  _RAND_474 = {2{`RANDOM}};
  uops_0_exc_cause = _RAND_474[63:0];
  _RAND_475 = {1{`RANDOM}};
  uops_0_bypassable = _RAND_475[0:0];
  _RAND_476 = {1{`RANDOM}};
  uops_0_mem_cmd = _RAND_476[4:0];
  _RAND_477 = {1{`RANDOM}};
  uops_0_mem_size = _RAND_477[1:0];
  _RAND_478 = {1{`RANDOM}};
  uops_0_mem_signed = _RAND_478[0:0];
  _RAND_479 = {1{`RANDOM}};
  uops_0_is_fence = _RAND_479[0:0];
  _RAND_480 = {1{`RANDOM}};
  uops_0_is_fencei = _RAND_480[0:0];
  _RAND_481 = {1{`RANDOM}};
  uops_0_is_amo = _RAND_481[0:0];
  _RAND_482 = {1{`RANDOM}};
  uops_0_uses_ldq = _RAND_482[0:0];
  _RAND_483 = {1{`RANDOM}};
  uops_0_uses_stq = _RAND_483[0:0];
  _RAND_484 = {1{`RANDOM}};
  uops_0_is_sys_pc2epc = _RAND_484[0:0];
  _RAND_485 = {1{`RANDOM}};
  uops_0_is_unique = _RAND_485[0:0];
  _RAND_486 = {1{`RANDOM}};
  uops_0_flush_on_commit = _RAND_486[0:0];
  _RAND_487 = {1{`RANDOM}};
  uops_0_ldst_is_rs1 = _RAND_487[0:0];
  _RAND_488 = {1{`RANDOM}};
  uops_0_ldst = _RAND_488[5:0];
  _RAND_489 = {1{`RANDOM}};
  uops_0_lrs1 = _RAND_489[5:0];
  _RAND_490 = {1{`RANDOM}};
  uops_0_lrs2 = _RAND_490[5:0];
  _RAND_491 = {1{`RANDOM}};
  uops_0_lrs3 = _RAND_491[5:0];
  _RAND_492 = {1{`RANDOM}};
  uops_0_ldst_val = _RAND_492[0:0];
  _RAND_493 = {1{`RANDOM}};
  uops_0_dst_rtype = _RAND_493[1:0];
  _RAND_494 = {1{`RANDOM}};
  uops_0_lrs1_rtype = _RAND_494[1:0];
  _RAND_495 = {1{`RANDOM}};
  uops_0_lrs2_rtype = _RAND_495[1:0];
  _RAND_496 = {1{`RANDOM}};
  uops_0_frs3_en = _RAND_496[0:0];
  _RAND_497 = {1{`RANDOM}};
  uops_0_fp_val = _RAND_497[0:0];
  _RAND_498 = {1{`RANDOM}};
  uops_0_fp_single = _RAND_498[0:0];
  _RAND_499 = {1{`RANDOM}};
  uops_0_xcpt_pf_if = _RAND_499[0:0];
  _RAND_500 = {1{`RANDOM}};
  uops_0_xcpt_ae_if = _RAND_500[0:0];
  _RAND_501 = {1{`RANDOM}};
  uops_0_xcpt_ma_if = _RAND_501[0:0];
  _RAND_502 = {1{`RANDOM}};
  uops_0_bp_debug_if = _RAND_502[0:0];
  _RAND_503 = {1{`RANDOM}};
  uops_0_bp_xcpt_if = _RAND_503[0:0];
  _RAND_504 = {1{`RANDOM}};
  uops_0_debug_fsrc = _RAND_504[1:0];
  _RAND_505 = {1{`RANDOM}};
  uops_0_debug_tsrc = _RAND_505[1:0];
  _RAND_506 = {1{`RANDOM}};
  uops_1_switch = _RAND_506[0:0];
  _RAND_507 = {1{`RANDOM}};
  uops_1_switch_off = _RAND_507[0:0];
  _RAND_508 = {1{`RANDOM}};
  uops_1_is_unicore = _RAND_508[0:0];
  _RAND_509 = {1{`RANDOM}};
  uops_1_shift = _RAND_509[2:0];
  _RAND_510 = {1{`RANDOM}};
  uops_1_lrs3_rtype = _RAND_510[1:0];
  _RAND_511 = {1{`RANDOM}};
  uops_1_rflag = _RAND_511[0:0];
  _RAND_512 = {1{`RANDOM}};
  uops_1_wflag = _RAND_512[0:0];
  _RAND_513 = {1{`RANDOM}};
  uops_1_prflag = _RAND_513[3:0];
  _RAND_514 = {1{`RANDOM}};
  uops_1_pwflag = _RAND_514[3:0];
  _RAND_515 = {1{`RANDOM}};
  uops_1_pflag_busy = _RAND_515[0:0];
  _RAND_516 = {1{`RANDOM}};
  uops_1_stale_pflag = _RAND_516[3:0];
  _RAND_517 = {1{`RANDOM}};
  uops_1_op1_sel = _RAND_517[3:0];
  _RAND_518 = {1{`RANDOM}};
  uops_1_op2_sel = _RAND_518[3:0];
  _RAND_519 = {1{`RANDOM}};
  uops_1_split_num = _RAND_519[5:0];
  _RAND_520 = {1{`RANDOM}};
  uops_1_self_index = _RAND_520[5:0];
  _RAND_521 = {1{`RANDOM}};
  uops_1_rob_inst_idx = _RAND_521[5:0];
  _RAND_522 = {1{`RANDOM}};
  uops_1_address_num = _RAND_522[5:0];
  _RAND_523 = {1{`RANDOM}};
  uops_1_uopc = _RAND_523[6:0];
  _RAND_524 = {1{`RANDOM}};
  uops_1_inst = _RAND_524[31:0];
  _RAND_525 = {1{`RANDOM}};
  uops_1_debug_inst = _RAND_525[31:0];
  _RAND_526 = {1{`RANDOM}};
  uops_1_is_rvc = _RAND_526[0:0];
  _RAND_527 = {2{`RANDOM}};
  uops_1_debug_pc = _RAND_527[39:0];
  _RAND_528 = {1{`RANDOM}};
  uops_1_iq_type = _RAND_528[2:0];
  _RAND_529 = {1{`RANDOM}};
  uops_1_fu_code = _RAND_529[9:0];
  _RAND_530 = {1{`RANDOM}};
  uops_1_ctrl_br_type = _RAND_530[3:0];
  _RAND_531 = {1{`RANDOM}};
  uops_1_ctrl_op1_sel = _RAND_531[1:0];
  _RAND_532 = {1{`RANDOM}};
  uops_1_ctrl_op2_sel = _RAND_532[2:0];
  _RAND_533 = {1{`RANDOM}};
  uops_1_ctrl_imm_sel = _RAND_533[2:0];
  _RAND_534 = {1{`RANDOM}};
  uops_1_ctrl_op_fcn = _RAND_534[3:0];
  _RAND_535 = {1{`RANDOM}};
  uops_1_ctrl_fcn_dw = _RAND_535[0:0];
  _RAND_536 = {1{`RANDOM}};
  uops_1_ctrl_csr_cmd = _RAND_536[2:0];
  _RAND_537 = {1{`RANDOM}};
  uops_1_ctrl_is_load = _RAND_537[0:0];
  _RAND_538 = {1{`RANDOM}};
  uops_1_ctrl_is_sta = _RAND_538[0:0];
  _RAND_539 = {1{`RANDOM}};
  uops_1_ctrl_is_std = _RAND_539[0:0];
  _RAND_540 = {1{`RANDOM}};
  uops_1_ctrl_op3_sel = _RAND_540[1:0];
  _RAND_541 = {1{`RANDOM}};
  uops_1_iw_state = _RAND_541[1:0];
  _RAND_542 = {1{`RANDOM}};
  uops_1_iw_p1_poisoned = _RAND_542[0:0];
  _RAND_543 = {1{`RANDOM}};
  uops_1_iw_p2_poisoned = _RAND_543[0:0];
  _RAND_544 = {1{`RANDOM}};
  uops_1_is_br = _RAND_544[0:0];
  _RAND_545 = {1{`RANDOM}};
  uops_1_is_jalr = _RAND_545[0:0];
  _RAND_546 = {1{`RANDOM}};
  uops_1_is_jal = _RAND_546[0:0];
  _RAND_547 = {1{`RANDOM}};
  uops_1_is_sfb = _RAND_547[0:0];
  _RAND_548 = {1{`RANDOM}};
  uops_1_br_mask = _RAND_548[11:0];
  _RAND_549 = {1{`RANDOM}};
  uops_1_br_tag = _RAND_549[3:0];
  _RAND_550 = {1{`RANDOM}};
  uops_1_ftq_idx = _RAND_550[4:0];
  _RAND_551 = {1{`RANDOM}};
  uops_1_edge_inst = _RAND_551[0:0];
  _RAND_552 = {1{`RANDOM}};
  uops_1_pc_lob = _RAND_552[5:0];
  _RAND_553 = {1{`RANDOM}};
  uops_1_taken = _RAND_553[0:0];
  _RAND_554 = {1{`RANDOM}};
  uops_1_imm_packed = _RAND_554[19:0];
  _RAND_555 = {1{`RANDOM}};
  uops_1_csr_addr = _RAND_555[11:0];
  _RAND_556 = {1{`RANDOM}};
  uops_1_rob_idx = _RAND_556[5:0];
  _RAND_557 = {1{`RANDOM}};
  uops_1_ldq_idx = _RAND_557[4:0];
  _RAND_558 = {1{`RANDOM}};
  uops_1_stq_idx = _RAND_558[4:0];
  _RAND_559 = {1{`RANDOM}};
  uops_1_rxq_idx = _RAND_559[1:0];
  _RAND_560 = {1{`RANDOM}};
  uops_1_pdst = _RAND_560[6:0];
  _RAND_561 = {1{`RANDOM}};
  uops_1_prs1 = _RAND_561[6:0];
  _RAND_562 = {1{`RANDOM}};
  uops_1_prs2 = _RAND_562[6:0];
  _RAND_563 = {1{`RANDOM}};
  uops_1_prs3 = _RAND_563[6:0];
  _RAND_564 = {1{`RANDOM}};
  uops_1_ppred = _RAND_564[4:0];
  _RAND_565 = {1{`RANDOM}};
  uops_1_prs1_busy = _RAND_565[0:0];
  _RAND_566 = {1{`RANDOM}};
  uops_1_prs2_busy = _RAND_566[0:0];
  _RAND_567 = {1{`RANDOM}};
  uops_1_prs3_busy = _RAND_567[0:0];
  _RAND_568 = {1{`RANDOM}};
  uops_1_ppred_busy = _RAND_568[0:0];
  _RAND_569 = {1{`RANDOM}};
  uops_1_stale_pdst = _RAND_569[6:0];
  _RAND_570 = {1{`RANDOM}};
  uops_1_exception = _RAND_570[0:0];
  _RAND_571 = {2{`RANDOM}};
  uops_1_exc_cause = _RAND_571[63:0];
  _RAND_572 = {1{`RANDOM}};
  uops_1_bypassable = _RAND_572[0:0];
  _RAND_573 = {1{`RANDOM}};
  uops_1_mem_cmd = _RAND_573[4:0];
  _RAND_574 = {1{`RANDOM}};
  uops_1_mem_size = _RAND_574[1:0];
  _RAND_575 = {1{`RANDOM}};
  uops_1_mem_signed = _RAND_575[0:0];
  _RAND_576 = {1{`RANDOM}};
  uops_1_is_fence = _RAND_576[0:0];
  _RAND_577 = {1{`RANDOM}};
  uops_1_is_fencei = _RAND_577[0:0];
  _RAND_578 = {1{`RANDOM}};
  uops_1_is_amo = _RAND_578[0:0];
  _RAND_579 = {1{`RANDOM}};
  uops_1_uses_ldq = _RAND_579[0:0];
  _RAND_580 = {1{`RANDOM}};
  uops_1_uses_stq = _RAND_580[0:0];
  _RAND_581 = {1{`RANDOM}};
  uops_1_is_sys_pc2epc = _RAND_581[0:0];
  _RAND_582 = {1{`RANDOM}};
  uops_1_is_unique = _RAND_582[0:0];
  _RAND_583 = {1{`RANDOM}};
  uops_1_flush_on_commit = _RAND_583[0:0];
  _RAND_584 = {1{`RANDOM}};
  uops_1_ldst_is_rs1 = _RAND_584[0:0];
  _RAND_585 = {1{`RANDOM}};
  uops_1_ldst = _RAND_585[5:0];
  _RAND_586 = {1{`RANDOM}};
  uops_1_lrs1 = _RAND_586[5:0];
  _RAND_587 = {1{`RANDOM}};
  uops_1_lrs2 = _RAND_587[5:0];
  _RAND_588 = {1{`RANDOM}};
  uops_1_lrs3 = _RAND_588[5:0];
  _RAND_589 = {1{`RANDOM}};
  uops_1_ldst_val = _RAND_589[0:0];
  _RAND_590 = {1{`RANDOM}};
  uops_1_dst_rtype = _RAND_590[1:0];
  _RAND_591 = {1{`RANDOM}};
  uops_1_lrs1_rtype = _RAND_591[1:0];
  _RAND_592 = {1{`RANDOM}};
  uops_1_lrs2_rtype = _RAND_592[1:0];
  _RAND_593 = {1{`RANDOM}};
  uops_1_frs3_en = _RAND_593[0:0];
  _RAND_594 = {1{`RANDOM}};
  uops_1_fp_val = _RAND_594[0:0];
  _RAND_595 = {1{`RANDOM}};
  uops_1_fp_single = _RAND_595[0:0];
  _RAND_596 = {1{`RANDOM}};
  uops_1_xcpt_pf_if = _RAND_596[0:0];
  _RAND_597 = {1{`RANDOM}};
  uops_1_xcpt_ae_if = _RAND_597[0:0];
  _RAND_598 = {1{`RANDOM}};
  uops_1_xcpt_ma_if = _RAND_598[0:0];
  _RAND_599 = {1{`RANDOM}};
  uops_1_bp_debug_if = _RAND_599[0:0];
  _RAND_600 = {1{`RANDOM}};
  uops_1_bp_xcpt_if = _RAND_600[0:0];
  _RAND_601 = {1{`RANDOM}};
  uops_1_debug_fsrc = _RAND_601[1:0];
  _RAND_602 = {1{`RANDOM}};
  uops_1_debug_tsrc = _RAND_602[1:0];
  _RAND_603 = {1{`RANDOM}};
  uops_2_switch = _RAND_603[0:0];
  _RAND_604 = {1{`RANDOM}};
  uops_2_switch_off = _RAND_604[0:0];
  _RAND_605 = {1{`RANDOM}};
  uops_2_is_unicore = _RAND_605[0:0];
  _RAND_606 = {1{`RANDOM}};
  uops_2_shift = _RAND_606[2:0];
  _RAND_607 = {1{`RANDOM}};
  uops_2_lrs3_rtype = _RAND_607[1:0];
  _RAND_608 = {1{`RANDOM}};
  uops_2_rflag = _RAND_608[0:0];
  _RAND_609 = {1{`RANDOM}};
  uops_2_wflag = _RAND_609[0:0];
  _RAND_610 = {1{`RANDOM}};
  uops_2_prflag = _RAND_610[3:0];
  _RAND_611 = {1{`RANDOM}};
  uops_2_pwflag = _RAND_611[3:0];
  _RAND_612 = {1{`RANDOM}};
  uops_2_pflag_busy = _RAND_612[0:0];
  _RAND_613 = {1{`RANDOM}};
  uops_2_stale_pflag = _RAND_613[3:0];
  _RAND_614 = {1{`RANDOM}};
  uops_2_op1_sel = _RAND_614[3:0];
  _RAND_615 = {1{`RANDOM}};
  uops_2_op2_sel = _RAND_615[3:0];
  _RAND_616 = {1{`RANDOM}};
  uops_2_split_num = _RAND_616[5:0];
  _RAND_617 = {1{`RANDOM}};
  uops_2_self_index = _RAND_617[5:0];
  _RAND_618 = {1{`RANDOM}};
  uops_2_rob_inst_idx = _RAND_618[5:0];
  _RAND_619 = {1{`RANDOM}};
  uops_2_address_num = _RAND_619[5:0];
  _RAND_620 = {1{`RANDOM}};
  uops_2_uopc = _RAND_620[6:0];
  _RAND_621 = {1{`RANDOM}};
  uops_2_inst = _RAND_621[31:0];
  _RAND_622 = {1{`RANDOM}};
  uops_2_debug_inst = _RAND_622[31:0];
  _RAND_623 = {1{`RANDOM}};
  uops_2_is_rvc = _RAND_623[0:0];
  _RAND_624 = {2{`RANDOM}};
  uops_2_debug_pc = _RAND_624[39:0];
  _RAND_625 = {1{`RANDOM}};
  uops_2_iq_type = _RAND_625[2:0];
  _RAND_626 = {1{`RANDOM}};
  uops_2_fu_code = _RAND_626[9:0];
  _RAND_627 = {1{`RANDOM}};
  uops_2_ctrl_br_type = _RAND_627[3:0];
  _RAND_628 = {1{`RANDOM}};
  uops_2_ctrl_op1_sel = _RAND_628[1:0];
  _RAND_629 = {1{`RANDOM}};
  uops_2_ctrl_op2_sel = _RAND_629[2:0];
  _RAND_630 = {1{`RANDOM}};
  uops_2_ctrl_imm_sel = _RAND_630[2:0];
  _RAND_631 = {1{`RANDOM}};
  uops_2_ctrl_op_fcn = _RAND_631[3:0];
  _RAND_632 = {1{`RANDOM}};
  uops_2_ctrl_fcn_dw = _RAND_632[0:0];
  _RAND_633 = {1{`RANDOM}};
  uops_2_ctrl_csr_cmd = _RAND_633[2:0];
  _RAND_634 = {1{`RANDOM}};
  uops_2_ctrl_is_load = _RAND_634[0:0];
  _RAND_635 = {1{`RANDOM}};
  uops_2_ctrl_is_sta = _RAND_635[0:0];
  _RAND_636 = {1{`RANDOM}};
  uops_2_ctrl_is_std = _RAND_636[0:0];
  _RAND_637 = {1{`RANDOM}};
  uops_2_ctrl_op3_sel = _RAND_637[1:0];
  _RAND_638 = {1{`RANDOM}};
  uops_2_iw_state = _RAND_638[1:0];
  _RAND_639 = {1{`RANDOM}};
  uops_2_iw_p1_poisoned = _RAND_639[0:0];
  _RAND_640 = {1{`RANDOM}};
  uops_2_iw_p2_poisoned = _RAND_640[0:0];
  _RAND_641 = {1{`RANDOM}};
  uops_2_is_br = _RAND_641[0:0];
  _RAND_642 = {1{`RANDOM}};
  uops_2_is_jalr = _RAND_642[0:0];
  _RAND_643 = {1{`RANDOM}};
  uops_2_is_jal = _RAND_643[0:0];
  _RAND_644 = {1{`RANDOM}};
  uops_2_is_sfb = _RAND_644[0:0];
  _RAND_645 = {1{`RANDOM}};
  uops_2_br_mask = _RAND_645[11:0];
  _RAND_646 = {1{`RANDOM}};
  uops_2_br_tag = _RAND_646[3:0];
  _RAND_647 = {1{`RANDOM}};
  uops_2_ftq_idx = _RAND_647[4:0];
  _RAND_648 = {1{`RANDOM}};
  uops_2_edge_inst = _RAND_648[0:0];
  _RAND_649 = {1{`RANDOM}};
  uops_2_pc_lob = _RAND_649[5:0];
  _RAND_650 = {1{`RANDOM}};
  uops_2_taken = _RAND_650[0:0];
  _RAND_651 = {1{`RANDOM}};
  uops_2_imm_packed = _RAND_651[19:0];
  _RAND_652 = {1{`RANDOM}};
  uops_2_csr_addr = _RAND_652[11:0];
  _RAND_653 = {1{`RANDOM}};
  uops_2_rob_idx = _RAND_653[5:0];
  _RAND_654 = {1{`RANDOM}};
  uops_2_ldq_idx = _RAND_654[4:0];
  _RAND_655 = {1{`RANDOM}};
  uops_2_stq_idx = _RAND_655[4:0];
  _RAND_656 = {1{`RANDOM}};
  uops_2_rxq_idx = _RAND_656[1:0];
  _RAND_657 = {1{`RANDOM}};
  uops_2_pdst = _RAND_657[6:0];
  _RAND_658 = {1{`RANDOM}};
  uops_2_prs1 = _RAND_658[6:0];
  _RAND_659 = {1{`RANDOM}};
  uops_2_prs2 = _RAND_659[6:0];
  _RAND_660 = {1{`RANDOM}};
  uops_2_prs3 = _RAND_660[6:0];
  _RAND_661 = {1{`RANDOM}};
  uops_2_ppred = _RAND_661[4:0];
  _RAND_662 = {1{`RANDOM}};
  uops_2_prs1_busy = _RAND_662[0:0];
  _RAND_663 = {1{`RANDOM}};
  uops_2_prs2_busy = _RAND_663[0:0];
  _RAND_664 = {1{`RANDOM}};
  uops_2_prs3_busy = _RAND_664[0:0];
  _RAND_665 = {1{`RANDOM}};
  uops_2_ppred_busy = _RAND_665[0:0];
  _RAND_666 = {1{`RANDOM}};
  uops_2_stale_pdst = _RAND_666[6:0];
  _RAND_667 = {1{`RANDOM}};
  uops_2_exception = _RAND_667[0:0];
  _RAND_668 = {2{`RANDOM}};
  uops_2_exc_cause = _RAND_668[63:0];
  _RAND_669 = {1{`RANDOM}};
  uops_2_bypassable = _RAND_669[0:0];
  _RAND_670 = {1{`RANDOM}};
  uops_2_mem_cmd = _RAND_670[4:0];
  _RAND_671 = {1{`RANDOM}};
  uops_2_mem_size = _RAND_671[1:0];
  _RAND_672 = {1{`RANDOM}};
  uops_2_mem_signed = _RAND_672[0:0];
  _RAND_673 = {1{`RANDOM}};
  uops_2_is_fence = _RAND_673[0:0];
  _RAND_674 = {1{`RANDOM}};
  uops_2_is_fencei = _RAND_674[0:0];
  _RAND_675 = {1{`RANDOM}};
  uops_2_is_amo = _RAND_675[0:0];
  _RAND_676 = {1{`RANDOM}};
  uops_2_uses_ldq = _RAND_676[0:0];
  _RAND_677 = {1{`RANDOM}};
  uops_2_uses_stq = _RAND_677[0:0];
  _RAND_678 = {1{`RANDOM}};
  uops_2_is_sys_pc2epc = _RAND_678[0:0];
  _RAND_679 = {1{`RANDOM}};
  uops_2_is_unique = _RAND_679[0:0];
  _RAND_680 = {1{`RANDOM}};
  uops_2_flush_on_commit = _RAND_680[0:0];
  _RAND_681 = {1{`RANDOM}};
  uops_2_ldst_is_rs1 = _RAND_681[0:0];
  _RAND_682 = {1{`RANDOM}};
  uops_2_ldst = _RAND_682[5:0];
  _RAND_683 = {1{`RANDOM}};
  uops_2_lrs1 = _RAND_683[5:0];
  _RAND_684 = {1{`RANDOM}};
  uops_2_lrs2 = _RAND_684[5:0];
  _RAND_685 = {1{`RANDOM}};
  uops_2_lrs3 = _RAND_685[5:0];
  _RAND_686 = {1{`RANDOM}};
  uops_2_ldst_val = _RAND_686[0:0];
  _RAND_687 = {1{`RANDOM}};
  uops_2_dst_rtype = _RAND_687[1:0];
  _RAND_688 = {1{`RANDOM}};
  uops_2_lrs1_rtype = _RAND_688[1:0];
  _RAND_689 = {1{`RANDOM}};
  uops_2_lrs2_rtype = _RAND_689[1:0];
  _RAND_690 = {1{`RANDOM}};
  uops_2_frs3_en = _RAND_690[0:0];
  _RAND_691 = {1{`RANDOM}};
  uops_2_fp_val = _RAND_691[0:0];
  _RAND_692 = {1{`RANDOM}};
  uops_2_fp_single = _RAND_692[0:0];
  _RAND_693 = {1{`RANDOM}};
  uops_2_xcpt_pf_if = _RAND_693[0:0];
  _RAND_694 = {1{`RANDOM}};
  uops_2_xcpt_ae_if = _RAND_694[0:0];
  _RAND_695 = {1{`RANDOM}};
  uops_2_xcpt_ma_if = _RAND_695[0:0];
  _RAND_696 = {1{`RANDOM}};
  uops_2_bp_debug_if = _RAND_696[0:0];
  _RAND_697 = {1{`RANDOM}};
  uops_2_bp_xcpt_if = _RAND_697[0:0];
  _RAND_698 = {1{`RANDOM}};
  uops_2_debug_fsrc = _RAND_698[1:0];
  _RAND_699 = {1{`RANDOM}};
  uops_2_debug_tsrc = _RAND_699[1:0];
  _RAND_700 = {1{`RANDOM}};
  uops_3_switch = _RAND_700[0:0];
  _RAND_701 = {1{`RANDOM}};
  uops_3_switch_off = _RAND_701[0:0];
  _RAND_702 = {1{`RANDOM}};
  uops_3_is_unicore = _RAND_702[0:0];
  _RAND_703 = {1{`RANDOM}};
  uops_3_shift = _RAND_703[2:0];
  _RAND_704 = {1{`RANDOM}};
  uops_3_lrs3_rtype = _RAND_704[1:0];
  _RAND_705 = {1{`RANDOM}};
  uops_3_rflag = _RAND_705[0:0];
  _RAND_706 = {1{`RANDOM}};
  uops_3_wflag = _RAND_706[0:0];
  _RAND_707 = {1{`RANDOM}};
  uops_3_prflag = _RAND_707[3:0];
  _RAND_708 = {1{`RANDOM}};
  uops_3_pwflag = _RAND_708[3:0];
  _RAND_709 = {1{`RANDOM}};
  uops_3_pflag_busy = _RAND_709[0:0];
  _RAND_710 = {1{`RANDOM}};
  uops_3_stale_pflag = _RAND_710[3:0];
  _RAND_711 = {1{`RANDOM}};
  uops_3_op1_sel = _RAND_711[3:0];
  _RAND_712 = {1{`RANDOM}};
  uops_3_op2_sel = _RAND_712[3:0];
  _RAND_713 = {1{`RANDOM}};
  uops_3_split_num = _RAND_713[5:0];
  _RAND_714 = {1{`RANDOM}};
  uops_3_self_index = _RAND_714[5:0];
  _RAND_715 = {1{`RANDOM}};
  uops_3_rob_inst_idx = _RAND_715[5:0];
  _RAND_716 = {1{`RANDOM}};
  uops_3_address_num = _RAND_716[5:0];
  _RAND_717 = {1{`RANDOM}};
  uops_3_uopc = _RAND_717[6:0];
  _RAND_718 = {1{`RANDOM}};
  uops_3_inst = _RAND_718[31:0];
  _RAND_719 = {1{`RANDOM}};
  uops_3_debug_inst = _RAND_719[31:0];
  _RAND_720 = {1{`RANDOM}};
  uops_3_is_rvc = _RAND_720[0:0];
  _RAND_721 = {2{`RANDOM}};
  uops_3_debug_pc = _RAND_721[39:0];
  _RAND_722 = {1{`RANDOM}};
  uops_3_iq_type = _RAND_722[2:0];
  _RAND_723 = {1{`RANDOM}};
  uops_3_fu_code = _RAND_723[9:0];
  _RAND_724 = {1{`RANDOM}};
  uops_3_ctrl_br_type = _RAND_724[3:0];
  _RAND_725 = {1{`RANDOM}};
  uops_3_ctrl_op1_sel = _RAND_725[1:0];
  _RAND_726 = {1{`RANDOM}};
  uops_3_ctrl_op2_sel = _RAND_726[2:0];
  _RAND_727 = {1{`RANDOM}};
  uops_3_ctrl_imm_sel = _RAND_727[2:0];
  _RAND_728 = {1{`RANDOM}};
  uops_3_ctrl_op_fcn = _RAND_728[3:0];
  _RAND_729 = {1{`RANDOM}};
  uops_3_ctrl_fcn_dw = _RAND_729[0:0];
  _RAND_730 = {1{`RANDOM}};
  uops_3_ctrl_csr_cmd = _RAND_730[2:0];
  _RAND_731 = {1{`RANDOM}};
  uops_3_ctrl_is_load = _RAND_731[0:0];
  _RAND_732 = {1{`RANDOM}};
  uops_3_ctrl_is_sta = _RAND_732[0:0];
  _RAND_733 = {1{`RANDOM}};
  uops_3_ctrl_is_std = _RAND_733[0:0];
  _RAND_734 = {1{`RANDOM}};
  uops_3_ctrl_op3_sel = _RAND_734[1:0];
  _RAND_735 = {1{`RANDOM}};
  uops_3_iw_state = _RAND_735[1:0];
  _RAND_736 = {1{`RANDOM}};
  uops_3_iw_p1_poisoned = _RAND_736[0:0];
  _RAND_737 = {1{`RANDOM}};
  uops_3_iw_p2_poisoned = _RAND_737[0:0];
  _RAND_738 = {1{`RANDOM}};
  uops_3_is_br = _RAND_738[0:0];
  _RAND_739 = {1{`RANDOM}};
  uops_3_is_jalr = _RAND_739[0:0];
  _RAND_740 = {1{`RANDOM}};
  uops_3_is_jal = _RAND_740[0:0];
  _RAND_741 = {1{`RANDOM}};
  uops_3_is_sfb = _RAND_741[0:0];
  _RAND_742 = {1{`RANDOM}};
  uops_3_br_mask = _RAND_742[11:0];
  _RAND_743 = {1{`RANDOM}};
  uops_3_br_tag = _RAND_743[3:0];
  _RAND_744 = {1{`RANDOM}};
  uops_3_ftq_idx = _RAND_744[4:0];
  _RAND_745 = {1{`RANDOM}};
  uops_3_edge_inst = _RAND_745[0:0];
  _RAND_746 = {1{`RANDOM}};
  uops_3_pc_lob = _RAND_746[5:0];
  _RAND_747 = {1{`RANDOM}};
  uops_3_taken = _RAND_747[0:0];
  _RAND_748 = {1{`RANDOM}};
  uops_3_imm_packed = _RAND_748[19:0];
  _RAND_749 = {1{`RANDOM}};
  uops_3_csr_addr = _RAND_749[11:0];
  _RAND_750 = {1{`RANDOM}};
  uops_3_rob_idx = _RAND_750[5:0];
  _RAND_751 = {1{`RANDOM}};
  uops_3_ldq_idx = _RAND_751[4:0];
  _RAND_752 = {1{`RANDOM}};
  uops_3_stq_idx = _RAND_752[4:0];
  _RAND_753 = {1{`RANDOM}};
  uops_3_rxq_idx = _RAND_753[1:0];
  _RAND_754 = {1{`RANDOM}};
  uops_3_pdst = _RAND_754[6:0];
  _RAND_755 = {1{`RANDOM}};
  uops_3_prs1 = _RAND_755[6:0];
  _RAND_756 = {1{`RANDOM}};
  uops_3_prs2 = _RAND_756[6:0];
  _RAND_757 = {1{`RANDOM}};
  uops_3_prs3 = _RAND_757[6:0];
  _RAND_758 = {1{`RANDOM}};
  uops_3_ppred = _RAND_758[4:0];
  _RAND_759 = {1{`RANDOM}};
  uops_3_prs1_busy = _RAND_759[0:0];
  _RAND_760 = {1{`RANDOM}};
  uops_3_prs2_busy = _RAND_760[0:0];
  _RAND_761 = {1{`RANDOM}};
  uops_3_prs3_busy = _RAND_761[0:0];
  _RAND_762 = {1{`RANDOM}};
  uops_3_ppred_busy = _RAND_762[0:0];
  _RAND_763 = {1{`RANDOM}};
  uops_3_stale_pdst = _RAND_763[6:0];
  _RAND_764 = {1{`RANDOM}};
  uops_3_exception = _RAND_764[0:0];
  _RAND_765 = {2{`RANDOM}};
  uops_3_exc_cause = _RAND_765[63:0];
  _RAND_766 = {1{`RANDOM}};
  uops_3_bypassable = _RAND_766[0:0];
  _RAND_767 = {1{`RANDOM}};
  uops_3_mem_cmd = _RAND_767[4:0];
  _RAND_768 = {1{`RANDOM}};
  uops_3_mem_size = _RAND_768[1:0];
  _RAND_769 = {1{`RANDOM}};
  uops_3_mem_signed = _RAND_769[0:0];
  _RAND_770 = {1{`RANDOM}};
  uops_3_is_fence = _RAND_770[0:0];
  _RAND_771 = {1{`RANDOM}};
  uops_3_is_fencei = _RAND_771[0:0];
  _RAND_772 = {1{`RANDOM}};
  uops_3_is_amo = _RAND_772[0:0];
  _RAND_773 = {1{`RANDOM}};
  uops_3_uses_ldq = _RAND_773[0:0];
  _RAND_774 = {1{`RANDOM}};
  uops_3_uses_stq = _RAND_774[0:0];
  _RAND_775 = {1{`RANDOM}};
  uops_3_is_sys_pc2epc = _RAND_775[0:0];
  _RAND_776 = {1{`RANDOM}};
  uops_3_is_unique = _RAND_776[0:0];
  _RAND_777 = {1{`RANDOM}};
  uops_3_flush_on_commit = _RAND_777[0:0];
  _RAND_778 = {1{`RANDOM}};
  uops_3_ldst_is_rs1 = _RAND_778[0:0];
  _RAND_779 = {1{`RANDOM}};
  uops_3_ldst = _RAND_779[5:0];
  _RAND_780 = {1{`RANDOM}};
  uops_3_lrs1 = _RAND_780[5:0];
  _RAND_781 = {1{`RANDOM}};
  uops_3_lrs2 = _RAND_781[5:0];
  _RAND_782 = {1{`RANDOM}};
  uops_3_lrs3 = _RAND_782[5:0];
  _RAND_783 = {1{`RANDOM}};
  uops_3_ldst_val = _RAND_783[0:0];
  _RAND_784 = {1{`RANDOM}};
  uops_3_dst_rtype = _RAND_784[1:0];
  _RAND_785 = {1{`RANDOM}};
  uops_3_lrs1_rtype = _RAND_785[1:0];
  _RAND_786 = {1{`RANDOM}};
  uops_3_lrs2_rtype = _RAND_786[1:0];
  _RAND_787 = {1{`RANDOM}};
  uops_3_frs3_en = _RAND_787[0:0];
  _RAND_788 = {1{`RANDOM}};
  uops_3_fp_val = _RAND_788[0:0];
  _RAND_789 = {1{`RANDOM}};
  uops_3_fp_single = _RAND_789[0:0];
  _RAND_790 = {1{`RANDOM}};
  uops_3_xcpt_pf_if = _RAND_790[0:0];
  _RAND_791 = {1{`RANDOM}};
  uops_3_xcpt_ae_if = _RAND_791[0:0];
  _RAND_792 = {1{`RANDOM}};
  uops_3_xcpt_ma_if = _RAND_792[0:0];
  _RAND_793 = {1{`RANDOM}};
  uops_3_bp_debug_if = _RAND_793[0:0];
  _RAND_794 = {1{`RANDOM}};
  uops_3_bp_xcpt_if = _RAND_794[0:0];
  _RAND_795 = {1{`RANDOM}};
  uops_3_debug_fsrc = _RAND_795[1:0];
  _RAND_796 = {1{`RANDOM}};
  uops_3_debug_tsrc = _RAND_796[1:0];
  _RAND_797 = {1{`RANDOM}};
  uops_4_switch = _RAND_797[0:0];
  _RAND_798 = {1{`RANDOM}};
  uops_4_switch_off = _RAND_798[0:0];
  _RAND_799 = {1{`RANDOM}};
  uops_4_is_unicore = _RAND_799[0:0];
  _RAND_800 = {1{`RANDOM}};
  uops_4_shift = _RAND_800[2:0];
  _RAND_801 = {1{`RANDOM}};
  uops_4_lrs3_rtype = _RAND_801[1:0];
  _RAND_802 = {1{`RANDOM}};
  uops_4_rflag = _RAND_802[0:0];
  _RAND_803 = {1{`RANDOM}};
  uops_4_wflag = _RAND_803[0:0];
  _RAND_804 = {1{`RANDOM}};
  uops_4_prflag = _RAND_804[3:0];
  _RAND_805 = {1{`RANDOM}};
  uops_4_pwflag = _RAND_805[3:0];
  _RAND_806 = {1{`RANDOM}};
  uops_4_pflag_busy = _RAND_806[0:0];
  _RAND_807 = {1{`RANDOM}};
  uops_4_stale_pflag = _RAND_807[3:0];
  _RAND_808 = {1{`RANDOM}};
  uops_4_op1_sel = _RAND_808[3:0];
  _RAND_809 = {1{`RANDOM}};
  uops_4_op2_sel = _RAND_809[3:0];
  _RAND_810 = {1{`RANDOM}};
  uops_4_split_num = _RAND_810[5:0];
  _RAND_811 = {1{`RANDOM}};
  uops_4_self_index = _RAND_811[5:0];
  _RAND_812 = {1{`RANDOM}};
  uops_4_rob_inst_idx = _RAND_812[5:0];
  _RAND_813 = {1{`RANDOM}};
  uops_4_address_num = _RAND_813[5:0];
  _RAND_814 = {1{`RANDOM}};
  uops_4_uopc = _RAND_814[6:0];
  _RAND_815 = {1{`RANDOM}};
  uops_4_inst = _RAND_815[31:0];
  _RAND_816 = {1{`RANDOM}};
  uops_4_debug_inst = _RAND_816[31:0];
  _RAND_817 = {1{`RANDOM}};
  uops_4_is_rvc = _RAND_817[0:0];
  _RAND_818 = {2{`RANDOM}};
  uops_4_debug_pc = _RAND_818[39:0];
  _RAND_819 = {1{`RANDOM}};
  uops_4_iq_type = _RAND_819[2:0];
  _RAND_820 = {1{`RANDOM}};
  uops_4_fu_code = _RAND_820[9:0];
  _RAND_821 = {1{`RANDOM}};
  uops_4_ctrl_br_type = _RAND_821[3:0];
  _RAND_822 = {1{`RANDOM}};
  uops_4_ctrl_op1_sel = _RAND_822[1:0];
  _RAND_823 = {1{`RANDOM}};
  uops_4_ctrl_op2_sel = _RAND_823[2:0];
  _RAND_824 = {1{`RANDOM}};
  uops_4_ctrl_imm_sel = _RAND_824[2:0];
  _RAND_825 = {1{`RANDOM}};
  uops_4_ctrl_op_fcn = _RAND_825[3:0];
  _RAND_826 = {1{`RANDOM}};
  uops_4_ctrl_fcn_dw = _RAND_826[0:0];
  _RAND_827 = {1{`RANDOM}};
  uops_4_ctrl_csr_cmd = _RAND_827[2:0];
  _RAND_828 = {1{`RANDOM}};
  uops_4_ctrl_is_load = _RAND_828[0:0];
  _RAND_829 = {1{`RANDOM}};
  uops_4_ctrl_is_sta = _RAND_829[0:0];
  _RAND_830 = {1{`RANDOM}};
  uops_4_ctrl_is_std = _RAND_830[0:0];
  _RAND_831 = {1{`RANDOM}};
  uops_4_ctrl_op3_sel = _RAND_831[1:0];
  _RAND_832 = {1{`RANDOM}};
  uops_4_iw_state = _RAND_832[1:0];
  _RAND_833 = {1{`RANDOM}};
  uops_4_iw_p1_poisoned = _RAND_833[0:0];
  _RAND_834 = {1{`RANDOM}};
  uops_4_iw_p2_poisoned = _RAND_834[0:0];
  _RAND_835 = {1{`RANDOM}};
  uops_4_is_br = _RAND_835[0:0];
  _RAND_836 = {1{`RANDOM}};
  uops_4_is_jalr = _RAND_836[0:0];
  _RAND_837 = {1{`RANDOM}};
  uops_4_is_jal = _RAND_837[0:0];
  _RAND_838 = {1{`RANDOM}};
  uops_4_is_sfb = _RAND_838[0:0];
  _RAND_839 = {1{`RANDOM}};
  uops_4_br_mask = _RAND_839[11:0];
  _RAND_840 = {1{`RANDOM}};
  uops_4_br_tag = _RAND_840[3:0];
  _RAND_841 = {1{`RANDOM}};
  uops_4_ftq_idx = _RAND_841[4:0];
  _RAND_842 = {1{`RANDOM}};
  uops_4_edge_inst = _RAND_842[0:0];
  _RAND_843 = {1{`RANDOM}};
  uops_4_pc_lob = _RAND_843[5:0];
  _RAND_844 = {1{`RANDOM}};
  uops_4_taken = _RAND_844[0:0];
  _RAND_845 = {1{`RANDOM}};
  uops_4_imm_packed = _RAND_845[19:0];
  _RAND_846 = {1{`RANDOM}};
  uops_4_csr_addr = _RAND_846[11:0];
  _RAND_847 = {1{`RANDOM}};
  uops_4_rob_idx = _RAND_847[5:0];
  _RAND_848 = {1{`RANDOM}};
  uops_4_ldq_idx = _RAND_848[4:0];
  _RAND_849 = {1{`RANDOM}};
  uops_4_stq_idx = _RAND_849[4:0];
  _RAND_850 = {1{`RANDOM}};
  uops_4_rxq_idx = _RAND_850[1:0];
  _RAND_851 = {1{`RANDOM}};
  uops_4_pdst = _RAND_851[6:0];
  _RAND_852 = {1{`RANDOM}};
  uops_4_prs1 = _RAND_852[6:0];
  _RAND_853 = {1{`RANDOM}};
  uops_4_prs2 = _RAND_853[6:0];
  _RAND_854 = {1{`RANDOM}};
  uops_4_prs3 = _RAND_854[6:0];
  _RAND_855 = {1{`RANDOM}};
  uops_4_ppred = _RAND_855[4:0];
  _RAND_856 = {1{`RANDOM}};
  uops_4_prs1_busy = _RAND_856[0:0];
  _RAND_857 = {1{`RANDOM}};
  uops_4_prs2_busy = _RAND_857[0:0];
  _RAND_858 = {1{`RANDOM}};
  uops_4_prs3_busy = _RAND_858[0:0];
  _RAND_859 = {1{`RANDOM}};
  uops_4_ppred_busy = _RAND_859[0:0];
  _RAND_860 = {1{`RANDOM}};
  uops_4_stale_pdst = _RAND_860[6:0];
  _RAND_861 = {1{`RANDOM}};
  uops_4_exception = _RAND_861[0:0];
  _RAND_862 = {2{`RANDOM}};
  uops_4_exc_cause = _RAND_862[63:0];
  _RAND_863 = {1{`RANDOM}};
  uops_4_bypassable = _RAND_863[0:0];
  _RAND_864 = {1{`RANDOM}};
  uops_4_mem_cmd = _RAND_864[4:0];
  _RAND_865 = {1{`RANDOM}};
  uops_4_mem_size = _RAND_865[1:0];
  _RAND_866 = {1{`RANDOM}};
  uops_4_mem_signed = _RAND_866[0:0];
  _RAND_867 = {1{`RANDOM}};
  uops_4_is_fence = _RAND_867[0:0];
  _RAND_868 = {1{`RANDOM}};
  uops_4_is_fencei = _RAND_868[0:0];
  _RAND_869 = {1{`RANDOM}};
  uops_4_is_amo = _RAND_869[0:0];
  _RAND_870 = {1{`RANDOM}};
  uops_4_uses_ldq = _RAND_870[0:0];
  _RAND_871 = {1{`RANDOM}};
  uops_4_uses_stq = _RAND_871[0:0];
  _RAND_872 = {1{`RANDOM}};
  uops_4_is_sys_pc2epc = _RAND_872[0:0];
  _RAND_873 = {1{`RANDOM}};
  uops_4_is_unique = _RAND_873[0:0];
  _RAND_874 = {1{`RANDOM}};
  uops_4_flush_on_commit = _RAND_874[0:0];
  _RAND_875 = {1{`RANDOM}};
  uops_4_ldst_is_rs1 = _RAND_875[0:0];
  _RAND_876 = {1{`RANDOM}};
  uops_4_ldst = _RAND_876[5:0];
  _RAND_877 = {1{`RANDOM}};
  uops_4_lrs1 = _RAND_877[5:0];
  _RAND_878 = {1{`RANDOM}};
  uops_4_lrs2 = _RAND_878[5:0];
  _RAND_879 = {1{`RANDOM}};
  uops_4_lrs3 = _RAND_879[5:0];
  _RAND_880 = {1{`RANDOM}};
  uops_4_ldst_val = _RAND_880[0:0];
  _RAND_881 = {1{`RANDOM}};
  uops_4_dst_rtype = _RAND_881[1:0];
  _RAND_882 = {1{`RANDOM}};
  uops_4_lrs1_rtype = _RAND_882[1:0];
  _RAND_883 = {1{`RANDOM}};
  uops_4_lrs2_rtype = _RAND_883[1:0];
  _RAND_884 = {1{`RANDOM}};
  uops_4_frs3_en = _RAND_884[0:0];
  _RAND_885 = {1{`RANDOM}};
  uops_4_fp_val = _RAND_885[0:0];
  _RAND_886 = {1{`RANDOM}};
  uops_4_fp_single = _RAND_886[0:0];
  _RAND_887 = {1{`RANDOM}};
  uops_4_xcpt_pf_if = _RAND_887[0:0];
  _RAND_888 = {1{`RANDOM}};
  uops_4_xcpt_ae_if = _RAND_888[0:0];
  _RAND_889 = {1{`RANDOM}};
  uops_4_xcpt_ma_if = _RAND_889[0:0];
  _RAND_890 = {1{`RANDOM}};
  uops_4_bp_debug_if = _RAND_890[0:0];
  _RAND_891 = {1{`RANDOM}};
  uops_4_bp_xcpt_if = _RAND_891[0:0];
  _RAND_892 = {1{`RANDOM}};
  uops_4_debug_fsrc = _RAND_892[1:0];
  _RAND_893 = {1{`RANDOM}};
  uops_4_debug_tsrc = _RAND_893[1:0];
  _RAND_894 = {1{`RANDOM}};
  uops_5_switch = _RAND_894[0:0];
  _RAND_895 = {1{`RANDOM}};
  uops_5_switch_off = _RAND_895[0:0];
  _RAND_896 = {1{`RANDOM}};
  uops_5_is_unicore = _RAND_896[0:0];
  _RAND_897 = {1{`RANDOM}};
  uops_5_shift = _RAND_897[2:0];
  _RAND_898 = {1{`RANDOM}};
  uops_5_lrs3_rtype = _RAND_898[1:0];
  _RAND_899 = {1{`RANDOM}};
  uops_5_rflag = _RAND_899[0:0];
  _RAND_900 = {1{`RANDOM}};
  uops_5_wflag = _RAND_900[0:0];
  _RAND_901 = {1{`RANDOM}};
  uops_5_prflag = _RAND_901[3:0];
  _RAND_902 = {1{`RANDOM}};
  uops_5_pwflag = _RAND_902[3:0];
  _RAND_903 = {1{`RANDOM}};
  uops_5_pflag_busy = _RAND_903[0:0];
  _RAND_904 = {1{`RANDOM}};
  uops_5_stale_pflag = _RAND_904[3:0];
  _RAND_905 = {1{`RANDOM}};
  uops_5_op1_sel = _RAND_905[3:0];
  _RAND_906 = {1{`RANDOM}};
  uops_5_op2_sel = _RAND_906[3:0];
  _RAND_907 = {1{`RANDOM}};
  uops_5_split_num = _RAND_907[5:0];
  _RAND_908 = {1{`RANDOM}};
  uops_5_self_index = _RAND_908[5:0];
  _RAND_909 = {1{`RANDOM}};
  uops_5_rob_inst_idx = _RAND_909[5:0];
  _RAND_910 = {1{`RANDOM}};
  uops_5_address_num = _RAND_910[5:0];
  _RAND_911 = {1{`RANDOM}};
  uops_5_uopc = _RAND_911[6:0];
  _RAND_912 = {1{`RANDOM}};
  uops_5_inst = _RAND_912[31:0];
  _RAND_913 = {1{`RANDOM}};
  uops_5_debug_inst = _RAND_913[31:0];
  _RAND_914 = {1{`RANDOM}};
  uops_5_is_rvc = _RAND_914[0:0];
  _RAND_915 = {2{`RANDOM}};
  uops_5_debug_pc = _RAND_915[39:0];
  _RAND_916 = {1{`RANDOM}};
  uops_5_iq_type = _RAND_916[2:0];
  _RAND_917 = {1{`RANDOM}};
  uops_5_fu_code = _RAND_917[9:0];
  _RAND_918 = {1{`RANDOM}};
  uops_5_ctrl_br_type = _RAND_918[3:0];
  _RAND_919 = {1{`RANDOM}};
  uops_5_ctrl_op1_sel = _RAND_919[1:0];
  _RAND_920 = {1{`RANDOM}};
  uops_5_ctrl_op2_sel = _RAND_920[2:0];
  _RAND_921 = {1{`RANDOM}};
  uops_5_ctrl_imm_sel = _RAND_921[2:0];
  _RAND_922 = {1{`RANDOM}};
  uops_5_ctrl_op_fcn = _RAND_922[3:0];
  _RAND_923 = {1{`RANDOM}};
  uops_5_ctrl_fcn_dw = _RAND_923[0:0];
  _RAND_924 = {1{`RANDOM}};
  uops_5_ctrl_csr_cmd = _RAND_924[2:0];
  _RAND_925 = {1{`RANDOM}};
  uops_5_ctrl_is_load = _RAND_925[0:0];
  _RAND_926 = {1{`RANDOM}};
  uops_5_ctrl_is_sta = _RAND_926[0:0];
  _RAND_927 = {1{`RANDOM}};
  uops_5_ctrl_is_std = _RAND_927[0:0];
  _RAND_928 = {1{`RANDOM}};
  uops_5_ctrl_op3_sel = _RAND_928[1:0];
  _RAND_929 = {1{`RANDOM}};
  uops_5_iw_state = _RAND_929[1:0];
  _RAND_930 = {1{`RANDOM}};
  uops_5_iw_p1_poisoned = _RAND_930[0:0];
  _RAND_931 = {1{`RANDOM}};
  uops_5_iw_p2_poisoned = _RAND_931[0:0];
  _RAND_932 = {1{`RANDOM}};
  uops_5_is_br = _RAND_932[0:0];
  _RAND_933 = {1{`RANDOM}};
  uops_5_is_jalr = _RAND_933[0:0];
  _RAND_934 = {1{`RANDOM}};
  uops_5_is_jal = _RAND_934[0:0];
  _RAND_935 = {1{`RANDOM}};
  uops_5_is_sfb = _RAND_935[0:0];
  _RAND_936 = {1{`RANDOM}};
  uops_5_br_mask = _RAND_936[11:0];
  _RAND_937 = {1{`RANDOM}};
  uops_5_br_tag = _RAND_937[3:0];
  _RAND_938 = {1{`RANDOM}};
  uops_5_ftq_idx = _RAND_938[4:0];
  _RAND_939 = {1{`RANDOM}};
  uops_5_edge_inst = _RAND_939[0:0];
  _RAND_940 = {1{`RANDOM}};
  uops_5_pc_lob = _RAND_940[5:0];
  _RAND_941 = {1{`RANDOM}};
  uops_5_taken = _RAND_941[0:0];
  _RAND_942 = {1{`RANDOM}};
  uops_5_imm_packed = _RAND_942[19:0];
  _RAND_943 = {1{`RANDOM}};
  uops_5_csr_addr = _RAND_943[11:0];
  _RAND_944 = {1{`RANDOM}};
  uops_5_rob_idx = _RAND_944[5:0];
  _RAND_945 = {1{`RANDOM}};
  uops_5_ldq_idx = _RAND_945[4:0];
  _RAND_946 = {1{`RANDOM}};
  uops_5_stq_idx = _RAND_946[4:0];
  _RAND_947 = {1{`RANDOM}};
  uops_5_rxq_idx = _RAND_947[1:0];
  _RAND_948 = {1{`RANDOM}};
  uops_5_pdst = _RAND_948[6:0];
  _RAND_949 = {1{`RANDOM}};
  uops_5_prs1 = _RAND_949[6:0];
  _RAND_950 = {1{`RANDOM}};
  uops_5_prs2 = _RAND_950[6:0];
  _RAND_951 = {1{`RANDOM}};
  uops_5_prs3 = _RAND_951[6:0];
  _RAND_952 = {1{`RANDOM}};
  uops_5_ppred = _RAND_952[4:0];
  _RAND_953 = {1{`RANDOM}};
  uops_5_prs1_busy = _RAND_953[0:0];
  _RAND_954 = {1{`RANDOM}};
  uops_5_prs2_busy = _RAND_954[0:0];
  _RAND_955 = {1{`RANDOM}};
  uops_5_prs3_busy = _RAND_955[0:0];
  _RAND_956 = {1{`RANDOM}};
  uops_5_ppred_busy = _RAND_956[0:0];
  _RAND_957 = {1{`RANDOM}};
  uops_5_stale_pdst = _RAND_957[6:0];
  _RAND_958 = {1{`RANDOM}};
  uops_5_exception = _RAND_958[0:0];
  _RAND_959 = {2{`RANDOM}};
  uops_5_exc_cause = _RAND_959[63:0];
  _RAND_960 = {1{`RANDOM}};
  uops_5_bypassable = _RAND_960[0:0];
  _RAND_961 = {1{`RANDOM}};
  uops_5_mem_cmd = _RAND_961[4:0];
  _RAND_962 = {1{`RANDOM}};
  uops_5_mem_size = _RAND_962[1:0];
  _RAND_963 = {1{`RANDOM}};
  uops_5_mem_signed = _RAND_963[0:0];
  _RAND_964 = {1{`RANDOM}};
  uops_5_is_fence = _RAND_964[0:0];
  _RAND_965 = {1{`RANDOM}};
  uops_5_is_fencei = _RAND_965[0:0];
  _RAND_966 = {1{`RANDOM}};
  uops_5_is_amo = _RAND_966[0:0];
  _RAND_967 = {1{`RANDOM}};
  uops_5_uses_ldq = _RAND_967[0:0];
  _RAND_968 = {1{`RANDOM}};
  uops_5_uses_stq = _RAND_968[0:0];
  _RAND_969 = {1{`RANDOM}};
  uops_5_is_sys_pc2epc = _RAND_969[0:0];
  _RAND_970 = {1{`RANDOM}};
  uops_5_is_unique = _RAND_970[0:0];
  _RAND_971 = {1{`RANDOM}};
  uops_5_flush_on_commit = _RAND_971[0:0];
  _RAND_972 = {1{`RANDOM}};
  uops_5_ldst_is_rs1 = _RAND_972[0:0];
  _RAND_973 = {1{`RANDOM}};
  uops_5_ldst = _RAND_973[5:0];
  _RAND_974 = {1{`RANDOM}};
  uops_5_lrs1 = _RAND_974[5:0];
  _RAND_975 = {1{`RANDOM}};
  uops_5_lrs2 = _RAND_975[5:0];
  _RAND_976 = {1{`RANDOM}};
  uops_5_lrs3 = _RAND_976[5:0];
  _RAND_977 = {1{`RANDOM}};
  uops_5_ldst_val = _RAND_977[0:0];
  _RAND_978 = {1{`RANDOM}};
  uops_5_dst_rtype = _RAND_978[1:0];
  _RAND_979 = {1{`RANDOM}};
  uops_5_lrs1_rtype = _RAND_979[1:0];
  _RAND_980 = {1{`RANDOM}};
  uops_5_lrs2_rtype = _RAND_980[1:0];
  _RAND_981 = {1{`RANDOM}};
  uops_5_frs3_en = _RAND_981[0:0];
  _RAND_982 = {1{`RANDOM}};
  uops_5_fp_val = _RAND_982[0:0];
  _RAND_983 = {1{`RANDOM}};
  uops_5_fp_single = _RAND_983[0:0];
  _RAND_984 = {1{`RANDOM}};
  uops_5_xcpt_pf_if = _RAND_984[0:0];
  _RAND_985 = {1{`RANDOM}};
  uops_5_xcpt_ae_if = _RAND_985[0:0];
  _RAND_986 = {1{`RANDOM}};
  uops_5_xcpt_ma_if = _RAND_986[0:0];
  _RAND_987 = {1{`RANDOM}};
  uops_5_bp_debug_if = _RAND_987[0:0];
  _RAND_988 = {1{`RANDOM}};
  uops_5_bp_xcpt_if = _RAND_988[0:0];
  _RAND_989 = {1{`RANDOM}};
  uops_5_debug_fsrc = _RAND_989[1:0];
  _RAND_990 = {1{`RANDOM}};
  uops_5_debug_tsrc = _RAND_990[1:0];
  _RAND_991 = {1{`RANDOM}};
  uops_6_switch = _RAND_991[0:0];
  _RAND_992 = {1{`RANDOM}};
  uops_6_switch_off = _RAND_992[0:0];
  _RAND_993 = {1{`RANDOM}};
  uops_6_is_unicore = _RAND_993[0:0];
  _RAND_994 = {1{`RANDOM}};
  uops_6_shift = _RAND_994[2:0];
  _RAND_995 = {1{`RANDOM}};
  uops_6_lrs3_rtype = _RAND_995[1:0];
  _RAND_996 = {1{`RANDOM}};
  uops_6_rflag = _RAND_996[0:0];
  _RAND_997 = {1{`RANDOM}};
  uops_6_wflag = _RAND_997[0:0];
  _RAND_998 = {1{`RANDOM}};
  uops_6_prflag = _RAND_998[3:0];
  _RAND_999 = {1{`RANDOM}};
  uops_6_pwflag = _RAND_999[3:0];
  _RAND_1000 = {1{`RANDOM}};
  uops_6_pflag_busy = _RAND_1000[0:0];
  _RAND_1001 = {1{`RANDOM}};
  uops_6_stale_pflag = _RAND_1001[3:0];
  _RAND_1002 = {1{`RANDOM}};
  uops_6_op1_sel = _RAND_1002[3:0];
  _RAND_1003 = {1{`RANDOM}};
  uops_6_op2_sel = _RAND_1003[3:0];
  _RAND_1004 = {1{`RANDOM}};
  uops_6_split_num = _RAND_1004[5:0];
  _RAND_1005 = {1{`RANDOM}};
  uops_6_self_index = _RAND_1005[5:0];
  _RAND_1006 = {1{`RANDOM}};
  uops_6_rob_inst_idx = _RAND_1006[5:0];
  _RAND_1007 = {1{`RANDOM}};
  uops_6_address_num = _RAND_1007[5:0];
  _RAND_1008 = {1{`RANDOM}};
  uops_6_uopc = _RAND_1008[6:0];
  _RAND_1009 = {1{`RANDOM}};
  uops_6_inst = _RAND_1009[31:0];
  _RAND_1010 = {1{`RANDOM}};
  uops_6_debug_inst = _RAND_1010[31:0];
  _RAND_1011 = {1{`RANDOM}};
  uops_6_is_rvc = _RAND_1011[0:0];
  _RAND_1012 = {2{`RANDOM}};
  uops_6_debug_pc = _RAND_1012[39:0];
  _RAND_1013 = {1{`RANDOM}};
  uops_6_iq_type = _RAND_1013[2:0];
  _RAND_1014 = {1{`RANDOM}};
  uops_6_fu_code = _RAND_1014[9:0];
  _RAND_1015 = {1{`RANDOM}};
  uops_6_ctrl_br_type = _RAND_1015[3:0];
  _RAND_1016 = {1{`RANDOM}};
  uops_6_ctrl_op1_sel = _RAND_1016[1:0];
  _RAND_1017 = {1{`RANDOM}};
  uops_6_ctrl_op2_sel = _RAND_1017[2:0];
  _RAND_1018 = {1{`RANDOM}};
  uops_6_ctrl_imm_sel = _RAND_1018[2:0];
  _RAND_1019 = {1{`RANDOM}};
  uops_6_ctrl_op_fcn = _RAND_1019[3:0];
  _RAND_1020 = {1{`RANDOM}};
  uops_6_ctrl_fcn_dw = _RAND_1020[0:0];
  _RAND_1021 = {1{`RANDOM}};
  uops_6_ctrl_csr_cmd = _RAND_1021[2:0];
  _RAND_1022 = {1{`RANDOM}};
  uops_6_ctrl_is_load = _RAND_1022[0:0];
  _RAND_1023 = {1{`RANDOM}};
  uops_6_ctrl_is_sta = _RAND_1023[0:0];
  _RAND_1024 = {1{`RANDOM}};
  uops_6_ctrl_is_std = _RAND_1024[0:0];
  _RAND_1025 = {1{`RANDOM}};
  uops_6_ctrl_op3_sel = _RAND_1025[1:0];
  _RAND_1026 = {1{`RANDOM}};
  uops_6_iw_state = _RAND_1026[1:0];
  _RAND_1027 = {1{`RANDOM}};
  uops_6_iw_p1_poisoned = _RAND_1027[0:0];
  _RAND_1028 = {1{`RANDOM}};
  uops_6_iw_p2_poisoned = _RAND_1028[0:0];
  _RAND_1029 = {1{`RANDOM}};
  uops_6_is_br = _RAND_1029[0:0];
  _RAND_1030 = {1{`RANDOM}};
  uops_6_is_jalr = _RAND_1030[0:0];
  _RAND_1031 = {1{`RANDOM}};
  uops_6_is_jal = _RAND_1031[0:0];
  _RAND_1032 = {1{`RANDOM}};
  uops_6_is_sfb = _RAND_1032[0:0];
  _RAND_1033 = {1{`RANDOM}};
  uops_6_br_mask = _RAND_1033[11:0];
  _RAND_1034 = {1{`RANDOM}};
  uops_6_br_tag = _RAND_1034[3:0];
  _RAND_1035 = {1{`RANDOM}};
  uops_6_ftq_idx = _RAND_1035[4:0];
  _RAND_1036 = {1{`RANDOM}};
  uops_6_edge_inst = _RAND_1036[0:0];
  _RAND_1037 = {1{`RANDOM}};
  uops_6_pc_lob = _RAND_1037[5:0];
  _RAND_1038 = {1{`RANDOM}};
  uops_6_taken = _RAND_1038[0:0];
  _RAND_1039 = {1{`RANDOM}};
  uops_6_imm_packed = _RAND_1039[19:0];
  _RAND_1040 = {1{`RANDOM}};
  uops_6_csr_addr = _RAND_1040[11:0];
  _RAND_1041 = {1{`RANDOM}};
  uops_6_rob_idx = _RAND_1041[5:0];
  _RAND_1042 = {1{`RANDOM}};
  uops_6_ldq_idx = _RAND_1042[4:0];
  _RAND_1043 = {1{`RANDOM}};
  uops_6_stq_idx = _RAND_1043[4:0];
  _RAND_1044 = {1{`RANDOM}};
  uops_6_rxq_idx = _RAND_1044[1:0];
  _RAND_1045 = {1{`RANDOM}};
  uops_6_pdst = _RAND_1045[6:0];
  _RAND_1046 = {1{`RANDOM}};
  uops_6_prs1 = _RAND_1046[6:0];
  _RAND_1047 = {1{`RANDOM}};
  uops_6_prs2 = _RAND_1047[6:0];
  _RAND_1048 = {1{`RANDOM}};
  uops_6_prs3 = _RAND_1048[6:0];
  _RAND_1049 = {1{`RANDOM}};
  uops_6_ppred = _RAND_1049[4:0];
  _RAND_1050 = {1{`RANDOM}};
  uops_6_prs1_busy = _RAND_1050[0:0];
  _RAND_1051 = {1{`RANDOM}};
  uops_6_prs2_busy = _RAND_1051[0:0];
  _RAND_1052 = {1{`RANDOM}};
  uops_6_prs3_busy = _RAND_1052[0:0];
  _RAND_1053 = {1{`RANDOM}};
  uops_6_ppred_busy = _RAND_1053[0:0];
  _RAND_1054 = {1{`RANDOM}};
  uops_6_stale_pdst = _RAND_1054[6:0];
  _RAND_1055 = {1{`RANDOM}};
  uops_6_exception = _RAND_1055[0:0];
  _RAND_1056 = {2{`RANDOM}};
  uops_6_exc_cause = _RAND_1056[63:0];
  _RAND_1057 = {1{`RANDOM}};
  uops_6_bypassable = _RAND_1057[0:0];
  _RAND_1058 = {1{`RANDOM}};
  uops_6_mem_cmd = _RAND_1058[4:0];
  _RAND_1059 = {1{`RANDOM}};
  uops_6_mem_size = _RAND_1059[1:0];
  _RAND_1060 = {1{`RANDOM}};
  uops_6_mem_signed = _RAND_1060[0:0];
  _RAND_1061 = {1{`RANDOM}};
  uops_6_is_fence = _RAND_1061[0:0];
  _RAND_1062 = {1{`RANDOM}};
  uops_6_is_fencei = _RAND_1062[0:0];
  _RAND_1063 = {1{`RANDOM}};
  uops_6_is_amo = _RAND_1063[0:0];
  _RAND_1064 = {1{`RANDOM}};
  uops_6_uses_ldq = _RAND_1064[0:0];
  _RAND_1065 = {1{`RANDOM}};
  uops_6_uses_stq = _RAND_1065[0:0];
  _RAND_1066 = {1{`RANDOM}};
  uops_6_is_sys_pc2epc = _RAND_1066[0:0];
  _RAND_1067 = {1{`RANDOM}};
  uops_6_is_unique = _RAND_1067[0:0];
  _RAND_1068 = {1{`RANDOM}};
  uops_6_flush_on_commit = _RAND_1068[0:0];
  _RAND_1069 = {1{`RANDOM}};
  uops_6_ldst_is_rs1 = _RAND_1069[0:0];
  _RAND_1070 = {1{`RANDOM}};
  uops_6_ldst = _RAND_1070[5:0];
  _RAND_1071 = {1{`RANDOM}};
  uops_6_lrs1 = _RAND_1071[5:0];
  _RAND_1072 = {1{`RANDOM}};
  uops_6_lrs2 = _RAND_1072[5:0];
  _RAND_1073 = {1{`RANDOM}};
  uops_6_lrs3 = _RAND_1073[5:0];
  _RAND_1074 = {1{`RANDOM}};
  uops_6_ldst_val = _RAND_1074[0:0];
  _RAND_1075 = {1{`RANDOM}};
  uops_6_dst_rtype = _RAND_1075[1:0];
  _RAND_1076 = {1{`RANDOM}};
  uops_6_lrs1_rtype = _RAND_1076[1:0];
  _RAND_1077 = {1{`RANDOM}};
  uops_6_lrs2_rtype = _RAND_1077[1:0];
  _RAND_1078 = {1{`RANDOM}};
  uops_6_frs3_en = _RAND_1078[0:0];
  _RAND_1079 = {1{`RANDOM}};
  uops_6_fp_val = _RAND_1079[0:0];
  _RAND_1080 = {1{`RANDOM}};
  uops_6_fp_single = _RAND_1080[0:0];
  _RAND_1081 = {1{`RANDOM}};
  uops_6_xcpt_pf_if = _RAND_1081[0:0];
  _RAND_1082 = {1{`RANDOM}};
  uops_6_xcpt_ae_if = _RAND_1082[0:0];
  _RAND_1083 = {1{`RANDOM}};
  uops_6_xcpt_ma_if = _RAND_1083[0:0];
  _RAND_1084 = {1{`RANDOM}};
  uops_6_bp_debug_if = _RAND_1084[0:0];
  _RAND_1085 = {1{`RANDOM}};
  uops_6_bp_xcpt_if = _RAND_1085[0:0];
  _RAND_1086 = {1{`RANDOM}};
  uops_6_debug_fsrc = _RAND_1086[1:0];
  _RAND_1087 = {1{`RANDOM}};
  uops_6_debug_tsrc = _RAND_1087[1:0];
  _RAND_1088 = {1{`RANDOM}};
  value = _RAND_1088[2:0];
  _RAND_1089 = {1{`RANDOM}};
  value_1 = _RAND_1089[2:0];
  _RAND_1090 = {1{`RANDOM}};
  maybe_full = _RAND_1090[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
