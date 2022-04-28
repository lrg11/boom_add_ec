module ALUExeUnit_1(
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
  input         io_iresp_ready,
  output        io_iresp_valid,
  output        io_iresp_bits_uop_switch,
  output        io_iresp_bits_uop_switch_off,
  output        io_iresp_bits_uop_is_unicore,
  output [2:0]  io_iresp_bits_uop_shift,
  output [1:0]  io_iresp_bits_uop_lrs3_rtype,
  output        io_iresp_bits_uop_rflag,
  output        io_iresp_bits_uop_wflag,
  output [3:0]  io_iresp_bits_uop_prflag,
  output [3:0]  io_iresp_bits_uop_pwflag,
  output        io_iresp_bits_uop_pflag_busy,
  output [3:0]  io_iresp_bits_uop_stale_pflag,
  output [3:0]  io_iresp_bits_uop_op1_sel,
  output [3:0]  io_iresp_bits_uop_op2_sel,
  output [5:0]  io_iresp_bits_uop_split_num,
  output [5:0]  io_iresp_bits_uop_self_index,
  output [5:0]  io_iresp_bits_uop_rob_inst_idx,
  output [5:0]  io_iresp_bits_uop_address_num,
  output [6:0]  io_iresp_bits_uop_uopc,
  output [31:0] io_iresp_bits_uop_inst,
  output [31:0] io_iresp_bits_uop_debug_inst,
  output        io_iresp_bits_uop_is_rvc,
  output [39:0] io_iresp_bits_uop_debug_pc,
  output [2:0]  io_iresp_bits_uop_iq_type,
  output [9:0]  io_iresp_bits_uop_fu_code,
  output [3:0]  io_iresp_bits_uop_ctrl_br_type,
  output [1:0]  io_iresp_bits_uop_ctrl_op1_sel,
  output [2:0]  io_iresp_bits_uop_ctrl_op2_sel,
  output [2:0]  io_iresp_bits_uop_ctrl_imm_sel,
  output [3:0]  io_iresp_bits_uop_ctrl_op_fcn,
  output        io_iresp_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_iresp_bits_uop_ctrl_csr_cmd,
  output        io_iresp_bits_uop_ctrl_is_load,
  output        io_iresp_bits_uop_ctrl_is_sta,
  output        io_iresp_bits_uop_ctrl_is_std,
  output [1:0]  io_iresp_bits_uop_ctrl_op3_sel,
  output [1:0]  io_iresp_bits_uop_iw_state,
  output        io_iresp_bits_uop_iw_p1_poisoned,
  output        io_iresp_bits_uop_iw_p2_poisoned,
  output        io_iresp_bits_uop_is_br,
  output        io_iresp_bits_uop_is_jalr,
  output        io_iresp_bits_uop_is_jal,
  output        io_iresp_bits_uop_is_sfb,
  output [11:0] io_iresp_bits_uop_br_mask,
  output [3:0]  io_iresp_bits_uop_br_tag,
  output [4:0]  io_iresp_bits_uop_ftq_idx,
  output        io_iresp_bits_uop_edge_inst,
  output [5:0]  io_iresp_bits_uop_pc_lob,
  output        io_iresp_bits_uop_taken,
  output [19:0] io_iresp_bits_uop_imm_packed,
  output [11:0] io_iresp_bits_uop_csr_addr,
  output [5:0]  io_iresp_bits_uop_rob_idx,
  output [4:0]  io_iresp_bits_uop_ldq_idx,
  output [4:0]  io_iresp_bits_uop_stq_idx,
  output [1:0]  io_iresp_bits_uop_rxq_idx,
  output [6:0]  io_iresp_bits_uop_pdst,
  output [6:0]  io_iresp_bits_uop_prs1,
  output [6:0]  io_iresp_bits_uop_prs2,
  output [6:0]  io_iresp_bits_uop_prs3,
  output [4:0]  io_iresp_bits_uop_ppred,
  output        io_iresp_bits_uop_prs1_busy,
  output        io_iresp_bits_uop_prs2_busy,
  output        io_iresp_bits_uop_prs3_busy,
  output        io_iresp_bits_uop_ppred_busy,
  output [6:0]  io_iresp_bits_uop_stale_pdst,
  output        io_iresp_bits_uop_exception,
  output [63:0] io_iresp_bits_uop_exc_cause,
  output        io_iresp_bits_uop_bypassable,
  output [4:0]  io_iresp_bits_uop_mem_cmd,
  output [1:0]  io_iresp_bits_uop_mem_size,
  output        io_iresp_bits_uop_mem_signed,
  output        io_iresp_bits_uop_is_fence,
  output        io_iresp_bits_uop_is_fencei,
  output        io_iresp_bits_uop_is_amo,
  output        io_iresp_bits_uop_uses_ldq,
  output        io_iresp_bits_uop_uses_stq,
  output        io_iresp_bits_uop_is_sys_pc2epc,
  output        io_iresp_bits_uop_is_unique,
  output        io_iresp_bits_uop_flush_on_commit,
  output        io_iresp_bits_uop_ldst_is_rs1,
  output [5:0]  io_iresp_bits_uop_ldst,
  output [5:0]  io_iresp_bits_uop_lrs1,
  output [5:0]  io_iresp_bits_uop_lrs2,
  output [5:0]  io_iresp_bits_uop_lrs3,
  output        io_iresp_bits_uop_ldst_val,
  output [1:0]  io_iresp_bits_uop_dst_rtype,
  output [1:0]  io_iresp_bits_uop_lrs1_rtype,
  output [1:0]  io_iresp_bits_uop_lrs2_rtype,
  output        io_iresp_bits_uop_frs3_en,
  output        io_iresp_bits_uop_fp_val,
  output        io_iresp_bits_uop_fp_single,
  output        io_iresp_bits_uop_xcpt_pf_if,
  output        io_iresp_bits_uop_xcpt_ae_if,
  output        io_iresp_bits_uop_xcpt_ma_if,
  output        io_iresp_bits_uop_bp_debug_if,
  output        io_iresp_bits_uop_bp_xcpt_if,
  output [1:0]  io_iresp_bits_uop_debug_fsrc,
  output [1:0]  io_iresp_bits_uop_debug_tsrc,
  output [64:0] io_iresp_bits_data,
  output        io_iresp_bits_predicated,
  output        io_iresp_bits_fflags_valid,
  output        io_iresp_bits_fflags_bits_uop_switch,
  output        io_iresp_bits_fflags_bits_uop_switch_off,
  output        io_iresp_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_iresp_bits_fflags_bits_uop_shift,
  output [1:0]  io_iresp_bits_fflags_bits_uop_lrs3_rtype,
  output        io_iresp_bits_fflags_bits_uop_rflag,
  output        io_iresp_bits_fflags_bits_uop_wflag,
  output [3:0]  io_iresp_bits_fflags_bits_uop_prflag,
  output [3:0]  io_iresp_bits_fflags_bits_uop_pwflag,
  output        io_iresp_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_iresp_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_iresp_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_iresp_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_iresp_bits_fflags_bits_uop_split_num,
  output [5:0]  io_iresp_bits_fflags_bits_uop_self_index,
  output [5:0]  io_iresp_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_iresp_bits_fflags_bits_uop_address_num,
  output [6:0]  io_iresp_bits_fflags_bits_uop_uopc,
  output [31:0] io_iresp_bits_fflags_bits_uop_inst,
  output [31:0] io_iresp_bits_fflags_bits_uop_debug_inst,
  output        io_iresp_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_iresp_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_iresp_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_iresp_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_iresp_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_iresp_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_iresp_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_iresp_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_iresp_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_iresp_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_iresp_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_iresp_bits_fflags_bits_uop_ctrl_is_load,
  output        io_iresp_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_iresp_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_iresp_bits_fflags_bits_uop_ctrl_op3_sel,
  output [1:0]  io_iresp_bits_fflags_bits_uop_iw_state,
  output        io_iresp_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_iresp_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_iresp_bits_fflags_bits_uop_is_br,
  output        io_iresp_bits_fflags_bits_uop_is_jalr,
  output        io_iresp_bits_fflags_bits_uop_is_jal,
  output        io_iresp_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_iresp_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_iresp_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_iresp_bits_fflags_bits_uop_ftq_idx,
  output        io_iresp_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_iresp_bits_fflags_bits_uop_pc_lob,
  output        io_iresp_bits_fflags_bits_uop_taken,
  output [19:0] io_iresp_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_iresp_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_iresp_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_iresp_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_iresp_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_iresp_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_iresp_bits_fflags_bits_uop_pdst,
  output [6:0]  io_iresp_bits_fflags_bits_uop_prs1,
  output [6:0]  io_iresp_bits_fflags_bits_uop_prs2,
  output [6:0]  io_iresp_bits_fflags_bits_uop_prs3,
  output [4:0]  io_iresp_bits_fflags_bits_uop_ppred,
  output        io_iresp_bits_fflags_bits_uop_prs1_busy,
  output        io_iresp_bits_fflags_bits_uop_prs2_busy,
  output        io_iresp_bits_fflags_bits_uop_prs3_busy,
  output        io_iresp_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_iresp_bits_fflags_bits_uop_stale_pdst,
  output        io_iresp_bits_fflags_bits_uop_exception,
  output [63:0] io_iresp_bits_fflags_bits_uop_exc_cause,
  output        io_iresp_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_iresp_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_iresp_bits_fflags_bits_uop_mem_size,
  output        io_iresp_bits_fflags_bits_uop_mem_signed,
  output        io_iresp_bits_fflags_bits_uop_is_fence,
  output        io_iresp_bits_fflags_bits_uop_is_fencei,
  output        io_iresp_bits_fflags_bits_uop_is_amo,
  output        io_iresp_bits_fflags_bits_uop_uses_ldq,
  output        io_iresp_bits_fflags_bits_uop_uses_stq,
  output        io_iresp_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_iresp_bits_fflags_bits_uop_is_unique,
  output        io_iresp_bits_fflags_bits_uop_flush_on_commit,
  output        io_iresp_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_iresp_bits_fflags_bits_uop_ldst,
  output [5:0]  io_iresp_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_iresp_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_iresp_bits_fflags_bits_uop_lrs3,
  output        io_iresp_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_iresp_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_iresp_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_iresp_bits_fflags_bits_uop_lrs2_rtype,
  output        io_iresp_bits_fflags_bits_uop_frs3_en,
  output        io_iresp_bits_fflags_bits_uop_fp_val,
  output        io_iresp_bits_fflags_bits_uop_fp_single,
  output        io_iresp_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_iresp_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_iresp_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_iresp_bits_fflags_bits_uop_bp_debug_if,
  output        io_iresp_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_iresp_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_iresp_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_iresp_bits_fflags_bits_flags,
  output [3:0]  io_iresp_bits_flagdata,
  output        io_iresp_bits_fflagdata_valid,
  output        io_iresp_bits_fflagdata_bits_uop_switch,
  output        io_iresp_bits_fflagdata_bits_uop_switch_off,
  output        io_iresp_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_iresp_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_iresp_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_iresp_bits_fflagdata_bits_uop_rflag,
  output        io_iresp_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_iresp_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_iresp_bits_fflagdata_bits_uop_pwflag,
  output        io_iresp_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_iresp_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_iresp_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_iresp_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_iresp_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_iresp_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_iresp_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_iresp_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_iresp_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_iresp_bits_fflagdata_bits_uop_inst,
  output [31:0] io_iresp_bits_fflagdata_bits_uop_debug_inst,
  output        io_iresp_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_iresp_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_iresp_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_iresp_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_iresp_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_iresp_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_iresp_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_iresp_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_iresp_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_iresp_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_iresp_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_iresp_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_iresp_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_iresp_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_iresp_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_iresp_bits_fflagdata_bits_uop_iw_state,
  output        io_iresp_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_iresp_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_iresp_bits_fflagdata_bits_uop_is_br,
  output        io_iresp_bits_fflagdata_bits_uop_is_jalr,
  output        io_iresp_bits_fflagdata_bits_uop_is_jal,
  output        io_iresp_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_iresp_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_iresp_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_iresp_bits_fflagdata_bits_uop_ftq_idx,
  output        io_iresp_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_iresp_bits_fflagdata_bits_uop_pc_lob,
  output        io_iresp_bits_fflagdata_bits_uop_taken,
  output [19:0] io_iresp_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_iresp_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_iresp_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_iresp_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_iresp_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_iresp_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_iresp_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_iresp_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_iresp_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_iresp_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_iresp_bits_fflagdata_bits_uop_ppred,
  output        io_iresp_bits_fflagdata_bits_uop_prs1_busy,
  output        io_iresp_bits_fflagdata_bits_uop_prs2_busy,
  output        io_iresp_bits_fflagdata_bits_uop_prs3_busy,
  output        io_iresp_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_iresp_bits_fflagdata_bits_uop_stale_pdst,
  output        io_iresp_bits_fflagdata_bits_uop_exception,
  output [63:0] io_iresp_bits_fflagdata_bits_uop_exc_cause,
  output        io_iresp_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_iresp_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_iresp_bits_fflagdata_bits_uop_mem_size,
  output        io_iresp_bits_fflagdata_bits_uop_mem_signed,
  output        io_iresp_bits_fflagdata_bits_uop_is_fence,
  output        io_iresp_bits_fflagdata_bits_uop_is_fencei,
  output        io_iresp_bits_fflagdata_bits_uop_is_amo,
  output        io_iresp_bits_fflagdata_bits_uop_uses_ldq,
  output        io_iresp_bits_fflagdata_bits_uop_uses_stq,
  output        io_iresp_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_iresp_bits_fflagdata_bits_uop_is_unique,
  output        io_iresp_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_iresp_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_iresp_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_iresp_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_iresp_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_iresp_bits_fflagdata_bits_uop_lrs3,
  output        io_iresp_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_iresp_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_iresp_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_iresp_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_iresp_bits_fflagdata_bits_uop_frs3_en,
  output        io_iresp_bits_fflagdata_bits_uop_fp_val,
  output        io_iresp_bits_fflagdata_bits_uop_fp_single,
  output        io_iresp_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_iresp_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_iresp_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_iresp_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_iresp_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_iresp_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_iresp_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_iresp_bits_fflagdata_bits_fflag,
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
  output        io_bypass_0_valid,
  output        io_bypass_0_bits_uop_switch,
  output        io_bypass_0_bits_uop_switch_off,
  output        io_bypass_0_bits_uop_is_unicore,
  output [2:0]  io_bypass_0_bits_uop_shift,
  output [1:0]  io_bypass_0_bits_uop_lrs3_rtype,
  output        io_bypass_0_bits_uop_rflag,
  output        io_bypass_0_bits_uop_wflag,
  output [3:0]  io_bypass_0_bits_uop_prflag,
  output [3:0]  io_bypass_0_bits_uop_pwflag,
  output        io_bypass_0_bits_uop_pflag_busy,
  output [3:0]  io_bypass_0_bits_uop_stale_pflag,
  output [3:0]  io_bypass_0_bits_uop_op1_sel,
  output [3:0]  io_bypass_0_bits_uop_op2_sel,
  output [5:0]  io_bypass_0_bits_uop_split_num,
  output [5:0]  io_bypass_0_bits_uop_self_index,
  output [5:0]  io_bypass_0_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_0_bits_uop_address_num,
  output [6:0]  io_bypass_0_bits_uop_uopc,
  output [31:0] io_bypass_0_bits_uop_inst,
  output [31:0] io_bypass_0_bits_uop_debug_inst,
  output        io_bypass_0_bits_uop_is_rvc,
  output [39:0] io_bypass_0_bits_uop_debug_pc,
  output [2:0]  io_bypass_0_bits_uop_iq_type,
  output [9:0]  io_bypass_0_bits_uop_fu_code,
  output [3:0]  io_bypass_0_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_0_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_0_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_0_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_0_bits_uop_ctrl_op_fcn,
  output        io_bypass_0_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_0_bits_uop_ctrl_csr_cmd,
  output        io_bypass_0_bits_uop_ctrl_is_load,
  output        io_bypass_0_bits_uop_ctrl_is_sta,
  output        io_bypass_0_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_0_bits_uop_ctrl_op3_sel,
  output [1:0]  io_bypass_0_bits_uop_iw_state,
  output        io_bypass_0_bits_uop_iw_p1_poisoned,
  output        io_bypass_0_bits_uop_iw_p2_poisoned,
  output        io_bypass_0_bits_uop_is_br,
  output        io_bypass_0_bits_uop_is_jalr,
  output        io_bypass_0_bits_uop_is_jal,
  output        io_bypass_0_bits_uop_is_sfb,
  output [11:0] io_bypass_0_bits_uop_br_mask,
  output [3:0]  io_bypass_0_bits_uop_br_tag,
  output [4:0]  io_bypass_0_bits_uop_ftq_idx,
  output        io_bypass_0_bits_uop_edge_inst,
  output [5:0]  io_bypass_0_bits_uop_pc_lob,
  output        io_bypass_0_bits_uop_taken,
  output [19:0] io_bypass_0_bits_uop_imm_packed,
  output [11:0] io_bypass_0_bits_uop_csr_addr,
  output [5:0]  io_bypass_0_bits_uop_rob_idx,
  output [4:0]  io_bypass_0_bits_uop_ldq_idx,
  output [4:0]  io_bypass_0_bits_uop_stq_idx,
  output [1:0]  io_bypass_0_bits_uop_rxq_idx,
  output [6:0]  io_bypass_0_bits_uop_pdst,
  output [6:0]  io_bypass_0_bits_uop_prs1,
  output [6:0]  io_bypass_0_bits_uop_prs2,
  output [6:0]  io_bypass_0_bits_uop_prs3,
  output [4:0]  io_bypass_0_bits_uop_ppred,
  output        io_bypass_0_bits_uop_prs1_busy,
  output        io_bypass_0_bits_uop_prs2_busy,
  output        io_bypass_0_bits_uop_prs3_busy,
  output        io_bypass_0_bits_uop_ppred_busy,
  output [6:0]  io_bypass_0_bits_uop_stale_pdst,
  output        io_bypass_0_bits_uop_exception,
  output [63:0] io_bypass_0_bits_uop_exc_cause,
  output        io_bypass_0_bits_uop_bypassable,
  output [4:0]  io_bypass_0_bits_uop_mem_cmd,
  output [1:0]  io_bypass_0_bits_uop_mem_size,
  output        io_bypass_0_bits_uop_mem_signed,
  output        io_bypass_0_bits_uop_is_fence,
  output        io_bypass_0_bits_uop_is_fencei,
  output        io_bypass_0_bits_uop_is_amo,
  output        io_bypass_0_bits_uop_uses_ldq,
  output        io_bypass_0_bits_uop_uses_stq,
  output        io_bypass_0_bits_uop_is_sys_pc2epc,
  output        io_bypass_0_bits_uop_is_unique,
  output        io_bypass_0_bits_uop_flush_on_commit,
  output        io_bypass_0_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_0_bits_uop_ldst,
  output [5:0]  io_bypass_0_bits_uop_lrs1,
  output [5:0]  io_bypass_0_bits_uop_lrs2,
  output [5:0]  io_bypass_0_bits_uop_lrs3,
  output        io_bypass_0_bits_uop_ldst_val,
  output [1:0]  io_bypass_0_bits_uop_dst_rtype,
  output [1:0]  io_bypass_0_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_0_bits_uop_lrs2_rtype,
  output        io_bypass_0_bits_uop_frs3_en,
  output        io_bypass_0_bits_uop_fp_val,
  output        io_bypass_0_bits_uop_fp_single,
  output        io_bypass_0_bits_uop_xcpt_pf_if,
  output        io_bypass_0_bits_uop_xcpt_ae_if,
  output        io_bypass_0_bits_uop_xcpt_ma_if,
  output        io_bypass_0_bits_uop_bp_debug_if,
  output        io_bypass_0_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_0_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_0_bits_uop_debug_tsrc,
  output [64:0] io_bypass_0_bits_data,
  output        io_bypass_0_bits_predicated,
  output        io_bypass_0_bits_fflags_valid,
  output        io_bypass_0_bits_fflags_bits_uop_switch,
  output        io_bypass_0_bits_fflags_bits_uop_switch_off,
  output        io_bypass_0_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_bypass_0_bits_fflags_bits_uop_shift,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_lrs3_rtype,
  output        io_bypass_0_bits_fflags_bits_uop_rflag,
  output        io_bypass_0_bits_fflags_bits_uop_wflag,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_prflag,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_pwflag,
  output        io_bypass_0_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_split_num,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_self_index,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_address_num,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_uopc,
  output [31:0] io_bypass_0_bits_fflags_bits_uop_inst,
  output [31:0] io_bypass_0_bits_fflags_bits_uop_debug_inst,
  output        io_bypass_0_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_bypass_0_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_bypass_0_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_bypass_0_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_bypass_0_bits_fflags_bits_uop_ctrl_is_load,
  output        io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_bypass_0_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_op3_sel,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_iw_state,
  output        io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_bypass_0_bits_fflags_bits_uop_is_br,
  output        io_bypass_0_bits_fflags_bits_uop_is_jalr,
  output        io_bypass_0_bits_fflags_bits_uop_is_jal,
  output        io_bypass_0_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_bypass_0_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_bypass_0_bits_fflags_bits_uop_ftq_idx,
  output        io_bypass_0_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_pc_lob,
  output        io_bypass_0_bits_fflags_bits_uop_taken,
  output [19:0] io_bypass_0_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_bypass_0_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_bypass_0_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_bypass_0_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_pdst,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_prs1,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_prs2,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_prs3,
  output [4:0]  io_bypass_0_bits_fflags_bits_uop_ppred,
  output        io_bypass_0_bits_fflags_bits_uop_prs1_busy,
  output        io_bypass_0_bits_fflags_bits_uop_prs2_busy,
  output        io_bypass_0_bits_fflags_bits_uop_prs3_busy,
  output        io_bypass_0_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_stale_pdst,
  output        io_bypass_0_bits_fflags_bits_uop_exception,
  output [63:0] io_bypass_0_bits_fflags_bits_uop_exc_cause,
  output        io_bypass_0_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_bypass_0_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_mem_size,
  output        io_bypass_0_bits_fflags_bits_uop_mem_signed,
  output        io_bypass_0_bits_fflags_bits_uop_is_fence,
  output        io_bypass_0_bits_fflags_bits_uop_is_fencei,
  output        io_bypass_0_bits_fflags_bits_uop_is_amo,
  output        io_bypass_0_bits_fflags_bits_uop_uses_ldq,
  output        io_bypass_0_bits_fflags_bits_uop_uses_stq,
  output        io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_bypass_0_bits_fflags_bits_uop_is_unique,
  output        io_bypass_0_bits_fflags_bits_uop_flush_on_commit,
  output        io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_ldst,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_lrs3,
  output        io_bypass_0_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_lrs2_rtype,
  output        io_bypass_0_bits_fflags_bits_uop_frs3_en,
  output        io_bypass_0_bits_fflags_bits_uop_fp_val,
  output        io_bypass_0_bits_fflags_bits_uop_fp_single,
  output        io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_bypass_0_bits_fflags_bits_uop_bp_debug_if,
  output        io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_bypass_0_bits_fflags_bits_flags,
  output [3:0]  io_bypass_0_bits_flagdata,
  output        io_bypass_0_bits_fflagdata_valid,
  output        io_bypass_0_bits_fflagdata_bits_uop_switch,
  output        io_bypass_0_bits_fflagdata_bits_uop_switch_off,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_bypass_0_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_bypass_0_bits_fflagdata_bits_uop_rflag,
  output        io_bypass_0_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_pwflag,
  output        io_bypass_0_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_bypass_0_bits_fflagdata_bits_uop_inst,
  output [31:0] io_bypass_0_bits_fflagdata_bits_uop_debug_inst,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_bypass_0_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_bypass_0_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_bypass_0_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_bypass_0_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_iw_state,
  output        io_bypass_0_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_bypass_0_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_br,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_jalr,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_jal,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_bypass_0_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_bypass_0_bits_fflagdata_bits_uop_ftq_idx,
  output        io_bypass_0_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_pc_lob,
  output        io_bypass_0_bits_fflagdata_bits_uop_taken,
  output [19:0] io_bypass_0_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_bypass_0_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_bypass_0_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_bypass_0_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_bypass_0_bits_fflagdata_bits_uop_ppred,
  output        io_bypass_0_bits_fflagdata_bits_uop_prs1_busy,
  output        io_bypass_0_bits_fflagdata_bits_uop_prs2_busy,
  output        io_bypass_0_bits_fflagdata_bits_uop_prs3_busy,
  output        io_bypass_0_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_stale_pdst,
  output        io_bypass_0_bits_fflagdata_bits_uop_exception,
  output [63:0] io_bypass_0_bits_fflagdata_bits_uop_exc_cause,
  output        io_bypass_0_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_bypass_0_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_mem_size,
  output        io_bypass_0_bits_fflagdata_bits_uop_mem_signed,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_fence,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_fencei,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_amo,
  output        io_bypass_0_bits_fflagdata_bits_uop_uses_ldq,
  output        io_bypass_0_bits_fflagdata_bits_uop_uses_stq,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_unique,
  output        io_bypass_0_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_bypass_0_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs3,
  output        io_bypass_0_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_bypass_0_bits_fflagdata_bits_uop_frs3_en,
  output        io_bypass_0_bits_fflagdata_bits_uop_fp_val,
  output        io_bypass_0_bits_fflagdata_bits_uop_fp_single,
  output        io_bypass_0_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_bypass_0_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_bypass_0_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_bypass_0_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_bypass_0_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_bypass_0_bits_fflagdata_bits_fflag,
  output        io_bypass_1_valid,
  output        io_bypass_1_bits_uop_switch,
  output        io_bypass_1_bits_uop_switch_off,
  output        io_bypass_1_bits_uop_is_unicore,
  output [2:0]  io_bypass_1_bits_uop_shift,
  output [1:0]  io_bypass_1_bits_uop_lrs3_rtype,
  output        io_bypass_1_bits_uop_rflag,
  output        io_bypass_1_bits_uop_wflag,
  output [3:0]  io_bypass_1_bits_uop_prflag,
  output [3:0]  io_bypass_1_bits_uop_pwflag,
  output        io_bypass_1_bits_uop_pflag_busy,
  output [3:0]  io_bypass_1_bits_uop_stale_pflag,
  output [3:0]  io_bypass_1_bits_uop_op1_sel,
  output [3:0]  io_bypass_1_bits_uop_op2_sel,
  output [5:0]  io_bypass_1_bits_uop_split_num,
  output [5:0]  io_bypass_1_bits_uop_self_index,
  output [5:0]  io_bypass_1_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_1_bits_uop_address_num,
  output [6:0]  io_bypass_1_bits_uop_uopc,
  output [31:0] io_bypass_1_bits_uop_inst,
  output [31:0] io_bypass_1_bits_uop_debug_inst,
  output        io_bypass_1_bits_uop_is_rvc,
  output [39:0] io_bypass_1_bits_uop_debug_pc,
  output [2:0]  io_bypass_1_bits_uop_iq_type,
  output [9:0]  io_bypass_1_bits_uop_fu_code,
  output [3:0]  io_bypass_1_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_1_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_1_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_1_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_1_bits_uop_ctrl_op_fcn,
  output        io_bypass_1_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_1_bits_uop_ctrl_csr_cmd,
  output        io_bypass_1_bits_uop_ctrl_is_load,
  output        io_bypass_1_bits_uop_ctrl_is_sta,
  output        io_bypass_1_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_1_bits_uop_ctrl_op3_sel,
  output [1:0]  io_bypass_1_bits_uop_iw_state,
  output        io_bypass_1_bits_uop_iw_p1_poisoned,
  output        io_bypass_1_bits_uop_iw_p2_poisoned,
  output        io_bypass_1_bits_uop_is_br,
  output        io_bypass_1_bits_uop_is_jalr,
  output        io_bypass_1_bits_uop_is_jal,
  output        io_bypass_1_bits_uop_is_sfb,
  output [11:0] io_bypass_1_bits_uop_br_mask,
  output [3:0]  io_bypass_1_bits_uop_br_tag,
  output [4:0]  io_bypass_1_bits_uop_ftq_idx,
  output        io_bypass_1_bits_uop_edge_inst,
  output [5:0]  io_bypass_1_bits_uop_pc_lob,
  output        io_bypass_1_bits_uop_taken,
  output [19:0] io_bypass_1_bits_uop_imm_packed,
  output [11:0] io_bypass_1_bits_uop_csr_addr,
  output [5:0]  io_bypass_1_bits_uop_rob_idx,
  output [4:0]  io_bypass_1_bits_uop_ldq_idx,
  output [4:0]  io_bypass_1_bits_uop_stq_idx,
  output [1:0]  io_bypass_1_bits_uop_rxq_idx,
  output [6:0]  io_bypass_1_bits_uop_pdst,
  output [6:0]  io_bypass_1_bits_uop_prs1,
  output [6:0]  io_bypass_1_bits_uop_prs2,
  output [6:0]  io_bypass_1_bits_uop_prs3,
  output [4:0]  io_bypass_1_bits_uop_ppred,
  output        io_bypass_1_bits_uop_prs1_busy,
  output        io_bypass_1_bits_uop_prs2_busy,
  output        io_bypass_1_bits_uop_prs3_busy,
  output        io_bypass_1_bits_uop_ppred_busy,
  output [6:0]  io_bypass_1_bits_uop_stale_pdst,
  output        io_bypass_1_bits_uop_exception,
  output [63:0] io_bypass_1_bits_uop_exc_cause,
  output        io_bypass_1_bits_uop_bypassable,
  output [4:0]  io_bypass_1_bits_uop_mem_cmd,
  output [1:0]  io_bypass_1_bits_uop_mem_size,
  output        io_bypass_1_bits_uop_mem_signed,
  output        io_bypass_1_bits_uop_is_fence,
  output        io_bypass_1_bits_uop_is_fencei,
  output        io_bypass_1_bits_uop_is_amo,
  output        io_bypass_1_bits_uop_uses_ldq,
  output        io_bypass_1_bits_uop_uses_stq,
  output        io_bypass_1_bits_uop_is_sys_pc2epc,
  output        io_bypass_1_bits_uop_is_unique,
  output        io_bypass_1_bits_uop_flush_on_commit,
  output        io_bypass_1_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_1_bits_uop_ldst,
  output [5:0]  io_bypass_1_bits_uop_lrs1,
  output [5:0]  io_bypass_1_bits_uop_lrs2,
  output [5:0]  io_bypass_1_bits_uop_lrs3,
  output        io_bypass_1_bits_uop_ldst_val,
  output [1:0]  io_bypass_1_bits_uop_dst_rtype,
  output [1:0]  io_bypass_1_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_1_bits_uop_lrs2_rtype,
  output        io_bypass_1_bits_uop_frs3_en,
  output        io_bypass_1_bits_uop_fp_val,
  output        io_bypass_1_bits_uop_fp_single,
  output        io_bypass_1_bits_uop_xcpt_pf_if,
  output        io_bypass_1_bits_uop_xcpt_ae_if,
  output        io_bypass_1_bits_uop_xcpt_ma_if,
  output        io_bypass_1_bits_uop_bp_debug_if,
  output        io_bypass_1_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_1_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_1_bits_uop_debug_tsrc,
  output [64:0] io_bypass_1_bits_data,
  output        io_bypass_1_bits_predicated,
  output        io_bypass_1_bits_fflags_valid,
  output        io_bypass_1_bits_fflags_bits_uop_switch,
  output        io_bypass_1_bits_fflags_bits_uop_switch_off,
  output        io_bypass_1_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_bypass_1_bits_fflags_bits_uop_shift,
  output [1:0]  io_bypass_1_bits_fflags_bits_uop_lrs3_rtype,
  output        io_bypass_1_bits_fflags_bits_uop_rflag,
  output        io_bypass_1_bits_fflags_bits_uop_wflag,
  output [3:0]  io_bypass_1_bits_fflags_bits_uop_prflag,
  output [3:0]  io_bypass_1_bits_fflags_bits_uop_pwflag,
  output        io_bypass_1_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_bypass_1_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_bypass_1_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_bypass_1_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_bypass_1_bits_fflags_bits_uop_split_num,
  output [5:0]  io_bypass_1_bits_fflags_bits_uop_self_index,
  output [5:0]  io_bypass_1_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_1_bits_fflags_bits_uop_address_num,
  output [6:0]  io_bypass_1_bits_fflags_bits_uop_uopc,
  output [31:0] io_bypass_1_bits_fflags_bits_uop_inst,
  output [31:0] io_bypass_1_bits_fflags_bits_uop_debug_inst,
  output        io_bypass_1_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_bypass_1_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_bypass_1_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_bypass_1_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_bypass_1_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_1_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_1_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_1_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_1_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_bypass_1_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_1_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_bypass_1_bits_fflags_bits_uop_ctrl_is_load,
  output        io_bypass_1_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_bypass_1_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_1_bits_fflags_bits_uop_ctrl_op3_sel,
  output [1:0]  io_bypass_1_bits_fflags_bits_uop_iw_state,
  output        io_bypass_1_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_bypass_1_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_bypass_1_bits_fflags_bits_uop_is_br,
  output        io_bypass_1_bits_fflags_bits_uop_is_jalr,
  output        io_bypass_1_bits_fflags_bits_uop_is_jal,
  output        io_bypass_1_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_bypass_1_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_bypass_1_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_bypass_1_bits_fflags_bits_uop_ftq_idx,
  output        io_bypass_1_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_bypass_1_bits_fflags_bits_uop_pc_lob,
  output        io_bypass_1_bits_fflags_bits_uop_taken,
  output [19:0] io_bypass_1_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_bypass_1_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_bypass_1_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_bypass_1_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_bypass_1_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_bypass_1_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_bypass_1_bits_fflags_bits_uop_pdst,
  output [6:0]  io_bypass_1_bits_fflags_bits_uop_prs1,
  output [6:0]  io_bypass_1_bits_fflags_bits_uop_prs2,
  output [6:0]  io_bypass_1_bits_fflags_bits_uop_prs3,
  output [4:0]  io_bypass_1_bits_fflags_bits_uop_ppred,
  output        io_bypass_1_bits_fflags_bits_uop_prs1_busy,
  output        io_bypass_1_bits_fflags_bits_uop_prs2_busy,
  output        io_bypass_1_bits_fflags_bits_uop_prs3_busy,
  output        io_bypass_1_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_bypass_1_bits_fflags_bits_uop_stale_pdst,
  output        io_bypass_1_bits_fflags_bits_uop_exception,
  output [63:0] io_bypass_1_bits_fflags_bits_uop_exc_cause,
  output        io_bypass_1_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_bypass_1_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_bypass_1_bits_fflags_bits_uop_mem_size,
  output        io_bypass_1_bits_fflags_bits_uop_mem_signed,
  output        io_bypass_1_bits_fflags_bits_uop_is_fence,
  output        io_bypass_1_bits_fflags_bits_uop_is_fencei,
  output        io_bypass_1_bits_fflags_bits_uop_is_amo,
  output        io_bypass_1_bits_fflags_bits_uop_uses_ldq,
  output        io_bypass_1_bits_fflags_bits_uop_uses_stq,
  output        io_bypass_1_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_bypass_1_bits_fflags_bits_uop_is_unique,
  output        io_bypass_1_bits_fflags_bits_uop_flush_on_commit,
  output        io_bypass_1_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_1_bits_fflags_bits_uop_ldst,
  output [5:0]  io_bypass_1_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_bypass_1_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_bypass_1_bits_fflags_bits_uop_lrs3,
  output        io_bypass_1_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_bypass_1_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_bypass_1_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_1_bits_fflags_bits_uop_lrs2_rtype,
  output        io_bypass_1_bits_fflags_bits_uop_frs3_en,
  output        io_bypass_1_bits_fflags_bits_uop_fp_val,
  output        io_bypass_1_bits_fflags_bits_uop_fp_single,
  output        io_bypass_1_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_bypass_1_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_bypass_1_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_bypass_1_bits_fflags_bits_uop_bp_debug_if,
  output        io_bypass_1_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_1_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_1_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_bypass_1_bits_fflags_bits_flags,
  output [3:0]  io_bypass_1_bits_flagdata,
  output        io_bypass_1_bits_fflagdata_valid,
  output        io_bypass_1_bits_fflagdata_bits_uop_switch,
  output        io_bypass_1_bits_fflagdata_bits_uop_switch_off,
  output        io_bypass_1_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_bypass_1_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_bypass_1_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_bypass_1_bits_fflagdata_bits_uop_rflag,
  output        io_bypass_1_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_bypass_1_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_bypass_1_bits_fflagdata_bits_uop_pwflag,
  output        io_bypass_1_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_bypass_1_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_bypass_1_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_bypass_1_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_bypass_1_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_bypass_1_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_bypass_1_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_1_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_bypass_1_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_bypass_1_bits_fflagdata_bits_uop_inst,
  output [31:0] io_bypass_1_bits_fflagdata_bits_uop_debug_inst,
  output        io_bypass_1_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_bypass_1_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_bypass_1_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_bypass_1_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_bypass_1_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_1_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_1_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_1_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_1_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_bypass_1_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_1_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_1_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_bypass_1_bits_fflagdata_bits_uop_iw_state,
  output        io_bypass_1_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_bypass_1_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_bypass_1_bits_fflagdata_bits_uop_is_br,
  output        io_bypass_1_bits_fflagdata_bits_uop_is_jalr,
  output        io_bypass_1_bits_fflagdata_bits_uop_is_jal,
  output        io_bypass_1_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_bypass_1_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_bypass_1_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_bypass_1_bits_fflagdata_bits_uop_ftq_idx,
  output        io_bypass_1_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_bypass_1_bits_fflagdata_bits_uop_pc_lob,
  output        io_bypass_1_bits_fflagdata_bits_uop_taken,
  output [19:0] io_bypass_1_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_bypass_1_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_bypass_1_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_bypass_1_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_bypass_1_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_bypass_1_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_bypass_1_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_bypass_1_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_bypass_1_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_bypass_1_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_bypass_1_bits_fflagdata_bits_uop_ppred,
  output        io_bypass_1_bits_fflagdata_bits_uop_prs1_busy,
  output        io_bypass_1_bits_fflagdata_bits_uop_prs2_busy,
  output        io_bypass_1_bits_fflagdata_bits_uop_prs3_busy,
  output        io_bypass_1_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_bypass_1_bits_fflagdata_bits_uop_stale_pdst,
  output        io_bypass_1_bits_fflagdata_bits_uop_exception,
  output [63:0] io_bypass_1_bits_fflagdata_bits_uop_exc_cause,
  output        io_bypass_1_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_bypass_1_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_bypass_1_bits_fflagdata_bits_uop_mem_size,
  output        io_bypass_1_bits_fflagdata_bits_uop_mem_signed,
  output        io_bypass_1_bits_fflagdata_bits_uop_is_fence,
  output        io_bypass_1_bits_fflagdata_bits_uop_is_fencei,
  output        io_bypass_1_bits_fflagdata_bits_uop_is_amo,
  output        io_bypass_1_bits_fflagdata_bits_uop_uses_ldq,
  output        io_bypass_1_bits_fflagdata_bits_uop_uses_stq,
  output        io_bypass_1_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_bypass_1_bits_fflagdata_bits_uop_is_unique,
  output        io_bypass_1_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_bypass_1_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_1_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_bypass_1_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_bypass_1_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_bypass_1_bits_fflagdata_bits_uop_lrs3,
  output        io_bypass_1_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_bypass_1_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_bypass_1_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_1_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_bypass_1_bits_fflagdata_bits_uop_frs3_en,
  output        io_bypass_1_bits_fflagdata_bits_uop_fp_val,
  output        io_bypass_1_bits_fflagdata_bits_uop_fp_single,
  output        io_bypass_1_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_bypass_1_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_bypass_1_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_bypass_1_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_bypass_1_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_1_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_1_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_bypass_1_bits_fflagdata_bits_fflag,
  output        io_bypass_2_valid,
  output        io_bypass_2_bits_uop_switch,
  output        io_bypass_2_bits_uop_switch_off,
  output        io_bypass_2_bits_uop_is_unicore,
  output [2:0]  io_bypass_2_bits_uop_shift,
  output [1:0]  io_bypass_2_bits_uop_lrs3_rtype,
  output        io_bypass_2_bits_uop_rflag,
  output        io_bypass_2_bits_uop_wflag,
  output [3:0]  io_bypass_2_bits_uop_prflag,
  output [3:0]  io_bypass_2_bits_uop_pwflag,
  output        io_bypass_2_bits_uop_pflag_busy,
  output [3:0]  io_bypass_2_bits_uop_stale_pflag,
  output [3:0]  io_bypass_2_bits_uop_op1_sel,
  output [3:0]  io_bypass_2_bits_uop_op2_sel,
  output [5:0]  io_bypass_2_bits_uop_split_num,
  output [5:0]  io_bypass_2_bits_uop_self_index,
  output [5:0]  io_bypass_2_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_2_bits_uop_address_num,
  output [6:0]  io_bypass_2_bits_uop_uopc,
  output [31:0] io_bypass_2_bits_uop_inst,
  output [31:0] io_bypass_2_bits_uop_debug_inst,
  output        io_bypass_2_bits_uop_is_rvc,
  output [39:0] io_bypass_2_bits_uop_debug_pc,
  output [2:0]  io_bypass_2_bits_uop_iq_type,
  output [9:0]  io_bypass_2_bits_uop_fu_code,
  output [3:0]  io_bypass_2_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_2_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_2_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_2_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_2_bits_uop_ctrl_op_fcn,
  output        io_bypass_2_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_2_bits_uop_ctrl_csr_cmd,
  output        io_bypass_2_bits_uop_ctrl_is_load,
  output        io_bypass_2_bits_uop_ctrl_is_sta,
  output        io_bypass_2_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_2_bits_uop_ctrl_op3_sel,
  output [1:0]  io_bypass_2_bits_uop_iw_state,
  output        io_bypass_2_bits_uop_iw_p1_poisoned,
  output        io_bypass_2_bits_uop_iw_p2_poisoned,
  output        io_bypass_2_bits_uop_is_br,
  output        io_bypass_2_bits_uop_is_jalr,
  output        io_bypass_2_bits_uop_is_jal,
  output        io_bypass_2_bits_uop_is_sfb,
  output [11:0] io_bypass_2_bits_uop_br_mask,
  output [3:0]  io_bypass_2_bits_uop_br_tag,
  output [4:0]  io_bypass_2_bits_uop_ftq_idx,
  output        io_bypass_2_bits_uop_edge_inst,
  output [5:0]  io_bypass_2_bits_uop_pc_lob,
  output        io_bypass_2_bits_uop_taken,
  output [19:0] io_bypass_2_bits_uop_imm_packed,
  output [11:0] io_bypass_2_bits_uop_csr_addr,
  output [5:0]  io_bypass_2_bits_uop_rob_idx,
  output [4:0]  io_bypass_2_bits_uop_ldq_idx,
  output [4:0]  io_bypass_2_bits_uop_stq_idx,
  output [1:0]  io_bypass_2_bits_uop_rxq_idx,
  output [6:0]  io_bypass_2_bits_uop_pdst,
  output [6:0]  io_bypass_2_bits_uop_prs1,
  output [6:0]  io_bypass_2_bits_uop_prs2,
  output [6:0]  io_bypass_2_bits_uop_prs3,
  output [4:0]  io_bypass_2_bits_uop_ppred,
  output        io_bypass_2_bits_uop_prs1_busy,
  output        io_bypass_2_bits_uop_prs2_busy,
  output        io_bypass_2_bits_uop_prs3_busy,
  output        io_bypass_2_bits_uop_ppred_busy,
  output [6:0]  io_bypass_2_bits_uop_stale_pdst,
  output        io_bypass_2_bits_uop_exception,
  output [63:0] io_bypass_2_bits_uop_exc_cause,
  output        io_bypass_2_bits_uop_bypassable,
  output [4:0]  io_bypass_2_bits_uop_mem_cmd,
  output [1:0]  io_bypass_2_bits_uop_mem_size,
  output        io_bypass_2_bits_uop_mem_signed,
  output        io_bypass_2_bits_uop_is_fence,
  output        io_bypass_2_bits_uop_is_fencei,
  output        io_bypass_2_bits_uop_is_amo,
  output        io_bypass_2_bits_uop_uses_ldq,
  output        io_bypass_2_bits_uop_uses_stq,
  output        io_bypass_2_bits_uop_is_sys_pc2epc,
  output        io_bypass_2_bits_uop_is_unique,
  output        io_bypass_2_bits_uop_flush_on_commit,
  output        io_bypass_2_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_2_bits_uop_ldst,
  output [5:0]  io_bypass_2_bits_uop_lrs1,
  output [5:0]  io_bypass_2_bits_uop_lrs2,
  output [5:0]  io_bypass_2_bits_uop_lrs3,
  output        io_bypass_2_bits_uop_ldst_val,
  output [1:0]  io_bypass_2_bits_uop_dst_rtype,
  output [1:0]  io_bypass_2_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_2_bits_uop_lrs2_rtype,
  output        io_bypass_2_bits_uop_frs3_en,
  output        io_bypass_2_bits_uop_fp_val,
  output        io_bypass_2_bits_uop_fp_single,
  output        io_bypass_2_bits_uop_xcpt_pf_if,
  output        io_bypass_2_bits_uop_xcpt_ae_if,
  output        io_bypass_2_bits_uop_xcpt_ma_if,
  output        io_bypass_2_bits_uop_bp_debug_if,
  output        io_bypass_2_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_2_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_2_bits_uop_debug_tsrc,
  output [64:0] io_bypass_2_bits_data,
  output        io_bypass_2_bits_predicated,
  output        io_bypass_2_bits_fflags_valid,
  output        io_bypass_2_bits_fflags_bits_uop_switch,
  output        io_bypass_2_bits_fflags_bits_uop_switch_off,
  output        io_bypass_2_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_bypass_2_bits_fflags_bits_uop_shift,
  output [1:0]  io_bypass_2_bits_fflags_bits_uop_lrs3_rtype,
  output        io_bypass_2_bits_fflags_bits_uop_rflag,
  output        io_bypass_2_bits_fflags_bits_uop_wflag,
  output [3:0]  io_bypass_2_bits_fflags_bits_uop_prflag,
  output [3:0]  io_bypass_2_bits_fflags_bits_uop_pwflag,
  output        io_bypass_2_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_bypass_2_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_bypass_2_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_bypass_2_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_bypass_2_bits_fflags_bits_uop_split_num,
  output [5:0]  io_bypass_2_bits_fflags_bits_uop_self_index,
  output [5:0]  io_bypass_2_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_2_bits_fflags_bits_uop_address_num,
  output [6:0]  io_bypass_2_bits_fflags_bits_uop_uopc,
  output [31:0] io_bypass_2_bits_fflags_bits_uop_inst,
  output [31:0] io_bypass_2_bits_fflags_bits_uop_debug_inst,
  output        io_bypass_2_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_bypass_2_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_bypass_2_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_bypass_2_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_bypass_2_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_2_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_2_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_2_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_2_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_bypass_2_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_2_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_bypass_2_bits_fflags_bits_uop_ctrl_is_load,
  output        io_bypass_2_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_bypass_2_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_2_bits_fflags_bits_uop_ctrl_op3_sel,
  output [1:0]  io_bypass_2_bits_fflags_bits_uop_iw_state,
  output        io_bypass_2_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_bypass_2_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_bypass_2_bits_fflags_bits_uop_is_br,
  output        io_bypass_2_bits_fflags_bits_uop_is_jalr,
  output        io_bypass_2_bits_fflags_bits_uop_is_jal,
  output        io_bypass_2_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_bypass_2_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_bypass_2_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_bypass_2_bits_fflags_bits_uop_ftq_idx,
  output        io_bypass_2_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_bypass_2_bits_fflags_bits_uop_pc_lob,
  output        io_bypass_2_bits_fflags_bits_uop_taken,
  output [19:0] io_bypass_2_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_bypass_2_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_bypass_2_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_bypass_2_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_bypass_2_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_bypass_2_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_bypass_2_bits_fflags_bits_uop_pdst,
  output [6:0]  io_bypass_2_bits_fflags_bits_uop_prs1,
  output [6:0]  io_bypass_2_bits_fflags_bits_uop_prs2,
  output [6:0]  io_bypass_2_bits_fflags_bits_uop_prs3,
  output [4:0]  io_bypass_2_bits_fflags_bits_uop_ppred,
  output        io_bypass_2_bits_fflags_bits_uop_prs1_busy,
  output        io_bypass_2_bits_fflags_bits_uop_prs2_busy,
  output        io_bypass_2_bits_fflags_bits_uop_prs3_busy,
  output        io_bypass_2_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_bypass_2_bits_fflags_bits_uop_stale_pdst,
  output        io_bypass_2_bits_fflags_bits_uop_exception,
  output [63:0] io_bypass_2_bits_fflags_bits_uop_exc_cause,
  output        io_bypass_2_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_bypass_2_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_bypass_2_bits_fflags_bits_uop_mem_size,
  output        io_bypass_2_bits_fflags_bits_uop_mem_signed,
  output        io_bypass_2_bits_fflags_bits_uop_is_fence,
  output        io_bypass_2_bits_fflags_bits_uop_is_fencei,
  output        io_bypass_2_bits_fflags_bits_uop_is_amo,
  output        io_bypass_2_bits_fflags_bits_uop_uses_ldq,
  output        io_bypass_2_bits_fflags_bits_uop_uses_stq,
  output        io_bypass_2_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_bypass_2_bits_fflags_bits_uop_is_unique,
  output        io_bypass_2_bits_fflags_bits_uop_flush_on_commit,
  output        io_bypass_2_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_2_bits_fflags_bits_uop_ldst,
  output [5:0]  io_bypass_2_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_bypass_2_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_bypass_2_bits_fflags_bits_uop_lrs3,
  output        io_bypass_2_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_bypass_2_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_bypass_2_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_2_bits_fflags_bits_uop_lrs2_rtype,
  output        io_bypass_2_bits_fflags_bits_uop_frs3_en,
  output        io_bypass_2_bits_fflags_bits_uop_fp_val,
  output        io_bypass_2_bits_fflags_bits_uop_fp_single,
  output        io_bypass_2_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_bypass_2_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_bypass_2_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_bypass_2_bits_fflags_bits_uop_bp_debug_if,
  output        io_bypass_2_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_2_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_2_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_bypass_2_bits_fflags_bits_flags,
  output [3:0]  io_bypass_2_bits_flagdata,
  output        io_bypass_2_bits_fflagdata_valid,
  output        io_bypass_2_bits_fflagdata_bits_uop_switch,
  output        io_bypass_2_bits_fflagdata_bits_uop_switch_off,
  output        io_bypass_2_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_bypass_2_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_bypass_2_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_bypass_2_bits_fflagdata_bits_uop_rflag,
  output        io_bypass_2_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_bypass_2_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_bypass_2_bits_fflagdata_bits_uop_pwflag,
  output        io_bypass_2_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_bypass_2_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_bypass_2_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_bypass_2_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_bypass_2_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_bypass_2_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_bypass_2_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_2_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_bypass_2_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_bypass_2_bits_fflagdata_bits_uop_inst,
  output [31:0] io_bypass_2_bits_fflagdata_bits_uop_debug_inst,
  output        io_bypass_2_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_bypass_2_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_bypass_2_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_bypass_2_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_bypass_2_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_2_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_2_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_2_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_2_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_bypass_2_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_2_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_2_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_bypass_2_bits_fflagdata_bits_uop_iw_state,
  output        io_bypass_2_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_bypass_2_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_bypass_2_bits_fflagdata_bits_uop_is_br,
  output        io_bypass_2_bits_fflagdata_bits_uop_is_jalr,
  output        io_bypass_2_bits_fflagdata_bits_uop_is_jal,
  output        io_bypass_2_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_bypass_2_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_bypass_2_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_bypass_2_bits_fflagdata_bits_uop_ftq_idx,
  output        io_bypass_2_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_bypass_2_bits_fflagdata_bits_uop_pc_lob,
  output        io_bypass_2_bits_fflagdata_bits_uop_taken,
  output [19:0] io_bypass_2_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_bypass_2_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_bypass_2_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_bypass_2_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_bypass_2_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_bypass_2_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_bypass_2_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_bypass_2_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_bypass_2_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_bypass_2_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_bypass_2_bits_fflagdata_bits_uop_ppred,
  output        io_bypass_2_bits_fflagdata_bits_uop_prs1_busy,
  output        io_bypass_2_bits_fflagdata_bits_uop_prs2_busy,
  output        io_bypass_2_bits_fflagdata_bits_uop_prs3_busy,
  output        io_bypass_2_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_bypass_2_bits_fflagdata_bits_uop_stale_pdst,
  output        io_bypass_2_bits_fflagdata_bits_uop_exception,
  output [63:0] io_bypass_2_bits_fflagdata_bits_uop_exc_cause,
  output        io_bypass_2_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_bypass_2_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_bypass_2_bits_fflagdata_bits_uop_mem_size,
  output        io_bypass_2_bits_fflagdata_bits_uop_mem_signed,
  output        io_bypass_2_bits_fflagdata_bits_uop_is_fence,
  output        io_bypass_2_bits_fflagdata_bits_uop_is_fencei,
  output        io_bypass_2_bits_fflagdata_bits_uop_is_amo,
  output        io_bypass_2_bits_fflagdata_bits_uop_uses_ldq,
  output        io_bypass_2_bits_fflagdata_bits_uop_uses_stq,
  output        io_bypass_2_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_bypass_2_bits_fflagdata_bits_uop_is_unique,
  output        io_bypass_2_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_bypass_2_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_2_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_bypass_2_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_bypass_2_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_bypass_2_bits_fflagdata_bits_uop_lrs3,
  output        io_bypass_2_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_bypass_2_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_bypass_2_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_2_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_bypass_2_bits_fflagdata_bits_uop_frs3_en,
  output        io_bypass_2_bits_fflagdata_bits_uop_fp_val,
  output        io_bypass_2_bits_fflagdata_bits_uop_fp_single,
  output        io_bypass_2_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_bypass_2_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_bypass_2_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_bypass_2_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_bypass_2_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_2_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_2_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_bypass_2_bits_fflagdata_bits_fflag,
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
  output        io_brinfo_uop_switch,
  output        io_brinfo_uop_switch_off,
  output        io_brinfo_uop_is_unicore,
  output [2:0]  io_brinfo_uop_shift,
  output [1:0]  io_brinfo_uop_lrs3_rtype,
  output        io_brinfo_uop_rflag,
  output        io_brinfo_uop_wflag,
  output [3:0]  io_brinfo_uop_prflag,
  output [3:0]  io_brinfo_uop_pwflag,
  output        io_brinfo_uop_pflag_busy,
  output [3:0]  io_brinfo_uop_stale_pflag,
  output [3:0]  io_brinfo_uop_op1_sel,
  output [3:0]  io_brinfo_uop_op2_sel,
  output [5:0]  io_brinfo_uop_split_num,
  output [5:0]  io_brinfo_uop_self_index,
  output [5:0]  io_brinfo_uop_rob_inst_idx,
  output [5:0]  io_brinfo_uop_address_num,
  output [6:0]  io_brinfo_uop_uopc,
  output [31:0] io_brinfo_uop_inst,
  output [31:0] io_brinfo_uop_debug_inst,
  output        io_brinfo_uop_is_rvc,
  output [39:0] io_brinfo_uop_debug_pc,
  output [2:0]  io_brinfo_uop_iq_type,
  output [9:0]  io_brinfo_uop_fu_code,
  output [3:0]  io_brinfo_uop_ctrl_br_type,
  output [1:0]  io_brinfo_uop_ctrl_op1_sel,
  output [2:0]  io_brinfo_uop_ctrl_op2_sel,
  output [2:0]  io_brinfo_uop_ctrl_imm_sel,
  output [3:0]  io_brinfo_uop_ctrl_op_fcn,
  output        io_brinfo_uop_ctrl_fcn_dw,
  output [2:0]  io_brinfo_uop_ctrl_csr_cmd,
  output        io_brinfo_uop_ctrl_is_load,
  output        io_brinfo_uop_ctrl_is_sta,
  output        io_brinfo_uop_ctrl_is_std,
  output [1:0]  io_brinfo_uop_ctrl_op3_sel,
  output [1:0]  io_brinfo_uop_iw_state,
  output        io_brinfo_uop_iw_p1_poisoned,
  output        io_brinfo_uop_iw_p2_poisoned,
  output        io_brinfo_uop_is_br,
  output        io_brinfo_uop_is_jalr,
  output        io_brinfo_uop_is_jal,
  output        io_brinfo_uop_is_sfb,
  output [11:0] io_brinfo_uop_br_mask,
  output [3:0]  io_brinfo_uop_br_tag,
  output [4:0]  io_brinfo_uop_ftq_idx,
  output        io_brinfo_uop_edge_inst,
  output [5:0]  io_brinfo_uop_pc_lob,
  output        io_brinfo_uop_taken,
  output [19:0] io_brinfo_uop_imm_packed,
  output [11:0] io_brinfo_uop_csr_addr,
  output [5:0]  io_brinfo_uop_rob_idx,
  output [4:0]  io_brinfo_uop_ldq_idx,
  output [4:0]  io_brinfo_uop_stq_idx,
  output [1:0]  io_brinfo_uop_rxq_idx,
  output [6:0]  io_brinfo_uop_pdst,
  output [6:0]  io_brinfo_uop_prs1,
  output [6:0]  io_brinfo_uop_prs2,
  output [6:0]  io_brinfo_uop_prs3,
  output [4:0]  io_brinfo_uop_ppred,
  output        io_brinfo_uop_prs1_busy,
  output        io_brinfo_uop_prs2_busy,
  output        io_brinfo_uop_prs3_busy,
  output        io_brinfo_uop_ppred_busy,
  output [6:0]  io_brinfo_uop_stale_pdst,
  output        io_brinfo_uop_exception,
  output [63:0] io_brinfo_uop_exc_cause,
  output        io_brinfo_uop_bypassable,
  output [4:0]  io_brinfo_uop_mem_cmd,
  output [1:0]  io_brinfo_uop_mem_size,
  output        io_brinfo_uop_mem_signed,
  output        io_brinfo_uop_is_fence,
  output        io_brinfo_uop_is_fencei,
  output        io_brinfo_uop_is_amo,
  output        io_brinfo_uop_uses_ldq,
  output        io_brinfo_uop_uses_stq,
  output        io_brinfo_uop_is_sys_pc2epc,
  output        io_brinfo_uop_is_unique,
  output        io_brinfo_uop_flush_on_commit,
  output        io_brinfo_uop_ldst_is_rs1,
  output [5:0]  io_brinfo_uop_ldst,
  output [5:0]  io_brinfo_uop_lrs1,
  output [5:0]  io_brinfo_uop_lrs2,
  output [5:0]  io_brinfo_uop_lrs3,
  output        io_brinfo_uop_ldst_val,
  output [1:0]  io_brinfo_uop_dst_rtype,
  output [1:0]  io_brinfo_uop_lrs1_rtype,
  output [1:0]  io_brinfo_uop_lrs2_rtype,
  output        io_brinfo_uop_frs3_en,
  output        io_brinfo_uop_fp_val,
  output        io_brinfo_uop_fp_single,
  output        io_brinfo_uop_xcpt_pf_if,
  output        io_brinfo_uop_xcpt_ae_if,
  output        io_brinfo_uop_xcpt_ma_if,
  output        io_brinfo_uop_bp_debug_if,
  output        io_brinfo_uop_bp_xcpt_if,
  output [1:0]  io_brinfo_uop_debug_fsrc,
  output [1:0]  io_brinfo_uop_debug_tsrc,
  output        io_brinfo_valid,
  output        io_brinfo_mispredict,
  output        io_brinfo_taken,
  output [2:0]  io_brinfo_cfi_type,
  output [1:0]  io_brinfo_pc_sel,
  output [39:0] io_brinfo_jalr_target,
  output [31:0] io_brinfo_target_offset,
  output [4:0]  io_get_ftq_pc_ftq_idx,
  input         io_get_ftq_pc_entry_cfi_idx_valid,
  input  [1:0]  io_get_ftq_pc_entry_cfi_idx_bits,
  input         io_get_ftq_pc_entry_cfi_taken,
  input         io_get_ftq_pc_entry_cfi_mispredicted,
  input  [2:0]  io_get_ftq_pc_entry_cfi_type,
  input  [3:0]  io_get_ftq_pc_entry_br_mask,
  input         io_get_ftq_pc_entry_cfi_is_call,
  input         io_get_ftq_pc_entry_cfi_is_ret,
  input         io_get_ftq_pc_entry_cfi_npc_plus4,
  input  [39:0] io_get_ftq_pc_entry_ras_top,
  input  [4:0]  io_get_ftq_pc_entry_ras_idx,
  input         io_get_ftq_pc_entry_start_bank,
  input  [15:0] io_get_ftq_pc_ghist_old_history,
  input         io_get_ftq_pc_ghist_current_saw_branch_not_taken,
  input         io_get_ftq_pc_ghist_new_saw_branch_not_taken,
  input         io_get_ftq_pc_ghist_new_saw_branch_taken,
  input  [4:0]  io_get_ftq_pc_ghist_ras_idx,
  input  [39:0] io_get_ftq_pc_pc,
  input  [39:0] io_get_ftq_pc_com_pc,
  input         io_get_ftq_pc_next_val,
  input  [39:0] io_get_ftq_pc_next_pc,
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
  input  [2:0]  io_fcsr_rm
);
  wire  alu_clock; // @[execution-unit.scala 276:17]
  wire  alu_reset; // @[execution-unit.scala 276:17]
  wire  alu_io_req_ready; // @[execution-unit.scala 276:17]
  wire  alu_io_req_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_req_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_req_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_req_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_req_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_req_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_req_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_req_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_req_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_req_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_req_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_req_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_req_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_req_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_req_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_req_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_req_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_req_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_req_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_req_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_req_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_req_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_req_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_req_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_req_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_req_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_req_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_req_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_req_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_req_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_req_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_req_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_req_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_req_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_req_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_req_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_req_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_req_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_req_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_req_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_req_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_req_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_req_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_req_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_req_bits_rs1_data; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_req_bits_rs2_data; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_req_bits_rs3_data; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_pred_data; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_req_bits_flagdata; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_req_bits_fflagdata; // @[execution-unit.scala 276:17]
  wire  alu_io_req_bits_kill; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_ready; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_resp_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_resp_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_resp_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_resp_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_resp_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_resp_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_resp_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_resp_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_predicated; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_resp_bits_data; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_fflags_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_resp_bits_addr; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_mxcpt_valid; // @[execution-unit.scala 276:17]
  wire [16:0] alu_io_resp_bits_mxcpt_bits; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_sfence_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_sfence_bits_rs1; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_sfence_bits_rs2; // @[execution-unit.scala 276:17]
  wire [38:0] alu_io_resp_bits_sfence_bits_addr; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_sfence_bits_asid; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_flagdata; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_resp_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_resp_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_resp_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_resp_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_resp_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_resp_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_resp_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_resp_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_resp_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_resp_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_resp_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_resp_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_resp_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_resp_bits_fflagdata_bits_fflag; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_brupdate_b1_resolve_mask; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brupdate_b2_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brupdate_b2_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brupdate_b2_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brupdate_b2_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brupdate_b2_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brupdate_b2_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brupdate_b2_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brupdate_b2_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brupdate_b2_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brupdate_b2_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brupdate_b2_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_brupdate_b2_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brupdate_b2_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brupdate_b2_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brupdate_b2_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brupdate_b2_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_brupdate_b2_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brupdate_b2_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_mispredict; // @[execution-unit.scala 276:17]
  wire  alu_io_brupdate_b2_taken; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brupdate_b2_cfi_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brupdate_b2_pc_sel; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_brupdate_b2_jalr_target; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_brupdate_b2_target_offset; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_0_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_0_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_bypass_0_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_bypass_0_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_0_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_bypass_0_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_0_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_0_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_0_bits_data; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_predicated; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_fflags_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_0_bits_fflags_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_0_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_bypass_0_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_bypass_0_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_0_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_bypass_0_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_0_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_0_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_fflags_bits_flags; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_flagdata; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_0_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_0_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_bypass_0_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_bypass_0_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_0_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_0_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_bypass_0_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_0_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_0_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_0_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_0_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_0_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_0_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_0_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_0_bits_fflagdata_bits_fflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_1_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_1_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_bypass_1_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_bypass_1_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_1_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_bypass_1_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_1_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_1_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_1_bits_data; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_predicated; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_fflags_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_1_bits_fflags_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_1_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_bypass_1_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_bypass_1_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_1_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_bypass_1_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_1_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_1_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_fflags_bits_flags; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_flagdata; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_1_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_1_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_bypass_1_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_bypass_1_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_1_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_1_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_bypass_1_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_1_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_1_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_1_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_1_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_1_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_1_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_1_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_1_bits_fflagdata_bits_fflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_2_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_2_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_bypass_2_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_bypass_2_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_2_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_bypass_2_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_2_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_2_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_2_bits_data; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_predicated; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_fflags_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_2_bits_fflags_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_2_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_bypass_2_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_bypass_2_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_2_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_bypass_2_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_2_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_2_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_fflags_bits_flags; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_flagdata; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_2_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_2_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_bypass_2_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_bypass_2_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_2_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_bypass_2_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_bypass_2_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_bypass_2_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_bypass_2_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_bypass_2_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_bypass_2_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_bypass_2_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_bypass_2_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_bypass_2_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_bypass_2_bits_fflagdata_bits_fflag; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_switch; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_switch_off; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_is_unicore; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brinfo_uop_shift; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_uop_lrs3_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_rflag; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_wflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brinfo_uop_prflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brinfo_uop_pwflag; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_pflag_busy; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brinfo_uop_stale_pflag; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brinfo_uop_op1_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brinfo_uop_op2_sel; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brinfo_uop_split_num; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brinfo_uop_self_index; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brinfo_uop_rob_inst_idx; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brinfo_uop_address_num; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brinfo_uop_uopc; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_brinfo_uop_inst; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_brinfo_uop_debug_inst; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_is_rvc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_brinfo_uop_debug_pc; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brinfo_uop_iq_type; // @[execution-unit.scala 276:17]
  wire [9:0] alu_io_brinfo_uop_fu_code; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brinfo_uop_ctrl_br_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_uop_ctrl_op1_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brinfo_uop_ctrl_op2_sel; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brinfo_uop_ctrl_imm_sel; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brinfo_uop_ctrl_op_fcn; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_ctrl_fcn_dw; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brinfo_uop_ctrl_csr_cmd; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_ctrl_is_load; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_ctrl_is_sta; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_ctrl_is_std; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_uop_ctrl_op3_sel; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_uop_iw_state; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_iw_p1_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_iw_p2_poisoned; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_is_br; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_is_jalr; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_is_jal; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_is_sfb; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_brinfo_uop_br_mask; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_brinfo_uop_br_tag; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_brinfo_uop_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_edge_inst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brinfo_uop_pc_lob; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_taken; // @[execution-unit.scala 276:17]
  wire [19:0] alu_io_brinfo_uop_imm_packed; // @[execution-unit.scala 276:17]
  wire [11:0] alu_io_brinfo_uop_csr_addr; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brinfo_uop_rob_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_brinfo_uop_ldq_idx; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_brinfo_uop_stq_idx; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_uop_rxq_idx; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brinfo_uop_pdst; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brinfo_uop_prs1; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brinfo_uop_prs2; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brinfo_uop_prs3; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_brinfo_uop_ppred; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_prs1_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_prs2_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_prs3_busy; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_ppred_busy; // @[execution-unit.scala 276:17]
  wire [6:0] alu_io_brinfo_uop_stale_pdst; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_exception; // @[execution-unit.scala 276:17]
  wire [63:0] alu_io_brinfo_uop_exc_cause; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_bypassable; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_brinfo_uop_mem_cmd; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_uop_mem_size; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_mem_signed; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_is_fence; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_is_fencei; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_is_amo; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_uses_ldq; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_uses_stq; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_is_sys_pc2epc; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_is_unique; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_flush_on_commit; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_ldst_is_rs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brinfo_uop_ldst; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brinfo_uop_lrs1; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brinfo_uop_lrs2; // @[execution-unit.scala 276:17]
  wire [5:0] alu_io_brinfo_uop_lrs3; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_ldst_val; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_uop_dst_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_uop_lrs1_rtype; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_uop_lrs2_rtype; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_frs3_en; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_fp_val; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_fp_single; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_xcpt_pf_if; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_xcpt_ae_if; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_xcpt_ma_if; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_bp_debug_if; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_uop_bp_xcpt_if; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_uop_debug_fsrc; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_uop_debug_tsrc; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_valid; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_mispredict; // @[execution-unit.scala 276:17]
  wire  alu_io_brinfo_taken; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_brinfo_cfi_type; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_brinfo_pc_sel; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_brinfo_jalr_target; // @[execution-unit.scala 276:17]
  wire [31:0] alu_io_brinfo_target_offset; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_get_ftq_pc_ftq_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_get_ftq_pc_entry_cfi_idx_valid; // @[execution-unit.scala 276:17]
  wire [1:0] alu_io_get_ftq_pc_entry_cfi_idx_bits; // @[execution-unit.scala 276:17]
  wire  alu_io_get_ftq_pc_entry_cfi_taken; // @[execution-unit.scala 276:17]
  wire  alu_io_get_ftq_pc_entry_cfi_mispredicted; // @[execution-unit.scala 276:17]
  wire [2:0] alu_io_get_ftq_pc_entry_cfi_type; // @[execution-unit.scala 276:17]
  wire [3:0] alu_io_get_ftq_pc_entry_br_mask; // @[execution-unit.scala 276:17]
  wire  alu_io_get_ftq_pc_entry_cfi_is_call; // @[execution-unit.scala 276:17]
  wire  alu_io_get_ftq_pc_entry_cfi_is_ret; // @[execution-unit.scala 276:17]
  wire  alu_io_get_ftq_pc_entry_cfi_npc_plus4; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_get_ftq_pc_entry_ras_top; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_get_ftq_pc_entry_ras_idx; // @[execution-unit.scala 276:17]
  wire  alu_io_get_ftq_pc_entry_start_bank; // @[execution-unit.scala 276:17]
  wire [15:0] alu_io_get_ftq_pc_ghist_old_history; // @[execution-unit.scala 276:17]
  wire  alu_io_get_ftq_pc_ghist_current_saw_branch_not_taken; // @[execution-unit.scala 276:17]
  wire  alu_io_get_ftq_pc_ghist_new_saw_branch_not_taken; // @[execution-unit.scala 276:17]
  wire  alu_io_get_ftq_pc_ghist_new_saw_branch_taken; // @[execution-unit.scala 276:17]
  wire [4:0] alu_io_get_ftq_pc_ghist_ras_idx; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_get_ftq_pc_pc; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_get_ftq_pc_com_pc; // @[execution-unit.scala 276:17]
  wire  alu_io_get_ftq_pc_next_val; // @[execution-unit.scala 276:17]
  wire [39:0] alu_io_get_ftq_pc_next_pc; // @[execution-unit.scala 276:17]
  wire  imul_clock; // @[execution-unit.scala 335:18]
  wire  imul_reset; // @[execution-unit.scala 335:18]
  wire  imul_io_req_ready; // @[execution-unit.scala 335:18]
  wire  imul_io_req_valid; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_switch; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_switch_off; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_is_unicore; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_req_bits_uop_shift; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_req_bits_uop_lrs3_rtype; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_rflag; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_wflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_req_bits_uop_prflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_req_bits_uop_pwflag; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_pflag_busy; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_req_bits_uop_stale_pflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_req_bits_uop_op1_sel; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_req_bits_uop_op2_sel; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_req_bits_uop_split_num; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_req_bits_uop_self_index; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_req_bits_uop_rob_inst_idx; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_req_bits_uop_address_num; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_req_bits_uop_uopc; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_req_bits_uop_inst; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_req_bits_uop_debug_inst; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_is_rvc; // @[execution-unit.scala 335:18]
  wire [39:0] imul_io_req_bits_uop_debug_pc; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_req_bits_uop_iq_type; // @[execution-unit.scala 335:18]
  wire [9:0] imul_io_req_bits_uop_fu_code; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_req_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_req_bits_uop_iw_state; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_is_br; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_is_jalr; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_is_jal; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_is_sfb; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_req_bits_uop_br_mask; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_req_bits_uop_br_tag; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_req_bits_uop_ftq_idx; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_edge_inst; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_req_bits_uop_pc_lob; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_taken; // @[execution-unit.scala 335:18]
  wire [19:0] imul_io_req_bits_uop_imm_packed; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_req_bits_uop_csr_addr; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_req_bits_uop_rob_idx; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_req_bits_uop_ldq_idx; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_req_bits_uop_stq_idx; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_req_bits_uop_rxq_idx; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_req_bits_uop_pdst; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_req_bits_uop_prs1; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_req_bits_uop_prs2; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_req_bits_uop_prs3; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_req_bits_uop_ppred; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_prs1_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_prs2_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_prs3_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_ppred_busy; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_req_bits_uop_stale_pdst; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_exception; // @[execution-unit.scala 335:18]
  wire [63:0] imul_io_req_bits_uop_exc_cause; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_bypassable; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_req_bits_uop_mem_cmd; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_req_bits_uop_mem_size; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_mem_signed; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_is_fence; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_is_fencei; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_is_amo; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_uses_ldq; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_uses_stq; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_is_unique; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_req_bits_uop_ldst; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_req_bits_uop_lrs1; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_req_bits_uop_lrs2; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_req_bits_uop_lrs3; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_ldst_val; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_req_bits_uop_dst_rtype; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_frs3_en; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_fp_val; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_fp_single; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 335:18]
  wire [63:0] imul_io_req_bits_rs1_data; // @[execution-unit.scala 335:18]
  wire [63:0] imul_io_req_bits_rs2_data; // @[execution-unit.scala 335:18]
  wire [63:0] imul_io_req_bits_rs3_data; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_pred_data; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_req_bits_flagdata; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_req_bits_fflagdata; // @[execution-unit.scala 335:18]
  wire  imul_io_req_bits_kill; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_ready; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_valid; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_switch; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_switch_off; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_is_unicore; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_uop_shift; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_uop_lrs3_rtype; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_rflag; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_wflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_uop_prflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_uop_pwflag; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_pflag_busy; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_uop_stale_pflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_uop_op1_sel; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_uop_op2_sel; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_uop_split_num; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_uop_self_index; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_uop_rob_inst_idx; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_uop_address_num; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_uop_uopc; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_resp_bits_uop_inst; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_resp_bits_uop_debug_inst; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_is_rvc; // @[execution-unit.scala 335:18]
  wire [39:0] imul_io_resp_bits_uop_debug_pc; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_uop_iq_type; // @[execution-unit.scala 335:18]
  wire [9:0] imul_io_resp_bits_uop_fu_code; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_uop_ctrl_br_type; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_ctrl_is_load; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_ctrl_is_std; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_uop_iw_state; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_is_br; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_is_jalr; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_is_jal; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_is_sfb; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_resp_bits_uop_br_mask; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_uop_br_tag; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_uop_ftq_idx; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_edge_inst; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_uop_pc_lob; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_taken; // @[execution-unit.scala 335:18]
  wire [19:0] imul_io_resp_bits_uop_imm_packed; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_resp_bits_uop_csr_addr; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_uop_rob_idx; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_uop_ldq_idx; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_uop_stq_idx; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_uop_rxq_idx; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_uop_pdst; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_uop_prs1; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_uop_prs2; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_uop_prs3; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_uop_ppred; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_prs1_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_prs2_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_prs3_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_ppred_busy; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_uop_stale_pdst; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_exception; // @[execution-unit.scala 335:18]
  wire [63:0] imul_io_resp_bits_uop_exc_cause; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_bypassable; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_uop_mem_cmd; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_uop_mem_size; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_mem_signed; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_is_fence; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_is_fencei; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_is_amo; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_uses_ldq; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_uses_stq; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_is_unique; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_flush_on_commit; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_uop_ldst; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_uop_lrs1; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_uop_lrs2; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_uop_lrs3; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_ldst_val; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_uop_dst_rtype; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_uop_lrs1_rtype; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_uop_lrs2_rtype; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_frs3_en; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_fp_val; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_fp_single; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_bp_debug_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_uop_debug_fsrc; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_uop_debug_tsrc; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_predicated; // @[execution-unit.scala 335:18]
  wire [63:0] imul_io_resp_bits_data; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_valid; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_switch; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_fflags_bits_uop_shift; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 335:18]
  wire [39:0] imul_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 335:18]
  wire [9:0] imul_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 335:18]
  wire [19:0] imul_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 335:18]
  wire [63:0] imul_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 335:18]
  wire [39:0] imul_io_resp_bits_addr; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_mxcpt_valid; // @[execution-unit.scala 335:18]
  wire [16:0] imul_io_resp_bits_mxcpt_bits; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_sfence_valid; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_sfence_bits_rs1; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_sfence_bits_rs2; // @[execution-unit.scala 335:18]
  wire [38:0] imul_io_resp_bits_sfence_bits_addr; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_sfence_bits_asid; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_flagdata; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_valid; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_resp_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_resp_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 335:18]
  wire [39:0] imul_io_resp_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 335:18]
  wire [9:0] imul_io_resp_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_resp_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_resp_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 335:18]
  wire [19:0] imul_io_resp_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_resp_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_resp_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 335:18]
  wire [63:0] imul_io_resp_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_resp_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_resp_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 335:18]
  wire  imul_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_resp_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_resp_bits_fflagdata_bits_fflag; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_brupdate_b1_resolve_mask; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_switch; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_switch_off; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_is_unicore; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_brupdate_b2_uop_shift; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_uop_lrs3_rtype; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_rflag; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_wflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_brupdate_b2_uop_prflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_brupdate_b2_uop_pwflag; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_pflag_busy; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_brupdate_b2_uop_stale_pflag; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_brupdate_b2_uop_op1_sel; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_brupdate_b2_uop_op2_sel; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_brupdate_b2_uop_split_num; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_brupdate_b2_uop_self_index; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_brupdate_b2_uop_rob_inst_idx; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_brupdate_b2_uop_address_num; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_brupdate_b2_uop_uopc; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_brupdate_b2_uop_inst; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 335:18]
  wire [39:0] imul_io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 335:18]
  wire [9:0] imul_io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_uop_ctrl_op3_sel; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_is_br; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 335:18]
  wire [3:0] imul_io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_taken; // @[execution-unit.scala 335:18]
  wire [19:0] imul_io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 335:18]
  wire [11:0] imul_io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_brupdate_b2_uop_pdst; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_brupdate_b2_uop_prs1; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_brupdate_b2_uop_prs2; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_brupdate_b2_uop_prs3; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_brupdate_b2_uop_ppred; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 335:18]
  wire [6:0] imul_io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_exception; // @[execution-unit.scala 335:18]
  wire [63:0] imul_io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 335:18]
  wire [4:0] imul_io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_brupdate_b2_uop_ldst; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 335:18]
  wire [5:0] imul_io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_valid; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_mispredict; // @[execution-unit.scala 335:18]
  wire  imul_io_brupdate_b2_taken; // @[execution-unit.scala 335:18]
  wire [2:0] imul_io_brupdate_b2_cfi_type; // @[execution-unit.scala 335:18]
  wire [1:0] imul_io_brupdate_b2_pc_sel; // @[execution-unit.scala 335:18]
  wire [39:0] imul_io_brupdate_b2_jalr_target; // @[execution-unit.scala 335:18]
  wire [31:0] imul_io_brupdate_b2_target_offset; // @[execution-unit.scala 335:18]
  wire  ifpu_clock; // @[execution-unit.scala 353:18]
  wire  ifpu_reset; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_ready; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_valid; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_switch; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_switch_off; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_is_unicore; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_req_bits_uop_shift; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_req_bits_uop_lrs3_rtype; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_rflag; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_wflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_req_bits_uop_prflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_req_bits_uop_pwflag; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_pflag_busy; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_req_bits_uop_stale_pflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_req_bits_uop_op1_sel; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_req_bits_uop_op2_sel; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_req_bits_uop_split_num; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_req_bits_uop_self_index; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_req_bits_uop_rob_inst_idx; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_req_bits_uop_address_num; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_req_bits_uop_uopc; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_req_bits_uop_inst; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_req_bits_uop_debug_inst; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_is_rvc; // @[execution-unit.scala 353:18]
  wire [39:0] ifpu_io_req_bits_uop_debug_pc; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_req_bits_uop_iq_type; // @[execution-unit.scala 353:18]
  wire [9:0] ifpu_io_req_bits_uop_fu_code; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_req_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_req_bits_uop_iw_state; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_is_br; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_is_jalr; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_is_jal; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_is_sfb; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_req_bits_uop_br_mask; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_req_bits_uop_br_tag; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_req_bits_uop_ftq_idx; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_edge_inst; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_req_bits_uop_pc_lob; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_taken; // @[execution-unit.scala 353:18]
  wire [19:0] ifpu_io_req_bits_uop_imm_packed; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_req_bits_uop_csr_addr; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_req_bits_uop_rob_idx; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_req_bits_uop_ldq_idx; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_req_bits_uop_stq_idx; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_req_bits_uop_rxq_idx; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_req_bits_uop_pdst; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_req_bits_uop_prs1; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_req_bits_uop_prs2; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_req_bits_uop_prs3; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_req_bits_uop_ppred; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_prs1_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_prs2_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_prs3_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_ppred_busy; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_req_bits_uop_stale_pdst; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_exception; // @[execution-unit.scala 353:18]
  wire [63:0] ifpu_io_req_bits_uop_exc_cause; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_bypassable; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_req_bits_uop_mem_cmd; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_req_bits_uop_mem_size; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_mem_signed; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_is_fence; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_is_fencei; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_is_amo; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_uses_ldq; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_uses_stq; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_is_unique; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_req_bits_uop_ldst; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_req_bits_uop_lrs1; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_req_bits_uop_lrs2; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_req_bits_uop_lrs3; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_ldst_val; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_req_bits_uop_dst_rtype; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_frs3_en; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_fp_val; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_fp_single; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 353:18]
  wire [64:0] ifpu_io_req_bits_rs1_data; // @[execution-unit.scala 353:18]
  wire [64:0] ifpu_io_req_bits_rs2_data; // @[execution-unit.scala 353:18]
  wire [64:0] ifpu_io_req_bits_rs3_data; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_pred_data; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_req_bits_flagdata; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_req_bits_fflagdata; // @[execution-unit.scala 353:18]
  wire  ifpu_io_req_bits_kill; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_ready; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_valid; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_switch; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_switch_off; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_is_unicore; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_uop_shift; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_uop_lrs3_rtype; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_rflag; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_wflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_uop_prflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_uop_pwflag; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_pflag_busy; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_uop_stale_pflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_uop_op1_sel; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_uop_op2_sel; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_uop_split_num; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_uop_self_index; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_uop_rob_inst_idx; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_uop_address_num; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_uop_uopc; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_resp_bits_uop_inst; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_resp_bits_uop_debug_inst; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_is_rvc; // @[execution-unit.scala 353:18]
  wire [39:0] ifpu_io_resp_bits_uop_debug_pc; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_uop_iq_type; // @[execution-unit.scala 353:18]
  wire [9:0] ifpu_io_resp_bits_uop_fu_code; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_uop_ctrl_br_type; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_ctrl_is_load; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_ctrl_is_std; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_uop_iw_state; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_is_br; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_is_jalr; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_is_jal; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_is_sfb; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_resp_bits_uop_br_mask; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_uop_br_tag; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_uop_ftq_idx; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_edge_inst; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_uop_pc_lob; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_taken; // @[execution-unit.scala 353:18]
  wire [19:0] ifpu_io_resp_bits_uop_imm_packed; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_resp_bits_uop_csr_addr; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_uop_rob_idx; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_uop_ldq_idx; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_uop_stq_idx; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_uop_rxq_idx; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_uop_pdst; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_uop_prs1; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_uop_prs2; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_uop_prs3; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_uop_ppred; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_prs1_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_prs2_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_prs3_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_ppred_busy; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_uop_stale_pdst; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_exception; // @[execution-unit.scala 353:18]
  wire [63:0] ifpu_io_resp_bits_uop_exc_cause; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_bypassable; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_uop_mem_cmd; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_uop_mem_size; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_mem_signed; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_is_fence; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_is_fencei; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_is_amo; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_uses_ldq; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_uses_stq; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_is_unique; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_flush_on_commit; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_uop_ldst; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_uop_lrs1; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_uop_lrs2; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_uop_lrs3; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_ldst_val; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_uop_dst_rtype; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_uop_lrs1_rtype; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_uop_lrs2_rtype; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_frs3_en; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_fp_val; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_fp_single; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_bp_debug_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_uop_debug_fsrc; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_uop_debug_tsrc; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_predicated; // @[execution-unit.scala 353:18]
  wire [64:0] ifpu_io_resp_bits_data; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_valid; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_switch; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_fflags_bits_uop_shift; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 353:18]
  wire [39:0] ifpu_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 353:18]
  wire [9:0] ifpu_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 353:18]
  wire [19:0] ifpu_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 353:18]
  wire [63:0] ifpu_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 353:18]
  wire [39:0] ifpu_io_resp_bits_addr; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_mxcpt_valid; // @[execution-unit.scala 353:18]
  wire [16:0] ifpu_io_resp_bits_mxcpt_bits; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_sfence_valid; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_sfence_bits_rs1; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_sfence_bits_rs2; // @[execution-unit.scala 353:18]
  wire [38:0] ifpu_io_resp_bits_sfence_bits_addr; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_sfence_bits_asid; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_flagdata; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_valid; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_resp_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_resp_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 353:18]
  wire [39:0] ifpu_io_resp_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 353:18]
  wire [9:0] ifpu_io_resp_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_resp_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_resp_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 353:18]
  wire [19:0] ifpu_io_resp_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_resp_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_resp_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 353:18]
  wire [63:0] ifpu_io_resp_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_resp_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_resp_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_resp_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_resp_bits_fflagdata_bits_fflag; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_brupdate_b1_resolve_mask; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_switch; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_switch_off; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_is_unicore; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_brupdate_b2_uop_shift; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_uop_lrs3_rtype; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_rflag; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_wflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_brupdate_b2_uop_prflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_brupdate_b2_uop_pwflag; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_pflag_busy; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_brupdate_b2_uop_stale_pflag; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_brupdate_b2_uop_op1_sel; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_brupdate_b2_uop_op2_sel; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_brupdate_b2_uop_split_num; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_brupdate_b2_uop_self_index; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_brupdate_b2_uop_rob_inst_idx; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_brupdate_b2_uop_address_num; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_brupdate_b2_uop_uopc; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_brupdate_b2_uop_inst; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 353:18]
  wire [39:0] ifpu_io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 353:18]
  wire [9:0] ifpu_io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_uop_ctrl_op3_sel; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_is_br; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 353:18]
  wire [3:0] ifpu_io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_taken; // @[execution-unit.scala 353:18]
  wire [19:0] ifpu_io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 353:18]
  wire [11:0] ifpu_io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_brupdate_b2_uop_pdst; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_brupdate_b2_uop_prs1; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_brupdate_b2_uop_prs2; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_brupdate_b2_uop_prs3; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_brupdate_b2_uop_ppred; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 353:18]
  wire [6:0] ifpu_io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_exception; // @[execution-unit.scala 353:18]
  wire [63:0] ifpu_io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 353:18]
  wire [4:0] ifpu_io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_brupdate_b2_uop_ldst; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 353:18]
  wire [5:0] ifpu_io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_valid; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_mispredict; // @[execution-unit.scala 353:18]
  wire  ifpu_io_brupdate_b2_taken; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_brupdate_b2_cfi_type; // @[execution-unit.scala 353:18]
  wire [1:0] ifpu_io_brupdate_b2_pc_sel; // @[execution-unit.scala 353:18]
  wire [39:0] ifpu_io_brupdate_b2_jalr_target; // @[execution-unit.scala 353:18]
  wire [31:0] ifpu_io_brupdate_b2_target_offset; // @[execution-unit.scala 353:18]
  wire [2:0] ifpu_io_fcsr_rm; // @[execution-unit.scala 353:18]
  wire  BranchKillableQueue_clock; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_reset; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_ready; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_valid; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_switch; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_switch_off; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_unicore; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_uop_shift; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_lrs3_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_rflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_wflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_prflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_pwflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_pflag_busy; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_stale_pflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_op1_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_op2_sel; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_split_num; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_self_index; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_rob_inst_idx; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_address_num; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_uop_uopc; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_enq_bits_uop_inst; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_enq_bits_uop_debug_inst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_rvc; // @[execution-unit.scala 361:23]
  wire [39:0] BranchKillableQueue_io_enq_bits_uop_debug_pc; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_uop_iq_type; // @[execution-unit.scala 361:23]
  wire [9:0] BranchKillableQueue_io_enq_bits_uop_fu_code; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_ctrl_br_type; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ctrl_is_load; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ctrl_is_sta; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ctrl_is_std; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_iw_state; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_br; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_jalr; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_jal; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_sfb; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_enq_bits_uop_br_mask; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_br_tag; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_uop_ftq_idx; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_edge_inst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_pc_lob; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_taken; // @[execution-unit.scala 361:23]
  wire [19:0] BranchKillableQueue_io_enq_bits_uop_imm_packed; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_enq_bits_uop_csr_addr; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_rob_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_uop_ldq_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_uop_stq_idx; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_rxq_idx; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_uop_pdst; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_uop_prs1; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_uop_prs2; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_uop_prs3; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_uop_ppred; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_prs1_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_prs2_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_prs3_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ppred_busy; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_uop_stale_pdst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_exception; // @[execution-unit.scala 361:23]
  wire [63:0] BranchKillableQueue_io_enq_bits_uop_exc_cause; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_bypassable; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_uop_mem_cmd; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_mem_size; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_mem_signed; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_fence; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_fencei; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_amo; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_uses_ldq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_uses_stq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_unique; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_flush_on_commit; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ldst_is_rs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_ldst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_lrs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_lrs2; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_lrs3; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ldst_val; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_dst_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_lrs1_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_lrs2_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_frs3_en; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_fp_val; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_fp_single; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_xcpt_pf_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_xcpt_ae_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_xcpt_ma_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_bp_debug_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_uop_bp_xcpt_if; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_debug_fsrc; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_debug_tsrc; // @[execution-unit.scala 361:23]
  wire [64:0] BranchKillableQueue_io_enq_bits_data; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_predicated; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_valid; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_switch; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_shift; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_inst; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 361:23]
  wire [39:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 361:23]
  wire [9:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_taken; // @[execution-unit.scala 361:23]
  wire [19:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_exception; // @[execution-unit.scala 361:23]
  wire [63:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflags_bits_flags; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_flagdata; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_valid; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 361:23]
  wire [39:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 361:23]
  wire [9:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 361:23]
  wire [19:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 361:23]
  wire [63:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_enq_bits_fflagdata_bits_fflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_ready; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_valid; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_switch; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_switch_off; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_unicore; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_uop_shift; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_lrs3_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_rflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_wflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_prflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_pwflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_pflag_busy; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_stale_pflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_op1_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_op2_sel; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_split_num; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_self_index; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_rob_inst_idx; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_address_num; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_uop_uopc; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_deq_bits_uop_inst; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_deq_bits_uop_debug_inst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_rvc; // @[execution-unit.scala 361:23]
  wire [39:0] BranchKillableQueue_io_deq_bits_uop_debug_pc; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_uop_iq_type; // @[execution-unit.scala 361:23]
  wire [9:0] BranchKillableQueue_io_deq_bits_uop_fu_code; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_ctrl_br_type; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ctrl_is_load; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ctrl_is_sta; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ctrl_is_std; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_iw_state; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_br; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_jalr; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_jal; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_sfb; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_deq_bits_uop_br_mask; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_br_tag; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_uop_ftq_idx; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_edge_inst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_pc_lob; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_taken; // @[execution-unit.scala 361:23]
  wire [19:0] BranchKillableQueue_io_deq_bits_uop_imm_packed; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_deq_bits_uop_csr_addr; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_rob_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_uop_ldq_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_uop_stq_idx; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_rxq_idx; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_uop_pdst; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_uop_prs1; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_uop_prs2; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_uop_prs3; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_uop_ppred; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_prs1_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_prs2_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_prs3_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ppred_busy; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_uop_stale_pdst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_exception; // @[execution-unit.scala 361:23]
  wire [63:0] BranchKillableQueue_io_deq_bits_uop_exc_cause; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_bypassable; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_uop_mem_cmd; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_mem_size; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_mem_signed; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_fence; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_fencei; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_amo; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_uses_ldq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_uses_stq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_unique; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_flush_on_commit; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ldst_is_rs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_ldst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_lrs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_lrs2; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_lrs3; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ldst_val; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_dst_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_lrs1_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_lrs2_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_frs3_en; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_fp_val; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_fp_single; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_xcpt_pf_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_xcpt_ae_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_xcpt_ma_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_bp_debug_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_uop_bp_xcpt_if; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_debug_fsrc; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_debug_tsrc; // @[execution-unit.scala 361:23]
  wire [64:0] BranchKillableQueue_io_deq_bits_data; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_predicated; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_valid; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_switch; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_shift; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_inst; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 361:23]
  wire [39:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 361:23]
  wire [9:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_taken; // @[execution-unit.scala 361:23]
  wire [19:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_exception; // @[execution-unit.scala 361:23]
  wire [63:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflags_bits_flags; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_flagdata; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_valid; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 361:23]
  wire [39:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 361:23]
  wire [9:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 361:23]
  wire [19:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 361:23]
  wire [63:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_deq_bits_fflagdata_bits_fflag; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_brupdate_b1_resolve_mask; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_switch; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_switch_off; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_unicore; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_brupdate_b2_uop_shift; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_lrs3_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_rflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_wflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_prflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_pwflag; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_pflag_busy; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_stale_pflag; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_op1_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_op2_sel; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_split_num; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_self_index; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_rob_inst_idx; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_address_num; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_brupdate_b2_uop_uopc; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_brupdate_b2_uop_inst; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 361:23]
  wire [39:0] BranchKillableQueue_io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 361:23]
  wire [9:0] BranchKillableQueue_io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_op3_sel; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_br; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 361:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_taken; // @[execution-unit.scala 361:23]
  wire [19:0] BranchKillableQueue_io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 361:23]
  wire [11:0] BranchKillableQueue_io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_brupdate_b2_uop_pdst; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_brupdate_b2_uop_prs1; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_brupdate_b2_uop_prs2; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_brupdate_b2_uop_prs3; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_brupdate_b2_uop_ppred; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 361:23]
  wire [6:0] BranchKillableQueue_io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_exception; // @[execution-unit.scala 361:23]
  wire [63:0] BranchKillableQueue_io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 361:23]
  wire [4:0] BranchKillableQueue_io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_ldst; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 361:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_valid; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_mispredict; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_brupdate_b2_taken; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_brupdate_b2_cfi_type; // @[execution-unit.scala 361:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_pc_sel; // @[execution-unit.scala 361:23]
  wire [39:0] BranchKillableQueue_io_brupdate_b2_jalr_target; // @[execution-unit.scala 361:23]
  wire [31:0] BranchKillableQueue_io_brupdate_b2_target_offset; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_flush; // @[execution-unit.scala 361:23]
  wire  BranchKillableQueue_io_empty; // @[execution-unit.scala 361:23]
  wire [2:0] BranchKillableQueue_io_count; // @[execution-unit.scala 361:23]
  wire  ifpu_busy = ~BranchKillableQueue_io_empty; // @[execution-unit.scala 376:18]
  wire [9:0] _T_16 = ~ifpu_busy ? 10'h100 : 10'h0; // @[execution-unit.scala 270:21]
  wire  _T_21 = io_req_bits_uop_fu_code == 10'h2; // @[execution-unit.scala 282:32]
  wire  _T_22 = io_req_bits_uop_fu_code == 10'h1 | _T_21; // @[execution-unit.scala 281:43]
  wire  _T_25 = io_req_bits_uop_fu_code == 10'h20 & io_req_bits_uop_uopc != 7'h6c; // @[execution-unit.scala 283:43]
  wire  _T_26 = _T_22 | _T_25; // @[execution-unit.scala 282:43]
  wire [9:0] _T_28 = io_req_bits_uop_fu_code & 10'h8; // @[micro-op.scala 189:40]
  wire  _T_29 = _T_28 != 10'h0; // @[micro-op.scala 189:47]
  wire [9:0] _T_31 = io_req_bits_uop_fu_code & 10'h100; // @[micro-op.scala 189:40]
  wire  _T_32 = _T_31 != 10'h0; // @[micro-op.scala 189:47]
  wire [63:0] _T_40 = alu_io_resp_valid ? alu_io_resp_bits_data : imul_io_resp_bits_data; // @[Mux.scala 47:69]
  wire  _T_45 = alu_io_resp_bits_uop_imm_packed[19]; // @[util.scala 330:37]
  wire  lo_lo = alu_io_resp_bits_uop_imm_packed[8]; // @[Cat.scala 30:58]
  wire [4:0] lo_hi_lo = alu_io_resp_bits_uop_imm_packed[13:9]; // @[Cat.scala 30:58]
  wire [4:0] lo_hi_hi = alu_io_resp_bits_uop_imm_packed[18:14]; // @[Cat.scala 30:58]
  wire  hi_lo_lo = alu_io_resp_bits_uop_imm_packed[19]; // @[Cat.scala 30:58]
  wire [7:0] hi_lo_hi = {8{_T_45}}; // @[Cat.scala 30:58]
  wire [10:0] hi_hi_lo = {11{_T_45}}; // @[Cat.scala 30:58]
  wire [31:0] _T_80 = {hi_lo_lo,hi_hi_lo,hi_lo_hi,hi_lo_lo,lo_hi_hi,lo_hi_lo,lo_lo}; // @[execution-unit.scala 451:83]
  wire [1:0] _T_81 = alu_io_resp_valid + imul_io_resp_valid; // @[Bitwise.scala 47:55]
  ALUUnit alu ( // @[execution-unit.scala 276:17]
    .clock(alu_clock),
    .reset(alu_reset),
    .io_req_ready(alu_io_req_ready),
    .io_req_valid(alu_io_req_valid),
    .io_req_bits_uop_switch(alu_io_req_bits_uop_switch),
    .io_req_bits_uop_switch_off(alu_io_req_bits_uop_switch_off),
    .io_req_bits_uop_is_unicore(alu_io_req_bits_uop_is_unicore),
    .io_req_bits_uop_shift(alu_io_req_bits_uop_shift),
    .io_req_bits_uop_lrs3_rtype(alu_io_req_bits_uop_lrs3_rtype),
    .io_req_bits_uop_rflag(alu_io_req_bits_uop_rflag),
    .io_req_bits_uop_wflag(alu_io_req_bits_uop_wflag),
    .io_req_bits_uop_prflag(alu_io_req_bits_uop_prflag),
    .io_req_bits_uop_pwflag(alu_io_req_bits_uop_pwflag),
    .io_req_bits_uop_pflag_busy(alu_io_req_bits_uop_pflag_busy),
    .io_req_bits_uop_stale_pflag(alu_io_req_bits_uop_stale_pflag),
    .io_req_bits_uop_op1_sel(alu_io_req_bits_uop_op1_sel),
    .io_req_bits_uop_op2_sel(alu_io_req_bits_uop_op2_sel),
    .io_req_bits_uop_split_num(alu_io_req_bits_uop_split_num),
    .io_req_bits_uop_self_index(alu_io_req_bits_uop_self_index),
    .io_req_bits_uop_rob_inst_idx(alu_io_req_bits_uop_rob_inst_idx),
    .io_req_bits_uop_address_num(alu_io_req_bits_uop_address_num),
    .io_req_bits_uop_uopc(alu_io_req_bits_uop_uopc),
    .io_req_bits_uop_inst(alu_io_req_bits_uop_inst),
    .io_req_bits_uop_debug_inst(alu_io_req_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc(alu_io_req_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc(alu_io_req_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type(alu_io_req_bits_uop_iq_type),
    .io_req_bits_uop_fu_code(alu_io_req_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type(alu_io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel(alu_io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel(alu_io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel(alu_io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn(alu_io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw(alu_io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd(alu_io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load(alu_io_req_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta(alu_io_req_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std(alu_io_req_bits_uop_ctrl_is_std),
    .io_req_bits_uop_ctrl_op3_sel(alu_io_req_bits_uop_ctrl_op3_sel),
    .io_req_bits_uop_iw_state(alu_io_req_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned(alu_io_req_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned(alu_io_req_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br(alu_io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr(alu_io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal(alu_io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb(alu_io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask(alu_io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag(alu_io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx(alu_io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst(alu_io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob(alu_io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken(alu_io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed(alu_io_req_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr(alu_io_req_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx(alu_io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx(alu_io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx(alu_io_req_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx(alu_io_req_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst(alu_io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1(alu_io_req_bits_uop_prs1),
    .io_req_bits_uop_prs2(alu_io_req_bits_uop_prs2),
    .io_req_bits_uop_prs3(alu_io_req_bits_uop_prs3),
    .io_req_bits_uop_ppred(alu_io_req_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy(alu_io_req_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy(alu_io_req_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy(alu_io_req_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy(alu_io_req_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst(alu_io_req_bits_uop_stale_pdst),
    .io_req_bits_uop_exception(alu_io_req_bits_uop_exception),
    .io_req_bits_uop_exc_cause(alu_io_req_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable(alu_io_req_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd(alu_io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size(alu_io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed(alu_io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence(alu_io_req_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei(alu_io_req_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo(alu_io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq(alu_io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq(alu_io_req_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc(alu_io_req_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique(alu_io_req_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit(alu_io_req_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1(alu_io_req_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst(alu_io_req_bits_uop_ldst),
    .io_req_bits_uop_lrs1(alu_io_req_bits_uop_lrs1),
    .io_req_bits_uop_lrs2(alu_io_req_bits_uop_lrs2),
    .io_req_bits_uop_lrs3(alu_io_req_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val(alu_io_req_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype(alu_io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype(alu_io_req_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype(alu_io_req_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en(alu_io_req_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val(alu_io_req_bits_uop_fp_val),
    .io_req_bits_uop_fp_single(alu_io_req_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if(alu_io_req_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if(alu_io_req_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if(alu_io_req_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if(alu_io_req_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if(alu_io_req_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc(alu_io_req_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc(alu_io_req_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data(alu_io_req_bits_rs1_data),
    .io_req_bits_rs2_data(alu_io_req_bits_rs2_data),
    .io_req_bits_rs3_data(alu_io_req_bits_rs3_data),
    .io_req_bits_pred_data(alu_io_req_bits_pred_data),
    .io_req_bits_flagdata(alu_io_req_bits_flagdata),
    .io_req_bits_fflagdata(alu_io_req_bits_fflagdata),
    .io_req_bits_kill(alu_io_req_bits_kill),
    .io_resp_ready(alu_io_resp_ready),
    .io_resp_valid(alu_io_resp_valid),
    .io_resp_bits_uop_switch(alu_io_resp_bits_uop_switch),
    .io_resp_bits_uop_switch_off(alu_io_resp_bits_uop_switch_off),
    .io_resp_bits_uop_is_unicore(alu_io_resp_bits_uop_is_unicore),
    .io_resp_bits_uop_shift(alu_io_resp_bits_uop_shift),
    .io_resp_bits_uop_lrs3_rtype(alu_io_resp_bits_uop_lrs3_rtype),
    .io_resp_bits_uop_rflag(alu_io_resp_bits_uop_rflag),
    .io_resp_bits_uop_wflag(alu_io_resp_bits_uop_wflag),
    .io_resp_bits_uop_prflag(alu_io_resp_bits_uop_prflag),
    .io_resp_bits_uop_pwflag(alu_io_resp_bits_uop_pwflag),
    .io_resp_bits_uop_pflag_busy(alu_io_resp_bits_uop_pflag_busy),
    .io_resp_bits_uop_stale_pflag(alu_io_resp_bits_uop_stale_pflag),
    .io_resp_bits_uop_op1_sel(alu_io_resp_bits_uop_op1_sel),
    .io_resp_bits_uop_op2_sel(alu_io_resp_bits_uop_op2_sel),
    .io_resp_bits_uop_split_num(alu_io_resp_bits_uop_split_num),
    .io_resp_bits_uop_self_index(alu_io_resp_bits_uop_self_index),
    .io_resp_bits_uop_rob_inst_idx(alu_io_resp_bits_uop_rob_inst_idx),
    .io_resp_bits_uop_address_num(alu_io_resp_bits_uop_address_num),
    .io_resp_bits_uop_uopc(alu_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(alu_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(alu_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(alu_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(alu_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(alu_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(alu_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(alu_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(alu_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(alu_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(alu_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(alu_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(alu_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(alu_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(alu_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(alu_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(alu_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_ctrl_op3_sel(alu_io_resp_bits_uop_ctrl_op3_sel),
    .io_resp_bits_uop_iw_state(alu_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(alu_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(alu_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(alu_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(alu_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(alu_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(alu_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(alu_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(alu_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(alu_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(alu_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(alu_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(alu_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(alu_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(alu_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(alu_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(alu_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(alu_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(alu_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(alu_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(alu_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(alu_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(alu_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(alu_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(alu_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(alu_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(alu_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(alu_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(alu_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(alu_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(alu_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(alu_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(alu_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(alu_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(alu_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(alu_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(alu_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(alu_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(alu_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(alu_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(alu_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(alu_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(alu_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(alu_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(alu_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(alu_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(alu_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(alu_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(alu_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(alu_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(alu_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(alu_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(alu_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(alu_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(alu_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(alu_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(alu_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(alu_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(alu_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(alu_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(alu_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(alu_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_predicated(alu_io_resp_bits_predicated),
    .io_resp_bits_data(alu_io_resp_bits_data),
    .io_resp_bits_fflags_valid(alu_io_resp_bits_fflags_valid),
    .io_resp_bits_fflags_bits_uop_switch(alu_io_resp_bits_fflags_bits_uop_switch),
    .io_resp_bits_fflags_bits_uop_switch_off(alu_io_resp_bits_fflags_bits_uop_switch_off),
    .io_resp_bits_fflags_bits_uop_is_unicore(alu_io_resp_bits_fflags_bits_uop_is_unicore),
    .io_resp_bits_fflags_bits_uop_shift(alu_io_resp_bits_fflags_bits_uop_shift),
    .io_resp_bits_fflags_bits_uop_lrs3_rtype(alu_io_resp_bits_fflags_bits_uop_lrs3_rtype),
    .io_resp_bits_fflags_bits_uop_rflag(alu_io_resp_bits_fflags_bits_uop_rflag),
    .io_resp_bits_fflags_bits_uop_wflag(alu_io_resp_bits_fflags_bits_uop_wflag),
    .io_resp_bits_fflags_bits_uop_prflag(alu_io_resp_bits_fflags_bits_uop_prflag),
    .io_resp_bits_fflags_bits_uop_pwflag(alu_io_resp_bits_fflags_bits_uop_pwflag),
    .io_resp_bits_fflags_bits_uop_pflag_busy(alu_io_resp_bits_fflags_bits_uop_pflag_busy),
    .io_resp_bits_fflags_bits_uop_stale_pflag(alu_io_resp_bits_fflags_bits_uop_stale_pflag),
    .io_resp_bits_fflags_bits_uop_op1_sel(alu_io_resp_bits_fflags_bits_uop_op1_sel),
    .io_resp_bits_fflags_bits_uop_op2_sel(alu_io_resp_bits_fflags_bits_uop_op2_sel),
    .io_resp_bits_fflags_bits_uop_split_num(alu_io_resp_bits_fflags_bits_uop_split_num),
    .io_resp_bits_fflags_bits_uop_self_index(alu_io_resp_bits_fflags_bits_uop_self_index),
    .io_resp_bits_fflags_bits_uop_rob_inst_idx(alu_io_resp_bits_fflags_bits_uop_rob_inst_idx),
    .io_resp_bits_fflags_bits_uop_address_num(alu_io_resp_bits_fflags_bits_uop_address_num),
    .io_resp_bits_fflags_bits_uop_uopc(alu_io_resp_bits_fflags_bits_uop_uopc),
    .io_resp_bits_fflags_bits_uop_inst(alu_io_resp_bits_fflags_bits_uop_inst),
    .io_resp_bits_fflags_bits_uop_debug_inst(alu_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_resp_bits_fflags_bits_uop_is_rvc(alu_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_resp_bits_fflags_bits_uop_debug_pc(alu_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_resp_bits_fflags_bits_uop_iq_type(alu_io_resp_bits_fflags_bits_uop_iq_type),
    .io_resp_bits_fflags_bits_uop_fu_code(alu_io_resp_bits_fflags_bits_uop_fu_code),
    .io_resp_bits_fflags_bits_uop_ctrl_br_type(alu_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_resp_bits_fflags_bits_uop_ctrl_op1_sel(alu_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op2_sel(alu_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_imm_sel(alu_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op_fcn(alu_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflags_bits_uop_ctrl_fcn_dw(alu_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflags_bits_uop_ctrl_csr_cmd(alu_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflags_bits_uop_ctrl_is_load(alu_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_resp_bits_fflags_bits_uop_ctrl_is_sta(alu_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflags_bits_uop_ctrl_is_std(alu_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_resp_bits_fflags_bits_uop_ctrl_op3_sel(alu_io_resp_bits_fflags_bits_uop_ctrl_op3_sel),
    .io_resp_bits_fflags_bits_uop_iw_state(alu_io_resp_bits_fflags_bits_uop_iw_state),
    .io_resp_bits_fflags_bits_uop_iw_p1_poisoned(alu_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflags_bits_uop_iw_p2_poisoned(alu_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflags_bits_uop_is_br(alu_io_resp_bits_fflags_bits_uop_is_br),
    .io_resp_bits_fflags_bits_uop_is_jalr(alu_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_resp_bits_fflags_bits_uop_is_jal(alu_io_resp_bits_fflags_bits_uop_is_jal),
    .io_resp_bits_fflags_bits_uop_is_sfb(alu_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_resp_bits_fflags_bits_uop_br_mask(alu_io_resp_bits_fflags_bits_uop_br_mask),
    .io_resp_bits_fflags_bits_uop_br_tag(alu_io_resp_bits_fflags_bits_uop_br_tag),
    .io_resp_bits_fflags_bits_uop_ftq_idx(alu_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_resp_bits_fflags_bits_uop_edge_inst(alu_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_resp_bits_fflags_bits_uop_pc_lob(alu_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_resp_bits_fflags_bits_uop_taken(alu_io_resp_bits_fflags_bits_uop_taken),
    .io_resp_bits_fflags_bits_uop_imm_packed(alu_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_resp_bits_fflags_bits_uop_csr_addr(alu_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_resp_bits_fflags_bits_uop_rob_idx(alu_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_resp_bits_fflags_bits_uop_ldq_idx(alu_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_resp_bits_fflags_bits_uop_stq_idx(alu_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_resp_bits_fflags_bits_uop_rxq_idx(alu_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_resp_bits_fflags_bits_uop_pdst(alu_io_resp_bits_fflags_bits_uop_pdst),
    .io_resp_bits_fflags_bits_uop_prs1(alu_io_resp_bits_fflags_bits_uop_prs1),
    .io_resp_bits_fflags_bits_uop_prs2(alu_io_resp_bits_fflags_bits_uop_prs2),
    .io_resp_bits_fflags_bits_uop_prs3(alu_io_resp_bits_fflags_bits_uop_prs3),
    .io_resp_bits_fflags_bits_uop_ppred(alu_io_resp_bits_fflags_bits_uop_ppred),
    .io_resp_bits_fflags_bits_uop_prs1_busy(alu_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_resp_bits_fflags_bits_uop_prs2_busy(alu_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_resp_bits_fflags_bits_uop_prs3_busy(alu_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_resp_bits_fflags_bits_uop_ppred_busy(alu_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_resp_bits_fflags_bits_uop_stale_pdst(alu_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_resp_bits_fflags_bits_uop_exception(alu_io_resp_bits_fflags_bits_uop_exception),
    .io_resp_bits_fflags_bits_uop_exc_cause(alu_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_resp_bits_fflags_bits_uop_bypassable(alu_io_resp_bits_fflags_bits_uop_bypassable),
    .io_resp_bits_fflags_bits_uop_mem_cmd(alu_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_resp_bits_fflags_bits_uop_mem_size(alu_io_resp_bits_fflags_bits_uop_mem_size),
    .io_resp_bits_fflags_bits_uop_mem_signed(alu_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_resp_bits_fflags_bits_uop_is_fence(alu_io_resp_bits_fflags_bits_uop_is_fence),
    .io_resp_bits_fflags_bits_uop_is_fencei(alu_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_resp_bits_fflags_bits_uop_is_amo(alu_io_resp_bits_fflags_bits_uop_is_amo),
    .io_resp_bits_fflags_bits_uop_uses_ldq(alu_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_resp_bits_fflags_bits_uop_uses_stq(alu_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_resp_bits_fflags_bits_uop_is_sys_pc2epc(alu_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflags_bits_uop_is_unique(alu_io_resp_bits_fflags_bits_uop_is_unique),
    .io_resp_bits_fflags_bits_uop_flush_on_commit(alu_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_resp_bits_fflags_bits_uop_ldst_is_rs1(alu_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflags_bits_uop_ldst(alu_io_resp_bits_fflags_bits_uop_ldst),
    .io_resp_bits_fflags_bits_uop_lrs1(alu_io_resp_bits_fflags_bits_uop_lrs1),
    .io_resp_bits_fflags_bits_uop_lrs2(alu_io_resp_bits_fflags_bits_uop_lrs2),
    .io_resp_bits_fflags_bits_uop_lrs3(alu_io_resp_bits_fflags_bits_uop_lrs3),
    .io_resp_bits_fflags_bits_uop_ldst_val(alu_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_resp_bits_fflags_bits_uop_dst_rtype(alu_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_resp_bits_fflags_bits_uop_lrs1_rtype(alu_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_resp_bits_fflags_bits_uop_lrs2_rtype(alu_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_resp_bits_fflags_bits_uop_frs3_en(alu_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_resp_bits_fflags_bits_uop_fp_val(alu_io_resp_bits_fflags_bits_uop_fp_val),
    .io_resp_bits_fflags_bits_uop_fp_single(alu_io_resp_bits_fflags_bits_uop_fp_single),
    .io_resp_bits_fflags_bits_uop_xcpt_pf_if(alu_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ae_if(alu_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ma_if(alu_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflags_bits_uop_bp_debug_if(alu_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_resp_bits_fflags_bits_uop_bp_xcpt_if(alu_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflags_bits_uop_debug_fsrc(alu_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_resp_bits_fflags_bits_uop_debug_tsrc(alu_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_resp_bits_fflags_bits_flags(alu_io_resp_bits_fflags_bits_flags),
    .io_resp_bits_addr(alu_io_resp_bits_addr),
    .io_resp_bits_mxcpt_valid(alu_io_resp_bits_mxcpt_valid),
    .io_resp_bits_mxcpt_bits(alu_io_resp_bits_mxcpt_bits),
    .io_resp_bits_sfence_valid(alu_io_resp_bits_sfence_valid),
    .io_resp_bits_sfence_bits_rs1(alu_io_resp_bits_sfence_bits_rs1),
    .io_resp_bits_sfence_bits_rs2(alu_io_resp_bits_sfence_bits_rs2),
    .io_resp_bits_sfence_bits_addr(alu_io_resp_bits_sfence_bits_addr),
    .io_resp_bits_sfence_bits_asid(alu_io_resp_bits_sfence_bits_asid),
    .io_resp_bits_flagdata(alu_io_resp_bits_flagdata),
    .io_resp_bits_fflagdata_valid(alu_io_resp_bits_fflagdata_valid),
    .io_resp_bits_fflagdata_bits_uop_switch(alu_io_resp_bits_fflagdata_bits_uop_switch),
    .io_resp_bits_fflagdata_bits_uop_switch_off(alu_io_resp_bits_fflagdata_bits_uop_switch_off),
    .io_resp_bits_fflagdata_bits_uop_is_unicore(alu_io_resp_bits_fflagdata_bits_uop_is_unicore),
    .io_resp_bits_fflagdata_bits_uop_shift(alu_io_resp_bits_fflagdata_bits_uop_shift),
    .io_resp_bits_fflagdata_bits_uop_lrs3_rtype(alu_io_resp_bits_fflagdata_bits_uop_lrs3_rtype),
    .io_resp_bits_fflagdata_bits_uop_rflag(alu_io_resp_bits_fflagdata_bits_uop_rflag),
    .io_resp_bits_fflagdata_bits_uop_wflag(alu_io_resp_bits_fflagdata_bits_uop_wflag),
    .io_resp_bits_fflagdata_bits_uop_prflag(alu_io_resp_bits_fflagdata_bits_uop_prflag),
    .io_resp_bits_fflagdata_bits_uop_pwflag(alu_io_resp_bits_fflagdata_bits_uop_pwflag),
    .io_resp_bits_fflagdata_bits_uop_pflag_busy(alu_io_resp_bits_fflagdata_bits_uop_pflag_busy),
    .io_resp_bits_fflagdata_bits_uop_stale_pflag(alu_io_resp_bits_fflagdata_bits_uop_stale_pflag),
    .io_resp_bits_fflagdata_bits_uop_op1_sel(alu_io_resp_bits_fflagdata_bits_uop_op1_sel),
    .io_resp_bits_fflagdata_bits_uop_op2_sel(alu_io_resp_bits_fflagdata_bits_uop_op2_sel),
    .io_resp_bits_fflagdata_bits_uop_split_num(alu_io_resp_bits_fflagdata_bits_uop_split_num),
    .io_resp_bits_fflagdata_bits_uop_self_index(alu_io_resp_bits_fflagdata_bits_uop_self_index),
    .io_resp_bits_fflagdata_bits_uop_rob_inst_idx(alu_io_resp_bits_fflagdata_bits_uop_rob_inst_idx),
    .io_resp_bits_fflagdata_bits_uop_address_num(alu_io_resp_bits_fflagdata_bits_uop_address_num),
    .io_resp_bits_fflagdata_bits_uop_uopc(alu_io_resp_bits_fflagdata_bits_uop_uopc),
    .io_resp_bits_fflagdata_bits_uop_inst(alu_io_resp_bits_fflagdata_bits_uop_inst),
    .io_resp_bits_fflagdata_bits_uop_debug_inst(alu_io_resp_bits_fflagdata_bits_uop_debug_inst),
    .io_resp_bits_fflagdata_bits_uop_is_rvc(alu_io_resp_bits_fflagdata_bits_uop_is_rvc),
    .io_resp_bits_fflagdata_bits_uop_debug_pc(alu_io_resp_bits_fflagdata_bits_uop_debug_pc),
    .io_resp_bits_fflagdata_bits_uop_iq_type(alu_io_resp_bits_fflagdata_bits_uop_iq_type),
    .io_resp_bits_fflagdata_bits_uop_fu_code(alu_io_resp_bits_fflagdata_bits_uop_fu_code),
    .io_resp_bits_fflagdata_bits_uop_ctrl_br_type(alu_io_resp_bits_fflagdata_bits_uop_ctrl_br_type),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel(alu_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel(alu_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel(alu_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn(alu_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw(alu_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd(alu_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_load(alu_io_resp_bits_fflagdata_bits_uop_ctrl_is_load),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_sta(alu_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_std(alu_io_resp_bits_fflagdata_bits_uop_ctrl_is_std),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel(alu_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel),
    .io_resp_bits_fflagdata_bits_uop_iw_state(alu_io_resp_bits_fflagdata_bits_uop_iw_state),
    .io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned(alu_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned(alu_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflagdata_bits_uop_is_br(alu_io_resp_bits_fflagdata_bits_uop_is_br),
    .io_resp_bits_fflagdata_bits_uop_is_jalr(alu_io_resp_bits_fflagdata_bits_uop_is_jalr),
    .io_resp_bits_fflagdata_bits_uop_is_jal(alu_io_resp_bits_fflagdata_bits_uop_is_jal),
    .io_resp_bits_fflagdata_bits_uop_is_sfb(alu_io_resp_bits_fflagdata_bits_uop_is_sfb),
    .io_resp_bits_fflagdata_bits_uop_br_mask(alu_io_resp_bits_fflagdata_bits_uop_br_mask),
    .io_resp_bits_fflagdata_bits_uop_br_tag(alu_io_resp_bits_fflagdata_bits_uop_br_tag),
    .io_resp_bits_fflagdata_bits_uop_ftq_idx(alu_io_resp_bits_fflagdata_bits_uop_ftq_idx),
    .io_resp_bits_fflagdata_bits_uop_edge_inst(alu_io_resp_bits_fflagdata_bits_uop_edge_inst),
    .io_resp_bits_fflagdata_bits_uop_pc_lob(alu_io_resp_bits_fflagdata_bits_uop_pc_lob),
    .io_resp_bits_fflagdata_bits_uop_taken(alu_io_resp_bits_fflagdata_bits_uop_taken),
    .io_resp_bits_fflagdata_bits_uop_imm_packed(alu_io_resp_bits_fflagdata_bits_uop_imm_packed),
    .io_resp_bits_fflagdata_bits_uop_csr_addr(alu_io_resp_bits_fflagdata_bits_uop_csr_addr),
    .io_resp_bits_fflagdata_bits_uop_rob_idx(alu_io_resp_bits_fflagdata_bits_uop_rob_idx),
    .io_resp_bits_fflagdata_bits_uop_ldq_idx(alu_io_resp_bits_fflagdata_bits_uop_ldq_idx),
    .io_resp_bits_fflagdata_bits_uop_stq_idx(alu_io_resp_bits_fflagdata_bits_uop_stq_idx),
    .io_resp_bits_fflagdata_bits_uop_rxq_idx(alu_io_resp_bits_fflagdata_bits_uop_rxq_idx),
    .io_resp_bits_fflagdata_bits_uop_pdst(alu_io_resp_bits_fflagdata_bits_uop_pdst),
    .io_resp_bits_fflagdata_bits_uop_prs1(alu_io_resp_bits_fflagdata_bits_uop_prs1),
    .io_resp_bits_fflagdata_bits_uop_prs2(alu_io_resp_bits_fflagdata_bits_uop_prs2),
    .io_resp_bits_fflagdata_bits_uop_prs3(alu_io_resp_bits_fflagdata_bits_uop_prs3),
    .io_resp_bits_fflagdata_bits_uop_ppred(alu_io_resp_bits_fflagdata_bits_uop_ppred),
    .io_resp_bits_fflagdata_bits_uop_prs1_busy(alu_io_resp_bits_fflagdata_bits_uop_prs1_busy),
    .io_resp_bits_fflagdata_bits_uop_prs2_busy(alu_io_resp_bits_fflagdata_bits_uop_prs2_busy),
    .io_resp_bits_fflagdata_bits_uop_prs3_busy(alu_io_resp_bits_fflagdata_bits_uop_prs3_busy),
    .io_resp_bits_fflagdata_bits_uop_ppred_busy(alu_io_resp_bits_fflagdata_bits_uop_ppred_busy),
    .io_resp_bits_fflagdata_bits_uop_stale_pdst(alu_io_resp_bits_fflagdata_bits_uop_stale_pdst),
    .io_resp_bits_fflagdata_bits_uop_exception(alu_io_resp_bits_fflagdata_bits_uop_exception),
    .io_resp_bits_fflagdata_bits_uop_exc_cause(alu_io_resp_bits_fflagdata_bits_uop_exc_cause),
    .io_resp_bits_fflagdata_bits_uop_bypassable(alu_io_resp_bits_fflagdata_bits_uop_bypassable),
    .io_resp_bits_fflagdata_bits_uop_mem_cmd(alu_io_resp_bits_fflagdata_bits_uop_mem_cmd),
    .io_resp_bits_fflagdata_bits_uop_mem_size(alu_io_resp_bits_fflagdata_bits_uop_mem_size),
    .io_resp_bits_fflagdata_bits_uop_mem_signed(alu_io_resp_bits_fflagdata_bits_uop_mem_signed),
    .io_resp_bits_fflagdata_bits_uop_is_fence(alu_io_resp_bits_fflagdata_bits_uop_is_fence),
    .io_resp_bits_fflagdata_bits_uop_is_fencei(alu_io_resp_bits_fflagdata_bits_uop_is_fencei),
    .io_resp_bits_fflagdata_bits_uop_is_amo(alu_io_resp_bits_fflagdata_bits_uop_is_amo),
    .io_resp_bits_fflagdata_bits_uop_uses_ldq(alu_io_resp_bits_fflagdata_bits_uop_uses_ldq),
    .io_resp_bits_fflagdata_bits_uop_uses_stq(alu_io_resp_bits_fflagdata_bits_uop_uses_stq),
    .io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc(alu_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflagdata_bits_uop_is_unique(alu_io_resp_bits_fflagdata_bits_uop_is_unique),
    .io_resp_bits_fflagdata_bits_uop_flush_on_commit(alu_io_resp_bits_fflagdata_bits_uop_flush_on_commit),
    .io_resp_bits_fflagdata_bits_uop_ldst_is_rs1(alu_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflagdata_bits_uop_ldst(alu_io_resp_bits_fflagdata_bits_uop_ldst),
    .io_resp_bits_fflagdata_bits_uop_lrs1(alu_io_resp_bits_fflagdata_bits_uop_lrs1),
    .io_resp_bits_fflagdata_bits_uop_lrs2(alu_io_resp_bits_fflagdata_bits_uop_lrs2),
    .io_resp_bits_fflagdata_bits_uop_lrs3(alu_io_resp_bits_fflagdata_bits_uop_lrs3),
    .io_resp_bits_fflagdata_bits_uop_ldst_val(alu_io_resp_bits_fflagdata_bits_uop_ldst_val),
    .io_resp_bits_fflagdata_bits_uop_dst_rtype(alu_io_resp_bits_fflagdata_bits_uop_dst_rtype),
    .io_resp_bits_fflagdata_bits_uop_lrs1_rtype(alu_io_resp_bits_fflagdata_bits_uop_lrs1_rtype),
    .io_resp_bits_fflagdata_bits_uop_lrs2_rtype(alu_io_resp_bits_fflagdata_bits_uop_lrs2_rtype),
    .io_resp_bits_fflagdata_bits_uop_frs3_en(alu_io_resp_bits_fflagdata_bits_uop_frs3_en),
    .io_resp_bits_fflagdata_bits_uop_fp_val(alu_io_resp_bits_fflagdata_bits_uop_fp_val),
    .io_resp_bits_fflagdata_bits_uop_fp_single(alu_io_resp_bits_fflagdata_bits_uop_fp_single),
    .io_resp_bits_fflagdata_bits_uop_xcpt_pf_if(alu_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflagdata_bits_uop_xcpt_ae_if(alu_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflagdata_bits_uop_xcpt_ma_if(alu_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflagdata_bits_uop_bp_debug_if(alu_io_resp_bits_fflagdata_bits_uop_bp_debug_if),
    .io_resp_bits_fflagdata_bits_uop_bp_xcpt_if(alu_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflagdata_bits_uop_debug_fsrc(alu_io_resp_bits_fflagdata_bits_uop_debug_fsrc),
    .io_resp_bits_fflagdata_bits_uop_debug_tsrc(alu_io_resp_bits_fflagdata_bits_uop_debug_tsrc),
    .io_resp_bits_fflagdata_bits_fflag(alu_io_resp_bits_fflagdata_bits_fflag),
    .io_brupdate_b1_resolve_mask(alu_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(alu_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_switch(alu_io_brupdate_b2_uop_switch),
    .io_brupdate_b2_uop_switch_off(alu_io_brupdate_b2_uop_switch_off),
    .io_brupdate_b2_uop_is_unicore(alu_io_brupdate_b2_uop_is_unicore),
    .io_brupdate_b2_uop_shift(alu_io_brupdate_b2_uop_shift),
    .io_brupdate_b2_uop_lrs3_rtype(alu_io_brupdate_b2_uop_lrs3_rtype),
    .io_brupdate_b2_uop_rflag(alu_io_brupdate_b2_uop_rflag),
    .io_brupdate_b2_uop_wflag(alu_io_brupdate_b2_uop_wflag),
    .io_brupdate_b2_uop_prflag(alu_io_brupdate_b2_uop_prflag),
    .io_brupdate_b2_uop_pwflag(alu_io_brupdate_b2_uop_pwflag),
    .io_brupdate_b2_uop_pflag_busy(alu_io_brupdate_b2_uop_pflag_busy),
    .io_brupdate_b2_uop_stale_pflag(alu_io_brupdate_b2_uop_stale_pflag),
    .io_brupdate_b2_uop_op1_sel(alu_io_brupdate_b2_uop_op1_sel),
    .io_brupdate_b2_uop_op2_sel(alu_io_brupdate_b2_uop_op2_sel),
    .io_brupdate_b2_uop_split_num(alu_io_brupdate_b2_uop_split_num),
    .io_brupdate_b2_uop_self_index(alu_io_brupdate_b2_uop_self_index),
    .io_brupdate_b2_uop_rob_inst_idx(alu_io_brupdate_b2_uop_rob_inst_idx),
    .io_brupdate_b2_uop_address_num(alu_io_brupdate_b2_uop_address_num),
    .io_brupdate_b2_uop_uopc(alu_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(alu_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(alu_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(alu_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(alu_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(alu_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(alu_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(alu_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(alu_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(alu_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(alu_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(alu_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(alu_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(alu_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(alu_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(alu_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(alu_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_ctrl_op3_sel(alu_io_brupdate_b2_uop_ctrl_op3_sel),
    .io_brupdate_b2_uop_iw_state(alu_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(alu_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(alu_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(alu_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(alu_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(alu_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(alu_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(alu_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(alu_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(alu_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(alu_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(alu_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(alu_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(alu_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(alu_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(alu_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(alu_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(alu_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(alu_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(alu_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(alu_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(alu_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(alu_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(alu_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(alu_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(alu_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(alu_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(alu_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(alu_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(alu_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(alu_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(alu_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(alu_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(alu_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(alu_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(alu_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(alu_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(alu_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(alu_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(alu_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(alu_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(alu_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(alu_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(alu_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(alu_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(alu_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(alu_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(alu_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(alu_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(alu_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(alu_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(alu_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(alu_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(alu_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(alu_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(alu_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(alu_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(alu_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(alu_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(alu_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(alu_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(alu_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(alu_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(alu_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(alu_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(alu_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(alu_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(alu_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(alu_io_brupdate_b2_target_offset),
    .io_bypass_0_valid(alu_io_bypass_0_valid),
    .io_bypass_0_bits_uop_switch(alu_io_bypass_0_bits_uop_switch),
    .io_bypass_0_bits_uop_switch_off(alu_io_bypass_0_bits_uop_switch_off),
    .io_bypass_0_bits_uop_is_unicore(alu_io_bypass_0_bits_uop_is_unicore),
    .io_bypass_0_bits_uop_shift(alu_io_bypass_0_bits_uop_shift),
    .io_bypass_0_bits_uop_lrs3_rtype(alu_io_bypass_0_bits_uop_lrs3_rtype),
    .io_bypass_0_bits_uop_rflag(alu_io_bypass_0_bits_uop_rflag),
    .io_bypass_0_bits_uop_wflag(alu_io_bypass_0_bits_uop_wflag),
    .io_bypass_0_bits_uop_prflag(alu_io_bypass_0_bits_uop_prflag),
    .io_bypass_0_bits_uop_pwflag(alu_io_bypass_0_bits_uop_pwflag),
    .io_bypass_0_bits_uop_pflag_busy(alu_io_bypass_0_bits_uop_pflag_busy),
    .io_bypass_0_bits_uop_stale_pflag(alu_io_bypass_0_bits_uop_stale_pflag),
    .io_bypass_0_bits_uop_op1_sel(alu_io_bypass_0_bits_uop_op1_sel),
    .io_bypass_0_bits_uop_op2_sel(alu_io_bypass_0_bits_uop_op2_sel),
    .io_bypass_0_bits_uop_split_num(alu_io_bypass_0_bits_uop_split_num),
    .io_bypass_0_bits_uop_self_index(alu_io_bypass_0_bits_uop_self_index),
    .io_bypass_0_bits_uop_rob_inst_idx(alu_io_bypass_0_bits_uop_rob_inst_idx),
    .io_bypass_0_bits_uop_address_num(alu_io_bypass_0_bits_uop_address_num),
    .io_bypass_0_bits_uop_uopc(alu_io_bypass_0_bits_uop_uopc),
    .io_bypass_0_bits_uop_inst(alu_io_bypass_0_bits_uop_inst),
    .io_bypass_0_bits_uop_debug_inst(alu_io_bypass_0_bits_uop_debug_inst),
    .io_bypass_0_bits_uop_is_rvc(alu_io_bypass_0_bits_uop_is_rvc),
    .io_bypass_0_bits_uop_debug_pc(alu_io_bypass_0_bits_uop_debug_pc),
    .io_bypass_0_bits_uop_iq_type(alu_io_bypass_0_bits_uop_iq_type),
    .io_bypass_0_bits_uop_fu_code(alu_io_bypass_0_bits_uop_fu_code),
    .io_bypass_0_bits_uop_ctrl_br_type(alu_io_bypass_0_bits_uop_ctrl_br_type),
    .io_bypass_0_bits_uop_ctrl_op1_sel(alu_io_bypass_0_bits_uop_ctrl_op1_sel),
    .io_bypass_0_bits_uop_ctrl_op2_sel(alu_io_bypass_0_bits_uop_ctrl_op2_sel),
    .io_bypass_0_bits_uop_ctrl_imm_sel(alu_io_bypass_0_bits_uop_ctrl_imm_sel),
    .io_bypass_0_bits_uop_ctrl_op_fcn(alu_io_bypass_0_bits_uop_ctrl_op_fcn),
    .io_bypass_0_bits_uop_ctrl_fcn_dw(alu_io_bypass_0_bits_uop_ctrl_fcn_dw),
    .io_bypass_0_bits_uop_ctrl_csr_cmd(alu_io_bypass_0_bits_uop_ctrl_csr_cmd),
    .io_bypass_0_bits_uop_ctrl_is_load(alu_io_bypass_0_bits_uop_ctrl_is_load),
    .io_bypass_0_bits_uop_ctrl_is_sta(alu_io_bypass_0_bits_uop_ctrl_is_sta),
    .io_bypass_0_bits_uop_ctrl_is_std(alu_io_bypass_0_bits_uop_ctrl_is_std),
    .io_bypass_0_bits_uop_ctrl_op3_sel(alu_io_bypass_0_bits_uop_ctrl_op3_sel),
    .io_bypass_0_bits_uop_iw_state(alu_io_bypass_0_bits_uop_iw_state),
    .io_bypass_0_bits_uop_iw_p1_poisoned(alu_io_bypass_0_bits_uop_iw_p1_poisoned),
    .io_bypass_0_bits_uop_iw_p2_poisoned(alu_io_bypass_0_bits_uop_iw_p2_poisoned),
    .io_bypass_0_bits_uop_is_br(alu_io_bypass_0_bits_uop_is_br),
    .io_bypass_0_bits_uop_is_jalr(alu_io_bypass_0_bits_uop_is_jalr),
    .io_bypass_0_bits_uop_is_jal(alu_io_bypass_0_bits_uop_is_jal),
    .io_bypass_0_bits_uop_is_sfb(alu_io_bypass_0_bits_uop_is_sfb),
    .io_bypass_0_bits_uop_br_mask(alu_io_bypass_0_bits_uop_br_mask),
    .io_bypass_0_bits_uop_br_tag(alu_io_bypass_0_bits_uop_br_tag),
    .io_bypass_0_bits_uop_ftq_idx(alu_io_bypass_0_bits_uop_ftq_idx),
    .io_bypass_0_bits_uop_edge_inst(alu_io_bypass_0_bits_uop_edge_inst),
    .io_bypass_0_bits_uop_pc_lob(alu_io_bypass_0_bits_uop_pc_lob),
    .io_bypass_0_bits_uop_taken(alu_io_bypass_0_bits_uop_taken),
    .io_bypass_0_bits_uop_imm_packed(alu_io_bypass_0_bits_uop_imm_packed),
    .io_bypass_0_bits_uop_csr_addr(alu_io_bypass_0_bits_uop_csr_addr),
    .io_bypass_0_bits_uop_rob_idx(alu_io_bypass_0_bits_uop_rob_idx),
    .io_bypass_0_bits_uop_ldq_idx(alu_io_bypass_0_bits_uop_ldq_idx),
    .io_bypass_0_bits_uop_stq_idx(alu_io_bypass_0_bits_uop_stq_idx),
    .io_bypass_0_bits_uop_rxq_idx(alu_io_bypass_0_bits_uop_rxq_idx),
    .io_bypass_0_bits_uop_pdst(alu_io_bypass_0_bits_uop_pdst),
    .io_bypass_0_bits_uop_prs1(alu_io_bypass_0_bits_uop_prs1),
    .io_bypass_0_bits_uop_prs2(alu_io_bypass_0_bits_uop_prs2),
    .io_bypass_0_bits_uop_prs3(alu_io_bypass_0_bits_uop_prs3),
    .io_bypass_0_bits_uop_ppred(alu_io_bypass_0_bits_uop_ppred),
    .io_bypass_0_bits_uop_prs1_busy(alu_io_bypass_0_bits_uop_prs1_busy),
    .io_bypass_0_bits_uop_prs2_busy(alu_io_bypass_0_bits_uop_prs2_busy),
    .io_bypass_0_bits_uop_prs3_busy(alu_io_bypass_0_bits_uop_prs3_busy),
    .io_bypass_0_bits_uop_ppred_busy(alu_io_bypass_0_bits_uop_ppred_busy),
    .io_bypass_0_bits_uop_stale_pdst(alu_io_bypass_0_bits_uop_stale_pdst),
    .io_bypass_0_bits_uop_exception(alu_io_bypass_0_bits_uop_exception),
    .io_bypass_0_bits_uop_exc_cause(alu_io_bypass_0_bits_uop_exc_cause),
    .io_bypass_0_bits_uop_bypassable(alu_io_bypass_0_bits_uop_bypassable),
    .io_bypass_0_bits_uop_mem_cmd(alu_io_bypass_0_bits_uop_mem_cmd),
    .io_bypass_0_bits_uop_mem_size(alu_io_bypass_0_bits_uop_mem_size),
    .io_bypass_0_bits_uop_mem_signed(alu_io_bypass_0_bits_uop_mem_signed),
    .io_bypass_0_bits_uop_is_fence(alu_io_bypass_0_bits_uop_is_fence),
    .io_bypass_0_bits_uop_is_fencei(alu_io_bypass_0_bits_uop_is_fencei),
    .io_bypass_0_bits_uop_is_amo(alu_io_bypass_0_bits_uop_is_amo),
    .io_bypass_0_bits_uop_uses_ldq(alu_io_bypass_0_bits_uop_uses_ldq),
    .io_bypass_0_bits_uop_uses_stq(alu_io_bypass_0_bits_uop_uses_stq),
    .io_bypass_0_bits_uop_is_sys_pc2epc(alu_io_bypass_0_bits_uop_is_sys_pc2epc),
    .io_bypass_0_bits_uop_is_unique(alu_io_bypass_0_bits_uop_is_unique),
    .io_bypass_0_bits_uop_flush_on_commit(alu_io_bypass_0_bits_uop_flush_on_commit),
    .io_bypass_0_bits_uop_ldst_is_rs1(alu_io_bypass_0_bits_uop_ldst_is_rs1),
    .io_bypass_0_bits_uop_ldst(alu_io_bypass_0_bits_uop_ldst),
    .io_bypass_0_bits_uop_lrs1(alu_io_bypass_0_bits_uop_lrs1),
    .io_bypass_0_bits_uop_lrs2(alu_io_bypass_0_bits_uop_lrs2),
    .io_bypass_0_bits_uop_lrs3(alu_io_bypass_0_bits_uop_lrs3),
    .io_bypass_0_bits_uop_ldst_val(alu_io_bypass_0_bits_uop_ldst_val),
    .io_bypass_0_bits_uop_dst_rtype(alu_io_bypass_0_bits_uop_dst_rtype),
    .io_bypass_0_bits_uop_lrs1_rtype(alu_io_bypass_0_bits_uop_lrs1_rtype),
    .io_bypass_0_bits_uop_lrs2_rtype(alu_io_bypass_0_bits_uop_lrs2_rtype),
    .io_bypass_0_bits_uop_frs3_en(alu_io_bypass_0_bits_uop_frs3_en),
    .io_bypass_0_bits_uop_fp_val(alu_io_bypass_0_bits_uop_fp_val),
    .io_bypass_0_bits_uop_fp_single(alu_io_bypass_0_bits_uop_fp_single),
    .io_bypass_0_bits_uop_xcpt_pf_if(alu_io_bypass_0_bits_uop_xcpt_pf_if),
    .io_bypass_0_bits_uop_xcpt_ae_if(alu_io_bypass_0_bits_uop_xcpt_ae_if),
    .io_bypass_0_bits_uop_xcpt_ma_if(alu_io_bypass_0_bits_uop_xcpt_ma_if),
    .io_bypass_0_bits_uop_bp_debug_if(alu_io_bypass_0_bits_uop_bp_debug_if),
    .io_bypass_0_bits_uop_bp_xcpt_if(alu_io_bypass_0_bits_uop_bp_xcpt_if),
    .io_bypass_0_bits_uop_debug_fsrc(alu_io_bypass_0_bits_uop_debug_fsrc),
    .io_bypass_0_bits_uop_debug_tsrc(alu_io_bypass_0_bits_uop_debug_tsrc),
    .io_bypass_0_bits_data(alu_io_bypass_0_bits_data),
    .io_bypass_0_bits_predicated(alu_io_bypass_0_bits_predicated),
    .io_bypass_0_bits_fflags_valid(alu_io_bypass_0_bits_fflags_valid),
    .io_bypass_0_bits_fflags_bits_uop_switch(alu_io_bypass_0_bits_fflags_bits_uop_switch),
    .io_bypass_0_bits_fflags_bits_uop_switch_off(alu_io_bypass_0_bits_fflags_bits_uop_switch_off),
    .io_bypass_0_bits_fflags_bits_uop_is_unicore(alu_io_bypass_0_bits_fflags_bits_uop_is_unicore),
    .io_bypass_0_bits_fflags_bits_uop_shift(alu_io_bypass_0_bits_fflags_bits_uop_shift),
    .io_bypass_0_bits_fflags_bits_uop_lrs3_rtype(alu_io_bypass_0_bits_fflags_bits_uop_lrs3_rtype),
    .io_bypass_0_bits_fflags_bits_uop_rflag(alu_io_bypass_0_bits_fflags_bits_uop_rflag),
    .io_bypass_0_bits_fflags_bits_uop_wflag(alu_io_bypass_0_bits_fflags_bits_uop_wflag),
    .io_bypass_0_bits_fflags_bits_uop_prflag(alu_io_bypass_0_bits_fflags_bits_uop_prflag),
    .io_bypass_0_bits_fflags_bits_uop_pwflag(alu_io_bypass_0_bits_fflags_bits_uop_pwflag),
    .io_bypass_0_bits_fflags_bits_uop_pflag_busy(alu_io_bypass_0_bits_fflags_bits_uop_pflag_busy),
    .io_bypass_0_bits_fflags_bits_uop_stale_pflag(alu_io_bypass_0_bits_fflags_bits_uop_stale_pflag),
    .io_bypass_0_bits_fflags_bits_uop_op1_sel(alu_io_bypass_0_bits_fflags_bits_uop_op1_sel),
    .io_bypass_0_bits_fflags_bits_uop_op2_sel(alu_io_bypass_0_bits_fflags_bits_uop_op2_sel),
    .io_bypass_0_bits_fflags_bits_uop_split_num(alu_io_bypass_0_bits_fflags_bits_uop_split_num),
    .io_bypass_0_bits_fflags_bits_uop_self_index(alu_io_bypass_0_bits_fflags_bits_uop_self_index),
    .io_bypass_0_bits_fflags_bits_uop_rob_inst_idx(alu_io_bypass_0_bits_fflags_bits_uop_rob_inst_idx),
    .io_bypass_0_bits_fflags_bits_uop_address_num(alu_io_bypass_0_bits_fflags_bits_uop_address_num),
    .io_bypass_0_bits_fflags_bits_uop_uopc(alu_io_bypass_0_bits_fflags_bits_uop_uopc),
    .io_bypass_0_bits_fflags_bits_uop_inst(alu_io_bypass_0_bits_fflags_bits_uop_inst),
    .io_bypass_0_bits_fflags_bits_uop_debug_inst(alu_io_bypass_0_bits_fflags_bits_uop_debug_inst),
    .io_bypass_0_bits_fflags_bits_uop_is_rvc(alu_io_bypass_0_bits_fflags_bits_uop_is_rvc),
    .io_bypass_0_bits_fflags_bits_uop_debug_pc(alu_io_bypass_0_bits_fflags_bits_uop_debug_pc),
    .io_bypass_0_bits_fflags_bits_uop_iq_type(alu_io_bypass_0_bits_fflags_bits_uop_iq_type),
    .io_bypass_0_bits_fflags_bits_uop_fu_code(alu_io_bypass_0_bits_fflags_bits_uop_fu_code),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_br_type(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_br_type),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_is_load(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_load),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_is_std(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_std),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_op3_sel(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op3_sel),
    .io_bypass_0_bits_fflags_bits_uop_iw_state(alu_io_bypass_0_bits_fflags_bits_uop_iw_state),
    .io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned(alu_io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned(alu_io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_bypass_0_bits_fflags_bits_uop_is_br(alu_io_bypass_0_bits_fflags_bits_uop_is_br),
    .io_bypass_0_bits_fflags_bits_uop_is_jalr(alu_io_bypass_0_bits_fflags_bits_uop_is_jalr),
    .io_bypass_0_bits_fflags_bits_uop_is_jal(alu_io_bypass_0_bits_fflags_bits_uop_is_jal),
    .io_bypass_0_bits_fflags_bits_uop_is_sfb(alu_io_bypass_0_bits_fflags_bits_uop_is_sfb),
    .io_bypass_0_bits_fflags_bits_uop_br_mask(alu_io_bypass_0_bits_fflags_bits_uop_br_mask),
    .io_bypass_0_bits_fflags_bits_uop_br_tag(alu_io_bypass_0_bits_fflags_bits_uop_br_tag),
    .io_bypass_0_bits_fflags_bits_uop_ftq_idx(alu_io_bypass_0_bits_fflags_bits_uop_ftq_idx),
    .io_bypass_0_bits_fflags_bits_uop_edge_inst(alu_io_bypass_0_bits_fflags_bits_uop_edge_inst),
    .io_bypass_0_bits_fflags_bits_uop_pc_lob(alu_io_bypass_0_bits_fflags_bits_uop_pc_lob),
    .io_bypass_0_bits_fflags_bits_uop_taken(alu_io_bypass_0_bits_fflags_bits_uop_taken),
    .io_bypass_0_bits_fflags_bits_uop_imm_packed(alu_io_bypass_0_bits_fflags_bits_uop_imm_packed),
    .io_bypass_0_bits_fflags_bits_uop_csr_addr(alu_io_bypass_0_bits_fflags_bits_uop_csr_addr),
    .io_bypass_0_bits_fflags_bits_uop_rob_idx(alu_io_bypass_0_bits_fflags_bits_uop_rob_idx),
    .io_bypass_0_bits_fflags_bits_uop_ldq_idx(alu_io_bypass_0_bits_fflags_bits_uop_ldq_idx),
    .io_bypass_0_bits_fflags_bits_uop_stq_idx(alu_io_bypass_0_bits_fflags_bits_uop_stq_idx),
    .io_bypass_0_bits_fflags_bits_uop_rxq_idx(alu_io_bypass_0_bits_fflags_bits_uop_rxq_idx),
    .io_bypass_0_bits_fflags_bits_uop_pdst(alu_io_bypass_0_bits_fflags_bits_uop_pdst),
    .io_bypass_0_bits_fflags_bits_uop_prs1(alu_io_bypass_0_bits_fflags_bits_uop_prs1),
    .io_bypass_0_bits_fflags_bits_uop_prs2(alu_io_bypass_0_bits_fflags_bits_uop_prs2),
    .io_bypass_0_bits_fflags_bits_uop_prs3(alu_io_bypass_0_bits_fflags_bits_uop_prs3),
    .io_bypass_0_bits_fflags_bits_uop_ppred(alu_io_bypass_0_bits_fflags_bits_uop_ppred),
    .io_bypass_0_bits_fflags_bits_uop_prs1_busy(alu_io_bypass_0_bits_fflags_bits_uop_prs1_busy),
    .io_bypass_0_bits_fflags_bits_uop_prs2_busy(alu_io_bypass_0_bits_fflags_bits_uop_prs2_busy),
    .io_bypass_0_bits_fflags_bits_uop_prs3_busy(alu_io_bypass_0_bits_fflags_bits_uop_prs3_busy),
    .io_bypass_0_bits_fflags_bits_uop_ppred_busy(alu_io_bypass_0_bits_fflags_bits_uop_ppred_busy),
    .io_bypass_0_bits_fflags_bits_uop_stale_pdst(alu_io_bypass_0_bits_fflags_bits_uop_stale_pdst),
    .io_bypass_0_bits_fflags_bits_uop_exception(alu_io_bypass_0_bits_fflags_bits_uop_exception),
    .io_bypass_0_bits_fflags_bits_uop_exc_cause(alu_io_bypass_0_bits_fflags_bits_uop_exc_cause),
    .io_bypass_0_bits_fflags_bits_uop_bypassable(alu_io_bypass_0_bits_fflags_bits_uop_bypassable),
    .io_bypass_0_bits_fflags_bits_uop_mem_cmd(alu_io_bypass_0_bits_fflags_bits_uop_mem_cmd),
    .io_bypass_0_bits_fflags_bits_uop_mem_size(alu_io_bypass_0_bits_fflags_bits_uop_mem_size),
    .io_bypass_0_bits_fflags_bits_uop_mem_signed(alu_io_bypass_0_bits_fflags_bits_uop_mem_signed),
    .io_bypass_0_bits_fflags_bits_uop_is_fence(alu_io_bypass_0_bits_fflags_bits_uop_is_fence),
    .io_bypass_0_bits_fflags_bits_uop_is_fencei(alu_io_bypass_0_bits_fflags_bits_uop_is_fencei),
    .io_bypass_0_bits_fflags_bits_uop_is_amo(alu_io_bypass_0_bits_fflags_bits_uop_is_amo),
    .io_bypass_0_bits_fflags_bits_uop_uses_ldq(alu_io_bypass_0_bits_fflags_bits_uop_uses_ldq),
    .io_bypass_0_bits_fflags_bits_uop_uses_stq(alu_io_bypass_0_bits_fflags_bits_uop_uses_stq),
    .io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc(alu_io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_bypass_0_bits_fflags_bits_uop_is_unique(alu_io_bypass_0_bits_fflags_bits_uop_is_unique),
    .io_bypass_0_bits_fflags_bits_uop_flush_on_commit(alu_io_bypass_0_bits_fflags_bits_uop_flush_on_commit),
    .io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1(alu_io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1),
    .io_bypass_0_bits_fflags_bits_uop_ldst(alu_io_bypass_0_bits_fflags_bits_uop_ldst),
    .io_bypass_0_bits_fflags_bits_uop_lrs1(alu_io_bypass_0_bits_fflags_bits_uop_lrs1),
    .io_bypass_0_bits_fflags_bits_uop_lrs2(alu_io_bypass_0_bits_fflags_bits_uop_lrs2),
    .io_bypass_0_bits_fflags_bits_uop_lrs3(alu_io_bypass_0_bits_fflags_bits_uop_lrs3),
    .io_bypass_0_bits_fflags_bits_uop_ldst_val(alu_io_bypass_0_bits_fflags_bits_uop_ldst_val),
    .io_bypass_0_bits_fflags_bits_uop_dst_rtype(alu_io_bypass_0_bits_fflags_bits_uop_dst_rtype),
    .io_bypass_0_bits_fflags_bits_uop_lrs1_rtype(alu_io_bypass_0_bits_fflags_bits_uop_lrs1_rtype),
    .io_bypass_0_bits_fflags_bits_uop_lrs2_rtype(alu_io_bypass_0_bits_fflags_bits_uop_lrs2_rtype),
    .io_bypass_0_bits_fflags_bits_uop_frs3_en(alu_io_bypass_0_bits_fflags_bits_uop_frs3_en),
    .io_bypass_0_bits_fflags_bits_uop_fp_val(alu_io_bypass_0_bits_fflags_bits_uop_fp_val),
    .io_bypass_0_bits_fflags_bits_uop_fp_single(alu_io_bypass_0_bits_fflags_bits_uop_fp_single),
    .io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if(alu_io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if),
    .io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if(alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if),
    .io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if(alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if),
    .io_bypass_0_bits_fflags_bits_uop_bp_debug_if(alu_io_bypass_0_bits_fflags_bits_uop_bp_debug_if),
    .io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if(alu_io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if),
    .io_bypass_0_bits_fflags_bits_uop_debug_fsrc(alu_io_bypass_0_bits_fflags_bits_uop_debug_fsrc),
    .io_bypass_0_bits_fflags_bits_uop_debug_tsrc(alu_io_bypass_0_bits_fflags_bits_uop_debug_tsrc),
    .io_bypass_0_bits_fflags_bits_flags(alu_io_bypass_0_bits_fflags_bits_flags),
    .io_bypass_0_bits_flagdata(alu_io_bypass_0_bits_flagdata),
    .io_bypass_0_bits_fflagdata_valid(alu_io_bypass_0_bits_fflagdata_valid),
    .io_bypass_0_bits_fflagdata_bits_uop_switch(alu_io_bypass_0_bits_fflagdata_bits_uop_switch),
    .io_bypass_0_bits_fflagdata_bits_uop_switch_off(alu_io_bypass_0_bits_fflagdata_bits_uop_switch_off),
    .io_bypass_0_bits_fflagdata_bits_uop_is_unicore(alu_io_bypass_0_bits_fflagdata_bits_uop_is_unicore),
    .io_bypass_0_bits_fflagdata_bits_uop_shift(alu_io_bypass_0_bits_fflagdata_bits_uop_shift),
    .io_bypass_0_bits_fflagdata_bits_uop_lrs3_rtype(alu_io_bypass_0_bits_fflagdata_bits_uop_lrs3_rtype),
    .io_bypass_0_bits_fflagdata_bits_uop_rflag(alu_io_bypass_0_bits_fflagdata_bits_uop_rflag),
    .io_bypass_0_bits_fflagdata_bits_uop_wflag(alu_io_bypass_0_bits_fflagdata_bits_uop_wflag),
    .io_bypass_0_bits_fflagdata_bits_uop_prflag(alu_io_bypass_0_bits_fflagdata_bits_uop_prflag),
    .io_bypass_0_bits_fflagdata_bits_uop_pwflag(alu_io_bypass_0_bits_fflagdata_bits_uop_pwflag),
    .io_bypass_0_bits_fflagdata_bits_uop_pflag_busy(alu_io_bypass_0_bits_fflagdata_bits_uop_pflag_busy),
    .io_bypass_0_bits_fflagdata_bits_uop_stale_pflag(alu_io_bypass_0_bits_fflagdata_bits_uop_stale_pflag),
    .io_bypass_0_bits_fflagdata_bits_uop_op1_sel(alu_io_bypass_0_bits_fflagdata_bits_uop_op1_sel),
    .io_bypass_0_bits_fflagdata_bits_uop_op2_sel(alu_io_bypass_0_bits_fflagdata_bits_uop_op2_sel),
    .io_bypass_0_bits_fflagdata_bits_uop_split_num(alu_io_bypass_0_bits_fflagdata_bits_uop_split_num),
    .io_bypass_0_bits_fflagdata_bits_uop_self_index(alu_io_bypass_0_bits_fflagdata_bits_uop_self_index),
    .io_bypass_0_bits_fflagdata_bits_uop_rob_inst_idx(alu_io_bypass_0_bits_fflagdata_bits_uop_rob_inst_idx),
    .io_bypass_0_bits_fflagdata_bits_uop_address_num(alu_io_bypass_0_bits_fflagdata_bits_uop_address_num),
    .io_bypass_0_bits_fflagdata_bits_uop_uopc(alu_io_bypass_0_bits_fflagdata_bits_uop_uopc),
    .io_bypass_0_bits_fflagdata_bits_uop_inst(alu_io_bypass_0_bits_fflagdata_bits_uop_inst),
    .io_bypass_0_bits_fflagdata_bits_uop_debug_inst(alu_io_bypass_0_bits_fflagdata_bits_uop_debug_inst),
    .io_bypass_0_bits_fflagdata_bits_uop_is_rvc(alu_io_bypass_0_bits_fflagdata_bits_uop_is_rvc),
    .io_bypass_0_bits_fflagdata_bits_uop_debug_pc(alu_io_bypass_0_bits_fflagdata_bits_uop_debug_pc),
    .io_bypass_0_bits_fflagdata_bits_uop_iq_type(alu_io_bypass_0_bits_fflagdata_bits_uop_iq_type),
    .io_bypass_0_bits_fflagdata_bits_uop_fu_code(alu_io_bypass_0_bits_fflagdata_bits_uop_fu_code),
    .io_bypass_0_bits_fflagdata_bits_uop_ctrl_br_type(alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_br_type),
    .io_bypass_0_bits_fflagdata_bits_uop_ctrl_op1_sel(alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op1_sel),
    .io_bypass_0_bits_fflagdata_bits_uop_ctrl_op2_sel(alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op2_sel),
    .io_bypass_0_bits_fflagdata_bits_uop_ctrl_imm_sel(alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_imm_sel),
    .io_bypass_0_bits_fflagdata_bits_uop_ctrl_op_fcn(alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op_fcn),
    .io_bypass_0_bits_fflagdata_bits_uop_ctrl_fcn_dw(alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_fcn_dw),
    .io_bypass_0_bits_fflagdata_bits_uop_ctrl_csr_cmd(alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_csr_cmd),
    .io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_load(alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_load),
    .io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_sta(alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_sta),
    .io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_std(alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_std),
    .io_bypass_0_bits_fflagdata_bits_uop_ctrl_op3_sel(alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op3_sel),
    .io_bypass_0_bits_fflagdata_bits_uop_iw_state(alu_io_bypass_0_bits_fflagdata_bits_uop_iw_state),
    .io_bypass_0_bits_fflagdata_bits_uop_iw_p1_poisoned(alu_io_bypass_0_bits_fflagdata_bits_uop_iw_p1_poisoned),
    .io_bypass_0_bits_fflagdata_bits_uop_iw_p2_poisoned(alu_io_bypass_0_bits_fflagdata_bits_uop_iw_p2_poisoned),
    .io_bypass_0_bits_fflagdata_bits_uop_is_br(alu_io_bypass_0_bits_fflagdata_bits_uop_is_br),
    .io_bypass_0_bits_fflagdata_bits_uop_is_jalr(alu_io_bypass_0_bits_fflagdata_bits_uop_is_jalr),
    .io_bypass_0_bits_fflagdata_bits_uop_is_jal(alu_io_bypass_0_bits_fflagdata_bits_uop_is_jal),
    .io_bypass_0_bits_fflagdata_bits_uop_is_sfb(alu_io_bypass_0_bits_fflagdata_bits_uop_is_sfb),
    .io_bypass_0_bits_fflagdata_bits_uop_br_mask(alu_io_bypass_0_bits_fflagdata_bits_uop_br_mask),
    .io_bypass_0_bits_fflagdata_bits_uop_br_tag(alu_io_bypass_0_bits_fflagdata_bits_uop_br_tag),
    .io_bypass_0_bits_fflagdata_bits_uop_ftq_idx(alu_io_bypass_0_bits_fflagdata_bits_uop_ftq_idx),
    .io_bypass_0_bits_fflagdata_bits_uop_edge_inst(alu_io_bypass_0_bits_fflagdata_bits_uop_edge_inst),
    .io_bypass_0_bits_fflagdata_bits_uop_pc_lob(alu_io_bypass_0_bits_fflagdata_bits_uop_pc_lob),
    .io_bypass_0_bits_fflagdata_bits_uop_taken(alu_io_bypass_0_bits_fflagdata_bits_uop_taken),
    .io_bypass_0_bits_fflagdata_bits_uop_imm_packed(alu_io_bypass_0_bits_fflagdata_bits_uop_imm_packed),
    .io_bypass_0_bits_fflagdata_bits_uop_csr_addr(alu_io_bypass_0_bits_fflagdata_bits_uop_csr_addr),
    .io_bypass_0_bits_fflagdata_bits_uop_rob_idx(alu_io_bypass_0_bits_fflagdata_bits_uop_rob_idx),
    .io_bypass_0_bits_fflagdata_bits_uop_ldq_idx(alu_io_bypass_0_bits_fflagdata_bits_uop_ldq_idx),
    .io_bypass_0_bits_fflagdata_bits_uop_stq_idx(alu_io_bypass_0_bits_fflagdata_bits_uop_stq_idx),
    .io_bypass_0_bits_fflagdata_bits_uop_rxq_idx(alu_io_bypass_0_bits_fflagdata_bits_uop_rxq_idx),
    .io_bypass_0_bits_fflagdata_bits_uop_pdst(alu_io_bypass_0_bits_fflagdata_bits_uop_pdst),
    .io_bypass_0_bits_fflagdata_bits_uop_prs1(alu_io_bypass_0_bits_fflagdata_bits_uop_prs1),
    .io_bypass_0_bits_fflagdata_bits_uop_prs2(alu_io_bypass_0_bits_fflagdata_bits_uop_prs2),
    .io_bypass_0_bits_fflagdata_bits_uop_prs3(alu_io_bypass_0_bits_fflagdata_bits_uop_prs3),
    .io_bypass_0_bits_fflagdata_bits_uop_ppred(alu_io_bypass_0_bits_fflagdata_bits_uop_ppred),
    .io_bypass_0_bits_fflagdata_bits_uop_prs1_busy(alu_io_bypass_0_bits_fflagdata_bits_uop_prs1_busy),
    .io_bypass_0_bits_fflagdata_bits_uop_prs2_busy(alu_io_bypass_0_bits_fflagdata_bits_uop_prs2_busy),
    .io_bypass_0_bits_fflagdata_bits_uop_prs3_busy(alu_io_bypass_0_bits_fflagdata_bits_uop_prs3_busy),
    .io_bypass_0_bits_fflagdata_bits_uop_ppred_busy(alu_io_bypass_0_bits_fflagdata_bits_uop_ppred_busy),
    .io_bypass_0_bits_fflagdata_bits_uop_stale_pdst(alu_io_bypass_0_bits_fflagdata_bits_uop_stale_pdst),
    .io_bypass_0_bits_fflagdata_bits_uop_exception(alu_io_bypass_0_bits_fflagdata_bits_uop_exception),
    .io_bypass_0_bits_fflagdata_bits_uop_exc_cause(alu_io_bypass_0_bits_fflagdata_bits_uop_exc_cause),
    .io_bypass_0_bits_fflagdata_bits_uop_bypassable(alu_io_bypass_0_bits_fflagdata_bits_uop_bypassable),
    .io_bypass_0_bits_fflagdata_bits_uop_mem_cmd(alu_io_bypass_0_bits_fflagdata_bits_uop_mem_cmd),
    .io_bypass_0_bits_fflagdata_bits_uop_mem_size(alu_io_bypass_0_bits_fflagdata_bits_uop_mem_size),
    .io_bypass_0_bits_fflagdata_bits_uop_mem_signed(alu_io_bypass_0_bits_fflagdata_bits_uop_mem_signed),
    .io_bypass_0_bits_fflagdata_bits_uop_is_fence(alu_io_bypass_0_bits_fflagdata_bits_uop_is_fence),
    .io_bypass_0_bits_fflagdata_bits_uop_is_fencei(alu_io_bypass_0_bits_fflagdata_bits_uop_is_fencei),
    .io_bypass_0_bits_fflagdata_bits_uop_is_amo(alu_io_bypass_0_bits_fflagdata_bits_uop_is_amo),
    .io_bypass_0_bits_fflagdata_bits_uop_uses_ldq(alu_io_bypass_0_bits_fflagdata_bits_uop_uses_ldq),
    .io_bypass_0_bits_fflagdata_bits_uop_uses_stq(alu_io_bypass_0_bits_fflagdata_bits_uop_uses_stq),
    .io_bypass_0_bits_fflagdata_bits_uop_is_sys_pc2epc(alu_io_bypass_0_bits_fflagdata_bits_uop_is_sys_pc2epc),
    .io_bypass_0_bits_fflagdata_bits_uop_is_unique(alu_io_bypass_0_bits_fflagdata_bits_uop_is_unique),
    .io_bypass_0_bits_fflagdata_bits_uop_flush_on_commit(alu_io_bypass_0_bits_fflagdata_bits_uop_flush_on_commit),
    .io_bypass_0_bits_fflagdata_bits_uop_ldst_is_rs1(alu_io_bypass_0_bits_fflagdata_bits_uop_ldst_is_rs1),
    .io_bypass_0_bits_fflagdata_bits_uop_ldst(alu_io_bypass_0_bits_fflagdata_bits_uop_ldst),
    .io_bypass_0_bits_fflagdata_bits_uop_lrs1(alu_io_bypass_0_bits_fflagdata_bits_uop_lrs1),
    .io_bypass_0_bits_fflagdata_bits_uop_lrs2(alu_io_bypass_0_bits_fflagdata_bits_uop_lrs2),
    .io_bypass_0_bits_fflagdata_bits_uop_lrs3(alu_io_bypass_0_bits_fflagdata_bits_uop_lrs3),
    .io_bypass_0_bits_fflagdata_bits_uop_ldst_val(alu_io_bypass_0_bits_fflagdata_bits_uop_ldst_val),
    .io_bypass_0_bits_fflagdata_bits_uop_dst_rtype(alu_io_bypass_0_bits_fflagdata_bits_uop_dst_rtype),
    .io_bypass_0_bits_fflagdata_bits_uop_lrs1_rtype(alu_io_bypass_0_bits_fflagdata_bits_uop_lrs1_rtype),
    .io_bypass_0_bits_fflagdata_bits_uop_lrs2_rtype(alu_io_bypass_0_bits_fflagdata_bits_uop_lrs2_rtype),
    .io_bypass_0_bits_fflagdata_bits_uop_frs3_en(alu_io_bypass_0_bits_fflagdata_bits_uop_frs3_en),
    .io_bypass_0_bits_fflagdata_bits_uop_fp_val(alu_io_bypass_0_bits_fflagdata_bits_uop_fp_val),
    .io_bypass_0_bits_fflagdata_bits_uop_fp_single(alu_io_bypass_0_bits_fflagdata_bits_uop_fp_single),
    .io_bypass_0_bits_fflagdata_bits_uop_xcpt_pf_if(alu_io_bypass_0_bits_fflagdata_bits_uop_xcpt_pf_if),
    .io_bypass_0_bits_fflagdata_bits_uop_xcpt_ae_if(alu_io_bypass_0_bits_fflagdata_bits_uop_xcpt_ae_if),
    .io_bypass_0_bits_fflagdata_bits_uop_xcpt_ma_if(alu_io_bypass_0_bits_fflagdata_bits_uop_xcpt_ma_if),
    .io_bypass_0_bits_fflagdata_bits_uop_bp_debug_if(alu_io_bypass_0_bits_fflagdata_bits_uop_bp_debug_if),
    .io_bypass_0_bits_fflagdata_bits_uop_bp_xcpt_if(alu_io_bypass_0_bits_fflagdata_bits_uop_bp_xcpt_if),
    .io_bypass_0_bits_fflagdata_bits_uop_debug_fsrc(alu_io_bypass_0_bits_fflagdata_bits_uop_debug_fsrc),
    .io_bypass_0_bits_fflagdata_bits_uop_debug_tsrc(alu_io_bypass_0_bits_fflagdata_bits_uop_debug_tsrc),
    .io_bypass_0_bits_fflagdata_bits_fflag(alu_io_bypass_0_bits_fflagdata_bits_fflag),
    .io_bypass_1_valid(alu_io_bypass_1_valid),
    .io_bypass_1_bits_uop_switch(alu_io_bypass_1_bits_uop_switch),
    .io_bypass_1_bits_uop_switch_off(alu_io_bypass_1_bits_uop_switch_off),
    .io_bypass_1_bits_uop_is_unicore(alu_io_bypass_1_bits_uop_is_unicore),
    .io_bypass_1_bits_uop_shift(alu_io_bypass_1_bits_uop_shift),
    .io_bypass_1_bits_uop_lrs3_rtype(alu_io_bypass_1_bits_uop_lrs3_rtype),
    .io_bypass_1_bits_uop_rflag(alu_io_bypass_1_bits_uop_rflag),
    .io_bypass_1_bits_uop_wflag(alu_io_bypass_1_bits_uop_wflag),
    .io_bypass_1_bits_uop_prflag(alu_io_bypass_1_bits_uop_prflag),
    .io_bypass_1_bits_uop_pwflag(alu_io_bypass_1_bits_uop_pwflag),
    .io_bypass_1_bits_uop_pflag_busy(alu_io_bypass_1_bits_uop_pflag_busy),
    .io_bypass_1_bits_uop_stale_pflag(alu_io_bypass_1_bits_uop_stale_pflag),
    .io_bypass_1_bits_uop_op1_sel(alu_io_bypass_1_bits_uop_op1_sel),
    .io_bypass_1_bits_uop_op2_sel(alu_io_bypass_1_bits_uop_op2_sel),
    .io_bypass_1_bits_uop_split_num(alu_io_bypass_1_bits_uop_split_num),
    .io_bypass_1_bits_uop_self_index(alu_io_bypass_1_bits_uop_self_index),
    .io_bypass_1_bits_uop_rob_inst_idx(alu_io_bypass_1_bits_uop_rob_inst_idx),
    .io_bypass_1_bits_uop_address_num(alu_io_bypass_1_bits_uop_address_num),
    .io_bypass_1_bits_uop_uopc(alu_io_bypass_1_bits_uop_uopc),
    .io_bypass_1_bits_uop_inst(alu_io_bypass_1_bits_uop_inst),
    .io_bypass_1_bits_uop_debug_inst(alu_io_bypass_1_bits_uop_debug_inst),
    .io_bypass_1_bits_uop_is_rvc(alu_io_bypass_1_bits_uop_is_rvc),
    .io_bypass_1_bits_uop_debug_pc(alu_io_bypass_1_bits_uop_debug_pc),
    .io_bypass_1_bits_uop_iq_type(alu_io_bypass_1_bits_uop_iq_type),
    .io_bypass_1_bits_uop_fu_code(alu_io_bypass_1_bits_uop_fu_code),
    .io_bypass_1_bits_uop_ctrl_br_type(alu_io_bypass_1_bits_uop_ctrl_br_type),
    .io_bypass_1_bits_uop_ctrl_op1_sel(alu_io_bypass_1_bits_uop_ctrl_op1_sel),
    .io_bypass_1_bits_uop_ctrl_op2_sel(alu_io_bypass_1_bits_uop_ctrl_op2_sel),
    .io_bypass_1_bits_uop_ctrl_imm_sel(alu_io_bypass_1_bits_uop_ctrl_imm_sel),
    .io_bypass_1_bits_uop_ctrl_op_fcn(alu_io_bypass_1_bits_uop_ctrl_op_fcn),
    .io_bypass_1_bits_uop_ctrl_fcn_dw(alu_io_bypass_1_bits_uop_ctrl_fcn_dw),
    .io_bypass_1_bits_uop_ctrl_csr_cmd(alu_io_bypass_1_bits_uop_ctrl_csr_cmd),
    .io_bypass_1_bits_uop_ctrl_is_load(alu_io_bypass_1_bits_uop_ctrl_is_load),
    .io_bypass_1_bits_uop_ctrl_is_sta(alu_io_bypass_1_bits_uop_ctrl_is_sta),
    .io_bypass_1_bits_uop_ctrl_is_std(alu_io_bypass_1_bits_uop_ctrl_is_std),
    .io_bypass_1_bits_uop_ctrl_op3_sel(alu_io_bypass_1_bits_uop_ctrl_op3_sel),
    .io_bypass_1_bits_uop_iw_state(alu_io_bypass_1_bits_uop_iw_state),
    .io_bypass_1_bits_uop_iw_p1_poisoned(alu_io_bypass_1_bits_uop_iw_p1_poisoned),
    .io_bypass_1_bits_uop_iw_p2_poisoned(alu_io_bypass_1_bits_uop_iw_p2_poisoned),
    .io_bypass_1_bits_uop_is_br(alu_io_bypass_1_bits_uop_is_br),
    .io_bypass_1_bits_uop_is_jalr(alu_io_bypass_1_bits_uop_is_jalr),
    .io_bypass_1_bits_uop_is_jal(alu_io_bypass_1_bits_uop_is_jal),
    .io_bypass_1_bits_uop_is_sfb(alu_io_bypass_1_bits_uop_is_sfb),
    .io_bypass_1_bits_uop_br_mask(alu_io_bypass_1_bits_uop_br_mask),
    .io_bypass_1_bits_uop_br_tag(alu_io_bypass_1_bits_uop_br_tag),
    .io_bypass_1_bits_uop_ftq_idx(alu_io_bypass_1_bits_uop_ftq_idx),
    .io_bypass_1_bits_uop_edge_inst(alu_io_bypass_1_bits_uop_edge_inst),
    .io_bypass_1_bits_uop_pc_lob(alu_io_bypass_1_bits_uop_pc_lob),
    .io_bypass_1_bits_uop_taken(alu_io_bypass_1_bits_uop_taken),
    .io_bypass_1_bits_uop_imm_packed(alu_io_bypass_1_bits_uop_imm_packed),
    .io_bypass_1_bits_uop_csr_addr(alu_io_bypass_1_bits_uop_csr_addr),
    .io_bypass_1_bits_uop_rob_idx(alu_io_bypass_1_bits_uop_rob_idx),
    .io_bypass_1_bits_uop_ldq_idx(alu_io_bypass_1_bits_uop_ldq_idx),
    .io_bypass_1_bits_uop_stq_idx(alu_io_bypass_1_bits_uop_stq_idx),
    .io_bypass_1_bits_uop_rxq_idx(alu_io_bypass_1_bits_uop_rxq_idx),
    .io_bypass_1_bits_uop_pdst(alu_io_bypass_1_bits_uop_pdst),
    .io_bypass_1_bits_uop_prs1(alu_io_bypass_1_bits_uop_prs1),
    .io_bypass_1_bits_uop_prs2(alu_io_bypass_1_bits_uop_prs2),
    .io_bypass_1_bits_uop_prs3(alu_io_bypass_1_bits_uop_prs3),
    .io_bypass_1_bits_uop_ppred(alu_io_bypass_1_bits_uop_ppred),
    .io_bypass_1_bits_uop_prs1_busy(alu_io_bypass_1_bits_uop_prs1_busy),
    .io_bypass_1_bits_uop_prs2_busy(alu_io_bypass_1_bits_uop_prs2_busy),
    .io_bypass_1_bits_uop_prs3_busy(alu_io_bypass_1_bits_uop_prs3_busy),
    .io_bypass_1_bits_uop_ppred_busy(alu_io_bypass_1_bits_uop_ppred_busy),
    .io_bypass_1_bits_uop_stale_pdst(alu_io_bypass_1_bits_uop_stale_pdst),
    .io_bypass_1_bits_uop_exception(alu_io_bypass_1_bits_uop_exception),
    .io_bypass_1_bits_uop_exc_cause(alu_io_bypass_1_bits_uop_exc_cause),
    .io_bypass_1_bits_uop_bypassable(alu_io_bypass_1_bits_uop_bypassable),
    .io_bypass_1_bits_uop_mem_cmd(alu_io_bypass_1_bits_uop_mem_cmd),
    .io_bypass_1_bits_uop_mem_size(alu_io_bypass_1_bits_uop_mem_size),
    .io_bypass_1_bits_uop_mem_signed(alu_io_bypass_1_bits_uop_mem_signed),
    .io_bypass_1_bits_uop_is_fence(alu_io_bypass_1_bits_uop_is_fence),
    .io_bypass_1_bits_uop_is_fencei(alu_io_bypass_1_bits_uop_is_fencei),
    .io_bypass_1_bits_uop_is_amo(alu_io_bypass_1_bits_uop_is_amo),
    .io_bypass_1_bits_uop_uses_ldq(alu_io_bypass_1_bits_uop_uses_ldq),
    .io_bypass_1_bits_uop_uses_stq(alu_io_bypass_1_bits_uop_uses_stq),
    .io_bypass_1_bits_uop_is_sys_pc2epc(alu_io_bypass_1_bits_uop_is_sys_pc2epc),
    .io_bypass_1_bits_uop_is_unique(alu_io_bypass_1_bits_uop_is_unique),
    .io_bypass_1_bits_uop_flush_on_commit(alu_io_bypass_1_bits_uop_flush_on_commit),
    .io_bypass_1_bits_uop_ldst_is_rs1(alu_io_bypass_1_bits_uop_ldst_is_rs1),
    .io_bypass_1_bits_uop_ldst(alu_io_bypass_1_bits_uop_ldst),
    .io_bypass_1_bits_uop_lrs1(alu_io_bypass_1_bits_uop_lrs1),
    .io_bypass_1_bits_uop_lrs2(alu_io_bypass_1_bits_uop_lrs2),
    .io_bypass_1_bits_uop_lrs3(alu_io_bypass_1_bits_uop_lrs3),
    .io_bypass_1_bits_uop_ldst_val(alu_io_bypass_1_bits_uop_ldst_val),
    .io_bypass_1_bits_uop_dst_rtype(alu_io_bypass_1_bits_uop_dst_rtype),
    .io_bypass_1_bits_uop_lrs1_rtype(alu_io_bypass_1_bits_uop_lrs1_rtype),
    .io_bypass_1_bits_uop_lrs2_rtype(alu_io_bypass_1_bits_uop_lrs2_rtype),
    .io_bypass_1_bits_uop_frs3_en(alu_io_bypass_1_bits_uop_frs3_en),
    .io_bypass_1_bits_uop_fp_val(alu_io_bypass_1_bits_uop_fp_val),
    .io_bypass_1_bits_uop_fp_single(alu_io_bypass_1_bits_uop_fp_single),
    .io_bypass_1_bits_uop_xcpt_pf_if(alu_io_bypass_1_bits_uop_xcpt_pf_if),
    .io_bypass_1_bits_uop_xcpt_ae_if(alu_io_bypass_1_bits_uop_xcpt_ae_if),
    .io_bypass_1_bits_uop_xcpt_ma_if(alu_io_bypass_1_bits_uop_xcpt_ma_if),
    .io_bypass_1_bits_uop_bp_debug_if(alu_io_bypass_1_bits_uop_bp_debug_if),
    .io_bypass_1_bits_uop_bp_xcpt_if(alu_io_bypass_1_bits_uop_bp_xcpt_if),
    .io_bypass_1_bits_uop_debug_fsrc(alu_io_bypass_1_bits_uop_debug_fsrc),
    .io_bypass_1_bits_uop_debug_tsrc(alu_io_bypass_1_bits_uop_debug_tsrc),
    .io_bypass_1_bits_data(alu_io_bypass_1_bits_data),
    .io_bypass_1_bits_predicated(alu_io_bypass_1_bits_predicated),
    .io_bypass_1_bits_fflags_valid(alu_io_bypass_1_bits_fflags_valid),
    .io_bypass_1_bits_fflags_bits_uop_switch(alu_io_bypass_1_bits_fflags_bits_uop_switch),
    .io_bypass_1_bits_fflags_bits_uop_switch_off(alu_io_bypass_1_bits_fflags_bits_uop_switch_off),
    .io_bypass_1_bits_fflags_bits_uop_is_unicore(alu_io_bypass_1_bits_fflags_bits_uop_is_unicore),
    .io_bypass_1_bits_fflags_bits_uop_shift(alu_io_bypass_1_bits_fflags_bits_uop_shift),
    .io_bypass_1_bits_fflags_bits_uop_lrs3_rtype(alu_io_bypass_1_bits_fflags_bits_uop_lrs3_rtype),
    .io_bypass_1_bits_fflags_bits_uop_rflag(alu_io_bypass_1_bits_fflags_bits_uop_rflag),
    .io_bypass_1_bits_fflags_bits_uop_wflag(alu_io_bypass_1_bits_fflags_bits_uop_wflag),
    .io_bypass_1_bits_fflags_bits_uop_prflag(alu_io_bypass_1_bits_fflags_bits_uop_prflag),
    .io_bypass_1_bits_fflags_bits_uop_pwflag(alu_io_bypass_1_bits_fflags_bits_uop_pwflag),
    .io_bypass_1_bits_fflags_bits_uop_pflag_busy(alu_io_bypass_1_bits_fflags_bits_uop_pflag_busy),
    .io_bypass_1_bits_fflags_bits_uop_stale_pflag(alu_io_bypass_1_bits_fflags_bits_uop_stale_pflag),
    .io_bypass_1_bits_fflags_bits_uop_op1_sel(alu_io_bypass_1_bits_fflags_bits_uop_op1_sel),
    .io_bypass_1_bits_fflags_bits_uop_op2_sel(alu_io_bypass_1_bits_fflags_bits_uop_op2_sel),
    .io_bypass_1_bits_fflags_bits_uop_split_num(alu_io_bypass_1_bits_fflags_bits_uop_split_num),
    .io_bypass_1_bits_fflags_bits_uop_self_index(alu_io_bypass_1_bits_fflags_bits_uop_self_index),
    .io_bypass_1_bits_fflags_bits_uop_rob_inst_idx(alu_io_bypass_1_bits_fflags_bits_uop_rob_inst_idx),
    .io_bypass_1_bits_fflags_bits_uop_address_num(alu_io_bypass_1_bits_fflags_bits_uop_address_num),
    .io_bypass_1_bits_fflags_bits_uop_uopc(alu_io_bypass_1_bits_fflags_bits_uop_uopc),
    .io_bypass_1_bits_fflags_bits_uop_inst(alu_io_bypass_1_bits_fflags_bits_uop_inst),
    .io_bypass_1_bits_fflags_bits_uop_debug_inst(alu_io_bypass_1_bits_fflags_bits_uop_debug_inst),
    .io_bypass_1_bits_fflags_bits_uop_is_rvc(alu_io_bypass_1_bits_fflags_bits_uop_is_rvc),
    .io_bypass_1_bits_fflags_bits_uop_debug_pc(alu_io_bypass_1_bits_fflags_bits_uop_debug_pc),
    .io_bypass_1_bits_fflags_bits_uop_iq_type(alu_io_bypass_1_bits_fflags_bits_uop_iq_type),
    .io_bypass_1_bits_fflags_bits_uop_fu_code(alu_io_bypass_1_bits_fflags_bits_uop_fu_code),
    .io_bypass_1_bits_fflags_bits_uop_ctrl_br_type(alu_io_bypass_1_bits_fflags_bits_uop_ctrl_br_type),
    .io_bypass_1_bits_fflags_bits_uop_ctrl_op1_sel(alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_bypass_1_bits_fflags_bits_uop_ctrl_op2_sel(alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_bypass_1_bits_fflags_bits_uop_ctrl_imm_sel(alu_io_bypass_1_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_bypass_1_bits_fflags_bits_uop_ctrl_op_fcn(alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_bypass_1_bits_fflags_bits_uop_ctrl_fcn_dw(alu_io_bypass_1_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_bypass_1_bits_fflags_bits_uop_ctrl_csr_cmd(alu_io_bypass_1_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_bypass_1_bits_fflags_bits_uop_ctrl_is_load(alu_io_bypass_1_bits_fflags_bits_uop_ctrl_is_load),
    .io_bypass_1_bits_fflags_bits_uop_ctrl_is_sta(alu_io_bypass_1_bits_fflags_bits_uop_ctrl_is_sta),
    .io_bypass_1_bits_fflags_bits_uop_ctrl_is_std(alu_io_bypass_1_bits_fflags_bits_uop_ctrl_is_std),
    .io_bypass_1_bits_fflags_bits_uop_ctrl_op3_sel(alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op3_sel),
    .io_bypass_1_bits_fflags_bits_uop_iw_state(alu_io_bypass_1_bits_fflags_bits_uop_iw_state),
    .io_bypass_1_bits_fflags_bits_uop_iw_p1_poisoned(alu_io_bypass_1_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_bypass_1_bits_fflags_bits_uop_iw_p2_poisoned(alu_io_bypass_1_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_bypass_1_bits_fflags_bits_uop_is_br(alu_io_bypass_1_bits_fflags_bits_uop_is_br),
    .io_bypass_1_bits_fflags_bits_uop_is_jalr(alu_io_bypass_1_bits_fflags_bits_uop_is_jalr),
    .io_bypass_1_bits_fflags_bits_uop_is_jal(alu_io_bypass_1_bits_fflags_bits_uop_is_jal),
    .io_bypass_1_bits_fflags_bits_uop_is_sfb(alu_io_bypass_1_bits_fflags_bits_uop_is_sfb),
    .io_bypass_1_bits_fflags_bits_uop_br_mask(alu_io_bypass_1_bits_fflags_bits_uop_br_mask),
    .io_bypass_1_bits_fflags_bits_uop_br_tag(alu_io_bypass_1_bits_fflags_bits_uop_br_tag),
    .io_bypass_1_bits_fflags_bits_uop_ftq_idx(alu_io_bypass_1_bits_fflags_bits_uop_ftq_idx),
    .io_bypass_1_bits_fflags_bits_uop_edge_inst(alu_io_bypass_1_bits_fflags_bits_uop_edge_inst),
    .io_bypass_1_bits_fflags_bits_uop_pc_lob(alu_io_bypass_1_bits_fflags_bits_uop_pc_lob),
    .io_bypass_1_bits_fflags_bits_uop_taken(alu_io_bypass_1_bits_fflags_bits_uop_taken),
    .io_bypass_1_bits_fflags_bits_uop_imm_packed(alu_io_bypass_1_bits_fflags_bits_uop_imm_packed),
    .io_bypass_1_bits_fflags_bits_uop_csr_addr(alu_io_bypass_1_bits_fflags_bits_uop_csr_addr),
    .io_bypass_1_bits_fflags_bits_uop_rob_idx(alu_io_bypass_1_bits_fflags_bits_uop_rob_idx),
    .io_bypass_1_bits_fflags_bits_uop_ldq_idx(alu_io_bypass_1_bits_fflags_bits_uop_ldq_idx),
    .io_bypass_1_bits_fflags_bits_uop_stq_idx(alu_io_bypass_1_bits_fflags_bits_uop_stq_idx),
    .io_bypass_1_bits_fflags_bits_uop_rxq_idx(alu_io_bypass_1_bits_fflags_bits_uop_rxq_idx),
    .io_bypass_1_bits_fflags_bits_uop_pdst(alu_io_bypass_1_bits_fflags_bits_uop_pdst),
    .io_bypass_1_bits_fflags_bits_uop_prs1(alu_io_bypass_1_bits_fflags_bits_uop_prs1),
    .io_bypass_1_bits_fflags_bits_uop_prs2(alu_io_bypass_1_bits_fflags_bits_uop_prs2),
    .io_bypass_1_bits_fflags_bits_uop_prs3(alu_io_bypass_1_bits_fflags_bits_uop_prs3),
    .io_bypass_1_bits_fflags_bits_uop_ppred(alu_io_bypass_1_bits_fflags_bits_uop_ppred),
    .io_bypass_1_bits_fflags_bits_uop_prs1_busy(alu_io_bypass_1_bits_fflags_bits_uop_prs1_busy),
    .io_bypass_1_bits_fflags_bits_uop_prs2_busy(alu_io_bypass_1_bits_fflags_bits_uop_prs2_busy),
    .io_bypass_1_bits_fflags_bits_uop_prs3_busy(alu_io_bypass_1_bits_fflags_bits_uop_prs3_busy),
    .io_bypass_1_bits_fflags_bits_uop_ppred_busy(alu_io_bypass_1_bits_fflags_bits_uop_ppred_busy),
    .io_bypass_1_bits_fflags_bits_uop_stale_pdst(alu_io_bypass_1_bits_fflags_bits_uop_stale_pdst),
    .io_bypass_1_bits_fflags_bits_uop_exception(alu_io_bypass_1_bits_fflags_bits_uop_exception),
    .io_bypass_1_bits_fflags_bits_uop_exc_cause(alu_io_bypass_1_bits_fflags_bits_uop_exc_cause),
    .io_bypass_1_bits_fflags_bits_uop_bypassable(alu_io_bypass_1_bits_fflags_bits_uop_bypassable),
    .io_bypass_1_bits_fflags_bits_uop_mem_cmd(alu_io_bypass_1_bits_fflags_bits_uop_mem_cmd),
    .io_bypass_1_bits_fflags_bits_uop_mem_size(alu_io_bypass_1_bits_fflags_bits_uop_mem_size),
    .io_bypass_1_bits_fflags_bits_uop_mem_signed(alu_io_bypass_1_bits_fflags_bits_uop_mem_signed),
    .io_bypass_1_bits_fflags_bits_uop_is_fence(alu_io_bypass_1_bits_fflags_bits_uop_is_fence),
    .io_bypass_1_bits_fflags_bits_uop_is_fencei(alu_io_bypass_1_bits_fflags_bits_uop_is_fencei),
    .io_bypass_1_bits_fflags_bits_uop_is_amo(alu_io_bypass_1_bits_fflags_bits_uop_is_amo),
    .io_bypass_1_bits_fflags_bits_uop_uses_ldq(alu_io_bypass_1_bits_fflags_bits_uop_uses_ldq),
    .io_bypass_1_bits_fflags_bits_uop_uses_stq(alu_io_bypass_1_bits_fflags_bits_uop_uses_stq),
    .io_bypass_1_bits_fflags_bits_uop_is_sys_pc2epc(alu_io_bypass_1_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_bypass_1_bits_fflags_bits_uop_is_unique(alu_io_bypass_1_bits_fflags_bits_uop_is_unique),
    .io_bypass_1_bits_fflags_bits_uop_flush_on_commit(alu_io_bypass_1_bits_fflags_bits_uop_flush_on_commit),
    .io_bypass_1_bits_fflags_bits_uop_ldst_is_rs1(alu_io_bypass_1_bits_fflags_bits_uop_ldst_is_rs1),
    .io_bypass_1_bits_fflags_bits_uop_ldst(alu_io_bypass_1_bits_fflags_bits_uop_ldst),
    .io_bypass_1_bits_fflags_bits_uop_lrs1(alu_io_bypass_1_bits_fflags_bits_uop_lrs1),
    .io_bypass_1_bits_fflags_bits_uop_lrs2(alu_io_bypass_1_bits_fflags_bits_uop_lrs2),
    .io_bypass_1_bits_fflags_bits_uop_lrs3(alu_io_bypass_1_bits_fflags_bits_uop_lrs3),
    .io_bypass_1_bits_fflags_bits_uop_ldst_val(alu_io_bypass_1_bits_fflags_bits_uop_ldst_val),
    .io_bypass_1_bits_fflags_bits_uop_dst_rtype(alu_io_bypass_1_bits_fflags_bits_uop_dst_rtype),
    .io_bypass_1_bits_fflags_bits_uop_lrs1_rtype(alu_io_bypass_1_bits_fflags_bits_uop_lrs1_rtype),
    .io_bypass_1_bits_fflags_bits_uop_lrs2_rtype(alu_io_bypass_1_bits_fflags_bits_uop_lrs2_rtype),
    .io_bypass_1_bits_fflags_bits_uop_frs3_en(alu_io_bypass_1_bits_fflags_bits_uop_frs3_en),
    .io_bypass_1_bits_fflags_bits_uop_fp_val(alu_io_bypass_1_bits_fflags_bits_uop_fp_val),
    .io_bypass_1_bits_fflags_bits_uop_fp_single(alu_io_bypass_1_bits_fflags_bits_uop_fp_single),
    .io_bypass_1_bits_fflags_bits_uop_xcpt_pf_if(alu_io_bypass_1_bits_fflags_bits_uop_xcpt_pf_if),
    .io_bypass_1_bits_fflags_bits_uop_xcpt_ae_if(alu_io_bypass_1_bits_fflags_bits_uop_xcpt_ae_if),
    .io_bypass_1_bits_fflags_bits_uop_xcpt_ma_if(alu_io_bypass_1_bits_fflags_bits_uop_xcpt_ma_if),
    .io_bypass_1_bits_fflags_bits_uop_bp_debug_if(alu_io_bypass_1_bits_fflags_bits_uop_bp_debug_if),
    .io_bypass_1_bits_fflags_bits_uop_bp_xcpt_if(alu_io_bypass_1_bits_fflags_bits_uop_bp_xcpt_if),
    .io_bypass_1_bits_fflags_bits_uop_debug_fsrc(alu_io_bypass_1_bits_fflags_bits_uop_debug_fsrc),
    .io_bypass_1_bits_fflags_bits_uop_debug_tsrc(alu_io_bypass_1_bits_fflags_bits_uop_debug_tsrc),
    .io_bypass_1_bits_fflags_bits_flags(alu_io_bypass_1_bits_fflags_bits_flags),
    .io_bypass_1_bits_flagdata(alu_io_bypass_1_bits_flagdata),
    .io_bypass_1_bits_fflagdata_valid(alu_io_bypass_1_bits_fflagdata_valid),
    .io_bypass_1_bits_fflagdata_bits_uop_switch(alu_io_bypass_1_bits_fflagdata_bits_uop_switch),
    .io_bypass_1_bits_fflagdata_bits_uop_switch_off(alu_io_bypass_1_bits_fflagdata_bits_uop_switch_off),
    .io_bypass_1_bits_fflagdata_bits_uop_is_unicore(alu_io_bypass_1_bits_fflagdata_bits_uop_is_unicore),
    .io_bypass_1_bits_fflagdata_bits_uop_shift(alu_io_bypass_1_bits_fflagdata_bits_uop_shift),
    .io_bypass_1_bits_fflagdata_bits_uop_lrs3_rtype(alu_io_bypass_1_bits_fflagdata_bits_uop_lrs3_rtype),
    .io_bypass_1_bits_fflagdata_bits_uop_rflag(alu_io_bypass_1_bits_fflagdata_bits_uop_rflag),
    .io_bypass_1_bits_fflagdata_bits_uop_wflag(alu_io_bypass_1_bits_fflagdata_bits_uop_wflag),
    .io_bypass_1_bits_fflagdata_bits_uop_prflag(alu_io_bypass_1_bits_fflagdata_bits_uop_prflag),
    .io_bypass_1_bits_fflagdata_bits_uop_pwflag(alu_io_bypass_1_bits_fflagdata_bits_uop_pwflag),
    .io_bypass_1_bits_fflagdata_bits_uop_pflag_busy(alu_io_bypass_1_bits_fflagdata_bits_uop_pflag_busy),
    .io_bypass_1_bits_fflagdata_bits_uop_stale_pflag(alu_io_bypass_1_bits_fflagdata_bits_uop_stale_pflag),
    .io_bypass_1_bits_fflagdata_bits_uop_op1_sel(alu_io_bypass_1_bits_fflagdata_bits_uop_op1_sel),
    .io_bypass_1_bits_fflagdata_bits_uop_op2_sel(alu_io_bypass_1_bits_fflagdata_bits_uop_op2_sel),
    .io_bypass_1_bits_fflagdata_bits_uop_split_num(alu_io_bypass_1_bits_fflagdata_bits_uop_split_num),
    .io_bypass_1_bits_fflagdata_bits_uop_self_index(alu_io_bypass_1_bits_fflagdata_bits_uop_self_index),
    .io_bypass_1_bits_fflagdata_bits_uop_rob_inst_idx(alu_io_bypass_1_bits_fflagdata_bits_uop_rob_inst_idx),
    .io_bypass_1_bits_fflagdata_bits_uop_address_num(alu_io_bypass_1_bits_fflagdata_bits_uop_address_num),
    .io_bypass_1_bits_fflagdata_bits_uop_uopc(alu_io_bypass_1_bits_fflagdata_bits_uop_uopc),
    .io_bypass_1_bits_fflagdata_bits_uop_inst(alu_io_bypass_1_bits_fflagdata_bits_uop_inst),
    .io_bypass_1_bits_fflagdata_bits_uop_debug_inst(alu_io_bypass_1_bits_fflagdata_bits_uop_debug_inst),
    .io_bypass_1_bits_fflagdata_bits_uop_is_rvc(alu_io_bypass_1_bits_fflagdata_bits_uop_is_rvc),
    .io_bypass_1_bits_fflagdata_bits_uop_debug_pc(alu_io_bypass_1_bits_fflagdata_bits_uop_debug_pc),
    .io_bypass_1_bits_fflagdata_bits_uop_iq_type(alu_io_bypass_1_bits_fflagdata_bits_uop_iq_type),
    .io_bypass_1_bits_fflagdata_bits_uop_fu_code(alu_io_bypass_1_bits_fflagdata_bits_uop_fu_code),
    .io_bypass_1_bits_fflagdata_bits_uop_ctrl_br_type(alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_br_type),
    .io_bypass_1_bits_fflagdata_bits_uop_ctrl_op1_sel(alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op1_sel),
    .io_bypass_1_bits_fflagdata_bits_uop_ctrl_op2_sel(alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op2_sel),
    .io_bypass_1_bits_fflagdata_bits_uop_ctrl_imm_sel(alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_imm_sel),
    .io_bypass_1_bits_fflagdata_bits_uop_ctrl_op_fcn(alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op_fcn),
    .io_bypass_1_bits_fflagdata_bits_uop_ctrl_fcn_dw(alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_fcn_dw),
    .io_bypass_1_bits_fflagdata_bits_uop_ctrl_csr_cmd(alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_csr_cmd),
    .io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_load(alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_load),
    .io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_sta(alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_sta),
    .io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_std(alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_std),
    .io_bypass_1_bits_fflagdata_bits_uop_ctrl_op3_sel(alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op3_sel),
    .io_bypass_1_bits_fflagdata_bits_uop_iw_state(alu_io_bypass_1_bits_fflagdata_bits_uop_iw_state),
    .io_bypass_1_bits_fflagdata_bits_uop_iw_p1_poisoned(alu_io_bypass_1_bits_fflagdata_bits_uop_iw_p1_poisoned),
    .io_bypass_1_bits_fflagdata_bits_uop_iw_p2_poisoned(alu_io_bypass_1_bits_fflagdata_bits_uop_iw_p2_poisoned),
    .io_bypass_1_bits_fflagdata_bits_uop_is_br(alu_io_bypass_1_bits_fflagdata_bits_uop_is_br),
    .io_bypass_1_bits_fflagdata_bits_uop_is_jalr(alu_io_bypass_1_bits_fflagdata_bits_uop_is_jalr),
    .io_bypass_1_bits_fflagdata_bits_uop_is_jal(alu_io_bypass_1_bits_fflagdata_bits_uop_is_jal),
    .io_bypass_1_bits_fflagdata_bits_uop_is_sfb(alu_io_bypass_1_bits_fflagdata_bits_uop_is_sfb),
    .io_bypass_1_bits_fflagdata_bits_uop_br_mask(alu_io_bypass_1_bits_fflagdata_bits_uop_br_mask),
    .io_bypass_1_bits_fflagdata_bits_uop_br_tag(alu_io_bypass_1_bits_fflagdata_bits_uop_br_tag),
    .io_bypass_1_bits_fflagdata_bits_uop_ftq_idx(alu_io_bypass_1_bits_fflagdata_bits_uop_ftq_idx),
    .io_bypass_1_bits_fflagdata_bits_uop_edge_inst(alu_io_bypass_1_bits_fflagdata_bits_uop_edge_inst),
    .io_bypass_1_bits_fflagdata_bits_uop_pc_lob(alu_io_bypass_1_bits_fflagdata_bits_uop_pc_lob),
    .io_bypass_1_bits_fflagdata_bits_uop_taken(alu_io_bypass_1_bits_fflagdata_bits_uop_taken),
    .io_bypass_1_bits_fflagdata_bits_uop_imm_packed(alu_io_bypass_1_bits_fflagdata_bits_uop_imm_packed),
    .io_bypass_1_bits_fflagdata_bits_uop_csr_addr(alu_io_bypass_1_bits_fflagdata_bits_uop_csr_addr),
    .io_bypass_1_bits_fflagdata_bits_uop_rob_idx(alu_io_bypass_1_bits_fflagdata_bits_uop_rob_idx),
    .io_bypass_1_bits_fflagdata_bits_uop_ldq_idx(alu_io_bypass_1_bits_fflagdata_bits_uop_ldq_idx),
    .io_bypass_1_bits_fflagdata_bits_uop_stq_idx(alu_io_bypass_1_bits_fflagdata_bits_uop_stq_idx),
    .io_bypass_1_bits_fflagdata_bits_uop_rxq_idx(alu_io_bypass_1_bits_fflagdata_bits_uop_rxq_idx),
    .io_bypass_1_bits_fflagdata_bits_uop_pdst(alu_io_bypass_1_bits_fflagdata_bits_uop_pdst),
    .io_bypass_1_bits_fflagdata_bits_uop_prs1(alu_io_bypass_1_bits_fflagdata_bits_uop_prs1),
    .io_bypass_1_bits_fflagdata_bits_uop_prs2(alu_io_bypass_1_bits_fflagdata_bits_uop_prs2),
    .io_bypass_1_bits_fflagdata_bits_uop_prs3(alu_io_bypass_1_bits_fflagdata_bits_uop_prs3),
    .io_bypass_1_bits_fflagdata_bits_uop_ppred(alu_io_bypass_1_bits_fflagdata_bits_uop_ppred),
    .io_bypass_1_bits_fflagdata_bits_uop_prs1_busy(alu_io_bypass_1_bits_fflagdata_bits_uop_prs1_busy),
    .io_bypass_1_bits_fflagdata_bits_uop_prs2_busy(alu_io_bypass_1_bits_fflagdata_bits_uop_prs2_busy),
    .io_bypass_1_bits_fflagdata_bits_uop_prs3_busy(alu_io_bypass_1_bits_fflagdata_bits_uop_prs3_busy),
    .io_bypass_1_bits_fflagdata_bits_uop_ppred_busy(alu_io_bypass_1_bits_fflagdata_bits_uop_ppred_busy),
    .io_bypass_1_bits_fflagdata_bits_uop_stale_pdst(alu_io_bypass_1_bits_fflagdata_bits_uop_stale_pdst),
    .io_bypass_1_bits_fflagdata_bits_uop_exception(alu_io_bypass_1_bits_fflagdata_bits_uop_exception),
    .io_bypass_1_bits_fflagdata_bits_uop_exc_cause(alu_io_bypass_1_bits_fflagdata_bits_uop_exc_cause),
    .io_bypass_1_bits_fflagdata_bits_uop_bypassable(alu_io_bypass_1_bits_fflagdata_bits_uop_bypassable),
    .io_bypass_1_bits_fflagdata_bits_uop_mem_cmd(alu_io_bypass_1_bits_fflagdata_bits_uop_mem_cmd),
    .io_bypass_1_bits_fflagdata_bits_uop_mem_size(alu_io_bypass_1_bits_fflagdata_bits_uop_mem_size),
    .io_bypass_1_bits_fflagdata_bits_uop_mem_signed(alu_io_bypass_1_bits_fflagdata_bits_uop_mem_signed),
    .io_bypass_1_bits_fflagdata_bits_uop_is_fence(alu_io_bypass_1_bits_fflagdata_bits_uop_is_fence),
    .io_bypass_1_bits_fflagdata_bits_uop_is_fencei(alu_io_bypass_1_bits_fflagdata_bits_uop_is_fencei),
    .io_bypass_1_bits_fflagdata_bits_uop_is_amo(alu_io_bypass_1_bits_fflagdata_bits_uop_is_amo),
    .io_bypass_1_bits_fflagdata_bits_uop_uses_ldq(alu_io_bypass_1_bits_fflagdata_bits_uop_uses_ldq),
    .io_bypass_1_bits_fflagdata_bits_uop_uses_stq(alu_io_bypass_1_bits_fflagdata_bits_uop_uses_stq),
    .io_bypass_1_bits_fflagdata_bits_uop_is_sys_pc2epc(alu_io_bypass_1_bits_fflagdata_bits_uop_is_sys_pc2epc),
    .io_bypass_1_bits_fflagdata_bits_uop_is_unique(alu_io_bypass_1_bits_fflagdata_bits_uop_is_unique),
    .io_bypass_1_bits_fflagdata_bits_uop_flush_on_commit(alu_io_bypass_1_bits_fflagdata_bits_uop_flush_on_commit),
    .io_bypass_1_bits_fflagdata_bits_uop_ldst_is_rs1(alu_io_bypass_1_bits_fflagdata_bits_uop_ldst_is_rs1),
    .io_bypass_1_bits_fflagdata_bits_uop_ldst(alu_io_bypass_1_bits_fflagdata_bits_uop_ldst),
    .io_bypass_1_bits_fflagdata_bits_uop_lrs1(alu_io_bypass_1_bits_fflagdata_bits_uop_lrs1),
    .io_bypass_1_bits_fflagdata_bits_uop_lrs2(alu_io_bypass_1_bits_fflagdata_bits_uop_lrs2),
    .io_bypass_1_bits_fflagdata_bits_uop_lrs3(alu_io_bypass_1_bits_fflagdata_bits_uop_lrs3),
    .io_bypass_1_bits_fflagdata_bits_uop_ldst_val(alu_io_bypass_1_bits_fflagdata_bits_uop_ldst_val),
    .io_bypass_1_bits_fflagdata_bits_uop_dst_rtype(alu_io_bypass_1_bits_fflagdata_bits_uop_dst_rtype),
    .io_bypass_1_bits_fflagdata_bits_uop_lrs1_rtype(alu_io_bypass_1_bits_fflagdata_bits_uop_lrs1_rtype),
    .io_bypass_1_bits_fflagdata_bits_uop_lrs2_rtype(alu_io_bypass_1_bits_fflagdata_bits_uop_lrs2_rtype),
    .io_bypass_1_bits_fflagdata_bits_uop_frs3_en(alu_io_bypass_1_bits_fflagdata_bits_uop_frs3_en),
    .io_bypass_1_bits_fflagdata_bits_uop_fp_val(alu_io_bypass_1_bits_fflagdata_bits_uop_fp_val),
    .io_bypass_1_bits_fflagdata_bits_uop_fp_single(alu_io_bypass_1_bits_fflagdata_bits_uop_fp_single),
    .io_bypass_1_bits_fflagdata_bits_uop_xcpt_pf_if(alu_io_bypass_1_bits_fflagdata_bits_uop_xcpt_pf_if),
    .io_bypass_1_bits_fflagdata_bits_uop_xcpt_ae_if(alu_io_bypass_1_bits_fflagdata_bits_uop_xcpt_ae_if),
    .io_bypass_1_bits_fflagdata_bits_uop_xcpt_ma_if(alu_io_bypass_1_bits_fflagdata_bits_uop_xcpt_ma_if),
    .io_bypass_1_bits_fflagdata_bits_uop_bp_debug_if(alu_io_bypass_1_bits_fflagdata_bits_uop_bp_debug_if),
    .io_bypass_1_bits_fflagdata_bits_uop_bp_xcpt_if(alu_io_bypass_1_bits_fflagdata_bits_uop_bp_xcpt_if),
    .io_bypass_1_bits_fflagdata_bits_uop_debug_fsrc(alu_io_bypass_1_bits_fflagdata_bits_uop_debug_fsrc),
    .io_bypass_1_bits_fflagdata_bits_uop_debug_tsrc(alu_io_bypass_1_bits_fflagdata_bits_uop_debug_tsrc),
    .io_bypass_1_bits_fflagdata_bits_fflag(alu_io_bypass_1_bits_fflagdata_bits_fflag),
    .io_bypass_2_valid(alu_io_bypass_2_valid),
    .io_bypass_2_bits_uop_switch(alu_io_bypass_2_bits_uop_switch),
    .io_bypass_2_bits_uop_switch_off(alu_io_bypass_2_bits_uop_switch_off),
    .io_bypass_2_bits_uop_is_unicore(alu_io_bypass_2_bits_uop_is_unicore),
    .io_bypass_2_bits_uop_shift(alu_io_bypass_2_bits_uop_shift),
    .io_bypass_2_bits_uop_lrs3_rtype(alu_io_bypass_2_bits_uop_lrs3_rtype),
    .io_bypass_2_bits_uop_rflag(alu_io_bypass_2_bits_uop_rflag),
    .io_bypass_2_bits_uop_wflag(alu_io_bypass_2_bits_uop_wflag),
    .io_bypass_2_bits_uop_prflag(alu_io_bypass_2_bits_uop_prflag),
    .io_bypass_2_bits_uop_pwflag(alu_io_bypass_2_bits_uop_pwflag),
    .io_bypass_2_bits_uop_pflag_busy(alu_io_bypass_2_bits_uop_pflag_busy),
    .io_bypass_2_bits_uop_stale_pflag(alu_io_bypass_2_bits_uop_stale_pflag),
    .io_bypass_2_bits_uop_op1_sel(alu_io_bypass_2_bits_uop_op1_sel),
    .io_bypass_2_bits_uop_op2_sel(alu_io_bypass_2_bits_uop_op2_sel),
    .io_bypass_2_bits_uop_split_num(alu_io_bypass_2_bits_uop_split_num),
    .io_bypass_2_bits_uop_self_index(alu_io_bypass_2_bits_uop_self_index),
    .io_bypass_2_bits_uop_rob_inst_idx(alu_io_bypass_2_bits_uop_rob_inst_idx),
    .io_bypass_2_bits_uop_address_num(alu_io_bypass_2_bits_uop_address_num),
    .io_bypass_2_bits_uop_uopc(alu_io_bypass_2_bits_uop_uopc),
    .io_bypass_2_bits_uop_inst(alu_io_bypass_2_bits_uop_inst),
    .io_bypass_2_bits_uop_debug_inst(alu_io_bypass_2_bits_uop_debug_inst),
    .io_bypass_2_bits_uop_is_rvc(alu_io_bypass_2_bits_uop_is_rvc),
    .io_bypass_2_bits_uop_debug_pc(alu_io_bypass_2_bits_uop_debug_pc),
    .io_bypass_2_bits_uop_iq_type(alu_io_bypass_2_bits_uop_iq_type),
    .io_bypass_2_bits_uop_fu_code(alu_io_bypass_2_bits_uop_fu_code),
    .io_bypass_2_bits_uop_ctrl_br_type(alu_io_bypass_2_bits_uop_ctrl_br_type),
    .io_bypass_2_bits_uop_ctrl_op1_sel(alu_io_bypass_2_bits_uop_ctrl_op1_sel),
    .io_bypass_2_bits_uop_ctrl_op2_sel(alu_io_bypass_2_bits_uop_ctrl_op2_sel),
    .io_bypass_2_bits_uop_ctrl_imm_sel(alu_io_bypass_2_bits_uop_ctrl_imm_sel),
    .io_bypass_2_bits_uop_ctrl_op_fcn(alu_io_bypass_2_bits_uop_ctrl_op_fcn),
    .io_bypass_2_bits_uop_ctrl_fcn_dw(alu_io_bypass_2_bits_uop_ctrl_fcn_dw),
    .io_bypass_2_bits_uop_ctrl_csr_cmd(alu_io_bypass_2_bits_uop_ctrl_csr_cmd),
    .io_bypass_2_bits_uop_ctrl_is_load(alu_io_bypass_2_bits_uop_ctrl_is_load),
    .io_bypass_2_bits_uop_ctrl_is_sta(alu_io_bypass_2_bits_uop_ctrl_is_sta),
    .io_bypass_2_bits_uop_ctrl_is_std(alu_io_bypass_2_bits_uop_ctrl_is_std),
    .io_bypass_2_bits_uop_ctrl_op3_sel(alu_io_bypass_2_bits_uop_ctrl_op3_sel),
    .io_bypass_2_bits_uop_iw_state(alu_io_bypass_2_bits_uop_iw_state),
    .io_bypass_2_bits_uop_iw_p1_poisoned(alu_io_bypass_2_bits_uop_iw_p1_poisoned),
    .io_bypass_2_bits_uop_iw_p2_poisoned(alu_io_bypass_2_bits_uop_iw_p2_poisoned),
    .io_bypass_2_bits_uop_is_br(alu_io_bypass_2_bits_uop_is_br),
    .io_bypass_2_bits_uop_is_jalr(alu_io_bypass_2_bits_uop_is_jalr),
    .io_bypass_2_bits_uop_is_jal(alu_io_bypass_2_bits_uop_is_jal),
    .io_bypass_2_bits_uop_is_sfb(alu_io_bypass_2_bits_uop_is_sfb),
    .io_bypass_2_bits_uop_br_mask(alu_io_bypass_2_bits_uop_br_mask),
    .io_bypass_2_bits_uop_br_tag(alu_io_bypass_2_bits_uop_br_tag),
    .io_bypass_2_bits_uop_ftq_idx(alu_io_bypass_2_bits_uop_ftq_idx),
    .io_bypass_2_bits_uop_edge_inst(alu_io_bypass_2_bits_uop_edge_inst),
    .io_bypass_2_bits_uop_pc_lob(alu_io_bypass_2_bits_uop_pc_lob),
    .io_bypass_2_bits_uop_taken(alu_io_bypass_2_bits_uop_taken),
    .io_bypass_2_bits_uop_imm_packed(alu_io_bypass_2_bits_uop_imm_packed),
    .io_bypass_2_bits_uop_csr_addr(alu_io_bypass_2_bits_uop_csr_addr),
    .io_bypass_2_bits_uop_rob_idx(alu_io_bypass_2_bits_uop_rob_idx),
    .io_bypass_2_bits_uop_ldq_idx(alu_io_bypass_2_bits_uop_ldq_idx),
    .io_bypass_2_bits_uop_stq_idx(alu_io_bypass_2_bits_uop_stq_idx),
    .io_bypass_2_bits_uop_rxq_idx(alu_io_bypass_2_bits_uop_rxq_idx),
    .io_bypass_2_bits_uop_pdst(alu_io_bypass_2_bits_uop_pdst),
    .io_bypass_2_bits_uop_prs1(alu_io_bypass_2_bits_uop_prs1),
    .io_bypass_2_bits_uop_prs2(alu_io_bypass_2_bits_uop_prs2),
    .io_bypass_2_bits_uop_prs3(alu_io_bypass_2_bits_uop_prs3),
    .io_bypass_2_bits_uop_ppred(alu_io_bypass_2_bits_uop_ppred),
    .io_bypass_2_bits_uop_prs1_busy(alu_io_bypass_2_bits_uop_prs1_busy),
    .io_bypass_2_bits_uop_prs2_busy(alu_io_bypass_2_bits_uop_prs2_busy),
    .io_bypass_2_bits_uop_prs3_busy(alu_io_bypass_2_bits_uop_prs3_busy),
    .io_bypass_2_bits_uop_ppred_busy(alu_io_bypass_2_bits_uop_ppred_busy),
    .io_bypass_2_bits_uop_stale_pdst(alu_io_bypass_2_bits_uop_stale_pdst),
    .io_bypass_2_bits_uop_exception(alu_io_bypass_2_bits_uop_exception),
    .io_bypass_2_bits_uop_exc_cause(alu_io_bypass_2_bits_uop_exc_cause),
    .io_bypass_2_bits_uop_bypassable(alu_io_bypass_2_bits_uop_bypassable),
    .io_bypass_2_bits_uop_mem_cmd(alu_io_bypass_2_bits_uop_mem_cmd),
    .io_bypass_2_bits_uop_mem_size(alu_io_bypass_2_bits_uop_mem_size),
    .io_bypass_2_bits_uop_mem_signed(alu_io_bypass_2_bits_uop_mem_signed),
    .io_bypass_2_bits_uop_is_fence(alu_io_bypass_2_bits_uop_is_fence),
    .io_bypass_2_bits_uop_is_fencei(alu_io_bypass_2_bits_uop_is_fencei),
    .io_bypass_2_bits_uop_is_amo(alu_io_bypass_2_bits_uop_is_amo),
    .io_bypass_2_bits_uop_uses_ldq(alu_io_bypass_2_bits_uop_uses_ldq),
    .io_bypass_2_bits_uop_uses_stq(alu_io_bypass_2_bits_uop_uses_stq),
    .io_bypass_2_bits_uop_is_sys_pc2epc(alu_io_bypass_2_bits_uop_is_sys_pc2epc),
    .io_bypass_2_bits_uop_is_unique(alu_io_bypass_2_bits_uop_is_unique),
    .io_bypass_2_bits_uop_flush_on_commit(alu_io_bypass_2_bits_uop_flush_on_commit),
    .io_bypass_2_bits_uop_ldst_is_rs1(alu_io_bypass_2_bits_uop_ldst_is_rs1),
    .io_bypass_2_bits_uop_ldst(alu_io_bypass_2_bits_uop_ldst),
    .io_bypass_2_bits_uop_lrs1(alu_io_bypass_2_bits_uop_lrs1),
    .io_bypass_2_bits_uop_lrs2(alu_io_bypass_2_bits_uop_lrs2),
    .io_bypass_2_bits_uop_lrs3(alu_io_bypass_2_bits_uop_lrs3),
    .io_bypass_2_bits_uop_ldst_val(alu_io_bypass_2_bits_uop_ldst_val),
    .io_bypass_2_bits_uop_dst_rtype(alu_io_bypass_2_bits_uop_dst_rtype),
    .io_bypass_2_bits_uop_lrs1_rtype(alu_io_bypass_2_bits_uop_lrs1_rtype),
    .io_bypass_2_bits_uop_lrs2_rtype(alu_io_bypass_2_bits_uop_lrs2_rtype),
    .io_bypass_2_bits_uop_frs3_en(alu_io_bypass_2_bits_uop_frs3_en),
    .io_bypass_2_bits_uop_fp_val(alu_io_bypass_2_bits_uop_fp_val),
    .io_bypass_2_bits_uop_fp_single(alu_io_bypass_2_bits_uop_fp_single),
    .io_bypass_2_bits_uop_xcpt_pf_if(alu_io_bypass_2_bits_uop_xcpt_pf_if),
    .io_bypass_2_bits_uop_xcpt_ae_if(alu_io_bypass_2_bits_uop_xcpt_ae_if),
    .io_bypass_2_bits_uop_xcpt_ma_if(alu_io_bypass_2_bits_uop_xcpt_ma_if),
    .io_bypass_2_bits_uop_bp_debug_if(alu_io_bypass_2_bits_uop_bp_debug_if),
    .io_bypass_2_bits_uop_bp_xcpt_if(alu_io_bypass_2_bits_uop_bp_xcpt_if),
    .io_bypass_2_bits_uop_debug_fsrc(alu_io_bypass_2_bits_uop_debug_fsrc),
    .io_bypass_2_bits_uop_debug_tsrc(alu_io_bypass_2_bits_uop_debug_tsrc),
    .io_bypass_2_bits_data(alu_io_bypass_2_bits_data),
    .io_bypass_2_bits_predicated(alu_io_bypass_2_bits_predicated),
    .io_bypass_2_bits_fflags_valid(alu_io_bypass_2_bits_fflags_valid),
    .io_bypass_2_bits_fflags_bits_uop_switch(alu_io_bypass_2_bits_fflags_bits_uop_switch),
    .io_bypass_2_bits_fflags_bits_uop_switch_off(alu_io_bypass_2_bits_fflags_bits_uop_switch_off),
    .io_bypass_2_bits_fflags_bits_uop_is_unicore(alu_io_bypass_2_bits_fflags_bits_uop_is_unicore),
    .io_bypass_2_bits_fflags_bits_uop_shift(alu_io_bypass_2_bits_fflags_bits_uop_shift),
    .io_bypass_2_bits_fflags_bits_uop_lrs3_rtype(alu_io_bypass_2_bits_fflags_bits_uop_lrs3_rtype),
    .io_bypass_2_bits_fflags_bits_uop_rflag(alu_io_bypass_2_bits_fflags_bits_uop_rflag),
    .io_bypass_2_bits_fflags_bits_uop_wflag(alu_io_bypass_2_bits_fflags_bits_uop_wflag),
    .io_bypass_2_bits_fflags_bits_uop_prflag(alu_io_bypass_2_bits_fflags_bits_uop_prflag),
    .io_bypass_2_bits_fflags_bits_uop_pwflag(alu_io_bypass_2_bits_fflags_bits_uop_pwflag),
    .io_bypass_2_bits_fflags_bits_uop_pflag_busy(alu_io_bypass_2_bits_fflags_bits_uop_pflag_busy),
    .io_bypass_2_bits_fflags_bits_uop_stale_pflag(alu_io_bypass_2_bits_fflags_bits_uop_stale_pflag),
    .io_bypass_2_bits_fflags_bits_uop_op1_sel(alu_io_bypass_2_bits_fflags_bits_uop_op1_sel),
    .io_bypass_2_bits_fflags_bits_uop_op2_sel(alu_io_bypass_2_bits_fflags_bits_uop_op2_sel),
    .io_bypass_2_bits_fflags_bits_uop_split_num(alu_io_bypass_2_bits_fflags_bits_uop_split_num),
    .io_bypass_2_bits_fflags_bits_uop_self_index(alu_io_bypass_2_bits_fflags_bits_uop_self_index),
    .io_bypass_2_bits_fflags_bits_uop_rob_inst_idx(alu_io_bypass_2_bits_fflags_bits_uop_rob_inst_idx),
    .io_bypass_2_bits_fflags_bits_uop_address_num(alu_io_bypass_2_bits_fflags_bits_uop_address_num),
    .io_bypass_2_bits_fflags_bits_uop_uopc(alu_io_bypass_2_bits_fflags_bits_uop_uopc),
    .io_bypass_2_bits_fflags_bits_uop_inst(alu_io_bypass_2_bits_fflags_bits_uop_inst),
    .io_bypass_2_bits_fflags_bits_uop_debug_inst(alu_io_bypass_2_bits_fflags_bits_uop_debug_inst),
    .io_bypass_2_bits_fflags_bits_uop_is_rvc(alu_io_bypass_2_bits_fflags_bits_uop_is_rvc),
    .io_bypass_2_bits_fflags_bits_uop_debug_pc(alu_io_bypass_2_bits_fflags_bits_uop_debug_pc),
    .io_bypass_2_bits_fflags_bits_uop_iq_type(alu_io_bypass_2_bits_fflags_bits_uop_iq_type),
    .io_bypass_2_bits_fflags_bits_uop_fu_code(alu_io_bypass_2_bits_fflags_bits_uop_fu_code),
    .io_bypass_2_bits_fflags_bits_uop_ctrl_br_type(alu_io_bypass_2_bits_fflags_bits_uop_ctrl_br_type),
    .io_bypass_2_bits_fflags_bits_uop_ctrl_op1_sel(alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_bypass_2_bits_fflags_bits_uop_ctrl_op2_sel(alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_bypass_2_bits_fflags_bits_uop_ctrl_imm_sel(alu_io_bypass_2_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_bypass_2_bits_fflags_bits_uop_ctrl_op_fcn(alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_bypass_2_bits_fflags_bits_uop_ctrl_fcn_dw(alu_io_bypass_2_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_bypass_2_bits_fflags_bits_uop_ctrl_csr_cmd(alu_io_bypass_2_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_bypass_2_bits_fflags_bits_uop_ctrl_is_load(alu_io_bypass_2_bits_fflags_bits_uop_ctrl_is_load),
    .io_bypass_2_bits_fflags_bits_uop_ctrl_is_sta(alu_io_bypass_2_bits_fflags_bits_uop_ctrl_is_sta),
    .io_bypass_2_bits_fflags_bits_uop_ctrl_is_std(alu_io_bypass_2_bits_fflags_bits_uop_ctrl_is_std),
    .io_bypass_2_bits_fflags_bits_uop_ctrl_op3_sel(alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op3_sel),
    .io_bypass_2_bits_fflags_bits_uop_iw_state(alu_io_bypass_2_bits_fflags_bits_uop_iw_state),
    .io_bypass_2_bits_fflags_bits_uop_iw_p1_poisoned(alu_io_bypass_2_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_bypass_2_bits_fflags_bits_uop_iw_p2_poisoned(alu_io_bypass_2_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_bypass_2_bits_fflags_bits_uop_is_br(alu_io_bypass_2_bits_fflags_bits_uop_is_br),
    .io_bypass_2_bits_fflags_bits_uop_is_jalr(alu_io_bypass_2_bits_fflags_bits_uop_is_jalr),
    .io_bypass_2_bits_fflags_bits_uop_is_jal(alu_io_bypass_2_bits_fflags_bits_uop_is_jal),
    .io_bypass_2_bits_fflags_bits_uop_is_sfb(alu_io_bypass_2_bits_fflags_bits_uop_is_sfb),
    .io_bypass_2_bits_fflags_bits_uop_br_mask(alu_io_bypass_2_bits_fflags_bits_uop_br_mask),
    .io_bypass_2_bits_fflags_bits_uop_br_tag(alu_io_bypass_2_bits_fflags_bits_uop_br_tag),
    .io_bypass_2_bits_fflags_bits_uop_ftq_idx(alu_io_bypass_2_bits_fflags_bits_uop_ftq_idx),
    .io_bypass_2_bits_fflags_bits_uop_edge_inst(alu_io_bypass_2_bits_fflags_bits_uop_edge_inst),
    .io_bypass_2_bits_fflags_bits_uop_pc_lob(alu_io_bypass_2_bits_fflags_bits_uop_pc_lob),
    .io_bypass_2_bits_fflags_bits_uop_taken(alu_io_bypass_2_bits_fflags_bits_uop_taken),
    .io_bypass_2_bits_fflags_bits_uop_imm_packed(alu_io_bypass_2_bits_fflags_bits_uop_imm_packed),
    .io_bypass_2_bits_fflags_bits_uop_csr_addr(alu_io_bypass_2_bits_fflags_bits_uop_csr_addr),
    .io_bypass_2_bits_fflags_bits_uop_rob_idx(alu_io_bypass_2_bits_fflags_bits_uop_rob_idx),
    .io_bypass_2_bits_fflags_bits_uop_ldq_idx(alu_io_bypass_2_bits_fflags_bits_uop_ldq_idx),
    .io_bypass_2_bits_fflags_bits_uop_stq_idx(alu_io_bypass_2_bits_fflags_bits_uop_stq_idx),
    .io_bypass_2_bits_fflags_bits_uop_rxq_idx(alu_io_bypass_2_bits_fflags_bits_uop_rxq_idx),
    .io_bypass_2_bits_fflags_bits_uop_pdst(alu_io_bypass_2_bits_fflags_bits_uop_pdst),
    .io_bypass_2_bits_fflags_bits_uop_prs1(alu_io_bypass_2_bits_fflags_bits_uop_prs1),
    .io_bypass_2_bits_fflags_bits_uop_prs2(alu_io_bypass_2_bits_fflags_bits_uop_prs2),
    .io_bypass_2_bits_fflags_bits_uop_prs3(alu_io_bypass_2_bits_fflags_bits_uop_prs3),
    .io_bypass_2_bits_fflags_bits_uop_ppred(alu_io_bypass_2_bits_fflags_bits_uop_ppred),
    .io_bypass_2_bits_fflags_bits_uop_prs1_busy(alu_io_bypass_2_bits_fflags_bits_uop_prs1_busy),
    .io_bypass_2_bits_fflags_bits_uop_prs2_busy(alu_io_bypass_2_bits_fflags_bits_uop_prs2_busy),
    .io_bypass_2_bits_fflags_bits_uop_prs3_busy(alu_io_bypass_2_bits_fflags_bits_uop_prs3_busy),
    .io_bypass_2_bits_fflags_bits_uop_ppred_busy(alu_io_bypass_2_bits_fflags_bits_uop_ppred_busy),
    .io_bypass_2_bits_fflags_bits_uop_stale_pdst(alu_io_bypass_2_bits_fflags_bits_uop_stale_pdst),
    .io_bypass_2_bits_fflags_bits_uop_exception(alu_io_bypass_2_bits_fflags_bits_uop_exception),
    .io_bypass_2_bits_fflags_bits_uop_exc_cause(alu_io_bypass_2_bits_fflags_bits_uop_exc_cause),
    .io_bypass_2_bits_fflags_bits_uop_bypassable(alu_io_bypass_2_bits_fflags_bits_uop_bypassable),
    .io_bypass_2_bits_fflags_bits_uop_mem_cmd(alu_io_bypass_2_bits_fflags_bits_uop_mem_cmd),
    .io_bypass_2_bits_fflags_bits_uop_mem_size(alu_io_bypass_2_bits_fflags_bits_uop_mem_size),
    .io_bypass_2_bits_fflags_bits_uop_mem_signed(alu_io_bypass_2_bits_fflags_bits_uop_mem_signed),
    .io_bypass_2_bits_fflags_bits_uop_is_fence(alu_io_bypass_2_bits_fflags_bits_uop_is_fence),
    .io_bypass_2_bits_fflags_bits_uop_is_fencei(alu_io_bypass_2_bits_fflags_bits_uop_is_fencei),
    .io_bypass_2_bits_fflags_bits_uop_is_amo(alu_io_bypass_2_bits_fflags_bits_uop_is_amo),
    .io_bypass_2_bits_fflags_bits_uop_uses_ldq(alu_io_bypass_2_bits_fflags_bits_uop_uses_ldq),
    .io_bypass_2_bits_fflags_bits_uop_uses_stq(alu_io_bypass_2_bits_fflags_bits_uop_uses_stq),
    .io_bypass_2_bits_fflags_bits_uop_is_sys_pc2epc(alu_io_bypass_2_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_bypass_2_bits_fflags_bits_uop_is_unique(alu_io_bypass_2_bits_fflags_bits_uop_is_unique),
    .io_bypass_2_bits_fflags_bits_uop_flush_on_commit(alu_io_bypass_2_bits_fflags_bits_uop_flush_on_commit),
    .io_bypass_2_bits_fflags_bits_uop_ldst_is_rs1(alu_io_bypass_2_bits_fflags_bits_uop_ldst_is_rs1),
    .io_bypass_2_bits_fflags_bits_uop_ldst(alu_io_bypass_2_bits_fflags_bits_uop_ldst),
    .io_bypass_2_bits_fflags_bits_uop_lrs1(alu_io_bypass_2_bits_fflags_bits_uop_lrs1),
    .io_bypass_2_bits_fflags_bits_uop_lrs2(alu_io_bypass_2_bits_fflags_bits_uop_lrs2),
    .io_bypass_2_bits_fflags_bits_uop_lrs3(alu_io_bypass_2_bits_fflags_bits_uop_lrs3),
    .io_bypass_2_bits_fflags_bits_uop_ldst_val(alu_io_bypass_2_bits_fflags_bits_uop_ldst_val),
    .io_bypass_2_bits_fflags_bits_uop_dst_rtype(alu_io_bypass_2_bits_fflags_bits_uop_dst_rtype),
    .io_bypass_2_bits_fflags_bits_uop_lrs1_rtype(alu_io_bypass_2_bits_fflags_bits_uop_lrs1_rtype),
    .io_bypass_2_bits_fflags_bits_uop_lrs2_rtype(alu_io_bypass_2_bits_fflags_bits_uop_lrs2_rtype),
    .io_bypass_2_bits_fflags_bits_uop_frs3_en(alu_io_bypass_2_bits_fflags_bits_uop_frs3_en),
    .io_bypass_2_bits_fflags_bits_uop_fp_val(alu_io_bypass_2_bits_fflags_bits_uop_fp_val),
    .io_bypass_2_bits_fflags_bits_uop_fp_single(alu_io_bypass_2_bits_fflags_bits_uop_fp_single),
    .io_bypass_2_bits_fflags_bits_uop_xcpt_pf_if(alu_io_bypass_2_bits_fflags_bits_uop_xcpt_pf_if),
    .io_bypass_2_bits_fflags_bits_uop_xcpt_ae_if(alu_io_bypass_2_bits_fflags_bits_uop_xcpt_ae_if),
    .io_bypass_2_bits_fflags_bits_uop_xcpt_ma_if(alu_io_bypass_2_bits_fflags_bits_uop_xcpt_ma_if),
    .io_bypass_2_bits_fflags_bits_uop_bp_debug_if(alu_io_bypass_2_bits_fflags_bits_uop_bp_debug_if),
    .io_bypass_2_bits_fflags_bits_uop_bp_xcpt_if(alu_io_bypass_2_bits_fflags_bits_uop_bp_xcpt_if),
    .io_bypass_2_bits_fflags_bits_uop_debug_fsrc(alu_io_bypass_2_bits_fflags_bits_uop_debug_fsrc),
    .io_bypass_2_bits_fflags_bits_uop_debug_tsrc(alu_io_bypass_2_bits_fflags_bits_uop_debug_tsrc),
    .io_bypass_2_bits_fflags_bits_flags(alu_io_bypass_2_bits_fflags_bits_flags),
    .io_bypass_2_bits_flagdata(alu_io_bypass_2_bits_flagdata),
    .io_bypass_2_bits_fflagdata_valid(alu_io_bypass_2_bits_fflagdata_valid),
    .io_bypass_2_bits_fflagdata_bits_uop_switch(alu_io_bypass_2_bits_fflagdata_bits_uop_switch),
    .io_bypass_2_bits_fflagdata_bits_uop_switch_off(alu_io_bypass_2_bits_fflagdata_bits_uop_switch_off),
    .io_bypass_2_bits_fflagdata_bits_uop_is_unicore(alu_io_bypass_2_bits_fflagdata_bits_uop_is_unicore),
    .io_bypass_2_bits_fflagdata_bits_uop_shift(alu_io_bypass_2_bits_fflagdata_bits_uop_shift),
    .io_bypass_2_bits_fflagdata_bits_uop_lrs3_rtype(alu_io_bypass_2_bits_fflagdata_bits_uop_lrs3_rtype),
    .io_bypass_2_bits_fflagdata_bits_uop_rflag(alu_io_bypass_2_bits_fflagdata_bits_uop_rflag),
    .io_bypass_2_bits_fflagdata_bits_uop_wflag(alu_io_bypass_2_bits_fflagdata_bits_uop_wflag),
    .io_bypass_2_bits_fflagdata_bits_uop_prflag(alu_io_bypass_2_bits_fflagdata_bits_uop_prflag),
    .io_bypass_2_bits_fflagdata_bits_uop_pwflag(alu_io_bypass_2_bits_fflagdata_bits_uop_pwflag),
    .io_bypass_2_bits_fflagdata_bits_uop_pflag_busy(alu_io_bypass_2_bits_fflagdata_bits_uop_pflag_busy),
    .io_bypass_2_bits_fflagdata_bits_uop_stale_pflag(alu_io_bypass_2_bits_fflagdata_bits_uop_stale_pflag),
    .io_bypass_2_bits_fflagdata_bits_uop_op1_sel(alu_io_bypass_2_bits_fflagdata_bits_uop_op1_sel),
    .io_bypass_2_bits_fflagdata_bits_uop_op2_sel(alu_io_bypass_2_bits_fflagdata_bits_uop_op2_sel),
    .io_bypass_2_bits_fflagdata_bits_uop_split_num(alu_io_bypass_2_bits_fflagdata_bits_uop_split_num),
    .io_bypass_2_bits_fflagdata_bits_uop_self_index(alu_io_bypass_2_bits_fflagdata_bits_uop_self_index),
    .io_bypass_2_bits_fflagdata_bits_uop_rob_inst_idx(alu_io_bypass_2_bits_fflagdata_bits_uop_rob_inst_idx),
    .io_bypass_2_bits_fflagdata_bits_uop_address_num(alu_io_bypass_2_bits_fflagdata_bits_uop_address_num),
    .io_bypass_2_bits_fflagdata_bits_uop_uopc(alu_io_bypass_2_bits_fflagdata_bits_uop_uopc),
    .io_bypass_2_bits_fflagdata_bits_uop_inst(alu_io_bypass_2_bits_fflagdata_bits_uop_inst),
    .io_bypass_2_bits_fflagdata_bits_uop_debug_inst(alu_io_bypass_2_bits_fflagdata_bits_uop_debug_inst),
    .io_bypass_2_bits_fflagdata_bits_uop_is_rvc(alu_io_bypass_2_bits_fflagdata_bits_uop_is_rvc),
    .io_bypass_2_bits_fflagdata_bits_uop_debug_pc(alu_io_bypass_2_bits_fflagdata_bits_uop_debug_pc),
    .io_bypass_2_bits_fflagdata_bits_uop_iq_type(alu_io_bypass_2_bits_fflagdata_bits_uop_iq_type),
    .io_bypass_2_bits_fflagdata_bits_uop_fu_code(alu_io_bypass_2_bits_fflagdata_bits_uop_fu_code),
    .io_bypass_2_bits_fflagdata_bits_uop_ctrl_br_type(alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_br_type),
    .io_bypass_2_bits_fflagdata_bits_uop_ctrl_op1_sel(alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op1_sel),
    .io_bypass_2_bits_fflagdata_bits_uop_ctrl_op2_sel(alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op2_sel),
    .io_bypass_2_bits_fflagdata_bits_uop_ctrl_imm_sel(alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_imm_sel),
    .io_bypass_2_bits_fflagdata_bits_uop_ctrl_op_fcn(alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op_fcn),
    .io_bypass_2_bits_fflagdata_bits_uop_ctrl_fcn_dw(alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_fcn_dw),
    .io_bypass_2_bits_fflagdata_bits_uop_ctrl_csr_cmd(alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_csr_cmd),
    .io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_load(alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_load),
    .io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_sta(alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_sta),
    .io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_std(alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_std),
    .io_bypass_2_bits_fflagdata_bits_uop_ctrl_op3_sel(alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op3_sel),
    .io_bypass_2_bits_fflagdata_bits_uop_iw_state(alu_io_bypass_2_bits_fflagdata_bits_uop_iw_state),
    .io_bypass_2_bits_fflagdata_bits_uop_iw_p1_poisoned(alu_io_bypass_2_bits_fflagdata_bits_uop_iw_p1_poisoned),
    .io_bypass_2_bits_fflagdata_bits_uop_iw_p2_poisoned(alu_io_bypass_2_bits_fflagdata_bits_uop_iw_p2_poisoned),
    .io_bypass_2_bits_fflagdata_bits_uop_is_br(alu_io_bypass_2_bits_fflagdata_bits_uop_is_br),
    .io_bypass_2_bits_fflagdata_bits_uop_is_jalr(alu_io_bypass_2_bits_fflagdata_bits_uop_is_jalr),
    .io_bypass_2_bits_fflagdata_bits_uop_is_jal(alu_io_bypass_2_bits_fflagdata_bits_uop_is_jal),
    .io_bypass_2_bits_fflagdata_bits_uop_is_sfb(alu_io_bypass_2_bits_fflagdata_bits_uop_is_sfb),
    .io_bypass_2_bits_fflagdata_bits_uop_br_mask(alu_io_bypass_2_bits_fflagdata_bits_uop_br_mask),
    .io_bypass_2_bits_fflagdata_bits_uop_br_tag(alu_io_bypass_2_bits_fflagdata_bits_uop_br_tag),
    .io_bypass_2_bits_fflagdata_bits_uop_ftq_idx(alu_io_bypass_2_bits_fflagdata_bits_uop_ftq_idx),
    .io_bypass_2_bits_fflagdata_bits_uop_edge_inst(alu_io_bypass_2_bits_fflagdata_bits_uop_edge_inst),
    .io_bypass_2_bits_fflagdata_bits_uop_pc_lob(alu_io_bypass_2_bits_fflagdata_bits_uop_pc_lob),
    .io_bypass_2_bits_fflagdata_bits_uop_taken(alu_io_bypass_2_bits_fflagdata_bits_uop_taken),
    .io_bypass_2_bits_fflagdata_bits_uop_imm_packed(alu_io_bypass_2_bits_fflagdata_bits_uop_imm_packed),
    .io_bypass_2_bits_fflagdata_bits_uop_csr_addr(alu_io_bypass_2_bits_fflagdata_bits_uop_csr_addr),
    .io_bypass_2_bits_fflagdata_bits_uop_rob_idx(alu_io_bypass_2_bits_fflagdata_bits_uop_rob_idx),
    .io_bypass_2_bits_fflagdata_bits_uop_ldq_idx(alu_io_bypass_2_bits_fflagdata_bits_uop_ldq_idx),
    .io_bypass_2_bits_fflagdata_bits_uop_stq_idx(alu_io_bypass_2_bits_fflagdata_bits_uop_stq_idx),
    .io_bypass_2_bits_fflagdata_bits_uop_rxq_idx(alu_io_bypass_2_bits_fflagdata_bits_uop_rxq_idx),
    .io_bypass_2_bits_fflagdata_bits_uop_pdst(alu_io_bypass_2_bits_fflagdata_bits_uop_pdst),
    .io_bypass_2_bits_fflagdata_bits_uop_prs1(alu_io_bypass_2_bits_fflagdata_bits_uop_prs1),
    .io_bypass_2_bits_fflagdata_bits_uop_prs2(alu_io_bypass_2_bits_fflagdata_bits_uop_prs2),
    .io_bypass_2_bits_fflagdata_bits_uop_prs3(alu_io_bypass_2_bits_fflagdata_bits_uop_prs3),
    .io_bypass_2_bits_fflagdata_bits_uop_ppred(alu_io_bypass_2_bits_fflagdata_bits_uop_ppred),
    .io_bypass_2_bits_fflagdata_bits_uop_prs1_busy(alu_io_bypass_2_bits_fflagdata_bits_uop_prs1_busy),
    .io_bypass_2_bits_fflagdata_bits_uop_prs2_busy(alu_io_bypass_2_bits_fflagdata_bits_uop_prs2_busy),
    .io_bypass_2_bits_fflagdata_bits_uop_prs3_busy(alu_io_bypass_2_bits_fflagdata_bits_uop_prs3_busy),
    .io_bypass_2_bits_fflagdata_bits_uop_ppred_busy(alu_io_bypass_2_bits_fflagdata_bits_uop_ppred_busy),
    .io_bypass_2_bits_fflagdata_bits_uop_stale_pdst(alu_io_bypass_2_bits_fflagdata_bits_uop_stale_pdst),
    .io_bypass_2_bits_fflagdata_bits_uop_exception(alu_io_bypass_2_bits_fflagdata_bits_uop_exception),
    .io_bypass_2_bits_fflagdata_bits_uop_exc_cause(alu_io_bypass_2_bits_fflagdata_bits_uop_exc_cause),
    .io_bypass_2_bits_fflagdata_bits_uop_bypassable(alu_io_bypass_2_bits_fflagdata_bits_uop_bypassable),
    .io_bypass_2_bits_fflagdata_bits_uop_mem_cmd(alu_io_bypass_2_bits_fflagdata_bits_uop_mem_cmd),
    .io_bypass_2_bits_fflagdata_bits_uop_mem_size(alu_io_bypass_2_bits_fflagdata_bits_uop_mem_size),
    .io_bypass_2_bits_fflagdata_bits_uop_mem_signed(alu_io_bypass_2_bits_fflagdata_bits_uop_mem_signed),
    .io_bypass_2_bits_fflagdata_bits_uop_is_fence(alu_io_bypass_2_bits_fflagdata_bits_uop_is_fence),
    .io_bypass_2_bits_fflagdata_bits_uop_is_fencei(alu_io_bypass_2_bits_fflagdata_bits_uop_is_fencei),
    .io_bypass_2_bits_fflagdata_bits_uop_is_amo(alu_io_bypass_2_bits_fflagdata_bits_uop_is_amo),
    .io_bypass_2_bits_fflagdata_bits_uop_uses_ldq(alu_io_bypass_2_bits_fflagdata_bits_uop_uses_ldq),
    .io_bypass_2_bits_fflagdata_bits_uop_uses_stq(alu_io_bypass_2_bits_fflagdata_bits_uop_uses_stq),
    .io_bypass_2_bits_fflagdata_bits_uop_is_sys_pc2epc(alu_io_bypass_2_bits_fflagdata_bits_uop_is_sys_pc2epc),
    .io_bypass_2_bits_fflagdata_bits_uop_is_unique(alu_io_bypass_2_bits_fflagdata_bits_uop_is_unique),
    .io_bypass_2_bits_fflagdata_bits_uop_flush_on_commit(alu_io_bypass_2_bits_fflagdata_bits_uop_flush_on_commit),
    .io_bypass_2_bits_fflagdata_bits_uop_ldst_is_rs1(alu_io_bypass_2_bits_fflagdata_bits_uop_ldst_is_rs1),
    .io_bypass_2_bits_fflagdata_bits_uop_ldst(alu_io_bypass_2_bits_fflagdata_bits_uop_ldst),
    .io_bypass_2_bits_fflagdata_bits_uop_lrs1(alu_io_bypass_2_bits_fflagdata_bits_uop_lrs1),
    .io_bypass_2_bits_fflagdata_bits_uop_lrs2(alu_io_bypass_2_bits_fflagdata_bits_uop_lrs2),
    .io_bypass_2_bits_fflagdata_bits_uop_lrs3(alu_io_bypass_2_bits_fflagdata_bits_uop_lrs3),
    .io_bypass_2_bits_fflagdata_bits_uop_ldst_val(alu_io_bypass_2_bits_fflagdata_bits_uop_ldst_val),
    .io_bypass_2_bits_fflagdata_bits_uop_dst_rtype(alu_io_bypass_2_bits_fflagdata_bits_uop_dst_rtype),
    .io_bypass_2_bits_fflagdata_bits_uop_lrs1_rtype(alu_io_bypass_2_bits_fflagdata_bits_uop_lrs1_rtype),
    .io_bypass_2_bits_fflagdata_bits_uop_lrs2_rtype(alu_io_bypass_2_bits_fflagdata_bits_uop_lrs2_rtype),
    .io_bypass_2_bits_fflagdata_bits_uop_frs3_en(alu_io_bypass_2_bits_fflagdata_bits_uop_frs3_en),
    .io_bypass_2_bits_fflagdata_bits_uop_fp_val(alu_io_bypass_2_bits_fflagdata_bits_uop_fp_val),
    .io_bypass_2_bits_fflagdata_bits_uop_fp_single(alu_io_bypass_2_bits_fflagdata_bits_uop_fp_single),
    .io_bypass_2_bits_fflagdata_bits_uop_xcpt_pf_if(alu_io_bypass_2_bits_fflagdata_bits_uop_xcpt_pf_if),
    .io_bypass_2_bits_fflagdata_bits_uop_xcpt_ae_if(alu_io_bypass_2_bits_fflagdata_bits_uop_xcpt_ae_if),
    .io_bypass_2_bits_fflagdata_bits_uop_xcpt_ma_if(alu_io_bypass_2_bits_fflagdata_bits_uop_xcpt_ma_if),
    .io_bypass_2_bits_fflagdata_bits_uop_bp_debug_if(alu_io_bypass_2_bits_fflagdata_bits_uop_bp_debug_if),
    .io_bypass_2_bits_fflagdata_bits_uop_bp_xcpt_if(alu_io_bypass_2_bits_fflagdata_bits_uop_bp_xcpt_if),
    .io_bypass_2_bits_fflagdata_bits_uop_debug_fsrc(alu_io_bypass_2_bits_fflagdata_bits_uop_debug_fsrc),
    .io_bypass_2_bits_fflagdata_bits_uop_debug_tsrc(alu_io_bypass_2_bits_fflagdata_bits_uop_debug_tsrc),
    .io_bypass_2_bits_fflagdata_bits_fflag(alu_io_bypass_2_bits_fflagdata_bits_fflag),
    .io_brinfo_uop_switch(alu_io_brinfo_uop_switch),
    .io_brinfo_uop_switch_off(alu_io_brinfo_uop_switch_off),
    .io_brinfo_uop_is_unicore(alu_io_brinfo_uop_is_unicore),
    .io_brinfo_uop_shift(alu_io_brinfo_uop_shift),
    .io_brinfo_uop_lrs3_rtype(alu_io_brinfo_uop_lrs3_rtype),
    .io_brinfo_uop_rflag(alu_io_brinfo_uop_rflag),
    .io_brinfo_uop_wflag(alu_io_brinfo_uop_wflag),
    .io_brinfo_uop_prflag(alu_io_brinfo_uop_prflag),
    .io_brinfo_uop_pwflag(alu_io_brinfo_uop_pwflag),
    .io_brinfo_uop_pflag_busy(alu_io_brinfo_uop_pflag_busy),
    .io_brinfo_uop_stale_pflag(alu_io_brinfo_uop_stale_pflag),
    .io_brinfo_uop_op1_sel(alu_io_brinfo_uop_op1_sel),
    .io_brinfo_uop_op2_sel(alu_io_brinfo_uop_op2_sel),
    .io_brinfo_uop_split_num(alu_io_brinfo_uop_split_num),
    .io_brinfo_uop_self_index(alu_io_brinfo_uop_self_index),
    .io_brinfo_uop_rob_inst_idx(alu_io_brinfo_uop_rob_inst_idx),
    .io_brinfo_uop_address_num(alu_io_brinfo_uop_address_num),
    .io_brinfo_uop_uopc(alu_io_brinfo_uop_uopc),
    .io_brinfo_uop_inst(alu_io_brinfo_uop_inst),
    .io_brinfo_uop_debug_inst(alu_io_brinfo_uop_debug_inst),
    .io_brinfo_uop_is_rvc(alu_io_brinfo_uop_is_rvc),
    .io_brinfo_uop_debug_pc(alu_io_brinfo_uop_debug_pc),
    .io_brinfo_uop_iq_type(alu_io_brinfo_uop_iq_type),
    .io_brinfo_uop_fu_code(alu_io_brinfo_uop_fu_code),
    .io_brinfo_uop_ctrl_br_type(alu_io_brinfo_uop_ctrl_br_type),
    .io_brinfo_uop_ctrl_op1_sel(alu_io_brinfo_uop_ctrl_op1_sel),
    .io_brinfo_uop_ctrl_op2_sel(alu_io_brinfo_uop_ctrl_op2_sel),
    .io_brinfo_uop_ctrl_imm_sel(alu_io_brinfo_uop_ctrl_imm_sel),
    .io_brinfo_uop_ctrl_op_fcn(alu_io_brinfo_uop_ctrl_op_fcn),
    .io_brinfo_uop_ctrl_fcn_dw(alu_io_brinfo_uop_ctrl_fcn_dw),
    .io_brinfo_uop_ctrl_csr_cmd(alu_io_brinfo_uop_ctrl_csr_cmd),
    .io_brinfo_uop_ctrl_is_load(alu_io_brinfo_uop_ctrl_is_load),
    .io_brinfo_uop_ctrl_is_sta(alu_io_brinfo_uop_ctrl_is_sta),
    .io_brinfo_uop_ctrl_is_std(alu_io_brinfo_uop_ctrl_is_std),
    .io_brinfo_uop_ctrl_op3_sel(alu_io_brinfo_uop_ctrl_op3_sel),
    .io_brinfo_uop_iw_state(alu_io_brinfo_uop_iw_state),
    .io_brinfo_uop_iw_p1_poisoned(alu_io_brinfo_uop_iw_p1_poisoned),
    .io_brinfo_uop_iw_p2_poisoned(alu_io_brinfo_uop_iw_p2_poisoned),
    .io_brinfo_uop_is_br(alu_io_brinfo_uop_is_br),
    .io_brinfo_uop_is_jalr(alu_io_brinfo_uop_is_jalr),
    .io_brinfo_uop_is_jal(alu_io_brinfo_uop_is_jal),
    .io_brinfo_uop_is_sfb(alu_io_brinfo_uop_is_sfb),
    .io_brinfo_uop_br_mask(alu_io_brinfo_uop_br_mask),
    .io_brinfo_uop_br_tag(alu_io_brinfo_uop_br_tag),
    .io_brinfo_uop_ftq_idx(alu_io_brinfo_uop_ftq_idx),
    .io_brinfo_uop_edge_inst(alu_io_brinfo_uop_edge_inst),
    .io_brinfo_uop_pc_lob(alu_io_brinfo_uop_pc_lob),
    .io_brinfo_uop_taken(alu_io_brinfo_uop_taken),
    .io_brinfo_uop_imm_packed(alu_io_brinfo_uop_imm_packed),
    .io_brinfo_uop_csr_addr(alu_io_brinfo_uop_csr_addr),
    .io_brinfo_uop_rob_idx(alu_io_brinfo_uop_rob_idx),
    .io_brinfo_uop_ldq_idx(alu_io_brinfo_uop_ldq_idx),
    .io_brinfo_uop_stq_idx(alu_io_brinfo_uop_stq_idx),
    .io_brinfo_uop_rxq_idx(alu_io_brinfo_uop_rxq_idx),
    .io_brinfo_uop_pdst(alu_io_brinfo_uop_pdst),
    .io_brinfo_uop_prs1(alu_io_brinfo_uop_prs1),
    .io_brinfo_uop_prs2(alu_io_brinfo_uop_prs2),
    .io_brinfo_uop_prs3(alu_io_brinfo_uop_prs3),
    .io_brinfo_uop_ppred(alu_io_brinfo_uop_ppred),
    .io_brinfo_uop_prs1_busy(alu_io_brinfo_uop_prs1_busy),
    .io_brinfo_uop_prs2_busy(alu_io_brinfo_uop_prs2_busy),
    .io_brinfo_uop_prs3_busy(alu_io_brinfo_uop_prs3_busy),
    .io_brinfo_uop_ppred_busy(alu_io_brinfo_uop_ppred_busy),
    .io_brinfo_uop_stale_pdst(alu_io_brinfo_uop_stale_pdst),
    .io_brinfo_uop_exception(alu_io_brinfo_uop_exception),
    .io_brinfo_uop_exc_cause(alu_io_brinfo_uop_exc_cause),
    .io_brinfo_uop_bypassable(alu_io_brinfo_uop_bypassable),
    .io_brinfo_uop_mem_cmd(alu_io_brinfo_uop_mem_cmd),
    .io_brinfo_uop_mem_size(alu_io_brinfo_uop_mem_size),
    .io_brinfo_uop_mem_signed(alu_io_brinfo_uop_mem_signed),
    .io_brinfo_uop_is_fence(alu_io_brinfo_uop_is_fence),
    .io_brinfo_uop_is_fencei(alu_io_brinfo_uop_is_fencei),
    .io_brinfo_uop_is_amo(alu_io_brinfo_uop_is_amo),
    .io_brinfo_uop_uses_ldq(alu_io_brinfo_uop_uses_ldq),
    .io_brinfo_uop_uses_stq(alu_io_brinfo_uop_uses_stq),
    .io_brinfo_uop_is_sys_pc2epc(alu_io_brinfo_uop_is_sys_pc2epc),
    .io_brinfo_uop_is_unique(alu_io_brinfo_uop_is_unique),
    .io_brinfo_uop_flush_on_commit(alu_io_brinfo_uop_flush_on_commit),
    .io_brinfo_uop_ldst_is_rs1(alu_io_brinfo_uop_ldst_is_rs1),
    .io_brinfo_uop_ldst(alu_io_brinfo_uop_ldst),
    .io_brinfo_uop_lrs1(alu_io_brinfo_uop_lrs1),
    .io_brinfo_uop_lrs2(alu_io_brinfo_uop_lrs2),
    .io_brinfo_uop_lrs3(alu_io_brinfo_uop_lrs3),
    .io_brinfo_uop_ldst_val(alu_io_brinfo_uop_ldst_val),
    .io_brinfo_uop_dst_rtype(alu_io_brinfo_uop_dst_rtype),
    .io_brinfo_uop_lrs1_rtype(alu_io_brinfo_uop_lrs1_rtype),
    .io_brinfo_uop_lrs2_rtype(alu_io_brinfo_uop_lrs2_rtype),
    .io_brinfo_uop_frs3_en(alu_io_brinfo_uop_frs3_en),
    .io_brinfo_uop_fp_val(alu_io_brinfo_uop_fp_val),
    .io_brinfo_uop_fp_single(alu_io_brinfo_uop_fp_single),
    .io_brinfo_uop_xcpt_pf_if(alu_io_brinfo_uop_xcpt_pf_if),
    .io_brinfo_uop_xcpt_ae_if(alu_io_brinfo_uop_xcpt_ae_if),
    .io_brinfo_uop_xcpt_ma_if(alu_io_brinfo_uop_xcpt_ma_if),
    .io_brinfo_uop_bp_debug_if(alu_io_brinfo_uop_bp_debug_if),
    .io_brinfo_uop_bp_xcpt_if(alu_io_brinfo_uop_bp_xcpt_if),
    .io_brinfo_uop_debug_fsrc(alu_io_brinfo_uop_debug_fsrc),
    .io_brinfo_uop_debug_tsrc(alu_io_brinfo_uop_debug_tsrc),
    .io_brinfo_valid(alu_io_brinfo_valid),
    .io_brinfo_mispredict(alu_io_brinfo_mispredict),
    .io_brinfo_taken(alu_io_brinfo_taken),
    .io_brinfo_cfi_type(alu_io_brinfo_cfi_type),
    .io_brinfo_pc_sel(alu_io_brinfo_pc_sel),
    .io_brinfo_jalr_target(alu_io_brinfo_jalr_target),
    .io_brinfo_target_offset(alu_io_brinfo_target_offset),
    .io_get_ftq_pc_ftq_idx(alu_io_get_ftq_pc_ftq_idx),
    .io_get_ftq_pc_entry_cfi_idx_valid(alu_io_get_ftq_pc_entry_cfi_idx_valid),
    .io_get_ftq_pc_entry_cfi_idx_bits(alu_io_get_ftq_pc_entry_cfi_idx_bits),
    .io_get_ftq_pc_entry_cfi_taken(alu_io_get_ftq_pc_entry_cfi_taken),
    .io_get_ftq_pc_entry_cfi_mispredicted(alu_io_get_ftq_pc_entry_cfi_mispredicted),
    .io_get_ftq_pc_entry_cfi_type(alu_io_get_ftq_pc_entry_cfi_type),
    .io_get_ftq_pc_entry_br_mask(alu_io_get_ftq_pc_entry_br_mask),
    .io_get_ftq_pc_entry_cfi_is_call(alu_io_get_ftq_pc_entry_cfi_is_call),
    .io_get_ftq_pc_entry_cfi_is_ret(alu_io_get_ftq_pc_entry_cfi_is_ret),
    .io_get_ftq_pc_entry_cfi_npc_plus4(alu_io_get_ftq_pc_entry_cfi_npc_plus4),
    .io_get_ftq_pc_entry_ras_top(alu_io_get_ftq_pc_entry_ras_top),
    .io_get_ftq_pc_entry_ras_idx(alu_io_get_ftq_pc_entry_ras_idx),
    .io_get_ftq_pc_entry_start_bank(alu_io_get_ftq_pc_entry_start_bank),
    .io_get_ftq_pc_ghist_old_history(alu_io_get_ftq_pc_ghist_old_history),
    .io_get_ftq_pc_ghist_current_saw_branch_not_taken(alu_io_get_ftq_pc_ghist_current_saw_branch_not_taken),
    .io_get_ftq_pc_ghist_new_saw_branch_not_taken(alu_io_get_ftq_pc_ghist_new_saw_branch_not_taken),
    .io_get_ftq_pc_ghist_new_saw_branch_taken(alu_io_get_ftq_pc_ghist_new_saw_branch_taken),
    .io_get_ftq_pc_ghist_ras_idx(alu_io_get_ftq_pc_ghist_ras_idx),
    .io_get_ftq_pc_pc(alu_io_get_ftq_pc_pc),
    .io_get_ftq_pc_com_pc(alu_io_get_ftq_pc_com_pc),
    .io_get_ftq_pc_next_val(alu_io_get_ftq_pc_next_val),
    .io_get_ftq_pc_next_pc(alu_io_get_ftq_pc_next_pc)
  );
  PipelinedMulUnit imul ( // @[execution-unit.scala 335:18]
    .clock(imul_clock),
    .reset(imul_reset),
    .io_req_ready(imul_io_req_ready),
    .io_req_valid(imul_io_req_valid),
    .io_req_bits_uop_switch(imul_io_req_bits_uop_switch),
    .io_req_bits_uop_switch_off(imul_io_req_bits_uop_switch_off),
    .io_req_bits_uop_is_unicore(imul_io_req_bits_uop_is_unicore),
    .io_req_bits_uop_shift(imul_io_req_bits_uop_shift),
    .io_req_bits_uop_lrs3_rtype(imul_io_req_bits_uop_lrs3_rtype),
    .io_req_bits_uop_rflag(imul_io_req_bits_uop_rflag),
    .io_req_bits_uop_wflag(imul_io_req_bits_uop_wflag),
    .io_req_bits_uop_prflag(imul_io_req_bits_uop_prflag),
    .io_req_bits_uop_pwflag(imul_io_req_bits_uop_pwflag),
    .io_req_bits_uop_pflag_busy(imul_io_req_bits_uop_pflag_busy),
    .io_req_bits_uop_stale_pflag(imul_io_req_bits_uop_stale_pflag),
    .io_req_bits_uop_op1_sel(imul_io_req_bits_uop_op1_sel),
    .io_req_bits_uop_op2_sel(imul_io_req_bits_uop_op2_sel),
    .io_req_bits_uop_split_num(imul_io_req_bits_uop_split_num),
    .io_req_bits_uop_self_index(imul_io_req_bits_uop_self_index),
    .io_req_bits_uop_rob_inst_idx(imul_io_req_bits_uop_rob_inst_idx),
    .io_req_bits_uop_address_num(imul_io_req_bits_uop_address_num),
    .io_req_bits_uop_uopc(imul_io_req_bits_uop_uopc),
    .io_req_bits_uop_inst(imul_io_req_bits_uop_inst),
    .io_req_bits_uop_debug_inst(imul_io_req_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc(imul_io_req_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc(imul_io_req_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type(imul_io_req_bits_uop_iq_type),
    .io_req_bits_uop_fu_code(imul_io_req_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type(imul_io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel(imul_io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel(imul_io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel(imul_io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn(imul_io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw(imul_io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd(imul_io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load(imul_io_req_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta(imul_io_req_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std(imul_io_req_bits_uop_ctrl_is_std),
    .io_req_bits_uop_ctrl_op3_sel(imul_io_req_bits_uop_ctrl_op3_sel),
    .io_req_bits_uop_iw_state(imul_io_req_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned(imul_io_req_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned(imul_io_req_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br(imul_io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr(imul_io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal(imul_io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb(imul_io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask(imul_io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag(imul_io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx(imul_io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst(imul_io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob(imul_io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken(imul_io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed(imul_io_req_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr(imul_io_req_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx(imul_io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx(imul_io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx(imul_io_req_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx(imul_io_req_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst(imul_io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1(imul_io_req_bits_uop_prs1),
    .io_req_bits_uop_prs2(imul_io_req_bits_uop_prs2),
    .io_req_bits_uop_prs3(imul_io_req_bits_uop_prs3),
    .io_req_bits_uop_ppred(imul_io_req_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy(imul_io_req_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy(imul_io_req_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy(imul_io_req_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy(imul_io_req_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst(imul_io_req_bits_uop_stale_pdst),
    .io_req_bits_uop_exception(imul_io_req_bits_uop_exception),
    .io_req_bits_uop_exc_cause(imul_io_req_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable(imul_io_req_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd(imul_io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size(imul_io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed(imul_io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence(imul_io_req_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei(imul_io_req_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo(imul_io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq(imul_io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq(imul_io_req_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc(imul_io_req_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique(imul_io_req_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit(imul_io_req_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1(imul_io_req_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst(imul_io_req_bits_uop_ldst),
    .io_req_bits_uop_lrs1(imul_io_req_bits_uop_lrs1),
    .io_req_bits_uop_lrs2(imul_io_req_bits_uop_lrs2),
    .io_req_bits_uop_lrs3(imul_io_req_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val(imul_io_req_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype(imul_io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype(imul_io_req_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype(imul_io_req_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en(imul_io_req_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val(imul_io_req_bits_uop_fp_val),
    .io_req_bits_uop_fp_single(imul_io_req_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if(imul_io_req_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if(imul_io_req_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if(imul_io_req_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if(imul_io_req_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if(imul_io_req_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc(imul_io_req_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc(imul_io_req_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data(imul_io_req_bits_rs1_data),
    .io_req_bits_rs2_data(imul_io_req_bits_rs2_data),
    .io_req_bits_rs3_data(imul_io_req_bits_rs3_data),
    .io_req_bits_pred_data(imul_io_req_bits_pred_data),
    .io_req_bits_flagdata(imul_io_req_bits_flagdata),
    .io_req_bits_fflagdata(imul_io_req_bits_fflagdata),
    .io_req_bits_kill(imul_io_req_bits_kill),
    .io_resp_ready(imul_io_resp_ready),
    .io_resp_valid(imul_io_resp_valid),
    .io_resp_bits_uop_switch(imul_io_resp_bits_uop_switch),
    .io_resp_bits_uop_switch_off(imul_io_resp_bits_uop_switch_off),
    .io_resp_bits_uop_is_unicore(imul_io_resp_bits_uop_is_unicore),
    .io_resp_bits_uop_shift(imul_io_resp_bits_uop_shift),
    .io_resp_bits_uop_lrs3_rtype(imul_io_resp_bits_uop_lrs3_rtype),
    .io_resp_bits_uop_rflag(imul_io_resp_bits_uop_rflag),
    .io_resp_bits_uop_wflag(imul_io_resp_bits_uop_wflag),
    .io_resp_bits_uop_prflag(imul_io_resp_bits_uop_prflag),
    .io_resp_bits_uop_pwflag(imul_io_resp_bits_uop_pwflag),
    .io_resp_bits_uop_pflag_busy(imul_io_resp_bits_uop_pflag_busy),
    .io_resp_bits_uop_stale_pflag(imul_io_resp_bits_uop_stale_pflag),
    .io_resp_bits_uop_op1_sel(imul_io_resp_bits_uop_op1_sel),
    .io_resp_bits_uop_op2_sel(imul_io_resp_bits_uop_op2_sel),
    .io_resp_bits_uop_split_num(imul_io_resp_bits_uop_split_num),
    .io_resp_bits_uop_self_index(imul_io_resp_bits_uop_self_index),
    .io_resp_bits_uop_rob_inst_idx(imul_io_resp_bits_uop_rob_inst_idx),
    .io_resp_bits_uop_address_num(imul_io_resp_bits_uop_address_num),
    .io_resp_bits_uop_uopc(imul_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(imul_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(imul_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(imul_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(imul_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(imul_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(imul_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(imul_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(imul_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(imul_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(imul_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(imul_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(imul_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(imul_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(imul_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(imul_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(imul_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_ctrl_op3_sel(imul_io_resp_bits_uop_ctrl_op3_sel),
    .io_resp_bits_uop_iw_state(imul_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(imul_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(imul_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(imul_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(imul_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(imul_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(imul_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(imul_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(imul_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(imul_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(imul_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(imul_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(imul_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(imul_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(imul_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(imul_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(imul_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(imul_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(imul_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(imul_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(imul_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(imul_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(imul_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(imul_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(imul_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(imul_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(imul_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(imul_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(imul_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(imul_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(imul_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(imul_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(imul_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(imul_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(imul_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(imul_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(imul_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(imul_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(imul_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(imul_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(imul_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(imul_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(imul_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(imul_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(imul_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(imul_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(imul_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(imul_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(imul_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(imul_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(imul_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(imul_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(imul_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(imul_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(imul_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(imul_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(imul_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(imul_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(imul_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(imul_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(imul_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(imul_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_predicated(imul_io_resp_bits_predicated),
    .io_resp_bits_data(imul_io_resp_bits_data),
    .io_resp_bits_fflags_valid(imul_io_resp_bits_fflags_valid),
    .io_resp_bits_fflags_bits_uop_switch(imul_io_resp_bits_fflags_bits_uop_switch),
    .io_resp_bits_fflags_bits_uop_switch_off(imul_io_resp_bits_fflags_bits_uop_switch_off),
    .io_resp_bits_fflags_bits_uop_is_unicore(imul_io_resp_bits_fflags_bits_uop_is_unicore),
    .io_resp_bits_fflags_bits_uop_shift(imul_io_resp_bits_fflags_bits_uop_shift),
    .io_resp_bits_fflags_bits_uop_lrs3_rtype(imul_io_resp_bits_fflags_bits_uop_lrs3_rtype),
    .io_resp_bits_fflags_bits_uop_rflag(imul_io_resp_bits_fflags_bits_uop_rflag),
    .io_resp_bits_fflags_bits_uop_wflag(imul_io_resp_bits_fflags_bits_uop_wflag),
    .io_resp_bits_fflags_bits_uop_prflag(imul_io_resp_bits_fflags_bits_uop_prflag),
    .io_resp_bits_fflags_bits_uop_pwflag(imul_io_resp_bits_fflags_bits_uop_pwflag),
    .io_resp_bits_fflags_bits_uop_pflag_busy(imul_io_resp_bits_fflags_bits_uop_pflag_busy),
    .io_resp_bits_fflags_bits_uop_stale_pflag(imul_io_resp_bits_fflags_bits_uop_stale_pflag),
    .io_resp_bits_fflags_bits_uop_op1_sel(imul_io_resp_bits_fflags_bits_uop_op1_sel),
    .io_resp_bits_fflags_bits_uop_op2_sel(imul_io_resp_bits_fflags_bits_uop_op2_sel),
    .io_resp_bits_fflags_bits_uop_split_num(imul_io_resp_bits_fflags_bits_uop_split_num),
    .io_resp_bits_fflags_bits_uop_self_index(imul_io_resp_bits_fflags_bits_uop_self_index),
    .io_resp_bits_fflags_bits_uop_rob_inst_idx(imul_io_resp_bits_fflags_bits_uop_rob_inst_idx),
    .io_resp_bits_fflags_bits_uop_address_num(imul_io_resp_bits_fflags_bits_uop_address_num),
    .io_resp_bits_fflags_bits_uop_uopc(imul_io_resp_bits_fflags_bits_uop_uopc),
    .io_resp_bits_fflags_bits_uop_inst(imul_io_resp_bits_fflags_bits_uop_inst),
    .io_resp_bits_fflags_bits_uop_debug_inst(imul_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_resp_bits_fflags_bits_uop_is_rvc(imul_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_resp_bits_fflags_bits_uop_debug_pc(imul_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_resp_bits_fflags_bits_uop_iq_type(imul_io_resp_bits_fflags_bits_uop_iq_type),
    .io_resp_bits_fflags_bits_uop_fu_code(imul_io_resp_bits_fflags_bits_uop_fu_code),
    .io_resp_bits_fflags_bits_uop_ctrl_br_type(imul_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_resp_bits_fflags_bits_uop_ctrl_op1_sel(imul_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op2_sel(imul_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_imm_sel(imul_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op_fcn(imul_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflags_bits_uop_ctrl_fcn_dw(imul_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflags_bits_uop_ctrl_csr_cmd(imul_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflags_bits_uop_ctrl_is_load(imul_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_resp_bits_fflags_bits_uop_ctrl_is_sta(imul_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflags_bits_uop_ctrl_is_std(imul_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_resp_bits_fflags_bits_uop_ctrl_op3_sel(imul_io_resp_bits_fflags_bits_uop_ctrl_op3_sel),
    .io_resp_bits_fflags_bits_uop_iw_state(imul_io_resp_bits_fflags_bits_uop_iw_state),
    .io_resp_bits_fflags_bits_uop_iw_p1_poisoned(imul_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflags_bits_uop_iw_p2_poisoned(imul_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflags_bits_uop_is_br(imul_io_resp_bits_fflags_bits_uop_is_br),
    .io_resp_bits_fflags_bits_uop_is_jalr(imul_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_resp_bits_fflags_bits_uop_is_jal(imul_io_resp_bits_fflags_bits_uop_is_jal),
    .io_resp_bits_fflags_bits_uop_is_sfb(imul_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_resp_bits_fflags_bits_uop_br_mask(imul_io_resp_bits_fflags_bits_uop_br_mask),
    .io_resp_bits_fflags_bits_uop_br_tag(imul_io_resp_bits_fflags_bits_uop_br_tag),
    .io_resp_bits_fflags_bits_uop_ftq_idx(imul_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_resp_bits_fflags_bits_uop_edge_inst(imul_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_resp_bits_fflags_bits_uop_pc_lob(imul_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_resp_bits_fflags_bits_uop_taken(imul_io_resp_bits_fflags_bits_uop_taken),
    .io_resp_bits_fflags_bits_uop_imm_packed(imul_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_resp_bits_fflags_bits_uop_csr_addr(imul_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_resp_bits_fflags_bits_uop_rob_idx(imul_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_resp_bits_fflags_bits_uop_ldq_idx(imul_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_resp_bits_fflags_bits_uop_stq_idx(imul_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_resp_bits_fflags_bits_uop_rxq_idx(imul_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_resp_bits_fflags_bits_uop_pdst(imul_io_resp_bits_fflags_bits_uop_pdst),
    .io_resp_bits_fflags_bits_uop_prs1(imul_io_resp_bits_fflags_bits_uop_prs1),
    .io_resp_bits_fflags_bits_uop_prs2(imul_io_resp_bits_fflags_bits_uop_prs2),
    .io_resp_bits_fflags_bits_uop_prs3(imul_io_resp_bits_fflags_bits_uop_prs3),
    .io_resp_bits_fflags_bits_uop_ppred(imul_io_resp_bits_fflags_bits_uop_ppred),
    .io_resp_bits_fflags_bits_uop_prs1_busy(imul_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_resp_bits_fflags_bits_uop_prs2_busy(imul_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_resp_bits_fflags_bits_uop_prs3_busy(imul_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_resp_bits_fflags_bits_uop_ppred_busy(imul_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_resp_bits_fflags_bits_uop_stale_pdst(imul_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_resp_bits_fflags_bits_uop_exception(imul_io_resp_bits_fflags_bits_uop_exception),
    .io_resp_bits_fflags_bits_uop_exc_cause(imul_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_resp_bits_fflags_bits_uop_bypassable(imul_io_resp_bits_fflags_bits_uop_bypassable),
    .io_resp_bits_fflags_bits_uop_mem_cmd(imul_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_resp_bits_fflags_bits_uop_mem_size(imul_io_resp_bits_fflags_bits_uop_mem_size),
    .io_resp_bits_fflags_bits_uop_mem_signed(imul_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_resp_bits_fflags_bits_uop_is_fence(imul_io_resp_bits_fflags_bits_uop_is_fence),
    .io_resp_bits_fflags_bits_uop_is_fencei(imul_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_resp_bits_fflags_bits_uop_is_amo(imul_io_resp_bits_fflags_bits_uop_is_amo),
    .io_resp_bits_fflags_bits_uop_uses_ldq(imul_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_resp_bits_fflags_bits_uop_uses_stq(imul_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_resp_bits_fflags_bits_uop_is_sys_pc2epc(imul_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflags_bits_uop_is_unique(imul_io_resp_bits_fflags_bits_uop_is_unique),
    .io_resp_bits_fflags_bits_uop_flush_on_commit(imul_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_resp_bits_fflags_bits_uop_ldst_is_rs1(imul_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflags_bits_uop_ldst(imul_io_resp_bits_fflags_bits_uop_ldst),
    .io_resp_bits_fflags_bits_uop_lrs1(imul_io_resp_bits_fflags_bits_uop_lrs1),
    .io_resp_bits_fflags_bits_uop_lrs2(imul_io_resp_bits_fflags_bits_uop_lrs2),
    .io_resp_bits_fflags_bits_uop_lrs3(imul_io_resp_bits_fflags_bits_uop_lrs3),
    .io_resp_bits_fflags_bits_uop_ldst_val(imul_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_resp_bits_fflags_bits_uop_dst_rtype(imul_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_resp_bits_fflags_bits_uop_lrs1_rtype(imul_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_resp_bits_fflags_bits_uop_lrs2_rtype(imul_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_resp_bits_fflags_bits_uop_frs3_en(imul_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_resp_bits_fflags_bits_uop_fp_val(imul_io_resp_bits_fflags_bits_uop_fp_val),
    .io_resp_bits_fflags_bits_uop_fp_single(imul_io_resp_bits_fflags_bits_uop_fp_single),
    .io_resp_bits_fflags_bits_uop_xcpt_pf_if(imul_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ae_if(imul_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ma_if(imul_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflags_bits_uop_bp_debug_if(imul_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_resp_bits_fflags_bits_uop_bp_xcpt_if(imul_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflags_bits_uop_debug_fsrc(imul_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_resp_bits_fflags_bits_uop_debug_tsrc(imul_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_resp_bits_fflags_bits_flags(imul_io_resp_bits_fflags_bits_flags),
    .io_resp_bits_addr(imul_io_resp_bits_addr),
    .io_resp_bits_mxcpt_valid(imul_io_resp_bits_mxcpt_valid),
    .io_resp_bits_mxcpt_bits(imul_io_resp_bits_mxcpt_bits),
    .io_resp_bits_sfence_valid(imul_io_resp_bits_sfence_valid),
    .io_resp_bits_sfence_bits_rs1(imul_io_resp_bits_sfence_bits_rs1),
    .io_resp_bits_sfence_bits_rs2(imul_io_resp_bits_sfence_bits_rs2),
    .io_resp_bits_sfence_bits_addr(imul_io_resp_bits_sfence_bits_addr),
    .io_resp_bits_sfence_bits_asid(imul_io_resp_bits_sfence_bits_asid),
    .io_resp_bits_flagdata(imul_io_resp_bits_flagdata),
    .io_resp_bits_fflagdata_valid(imul_io_resp_bits_fflagdata_valid),
    .io_resp_bits_fflagdata_bits_uop_switch(imul_io_resp_bits_fflagdata_bits_uop_switch),
    .io_resp_bits_fflagdata_bits_uop_switch_off(imul_io_resp_bits_fflagdata_bits_uop_switch_off),
    .io_resp_bits_fflagdata_bits_uop_is_unicore(imul_io_resp_bits_fflagdata_bits_uop_is_unicore),
    .io_resp_bits_fflagdata_bits_uop_shift(imul_io_resp_bits_fflagdata_bits_uop_shift),
    .io_resp_bits_fflagdata_bits_uop_lrs3_rtype(imul_io_resp_bits_fflagdata_bits_uop_lrs3_rtype),
    .io_resp_bits_fflagdata_bits_uop_rflag(imul_io_resp_bits_fflagdata_bits_uop_rflag),
    .io_resp_bits_fflagdata_bits_uop_wflag(imul_io_resp_bits_fflagdata_bits_uop_wflag),
    .io_resp_bits_fflagdata_bits_uop_prflag(imul_io_resp_bits_fflagdata_bits_uop_prflag),
    .io_resp_bits_fflagdata_bits_uop_pwflag(imul_io_resp_bits_fflagdata_bits_uop_pwflag),
    .io_resp_bits_fflagdata_bits_uop_pflag_busy(imul_io_resp_bits_fflagdata_bits_uop_pflag_busy),
    .io_resp_bits_fflagdata_bits_uop_stale_pflag(imul_io_resp_bits_fflagdata_bits_uop_stale_pflag),
    .io_resp_bits_fflagdata_bits_uop_op1_sel(imul_io_resp_bits_fflagdata_bits_uop_op1_sel),
    .io_resp_bits_fflagdata_bits_uop_op2_sel(imul_io_resp_bits_fflagdata_bits_uop_op2_sel),
    .io_resp_bits_fflagdata_bits_uop_split_num(imul_io_resp_bits_fflagdata_bits_uop_split_num),
    .io_resp_bits_fflagdata_bits_uop_self_index(imul_io_resp_bits_fflagdata_bits_uop_self_index),
    .io_resp_bits_fflagdata_bits_uop_rob_inst_idx(imul_io_resp_bits_fflagdata_bits_uop_rob_inst_idx),
    .io_resp_bits_fflagdata_bits_uop_address_num(imul_io_resp_bits_fflagdata_bits_uop_address_num),
    .io_resp_bits_fflagdata_bits_uop_uopc(imul_io_resp_bits_fflagdata_bits_uop_uopc),
    .io_resp_bits_fflagdata_bits_uop_inst(imul_io_resp_bits_fflagdata_bits_uop_inst),
    .io_resp_bits_fflagdata_bits_uop_debug_inst(imul_io_resp_bits_fflagdata_bits_uop_debug_inst),
    .io_resp_bits_fflagdata_bits_uop_is_rvc(imul_io_resp_bits_fflagdata_bits_uop_is_rvc),
    .io_resp_bits_fflagdata_bits_uop_debug_pc(imul_io_resp_bits_fflagdata_bits_uop_debug_pc),
    .io_resp_bits_fflagdata_bits_uop_iq_type(imul_io_resp_bits_fflagdata_bits_uop_iq_type),
    .io_resp_bits_fflagdata_bits_uop_fu_code(imul_io_resp_bits_fflagdata_bits_uop_fu_code),
    .io_resp_bits_fflagdata_bits_uop_ctrl_br_type(imul_io_resp_bits_fflagdata_bits_uop_ctrl_br_type),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel(imul_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel(imul_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel(imul_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn(imul_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw(imul_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd(imul_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_load(imul_io_resp_bits_fflagdata_bits_uop_ctrl_is_load),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_sta(imul_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_std(imul_io_resp_bits_fflagdata_bits_uop_ctrl_is_std),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel(imul_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel),
    .io_resp_bits_fflagdata_bits_uop_iw_state(imul_io_resp_bits_fflagdata_bits_uop_iw_state),
    .io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned(imul_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned(imul_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflagdata_bits_uop_is_br(imul_io_resp_bits_fflagdata_bits_uop_is_br),
    .io_resp_bits_fflagdata_bits_uop_is_jalr(imul_io_resp_bits_fflagdata_bits_uop_is_jalr),
    .io_resp_bits_fflagdata_bits_uop_is_jal(imul_io_resp_bits_fflagdata_bits_uop_is_jal),
    .io_resp_bits_fflagdata_bits_uop_is_sfb(imul_io_resp_bits_fflagdata_bits_uop_is_sfb),
    .io_resp_bits_fflagdata_bits_uop_br_mask(imul_io_resp_bits_fflagdata_bits_uop_br_mask),
    .io_resp_bits_fflagdata_bits_uop_br_tag(imul_io_resp_bits_fflagdata_bits_uop_br_tag),
    .io_resp_bits_fflagdata_bits_uop_ftq_idx(imul_io_resp_bits_fflagdata_bits_uop_ftq_idx),
    .io_resp_bits_fflagdata_bits_uop_edge_inst(imul_io_resp_bits_fflagdata_bits_uop_edge_inst),
    .io_resp_bits_fflagdata_bits_uop_pc_lob(imul_io_resp_bits_fflagdata_bits_uop_pc_lob),
    .io_resp_bits_fflagdata_bits_uop_taken(imul_io_resp_bits_fflagdata_bits_uop_taken),
    .io_resp_bits_fflagdata_bits_uop_imm_packed(imul_io_resp_bits_fflagdata_bits_uop_imm_packed),
    .io_resp_bits_fflagdata_bits_uop_csr_addr(imul_io_resp_bits_fflagdata_bits_uop_csr_addr),
    .io_resp_bits_fflagdata_bits_uop_rob_idx(imul_io_resp_bits_fflagdata_bits_uop_rob_idx),
    .io_resp_bits_fflagdata_bits_uop_ldq_idx(imul_io_resp_bits_fflagdata_bits_uop_ldq_idx),
    .io_resp_bits_fflagdata_bits_uop_stq_idx(imul_io_resp_bits_fflagdata_bits_uop_stq_idx),
    .io_resp_bits_fflagdata_bits_uop_rxq_idx(imul_io_resp_bits_fflagdata_bits_uop_rxq_idx),
    .io_resp_bits_fflagdata_bits_uop_pdst(imul_io_resp_bits_fflagdata_bits_uop_pdst),
    .io_resp_bits_fflagdata_bits_uop_prs1(imul_io_resp_bits_fflagdata_bits_uop_prs1),
    .io_resp_bits_fflagdata_bits_uop_prs2(imul_io_resp_bits_fflagdata_bits_uop_prs2),
    .io_resp_bits_fflagdata_bits_uop_prs3(imul_io_resp_bits_fflagdata_bits_uop_prs3),
    .io_resp_bits_fflagdata_bits_uop_ppred(imul_io_resp_bits_fflagdata_bits_uop_ppred),
    .io_resp_bits_fflagdata_bits_uop_prs1_busy(imul_io_resp_bits_fflagdata_bits_uop_prs1_busy),
    .io_resp_bits_fflagdata_bits_uop_prs2_busy(imul_io_resp_bits_fflagdata_bits_uop_prs2_busy),
    .io_resp_bits_fflagdata_bits_uop_prs3_busy(imul_io_resp_bits_fflagdata_bits_uop_prs3_busy),
    .io_resp_bits_fflagdata_bits_uop_ppred_busy(imul_io_resp_bits_fflagdata_bits_uop_ppred_busy),
    .io_resp_bits_fflagdata_bits_uop_stale_pdst(imul_io_resp_bits_fflagdata_bits_uop_stale_pdst),
    .io_resp_bits_fflagdata_bits_uop_exception(imul_io_resp_bits_fflagdata_bits_uop_exception),
    .io_resp_bits_fflagdata_bits_uop_exc_cause(imul_io_resp_bits_fflagdata_bits_uop_exc_cause),
    .io_resp_bits_fflagdata_bits_uop_bypassable(imul_io_resp_bits_fflagdata_bits_uop_bypassable),
    .io_resp_bits_fflagdata_bits_uop_mem_cmd(imul_io_resp_bits_fflagdata_bits_uop_mem_cmd),
    .io_resp_bits_fflagdata_bits_uop_mem_size(imul_io_resp_bits_fflagdata_bits_uop_mem_size),
    .io_resp_bits_fflagdata_bits_uop_mem_signed(imul_io_resp_bits_fflagdata_bits_uop_mem_signed),
    .io_resp_bits_fflagdata_bits_uop_is_fence(imul_io_resp_bits_fflagdata_bits_uop_is_fence),
    .io_resp_bits_fflagdata_bits_uop_is_fencei(imul_io_resp_bits_fflagdata_bits_uop_is_fencei),
    .io_resp_bits_fflagdata_bits_uop_is_amo(imul_io_resp_bits_fflagdata_bits_uop_is_amo),
    .io_resp_bits_fflagdata_bits_uop_uses_ldq(imul_io_resp_bits_fflagdata_bits_uop_uses_ldq),
    .io_resp_bits_fflagdata_bits_uop_uses_stq(imul_io_resp_bits_fflagdata_bits_uop_uses_stq),
    .io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc(imul_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflagdata_bits_uop_is_unique(imul_io_resp_bits_fflagdata_bits_uop_is_unique),
    .io_resp_bits_fflagdata_bits_uop_flush_on_commit(imul_io_resp_bits_fflagdata_bits_uop_flush_on_commit),
    .io_resp_bits_fflagdata_bits_uop_ldst_is_rs1(imul_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflagdata_bits_uop_ldst(imul_io_resp_bits_fflagdata_bits_uop_ldst),
    .io_resp_bits_fflagdata_bits_uop_lrs1(imul_io_resp_bits_fflagdata_bits_uop_lrs1),
    .io_resp_bits_fflagdata_bits_uop_lrs2(imul_io_resp_bits_fflagdata_bits_uop_lrs2),
    .io_resp_bits_fflagdata_bits_uop_lrs3(imul_io_resp_bits_fflagdata_bits_uop_lrs3),
    .io_resp_bits_fflagdata_bits_uop_ldst_val(imul_io_resp_bits_fflagdata_bits_uop_ldst_val),
    .io_resp_bits_fflagdata_bits_uop_dst_rtype(imul_io_resp_bits_fflagdata_bits_uop_dst_rtype),
    .io_resp_bits_fflagdata_bits_uop_lrs1_rtype(imul_io_resp_bits_fflagdata_bits_uop_lrs1_rtype),
    .io_resp_bits_fflagdata_bits_uop_lrs2_rtype(imul_io_resp_bits_fflagdata_bits_uop_lrs2_rtype),
    .io_resp_bits_fflagdata_bits_uop_frs3_en(imul_io_resp_bits_fflagdata_bits_uop_frs3_en),
    .io_resp_bits_fflagdata_bits_uop_fp_val(imul_io_resp_bits_fflagdata_bits_uop_fp_val),
    .io_resp_bits_fflagdata_bits_uop_fp_single(imul_io_resp_bits_fflagdata_bits_uop_fp_single),
    .io_resp_bits_fflagdata_bits_uop_xcpt_pf_if(imul_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflagdata_bits_uop_xcpt_ae_if(imul_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflagdata_bits_uop_xcpt_ma_if(imul_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflagdata_bits_uop_bp_debug_if(imul_io_resp_bits_fflagdata_bits_uop_bp_debug_if),
    .io_resp_bits_fflagdata_bits_uop_bp_xcpt_if(imul_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflagdata_bits_uop_debug_fsrc(imul_io_resp_bits_fflagdata_bits_uop_debug_fsrc),
    .io_resp_bits_fflagdata_bits_uop_debug_tsrc(imul_io_resp_bits_fflagdata_bits_uop_debug_tsrc),
    .io_resp_bits_fflagdata_bits_fflag(imul_io_resp_bits_fflagdata_bits_fflag),
    .io_brupdate_b1_resolve_mask(imul_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(imul_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_switch(imul_io_brupdate_b2_uop_switch),
    .io_brupdate_b2_uop_switch_off(imul_io_brupdate_b2_uop_switch_off),
    .io_brupdate_b2_uop_is_unicore(imul_io_brupdate_b2_uop_is_unicore),
    .io_brupdate_b2_uop_shift(imul_io_brupdate_b2_uop_shift),
    .io_brupdate_b2_uop_lrs3_rtype(imul_io_brupdate_b2_uop_lrs3_rtype),
    .io_brupdate_b2_uop_rflag(imul_io_brupdate_b2_uop_rflag),
    .io_brupdate_b2_uop_wflag(imul_io_brupdate_b2_uop_wflag),
    .io_brupdate_b2_uop_prflag(imul_io_brupdate_b2_uop_prflag),
    .io_brupdate_b2_uop_pwflag(imul_io_brupdate_b2_uop_pwflag),
    .io_brupdate_b2_uop_pflag_busy(imul_io_brupdate_b2_uop_pflag_busy),
    .io_brupdate_b2_uop_stale_pflag(imul_io_brupdate_b2_uop_stale_pflag),
    .io_brupdate_b2_uop_op1_sel(imul_io_brupdate_b2_uop_op1_sel),
    .io_brupdate_b2_uop_op2_sel(imul_io_brupdate_b2_uop_op2_sel),
    .io_brupdate_b2_uop_split_num(imul_io_brupdate_b2_uop_split_num),
    .io_brupdate_b2_uop_self_index(imul_io_brupdate_b2_uop_self_index),
    .io_brupdate_b2_uop_rob_inst_idx(imul_io_brupdate_b2_uop_rob_inst_idx),
    .io_brupdate_b2_uop_address_num(imul_io_brupdate_b2_uop_address_num),
    .io_brupdate_b2_uop_uopc(imul_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(imul_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(imul_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(imul_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(imul_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(imul_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(imul_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(imul_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(imul_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(imul_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(imul_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(imul_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(imul_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(imul_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(imul_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(imul_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(imul_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_ctrl_op3_sel(imul_io_brupdate_b2_uop_ctrl_op3_sel),
    .io_brupdate_b2_uop_iw_state(imul_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(imul_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(imul_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(imul_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(imul_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(imul_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(imul_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(imul_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(imul_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(imul_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(imul_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(imul_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(imul_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(imul_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(imul_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(imul_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(imul_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(imul_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(imul_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(imul_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(imul_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(imul_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(imul_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(imul_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(imul_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(imul_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(imul_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(imul_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(imul_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(imul_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(imul_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(imul_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(imul_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(imul_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(imul_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(imul_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(imul_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(imul_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(imul_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(imul_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(imul_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(imul_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(imul_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(imul_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(imul_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(imul_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(imul_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(imul_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(imul_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(imul_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(imul_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(imul_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(imul_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(imul_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(imul_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(imul_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(imul_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(imul_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(imul_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(imul_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(imul_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(imul_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(imul_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(imul_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(imul_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(imul_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(imul_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(imul_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(imul_io_brupdate_b2_target_offset)
  );
  IntToFPUnit ifpu ( // @[execution-unit.scala 353:18]
    .clock(ifpu_clock),
    .reset(ifpu_reset),
    .io_req_ready(ifpu_io_req_ready),
    .io_req_valid(ifpu_io_req_valid),
    .io_req_bits_uop_switch(ifpu_io_req_bits_uop_switch),
    .io_req_bits_uop_switch_off(ifpu_io_req_bits_uop_switch_off),
    .io_req_bits_uop_is_unicore(ifpu_io_req_bits_uop_is_unicore),
    .io_req_bits_uop_shift(ifpu_io_req_bits_uop_shift),
    .io_req_bits_uop_lrs3_rtype(ifpu_io_req_bits_uop_lrs3_rtype),
    .io_req_bits_uop_rflag(ifpu_io_req_bits_uop_rflag),
    .io_req_bits_uop_wflag(ifpu_io_req_bits_uop_wflag),
    .io_req_bits_uop_prflag(ifpu_io_req_bits_uop_prflag),
    .io_req_bits_uop_pwflag(ifpu_io_req_bits_uop_pwflag),
    .io_req_bits_uop_pflag_busy(ifpu_io_req_bits_uop_pflag_busy),
    .io_req_bits_uop_stale_pflag(ifpu_io_req_bits_uop_stale_pflag),
    .io_req_bits_uop_op1_sel(ifpu_io_req_bits_uop_op1_sel),
    .io_req_bits_uop_op2_sel(ifpu_io_req_bits_uop_op2_sel),
    .io_req_bits_uop_split_num(ifpu_io_req_bits_uop_split_num),
    .io_req_bits_uop_self_index(ifpu_io_req_bits_uop_self_index),
    .io_req_bits_uop_rob_inst_idx(ifpu_io_req_bits_uop_rob_inst_idx),
    .io_req_bits_uop_address_num(ifpu_io_req_bits_uop_address_num),
    .io_req_bits_uop_uopc(ifpu_io_req_bits_uop_uopc),
    .io_req_bits_uop_inst(ifpu_io_req_bits_uop_inst),
    .io_req_bits_uop_debug_inst(ifpu_io_req_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc(ifpu_io_req_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc(ifpu_io_req_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type(ifpu_io_req_bits_uop_iq_type),
    .io_req_bits_uop_fu_code(ifpu_io_req_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type(ifpu_io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel(ifpu_io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel(ifpu_io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel(ifpu_io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn(ifpu_io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw(ifpu_io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd(ifpu_io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load(ifpu_io_req_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta(ifpu_io_req_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std(ifpu_io_req_bits_uop_ctrl_is_std),
    .io_req_bits_uop_ctrl_op3_sel(ifpu_io_req_bits_uop_ctrl_op3_sel),
    .io_req_bits_uop_iw_state(ifpu_io_req_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned(ifpu_io_req_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned(ifpu_io_req_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br(ifpu_io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr(ifpu_io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal(ifpu_io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb(ifpu_io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask(ifpu_io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag(ifpu_io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx(ifpu_io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst(ifpu_io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob(ifpu_io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken(ifpu_io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed(ifpu_io_req_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr(ifpu_io_req_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx(ifpu_io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx(ifpu_io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx(ifpu_io_req_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx(ifpu_io_req_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst(ifpu_io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1(ifpu_io_req_bits_uop_prs1),
    .io_req_bits_uop_prs2(ifpu_io_req_bits_uop_prs2),
    .io_req_bits_uop_prs3(ifpu_io_req_bits_uop_prs3),
    .io_req_bits_uop_ppred(ifpu_io_req_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy(ifpu_io_req_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy(ifpu_io_req_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy(ifpu_io_req_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy(ifpu_io_req_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst(ifpu_io_req_bits_uop_stale_pdst),
    .io_req_bits_uop_exception(ifpu_io_req_bits_uop_exception),
    .io_req_bits_uop_exc_cause(ifpu_io_req_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable(ifpu_io_req_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd(ifpu_io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size(ifpu_io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed(ifpu_io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence(ifpu_io_req_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei(ifpu_io_req_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo(ifpu_io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq(ifpu_io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq(ifpu_io_req_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc(ifpu_io_req_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique(ifpu_io_req_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit(ifpu_io_req_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1(ifpu_io_req_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst(ifpu_io_req_bits_uop_ldst),
    .io_req_bits_uop_lrs1(ifpu_io_req_bits_uop_lrs1),
    .io_req_bits_uop_lrs2(ifpu_io_req_bits_uop_lrs2),
    .io_req_bits_uop_lrs3(ifpu_io_req_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val(ifpu_io_req_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype(ifpu_io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype(ifpu_io_req_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype(ifpu_io_req_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en(ifpu_io_req_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val(ifpu_io_req_bits_uop_fp_val),
    .io_req_bits_uop_fp_single(ifpu_io_req_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if(ifpu_io_req_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if(ifpu_io_req_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if(ifpu_io_req_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if(ifpu_io_req_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if(ifpu_io_req_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc(ifpu_io_req_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc(ifpu_io_req_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data(ifpu_io_req_bits_rs1_data),
    .io_req_bits_rs2_data(ifpu_io_req_bits_rs2_data),
    .io_req_bits_rs3_data(ifpu_io_req_bits_rs3_data),
    .io_req_bits_pred_data(ifpu_io_req_bits_pred_data),
    .io_req_bits_flagdata(ifpu_io_req_bits_flagdata),
    .io_req_bits_fflagdata(ifpu_io_req_bits_fflagdata),
    .io_req_bits_kill(ifpu_io_req_bits_kill),
    .io_resp_ready(ifpu_io_resp_ready),
    .io_resp_valid(ifpu_io_resp_valid),
    .io_resp_bits_uop_switch(ifpu_io_resp_bits_uop_switch),
    .io_resp_bits_uop_switch_off(ifpu_io_resp_bits_uop_switch_off),
    .io_resp_bits_uop_is_unicore(ifpu_io_resp_bits_uop_is_unicore),
    .io_resp_bits_uop_shift(ifpu_io_resp_bits_uop_shift),
    .io_resp_bits_uop_lrs3_rtype(ifpu_io_resp_bits_uop_lrs3_rtype),
    .io_resp_bits_uop_rflag(ifpu_io_resp_bits_uop_rflag),
    .io_resp_bits_uop_wflag(ifpu_io_resp_bits_uop_wflag),
    .io_resp_bits_uop_prflag(ifpu_io_resp_bits_uop_prflag),
    .io_resp_bits_uop_pwflag(ifpu_io_resp_bits_uop_pwflag),
    .io_resp_bits_uop_pflag_busy(ifpu_io_resp_bits_uop_pflag_busy),
    .io_resp_bits_uop_stale_pflag(ifpu_io_resp_bits_uop_stale_pflag),
    .io_resp_bits_uop_op1_sel(ifpu_io_resp_bits_uop_op1_sel),
    .io_resp_bits_uop_op2_sel(ifpu_io_resp_bits_uop_op2_sel),
    .io_resp_bits_uop_split_num(ifpu_io_resp_bits_uop_split_num),
    .io_resp_bits_uop_self_index(ifpu_io_resp_bits_uop_self_index),
    .io_resp_bits_uop_rob_inst_idx(ifpu_io_resp_bits_uop_rob_inst_idx),
    .io_resp_bits_uop_address_num(ifpu_io_resp_bits_uop_address_num),
    .io_resp_bits_uop_uopc(ifpu_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(ifpu_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(ifpu_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(ifpu_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(ifpu_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(ifpu_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(ifpu_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(ifpu_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(ifpu_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(ifpu_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(ifpu_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(ifpu_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(ifpu_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(ifpu_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(ifpu_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(ifpu_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(ifpu_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_ctrl_op3_sel(ifpu_io_resp_bits_uop_ctrl_op3_sel),
    .io_resp_bits_uop_iw_state(ifpu_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(ifpu_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(ifpu_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(ifpu_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(ifpu_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(ifpu_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(ifpu_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(ifpu_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(ifpu_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(ifpu_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(ifpu_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(ifpu_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(ifpu_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(ifpu_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(ifpu_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(ifpu_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(ifpu_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(ifpu_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(ifpu_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(ifpu_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(ifpu_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(ifpu_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(ifpu_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(ifpu_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(ifpu_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(ifpu_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(ifpu_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(ifpu_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(ifpu_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(ifpu_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(ifpu_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(ifpu_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(ifpu_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(ifpu_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(ifpu_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(ifpu_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(ifpu_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(ifpu_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(ifpu_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(ifpu_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(ifpu_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(ifpu_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(ifpu_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(ifpu_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(ifpu_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(ifpu_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(ifpu_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(ifpu_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(ifpu_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(ifpu_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(ifpu_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(ifpu_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(ifpu_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(ifpu_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(ifpu_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(ifpu_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(ifpu_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(ifpu_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(ifpu_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(ifpu_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(ifpu_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(ifpu_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_predicated(ifpu_io_resp_bits_predicated),
    .io_resp_bits_data(ifpu_io_resp_bits_data),
    .io_resp_bits_fflags_valid(ifpu_io_resp_bits_fflags_valid),
    .io_resp_bits_fflags_bits_uop_switch(ifpu_io_resp_bits_fflags_bits_uop_switch),
    .io_resp_bits_fflags_bits_uop_switch_off(ifpu_io_resp_bits_fflags_bits_uop_switch_off),
    .io_resp_bits_fflags_bits_uop_is_unicore(ifpu_io_resp_bits_fflags_bits_uop_is_unicore),
    .io_resp_bits_fflags_bits_uop_shift(ifpu_io_resp_bits_fflags_bits_uop_shift),
    .io_resp_bits_fflags_bits_uop_lrs3_rtype(ifpu_io_resp_bits_fflags_bits_uop_lrs3_rtype),
    .io_resp_bits_fflags_bits_uop_rflag(ifpu_io_resp_bits_fflags_bits_uop_rflag),
    .io_resp_bits_fflags_bits_uop_wflag(ifpu_io_resp_bits_fflags_bits_uop_wflag),
    .io_resp_bits_fflags_bits_uop_prflag(ifpu_io_resp_bits_fflags_bits_uop_prflag),
    .io_resp_bits_fflags_bits_uop_pwflag(ifpu_io_resp_bits_fflags_bits_uop_pwflag),
    .io_resp_bits_fflags_bits_uop_pflag_busy(ifpu_io_resp_bits_fflags_bits_uop_pflag_busy),
    .io_resp_bits_fflags_bits_uop_stale_pflag(ifpu_io_resp_bits_fflags_bits_uop_stale_pflag),
    .io_resp_bits_fflags_bits_uop_op1_sel(ifpu_io_resp_bits_fflags_bits_uop_op1_sel),
    .io_resp_bits_fflags_bits_uop_op2_sel(ifpu_io_resp_bits_fflags_bits_uop_op2_sel),
    .io_resp_bits_fflags_bits_uop_split_num(ifpu_io_resp_bits_fflags_bits_uop_split_num),
    .io_resp_bits_fflags_bits_uop_self_index(ifpu_io_resp_bits_fflags_bits_uop_self_index),
    .io_resp_bits_fflags_bits_uop_rob_inst_idx(ifpu_io_resp_bits_fflags_bits_uop_rob_inst_idx),
    .io_resp_bits_fflags_bits_uop_address_num(ifpu_io_resp_bits_fflags_bits_uop_address_num),
    .io_resp_bits_fflags_bits_uop_uopc(ifpu_io_resp_bits_fflags_bits_uop_uopc),
    .io_resp_bits_fflags_bits_uop_inst(ifpu_io_resp_bits_fflags_bits_uop_inst),
    .io_resp_bits_fflags_bits_uop_debug_inst(ifpu_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_resp_bits_fflags_bits_uop_is_rvc(ifpu_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_resp_bits_fflags_bits_uop_debug_pc(ifpu_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_resp_bits_fflags_bits_uop_iq_type(ifpu_io_resp_bits_fflags_bits_uop_iq_type),
    .io_resp_bits_fflags_bits_uop_fu_code(ifpu_io_resp_bits_fflags_bits_uop_fu_code),
    .io_resp_bits_fflags_bits_uop_ctrl_br_type(ifpu_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_resp_bits_fflags_bits_uop_ctrl_op1_sel(ifpu_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op2_sel(ifpu_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_imm_sel(ifpu_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op_fcn(ifpu_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflags_bits_uop_ctrl_fcn_dw(ifpu_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflags_bits_uop_ctrl_csr_cmd(ifpu_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflags_bits_uop_ctrl_is_load(ifpu_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_resp_bits_fflags_bits_uop_ctrl_is_sta(ifpu_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflags_bits_uop_ctrl_is_std(ifpu_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_resp_bits_fflags_bits_uop_ctrl_op3_sel(ifpu_io_resp_bits_fflags_bits_uop_ctrl_op3_sel),
    .io_resp_bits_fflags_bits_uop_iw_state(ifpu_io_resp_bits_fflags_bits_uop_iw_state),
    .io_resp_bits_fflags_bits_uop_iw_p1_poisoned(ifpu_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflags_bits_uop_iw_p2_poisoned(ifpu_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflags_bits_uop_is_br(ifpu_io_resp_bits_fflags_bits_uop_is_br),
    .io_resp_bits_fflags_bits_uop_is_jalr(ifpu_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_resp_bits_fflags_bits_uop_is_jal(ifpu_io_resp_bits_fflags_bits_uop_is_jal),
    .io_resp_bits_fflags_bits_uop_is_sfb(ifpu_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_resp_bits_fflags_bits_uop_br_mask(ifpu_io_resp_bits_fflags_bits_uop_br_mask),
    .io_resp_bits_fflags_bits_uop_br_tag(ifpu_io_resp_bits_fflags_bits_uop_br_tag),
    .io_resp_bits_fflags_bits_uop_ftq_idx(ifpu_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_resp_bits_fflags_bits_uop_edge_inst(ifpu_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_resp_bits_fflags_bits_uop_pc_lob(ifpu_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_resp_bits_fflags_bits_uop_taken(ifpu_io_resp_bits_fflags_bits_uop_taken),
    .io_resp_bits_fflags_bits_uop_imm_packed(ifpu_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_resp_bits_fflags_bits_uop_csr_addr(ifpu_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_resp_bits_fflags_bits_uop_rob_idx(ifpu_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_resp_bits_fflags_bits_uop_ldq_idx(ifpu_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_resp_bits_fflags_bits_uop_stq_idx(ifpu_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_resp_bits_fflags_bits_uop_rxq_idx(ifpu_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_resp_bits_fflags_bits_uop_pdst(ifpu_io_resp_bits_fflags_bits_uop_pdst),
    .io_resp_bits_fflags_bits_uop_prs1(ifpu_io_resp_bits_fflags_bits_uop_prs1),
    .io_resp_bits_fflags_bits_uop_prs2(ifpu_io_resp_bits_fflags_bits_uop_prs2),
    .io_resp_bits_fflags_bits_uop_prs3(ifpu_io_resp_bits_fflags_bits_uop_prs3),
    .io_resp_bits_fflags_bits_uop_ppred(ifpu_io_resp_bits_fflags_bits_uop_ppred),
    .io_resp_bits_fflags_bits_uop_prs1_busy(ifpu_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_resp_bits_fflags_bits_uop_prs2_busy(ifpu_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_resp_bits_fflags_bits_uop_prs3_busy(ifpu_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_resp_bits_fflags_bits_uop_ppred_busy(ifpu_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_resp_bits_fflags_bits_uop_stale_pdst(ifpu_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_resp_bits_fflags_bits_uop_exception(ifpu_io_resp_bits_fflags_bits_uop_exception),
    .io_resp_bits_fflags_bits_uop_exc_cause(ifpu_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_resp_bits_fflags_bits_uop_bypassable(ifpu_io_resp_bits_fflags_bits_uop_bypassable),
    .io_resp_bits_fflags_bits_uop_mem_cmd(ifpu_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_resp_bits_fflags_bits_uop_mem_size(ifpu_io_resp_bits_fflags_bits_uop_mem_size),
    .io_resp_bits_fflags_bits_uop_mem_signed(ifpu_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_resp_bits_fflags_bits_uop_is_fence(ifpu_io_resp_bits_fflags_bits_uop_is_fence),
    .io_resp_bits_fflags_bits_uop_is_fencei(ifpu_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_resp_bits_fflags_bits_uop_is_amo(ifpu_io_resp_bits_fflags_bits_uop_is_amo),
    .io_resp_bits_fflags_bits_uop_uses_ldq(ifpu_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_resp_bits_fflags_bits_uop_uses_stq(ifpu_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_resp_bits_fflags_bits_uop_is_sys_pc2epc(ifpu_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflags_bits_uop_is_unique(ifpu_io_resp_bits_fflags_bits_uop_is_unique),
    .io_resp_bits_fflags_bits_uop_flush_on_commit(ifpu_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_resp_bits_fflags_bits_uop_ldst_is_rs1(ifpu_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflags_bits_uop_ldst(ifpu_io_resp_bits_fflags_bits_uop_ldst),
    .io_resp_bits_fflags_bits_uop_lrs1(ifpu_io_resp_bits_fflags_bits_uop_lrs1),
    .io_resp_bits_fflags_bits_uop_lrs2(ifpu_io_resp_bits_fflags_bits_uop_lrs2),
    .io_resp_bits_fflags_bits_uop_lrs3(ifpu_io_resp_bits_fflags_bits_uop_lrs3),
    .io_resp_bits_fflags_bits_uop_ldst_val(ifpu_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_resp_bits_fflags_bits_uop_dst_rtype(ifpu_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_resp_bits_fflags_bits_uop_lrs1_rtype(ifpu_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_resp_bits_fflags_bits_uop_lrs2_rtype(ifpu_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_resp_bits_fflags_bits_uop_frs3_en(ifpu_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_resp_bits_fflags_bits_uop_fp_val(ifpu_io_resp_bits_fflags_bits_uop_fp_val),
    .io_resp_bits_fflags_bits_uop_fp_single(ifpu_io_resp_bits_fflags_bits_uop_fp_single),
    .io_resp_bits_fflags_bits_uop_xcpt_pf_if(ifpu_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ae_if(ifpu_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ma_if(ifpu_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflags_bits_uop_bp_debug_if(ifpu_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_resp_bits_fflags_bits_uop_bp_xcpt_if(ifpu_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflags_bits_uop_debug_fsrc(ifpu_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_resp_bits_fflags_bits_uop_debug_tsrc(ifpu_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_resp_bits_fflags_bits_flags(ifpu_io_resp_bits_fflags_bits_flags),
    .io_resp_bits_addr(ifpu_io_resp_bits_addr),
    .io_resp_bits_mxcpt_valid(ifpu_io_resp_bits_mxcpt_valid),
    .io_resp_bits_mxcpt_bits(ifpu_io_resp_bits_mxcpt_bits),
    .io_resp_bits_sfence_valid(ifpu_io_resp_bits_sfence_valid),
    .io_resp_bits_sfence_bits_rs1(ifpu_io_resp_bits_sfence_bits_rs1),
    .io_resp_bits_sfence_bits_rs2(ifpu_io_resp_bits_sfence_bits_rs2),
    .io_resp_bits_sfence_bits_addr(ifpu_io_resp_bits_sfence_bits_addr),
    .io_resp_bits_sfence_bits_asid(ifpu_io_resp_bits_sfence_bits_asid),
    .io_resp_bits_flagdata(ifpu_io_resp_bits_flagdata),
    .io_resp_bits_fflagdata_valid(ifpu_io_resp_bits_fflagdata_valid),
    .io_resp_bits_fflagdata_bits_uop_switch(ifpu_io_resp_bits_fflagdata_bits_uop_switch),
    .io_resp_bits_fflagdata_bits_uop_switch_off(ifpu_io_resp_bits_fflagdata_bits_uop_switch_off),
    .io_resp_bits_fflagdata_bits_uop_is_unicore(ifpu_io_resp_bits_fflagdata_bits_uop_is_unicore),
    .io_resp_bits_fflagdata_bits_uop_shift(ifpu_io_resp_bits_fflagdata_bits_uop_shift),
    .io_resp_bits_fflagdata_bits_uop_lrs3_rtype(ifpu_io_resp_bits_fflagdata_bits_uop_lrs3_rtype),
    .io_resp_bits_fflagdata_bits_uop_rflag(ifpu_io_resp_bits_fflagdata_bits_uop_rflag),
    .io_resp_bits_fflagdata_bits_uop_wflag(ifpu_io_resp_bits_fflagdata_bits_uop_wflag),
    .io_resp_bits_fflagdata_bits_uop_prflag(ifpu_io_resp_bits_fflagdata_bits_uop_prflag),
    .io_resp_bits_fflagdata_bits_uop_pwflag(ifpu_io_resp_bits_fflagdata_bits_uop_pwflag),
    .io_resp_bits_fflagdata_bits_uop_pflag_busy(ifpu_io_resp_bits_fflagdata_bits_uop_pflag_busy),
    .io_resp_bits_fflagdata_bits_uop_stale_pflag(ifpu_io_resp_bits_fflagdata_bits_uop_stale_pflag),
    .io_resp_bits_fflagdata_bits_uop_op1_sel(ifpu_io_resp_bits_fflagdata_bits_uop_op1_sel),
    .io_resp_bits_fflagdata_bits_uop_op2_sel(ifpu_io_resp_bits_fflagdata_bits_uop_op2_sel),
    .io_resp_bits_fflagdata_bits_uop_split_num(ifpu_io_resp_bits_fflagdata_bits_uop_split_num),
    .io_resp_bits_fflagdata_bits_uop_self_index(ifpu_io_resp_bits_fflagdata_bits_uop_self_index),
    .io_resp_bits_fflagdata_bits_uop_rob_inst_idx(ifpu_io_resp_bits_fflagdata_bits_uop_rob_inst_idx),
    .io_resp_bits_fflagdata_bits_uop_address_num(ifpu_io_resp_bits_fflagdata_bits_uop_address_num),
    .io_resp_bits_fflagdata_bits_uop_uopc(ifpu_io_resp_bits_fflagdata_bits_uop_uopc),
    .io_resp_bits_fflagdata_bits_uop_inst(ifpu_io_resp_bits_fflagdata_bits_uop_inst),
    .io_resp_bits_fflagdata_bits_uop_debug_inst(ifpu_io_resp_bits_fflagdata_bits_uop_debug_inst),
    .io_resp_bits_fflagdata_bits_uop_is_rvc(ifpu_io_resp_bits_fflagdata_bits_uop_is_rvc),
    .io_resp_bits_fflagdata_bits_uop_debug_pc(ifpu_io_resp_bits_fflagdata_bits_uop_debug_pc),
    .io_resp_bits_fflagdata_bits_uop_iq_type(ifpu_io_resp_bits_fflagdata_bits_uop_iq_type),
    .io_resp_bits_fflagdata_bits_uop_fu_code(ifpu_io_resp_bits_fflagdata_bits_uop_fu_code),
    .io_resp_bits_fflagdata_bits_uop_ctrl_br_type(ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_br_type),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel(ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel(ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel(ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn(ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw(ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd(ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_load(ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_is_load),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_sta(ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflagdata_bits_uop_ctrl_is_std(ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_is_std),
    .io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel(ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel),
    .io_resp_bits_fflagdata_bits_uop_iw_state(ifpu_io_resp_bits_fflagdata_bits_uop_iw_state),
    .io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned(ifpu_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned(ifpu_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflagdata_bits_uop_is_br(ifpu_io_resp_bits_fflagdata_bits_uop_is_br),
    .io_resp_bits_fflagdata_bits_uop_is_jalr(ifpu_io_resp_bits_fflagdata_bits_uop_is_jalr),
    .io_resp_bits_fflagdata_bits_uop_is_jal(ifpu_io_resp_bits_fflagdata_bits_uop_is_jal),
    .io_resp_bits_fflagdata_bits_uop_is_sfb(ifpu_io_resp_bits_fflagdata_bits_uop_is_sfb),
    .io_resp_bits_fflagdata_bits_uop_br_mask(ifpu_io_resp_bits_fflagdata_bits_uop_br_mask),
    .io_resp_bits_fflagdata_bits_uop_br_tag(ifpu_io_resp_bits_fflagdata_bits_uop_br_tag),
    .io_resp_bits_fflagdata_bits_uop_ftq_idx(ifpu_io_resp_bits_fflagdata_bits_uop_ftq_idx),
    .io_resp_bits_fflagdata_bits_uop_edge_inst(ifpu_io_resp_bits_fflagdata_bits_uop_edge_inst),
    .io_resp_bits_fflagdata_bits_uop_pc_lob(ifpu_io_resp_bits_fflagdata_bits_uop_pc_lob),
    .io_resp_bits_fflagdata_bits_uop_taken(ifpu_io_resp_bits_fflagdata_bits_uop_taken),
    .io_resp_bits_fflagdata_bits_uop_imm_packed(ifpu_io_resp_bits_fflagdata_bits_uop_imm_packed),
    .io_resp_bits_fflagdata_bits_uop_csr_addr(ifpu_io_resp_bits_fflagdata_bits_uop_csr_addr),
    .io_resp_bits_fflagdata_bits_uop_rob_idx(ifpu_io_resp_bits_fflagdata_bits_uop_rob_idx),
    .io_resp_bits_fflagdata_bits_uop_ldq_idx(ifpu_io_resp_bits_fflagdata_bits_uop_ldq_idx),
    .io_resp_bits_fflagdata_bits_uop_stq_idx(ifpu_io_resp_bits_fflagdata_bits_uop_stq_idx),
    .io_resp_bits_fflagdata_bits_uop_rxq_idx(ifpu_io_resp_bits_fflagdata_bits_uop_rxq_idx),
    .io_resp_bits_fflagdata_bits_uop_pdst(ifpu_io_resp_bits_fflagdata_bits_uop_pdst),
    .io_resp_bits_fflagdata_bits_uop_prs1(ifpu_io_resp_bits_fflagdata_bits_uop_prs1),
    .io_resp_bits_fflagdata_bits_uop_prs2(ifpu_io_resp_bits_fflagdata_bits_uop_prs2),
    .io_resp_bits_fflagdata_bits_uop_prs3(ifpu_io_resp_bits_fflagdata_bits_uop_prs3),
    .io_resp_bits_fflagdata_bits_uop_ppred(ifpu_io_resp_bits_fflagdata_bits_uop_ppred),
    .io_resp_bits_fflagdata_bits_uop_prs1_busy(ifpu_io_resp_bits_fflagdata_bits_uop_prs1_busy),
    .io_resp_bits_fflagdata_bits_uop_prs2_busy(ifpu_io_resp_bits_fflagdata_bits_uop_prs2_busy),
    .io_resp_bits_fflagdata_bits_uop_prs3_busy(ifpu_io_resp_bits_fflagdata_bits_uop_prs3_busy),
    .io_resp_bits_fflagdata_bits_uop_ppred_busy(ifpu_io_resp_bits_fflagdata_bits_uop_ppred_busy),
    .io_resp_bits_fflagdata_bits_uop_stale_pdst(ifpu_io_resp_bits_fflagdata_bits_uop_stale_pdst),
    .io_resp_bits_fflagdata_bits_uop_exception(ifpu_io_resp_bits_fflagdata_bits_uop_exception),
    .io_resp_bits_fflagdata_bits_uop_exc_cause(ifpu_io_resp_bits_fflagdata_bits_uop_exc_cause),
    .io_resp_bits_fflagdata_bits_uop_bypassable(ifpu_io_resp_bits_fflagdata_bits_uop_bypassable),
    .io_resp_bits_fflagdata_bits_uop_mem_cmd(ifpu_io_resp_bits_fflagdata_bits_uop_mem_cmd),
    .io_resp_bits_fflagdata_bits_uop_mem_size(ifpu_io_resp_bits_fflagdata_bits_uop_mem_size),
    .io_resp_bits_fflagdata_bits_uop_mem_signed(ifpu_io_resp_bits_fflagdata_bits_uop_mem_signed),
    .io_resp_bits_fflagdata_bits_uop_is_fence(ifpu_io_resp_bits_fflagdata_bits_uop_is_fence),
    .io_resp_bits_fflagdata_bits_uop_is_fencei(ifpu_io_resp_bits_fflagdata_bits_uop_is_fencei),
    .io_resp_bits_fflagdata_bits_uop_is_amo(ifpu_io_resp_bits_fflagdata_bits_uop_is_amo),
    .io_resp_bits_fflagdata_bits_uop_uses_ldq(ifpu_io_resp_bits_fflagdata_bits_uop_uses_ldq),
    .io_resp_bits_fflagdata_bits_uop_uses_stq(ifpu_io_resp_bits_fflagdata_bits_uop_uses_stq),
    .io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc(ifpu_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflagdata_bits_uop_is_unique(ifpu_io_resp_bits_fflagdata_bits_uop_is_unique),
    .io_resp_bits_fflagdata_bits_uop_flush_on_commit(ifpu_io_resp_bits_fflagdata_bits_uop_flush_on_commit),
    .io_resp_bits_fflagdata_bits_uop_ldst_is_rs1(ifpu_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflagdata_bits_uop_ldst(ifpu_io_resp_bits_fflagdata_bits_uop_ldst),
    .io_resp_bits_fflagdata_bits_uop_lrs1(ifpu_io_resp_bits_fflagdata_bits_uop_lrs1),
    .io_resp_bits_fflagdata_bits_uop_lrs2(ifpu_io_resp_bits_fflagdata_bits_uop_lrs2),
    .io_resp_bits_fflagdata_bits_uop_lrs3(ifpu_io_resp_bits_fflagdata_bits_uop_lrs3),
    .io_resp_bits_fflagdata_bits_uop_ldst_val(ifpu_io_resp_bits_fflagdata_bits_uop_ldst_val),
    .io_resp_bits_fflagdata_bits_uop_dst_rtype(ifpu_io_resp_bits_fflagdata_bits_uop_dst_rtype),
    .io_resp_bits_fflagdata_bits_uop_lrs1_rtype(ifpu_io_resp_bits_fflagdata_bits_uop_lrs1_rtype),
    .io_resp_bits_fflagdata_bits_uop_lrs2_rtype(ifpu_io_resp_bits_fflagdata_bits_uop_lrs2_rtype),
    .io_resp_bits_fflagdata_bits_uop_frs3_en(ifpu_io_resp_bits_fflagdata_bits_uop_frs3_en),
    .io_resp_bits_fflagdata_bits_uop_fp_val(ifpu_io_resp_bits_fflagdata_bits_uop_fp_val),
    .io_resp_bits_fflagdata_bits_uop_fp_single(ifpu_io_resp_bits_fflagdata_bits_uop_fp_single),
    .io_resp_bits_fflagdata_bits_uop_xcpt_pf_if(ifpu_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflagdata_bits_uop_xcpt_ae_if(ifpu_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflagdata_bits_uop_xcpt_ma_if(ifpu_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflagdata_bits_uop_bp_debug_if(ifpu_io_resp_bits_fflagdata_bits_uop_bp_debug_if),
    .io_resp_bits_fflagdata_bits_uop_bp_xcpt_if(ifpu_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflagdata_bits_uop_debug_fsrc(ifpu_io_resp_bits_fflagdata_bits_uop_debug_fsrc),
    .io_resp_bits_fflagdata_bits_uop_debug_tsrc(ifpu_io_resp_bits_fflagdata_bits_uop_debug_tsrc),
    .io_resp_bits_fflagdata_bits_fflag(ifpu_io_resp_bits_fflagdata_bits_fflag),
    .io_brupdate_b1_resolve_mask(ifpu_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(ifpu_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_switch(ifpu_io_brupdate_b2_uop_switch),
    .io_brupdate_b2_uop_switch_off(ifpu_io_brupdate_b2_uop_switch_off),
    .io_brupdate_b2_uop_is_unicore(ifpu_io_brupdate_b2_uop_is_unicore),
    .io_brupdate_b2_uop_shift(ifpu_io_brupdate_b2_uop_shift),
    .io_brupdate_b2_uop_lrs3_rtype(ifpu_io_brupdate_b2_uop_lrs3_rtype),
    .io_brupdate_b2_uop_rflag(ifpu_io_brupdate_b2_uop_rflag),
    .io_brupdate_b2_uop_wflag(ifpu_io_brupdate_b2_uop_wflag),
    .io_brupdate_b2_uop_prflag(ifpu_io_brupdate_b2_uop_prflag),
    .io_brupdate_b2_uop_pwflag(ifpu_io_brupdate_b2_uop_pwflag),
    .io_brupdate_b2_uop_pflag_busy(ifpu_io_brupdate_b2_uop_pflag_busy),
    .io_brupdate_b2_uop_stale_pflag(ifpu_io_brupdate_b2_uop_stale_pflag),
    .io_brupdate_b2_uop_op1_sel(ifpu_io_brupdate_b2_uop_op1_sel),
    .io_brupdate_b2_uop_op2_sel(ifpu_io_brupdate_b2_uop_op2_sel),
    .io_brupdate_b2_uop_split_num(ifpu_io_brupdate_b2_uop_split_num),
    .io_brupdate_b2_uop_self_index(ifpu_io_brupdate_b2_uop_self_index),
    .io_brupdate_b2_uop_rob_inst_idx(ifpu_io_brupdate_b2_uop_rob_inst_idx),
    .io_brupdate_b2_uop_address_num(ifpu_io_brupdate_b2_uop_address_num),
    .io_brupdate_b2_uop_uopc(ifpu_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(ifpu_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(ifpu_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(ifpu_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(ifpu_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(ifpu_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(ifpu_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(ifpu_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(ifpu_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(ifpu_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(ifpu_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(ifpu_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(ifpu_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(ifpu_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(ifpu_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(ifpu_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(ifpu_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_ctrl_op3_sel(ifpu_io_brupdate_b2_uop_ctrl_op3_sel),
    .io_brupdate_b2_uop_iw_state(ifpu_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(ifpu_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(ifpu_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(ifpu_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(ifpu_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(ifpu_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(ifpu_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(ifpu_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(ifpu_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(ifpu_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(ifpu_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(ifpu_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(ifpu_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(ifpu_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(ifpu_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(ifpu_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(ifpu_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(ifpu_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(ifpu_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(ifpu_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(ifpu_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(ifpu_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(ifpu_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(ifpu_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(ifpu_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(ifpu_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(ifpu_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(ifpu_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(ifpu_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(ifpu_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(ifpu_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(ifpu_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(ifpu_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(ifpu_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(ifpu_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(ifpu_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(ifpu_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(ifpu_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(ifpu_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(ifpu_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(ifpu_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(ifpu_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(ifpu_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(ifpu_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(ifpu_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(ifpu_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(ifpu_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(ifpu_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(ifpu_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(ifpu_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(ifpu_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(ifpu_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(ifpu_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(ifpu_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(ifpu_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(ifpu_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(ifpu_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(ifpu_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(ifpu_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(ifpu_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(ifpu_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(ifpu_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(ifpu_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(ifpu_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(ifpu_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(ifpu_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(ifpu_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(ifpu_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(ifpu_io_brupdate_b2_target_offset),
    .io_fcsr_rm(ifpu_io_fcsr_rm)
  );
  BranchKillableQueue_3 BranchKillableQueue ( // @[execution-unit.scala 361:23]
    .clock(BranchKillableQueue_clock),
    .reset(BranchKillableQueue_reset),
    .io_enq_ready(BranchKillableQueue_io_enq_ready),
    .io_enq_valid(BranchKillableQueue_io_enq_valid),
    .io_enq_bits_uop_switch(BranchKillableQueue_io_enq_bits_uop_switch),
    .io_enq_bits_uop_switch_off(BranchKillableQueue_io_enq_bits_uop_switch_off),
    .io_enq_bits_uop_is_unicore(BranchKillableQueue_io_enq_bits_uop_is_unicore),
    .io_enq_bits_uop_shift(BranchKillableQueue_io_enq_bits_uop_shift),
    .io_enq_bits_uop_lrs3_rtype(BranchKillableQueue_io_enq_bits_uop_lrs3_rtype),
    .io_enq_bits_uop_rflag(BranchKillableQueue_io_enq_bits_uop_rflag),
    .io_enq_bits_uop_wflag(BranchKillableQueue_io_enq_bits_uop_wflag),
    .io_enq_bits_uop_prflag(BranchKillableQueue_io_enq_bits_uop_prflag),
    .io_enq_bits_uop_pwflag(BranchKillableQueue_io_enq_bits_uop_pwflag),
    .io_enq_bits_uop_pflag_busy(BranchKillableQueue_io_enq_bits_uop_pflag_busy),
    .io_enq_bits_uop_stale_pflag(BranchKillableQueue_io_enq_bits_uop_stale_pflag),
    .io_enq_bits_uop_op1_sel(BranchKillableQueue_io_enq_bits_uop_op1_sel),
    .io_enq_bits_uop_op2_sel(BranchKillableQueue_io_enq_bits_uop_op2_sel),
    .io_enq_bits_uop_split_num(BranchKillableQueue_io_enq_bits_uop_split_num),
    .io_enq_bits_uop_self_index(BranchKillableQueue_io_enq_bits_uop_self_index),
    .io_enq_bits_uop_rob_inst_idx(BranchKillableQueue_io_enq_bits_uop_rob_inst_idx),
    .io_enq_bits_uop_address_num(BranchKillableQueue_io_enq_bits_uop_address_num),
    .io_enq_bits_uop_uopc(BranchKillableQueue_io_enq_bits_uop_uopc),
    .io_enq_bits_uop_inst(BranchKillableQueue_io_enq_bits_uop_inst),
    .io_enq_bits_uop_debug_inst(BranchKillableQueue_io_enq_bits_uop_debug_inst),
    .io_enq_bits_uop_is_rvc(BranchKillableQueue_io_enq_bits_uop_is_rvc),
    .io_enq_bits_uop_debug_pc(BranchKillableQueue_io_enq_bits_uop_debug_pc),
    .io_enq_bits_uop_iq_type(BranchKillableQueue_io_enq_bits_uop_iq_type),
    .io_enq_bits_uop_fu_code(BranchKillableQueue_io_enq_bits_uop_fu_code),
    .io_enq_bits_uop_ctrl_br_type(BranchKillableQueue_io_enq_bits_uop_ctrl_br_type),
    .io_enq_bits_uop_ctrl_op1_sel(BranchKillableQueue_io_enq_bits_uop_ctrl_op1_sel),
    .io_enq_bits_uop_ctrl_op2_sel(BranchKillableQueue_io_enq_bits_uop_ctrl_op2_sel),
    .io_enq_bits_uop_ctrl_imm_sel(BranchKillableQueue_io_enq_bits_uop_ctrl_imm_sel),
    .io_enq_bits_uop_ctrl_op_fcn(BranchKillableQueue_io_enq_bits_uop_ctrl_op_fcn),
    .io_enq_bits_uop_ctrl_fcn_dw(BranchKillableQueue_io_enq_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_uop_ctrl_csr_cmd(BranchKillableQueue_io_enq_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_uop_ctrl_is_load(BranchKillableQueue_io_enq_bits_uop_ctrl_is_load),
    .io_enq_bits_uop_ctrl_is_sta(BranchKillableQueue_io_enq_bits_uop_ctrl_is_sta),
    .io_enq_bits_uop_ctrl_is_std(BranchKillableQueue_io_enq_bits_uop_ctrl_is_std),
    .io_enq_bits_uop_ctrl_op3_sel(BranchKillableQueue_io_enq_bits_uop_ctrl_op3_sel),
    .io_enq_bits_uop_iw_state(BranchKillableQueue_io_enq_bits_uop_iw_state),
    .io_enq_bits_uop_iw_p1_poisoned(BranchKillableQueue_io_enq_bits_uop_iw_p1_poisoned),
    .io_enq_bits_uop_iw_p2_poisoned(BranchKillableQueue_io_enq_bits_uop_iw_p2_poisoned),
    .io_enq_bits_uop_is_br(BranchKillableQueue_io_enq_bits_uop_is_br),
    .io_enq_bits_uop_is_jalr(BranchKillableQueue_io_enq_bits_uop_is_jalr),
    .io_enq_bits_uop_is_jal(BranchKillableQueue_io_enq_bits_uop_is_jal),
    .io_enq_bits_uop_is_sfb(BranchKillableQueue_io_enq_bits_uop_is_sfb),
    .io_enq_bits_uop_br_mask(BranchKillableQueue_io_enq_bits_uop_br_mask),
    .io_enq_bits_uop_br_tag(BranchKillableQueue_io_enq_bits_uop_br_tag),
    .io_enq_bits_uop_ftq_idx(BranchKillableQueue_io_enq_bits_uop_ftq_idx),
    .io_enq_bits_uop_edge_inst(BranchKillableQueue_io_enq_bits_uop_edge_inst),
    .io_enq_bits_uop_pc_lob(BranchKillableQueue_io_enq_bits_uop_pc_lob),
    .io_enq_bits_uop_taken(BranchKillableQueue_io_enq_bits_uop_taken),
    .io_enq_bits_uop_imm_packed(BranchKillableQueue_io_enq_bits_uop_imm_packed),
    .io_enq_bits_uop_csr_addr(BranchKillableQueue_io_enq_bits_uop_csr_addr),
    .io_enq_bits_uop_rob_idx(BranchKillableQueue_io_enq_bits_uop_rob_idx),
    .io_enq_bits_uop_ldq_idx(BranchKillableQueue_io_enq_bits_uop_ldq_idx),
    .io_enq_bits_uop_stq_idx(BranchKillableQueue_io_enq_bits_uop_stq_idx),
    .io_enq_bits_uop_rxq_idx(BranchKillableQueue_io_enq_bits_uop_rxq_idx),
    .io_enq_bits_uop_pdst(BranchKillableQueue_io_enq_bits_uop_pdst),
    .io_enq_bits_uop_prs1(BranchKillableQueue_io_enq_bits_uop_prs1),
    .io_enq_bits_uop_prs2(BranchKillableQueue_io_enq_bits_uop_prs2),
    .io_enq_bits_uop_prs3(BranchKillableQueue_io_enq_bits_uop_prs3),
    .io_enq_bits_uop_ppred(BranchKillableQueue_io_enq_bits_uop_ppred),
    .io_enq_bits_uop_prs1_busy(BranchKillableQueue_io_enq_bits_uop_prs1_busy),
    .io_enq_bits_uop_prs2_busy(BranchKillableQueue_io_enq_bits_uop_prs2_busy),
    .io_enq_bits_uop_prs3_busy(BranchKillableQueue_io_enq_bits_uop_prs3_busy),
    .io_enq_bits_uop_ppred_busy(BranchKillableQueue_io_enq_bits_uop_ppred_busy),
    .io_enq_bits_uop_stale_pdst(BranchKillableQueue_io_enq_bits_uop_stale_pdst),
    .io_enq_bits_uop_exception(BranchKillableQueue_io_enq_bits_uop_exception),
    .io_enq_bits_uop_exc_cause(BranchKillableQueue_io_enq_bits_uop_exc_cause),
    .io_enq_bits_uop_bypassable(BranchKillableQueue_io_enq_bits_uop_bypassable),
    .io_enq_bits_uop_mem_cmd(BranchKillableQueue_io_enq_bits_uop_mem_cmd),
    .io_enq_bits_uop_mem_size(BranchKillableQueue_io_enq_bits_uop_mem_size),
    .io_enq_bits_uop_mem_signed(BranchKillableQueue_io_enq_bits_uop_mem_signed),
    .io_enq_bits_uop_is_fence(BranchKillableQueue_io_enq_bits_uop_is_fence),
    .io_enq_bits_uop_is_fencei(BranchKillableQueue_io_enq_bits_uop_is_fencei),
    .io_enq_bits_uop_is_amo(BranchKillableQueue_io_enq_bits_uop_is_amo),
    .io_enq_bits_uop_uses_ldq(BranchKillableQueue_io_enq_bits_uop_uses_ldq),
    .io_enq_bits_uop_uses_stq(BranchKillableQueue_io_enq_bits_uop_uses_stq),
    .io_enq_bits_uop_is_sys_pc2epc(BranchKillableQueue_io_enq_bits_uop_is_sys_pc2epc),
    .io_enq_bits_uop_is_unique(BranchKillableQueue_io_enq_bits_uop_is_unique),
    .io_enq_bits_uop_flush_on_commit(BranchKillableQueue_io_enq_bits_uop_flush_on_commit),
    .io_enq_bits_uop_ldst_is_rs1(BranchKillableQueue_io_enq_bits_uop_ldst_is_rs1),
    .io_enq_bits_uop_ldst(BranchKillableQueue_io_enq_bits_uop_ldst),
    .io_enq_bits_uop_lrs1(BranchKillableQueue_io_enq_bits_uop_lrs1),
    .io_enq_bits_uop_lrs2(BranchKillableQueue_io_enq_bits_uop_lrs2),
    .io_enq_bits_uop_lrs3(BranchKillableQueue_io_enq_bits_uop_lrs3),
    .io_enq_bits_uop_ldst_val(BranchKillableQueue_io_enq_bits_uop_ldst_val),
    .io_enq_bits_uop_dst_rtype(BranchKillableQueue_io_enq_bits_uop_dst_rtype),
    .io_enq_bits_uop_lrs1_rtype(BranchKillableQueue_io_enq_bits_uop_lrs1_rtype),
    .io_enq_bits_uop_lrs2_rtype(BranchKillableQueue_io_enq_bits_uop_lrs2_rtype),
    .io_enq_bits_uop_frs3_en(BranchKillableQueue_io_enq_bits_uop_frs3_en),
    .io_enq_bits_uop_fp_val(BranchKillableQueue_io_enq_bits_uop_fp_val),
    .io_enq_bits_uop_fp_single(BranchKillableQueue_io_enq_bits_uop_fp_single),
    .io_enq_bits_uop_xcpt_pf_if(BranchKillableQueue_io_enq_bits_uop_xcpt_pf_if),
    .io_enq_bits_uop_xcpt_ae_if(BranchKillableQueue_io_enq_bits_uop_xcpt_ae_if),
    .io_enq_bits_uop_xcpt_ma_if(BranchKillableQueue_io_enq_bits_uop_xcpt_ma_if),
    .io_enq_bits_uop_bp_debug_if(BranchKillableQueue_io_enq_bits_uop_bp_debug_if),
    .io_enq_bits_uop_bp_xcpt_if(BranchKillableQueue_io_enq_bits_uop_bp_xcpt_if),
    .io_enq_bits_uop_debug_fsrc(BranchKillableQueue_io_enq_bits_uop_debug_fsrc),
    .io_enq_bits_uop_debug_tsrc(BranchKillableQueue_io_enq_bits_uop_debug_tsrc),
    .io_enq_bits_data(BranchKillableQueue_io_enq_bits_data),
    .io_enq_bits_predicated(BranchKillableQueue_io_enq_bits_predicated),
    .io_enq_bits_fflags_valid(BranchKillableQueue_io_enq_bits_fflags_valid),
    .io_enq_bits_fflags_bits_uop_switch(BranchKillableQueue_io_enq_bits_fflags_bits_uop_switch),
    .io_enq_bits_fflags_bits_uop_switch_off(BranchKillableQueue_io_enq_bits_fflags_bits_uop_switch_off),
    .io_enq_bits_fflags_bits_uop_is_unicore(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_unicore),
    .io_enq_bits_fflags_bits_uop_shift(BranchKillableQueue_io_enq_bits_fflags_bits_uop_shift),
    .io_enq_bits_fflags_bits_uop_lrs3_rtype(BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs3_rtype),
    .io_enq_bits_fflags_bits_uop_rflag(BranchKillableQueue_io_enq_bits_fflags_bits_uop_rflag),
    .io_enq_bits_fflags_bits_uop_wflag(BranchKillableQueue_io_enq_bits_fflags_bits_uop_wflag),
    .io_enq_bits_fflags_bits_uop_prflag(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prflag),
    .io_enq_bits_fflags_bits_uop_pwflag(BranchKillableQueue_io_enq_bits_fflags_bits_uop_pwflag),
    .io_enq_bits_fflags_bits_uop_pflag_busy(BranchKillableQueue_io_enq_bits_fflags_bits_uop_pflag_busy),
    .io_enq_bits_fflags_bits_uop_stale_pflag(BranchKillableQueue_io_enq_bits_fflags_bits_uop_stale_pflag),
    .io_enq_bits_fflags_bits_uop_op1_sel(BranchKillableQueue_io_enq_bits_fflags_bits_uop_op1_sel),
    .io_enq_bits_fflags_bits_uop_op2_sel(BranchKillableQueue_io_enq_bits_fflags_bits_uop_op2_sel),
    .io_enq_bits_fflags_bits_uop_split_num(BranchKillableQueue_io_enq_bits_fflags_bits_uop_split_num),
    .io_enq_bits_fflags_bits_uop_self_index(BranchKillableQueue_io_enq_bits_fflags_bits_uop_self_index),
    .io_enq_bits_fflags_bits_uop_rob_inst_idx(BranchKillableQueue_io_enq_bits_fflags_bits_uop_rob_inst_idx),
    .io_enq_bits_fflags_bits_uop_address_num(BranchKillableQueue_io_enq_bits_fflags_bits_uop_address_num),
    .io_enq_bits_fflags_bits_uop_uopc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_uopc),
    .io_enq_bits_fflags_bits_uop_inst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_inst),
    .io_enq_bits_fflags_bits_uop_debug_inst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_inst),
    .io_enq_bits_fflags_bits_uop_is_rvc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_rvc),
    .io_enq_bits_fflags_bits_uop_debug_pc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_pc),
    .io_enq_bits_fflags_bits_uop_iq_type(BranchKillableQueue_io_enq_bits_fflags_bits_uop_iq_type),
    .io_enq_bits_fflags_bits_uop_fu_code(BranchKillableQueue_io_enq_bits_fflags_bits_uop_fu_code),
    .io_enq_bits_fflags_bits_uop_ctrl_br_type(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_br_type),
    .io_enq_bits_fflags_bits_uop_ctrl_op1_sel(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_op2_sel(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_imm_sel(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_op_fcn(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_enq_bits_fflags_bits_uop_ctrl_fcn_dw(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_fflags_bits_uop_ctrl_csr_cmd(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_fflags_bits_uop_ctrl_is_load(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_load),
    .io_enq_bits_fflags_bits_uop_ctrl_is_sta(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_sta),
    .io_enq_bits_fflags_bits_uop_ctrl_is_std(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_std),
    .io_enq_bits_fflags_bits_uop_ctrl_op3_sel(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op3_sel),
    .io_enq_bits_fflags_bits_uop_iw_state(BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_state),
    .io_enq_bits_fflags_bits_uop_iw_p1_poisoned(BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_enq_bits_fflags_bits_uop_iw_p2_poisoned(BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_enq_bits_fflags_bits_uop_is_br(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_br),
    .io_enq_bits_fflags_bits_uop_is_jalr(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jalr),
    .io_enq_bits_fflags_bits_uop_is_jal(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jal),
    .io_enq_bits_fflags_bits_uop_is_sfb(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sfb),
    .io_enq_bits_fflags_bits_uop_br_mask(BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_mask),
    .io_enq_bits_fflags_bits_uop_br_tag(BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_tag),
    .io_enq_bits_fflags_bits_uop_ftq_idx(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ftq_idx),
    .io_enq_bits_fflags_bits_uop_edge_inst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_edge_inst),
    .io_enq_bits_fflags_bits_uop_pc_lob(BranchKillableQueue_io_enq_bits_fflags_bits_uop_pc_lob),
    .io_enq_bits_fflags_bits_uop_taken(BranchKillableQueue_io_enq_bits_fflags_bits_uop_taken),
    .io_enq_bits_fflags_bits_uop_imm_packed(BranchKillableQueue_io_enq_bits_fflags_bits_uop_imm_packed),
    .io_enq_bits_fflags_bits_uop_csr_addr(BranchKillableQueue_io_enq_bits_fflags_bits_uop_csr_addr),
    .io_enq_bits_fflags_bits_uop_rob_idx(BranchKillableQueue_io_enq_bits_fflags_bits_uop_rob_idx),
    .io_enq_bits_fflags_bits_uop_ldq_idx(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldq_idx),
    .io_enq_bits_fflags_bits_uop_stq_idx(BranchKillableQueue_io_enq_bits_fflags_bits_uop_stq_idx),
    .io_enq_bits_fflags_bits_uop_rxq_idx(BranchKillableQueue_io_enq_bits_fflags_bits_uop_rxq_idx),
    .io_enq_bits_fflags_bits_uop_pdst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_pdst),
    .io_enq_bits_fflags_bits_uop_prs1(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1),
    .io_enq_bits_fflags_bits_uop_prs2(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2),
    .io_enq_bits_fflags_bits_uop_prs3(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3),
    .io_enq_bits_fflags_bits_uop_ppred(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred),
    .io_enq_bits_fflags_bits_uop_prs1_busy(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1_busy),
    .io_enq_bits_fflags_bits_uop_prs2_busy(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2_busy),
    .io_enq_bits_fflags_bits_uop_prs3_busy(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3_busy),
    .io_enq_bits_fflags_bits_uop_ppred_busy(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred_busy),
    .io_enq_bits_fflags_bits_uop_stale_pdst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_stale_pdst),
    .io_enq_bits_fflags_bits_uop_exception(BranchKillableQueue_io_enq_bits_fflags_bits_uop_exception),
    .io_enq_bits_fflags_bits_uop_exc_cause(BranchKillableQueue_io_enq_bits_fflags_bits_uop_exc_cause),
    .io_enq_bits_fflags_bits_uop_bypassable(BranchKillableQueue_io_enq_bits_fflags_bits_uop_bypassable),
    .io_enq_bits_fflags_bits_uop_mem_cmd(BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_cmd),
    .io_enq_bits_fflags_bits_uop_mem_size(BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_size),
    .io_enq_bits_fflags_bits_uop_mem_signed(BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_signed),
    .io_enq_bits_fflags_bits_uop_is_fence(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fence),
    .io_enq_bits_fflags_bits_uop_is_fencei(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fencei),
    .io_enq_bits_fflags_bits_uop_is_amo(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_amo),
    .io_enq_bits_fflags_bits_uop_uses_ldq(BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_ldq),
    .io_enq_bits_fflags_bits_uop_uses_stq(BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_stq),
    .io_enq_bits_fflags_bits_uop_is_sys_pc2epc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_enq_bits_fflags_bits_uop_is_unique(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_unique),
    .io_enq_bits_fflags_bits_uop_flush_on_commit(BranchKillableQueue_io_enq_bits_fflags_bits_uop_flush_on_commit),
    .io_enq_bits_fflags_bits_uop_ldst_is_rs1(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_is_rs1),
    .io_enq_bits_fflags_bits_uop_ldst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst),
    .io_enq_bits_fflags_bits_uop_lrs1(BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1),
    .io_enq_bits_fflags_bits_uop_lrs2(BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2),
    .io_enq_bits_fflags_bits_uop_lrs3(BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs3),
    .io_enq_bits_fflags_bits_uop_ldst_val(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_val),
    .io_enq_bits_fflags_bits_uop_dst_rtype(BranchKillableQueue_io_enq_bits_fflags_bits_uop_dst_rtype),
    .io_enq_bits_fflags_bits_uop_lrs1_rtype(BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1_rtype),
    .io_enq_bits_fflags_bits_uop_lrs2_rtype(BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2_rtype),
    .io_enq_bits_fflags_bits_uop_frs3_en(BranchKillableQueue_io_enq_bits_fflags_bits_uop_frs3_en),
    .io_enq_bits_fflags_bits_uop_fp_val(BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_val),
    .io_enq_bits_fflags_bits_uop_fp_single(BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_single),
    .io_enq_bits_fflags_bits_uop_xcpt_pf_if(BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_pf_if),
    .io_enq_bits_fflags_bits_uop_xcpt_ae_if(BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ae_if),
    .io_enq_bits_fflags_bits_uop_xcpt_ma_if(BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ma_if),
    .io_enq_bits_fflags_bits_uop_bp_debug_if(BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_debug_if),
    .io_enq_bits_fflags_bits_uop_bp_xcpt_if(BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_xcpt_if),
    .io_enq_bits_fflags_bits_uop_debug_fsrc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_fsrc),
    .io_enq_bits_fflags_bits_uop_debug_tsrc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_tsrc),
    .io_enq_bits_fflags_bits_flags(BranchKillableQueue_io_enq_bits_fflags_bits_flags),
    .io_enq_bits_flagdata(BranchKillableQueue_io_enq_bits_flagdata),
    .io_enq_bits_fflagdata_valid(BranchKillableQueue_io_enq_bits_fflagdata_valid),
    .io_enq_bits_fflagdata_bits_uop_switch(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_switch),
    .io_enq_bits_fflagdata_bits_uop_switch_off(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_switch_off),
    .io_enq_bits_fflagdata_bits_uop_is_unicore(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_unicore),
    .io_enq_bits_fflagdata_bits_uop_shift(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_shift),
    .io_enq_bits_fflagdata_bits_uop_lrs3_rtype(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs3_rtype),
    .io_enq_bits_fflagdata_bits_uop_rflag(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rflag),
    .io_enq_bits_fflagdata_bits_uop_wflag(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_wflag),
    .io_enq_bits_fflagdata_bits_uop_prflag(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prflag),
    .io_enq_bits_fflagdata_bits_uop_pwflag(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pwflag),
    .io_enq_bits_fflagdata_bits_uop_pflag_busy(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pflag_busy),
    .io_enq_bits_fflagdata_bits_uop_stale_pflag(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_stale_pflag),
    .io_enq_bits_fflagdata_bits_uop_op1_sel(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_op1_sel),
    .io_enq_bits_fflagdata_bits_uop_op2_sel(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_op2_sel),
    .io_enq_bits_fflagdata_bits_uop_split_num(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_split_num),
    .io_enq_bits_fflagdata_bits_uop_self_index(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_self_index),
    .io_enq_bits_fflagdata_bits_uop_rob_inst_idx(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rob_inst_idx),
    .io_enq_bits_fflagdata_bits_uop_address_num(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_address_num),
    .io_enq_bits_fflagdata_bits_uop_uopc(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_uopc),
    .io_enq_bits_fflagdata_bits_uop_inst(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_inst),
    .io_enq_bits_fflagdata_bits_uop_debug_inst(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_inst),
    .io_enq_bits_fflagdata_bits_uop_is_rvc(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_rvc),
    .io_enq_bits_fflagdata_bits_uop_debug_pc(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_pc),
    .io_enq_bits_fflagdata_bits_uop_iq_type(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iq_type),
    .io_enq_bits_fflagdata_bits_uop_fu_code(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_fu_code),
    .io_enq_bits_fflagdata_bits_uop_ctrl_br_type(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_br_type),
    .io_enq_bits_fflagdata_bits_uop_ctrl_op1_sel(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op1_sel),
    .io_enq_bits_fflagdata_bits_uop_ctrl_op2_sel(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op2_sel),
    .io_enq_bits_fflagdata_bits_uop_ctrl_imm_sel(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_imm_sel),
    .io_enq_bits_fflagdata_bits_uop_ctrl_op_fcn(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op_fcn),
    .io_enq_bits_fflagdata_bits_uop_ctrl_fcn_dw(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_fflagdata_bits_uop_ctrl_csr_cmd(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_fflagdata_bits_uop_ctrl_is_load(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_is_load),
    .io_enq_bits_fflagdata_bits_uop_ctrl_is_sta(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_is_sta),
    .io_enq_bits_fflagdata_bits_uop_ctrl_is_std(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_is_std),
    .io_enq_bits_fflagdata_bits_uop_ctrl_op3_sel(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op3_sel),
    .io_enq_bits_fflagdata_bits_uop_iw_state(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iw_state),
    .io_enq_bits_fflagdata_bits_uop_iw_p1_poisoned(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iw_p1_poisoned),
    .io_enq_bits_fflagdata_bits_uop_iw_p2_poisoned(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iw_p2_poisoned),
    .io_enq_bits_fflagdata_bits_uop_is_br(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_br),
    .io_enq_bits_fflagdata_bits_uop_is_jalr(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_jalr),
    .io_enq_bits_fflagdata_bits_uop_is_jal(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_jal),
    .io_enq_bits_fflagdata_bits_uop_is_sfb(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_sfb),
    .io_enq_bits_fflagdata_bits_uop_br_mask(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_br_mask),
    .io_enq_bits_fflagdata_bits_uop_br_tag(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_br_tag),
    .io_enq_bits_fflagdata_bits_uop_ftq_idx(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ftq_idx),
    .io_enq_bits_fflagdata_bits_uop_edge_inst(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_edge_inst),
    .io_enq_bits_fflagdata_bits_uop_pc_lob(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pc_lob),
    .io_enq_bits_fflagdata_bits_uop_taken(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_taken),
    .io_enq_bits_fflagdata_bits_uop_imm_packed(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_imm_packed),
    .io_enq_bits_fflagdata_bits_uop_csr_addr(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_csr_addr),
    .io_enq_bits_fflagdata_bits_uop_rob_idx(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rob_idx),
    .io_enq_bits_fflagdata_bits_uop_ldq_idx(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldq_idx),
    .io_enq_bits_fflagdata_bits_uop_stq_idx(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_stq_idx),
    .io_enq_bits_fflagdata_bits_uop_rxq_idx(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rxq_idx),
    .io_enq_bits_fflagdata_bits_uop_pdst(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pdst),
    .io_enq_bits_fflagdata_bits_uop_prs1(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs1),
    .io_enq_bits_fflagdata_bits_uop_prs2(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs2),
    .io_enq_bits_fflagdata_bits_uop_prs3(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs3),
    .io_enq_bits_fflagdata_bits_uop_ppred(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ppred),
    .io_enq_bits_fflagdata_bits_uop_prs1_busy(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs1_busy),
    .io_enq_bits_fflagdata_bits_uop_prs2_busy(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs2_busy),
    .io_enq_bits_fflagdata_bits_uop_prs3_busy(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs3_busy),
    .io_enq_bits_fflagdata_bits_uop_ppred_busy(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ppred_busy),
    .io_enq_bits_fflagdata_bits_uop_stale_pdst(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_stale_pdst),
    .io_enq_bits_fflagdata_bits_uop_exception(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_exception),
    .io_enq_bits_fflagdata_bits_uop_exc_cause(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_exc_cause),
    .io_enq_bits_fflagdata_bits_uop_bypassable(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_bypassable),
    .io_enq_bits_fflagdata_bits_uop_mem_cmd(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_mem_cmd),
    .io_enq_bits_fflagdata_bits_uop_mem_size(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_mem_size),
    .io_enq_bits_fflagdata_bits_uop_mem_signed(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_mem_signed),
    .io_enq_bits_fflagdata_bits_uop_is_fence(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_fence),
    .io_enq_bits_fflagdata_bits_uop_is_fencei(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_fencei),
    .io_enq_bits_fflagdata_bits_uop_is_amo(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_amo),
    .io_enq_bits_fflagdata_bits_uop_uses_ldq(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_uses_ldq),
    .io_enq_bits_fflagdata_bits_uop_uses_stq(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_uses_stq),
    .io_enq_bits_fflagdata_bits_uop_is_sys_pc2epc(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_sys_pc2epc),
    .io_enq_bits_fflagdata_bits_uop_is_unique(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_unique),
    .io_enq_bits_fflagdata_bits_uop_flush_on_commit(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_flush_on_commit),
    .io_enq_bits_fflagdata_bits_uop_ldst_is_rs1(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldst_is_rs1),
    .io_enq_bits_fflagdata_bits_uop_ldst(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldst),
    .io_enq_bits_fflagdata_bits_uop_lrs1(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs1),
    .io_enq_bits_fflagdata_bits_uop_lrs2(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs2),
    .io_enq_bits_fflagdata_bits_uop_lrs3(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs3),
    .io_enq_bits_fflagdata_bits_uop_ldst_val(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldst_val),
    .io_enq_bits_fflagdata_bits_uop_dst_rtype(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_dst_rtype),
    .io_enq_bits_fflagdata_bits_uop_lrs1_rtype(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs1_rtype),
    .io_enq_bits_fflagdata_bits_uop_lrs2_rtype(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs2_rtype),
    .io_enq_bits_fflagdata_bits_uop_frs3_en(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_frs3_en),
    .io_enq_bits_fflagdata_bits_uop_fp_val(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_fp_val),
    .io_enq_bits_fflagdata_bits_uop_fp_single(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_fp_single),
    .io_enq_bits_fflagdata_bits_uop_xcpt_pf_if(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_xcpt_pf_if),
    .io_enq_bits_fflagdata_bits_uop_xcpt_ae_if(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_xcpt_ae_if),
    .io_enq_bits_fflagdata_bits_uop_xcpt_ma_if(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_xcpt_ma_if),
    .io_enq_bits_fflagdata_bits_uop_bp_debug_if(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_bp_debug_if),
    .io_enq_bits_fflagdata_bits_uop_bp_xcpt_if(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_bp_xcpt_if),
    .io_enq_bits_fflagdata_bits_uop_debug_fsrc(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_fsrc),
    .io_enq_bits_fflagdata_bits_uop_debug_tsrc(BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_tsrc),
    .io_enq_bits_fflagdata_bits_fflag(BranchKillableQueue_io_enq_bits_fflagdata_bits_fflag),
    .io_deq_ready(BranchKillableQueue_io_deq_ready),
    .io_deq_valid(BranchKillableQueue_io_deq_valid),
    .io_deq_bits_uop_switch(BranchKillableQueue_io_deq_bits_uop_switch),
    .io_deq_bits_uop_switch_off(BranchKillableQueue_io_deq_bits_uop_switch_off),
    .io_deq_bits_uop_is_unicore(BranchKillableQueue_io_deq_bits_uop_is_unicore),
    .io_deq_bits_uop_shift(BranchKillableQueue_io_deq_bits_uop_shift),
    .io_deq_bits_uop_lrs3_rtype(BranchKillableQueue_io_deq_bits_uop_lrs3_rtype),
    .io_deq_bits_uop_rflag(BranchKillableQueue_io_deq_bits_uop_rflag),
    .io_deq_bits_uop_wflag(BranchKillableQueue_io_deq_bits_uop_wflag),
    .io_deq_bits_uop_prflag(BranchKillableQueue_io_deq_bits_uop_prflag),
    .io_deq_bits_uop_pwflag(BranchKillableQueue_io_deq_bits_uop_pwflag),
    .io_deq_bits_uop_pflag_busy(BranchKillableQueue_io_deq_bits_uop_pflag_busy),
    .io_deq_bits_uop_stale_pflag(BranchKillableQueue_io_deq_bits_uop_stale_pflag),
    .io_deq_bits_uop_op1_sel(BranchKillableQueue_io_deq_bits_uop_op1_sel),
    .io_deq_bits_uop_op2_sel(BranchKillableQueue_io_deq_bits_uop_op2_sel),
    .io_deq_bits_uop_split_num(BranchKillableQueue_io_deq_bits_uop_split_num),
    .io_deq_bits_uop_self_index(BranchKillableQueue_io_deq_bits_uop_self_index),
    .io_deq_bits_uop_rob_inst_idx(BranchKillableQueue_io_deq_bits_uop_rob_inst_idx),
    .io_deq_bits_uop_address_num(BranchKillableQueue_io_deq_bits_uop_address_num),
    .io_deq_bits_uop_uopc(BranchKillableQueue_io_deq_bits_uop_uopc),
    .io_deq_bits_uop_inst(BranchKillableQueue_io_deq_bits_uop_inst),
    .io_deq_bits_uop_debug_inst(BranchKillableQueue_io_deq_bits_uop_debug_inst),
    .io_deq_bits_uop_is_rvc(BranchKillableQueue_io_deq_bits_uop_is_rvc),
    .io_deq_bits_uop_debug_pc(BranchKillableQueue_io_deq_bits_uop_debug_pc),
    .io_deq_bits_uop_iq_type(BranchKillableQueue_io_deq_bits_uop_iq_type),
    .io_deq_bits_uop_fu_code(BranchKillableQueue_io_deq_bits_uop_fu_code),
    .io_deq_bits_uop_ctrl_br_type(BranchKillableQueue_io_deq_bits_uop_ctrl_br_type),
    .io_deq_bits_uop_ctrl_op1_sel(BranchKillableQueue_io_deq_bits_uop_ctrl_op1_sel),
    .io_deq_bits_uop_ctrl_op2_sel(BranchKillableQueue_io_deq_bits_uop_ctrl_op2_sel),
    .io_deq_bits_uop_ctrl_imm_sel(BranchKillableQueue_io_deq_bits_uop_ctrl_imm_sel),
    .io_deq_bits_uop_ctrl_op_fcn(BranchKillableQueue_io_deq_bits_uop_ctrl_op_fcn),
    .io_deq_bits_uop_ctrl_fcn_dw(BranchKillableQueue_io_deq_bits_uop_ctrl_fcn_dw),
    .io_deq_bits_uop_ctrl_csr_cmd(BranchKillableQueue_io_deq_bits_uop_ctrl_csr_cmd),
    .io_deq_bits_uop_ctrl_is_load(BranchKillableQueue_io_deq_bits_uop_ctrl_is_load),
    .io_deq_bits_uop_ctrl_is_sta(BranchKillableQueue_io_deq_bits_uop_ctrl_is_sta),
    .io_deq_bits_uop_ctrl_is_std(BranchKillableQueue_io_deq_bits_uop_ctrl_is_std),
    .io_deq_bits_uop_ctrl_op3_sel(BranchKillableQueue_io_deq_bits_uop_ctrl_op3_sel),
    .io_deq_bits_uop_iw_state(BranchKillableQueue_io_deq_bits_uop_iw_state),
    .io_deq_bits_uop_iw_p1_poisoned(BranchKillableQueue_io_deq_bits_uop_iw_p1_poisoned),
    .io_deq_bits_uop_iw_p2_poisoned(BranchKillableQueue_io_deq_bits_uop_iw_p2_poisoned),
    .io_deq_bits_uop_is_br(BranchKillableQueue_io_deq_bits_uop_is_br),
    .io_deq_bits_uop_is_jalr(BranchKillableQueue_io_deq_bits_uop_is_jalr),
    .io_deq_bits_uop_is_jal(BranchKillableQueue_io_deq_bits_uop_is_jal),
    .io_deq_bits_uop_is_sfb(BranchKillableQueue_io_deq_bits_uop_is_sfb),
    .io_deq_bits_uop_br_mask(BranchKillableQueue_io_deq_bits_uop_br_mask),
    .io_deq_bits_uop_br_tag(BranchKillableQueue_io_deq_bits_uop_br_tag),
    .io_deq_bits_uop_ftq_idx(BranchKillableQueue_io_deq_bits_uop_ftq_idx),
    .io_deq_bits_uop_edge_inst(BranchKillableQueue_io_deq_bits_uop_edge_inst),
    .io_deq_bits_uop_pc_lob(BranchKillableQueue_io_deq_bits_uop_pc_lob),
    .io_deq_bits_uop_taken(BranchKillableQueue_io_deq_bits_uop_taken),
    .io_deq_bits_uop_imm_packed(BranchKillableQueue_io_deq_bits_uop_imm_packed),
    .io_deq_bits_uop_csr_addr(BranchKillableQueue_io_deq_bits_uop_csr_addr),
    .io_deq_bits_uop_rob_idx(BranchKillableQueue_io_deq_bits_uop_rob_idx),
    .io_deq_bits_uop_ldq_idx(BranchKillableQueue_io_deq_bits_uop_ldq_idx),
    .io_deq_bits_uop_stq_idx(BranchKillableQueue_io_deq_bits_uop_stq_idx),
    .io_deq_bits_uop_rxq_idx(BranchKillableQueue_io_deq_bits_uop_rxq_idx),
    .io_deq_bits_uop_pdst(BranchKillableQueue_io_deq_bits_uop_pdst),
    .io_deq_bits_uop_prs1(BranchKillableQueue_io_deq_bits_uop_prs1),
    .io_deq_bits_uop_prs2(BranchKillableQueue_io_deq_bits_uop_prs2),
    .io_deq_bits_uop_prs3(BranchKillableQueue_io_deq_bits_uop_prs3),
    .io_deq_bits_uop_ppred(BranchKillableQueue_io_deq_bits_uop_ppred),
    .io_deq_bits_uop_prs1_busy(BranchKillableQueue_io_deq_bits_uop_prs1_busy),
    .io_deq_bits_uop_prs2_busy(BranchKillableQueue_io_deq_bits_uop_prs2_busy),
    .io_deq_bits_uop_prs3_busy(BranchKillableQueue_io_deq_bits_uop_prs3_busy),
    .io_deq_bits_uop_ppred_busy(BranchKillableQueue_io_deq_bits_uop_ppred_busy),
    .io_deq_bits_uop_stale_pdst(BranchKillableQueue_io_deq_bits_uop_stale_pdst),
    .io_deq_bits_uop_exception(BranchKillableQueue_io_deq_bits_uop_exception),
    .io_deq_bits_uop_exc_cause(BranchKillableQueue_io_deq_bits_uop_exc_cause),
    .io_deq_bits_uop_bypassable(BranchKillableQueue_io_deq_bits_uop_bypassable),
    .io_deq_bits_uop_mem_cmd(BranchKillableQueue_io_deq_bits_uop_mem_cmd),
    .io_deq_bits_uop_mem_size(BranchKillableQueue_io_deq_bits_uop_mem_size),
    .io_deq_bits_uop_mem_signed(BranchKillableQueue_io_deq_bits_uop_mem_signed),
    .io_deq_bits_uop_is_fence(BranchKillableQueue_io_deq_bits_uop_is_fence),
    .io_deq_bits_uop_is_fencei(BranchKillableQueue_io_deq_bits_uop_is_fencei),
    .io_deq_bits_uop_is_amo(BranchKillableQueue_io_deq_bits_uop_is_amo),
    .io_deq_bits_uop_uses_ldq(BranchKillableQueue_io_deq_bits_uop_uses_ldq),
    .io_deq_bits_uop_uses_stq(BranchKillableQueue_io_deq_bits_uop_uses_stq),
    .io_deq_bits_uop_is_sys_pc2epc(BranchKillableQueue_io_deq_bits_uop_is_sys_pc2epc),
    .io_deq_bits_uop_is_unique(BranchKillableQueue_io_deq_bits_uop_is_unique),
    .io_deq_bits_uop_flush_on_commit(BranchKillableQueue_io_deq_bits_uop_flush_on_commit),
    .io_deq_bits_uop_ldst_is_rs1(BranchKillableQueue_io_deq_bits_uop_ldst_is_rs1),
    .io_deq_bits_uop_ldst(BranchKillableQueue_io_deq_bits_uop_ldst),
    .io_deq_bits_uop_lrs1(BranchKillableQueue_io_deq_bits_uop_lrs1),
    .io_deq_bits_uop_lrs2(BranchKillableQueue_io_deq_bits_uop_lrs2),
    .io_deq_bits_uop_lrs3(BranchKillableQueue_io_deq_bits_uop_lrs3),
    .io_deq_bits_uop_ldst_val(BranchKillableQueue_io_deq_bits_uop_ldst_val),
    .io_deq_bits_uop_dst_rtype(BranchKillableQueue_io_deq_bits_uop_dst_rtype),
    .io_deq_bits_uop_lrs1_rtype(BranchKillableQueue_io_deq_bits_uop_lrs1_rtype),
    .io_deq_bits_uop_lrs2_rtype(BranchKillableQueue_io_deq_bits_uop_lrs2_rtype),
    .io_deq_bits_uop_frs3_en(BranchKillableQueue_io_deq_bits_uop_frs3_en),
    .io_deq_bits_uop_fp_val(BranchKillableQueue_io_deq_bits_uop_fp_val),
    .io_deq_bits_uop_fp_single(BranchKillableQueue_io_deq_bits_uop_fp_single),
    .io_deq_bits_uop_xcpt_pf_if(BranchKillableQueue_io_deq_bits_uop_xcpt_pf_if),
    .io_deq_bits_uop_xcpt_ae_if(BranchKillableQueue_io_deq_bits_uop_xcpt_ae_if),
    .io_deq_bits_uop_xcpt_ma_if(BranchKillableQueue_io_deq_bits_uop_xcpt_ma_if),
    .io_deq_bits_uop_bp_debug_if(BranchKillableQueue_io_deq_bits_uop_bp_debug_if),
    .io_deq_bits_uop_bp_xcpt_if(BranchKillableQueue_io_deq_bits_uop_bp_xcpt_if),
    .io_deq_bits_uop_debug_fsrc(BranchKillableQueue_io_deq_bits_uop_debug_fsrc),
    .io_deq_bits_uop_debug_tsrc(BranchKillableQueue_io_deq_bits_uop_debug_tsrc),
    .io_deq_bits_data(BranchKillableQueue_io_deq_bits_data),
    .io_deq_bits_predicated(BranchKillableQueue_io_deq_bits_predicated),
    .io_deq_bits_fflags_valid(BranchKillableQueue_io_deq_bits_fflags_valid),
    .io_deq_bits_fflags_bits_uop_switch(BranchKillableQueue_io_deq_bits_fflags_bits_uop_switch),
    .io_deq_bits_fflags_bits_uop_switch_off(BranchKillableQueue_io_deq_bits_fflags_bits_uop_switch_off),
    .io_deq_bits_fflags_bits_uop_is_unicore(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_unicore),
    .io_deq_bits_fflags_bits_uop_shift(BranchKillableQueue_io_deq_bits_fflags_bits_uop_shift),
    .io_deq_bits_fflags_bits_uop_lrs3_rtype(BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs3_rtype),
    .io_deq_bits_fflags_bits_uop_rflag(BranchKillableQueue_io_deq_bits_fflags_bits_uop_rflag),
    .io_deq_bits_fflags_bits_uop_wflag(BranchKillableQueue_io_deq_bits_fflags_bits_uop_wflag),
    .io_deq_bits_fflags_bits_uop_prflag(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prflag),
    .io_deq_bits_fflags_bits_uop_pwflag(BranchKillableQueue_io_deq_bits_fflags_bits_uop_pwflag),
    .io_deq_bits_fflags_bits_uop_pflag_busy(BranchKillableQueue_io_deq_bits_fflags_bits_uop_pflag_busy),
    .io_deq_bits_fflags_bits_uop_stale_pflag(BranchKillableQueue_io_deq_bits_fflags_bits_uop_stale_pflag),
    .io_deq_bits_fflags_bits_uop_op1_sel(BranchKillableQueue_io_deq_bits_fflags_bits_uop_op1_sel),
    .io_deq_bits_fflags_bits_uop_op2_sel(BranchKillableQueue_io_deq_bits_fflags_bits_uop_op2_sel),
    .io_deq_bits_fflags_bits_uop_split_num(BranchKillableQueue_io_deq_bits_fflags_bits_uop_split_num),
    .io_deq_bits_fflags_bits_uop_self_index(BranchKillableQueue_io_deq_bits_fflags_bits_uop_self_index),
    .io_deq_bits_fflags_bits_uop_rob_inst_idx(BranchKillableQueue_io_deq_bits_fflags_bits_uop_rob_inst_idx),
    .io_deq_bits_fflags_bits_uop_address_num(BranchKillableQueue_io_deq_bits_fflags_bits_uop_address_num),
    .io_deq_bits_fflags_bits_uop_uopc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_uopc),
    .io_deq_bits_fflags_bits_uop_inst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_inst),
    .io_deq_bits_fflags_bits_uop_debug_inst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_inst),
    .io_deq_bits_fflags_bits_uop_is_rvc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_rvc),
    .io_deq_bits_fflags_bits_uop_debug_pc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_pc),
    .io_deq_bits_fflags_bits_uop_iq_type(BranchKillableQueue_io_deq_bits_fflags_bits_uop_iq_type),
    .io_deq_bits_fflags_bits_uop_fu_code(BranchKillableQueue_io_deq_bits_fflags_bits_uop_fu_code),
    .io_deq_bits_fflags_bits_uop_ctrl_br_type(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_br_type),
    .io_deq_bits_fflags_bits_uop_ctrl_op1_sel(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_deq_bits_fflags_bits_uop_ctrl_op2_sel(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_deq_bits_fflags_bits_uop_ctrl_imm_sel(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_deq_bits_fflags_bits_uop_ctrl_op_fcn(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_deq_bits_fflags_bits_uop_ctrl_fcn_dw(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_deq_bits_fflags_bits_uop_ctrl_csr_cmd(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_deq_bits_fflags_bits_uop_ctrl_is_load(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_load),
    .io_deq_bits_fflags_bits_uop_ctrl_is_sta(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_sta),
    .io_deq_bits_fflags_bits_uop_ctrl_is_std(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_std),
    .io_deq_bits_fflags_bits_uop_ctrl_op3_sel(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op3_sel),
    .io_deq_bits_fflags_bits_uop_iw_state(BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_state),
    .io_deq_bits_fflags_bits_uop_iw_p1_poisoned(BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_deq_bits_fflags_bits_uop_iw_p2_poisoned(BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_deq_bits_fflags_bits_uop_is_br(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_br),
    .io_deq_bits_fflags_bits_uop_is_jalr(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jalr),
    .io_deq_bits_fflags_bits_uop_is_jal(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jal),
    .io_deq_bits_fflags_bits_uop_is_sfb(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sfb),
    .io_deq_bits_fflags_bits_uop_br_mask(BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_mask),
    .io_deq_bits_fflags_bits_uop_br_tag(BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_tag),
    .io_deq_bits_fflags_bits_uop_ftq_idx(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ftq_idx),
    .io_deq_bits_fflags_bits_uop_edge_inst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_edge_inst),
    .io_deq_bits_fflags_bits_uop_pc_lob(BranchKillableQueue_io_deq_bits_fflags_bits_uop_pc_lob),
    .io_deq_bits_fflags_bits_uop_taken(BranchKillableQueue_io_deq_bits_fflags_bits_uop_taken),
    .io_deq_bits_fflags_bits_uop_imm_packed(BranchKillableQueue_io_deq_bits_fflags_bits_uop_imm_packed),
    .io_deq_bits_fflags_bits_uop_csr_addr(BranchKillableQueue_io_deq_bits_fflags_bits_uop_csr_addr),
    .io_deq_bits_fflags_bits_uop_rob_idx(BranchKillableQueue_io_deq_bits_fflags_bits_uop_rob_idx),
    .io_deq_bits_fflags_bits_uop_ldq_idx(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldq_idx),
    .io_deq_bits_fflags_bits_uop_stq_idx(BranchKillableQueue_io_deq_bits_fflags_bits_uop_stq_idx),
    .io_deq_bits_fflags_bits_uop_rxq_idx(BranchKillableQueue_io_deq_bits_fflags_bits_uop_rxq_idx),
    .io_deq_bits_fflags_bits_uop_pdst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_pdst),
    .io_deq_bits_fflags_bits_uop_prs1(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1),
    .io_deq_bits_fflags_bits_uop_prs2(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2),
    .io_deq_bits_fflags_bits_uop_prs3(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3),
    .io_deq_bits_fflags_bits_uop_ppred(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred),
    .io_deq_bits_fflags_bits_uop_prs1_busy(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1_busy),
    .io_deq_bits_fflags_bits_uop_prs2_busy(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2_busy),
    .io_deq_bits_fflags_bits_uop_prs3_busy(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3_busy),
    .io_deq_bits_fflags_bits_uop_ppred_busy(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred_busy),
    .io_deq_bits_fflags_bits_uop_stale_pdst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_stale_pdst),
    .io_deq_bits_fflags_bits_uop_exception(BranchKillableQueue_io_deq_bits_fflags_bits_uop_exception),
    .io_deq_bits_fflags_bits_uop_exc_cause(BranchKillableQueue_io_deq_bits_fflags_bits_uop_exc_cause),
    .io_deq_bits_fflags_bits_uop_bypassable(BranchKillableQueue_io_deq_bits_fflags_bits_uop_bypassable),
    .io_deq_bits_fflags_bits_uop_mem_cmd(BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_cmd),
    .io_deq_bits_fflags_bits_uop_mem_size(BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_size),
    .io_deq_bits_fflags_bits_uop_mem_signed(BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_signed),
    .io_deq_bits_fflags_bits_uop_is_fence(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fence),
    .io_deq_bits_fflags_bits_uop_is_fencei(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fencei),
    .io_deq_bits_fflags_bits_uop_is_amo(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_amo),
    .io_deq_bits_fflags_bits_uop_uses_ldq(BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_ldq),
    .io_deq_bits_fflags_bits_uop_uses_stq(BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_stq),
    .io_deq_bits_fflags_bits_uop_is_sys_pc2epc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_deq_bits_fflags_bits_uop_is_unique(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_unique),
    .io_deq_bits_fflags_bits_uop_flush_on_commit(BranchKillableQueue_io_deq_bits_fflags_bits_uop_flush_on_commit),
    .io_deq_bits_fflags_bits_uop_ldst_is_rs1(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_is_rs1),
    .io_deq_bits_fflags_bits_uop_ldst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst),
    .io_deq_bits_fflags_bits_uop_lrs1(BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1),
    .io_deq_bits_fflags_bits_uop_lrs2(BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2),
    .io_deq_bits_fflags_bits_uop_lrs3(BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs3),
    .io_deq_bits_fflags_bits_uop_ldst_val(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_val),
    .io_deq_bits_fflags_bits_uop_dst_rtype(BranchKillableQueue_io_deq_bits_fflags_bits_uop_dst_rtype),
    .io_deq_bits_fflags_bits_uop_lrs1_rtype(BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1_rtype),
    .io_deq_bits_fflags_bits_uop_lrs2_rtype(BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2_rtype),
    .io_deq_bits_fflags_bits_uop_frs3_en(BranchKillableQueue_io_deq_bits_fflags_bits_uop_frs3_en),
    .io_deq_bits_fflags_bits_uop_fp_val(BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_val),
    .io_deq_bits_fflags_bits_uop_fp_single(BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_single),
    .io_deq_bits_fflags_bits_uop_xcpt_pf_if(BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_pf_if),
    .io_deq_bits_fflags_bits_uop_xcpt_ae_if(BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ae_if),
    .io_deq_bits_fflags_bits_uop_xcpt_ma_if(BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ma_if),
    .io_deq_bits_fflags_bits_uop_bp_debug_if(BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_debug_if),
    .io_deq_bits_fflags_bits_uop_bp_xcpt_if(BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_xcpt_if),
    .io_deq_bits_fflags_bits_uop_debug_fsrc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_fsrc),
    .io_deq_bits_fflags_bits_uop_debug_tsrc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_tsrc),
    .io_deq_bits_fflags_bits_flags(BranchKillableQueue_io_deq_bits_fflags_bits_flags),
    .io_deq_bits_flagdata(BranchKillableQueue_io_deq_bits_flagdata),
    .io_deq_bits_fflagdata_valid(BranchKillableQueue_io_deq_bits_fflagdata_valid),
    .io_deq_bits_fflagdata_bits_uop_switch(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_switch),
    .io_deq_bits_fflagdata_bits_uop_switch_off(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_switch_off),
    .io_deq_bits_fflagdata_bits_uop_is_unicore(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_unicore),
    .io_deq_bits_fflagdata_bits_uop_shift(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_shift),
    .io_deq_bits_fflagdata_bits_uop_lrs3_rtype(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs3_rtype),
    .io_deq_bits_fflagdata_bits_uop_rflag(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rflag),
    .io_deq_bits_fflagdata_bits_uop_wflag(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_wflag),
    .io_deq_bits_fflagdata_bits_uop_prflag(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prflag),
    .io_deq_bits_fflagdata_bits_uop_pwflag(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pwflag),
    .io_deq_bits_fflagdata_bits_uop_pflag_busy(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pflag_busy),
    .io_deq_bits_fflagdata_bits_uop_stale_pflag(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_stale_pflag),
    .io_deq_bits_fflagdata_bits_uop_op1_sel(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_op1_sel),
    .io_deq_bits_fflagdata_bits_uop_op2_sel(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_op2_sel),
    .io_deq_bits_fflagdata_bits_uop_split_num(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_split_num),
    .io_deq_bits_fflagdata_bits_uop_self_index(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_self_index),
    .io_deq_bits_fflagdata_bits_uop_rob_inst_idx(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rob_inst_idx),
    .io_deq_bits_fflagdata_bits_uop_address_num(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_address_num),
    .io_deq_bits_fflagdata_bits_uop_uopc(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_uopc),
    .io_deq_bits_fflagdata_bits_uop_inst(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_inst),
    .io_deq_bits_fflagdata_bits_uop_debug_inst(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_inst),
    .io_deq_bits_fflagdata_bits_uop_is_rvc(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_rvc),
    .io_deq_bits_fflagdata_bits_uop_debug_pc(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_pc),
    .io_deq_bits_fflagdata_bits_uop_iq_type(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iq_type),
    .io_deq_bits_fflagdata_bits_uop_fu_code(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_fu_code),
    .io_deq_bits_fflagdata_bits_uop_ctrl_br_type(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_br_type),
    .io_deq_bits_fflagdata_bits_uop_ctrl_op1_sel(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op1_sel),
    .io_deq_bits_fflagdata_bits_uop_ctrl_op2_sel(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op2_sel),
    .io_deq_bits_fflagdata_bits_uop_ctrl_imm_sel(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_imm_sel),
    .io_deq_bits_fflagdata_bits_uop_ctrl_op_fcn(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op_fcn),
    .io_deq_bits_fflagdata_bits_uop_ctrl_fcn_dw(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_fcn_dw),
    .io_deq_bits_fflagdata_bits_uop_ctrl_csr_cmd(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_csr_cmd),
    .io_deq_bits_fflagdata_bits_uop_ctrl_is_load(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_is_load),
    .io_deq_bits_fflagdata_bits_uop_ctrl_is_sta(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_is_sta),
    .io_deq_bits_fflagdata_bits_uop_ctrl_is_std(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_is_std),
    .io_deq_bits_fflagdata_bits_uop_ctrl_op3_sel(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op3_sel),
    .io_deq_bits_fflagdata_bits_uop_iw_state(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iw_state),
    .io_deq_bits_fflagdata_bits_uop_iw_p1_poisoned(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iw_p1_poisoned),
    .io_deq_bits_fflagdata_bits_uop_iw_p2_poisoned(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iw_p2_poisoned),
    .io_deq_bits_fflagdata_bits_uop_is_br(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_br),
    .io_deq_bits_fflagdata_bits_uop_is_jalr(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_jalr),
    .io_deq_bits_fflagdata_bits_uop_is_jal(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_jal),
    .io_deq_bits_fflagdata_bits_uop_is_sfb(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_sfb),
    .io_deq_bits_fflagdata_bits_uop_br_mask(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_br_mask),
    .io_deq_bits_fflagdata_bits_uop_br_tag(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_br_tag),
    .io_deq_bits_fflagdata_bits_uop_ftq_idx(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ftq_idx),
    .io_deq_bits_fflagdata_bits_uop_edge_inst(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_edge_inst),
    .io_deq_bits_fflagdata_bits_uop_pc_lob(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pc_lob),
    .io_deq_bits_fflagdata_bits_uop_taken(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_taken),
    .io_deq_bits_fflagdata_bits_uop_imm_packed(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_imm_packed),
    .io_deq_bits_fflagdata_bits_uop_csr_addr(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_csr_addr),
    .io_deq_bits_fflagdata_bits_uop_rob_idx(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rob_idx),
    .io_deq_bits_fflagdata_bits_uop_ldq_idx(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldq_idx),
    .io_deq_bits_fflagdata_bits_uop_stq_idx(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_stq_idx),
    .io_deq_bits_fflagdata_bits_uop_rxq_idx(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rxq_idx),
    .io_deq_bits_fflagdata_bits_uop_pdst(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pdst),
    .io_deq_bits_fflagdata_bits_uop_prs1(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs1),
    .io_deq_bits_fflagdata_bits_uop_prs2(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs2),
    .io_deq_bits_fflagdata_bits_uop_prs3(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs3),
    .io_deq_bits_fflagdata_bits_uop_ppred(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ppred),
    .io_deq_bits_fflagdata_bits_uop_prs1_busy(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs1_busy),
    .io_deq_bits_fflagdata_bits_uop_prs2_busy(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs2_busy),
    .io_deq_bits_fflagdata_bits_uop_prs3_busy(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs3_busy),
    .io_deq_bits_fflagdata_bits_uop_ppred_busy(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ppred_busy),
    .io_deq_bits_fflagdata_bits_uop_stale_pdst(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_stale_pdst),
    .io_deq_bits_fflagdata_bits_uop_exception(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_exception),
    .io_deq_bits_fflagdata_bits_uop_exc_cause(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_exc_cause),
    .io_deq_bits_fflagdata_bits_uop_bypassable(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_bypassable),
    .io_deq_bits_fflagdata_bits_uop_mem_cmd(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_mem_cmd),
    .io_deq_bits_fflagdata_bits_uop_mem_size(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_mem_size),
    .io_deq_bits_fflagdata_bits_uop_mem_signed(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_mem_signed),
    .io_deq_bits_fflagdata_bits_uop_is_fence(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_fence),
    .io_deq_bits_fflagdata_bits_uop_is_fencei(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_fencei),
    .io_deq_bits_fflagdata_bits_uop_is_amo(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_amo),
    .io_deq_bits_fflagdata_bits_uop_uses_ldq(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_uses_ldq),
    .io_deq_bits_fflagdata_bits_uop_uses_stq(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_uses_stq),
    .io_deq_bits_fflagdata_bits_uop_is_sys_pc2epc(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_sys_pc2epc),
    .io_deq_bits_fflagdata_bits_uop_is_unique(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_unique),
    .io_deq_bits_fflagdata_bits_uop_flush_on_commit(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_flush_on_commit),
    .io_deq_bits_fflagdata_bits_uop_ldst_is_rs1(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldst_is_rs1),
    .io_deq_bits_fflagdata_bits_uop_ldst(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldst),
    .io_deq_bits_fflagdata_bits_uop_lrs1(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs1),
    .io_deq_bits_fflagdata_bits_uop_lrs2(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs2),
    .io_deq_bits_fflagdata_bits_uop_lrs3(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs3),
    .io_deq_bits_fflagdata_bits_uop_ldst_val(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldst_val),
    .io_deq_bits_fflagdata_bits_uop_dst_rtype(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_dst_rtype),
    .io_deq_bits_fflagdata_bits_uop_lrs1_rtype(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs1_rtype),
    .io_deq_bits_fflagdata_bits_uop_lrs2_rtype(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs2_rtype),
    .io_deq_bits_fflagdata_bits_uop_frs3_en(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_frs3_en),
    .io_deq_bits_fflagdata_bits_uop_fp_val(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_fp_val),
    .io_deq_bits_fflagdata_bits_uop_fp_single(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_fp_single),
    .io_deq_bits_fflagdata_bits_uop_xcpt_pf_if(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_xcpt_pf_if),
    .io_deq_bits_fflagdata_bits_uop_xcpt_ae_if(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_xcpt_ae_if),
    .io_deq_bits_fflagdata_bits_uop_xcpt_ma_if(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_xcpt_ma_if),
    .io_deq_bits_fflagdata_bits_uop_bp_debug_if(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_bp_debug_if),
    .io_deq_bits_fflagdata_bits_uop_bp_xcpt_if(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_bp_xcpt_if),
    .io_deq_bits_fflagdata_bits_uop_debug_fsrc(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_fsrc),
    .io_deq_bits_fflagdata_bits_uop_debug_tsrc(BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_tsrc),
    .io_deq_bits_fflagdata_bits_fflag(BranchKillableQueue_io_deq_bits_fflagdata_bits_fflag),
    .io_brupdate_b1_resolve_mask(BranchKillableQueue_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(BranchKillableQueue_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_switch(BranchKillableQueue_io_brupdate_b2_uop_switch),
    .io_brupdate_b2_uop_switch_off(BranchKillableQueue_io_brupdate_b2_uop_switch_off),
    .io_brupdate_b2_uop_is_unicore(BranchKillableQueue_io_brupdate_b2_uop_is_unicore),
    .io_brupdate_b2_uop_shift(BranchKillableQueue_io_brupdate_b2_uop_shift),
    .io_brupdate_b2_uop_lrs3_rtype(BranchKillableQueue_io_brupdate_b2_uop_lrs3_rtype),
    .io_brupdate_b2_uop_rflag(BranchKillableQueue_io_brupdate_b2_uop_rflag),
    .io_brupdate_b2_uop_wflag(BranchKillableQueue_io_brupdate_b2_uop_wflag),
    .io_brupdate_b2_uop_prflag(BranchKillableQueue_io_brupdate_b2_uop_prflag),
    .io_brupdate_b2_uop_pwflag(BranchKillableQueue_io_brupdate_b2_uop_pwflag),
    .io_brupdate_b2_uop_pflag_busy(BranchKillableQueue_io_brupdate_b2_uop_pflag_busy),
    .io_brupdate_b2_uop_stale_pflag(BranchKillableQueue_io_brupdate_b2_uop_stale_pflag),
    .io_brupdate_b2_uop_op1_sel(BranchKillableQueue_io_brupdate_b2_uop_op1_sel),
    .io_brupdate_b2_uop_op2_sel(BranchKillableQueue_io_brupdate_b2_uop_op2_sel),
    .io_brupdate_b2_uop_split_num(BranchKillableQueue_io_brupdate_b2_uop_split_num),
    .io_brupdate_b2_uop_self_index(BranchKillableQueue_io_brupdate_b2_uop_self_index),
    .io_brupdate_b2_uop_rob_inst_idx(BranchKillableQueue_io_brupdate_b2_uop_rob_inst_idx),
    .io_brupdate_b2_uop_address_num(BranchKillableQueue_io_brupdate_b2_uop_address_num),
    .io_brupdate_b2_uop_uopc(BranchKillableQueue_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(BranchKillableQueue_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(BranchKillableQueue_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(BranchKillableQueue_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(BranchKillableQueue_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(BranchKillableQueue_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(BranchKillableQueue_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(BranchKillableQueue_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(BranchKillableQueue_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(BranchKillableQueue_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(BranchKillableQueue_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(BranchKillableQueue_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(BranchKillableQueue_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(BranchKillableQueue_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_ctrl_op3_sel(BranchKillableQueue_io_brupdate_b2_uop_ctrl_op3_sel),
    .io_brupdate_b2_uop_iw_state(BranchKillableQueue_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(BranchKillableQueue_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(BranchKillableQueue_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(BranchKillableQueue_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(BranchKillableQueue_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(BranchKillableQueue_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(BranchKillableQueue_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(BranchKillableQueue_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(BranchKillableQueue_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(BranchKillableQueue_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(BranchKillableQueue_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(BranchKillableQueue_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(BranchKillableQueue_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(BranchKillableQueue_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(BranchKillableQueue_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(BranchKillableQueue_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(BranchKillableQueue_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(BranchKillableQueue_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(BranchKillableQueue_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(BranchKillableQueue_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(BranchKillableQueue_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(BranchKillableQueue_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(BranchKillableQueue_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(BranchKillableQueue_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(BranchKillableQueue_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(BranchKillableQueue_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(BranchKillableQueue_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(BranchKillableQueue_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(BranchKillableQueue_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(BranchKillableQueue_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(BranchKillableQueue_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(BranchKillableQueue_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(BranchKillableQueue_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(BranchKillableQueue_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(BranchKillableQueue_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(BranchKillableQueue_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(BranchKillableQueue_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(BranchKillableQueue_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(BranchKillableQueue_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(BranchKillableQueue_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(BranchKillableQueue_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(BranchKillableQueue_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(BranchKillableQueue_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(BranchKillableQueue_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(BranchKillableQueue_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(BranchKillableQueue_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(BranchKillableQueue_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(BranchKillableQueue_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(BranchKillableQueue_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(BranchKillableQueue_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(BranchKillableQueue_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(BranchKillableQueue_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(BranchKillableQueue_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(BranchKillableQueue_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(BranchKillableQueue_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(BranchKillableQueue_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(BranchKillableQueue_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(BranchKillableQueue_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(BranchKillableQueue_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(BranchKillableQueue_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(BranchKillableQueue_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(BranchKillableQueue_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(BranchKillableQueue_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(BranchKillableQueue_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(BranchKillableQueue_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(BranchKillableQueue_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(BranchKillableQueue_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(BranchKillableQueue_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(BranchKillableQueue_io_brupdate_b2_target_offset),
    .io_flush(BranchKillableQueue_io_flush),
    .io_empty(BranchKillableQueue_io_empty),
    .io_count(BranchKillableQueue_io_count)
  );
  assign io_fu_types = 10'hb | _T_16; // @[execution-unit.scala 269:49]
  assign io_req_ready = ifpu_io_req_ready; // @[execution-unit.scala 354:24]
  assign io_iresp_valid = alu_io_resp_valid | imul_io_resp_valid; // @[execution-unit.scala 432:71]
  assign io_iresp_bits_uop_switch = alu_io_resp_valid ? alu_io_resp_bits_uop_switch : imul_io_resp_bits_uop_switch; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_switch_off = alu_io_resp_valid ? alu_io_resp_bits_uop_switch_off :
    imul_io_resp_bits_uop_switch_off; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_unicore = alu_io_resp_valid ? alu_io_resp_bits_uop_is_unicore :
    imul_io_resp_bits_uop_is_unicore; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_shift = alu_io_resp_valid ? alu_io_resp_bits_uop_shift : imul_io_resp_bits_uop_shift; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_lrs3_rtype = alu_io_resp_valid ? alu_io_resp_bits_uop_lrs3_rtype :
    imul_io_resp_bits_uop_lrs3_rtype; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_rflag = alu_io_resp_valid ? alu_io_resp_bits_uop_rflag : imul_io_resp_bits_uop_rflag; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_wflag = alu_io_resp_valid ? alu_io_resp_bits_uop_wflag : imul_io_resp_bits_uop_wflag; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prflag = alu_io_resp_valid ? alu_io_resp_bits_uop_prflag : imul_io_resp_bits_uop_prflag; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_pwflag = alu_io_resp_valid ? alu_io_resp_bits_uop_pwflag : imul_io_resp_bits_uop_pwflag; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_pflag_busy = alu_io_resp_valid ? alu_io_resp_bits_uop_pflag_busy :
    imul_io_resp_bits_uop_pflag_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_stale_pflag = alu_io_resp_valid ? alu_io_resp_bits_uop_stale_pflag :
    imul_io_resp_bits_uop_stale_pflag; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_op1_sel = alu_io_resp_valid ? alu_io_resp_bits_uop_op1_sel : imul_io_resp_bits_uop_op1_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_op2_sel = alu_io_resp_valid ? alu_io_resp_bits_uop_op2_sel : imul_io_resp_bits_uop_op2_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_split_num = alu_io_resp_valid ? alu_io_resp_bits_uop_split_num :
    imul_io_resp_bits_uop_split_num; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_self_index = alu_io_resp_valid ? alu_io_resp_bits_uop_self_index :
    imul_io_resp_bits_uop_self_index; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_rob_inst_idx = alu_io_resp_valid ? alu_io_resp_bits_uop_rob_inst_idx :
    imul_io_resp_bits_uop_rob_inst_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_address_num = alu_io_resp_valid ? alu_io_resp_bits_uop_address_num :
    imul_io_resp_bits_uop_address_num; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_uopc = alu_io_resp_valid ? alu_io_resp_bits_uop_uopc : imul_io_resp_bits_uop_uopc; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_inst = alu_io_resp_valid ? alu_io_resp_bits_uop_inst : imul_io_resp_bits_uop_inst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_debug_inst = alu_io_resp_valid ? alu_io_resp_bits_uop_debug_inst :
    imul_io_resp_bits_uop_debug_inst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_rvc = alu_io_resp_valid ? alu_io_resp_bits_uop_is_rvc : imul_io_resp_bits_uop_is_rvc; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_debug_pc = alu_io_resp_valid ? alu_io_resp_bits_uop_debug_pc : imul_io_resp_bits_uop_debug_pc
    ; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_iq_type = alu_io_resp_valid ? alu_io_resp_bits_uop_iq_type : imul_io_resp_bits_uop_iq_type; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_fu_code = alu_io_resp_valid ? alu_io_resp_bits_uop_fu_code : imul_io_resp_bits_uop_fu_code; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_br_type = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_br_type :
    imul_io_resp_bits_uop_ctrl_br_type; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_op1_sel = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_op1_sel :
    imul_io_resp_bits_uop_ctrl_op1_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_op2_sel = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_op2_sel :
    imul_io_resp_bits_uop_ctrl_op2_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_imm_sel = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_imm_sel :
    imul_io_resp_bits_uop_ctrl_imm_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_op_fcn = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_op_fcn :
    imul_io_resp_bits_uop_ctrl_op_fcn; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_fcn_dw = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_fcn_dw :
    imul_io_resp_bits_uop_ctrl_fcn_dw; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_csr_cmd = alu_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 452:38]
  assign io_iresp_bits_uop_ctrl_is_load = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_is_load :
    imul_io_resp_bits_uop_ctrl_is_load; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_is_sta = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_is_sta :
    imul_io_resp_bits_uop_ctrl_is_sta; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_is_std = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_is_std :
    imul_io_resp_bits_uop_ctrl_is_std; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_op3_sel = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_op3_sel :
    imul_io_resp_bits_uop_ctrl_op3_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_iw_state = alu_io_resp_valid ? alu_io_resp_bits_uop_iw_state : imul_io_resp_bits_uop_iw_state
    ; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_iw_p1_poisoned = alu_io_resp_valid ? alu_io_resp_bits_uop_iw_p1_poisoned :
    imul_io_resp_bits_uop_iw_p1_poisoned; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_iw_p2_poisoned = alu_io_resp_valid ? alu_io_resp_bits_uop_iw_p2_poisoned :
    imul_io_resp_bits_uop_iw_p2_poisoned; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_br = alu_io_resp_valid ? alu_io_resp_bits_uop_is_br : imul_io_resp_bits_uop_is_br; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_jalr = alu_io_resp_valid ? alu_io_resp_bits_uop_is_jalr : imul_io_resp_bits_uop_is_jalr; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_jal = alu_io_resp_valid ? alu_io_resp_bits_uop_is_jal : imul_io_resp_bits_uop_is_jal; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_sfb = alu_io_resp_valid ? alu_io_resp_bits_uop_is_sfb : imul_io_resp_bits_uop_is_sfb; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_br_mask = alu_io_resp_valid ? alu_io_resp_bits_uop_br_mask : imul_io_resp_bits_uop_br_mask; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_br_tag = alu_io_resp_valid ? alu_io_resp_bits_uop_br_tag : imul_io_resp_bits_uop_br_tag; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ftq_idx = alu_io_resp_valid ? alu_io_resp_bits_uop_ftq_idx : imul_io_resp_bits_uop_ftq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_edge_inst = alu_io_resp_valid ? alu_io_resp_bits_uop_edge_inst :
    imul_io_resp_bits_uop_edge_inst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_pc_lob = alu_io_resp_valid ? alu_io_resp_bits_uop_pc_lob : imul_io_resp_bits_uop_pc_lob; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_taken = alu_io_resp_valid ? alu_io_resp_bits_uop_taken : imul_io_resp_bits_uop_taken; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_imm_packed = alu_io_resp_valid ? alu_io_resp_bits_uop_imm_packed :
    imul_io_resp_bits_uop_imm_packed; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_csr_addr = _T_80[11:0]; // @[execution-unit.scala 451:34]
  assign io_iresp_bits_uop_rob_idx = alu_io_resp_valid ? alu_io_resp_bits_uop_rob_idx : imul_io_resp_bits_uop_rob_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ldq_idx = alu_io_resp_valid ? alu_io_resp_bits_uop_ldq_idx : imul_io_resp_bits_uop_ldq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_stq_idx = alu_io_resp_valid ? alu_io_resp_bits_uop_stq_idx : imul_io_resp_bits_uop_stq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_rxq_idx = alu_io_resp_valid ? alu_io_resp_bits_uop_rxq_idx : imul_io_resp_bits_uop_rxq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_pdst = alu_io_resp_valid ? alu_io_resp_bits_uop_pdst : imul_io_resp_bits_uop_pdst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs1 = alu_io_resp_valid ? alu_io_resp_bits_uop_prs1 : imul_io_resp_bits_uop_prs1; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs2 = alu_io_resp_valid ? alu_io_resp_bits_uop_prs2 : imul_io_resp_bits_uop_prs2; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs3 = alu_io_resp_valid ? alu_io_resp_bits_uop_prs3 : imul_io_resp_bits_uop_prs3; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ppred = alu_io_resp_valid ? alu_io_resp_bits_uop_ppred : imul_io_resp_bits_uop_ppred; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs1_busy = alu_io_resp_valid ? alu_io_resp_bits_uop_prs1_busy :
    imul_io_resp_bits_uop_prs1_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs2_busy = alu_io_resp_valid ? alu_io_resp_bits_uop_prs2_busy :
    imul_io_resp_bits_uop_prs2_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs3_busy = alu_io_resp_valid ? alu_io_resp_bits_uop_prs3_busy :
    imul_io_resp_bits_uop_prs3_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ppred_busy = alu_io_resp_valid ? alu_io_resp_bits_uop_ppred_busy :
    imul_io_resp_bits_uop_ppred_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_stale_pdst = alu_io_resp_valid ? alu_io_resp_bits_uop_stale_pdst :
    imul_io_resp_bits_uop_stale_pdst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_exception = alu_io_resp_valid ? alu_io_resp_bits_uop_exception :
    imul_io_resp_bits_uop_exception; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_exc_cause = alu_io_resp_valid ? alu_io_resp_bits_uop_exc_cause :
    imul_io_resp_bits_uop_exc_cause; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_bypassable = alu_io_resp_valid ? alu_io_resp_bits_uop_bypassable :
    imul_io_resp_bits_uop_bypassable; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_mem_cmd = alu_io_resp_valid ? alu_io_resp_bits_uop_mem_cmd : imul_io_resp_bits_uop_mem_cmd; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_mem_size = alu_io_resp_valid ? alu_io_resp_bits_uop_mem_size : imul_io_resp_bits_uop_mem_size
    ; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_mem_signed = alu_io_resp_valid ? alu_io_resp_bits_uop_mem_signed :
    imul_io_resp_bits_uop_mem_signed; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_fence = alu_io_resp_valid ? alu_io_resp_bits_uop_is_fence : imul_io_resp_bits_uop_is_fence
    ; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_fencei = alu_io_resp_valid ? alu_io_resp_bits_uop_is_fencei :
    imul_io_resp_bits_uop_is_fencei; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_amo = alu_io_resp_valid ? alu_io_resp_bits_uop_is_amo : imul_io_resp_bits_uop_is_amo; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_uses_ldq = alu_io_resp_valid ? alu_io_resp_bits_uop_uses_ldq : imul_io_resp_bits_uop_uses_ldq
    ; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_uses_stq = alu_io_resp_valid ? alu_io_resp_bits_uop_uses_stq : imul_io_resp_bits_uop_uses_stq
    ; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_sys_pc2epc = alu_io_resp_valid ? alu_io_resp_bits_uop_is_sys_pc2epc :
    imul_io_resp_bits_uop_is_sys_pc2epc; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_unique = alu_io_resp_valid ? alu_io_resp_bits_uop_is_unique :
    imul_io_resp_bits_uop_is_unique; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_flush_on_commit = alu_io_resp_valid ? alu_io_resp_bits_uop_flush_on_commit :
    imul_io_resp_bits_uop_flush_on_commit; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ldst_is_rs1 = alu_io_resp_valid ? alu_io_resp_bits_uop_ldst_is_rs1 :
    imul_io_resp_bits_uop_ldst_is_rs1; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ldst = alu_io_resp_valid ? alu_io_resp_bits_uop_ldst : imul_io_resp_bits_uop_ldst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_lrs1 = alu_io_resp_valid ? alu_io_resp_bits_uop_lrs1 : imul_io_resp_bits_uop_lrs1; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_lrs2 = alu_io_resp_valid ? alu_io_resp_bits_uop_lrs2 : imul_io_resp_bits_uop_lrs2; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_lrs3 = alu_io_resp_valid ? alu_io_resp_bits_uop_lrs3 : imul_io_resp_bits_uop_lrs3; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ldst_val = alu_io_resp_valid ? alu_io_resp_bits_uop_ldst_val : imul_io_resp_bits_uop_ldst_val
    ; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_dst_rtype = alu_io_resp_valid ? alu_io_resp_bits_uop_dst_rtype :
    imul_io_resp_bits_uop_dst_rtype; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_lrs1_rtype = alu_io_resp_valid ? alu_io_resp_bits_uop_lrs1_rtype :
    imul_io_resp_bits_uop_lrs1_rtype; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_lrs2_rtype = alu_io_resp_valid ? alu_io_resp_bits_uop_lrs2_rtype :
    imul_io_resp_bits_uop_lrs2_rtype; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_frs3_en = alu_io_resp_valid ? alu_io_resp_bits_uop_frs3_en : imul_io_resp_bits_uop_frs3_en; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_fp_val = alu_io_resp_valid ? alu_io_resp_bits_uop_fp_val : imul_io_resp_bits_uop_fp_val; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_fp_single = alu_io_resp_valid ? alu_io_resp_bits_uop_fp_single :
    imul_io_resp_bits_uop_fp_single; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_xcpt_pf_if = alu_io_resp_valid ? alu_io_resp_bits_uop_xcpt_pf_if :
    imul_io_resp_bits_uop_xcpt_pf_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_xcpt_ae_if = alu_io_resp_valid ? alu_io_resp_bits_uop_xcpt_ae_if :
    imul_io_resp_bits_uop_xcpt_ae_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_xcpt_ma_if = alu_io_resp_valid ? alu_io_resp_bits_uop_xcpt_ma_if :
    imul_io_resp_bits_uop_xcpt_ma_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_bp_debug_if = alu_io_resp_valid ? alu_io_resp_bits_uop_bp_debug_if :
    imul_io_resp_bits_uop_bp_debug_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_bp_xcpt_if = alu_io_resp_valid ? alu_io_resp_bits_uop_bp_xcpt_if :
    imul_io_resp_bits_uop_bp_xcpt_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_debug_fsrc = alu_io_resp_valid ? alu_io_resp_bits_uop_debug_fsrc :
    imul_io_resp_bits_uop_debug_fsrc; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_debug_tsrc = alu_io_resp_valid ? alu_io_resp_bits_uop_debug_tsrc :
    imul_io_resp_bits_uop_debug_tsrc; // @[Mux.scala 47:69]
  assign io_iresp_bits_data = {{1'd0}, _T_40}; // @[Mux.scala 47:69]
  assign io_iresp_bits_predicated = alu_io_resp_valid ? alu_io_resp_bits_predicated : imul_io_resp_bits_predicated; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflags_valid = 1'h0; // @[execution-unit.scala 152:32]
  assign io_iresp_bits_fflags_bits_uop_switch = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_switch_off = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_unicore = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_shift = 3'h0;
  assign io_iresp_bits_fflags_bits_uop_lrs3_rtype = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_rflag = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_wflag = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_prflag = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_pwflag = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_pflag_busy = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_stale_pflag = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_op1_sel = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_op2_sel = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_split_num = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_self_index = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_rob_inst_idx = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_address_num = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_uopc = 7'h0;
  assign io_iresp_bits_fflags_bits_uop_inst = 32'h0;
  assign io_iresp_bits_fflags_bits_uop_debug_inst = 32'h0;
  assign io_iresp_bits_fflags_bits_uop_is_rvc = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_debug_pc = 40'h0;
  assign io_iresp_bits_fflags_bits_uop_iq_type = 3'h0;
  assign io_iresp_bits_fflags_bits_uop_fu_code = 10'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_br_type = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_op1_sel = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_op2_sel = 3'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_imm_sel = 3'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_op_fcn = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_fcn_dw = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_csr_cmd = 3'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_is_load = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_is_sta = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_is_std = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_op3_sel = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_iw_state = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_iw_p1_poisoned = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_iw_p2_poisoned = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_br = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_jalr = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_jal = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_sfb = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_br_mask = 12'h0;
  assign io_iresp_bits_fflags_bits_uop_br_tag = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_ftq_idx = 5'h0;
  assign io_iresp_bits_fflags_bits_uop_edge_inst = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_pc_lob = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_taken = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_imm_packed = 20'h0;
  assign io_iresp_bits_fflags_bits_uop_csr_addr = 12'h0;
  assign io_iresp_bits_fflags_bits_uop_rob_idx = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_ldq_idx = 5'h0;
  assign io_iresp_bits_fflags_bits_uop_stq_idx = 5'h0;
  assign io_iresp_bits_fflags_bits_uop_rxq_idx = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_pdst = 7'h0;
  assign io_iresp_bits_fflags_bits_uop_prs1 = 7'h0;
  assign io_iresp_bits_fflags_bits_uop_prs2 = 7'h0;
  assign io_iresp_bits_fflags_bits_uop_prs3 = 7'h0;
  assign io_iresp_bits_fflags_bits_uop_ppred = 5'h0;
  assign io_iresp_bits_fflags_bits_uop_prs1_busy = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_prs2_busy = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_prs3_busy = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ppred_busy = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_stale_pdst = 7'h0;
  assign io_iresp_bits_fflags_bits_uop_exception = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_exc_cause = 64'h0;
  assign io_iresp_bits_fflags_bits_uop_bypassable = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_mem_cmd = 5'h0;
  assign io_iresp_bits_fflags_bits_uop_mem_size = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_mem_signed = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_fence = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_fencei = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_amo = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_uses_ldq = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_uses_stq = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_sys_pc2epc = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_unique = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_flush_on_commit = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ldst_is_rs1 = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ldst = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_lrs1 = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_lrs2 = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_lrs3 = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_ldst_val = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_dst_rtype = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_lrs1_rtype = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_lrs2_rtype = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_frs3_en = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_fp_val = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_fp_single = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_xcpt_pf_if = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_xcpt_ae_if = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_xcpt_ma_if = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_bp_debug_if = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_bp_xcpt_if = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_debug_fsrc = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_debug_tsrc = 2'h0;
  assign io_iresp_bits_fflags_bits_flags = 5'h0;
  assign io_iresp_bits_flagdata = alu_io_resp_valid ? alu_io_resp_bits_flagdata : imul_io_resp_bits_flagdata; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_valid = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_valid :
    imul_io_resp_bits_fflagdata_valid; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_switch = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_switch :
    imul_io_resp_bits_fflagdata_bits_uop_switch; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_switch_off = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_switch_off : imul_io_resp_bits_fflagdata_bits_uop_switch_off; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_is_unicore = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_is_unicore : imul_io_resp_bits_fflagdata_bits_uop_is_unicore; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_shift = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_shift :
    imul_io_resp_bits_fflagdata_bits_uop_shift; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_lrs3_rtype = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_lrs3_rtype : imul_io_resp_bits_fflagdata_bits_uop_lrs3_rtype; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_rflag = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_rflag :
    imul_io_resp_bits_fflagdata_bits_uop_rflag; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_wflag = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_wflag :
    imul_io_resp_bits_fflagdata_bits_uop_wflag; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_prflag = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_prflag :
    imul_io_resp_bits_fflagdata_bits_uop_prflag; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_pwflag = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_pwflag :
    imul_io_resp_bits_fflagdata_bits_uop_pwflag; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_pflag_busy = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_pflag_busy : imul_io_resp_bits_fflagdata_bits_uop_pflag_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_stale_pflag = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_stale_pflag : imul_io_resp_bits_fflagdata_bits_uop_stale_pflag; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_op1_sel = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_op1_sel :
    imul_io_resp_bits_fflagdata_bits_uop_op1_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_op2_sel = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_op2_sel :
    imul_io_resp_bits_fflagdata_bits_uop_op2_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_split_num = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_split_num
     : imul_io_resp_bits_fflagdata_bits_uop_split_num; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_self_index = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_self_index : imul_io_resp_bits_fflagdata_bits_uop_self_index; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_rob_inst_idx = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_rob_inst_idx : imul_io_resp_bits_fflagdata_bits_uop_rob_inst_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_address_num = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_address_num : imul_io_resp_bits_fflagdata_bits_uop_address_num; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_uopc = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_uopc :
    imul_io_resp_bits_fflagdata_bits_uop_uopc; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_inst = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_inst :
    imul_io_resp_bits_fflagdata_bits_uop_inst; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_debug_inst = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_debug_inst : imul_io_resp_bits_fflagdata_bits_uop_debug_inst; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_is_rvc = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_is_rvc :
    imul_io_resp_bits_fflagdata_bits_uop_is_rvc; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_debug_pc = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_debug_pc :
    imul_io_resp_bits_fflagdata_bits_uop_debug_pc; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_iq_type = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_iq_type :
    imul_io_resp_bits_fflagdata_bits_uop_iq_type; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_fu_code = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_fu_code :
    imul_io_resp_bits_fflagdata_bits_uop_fu_code; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ctrl_br_type = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ctrl_br_type : imul_io_resp_bits_fflagdata_bits_uop_ctrl_br_type; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ctrl_op1_sel = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel : imul_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ctrl_op2_sel = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel : imul_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ctrl_imm_sel = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel : imul_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ctrl_op_fcn = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn : imul_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ctrl_fcn_dw = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw : imul_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ctrl_csr_cmd = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd : imul_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ctrl_is_load = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ctrl_is_load : imul_io_resp_bits_fflagdata_bits_uop_ctrl_is_load; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ctrl_is_sta = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta : imul_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ctrl_is_std = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ctrl_is_std : imul_io_resp_bits_fflagdata_bits_uop_ctrl_is_std; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ctrl_op3_sel = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel : imul_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_iw_state = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_iw_state :
    imul_io_resp_bits_fflagdata_bits_uop_iw_state; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_iw_p1_poisoned = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned : imul_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_iw_p2_poisoned = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned : imul_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_is_br = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_is_br :
    imul_io_resp_bits_fflagdata_bits_uop_is_br; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_is_jalr = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_is_jalr :
    imul_io_resp_bits_fflagdata_bits_uop_is_jalr; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_is_jal = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_is_jal :
    imul_io_resp_bits_fflagdata_bits_uop_is_jal; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_is_sfb = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_is_sfb :
    imul_io_resp_bits_fflagdata_bits_uop_is_sfb; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_br_mask = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_br_mask :
    imul_io_resp_bits_fflagdata_bits_uop_br_mask; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_br_tag = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_br_tag :
    imul_io_resp_bits_fflagdata_bits_uop_br_tag; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ftq_idx = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_ftq_idx :
    imul_io_resp_bits_fflagdata_bits_uop_ftq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_edge_inst = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_edge_inst
     : imul_io_resp_bits_fflagdata_bits_uop_edge_inst; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_pc_lob = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_pc_lob :
    imul_io_resp_bits_fflagdata_bits_uop_pc_lob; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_taken = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_taken :
    imul_io_resp_bits_fflagdata_bits_uop_taken; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_imm_packed = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_imm_packed : imul_io_resp_bits_fflagdata_bits_uop_imm_packed; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_csr_addr = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_csr_addr :
    imul_io_resp_bits_fflagdata_bits_uop_csr_addr; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_rob_idx = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_rob_idx :
    imul_io_resp_bits_fflagdata_bits_uop_rob_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ldq_idx = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_ldq_idx :
    imul_io_resp_bits_fflagdata_bits_uop_ldq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_stq_idx = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_stq_idx :
    imul_io_resp_bits_fflagdata_bits_uop_stq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_rxq_idx = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_rxq_idx :
    imul_io_resp_bits_fflagdata_bits_uop_rxq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_pdst = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_pdst :
    imul_io_resp_bits_fflagdata_bits_uop_pdst; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_prs1 = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_prs1 :
    imul_io_resp_bits_fflagdata_bits_uop_prs1; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_prs2 = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_prs2 :
    imul_io_resp_bits_fflagdata_bits_uop_prs2; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_prs3 = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_prs3 :
    imul_io_resp_bits_fflagdata_bits_uop_prs3; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ppred = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_ppred :
    imul_io_resp_bits_fflagdata_bits_uop_ppred; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_prs1_busy = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_prs1_busy
     : imul_io_resp_bits_fflagdata_bits_uop_prs1_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_prs2_busy = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_prs2_busy
     : imul_io_resp_bits_fflagdata_bits_uop_prs2_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_prs3_busy = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_prs3_busy
     : imul_io_resp_bits_fflagdata_bits_uop_prs3_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ppred_busy = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ppred_busy : imul_io_resp_bits_fflagdata_bits_uop_ppred_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_stale_pdst = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_stale_pdst : imul_io_resp_bits_fflagdata_bits_uop_stale_pdst; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_exception = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_exception
     : imul_io_resp_bits_fflagdata_bits_uop_exception; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_exc_cause = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_exc_cause
     : imul_io_resp_bits_fflagdata_bits_uop_exc_cause; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_bypassable = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_bypassable : imul_io_resp_bits_fflagdata_bits_uop_bypassable; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_mem_cmd = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_mem_cmd :
    imul_io_resp_bits_fflagdata_bits_uop_mem_cmd; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_mem_size = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_mem_size :
    imul_io_resp_bits_fflagdata_bits_uop_mem_size; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_mem_signed = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_mem_signed : imul_io_resp_bits_fflagdata_bits_uop_mem_signed; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_is_fence = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_is_fence :
    imul_io_resp_bits_fflagdata_bits_uop_is_fence; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_is_fencei = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_is_fencei
     : imul_io_resp_bits_fflagdata_bits_uop_is_fencei; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_is_amo = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_is_amo :
    imul_io_resp_bits_fflagdata_bits_uop_is_amo; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_uses_ldq = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_uses_ldq :
    imul_io_resp_bits_fflagdata_bits_uop_uses_ldq; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_uses_stq = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_uses_stq :
    imul_io_resp_bits_fflagdata_bits_uop_uses_stq; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_is_sys_pc2epc = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc : imul_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_is_unique = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_is_unique
     : imul_io_resp_bits_fflagdata_bits_uop_is_unique; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_flush_on_commit = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_flush_on_commit : imul_io_resp_bits_fflagdata_bits_uop_flush_on_commit; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ldst_is_rs1 = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1 : imul_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ldst = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_ldst :
    imul_io_resp_bits_fflagdata_bits_uop_ldst; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_lrs1 = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_lrs1 :
    imul_io_resp_bits_fflagdata_bits_uop_lrs1; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_lrs2 = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_lrs2 :
    imul_io_resp_bits_fflagdata_bits_uop_lrs2; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_lrs3 = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_lrs3 :
    imul_io_resp_bits_fflagdata_bits_uop_lrs3; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_ldst_val = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_ldst_val :
    imul_io_resp_bits_fflagdata_bits_uop_ldst_val; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_dst_rtype = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_dst_rtype
     : imul_io_resp_bits_fflagdata_bits_uop_dst_rtype; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_lrs1_rtype = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_lrs1_rtype : imul_io_resp_bits_fflagdata_bits_uop_lrs1_rtype; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_lrs2_rtype = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_lrs2_rtype : imul_io_resp_bits_fflagdata_bits_uop_lrs2_rtype; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_frs3_en = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_frs3_en :
    imul_io_resp_bits_fflagdata_bits_uop_frs3_en; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_fp_val = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_fp_val :
    imul_io_resp_bits_fflagdata_bits_uop_fp_val; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_fp_single = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_uop_fp_single
     : imul_io_resp_bits_fflagdata_bits_uop_fp_single; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_xcpt_pf_if = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if : imul_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_xcpt_ae_if = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if : imul_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_xcpt_ma_if = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if : imul_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_bp_debug_if = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_bp_debug_if : imul_io_resp_bits_fflagdata_bits_uop_bp_debug_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_bp_xcpt_if = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if : imul_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_debug_fsrc = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_debug_fsrc : imul_io_resp_bits_fflagdata_bits_uop_debug_fsrc; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_uop_debug_tsrc = alu_io_resp_valid ?
    alu_io_resp_bits_fflagdata_bits_uop_debug_tsrc : imul_io_resp_bits_fflagdata_bits_uop_debug_tsrc; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflagdata_bits_fflag = alu_io_resp_valid ? alu_io_resp_bits_fflagdata_bits_fflag :
    imul_io_resp_bits_fflagdata_bits_fflag; // @[Mux.scala 47:69]
  assign io_ll_fresp_valid = BranchKillableQueue_io_deq_valid; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_switch = BranchKillableQueue_io_deq_bits_uop_switch; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_switch_off = BranchKillableQueue_io_deq_bits_uop_switch_off; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_is_unicore = BranchKillableQueue_io_deq_bits_uop_is_unicore; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_shift = BranchKillableQueue_io_deq_bits_uop_shift; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_lrs3_rtype = BranchKillableQueue_io_deq_bits_uop_lrs3_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_rflag = BranchKillableQueue_io_deq_bits_uop_rflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_wflag = BranchKillableQueue_io_deq_bits_uop_wflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_prflag = BranchKillableQueue_io_deq_bits_uop_prflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_pwflag = BranchKillableQueue_io_deq_bits_uop_pwflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_pflag_busy = BranchKillableQueue_io_deq_bits_uop_pflag_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_stale_pflag = BranchKillableQueue_io_deq_bits_uop_stale_pflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_op1_sel = BranchKillableQueue_io_deq_bits_uop_op1_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_op2_sel = BranchKillableQueue_io_deq_bits_uop_op2_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_split_num = BranchKillableQueue_io_deq_bits_uop_split_num; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_self_index = BranchKillableQueue_io_deq_bits_uop_self_index; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_rob_inst_idx = BranchKillableQueue_io_deq_bits_uop_rob_inst_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_address_num = BranchKillableQueue_io_deq_bits_uop_address_num; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_uopc = BranchKillableQueue_io_deq_bits_uop_uopc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_inst = BranchKillableQueue_io_deq_bits_uop_inst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_debug_inst = BranchKillableQueue_io_deq_bits_uop_debug_inst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_is_rvc = BranchKillableQueue_io_deq_bits_uop_is_rvc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_debug_pc = BranchKillableQueue_io_deq_bits_uop_debug_pc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_iq_type = BranchKillableQueue_io_deq_bits_uop_iq_type; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_fu_code = BranchKillableQueue_io_deq_bits_uop_fu_code; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ctrl_br_type = BranchKillableQueue_io_deq_bits_uop_ctrl_br_type; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ctrl_op1_sel = BranchKillableQueue_io_deq_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ctrl_op2_sel = BranchKillableQueue_io_deq_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ctrl_imm_sel = BranchKillableQueue_io_deq_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ctrl_op_fcn = BranchKillableQueue_io_deq_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ctrl_fcn_dw = BranchKillableQueue_io_deq_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ctrl_csr_cmd = BranchKillableQueue_io_deq_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ctrl_is_load = BranchKillableQueue_io_deq_bits_uop_ctrl_is_load; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ctrl_is_sta = BranchKillableQueue_io_deq_bits_uop_ctrl_is_sta; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ctrl_is_std = BranchKillableQueue_io_deq_bits_uop_ctrl_is_std; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ctrl_op3_sel = BranchKillableQueue_io_deq_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_iw_state = BranchKillableQueue_io_deq_bits_uop_iw_state; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_iw_p1_poisoned = BranchKillableQueue_io_deq_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_iw_p2_poisoned = BranchKillableQueue_io_deq_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_is_br = BranchKillableQueue_io_deq_bits_uop_is_br; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_is_jalr = BranchKillableQueue_io_deq_bits_uop_is_jalr; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_is_jal = BranchKillableQueue_io_deq_bits_uop_is_jal; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_is_sfb = BranchKillableQueue_io_deq_bits_uop_is_sfb; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_br_mask = BranchKillableQueue_io_deq_bits_uop_br_mask; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_br_tag = BranchKillableQueue_io_deq_bits_uop_br_tag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ftq_idx = BranchKillableQueue_io_deq_bits_uop_ftq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_edge_inst = BranchKillableQueue_io_deq_bits_uop_edge_inst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_pc_lob = BranchKillableQueue_io_deq_bits_uop_pc_lob; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_taken = BranchKillableQueue_io_deq_bits_uop_taken; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_imm_packed = BranchKillableQueue_io_deq_bits_uop_imm_packed; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_csr_addr = BranchKillableQueue_io_deq_bits_uop_csr_addr; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_rob_idx = BranchKillableQueue_io_deq_bits_uop_rob_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ldq_idx = BranchKillableQueue_io_deq_bits_uop_ldq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_stq_idx = BranchKillableQueue_io_deq_bits_uop_stq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_rxq_idx = BranchKillableQueue_io_deq_bits_uop_rxq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_pdst = BranchKillableQueue_io_deq_bits_uop_pdst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_prs1 = BranchKillableQueue_io_deq_bits_uop_prs1; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_prs2 = BranchKillableQueue_io_deq_bits_uop_prs2; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_prs3 = BranchKillableQueue_io_deq_bits_uop_prs3; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ppred = BranchKillableQueue_io_deq_bits_uop_ppred; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_prs1_busy = BranchKillableQueue_io_deq_bits_uop_prs1_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_prs2_busy = BranchKillableQueue_io_deq_bits_uop_prs2_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_prs3_busy = BranchKillableQueue_io_deq_bits_uop_prs3_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ppred_busy = BranchKillableQueue_io_deq_bits_uop_ppred_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_stale_pdst = BranchKillableQueue_io_deq_bits_uop_stale_pdst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_exception = BranchKillableQueue_io_deq_bits_uop_exception; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_exc_cause = BranchKillableQueue_io_deq_bits_uop_exc_cause; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_bypassable = BranchKillableQueue_io_deq_bits_uop_bypassable; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_mem_cmd = BranchKillableQueue_io_deq_bits_uop_mem_cmd; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_mem_size = BranchKillableQueue_io_deq_bits_uop_mem_size; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_mem_signed = BranchKillableQueue_io_deq_bits_uop_mem_signed; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_is_fence = BranchKillableQueue_io_deq_bits_uop_is_fence; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_is_fencei = BranchKillableQueue_io_deq_bits_uop_is_fencei; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_is_amo = BranchKillableQueue_io_deq_bits_uop_is_amo; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_uses_ldq = BranchKillableQueue_io_deq_bits_uop_uses_ldq; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_uses_stq = BranchKillableQueue_io_deq_bits_uop_uses_stq; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_is_sys_pc2epc = BranchKillableQueue_io_deq_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_is_unique = BranchKillableQueue_io_deq_bits_uop_is_unique; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_flush_on_commit = BranchKillableQueue_io_deq_bits_uop_flush_on_commit; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ldst_is_rs1 = BranchKillableQueue_io_deq_bits_uop_ldst_is_rs1; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ldst = BranchKillableQueue_io_deq_bits_uop_ldst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_lrs1 = BranchKillableQueue_io_deq_bits_uop_lrs1; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_lrs2 = BranchKillableQueue_io_deq_bits_uop_lrs2; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_lrs3 = BranchKillableQueue_io_deq_bits_uop_lrs3; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_ldst_val = BranchKillableQueue_io_deq_bits_uop_ldst_val; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_dst_rtype = BranchKillableQueue_io_deq_bits_uop_dst_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_lrs1_rtype = BranchKillableQueue_io_deq_bits_uop_lrs1_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_lrs2_rtype = BranchKillableQueue_io_deq_bits_uop_lrs2_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_frs3_en = BranchKillableQueue_io_deq_bits_uop_frs3_en; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_fp_val = BranchKillableQueue_io_deq_bits_uop_fp_val; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_fp_single = BranchKillableQueue_io_deq_bits_uop_fp_single; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_xcpt_pf_if = BranchKillableQueue_io_deq_bits_uop_xcpt_pf_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_xcpt_ae_if = BranchKillableQueue_io_deq_bits_uop_xcpt_ae_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_xcpt_ma_if = BranchKillableQueue_io_deq_bits_uop_xcpt_ma_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_bp_debug_if = BranchKillableQueue_io_deq_bits_uop_bp_debug_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_bp_xcpt_if = BranchKillableQueue_io_deq_bits_uop_bp_xcpt_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_debug_fsrc = BranchKillableQueue_io_deq_bits_uop_debug_fsrc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_uop_debug_tsrc = BranchKillableQueue_io_deq_bits_uop_debug_tsrc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_data = BranchKillableQueue_io_deq_bits_data; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_predicated = BranchKillableQueue_io_deq_bits_predicated; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_valid = BranchKillableQueue_io_deq_bits_fflags_valid; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_switch = BranchKillableQueue_io_deq_bits_fflags_bits_uop_switch; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_switch_off = BranchKillableQueue_io_deq_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_is_unicore = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_shift = BranchKillableQueue_io_deq_bits_fflags_bits_uop_shift; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs3_rtype = BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_rflag = BranchKillableQueue_io_deq_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_wflag = BranchKillableQueue_io_deq_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_prflag = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_pwflag = BranchKillableQueue_io_deq_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_pflag_busy = BranchKillableQueue_io_deq_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_stale_pflag = BranchKillableQueue_io_deq_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_op1_sel = BranchKillableQueue_io_deq_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_op2_sel = BranchKillableQueue_io_deq_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_split_num = BranchKillableQueue_io_deq_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_self_index = BranchKillableQueue_io_deq_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_rob_inst_idx = BranchKillableQueue_io_deq_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_address_num = BranchKillableQueue_io_deq_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_uopc = BranchKillableQueue_io_deq_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_inst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_inst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_debug_inst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_is_rvc = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_debug_pc = BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_iq_type = BranchKillableQueue_io_deq_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_fu_code = BranchKillableQueue_io_deq_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_br_type = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_op1_sel = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_op2_sel = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_imm_sel = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_op_fcn = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_fcn_dw = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_csr_cmd = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_is_load = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_is_sta = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_is_std = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ctrl_op3_sel = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_iw_state = BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_iw_p1_poisoned =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_iw_p2_poisoned =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_is_br = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_is_jalr = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_is_jal = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_is_sfb = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_br_mask = BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_br_tag = BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ftq_idx = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_edge_inst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_pc_lob = BranchKillableQueue_io_deq_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_taken = BranchKillableQueue_io_deq_bits_fflags_bits_uop_taken; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_imm_packed = BranchKillableQueue_io_deq_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_csr_addr = BranchKillableQueue_io_deq_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_rob_idx = BranchKillableQueue_io_deq_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ldq_idx = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_stq_idx = BranchKillableQueue_io_deq_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_rxq_idx = BranchKillableQueue_io_deq_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_pdst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_prs1 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_prs2 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_prs3 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ppred = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_prs1_busy = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_prs2_busy = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_prs3_busy = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ppred_busy = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_stale_pdst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_exception = BranchKillableQueue_io_deq_bits_fflags_bits_uop_exception; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_exc_cause = BranchKillableQueue_io_deq_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_bypassable = BranchKillableQueue_io_deq_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_mem_cmd = BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_mem_size = BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_mem_signed = BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_is_fence = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_is_fencei = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_is_amo = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_uses_ldq = BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_uses_stq = BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_is_sys_pc2epc = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_is_unique = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_flush_on_commit =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ldst_is_rs1 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ldst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs1 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs2 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs3 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_ldst_val = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_dst_rtype = BranchKillableQueue_io_deq_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs1_rtype = BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_lrs2_rtype = BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_frs3_en = BranchKillableQueue_io_deq_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_fp_val = BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_fp_single = BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_xcpt_pf_if = BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_xcpt_ae_if = BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_xcpt_ma_if = BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_bp_debug_if = BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_bp_xcpt_if = BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_debug_fsrc = BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_uop_debug_tsrc = BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflags_bits_flags = BranchKillableQueue_io_deq_bits_fflags_bits_flags; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_flagdata = BranchKillableQueue_io_deq_bits_flagdata; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_valid = BranchKillableQueue_io_deq_bits_fflagdata_valid; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_switch = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_switch_off = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_unicore = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_shift = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs3_rtype = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_rflag = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_wflag = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prflag = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_pwflag = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_pflag_busy = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_stale_pflag =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_op1_sel = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_op2_sel = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_split_num = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_self_index = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_rob_inst_idx =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_address_num =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_uopc = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_inst = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_debug_inst = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_rvc = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_debug_pc = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_iq_type = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_fu_code = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_br_type =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op1_sel =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op2_sel =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_imm_sel =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op_fcn =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_fcn_dw =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_csr_cmd =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_is_load =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_is_sta =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_is_std =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ctrl_op3_sel =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_iw_state = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_iw_p1_poisoned =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_iw_p2_poisoned =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_br = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_jalr = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_jal = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_sfb = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_br_mask = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_br_tag = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ftq_idx = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_edge_inst = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_pc_lob = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_taken = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_imm_packed = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_csr_addr = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_rob_idx = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ldq_idx = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_stq_idx = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_rxq_idx = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_pdst = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs1 = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs2 = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs3 = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ppred = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs1_busy = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs2_busy = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_prs3_busy = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ppred_busy = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_stale_pdst = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_exception = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_exc_cause = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_bypassable = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_mem_cmd = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_mem_size = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_mem_signed = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_fence = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_fencei = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_amo = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_uses_ldq = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_uses_stq = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_sys_pc2epc =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_is_unique = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_flush_on_commit =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ldst_is_rs1 =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ldst = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs1 = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs2 = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs3 = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_ldst_val = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_dst_rtype = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs1_rtype = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_lrs2_rtype = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_frs3_en = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_fp_val = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_fp_single = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_xcpt_pf_if = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_xcpt_ae_if = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_xcpt_ma_if = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_bp_debug_if =
    BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_bp_xcpt_if = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_debug_fsrc = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_uop_debug_tsrc = BranchKillableQueue_io_deq_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 375:17]
  assign io_ll_fresp_bits_fflagdata_bits_fflag = BranchKillableQueue_io_deq_bits_fflagdata_bits_fflag; // @[execution-unit.scala 375:17]
  assign io_bypass_0_valid = alu_io_bypass_0_valid; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_switch = alu_io_bypass_0_bits_uop_switch; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_switch_off = alu_io_bypass_0_bits_uop_switch_off; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_is_unicore = alu_io_bypass_0_bits_uop_is_unicore; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_shift = alu_io_bypass_0_bits_uop_shift; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_lrs3_rtype = alu_io_bypass_0_bits_uop_lrs3_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_rflag = alu_io_bypass_0_bits_uop_rflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_wflag = alu_io_bypass_0_bits_uop_wflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_prflag = alu_io_bypass_0_bits_uop_prflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_pwflag = alu_io_bypass_0_bits_uop_pwflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_pflag_busy = alu_io_bypass_0_bits_uop_pflag_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_stale_pflag = alu_io_bypass_0_bits_uop_stale_pflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_op1_sel = alu_io_bypass_0_bits_uop_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_op2_sel = alu_io_bypass_0_bits_uop_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_split_num = alu_io_bypass_0_bits_uop_split_num; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_self_index = alu_io_bypass_0_bits_uop_self_index; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_rob_inst_idx = alu_io_bypass_0_bits_uop_rob_inst_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_address_num = alu_io_bypass_0_bits_uop_address_num; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_uopc = alu_io_bypass_0_bits_uop_uopc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_inst = alu_io_bypass_0_bits_uop_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_debug_inst = alu_io_bypass_0_bits_uop_debug_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_is_rvc = alu_io_bypass_0_bits_uop_is_rvc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_debug_pc = alu_io_bypass_0_bits_uop_debug_pc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_iq_type = alu_io_bypass_0_bits_uop_iq_type; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_fu_code = alu_io_bypass_0_bits_uop_fu_code; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ctrl_br_type = alu_io_bypass_0_bits_uop_ctrl_br_type; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ctrl_op1_sel = alu_io_bypass_0_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ctrl_op2_sel = alu_io_bypass_0_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ctrl_imm_sel = alu_io_bypass_0_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ctrl_op_fcn = alu_io_bypass_0_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ctrl_fcn_dw = alu_io_bypass_0_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ctrl_csr_cmd = alu_io_bypass_0_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ctrl_is_load = alu_io_bypass_0_bits_uop_ctrl_is_load; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ctrl_is_sta = alu_io_bypass_0_bits_uop_ctrl_is_sta; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ctrl_is_std = alu_io_bypass_0_bits_uop_ctrl_is_std; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ctrl_op3_sel = alu_io_bypass_0_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_iw_state = alu_io_bypass_0_bits_uop_iw_state; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_iw_p1_poisoned = alu_io_bypass_0_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_iw_p2_poisoned = alu_io_bypass_0_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_is_br = alu_io_bypass_0_bits_uop_is_br; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_is_jalr = alu_io_bypass_0_bits_uop_is_jalr; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_is_jal = alu_io_bypass_0_bits_uop_is_jal; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_is_sfb = alu_io_bypass_0_bits_uop_is_sfb; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_br_mask = alu_io_bypass_0_bits_uop_br_mask; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_br_tag = alu_io_bypass_0_bits_uop_br_tag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ftq_idx = alu_io_bypass_0_bits_uop_ftq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_edge_inst = alu_io_bypass_0_bits_uop_edge_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_pc_lob = alu_io_bypass_0_bits_uop_pc_lob; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_taken = alu_io_bypass_0_bits_uop_taken; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_imm_packed = alu_io_bypass_0_bits_uop_imm_packed; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_csr_addr = alu_io_bypass_0_bits_uop_csr_addr; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_rob_idx = alu_io_bypass_0_bits_uop_rob_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ldq_idx = alu_io_bypass_0_bits_uop_ldq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_stq_idx = alu_io_bypass_0_bits_uop_stq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_rxq_idx = alu_io_bypass_0_bits_uop_rxq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_pdst = alu_io_bypass_0_bits_uop_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_prs1 = alu_io_bypass_0_bits_uop_prs1; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_prs2 = alu_io_bypass_0_bits_uop_prs2; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_prs3 = alu_io_bypass_0_bits_uop_prs3; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ppred = alu_io_bypass_0_bits_uop_ppred; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_prs1_busy = alu_io_bypass_0_bits_uop_prs1_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_prs2_busy = alu_io_bypass_0_bits_uop_prs2_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_prs3_busy = alu_io_bypass_0_bits_uop_prs3_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ppred_busy = alu_io_bypass_0_bits_uop_ppred_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_stale_pdst = alu_io_bypass_0_bits_uop_stale_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_exception = alu_io_bypass_0_bits_uop_exception; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_exc_cause = alu_io_bypass_0_bits_uop_exc_cause; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_bypassable = alu_io_bypass_0_bits_uop_bypassable; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_mem_cmd = alu_io_bypass_0_bits_uop_mem_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_mem_size = alu_io_bypass_0_bits_uop_mem_size; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_mem_signed = alu_io_bypass_0_bits_uop_mem_signed; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_is_fence = alu_io_bypass_0_bits_uop_is_fence; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_is_fencei = alu_io_bypass_0_bits_uop_is_fencei; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_is_amo = alu_io_bypass_0_bits_uop_is_amo; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_uses_ldq = alu_io_bypass_0_bits_uop_uses_ldq; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_uses_stq = alu_io_bypass_0_bits_uop_uses_stq; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_is_sys_pc2epc = alu_io_bypass_0_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_is_unique = alu_io_bypass_0_bits_uop_is_unique; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_flush_on_commit = alu_io_bypass_0_bits_uop_flush_on_commit; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ldst_is_rs1 = alu_io_bypass_0_bits_uop_ldst_is_rs1; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ldst = alu_io_bypass_0_bits_uop_ldst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_lrs1 = alu_io_bypass_0_bits_uop_lrs1; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_lrs2 = alu_io_bypass_0_bits_uop_lrs2; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_lrs3 = alu_io_bypass_0_bits_uop_lrs3; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_ldst_val = alu_io_bypass_0_bits_uop_ldst_val; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_dst_rtype = alu_io_bypass_0_bits_uop_dst_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_lrs1_rtype = alu_io_bypass_0_bits_uop_lrs1_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_lrs2_rtype = alu_io_bypass_0_bits_uop_lrs2_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_frs3_en = alu_io_bypass_0_bits_uop_frs3_en; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_fp_val = alu_io_bypass_0_bits_uop_fp_val; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_fp_single = alu_io_bypass_0_bits_uop_fp_single; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_xcpt_pf_if = alu_io_bypass_0_bits_uop_xcpt_pf_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_xcpt_ae_if = alu_io_bypass_0_bits_uop_xcpt_ae_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_xcpt_ma_if = alu_io_bypass_0_bits_uop_xcpt_ma_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_bp_debug_if = alu_io_bypass_0_bits_uop_bp_debug_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_bp_xcpt_if = alu_io_bypass_0_bits_uop_bp_xcpt_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_debug_fsrc = alu_io_bypass_0_bits_uop_debug_fsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_uop_debug_tsrc = alu_io_bypass_0_bits_uop_debug_tsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_data = {{1'd0}, alu_io_bypass_0_bits_data}; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_predicated = alu_io_bypass_0_bits_predicated; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_valid = alu_io_bypass_0_bits_fflags_valid; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_switch = alu_io_bypass_0_bits_fflags_bits_uop_switch; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_switch_off = alu_io_bypass_0_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_unicore = alu_io_bypass_0_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_shift = alu_io_bypass_0_bits_fflags_bits_uop_shift; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_lrs3_rtype = alu_io_bypass_0_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_rflag = alu_io_bypass_0_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_wflag = alu_io_bypass_0_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_prflag = alu_io_bypass_0_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_pwflag = alu_io_bypass_0_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_pflag_busy = alu_io_bypass_0_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_stale_pflag = alu_io_bypass_0_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_op1_sel = alu_io_bypass_0_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_op2_sel = alu_io_bypass_0_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_split_num = alu_io_bypass_0_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_self_index = alu_io_bypass_0_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_rob_inst_idx = alu_io_bypass_0_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_address_num = alu_io_bypass_0_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_uopc = alu_io_bypass_0_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_inst = alu_io_bypass_0_bits_fflags_bits_uop_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_debug_inst = alu_io_bypass_0_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_rvc = alu_io_bypass_0_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_debug_pc = alu_io_bypass_0_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_iq_type = alu_io_bypass_0_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_fu_code = alu_io_bypass_0_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_br_type = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_is_load = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_is_std = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_op3_sel = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_iw_state = alu_io_bypass_0_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned = alu_io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned = alu_io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_br = alu_io_bypass_0_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_jalr = alu_io_bypass_0_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_jal = alu_io_bypass_0_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_sfb = alu_io_bypass_0_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_br_mask = alu_io_bypass_0_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_br_tag = alu_io_bypass_0_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ftq_idx = alu_io_bypass_0_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_edge_inst = alu_io_bypass_0_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_pc_lob = alu_io_bypass_0_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_taken = alu_io_bypass_0_bits_fflags_bits_uop_taken; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_imm_packed = alu_io_bypass_0_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_csr_addr = alu_io_bypass_0_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_rob_idx = alu_io_bypass_0_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ldq_idx = alu_io_bypass_0_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_stq_idx = alu_io_bypass_0_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_rxq_idx = alu_io_bypass_0_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_pdst = alu_io_bypass_0_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs1 = alu_io_bypass_0_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs2 = alu_io_bypass_0_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs3 = alu_io_bypass_0_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ppred = alu_io_bypass_0_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs1_busy = alu_io_bypass_0_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs2_busy = alu_io_bypass_0_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs3_busy = alu_io_bypass_0_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ppred_busy = alu_io_bypass_0_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_stale_pdst = alu_io_bypass_0_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_exception = alu_io_bypass_0_bits_fflags_bits_uop_exception; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_exc_cause = alu_io_bypass_0_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_bypassable = alu_io_bypass_0_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_mem_cmd = alu_io_bypass_0_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_mem_size = alu_io_bypass_0_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_mem_signed = alu_io_bypass_0_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_fence = alu_io_bypass_0_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_fencei = alu_io_bypass_0_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_amo = alu_io_bypass_0_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_uses_ldq = alu_io_bypass_0_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_uses_stq = alu_io_bypass_0_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc = alu_io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_unique = alu_io_bypass_0_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_flush_on_commit = alu_io_bypass_0_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1 = alu_io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ldst = alu_io_bypass_0_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_lrs1 = alu_io_bypass_0_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_lrs2 = alu_io_bypass_0_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_lrs3 = alu_io_bypass_0_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_ldst_val = alu_io_bypass_0_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_dst_rtype = alu_io_bypass_0_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_lrs1_rtype = alu_io_bypass_0_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_lrs2_rtype = alu_io_bypass_0_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_frs3_en = alu_io_bypass_0_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_fp_val = alu_io_bypass_0_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_fp_single = alu_io_bypass_0_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if = alu_io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if = alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if = alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_bp_debug_if = alu_io_bypass_0_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if = alu_io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_debug_fsrc = alu_io_bypass_0_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_uop_debug_tsrc = alu_io_bypass_0_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflags_bits_flags = alu_io_bypass_0_bits_fflags_bits_flags; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_flagdata = alu_io_bypass_0_bits_flagdata; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_valid = alu_io_bypass_0_bits_fflagdata_valid; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_switch = alu_io_bypass_0_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_switch_off = alu_io_bypass_0_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_is_unicore = alu_io_bypass_0_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_shift = alu_io_bypass_0_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs3_rtype = alu_io_bypass_0_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_rflag = alu_io_bypass_0_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_wflag = alu_io_bypass_0_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_prflag = alu_io_bypass_0_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_pwflag = alu_io_bypass_0_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_pflag_busy = alu_io_bypass_0_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_stale_pflag = alu_io_bypass_0_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_op1_sel = alu_io_bypass_0_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_op2_sel = alu_io_bypass_0_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_split_num = alu_io_bypass_0_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_self_index = alu_io_bypass_0_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_rob_inst_idx = alu_io_bypass_0_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_address_num = alu_io_bypass_0_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_uopc = alu_io_bypass_0_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_inst = alu_io_bypass_0_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_debug_inst = alu_io_bypass_0_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_is_rvc = alu_io_bypass_0_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_debug_pc = alu_io_bypass_0_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_iq_type = alu_io_bypass_0_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_fu_code = alu_io_bypass_0_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_br_type = alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_op1_sel = alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_op2_sel = alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_imm_sel = alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_op_fcn = alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_fcn_dw = alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_csr_cmd = alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_load = alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_sta = alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_std = alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_op3_sel = alu_io_bypass_0_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_iw_state = alu_io_bypass_0_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_iw_p1_poisoned = alu_io_bypass_0_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_iw_p2_poisoned = alu_io_bypass_0_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_is_br = alu_io_bypass_0_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_is_jalr = alu_io_bypass_0_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_is_jal = alu_io_bypass_0_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_is_sfb = alu_io_bypass_0_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_br_mask = alu_io_bypass_0_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_br_tag = alu_io_bypass_0_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ftq_idx = alu_io_bypass_0_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_edge_inst = alu_io_bypass_0_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_pc_lob = alu_io_bypass_0_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_taken = alu_io_bypass_0_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_imm_packed = alu_io_bypass_0_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_csr_addr = alu_io_bypass_0_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_rob_idx = alu_io_bypass_0_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ldq_idx = alu_io_bypass_0_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_stq_idx = alu_io_bypass_0_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_rxq_idx = alu_io_bypass_0_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_pdst = alu_io_bypass_0_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_prs1 = alu_io_bypass_0_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_prs2 = alu_io_bypass_0_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_prs3 = alu_io_bypass_0_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ppred = alu_io_bypass_0_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_prs1_busy = alu_io_bypass_0_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_prs2_busy = alu_io_bypass_0_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_prs3_busy = alu_io_bypass_0_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ppred_busy = alu_io_bypass_0_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_stale_pdst = alu_io_bypass_0_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_exception = alu_io_bypass_0_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_exc_cause = alu_io_bypass_0_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_bypassable = alu_io_bypass_0_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_mem_cmd = alu_io_bypass_0_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_mem_size = alu_io_bypass_0_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_mem_signed = alu_io_bypass_0_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_is_fence = alu_io_bypass_0_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_is_fencei = alu_io_bypass_0_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_is_amo = alu_io_bypass_0_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_uses_ldq = alu_io_bypass_0_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_uses_stq = alu_io_bypass_0_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_is_sys_pc2epc = alu_io_bypass_0_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_is_unique = alu_io_bypass_0_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_flush_on_commit = alu_io_bypass_0_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ldst_is_rs1 = alu_io_bypass_0_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ldst = alu_io_bypass_0_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs1 = alu_io_bypass_0_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs2 = alu_io_bypass_0_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs3 = alu_io_bypass_0_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_ldst_val = alu_io_bypass_0_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_dst_rtype = alu_io_bypass_0_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs1_rtype = alu_io_bypass_0_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs2_rtype = alu_io_bypass_0_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_frs3_en = alu_io_bypass_0_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_fp_val = alu_io_bypass_0_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_fp_single = alu_io_bypass_0_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_xcpt_pf_if = alu_io_bypass_0_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_xcpt_ae_if = alu_io_bypass_0_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_xcpt_ma_if = alu_io_bypass_0_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_bp_debug_if = alu_io_bypass_0_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_bp_xcpt_if = alu_io_bypass_0_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_debug_fsrc = alu_io_bypass_0_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_uop_debug_tsrc = alu_io_bypass_0_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_0_bits_fflagdata_bits_fflag = alu_io_bypass_0_bits_fflagdata_bits_fflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_valid = alu_io_bypass_1_valid; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_switch = alu_io_bypass_1_bits_uop_switch; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_switch_off = alu_io_bypass_1_bits_uop_switch_off; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_is_unicore = alu_io_bypass_1_bits_uop_is_unicore; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_shift = alu_io_bypass_1_bits_uop_shift; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_lrs3_rtype = alu_io_bypass_1_bits_uop_lrs3_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_rflag = alu_io_bypass_1_bits_uop_rflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_wflag = alu_io_bypass_1_bits_uop_wflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_prflag = alu_io_bypass_1_bits_uop_prflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_pwflag = alu_io_bypass_1_bits_uop_pwflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_pflag_busy = alu_io_bypass_1_bits_uop_pflag_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_stale_pflag = alu_io_bypass_1_bits_uop_stale_pflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_op1_sel = alu_io_bypass_1_bits_uop_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_op2_sel = alu_io_bypass_1_bits_uop_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_split_num = alu_io_bypass_1_bits_uop_split_num; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_self_index = alu_io_bypass_1_bits_uop_self_index; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_rob_inst_idx = alu_io_bypass_1_bits_uop_rob_inst_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_address_num = alu_io_bypass_1_bits_uop_address_num; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_uopc = alu_io_bypass_1_bits_uop_uopc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_inst = alu_io_bypass_1_bits_uop_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_debug_inst = alu_io_bypass_1_bits_uop_debug_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_is_rvc = alu_io_bypass_1_bits_uop_is_rvc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_debug_pc = alu_io_bypass_1_bits_uop_debug_pc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_iq_type = alu_io_bypass_1_bits_uop_iq_type; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_fu_code = alu_io_bypass_1_bits_uop_fu_code; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ctrl_br_type = alu_io_bypass_1_bits_uop_ctrl_br_type; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ctrl_op1_sel = alu_io_bypass_1_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ctrl_op2_sel = alu_io_bypass_1_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ctrl_imm_sel = alu_io_bypass_1_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ctrl_op_fcn = alu_io_bypass_1_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ctrl_fcn_dw = alu_io_bypass_1_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ctrl_csr_cmd = alu_io_bypass_1_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ctrl_is_load = alu_io_bypass_1_bits_uop_ctrl_is_load; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ctrl_is_sta = alu_io_bypass_1_bits_uop_ctrl_is_sta; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ctrl_is_std = alu_io_bypass_1_bits_uop_ctrl_is_std; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ctrl_op3_sel = alu_io_bypass_1_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_iw_state = alu_io_bypass_1_bits_uop_iw_state; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_iw_p1_poisoned = alu_io_bypass_1_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_iw_p2_poisoned = alu_io_bypass_1_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_is_br = alu_io_bypass_1_bits_uop_is_br; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_is_jalr = alu_io_bypass_1_bits_uop_is_jalr; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_is_jal = alu_io_bypass_1_bits_uop_is_jal; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_is_sfb = alu_io_bypass_1_bits_uop_is_sfb; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_br_mask = alu_io_bypass_1_bits_uop_br_mask; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_br_tag = alu_io_bypass_1_bits_uop_br_tag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ftq_idx = alu_io_bypass_1_bits_uop_ftq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_edge_inst = alu_io_bypass_1_bits_uop_edge_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_pc_lob = alu_io_bypass_1_bits_uop_pc_lob; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_taken = alu_io_bypass_1_bits_uop_taken; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_imm_packed = alu_io_bypass_1_bits_uop_imm_packed; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_csr_addr = alu_io_bypass_1_bits_uop_csr_addr; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_rob_idx = alu_io_bypass_1_bits_uop_rob_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ldq_idx = alu_io_bypass_1_bits_uop_ldq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_stq_idx = alu_io_bypass_1_bits_uop_stq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_rxq_idx = alu_io_bypass_1_bits_uop_rxq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_pdst = alu_io_bypass_1_bits_uop_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_prs1 = alu_io_bypass_1_bits_uop_prs1; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_prs2 = alu_io_bypass_1_bits_uop_prs2; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_prs3 = alu_io_bypass_1_bits_uop_prs3; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ppred = alu_io_bypass_1_bits_uop_ppred; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_prs1_busy = alu_io_bypass_1_bits_uop_prs1_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_prs2_busy = alu_io_bypass_1_bits_uop_prs2_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_prs3_busy = alu_io_bypass_1_bits_uop_prs3_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ppred_busy = alu_io_bypass_1_bits_uop_ppred_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_stale_pdst = alu_io_bypass_1_bits_uop_stale_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_exception = alu_io_bypass_1_bits_uop_exception; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_exc_cause = alu_io_bypass_1_bits_uop_exc_cause; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_bypassable = alu_io_bypass_1_bits_uop_bypassable; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_mem_cmd = alu_io_bypass_1_bits_uop_mem_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_mem_size = alu_io_bypass_1_bits_uop_mem_size; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_mem_signed = alu_io_bypass_1_bits_uop_mem_signed; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_is_fence = alu_io_bypass_1_bits_uop_is_fence; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_is_fencei = alu_io_bypass_1_bits_uop_is_fencei; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_is_amo = alu_io_bypass_1_bits_uop_is_amo; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_uses_ldq = alu_io_bypass_1_bits_uop_uses_ldq; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_uses_stq = alu_io_bypass_1_bits_uop_uses_stq; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_is_sys_pc2epc = alu_io_bypass_1_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_is_unique = alu_io_bypass_1_bits_uop_is_unique; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_flush_on_commit = alu_io_bypass_1_bits_uop_flush_on_commit; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ldst_is_rs1 = alu_io_bypass_1_bits_uop_ldst_is_rs1; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ldst = alu_io_bypass_1_bits_uop_ldst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_lrs1 = alu_io_bypass_1_bits_uop_lrs1; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_lrs2 = alu_io_bypass_1_bits_uop_lrs2; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_lrs3 = alu_io_bypass_1_bits_uop_lrs3; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_ldst_val = alu_io_bypass_1_bits_uop_ldst_val; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_dst_rtype = alu_io_bypass_1_bits_uop_dst_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_lrs1_rtype = alu_io_bypass_1_bits_uop_lrs1_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_lrs2_rtype = alu_io_bypass_1_bits_uop_lrs2_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_frs3_en = alu_io_bypass_1_bits_uop_frs3_en; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_fp_val = alu_io_bypass_1_bits_uop_fp_val; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_fp_single = alu_io_bypass_1_bits_uop_fp_single; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_xcpt_pf_if = alu_io_bypass_1_bits_uop_xcpt_pf_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_xcpt_ae_if = alu_io_bypass_1_bits_uop_xcpt_ae_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_xcpt_ma_if = alu_io_bypass_1_bits_uop_xcpt_ma_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_bp_debug_if = alu_io_bypass_1_bits_uop_bp_debug_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_bp_xcpt_if = alu_io_bypass_1_bits_uop_bp_xcpt_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_debug_fsrc = alu_io_bypass_1_bits_uop_debug_fsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_uop_debug_tsrc = alu_io_bypass_1_bits_uop_debug_tsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_data = {{1'd0}, alu_io_bypass_1_bits_data}; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_predicated = alu_io_bypass_1_bits_predicated; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_valid = alu_io_bypass_1_bits_fflags_valid; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_switch = alu_io_bypass_1_bits_fflags_bits_uop_switch; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_switch_off = alu_io_bypass_1_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_is_unicore = alu_io_bypass_1_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_shift = alu_io_bypass_1_bits_fflags_bits_uop_shift; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_lrs3_rtype = alu_io_bypass_1_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_rflag = alu_io_bypass_1_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_wflag = alu_io_bypass_1_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_prflag = alu_io_bypass_1_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_pwflag = alu_io_bypass_1_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_pflag_busy = alu_io_bypass_1_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_stale_pflag = alu_io_bypass_1_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_op1_sel = alu_io_bypass_1_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_op2_sel = alu_io_bypass_1_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_split_num = alu_io_bypass_1_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_self_index = alu_io_bypass_1_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_rob_inst_idx = alu_io_bypass_1_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_address_num = alu_io_bypass_1_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_uopc = alu_io_bypass_1_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_inst = alu_io_bypass_1_bits_fflags_bits_uop_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_debug_inst = alu_io_bypass_1_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_is_rvc = alu_io_bypass_1_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_debug_pc = alu_io_bypass_1_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_iq_type = alu_io_bypass_1_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_fu_code = alu_io_bypass_1_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ctrl_br_type = alu_io_bypass_1_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ctrl_op1_sel = alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ctrl_op2_sel = alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ctrl_imm_sel = alu_io_bypass_1_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ctrl_op_fcn = alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ctrl_fcn_dw = alu_io_bypass_1_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ctrl_csr_cmd = alu_io_bypass_1_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ctrl_is_load = alu_io_bypass_1_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ctrl_is_sta = alu_io_bypass_1_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ctrl_is_std = alu_io_bypass_1_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ctrl_op3_sel = alu_io_bypass_1_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_iw_state = alu_io_bypass_1_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_iw_p1_poisoned = alu_io_bypass_1_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_iw_p2_poisoned = alu_io_bypass_1_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_is_br = alu_io_bypass_1_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_is_jalr = alu_io_bypass_1_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_is_jal = alu_io_bypass_1_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_is_sfb = alu_io_bypass_1_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_br_mask = alu_io_bypass_1_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_br_tag = alu_io_bypass_1_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ftq_idx = alu_io_bypass_1_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_edge_inst = alu_io_bypass_1_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_pc_lob = alu_io_bypass_1_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_taken = alu_io_bypass_1_bits_fflags_bits_uop_taken; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_imm_packed = alu_io_bypass_1_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_csr_addr = alu_io_bypass_1_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_rob_idx = alu_io_bypass_1_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ldq_idx = alu_io_bypass_1_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_stq_idx = alu_io_bypass_1_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_rxq_idx = alu_io_bypass_1_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_pdst = alu_io_bypass_1_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_prs1 = alu_io_bypass_1_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_prs2 = alu_io_bypass_1_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_prs3 = alu_io_bypass_1_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ppred = alu_io_bypass_1_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_prs1_busy = alu_io_bypass_1_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_prs2_busy = alu_io_bypass_1_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_prs3_busy = alu_io_bypass_1_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ppred_busy = alu_io_bypass_1_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_stale_pdst = alu_io_bypass_1_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_exception = alu_io_bypass_1_bits_fflags_bits_uop_exception; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_exc_cause = alu_io_bypass_1_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_bypassable = alu_io_bypass_1_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_mem_cmd = alu_io_bypass_1_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_mem_size = alu_io_bypass_1_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_mem_signed = alu_io_bypass_1_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_is_fence = alu_io_bypass_1_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_is_fencei = alu_io_bypass_1_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_is_amo = alu_io_bypass_1_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_uses_ldq = alu_io_bypass_1_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_uses_stq = alu_io_bypass_1_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_is_sys_pc2epc = alu_io_bypass_1_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_is_unique = alu_io_bypass_1_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_flush_on_commit = alu_io_bypass_1_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ldst_is_rs1 = alu_io_bypass_1_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ldst = alu_io_bypass_1_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_lrs1 = alu_io_bypass_1_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_lrs2 = alu_io_bypass_1_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_lrs3 = alu_io_bypass_1_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_ldst_val = alu_io_bypass_1_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_dst_rtype = alu_io_bypass_1_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_lrs1_rtype = alu_io_bypass_1_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_lrs2_rtype = alu_io_bypass_1_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_frs3_en = alu_io_bypass_1_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_fp_val = alu_io_bypass_1_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_fp_single = alu_io_bypass_1_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_xcpt_pf_if = alu_io_bypass_1_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_xcpt_ae_if = alu_io_bypass_1_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_xcpt_ma_if = alu_io_bypass_1_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_bp_debug_if = alu_io_bypass_1_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_bp_xcpt_if = alu_io_bypass_1_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_debug_fsrc = alu_io_bypass_1_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_uop_debug_tsrc = alu_io_bypass_1_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflags_bits_flags = alu_io_bypass_1_bits_fflags_bits_flags; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_flagdata = alu_io_bypass_1_bits_flagdata; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_valid = alu_io_bypass_1_bits_fflagdata_valid; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_switch = alu_io_bypass_1_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_switch_off = alu_io_bypass_1_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_is_unicore = alu_io_bypass_1_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_shift = alu_io_bypass_1_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_lrs3_rtype = alu_io_bypass_1_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_rflag = alu_io_bypass_1_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_wflag = alu_io_bypass_1_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_prflag = alu_io_bypass_1_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_pwflag = alu_io_bypass_1_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_pflag_busy = alu_io_bypass_1_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_stale_pflag = alu_io_bypass_1_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_op1_sel = alu_io_bypass_1_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_op2_sel = alu_io_bypass_1_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_split_num = alu_io_bypass_1_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_self_index = alu_io_bypass_1_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_rob_inst_idx = alu_io_bypass_1_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_address_num = alu_io_bypass_1_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_uopc = alu_io_bypass_1_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_inst = alu_io_bypass_1_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_debug_inst = alu_io_bypass_1_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_is_rvc = alu_io_bypass_1_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_debug_pc = alu_io_bypass_1_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_iq_type = alu_io_bypass_1_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_fu_code = alu_io_bypass_1_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ctrl_br_type = alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ctrl_op1_sel = alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ctrl_op2_sel = alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ctrl_imm_sel = alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ctrl_op_fcn = alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ctrl_fcn_dw = alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ctrl_csr_cmd = alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_load = alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_sta = alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_std = alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ctrl_op3_sel = alu_io_bypass_1_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_iw_state = alu_io_bypass_1_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_iw_p1_poisoned = alu_io_bypass_1_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_iw_p2_poisoned = alu_io_bypass_1_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_is_br = alu_io_bypass_1_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_is_jalr = alu_io_bypass_1_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_is_jal = alu_io_bypass_1_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_is_sfb = alu_io_bypass_1_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_br_mask = alu_io_bypass_1_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_br_tag = alu_io_bypass_1_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ftq_idx = alu_io_bypass_1_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_edge_inst = alu_io_bypass_1_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_pc_lob = alu_io_bypass_1_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_taken = alu_io_bypass_1_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_imm_packed = alu_io_bypass_1_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_csr_addr = alu_io_bypass_1_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_rob_idx = alu_io_bypass_1_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ldq_idx = alu_io_bypass_1_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_stq_idx = alu_io_bypass_1_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_rxq_idx = alu_io_bypass_1_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_pdst = alu_io_bypass_1_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_prs1 = alu_io_bypass_1_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_prs2 = alu_io_bypass_1_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_prs3 = alu_io_bypass_1_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ppred = alu_io_bypass_1_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_prs1_busy = alu_io_bypass_1_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_prs2_busy = alu_io_bypass_1_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_prs3_busy = alu_io_bypass_1_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ppred_busy = alu_io_bypass_1_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_stale_pdst = alu_io_bypass_1_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_exception = alu_io_bypass_1_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_exc_cause = alu_io_bypass_1_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_bypassable = alu_io_bypass_1_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_mem_cmd = alu_io_bypass_1_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_mem_size = alu_io_bypass_1_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_mem_signed = alu_io_bypass_1_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_is_fence = alu_io_bypass_1_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_is_fencei = alu_io_bypass_1_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_is_amo = alu_io_bypass_1_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_uses_ldq = alu_io_bypass_1_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_uses_stq = alu_io_bypass_1_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_is_sys_pc2epc = alu_io_bypass_1_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_is_unique = alu_io_bypass_1_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_flush_on_commit = alu_io_bypass_1_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ldst_is_rs1 = alu_io_bypass_1_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ldst = alu_io_bypass_1_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_lrs1 = alu_io_bypass_1_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_lrs2 = alu_io_bypass_1_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_lrs3 = alu_io_bypass_1_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_ldst_val = alu_io_bypass_1_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_dst_rtype = alu_io_bypass_1_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_lrs1_rtype = alu_io_bypass_1_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_lrs2_rtype = alu_io_bypass_1_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_frs3_en = alu_io_bypass_1_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_fp_val = alu_io_bypass_1_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_fp_single = alu_io_bypass_1_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_xcpt_pf_if = alu_io_bypass_1_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_xcpt_ae_if = alu_io_bypass_1_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_xcpt_ma_if = alu_io_bypass_1_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_bp_debug_if = alu_io_bypass_1_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_bp_xcpt_if = alu_io_bypass_1_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_debug_fsrc = alu_io_bypass_1_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_uop_debug_tsrc = alu_io_bypass_1_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_1_bits_fflagdata_bits_fflag = alu_io_bypass_1_bits_fflagdata_bits_fflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_valid = alu_io_bypass_2_valid; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_switch = alu_io_bypass_2_bits_uop_switch; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_switch_off = alu_io_bypass_2_bits_uop_switch_off; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_is_unicore = alu_io_bypass_2_bits_uop_is_unicore; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_shift = alu_io_bypass_2_bits_uop_shift; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_lrs3_rtype = alu_io_bypass_2_bits_uop_lrs3_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_rflag = alu_io_bypass_2_bits_uop_rflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_wflag = alu_io_bypass_2_bits_uop_wflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_prflag = alu_io_bypass_2_bits_uop_prflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_pwflag = alu_io_bypass_2_bits_uop_pwflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_pflag_busy = alu_io_bypass_2_bits_uop_pflag_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_stale_pflag = alu_io_bypass_2_bits_uop_stale_pflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_op1_sel = alu_io_bypass_2_bits_uop_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_op2_sel = alu_io_bypass_2_bits_uop_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_split_num = alu_io_bypass_2_bits_uop_split_num; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_self_index = alu_io_bypass_2_bits_uop_self_index; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_rob_inst_idx = alu_io_bypass_2_bits_uop_rob_inst_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_address_num = alu_io_bypass_2_bits_uop_address_num; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_uopc = alu_io_bypass_2_bits_uop_uopc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_inst = alu_io_bypass_2_bits_uop_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_debug_inst = alu_io_bypass_2_bits_uop_debug_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_is_rvc = alu_io_bypass_2_bits_uop_is_rvc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_debug_pc = alu_io_bypass_2_bits_uop_debug_pc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_iq_type = alu_io_bypass_2_bits_uop_iq_type; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_fu_code = alu_io_bypass_2_bits_uop_fu_code; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ctrl_br_type = alu_io_bypass_2_bits_uop_ctrl_br_type; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ctrl_op1_sel = alu_io_bypass_2_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ctrl_op2_sel = alu_io_bypass_2_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ctrl_imm_sel = alu_io_bypass_2_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ctrl_op_fcn = alu_io_bypass_2_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ctrl_fcn_dw = alu_io_bypass_2_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ctrl_csr_cmd = alu_io_bypass_2_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ctrl_is_load = alu_io_bypass_2_bits_uop_ctrl_is_load; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ctrl_is_sta = alu_io_bypass_2_bits_uop_ctrl_is_sta; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ctrl_is_std = alu_io_bypass_2_bits_uop_ctrl_is_std; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ctrl_op3_sel = alu_io_bypass_2_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_iw_state = alu_io_bypass_2_bits_uop_iw_state; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_iw_p1_poisoned = alu_io_bypass_2_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_iw_p2_poisoned = alu_io_bypass_2_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_is_br = alu_io_bypass_2_bits_uop_is_br; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_is_jalr = alu_io_bypass_2_bits_uop_is_jalr; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_is_jal = alu_io_bypass_2_bits_uop_is_jal; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_is_sfb = alu_io_bypass_2_bits_uop_is_sfb; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_br_mask = alu_io_bypass_2_bits_uop_br_mask; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_br_tag = alu_io_bypass_2_bits_uop_br_tag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ftq_idx = alu_io_bypass_2_bits_uop_ftq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_edge_inst = alu_io_bypass_2_bits_uop_edge_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_pc_lob = alu_io_bypass_2_bits_uop_pc_lob; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_taken = alu_io_bypass_2_bits_uop_taken; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_imm_packed = alu_io_bypass_2_bits_uop_imm_packed; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_csr_addr = alu_io_bypass_2_bits_uop_csr_addr; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_rob_idx = alu_io_bypass_2_bits_uop_rob_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ldq_idx = alu_io_bypass_2_bits_uop_ldq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_stq_idx = alu_io_bypass_2_bits_uop_stq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_rxq_idx = alu_io_bypass_2_bits_uop_rxq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_pdst = alu_io_bypass_2_bits_uop_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_prs1 = alu_io_bypass_2_bits_uop_prs1; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_prs2 = alu_io_bypass_2_bits_uop_prs2; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_prs3 = alu_io_bypass_2_bits_uop_prs3; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ppred = alu_io_bypass_2_bits_uop_ppred; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_prs1_busy = alu_io_bypass_2_bits_uop_prs1_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_prs2_busy = alu_io_bypass_2_bits_uop_prs2_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_prs3_busy = alu_io_bypass_2_bits_uop_prs3_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ppred_busy = alu_io_bypass_2_bits_uop_ppred_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_stale_pdst = alu_io_bypass_2_bits_uop_stale_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_exception = alu_io_bypass_2_bits_uop_exception; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_exc_cause = alu_io_bypass_2_bits_uop_exc_cause; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_bypassable = alu_io_bypass_2_bits_uop_bypassable; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_mem_cmd = alu_io_bypass_2_bits_uop_mem_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_mem_size = alu_io_bypass_2_bits_uop_mem_size; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_mem_signed = alu_io_bypass_2_bits_uop_mem_signed; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_is_fence = alu_io_bypass_2_bits_uop_is_fence; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_is_fencei = alu_io_bypass_2_bits_uop_is_fencei; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_is_amo = alu_io_bypass_2_bits_uop_is_amo; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_uses_ldq = alu_io_bypass_2_bits_uop_uses_ldq; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_uses_stq = alu_io_bypass_2_bits_uop_uses_stq; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_is_sys_pc2epc = alu_io_bypass_2_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_is_unique = alu_io_bypass_2_bits_uop_is_unique; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_flush_on_commit = alu_io_bypass_2_bits_uop_flush_on_commit; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ldst_is_rs1 = alu_io_bypass_2_bits_uop_ldst_is_rs1; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ldst = alu_io_bypass_2_bits_uop_ldst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_lrs1 = alu_io_bypass_2_bits_uop_lrs1; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_lrs2 = alu_io_bypass_2_bits_uop_lrs2; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_lrs3 = alu_io_bypass_2_bits_uop_lrs3; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_ldst_val = alu_io_bypass_2_bits_uop_ldst_val; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_dst_rtype = alu_io_bypass_2_bits_uop_dst_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_lrs1_rtype = alu_io_bypass_2_bits_uop_lrs1_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_lrs2_rtype = alu_io_bypass_2_bits_uop_lrs2_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_frs3_en = alu_io_bypass_2_bits_uop_frs3_en; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_fp_val = alu_io_bypass_2_bits_uop_fp_val; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_fp_single = alu_io_bypass_2_bits_uop_fp_single; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_xcpt_pf_if = alu_io_bypass_2_bits_uop_xcpt_pf_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_xcpt_ae_if = alu_io_bypass_2_bits_uop_xcpt_ae_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_xcpt_ma_if = alu_io_bypass_2_bits_uop_xcpt_ma_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_bp_debug_if = alu_io_bypass_2_bits_uop_bp_debug_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_bp_xcpt_if = alu_io_bypass_2_bits_uop_bp_xcpt_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_debug_fsrc = alu_io_bypass_2_bits_uop_debug_fsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_uop_debug_tsrc = alu_io_bypass_2_bits_uop_debug_tsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_data = {{1'd0}, alu_io_bypass_2_bits_data}; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_predicated = alu_io_bypass_2_bits_predicated; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_valid = alu_io_bypass_2_bits_fflags_valid; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_switch = alu_io_bypass_2_bits_fflags_bits_uop_switch; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_switch_off = alu_io_bypass_2_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_is_unicore = alu_io_bypass_2_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_shift = alu_io_bypass_2_bits_fflags_bits_uop_shift; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_lrs3_rtype = alu_io_bypass_2_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_rflag = alu_io_bypass_2_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_wflag = alu_io_bypass_2_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_prflag = alu_io_bypass_2_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_pwflag = alu_io_bypass_2_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_pflag_busy = alu_io_bypass_2_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_stale_pflag = alu_io_bypass_2_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_op1_sel = alu_io_bypass_2_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_op2_sel = alu_io_bypass_2_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_split_num = alu_io_bypass_2_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_self_index = alu_io_bypass_2_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_rob_inst_idx = alu_io_bypass_2_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_address_num = alu_io_bypass_2_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_uopc = alu_io_bypass_2_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_inst = alu_io_bypass_2_bits_fflags_bits_uop_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_debug_inst = alu_io_bypass_2_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_is_rvc = alu_io_bypass_2_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_debug_pc = alu_io_bypass_2_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_iq_type = alu_io_bypass_2_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_fu_code = alu_io_bypass_2_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ctrl_br_type = alu_io_bypass_2_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ctrl_op1_sel = alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ctrl_op2_sel = alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ctrl_imm_sel = alu_io_bypass_2_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ctrl_op_fcn = alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ctrl_fcn_dw = alu_io_bypass_2_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ctrl_csr_cmd = alu_io_bypass_2_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ctrl_is_load = alu_io_bypass_2_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ctrl_is_sta = alu_io_bypass_2_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ctrl_is_std = alu_io_bypass_2_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ctrl_op3_sel = alu_io_bypass_2_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_iw_state = alu_io_bypass_2_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_iw_p1_poisoned = alu_io_bypass_2_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_iw_p2_poisoned = alu_io_bypass_2_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_is_br = alu_io_bypass_2_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_is_jalr = alu_io_bypass_2_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_is_jal = alu_io_bypass_2_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_is_sfb = alu_io_bypass_2_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_br_mask = alu_io_bypass_2_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_br_tag = alu_io_bypass_2_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ftq_idx = alu_io_bypass_2_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_edge_inst = alu_io_bypass_2_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_pc_lob = alu_io_bypass_2_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_taken = alu_io_bypass_2_bits_fflags_bits_uop_taken; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_imm_packed = alu_io_bypass_2_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_csr_addr = alu_io_bypass_2_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_rob_idx = alu_io_bypass_2_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ldq_idx = alu_io_bypass_2_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_stq_idx = alu_io_bypass_2_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_rxq_idx = alu_io_bypass_2_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_pdst = alu_io_bypass_2_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_prs1 = alu_io_bypass_2_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_prs2 = alu_io_bypass_2_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_prs3 = alu_io_bypass_2_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ppred = alu_io_bypass_2_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_prs1_busy = alu_io_bypass_2_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_prs2_busy = alu_io_bypass_2_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_prs3_busy = alu_io_bypass_2_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ppred_busy = alu_io_bypass_2_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_stale_pdst = alu_io_bypass_2_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_exception = alu_io_bypass_2_bits_fflags_bits_uop_exception; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_exc_cause = alu_io_bypass_2_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_bypassable = alu_io_bypass_2_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_mem_cmd = alu_io_bypass_2_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_mem_size = alu_io_bypass_2_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_mem_signed = alu_io_bypass_2_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_is_fence = alu_io_bypass_2_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_is_fencei = alu_io_bypass_2_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_is_amo = alu_io_bypass_2_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_uses_ldq = alu_io_bypass_2_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_uses_stq = alu_io_bypass_2_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_is_sys_pc2epc = alu_io_bypass_2_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_is_unique = alu_io_bypass_2_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_flush_on_commit = alu_io_bypass_2_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ldst_is_rs1 = alu_io_bypass_2_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ldst = alu_io_bypass_2_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_lrs1 = alu_io_bypass_2_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_lrs2 = alu_io_bypass_2_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_lrs3 = alu_io_bypass_2_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_ldst_val = alu_io_bypass_2_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_dst_rtype = alu_io_bypass_2_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_lrs1_rtype = alu_io_bypass_2_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_lrs2_rtype = alu_io_bypass_2_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_frs3_en = alu_io_bypass_2_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_fp_val = alu_io_bypass_2_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_fp_single = alu_io_bypass_2_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_xcpt_pf_if = alu_io_bypass_2_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_xcpt_ae_if = alu_io_bypass_2_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_xcpt_ma_if = alu_io_bypass_2_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_bp_debug_if = alu_io_bypass_2_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_bp_xcpt_if = alu_io_bypass_2_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_debug_fsrc = alu_io_bypass_2_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_uop_debug_tsrc = alu_io_bypass_2_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflags_bits_flags = alu_io_bypass_2_bits_fflags_bits_flags; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_flagdata = alu_io_bypass_2_bits_flagdata; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_valid = alu_io_bypass_2_bits_fflagdata_valid; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_switch = alu_io_bypass_2_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_switch_off = alu_io_bypass_2_bits_fflagdata_bits_uop_switch_off; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_is_unicore = alu_io_bypass_2_bits_fflagdata_bits_uop_is_unicore; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_shift = alu_io_bypass_2_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_lrs3_rtype = alu_io_bypass_2_bits_fflagdata_bits_uop_lrs3_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_rflag = alu_io_bypass_2_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_wflag = alu_io_bypass_2_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_prflag = alu_io_bypass_2_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_pwflag = alu_io_bypass_2_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_pflag_busy = alu_io_bypass_2_bits_fflagdata_bits_uop_pflag_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_stale_pflag = alu_io_bypass_2_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_op1_sel = alu_io_bypass_2_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_op2_sel = alu_io_bypass_2_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_split_num = alu_io_bypass_2_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_self_index = alu_io_bypass_2_bits_fflagdata_bits_uop_self_index; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_rob_inst_idx = alu_io_bypass_2_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_address_num = alu_io_bypass_2_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_uopc = alu_io_bypass_2_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_inst = alu_io_bypass_2_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_debug_inst = alu_io_bypass_2_bits_fflagdata_bits_uop_debug_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_is_rvc = alu_io_bypass_2_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_debug_pc = alu_io_bypass_2_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_iq_type = alu_io_bypass_2_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_fu_code = alu_io_bypass_2_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ctrl_br_type = alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ctrl_op1_sel = alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ctrl_op2_sel = alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ctrl_imm_sel = alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ctrl_op_fcn = alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ctrl_fcn_dw = alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ctrl_csr_cmd = alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_load = alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_sta = alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_std = alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ctrl_op3_sel = alu_io_bypass_2_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_iw_state = alu_io_bypass_2_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_iw_p1_poisoned = alu_io_bypass_2_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_iw_p2_poisoned = alu_io_bypass_2_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_is_br = alu_io_bypass_2_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_is_jalr = alu_io_bypass_2_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_is_jal = alu_io_bypass_2_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_is_sfb = alu_io_bypass_2_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_br_mask = alu_io_bypass_2_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_br_tag = alu_io_bypass_2_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ftq_idx = alu_io_bypass_2_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_edge_inst = alu_io_bypass_2_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_pc_lob = alu_io_bypass_2_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_taken = alu_io_bypass_2_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_imm_packed = alu_io_bypass_2_bits_fflagdata_bits_uop_imm_packed; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_csr_addr = alu_io_bypass_2_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_rob_idx = alu_io_bypass_2_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ldq_idx = alu_io_bypass_2_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_stq_idx = alu_io_bypass_2_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_rxq_idx = alu_io_bypass_2_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_pdst = alu_io_bypass_2_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_prs1 = alu_io_bypass_2_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_prs2 = alu_io_bypass_2_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_prs3 = alu_io_bypass_2_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ppred = alu_io_bypass_2_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_prs1_busy = alu_io_bypass_2_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_prs2_busy = alu_io_bypass_2_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_prs3_busy = alu_io_bypass_2_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ppred_busy = alu_io_bypass_2_bits_fflagdata_bits_uop_ppred_busy; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_stale_pdst = alu_io_bypass_2_bits_fflagdata_bits_uop_stale_pdst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_exception = alu_io_bypass_2_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_exc_cause = alu_io_bypass_2_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_bypassable = alu_io_bypass_2_bits_fflagdata_bits_uop_bypassable; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_mem_cmd = alu_io_bypass_2_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_mem_size = alu_io_bypass_2_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_mem_signed = alu_io_bypass_2_bits_fflagdata_bits_uop_mem_signed; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_is_fence = alu_io_bypass_2_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_is_fencei = alu_io_bypass_2_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_is_amo = alu_io_bypass_2_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_uses_ldq = alu_io_bypass_2_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_uses_stq = alu_io_bypass_2_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_is_sys_pc2epc = alu_io_bypass_2_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_is_unique = alu_io_bypass_2_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_flush_on_commit = alu_io_bypass_2_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ldst_is_rs1 = alu_io_bypass_2_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ldst = alu_io_bypass_2_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_lrs1 = alu_io_bypass_2_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_lrs2 = alu_io_bypass_2_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_lrs3 = alu_io_bypass_2_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_ldst_val = alu_io_bypass_2_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_dst_rtype = alu_io_bypass_2_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_lrs1_rtype = alu_io_bypass_2_bits_fflagdata_bits_uop_lrs1_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_lrs2_rtype = alu_io_bypass_2_bits_fflagdata_bits_uop_lrs2_rtype; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_frs3_en = alu_io_bypass_2_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_fp_val = alu_io_bypass_2_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_fp_single = alu_io_bypass_2_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_xcpt_pf_if = alu_io_bypass_2_bits_fflagdata_bits_uop_xcpt_pf_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_xcpt_ae_if = alu_io_bypass_2_bits_fflagdata_bits_uop_xcpt_ae_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_xcpt_ma_if = alu_io_bypass_2_bits_fflagdata_bits_uop_xcpt_ma_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_bp_debug_if = alu_io_bypass_2_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_bp_xcpt_if = alu_io_bypass_2_bits_fflagdata_bits_uop_bp_xcpt_if; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_debug_fsrc = alu_io_bypass_2_bits_fflagdata_bits_uop_debug_fsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_uop_debug_tsrc = alu_io_bypass_2_bits_fflagdata_bits_uop_debug_tsrc; // @[execution-unit.scala 302:15]
  assign io_bypass_2_bits_fflagdata_bits_fflag = alu_io_bypass_2_bits_fflagdata_bits_fflag; // @[execution-unit.scala 302:15]
  assign io_brinfo_uop_switch = alu_io_brinfo_uop_switch; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_switch_off = alu_io_brinfo_uop_switch_off; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_is_unicore = alu_io_brinfo_uop_is_unicore; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_shift = alu_io_brinfo_uop_shift; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_lrs3_rtype = alu_io_brinfo_uop_lrs3_rtype; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_rflag = alu_io_brinfo_uop_rflag; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_wflag = alu_io_brinfo_uop_wflag; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_prflag = alu_io_brinfo_uop_prflag; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_pwflag = alu_io_brinfo_uop_pwflag; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_pflag_busy = alu_io_brinfo_uop_pflag_busy; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_stale_pflag = alu_io_brinfo_uop_stale_pflag; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_op1_sel = alu_io_brinfo_uop_op1_sel; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_op2_sel = alu_io_brinfo_uop_op2_sel; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_split_num = alu_io_brinfo_uop_split_num; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_self_index = alu_io_brinfo_uop_self_index; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_rob_inst_idx = alu_io_brinfo_uop_rob_inst_idx; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_address_num = alu_io_brinfo_uop_address_num; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_uopc = alu_io_brinfo_uop_uopc; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_inst = alu_io_brinfo_uop_inst; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_debug_inst = alu_io_brinfo_uop_debug_inst; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_is_rvc = alu_io_brinfo_uop_is_rvc; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_debug_pc = alu_io_brinfo_uop_debug_pc; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_iq_type = alu_io_brinfo_uop_iq_type; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_fu_code = alu_io_brinfo_uop_fu_code; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ctrl_br_type = alu_io_brinfo_uop_ctrl_br_type; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ctrl_op1_sel = alu_io_brinfo_uop_ctrl_op1_sel; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ctrl_op2_sel = alu_io_brinfo_uop_ctrl_op2_sel; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ctrl_imm_sel = alu_io_brinfo_uop_ctrl_imm_sel; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ctrl_op_fcn = alu_io_brinfo_uop_ctrl_op_fcn; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ctrl_fcn_dw = alu_io_brinfo_uop_ctrl_fcn_dw; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ctrl_csr_cmd = alu_io_brinfo_uop_ctrl_csr_cmd; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ctrl_is_load = alu_io_brinfo_uop_ctrl_is_load; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ctrl_is_sta = alu_io_brinfo_uop_ctrl_is_sta; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ctrl_is_std = alu_io_brinfo_uop_ctrl_is_std; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ctrl_op3_sel = alu_io_brinfo_uop_ctrl_op3_sel; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_iw_state = alu_io_brinfo_uop_iw_state; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_iw_p1_poisoned = alu_io_brinfo_uop_iw_p1_poisoned; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_iw_p2_poisoned = alu_io_brinfo_uop_iw_p2_poisoned; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_is_br = alu_io_brinfo_uop_is_br; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_is_jalr = alu_io_brinfo_uop_is_jalr; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_is_jal = alu_io_brinfo_uop_is_jal; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_is_sfb = alu_io_brinfo_uop_is_sfb; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_br_mask = alu_io_brinfo_uop_br_mask; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_br_tag = alu_io_brinfo_uop_br_tag; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ftq_idx = alu_io_brinfo_uop_ftq_idx; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_edge_inst = alu_io_brinfo_uop_edge_inst; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_pc_lob = alu_io_brinfo_uop_pc_lob; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_taken = alu_io_brinfo_uop_taken; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_imm_packed = alu_io_brinfo_uop_imm_packed; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_csr_addr = alu_io_brinfo_uop_csr_addr; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_rob_idx = alu_io_brinfo_uop_rob_idx; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ldq_idx = alu_io_brinfo_uop_ldq_idx; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_stq_idx = alu_io_brinfo_uop_stq_idx; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_rxq_idx = alu_io_brinfo_uop_rxq_idx; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_pdst = alu_io_brinfo_uop_pdst; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_prs1 = alu_io_brinfo_uop_prs1; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_prs2 = alu_io_brinfo_uop_prs2; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_prs3 = alu_io_brinfo_uop_prs3; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ppred = alu_io_brinfo_uop_ppred; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_prs1_busy = alu_io_brinfo_uop_prs1_busy; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_prs2_busy = alu_io_brinfo_uop_prs2_busy; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_prs3_busy = alu_io_brinfo_uop_prs3_busy; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ppred_busy = alu_io_brinfo_uop_ppred_busy; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_stale_pdst = alu_io_brinfo_uop_stale_pdst; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_exception = alu_io_brinfo_uop_exception; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_exc_cause = alu_io_brinfo_uop_exc_cause; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_bypassable = alu_io_brinfo_uop_bypassable; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_mem_cmd = alu_io_brinfo_uop_mem_cmd; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_mem_size = alu_io_brinfo_uop_mem_size; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_mem_signed = alu_io_brinfo_uop_mem_signed; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_is_fence = alu_io_brinfo_uop_is_fence; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_is_fencei = alu_io_brinfo_uop_is_fencei; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_is_amo = alu_io_brinfo_uop_is_amo; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_uses_ldq = alu_io_brinfo_uop_uses_ldq; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_uses_stq = alu_io_brinfo_uop_uses_stq; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_is_sys_pc2epc = alu_io_brinfo_uop_is_sys_pc2epc; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_is_unique = alu_io_brinfo_uop_is_unique; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_flush_on_commit = alu_io_brinfo_uop_flush_on_commit; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ldst_is_rs1 = alu_io_brinfo_uop_ldst_is_rs1; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ldst = alu_io_brinfo_uop_ldst; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_lrs1 = alu_io_brinfo_uop_lrs1; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_lrs2 = alu_io_brinfo_uop_lrs2; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_lrs3 = alu_io_brinfo_uop_lrs3; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_ldst_val = alu_io_brinfo_uop_ldst_val; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_dst_rtype = alu_io_brinfo_uop_dst_rtype; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_lrs1_rtype = alu_io_brinfo_uop_lrs1_rtype; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_lrs2_rtype = alu_io_brinfo_uop_lrs2_rtype; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_frs3_en = alu_io_brinfo_uop_frs3_en; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_fp_val = alu_io_brinfo_uop_fp_val; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_fp_single = alu_io_brinfo_uop_fp_single; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_xcpt_pf_if = alu_io_brinfo_uop_xcpt_pf_if; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_xcpt_ae_if = alu_io_brinfo_uop_xcpt_ae_if; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_xcpt_ma_if = alu_io_brinfo_uop_xcpt_ma_if; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_bp_debug_if = alu_io_brinfo_uop_bp_debug_if; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_bp_xcpt_if = alu_io_brinfo_uop_bp_xcpt_if; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_debug_fsrc = alu_io_brinfo_uop_debug_fsrc; // @[execution-unit.scala 305:15]
  assign io_brinfo_uop_debug_tsrc = alu_io_brinfo_uop_debug_tsrc; // @[execution-unit.scala 305:15]
  assign io_brinfo_valid = alu_io_brinfo_valid; // @[execution-unit.scala 305:15]
  assign io_brinfo_mispredict = alu_io_brinfo_mispredict; // @[execution-unit.scala 305:15]
  assign io_brinfo_taken = alu_io_brinfo_taken; // @[execution-unit.scala 305:15]
  assign io_brinfo_cfi_type = alu_io_brinfo_cfi_type; // @[execution-unit.scala 305:15]
  assign io_brinfo_pc_sel = alu_io_brinfo_pc_sel; // @[execution-unit.scala 305:15]
  assign io_brinfo_jalr_target = alu_io_brinfo_jalr_target; // @[execution-unit.scala 305:15]
  assign io_brinfo_target_offset = alu_io_brinfo_target_offset; // @[execution-unit.scala 305:15]
  assign io_get_ftq_pc_ftq_idx = alu_io_get_ftq_pc_ftq_idx; // @[execution-unit.scala 307:25]
  assign alu_clock = clock;
  assign alu_reset = reset;
  assign alu_io_req_valid = io_req_valid & _T_26; // @[execution-unit.scala 280:20]
  assign alu_io_req_bits_uop_switch = io_req_bits_uop_switch; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_switch_off = io_req_bits_uop_switch_off; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_is_unicore = io_req_bits_uop_is_unicore; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_shift = io_req_bits_uop_shift; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_lrs3_rtype = io_req_bits_uop_lrs3_rtype; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_rflag = io_req_bits_uop_rflag; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_wflag = io_req_bits_uop_wflag; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_prflag = io_req_bits_uop_prflag; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_pwflag = io_req_bits_uop_pwflag; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_pflag_busy = io_req_bits_uop_pflag_busy; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_stale_pflag = io_req_bits_uop_stale_pflag; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_op1_sel = io_req_bits_uop_op1_sel; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_op2_sel = io_req_bits_uop_op2_sel; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_split_num = io_req_bits_uop_split_num; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_self_index = io_req_bits_uop_self_index; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_rob_inst_idx = io_req_bits_uop_rob_inst_idx; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_address_num = io_req_bits_uop_address_num; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_uopc = io_req_bits_uop_uopc; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_inst = io_req_bits_uop_inst; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_debug_inst = io_req_bits_uop_debug_inst; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_is_rvc = io_req_bits_uop_is_rvc; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_debug_pc = io_req_bits_uop_debug_pc; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_iq_type = io_req_bits_uop_iq_type; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_fu_code = io_req_bits_uop_fu_code; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ctrl_op3_sel = io_req_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_iw_state = io_req_bits_uop_iw_state; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_is_br = io_req_bits_uop_is_br; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_is_jalr = io_req_bits_uop_is_jalr; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_is_jal = io_req_bits_uop_is_jal; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_is_sfb = io_req_bits_uop_is_sfb; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_br_mask = io_req_bits_uop_br_mask; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_br_tag = io_req_bits_uop_br_tag; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_edge_inst = io_req_bits_uop_edge_inst; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_pc_lob = io_req_bits_uop_pc_lob; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_taken = io_req_bits_uop_taken; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_imm_packed = io_req_bits_uop_imm_packed; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_csr_addr = io_req_bits_uop_csr_addr; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_rob_idx = io_req_bits_uop_rob_idx; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_stq_idx = io_req_bits_uop_stq_idx; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_pdst = io_req_bits_uop_pdst; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_prs1 = io_req_bits_uop_prs1; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_prs2 = io_req_bits_uop_prs2; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_prs3 = io_req_bits_uop_prs3; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ppred = io_req_bits_uop_ppred; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_exception = io_req_bits_uop_exception; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_exc_cause = io_req_bits_uop_exc_cause; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_bypassable = io_req_bits_uop_bypassable; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_mem_size = io_req_bits_uop_mem_size; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_mem_signed = io_req_bits_uop_mem_signed; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_is_fence = io_req_bits_uop_is_fence; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_is_fencei = io_req_bits_uop_is_fencei; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_is_amo = io_req_bits_uop_is_amo; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_uses_stq = io_req_bits_uop_uses_stq; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_is_unique = io_req_bits_uop_is_unique; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ldst = io_req_bits_uop_ldst; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_lrs1 = io_req_bits_uop_lrs1; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_lrs2 = io_req_bits_uop_lrs2; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_lrs3 = io_req_bits_uop_lrs3; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_ldst_val = io_req_bits_uop_ldst_val; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_frs3_en = io_req_bits_uop_frs3_en; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_fp_val = io_req_bits_uop_fp_val; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_fp_single = io_req_bits_uop_fp_single; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 286:30]
  assign alu_io_req_bits_rs1_data = io_req_bits_rs1_data[63:0]; // @[execution-unit.scala 288:30]
  assign alu_io_req_bits_rs2_data = io_req_bits_rs2_data[63:0]; // @[execution-unit.scala 289:30]
  assign alu_io_req_bits_rs3_data = io_req_bits_rs3_data[63:0]; // @[execution-unit.scala 291:30]
  assign alu_io_req_bits_pred_data = io_req_bits_pred_data; // @[execution-unit.scala 295:31]
  assign alu_io_req_bits_flagdata = io_req_bits_flagdata; // @[execution-unit.scala 293:30]
  assign alu_io_req_bits_fflagdata = io_req_bits_fflagdata; // @[execution-unit.scala 294:31]
  assign alu_io_req_bits_kill = io_req_bits_kill; // @[execution-unit.scala 287:30]
  assign alu_io_resp_ready = 1'h0;
  assign alu_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_switch = io_brupdate_b2_uop_switch; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_switch_off = io_brupdate_b2_uop_switch_off; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_is_unicore = io_brupdate_b2_uop_is_unicore; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_shift = io_brupdate_b2_uop_shift; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_lrs3_rtype = io_brupdate_b2_uop_lrs3_rtype; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_rflag = io_brupdate_b2_uop_rflag; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_wflag = io_brupdate_b2_uop_wflag; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_prflag = io_brupdate_b2_uop_prflag; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_pwflag = io_brupdate_b2_uop_pwflag; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_pflag_busy = io_brupdate_b2_uop_pflag_busy; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_stale_pflag = io_brupdate_b2_uop_stale_pflag; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_op1_sel = io_brupdate_b2_uop_op1_sel; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_op2_sel = io_brupdate_b2_uop_op2_sel; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_split_num = io_brupdate_b2_uop_split_num; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_self_index = io_brupdate_b2_uop_self_index; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_rob_inst_idx = io_brupdate_b2_uop_rob_inst_idx; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_address_num = io_brupdate_b2_uop_address_num; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ctrl_op3_sel = io_brupdate_b2_uop_ctrl_op3_sel; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[execution-unit.scala 297:21]
  assign alu_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[execution-unit.scala 297:21]
  assign alu_io_get_ftq_pc_entry_cfi_idx_valid = io_get_ftq_pc_entry_cfi_idx_valid; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_entry_cfi_idx_bits = io_get_ftq_pc_entry_cfi_idx_bits; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_entry_cfi_taken = io_get_ftq_pc_entry_cfi_taken; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_entry_cfi_mispredicted = io_get_ftq_pc_entry_cfi_mispredicted; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_entry_cfi_type = io_get_ftq_pc_entry_cfi_type; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_entry_br_mask = io_get_ftq_pc_entry_br_mask; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_entry_cfi_is_call = io_get_ftq_pc_entry_cfi_is_call; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_entry_cfi_is_ret = io_get_ftq_pc_entry_cfi_is_ret; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_entry_cfi_npc_plus4 = io_get_ftq_pc_entry_cfi_npc_plus4; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_entry_ras_top = io_get_ftq_pc_entry_ras_top; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_entry_ras_idx = io_get_ftq_pc_entry_ras_idx; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_entry_start_bank = io_get_ftq_pc_entry_start_bank; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_ghist_old_history = io_get_ftq_pc_ghist_old_history; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_ghist_current_saw_branch_not_taken = io_get_ftq_pc_ghist_current_saw_branch_not_taken; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_ghist_new_saw_branch_not_taken = io_get_ftq_pc_ghist_new_saw_branch_not_taken; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_ghist_new_saw_branch_taken = io_get_ftq_pc_ghist_new_saw_branch_taken; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_ghist_ras_idx = io_get_ftq_pc_ghist_ras_idx; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_pc = io_get_ftq_pc_pc; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_com_pc = io_get_ftq_pc_com_pc; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_next_val = io_get_ftq_pc_next_val; // @[execution-unit.scala 307:25]
  assign alu_io_get_ftq_pc_next_pc = io_get_ftq_pc_next_pc; // @[execution-unit.scala 307:25]
  assign imul_clock = clock;
  assign imul_reset = reset;
  assign imul_io_req_valid = io_req_valid & _T_29; // @[execution-unit.scala 337:47]
  assign imul_io_req_bits_uop_switch = io_req_bits_uop_switch; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_switch_off = io_req_bits_uop_switch_off; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_is_unicore = io_req_bits_uop_is_unicore; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_shift = io_req_bits_uop_shift; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_lrs3_rtype = io_req_bits_uop_lrs3_rtype; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_rflag = io_req_bits_uop_rflag; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_wflag = io_req_bits_uop_wflag; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_prflag = io_req_bits_uop_prflag; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_pwflag = io_req_bits_uop_pwflag; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_pflag_busy = io_req_bits_uop_pflag_busy; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_stale_pflag = io_req_bits_uop_stale_pflag; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_op1_sel = io_req_bits_uop_op1_sel; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_op2_sel = io_req_bits_uop_op2_sel; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_split_num = io_req_bits_uop_split_num; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_self_index = io_req_bits_uop_self_index; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_rob_inst_idx = io_req_bits_uop_rob_inst_idx; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_address_num = io_req_bits_uop_address_num; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_uopc = io_req_bits_uop_uopc; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_inst = io_req_bits_uop_inst; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_debug_inst = io_req_bits_uop_debug_inst; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_is_rvc = io_req_bits_uop_is_rvc; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_debug_pc = io_req_bits_uop_debug_pc; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_iq_type = io_req_bits_uop_iq_type; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_fu_code = io_req_bits_uop_fu_code; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ctrl_op3_sel = io_req_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_iw_state = io_req_bits_uop_iw_state; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_is_br = io_req_bits_uop_is_br; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_is_jalr = io_req_bits_uop_is_jalr; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_is_jal = io_req_bits_uop_is_jal; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_is_sfb = io_req_bits_uop_is_sfb; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_br_mask = io_req_bits_uop_br_mask; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_br_tag = io_req_bits_uop_br_tag; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_edge_inst = io_req_bits_uop_edge_inst; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_pc_lob = io_req_bits_uop_pc_lob; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_taken = io_req_bits_uop_taken; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_imm_packed = io_req_bits_uop_imm_packed; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_csr_addr = io_req_bits_uop_csr_addr; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_rob_idx = io_req_bits_uop_rob_idx; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_stq_idx = io_req_bits_uop_stq_idx; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_pdst = io_req_bits_uop_pdst; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_prs1 = io_req_bits_uop_prs1; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_prs2 = io_req_bits_uop_prs2; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_prs3 = io_req_bits_uop_prs3; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ppred = io_req_bits_uop_ppred; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_exception = io_req_bits_uop_exception; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_exc_cause = io_req_bits_uop_exc_cause; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_bypassable = io_req_bits_uop_bypassable; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_mem_size = io_req_bits_uop_mem_size; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_mem_signed = io_req_bits_uop_mem_signed; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_is_fence = io_req_bits_uop_is_fence; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_is_fencei = io_req_bits_uop_is_fencei; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_is_amo = io_req_bits_uop_is_amo; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_uses_stq = io_req_bits_uop_uses_stq; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_is_unique = io_req_bits_uop_is_unique; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ldst = io_req_bits_uop_ldst; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_lrs1 = io_req_bits_uop_lrs1; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_lrs2 = io_req_bits_uop_lrs2; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_lrs3 = io_req_bits_uop_lrs3; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_ldst_val = io_req_bits_uop_ldst_val; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_frs3_en = io_req_bits_uop_frs3_en; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_fp_val = io_req_bits_uop_fp_val; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_fp_single = io_req_bits_uop_fp_single; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 338:31]
  assign imul_io_req_bits_rs1_data = io_req_bits_rs1_data[63:0]; // @[execution-unit.scala 339:31]
  assign imul_io_req_bits_rs2_data = io_req_bits_rs2_data[63:0]; // @[execution-unit.scala 340:31]
  assign imul_io_req_bits_rs3_data = io_req_bits_rs3_data[63:0]; // @[execution-unit.scala 342:31]
  assign imul_io_req_bits_pred_data = 1'h0;
  assign imul_io_req_bits_flagdata = io_req_bits_flagdata; // @[execution-unit.scala 344:31]
  assign imul_io_req_bits_fflagdata = io_req_bits_fflagdata; // @[execution-unit.scala 345:32]
  assign imul_io_req_bits_kill = io_req_bits_kill; // @[execution-unit.scala 346:31]
  assign imul_io_resp_ready = 1'h0;
  assign imul_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_switch = io_brupdate_b2_uop_switch; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_switch_off = io_brupdate_b2_uop_switch_off; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_is_unicore = io_brupdate_b2_uop_is_unicore; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_shift = io_brupdate_b2_uop_shift; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_lrs3_rtype = io_brupdate_b2_uop_lrs3_rtype; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_rflag = io_brupdate_b2_uop_rflag; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_wflag = io_brupdate_b2_uop_wflag; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_prflag = io_brupdate_b2_uop_prflag; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_pwflag = io_brupdate_b2_uop_pwflag; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_pflag_busy = io_brupdate_b2_uop_pflag_busy; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_stale_pflag = io_brupdate_b2_uop_stale_pflag; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_op1_sel = io_brupdate_b2_uop_op1_sel; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_op2_sel = io_brupdate_b2_uop_op2_sel; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_split_num = io_brupdate_b2_uop_split_num; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_self_index = io_brupdate_b2_uop_self_index; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_rob_inst_idx = io_brupdate_b2_uop_rob_inst_idx; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_address_num = io_brupdate_b2_uop_address_num; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ctrl_op3_sel = io_brupdate_b2_uop_ctrl_op3_sel; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[execution-unit.scala 347:22]
  assign imul_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[execution-unit.scala 347:22]
  assign ifpu_clock = clock;
  assign ifpu_reset = reset;
  assign ifpu_io_req_valid = io_req_valid & _T_32; // @[execution-unit.scala 355:40]
  assign ifpu_io_req_bits_uop_switch = io_req_bits_uop_switch; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_switch_off = io_req_bits_uop_switch_off; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_is_unicore = io_req_bits_uop_is_unicore; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_shift = io_req_bits_uop_shift; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_lrs3_rtype = io_req_bits_uop_lrs3_rtype; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_rflag = io_req_bits_uop_rflag; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_wflag = io_req_bits_uop_wflag; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_prflag = io_req_bits_uop_prflag; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_pwflag = io_req_bits_uop_pwflag; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_pflag_busy = io_req_bits_uop_pflag_busy; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_stale_pflag = io_req_bits_uop_stale_pflag; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_op1_sel = io_req_bits_uop_op1_sel; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_op2_sel = io_req_bits_uop_op2_sel; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_split_num = io_req_bits_uop_split_num; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_self_index = io_req_bits_uop_self_index; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_rob_inst_idx = io_req_bits_uop_rob_inst_idx; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_address_num = io_req_bits_uop_address_num; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_uopc = io_req_bits_uop_uopc; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_inst = io_req_bits_uop_inst; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_debug_inst = io_req_bits_uop_debug_inst; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_is_rvc = io_req_bits_uop_is_rvc; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_debug_pc = io_req_bits_uop_debug_pc; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_iq_type = io_req_bits_uop_iq_type; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_fu_code = io_req_bits_uop_fu_code; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ctrl_op3_sel = io_req_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_iw_state = io_req_bits_uop_iw_state; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_is_br = io_req_bits_uop_is_br; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_is_jalr = io_req_bits_uop_is_jalr; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_is_jal = io_req_bits_uop_is_jal; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_is_sfb = io_req_bits_uop_is_sfb; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_br_mask = io_req_bits_uop_br_mask; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_br_tag = io_req_bits_uop_br_tag; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_edge_inst = io_req_bits_uop_edge_inst; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_pc_lob = io_req_bits_uop_pc_lob; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_taken = io_req_bits_uop_taken; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_imm_packed = io_req_bits_uop_imm_packed; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_csr_addr = io_req_bits_uop_csr_addr; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_rob_idx = io_req_bits_uop_rob_idx; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_stq_idx = io_req_bits_uop_stq_idx; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_pdst = io_req_bits_uop_pdst; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_prs1 = io_req_bits_uop_prs1; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_prs2 = io_req_bits_uop_prs2; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_prs3 = io_req_bits_uop_prs3; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ppred = io_req_bits_uop_ppred; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_exception = io_req_bits_uop_exception; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_exc_cause = io_req_bits_uop_exc_cause; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_bypassable = io_req_bits_uop_bypassable; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_mem_size = io_req_bits_uop_mem_size; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_mem_signed = io_req_bits_uop_mem_signed; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_is_fence = io_req_bits_uop_is_fence; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_is_fencei = io_req_bits_uop_is_fencei; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_is_amo = io_req_bits_uop_is_amo; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_uses_stq = io_req_bits_uop_uses_stq; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_is_unique = io_req_bits_uop_is_unique; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ldst = io_req_bits_uop_ldst; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_lrs1 = io_req_bits_uop_lrs1; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_lrs2 = io_req_bits_uop_lrs2; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_lrs3 = io_req_bits_uop_lrs3; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_ldst_val = io_req_bits_uop_ldst_val; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_frs3_en = io_req_bits_uop_frs3_en; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_fp_val = io_req_bits_uop_fp_val; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_fp_single = io_req_bits_uop_fp_single; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_rs1_data = io_req_bits_rs1_data; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_rs2_data = io_req_bits_rs2_data; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_rs3_data = io_req_bits_rs3_data; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_pred_data = io_req_bits_pred_data; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_flagdata = io_req_bits_flagdata; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_fflagdata = io_req_bits_fflagdata; // @[execution-unit.scala 354:24]
  assign ifpu_io_req_bits_kill = io_req_bits_kill; // @[execution-unit.scala 354:24]
  assign ifpu_io_resp_ready = 1'h0;
  assign ifpu_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_switch = io_brupdate_b2_uop_switch; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_switch_off = io_brupdate_b2_uop_switch_off; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_is_unicore = io_brupdate_b2_uop_is_unicore; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_shift = io_brupdate_b2_uop_shift; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_lrs3_rtype = io_brupdate_b2_uop_lrs3_rtype; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_rflag = io_brupdate_b2_uop_rflag; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_wflag = io_brupdate_b2_uop_wflag; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_prflag = io_brupdate_b2_uop_prflag; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_pwflag = io_brupdate_b2_uop_pwflag; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_pflag_busy = io_brupdate_b2_uop_pflag_busy; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_stale_pflag = io_brupdate_b2_uop_stale_pflag; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_op1_sel = io_brupdate_b2_uop_op1_sel; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_op2_sel = io_brupdate_b2_uop_op2_sel; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_split_num = io_brupdate_b2_uop_split_num; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_self_index = io_brupdate_b2_uop_self_index; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_rob_inst_idx = io_brupdate_b2_uop_rob_inst_idx; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_address_num = io_brupdate_b2_uop_address_num; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ctrl_op3_sel = io_brupdate_b2_uop_ctrl_op3_sel; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[execution-unit.scala 357:24]
  assign ifpu_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[execution-unit.scala 357:24]
  assign ifpu_io_fcsr_rm = io_fcsr_rm; // @[execution-unit.scala 356:24]
  assign BranchKillableQueue_clock = clock;
  assign BranchKillableQueue_reset = reset;
  assign BranchKillableQueue_io_enq_valid = ifpu_io_resp_valid; // @[execution-unit.scala 363:30]
  assign BranchKillableQueue_io_enq_bits_uop_switch = ifpu_io_resp_bits_uop_switch; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_switch_off = ifpu_io_resp_bits_uop_switch_off; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_unicore = ifpu_io_resp_bits_uop_is_unicore; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_shift = ifpu_io_resp_bits_uop_shift; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_lrs3_rtype = ifpu_io_resp_bits_uop_lrs3_rtype; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_rflag = ifpu_io_resp_bits_uop_rflag; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_wflag = ifpu_io_resp_bits_uop_wflag; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_prflag = ifpu_io_resp_bits_uop_prflag; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_pwflag = ifpu_io_resp_bits_uop_pwflag; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_pflag_busy = ifpu_io_resp_bits_uop_pflag_busy; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_stale_pflag = ifpu_io_resp_bits_uop_stale_pflag; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_op1_sel = ifpu_io_resp_bits_uop_op1_sel; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_op2_sel = ifpu_io_resp_bits_uop_op2_sel; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_split_num = ifpu_io_resp_bits_uop_split_num; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_self_index = ifpu_io_resp_bits_uop_self_index; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_rob_inst_idx = ifpu_io_resp_bits_uop_rob_inst_idx; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_address_num = ifpu_io_resp_bits_uop_address_num; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_uopc = ifpu_io_resp_bits_uop_uopc; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_inst = ifpu_io_resp_bits_uop_inst; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_debug_inst = ifpu_io_resp_bits_uop_debug_inst; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_rvc = ifpu_io_resp_bits_uop_is_rvc; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_debug_pc = ifpu_io_resp_bits_uop_debug_pc; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_iq_type = ifpu_io_resp_bits_uop_iq_type; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_fu_code = ifpu_io_resp_bits_uop_fu_code; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_br_type = ifpu_io_resp_bits_uop_ctrl_br_type; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_op1_sel = ifpu_io_resp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_op2_sel = ifpu_io_resp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_imm_sel = ifpu_io_resp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_op_fcn = ifpu_io_resp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_fcn_dw = ifpu_io_resp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_csr_cmd = ifpu_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_is_load = ifpu_io_resp_bits_uop_ctrl_is_load; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_is_sta = ifpu_io_resp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_is_std = ifpu_io_resp_bits_uop_ctrl_is_std; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_op3_sel = ifpu_io_resp_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_iw_state = ifpu_io_resp_bits_uop_iw_state; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_iw_p1_poisoned = ifpu_io_resp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_iw_p2_poisoned = ifpu_io_resp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_br = ifpu_io_resp_bits_uop_is_br; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_jalr = ifpu_io_resp_bits_uop_is_jalr; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_jal = ifpu_io_resp_bits_uop_is_jal; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_sfb = ifpu_io_resp_bits_uop_is_sfb; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_br_mask = ifpu_io_resp_bits_uop_br_mask; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_br_tag = ifpu_io_resp_bits_uop_br_tag; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ftq_idx = ifpu_io_resp_bits_uop_ftq_idx; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_edge_inst = ifpu_io_resp_bits_uop_edge_inst; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_pc_lob = ifpu_io_resp_bits_uop_pc_lob; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_taken = ifpu_io_resp_bits_uop_taken; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_imm_packed = ifpu_io_resp_bits_uop_imm_packed; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_csr_addr = ifpu_io_resp_bits_uop_csr_addr; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_rob_idx = ifpu_io_resp_bits_uop_rob_idx; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ldq_idx = ifpu_io_resp_bits_uop_ldq_idx; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_stq_idx = ifpu_io_resp_bits_uop_stq_idx; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_rxq_idx = ifpu_io_resp_bits_uop_rxq_idx; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_pdst = ifpu_io_resp_bits_uop_pdst; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs1 = ifpu_io_resp_bits_uop_prs1; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs2 = ifpu_io_resp_bits_uop_prs2; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs3 = ifpu_io_resp_bits_uop_prs3; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ppred = ifpu_io_resp_bits_uop_ppred; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs1_busy = ifpu_io_resp_bits_uop_prs1_busy; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs2_busy = ifpu_io_resp_bits_uop_prs2_busy; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs3_busy = ifpu_io_resp_bits_uop_prs3_busy; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ppred_busy = ifpu_io_resp_bits_uop_ppred_busy; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_stale_pdst = ifpu_io_resp_bits_uop_stale_pdst; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_exception = ifpu_io_resp_bits_uop_exception; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_exc_cause = ifpu_io_resp_bits_uop_exc_cause; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_bypassable = ifpu_io_resp_bits_uop_bypassable; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_mem_cmd = ifpu_io_resp_bits_uop_mem_cmd; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_mem_size = ifpu_io_resp_bits_uop_mem_size; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_mem_signed = ifpu_io_resp_bits_uop_mem_signed; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_fence = ifpu_io_resp_bits_uop_is_fence; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_fencei = ifpu_io_resp_bits_uop_is_fencei; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_amo = ifpu_io_resp_bits_uop_is_amo; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_uses_ldq = ifpu_io_resp_bits_uop_uses_ldq; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_uses_stq = ifpu_io_resp_bits_uop_uses_stq; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_sys_pc2epc = ifpu_io_resp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_unique = ifpu_io_resp_bits_uop_is_unique; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_flush_on_commit = ifpu_io_resp_bits_uop_flush_on_commit; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ldst_is_rs1 = ifpu_io_resp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ldst = ifpu_io_resp_bits_uop_ldst; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_lrs1 = ifpu_io_resp_bits_uop_lrs1; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_lrs2 = ifpu_io_resp_bits_uop_lrs2; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_lrs3 = ifpu_io_resp_bits_uop_lrs3; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_ldst_val = ifpu_io_resp_bits_uop_ldst_val; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_dst_rtype = ifpu_io_resp_bits_uop_dst_rtype; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_lrs1_rtype = ifpu_io_resp_bits_uop_lrs1_rtype; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_lrs2_rtype = ifpu_io_resp_bits_uop_lrs2_rtype; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_frs3_en = ifpu_io_resp_bits_uop_frs3_en; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_fp_val = ifpu_io_resp_bits_uop_fp_val; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_fp_single = ifpu_io_resp_bits_uop_fp_single; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_xcpt_pf_if = ifpu_io_resp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_xcpt_ae_if = ifpu_io_resp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_xcpt_ma_if = ifpu_io_resp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_bp_debug_if = ifpu_io_resp_bits_uop_bp_debug_if; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_bp_xcpt_if = ifpu_io_resp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_debug_fsrc = ifpu_io_resp_bits_uop_debug_fsrc; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_uop_debug_tsrc = ifpu_io_resp_bits_uop_debug_tsrc; // @[execution-unit.scala 364:30]
  assign BranchKillableQueue_io_enq_bits_data = ifpu_io_resp_bits_data; // @[execution-unit.scala 365:30]
  assign BranchKillableQueue_io_enq_bits_predicated = ifpu_io_resp_bits_predicated; // @[execution-unit.scala 366:34]
  assign BranchKillableQueue_io_enq_bits_fflags_valid = ifpu_io_resp_bits_fflags_valid; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_switch = ifpu_io_resp_bits_fflags_bits_uop_switch; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_switch_off = ifpu_io_resp_bits_fflags_bits_uop_switch_off; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_unicore = ifpu_io_resp_bits_fflags_bits_uop_is_unicore; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_shift = ifpu_io_resp_bits_fflags_bits_uop_shift; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs3_rtype = ifpu_io_resp_bits_fflags_bits_uop_lrs3_rtype; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_rflag = ifpu_io_resp_bits_fflags_bits_uop_rflag; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_wflag = ifpu_io_resp_bits_fflags_bits_uop_wflag; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prflag = ifpu_io_resp_bits_fflags_bits_uop_prflag; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_pwflag = ifpu_io_resp_bits_fflags_bits_uop_pwflag; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_pflag_busy = ifpu_io_resp_bits_fflags_bits_uop_pflag_busy; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_stale_pflag = ifpu_io_resp_bits_fflags_bits_uop_stale_pflag; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_op1_sel = ifpu_io_resp_bits_fflags_bits_uop_op1_sel; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_op2_sel = ifpu_io_resp_bits_fflags_bits_uop_op2_sel; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_split_num = ifpu_io_resp_bits_fflags_bits_uop_split_num; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_self_index = ifpu_io_resp_bits_fflags_bits_uop_self_index; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_rob_inst_idx = ifpu_io_resp_bits_fflags_bits_uop_rob_inst_idx; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_address_num = ifpu_io_resp_bits_fflags_bits_uop_address_num; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_uopc = ifpu_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_inst = ifpu_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_inst = ifpu_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_rvc = ifpu_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_pc = ifpu_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_iq_type = ifpu_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_fu_code = ifpu_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_br_type = ifpu_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op1_sel = ifpu_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op2_sel = ifpu_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_imm_sel = ifpu_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op_fcn = ifpu_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_fcn_dw = ifpu_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_csr_cmd = ifpu_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_load = ifpu_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_sta = ifpu_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_std = ifpu_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op3_sel = ifpu_io_resp_bits_fflags_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_state = ifpu_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p1_poisoned =
    ifpu_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p2_poisoned =
    ifpu_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_br = ifpu_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jalr = ifpu_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jal = ifpu_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sfb = ifpu_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_mask = ifpu_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_tag = ifpu_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ftq_idx = ifpu_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_edge_inst = ifpu_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_pc_lob = ifpu_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_taken = ifpu_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_imm_packed = ifpu_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_csr_addr = ifpu_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_rob_idx = ifpu_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldq_idx = ifpu_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_stq_idx = ifpu_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_rxq_idx = ifpu_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_pdst = ifpu_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1 = ifpu_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2 = ifpu_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3 = ifpu_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred = ifpu_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1_busy = ifpu_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2_busy = ifpu_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3_busy = ifpu_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred_busy = ifpu_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_stale_pdst = ifpu_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_exception = ifpu_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_exc_cause = ifpu_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_bypassable = ifpu_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_cmd = ifpu_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_size = ifpu_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_signed = ifpu_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fence = ifpu_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fencei = ifpu_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_amo = ifpu_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_ldq = ifpu_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_stq = ifpu_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sys_pc2epc = ifpu_io_resp_bits_fflags_bits_uop_is_sys_pc2epc
    ; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_unique = ifpu_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_flush_on_commit =
    ifpu_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_is_rs1 = ifpu_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst = ifpu_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1 = ifpu_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2 = ifpu_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs3 = ifpu_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_val = ifpu_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_dst_rtype = ifpu_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1_rtype = ifpu_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2_rtype = ifpu_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_frs3_en = ifpu_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_val = ifpu_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_single = ifpu_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_pf_if = ifpu_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ae_if = ifpu_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ma_if = ifpu_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_debug_if = ifpu_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_xcpt_if = ifpu_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_fsrc = ifpu_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_tsrc = ifpu_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_flags = ifpu_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 367:30]
  assign BranchKillableQueue_io_enq_bits_flagdata = 4'h0; // @[execution-unit.scala 372:32]
  assign BranchKillableQueue_io_enq_bits_fflagdata_valid = ifpu_io_resp_bits_fflagdata_valid; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_switch = ifpu_io_resp_bits_fflagdata_bits_uop_switch; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_switch_off = ifpu_io_resp_bits_fflagdata_bits_uop_switch_off
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_unicore = ifpu_io_resp_bits_fflagdata_bits_uop_is_unicore
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_shift = ifpu_io_resp_bits_fflagdata_bits_uop_shift; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs3_rtype = ifpu_io_resp_bits_fflagdata_bits_uop_lrs3_rtype
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rflag = ifpu_io_resp_bits_fflagdata_bits_uop_rflag; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_wflag = ifpu_io_resp_bits_fflagdata_bits_uop_wflag; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prflag = ifpu_io_resp_bits_fflagdata_bits_uop_prflag; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pwflag = ifpu_io_resp_bits_fflagdata_bits_uop_pwflag; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pflag_busy = ifpu_io_resp_bits_fflagdata_bits_uop_pflag_busy
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_stale_pflag =
    ifpu_io_resp_bits_fflagdata_bits_uop_stale_pflag; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_op1_sel = ifpu_io_resp_bits_fflagdata_bits_uop_op1_sel; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_op2_sel = ifpu_io_resp_bits_fflagdata_bits_uop_op2_sel; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_split_num = ifpu_io_resp_bits_fflagdata_bits_uop_split_num; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_self_index = ifpu_io_resp_bits_fflagdata_bits_uop_self_index
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rob_inst_idx =
    ifpu_io_resp_bits_fflagdata_bits_uop_rob_inst_idx; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_address_num =
    ifpu_io_resp_bits_fflagdata_bits_uop_address_num; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_uopc = ifpu_io_resp_bits_fflagdata_bits_uop_uopc; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_inst = ifpu_io_resp_bits_fflagdata_bits_uop_inst; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_inst = ifpu_io_resp_bits_fflagdata_bits_uop_debug_inst
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_rvc = ifpu_io_resp_bits_fflagdata_bits_uop_is_rvc; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_pc = ifpu_io_resp_bits_fflagdata_bits_uop_debug_pc; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iq_type = ifpu_io_resp_bits_fflagdata_bits_uop_iq_type; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_fu_code = ifpu_io_resp_bits_fflagdata_bits_uop_fu_code; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_br_type =
    ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_br_type; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op1_sel =
    ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op2_sel =
    ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_imm_sel =
    ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op_fcn =
    ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_fcn_dw =
    ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_csr_cmd =
    ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_is_load =
    ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_is_load; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_is_sta =
    ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_is_sta; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_is_std =
    ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_is_std; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ctrl_op3_sel =
    ifpu_io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iw_state = ifpu_io_resp_bits_fflagdata_bits_uop_iw_state; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iw_p1_poisoned =
    ifpu_io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_iw_p2_poisoned =
    ifpu_io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_br = ifpu_io_resp_bits_fflagdata_bits_uop_is_br; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_jalr = ifpu_io_resp_bits_fflagdata_bits_uop_is_jalr; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_jal = ifpu_io_resp_bits_fflagdata_bits_uop_is_jal; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_sfb = ifpu_io_resp_bits_fflagdata_bits_uop_is_sfb; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_br_mask = ifpu_io_resp_bits_fflagdata_bits_uop_br_mask; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_br_tag = ifpu_io_resp_bits_fflagdata_bits_uop_br_tag; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ftq_idx = ifpu_io_resp_bits_fflagdata_bits_uop_ftq_idx; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_edge_inst = ifpu_io_resp_bits_fflagdata_bits_uop_edge_inst; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pc_lob = ifpu_io_resp_bits_fflagdata_bits_uop_pc_lob; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_taken = ifpu_io_resp_bits_fflagdata_bits_uop_taken; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_imm_packed = ifpu_io_resp_bits_fflagdata_bits_uop_imm_packed
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_csr_addr = ifpu_io_resp_bits_fflagdata_bits_uop_csr_addr; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rob_idx = ifpu_io_resp_bits_fflagdata_bits_uop_rob_idx; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldq_idx = ifpu_io_resp_bits_fflagdata_bits_uop_ldq_idx; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_stq_idx = ifpu_io_resp_bits_fflagdata_bits_uop_stq_idx; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_rxq_idx = ifpu_io_resp_bits_fflagdata_bits_uop_rxq_idx; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_pdst = ifpu_io_resp_bits_fflagdata_bits_uop_pdst; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs1 = ifpu_io_resp_bits_fflagdata_bits_uop_prs1; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs2 = ifpu_io_resp_bits_fflagdata_bits_uop_prs2; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs3 = ifpu_io_resp_bits_fflagdata_bits_uop_prs3; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ppred = ifpu_io_resp_bits_fflagdata_bits_uop_ppred; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs1_busy = ifpu_io_resp_bits_fflagdata_bits_uop_prs1_busy; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs2_busy = ifpu_io_resp_bits_fflagdata_bits_uop_prs2_busy; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_prs3_busy = ifpu_io_resp_bits_fflagdata_bits_uop_prs3_busy; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ppred_busy = ifpu_io_resp_bits_fflagdata_bits_uop_ppred_busy
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_stale_pdst = ifpu_io_resp_bits_fflagdata_bits_uop_stale_pdst
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_exception = ifpu_io_resp_bits_fflagdata_bits_uop_exception; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_exc_cause = ifpu_io_resp_bits_fflagdata_bits_uop_exc_cause; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_bypassable = ifpu_io_resp_bits_fflagdata_bits_uop_bypassable
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_mem_cmd = ifpu_io_resp_bits_fflagdata_bits_uop_mem_cmd; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_mem_size = ifpu_io_resp_bits_fflagdata_bits_uop_mem_size; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_mem_signed = ifpu_io_resp_bits_fflagdata_bits_uop_mem_signed
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_fence = ifpu_io_resp_bits_fflagdata_bits_uop_is_fence; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_fencei = ifpu_io_resp_bits_fflagdata_bits_uop_is_fencei; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_amo = ifpu_io_resp_bits_fflagdata_bits_uop_is_amo; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_uses_ldq = ifpu_io_resp_bits_fflagdata_bits_uop_uses_ldq; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_uses_stq = ifpu_io_resp_bits_fflagdata_bits_uop_uses_stq; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_sys_pc2epc =
    ifpu_io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_is_unique = ifpu_io_resp_bits_fflagdata_bits_uop_is_unique; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_flush_on_commit =
    ifpu_io_resp_bits_fflagdata_bits_uop_flush_on_commit; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldst_is_rs1 =
    ifpu_io_resp_bits_fflagdata_bits_uop_ldst_is_rs1; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldst = ifpu_io_resp_bits_fflagdata_bits_uop_ldst; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs1 = ifpu_io_resp_bits_fflagdata_bits_uop_lrs1; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs2 = ifpu_io_resp_bits_fflagdata_bits_uop_lrs2; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs3 = ifpu_io_resp_bits_fflagdata_bits_uop_lrs3; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_ldst_val = ifpu_io_resp_bits_fflagdata_bits_uop_ldst_val; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_dst_rtype = ifpu_io_resp_bits_fflagdata_bits_uop_dst_rtype; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs1_rtype = ifpu_io_resp_bits_fflagdata_bits_uop_lrs1_rtype
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_lrs2_rtype = ifpu_io_resp_bits_fflagdata_bits_uop_lrs2_rtype
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_frs3_en = ifpu_io_resp_bits_fflagdata_bits_uop_frs3_en; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_fp_val = ifpu_io_resp_bits_fflagdata_bits_uop_fp_val; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_fp_single = ifpu_io_resp_bits_fflagdata_bits_uop_fp_single; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_xcpt_pf_if = ifpu_io_resp_bits_fflagdata_bits_uop_xcpt_pf_if
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_xcpt_ae_if = ifpu_io_resp_bits_fflagdata_bits_uop_xcpt_ae_if
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_xcpt_ma_if = ifpu_io_resp_bits_fflagdata_bits_uop_xcpt_ma_if
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_bp_debug_if =
    ifpu_io_resp_bits_fflagdata_bits_uop_bp_debug_if; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_bp_xcpt_if = ifpu_io_resp_bits_fflagdata_bits_uop_bp_xcpt_if
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_fsrc = ifpu_io_resp_bits_fflagdata_bits_uop_debug_fsrc
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_uop_debug_tsrc = ifpu_io_resp_bits_fflagdata_bits_uop_debug_tsrc
    ; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_enq_bits_fflagdata_bits_fflag = ifpu_io_resp_bits_fflagdata_bits_fflag; // @[execution-unit.scala 373:33]
  assign BranchKillableQueue_io_deq_ready = io_ll_fresp_ready; // @[execution-unit.scala 375:17]
  assign BranchKillableQueue_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_switch = io_brupdate_b2_uop_switch; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_switch_off = io_brupdate_b2_uop_switch_off; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_unicore = io_brupdate_b2_uop_is_unicore; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_shift = io_brupdate_b2_uop_shift; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_lrs3_rtype = io_brupdate_b2_uop_lrs3_rtype; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_rflag = io_brupdate_b2_uop_rflag; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_wflag = io_brupdate_b2_uop_wflag; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_prflag = io_brupdate_b2_uop_prflag; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_pwflag = io_brupdate_b2_uop_pwflag; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_pflag_busy = io_brupdate_b2_uop_pflag_busy; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_stale_pflag = io_brupdate_b2_uop_stale_pflag; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_op1_sel = io_brupdate_b2_uop_op1_sel; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_op2_sel = io_brupdate_b2_uop_op2_sel; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_split_num = io_brupdate_b2_uop_split_num; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_self_index = io_brupdate_b2_uop_self_index; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_rob_inst_idx = io_brupdate_b2_uop_rob_inst_idx; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_address_num = io_brupdate_b2_uop_address_num; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_op3_sel = io_brupdate_b2_uop_ctrl_op3_sel; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[execution-unit.scala 369:23]
  assign BranchKillableQueue_io_flush = io_req_bits_kill; // @[execution-unit.scala 370:20]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(io_iresp_ready | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at execution-unit.scala:155 assert(io.iresp.ready)\n"); // @[execution-unit.scala 155:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(io_iresp_ready | reset)) begin
          $fatal; // @[execution-unit.scala 155:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(BranchKillableQueue_io_enq_ready | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at execution-unit.scala:377 assert (queue.io.enq.ready)\n"); // @[execution-unit.scala 377:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(BranchKillableQueue_io_enq_ready | reset)) begin
          $fatal; // @[execution-unit.scala 377:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_81 <= 2'h1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Multiple functional units are fighting over the write port.\n    at execution-unit.scala:456 assert ((PopCount(iresp_fu_units.map(_.io.resp.valid)) <= 1.U && !div_resp_val) ||\n"
            ); // @[execution-unit.scala 456:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_81 <= 2'h1 | reset)) begin
          $fatal; // @[execution-unit.scala 456:10]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
