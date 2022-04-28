module ALUExeUnit(
  input         clock,
  input         reset,
  output [9:0]  io_fu_types,
  output        io_req_ready,
  input         io_req_valid,
  input         io_req_bits_uop_switch,
  input         io_req_bits_uop_switch_off,
  input         io_req_bits_uop_is_unicore,
  input  [2:0]  io_req_bits_uop_shift,
  input  [1:0]  io_req_bits_uop_lrs3_rtype,
  input         io_req_bits_uop_rflag,
  input         io_req_bits_uop_wflag,
  input  [3:0]  io_req_bits_uop_prflag,
  input  [3:0]  io_req_bits_uop_pwflag,
  input         io_req_bits_uop_pflag_busy,
  input  [3:0]  io_req_bits_uop_stale_pflag,
  input  [3:0]  io_req_bits_uop_op1_sel,
  input  [3:0]  io_req_bits_uop_op2_sel,
  input  [5:0]  io_req_bits_uop_split_num,
  input  [5:0]  io_req_bits_uop_self_index,
  input  [5:0]  io_req_bits_uop_rob_inst_idx,
  input  [5:0]  io_req_bits_uop_address_num,
  input  [6:0]  io_req_bits_uop_uopc,
  input  [31:0] io_req_bits_uop_inst,
  input  [31:0] io_req_bits_uop_debug_inst,
  input         io_req_bits_uop_is_rvc,
  input  [39:0] io_req_bits_uop_debug_pc,
  input  [2:0]  io_req_bits_uop_iq_type,
  input  [9:0]  io_req_bits_uop_fu_code,
  input  [3:0]  io_req_bits_uop_ctrl_br_type,
  input  [1:0]  io_req_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_req_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_req_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_req_bits_uop_ctrl_op_fcn,
  input         io_req_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_req_bits_uop_ctrl_csr_cmd,
  input         io_req_bits_uop_ctrl_is_load,
  input         io_req_bits_uop_ctrl_is_sta,
  input         io_req_bits_uop_ctrl_is_std,
  input  [1:0]  io_req_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_req_bits_uop_iw_state,
  input         io_req_bits_uop_iw_p1_poisoned,
  input         io_req_bits_uop_iw_p2_poisoned,
  input         io_req_bits_uop_is_br,
  input         io_req_bits_uop_is_jalr,
  input         io_req_bits_uop_is_jal,
  input         io_req_bits_uop_is_sfb,
  input  [11:0] io_req_bits_uop_br_mask,
  input  [3:0]  io_req_bits_uop_br_tag,
  input  [4:0]  io_req_bits_uop_ftq_idx,
  input         io_req_bits_uop_edge_inst,
  input  [5:0]  io_req_bits_uop_pc_lob,
  input         io_req_bits_uop_taken,
  input  [19:0] io_req_bits_uop_imm_packed,
  input  [11:0] io_req_bits_uop_csr_addr,
  input  [5:0]  io_req_bits_uop_rob_idx,
  input  [4:0]  io_req_bits_uop_ldq_idx,
  input  [4:0]  io_req_bits_uop_stq_idx,
  input  [1:0]  io_req_bits_uop_rxq_idx,
  input  [6:0]  io_req_bits_uop_pdst,
  input  [6:0]  io_req_bits_uop_prs1,
  input  [6:0]  io_req_bits_uop_prs2,
  input  [6:0]  io_req_bits_uop_prs3,
  input  [4:0]  io_req_bits_uop_ppred,
  input         io_req_bits_uop_prs1_busy,
  input         io_req_bits_uop_prs2_busy,
  input         io_req_bits_uop_prs3_busy,
  input         io_req_bits_uop_ppred_busy,
  input  [6:0]  io_req_bits_uop_stale_pdst,
  input         io_req_bits_uop_exception,
  input  [63:0] io_req_bits_uop_exc_cause,
  input         io_req_bits_uop_bypassable,
  input  [4:0]  io_req_bits_uop_mem_cmd,
  input  [1:0]  io_req_bits_uop_mem_size,
  input         io_req_bits_uop_mem_signed,
  input         io_req_bits_uop_is_fence,
  input         io_req_bits_uop_is_fencei,
  input         io_req_bits_uop_is_amo,
  input         io_req_bits_uop_uses_ldq,
  input         io_req_bits_uop_uses_stq,
  input         io_req_bits_uop_is_sys_pc2epc,
  input         io_req_bits_uop_is_unique,
  input         io_req_bits_uop_flush_on_commit,
  input         io_req_bits_uop_ldst_is_rs1,
  input  [5:0]  io_req_bits_uop_ldst,
  input  [5:0]  io_req_bits_uop_lrs1,
  input  [5:0]  io_req_bits_uop_lrs2,
  input  [5:0]  io_req_bits_uop_lrs3,
  input         io_req_bits_uop_ldst_val,
  input  [1:0]  io_req_bits_uop_dst_rtype,
  input  [1:0]  io_req_bits_uop_lrs1_rtype,
  input  [1:0]  io_req_bits_uop_lrs2_rtype,
  input         io_req_bits_uop_frs3_en,
  input         io_req_bits_uop_fp_val,
  input         io_req_bits_uop_fp_single,
  input         io_req_bits_uop_xcpt_pf_if,
  input         io_req_bits_uop_xcpt_ae_if,
  input         io_req_bits_uop_xcpt_ma_if,
  input         io_req_bits_uop_bp_debug_if,
  input         io_req_bits_uop_bp_xcpt_if,
  input  [1:0]  io_req_bits_uop_debug_fsrc,
  input  [1:0]  io_req_bits_uop_debug_tsrc,
  input  [64:0] io_req_bits_rs1_data,
  input  [64:0] io_req_bits_rs2_data,
  input  [64:0] io_req_bits_rs3_data,
  input         io_req_bits_pred_data,
  input  [3:0]  io_req_bits_flagdata,
  input  [31:0] io_req_bits_fflagdata,
  input         io_req_bits_kill,
  input         io_ll_iresp_ready,
  output        io_ll_iresp_valid,
  output        io_ll_iresp_bits_uop_switch,
  output        io_ll_iresp_bits_uop_switch_off,
  output        io_ll_iresp_bits_uop_is_unicore,
  output [2:0]  io_ll_iresp_bits_uop_shift,
  output [1:0]  io_ll_iresp_bits_uop_lrs3_rtype,
  output        io_ll_iresp_bits_uop_rflag,
  output        io_ll_iresp_bits_uop_wflag,
  output [3:0]  io_ll_iresp_bits_uop_prflag,
  output [3:0]  io_ll_iresp_bits_uop_pwflag,
  output        io_ll_iresp_bits_uop_pflag_busy,
  output [3:0]  io_ll_iresp_bits_uop_stale_pflag,
  output [3:0]  io_ll_iresp_bits_uop_op1_sel,
  output [3:0]  io_ll_iresp_bits_uop_op2_sel,
  output [5:0]  io_ll_iresp_bits_uop_split_num,
  output [5:0]  io_ll_iresp_bits_uop_self_index,
  output [5:0]  io_ll_iresp_bits_uop_rob_inst_idx,
  output [5:0]  io_ll_iresp_bits_uop_address_num,
  output [6:0]  io_ll_iresp_bits_uop_uopc,
  output [31:0] io_ll_iresp_bits_uop_inst,
  output [31:0] io_ll_iresp_bits_uop_debug_inst,
  output        io_ll_iresp_bits_uop_is_rvc,
  output [39:0] io_ll_iresp_bits_uop_debug_pc,
  output [2:0]  io_ll_iresp_bits_uop_iq_type,
  output [9:0]  io_ll_iresp_bits_uop_fu_code,
  output [3:0]  io_ll_iresp_bits_uop_ctrl_br_type,
  output [1:0]  io_ll_iresp_bits_uop_ctrl_op1_sel,
  output [2:0]  io_ll_iresp_bits_uop_ctrl_op2_sel,
  output [2:0]  io_ll_iresp_bits_uop_ctrl_imm_sel,
  output [3:0]  io_ll_iresp_bits_uop_ctrl_op_fcn,
  output        io_ll_iresp_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_ll_iresp_bits_uop_ctrl_csr_cmd,
  output        io_ll_iresp_bits_uop_ctrl_is_load,
  output        io_ll_iresp_bits_uop_ctrl_is_sta,
  output        io_ll_iresp_bits_uop_ctrl_is_std,
  output [1:0]  io_ll_iresp_bits_uop_ctrl_op3_sel,
  output [1:0]  io_ll_iresp_bits_uop_iw_state,
  output        io_ll_iresp_bits_uop_iw_p1_poisoned,
  output        io_ll_iresp_bits_uop_iw_p2_poisoned,
  output        io_ll_iresp_bits_uop_is_br,
  output        io_ll_iresp_bits_uop_is_jalr,
  output        io_ll_iresp_bits_uop_is_jal,
  output        io_ll_iresp_bits_uop_is_sfb,
  output [11:0] io_ll_iresp_bits_uop_br_mask,
  output [3:0]  io_ll_iresp_bits_uop_br_tag,
  output [4:0]  io_ll_iresp_bits_uop_ftq_idx,
  output        io_ll_iresp_bits_uop_edge_inst,
  output [5:0]  io_ll_iresp_bits_uop_pc_lob,
  output        io_ll_iresp_bits_uop_taken,
  output [19:0] io_ll_iresp_bits_uop_imm_packed,
  output [11:0] io_ll_iresp_bits_uop_csr_addr,
  output [5:0]  io_ll_iresp_bits_uop_rob_idx,
  output [4:0]  io_ll_iresp_bits_uop_ldq_idx,
  output [4:0]  io_ll_iresp_bits_uop_stq_idx,
  output [1:0]  io_ll_iresp_bits_uop_rxq_idx,
  output [6:0]  io_ll_iresp_bits_uop_pdst,
  output [6:0]  io_ll_iresp_bits_uop_prs1,
  output [6:0]  io_ll_iresp_bits_uop_prs2,
  output [6:0]  io_ll_iresp_bits_uop_prs3,
  output [4:0]  io_ll_iresp_bits_uop_ppred,
  output        io_ll_iresp_bits_uop_prs1_busy,
  output        io_ll_iresp_bits_uop_prs2_busy,
  output        io_ll_iresp_bits_uop_prs3_busy,
  output        io_ll_iresp_bits_uop_ppred_busy,
  output [6:0]  io_ll_iresp_bits_uop_stale_pdst,
  output        io_ll_iresp_bits_uop_exception,
  output [63:0] io_ll_iresp_bits_uop_exc_cause,
  output        io_ll_iresp_bits_uop_bypassable,
  output [4:0]  io_ll_iresp_bits_uop_mem_cmd,
  output [1:0]  io_ll_iresp_bits_uop_mem_size,
  output        io_ll_iresp_bits_uop_mem_signed,
  output        io_ll_iresp_bits_uop_is_fence,
  output        io_ll_iresp_bits_uop_is_fencei,
  output        io_ll_iresp_bits_uop_is_amo,
  output        io_ll_iresp_bits_uop_uses_ldq,
  output        io_ll_iresp_bits_uop_uses_stq,
  output        io_ll_iresp_bits_uop_is_sys_pc2epc,
  output        io_ll_iresp_bits_uop_is_unique,
  output        io_ll_iresp_bits_uop_flush_on_commit,
  output        io_ll_iresp_bits_uop_ldst_is_rs1,
  output [5:0]  io_ll_iresp_bits_uop_ldst,
  output [5:0]  io_ll_iresp_bits_uop_lrs1,
  output [5:0]  io_ll_iresp_bits_uop_lrs2,
  output [5:0]  io_ll_iresp_bits_uop_lrs3,
  output        io_ll_iresp_bits_uop_ldst_val,
  output [1:0]  io_ll_iresp_bits_uop_dst_rtype,
  output [1:0]  io_ll_iresp_bits_uop_lrs1_rtype,
  output [1:0]  io_ll_iresp_bits_uop_lrs2_rtype,
  output        io_ll_iresp_bits_uop_frs3_en,
  output        io_ll_iresp_bits_uop_fp_val,
  output        io_ll_iresp_bits_uop_fp_single,
  output        io_ll_iresp_bits_uop_xcpt_pf_if,
  output        io_ll_iresp_bits_uop_xcpt_ae_if,
  output        io_ll_iresp_bits_uop_xcpt_ma_if,
  output        io_ll_iresp_bits_uop_bp_debug_if,
  output        io_ll_iresp_bits_uop_bp_xcpt_if,
  output [1:0]  io_ll_iresp_bits_uop_debug_fsrc,
  output [1:0]  io_ll_iresp_bits_uop_debug_tsrc,
  output [64:0] io_ll_iresp_bits_data,
  output        io_ll_iresp_bits_predicated,
  output        io_ll_iresp_bits_fflags_valid,
  output        io_ll_iresp_bits_fflags_bits_uop_switch,
  output        io_ll_iresp_bits_fflags_bits_uop_switch_off,
  output        io_ll_iresp_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_ll_iresp_bits_fflags_bits_uop_shift,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_lrs3_rtype,
  output        io_ll_iresp_bits_fflags_bits_uop_rflag,
  output        io_ll_iresp_bits_fflags_bits_uop_wflag,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_prflag,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_pwflag,
  output        io_ll_iresp_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_split_num,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_self_index,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_address_num,
  output [6:0]  io_ll_iresp_bits_fflags_bits_uop_uopc,
  output [31:0] io_ll_iresp_bits_fflags_bits_uop_inst,
  output [31:0] io_ll_iresp_bits_fflags_bits_uop_debug_inst,
  output        io_ll_iresp_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_ll_iresp_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_ll_iresp_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_ll_iresp_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_ll_iresp_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_ll_iresp_bits_fflags_bits_uop_ctrl_is_load,
  output        io_ll_iresp_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_ll_iresp_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_op3_sel,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_iw_state,
  output        io_ll_iresp_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_ll_iresp_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_ll_iresp_bits_fflags_bits_uop_is_br,
  output        io_ll_iresp_bits_fflags_bits_uop_is_jalr,
  output        io_ll_iresp_bits_fflags_bits_uop_is_jal,
  output        io_ll_iresp_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_ll_iresp_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_ll_iresp_bits_fflags_bits_uop_ftq_idx,
  output        io_ll_iresp_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_pc_lob,
  output        io_ll_iresp_bits_fflags_bits_uop_taken,
  output [19:0] io_ll_iresp_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_ll_iresp_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_ll_iresp_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_ll_iresp_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_ll_iresp_bits_fflags_bits_uop_pdst,
  output [6:0]  io_ll_iresp_bits_fflags_bits_uop_prs1,
  output [6:0]  io_ll_iresp_bits_fflags_bits_uop_prs2,
  output [6:0]  io_ll_iresp_bits_fflags_bits_uop_prs3,
  output [4:0]  io_ll_iresp_bits_fflags_bits_uop_ppred,
  output        io_ll_iresp_bits_fflags_bits_uop_prs1_busy,
  output        io_ll_iresp_bits_fflags_bits_uop_prs2_busy,
  output        io_ll_iresp_bits_fflags_bits_uop_prs3_busy,
  output        io_ll_iresp_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_ll_iresp_bits_fflags_bits_uop_stale_pdst,
  output        io_ll_iresp_bits_fflags_bits_uop_exception,
  output [63:0] io_ll_iresp_bits_fflags_bits_uop_exc_cause,
  output        io_ll_iresp_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_ll_iresp_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_mem_size,
  output        io_ll_iresp_bits_fflags_bits_uop_mem_signed,
  output        io_ll_iresp_bits_fflags_bits_uop_is_fence,
  output        io_ll_iresp_bits_fflags_bits_uop_is_fencei,
  output        io_ll_iresp_bits_fflags_bits_uop_is_amo,
  output        io_ll_iresp_bits_fflags_bits_uop_uses_ldq,
  output        io_ll_iresp_bits_fflags_bits_uop_uses_stq,
  output        io_ll_iresp_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_ll_iresp_bits_fflags_bits_uop_is_unique,
  output        io_ll_iresp_bits_fflags_bits_uop_flush_on_commit,
  output        io_ll_iresp_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_ldst,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_lrs3,
  output        io_ll_iresp_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_lrs2_rtype,
  output        io_ll_iresp_bits_fflags_bits_uop_frs3_en,
  output        io_ll_iresp_bits_fflags_bits_uop_fp_val,
  output        io_ll_iresp_bits_fflags_bits_uop_fp_single,
  output        io_ll_iresp_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_ll_iresp_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_ll_iresp_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_ll_iresp_bits_fflags_bits_uop_bp_debug_if,
  output        io_ll_iresp_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_ll_iresp_bits_fflags_bits_flags,
  output [3:0]  io_ll_iresp_bits_flagdata,
  output        io_ll_iresp_bits_fflagdata_valid,
  output        io_ll_iresp_bits_fflagdata_bits_uop_switch,
  output        io_ll_iresp_bits_fflagdata_bits_uop_switch_off,
  output        io_ll_iresp_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_ll_iresp_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_ll_iresp_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_ll_iresp_bits_fflagdata_bits_uop_rflag,
  output        io_ll_iresp_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_ll_iresp_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_ll_iresp_bits_fflagdata_bits_uop_pwflag,
  output        io_ll_iresp_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_ll_iresp_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_ll_iresp_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_ll_iresp_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_ll_iresp_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_ll_iresp_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_ll_iresp_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_ll_iresp_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_ll_iresp_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_ll_iresp_bits_fflagdata_bits_uop_inst,
  output [31:0] io_ll_iresp_bits_fflagdata_bits_uop_debug_inst,
  output        io_ll_iresp_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_ll_iresp_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_ll_iresp_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_ll_iresp_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_ll_iresp_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_ll_iresp_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_ll_iresp_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_ll_iresp_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_ll_iresp_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_ll_iresp_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_ll_iresp_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_ll_iresp_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_ll_iresp_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_ll_iresp_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_ll_iresp_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_ll_iresp_bits_fflagdata_bits_uop_iw_state,
  output        io_ll_iresp_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_ll_iresp_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_ll_iresp_bits_fflagdata_bits_uop_is_br,
  output        io_ll_iresp_bits_fflagdata_bits_uop_is_jalr,
  output        io_ll_iresp_bits_fflagdata_bits_uop_is_jal,
  output        io_ll_iresp_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_ll_iresp_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_ll_iresp_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_ll_iresp_bits_fflagdata_bits_uop_ftq_idx,
  output        io_ll_iresp_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_ll_iresp_bits_fflagdata_bits_uop_pc_lob,
  output        io_ll_iresp_bits_fflagdata_bits_uop_taken,
  output [19:0] io_ll_iresp_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_ll_iresp_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_ll_iresp_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_ll_iresp_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_ll_iresp_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_ll_iresp_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_ll_iresp_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_ll_iresp_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_ll_iresp_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_ll_iresp_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_ll_iresp_bits_fflagdata_bits_uop_ppred,
  output        io_ll_iresp_bits_fflagdata_bits_uop_prs1_busy,
  output        io_ll_iresp_bits_fflagdata_bits_uop_prs2_busy,
  output        io_ll_iresp_bits_fflagdata_bits_uop_prs3_busy,
  output        io_ll_iresp_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_ll_iresp_bits_fflagdata_bits_uop_stale_pdst,
  output        io_ll_iresp_bits_fflagdata_bits_uop_exception,
  output [63:0] io_ll_iresp_bits_fflagdata_bits_uop_exc_cause,
  output        io_ll_iresp_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_ll_iresp_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_ll_iresp_bits_fflagdata_bits_uop_mem_size,
  output        io_ll_iresp_bits_fflagdata_bits_uop_mem_signed,
  output        io_ll_iresp_bits_fflagdata_bits_uop_is_fence,
  output        io_ll_iresp_bits_fflagdata_bits_uop_is_fencei,
  output        io_ll_iresp_bits_fflagdata_bits_uop_is_amo,
  output        io_ll_iresp_bits_fflagdata_bits_uop_uses_ldq,
  output        io_ll_iresp_bits_fflagdata_bits_uop_uses_stq,
  output        io_ll_iresp_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_ll_iresp_bits_fflagdata_bits_uop_is_unique,
  output        io_ll_iresp_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_ll_iresp_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_ll_iresp_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_ll_iresp_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_ll_iresp_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_ll_iresp_bits_fflagdata_bits_uop_lrs3,
  output        io_ll_iresp_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_ll_iresp_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_ll_iresp_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_ll_iresp_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_ll_iresp_bits_fflagdata_bits_uop_frs3_en,
  output        io_ll_iresp_bits_fflagdata_bits_uop_fp_val,
  output        io_ll_iresp_bits_fflagdata_bits_uop_fp_single,
  output        io_ll_iresp_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_ll_iresp_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_ll_iresp_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_ll_iresp_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_ll_iresp_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_ll_iresp_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_ll_iresp_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_ll_iresp_bits_fflagdata_bits_fflag,
  input         io_ll_fresp_ready,
  output        io_ll_fresp_valid,
  output        io_ll_fresp_bits_uop_switch,
  output        io_ll_fresp_bits_uop_switch_off,
  output        io_ll_fresp_bits_uop_is_unicore,
  output [2:0]  io_ll_fresp_bits_uop_shift,
  output [1:0]  io_ll_fresp_bits_uop_lrs3_rtype,
  output        io_ll_fresp_bits_uop_rflag,
  output        io_ll_fresp_bits_uop_wflag,
  output [3:0]  io_ll_fresp_bits_uop_prflag,
  output [3:0]  io_ll_fresp_bits_uop_pwflag,
  output        io_ll_fresp_bits_uop_pflag_busy,
  output [3:0]  io_ll_fresp_bits_uop_stale_pflag,
  output [3:0]  io_ll_fresp_bits_uop_op1_sel,
  output [3:0]  io_ll_fresp_bits_uop_op2_sel,
  output [5:0]  io_ll_fresp_bits_uop_split_num,
  output [5:0]  io_ll_fresp_bits_uop_self_index,
  output [5:0]  io_ll_fresp_bits_uop_rob_inst_idx,
  output [5:0]  io_ll_fresp_bits_uop_address_num,
  output [6:0]  io_ll_fresp_bits_uop_uopc,
  output [31:0] io_ll_fresp_bits_uop_inst,
  output [31:0] io_ll_fresp_bits_uop_debug_inst,
  output        io_ll_fresp_bits_uop_is_rvc,
  output [39:0] io_ll_fresp_bits_uop_debug_pc,
  output [2:0]  io_ll_fresp_bits_uop_iq_type,
  output [9:0]  io_ll_fresp_bits_uop_fu_code,
  output [3:0]  io_ll_fresp_bits_uop_ctrl_br_type,
  output [1:0]  io_ll_fresp_bits_uop_ctrl_op1_sel,
  output [2:0]  io_ll_fresp_bits_uop_ctrl_op2_sel,
  output [2:0]  io_ll_fresp_bits_uop_ctrl_imm_sel,
  output [3:0]  io_ll_fresp_bits_uop_ctrl_op_fcn,
  output        io_ll_fresp_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_ll_fresp_bits_uop_ctrl_csr_cmd,
  output        io_ll_fresp_bits_uop_ctrl_is_load,
  output        io_ll_fresp_bits_uop_ctrl_is_sta,
  output        io_ll_fresp_bits_uop_ctrl_is_std,
  output [1:0]  io_ll_fresp_bits_uop_ctrl_op3_sel,
  output [1:0]  io_ll_fresp_bits_uop_iw_state,
  output        io_ll_fresp_bits_uop_iw_p1_poisoned,
  output        io_ll_fresp_bits_uop_iw_p2_poisoned,
  output        io_ll_fresp_bits_uop_is_br,
  output        io_ll_fresp_bits_uop_is_jalr,
  output        io_ll_fresp_bits_uop_is_jal,
  output        io_ll_fresp_bits_uop_is_sfb,
  output [11:0] io_ll_fresp_bits_uop_br_mask,
  output [3:0]  io_ll_fresp_bits_uop_br_tag,
  output [4:0]  io_ll_fresp_bits_uop_ftq_idx,
  output        io_ll_fresp_bits_uop_edge_inst,
  output [5:0]  io_ll_fresp_bits_uop_pc_lob,
  output        io_ll_fresp_bits_uop_taken,
  output [19:0] io_ll_fresp_bits_uop_imm_packed,
  output [11:0] io_ll_fresp_bits_uop_csr_addr,
  output [5:0]  io_ll_fresp_bits_uop_rob_idx,
  output [4:0]  io_ll_fresp_bits_uop_ldq_idx,
  output [4:0]  io_ll_fresp_bits_uop_stq_idx,
  output [1:0]  io_ll_fresp_bits_uop_rxq_idx,
  output [6:0]  io_ll_fresp_bits_uop_pdst,
  output [6:0]  io_ll_fresp_bits_uop_prs1,
  output [6:0]  io_ll_fresp_bits_uop_prs2,
  output [6:0]  io_ll_fresp_bits_uop_prs3,
  output [4:0]  io_ll_fresp_bits_uop_ppred,
  output        io_ll_fresp_bits_uop_prs1_busy,
  output        io_ll_fresp_bits_uop_prs2_busy,
  output        io_ll_fresp_bits_uop_prs3_busy,
  output        io_ll_fresp_bits_uop_ppred_busy,
  output [6:0]  io_ll_fresp_bits_uop_stale_pdst,
  output        io_ll_fresp_bits_uop_exception,
  output [63:0] io_ll_fresp_bits_uop_exc_cause,
  output        io_ll_fresp_bits_uop_bypassable,
  output [4:0]  io_ll_fresp_bits_uop_mem_cmd,
  output [1:0]  io_ll_fresp_bits_uop_mem_size,
  output        io_ll_fresp_bits_uop_mem_signed,
  output        io_ll_fresp_bits_uop_is_fence,
  output        io_ll_fresp_bits_uop_is_fencei,
  output        io_ll_fresp_bits_uop_is_amo,
  output        io_ll_fresp_bits_uop_uses_ldq,
  output        io_ll_fresp_bits_uop_uses_stq,
  output        io_ll_fresp_bits_uop_is_sys_pc2epc,
  output        io_ll_fresp_bits_uop_is_unique,
  output        io_ll_fresp_bits_uop_flush_on_commit,
  output        io_ll_fresp_bits_uop_ldst_is_rs1,
  output [5:0]  io_ll_fresp_bits_uop_ldst,
  output [5:0]  io_ll_fresp_bits_uop_lrs1,
  output [5:0]  io_ll_fresp_bits_uop_lrs2,
  output [5:0]  io_ll_fresp_bits_uop_lrs3,
  output        io_ll_fresp_bits_uop_ldst_val,
  output [1:0]  io_ll_fresp_bits_uop_dst_rtype,
  output [1:0]  io_ll_fresp_bits_uop_lrs1_rtype,
  output [1:0]  io_ll_fresp_bits_uop_lrs2_rtype,
  output        io_ll_fresp_bits_uop_frs3_en,
  output        io_ll_fresp_bits_uop_fp_val,
  output        io_ll_fresp_bits_uop_fp_single,
  output        io_ll_fresp_bits_uop_xcpt_pf_if,
  output        io_ll_fresp_bits_uop_xcpt_ae_if,
  output        io_ll_fresp_bits_uop_xcpt_ma_if,
  output        io_ll_fresp_bits_uop_bp_debug_if,
  output        io_ll_fresp_bits_uop_bp_xcpt_if,
  output [1:0]  io_ll_fresp_bits_uop_debug_fsrc,
  output [1:0]  io_ll_fresp_bits_uop_debug_tsrc,
  output [64:0] io_ll_fresp_bits_data,
  output        io_ll_fresp_bits_predicated,
  output        io_ll_fresp_bits_fflags_valid,
  output        io_ll_fresp_bits_fflags_bits_uop_switch,
  output        io_ll_fresp_bits_fflags_bits_uop_switch_off,
  output        io_ll_fresp_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_ll_fresp_bits_fflags_bits_uop_shift,
  output [1:0]  io_ll_fresp_bits_fflags_bits_uop_lrs3_rtype,
  output        io_ll_fresp_bits_fflags_bits_uop_rflag,
  output        io_ll_fresp_bits_fflags_bits_uop_wflag,
  output [3:0]  io_ll_fresp_bits_fflags_bits_uop_prflag,
  output [3:0]  io_ll_fresp_bits_fflags_bits_uop_pwflag,
  output        io_ll_fresp_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_ll_fresp_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_ll_fresp_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_ll_fresp_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_ll_fresp_bits_fflags_bits_uop_split_num,
  output [5:0]  io_ll_fresp_bits_fflags_bits_uop_self_index,
  output [5:0]  io_ll_fresp_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_ll_fresp_bits_fflags_bits_uop_address_num,
  output [6:0]  io_ll_fresp_bits_fflags_bits_uop_uopc,
  output [31:0] io_ll_fresp_bits_fflags_bits_uop_inst,
  output [31:0] io_ll_fresp_bits_fflags_bits_uop_debug_inst,
  output        io_ll_fresp_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_ll_fresp_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_ll_fresp_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_ll_fresp_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_ll_fresp_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_ll_fresp_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_ll_fresp_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_ll_fresp_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_ll_fresp_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_ll_fresp_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_ll_fresp_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_ll_fresp_bits_fflags_bits_uop_ctrl_is_load,
  output        io_ll_fresp_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_ll_fresp_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_ll_fresp_bits_fflags_bits_uop_ctrl_op3_sel,
  output [1:0]  io_ll_fresp_bits_fflags_bits_uop_iw_state,
  output        io_ll_fresp_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_ll_fresp_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_ll_fresp_bits_fflags_bits_uop_is_br,
  output        io_ll_fresp_bits_fflags_bits_uop_is_jalr,
  output        io_ll_fresp_bits_fflags_bits_uop_is_jal,
  output        io_ll_fresp_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_ll_fresp_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_ll_fresp_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_ll_fresp_bits_fflags_bits_uop_ftq_idx,
  output        io_ll_fresp_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_ll_fresp_bits_fflags_bits_uop_pc_lob,
  output        io_ll_fresp_bits_fflags_bits_uop_taken,
  output [19:0] io_ll_fresp_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_ll_fresp_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_ll_fresp_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_ll_fresp_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_ll_fresp_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_ll_fresp_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_ll_fresp_bits_fflags_bits_uop_pdst,
  output [6:0]  io_ll_fresp_bits_fflags_bits_uop_prs1,
  output [6:0]  io_ll_fresp_bits_fflags_bits_uop_prs2,
  output [6:0]  io_ll_fresp_bits_fflags_bits_uop_prs3,
  output [4:0]  io_ll_fresp_bits_fflags_bits_uop_ppred,
  output        io_ll_fresp_bits_fflags_bits_uop_prs1_busy,
  output        io_ll_fresp_bits_fflags_bits_uop_prs2_busy,
  output        io_ll_fresp_bits_fflags_bits_uop_prs3_busy,
  output        io_ll_fresp_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_ll_fresp_bits_fflags_bits_uop_stale_pdst,
  output        io_ll_fresp_bits_fflags_bits_uop_exception,
  output [63:0] io_ll_fresp_bits_fflags_bits_uop_exc_cause,
  output        io_ll_fresp_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_ll_fresp_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_ll_fresp_bits_fflags_bits_uop_mem_size,
  output        io_ll_fresp_bits_fflags_bits_uop_mem_signed,
  output        io_ll_fresp_bits_fflags_bits_uop_is_fence,
  output        io_ll_fresp_bits_fflags_bits_uop_is_fencei,
  output        io_ll_fresp_bits_fflags_bits_uop_is_amo,
  output        io_ll_fresp_bits_fflags_bits_uop_uses_ldq,
  output        io_ll_fresp_bits_fflags_bits_uop_uses_stq,
  output        io_ll_fresp_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_ll_fresp_bits_fflags_bits_uop_is_unique,
  output        io_ll_fresp_bits_fflags_bits_uop_flush_on_commit,
  output        io_ll_fresp_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_ll_fresp_bits_fflags_bits_uop_ldst,
  output [5:0]  io_ll_fresp_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_ll_fresp_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_ll_fresp_bits_fflags_bits_uop_lrs3,
  output        io_ll_fresp_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_ll_fresp_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_ll_fresp_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_ll_fresp_bits_fflags_bits_uop_lrs2_rtype,
  output        io_ll_fresp_bits_fflags_bits_uop_frs3_en,
  output        io_ll_fresp_bits_fflags_bits_uop_fp_val,
  output        io_ll_fresp_bits_fflags_bits_uop_fp_single,
  output        io_ll_fresp_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_ll_fresp_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_ll_fresp_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_ll_fresp_bits_fflags_bits_uop_bp_debug_if,
  output        io_ll_fresp_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_ll_fresp_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_ll_fresp_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_ll_fresp_bits_fflags_bits_flags,
  output [3:0]  io_ll_fresp_bits_flagdata,
  output        io_ll_fresp_bits_fflagdata_valid,
  output        io_ll_fresp_bits_fflagdata_bits_uop_switch,
  output        io_ll_fresp_bits_fflagdata_bits_uop_switch_off,
  output        io_ll_fresp_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_ll_fresp_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_ll_fresp_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_ll_fresp_bits_fflagdata_bits_uop_rflag,
  output        io_ll_fresp_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_ll_fresp_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_ll_fresp_bits_fflagdata_bits_uop_pwflag,
  output        io_ll_fresp_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_ll_fresp_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_ll_fresp_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_ll_fresp_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_ll_fresp_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_ll_fresp_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_ll_fresp_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_ll_fresp_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_ll_fresp_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_ll_fresp_bits_fflagdata_bits_uop_inst,
  output [31:0] io_ll_fresp_bits_fflagdata_bits_uop_debug_inst,
  output        io_ll_fresp_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_ll_fresp_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_ll_fresp_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_ll_fresp_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_ll_fresp_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_ll_fresp_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_ll_fresp_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_ll_fresp_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_ll_fresp_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_ll_fresp_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_ll_fresp_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_ll_fresp_bits_fflagdata_bits_uop_iw_state,
  output        io_ll_fresp_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_ll_fresp_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_ll_fresp_bits_fflagdata_bits_uop_is_br,
  output        io_ll_fresp_bits_fflagdata_bits_uop_is_jalr,
  output        io_ll_fresp_bits_fflagdata_bits_uop_is_jal,
  output        io_ll_fresp_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_ll_fresp_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_ll_fresp_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_ll_fresp_bits_fflagdata_bits_uop_ftq_idx,
  output        io_ll_fresp_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_ll_fresp_bits_fflagdata_bits_uop_pc_lob,
  output        io_ll_fresp_bits_fflagdata_bits_uop_taken,
  output [19:0] io_ll_fresp_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_ll_fresp_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_ll_fresp_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_ll_fresp_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_ll_fresp_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_ll_fresp_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_ll_fresp_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_ll_fresp_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_ll_fresp_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_ll_fresp_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_ll_fresp_bits_fflagdata_bits_uop_ppred,
  output        io_ll_fresp_bits_fflagdata_bits_uop_prs1_busy,
  output        io_ll_fresp_bits_fflagdata_bits_uop_prs2_busy,
  output        io_ll_fresp_bits_fflagdata_bits_uop_prs3_busy,
  output        io_ll_fresp_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_ll_fresp_bits_fflagdata_bits_uop_stale_pdst,
  output        io_ll_fresp_bits_fflagdata_bits_uop_exception,
  output [63:0] io_ll_fresp_bits_fflagdata_bits_uop_exc_cause,
  output        io_ll_fresp_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_ll_fresp_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_ll_fresp_bits_fflagdata_bits_uop_mem_size,
  output        io_ll_fresp_bits_fflagdata_bits_uop_mem_signed,
  output        io_ll_fresp_bits_fflagdata_bits_uop_is_fence,
  output        io_ll_fresp_bits_fflagdata_bits_uop_is_fencei,
  output        io_ll_fresp_bits_fflagdata_bits_uop_is_amo,
  output        io_ll_fresp_bits_fflagdata_bits_uop_uses_ldq,
  output        io_ll_fresp_bits_fflagdata_bits_uop_uses_stq,
  output        io_ll_fresp_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_ll_fresp_bits_fflagdata_bits_uop_is_unique,
  output        io_ll_fresp_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_ll_fresp_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_ll_fresp_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_ll_fresp_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_ll_fresp_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_ll_fresp_bits_fflagdata_bits_uop_lrs3,
  output        io_ll_fresp_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_ll_fresp_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_ll_fresp_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_ll_fresp_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_ll_fresp_bits_fflagdata_bits_uop_frs3_en,
  output        io_ll_fresp_bits_fflagdata_bits_uop_fp_val,
  output        io_ll_fresp_bits_fflagdata_bits_uop_fp_single,
  output        io_ll_fresp_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_ll_fresp_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_ll_fresp_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_ll_fresp_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_ll_fresp_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_ll_fresp_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_ll_fresp_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_ll_fresp_bits_fflagdata_bits_fflag,
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
  output        io_lsu_io_req_valid,
  output        io_lsu_io_req_bits_uop_switch,
  output        io_lsu_io_req_bits_uop_switch_off,
  output        io_lsu_io_req_bits_uop_is_unicore,
  output [2:0]  io_lsu_io_req_bits_uop_shift,
  output [1:0]  io_lsu_io_req_bits_uop_lrs3_rtype,
  output        io_lsu_io_req_bits_uop_rflag,
  output        io_lsu_io_req_bits_uop_wflag,
  output [3:0]  io_lsu_io_req_bits_uop_prflag,
  output [3:0]  io_lsu_io_req_bits_uop_pwflag,
  output        io_lsu_io_req_bits_uop_pflag_busy,
  output [3:0]  io_lsu_io_req_bits_uop_stale_pflag,
  output [3:0]  io_lsu_io_req_bits_uop_op1_sel,
  output [3:0]  io_lsu_io_req_bits_uop_op2_sel,
  output [5:0]  io_lsu_io_req_bits_uop_split_num,
  output [5:0]  io_lsu_io_req_bits_uop_self_index,
  output [5:0]  io_lsu_io_req_bits_uop_rob_inst_idx,
  output [5:0]  io_lsu_io_req_bits_uop_address_num,
  output [6:0]  io_lsu_io_req_bits_uop_uopc,
  output [31:0] io_lsu_io_req_bits_uop_inst,
  output [31:0] io_lsu_io_req_bits_uop_debug_inst,
  output        io_lsu_io_req_bits_uop_is_rvc,
  output [39:0] io_lsu_io_req_bits_uop_debug_pc,
  output [2:0]  io_lsu_io_req_bits_uop_iq_type,
  output [9:0]  io_lsu_io_req_bits_uop_fu_code,
  output [3:0]  io_lsu_io_req_bits_uop_ctrl_br_type,
  output [1:0]  io_lsu_io_req_bits_uop_ctrl_op1_sel,
  output [2:0]  io_lsu_io_req_bits_uop_ctrl_op2_sel,
  output [2:0]  io_lsu_io_req_bits_uop_ctrl_imm_sel,
  output [3:0]  io_lsu_io_req_bits_uop_ctrl_op_fcn,
  output        io_lsu_io_req_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_lsu_io_req_bits_uop_ctrl_csr_cmd,
  output        io_lsu_io_req_bits_uop_ctrl_is_load,
  output        io_lsu_io_req_bits_uop_ctrl_is_sta,
  output        io_lsu_io_req_bits_uop_ctrl_is_std,
  output [1:0]  io_lsu_io_req_bits_uop_ctrl_op3_sel,
  output [1:0]  io_lsu_io_req_bits_uop_iw_state,
  output        io_lsu_io_req_bits_uop_iw_p1_poisoned,
  output        io_lsu_io_req_bits_uop_iw_p2_poisoned,
  output        io_lsu_io_req_bits_uop_is_br,
  output        io_lsu_io_req_bits_uop_is_jalr,
  output        io_lsu_io_req_bits_uop_is_jal,
  output        io_lsu_io_req_bits_uop_is_sfb,
  output [11:0] io_lsu_io_req_bits_uop_br_mask,
  output [3:0]  io_lsu_io_req_bits_uop_br_tag,
  output [4:0]  io_lsu_io_req_bits_uop_ftq_idx,
  output        io_lsu_io_req_bits_uop_edge_inst,
  output [5:0]  io_lsu_io_req_bits_uop_pc_lob,
  output        io_lsu_io_req_bits_uop_taken,
  output [19:0] io_lsu_io_req_bits_uop_imm_packed,
  output [11:0] io_lsu_io_req_bits_uop_csr_addr,
  output [5:0]  io_lsu_io_req_bits_uop_rob_idx,
  output [4:0]  io_lsu_io_req_bits_uop_ldq_idx,
  output [4:0]  io_lsu_io_req_bits_uop_stq_idx,
  output [1:0]  io_lsu_io_req_bits_uop_rxq_idx,
  output [6:0]  io_lsu_io_req_bits_uop_pdst,
  output [6:0]  io_lsu_io_req_bits_uop_prs1,
  output [6:0]  io_lsu_io_req_bits_uop_prs2,
  output [6:0]  io_lsu_io_req_bits_uop_prs3,
  output [4:0]  io_lsu_io_req_bits_uop_ppred,
  output        io_lsu_io_req_bits_uop_prs1_busy,
  output        io_lsu_io_req_bits_uop_prs2_busy,
  output        io_lsu_io_req_bits_uop_prs3_busy,
  output        io_lsu_io_req_bits_uop_ppred_busy,
  output [6:0]  io_lsu_io_req_bits_uop_stale_pdst,
  output        io_lsu_io_req_bits_uop_exception,
  output [63:0] io_lsu_io_req_bits_uop_exc_cause,
  output        io_lsu_io_req_bits_uop_bypassable,
  output [4:0]  io_lsu_io_req_bits_uop_mem_cmd,
  output [1:0]  io_lsu_io_req_bits_uop_mem_size,
  output        io_lsu_io_req_bits_uop_mem_signed,
  output        io_lsu_io_req_bits_uop_is_fence,
  output        io_lsu_io_req_bits_uop_is_fencei,
  output        io_lsu_io_req_bits_uop_is_amo,
  output        io_lsu_io_req_bits_uop_uses_ldq,
  output        io_lsu_io_req_bits_uop_uses_stq,
  output        io_lsu_io_req_bits_uop_is_sys_pc2epc,
  output        io_lsu_io_req_bits_uop_is_unique,
  output        io_lsu_io_req_bits_uop_flush_on_commit,
  output        io_lsu_io_req_bits_uop_ldst_is_rs1,
  output [5:0]  io_lsu_io_req_bits_uop_ldst,
  output [5:0]  io_lsu_io_req_bits_uop_lrs1,
  output [5:0]  io_lsu_io_req_bits_uop_lrs2,
  output [5:0]  io_lsu_io_req_bits_uop_lrs3,
  output        io_lsu_io_req_bits_uop_ldst_val,
  output [1:0]  io_lsu_io_req_bits_uop_dst_rtype,
  output [1:0]  io_lsu_io_req_bits_uop_lrs1_rtype,
  output [1:0]  io_lsu_io_req_bits_uop_lrs2_rtype,
  output        io_lsu_io_req_bits_uop_frs3_en,
  output        io_lsu_io_req_bits_uop_fp_val,
  output        io_lsu_io_req_bits_uop_fp_single,
  output        io_lsu_io_req_bits_uop_xcpt_pf_if,
  output        io_lsu_io_req_bits_uop_xcpt_ae_if,
  output        io_lsu_io_req_bits_uop_xcpt_ma_if,
  output        io_lsu_io_req_bits_uop_bp_debug_if,
  output        io_lsu_io_req_bits_uop_bp_xcpt_if,
  output [1:0]  io_lsu_io_req_bits_uop_debug_fsrc,
  output [1:0]  io_lsu_io_req_bits_uop_debug_tsrc,
  output        io_lsu_io_req_bits_predicated,
  output [63:0] io_lsu_io_req_bits_data,
  output        io_lsu_io_req_bits_fflags_valid,
  output        io_lsu_io_req_bits_fflags_bits_uop_switch,
  output        io_lsu_io_req_bits_fflags_bits_uop_switch_off,
  output        io_lsu_io_req_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_lsu_io_req_bits_fflags_bits_uop_shift,
  output [1:0]  io_lsu_io_req_bits_fflags_bits_uop_lrs3_rtype,
  output        io_lsu_io_req_bits_fflags_bits_uop_rflag,
  output        io_lsu_io_req_bits_fflags_bits_uop_wflag,
  output [3:0]  io_lsu_io_req_bits_fflags_bits_uop_prflag,
  output [3:0]  io_lsu_io_req_bits_fflags_bits_uop_pwflag,
  output        io_lsu_io_req_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_lsu_io_req_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_lsu_io_req_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_lsu_io_req_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_lsu_io_req_bits_fflags_bits_uop_split_num,
  output [5:0]  io_lsu_io_req_bits_fflags_bits_uop_self_index,
  output [5:0]  io_lsu_io_req_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_lsu_io_req_bits_fflags_bits_uop_address_num,
  output [6:0]  io_lsu_io_req_bits_fflags_bits_uop_uopc,
  output [31:0] io_lsu_io_req_bits_fflags_bits_uop_inst,
  output [31:0] io_lsu_io_req_bits_fflags_bits_uop_debug_inst,
  output        io_lsu_io_req_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_lsu_io_req_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_lsu_io_req_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_lsu_io_req_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_lsu_io_req_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_lsu_io_req_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_lsu_io_req_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_lsu_io_req_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_lsu_io_req_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_lsu_io_req_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_lsu_io_req_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_lsu_io_req_bits_fflags_bits_uop_ctrl_is_load,
  output        io_lsu_io_req_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_lsu_io_req_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_lsu_io_req_bits_fflags_bits_uop_ctrl_op3_sel,
  output [1:0]  io_lsu_io_req_bits_fflags_bits_uop_iw_state,
  output        io_lsu_io_req_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_lsu_io_req_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_lsu_io_req_bits_fflags_bits_uop_is_br,
  output        io_lsu_io_req_bits_fflags_bits_uop_is_jalr,
  output        io_lsu_io_req_bits_fflags_bits_uop_is_jal,
  output        io_lsu_io_req_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_lsu_io_req_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_lsu_io_req_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_lsu_io_req_bits_fflags_bits_uop_ftq_idx,
  output        io_lsu_io_req_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_lsu_io_req_bits_fflags_bits_uop_pc_lob,
  output        io_lsu_io_req_bits_fflags_bits_uop_taken,
  output [19:0] io_lsu_io_req_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_lsu_io_req_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_lsu_io_req_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_lsu_io_req_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_lsu_io_req_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_lsu_io_req_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_lsu_io_req_bits_fflags_bits_uop_pdst,
  output [6:0]  io_lsu_io_req_bits_fflags_bits_uop_prs1,
  output [6:0]  io_lsu_io_req_bits_fflags_bits_uop_prs2,
  output [6:0]  io_lsu_io_req_bits_fflags_bits_uop_prs3,
  output [4:0]  io_lsu_io_req_bits_fflags_bits_uop_ppred,
  output        io_lsu_io_req_bits_fflags_bits_uop_prs1_busy,
  output        io_lsu_io_req_bits_fflags_bits_uop_prs2_busy,
  output        io_lsu_io_req_bits_fflags_bits_uop_prs3_busy,
  output        io_lsu_io_req_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_lsu_io_req_bits_fflags_bits_uop_stale_pdst,
  output        io_lsu_io_req_bits_fflags_bits_uop_exception,
  output [63:0] io_lsu_io_req_bits_fflags_bits_uop_exc_cause,
  output        io_lsu_io_req_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_lsu_io_req_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_lsu_io_req_bits_fflags_bits_uop_mem_size,
  output        io_lsu_io_req_bits_fflags_bits_uop_mem_signed,
  output        io_lsu_io_req_bits_fflags_bits_uop_is_fence,
  output        io_lsu_io_req_bits_fflags_bits_uop_is_fencei,
  output        io_lsu_io_req_bits_fflags_bits_uop_is_amo,
  output        io_lsu_io_req_bits_fflags_bits_uop_uses_ldq,
  output        io_lsu_io_req_bits_fflags_bits_uop_uses_stq,
  output        io_lsu_io_req_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_lsu_io_req_bits_fflags_bits_uop_is_unique,
  output        io_lsu_io_req_bits_fflags_bits_uop_flush_on_commit,
  output        io_lsu_io_req_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_lsu_io_req_bits_fflags_bits_uop_ldst,
  output [5:0]  io_lsu_io_req_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_lsu_io_req_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_lsu_io_req_bits_fflags_bits_uop_lrs3,
  output        io_lsu_io_req_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_lsu_io_req_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_lsu_io_req_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_lsu_io_req_bits_fflags_bits_uop_lrs2_rtype,
  output        io_lsu_io_req_bits_fflags_bits_uop_frs3_en,
  output        io_lsu_io_req_bits_fflags_bits_uop_fp_val,
  output        io_lsu_io_req_bits_fflags_bits_uop_fp_single,
  output        io_lsu_io_req_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_lsu_io_req_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_lsu_io_req_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_lsu_io_req_bits_fflags_bits_uop_bp_debug_if,
  output        io_lsu_io_req_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_lsu_io_req_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_lsu_io_req_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_lsu_io_req_bits_fflags_bits_flags,
  output [39:0] io_lsu_io_req_bits_addr,
  output        io_lsu_io_req_bits_mxcpt_valid,
  output [16:0] io_lsu_io_req_bits_mxcpt_bits,
  output        io_lsu_io_req_bits_sfence_valid,
  output        io_lsu_io_req_bits_sfence_bits_rs1,
  output        io_lsu_io_req_bits_sfence_bits_rs2,
  output [38:0] io_lsu_io_req_bits_sfence_bits_addr,
  output        io_lsu_io_req_bits_sfence_bits_asid,
  output [3:0]  io_lsu_io_req_bits_flagdata,
  output        io_lsu_io_req_bits_fflagdata_valid,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_switch,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_switch_off,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_lsu_io_req_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_lsu_io_req_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_rflag,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_lsu_io_req_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_lsu_io_req_bits_fflagdata_bits_uop_pwflag,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_lsu_io_req_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_lsu_io_req_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_lsu_io_req_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_lsu_io_req_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_lsu_io_req_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_lsu_io_req_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_lsu_io_req_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_lsu_io_req_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_lsu_io_req_bits_fflagdata_bits_uop_inst,
  output [31:0] io_lsu_io_req_bits_fflagdata_bits_uop_debug_inst,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_lsu_io_req_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_lsu_io_req_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_lsu_io_req_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_lsu_io_req_bits_fflagdata_bits_uop_iw_state,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_is_br,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_is_jalr,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_is_jal,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_lsu_io_req_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_lsu_io_req_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_lsu_io_req_bits_fflagdata_bits_uop_ftq_idx,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_lsu_io_req_bits_fflagdata_bits_uop_pc_lob,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_taken,
  output [19:0] io_lsu_io_req_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_lsu_io_req_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_lsu_io_req_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_lsu_io_req_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_lsu_io_req_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_lsu_io_req_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_lsu_io_req_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_lsu_io_req_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_lsu_io_req_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_lsu_io_req_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_lsu_io_req_bits_fflagdata_bits_uop_ppred,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_prs1_busy,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_prs2_busy,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_prs3_busy,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_lsu_io_req_bits_fflagdata_bits_uop_stale_pdst,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_exception,
  output [63:0] io_lsu_io_req_bits_fflagdata_bits_uop_exc_cause,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_lsu_io_req_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_lsu_io_req_bits_fflagdata_bits_uop_mem_size,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_mem_signed,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_is_fence,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_is_fencei,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_is_amo,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_uses_ldq,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_uses_stq,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_is_unique,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_lsu_io_req_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_lsu_io_req_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_lsu_io_req_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_lsu_io_req_bits_fflagdata_bits_uop_lrs3,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_lsu_io_req_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_lsu_io_req_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_lsu_io_req_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_frs3_en,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_fp_val,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_fp_single,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_lsu_io_req_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_lsu_io_req_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_lsu_io_req_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_lsu_io_req_bits_fflagdata_bits_fflag,
  output        io_lsu_io_iresp_ready,
  input         io_lsu_io_iresp_valid,
  input         io_lsu_io_iresp_bits_uop_switch,
  input         io_lsu_io_iresp_bits_uop_switch_off,
  input         io_lsu_io_iresp_bits_uop_is_unicore,
  input  [2:0]  io_lsu_io_iresp_bits_uop_shift,
  input  [1:0]  io_lsu_io_iresp_bits_uop_lrs3_rtype,
  input         io_lsu_io_iresp_bits_uop_rflag,
  input         io_lsu_io_iresp_bits_uop_wflag,
  input  [3:0]  io_lsu_io_iresp_bits_uop_prflag,
  input  [3:0]  io_lsu_io_iresp_bits_uop_pwflag,
  input         io_lsu_io_iresp_bits_uop_pflag_busy,
  input  [3:0]  io_lsu_io_iresp_bits_uop_stale_pflag,
  input  [3:0]  io_lsu_io_iresp_bits_uop_op1_sel,
  input  [3:0]  io_lsu_io_iresp_bits_uop_op2_sel,
  input  [5:0]  io_lsu_io_iresp_bits_uop_split_num,
  input  [5:0]  io_lsu_io_iresp_bits_uop_self_index,
  input  [5:0]  io_lsu_io_iresp_bits_uop_rob_inst_idx,
  input  [5:0]  io_lsu_io_iresp_bits_uop_address_num,
  input  [6:0]  io_lsu_io_iresp_bits_uop_uopc,
  input  [31:0] io_lsu_io_iresp_bits_uop_inst,
  input  [31:0] io_lsu_io_iresp_bits_uop_debug_inst,
  input         io_lsu_io_iresp_bits_uop_is_rvc,
  input  [39:0] io_lsu_io_iresp_bits_uop_debug_pc,
  input  [2:0]  io_lsu_io_iresp_bits_uop_iq_type,
  input  [9:0]  io_lsu_io_iresp_bits_uop_fu_code,
  input  [3:0]  io_lsu_io_iresp_bits_uop_ctrl_br_type,
  input  [1:0]  io_lsu_io_iresp_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_lsu_io_iresp_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_lsu_io_iresp_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_lsu_io_iresp_bits_uop_ctrl_op_fcn,
  input         io_lsu_io_iresp_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_lsu_io_iresp_bits_uop_ctrl_csr_cmd,
  input         io_lsu_io_iresp_bits_uop_ctrl_is_load,
  input         io_lsu_io_iresp_bits_uop_ctrl_is_sta,
  input         io_lsu_io_iresp_bits_uop_ctrl_is_std,
  input  [1:0]  io_lsu_io_iresp_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_lsu_io_iresp_bits_uop_iw_state,
  input         io_lsu_io_iresp_bits_uop_iw_p1_poisoned,
  input         io_lsu_io_iresp_bits_uop_iw_p2_poisoned,
  input         io_lsu_io_iresp_bits_uop_is_br,
  input         io_lsu_io_iresp_bits_uop_is_jalr,
  input         io_lsu_io_iresp_bits_uop_is_jal,
  input         io_lsu_io_iresp_bits_uop_is_sfb,
  input  [11:0] io_lsu_io_iresp_bits_uop_br_mask,
  input  [3:0]  io_lsu_io_iresp_bits_uop_br_tag,
  input  [4:0]  io_lsu_io_iresp_bits_uop_ftq_idx,
  input         io_lsu_io_iresp_bits_uop_edge_inst,
  input  [5:0]  io_lsu_io_iresp_bits_uop_pc_lob,
  input         io_lsu_io_iresp_bits_uop_taken,
  input  [19:0] io_lsu_io_iresp_bits_uop_imm_packed,
  input  [11:0] io_lsu_io_iresp_bits_uop_csr_addr,
  input  [5:0]  io_lsu_io_iresp_bits_uop_rob_idx,
  input  [4:0]  io_lsu_io_iresp_bits_uop_ldq_idx,
  input  [4:0]  io_lsu_io_iresp_bits_uop_stq_idx,
  input  [1:0]  io_lsu_io_iresp_bits_uop_rxq_idx,
  input  [6:0]  io_lsu_io_iresp_bits_uop_pdst,
  input  [6:0]  io_lsu_io_iresp_bits_uop_prs1,
  input  [6:0]  io_lsu_io_iresp_bits_uop_prs2,
  input  [6:0]  io_lsu_io_iresp_bits_uop_prs3,
  input  [4:0]  io_lsu_io_iresp_bits_uop_ppred,
  input         io_lsu_io_iresp_bits_uop_prs1_busy,
  input         io_lsu_io_iresp_bits_uop_prs2_busy,
  input         io_lsu_io_iresp_bits_uop_prs3_busy,
  input         io_lsu_io_iresp_bits_uop_ppred_busy,
  input  [6:0]  io_lsu_io_iresp_bits_uop_stale_pdst,
  input         io_lsu_io_iresp_bits_uop_exception,
  input  [63:0] io_lsu_io_iresp_bits_uop_exc_cause,
  input         io_lsu_io_iresp_bits_uop_bypassable,
  input  [4:0]  io_lsu_io_iresp_bits_uop_mem_cmd,
  input  [1:0]  io_lsu_io_iresp_bits_uop_mem_size,
  input         io_lsu_io_iresp_bits_uop_mem_signed,
  input         io_lsu_io_iresp_bits_uop_is_fence,
  input         io_lsu_io_iresp_bits_uop_is_fencei,
  input         io_lsu_io_iresp_bits_uop_is_amo,
  input         io_lsu_io_iresp_bits_uop_uses_ldq,
  input         io_lsu_io_iresp_bits_uop_uses_stq,
  input         io_lsu_io_iresp_bits_uop_is_sys_pc2epc,
  input         io_lsu_io_iresp_bits_uop_is_unique,
  input         io_lsu_io_iresp_bits_uop_flush_on_commit,
  input         io_lsu_io_iresp_bits_uop_ldst_is_rs1,
  input  [5:0]  io_lsu_io_iresp_bits_uop_ldst,
  input  [5:0]  io_lsu_io_iresp_bits_uop_lrs1,
  input  [5:0]  io_lsu_io_iresp_bits_uop_lrs2,
  input  [5:0]  io_lsu_io_iresp_bits_uop_lrs3,
  input         io_lsu_io_iresp_bits_uop_ldst_val,
  input  [1:0]  io_lsu_io_iresp_bits_uop_dst_rtype,
  input  [1:0]  io_lsu_io_iresp_bits_uop_lrs1_rtype,
  input  [1:0]  io_lsu_io_iresp_bits_uop_lrs2_rtype,
  input         io_lsu_io_iresp_bits_uop_frs3_en,
  input         io_lsu_io_iresp_bits_uop_fp_val,
  input         io_lsu_io_iresp_bits_uop_fp_single,
  input         io_lsu_io_iresp_bits_uop_xcpt_pf_if,
  input         io_lsu_io_iresp_bits_uop_xcpt_ae_if,
  input         io_lsu_io_iresp_bits_uop_xcpt_ma_if,
  input         io_lsu_io_iresp_bits_uop_bp_debug_if,
  input         io_lsu_io_iresp_bits_uop_bp_xcpt_if,
  input  [1:0]  io_lsu_io_iresp_bits_uop_debug_fsrc,
  input  [1:0]  io_lsu_io_iresp_bits_uop_debug_tsrc,
  input  [63:0] io_lsu_io_iresp_bits_data,
  input         io_lsu_io_iresp_bits_predicated,
  input         io_lsu_io_iresp_bits_fflags_valid,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_switch,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_switch_off,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_is_unicore,
  input  [2:0]  io_lsu_io_iresp_bits_fflags_bits_uop_shift,
  input  [1:0]  io_lsu_io_iresp_bits_fflags_bits_uop_lrs3_rtype,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_rflag,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_wflag,
  input  [3:0]  io_lsu_io_iresp_bits_fflags_bits_uop_prflag,
  input  [3:0]  io_lsu_io_iresp_bits_fflags_bits_uop_pwflag,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_pflag_busy,
  input  [3:0]  io_lsu_io_iresp_bits_fflags_bits_uop_stale_pflag,
  input  [3:0]  io_lsu_io_iresp_bits_fflags_bits_uop_op1_sel,
  input  [3:0]  io_lsu_io_iresp_bits_fflags_bits_uop_op2_sel,
  input  [5:0]  io_lsu_io_iresp_bits_fflags_bits_uop_split_num,
  input  [5:0]  io_lsu_io_iresp_bits_fflags_bits_uop_self_index,
  input  [5:0]  io_lsu_io_iresp_bits_fflags_bits_uop_rob_inst_idx,
  input  [5:0]  io_lsu_io_iresp_bits_fflags_bits_uop_address_num,
  input  [6:0]  io_lsu_io_iresp_bits_fflags_bits_uop_uopc,
  input  [31:0] io_lsu_io_iresp_bits_fflags_bits_uop_inst,
  input  [31:0] io_lsu_io_iresp_bits_fflags_bits_uop_debug_inst,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_lsu_io_iresp_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_lsu_io_iresp_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_lsu_io_iresp_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_is_load,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_lsu_io_iresp_bits_fflags_bits_uop_iw_state,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_is_br,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_is_jalr,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_is_jal,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_lsu_io_iresp_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_lsu_io_iresp_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_lsu_io_iresp_bits_fflags_bits_uop_ftq_idx,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_lsu_io_iresp_bits_fflags_bits_uop_pc_lob,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_taken,
  input  [19:0] io_lsu_io_iresp_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_lsu_io_iresp_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_lsu_io_iresp_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_lsu_io_iresp_bits_fflags_bits_uop_ldq_idx,
  input  [4:0]  io_lsu_io_iresp_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_lsu_io_iresp_bits_fflags_bits_uop_rxq_idx,
  input  [6:0]  io_lsu_io_iresp_bits_fflags_bits_uop_pdst,
  input  [6:0]  io_lsu_io_iresp_bits_fflags_bits_uop_prs1,
  input  [6:0]  io_lsu_io_iresp_bits_fflags_bits_uop_prs2,
  input  [6:0]  io_lsu_io_iresp_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_lsu_io_iresp_bits_fflags_bits_uop_ppred,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_prs1_busy,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_prs2_busy,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_prs3_busy,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_ppred_busy,
  input  [6:0]  io_lsu_io_iresp_bits_fflags_bits_uop_stale_pdst,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_exception,
  input  [63:0] io_lsu_io_iresp_bits_fflags_bits_uop_exc_cause,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_lsu_io_iresp_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_lsu_io_iresp_bits_fflags_bits_uop_mem_size,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_mem_signed,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_is_fence,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_is_fencei,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_is_amo,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_uses_ldq,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_uses_stq,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_is_unique,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_flush_on_commit,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_lsu_io_iresp_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_lsu_io_iresp_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_lsu_io_iresp_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_lsu_io_iresp_bits_fflags_bits_uop_lrs3,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_lsu_io_iresp_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_lsu_io_iresp_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_lsu_io_iresp_bits_fflags_bits_uop_lrs2_rtype,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_frs3_en,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_fp_val,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_fp_single,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_bp_debug_if,
  input         io_lsu_io_iresp_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_lsu_io_iresp_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_lsu_io_iresp_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_lsu_io_iresp_bits_fflags_bits_flags,
  input  [3:0]  io_lsu_io_iresp_bits_flagdata,
  input         io_lsu_io_iresp_bits_fflagdata_valid,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_switch,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_switch_off,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_is_unicore,
  input  [2:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_shift,
  input  [1:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs3_rtype,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_rflag,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_wflag,
  input  [3:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_prflag,
  input  [3:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_pwflag,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_pflag_busy,
  input  [3:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_stale_pflag,
  input  [3:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_op1_sel,
  input  [3:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_op2_sel,
  input  [5:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_split_num,
  input  [5:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_self_index,
  input  [5:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_rob_inst_idx,
  input  [5:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_address_num,
  input  [6:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_uopc,
  input  [31:0] io_lsu_io_iresp_bits_fflagdata_bits_uop_inst,
  input  [31:0] io_lsu_io_iresp_bits_fflagdata_bits_uop_debug_inst,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_is_rvc,
  input  [39:0] io_lsu_io_iresp_bits_fflagdata_bits_uop_debug_pc,
  input  [2:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_iq_type,
  input  [9:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_fu_code,
  input  [3:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_br_type,
  input  [1:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_op_fcn,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_is_load,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_is_sta,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_is_std,
  input  [1:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_iw_state,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_iw_p1_poisoned,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_iw_p2_poisoned,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_is_br,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_is_jalr,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_is_jal,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_is_sfb,
  input  [11:0] io_lsu_io_iresp_bits_fflagdata_bits_uop_br_mask,
  input  [3:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_br_tag,
  input  [4:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_ftq_idx,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_edge_inst,
  input  [5:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_pc_lob,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_taken,
  input  [19:0] io_lsu_io_iresp_bits_fflagdata_bits_uop_imm_packed,
  input  [11:0] io_lsu_io_iresp_bits_fflagdata_bits_uop_csr_addr,
  input  [5:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_rob_idx,
  input  [4:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_ldq_idx,
  input  [4:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_stq_idx,
  input  [1:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_rxq_idx,
  input  [6:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_pdst,
  input  [6:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_prs1,
  input  [6:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_prs2,
  input  [6:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_prs3,
  input  [4:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_ppred,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_prs1_busy,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_prs2_busy,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_prs3_busy,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_ppred_busy,
  input  [6:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_stale_pdst,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_exception,
  input  [63:0] io_lsu_io_iresp_bits_fflagdata_bits_uop_exc_cause,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_bypassable,
  input  [4:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_mem_cmd,
  input  [1:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_mem_size,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_mem_signed,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_is_fence,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_is_fencei,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_is_amo,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_uses_ldq,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_uses_stq,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_is_sys_pc2epc,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_is_unique,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_flush_on_commit,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_ldst_is_rs1,
  input  [5:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_ldst,
  input  [5:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs1,
  input  [5:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs2,
  input  [5:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs3,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_ldst_val,
  input  [1:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_dst_rtype,
  input  [1:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs1_rtype,
  input  [1:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs2_rtype,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_frs3_en,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_fp_val,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_fp_single,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_xcpt_pf_if,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_xcpt_ae_if,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_xcpt_ma_if,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_bp_debug_if,
  input         io_lsu_io_iresp_bits_fflagdata_bits_uop_bp_xcpt_if,
  input  [1:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_debug_fsrc,
  input  [1:0]  io_lsu_io_iresp_bits_fflagdata_bits_uop_debug_tsrc,
  input  [31:0] io_lsu_io_iresp_bits_fflagdata_bits_fflag,
  output        io_lsu_io_fresp_ready,
  input         io_lsu_io_fresp_valid,
  input         io_lsu_io_fresp_bits_uop_switch,
  input         io_lsu_io_fresp_bits_uop_switch_off,
  input         io_lsu_io_fresp_bits_uop_is_unicore,
  input  [2:0]  io_lsu_io_fresp_bits_uop_shift,
  input  [1:0]  io_lsu_io_fresp_bits_uop_lrs3_rtype,
  input         io_lsu_io_fresp_bits_uop_rflag,
  input         io_lsu_io_fresp_bits_uop_wflag,
  input  [3:0]  io_lsu_io_fresp_bits_uop_prflag,
  input  [3:0]  io_lsu_io_fresp_bits_uop_pwflag,
  input         io_lsu_io_fresp_bits_uop_pflag_busy,
  input  [3:0]  io_lsu_io_fresp_bits_uop_stale_pflag,
  input  [3:0]  io_lsu_io_fresp_bits_uop_op1_sel,
  input  [3:0]  io_lsu_io_fresp_bits_uop_op2_sel,
  input  [5:0]  io_lsu_io_fresp_bits_uop_split_num,
  input  [5:0]  io_lsu_io_fresp_bits_uop_self_index,
  input  [5:0]  io_lsu_io_fresp_bits_uop_rob_inst_idx,
  input  [5:0]  io_lsu_io_fresp_bits_uop_address_num,
  input  [6:0]  io_lsu_io_fresp_bits_uop_uopc,
  input  [31:0] io_lsu_io_fresp_bits_uop_inst,
  input  [31:0] io_lsu_io_fresp_bits_uop_debug_inst,
  input         io_lsu_io_fresp_bits_uop_is_rvc,
  input  [39:0] io_lsu_io_fresp_bits_uop_debug_pc,
  input  [2:0]  io_lsu_io_fresp_bits_uop_iq_type,
  input  [9:0]  io_lsu_io_fresp_bits_uop_fu_code,
  input  [3:0]  io_lsu_io_fresp_bits_uop_ctrl_br_type,
  input  [1:0]  io_lsu_io_fresp_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_lsu_io_fresp_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_lsu_io_fresp_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_lsu_io_fresp_bits_uop_ctrl_op_fcn,
  input         io_lsu_io_fresp_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_lsu_io_fresp_bits_uop_ctrl_csr_cmd,
  input         io_lsu_io_fresp_bits_uop_ctrl_is_load,
  input         io_lsu_io_fresp_bits_uop_ctrl_is_sta,
  input         io_lsu_io_fresp_bits_uop_ctrl_is_std,
  input  [1:0]  io_lsu_io_fresp_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_lsu_io_fresp_bits_uop_iw_state,
  input         io_lsu_io_fresp_bits_uop_iw_p1_poisoned,
  input         io_lsu_io_fresp_bits_uop_iw_p2_poisoned,
  input         io_lsu_io_fresp_bits_uop_is_br,
  input         io_lsu_io_fresp_bits_uop_is_jalr,
  input         io_lsu_io_fresp_bits_uop_is_jal,
  input         io_lsu_io_fresp_bits_uop_is_sfb,
  input  [11:0] io_lsu_io_fresp_bits_uop_br_mask,
  input  [3:0]  io_lsu_io_fresp_bits_uop_br_tag,
  input  [4:0]  io_lsu_io_fresp_bits_uop_ftq_idx,
  input         io_lsu_io_fresp_bits_uop_edge_inst,
  input  [5:0]  io_lsu_io_fresp_bits_uop_pc_lob,
  input         io_lsu_io_fresp_bits_uop_taken,
  input  [19:0] io_lsu_io_fresp_bits_uop_imm_packed,
  input  [11:0] io_lsu_io_fresp_bits_uop_csr_addr,
  input  [5:0]  io_lsu_io_fresp_bits_uop_rob_idx,
  input  [4:0]  io_lsu_io_fresp_bits_uop_ldq_idx,
  input  [4:0]  io_lsu_io_fresp_bits_uop_stq_idx,
  input  [1:0]  io_lsu_io_fresp_bits_uop_rxq_idx,
  input  [6:0]  io_lsu_io_fresp_bits_uop_pdst,
  input  [6:0]  io_lsu_io_fresp_bits_uop_prs1,
  input  [6:0]  io_lsu_io_fresp_bits_uop_prs2,
  input  [6:0]  io_lsu_io_fresp_bits_uop_prs3,
  input  [4:0]  io_lsu_io_fresp_bits_uop_ppred,
  input         io_lsu_io_fresp_bits_uop_prs1_busy,
  input         io_lsu_io_fresp_bits_uop_prs2_busy,
  input         io_lsu_io_fresp_bits_uop_prs3_busy,
  input         io_lsu_io_fresp_bits_uop_ppred_busy,
  input  [6:0]  io_lsu_io_fresp_bits_uop_stale_pdst,
  input         io_lsu_io_fresp_bits_uop_exception,
  input  [63:0] io_lsu_io_fresp_bits_uop_exc_cause,
  input         io_lsu_io_fresp_bits_uop_bypassable,
  input  [4:0]  io_lsu_io_fresp_bits_uop_mem_cmd,
  input  [1:0]  io_lsu_io_fresp_bits_uop_mem_size,
  input         io_lsu_io_fresp_bits_uop_mem_signed,
  input         io_lsu_io_fresp_bits_uop_is_fence,
  input         io_lsu_io_fresp_bits_uop_is_fencei,
  input         io_lsu_io_fresp_bits_uop_is_amo,
  input         io_lsu_io_fresp_bits_uop_uses_ldq,
  input         io_lsu_io_fresp_bits_uop_uses_stq,
  input         io_lsu_io_fresp_bits_uop_is_sys_pc2epc,
  input         io_lsu_io_fresp_bits_uop_is_unique,
  input         io_lsu_io_fresp_bits_uop_flush_on_commit,
  input         io_lsu_io_fresp_bits_uop_ldst_is_rs1,
  input  [5:0]  io_lsu_io_fresp_bits_uop_ldst,
  input  [5:0]  io_lsu_io_fresp_bits_uop_lrs1,
  input  [5:0]  io_lsu_io_fresp_bits_uop_lrs2,
  input  [5:0]  io_lsu_io_fresp_bits_uop_lrs3,
  input         io_lsu_io_fresp_bits_uop_ldst_val,
  input  [1:0]  io_lsu_io_fresp_bits_uop_dst_rtype,
  input  [1:0]  io_lsu_io_fresp_bits_uop_lrs1_rtype,
  input  [1:0]  io_lsu_io_fresp_bits_uop_lrs2_rtype,
  input         io_lsu_io_fresp_bits_uop_frs3_en,
  input         io_lsu_io_fresp_bits_uop_fp_val,
  input         io_lsu_io_fresp_bits_uop_fp_single,
  input         io_lsu_io_fresp_bits_uop_xcpt_pf_if,
  input         io_lsu_io_fresp_bits_uop_xcpt_ae_if,
  input         io_lsu_io_fresp_bits_uop_xcpt_ma_if,
  input         io_lsu_io_fresp_bits_uop_bp_debug_if,
  input         io_lsu_io_fresp_bits_uop_bp_xcpt_if,
  input  [1:0]  io_lsu_io_fresp_bits_uop_debug_fsrc,
  input  [1:0]  io_lsu_io_fresp_bits_uop_debug_tsrc,
  input  [64:0] io_lsu_io_fresp_bits_data,
  input         io_lsu_io_fresp_bits_predicated,
  input         io_lsu_io_fresp_bits_fflags_valid,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_switch,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_switch_off,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_is_unicore,
  input  [2:0]  io_lsu_io_fresp_bits_fflags_bits_uop_shift,
  input  [1:0]  io_lsu_io_fresp_bits_fflags_bits_uop_lrs3_rtype,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_rflag,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_wflag,
  input  [3:0]  io_lsu_io_fresp_bits_fflags_bits_uop_prflag,
  input  [3:0]  io_lsu_io_fresp_bits_fflags_bits_uop_pwflag,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_pflag_busy,
  input  [3:0]  io_lsu_io_fresp_bits_fflags_bits_uop_stale_pflag,
  input  [3:0]  io_lsu_io_fresp_bits_fflags_bits_uop_op1_sel,
  input  [3:0]  io_lsu_io_fresp_bits_fflags_bits_uop_op2_sel,
  input  [5:0]  io_lsu_io_fresp_bits_fflags_bits_uop_split_num,
  input  [5:0]  io_lsu_io_fresp_bits_fflags_bits_uop_self_index,
  input  [5:0]  io_lsu_io_fresp_bits_fflags_bits_uop_rob_inst_idx,
  input  [5:0]  io_lsu_io_fresp_bits_fflags_bits_uop_address_num,
  input  [6:0]  io_lsu_io_fresp_bits_fflags_bits_uop_uopc,
  input  [31:0] io_lsu_io_fresp_bits_fflags_bits_uop_inst,
  input  [31:0] io_lsu_io_fresp_bits_fflags_bits_uop_debug_inst,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_lsu_io_fresp_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_lsu_io_fresp_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_lsu_io_fresp_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_is_load,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_lsu_io_fresp_bits_fflags_bits_uop_iw_state,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_is_br,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_is_jalr,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_is_jal,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_lsu_io_fresp_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_lsu_io_fresp_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_lsu_io_fresp_bits_fflags_bits_uop_ftq_idx,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_lsu_io_fresp_bits_fflags_bits_uop_pc_lob,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_taken,
  input  [19:0] io_lsu_io_fresp_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_lsu_io_fresp_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_lsu_io_fresp_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_lsu_io_fresp_bits_fflags_bits_uop_ldq_idx,
  input  [4:0]  io_lsu_io_fresp_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_lsu_io_fresp_bits_fflags_bits_uop_rxq_idx,
  input  [6:0]  io_lsu_io_fresp_bits_fflags_bits_uop_pdst,
  input  [6:0]  io_lsu_io_fresp_bits_fflags_bits_uop_prs1,
  input  [6:0]  io_lsu_io_fresp_bits_fflags_bits_uop_prs2,
  input  [6:0]  io_lsu_io_fresp_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_lsu_io_fresp_bits_fflags_bits_uop_ppred,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_prs1_busy,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_prs2_busy,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_prs3_busy,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_ppred_busy,
  input  [6:0]  io_lsu_io_fresp_bits_fflags_bits_uop_stale_pdst,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_exception,
  input  [63:0] io_lsu_io_fresp_bits_fflags_bits_uop_exc_cause,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_lsu_io_fresp_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_lsu_io_fresp_bits_fflags_bits_uop_mem_size,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_mem_signed,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_is_fence,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_is_fencei,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_is_amo,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_uses_ldq,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_uses_stq,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_is_unique,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_flush_on_commit,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_lsu_io_fresp_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_lsu_io_fresp_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_lsu_io_fresp_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_lsu_io_fresp_bits_fflags_bits_uop_lrs3,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_lsu_io_fresp_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_lsu_io_fresp_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_lsu_io_fresp_bits_fflags_bits_uop_lrs2_rtype,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_frs3_en,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_fp_val,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_fp_single,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_bp_debug_if,
  input         io_lsu_io_fresp_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_lsu_io_fresp_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_lsu_io_fresp_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_lsu_io_fresp_bits_fflags_bits_flags,
  input  [3:0]  io_lsu_io_fresp_bits_flagdata,
  input         io_lsu_io_fresp_bits_fflagdata_valid,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_switch,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_switch_off,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_is_unicore,
  input  [2:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_shift,
  input  [1:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs3_rtype,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_rflag,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_wflag,
  input  [3:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_prflag,
  input  [3:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_pwflag,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_pflag_busy,
  input  [3:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_stale_pflag,
  input  [3:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_op1_sel,
  input  [3:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_op2_sel,
  input  [5:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_split_num,
  input  [5:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_self_index,
  input  [5:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_rob_inst_idx,
  input  [5:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_address_num,
  input  [6:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_uopc,
  input  [31:0] io_lsu_io_fresp_bits_fflagdata_bits_uop_inst,
  input  [31:0] io_lsu_io_fresp_bits_fflagdata_bits_uop_debug_inst,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_is_rvc,
  input  [39:0] io_lsu_io_fresp_bits_fflagdata_bits_uop_debug_pc,
  input  [2:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_iq_type,
  input  [9:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_fu_code,
  input  [3:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_br_type,
  input  [1:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_op_fcn,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_is_load,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_is_sta,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_is_std,
  input  [1:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_op3_sel,
  input  [1:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_iw_state,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_iw_p1_poisoned,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_iw_p2_poisoned,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_is_br,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_is_jalr,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_is_jal,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_is_sfb,
  input  [11:0] io_lsu_io_fresp_bits_fflagdata_bits_uop_br_mask,
  input  [3:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_br_tag,
  input  [4:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_ftq_idx,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_edge_inst,
  input  [5:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_pc_lob,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_taken,
  input  [19:0] io_lsu_io_fresp_bits_fflagdata_bits_uop_imm_packed,
  input  [11:0] io_lsu_io_fresp_bits_fflagdata_bits_uop_csr_addr,
  input  [5:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_rob_idx,
  input  [4:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_ldq_idx,
  input  [4:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_stq_idx,
  input  [1:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_rxq_idx,
  input  [6:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_pdst,
  input  [6:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_prs1,
  input  [6:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_prs2,
  input  [6:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_prs3,
  input  [4:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_ppred,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_prs1_busy,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_prs2_busy,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_prs3_busy,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_ppred_busy,
  input  [6:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_stale_pdst,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_exception,
  input  [63:0] io_lsu_io_fresp_bits_fflagdata_bits_uop_exc_cause,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_bypassable,
  input  [4:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_mem_cmd,
  input  [1:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_mem_size,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_mem_signed,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_is_fence,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_is_fencei,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_is_amo,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_uses_ldq,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_uses_stq,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_is_sys_pc2epc,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_is_unique,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_flush_on_commit,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_ldst_is_rs1,
  input  [5:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_ldst,
  input  [5:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs1,
  input  [5:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs2,
  input  [5:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs3,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_ldst_val,
  input  [1:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_dst_rtype,
  input  [1:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs1_rtype,
  input  [1:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs2_rtype,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_frs3_en,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_fp_val,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_fp_single,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_xcpt_pf_if,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_xcpt_ae_if,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_xcpt_ma_if,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_bp_debug_if,
  input         io_lsu_io_fresp_bits_fflagdata_bits_uop_bp_xcpt_if,
  input  [1:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_debug_fsrc,
  input  [1:0]  io_lsu_io_fresp_bits_fflagdata_bits_uop_debug_tsrc,
  input  [31:0] io_lsu_io_fresp_bits_fflagdata_bits_fflag,
  input         io_com_exception
);
  wire  MemAddrCalcUnit_clock; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_reset; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_ready; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_valid; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_switch; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_switch_off; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_is_unicore; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_req_bits_uop_shift; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_req_bits_uop_lrs3_rtype; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_rflag; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_wflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_req_bits_uop_prflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_req_bits_uop_pwflag; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_pflag_busy; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_req_bits_uop_stale_pflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_req_bits_uop_op1_sel; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_req_bits_uop_op2_sel; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_req_bits_uop_split_num; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_req_bits_uop_self_index; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_req_bits_uop_rob_inst_idx; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_req_bits_uop_address_num; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_req_bits_uop_uopc; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_req_bits_uop_inst; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_req_bits_uop_debug_inst; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_is_rvc; // @[execution-unit.scala 411:27]
  wire [39:0] MemAddrCalcUnit_io_req_bits_uop_debug_pc; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_req_bits_uop_iq_type; // @[execution-unit.scala 411:27]
  wire [9:0] MemAddrCalcUnit_io_req_bits_uop_fu_code; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_req_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_req_bits_uop_iw_state; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_is_br; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_is_jalr; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_is_jal; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_is_sfb; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_req_bits_uop_br_mask; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_req_bits_uop_br_tag; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_req_bits_uop_ftq_idx; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_edge_inst; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_req_bits_uop_pc_lob; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_taken; // @[execution-unit.scala 411:27]
  wire [19:0] MemAddrCalcUnit_io_req_bits_uop_imm_packed; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_req_bits_uop_csr_addr; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_req_bits_uop_rob_idx; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_req_bits_uop_ldq_idx; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_req_bits_uop_stq_idx; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_req_bits_uop_rxq_idx; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_req_bits_uop_pdst; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_req_bits_uop_prs1; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_req_bits_uop_prs2; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_req_bits_uop_prs3; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_req_bits_uop_ppred; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_prs1_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_prs2_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_prs3_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_ppred_busy; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_req_bits_uop_stale_pdst; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_exception; // @[execution-unit.scala 411:27]
  wire [63:0] MemAddrCalcUnit_io_req_bits_uop_exc_cause; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_bypassable; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_req_bits_uop_mem_cmd; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_req_bits_uop_mem_size; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_mem_signed; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_is_fence; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_is_fencei; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_is_amo; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_uses_ldq; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_uses_stq; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_is_unique; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_req_bits_uop_ldst; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_req_bits_uop_lrs1; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_req_bits_uop_lrs2; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_req_bits_uop_lrs3; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_ldst_val; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_req_bits_uop_dst_rtype; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_frs3_en; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_fp_val; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_fp_single; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 411:27]
  wire [64:0] MemAddrCalcUnit_io_req_bits_rs1_data; // @[execution-unit.scala 411:27]
  wire [64:0] MemAddrCalcUnit_io_req_bits_rs2_data; // @[execution-unit.scala 411:27]
  wire [64:0] MemAddrCalcUnit_io_req_bits_rs3_data; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_pred_data; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_req_bits_flagdata; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_req_bits_fflagdata; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_req_bits_kill; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_ready; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_valid; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_switch; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_switch_off; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_is_unicore; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_uop_shift; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_uop_lrs3_rtype; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_rflag; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_wflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_uop_prflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_uop_pwflag; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_pflag_busy; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_uop_stale_pflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_uop_op1_sel; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_uop_op2_sel; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_uop_split_num; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_uop_self_index; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_uop_rob_inst_idx; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_uop_address_num; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_uop_uopc; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_resp_bits_uop_inst; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_resp_bits_uop_debug_inst; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_is_rvc; // @[execution-unit.scala 411:27]
  wire [39:0] MemAddrCalcUnit_io_resp_bits_uop_debug_pc; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_uop_iq_type; // @[execution-unit.scala 411:27]
  wire [9:0] MemAddrCalcUnit_io_resp_bits_uop_fu_code; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_uop_ctrl_br_type; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_ctrl_is_load; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_ctrl_is_std; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_uop_iw_state; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_is_br; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_is_jalr; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_is_jal; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_is_sfb; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_resp_bits_uop_br_mask; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_uop_br_tag; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_uop_ftq_idx; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_edge_inst; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_uop_pc_lob; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_taken; // @[execution-unit.scala 411:27]
  wire [19:0] MemAddrCalcUnit_io_resp_bits_uop_imm_packed; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_resp_bits_uop_csr_addr; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_uop_rob_idx; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_uop_ldq_idx; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_uop_stq_idx; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_uop_rxq_idx; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_uop_pdst; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_uop_prs1; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_uop_prs2; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_uop_prs3; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_uop_ppred; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_prs1_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_prs2_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_prs3_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_ppred_busy; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_uop_stale_pdst; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_exception; // @[execution-unit.scala 411:27]
  wire [63:0] MemAddrCalcUnit_io_resp_bits_uop_exc_cause; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_bypassable; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_uop_mem_cmd; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_uop_mem_size; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_mem_signed; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_is_fence; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_is_fencei; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_is_amo; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_uses_ldq; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_uses_stq; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_is_unique; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_flush_on_commit; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_uop_ldst; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_uop_lrs1; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_uop_lrs2; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_uop_lrs3; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_ldst_val; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_uop_dst_rtype; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_uop_lrs1_rtype; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_uop_lrs2_rtype; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_frs3_en; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_fp_val; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_fp_single; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_bp_debug_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_uop_debug_fsrc; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_uop_debug_tsrc; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_predicated; // @[execution-unit.scala 411:27]
  wire [64:0] MemAddrCalcUnit_io_resp_bits_data; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_valid; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_switch; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_shift; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 411:27]
  wire [39:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 411:27]
  wire [9:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 411:27]
  wire [19:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 411:27]
  wire [63:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 411:27]
  wire [39:0] MemAddrCalcUnit_io_resp_bits_addr; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_mxcpt_valid; // @[execution-unit.scala 411:27]
  wire [16:0] MemAddrCalcUnit_io_resp_bits_mxcpt_bits; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_sfence_valid; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_sfence_bits_rs1; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_sfence_bits_rs2; // @[execution-unit.scala 411:27]
  wire [38:0] MemAddrCalcUnit_io_resp_bits_sfence_bits_addr; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_sfence_bits_asid; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_flagdata; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_valid; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 411:27]
  wire [39:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 411:27]
  wire [9:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 411:27]
  wire [19:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 411:27]
  wire [63:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_resp_bits_fflagdata_bits_fflag; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_brupdate_b1_resolve_mask; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_switch; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_switch_off; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_is_unicore; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_brupdate_b2_uop_shift; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_uop_lrs3_rtype; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_rflag; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_wflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_brupdate_b2_uop_prflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_brupdate_b2_uop_pwflag; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_pflag_busy; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_brupdate_b2_uop_stale_pflag; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_brupdate_b2_uop_op1_sel; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_brupdate_b2_uop_op2_sel; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_brupdate_b2_uop_split_num; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_brupdate_b2_uop_self_index; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_brupdate_b2_uop_rob_inst_idx; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_brupdate_b2_uop_address_num; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_brupdate_b2_uop_uopc; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_brupdate_b2_uop_inst; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 411:27]
  wire [39:0] MemAddrCalcUnit_io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 411:27]
  wire [9:0] MemAddrCalcUnit_io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op3_sel; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_is_br; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 411:27]
  wire [3:0] MemAddrCalcUnit_io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_taken; // @[execution-unit.scala 411:27]
  wire [19:0] MemAddrCalcUnit_io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 411:27]
  wire [11:0] MemAddrCalcUnit_io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_brupdate_b2_uop_pdst; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_brupdate_b2_uop_prs1; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_brupdate_b2_uop_prs2; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_brupdate_b2_uop_prs3; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_brupdate_b2_uop_ppred; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 411:27]
  wire [6:0] MemAddrCalcUnit_io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_exception; // @[execution-unit.scala 411:27]
  wire [63:0] MemAddrCalcUnit_io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 411:27]
  wire [4:0] MemAddrCalcUnit_io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_brupdate_b2_uop_ldst; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 411:27]
  wire [5:0] MemAddrCalcUnit_io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_valid; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_mispredict; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_brupdate_b2_taken; // @[execution-unit.scala 411:27]
  wire [2:0] MemAddrCalcUnit_io_brupdate_b2_cfi_type; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_brupdate_b2_pc_sel; // @[execution-unit.scala 411:27]
  wire [39:0] MemAddrCalcUnit_io_brupdate_b2_jalr_target; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_brupdate_b2_target_offset; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_debug; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_cease; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_wfi; // @[execution-unit.scala 411:27]
  wire [31:0] MemAddrCalcUnit_io_status_isa; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_status_dprv; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_status_prv; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_sd; // @[execution-unit.scala 411:27]
  wire [26:0] MemAddrCalcUnit_io_status_zero2; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_status_sxl; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_status_uxl; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_sd_rv32; // @[execution-unit.scala 411:27]
  wire [7:0] MemAddrCalcUnit_io_status_zero1; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_tsr; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_tw; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_tvm; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_mxr; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_sum; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_mprv; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_status_xs; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_status_fs; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_status_mpp; // @[execution-unit.scala 411:27]
  wire [1:0] MemAddrCalcUnit_io_status_vs; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_spp; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_mpie; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_hpie; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_spie; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_upie; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_mie; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_hie; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_sie; // @[execution-unit.scala 411:27]
  wire  MemAddrCalcUnit_io_status_uie; // @[execution-unit.scala 411:27]
  wire [9:0] _T_17 = io_req_bits_uop_fu_code & 10'h4; // @[micro-op.scala 189:40]
  wire  _T_18 = _T_17 != 10'h0; // @[micro-op.scala 189:47]
  MemAddrCalcUnit MemAddrCalcUnit ( // @[execution-unit.scala 411:27]
    .clock(MemAddrCalcUnit_clock),
    .reset(MemAddrCalcUnit_reset),
    .io_req_ready(MemAddrCalcUnit_io_req_ready),
    .io_req_valid(MemAddrCalcUnit_io_req_valid),
    .io_req_bits_uop_switch(MemAddrCalcUnit_io_req_bits_uop_switch),
    .io_req_bits_uop_switch_off(MemAddrCalcUnit_io_req_bits_uop_switch_off),
    .io_req_bits_uop_is_unicore(MemAddrCalcUnit_io_req_bits_uop_is_unicore),
    .io_req_bits_uop_shift(MemAddrCalcUnit_io_req_bits_uop_shift),
    .io_req_bits_uop_lrs3_rtype(MemAddrCalcUnit_io_req_bits_uop_lrs3_rtype),
    .io_req_bits_uop_rflag(MemAddrCalcUnit_io_req_bits_uop_rflag),
    .io_req_bits_uop_wflag(MemAddrCalcUnit_io_req_bits_uop_wflag),
    .io_req_bits_uop_prflag(MemAddrCalcUnit_io_req_bits_uop_prflag),
    .io_req_bits_uop_pwflag(MemAddrCalcUnit_io_req_bits_uop_pwflag),
    .io_req_bits_uop_pflag_busy(MemAddrCalcUnit_io_req_bits_uop_pflag_busy),
    .io_req_bits_uop_stale_pflag(MemAddrCalcUnit_io_req_bits_uop_stale_pflag),
    .io_req_bits_uop_op1_sel(MemAddrCalcUnit_io_req_bits_uop_op1_sel),
    .io_req_bits_uop_op2_sel(MemAddrCalcUnit_io_req_bits_uop_op2_sel),
    .io_req_bits_uop_split_num(MemAddrCalcUnit_io_req_bits_uop_split_num),
    .io_req_bits_uop_self_index(MemAddrCalcUnit_io_req_bits_uop_self_index),
    .io_req_bits_uop_rob_inst_idx(MemAddrCalcUnit_io_req_bits_uop_rob_inst_idx),
    .io_req_bits_uop_address_num(MemAddrCalcUnit_io_req_bits_uop_address_num),
    .io_req_bits_uop_uopc(MemAddrCalcUnit_io_req_bits_uop_uopc),
    .io_req_bits_uop_inst(MemAddrCalcUnit_io_req_bits_uop_inst),
    .io_req_bits_uop_debug_inst(MemAddrCalcUnit_io_req_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc(MemAddrCalcUnit_io_req_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc(MemAddrCalcUnit_io_req_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type(MemAddrCalcUnit_io_req_bits_uop_iq_type),
    .io_req_bits_uop_fu_code(MemAddrCalcUnit_io_req_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type(MemAddrCalcUnit_io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel(MemAddrCalcUnit_io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel(MemAddrCalcUnit_io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel(MemAddrCalcUnit_io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn(MemAddrCalcUnit_io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw(MemAddrCalcUnit_io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd(MemAddrCalcUnit_io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load(MemAddrCalcUnit_io_req_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta(MemAddrCalcUnit_io_req_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std(MemAddrCalcUnit_io_req_bits_uop_ctrl_is_std),
    .io_req_bits_uop_ctrl_op3_sel(MemAddrCalcUnit_io_req_bits_uop_ctrl_op3_sel),
    .io_req_bits_uop_iw_state(MemAddrCalcUnit_io_req_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned(MemAddrCalcUnit_io_req_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned(MemAddrCalcUnit_io_req_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br(MemAddrCalcUnit_io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr(MemAddrCalcUnit_io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal(MemAddrCalcUnit_io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb(MemAddrCalcUnit_io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask(MemAddrCalcUnit_io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag(MemAddrCalcUnit_io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx(MemAddrCalcUnit_io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst(MemAddrCalcUnit_io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob(MemAddrCalcUnit_io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken(MemAddrCalcUnit_io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed(MemAddrCalcUnit_io_req_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr(MemAddrCalcUnit_io_req_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx(MemAddrCalcUnit_io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx(MemAddrCalcUnit_io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx(MemAddrCalcUnit_io_req_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx(MemAddrCalcUnit_io_req_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst(MemAddrCalcUnit_io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1(MemAddrCalcUnit_io_req_bits_uop_prs1),
    .io_req_bits_uop_prs2(MemAddrCalcUnit_io_req_bits_uop_prs2),
    .io_req_bits_uop_prs3(MemAddrCalcUnit_io_req_bits_uop_prs3),
    .io_req_bits_uop_ppred(MemAddrCalcUnit_io_req_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy(MemAddrCalcUnit_io_req_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy(MemAddrCalcUnit_io_req_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy(MemAddrCalcUnit_io_req_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy(MemAddrCalcUnit_io_req_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst(MemAddrCalcUnit_io_req_bits_uop_stale_pdst),
    .io_req_bits_uop_exception(MemAddrCalcUnit_io_req_bits_uop_exception),
    .io_req_bits_uop_exc_cause(MemAddrCalcUnit_io_req_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable(MemAddrCalcUnit_io_req_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd(MemAddrCalcUnit_io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size(MemAddrCalcUnit_io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed(MemAddrCalcUnit_io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence(MemAddrCalcUnit_io_req_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei(MemAddrCalcUnit_io_req_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo(MemAddrCalcUnit_io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq(MemAddrCalcUnit_io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq(MemAddrCalcUnit_io_req_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc(MemAddrCalcUnit_io_req_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique(MemAddrCalcUnit_io_req_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit(MemAddrCalcUnit_io_req_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1(MemAddrCalcUnit_io_req_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst(MemAddrCalcUnit_io_req_bits_uop_ldst),
    .io_req_bits_uop_lrs1(MemAddrCalcUnit_io_req_bits_uop_lrs1),
    .io_req_bits_uop_lrs2(MemAddrCalcUnit_io_req_bits_uop_lrs2),
    .io_req_bits_uop_lrs3(MemAddrCalcUnit_io_req_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val(MemAddrCalcUnit_io_req_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype(MemAddrCalcUnit_io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype(MemAddrCalcUnit_io_req_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype(MemAddrCalcUnit_io_req_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en(MemAddrCalcUnit_io_req_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val(MemAddrCalcUnit_io_req_bits_uop_fp_val),
    .io_req_bits_uop_fp_single(MemAddrCalcUnit_io_req_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if(MemAddrCalcUnit_io_req_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if(MemAddrCalcUnit_io_req_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if(MemAddrCalcUnit_io_req_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if(MemAddrCalcUnit_io_req_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if(MemAddrCalcUnit_io_req_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc(MemAddrCalcUnit_io_req_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc(MemAddrCalcUnit_io_req_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data(MemAddrCalcUnit_io_req_bits_rs1_data),
    .io_req_bits_rs2_data(MemAddrCalcUnit_io_req_bits_rs2_data),
    .io_req_bits_rs3_data(MemAddrCalcUnit_io_req_bits_rs3_data),
    .io_req_bits_pred_data(MemAddrCalcUnit_io_req_bits_pred_data),
    .io_req_bits_flagdata(MemAddrCalcUnit_io_req_bits_flagdata),
    .io_req_bits_fflagdata(MemAddrCalcUnit_io_req_bits_fflagdata),
    .io_req_bits_kill(MemAddrCalcUnit_io_req_bits_kill),
    .io_resp_ready(MemAddrCalcUnit_io_resp_ready),
    .io_resp_valid(MemAddrCalcUnit_io_resp_valid),
    .io_resp_bits_uop_switch(MemAddrCalcUnit_io_resp_bits_uop_switch),
    .io_resp_bits_uop_switch_off(MemAddrCalcUnit_io_resp_bits_uop_switch_off),
    .io_resp_bits_uop_is_unicore(MemAddrCalcUnit_io_resp_bits_uop_is_unicore),
    .io_resp_bits_uop_shift(MemAddrCalcUnit_io_resp_bits_uop_shift),
    .io_resp_bits_uop_lrs3_rtype(MemAddrCalcUnit_io_resp_bits_uop_lrs3_rtype),
    .io_resp_bits_uop_rflag(MemAddrCalcUnit_io_resp_bits_uop_rflag),
    .io_resp_bits_uop_wflag(MemAddrCalcUnit_io_resp_bits_uop_wflag),
    .io_resp_bits_uop_prflag(MemAddrCalcUnit_io_resp_bits_uop_prflag),
    .io_resp_bits_uop_pwflag(MemAddrCalcUnit_io_resp_bits_uop_pwflag),
    .io_resp_bits_uop_pflag_busy(MemAddrCalcUnit_io_resp_bits_uop_pflag_busy),
    .io_resp_bits_uop_stale_pflag(MemAddrCalcUnit_io_resp_bits_uop_stale_pflag),
    .io_resp_bits_uop_op1_sel(MemAddrCalcUnit_io_resp_bits_uop_op1_sel),
    .io_resp_bits_uop_op2_sel(MemAddrCalcUnit_io_resp_bits_uop_op2_sel),
    .io_resp_bits_uop_split_num(MemAddrCalcUnit_io_resp_bits_uop_split_num),
    .io_resp_bits_uop_self_index(MemAddrCalcUnit_io_resp_bits_uop_self_index),
    .io_resp_bits_uop_rob_inst_idx(MemAddrCalcUnit_io_resp_bits_uop_rob_inst_idx),
    .io_resp_bits_uop_address_num(MemAddrCalcUnit_io_resp_bits_uop_address_num),
    .io_resp_bits_uop_uopc(MemAddrCalcUnit_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(MemAddrCalcUnit_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(MemAddrCalcUnit_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(MemAddrCalcUnit_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(MemAddrCalcUnit_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(MemAddrCalcUnit_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(MemAddrCalcUnit_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(MemAddrCalcUnit_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(MemAddrCalcUnit_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(MemAddrCalcUnit_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(MemAddrCalcUnit_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(MemAddrCalcUnit_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(MemAddrCalcUnit_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(MemAddrCalcUnit_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(MemAddrCalcUnit_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(MemAddrCalcUnit_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(MemAddrCalcUnit_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_ctrl_op3_sel(MemAddrCalcUnit_io_resp_bits_uop_ctrl_op3_sel),
    .io_resp_bits_uop_iw_state(MemAddrCalcUnit_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(MemAddrCalcUnit_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(MemAddrCalcUnit_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(MemAddrCalcUnit_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(MemAddrCalcUnit_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(MemAddrCalcUnit_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(MemAddrCalcUnit_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(MemAddrCalcUnit_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(MemAddrCalcUnit_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(MemAddrCalcUnit_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(MemAddrCalcUnit_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(MemAddrCalcUnit_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(MemAddrCalcUnit_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(MemAddrCalcUnit_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(MemAddrCalcUnit_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(MemAddrCalcUnit_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(MemAddrCalcUnit_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(MemAddrCalcUnit_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(MemAddrCalcUnit_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(MemAddrCalcUnit_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(MemAddrCalcUnit_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(MemAddrCalcUnit_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(MemAddrCalcUnit_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(MemAddrCalcUnit_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(MemAddrCalcUnit_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(MemAddrCalcUnit_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(MemAddrCalcUnit_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(MemAddrCalcUnit_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(MemAddrCalcUnit_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(MemAddrCalcUnit_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(MemAddrCalcUnit_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(MemAddrCalcUnit_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(MemAddrCalcUnit_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(MemAddrCalcUnit_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(MemAddrCalcUnit_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(MemAddrCalcUnit_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(MemAddrCalcUnit_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(MemAddrCalcUnit_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(MemAddrCalcUnit_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(MemAddrCalcUnit_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(MemAddrCalcUnit_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(MemAddrCalcUnit_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(MemAddrCalcUnit_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(MemAddrCalcUnit_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(MemAddrCalcUnit_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(MemAddrCalcUnit_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(MemAddrCalcUnit_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(MemAddrCalcUnit_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(MemAddrCalcUnit_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(MemAddrCalcUnit_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(MemAddrCalcUnit_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(MemAddrCalcUnit_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(MemAddrCalcUnit_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(MemAddrCalcUnit_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(MemAddrCalcUnit_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(MemAddrCalcUnit_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(MemAddrCalcUnit_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(MemAddrCalcUnit_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(MemAddrCalcUnit_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(MemAddrCalcUnit_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(MemAddrCalcUnit_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(MemAddrCalcUnit_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_predicated(MemAddrCalcUnit_io_resp_bits_predicated),
    .io_resp_bits_data(MemAddrCalcUnit_io_resp_bits_data),
    .io_resp_bits_fflags_valid(MemAddrCalcUnit_io_resp_bits_fflags_valid),
    .io_resp_bits_fflags_bits_uop_switch(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_switch),
    .io_resp_bits_fflags_bits_uop_switch_off(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_switch_off),
    .io_resp_bits_fflags_bits_uop_is_unicore(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_unicore),
    .io_resp_bits_fflags_bits_uop_shift(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_shift),
    .io_resp_bits_fflags_bits_uop_lrs3_rtype(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs3_rtype),
    .io_resp_bits_fflags_bits_uop_rflag(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rflag),
    .io_resp_bits_fflags_bits_uop_wflag(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_wflag),
    .io_resp_bits_fflags_bits_uop_prflag(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prflag),
    .io_resp_bits_fflags_bits_uop_pwflag(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pwflag),
    .io_resp_bits_fflags_bits_uop_pflag_busy(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pflag_busy),
    .io_resp_bits_fflags_bits_uop_stale_pflag(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_stale_pflag),
    .io_resp_bits_fflags_bits_uop_op1_sel(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_op1_sel),
    .io_resp_bits_fflags_bits_uop_op2_sel(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_op2_sel),
    .io_resp_bits_fflags_bits_uop_split_num(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_split_num),
    .io_resp_bits_fflags_bits_uop_self_index(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_self_index),
    .io_resp_bits_fflags_bits_uop_rob_inst_idx(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rob_inst_idx),
    .io_resp_bits_fflags_bits_uop_address_num(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_address_num),
    .io_resp_bits_fflags_bits_uop_uopc(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_uopc),
    .io_resp_bits_fflags_bits_uop_inst(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_inst),
    .io_resp_bits_fflags_bits_uop_debug_inst(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_resp_bits_fflags_bits_uop_is_rvc(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_resp_bits_fflags_bits_uop_debug_pc(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_resp_bits_fflags_bits_uop_iq_type(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iq_type),
    .io_resp_bits_fflags_bits_uop_fu_code(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_fu_code),
    .io_resp_bits_fflags_bits_uop_ctrl_br_type(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_resp_bits_fflags_bits_uop_ctrl_op1_sel(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op2_sel(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_imm_sel(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op_fcn(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflags_bits_uop_ctrl_fcn_dw(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflags_bits_uop_ctrl_csr_cmd(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflags_bits_uop_ctrl_is_load(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_resp_bits_fflags_bits_uop_ctrl_is_sta(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflags_bits_uop_ctrl_is_std(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_resp_bits_fflags_bits_uop_ctrl_op3_sel(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op3_sel),
    .io_resp_bits_fflags_bits_uop_iw_state(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iw_state),
    .io_resp_bits_fflags_bits_uop_iw_p1_poisoned(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflags_bits_uop_iw_p2_poisoned(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflags_bits_uop_is_br(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_br),
    .io_resp_bits_fflags_bits_uop_is_jalr(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_resp_bits_fflags_bits_uop_is_jal(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_jal),
    .io_resp_bits_fflags_bits_uop_is_sfb(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_resp_bits_fflags_bits_uop_br_mask(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_br_mask),
    .io_resp_bits_fflags_bits_uop_br_tag(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_br_tag),
    .io_resp_bits_fflags_bits_uop_ftq_idx(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_resp_bits_fflags_bits_uop_edge_inst(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_resp_bits_fflags_bits_uop_pc_lob(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_resp_bits_fflags_bits_uop_taken(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_taken),
    .io_resp_bits_fflags_bits_uop_imm_packed(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_resp_bits_fflags_bits_uop_csr_addr(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_resp_bits_fflags_bits_uop_rob_idx(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_resp_bits_fflags_bits_uop_ldq_idx(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_resp_bits_fflags_bits_uop_stq_idx(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_resp_bits_fflags_bits_uop_rxq_idx(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_resp_bits_fflags_bits_uop_pdst(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pdst),
    .io_resp_bits_fflags_bits_uop_prs1(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs1),
    .io_resp_bits_fflags_bits_uop_prs2(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs2),
    .io_resp_bits_fflags_bits_uop_prs3(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs3),
    .io_resp_bits_fflags_bits_uop_ppred(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ppred),
    .io_resp_bits_fflags_bits_uop_prs1_busy(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_resp_bits_fflags_bits_uop_prs2_busy(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_resp_bits_fflags_bits_uop_prs3_busy(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_resp_bits_fflags_bits_uop_ppred_busy(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_resp_bits_fflags_bits_uop_stale_pdst(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_resp_bits_fflags_bits_uop_exception(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_exception),
    .io_resp_bits_fflags_bits_uop_exc_cause(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_resp_bits_fflags_bits_uop_bypassable(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_bypassable),
    .io_resp_bits_fflags_bits_uop_mem_cmd(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_resp_bits_fflags_bits_uop_mem_size(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_mem_size),
    .io_resp_bits_fflags_bits_uop_mem_signed(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_resp_bits_fflags_bits_uop_is_fence(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_fence),
    .io_resp_bits_fflags_bits_uop_is_fencei(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_resp_bits_fflags_bits_uop_is_amo(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_amo),
    .io_resp_bits_fflags_bits_uop_uses_ldq(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_resp_bits_fflags_bits_uop_uses_stq(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_resp_bits_fflags_bits_uop_is_sys_pc2epc(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflags_bits_uop_is_unique(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_unique),
    .io_resp_bits_fflags_bits_uop_flush_on_commit(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_resp_bits_fflags_bits_uop_ldst_is_rs1(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflags_bits_uop_ldst(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldst),
    .io_resp_bits_fflags_bits_uop_lrs1(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs1),
    .io_resp_bits_fflags_bits_uop_lrs2(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs2),
    .io_resp_bits_fflags_bits_uop_lrs3(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs3),
    .io_resp_bits_fflags_bits_uop_ldst_val(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_resp_bits_fflags_bits_uop_dst_rtype(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_resp_bits_fflags_bits_uop_lrs1_rtype(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_resp_bits_fflags_bits_uop_lrs2_rtype(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_resp_bits_fflags_bits_uop_frs3_en(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_resp_bits_fflags_bits_uop_fp_val(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_fp_val),
    .io_resp_bits_fflags_bits_uop_fp_single(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_fp_single),
    .io_resp_bits_fflags_bits_uop_xcpt_pf_if(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ae_if(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ma_if(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflags_bits_uop_bp_debug_if(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_resp_bits_fflags_bits_uop_bp_xcpt_if(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflags_bits_uop_debug_fsrc(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_resp_bits_fflags_bits_uop_debug_tsrc(MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_resp_bits_fflags_bits_flags(MemAddrCalcUnit_io_resp_bits_fflags_bits_flags),
    .io_resp_bits_addr(MemAddrCalcUnit_io_resp_bits_addr),
    .io_resp_bits_mxcpt_valid(MemAddrCalcUnit_io_resp_bits_mxcpt_valid),
    .io_resp_bits_mxcpt_bits(MemAddrCalcUnit_io_resp_bits_mxcpt_bits),
    .io_resp_bits_sfence_valid(MemAddrCalcUnit_io_resp_bits_sfence_valid),
    .io_resp_bits_sfence_bits_rs1(MemAddrCalcUnit_io_resp_bits_sfence_bits_rs1),
    .io_resp_bits_sfence_bits_rs2(MemAddrCalcUnit_io_resp_bits_sfence_bits_rs2),
    .io_resp_bits_sfence_bits_addr(MemAddrCalcUnit_io_resp_bits_sfence_bits_addr),
    .io_resp_bits_sfence_bits_asid(MemAddrCalcUnit_io_resp_bits_sfence_bits_asid),
    .io_resp_bits_flagdata(MemAddrCalcUnit_io_resp_bits_flagdata),
    .io_resp_bits_fflagdata_valid(MemAddrCalcUnit_io_resp_bits_fflagdata_valid),
    .io_resp_bits_fflagdata_bits_uop_switch(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_switch),
    .io_resp_bits_fflagdata_bits_uop_switch_off(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_switch_off),
    .io_resp_bits_fflagdata_bits_uop_is_unicore(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_unicore),
    .io_resp_bits_fflagdata_bits_uop_shift(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_shift),
    .io_resp_bits_fflagdata_bits_uop_lrs3_rtype(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs3_rtype),
    .io_resp_bits_fflagdata_bits_uop_rflag(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rflag),
    .io_resp_bits_fflagdata_bits_uop_wflag(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_wflag),
    .io_resp_bits_fflagdata_bits_uop_prflag(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prflag),
    .io_resp_bits_fflagdata_bits_uop_pwflag(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pwflag),
    .io_resp_bits_fflagdata_bits_uop_pflag_busy(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pflag_busy),
    .io_resp_bits_fflagdata_bits_uop_stale_pflag(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_stale_pflag),
    .io_resp_bits_fflagdata_bits_uop_op1_sel(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_op1_sel),
    .io_resp_bits_fflagdata_bits_uop_op2_sel(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_op2_sel),
    .io_resp_bits_fflagdata_bits_uop_split_num(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_split_num),
    .io_resp_bits_fflagdata_bits_uop_self_index(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_self_index),
    .io_resp_bits_fflagdata_bits_uop_rob_inst_idx(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rob_inst_idx),
    .io_resp_bits_fflagdata_bits_uop_address_num(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_address_num),
    .io_resp_bits_fflagdata_bits_uop_uopc(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_uopc),
    .io_resp_bits_fflagdata_bits_uop_inst(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_inst),
    .io_resp_bits_fflagdata_bits_uop_debug_inst(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_inst),
    .io_resp_bits_fflagdata_bits_uop_is_rvc(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_rvc),
    .io_resp_bits_fflagdata_bits_uop_debug_pc(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_pc),
    .io_resp_bits_fflagdata_bits_uop_iq_type(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iq_type),
    .io_resp_bits_fflagdata_bits_uop_fu_code(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_fu_code),
    .io_resp_bits_fflagdata_bits_uop_ctrl_br_type(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_br_type),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_load(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_is_load),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_sta(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_std(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_is_std),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel),
    .io_resp_bits_fflagdata_bits_uop_iw_state(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iw_state),
    .io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflagdata_bits_uop_is_br(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_br),
    .io_resp_bits_fflagdata_bits_uop_is_jalr(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_jalr),
    .io_resp_bits_fflagdata_bits_uop_is_jal(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_jal),
    .io_resp_bits_fflagdata_bits_uop_is_sfb(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_sfb),
    .io_resp_bits_fflagdata_bits_uop_br_mask(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_br_mask),
    .io_resp_bits_fflagdata_bits_uop_br_tag(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_br_tag),
    .io_resp_bits_fflagdata_bits_uop_ftq_idx(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ftq_idx),
    .io_resp_bits_fflagdata_bits_uop_edge_inst(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_edge_inst),
    .io_resp_bits_fflagdata_bits_uop_pc_lob(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pc_lob),
    .io_resp_bits_fflagdata_bits_uop_taken(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_taken),
    .io_resp_bits_fflagdata_bits_uop_imm_packed(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_imm_packed),
    .io_resp_bits_fflagdata_bits_uop_csr_addr(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_csr_addr),
    .io_resp_bits_fflagdata_bits_uop_rob_idx(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rob_idx),
    .io_resp_bits_fflagdata_bits_uop_ldq_idx(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldq_idx),
    .io_resp_bits_fflagdata_bits_uop_stq_idx(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_stq_idx),
    .io_resp_bits_fflagdata_bits_uop_rxq_idx(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rxq_idx),
    .io_resp_bits_fflagdata_bits_uop_pdst(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pdst),
    .io_resp_bits_fflagdata_bits_uop_prs1(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs1),
    .io_resp_bits_fflagdata_bits_uop_prs2(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs2),
    .io_resp_bits_fflagdata_bits_uop_prs3(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs3),
    .io_resp_bits_fflagdata_bits_uop_ppred(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ppred),
    .io_resp_bits_fflagdata_bits_uop_prs1_busy(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs1_busy),
    .io_resp_bits_fflagdata_bits_uop_prs2_busy(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs2_busy),
    .io_resp_bits_fflagdata_bits_uop_prs3_busy(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs3_busy),
    .io_resp_bits_fflagdata_bits_uop_ppred_busy(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ppred_busy),
    .io_resp_bits_fflagdata_bits_uop_stale_pdst(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_stale_pdst),
    .io_resp_bits_fflagdata_bits_uop_exception(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_exception),
    .io_resp_bits_fflagdata_bits_uop_exc_cause(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_exc_cause),
    .io_resp_bits_fflagdata_bits_uop_bypassable(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_bypassable),
    .io_resp_bits_fflagdata_bits_uop_mem_cmd(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_mem_cmd),
    .io_resp_bits_fflagdata_bits_uop_mem_size(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_mem_size),
    .io_resp_bits_fflagdata_bits_uop_mem_signed(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_mem_signed),
    .io_resp_bits_fflagdata_bits_uop_is_fence(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_fence),
    .io_resp_bits_fflagdata_bits_uop_is_fencei(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_fencei),
    .io_resp_bits_fflagdata_bits_uop_is_amo(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_amo),
    .io_resp_bits_fflagdata_bits_uop_uses_ldq(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_uses_ldq),
    .io_resp_bits_fflagdata_bits_uop_uses_stq(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_uses_stq),
    .io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflagdata_bits_uop_is_unique(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_unique),
    .io_resp_bits_fflagdata_bits_uop_flush_on_commit(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_flush_on_commit),
    .io_resp_bits_fflagdata_bits_uop_ldst_is_rs1(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflagdata_bits_uop_ldst(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldst),
    .io_resp_bits_fflagdata_bits_uop_lrs1(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs1),
    .io_resp_bits_fflagdata_bits_uop_lrs2(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs2),
    .io_resp_bits_fflagdata_bits_uop_lrs3(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs3),
    .io_resp_bits_fflagdata_bits_uop_ldst_val(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldst_val),
    .io_resp_bits_fflagdata_bits_uop_dst_rtype(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_dst_rtype),
    .io_resp_bits_fflagdata_bits_uop_lrs1_rtype(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs1_rtype),
    .io_resp_bits_fflagdata_bits_uop_lrs2_rtype(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs2_rtype),
    .io_resp_bits_fflagdata_bits_uop_frs3_en(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_frs3_en),
    .io_resp_bits_fflagdata_bits_uop_fp_val(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_fp_val),
    .io_resp_bits_fflagdata_bits_uop_fp_single(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_fp_single),
    .io_resp_bits_fflagdata_bits_uop_xcpt_pf_if(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflagdata_bits_uop_xcpt_ae_if(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflagdata_bits_uop_xcpt_ma_if(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflagdata_bits_uop_bp_debug_if(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_bp_debug_if),
    .io_resp_bits_fflagdata_bits_uop_bp_xcpt_if(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflagdata_bits_uop_debug_fsrc(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_fsrc),
    .io_resp_bits_fflagdata_bits_uop_debug_tsrc(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_tsrc),
    .io_resp_bits_fflagdata_bits_fflag(MemAddrCalcUnit_io_resp_bits_fflagdata_bits_fflag),
    .io_brupdate_b1_resolve_mask(MemAddrCalcUnit_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(MemAddrCalcUnit_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_switch(MemAddrCalcUnit_io_brupdate_b2_uop_switch),
    .io_brupdate_b2_uop_switch_off(MemAddrCalcUnit_io_brupdate_b2_uop_switch_off),
    .io_brupdate_b2_uop_is_unicore(MemAddrCalcUnit_io_brupdate_b2_uop_is_unicore),
    .io_brupdate_b2_uop_shift(MemAddrCalcUnit_io_brupdate_b2_uop_shift),
    .io_brupdate_b2_uop_lrs3_rtype(MemAddrCalcUnit_io_brupdate_b2_uop_lrs3_rtype),
    .io_brupdate_b2_uop_rflag(MemAddrCalcUnit_io_brupdate_b2_uop_rflag),
    .io_brupdate_b2_uop_wflag(MemAddrCalcUnit_io_brupdate_b2_uop_wflag),
    .io_brupdate_b2_uop_prflag(MemAddrCalcUnit_io_brupdate_b2_uop_prflag),
    .io_brupdate_b2_uop_pwflag(MemAddrCalcUnit_io_brupdate_b2_uop_pwflag),
    .io_brupdate_b2_uop_pflag_busy(MemAddrCalcUnit_io_brupdate_b2_uop_pflag_busy),
    .io_brupdate_b2_uop_stale_pflag(MemAddrCalcUnit_io_brupdate_b2_uop_stale_pflag),
    .io_brupdate_b2_uop_op1_sel(MemAddrCalcUnit_io_brupdate_b2_uop_op1_sel),
    .io_brupdate_b2_uop_op2_sel(MemAddrCalcUnit_io_brupdate_b2_uop_op2_sel),
    .io_brupdate_b2_uop_split_num(MemAddrCalcUnit_io_brupdate_b2_uop_split_num),
    .io_brupdate_b2_uop_self_index(MemAddrCalcUnit_io_brupdate_b2_uop_self_index),
    .io_brupdate_b2_uop_rob_inst_idx(MemAddrCalcUnit_io_brupdate_b2_uop_rob_inst_idx),
    .io_brupdate_b2_uop_address_num(MemAddrCalcUnit_io_brupdate_b2_uop_address_num),
    .io_brupdate_b2_uop_uopc(MemAddrCalcUnit_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(MemAddrCalcUnit_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(MemAddrCalcUnit_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(MemAddrCalcUnit_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(MemAddrCalcUnit_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(MemAddrCalcUnit_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(MemAddrCalcUnit_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_ctrl_op3_sel(MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op3_sel),
    .io_brupdate_b2_uop_iw_state(MemAddrCalcUnit_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(MemAddrCalcUnit_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(MemAddrCalcUnit_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(MemAddrCalcUnit_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(MemAddrCalcUnit_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(MemAddrCalcUnit_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(MemAddrCalcUnit_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(MemAddrCalcUnit_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(MemAddrCalcUnit_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(MemAddrCalcUnit_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(MemAddrCalcUnit_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(MemAddrCalcUnit_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(MemAddrCalcUnit_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(MemAddrCalcUnit_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(MemAddrCalcUnit_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(MemAddrCalcUnit_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(MemAddrCalcUnit_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(MemAddrCalcUnit_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(MemAddrCalcUnit_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(MemAddrCalcUnit_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(MemAddrCalcUnit_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(MemAddrCalcUnit_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(MemAddrCalcUnit_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(MemAddrCalcUnit_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(MemAddrCalcUnit_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(MemAddrCalcUnit_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(MemAddrCalcUnit_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(MemAddrCalcUnit_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(MemAddrCalcUnit_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(MemAddrCalcUnit_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(MemAddrCalcUnit_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(MemAddrCalcUnit_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(MemAddrCalcUnit_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(MemAddrCalcUnit_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(MemAddrCalcUnit_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(MemAddrCalcUnit_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(MemAddrCalcUnit_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(MemAddrCalcUnit_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(MemAddrCalcUnit_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(MemAddrCalcUnit_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(MemAddrCalcUnit_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(MemAddrCalcUnit_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(MemAddrCalcUnit_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(MemAddrCalcUnit_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(MemAddrCalcUnit_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(MemAddrCalcUnit_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(MemAddrCalcUnit_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(MemAddrCalcUnit_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(MemAddrCalcUnit_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(MemAddrCalcUnit_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(MemAddrCalcUnit_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(MemAddrCalcUnit_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(MemAddrCalcUnit_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(MemAddrCalcUnit_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(MemAddrCalcUnit_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(MemAddrCalcUnit_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(MemAddrCalcUnit_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(MemAddrCalcUnit_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(MemAddrCalcUnit_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(MemAddrCalcUnit_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(MemAddrCalcUnit_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(MemAddrCalcUnit_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(MemAddrCalcUnit_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(MemAddrCalcUnit_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(MemAddrCalcUnit_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(MemAddrCalcUnit_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(MemAddrCalcUnit_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(MemAddrCalcUnit_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(MemAddrCalcUnit_io_brupdate_b2_target_offset),
    .io_status_debug(MemAddrCalcUnit_io_status_debug),
    .io_status_cease(MemAddrCalcUnit_io_status_cease),
    .io_status_wfi(MemAddrCalcUnit_io_status_wfi),
    .io_status_isa(MemAddrCalcUnit_io_status_isa),
    .io_status_dprv(MemAddrCalcUnit_io_status_dprv),
    .io_status_prv(MemAddrCalcUnit_io_status_prv),
    .io_status_sd(MemAddrCalcUnit_io_status_sd),
    .io_status_zero2(MemAddrCalcUnit_io_status_zero2),
    .io_status_sxl(MemAddrCalcUnit_io_status_sxl),
    .io_status_uxl(MemAddrCalcUnit_io_status_uxl),
    .io_status_sd_rv32(MemAddrCalcUnit_io_status_sd_rv32),
    .io_status_zero1(MemAddrCalcUnit_io_status_zero1),
    .io_status_tsr(MemAddrCalcUnit_io_status_tsr),
    .io_status_tw(MemAddrCalcUnit_io_status_tw),
    .io_status_tvm(MemAddrCalcUnit_io_status_tvm),
    .io_status_mxr(MemAddrCalcUnit_io_status_mxr),
    .io_status_sum(MemAddrCalcUnit_io_status_sum),
    .io_status_mprv(MemAddrCalcUnit_io_status_mprv),
    .io_status_xs(MemAddrCalcUnit_io_status_xs),
    .io_status_fs(MemAddrCalcUnit_io_status_fs),
    .io_status_mpp(MemAddrCalcUnit_io_status_mpp),
    .io_status_vs(MemAddrCalcUnit_io_status_vs),
    .io_status_spp(MemAddrCalcUnit_io_status_spp),
    .io_status_mpie(MemAddrCalcUnit_io_status_mpie),
    .io_status_hpie(MemAddrCalcUnit_io_status_hpie),
    .io_status_spie(MemAddrCalcUnit_io_status_spie),
    .io_status_upie(MemAddrCalcUnit_io_status_upie),
    .io_status_mie(MemAddrCalcUnit_io_status_mie),
    .io_status_hie(MemAddrCalcUnit_io_status_hie),
    .io_status_sie(MemAddrCalcUnit_io_status_sie),
    .io_status_uie(MemAddrCalcUnit_io_status_uie)
  );
  assign io_fu_types = 10'h4; // @[execution-unit.scala 270:60]
  assign io_req_ready = MemAddrCalcUnit_io_req_ready; // @[execution-unit.scala 412:29]
  assign io_ll_iresp_valid = io_lsu_io_iresp_valid; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_switch = io_lsu_io_iresp_bits_uop_switch; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_switch_off = io_lsu_io_iresp_bits_uop_switch_off; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_is_unicore = io_lsu_io_iresp_bits_uop_is_unicore; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_shift = io_lsu_io_iresp_bits_uop_shift; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_lrs3_rtype = io_lsu_io_iresp_bits_uop_lrs3_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_rflag = io_lsu_io_iresp_bits_uop_rflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_wflag = io_lsu_io_iresp_bits_uop_wflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_prflag = io_lsu_io_iresp_bits_uop_prflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_pwflag = io_lsu_io_iresp_bits_uop_pwflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_pflag_busy = io_lsu_io_iresp_bits_uop_pflag_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_stale_pflag = io_lsu_io_iresp_bits_uop_stale_pflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_op1_sel = io_lsu_io_iresp_bits_uop_op1_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_op2_sel = io_lsu_io_iresp_bits_uop_op2_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_split_num = io_lsu_io_iresp_bits_uop_split_num; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_self_index = io_lsu_io_iresp_bits_uop_self_index; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_rob_inst_idx = io_lsu_io_iresp_bits_uop_rob_inst_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_address_num = io_lsu_io_iresp_bits_uop_address_num; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_uopc = io_lsu_io_iresp_bits_uop_uopc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_inst = io_lsu_io_iresp_bits_uop_inst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_debug_inst = io_lsu_io_iresp_bits_uop_debug_inst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_is_rvc = io_lsu_io_iresp_bits_uop_is_rvc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_debug_pc = io_lsu_io_iresp_bits_uop_debug_pc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_iq_type = io_lsu_io_iresp_bits_uop_iq_type; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_fu_code = io_lsu_io_iresp_bits_uop_fu_code; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ctrl_br_type = io_lsu_io_iresp_bits_uop_ctrl_br_type; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ctrl_op1_sel = io_lsu_io_iresp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ctrl_op2_sel = io_lsu_io_iresp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ctrl_imm_sel = io_lsu_io_iresp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ctrl_op_fcn = io_lsu_io_iresp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ctrl_fcn_dw = io_lsu_io_iresp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ctrl_csr_cmd = io_lsu_io_iresp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ctrl_is_load = io_lsu_io_iresp_bits_uop_ctrl_is_load; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ctrl_is_sta = io_lsu_io_iresp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ctrl_is_std = io_lsu_io_iresp_bits_uop_ctrl_is_std; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ctrl_op3_sel = io_lsu_io_iresp_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_iw_state = io_lsu_io_iresp_bits_uop_iw_state; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_iw_p1_poisoned = io_lsu_io_iresp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_iw_p2_poisoned = io_lsu_io_iresp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_is_br = io_lsu_io_iresp_bits_uop_is_br; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_is_jalr = io_lsu_io_iresp_bits_uop_is_jalr; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_is_jal = io_lsu_io_iresp_bits_uop_is_jal; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_is_sfb = io_lsu_io_iresp_bits_uop_is_sfb; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_br_mask = io_lsu_io_iresp_bits_uop_br_mask; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_br_tag = io_lsu_io_iresp_bits_uop_br_tag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ftq_idx = io_lsu_io_iresp_bits_uop_ftq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_edge_inst = io_lsu_io_iresp_bits_uop_edge_inst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_pc_lob = io_lsu_io_iresp_bits_uop_pc_lob; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_taken = io_lsu_io_iresp_bits_uop_taken; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_imm_packed = io_lsu_io_iresp_bits_uop_imm_packed; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_csr_addr = io_lsu_io_iresp_bits_uop_csr_addr; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_rob_idx = io_lsu_io_iresp_bits_uop_rob_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ldq_idx = io_lsu_io_iresp_bits_uop_ldq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_stq_idx = io_lsu_io_iresp_bits_uop_stq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_rxq_idx = io_lsu_io_iresp_bits_uop_rxq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_pdst = io_lsu_io_iresp_bits_uop_pdst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_prs1 = io_lsu_io_iresp_bits_uop_prs1; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_prs2 = io_lsu_io_iresp_bits_uop_prs2; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_prs3 = io_lsu_io_iresp_bits_uop_prs3; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ppred = io_lsu_io_iresp_bits_uop_ppred; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_prs1_busy = io_lsu_io_iresp_bits_uop_prs1_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_prs2_busy = io_lsu_io_iresp_bits_uop_prs2_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_prs3_busy = io_lsu_io_iresp_bits_uop_prs3_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ppred_busy = io_lsu_io_iresp_bits_uop_ppred_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_stale_pdst = io_lsu_io_iresp_bits_uop_stale_pdst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_exception = io_lsu_io_iresp_bits_uop_exception; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_exc_cause = io_lsu_io_iresp_bits_uop_exc_cause; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_bypassable = io_lsu_io_iresp_bits_uop_bypassable; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_mem_cmd = io_lsu_io_iresp_bits_uop_mem_cmd; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_mem_size = io_lsu_io_iresp_bits_uop_mem_size; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_mem_signed = io_lsu_io_iresp_bits_uop_mem_signed; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_is_fence = io_lsu_io_iresp_bits_uop_is_fence; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_is_fencei = io_lsu_io_iresp_bits_uop_is_fencei; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_is_amo = io_lsu_io_iresp_bits_uop_is_amo; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_uses_ldq = io_lsu_io_iresp_bits_uop_uses_ldq; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_uses_stq = io_lsu_io_iresp_bits_uop_uses_stq; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_is_sys_pc2epc = io_lsu_io_iresp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_is_unique = io_lsu_io_iresp_bits_uop_is_unique; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_flush_on_commit = io_lsu_io_iresp_bits_uop_flush_on_commit; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ldst_is_rs1 = io_lsu_io_iresp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ldst = io_lsu_io_iresp_bits_uop_ldst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_lrs1 = io_lsu_io_iresp_bits_uop_lrs1; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_lrs2 = io_lsu_io_iresp_bits_uop_lrs2; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_lrs3 = io_lsu_io_iresp_bits_uop_lrs3; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_ldst_val = io_lsu_io_iresp_bits_uop_ldst_val; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_dst_rtype = io_lsu_io_iresp_bits_uop_dst_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_lrs1_rtype = io_lsu_io_iresp_bits_uop_lrs1_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_lrs2_rtype = io_lsu_io_iresp_bits_uop_lrs2_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_frs3_en = io_lsu_io_iresp_bits_uop_frs3_en; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_fp_val = io_lsu_io_iresp_bits_uop_fp_val; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_fp_single = io_lsu_io_iresp_bits_uop_fp_single; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_xcpt_pf_if = io_lsu_io_iresp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_xcpt_ae_if = io_lsu_io_iresp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_xcpt_ma_if = io_lsu_io_iresp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_bp_debug_if = io_lsu_io_iresp_bits_uop_bp_debug_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_bp_xcpt_if = io_lsu_io_iresp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_debug_fsrc = io_lsu_io_iresp_bits_uop_debug_fsrc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_uop_debug_tsrc = io_lsu_io_iresp_bits_uop_debug_tsrc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_data = {{1'd0}, io_lsu_io_iresp_bits_data}; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_predicated = io_lsu_io_iresp_bits_predicated; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_valid = io_lsu_io_iresp_bits_fflags_valid; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_switch = io_lsu_io_iresp_bits_fflags_bits_uop_switch; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_switch_off = io_lsu_io_iresp_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_is_unicore = io_lsu_io_iresp_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_shift = io_lsu_io_iresp_bits_fflags_bits_uop_shift; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_lrs3_rtype = io_lsu_io_iresp_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_rflag = io_lsu_io_iresp_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_wflag = io_lsu_io_iresp_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_prflag = io_lsu_io_iresp_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_pwflag = io_lsu_io_iresp_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_pflag_busy = io_lsu_io_iresp_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_stale_pflag = io_lsu_io_iresp_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_op1_sel = io_lsu_io_iresp_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_op2_sel = io_lsu_io_iresp_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_split_num = io_lsu_io_iresp_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_self_index = io_lsu_io_iresp_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_rob_inst_idx = io_lsu_io_iresp_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_address_num = io_lsu_io_iresp_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_uopc = io_lsu_io_iresp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_inst = io_lsu_io_iresp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_debug_inst = io_lsu_io_iresp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_is_rvc = io_lsu_io_iresp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_debug_pc = io_lsu_io_iresp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_iq_type = io_lsu_io_iresp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_fu_code = io_lsu_io_iresp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_br_type = io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_op1_sel = io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_op2_sel = io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_imm_sel = io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_op_fcn = io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_fcn_dw = io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_csr_cmd = io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_is_load = io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_is_sta = io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_is_std = io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_op3_sel = io_lsu_io_iresp_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_iw_state = io_lsu_io_iresp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_iw_p1_poisoned = io_lsu_io_iresp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_iw_p2_poisoned = io_lsu_io_iresp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_is_br = io_lsu_io_iresp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_is_jalr = io_lsu_io_iresp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_is_jal = io_lsu_io_iresp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_is_sfb = io_lsu_io_iresp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_br_mask = io_lsu_io_iresp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_br_tag = io_lsu_io_iresp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ftq_idx = io_lsu_io_iresp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_edge_inst = io_lsu_io_iresp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_pc_lob = io_lsu_io_iresp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_taken = io_lsu_io_iresp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_imm_packed = io_lsu_io_iresp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_csr_addr = io_lsu_io_iresp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_rob_idx = io_lsu_io_iresp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ldq_idx = io_lsu_io_iresp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_stq_idx = io_lsu_io_iresp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_rxq_idx = io_lsu_io_iresp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_pdst = io_lsu_io_iresp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_prs1 = io_lsu_io_iresp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_prs2 = io_lsu_io_iresp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_prs3 = io_lsu_io_iresp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ppred = io_lsu_io_iresp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_prs1_busy = io_lsu_io_iresp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_prs2_busy = io_lsu_io_iresp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_prs3_busy = io_lsu_io_iresp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ppred_busy = io_lsu_io_iresp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_stale_pdst = io_lsu_io_iresp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_exception = io_lsu_io_iresp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_exc_cause = io_lsu_io_iresp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_bypassable = io_lsu_io_iresp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_mem_cmd = io_lsu_io_iresp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_mem_size = io_lsu_io_iresp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_mem_signed = io_lsu_io_iresp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_is_fence = io_lsu_io_iresp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_is_fencei = io_lsu_io_iresp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_is_amo = io_lsu_io_iresp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_uses_ldq = io_lsu_io_iresp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_uses_stq = io_lsu_io_iresp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_is_sys_pc2epc = io_lsu_io_iresp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_is_unique = io_lsu_io_iresp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_flush_on_commit = io_lsu_io_iresp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ldst_is_rs1 = io_lsu_io_iresp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ldst = io_lsu_io_iresp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_lrs1 = io_lsu_io_iresp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_lrs2 = io_lsu_io_iresp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_lrs3 = io_lsu_io_iresp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_ldst_val = io_lsu_io_iresp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_dst_rtype = io_lsu_io_iresp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_lrs1_rtype = io_lsu_io_iresp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_lrs2_rtype = io_lsu_io_iresp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_frs3_en = io_lsu_io_iresp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_fp_val = io_lsu_io_iresp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_fp_single = io_lsu_io_iresp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_xcpt_pf_if = io_lsu_io_iresp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_xcpt_ae_if = io_lsu_io_iresp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_xcpt_ma_if = io_lsu_io_iresp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_bp_debug_if = io_lsu_io_iresp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_bp_xcpt_if = io_lsu_io_iresp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_debug_fsrc = io_lsu_io_iresp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_uop_debug_tsrc = io_lsu_io_iresp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflags_bits_flags = io_lsu_io_iresp_bits_fflags_bits_flags; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_flagdata = io_lsu_io_iresp_bits_flagdata; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_valid = io_lsu_io_iresp_bits_fflagdata_valid; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_switch = io_lsu_io_iresp_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_switch_off = io_lsu_io_iresp_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_is_unicore = io_lsu_io_iresp_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_shift = io_lsu_io_iresp_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_lrs3_rtype = io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_rflag = io_lsu_io_iresp_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_wflag = io_lsu_io_iresp_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_prflag = io_lsu_io_iresp_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_pwflag = io_lsu_io_iresp_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_pflag_busy = io_lsu_io_iresp_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_stale_pflag = io_lsu_io_iresp_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_op1_sel = io_lsu_io_iresp_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_op2_sel = io_lsu_io_iresp_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_split_num = io_lsu_io_iresp_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_self_index = io_lsu_io_iresp_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_rob_inst_idx = io_lsu_io_iresp_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_address_num = io_lsu_io_iresp_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_uopc = io_lsu_io_iresp_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_inst = io_lsu_io_iresp_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_debug_inst = io_lsu_io_iresp_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_is_rvc = io_lsu_io_iresp_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_debug_pc = io_lsu_io_iresp_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_iq_type = io_lsu_io_iresp_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_fu_code = io_lsu_io_iresp_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ctrl_br_type = io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ctrl_op1_sel = io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ctrl_op2_sel = io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ctrl_imm_sel = io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ctrl_op_fcn = io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ctrl_fcn_dw = io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ctrl_csr_cmd = io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ctrl_is_load = io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ctrl_is_sta = io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ctrl_is_std = io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ctrl_op3_sel = io_lsu_io_iresp_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_iw_state = io_lsu_io_iresp_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_iw_p1_poisoned = io_lsu_io_iresp_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_iw_p2_poisoned = io_lsu_io_iresp_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_is_br = io_lsu_io_iresp_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_is_jalr = io_lsu_io_iresp_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_is_jal = io_lsu_io_iresp_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_is_sfb = io_lsu_io_iresp_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_br_mask = io_lsu_io_iresp_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_br_tag = io_lsu_io_iresp_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ftq_idx = io_lsu_io_iresp_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_edge_inst = io_lsu_io_iresp_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_pc_lob = io_lsu_io_iresp_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_taken = io_lsu_io_iresp_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_imm_packed = io_lsu_io_iresp_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_csr_addr = io_lsu_io_iresp_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_rob_idx = io_lsu_io_iresp_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ldq_idx = io_lsu_io_iresp_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_stq_idx = io_lsu_io_iresp_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_rxq_idx = io_lsu_io_iresp_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_pdst = io_lsu_io_iresp_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_prs1 = io_lsu_io_iresp_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_prs2 = io_lsu_io_iresp_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_prs3 = io_lsu_io_iresp_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ppred = io_lsu_io_iresp_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_prs1_busy = io_lsu_io_iresp_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_prs2_busy = io_lsu_io_iresp_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_prs3_busy = io_lsu_io_iresp_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ppred_busy = io_lsu_io_iresp_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_stale_pdst = io_lsu_io_iresp_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_exception = io_lsu_io_iresp_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_exc_cause = io_lsu_io_iresp_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_bypassable = io_lsu_io_iresp_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_mem_cmd = io_lsu_io_iresp_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_mem_size = io_lsu_io_iresp_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_mem_signed = io_lsu_io_iresp_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_is_fence = io_lsu_io_iresp_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_is_fencei = io_lsu_io_iresp_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_is_amo = io_lsu_io_iresp_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_uses_ldq = io_lsu_io_iresp_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_uses_stq = io_lsu_io_iresp_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_is_sys_pc2epc = io_lsu_io_iresp_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_is_unique = io_lsu_io_iresp_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_flush_on_commit = io_lsu_io_iresp_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ldst_is_rs1 = io_lsu_io_iresp_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ldst = io_lsu_io_iresp_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_lrs1 = io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_lrs2 = io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_lrs3 = io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_ldst_val = io_lsu_io_iresp_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_dst_rtype = io_lsu_io_iresp_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_lrs1_rtype = io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_lrs2_rtype = io_lsu_io_iresp_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_frs3_en = io_lsu_io_iresp_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_fp_val = io_lsu_io_iresp_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_fp_single = io_lsu_io_iresp_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_xcpt_pf_if = io_lsu_io_iresp_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_xcpt_ae_if = io_lsu_io_iresp_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_xcpt_ma_if = io_lsu_io_iresp_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_bp_debug_if = io_lsu_io_iresp_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_bp_xcpt_if = io_lsu_io_iresp_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_debug_fsrc = io_lsu_io_iresp_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_uop_debug_tsrc = io_lsu_io_iresp_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 424:17]
  assign io_ll_iresp_bits_fflagdata_bits_fflag = io_lsu_io_iresp_bits_fflagdata_bits_fflag; // @[execution-unit.scala 424:17]
  assign io_ll_fresp_valid = io_lsu_io_fresp_valid; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_switch = io_lsu_io_fresp_bits_uop_switch; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_switch_off = io_lsu_io_fresp_bits_uop_switch_off; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_is_unicore = io_lsu_io_fresp_bits_uop_is_unicore; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_shift = io_lsu_io_fresp_bits_uop_shift; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_lrs3_rtype = io_lsu_io_fresp_bits_uop_lrs3_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_rflag = io_lsu_io_fresp_bits_uop_rflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_wflag = io_lsu_io_fresp_bits_uop_wflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_prflag = io_lsu_io_fresp_bits_uop_prflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_pwflag = io_lsu_io_fresp_bits_uop_pwflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_pflag_busy = io_lsu_io_fresp_bits_uop_pflag_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_stale_pflag = io_lsu_io_fresp_bits_uop_stale_pflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_op1_sel = io_lsu_io_fresp_bits_uop_op1_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_op2_sel = io_lsu_io_fresp_bits_uop_op2_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_split_num = io_lsu_io_fresp_bits_uop_split_num; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_self_index = io_lsu_io_fresp_bits_uop_self_index; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_rob_inst_idx = io_lsu_io_fresp_bits_uop_rob_inst_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_address_num = io_lsu_io_fresp_bits_uop_address_num; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_uopc = io_lsu_io_fresp_bits_uop_uopc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_inst = io_lsu_io_fresp_bits_uop_inst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_debug_inst = io_lsu_io_fresp_bits_uop_debug_inst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_is_rvc = io_lsu_io_fresp_bits_uop_is_rvc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_debug_pc = io_lsu_io_fresp_bits_uop_debug_pc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_iq_type = io_lsu_io_fresp_bits_uop_iq_type; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_fu_code = io_lsu_io_fresp_bits_uop_fu_code; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ctrl_br_type = io_lsu_io_fresp_bits_uop_ctrl_br_type; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ctrl_op1_sel = io_lsu_io_fresp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ctrl_op2_sel = io_lsu_io_fresp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ctrl_imm_sel = io_lsu_io_fresp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ctrl_op_fcn = io_lsu_io_fresp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ctrl_fcn_dw = io_lsu_io_fresp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ctrl_csr_cmd = io_lsu_io_fresp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ctrl_is_load = io_lsu_io_fresp_bits_uop_ctrl_is_load; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ctrl_is_sta = io_lsu_io_fresp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ctrl_is_std = io_lsu_io_fresp_bits_uop_ctrl_is_std; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ctrl_op3_sel = io_lsu_io_fresp_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_iw_state = io_lsu_io_fresp_bits_uop_iw_state; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_iw_p1_poisoned = io_lsu_io_fresp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_iw_p2_poisoned = io_lsu_io_fresp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_is_br = io_lsu_io_fresp_bits_uop_is_br; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_is_jalr = io_lsu_io_fresp_bits_uop_is_jalr; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_is_jal = io_lsu_io_fresp_bits_uop_is_jal; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_is_sfb = io_lsu_io_fresp_bits_uop_is_sfb; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_br_mask = io_lsu_io_fresp_bits_uop_br_mask; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_br_tag = io_lsu_io_fresp_bits_uop_br_tag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ftq_idx = io_lsu_io_fresp_bits_uop_ftq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_edge_inst = io_lsu_io_fresp_bits_uop_edge_inst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_pc_lob = io_lsu_io_fresp_bits_uop_pc_lob; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_taken = io_lsu_io_fresp_bits_uop_taken; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_imm_packed = io_lsu_io_fresp_bits_uop_imm_packed; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_csr_addr = io_lsu_io_fresp_bits_uop_csr_addr; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_rob_idx = io_lsu_io_fresp_bits_uop_rob_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ldq_idx = io_lsu_io_fresp_bits_uop_ldq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_stq_idx = io_lsu_io_fresp_bits_uop_stq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_rxq_idx = io_lsu_io_fresp_bits_uop_rxq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_pdst = io_lsu_io_fresp_bits_uop_pdst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_prs1 = io_lsu_io_fresp_bits_uop_prs1; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_prs2 = io_lsu_io_fresp_bits_uop_prs2; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_prs3 = io_lsu_io_fresp_bits_uop_prs3; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ppred = io_lsu_io_fresp_bits_uop_ppred; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_prs1_busy = io_lsu_io_fresp_bits_uop_prs1_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_prs2_busy = io_lsu_io_fresp_bits_uop_prs2_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_prs3_busy = io_lsu_io_fresp_bits_uop_prs3_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ppred_busy = io_lsu_io_fresp_bits_uop_ppred_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_stale_pdst = io_lsu_io_fresp_bits_uop_stale_pdst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_exception = io_lsu_io_fresp_bits_uop_exception; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_exc_cause = io_lsu_io_fresp_bits_uop_exc_cause; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_bypassable = io_lsu_io_fresp_bits_uop_bypassable; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_mem_cmd = io_lsu_io_fresp_bits_uop_mem_cmd; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_mem_size = io_lsu_io_fresp_bits_uop_mem_size; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_mem_signed = io_lsu_io_fresp_bits_uop_mem_signed; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_is_fence = io_lsu_io_fresp_bits_uop_is_fence; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_is_fencei = io_lsu_io_fresp_bits_uop_is_fencei; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_is_amo = io_lsu_io_fresp_bits_uop_is_amo; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_uses_ldq = io_lsu_io_fresp_bits_uop_uses_ldq; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_uses_stq = io_lsu_io_fresp_bits_uop_uses_stq; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_is_sys_pc2epc = io_lsu_io_fresp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_is_unique = io_lsu_io_fresp_bits_uop_is_unique; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_flush_on_commit = io_lsu_io_fresp_bits_uop_flush_on_commit; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ldst_is_rs1 = io_lsu_io_fresp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ldst = io_lsu_io_fresp_bits_uop_ldst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_lrs1 = io_lsu_io_fresp_bits_uop_lrs1; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_lrs2 = io_lsu_io_fresp_bits_uop_lrs2; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_lrs3 = io_lsu_io_fresp_bits_uop_lrs3; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_ldst_val = io_lsu_io_fresp_bits_uop_ldst_val; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_dst_rtype = io_lsu_io_fresp_bits_uop_dst_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_lrs1_rtype = io_lsu_io_fresp_bits_uop_lrs1_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_lrs2_rtype = io_lsu_io_fresp_bits_uop_lrs2_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_frs3_en = io_lsu_io_fresp_bits_uop_frs3_en; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_fp_val = io_lsu_io_fresp_bits_uop_fp_val; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_fp_single = io_lsu_io_fresp_bits_uop_fp_single; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_xcpt_pf_if = io_lsu_io_fresp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_xcpt_ae_if = io_lsu_io_fresp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_xcpt_ma_if = io_lsu_io_fresp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_bp_debug_if = io_lsu_io_fresp_bits_uop_bp_debug_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_bp_xcpt_if = io_lsu_io_fresp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_debug_fsrc = io_lsu_io_fresp_bits_uop_debug_fsrc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_uop_debug_tsrc = io_lsu_io_fresp_bits_uop_debug_tsrc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_data = io_lsu_io_fresp_bits_data; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_predicated = io_lsu_io_fresp_bits_predicated; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_valid = io_lsu_io_fresp_bits_fflags_valid; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_switch = io_lsu_io_fresp_bits_fflags_bits_uop_switch; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_switch_off = io_lsu_io_fresp_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_is_unicore = io_lsu_io_fresp_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_shift = io_lsu_io_fresp_bits_fflags_bits_uop_shift; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs3_rtype = io_lsu_io_fresp_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_rflag = io_lsu_io_fresp_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_wflag = io_lsu_io_fresp_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_prflag = io_lsu_io_fresp_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_pwflag = io_lsu_io_fresp_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_pflag_busy = io_lsu_io_fresp_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_stale_pflag = io_lsu_io_fresp_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_op1_sel = io_lsu_io_fresp_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_op2_sel = io_lsu_io_fresp_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_split_num = io_lsu_io_fresp_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_self_index = io_lsu_io_fresp_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_rob_inst_idx = io_lsu_io_fresp_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_address_num = io_lsu_io_fresp_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_uopc = io_lsu_io_fresp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_inst = io_lsu_io_fresp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_debug_inst = io_lsu_io_fresp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_is_rvc = io_lsu_io_fresp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_debug_pc = io_lsu_io_fresp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_iq_type = io_lsu_io_fresp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_fu_code = io_lsu_io_fresp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_br_type = io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_op1_sel = io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_op2_sel = io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_imm_sel = io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_op_fcn = io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_fcn_dw = io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_csr_cmd = io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_is_load = io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_is_sta = io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_is_std = io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_op3_sel = io_lsu_io_fresp_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_iw_state = io_lsu_io_fresp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_iw_p1_poisoned = io_lsu_io_fresp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_iw_p2_poisoned = io_lsu_io_fresp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_is_br = io_lsu_io_fresp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_is_jalr = io_lsu_io_fresp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_is_jal = io_lsu_io_fresp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_is_sfb = io_lsu_io_fresp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_br_mask = io_lsu_io_fresp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_br_tag = io_lsu_io_fresp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ftq_idx = io_lsu_io_fresp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_edge_inst = io_lsu_io_fresp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_pc_lob = io_lsu_io_fresp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_taken = io_lsu_io_fresp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_imm_packed = io_lsu_io_fresp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_csr_addr = io_lsu_io_fresp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_rob_idx = io_lsu_io_fresp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ldq_idx = io_lsu_io_fresp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_stq_idx = io_lsu_io_fresp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_rxq_idx = io_lsu_io_fresp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_pdst = io_lsu_io_fresp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_prs1 = io_lsu_io_fresp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_prs2 = io_lsu_io_fresp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_prs3 = io_lsu_io_fresp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ppred = io_lsu_io_fresp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_prs1_busy = io_lsu_io_fresp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_prs2_busy = io_lsu_io_fresp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_prs3_busy = io_lsu_io_fresp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ppred_busy = io_lsu_io_fresp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_stale_pdst = io_lsu_io_fresp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_exception = io_lsu_io_fresp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_exc_cause = io_lsu_io_fresp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_bypassable = io_lsu_io_fresp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_mem_cmd = io_lsu_io_fresp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_mem_size = io_lsu_io_fresp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_mem_signed = io_lsu_io_fresp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_is_fence = io_lsu_io_fresp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_is_fencei = io_lsu_io_fresp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_is_amo = io_lsu_io_fresp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_uses_ldq = io_lsu_io_fresp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_uses_stq = io_lsu_io_fresp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_is_sys_pc2epc = io_lsu_io_fresp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_is_unique = io_lsu_io_fresp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_flush_on_commit = io_lsu_io_fresp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ldst_is_rs1 = io_lsu_io_fresp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ldst = io_lsu_io_fresp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs1 = io_lsu_io_fresp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs2 = io_lsu_io_fresp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs3 = io_lsu_io_fresp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_ldst_val = io_lsu_io_fresp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_dst_rtype = io_lsu_io_fresp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs1_rtype = io_lsu_io_fresp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs2_rtype = io_lsu_io_fresp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_frs3_en = io_lsu_io_fresp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_fp_val = io_lsu_io_fresp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_fp_single = io_lsu_io_fresp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_xcpt_pf_if = io_lsu_io_fresp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_xcpt_ae_if = io_lsu_io_fresp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_xcpt_ma_if = io_lsu_io_fresp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_bp_debug_if = io_lsu_io_fresp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_bp_xcpt_if = io_lsu_io_fresp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_debug_fsrc = io_lsu_io_fresp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_uop_debug_tsrc = io_lsu_io_fresp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflags_bits_flags = io_lsu_io_fresp_bits_fflags_bits_flags; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_flagdata = io_lsu_io_fresp_bits_flagdata; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_valid = io_lsu_io_fresp_bits_fflagdata_valid; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_switch = io_lsu_io_fresp_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_switch_off = io_lsu_io_fresp_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_unicore = io_lsu_io_fresp_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_shift = io_lsu_io_fresp_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs3_rtype = io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_rflag = io_lsu_io_fresp_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_wflag = io_lsu_io_fresp_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prflag = io_lsu_io_fresp_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_pwflag = io_lsu_io_fresp_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_pflag_busy = io_lsu_io_fresp_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_stale_pflag = io_lsu_io_fresp_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_op1_sel = io_lsu_io_fresp_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_op2_sel = io_lsu_io_fresp_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_split_num = io_lsu_io_fresp_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_self_index = io_lsu_io_fresp_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_rob_inst_idx = io_lsu_io_fresp_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_address_num = io_lsu_io_fresp_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_uopc = io_lsu_io_fresp_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_inst = io_lsu_io_fresp_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_debug_inst = io_lsu_io_fresp_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_rvc = io_lsu_io_fresp_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_debug_pc = io_lsu_io_fresp_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_iq_type = io_lsu_io_fresp_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_fu_code = io_lsu_io_fresp_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_br_type = io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op1_sel = io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op2_sel = io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_imm_sel = io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op_fcn = io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_fcn_dw = io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_csr_cmd = io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_is_load = io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_is_sta = io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_is_std = io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op3_sel = io_lsu_io_fresp_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_iw_state = io_lsu_io_fresp_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_iw_p1_poisoned = io_lsu_io_fresp_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_iw_p2_poisoned = io_lsu_io_fresp_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_br = io_lsu_io_fresp_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_jalr = io_lsu_io_fresp_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_jal = io_lsu_io_fresp_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_sfb = io_lsu_io_fresp_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_br_mask = io_lsu_io_fresp_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_br_tag = io_lsu_io_fresp_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ftq_idx = io_lsu_io_fresp_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_edge_inst = io_lsu_io_fresp_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_pc_lob = io_lsu_io_fresp_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_taken = io_lsu_io_fresp_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_imm_packed = io_lsu_io_fresp_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_csr_addr = io_lsu_io_fresp_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_rob_idx = io_lsu_io_fresp_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ldq_idx = io_lsu_io_fresp_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_stq_idx = io_lsu_io_fresp_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_rxq_idx = io_lsu_io_fresp_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_pdst = io_lsu_io_fresp_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs1 = io_lsu_io_fresp_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs2 = io_lsu_io_fresp_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs3 = io_lsu_io_fresp_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ppred = io_lsu_io_fresp_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs1_busy = io_lsu_io_fresp_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs2_busy = io_lsu_io_fresp_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs3_busy = io_lsu_io_fresp_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ppred_busy = io_lsu_io_fresp_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_stale_pdst = io_lsu_io_fresp_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_exception = io_lsu_io_fresp_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_exc_cause = io_lsu_io_fresp_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_bypassable = io_lsu_io_fresp_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_mem_cmd = io_lsu_io_fresp_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_mem_size = io_lsu_io_fresp_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_mem_signed = io_lsu_io_fresp_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_fence = io_lsu_io_fresp_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_fencei = io_lsu_io_fresp_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_amo = io_lsu_io_fresp_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_uses_ldq = io_lsu_io_fresp_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_uses_stq = io_lsu_io_fresp_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_sys_pc2epc = io_lsu_io_fresp_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_unique = io_lsu_io_fresp_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_flush_on_commit = io_lsu_io_fresp_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ldst_is_rs1 = io_lsu_io_fresp_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ldst = io_lsu_io_fresp_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs1 = io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs2 = io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs3 = io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ldst_val = io_lsu_io_fresp_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_dst_rtype = io_lsu_io_fresp_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs1_rtype = io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs2_rtype = io_lsu_io_fresp_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_frs3_en = io_lsu_io_fresp_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_fp_val = io_lsu_io_fresp_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_fp_single = io_lsu_io_fresp_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_xcpt_pf_if = io_lsu_io_fresp_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_xcpt_ae_if = io_lsu_io_fresp_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_xcpt_ma_if = io_lsu_io_fresp_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_bp_debug_if = io_lsu_io_fresp_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_bp_xcpt_if = io_lsu_io_fresp_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_debug_fsrc = io_lsu_io_fresp_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_uop_debug_tsrc = io_lsu_io_fresp_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 426:19]
  assign io_ll_fresp_bits_fflagdata_bits_fflag = io_lsu_io_fresp_bits_fflagdata_bits_fflag; // @[execution-unit.scala 426:19]
  assign io_lsu_io_req_valid = MemAddrCalcUnit_io_resp_valid; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_switch = MemAddrCalcUnit_io_resp_bits_uop_switch; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_switch_off = MemAddrCalcUnit_io_resp_bits_uop_switch_off; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_is_unicore = MemAddrCalcUnit_io_resp_bits_uop_is_unicore; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_shift = MemAddrCalcUnit_io_resp_bits_uop_shift; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_lrs3_rtype = MemAddrCalcUnit_io_resp_bits_uop_lrs3_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_rflag = MemAddrCalcUnit_io_resp_bits_uop_rflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_wflag = MemAddrCalcUnit_io_resp_bits_uop_wflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_prflag = MemAddrCalcUnit_io_resp_bits_uop_prflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_pwflag = MemAddrCalcUnit_io_resp_bits_uop_pwflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_pflag_busy = MemAddrCalcUnit_io_resp_bits_uop_pflag_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_stale_pflag = MemAddrCalcUnit_io_resp_bits_uop_stale_pflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_op1_sel = MemAddrCalcUnit_io_resp_bits_uop_op1_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_op2_sel = MemAddrCalcUnit_io_resp_bits_uop_op2_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_split_num = MemAddrCalcUnit_io_resp_bits_uop_split_num; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_self_index = MemAddrCalcUnit_io_resp_bits_uop_self_index; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_rob_inst_idx = MemAddrCalcUnit_io_resp_bits_uop_rob_inst_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_address_num = MemAddrCalcUnit_io_resp_bits_uop_address_num; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_uopc = MemAddrCalcUnit_io_resp_bits_uop_uopc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_inst = MemAddrCalcUnit_io_resp_bits_uop_inst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_debug_inst = MemAddrCalcUnit_io_resp_bits_uop_debug_inst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_is_rvc = MemAddrCalcUnit_io_resp_bits_uop_is_rvc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_debug_pc = MemAddrCalcUnit_io_resp_bits_uop_debug_pc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_iq_type = MemAddrCalcUnit_io_resp_bits_uop_iq_type; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_fu_code = MemAddrCalcUnit_io_resp_bits_uop_fu_code; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ctrl_br_type = MemAddrCalcUnit_io_resp_bits_uop_ctrl_br_type; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ctrl_op1_sel = MemAddrCalcUnit_io_resp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ctrl_op2_sel = MemAddrCalcUnit_io_resp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ctrl_imm_sel = MemAddrCalcUnit_io_resp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ctrl_op_fcn = MemAddrCalcUnit_io_resp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ctrl_fcn_dw = MemAddrCalcUnit_io_resp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ctrl_csr_cmd = MemAddrCalcUnit_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ctrl_is_load = MemAddrCalcUnit_io_resp_bits_uop_ctrl_is_load; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ctrl_is_sta = MemAddrCalcUnit_io_resp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ctrl_is_std = MemAddrCalcUnit_io_resp_bits_uop_ctrl_is_std; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ctrl_op3_sel = MemAddrCalcUnit_io_resp_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_iw_state = MemAddrCalcUnit_io_resp_bits_uop_iw_state; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_iw_p1_poisoned = MemAddrCalcUnit_io_resp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_iw_p2_poisoned = MemAddrCalcUnit_io_resp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_is_br = MemAddrCalcUnit_io_resp_bits_uop_is_br; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_is_jalr = MemAddrCalcUnit_io_resp_bits_uop_is_jalr; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_is_jal = MemAddrCalcUnit_io_resp_bits_uop_is_jal; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_is_sfb = MemAddrCalcUnit_io_resp_bits_uop_is_sfb; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_br_mask = MemAddrCalcUnit_io_resp_bits_uop_br_mask; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_br_tag = MemAddrCalcUnit_io_resp_bits_uop_br_tag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ftq_idx = MemAddrCalcUnit_io_resp_bits_uop_ftq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_edge_inst = MemAddrCalcUnit_io_resp_bits_uop_edge_inst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_pc_lob = MemAddrCalcUnit_io_resp_bits_uop_pc_lob; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_taken = MemAddrCalcUnit_io_resp_bits_uop_taken; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_imm_packed = MemAddrCalcUnit_io_resp_bits_uop_imm_packed; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_csr_addr = MemAddrCalcUnit_io_resp_bits_uop_csr_addr; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_rob_idx = MemAddrCalcUnit_io_resp_bits_uop_rob_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ldq_idx = MemAddrCalcUnit_io_resp_bits_uop_ldq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_stq_idx = MemAddrCalcUnit_io_resp_bits_uop_stq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_rxq_idx = MemAddrCalcUnit_io_resp_bits_uop_rxq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_pdst = MemAddrCalcUnit_io_resp_bits_uop_pdst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_prs1 = MemAddrCalcUnit_io_resp_bits_uop_prs1; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_prs2 = MemAddrCalcUnit_io_resp_bits_uop_prs2; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_prs3 = MemAddrCalcUnit_io_resp_bits_uop_prs3; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ppred = MemAddrCalcUnit_io_resp_bits_uop_ppred; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_prs1_busy = MemAddrCalcUnit_io_resp_bits_uop_prs1_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_prs2_busy = MemAddrCalcUnit_io_resp_bits_uop_prs2_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_prs3_busy = MemAddrCalcUnit_io_resp_bits_uop_prs3_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ppred_busy = MemAddrCalcUnit_io_resp_bits_uop_ppred_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_stale_pdst = MemAddrCalcUnit_io_resp_bits_uop_stale_pdst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_exception = MemAddrCalcUnit_io_resp_bits_uop_exception; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_exc_cause = MemAddrCalcUnit_io_resp_bits_uop_exc_cause; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_bypassable = MemAddrCalcUnit_io_resp_bits_uop_bypassable; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_mem_cmd = MemAddrCalcUnit_io_resp_bits_uop_mem_cmd; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_mem_size = MemAddrCalcUnit_io_resp_bits_uop_mem_size; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_mem_signed = MemAddrCalcUnit_io_resp_bits_uop_mem_signed; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_is_fence = MemAddrCalcUnit_io_resp_bits_uop_is_fence; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_is_fencei = MemAddrCalcUnit_io_resp_bits_uop_is_fencei; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_is_amo = MemAddrCalcUnit_io_resp_bits_uop_is_amo; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_uses_ldq = MemAddrCalcUnit_io_resp_bits_uop_uses_ldq; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_uses_stq = MemAddrCalcUnit_io_resp_bits_uop_uses_stq; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_is_sys_pc2epc = MemAddrCalcUnit_io_resp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_is_unique = MemAddrCalcUnit_io_resp_bits_uop_is_unique; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_flush_on_commit = MemAddrCalcUnit_io_resp_bits_uop_flush_on_commit; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ldst_is_rs1 = MemAddrCalcUnit_io_resp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ldst = MemAddrCalcUnit_io_resp_bits_uop_ldst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_lrs1 = MemAddrCalcUnit_io_resp_bits_uop_lrs1; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_lrs2 = MemAddrCalcUnit_io_resp_bits_uop_lrs2; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_lrs3 = MemAddrCalcUnit_io_resp_bits_uop_lrs3; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_ldst_val = MemAddrCalcUnit_io_resp_bits_uop_ldst_val; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_dst_rtype = MemAddrCalcUnit_io_resp_bits_uop_dst_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_lrs1_rtype = MemAddrCalcUnit_io_resp_bits_uop_lrs1_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_lrs2_rtype = MemAddrCalcUnit_io_resp_bits_uop_lrs2_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_frs3_en = MemAddrCalcUnit_io_resp_bits_uop_frs3_en; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_fp_val = MemAddrCalcUnit_io_resp_bits_uop_fp_val; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_fp_single = MemAddrCalcUnit_io_resp_bits_uop_fp_single; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_xcpt_pf_if = MemAddrCalcUnit_io_resp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_xcpt_ae_if = MemAddrCalcUnit_io_resp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_xcpt_ma_if = MemAddrCalcUnit_io_resp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_bp_debug_if = MemAddrCalcUnit_io_resp_bits_uop_bp_debug_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_bp_xcpt_if = MemAddrCalcUnit_io_resp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_debug_fsrc = MemAddrCalcUnit_io_resp_bits_uop_debug_fsrc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_uop_debug_tsrc = MemAddrCalcUnit_io_resp_bits_uop_debug_tsrc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_predicated = MemAddrCalcUnit_io_resp_bits_predicated; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_data = MemAddrCalcUnit_io_resp_bits_data[63:0]; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_valid = MemAddrCalcUnit_io_resp_bits_fflags_valid; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_switch = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_switch; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_switch_off = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_is_unicore = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_shift = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_shift; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_lrs3_rtype = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_rflag = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_wflag = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_prflag = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_pwflag = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_pflag_busy = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_stale_pflag = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_op1_sel = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_op2_sel = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_split_num = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_self_index = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_rob_inst_idx = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_address_num = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_uopc = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_inst = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_debug_inst = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_is_rvc = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_debug_pc = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_iq_type = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_fu_code = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ctrl_br_type = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ctrl_op1_sel = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ctrl_op2_sel = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ctrl_imm_sel = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ctrl_op_fcn = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ctrl_fcn_dw = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ctrl_csr_cmd = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ctrl_is_load = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ctrl_is_sta = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ctrl_is_std = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ctrl_op3_sel = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_iw_state = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_iw_p1_poisoned = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iw_p1_poisoned
    ; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_iw_p2_poisoned = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_iw_p2_poisoned
    ; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_is_br = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_is_jalr = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_is_jal = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_is_sfb = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_br_mask = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_br_tag = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ftq_idx = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_edge_inst = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_pc_lob = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_taken = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_imm_packed = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_csr_addr = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_rob_idx = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ldq_idx = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_stq_idx = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_rxq_idx = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_pdst = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_prs1 = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_prs2 = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_prs3 = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ppred = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_prs1_busy = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_prs2_busy = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_prs3_busy = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ppred_busy = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_stale_pdst = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_exception = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_exc_cause = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_bypassable = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_mem_cmd = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_mem_size = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_mem_signed = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_is_fence = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_is_fencei = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_is_amo = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_uses_ldq = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_uses_stq = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_is_sys_pc2epc = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_is_unique = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_flush_on_commit =
    MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ldst_is_rs1 = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ldst = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_lrs1 = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_lrs2 = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_lrs3 = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_ldst_val = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_dst_rtype = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_lrs1_rtype = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_lrs2_rtype = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_frs3_en = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_fp_val = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_fp_single = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_xcpt_pf_if = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_xcpt_ae_if = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_xcpt_ma_if = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_bp_debug_if = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_bp_xcpt_if = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_debug_fsrc = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_uop_debug_tsrc = MemAddrCalcUnit_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflags_bits_flags = MemAddrCalcUnit_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_addr = MemAddrCalcUnit_io_resp_bits_addr; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_mxcpt_valid = MemAddrCalcUnit_io_resp_bits_mxcpt_valid; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_mxcpt_bits = MemAddrCalcUnit_io_resp_bits_mxcpt_bits; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_sfence_valid = MemAddrCalcUnit_io_resp_bits_sfence_valid; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_sfence_bits_rs1 = MemAddrCalcUnit_io_resp_bits_sfence_bits_rs1; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_sfence_bits_rs2 = MemAddrCalcUnit_io_resp_bits_sfence_bits_rs2; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_sfence_bits_addr = MemAddrCalcUnit_io_resp_bits_sfence_bits_addr; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_sfence_bits_asid = MemAddrCalcUnit_io_resp_bits_sfence_bits_asid; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_flagdata = MemAddrCalcUnit_io_resp_bits_flagdata; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_valid = MemAddrCalcUnit_io_resp_bits_fflagdata_valid; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_switch = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_switch_off = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_is_unicore = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_shift = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_lrs3_rtype = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_rflag = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_wflag = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_prflag = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_pwflag = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_pflag_busy = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_stale_pflag = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_stale_pflag
    ; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_op1_sel = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_op2_sel = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_split_num = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_self_index = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_rob_inst_idx =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_address_num = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_address_num
    ; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_uopc = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_inst = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_debug_inst = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_is_rvc = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_debug_pc = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_iq_type = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_fu_code = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_br_type =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_op1_sel =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_op2_sel =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_imm_sel =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_op_fcn = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn
    ; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_fcn_dw = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw
    ; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_csr_cmd =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_is_load =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_is_sta = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta
    ; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_is_std = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_is_std
    ; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ctrl_op3_sel =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_iw_state = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_iw_p1_poisoned =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_iw_p2_poisoned =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_is_br = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_is_jalr = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_is_jal = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_is_sfb = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_br_mask = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_br_tag = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ftq_idx = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_edge_inst = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_pc_lob = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_taken = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_imm_packed = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_csr_addr = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_rob_idx = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ldq_idx = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_stq_idx = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_rxq_idx = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_pdst = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_prs1 = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_prs2 = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_prs3 = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ppred = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_prs1_busy = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_prs2_busy = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_prs3_busy = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ppred_busy = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_stale_pdst = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_exception = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_exc_cause = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_bypassable = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_mem_cmd = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_mem_size = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_mem_signed = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_is_fence = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_is_fencei = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_is_amo = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_uses_ldq = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_uses_stq = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_is_sys_pc2epc =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_is_unique = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_flush_on_commit =
    MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ldst_is_rs1 = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1
    ; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ldst = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_lrs1 = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_lrs2 = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_lrs3 = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_ldst_val = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_dst_rtype = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_lrs1_rtype = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_lrs2_rtype = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_frs3_en = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_fp_val = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_fp_single = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_xcpt_pf_if = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_xcpt_ae_if = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_xcpt_ma_if = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_bp_debug_if = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_bp_debug_if
    ; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_bp_xcpt_if = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_debug_fsrc = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_uop_debug_tsrc = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 422:19]
  assign io_lsu_io_req_bits_fflagdata_bits_fflag = MemAddrCalcUnit_io_resp_bits_fflagdata_bits_fflag; // @[execution-unit.scala 422:19]
  assign io_lsu_io_iresp_ready = io_ll_iresp_ready; // @[execution-unit.scala 424:17]
  assign io_lsu_io_fresp_ready = io_ll_fresp_ready; // @[execution-unit.scala 426:19]
  assign MemAddrCalcUnit_clock = clock;
  assign MemAddrCalcUnit_reset = reset;
  assign MemAddrCalcUnit_io_req_valid = io_req_valid & _T_18; // @[execution-unit.scala 413:45]
  assign MemAddrCalcUnit_io_req_bits_uop_switch = io_req_bits_uop_switch; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_switch_off = io_req_bits_uop_switch_off; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_is_unicore = io_req_bits_uop_is_unicore; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_shift = io_req_bits_uop_shift; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_lrs3_rtype = io_req_bits_uop_lrs3_rtype; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_rflag = io_req_bits_uop_rflag; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_wflag = io_req_bits_uop_wflag; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_prflag = io_req_bits_uop_prflag; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_pwflag = io_req_bits_uop_pwflag; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_pflag_busy = io_req_bits_uop_pflag_busy; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_stale_pflag = io_req_bits_uop_stale_pflag; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_op1_sel = io_req_bits_uop_op1_sel; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_op2_sel = io_req_bits_uop_op2_sel; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_split_num = io_req_bits_uop_split_num; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_self_index = io_req_bits_uop_self_index; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_rob_inst_idx = io_req_bits_uop_rob_inst_idx; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_address_num = io_req_bits_uop_address_num; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_uopc = io_req_bits_uop_uopc; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_inst = io_req_bits_uop_inst; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_debug_inst = io_req_bits_uop_debug_inst; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_is_rvc = io_req_bits_uop_is_rvc; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_debug_pc = io_req_bits_uop_debug_pc; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_iq_type = io_req_bits_uop_iq_type; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_fu_code = io_req_bits_uop_fu_code; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ctrl_op3_sel = io_req_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_iw_state = io_req_bits_uop_iw_state; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_is_br = io_req_bits_uop_is_br; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_is_jalr = io_req_bits_uop_is_jalr; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_is_jal = io_req_bits_uop_is_jal; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_is_sfb = io_req_bits_uop_is_sfb; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_br_mask = io_req_bits_uop_br_mask; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_br_tag = io_req_bits_uop_br_tag; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_edge_inst = io_req_bits_uop_edge_inst; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_pc_lob = io_req_bits_uop_pc_lob; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_taken = io_req_bits_uop_taken; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_imm_packed = io_req_bits_uop_imm_packed; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_csr_addr = io_req_bits_uop_csr_addr; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_rob_idx = io_req_bits_uop_rob_idx; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_stq_idx = io_req_bits_uop_stq_idx; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_pdst = io_req_bits_uop_pdst; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_prs1 = io_req_bits_uop_prs1; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_prs2 = io_req_bits_uop_prs2; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_prs3 = io_req_bits_uop_prs3; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ppred = io_req_bits_uop_ppred; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_exception = io_req_bits_uop_exception; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_exc_cause = io_req_bits_uop_exc_cause; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_bypassable = io_req_bits_uop_bypassable; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_mem_size = io_req_bits_uop_mem_size; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_mem_signed = io_req_bits_uop_mem_signed; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_is_fence = io_req_bits_uop_is_fence; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_is_fencei = io_req_bits_uop_is_fencei; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_is_amo = io_req_bits_uop_is_amo; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_uses_stq = io_req_bits_uop_uses_stq; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_is_unique = io_req_bits_uop_is_unique; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ldst = io_req_bits_uop_ldst; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_lrs1 = io_req_bits_uop_lrs1; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_lrs2 = io_req_bits_uop_lrs2; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_lrs3 = io_req_bits_uop_lrs3; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_ldst_val = io_req_bits_uop_ldst_val; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_frs3_en = io_req_bits_uop_frs3_en; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_fp_val = io_req_bits_uop_fp_val; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_fp_single = io_req_bits_uop_fp_single; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_rs1_data = io_req_bits_rs1_data; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_rs2_data = io_req_bits_rs2_data; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_rs3_data = io_req_bits_rs3_data; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_pred_data = io_req_bits_pred_data; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_flagdata = io_req_bits_flagdata; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_fflagdata = io_req_bits_fflagdata; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_req_bits_kill = io_req_bits_kill; // @[execution-unit.scala 412:29]
  assign MemAddrCalcUnit_io_resp_ready = 1'h0;
  assign MemAddrCalcUnit_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_switch = io_brupdate_b2_uop_switch; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_switch_off = io_brupdate_b2_uop_switch_off; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_is_unicore = io_brupdate_b2_uop_is_unicore; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_shift = io_brupdate_b2_uop_shift; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_lrs3_rtype = io_brupdate_b2_uop_lrs3_rtype; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_rflag = io_brupdate_b2_uop_rflag; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_wflag = io_brupdate_b2_uop_wflag; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_prflag = io_brupdate_b2_uop_prflag; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_pwflag = io_brupdate_b2_uop_pwflag; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_pflag_busy = io_brupdate_b2_uop_pflag_busy; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_stale_pflag = io_brupdate_b2_uop_stale_pflag; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_op1_sel = io_brupdate_b2_uop_op1_sel; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_op2_sel = io_brupdate_b2_uop_op2_sel; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_split_num = io_brupdate_b2_uop_split_num; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_self_index = io_brupdate_b2_uop_self_index; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_rob_inst_idx = io_brupdate_b2_uop_rob_inst_idx; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_address_num = io_brupdate_b2_uop_address_num; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ctrl_op3_sel = io_brupdate_b2_uop_ctrl_op3_sel; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[execution-unit.scala 414:31]
  assign MemAddrCalcUnit_io_status_debug = io_status_debug; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_cease = io_status_cease; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_wfi = io_status_wfi; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_isa = io_status_isa; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_dprv = io_status_dprv; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_prv = io_status_prv; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_sd = io_status_sd; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_zero2 = io_status_zero2; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_sxl = io_status_sxl; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_uxl = io_status_uxl; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_sd_rv32 = io_status_sd_rv32; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_zero1 = io_status_zero1; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_tsr = io_status_tsr; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_tw = io_status_tw; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_tvm = io_status_tvm; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_mxr = io_status_mxr; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_sum = io_status_sum; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_mprv = io_status_mprv; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_xs = io_status_xs; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_fs = io_status_fs; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_mpp = io_status_mpp; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_vs = io_status_vs; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_spp = io_status_spp; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_mpie = io_status_mpie; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_hpie = io_status_hpie; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_spie = io_status_spie; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_upie = io_status_upie; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_mie = io_status_mie; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_hie = io_status_hie; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_sie = io_status_sie; // @[execution-unit.scala 415:29]
  assign MemAddrCalcUnit_io_status_uie = io_status_uie; // @[execution-unit.scala 415:29]
endmodule
