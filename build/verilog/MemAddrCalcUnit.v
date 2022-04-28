module MemAddrCalcUnit(
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
  input         io_status_uie
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  bkptu_clock; // @[functional-unit.scala 896:21]
  wire  bkptu_reset; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_debug; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_cease; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_wfi; // @[functional-unit.scala 896:21]
  wire [31:0] bkptu_io_status_isa; // @[functional-unit.scala 896:21]
  wire [1:0] bkptu_io_status_dprv; // @[functional-unit.scala 896:21]
  wire [1:0] bkptu_io_status_prv; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_sd; // @[functional-unit.scala 896:21]
  wire [26:0] bkptu_io_status_zero2; // @[functional-unit.scala 896:21]
  wire [1:0] bkptu_io_status_sxl; // @[functional-unit.scala 896:21]
  wire [1:0] bkptu_io_status_uxl; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_sd_rv32; // @[functional-unit.scala 896:21]
  wire [7:0] bkptu_io_status_zero1; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_tsr; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_tw; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_tvm; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_mxr; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_sum; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_mprv; // @[functional-unit.scala 896:21]
  wire [1:0] bkptu_io_status_xs; // @[functional-unit.scala 896:21]
  wire [1:0] bkptu_io_status_fs; // @[functional-unit.scala 896:21]
  wire [1:0] bkptu_io_status_mpp; // @[functional-unit.scala 896:21]
  wire [1:0] bkptu_io_status_vs; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_spp; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_mpie; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_hpie; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_spie; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_upie; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_mie; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_hie; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_sie; // @[functional-unit.scala 896:21]
  wire  bkptu_io_status_uie; // @[functional-unit.scala 896:21]
  wire [38:0] bkptu_io_pc; // @[functional-unit.scala 896:21]
  wire [38:0] bkptu_io_ea; // @[functional-unit.scala 896:21]
  wire  bkptu_io_xcpt_if; // @[functional-unit.scala 896:21]
  wire  bkptu_io_xcpt_ld; // @[functional-unit.scala 896:21]
  wire  bkptu_io_xcpt_st; // @[functional-unit.scala 896:21]
  wire  bkptu_io_debug_if; // @[functional-unit.scala 896:21]
  wire  bkptu_io_debug_ld; // @[functional-unit.scala 896:21]
  wire  bkptu_io_debug_st; // @[functional-unit.scala 896:21]
  wire [11:0] _T = io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask; // @[util.scala 175:51]
  wire  _T_1 = _T != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_4 = ~io_brupdate_b1_resolve_mask; // @[util.scala 142:27]
  wire [11:0] _T_8 = io_req_bits_uop_imm_packed[19:8]; // @[functional-unit.scala 832:83]
  wire [64:0] _GEN_9 = {{53{_T_8[11]}},_T_8}; // @[functional-unit.scala 832:48]
  wire [64:0] riscv_sum = $signed(io_req_bits_rs1_data) + $signed(_GEN_9); // @[functional-unit.scala 832:91]
  wire  is_add = io_req_bits_uop_op2_sel[0]; // @[functional-unit.scala 834:27]
  wire  is_pre = io_req_bits_uop_op1_sel[0]; // @[functional-unit.scala 835:27]
  wire  _T_12 = io_req_bits_uop_ctrl_imm_sel == 3'h7; // @[functional-unit.scala 836:41]
  wire [9:0] raw_offset = io_req_bits_uop_ctrl_imm_sel == 3'h7 ? {{4'd0}, io_req_bits_uop_address_num} :
    io_req_bits_uop_imm_packed[9:0]; // @[functional-unit.scala 836:23]
  wire  _T_16 = io_req_bits_uop_ctrl_imm_sel != 3'h7 & ~is_pre; // @[functional-unit.scala 837:69]
  wire [9:0] _T_17 = io_req_bits_uop_ctrl_imm_sel != 3'h7 & ~is_pre ? 10'h0 : raw_offset; // @[functional-unit.scala 837:39]
  wire [9:0] _T_21 = ~raw_offset; // @[functional-unit.scala 838:86]
  wire [9:0] _T_23 = _T_21 + 10'h1; // @[functional-unit.scala 838:97]
  wire [9:0] _T_24 = _T_16 ? 10'h0 : _T_23; // @[functional-unit.scala 838:39]
  wire [7:0] _GEN_10 = {io_req_bits_uop_self_index, 2'h0}; // @[functional-unit.scala 839:70]
  wire [8:0] _T_26 = {{1'd0}, _GEN_10}; // @[functional-unit.scala 839:70]
  wire [8:0] addr_offset = io_req_bits_uop_ctrl_imm_sel == 3'h6 ? _T_26 : 9'h0; // @[functional-unit.scala 839:24]
  wire [9:0] _T_28 = is_add ? _T_17 : _T_24; // @[functional-unit.scala 840:84]
  wire [11:0] _T_29 = {$signed(_T_28), 2'h0}; // @[functional-unit.scala 840:91]
  wire [64:0] _GEN_11 = {{53{_T_29[11]}},_T_29}; // @[functional-unit.scala 840:66]
  wire [64:0] _T_33 = $signed(io_req_bits_rs1_data) + $signed(_GEN_11); // @[functional-unit.scala 840:105]
  wire [64:0] _GEN_12 = {{56'd0}, addr_offset}; // @[functional-unit.scala 840:141]
  wire [64:0] _T_35 = io_req_bits_rs1_data + _GEN_12; // @[functional-unit.scala 840:141]
  wire [64:0] unicore_sum = io_req_bits_uop_fp_val ? _T_33 : _T_35; // @[functional-unit.scala 840:24]
  wire [64:0] sum = io_req_bits_uop_is_unicore ? unicore_sum : riscv_sum; // @[functional-unit.scala 841:16]
  wire [24:0] _T_38 = ~sum[63:39]; // @[functional-unit.scala 842:39]
  wire  _T_41 = sum[63:39] != 25'h0; // @[functional-unit.scala 843:58]
  wire  ea_sign = sum[38] ? _T_38 == 25'h0 : _T_41; // @[functional-unit.scala 842:20]
  wire [38:0] lo = sum[38:0]; // @[functional-unit.scala 844:43]
  wire [39:0] effective_address = {ea_sign,lo}; // @[Cat.scala 30:58]
  wire  _T_42 = 4'h1 == io_req_bits_uop_op2_sel; // @[Conditional.scala 37:30]
  wire  _T_43 = 4'h2 == io_req_bits_uop_op2_sel; // @[Conditional.scala 37:30]
  wire  _T_44 = 4'h8 == io_req_bits_uop_op2_sel; // @[Conditional.scala 37:30]
  wire [64:0] _GEN_2 = _T_44 ? {{60'd0}, io_req_bits_uop_inst[18:14]} : 65'h0; // @[Conditional.scala 39:67 functional-unit.scala 851:38]
  wire [64:0] _GEN_3 = _T_43 ? io_req_bits_rs2_data : _GEN_2; // @[Conditional.scala 39:67 functional-unit.scala 850:38]
  wire [64:0] unicore_store_data = _T_42 ? io_req_bits_rs1_data : _GEN_3; // @[Conditional.scala 40:58 functional-unit.scala 849:38]
  wire [64:0] store_data = io_req_bits_uop_is_unicore ? unicore_store_data : io_req_bits_rs2_data; // @[functional-unit.scala 857:23]
  wire  _T_49 = io_req_bits_uop_is_unicore & _T_12; // @[functional-unit.scala 859:23]
  reg [4:0] value_lo; // @[Counters.scala 45:37]
  wire [5:0] nextSmall = value_lo + 5'h1; // @[Counters.scala 46:33]
  reg [26:0] value_hi; // @[Counters.scala 50:27]
  wire [26:0] _large_r_T_1 = value_hi + 27'h1; // @[Counters.scala 51:55]
  wire [31:0] value = {value_hi,value_lo}; // @[Cat.scala 30:58]
  wire  _T_53 = io_req_valid & io_req_bits_uop_ctrl_is_std; // @[functional-unit.scala 878:28]
  wire  _T_70 = io_req_bits_uop_fp_val & io_req_valid & io_req_bits_uop_uopc != 7'h1; // @[functional-unit.scala 885:52]
  wire  _T_72 = _T_70 & io_req_bits_uop_uopc != 7'h2; // @[functional-unit.scala 886:17]
  wire  _T_84 = io_req_bits_uop_mem_size == 2'h2 & effective_address[1:0] != 2'h0; // @[functional-unit.scala 893:19]
  wire  _T_85 = io_req_bits_uop_mem_size == 2'h1 & effective_address[0] | _T_84; // @[functional-unit.scala 892:54]
  wire  _T_89 = io_req_bits_uop_mem_size == 2'h3 & effective_address[2:0] != 3'h0; // @[functional-unit.scala 894:19]
  wire  misaligned = _T_85 | _T_89; // @[functional-unit.scala 893:56]
  wire  _T_90 = io_req_bits_uop_uopc == 7'h1; // @[functional-unit.scala 904:53]
  wire  ma_ld = io_req_valid & io_req_bits_uop_uopc == 7'h1 & misaligned; // @[functional-unit.scala 904:63]
  wire  _T_92 = io_req_bits_uop_uopc == 7'h2; // @[functional-unit.scala 905:54]
  wire  ma_st = io_req_valid & (io_req_bits_uop_uopc == 7'h2 | io_req_bits_uop_uopc == 7'h43) & misaligned; // @[functional-unit.scala 905:104]
  wire  _T_99 = _T_92 & bkptu_io_debug_st; // @[functional-unit.scala 907:66]
  wire  dbg_bp = io_req_valid & (_T_90 & bkptu_io_debug_ld | _T_99); // @[functional-unit.scala 906:29]
  wire  _T_104 = _T_92 & bkptu_io_xcpt_st; // @[functional-unit.scala 909:66]
  wire  bp = io_req_valid & (_T_90 & bkptu_io_xcpt_ld | _T_104); // @[functional-unit.scala 908:29]
  wire [3:0] _T_108 = dbg_bp ? 4'he : 4'h3; // @[Mux.scala 47:69]
  wire [3:0] _T_109 = ma_st ? 4'h6 : _T_108; // @[Mux.scala 47:69]
  wire [3:0] xcpt_cause = ma_ld ? 4'h4 : _T_109; // @[Mux.scala 47:69]
  wire  _T_115 = io_req_bits_uop_is_unicore & io_req_valid; // @[functional-unit.scala 926:26]
  reg [4:0] value_lo_1; // @[Counters.scala 45:37]
  wire [5:0] nextSmall_1 = value_lo_1 + 5'h1; // @[Counters.scala 46:33]
  reg [26:0] value_hi_1; // @[Counters.scala 50:27]
  wire [26:0] _large_r_T_3 = value_hi_1 + 27'h1; // @[Counters.scala 51:55]
  wire [31:0] value_1 = {value_hi_1,value_lo_1}; // @[Cat.scala 30:58]
  BreakpointUnit bkptu ( // @[functional-unit.scala 896:21]
    .clock(bkptu_clock),
    .reset(bkptu_reset),
    .io_status_debug(bkptu_io_status_debug),
    .io_status_cease(bkptu_io_status_cease),
    .io_status_wfi(bkptu_io_status_wfi),
    .io_status_isa(bkptu_io_status_isa),
    .io_status_dprv(bkptu_io_status_dprv),
    .io_status_prv(bkptu_io_status_prv),
    .io_status_sd(bkptu_io_status_sd),
    .io_status_zero2(bkptu_io_status_zero2),
    .io_status_sxl(bkptu_io_status_sxl),
    .io_status_uxl(bkptu_io_status_uxl),
    .io_status_sd_rv32(bkptu_io_status_sd_rv32),
    .io_status_zero1(bkptu_io_status_zero1),
    .io_status_tsr(bkptu_io_status_tsr),
    .io_status_tw(bkptu_io_status_tw),
    .io_status_tvm(bkptu_io_status_tvm),
    .io_status_mxr(bkptu_io_status_mxr),
    .io_status_sum(bkptu_io_status_sum),
    .io_status_mprv(bkptu_io_status_mprv),
    .io_status_xs(bkptu_io_status_xs),
    .io_status_fs(bkptu_io_status_fs),
    .io_status_mpp(bkptu_io_status_mpp),
    .io_status_vs(bkptu_io_status_vs),
    .io_status_spp(bkptu_io_status_spp),
    .io_status_mpie(bkptu_io_status_mpie),
    .io_status_hpie(bkptu_io_status_hpie),
    .io_status_spie(bkptu_io_status_spie),
    .io_status_upie(bkptu_io_status_upie),
    .io_status_mie(bkptu_io_status_mie),
    .io_status_hie(bkptu_io_status_hie),
    .io_status_sie(bkptu_io_status_sie),
    .io_status_uie(bkptu_io_status_uie),
    .io_pc(bkptu_io_pc),
    .io_ea(bkptu_io_ea),
    .io_xcpt_if(bkptu_io_xcpt_if),
    .io_xcpt_ld(bkptu_io_xcpt_ld),
    .io_xcpt_st(bkptu_io_xcpt_st),
    .io_debug_if(bkptu_io_debug_if),
    .io_debug_ld(bkptu_io_debug_ld),
    .io_debug_st(bkptu_io_debug_st)
  );
  assign io_req_ready = 1'h1; // @[functional-unit.scala 236:16]
  assign io_resp_valid = io_req_valid & ~_T_1; // @[functional-unit.scala 279:38]
  assign io_resp_bits_uop_switch = io_req_bits_uop_switch; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_switch_off = io_req_bits_uop_switch_off; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_is_unicore = io_req_bits_uop_is_unicore; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_shift = io_req_bits_uop_shift; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_lrs3_rtype = io_req_bits_uop_lrs3_rtype; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_rflag = io_req_bits_uop_rflag; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_wflag = io_req_bits_uop_wflag; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_prflag = io_req_bits_uop_prflag; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_pwflag = io_req_bits_uop_pwflag; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_pflag_busy = io_req_bits_uop_pflag_busy; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_stale_pflag = io_req_bits_uop_stale_pflag; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_op1_sel = io_req_bits_uop_op1_sel; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_op2_sel = io_req_bits_uop_op2_sel; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_split_num = io_req_bits_uop_split_num; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_self_index = io_req_bits_uop_self_index; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_rob_inst_idx = io_req_bits_uop_rob_inst_idx; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_address_num = io_req_bits_uop_address_num; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_uopc = io_req_bits_uop_uopc; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_inst = io_req_bits_uop_inst; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_debug_inst = io_req_bits_uop_debug_inst; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_is_rvc = io_req_bits_uop_is_rvc; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_debug_pc = io_req_bits_uop_debug_pc; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_iq_type = io_req_bits_uop_iq_type; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_fu_code = io_req_bits_uop_fu_code; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ctrl_op3_sel = io_req_bits_uop_ctrl_op3_sel; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_iw_state = io_req_bits_uop_iw_state; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_is_br = io_req_bits_uop_is_br; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_is_jalr = io_req_bits_uop_is_jalr; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_is_jal = io_req_bits_uop_is_jal; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_is_sfb = io_req_bits_uop_is_sfb; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_br_mask = io_req_bits_uop_br_mask & _T_4; // @[util.scala 142:25]
  assign io_resp_bits_uop_br_tag = io_req_bits_uop_br_tag; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_edge_inst = io_req_bits_uop_edge_inst; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_pc_lob = io_req_bits_uop_pc_lob; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_taken = io_req_bits_uop_taken; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_imm_packed = io_req_bits_uop_imm_packed; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_csr_addr = io_req_bits_uop_csr_addr; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_rob_idx = io_req_bits_uop_rob_idx; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_stq_idx = io_req_bits_uop_stq_idx; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_pdst = io_req_bits_uop_pdst; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_prs1 = io_req_bits_uop_prs1; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_prs2 = io_req_bits_uop_prs2; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_prs3 = io_req_bits_uop_prs3; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ppred = io_req_bits_uop_ppred; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_exception = io_req_bits_uop_exception; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_exc_cause = io_req_bits_uop_exc_cause; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_bypassable = io_req_bits_uop_bypassable; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_mem_size = io_req_bits_uop_mem_size; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_mem_signed = io_req_bits_uop_mem_signed; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_is_fence = io_req_bits_uop_is_fence; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_is_fencei = io_req_bits_uop_is_fencei; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_is_amo = io_req_bits_uop_is_amo; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_uses_stq = io_req_bits_uop_uses_stq; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_is_unique = io_req_bits_uop_is_unique; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ldst = io_req_bits_uop_ldst; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_lrs1 = io_req_bits_uop_lrs1; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_lrs2 = io_req_bits_uop_lrs2; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_lrs3 = io_req_bits_uop_lrs3; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_ldst_val = io_req_bits_uop_ldst_val; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_frs3_en = io_req_bits_uop_frs3_en; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_fp_val = io_req_bits_uop_fp_val; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_fp_single = io_req_bits_uop_fp_single; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[functional-unit.scala 281:22]
  assign io_resp_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[functional-unit.scala 281:22]
  assign io_resp_bits_predicated = 1'h0; // @[functional-unit.scala 280:29]
  assign io_resp_bits_data = io_req_bits_uop_is_unicore ? unicore_store_data : io_req_bits_rs2_data; // @[functional-unit.scala 857:23]
  assign io_resp_bits_fflags_valid = 1'h0;
  assign io_resp_bits_fflags_bits_uop_switch = 1'h0;
  assign io_resp_bits_fflags_bits_uop_switch_off = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_unicore = 1'h0;
  assign io_resp_bits_fflags_bits_uop_shift = 3'h0;
  assign io_resp_bits_fflags_bits_uop_lrs3_rtype = 2'h0;
  assign io_resp_bits_fflags_bits_uop_rflag = 1'h0;
  assign io_resp_bits_fflags_bits_uop_wflag = 1'h0;
  assign io_resp_bits_fflags_bits_uop_prflag = 4'h0;
  assign io_resp_bits_fflags_bits_uop_pwflag = 4'h0;
  assign io_resp_bits_fflags_bits_uop_pflag_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_stale_pflag = 4'h0;
  assign io_resp_bits_fflags_bits_uop_op1_sel = 4'h0;
  assign io_resp_bits_fflags_bits_uop_op2_sel = 4'h0;
  assign io_resp_bits_fflags_bits_uop_split_num = 6'h0;
  assign io_resp_bits_fflags_bits_uop_self_index = 6'h0;
  assign io_resp_bits_fflags_bits_uop_rob_inst_idx = 6'h0;
  assign io_resp_bits_fflags_bits_uop_address_num = 6'h0;
  assign io_resp_bits_fflags_bits_uop_uopc = 7'h0;
  assign io_resp_bits_fflags_bits_uop_inst = 32'h0;
  assign io_resp_bits_fflags_bits_uop_debug_inst = 32'h0;
  assign io_resp_bits_fflags_bits_uop_is_rvc = 1'h0;
  assign io_resp_bits_fflags_bits_uop_debug_pc = 40'h0;
  assign io_resp_bits_fflags_bits_uop_iq_type = 3'h0;
  assign io_resp_bits_fflags_bits_uop_fu_code = 10'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_br_type = 4'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_op1_sel = 2'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_op2_sel = 3'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_imm_sel = 3'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_op_fcn = 4'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_fcn_dw = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_csr_cmd = 3'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_is_load = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_is_sta = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_is_std = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_op3_sel = 2'h0;
  assign io_resp_bits_fflags_bits_uop_iw_state = 2'h0;
  assign io_resp_bits_fflags_bits_uop_iw_p1_poisoned = 1'h0;
  assign io_resp_bits_fflags_bits_uop_iw_p2_poisoned = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_br = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_jalr = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_jal = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_sfb = 1'h0;
  assign io_resp_bits_fflags_bits_uop_br_mask = 12'h0;
  assign io_resp_bits_fflags_bits_uop_br_tag = 4'h0;
  assign io_resp_bits_fflags_bits_uop_ftq_idx = 5'h0;
  assign io_resp_bits_fflags_bits_uop_edge_inst = 1'h0;
  assign io_resp_bits_fflags_bits_uop_pc_lob = 6'h0;
  assign io_resp_bits_fflags_bits_uop_taken = 1'h0;
  assign io_resp_bits_fflags_bits_uop_imm_packed = 20'h0;
  assign io_resp_bits_fflags_bits_uop_csr_addr = 12'h0;
  assign io_resp_bits_fflags_bits_uop_rob_idx = 6'h0;
  assign io_resp_bits_fflags_bits_uop_ldq_idx = 5'h0;
  assign io_resp_bits_fflags_bits_uop_stq_idx = 5'h0;
  assign io_resp_bits_fflags_bits_uop_rxq_idx = 2'h0;
  assign io_resp_bits_fflags_bits_uop_pdst = 7'h0;
  assign io_resp_bits_fflags_bits_uop_prs1 = 7'h0;
  assign io_resp_bits_fflags_bits_uop_prs2 = 7'h0;
  assign io_resp_bits_fflags_bits_uop_prs3 = 7'h0;
  assign io_resp_bits_fflags_bits_uop_ppred = 5'h0;
  assign io_resp_bits_fflags_bits_uop_prs1_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_prs2_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_prs3_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ppred_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_stale_pdst = 7'h0;
  assign io_resp_bits_fflags_bits_uop_exception = 1'h0;
  assign io_resp_bits_fflags_bits_uop_exc_cause = 64'h0;
  assign io_resp_bits_fflags_bits_uop_bypassable = 1'h0;
  assign io_resp_bits_fflags_bits_uop_mem_cmd = 5'h0;
  assign io_resp_bits_fflags_bits_uop_mem_size = 2'h0;
  assign io_resp_bits_fflags_bits_uop_mem_signed = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_fence = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_fencei = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_amo = 1'h0;
  assign io_resp_bits_fflags_bits_uop_uses_ldq = 1'h0;
  assign io_resp_bits_fflags_bits_uop_uses_stq = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_sys_pc2epc = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_unique = 1'h0;
  assign io_resp_bits_fflags_bits_uop_flush_on_commit = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ldst_is_rs1 = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ldst = 6'h0;
  assign io_resp_bits_fflags_bits_uop_lrs1 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_lrs2 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_lrs3 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_ldst_val = 1'h0;
  assign io_resp_bits_fflags_bits_uop_dst_rtype = 2'h0;
  assign io_resp_bits_fflags_bits_uop_lrs1_rtype = 2'h0;
  assign io_resp_bits_fflags_bits_uop_lrs2_rtype = 2'h0;
  assign io_resp_bits_fflags_bits_uop_frs3_en = 1'h0;
  assign io_resp_bits_fflags_bits_uop_fp_val = 1'h0;
  assign io_resp_bits_fflags_bits_uop_fp_single = 1'h0;
  assign io_resp_bits_fflags_bits_uop_xcpt_pf_if = 1'h0;
  assign io_resp_bits_fflags_bits_uop_xcpt_ae_if = 1'h0;
  assign io_resp_bits_fflags_bits_uop_xcpt_ma_if = 1'h0;
  assign io_resp_bits_fflags_bits_uop_bp_debug_if = 1'h0;
  assign io_resp_bits_fflags_bits_uop_bp_xcpt_if = 1'h0;
  assign io_resp_bits_fflags_bits_uop_debug_fsrc = 2'h0;
  assign io_resp_bits_fflags_bits_uop_debug_tsrc = 2'h0;
  assign io_resp_bits_fflags_bits_flags = 5'h0;
  assign io_resp_bits_addr = {ea_sign,lo}; // @[Cat.scala 30:58]
  assign io_resp_bits_mxcpt_valid = ma_ld | ma_st | dbg_bp | bp; // @[functional-unit.scala 912:26]
  assign io_resp_bits_mxcpt_bits = {{13'd0}, xcpt_cause}; // @[Mux.scala 47:69]
  assign io_resp_bits_sfence_valid = io_req_valid & io_req_bits_uop_mem_cmd == 5'h14; // @[functional-unit.scala 942:45]
  assign io_resp_bits_sfence_bits_rs1 = io_req_bits_uop_mem_size[0]; // @[functional-unit.scala 943:59]
  assign io_resp_bits_sfence_bits_rs2 = io_req_bits_uop_mem_size[1]; // @[functional-unit.scala 944:59]
  assign io_resp_bits_sfence_bits_addr = io_req_bits_rs1_data[38:0]; // @[functional-unit.scala 945:33]
  assign io_resp_bits_sfence_bits_asid = io_req_bits_rs2_data[0]; // @[functional-unit.scala 946:33]
  assign io_resp_bits_flagdata = 4'h0;
  assign io_resp_bits_fflagdata_valid = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_switch = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_switch_off = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_unicore = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_shift = 3'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs3_rtype = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_rflag = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_wflag = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_prflag = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_pwflag = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_pflag_busy = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_stale_pflag = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_op1_sel = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_op2_sel = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_split_num = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_self_index = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_rob_inst_idx = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_address_num = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_uopc = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_inst = 32'h0;
  assign io_resp_bits_fflagdata_bits_uop_debug_inst = 32'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_rvc = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_debug_pc = 40'h0;
  assign io_resp_bits_fflagdata_bits_uop_iq_type = 3'h0;
  assign io_resp_bits_fflagdata_bits_uop_fu_code = 10'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_br_type = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel = 3'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel = 3'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd = 3'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_is_load = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_is_sta = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_is_std = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_iw_state = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_br = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_jalr = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_jal = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_sfb = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_br_mask = 12'h0;
  assign io_resp_bits_fflagdata_bits_uop_br_tag = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_ftq_idx = 5'h0;
  assign io_resp_bits_fflagdata_bits_uop_edge_inst = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_pc_lob = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_taken = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_imm_packed = 20'h0;
  assign io_resp_bits_fflagdata_bits_uop_csr_addr = 12'h0;
  assign io_resp_bits_fflagdata_bits_uop_rob_idx = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_ldq_idx = 5'h0;
  assign io_resp_bits_fflagdata_bits_uop_stq_idx = 5'h0;
  assign io_resp_bits_fflagdata_bits_uop_rxq_idx = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_pdst = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs1 = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs2 = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs3 = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_ppred = 5'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs1_busy = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs2_busy = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs3_busy = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ppred_busy = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_stale_pdst = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_exception = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_exc_cause = 64'h0;
  assign io_resp_bits_fflagdata_bits_uop_bypassable = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_mem_cmd = 5'h0;
  assign io_resp_bits_fflagdata_bits_uop_mem_size = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_mem_signed = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_fence = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_fencei = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_amo = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_uses_ldq = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_uses_stq = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_unique = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_flush_on_commit = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ldst_is_rs1 = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ldst = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs1 = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs2 = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs3 = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_ldst_val = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_dst_rtype = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs1_rtype = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs2_rtype = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_frs3_en = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_fp_val = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_fp_single = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_xcpt_pf_if = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_xcpt_ae_if = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_xcpt_ma_if = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_bp_debug_if = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_bp_xcpt_if = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_debug_fsrc = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_debug_tsrc = 2'h0;
  assign io_resp_bits_fflagdata_bits_fflag = 32'h0;
  assign bkptu_clock = clock;
  assign bkptu_reset = reset;
  assign bkptu_io_status_debug = io_status_debug; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_cease = io_status_cease; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_wfi = io_status_wfi; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_isa = io_status_isa; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_dprv = io_status_dprv; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_prv = io_status_prv; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_sd = io_status_sd; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_zero2 = io_status_zero2; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_sxl = io_status_sxl; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_uxl = io_status_uxl; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_sd_rv32 = io_status_sd_rv32; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_zero1 = io_status_zero1; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_tsr = io_status_tsr; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_tw = io_status_tw; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_tvm = io_status_tvm; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_mxr = io_status_mxr; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_sum = io_status_sum; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_mprv = io_status_mprv; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_xs = io_status_xs; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_fs = io_status_fs; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_mpp = io_status_mpp; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_vs = io_status_vs; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_spp = io_status_spp; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_mpie = io_status_mpie; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_hpie = io_status_hpie; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_spie = io_status_spie; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_upie = io_status_upie; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_mie = io_status_mie; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_hie = io_status_hie; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_sie = io_status_sie; // @[functional-unit.scala 897:21]
  assign bkptu_io_status_uie = io_status_uie; // @[functional-unit.scala 897:21]
  assign bkptu_io_pc = 39'h0;
  assign bkptu_io_ea = effective_address[38:0]; // @[functional-unit.scala 900:21]
  always @(posedge clock) begin
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
        if (_T_49 & ~reset) begin
          $fwrite(32'h80000002,
            "{\"module\":\"MemAddrCalcUnit\",\"source\":\"functional-unit.scala:869\",\"cycle\":%d,\"type\":\"MSLF Information\",\"pc\":\"0x%x\",\"inst\":\"0x%x\",\"self_idx\":%d,\"uopc\":%d,\"Op1(Base addr)\":\"0x%x\",\"mem addr\":\"0x%x\",\"store data\":\"0x%x\",\"address_num\":%d}\n"
            ,value,io_req_bits_uop_debug_pc,io_req_bits_uop_inst,io_req_bits_uop_self_index,io_req_bits_uop_uopc,
            io_req_bits_rs1_data,effective_address,store_data,io_req_bits_uop_address_num); // @[logging.scala 34:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(io_req_valid & io_req_bits_uop_ctrl_is_std & io_resp_bits_data[64]) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 65th bit set in MemAddrCalcUnit.\n    at functional-unit.scala:878 assert (!(io.req.valid && io.req.bits.uop.ctrl.is_std &&\n"
            ); // @[functional-unit.scala 878:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_req_valid & io_req_bits_uop_ctrl_is_std & io_resp_bits_data[64]) | reset)) begin
          $fatal; // @[functional-unit.scala 878:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(_T_53 & io_req_bits_uop_fp_val) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: FP store-data should now be going through a different unit.\n    at functional-unit.scala:881 assert (!(io.req.valid && io.req.bits.uop.ctrl.is_std && io.req.bits.uop.fp_val),\n"
            ); // @[functional-unit.scala 881:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(_T_53 & io_req_bits_uop_fp_val) | reset)) begin
          $fatal; // @[functional-unit.scala 881:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~_T_72 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [maddrcalc] assert we never get store data in here.\n    at functional-unit.scala:885 assert (!(io.req.bits.uop.fp_val && io.req.valid && io.req.bits.uop.uopc =/=\n"
            ); // @[functional-unit.scala 885:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_T_72 | reset)) begin
          $fatal; // @[functional-unit.scala 885:10]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(ma_ld & ma_st) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Mutually-exclusive exceptions are firing.\n    at functional-unit.scala:921 assert (!(ma_ld && ma_st), \"Mutually-exclusive exceptions are firing.\")\n"
            ); // @[functional-unit.scala 921:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(ma_ld & ma_st) | reset)) begin
          $fatal; // @[functional-unit.scala 921:10]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_115 & ~reset) begin
          $fwrite(32'h80000002,
            "{\"module\":\"MemAddrCalcUnit\",\"source\":\"functional-unit.scala:937\",\"cycle\":%d,\"type\":\"[Pipeline--Execution] MemAddrCalcUnit Information\",\"pc\":\"0x%x\",\"inst\":\"0x%x\",\"self_idx\":%d,\"uopc\":%d,\"Op1(Base addr)\":%d,\"mem addr\":%d,\"store data\":%d,\"misaligned_load\":%d,\"misaligned_store\":%d}\n"
            ,value_1,io_req_bits_uop_debug_pc,io_req_bits_uop_inst,io_req_bits_uop_self_index,io_req_bits_uop_uopc,
            io_req_bits_rs1_data,effective_address,store_data,ma_ld,ma_st); // @[logging.scala 34:13]
        end
    `ifdef PRINTF_COND
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
  value_lo = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  value_hi = _RAND_1[26:0];
  _RAND_2 = {1{`RANDOM}};
  value_lo_1 = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  value_hi_1 = _RAND_3[26:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
