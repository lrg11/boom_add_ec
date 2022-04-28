module IntToFPUnit(
  input         clock,
  input         reset,
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
  input         io_resp_ready,
  output        io_resp_valid,
  output        io_resp_bits_uop_switch,
  output        io_resp_bits_uop_switch_off,
  output        io_resp_bits_uop_is_unicore,
  output [2:0]  io_resp_bits_uop_shift,
  output [1:0]  io_resp_bits_uop_lrs3_rtype,
  output        io_resp_bits_uop_rflag,
  output        io_resp_bits_uop_wflag,
  output [3:0]  io_resp_bits_uop_prflag,
  output [3:0]  io_resp_bits_uop_pwflag,
  output        io_resp_bits_uop_pflag_busy,
  output [3:0]  io_resp_bits_uop_stale_pflag,
  output [3:0]  io_resp_bits_uop_op1_sel,
  output [3:0]  io_resp_bits_uop_op2_sel,
  output [5:0]  io_resp_bits_uop_split_num,
  output [5:0]  io_resp_bits_uop_self_index,
  output [5:0]  io_resp_bits_uop_rob_inst_idx,
  output [5:0]  io_resp_bits_uop_address_num,
  output [6:0]  io_resp_bits_uop_uopc,
  output [31:0] io_resp_bits_uop_inst,
  output [31:0] io_resp_bits_uop_debug_inst,
  output        io_resp_bits_uop_is_rvc,
  output [39:0] io_resp_bits_uop_debug_pc,
  output [2:0]  io_resp_bits_uop_iq_type,
  output [9:0]  io_resp_bits_uop_fu_code,
  output [3:0]  io_resp_bits_uop_ctrl_br_type,
  output [1:0]  io_resp_bits_uop_ctrl_op1_sel,
  output [2:0]  io_resp_bits_uop_ctrl_op2_sel,
  output [2:0]  io_resp_bits_uop_ctrl_imm_sel,
  output [3:0]  io_resp_bits_uop_ctrl_op_fcn,
  output        io_resp_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_resp_bits_uop_ctrl_csr_cmd,
  output        io_resp_bits_uop_ctrl_is_load,
  output        io_resp_bits_uop_ctrl_is_sta,
  output        io_resp_bits_uop_ctrl_is_std,
  output [1:0]  io_resp_bits_uop_ctrl_op3_sel,
  output [1:0]  io_resp_bits_uop_iw_state,
  output        io_resp_bits_uop_iw_p1_poisoned,
  output        io_resp_bits_uop_iw_p2_poisoned,
  output        io_resp_bits_uop_is_br,
  output        io_resp_bits_uop_is_jalr,
  output        io_resp_bits_uop_is_jal,
  output        io_resp_bits_uop_is_sfb,
  output [11:0] io_resp_bits_uop_br_mask,
  output [3:0]  io_resp_bits_uop_br_tag,
  output [4:0]  io_resp_bits_uop_ftq_idx,
  output        io_resp_bits_uop_edge_inst,
  output [5:0]  io_resp_bits_uop_pc_lob,
  output        io_resp_bits_uop_taken,
  output [19:0] io_resp_bits_uop_imm_packed,
  output [11:0] io_resp_bits_uop_csr_addr,
  output [5:0]  io_resp_bits_uop_rob_idx,
  output [4:0]  io_resp_bits_uop_ldq_idx,
  output [4:0]  io_resp_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_uop_rxq_idx,
  output [6:0]  io_resp_bits_uop_pdst,
  output [6:0]  io_resp_bits_uop_prs1,
  output [6:0]  io_resp_bits_uop_prs2,
  output [6:0]  io_resp_bits_uop_prs3,
  output [4:0]  io_resp_bits_uop_ppred,
  output        io_resp_bits_uop_prs1_busy,
  output        io_resp_bits_uop_prs2_busy,
  output        io_resp_bits_uop_prs3_busy,
  output        io_resp_bits_uop_ppred_busy,
  output [6:0]  io_resp_bits_uop_stale_pdst,
  output        io_resp_bits_uop_exception,
  output [63:0] io_resp_bits_uop_exc_cause,
  output        io_resp_bits_uop_bypassable,
  output [4:0]  io_resp_bits_uop_mem_cmd,
  output [1:0]  io_resp_bits_uop_mem_size,
  output        io_resp_bits_uop_mem_signed,
  output        io_resp_bits_uop_is_fence,
  output        io_resp_bits_uop_is_fencei,
  output        io_resp_bits_uop_is_amo,
  output        io_resp_bits_uop_uses_ldq,
  output        io_resp_bits_uop_uses_stq,
  output        io_resp_bits_uop_is_sys_pc2epc,
  output        io_resp_bits_uop_is_unique,
  output        io_resp_bits_uop_flush_on_commit,
  output        io_resp_bits_uop_ldst_is_rs1,
  output [5:0]  io_resp_bits_uop_ldst,
  output [5:0]  io_resp_bits_uop_lrs1,
  output [5:0]  io_resp_bits_uop_lrs2,
  output [5:0]  io_resp_bits_uop_lrs3,
  output        io_resp_bits_uop_ldst_val,
  output [1:0]  io_resp_bits_uop_dst_rtype,
  output [1:0]  io_resp_bits_uop_lrs1_rtype,
  output [1:0]  io_resp_bits_uop_lrs2_rtype,
  output        io_resp_bits_uop_frs3_en,
  output        io_resp_bits_uop_fp_val,
  output        io_resp_bits_uop_fp_single,
  output        io_resp_bits_uop_xcpt_pf_if,
  output        io_resp_bits_uop_xcpt_ae_if,
  output        io_resp_bits_uop_xcpt_ma_if,
  output        io_resp_bits_uop_bp_debug_if,
  output        io_resp_bits_uop_bp_xcpt_if,
  output [1:0]  io_resp_bits_uop_debug_fsrc,
  output [1:0]  io_resp_bits_uop_debug_tsrc,
  output        io_resp_bits_predicated,
  output [64:0] io_resp_bits_data,
  output        io_resp_bits_fflags_valid,
  output        io_resp_bits_fflags_bits_uop_switch,
  output        io_resp_bits_fflags_bits_uop_switch_off,
  output        io_resp_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_resp_bits_fflags_bits_uop_shift,
  output [1:0]  io_resp_bits_fflags_bits_uop_lrs3_rtype,
  output        io_resp_bits_fflags_bits_uop_rflag,
  output        io_resp_bits_fflags_bits_uop_wflag,
  output [3:0]  io_resp_bits_fflags_bits_uop_prflag,
  output [3:0]  io_resp_bits_fflags_bits_uop_pwflag,
  output        io_resp_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_resp_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_resp_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_resp_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_resp_bits_fflags_bits_uop_split_num,
  output [5:0]  io_resp_bits_fflags_bits_uop_self_index,
  output [5:0]  io_resp_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_resp_bits_fflags_bits_uop_address_num,
  output [6:0]  io_resp_bits_fflags_bits_uop_uopc,
  output [31:0] io_resp_bits_fflags_bits_uop_inst,
  output [31:0] io_resp_bits_fflags_bits_uop_debug_inst,
  output        io_resp_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_resp_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_resp_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_resp_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_resp_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_resp_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_resp_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_resp_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_resp_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_resp_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_resp_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_resp_bits_fflags_bits_uop_ctrl_is_load,
  output        io_resp_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_resp_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_resp_bits_fflags_bits_uop_ctrl_op3_sel,
  output [1:0]  io_resp_bits_fflags_bits_uop_iw_state,
  output        io_resp_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_resp_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_resp_bits_fflags_bits_uop_is_br,
  output        io_resp_bits_fflags_bits_uop_is_jalr,
  output        io_resp_bits_fflags_bits_uop_is_jal,
  output        io_resp_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_resp_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_resp_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_resp_bits_fflags_bits_uop_ftq_idx,
  output        io_resp_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_resp_bits_fflags_bits_uop_pc_lob,
  output        io_resp_bits_fflags_bits_uop_taken,
  output [19:0] io_resp_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_resp_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_resp_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_resp_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_resp_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_resp_bits_fflags_bits_uop_pdst,
  output [6:0]  io_resp_bits_fflags_bits_uop_prs1,
  output [6:0]  io_resp_bits_fflags_bits_uop_prs2,
  output [6:0]  io_resp_bits_fflags_bits_uop_prs3,
  output [4:0]  io_resp_bits_fflags_bits_uop_ppred,
  output        io_resp_bits_fflags_bits_uop_prs1_busy,
  output        io_resp_bits_fflags_bits_uop_prs2_busy,
  output        io_resp_bits_fflags_bits_uop_prs3_busy,
  output        io_resp_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_resp_bits_fflags_bits_uop_stale_pdst,
  output        io_resp_bits_fflags_bits_uop_exception,
  output [63:0] io_resp_bits_fflags_bits_uop_exc_cause,
  output        io_resp_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_resp_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_resp_bits_fflags_bits_uop_mem_size,
  output        io_resp_bits_fflags_bits_uop_mem_signed,
  output        io_resp_bits_fflags_bits_uop_is_fence,
  output        io_resp_bits_fflags_bits_uop_is_fencei,
  output        io_resp_bits_fflags_bits_uop_is_amo,
  output        io_resp_bits_fflags_bits_uop_uses_ldq,
  output        io_resp_bits_fflags_bits_uop_uses_stq,
  output        io_resp_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_resp_bits_fflags_bits_uop_is_unique,
  output        io_resp_bits_fflags_bits_uop_flush_on_commit,
  output        io_resp_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_resp_bits_fflags_bits_uop_ldst,
  output [5:0]  io_resp_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_resp_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_resp_bits_fflags_bits_uop_lrs3,
  output        io_resp_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_resp_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_resp_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_resp_bits_fflags_bits_uop_lrs2_rtype,
  output        io_resp_bits_fflags_bits_uop_frs3_en,
  output        io_resp_bits_fflags_bits_uop_fp_val,
  output        io_resp_bits_fflags_bits_uop_fp_single,
  output        io_resp_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_resp_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_resp_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_resp_bits_fflags_bits_uop_bp_debug_if,
  output        io_resp_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_resp_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_resp_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_resp_bits_fflags_bits_flags,
  output [39:0] io_resp_bits_addr,
  output        io_resp_bits_mxcpt_valid,
  output [16:0] io_resp_bits_mxcpt_bits,
  output        io_resp_bits_sfence_valid,
  output        io_resp_bits_sfence_bits_rs1,
  output        io_resp_bits_sfence_bits_rs2,
  output [38:0] io_resp_bits_sfence_bits_addr,
  output        io_resp_bits_sfence_bits_asid,
  output [3:0]  io_resp_bits_flagdata,
  output        io_resp_bits_fflagdata_valid,
  output        io_resp_bits_fflagdata_bits_uop_switch,
  output        io_resp_bits_fflagdata_bits_uop_switch_off,
  output        io_resp_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_resp_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_resp_bits_fflagdata_bits_uop_rflag,
  output        io_resp_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_pwflag,
  output        io_resp_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_resp_bits_fflagdata_bits_uop_inst,
  output [31:0] io_resp_bits_fflagdata_bits_uop_debug_inst,
  output        io_resp_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_resp_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_resp_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_resp_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_resp_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_resp_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_resp_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_iw_state,
  output        io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_resp_bits_fflagdata_bits_uop_is_br,
  output        io_resp_bits_fflagdata_bits_uop_is_jalr,
  output        io_resp_bits_fflagdata_bits_uop_is_jal,
  output        io_resp_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_resp_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_resp_bits_fflagdata_bits_uop_ftq_idx,
  output        io_resp_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_pc_lob,
  output        io_resp_bits_fflagdata_bits_uop_taken,
  output [19:0] io_resp_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_resp_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_resp_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_resp_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_resp_bits_fflagdata_bits_uop_ppred,
  output        io_resp_bits_fflagdata_bits_uop_prs1_busy,
  output        io_resp_bits_fflagdata_bits_uop_prs2_busy,
  output        io_resp_bits_fflagdata_bits_uop_prs3_busy,
  output        io_resp_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_stale_pdst,
  output        io_resp_bits_fflagdata_bits_uop_exception,
  output [63:0] io_resp_bits_fflagdata_bits_uop_exc_cause,
  output        io_resp_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_resp_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_mem_size,
  output        io_resp_bits_fflagdata_bits_uop_mem_signed,
  output        io_resp_bits_fflagdata_bits_uop_is_fence,
  output        io_resp_bits_fflagdata_bits_uop_is_fencei,
  output        io_resp_bits_fflagdata_bits_uop_is_amo,
  output        io_resp_bits_fflagdata_bits_uop_uses_ldq,
  output        io_resp_bits_fflagdata_bits_uop_uses_stq,
  output        io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_resp_bits_fflagdata_bits_uop_is_unique,
  output        io_resp_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_resp_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_lrs3,
  output        io_resp_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_resp_bits_fflagdata_bits_uop_frs3_en,
  output        io_resp_bits_fflagdata_bits_uop_fp_val,
  output        io_resp_bits_fflagdata_bits_uop_fp_single,
  output        io_resp_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_resp_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_resp_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_resp_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_resp_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_resp_bits_fflagdata_bits_fflag,
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
  input  [2:0]  io_fcsr_rm
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
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [63:0] _RAND_67;
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
  reg [31:0] _RAND_119;
  reg [63:0] _RAND_120;
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
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [63:0] _RAND_164;
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
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [95:0] _RAND_202;
  reg [95:0] _RAND_203;
`endif // RANDOMIZE_REG_INIT
  wire  fp_decoder_clock; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_reset; // @[functional-unit.scala 1011:26]
  wire [6:0] fp_decoder_io_uopc; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_ldst; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_wen; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_ren1; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_ren2; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_ren3; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_swap12; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_swap23; // @[functional-unit.scala 1011:26]
  wire [1:0] fp_decoder_io_sigs_typeTagIn; // @[functional-unit.scala 1011:26]
  wire [1:0] fp_decoder_io_sigs_typeTagOut; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_fromint; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_toint; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_fastpipe; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_fma; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_div; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_sqrt; // @[functional-unit.scala 1011:26]
  wire  fp_decoder_io_sigs_wflags; // @[functional-unit.scala 1011:26]
  wire  ifpu_clock; // @[functional-unit.scala 1065:20]
  wire  ifpu_reset; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_valid; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_ldst; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_wen; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_ren1; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_ren2; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_ren3; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_swap12; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_swap23; // @[functional-unit.scala 1065:20]
  wire [1:0] ifpu_io_in_bits_typeTagIn; // @[functional-unit.scala 1065:20]
  wire [1:0] ifpu_io_in_bits_typeTagOut; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_fromint; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_toint; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_fastpipe; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_fma; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_div; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_sqrt; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_wflags; // @[functional-unit.scala 1065:20]
  wire [2:0] ifpu_io_in_bits_rm; // @[functional-unit.scala 1065:20]
  wire [1:0] ifpu_io_in_bits_typ; // @[functional-unit.scala 1065:20]
  wire [63:0] ifpu_io_in_bits_in1; // @[functional-unit.scala 1065:20]
  wire [1:0] ifpu_io_in_bits_fmt; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_is_unicore; // @[functional-unit.scala 1065:20]
  wire [6:0] ifpu_io_in_bits_exc_enabled; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_in_bits_c; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_out_valid; // @[functional-unit.scala 1065:20]
  wire [64:0] ifpu_io_out_bits_data; // @[functional-unit.scala 1065:20]
  wire [4:0] ifpu_io_out_bits_exc; // @[functional-unit.scala 1065:20]
  wire [6:0] ifpu_io_out_bits_u_exception; // @[functional-unit.scala 1065:20]
  wire [9:0] ifpu_io_out_bits_u_flag; // @[functional-unit.scala 1065:20]
  wire  ifpu_io_out_bits_u_c; // @[functional-unit.scala 1065:20]
  reg  REG__0; // @[functional-unit.scala 239:27]
  reg  REG__1; // @[functional-unit.scala 239:27]
  reg  REG_1_0_switch; // @[functional-unit.scala 240:23]
  reg  REG_1_0_switch_off; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_unicore; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_0_shift; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_lrs3_rtype; // @[functional-unit.scala 240:23]
  reg  REG_1_0_rflag; // @[functional-unit.scala 240:23]
  reg  REG_1_0_wflag; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_prflag; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_pwflag; // @[functional-unit.scala 240:23]
  reg  REG_1_0_pflag_busy; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_stale_pflag; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_op1_sel; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_op2_sel; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_split_num; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_self_index; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_rob_inst_idx; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_address_num; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_uopc; // @[functional-unit.scala 240:23]
  reg [31:0] REG_1_0_inst; // @[functional-unit.scala 240:23]
  reg [31:0] REG_1_0_debug_inst; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_rvc; // @[functional-unit.scala 240:23]
  reg [39:0] REG_1_0_debug_pc; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_0_iq_type; // @[functional-unit.scala 240:23]
  reg [9:0] REG_1_0_fu_code; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_ctrl_br_type; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_ctrl_op1_sel; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_0_ctrl_op2_sel; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_0_ctrl_imm_sel; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_ctrl_op_fcn; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ctrl_fcn_dw; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_0_ctrl_csr_cmd; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ctrl_is_load; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ctrl_is_sta; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ctrl_is_std; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_ctrl_op3_sel; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_iw_state; // @[functional-unit.scala 240:23]
  reg  REG_1_0_iw_p1_poisoned; // @[functional-unit.scala 240:23]
  reg  REG_1_0_iw_p2_poisoned; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_br; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_jalr; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_jal; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_sfb; // @[functional-unit.scala 240:23]
  reg [11:0] REG_1_0_br_mask; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_br_tag; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_0_ftq_idx; // @[functional-unit.scala 240:23]
  reg  REG_1_0_edge_inst; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_pc_lob; // @[functional-unit.scala 240:23]
  reg  REG_1_0_taken; // @[functional-unit.scala 240:23]
  reg [19:0] REG_1_0_imm_packed; // @[functional-unit.scala 240:23]
  reg [11:0] REG_1_0_csr_addr; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_rob_idx; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_0_ldq_idx; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_0_stq_idx; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_rxq_idx; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_pdst; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_prs1; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_prs2; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_prs3; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_0_ppred; // @[functional-unit.scala 240:23]
  reg  REG_1_0_prs1_busy; // @[functional-unit.scala 240:23]
  reg  REG_1_0_prs2_busy; // @[functional-unit.scala 240:23]
  reg  REG_1_0_prs3_busy; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ppred_busy; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_stale_pdst; // @[functional-unit.scala 240:23]
  reg  REG_1_0_exception; // @[functional-unit.scala 240:23]
  reg [63:0] REG_1_0_exc_cause; // @[functional-unit.scala 240:23]
  reg  REG_1_0_bypassable; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_0_mem_cmd; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_mem_size; // @[functional-unit.scala 240:23]
  reg  REG_1_0_mem_signed; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_fence; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_fencei; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_amo; // @[functional-unit.scala 240:23]
  reg  REG_1_0_uses_ldq; // @[functional-unit.scala 240:23]
  reg  REG_1_0_uses_stq; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_sys_pc2epc; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_unique; // @[functional-unit.scala 240:23]
  reg  REG_1_0_flush_on_commit; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ldst_is_rs1; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_ldst; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_lrs1; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_lrs2; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_lrs3; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ldst_val; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_dst_rtype; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_lrs1_rtype; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_lrs2_rtype; // @[functional-unit.scala 240:23]
  reg  REG_1_0_frs3_en; // @[functional-unit.scala 240:23]
  reg  REG_1_0_fp_val; // @[functional-unit.scala 240:23]
  reg  REG_1_0_fp_single; // @[functional-unit.scala 240:23]
  reg  REG_1_0_xcpt_pf_if; // @[functional-unit.scala 240:23]
  reg  REG_1_0_xcpt_ae_if; // @[functional-unit.scala 240:23]
  reg  REG_1_0_xcpt_ma_if; // @[functional-unit.scala 240:23]
  reg  REG_1_0_bp_debug_if; // @[functional-unit.scala 240:23]
  reg  REG_1_0_bp_xcpt_if; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_debug_fsrc; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_debug_tsrc; // @[functional-unit.scala 240:23]
  reg  REG_1_1_switch; // @[functional-unit.scala 240:23]
  reg  REG_1_1_switch_off; // @[functional-unit.scala 240:23]
  reg  REG_1_1_is_unicore; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_1_shift; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_1_lrs3_rtype; // @[functional-unit.scala 240:23]
  reg  REG_1_1_rflag; // @[functional-unit.scala 240:23]
  reg  REG_1_1_wflag; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_1_prflag; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_1_pwflag; // @[functional-unit.scala 240:23]
  reg  REG_1_1_pflag_busy; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_1_stale_pflag; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_1_op1_sel; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_1_op2_sel; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_1_split_num; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_1_self_index; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_1_rob_inst_idx; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_1_address_num; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_1_uopc; // @[functional-unit.scala 240:23]
  reg [31:0] REG_1_1_inst; // @[functional-unit.scala 240:23]
  reg [31:0] REG_1_1_debug_inst; // @[functional-unit.scala 240:23]
  reg  REG_1_1_is_rvc; // @[functional-unit.scala 240:23]
  reg [39:0] REG_1_1_debug_pc; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_1_iq_type; // @[functional-unit.scala 240:23]
  reg [9:0] REG_1_1_fu_code; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_1_ctrl_br_type; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_1_ctrl_op1_sel; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_1_ctrl_op2_sel; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_1_ctrl_imm_sel; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_1_ctrl_op_fcn; // @[functional-unit.scala 240:23]
  reg  REG_1_1_ctrl_fcn_dw; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_1_ctrl_csr_cmd; // @[functional-unit.scala 240:23]
  reg  REG_1_1_ctrl_is_load; // @[functional-unit.scala 240:23]
  reg  REG_1_1_ctrl_is_sta; // @[functional-unit.scala 240:23]
  reg  REG_1_1_ctrl_is_std; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_1_ctrl_op3_sel; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_1_iw_state; // @[functional-unit.scala 240:23]
  reg  REG_1_1_iw_p1_poisoned; // @[functional-unit.scala 240:23]
  reg  REG_1_1_iw_p2_poisoned; // @[functional-unit.scala 240:23]
  reg  REG_1_1_is_br; // @[functional-unit.scala 240:23]
  reg  REG_1_1_is_jalr; // @[functional-unit.scala 240:23]
  reg  REG_1_1_is_jal; // @[functional-unit.scala 240:23]
  reg  REG_1_1_is_sfb; // @[functional-unit.scala 240:23]
  reg [11:0] REG_1_1_br_mask; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_1_br_tag; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_1_ftq_idx; // @[functional-unit.scala 240:23]
  reg  REG_1_1_edge_inst; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_1_pc_lob; // @[functional-unit.scala 240:23]
  reg  REG_1_1_taken; // @[functional-unit.scala 240:23]
  reg [19:0] REG_1_1_imm_packed; // @[functional-unit.scala 240:23]
  reg [11:0] REG_1_1_csr_addr; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_1_rob_idx; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_1_ldq_idx; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_1_stq_idx; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_1_rxq_idx; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_1_pdst; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_1_prs1; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_1_prs2; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_1_prs3; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_1_ppred; // @[functional-unit.scala 240:23]
  reg  REG_1_1_prs1_busy; // @[functional-unit.scala 240:23]
  reg  REG_1_1_prs2_busy; // @[functional-unit.scala 240:23]
  reg  REG_1_1_prs3_busy; // @[functional-unit.scala 240:23]
  reg  REG_1_1_ppred_busy; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_1_stale_pdst; // @[functional-unit.scala 240:23]
  reg  REG_1_1_exception; // @[functional-unit.scala 240:23]
  reg [63:0] REG_1_1_exc_cause; // @[functional-unit.scala 240:23]
  reg  REG_1_1_bypassable; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_1_mem_cmd; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_1_mem_size; // @[functional-unit.scala 240:23]
  reg  REG_1_1_mem_signed; // @[functional-unit.scala 240:23]
  reg  REG_1_1_is_fence; // @[functional-unit.scala 240:23]
  reg  REG_1_1_is_fencei; // @[functional-unit.scala 240:23]
  reg  REG_1_1_is_amo; // @[functional-unit.scala 240:23]
  reg  REG_1_1_uses_ldq; // @[functional-unit.scala 240:23]
  reg  REG_1_1_uses_stq; // @[functional-unit.scala 240:23]
  reg  REG_1_1_is_sys_pc2epc; // @[functional-unit.scala 240:23]
  reg  REG_1_1_is_unique; // @[functional-unit.scala 240:23]
  reg  REG_1_1_flush_on_commit; // @[functional-unit.scala 240:23]
  reg  REG_1_1_ldst_is_rs1; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_1_ldst; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_1_lrs1; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_1_lrs2; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_1_lrs3; // @[functional-unit.scala 240:23]
  reg  REG_1_1_ldst_val; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_1_dst_rtype; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_1_lrs1_rtype; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_1_lrs2_rtype; // @[functional-unit.scala 240:23]
  reg  REG_1_1_frs3_en; // @[functional-unit.scala 240:23]
  reg  REG_1_1_fp_val; // @[functional-unit.scala 240:23]
  reg  REG_1_1_fp_single; // @[functional-unit.scala 240:23]
  reg  REG_1_1_xcpt_pf_if; // @[functional-unit.scala 240:23]
  reg  REG_1_1_xcpt_ae_if; // @[functional-unit.scala 240:23]
  reg  REG_1_1_xcpt_ma_if; // @[functional-unit.scala 240:23]
  reg  REG_1_1_bp_debug_if; // @[functional-unit.scala 240:23]
  reg  REG_1_1_bp_xcpt_if; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_1_debug_fsrc; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_1_debug_tsrc; // @[functional-unit.scala 240:23]
  wire [11:0] _T = io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask; // @[util.scala 175:51]
  wire  _T_1 = _T != 12'h0; // @[util.scala 175:59]
  wire  _T_4 = ~io_req_bits_kill; // @[functional-unit.scala 243:87]
  wire [11:0] _T_6 = ~io_brupdate_b1_resolve_mask; // @[util.scala 142:27]
  wire [11:0] _T_8 = io_brupdate_b1_mispredict_mask & REG_1_0_br_mask; // @[util.scala 175:51]
  wire  _T_9 = _T_8 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_16 = io_brupdate_b1_mispredict_mask & REG_1_1_br_mask; // @[util.scala 175:51]
  wire  _T_17 = _T_16 != 12'h0; // @[util.scala 175:59]
  wire  special = io_req_bits_uop_uopc == 7'h48 | io_req_bits_uop_uopc == 7'h49; // @[functional-unit.scala 1015:48]
  wire [2:0] _T_32 = io_req_bits_uop_imm_packed[18:16] == 3'h5 ? 3'h4 : io_req_bits_uop_imm_packed[18:16]; // @[util.scala 354:27]
  wire [2:0] _T_33 = io_req_bits_uop_imm_packed[18:16] == 3'h4 ? 3'h5 : _T_32; // @[util.scala 353:27]
  wire [2:0] _T_34 = io_req_bits_uop_imm_packed[18:16] == 3'h3 ? 3'h2 : _T_33; // @[util.scala 352:27]
  wire [2:0] _T_35 = io_req_bits_uop_imm_packed[18:16] == 3'h2 ? 3'h3 : _T_34; // @[util.scala 351:27]
  wire [2:0] _T_45 = io_req_bits_fflagdata[2:0] == 3'h5 ? 3'h4 : io_req_bits_fflagdata[2:0]; // @[util.scala 354:27]
  wire [2:0] _T_46 = io_req_bits_fflagdata[2:0] == 3'h4 ? 3'h5 : _T_45; // @[util.scala 353:27]
  wire [2:0] _T_47 = io_req_bits_fflagdata[2:0] == 3'h3 ? 3'h2 : _T_46; // @[util.scala 352:27]
  wire [2:0] _T_48 = io_req_bits_fflagdata[2:0] == 3'h2 ? 3'h3 : _T_47; // @[util.scala 351:27]
  wire [2:0] _T_49 = special ? _T_35 : _T_48; // @[functional-unit.scala 1016:45]
  wire [2:0] _T_53 = io_req_bits_uop_imm_packed[2:0] == 3'h7 ? io_fcsr_rm : io_req_bits_uop_imm_packed[2:0]; // @[functional-unit.scala 1017:45]
  wire [2:0] fp_rm = io_req_bits_uop_is_unicore ? _T_49 : _T_53; // @[functional-unit.scala 1016:18]
  wire [6:0] req_exc_enabled = io_req_bits_uop_is_unicore ? io_req_bits_fflagdata[16:10] : 7'h7f; // @[functional-unit.scala 1024:25]
  wire  req_c = io_req_bits_uop_is_unicore & io_req_bits_fflagdata[29]; // @[functional-unit.scala 1025:15]
  wire  unswizzled_hi_hi = io_req_bits_rs1_data[31]; // @[FPU.scala 364:14]
  wire  unswizzled_hi_lo = io_req_bits_rs1_data[52]; // @[FPU.scala 365:14]
  wire [30:0] unswizzled_lo = io_req_bits_rs1_data[30:0]; // @[FPU.scala 366:14]
  wire [32:0] unswizzled = {unswizzled_hi_hi,unswizzled_hi_lo,unswizzled_lo}; // @[Cat.scala 30:58]
  wire  hi_hi = unswizzled[32]; // @[FPU.scala 280:17]
  wire [22:0] fractIn = unswizzled[22:0]; // @[FPU.scala 281:20]
  wire [8:0] expIn = unswizzled[31:23]; // @[FPU.scala 282:18]
  wire [75:0] _fractOut_T = {fractIn, 53'h0}; // @[FPU.scala 283:28]
  wire [51:0] lo = _fractOut_T[75:24]; // @[FPU.scala 283:38]
  wire [2:0] expOut_hi = expIn[8:6]; // @[FPU.scala 285:26]
  wire [11:0] _GEN_6 = {{3'd0}, expIn}; // @[FPU.scala 286:31]
  wire [11:0] _expOut_commonCase_T_1 = _GEN_6 + 12'h800; // @[FPU.scala 286:31]
  wire [11:0] expOut_commonCase = _expOut_commonCase_T_1 - 12'h100; // @[FPU.scala 286:48]
  wire [8:0] expOut_lo = expOut_commonCase[8:0]; // @[FPU.scala 287:65]
  wire [11:0] _expOut_T_3 = {expOut_hi,expOut_lo}; // @[Cat.scala 30:58]
  wire [11:0] hi_lo = expOut_hi == 3'h0 | expOut_hi >= 3'h6 ? _expOut_T_3 : expOut_commonCase; // @[FPU.scala 287:10]
  wire [64:0] floats_0 = {hi_hi,hi_lo,lo}; // @[Cat.scala 30:58]
  wire  isbox = &io_req_bits_rs1_data[64:60]; // @[FPU.scala 339:84]
  wire [1:0] _truncIdx_T = fp_decoder_io_sigs_typeTagIn; // @[package.scala 31:21]
  wire  truncIdx = _truncIdx_T[0]; // @[package.scala 31:49]
  wire  _T_61 = truncIdx | isbox; // @[package.scala 32:76]
  wire [64:0] _T_63 = truncIdx ? io_req_bits_rs1_data : floats_0; // @[package.scala 32:76]
  wire [64:0] req_in1 = _T_61 ? _T_63 : 65'he008000000000000; // @[FPU.scala 376:10]
  wire [1:0] req_typ = io_req_bits_uop_is_unicore ? 2'h0 : io_req_bits_uop_imm_packed[9:8]; // @[functional-unit.scala 1034:17]
  wire  _T_72 = io_req_bits_uop_is_unicore & io_req_valid; // @[functional-unit.scala 1039:30]
  reg [4:0] value_lo; // @[Counters.scala 45:37]
  wire [5:0] nextSmall = value_lo + 5'h1; // @[Counters.scala 46:33]
  reg [26:0] value_hi; // @[Counters.scala 50:27]
  wire [26:0] _large_r_T_1 = value_hi + 27'h1; // @[Counters.scala 51:55]
  wire [31:0] value = {value_hi,value_lo}; // @[Cat.scala 30:58]
  wire  _T_90 = fp_decoder_io_sigs_typeTagOut == 2'h1; // @[functional-unit.scala 1069:58]
  reg  v; // @[Valid.scala 117:22]
  reg  b; // @[Reg.scala 15:16]
  reg  outPipe_bits; // @[Reg.scala 15:16]
  reg  v_1; // @[Valid.scala 117:22]
  reg [64:0] b_1; // @[Reg.scala 15:16]
  reg [64:0] outPipe_bits_1; // @[Reg.scala 15:16]
  wire  opts_bigger_swizzledNaN_hi_lo_lo = ifpu_io_out_bits_data[31]; // @[FPU.scala 347:8]
  wire  opts_bigger_swizzledNaN_lo_hi_lo = ifpu_io_out_bits_data[32]; // @[FPU.scala 349:8]
  wire [30:0] opts_bigger_swizzledNaN_lo_lo = ifpu_io_out_bits_data[30:0]; // @[FPU.scala 350:8]
  wire [64:0] opts_bigger_swizzledNaN = {5'h1f,7'h7f,opts_bigger_swizzledNaN_hi_lo_lo,20'hfffff,
    opts_bigger_swizzledNaN_lo_hi_lo,opts_bigger_swizzledNaN_lo_lo}; // @[Cat.scala 30:58]
  UOPCodeFPUDecoder fp_decoder ( // @[functional-unit.scala 1011:26]
    .clock(fp_decoder_clock),
    .reset(fp_decoder_reset),
    .io_uopc(fp_decoder_io_uopc),
    .io_sigs_ldst(fp_decoder_io_sigs_ldst),
    .io_sigs_wen(fp_decoder_io_sigs_wen),
    .io_sigs_ren1(fp_decoder_io_sigs_ren1),
    .io_sigs_ren2(fp_decoder_io_sigs_ren2),
    .io_sigs_ren3(fp_decoder_io_sigs_ren3),
    .io_sigs_swap12(fp_decoder_io_sigs_swap12),
    .io_sigs_swap23(fp_decoder_io_sigs_swap23),
    .io_sigs_typeTagIn(fp_decoder_io_sigs_typeTagIn),
    .io_sigs_typeTagOut(fp_decoder_io_sigs_typeTagOut),
    .io_sigs_fromint(fp_decoder_io_sigs_fromint),
    .io_sigs_toint(fp_decoder_io_sigs_toint),
    .io_sigs_fastpipe(fp_decoder_io_sigs_fastpipe),
    .io_sigs_fma(fp_decoder_io_sigs_fma),
    .io_sigs_div(fp_decoder_io_sigs_div),
    .io_sigs_sqrt(fp_decoder_io_sigs_sqrt),
    .io_sigs_wflags(fp_decoder_io_sigs_wflags)
  );
  IntToFP ifpu ( // @[functional-unit.scala 1065:20]
    .clock(ifpu_clock),
    .reset(ifpu_reset),
    .io_in_valid(ifpu_io_in_valid),
    .io_in_bits_ldst(ifpu_io_in_bits_ldst),
    .io_in_bits_wen(ifpu_io_in_bits_wen),
    .io_in_bits_ren1(ifpu_io_in_bits_ren1),
    .io_in_bits_ren2(ifpu_io_in_bits_ren2),
    .io_in_bits_ren3(ifpu_io_in_bits_ren3),
    .io_in_bits_swap12(ifpu_io_in_bits_swap12),
    .io_in_bits_swap23(ifpu_io_in_bits_swap23),
    .io_in_bits_typeTagIn(ifpu_io_in_bits_typeTagIn),
    .io_in_bits_typeTagOut(ifpu_io_in_bits_typeTagOut),
    .io_in_bits_fromint(ifpu_io_in_bits_fromint),
    .io_in_bits_toint(ifpu_io_in_bits_toint),
    .io_in_bits_fastpipe(ifpu_io_in_bits_fastpipe),
    .io_in_bits_fma(ifpu_io_in_bits_fma),
    .io_in_bits_div(ifpu_io_in_bits_div),
    .io_in_bits_sqrt(ifpu_io_in_bits_sqrt),
    .io_in_bits_wflags(ifpu_io_in_bits_wflags),
    .io_in_bits_rm(ifpu_io_in_bits_rm),
    .io_in_bits_typ(ifpu_io_in_bits_typ),
    .io_in_bits_in1(ifpu_io_in_bits_in1),
    .io_in_bits_fmt(ifpu_io_in_bits_fmt),
    .io_in_bits_is_unicore(ifpu_io_in_bits_is_unicore),
    .io_in_bits_exc_enabled(ifpu_io_in_bits_exc_enabled),
    .io_in_bits_c(ifpu_io_in_bits_c),
    .io_out_valid(ifpu_io_out_valid),
    .io_out_bits_data(ifpu_io_out_bits_data),
    .io_out_bits_exc(ifpu_io_out_bits_exc),
    .io_out_bits_u_exception(ifpu_io_out_bits_u_exception),
    .io_out_bits_u_flag(ifpu_io_out_bits_u_flag),
    .io_out_bits_u_c(ifpu_io_out_bits_u_c)
  );
  assign io_req_ready = 1'h1; // @[functional-unit.scala 236:16]
  assign io_resp_valid = REG__1 & ~_T_17; // @[functional-unit.scala 260:47]
  assign io_resp_bits_uop_switch = REG_1_1_switch; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_switch_off = REG_1_1_switch_off; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_unicore = REG_1_1_is_unicore; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_shift = REG_1_1_shift; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs3_rtype = REG_1_1_lrs3_rtype; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_rflag = REG_1_1_rflag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_wflag = REG_1_1_wflag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prflag = REG_1_1_prflag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_pwflag = REG_1_1_pwflag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_pflag_busy = REG_1_1_pflag_busy; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_stale_pflag = REG_1_1_stale_pflag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_op1_sel = REG_1_1_op1_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_op2_sel = REG_1_1_op2_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_split_num = REG_1_1_split_num; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_self_index = REG_1_1_self_index; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_rob_inst_idx = REG_1_1_rob_inst_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_address_num = REG_1_1_address_num; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_uopc = REG_1_1_uopc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_inst = REG_1_1_inst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_debug_inst = REG_1_1_debug_inst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_rvc = REG_1_1_is_rvc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_debug_pc = REG_1_1_debug_pc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_iq_type = REG_1_1_iq_type; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_fu_code = REG_1_1_fu_code; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_br_type = REG_1_1_ctrl_br_type; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_op1_sel = REG_1_1_ctrl_op1_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_op2_sel = REG_1_1_ctrl_op2_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_imm_sel = REG_1_1_ctrl_imm_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_op_fcn = REG_1_1_ctrl_op_fcn; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_fcn_dw = REG_1_1_ctrl_fcn_dw; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_csr_cmd = REG_1_1_ctrl_csr_cmd; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_is_load = REG_1_1_ctrl_is_load; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_is_sta = REG_1_1_ctrl_is_sta; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_is_std = REG_1_1_ctrl_is_std; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_op3_sel = REG_1_1_ctrl_op3_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_iw_state = REG_1_1_iw_state; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_iw_p1_poisoned = REG_1_1_iw_p1_poisoned; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_iw_p2_poisoned = REG_1_1_iw_p2_poisoned; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_br = REG_1_1_is_br; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_jalr = REG_1_1_is_jalr; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_jal = REG_1_1_is_jal; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_sfb = REG_1_1_is_sfb; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_br_mask = REG_1_1_br_mask & _T_6; // @[util.scala 142:25]
  assign io_resp_bits_uop_br_tag = REG_1_1_br_tag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ftq_idx = REG_1_1_ftq_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_edge_inst = REG_1_1_edge_inst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_pc_lob = REG_1_1_pc_lob; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_taken = REG_1_1_taken; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_imm_packed = REG_1_1_imm_packed; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_csr_addr = REG_1_1_csr_addr; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_rob_idx = REG_1_1_rob_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ldq_idx = REG_1_1_ldq_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_stq_idx = REG_1_1_stq_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_rxq_idx = REG_1_1_rxq_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_pdst = REG_1_1_pdst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs1 = REG_1_1_prs1; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs2 = REG_1_1_prs2; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs3 = REG_1_1_prs3; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ppred = REG_1_1_ppred; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs1_busy = REG_1_1_prs1_busy; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs2_busy = REG_1_1_prs2_busy; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs3_busy = REG_1_1_prs3_busy; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ppred_busy = REG_1_1_ppred_busy; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_stale_pdst = REG_1_1_stale_pdst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_exception = REG_1_1_exception; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_exc_cause = REG_1_1_exc_cause; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_bypassable = REG_1_1_bypassable; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_mem_cmd = REG_1_1_mem_cmd; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_mem_size = REG_1_1_mem_size; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_mem_signed = REG_1_1_mem_signed; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_fence = REG_1_1_is_fence; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_fencei = REG_1_1_is_fencei; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_amo = REG_1_1_is_amo; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_uses_ldq = REG_1_1_uses_ldq; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_uses_stq = REG_1_1_uses_stq; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_sys_pc2epc = REG_1_1_is_sys_pc2epc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_unique = REG_1_1_is_unique; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_flush_on_commit = REG_1_1_flush_on_commit; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ldst_is_rs1 = REG_1_1_ldst_is_rs1; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ldst = REG_1_1_ldst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs1 = REG_1_1_lrs1; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs2 = REG_1_1_lrs2; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs3 = REG_1_1_lrs3; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ldst_val = REG_1_1_ldst_val; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_dst_rtype = REG_1_1_dst_rtype; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs1_rtype = REG_1_1_lrs1_rtype; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs2_rtype = REG_1_1_lrs2_rtype; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_frs3_en = REG_1_1_frs3_en; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_fp_val = REG_1_1_fp_val; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_fp_single = REG_1_1_fp_single; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_xcpt_pf_if = REG_1_1_xcpt_pf_if; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_xcpt_ae_if = REG_1_1_xcpt_ae_if; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_xcpt_ma_if = REG_1_1_xcpt_ma_if; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_bp_debug_if = REG_1_1_bp_debug_if; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_bp_xcpt_if = REG_1_1_bp_xcpt_if; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_debug_fsrc = REG_1_1_debug_fsrc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_debug_tsrc = REG_1_1_debug_tsrc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_predicated = 1'h0; // @[functional-unit.scala 261:29]
  assign io_resp_bits_data = outPipe_bits ? ifpu_io_out_bits_data : opts_bigger_swizzledNaN; // @[package.scala 32:76]
  assign io_resp_bits_fflags_valid = ifpu_io_out_valid & ~io_resp_bits_uop_is_unicore; // @[functional-unit.scala 1078:55]
  assign io_resp_bits_fflags_bits_uop_switch = io_resp_bits_uop_switch; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_switch_off = io_resp_bits_uop_switch_off; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_is_unicore = io_resp_bits_uop_is_unicore; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_shift = io_resp_bits_uop_shift; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_lrs3_rtype = io_resp_bits_uop_lrs3_rtype; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_rflag = io_resp_bits_uop_rflag; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_wflag = io_resp_bits_uop_wflag; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_prflag = io_resp_bits_uop_prflag; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_pwflag = io_resp_bits_uop_pwflag; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_pflag_busy = io_resp_bits_uop_pflag_busy; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_stale_pflag = io_resp_bits_uop_stale_pflag; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_op1_sel = io_resp_bits_uop_op1_sel; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_op2_sel = io_resp_bits_uop_op2_sel; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_split_num = io_resp_bits_uop_split_num; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_self_index = io_resp_bits_uop_self_index; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_rob_inst_idx = io_resp_bits_uop_rob_inst_idx; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_address_num = io_resp_bits_uop_address_num; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_uopc = io_resp_bits_uop_uopc; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_inst = io_resp_bits_uop_inst; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_debug_inst = io_resp_bits_uop_debug_inst; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_is_rvc = io_resp_bits_uop_is_rvc; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_debug_pc = io_resp_bits_uop_debug_pc; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_iq_type = io_resp_bits_uop_iq_type; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_fu_code = io_resp_bits_uop_fu_code; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ctrl_br_type = io_resp_bits_uop_ctrl_br_type; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ctrl_op1_sel = io_resp_bits_uop_ctrl_op1_sel; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ctrl_op2_sel = io_resp_bits_uop_ctrl_op2_sel; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ctrl_imm_sel = io_resp_bits_uop_ctrl_imm_sel; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ctrl_op_fcn = io_resp_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ctrl_fcn_dw = io_resp_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ctrl_csr_cmd = io_resp_bits_uop_ctrl_csr_cmd; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ctrl_is_load = io_resp_bits_uop_ctrl_is_load; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ctrl_is_sta = io_resp_bits_uop_ctrl_is_sta; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ctrl_is_std = io_resp_bits_uop_ctrl_is_std; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ctrl_op3_sel = io_resp_bits_uop_ctrl_op3_sel; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_iw_state = io_resp_bits_uop_iw_state; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_iw_p1_poisoned = io_resp_bits_uop_iw_p1_poisoned; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_iw_p2_poisoned = io_resp_bits_uop_iw_p2_poisoned; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_is_br = io_resp_bits_uop_is_br; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_is_jalr = io_resp_bits_uop_is_jalr; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_is_jal = io_resp_bits_uop_is_jal; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_is_sfb = io_resp_bits_uop_is_sfb; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_br_mask = io_resp_bits_uop_br_mask; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_br_tag = io_resp_bits_uop_br_tag; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ftq_idx = io_resp_bits_uop_ftq_idx; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_edge_inst = io_resp_bits_uop_edge_inst; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_pc_lob = io_resp_bits_uop_pc_lob; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_taken = io_resp_bits_uop_taken; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_imm_packed = io_resp_bits_uop_imm_packed; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_csr_addr = io_resp_bits_uop_csr_addr; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_rob_idx = io_resp_bits_uop_rob_idx; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ldq_idx = io_resp_bits_uop_ldq_idx; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_stq_idx = io_resp_bits_uop_stq_idx; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_rxq_idx = io_resp_bits_uop_rxq_idx; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_pdst = io_resp_bits_uop_pdst; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_prs1 = io_resp_bits_uop_prs1; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_prs2 = io_resp_bits_uop_prs2; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_prs3 = io_resp_bits_uop_prs3; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ppred = io_resp_bits_uop_ppred; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_prs1_busy = io_resp_bits_uop_prs1_busy; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_prs2_busy = io_resp_bits_uop_prs2_busy; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_prs3_busy = io_resp_bits_uop_prs3_busy; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ppred_busy = io_resp_bits_uop_ppred_busy; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_stale_pdst = io_resp_bits_uop_stale_pdst; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_exception = io_resp_bits_uop_exception; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_exc_cause = io_resp_bits_uop_exc_cause; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_bypassable = io_resp_bits_uop_bypassable; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_mem_cmd = io_resp_bits_uop_mem_cmd; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_mem_size = io_resp_bits_uop_mem_size; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_mem_signed = io_resp_bits_uop_mem_signed; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_is_fence = io_resp_bits_uop_is_fence; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_is_fencei = io_resp_bits_uop_is_fencei; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_is_amo = io_resp_bits_uop_is_amo; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_uses_ldq = io_resp_bits_uop_uses_ldq; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_uses_stq = io_resp_bits_uop_uses_stq; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_is_sys_pc2epc = io_resp_bits_uop_is_sys_pc2epc; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_is_unique = io_resp_bits_uop_is_unique; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_flush_on_commit = io_resp_bits_uop_flush_on_commit; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ldst_is_rs1 = io_resp_bits_uop_ldst_is_rs1; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ldst = io_resp_bits_uop_ldst; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_lrs1 = io_resp_bits_uop_lrs1; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_lrs2 = io_resp_bits_uop_lrs2; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_lrs3 = io_resp_bits_uop_lrs3; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_ldst_val = io_resp_bits_uop_ldst_val; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_dst_rtype = io_resp_bits_uop_dst_rtype; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_lrs1_rtype = io_resp_bits_uop_lrs1_rtype; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_lrs2_rtype = io_resp_bits_uop_lrs2_rtype; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_frs3_en = io_resp_bits_uop_frs3_en; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_fp_val = io_resp_bits_uop_fp_val; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_fp_single = io_resp_bits_uop_fp_single; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_xcpt_pf_if = io_resp_bits_uop_xcpt_pf_if; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_xcpt_ae_if = io_resp_bits_uop_xcpt_ae_if; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_xcpt_ma_if = io_resp_bits_uop_xcpt_ma_if; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_bp_debug_if = io_resp_bits_uop_bp_debug_if; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_bp_xcpt_if = io_resp_bits_uop_bp_xcpt_if; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_debug_fsrc = io_resp_bits_uop_debug_fsrc; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_uop_debug_tsrc = io_resp_bits_uop_debug_tsrc; // @[functional-unit.scala 1079:34]
  assign io_resp_bits_fflags_bits_flags = ifpu_io_out_bits_exc; // @[functional-unit.scala 1080:34]
  assign io_resp_bits_addr = 40'h0;
  assign io_resp_bits_mxcpt_valid = 1'h0;
  assign io_resp_bits_mxcpt_bits = 17'h0;
  assign io_resp_bits_sfence_valid = 1'h0;
  assign io_resp_bits_sfence_bits_rs1 = 1'h0;
  assign io_resp_bits_sfence_bits_rs2 = 1'h0;
  assign io_resp_bits_sfence_bits_addr = 39'h0;
  assign io_resp_bits_sfence_bits_asid = 1'h0;
  assign io_resp_bits_flagdata = 4'h0;
  assign io_resp_bits_fflagdata_valid = ifpu_io_out_valid & io_resp_bits_uop_is_unicore; // @[functional-unit.scala 1074:59]
  assign io_resp_bits_fflagdata_bits_uop_switch = io_resp_bits_uop_switch; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_switch_off = io_resp_bits_uop_switch_off; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_is_unicore = io_resp_bits_uop_is_unicore; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_shift = io_resp_bits_uop_shift; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_lrs3_rtype = io_resp_bits_uop_lrs3_rtype; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_rflag = io_resp_bits_uop_rflag; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_wflag = io_resp_bits_uop_wflag; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_prflag = io_resp_bits_uop_prflag; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_pwflag = io_resp_bits_uop_pwflag; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_pflag_busy = io_resp_bits_uop_pflag_busy; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_stale_pflag = io_resp_bits_uop_stale_pflag; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_op1_sel = io_resp_bits_uop_op1_sel; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_op2_sel = io_resp_bits_uop_op2_sel; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_split_num = io_resp_bits_uop_split_num; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_self_index = io_resp_bits_uop_self_index; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_rob_inst_idx = io_resp_bits_uop_rob_inst_idx; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_address_num = io_resp_bits_uop_address_num; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_uopc = io_resp_bits_uop_uopc; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_inst = io_resp_bits_uop_inst; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_debug_inst = io_resp_bits_uop_debug_inst; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_is_rvc = io_resp_bits_uop_is_rvc; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_debug_pc = io_resp_bits_uop_debug_pc; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_iq_type = io_resp_bits_uop_iq_type; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_fu_code = io_resp_bits_uop_fu_code; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ctrl_br_type = io_resp_bits_uop_ctrl_br_type; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel = io_resp_bits_uop_ctrl_op1_sel; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel = io_resp_bits_uop_ctrl_op2_sel; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel = io_resp_bits_uop_ctrl_imm_sel; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn = io_resp_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw = io_resp_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd = io_resp_bits_uop_ctrl_csr_cmd; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ctrl_is_load = io_resp_bits_uop_ctrl_is_load; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ctrl_is_sta = io_resp_bits_uop_ctrl_is_sta; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ctrl_is_std = io_resp_bits_uop_ctrl_is_std; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel = io_resp_bits_uop_ctrl_op3_sel; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_iw_state = io_resp_bits_uop_iw_state; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned = io_resp_bits_uop_iw_p1_poisoned; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned = io_resp_bits_uop_iw_p2_poisoned; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_is_br = io_resp_bits_uop_is_br; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_is_jalr = io_resp_bits_uop_is_jalr; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_is_jal = io_resp_bits_uop_is_jal; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_is_sfb = io_resp_bits_uop_is_sfb; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_br_mask = io_resp_bits_uop_br_mask; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_br_tag = io_resp_bits_uop_br_tag; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ftq_idx = io_resp_bits_uop_ftq_idx; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_edge_inst = io_resp_bits_uop_edge_inst; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_pc_lob = io_resp_bits_uop_pc_lob; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_taken = io_resp_bits_uop_taken; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_imm_packed = io_resp_bits_uop_imm_packed; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_csr_addr = io_resp_bits_uop_csr_addr; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_rob_idx = io_resp_bits_uop_rob_idx; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ldq_idx = io_resp_bits_uop_ldq_idx; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_stq_idx = io_resp_bits_uop_stq_idx; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_rxq_idx = io_resp_bits_uop_rxq_idx; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_pdst = io_resp_bits_uop_pdst; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_prs1 = io_resp_bits_uop_prs1; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_prs2 = io_resp_bits_uop_prs2; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_prs3 = io_resp_bits_uop_prs3; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ppred = io_resp_bits_uop_ppred; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_prs1_busy = io_resp_bits_uop_prs1_busy; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_prs2_busy = io_resp_bits_uop_prs2_busy; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_prs3_busy = io_resp_bits_uop_prs3_busy; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ppred_busy = io_resp_bits_uop_ppred_busy; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_stale_pdst = io_resp_bits_uop_stale_pdst; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_exception = io_resp_bits_uop_exception; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_exc_cause = io_resp_bits_uop_exc_cause; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_bypassable = io_resp_bits_uop_bypassable; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_mem_cmd = io_resp_bits_uop_mem_cmd; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_mem_size = io_resp_bits_uop_mem_size; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_mem_signed = io_resp_bits_uop_mem_signed; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_is_fence = io_resp_bits_uop_is_fence; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_is_fencei = io_resp_bits_uop_is_fencei; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_is_amo = io_resp_bits_uop_is_amo; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_uses_ldq = io_resp_bits_uop_uses_ldq; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_uses_stq = io_resp_bits_uop_uses_stq; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc = io_resp_bits_uop_is_sys_pc2epc; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_is_unique = io_resp_bits_uop_is_unique; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_flush_on_commit = io_resp_bits_uop_flush_on_commit; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ldst_is_rs1 = io_resp_bits_uop_ldst_is_rs1; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ldst = io_resp_bits_uop_ldst; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_lrs1 = io_resp_bits_uop_lrs1; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_lrs2 = io_resp_bits_uop_lrs2; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_lrs3 = io_resp_bits_uop_lrs3; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_ldst_val = io_resp_bits_uop_ldst_val; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_dst_rtype = io_resp_bits_uop_dst_rtype; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_lrs1_rtype = io_resp_bits_uop_lrs1_rtype; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_lrs2_rtype = io_resp_bits_uop_lrs2_rtype; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_frs3_en = io_resp_bits_uop_frs3_en; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_fp_val = io_resp_bits_uop_fp_val; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_fp_single = io_resp_bits_uop_fp_single; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_xcpt_pf_if = io_resp_bits_uop_xcpt_pf_if; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_xcpt_ae_if = io_resp_bits_uop_xcpt_ae_if; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_xcpt_ma_if = io_resp_bits_uop_xcpt_ma_if; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_bp_debug_if = io_resp_bits_uop_bp_debug_if; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_bp_xcpt_if = io_resp_bits_uop_bp_xcpt_if; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_debug_fsrc = io_resp_bits_uop_debug_fsrc; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_uop_debug_tsrc = io_resp_bits_uop_debug_tsrc; // @[functional-unit.scala 1075:38]
  assign io_resp_bits_fflagdata_bits_fflag = outPipe_bits_1[31:0]; // @[functional-unit.scala 1076:38]
  assign fp_decoder_clock = clock;
  assign fp_decoder_reset = reset;
  assign fp_decoder_io_uopc = io_req_bits_uop_uopc; // @[functional-unit.scala 1013:22]
  assign ifpu_clock = clock;
  assign ifpu_reset = reset;
  assign ifpu_io_in_valid = io_req_valid; // @[functional-unit.scala 1066:20]
  assign ifpu_io_in_bits_ldst = fp_decoder_io_sigs_ldst; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_wen = fp_decoder_io_sigs_wen; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_ren1 = fp_decoder_io_sigs_ren1; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_ren2 = fp_decoder_io_sigs_ren2; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_ren3 = fp_decoder_io_sigs_ren3; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_swap12 = fp_decoder_io_sigs_swap12; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_swap23 = fp_decoder_io_sigs_swap23; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_typeTagIn = fp_decoder_io_sigs_typeTagIn; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_typeTagOut = fp_decoder_io_sigs_typeTagOut; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_fromint = fp_decoder_io_sigs_fromint; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_toint = fp_decoder_io_sigs_toint; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_fastpipe = fp_decoder_io_sigs_fastpipe; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_fma = fp_decoder_io_sigs_fma; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_div = fp_decoder_io_sigs_div; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_sqrt = fp_decoder_io_sigs_sqrt; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_wflags = fp_decoder_io_sigs_wflags; // @[functional-unit.scala 1018:17 functional-unit.scala 1021:7]
  assign ifpu_io_in_bits_rm = io_req_bits_uop_is_unicore ? _T_49 : _T_53; // @[functional-unit.scala 1016:18]
  assign ifpu_io_in_bits_typ = io_req_bits_uop_is_unicore ? 2'h0 : io_req_bits_uop_imm_packed[9:8]; // @[functional-unit.scala 1034:17]
  assign ifpu_io_in_bits_in1 = io_req_bits_rs1_data[63:0]; // @[functional-unit.scala 1068:23]
  assign ifpu_io_in_bits_fmt = 2'h0; // @[functional-unit.scala 1067:19]
  assign ifpu_io_in_bits_is_unicore = io_req_bits_uop_is_unicore; // @[functional-unit.scala 1018:17 functional-unit.scala 1026:18]
  assign ifpu_io_in_bits_exc_enabled = io_req_bits_uop_is_unicore ? io_req_bits_fflagdata[16:10] : 7'h7f; // @[functional-unit.scala 1024:25]
  assign ifpu_io_in_bits_c = io_req_bits_uop_is_unicore & io_req_bits_fflagdata[29]; // @[functional-unit.scala 1025:15]
  always @(posedge clock) begin
    if (reset) begin // @[functional-unit.scala 239:27]
      REG__0 <= 1'h0; // @[functional-unit.scala 239:27]
    end else begin
      REG__0 <= io_req_valid & ~_T_1 & ~io_req_bits_kill; // @[functional-unit.scala 243:17]
    end
    if (reset) begin // @[functional-unit.scala 239:27]
      REG__1 <= 1'h0; // @[functional-unit.scala 239:27]
    end else begin
      REG__1 <= REG__0 & ~_T_9 & _T_4; // @[functional-unit.scala 249:19]
    end
    REG_1_0_switch <= io_req_bits_uop_switch; // @[functional-unit.scala 244:17]
    REG_1_0_switch_off <= io_req_bits_uop_switch_off; // @[functional-unit.scala 244:17]
    REG_1_0_is_unicore <= io_req_bits_uop_is_unicore; // @[functional-unit.scala 244:17]
    REG_1_0_shift <= io_req_bits_uop_shift; // @[functional-unit.scala 244:17]
    REG_1_0_lrs3_rtype <= io_req_bits_uop_lrs3_rtype; // @[functional-unit.scala 244:17]
    REG_1_0_rflag <= io_req_bits_uop_rflag; // @[functional-unit.scala 244:17]
    REG_1_0_wflag <= io_req_bits_uop_wflag; // @[functional-unit.scala 244:17]
    REG_1_0_prflag <= io_req_bits_uop_prflag; // @[functional-unit.scala 244:17]
    REG_1_0_pwflag <= io_req_bits_uop_pwflag; // @[functional-unit.scala 244:17]
    REG_1_0_pflag_busy <= io_req_bits_uop_pflag_busy; // @[functional-unit.scala 244:17]
    REG_1_0_stale_pflag <= io_req_bits_uop_stale_pflag; // @[functional-unit.scala 244:17]
    REG_1_0_op1_sel <= io_req_bits_uop_op1_sel; // @[functional-unit.scala 244:17]
    REG_1_0_op2_sel <= io_req_bits_uop_op2_sel; // @[functional-unit.scala 244:17]
    REG_1_0_split_num <= io_req_bits_uop_split_num; // @[functional-unit.scala 244:17]
    REG_1_0_self_index <= io_req_bits_uop_self_index; // @[functional-unit.scala 244:17]
    REG_1_0_rob_inst_idx <= io_req_bits_uop_rob_inst_idx; // @[functional-unit.scala 244:17]
    REG_1_0_address_num <= io_req_bits_uop_address_num; // @[functional-unit.scala 244:17]
    REG_1_0_uopc <= io_req_bits_uop_uopc; // @[functional-unit.scala 244:17]
    REG_1_0_inst <= io_req_bits_uop_inst; // @[functional-unit.scala 244:17]
    REG_1_0_debug_inst <= io_req_bits_uop_debug_inst; // @[functional-unit.scala 244:17]
    REG_1_0_is_rvc <= io_req_bits_uop_is_rvc; // @[functional-unit.scala 244:17]
    REG_1_0_debug_pc <= io_req_bits_uop_debug_pc; // @[functional-unit.scala 244:17]
    REG_1_0_iq_type <= io_req_bits_uop_iq_type; // @[functional-unit.scala 244:17]
    REG_1_0_fu_code <= io_req_bits_uop_fu_code; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_br_type <= io_req_bits_uop_ctrl_br_type; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_op1_sel <= io_req_bits_uop_ctrl_op1_sel; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_op2_sel <= io_req_bits_uop_ctrl_op2_sel; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_imm_sel <= io_req_bits_uop_ctrl_imm_sel; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_op_fcn <= io_req_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_fcn_dw <= io_req_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_csr_cmd <= io_req_bits_uop_ctrl_csr_cmd; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_is_load <= io_req_bits_uop_ctrl_is_load; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_is_sta <= io_req_bits_uop_ctrl_is_sta; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_is_std <= io_req_bits_uop_ctrl_is_std; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_op3_sel <= io_req_bits_uop_ctrl_op3_sel; // @[functional-unit.scala 244:17]
    REG_1_0_iw_state <= io_req_bits_uop_iw_state; // @[functional-unit.scala 244:17]
    REG_1_0_iw_p1_poisoned <= io_req_bits_uop_iw_p1_poisoned; // @[functional-unit.scala 244:17]
    REG_1_0_iw_p2_poisoned <= io_req_bits_uop_iw_p2_poisoned; // @[functional-unit.scala 244:17]
    REG_1_0_is_br <= io_req_bits_uop_is_br; // @[functional-unit.scala 244:17]
    REG_1_0_is_jalr <= io_req_bits_uop_is_jalr; // @[functional-unit.scala 244:17]
    REG_1_0_is_jal <= io_req_bits_uop_is_jal; // @[functional-unit.scala 244:17]
    REG_1_0_is_sfb <= io_req_bits_uop_is_sfb; // @[functional-unit.scala 244:17]
    REG_1_0_br_mask <= io_req_bits_uop_br_mask & _T_6; // @[util.scala 142:25]
    REG_1_0_br_tag <= io_req_bits_uop_br_tag; // @[functional-unit.scala 244:17]
    REG_1_0_ftq_idx <= io_req_bits_uop_ftq_idx; // @[functional-unit.scala 244:17]
    REG_1_0_edge_inst <= io_req_bits_uop_edge_inst; // @[functional-unit.scala 244:17]
    REG_1_0_pc_lob <= io_req_bits_uop_pc_lob; // @[functional-unit.scala 244:17]
    REG_1_0_taken <= io_req_bits_uop_taken; // @[functional-unit.scala 244:17]
    REG_1_0_imm_packed <= io_req_bits_uop_imm_packed; // @[functional-unit.scala 244:17]
    REG_1_0_csr_addr <= io_req_bits_uop_csr_addr; // @[functional-unit.scala 244:17]
    REG_1_0_rob_idx <= io_req_bits_uop_rob_idx; // @[functional-unit.scala 244:17]
    REG_1_0_ldq_idx <= io_req_bits_uop_ldq_idx; // @[functional-unit.scala 244:17]
    REG_1_0_stq_idx <= io_req_bits_uop_stq_idx; // @[functional-unit.scala 244:17]
    REG_1_0_rxq_idx <= io_req_bits_uop_rxq_idx; // @[functional-unit.scala 244:17]
    REG_1_0_pdst <= io_req_bits_uop_pdst; // @[functional-unit.scala 244:17]
    REG_1_0_prs1 <= io_req_bits_uop_prs1; // @[functional-unit.scala 244:17]
    REG_1_0_prs2 <= io_req_bits_uop_prs2; // @[functional-unit.scala 244:17]
    REG_1_0_prs3 <= io_req_bits_uop_prs3; // @[functional-unit.scala 244:17]
    REG_1_0_ppred <= io_req_bits_uop_ppred; // @[functional-unit.scala 244:17]
    REG_1_0_prs1_busy <= io_req_bits_uop_prs1_busy; // @[functional-unit.scala 244:17]
    REG_1_0_prs2_busy <= io_req_bits_uop_prs2_busy; // @[functional-unit.scala 244:17]
    REG_1_0_prs3_busy <= io_req_bits_uop_prs3_busy; // @[functional-unit.scala 244:17]
    REG_1_0_ppred_busy <= io_req_bits_uop_ppred_busy; // @[functional-unit.scala 244:17]
    REG_1_0_stale_pdst <= io_req_bits_uop_stale_pdst; // @[functional-unit.scala 244:17]
    REG_1_0_exception <= io_req_bits_uop_exception; // @[functional-unit.scala 244:17]
    REG_1_0_exc_cause <= io_req_bits_uop_exc_cause; // @[functional-unit.scala 244:17]
    REG_1_0_bypassable <= io_req_bits_uop_bypassable; // @[functional-unit.scala 244:17]
    REG_1_0_mem_cmd <= io_req_bits_uop_mem_cmd; // @[functional-unit.scala 244:17]
    REG_1_0_mem_size <= io_req_bits_uop_mem_size; // @[functional-unit.scala 244:17]
    REG_1_0_mem_signed <= io_req_bits_uop_mem_signed; // @[functional-unit.scala 244:17]
    REG_1_0_is_fence <= io_req_bits_uop_is_fence; // @[functional-unit.scala 244:17]
    REG_1_0_is_fencei <= io_req_bits_uop_is_fencei; // @[functional-unit.scala 244:17]
    REG_1_0_is_amo <= io_req_bits_uop_is_amo; // @[functional-unit.scala 244:17]
    REG_1_0_uses_ldq <= io_req_bits_uop_uses_ldq; // @[functional-unit.scala 244:17]
    REG_1_0_uses_stq <= io_req_bits_uop_uses_stq; // @[functional-unit.scala 244:17]
    REG_1_0_is_sys_pc2epc <= io_req_bits_uop_is_sys_pc2epc; // @[functional-unit.scala 244:17]
    REG_1_0_is_unique <= io_req_bits_uop_is_unique; // @[functional-unit.scala 244:17]
    REG_1_0_flush_on_commit <= io_req_bits_uop_flush_on_commit; // @[functional-unit.scala 244:17]
    REG_1_0_ldst_is_rs1 <= io_req_bits_uop_ldst_is_rs1; // @[functional-unit.scala 244:17]
    REG_1_0_ldst <= io_req_bits_uop_ldst; // @[functional-unit.scala 244:17]
    REG_1_0_lrs1 <= io_req_bits_uop_lrs1; // @[functional-unit.scala 244:17]
    REG_1_0_lrs2 <= io_req_bits_uop_lrs2; // @[functional-unit.scala 244:17]
    REG_1_0_lrs3 <= io_req_bits_uop_lrs3; // @[functional-unit.scala 244:17]
    REG_1_0_ldst_val <= io_req_bits_uop_ldst_val; // @[functional-unit.scala 244:17]
    REG_1_0_dst_rtype <= io_req_bits_uop_dst_rtype; // @[functional-unit.scala 244:17]
    REG_1_0_lrs1_rtype <= io_req_bits_uop_lrs1_rtype; // @[functional-unit.scala 244:17]
    REG_1_0_lrs2_rtype <= io_req_bits_uop_lrs2_rtype; // @[functional-unit.scala 244:17]
    REG_1_0_frs3_en <= io_req_bits_uop_frs3_en; // @[functional-unit.scala 244:17]
    REG_1_0_fp_val <= io_req_bits_uop_fp_val; // @[functional-unit.scala 244:17]
    REG_1_0_fp_single <= io_req_bits_uop_fp_single; // @[functional-unit.scala 244:17]
    REG_1_0_xcpt_pf_if <= io_req_bits_uop_xcpt_pf_if; // @[functional-unit.scala 244:17]
    REG_1_0_xcpt_ae_if <= io_req_bits_uop_xcpt_ae_if; // @[functional-unit.scala 244:17]
    REG_1_0_xcpt_ma_if <= io_req_bits_uop_xcpt_ma_if; // @[functional-unit.scala 244:17]
    REG_1_0_bp_debug_if <= io_req_bits_uop_bp_debug_if; // @[functional-unit.scala 244:17]
    REG_1_0_bp_xcpt_if <= io_req_bits_uop_bp_xcpt_if; // @[functional-unit.scala 244:17]
    REG_1_0_debug_fsrc <= io_req_bits_uop_debug_fsrc; // @[functional-unit.scala 244:17]
    REG_1_0_debug_tsrc <= io_req_bits_uop_debug_tsrc; // @[functional-unit.scala 244:17]
    REG_1_1_switch <= REG_1_0_switch; // @[functional-unit.scala 250:19]
    REG_1_1_switch_off <= REG_1_0_switch_off; // @[functional-unit.scala 250:19]
    REG_1_1_is_unicore <= REG_1_0_is_unicore; // @[functional-unit.scala 250:19]
    REG_1_1_shift <= REG_1_0_shift; // @[functional-unit.scala 250:19]
    REG_1_1_lrs3_rtype <= REG_1_0_lrs3_rtype; // @[functional-unit.scala 250:19]
    REG_1_1_rflag <= REG_1_0_rflag; // @[functional-unit.scala 250:19]
    REG_1_1_wflag <= REG_1_0_wflag; // @[functional-unit.scala 250:19]
    REG_1_1_prflag <= REG_1_0_prflag; // @[functional-unit.scala 250:19]
    REG_1_1_pwflag <= REG_1_0_pwflag; // @[functional-unit.scala 250:19]
    REG_1_1_pflag_busy <= REG_1_0_pflag_busy; // @[functional-unit.scala 250:19]
    REG_1_1_stale_pflag <= REG_1_0_stale_pflag; // @[functional-unit.scala 250:19]
    REG_1_1_op1_sel <= REG_1_0_op1_sel; // @[functional-unit.scala 250:19]
    REG_1_1_op2_sel <= REG_1_0_op2_sel; // @[functional-unit.scala 250:19]
    REG_1_1_split_num <= REG_1_0_split_num; // @[functional-unit.scala 250:19]
    REG_1_1_self_index <= REG_1_0_self_index; // @[functional-unit.scala 250:19]
    REG_1_1_rob_inst_idx <= REG_1_0_rob_inst_idx; // @[functional-unit.scala 250:19]
    REG_1_1_address_num <= REG_1_0_address_num; // @[functional-unit.scala 250:19]
    REG_1_1_uopc <= REG_1_0_uopc; // @[functional-unit.scala 250:19]
    REG_1_1_inst <= REG_1_0_inst; // @[functional-unit.scala 250:19]
    REG_1_1_debug_inst <= REG_1_0_debug_inst; // @[functional-unit.scala 250:19]
    REG_1_1_is_rvc <= REG_1_0_is_rvc; // @[functional-unit.scala 250:19]
    REG_1_1_debug_pc <= REG_1_0_debug_pc; // @[functional-unit.scala 250:19]
    REG_1_1_iq_type <= REG_1_0_iq_type; // @[functional-unit.scala 250:19]
    REG_1_1_fu_code <= REG_1_0_fu_code; // @[functional-unit.scala 250:19]
    REG_1_1_ctrl_br_type <= REG_1_0_ctrl_br_type; // @[functional-unit.scala 250:19]
    REG_1_1_ctrl_op1_sel <= REG_1_0_ctrl_op1_sel; // @[functional-unit.scala 250:19]
    REG_1_1_ctrl_op2_sel <= REG_1_0_ctrl_op2_sel; // @[functional-unit.scala 250:19]
    REG_1_1_ctrl_imm_sel <= REG_1_0_ctrl_imm_sel; // @[functional-unit.scala 250:19]
    REG_1_1_ctrl_op_fcn <= REG_1_0_ctrl_op_fcn; // @[functional-unit.scala 250:19]
    REG_1_1_ctrl_fcn_dw <= REG_1_0_ctrl_fcn_dw; // @[functional-unit.scala 250:19]
    REG_1_1_ctrl_csr_cmd <= REG_1_0_ctrl_csr_cmd; // @[functional-unit.scala 250:19]
    REG_1_1_ctrl_is_load <= REG_1_0_ctrl_is_load; // @[functional-unit.scala 250:19]
    REG_1_1_ctrl_is_sta <= REG_1_0_ctrl_is_sta; // @[functional-unit.scala 250:19]
    REG_1_1_ctrl_is_std <= REG_1_0_ctrl_is_std; // @[functional-unit.scala 250:19]
    REG_1_1_ctrl_op3_sel <= REG_1_0_ctrl_op3_sel; // @[functional-unit.scala 250:19]
    REG_1_1_iw_state <= REG_1_0_iw_state; // @[functional-unit.scala 250:19]
    REG_1_1_iw_p1_poisoned <= REG_1_0_iw_p1_poisoned; // @[functional-unit.scala 250:19]
    REG_1_1_iw_p2_poisoned <= REG_1_0_iw_p2_poisoned; // @[functional-unit.scala 250:19]
    REG_1_1_is_br <= REG_1_0_is_br; // @[functional-unit.scala 250:19]
    REG_1_1_is_jalr <= REG_1_0_is_jalr; // @[functional-unit.scala 250:19]
    REG_1_1_is_jal <= REG_1_0_is_jal; // @[functional-unit.scala 250:19]
    REG_1_1_is_sfb <= REG_1_0_is_sfb; // @[functional-unit.scala 250:19]
    REG_1_1_br_mask <= REG_1_0_br_mask & _T_6; // @[util.scala 142:25]
    REG_1_1_br_tag <= REG_1_0_br_tag; // @[functional-unit.scala 250:19]
    REG_1_1_ftq_idx <= REG_1_0_ftq_idx; // @[functional-unit.scala 250:19]
    REG_1_1_edge_inst <= REG_1_0_edge_inst; // @[functional-unit.scala 250:19]
    REG_1_1_pc_lob <= REG_1_0_pc_lob; // @[functional-unit.scala 250:19]
    REG_1_1_taken <= REG_1_0_taken; // @[functional-unit.scala 250:19]
    REG_1_1_imm_packed <= REG_1_0_imm_packed; // @[functional-unit.scala 250:19]
    REG_1_1_csr_addr <= REG_1_0_csr_addr; // @[functional-unit.scala 250:19]
    REG_1_1_rob_idx <= REG_1_0_rob_idx; // @[functional-unit.scala 250:19]
    REG_1_1_ldq_idx <= REG_1_0_ldq_idx; // @[functional-unit.scala 250:19]
    REG_1_1_stq_idx <= REG_1_0_stq_idx; // @[functional-unit.scala 250:19]
    REG_1_1_rxq_idx <= REG_1_0_rxq_idx; // @[functional-unit.scala 250:19]
    REG_1_1_pdst <= REG_1_0_pdst; // @[functional-unit.scala 250:19]
    REG_1_1_prs1 <= REG_1_0_prs1; // @[functional-unit.scala 250:19]
    REG_1_1_prs2 <= REG_1_0_prs2; // @[functional-unit.scala 250:19]
    REG_1_1_prs3 <= REG_1_0_prs3; // @[functional-unit.scala 250:19]
    REG_1_1_ppred <= REG_1_0_ppred; // @[functional-unit.scala 250:19]
    REG_1_1_prs1_busy <= REG_1_0_prs1_busy; // @[functional-unit.scala 250:19]
    REG_1_1_prs2_busy <= REG_1_0_prs2_busy; // @[functional-unit.scala 250:19]
    REG_1_1_prs3_busy <= REG_1_0_prs3_busy; // @[functional-unit.scala 250:19]
    REG_1_1_ppred_busy <= REG_1_0_ppred_busy; // @[functional-unit.scala 250:19]
    REG_1_1_stale_pdst <= REG_1_0_stale_pdst; // @[functional-unit.scala 250:19]
    REG_1_1_exception <= REG_1_0_exception; // @[functional-unit.scala 250:19]
    REG_1_1_exc_cause <= REG_1_0_exc_cause; // @[functional-unit.scala 250:19]
    REG_1_1_bypassable <= REG_1_0_bypassable; // @[functional-unit.scala 250:19]
    REG_1_1_mem_cmd <= REG_1_0_mem_cmd; // @[functional-unit.scala 250:19]
    REG_1_1_mem_size <= REG_1_0_mem_size; // @[functional-unit.scala 250:19]
    REG_1_1_mem_signed <= REG_1_0_mem_signed; // @[functional-unit.scala 250:19]
    REG_1_1_is_fence <= REG_1_0_is_fence; // @[functional-unit.scala 250:19]
    REG_1_1_is_fencei <= REG_1_0_is_fencei; // @[functional-unit.scala 250:19]
    REG_1_1_is_amo <= REG_1_0_is_amo; // @[functional-unit.scala 250:19]
    REG_1_1_uses_ldq <= REG_1_0_uses_ldq; // @[functional-unit.scala 250:19]
    REG_1_1_uses_stq <= REG_1_0_uses_stq; // @[functional-unit.scala 250:19]
    REG_1_1_is_sys_pc2epc <= REG_1_0_is_sys_pc2epc; // @[functional-unit.scala 250:19]
    REG_1_1_is_unique <= REG_1_0_is_unique; // @[functional-unit.scala 250:19]
    REG_1_1_flush_on_commit <= REG_1_0_flush_on_commit; // @[functional-unit.scala 250:19]
    REG_1_1_ldst_is_rs1 <= REG_1_0_ldst_is_rs1; // @[functional-unit.scala 250:19]
    REG_1_1_ldst <= REG_1_0_ldst; // @[functional-unit.scala 250:19]
    REG_1_1_lrs1 <= REG_1_0_lrs1; // @[functional-unit.scala 250:19]
    REG_1_1_lrs2 <= REG_1_0_lrs2; // @[functional-unit.scala 250:19]
    REG_1_1_lrs3 <= REG_1_0_lrs3; // @[functional-unit.scala 250:19]
    REG_1_1_ldst_val <= REG_1_0_ldst_val; // @[functional-unit.scala 250:19]
    REG_1_1_dst_rtype <= REG_1_0_dst_rtype; // @[functional-unit.scala 250:19]
    REG_1_1_lrs1_rtype <= REG_1_0_lrs1_rtype; // @[functional-unit.scala 250:19]
    REG_1_1_lrs2_rtype <= REG_1_0_lrs2_rtype; // @[functional-unit.scala 250:19]
    REG_1_1_frs3_en <= REG_1_0_frs3_en; // @[functional-unit.scala 250:19]
    REG_1_1_fp_val <= REG_1_0_fp_val; // @[functional-unit.scala 250:19]
    REG_1_1_fp_single <= REG_1_0_fp_single; // @[functional-unit.scala 250:19]
    REG_1_1_xcpt_pf_if <= REG_1_0_xcpt_pf_if; // @[functional-unit.scala 250:19]
    REG_1_1_xcpt_ae_if <= REG_1_0_xcpt_ae_if; // @[functional-unit.scala 250:19]
    REG_1_1_xcpt_ma_if <= REG_1_0_xcpt_ma_if; // @[functional-unit.scala 250:19]
    REG_1_1_bp_debug_if <= REG_1_0_bp_debug_if; // @[functional-unit.scala 250:19]
    REG_1_1_bp_xcpt_if <= REG_1_0_bp_xcpt_if; // @[functional-unit.scala 250:19]
    REG_1_1_debug_fsrc <= REG_1_0_debug_fsrc; // @[functional-unit.scala 250:19]
    REG_1_1_debug_tsrc <= REG_1_0_debug_tsrc; // @[functional-unit.scala 250:19]
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
    if (reset) begin // @[Valid.scala 117:22]
      v <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      v <= io_req_valid; // @[Valid.scala 117:22]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b <= _T_90; // @[Reg.scala 16:23]
    end
    if (v) begin // @[Reg.scala 16:19]
      outPipe_bits <= b; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      v_1 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      v_1 <= io_req_valid; // @[Valid.scala 117:22]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      if (io_req_bits_uop_uopc == 7'h7d) begin // @[functional-unit.scala 1072:40]
        b_1 <= io_req_bits_rs1_data;
      end else begin
        b_1 <= {{33'd0}, io_req_bits_fflagdata};
      end
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_1 <= b_1; // @[Reg.scala 16:23]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_72 & ~reset) begin
          $fwrite(32'h80000002,
            "{\"module\":\"IntToFPUnit\",\"source\":\"functional-unit.scala:1055\",\"cycle\":%d,\"message\":\"ifpu input\",\"pc\":\"0x%x\",\"inst\":\"0x%x\",\"self_index\":%d,\"uopc\":%d,\"fflagdata\":\"0x%x\",\"exc_enabled\":\"0x%x\",\"rm\":%d,\"c\":%d,\"typ\":%d,\"fmt\":%d,\"wflag\":%d,\"rflag\":%d,\"rs1\":%d,\"rs1_data\":%d}\n"
            ,value,io_req_bits_uop_debug_pc,io_req_bits_uop_inst,io_req_bits_uop_self_index,io_req_bits_uop_uopc,
            io_req_bits_fflagdata,req_exc_enabled,fp_rm,req_c,req_typ,2'h0,io_req_bits_uop_wflag,io_req_bits_uop_rflag,
            io_req_bits_uop_lrs1,io_req_bits_rs1_data); // @[logging.scala 34:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(io_req_valid & fp_decoder_io_sigs_fromint & req_in1[64]) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [func] IntToFP integer input has 65th high-order bit set!\n    at functional-unit.scala:1059 assert (!(io.req.valid && fp_ctrl.fromint && req.in1(xLen).asBool),\n"
            ); // @[functional-unit.scala 1059:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_req_valid & fp_decoder_io_sigs_fromint & req_in1[64]) | reset)) begin
          $fatal; // @[functional-unit.scala 1059:10]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(io_req_valid & ~fp_decoder_io_sigs_fromint) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [func] Only support fromInt micro-ops.\n    at functional-unit.scala:1062 assert (!(io.req.valid && !fp_ctrl.fromint),\n"
            ); // @[functional-unit.scala 1062:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_req_valid & ~fp_decoder_io_sigs_fromint) | reset)) begin
          $fatal; // @[functional-unit.scala 1062:10]
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
  REG__0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  REG__1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  REG_1_0_switch = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG_1_0_switch_off = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  REG_1_0_is_unicore = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  REG_1_0_shift = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  REG_1_0_lrs3_rtype = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  REG_1_0_rflag = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  REG_1_0_wflag = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  REG_1_0_prflag = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  REG_1_0_pwflag = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  REG_1_0_pflag_busy = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  REG_1_0_stale_pflag = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  REG_1_0_op1_sel = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  REG_1_0_op2_sel = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  REG_1_0_split_num = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  REG_1_0_self_index = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  REG_1_0_rob_inst_idx = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  REG_1_0_address_num = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  REG_1_0_uopc = _RAND_19[6:0];
  _RAND_20 = {1{`RANDOM}};
  REG_1_0_inst = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  REG_1_0_debug_inst = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  REG_1_0_is_rvc = _RAND_22[0:0];
  _RAND_23 = {2{`RANDOM}};
  REG_1_0_debug_pc = _RAND_23[39:0];
  _RAND_24 = {1{`RANDOM}};
  REG_1_0_iq_type = _RAND_24[2:0];
  _RAND_25 = {1{`RANDOM}};
  REG_1_0_fu_code = _RAND_25[9:0];
  _RAND_26 = {1{`RANDOM}};
  REG_1_0_ctrl_br_type = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  REG_1_0_ctrl_op1_sel = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  REG_1_0_ctrl_op2_sel = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  REG_1_0_ctrl_imm_sel = _RAND_29[2:0];
  _RAND_30 = {1{`RANDOM}};
  REG_1_0_ctrl_op_fcn = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  REG_1_0_ctrl_fcn_dw = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  REG_1_0_ctrl_csr_cmd = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  REG_1_0_ctrl_is_load = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  REG_1_0_ctrl_is_sta = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  REG_1_0_ctrl_is_std = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  REG_1_0_ctrl_op3_sel = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  REG_1_0_iw_state = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  REG_1_0_iw_p1_poisoned = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  REG_1_0_iw_p2_poisoned = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  REG_1_0_is_br = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  REG_1_0_is_jalr = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  REG_1_0_is_jal = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  REG_1_0_is_sfb = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  REG_1_0_br_mask = _RAND_44[11:0];
  _RAND_45 = {1{`RANDOM}};
  REG_1_0_br_tag = _RAND_45[3:0];
  _RAND_46 = {1{`RANDOM}};
  REG_1_0_ftq_idx = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  REG_1_0_edge_inst = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  REG_1_0_pc_lob = _RAND_48[5:0];
  _RAND_49 = {1{`RANDOM}};
  REG_1_0_taken = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  REG_1_0_imm_packed = _RAND_50[19:0];
  _RAND_51 = {1{`RANDOM}};
  REG_1_0_csr_addr = _RAND_51[11:0];
  _RAND_52 = {1{`RANDOM}};
  REG_1_0_rob_idx = _RAND_52[5:0];
  _RAND_53 = {1{`RANDOM}};
  REG_1_0_ldq_idx = _RAND_53[4:0];
  _RAND_54 = {1{`RANDOM}};
  REG_1_0_stq_idx = _RAND_54[4:0];
  _RAND_55 = {1{`RANDOM}};
  REG_1_0_rxq_idx = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  REG_1_0_pdst = _RAND_56[6:0];
  _RAND_57 = {1{`RANDOM}};
  REG_1_0_prs1 = _RAND_57[6:0];
  _RAND_58 = {1{`RANDOM}};
  REG_1_0_prs2 = _RAND_58[6:0];
  _RAND_59 = {1{`RANDOM}};
  REG_1_0_prs3 = _RAND_59[6:0];
  _RAND_60 = {1{`RANDOM}};
  REG_1_0_ppred = _RAND_60[4:0];
  _RAND_61 = {1{`RANDOM}};
  REG_1_0_prs1_busy = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  REG_1_0_prs2_busy = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  REG_1_0_prs3_busy = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  REG_1_0_ppred_busy = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  REG_1_0_stale_pdst = _RAND_65[6:0];
  _RAND_66 = {1{`RANDOM}};
  REG_1_0_exception = _RAND_66[0:0];
  _RAND_67 = {2{`RANDOM}};
  REG_1_0_exc_cause = _RAND_67[63:0];
  _RAND_68 = {1{`RANDOM}};
  REG_1_0_bypassable = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  REG_1_0_mem_cmd = _RAND_69[4:0];
  _RAND_70 = {1{`RANDOM}};
  REG_1_0_mem_size = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  REG_1_0_mem_signed = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  REG_1_0_is_fence = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  REG_1_0_is_fencei = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  REG_1_0_is_amo = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  REG_1_0_uses_ldq = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  REG_1_0_uses_stq = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  REG_1_0_is_sys_pc2epc = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  REG_1_0_is_unique = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  REG_1_0_flush_on_commit = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  REG_1_0_ldst_is_rs1 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  REG_1_0_ldst = _RAND_81[5:0];
  _RAND_82 = {1{`RANDOM}};
  REG_1_0_lrs1 = _RAND_82[5:0];
  _RAND_83 = {1{`RANDOM}};
  REG_1_0_lrs2 = _RAND_83[5:0];
  _RAND_84 = {1{`RANDOM}};
  REG_1_0_lrs3 = _RAND_84[5:0];
  _RAND_85 = {1{`RANDOM}};
  REG_1_0_ldst_val = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  REG_1_0_dst_rtype = _RAND_86[1:0];
  _RAND_87 = {1{`RANDOM}};
  REG_1_0_lrs1_rtype = _RAND_87[1:0];
  _RAND_88 = {1{`RANDOM}};
  REG_1_0_lrs2_rtype = _RAND_88[1:0];
  _RAND_89 = {1{`RANDOM}};
  REG_1_0_frs3_en = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  REG_1_0_fp_val = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  REG_1_0_fp_single = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  REG_1_0_xcpt_pf_if = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  REG_1_0_xcpt_ae_if = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  REG_1_0_xcpt_ma_if = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  REG_1_0_bp_debug_if = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  REG_1_0_bp_xcpt_if = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  REG_1_0_debug_fsrc = _RAND_97[1:0];
  _RAND_98 = {1{`RANDOM}};
  REG_1_0_debug_tsrc = _RAND_98[1:0];
  _RAND_99 = {1{`RANDOM}};
  REG_1_1_switch = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  REG_1_1_switch_off = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  REG_1_1_is_unicore = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  REG_1_1_shift = _RAND_102[2:0];
  _RAND_103 = {1{`RANDOM}};
  REG_1_1_lrs3_rtype = _RAND_103[1:0];
  _RAND_104 = {1{`RANDOM}};
  REG_1_1_rflag = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  REG_1_1_wflag = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  REG_1_1_prflag = _RAND_106[3:0];
  _RAND_107 = {1{`RANDOM}};
  REG_1_1_pwflag = _RAND_107[3:0];
  _RAND_108 = {1{`RANDOM}};
  REG_1_1_pflag_busy = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  REG_1_1_stale_pflag = _RAND_109[3:0];
  _RAND_110 = {1{`RANDOM}};
  REG_1_1_op1_sel = _RAND_110[3:0];
  _RAND_111 = {1{`RANDOM}};
  REG_1_1_op2_sel = _RAND_111[3:0];
  _RAND_112 = {1{`RANDOM}};
  REG_1_1_split_num = _RAND_112[5:0];
  _RAND_113 = {1{`RANDOM}};
  REG_1_1_self_index = _RAND_113[5:0];
  _RAND_114 = {1{`RANDOM}};
  REG_1_1_rob_inst_idx = _RAND_114[5:0];
  _RAND_115 = {1{`RANDOM}};
  REG_1_1_address_num = _RAND_115[5:0];
  _RAND_116 = {1{`RANDOM}};
  REG_1_1_uopc = _RAND_116[6:0];
  _RAND_117 = {1{`RANDOM}};
  REG_1_1_inst = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  REG_1_1_debug_inst = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  REG_1_1_is_rvc = _RAND_119[0:0];
  _RAND_120 = {2{`RANDOM}};
  REG_1_1_debug_pc = _RAND_120[39:0];
  _RAND_121 = {1{`RANDOM}};
  REG_1_1_iq_type = _RAND_121[2:0];
  _RAND_122 = {1{`RANDOM}};
  REG_1_1_fu_code = _RAND_122[9:0];
  _RAND_123 = {1{`RANDOM}};
  REG_1_1_ctrl_br_type = _RAND_123[3:0];
  _RAND_124 = {1{`RANDOM}};
  REG_1_1_ctrl_op1_sel = _RAND_124[1:0];
  _RAND_125 = {1{`RANDOM}};
  REG_1_1_ctrl_op2_sel = _RAND_125[2:0];
  _RAND_126 = {1{`RANDOM}};
  REG_1_1_ctrl_imm_sel = _RAND_126[2:0];
  _RAND_127 = {1{`RANDOM}};
  REG_1_1_ctrl_op_fcn = _RAND_127[3:0];
  _RAND_128 = {1{`RANDOM}};
  REG_1_1_ctrl_fcn_dw = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  REG_1_1_ctrl_csr_cmd = _RAND_129[2:0];
  _RAND_130 = {1{`RANDOM}};
  REG_1_1_ctrl_is_load = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  REG_1_1_ctrl_is_sta = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  REG_1_1_ctrl_is_std = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  REG_1_1_ctrl_op3_sel = _RAND_133[1:0];
  _RAND_134 = {1{`RANDOM}};
  REG_1_1_iw_state = _RAND_134[1:0];
  _RAND_135 = {1{`RANDOM}};
  REG_1_1_iw_p1_poisoned = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  REG_1_1_iw_p2_poisoned = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  REG_1_1_is_br = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  REG_1_1_is_jalr = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  REG_1_1_is_jal = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  REG_1_1_is_sfb = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  REG_1_1_br_mask = _RAND_141[11:0];
  _RAND_142 = {1{`RANDOM}};
  REG_1_1_br_tag = _RAND_142[3:0];
  _RAND_143 = {1{`RANDOM}};
  REG_1_1_ftq_idx = _RAND_143[4:0];
  _RAND_144 = {1{`RANDOM}};
  REG_1_1_edge_inst = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  REG_1_1_pc_lob = _RAND_145[5:0];
  _RAND_146 = {1{`RANDOM}};
  REG_1_1_taken = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  REG_1_1_imm_packed = _RAND_147[19:0];
  _RAND_148 = {1{`RANDOM}};
  REG_1_1_csr_addr = _RAND_148[11:0];
  _RAND_149 = {1{`RANDOM}};
  REG_1_1_rob_idx = _RAND_149[5:0];
  _RAND_150 = {1{`RANDOM}};
  REG_1_1_ldq_idx = _RAND_150[4:0];
  _RAND_151 = {1{`RANDOM}};
  REG_1_1_stq_idx = _RAND_151[4:0];
  _RAND_152 = {1{`RANDOM}};
  REG_1_1_rxq_idx = _RAND_152[1:0];
  _RAND_153 = {1{`RANDOM}};
  REG_1_1_pdst = _RAND_153[6:0];
  _RAND_154 = {1{`RANDOM}};
  REG_1_1_prs1 = _RAND_154[6:0];
  _RAND_155 = {1{`RANDOM}};
  REG_1_1_prs2 = _RAND_155[6:0];
  _RAND_156 = {1{`RANDOM}};
  REG_1_1_prs3 = _RAND_156[6:0];
  _RAND_157 = {1{`RANDOM}};
  REG_1_1_ppred = _RAND_157[4:0];
  _RAND_158 = {1{`RANDOM}};
  REG_1_1_prs1_busy = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  REG_1_1_prs2_busy = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  REG_1_1_prs3_busy = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  REG_1_1_ppred_busy = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  REG_1_1_stale_pdst = _RAND_162[6:0];
  _RAND_163 = {1{`RANDOM}};
  REG_1_1_exception = _RAND_163[0:0];
  _RAND_164 = {2{`RANDOM}};
  REG_1_1_exc_cause = _RAND_164[63:0];
  _RAND_165 = {1{`RANDOM}};
  REG_1_1_bypassable = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  REG_1_1_mem_cmd = _RAND_166[4:0];
  _RAND_167 = {1{`RANDOM}};
  REG_1_1_mem_size = _RAND_167[1:0];
  _RAND_168 = {1{`RANDOM}};
  REG_1_1_mem_signed = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  REG_1_1_is_fence = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  REG_1_1_is_fencei = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  REG_1_1_is_amo = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  REG_1_1_uses_ldq = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  REG_1_1_uses_stq = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  REG_1_1_is_sys_pc2epc = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  REG_1_1_is_unique = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  REG_1_1_flush_on_commit = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  REG_1_1_ldst_is_rs1 = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  REG_1_1_ldst = _RAND_178[5:0];
  _RAND_179 = {1{`RANDOM}};
  REG_1_1_lrs1 = _RAND_179[5:0];
  _RAND_180 = {1{`RANDOM}};
  REG_1_1_lrs2 = _RAND_180[5:0];
  _RAND_181 = {1{`RANDOM}};
  REG_1_1_lrs3 = _RAND_181[5:0];
  _RAND_182 = {1{`RANDOM}};
  REG_1_1_ldst_val = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  REG_1_1_dst_rtype = _RAND_183[1:0];
  _RAND_184 = {1{`RANDOM}};
  REG_1_1_lrs1_rtype = _RAND_184[1:0];
  _RAND_185 = {1{`RANDOM}};
  REG_1_1_lrs2_rtype = _RAND_185[1:0];
  _RAND_186 = {1{`RANDOM}};
  REG_1_1_frs3_en = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  REG_1_1_fp_val = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  REG_1_1_fp_single = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  REG_1_1_xcpt_pf_if = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  REG_1_1_xcpt_ae_if = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  REG_1_1_xcpt_ma_if = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  REG_1_1_bp_debug_if = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  REG_1_1_bp_xcpt_if = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  REG_1_1_debug_fsrc = _RAND_194[1:0];
  _RAND_195 = {1{`RANDOM}};
  REG_1_1_debug_tsrc = _RAND_195[1:0];
  _RAND_196 = {1{`RANDOM}};
  value_lo = _RAND_196[4:0];
  _RAND_197 = {1{`RANDOM}};
  value_hi = _RAND_197[26:0];
  _RAND_198 = {1{`RANDOM}};
  v = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  b = _RAND_199[0:0];
  _RAND_200 = {1{`RANDOM}};
  outPipe_bits = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  v_1 = _RAND_201[0:0];
  _RAND_202 = {3{`RANDOM}};
  b_1 = _RAND_202[64:0];
  _RAND_203 = {3{`RANDOM}};
  outPipe_bits_1 = _RAND_203[64:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
