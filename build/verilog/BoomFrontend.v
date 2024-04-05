module BoomFrontend(
  input         clock,
  input         reset,
  input         auto_icache_master_out_a_ready,
  output        auto_icache_master_out_a_valid,
  output [2:0]  auto_icache_master_out_a_bits_opcode,
  output [2:0]  auto_icache_master_out_a_bits_param,
  output [3:0]  auto_icache_master_out_a_bits_size,
  output        auto_icache_master_out_a_bits_source,
  output [31:0] auto_icache_master_out_a_bits_address,
  output [7:0]  auto_icache_master_out_a_bits_mask,
  output [63:0] auto_icache_master_out_a_bits_data,
  output        auto_icache_master_out_a_bits_corrupt,
  output        auto_icache_master_out_d_ready,
  input         auto_icache_master_out_d_valid,
  input  [2:0]  auto_icache_master_out_d_bits_opcode,
  input  [1:0]  auto_icache_master_out_d_bits_param,
  input  [3:0]  auto_icache_master_out_d_bits_size,
  input         auto_icache_master_out_d_bits_source,
  input  [1:0]  auto_icache_master_out_d_bits_sink,
  input         auto_icache_master_out_d_bits_denied,
  input  [63:0] auto_icache_master_out_d_bits_data,
  input         auto_icache_master_out_d_bits_corrupt,
  input  [31:0] auto_reset_vector_sink_in,
  input         io_cpu_fetchpacket_ready,
  output        io_cpu_fetchpacket_valid,
  output        io_cpu_fetchpacket_bits_uops_0_valid,
  output [6:0]  io_cpu_fetchpacket_bits_uops_0_bits_uopc,
  output [31:0] io_cpu_fetchpacket_bits_uops_0_bits_inst,
  output [31:0] io_cpu_fetchpacket_bits_uops_0_bits_debug_inst,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_rvc,
  output [39:0] io_cpu_fetchpacket_bits_uops_0_bits_debug_pc,
  output [2:0]  io_cpu_fetchpacket_bits_uops_0_bits_iq_type,
  output [9:0]  io_cpu_fetchpacket_bits_uops_0_bits_fu_code,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_br_type,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op1_sel,
  output [2:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op2_sel,
  output [2:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_imm_sel,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op_fcn,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ctrl_fcn_dw,
  output [2:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_csr_cmd,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_load,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_sta,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_std,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_iw_state,
  output        io_cpu_fetchpacket_bits_uops_0_bits_iw_p1_poisoned,
  output        io_cpu_fetchpacket_bits_uops_0_bits_iw_p2_poisoned,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_br,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_jalr,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_jal,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_sfb,
  output [11:0] io_cpu_fetchpacket_bits_uops_0_bits_br_mask,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_br_tag,
  output [4:0]  io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx,
  output        io_cpu_fetchpacket_bits_uops_0_bits_edge_inst,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_pc_lob,
  output        io_cpu_fetchpacket_bits_uops_0_bits_taken,
  output [19:0] io_cpu_fetchpacket_bits_uops_0_bits_imm_packed,
  output [11:0] io_cpu_fetchpacket_bits_uops_0_bits_csr_addr,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_rob_idx,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_ldq_idx,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_stq_idx,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_rxq_idx,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_pdst,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_prs1,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_prs2,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_prs3,
  output [4:0]  io_cpu_fetchpacket_bits_uops_0_bits_ppred,
  output        io_cpu_fetchpacket_bits_uops_0_bits_prs1_busy,
  output        io_cpu_fetchpacket_bits_uops_0_bits_prs2_busy,
  output        io_cpu_fetchpacket_bits_uops_0_bits_prs3_busy,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ppred_busy,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_stale_pdst,
  output        io_cpu_fetchpacket_bits_uops_0_bits_exception,
  output [63:0] io_cpu_fetchpacket_bits_uops_0_bits_exc_cause,
  output        io_cpu_fetchpacket_bits_uops_0_bits_bypassable,
  output [4:0]  io_cpu_fetchpacket_bits_uops_0_bits_mem_cmd,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_mem_size,
  output        io_cpu_fetchpacket_bits_uops_0_bits_mem_signed,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_fence,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_fencei,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_amo,
  output        io_cpu_fetchpacket_bits_uops_0_bits_uses_ldq,
  output        io_cpu_fetchpacket_bits_uops_0_bits_uses_stq,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_sys_pc2epc,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_unique,
  output        io_cpu_fetchpacket_bits_uops_0_bits_flush_on_commit,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ldst_is_rs1,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_ldst,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_lrs1,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_lrs2,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_lrs3,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ldst_val,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_dst_rtype,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_lrs1_rtype,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_lrs2_rtype,
  output        io_cpu_fetchpacket_bits_uops_0_bits_frs3_en,
  output        io_cpu_fetchpacket_bits_uops_0_bits_fp_val,
  output        io_cpu_fetchpacket_bits_uops_0_bits_fp_single,
  output        io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if,
  output        io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if,
  output        io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ma_if,
  output        io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if,
  output        io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_debug_tsrc,
  output        io_cpu_fetchpacket_bits_uops_1_valid,
  output [6:0]  io_cpu_fetchpacket_bits_uops_1_bits_uopc,
  output [31:0] io_cpu_fetchpacket_bits_uops_1_bits_inst,
  output [31:0] io_cpu_fetchpacket_bits_uops_1_bits_debug_inst,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_rvc,
  output [39:0] io_cpu_fetchpacket_bits_uops_1_bits_debug_pc,
  output [2:0]  io_cpu_fetchpacket_bits_uops_1_bits_iq_type,
  output [9:0]  io_cpu_fetchpacket_bits_uops_1_bits_fu_code,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_br_type,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op1_sel,
  output [2:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op2_sel,
  output [2:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_imm_sel,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op_fcn,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ctrl_fcn_dw,
  output [2:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_csr_cmd,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_load,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_sta,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_std,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_iw_state,
  output        io_cpu_fetchpacket_bits_uops_1_bits_iw_p1_poisoned,
  output        io_cpu_fetchpacket_bits_uops_1_bits_iw_p2_poisoned,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_br,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_jalr,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_jal,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_sfb,
  output [11:0] io_cpu_fetchpacket_bits_uops_1_bits_br_mask,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_br_tag,
  output [4:0]  io_cpu_fetchpacket_bits_uops_1_bits_ftq_idx,
  output        io_cpu_fetchpacket_bits_uops_1_bits_edge_inst,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_pc_lob,
  output        io_cpu_fetchpacket_bits_uops_1_bits_taken,
  output [19:0] io_cpu_fetchpacket_bits_uops_1_bits_imm_packed,
  output [11:0] io_cpu_fetchpacket_bits_uops_1_bits_csr_addr,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_rob_idx,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_ldq_idx,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_stq_idx,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_rxq_idx,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_pdst,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_prs1,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_prs2,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_prs3,
  output [4:0]  io_cpu_fetchpacket_bits_uops_1_bits_ppred,
  output        io_cpu_fetchpacket_bits_uops_1_bits_prs1_busy,
  output        io_cpu_fetchpacket_bits_uops_1_bits_prs2_busy,
  output        io_cpu_fetchpacket_bits_uops_1_bits_prs3_busy,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ppred_busy,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_stale_pdst,
  output        io_cpu_fetchpacket_bits_uops_1_bits_exception,
  output [63:0] io_cpu_fetchpacket_bits_uops_1_bits_exc_cause,
  output        io_cpu_fetchpacket_bits_uops_1_bits_bypassable,
  output [4:0]  io_cpu_fetchpacket_bits_uops_1_bits_mem_cmd,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_mem_size,
  output        io_cpu_fetchpacket_bits_uops_1_bits_mem_signed,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_fence,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_fencei,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_amo,
  output        io_cpu_fetchpacket_bits_uops_1_bits_uses_ldq,
  output        io_cpu_fetchpacket_bits_uops_1_bits_uses_stq,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_sys_pc2epc,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_unique,
  output        io_cpu_fetchpacket_bits_uops_1_bits_flush_on_commit,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ldst_is_rs1,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_ldst,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_lrs1,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_lrs2,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_lrs3,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ldst_val,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_dst_rtype,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_lrs1_rtype,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_lrs2_rtype,
  output        io_cpu_fetchpacket_bits_uops_1_bits_frs3_en,
  output        io_cpu_fetchpacket_bits_uops_1_bits_fp_val,
  output        io_cpu_fetchpacket_bits_uops_1_bits_fp_single,
  output        io_cpu_fetchpacket_bits_uops_1_bits_xcpt_pf_if,
  output        io_cpu_fetchpacket_bits_uops_1_bits_xcpt_ae_if,
  output        io_cpu_fetchpacket_bits_uops_1_bits_xcpt_ma_if,
  output        io_cpu_fetchpacket_bits_uops_1_bits_bp_debug_if,
  output        io_cpu_fetchpacket_bits_uops_1_bits_bp_xcpt_if,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_debug_fsrc,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_debug_tsrc,
  input  [4:0]  io_cpu_get_pc_0_ftq_idx,
  output        io_cpu_get_pc_0_entry_cfi_idx_valid,
  output [1:0]  io_cpu_get_pc_0_entry_cfi_idx_bits,
  output        io_cpu_get_pc_0_entry_cfi_taken,
  output        io_cpu_get_pc_0_entry_cfi_mispredicted,
  output [2:0]  io_cpu_get_pc_0_entry_cfi_type,
  output [3:0]  io_cpu_get_pc_0_entry_br_mask,
  output        io_cpu_get_pc_0_entry_cfi_is_call,
  output        io_cpu_get_pc_0_entry_cfi_is_ret,
  output        io_cpu_get_pc_0_entry_cfi_npc_plus4,
  output [39:0] io_cpu_get_pc_0_entry_ras_top,
  output [4:0]  io_cpu_get_pc_0_entry_ras_idx,
  output        io_cpu_get_pc_0_entry_start_bank,
  output [63:0] io_cpu_get_pc_0_ghist_old_history,
  output        io_cpu_get_pc_0_ghist_current_saw_branch_not_taken,
  output        io_cpu_get_pc_0_ghist_new_saw_branch_not_taken,
  output        io_cpu_get_pc_0_ghist_new_saw_branch_taken,
  output [4:0]  io_cpu_get_pc_0_ghist_ras_idx,
  output [39:0] io_cpu_get_pc_0_pc,
  output [39:0] io_cpu_get_pc_0_com_pc,
  output        io_cpu_get_pc_0_next_val,
  output [39:0] io_cpu_get_pc_0_next_pc,
  input  [4:0]  io_cpu_get_pc_1_ftq_idx,
  output        io_cpu_get_pc_1_entry_cfi_idx_valid,
  output [1:0]  io_cpu_get_pc_1_entry_cfi_idx_bits,
  output        io_cpu_get_pc_1_entry_cfi_taken,
  output        io_cpu_get_pc_1_entry_cfi_mispredicted,
  output [2:0]  io_cpu_get_pc_1_entry_cfi_type,
  output [3:0]  io_cpu_get_pc_1_entry_br_mask,
  output        io_cpu_get_pc_1_entry_cfi_is_call,
  output        io_cpu_get_pc_1_entry_cfi_is_ret,
  output        io_cpu_get_pc_1_entry_cfi_npc_plus4,
  output [39:0] io_cpu_get_pc_1_entry_ras_top,
  output [4:0]  io_cpu_get_pc_1_entry_ras_idx,
  output        io_cpu_get_pc_1_entry_start_bank,
  output [63:0] io_cpu_get_pc_1_ghist_old_history,
  output        io_cpu_get_pc_1_ghist_current_saw_branch_not_taken,
  output        io_cpu_get_pc_1_ghist_new_saw_branch_not_taken,
  output        io_cpu_get_pc_1_ghist_new_saw_branch_taken,
  output [4:0]  io_cpu_get_pc_1_ghist_ras_idx,
  output [39:0] io_cpu_get_pc_1_pc,
  output [39:0] io_cpu_get_pc_1_com_pc,
  output        io_cpu_get_pc_1_next_val,
  output [39:0] io_cpu_get_pc_1_next_pc,
  input  [4:0]  io_cpu_debug_ftq_idx_0,
  input  [4:0]  io_cpu_debug_ftq_idx_1,
  output [39:0] io_cpu_debug_fetch_pc_0,
  output [39:0] io_cpu_debug_fetch_pc_1,
  input         io_cpu_status_debug,
  input         io_cpu_status_cease,
  input         io_cpu_status_wfi,
  input  [31:0] io_cpu_status_isa,
  input  [1:0]  io_cpu_status_dprv,
  input  [1:0]  io_cpu_status_prv,
  input         io_cpu_status_sd,
  input  [26:0] io_cpu_status_zero2,
  input  [1:0]  io_cpu_status_sxl,
  input  [1:0]  io_cpu_status_uxl,
  input         io_cpu_status_sd_rv32,
  input  [7:0]  io_cpu_status_zero1,
  input         io_cpu_status_tsr,
  input         io_cpu_status_tw,
  input         io_cpu_status_tvm,
  input         io_cpu_status_mxr,
  input         io_cpu_status_sum,
  input         io_cpu_status_mprv,
  input  [1:0]  io_cpu_status_xs,
  input  [1:0]  io_cpu_status_fs,
  input  [1:0]  io_cpu_status_mpp,
  input  [1:0]  io_cpu_status_vs,
  input         io_cpu_status_spp,
  input         io_cpu_status_mpie,
  input         io_cpu_status_hpie,
  input         io_cpu_status_spie,
  input         io_cpu_status_upie,
  input         io_cpu_status_mie,
  input         io_cpu_status_hie,
  input         io_cpu_status_sie,
  input         io_cpu_status_uie,
  input         io_cpu_sfence_valid,
  input         io_cpu_sfence_bits_rs1,
  input         io_cpu_sfence_bits_rs2,
  input  [38:0] io_cpu_sfence_bits_addr,
  input         io_cpu_sfence_bits_asid,
  input  [11:0] io_cpu_brupdate_b1_resolve_mask,
  input  [11:0] io_cpu_brupdate_b1_mispredict_mask,
  input  [6:0]  io_cpu_brupdate_b2_uop_uopc,
  input  [31:0] io_cpu_brupdate_b2_uop_inst,
  input  [31:0] io_cpu_brupdate_b2_uop_debug_inst,
  input         io_cpu_brupdate_b2_uop_is_rvc,
  input  [39:0] io_cpu_brupdate_b2_uop_debug_pc,
  input  [2:0]  io_cpu_brupdate_b2_uop_iq_type,
  input  [9:0]  io_cpu_brupdate_b2_uop_fu_code,
  input  [3:0]  io_cpu_brupdate_b2_uop_ctrl_br_type,
  input  [1:0]  io_cpu_brupdate_b2_uop_ctrl_op1_sel,
  input  [2:0]  io_cpu_brupdate_b2_uop_ctrl_op2_sel,
  input  [2:0]  io_cpu_brupdate_b2_uop_ctrl_imm_sel,
  input  [3:0]  io_cpu_brupdate_b2_uop_ctrl_op_fcn,
  input         io_cpu_brupdate_b2_uop_ctrl_fcn_dw,
  input  [2:0]  io_cpu_brupdate_b2_uop_ctrl_csr_cmd,
  input         io_cpu_brupdate_b2_uop_ctrl_is_load,
  input         io_cpu_brupdate_b2_uop_ctrl_is_sta,
  input         io_cpu_brupdate_b2_uop_ctrl_is_std,
  input  [1:0]  io_cpu_brupdate_b2_uop_iw_state,
  input         io_cpu_brupdate_b2_uop_iw_p1_poisoned,
  input         io_cpu_brupdate_b2_uop_iw_p2_poisoned,
  input         io_cpu_brupdate_b2_uop_is_br,
  input         io_cpu_brupdate_b2_uop_is_jalr,
  input         io_cpu_brupdate_b2_uop_is_jal,
  input         io_cpu_brupdate_b2_uop_is_sfb,
  input  [11:0] io_cpu_brupdate_b2_uop_br_mask,
  input  [3:0]  io_cpu_brupdate_b2_uop_br_tag,
  input  [4:0]  io_cpu_brupdate_b2_uop_ftq_idx,
  input         io_cpu_brupdate_b2_uop_edge_inst,
  input  [5:0]  io_cpu_brupdate_b2_uop_pc_lob,
  input         io_cpu_brupdate_b2_uop_taken,
  input  [19:0] io_cpu_brupdate_b2_uop_imm_packed,
  input  [11:0] io_cpu_brupdate_b2_uop_csr_addr,
  input  [5:0]  io_cpu_brupdate_b2_uop_rob_idx,
  input  [3:0]  io_cpu_brupdate_b2_uop_ldq_idx,
  input  [3:0]  io_cpu_brupdate_b2_uop_stq_idx,
  input  [1:0]  io_cpu_brupdate_b2_uop_rxq_idx,
  input  [5:0]  io_cpu_brupdate_b2_uop_pdst,
  input  [5:0]  io_cpu_brupdate_b2_uop_prs1,
  input  [5:0]  io_cpu_brupdate_b2_uop_prs2,
  input  [5:0]  io_cpu_brupdate_b2_uop_prs3,
  input  [4:0]  io_cpu_brupdate_b2_uop_ppred,
  input         io_cpu_brupdate_b2_uop_prs1_busy,
  input         io_cpu_brupdate_b2_uop_prs2_busy,
  input         io_cpu_brupdate_b2_uop_prs3_busy,
  input         io_cpu_brupdate_b2_uop_ppred_busy,
  input  [5:0]  io_cpu_brupdate_b2_uop_stale_pdst,
  input         io_cpu_brupdate_b2_uop_exception,
  input  [63:0] io_cpu_brupdate_b2_uop_exc_cause,
  input         io_cpu_brupdate_b2_uop_bypassable,
  input  [4:0]  io_cpu_brupdate_b2_uop_mem_cmd,
  input  [1:0]  io_cpu_brupdate_b2_uop_mem_size,
  input         io_cpu_brupdate_b2_uop_mem_signed,
  input         io_cpu_brupdate_b2_uop_is_fence,
  input         io_cpu_brupdate_b2_uop_is_fencei,
  input         io_cpu_brupdate_b2_uop_is_amo,
  input         io_cpu_brupdate_b2_uop_uses_ldq,
  input         io_cpu_brupdate_b2_uop_uses_stq,
  input         io_cpu_brupdate_b2_uop_is_sys_pc2epc,
  input         io_cpu_brupdate_b2_uop_is_unique,
  input         io_cpu_brupdate_b2_uop_flush_on_commit,
  input         io_cpu_brupdate_b2_uop_ldst_is_rs1,
  input  [5:0]  io_cpu_brupdate_b2_uop_ldst,
  input  [5:0]  io_cpu_brupdate_b2_uop_lrs1,
  input  [5:0]  io_cpu_brupdate_b2_uop_lrs2,
  input  [5:0]  io_cpu_brupdate_b2_uop_lrs3,
  input         io_cpu_brupdate_b2_uop_ldst_val,
  input  [1:0]  io_cpu_brupdate_b2_uop_dst_rtype,
  input  [1:0]  io_cpu_brupdate_b2_uop_lrs1_rtype,
  input  [1:0]  io_cpu_brupdate_b2_uop_lrs2_rtype,
  input         io_cpu_brupdate_b2_uop_frs3_en,
  input         io_cpu_brupdate_b2_uop_fp_val,
  input         io_cpu_brupdate_b2_uop_fp_single,
  input         io_cpu_brupdate_b2_uop_xcpt_pf_if,
  input         io_cpu_brupdate_b2_uop_xcpt_ae_if,
  input         io_cpu_brupdate_b2_uop_xcpt_ma_if,
  input         io_cpu_brupdate_b2_uop_bp_debug_if,
  input         io_cpu_brupdate_b2_uop_bp_xcpt_if,
  input  [1:0]  io_cpu_brupdate_b2_uop_debug_fsrc,
  input  [1:0]  io_cpu_brupdate_b2_uop_debug_tsrc,
  input         io_cpu_brupdate_b2_valid,
  input         io_cpu_brupdate_b2_mispredict,
  input         io_cpu_brupdate_b2_taken,
  input  [2:0]  io_cpu_brupdate_b2_cfi_type,
  input  [1:0]  io_cpu_brupdate_b2_pc_sel,
  input  [39:0] io_cpu_brupdate_b2_jalr_target,
  input  [20:0] io_cpu_brupdate_b2_target_offset,
  input         io_cpu_redirect_flush,
  input         io_cpu_redirect_val,
  input  [39:0] io_cpu_redirect_pc,
  input  [4:0]  io_cpu_redirect_ftq_idx,
  input  [63:0] io_cpu_redirect_ghist_old_history,
  input         io_cpu_redirect_ghist_current_saw_branch_not_taken,
  input         io_cpu_redirect_ghist_new_saw_branch_not_taken,
  input         io_cpu_redirect_ghist_new_saw_branch_taken,
  input  [4:0]  io_cpu_redirect_ghist_ras_idx,
  input         io_cpu_commit_valid,
  input  [31:0] io_cpu_commit_bits,
  input         io_cpu_flush_icache,
  output        io_cpu_perf_acquire,
  output        io_cpu_perf_tlbMiss,
  input         io_ptw_req_ready,
  output        io_ptw_req_valid,
  output        io_ptw_req_bits_valid,
  output [26:0] io_ptw_req_bits_bits_addr,
  input         io_ptw_resp_valid,
  input         io_ptw_resp_bits_ae,
  input  [53:0] io_ptw_resp_bits_pte_ppn,
  input  [1:0]  io_ptw_resp_bits_pte_reserved_for_software,
  input         io_ptw_resp_bits_pte_d,
  input         io_ptw_resp_bits_pte_a,
  input         io_ptw_resp_bits_pte_g,
  input         io_ptw_resp_bits_pte_u,
  input         io_ptw_resp_bits_pte_x,
  input         io_ptw_resp_bits_pte_w,
  input         io_ptw_resp_bits_pte_r,
  input         io_ptw_resp_bits_pte_v,
  input  [1:0]  io_ptw_resp_bits_level,
  input         io_ptw_resp_bits_fragmented_superpage,
  input         io_ptw_resp_bits_homogeneous,
  input  [3:0]  io_ptw_ptbr_mode,
  input  [15:0] io_ptw_ptbr_asid,
  input  [43:0] io_ptw_ptbr_ppn,
  input         io_ptw_status_debug,
  input         io_ptw_status_cease,
  input         io_ptw_status_wfi,
  input  [31:0] io_ptw_status_isa,
  input  [1:0]  io_ptw_status_dprv,
  input  [1:0]  io_ptw_status_prv,
  input         io_ptw_status_sd,
  input  [26:0] io_ptw_status_zero2,
  input  [1:0]  io_ptw_status_sxl,
  input  [1:0]  io_ptw_status_uxl,
  input         io_ptw_status_sd_rv32,
  input  [7:0]  io_ptw_status_zero1,
  input         io_ptw_status_tsr,
  input         io_ptw_status_tw,
  input         io_ptw_status_tvm,
  input         io_ptw_status_mxr,
  input         io_ptw_status_sum,
  input         io_ptw_status_mprv,
  input  [1:0]  io_ptw_status_xs,
  input  [1:0]  io_ptw_status_fs,
  input  [1:0]  io_ptw_status_mpp,
  input  [1:0]  io_ptw_status_vs,
  input         io_ptw_status_spp,
  input         io_ptw_status_mpie,
  input         io_ptw_status_hpie,
  input         io_ptw_status_spie,
  input         io_ptw_status_upie,
  input         io_ptw_status_mie,
  input         io_ptw_status_hie,
  input         io_ptw_status_sie,
  input         io_ptw_status_uie,
  input         io_ptw_pmp_0_cfg_l,
  input  [1:0]  io_ptw_pmp_0_cfg_res,
  input  [1:0]  io_ptw_pmp_0_cfg_a,
  input         io_ptw_pmp_0_cfg_x,
  input         io_ptw_pmp_0_cfg_w,
  input         io_ptw_pmp_0_cfg_r,
  input  [29:0] io_ptw_pmp_0_addr,
  input  [31:0] io_ptw_pmp_0_mask,
  input         io_ptw_pmp_1_cfg_l,
  input  [1:0]  io_ptw_pmp_1_cfg_res,
  input  [1:0]  io_ptw_pmp_1_cfg_a,
  input         io_ptw_pmp_1_cfg_x,
  input         io_ptw_pmp_1_cfg_w,
  input         io_ptw_pmp_1_cfg_r,
  input  [29:0] io_ptw_pmp_1_addr,
  input  [31:0] io_ptw_pmp_1_mask,
  input         io_ptw_pmp_2_cfg_l,
  input  [1:0]  io_ptw_pmp_2_cfg_res,
  input  [1:0]  io_ptw_pmp_2_cfg_a,
  input         io_ptw_pmp_2_cfg_x,
  input         io_ptw_pmp_2_cfg_w,
  input         io_ptw_pmp_2_cfg_r,
  input  [29:0] io_ptw_pmp_2_addr,
  input  [31:0] io_ptw_pmp_2_mask,
  input         io_ptw_pmp_3_cfg_l,
  input  [1:0]  io_ptw_pmp_3_cfg_res,
  input  [1:0]  io_ptw_pmp_3_cfg_a,
  input         io_ptw_pmp_3_cfg_x,
  input         io_ptw_pmp_3_cfg_w,
  input         io_ptw_pmp_3_cfg_r,
  input  [29:0] io_ptw_pmp_3_addr,
  input  [31:0] io_ptw_pmp_3_mask,
  input         io_ptw_pmp_4_cfg_l,
  input  [1:0]  io_ptw_pmp_4_cfg_res,
  input  [1:0]  io_ptw_pmp_4_cfg_a,
  input         io_ptw_pmp_4_cfg_x,
  input         io_ptw_pmp_4_cfg_w,
  input         io_ptw_pmp_4_cfg_r,
  input  [29:0] io_ptw_pmp_4_addr,
  input  [31:0] io_ptw_pmp_4_mask,
  input         io_ptw_pmp_5_cfg_l,
  input  [1:0]  io_ptw_pmp_5_cfg_res,
  input  [1:0]  io_ptw_pmp_5_cfg_a,
  input         io_ptw_pmp_5_cfg_x,
  input         io_ptw_pmp_5_cfg_w,
  input         io_ptw_pmp_5_cfg_r,
  input  [29:0] io_ptw_pmp_5_addr,
  input  [31:0] io_ptw_pmp_5_mask,
  input         io_ptw_pmp_6_cfg_l,
  input  [1:0]  io_ptw_pmp_6_cfg_res,
  input  [1:0]  io_ptw_pmp_6_cfg_a,
  input         io_ptw_pmp_6_cfg_x,
  input         io_ptw_pmp_6_cfg_w,
  input         io_ptw_pmp_6_cfg_r,
  input  [29:0] io_ptw_pmp_6_addr,
  input  [31:0] io_ptw_pmp_6_mask,
  input         io_ptw_pmp_7_cfg_l,
  input  [1:0]  io_ptw_pmp_7_cfg_res,
  input  [1:0]  io_ptw_pmp_7_cfg_a,
  input         io_ptw_pmp_7_cfg_x,
  input         io_ptw_pmp_7_cfg_w,
  input         io_ptw_pmp_7_cfg_r,
  input  [29:0] io_ptw_pmp_7_addr,
  input  [31:0] io_ptw_pmp_7_mask,
  input         io_ptw_customCSRs_csrs_0_wen,
  input  [63:0] io_ptw_customCSRs_csrs_0_wdata,
  input  [63:0] io_ptw_customCSRs_csrs_0_value,
  output        io_errors_bus_valid,
  output [31:0] io_errors_bus_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [63:0] _RAND_15;
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
`endif // RANDOMIZE_REG_INIT
  wire  icache_clock; // @[frontend.scala 300:26]
  wire  icache_reset; // @[frontend.scala 300:26]
  wire  icache_auto_master_out_a_ready; // @[frontend.scala 300:26]
  wire  icache_auto_master_out_a_valid; // @[frontend.scala 300:26]
  wire [2:0] icache_auto_master_out_a_bits_opcode; // @[frontend.scala 300:26]
  wire [2:0] icache_auto_master_out_a_bits_param; // @[frontend.scala 300:26]
  wire [3:0] icache_auto_master_out_a_bits_size; // @[frontend.scala 300:26]
  wire  icache_auto_master_out_a_bits_source; // @[frontend.scala 300:26]
  wire [31:0] icache_auto_master_out_a_bits_address; // @[frontend.scala 300:26]
  wire [7:0] icache_auto_master_out_a_bits_mask; // @[frontend.scala 300:26]
  wire [63:0] icache_auto_master_out_a_bits_data; // @[frontend.scala 300:26]
  wire  icache_auto_master_out_a_bits_corrupt; // @[frontend.scala 300:26]
  wire  icache_auto_master_out_d_ready; // @[frontend.scala 300:26]
  wire  icache_auto_master_out_d_valid; // @[frontend.scala 300:26]
  wire [2:0] icache_auto_master_out_d_bits_opcode; // @[frontend.scala 300:26]
  wire [1:0] icache_auto_master_out_d_bits_param; // @[frontend.scala 300:26]
  wire [3:0] icache_auto_master_out_d_bits_size; // @[frontend.scala 300:26]
  wire  icache_auto_master_out_d_bits_source; // @[frontend.scala 300:26]
  wire [1:0] icache_auto_master_out_d_bits_sink; // @[frontend.scala 300:26]
  wire  icache_auto_master_out_d_bits_denied; // @[frontend.scala 300:26]
  wire [63:0] icache_auto_master_out_d_bits_data; // @[frontend.scala 300:26]
  wire  icache_auto_master_out_d_bits_corrupt; // @[frontend.scala 300:26]
  wire  icache_io_req_ready; // @[frontend.scala 300:26]
  wire  icache_io_req_valid; // @[frontend.scala 300:26]
  wire [38:0] icache_io_req_bits_addr; // @[frontend.scala 300:26]
  wire [31:0] icache_io_s1_paddr; // @[frontend.scala 300:26]
  wire  icache_io_s1_kill; // @[frontend.scala 300:26]
  wire  icache_io_s2_kill; // @[frontend.scala 300:26]
  wire  icache_io_s2_prefetch; // @[frontend.scala 300:26]
  wire  icache_io_resp_valid; // @[frontend.scala 300:26]
  wire [63:0] icache_io_resp_bits_data; // @[frontend.scala 300:26]
  wire  icache_io_resp_bits_replay; // @[frontend.scala 300:26]
  wire  icache_io_resp_bits_ae; // @[frontend.scala 300:26]
  wire  icache_io_invalidate; // @[frontend.scala 300:26]
  wire  icache_io_perf_acquire; // @[frontend.scala 300:26]
  wire  bpd_clock; // @[frontend.scala 333:19]
  wire  bpd_reset; // @[frontend.scala 333:19]
  wire  bpd_io_f0_req_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_f0_req_bits_pc; // @[frontend.scala 333:19]
  wire [63:0] bpd_io_f0_req_bits_ghist_old_history; // @[frontend.scala 333:19]
  wire  bpd_io_f0_req_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 333:19]
  wire  bpd_io_f0_req_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 333:19]
  wire  bpd_io_f0_req_bits_ghist_new_saw_branch_taken; // @[frontend.scala 333:19]
  wire [4:0] bpd_io_f0_req_bits_ghist_ras_idx; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f1_pc; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_0_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_0_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_0_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_0_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f1_preds_0_predicted_pc_bits; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_1_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_1_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_1_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_1_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f1_preds_1_predicted_pc_bits; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_2_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_2_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_2_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_2_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f1_preds_2_predicted_pc_bits; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_3_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_3_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_3_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_preds_3_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f1_preds_3_predicted_pc_bits; // @[frontend.scala 333:19]
  wire [119:0] bpd_io_resp_f1_meta_0; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f1_lhist_0; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f2_pc; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_0_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_0_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_0_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_0_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f2_preds_0_predicted_pc_bits; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_1_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_1_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_1_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_1_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f2_preds_1_predicted_pc_bits; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_2_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_2_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_2_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_2_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f2_preds_2_predicted_pc_bits; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_3_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_3_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_3_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_preds_3_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f2_preds_3_predicted_pc_bits; // @[frontend.scala 333:19]
  wire [119:0] bpd_io_resp_f2_meta_0; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f2_lhist_0; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f3_pc; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_0_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_0_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_0_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_0_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f3_preds_0_predicted_pc_bits; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_1_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_1_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_1_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_1_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f3_preds_1_predicted_pc_bits; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_2_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_2_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_2_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_2_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f3_preds_2_predicted_pc_bits; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_3_taken; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_3_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_3_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_preds_3_predicted_pc_valid; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_resp_f3_preds_3_predicted_pc_bits; // @[frontend.scala 333:19]
  wire [119:0] bpd_io_resp_f3_meta_0; // @[frontend.scala 333:19]
  wire  bpd_io_resp_f3_lhist_0; // @[frontend.scala 333:19]
  wire  bpd_io_f3_fire; // @[frontend.scala 333:19]
  wire  bpd_io_update_valid; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_is_mispredict_update; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_is_repair_update; // @[frontend.scala 333:19]
  wire [3:0] bpd_io_update_bits_btb_mispredicts; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_update_bits_pc; // @[frontend.scala 333:19]
  wire [3:0] bpd_io_update_bits_br_mask; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_cfi_idx_valid; // @[frontend.scala 333:19]
  wire [1:0] bpd_io_update_bits_cfi_idx_bits; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_cfi_taken; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_cfi_mispredicted; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_cfi_is_br; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_cfi_is_jal; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_cfi_is_jalr; // @[frontend.scala 333:19]
  wire [63:0] bpd_io_update_bits_ghist_old_history; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_ghist_new_saw_branch_taken; // @[frontend.scala 333:19]
  wire [4:0] bpd_io_update_bits_ghist_ras_idx; // @[frontend.scala 333:19]
  wire  bpd_io_update_bits_lhist_0; // @[frontend.scala 333:19]
  wire [39:0] bpd_io_update_bits_target; // @[frontend.scala 333:19]
  wire [119:0] bpd_io_update_bits_meta_0; // @[frontend.scala 333:19]
  wire  ras_clock; // @[frontend.scala 335:19]
  wire  ras_reset; // @[frontend.scala 335:19]
  wire [4:0] ras_io_read_idx; // @[frontend.scala 335:19]
  wire [39:0] ras_io_read_addr; // @[frontend.scala 335:19]
  wire  ras_io_write_valid; // @[frontend.scala 335:19]
  wire [4:0] ras_io_write_idx; // @[frontend.scala 335:19]
  wire [39:0] ras_io_write_addr; // @[frontend.scala 335:19]
  wire  tlb_clock; // @[frontend.scala 339:19]
  wire  tlb_reset; // @[frontend.scala 339:19]
  wire  tlb_io_req_ready; // @[frontend.scala 339:19]
  wire  tlb_io_req_valid; // @[frontend.scala 339:19]
  wire [39:0] tlb_io_req_bits_vaddr; // @[frontend.scala 339:19]
  wire  tlb_io_req_bits_passthrough; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_req_bits_size; // @[frontend.scala 339:19]
  wire [4:0] tlb_io_req_bits_cmd; // @[frontend.scala 339:19]
  wire  tlb_io_resp_miss; // @[frontend.scala 339:19]
  wire [31:0] tlb_io_resp_paddr; // @[frontend.scala 339:19]
  wire  tlb_io_resp_pf_ld; // @[frontend.scala 339:19]
  wire  tlb_io_resp_pf_st; // @[frontend.scala 339:19]
  wire  tlb_io_resp_pf_inst; // @[frontend.scala 339:19]
  wire  tlb_io_resp_ae_ld; // @[frontend.scala 339:19]
  wire  tlb_io_resp_ae_st; // @[frontend.scala 339:19]
  wire  tlb_io_resp_ae_inst; // @[frontend.scala 339:19]
  wire  tlb_io_resp_ma_ld; // @[frontend.scala 339:19]
  wire  tlb_io_resp_ma_st; // @[frontend.scala 339:19]
  wire  tlb_io_resp_ma_inst; // @[frontend.scala 339:19]
  wire  tlb_io_resp_cacheable; // @[frontend.scala 339:19]
  wire  tlb_io_resp_must_alloc; // @[frontend.scala 339:19]
  wire  tlb_io_resp_prefetchable; // @[frontend.scala 339:19]
  wire  tlb_io_sfence_valid; // @[frontend.scala 339:19]
  wire  tlb_io_sfence_bits_rs1; // @[frontend.scala 339:19]
  wire  tlb_io_sfence_bits_rs2; // @[frontend.scala 339:19]
  wire [38:0] tlb_io_sfence_bits_addr; // @[frontend.scala 339:19]
  wire  tlb_io_sfence_bits_asid; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_req_ready; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_req_valid; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_req_bits_valid; // @[frontend.scala 339:19]
  wire [26:0] tlb_io_ptw_req_bits_bits_addr; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_valid; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_bits_ae; // @[frontend.scala 339:19]
  wire [53:0] tlb_io_ptw_resp_bits_pte_ppn; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_resp_bits_pte_reserved_for_software; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_bits_pte_d; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_bits_pte_a; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_bits_pte_g; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_bits_pte_u; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_bits_pte_x; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_bits_pte_w; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_bits_pte_r; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_bits_pte_v; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_resp_bits_level; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_bits_fragmented_superpage; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_resp_bits_homogeneous; // @[frontend.scala 339:19]
  wire [3:0] tlb_io_ptw_ptbr_mode; // @[frontend.scala 339:19]
  wire [15:0] tlb_io_ptw_ptbr_asid; // @[frontend.scala 339:19]
  wire [43:0] tlb_io_ptw_ptbr_ppn; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_debug; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_cease; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_wfi; // @[frontend.scala 339:19]
  wire [31:0] tlb_io_ptw_status_isa; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_status_dprv; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_status_prv; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_sd; // @[frontend.scala 339:19]
  wire [26:0] tlb_io_ptw_status_zero2; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_status_sxl; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_status_uxl; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_sd_rv32; // @[frontend.scala 339:19]
  wire [7:0] tlb_io_ptw_status_zero1; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_tsr; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_tw; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_tvm; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_mxr; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_sum; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_mprv; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_status_xs; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_status_fs; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_status_mpp; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_status_vs; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_spp; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_mpie; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_hpie; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_spie; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_upie; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_mie; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_hie; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_sie; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_status_uie; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_0_cfg_l; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_0_cfg_res; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_0_cfg_a; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_0_cfg_x; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_0_cfg_w; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_0_cfg_r; // @[frontend.scala 339:19]
  wire [29:0] tlb_io_ptw_pmp_0_addr; // @[frontend.scala 339:19]
  wire [31:0] tlb_io_ptw_pmp_0_mask; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_1_cfg_l; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_1_cfg_res; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_1_cfg_a; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_1_cfg_x; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_1_cfg_w; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_1_cfg_r; // @[frontend.scala 339:19]
  wire [29:0] tlb_io_ptw_pmp_1_addr; // @[frontend.scala 339:19]
  wire [31:0] tlb_io_ptw_pmp_1_mask; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_2_cfg_l; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_2_cfg_res; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_2_cfg_a; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_2_cfg_x; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_2_cfg_w; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_2_cfg_r; // @[frontend.scala 339:19]
  wire [29:0] tlb_io_ptw_pmp_2_addr; // @[frontend.scala 339:19]
  wire [31:0] tlb_io_ptw_pmp_2_mask; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_3_cfg_l; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_3_cfg_res; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_3_cfg_a; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_3_cfg_x; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_3_cfg_w; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_3_cfg_r; // @[frontend.scala 339:19]
  wire [29:0] tlb_io_ptw_pmp_3_addr; // @[frontend.scala 339:19]
  wire [31:0] tlb_io_ptw_pmp_3_mask; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_4_cfg_l; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_4_cfg_res; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_4_cfg_a; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_4_cfg_x; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_4_cfg_w; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_4_cfg_r; // @[frontend.scala 339:19]
  wire [29:0] tlb_io_ptw_pmp_4_addr; // @[frontend.scala 339:19]
  wire [31:0] tlb_io_ptw_pmp_4_mask; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_5_cfg_l; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_5_cfg_res; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_5_cfg_a; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_5_cfg_x; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_5_cfg_w; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_5_cfg_r; // @[frontend.scala 339:19]
  wire [29:0] tlb_io_ptw_pmp_5_addr; // @[frontend.scala 339:19]
  wire [31:0] tlb_io_ptw_pmp_5_mask; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_6_cfg_l; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_6_cfg_res; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_6_cfg_a; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_6_cfg_x; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_6_cfg_w; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_6_cfg_r; // @[frontend.scala 339:19]
  wire [29:0] tlb_io_ptw_pmp_6_addr; // @[frontend.scala 339:19]
  wire [31:0] tlb_io_ptw_pmp_6_mask; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_7_cfg_l; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_7_cfg_res; // @[frontend.scala 339:19]
  wire [1:0] tlb_io_ptw_pmp_7_cfg_a; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_7_cfg_x; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_7_cfg_w; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_pmp_7_cfg_r; // @[frontend.scala 339:19]
  wire [29:0] tlb_io_ptw_pmp_7_addr; // @[frontend.scala 339:19]
  wire [31:0] tlb_io_ptw_pmp_7_mask; // @[frontend.scala 339:19]
  wire  tlb_io_ptw_customCSRs_csrs_0_wen; // @[frontend.scala 339:19]
  wire [63:0] tlb_io_ptw_customCSRs_csrs_0_wdata; // @[frontend.scala 339:19]
  wire [63:0] tlb_io_ptw_customCSRs_csrs_0_value; // @[frontend.scala 339:19]
  wire  tlb_io_kill; // @[frontend.scala 339:19]
  wire  f3_clock; // @[frontend.scala 516:11]
  wire  f3_reset; // @[frontend.scala 516:11]
  wire  f3_io_enq_ready; // @[frontend.scala 516:11]
  wire  f3_io_enq_valid; // @[frontend.scala 516:11]
  wire [39:0] f3_io_enq_bits_pc; // @[frontend.scala 516:11]
  wire [63:0] f3_io_enq_bits_data; // @[frontend.scala 516:11]
  wire [3:0] f3_io_enq_bits_mask; // @[frontend.scala 516:11]
  wire  f3_io_enq_bits_xcpt_pf_inst; // @[frontend.scala 516:11]
  wire  f3_io_enq_bits_xcpt_ae_inst; // @[frontend.scala 516:11]
  wire [63:0] f3_io_enq_bits_ghist_old_history; // @[frontend.scala 516:11]
  wire  f3_io_enq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 516:11]
  wire  f3_io_enq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 516:11]
  wire  f3_io_enq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 516:11]
  wire [4:0] f3_io_enq_bits_ghist_ras_idx; // @[frontend.scala 516:11]
  wire [1:0] f3_io_enq_bits_fsrc; // @[frontend.scala 516:11]
  wire [1:0] f3_io_enq_bits_tsrc; // @[frontend.scala 516:11]
  wire  f3_io_deq_ready; // @[frontend.scala 516:11]
  wire  f3_io_deq_valid; // @[frontend.scala 516:11]
  wire [39:0] f3_io_deq_bits_pc; // @[frontend.scala 516:11]
  wire [63:0] f3_io_deq_bits_data; // @[frontend.scala 516:11]
  wire [3:0] f3_io_deq_bits_mask; // @[frontend.scala 516:11]
  wire  f3_io_deq_bits_xcpt_pf_inst; // @[frontend.scala 516:11]
  wire  f3_io_deq_bits_xcpt_ae_inst; // @[frontend.scala 516:11]
  wire [63:0] f3_io_deq_bits_ghist_old_history; // @[frontend.scala 516:11]
  wire  f3_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 516:11]
  wire  f3_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 516:11]
  wire  f3_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 516:11]
  wire [4:0] f3_io_deq_bits_ghist_ras_idx; // @[frontend.scala 516:11]
  wire [1:0] f3_io_deq_bits_fsrc; // @[frontend.scala 516:11]
  wire [1:0] f3_io_deq_bits_tsrc; // @[frontend.scala 516:11]
  wire  f3_io_count; // @[frontend.scala 516:11]
  wire  f3_bpd_resp_clock; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_reset; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_ready; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_valid; // @[frontend.scala 521:11]
  wire [39:0] f3_bpd_resp_io_enq_bits_pc; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_0_taken; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_0_is_br; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_0_is_jal; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_valid; // @[frontend.scala 521:11]
  wire [39:0] f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_bits; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_1_taken; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_1_is_br; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_1_is_jal; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_valid; // @[frontend.scala 521:11]
  wire [39:0] f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_bits; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_2_taken; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_2_is_br; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_2_is_jal; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_valid; // @[frontend.scala 521:11]
  wire [39:0] f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_bits; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_3_taken; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_3_is_br; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_3_is_jal; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_valid; // @[frontend.scala 521:11]
  wire [39:0] f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_bits; // @[frontend.scala 521:11]
  wire [119:0] f3_bpd_resp_io_enq_bits_meta_0; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_enq_bits_lhist_0; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_ready; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_valid; // @[frontend.scala 521:11]
  wire [39:0] f3_bpd_resp_io_deq_bits_pc; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_0_taken; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_0_is_br; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_0_is_jal; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_valid; // @[frontend.scala 521:11]
  wire [39:0] f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_1_taken; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_1_is_br; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_1_is_jal; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_valid; // @[frontend.scala 521:11]
  wire [39:0] f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_2_taken; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_2_is_br; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_2_is_jal; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_valid; // @[frontend.scala 521:11]
  wire [39:0] f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_3_taken; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_3_is_br; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_3_is_jal; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_valid; // @[frontend.scala 521:11]
  wire [39:0] f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits; // @[frontend.scala 521:11]
  wire [119:0] f3_bpd_resp_io_deq_bits_meta_0; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_deq_bits_lhist_0; // @[frontend.scala 521:11]
  wire  f3_bpd_resp_io_count; // @[frontend.scala 521:11]
  wire  BreakpointUnit_clock; // @[frontend.scala 606:23]
  wire  BreakpointUnit_reset; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_debug; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_cease; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_wfi; // @[frontend.scala 606:23]
  wire [31:0] BreakpointUnit_io_status_isa; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_io_status_dprv; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_io_status_prv; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_sd; // @[frontend.scala 606:23]
  wire [26:0] BreakpointUnit_io_status_zero2; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_io_status_sxl; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_io_status_uxl; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_sd_rv32; // @[frontend.scala 606:23]
  wire [7:0] BreakpointUnit_io_status_zero1; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_tsr; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_tw; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_tvm; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_mxr; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_sum; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_mprv; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_io_status_xs; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_io_status_fs; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_io_status_mpp; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_io_status_vs; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_spp; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_mpie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_hpie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_spie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_upie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_mie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_hie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_sie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_status_uie; // @[frontend.scala 606:23]
  wire [38:0] BreakpointUnit_io_pc; // @[frontend.scala 606:23]
  wire [38:0] BreakpointUnit_io_ea; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_xcpt_if; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_xcpt_ld; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_xcpt_st; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_debug_if; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_debug_ld; // @[frontend.scala 606:23]
  wire  BreakpointUnit_io_debug_st; // @[frontend.scala 606:23]
  wire  RVCExpander_clock; // @[consts.scala 330:25]
  wire  RVCExpander_reset; // @[consts.scala 330:25]
  wire [31:0] RVCExpander_io_in; // @[consts.scala 330:25]
  wire [31:0] RVCExpander_io_out_bits; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_io_out_rd; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_io_out_rs1; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_io_out_rs2; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_io_out_rs3; // @[consts.scala 330:25]
  wire  RVCExpander_io_rvc; // @[consts.scala 330:25]
  wire  RVCExpander_1_clock; // @[consts.scala 330:25]
  wire  RVCExpander_1_reset; // @[consts.scala 330:25]
  wire [31:0] RVCExpander_1_io_in; // @[consts.scala 330:25]
  wire [31:0] RVCExpander_1_io_out_bits; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_1_io_out_rd; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_1_io_out_rs1; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_1_io_out_rs2; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_1_io_out_rs3; // @[consts.scala 330:25]
  wire  RVCExpander_1_io_rvc; // @[consts.scala 330:25]
  wire  BranchDecode_clock; // @[frontend.scala 622:34]
  wire  BranchDecode_reset; // @[frontend.scala 622:34]
  wire [31:0] BranchDecode_io_inst; // @[frontend.scala 622:34]
  wire [39:0] BranchDecode_io_pc; // @[frontend.scala 622:34]
  wire  BranchDecode_io_out_is_ret; // @[frontend.scala 622:34]
  wire  BranchDecode_io_out_is_call; // @[frontend.scala 622:34]
  wire [39:0] BranchDecode_io_out_target; // @[frontend.scala 622:34]
  wire [2:0] BranchDecode_io_out_cfi_type; // @[frontend.scala 622:34]
  wire  BranchDecode_io_out_sfb_offset_valid; // @[frontend.scala 622:34]
  wire [5:0] BranchDecode_io_out_sfb_offset_bits; // @[frontend.scala 622:34]
  wire  BranchDecode_io_out_shadowable; // @[frontend.scala 622:34]
  wire  BranchDecode_1_clock; // @[frontend.scala 625:34]
  wire  BranchDecode_1_reset; // @[frontend.scala 625:34]
  wire [31:0] BranchDecode_1_io_inst; // @[frontend.scala 625:34]
  wire [39:0] BranchDecode_1_io_pc; // @[frontend.scala 625:34]
  wire  BranchDecode_1_io_out_is_ret; // @[frontend.scala 625:34]
  wire  BranchDecode_1_io_out_is_call; // @[frontend.scala 625:34]
  wire [39:0] BranchDecode_1_io_out_target; // @[frontend.scala 625:34]
  wire [2:0] BranchDecode_1_io_out_cfi_type; // @[frontend.scala 625:34]
  wire  BranchDecode_1_io_out_sfb_offset_valid; // @[frontend.scala 625:34]
  wire [5:0] BranchDecode_1_io_out_sfb_offset_bits; // @[frontend.scala 625:34]
  wire  BranchDecode_1_io_out_shadowable; // @[frontend.scala 625:34]
  wire  BreakpointUnit_1_clock; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_reset; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_debug; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_cease; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_wfi; // @[frontend.scala 606:23]
  wire [31:0] BreakpointUnit_1_io_status_isa; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_1_io_status_dprv; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_1_io_status_prv; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_sd; // @[frontend.scala 606:23]
  wire [26:0] BreakpointUnit_1_io_status_zero2; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_1_io_status_sxl; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_1_io_status_uxl; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_sd_rv32; // @[frontend.scala 606:23]
  wire [7:0] BreakpointUnit_1_io_status_zero1; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_tsr; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_tw; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_tvm; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_mxr; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_sum; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_mprv; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_1_io_status_xs; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_1_io_status_fs; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_1_io_status_mpp; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_1_io_status_vs; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_spp; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_mpie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_hpie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_spie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_upie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_mie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_hie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_sie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_status_uie; // @[frontend.scala 606:23]
  wire [38:0] BreakpointUnit_1_io_pc; // @[frontend.scala 606:23]
  wire [38:0] BreakpointUnit_1_io_ea; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_xcpt_if; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_xcpt_ld; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_xcpt_st; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_debug_if; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_debug_ld; // @[frontend.scala 606:23]
  wire  BreakpointUnit_1_io_debug_st; // @[frontend.scala 606:23]
  wire  RVCExpander_2_clock; // @[consts.scala 330:25]
  wire  RVCExpander_2_reset; // @[consts.scala 330:25]
  wire [31:0] RVCExpander_2_io_in; // @[consts.scala 330:25]
  wire [31:0] RVCExpander_2_io_out_bits; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_2_io_out_rd; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_2_io_out_rs1; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_2_io_out_rs2; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_2_io_out_rs3; // @[consts.scala 330:25]
  wire  RVCExpander_2_io_rvc; // @[consts.scala 330:25]
  wire  BranchDecode_2_clock; // @[frontend.scala 663:33]
  wire  BranchDecode_2_reset; // @[frontend.scala 663:33]
  wire [31:0] BranchDecode_2_io_inst; // @[frontend.scala 663:33]
  wire [39:0] BranchDecode_2_io_pc; // @[frontend.scala 663:33]
  wire  BranchDecode_2_io_out_is_ret; // @[frontend.scala 663:33]
  wire  BranchDecode_2_io_out_is_call; // @[frontend.scala 663:33]
  wire [39:0] BranchDecode_2_io_out_target; // @[frontend.scala 663:33]
  wire [2:0] BranchDecode_2_io_out_cfi_type; // @[frontend.scala 663:33]
  wire  BranchDecode_2_io_out_sfb_offset_valid; // @[frontend.scala 663:33]
  wire [5:0] BranchDecode_2_io_out_sfb_offset_bits; // @[frontend.scala 663:33]
  wire  BranchDecode_2_io_out_shadowable; // @[frontend.scala 663:33]
  wire  BreakpointUnit_2_clock; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_reset; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_debug; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_cease; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_wfi; // @[frontend.scala 606:23]
  wire [31:0] BreakpointUnit_2_io_status_isa; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_2_io_status_dprv; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_2_io_status_prv; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_sd; // @[frontend.scala 606:23]
  wire [26:0] BreakpointUnit_2_io_status_zero2; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_2_io_status_sxl; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_2_io_status_uxl; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_sd_rv32; // @[frontend.scala 606:23]
  wire [7:0] BreakpointUnit_2_io_status_zero1; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_tsr; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_tw; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_tvm; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_mxr; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_sum; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_mprv; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_2_io_status_xs; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_2_io_status_fs; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_2_io_status_mpp; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_2_io_status_vs; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_spp; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_mpie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_hpie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_spie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_upie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_mie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_hie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_sie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_status_uie; // @[frontend.scala 606:23]
  wire [38:0] BreakpointUnit_2_io_pc; // @[frontend.scala 606:23]
  wire [38:0] BreakpointUnit_2_io_ea; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_xcpt_if; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_xcpt_ld; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_xcpt_st; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_debug_if; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_debug_ld; // @[frontend.scala 606:23]
  wire  BreakpointUnit_2_io_debug_st; // @[frontend.scala 606:23]
  wire  RVCExpander_3_clock; // @[consts.scala 330:25]
  wire  RVCExpander_3_reset; // @[consts.scala 330:25]
  wire [31:0] RVCExpander_3_io_in; // @[consts.scala 330:25]
  wire [31:0] RVCExpander_3_io_out_bits; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_3_io_out_rd; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_3_io_out_rs1; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_3_io_out_rs2; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_3_io_out_rs3; // @[consts.scala 330:25]
  wire  RVCExpander_3_io_rvc; // @[consts.scala 330:25]
  wire  BranchDecode_3_clock; // @[frontend.scala 663:33]
  wire  BranchDecode_3_reset; // @[frontend.scala 663:33]
  wire [31:0] BranchDecode_3_io_inst; // @[frontend.scala 663:33]
  wire [39:0] BranchDecode_3_io_pc; // @[frontend.scala 663:33]
  wire  BranchDecode_3_io_out_is_ret; // @[frontend.scala 663:33]
  wire  BranchDecode_3_io_out_is_call; // @[frontend.scala 663:33]
  wire [39:0] BranchDecode_3_io_out_target; // @[frontend.scala 663:33]
  wire [2:0] BranchDecode_3_io_out_cfi_type; // @[frontend.scala 663:33]
  wire  BranchDecode_3_io_out_sfb_offset_valid; // @[frontend.scala 663:33]
  wire [5:0] BranchDecode_3_io_out_sfb_offset_bits; // @[frontend.scala 663:33]
  wire  BranchDecode_3_io_out_shadowable; // @[frontend.scala 663:33]
  wire  BreakpointUnit_3_clock; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_reset; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_debug; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_cease; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_wfi; // @[frontend.scala 606:23]
  wire [31:0] BreakpointUnit_3_io_status_isa; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_3_io_status_dprv; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_3_io_status_prv; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_sd; // @[frontend.scala 606:23]
  wire [26:0] BreakpointUnit_3_io_status_zero2; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_3_io_status_sxl; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_3_io_status_uxl; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_sd_rv32; // @[frontend.scala 606:23]
  wire [7:0] BreakpointUnit_3_io_status_zero1; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_tsr; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_tw; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_tvm; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_mxr; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_sum; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_mprv; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_3_io_status_xs; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_3_io_status_fs; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_3_io_status_mpp; // @[frontend.scala 606:23]
  wire [1:0] BreakpointUnit_3_io_status_vs; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_spp; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_mpie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_hpie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_spie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_upie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_mie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_hie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_sie; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_status_uie; // @[frontend.scala 606:23]
  wire [38:0] BreakpointUnit_3_io_pc; // @[frontend.scala 606:23]
  wire [38:0] BreakpointUnit_3_io_ea; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_xcpt_if; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_xcpt_ld; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_xcpt_st; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_debug_if; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_debug_ld; // @[frontend.scala 606:23]
  wire  BreakpointUnit_3_io_debug_st; // @[frontend.scala 606:23]
  wire  RVCExpander_4_clock; // @[consts.scala 330:25]
  wire  RVCExpander_4_reset; // @[consts.scala 330:25]
  wire [31:0] RVCExpander_4_io_in; // @[consts.scala 330:25]
  wire [31:0] RVCExpander_4_io_out_bits; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_4_io_out_rd; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_4_io_out_rs1; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_4_io_out_rs2; // @[consts.scala 330:25]
  wire [4:0] RVCExpander_4_io_out_rs3; // @[consts.scala 330:25]
  wire  RVCExpander_4_io_rvc; // @[consts.scala 330:25]
  wire  BranchDecode_4_clock; // @[frontend.scala 663:33]
  wire  BranchDecode_4_reset; // @[frontend.scala 663:33]
  wire [31:0] BranchDecode_4_io_inst; // @[frontend.scala 663:33]
  wire [39:0] BranchDecode_4_io_pc; // @[frontend.scala 663:33]
  wire  BranchDecode_4_io_out_is_ret; // @[frontend.scala 663:33]
  wire  BranchDecode_4_io_out_is_call; // @[frontend.scala 663:33]
  wire [39:0] BranchDecode_4_io_out_target; // @[frontend.scala 663:33]
  wire [2:0] BranchDecode_4_io_out_cfi_type; // @[frontend.scala 663:33]
  wire  BranchDecode_4_io_out_sfb_offset_valid; // @[frontend.scala 663:33]
  wire [5:0] BranchDecode_4_io_out_sfb_offset_bits; // @[frontend.scala 663:33]
  wire  BranchDecode_4_io_out_shadowable; // @[frontend.scala 663:33]
  wire  f4_btb_corrections_clock; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_reset; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_ready; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_valid; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_is_mispredict_update; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_is_repair_update; // @[frontend.scala 842:34]
  wire [3:0] f4_btb_corrections_io_enq_bits_btb_mispredicts; // @[frontend.scala 842:34]
  wire [39:0] f4_btb_corrections_io_enq_bits_pc; // @[frontend.scala 842:34]
  wire [3:0] f4_btb_corrections_io_enq_bits_br_mask; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_idx_valid; // @[frontend.scala 842:34]
  wire [1:0] f4_btb_corrections_io_enq_bits_cfi_idx_bits; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_taken; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_mispredicted; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_is_br; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_is_jal; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_is_jalr; // @[frontend.scala 842:34]
  wire [63:0] f4_btb_corrections_io_enq_bits_ghist_old_history; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 842:34]
  wire [4:0] f4_btb_corrections_io_enq_bits_ghist_ras_idx; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_enq_bits_lhist_0; // @[frontend.scala 842:34]
  wire [39:0] f4_btb_corrections_io_enq_bits_target; // @[frontend.scala 842:34]
  wire [119:0] f4_btb_corrections_io_enq_bits_meta_0; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_ready; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_valid; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_is_mispredict_update; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_is_repair_update; // @[frontend.scala 842:34]
  wire [3:0] f4_btb_corrections_io_deq_bits_btb_mispredicts; // @[frontend.scala 842:34]
  wire [39:0] f4_btb_corrections_io_deq_bits_pc; // @[frontend.scala 842:34]
  wire [3:0] f4_btb_corrections_io_deq_bits_br_mask; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_idx_valid; // @[frontend.scala 842:34]
  wire [1:0] f4_btb_corrections_io_deq_bits_cfi_idx_bits; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_taken; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_mispredicted; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_is_br; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_is_jal; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_is_jalr; // @[frontend.scala 842:34]
  wire [63:0] f4_btb_corrections_io_deq_bits_ghist_old_history; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 842:34]
  wire [4:0] f4_btb_corrections_io_deq_bits_ghist_ras_idx; // @[frontend.scala 842:34]
  wire  f4_btb_corrections_io_deq_bits_lhist_0; // @[frontend.scala 842:34]
  wire [39:0] f4_btb_corrections_io_deq_bits_target; // @[frontend.scala 842:34]
  wire [119:0] f4_btb_corrections_io_deq_bits_meta_0; // @[frontend.scala 842:34]
  wire [1:0] f4_btb_corrections_io_count; // @[frontend.scala 842:34]
  wire  f4_clock; // @[frontend.scala 859:11]
  wire  f4_reset; // @[frontend.scala 859:11]
  wire  f4_io_enq_ready; // @[frontend.scala 859:11]
  wire  f4_io_enq_valid; // @[frontend.scala 859:11]
  wire [39:0] f4_io_enq_bits_pc; // @[frontend.scala 859:11]
  wire [39:0] f4_io_enq_bits_next_pc; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_edge_inst_0; // @[frontend.scala 859:11]
  wire [31:0] f4_io_enq_bits_insts_0; // @[frontend.scala 859:11]
  wire [31:0] f4_io_enq_bits_insts_1; // @[frontend.scala 859:11]
  wire [31:0] f4_io_enq_bits_insts_2; // @[frontend.scala 859:11]
  wire [31:0] f4_io_enq_bits_insts_3; // @[frontend.scala 859:11]
  wire [31:0] f4_io_enq_bits_exp_insts_0; // @[frontend.scala 859:11]
  wire [31:0] f4_io_enq_bits_exp_insts_1; // @[frontend.scala 859:11]
  wire [31:0] f4_io_enq_bits_exp_insts_2; // @[frontend.scala 859:11]
  wire [31:0] f4_io_enq_bits_exp_insts_3; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_sfbs_0; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_sfbs_1; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_sfbs_2; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_sfbs_3; // @[frontend.scala 859:11]
  wire [7:0] f4_io_enq_bits_sfb_masks_0; // @[frontend.scala 859:11]
  wire [7:0] f4_io_enq_bits_sfb_masks_1; // @[frontend.scala 859:11]
  wire [7:0] f4_io_enq_bits_sfb_masks_2; // @[frontend.scala 859:11]
  wire [7:0] f4_io_enq_bits_sfb_masks_3; // @[frontend.scala 859:11]
  wire [3:0] f4_io_enq_bits_sfb_dests_0; // @[frontend.scala 859:11]
  wire [3:0] f4_io_enq_bits_sfb_dests_1; // @[frontend.scala 859:11]
  wire [3:0] f4_io_enq_bits_sfb_dests_2; // @[frontend.scala 859:11]
  wire [3:0] f4_io_enq_bits_sfb_dests_3; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_shadowable_mask_0; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_shadowable_mask_1; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_shadowable_mask_2; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_shadowable_mask_3; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_shadowed_mask_0; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_shadowed_mask_1; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_shadowed_mask_2; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_shadowed_mask_3; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_cfi_idx_valid; // @[frontend.scala 859:11]
  wire [1:0] f4_io_enq_bits_cfi_idx_bits; // @[frontend.scala 859:11]
  wire [2:0] f4_io_enq_bits_cfi_type; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_cfi_is_call; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_cfi_is_ret; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_cfi_npc_plus4; // @[frontend.scala 859:11]
  wire [39:0] f4_io_enq_bits_ras_top; // @[frontend.scala 859:11]
  wire [4:0] f4_io_enq_bits_ftq_idx; // @[frontend.scala 859:11]
  wire [3:0] f4_io_enq_bits_mask; // @[frontend.scala 859:11]
  wire [3:0] f4_io_enq_bits_br_mask; // @[frontend.scala 859:11]
  wire [63:0] f4_io_enq_bits_ghist_old_history; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 859:11]
  wire [4:0] f4_io_enq_bits_ghist_ras_idx; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_lhist_0; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_xcpt_pf_if; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_xcpt_ae_if; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_bp_debug_if_oh_0; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_bp_debug_if_oh_1; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_bp_debug_if_oh_2; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_bp_debug_if_oh_3; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 859:11]
  wire  f4_io_enq_bits_end_half_valid; // @[frontend.scala 859:11]
  wire [15:0] f4_io_enq_bits_end_half_bits; // @[frontend.scala 859:11]
  wire [119:0] f4_io_enq_bits_bpd_meta_0; // @[frontend.scala 859:11]
  wire [1:0] f4_io_enq_bits_fsrc; // @[frontend.scala 859:11]
  wire [1:0] f4_io_enq_bits_tsrc; // @[frontend.scala 859:11]
  wire  f4_io_deq_ready; // @[frontend.scala 859:11]
  wire  f4_io_deq_valid; // @[frontend.scala 859:11]
  wire [39:0] f4_io_deq_bits_pc; // @[frontend.scala 859:11]
  wire [39:0] f4_io_deq_bits_next_pc; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_edge_inst_0; // @[frontend.scala 859:11]
  wire [31:0] f4_io_deq_bits_insts_0; // @[frontend.scala 859:11]
  wire [31:0] f4_io_deq_bits_insts_1; // @[frontend.scala 859:11]
  wire [31:0] f4_io_deq_bits_insts_2; // @[frontend.scala 859:11]
  wire [31:0] f4_io_deq_bits_insts_3; // @[frontend.scala 859:11]
  wire [31:0] f4_io_deq_bits_exp_insts_0; // @[frontend.scala 859:11]
  wire [31:0] f4_io_deq_bits_exp_insts_1; // @[frontend.scala 859:11]
  wire [31:0] f4_io_deq_bits_exp_insts_2; // @[frontend.scala 859:11]
  wire [31:0] f4_io_deq_bits_exp_insts_3; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_sfbs_0; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_sfbs_1; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_sfbs_2; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_sfbs_3; // @[frontend.scala 859:11]
  wire [7:0] f4_io_deq_bits_sfb_masks_0; // @[frontend.scala 859:11]
  wire [7:0] f4_io_deq_bits_sfb_masks_1; // @[frontend.scala 859:11]
  wire [7:0] f4_io_deq_bits_sfb_masks_2; // @[frontend.scala 859:11]
  wire [7:0] f4_io_deq_bits_sfb_masks_3; // @[frontend.scala 859:11]
  wire [3:0] f4_io_deq_bits_sfb_dests_0; // @[frontend.scala 859:11]
  wire [3:0] f4_io_deq_bits_sfb_dests_1; // @[frontend.scala 859:11]
  wire [3:0] f4_io_deq_bits_sfb_dests_2; // @[frontend.scala 859:11]
  wire [3:0] f4_io_deq_bits_sfb_dests_3; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_shadowable_mask_0; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_shadowable_mask_1; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_shadowable_mask_2; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_shadowable_mask_3; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_shadowed_mask_0; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_shadowed_mask_1; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_shadowed_mask_2; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_shadowed_mask_3; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_cfi_idx_valid; // @[frontend.scala 859:11]
  wire [1:0] f4_io_deq_bits_cfi_idx_bits; // @[frontend.scala 859:11]
  wire [2:0] f4_io_deq_bits_cfi_type; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_cfi_is_call; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_cfi_is_ret; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_cfi_npc_plus4; // @[frontend.scala 859:11]
  wire [39:0] f4_io_deq_bits_ras_top; // @[frontend.scala 859:11]
  wire [4:0] f4_io_deq_bits_ftq_idx; // @[frontend.scala 859:11]
  wire [3:0] f4_io_deq_bits_mask; // @[frontend.scala 859:11]
  wire [3:0] f4_io_deq_bits_br_mask; // @[frontend.scala 859:11]
  wire [63:0] f4_io_deq_bits_ghist_old_history; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 859:11]
  wire [4:0] f4_io_deq_bits_ghist_ras_idx; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_lhist_0; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_xcpt_pf_if; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_xcpt_ae_if; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_bp_debug_if_oh_0; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_bp_debug_if_oh_1; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_bp_debug_if_oh_2; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_bp_debug_if_oh_3; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 859:11]
  wire  f4_io_deq_bits_end_half_valid; // @[frontend.scala 859:11]
  wire [15:0] f4_io_deq_bits_end_half_bits; // @[frontend.scala 859:11]
  wire [119:0] f4_io_deq_bits_bpd_meta_0; // @[frontend.scala 859:11]
  wire [1:0] f4_io_deq_bits_fsrc; // @[frontend.scala 859:11]
  wire [1:0] f4_io_deq_bits_tsrc; // @[frontend.scala 859:11]
  wire  f4_io_count; // @[frontend.scala 859:11]
  wire  fb_clock; // @[frontend.scala 861:19]
  wire  fb_reset; // @[frontend.scala 861:19]
  wire  fb_io_enq_ready; // @[frontend.scala 861:19]
  wire  fb_io_enq_valid; // @[frontend.scala 861:19]
  wire [39:0] fb_io_enq_bits_pc; // @[frontend.scala 861:19]
  wire [39:0] fb_io_enq_bits_next_pc; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_edge_inst_0; // @[frontend.scala 861:19]
  wire [31:0] fb_io_enq_bits_insts_0; // @[frontend.scala 861:19]
  wire [31:0] fb_io_enq_bits_insts_1; // @[frontend.scala 861:19]
  wire [31:0] fb_io_enq_bits_insts_2; // @[frontend.scala 861:19]
  wire [31:0] fb_io_enq_bits_insts_3; // @[frontend.scala 861:19]
  wire [31:0] fb_io_enq_bits_exp_insts_0; // @[frontend.scala 861:19]
  wire [31:0] fb_io_enq_bits_exp_insts_1; // @[frontend.scala 861:19]
  wire [31:0] fb_io_enq_bits_exp_insts_2; // @[frontend.scala 861:19]
  wire [31:0] fb_io_enq_bits_exp_insts_3; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_sfbs_0; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_sfbs_1; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_sfbs_2; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_sfbs_3; // @[frontend.scala 861:19]
  wire [7:0] fb_io_enq_bits_sfb_masks_0; // @[frontend.scala 861:19]
  wire [7:0] fb_io_enq_bits_sfb_masks_1; // @[frontend.scala 861:19]
  wire [7:0] fb_io_enq_bits_sfb_masks_2; // @[frontend.scala 861:19]
  wire [7:0] fb_io_enq_bits_sfb_masks_3; // @[frontend.scala 861:19]
  wire [3:0] fb_io_enq_bits_sfb_dests_0; // @[frontend.scala 861:19]
  wire [3:0] fb_io_enq_bits_sfb_dests_1; // @[frontend.scala 861:19]
  wire [3:0] fb_io_enq_bits_sfb_dests_2; // @[frontend.scala 861:19]
  wire [3:0] fb_io_enq_bits_sfb_dests_3; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_shadowable_mask_0; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_shadowable_mask_1; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_shadowable_mask_2; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_shadowable_mask_3; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_shadowed_mask_0; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_shadowed_mask_1; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_shadowed_mask_2; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_shadowed_mask_3; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_cfi_idx_valid; // @[frontend.scala 861:19]
  wire [1:0] fb_io_enq_bits_cfi_idx_bits; // @[frontend.scala 861:19]
  wire [2:0] fb_io_enq_bits_cfi_type; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_cfi_is_call; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_cfi_is_ret; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_cfi_npc_plus4; // @[frontend.scala 861:19]
  wire [39:0] fb_io_enq_bits_ras_top; // @[frontend.scala 861:19]
  wire [4:0] fb_io_enq_bits_ftq_idx; // @[frontend.scala 861:19]
  wire [3:0] fb_io_enq_bits_mask; // @[frontend.scala 861:19]
  wire [3:0] fb_io_enq_bits_br_mask; // @[frontend.scala 861:19]
  wire [63:0] fb_io_enq_bits_ghist_old_history; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 861:19]
  wire [4:0] fb_io_enq_bits_ghist_ras_idx; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_lhist_0; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_xcpt_pf_if; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_xcpt_ae_if; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_bp_debug_if_oh_0; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_bp_debug_if_oh_1; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_bp_debug_if_oh_2; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_bp_debug_if_oh_3; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 861:19]
  wire  fb_io_enq_bits_end_half_valid; // @[frontend.scala 861:19]
  wire [15:0] fb_io_enq_bits_end_half_bits; // @[frontend.scala 861:19]
  wire [119:0] fb_io_enq_bits_bpd_meta_0; // @[frontend.scala 861:19]
  wire [1:0] fb_io_enq_bits_fsrc; // @[frontend.scala 861:19]
  wire [1:0] fb_io_enq_bits_tsrc; // @[frontend.scala 861:19]
  wire  fb_io_deq_ready; // @[frontend.scala 861:19]
  wire  fb_io_deq_valid; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_valid; // @[frontend.scala 861:19]
  wire [6:0] fb_io_deq_bits_uops_0_bits_uopc; // @[frontend.scala 861:19]
  wire [31:0] fb_io_deq_bits_uops_0_bits_inst; // @[frontend.scala 861:19]
  wire [31:0] fb_io_deq_bits_uops_0_bits_debug_inst; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_is_rvc; // @[frontend.scala 861:19]
  wire [39:0] fb_io_deq_bits_uops_0_bits_debug_pc; // @[frontend.scala 861:19]
  wire [2:0] fb_io_deq_bits_uops_0_bits_iq_type; // @[frontend.scala 861:19]
  wire [9:0] fb_io_deq_bits_uops_0_bits_fu_code; // @[frontend.scala 861:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_ctrl_br_type; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_ctrl_op1_sel; // @[frontend.scala 861:19]
  wire [2:0] fb_io_deq_bits_uops_0_bits_ctrl_op2_sel; // @[frontend.scala 861:19]
  wire [2:0] fb_io_deq_bits_uops_0_bits_ctrl_imm_sel; // @[frontend.scala 861:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_ctrl_op_fcn; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_ctrl_fcn_dw; // @[frontend.scala 861:19]
  wire [2:0] fb_io_deq_bits_uops_0_bits_ctrl_csr_cmd; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_ctrl_is_load; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_ctrl_is_sta; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_ctrl_is_std; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_iw_state; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_iw_p1_poisoned; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_iw_p2_poisoned; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_is_br; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_is_jalr; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_is_jal; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_is_sfb; // @[frontend.scala 861:19]
  wire [11:0] fb_io_deq_bits_uops_0_bits_br_mask; // @[frontend.scala 861:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_br_tag; // @[frontend.scala 861:19]
  wire [4:0] fb_io_deq_bits_uops_0_bits_ftq_idx; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_edge_inst; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_pc_lob; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_taken; // @[frontend.scala 861:19]
  wire [19:0] fb_io_deq_bits_uops_0_bits_imm_packed; // @[frontend.scala 861:19]
  wire [11:0] fb_io_deq_bits_uops_0_bits_csr_addr; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_rob_idx; // @[frontend.scala 861:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_ldq_idx; // @[frontend.scala 861:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_stq_idx; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_rxq_idx; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_pdst; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_prs1; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_prs2; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_prs3; // @[frontend.scala 861:19]
  wire [4:0] fb_io_deq_bits_uops_0_bits_ppred; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_prs1_busy; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_prs2_busy; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_prs3_busy; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_ppred_busy; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_stale_pdst; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_exception; // @[frontend.scala 861:19]
  wire [63:0] fb_io_deq_bits_uops_0_bits_exc_cause; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_bypassable; // @[frontend.scala 861:19]
  wire [4:0] fb_io_deq_bits_uops_0_bits_mem_cmd; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_mem_size; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_mem_signed; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_is_fence; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_is_fencei; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_is_amo; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_uses_ldq; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_uses_stq; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_is_sys_pc2epc; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_is_unique; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_flush_on_commit; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_ldst_is_rs1; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_ldst; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_lrs1; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_lrs2; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_lrs3; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_ldst_val; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_dst_rtype; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_lrs1_rtype; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_lrs2_rtype; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_frs3_en; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_fp_val; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_fp_single; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_xcpt_pf_if; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_xcpt_ae_if; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_xcpt_ma_if; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_bp_debug_if; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_0_bits_bp_xcpt_if; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_debug_fsrc; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_debug_tsrc; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_valid; // @[frontend.scala 861:19]
  wire [6:0] fb_io_deq_bits_uops_1_bits_uopc; // @[frontend.scala 861:19]
  wire [31:0] fb_io_deq_bits_uops_1_bits_inst; // @[frontend.scala 861:19]
  wire [31:0] fb_io_deq_bits_uops_1_bits_debug_inst; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_is_rvc; // @[frontend.scala 861:19]
  wire [39:0] fb_io_deq_bits_uops_1_bits_debug_pc; // @[frontend.scala 861:19]
  wire [2:0] fb_io_deq_bits_uops_1_bits_iq_type; // @[frontend.scala 861:19]
  wire [9:0] fb_io_deq_bits_uops_1_bits_fu_code; // @[frontend.scala 861:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_ctrl_br_type; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_ctrl_op1_sel; // @[frontend.scala 861:19]
  wire [2:0] fb_io_deq_bits_uops_1_bits_ctrl_op2_sel; // @[frontend.scala 861:19]
  wire [2:0] fb_io_deq_bits_uops_1_bits_ctrl_imm_sel; // @[frontend.scala 861:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_ctrl_op_fcn; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_ctrl_fcn_dw; // @[frontend.scala 861:19]
  wire [2:0] fb_io_deq_bits_uops_1_bits_ctrl_csr_cmd; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_ctrl_is_load; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_ctrl_is_sta; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_ctrl_is_std; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_iw_state; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_iw_p1_poisoned; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_iw_p2_poisoned; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_is_br; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_is_jalr; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_is_jal; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_is_sfb; // @[frontend.scala 861:19]
  wire [11:0] fb_io_deq_bits_uops_1_bits_br_mask; // @[frontend.scala 861:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_br_tag; // @[frontend.scala 861:19]
  wire [4:0] fb_io_deq_bits_uops_1_bits_ftq_idx; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_edge_inst; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_pc_lob; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_taken; // @[frontend.scala 861:19]
  wire [19:0] fb_io_deq_bits_uops_1_bits_imm_packed; // @[frontend.scala 861:19]
  wire [11:0] fb_io_deq_bits_uops_1_bits_csr_addr; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_rob_idx; // @[frontend.scala 861:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_ldq_idx; // @[frontend.scala 861:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_stq_idx; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_rxq_idx; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_pdst; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_prs1; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_prs2; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_prs3; // @[frontend.scala 861:19]
  wire [4:0] fb_io_deq_bits_uops_1_bits_ppred; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_prs1_busy; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_prs2_busy; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_prs3_busy; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_ppred_busy; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_stale_pdst; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_exception; // @[frontend.scala 861:19]
  wire [63:0] fb_io_deq_bits_uops_1_bits_exc_cause; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_bypassable; // @[frontend.scala 861:19]
  wire [4:0] fb_io_deq_bits_uops_1_bits_mem_cmd; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_mem_size; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_mem_signed; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_is_fence; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_is_fencei; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_is_amo; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_uses_ldq; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_uses_stq; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_is_sys_pc2epc; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_is_unique; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_flush_on_commit; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_ldst_is_rs1; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_ldst; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_lrs1; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_lrs2; // @[frontend.scala 861:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_lrs3; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_ldst_val; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_dst_rtype; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_lrs1_rtype; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_lrs2_rtype; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_frs3_en; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_fp_val; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_fp_single; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_xcpt_pf_if; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_xcpt_ae_if; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_xcpt_ma_if; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_bp_debug_if; // @[frontend.scala 861:19]
  wire  fb_io_deq_bits_uops_1_bits_bp_xcpt_if; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_debug_fsrc; // @[frontend.scala 861:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_debug_tsrc; // @[frontend.scala 861:19]
  wire  fb_io_clear; // @[frontend.scala 861:19]
  wire  ftq_clock; // @[frontend.scala 862:19]
  wire  ftq_reset; // @[frontend.scala 862:19]
  wire  ftq_io_enq_ready; // @[frontend.scala 862:19]
  wire  ftq_io_enq_valid; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_enq_bits_pc; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_enq_bits_next_pc; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_edge_inst_0; // @[frontend.scala 862:19]
  wire [31:0] ftq_io_enq_bits_insts_0; // @[frontend.scala 862:19]
  wire [31:0] ftq_io_enq_bits_insts_1; // @[frontend.scala 862:19]
  wire [31:0] ftq_io_enq_bits_insts_2; // @[frontend.scala 862:19]
  wire [31:0] ftq_io_enq_bits_insts_3; // @[frontend.scala 862:19]
  wire [31:0] ftq_io_enq_bits_exp_insts_0; // @[frontend.scala 862:19]
  wire [31:0] ftq_io_enq_bits_exp_insts_1; // @[frontend.scala 862:19]
  wire [31:0] ftq_io_enq_bits_exp_insts_2; // @[frontend.scala 862:19]
  wire [31:0] ftq_io_enq_bits_exp_insts_3; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_sfbs_0; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_sfbs_1; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_sfbs_2; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_sfbs_3; // @[frontend.scala 862:19]
  wire [7:0] ftq_io_enq_bits_sfb_masks_0; // @[frontend.scala 862:19]
  wire [7:0] ftq_io_enq_bits_sfb_masks_1; // @[frontend.scala 862:19]
  wire [7:0] ftq_io_enq_bits_sfb_masks_2; // @[frontend.scala 862:19]
  wire [7:0] ftq_io_enq_bits_sfb_masks_3; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_enq_bits_sfb_dests_0; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_enq_bits_sfb_dests_1; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_enq_bits_sfb_dests_2; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_enq_bits_sfb_dests_3; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_shadowable_mask_0; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_shadowable_mask_1; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_shadowable_mask_2; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_shadowable_mask_3; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_shadowed_mask_0; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_shadowed_mask_1; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_shadowed_mask_2; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_shadowed_mask_3; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_cfi_idx_valid; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_enq_bits_cfi_idx_bits; // @[frontend.scala 862:19]
  wire [2:0] ftq_io_enq_bits_cfi_type; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_cfi_is_call; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_cfi_is_ret; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_cfi_npc_plus4; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_enq_bits_ras_top; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_enq_bits_ftq_idx; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_enq_bits_mask; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_enq_bits_br_mask; // @[frontend.scala 862:19]
  wire [63:0] ftq_io_enq_bits_ghist_old_history; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_enq_bits_ghist_ras_idx; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_lhist_0; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_xcpt_pf_if; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_xcpt_ae_if; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_bp_debug_if_oh_0; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_bp_debug_if_oh_1; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_bp_debug_if_oh_2; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_bp_debug_if_oh_3; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 862:19]
  wire  ftq_io_enq_bits_end_half_valid; // @[frontend.scala 862:19]
  wire [15:0] ftq_io_enq_bits_end_half_bits; // @[frontend.scala 862:19]
  wire [119:0] ftq_io_enq_bits_bpd_meta_0; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_enq_bits_fsrc; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_enq_bits_tsrc; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_enq_idx; // @[frontend.scala 862:19]
  wire  ftq_io_deq_valid; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_deq_bits; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_get_ftq_pc_0_ftq_idx; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_idx_valid; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_get_ftq_pc_0_entry_cfi_idx_bits; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_taken; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_mispredicted; // @[frontend.scala 862:19]
  wire [2:0] ftq_io_get_ftq_pc_0_entry_cfi_type; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_get_ftq_pc_0_entry_br_mask; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_is_call; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_is_ret; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_npc_plus4; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_get_ftq_pc_0_entry_ras_top; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_get_ftq_pc_0_entry_ras_idx; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_0_entry_start_bank; // @[frontend.scala 862:19]
  wire [63:0] ftq_io_get_ftq_pc_0_ghist_old_history; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_0_ghist_current_saw_branch_not_taken; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_0_ghist_new_saw_branch_not_taken; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_0_ghist_new_saw_branch_taken; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_get_ftq_pc_0_ghist_ras_idx; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_get_ftq_pc_0_pc; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_get_ftq_pc_0_com_pc; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_0_next_val; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_get_ftq_pc_0_next_pc; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_get_ftq_pc_1_ftq_idx; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_idx_valid; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_get_ftq_pc_1_entry_cfi_idx_bits; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_taken; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_mispredicted; // @[frontend.scala 862:19]
  wire [2:0] ftq_io_get_ftq_pc_1_entry_cfi_type; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_get_ftq_pc_1_entry_br_mask; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_is_call; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_is_ret; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_npc_plus4; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_get_ftq_pc_1_entry_ras_top; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_get_ftq_pc_1_entry_ras_idx; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_1_entry_start_bank; // @[frontend.scala 862:19]
  wire [63:0] ftq_io_get_ftq_pc_1_ghist_old_history; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_1_ghist_current_saw_branch_not_taken; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_1_ghist_new_saw_branch_not_taken; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_1_ghist_new_saw_branch_taken; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_get_ftq_pc_1_ghist_ras_idx; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_get_ftq_pc_1_pc; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_get_ftq_pc_1_com_pc; // @[frontend.scala 862:19]
  wire  ftq_io_get_ftq_pc_1_next_val; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_get_ftq_pc_1_next_pc; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_debug_ftq_idx_0; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_debug_ftq_idx_1; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_debug_fetch_pc_0; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_debug_fetch_pc_1; // @[frontend.scala 862:19]
  wire  ftq_io_redirect_valid; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_redirect_bits; // @[frontend.scala 862:19]
  wire [11:0] ftq_io_brupdate_b1_resolve_mask; // @[frontend.scala 862:19]
  wire [11:0] ftq_io_brupdate_b1_mispredict_mask; // @[frontend.scala 862:19]
  wire [6:0] ftq_io_brupdate_b2_uop_uopc; // @[frontend.scala 862:19]
  wire [31:0] ftq_io_brupdate_b2_uop_inst; // @[frontend.scala 862:19]
  wire [31:0] ftq_io_brupdate_b2_uop_debug_inst; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_is_rvc; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_brupdate_b2_uop_debug_pc; // @[frontend.scala 862:19]
  wire [2:0] ftq_io_brupdate_b2_uop_iq_type; // @[frontend.scala 862:19]
  wire [9:0] ftq_io_brupdate_b2_uop_fu_code; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_brupdate_b2_uop_ctrl_br_type; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_brupdate_b2_uop_ctrl_op1_sel; // @[frontend.scala 862:19]
  wire [2:0] ftq_io_brupdate_b2_uop_ctrl_op2_sel; // @[frontend.scala 862:19]
  wire [2:0] ftq_io_brupdate_b2_uop_ctrl_imm_sel; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_brupdate_b2_uop_ctrl_op_fcn; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_ctrl_fcn_dw; // @[frontend.scala 862:19]
  wire [2:0] ftq_io_brupdate_b2_uop_ctrl_csr_cmd; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_ctrl_is_load; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_ctrl_is_sta; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_ctrl_is_std; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_brupdate_b2_uop_iw_state; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_iw_p1_poisoned; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_iw_p2_poisoned; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_is_br; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_is_jalr; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_is_jal; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_is_sfb; // @[frontend.scala 862:19]
  wire [11:0] ftq_io_brupdate_b2_uop_br_mask; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_brupdate_b2_uop_br_tag; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_brupdate_b2_uop_ftq_idx; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_edge_inst; // @[frontend.scala 862:19]
  wire [5:0] ftq_io_brupdate_b2_uop_pc_lob; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_taken; // @[frontend.scala 862:19]
  wire [19:0] ftq_io_brupdate_b2_uop_imm_packed; // @[frontend.scala 862:19]
  wire [11:0] ftq_io_brupdate_b2_uop_csr_addr; // @[frontend.scala 862:19]
  wire [5:0] ftq_io_brupdate_b2_uop_rob_idx; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_brupdate_b2_uop_ldq_idx; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_brupdate_b2_uop_stq_idx; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_brupdate_b2_uop_rxq_idx; // @[frontend.scala 862:19]
  wire [5:0] ftq_io_brupdate_b2_uop_pdst; // @[frontend.scala 862:19]
  wire [5:0] ftq_io_brupdate_b2_uop_prs1; // @[frontend.scala 862:19]
  wire [5:0] ftq_io_brupdate_b2_uop_prs2; // @[frontend.scala 862:19]
  wire [5:0] ftq_io_brupdate_b2_uop_prs3; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_brupdate_b2_uop_ppred; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_prs1_busy; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_prs2_busy; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_prs3_busy; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_ppred_busy; // @[frontend.scala 862:19]
  wire [5:0] ftq_io_brupdate_b2_uop_stale_pdst; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_exception; // @[frontend.scala 862:19]
  wire [63:0] ftq_io_brupdate_b2_uop_exc_cause; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_bypassable; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_brupdate_b2_uop_mem_cmd; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_brupdate_b2_uop_mem_size; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_mem_signed; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_is_fence; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_is_fencei; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_is_amo; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_uses_ldq; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_uses_stq; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_is_sys_pc2epc; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_is_unique; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_flush_on_commit; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_ldst_is_rs1; // @[frontend.scala 862:19]
  wire [5:0] ftq_io_brupdate_b2_uop_ldst; // @[frontend.scala 862:19]
  wire [5:0] ftq_io_brupdate_b2_uop_lrs1; // @[frontend.scala 862:19]
  wire [5:0] ftq_io_brupdate_b2_uop_lrs2; // @[frontend.scala 862:19]
  wire [5:0] ftq_io_brupdate_b2_uop_lrs3; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_ldst_val; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_brupdate_b2_uop_dst_rtype; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_brupdate_b2_uop_lrs1_rtype; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_brupdate_b2_uop_lrs2_rtype; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_frs3_en; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_fp_val; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_fp_single; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_xcpt_pf_if; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_xcpt_ae_if; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_xcpt_ma_if; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_bp_debug_if; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_uop_bp_xcpt_if; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_brupdate_b2_uop_debug_fsrc; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_brupdate_b2_uop_debug_tsrc; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_valid; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_mispredict; // @[frontend.scala 862:19]
  wire  ftq_io_brupdate_b2_taken; // @[frontend.scala 862:19]
  wire [2:0] ftq_io_brupdate_b2_cfi_type; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_brupdate_b2_pc_sel; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_brupdate_b2_jalr_target; // @[frontend.scala 862:19]
  wire [20:0] ftq_io_brupdate_b2_target_offset; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_valid; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_is_mispredict_update; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_is_repair_update; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_bpdupdate_bits_btb_mispredicts; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_bpdupdate_bits_pc; // @[frontend.scala 862:19]
  wire [3:0] ftq_io_bpdupdate_bits_br_mask; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_cfi_idx_valid; // @[frontend.scala 862:19]
  wire [1:0] ftq_io_bpdupdate_bits_cfi_idx_bits; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_cfi_taken; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_cfi_mispredicted; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_cfi_is_br; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_cfi_is_jal; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_cfi_is_jalr; // @[frontend.scala 862:19]
  wire [63:0] ftq_io_bpdupdate_bits_ghist_old_history; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_ghist_new_saw_branch_taken; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_bpdupdate_bits_ghist_ras_idx; // @[frontend.scala 862:19]
  wire  ftq_io_bpdupdate_bits_lhist_0; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_bpdupdate_bits_target; // @[frontend.scala 862:19]
  wire [119:0] ftq_io_bpdupdate_bits_meta_0; // @[frontend.scala 862:19]
  wire  ftq_io_ras_update; // @[frontend.scala 862:19]
  wire [4:0] ftq_io_ras_update_idx; // @[frontend.scala 862:19]
  wire [39:0] ftq_io_ras_update_pc; // @[frontend.scala 862:19]
  wire  bpd_update_arbiter_clock; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_reset; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_ready; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_valid; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_is_mispredict_update; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_is_repair_update; // @[frontend.scala 925:34]
  wire [3:0] bpd_update_arbiter_io_in_0_bits_btb_mispredicts; // @[frontend.scala 925:34]
  wire [39:0] bpd_update_arbiter_io_in_0_bits_pc; // @[frontend.scala 925:34]
  wire [3:0] bpd_update_arbiter_io_in_0_bits_br_mask; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_idx_valid; // @[frontend.scala 925:34]
  wire [1:0] bpd_update_arbiter_io_in_0_bits_cfi_idx_bits; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_taken; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_mispredicted; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_is_br; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_is_jal; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_is_jalr; // @[frontend.scala 925:34]
  wire [63:0] bpd_update_arbiter_io_in_0_bits_ghist_old_history; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_taken; // @[frontend.scala 925:34]
  wire [4:0] bpd_update_arbiter_io_in_0_bits_ghist_ras_idx; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_0_bits_lhist_0; // @[frontend.scala 925:34]
  wire [39:0] bpd_update_arbiter_io_in_0_bits_target; // @[frontend.scala 925:34]
  wire [119:0] bpd_update_arbiter_io_in_0_bits_meta_0; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_ready; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_valid; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_is_mispredict_update; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_is_repair_update; // @[frontend.scala 925:34]
  wire [3:0] bpd_update_arbiter_io_in_1_bits_btb_mispredicts; // @[frontend.scala 925:34]
  wire [39:0] bpd_update_arbiter_io_in_1_bits_pc; // @[frontend.scala 925:34]
  wire [3:0] bpd_update_arbiter_io_in_1_bits_br_mask; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_idx_valid; // @[frontend.scala 925:34]
  wire [1:0] bpd_update_arbiter_io_in_1_bits_cfi_idx_bits; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_taken; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_mispredicted; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_is_br; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_is_jal; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_is_jalr; // @[frontend.scala 925:34]
  wire [63:0] bpd_update_arbiter_io_in_1_bits_ghist_old_history; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_taken; // @[frontend.scala 925:34]
  wire [4:0] bpd_update_arbiter_io_in_1_bits_ghist_ras_idx; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_in_1_bits_lhist_0; // @[frontend.scala 925:34]
  wire [39:0] bpd_update_arbiter_io_in_1_bits_target; // @[frontend.scala 925:34]
  wire [119:0] bpd_update_arbiter_io_in_1_bits_meta_0; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_ready; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_valid; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_is_mispredict_update; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_is_repair_update; // @[frontend.scala 925:34]
  wire [3:0] bpd_update_arbiter_io_out_bits_btb_mispredicts; // @[frontend.scala 925:34]
  wire [39:0] bpd_update_arbiter_io_out_bits_pc; // @[frontend.scala 925:34]
  wire [3:0] bpd_update_arbiter_io_out_bits_br_mask; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_idx_valid; // @[frontend.scala 925:34]
  wire [1:0] bpd_update_arbiter_io_out_bits_cfi_idx_bits; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_taken; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_mispredicted; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_is_br; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_is_jal; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_is_jalr; // @[frontend.scala 925:34]
  wire [63:0] bpd_update_arbiter_io_out_bits_ghist_old_history; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_taken; // @[frontend.scala 925:34]
  wire [4:0] bpd_update_arbiter_io_out_bits_ghist_ras_idx; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_out_bits_lhist_0; // @[frontend.scala 925:34]
  wire [39:0] bpd_update_arbiter_io_out_bits_target; // @[frontend.scala 925:34]
  wire [119:0] bpd_update_arbiter_io_out_bits_meta_0; // @[frontend.scala 925:34]
  wire  bpd_update_arbiter_io_chosen; // @[frontend.scala 925:34]
  reg  REG; // @[frontend.scala 363:16]
  wire  _T_4 = REG & ~reset; // @[frontend.scala 363:31]
  wire [39:0] _GEN_1 = REG & ~reset ? {{8'd0}, auto_reset_vector_sink_in} : 40'h0; // @[frontend.scala 363:49 frontend.scala 365:16]
  wire [1:0] _GEN_7 = REG & ~reset ? 2'h3 : 2'h0; // @[frontend.scala 363:49 frontend.scala 367:16]
  reg [39:0] s1_vpc; // @[frontend.scala 381:29]
  reg  s1_valid; // @[frontend.scala 382:29]
  reg [63:0] s1_ghist_old_history; // @[frontend.scala 383:29]
  reg  s1_ghist_current_saw_branch_not_taken; // @[frontend.scala 383:29]
  reg  s1_ghist_new_saw_branch_not_taken; // @[frontend.scala 383:29]
  reg  s1_ghist_new_saw_branch_taken; // @[frontend.scala 383:29]
  reg [4:0] s1_ghist_ras_idx; // @[frontend.scala 383:29]
  reg  s1_is_replay; // @[frontend.scala 384:29]
  reg  s1_is_sfence; // @[frontend.scala 385:29]
  reg [1:0] s1_tsrc; // @[frontend.scala 387:29]
  wire  _T_5 = ~s1_is_replay; // @[frontend.scala 388:41]
  wire  f4_ready = f4_io_enq_ready; // @[frontend.scala 526:22 frontend.scala 907:12]
  reg  s2_valid; // @[frontend.scala 440:25]
  reg [39:0] s2_vpc; // @[frontend.scala 441:25]
  wire  f3_mask_0 = f3_io_deq_valid & f3_io_deq_bits_mask[0]; // @[frontend.scala 690:39]
  reg  f3_prev_is_half; // @[frontend.scala 589:32]
  wire [2:0] f3_cfi_types_0 = f3_prev_is_half ? BranchDecode_io_out_cfi_type : BranchDecode_1_io_out_cfi_type; // @[frontend.scala 629:34 frontend.scala 634:40 frontend.scala 655:40]
  wire  _T_324 = f3_cfi_types_0 == 3'h2; // @[frontend.scala 732:25]
  wire  _T_325 = f3_cfi_types_0 == 3'h3; // @[frontend.scala 732:56]
  wire  _T_327 = f3_cfi_types_0 == 3'h1; // @[frontend.scala 733:26]
  wire  _T_328 = f3_cfi_types_0 == 3'h1 & f3_bpd_resp_io_deq_bits_preds_0_taken; // @[frontend.scala 733:37]
  wire  _T_330 = f3_cfi_types_0 == 3'h2 | f3_cfi_types_0 == 3'h3 | _T_328; // @[frontend.scala 732:69]
  wire  f3_redirects_0 = f3_mask_0 & _T_330; // @[frontend.scala 731:40]
  wire [63:0] _T_227 = f3_io_deq_bits_data; // @[frontend.scala 598:29]
  wire [15:0] hi_4 = _T_227[15:0]; // @[frontend.scala 615:34]
  reg [15:0] f3_prev_half; // @[frontend.scala 587:28]
  wire [31:0] _T_228 = {hi_4,f3_prev_half}; // @[Cat.scala 30:58]
  wire [31:0] f3_fetch_bundle_insts_0 = f3_prev_is_half ? _T_228 : _T_227[31:0]; // @[frontend.scala 629:34 frontend.scala 630:40 frontend.scala 651:40]
  wire  _T_340 = f3_fetch_bundle_insts_0[1:0] != 2'h3; // @[frontend.scala 592:38]
  wire  _T_341 = ~_T_340; // @[frontend.scala 675:59]
  wire  _T_344 = f3_prev_is_half | ~(f3_mask_0 & ~_T_340); // @[frontend.scala 675:38]
  wire  f3_mask_1 = f3_io_deq_valid & f3_io_deq_bits_mask[1] & _T_344 & ~f3_redirects_0; // @[frontend.scala 690:71]
  wire [2:0] f3_cfi_types_1 = BranchDecode_2_io_out_cfi_type; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  _T_429 = f3_cfi_types_1 == 3'h2; // @[frontend.scala 732:25]
  wire  _T_430 = f3_cfi_types_1 == 3'h3; // @[frontend.scala 732:56]
  wire  _T_432 = f3_cfi_types_1 == 3'h1; // @[frontend.scala 733:26]
  wire  _T_433 = f3_cfi_types_1 == 3'h1 & f3_bpd_resp_io_deq_bits_preds_1_taken; // @[frontend.scala 733:37]
  wire  _T_435 = f3_cfi_types_1 == 3'h2 | f3_cfi_types_1 == 3'h3 | _T_433; // @[frontend.scala 732:69]
  wire  f3_redirects_1 = f3_mask_1 & _T_435; // @[frontend.scala 731:40]
  wire  _T_672 = f3_redirects_0 | f3_redirects_1; // @[frontend.scala 784:54]
  wire [31:0] f3_fetch_bundle_insts_1 = _T_227[47:16]; // @[frontend.scala 674:29]
  wire  _T_445 = f3_fetch_bundle_insts_1[1:0] != 2'h3; // @[frontend.scala 592:38]
  wire  _T_446 = ~_T_445; // @[frontend.scala 682:40]
  wire  _T_448 = ~(f3_mask_1 & ~_T_445); // @[frontend.scala 682:20]
  wire  f3_mask_2 = f3_io_deq_valid & f3_io_deq_bits_mask[2] & _T_448 & ~_T_672; // @[frontend.scala 690:71]
  wire [2:0] f3_cfi_types_2 = BranchDecode_3_io_out_cfi_type; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  _T_533 = f3_cfi_types_2 == 3'h2; // @[frontend.scala 732:25]
  wire  _T_534 = f3_cfi_types_2 == 3'h3; // @[frontend.scala 732:56]
  wire  _T_536 = f3_cfi_types_2 == 3'h1; // @[frontend.scala 733:26]
  wire  _T_537 = f3_cfi_types_2 == 3'h1 & f3_bpd_resp_io_deq_bits_preds_2_taken; // @[frontend.scala 733:37]
  wire  _T_539 = f3_cfi_types_2 == 3'h2 | f3_cfi_types_2 == 3'h3 | _T_537; // @[frontend.scala 732:69]
  wire  f3_redirects_2 = f3_mask_2 & _T_539; // @[frontend.scala 731:40]
  wire  _T_673 = f3_redirects_0 | f3_redirects_1 | f3_redirects_2; // @[frontend.scala 784:54]
  wire [31:0] f3_fetch_bundle_insts_2 = _T_227[63:32]; // @[frontend.scala 681:29]
  wire  _T_549 = f3_fetch_bundle_insts_2[1:0] != 2'h3; // @[frontend.scala 592:38]
  wire  _T_550 = ~_T_549; // @[frontend.scala 678:41]
  wire  _T_551 = f3_mask_2 & ~_T_549; // @[frontend.scala 678:38]
  wire [15:0] lo_4 = _T_227[63:48]; // @[frontend.scala 677:44]
  wire [31:0] f3_fetch_bundle_insts_3 = {16'h0,lo_4}; // @[Cat.scala 30:58]
  wire  _T_553 = f3_fetch_bundle_insts_3[1:0] != 2'h3; // @[frontend.scala 592:38]
  wire  _T_554 = ~_T_553; // @[frontend.scala 679:13]
  wire  _T_556 = ~(f3_mask_2 & ~_T_549 | _T_554); // @[frontend.scala 678:20]
  wire  f3_mask_3 = f3_io_deq_valid & f3_io_deq_bits_mask[3] & _T_556 & ~_T_673; // @[frontend.scala 690:71]
  wire [2:0] f3_cfi_types_3 = BranchDecode_4_io_out_cfi_type; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  _T_641 = f3_cfi_types_3 == 3'h2; // @[frontend.scala 732:25]
  wire  _T_642 = f3_cfi_types_3 == 3'h3; // @[frontend.scala 732:56]
  wire  _T_644 = f3_cfi_types_3 == 3'h1; // @[frontend.scala 733:26]
  wire  _T_645 = f3_cfi_types_3 == 3'h1 & f3_bpd_resp_io_deq_bits_preds_3_taken; // @[frontend.scala 733:37]
  wire  _T_647 = f3_cfi_types_3 == 3'h2 | f3_cfi_types_3 == 3'h3 | _T_645; // @[frontend.scala 732:69]
  wire  f3_redirects_3 = f3_mask_3 & _T_647; // @[frontend.scala 731:40]
  wire  _T_674 = f3_redirects_0 | f3_redirects_1 | f3_redirects_2 | f3_redirects_3; // @[frontend.scala 784:54]
  wire [1:0] _T_669 = f3_redirects_2 ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _T_670 = f3_redirects_1 ? 2'h1 : _T_669; // @[Mux.scala 47:69]
  wire [1:0] f3_fetch_bundle_cfi_idx_bits = f3_redirects_0 ? 2'h0 : _T_670; // @[Mux.scala 47:69]
  wire  f3_ret_mask_3 = BranchDecode_4_io_out_is_ret; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  f3_ret_mask_2 = BranchDecode_3_io_out_is_ret; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  f3_ret_mask_1 = BranchDecode_2_io_out_is_ret; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  f3_ret_mask_0 = f3_prev_is_half ? BranchDecode_io_out_is_ret : BranchDecode_1_io_out_is_ret; // @[frontend.scala 629:34 frontend.scala 634:40 frontend.scala 655:40]
  wire  _GEN_104 = 2'h1 == f3_fetch_bundle_cfi_idx_bits ? f3_ret_mask_1 : f3_ret_mask_0; // @[frontend.scala 757:33 frontend.scala 757:33]
  wire  _GEN_105 = 2'h2 == f3_fetch_bundle_cfi_idx_bits ? f3_ret_mask_2 : _GEN_104; // @[frontend.scala 757:33 frontend.scala 757:33]
  wire  f3_fetch_bundle_cfi_is_ret = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_ret_mask_3 : _GEN_105; // @[frontend.scala 757:33 frontend.scala 757:33]
  wire [39:0] _WIRE_19_target = BranchDecode_4_io_out_target; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire [39:0] f3_targs_3 = _T_642 ? f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits : _WIRE_19_target; // @[frontend.scala 691:26]
  wire [39:0] _WIRE_14_target = BranchDecode_3_io_out_target; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire [39:0] f3_targs_2 = _T_534 ? f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits : _WIRE_14_target; // @[frontend.scala 691:26]
  wire [39:0] _WIRE_9_target = BranchDecode_2_io_out_target; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire [39:0] f3_targs_1 = _T_430 ? f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits : _WIRE_9_target; // @[frontend.scala 691:26]
  wire [39:0] _GEN_91 = f3_prev_is_half ? BranchDecode_io_out_target : BranchDecode_1_io_out_target; // @[frontend.scala 629:34 frontend.scala 634:40 frontend.scala 655:40]
  wire [39:0] f3_targs_0 = _T_325 ? f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits : _GEN_91; // @[frontend.scala 691:26]
  wire [39:0] _GEN_115 = 2'h1 == f3_fetch_bundle_cfi_idx_bits ? f3_targs_1 : f3_targs_0; // @[frontend.scala 785:8 frontend.scala 785:8]
  wire [39:0] _GEN_116 = 2'h2 == f3_fetch_bundle_cfi_idx_bits ? f3_targs_2 : _GEN_115; // @[frontend.scala 785:8 frontend.scala 785:8]
  wire [39:0] _GEN_117 = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_targs_3 : _GEN_116; // @[frontend.scala 785:8 frontend.scala 785:8]
  wire [39:0] _T_680 = f3_fetch_bundle_cfi_is_ret ? ras_io_read_addr : _GEN_117; // @[frontend.scala 785:8]
  wire [39:0] f3_fetch_bundle_pc = f3_io_deq_bits_pc; // @[frontend.scala 569:29 frontend.scala 578:22]
  wire [39:0] _T_681 = ~f3_fetch_bundle_pc; // @[frontend.scala 161:33]
  wire [39:0] _T_682 = _T_681 | 40'h7; // @[frontend.scala 161:39]
  wire [39:0] _T_683 = ~_T_682; // @[frontend.scala 161:31]
  wire [39:0] _T_685 = _T_683 + 40'h8; // @[frontend.scala 168:23]
  wire [39:0] f3_predicted_target = f3_redirects_0 | f3_redirects_1 | f3_redirects_2 | f3_redirects_3 ? _T_680 : _T_685; // @[frontend.scala 784:32]
  reg [63:0] s2_ghist_old_history; // @[frontend.scala 442:21]
  wire  f3_br_mask_3 = f3_mask_3 & _T_644; // @[frontend.scala 736:37]
  wire  f3_br_mask_2 = f3_mask_2 & _T_536; // @[frontend.scala 736:37]
  wire [1:0] hi_3 = {f3_br_mask_3,f3_br_mask_2}; // @[frontend.scala 577:41]
  wire  f3_br_mask_1 = f3_mask_1 & _T_432; // @[frontend.scala 736:37]
  wire  f3_br_mask_0 = f3_mask_0 & _T_327; // @[frontend.scala 736:37]
  wire [1:0] lo_3 = {f3_br_mask_1,f3_br_mask_0}; // @[frontend.scala 577:41]
  wire [3:0] f3_fetch_bundle_br_mask = {f3_br_mask_3,f3_br_mask_2,f3_br_mask_1,f3_br_mask_0}; // @[frontend.scala 577:41]
  wire [3:0] _T_686 = f3_fetch_bundle_br_mask >> f3_fetch_bundle_cfi_idx_bits; // @[frontend.scala 796:28]
  wire  _T_706 = _T_686[0] & _T_674; // @[frontend.scala 99:48]
  wire [63:0] f3_fetch_bundle_ghist_old_history = f3_io_deq_bits_ghist_old_history; // @[frontend.scala 569:29 frontend.scala 760:28]
  wire [64:0] _T_708 = {f3_fetch_bundle_ghist_old_history, 1'h0}; // @[frontend.scala 99:91]
  wire [64:0] _T_709 = _T_708 | 65'h1; // @[frontend.scala 99:96]
  wire [3:0] _T_689 = 4'h1 << f3_fetch_bundle_cfi_idx_bits; // @[OneHot.scala 58:35]
  wire [3:0] _T_691 = {{1'd0}, _T_689[3:1]}; // @[util.scala 373:29]
  wire [3:0] _T_694 = _T_689 | _T_691; // @[util.scala 373:45]
  wire [3:0] _T_692 = {{2'd0}, _T_689[3:2]}; // @[util.scala 373:29]
  wire [3:0] _T_695 = _T_694 | _T_692; // @[util.scala 373:45]
  wire [3:0] _T_693 = {{3'd0}, _T_689[3]}; // @[util.scala 373:29]
  wire [3:0] _T_696 = _T_695 | _T_693; // @[util.scala 373:45]
  wire [3:0] _T_698 = _T_706 ? _T_689 : 4'h0; // @[frontend.scala 91:73]
  wire [3:0] _T_699 = ~_T_698; // @[frontend.scala 91:69]
  wire [3:0] _T_700 = _T_696 & _T_699; // @[frontend.scala 91:67]
  wire [3:0] _T_702 = _T_674 ? _T_700 : 4'hf; // @[frontend.scala 90:44]
  wire [3:0] _T_703 = f3_fetch_bundle_br_mask & _T_702; // @[frontend.scala 90:39]
  wire  f3_fetch_bundle_ghist_current_saw_branch_not_taken = f3_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 569:29 frontend.scala 760:28]
  wire  _T_705 = _T_703 != 4'h0 | f3_fetch_bundle_ghist_current_saw_branch_not_taken; // @[frontend.scala 98:61]
  wire [64:0] _T_711 = _T_705 ? _T_708 : {{1'd0}, f3_fetch_bundle_ghist_old_history}; // @[frontend.scala 100:37]
  wire [64:0] _T_712 = _T_686[0] & _T_674 & _T_674 ? _T_709 : _T_711; // @[frontend.scala 99:37]
  wire [63:0] f3_predicted_ghist_old_history = _T_712[63:0]; // @[frontend.scala 88:27 frontend.scala 99:31]
  reg  s2_ghist_new_saw_branch_not_taken; // @[frontend.scala 442:21]
  wire  _T_739 = ~s2_ghist_new_saw_branch_not_taken; // @[frontend.scala 77:32]
  wire  _T_740 = s2_ghist_old_history == f3_predicted_ghist_old_history & _T_739; // @[frontend.scala 76:42]
  reg  s2_ghist_new_saw_branch_taken; // @[frontend.scala 442:21]
  wire  _T_741 = ~s2_ghist_new_saw_branch_taken; // @[frontend.scala 78:28]
  wire  _T_742 = _T_740 & _T_741; // @[frontend.scala 77:68]
  wire  f3_correct_f2_ghist = ~_T_742; // @[frontend.scala 81:41]
  wire  f3_ready = f3_io_enq_ready; // @[frontend.scala 452:22 frontend.scala 527:12]
  wire  _T_180 = s2_valid & icache_io_resp_valid & ~f3_ready; // @[frontend.scala 482:43]
  wire  _T_181 = s2_valid & ~icache_io_resp_valid | _T_180; // @[frontend.scala 481:45]
  wire [6:0] f2_mask = 7'hf << s2_vpc[2:1]; // @[frontend.scala 178:31]
  wire  _T_99 = bpd_io_resp_f2_preds_0_is_br & bpd_io_resp_f2_preds_0_taken; // @[frontend.scala 461:35]
  wire  _T_100 = bpd_io_resp_f2_preds_0_is_jal | _T_99; // @[frontend.scala 460:34]
  wire  f2_redirects_0 = s2_valid & f2_mask[0] & bpd_io_resp_f2_preds_0_predicted_pc_valid & _T_100; // @[frontend.scala 459:71]
  wire  _T_104 = bpd_io_resp_f2_preds_1_is_br & bpd_io_resp_f2_preds_1_taken; // @[frontend.scala 461:35]
  wire  _T_105 = bpd_io_resp_f2_preds_1_is_jal | _T_104; // @[frontend.scala 460:34]
  wire  f2_redirects_1 = s2_valid & f2_mask[1] & bpd_io_resp_f2_preds_1_predicted_pc_valid & _T_105; // @[frontend.scala 459:71]
  wire  _T_109 = bpd_io_resp_f2_preds_2_is_br & bpd_io_resp_f2_preds_2_taken; // @[frontend.scala 461:35]
  wire  _T_110 = bpd_io_resp_f2_preds_2_is_jal | _T_109; // @[frontend.scala 460:34]
  wire  f2_redirects_2 = s2_valid & f2_mask[2] & bpd_io_resp_f2_preds_2_predicted_pc_valid & _T_110; // @[frontend.scala 459:71]
  wire  _T_114 = bpd_io_resp_f2_preds_3_is_br & bpd_io_resp_f2_preds_3_taken; // @[frontend.scala 461:35]
  wire  _T_115 = bpd_io_resp_f2_preds_3_is_jal | _T_114; // @[frontend.scala 460:34]
  wire  f2_redirects_3 = s2_valid & f2_mask[3] & bpd_io_resp_f2_preds_3_predicted_pc_valid & _T_115; // @[frontend.scala 459:71]
  wire  f2_do_redirect = f2_redirects_0 | f2_redirects_1 | f2_redirects_2 | f2_redirects_3; // @[frontend.scala 465:45]
  wire [1:0] _T_116 = f2_redirects_2 ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _T_117 = f2_redirects_1 ? 2'h1 : _T_116; // @[Mux.scala 47:69]
  wire [1:0] f2_redirect_idx = f2_redirects_0 ? 2'h0 : _T_117; // @[Mux.scala 47:69]
  wire [39:0] _T_122 = f2_redirect_idx == 2'h1 ? bpd_io_resp_f2_preds_1_predicted_pc_bits :
    bpd_io_resp_f2_preds_0_predicted_pc_bits; // @[package.scala 32:76]
  wire [39:0] _T_124 = f2_redirect_idx == 2'h2 ? bpd_io_resp_f2_preds_2_predicted_pc_bits : _T_122; // @[package.scala 32:76]
  wire [39:0] _T_126 = f2_redirect_idx == 2'h3 ? bpd_io_resp_f2_preds_3_predicted_pc_bits : _T_124; // @[package.scala 32:76]
  wire [39:0] _T_127 = ~s2_vpc; // @[frontend.scala 161:33]
  wire [39:0] _T_128 = _T_127 | 40'h7; // @[frontend.scala 161:39]
  wire [39:0] _T_129 = ~_T_128; // @[frontend.scala 161:31]
  wire [39:0] _T_131 = _T_129 + 40'h8; // @[frontend.scala 168:23]
  wire [39:0] f2_predicted_target = f2_do_redirect ? _T_126 : _T_131; // @[frontend.scala 466:32]
  wire  _GEN_30 = 2'h1 == f2_redirect_idx ? bpd_io_resp_f2_preds_1_is_br : bpd_io_resp_f2_preds_0_is_br; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _GEN_31 = 2'h2 == f2_redirect_idx ? bpd_io_resp_f2_preds_2_is_br : _GEN_30; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _GEN_32 = 2'h3 == f2_redirect_idx ? bpd_io_resp_f2_preds_3_is_br : _GEN_31; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _GEN_26 = 2'h1 == f2_redirect_idx ? bpd_io_resp_f2_preds_1_taken : bpd_io_resp_f2_preds_0_taken; // @[frontend.scala 471:46 frontend.scala 471:46]
  wire  _GEN_27 = 2'h2 == f2_redirect_idx ? bpd_io_resp_f2_preds_2_taken : _GEN_26; // @[frontend.scala 471:46 frontend.scala 471:46]
  wire  _GEN_28 = 2'h3 == f2_redirect_idx ? bpd_io_resp_f2_preds_3_taken : _GEN_27; // @[frontend.scala 471:46 frontend.scala 471:46]
  wire  _T_134 = _GEN_28 & f2_do_redirect; // @[frontend.scala 471:46]
  wire  _T_153 = _GEN_32 & _T_134; // @[frontend.scala 99:48]
  wire [64:0] _T_155 = {s2_ghist_old_history, 1'h0}; // @[frontend.scala 99:91]
  wire [64:0] _T_156 = _T_155 | 65'h1; // @[frontend.scala 99:96]
  wire  hi_hi_1 = bpd_io_resp_f2_preds_3_is_br & bpd_io_resp_f2_preds_3_predicted_pc_valid; // @[frontend.scala 470:40]
  wire  hi_lo_1 = bpd_io_resp_f2_preds_2_is_br & bpd_io_resp_f2_preds_2_predicted_pc_valid; // @[frontend.scala 470:40]
  wire  lo_hi_1 = bpd_io_resp_f2_preds_1_is_br & bpd_io_resp_f2_preds_1_predicted_pc_valid; // @[frontend.scala 470:40]
  wire  lo_lo_1 = bpd_io_resp_f2_preds_0_is_br & bpd_io_resp_f2_preds_0_predicted_pc_valid; // @[frontend.scala 470:40]
  wire [3:0] _T_132 = {hi_hi_1,hi_lo_1,lo_hi_1,lo_lo_1}; // @[Cat.scala 30:58]
  wire [6:0] _GEN_240 = {{3'd0}, _T_132}; // @[frontend.scala 470:72]
  wire [6:0] _T_133 = _GEN_240 & f2_mask; // @[frontend.scala 470:72]
  wire [3:0] _T_136 = 4'h1 << f2_redirect_idx; // @[OneHot.scala 58:35]
  wire [3:0] _T_138 = {{1'd0}, _T_136[3:1]}; // @[util.scala 373:29]
  wire [3:0] _T_141 = _T_136 | _T_138; // @[util.scala 373:45]
  wire [3:0] _T_139 = {{2'd0}, _T_136[3:2]}; // @[util.scala 373:29]
  wire [3:0] _T_142 = _T_141 | _T_139; // @[util.scala 373:45]
  wire [3:0] _T_140 = {{3'd0}, _T_136[3]}; // @[util.scala 373:29]
  wire [3:0] _T_143 = _T_142 | _T_140; // @[util.scala 373:45]
  wire [3:0] _T_145 = _T_153 ? _T_136 : 4'h0; // @[frontend.scala 91:73]
  wire [3:0] _T_146 = ~_T_145; // @[frontend.scala 91:69]
  wire [3:0] _T_147 = _T_143 & _T_146; // @[frontend.scala 91:67]
  wire [3:0] _T_149 = f2_do_redirect ? _T_147 : 4'hf; // @[frontend.scala 90:44]
  wire [6:0] _GEN_244 = {{3'd0}, _T_149}; // @[frontend.scala 90:39]
  wire [6:0] _T_150 = _T_133 & _GEN_244; // @[frontend.scala 90:39]
  reg  s2_ghist_current_saw_branch_not_taken; // @[frontend.scala 442:21]
  wire  _T_152 = _T_150 != 7'h0 | s2_ghist_current_saw_branch_not_taken; // @[frontend.scala 98:61]
  wire [64:0] _T_158 = _T_152 ? _T_155 : {{1'd0}, s2_ghist_old_history}; // @[frontend.scala 100:37]
  wire [64:0] _T_159 = _GEN_32 & _T_134 & f2_do_redirect ? _T_156 : _T_158; // @[frontend.scala 99:37]
  wire [63:0] f2_predicted_ghist_old_history = _T_159[63:0]; // @[frontend.scala 88:27 frontend.scala 99:31]
  wire  _T_171 = ~s1_ghist_new_saw_branch_not_taken; // @[frontend.scala 77:32]
  wire  _T_172 = s1_ghist_old_history == f2_predicted_ghist_old_history & _T_171; // @[frontend.scala 76:42]
  wire  _T_173 = ~s1_ghist_new_saw_branch_taken; // @[frontend.scala 78:28]
  wire  _T_174 = _T_172 & _T_173; // @[frontend.scala 77:68]
  wire  f2_correct_f1_ghist = ~_T_174; // @[frontend.scala 81:41]
  wire  _T_197 = ~s1_valid; // @[frontend.scala 496:84]
  wire  _T_198 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid; // @[frontend.scala 496:81]
  wire  _GEN_54 = s2_valid & f3_ready & _T_198; // @[frontend.scala 491:38]
  wire  _GEN_75 = _T_181 | _GEN_54; // @[frontend.scala 482:58 frontend.scala 490:14]
  wire  _T_753 = ~s2_valid; // @[frontend.scala 823:18]
  wire  _T_754 = ~s2_valid & s1_valid; // @[frontend.scala 823:28]
  wire  _T_734 = s1_ghist_old_history == f3_predicted_ghist_old_history & _T_171; // @[frontend.scala 76:42]
  wire  _T_736 = _T_734 & _T_173; // @[frontend.scala 77:68]
  wire  f3_correct_f1_ghist = ~_T_736; // @[frontend.scala 81:41]
  wire  _T_766 = _T_754 & (s1_vpc != f3_predicted_target | f3_correct_f1_ghist); // @[frontend.scala 826:35]
  wire  _T_767 = s2_valid & (s2_vpc != f3_predicted_target | f3_correct_f2_ghist) | _T_766; // @[frontend.scala 825:90]
  wire  _T_770 = _T_753 & _T_197; // @[frontend.scala 827:22]
  wire  _T_771 = _T_767 | _T_770; // @[frontend.scala 826:95]
  wire  _GEN_121 = _T_771 | _GEN_75; // @[frontend.scala 827:37 frontend.scala 829:16]
  wire  _GEN_138 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_75 : _GEN_121; // @[frontend.scala 823:99]
  wire  _GEN_160 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_75 : _GEN_138; // @[frontend.scala 821:79]
  wire  _GEN_184 = f3_io_deq_valid & f4_ready ? _GEN_160 : _GEN_75; // @[frontend.scala 814:38]
  wire  _GEN_208 = io_cpu_redirect_flush | _GEN_184; // @[frontend.scala 965:38 frontend.scala 970:17]
  wire  f1_clear = io_cpu_sfence_valid | _GEN_208; // @[frontend.scala 953:30 frontend.scala 958:17]
  wire  _T_7 = ~f1_clear; // @[frontend.scala 388:58]
  reg  REG_1_valid; // @[frontend.scala 393:35]
  reg  REG_1_bits_rs1; // @[frontend.scala 393:35]
  reg  REG_1_bits_rs2; // @[frontend.scala 393:35]
  reg [38:0] REG_1_bits_addr; // @[frontend.scala 393:35]
  reg  REG_1_bits_asid; // @[frontend.scala 393:35]
  wire  s1_tlb_miss = _T_5 & tlb_io_resp_miss; // @[frontend.scala 396:35]
  reg  REG_2_pf_inst; // @[frontend.scala 397:46]
  reg  REG_2_ae_inst; // @[frontend.scala 397:46]
  wire  s1_tlb_resp_pf_inst = s1_is_replay ? REG_2_pf_inst : tlb_io_resp_pf_inst; // @[frontend.scala 397:24]
  wire  s1_tlb_resp_ae_inst = s1_is_replay ? REG_2_ae_inst : tlb_io_resp_ae_inst; // @[frontend.scala 397:24]
  reg [31:0] REG_3; // @[frontend.scala 398:42]
  wire [6:0] f1_mask = 7'hf << s1_vpc[2:1]; // @[frontend.scala 178:31]
  wire  _T_15 = bpd_io_resp_f1_preds_0_is_br & bpd_io_resp_f1_preds_0_taken; // @[frontend.scala 408:35]
  wire  _T_16 = bpd_io_resp_f1_preds_0_is_jal | _T_15; // @[frontend.scala 407:34]
  wire  f1_redirects_0 = s1_valid & f1_mask[0] & bpd_io_resp_f1_preds_0_predicted_pc_valid & _T_16; // @[frontend.scala 406:71]
  wire  _T_20 = bpd_io_resp_f1_preds_1_is_br & bpd_io_resp_f1_preds_1_taken; // @[frontend.scala 408:35]
  wire  _T_21 = bpd_io_resp_f1_preds_1_is_jal | _T_20; // @[frontend.scala 407:34]
  wire  f1_redirects_1 = s1_valid & f1_mask[1] & bpd_io_resp_f1_preds_1_predicted_pc_valid & _T_21; // @[frontend.scala 406:71]
  wire  _T_25 = bpd_io_resp_f1_preds_2_is_br & bpd_io_resp_f1_preds_2_taken; // @[frontend.scala 408:35]
  wire  _T_26 = bpd_io_resp_f1_preds_2_is_jal | _T_25; // @[frontend.scala 407:34]
  wire  f1_redirects_2 = s1_valid & f1_mask[2] & bpd_io_resp_f1_preds_2_predicted_pc_valid & _T_26; // @[frontend.scala 406:71]
  wire  _T_30 = bpd_io_resp_f1_preds_3_is_br & bpd_io_resp_f1_preds_3_taken; // @[frontend.scala 408:35]
  wire  _T_31 = bpd_io_resp_f1_preds_3_is_jal | _T_30; // @[frontend.scala 407:34]
  wire  f1_redirects_3 = s1_valid & f1_mask[3] & bpd_io_resp_f1_preds_3_predicted_pc_valid & _T_31; // @[frontend.scala 406:71]
  wire [1:0] _T_32 = f1_redirects_2 ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _T_33 = f1_redirects_1 ? 2'h1 : _T_32; // @[Mux.scala 47:69]
  wire [1:0] f1_redirect_idx = f1_redirects_0 ? 2'h0 : _T_33; // @[Mux.scala 47:69]
  wire  f1_do_redirect = f1_redirects_0 | f1_redirects_1 | f1_redirects_2 | f1_redirects_3; // @[frontend.scala 411:45]
  wire [39:0] _T_38 = f1_redirect_idx == 2'h1 ? bpd_io_resp_f1_preds_1_predicted_pc_bits :
    bpd_io_resp_f1_preds_0_predicted_pc_bits; // @[package.scala 32:76]
  wire [39:0] _T_40 = f1_redirect_idx == 2'h2 ? bpd_io_resp_f1_preds_2_predicted_pc_bits : _T_38; // @[package.scala 32:76]
  wire [39:0] _T_42 = f1_redirect_idx == 2'h3 ? bpd_io_resp_f1_preds_3_predicted_pc_bits : _T_40; // @[package.scala 32:76]
  wire [39:0] _T_43 = ~s1_vpc; // @[frontend.scala 161:33]
  wire [39:0] _T_44 = _T_43 | 40'h7; // @[frontend.scala 161:39]
  wire [39:0] _T_45 = ~_T_44; // @[frontend.scala 161:31]
  wire [39:0] _T_47 = _T_45 + 40'h8; // @[frontend.scala 168:23]
  wire [39:0] f1_predicted_target = f1_do_redirect ? _T_42 : _T_47; // @[frontend.scala 413:32]
  wire  lo_lo = bpd_io_resp_f1_preds_0_is_br & bpd_io_resp_f1_preds_0_predicted_pc_valid; // @[frontend.scala 418:40]
  wire  lo_hi = bpd_io_resp_f1_preds_1_is_br & bpd_io_resp_f1_preds_1_predicted_pc_valid; // @[frontend.scala 418:40]
  wire  hi_lo = bpd_io_resp_f1_preds_2_is_br & bpd_io_resp_f1_preds_2_predicted_pc_valid; // @[frontend.scala 418:40]
  wire  hi_hi = bpd_io_resp_f1_preds_3_is_br & bpd_io_resp_f1_preds_3_predicted_pc_valid; // @[frontend.scala 418:40]
  wire [3:0] _T_48 = {hi_hi,hi_lo,lo_hi,lo_lo}; // @[Cat.scala 30:58]
  wire [6:0] _GEN_245 = {{3'd0}, _T_48}; // @[frontend.scala 418:72]
  wire [6:0] _T_49 = _GEN_245 & f1_mask; // @[frontend.scala 418:72]
  wire  _GEN_9 = 2'h1 == f1_redirect_idx ? bpd_io_resp_f1_preds_1_taken : bpd_io_resp_f1_preds_0_taken; // @[frontend.scala 419:46 frontend.scala 419:46]
  wire  _GEN_10 = 2'h2 == f1_redirect_idx ? bpd_io_resp_f1_preds_2_taken : _GEN_9; // @[frontend.scala 419:46 frontend.scala 419:46]
  wire  _GEN_11 = 2'h3 == f1_redirect_idx ? bpd_io_resp_f1_preds_3_taken : _GEN_10; // @[frontend.scala 419:46 frontend.scala 419:46]
  wire  _T_50 = _GEN_11 & f1_do_redirect; // @[frontend.scala 419:46]
  wire [3:0] _T_52 = 4'h1 << f1_redirect_idx; // @[OneHot.scala 58:35]
  wire [3:0] _T_54 = {{1'd0}, _T_52[3:1]}; // @[util.scala 373:29]
  wire [3:0] _T_55 = {{2'd0}, _T_52[3:2]}; // @[util.scala 373:29]
  wire [3:0] _T_56 = {{3'd0}, _T_52[3]}; // @[util.scala 373:29]
  wire [3:0] _T_57 = _T_52 | _T_54; // @[util.scala 373:45]
  wire [3:0] _T_58 = _T_57 | _T_55; // @[util.scala 373:45]
  wire [3:0] _T_59 = _T_58 | _T_56; // @[util.scala 373:45]
  wire  _GEN_13 = 2'h1 == f1_redirect_idx ? bpd_io_resp_f1_preds_1_is_br : bpd_io_resp_f1_preds_0_is_br; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _GEN_14 = 2'h2 == f1_redirect_idx ? bpd_io_resp_f1_preds_2_is_br : _GEN_13; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _GEN_15 = 2'h3 == f1_redirect_idx ? bpd_io_resp_f1_preds_3_is_br : _GEN_14; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _T_60 = _GEN_15 & _T_50; // @[frontend.scala 91:84]
  wire [3:0] _T_61 = _GEN_15 & _T_50 ? _T_52 : 4'h0; // @[frontend.scala 91:73]
  wire [3:0] _T_62 = ~_T_61; // @[frontend.scala 91:69]
  wire [3:0] _T_63 = _T_59 & _T_62; // @[frontend.scala 91:67]
  wire [3:0] _T_65 = f1_do_redirect ? _T_63 : 4'hf; // @[frontend.scala 90:44]
  wire [6:0] _GEN_249 = {{3'd0}, _T_65}; // @[frontend.scala 90:39]
  wire [6:0] _T_66 = _T_49 & _GEN_249; // @[frontend.scala 90:39]
  wire  _T_68 = _T_66 != 7'h0 | s1_ghist_current_saw_branch_not_taken; // @[frontend.scala 98:61]
  wire [64:0] _T_71 = {s1_ghist_old_history, 1'h0}; // @[frontend.scala 99:91]
  wire [64:0] _T_72 = _T_71 | 65'h1; // @[frontend.scala 99:96]
  wire [64:0] _T_74 = _T_68 ? _T_71 : {{1'd0}, s1_ghist_old_history}; // @[frontend.scala 100:37]
  wire [64:0] _T_75 = _T_60 & f1_do_redirect ? _T_72 : _T_74; // @[frontend.scala 99:37]
  wire  _GEN_16 = s1_valid & ~s1_tlb_miss ? ~(s1_tlb_resp_ae_inst | s1_tlb_resp_pf_inst) : _T_4; // @[frontend.scala 427:35 frontend.scala 429:18]
  wire [1:0] _GEN_17 = s1_valid & ~s1_tlb_miss ? 2'h0 : _GEN_7; // @[frontend.scala 427:35 frontend.scala 430:18]
  wire [39:0] _GEN_18 = s1_valid & ~s1_tlb_miss ? f1_predicted_target : _GEN_1; // @[frontend.scala 427:35 frontend.scala 431:18]
  wire [4:0] _GEN_19 = s1_valid & ~s1_tlb_miss ? s1_ghist_ras_idx : 5'h0; // @[frontend.scala 427:35 frontend.scala 432:18]
  wire [63:0] f1_predicted_ghist_old_history = _T_75[63:0]; // @[frontend.scala 88:27 frontend.scala 99:31]
  wire [63:0] _GEN_23 = s1_valid & ~s1_tlb_miss ? f1_predicted_ghist_old_history : 64'h0; // @[frontend.scala 427:35 frontend.scala 432:18]
  reg [4:0] s2_ghist_ras_idx; // @[frontend.scala 442:21]
  reg [31:0] s2_ppc; // @[frontend.scala 444:24]
  reg [1:0] s2_tsrc; // @[frontend.scala 445:24]
  reg  s2_tlb_resp_pf_inst; // @[frontend.scala 448:28]
  reg  s2_tlb_resp_ae_inst; // @[frontend.scala 448:28]
  reg  s2_tlb_miss; // @[frontend.scala 449:28]
  reg  REG_4; // @[frontend.scala 450:29]
  wire  s2_is_replay = REG_4 & s2_valid; // @[frontend.scala 450:44]
  wire  _T_92 = s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst; // @[frontend.scala 451:50]
  wire  _T_94 = ~s2_is_replay; // @[frontend.scala 451:77]
  wire  s2_xcpt = s2_valid & (s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst) & ~s2_is_replay; // @[frontend.scala 451:74]
  wire [4:0] _GEN_33 = s1_valid & s1_vpc == f2_predicted_target & ~f2_correct_f1_ghist ? s2_ghist_ras_idx :
    s1_ghist_ras_idx; // @[frontend.scala 492:79 frontend.scala 494:16 frontend.scala 443:12]
  wire  _GEN_34 = s1_valid & s1_vpc == f2_predicted_target & ~f2_correct_f1_ghist ? 1'h0 : s1_ghist_new_saw_branch_taken
    ; // @[frontend.scala 492:79 frontend.scala 494:16 frontend.scala 443:12]
  wire  _GEN_35 = s1_valid & s1_vpc == f2_predicted_target & ~f2_correct_f1_ghist ? 1'h0 :
    s1_ghist_new_saw_branch_not_taken; // @[frontend.scala 492:79 frontend.scala 494:16 frontend.scala 443:12]
  wire  _GEN_36 = s1_valid & s1_vpc == f2_predicted_target & ~f2_correct_f1_ghist ? 1'h0 :
    s1_ghist_current_saw_branch_not_taken; // @[frontend.scala 492:79 frontend.scala 494:16 frontend.scala 443:12]
  wire [63:0] _GEN_37 = s1_valid & s1_vpc == f2_predicted_target & ~f2_correct_f1_ghist ? f2_predicted_ghist_old_history
     : s1_ghist_old_history; // @[frontend.scala 492:79 frontend.scala 494:16 frontend.scala 443:12]
  wire  _GEN_39 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ? ~(_T_92 & _T_94) :
    _GEN_16; // @[frontend.scala 496:95 frontend.scala 499:20]
  wire [39:0] _GEN_40 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ?
    f2_predicted_target : _GEN_18; // @[frontend.scala 496:95 frontend.scala 500:20]
  wire [4:0] _GEN_42 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ? s2_ghist_ras_idx
     : _GEN_19; // @[frontend.scala 496:95 frontend.scala 502:20]
  wire [63:0] _GEN_46 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ?
    f2_predicted_ghist_old_history : _GEN_23; // @[frontend.scala 496:95 frontend.scala 502:20]
  wire [1:0] _GEN_47 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ? 2'h1 : 2'h0; // @[frontend.scala 496:95 frontend.scala 503:20]
  wire [1:0] _GEN_48 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ? 2'h1 : _GEN_17; // @[frontend.scala 496:95 frontend.scala 504:20]
  wire [4:0] _GEN_49 = s2_valid & f3_ready ? _GEN_33 : s1_ghist_ras_idx; // @[frontend.scala 491:38 frontend.scala 443:12]
  wire  _GEN_50 = s2_valid & f3_ready ? _GEN_34 : s1_ghist_new_saw_branch_taken; // @[frontend.scala 491:38 frontend.scala 443:12]
  wire  _GEN_51 = s2_valid & f3_ready ? _GEN_35 : s1_ghist_new_saw_branch_not_taken; // @[frontend.scala 491:38 frontend.scala 443:12]
  wire  _GEN_52 = s2_valid & f3_ready ? _GEN_36 : s1_ghist_current_saw_branch_not_taken; // @[frontend.scala 491:38 frontend.scala 443:12]
  wire [63:0] _GEN_53 = s2_valid & f3_ready ? _GEN_37 : s1_ghist_old_history; // @[frontend.scala 491:38 frontend.scala 443:12]
  wire  _GEN_55 = s2_valid & f3_ready ? _GEN_39 : _GEN_16; // @[frontend.scala 491:38]
  wire [39:0] _GEN_56 = s2_valid & f3_ready ? _GEN_40 : _GEN_18; // @[frontend.scala 491:38]
  wire [4:0] _GEN_58 = s2_valid & f3_ready ? _GEN_42 : _GEN_19; // @[frontend.scala 491:38]
  wire [63:0] _GEN_62 = s2_valid & f3_ready ? _GEN_46 : _GEN_23; // @[frontend.scala 491:38]
  wire [1:0] _GEN_63 = s2_valid & f3_ready ? _GEN_47 : 2'h0; // @[frontend.scala 491:38]
  wire [1:0] _GEN_64 = s2_valid & f3_ready ? _GEN_48 : _GEN_17; // @[frontend.scala 491:38]
  wire  _GEN_65 = _T_181 ? ~s2_tlb_resp_ae_inst & ~s2_tlb_resp_pf_inst | s2_is_replay | s2_tlb_miss : _GEN_55; // @[frontend.scala 482:58 frontend.scala 483:14]
  wire [39:0] _GEN_66 = _T_181 ? s2_vpc : _GEN_56; // @[frontend.scala 482:58 frontend.scala 484:14]
  wire  _GEN_67 = _T_181 & (s2_valid & icache_io_resp_valid); // @[frontend.scala 482:58 frontend.scala 485:18]
  wire [4:0] _GEN_69 = _T_181 ? s2_ghist_ras_idx : _GEN_58; // @[frontend.scala 482:58 frontend.scala 488:14]
  wire  _GEN_70 = _T_181 & s2_ghist_new_saw_branch_taken; // @[frontend.scala 482:58 frontend.scala 488:14]
  wire  _GEN_71 = _T_181 & s2_ghist_new_saw_branch_not_taken; // @[frontend.scala 482:58 frontend.scala 488:14]
  wire  _GEN_72 = _T_181 & s2_ghist_current_saw_branch_not_taken; // @[frontend.scala 482:58 frontend.scala 488:14]
  wire [63:0] _GEN_73 = _T_181 ? s2_ghist_old_history : _GEN_62; // @[frontend.scala 482:58 frontend.scala 488:14]
  wire [1:0] _GEN_74 = _T_181 ? s2_tsrc : _GEN_64; // @[frontend.scala 482:58 frontend.scala 489:14]
  wire [4:0] _GEN_76 = _T_181 ? s1_ghist_ras_idx : _GEN_49; // @[frontend.scala 482:58 frontend.scala 443:12]
  wire  _GEN_77 = _T_181 ? s1_ghist_new_saw_branch_taken : _GEN_50; // @[frontend.scala 482:58 frontend.scala 443:12]
  wire  _GEN_78 = _T_181 ? s1_ghist_new_saw_branch_not_taken : _GEN_51; // @[frontend.scala 482:58 frontend.scala 443:12]
  wire  _GEN_79 = _T_181 ? s1_ghist_current_saw_branch_not_taken : _GEN_52; // @[frontend.scala 482:58 frontend.scala 443:12]
  wire [63:0] _GEN_80 = _T_181 ? s1_ghist_old_history : _GEN_53; // @[frontend.scala 482:58 frontend.scala 443:12]
  wire  f3_clear = io_cpu_sfence_valid | io_cpu_redirect_flush; // @[frontend.scala 953:30 frontend.scala 954:17]
  wire  _GEN_137 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? 1'h0 : _T_771; // @[frontend.scala 823:99]
  wire  _GEN_159 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? 1'h0 : _GEN_137; // @[frontend.scala 821:79]
  wire  _GEN_183 = f3_io_deq_valid & f4_ready & _GEN_159; // @[frontend.scala 814:38]
  wire  _GEN_207 = io_cpu_redirect_flush | _GEN_183; // @[frontend.scala 965:38 frontend.scala 969:17]
  wire  f2_clear = io_cpu_sfence_valid | _GEN_207; // @[frontend.scala 953:30 frontend.scala 957:17]
  wire  _T_212 = icache_io_resp_valid | _T_92 & ~s2_tlb_miss; // @[frontend.scala 529:27]
  reg [4:0] ras_read_idx; // @[frontend.scala 540:29]
  wire  _T_217 = f3_io_enq_ready & f3_io_enq_valid; // @[Decoupled.scala 40:37]
  reg  REG_5; // @[frontend.scala 549:57]
  wire [39:0] _T_221 = ~f3_io_deq_bits_pc; // @[frontend.scala 161:33]
  wire [39:0] _T_222 = _T_221 | 40'h7; // @[frontend.scala 161:39]
  wire [39:0] f3_aligned_pc = ~_T_222; // @[frontend.scala 161:31]
  wire [1:0] lo_2 = {f3_mask_1,f3_mask_0}; // @[frontend.scala 576:35]
  wire [1:0] hi_2 = {f3_mask_3,f3_mask_2}; // @[frontend.scala 576:35]
  wire [31:0] _T_230 = RVCExpander_io_rvc ? RVCExpander_io_out_bits : _T_228; // @[consts.scala 332:8]
  wire [31:0] _T_231 = RVCExpander_1_io_rvc ? RVCExpander_1_io_out_bits : _T_227[31:0]; // @[consts.scala 332:8]
  wire [40:0] _T_232 = {{1'd0}, f3_aligned_pc}; // @[frontend.scala 619:34]
  wire [39:0] _T_235 = _T_232[39:0] - 40'h2; // @[frontend.scala 619:69]
  wire [39:0] _GEN_86 = f3_prev_is_half ? _T_235 : _T_232[39:0]; // @[frontend.scala 629:34 frontend.scala 633:40 frontend.scala 654:40]
  wire  _GEN_87 = f3_prev_is_half ? BranchDecode_io_out_shadowable : BranchDecode_1_io_out_shadowable; // @[frontend.scala 629:34 frontend.scala 634:40 frontend.scala 655:40]
  wire [5:0] _GEN_88 = f3_prev_is_half ? BranchDecode_io_out_sfb_offset_bits : BranchDecode_1_io_out_sfb_offset_bits; // @[frontend.scala 629:34 frontend.scala 634:40 frontend.scala 655:40]
  wire  _GEN_89 = f3_prev_is_half ? BranchDecode_io_out_sfb_offset_valid : BranchDecode_1_io_out_sfb_offset_valid; // @[frontend.scala 629:34 frontend.scala 634:40 frontend.scala 655:40]
  wire  f3_call_mask_0 = f3_prev_is_half ? BranchDecode_io_out_is_call : BranchDecode_1_io_out_is_call; // @[frontend.scala 629:34 frontend.scala 634:40 frontend.scala 655:40]
  wire  _T_254 = _T_324 & f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_valid; // @[frontend.scala 696:70]
  wire  _T_255 = f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits != _GEN_91; // @[frontend.scala 698:61]
  wire  f3_btb_mispredicts_0 = _T_254 & _T_255; // @[frontend.scala 697:61]
  wire  f3_npc_plus4_mask_0 = _T_341 & ~f3_prev_is_half; // @[frontend.scala 703:23]
  wire [7:0] _T_260 = {{2'd0}, _GEN_88}; // @[frontend.scala 708:50]
  wire [1:0] _T_263 = f3_prev_is_half ? 2'h2 : 2'h0; // @[frontend.scala 710:12]
  wire [6:0] _GEN_250 = {{5'd0}, _T_263}; // @[frontend.scala 709:32]
  wire [6:0] _T_265 = _T_260[6:0] - _GEN_250; // @[frontend.scala 709:32]
  wire [15:0] _T_268 = 16'h1 << _T_265[4:1]; // @[OneHot.scala 58:35]
  wire [22:0] _T_270 = {{7'd0}, _T_268}; // @[frontend.scala 715:80]
  wire  _T_271 = f3_mask_0 & _GEN_89; // @[frontend.scala 718:20]
  wire  _T_273 = _T_265 <= 7'h10; // @[frontend.scala 720:33]
  wire [8:0] _T_291 = {{1'd0}, _T_270[7:0]}; // @[util.scala 384:30]
  wire [8:0] _T_293 = {_T_270[7:0], 1'h0}; // @[util.scala 384:30]
  wire [9:0] _GEN_251 = {_T_270[7:0], 2'h0}; // @[util.scala 384:30]
  wire [10:0] _T_295 = {{1'd0}, _GEN_251}; // @[util.scala 384:30]
  wire [10:0] _T_297 = {_T_270[7:0], 3'h0}; // @[util.scala 384:30]
  wire [11:0] _GEN_252 = {_T_270[7:0], 4'h0}; // @[util.scala 384:30]
  wire [14:0] _T_299 = {{3'd0}, _GEN_252}; // @[util.scala 384:30]
  wire [12:0] _GEN_253 = {_T_270[7:0], 5'h0}; // @[util.scala 384:30]
  wire [14:0] _T_301 = {{2'd0}, _GEN_253}; // @[util.scala 384:30]
  wire [13:0] _GEN_254 = {_T_270[7:0], 6'h0}; // @[util.scala 384:30]
  wire [14:0] _T_303 = {{1'd0}, _GEN_254}; // @[util.scala 384:30]
  wire [14:0] _T_305 = {_T_270[7:0], 7'h0}; // @[util.scala 384:30]
  wire [7:0] _T_307 = _T_291[7:0] | _T_293[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_308 = _T_307 | _T_295[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_309 = _T_308 | _T_297[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_310 = _T_309 | _T_299[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_311 = _T_310 | _T_301[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_312 = _T_311 | _T_303[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_313 = _T_312 | _T_305[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_314 = ~_T_313; // @[frontend.scala 722:70]
  wire  f3_fetch_bundle_xcpt_pf_if = f3_io_deq_bits_xcpt_pf_inst; // @[frontend.scala 569:29 frontend.scala 580:30]
  wire  f3_fetch_bundle_xcpt_ae_if = f3_io_deq_bits_xcpt_ae_inst; // @[frontend.scala 569:29 frontend.scala 581:30]
  wire  _T_316 = f3_fetch_bundle_xcpt_pf_if | f3_fetch_bundle_xcpt_ae_if; // @[frontend.scala 723:75]
  wire  _T_319 = ~(f3_fetch_bundle_xcpt_pf_if | f3_fetch_bundle_xcpt_ae_if | BreakpointUnit_io_debug_if |
    BreakpointUnit_io_xcpt_if); // @[frontend.scala 723:46]
  wire  _T_322 = _GEN_87 | ~f3_mask_0; // @[frontend.scala 725:65]
  wire [39:0] _T_337 = f3_aligned_pc + 40'h2; // @[frontend.scala 662:32]
  wire  _T_361 = _T_429 & _T_344 & f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_valid; // @[frontend.scala 696:70]
  wire  _T_362 = f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits != _WIRE_9_target; // @[frontend.scala 698:61]
  wire  f3_btb_mispredicts_1 = _T_361 & _T_362; // @[frontend.scala 697:61]
  wire [5:0] _WIRE_9_sfb_offset_bits = BranchDecode_2_io_out_sfb_offset_bits; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire [6:0] _GEN_255 = {{1'd0}, _WIRE_9_sfb_offset_bits}; // @[frontend.scala 708:50]
  wire [6:0] _T_366 = 7'h2 + _GEN_255; // @[frontend.scala 708:50]
  wire [6:0] _T_370 = _T_366 - 7'h0; // @[frontend.scala 709:32]
  wire [15:0] _T_373 = 16'h1 << _T_370[4:1]; // @[OneHot.scala 58:35]
  wire [22:0] _T_375 = {{7'd0}, _T_373}; // @[frontend.scala 715:80]
  wire  _WIRE_9_sfb_offset_valid = BranchDecode_2_io_out_sfb_offset_valid; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  _T_376 = f3_mask_1 & _WIRE_9_sfb_offset_valid; // @[frontend.scala 718:20]
  wire  _T_378 = _T_370 <= 7'h10; // @[frontend.scala 720:33]
  wire [8:0] _T_396 = {{1'd0}, _T_375[7:0]}; // @[util.scala 384:30]
  wire [8:0] _T_398 = {_T_375[7:0], 1'h0}; // @[util.scala 384:30]
  wire [9:0] _GEN_256 = {_T_375[7:0], 2'h0}; // @[util.scala 384:30]
  wire [10:0] _T_400 = {{1'd0}, _GEN_256}; // @[util.scala 384:30]
  wire [10:0] _T_402 = {_T_375[7:0], 3'h0}; // @[util.scala 384:30]
  wire [11:0] _GEN_257 = {_T_375[7:0], 4'h0}; // @[util.scala 384:30]
  wire [14:0] _T_404 = {{3'd0}, _GEN_257}; // @[util.scala 384:30]
  wire [12:0] _GEN_258 = {_T_375[7:0], 5'h0}; // @[util.scala 384:30]
  wire [14:0] _T_406 = {{2'd0}, _GEN_258}; // @[util.scala 384:30]
  wire [13:0] _GEN_259 = {_T_375[7:0], 6'h0}; // @[util.scala 384:30]
  wire [14:0] _T_408 = {{1'd0}, _GEN_259}; // @[util.scala 384:30]
  wire [14:0] _T_410 = {_T_375[7:0], 7'h0}; // @[util.scala 384:30]
  wire [7:0] _T_412 = _T_396[7:0] | _T_398[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_413 = _T_412 | _T_400[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_414 = _T_413 | _T_402[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_415 = _T_414 | _T_404[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_416 = _T_415 | _T_406[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_417 = _T_416 | _T_408[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_418 = _T_417 | _T_410[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_419 = ~_T_418; // @[frontend.scala 722:70]
  wire  _T_424 = ~(f3_fetch_bundle_xcpt_pf_if | f3_fetch_bundle_xcpt_ae_if | BreakpointUnit_1_io_debug_if |
    BreakpointUnit_1_io_xcpt_if); // @[frontend.scala 723:46]
  wire  _WIRE_9_shadowable = BranchDecode_2_io_out_shadowable; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  _T_427 = _WIRE_9_shadowable | ~f3_mask_1; // @[frontend.scala 725:65]
  wire [39:0] _T_442 = f3_aligned_pc + 40'h4; // @[frontend.scala 662:32]
  wire  _T_465 = _T_533 & _T_448 & f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_valid; // @[frontend.scala 696:70]
  wire  _T_466 = f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits != _WIRE_14_target; // @[frontend.scala 698:61]
  wire  f3_btb_mispredicts_2 = _T_465 & _T_466; // @[frontend.scala 697:61]
  wire [5:0] _WIRE_14_sfb_offset_bits = BranchDecode_3_io_out_sfb_offset_bits; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire [6:0] _GEN_260 = {{1'd0}, _WIRE_14_sfb_offset_bits}; // @[frontend.scala 708:50]
  wire [6:0] _T_470 = 7'h4 + _GEN_260; // @[frontend.scala 708:50]
  wire [6:0] _T_474 = _T_470 - 7'h0; // @[frontend.scala 709:32]
  wire [15:0] _T_477 = 16'h1 << _T_474[4:1]; // @[OneHot.scala 58:35]
  wire [22:0] _T_479 = {{7'd0}, _T_477}; // @[frontend.scala 715:80]
  wire  _WIRE_14_sfb_offset_valid = BranchDecode_3_io_out_sfb_offset_valid; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  _T_480 = f3_mask_2 & _WIRE_14_sfb_offset_valid; // @[frontend.scala 718:20]
  wire  _T_482 = _T_474 <= 7'h10; // @[frontend.scala 720:33]
  wire [8:0] _T_500 = {{1'd0}, _T_479[7:0]}; // @[util.scala 384:30]
  wire [8:0] _T_502 = {_T_479[7:0], 1'h0}; // @[util.scala 384:30]
  wire [9:0] _GEN_261 = {_T_479[7:0], 2'h0}; // @[util.scala 384:30]
  wire [10:0] _T_504 = {{1'd0}, _GEN_261}; // @[util.scala 384:30]
  wire [10:0] _T_506 = {_T_479[7:0], 3'h0}; // @[util.scala 384:30]
  wire [11:0] _GEN_262 = {_T_479[7:0], 4'h0}; // @[util.scala 384:30]
  wire [14:0] _T_508 = {{3'd0}, _GEN_262}; // @[util.scala 384:30]
  wire [12:0] _GEN_263 = {_T_479[7:0], 5'h0}; // @[util.scala 384:30]
  wire [14:0] _T_510 = {{2'd0}, _GEN_263}; // @[util.scala 384:30]
  wire [13:0] _GEN_264 = {_T_479[7:0], 6'h0}; // @[util.scala 384:30]
  wire [14:0] _T_512 = {{1'd0}, _GEN_264}; // @[util.scala 384:30]
  wire [14:0] _T_514 = {_T_479[7:0], 7'h0}; // @[util.scala 384:30]
  wire [7:0] _T_516 = _T_500[7:0] | _T_502[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_517 = _T_516 | _T_504[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_518 = _T_517 | _T_506[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_519 = _T_518 | _T_508[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_520 = _T_519 | _T_510[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_521 = _T_520 | _T_512[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_522 = _T_521 | _T_514[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_523 = ~_T_522; // @[frontend.scala 722:70]
  wire  _T_528 = ~(f3_fetch_bundle_xcpt_pf_if | f3_fetch_bundle_xcpt_ae_if | BreakpointUnit_2_io_debug_if |
    BreakpointUnit_2_io_xcpt_if); // @[frontend.scala 723:46]
  wire  _WIRE_14_shadowable = BranchDecode_3_io_out_shadowable; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  _T_531 = _WIRE_14_shadowable | ~f3_mask_2; // @[frontend.scala 725:65]
  wire [39:0] _T_546 = f3_aligned_pc + 40'h6; // @[frontend.scala 662:32]
  wire  _T_573 = _T_641 & _T_556 & f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_valid; // @[frontend.scala 696:70]
  wire  _T_574 = f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits != _WIRE_19_target; // @[frontend.scala 698:61]
  wire  f3_btb_mispredicts_3 = _T_573 & _T_574; // @[frontend.scala 697:61]
  wire [5:0] _WIRE_19_sfb_offset_bits = BranchDecode_4_io_out_sfb_offset_bits; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire [6:0] _GEN_265 = {{1'd0}, _WIRE_19_sfb_offset_bits}; // @[frontend.scala 708:50]
  wire [6:0] _T_578 = 7'h6 + _GEN_265; // @[frontend.scala 708:50]
  wire [6:0] _T_582 = _T_578 - 7'h0; // @[frontend.scala 709:32]
  wire [15:0] _T_585 = 16'h1 << _T_582[4:1]; // @[OneHot.scala 58:35]
  wire [22:0] _T_587 = {{7'd0}, _T_585}; // @[frontend.scala 715:80]
  wire  _WIRE_19_sfb_offset_valid = BranchDecode_4_io_out_sfb_offset_valid; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  _T_588 = f3_mask_3 & _WIRE_19_sfb_offset_valid; // @[frontend.scala 718:20]
  wire  _T_590 = _T_582 <= 7'h10; // @[frontend.scala 720:33]
  wire [8:0] _T_608 = {{1'd0}, _T_587[7:0]}; // @[util.scala 384:30]
  wire [8:0] _T_610 = {_T_587[7:0], 1'h0}; // @[util.scala 384:30]
  wire [9:0] _GEN_266 = {_T_587[7:0], 2'h0}; // @[util.scala 384:30]
  wire [10:0] _T_612 = {{1'd0}, _GEN_266}; // @[util.scala 384:30]
  wire [10:0] _T_614 = {_T_587[7:0], 3'h0}; // @[util.scala 384:30]
  wire [11:0] _GEN_267 = {_T_587[7:0], 4'h0}; // @[util.scala 384:30]
  wire [14:0] _T_616 = {{3'd0}, _GEN_267}; // @[util.scala 384:30]
  wire [12:0] _GEN_268 = {_T_587[7:0], 5'h0}; // @[util.scala 384:30]
  wire [14:0] _T_618 = {{2'd0}, _GEN_268}; // @[util.scala 384:30]
  wire [13:0] _GEN_269 = {_T_587[7:0], 6'h0}; // @[util.scala 384:30]
  wire [14:0] _T_620 = {{1'd0}, _GEN_269}; // @[util.scala 384:30]
  wire [14:0] _T_622 = {_T_587[7:0], 7'h0}; // @[util.scala 384:30]
  wire [7:0] _T_624 = _T_608[7:0] | _T_610[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_625 = _T_624 | _T_612[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_626 = _T_625 | _T_614[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_627 = _T_626 | _T_616[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_628 = _T_627 | _T_618[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_629 = _T_628 | _T_620[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_630 = _T_629 | _T_622[7:0]; // @[util.scala 384:54]
  wire [7:0] _T_631 = ~_T_630; // @[frontend.scala 722:70]
  wire  _T_636 = ~(f3_fetch_bundle_xcpt_pf_if | f3_fetch_bundle_xcpt_ae_if | BreakpointUnit_3_io_debug_if |
    BreakpointUnit_3_io_xcpt_if); // @[frontend.scala 723:46]
  wire  _WIRE_19_shadowable = BranchDecode_4_io_out_shadowable; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  _T_639 = _WIRE_19_shadowable | ~f3_mask_3; // @[frontend.scala 725:65]
  wire [15:0] last_inst = f3_fetch_bundle_insts_3[15:0]; // @[frontend.scala 746:40]
  wire  _T_657 = last_inst[1:0] != 2'h3; // @[frontend.scala 592:38]
  wire  bank_prev_is_half = ~_T_551 & ~_T_657; // @[frontend.scala 748:69]
  wire [2:0] _GEN_96 = 2'h1 == f3_fetch_bundle_cfi_idx_bits ? f3_cfi_types_1 : f3_cfi_types_0; // @[frontend.scala 755:33 frontend.scala 755:33]
  wire [2:0] _GEN_97 = 2'h2 == f3_fetch_bundle_cfi_idx_bits ? f3_cfi_types_2 : _GEN_96; // @[frontend.scala 755:33 frontend.scala 755:33]
  wire  f3_call_mask_1 = BranchDecode_2_io_out_is_call; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  _GEN_100 = 2'h1 == f3_fetch_bundle_cfi_idx_bits ? f3_call_mask_1 : f3_call_mask_0; // @[frontend.scala 756:33 frontend.scala 756:33]
  wire  f3_call_mask_2 = BranchDecode_3_io_out_is_call; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  _GEN_101 = 2'h2 == f3_fetch_bundle_cfi_idx_bits ? f3_call_mask_2 : _GEN_100; // @[frontend.scala 756:33 frontend.scala 756:33]
  wire  f3_call_mask_3 = BranchDecode_4_io_out_is_call; // @[frontend.scala 613:24 frontend.scala 671:38]
  wire  f3_fetch_bundle_cfi_is_call = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_call_mask_3 : _GEN_101; // @[frontend.scala 756:33 frontend.scala 756:33]
  wire  _GEN_108 = 2'h1 == f3_fetch_bundle_cfi_idx_bits ? _T_446 : f3_npc_plus4_mask_0; // @[frontend.scala 758:33 frontend.scala 758:33]
  wire  _GEN_109 = 2'h2 == f3_fetch_bundle_cfi_idx_bits ? _T_550 : _GEN_108; // @[frontend.scala 758:33 frontend.scala 758:33]
  wire  f3_fetch_bundle_cfi_npc_plus4 = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? _T_554 : _GEN_109; // @[frontend.scala 758:33 frontend.scala 758:33]
  wire  _T_661 = f3_io_deq_ready & f3_io_deq_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_111 = _T_661 ? bank_prev_is_half : f3_prev_is_half; // @[frontend.scala 767:27 frontend.scala 768:21 frontend.scala 589:32]
  wire  _GEN_113 = f3_clear ? 1'h0 : _GEN_111; // @[frontend.scala 773:19 frontend.scala 774:21]
  wire [4:0] f3_fetch_bundle_ghist_ras_idx = f3_io_deq_bits_ghist_ras_idx; // @[frontend.scala 569:29 frontend.scala 760:28]
  wire [4:0] _T_715 = f3_fetch_bundle_ghist_ras_idx + 5'h1; // @[util.scala 203:14]
  wire [4:0] _T_719 = f3_fetch_bundle_ghist_ras_idx - 5'h1; // @[util.scala 220:14]
  wire [4:0] _T_721 = _T_674 & f3_fetch_bundle_cfi_is_ret ? _T_719 : f3_fetch_bundle_ghist_ras_idx; // @[frontend.scala 125:31]
  wire [4:0] f3_predicted_ghist_ras_idx = _T_674 & f3_fetch_bundle_cfi_is_call ? _T_715 : _T_721; // @[frontend.scala 124:31]
  wire [2:0] _T_723 = {f3_fetch_bundle_cfi_idx_bits, 1'h0}; // @[frontend.scala 806:71]
  wire [39:0] _GEN_270 = {{37'd0}, _T_723}; // @[frontend.scala 806:39]
  wire [39:0] _T_725 = f3_aligned_pc + _GEN_270; // @[frontend.scala 806:39]
  wire [2:0] _T_726 = f3_fetch_bundle_cfi_npc_plus4 ? 3'h4 : 3'h2; // @[frontend.scala 806:82]
  wire [39:0] _GEN_271 = {{37'd0}, _T_726}; // @[frontend.scala 806:77]
  wire [39:0] _T_728 = _T_725 + _GEN_271; // @[frontend.scala 806:77]
  wire  _T_745 = f3_fetch_bundle_cfi_is_call & _T_674; // @[frontend.scala 815:39]
  wire  _GEN_119 = _T_674 ? 1'h0 : _GEN_113; // @[frontend.scala 818:38 frontend.scala 819:23]
  wire  _GEN_122 = _T_771 ? ~_T_316 : _GEN_65; // @[frontend.scala 827:37 frontend.scala 831:20]
  wire [39:0] _GEN_123 = _T_771 ? f3_predicted_target : _GEN_66; // @[frontend.scala 827:37 frontend.scala 832:20]
  wire  _GEN_124 = _T_771 ? 1'h0 : _GEN_67; // @[frontend.scala 827:37 frontend.scala 833:20]
  wire [4:0] _GEN_125 = _T_771 ? f3_predicted_ghist_ras_idx : _GEN_69; // @[frontend.scala 827:37 frontend.scala 834:20]
  wire  _GEN_126 = _T_771 ? 1'h0 : _GEN_70; // @[frontend.scala 827:37 frontend.scala 834:20]
  wire  _GEN_127 = _T_771 ? 1'h0 : _GEN_71; // @[frontend.scala 827:37 frontend.scala 834:20]
  wire  _GEN_128 = _T_771 ? 1'h0 : _GEN_72; // @[frontend.scala 827:37 frontend.scala 834:20]
  wire [63:0] _GEN_129 = _T_771 ? f3_predicted_ghist_old_history : _GEN_73; // @[frontend.scala 827:37 frontend.scala 834:20]
  wire [1:0] _GEN_130 = _T_771 ? 2'h2 : _GEN_74; // @[frontend.scala 827:37 frontend.scala 835:20]
  wire [1:0] _GEN_131 = _T_771 ? 2'h2 : f3_io_deq_bits_fsrc; // @[frontend.scala 827:37 frontend.scala 837:28 frontend.scala 582:24]
  wire  _GEN_139 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_65 : _GEN_122; // @[frontend.scala 823:99]
  wire [39:0] _GEN_140 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_66 :
    _GEN_123; // @[frontend.scala 823:99]
  wire  _GEN_141 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_67 : _GEN_124; // @[frontend.scala 823:99]
  wire [4:0] _GEN_142 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_69 : _GEN_125
    ; // @[frontend.scala 823:99]
  wire  _GEN_143 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_70 : _GEN_126; // @[frontend.scala 823:99]
  wire  _GEN_144 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_71 : _GEN_127; // @[frontend.scala 823:99]
  wire  _GEN_145 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_72 : _GEN_128; // @[frontend.scala 823:99]
  wire [63:0] _GEN_146 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_73 :
    _GEN_129; // @[frontend.scala 823:99]
  wire [1:0] _GEN_147 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_74 : _GEN_130
    ; // @[frontend.scala 823:99]
  wire [1:0] _GEN_148 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ?
    f3_io_deq_bits_fsrc : _GEN_131; // @[frontend.scala 823:99 frontend.scala 582:24]
  wire [4:0] _GEN_149 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? f3_predicted_ghist_ras_idx :
    s2_ghist_ras_idx; // @[frontend.scala 821:79 frontend.scala 822:28 frontend.scala 533:24]
  wire  _GEN_150 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? 1'h0 :
    s2_ghist_new_saw_branch_taken; // @[frontend.scala 821:79 frontend.scala 822:28 frontend.scala 533:24]
  wire  _GEN_151 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? 1'h0 :
    s2_ghist_new_saw_branch_not_taken; // @[frontend.scala 821:79 frontend.scala 822:28 frontend.scala 533:24]
  wire  _GEN_152 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? 1'h0 :
    s2_ghist_current_saw_branch_not_taken; // @[frontend.scala 821:79 frontend.scala 822:28 frontend.scala 533:24]
  wire [63:0] _GEN_153 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ?
    f3_predicted_ghist_old_history : s2_ghist_old_history; // @[frontend.scala 821:79 frontend.scala 822:28 frontend.scala 533:24]
  wire  _GEN_161 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_65 : _GEN_139; // @[frontend.scala 821:79]
  wire [39:0] _GEN_162 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_66 : _GEN_140; // @[frontend.scala 821:79]
  wire [4:0] _GEN_164 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_69 : _GEN_142; // @[frontend.scala 821:79]
  wire  _GEN_165 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_70 : _GEN_143; // @[frontend.scala 821:79]
  wire  _GEN_166 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_71 : _GEN_144; // @[frontend.scala 821:79]
  wire  _GEN_167 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_72 : _GEN_145; // @[frontend.scala 821:79]
  wire [63:0] _GEN_168 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_73 : _GEN_146; // @[frontend.scala 821:79]
  wire [1:0] _GEN_169 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_74 : _GEN_147; // @[frontend.scala 821:79]
  wire [1:0] _GEN_170 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? f3_io_deq_bits_fsrc : _GEN_148
    ; // @[frontend.scala 821:79 frontend.scala 582:24]
  wire  _GEN_171 = f3_io_deq_valid & f4_ready & _T_745; // @[frontend.scala 814:38 frontend.scala 805:22]
  wire  _GEN_172 = f3_io_deq_valid & f4_ready ? _GEN_119 : _GEN_113; // @[frontend.scala 814:38]
  wire  _GEN_185 = f3_io_deq_valid & f4_ready ? _GEN_161 : _GEN_65; // @[frontend.scala 814:38]
  wire [39:0] _GEN_186 = f3_io_deq_valid & f4_ready ? _GEN_162 : _GEN_66; // @[frontend.scala 814:38]
  wire [4:0] _GEN_188 = f3_io_deq_valid & f4_ready ? _GEN_164 : _GEN_69; // @[frontend.scala 814:38]
  wire  _GEN_189 = f3_io_deq_valid & f4_ready ? _GEN_165 : _GEN_70; // @[frontend.scala 814:38]
  wire  _GEN_190 = f3_io_deq_valid & f4_ready ? _GEN_166 : _GEN_71; // @[frontend.scala 814:38]
  wire  _GEN_191 = f3_io_deq_valid & f4_ready ? _GEN_167 : _GEN_72; // @[frontend.scala 814:38]
  wire [63:0] _GEN_192 = f3_io_deq_valid & f4_ready ? _GEN_168 : _GEN_73; // @[frontend.scala 814:38]
  wire [1:0] _GEN_193 = f3_io_deq_valid & f4_ready ? _GEN_169 : _GEN_74; // @[frontend.scala 814:38]
  wire [1:0] lo_5 = {f3_btb_mispredicts_1,f3_btb_mispredicts_0}; // @[frontend.scala 847:77]
  wire [1:0] hi_5 = {f3_btb_mispredicts_3,f3_btb_mispredicts_2}; // @[frontend.scala 847:77]
  wire  _T_899 = ~f4_io_deq_bits_cfi_idx_valid; // @[frontend.scala 896:5]
  wire  _T_900 = (f4_io_deq_bits_sfbs_0 | f4_io_deq_bits_sfbs_1 | f4_io_deq_bits_sfbs_2 | f4_io_deq_bits_sfbs_3) &
    _T_899; // @[frontend.scala 895:38]
  wire  _T_901 = ~f4_io_enq_valid; // @[frontend.scala 897:5]
  wire  _T_902 = _T_900 & _T_901; // @[frontend.scala 896:35]
  wire  _T_903 = ~f4_io_deq_bits_xcpt_pf_if; // @[frontend.scala 898:5]
  wire  _T_904 = _T_902 & _T_903; // @[frontend.scala 897:22]
  wire  _T_905 = ~f4_io_deq_bits_xcpt_ae_if; // @[frontend.scala 899:5]
  wire  f4_delay = _T_904 & _T_905; // @[frontend.scala 898:32]
  wire  _T_914 = ~f4_delay; // @[frontend.scala 910:61]
  wire [3:0] _T_927 = {f4_io_deq_bits_shadowed_mask_3,f4_io_deq_bits_shadowed_mask_2,f4_io_deq_bits_shadowed_mask_1,
    f4_io_deq_bits_shadowed_mask_0}; // @[frontend.scala 918:34]
  wire  _GEN_210 = io_cpu_redirect_flush ? io_cpu_redirect_val : _GEN_185; // @[frontend.scala 965:38 frontend.scala 974:18]
  wire [39:0] _GEN_211 = io_cpu_redirect_flush ? io_cpu_redirect_pc : _GEN_186; // @[frontend.scala 965:38 frontend.scala 975:18]
  wire [4:0] _GEN_212 = io_cpu_redirect_flush ? io_cpu_redirect_ghist_ras_idx : _GEN_188; // @[frontend.scala 965:38 frontend.scala 976:18]
  wire  _GEN_213 = io_cpu_redirect_flush ? io_cpu_redirect_ghist_new_saw_branch_taken : _GEN_189; // @[frontend.scala 965:38 frontend.scala 976:18]
  wire  _GEN_214 = io_cpu_redirect_flush ? io_cpu_redirect_ghist_new_saw_branch_not_taken : _GEN_190; // @[frontend.scala 965:38 frontend.scala 976:18]
  wire  _GEN_215 = io_cpu_redirect_flush ? io_cpu_redirect_ghist_current_saw_branch_not_taken : _GEN_191; // @[frontend.scala 965:38 frontend.scala 976:18]
  wire [63:0] _GEN_216 = io_cpu_redirect_flush ? io_cpu_redirect_ghist_old_history : _GEN_192; // @[frontend.scala 965:38 frontend.scala 976:18]
  wire [39:0] s0_vpc = io_cpu_sfence_valid ? {{1'd0}, io_cpu_sfence_bits_addr} : _GEN_211; // @[frontend.scala 953:30 frontend.scala 961:18]
  ICache icache ( // @[frontend.scala 300:26]
    .clock(icache_clock),
    .reset(icache_reset),
    .auto_master_out_a_ready(icache_auto_master_out_a_ready),
    .auto_master_out_a_valid(icache_auto_master_out_a_valid),
    .auto_master_out_a_bits_opcode(icache_auto_master_out_a_bits_opcode),
    .auto_master_out_a_bits_param(icache_auto_master_out_a_bits_param),
    .auto_master_out_a_bits_size(icache_auto_master_out_a_bits_size),
    .auto_master_out_a_bits_source(icache_auto_master_out_a_bits_source),
    .auto_master_out_a_bits_address(icache_auto_master_out_a_bits_address),
    .auto_master_out_a_bits_mask(icache_auto_master_out_a_bits_mask),
    .auto_master_out_a_bits_data(icache_auto_master_out_a_bits_data),
    .auto_master_out_a_bits_corrupt(icache_auto_master_out_a_bits_corrupt),
    .auto_master_out_d_ready(icache_auto_master_out_d_ready),
    .auto_master_out_d_valid(icache_auto_master_out_d_valid),
    .auto_master_out_d_bits_opcode(icache_auto_master_out_d_bits_opcode),
    .auto_master_out_d_bits_param(icache_auto_master_out_d_bits_param),
    .auto_master_out_d_bits_size(icache_auto_master_out_d_bits_size),
    .auto_master_out_d_bits_source(icache_auto_master_out_d_bits_source),
    .auto_master_out_d_bits_sink(icache_auto_master_out_d_bits_sink),
    .auto_master_out_d_bits_denied(icache_auto_master_out_d_bits_denied),
    .auto_master_out_d_bits_data(icache_auto_master_out_d_bits_data),
    .auto_master_out_d_bits_corrupt(icache_auto_master_out_d_bits_corrupt),
    .io_req_ready(icache_io_req_ready),
    .io_req_valid(icache_io_req_valid),
    .io_req_bits_addr(icache_io_req_bits_addr),
    .io_s1_paddr(icache_io_s1_paddr),
    .io_s1_kill(icache_io_s1_kill),
    .io_s2_kill(icache_io_s2_kill),
    .io_s2_prefetch(icache_io_s2_prefetch),
    .io_resp_valid(icache_io_resp_valid),
    .io_resp_bits_data(icache_io_resp_bits_data),
    .io_resp_bits_replay(icache_io_resp_bits_replay),
    .io_resp_bits_ae(icache_io_resp_bits_ae),
    .io_invalidate(icache_io_invalidate),
    .io_perf_acquire(icache_io_perf_acquire)
  );
  BranchPredictor bpd ( // @[frontend.scala 333:19]
    .clock(bpd_clock),
    .reset(bpd_reset),
    .io_f0_req_valid(bpd_io_f0_req_valid),
    .io_f0_req_bits_pc(bpd_io_f0_req_bits_pc),
    .io_f0_req_bits_ghist_old_history(bpd_io_f0_req_bits_ghist_old_history),
    .io_f0_req_bits_ghist_current_saw_branch_not_taken(bpd_io_f0_req_bits_ghist_current_saw_branch_not_taken),
    .io_f0_req_bits_ghist_new_saw_branch_not_taken(bpd_io_f0_req_bits_ghist_new_saw_branch_not_taken),
    .io_f0_req_bits_ghist_new_saw_branch_taken(bpd_io_f0_req_bits_ghist_new_saw_branch_taken),
    .io_f0_req_bits_ghist_ras_idx(bpd_io_f0_req_bits_ghist_ras_idx),
    .io_resp_f1_pc(bpd_io_resp_f1_pc),
    .io_resp_f1_preds_0_taken(bpd_io_resp_f1_preds_0_taken),
    .io_resp_f1_preds_0_is_br(bpd_io_resp_f1_preds_0_is_br),
    .io_resp_f1_preds_0_is_jal(bpd_io_resp_f1_preds_0_is_jal),
    .io_resp_f1_preds_0_predicted_pc_valid(bpd_io_resp_f1_preds_0_predicted_pc_valid),
    .io_resp_f1_preds_0_predicted_pc_bits(bpd_io_resp_f1_preds_0_predicted_pc_bits),
    .io_resp_f1_preds_1_taken(bpd_io_resp_f1_preds_1_taken),
    .io_resp_f1_preds_1_is_br(bpd_io_resp_f1_preds_1_is_br),
    .io_resp_f1_preds_1_is_jal(bpd_io_resp_f1_preds_1_is_jal),
    .io_resp_f1_preds_1_predicted_pc_valid(bpd_io_resp_f1_preds_1_predicted_pc_valid),
    .io_resp_f1_preds_1_predicted_pc_bits(bpd_io_resp_f1_preds_1_predicted_pc_bits),
    .io_resp_f1_preds_2_taken(bpd_io_resp_f1_preds_2_taken),
    .io_resp_f1_preds_2_is_br(bpd_io_resp_f1_preds_2_is_br),
    .io_resp_f1_preds_2_is_jal(bpd_io_resp_f1_preds_2_is_jal),
    .io_resp_f1_preds_2_predicted_pc_valid(bpd_io_resp_f1_preds_2_predicted_pc_valid),
    .io_resp_f1_preds_2_predicted_pc_bits(bpd_io_resp_f1_preds_2_predicted_pc_bits),
    .io_resp_f1_preds_3_taken(bpd_io_resp_f1_preds_3_taken),
    .io_resp_f1_preds_3_is_br(bpd_io_resp_f1_preds_3_is_br),
    .io_resp_f1_preds_3_is_jal(bpd_io_resp_f1_preds_3_is_jal),
    .io_resp_f1_preds_3_predicted_pc_valid(bpd_io_resp_f1_preds_3_predicted_pc_valid),
    .io_resp_f1_preds_3_predicted_pc_bits(bpd_io_resp_f1_preds_3_predicted_pc_bits),
    .io_resp_f1_meta_0(bpd_io_resp_f1_meta_0),
    .io_resp_f1_lhist_0(bpd_io_resp_f1_lhist_0),
    .io_resp_f2_pc(bpd_io_resp_f2_pc),
    .io_resp_f2_preds_0_taken(bpd_io_resp_f2_preds_0_taken),
    .io_resp_f2_preds_0_is_br(bpd_io_resp_f2_preds_0_is_br),
    .io_resp_f2_preds_0_is_jal(bpd_io_resp_f2_preds_0_is_jal),
    .io_resp_f2_preds_0_predicted_pc_valid(bpd_io_resp_f2_preds_0_predicted_pc_valid),
    .io_resp_f2_preds_0_predicted_pc_bits(bpd_io_resp_f2_preds_0_predicted_pc_bits),
    .io_resp_f2_preds_1_taken(bpd_io_resp_f2_preds_1_taken),
    .io_resp_f2_preds_1_is_br(bpd_io_resp_f2_preds_1_is_br),
    .io_resp_f2_preds_1_is_jal(bpd_io_resp_f2_preds_1_is_jal),
    .io_resp_f2_preds_1_predicted_pc_valid(bpd_io_resp_f2_preds_1_predicted_pc_valid),
    .io_resp_f2_preds_1_predicted_pc_bits(bpd_io_resp_f2_preds_1_predicted_pc_bits),
    .io_resp_f2_preds_2_taken(bpd_io_resp_f2_preds_2_taken),
    .io_resp_f2_preds_2_is_br(bpd_io_resp_f2_preds_2_is_br),
    .io_resp_f2_preds_2_is_jal(bpd_io_resp_f2_preds_2_is_jal),
    .io_resp_f2_preds_2_predicted_pc_valid(bpd_io_resp_f2_preds_2_predicted_pc_valid),
    .io_resp_f2_preds_2_predicted_pc_bits(bpd_io_resp_f2_preds_2_predicted_pc_bits),
    .io_resp_f2_preds_3_taken(bpd_io_resp_f2_preds_3_taken),
    .io_resp_f2_preds_3_is_br(bpd_io_resp_f2_preds_3_is_br),
    .io_resp_f2_preds_3_is_jal(bpd_io_resp_f2_preds_3_is_jal),
    .io_resp_f2_preds_3_predicted_pc_valid(bpd_io_resp_f2_preds_3_predicted_pc_valid),
    .io_resp_f2_preds_3_predicted_pc_bits(bpd_io_resp_f2_preds_3_predicted_pc_bits),
    .io_resp_f2_meta_0(bpd_io_resp_f2_meta_0),
    .io_resp_f2_lhist_0(bpd_io_resp_f2_lhist_0),
    .io_resp_f3_pc(bpd_io_resp_f3_pc),
    .io_resp_f3_preds_0_taken(bpd_io_resp_f3_preds_0_taken),
    .io_resp_f3_preds_0_is_br(bpd_io_resp_f3_preds_0_is_br),
    .io_resp_f3_preds_0_is_jal(bpd_io_resp_f3_preds_0_is_jal),
    .io_resp_f3_preds_0_predicted_pc_valid(bpd_io_resp_f3_preds_0_predicted_pc_valid),
    .io_resp_f3_preds_0_predicted_pc_bits(bpd_io_resp_f3_preds_0_predicted_pc_bits),
    .io_resp_f3_preds_1_taken(bpd_io_resp_f3_preds_1_taken),
    .io_resp_f3_preds_1_is_br(bpd_io_resp_f3_preds_1_is_br),
    .io_resp_f3_preds_1_is_jal(bpd_io_resp_f3_preds_1_is_jal),
    .io_resp_f3_preds_1_predicted_pc_valid(bpd_io_resp_f3_preds_1_predicted_pc_valid),
    .io_resp_f3_preds_1_predicted_pc_bits(bpd_io_resp_f3_preds_1_predicted_pc_bits),
    .io_resp_f3_preds_2_taken(bpd_io_resp_f3_preds_2_taken),
    .io_resp_f3_preds_2_is_br(bpd_io_resp_f3_preds_2_is_br),
    .io_resp_f3_preds_2_is_jal(bpd_io_resp_f3_preds_2_is_jal),
    .io_resp_f3_preds_2_predicted_pc_valid(bpd_io_resp_f3_preds_2_predicted_pc_valid),
    .io_resp_f3_preds_2_predicted_pc_bits(bpd_io_resp_f3_preds_2_predicted_pc_bits),
    .io_resp_f3_preds_3_taken(bpd_io_resp_f3_preds_3_taken),
    .io_resp_f3_preds_3_is_br(bpd_io_resp_f3_preds_3_is_br),
    .io_resp_f3_preds_3_is_jal(bpd_io_resp_f3_preds_3_is_jal),
    .io_resp_f3_preds_3_predicted_pc_valid(bpd_io_resp_f3_preds_3_predicted_pc_valid),
    .io_resp_f3_preds_3_predicted_pc_bits(bpd_io_resp_f3_preds_3_predicted_pc_bits),
    .io_resp_f3_meta_0(bpd_io_resp_f3_meta_0),
    .io_resp_f3_lhist_0(bpd_io_resp_f3_lhist_0),
    .io_f3_fire(bpd_io_f3_fire),
    .io_update_valid(bpd_io_update_valid),
    .io_update_bits_is_mispredict_update(bpd_io_update_bits_is_mispredict_update),
    .io_update_bits_is_repair_update(bpd_io_update_bits_is_repair_update),
    .io_update_bits_btb_mispredicts(bpd_io_update_bits_btb_mispredicts),
    .io_update_bits_pc(bpd_io_update_bits_pc),
    .io_update_bits_br_mask(bpd_io_update_bits_br_mask),
    .io_update_bits_cfi_idx_valid(bpd_io_update_bits_cfi_idx_valid),
    .io_update_bits_cfi_idx_bits(bpd_io_update_bits_cfi_idx_bits),
    .io_update_bits_cfi_taken(bpd_io_update_bits_cfi_taken),
    .io_update_bits_cfi_mispredicted(bpd_io_update_bits_cfi_mispredicted),
    .io_update_bits_cfi_is_br(bpd_io_update_bits_cfi_is_br),
    .io_update_bits_cfi_is_jal(bpd_io_update_bits_cfi_is_jal),
    .io_update_bits_cfi_is_jalr(bpd_io_update_bits_cfi_is_jalr),
    .io_update_bits_ghist_old_history(bpd_io_update_bits_ghist_old_history),
    .io_update_bits_ghist_current_saw_branch_not_taken(bpd_io_update_bits_ghist_current_saw_branch_not_taken),
    .io_update_bits_ghist_new_saw_branch_not_taken(bpd_io_update_bits_ghist_new_saw_branch_not_taken),
    .io_update_bits_ghist_new_saw_branch_taken(bpd_io_update_bits_ghist_new_saw_branch_taken),
    .io_update_bits_ghist_ras_idx(bpd_io_update_bits_ghist_ras_idx),
    .io_update_bits_lhist_0(bpd_io_update_bits_lhist_0),
    .io_update_bits_target(bpd_io_update_bits_target),
    .io_update_bits_meta_0(bpd_io_update_bits_meta_0)
  );
  BoomRAS ras ( // @[frontend.scala 335:19]
    .clock(ras_clock),
    .reset(ras_reset),
    .io_read_idx(ras_io_read_idx),
    .io_read_addr(ras_io_read_addr),
    .io_write_valid(ras_io_write_valid),
    .io_write_idx(ras_io_write_idx),
    .io_write_addr(ras_io_write_addr)
  );
  TLB tlb ( // @[frontend.scala 339:19]
    .clock(tlb_clock),
    .reset(tlb_reset),
    .io_req_ready(tlb_io_req_ready),
    .io_req_valid(tlb_io_req_valid),
    .io_req_bits_vaddr(tlb_io_req_bits_vaddr),
    .io_req_bits_passthrough(tlb_io_req_bits_passthrough),
    .io_req_bits_size(tlb_io_req_bits_size),
    .io_req_bits_cmd(tlb_io_req_bits_cmd),
    .io_resp_miss(tlb_io_resp_miss),
    .io_resp_paddr(tlb_io_resp_paddr),
    .io_resp_pf_ld(tlb_io_resp_pf_ld),
    .io_resp_pf_st(tlb_io_resp_pf_st),
    .io_resp_pf_inst(tlb_io_resp_pf_inst),
    .io_resp_ae_ld(tlb_io_resp_ae_ld),
    .io_resp_ae_st(tlb_io_resp_ae_st),
    .io_resp_ae_inst(tlb_io_resp_ae_inst),
    .io_resp_ma_ld(tlb_io_resp_ma_ld),
    .io_resp_ma_st(tlb_io_resp_ma_st),
    .io_resp_ma_inst(tlb_io_resp_ma_inst),
    .io_resp_cacheable(tlb_io_resp_cacheable),
    .io_resp_must_alloc(tlb_io_resp_must_alloc),
    .io_resp_prefetchable(tlb_io_resp_prefetchable),
    .io_sfence_valid(tlb_io_sfence_valid),
    .io_sfence_bits_rs1(tlb_io_sfence_bits_rs1),
    .io_sfence_bits_rs2(tlb_io_sfence_bits_rs2),
    .io_sfence_bits_addr(tlb_io_sfence_bits_addr),
    .io_sfence_bits_asid(tlb_io_sfence_bits_asid),
    .io_ptw_req_ready(tlb_io_ptw_req_ready),
    .io_ptw_req_valid(tlb_io_ptw_req_valid),
    .io_ptw_req_bits_valid(tlb_io_ptw_req_bits_valid),
    .io_ptw_req_bits_bits_addr(tlb_io_ptw_req_bits_bits_addr),
    .io_ptw_resp_valid(tlb_io_ptw_resp_valid),
    .io_ptw_resp_bits_ae(tlb_io_ptw_resp_bits_ae),
    .io_ptw_resp_bits_pte_ppn(tlb_io_ptw_resp_bits_pte_ppn),
    .io_ptw_resp_bits_pte_reserved_for_software(tlb_io_ptw_resp_bits_pte_reserved_for_software),
    .io_ptw_resp_bits_pte_d(tlb_io_ptw_resp_bits_pte_d),
    .io_ptw_resp_bits_pte_a(tlb_io_ptw_resp_bits_pte_a),
    .io_ptw_resp_bits_pte_g(tlb_io_ptw_resp_bits_pte_g),
    .io_ptw_resp_bits_pte_u(tlb_io_ptw_resp_bits_pte_u),
    .io_ptw_resp_bits_pte_x(tlb_io_ptw_resp_bits_pte_x),
    .io_ptw_resp_bits_pte_w(tlb_io_ptw_resp_bits_pte_w),
    .io_ptw_resp_bits_pte_r(tlb_io_ptw_resp_bits_pte_r),
    .io_ptw_resp_bits_pte_v(tlb_io_ptw_resp_bits_pte_v),
    .io_ptw_resp_bits_level(tlb_io_ptw_resp_bits_level),
    .io_ptw_resp_bits_fragmented_superpage(tlb_io_ptw_resp_bits_fragmented_superpage),
    .io_ptw_resp_bits_homogeneous(tlb_io_ptw_resp_bits_homogeneous),
    .io_ptw_ptbr_mode(tlb_io_ptw_ptbr_mode),
    .io_ptw_ptbr_asid(tlb_io_ptw_ptbr_asid),
    .io_ptw_ptbr_ppn(tlb_io_ptw_ptbr_ppn),
    .io_ptw_status_debug(tlb_io_ptw_status_debug),
    .io_ptw_status_cease(tlb_io_ptw_status_cease),
    .io_ptw_status_wfi(tlb_io_ptw_status_wfi),
    .io_ptw_status_isa(tlb_io_ptw_status_isa),
    .io_ptw_status_dprv(tlb_io_ptw_status_dprv),
    .io_ptw_status_prv(tlb_io_ptw_status_prv),
    .io_ptw_status_sd(tlb_io_ptw_status_sd),
    .io_ptw_status_zero2(tlb_io_ptw_status_zero2),
    .io_ptw_status_sxl(tlb_io_ptw_status_sxl),
    .io_ptw_status_uxl(tlb_io_ptw_status_uxl),
    .io_ptw_status_sd_rv32(tlb_io_ptw_status_sd_rv32),
    .io_ptw_status_zero1(tlb_io_ptw_status_zero1),
    .io_ptw_status_tsr(tlb_io_ptw_status_tsr),
    .io_ptw_status_tw(tlb_io_ptw_status_tw),
    .io_ptw_status_tvm(tlb_io_ptw_status_tvm),
    .io_ptw_status_mxr(tlb_io_ptw_status_mxr),
    .io_ptw_status_sum(tlb_io_ptw_status_sum),
    .io_ptw_status_mprv(tlb_io_ptw_status_mprv),
    .io_ptw_status_xs(tlb_io_ptw_status_xs),
    .io_ptw_status_fs(tlb_io_ptw_status_fs),
    .io_ptw_status_mpp(tlb_io_ptw_status_mpp),
    .io_ptw_status_vs(tlb_io_ptw_status_vs),
    .io_ptw_status_spp(tlb_io_ptw_status_spp),
    .io_ptw_status_mpie(tlb_io_ptw_status_mpie),
    .io_ptw_status_hpie(tlb_io_ptw_status_hpie),
    .io_ptw_status_spie(tlb_io_ptw_status_spie),
    .io_ptw_status_upie(tlb_io_ptw_status_upie),
    .io_ptw_status_mie(tlb_io_ptw_status_mie),
    .io_ptw_status_hie(tlb_io_ptw_status_hie),
    .io_ptw_status_sie(tlb_io_ptw_status_sie),
    .io_ptw_status_uie(tlb_io_ptw_status_uie),
    .io_ptw_pmp_0_cfg_l(tlb_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_res(tlb_io_ptw_pmp_0_cfg_res),
    .io_ptw_pmp_0_cfg_a(tlb_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(tlb_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(tlb_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(tlb_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(tlb_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(tlb_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(tlb_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_res(tlb_io_ptw_pmp_1_cfg_res),
    .io_ptw_pmp_1_cfg_a(tlb_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(tlb_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(tlb_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(tlb_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(tlb_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(tlb_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(tlb_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_res(tlb_io_ptw_pmp_2_cfg_res),
    .io_ptw_pmp_2_cfg_a(tlb_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(tlb_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(tlb_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(tlb_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(tlb_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(tlb_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(tlb_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_res(tlb_io_ptw_pmp_3_cfg_res),
    .io_ptw_pmp_3_cfg_a(tlb_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(tlb_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(tlb_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(tlb_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(tlb_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(tlb_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(tlb_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_res(tlb_io_ptw_pmp_4_cfg_res),
    .io_ptw_pmp_4_cfg_a(tlb_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(tlb_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(tlb_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(tlb_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(tlb_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(tlb_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(tlb_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_res(tlb_io_ptw_pmp_5_cfg_res),
    .io_ptw_pmp_5_cfg_a(tlb_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(tlb_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(tlb_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(tlb_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(tlb_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(tlb_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(tlb_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_res(tlb_io_ptw_pmp_6_cfg_res),
    .io_ptw_pmp_6_cfg_a(tlb_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(tlb_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(tlb_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(tlb_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(tlb_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(tlb_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(tlb_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_res(tlb_io_ptw_pmp_7_cfg_res),
    .io_ptw_pmp_7_cfg_a(tlb_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(tlb_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(tlb_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(tlb_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(tlb_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(tlb_io_ptw_pmp_7_mask),
    .io_ptw_customCSRs_csrs_0_wen(tlb_io_ptw_customCSRs_csrs_0_wen),
    .io_ptw_customCSRs_csrs_0_wdata(tlb_io_ptw_customCSRs_csrs_0_wdata),
    .io_ptw_customCSRs_csrs_0_value(tlb_io_ptw_customCSRs_csrs_0_value),
    .io_kill(tlb_io_kill)
  );
  Queue_21 f3 ( // @[frontend.scala 516:11]
    .clock(f3_clock),
    .reset(f3_reset),
    .io_enq_ready(f3_io_enq_ready),
    .io_enq_valid(f3_io_enq_valid),
    .io_enq_bits_pc(f3_io_enq_bits_pc),
    .io_enq_bits_data(f3_io_enq_bits_data),
    .io_enq_bits_mask(f3_io_enq_bits_mask),
    .io_enq_bits_xcpt_pf_inst(f3_io_enq_bits_xcpt_pf_inst),
    .io_enq_bits_xcpt_ae_inst(f3_io_enq_bits_xcpt_ae_inst),
    .io_enq_bits_ghist_old_history(f3_io_enq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken(f3_io_enq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken(f3_io_enq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken(f3_io_enq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx(f3_io_enq_bits_ghist_ras_idx),
    .io_enq_bits_fsrc(f3_io_enq_bits_fsrc),
    .io_enq_bits_tsrc(f3_io_enq_bits_tsrc),
    .io_deq_ready(f3_io_deq_ready),
    .io_deq_valid(f3_io_deq_valid),
    .io_deq_bits_pc(f3_io_deq_bits_pc),
    .io_deq_bits_data(f3_io_deq_bits_data),
    .io_deq_bits_mask(f3_io_deq_bits_mask),
    .io_deq_bits_xcpt_pf_inst(f3_io_deq_bits_xcpt_pf_inst),
    .io_deq_bits_xcpt_ae_inst(f3_io_deq_bits_xcpt_ae_inst),
    .io_deq_bits_ghist_old_history(f3_io_deq_bits_ghist_old_history),
    .io_deq_bits_ghist_current_saw_branch_not_taken(f3_io_deq_bits_ghist_current_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_not_taken(f3_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_taken(f3_io_deq_bits_ghist_new_saw_branch_taken),
    .io_deq_bits_ghist_ras_idx(f3_io_deq_bits_ghist_ras_idx),
    .io_deq_bits_fsrc(f3_io_deq_bits_fsrc),
    .io_deq_bits_tsrc(f3_io_deq_bits_tsrc),
    .io_count(f3_io_count)
  );
  Queue_22 f3_bpd_resp ( // @[frontend.scala 521:11]
    .clock(f3_bpd_resp_clock),
    .reset(f3_bpd_resp_reset),
    .io_enq_ready(f3_bpd_resp_io_enq_ready),
    .io_enq_valid(f3_bpd_resp_io_enq_valid),
    .io_enq_bits_pc(f3_bpd_resp_io_enq_bits_pc),
    .io_enq_bits_preds_0_taken(f3_bpd_resp_io_enq_bits_preds_0_taken),
    .io_enq_bits_preds_0_is_br(f3_bpd_resp_io_enq_bits_preds_0_is_br),
    .io_enq_bits_preds_0_is_jal(f3_bpd_resp_io_enq_bits_preds_0_is_jal),
    .io_enq_bits_preds_0_predicted_pc_valid(f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_valid),
    .io_enq_bits_preds_0_predicted_pc_bits(f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_bits),
    .io_enq_bits_preds_1_taken(f3_bpd_resp_io_enq_bits_preds_1_taken),
    .io_enq_bits_preds_1_is_br(f3_bpd_resp_io_enq_bits_preds_1_is_br),
    .io_enq_bits_preds_1_is_jal(f3_bpd_resp_io_enq_bits_preds_1_is_jal),
    .io_enq_bits_preds_1_predicted_pc_valid(f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_valid),
    .io_enq_bits_preds_1_predicted_pc_bits(f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_bits),
    .io_enq_bits_preds_2_taken(f3_bpd_resp_io_enq_bits_preds_2_taken),
    .io_enq_bits_preds_2_is_br(f3_bpd_resp_io_enq_bits_preds_2_is_br),
    .io_enq_bits_preds_2_is_jal(f3_bpd_resp_io_enq_bits_preds_2_is_jal),
    .io_enq_bits_preds_2_predicted_pc_valid(f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_valid),
    .io_enq_bits_preds_2_predicted_pc_bits(f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_bits),
    .io_enq_bits_preds_3_taken(f3_bpd_resp_io_enq_bits_preds_3_taken),
    .io_enq_bits_preds_3_is_br(f3_bpd_resp_io_enq_bits_preds_3_is_br),
    .io_enq_bits_preds_3_is_jal(f3_bpd_resp_io_enq_bits_preds_3_is_jal),
    .io_enq_bits_preds_3_predicted_pc_valid(f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_valid),
    .io_enq_bits_preds_3_predicted_pc_bits(f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_bits),
    .io_enq_bits_meta_0(f3_bpd_resp_io_enq_bits_meta_0),
    .io_enq_bits_lhist_0(f3_bpd_resp_io_enq_bits_lhist_0),
    .io_deq_ready(f3_bpd_resp_io_deq_ready),
    .io_deq_valid(f3_bpd_resp_io_deq_valid),
    .io_deq_bits_pc(f3_bpd_resp_io_deq_bits_pc),
    .io_deq_bits_preds_0_taken(f3_bpd_resp_io_deq_bits_preds_0_taken),
    .io_deq_bits_preds_0_is_br(f3_bpd_resp_io_deq_bits_preds_0_is_br),
    .io_deq_bits_preds_0_is_jal(f3_bpd_resp_io_deq_bits_preds_0_is_jal),
    .io_deq_bits_preds_0_predicted_pc_valid(f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_valid),
    .io_deq_bits_preds_0_predicted_pc_bits(f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits),
    .io_deq_bits_preds_1_taken(f3_bpd_resp_io_deq_bits_preds_1_taken),
    .io_deq_bits_preds_1_is_br(f3_bpd_resp_io_deq_bits_preds_1_is_br),
    .io_deq_bits_preds_1_is_jal(f3_bpd_resp_io_deq_bits_preds_1_is_jal),
    .io_deq_bits_preds_1_predicted_pc_valid(f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_valid),
    .io_deq_bits_preds_1_predicted_pc_bits(f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits),
    .io_deq_bits_preds_2_taken(f3_bpd_resp_io_deq_bits_preds_2_taken),
    .io_deq_bits_preds_2_is_br(f3_bpd_resp_io_deq_bits_preds_2_is_br),
    .io_deq_bits_preds_2_is_jal(f3_bpd_resp_io_deq_bits_preds_2_is_jal),
    .io_deq_bits_preds_2_predicted_pc_valid(f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_valid),
    .io_deq_bits_preds_2_predicted_pc_bits(f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits),
    .io_deq_bits_preds_3_taken(f3_bpd_resp_io_deq_bits_preds_3_taken),
    .io_deq_bits_preds_3_is_br(f3_bpd_resp_io_deq_bits_preds_3_is_br),
    .io_deq_bits_preds_3_is_jal(f3_bpd_resp_io_deq_bits_preds_3_is_jal),
    .io_deq_bits_preds_3_predicted_pc_valid(f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_valid),
    .io_deq_bits_preds_3_predicted_pc_bits(f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits),
    .io_deq_bits_meta_0(f3_bpd_resp_io_deq_bits_meta_0),
    .io_deq_bits_lhist_0(f3_bpd_resp_io_deq_bits_lhist_0),
    .io_count(f3_bpd_resp_io_count)
  );
  BreakpointUnit BreakpointUnit ( // @[frontend.scala 606:23]
    .clock(BreakpointUnit_clock),
    .reset(BreakpointUnit_reset),
    .io_status_debug(BreakpointUnit_io_status_debug),
    .io_status_cease(BreakpointUnit_io_status_cease),
    .io_status_wfi(BreakpointUnit_io_status_wfi),
    .io_status_isa(BreakpointUnit_io_status_isa),
    .io_status_dprv(BreakpointUnit_io_status_dprv),
    .io_status_prv(BreakpointUnit_io_status_prv),
    .io_status_sd(BreakpointUnit_io_status_sd),
    .io_status_zero2(BreakpointUnit_io_status_zero2),
    .io_status_sxl(BreakpointUnit_io_status_sxl),
    .io_status_uxl(BreakpointUnit_io_status_uxl),
    .io_status_sd_rv32(BreakpointUnit_io_status_sd_rv32),
    .io_status_zero1(BreakpointUnit_io_status_zero1),
    .io_status_tsr(BreakpointUnit_io_status_tsr),
    .io_status_tw(BreakpointUnit_io_status_tw),
    .io_status_tvm(BreakpointUnit_io_status_tvm),
    .io_status_mxr(BreakpointUnit_io_status_mxr),
    .io_status_sum(BreakpointUnit_io_status_sum),
    .io_status_mprv(BreakpointUnit_io_status_mprv),
    .io_status_xs(BreakpointUnit_io_status_xs),
    .io_status_fs(BreakpointUnit_io_status_fs),
    .io_status_mpp(BreakpointUnit_io_status_mpp),
    .io_status_vs(BreakpointUnit_io_status_vs),
    .io_status_spp(BreakpointUnit_io_status_spp),
    .io_status_mpie(BreakpointUnit_io_status_mpie),
    .io_status_hpie(BreakpointUnit_io_status_hpie),
    .io_status_spie(BreakpointUnit_io_status_spie),
    .io_status_upie(BreakpointUnit_io_status_upie),
    .io_status_mie(BreakpointUnit_io_status_mie),
    .io_status_hie(BreakpointUnit_io_status_hie),
    .io_status_sie(BreakpointUnit_io_status_sie),
    .io_status_uie(BreakpointUnit_io_status_uie),
    .io_pc(BreakpointUnit_io_pc),
    .io_ea(BreakpointUnit_io_ea),
    .io_xcpt_if(BreakpointUnit_io_xcpt_if),
    .io_xcpt_ld(BreakpointUnit_io_xcpt_ld),
    .io_xcpt_st(BreakpointUnit_io_xcpt_st),
    .io_debug_if(BreakpointUnit_io_debug_if),
    .io_debug_ld(BreakpointUnit_io_debug_ld),
    .io_debug_st(BreakpointUnit_io_debug_st)
  );
  RVCExpander RVCExpander ( // @[consts.scala 330:25]
    .clock(RVCExpander_clock),
    .reset(RVCExpander_reset),
    .io_in(RVCExpander_io_in),
    .io_out_bits(RVCExpander_io_out_bits),
    .io_out_rd(RVCExpander_io_out_rd),
    .io_out_rs1(RVCExpander_io_out_rs1),
    .io_out_rs2(RVCExpander_io_out_rs2),
    .io_out_rs3(RVCExpander_io_out_rs3),
    .io_rvc(RVCExpander_io_rvc)
  );
  RVCExpander RVCExpander_1 ( // @[consts.scala 330:25]
    .clock(RVCExpander_1_clock),
    .reset(RVCExpander_1_reset),
    .io_in(RVCExpander_1_io_in),
    .io_out_bits(RVCExpander_1_io_out_bits),
    .io_out_rd(RVCExpander_1_io_out_rd),
    .io_out_rs1(RVCExpander_1_io_out_rs1),
    .io_out_rs2(RVCExpander_1_io_out_rs2),
    .io_out_rs3(RVCExpander_1_io_out_rs3),
    .io_rvc(RVCExpander_1_io_rvc)
  );
  BranchDecode BranchDecode ( // @[frontend.scala 622:34]
    .clock(BranchDecode_clock),
    .reset(BranchDecode_reset),
    .io_inst(BranchDecode_io_inst),
    .io_pc(BranchDecode_io_pc),
    .io_out_is_ret(BranchDecode_io_out_is_ret),
    .io_out_is_call(BranchDecode_io_out_is_call),
    .io_out_target(BranchDecode_io_out_target),
    .io_out_cfi_type(BranchDecode_io_out_cfi_type),
    .io_out_sfb_offset_valid(BranchDecode_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits(BranchDecode_io_out_sfb_offset_bits),
    .io_out_shadowable(BranchDecode_io_out_shadowable)
  );
  BranchDecode BranchDecode_1 ( // @[frontend.scala 625:34]
    .clock(BranchDecode_1_clock),
    .reset(BranchDecode_1_reset),
    .io_inst(BranchDecode_1_io_inst),
    .io_pc(BranchDecode_1_io_pc),
    .io_out_is_ret(BranchDecode_1_io_out_is_ret),
    .io_out_is_call(BranchDecode_1_io_out_is_call),
    .io_out_target(BranchDecode_1_io_out_target),
    .io_out_cfi_type(BranchDecode_1_io_out_cfi_type),
    .io_out_sfb_offset_valid(BranchDecode_1_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits(BranchDecode_1_io_out_sfb_offset_bits),
    .io_out_shadowable(BranchDecode_1_io_out_shadowable)
  );
  BreakpointUnit BreakpointUnit_1 ( // @[frontend.scala 606:23]
    .clock(BreakpointUnit_1_clock),
    .reset(BreakpointUnit_1_reset),
    .io_status_debug(BreakpointUnit_1_io_status_debug),
    .io_status_cease(BreakpointUnit_1_io_status_cease),
    .io_status_wfi(BreakpointUnit_1_io_status_wfi),
    .io_status_isa(BreakpointUnit_1_io_status_isa),
    .io_status_dprv(BreakpointUnit_1_io_status_dprv),
    .io_status_prv(BreakpointUnit_1_io_status_prv),
    .io_status_sd(BreakpointUnit_1_io_status_sd),
    .io_status_zero2(BreakpointUnit_1_io_status_zero2),
    .io_status_sxl(BreakpointUnit_1_io_status_sxl),
    .io_status_uxl(BreakpointUnit_1_io_status_uxl),
    .io_status_sd_rv32(BreakpointUnit_1_io_status_sd_rv32),
    .io_status_zero1(BreakpointUnit_1_io_status_zero1),
    .io_status_tsr(BreakpointUnit_1_io_status_tsr),
    .io_status_tw(BreakpointUnit_1_io_status_tw),
    .io_status_tvm(BreakpointUnit_1_io_status_tvm),
    .io_status_mxr(BreakpointUnit_1_io_status_mxr),
    .io_status_sum(BreakpointUnit_1_io_status_sum),
    .io_status_mprv(BreakpointUnit_1_io_status_mprv),
    .io_status_xs(BreakpointUnit_1_io_status_xs),
    .io_status_fs(BreakpointUnit_1_io_status_fs),
    .io_status_mpp(BreakpointUnit_1_io_status_mpp),
    .io_status_vs(BreakpointUnit_1_io_status_vs),
    .io_status_spp(BreakpointUnit_1_io_status_spp),
    .io_status_mpie(BreakpointUnit_1_io_status_mpie),
    .io_status_hpie(BreakpointUnit_1_io_status_hpie),
    .io_status_spie(BreakpointUnit_1_io_status_spie),
    .io_status_upie(BreakpointUnit_1_io_status_upie),
    .io_status_mie(BreakpointUnit_1_io_status_mie),
    .io_status_hie(BreakpointUnit_1_io_status_hie),
    .io_status_sie(BreakpointUnit_1_io_status_sie),
    .io_status_uie(BreakpointUnit_1_io_status_uie),
    .io_pc(BreakpointUnit_1_io_pc),
    .io_ea(BreakpointUnit_1_io_ea),
    .io_xcpt_if(BreakpointUnit_1_io_xcpt_if),
    .io_xcpt_ld(BreakpointUnit_1_io_xcpt_ld),
    .io_xcpt_st(BreakpointUnit_1_io_xcpt_st),
    .io_debug_if(BreakpointUnit_1_io_debug_if),
    .io_debug_ld(BreakpointUnit_1_io_debug_ld),
    .io_debug_st(BreakpointUnit_1_io_debug_st)
  );
  RVCExpander RVCExpander_2 ( // @[consts.scala 330:25]
    .clock(RVCExpander_2_clock),
    .reset(RVCExpander_2_reset),
    .io_in(RVCExpander_2_io_in),
    .io_out_bits(RVCExpander_2_io_out_bits),
    .io_out_rd(RVCExpander_2_io_out_rd),
    .io_out_rs1(RVCExpander_2_io_out_rs1),
    .io_out_rs2(RVCExpander_2_io_out_rs2),
    .io_out_rs3(RVCExpander_2_io_out_rs3),
    .io_rvc(RVCExpander_2_io_rvc)
  );
  BranchDecode BranchDecode_2 ( // @[frontend.scala 663:33]
    .clock(BranchDecode_2_clock),
    .reset(BranchDecode_2_reset),
    .io_inst(BranchDecode_2_io_inst),
    .io_pc(BranchDecode_2_io_pc),
    .io_out_is_ret(BranchDecode_2_io_out_is_ret),
    .io_out_is_call(BranchDecode_2_io_out_is_call),
    .io_out_target(BranchDecode_2_io_out_target),
    .io_out_cfi_type(BranchDecode_2_io_out_cfi_type),
    .io_out_sfb_offset_valid(BranchDecode_2_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits(BranchDecode_2_io_out_sfb_offset_bits),
    .io_out_shadowable(BranchDecode_2_io_out_shadowable)
  );
  BreakpointUnit BreakpointUnit_2 ( // @[frontend.scala 606:23]
    .clock(BreakpointUnit_2_clock),
    .reset(BreakpointUnit_2_reset),
    .io_status_debug(BreakpointUnit_2_io_status_debug),
    .io_status_cease(BreakpointUnit_2_io_status_cease),
    .io_status_wfi(BreakpointUnit_2_io_status_wfi),
    .io_status_isa(BreakpointUnit_2_io_status_isa),
    .io_status_dprv(BreakpointUnit_2_io_status_dprv),
    .io_status_prv(BreakpointUnit_2_io_status_prv),
    .io_status_sd(BreakpointUnit_2_io_status_sd),
    .io_status_zero2(BreakpointUnit_2_io_status_zero2),
    .io_status_sxl(BreakpointUnit_2_io_status_sxl),
    .io_status_uxl(BreakpointUnit_2_io_status_uxl),
    .io_status_sd_rv32(BreakpointUnit_2_io_status_sd_rv32),
    .io_status_zero1(BreakpointUnit_2_io_status_zero1),
    .io_status_tsr(BreakpointUnit_2_io_status_tsr),
    .io_status_tw(BreakpointUnit_2_io_status_tw),
    .io_status_tvm(BreakpointUnit_2_io_status_tvm),
    .io_status_mxr(BreakpointUnit_2_io_status_mxr),
    .io_status_sum(BreakpointUnit_2_io_status_sum),
    .io_status_mprv(BreakpointUnit_2_io_status_mprv),
    .io_status_xs(BreakpointUnit_2_io_status_xs),
    .io_status_fs(BreakpointUnit_2_io_status_fs),
    .io_status_mpp(BreakpointUnit_2_io_status_mpp),
    .io_status_vs(BreakpointUnit_2_io_status_vs),
    .io_status_spp(BreakpointUnit_2_io_status_spp),
    .io_status_mpie(BreakpointUnit_2_io_status_mpie),
    .io_status_hpie(BreakpointUnit_2_io_status_hpie),
    .io_status_spie(BreakpointUnit_2_io_status_spie),
    .io_status_upie(BreakpointUnit_2_io_status_upie),
    .io_status_mie(BreakpointUnit_2_io_status_mie),
    .io_status_hie(BreakpointUnit_2_io_status_hie),
    .io_status_sie(BreakpointUnit_2_io_status_sie),
    .io_status_uie(BreakpointUnit_2_io_status_uie),
    .io_pc(BreakpointUnit_2_io_pc),
    .io_ea(BreakpointUnit_2_io_ea),
    .io_xcpt_if(BreakpointUnit_2_io_xcpt_if),
    .io_xcpt_ld(BreakpointUnit_2_io_xcpt_ld),
    .io_xcpt_st(BreakpointUnit_2_io_xcpt_st),
    .io_debug_if(BreakpointUnit_2_io_debug_if),
    .io_debug_ld(BreakpointUnit_2_io_debug_ld),
    .io_debug_st(BreakpointUnit_2_io_debug_st)
  );
  RVCExpander RVCExpander_3 ( // @[consts.scala 330:25]
    .clock(RVCExpander_3_clock),
    .reset(RVCExpander_3_reset),
    .io_in(RVCExpander_3_io_in),
    .io_out_bits(RVCExpander_3_io_out_bits),
    .io_out_rd(RVCExpander_3_io_out_rd),
    .io_out_rs1(RVCExpander_3_io_out_rs1),
    .io_out_rs2(RVCExpander_3_io_out_rs2),
    .io_out_rs3(RVCExpander_3_io_out_rs3),
    .io_rvc(RVCExpander_3_io_rvc)
  );
  BranchDecode BranchDecode_3 ( // @[frontend.scala 663:33]
    .clock(BranchDecode_3_clock),
    .reset(BranchDecode_3_reset),
    .io_inst(BranchDecode_3_io_inst),
    .io_pc(BranchDecode_3_io_pc),
    .io_out_is_ret(BranchDecode_3_io_out_is_ret),
    .io_out_is_call(BranchDecode_3_io_out_is_call),
    .io_out_target(BranchDecode_3_io_out_target),
    .io_out_cfi_type(BranchDecode_3_io_out_cfi_type),
    .io_out_sfb_offset_valid(BranchDecode_3_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits(BranchDecode_3_io_out_sfb_offset_bits),
    .io_out_shadowable(BranchDecode_3_io_out_shadowable)
  );
  BreakpointUnit BreakpointUnit_3 ( // @[frontend.scala 606:23]
    .clock(BreakpointUnit_3_clock),
    .reset(BreakpointUnit_3_reset),
    .io_status_debug(BreakpointUnit_3_io_status_debug),
    .io_status_cease(BreakpointUnit_3_io_status_cease),
    .io_status_wfi(BreakpointUnit_3_io_status_wfi),
    .io_status_isa(BreakpointUnit_3_io_status_isa),
    .io_status_dprv(BreakpointUnit_3_io_status_dprv),
    .io_status_prv(BreakpointUnit_3_io_status_prv),
    .io_status_sd(BreakpointUnit_3_io_status_sd),
    .io_status_zero2(BreakpointUnit_3_io_status_zero2),
    .io_status_sxl(BreakpointUnit_3_io_status_sxl),
    .io_status_uxl(BreakpointUnit_3_io_status_uxl),
    .io_status_sd_rv32(BreakpointUnit_3_io_status_sd_rv32),
    .io_status_zero1(BreakpointUnit_3_io_status_zero1),
    .io_status_tsr(BreakpointUnit_3_io_status_tsr),
    .io_status_tw(BreakpointUnit_3_io_status_tw),
    .io_status_tvm(BreakpointUnit_3_io_status_tvm),
    .io_status_mxr(BreakpointUnit_3_io_status_mxr),
    .io_status_sum(BreakpointUnit_3_io_status_sum),
    .io_status_mprv(BreakpointUnit_3_io_status_mprv),
    .io_status_xs(BreakpointUnit_3_io_status_xs),
    .io_status_fs(BreakpointUnit_3_io_status_fs),
    .io_status_mpp(BreakpointUnit_3_io_status_mpp),
    .io_status_vs(BreakpointUnit_3_io_status_vs),
    .io_status_spp(BreakpointUnit_3_io_status_spp),
    .io_status_mpie(BreakpointUnit_3_io_status_mpie),
    .io_status_hpie(BreakpointUnit_3_io_status_hpie),
    .io_status_spie(BreakpointUnit_3_io_status_spie),
    .io_status_upie(BreakpointUnit_3_io_status_upie),
    .io_status_mie(BreakpointUnit_3_io_status_mie),
    .io_status_hie(BreakpointUnit_3_io_status_hie),
    .io_status_sie(BreakpointUnit_3_io_status_sie),
    .io_status_uie(BreakpointUnit_3_io_status_uie),
    .io_pc(BreakpointUnit_3_io_pc),
    .io_ea(BreakpointUnit_3_io_ea),
    .io_xcpt_if(BreakpointUnit_3_io_xcpt_if),
    .io_xcpt_ld(BreakpointUnit_3_io_xcpt_ld),
    .io_xcpt_st(BreakpointUnit_3_io_xcpt_st),
    .io_debug_if(BreakpointUnit_3_io_debug_if),
    .io_debug_ld(BreakpointUnit_3_io_debug_ld),
    .io_debug_st(BreakpointUnit_3_io_debug_st)
  );
  RVCExpander RVCExpander_4 ( // @[consts.scala 330:25]
    .clock(RVCExpander_4_clock),
    .reset(RVCExpander_4_reset),
    .io_in(RVCExpander_4_io_in),
    .io_out_bits(RVCExpander_4_io_out_bits),
    .io_out_rd(RVCExpander_4_io_out_rd),
    .io_out_rs1(RVCExpander_4_io_out_rs1),
    .io_out_rs2(RVCExpander_4_io_out_rs2),
    .io_out_rs3(RVCExpander_4_io_out_rs3),
    .io_rvc(RVCExpander_4_io_rvc)
  );
  BranchDecode BranchDecode_4 ( // @[frontend.scala 663:33]
    .clock(BranchDecode_4_clock),
    .reset(BranchDecode_4_reset),
    .io_inst(BranchDecode_4_io_inst),
    .io_pc(BranchDecode_4_io_pc),
    .io_out_is_ret(BranchDecode_4_io_out_is_ret),
    .io_out_is_call(BranchDecode_4_io_out_is_call),
    .io_out_target(BranchDecode_4_io_out_target),
    .io_out_cfi_type(BranchDecode_4_io_out_cfi_type),
    .io_out_sfb_offset_valid(BranchDecode_4_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits(BranchDecode_4_io_out_sfb_offset_bits),
    .io_out_shadowable(BranchDecode_4_io_out_shadowable)
  );
  Queue_23 f4_btb_corrections ( // @[frontend.scala 842:34]
    .clock(f4_btb_corrections_clock),
    .reset(f4_btb_corrections_reset),
    .io_enq_ready(f4_btb_corrections_io_enq_ready),
    .io_enq_valid(f4_btb_corrections_io_enq_valid),
    .io_enq_bits_is_mispredict_update(f4_btb_corrections_io_enq_bits_is_mispredict_update),
    .io_enq_bits_is_repair_update(f4_btb_corrections_io_enq_bits_is_repair_update),
    .io_enq_bits_btb_mispredicts(f4_btb_corrections_io_enq_bits_btb_mispredicts),
    .io_enq_bits_pc(f4_btb_corrections_io_enq_bits_pc),
    .io_enq_bits_br_mask(f4_btb_corrections_io_enq_bits_br_mask),
    .io_enq_bits_cfi_idx_valid(f4_btb_corrections_io_enq_bits_cfi_idx_valid),
    .io_enq_bits_cfi_idx_bits(f4_btb_corrections_io_enq_bits_cfi_idx_bits),
    .io_enq_bits_cfi_taken(f4_btb_corrections_io_enq_bits_cfi_taken),
    .io_enq_bits_cfi_mispredicted(f4_btb_corrections_io_enq_bits_cfi_mispredicted),
    .io_enq_bits_cfi_is_br(f4_btb_corrections_io_enq_bits_cfi_is_br),
    .io_enq_bits_cfi_is_jal(f4_btb_corrections_io_enq_bits_cfi_is_jal),
    .io_enq_bits_cfi_is_jalr(f4_btb_corrections_io_enq_bits_cfi_is_jalr),
    .io_enq_bits_ghist_old_history(f4_btb_corrections_io_enq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken(f4_btb_corrections_io_enq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken(f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken(f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx(f4_btb_corrections_io_enq_bits_ghist_ras_idx),
    .io_enq_bits_lhist_0(f4_btb_corrections_io_enq_bits_lhist_0),
    .io_enq_bits_target(f4_btb_corrections_io_enq_bits_target),
    .io_enq_bits_meta_0(f4_btb_corrections_io_enq_bits_meta_0),
    .io_deq_ready(f4_btb_corrections_io_deq_ready),
    .io_deq_valid(f4_btb_corrections_io_deq_valid),
    .io_deq_bits_is_mispredict_update(f4_btb_corrections_io_deq_bits_is_mispredict_update),
    .io_deq_bits_is_repair_update(f4_btb_corrections_io_deq_bits_is_repair_update),
    .io_deq_bits_btb_mispredicts(f4_btb_corrections_io_deq_bits_btb_mispredicts),
    .io_deq_bits_pc(f4_btb_corrections_io_deq_bits_pc),
    .io_deq_bits_br_mask(f4_btb_corrections_io_deq_bits_br_mask),
    .io_deq_bits_cfi_idx_valid(f4_btb_corrections_io_deq_bits_cfi_idx_valid),
    .io_deq_bits_cfi_idx_bits(f4_btb_corrections_io_deq_bits_cfi_idx_bits),
    .io_deq_bits_cfi_taken(f4_btb_corrections_io_deq_bits_cfi_taken),
    .io_deq_bits_cfi_mispredicted(f4_btb_corrections_io_deq_bits_cfi_mispredicted),
    .io_deq_bits_cfi_is_br(f4_btb_corrections_io_deq_bits_cfi_is_br),
    .io_deq_bits_cfi_is_jal(f4_btb_corrections_io_deq_bits_cfi_is_jal),
    .io_deq_bits_cfi_is_jalr(f4_btb_corrections_io_deq_bits_cfi_is_jalr),
    .io_deq_bits_ghist_old_history(f4_btb_corrections_io_deq_bits_ghist_old_history),
    .io_deq_bits_ghist_current_saw_branch_not_taken(f4_btb_corrections_io_deq_bits_ghist_current_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_not_taken(f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_taken(f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_taken),
    .io_deq_bits_ghist_ras_idx(f4_btb_corrections_io_deq_bits_ghist_ras_idx),
    .io_deq_bits_lhist_0(f4_btb_corrections_io_deq_bits_lhist_0),
    .io_deq_bits_target(f4_btb_corrections_io_deq_bits_target),
    .io_deq_bits_meta_0(f4_btb_corrections_io_deq_bits_meta_0),
    .io_count(f4_btb_corrections_io_count)
  );
  Queue_24 f4 ( // @[frontend.scala 859:11]
    .clock(f4_clock),
    .reset(f4_reset),
    .io_enq_ready(f4_io_enq_ready),
    .io_enq_valid(f4_io_enq_valid),
    .io_enq_bits_pc(f4_io_enq_bits_pc),
    .io_enq_bits_next_pc(f4_io_enq_bits_next_pc),
    .io_enq_bits_edge_inst_0(f4_io_enq_bits_edge_inst_0),
    .io_enq_bits_insts_0(f4_io_enq_bits_insts_0),
    .io_enq_bits_insts_1(f4_io_enq_bits_insts_1),
    .io_enq_bits_insts_2(f4_io_enq_bits_insts_2),
    .io_enq_bits_insts_3(f4_io_enq_bits_insts_3),
    .io_enq_bits_exp_insts_0(f4_io_enq_bits_exp_insts_0),
    .io_enq_bits_exp_insts_1(f4_io_enq_bits_exp_insts_1),
    .io_enq_bits_exp_insts_2(f4_io_enq_bits_exp_insts_2),
    .io_enq_bits_exp_insts_3(f4_io_enq_bits_exp_insts_3),
    .io_enq_bits_sfbs_0(f4_io_enq_bits_sfbs_0),
    .io_enq_bits_sfbs_1(f4_io_enq_bits_sfbs_1),
    .io_enq_bits_sfbs_2(f4_io_enq_bits_sfbs_2),
    .io_enq_bits_sfbs_3(f4_io_enq_bits_sfbs_3),
    .io_enq_bits_sfb_masks_0(f4_io_enq_bits_sfb_masks_0),
    .io_enq_bits_sfb_masks_1(f4_io_enq_bits_sfb_masks_1),
    .io_enq_bits_sfb_masks_2(f4_io_enq_bits_sfb_masks_2),
    .io_enq_bits_sfb_masks_3(f4_io_enq_bits_sfb_masks_3),
    .io_enq_bits_sfb_dests_0(f4_io_enq_bits_sfb_dests_0),
    .io_enq_bits_sfb_dests_1(f4_io_enq_bits_sfb_dests_1),
    .io_enq_bits_sfb_dests_2(f4_io_enq_bits_sfb_dests_2),
    .io_enq_bits_sfb_dests_3(f4_io_enq_bits_sfb_dests_3),
    .io_enq_bits_shadowable_mask_0(f4_io_enq_bits_shadowable_mask_0),
    .io_enq_bits_shadowable_mask_1(f4_io_enq_bits_shadowable_mask_1),
    .io_enq_bits_shadowable_mask_2(f4_io_enq_bits_shadowable_mask_2),
    .io_enq_bits_shadowable_mask_3(f4_io_enq_bits_shadowable_mask_3),
    .io_enq_bits_shadowed_mask_0(f4_io_enq_bits_shadowed_mask_0),
    .io_enq_bits_shadowed_mask_1(f4_io_enq_bits_shadowed_mask_1),
    .io_enq_bits_shadowed_mask_2(f4_io_enq_bits_shadowed_mask_2),
    .io_enq_bits_shadowed_mask_3(f4_io_enq_bits_shadowed_mask_3),
    .io_enq_bits_cfi_idx_valid(f4_io_enq_bits_cfi_idx_valid),
    .io_enq_bits_cfi_idx_bits(f4_io_enq_bits_cfi_idx_bits),
    .io_enq_bits_cfi_type(f4_io_enq_bits_cfi_type),
    .io_enq_bits_cfi_is_call(f4_io_enq_bits_cfi_is_call),
    .io_enq_bits_cfi_is_ret(f4_io_enq_bits_cfi_is_ret),
    .io_enq_bits_cfi_npc_plus4(f4_io_enq_bits_cfi_npc_plus4),
    .io_enq_bits_ras_top(f4_io_enq_bits_ras_top),
    .io_enq_bits_ftq_idx(f4_io_enq_bits_ftq_idx),
    .io_enq_bits_mask(f4_io_enq_bits_mask),
    .io_enq_bits_br_mask(f4_io_enq_bits_br_mask),
    .io_enq_bits_ghist_old_history(f4_io_enq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken(f4_io_enq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken(f4_io_enq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken(f4_io_enq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx(f4_io_enq_bits_ghist_ras_idx),
    .io_enq_bits_lhist_0(f4_io_enq_bits_lhist_0),
    .io_enq_bits_xcpt_pf_if(f4_io_enq_bits_xcpt_pf_if),
    .io_enq_bits_xcpt_ae_if(f4_io_enq_bits_xcpt_ae_if),
    .io_enq_bits_bp_debug_if_oh_0(f4_io_enq_bits_bp_debug_if_oh_0),
    .io_enq_bits_bp_debug_if_oh_1(f4_io_enq_bits_bp_debug_if_oh_1),
    .io_enq_bits_bp_debug_if_oh_2(f4_io_enq_bits_bp_debug_if_oh_2),
    .io_enq_bits_bp_debug_if_oh_3(f4_io_enq_bits_bp_debug_if_oh_3),
    .io_enq_bits_bp_xcpt_if_oh_0(f4_io_enq_bits_bp_xcpt_if_oh_0),
    .io_enq_bits_bp_xcpt_if_oh_1(f4_io_enq_bits_bp_xcpt_if_oh_1),
    .io_enq_bits_bp_xcpt_if_oh_2(f4_io_enq_bits_bp_xcpt_if_oh_2),
    .io_enq_bits_bp_xcpt_if_oh_3(f4_io_enq_bits_bp_xcpt_if_oh_3),
    .io_enq_bits_end_half_valid(f4_io_enq_bits_end_half_valid),
    .io_enq_bits_end_half_bits(f4_io_enq_bits_end_half_bits),
    .io_enq_bits_bpd_meta_0(f4_io_enq_bits_bpd_meta_0),
    .io_enq_bits_fsrc(f4_io_enq_bits_fsrc),
    .io_enq_bits_tsrc(f4_io_enq_bits_tsrc),
    .io_deq_ready(f4_io_deq_ready),
    .io_deq_valid(f4_io_deq_valid),
    .io_deq_bits_pc(f4_io_deq_bits_pc),
    .io_deq_bits_next_pc(f4_io_deq_bits_next_pc),
    .io_deq_bits_edge_inst_0(f4_io_deq_bits_edge_inst_0),
    .io_deq_bits_insts_0(f4_io_deq_bits_insts_0),
    .io_deq_bits_insts_1(f4_io_deq_bits_insts_1),
    .io_deq_bits_insts_2(f4_io_deq_bits_insts_2),
    .io_deq_bits_insts_3(f4_io_deq_bits_insts_3),
    .io_deq_bits_exp_insts_0(f4_io_deq_bits_exp_insts_0),
    .io_deq_bits_exp_insts_1(f4_io_deq_bits_exp_insts_1),
    .io_deq_bits_exp_insts_2(f4_io_deq_bits_exp_insts_2),
    .io_deq_bits_exp_insts_3(f4_io_deq_bits_exp_insts_3),
    .io_deq_bits_sfbs_0(f4_io_deq_bits_sfbs_0),
    .io_deq_bits_sfbs_1(f4_io_deq_bits_sfbs_1),
    .io_deq_bits_sfbs_2(f4_io_deq_bits_sfbs_2),
    .io_deq_bits_sfbs_3(f4_io_deq_bits_sfbs_3),
    .io_deq_bits_sfb_masks_0(f4_io_deq_bits_sfb_masks_0),
    .io_deq_bits_sfb_masks_1(f4_io_deq_bits_sfb_masks_1),
    .io_deq_bits_sfb_masks_2(f4_io_deq_bits_sfb_masks_2),
    .io_deq_bits_sfb_masks_3(f4_io_deq_bits_sfb_masks_3),
    .io_deq_bits_sfb_dests_0(f4_io_deq_bits_sfb_dests_0),
    .io_deq_bits_sfb_dests_1(f4_io_deq_bits_sfb_dests_1),
    .io_deq_bits_sfb_dests_2(f4_io_deq_bits_sfb_dests_2),
    .io_deq_bits_sfb_dests_3(f4_io_deq_bits_sfb_dests_3),
    .io_deq_bits_shadowable_mask_0(f4_io_deq_bits_shadowable_mask_0),
    .io_deq_bits_shadowable_mask_1(f4_io_deq_bits_shadowable_mask_1),
    .io_deq_bits_shadowable_mask_2(f4_io_deq_bits_shadowable_mask_2),
    .io_deq_bits_shadowable_mask_3(f4_io_deq_bits_shadowable_mask_3),
    .io_deq_bits_shadowed_mask_0(f4_io_deq_bits_shadowed_mask_0),
    .io_deq_bits_shadowed_mask_1(f4_io_deq_bits_shadowed_mask_1),
    .io_deq_bits_shadowed_mask_2(f4_io_deq_bits_shadowed_mask_2),
    .io_deq_bits_shadowed_mask_3(f4_io_deq_bits_shadowed_mask_3),
    .io_deq_bits_cfi_idx_valid(f4_io_deq_bits_cfi_idx_valid),
    .io_deq_bits_cfi_idx_bits(f4_io_deq_bits_cfi_idx_bits),
    .io_deq_bits_cfi_type(f4_io_deq_bits_cfi_type),
    .io_deq_bits_cfi_is_call(f4_io_deq_bits_cfi_is_call),
    .io_deq_bits_cfi_is_ret(f4_io_deq_bits_cfi_is_ret),
    .io_deq_bits_cfi_npc_plus4(f4_io_deq_bits_cfi_npc_plus4),
    .io_deq_bits_ras_top(f4_io_deq_bits_ras_top),
    .io_deq_bits_ftq_idx(f4_io_deq_bits_ftq_idx),
    .io_deq_bits_mask(f4_io_deq_bits_mask),
    .io_deq_bits_br_mask(f4_io_deq_bits_br_mask),
    .io_deq_bits_ghist_old_history(f4_io_deq_bits_ghist_old_history),
    .io_deq_bits_ghist_current_saw_branch_not_taken(f4_io_deq_bits_ghist_current_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_not_taken(f4_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_taken(f4_io_deq_bits_ghist_new_saw_branch_taken),
    .io_deq_bits_ghist_ras_idx(f4_io_deq_bits_ghist_ras_idx),
    .io_deq_bits_lhist_0(f4_io_deq_bits_lhist_0),
    .io_deq_bits_xcpt_pf_if(f4_io_deq_bits_xcpt_pf_if),
    .io_deq_bits_xcpt_ae_if(f4_io_deq_bits_xcpt_ae_if),
    .io_deq_bits_bp_debug_if_oh_0(f4_io_deq_bits_bp_debug_if_oh_0),
    .io_deq_bits_bp_debug_if_oh_1(f4_io_deq_bits_bp_debug_if_oh_1),
    .io_deq_bits_bp_debug_if_oh_2(f4_io_deq_bits_bp_debug_if_oh_2),
    .io_deq_bits_bp_debug_if_oh_3(f4_io_deq_bits_bp_debug_if_oh_3),
    .io_deq_bits_bp_xcpt_if_oh_0(f4_io_deq_bits_bp_xcpt_if_oh_0),
    .io_deq_bits_bp_xcpt_if_oh_1(f4_io_deq_bits_bp_xcpt_if_oh_1),
    .io_deq_bits_bp_xcpt_if_oh_2(f4_io_deq_bits_bp_xcpt_if_oh_2),
    .io_deq_bits_bp_xcpt_if_oh_3(f4_io_deq_bits_bp_xcpt_if_oh_3),
    .io_deq_bits_end_half_valid(f4_io_deq_bits_end_half_valid),
    .io_deq_bits_end_half_bits(f4_io_deq_bits_end_half_bits),
    .io_deq_bits_bpd_meta_0(f4_io_deq_bits_bpd_meta_0),
    .io_deq_bits_fsrc(f4_io_deq_bits_fsrc),
    .io_deq_bits_tsrc(f4_io_deq_bits_tsrc),
    .io_count(f4_io_count)
  );
  FetchBuffer fb ( // @[frontend.scala 861:19]
    .clock(fb_clock),
    .reset(fb_reset),
    .io_enq_ready(fb_io_enq_ready),
    .io_enq_valid(fb_io_enq_valid),
    .io_enq_bits_pc(fb_io_enq_bits_pc),
    .io_enq_bits_next_pc(fb_io_enq_bits_next_pc),
    .io_enq_bits_edge_inst_0(fb_io_enq_bits_edge_inst_0),
    .io_enq_bits_insts_0(fb_io_enq_bits_insts_0),
    .io_enq_bits_insts_1(fb_io_enq_bits_insts_1),
    .io_enq_bits_insts_2(fb_io_enq_bits_insts_2),
    .io_enq_bits_insts_3(fb_io_enq_bits_insts_3),
    .io_enq_bits_exp_insts_0(fb_io_enq_bits_exp_insts_0),
    .io_enq_bits_exp_insts_1(fb_io_enq_bits_exp_insts_1),
    .io_enq_bits_exp_insts_2(fb_io_enq_bits_exp_insts_2),
    .io_enq_bits_exp_insts_3(fb_io_enq_bits_exp_insts_3),
    .io_enq_bits_sfbs_0(fb_io_enq_bits_sfbs_0),
    .io_enq_bits_sfbs_1(fb_io_enq_bits_sfbs_1),
    .io_enq_bits_sfbs_2(fb_io_enq_bits_sfbs_2),
    .io_enq_bits_sfbs_3(fb_io_enq_bits_sfbs_3),
    .io_enq_bits_sfb_masks_0(fb_io_enq_bits_sfb_masks_0),
    .io_enq_bits_sfb_masks_1(fb_io_enq_bits_sfb_masks_1),
    .io_enq_bits_sfb_masks_2(fb_io_enq_bits_sfb_masks_2),
    .io_enq_bits_sfb_masks_3(fb_io_enq_bits_sfb_masks_3),
    .io_enq_bits_sfb_dests_0(fb_io_enq_bits_sfb_dests_0),
    .io_enq_bits_sfb_dests_1(fb_io_enq_bits_sfb_dests_1),
    .io_enq_bits_sfb_dests_2(fb_io_enq_bits_sfb_dests_2),
    .io_enq_bits_sfb_dests_3(fb_io_enq_bits_sfb_dests_3),
    .io_enq_bits_shadowable_mask_0(fb_io_enq_bits_shadowable_mask_0),
    .io_enq_bits_shadowable_mask_1(fb_io_enq_bits_shadowable_mask_1),
    .io_enq_bits_shadowable_mask_2(fb_io_enq_bits_shadowable_mask_2),
    .io_enq_bits_shadowable_mask_3(fb_io_enq_bits_shadowable_mask_3),
    .io_enq_bits_shadowed_mask_0(fb_io_enq_bits_shadowed_mask_0),
    .io_enq_bits_shadowed_mask_1(fb_io_enq_bits_shadowed_mask_1),
    .io_enq_bits_shadowed_mask_2(fb_io_enq_bits_shadowed_mask_2),
    .io_enq_bits_shadowed_mask_3(fb_io_enq_bits_shadowed_mask_3),
    .io_enq_bits_cfi_idx_valid(fb_io_enq_bits_cfi_idx_valid),
    .io_enq_bits_cfi_idx_bits(fb_io_enq_bits_cfi_idx_bits),
    .io_enq_bits_cfi_type(fb_io_enq_bits_cfi_type),
    .io_enq_bits_cfi_is_call(fb_io_enq_bits_cfi_is_call),
    .io_enq_bits_cfi_is_ret(fb_io_enq_bits_cfi_is_ret),
    .io_enq_bits_cfi_npc_plus4(fb_io_enq_bits_cfi_npc_plus4),
    .io_enq_bits_ras_top(fb_io_enq_bits_ras_top),
    .io_enq_bits_ftq_idx(fb_io_enq_bits_ftq_idx),
    .io_enq_bits_mask(fb_io_enq_bits_mask),
    .io_enq_bits_br_mask(fb_io_enq_bits_br_mask),
    .io_enq_bits_ghist_old_history(fb_io_enq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken(fb_io_enq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken(fb_io_enq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken(fb_io_enq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx(fb_io_enq_bits_ghist_ras_idx),
    .io_enq_bits_lhist_0(fb_io_enq_bits_lhist_0),
    .io_enq_bits_xcpt_pf_if(fb_io_enq_bits_xcpt_pf_if),
    .io_enq_bits_xcpt_ae_if(fb_io_enq_bits_xcpt_ae_if),
    .io_enq_bits_bp_debug_if_oh_0(fb_io_enq_bits_bp_debug_if_oh_0),
    .io_enq_bits_bp_debug_if_oh_1(fb_io_enq_bits_bp_debug_if_oh_1),
    .io_enq_bits_bp_debug_if_oh_2(fb_io_enq_bits_bp_debug_if_oh_2),
    .io_enq_bits_bp_debug_if_oh_3(fb_io_enq_bits_bp_debug_if_oh_3),
    .io_enq_bits_bp_xcpt_if_oh_0(fb_io_enq_bits_bp_xcpt_if_oh_0),
    .io_enq_bits_bp_xcpt_if_oh_1(fb_io_enq_bits_bp_xcpt_if_oh_1),
    .io_enq_bits_bp_xcpt_if_oh_2(fb_io_enq_bits_bp_xcpt_if_oh_2),
    .io_enq_bits_bp_xcpt_if_oh_3(fb_io_enq_bits_bp_xcpt_if_oh_3),
    .io_enq_bits_end_half_valid(fb_io_enq_bits_end_half_valid),
    .io_enq_bits_end_half_bits(fb_io_enq_bits_end_half_bits),
    .io_enq_bits_bpd_meta_0(fb_io_enq_bits_bpd_meta_0),
    .io_enq_bits_fsrc(fb_io_enq_bits_fsrc),
    .io_enq_bits_tsrc(fb_io_enq_bits_tsrc),
    .io_deq_ready(fb_io_deq_ready),
    .io_deq_valid(fb_io_deq_valid),
    .io_deq_bits_uops_0_valid(fb_io_deq_bits_uops_0_valid),
    .io_deq_bits_uops_0_bits_uopc(fb_io_deq_bits_uops_0_bits_uopc),
    .io_deq_bits_uops_0_bits_inst(fb_io_deq_bits_uops_0_bits_inst),
    .io_deq_bits_uops_0_bits_debug_inst(fb_io_deq_bits_uops_0_bits_debug_inst),
    .io_deq_bits_uops_0_bits_is_rvc(fb_io_deq_bits_uops_0_bits_is_rvc),
    .io_deq_bits_uops_0_bits_debug_pc(fb_io_deq_bits_uops_0_bits_debug_pc),
    .io_deq_bits_uops_0_bits_iq_type(fb_io_deq_bits_uops_0_bits_iq_type),
    .io_deq_bits_uops_0_bits_fu_code(fb_io_deq_bits_uops_0_bits_fu_code),
    .io_deq_bits_uops_0_bits_ctrl_br_type(fb_io_deq_bits_uops_0_bits_ctrl_br_type),
    .io_deq_bits_uops_0_bits_ctrl_op1_sel(fb_io_deq_bits_uops_0_bits_ctrl_op1_sel),
    .io_deq_bits_uops_0_bits_ctrl_op2_sel(fb_io_deq_bits_uops_0_bits_ctrl_op2_sel),
    .io_deq_bits_uops_0_bits_ctrl_imm_sel(fb_io_deq_bits_uops_0_bits_ctrl_imm_sel),
    .io_deq_bits_uops_0_bits_ctrl_op_fcn(fb_io_deq_bits_uops_0_bits_ctrl_op_fcn),
    .io_deq_bits_uops_0_bits_ctrl_fcn_dw(fb_io_deq_bits_uops_0_bits_ctrl_fcn_dw),
    .io_deq_bits_uops_0_bits_ctrl_csr_cmd(fb_io_deq_bits_uops_0_bits_ctrl_csr_cmd),
    .io_deq_bits_uops_0_bits_ctrl_is_load(fb_io_deq_bits_uops_0_bits_ctrl_is_load),
    .io_deq_bits_uops_0_bits_ctrl_is_sta(fb_io_deq_bits_uops_0_bits_ctrl_is_sta),
    .io_deq_bits_uops_0_bits_ctrl_is_std(fb_io_deq_bits_uops_0_bits_ctrl_is_std),
    .io_deq_bits_uops_0_bits_iw_state(fb_io_deq_bits_uops_0_bits_iw_state),
    .io_deq_bits_uops_0_bits_iw_p1_poisoned(fb_io_deq_bits_uops_0_bits_iw_p1_poisoned),
    .io_deq_bits_uops_0_bits_iw_p2_poisoned(fb_io_deq_bits_uops_0_bits_iw_p2_poisoned),
    .io_deq_bits_uops_0_bits_is_br(fb_io_deq_bits_uops_0_bits_is_br),
    .io_deq_bits_uops_0_bits_is_jalr(fb_io_deq_bits_uops_0_bits_is_jalr),
    .io_deq_bits_uops_0_bits_is_jal(fb_io_deq_bits_uops_0_bits_is_jal),
    .io_deq_bits_uops_0_bits_is_sfb(fb_io_deq_bits_uops_0_bits_is_sfb),
    .io_deq_bits_uops_0_bits_br_mask(fb_io_deq_bits_uops_0_bits_br_mask),
    .io_deq_bits_uops_0_bits_br_tag(fb_io_deq_bits_uops_0_bits_br_tag),
    .io_deq_bits_uops_0_bits_ftq_idx(fb_io_deq_bits_uops_0_bits_ftq_idx),
    .io_deq_bits_uops_0_bits_edge_inst(fb_io_deq_bits_uops_0_bits_edge_inst),
    .io_deq_bits_uops_0_bits_pc_lob(fb_io_deq_bits_uops_0_bits_pc_lob),
    .io_deq_bits_uops_0_bits_taken(fb_io_deq_bits_uops_0_bits_taken),
    .io_deq_bits_uops_0_bits_imm_packed(fb_io_deq_bits_uops_0_bits_imm_packed),
    .io_deq_bits_uops_0_bits_csr_addr(fb_io_deq_bits_uops_0_bits_csr_addr),
    .io_deq_bits_uops_0_bits_rob_idx(fb_io_deq_bits_uops_0_bits_rob_idx),
    .io_deq_bits_uops_0_bits_ldq_idx(fb_io_deq_bits_uops_0_bits_ldq_idx),
    .io_deq_bits_uops_0_bits_stq_idx(fb_io_deq_bits_uops_0_bits_stq_idx),
    .io_deq_bits_uops_0_bits_rxq_idx(fb_io_deq_bits_uops_0_bits_rxq_idx),
    .io_deq_bits_uops_0_bits_pdst(fb_io_deq_bits_uops_0_bits_pdst),
    .io_deq_bits_uops_0_bits_prs1(fb_io_deq_bits_uops_0_bits_prs1),
    .io_deq_bits_uops_0_bits_prs2(fb_io_deq_bits_uops_0_bits_prs2),
    .io_deq_bits_uops_0_bits_prs3(fb_io_deq_bits_uops_0_bits_prs3),
    .io_deq_bits_uops_0_bits_ppred(fb_io_deq_bits_uops_0_bits_ppred),
    .io_deq_bits_uops_0_bits_prs1_busy(fb_io_deq_bits_uops_0_bits_prs1_busy),
    .io_deq_bits_uops_0_bits_prs2_busy(fb_io_deq_bits_uops_0_bits_prs2_busy),
    .io_deq_bits_uops_0_bits_prs3_busy(fb_io_deq_bits_uops_0_bits_prs3_busy),
    .io_deq_bits_uops_0_bits_ppred_busy(fb_io_deq_bits_uops_0_bits_ppred_busy),
    .io_deq_bits_uops_0_bits_stale_pdst(fb_io_deq_bits_uops_0_bits_stale_pdst),
    .io_deq_bits_uops_0_bits_exception(fb_io_deq_bits_uops_0_bits_exception),
    .io_deq_bits_uops_0_bits_exc_cause(fb_io_deq_bits_uops_0_bits_exc_cause),
    .io_deq_bits_uops_0_bits_bypassable(fb_io_deq_bits_uops_0_bits_bypassable),
    .io_deq_bits_uops_0_bits_mem_cmd(fb_io_deq_bits_uops_0_bits_mem_cmd),
    .io_deq_bits_uops_0_bits_mem_size(fb_io_deq_bits_uops_0_bits_mem_size),
    .io_deq_bits_uops_0_bits_mem_signed(fb_io_deq_bits_uops_0_bits_mem_signed),
    .io_deq_bits_uops_0_bits_is_fence(fb_io_deq_bits_uops_0_bits_is_fence),
    .io_deq_bits_uops_0_bits_is_fencei(fb_io_deq_bits_uops_0_bits_is_fencei),
    .io_deq_bits_uops_0_bits_is_amo(fb_io_deq_bits_uops_0_bits_is_amo),
    .io_deq_bits_uops_0_bits_uses_ldq(fb_io_deq_bits_uops_0_bits_uses_ldq),
    .io_deq_bits_uops_0_bits_uses_stq(fb_io_deq_bits_uops_0_bits_uses_stq),
    .io_deq_bits_uops_0_bits_is_sys_pc2epc(fb_io_deq_bits_uops_0_bits_is_sys_pc2epc),
    .io_deq_bits_uops_0_bits_is_unique(fb_io_deq_bits_uops_0_bits_is_unique),
    .io_deq_bits_uops_0_bits_flush_on_commit(fb_io_deq_bits_uops_0_bits_flush_on_commit),
    .io_deq_bits_uops_0_bits_ldst_is_rs1(fb_io_deq_bits_uops_0_bits_ldst_is_rs1),
    .io_deq_bits_uops_0_bits_ldst(fb_io_deq_bits_uops_0_bits_ldst),
    .io_deq_bits_uops_0_bits_lrs1(fb_io_deq_bits_uops_0_bits_lrs1),
    .io_deq_bits_uops_0_bits_lrs2(fb_io_deq_bits_uops_0_bits_lrs2),
    .io_deq_bits_uops_0_bits_lrs3(fb_io_deq_bits_uops_0_bits_lrs3),
    .io_deq_bits_uops_0_bits_ldst_val(fb_io_deq_bits_uops_0_bits_ldst_val),
    .io_deq_bits_uops_0_bits_dst_rtype(fb_io_deq_bits_uops_0_bits_dst_rtype),
    .io_deq_bits_uops_0_bits_lrs1_rtype(fb_io_deq_bits_uops_0_bits_lrs1_rtype),
    .io_deq_bits_uops_0_bits_lrs2_rtype(fb_io_deq_bits_uops_0_bits_lrs2_rtype),
    .io_deq_bits_uops_0_bits_frs3_en(fb_io_deq_bits_uops_0_bits_frs3_en),
    .io_deq_bits_uops_0_bits_fp_val(fb_io_deq_bits_uops_0_bits_fp_val),
    .io_deq_bits_uops_0_bits_fp_single(fb_io_deq_bits_uops_0_bits_fp_single),
    .io_deq_bits_uops_0_bits_xcpt_pf_if(fb_io_deq_bits_uops_0_bits_xcpt_pf_if),
    .io_deq_bits_uops_0_bits_xcpt_ae_if(fb_io_deq_bits_uops_0_bits_xcpt_ae_if),
    .io_deq_bits_uops_0_bits_xcpt_ma_if(fb_io_deq_bits_uops_0_bits_xcpt_ma_if),
    .io_deq_bits_uops_0_bits_bp_debug_if(fb_io_deq_bits_uops_0_bits_bp_debug_if),
    .io_deq_bits_uops_0_bits_bp_xcpt_if(fb_io_deq_bits_uops_0_bits_bp_xcpt_if),
    .io_deq_bits_uops_0_bits_debug_fsrc(fb_io_deq_bits_uops_0_bits_debug_fsrc),
    .io_deq_bits_uops_0_bits_debug_tsrc(fb_io_deq_bits_uops_0_bits_debug_tsrc),
    .io_deq_bits_uops_1_valid(fb_io_deq_bits_uops_1_valid),
    .io_deq_bits_uops_1_bits_uopc(fb_io_deq_bits_uops_1_bits_uopc),
    .io_deq_bits_uops_1_bits_inst(fb_io_deq_bits_uops_1_bits_inst),
    .io_deq_bits_uops_1_bits_debug_inst(fb_io_deq_bits_uops_1_bits_debug_inst),
    .io_deq_bits_uops_1_bits_is_rvc(fb_io_deq_bits_uops_1_bits_is_rvc),
    .io_deq_bits_uops_1_bits_debug_pc(fb_io_deq_bits_uops_1_bits_debug_pc),
    .io_deq_bits_uops_1_bits_iq_type(fb_io_deq_bits_uops_1_bits_iq_type),
    .io_deq_bits_uops_1_bits_fu_code(fb_io_deq_bits_uops_1_bits_fu_code),
    .io_deq_bits_uops_1_bits_ctrl_br_type(fb_io_deq_bits_uops_1_bits_ctrl_br_type),
    .io_deq_bits_uops_1_bits_ctrl_op1_sel(fb_io_deq_bits_uops_1_bits_ctrl_op1_sel),
    .io_deq_bits_uops_1_bits_ctrl_op2_sel(fb_io_deq_bits_uops_1_bits_ctrl_op2_sel),
    .io_deq_bits_uops_1_bits_ctrl_imm_sel(fb_io_deq_bits_uops_1_bits_ctrl_imm_sel),
    .io_deq_bits_uops_1_bits_ctrl_op_fcn(fb_io_deq_bits_uops_1_bits_ctrl_op_fcn),
    .io_deq_bits_uops_1_bits_ctrl_fcn_dw(fb_io_deq_bits_uops_1_bits_ctrl_fcn_dw),
    .io_deq_bits_uops_1_bits_ctrl_csr_cmd(fb_io_deq_bits_uops_1_bits_ctrl_csr_cmd),
    .io_deq_bits_uops_1_bits_ctrl_is_load(fb_io_deq_bits_uops_1_bits_ctrl_is_load),
    .io_deq_bits_uops_1_bits_ctrl_is_sta(fb_io_deq_bits_uops_1_bits_ctrl_is_sta),
    .io_deq_bits_uops_1_bits_ctrl_is_std(fb_io_deq_bits_uops_1_bits_ctrl_is_std),
    .io_deq_bits_uops_1_bits_iw_state(fb_io_deq_bits_uops_1_bits_iw_state),
    .io_deq_bits_uops_1_bits_iw_p1_poisoned(fb_io_deq_bits_uops_1_bits_iw_p1_poisoned),
    .io_deq_bits_uops_1_bits_iw_p2_poisoned(fb_io_deq_bits_uops_1_bits_iw_p2_poisoned),
    .io_deq_bits_uops_1_bits_is_br(fb_io_deq_bits_uops_1_bits_is_br),
    .io_deq_bits_uops_1_bits_is_jalr(fb_io_deq_bits_uops_1_bits_is_jalr),
    .io_deq_bits_uops_1_bits_is_jal(fb_io_deq_bits_uops_1_bits_is_jal),
    .io_deq_bits_uops_1_bits_is_sfb(fb_io_deq_bits_uops_1_bits_is_sfb),
    .io_deq_bits_uops_1_bits_br_mask(fb_io_deq_bits_uops_1_bits_br_mask),
    .io_deq_bits_uops_1_bits_br_tag(fb_io_deq_bits_uops_1_bits_br_tag),
    .io_deq_bits_uops_1_bits_ftq_idx(fb_io_deq_bits_uops_1_bits_ftq_idx),
    .io_deq_bits_uops_1_bits_edge_inst(fb_io_deq_bits_uops_1_bits_edge_inst),
    .io_deq_bits_uops_1_bits_pc_lob(fb_io_deq_bits_uops_1_bits_pc_lob),
    .io_deq_bits_uops_1_bits_taken(fb_io_deq_bits_uops_1_bits_taken),
    .io_deq_bits_uops_1_bits_imm_packed(fb_io_deq_bits_uops_1_bits_imm_packed),
    .io_deq_bits_uops_1_bits_csr_addr(fb_io_deq_bits_uops_1_bits_csr_addr),
    .io_deq_bits_uops_1_bits_rob_idx(fb_io_deq_bits_uops_1_bits_rob_idx),
    .io_deq_bits_uops_1_bits_ldq_idx(fb_io_deq_bits_uops_1_bits_ldq_idx),
    .io_deq_bits_uops_1_bits_stq_idx(fb_io_deq_bits_uops_1_bits_stq_idx),
    .io_deq_bits_uops_1_bits_rxq_idx(fb_io_deq_bits_uops_1_bits_rxq_idx),
    .io_deq_bits_uops_1_bits_pdst(fb_io_deq_bits_uops_1_bits_pdst),
    .io_deq_bits_uops_1_bits_prs1(fb_io_deq_bits_uops_1_bits_prs1),
    .io_deq_bits_uops_1_bits_prs2(fb_io_deq_bits_uops_1_bits_prs2),
    .io_deq_bits_uops_1_bits_prs3(fb_io_deq_bits_uops_1_bits_prs3),
    .io_deq_bits_uops_1_bits_ppred(fb_io_deq_bits_uops_1_bits_ppred),
    .io_deq_bits_uops_1_bits_prs1_busy(fb_io_deq_bits_uops_1_bits_prs1_busy),
    .io_deq_bits_uops_1_bits_prs2_busy(fb_io_deq_bits_uops_1_bits_prs2_busy),
    .io_deq_bits_uops_1_bits_prs3_busy(fb_io_deq_bits_uops_1_bits_prs3_busy),
    .io_deq_bits_uops_1_bits_ppred_busy(fb_io_deq_bits_uops_1_bits_ppred_busy),
    .io_deq_bits_uops_1_bits_stale_pdst(fb_io_deq_bits_uops_1_bits_stale_pdst),
    .io_deq_bits_uops_1_bits_exception(fb_io_deq_bits_uops_1_bits_exception),
    .io_deq_bits_uops_1_bits_exc_cause(fb_io_deq_bits_uops_1_bits_exc_cause),
    .io_deq_bits_uops_1_bits_bypassable(fb_io_deq_bits_uops_1_bits_bypassable),
    .io_deq_bits_uops_1_bits_mem_cmd(fb_io_deq_bits_uops_1_bits_mem_cmd),
    .io_deq_bits_uops_1_bits_mem_size(fb_io_deq_bits_uops_1_bits_mem_size),
    .io_deq_bits_uops_1_bits_mem_signed(fb_io_deq_bits_uops_1_bits_mem_signed),
    .io_deq_bits_uops_1_bits_is_fence(fb_io_deq_bits_uops_1_bits_is_fence),
    .io_deq_bits_uops_1_bits_is_fencei(fb_io_deq_bits_uops_1_bits_is_fencei),
    .io_deq_bits_uops_1_bits_is_amo(fb_io_deq_bits_uops_1_bits_is_amo),
    .io_deq_bits_uops_1_bits_uses_ldq(fb_io_deq_bits_uops_1_bits_uses_ldq),
    .io_deq_bits_uops_1_bits_uses_stq(fb_io_deq_bits_uops_1_bits_uses_stq),
    .io_deq_bits_uops_1_bits_is_sys_pc2epc(fb_io_deq_bits_uops_1_bits_is_sys_pc2epc),
    .io_deq_bits_uops_1_bits_is_unique(fb_io_deq_bits_uops_1_bits_is_unique),
    .io_deq_bits_uops_1_bits_flush_on_commit(fb_io_deq_bits_uops_1_bits_flush_on_commit),
    .io_deq_bits_uops_1_bits_ldst_is_rs1(fb_io_deq_bits_uops_1_bits_ldst_is_rs1),
    .io_deq_bits_uops_1_bits_ldst(fb_io_deq_bits_uops_1_bits_ldst),
    .io_deq_bits_uops_1_bits_lrs1(fb_io_deq_bits_uops_1_bits_lrs1),
    .io_deq_bits_uops_1_bits_lrs2(fb_io_deq_bits_uops_1_bits_lrs2),
    .io_deq_bits_uops_1_bits_lrs3(fb_io_deq_bits_uops_1_bits_lrs3),
    .io_deq_bits_uops_1_bits_ldst_val(fb_io_deq_bits_uops_1_bits_ldst_val),
    .io_deq_bits_uops_1_bits_dst_rtype(fb_io_deq_bits_uops_1_bits_dst_rtype),
    .io_deq_bits_uops_1_bits_lrs1_rtype(fb_io_deq_bits_uops_1_bits_lrs1_rtype),
    .io_deq_bits_uops_1_bits_lrs2_rtype(fb_io_deq_bits_uops_1_bits_lrs2_rtype),
    .io_deq_bits_uops_1_bits_frs3_en(fb_io_deq_bits_uops_1_bits_frs3_en),
    .io_deq_bits_uops_1_bits_fp_val(fb_io_deq_bits_uops_1_bits_fp_val),
    .io_deq_bits_uops_1_bits_fp_single(fb_io_deq_bits_uops_1_bits_fp_single),
    .io_deq_bits_uops_1_bits_xcpt_pf_if(fb_io_deq_bits_uops_1_bits_xcpt_pf_if),
    .io_deq_bits_uops_1_bits_xcpt_ae_if(fb_io_deq_bits_uops_1_bits_xcpt_ae_if),
    .io_deq_bits_uops_1_bits_xcpt_ma_if(fb_io_deq_bits_uops_1_bits_xcpt_ma_if),
    .io_deq_bits_uops_1_bits_bp_debug_if(fb_io_deq_bits_uops_1_bits_bp_debug_if),
    .io_deq_bits_uops_1_bits_bp_xcpt_if(fb_io_deq_bits_uops_1_bits_bp_xcpt_if),
    .io_deq_bits_uops_1_bits_debug_fsrc(fb_io_deq_bits_uops_1_bits_debug_fsrc),
    .io_deq_bits_uops_1_bits_debug_tsrc(fb_io_deq_bits_uops_1_bits_debug_tsrc),
    .io_clear(fb_io_clear)
  );
  FetchTargetQueue ftq ( // @[frontend.scala 862:19]
    .clock(ftq_clock),
    .reset(ftq_reset),
    .io_enq_ready(ftq_io_enq_ready),
    .io_enq_valid(ftq_io_enq_valid),
    .io_enq_bits_pc(ftq_io_enq_bits_pc),
    .io_enq_bits_next_pc(ftq_io_enq_bits_next_pc),
    .io_enq_bits_edge_inst_0(ftq_io_enq_bits_edge_inst_0),
    .io_enq_bits_insts_0(ftq_io_enq_bits_insts_0),
    .io_enq_bits_insts_1(ftq_io_enq_bits_insts_1),
    .io_enq_bits_insts_2(ftq_io_enq_bits_insts_2),
    .io_enq_bits_insts_3(ftq_io_enq_bits_insts_3),
    .io_enq_bits_exp_insts_0(ftq_io_enq_bits_exp_insts_0),
    .io_enq_bits_exp_insts_1(ftq_io_enq_bits_exp_insts_1),
    .io_enq_bits_exp_insts_2(ftq_io_enq_bits_exp_insts_2),
    .io_enq_bits_exp_insts_3(ftq_io_enq_bits_exp_insts_3),
    .io_enq_bits_sfbs_0(ftq_io_enq_bits_sfbs_0),
    .io_enq_bits_sfbs_1(ftq_io_enq_bits_sfbs_1),
    .io_enq_bits_sfbs_2(ftq_io_enq_bits_sfbs_2),
    .io_enq_bits_sfbs_3(ftq_io_enq_bits_sfbs_3),
    .io_enq_bits_sfb_masks_0(ftq_io_enq_bits_sfb_masks_0),
    .io_enq_bits_sfb_masks_1(ftq_io_enq_bits_sfb_masks_1),
    .io_enq_bits_sfb_masks_2(ftq_io_enq_bits_sfb_masks_2),
    .io_enq_bits_sfb_masks_3(ftq_io_enq_bits_sfb_masks_3),
    .io_enq_bits_sfb_dests_0(ftq_io_enq_bits_sfb_dests_0),
    .io_enq_bits_sfb_dests_1(ftq_io_enq_bits_sfb_dests_1),
    .io_enq_bits_sfb_dests_2(ftq_io_enq_bits_sfb_dests_2),
    .io_enq_bits_sfb_dests_3(ftq_io_enq_bits_sfb_dests_3),
    .io_enq_bits_shadowable_mask_0(ftq_io_enq_bits_shadowable_mask_0),
    .io_enq_bits_shadowable_mask_1(ftq_io_enq_bits_shadowable_mask_1),
    .io_enq_bits_shadowable_mask_2(ftq_io_enq_bits_shadowable_mask_2),
    .io_enq_bits_shadowable_mask_3(ftq_io_enq_bits_shadowable_mask_3),
    .io_enq_bits_shadowed_mask_0(ftq_io_enq_bits_shadowed_mask_0),
    .io_enq_bits_shadowed_mask_1(ftq_io_enq_bits_shadowed_mask_1),
    .io_enq_bits_shadowed_mask_2(ftq_io_enq_bits_shadowed_mask_2),
    .io_enq_bits_shadowed_mask_3(ftq_io_enq_bits_shadowed_mask_3),
    .io_enq_bits_cfi_idx_valid(ftq_io_enq_bits_cfi_idx_valid),
    .io_enq_bits_cfi_idx_bits(ftq_io_enq_bits_cfi_idx_bits),
    .io_enq_bits_cfi_type(ftq_io_enq_bits_cfi_type),
    .io_enq_bits_cfi_is_call(ftq_io_enq_bits_cfi_is_call),
    .io_enq_bits_cfi_is_ret(ftq_io_enq_bits_cfi_is_ret),
    .io_enq_bits_cfi_npc_plus4(ftq_io_enq_bits_cfi_npc_plus4),
    .io_enq_bits_ras_top(ftq_io_enq_bits_ras_top),
    .io_enq_bits_ftq_idx(ftq_io_enq_bits_ftq_idx),
    .io_enq_bits_mask(ftq_io_enq_bits_mask),
    .io_enq_bits_br_mask(ftq_io_enq_bits_br_mask),
    .io_enq_bits_ghist_old_history(ftq_io_enq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken(ftq_io_enq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken(ftq_io_enq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken(ftq_io_enq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx(ftq_io_enq_bits_ghist_ras_idx),
    .io_enq_bits_lhist_0(ftq_io_enq_bits_lhist_0),
    .io_enq_bits_xcpt_pf_if(ftq_io_enq_bits_xcpt_pf_if),
    .io_enq_bits_xcpt_ae_if(ftq_io_enq_bits_xcpt_ae_if),
    .io_enq_bits_bp_debug_if_oh_0(ftq_io_enq_bits_bp_debug_if_oh_0),
    .io_enq_bits_bp_debug_if_oh_1(ftq_io_enq_bits_bp_debug_if_oh_1),
    .io_enq_bits_bp_debug_if_oh_2(ftq_io_enq_bits_bp_debug_if_oh_2),
    .io_enq_bits_bp_debug_if_oh_3(ftq_io_enq_bits_bp_debug_if_oh_3),
    .io_enq_bits_bp_xcpt_if_oh_0(ftq_io_enq_bits_bp_xcpt_if_oh_0),
    .io_enq_bits_bp_xcpt_if_oh_1(ftq_io_enq_bits_bp_xcpt_if_oh_1),
    .io_enq_bits_bp_xcpt_if_oh_2(ftq_io_enq_bits_bp_xcpt_if_oh_2),
    .io_enq_bits_bp_xcpt_if_oh_3(ftq_io_enq_bits_bp_xcpt_if_oh_3),
    .io_enq_bits_end_half_valid(ftq_io_enq_bits_end_half_valid),
    .io_enq_bits_end_half_bits(ftq_io_enq_bits_end_half_bits),
    .io_enq_bits_bpd_meta_0(ftq_io_enq_bits_bpd_meta_0),
    .io_enq_bits_fsrc(ftq_io_enq_bits_fsrc),
    .io_enq_bits_tsrc(ftq_io_enq_bits_tsrc),
    .io_enq_idx(ftq_io_enq_idx),
    .io_deq_valid(ftq_io_deq_valid),
    .io_deq_bits(ftq_io_deq_bits),
    .io_get_ftq_pc_0_ftq_idx(ftq_io_get_ftq_pc_0_ftq_idx),
    .io_get_ftq_pc_0_entry_cfi_idx_valid(ftq_io_get_ftq_pc_0_entry_cfi_idx_valid),
    .io_get_ftq_pc_0_entry_cfi_idx_bits(ftq_io_get_ftq_pc_0_entry_cfi_idx_bits),
    .io_get_ftq_pc_0_entry_cfi_taken(ftq_io_get_ftq_pc_0_entry_cfi_taken),
    .io_get_ftq_pc_0_entry_cfi_mispredicted(ftq_io_get_ftq_pc_0_entry_cfi_mispredicted),
    .io_get_ftq_pc_0_entry_cfi_type(ftq_io_get_ftq_pc_0_entry_cfi_type),
    .io_get_ftq_pc_0_entry_br_mask(ftq_io_get_ftq_pc_0_entry_br_mask),
    .io_get_ftq_pc_0_entry_cfi_is_call(ftq_io_get_ftq_pc_0_entry_cfi_is_call),
    .io_get_ftq_pc_0_entry_cfi_is_ret(ftq_io_get_ftq_pc_0_entry_cfi_is_ret),
    .io_get_ftq_pc_0_entry_cfi_npc_plus4(ftq_io_get_ftq_pc_0_entry_cfi_npc_plus4),
    .io_get_ftq_pc_0_entry_ras_top(ftq_io_get_ftq_pc_0_entry_ras_top),
    .io_get_ftq_pc_0_entry_ras_idx(ftq_io_get_ftq_pc_0_entry_ras_idx),
    .io_get_ftq_pc_0_entry_start_bank(ftq_io_get_ftq_pc_0_entry_start_bank),
    .io_get_ftq_pc_0_ghist_old_history(ftq_io_get_ftq_pc_0_ghist_old_history),
    .io_get_ftq_pc_0_ghist_current_saw_branch_not_taken(ftq_io_get_ftq_pc_0_ghist_current_saw_branch_not_taken),
    .io_get_ftq_pc_0_ghist_new_saw_branch_not_taken(ftq_io_get_ftq_pc_0_ghist_new_saw_branch_not_taken),
    .io_get_ftq_pc_0_ghist_new_saw_branch_taken(ftq_io_get_ftq_pc_0_ghist_new_saw_branch_taken),
    .io_get_ftq_pc_0_ghist_ras_idx(ftq_io_get_ftq_pc_0_ghist_ras_idx),
    .io_get_ftq_pc_0_pc(ftq_io_get_ftq_pc_0_pc),
    .io_get_ftq_pc_0_com_pc(ftq_io_get_ftq_pc_0_com_pc),
    .io_get_ftq_pc_0_next_val(ftq_io_get_ftq_pc_0_next_val),
    .io_get_ftq_pc_0_next_pc(ftq_io_get_ftq_pc_0_next_pc),
    .io_get_ftq_pc_1_ftq_idx(ftq_io_get_ftq_pc_1_ftq_idx),
    .io_get_ftq_pc_1_entry_cfi_idx_valid(ftq_io_get_ftq_pc_1_entry_cfi_idx_valid),
    .io_get_ftq_pc_1_entry_cfi_idx_bits(ftq_io_get_ftq_pc_1_entry_cfi_idx_bits),
    .io_get_ftq_pc_1_entry_cfi_taken(ftq_io_get_ftq_pc_1_entry_cfi_taken),
    .io_get_ftq_pc_1_entry_cfi_mispredicted(ftq_io_get_ftq_pc_1_entry_cfi_mispredicted),
    .io_get_ftq_pc_1_entry_cfi_type(ftq_io_get_ftq_pc_1_entry_cfi_type),
    .io_get_ftq_pc_1_entry_br_mask(ftq_io_get_ftq_pc_1_entry_br_mask),
    .io_get_ftq_pc_1_entry_cfi_is_call(ftq_io_get_ftq_pc_1_entry_cfi_is_call),
    .io_get_ftq_pc_1_entry_cfi_is_ret(ftq_io_get_ftq_pc_1_entry_cfi_is_ret),
    .io_get_ftq_pc_1_entry_cfi_npc_plus4(ftq_io_get_ftq_pc_1_entry_cfi_npc_plus4),
    .io_get_ftq_pc_1_entry_ras_top(ftq_io_get_ftq_pc_1_entry_ras_top),
    .io_get_ftq_pc_1_entry_ras_idx(ftq_io_get_ftq_pc_1_entry_ras_idx),
    .io_get_ftq_pc_1_entry_start_bank(ftq_io_get_ftq_pc_1_entry_start_bank),
    .io_get_ftq_pc_1_ghist_old_history(ftq_io_get_ftq_pc_1_ghist_old_history),
    .io_get_ftq_pc_1_ghist_current_saw_branch_not_taken(ftq_io_get_ftq_pc_1_ghist_current_saw_branch_not_taken),
    .io_get_ftq_pc_1_ghist_new_saw_branch_not_taken(ftq_io_get_ftq_pc_1_ghist_new_saw_branch_not_taken),
    .io_get_ftq_pc_1_ghist_new_saw_branch_taken(ftq_io_get_ftq_pc_1_ghist_new_saw_branch_taken),
    .io_get_ftq_pc_1_ghist_ras_idx(ftq_io_get_ftq_pc_1_ghist_ras_idx),
    .io_get_ftq_pc_1_pc(ftq_io_get_ftq_pc_1_pc),
    .io_get_ftq_pc_1_com_pc(ftq_io_get_ftq_pc_1_com_pc),
    .io_get_ftq_pc_1_next_val(ftq_io_get_ftq_pc_1_next_val),
    .io_get_ftq_pc_1_next_pc(ftq_io_get_ftq_pc_1_next_pc),
    .io_debug_ftq_idx_0(ftq_io_debug_ftq_idx_0),
    .io_debug_ftq_idx_1(ftq_io_debug_ftq_idx_1),
    .io_debug_fetch_pc_0(ftq_io_debug_fetch_pc_0),
    .io_debug_fetch_pc_1(ftq_io_debug_fetch_pc_1),
    .io_redirect_valid(ftq_io_redirect_valid),
    .io_redirect_bits(ftq_io_redirect_bits),
    .io_brupdate_b1_resolve_mask(ftq_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(ftq_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(ftq_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(ftq_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(ftq_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(ftq_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(ftq_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(ftq_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(ftq_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(ftq_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(ftq_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(ftq_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(ftq_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(ftq_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(ftq_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(ftq_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(ftq_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(ftq_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(ftq_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(ftq_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(ftq_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(ftq_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(ftq_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(ftq_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(ftq_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(ftq_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(ftq_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(ftq_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(ftq_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(ftq_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(ftq_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(ftq_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(ftq_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(ftq_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(ftq_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(ftq_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(ftq_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(ftq_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(ftq_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(ftq_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(ftq_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(ftq_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(ftq_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(ftq_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(ftq_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(ftq_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(ftq_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(ftq_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(ftq_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(ftq_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(ftq_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(ftq_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(ftq_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(ftq_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(ftq_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(ftq_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(ftq_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(ftq_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(ftq_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(ftq_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(ftq_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(ftq_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(ftq_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(ftq_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(ftq_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(ftq_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(ftq_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(ftq_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(ftq_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(ftq_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(ftq_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(ftq_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(ftq_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(ftq_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(ftq_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(ftq_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(ftq_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(ftq_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(ftq_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(ftq_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(ftq_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(ftq_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(ftq_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(ftq_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(ftq_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(ftq_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(ftq_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(ftq_io_brupdate_b2_target_offset),
    .io_bpdupdate_valid(ftq_io_bpdupdate_valid),
    .io_bpdupdate_bits_is_mispredict_update(ftq_io_bpdupdate_bits_is_mispredict_update),
    .io_bpdupdate_bits_is_repair_update(ftq_io_bpdupdate_bits_is_repair_update),
    .io_bpdupdate_bits_btb_mispredicts(ftq_io_bpdupdate_bits_btb_mispredicts),
    .io_bpdupdate_bits_pc(ftq_io_bpdupdate_bits_pc),
    .io_bpdupdate_bits_br_mask(ftq_io_bpdupdate_bits_br_mask),
    .io_bpdupdate_bits_cfi_idx_valid(ftq_io_bpdupdate_bits_cfi_idx_valid),
    .io_bpdupdate_bits_cfi_idx_bits(ftq_io_bpdupdate_bits_cfi_idx_bits),
    .io_bpdupdate_bits_cfi_taken(ftq_io_bpdupdate_bits_cfi_taken),
    .io_bpdupdate_bits_cfi_mispredicted(ftq_io_bpdupdate_bits_cfi_mispredicted),
    .io_bpdupdate_bits_cfi_is_br(ftq_io_bpdupdate_bits_cfi_is_br),
    .io_bpdupdate_bits_cfi_is_jal(ftq_io_bpdupdate_bits_cfi_is_jal),
    .io_bpdupdate_bits_cfi_is_jalr(ftq_io_bpdupdate_bits_cfi_is_jalr),
    .io_bpdupdate_bits_ghist_old_history(ftq_io_bpdupdate_bits_ghist_old_history),
    .io_bpdupdate_bits_ghist_current_saw_branch_not_taken(ftq_io_bpdupdate_bits_ghist_current_saw_branch_not_taken),
    .io_bpdupdate_bits_ghist_new_saw_branch_not_taken(ftq_io_bpdupdate_bits_ghist_new_saw_branch_not_taken),
    .io_bpdupdate_bits_ghist_new_saw_branch_taken(ftq_io_bpdupdate_bits_ghist_new_saw_branch_taken),
    .io_bpdupdate_bits_ghist_ras_idx(ftq_io_bpdupdate_bits_ghist_ras_idx),
    .io_bpdupdate_bits_lhist_0(ftq_io_bpdupdate_bits_lhist_0),
    .io_bpdupdate_bits_target(ftq_io_bpdupdate_bits_target),
    .io_bpdupdate_bits_meta_0(ftq_io_bpdupdate_bits_meta_0),
    .io_ras_update(ftq_io_ras_update),
    .io_ras_update_idx(ftq_io_ras_update_idx),
    .io_ras_update_pc(ftq_io_ras_update_pc)
  );
  Arbiter_15 bpd_update_arbiter ( // @[frontend.scala 925:34]
    .clock(bpd_update_arbiter_clock),
    .reset(bpd_update_arbiter_reset),
    .io_in_0_ready(bpd_update_arbiter_io_in_0_ready),
    .io_in_0_valid(bpd_update_arbiter_io_in_0_valid),
    .io_in_0_bits_is_mispredict_update(bpd_update_arbiter_io_in_0_bits_is_mispredict_update),
    .io_in_0_bits_is_repair_update(bpd_update_arbiter_io_in_0_bits_is_repair_update),
    .io_in_0_bits_btb_mispredicts(bpd_update_arbiter_io_in_0_bits_btb_mispredicts),
    .io_in_0_bits_pc(bpd_update_arbiter_io_in_0_bits_pc),
    .io_in_0_bits_br_mask(bpd_update_arbiter_io_in_0_bits_br_mask),
    .io_in_0_bits_cfi_idx_valid(bpd_update_arbiter_io_in_0_bits_cfi_idx_valid),
    .io_in_0_bits_cfi_idx_bits(bpd_update_arbiter_io_in_0_bits_cfi_idx_bits),
    .io_in_0_bits_cfi_taken(bpd_update_arbiter_io_in_0_bits_cfi_taken),
    .io_in_0_bits_cfi_mispredicted(bpd_update_arbiter_io_in_0_bits_cfi_mispredicted),
    .io_in_0_bits_cfi_is_br(bpd_update_arbiter_io_in_0_bits_cfi_is_br),
    .io_in_0_bits_cfi_is_jal(bpd_update_arbiter_io_in_0_bits_cfi_is_jal),
    .io_in_0_bits_cfi_is_jalr(bpd_update_arbiter_io_in_0_bits_cfi_is_jalr),
    .io_in_0_bits_ghist_old_history(bpd_update_arbiter_io_in_0_bits_ghist_old_history),
    .io_in_0_bits_ghist_current_saw_branch_not_taken(bpd_update_arbiter_io_in_0_bits_ghist_current_saw_branch_not_taken)
      ,
    .io_in_0_bits_ghist_new_saw_branch_not_taken(bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_not_taken),
    .io_in_0_bits_ghist_new_saw_branch_taken(bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_taken),
    .io_in_0_bits_ghist_ras_idx(bpd_update_arbiter_io_in_0_bits_ghist_ras_idx),
    .io_in_0_bits_lhist_0(bpd_update_arbiter_io_in_0_bits_lhist_0),
    .io_in_0_bits_target(bpd_update_arbiter_io_in_0_bits_target),
    .io_in_0_bits_meta_0(bpd_update_arbiter_io_in_0_bits_meta_0),
    .io_in_1_ready(bpd_update_arbiter_io_in_1_ready),
    .io_in_1_valid(bpd_update_arbiter_io_in_1_valid),
    .io_in_1_bits_is_mispredict_update(bpd_update_arbiter_io_in_1_bits_is_mispredict_update),
    .io_in_1_bits_is_repair_update(bpd_update_arbiter_io_in_1_bits_is_repair_update),
    .io_in_1_bits_btb_mispredicts(bpd_update_arbiter_io_in_1_bits_btb_mispredicts),
    .io_in_1_bits_pc(bpd_update_arbiter_io_in_1_bits_pc),
    .io_in_1_bits_br_mask(bpd_update_arbiter_io_in_1_bits_br_mask),
    .io_in_1_bits_cfi_idx_valid(bpd_update_arbiter_io_in_1_bits_cfi_idx_valid),
    .io_in_1_bits_cfi_idx_bits(bpd_update_arbiter_io_in_1_bits_cfi_idx_bits),
    .io_in_1_bits_cfi_taken(bpd_update_arbiter_io_in_1_bits_cfi_taken),
    .io_in_1_bits_cfi_mispredicted(bpd_update_arbiter_io_in_1_bits_cfi_mispredicted),
    .io_in_1_bits_cfi_is_br(bpd_update_arbiter_io_in_1_bits_cfi_is_br),
    .io_in_1_bits_cfi_is_jal(bpd_update_arbiter_io_in_1_bits_cfi_is_jal),
    .io_in_1_bits_cfi_is_jalr(bpd_update_arbiter_io_in_1_bits_cfi_is_jalr),
    .io_in_1_bits_ghist_old_history(bpd_update_arbiter_io_in_1_bits_ghist_old_history),
    .io_in_1_bits_ghist_current_saw_branch_not_taken(bpd_update_arbiter_io_in_1_bits_ghist_current_saw_branch_not_taken)
      ,
    .io_in_1_bits_ghist_new_saw_branch_not_taken(bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_not_taken),
    .io_in_1_bits_ghist_new_saw_branch_taken(bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_taken),
    .io_in_1_bits_ghist_ras_idx(bpd_update_arbiter_io_in_1_bits_ghist_ras_idx),
    .io_in_1_bits_lhist_0(bpd_update_arbiter_io_in_1_bits_lhist_0),
    .io_in_1_bits_target(bpd_update_arbiter_io_in_1_bits_target),
    .io_in_1_bits_meta_0(bpd_update_arbiter_io_in_1_bits_meta_0),
    .io_out_ready(bpd_update_arbiter_io_out_ready),
    .io_out_valid(bpd_update_arbiter_io_out_valid),
    .io_out_bits_is_mispredict_update(bpd_update_arbiter_io_out_bits_is_mispredict_update),
    .io_out_bits_is_repair_update(bpd_update_arbiter_io_out_bits_is_repair_update),
    .io_out_bits_btb_mispredicts(bpd_update_arbiter_io_out_bits_btb_mispredicts),
    .io_out_bits_pc(bpd_update_arbiter_io_out_bits_pc),
    .io_out_bits_br_mask(bpd_update_arbiter_io_out_bits_br_mask),
    .io_out_bits_cfi_idx_valid(bpd_update_arbiter_io_out_bits_cfi_idx_valid),
    .io_out_bits_cfi_idx_bits(bpd_update_arbiter_io_out_bits_cfi_idx_bits),
    .io_out_bits_cfi_taken(bpd_update_arbiter_io_out_bits_cfi_taken),
    .io_out_bits_cfi_mispredicted(bpd_update_arbiter_io_out_bits_cfi_mispredicted),
    .io_out_bits_cfi_is_br(bpd_update_arbiter_io_out_bits_cfi_is_br),
    .io_out_bits_cfi_is_jal(bpd_update_arbiter_io_out_bits_cfi_is_jal),
    .io_out_bits_cfi_is_jalr(bpd_update_arbiter_io_out_bits_cfi_is_jalr),
    .io_out_bits_ghist_old_history(bpd_update_arbiter_io_out_bits_ghist_old_history),
    .io_out_bits_ghist_current_saw_branch_not_taken(bpd_update_arbiter_io_out_bits_ghist_current_saw_branch_not_taken),
    .io_out_bits_ghist_new_saw_branch_not_taken(bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_not_taken),
    .io_out_bits_ghist_new_saw_branch_taken(bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_taken),
    .io_out_bits_ghist_ras_idx(bpd_update_arbiter_io_out_bits_ghist_ras_idx),
    .io_out_bits_lhist_0(bpd_update_arbiter_io_out_bits_lhist_0),
    .io_out_bits_target(bpd_update_arbiter_io_out_bits_target),
    .io_out_bits_meta_0(bpd_update_arbiter_io_out_bits_meta_0),
    .io_chosen(bpd_update_arbiter_io_chosen)
  );
  assign auto_icache_master_out_a_valid = icache_auto_master_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_opcode = icache_auto_master_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_param = icache_auto_master_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_size = icache_auto_master_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_source = icache_auto_master_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_address = icache_auto_master_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_mask = icache_auto_master_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_data = icache_auto_master_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_corrupt = icache_auto_master_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_d_ready = icache_auto_master_out_d_ready; // @[LazyModule.scala 311:12]
  assign io_cpu_fetchpacket_valid = fb_io_deq_valid; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_valid = fb_io_deq_bits_uops_0_valid; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_uopc = fb_io_deq_bits_uops_0_bits_uopc; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_inst = fb_io_deq_bits_uops_0_bits_inst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_debug_inst = fb_io_deq_bits_uops_0_bits_debug_inst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_rvc = fb_io_deq_bits_uops_0_bits_is_rvc; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_debug_pc = fb_io_deq_bits_uops_0_bits_debug_pc; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_iq_type = fb_io_deq_bits_uops_0_bits_iq_type; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_fu_code = fb_io_deq_bits_uops_0_bits_fu_code; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_br_type = fb_io_deq_bits_uops_0_bits_ctrl_br_type; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op1_sel = fb_io_deq_bits_uops_0_bits_ctrl_op1_sel; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op2_sel = fb_io_deq_bits_uops_0_bits_ctrl_op2_sel; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_imm_sel = fb_io_deq_bits_uops_0_bits_ctrl_imm_sel; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op_fcn = fb_io_deq_bits_uops_0_bits_ctrl_op_fcn; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_fcn_dw = fb_io_deq_bits_uops_0_bits_ctrl_fcn_dw; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_csr_cmd = fb_io_deq_bits_uops_0_bits_ctrl_csr_cmd; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_load = fb_io_deq_bits_uops_0_bits_ctrl_is_load; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_sta = fb_io_deq_bits_uops_0_bits_ctrl_is_sta; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_std = fb_io_deq_bits_uops_0_bits_ctrl_is_std; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_iw_state = fb_io_deq_bits_uops_0_bits_iw_state; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_iw_p1_poisoned = fb_io_deq_bits_uops_0_bits_iw_p1_poisoned; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_iw_p2_poisoned = fb_io_deq_bits_uops_0_bits_iw_p2_poisoned; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_br = fb_io_deq_bits_uops_0_bits_is_br; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_jalr = fb_io_deq_bits_uops_0_bits_is_jalr; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_jal = fb_io_deq_bits_uops_0_bits_is_jal; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_sfb = fb_io_deq_bits_uops_0_bits_is_sfb; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_br_mask = fb_io_deq_bits_uops_0_bits_br_mask; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_br_tag = fb_io_deq_bits_uops_0_bits_br_tag; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx = fb_io_deq_bits_uops_0_bits_ftq_idx; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_edge_inst = fb_io_deq_bits_uops_0_bits_edge_inst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_pc_lob = fb_io_deq_bits_uops_0_bits_pc_lob; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_taken = fb_io_deq_bits_uops_0_bits_taken; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_imm_packed = fb_io_deq_bits_uops_0_bits_imm_packed; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_csr_addr = fb_io_deq_bits_uops_0_bits_csr_addr; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_rob_idx = fb_io_deq_bits_uops_0_bits_rob_idx; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ldq_idx = fb_io_deq_bits_uops_0_bits_ldq_idx; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_stq_idx = fb_io_deq_bits_uops_0_bits_stq_idx; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_rxq_idx = fb_io_deq_bits_uops_0_bits_rxq_idx; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_pdst = fb_io_deq_bits_uops_0_bits_pdst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs1 = fb_io_deq_bits_uops_0_bits_prs1; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs2 = fb_io_deq_bits_uops_0_bits_prs2; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs3 = fb_io_deq_bits_uops_0_bits_prs3; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ppred = fb_io_deq_bits_uops_0_bits_ppred; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs1_busy = fb_io_deq_bits_uops_0_bits_prs1_busy; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs2_busy = fb_io_deq_bits_uops_0_bits_prs2_busy; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs3_busy = fb_io_deq_bits_uops_0_bits_prs3_busy; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ppred_busy = fb_io_deq_bits_uops_0_bits_ppred_busy; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_stale_pdst = fb_io_deq_bits_uops_0_bits_stale_pdst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_exception = fb_io_deq_bits_uops_0_bits_exception; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_exc_cause = fb_io_deq_bits_uops_0_bits_exc_cause; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_bypassable = fb_io_deq_bits_uops_0_bits_bypassable; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_mem_cmd = fb_io_deq_bits_uops_0_bits_mem_cmd; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_mem_size = fb_io_deq_bits_uops_0_bits_mem_size; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_mem_signed = fb_io_deq_bits_uops_0_bits_mem_signed; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_fence = fb_io_deq_bits_uops_0_bits_is_fence; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_fencei = fb_io_deq_bits_uops_0_bits_is_fencei; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_amo = fb_io_deq_bits_uops_0_bits_is_amo; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_uses_ldq = fb_io_deq_bits_uops_0_bits_uses_ldq; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_uses_stq = fb_io_deq_bits_uops_0_bits_uses_stq; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_sys_pc2epc = fb_io_deq_bits_uops_0_bits_is_sys_pc2epc; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_unique = fb_io_deq_bits_uops_0_bits_is_unique; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_flush_on_commit = fb_io_deq_bits_uops_0_bits_flush_on_commit; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ldst_is_rs1 = fb_io_deq_bits_uops_0_bits_ldst_is_rs1; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ldst = fb_io_deq_bits_uops_0_bits_ldst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_lrs1 = fb_io_deq_bits_uops_0_bits_lrs1; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_lrs2 = fb_io_deq_bits_uops_0_bits_lrs2; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_lrs3 = fb_io_deq_bits_uops_0_bits_lrs3; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ldst_val = fb_io_deq_bits_uops_0_bits_ldst_val; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_dst_rtype = fb_io_deq_bits_uops_0_bits_dst_rtype; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_lrs1_rtype = fb_io_deq_bits_uops_0_bits_lrs1_rtype; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_lrs2_rtype = fb_io_deq_bits_uops_0_bits_lrs2_rtype; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_frs3_en = fb_io_deq_bits_uops_0_bits_frs3_en; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_fp_val = fb_io_deq_bits_uops_0_bits_fp_val; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_fp_single = fb_io_deq_bits_uops_0_bits_fp_single; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if = fb_io_deq_bits_uops_0_bits_xcpt_pf_if; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if = fb_io_deq_bits_uops_0_bits_xcpt_ae_if; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ma_if = fb_io_deq_bits_uops_0_bits_xcpt_ma_if; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if = fb_io_deq_bits_uops_0_bits_bp_debug_if; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if = fb_io_deq_bits_uops_0_bits_bp_xcpt_if; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc = fb_io_deq_bits_uops_0_bits_debug_fsrc; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_debug_tsrc = fb_io_deq_bits_uops_0_bits_debug_tsrc; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_valid = fb_io_deq_bits_uops_1_valid; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_uopc = fb_io_deq_bits_uops_1_bits_uopc; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_inst = fb_io_deq_bits_uops_1_bits_inst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_debug_inst = fb_io_deq_bits_uops_1_bits_debug_inst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_rvc = fb_io_deq_bits_uops_1_bits_is_rvc; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_debug_pc = fb_io_deq_bits_uops_1_bits_debug_pc; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_iq_type = fb_io_deq_bits_uops_1_bits_iq_type; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_fu_code = fb_io_deq_bits_uops_1_bits_fu_code; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_br_type = fb_io_deq_bits_uops_1_bits_ctrl_br_type; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op1_sel = fb_io_deq_bits_uops_1_bits_ctrl_op1_sel; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op2_sel = fb_io_deq_bits_uops_1_bits_ctrl_op2_sel; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_imm_sel = fb_io_deq_bits_uops_1_bits_ctrl_imm_sel; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op_fcn = fb_io_deq_bits_uops_1_bits_ctrl_op_fcn; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_fcn_dw = fb_io_deq_bits_uops_1_bits_ctrl_fcn_dw; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_csr_cmd = fb_io_deq_bits_uops_1_bits_ctrl_csr_cmd; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_load = fb_io_deq_bits_uops_1_bits_ctrl_is_load; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_sta = fb_io_deq_bits_uops_1_bits_ctrl_is_sta; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_std = fb_io_deq_bits_uops_1_bits_ctrl_is_std; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_iw_state = fb_io_deq_bits_uops_1_bits_iw_state; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_iw_p1_poisoned = fb_io_deq_bits_uops_1_bits_iw_p1_poisoned; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_iw_p2_poisoned = fb_io_deq_bits_uops_1_bits_iw_p2_poisoned; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_br = fb_io_deq_bits_uops_1_bits_is_br; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_jalr = fb_io_deq_bits_uops_1_bits_is_jalr; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_jal = fb_io_deq_bits_uops_1_bits_is_jal; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_sfb = fb_io_deq_bits_uops_1_bits_is_sfb; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_br_mask = fb_io_deq_bits_uops_1_bits_br_mask; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_br_tag = fb_io_deq_bits_uops_1_bits_br_tag; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ftq_idx = fb_io_deq_bits_uops_1_bits_ftq_idx; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_edge_inst = fb_io_deq_bits_uops_1_bits_edge_inst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_pc_lob = fb_io_deq_bits_uops_1_bits_pc_lob; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_taken = fb_io_deq_bits_uops_1_bits_taken; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_imm_packed = fb_io_deq_bits_uops_1_bits_imm_packed; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_csr_addr = fb_io_deq_bits_uops_1_bits_csr_addr; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_rob_idx = fb_io_deq_bits_uops_1_bits_rob_idx; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ldq_idx = fb_io_deq_bits_uops_1_bits_ldq_idx; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_stq_idx = fb_io_deq_bits_uops_1_bits_stq_idx; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_rxq_idx = fb_io_deq_bits_uops_1_bits_rxq_idx; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_pdst = fb_io_deq_bits_uops_1_bits_pdst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs1 = fb_io_deq_bits_uops_1_bits_prs1; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs2 = fb_io_deq_bits_uops_1_bits_prs2; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs3 = fb_io_deq_bits_uops_1_bits_prs3; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ppred = fb_io_deq_bits_uops_1_bits_ppred; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs1_busy = fb_io_deq_bits_uops_1_bits_prs1_busy; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs2_busy = fb_io_deq_bits_uops_1_bits_prs2_busy; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs3_busy = fb_io_deq_bits_uops_1_bits_prs3_busy; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ppred_busy = fb_io_deq_bits_uops_1_bits_ppred_busy; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_stale_pdst = fb_io_deq_bits_uops_1_bits_stale_pdst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_exception = fb_io_deq_bits_uops_1_bits_exception; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_exc_cause = fb_io_deq_bits_uops_1_bits_exc_cause; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_bypassable = fb_io_deq_bits_uops_1_bits_bypassable; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_mem_cmd = fb_io_deq_bits_uops_1_bits_mem_cmd; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_mem_size = fb_io_deq_bits_uops_1_bits_mem_size; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_mem_signed = fb_io_deq_bits_uops_1_bits_mem_signed; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_fence = fb_io_deq_bits_uops_1_bits_is_fence; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_fencei = fb_io_deq_bits_uops_1_bits_is_fencei; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_amo = fb_io_deq_bits_uops_1_bits_is_amo; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_uses_ldq = fb_io_deq_bits_uops_1_bits_uses_ldq; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_uses_stq = fb_io_deq_bits_uops_1_bits_uses_stq; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_sys_pc2epc = fb_io_deq_bits_uops_1_bits_is_sys_pc2epc; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_unique = fb_io_deq_bits_uops_1_bits_is_unique; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_flush_on_commit = fb_io_deq_bits_uops_1_bits_flush_on_commit; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ldst_is_rs1 = fb_io_deq_bits_uops_1_bits_ldst_is_rs1; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ldst = fb_io_deq_bits_uops_1_bits_ldst; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_lrs1 = fb_io_deq_bits_uops_1_bits_lrs1; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_lrs2 = fb_io_deq_bits_uops_1_bits_lrs2; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_lrs3 = fb_io_deq_bits_uops_1_bits_lrs3; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ldst_val = fb_io_deq_bits_uops_1_bits_ldst_val; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_dst_rtype = fb_io_deq_bits_uops_1_bits_dst_rtype; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_lrs1_rtype = fb_io_deq_bits_uops_1_bits_lrs1_rtype; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_lrs2_rtype = fb_io_deq_bits_uops_1_bits_lrs2_rtype; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_frs3_en = fb_io_deq_bits_uops_1_bits_frs3_en; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_fp_val = fb_io_deq_bits_uops_1_bits_fp_val; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_fp_single = fb_io_deq_bits_uops_1_bits_fp_single; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_xcpt_pf_if = fb_io_deq_bits_uops_1_bits_xcpt_pf_if; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_xcpt_ae_if = fb_io_deq_bits_uops_1_bits_xcpt_ae_if; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_xcpt_ma_if = fb_io_deq_bits_uops_1_bits_xcpt_ma_if; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_bp_debug_if = fb_io_deq_bits_uops_1_bits_bp_debug_if; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_bp_xcpt_if = fb_io_deq_bits_uops_1_bits_bp_xcpt_if; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_debug_fsrc = fb_io_deq_bits_uops_1_bits_debug_fsrc; // @[frontend.scala 944:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_debug_tsrc = fb_io_deq_bits_uops_1_bits_debug_tsrc; // @[frontend.scala 944:22]
  assign io_cpu_get_pc_0_entry_cfi_idx_valid = ftq_io_get_ftq_pc_0_entry_cfi_idx_valid; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_entry_cfi_idx_bits = ftq_io_get_ftq_pc_0_entry_cfi_idx_bits; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_entry_cfi_taken = ftq_io_get_ftq_pc_0_entry_cfi_taken; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_entry_cfi_mispredicted = ftq_io_get_ftq_pc_0_entry_cfi_mispredicted; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_entry_cfi_type = ftq_io_get_ftq_pc_0_entry_cfi_type; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_entry_br_mask = ftq_io_get_ftq_pc_0_entry_br_mask; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_entry_cfi_is_call = ftq_io_get_ftq_pc_0_entry_cfi_is_call; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_entry_cfi_is_ret = ftq_io_get_ftq_pc_0_entry_cfi_is_ret; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_entry_cfi_npc_plus4 = ftq_io_get_ftq_pc_0_entry_cfi_npc_plus4; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_entry_ras_top = ftq_io_get_ftq_pc_0_entry_ras_top; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_entry_ras_idx = ftq_io_get_ftq_pc_0_entry_ras_idx; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_entry_start_bank = ftq_io_get_ftq_pc_0_entry_start_bank; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_ghist_old_history = ftq_io_get_ftq_pc_0_ghist_old_history; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_ghist_current_saw_branch_not_taken = ftq_io_get_ftq_pc_0_ghist_current_saw_branch_not_taken; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_ghist_new_saw_branch_not_taken = ftq_io_get_ftq_pc_0_ghist_new_saw_branch_not_taken; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_ghist_new_saw_branch_taken = ftq_io_get_ftq_pc_0_ghist_new_saw_branch_taken; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_ghist_ras_idx = ftq_io_get_ftq_pc_0_ghist_ras_idx; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_pc = ftq_io_get_ftq_pc_0_pc; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_com_pc = ftq_io_get_ftq_pc_0_com_pc; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_next_val = ftq_io_get_ftq_pc_0_next_val; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_0_next_pc = ftq_io_get_ftq_pc_0_next_pc; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_cfi_idx_valid = ftq_io_get_ftq_pc_1_entry_cfi_idx_valid; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_cfi_idx_bits = ftq_io_get_ftq_pc_1_entry_cfi_idx_bits; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_cfi_taken = ftq_io_get_ftq_pc_1_entry_cfi_taken; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_cfi_mispredicted = ftq_io_get_ftq_pc_1_entry_cfi_mispredicted; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_cfi_type = ftq_io_get_ftq_pc_1_entry_cfi_type; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_br_mask = ftq_io_get_ftq_pc_1_entry_br_mask; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_cfi_is_call = ftq_io_get_ftq_pc_1_entry_cfi_is_call; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_cfi_is_ret = ftq_io_get_ftq_pc_1_entry_cfi_is_ret; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_cfi_npc_plus4 = ftq_io_get_ftq_pc_1_entry_cfi_npc_plus4; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_ras_top = ftq_io_get_ftq_pc_1_entry_ras_top; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_ras_idx = ftq_io_get_ftq_pc_1_entry_ras_idx; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_entry_start_bank = ftq_io_get_ftq_pc_1_entry_start_bank; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_ghist_old_history = ftq_io_get_ftq_pc_1_ghist_old_history; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_ghist_current_saw_branch_not_taken = ftq_io_get_ftq_pc_1_ghist_current_saw_branch_not_taken; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_ghist_new_saw_branch_not_taken = ftq_io_get_ftq_pc_1_ghist_new_saw_branch_not_taken; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_ghist_new_saw_branch_taken = ftq_io_get_ftq_pc_1_ghist_new_saw_branch_taken; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_ghist_ras_idx = ftq_io_get_ftq_pc_1_ghist_ras_idx; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_pc = ftq_io_get_ftq_pc_1_pc; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_com_pc = ftq_io_get_ftq_pc_1_com_pc; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_next_val = ftq_io_get_ftq_pc_1_next_val; // @[frontend.scala 945:17]
  assign io_cpu_get_pc_1_next_pc = ftq_io_get_ftq_pc_1_next_pc; // @[frontend.scala 945:17]
  assign io_cpu_debug_fetch_pc_0 = ftq_io_debug_fetch_pc_0; // @[frontend.scala 985:25]
  assign io_cpu_debug_fetch_pc_1 = ftq_io_debug_fetch_pc_1; // @[frontend.scala 985:25]
  assign io_cpu_perf_acquire = icache_io_perf_acquire; // @[frontend.scala 342:23]
  assign io_cpu_perf_tlbMiss = io_ptw_req_ready & io_ptw_req_valid; // @[Decoupled.scala 40:37]
  assign io_ptw_req_valid = tlb_io_ptw_req_valid; // @[frontend.scala 340:10]
  assign io_ptw_req_bits_valid = tlb_io_ptw_req_bits_valid; // @[frontend.scala 340:10]
  assign io_ptw_req_bits_bits_addr = tlb_io_ptw_req_bits_bits_addr; // @[frontend.scala 340:10]
  assign io_errors_bus_valid = 1'h0;
  assign io_errors_bus_bits = 32'h0;
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_auto_master_out_a_ready = auto_icache_master_out_a_ready; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_valid = auto_icache_master_out_d_valid; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_opcode = auto_icache_master_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_param = auto_icache_master_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_size = auto_icache_master_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_source = auto_icache_master_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_sink = auto_icache_master_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_denied = auto_icache_master_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_data = auto_icache_master_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_corrupt = auto_icache_master_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign icache_io_req_valid = io_cpu_sfence_valid ? 1'h0 : _GEN_210; // @[frontend.scala 953:30 frontend.scala 960:18]
  assign icache_io_req_bits_addr = s0_vpc[38:0]; // @[frontend.scala 371:27]
  assign icache_io_s1_paddr = s1_is_replay ? REG_3 : tlb_io_resp_paddr; // @[frontend.scala 398:20]
  assign icache_io_s1_kill = tlb_io_resp_miss | f1_clear; // @[frontend.scala 402:42]
  assign icache_io_s2_kill = s2_valid & (s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst) & ~s2_is_replay; // @[frontend.scala 451:74]
  assign icache_io_s2_prefetch = 1'h0;
  assign icache_io_invalidate = io_cpu_flush_icache; // @[frontend.scala 338:24]
  assign bpd_clock = clock;
  assign bpd_reset = reset;
  assign bpd_io_f0_req_valid = io_cpu_sfence_valid ? 1'h0 : _GEN_210; // @[frontend.scala 953:30 frontend.scala 960:18]
  assign bpd_io_f0_req_bits_pc = io_cpu_sfence_valid ? {{1'd0}, io_cpu_sfence_bits_addr} : _GEN_211; // @[frontend.scala 953:30 frontend.scala 961:18]
  assign bpd_io_f0_req_bits_ghist_old_history = io_cpu_sfence_valid ? _GEN_192 : _GEN_216; // @[frontend.scala 953:30]
  assign bpd_io_f0_req_bits_ghist_current_saw_branch_not_taken = io_cpu_sfence_valid ? _GEN_191 : _GEN_215; // @[frontend.scala 953:30]
  assign bpd_io_f0_req_bits_ghist_new_saw_branch_not_taken = io_cpu_sfence_valid ? _GEN_190 : _GEN_214; // @[frontend.scala 953:30]
  assign bpd_io_f0_req_bits_ghist_new_saw_branch_taken = io_cpu_sfence_valid ? _GEN_189 : _GEN_213; // @[frontend.scala 953:30]
  assign bpd_io_f0_req_bits_ghist_ras_idx = io_cpu_sfence_valid ? _GEN_188 : _GEN_212; // @[frontend.scala 953:30]
  assign bpd_io_f3_fire = f3_bpd_resp_io_enq_ready & f3_bpd_resp_io_enq_valid; // @[Decoupled.scala 40:37]
  assign bpd_io_update_valid = bpd_update_arbiter_io_out_valid; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_is_mispredict_update = bpd_update_arbiter_io_out_bits_is_mispredict_update; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_is_repair_update = bpd_update_arbiter_io_out_bits_is_repair_update; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_btb_mispredicts = bpd_update_arbiter_io_out_bits_btb_mispredicts; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_pc = bpd_update_arbiter_io_out_bits_pc; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_br_mask = bpd_update_arbiter_io_out_bits_br_mask; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_cfi_idx_valid = bpd_update_arbiter_io_out_bits_cfi_idx_valid; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_cfi_idx_bits = bpd_update_arbiter_io_out_bits_cfi_idx_bits; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_cfi_taken = bpd_update_arbiter_io_out_bits_cfi_taken; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_cfi_mispredicted = bpd_update_arbiter_io_out_bits_cfi_mispredicted; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_cfi_is_br = bpd_update_arbiter_io_out_bits_cfi_is_br; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_cfi_is_jal = bpd_update_arbiter_io_out_bits_cfi_is_jal; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_cfi_is_jalr = bpd_update_arbiter_io_out_bits_cfi_is_jalr; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_ghist_old_history = bpd_update_arbiter_io_out_bits_ghist_old_history; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_ghist_current_saw_branch_not_taken =
    bpd_update_arbiter_io_out_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_ghist_new_saw_branch_not_taken =
    bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_ghist_new_saw_branch_taken = bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_taken; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_ghist_ras_idx = bpd_update_arbiter_io_out_bits_ghist_ras_idx; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_lhist_0 = bpd_update_arbiter_io_out_bits_lhist_0; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_target = bpd_update_arbiter_io_out_bits_target; // @[frontend.scala 930:17]
  assign bpd_io_update_bits_meta_0 = bpd_update_arbiter_io_out_bits_meta_0; // @[frontend.scala 930:17]
  assign ras_clock = clock;
  assign ras_reset = reset;
  assign ras_io_read_idx = _T_217 ? f3_io_enq_bits_ghist_ras_idx : ras_read_idx; // @[frontend.scala 542:27 frontend.scala 543:18 frontend.scala 540:29]
  assign ras_io_write_valid = ftq_io_ras_update | _GEN_171; // @[frontend.scala 933:52 frontend.scala 934:24]
  assign ras_io_write_idx = ftq_io_ras_update ? ftq_io_ras_update_idx : _T_715; // @[frontend.scala 933:52 frontend.scala 935:24 frontend.scala 808:22]
  assign ras_io_write_addr = ftq_io_ras_update ? ftq_io_ras_update_pc : _T_728; // @[frontend.scala 933:52 frontend.scala 936:24 frontend.scala 806:22]
  assign tlb_clock = clock;
  assign tlb_reset = reset;
  assign tlb_io_req_valid = s1_valid & ~s1_is_replay & ~f1_clear | s1_is_sfence; // @[frontend.scala 388:69]
  assign tlb_io_req_bits_vaddr = s1_vpc; // @[frontend.scala 390:25]
  assign tlb_io_req_bits_passthrough = 1'h0; // @[frontend.scala 391:31]
  assign tlb_io_req_bits_size = 2'h3; // @[frontend.scala 392:25]
  assign tlb_io_req_bits_cmd = 5'h0;
  assign tlb_io_sfence_valid = REG_1_valid; // @[frontend.scala 393:25]
  assign tlb_io_sfence_bits_rs1 = REG_1_bits_rs1; // @[frontend.scala 393:25]
  assign tlb_io_sfence_bits_rs2 = REG_1_bits_rs2; // @[frontend.scala 393:25]
  assign tlb_io_sfence_bits_addr = REG_1_bits_addr; // @[frontend.scala 393:25]
  assign tlb_io_sfence_bits_asid = REG_1_bits_asid; // @[frontend.scala 393:25]
  assign tlb_io_ptw_req_ready = io_ptw_req_ready; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_valid = io_ptw_resp_valid; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_ae = io_ptw_resp_bits_ae; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_pte_ppn = io_ptw_resp_bits_pte_ppn; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_pte_reserved_for_software = io_ptw_resp_bits_pte_reserved_for_software; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_pte_d = io_ptw_resp_bits_pte_d; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_pte_a = io_ptw_resp_bits_pte_a; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_pte_g = io_ptw_resp_bits_pte_g; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_pte_u = io_ptw_resp_bits_pte_u; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_pte_x = io_ptw_resp_bits_pte_x; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_pte_w = io_ptw_resp_bits_pte_w; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_pte_r = io_ptw_resp_bits_pte_r; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_pte_v = io_ptw_resp_bits_pte_v; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_level = io_ptw_resp_bits_level; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_fragmented_superpage = io_ptw_resp_bits_fragmented_superpage; // @[frontend.scala 340:10]
  assign tlb_io_ptw_resp_bits_homogeneous = io_ptw_resp_bits_homogeneous; // @[frontend.scala 340:10]
  assign tlb_io_ptw_ptbr_mode = io_ptw_ptbr_mode; // @[frontend.scala 340:10]
  assign tlb_io_ptw_ptbr_asid = io_ptw_ptbr_asid; // @[frontend.scala 340:10]
  assign tlb_io_ptw_ptbr_ppn = io_ptw_ptbr_ppn; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_debug = io_ptw_status_debug; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_cease = io_ptw_status_cease; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_wfi = io_ptw_status_wfi; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_isa = io_ptw_status_isa; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_dprv = io_ptw_status_dprv; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_prv = io_ptw_status_prv; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_sd = io_ptw_status_sd; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_zero2 = io_ptw_status_zero2; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_sxl = io_ptw_status_sxl; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_uxl = io_ptw_status_uxl; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_sd_rv32 = io_ptw_status_sd_rv32; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_zero1 = io_ptw_status_zero1; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_tsr = io_ptw_status_tsr; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_tw = io_ptw_status_tw; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_tvm = io_ptw_status_tvm; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_mxr = io_ptw_status_mxr; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_sum = io_ptw_status_sum; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_mprv = io_ptw_status_mprv; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_xs = io_ptw_status_xs; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_fs = io_ptw_status_fs; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_mpp = io_ptw_status_mpp; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_vs = io_ptw_status_vs; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_spp = io_ptw_status_spp; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_mpie = io_ptw_status_mpie; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_hpie = io_ptw_status_hpie; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_spie = io_ptw_status_spie; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_upie = io_ptw_status_upie; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_mie = io_ptw_status_mie; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_hie = io_ptw_status_hie; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_sie = io_ptw_status_sie; // @[frontend.scala 340:10]
  assign tlb_io_ptw_status_uie = io_ptw_status_uie; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_0_cfg_l = io_ptw_pmp_0_cfg_l; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_0_cfg_res = io_ptw_pmp_0_cfg_res; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_0_cfg_a = io_ptw_pmp_0_cfg_a; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_0_cfg_x = io_ptw_pmp_0_cfg_x; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_0_cfg_w = io_ptw_pmp_0_cfg_w; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_0_cfg_r = io_ptw_pmp_0_cfg_r; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_0_addr = io_ptw_pmp_0_addr; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_0_mask = io_ptw_pmp_0_mask; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_1_cfg_l = io_ptw_pmp_1_cfg_l; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_1_cfg_res = io_ptw_pmp_1_cfg_res; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_1_cfg_a = io_ptw_pmp_1_cfg_a; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_1_cfg_x = io_ptw_pmp_1_cfg_x; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_1_cfg_w = io_ptw_pmp_1_cfg_w; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_1_cfg_r = io_ptw_pmp_1_cfg_r; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_1_addr = io_ptw_pmp_1_addr; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_1_mask = io_ptw_pmp_1_mask; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_2_cfg_l = io_ptw_pmp_2_cfg_l; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_2_cfg_res = io_ptw_pmp_2_cfg_res; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_2_cfg_a = io_ptw_pmp_2_cfg_a; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_2_cfg_x = io_ptw_pmp_2_cfg_x; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_2_cfg_w = io_ptw_pmp_2_cfg_w; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_2_cfg_r = io_ptw_pmp_2_cfg_r; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_2_addr = io_ptw_pmp_2_addr; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_2_mask = io_ptw_pmp_2_mask; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_3_cfg_l = io_ptw_pmp_3_cfg_l; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_3_cfg_res = io_ptw_pmp_3_cfg_res; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_3_cfg_a = io_ptw_pmp_3_cfg_a; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_3_cfg_x = io_ptw_pmp_3_cfg_x; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_3_cfg_w = io_ptw_pmp_3_cfg_w; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_3_cfg_r = io_ptw_pmp_3_cfg_r; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_3_addr = io_ptw_pmp_3_addr; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_3_mask = io_ptw_pmp_3_mask; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_4_cfg_l = io_ptw_pmp_4_cfg_l; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_4_cfg_res = io_ptw_pmp_4_cfg_res; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_4_cfg_a = io_ptw_pmp_4_cfg_a; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_4_cfg_x = io_ptw_pmp_4_cfg_x; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_4_cfg_w = io_ptw_pmp_4_cfg_w; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_4_cfg_r = io_ptw_pmp_4_cfg_r; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_4_addr = io_ptw_pmp_4_addr; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_4_mask = io_ptw_pmp_4_mask; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_5_cfg_l = io_ptw_pmp_5_cfg_l; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_5_cfg_res = io_ptw_pmp_5_cfg_res; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_5_cfg_a = io_ptw_pmp_5_cfg_a; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_5_cfg_x = io_ptw_pmp_5_cfg_x; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_5_cfg_w = io_ptw_pmp_5_cfg_w; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_5_cfg_r = io_ptw_pmp_5_cfg_r; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_5_addr = io_ptw_pmp_5_addr; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_5_mask = io_ptw_pmp_5_mask; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_6_cfg_l = io_ptw_pmp_6_cfg_l; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_6_cfg_res = io_ptw_pmp_6_cfg_res; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_6_cfg_a = io_ptw_pmp_6_cfg_a; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_6_cfg_x = io_ptw_pmp_6_cfg_x; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_6_cfg_w = io_ptw_pmp_6_cfg_w; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_6_cfg_r = io_ptw_pmp_6_cfg_r; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_6_addr = io_ptw_pmp_6_addr; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_6_mask = io_ptw_pmp_6_mask; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_7_cfg_l = io_ptw_pmp_7_cfg_l; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_7_cfg_res = io_ptw_pmp_7_cfg_res; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_7_cfg_a = io_ptw_pmp_7_cfg_a; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_7_cfg_x = io_ptw_pmp_7_cfg_x; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_7_cfg_w = io_ptw_pmp_7_cfg_w; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_7_cfg_r = io_ptw_pmp_7_cfg_r; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_7_addr = io_ptw_pmp_7_addr; // @[frontend.scala 340:10]
  assign tlb_io_ptw_pmp_7_mask = io_ptw_pmp_7_mask; // @[frontend.scala 340:10]
  assign tlb_io_ptw_customCSRs_csrs_0_wen = io_ptw_customCSRs_csrs_0_wen; // @[frontend.scala 340:10]
  assign tlb_io_ptw_customCSRs_csrs_0_wdata = io_ptw_customCSRs_csrs_0_wdata; // @[frontend.scala 340:10]
  assign tlb_io_ptw_customCSRs_csrs_0_value = io_ptw_customCSRs_csrs_0_value; // @[frontend.scala 340:10]
  assign tlb_io_kill = 1'h0; // @[frontend.scala 394:25]
  assign f3_clock = clock;
  assign f3_reset = reset | f3_clear; // @[frontend.scala 515:35]
  assign f3_io_enq_valid = s2_valid & ~f2_clear & _T_212; // @[frontend.scala 528:47]
  assign f3_io_enq_bits_pc = s2_vpc; // @[frontend.scala 531:21]
  assign f3_io_enq_bits_data = s2_xcpt ? 64'h0 : icache_io_resp_bits_data; // @[frontend.scala 532:30]
  assign f3_io_enq_bits_mask = f2_mask[3:0]; // @[frontend.scala 534:23]
  assign f3_io_enq_bits_xcpt_pf_inst = s2_tlb_resp_pf_inst; // @[frontend.scala 535:23]
  assign f3_io_enq_bits_xcpt_ae_inst = s2_tlb_resp_ae_inst; // @[frontend.scala 535:23]
  assign f3_io_enq_bits_ghist_old_history = f3_io_deq_valid & f4_ready ? _GEN_153 : s2_ghist_old_history; // @[frontend.scala 814:38 frontend.scala 533:24]
  assign f3_io_enq_bits_ghist_current_saw_branch_not_taken = f3_io_deq_valid & f4_ready ? _GEN_152 :
    s2_ghist_current_saw_branch_not_taken; // @[frontend.scala 814:38 frontend.scala 533:24]
  assign f3_io_enq_bits_ghist_new_saw_branch_not_taken = f3_io_deq_valid & f4_ready ? _GEN_151 :
    s2_ghist_new_saw_branch_not_taken; // @[frontend.scala 814:38 frontend.scala 533:24]
  assign f3_io_enq_bits_ghist_new_saw_branch_taken = f3_io_deq_valid & f4_ready ? _GEN_150 :
    s2_ghist_new_saw_branch_taken; // @[frontend.scala 814:38 frontend.scala 533:24]
  assign f3_io_enq_bits_ghist_ras_idx = f3_io_deq_valid & f4_ready ? _GEN_149 : s2_ghist_ras_idx; // @[frontend.scala 814:38 frontend.scala 533:24]
  assign f3_io_enq_bits_fsrc = _T_181 ? 2'h0 : _GEN_63; // @[frontend.scala 482:58]
  assign f3_io_enq_bits_tsrc = s2_tsrc; // @[frontend.scala 537:23]
  assign f3_io_deq_ready = f4_io_enq_ready; // @[frontend.scala 526:22 frontend.scala 907:12]
  assign f3_bpd_resp_clock = clock;
  assign f3_bpd_resp_reset = reset | f3_clear; // @[frontend.scala 520:44]
  assign f3_bpd_resp_io_enq_valid = f3_io_deq_valid & REG_5; // @[frontend.scala 549:47]
  assign f3_bpd_resp_io_enq_bits_pc = bpd_io_resp_f3_pc; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_0_taken = bpd_io_resp_f3_preds_0_taken; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_0_is_br = bpd_io_resp_f3_preds_0_is_br; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_0_is_jal = bpd_io_resp_f3_preds_0_is_jal; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_valid = bpd_io_resp_f3_preds_0_predicted_pc_valid; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_bits = bpd_io_resp_f3_preds_0_predicted_pc_bits; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_1_taken = bpd_io_resp_f3_preds_1_taken; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_1_is_br = bpd_io_resp_f3_preds_1_is_br; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_1_is_jal = bpd_io_resp_f3_preds_1_is_jal; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_valid = bpd_io_resp_f3_preds_1_predicted_pc_valid; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_bits = bpd_io_resp_f3_preds_1_predicted_pc_bits; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_2_taken = bpd_io_resp_f3_preds_2_taken; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_2_is_br = bpd_io_resp_f3_preds_2_is_br; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_2_is_jal = bpd_io_resp_f3_preds_2_is_jal; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_valid = bpd_io_resp_f3_preds_2_predicted_pc_valid; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_bits = bpd_io_resp_f3_preds_2_predicted_pc_bits; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_3_taken = bpd_io_resp_f3_preds_3_taken; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_3_is_br = bpd_io_resp_f3_preds_3_is_br; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_3_is_jal = bpd_io_resp_f3_preds_3_is_jal; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_valid = bpd_io_resp_f3_preds_3_predicted_pc_valid; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_bits = bpd_io_resp_f3_preds_3_predicted_pc_bits; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_meta_0 = bpd_io_resp_f3_meta_0; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_enq_bits_lhist_0 = bpd_io_resp_f3_lhist_0; // @[frontend.scala 550:28]
  assign f3_bpd_resp_io_deq_ready = f4_io_enq_ready; // @[frontend.scala 526:22 frontend.scala 907:12]
  assign BreakpointUnit_clock = clock;
  assign BreakpointUnit_reset = reset;
  assign BreakpointUnit_io_status_debug = io_cpu_status_debug; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_cease = io_cpu_status_cease; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_wfi = io_cpu_status_wfi; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_isa = io_cpu_status_isa; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_dprv = io_cpu_status_dprv; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_prv = io_cpu_status_prv; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_sd = io_cpu_status_sd; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_zero2 = io_cpu_status_zero2; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_sxl = io_cpu_status_sxl; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_uxl = io_cpu_status_uxl; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_sd_rv32 = io_cpu_status_sd_rv32; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_zero1 = io_cpu_status_zero1; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_tsr = io_cpu_status_tsr; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_tw = io_cpu_status_tw; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_tvm = io_cpu_status_tvm; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_mxr = io_cpu_status_mxr; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_sum = io_cpu_status_sum; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_mprv = io_cpu_status_mprv; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_xs = io_cpu_status_xs; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_fs = io_cpu_status_fs; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_mpp = io_cpu_status_mpp; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_vs = io_cpu_status_vs; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_spp = io_cpu_status_spp; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_mpie = io_cpu_status_mpie; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_hpie = io_cpu_status_hpie; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_spie = io_cpu_status_spie; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_upie = io_cpu_status_upie; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_mie = io_cpu_status_mie; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_hie = io_cpu_status_hie; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_sie = io_cpu_status_sie; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_status_uie = io_cpu_status_uie; // @[frontend.scala 607:23]
  assign BreakpointUnit_io_pc = _GEN_86[38:0];
  assign BreakpointUnit_io_ea = 39'h0;
  assign RVCExpander_clock = clock;
  assign RVCExpander_reset = reset;
  assign RVCExpander_io_in = {hi_4,f3_prev_half}; // @[Cat.scala 30:58]
  assign RVCExpander_1_clock = clock;
  assign RVCExpander_1_reset = reset;
  assign RVCExpander_1_io_in = _T_227[31:0]; // @[frontend.scala 616:30]
  assign BranchDecode_clock = clock;
  assign BranchDecode_reset = reset;
  assign BranchDecode_io_inst = RVCExpander_io_rvc ? RVCExpander_io_out_bits : _T_228; // @[consts.scala 332:8]
  assign BranchDecode_io_pc = _T_232[39:0] - 40'h2; // @[frontend.scala 619:69]
  assign BranchDecode_1_clock = clock;
  assign BranchDecode_1_reset = reset;
  assign BranchDecode_1_io_inst = RVCExpander_1_io_rvc ? RVCExpander_1_io_out_bits : _T_227[31:0]; // @[consts.scala 332:8]
  assign BranchDecode_1_io_pc = _T_232[39:0]; // @[frontend.scala 620:34]
  assign BreakpointUnit_1_clock = clock;
  assign BreakpointUnit_1_reset = reset;
  assign BreakpointUnit_1_io_status_debug = io_cpu_status_debug; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_cease = io_cpu_status_cease; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_wfi = io_cpu_status_wfi; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_isa = io_cpu_status_isa; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_dprv = io_cpu_status_dprv; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_prv = io_cpu_status_prv; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_sd = io_cpu_status_sd; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_zero2 = io_cpu_status_zero2; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_sxl = io_cpu_status_sxl; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_uxl = io_cpu_status_uxl; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_sd_rv32 = io_cpu_status_sd_rv32; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_zero1 = io_cpu_status_zero1; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_tsr = io_cpu_status_tsr; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_tw = io_cpu_status_tw; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_tvm = io_cpu_status_tvm; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_mxr = io_cpu_status_mxr; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_sum = io_cpu_status_sum; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_mprv = io_cpu_status_mprv; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_xs = io_cpu_status_xs; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_fs = io_cpu_status_fs; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_mpp = io_cpu_status_mpp; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_vs = io_cpu_status_vs; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_spp = io_cpu_status_spp; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_mpie = io_cpu_status_mpie; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_hpie = io_cpu_status_hpie; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_spie = io_cpu_status_spie; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_upie = io_cpu_status_upie; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_mie = io_cpu_status_mie; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_hie = io_cpu_status_hie; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_sie = io_cpu_status_sie; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_status_uie = io_cpu_status_uie; // @[frontend.scala 607:23]
  assign BreakpointUnit_1_io_pc = _T_337[38:0]; // @[frontend.scala 670:38]
  assign BreakpointUnit_1_io_ea = 39'h0;
  assign RVCExpander_2_clock = clock;
  assign RVCExpander_2_reset = reset;
  assign RVCExpander_2_io_in = _T_227[47:16]; // @[frontend.scala 674:29]
  assign BranchDecode_2_clock = clock;
  assign BranchDecode_2_reset = reset;
  assign BranchDecode_2_io_inst = RVCExpander_2_io_rvc ? RVCExpander_2_io_out_bits : f3_fetch_bundle_insts_1; // @[consts.scala 332:8]
  assign BranchDecode_2_io_pc = f3_aligned_pc + 40'h2; // @[frontend.scala 662:32]
  assign BreakpointUnit_2_clock = clock;
  assign BreakpointUnit_2_reset = reset;
  assign BreakpointUnit_2_io_status_debug = io_cpu_status_debug; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_cease = io_cpu_status_cease; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_wfi = io_cpu_status_wfi; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_isa = io_cpu_status_isa; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_dprv = io_cpu_status_dprv; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_prv = io_cpu_status_prv; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_sd = io_cpu_status_sd; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_zero2 = io_cpu_status_zero2; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_sxl = io_cpu_status_sxl; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_uxl = io_cpu_status_uxl; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_sd_rv32 = io_cpu_status_sd_rv32; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_zero1 = io_cpu_status_zero1; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_tsr = io_cpu_status_tsr; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_tw = io_cpu_status_tw; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_tvm = io_cpu_status_tvm; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_mxr = io_cpu_status_mxr; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_sum = io_cpu_status_sum; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_mprv = io_cpu_status_mprv; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_xs = io_cpu_status_xs; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_fs = io_cpu_status_fs; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_mpp = io_cpu_status_mpp; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_vs = io_cpu_status_vs; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_spp = io_cpu_status_spp; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_mpie = io_cpu_status_mpie; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_hpie = io_cpu_status_hpie; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_spie = io_cpu_status_spie; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_upie = io_cpu_status_upie; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_mie = io_cpu_status_mie; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_hie = io_cpu_status_hie; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_sie = io_cpu_status_sie; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_status_uie = io_cpu_status_uie; // @[frontend.scala 607:23]
  assign BreakpointUnit_2_io_pc = _T_442[38:0]; // @[frontend.scala 670:38]
  assign BreakpointUnit_2_io_ea = 39'h0;
  assign RVCExpander_3_clock = clock;
  assign RVCExpander_3_reset = reset;
  assign RVCExpander_3_io_in = _T_227[63:32]; // @[frontend.scala 681:29]
  assign BranchDecode_3_clock = clock;
  assign BranchDecode_3_reset = reset;
  assign BranchDecode_3_io_inst = RVCExpander_3_io_rvc ? RVCExpander_3_io_out_bits : f3_fetch_bundle_insts_2; // @[consts.scala 332:8]
  assign BranchDecode_3_io_pc = f3_aligned_pc + 40'h4; // @[frontend.scala 662:32]
  assign BreakpointUnit_3_clock = clock;
  assign BreakpointUnit_3_reset = reset;
  assign BreakpointUnit_3_io_status_debug = io_cpu_status_debug; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_cease = io_cpu_status_cease; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_wfi = io_cpu_status_wfi; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_isa = io_cpu_status_isa; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_dprv = io_cpu_status_dprv; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_prv = io_cpu_status_prv; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_sd = io_cpu_status_sd; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_zero2 = io_cpu_status_zero2; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_sxl = io_cpu_status_sxl; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_uxl = io_cpu_status_uxl; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_sd_rv32 = io_cpu_status_sd_rv32; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_zero1 = io_cpu_status_zero1; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_tsr = io_cpu_status_tsr; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_tw = io_cpu_status_tw; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_tvm = io_cpu_status_tvm; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_mxr = io_cpu_status_mxr; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_sum = io_cpu_status_sum; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_mprv = io_cpu_status_mprv; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_xs = io_cpu_status_xs; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_fs = io_cpu_status_fs; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_mpp = io_cpu_status_mpp; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_vs = io_cpu_status_vs; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_spp = io_cpu_status_spp; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_mpie = io_cpu_status_mpie; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_hpie = io_cpu_status_hpie; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_spie = io_cpu_status_spie; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_upie = io_cpu_status_upie; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_mie = io_cpu_status_mie; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_hie = io_cpu_status_hie; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_sie = io_cpu_status_sie; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_status_uie = io_cpu_status_uie; // @[frontend.scala 607:23]
  assign BreakpointUnit_3_io_pc = _T_546[38:0]; // @[frontend.scala 670:38]
  assign BreakpointUnit_3_io_ea = 39'h0;
  assign RVCExpander_4_clock = clock;
  assign RVCExpander_4_reset = reset;
  assign RVCExpander_4_io_in = {16'h0,lo_4}; // @[Cat.scala 30:58]
  assign BranchDecode_4_clock = clock;
  assign BranchDecode_4_reset = reset;
  assign BranchDecode_4_io_inst = RVCExpander_4_io_rvc ? RVCExpander_4_io_out_bits : f3_fetch_bundle_insts_3; // @[consts.scala 332:8]
  assign BranchDecode_4_io_pc = f3_aligned_pc + 40'h6; // @[frontend.scala 662:32]
  assign f4_btb_corrections_clock = clock;
  assign f4_btb_corrections_reset = reset;
  assign f4_btb_corrections_io_enq_valid = _T_661 & (f3_btb_mispredicts_0 | f3_btb_mispredicts_1 | f3_btb_mispredicts_2
     | f3_btb_mispredicts_3); // @[frontend.scala 843:55]
  assign f4_btb_corrections_io_enq_bits_is_mispredict_update = 1'h0; // @[frontend.scala 845:55]
  assign f4_btb_corrections_io_enq_bits_is_repair_update = 1'h0; // @[frontend.scala 846:55]
  assign f4_btb_corrections_io_enq_bits_btb_mispredicts = {hi_5,lo_5}; // @[frontend.scala 847:77]
  assign f4_btb_corrections_io_enq_bits_pc = f3_io_deq_bits_pc; // @[frontend.scala 569:29 frontend.scala 578:22]
  assign f4_btb_corrections_io_enq_bits_br_mask = 4'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_idx_valid = 1'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_idx_bits = 2'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_taken = 1'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_mispredicted = 1'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_is_br = 1'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_is_jal = 1'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_is_jalr = 1'h0;
  assign f4_btb_corrections_io_enq_bits_ghist_old_history = f3_io_deq_bits_ghist_old_history; // @[frontend.scala 569:29 frontend.scala 760:28]
  assign f4_btb_corrections_io_enq_bits_ghist_current_saw_branch_not_taken =
    f3_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 569:29 frontend.scala 760:28]
  assign f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_not_taken = f3_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 569:29 frontend.scala 760:28]
  assign f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_taken = f3_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 569:29 frontend.scala 760:28]
  assign f4_btb_corrections_io_enq_bits_ghist_ras_idx = f3_io_deq_bits_ghist_ras_idx; // @[frontend.scala 569:29 frontend.scala 760:28]
  assign f4_btb_corrections_io_enq_bits_lhist_0 = f3_bpd_resp_io_deq_bits_lhist_0; // @[frontend.scala 569:29 frontend.scala 761:28]
  assign f4_btb_corrections_io_enq_bits_target = 40'h0;
  assign f4_btb_corrections_io_enq_bits_meta_0 = f3_bpd_resp_io_deq_bits_meta_0; // @[frontend.scala 569:29 frontend.scala 762:28]
  assign f4_btb_corrections_io_deq_ready = bpd_update_arbiter_io_in_1_ready; // @[frontend.scala 929:31]
  assign f4_clock = clock;
  assign f4_reset = reset | f3_clear; // @[frontend.scala 858:35]
  assign f4_io_enq_valid = f3_io_deq_valid & ~f3_clear; // @[frontend.scala 908:38]
  assign f4_io_enq_bits_pc = f3_io_deq_bits_pc; // @[frontend.scala 569:29 frontend.scala 578:22]
  assign f4_io_enq_bits_next_pc = f3_redirects_0 | f3_redirects_1 | f3_redirects_2 | f3_redirects_3 ? _T_680 : _T_685; // @[frontend.scala 784:32]
  assign f4_io_enq_bits_edge_inst_0 = f3_prev_is_half; // @[frontend.scala 629:34 frontend.scala 635:40 frontend.scala 656:40]
  assign f4_io_enq_bits_insts_0 = f3_prev_is_half ? _T_228 : _T_227[31:0]; // @[frontend.scala 629:34 frontend.scala 630:40 frontend.scala 651:40]
  assign f4_io_enq_bits_insts_1 = _T_227[47:16]; // @[frontend.scala 674:29]
  assign f4_io_enq_bits_insts_2 = _T_227[63:32]; // @[frontend.scala 681:29]
  assign f4_io_enq_bits_insts_3 = {16'h0,lo_4}; // @[Cat.scala 30:58]
  assign f4_io_enq_bits_exp_insts_0 = f3_prev_is_half ? _T_230 : _T_231; // @[frontend.scala 629:34 frontend.scala 632:40 frontend.scala 653:40]
  assign f4_io_enq_bits_exp_insts_1 = RVCExpander_2_io_rvc ? RVCExpander_2_io_out_bits : f3_fetch_bundle_insts_1; // @[consts.scala 332:8]
  assign f4_io_enq_bits_exp_insts_2 = RVCExpander_3_io_rvc ? RVCExpander_3_io_out_bits : f3_fetch_bundle_insts_2; // @[consts.scala 332:8]
  assign f4_io_enq_bits_exp_insts_3 = RVCExpander_4_io_rvc ? RVCExpander_4_io_out_bits : f3_fetch_bundle_insts_3; // @[consts.scala 332:8]
  assign f4_io_enq_bits_sfbs_0 = _T_271 & _T_273; // @[frontend.scala 719:33]
  assign f4_io_enq_bits_sfbs_1 = _T_376 & _T_378; // @[frontend.scala 719:33]
  assign f4_io_enq_bits_sfbs_2 = _T_480 & _T_482; // @[frontend.scala 719:33]
  assign f4_io_enq_bits_sfbs_3 = _T_588 & _T_590; // @[frontend.scala 719:33]
  assign f4_io_enq_bits_sfb_masks_0 = 8'hfe & _T_314; // @[frontend.scala 722:68]
  assign f4_io_enq_bits_sfb_masks_1 = 8'hfc & _T_419; // @[frontend.scala 722:68]
  assign f4_io_enq_bits_sfb_masks_2 = 8'hf8 & _T_523; // @[frontend.scala 722:68]
  assign f4_io_enq_bits_sfb_masks_3 = 8'hf0 & _T_631; // @[frontend.scala 722:68]
  assign f4_io_enq_bits_sfb_dests_0 = _T_265[3:0]; // @[frontend.scala 569:29 frontend.scala 726:42]
  assign f4_io_enq_bits_sfb_dests_1 = _T_370[3:0]; // @[frontend.scala 569:29 frontend.scala 726:42]
  assign f4_io_enq_bits_sfb_dests_2 = _T_474[3:0]; // @[frontend.scala 569:29 frontend.scala 726:42]
  assign f4_io_enq_bits_sfb_dests_3 = _T_582[3:0]; // @[frontend.scala 569:29 frontend.scala 726:42]
  assign f4_io_enq_bits_shadowable_mask_0 = _T_319 & _T_322; // @[frontend.scala 724:62]
  assign f4_io_enq_bits_shadowable_mask_1 = _T_424 & _T_427; // @[frontend.scala 724:62]
  assign f4_io_enq_bits_shadowable_mask_2 = _T_528 & _T_531; // @[frontend.scala 724:62]
  assign f4_io_enq_bits_shadowable_mask_3 = _T_636 & _T_639; // @[frontend.scala 724:62]
  assign f4_io_enq_bits_shadowed_mask_0 = 1'h0; // @[frontend.scala 901:23 frontend.scala 902:22 frontend.scala 904:22]
  assign f4_io_enq_bits_shadowed_mask_1 = 1'h0; // @[frontend.scala 901:23 frontend.scala 902:22 frontend.scala 904:22]
  assign f4_io_enq_bits_shadowed_mask_2 = 1'h0; // @[frontend.scala 901:23 frontend.scala 902:22 frontend.scala 904:22]
  assign f4_io_enq_bits_shadowed_mask_3 = 1'h0; // @[frontend.scala 901:23 frontend.scala 902:22 frontend.scala 904:22]
  assign f4_io_enq_bits_cfi_idx_valid = _T_673 | f3_redirects_3; // @[frontend.scala 777:57]
  assign f4_io_enq_bits_cfi_idx_bits = f3_redirects_0 ? 2'h0 : _T_670; // @[Mux.scala 47:69]
  assign f4_io_enq_bits_cfi_type = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_cfi_types_3 : _GEN_97; // @[frontend.scala 755:33 frontend.scala 755:33]
  assign f4_io_enq_bits_cfi_is_call = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_call_mask_3 : _GEN_101; // @[frontend.scala 756:33 frontend.scala 756:33]
  assign f4_io_enq_bits_cfi_is_ret = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_ret_mask_3 : _GEN_105; // @[frontend.scala 757:33 frontend.scala 757:33]
  assign f4_io_enq_bits_cfi_npc_plus4 = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? _T_554 : _GEN_109; // @[frontend.scala 758:33 frontend.scala 758:33]
  assign f4_io_enq_bits_ras_top = ras_io_read_addr; // @[frontend.scala 569:29 frontend.scala 780:27]
  assign f4_io_enq_bits_ftq_idx = 5'h0; // @[frontend.scala 569:29 frontend.scala 579:27]
  assign f4_io_enq_bits_mask = {hi_2,lo_2}; // @[frontend.scala 576:35]
  assign f4_io_enq_bits_br_mask = {hi_3,lo_3}; // @[frontend.scala 577:41]
  assign f4_io_enq_bits_ghist_old_history = f3_io_deq_bits_ghist_old_history; // @[frontend.scala 569:29 frontend.scala 760:28]
  assign f4_io_enq_bits_ghist_current_saw_branch_not_taken = f3_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 569:29 frontend.scala 760:28]
  assign f4_io_enq_bits_ghist_new_saw_branch_not_taken = f3_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 569:29 frontend.scala 760:28]
  assign f4_io_enq_bits_ghist_new_saw_branch_taken = f3_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 569:29 frontend.scala 760:28]
  assign f4_io_enq_bits_ghist_ras_idx = f3_io_deq_bits_ghist_ras_idx; // @[frontend.scala 569:29 frontend.scala 760:28]
  assign f4_io_enq_bits_lhist_0 = f3_bpd_resp_io_deq_bits_lhist_0; // @[frontend.scala 569:29 frontend.scala 761:28]
  assign f4_io_enq_bits_xcpt_pf_if = f3_io_deq_bits_xcpt_pf_inst; // @[frontend.scala 569:29 frontend.scala 580:30]
  assign f4_io_enq_bits_xcpt_ae_if = f3_io_deq_bits_xcpt_ae_inst; // @[frontend.scala 569:29 frontend.scala 581:30]
  assign f4_io_enq_bits_bp_debug_if_oh_0 = BreakpointUnit_io_debug_if; // @[frontend.scala 569:29 frontend.scala 741:41]
  assign f4_io_enq_bits_bp_debug_if_oh_1 = BreakpointUnit_1_io_debug_if; // @[frontend.scala 569:29 frontend.scala 741:41]
  assign f4_io_enq_bits_bp_debug_if_oh_2 = BreakpointUnit_2_io_debug_if; // @[frontend.scala 569:29 frontend.scala 741:41]
  assign f4_io_enq_bits_bp_debug_if_oh_3 = BreakpointUnit_3_io_debug_if; // @[frontend.scala 569:29 frontend.scala 741:41]
  assign f4_io_enq_bits_bp_xcpt_if_oh_0 = BreakpointUnit_io_xcpt_if; // @[frontend.scala 569:29 frontend.scala 742:41]
  assign f4_io_enq_bits_bp_xcpt_if_oh_1 = BreakpointUnit_1_io_xcpt_if; // @[frontend.scala 569:29 frontend.scala 742:41]
  assign f4_io_enq_bits_bp_xcpt_if_oh_2 = BreakpointUnit_2_io_xcpt_if; // @[frontend.scala 569:29 frontend.scala 742:41]
  assign f4_io_enq_bits_bp_xcpt_if_oh_3 = BreakpointUnit_3_io_xcpt_if; // @[frontend.scala 569:29 frontend.scala 742:41]
  assign f4_io_enq_bits_end_half_valid = ~_T_551 & ~_T_657; // @[frontend.scala 748:69]
  assign f4_io_enq_bits_end_half_bits = f3_fetch_bundle_insts_3[15:0]; // @[frontend.scala 746:40]
  assign f4_io_enq_bits_bpd_meta_0 = f3_bpd_resp_io_deq_bits_meta_0; // @[frontend.scala 569:29 frontend.scala 762:28]
  assign f4_io_enq_bits_fsrc = f3_io_deq_valid & f4_ready ? _GEN_170 : f3_io_deq_bits_fsrc; // @[frontend.scala 814:38 frontend.scala 582:24]
  assign f4_io_enq_bits_tsrc = f3_io_deq_bits_tsrc; // @[frontend.scala 569:29 frontend.scala 583:24]
  assign f4_io_deq_ready = fb_io_enq_ready & ftq_io_enq_ready & ~f4_delay; // @[frontend.scala 910:58]
  assign fb_clock = clock;
  assign fb_reset = reset;
  assign fb_io_enq_valid = f4_io_deq_valid & ftq_io_enq_ready & _T_914; // @[frontend.scala 912:58]
  assign fb_io_enq_bits_pc = f4_io_deq_bits_pc; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_next_pc = f4_io_deq_bits_next_pc; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_edge_inst_0 = f4_io_deq_bits_edge_inst_0; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_insts_0 = f4_io_deq_bits_insts_0; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_insts_1 = f4_io_deq_bits_insts_1; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_insts_2 = f4_io_deq_bits_insts_2; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_insts_3 = f4_io_deq_bits_insts_3; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_exp_insts_0 = f4_io_deq_bits_exp_insts_0; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_exp_insts_1 = f4_io_deq_bits_exp_insts_1; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_exp_insts_2 = f4_io_deq_bits_exp_insts_2; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_exp_insts_3 = f4_io_deq_bits_exp_insts_3; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_sfbs_0 = 1'h0; // @[frontend.scala 915:88]
  assign fb_io_enq_bits_sfbs_1 = 1'h0; // @[frontend.scala 915:88]
  assign fb_io_enq_bits_sfbs_2 = 1'h0; // @[frontend.scala 915:88]
  assign fb_io_enq_bits_sfbs_3 = 1'h0; // @[frontend.scala 915:88]
  assign fb_io_enq_bits_sfb_masks_0 = f4_io_deq_bits_sfb_masks_0; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_sfb_masks_1 = f4_io_deq_bits_sfb_masks_1; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_sfb_masks_2 = f4_io_deq_bits_sfb_masks_2; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_sfb_masks_3 = f4_io_deq_bits_sfb_masks_3; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_sfb_dests_0 = f4_io_deq_bits_sfb_dests_0; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_sfb_dests_1 = f4_io_deq_bits_sfb_dests_1; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_sfb_dests_2 = f4_io_deq_bits_sfb_dests_2; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_sfb_dests_3 = f4_io_deq_bits_sfb_dests_3; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_shadowable_mask_0 = f4_io_deq_bits_shadowable_mask_0; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_shadowable_mask_1 = f4_io_deq_bits_shadowable_mask_1; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_shadowable_mask_2 = f4_io_deq_bits_shadowable_mask_2; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_shadowable_mask_3 = f4_io_deq_bits_shadowable_mask_3; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_shadowed_mask_0 = _T_927[0]; // @[frontend.scala 919:5]
  assign fb_io_enq_bits_shadowed_mask_1 = _T_927[1]; // @[frontend.scala 919:5]
  assign fb_io_enq_bits_shadowed_mask_2 = _T_927[2]; // @[frontend.scala 919:5]
  assign fb_io_enq_bits_shadowed_mask_3 = _T_927[3]; // @[frontend.scala 919:5]
  assign fb_io_enq_bits_cfi_idx_valid = f4_io_deq_bits_cfi_idx_valid; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_cfi_idx_bits = f4_io_deq_bits_cfi_idx_bits; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_cfi_type = f4_io_deq_bits_cfi_type; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_cfi_is_call = f4_io_deq_bits_cfi_is_call; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_cfi_is_ret = f4_io_deq_bits_cfi_is_ret; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_cfi_npc_plus4 = f4_io_deq_bits_cfi_npc_plus4; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_ras_top = f4_io_deq_bits_ras_top; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_ftq_idx = ftq_io_enq_idx; // @[frontend.scala 914:26]
  assign fb_io_enq_bits_mask = f4_io_deq_bits_mask; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_br_mask = f4_io_deq_bits_br_mask; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_ghist_old_history = f4_io_deq_bits_ghist_old_history; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_ghist_current_saw_branch_not_taken = f4_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_ghist_new_saw_branch_not_taken = f4_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_ghist_new_saw_branch_taken = f4_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_ghist_ras_idx = f4_io_deq_bits_ghist_ras_idx; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_lhist_0 = f4_io_deq_bits_lhist_0; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_xcpt_pf_if = f4_io_deq_bits_xcpt_pf_if; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_xcpt_ae_if = f4_io_deq_bits_xcpt_ae_if; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_bp_debug_if_oh_0 = f4_io_deq_bits_bp_debug_if_oh_0; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_bp_debug_if_oh_1 = f4_io_deq_bits_bp_debug_if_oh_1; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_bp_debug_if_oh_2 = f4_io_deq_bits_bp_debug_if_oh_2; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_bp_debug_if_oh_3 = f4_io_deq_bits_bp_debug_if_oh_3; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_bp_xcpt_if_oh_0 = f4_io_deq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_bp_xcpt_if_oh_1 = f4_io_deq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_bp_xcpt_if_oh_2 = f4_io_deq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_bp_xcpt_if_oh_3 = f4_io_deq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_end_half_valid = f4_io_deq_bits_end_half_valid; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_end_half_bits = f4_io_deq_bits_end_half_bits; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_bpd_meta_0 = f4_io_deq_bits_bpd_meta_0; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_fsrc = f4_io_deq_bits_fsrc; // @[frontend.scala 913:19]
  assign fb_io_enq_bits_tsrc = f4_io_deq_bits_tsrc; // @[frontend.scala 913:19]
  assign fb_io_deq_ready = io_cpu_fetchpacket_ready; // @[frontend.scala 944:22]
  assign fb_io_clear = io_cpu_sfence_valid | io_cpu_redirect_flush; // @[frontend.scala 953:30 frontend.scala 954:17]
  assign ftq_clock = clock;
  assign ftq_reset = reset;
  assign ftq_io_enq_valid = f4_io_deq_valid & fb_io_enq_ready & _T_914; // @[frontend.scala 922:67]
  assign ftq_io_enq_bits_pc = f4_io_deq_bits_pc; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_next_pc = f4_io_deq_bits_next_pc; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_edge_inst_0 = f4_io_deq_bits_edge_inst_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_insts_0 = f4_io_deq_bits_insts_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_insts_1 = f4_io_deq_bits_insts_1; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_insts_2 = f4_io_deq_bits_insts_2; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_insts_3 = f4_io_deq_bits_insts_3; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_exp_insts_0 = f4_io_deq_bits_exp_insts_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_exp_insts_1 = f4_io_deq_bits_exp_insts_1; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_exp_insts_2 = f4_io_deq_bits_exp_insts_2; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_exp_insts_3 = f4_io_deq_bits_exp_insts_3; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfbs_0 = f4_io_deq_bits_sfbs_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfbs_1 = f4_io_deq_bits_sfbs_1; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfbs_2 = f4_io_deq_bits_sfbs_2; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfbs_3 = f4_io_deq_bits_sfbs_3; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfb_masks_0 = f4_io_deq_bits_sfb_masks_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfb_masks_1 = f4_io_deq_bits_sfb_masks_1; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfb_masks_2 = f4_io_deq_bits_sfb_masks_2; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfb_masks_3 = f4_io_deq_bits_sfb_masks_3; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfb_dests_0 = f4_io_deq_bits_sfb_dests_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfb_dests_1 = f4_io_deq_bits_sfb_dests_1; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfb_dests_2 = f4_io_deq_bits_sfb_dests_2; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_sfb_dests_3 = f4_io_deq_bits_sfb_dests_3; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_shadowable_mask_0 = f4_io_deq_bits_shadowable_mask_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_shadowable_mask_1 = f4_io_deq_bits_shadowable_mask_1; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_shadowable_mask_2 = f4_io_deq_bits_shadowable_mask_2; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_shadowable_mask_3 = f4_io_deq_bits_shadowable_mask_3; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_shadowed_mask_0 = f4_io_deq_bits_shadowed_mask_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_shadowed_mask_1 = f4_io_deq_bits_shadowed_mask_1; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_shadowed_mask_2 = f4_io_deq_bits_shadowed_mask_2; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_shadowed_mask_3 = f4_io_deq_bits_shadowed_mask_3; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_cfi_idx_valid = f4_io_deq_bits_cfi_idx_valid; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_cfi_idx_bits = f4_io_deq_bits_cfi_idx_bits; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_cfi_type = f4_io_deq_bits_cfi_type; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_cfi_is_call = f4_io_deq_bits_cfi_is_call; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_cfi_is_ret = f4_io_deq_bits_cfi_is_ret; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_cfi_npc_plus4 = f4_io_deq_bits_cfi_npc_plus4; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_ras_top = f4_io_deq_bits_ras_top; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_ftq_idx = f4_io_deq_bits_ftq_idx; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_mask = f4_io_deq_bits_mask; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_br_mask = f4_io_deq_bits_br_mask; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_ghist_old_history = f4_io_deq_bits_ghist_old_history; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_ghist_current_saw_branch_not_taken = f4_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_ghist_new_saw_branch_not_taken = f4_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_ghist_new_saw_branch_taken = f4_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_ghist_ras_idx = f4_io_deq_bits_ghist_ras_idx; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_lhist_0 = f4_io_deq_bits_lhist_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_xcpt_pf_if = f4_io_deq_bits_xcpt_pf_if; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_xcpt_ae_if = f4_io_deq_bits_xcpt_ae_if; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_bp_debug_if_oh_0 = f4_io_deq_bits_bp_debug_if_oh_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_bp_debug_if_oh_1 = f4_io_deq_bits_bp_debug_if_oh_1; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_bp_debug_if_oh_2 = f4_io_deq_bits_bp_debug_if_oh_2; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_bp_debug_if_oh_3 = f4_io_deq_bits_bp_debug_if_oh_3; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_bp_xcpt_if_oh_0 = f4_io_deq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_bp_xcpt_if_oh_1 = f4_io_deq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_bp_xcpt_if_oh_2 = f4_io_deq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_bp_xcpt_if_oh_3 = f4_io_deq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_end_half_valid = f4_io_deq_bits_end_half_valid; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_end_half_bits = f4_io_deq_bits_end_half_bits; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_bpd_meta_0 = f4_io_deq_bits_bpd_meta_0; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_fsrc = f4_io_deq_bits_fsrc; // @[frontend.scala 923:29]
  assign ftq_io_enq_bits_tsrc = f4_io_deq_bits_tsrc; // @[frontend.scala 923:29]
  assign ftq_io_deq_valid = io_cpu_commit_valid; // @[frontend.scala 946:14]
  assign ftq_io_deq_bits = io_cpu_commit_bits[4:0]; // @[frontend.scala 946:14]
  assign ftq_io_get_ftq_pc_0_ftq_idx = io_cpu_get_pc_0_ftq_idx; // @[frontend.scala 945:17]
  assign ftq_io_get_ftq_pc_1_ftq_idx = io_cpu_get_pc_1_ftq_idx; // @[frontend.scala 945:17]
  assign ftq_io_debug_ftq_idx_0 = io_cpu_debug_ftq_idx_0; // @[frontend.scala 984:24]
  assign ftq_io_debug_ftq_idx_1 = io_cpu_debug_ftq_idx_1; // @[frontend.scala 984:24]
  assign ftq_io_redirect_valid = io_cpu_redirect_val; // @[frontend.scala 953:30 frontend.scala 949:27]
  assign ftq_io_redirect_bits = io_cpu_redirect_ftq_idx; // @[frontend.scala 953:30 frontend.scala 950:27]
  assign ftq_io_brupdate_b1_resolve_mask = io_cpu_brupdate_b1_resolve_mask; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b1_mispredict_mask = io_cpu_brupdate_b1_mispredict_mask; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_uopc = io_cpu_brupdate_b2_uop_uopc; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_inst = io_cpu_brupdate_b2_uop_inst; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_debug_inst = io_cpu_brupdate_b2_uop_debug_inst; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_is_rvc = io_cpu_brupdate_b2_uop_is_rvc; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_debug_pc = io_cpu_brupdate_b2_uop_debug_pc; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_iq_type = io_cpu_brupdate_b2_uop_iq_type; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_fu_code = io_cpu_brupdate_b2_uop_fu_code; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ctrl_br_type = io_cpu_brupdate_b2_uop_ctrl_br_type; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ctrl_op1_sel = io_cpu_brupdate_b2_uop_ctrl_op1_sel; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ctrl_op2_sel = io_cpu_brupdate_b2_uop_ctrl_op2_sel; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ctrl_imm_sel = io_cpu_brupdate_b2_uop_ctrl_imm_sel; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ctrl_op_fcn = io_cpu_brupdate_b2_uop_ctrl_op_fcn; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ctrl_fcn_dw = io_cpu_brupdate_b2_uop_ctrl_fcn_dw; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ctrl_csr_cmd = io_cpu_brupdate_b2_uop_ctrl_csr_cmd; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ctrl_is_load = io_cpu_brupdate_b2_uop_ctrl_is_load; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ctrl_is_sta = io_cpu_brupdate_b2_uop_ctrl_is_sta; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ctrl_is_std = io_cpu_brupdate_b2_uop_ctrl_is_std; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_iw_state = io_cpu_brupdate_b2_uop_iw_state; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_iw_p1_poisoned = io_cpu_brupdate_b2_uop_iw_p1_poisoned; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_iw_p2_poisoned = io_cpu_brupdate_b2_uop_iw_p2_poisoned; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_is_br = io_cpu_brupdate_b2_uop_is_br; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_is_jalr = io_cpu_brupdate_b2_uop_is_jalr; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_is_jal = io_cpu_brupdate_b2_uop_is_jal; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_is_sfb = io_cpu_brupdate_b2_uop_is_sfb; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_br_mask = io_cpu_brupdate_b2_uop_br_mask; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_br_tag = io_cpu_brupdate_b2_uop_br_tag; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ftq_idx = io_cpu_brupdate_b2_uop_ftq_idx; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_edge_inst = io_cpu_brupdate_b2_uop_edge_inst; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_pc_lob = io_cpu_brupdate_b2_uop_pc_lob; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_taken = io_cpu_brupdate_b2_uop_taken; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_imm_packed = io_cpu_brupdate_b2_uop_imm_packed; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_csr_addr = io_cpu_brupdate_b2_uop_csr_addr; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_rob_idx = io_cpu_brupdate_b2_uop_rob_idx; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ldq_idx = io_cpu_brupdate_b2_uop_ldq_idx; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_stq_idx = io_cpu_brupdate_b2_uop_stq_idx; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_rxq_idx = io_cpu_brupdate_b2_uop_rxq_idx; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_pdst = io_cpu_brupdate_b2_uop_pdst; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_prs1 = io_cpu_brupdate_b2_uop_prs1; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_prs2 = io_cpu_brupdate_b2_uop_prs2; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_prs3 = io_cpu_brupdate_b2_uop_prs3; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ppred = io_cpu_brupdate_b2_uop_ppred; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_prs1_busy = io_cpu_brupdate_b2_uop_prs1_busy; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_prs2_busy = io_cpu_brupdate_b2_uop_prs2_busy; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_prs3_busy = io_cpu_brupdate_b2_uop_prs3_busy; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ppred_busy = io_cpu_brupdate_b2_uop_ppred_busy; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_stale_pdst = io_cpu_brupdate_b2_uop_stale_pdst; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_exception = io_cpu_brupdate_b2_uop_exception; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_exc_cause = io_cpu_brupdate_b2_uop_exc_cause; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_bypassable = io_cpu_brupdate_b2_uop_bypassable; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_mem_cmd = io_cpu_brupdate_b2_uop_mem_cmd; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_mem_size = io_cpu_brupdate_b2_uop_mem_size; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_mem_signed = io_cpu_brupdate_b2_uop_mem_signed; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_is_fence = io_cpu_brupdate_b2_uop_is_fence; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_is_fencei = io_cpu_brupdate_b2_uop_is_fencei; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_is_amo = io_cpu_brupdate_b2_uop_is_amo; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_uses_ldq = io_cpu_brupdate_b2_uop_uses_ldq; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_uses_stq = io_cpu_brupdate_b2_uop_uses_stq; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_is_sys_pc2epc = io_cpu_brupdate_b2_uop_is_sys_pc2epc; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_is_unique = io_cpu_brupdate_b2_uop_is_unique; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_flush_on_commit = io_cpu_brupdate_b2_uop_flush_on_commit; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ldst_is_rs1 = io_cpu_brupdate_b2_uop_ldst_is_rs1; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ldst = io_cpu_brupdate_b2_uop_ldst; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_lrs1 = io_cpu_brupdate_b2_uop_lrs1; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_lrs2 = io_cpu_brupdate_b2_uop_lrs2; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_lrs3 = io_cpu_brupdate_b2_uop_lrs3; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_ldst_val = io_cpu_brupdate_b2_uop_ldst_val; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_dst_rtype = io_cpu_brupdate_b2_uop_dst_rtype; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_lrs1_rtype = io_cpu_brupdate_b2_uop_lrs1_rtype; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_lrs2_rtype = io_cpu_brupdate_b2_uop_lrs2_rtype; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_frs3_en = io_cpu_brupdate_b2_uop_frs3_en; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_fp_val = io_cpu_brupdate_b2_uop_fp_val; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_fp_single = io_cpu_brupdate_b2_uop_fp_single; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_xcpt_pf_if = io_cpu_brupdate_b2_uop_xcpt_pf_if; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_xcpt_ae_if = io_cpu_brupdate_b2_uop_xcpt_ae_if; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_xcpt_ma_if = io_cpu_brupdate_b2_uop_xcpt_ma_if; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_bp_debug_if = io_cpu_brupdate_b2_uop_bp_debug_if; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_bp_xcpt_if = io_cpu_brupdate_b2_uop_bp_xcpt_if; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_debug_fsrc = io_cpu_brupdate_b2_uop_debug_fsrc; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_uop_debug_tsrc = io_cpu_brupdate_b2_uop_debug_tsrc; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_valid = io_cpu_brupdate_b2_valid; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_mispredict = io_cpu_brupdate_b2_mispredict; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_taken = io_cpu_brupdate_b2_taken; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_cfi_type = io_cpu_brupdate_b2_cfi_type; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_pc_sel = io_cpu_brupdate_b2_pc_sel; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_jalr_target = io_cpu_brupdate_b2_jalr_target; // @[frontend.scala 947:19]
  assign ftq_io_brupdate_b2_target_offset = io_cpu_brupdate_b2_target_offset; // @[frontend.scala 947:19]
  assign bpd_update_arbiter_clock = clock;
  assign bpd_update_arbiter_reset = reset;
  assign bpd_update_arbiter_io_in_0_valid = ftq_io_bpdupdate_valid; // @[frontend.scala 926:37]
  assign bpd_update_arbiter_io_in_0_bits_is_mispredict_update = ftq_io_bpdupdate_bits_is_mispredict_update; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_is_repair_update = ftq_io_bpdupdate_bits_is_repair_update; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_btb_mispredicts = ftq_io_bpdupdate_bits_btb_mispredicts; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_pc = ftq_io_bpdupdate_bits_pc; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_br_mask = ftq_io_bpdupdate_bits_br_mask; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_idx_valid = ftq_io_bpdupdate_bits_cfi_idx_valid; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_idx_bits = ftq_io_bpdupdate_bits_cfi_idx_bits; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_taken = ftq_io_bpdupdate_bits_cfi_taken; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_mispredicted = ftq_io_bpdupdate_bits_cfi_mispredicted; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_is_br = ftq_io_bpdupdate_bits_cfi_is_br; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_is_jal = ftq_io_bpdupdate_bits_cfi_is_jal; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_is_jalr = ftq_io_bpdupdate_bits_cfi_is_jalr; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_ghist_old_history = ftq_io_bpdupdate_bits_ghist_old_history; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_ghist_current_saw_branch_not_taken =
    ftq_io_bpdupdate_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_not_taken =
    ftq_io_bpdupdate_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_taken = ftq_io_bpdupdate_bits_ghist_new_saw_branch_taken; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_ghist_ras_idx = ftq_io_bpdupdate_bits_ghist_ras_idx; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_lhist_0 = ftq_io_bpdupdate_bits_lhist_0; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_target = ftq_io_bpdupdate_bits_target; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_0_bits_meta_0 = ftq_io_bpdupdate_bits_meta_0; // @[frontend.scala 927:37]
  assign bpd_update_arbiter_io_in_1_valid = f4_btb_corrections_io_deq_valid; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_is_mispredict_update = f4_btb_corrections_io_deq_bits_is_mispredict_update; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_is_repair_update = f4_btb_corrections_io_deq_bits_is_repair_update; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_btb_mispredicts = f4_btb_corrections_io_deq_bits_btb_mispredicts; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_pc = f4_btb_corrections_io_deq_bits_pc; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_br_mask = f4_btb_corrections_io_deq_bits_br_mask; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_idx_valid = f4_btb_corrections_io_deq_bits_cfi_idx_valid; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_idx_bits = f4_btb_corrections_io_deq_bits_cfi_idx_bits; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_taken = f4_btb_corrections_io_deq_bits_cfi_taken; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_mispredicted = f4_btb_corrections_io_deq_bits_cfi_mispredicted; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_is_br = f4_btb_corrections_io_deq_bits_cfi_is_br; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_is_jal = f4_btb_corrections_io_deq_bits_cfi_is_jal; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_is_jalr = f4_btb_corrections_io_deq_bits_cfi_is_jalr; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_ghist_old_history = f4_btb_corrections_io_deq_bits_ghist_old_history; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_ghist_current_saw_branch_not_taken =
    f4_btb_corrections_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_not_taken =
    f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_taken =
    f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_ghist_ras_idx = f4_btb_corrections_io_deq_bits_ghist_ras_idx; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_lhist_0 = f4_btb_corrections_io_deq_bits_lhist_0; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_target = f4_btb_corrections_io_deq_bits_target; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_in_1_bits_meta_0 = f4_btb_corrections_io_deq_bits_meta_0; // @[frontend.scala 929:31]
  assign bpd_update_arbiter_io_out_ready = 1'h1; // @[frontend.scala 931:35]
  always @(posedge clock) begin
    REG <= reset; // @[frontend.scala 363:23]
    if (io_cpu_sfence_valid) begin // @[frontend.scala 953:30]
      s1_vpc <= {{1'd0}, io_cpu_sfence_bits_addr}; // @[frontend.scala 961:18]
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 965:38]
      s1_vpc <= io_cpu_redirect_pc; // @[frontend.scala 975:18]
    end else if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 814:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 821:79]
        s1_vpc <= _GEN_66;
      end else begin
        s1_vpc <= _GEN_140;
      end
    end else begin
      s1_vpc <= _GEN_66;
    end
    if (reset) begin // @[frontend.scala 382:29]
      s1_valid <= 1'h0; // @[frontend.scala 382:29]
    end else if (io_cpu_sfence_valid) begin // @[frontend.scala 953:30]
      s1_valid <= 1'h0; // @[frontend.scala 960:18]
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 965:38]
      s1_valid <= io_cpu_redirect_val; // @[frontend.scala 974:18]
    end else if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 814:38]
      s1_valid <= _GEN_161;
    end else begin
      s1_valid <= _GEN_65;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 953:30]
      s1_ghist_old_history <= _GEN_192;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 965:38]
      s1_ghist_old_history <= io_cpu_redirect_ghist_old_history; // @[frontend.scala 976:18]
    end else begin
      s1_ghist_old_history <= _GEN_192;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 953:30]
      s1_ghist_current_saw_branch_not_taken <= _GEN_191;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 965:38]
      s1_ghist_current_saw_branch_not_taken <= io_cpu_redirect_ghist_current_saw_branch_not_taken; // @[frontend.scala 976:18]
    end else begin
      s1_ghist_current_saw_branch_not_taken <= _GEN_191;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 953:30]
      s1_ghist_new_saw_branch_not_taken <= _GEN_190;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 965:38]
      s1_ghist_new_saw_branch_not_taken <= io_cpu_redirect_ghist_new_saw_branch_not_taken; // @[frontend.scala 976:18]
    end else begin
      s1_ghist_new_saw_branch_not_taken <= _GEN_190;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 953:30]
      s1_ghist_new_saw_branch_taken <= _GEN_189;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 965:38]
      s1_ghist_new_saw_branch_taken <= io_cpu_redirect_ghist_new_saw_branch_taken; // @[frontend.scala 976:18]
    end else begin
      s1_ghist_new_saw_branch_taken <= _GEN_189;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 953:30]
      s1_ghist_ras_idx <= _GEN_188;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 965:38]
      s1_ghist_ras_idx <= io_cpu_redirect_ghist_ras_idx; // @[frontend.scala 976:18]
    end else begin
      s1_ghist_ras_idx <= _GEN_188;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 953:30]
      s1_is_replay <= 1'h0; // @[frontend.scala 962:18]
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 965:38]
      s1_is_replay <= 1'h0; // @[frontend.scala 978:18]
    end else if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 814:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 821:79]
        s1_is_replay <= _GEN_67;
      end else begin
        s1_is_replay <= _GEN_141;
      end
    end else begin
      s1_is_replay <= _GEN_67;
    end
    s1_is_sfence <= io_cpu_sfence_valid; // @[frontend.scala 953:30 frontend.scala 963:18]
    if (io_cpu_sfence_valid) begin // @[frontend.scala 953:30]
      s1_tsrc <= _GEN_193;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 965:38]
      s1_tsrc <= 2'h3; // @[frontend.scala 977:18]
    end else begin
      s1_tsrc <= _GEN_193;
    end
    if (reset) begin // @[frontend.scala 440:25]
      s2_valid <= 1'h0; // @[frontend.scala 440:25]
    end else begin
      s2_valid <= s1_valid & _T_7; // @[frontend.scala 440:25]
    end
    s2_vpc <= s1_vpc; // @[frontend.scala 441:25]
    if (reset) begin // @[frontend.scala 589:32]
      f3_prev_is_half <= 1'h0; // @[frontend.scala 589:32]
    end else if (io_cpu_sfence_valid) begin // @[frontend.scala 953:30]
      f3_prev_is_half <= _GEN_172;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 965:38]
      f3_prev_is_half <= 1'h0; // @[frontend.scala 972:21]
    end else begin
      f3_prev_is_half <= _GEN_172;
    end
    if (_T_661) begin // @[frontend.scala 767:27]
      f3_prev_half <= last_inst; // @[frontend.scala 769:21]
    end
    if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 814:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 821:79]
        s2_ghist_old_history <= _GEN_80;
      end else if (~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist) begin // @[frontend.scala 823:99]
        s2_ghist_old_history <= f3_predicted_ghist_old_history; // @[frontend.scala 824:16]
      end else begin
        s2_ghist_old_history <= _GEN_80;
      end
    end else begin
      s2_ghist_old_history <= _GEN_80;
    end
    if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 814:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 821:79]
        s2_ghist_new_saw_branch_not_taken <= _GEN_78;
      end else if (~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist) begin // @[frontend.scala 823:99]
        s2_ghist_new_saw_branch_not_taken <= 1'h0; // @[frontend.scala 824:16]
      end else begin
        s2_ghist_new_saw_branch_not_taken <= _GEN_78;
      end
    end else begin
      s2_ghist_new_saw_branch_not_taken <= _GEN_78;
    end
    if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 814:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 821:79]
        s2_ghist_new_saw_branch_taken <= _GEN_77;
      end else if (~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist) begin // @[frontend.scala 823:99]
        s2_ghist_new_saw_branch_taken <= 1'h0; // @[frontend.scala 824:16]
      end else begin
        s2_ghist_new_saw_branch_taken <= _GEN_77;
      end
    end else begin
      s2_ghist_new_saw_branch_taken <= _GEN_77;
    end
    if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 814:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 821:79]
        s2_ghist_current_saw_branch_not_taken <= _GEN_79;
      end else if (~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist) begin // @[frontend.scala 823:99]
        s2_ghist_current_saw_branch_not_taken <= 1'h0; // @[frontend.scala 824:16]
      end else begin
        s2_ghist_current_saw_branch_not_taken <= _GEN_79;
      end
    end else begin
      s2_ghist_current_saw_branch_not_taken <= _GEN_79;
    end
    REG_1_valid <= io_cpu_sfence_valid; // @[frontend.scala 393:35]
    REG_1_bits_rs1 <= io_cpu_sfence_bits_rs1; // @[frontend.scala 393:35]
    REG_1_bits_rs2 <= io_cpu_sfence_bits_rs2; // @[frontend.scala 393:35]
    REG_1_bits_addr <= io_cpu_sfence_bits_addr; // @[frontend.scala 393:35]
    REG_1_bits_asid <= io_cpu_sfence_bits_asid; // @[frontend.scala 393:35]
    REG_2_pf_inst <= s2_tlb_resp_pf_inst; // @[frontend.scala 355:28 frontend.scala 508:18]
    REG_2_ae_inst <= s2_tlb_resp_ae_inst; // @[frontend.scala 355:28 frontend.scala 508:18]
    REG_3 <= s2_ppc; // @[frontend.scala 357:28 frontend.scala 509:18]
    if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 814:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 821:79]
        s2_ghist_ras_idx <= _GEN_76;
      end else if (~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist) begin // @[frontend.scala 823:99]
        if (_T_674 & f3_fetch_bundle_cfi_is_call) begin // @[frontend.scala 124:31]
          s2_ghist_ras_idx <= _T_715;
        end else begin
          s2_ghist_ras_idx <= _T_721;
        end
      end else begin
        s2_ghist_ras_idx <= _GEN_76;
      end
    end else begin
      s2_ghist_ras_idx <= _GEN_76;
    end
    if (s1_is_replay) begin // @[frontend.scala 398:20]
      s2_ppc <= REG_3;
    end else begin
      s2_ppc <= tlb_io_resp_paddr;
    end
    s2_tsrc <= s1_tsrc; // @[frontend.scala 445:24]
    if (s1_is_replay) begin // @[frontend.scala 397:24]
      s2_tlb_resp_pf_inst <= REG_2_pf_inst;
    end else begin
      s2_tlb_resp_pf_inst <= tlb_io_resp_pf_inst;
    end
    if (s1_is_replay) begin // @[frontend.scala 397:24]
      s2_tlb_resp_ae_inst <= REG_2_ae_inst;
    end else begin
      s2_tlb_resp_ae_inst <= tlb_io_resp_ae_inst;
    end
    s2_tlb_miss <= _T_5 & tlb_io_resp_miss; // @[frontend.scala 396:35]
    REG_4 <= s1_is_replay; // @[frontend.scala 450:29]
    if (reset) begin // @[frontend.scala 540:29]
      ras_read_idx <= 5'h0; // @[frontend.scala 540:29]
    end else if (_T_217) begin // @[frontend.scala 542:27]
      ras_read_idx <= f3_io_enq_bits_ghist_ras_idx; // @[frontend.scala 543:18]
    end
    REG_5 <= f3_io_enq_ready; // @[frontend.scala 549:57]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_661 & ~(f3_bpd_resp_io_deq_bits_pc == f3_fetch_bundle_pc | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at frontend.scala:770 assert(f3_bpd_resp.io.deq.bits.pc === f3_fetch_bundle.pc)\n"); // @[frontend.scala 770:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_661 & ~(f3_bpd_resp_io_deq_bits_pc == f3_fetch_bundle_pc | reset)) begin
          $fatal; // @[frontend.scala 770:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(bpd_update_arbiter_io_in_0_ready | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at frontend.scala:928 assert(bpd_update_arbiter.io.in(0).ready)\n"
            ); // @[frontend.scala 928:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(bpd_update_arbiter_io_in_0_ready | reset)) begin
          $fatal; // @[frontend.scala 928:9]
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
  _RAND_1 = {2{`RANDOM}};
  s1_vpc = _RAND_1[39:0];
  _RAND_2 = {1{`RANDOM}};
  s1_valid = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  s1_ghist_old_history = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  s1_ghist_current_saw_branch_not_taken = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s1_ghist_new_saw_branch_not_taken = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_ghist_new_saw_branch_taken = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s1_ghist_ras_idx = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  s1_is_replay = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s1_is_sfence = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s1_tsrc = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  s2_valid = _RAND_11[0:0];
  _RAND_12 = {2{`RANDOM}};
  s2_vpc = _RAND_12[39:0];
  _RAND_13 = {1{`RANDOM}};
  f3_prev_is_half = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  f3_prev_half = _RAND_14[15:0];
  _RAND_15 = {2{`RANDOM}};
  s2_ghist_old_history = _RAND_15[63:0];
  _RAND_16 = {1{`RANDOM}};
  s2_ghist_new_saw_branch_not_taken = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  s2_ghist_new_saw_branch_taken = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s2_ghist_current_saw_branch_not_taken = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  REG_1_valid = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  REG_1_bits_rs1 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  REG_1_bits_rs2 = _RAND_21[0:0];
  _RAND_22 = {2{`RANDOM}};
  REG_1_bits_addr = _RAND_22[38:0];
  _RAND_23 = {1{`RANDOM}};
  REG_1_bits_asid = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  REG_2_pf_inst = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  REG_2_ae_inst = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  REG_3 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  s2_ghist_ras_idx = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  s2_ppc = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  s2_tsrc = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  s2_tlb_resp_pf_inst = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  s2_tlb_resp_ae_inst = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  s2_tlb_miss = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  REG_4 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  ras_read_idx = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  REG_5 = _RAND_35[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
