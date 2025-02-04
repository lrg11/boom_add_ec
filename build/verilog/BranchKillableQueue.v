module BranchKillableQueue(
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
  input  [39:0] io_enq_bits_addr,
  input  [63:0] io_enq_bits_data,
  input         io_enq_bits_is_hella,
  input         io_enq_bits_tag_match,
  input  [1:0]  io_enq_bits_old_meta_coh_state,
  input  [19:0] io_enq_bits_old_meta_tag,
  input         io_enq_bits_way_en,
  input  [4:0]  io_enq_bits_sdq_id,
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
  output [39:0] io_deq_bits_addr,
  output [63:0] io_deq_bits_data,
  output        io_deq_bits_is_hella,
  output        io_deq_bits_tag_match,
  output [1:0]  io_deq_bits_old_meta_coh_state,
  output [19:0] io_deq_bits_old_meta_tag,
  output        io_deq_bits_way_en,
  output [4:0]  io_deq_bits_sdq_id,
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
  output [3:0]  io_count
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
  reg [63:0] _RAND_45;
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
  reg [63:0] _RAND_89;
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
  reg [63:0] _RAND_142;
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
  reg [63:0] _RAND_186;
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
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [63:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [31:0] _RAND_265;
  reg [31:0] _RAND_266;
  reg [31:0] _RAND_267;
  reg [31:0] _RAND_268;
  reg [31:0] _RAND_269;
  reg [31:0] _RAND_270;
  reg [31:0] _RAND_271;
  reg [31:0] _RAND_272;
  reg [31:0] _RAND_273;
  reg [31:0] _RAND_274;
  reg [31:0] _RAND_275;
  reg [31:0] _RAND_276;
  reg [31:0] _RAND_277;
  reg [31:0] _RAND_278;
  reg [31:0] _RAND_279;
  reg [31:0] _RAND_280;
  reg [31:0] _RAND_281;
  reg [31:0] _RAND_282;
  reg [63:0] _RAND_283;
  reg [31:0] _RAND_284;
  reg [31:0] _RAND_285;
  reg [31:0] _RAND_286;
  reg [31:0] _RAND_287;
  reg [31:0] _RAND_288;
  reg [31:0] _RAND_289;
  reg [31:0] _RAND_290;
  reg [31:0] _RAND_291;
  reg [31:0] _RAND_292;
  reg [31:0] _RAND_293;
  reg [31:0] _RAND_294;
  reg [31:0] _RAND_295;
  reg [31:0] _RAND_296;
  reg [31:0] _RAND_297;
  reg [31:0] _RAND_298;
  reg [31:0] _RAND_299;
  reg [31:0] _RAND_300;
  reg [31:0] _RAND_301;
  reg [31:0] _RAND_302;
  reg [31:0] _RAND_303;
  reg [31:0] _RAND_304;
  reg [31:0] _RAND_305;
  reg [31:0] _RAND_306;
  reg [31:0] _RAND_307;
  reg [31:0] _RAND_308;
  reg [31:0] _RAND_309;
  reg [31:0] _RAND_310;
  reg [31:0] _RAND_311;
  reg [31:0] _RAND_312;
  reg [31:0] _RAND_313;
  reg [31:0] _RAND_314;
  reg [31:0] _RAND_315;
  reg [31:0] _RAND_316;
  reg [31:0] _RAND_317;
  reg [31:0] _RAND_318;
  reg [31:0] _RAND_319;
  reg [31:0] _RAND_320;
  reg [31:0] _RAND_321;
  reg [31:0] _RAND_322;
  reg [31:0] _RAND_323;
  reg [31:0] _RAND_324;
  reg [31:0] _RAND_325;
  reg [31:0] _RAND_326;
  reg [31:0] _RAND_327;
  reg [31:0] _RAND_328;
  reg [31:0] _RAND_329;
  reg [31:0] _RAND_330;
  reg [31:0] _RAND_331;
  reg [31:0] _RAND_332;
  reg [31:0] _RAND_333;
  reg [31:0] _RAND_334;
  reg [31:0] _RAND_335;
  reg [63:0] _RAND_336;
  reg [31:0] _RAND_337;
  reg [31:0] _RAND_338;
  reg [31:0] _RAND_339;
  reg [31:0] _RAND_340;
  reg [31:0] _RAND_341;
  reg [31:0] _RAND_342;
  reg [31:0] _RAND_343;
  reg [31:0] _RAND_344;
  reg [31:0] _RAND_345;
  reg [31:0] _RAND_346;
  reg [31:0] _RAND_347;
  reg [31:0] _RAND_348;
  reg [31:0] _RAND_349;
  reg [31:0] _RAND_350;
  reg [31:0] _RAND_351;
  reg [31:0] _RAND_352;
  reg [31:0] _RAND_353;
  reg [31:0] _RAND_354;
  reg [31:0] _RAND_355;
  reg [31:0] _RAND_356;
  reg [31:0] _RAND_357;
  reg [31:0] _RAND_358;
  reg [31:0] _RAND_359;
  reg [31:0] _RAND_360;
  reg [31:0] _RAND_361;
  reg [31:0] _RAND_362;
  reg [31:0] _RAND_363;
  reg [31:0] _RAND_364;
  reg [31:0] _RAND_365;
  reg [31:0] _RAND_366;
  reg [31:0] _RAND_367;
  reg [31:0] _RAND_368;
  reg [31:0] _RAND_369;
  reg [31:0] _RAND_370;
  reg [31:0] _RAND_371;
  reg [31:0] _RAND_372;
  reg [31:0] _RAND_373;
  reg [31:0] _RAND_374;
  reg [31:0] _RAND_375;
  reg [31:0] _RAND_376;
  reg [31:0] _RAND_377;
  reg [31:0] _RAND_378;
  reg [31:0] _RAND_379;
  reg [63:0] _RAND_380;
  reg [31:0] _RAND_381;
  reg [31:0] _RAND_382;
  reg [31:0] _RAND_383;
  reg [31:0] _RAND_384;
  reg [31:0] _RAND_385;
  reg [31:0] _RAND_386;
  reg [31:0] _RAND_387;
  reg [31:0] _RAND_388;
  reg [31:0] _RAND_389;
  reg [31:0] _RAND_390;
  reg [31:0] _RAND_391;
  reg [31:0] _RAND_392;
  reg [31:0] _RAND_393;
  reg [31:0] _RAND_394;
  reg [31:0] _RAND_395;
  reg [31:0] _RAND_396;
  reg [31:0] _RAND_397;
  reg [31:0] _RAND_398;
  reg [31:0] _RAND_399;
  reg [31:0] _RAND_400;
  reg [31:0] _RAND_401;
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
  reg [31:0] _RAND_430;
  reg [31:0] _RAND_431;
  reg [31:0] _RAND_432;
  reg [63:0] _RAND_433;
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
  reg [31:0] _RAND_474;
  reg [31:0] _RAND_475;
  reg [31:0] _RAND_476;
  reg [63:0] _RAND_477;
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
  reg [31:0] _RAND_527;
  reg [31:0] _RAND_528;
  reg [31:0] _RAND_529;
  reg [63:0] _RAND_530;
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
  reg [31:0] _RAND_571;
  reg [31:0] _RAND_572;
  reg [31:0] _RAND_573;
  reg [63:0] _RAND_574;
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
  reg [31:0] _RAND_624;
  reg [31:0] _RAND_625;
  reg [31:0] _RAND_626;
  reg [63:0] _RAND_627;
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
  reg [31:0] _RAND_668;
  reg [31:0] _RAND_669;
  reg [31:0] _RAND_670;
  reg [63:0] _RAND_671;
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
  reg [31:0] _RAND_721;
  reg [31:0] _RAND_722;
  reg [31:0] _RAND_723;
  reg [63:0] _RAND_724;
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
  reg [31:0] _RAND_765;
  reg [31:0] _RAND_766;
  reg [31:0] _RAND_767;
  reg [63:0] _RAND_768;
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
  reg [31:0] _RAND_818;
  reg [31:0] _RAND_819;
  reg [31:0] _RAND_820;
  reg [63:0] _RAND_821;
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
  reg [31:0] _RAND_862;
  reg [31:0] _RAND_863;
  reg [31:0] _RAND_864;
  reg [63:0] _RAND_865;
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
  reg [31:0] _RAND_915;
  reg [31:0] _RAND_916;
  reg [31:0] _RAND_917;
  reg [63:0] _RAND_918;
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
  reg [31:0] _RAND_959;
  reg [31:0] _RAND_960;
  reg [31:0] _RAND_961;
  reg [63:0] _RAND_962;
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
  reg [31:0] _RAND_1012;
  reg [31:0] _RAND_1013;
  reg [31:0] _RAND_1014;
  reg [63:0] _RAND_1015;
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
  reg [31:0] _RAND_1056;
  reg [31:0] _RAND_1057;
  reg [31:0] _RAND_1058;
  reg [63:0] _RAND_1059;
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
  reg [31:0] _RAND_1091;
  reg [31:0] _RAND_1092;
  reg [31:0] _RAND_1093;
  reg [31:0] _RAND_1094;
  reg [31:0] _RAND_1095;
  reg [31:0] _RAND_1096;
  reg [31:0] _RAND_1097;
  reg [31:0] _RAND_1098;
  reg [31:0] _RAND_1099;
  reg [31:0] _RAND_1100;
  reg [31:0] _RAND_1101;
  reg [31:0] _RAND_1102;
  reg [31:0] _RAND_1103;
  reg [31:0] _RAND_1104;
  reg [31:0] _RAND_1105;
  reg [31:0] _RAND_1106;
  reg [31:0] _RAND_1107;
  reg [31:0] _RAND_1108;
  reg [31:0] _RAND_1109;
  reg [31:0] _RAND_1110;
  reg [31:0] _RAND_1111;
  reg [63:0] _RAND_1112;
  reg [31:0] _RAND_1113;
  reg [31:0] _RAND_1114;
  reg [31:0] _RAND_1115;
  reg [31:0] _RAND_1116;
  reg [31:0] _RAND_1117;
  reg [31:0] _RAND_1118;
  reg [31:0] _RAND_1119;
  reg [31:0] _RAND_1120;
  reg [31:0] _RAND_1121;
  reg [31:0] _RAND_1122;
  reg [31:0] _RAND_1123;
  reg [31:0] _RAND_1124;
  reg [31:0] _RAND_1125;
  reg [31:0] _RAND_1126;
  reg [31:0] _RAND_1127;
  reg [31:0] _RAND_1128;
  reg [31:0] _RAND_1129;
  reg [31:0] _RAND_1130;
  reg [31:0] _RAND_1131;
  reg [31:0] _RAND_1132;
  reg [31:0] _RAND_1133;
  reg [31:0] _RAND_1134;
  reg [31:0] _RAND_1135;
  reg [31:0] _RAND_1136;
  reg [31:0] _RAND_1137;
  reg [31:0] _RAND_1138;
  reg [31:0] _RAND_1139;
  reg [31:0] _RAND_1140;
  reg [31:0] _RAND_1141;
  reg [31:0] _RAND_1142;
  reg [31:0] _RAND_1143;
  reg [31:0] _RAND_1144;
  reg [31:0] _RAND_1145;
  reg [31:0] _RAND_1146;
  reg [31:0] _RAND_1147;
  reg [31:0] _RAND_1148;
  reg [31:0] _RAND_1149;
  reg [31:0] _RAND_1150;
  reg [31:0] _RAND_1151;
  reg [31:0] _RAND_1152;
  reg [31:0] _RAND_1153;
  reg [31:0] _RAND_1154;
  reg [31:0] _RAND_1155;
  reg [63:0] _RAND_1156;
  reg [31:0] _RAND_1157;
  reg [31:0] _RAND_1158;
  reg [31:0] _RAND_1159;
  reg [31:0] _RAND_1160;
  reg [31:0] _RAND_1161;
  reg [31:0] _RAND_1162;
  reg [31:0] _RAND_1163;
  reg [31:0] _RAND_1164;
  reg [31:0] _RAND_1165;
  reg [31:0] _RAND_1166;
  reg [31:0] _RAND_1167;
  reg [31:0] _RAND_1168;
  reg [31:0] _RAND_1169;
  reg [31:0] _RAND_1170;
  reg [31:0] _RAND_1171;
  reg [31:0] _RAND_1172;
  reg [31:0] _RAND_1173;
  reg [31:0] _RAND_1174;
  reg [31:0] _RAND_1175;
  reg [31:0] _RAND_1176;
  reg [31:0] _RAND_1177;
  reg [31:0] _RAND_1178;
  reg [31:0] _RAND_1179;
  reg [31:0] _RAND_1180;
  reg [31:0] _RAND_1181;
  reg [31:0] _RAND_1182;
  reg [31:0] _RAND_1183;
  reg [31:0] _RAND_1184;
  reg [31:0] _RAND_1185;
  reg [31:0] _RAND_1186;
  reg [31:0] _RAND_1187;
  reg [31:0] _RAND_1188;
  reg [31:0] _RAND_1189;
  reg [31:0] _RAND_1190;
  reg [31:0] _RAND_1191;
  reg [31:0] _RAND_1192;
  reg [31:0] _RAND_1193;
  reg [31:0] _RAND_1194;
  reg [31:0] _RAND_1195;
  reg [31:0] _RAND_1196;
  reg [31:0] _RAND_1197;
  reg [31:0] _RAND_1198;
  reg [31:0] _RAND_1199;
  reg [31:0] _RAND_1200;
  reg [31:0] _RAND_1201;
  reg [31:0] _RAND_1202;
  reg [31:0] _RAND_1203;
  reg [31:0] _RAND_1204;
  reg [31:0] _RAND_1205;
  reg [31:0] _RAND_1206;
  reg [31:0] _RAND_1207;
  reg [31:0] _RAND_1208;
  reg [63:0] _RAND_1209;
  reg [31:0] _RAND_1210;
  reg [31:0] _RAND_1211;
  reg [31:0] _RAND_1212;
  reg [31:0] _RAND_1213;
  reg [31:0] _RAND_1214;
  reg [31:0] _RAND_1215;
  reg [31:0] _RAND_1216;
  reg [31:0] _RAND_1217;
  reg [31:0] _RAND_1218;
  reg [31:0] _RAND_1219;
  reg [31:0] _RAND_1220;
  reg [31:0] _RAND_1221;
  reg [31:0] _RAND_1222;
  reg [31:0] _RAND_1223;
  reg [31:0] _RAND_1224;
  reg [31:0] _RAND_1225;
  reg [31:0] _RAND_1226;
  reg [31:0] _RAND_1227;
  reg [31:0] _RAND_1228;
  reg [31:0] _RAND_1229;
  reg [31:0] _RAND_1230;
  reg [31:0] _RAND_1231;
  reg [31:0] _RAND_1232;
  reg [31:0] _RAND_1233;
  reg [31:0] _RAND_1234;
  reg [31:0] _RAND_1235;
  reg [31:0] _RAND_1236;
  reg [31:0] _RAND_1237;
  reg [31:0] _RAND_1238;
  reg [31:0] _RAND_1239;
  reg [31:0] _RAND_1240;
  reg [31:0] _RAND_1241;
  reg [31:0] _RAND_1242;
  reg [31:0] _RAND_1243;
  reg [31:0] _RAND_1244;
  reg [31:0] _RAND_1245;
  reg [31:0] _RAND_1246;
  reg [31:0] _RAND_1247;
  reg [31:0] _RAND_1248;
  reg [31:0] _RAND_1249;
  reg [31:0] _RAND_1250;
  reg [31:0] _RAND_1251;
  reg [31:0] _RAND_1252;
  reg [63:0] _RAND_1253;
  reg [31:0] _RAND_1254;
  reg [31:0] _RAND_1255;
  reg [31:0] _RAND_1256;
  reg [31:0] _RAND_1257;
  reg [31:0] _RAND_1258;
  reg [31:0] _RAND_1259;
  reg [31:0] _RAND_1260;
  reg [31:0] _RAND_1261;
  reg [31:0] _RAND_1262;
  reg [31:0] _RAND_1263;
  reg [31:0] _RAND_1264;
  reg [31:0] _RAND_1265;
  reg [31:0] _RAND_1266;
  reg [31:0] _RAND_1267;
  reg [31:0] _RAND_1268;
  reg [31:0] _RAND_1269;
  reg [31:0] _RAND_1270;
  reg [31:0] _RAND_1271;
  reg [31:0] _RAND_1272;
  reg [31:0] _RAND_1273;
  reg [31:0] _RAND_1274;
  reg [31:0] _RAND_1275;
  reg [31:0] _RAND_1276;
  reg [31:0] _RAND_1277;
  reg [31:0] _RAND_1278;
  reg [31:0] _RAND_1279;
  reg [31:0] _RAND_1280;
  reg [31:0] _RAND_1281;
  reg [31:0] _RAND_1282;
  reg [31:0] _RAND_1283;
  reg [31:0] _RAND_1284;
  reg [31:0] _RAND_1285;
  reg [31:0] _RAND_1286;
  reg [31:0] _RAND_1287;
  reg [31:0] _RAND_1288;
  reg [31:0] _RAND_1289;
  reg [31:0] _RAND_1290;
  reg [31:0] _RAND_1291;
  reg [31:0] _RAND_1292;
  reg [31:0] _RAND_1293;
  reg [31:0] _RAND_1294;
  reg [31:0] _RAND_1295;
  reg [31:0] _RAND_1296;
  reg [31:0] _RAND_1297;
  reg [31:0] _RAND_1298;
  reg [31:0] _RAND_1299;
  reg [31:0] _RAND_1300;
  reg [31:0] _RAND_1301;
  reg [31:0] _RAND_1302;
  reg [31:0] _RAND_1303;
  reg [31:0] _RAND_1304;
  reg [31:0] _RAND_1305;
  reg [63:0] _RAND_1306;
  reg [31:0] _RAND_1307;
  reg [31:0] _RAND_1308;
  reg [31:0] _RAND_1309;
  reg [31:0] _RAND_1310;
  reg [31:0] _RAND_1311;
  reg [31:0] _RAND_1312;
  reg [31:0] _RAND_1313;
  reg [31:0] _RAND_1314;
  reg [31:0] _RAND_1315;
  reg [31:0] _RAND_1316;
  reg [31:0] _RAND_1317;
  reg [31:0] _RAND_1318;
  reg [31:0] _RAND_1319;
  reg [31:0] _RAND_1320;
  reg [31:0] _RAND_1321;
  reg [31:0] _RAND_1322;
  reg [31:0] _RAND_1323;
  reg [31:0] _RAND_1324;
  reg [31:0] _RAND_1325;
  reg [31:0] _RAND_1326;
  reg [31:0] _RAND_1327;
  reg [31:0] _RAND_1328;
  reg [31:0] _RAND_1329;
  reg [31:0] _RAND_1330;
  reg [31:0] _RAND_1331;
  reg [31:0] _RAND_1332;
  reg [31:0] _RAND_1333;
  reg [31:0] _RAND_1334;
  reg [31:0] _RAND_1335;
  reg [31:0] _RAND_1336;
  reg [31:0] _RAND_1337;
  reg [31:0] _RAND_1338;
  reg [31:0] _RAND_1339;
  reg [31:0] _RAND_1340;
  reg [31:0] _RAND_1341;
  reg [31:0] _RAND_1342;
  reg [31:0] _RAND_1343;
  reg [31:0] _RAND_1344;
  reg [31:0] _RAND_1345;
  reg [31:0] _RAND_1346;
  reg [31:0] _RAND_1347;
  reg [31:0] _RAND_1348;
  reg [31:0] _RAND_1349;
  reg [63:0] _RAND_1350;
  reg [31:0] _RAND_1351;
  reg [31:0] _RAND_1352;
  reg [31:0] _RAND_1353;
  reg [31:0] _RAND_1354;
  reg [31:0] _RAND_1355;
  reg [31:0] _RAND_1356;
  reg [31:0] _RAND_1357;
  reg [31:0] _RAND_1358;
  reg [31:0] _RAND_1359;
  reg [31:0] _RAND_1360;
  reg [31:0] _RAND_1361;
  reg [31:0] _RAND_1362;
  reg [31:0] _RAND_1363;
  reg [31:0] _RAND_1364;
  reg [31:0] _RAND_1365;
  reg [31:0] _RAND_1366;
  reg [31:0] _RAND_1367;
  reg [31:0] _RAND_1368;
  reg [31:0] _RAND_1369;
  reg [31:0] _RAND_1370;
  reg [31:0] _RAND_1371;
  reg [31:0] _RAND_1372;
  reg [31:0] _RAND_1373;
  reg [31:0] _RAND_1374;
  reg [31:0] _RAND_1375;
  reg [31:0] _RAND_1376;
  reg [31:0] _RAND_1377;
  reg [31:0] _RAND_1378;
  reg [31:0] _RAND_1379;
  reg [31:0] _RAND_1380;
  reg [31:0] _RAND_1381;
  reg [31:0] _RAND_1382;
  reg [31:0] _RAND_1383;
  reg [31:0] _RAND_1384;
  reg [31:0] _RAND_1385;
  reg [31:0] _RAND_1386;
  reg [31:0] _RAND_1387;
  reg [31:0] _RAND_1388;
  reg [31:0] _RAND_1389;
  reg [31:0] _RAND_1390;
  reg [31:0] _RAND_1391;
  reg [31:0] _RAND_1392;
  reg [31:0] _RAND_1393;
  reg [31:0] _RAND_1394;
  reg [31:0] _RAND_1395;
  reg [31:0] _RAND_1396;
  reg [31:0] _RAND_1397;
  reg [31:0] _RAND_1398;
  reg [31:0] _RAND_1399;
  reg [31:0] _RAND_1400;
  reg [31:0] _RAND_1401;
  reg [31:0] _RAND_1402;
  reg [63:0] _RAND_1403;
  reg [31:0] _RAND_1404;
  reg [31:0] _RAND_1405;
  reg [31:0] _RAND_1406;
  reg [31:0] _RAND_1407;
  reg [31:0] _RAND_1408;
  reg [31:0] _RAND_1409;
  reg [31:0] _RAND_1410;
  reg [31:0] _RAND_1411;
  reg [31:0] _RAND_1412;
  reg [31:0] _RAND_1413;
  reg [31:0] _RAND_1414;
  reg [31:0] _RAND_1415;
  reg [31:0] _RAND_1416;
  reg [31:0] _RAND_1417;
  reg [31:0] _RAND_1418;
  reg [31:0] _RAND_1419;
  reg [31:0] _RAND_1420;
  reg [31:0] _RAND_1421;
  reg [31:0] _RAND_1422;
  reg [31:0] _RAND_1423;
  reg [31:0] _RAND_1424;
  reg [31:0] _RAND_1425;
  reg [31:0] _RAND_1426;
  reg [31:0] _RAND_1427;
  reg [31:0] _RAND_1428;
  reg [31:0] _RAND_1429;
  reg [31:0] _RAND_1430;
  reg [31:0] _RAND_1431;
  reg [31:0] _RAND_1432;
  reg [31:0] _RAND_1433;
  reg [31:0] _RAND_1434;
  reg [31:0] _RAND_1435;
  reg [31:0] _RAND_1436;
  reg [31:0] _RAND_1437;
  reg [31:0] _RAND_1438;
  reg [31:0] _RAND_1439;
  reg [31:0] _RAND_1440;
  reg [31:0] _RAND_1441;
  reg [31:0] _RAND_1442;
  reg [31:0] _RAND_1443;
  reg [31:0] _RAND_1444;
  reg [31:0] _RAND_1445;
  reg [31:0] _RAND_1446;
  reg [63:0] _RAND_1447;
  reg [31:0] _RAND_1448;
  reg [31:0] _RAND_1449;
  reg [31:0] _RAND_1450;
  reg [31:0] _RAND_1451;
  reg [31:0] _RAND_1452;
  reg [31:0] _RAND_1453;
  reg [31:0] _RAND_1454;
  reg [31:0] _RAND_1455;
  reg [31:0] _RAND_1456;
  reg [31:0] _RAND_1457;
  reg [31:0] _RAND_1458;
  reg [31:0] _RAND_1459;
  reg [31:0] _RAND_1460;
  reg [31:0] _RAND_1461;
  reg [31:0] _RAND_1462;
  reg [31:0] _RAND_1463;
  reg [31:0] _RAND_1464;
  reg [31:0] _RAND_1465;
  reg [31:0] _RAND_1466;
  reg [31:0] _RAND_1467;
  reg [31:0] _RAND_1468;
  reg [31:0] _RAND_1469;
  reg [31:0] _RAND_1470;
  reg [31:0] _RAND_1471;
  reg [31:0] _RAND_1472;
  reg [31:0] _RAND_1473;
  reg [31:0] _RAND_1474;
  reg [31:0] _RAND_1475;
  reg [31:0] _RAND_1476;
  reg [31:0] _RAND_1477;
  reg [31:0] _RAND_1478;
  reg [31:0] _RAND_1479;
  reg [31:0] _RAND_1480;
  reg [31:0] _RAND_1481;
  reg [31:0] _RAND_1482;
  reg [31:0] _RAND_1483;
  reg [31:0] _RAND_1484;
  reg [31:0] _RAND_1485;
  reg [31:0] _RAND_1486;
  reg [31:0] _RAND_1487;
  reg [31:0] _RAND_1488;
  reg [31:0] _RAND_1489;
  reg [31:0] _RAND_1490;
  reg [31:0] _RAND_1491;
  reg [31:0] _RAND_1492;
  reg [31:0] _RAND_1493;
  reg [31:0] _RAND_1494;
  reg [31:0] _RAND_1495;
  reg [31:0] _RAND_1496;
  reg [31:0] _RAND_1497;
  reg [31:0] _RAND_1498;
  reg [31:0] _RAND_1499;
  reg [63:0] _RAND_1500;
  reg [31:0] _RAND_1501;
  reg [31:0] _RAND_1502;
  reg [31:0] _RAND_1503;
  reg [31:0] _RAND_1504;
  reg [31:0] _RAND_1505;
  reg [31:0] _RAND_1506;
  reg [31:0] _RAND_1507;
  reg [31:0] _RAND_1508;
  reg [31:0] _RAND_1509;
  reg [31:0] _RAND_1510;
  reg [31:0] _RAND_1511;
  reg [31:0] _RAND_1512;
  reg [31:0] _RAND_1513;
  reg [31:0] _RAND_1514;
  reg [31:0] _RAND_1515;
  reg [31:0] _RAND_1516;
  reg [31:0] _RAND_1517;
  reg [31:0] _RAND_1518;
  reg [31:0] _RAND_1519;
  reg [31:0] _RAND_1520;
  reg [31:0] _RAND_1521;
  reg [31:0] _RAND_1522;
  reg [31:0] _RAND_1523;
  reg [31:0] _RAND_1524;
  reg [31:0] _RAND_1525;
  reg [31:0] _RAND_1526;
  reg [31:0] _RAND_1527;
  reg [31:0] _RAND_1528;
  reg [31:0] _RAND_1529;
  reg [31:0] _RAND_1530;
  reg [31:0] _RAND_1531;
  reg [31:0] _RAND_1532;
  reg [31:0] _RAND_1533;
  reg [31:0] _RAND_1534;
  reg [31:0] _RAND_1535;
  reg [31:0] _RAND_1536;
  reg [31:0] _RAND_1537;
  reg [31:0] _RAND_1538;
  reg [31:0] _RAND_1539;
  reg [31:0] _RAND_1540;
  reg [31:0] _RAND_1541;
  reg [31:0] _RAND_1542;
  reg [31:0] _RAND_1543;
  reg [63:0] _RAND_1544;
  reg [31:0] _RAND_1545;
  reg [31:0] _RAND_1546;
  reg [31:0] _RAND_1547;
  reg [31:0] _RAND_1548;
  reg [31:0] _RAND_1549;
  reg [31:0] _RAND_1550;
  reg [31:0] _RAND_1551;
  reg [31:0] _RAND_1552;
  reg [31:0] _RAND_1553;
  reg [31:0] _RAND_1554;
  reg [31:0] _RAND_1555;
  reg [31:0] _RAND_1556;
  reg [31:0] _RAND_1557;
  reg [31:0] _RAND_1558;
  reg [31:0] _RAND_1559;
  reg [31:0] _RAND_1560;
  reg [31:0] _RAND_1561;
  reg [31:0] _RAND_1562;
  reg [31:0] _RAND_1563;
  reg [31:0] _RAND_1564;
  reg [31:0] _RAND_1565;
  reg [31:0] _RAND_1566;
  reg [31:0] _RAND_1567;
  reg [31:0] _RAND_1568;
  reg [31:0] _RAND_1569;
  reg [31:0] _RAND_1570;
  reg [31:0] _RAND_1571;
  reg [31:0] _RAND_1572;
  reg [31:0] _RAND_1573;
  reg [31:0] _RAND_1574;
  reg [31:0] _RAND_1575;
  reg [31:0] _RAND_1576;
  reg [31:0] _RAND_1577;
  reg [31:0] _RAND_1578;
`endif // RANDOMIZE_REG_INIT
  reg [39:0] ram_addr [0:15]; // @[util.scala 535:20]
  wire [39:0] ram_addr_MPORT_1_data; // @[util.scala 535:20]
  wire [3:0] ram_addr_MPORT_1_addr; // @[util.scala 535:20]
  wire [39:0] ram_addr_MPORT_data; // @[util.scala 535:20]
  wire [3:0] ram_addr_MPORT_addr; // @[util.scala 535:20]
  wire  ram_addr_MPORT_mask; // @[util.scala 535:20]
  wire  ram_addr_MPORT_en; // @[util.scala 535:20]
  reg [63:0] ram_data [0:15]; // @[util.scala 535:20]
  wire [63:0] ram_data_MPORT_1_data; // @[util.scala 535:20]
  wire [3:0] ram_data_MPORT_1_addr; // @[util.scala 535:20]
  wire [63:0] ram_data_MPORT_data; // @[util.scala 535:20]
  wire [3:0] ram_data_MPORT_addr; // @[util.scala 535:20]
  wire  ram_data_MPORT_mask; // @[util.scala 535:20]
  wire  ram_data_MPORT_en; // @[util.scala 535:20]
  reg  ram_is_hella [0:15]; // @[util.scala 535:20]
  wire  ram_is_hella_MPORT_1_data; // @[util.scala 535:20]
  wire [3:0] ram_is_hella_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_is_hella_MPORT_data; // @[util.scala 535:20]
  wire [3:0] ram_is_hella_MPORT_addr; // @[util.scala 535:20]
  wire  ram_is_hella_MPORT_mask; // @[util.scala 535:20]
  wire  ram_is_hella_MPORT_en; // @[util.scala 535:20]
  reg  ram_tag_match [0:15]; // @[util.scala 535:20]
  wire  ram_tag_match_MPORT_1_data; // @[util.scala 535:20]
  wire [3:0] ram_tag_match_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_tag_match_MPORT_data; // @[util.scala 535:20]
  wire [3:0] ram_tag_match_MPORT_addr; // @[util.scala 535:20]
  wire  ram_tag_match_MPORT_mask; // @[util.scala 535:20]
  wire  ram_tag_match_MPORT_en; // @[util.scala 535:20]
  reg [1:0] ram_old_meta_coh_state [0:15]; // @[util.scala 535:20]
  wire [1:0] ram_old_meta_coh_state_MPORT_1_data; // @[util.scala 535:20]
  wire [3:0] ram_old_meta_coh_state_MPORT_1_addr; // @[util.scala 535:20]
  wire [1:0] ram_old_meta_coh_state_MPORT_data; // @[util.scala 535:20]
  wire [3:0] ram_old_meta_coh_state_MPORT_addr; // @[util.scala 535:20]
  wire  ram_old_meta_coh_state_MPORT_mask; // @[util.scala 535:20]
  wire  ram_old_meta_coh_state_MPORT_en; // @[util.scala 535:20]
  reg [19:0] ram_old_meta_tag [0:15]; // @[util.scala 535:20]
  wire [19:0] ram_old_meta_tag_MPORT_1_data; // @[util.scala 535:20]
  wire [3:0] ram_old_meta_tag_MPORT_1_addr; // @[util.scala 535:20]
  wire [19:0] ram_old_meta_tag_MPORT_data; // @[util.scala 535:20]
  wire [3:0] ram_old_meta_tag_MPORT_addr; // @[util.scala 535:20]
  wire  ram_old_meta_tag_MPORT_mask; // @[util.scala 535:20]
  wire  ram_old_meta_tag_MPORT_en; // @[util.scala 535:20]
  reg  ram_way_en [0:15]; // @[util.scala 535:20]
  wire  ram_way_en_MPORT_1_data; // @[util.scala 535:20]
  wire [3:0] ram_way_en_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_way_en_MPORT_data; // @[util.scala 535:20]
  wire [3:0] ram_way_en_MPORT_addr; // @[util.scala 535:20]
  wire  ram_way_en_MPORT_mask; // @[util.scala 535:20]
  wire  ram_way_en_MPORT_en; // @[util.scala 535:20]
  reg [4:0] ram_sdq_id [0:15]; // @[util.scala 535:20]
  wire [4:0] ram_sdq_id_MPORT_1_data; // @[util.scala 535:20]
  wire [3:0] ram_sdq_id_MPORT_1_addr; // @[util.scala 535:20]
  wire [4:0] ram_sdq_id_MPORT_data; // @[util.scala 535:20]
  wire [3:0] ram_sdq_id_MPORT_addr; // @[util.scala 535:20]
  wire  ram_sdq_id_MPORT_mask; // @[util.scala 535:20]
  wire  ram_sdq_id_MPORT_en; // @[util.scala 535:20]
  reg  valids_0; // @[util.scala 536:24]
  reg  valids_1; // @[util.scala 536:24]
  reg  valids_2; // @[util.scala 536:24]
  reg  valids_3; // @[util.scala 536:24]
  reg  valids_4; // @[util.scala 536:24]
  reg  valids_5; // @[util.scala 536:24]
  reg  valids_6; // @[util.scala 536:24]
  reg  valids_7; // @[util.scala 536:24]
  reg  valids_8; // @[util.scala 536:24]
  reg  valids_9; // @[util.scala 536:24]
  reg  valids_10; // @[util.scala 536:24]
  reg  valids_11; // @[util.scala 536:24]
  reg  valids_12; // @[util.scala 536:24]
  reg  valids_13; // @[util.scala 536:24]
  reg  valids_14; // @[util.scala 536:24]
  reg  valids_15; // @[util.scala 536:24]
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
  reg  uops_7_switch; // @[util.scala 537:20]
  reg  uops_7_switch_off; // @[util.scala 537:20]
  reg  uops_7_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_7_shift; // @[util.scala 537:20]
  reg [1:0] uops_7_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_7_rflag; // @[util.scala 537:20]
  reg  uops_7_wflag; // @[util.scala 537:20]
  reg [3:0] uops_7_prflag; // @[util.scala 537:20]
  reg [3:0] uops_7_pwflag; // @[util.scala 537:20]
  reg  uops_7_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_7_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_7_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_7_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_7_split_num; // @[util.scala 537:20]
  reg [5:0] uops_7_self_index; // @[util.scala 537:20]
  reg [5:0] uops_7_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_7_address_num; // @[util.scala 537:20]
  reg [6:0] uops_7_uopc; // @[util.scala 537:20]
  reg [31:0] uops_7_inst; // @[util.scala 537:20]
  reg [31:0] uops_7_debug_inst; // @[util.scala 537:20]
  reg  uops_7_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_7_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_7_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_7_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_7_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_7_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_7_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_7_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_7_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_7_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_7_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_7_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_7_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_7_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_7_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_7_iw_state; // @[util.scala 537:20]
  reg  uops_7_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_7_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_7_is_br; // @[util.scala 537:20]
  reg  uops_7_is_jalr; // @[util.scala 537:20]
  reg  uops_7_is_jal; // @[util.scala 537:20]
  reg  uops_7_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_7_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_7_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_7_ftq_idx; // @[util.scala 537:20]
  reg  uops_7_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_7_pc_lob; // @[util.scala 537:20]
  reg  uops_7_taken; // @[util.scala 537:20]
  reg [19:0] uops_7_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_7_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_7_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_7_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_7_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_7_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_7_pdst; // @[util.scala 537:20]
  reg [6:0] uops_7_prs1; // @[util.scala 537:20]
  reg [6:0] uops_7_prs2; // @[util.scala 537:20]
  reg [6:0] uops_7_prs3; // @[util.scala 537:20]
  reg [4:0] uops_7_ppred; // @[util.scala 537:20]
  reg  uops_7_prs1_busy; // @[util.scala 537:20]
  reg  uops_7_prs2_busy; // @[util.scala 537:20]
  reg  uops_7_prs3_busy; // @[util.scala 537:20]
  reg  uops_7_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_7_stale_pdst; // @[util.scala 537:20]
  reg  uops_7_exception; // @[util.scala 537:20]
  reg [63:0] uops_7_exc_cause; // @[util.scala 537:20]
  reg  uops_7_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_7_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_7_mem_size; // @[util.scala 537:20]
  reg  uops_7_mem_signed; // @[util.scala 537:20]
  reg  uops_7_is_fence; // @[util.scala 537:20]
  reg  uops_7_is_fencei; // @[util.scala 537:20]
  reg  uops_7_is_amo; // @[util.scala 537:20]
  reg  uops_7_uses_ldq; // @[util.scala 537:20]
  reg  uops_7_uses_stq; // @[util.scala 537:20]
  reg  uops_7_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_7_is_unique; // @[util.scala 537:20]
  reg  uops_7_flush_on_commit; // @[util.scala 537:20]
  reg  uops_7_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_7_ldst; // @[util.scala 537:20]
  reg [5:0] uops_7_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_7_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_7_lrs3; // @[util.scala 537:20]
  reg  uops_7_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_7_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_7_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_7_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_7_frs3_en; // @[util.scala 537:20]
  reg  uops_7_fp_val; // @[util.scala 537:20]
  reg  uops_7_fp_single; // @[util.scala 537:20]
  reg  uops_7_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_7_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_7_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_7_bp_debug_if; // @[util.scala 537:20]
  reg  uops_7_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_7_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_7_debug_tsrc; // @[util.scala 537:20]
  reg  uops_8_switch; // @[util.scala 537:20]
  reg  uops_8_switch_off; // @[util.scala 537:20]
  reg  uops_8_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_8_shift; // @[util.scala 537:20]
  reg [1:0] uops_8_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_8_rflag; // @[util.scala 537:20]
  reg  uops_8_wflag; // @[util.scala 537:20]
  reg [3:0] uops_8_prflag; // @[util.scala 537:20]
  reg [3:0] uops_8_pwflag; // @[util.scala 537:20]
  reg  uops_8_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_8_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_8_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_8_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_8_split_num; // @[util.scala 537:20]
  reg [5:0] uops_8_self_index; // @[util.scala 537:20]
  reg [5:0] uops_8_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_8_address_num; // @[util.scala 537:20]
  reg [6:0] uops_8_uopc; // @[util.scala 537:20]
  reg [31:0] uops_8_inst; // @[util.scala 537:20]
  reg [31:0] uops_8_debug_inst; // @[util.scala 537:20]
  reg  uops_8_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_8_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_8_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_8_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_8_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_8_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_8_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_8_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_8_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_8_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_8_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_8_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_8_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_8_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_8_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_8_iw_state; // @[util.scala 537:20]
  reg  uops_8_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_8_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_8_is_br; // @[util.scala 537:20]
  reg  uops_8_is_jalr; // @[util.scala 537:20]
  reg  uops_8_is_jal; // @[util.scala 537:20]
  reg  uops_8_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_8_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_8_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_8_ftq_idx; // @[util.scala 537:20]
  reg  uops_8_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_8_pc_lob; // @[util.scala 537:20]
  reg  uops_8_taken; // @[util.scala 537:20]
  reg [19:0] uops_8_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_8_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_8_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_8_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_8_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_8_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_8_pdst; // @[util.scala 537:20]
  reg [6:0] uops_8_prs1; // @[util.scala 537:20]
  reg [6:0] uops_8_prs2; // @[util.scala 537:20]
  reg [6:0] uops_8_prs3; // @[util.scala 537:20]
  reg [4:0] uops_8_ppred; // @[util.scala 537:20]
  reg  uops_8_prs1_busy; // @[util.scala 537:20]
  reg  uops_8_prs2_busy; // @[util.scala 537:20]
  reg  uops_8_prs3_busy; // @[util.scala 537:20]
  reg  uops_8_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_8_stale_pdst; // @[util.scala 537:20]
  reg  uops_8_exception; // @[util.scala 537:20]
  reg [63:0] uops_8_exc_cause; // @[util.scala 537:20]
  reg  uops_8_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_8_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_8_mem_size; // @[util.scala 537:20]
  reg  uops_8_mem_signed; // @[util.scala 537:20]
  reg  uops_8_is_fence; // @[util.scala 537:20]
  reg  uops_8_is_fencei; // @[util.scala 537:20]
  reg  uops_8_is_amo; // @[util.scala 537:20]
  reg  uops_8_uses_ldq; // @[util.scala 537:20]
  reg  uops_8_uses_stq; // @[util.scala 537:20]
  reg  uops_8_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_8_is_unique; // @[util.scala 537:20]
  reg  uops_8_flush_on_commit; // @[util.scala 537:20]
  reg  uops_8_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_8_ldst; // @[util.scala 537:20]
  reg [5:0] uops_8_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_8_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_8_lrs3; // @[util.scala 537:20]
  reg  uops_8_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_8_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_8_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_8_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_8_frs3_en; // @[util.scala 537:20]
  reg  uops_8_fp_val; // @[util.scala 537:20]
  reg  uops_8_fp_single; // @[util.scala 537:20]
  reg  uops_8_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_8_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_8_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_8_bp_debug_if; // @[util.scala 537:20]
  reg  uops_8_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_8_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_8_debug_tsrc; // @[util.scala 537:20]
  reg  uops_9_switch; // @[util.scala 537:20]
  reg  uops_9_switch_off; // @[util.scala 537:20]
  reg  uops_9_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_9_shift; // @[util.scala 537:20]
  reg [1:0] uops_9_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_9_rflag; // @[util.scala 537:20]
  reg  uops_9_wflag; // @[util.scala 537:20]
  reg [3:0] uops_9_prflag; // @[util.scala 537:20]
  reg [3:0] uops_9_pwflag; // @[util.scala 537:20]
  reg  uops_9_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_9_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_9_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_9_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_9_split_num; // @[util.scala 537:20]
  reg [5:0] uops_9_self_index; // @[util.scala 537:20]
  reg [5:0] uops_9_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_9_address_num; // @[util.scala 537:20]
  reg [6:0] uops_9_uopc; // @[util.scala 537:20]
  reg [31:0] uops_9_inst; // @[util.scala 537:20]
  reg [31:0] uops_9_debug_inst; // @[util.scala 537:20]
  reg  uops_9_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_9_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_9_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_9_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_9_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_9_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_9_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_9_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_9_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_9_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_9_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_9_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_9_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_9_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_9_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_9_iw_state; // @[util.scala 537:20]
  reg  uops_9_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_9_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_9_is_br; // @[util.scala 537:20]
  reg  uops_9_is_jalr; // @[util.scala 537:20]
  reg  uops_9_is_jal; // @[util.scala 537:20]
  reg  uops_9_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_9_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_9_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_9_ftq_idx; // @[util.scala 537:20]
  reg  uops_9_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_9_pc_lob; // @[util.scala 537:20]
  reg  uops_9_taken; // @[util.scala 537:20]
  reg [19:0] uops_9_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_9_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_9_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_9_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_9_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_9_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_9_pdst; // @[util.scala 537:20]
  reg [6:0] uops_9_prs1; // @[util.scala 537:20]
  reg [6:0] uops_9_prs2; // @[util.scala 537:20]
  reg [6:0] uops_9_prs3; // @[util.scala 537:20]
  reg [4:0] uops_9_ppred; // @[util.scala 537:20]
  reg  uops_9_prs1_busy; // @[util.scala 537:20]
  reg  uops_9_prs2_busy; // @[util.scala 537:20]
  reg  uops_9_prs3_busy; // @[util.scala 537:20]
  reg  uops_9_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_9_stale_pdst; // @[util.scala 537:20]
  reg  uops_9_exception; // @[util.scala 537:20]
  reg [63:0] uops_9_exc_cause; // @[util.scala 537:20]
  reg  uops_9_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_9_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_9_mem_size; // @[util.scala 537:20]
  reg  uops_9_mem_signed; // @[util.scala 537:20]
  reg  uops_9_is_fence; // @[util.scala 537:20]
  reg  uops_9_is_fencei; // @[util.scala 537:20]
  reg  uops_9_is_amo; // @[util.scala 537:20]
  reg  uops_9_uses_ldq; // @[util.scala 537:20]
  reg  uops_9_uses_stq; // @[util.scala 537:20]
  reg  uops_9_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_9_is_unique; // @[util.scala 537:20]
  reg  uops_9_flush_on_commit; // @[util.scala 537:20]
  reg  uops_9_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_9_ldst; // @[util.scala 537:20]
  reg [5:0] uops_9_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_9_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_9_lrs3; // @[util.scala 537:20]
  reg  uops_9_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_9_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_9_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_9_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_9_frs3_en; // @[util.scala 537:20]
  reg  uops_9_fp_val; // @[util.scala 537:20]
  reg  uops_9_fp_single; // @[util.scala 537:20]
  reg  uops_9_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_9_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_9_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_9_bp_debug_if; // @[util.scala 537:20]
  reg  uops_9_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_9_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_9_debug_tsrc; // @[util.scala 537:20]
  reg  uops_10_switch; // @[util.scala 537:20]
  reg  uops_10_switch_off; // @[util.scala 537:20]
  reg  uops_10_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_10_shift; // @[util.scala 537:20]
  reg [1:0] uops_10_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_10_rflag; // @[util.scala 537:20]
  reg  uops_10_wflag; // @[util.scala 537:20]
  reg [3:0] uops_10_prflag; // @[util.scala 537:20]
  reg [3:0] uops_10_pwflag; // @[util.scala 537:20]
  reg  uops_10_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_10_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_10_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_10_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_10_split_num; // @[util.scala 537:20]
  reg [5:0] uops_10_self_index; // @[util.scala 537:20]
  reg [5:0] uops_10_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_10_address_num; // @[util.scala 537:20]
  reg [6:0] uops_10_uopc; // @[util.scala 537:20]
  reg [31:0] uops_10_inst; // @[util.scala 537:20]
  reg [31:0] uops_10_debug_inst; // @[util.scala 537:20]
  reg  uops_10_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_10_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_10_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_10_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_10_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_10_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_10_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_10_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_10_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_10_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_10_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_10_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_10_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_10_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_10_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_10_iw_state; // @[util.scala 537:20]
  reg  uops_10_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_10_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_10_is_br; // @[util.scala 537:20]
  reg  uops_10_is_jalr; // @[util.scala 537:20]
  reg  uops_10_is_jal; // @[util.scala 537:20]
  reg  uops_10_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_10_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_10_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_10_ftq_idx; // @[util.scala 537:20]
  reg  uops_10_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_10_pc_lob; // @[util.scala 537:20]
  reg  uops_10_taken; // @[util.scala 537:20]
  reg [19:0] uops_10_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_10_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_10_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_10_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_10_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_10_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_10_pdst; // @[util.scala 537:20]
  reg [6:0] uops_10_prs1; // @[util.scala 537:20]
  reg [6:0] uops_10_prs2; // @[util.scala 537:20]
  reg [6:0] uops_10_prs3; // @[util.scala 537:20]
  reg [4:0] uops_10_ppred; // @[util.scala 537:20]
  reg  uops_10_prs1_busy; // @[util.scala 537:20]
  reg  uops_10_prs2_busy; // @[util.scala 537:20]
  reg  uops_10_prs3_busy; // @[util.scala 537:20]
  reg  uops_10_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_10_stale_pdst; // @[util.scala 537:20]
  reg  uops_10_exception; // @[util.scala 537:20]
  reg [63:0] uops_10_exc_cause; // @[util.scala 537:20]
  reg  uops_10_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_10_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_10_mem_size; // @[util.scala 537:20]
  reg  uops_10_mem_signed; // @[util.scala 537:20]
  reg  uops_10_is_fence; // @[util.scala 537:20]
  reg  uops_10_is_fencei; // @[util.scala 537:20]
  reg  uops_10_is_amo; // @[util.scala 537:20]
  reg  uops_10_uses_ldq; // @[util.scala 537:20]
  reg  uops_10_uses_stq; // @[util.scala 537:20]
  reg  uops_10_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_10_is_unique; // @[util.scala 537:20]
  reg  uops_10_flush_on_commit; // @[util.scala 537:20]
  reg  uops_10_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_10_ldst; // @[util.scala 537:20]
  reg [5:0] uops_10_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_10_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_10_lrs3; // @[util.scala 537:20]
  reg  uops_10_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_10_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_10_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_10_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_10_frs3_en; // @[util.scala 537:20]
  reg  uops_10_fp_val; // @[util.scala 537:20]
  reg  uops_10_fp_single; // @[util.scala 537:20]
  reg  uops_10_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_10_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_10_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_10_bp_debug_if; // @[util.scala 537:20]
  reg  uops_10_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_10_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_10_debug_tsrc; // @[util.scala 537:20]
  reg  uops_11_switch; // @[util.scala 537:20]
  reg  uops_11_switch_off; // @[util.scala 537:20]
  reg  uops_11_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_11_shift; // @[util.scala 537:20]
  reg [1:0] uops_11_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_11_rflag; // @[util.scala 537:20]
  reg  uops_11_wflag; // @[util.scala 537:20]
  reg [3:0] uops_11_prflag; // @[util.scala 537:20]
  reg [3:0] uops_11_pwflag; // @[util.scala 537:20]
  reg  uops_11_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_11_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_11_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_11_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_11_split_num; // @[util.scala 537:20]
  reg [5:0] uops_11_self_index; // @[util.scala 537:20]
  reg [5:0] uops_11_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_11_address_num; // @[util.scala 537:20]
  reg [6:0] uops_11_uopc; // @[util.scala 537:20]
  reg [31:0] uops_11_inst; // @[util.scala 537:20]
  reg [31:0] uops_11_debug_inst; // @[util.scala 537:20]
  reg  uops_11_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_11_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_11_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_11_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_11_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_11_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_11_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_11_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_11_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_11_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_11_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_11_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_11_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_11_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_11_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_11_iw_state; // @[util.scala 537:20]
  reg  uops_11_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_11_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_11_is_br; // @[util.scala 537:20]
  reg  uops_11_is_jalr; // @[util.scala 537:20]
  reg  uops_11_is_jal; // @[util.scala 537:20]
  reg  uops_11_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_11_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_11_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_11_ftq_idx; // @[util.scala 537:20]
  reg  uops_11_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_11_pc_lob; // @[util.scala 537:20]
  reg  uops_11_taken; // @[util.scala 537:20]
  reg [19:0] uops_11_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_11_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_11_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_11_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_11_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_11_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_11_pdst; // @[util.scala 537:20]
  reg [6:0] uops_11_prs1; // @[util.scala 537:20]
  reg [6:0] uops_11_prs2; // @[util.scala 537:20]
  reg [6:0] uops_11_prs3; // @[util.scala 537:20]
  reg [4:0] uops_11_ppred; // @[util.scala 537:20]
  reg  uops_11_prs1_busy; // @[util.scala 537:20]
  reg  uops_11_prs2_busy; // @[util.scala 537:20]
  reg  uops_11_prs3_busy; // @[util.scala 537:20]
  reg  uops_11_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_11_stale_pdst; // @[util.scala 537:20]
  reg  uops_11_exception; // @[util.scala 537:20]
  reg [63:0] uops_11_exc_cause; // @[util.scala 537:20]
  reg  uops_11_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_11_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_11_mem_size; // @[util.scala 537:20]
  reg  uops_11_mem_signed; // @[util.scala 537:20]
  reg  uops_11_is_fence; // @[util.scala 537:20]
  reg  uops_11_is_fencei; // @[util.scala 537:20]
  reg  uops_11_is_amo; // @[util.scala 537:20]
  reg  uops_11_uses_ldq; // @[util.scala 537:20]
  reg  uops_11_uses_stq; // @[util.scala 537:20]
  reg  uops_11_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_11_is_unique; // @[util.scala 537:20]
  reg  uops_11_flush_on_commit; // @[util.scala 537:20]
  reg  uops_11_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_11_ldst; // @[util.scala 537:20]
  reg [5:0] uops_11_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_11_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_11_lrs3; // @[util.scala 537:20]
  reg  uops_11_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_11_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_11_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_11_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_11_frs3_en; // @[util.scala 537:20]
  reg  uops_11_fp_val; // @[util.scala 537:20]
  reg  uops_11_fp_single; // @[util.scala 537:20]
  reg  uops_11_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_11_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_11_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_11_bp_debug_if; // @[util.scala 537:20]
  reg  uops_11_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_11_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_11_debug_tsrc; // @[util.scala 537:20]
  reg  uops_12_switch; // @[util.scala 537:20]
  reg  uops_12_switch_off; // @[util.scala 537:20]
  reg  uops_12_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_12_shift; // @[util.scala 537:20]
  reg [1:0] uops_12_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_12_rflag; // @[util.scala 537:20]
  reg  uops_12_wflag; // @[util.scala 537:20]
  reg [3:0] uops_12_prflag; // @[util.scala 537:20]
  reg [3:0] uops_12_pwflag; // @[util.scala 537:20]
  reg  uops_12_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_12_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_12_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_12_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_12_split_num; // @[util.scala 537:20]
  reg [5:0] uops_12_self_index; // @[util.scala 537:20]
  reg [5:0] uops_12_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_12_address_num; // @[util.scala 537:20]
  reg [6:0] uops_12_uopc; // @[util.scala 537:20]
  reg [31:0] uops_12_inst; // @[util.scala 537:20]
  reg [31:0] uops_12_debug_inst; // @[util.scala 537:20]
  reg  uops_12_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_12_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_12_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_12_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_12_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_12_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_12_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_12_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_12_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_12_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_12_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_12_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_12_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_12_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_12_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_12_iw_state; // @[util.scala 537:20]
  reg  uops_12_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_12_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_12_is_br; // @[util.scala 537:20]
  reg  uops_12_is_jalr; // @[util.scala 537:20]
  reg  uops_12_is_jal; // @[util.scala 537:20]
  reg  uops_12_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_12_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_12_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_12_ftq_idx; // @[util.scala 537:20]
  reg  uops_12_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_12_pc_lob; // @[util.scala 537:20]
  reg  uops_12_taken; // @[util.scala 537:20]
  reg [19:0] uops_12_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_12_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_12_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_12_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_12_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_12_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_12_pdst; // @[util.scala 537:20]
  reg [6:0] uops_12_prs1; // @[util.scala 537:20]
  reg [6:0] uops_12_prs2; // @[util.scala 537:20]
  reg [6:0] uops_12_prs3; // @[util.scala 537:20]
  reg [4:0] uops_12_ppred; // @[util.scala 537:20]
  reg  uops_12_prs1_busy; // @[util.scala 537:20]
  reg  uops_12_prs2_busy; // @[util.scala 537:20]
  reg  uops_12_prs3_busy; // @[util.scala 537:20]
  reg  uops_12_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_12_stale_pdst; // @[util.scala 537:20]
  reg  uops_12_exception; // @[util.scala 537:20]
  reg [63:0] uops_12_exc_cause; // @[util.scala 537:20]
  reg  uops_12_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_12_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_12_mem_size; // @[util.scala 537:20]
  reg  uops_12_mem_signed; // @[util.scala 537:20]
  reg  uops_12_is_fence; // @[util.scala 537:20]
  reg  uops_12_is_fencei; // @[util.scala 537:20]
  reg  uops_12_is_amo; // @[util.scala 537:20]
  reg  uops_12_uses_ldq; // @[util.scala 537:20]
  reg  uops_12_uses_stq; // @[util.scala 537:20]
  reg  uops_12_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_12_is_unique; // @[util.scala 537:20]
  reg  uops_12_flush_on_commit; // @[util.scala 537:20]
  reg  uops_12_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_12_ldst; // @[util.scala 537:20]
  reg [5:0] uops_12_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_12_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_12_lrs3; // @[util.scala 537:20]
  reg  uops_12_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_12_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_12_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_12_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_12_frs3_en; // @[util.scala 537:20]
  reg  uops_12_fp_val; // @[util.scala 537:20]
  reg  uops_12_fp_single; // @[util.scala 537:20]
  reg  uops_12_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_12_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_12_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_12_bp_debug_if; // @[util.scala 537:20]
  reg  uops_12_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_12_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_12_debug_tsrc; // @[util.scala 537:20]
  reg  uops_13_switch; // @[util.scala 537:20]
  reg  uops_13_switch_off; // @[util.scala 537:20]
  reg  uops_13_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_13_shift; // @[util.scala 537:20]
  reg [1:0] uops_13_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_13_rflag; // @[util.scala 537:20]
  reg  uops_13_wflag; // @[util.scala 537:20]
  reg [3:0] uops_13_prflag; // @[util.scala 537:20]
  reg [3:0] uops_13_pwflag; // @[util.scala 537:20]
  reg  uops_13_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_13_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_13_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_13_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_13_split_num; // @[util.scala 537:20]
  reg [5:0] uops_13_self_index; // @[util.scala 537:20]
  reg [5:0] uops_13_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_13_address_num; // @[util.scala 537:20]
  reg [6:0] uops_13_uopc; // @[util.scala 537:20]
  reg [31:0] uops_13_inst; // @[util.scala 537:20]
  reg [31:0] uops_13_debug_inst; // @[util.scala 537:20]
  reg  uops_13_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_13_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_13_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_13_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_13_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_13_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_13_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_13_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_13_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_13_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_13_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_13_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_13_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_13_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_13_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_13_iw_state; // @[util.scala 537:20]
  reg  uops_13_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_13_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_13_is_br; // @[util.scala 537:20]
  reg  uops_13_is_jalr; // @[util.scala 537:20]
  reg  uops_13_is_jal; // @[util.scala 537:20]
  reg  uops_13_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_13_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_13_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_13_ftq_idx; // @[util.scala 537:20]
  reg  uops_13_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_13_pc_lob; // @[util.scala 537:20]
  reg  uops_13_taken; // @[util.scala 537:20]
  reg [19:0] uops_13_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_13_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_13_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_13_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_13_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_13_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_13_pdst; // @[util.scala 537:20]
  reg [6:0] uops_13_prs1; // @[util.scala 537:20]
  reg [6:0] uops_13_prs2; // @[util.scala 537:20]
  reg [6:0] uops_13_prs3; // @[util.scala 537:20]
  reg [4:0] uops_13_ppred; // @[util.scala 537:20]
  reg  uops_13_prs1_busy; // @[util.scala 537:20]
  reg  uops_13_prs2_busy; // @[util.scala 537:20]
  reg  uops_13_prs3_busy; // @[util.scala 537:20]
  reg  uops_13_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_13_stale_pdst; // @[util.scala 537:20]
  reg  uops_13_exception; // @[util.scala 537:20]
  reg [63:0] uops_13_exc_cause; // @[util.scala 537:20]
  reg  uops_13_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_13_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_13_mem_size; // @[util.scala 537:20]
  reg  uops_13_mem_signed; // @[util.scala 537:20]
  reg  uops_13_is_fence; // @[util.scala 537:20]
  reg  uops_13_is_fencei; // @[util.scala 537:20]
  reg  uops_13_is_amo; // @[util.scala 537:20]
  reg  uops_13_uses_ldq; // @[util.scala 537:20]
  reg  uops_13_uses_stq; // @[util.scala 537:20]
  reg  uops_13_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_13_is_unique; // @[util.scala 537:20]
  reg  uops_13_flush_on_commit; // @[util.scala 537:20]
  reg  uops_13_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_13_ldst; // @[util.scala 537:20]
  reg [5:0] uops_13_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_13_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_13_lrs3; // @[util.scala 537:20]
  reg  uops_13_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_13_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_13_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_13_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_13_frs3_en; // @[util.scala 537:20]
  reg  uops_13_fp_val; // @[util.scala 537:20]
  reg  uops_13_fp_single; // @[util.scala 537:20]
  reg  uops_13_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_13_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_13_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_13_bp_debug_if; // @[util.scala 537:20]
  reg  uops_13_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_13_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_13_debug_tsrc; // @[util.scala 537:20]
  reg  uops_14_switch; // @[util.scala 537:20]
  reg  uops_14_switch_off; // @[util.scala 537:20]
  reg  uops_14_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_14_shift; // @[util.scala 537:20]
  reg [1:0] uops_14_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_14_rflag; // @[util.scala 537:20]
  reg  uops_14_wflag; // @[util.scala 537:20]
  reg [3:0] uops_14_prflag; // @[util.scala 537:20]
  reg [3:0] uops_14_pwflag; // @[util.scala 537:20]
  reg  uops_14_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_14_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_14_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_14_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_14_split_num; // @[util.scala 537:20]
  reg [5:0] uops_14_self_index; // @[util.scala 537:20]
  reg [5:0] uops_14_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_14_address_num; // @[util.scala 537:20]
  reg [6:0] uops_14_uopc; // @[util.scala 537:20]
  reg [31:0] uops_14_inst; // @[util.scala 537:20]
  reg [31:0] uops_14_debug_inst; // @[util.scala 537:20]
  reg  uops_14_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_14_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_14_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_14_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_14_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_14_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_14_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_14_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_14_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_14_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_14_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_14_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_14_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_14_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_14_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_14_iw_state; // @[util.scala 537:20]
  reg  uops_14_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_14_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_14_is_br; // @[util.scala 537:20]
  reg  uops_14_is_jalr; // @[util.scala 537:20]
  reg  uops_14_is_jal; // @[util.scala 537:20]
  reg  uops_14_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_14_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_14_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_14_ftq_idx; // @[util.scala 537:20]
  reg  uops_14_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_14_pc_lob; // @[util.scala 537:20]
  reg  uops_14_taken; // @[util.scala 537:20]
  reg [19:0] uops_14_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_14_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_14_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_14_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_14_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_14_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_14_pdst; // @[util.scala 537:20]
  reg [6:0] uops_14_prs1; // @[util.scala 537:20]
  reg [6:0] uops_14_prs2; // @[util.scala 537:20]
  reg [6:0] uops_14_prs3; // @[util.scala 537:20]
  reg [4:0] uops_14_ppred; // @[util.scala 537:20]
  reg  uops_14_prs1_busy; // @[util.scala 537:20]
  reg  uops_14_prs2_busy; // @[util.scala 537:20]
  reg  uops_14_prs3_busy; // @[util.scala 537:20]
  reg  uops_14_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_14_stale_pdst; // @[util.scala 537:20]
  reg  uops_14_exception; // @[util.scala 537:20]
  reg [63:0] uops_14_exc_cause; // @[util.scala 537:20]
  reg  uops_14_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_14_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_14_mem_size; // @[util.scala 537:20]
  reg  uops_14_mem_signed; // @[util.scala 537:20]
  reg  uops_14_is_fence; // @[util.scala 537:20]
  reg  uops_14_is_fencei; // @[util.scala 537:20]
  reg  uops_14_is_amo; // @[util.scala 537:20]
  reg  uops_14_uses_ldq; // @[util.scala 537:20]
  reg  uops_14_uses_stq; // @[util.scala 537:20]
  reg  uops_14_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_14_is_unique; // @[util.scala 537:20]
  reg  uops_14_flush_on_commit; // @[util.scala 537:20]
  reg  uops_14_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_14_ldst; // @[util.scala 537:20]
  reg [5:0] uops_14_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_14_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_14_lrs3; // @[util.scala 537:20]
  reg  uops_14_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_14_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_14_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_14_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_14_frs3_en; // @[util.scala 537:20]
  reg  uops_14_fp_val; // @[util.scala 537:20]
  reg  uops_14_fp_single; // @[util.scala 537:20]
  reg  uops_14_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_14_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_14_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_14_bp_debug_if; // @[util.scala 537:20]
  reg  uops_14_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_14_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_14_debug_tsrc; // @[util.scala 537:20]
  reg  uops_15_switch; // @[util.scala 537:20]
  reg  uops_15_switch_off; // @[util.scala 537:20]
  reg  uops_15_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_15_shift; // @[util.scala 537:20]
  reg [1:0] uops_15_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_15_rflag; // @[util.scala 537:20]
  reg  uops_15_wflag; // @[util.scala 537:20]
  reg [3:0] uops_15_prflag; // @[util.scala 537:20]
  reg [3:0] uops_15_pwflag; // @[util.scala 537:20]
  reg  uops_15_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_15_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_15_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_15_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_15_split_num; // @[util.scala 537:20]
  reg [5:0] uops_15_self_index; // @[util.scala 537:20]
  reg [5:0] uops_15_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_15_address_num; // @[util.scala 537:20]
  reg [6:0] uops_15_uopc; // @[util.scala 537:20]
  reg [31:0] uops_15_inst; // @[util.scala 537:20]
  reg [31:0] uops_15_debug_inst; // @[util.scala 537:20]
  reg  uops_15_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_15_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_15_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_15_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_15_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_15_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_15_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_15_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_15_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_15_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_15_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_15_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_15_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_15_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_15_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_15_iw_state; // @[util.scala 537:20]
  reg  uops_15_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_15_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_15_is_br; // @[util.scala 537:20]
  reg  uops_15_is_jalr; // @[util.scala 537:20]
  reg  uops_15_is_jal; // @[util.scala 537:20]
  reg  uops_15_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_15_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_15_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_15_ftq_idx; // @[util.scala 537:20]
  reg  uops_15_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_15_pc_lob; // @[util.scala 537:20]
  reg  uops_15_taken; // @[util.scala 537:20]
  reg [19:0] uops_15_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_15_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_15_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_15_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_15_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_15_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_15_pdst; // @[util.scala 537:20]
  reg [6:0] uops_15_prs1; // @[util.scala 537:20]
  reg [6:0] uops_15_prs2; // @[util.scala 537:20]
  reg [6:0] uops_15_prs3; // @[util.scala 537:20]
  reg [4:0] uops_15_ppred; // @[util.scala 537:20]
  reg  uops_15_prs1_busy; // @[util.scala 537:20]
  reg  uops_15_prs2_busy; // @[util.scala 537:20]
  reg  uops_15_prs3_busy; // @[util.scala 537:20]
  reg  uops_15_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_15_stale_pdst; // @[util.scala 537:20]
  reg  uops_15_exception; // @[util.scala 537:20]
  reg [63:0] uops_15_exc_cause; // @[util.scala 537:20]
  reg  uops_15_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_15_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_15_mem_size; // @[util.scala 537:20]
  reg  uops_15_mem_signed; // @[util.scala 537:20]
  reg  uops_15_is_fence; // @[util.scala 537:20]
  reg  uops_15_is_fencei; // @[util.scala 537:20]
  reg  uops_15_is_amo; // @[util.scala 537:20]
  reg  uops_15_uses_ldq; // @[util.scala 537:20]
  reg  uops_15_uses_stq; // @[util.scala 537:20]
  reg  uops_15_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_15_is_unique; // @[util.scala 537:20]
  reg  uops_15_flush_on_commit; // @[util.scala 537:20]
  reg  uops_15_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_15_ldst; // @[util.scala 537:20]
  reg [5:0] uops_15_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_15_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_15_lrs3; // @[util.scala 537:20]
  reg  uops_15_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_15_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_15_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_15_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_15_frs3_en; // @[util.scala 537:20]
  reg  uops_15_fp_val; // @[util.scala 537:20]
  reg  uops_15_fp_single; // @[util.scala 537:20]
  reg  uops_15_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_15_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_15_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_15_bp_debug_if; // @[util.scala 537:20]
  reg  uops_15_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_15_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_15_debug_tsrc; // @[util.scala 537:20]
  reg [3:0] value; // @[Counter.scala 60:40]
  reg [3:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[util.scala 541:27]
  wire  ptr_match = value == value_1; // @[util.scala 543:33]
  wire  full = ptr_match & maybe_full; // @[util.scala 545:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_1 = 4'h1 == value_1 ? valids_1 : valids_0; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_2 = 4'h2 == value_1 ? valids_2 : _GEN_1; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_3 = 4'h3 == value_1 ? valids_3 : _GEN_2; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_4 = 4'h4 == value_1 ? valids_4 : _GEN_3; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_5 = 4'h5 == value_1 ? valids_5 : _GEN_4; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_6 = 4'h6 == value_1 ? valids_6 : _GEN_5; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_7 = 4'h7 == value_1 ? valids_7 : _GEN_6; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_8 = 4'h8 == value_1 ? valids_8 : _GEN_7; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_9 = 4'h9 == value_1 ? valids_9 : _GEN_8; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_10 = 4'ha == value_1 ? valids_10 : _GEN_9; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_11 = 4'hb == value_1 ? valids_11 : _GEN_10; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_12 = 4'hc == value_1 ? valids_12 : _GEN_11; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_13 = 4'hd == value_1 ? valids_13 : _GEN_12; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_14 = 4'he == value_1 ? valids_14 : _GEN_13; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_15 = 4'hf == value_1 ? valids_15 : _GEN_14; // @[util.scala 547:42 util.scala 547:42]
  wire  _T_5 = ~io_empty; // @[util.scala 547:69]
  wire  do_deq = (io_deq_ready | ~_GEN_15) & ~io_empty; // @[util.scala 547:66]
  wire [11:0] _T_7 = io_brupdate_b1_mispredict_mask & uops_0_br_mask; // @[util.scala 175:51]
  wire  _T_8 = _T_7 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_14 = ~io_brupdate_b1_resolve_mask; // @[util.scala 146:23]
  wire [11:0] _T_15 = uops_0_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_16 = valids_0 ? _T_15 : uops_0_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_16 = io_brupdate_b1_mispredict_mask & uops_1_br_mask; // @[util.scala 175:51]
  wire  _T_17 = _T_16 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_24 = uops_1_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_17 = valids_1 ? _T_24 : uops_1_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_25 = io_brupdate_b1_mispredict_mask & uops_2_br_mask; // @[util.scala 175:51]
  wire  _T_26 = _T_25 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_33 = uops_2_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_18 = valids_2 ? _T_33 : uops_2_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_34 = io_brupdate_b1_mispredict_mask & uops_3_br_mask; // @[util.scala 175:51]
  wire  _T_35 = _T_34 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_42 = uops_3_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_19 = valids_3 ? _T_42 : uops_3_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_43 = io_brupdate_b1_mispredict_mask & uops_4_br_mask; // @[util.scala 175:51]
  wire  _T_44 = _T_43 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_51 = uops_4_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_20 = valids_4 ? _T_51 : uops_4_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_52 = io_brupdate_b1_mispredict_mask & uops_5_br_mask; // @[util.scala 175:51]
  wire  _T_53 = _T_52 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_60 = uops_5_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_21 = valids_5 ? _T_60 : uops_5_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_61 = io_brupdate_b1_mispredict_mask & uops_6_br_mask; // @[util.scala 175:51]
  wire  _T_62 = _T_61 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_69 = uops_6_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_22 = valids_6 ? _T_69 : uops_6_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_70 = io_brupdate_b1_mispredict_mask & uops_7_br_mask; // @[util.scala 175:51]
  wire  _T_71 = _T_70 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_78 = uops_7_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_23 = valids_7 ? _T_78 : uops_7_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_79 = io_brupdate_b1_mispredict_mask & uops_8_br_mask; // @[util.scala 175:51]
  wire  _T_80 = _T_79 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_87 = uops_8_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_24 = valids_8 ? _T_87 : uops_8_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_88 = io_brupdate_b1_mispredict_mask & uops_9_br_mask; // @[util.scala 175:51]
  wire  _T_89 = _T_88 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_96 = uops_9_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_25 = valids_9 ? _T_96 : uops_9_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_97 = io_brupdate_b1_mispredict_mask & uops_10_br_mask; // @[util.scala 175:51]
  wire  _T_98 = _T_97 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_105 = uops_10_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_26 = valids_10 ? _T_105 : uops_10_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_106 = io_brupdate_b1_mispredict_mask & uops_11_br_mask; // @[util.scala 175:51]
  wire  _T_107 = _T_106 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_114 = uops_11_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_27 = valids_11 ? _T_114 : uops_11_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_115 = io_brupdate_b1_mispredict_mask & uops_12_br_mask; // @[util.scala 175:51]
  wire  _T_116 = _T_115 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_123 = uops_12_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_28 = valids_12 ? _T_123 : uops_12_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_124 = io_brupdate_b1_mispredict_mask & uops_13_br_mask; // @[util.scala 175:51]
  wire  _T_125 = _T_124 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_132 = uops_13_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_29 = valids_13 ? _T_132 : uops_13_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_133 = io_brupdate_b1_mispredict_mask & uops_14_br_mask; // @[util.scala 175:51]
  wire  _T_134 = _T_133 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_141 = uops_14_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_30 = valids_14 ? _T_141 : uops_14_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_142 = io_brupdate_b1_mispredict_mask & uops_15_br_mask; // @[util.scala 175:51]
  wire  _T_143 = _T_142 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_150 = uops_15_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_31 = valids_15 ? _T_150 : uops_15_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire  _GEN_32 = 4'h0 == value | valids_0 & ~_T_8 & ~(io_flush & uops_0_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_33 = 4'h1 == value | valids_1 & ~_T_17 & ~(io_flush & uops_1_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_34 = 4'h2 == value | valids_2 & ~_T_26 & ~(io_flush & uops_2_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_35 = 4'h3 == value | valids_3 & ~_T_35 & ~(io_flush & uops_3_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_36 = 4'h4 == value | valids_4 & ~_T_44 & ~(io_flush & uops_4_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_37 = 4'h5 == value | valids_5 & ~_T_53 & ~(io_flush & uops_5_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_38 = 4'h6 == value | valids_6 & ~_T_62 & ~(io_flush & uops_6_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_39 = 4'h7 == value | valids_7 & ~_T_71 & ~(io_flush & uops_7_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_40 = 4'h8 == value | valids_8 & ~_T_80 & ~(io_flush & uops_8_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_41 = 4'h9 == value | valids_9 & ~_T_89 & ~(io_flush & uops_9_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_42 = 4'ha == value | valids_10 & ~_T_98 & ~(io_flush & uops_10_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_43 = 4'hb == value | valids_11 & ~_T_107 & ~(io_flush & uops_11_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_44 = 4'hc == value | valids_12 & ~_T_116 & ~(io_flush & uops_12_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_45 = 4'hd == value | valids_13 & ~_T_125 & ~(io_flush & uops_13_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_46 = 4'he == value | valids_14 & ~_T_134 & ~(io_flush & uops_14_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_47 = 4'hf == value | valids_15 & ~_T_143 & ~(io_flush & uops_15_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire [11:0] _T_152 = io_enq_bits_uop_br_mask & _T_14; // @[util.scala 142:25]
  wire [3:0] _value_T_1 = value + 4'h1; // @[Counter.scala 76:24]
  wire  _GEN_1725 = do_enq ? _GEN_32 : valids_0 & ~_T_8 & ~(io_flush & uops_0_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1726 = do_enq ? _GEN_33 : valids_1 & ~_T_17 & ~(io_flush & uops_1_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1727 = do_enq ? _GEN_34 : valids_2 & ~_T_26 & ~(io_flush & uops_2_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1728 = do_enq ? _GEN_35 : valids_3 & ~_T_35 & ~(io_flush & uops_3_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1729 = do_enq ? _GEN_36 : valids_4 & ~_T_44 & ~(io_flush & uops_4_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1730 = do_enq ? _GEN_37 : valids_5 & ~_T_53 & ~(io_flush & uops_5_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1731 = do_enq ? _GEN_38 : valids_6 & ~_T_62 & ~(io_flush & uops_6_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1732 = do_enq ? _GEN_39 : valids_7 & ~_T_71 & ~(io_flush & uops_7_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1733 = do_enq ? _GEN_40 : valids_8 & ~_T_80 & ~(io_flush & uops_8_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1734 = do_enq ? _GEN_41 : valids_9 & ~_T_89 & ~(io_flush & uops_9_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1735 = do_enq ? _GEN_42 : valids_10 & ~_T_98 & ~(io_flush & uops_10_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1736 = do_enq ? _GEN_43 : valids_11 & ~_T_107 & ~(io_flush & uops_11_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1737 = do_enq ? _GEN_44 : valids_12 & ~_T_116 & ~(io_flush & uops_12_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1738 = do_enq ? _GEN_45 : valids_13 & ~_T_125 & ~(io_flush & uops_13_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1739 = do_enq ? _GEN_46 : valids_14 & ~_T_134 & ~(io_flush & uops_14_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_1740 = do_enq ? _GEN_47 : valids_15 & ~_T_143 & ~(io_flush & uops_15_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire [3:0] _value_T_3 = value_1 + 4'h1; // @[Counter.scala 76:24]
  wire [1:0] _GEN_3329 = 4'h1 == value_1 ? uops_1_debug_tsrc : uops_0_debug_tsrc; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3330 = 4'h2 == value_1 ? uops_2_debug_tsrc : _GEN_3329; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3331 = 4'h3 == value_1 ? uops_3_debug_tsrc : _GEN_3330; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3332 = 4'h4 == value_1 ? uops_4_debug_tsrc : _GEN_3331; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3333 = 4'h5 == value_1 ? uops_5_debug_tsrc : _GEN_3332; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3334 = 4'h6 == value_1 ? uops_6_debug_tsrc : _GEN_3333; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3335 = 4'h7 == value_1 ? uops_7_debug_tsrc : _GEN_3334; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3336 = 4'h8 == value_1 ? uops_8_debug_tsrc : _GEN_3335; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3337 = 4'h9 == value_1 ? uops_9_debug_tsrc : _GEN_3336; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3338 = 4'ha == value_1 ? uops_10_debug_tsrc : _GEN_3337; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3339 = 4'hb == value_1 ? uops_11_debug_tsrc : _GEN_3338; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3340 = 4'hc == value_1 ? uops_12_debug_tsrc : _GEN_3339; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3341 = 4'hd == value_1 ? uops_13_debug_tsrc : _GEN_3340; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3342 = 4'he == value_1 ? uops_14_debug_tsrc : _GEN_3341; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3345 = 4'h1 == value_1 ? uops_1_debug_fsrc : uops_0_debug_fsrc; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3346 = 4'h2 == value_1 ? uops_2_debug_fsrc : _GEN_3345; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3347 = 4'h3 == value_1 ? uops_3_debug_fsrc : _GEN_3346; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3348 = 4'h4 == value_1 ? uops_4_debug_fsrc : _GEN_3347; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3349 = 4'h5 == value_1 ? uops_5_debug_fsrc : _GEN_3348; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3350 = 4'h6 == value_1 ? uops_6_debug_fsrc : _GEN_3349; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3351 = 4'h7 == value_1 ? uops_7_debug_fsrc : _GEN_3350; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3352 = 4'h8 == value_1 ? uops_8_debug_fsrc : _GEN_3351; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3353 = 4'h9 == value_1 ? uops_9_debug_fsrc : _GEN_3352; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3354 = 4'ha == value_1 ? uops_10_debug_fsrc : _GEN_3353; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3355 = 4'hb == value_1 ? uops_11_debug_fsrc : _GEN_3354; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3356 = 4'hc == value_1 ? uops_12_debug_fsrc : _GEN_3355; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3357 = 4'hd == value_1 ? uops_13_debug_fsrc : _GEN_3356; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3358 = 4'he == value_1 ? uops_14_debug_fsrc : _GEN_3357; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3361 = 4'h1 == value_1 ? uops_1_bp_xcpt_if : uops_0_bp_xcpt_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3362 = 4'h2 == value_1 ? uops_2_bp_xcpt_if : _GEN_3361; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3363 = 4'h3 == value_1 ? uops_3_bp_xcpt_if : _GEN_3362; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3364 = 4'h4 == value_1 ? uops_4_bp_xcpt_if : _GEN_3363; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3365 = 4'h5 == value_1 ? uops_5_bp_xcpt_if : _GEN_3364; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3366 = 4'h6 == value_1 ? uops_6_bp_xcpt_if : _GEN_3365; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3367 = 4'h7 == value_1 ? uops_7_bp_xcpt_if : _GEN_3366; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3368 = 4'h8 == value_1 ? uops_8_bp_xcpt_if : _GEN_3367; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3369 = 4'h9 == value_1 ? uops_9_bp_xcpt_if : _GEN_3368; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3370 = 4'ha == value_1 ? uops_10_bp_xcpt_if : _GEN_3369; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3371 = 4'hb == value_1 ? uops_11_bp_xcpt_if : _GEN_3370; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3372 = 4'hc == value_1 ? uops_12_bp_xcpt_if : _GEN_3371; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3373 = 4'hd == value_1 ? uops_13_bp_xcpt_if : _GEN_3372; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3374 = 4'he == value_1 ? uops_14_bp_xcpt_if : _GEN_3373; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3377 = 4'h1 == value_1 ? uops_1_bp_debug_if : uops_0_bp_debug_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3378 = 4'h2 == value_1 ? uops_2_bp_debug_if : _GEN_3377; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3379 = 4'h3 == value_1 ? uops_3_bp_debug_if : _GEN_3378; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3380 = 4'h4 == value_1 ? uops_4_bp_debug_if : _GEN_3379; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3381 = 4'h5 == value_1 ? uops_5_bp_debug_if : _GEN_3380; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3382 = 4'h6 == value_1 ? uops_6_bp_debug_if : _GEN_3381; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3383 = 4'h7 == value_1 ? uops_7_bp_debug_if : _GEN_3382; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3384 = 4'h8 == value_1 ? uops_8_bp_debug_if : _GEN_3383; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3385 = 4'h9 == value_1 ? uops_9_bp_debug_if : _GEN_3384; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3386 = 4'ha == value_1 ? uops_10_bp_debug_if : _GEN_3385; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3387 = 4'hb == value_1 ? uops_11_bp_debug_if : _GEN_3386; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3388 = 4'hc == value_1 ? uops_12_bp_debug_if : _GEN_3387; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3389 = 4'hd == value_1 ? uops_13_bp_debug_if : _GEN_3388; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3390 = 4'he == value_1 ? uops_14_bp_debug_if : _GEN_3389; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3393 = 4'h1 == value_1 ? uops_1_xcpt_ma_if : uops_0_xcpt_ma_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3394 = 4'h2 == value_1 ? uops_2_xcpt_ma_if : _GEN_3393; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3395 = 4'h3 == value_1 ? uops_3_xcpt_ma_if : _GEN_3394; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3396 = 4'h4 == value_1 ? uops_4_xcpt_ma_if : _GEN_3395; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3397 = 4'h5 == value_1 ? uops_5_xcpt_ma_if : _GEN_3396; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3398 = 4'h6 == value_1 ? uops_6_xcpt_ma_if : _GEN_3397; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3399 = 4'h7 == value_1 ? uops_7_xcpt_ma_if : _GEN_3398; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3400 = 4'h8 == value_1 ? uops_8_xcpt_ma_if : _GEN_3399; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3401 = 4'h9 == value_1 ? uops_9_xcpt_ma_if : _GEN_3400; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3402 = 4'ha == value_1 ? uops_10_xcpt_ma_if : _GEN_3401; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3403 = 4'hb == value_1 ? uops_11_xcpt_ma_if : _GEN_3402; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3404 = 4'hc == value_1 ? uops_12_xcpt_ma_if : _GEN_3403; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3405 = 4'hd == value_1 ? uops_13_xcpt_ma_if : _GEN_3404; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3406 = 4'he == value_1 ? uops_14_xcpt_ma_if : _GEN_3405; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3409 = 4'h1 == value_1 ? uops_1_xcpt_ae_if : uops_0_xcpt_ae_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3410 = 4'h2 == value_1 ? uops_2_xcpt_ae_if : _GEN_3409; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3411 = 4'h3 == value_1 ? uops_3_xcpt_ae_if : _GEN_3410; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3412 = 4'h4 == value_1 ? uops_4_xcpt_ae_if : _GEN_3411; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3413 = 4'h5 == value_1 ? uops_5_xcpt_ae_if : _GEN_3412; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3414 = 4'h6 == value_1 ? uops_6_xcpt_ae_if : _GEN_3413; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3415 = 4'h7 == value_1 ? uops_7_xcpt_ae_if : _GEN_3414; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3416 = 4'h8 == value_1 ? uops_8_xcpt_ae_if : _GEN_3415; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3417 = 4'h9 == value_1 ? uops_9_xcpt_ae_if : _GEN_3416; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3418 = 4'ha == value_1 ? uops_10_xcpt_ae_if : _GEN_3417; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3419 = 4'hb == value_1 ? uops_11_xcpt_ae_if : _GEN_3418; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3420 = 4'hc == value_1 ? uops_12_xcpt_ae_if : _GEN_3419; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3421 = 4'hd == value_1 ? uops_13_xcpt_ae_if : _GEN_3420; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3422 = 4'he == value_1 ? uops_14_xcpt_ae_if : _GEN_3421; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3425 = 4'h1 == value_1 ? uops_1_xcpt_pf_if : uops_0_xcpt_pf_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3426 = 4'h2 == value_1 ? uops_2_xcpt_pf_if : _GEN_3425; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3427 = 4'h3 == value_1 ? uops_3_xcpt_pf_if : _GEN_3426; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3428 = 4'h4 == value_1 ? uops_4_xcpt_pf_if : _GEN_3427; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3429 = 4'h5 == value_1 ? uops_5_xcpt_pf_if : _GEN_3428; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3430 = 4'h6 == value_1 ? uops_6_xcpt_pf_if : _GEN_3429; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3431 = 4'h7 == value_1 ? uops_7_xcpt_pf_if : _GEN_3430; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3432 = 4'h8 == value_1 ? uops_8_xcpt_pf_if : _GEN_3431; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3433 = 4'h9 == value_1 ? uops_9_xcpt_pf_if : _GEN_3432; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3434 = 4'ha == value_1 ? uops_10_xcpt_pf_if : _GEN_3433; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3435 = 4'hb == value_1 ? uops_11_xcpt_pf_if : _GEN_3434; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3436 = 4'hc == value_1 ? uops_12_xcpt_pf_if : _GEN_3435; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3437 = 4'hd == value_1 ? uops_13_xcpt_pf_if : _GEN_3436; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3438 = 4'he == value_1 ? uops_14_xcpt_pf_if : _GEN_3437; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3441 = 4'h1 == value_1 ? uops_1_fp_single : uops_0_fp_single; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3442 = 4'h2 == value_1 ? uops_2_fp_single : _GEN_3441; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3443 = 4'h3 == value_1 ? uops_3_fp_single : _GEN_3442; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3444 = 4'h4 == value_1 ? uops_4_fp_single : _GEN_3443; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3445 = 4'h5 == value_1 ? uops_5_fp_single : _GEN_3444; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3446 = 4'h6 == value_1 ? uops_6_fp_single : _GEN_3445; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3447 = 4'h7 == value_1 ? uops_7_fp_single : _GEN_3446; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3448 = 4'h8 == value_1 ? uops_8_fp_single : _GEN_3447; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3449 = 4'h9 == value_1 ? uops_9_fp_single : _GEN_3448; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3450 = 4'ha == value_1 ? uops_10_fp_single : _GEN_3449; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3451 = 4'hb == value_1 ? uops_11_fp_single : _GEN_3450; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3452 = 4'hc == value_1 ? uops_12_fp_single : _GEN_3451; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3453 = 4'hd == value_1 ? uops_13_fp_single : _GEN_3452; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3454 = 4'he == value_1 ? uops_14_fp_single : _GEN_3453; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3457 = 4'h1 == value_1 ? uops_1_fp_val : uops_0_fp_val; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3458 = 4'h2 == value_1 ? uops_2_fp_val : _GEN_3457; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3459 = 4'h3 == value_1 ? uops_3_fp_val : _GEN_3458; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3460 = 4'h4 == value_1 ? uops_4_fp_val : _GEN_3459; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3461 = 4'h5 == value_1 ? uops_5_fp_val : _GEN_3460; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3462 = 4'h6 == value_1 ? uops_6_fp_val : _GEN_3461; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3463 = 4'h7 == value_1 ? uops_7_fp_val : _GEN_3462; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3464 = 4'h8 == value_1 ? uops_8_fp_val : _GEN_3463; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3465 = 4'h9 == value_1 ? uops_9_fp_val : _GEN_3464; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3466 = 4'ha == value_1 ? uops_10_fp_val : _GEN_3465; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3467 = 4'hb == value_1 ? uops_11_fp_val : _GEN_3466; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3468 = 4'hc == value_1 ? uops_12_fp_val : _GEN_3467; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3469 = 4'hd == value_1 ? uops_13_fp_val : _GEN_3468; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3470 = 4'he == value_1 ? uops_14_fp_val : _GEN_3469; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3473 = 4'h1 == value_1 ? uops_1_frs3_en : uops_0_frs3_en; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3474 = 4'h2 == value_1 ? uops_2_frs3_en : _GEN_3473; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3475 = 4'h3 == value_1 ? uops_3_frs3_en : _GEN_3474; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3476 = 4'h4 == value_1 ? uops_4_frs3_en : _GEN_3475; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3477 = 4'h5 == value_1 ? uops_5_frs3_en : _GEN_3476; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3478 = 4'h6 == value_1 ? uops_6_frs3_en : _GEN_3477; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3479 = 4'h7 == value_1 ? uops_7_frs3_en : _GEN_3478; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3480 = 4'h8 == value_1 ? uops_8_frs3_en : _GEN_3479; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3481 = 4'h9 == value_1 ? uops_9_frs3_en : _GEN_3480; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3482 = 4'ha == value_1 ? uops_10_frs3_en : _GEN_3481; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3483 = 4'hb == value_1 ? uops_11_frs3_en : _GEN_3482; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3484 = 4'hc == value_1 ? uops_12_frs3_en : _GEN_3483; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3485 = 4'hd == value_1 ? uops_13_frs3_en : _GEN_3484; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3486 = 4'he == value_1 ? uops_14_frs3_en : _GEN_3485; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3489 = 4'h1 == value_1 ? uops_1_lrs2_rtype : uops_0_lrs2_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3490 = 4'h2 == value_1 ? uops_2_lrs2_rtype : _GEN_3489; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3491 = 4'h3 == value_1 ? uops_3_lrs2_rtype : _GEN_3490; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3492 = 4'h4 == value_1 ? uops_4_lrs2_rtype : _GEN_3491; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3493 = 4'h5 == value_1 ? uops_5_lrs2_rtype : _GEN_3492; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3494 = 4'h6 == value_1 ? uops_6_lrs2_rtype : _GEN_3493; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3495 = 4'h7 == value_1 ? uops_7_lrs2_rtype : _GEN_3494; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3496 = 4'h8 == value_1 ? uops_8_lrs2_rtype : _GEN_3495; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3497 = 4'h9 == value_1 ? uops_9_lrs2_rtype : _GEN_3496; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3498 = 4'ha == value_1 ? uops_10_lrs2_rtype : _GEN_3497; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3499 = 4'hb == value_1 ? uops_11_lrs2_rtype : _GEN_3498; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3500 = 4'hc == value_1 ? uops_12_lrs2_rtype : _GEN_3499; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3501 = 4'hd == value_1 ? uops_13_lrs2_rtype : _GEN_3500; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3502 = 4'he == value_1 ? uops_14_lrs2_rtype : _GEN_3501; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3505 = 4'h1 == value_1 ? uops_1_lrs1_rtype : uops_0_lrs1_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3506 = 4'h2 == value_1 ? uops_2_lrs1_rtype : _GEN_3505; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3507 = 4'h3 == value_1 ? uops_3_lrs1_rtype : _GEN_3506; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3508 = 4'h4 == value_1 ? uops_4_lrs1_rtype : _GEN_3507; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3509 = 4'h5 == value_1 ? uops_5_lrs1_rtype : _GEN_3508; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3510 = 4'h6 == value_1 ? uops_6_lrs1_rtype : _GEN_3509; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3511 = 4'h7 == value_1 ? uops_7_lrs1_rtype : _GEN_3510; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3512 = 4'h8 == value_1 ? uops_8_lrs1_rtype : _GEN_3511; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3513 = 4'h9 == value_1 ? uops_9_lrs1_rtype : _GEN_3512; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3514 = 4'ha == value_1 ? uops_10_lrs1_rtype : _GEN_3513; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3515 = 4'hb == value_1 ? uops_11_lrs1_rtype : _GEN_3514; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3516 = 4'hc == value_1 ? uops_12_lrs1_rtype : _GEN_3515; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3517 = 4'hd == value_1 ? uops_13_lrs1_rtype : _GEN_3516; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3518 = 4'he == value_1 ? uops_14_lrs1_rtype : _GEN_3517; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3521 = 4'h1 == value_1 ? uops_1_dst_rtype : uops_0_dst_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3522 = 4'h2 == value_1 ? uops_2_dst_rtype : _GEN_3521; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3523 = 4'h3 == value_1 ? uops_3_dst_rtype : _GEN_3522; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3524 = 4'h4 == value_1 ? uops_4_dst_rtype : _GEN_3523; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3525 = 4'h5 == value_1 ? uops_5_dst_rtype : _GEN_3524; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3526 = 4'h6 == value_1 ? uops_6_dst_rtype : _GEN_3525; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3527 = 4'h7 == value_1 ? uops_7_dst_rtype : _GEN_3526; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3528 = 4'h8 == value_1 ? uops_8_dst_rtype : _GEN_3527; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3529 = 4'h9 == value_1 ? uops_9_dst_rtype : _GEN_3528; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3530 = 4'ha == value_1 ? uops_10_dst_rtype : _GEN_3529; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3531 = 4'hb == value_1 ? uops_11_dst_rtype : _GEN_3530; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3532 = 4'hc == value_1 ? uops_12_dst_rtype : _GEN_3531; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3533 = 4'hd == value_1 ? uops_13_dst_rtype : _GEN_3532; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3534 = 4'he == value_1 ? uops_14_dst_rtype : _GEN_3533; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3537 = 4'h1 == value_1 ? uops_1_ldst_val : uops_0_ldst_val; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3538 = 4'h2 == value_1 ? uops_2_ldst_val : _GEN_3537; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3539 = 4'h3 == value_1 ? uops_3_ldst_val : _GEN_3538; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3540 = 4'h4 == value_1 ? uops_4_ldst_val : _GEN_3539; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3541 = 4'h5 == value_1 ? uops_5_ldst_val : _GEN_3540; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3542 = 4'h6 == value_1 ? uops_6_ldst_val : _GEN_3541; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3543 = 4'h7 == value_1 ? uops_7_ldst_val : _GEN_3542; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3544 = 4'h8 == value_1 ? uops_8_ldst_val : _GEN_3543; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3545 = 4'h9 == value_1 ? uops_9_ldst_val : _GEN_3544; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3546 = 4'ha == value_1 ? uops_10_ldst_val : _GEN_3545; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3547 = 4'hb == value_1 ? uops_11_ldst_val : _GEN_3546; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3548 = 4'hc == value_1 ? uops_12_ldst_val : _GEN_3547; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3549 = 4'hd == value_1 ? uops_13_ldst_val : _GEN_3548; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3550 = 4'he == value_1 ? uops_14_ldst_val : _GEN_3549; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3553 = 4'h1 == value_1 ? uops_1_lrs3 : uops_0_lrs3; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3554 = 4'h2 == value_1 ? uops_2_lrs3 : _GEN_3553; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3555 = 4'h3 == value_1 ? uops_3_lrs3 : _GEN_3554; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3556 = 4'h4 == value_1 ? uops_4_lrs3 : _GEN_3555; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3557 = 4'h5 == value_1 ? uops_5_lrs3 : _GEN_3556; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3558 = 4'h6 == value_1 ? uops_6_lrs3 : _GEN_3557; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3559 = 4'h7 == value_1 ? uops_7_lrs3 : _GEN_3558; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3560 = 4'h8 == value_1 ? uops_8_lrs3 : _GEN_3559; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3561 = 4'h9 == value_1 ? uops_9_lrs3 : _GEN_3560; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3562 = 4'ha == value_1 ? uops_10_lrs3 : _GEN_3561; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3563 = 4'hb == value_1 ? uops_11_lrs3 : _GEN_3562; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3564 = 4'hc == value_1 ? uops_12_lrs3 : _GEN_3563; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3565 = 4'hd == value_1 ? uops_13_lrs3 : _GEN_3564; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3566 = 4'he == value_1 ? uops_14_lrs3 : _GEN_3565; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3569 = 4'h1 == value_1 ? uops_1_lrs2 : uops_0_lrs2; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3570 = 4'h2 == value_1 ? uops_2_lrs2 : _GEN_3569; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3571 = 4'h3 == value_1 ? uops_3_lrs2 : _GEN_3570; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3572 = 4'h4 == value_1 ? uops_4_lrs2 : _GEN_3571; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3573 = 4'h5 == value_1 ? uops_5_lrs2 : _GEN_3572; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3574 = 4'h6 == value_1 ? uops_6_lrs2 : _GEN_3573; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3575 = 4'h7 == value_1 ? uops_7_lrs2 : _GEN_3574; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3576 = 4'h8 == value_1 ? uops_8_lrs2 : _GEN_3575; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3577 = 4'h9 == value_1 ? uops_9_lrs2 : _GEN_3576; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3578 = 4'ha == value_1 ? uops_10_lrs2 : _GEN_3577; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3579 = 4'hb == value_1 ? uops_11_lrs2 : _GEN_3578; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3580 = 4'hc == value_1 ? uops_12_lrs2 : _GEN_3579; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3581 = 4'hd == value_1 ? uops_13_lrs2 : _GEN_3580; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3582 = 4'he == value_1 ? uops_14_lrs2 : _GEN_3581; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3585 = 4'h1 == value_1 ? uops_1_lrs1 : uops_0_lrs1; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3586 = 4'h2 == value_1 ? uops_2_lrs1 : _GEN_3585; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3587 = 4'h3 == value_1 ? uops_3_lrs1 : _GEN_3586; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3588 = 4'h4 == value_1 ? uops_4_lrs1 : _GEN_3587; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3589 = 4'h5 == value_1 ? uops_5_lrs1 : _GEN_3588; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3590 = 4'h6 == value_1 ? uops_6_lrs1 : _GEN_3589; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3591 = 4'h7 == value_1 ? uops_7_lrs1 : _GEN_3590; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3592 = 4'h8 == value_1 ? uops_8_lrs1 : _GEN_3591; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3593 = 4'h9 == value_1 ? uops_9_lrs1 : _GEN_3592; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3594 = 4'ha == value_1 ? uops_10_lrs1 : _GEN_3593; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3595 = 4'hb == value_1 ? uops_11_lrs1 : _GEN_3594; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3596 = 4'hc == value_1 ? uops_12_lrs1 : _GEN_3595; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3597 = 4'hd == value_1 ? uops_13_lrs1 : _GEN_3596; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3598 = 4'he == value_1 ? uops_14_lrs1 : _GEN_3597; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3601 = 4'h1 == value_1 ? uops_1_ldst : uops_0_ldst; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3602 = 4'h2 == value_1 ? uops_2_ldst : _GEN_3601; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3603 = 4'h3 == value_1 ? uops_3_ldst : _GEN_3602; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3604 = 4'h4 == value_1 ? uops_4_ldst : _GEN_3603; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3605 = 4'h5 == value_1 ? uops_5_ldst : _GEN_3604; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3606 = 4'h6 == value_1 ? uops_6_ldst : _GEN_3605; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3607 = 4'h7 == value_1 ? uops_7_ldst : _GEN_3606; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3608 = 4'h8 == value_1 ? uops_8_ldst : _GEN_3607; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3609 = 4'h9 == value_1 ? uops_9_ldst : _GEN_3608; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3610 = 4'ha == value_1 ? uops_10_ldst : _GEN_3609; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3611 = 4'hb == value_1 ? uops_11_ldst : _GEN_3610; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3612 = 4'hc == value_1 ? uops_12_ldst : _GEN_3611; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3613 = 4'hd == value_1 ? uops_13_ldst : _GEN_3612; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_3614 = 4'he == value_1 ? uops_14_ldst : _GEN_3613; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3617 = 4'h1 == value_1 ? uops_1_ldst_is_rs1 : uops_0_ldst_is_rs1; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3618 = 4'h2 == value_1 ? uops_2_ldst_is_rs1 : _GEN_3617; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3619 = 4'h3 == value_1 ? uops_3_ldst_is_rs1 : _GEN_3618; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3620 = 4'h4 == value_1 ? uops_4_ldst_is_rs1 : _GEN_3619; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3621 = 4'h5 == value_1 ? uops_5_ldst_is_rs1 : _GEN_3620; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3622 = 4'h6 == value_1 ? uops_6_ldst_is_rs1 : _GEN_3621; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3623 = 4'h7 == value_1 ? uops_7_ldst_is_rs1 : _GEN_3622; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3624 = 4'h8 == value_1 ? uops_8_ldst_is_rs1 : _GEN_3623; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3625 = 4'h9 == value_1 ? uops_9_ldst_is_rs1 : _GEN_3624; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3626 = 4'ha == value_1 ? uops_10_ldst_is_rs1 : _GEN_3625; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3627 = 4'hb == value_1 ? uops_11_ldst_is_rs1 : _GEN_3626; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3628 = 4'hc == value_1 ? uops_12_ldst_is_rs1 : _GEN_3627; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3629 = 4'hd == value_1 ? uops_13_ldst_is_rs1 : _GEN_3628; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3630 = 4'he == value_1 ? uops_14_ldst_is_rs1 : _GEN_3629; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3633 = 4'h1 == value_1 ? uops_1_flush_on_commit : uops_0_flush_on_commit; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3634 = 4'h2 == value_1 ? uops_2_flush_on_commit : _GEN_3633; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3635 = 4'h3 == value_1 ? uops_3_flush_on_commit : _GEN_3634; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3636 = 4'h4 == value_1 ? uops_4_flush_on_commit : _GEN_3635; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3637 = 4'h5 == value_1 ? uops_5_flush_on_commit : _GEN_3636; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3638 = 4'h6 == value_1 ? uops_6_flush_on_commit : _GEN_3637; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3639 = 4'h7 == value_1 ? uops_7_flush_on_commit : _GEN_3638; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3640 = 4'h8 == value_1 ? uops_8_flush_on_commit : _GEN_3639; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3641 = 4'h9 == value_1 ? uops_9_flush_on_commit : _GEN_3640; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3642 = 4'ha == value_1 ? uops_10_flush_on_commit : _GEN_3641; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3643 = 4'hb == value_1 ? uops_11_flush_on_commit : _GEN_3642; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3644 = 4'hc == value_1 ? uops_12_flush_on_commit : _GEN_3643; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3645 = 4'hd == value_1 ? uops_13_flush_on_commit : _GEN_3644; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3646 = 4'he == value_1 ? uops_14_flush_on_commit : _GEN_3645; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3649 = 4'h1 == value_1 ? uops_1_is_unique : uops_0_is_unique; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3650 = 4'h2 == value_1 ? uops_2_is_unique : _GEN_3649; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3651 = 4'h3 == value_1 ? uops_3_is_unique : _GEN_3650; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3652 = 4'h4 == value_1 ? uops_4_is_unique : _GEN_3651; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3653 = 4'h5 == value_1 ? uops_5_is_unique : _GEN_3652; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3654 = 4'h6 == value_1 ? uops_6_is_unique : _GEN_3653; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3655 = 4'h7 == value_1 ? uops_7_is_unique : _GEN_3654; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3656 = 4'h8 == value_1 ? uops_8_is_unique : _GEN_3655; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3657 = 4'h9 == value_1 ? uops_9_is_unique : _GEN_3656; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3658 = 4'ha == value_1 ? uops_10_is_unique : _GEN_3657; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3659 = 4'hb == value_1 ? uops_11_is_unique : _GEN_3658; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3660 = 4'hc == value_1 ? uops_12_is_unique : _GEN_3659; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3661 = 4'hd == value_1 ? uops_13_is_unique : _GEN_3660; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3662 = 4'he == value_1 ? uops_14_is_unique : _GEN_3661; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3665 = 4'h1 == value_1 ? uops_1_is_sys_pc2epc : uops_0_is_sys_pc2epc; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3666 = 4'h2 == value_1 ? uops_2_is_sys_pc2epc : _GEN_3665; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3667 = 4'h3 == value_1 ? uops_3_is_sys_pc2epc : _GEN_3666; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3668 = 4'h4 == value_1 ? uops_4_is_sys_pc2epc : _GEN_3667; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3669 = 4'h5 == value_1 ? uops_5_is_sys_pc2epc : _GEN_3668; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3670 = 4'h6 == value_1 ? uops_6_is_sys_pc2epc : _GEN_3669; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3671 = 4'h7 == value_1 ? uops_7_is_sys_pc2epc : _GEN_3670; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3672 = 4'h8 == value_1 ? uops_8_is_sys_pc2epc : _GEN_3671; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3673 = 4'h9 == value_1 ? uops_9_is_sys_pc2epc : _GEN_3672; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3674 = 4'ha == value_1 ? uops_10_is_sys_pc2epc : _GEN_3673; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3675 = 4'hb == value_1 ? uops_11_is_sys_pc2epc : _GEN_3674; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3676 = 4'hc == value_1 ? uops_12_is_sys_pc2epc : _GEN_3675; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3677 = 4'hd == value_1 ? uops_13_is_sys_pc2epc : _GEN_3676; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3678 = 4'he == value_1 ? uops_14_is_sys_pc2epc : _GEN_3677; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3681 = 4'h1 == value_1 ? uops_1_uses_stq : uops_0_uses_stq; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3682 = 4'h2 == value_1 ? uops_2_uses_stq : _GEN_3681; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3683 = 4'h3 == value_1 ? uops_3_uses_stq : _GEN_3682; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3684 = 4'h4 == value_1 ? uops_4_uses_stq : _GEN_3683; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3685 = 4'h5 == value_1 ? uops_5_uses_stq : _GEN_3684; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3686 = 4'h6 == value_1 ? uops_6_uses_stq : _GEN_3685; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3687 = 4'h7 == value_1 ? uops_7_uses_stq : _GEN_3686; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3688 = 4'h8 == value_1 ? uops_8_uses_stq : _GEN_3687; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3689 = 4'h9 == value_1 ? uops_9_uses_stq : _GEN_3688; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3690 = 4'ha == value_1 ? uops_10_uses_stq : _GEN_3689; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3691 = 4'hb == value_1 ? uops_11_uses_stq : _GEN_3690; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3692 = 4'hc == value_1 ? uops_12_uses_stq : _GEN_3691; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3693 = 4'hd == value_1 ? uops_13_uses_stq : _GEN_3692; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3694 = 4'he == value_1 ? uops_14_uses_stq : _GEN_3693; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3697 = 4'h1 == value_1 ? uops_1_uses_ldq : uops_0_uses_ldq; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3698 = 4'h2 == value_1 ? uops_2_uses_ldq : _GEN_3697; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3699 = 4'h3 == value_1 ? uops_3_uses_ldq : _GEN_3698; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3700 = 4'h4 == value_1 ? uops_4_uses_ldq : _GEN_3699; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3701 = 4'h5 == value_1 ? uops_5_uses_ldq : _GEN_3700; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3702 = 4'h6 == value_1 ? uops_6_uses_ldq : _GEN_3701; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3703 = 4'h7 == value_1 ? uops_7_uses_ldq : _GEN_3702; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3704 = 4'h8 == value_1 ? uops_8_uses_ldq : _GEN_3703; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3705 = 4'h9 == value_1 ? uops_9_uses_ldq : _GEN_3704; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3706 = 4'ha == value_1 ? uops_10_uses_ldq : _GEN_3705; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3707 = 4'hb == value_1 ? uops_11_uses_ldq : _GEN_3706; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3708 = 4'hc == value_1 ? uops_12_uses_ldq : _GEN_3707; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3709 = 4'hd == value_1 ? uops_13_uses_ldq : _GEN_3708; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3710 = 4'he == value_1 ? uops_14_uses_ldq : _GEN_3709; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_uses_ldq = 4'hf == value_1 ? uops_15_uses_ldq : _GEN_3710; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3713 = 4'h1 == value_1 ? uops_1_is_amo : uops_0_is_amo; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3714 = 4'h2 == value_1 ? uops_2_is_amo : _GEN_3713; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3715 = 4'h3 == value_1 ? uops_3_is_amo : _GEN_3714; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3716 = 4'h4 == value_1 ? uops_4_is_amo : _GEN_3715; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3717 = 4'h5 == value_1 ? uops_5_is_amo : _GEN_3716; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3718 = 4'h6 == value_1 ? uops_6_is_amo : _GEN_3717; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3719 = 4'h7 == value_1 ? uops_7_is_amo : _GEN_3718; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3720 = 4'h8 == value_1 ? uops_8_is_amo : _GEN_3719; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3721 = 4'h9 == value_1 ? uops_9_is_amo : _GEN_3720; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3722 = 4'ha == value_1 ? uops_10_is_amo : _GEN_3721; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3723 = 4'hb == value_1 ? uops_11_is_amo : _GEN_3722; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3724 = 4'hc == value_1 ? uops_12_is_amo : _GEN_3723; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3725 = 4'hd == value_1 ? uops_13_is_amo : _GEN_3724; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3726 = 4'he == value_1 ? uops_14_is_amo : _GEN_3725; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3729 = 4'h1 == value_1 ? uops_1_is_fencei : uops_0_is_fencei; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3730 = 4'h2 == value_1 ? uops_2_is_fencei : _GEN_3729; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3731 = 4'h3 == value_1 ? uops_3_is_fencei : _GEN_3730; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3732 = 4'h4 == value_1 ? uops_4_is_fencei : _GEN_3731; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3733 = 4'h5 == value_1 ? uops_5_is_fencei : _GEN_3732; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3734 = 4'h6 == value_1 ? uops_6_is_fencei : _GEN_3733; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3735 = 4'h7 == value_1 ? uops_7_is_fencei : _GEN_3734; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3736 = 4'h8 == value_1 ? uops_8_is_fencei : _GEN_3735; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3737 = 4'h9 == value_1 ? uops_9_is_fencei : _GEN_3736; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3738 = 4'ha == value_1 ? uops_10_is_fencei : _GEN_3737; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3739 = 4'hb == value_1 ? uops_11_is_fencei : _GEN_3738; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3740 = 4'hc == value_1 ? uops_12_is_fencei : _GEN_3739; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3741 = 4'hd == value_1 ? uops_13_is_fencei : _GEN_3740; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3742 = 4'he == value_1 ? uops_14_is_fencei : _GEN_3741; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3745 = 4'h1 == value_1 ? uops_1_is_fence : uops_0_is_fence; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3746 = 4'h2 == value_1 ? uops_2_is_fence : _GEN_3745; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3747 = 4'h3 == value_1 ? uops_3_is_fence : _GEN_3746; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3748 = 4'h4 == value_1 ? uops_4_is_fence : _GEN_3747; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3749 = 4'h5 == value_1 ? uops_5_is_fence : _GEN_3748; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3750 = 4'h6 == value_1 ? uops_6_is_fence : _GEN_3749; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3751 = 4'h7 == value_1 ? uops_7_is_fence : _GEN_3750; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3752 = 4'h8 == value_1 ? uops_8_is_fence : _GEN_3751; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3753 = 4'h9 == value_1 ? uops_9_is_fence : _GEN_3752; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3754 = 4'ha == value_1 ? uops_10_is_fence : _GEN_3753; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3755 = 4'hb == value_1 ? uops_11_is_fence : _GEN_3754; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3756 = 4'hc == value_1 ? uops_12_is_fence : _GEN_3755; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3757 = 4'hd == value_1 ? uops_13_is_fence : _GEN_3756; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3758 = 4'he == value_1 ? uops_14_is_fence : _GEN_3757; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3761 = 4'h1 == value_1 ? uops_1_mem_signed : uops_0_mem_signed; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3762 = 4'h2 == value_1 ? uops_2_mem_signed : _GEN_3761; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3763 = 4'h3 == value_1 ? uops_3_mem_signed : _GEN_3762; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3764 = 4'h4 == value_1 ? uops_4_mem_signed : _GEN_3763; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3765 = 4'h5 == value_1 ? uops_5_mem_signed : _GEN_3764; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3766 = 4'h6 == value_1 ? uops_6_mem_signed : _GEN_3765; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3767 = 4'h7 == value_1 ? uops_7_mem_signed : _GEN_3766; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3768 = 4'h8 == value_1 ? uops_8_mem_signed : _GEN_3767; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3769 = 4'h9 == value_1 ? uops_9_mem_signed : _GEN_3768; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3770 = 4'ha == value_1 ? uops_10_mem_signed : _GEN_3769; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3771 = 4'hb == value_1 ? uops_11_mem_signed : _GEN_3770; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3772 = 4'hc == value_1 ? uops_12_mem_signed : _GEN_3771; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3773 = 4'hd == value_1 ? uops_13_mem_signed : _GEN_3772; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3774 = 4'he == value_1 ? uops_14_mem_signed : _GEN_3773; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3777 = 4'h1 == value_1 ? uops_1_mem_size : uops_0_mem_size; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3778 = 4'h2 == value_1 ? uops_2_mem_size : _GEN_3777; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3779 = 4'h3 == value_1 ? uops_3_mem_size : _GEN_3778; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3780 = 4'h4 == value_1 ? uops_4_mem_size : _GEN_3779; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3781 = 4'h5 == value_1 ? uops_5_mem_size : _GEN_3780; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3782 = 4'h6 == value_1 ? uops_6_mem_size : _GEN_3781; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3783 = 4'h7 == value_1 ? uops_7_mem_size : _GEN_3782; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3784 = 4'h8 == value_1 ? uops_8_mem_size : _GEN_3783; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3785 = 4'h9 == value_1 ? uops_9_mem_size : _GEN_3784; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3786 = 4'ha == value_1 ? uops_10_mem_size : _GEN_3785; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3787 = 4'hb == value_1 ? uops_11_mem_size : _GEN_3786; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3788 = 4'hc == value_1 ? uops_12_mem_size : _GEN_3787; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3789 = 4'hd == value_1 ? uops_13_mem_size : _GEN_3788; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_3790 = 4'he == value_1 ? uops_14_mem_size : _GEN_3789; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3793 = 4'h1 == value_1 ? uops_1_mem_cmd : uops_0_mem_cmd; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3794 = 4'h2 == value_1 ? uops_2_mem_cmd : _GEN_3793; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3795 = 4'h3 == value_1 ? uops_3_mem_cmd : _GEN_3794; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3796 = 4'h4 == value_1 ? uops_4_mem_cmd : _GEN_3795; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3797 = 4'h5 == value_1 ? uops_5_mem_cmd : _GEN_3796; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3798 = 4'h6 == value_1 ? uops_6_mem_cmd : _GEN_3797; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3799 = 4'h7 == value_1 ? uops_7_mem_cmd : _GEN_3798; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3800 = 4'h8 == value_1 ? uops_8_mem_cmd : _GEN_3799; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3801 = 4'h9 == value_1 ? uops_9_mem_cmd : _GEN_3800; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3802 = 4'ha == value_1 ? uops_10_mem_cmd : _GEN_3801; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3803 = 4'hb == value_1 ? uops_11_mem_cmd : _GEN_3802; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3804 = 4'hc == value_1 ? uops_12_mem_cmd : _GEN_3803; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3805 = 4'hd == value_1 ? uops_13_mem_cmd : _GEN_3804; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3806 = 4'he == value_1 ? uops_14_mem_cmd : _GEN_3805; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3809 = 4'h1 == value_1 ? uops_1_bypassable : uops_0_bypassable; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3810 = 4'h2 == value_1 ? uops_2_bypassable : _GEN_3809; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3811 = 4'h3 == value_1 ? uops_3_bypassable : _GEN_3810; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3812 = 4'h4 == value_1 ? uops_4_bypassable : _GEN_3811; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3813 = 4'h5 == value_1 ? uops_5_bypassable : _GEN_3812; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3814 = 4'h6 == value_1 ? uops_6_bypassable : _GEN_3813; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3815 = 4'h7 == value_1 ? uops_7_bypassable : _GEN_3814; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3816 = 4'h8 == value_1 ? uops_8_bypassable : _GEN_3815; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3817 = 4'h9 == value_1 ? uops_9_bypassable : _GEN_3816; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3818 = 4'ha == value_1 ? uops_10_bypassable : _GEN_3817; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3819 = 4'hb == value_1 ? uops_11_bypassable : _GEN_3818; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3820 = 4'hc == value_1 ? uops_12_bypassable : _GEN_3819; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3821 = 4'hd == value_1 ? uops_13_bypassable : _GEN_3820; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3822 = 4'he == value_1 ? uops_14_bypassable : _GEN_3821; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3825 = 4'h1 == value_1 ? uops_1_exc_cause : uops_0_exc_cause; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3826 = 4'h2 == value_1 ? uops_2_exc_cause : _GEN_3825; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3827 = 4'h3 == value_1 ? uops_3_exc_cause : _GEN_3826; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3828 = 4'h4 == value_1 ? uops_4_exc_cause : _GEN_3827; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3829 = 4'h5 == value_1 ? uops_5_exc_cause : _GEN_3828; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3830 = 4'h6 == value_1 ? uops_6_exc_cause : _GEN_3829; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3831 = 4'h7 == value_1 ? uops_7_exc_cause : _GEN_3830; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3832 = 4'h8 == value_1 ? uops_8_exc_cause : _GEN_3831; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3833 = 4'h9 == value_1 ? uops_9_exc_cause : _GEN_3832; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3834 = 4'ha == value_1 ? uops_10_exc_cause : _GEN_3833; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3835 = 4'hb == value_1 ? uops_11_exc_cause : _GEN_3834; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3836 = 4'hc == value_1 ? uops_12_exc_cause : _GEN_3835; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3837 = 4'hd == value_1 ? uops_13_exc_cause : _GEN_3836; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_3838 = 4'he == value_1 ? uops_14_exc_cause : _GEN_3837; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3841 = 4'h1 == value_1 ? uops_1_exception : uops_0_exception; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3842 = 4'h2 == value_1 ? uops_2_exception : _GEN_3841; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3843 = 4'h3 == value_1 ? uops_3_exception : _GEN_3842; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3844 = 4'h4 == value_1 ? uops_4_exception : _GEN_3843; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3845 = 4'h5 == value_1 ? uops_5_exception : _GEN_3844; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3846 = 4'h6 == value_1 ? uops_6_exception : _GEN_3845; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3847 = 4'h7 == value_1 ? uops_7_exception : _GEN_3846; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3848 = 4'h8 == value_1 ? uops_8_exception : _GEN_3847; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3849 = 4'h9 == value_1 ? uops_9_exception : _GEN_3848; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3850 = 4'ha == value_1 ? uops_10_exception : _GEN_3849; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3851 = 4'hb == value_1 ? uops_11_exception : _GEN_3850; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3852 = 4'hc == value_1 ? uops_12_exception : _GEN_3851; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3853 = 4'hd == value_1 ? uops_13_exception : _GEN_3852; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3854 = 4'he == value_1 ? uops_14_exception : _GEN_3853; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3857 = 4'h1 == value_1 ? uops_1_stale_pdst : uops_0_stale_pdst; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3858 = 4'h2 == value_1 ? uops_2_stale_pdst : _GEN_3857; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3859 = 4'h3 == value_1 ? uops_3_stale_pdst : _GEN_3858; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3860 = 4'h4 == value_1 ? uops_4_stale_pdst : _GEN_3859; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3861 = 4'h5 == value_1 ? uops_5_stale_pdst : _GEN_3860; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3862 = 4'h6 == value_1 ? uops_6_stale_pdst : _GEN_3861; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3863 = 4'h7 == value_1 ? uops_7_stale_pdst : _GEN_3862; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3864 = 4'h8 == value_1 ? uops_8_stale_pdst : _GEN_3863; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3865 = 4'h9 == value_1 ? uops_9_stale_pdst : _GEN_3864; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3866 = 4'ha == value_1 ? uops_10_stale_pdst : _GEN_3865; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3867 = 4'hb == value_1 ? uops_11_stale_pdst : _GEN_3866; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3868 = 4'hc == value_1 ? uops_12_stale_pdst : _GEN_3867; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3869 = 4'hd == value_1 ? uops_13_stale_pdst : _GEN_3868; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3870 = 4'he == value_1 ? uops_14_stale_pdst : _GEN_3869; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3873 = 4'h1 == value_1 ? uops_1_ppred_busy : uops_0_ppred_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3874 = 4'h2 == value_1 ? uops_2_ppred_busy : _GEN_3873; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3875 = 4'h3 == value_1 ? uops_3_ppred_busy : _GEN_3874; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3876 = 4'h4 == value_1 ? uops_4_ppred_busy : _GEN_3875; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3877 = 4'h5 == value_1 ? uops_5_ppred_busy : _GEN_3876; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3878 = 4'h6 == value_1 ? uops_6_ppred_busy : _GEN_3877; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3879 = 4'h7 == value_1 ? uops_7_ppred_busy : _GEN_3878; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3880 = 4'h8 == value_1 ? uops_8_ppred_busy : _GEN_3879; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3881 = 4'h9 == value_1 ? uops_9_ppred_busy : _GEN_3880; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3882 = 4'ha == value_1 ? uops_10_ppred_busy : _GEN_3881; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3883 = 4'hb == value_1 ? uops_11_ppred_busy : _GEN_3882; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3884 = 4'hc == value_1 ? uops_12_ppred_busy : _GEN_3883; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3885 = 4'hd == value_1 ? uops_13_ppred_busy : _GEN_3884; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3886 = 4'he == value_1 ? uops_14_ppred_busy : _GEN_3885; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3889 = 4'h1 == value_1 ? uops_1_prs3_busy : uops_0_prs3_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3890 = 4'h2 == value_1 ? uops_2_prs3_busy : _GEN_3889; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3891 = 4'h3 == value_1 ? uops_3_prs3_busy : _GEN_3890; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3892 = 4'h4 == value_1 ? uops_4_prs3_busy : _GEN_3891; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3893 = 4'h5 == value_1 ? uops_5_prs3_busy : _GEN_3892; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3894 = 4'h6 == value_1 ? uops_6_prs3_busy : _GEN_3893; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3895 = 4'h7 == value_1 ? uops_7_prs3_busy : _GEN_3894; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3896 = 4'h8 == value_1 ? uops_8_prs3_busy : _GEN_3895; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3897 = 4'h9 == value_1 ? uops_9_prs3_busy : _GEN_3896; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3898 = 4'ha == value_1 ? uops_10_prs3_busy : _GEN_3897; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3899 = 4'hb == value_1 ? uops_11_prs3_busy : _GEN_3898; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3900 = 4'hc == value_1 ? uops_12_prs3_busy : _GEN_3899; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3901 = 4'hd == value_1 ? uops_13_prs3_busy : _GEN_3900; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3902 = 4'he == value_1 ? uops_14_prs3_busy : _GEN_3901; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3905 = 4'h1 == value_1 ? uops_1_prs2_busy : uops_0_prs2_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3906 = 4'h2 == value_1 ? uops_2_prs2_busy : _GEN_3905; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3907 = 4'h3 == value_1 ? uops_3_prs2_busy : _GEN_3906; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3908 = 4'h4 == value_1 ? uops_4_prs2_busy : _GEN_3907; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3909 = 4'h5 == value_1 ? uops_5_prs2_busy : _GEN_3908; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3910 = 4'h6 == value_1 ? uops_6_prs2_busy : _GEN_3909; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3911 = 4'h7 == value_1 ? uops_7_prs2_busy : _GEN_3910; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3912 = 4'h8 == value_1 ? uops_8_prs2_busy : _GEN_3911; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3913 = 4'h9 == value_1 ? uops_9_prs2_busy : _GEN_3912; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3914 = 4'ha == value_1 ? uops_10_prs2_busy : _GEN_3913; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3915 = 4'hb == value_1 ? uops_11_prs2_busy : _GEN_3914; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3916 = 4'hc == value_1 ? uops_12_prs2_busy : _GEN_3915; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3917 = 4'hd == value_1 ? uops_13_prs2_busy : _GEN_3916; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3918 = 4'he == value_1 ? uops_14_prs2_busy : _GEN_3917; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3921 = 4'h1 == value_1 ? uops_1_prs1_busy : uops_0_prs1_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3922 = 4'h2 == value_1 ? uops_2_prs1_busy : _GEN_3921; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3923 = 4'h3 == value_1 ? uops_3_prs1_busy : _GEN_3922; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3924 = 4'h4 == value_1 ? uops_4_prs1_busy : _GEN_3923; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3925 = 4'h5 == value_1 ? uops_5_prs1_busy : _GEN_3924; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3926 = 4'h6 == value_1 ? uops_6_prs1_busy : _GEN_3925; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3927 = 4'h7 == value_1 ? uops_7_prs1_busy : _GEN_3926; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3928 = 4'h8 == value_1 ? uops_8_prs1_busy : _GEN_3927; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3929 = 4'h9 == value_1 ? uops_9_prs1_busy : _GEN_3928; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3930 = 4'ha == value_1 ? uops_10_prs1_busy : _GEN_3929; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3931 = 4'hb == value_1 ? uops_11_prs1_busy : _GEN_3930; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3932 = 4'hc == value_1 ? uops_12_prs1_busy : _GEN_3931; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3933 = 4'hd == value_1 ? uops_13_prs1_busy : _GEN_3932; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_3934 = 4'he == value_1 ? uops_14_prs1_busy : _GEN_3933; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3937 = 4'h1 == value_1 ? uops_1_ppred : uops_0_ppred; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3938 = 4'h2 == value_1 ? uops_2_ppred : _GEN_3937; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3939 = 4'h3 == value_1 ? uops_3_ppred : _GEN_3938; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3940 = 4'h4 == value_1 ? uops_4_ppred : _GEN_3939; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3941 = 4'h5 == value_1 ? uops_5_ppred : _GEN_3940; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3942 = 4'h6 == value_1 ? uops_6_ppred : _GEN_3941; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3943 = 4'h7 == value_1 ? uops_7_ppred : _GEN_3942; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3944 = 4'h8 == value_1 ? uops_8_ppred : _GEN_3943; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3945 = 4'h9 == value_1 ? uops_9_ppred : _GEN_3944; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3946 = 4'ha == value_1 ? uops_10_ppred : _GEN_3945; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3947 = 4'hb == value_1 ? uops_11_ppred : _GEN_3946; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3948 = 4'hc == value_1 ? uops_12_ppred : _GEN_3947; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3949 = 4'hd == value_1 ? uops_13_ppred : _GEN_3948; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_3950 = 4'he == value_1 ? uops_14_ppred : _GEN_3949; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3953 = 4'h1 == value_1 ? uops_1_prs3 : uops_0_prs3; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3954 = 4'h2 == value_1 ? uops_2_prs3 : _GEN_3953; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3955 = 4'h3 == value_1 ? uops_3_prs3 : _GEN_3954; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3956 = 4'h4 == value_1 ? uops_4_prs3 : _GEN_3955; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3957 = 4'h5 == value_1 ? uops_5_prs3 : _GEN_3956; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3958 = 4'h6 == value_1 ? uops_6_prs3 : _GEN_3957; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3959 = 4'h7 == value_1 ? uops_7_prs3 : _GEN_3958; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3960 = 4'h8 == value_1 ? uops_8_prs3 : _GEN_3959; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3961 = 4'h9 == value_1 ? uops_9_prs3 : _GEN_3960; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3962 = 4'ha == value_1 ? uops_10_prs3 : _GEN_3961; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3963 = 4'hb == value_1 ? uops_11_prs3 : _GEN_3962; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3964 = 4'hc == value_1 ? uops_12_prs3 : _GEN_3963; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3965 = 4'hd == value_1 ? uops_13_prs3 : _GEN_3964; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3966 = 4'he == value_1 ? uops_14_prs3 : _GEN_3965; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3969 = 4'h1 == value_1 ? uops_1_prs2 : uops_0_prs2; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3970 = 4'h2 == value_1 ? uops_2_prs2 : _GEN_3969; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3971 = 4'h3 == value_1 ? uops_3_prs2 : _GEN_3970; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3972 = 4'h4 == value_1 ? uops_4_prs2 : _GEN_3971; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3973 = 4'h5 == value_1 ? uops_5_prs2 : _GEN_3972; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3974 = 4'h6 == value_1 ? uops_6_prs2 : _GEN_3973; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3975 = 4'h7 == value_1 ? uops_7_prs2 : _GEN_3974; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3976 = 4'h8 == value_1 ? uops_8_prs2 : _GEN_3975; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3977 = 4'h9 == value_1 ? uops_9_prs2 : _GEN_3976; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3978 = 4'ha == value_1 ? uops_10_prs2 : _GEN_3977; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3979 = 4'hb == value_1 ? uops_11_prs2 : _GEN_3978; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3980 = 4'hc == value_1 ? uops_12_prs2 : _GEN_3979; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3981 = 4'hd == value_1 ? uops_13_prs2 : _GEN_3980; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3982 = 4'he == value_1 ? uops_14_prs2 : _GEN_3981; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3985 = 4'h1 == value_1 ? uops_1_prs1 : uops_0_prs1; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3986 = 4'h2 == value_1 ? uops_2_prs1 : _GEN_3985; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3987 = 4'h3 == value_1 ? uops_3_prs1 : _GEN_3986; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3988 = 4'h4 == value_1 ? uops_4_prs1 : _GEN_3987; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3989 = 4'h5 == value_1 ? uops_5_prs1 : _GEN_3988; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3990 = 4'h6 == value_1 ? uops_6_prs1 : _GEN_3989; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3991 = 4'h7 == value_1 ? uops_7_prs1 : _GEN_3990; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3992 = 4'h8 == value_1 ? uops_8_prs1 : _GEN_3991; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3993 = 4'h9 == value_1 ? uops_9_prs1 : _GEN_3992; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3994 = 4'ha == value_1 ? uops_10_prs1 : _GEN_3993; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3995 = 4'hb == value_1 ? uops_11_prs1 : _GEN_3994; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3996 = 4'hc == value_1 ? uops_12_prs1 : _GEN_3995; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3997 = 4'hd == value_1 ? uops_13_prs1 : _GEN_3996; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_3998 = 4'he == value_1 ? uops_14_prs1 : _GEN_3997; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4001 = 4'h1 == value_1 ? uops_1_pdst : uops_0_pdst; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4002 = 4'h2 == value_1 ? uops_2_pdst : _GEN_4001; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4003 = 4'h3 == value_1 ? uops_3_pdst : _GEN_4002; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4004 = 4'h4 == value_1 ? uops_4_pdst : _GEN_4003; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4005 = 4'h5 == value_1 ? uops_5_pdst : _GEN_4004; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4006 = 4'h6 == value_1 ? uops_6_pdst : _GEN_4005; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4007 = 4'h7 == value_1 ? uops_7_pdst : _GEN_4006; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4008 = 4'h8 == value_1 ? uops_8_pdst : _GEN_4007; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4009 = 4'h9 == value_1 ? uops_9_pdst : _GEN_4008; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4010 = 4'ha == value_1 ? uops_10_pdst : _GEN_4009; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4011 = 4'hb == value_1 ? uops_11_pdst : _GEN_4010; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4012 = 4'hc == value_1 ? uops_12_pdst : _GEN_4011; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4013 = 4'hd == value_1 ? uops_13_pdst : _GEN_4012; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4014 = 4'he == value_1 ? uops_14_pdst : _GEN_4013; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4017 = 4'h1 == value_1 ? uops_1_rxq_idx : uops_0_rxq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4018 = 4'h2 == value_1 ? uops_2_rxq_idx : _GEN_4017; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4019 = 4'h3 == value_1 ? uops_3_rxq_idx : _GEN_4018; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4020 = 4'h4 == value_1 ? uops_4_rxq_idx : _GEN_4019; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4021 = 4'h5 == value_1 ? uops_5_rxq_idx : _GEN_4020; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4022 = 4'h6 == value_1 ? uops_6_rxq_idx : _GEN_4021; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4023 = 4'h7 == value_1 ? uops_7_rxq_idx : _GEN_4022; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4024 = 4'h8 == value_1 ? uops_8_rxq_idx : _GEN_4023; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4025 = 4'h9 == value_1 ? uops_9_rxq_idx : _GEN_4024; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4026 = 4'ha == value_1 ? uops_10_rxq_idx : _GEN_4025; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4027 = 4'hb == value_1 ? uops_11_rxq_idx : _GEN_4026; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4028 = 4'hc == value_1 ? uops_12_rxq_idx : _GEN_4027; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4029 = 4'hd == value_1 ? uops_13_rxq_idx : _GEN_4028; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4030 = 4'he == value_1 ? uops_14_rxq_idx : _GEN_4029; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4033 = 4'h1 == value_1 ? uops_1_stq_idx : uops_0_stq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4034 = 4'h2 == value_1 ? uops_2_stq_idx : _GEN_4033; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4035 = 4'h3 == value_1 ? uops_3_stq_idx : _GEN_4034; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4036 = 4'h4 == value_1 ? uops_4_stq_idx : _GEN_4035; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4037 = 4'h5 == value_1 ? uops_5_stq_idx : _GEN_4036; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4038 = 4'h6 == value_1 ? uops_6_stq_idx : _GEN_4037; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4039 = 4'h7 == value_1 ? uops_7_stq_idx : _GEN_4038; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4040 = 4'h8 == value_1 ? uops_8_stq_idx : _GEN_4039; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4041 = 4'h9 == value_1 ? uops_9_stq_idx : _GEN_4040; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4042 = 4'ha == value_1 ? uops_10_stq_idx : _GEN_4041; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4043 = 4'hb == value_1 ? uops_11_stq_idx : _GEN_4042; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4044 = 4'hc == value_1 ? uops_12_stq_idx : _GEN_4043; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4045 = 4'hd == value_1 ? uops_13_stq_idx : _GEN_4044; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4046 = 4'he == value_1 ? uops_14_stq_idx : _GEN_4045; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4049 = 4'h1 == value_1 ? uops_1_ldq_idx : uops_0_ldq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4050 = 4'h2 == value_1 ? uops_2_ldq_idx : _GEN_4049; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4051 = 4'h3 == value_1 ? uops_3_ldq_idx : _GEN_4050; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4052 = 4'h4 == value_1 ? uops_4_ldq_idx : _GEN_4051; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4053 = 4'h5 == value_1 ? uops_5_ldq_idx : _GEN_4052; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4054 = 4'h6 == value_1 ? uops_6_ldq_idx : _GEN_4053; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4055 = 4'h7 == value_1 ? uops_7_ldq_idx : _GEN_4054; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4056 = 4'h8 == value_1 ? uops_8_ldq_idx : _GEN_4055; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4057 = 4'h9 == value_1 ? uops_9_ldq_idx : _GEN_4056; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4058 = 4'ha == value_1 ? uops_10_ldq_idx : _GEN_4057; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4059 = 4'hb == value_1 ? uops_11_ldq_idx : _GEN_4058; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4060 = 4'hc == value_1 ? uops_12_ldq_idx : _GEN_4059; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4061 = 4'hd == value_1 ? uops_13_ldq_idx : _GEN_4060; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4062 = 4'he == value_1 ? uops_14_ldq_idx : _GEN_4061; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4065 = 4'h1 == value_1 ? uops_1_rob_idx : uops_0_rob_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4066 = 4'h2 == value_1 ? uops_2_rob_idx : _GEN_4065; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4067 = 4'h3 == value_1 ? uops_3_rob_idx : _GEN_4066; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4068 = 4'h4 == value_1 ? uops_4_rob_idx : _GEN_4067; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4069 = 4'h5 == value_1 ? uops_5_rob_idx : _GEN_4068; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4070 = 4'h6 == value_1 ? uops_6_rob_idx : _GEN_4069; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4071 = 4'h7 == value_1 ? uops_7_rob_idx : _GEN_4070; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4072 = 4'h8 == value_1 ? uops_8_rob_idx : _GEN_4071; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4073 = 4'h9 == value_1 ? uops_9_rob_idx : _GEN_4072; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4074 = 4'ha == value_1 ? uops_10_rob_idx : _GEN_4073; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4075 = 4'hb == value_1 ? uops_11_rob_idx : _GEN_4074; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4076 = 4'hc == value_1 ? uops_12_rob_idx : _GEN_4075; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4077 = 4'hd == value_1 ? uops_13_rob_idx : _GEN_4076; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4078 = 4'he == value_1 ? uops_14_rob_idx : _GEN_4077; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4081 = 4'h1 == value_1 ? uops_1_csr_addr : uops_0_csr_addr; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4082 = 4'h2 == value_1 ? uops_2_csr_addr : _GEN_4081; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4083 = 4'h3 == value_1 ? uops_3_csr_addr : _GEN_4082; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4084 = 4'h4 == value_1 ? uops_4_csr_addr : _GEN_4083; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4085 = 4'h5 == value_1 ? uops_5_csr_addr : _GEN_4084; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4086 = 4'h6 == value_1 ? uops_6_csr_addr : _GEN_4085; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4087 = 4'h7 == value_1 ? uops_7_csr_addr : _GEN_4086; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4088 = 4'h8 == value_1 ? uops_8_csr_addr : _GEN_4087; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4089 = 4'h9 == value_1 ? uops_9_csr_addr : _GEN_4088; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4090 = 4'ha == value_1 ? uops_10_csr_addr : _GEN_4089; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4091 = 4'hb == value_1 ? uops_11_csr_addr : _GEN_4090; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4092 = 4'hc == value_1 ? uops_12_csr_addr : _GEN_4091; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4093 = 4'hd == value_1 ? uops_13_csr_addr : _GEN_4092; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4094 = 4'he == value_1 ? uops_14_csr_addr : _GEN_4093; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4097 = 4'h1 == value_1 ? uops_1_imm_packed : uops_0_imm_packed; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4098 = 4'h2 == value_1 ? uops_2_imm_packed : _GEN_4097; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4099 = 4'h3 == value_1 ? uops_3_imm_packed : _GEN_4098; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4100 = 4'h4 == value_1 ? uops_4_imm_packed : _GEN_4099; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4101 = 4'h5 == value_1 ? uops_5_imm_packed : _GEN_4100; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4102 = 4'h6 == value_1 ? uops_6_imm_packed : _GEN_4101; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4103 = 4'h7 == value_1 ? uops_7_imm_packed : _GEN_4102; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4104 = 4'h8 == value_1 ? uops_8_imm_packed : _GEN_4103; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4105 = 4'h9 == value_1 ? uops_9_imm_packed : _GEN_4104; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4106 = 4'ha == value_1 ? uops_10_imm_packed : _GEN_4105; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4107 = 4'hb == value_1 ? uops_11_imm_packed : _GEN_4106; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4108 = 4'hc == value_1 ? uops_12_imm_packed : _GEN_4107; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4109 = 4'hd == value_1 ? uops_13_imm_packed : _GEN_4108; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_4110 = 4'he == value_1 ? uops_14_imm_packed : _GEN_4109; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4113 = 4'h1 == value_1 ? uops_1_taken : uops_0_taken; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4114 = 4'h2 == value_1 ? uops_2_taken : _GEN_4113; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4115 = 4'h3 == value_1 ? uops_3_taken : _GEN_4114; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4116 = 4'h4 == value_1 ? uops_4_taken : _GEN_4115; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4117 = 4'h5 == value_1 ? uops_5_taken : _GEN_4116; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4118 = 4'h6 == value_1 ? uops_6_taken : _GEN_4117; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4119 = 4'h7 == value_1 ? uops_7_taken : _GEN_4118; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4120 = 4'h8 == value_1 ? uops_8_taken : _GEN_4119; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4121 = 4'h9 == value_1 ? uops_9_taken : _GEN_4120; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4122 = 4'ha == value_1 ? uops_10_taken : _GEN_4121; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4123 = 4'hb == value_1 ? uops_11_taken : _GEN_4122; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4124 = 4'hc == value_1 ? uops_12_taken : _GEN_4123; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4125 = 4'hd == value_1 ? uops_13_taken : _GEN_4124; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4126 = 4'he == value_1 ? uops_14_taken : _GEN_4125; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4129 = 4'h1 == value_1 ? uops_1_pc_lob : uops_0_pc_lob; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4130 = 4'h2 == value_1 ? uops_2_pc_lob : _GEN_4129; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4131 = 4'h3 == value_1 ? uops_3_pc_lob : _GEN_4130; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4132 = 4'h4 == value_1 ? uops_4_pc_lob : _GEN_4131; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4133 = 4'h5 == value_1 ? uops_5_pc_lob : _GEN_4132; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4134 = 4'h6 == value_1 ? uops_6_pc_lob : _GEN_4133; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4135 = 4'h7 == value_1 ? uops_7_pc_lob : _GEN_4134; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4136 = 4'h8 == value_1 ? uops_8_pc_lob : _GEN_4135; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4137 = 4'h9 == value_1 ? uops_9_pc_lob : _GEN_4136; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4138 = 4'ha == value_1 ? uops_10_pc_lob : _GEN_4137; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4139 = 4'hb == value_1 ? uops_11_pc_lob : _GEN_4138; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4140 = 4'hc == value_1 ? uops_12_pc_lob : _GEN_4139; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4141 = 4'hd == value_1 ? uops_13_pc_lob : _GEN_4140; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4142 = 4'he == value_1 ? uops_14_pc_lob : _GEN_4141; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4145 = 4'h1 == value_1 ? uops_1_edge_inst : uops_0_edge_inst; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4146 = 4'h2 == value_1 ? uops_2_edge_inst : _GEN_4145; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4147 = 4'h3 == value_1 ? uops_3_edge_inst : _GEN_4146; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4148 = 4'h4 == value_1 ? uops_4_edge_inst : _GEN_4147; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4149 = 4'h5 == value_1 ? uops_5_edge_inst : _GEN_4148; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4150 = 4'h6 == value_1 ? uops_6_edge_inst : _GEN_4149; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4151 = 4'h7 == value_1 ? uops_7_edge_inst : _GEN_4150; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4152 = 4'h8 == value_1 ? uops_8_edge_inst : _GEN_4151; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4153 = 4'h9 == value_1 ? uops_9_edge_inst : _GEN_4152; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4154 = 4'ha == value_1 ? uops_10_edge_inst : _GEN_4153; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4155 = 4'hb == value_1 ? uops_11_edge_inst : _GEN_4154; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4156 = 4'hc == value_1 ? uops_12_edge_inst : _GEN_4155; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4157 = 4'hd == value_1 ? uops_13_edge_inst : _GEN_4156; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4158 = 4'he == value_1 ? uops_14_edge_inst : _GEN_4157; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4161 = 4'h1 == value_1 ? uops_1_ftq_idx : uops_0_ftq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4162 = 4'h2 == value_1 ? uops_2_ftq_idx : _GEN_4161; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4163 = 4'h3 == value_1 ? uops_3_ftq_idx : _GEN_4162; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4164 = 4'h4 == value_1 ? uops_4_ftq_idx : _GEN_4163; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4165 = 4'h5 == value_1 ? uops_5_ftq_idx : _GEN_4164; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4166 = 4'h6 == value_1 ? uops_6_ftq_idx : _GEN_4165; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4167 = 4'h7 == value_1 ? uops_7_ftq_idx : _GEN_4166; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4168 = 4'h8 == value_1 ? uops_8_ftq_idx : _GEN_4167; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4169 = 4'h9 == value_1 ? uops_9_ftq_idx : _GEN_4168; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4170 = 4'ha == value_1 ? uops_10_ftq_idx : _GEN_4169; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4171 = 4'hb == value_1 ? uops_11_ftq_idx : _GEN_4170; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4172 = 4'hc == value_1 ? uops_12_ftq_idx : _GEN_4171; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4173 = 4'hd == value_1 ? uops_13_ftq_idx : _GEN_4172; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_4174 = 4'he == value_1 ? uops_14_ftq_idx : _GEN_4173; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4177 = 4'h1 == value_1 ? uops_1_br_tag : uops_0_br_tag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4178 = 4'h2 == value_1 ? uops_2_br_tag : _GEN_4177; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4179 = 4'h3 == value_1 ? uops_3_br_tag : _GEN_4178; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4180 = 4'h4 == value_1 ? uops_4_br_tag : _GEN_4179; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4181 = 4'h5 == value_1 ? uops_5_br_tag : _GEN_4180; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4182 = 4'h6 == value_1 ? uops_6_br_tag : _GEN_4181; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4183 = 4'h7 == value_1 ? uops_7_br_tag : _GEN_4182; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4184 = 4'h8 == value_1 ? uops_8_br_tag : _GEN_4183; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4185 = 4'h9 == value_1 ? uops_9_br_tag : _GEN_4184; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4186 = 4'ha == value_1 ? uops_10_br_tag : _GEN_4185; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4187 = 4'hb == value_1 ? uops_11_br_tag : _GEN_4186; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4188 = 4'hc == value_1 ? uops_12_br_tag : _GEN_4187; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4189 = 4'hd == value_1 ? uops_13_br_tag : _GEN_4188; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4190 = 4'he == value_1 ? uops_14_br_tag : _GEN_4189; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4193 = 4'h1 == value_1 ? uops_1_br_mask : uops_0_br_mask; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4194 = 4'h2 == value_1 ? uops_2_br_mask : _GEN_4193; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4195 = 4'h3 == value_1 ? uops_3_br_mask : _GEN_4194; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4196 = 4'h4 == value_1 ? uops_4_br_mask : _GEN_4195; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4197 = 4'h5 == value_1 ? uops_5_br_mask : _GEN_4196; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4198 = 4'h6 == value_1 ? uops_6_br_mask : _GEN_4197; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4199 = 4'h7 == value_1 ? uops_7_br_mask : _GEN_4198; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4200 = 4'h8 == value_1 ? uops_8_br_mask : _GEN_4199; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4201 = 4'h9 == value_1 ? uops_9_br_mask : _GEN_4200; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4202 = 4'ha == value_1 ? uops_10_br_mask : _GEN_4201; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4203 = 4'hb == value_1 ? uops_11_br_mask : _GEN_4202; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4204 = 4'hc == value_1 ? uops_12_br_mask : _GEN_4203; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4205 = 4'hd == value_1 ? uops_13_br_mask : _GEN_4204; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_4206 = 4'he == value_1 ? uops_14_br_mask : _GEN_4205; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] out_uop_br_mask = 4'hf == value_1 ? uops_15_br_mask : _GEN_4206; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4209 = 4'h1 == value_1 ? uops_1_is_sfb : uops_0_is_sfb; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4210 = 4'h2 == value_1 ? uops_2_is_sfb : _GEN_4209; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4211 = 4'h3 == value_1 ? uops_3_is_sfb : _GEN_4210; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4212 = 4'h4 == value_1 ? uops_4_is_sfb : _GEN_4211; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4213 = 4'h5 == value_1 ? uops_5_is_sfb : _GEN_4212; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4214 = 4'h6 == value_1 ? uops_6_is_sfb : _GEN_4213; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4215 = 4'h7 == value_1 ? uops_7_is_sfb : _GEN_4214; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4216 = 4'h8 == value_1 ? uops_8_is_sfb : _GEN_4215; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4217 = 4'h9 == value_1 ? uops_9_is_sfb : _GEN_4216; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4218 = 4'ha == value_1 ? uops_10_is_sfb : _GEN_4217; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4219 = 4'hb == value_1 ? uops_11_is_sfb : _GEN_4218; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4220 = 4'hc == value_1 ? uops_12_is_sfb : _GEN_4219; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4221 = 4'hd == value_1 ? uops_13_is_sfb : _GEN_4220; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4222 = 4'he == value_1 ? uops_14_is_sfb : _GEN_4221; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4225 = 4'h1 == value_1 ? uops_1_is_jal : uops_0_is_jal; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4226 = 4'h2 == value_1 ? uops_2_is_jal : _GEN_4225; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4227 = 4'h3 == value_1 ? uops_3_is_jal : _GEN_4226; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4228 = 4'h4 == value_1 ? uops_4_is_jal : _GEN_4227; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4229 = 4'h5 == value_1 ? uops_5_is_jal : _GEN_4228; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4230 = 4'h6 == value_1 ? uops_6_is_jal : _GEN_4229; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4231 = 4'h7 == value_1 ? uops_7_is_jal : _GEN_4230; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4232 = 4'h8 == value_1 ? uops_8_is_jal : _GEN_4231; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4233 = 4'h9 == value_1 ? uops_9_is_jal : _GEN_4232; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4234 = 4'ha == value_1 ? uops_10_is_jal : _GEN_4233; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4235 = 4'hb == value_1 ? uops_11_is_jal : _GEN_4234; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4236 = 4'hc == value_1 ? uops_12_is_jal : _GEN_4235; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4237 = 4'hd == value_1 ? uops_13_is_jal : _GEN_4236; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4238 = 4'he == value_1 ? uops_14_is_jal : _GEN_4237; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4241 = 4'h1 == value_1 ? uops_1_is_jalr : uops_0_is_jalr; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4242 = 4'h2 == value_1 ? uops_2_is_jalr : _GEN_4241; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4243 = 4'h3 == value_1 ? uops_3_is_jalr : _GEN_4242; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4244 = 4'h4 == value_1 ? uops_4_is_jalr : _GEN_4243; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4245 = 4'h5 == value_1 ? uops_5_is_jalr : _GEN_4244; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4246 = 4'h6 == value_1 ? uops_6_is_jalr : _GEN_4245; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4247 = 4'h7 == value_1 ? uops_7_is_jalr : _GEN_4246; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4248 = 4'h8 == value_1 ? uops_8_is_jalr : _GEN_4247; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4249 = 4'h9 == value_1 ? uops_9_is_jalr : _GEN_4248; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4250 = 4'ha == value_1 ? uops_10_is_jalr : _GEN_4249; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4251 = 4'hb == value_1 ? uops_11_is_jalr : _GEN_4250; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4252 = 4'hc == value_1 ? uops_12_is_jalr : _GEN_4251; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4253 = 4'hd == value_1 ? uops_13_is_jalr : _GEN_4252; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4254 = 4'he == value_1 ? uops_14_is_jalr : _GEN_4253; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4257 = 4'h1 == value_1 ? uops_1_is_br : uops_0_is_br; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4258 = 4'h2 == value_1 ? uops_2_is_br : _GEN_4257; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4259 = 4'h3 == value_1 ? uops_3_is_br : _GEN_4258; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4260 = 4'h4 == value_1 ? uops_4_is_br : _GEN_4259; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4261 = 4'h5 == value_1 ? uops_5_is_br : _GEN_4260; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4262 = 4'h6 == value_1 ? uops_6_is_br : _GEN_4261; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4263 = 4'h7 == value_1 ? uops_7_is_br : _GEN_4262; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4264 = 4'h8 == value_1 ? uops_8_is_br : _GEN_4263; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4265 = 4'h9 == value_1 ? uops_9_is_br : _GEN_4264; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4266 = 4'ha == value_1 ? uops_10_is_br : _GEN_4265; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4267 = 4'hb == value_1 ? uops_11_is_br : _GEN_4266; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4268 = 4'hc == value_1 ? uops_12_is_br : _GEN_4267; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4269 = 4'hd == value_1 ? uops_13_is_br : _GEN_4268; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4270 = 4'he == value_1 ? uops_14_is_br : _GEN_4269; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4273 = 4'h1 == value_1 ? uops_1_iw_p2_poisoned : uops_0_iw_p2_poisoned; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4274 = 4'h2 == value_1 ? uops_2_iw_p2_poisoned : _GEN_4273; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4275 = 4'h3 == value_1 ? uops_3_iw_p2_poisoned : _GEN_4274; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4276 = 4'h4 == value_1 ? uops_4_iw_p2_poisoned : _GEN_4275; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4277 = 4'h5 == value_1 ? uops_5_iw_p2_poisoned : _GEN_4276; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4278 = 4'h6 == value_1 ? uops_6_iw_p2_poisoned : _GEN_4277; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4279 = 4'h7 == value_1 ? uops_7_iw_p2_poisoned : _GEN_4278; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4280 = 4'h8 == value_1 ? uops_8_iw_p2_poisoned : _GEN_4279; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4281 = 4'h9 == value_1 ? uops_9_iw_p2_poisoned : _GEN_4280; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4282 = 4'ha == value_1 ? uops_10_iw_p2_poisoned : _GEN_4281; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4283 = 4'hb == value_1 ? uops_11_iw_p2_poisoned : _GEN_4282; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4284 = 4'hc == value_1 ? uops_12_iw_p2_poisoned : _GEN_4283; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4285 = 4'hd == value_1 ? uops_13_iw_p2_poisoned : _GEN_4284; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4286 = 4'he == value_1 ? uops_14_iw_p2_poisoned : _GEN_4285; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4289 = 4'h1 == value_1 ? uops_1_iw_p1_poisoned : uops_0_iw_p1_poisoned; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4290 = 4'h2 == value_1 ? uops_2_iw_p1_poisoned : _GEN_4289; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4291 = 4'h3 == value_1 ? uops_3_iw_p1_poisoned : _GEN_4290; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4292 = 4'h4 == value_1 ? uops_4_iw_p1_poisoned : _GEN_4291; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4293 = 4'h5 == value_1 ? uops_5_iw_p1_poisoned : _GEN_4292; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4294 = 4'h6 == value_1 ? uops_6_iw_p1_poisoned : _GEN_4293; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4295 = 4'h7 == value_1 ? uops_7_iw_p1_poisoned : _GEN_4294; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4296 = 4'h8 == value_1 ? uops_8_iw_p1_poisoned : _GEN_4295; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4297 = 4'h9 == value_1 ? uops_9_iw_p1_poisoned : _GEN_4296; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4298 = 4'ha == value_1 ? uops_10_iw_p1_poisoned : _GEN_4297; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4299 = 4'hb == value_1 ? uops_11_iw_p1_poisoned : _GEN_4298; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4300 = 4'hc == value_1 ? uops_12_iw_p1_poisoned : _GEN_4299; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4301 = 4'hd == value_1 ? uops_13_iw_p1_poisoned : _GEN_4300; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4302 = 4'he == value_1 ? uops_14_iw_p1_poisoned : _GEN_4301; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4305 = 4'h1 == value_1 ? uops_1_iw_state : uops_0_iw_state; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4306 = 4'h2 == value_1 ? uops_2_iw_state : _GEN_4305; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4307 = 4'h3 == value_1 ? uops_3_iw_state : _GEN_4306; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4308 = 4'h4 == value_1 ? uops_4_iw_state : _GEN_4307; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4309 = 4'h5 == value_1 ? uops_5_iw_state : _GEN_4308; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4310 = 4'h6 == value_1 ? uops_6_iw_state : _GEN_4309; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4311 = 4'h7 == value_1 ? uops_7_iw_state : _GEN_4310; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4312 = 4'h8 == value_1 ? uops_8_iw_state : _GEN_4311; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4313 = 4'h9 == value_1 ? uops_9_iw_state : _GEN_4312; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4314 = 4'ha == value_1 ? uops_10_iw_state : _GEN_4313; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4315 = 4'hb == value_1 ? uops_11_iw_state : _GEN_4314; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4316 = 4'hc == value_1 ? uops_12_iw_state : _GEN_4315; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4317 = 4'hd == value_1 ? uops_13_iw_state : _GEN_4316; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4318 = 4'he == value_1 ? uops_14_iw_state : _GEN_4317; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4321 = 4'h1 == value_1 ? uops_1_ctrl_op3_sel : uops_0_ctrl_op3_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4322 = 4'h2 == value_1 ? uops_2_ctrl_op3_sel : _GEN_4321; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4323 = 4'h3 == value_1 ? uops_3_ctrl_op3_sel : _GEN_4322; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4324 = 4'h4 == value_1 ? uops_4_ctrl_op3_sel : _GEN_4323; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4325 = 4'h5 == value_1 ? uops_5_ctrl_op3_sel : _GEN_4324; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4326 = 4'h6 == value_1 ? uops_6_ctrl_op3_sel : _GEN_4325; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4327 = 4'h7 == value_1 ? uops_7_ctrl_op3_sel : _GEN_4326; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4328 = 4'h8 == value_1 ? uops_8_ctrl_op3_sel : _GEN_4327; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4329 = 4'h9 == value_1 ? uops_9_ctrl_op3_sel : _GEN_4328; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4330 = 4'ha == value_1 ? uops_10_ctrl_op3_sel : _GEN_4329; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4331 = 4'hb == value_1 ? uops_11_ctrl_op3_sel : _GEN_4330; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4332 = 4'hc == value_1 ? uops_12_ctrl_op3_sel : _GEN_4331; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4333 = 4'hd == value_1 ? uops_13_ctrl_op3_sel : _GEN_4332; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4334 = 4'he == value_1 ? uops_14_ctrl_op3_sel : _GEN_4333; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4337 = 4'h1 == value_1 ? uops_1_ctrl_is_std : uops_0_ctrl_is_std; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4338 = 4'h2 == value_1 ? uops_2_ctrl_is_std : _GEN_4337; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4339 = 4'h3 == value_1 ? uops_3_ctrl_is_std : _GEN_4338; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4340 = 4'h4 == value_1 ? uops_4_ctrl_is_std : _GEN_4339; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4341 = 4'h5 == value_1 ? uops_5_ctrl_is_std : _GEN_4340; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4342 = 4'h6 == value_1 ? uops_6_ctrl_is_std : _GEN_4341; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4343 = 4'h7 == value_1 ? uops_7_ctrl_is_std : _GEN_4342; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4344 = 4'h8 == value_1 ? uops_8_ctrl_is_std : _GEN_4343; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4345 = 4'h9 == value_1 ? uops_9_ctrl_is_std : _GEN_4344; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4346 = 4'ha == value_1 ? uops_10_ctrl_is_std : _GEN_4345; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4347 = 4'hb == value_1 ? uops_11_ctrl_is_std : _GEN_4346; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4348 = 4'hc == value_1 ? uops_12_ctrl_is_std : _GEN_4347; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4349 = 4'hd == value_1 ? uops_13_ctrl_is_std : _GEN_4348; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4350 = 4'he == value_1 ? uops_14_ctrl_is_std : _GEN_4349; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4353 = 4'h1 == value_1 ? uops_1_ctrl_is_sta : uops_0_ctrl_is_sta; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4354 = 4'h2 == value_1 ? uops_2_ctrl_is_sta : _GEN_4353; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4355 = 4'h3 == value_1 ? uops_3_ctrl_is_sta : _GEN_4354; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4356 = 4'h4 == value_1 ? uops_4_ctrl_is_sta : _GEN_4355; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4357 = 4'h5 == value_1 ? uops_5_ctrl_is_sta : _GEN_4356; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4358 = 4'h6 == value_1 ? uops_6_ctrl_is_sta : _GEN_4357; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4359 = 4'h7 == value_1 ? uops_7_ctrl_is_sta : _GEN_4358; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4360 = 4'h8 == value_1 ? uops_8_ctrl_is_sta : _GEN_4359; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4361 = 4'h9 == value_1 ? uops_9_ctrl_is_sta : _GEN_4360; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4362 = 4'ha == value_1 ? uops_10_ctrl_is_sta : _GEN_4361; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4363 = 4'hb == value_1 ? uops_11_ctrl_is_sta : _GEN_4362; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4364 = 4'hc == value_1 ? uops_12_ctrl_is_sta : _GEN_4363; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4365 = 4'hd == value_1 ? uops_13_ctrl_is_sta : _GEN_4364; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4366 = 4'he == value_1 ? uops_14_ctrl_is_sta : _GEN_4365; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4369 = 4'h1 == value_1 ? uops_1_ctrl_is_load : uops_0_ctrl_is_load; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4370 = 4'h2 == value_1 ? uops_2_ctrl_is_load : _GEN_4369; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4371 = 4'h3 == value_1 ? uops_3_ctrl_is_load : _GEN_4370; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4372 = 4'h4 == value_1 ? uops_4_ctrl_is_load : _GEN_4371; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4373 = 4'h5 == value_1 ? uops_5_ctrl_is_load : _GEN_4372; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4374 = 4'h6 == value_1 ? uops_6_ctrl_is_load : _GEN_4373; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4375 = 4'h7 == value_1 ? uops_7_ctrl_is_load : _GEN_4374; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4376 = 4'h8 == value_1 ? uops_8_ctrl_is_load : _GEN_4375; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4377 = 4'h9 == value_1 ? uops_9_ctrl_is_load : _GEN_4376; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4378 = 4'ha == value_1 ? uops_10_ctrl_is_load : _GEN_4377; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4379 = 4'hb == value_1 ? uops_11_ctrl_is_load : _GEN_4378; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4380 = 4'hc == value_1 ? uops_12_ctrl_is_load : _GEN_4379; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4381 = 4'hd == value_1 ? uops_13_ctrl_is_load : _GEN_4380; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4382 = 4'he == value_1 ? uops_14_ctrl_is_load : _GEN_4381; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4385 = 4'h1 == value_1 ? uops_1_ctrl_csr_cmd : uops_0_ctrl_csr_cmd; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4386 = 4'h2 == value_1 ? uops_2_ctrl_csr_cmd : _GEN_4385; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4387 = 4'h3 == value_1 ? uops_3_ctrl_csr_cmd : _GEN_4386; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4388 = 4'h4 == value_1 ? uops_4_ctrl_csr_cmd : _GEN_4387; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4389 = 4'h5 == value_1 ? uops_5_ctrl_csr_cmd : _GEN_4388; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4390 = 4'h6 == value_1 ? uops_6_ctrl_csr_cmd : _GEN_4389; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4391 = 4'h7 == value_1 ? uops_7_ctrl_csr_cmd : _GEN_4390; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4392 = 4'h8 == value_1 ? uops_8_ctrl_csr_cmd : _GEN_4391; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4393 = 4'h9 == value_1 ? uops_9_ctrl_csr_cmd : _GEN_4392; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4394 = 4'ha == value_1 ? uops_10_ctrl_csr_cmd : _GEN_4393; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4395 = 4'hb == value_1 ? uops_11_ctrl_csr_cmd : _GEN_4394; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4396 = 4'hc == value_1 ? uops_12_ctrl_csr_cmd : _GEN_4395; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4397 = 4'hd == value_1 ? uops_13_ctrl_csr_cmd : _GEN_4396; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4398 = 4'he == value_1 ? uops_14_ctrl_csr_cmd : _GEN_4397; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4401 = 4'h1 == value_1 ? uops_1_ctrl_fcn_dw : uops_0_ctrl_fcn_dw; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4402 = 4'h2 == value_1 ? uops_2_ctrl_fcn_dw : _GEN_4401; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4403 = 4'h3 == value_1 ? uops_3_ctrl_fcn_dw : _GEN_4402; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4404 = 4'h4 == value_1 ? uops_4_ctrl_fcn_dw : _GEN_4403; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4405 = 4'h5 == value_1 ? uops_5_ctrl_fcn_dw : _GEN_4404; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4406 = 4'h6 == value_1 ? uops_6_ctrl_fcn_dw : _GEN_4405; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4407 = 4'h7 == value_1 ? uops_7_ctrl_fcn_dw : _GEN_4406; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4408 = 4'h8 == value_1 ? uops_8_ctrl_fcn_dw : _GEN_4407; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4409 = 4'h9 == value_1 ? uops_9_ctrl_fcn_dw : _GEN_4408; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4410 = 4'ha == value_1 ? uops_10_ctrl_fcn_dw : _GEN_4409; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4411 = 4'hb == value_1 ? uops_11_ctrl_fcn_dw : _GEN_4410; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4412 = 4'hc == value_1 ? uops_12_ctrl_fcn_dw : _GEN_4411; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4413 = 4'hd == value_1 ? uops_13_ctrl_fcn_dw : _GEN_4412; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4414 = 4'he == value_1 ? uops_14_ctrl_fcn_dw : _GEN_4413; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4417 = 4'h1 == value_1 ? uops_1_ctrl_op_fcn : uops_0_ctrl_op_fcn; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4418 = 4'h2 == value_1 ? uops_2_ctrl_op_fcn : _GEN_4417; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4419 = 4'h3 == value_1 ? uops_3_ctrl_op_fcn : _GEN_4418; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4420 = 4'h4 == value_1 ? uops_4_ctrl_op_fcn : _GEN_4419; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4421 = 4'h5 == value_1 ? uops_5_ctrl_op_fcn : _GEN_4420; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4422 = 4'h6 == value_1 ? uops_6_ctrl_op_fcn : _GEN_4421; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4423 = 4'h7 == value_1 ? uops_7_ctrl_op_fcn : _GEN_4422; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4424 = 4'h8 == value_1 ? uops_8_ctrl_op_fcn : _GEN_4423; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4425 = 4'h9 == value_1 ? uops_9_ctrl_op_fcn : _GEN_4424; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4426 = 4'ha == value_1 ? uops_10_ctrl_op_fcn : _GEN_4425; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4427 = 4'hb == value_1 ? uops_11_ctrl_op_fcn : _GEN_4426; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4428 = 4'hc == value_1 ? uops_12_ctrl_op_fcn : _GEN_4427; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4429 = 4'hd == value_1 ? uops_13_ctrl_op_fcn : _GEN_4428; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4430 = 4'he == value_1 ? uops_14_ctrl_op_fcn : _GEN_4429; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4433 = 4'h1 == value_1 ? uops_1_ctrl_imm_sel : uops_0_ctrl_imm_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4434 = 4'h2 == value_1 ? uops_2_ctrl_imm_sel : _GEN_4433; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4435 = 4'h3 == value_1 ? uops_3_ctrl_imm_sel : _GEN_4434; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4436 = 4'h4 == value_1 ? uops_4_ctrl_imm_sel : _GEN_4435; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4437 = 4'h5 == value_1 ? uops_5_ctrl_imm_sel : _GEN_4436; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4438 = 4'h6 == value_1 ? uops_6_ctrl_imm_sel : _GEN_4437; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4439 = 4'h7 == value_1 ? uops_7_ctrl_imm_sel : _GEN_4438; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4440 = 4'h8 == value_1 ? uops_8_ctrl_imm_sel : _GEN_4439; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4441 = 4'h9 == value_1 ? uops_9_ctrl_imm_sel : _GEN_4440; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4442 = 4'ha == value_1 ? uops_10_ctrl_imm_sel : _GEN_4441; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4443 = 4'hb == value_1 ? uops_11_ctrl_imm_sel : _GEN_4442; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4444 = 4'hc == value_1 ? uops_12_ctrl_imm_sel : _GEN_4443; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4445 = 4'hd == value_1 ? uops_13_ctrl_imm_sel : _GEN_4444; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4446 = 4'he == value_1 ? uops_14_ctrl_imm_sel : _GEN_4445; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4449 = 4'h1 == value_1 ? uops_1_ctrl_op2_sel : uops_0_ctrl_op2_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4450 = 4'h2 == value_1 ? uops_2_ctrl_op2_sel : _GEN_4449; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4451 = 4'h3 == value_1 ? uops_3_ctrl_op2_sel : _GEN_4450; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4452 = 4'h4 == value_1 ? uops_4_ctrl_op2_sel : _GEN_4451; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4453 = 4'h5 == value_1 ? uops_5_ctrl_op2_sel : _GEN_4452; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4454 = 4'h6 == value_1 ? uops_6_ctrl_op2_sel : _GEN_4453; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4455 = 4'h7 == value_1 ? uops_7_ctrl_op2_sel : _GEN_4454; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4456 = 4'h8 == value_1 ? uops_8_ctrl_op2_sel : _GEN_4455; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4457 = 4'h9 == value_1 ? uops_9_ctrl_op2_sel : _GEN_4456; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4458 = 4'ha == value_1 ? uops_10_ctrl_op2_sel : _GEN_4457; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4459 = 4'hb == value_1 ? uops_11_ctrl_op2_sel : _GEN_4458; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4460 = 4'hc == value_1 ? uops_12_ctrl_op2_sel : _GEN_4459; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4461 = 4'hd == value_1 ? uops_13_ctrl_op2_sel : _GEN_4460; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4462 = 4'he == value_1 ? uops_14_ctrl_op2_sel : _GEN_4461; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4465 = 4'h1 == value_1 ? uops_1_ctrl_op1_sel : uops_0_ctrl_op1_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4466 = 4'h2 == value_1 ? uops_2_ctrl_op1_sel : _GEN_4465; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4467 = 4'h3 == value_1 ? uops_3_ctrl_op1_sel : _GEN_4466; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4468 = 4'h4 == value_1 ? uops_4_ctrl_op1_sel : _GEN_4467; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4469 = 4'h5 == value_1 ? uops_5_ctrl_op1_sel : _GEN_4468; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4470 = 4'h6 == value_1 ? uops_6_ctrl_op1_sel : _GEN_4469; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4471 = 4'h7 == value_1 ? uops_7_ctrl_op1_sel : _GEN_4470; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4472 = 4'h8 == value_1 ? uops_8_ctrl_op1_sel : _GEN_4471; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4473 = 4'h9 == value_1 ? uops_9_ctrl_op1_sel : _GEN_4472; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4474 = 4'ha == value_1 ? uops_10_ctrl_op1_sel : _GEN_4473; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4475 = 4'hb == value_1 ? uops_11_ctrl_op1_sel : _GEN_4474; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4476 = 4'hc == value_1 ? uops_12_ctrl_op1_sel : _GEN_4475; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4477 = 4'hd == value_1 ? uops_13_ctrl_op1_sel : _GEN_4476; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4478 = 4'he == value_1 ? uops_14_ctrl_op1_sel : _GEN_4477; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4481 = 4'h1 == value_1 ? uops_1_ctrl_br_type : uops_0_ctrl_br_type; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4482 = 4'h2 == value_1 ? uops_2_ctrl_br_type : _GEN_4481; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4483 = 4'h3 == value_1 ? uops_3_ctrl_br_type : _GEN_4482; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4484 = 4'h4 == value_1 ? uops_4_ctrl_br_type : _GEN_4483; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4485 = 4'h5 == value_1 ? uops_5_ctrl_br_type : _GEN_4484; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4486 = 4'h6 == value_1 ? uops_6_ctrl_br_type : _GEN_4485; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4487 = 4'h7 == value_1 ? uops_7_ctrl_br_type : _GEN_4486; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4488 = 4'h8 == value_1 ? uops_8_ctrl_br_type : _GEN_4487; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4489 = 4'h9 == value_1 ? uops_9_ctrl_br_type : _GEN_4488; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4490 = 4'ha == value_1 ? uops_10_ctrl_br_type : _GEN_4489; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4491 = 4'hb == value_1 ? uops_11_ctrl_br_type : _GEN_4490; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4492 = 4'hc == value_1 ? uops_12_ctrl_br_type : _GEN_4491; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4493 = 4'hd == value_1 ? uops_13_ctrl_br_type : _GEN_4492; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4494 = 4'he == value_1 ? uops_14_ctrl_br_type : _GEN_4493; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4497 = 4'h1 == value_1 ? uops_1_fu_code : uops_0_fu_code; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4498 = 4'h2 == value_1 ? uops_2_fu_code : _GEN_4497; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4499 = 4'h3 == value_1 ? uops_3_fu_code : _GEN_4498; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4500 = 4'h4 == value_1 ? uops_4_fu_code : _GEN_4499; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4501 = 4'h5 == value_1 ? uops_5_fu_code : _GEN_4500; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4502 = 4'h6 == value_1 ? uops_6_fu_code : _GEN_4501; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4503 = 4'h7 == value_1 ? uops_7_fu_code : _GEN_4502; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4504 = 4'h8 == value_1 ? uops_8_fu_code : _GEN_4503; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4505 = 4'h9 == value_1 ? uops_9_fu_code : _GEN_4504; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4506 = 4'ha == value_1 ? uops_10_fu_code : _GEN_4505; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4507 = 4'hb == value_1 ? uops_11_fu_code : _GEN_4506; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4508 = 4'hc == value_1 ? uops_12_fu_code : _GEN_4507; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4509 = 4'hd == value_1 ? uops_13_fu_code : _GEN_4508; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_4510 = 4'he == value_1 ? uops_14_fu_code : _GEN_4509; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4513 = 4'h1 == value_1 ? uops_1_iq_type : uops_0_iq_type; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4514 = 4'h2 == value_1 ? uops_2_iq_type : _GEN_4513; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4515 = 4'h3 == value_1 ? uops_3_iq_type : _GEN_4514; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4516 = 4'h4 == value_1 ? uops_4_iq_type : _GEN_4515; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4517 = 4'h5 == value_1 ? uops_5_iq_type : _GEN_4516; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4518 = 4'h6 == value_1 ? uops_6_iq_type : _GEN_4517; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4519 = 4'h7 == value_1 ? uops_7_iq_type : _GEN_4518; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4520 = 4'h8 == value_1 ? uops_8_iq_type : _GEN_4519; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4521 = 4'h9 == value_1 ? uops_9_iq_type : _GEN_4520; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4522 = 4'ha == value_1 ? uops_10_iq_type : _GEN_4521; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4523 = 4'hb == value_1 ? uops_11_iq_type : _GEN_4522; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4524 = 4'hc == value_1 ? uops_12_iq_type : _GEN_4523; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4525 = 4'hd == value_1 ? uops_13_iq_type : _GEN_4524; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4526 = 4'he == value_1 ? uops_14_iq_type : _GEN_4525; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4529 = 4'h1 == value_1 ? uops_1_debug_pc : uops_0_debug_pc; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4530 = 4'h2 == value_1 ? uops_2_debug_pc : _GEN_4529; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4531 = 4'h3 == value_1 ? uops_3_debug_pc : _GEN_4530; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4532 = 4'h4 == value_1 ? uops_4_debug_pc : _GEN_4531; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4533 = 4'h5 == value_1 ? uops_5_debug_pc : _GEN_4532; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4534 = 4'h6 == value_1 ? uops_6_debug_pc : _GEN_4533; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4535 = 4'h7 == value_1 ? uops_7_debug_pc : _GEN_4534; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4536 = 4'h8 == value_1 ? uops_8_debug_pc : _GEN_4535; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4537 = 4'h9 == value_1 ? uops_9_debug_pc : _GEN_4536; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4538 = 4'ha == value_1 ? uops_10_debug_pc : _GEN_4537; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4539 = 4'hb == value_1 ? uops_11_debug_pc : _GEN_4538; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4540 = 4'hc == value_1 ? uops_12_debug_pc : _GEN_4539; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4541 = 4'hd == value_1 ? uops_13_debug_pc : _GEN_4540; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_4542 = 4'he == value_1 ? uops_14_debug_pc : _GEN_4541; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4545 = 4'h1 == value_1 ? uops_1_is_rvc : uops_0_is_rvc; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4546 = 4'h2 == value_1 ? uops_2_is_rvc : _GEN_4545; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4547 = 4'h3 == value_1 ? uops_3_is_rvc : _GEN_4546; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4548 = 4'h4 == value_1 ? uops_4_is_rvc : _GEN_4547; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4549 = 4'h5 == value_1 ? uops_5_is_rvc : _GEN_4548; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4550 = 4'h6 == value_1 ? uops_6_is_rvc : _GEN_4549; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4551 = 4'h7 == value_1 ? uops_7_is_rvc : _GEN_4550; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4552 = 4'h8 == value_1 ? uops_8_is_rvc : _GEN_4551; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4553 = 4'h9 == value_1 ? uops_9_is_rvc : _GEN_4552; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4554 = 4'ha == value_1 ? uops_10_is_rvc : _GEN_4553; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4555 = 4'hb == value_1 ? uops_11_is_rvc : _GEN_4554; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4556 = 4'hc == value_1 ? uops_12_is_rvc : _GEN_4555; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4557 = 4'hd == value_1 ? uops_13_is_rvc : _GEN_4556; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4558 = 4'he == value_1 ? uops_14_is_rvc : _GEN_4557; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4561 = 4'h1 == value_1 ? uops_1_debug_inst : uops_0_debug_inst; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4562 = 4'h2 == value_1 ? uops_2_debug_inst : _GEN_4561; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4563 = 4'h3 == value_1 ? uops_3_debug_inst : _GEN_4562; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4564 = 4'h4 == value_1 ? uops_4_debug_inst : _GEN_4563; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4565 = 4'h5 == value_1 ? uops_5_debug_inst : _GEN_4564; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4566 = 4'h6 == value_1 ? uops_6_debug_inst : _GEN_4565; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4567 = 4'h7 == value_1 ? uops_7_debug_inst : _GEN_4566; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4568 = 4'h8 == value_1 ? uops_8_debug_inst : _GEN_4567; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4569 = 4'h9 == value_1 ? uops_9_debug_inst : _GEN_4568; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4570 = 4'ha == value_1 ? uops_10_debug_inst : _GEN_4569; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4571 = 4'hb == value_1 ? uops_11_debug_inst : _GEN_4570; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4572 = 4'hc == value_1 ? uops_12_debug_inst : _GEN_4571; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4573 = 4'hd == value_1 ? uops_13_debug_inst : _GEN_4572; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4574 = 4'he == value_1 ? uops_14_debug_inst : _GEN_4573; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4577 = 4'h1 == value_1 ? uops_1_inst : uops_0_inst; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4578 = 4'h2 == value_1 ? uops_2_inst : _GEN_4577; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4579 = 4'h3 == value_1 ? uops_3_inst : _GEN_4578; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4580 = 4'h4 == value_1 ? uops_4_inst : _GEN_4579; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4581 = 4'h5 == value_1 ? uops_5_inst : _GEN_4580; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4582 = 4'h6 == value_1 ? uops_6_inst : _GEN_4581; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4583 = 4'h7 == value_1 ? uops_7_inst : _GEN_4582; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4584 = 4'h8 == value_1 ? uops_8_inst : _GEN_4583; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4585 = 4'h9 == value_1 ? uops_9_inst : _GEN_4584; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4586 = 4'ha == value_1 ? uops_10_inst : _GEN_4585; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4587 = 4'hb == value_1 ? uops_11_inst : _GEN_4586; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4588 = 4'hc == value_1 ? uops_12_inst : _GEN_4587; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4589 = 4'hd == value_1 ? uops_13_inst : _GEN_4588; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_4590 = 4'he == value_1 ? uops_14_inst : _GEN_4589; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4593 = 4'h1 == value_1 ? uops_1_uopc : uops_0_uopc; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4594 = 4'h2 == value_1 ? uops_2_uopc : _GEN_4593; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4595 = 4'h3 == value_1 ? uops_3_uopc : _GEN_4594; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4596 = 4'h4 == value_1 ? uops_4_uopc : _GEN_4595; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4597 = 4'h5 == value_1 ? uops_5_uopc : _GEN_4596; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4598 = 4'h6 == value_1 ? uops_6_uopc : _GEN_4597; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4599 = 4'h7 == value_1 ? uops_7_uopc : _GEN_4598; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4600 = 4'h8 == value_1 ? uops_8_uopc : _GEN_4599; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4601 = 4'h9 == value_1 ? uops_9_uopc : _GEN_4600; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4602 = 4'ha == value_1 ? uops_10_uopc : _GEN_4601; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4603 = 4'hb == value_1 ? uops_11_uopc : _GEN_4602; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4604 = 4'hc == value_1 ? uops_12_uopc : _GEN_4603; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4605 = 4'hd == value_1 ? uops_13_uopc : _GEN_4604; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_4606 = 4'he == value_1 ? uops_14_uopc : _GEN_4605; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4609 = 4'h1 == value_1 ? uops_1_address_num : uops_0_address_num; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4610 = 4'h2 == value_1 ? uops_2_address_num : _GEN_4609; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4611 = 4'h3 == value_1 ? uops_3_address_num : _GEN_4610; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4612 = 4'h4 == value_1 ? uops_4_address_num : _GEN_4611; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4613 = 4'h5 == value_1 ? uops_5_address_num : _GEN_4612; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4614 = 4'h6 == value_1 ? uops_6_address_num : _GEN_4613; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4615 = 4'h7 == value_1 ? uops_7_address_num : _GEN_4614; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4616 = 4'h8 == value_1 ? uops_8_address_num : _GEN_4615; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4617 = 4'h9 == value_1 ? uops_9_address_num : _GEN_4616; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4618 = 4'ha == value_1 ? uops_10_address_num : _GEN_4617; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4619 = 4'hb == value_1 ? uops_11_address_num : _GEN_4618; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4620 = 4'hc == value_1 ? uops_12_address_num : _GEN_4619; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4621 = 4'hd == value_1 ? uops_13_address_num : _GEN_4620; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4622 = 4'he == value_1 ? uops_14_address_num : _GEN_4621; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4625 = 4'h1 == value_1 ? uops_1_rob_inst_idx : uops_0_rob_inst_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4626 = 4'h2 == value_1 ? uops_2_rob_inst_idx : _GEN_4625; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4627 = 4'h3 == value_1 ? uops_3_rob_inst_idx : _GEN_4626; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4628 = 4'h4 == value_1 ? uops_4_rob_inst_idx : _GEN_4627; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4629 = 4'h5 == value_1 ? uops_5_rob_inst_idx : _GEN_4628; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4630 = 4'h6 == value_1 ? uops_6_rob_inst_idx : _GEN_4629; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4631 = 4'h7 == value_1 ? uops_7_rob_inst_idx : _GEN_4630; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4632 = 4'h8 == value_1 ? uops_8_rob_inst_idx : _GEN_4631; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4633 = 4'h9 == value_1 ? uops_9_rob_inst_idx : _GEN_4632; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4634 = 4'ha == value_1 ? uops_10_rob_inst_idx : _GEN_4633; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4635 = 4'hb == value_1 ? uops_11_rob_inst_idx : _GEN_4634; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4636 = 4'hc == value_1 ? uops_12_rob_inst_idx : _GEN_4635; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4637 = 4'hd == value_1 ? uops_13_rob_inst_idx : _GEN_4636; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4638 = 4'he == value_1 ? uops_14_rob_inst_idx : _GEN_4637; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4641 = 4'h1 == value_1 ? uops_1_self_index : uops_0_self_index; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4642 = 4'h2 == value_1 ? uops_2_self_index : _GEN_4641; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4643 = 4'h3 == value_1 ? uops_3_self_index : _GEN_4642; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4644 = 4'h4 == value_1 ? uops_4_self_index : _GEN_4643; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4645 = 4'h5 == value_1 ? uops_5_self_index : _GEN_4644; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4646 = 4'h6 == value_1 ? uops_6_self_index : _GEN_4645; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4647 = 4'h7 == value_1 ? uops_7_self_index : _GEN_4646; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4648 = 4'h8 == value_1 ? uops_8_self_index : _GEN_4647; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4649 = 4'h9 == value_1 ? uops_9_self_index : _GEN_4648; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4650 = 4'ha == value_1 ? uops_10_self_index : _GEN_4649; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4651 = 4'hb == value_1 ? uops_11_self_index : _GEN_4650; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4652 = 4'hc == value_1 ? uops_12_self_index : _GEN_4651; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4653 = 4'hd == value_1 ? uops_13_self_index : _GEN_4652; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4654 = 4'he == value_1 ? uops_14_self_index : _GEN_4653; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4657 = 4'h1 == value_1 ? uops_1_split_num : uops_0_split_num; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4658 = 4'h2 == value_1 ? uops_2_split_num : _GEN_4657; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4659 = 4'h3 == value_1 ? uops_3_split_num : _GEN_4658; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4660 = 4'h4 == value_1 ? uops_4_split_num : _GEN_4659; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4661 = 4'h5 == value_1 ? uops_5_split_num : _GEN_4660; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4662 = 4'h6 == value_1 ? uops_6_split_num : _GEN_4661; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4663 = 4'h7 == value_1 ? uops_7_split_num : _GEN_4662; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4664 = 4'h8 == value_1 ? uops_8_split_num : _GEN_4663; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4665 = 4'h9 == value_1 ? uops_9_split_num : _GEN_4664; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4666 = 4'ha == value_1 ? uops_10_split_num : _GEN_4665; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4667 = 4'hb == value_1 ? uops_11_split_num : _GEN_4666; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4668 = 4'hc == value_1 ? uops_12_split_num : _GEN_4667; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4669 = 4'hd == value_1 ? uops_13_split_num : _GEN_4668; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_4670 = 4'he == value_1 ? uops_14_split_num : _GEN_4669; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4673 = 4'h1 == value_1 ? uops_1_op2_sel : uops_0_op2_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4674 = 4'h2 == value_1 ? uops_2_op2_sel : _GEN_4673; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4675 = 4'h3 == value_1 ? uops_3_op2_sel : _GEN_4674; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4676 = 4'h4 == value_1 ? uops_4_op2_sel : _GEN_4675; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4677 = 4'h5 == value_1 ? uops_5_op2_sel : _GEN_4676; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4678 = 4'h6 == value_1 ? uops_6_op2_sel : _GEN_4677; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4679 = 4'h7 == value_1 ? uops_7_op2_sel : _GEN_4678; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4680 = 4'h8 == value_1 ? uops_8_op2_sel : _GEN_4679; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4681 = 4'h9 == value_1 ? uops_9_op2_sel : _GEN_4680; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4682 = 4'ha == value_1 ? uops_10_op2_sel : _GEN_4681; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4683 = 4'hb == value_1 ? uops_11_op2_sel : _GEN_4682; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4684 = 4'hc == value_1 ? uops_12_op2_sel : _GEN_4683; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4685 = 4'hd == value_1 ? uops_13_op2_sel : _GEN_4684; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4686 = 4'he == value_1 ? uops_14_op2_sel : _GEN_4685; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4689 = 4'h1 == value_1 ? uops_1_op1_sel : uops_0_op1_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4690 = 4'h2 == value_1 ? uops_2_op1_sel : _GEN_4689; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4691 = 4'h3 == value_1 ? uops_3_op1_sel : _GEN_4690; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4692 = 4'h4 == value_1 ? uops_4_op1_sel : _GEN_4691; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4693 = 4'h5 == value_1 ? uops_5_op1_sel : _GEN_4692; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4694 = 4'h6 == value_1 ? uops_6_op1_sel : _GEN_4693; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4695 = 4'h7 == value_1 ? uops_7_op1_sel : _GEN_4694; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4696 = 4'h8 == value_1 ? uops_8_op1_sel : _GEN_4695; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4697 = 4'h9 == value_1 ? uops_9_op1_sel : _GEN_4696; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4698 = 4'ha == value_1 ? uops_10_op1_sel : _GEN_4697; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4699 = 4'hb == value_1 ? uops_11_op1_sel : _GEN_4698; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4700 = 4'hc == value_1 ? uops_12_op1_sel : _GEN_4699; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4701 = 4'hd == value_1 ? uops_13_op1_sel : _GEN_4700; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4702 = 4'he == value_1 ? uops_14_op1_sel : _GEN_4701; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4705 = 4'h1 == value_1 ? uops_1_stale_pflag : uops_0_stale_pflag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4706 = 4'h2 == value_1 ? uops_2_stale_pflag : _GEN_4705; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4707 = 4'h3 == value_1 ? uops_3_stale_pflag : _GEN_4706; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4708 = 4'h4 == value_1 ? uops_4_stale_pflag : _GEN_4707; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4709 = 4'h5 == value_1 ? uops_5_stale_pflag : _GEN_4708; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4710 = 4'h6 == value_1 ? uops_6_stale_pflag : _GEN_4709; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4711 = 4'h7 == value_1 ? uops_7_stale_pflag : _GEN_4710; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4712 = 4'h8 == value_1 ? uops_8_stale_pflag : _GEN_4711; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4713 = 4'h9 == value_1 ? uops_9_stale_pflag : _GEN_4712; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4714 = 4'ha == value_1 ? uops_10_stale_pflag : _GEN_4713; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4715 = 4'hb == value_1 ? uops_11_stale_pflag : _GEN_4714; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4716 = 4'hc == value_1 ? uops_12_stale_pflag : _GEN_4715; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4717 = 4'hd == value_1 ? uops_13_stale_pflag : _GEN_4716; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4718 = 4'he == value_1 ? uops_14_stale_pflag : _GEN_4717; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4721 = 4'h1 == value_1 ? uops_1_pflag_busy : uops_0_pflag_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4722 = 4'h2 == value_1 ? uops_2_pflag_busy : _GEN_4721; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4723 = 4'h3 == value_1 ? uops_3_pflag_busy : _GEN_4722; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4724 = 4'h4 == value_1 ? uops_4_pflag_busy : _GEN_4723; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4725 = 4'h5 == value_1 ? uops_5_pflag_busy : _GEN_4724; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4726 = 4'h6 == value_1 ? uops_6_pflag_busy : _GEN_4725; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4727 = 4'h7 == value_1 ? uops_7_pflag_busy : _GEN_4726; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4728 = 4'h8 == value_1 ? uops_8_pflag_busy : _GEN_4727; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4729 = 4'h9 == value_1 ? uops_9_pflag_busy : _GEN_4728; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4730 = 4'ha == value_1 ? uops_10_pflag_busy : _GEN_4729; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4731 = 4'hb == value_1 ? uops_11_pflag_busy : _GEN_4730; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4732 = 4'hc == value_1 ? uops_12_pflag_busy : _GEN_4731; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4733 = 4'hd == value_1 ? uops_13_pflag_busy : _GEN_4732; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4734 = 4'he == value_1 ? uops_14_pflag_busy : _GEN_4733; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4737 = 4'h1 == value_1 ? uops_1_pwflag : uops_0_pwflag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4738 = 4'h2 == value_1 ? uops_2_pwflag : _GEN_4737; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4739 = 4'h3 == value_1 ? uops_3_pwflag : _GEN_4738; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4740 = 4'h4 == value_1 ? uops_4_pwflag : _GEN_4739; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4741 = 4'h5 == value_1 ? uops_5_pwflag : _GEN_4740; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4742 = 4'h6 == value_1 ? uops_6_pwflag : _GEN_4741; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4743 = 4'h7 == value_1 ? uops_7_pwflag : _GEN_4742; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4744 = 4'h8 == value_1 ? uops_8_pwflag : _GEN_4743; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4745 = 4'h9 == value_1 ? uops_9_pwflag : _GEN_4744; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4746 = 4'ha == value_1 ? uops_10_pwflag : _GEN_4745; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4747 = 4'hb == value_1 ? uops_11_pwflag : _GEN_4746; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4748 = 4'hc == value_1 ? uops_12_pwflag : _GEN_4747; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4749 = 4'hd == value_1 ? uops_13_pwflag : _GEN_4748; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4750 = 4'he == value_1 ? uops_14_pwflag : _GEN_4749; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4753 = 4'h1 == value_1 ? uops_1_prflag : uops_0_prflag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4754 = 4'h2 == value_1 ? uops_2_prflag : _GEN_4753; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4755 = 4'h3 == value_1 ? uops_3_prflag : _GEN_4754; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4756 = 4'h4 == value_1 ? uops_4_prflag : _GEN_4755; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4757 = 4'h5 == value_1 ? uops_5_prflag : _GEN_4756; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4758 = 4'h6 == value_1 ? uops_6_prflag : _GEN_4757; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4759 = 4'h7 == value_1 ? uops_7_prflag : _GEN_4758; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4760 = 4'h8 == value_1 ? uops_8_prflag : _GEN_4759; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4761 = 4'h9 == value_1 ? uops_9_prflag : _GEN_4760; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4762 = 4'ha == value_1 ? uops_10_prflag : _GEN_4761; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4763 = 4'hb == value_1 ? uops_11_prflag : _GEN_4762; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4764 = 4'hc == value_1 ? uops_12_prflag : _GEN_4763; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4765 = 4'hd == value_1 ? uops_13_prflag : _GEN_4764; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_4766 = 4'he == value_1 ? uops_14_prflag : _GEN_4765; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4769 = 4'h1 == value_1 ? uops_1_wflag : uops_0_wflag; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4770 = 4'h2 == value_1 ? uops_2_wflag : _GEN_4769; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4771 = 4'h3 == value_1 ? uops_3_wflag : _GEN_4770; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4772 = 4'h4 == value_1 ? uops_4_wflag : _GEN_4771; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4773 = 4'h5 == value_1 ? uops_5_wflag : _GEN_4772; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4774 = 4'h6 == value_1 ? uops_6_wflag : _GEN_4773; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4775 = 4'h7 == value_1 ? uops_7_wflag : _GEN_4774; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4776 = 4'h8 == value_1 ? uops_8_wflag : _GEN_4775; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4777 = 4'h9 == value_1 ? uops_9_wflag : _GEN_4776; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4778 = 4'ha == value_1 ? uops_10_wflag : _GEN_4777; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4779 = 4'hb == value_1 ? uops_11_wflag : _GEN_4778; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4780 = 4'hc == value_1 ? uops_12_wflag : _GEN_4779; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4781 = 4'hd == value_1 ? uops_13_wflag : _GEN_4780; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4782 = 4'he == value_1 ? uops_14_wflag : _GEN_4781; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4785 = 4'h1 == value_1 ? uops_1_rflag : uops_0_rflag; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4786 = 4'h2 == value_1 ? uops_2_rflag : _GEN_4785; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4787 = 4'h3 == value_1 ? uops_3_rflag : _GEN_4786; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4788 = 4'h4 == value_1 ? uops_4_rflag : _GEN_4787; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4789 = 4'h5 == value_1 ? uops_5_rflag : _GEN_4788; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4790 = 4'h6 == value_1 ? uops_6_rflag : _GEN_4789; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4791 = 4'h7 == value_1 ? uops_7_rflag : _GEN_4790; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4792 = 4'h8 == value_1 ? uops_8_rflag : _GEN_4791; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4793 = 4'h9 == value_1 ? uops_9_rflag : _GEN_4792; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4794 = 4'ha == value_1 ? uops_10_rflag : _GEN_4793; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4795 = 4'hb == value_1 ? uops_11_rflag : _GEN_4794; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4796 = 4'hc == value_1 ? uops_12_rflag : _GEN_4795; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4797 = 4'hd == value_1 ? uops_13_rflag : _GEN_4796; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4798 = 4'he == value_1 ? uops_14_rflag : _GEN_4797; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4801 = 4'h1 == value_1 ? uops_1_lrs3_rtype : uops_0_lrs3_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4802 = 4'h2 == value_1 ? uops_2_lrs3_rtype : _GEN_4801; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4803 = 4'h3 == value_1 ? uops_3_lrs3_rtype : _GEN_4802; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4804 = 4'h4 == value_1 ? uops_4_lrs3_rtype : _GEN_4803; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4805 = 4'h5 == value_1 ? uops_5_lrs3_rtype : _GEN_4804; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4806 = 4'h6 == value_1 ? uops_6_lrs3_rtype : _GEN_4805; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4807 = 4'h7 == value_1 ? uops_7_lrs3_rtype : _GEN_4806; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4808 = 4'h8 == value_1 ? uops_8_lrs3_rtype : _GEN_4807; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4809 = 4'h9 == value_1 ? uops_9_lrs3_rtype : _GEN_4808; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4810 = 4'ha == value_1 ? uops_10_lrs3_rtype : _GEN_4809; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4811 = 4'hb == value_1 ? uops_11_lrs3_rtype : _GEN_4810; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4812 = 4'hc == value_1 ? uops_12_lrs3_rtype : _GEN_4811; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4813 = 4'hd == value_1 ? uops_13_lrs3_rtype : _GEN_4812; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_4814 = 4'he == value_1 ? uops_14_lrs3_rtype : _GEN_4813; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4817 = 4'h1 == value_1 ? uops_1_shift : uops_0_shift; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4818 = 4'h2 == value_1 ? uops_2_shift : _GEN_4817; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4819 = 4'h3 == value_1 ? uops_3_shift : _GEN_4818; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4820 = 4'h4 == value_1 ? uops_4_shift : _GEN_4819; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4821 = 4'h5 == value_1 ? uops_5_shift : _GEN_4820; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4822 = 4'h6 == value_1 ? uops_6_shift : _GEN_4821; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4823 = 4'h7 == value_1 ? uops_7_shift : _GEN_4822; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4824 = 4'h8 == value_1 ? uops_8_shift : _GEN_4823; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4825 = 4'h9 == value_1 ? uops_9_shift : _GEN_4824; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4826 = 4'ha == value_1 ? uops_10_shift : _GEN_4825; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4827 = 4'hb == value_1 ? uops_11_shift : _GEN_4826; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4828 = 4'hc == value_1 ? uops_12_shift : _GEN_4827; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4829 = 4'hd == value_1 ? uops_13_shift : _GEN_4828; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_4830 = 4'he == value_1 ? uops_14_shift : _GEN_4829; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4833 = 4'h1 == value_1 ? uops_1_is_unicore : uops_0_is_unicore; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4834 = 4'h2 == value_1 ? uops_2_is_unicore : _GEN_4833; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4835 = 4'h3 == value_1 ? uops_3_is_unicore : _GEN_4834; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4836 = 4'h4 == value_1 ? uops_4_is_unicore : _GEN_4835; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4837 = 4'h5 == value_1 ? uops_5_is_unicore : _GEN_4836; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4838 = 4'h6 == value_1 ? uops_6_is_unicore : _GEN_4837; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4839 = 4'h7 == value_1 ? uops_7_is_unicore : _GEN_4838; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4840 = 4'h8 == value_1 ? uops_8_is_unicore : _GEN_4839; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4841 = 4'h9 == value_1 ? uops_9_is_unicore : _GEN_4840; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4842 = 4'ha == value_1 ? uops_10_is_unicore : _GEN_4841; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4843 = 4'hb == value_1 ? uops_11_is_unicore : _GEN_4842; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4844 = 4'hc == value_1 ? uops_12_is_unicore : _GEN_4843; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4845 = 4'hd == value_1 ? uops_13_is_unicore : _GEN_4844; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4846 = 4'he == value_1 ? uops_14_is_unicore : _GEN_4845; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4849 = 4'h1 == value_1 ? uops_1_switch_off : uops_0_switch_off; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4850 = 4'h2 == value_1 ? uops_2_switch_off : _GEN_4849; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4851 = 4'h3 == value_1 ? uops_3_switch_off : _GEN_4850; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4852 = 4'h4 == value_1 ? uops_4_switch_off : _GEN_4851; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4853 = 4'h5 == value_1 ? uops_5_switch_off : _GEN_4852; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4854 = 4'h6 == value_1 ? uops_6_switch_off : _GEN_4853; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4855 = 4'h7 == value_1 ? uops_7_switch_off : _GEN_4854; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4856 = 4'h8 == value_1 ? uops_8_switch_off : _GEN_4855; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4857 = 4'h9 == value_1 ? uops_9_switch_off : _GEN_4856; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4858 = 4'ha == value_1 ? uops_10_switch_off : _GEN_4857; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4859 = 4'hb == value_1 ? uops_11_switch_off : _GEN_4858; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4860 = 4'hc == value_1 ? uops_12_switch_off : _GEN_4859; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4861 = 4'hd == value_1 ? uops_13_switch_off : _GEN_4860; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4862 = 4'he == value_1 ? uops_14_switch_off : _GEN_4861; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4865 = 4'h1 == value_1 ? uops_1_switch : uops_0_switch; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4866 = 4'h2 == value_1 ? uops_2_switch : _GEN_4865; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4867 = 4'h3 == value_1 ? uops_3_switch : _GEN_4866; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4868 = 4'h4 == value_1 ? uops_4_switch : _GEN_4867; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4869 = 4'h5 == value_1 ? uops_5_switch : _GEN_4868; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4870 = 4'h6 == value_1 ? uops_6_switch : _GEN_4869; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4871 = 4'h7 == value_1 ? uops_7_switch : _GEN_4870; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4872 = 4'h8 == value_1 ? uops_8_switch : _GEN_4871; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4873 = 4'h9 == value_1 ? uops_9_switch : _GEN_4872; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4874 = 4'ha == value_1 ? uops_10_switch : _GEN_4873; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4875 = 4'hb == value_1 ? uops_11_switch : _GEN_4874; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4876 = 4'hc == value_1 ? uops_12_switch : _GEN_4875; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4877 = 4'hd == value_1 ? uops_13_switch : _GEN_4876; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_4878 = 4'he == value_1 ? uops_14_switch : _GEN_4877; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _T_157 = io_brupdate_b1_mispredict_mask & out_uop_br_mask; // @[util.scala 175:51]
  wire  _T_158 = _T_157 != 12'h0; // @[util.scala 175:59]
  wire [3:0] lo = value - value_1; // @[util.scala 595:40]
  wire  hi = maybe_full & ptr_match; // @[util.scala 597:32]
  wire [4:0] _T_167 = {hi,lo}; // @[Cat.scala 30:58]
  assign ram_addr_MPORT_1_addr = value_1;
  assign ram_addr_MPORT_1_data = ram_addr[ram_addr_MPORT_1_addr]; // @[util.scala 535:20]
  assign ram_addr_MPORT_data = io_enq_bits_addr;
  assign ram_addr_MPORT_addr = value;
  assign ram_addr_MPORT_mask = 1'h1;
  assign ram_addr_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_data_MPORT_1_addr = value_1;
  assign ram_data_MPORT_1_data = ram_data[ram_data_MPORT_1_addr]; // @[util.scala 535:20]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_is_hella_MPORT_1_addr = value_1;
  assign ram_is_hella_MPORT_1_data = ram_is_hella[ram_is_hella_MPORT_1_addr]; // @[util.scala 535:20]
  assign ram_is_hella_MPORT_data = io_enq_bits_is_hella;
  assign ram_is_hella_MPORT_addr = value;
  assign ram_is_hella_MPORT_mask = 1'h1;
  assign ram_is_hella_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_tag_match_MPORT_1_addr = value_1;
  assign ram_tag_match_MPORT_1_data = ram_tag_match[ram_tag_match_MPORT_1_addr]; // @[util.scala 535:20]
  assign ram_tag_match_MPORT_data = io_enq_bits_tag_match;
  assign ram_tag_match_MPORT_addr = value;
  assign ram_tag_match_MPORT_mask = 1'h1;
  assign ram_tag_match_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_old_meta_coh_state_MPORT_1_addr = value_1;
  assign ram_old_meta_coh_state_MPORT_1_data = ram_old_meta_coh_state[ram_old_meta_coh_state_MPORT_1_addr]; // @[util.scala 535:20]
  assign ram_old_meta_coh_state_MPORT_data = io_enq_bits_old_meta_coh_state;
  assign ram_old_meta_coh_state_MPORT_addr = value;
  assign ram_old_meta_coh_state_MPORT_mask = 1'h1;
  assign ram_old_meta_coh_state_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_old_meta_tag_MPORT_1_addr = value_1;
  assign ram_old_meta_tag_MPORT_1_data = ram_old_meta_tag[ram_old_meta_tag_MPORT_1_addr]; // @[util.scala 535:20]
  assign ram_old_meta_tag_MPORT_data = io_enq_bits_old_meta_tag;
  assign ram_old_meta_tag_MPORT_addr = value;
  assign ram_old_meta_tag_MPORT_mask = 1'h1;
  assign ram_old_meta_tag_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_way_en_MPORT_1_addr = value_1;
  assign ram_way_en_MPORT_1_data = ram_way_en[ram_way_en_MPORT_1_addr]; // @[util.scala 535:20]
  assign ram_way_en_MPORT_data = io_enq_bits_way_en;
  assign ram_way_en_MPORT_addr = value;
  assign ram_way_en_MPORT_mask = 1'h1;
  assign ram_way_en_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sdq_id_MPORT_1_addr = value_1;
  assign ram_sdq_id_MPORT_1_data = ram_sdq_id[ram_sdq_id_MPORT_1_addr]; // @[util.scala 535:20]
  assign ram_sdq_id_MPORT_data = io_enq_bits_sdq_id;
  assign ram_sdq_id_MPORT_addr = value;
  assign ram_sdq_id_MPORT_mask = 1'h1;
  assign ram_sdq_id_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[util.scala 575:19]
  assign io_deq_valid = _T_5 & _GEN_15 & ~_T_158 & ~(io_flush & out_uop_uses_ldq); // @[util.scala 580:108]
  assign io_deq_bits_uop_switch = 4'hf == value_1 ? uops_15_switch : _GEN_4878; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_switch_off = 4'hf == value_1 ? uops_15_switch_off : _GEN_4862; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_unicore = 4'hf == value_1 ? uops_15_is_unicore : _GEN_4846; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_shift = 4'hf == value_1 ? uops_15_shift : _GEN_4830; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs3_rtype = 4'hf == value_1 ? uops_15_lrs3_rtype : _GEN_4814; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_rflag = 4'hf == value_1 ? uops_15_rflag : _GEN_4798; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_wflag = 4'hf == value_1 ? uops_15_wflag : _GEN_4782; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prflag = 4'hf == value_1 ? uops_15_prflag : _GEN_4766; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_pwflag = 4'hf == value_1 ? uops_15_pwflag : _GEN_4750; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_pflag_busy = 4'hf == value_1 ? uops_15_pflag_busy : _GEN_4734; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_stale_pflag = 4'hf == value_1 ? uops_15_stale_pflag : _GEN_4718; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_op1_sel = 4'hf == value_1 ? uops_15_op1_sel : _GEN_4702; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_op2_sel = 4'hf == value_1 ? uops_15_op2_sel : _GEN_4686; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_split_num = 4'hf == value_1 ? uops_15_split_num : _GEN_4670; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_self_index = 4'hf == value_1 ? uops_15_self_index : _GEN_4654; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_rob_inst_idx = 4'hf == value_1 ? uops_15_rob_inst_idx : _GEN_4638; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_address_num = 4'hf == value_1 ? uops_15_address_num : _GEN_4622; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_uopc = 4'hf == value_1 ? uops_15_uopc : _GEN_4606; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_inst = 4'hf == value_1 ? uops_15_inst : _GEN_4590; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_debug_inst = 4'hf == value_1 ? uops_15_debug_inst : _GEN_4574; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_rvc = 4'hf == value_1 ? uops_15_is_rvc : _GEN_4558; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_debug_pc = 4'hf == value_1 ? uops_15_debug_pc : _GEN_4542; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_iq_type = 4'hf == value_1 ? uops_15_iq_type : _GEN_4526; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_fu_code = 4'hf == value_1 ? uops_15_fu_code : _GEN_4510; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_br_type = 4'hf == value_1 ? uops_15_ctrl_br_type : _GEN_4494; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_op1_sel = 4'hf == value_1 ? uops_15_ctrl_op1_sel : _GEN_4478; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_op2_sel = 4'hf == value_1 ? uops_15_ctrl_op2_sel : _GEN_4462; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_imm_sel = 4'hf == value_1 ? uops_15_ctrl_imm_sel : _GEN_4446; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_op_fcn = 4'hf == value_1 ? uops_15_ctrl_op_fcn : _GEN_4430; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_fcn_dw = 4'hf == value_1 ? uops_15_ctrl_fcn_dw : _GEN_4414; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_csr_cmd = 4'hf == value_1 ? uops_15_ctrl_csr_cmd : _GEN_4398; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_is_load = 4'hf == value_1 ? uops_15_ctrl_is_load : _GEN_4382; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_is_sta = 4'hf == value_1 ? uops_15_ctrl_is_sta : _GEN_4366; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_is_std = 4'hf == value_1 ? uops_15_ctrl_is_std : _GEN_4350; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_op3_sel = 4'hf == value_1 ? uops_15_ctrl_op3_sel : _GEN_4334; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_iw_state = 4'hf == value_1 ? uops_15_iw_state : _GEN_4318; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_iw_p1_poisoned = 4'hf == value_1 ? uops_15_iw_p1_poisoned : _GEN_4302; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_iw_p2_poisoned = 4'hf == value_1 ? uops_15_iw_p2_poisoned : _GEN_4286; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_br = 4'hf == value_1 ? uops_15_is_br : _GEN_4270; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_jalr = 4'hf == value_1 ? uops_15_is_jalr : _GEN_4254; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_jal = 4'hf == value_1 ? uops_15_is_jal : _GEN_4238; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_sfb = 4'hf == value_1 ? uops_15_is_sfb : _GEN_4222; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_br_mask = out_uop_br_mask & _T_14; // @[util.scala 142:25]
  assign io_deq_bits_uop_br_tag = 4'hf == value_1 ? uops_15_br_tag : _GEN_4190; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ftq_idx = 4'hf == value_1 ? uops_15_ftq_idx : _GEN_4174; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_edge_inst = 4'hf == value_1 ? uops_15_edge_inst : _GEN_4158; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_pc_lob = 4'hf == value_1 ? uops_15_pc_lob : _GEN_4142; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_taken = 4'hf == value_1 ? uops_15_taken : _GEN_4126; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_imm_packed = 4'hf == value_1 ? uops_15_imm_packed : _GEN_4110; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_csr_addr = 4'hf == value_1 ? uops_15_csr_addr : _GEN_4094; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_rob_idx = 4'hf == value_1 ? uops_15_rob_idx : _GEN_4078; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ldq_idx = 4'hf == value_1 ? uops_15_ldq_idx : _GEN_4062; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_stq_idx = 4'hf == value_1 ? uops_15_stq_idx : _GEN_4046; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_rxq_idx = 4'hf == value_1 ? uops_15_rxq_idx : _GEN_4030; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_pdst = 4'hf == value_1 ? uops_15_pdst : _GEN_4014; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs1 = 4'hf == value_1 ? uops_15_prs1 : _GEN_3998; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs2 = 4'hf == value_1 ? uops_15_prs2 : _GEN_3982; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs3 = 4'hf == value_1 ? uops_15_prs3 : _GEN_3966; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ppred = 4'hf == value_1 ? uops_15_ppred : _GEN_3950; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs1_busy = 4'hf == value_1 ? uops_15_prs1_busy : _GEN_3934; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs2_busy = 4'hf == value_1 ? uops_15_prs2_busy : _GEN_3918; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs3_busy = 4'hf == value_1 ? uops_15_prs3_busy : _GEN_3902; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ppred_busy = 4'hf == value_1 ? uops_15_ppred_busy : _GEN_3886; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_stale_pdst = 4'hf == value_1 ? uops_15_stale_pdst : _GEN_3870; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_exception = 4'hf == value_1 ? uops_15_exception : _GEN_3854; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_exc_cause = 4'hf == value_1 ? uops_15_exc_cause : _GEN_3838; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_bypassable = 4'hf == value_1 ? uops_15_bypassable : _GEN_3822; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_mem_cmd = 4'hf == value_1 ? uops_15_mem_cmd : _GEN_3806; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_mem_size = 4'hf == value_1 ? uops_15_mem_size : _GEN_3790; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_mem_signed = 4'hf == value_1 ? uops_15_mem_signed : _GEN_3774; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_fence = 4'hf == value_1 ? uops_15_is_fence : _GEN_3758; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_fencei = 4'hf == value_1 ? uops_15_is_fencei : _GEN_3742; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_amo = 4'hf == value_1 ? uops_15_is_amo : _GEN_3726; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_uses_ldq = 4'hf == value_1 ? uops_15_uses_ldq : _GEN_3710; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_uses_stq = 4'hf == value_1 ? uops_15_uses_stq : _GEN_3694; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_sys_pc2epc = 4'hf == value_1 ? uops_15_is_sys_pc2epc : _GEN_3678; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_unique = 4'hf == value_1 ? uops_15_is_unique : _GEN_3662; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_flush_on_commit = 4'hf == value_1 ? uops_15_flush_on_commit : _GEN_3646; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ldst_is_rs1 = 4'hf == value_1 ? uops_15_ldst_is_rs1 : _GEN_3630; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ldst = 4'hf == value_1 ? uops_15_ldst : _GEN_3614; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs1 = 4'hf == value_1 ? uops_15_lrs1 : _GEN_3598; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs2 = 4'hf == value_1 ? uops_15_lrs2 : _GEN_3582; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs3 = 4'hf == value_1 ? uops_15_lrs3 : _GEN_3566; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ldst_val = 4'hf == value_1 ? uops_15_ldst_val : _GEN_3550; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_dst_rtype = 4'hf == value_1 ? uops_15_dst_rtype : _GEN_3534; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs1_rtype = 4'hf == value_1 ? uops_15_lrs1_rtype : _GEN_3518; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs2_rtype = 4'hf == value_1 ? uops_15_lrs2_rtype : _GEN_3502; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_frs3_en = 4'hf == value_1 ? uops_15_frs3_en : _GEN_3486; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_fp_val = 4'hf == value_1 ? uops_15_fp_val : _GEN_3470; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_fp_single = 4'hf == value_1 ? uops_15_fp_single : _GEN_3454; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_xcpt_pf_if = 4'hf == value_1 ? uops_15_xcpt_pf_if : _GEN_3438; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_xcpt_ae_if = 4'hf == value_1 ? uops_15_xcpt_ae_if : _GEN_3422; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_xcpt_ma_if = 4'hf == value_1 ? uops_15_xcpt_ma_if : _GEN_3406; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_bp_debug_if = 4'hf == value_1 ? uops_15_bp_debug_if : _GEN_3390; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_bp_xcpt_if = 4'hf == value_1 ? uops_15_bp_xcpt_if : _GEN_3374; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_debug_fsrc = 4'hf == value_1 ? uops_15_debug_fsrc : _GEN_3358; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_debug_tsrc = 4'hf == value_1 ? uops_15_debug_tsrc : _GEN_3342; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_addr = ram_addr_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  assign io_deq_bits_data = ram_data_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  assign io_deq_bits_is_hella = ram_is_hella_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  assign io_deq_bits_tag_match = ram_tag_match_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  assign io_deq_bits_old_meta_coh_state = ram_old_meta_coh_state_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  assign io_deq_bits_old_meta_tag = ram_old_meta_tag_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  assign io_deq_bits_way_en = ram_way_en_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  assign io_deq_bits_sdq_id = ram_sdq_id_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  assign io_empty = ptr_match & ~maybe_full; // @[util.scala 544:25]
  assign io_count = _T_167[3:0]; // @[util.scala 597:14]
  always @(posedge clock) begin
    if(ram_addr_MPORT_en & ram_addr_MPORT_mask) begin
      ram_addr[ram_addr_MPORT_addr] <= ram_addr_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_is_hella_MPORT_en & ram_is_hella_MPORT_mask) begin
      ram_is_hella[ram_is_hella_MPORT_addr] <= ram_is_hella_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_tag_match_MPORT_en & ram_tag_match_MPORT_mask) begin
      ram_tag_match[ram_tag_match_MPORT_addr] <= ram_tag_match_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_old_meta_coh_state_MPORT_en & ram_old_meta_coh_state_MPORT_mask) begin
      ram_old_meta_coh_state[ram_old_meta_coh_state_MPORT_addr] <= ram_old_meta_coh_state_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_old_meta_tag_MPORT_en & ram_old_meta_tag_MPORT_mask) begin
      ram_old_meta_tag[ram_old_meta_tag_MPORT_addr] <= ram_old_meta_tag_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_way_en_MPORT_en & ram_way_en_MPORT_mask) begin
      ram_way_en[ram_way_en_MPORT_addr] <= ram_way_en_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_sdq_id_MPORT_en & ram_sdq_id_MPORT_mask) begin
      ram_sdq_id[ram_sdq_id_MPORT_addr] <= ram_sdq_id_MPORT_data; // @[util.scala 535:20]
    end
    if (reset) begin // @[util.scala 536:24]
      valids_0 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'h0 == value_1) begin // @[util.scala 567:27]
        valids_0 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_0 <= _GEN_1725;
      end
    end else begin
      valids_0 <= _GEN_1725;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_1 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'h1 == value_1) begin // @[util.scala 567:27]
        valids_1 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_1 <= _GEN_1726;
      end
    end else begin
      valids_1 <= _GEN_1726;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_2 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'h2 == value_1) begin // @[util.scala 567:27]
        valids_2 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_2 <= _GEN_1727;
      end
    end else begin
      valids_2 <= _GEN_1727;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_3 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'h3 == value_1) begin // @[util.scala 567:27]
        valids_3 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_3 <= _GEN_1728;
      end
    end else begin
      valids_3 <= _GEN_1728;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_4 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'h4 == value_1) begin // @[util.scala 567:27]
        valids_4 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_4 <= _GEN_1729;
      end
    end else begin
      valids_4 <= _GEN_1729;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_5 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'h5 == value_1) begin // @[util.scala 567:27]
        valids_5 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_5 <= _GEN_1730;
      end
    end else begin
      valids_5 <= _GEN_1730;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_6 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'h6 == value_1) begin // @[util.scala 567:27]
        valids_6 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_6 <= _GEN_1731;
      end
    end else begin
      valids_6 <= _GEN_1731;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_7 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'h7 == value_1) begin // @[util.scala 567:27]
        valids_7 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_7 <= _GEN_1732;
      end
    end else begin
      valids_7 <= _GEN_1732;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_8 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'h8 == value_1) begin // @[util.scala 567:27]
        valids_8 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_8 <= _GEN_1733;
      end
    end else begin
      valids_8 <= _GEN_1733;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_9 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'h9 == value_1) begin // @[util.scala 567:27]
        valids_9 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_9 <= _GEN_1734;
      end
    end else begin
      valids_9 <= _GEN_1734;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_10 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'ha == value_1) begin // @[util.scala 567:27]
        valids_10 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_10 <= _GEN_1735;
      end
    end else begin
      valids_10 <= _GEN_1735;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_11 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'hb == value_1) begin // @[util.scala 567:27]
        valids_11 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_11 <= _GEN_1736;
      end
    end else begin
      valids_11 <= _GEN_1736;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_12 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'hc == value_1) begin // @[util.scala 567:27]
        valids_12 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_12 <= _GEN_1737;
      end
    end else begin
      valids_12 <= _GEN_1737;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_13 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'hd == value_1) begin // @[util.scala 567:27]
        valids_13 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_13 <= _GEN_1738;
      end
    end else begin
      valids_13 <= _GEN_1738;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_14 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'he == value_1) begin // @[util.scala 567:27]
        valids_14 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_14 <= _GEN_1739;
      end
    end else begin
      valids_14 <= _GEN_1739;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_15 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (4'hf == value_1) begin // @[util.scala 567:27]
        valids_15 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_15 <= _GEN_1740;
      end
    end else begin
      valids_15 <= _GEN_1740;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 562:33]
        uops_0_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_0_br_mask <= _GEN_16;
      end
    end else begin
      uops_0_br_mask <= _GEN_16;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 562:33]
        uops_1_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_1_br_mask <= _GEN_17;
      end
    end else begin
      uops_1_br_mask <= _GEN_17;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 562:33]
        uops_2_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_2_br_mask <= _GEN_18;
      end
    end else begin
      uops_2_br_mask <= _GEN_18;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 562:33]
        uops_3_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_3_br_mask <= _GEN_19;
      end
    end else begin
      uops_3_br_mask <= _GEN_19;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 562:33]
        uops_4_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_4_br_mask <= _GEN_20;
      end
    end else begin
      uops_4_br_mask <= _GEN_20;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h4 == value) begin // @[util.scala 561:33]
        uops_4_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 562:33]
        uops_5_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_5_br_mask <= _GEN_21;
      end
    end else begin
      uops_5_br_mask <= _GEN_21;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h5 == value) begin // @[util.scala 561:33]
        uops_5_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 562:33]
        uops_6_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_6_br_mask <= _GEN_22;
      end
    end else begin
      uops_6_br_mask <= _GEN_22;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h6 == value) begin // @[util.scala 561:33]
        uops_6_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 562:33]
        uops_7_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_7_br_mask <= _GEN_23;
      end
    end else begin
      uops_7_br_mask <= _GEN_23;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h7 == value) begin // @[util.scala 561:33]
        uops_7_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 562:33]
        uops_8_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_8_br_mask <= _GEN_24;
      end
    end else begin
      uops_8_br_mask <= _GEN_24;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h8 == value) begin // @[util.scala 561:33]
        uops_8_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 562:33]
        uops_9_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_9_br_mask <= _GEN_25;
      end
    end else begin
      uops_9_br_mask <= _GEN_25;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'h9 == value) begin // @[util.scala 561:33]
        uops_9_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 562:33]
        uops_10_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_10_br_mask <= _GEN_26;
      end
    end else begin
      uops_10_br_mask <= _GEN_26;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'ha == value) begin // @[util.scala 561:33]
        uops_10_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 562:33]
        uops_11_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_11_br_mask <= _GEN_27;
      end
    end else begin
      uops_11_br_mask <= _GEN_27;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hb == value) begin // @[util.scala 561:33]
        uops_11_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 562:33]
        uops_12_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_12_br_mask <= _GEN_28;
      end
    end else begin
      uops_12_br_mask <= _GEN_28;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hc == value) begin // @[util.scala 561:33]
        uops_12_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 562:33]
        uops_13_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_13_br_mask <= _GEN_29;
      end
    end else begin
      uops_13_br_mask <= _GEN_29;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hd == value) begin // @[util.scala 561:33]
        uops_13_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 562:33]
        uops_14_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'he == value) begin // @[util.scala 561:33]
        uops_14_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_14_br_mask <= _GEN_30;
      end
    end else begin
      uops_14_br_mask <= _GEN_30;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'he == value) begin // @[util.scala 561:33]
        uops_14_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 562:33]
        uops_15_br_mask <= _T_152; // @[util.scala 562:33]
      end else if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_15_br_mask <= _GEN_31;
      end
    end else begin
      uops_15_br_mask <= _GEN_31;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (4'hf == value) begin // @[util.scala 561:33]
        uops_15_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 4'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[util.scala 558:17]
      value <= _value_T_1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 4'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[util.scala 566:17]
      value_1 <= _value_T_3; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[util.scala 541:27]
      maybe_full <= 1'h0; // @[util.scala 541:27]
    end else if (do_enq != do_deq) begin // @[util.scala 571:28]
      maybe_full <= do_enq; // @[util.scala 572:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_addr[initvar] = _RAND_0[39:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_data[initvar] = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_is_hella[initvar] = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_tag_match[initvar] = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_old_meta_coh_state[initvar] = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_old_meta_tag[initvar] = _RAND_5[19:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_way_en[initvar] = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_sdq_id[initvar] = _RAND_7[4:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  valids_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  valids_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  valids_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  valids_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  valids_4 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  valids_5 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  valids_6 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  valids_7 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  valids_8 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  valids_9 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  valids_10 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  valids_11 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  valids_12 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  valids_13 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  valids_14 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  valids_15 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  uops_0_switch = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  uops_0_switch_off = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  uops_0_is_unicore = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  uops_0_shift = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  uops_0_lrs3_rtype = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  uops_0_rflag = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  uops_0_wflag = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  uops_0_prflag = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  uops_0_pwflag = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  uops_0_pflag_busy = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  uops_0_stale_pflag = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  uops_0_op1_sel = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  uops_0_op2_sel = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  uops_0_split_num = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  uops_0_self_index = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  uops_0_rob_inst_idx = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  uops_0_address_num = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  uops_0_uopc = _RAND_41[6:0];
  _RAND_42 = {1{`RANDOM}};
  uops_0_inst = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  uops_0_debug_inst = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  uops_0_is_rvc = _RAND_44[0:0];
  _RAND_45 = {2{`RANDOM}};
  uops_0_debug_pc = _RAND_45[39:0];
  _RAND_46 = {1{`RANDOM}};
  uops_0_iq_type = _RAND_46[2:0];
  _RAND_47 = {1{`RANDOM}};
  uops_0_fu_code = _RAND_47[9:0];
  _RAND_48 = {1{`RANDOM}};
  uops_0_ctrl_br_type = _RAND_48[3:0];
  _RAND_49 = {1{`RANDOM}};
  uops_0_ctrl_op1_sel = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  uops_0_ctrl_op2_sel = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  uops_0_ctrl_imm_sel = _RAND_51[2:0];
  _RAND_52 = {1{`RANDOM}};
  uops_0_ctrl_op_fcn = _RAND_52[3:0];
  _RAND_53 = {1{`RANDOM}};
  uops_0_ctrl_fcn_dw = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  uops_0_ctrl_csr_cmd = _RAND_54[2:0];
  _RAND_55 = {1{`RANDOM}};
  uops_0_ctrl_is_load = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  uops_0_ctrl_is_sta = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  uops_0_ctrl_is_std = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  uops_0_ctrl_op3_sel = _RAND_58[1:0];
  _RAND_59 = {1{`RANDOM}};
  uops_0_iw_state = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  uops_0_iw_p1_poisoned = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  uops_0_iw_p2_poisoned = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  uops_0_is_br = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  uops_0_is_jalr = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  uops_0_is_jal = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  uops_0_is_sfb = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  uops_0_br_mask = _RAND_66[11:0];
  _RAND_67 = {1{`RANDOM}};
  uops_0_br_tag = _RAND_67[3:0];
  _RAND_68 = {1{`RANDOM}};
  uops_0_ftq_idx = _RAND_68[4:0];
  _RAND_69 = {1{`RANDOM}};
  uops_0_edge_inst = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  uops_0_pc_lob = _RAND_70[5:0];
  _RAND_71 = {1{`RANDOM}};
  uops_0_taken = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  uops_0_imm_packed = _RAND_72[19:0];
  _RAND_73 = {1{`RANDOM}};
  uops_0_csr_addr = _RAND_73[11:0];
  _RAND_74 = {1{`RANDOM}};
  uops_0_rob_idx = _RAND_74[5:0];
  _RAND_75 = {1{`RANDOM}};
  uops_0_ldq_idx = _RAND_75[4:0];
  _RAND_76 = {1{`RANDOM}};
  uops_0_stq_idx = _RAND_76[4:0];
  _RAND_77 = {1{`RANDOM}};
  uops_0_rxq_idx = _RAND_77[1:0];
  _RAND_78 = {1{`RANDOM}};
  uops_0_pdst = _RAND_78[6:0];
  _RAND_79 = {1{`RANDOM}};
  uops_0_prs1 = _RAND_79[6:0];
  _RAND_80 = {1{`RANDOM}};
  uops_0_prs2 = _RAND_80[6:0];
  _RAND_81 = {1{`RANDOM}};
  uops_0_prs3 = _RAND_81[6:0];
  _RAND_82 = {1{`RANDOM}};
  uops_0_ppred = _RAND_82[4:0];
  _RAND_83 = {1{`RANDOM}};
  uops_0_prs1_busy = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  uops_0_prs2_busy = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  uops_0_prs3_busy = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  uops_0_ppred_busy = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  uops_0_stale_pdst = _RAND_87[6:0];
  _RAND_88 = {1{`RANDOM}};
  uops_0_exception = _RAND_88[0:0];
  _RAND_89 = {2{`RANDOM}};
  uops_0_exc_cause = _RAND_89[63:0];
  _RAND_90 = {1{`RANDOM}};
  uops_0_bypassable = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  uops_0_mem_cmd = _RAND_91[4:0];
  _RAND_92 = {1{`RANDOM}};
  uops_0_mem_size = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  uops_0_mem_signed = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  uops_0_is_fence = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  uops_0_is_fencei = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  uops_0_is_amo = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  uops_0_uses_ldq = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  uops_0_uses_stq = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  uops_0_is_sys_pc2epc = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  uops_0_is_unique = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  uops_0_flush_on_commit = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  uops_0_ldst_is_rs1 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  uops_0_ldst = _RAND_103[5:0];
  _RAND_104 = {1{`RANDOM}};
  uops_0_lrs1 = _RAND_104[5:0];
  _RAND_105 = {1{`RANDOM}};
  uops_0_lrs2 = _RAND_105[5:0];
  _RAND_106 = {1{`RANDOM}};
  uops_0_lrs3 = _RAND_106[5:0];
  _RAND_107 = {1{`RANDOM}};
  uops_0_ldst_val = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  uops_0_dst_rtype = _RAND_108[1:0];
  _RAND_109 = {1{`RANDOM}};
  uops_0_lrs1_rtype = _RAND_109[1:0];
  _RAND_110 = {1{`RANDOM}};
  uops_0_lrs2_rtype = _RAND_110[1:0];
  _RAND_111 = {1{`RANDOM}};
  uops_0_frs3_en = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  uops_0_fp_val = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  uops_0_fp_single = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  uops_0_xcpt_pf_if = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  uops_0_xcpt_ae_if = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  uops_0_xcpt_ma_if = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  uops_0_bp_debug_if = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  uops_0_bp_xcpt_if = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  uops_0_debug_fsrc = _RAND_119[1:0];
  _RAND_120 = {1{`RANDOM}};
  uops_0_debug_tsrc = _RAND_120[1:0];
  _RAND_121 = {1{`RANDOM}};
  uops_1_switch = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  uops_1_switch_off = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  uops_1_is_unicore = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  uops_1_shift = _RAND_124[2:0];
  _RAND_125 = {1{`RANDOM}};
  uops_1_lrs3_rtype = _RAND_125[1:0];
  _RAND_126 = {1{`RANDOM}};
  uops_1_rflag = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  uops_1_wflag = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  uops_1_prflag = _RAND_128[3:0];
  _RAND_129 = {1{`RANDOM}};
  uops_1_pwflag = _RAND_129[3:0];
  _RAND_130 = {1{`RANDOM}};
  uops_1_pflag_busy = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  uops_1_stale_pflag = _RAND_131[3:0];
  _RAND_132 = {1{`RANDOM}};
  uops_1_op1_sel = _RAND_132[3:0];
  _RAND_133 = {1{`RANDOM}};
  uops_1_op2_sel = _RAND_133[3:0];
  _RAND_134 = {1{`RANDOM}};
  uops_1_split_num = _RAND_134[5:0];
  _RAND_135 = {1{`RANDOM}};
  uops_1_self_index = _RAND_135[5:0];
  _RAND_136 = {1{`RANDOM}};
  uops_1_rob_inst_idx = _RAND_136[5:0];
  _RAND_137 = {1{`RANDOM}};
  uops_1_address_num = _RAND_137[5:0];
  _RAND_138 = {1{`RANDOM}};
  uops_1_uopc = _RAND_138[6:0];
  _RAND_139 = {1{`RANDOM}};
  uops_1_inst = _RAND_139[31:0];
  _RAND_140 = {1{`RANDOM}};
  uops_1_debug_inst = _RAND_140[31:0];
  _RAND_141 = {1{`RANDOM}};
  uops_1_is_rvc = _RAND_141[0:0];
  _RAND_142 = {2{`RANDOM}};
  uops_1_debug_pc = _RAND_142[39:0];
  _RAND_143 = {1{`RANDOM}};
  uops_1_iq_type = _RAND_143[2:0];
  _RAND_144 = {1{`RANDOM}};
  uops_1_fu_code = _RAND_144[9:0];
  _RAND_145 = {1{`RANDOM}};
  uops_1_ctrl_br_type = _RAND_145[3:0];
  _RAND_146 = {1{`RANDOM}};
  uops_1_ctrl_op1_sel = _RAND_146[1:0];
  _RAND_147 = {1{`RANDOM}};
  uops_1_ctrl_op2_sel = _RAND_147[2:0];
  _RAND_148 = {1{`RANDOM}};
  uops_1_ctrl_imm_sel = _RAND_148[2:0];
  _RAND_149 = {1{`RANDOM}};
  uops_1_ctrl_op_fcn = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  uops_1_ctrl_fcn_dw = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  uops_1_ctrl_csr_cmd = _RAND_151[2:0];
  _RAND_152 = {1{`RANDOM}};
  uops_1_ctrl_is_load = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  uops_1_ctrl_is_sta = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  uops_1_ctrl_is_std = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  uops_1_ctrl_op3_sel = _RAND_155[1:0];
  _RAND_156 = {1{`RANDOM}};
  uops_1_iw_state = _RAND_156[1:0];
  _RAND_157 = {1{`RANDOM}};
  uops_1_iw_p1_poisoned = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  uops_1_iw_p2_poisoned = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  uops_1_is_br = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  uops_1_is_jalr = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  uops_1_is_jal = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  uops_1_is_sfb = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  uops_1_br_mask = _RAND_163[11:0];
  _RAND_164 = {1{`RANDOM}};
  uops_1_br_tag = _RAND_164[3:0];
  _RAND_165 = {1{`RANDOM}};
  uops_1_ftq_idx = _RAND_165[4:0];
  _RAND_166 = {1{`RANDOM}};
  uops_1_edge_inst = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  uops_1_pc_lob = _RAND_167[5:0];
  _RAND_168 = {1{`RANDOM}};
  uops_1_taken = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  uops_1_imm_packed = _RAND_169[19:0];
  _RAND_170 = {1{`RANDOM}};
  uops_1_csr_addr = _RAND_170[11:0];
  _RAND_171 = {1{`RANDOM}};
  uops_1_rob_idx = _RAND_171[5:0];
  _RAND_172 = {1{`RANDOM}};
  uops_1_ldq_idx = _RAND_172[4:0];
  _RAND_173 = {1{`RANDOM}};
  uops_1_stq_idx = _RAND_173[4:0];
  _RAND_174 = {1{`RANDOM}};
  uops_1_rxq_idx = _RAND_174[1:0];
  _RAND_175 = {1{`RANDOM}};
  uops_1_pdst = _RAND_175[6:0];
  _RAND_176 = {1{`RANDOM}};
  uops_1_prs1 = _RAND_176[6:0];
  _RAND_177 = {1{`RANDOM}};
  uops_1_prs2 = _RAND_177[6:0];
  _RAND_178 = {1{`RANDOM}};
  uops_1_prs3 = _RAND_178[6:0];
  _RAND_179 = {1{`RANDOM}};
  uops_1_ppred = _RAND_179[4:0];
  _RAND_180 = {1{`RANDOM}};
  uops_1_prs1_busy = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  uops_1_prs2_busy = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  uops_1_prs3_busy = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  uops_1_ppred_busy = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  uops_1_stale_pdst = _RAND_184[6:0];
  _RAND_185 = {1{`RANDOM}};
  uops_1_exception = _RAND_185[0:0];
  _RAND_186 = {2{`RANDOM}};
  uops_1_exc_cause = _RAND_186[63:0];
  _RAND_187 = {1{`RANDOM}};
  uops_1_bypassable = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  uops_1_mem_cmd = _RAND_188[4:0];
  _RAND_189 = {1{`RANDOM}};
  uops_1_mem_size = _RAND_189[1:0];
  _RAND_190 = {1{`RANDOM}};
  uops_1_mem_signed = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  uops_1_is_fence = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  uops_1_is_fencei = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  uops_1_is_amo = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  uops_1_uses_ldq = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  uops_1_uses_stq = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  uops_1_is_sys_pc2epc = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  uops_1_is_unique = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  uops_1_flush_on_commit = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  uops_1_ldst_is_rs1 = _RAND_199[0:0];
  _RAND_200 = {1{`RANDOM}};
  uops_1_ldst = _RAND_200[5:0];
  _RAND_201 = {1{`RANDOM}};
  uops_1_lrs1 = _RAND_201[5:0];
  _RAND_202 = {1{`RANDOM}};
  uops_1_lrs2 = _RAND_202[5:0];
  _RAND_203 = {1{`RANDOM}};
  uops_1_lrs3 = _RAND_203[5:0];
  _RAND_204 = {1{`RANDOM}};
  uops_1_ldst_val = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  uops_1_dst_rtype = _RAND_205[1:0];
  _RAND_206 = {1{`RANDOM}};
  uops_1_lrs1_rtype = _RAND_206[1:0];
  _RAND_207 = {1{`RANDOM}};
  uops_1_lrs2_rtype = _RAND_207[1:0];
  _RAND_208 = {1{`RANDOM}};
  uops_1_frs3_en = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  uops_1_fp_val = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  uops_1_fp_single = _RAND_210[0:0];
  _RAND_211 = {1{`RANDOM}};
  uops_1_xcpt_pf_if = _RAND_211[0:0];
  _RAND_212 = {1{`RANDOM}};
  uops_1_xcpt_ae_if = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  uops_1_xcpt_ma_if = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  uops_1_bp_debug_if = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  uops_1_bp_xcpt_if = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  uops_1_debug_fsrc = _RAND_216[1:0];
  _RAND_217 = {1{`RANDOM}};
  uops_1_debug_tsrc = _RAND_217[1:0];
  _RAND_218 = {1{`RANDOM}};
  uops_2_switch = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  uops_2_switch_off = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  uops_2_is_unicore = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  uops_2_shift = _RAND_221[2:0];
  _RAND_222 = {1{`RANDOM}};
  uops_2_lrs3_rtype = _RAND_222[1:0];
  _RAND_223 = {1{`RANDOM}};
  uops_2_rflag = _RAND_223[0:0];
  _RAND_224 = {1{`RANDOM}};
  uops_2_wflag = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  uops_2_prflag = _RAND_225[3:0];
  _RAND_226 = {1{`RANDOM}};
  uops_2_pwflag = _RAND_226[3:0];
  _RAND_227 = {1{`RANDOM}};
  uops_2_pflag_busy = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  uops_2_stale_pflag = _RAND_228[3:0];
  _RAND_229 = {1{`RANDOM}};
  uops_2_op1_sel = _RAND_229[3:0];
  _RAND_230 = {1{`RANDOM}};
  uops_2_op2_sel = _RAND_230[3:0];
  _RAND_231 = {1{`RANDOM}};
  uops_2_split_num = _RAND_231[5:0];
  _RAND_232 = {1{`RANDOM}};
  uops_2_self_index = _RAND_232[5:0];
  _RAND_233 = {1{`RANDOM}};
  uops_2_rob_inst_idx = _RAND_233[5:0];
  _RAND_234 = {1{`RANDOM}};
  uops_2_address_num = _RAND_234[5:0];
  _RAND_235 = {1{`RANDOM}};
  uops_2_uopc = _RAND_235[6:0];
  _RAND_236 = {1{`RANDOM}};
  uops_2_inst = _RAND_236[31:0];
  _RAND_237 = {1{`RANDOM}};
  uops_2_debug_inst = _RAND_237[31:0];
  _RAND_238 = {1{`RANDOM}};
  uops_2_is_rvc = _RAND_238[0:0];
  _RAND_239 = {2{`RANDOM}};
  uops_2_debug_pc = _RAND_239[39:0];
  _RAND_240 = {1{`RANDOM}};
  uops_2_iq_type = _RAND_240[2:0];
  _RAND_241 = {1{`RANDOM}};
  uops_2_fu_code = _RAND_241[9:0];
  _RAND_242 = {1{`RANDOM}};
  uops_2_ctrl_br_type = _RAND_242[3:0];
  _RAND_243 = {1{`RANDOM}};
  uops_2_ctrl_op1_sel = _RAND_243[1:0];
  _RAND_244 = {1{`RANDOM}};
  uops_2_ctrl_op2_sel = _RAND_244[2:0];
  _RAND_245 = {1{`RANDOM}};
  uops_2_ctrl_imm_sel = _RAND_245[2:0];
  _RAND_246 = {1{`RANDOM}};
  uops_2_ctrl_op_fcn = _RAND_246[3:0];
  _RAND_247 = {1{`RANDOM}};
  uops_2_ctrl_fcn_dw = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  uops_2_ctrl_csr_cmd = _RAND_248[2:0];
  _RAND_249 = {1{`RANDOM}};
  uops_2_ctrl_is_load = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  uops_2_ctrl_is_sta = _RAND_250[0:0];
  _RAND_251 = {1{`RANDOM}};
  uops_2_ctrl_is_std = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  uops_2_ctrl_op3_sel = _RAND_252[1:0];
  _RAND_253 = {1{`RANDOM}};
  uops_2_iw_state = _RAND_253[1:0];
  _RAND_254 = {1{`RANDOM}};
  uops_2_iw_p1_poisoned = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  uops_2_iw_p2_poisoned = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  uops_2_is_br = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  uops_2_is_jalr = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  uops_2_is_jal = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  uops_2_is_sfb = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  uops_2_br_mask = _RAND_260[11:0];
  _RAND_261 = {1{`RANDOM}};
  uops_2_br_tag = _RAND_261[3:0];
  _RAND_262 = {1{`RANDOM}};
  uops_2_ftq_idx = _RAND_262[4:0];
  _RAND_263 = {1{`RANDOM}};
  uops_2_edge_inst = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  uops_2_pc_lob = _RAND_264[5:0];
  _RAND_265 = {1{`RANDOM}};
  uops_2_taken = _RAND_265[0:0];
  _RAND_266 = {1{`RANDOM}};
  uops_2_imm_packed = _RAND_266[19:0];
  _RAND_267 = {1{`RANDOM}};
  uops_2_csr_addr = _RAND_267[11:0];
  _RAND_268 = {1{`RANDOM}};
  uops_2_rob_idx = _RAND_268[5:0];
  _RAND_269 = {1{`RANDOM}};
  uops_2_ldq_idx = _RAND_269[4:0];
  _RAND_270 = {1{`RANDOM}};
  uops_2_stq_idx = _RAND_270[4:0];
  _RAND_271 = {1{`RANDOM}};
  uops_2_rxq_idx = _RAND_271[1:0];
  _RAND_272 = {1{`RANDOM}};
  uops_2_pdst = _RAND_272[6:0];
  _RAND_273 = {1{`RANDOM}};
  uops_2_prs1 = _RAND_273[6:0];
  _RAND_274 = {1{`RANDOM}};
  uops_2_prs2 = _RAND_274[6:0];
  _RAND_275 = {1{`RANDOM}};
  uops_2_prs3 = _RAND_275[6:0];
  _RAND_276 = {1{`RANDOM}};
  uops_2_ppred = _RAND_276[4:0];
  _RAND_277 = {1{`RANDOM}};
  uops_2_prs1_busy = _RAND_277[0:0];
  _RAND_278 = {1{`RANDOM}};
  uops_2_prs2_busy = _RAND_278[0:0];
  _RAND_279 = {1{`RANDOM}};
  uops_2_prs3_busy = _RAND_279[0:0];
  _RAND_280 = {1{`RANDOM}};
  uops_2_ppred_busy = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  uops_2_stale_pdst = _RAND_281[6:0];
  _RAND_282 = {1{`RANDOM}};
  uops_2_exception = _RAND_282[0:0];
  _RAND_283 = {2{`RANDOM}};
  uops_2_exc_cause = _RAND_283[63:0];
  _RAND_284 = {1{`RANDOM}};
  uops_2_bypassable = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  uops_2_mem_cmd = _RAND_285[4:0];
  _RAND_286 = {1{`RANDOM}};
  uops_2_mem_size = _RAND_286[1:0];
  _RAND_287 = {1{`RANDOM}};
  uops_2_mem_signed = _RAND_287[0:0];
  _RAND_288 = {1{`RANDOM}};
  uops_2_is_fence = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  uops_2_is_fencei = _RAND_289[0:0];
  _RAND_290 = {1{`RANDOM}};
  uops_2_is_amo = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  uops_2_uses_ldq = _RAND_291[0:0];
  _RAND_292 = {1{`RANDOM}};
  uops_2_uses_stq = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  uops_2_is_sys_pc2epc = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  uops_2_is_unique = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  uops_2_flush_on_commit = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  uops_2_ldst_is_rs1 = _RAND_296[0:0];
  _RAND_297 = {1{`RANDOM}};
  uops_2_ldst = _RAND_297[5:0];
  _RAND_298 = {1{`RANDOM}};
  uops_2_lrs1 = _RAND_298[5:0];
  _RAND_299 = {1{`RANDOM}};
  uops_2_lrs2 = _RAND_299[5:0];
  _RAND_300 = {1{`RANDOM}};
  uops_2_lrs3 = _RAND_300[5:0];
  _RAND_301 = {1{`RANDOM}};
  uops_2_ldst_val = _RAND_301[0:0];
  _RAND_302 = {1{`RANDOM}};
  uops_2_dst_rtype = _RAND_302[1:0];
  _RAND_303 = {1{`RANDOM}};
  uops_2_lrs1_rtype = _RAND_303[1:0];
  _RAND_304 = {1{`RANDOM}};
  uops_2_lrs2_rtype = _RAND_304[1:0];
  _RAND_305 = {1{`RANDOM}};
  uops_2_frs3_en = _RAND_305[0:0];
  _RAND_306 = {1{`RANDOM}};
  uops_2_fp_val = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  uops_2_fp_single = _RAND_307[0:0];
  _RAND_308 = {1{`RANDOM}};
  uops_2_xcpt_pf_if = _RAND_308[0:0];
  _RAND_309 = {1{`RANDOM}};
  uops_2_xcpt_ae_if = _RAND_309[0:0];
  _RAND_310 = {1{`RANDOM}};
  uops_2_xcpt_ma_if = _RAND_310[0:0];
  _RAND_311 = {1{`RANDOM}};
  uops_2_bp_debug_if = _RAND_311[0:0];
  _RAND_312 = {1{`RANDOM}};
  uops_2_bp_xcpt_if = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  uops_2_debug_fsrc = _RAND_313[1:0];
  _RAND_314 = {1{`RANDOM}};
  uops_2_debug_tsrc = _RAND_314[1:0];
  _RAND_315 = {1{`RANDOM}};
  uops_3_switch = _RAND_315[0:0];
  _RAND_316 = {1{`RANDOM}};
  uops_3_switch_off = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  uops_3_is_unicore = _RAND_317[0:0];
  _RAND_318 = {1{`RANDOM}};
  uops_3_shift = _RAND_318[2:0];
  _RAND_319 = {1{`RANDOM}};
  uops_3_lrs3_rtype = _RAND_319[1:0];
  _RAND_320 = {1{`RANDOM}};
  uops_3_rflag = _RAND_320[0:0];
  _RAND_321 = {1{`RANDOM}};
  uops_3_wflag = _RAND_321[0:0];
  _RAND_322 = {1{`RANDOM}};
  uops_3_prflag = _RAND_322[3:0];
  _RAND_323 = {1{`RANDOM}};
  uops_3_pwflag = _RAND_323[3:0];
  _RAND_324 = {1{`RANDOM}};
  uops_3_pflag_busy = _RAND_324[0:0];
  _RAND_325 = {1{`RANDOM}};
  uops_3_stale_pflag = _RAND_325[3:0];
  _RAND_326 = {1{`RANDOM}};
  uops_3_op1_sel = _RAND_326[3:0];
  _RAND_327 = {1{`RANDOM}};
  uops_3_op2_sel = _RAND_327[3:0];
  _RAND_328 = {1{`RANDOM}};
  uops_3_split_num = _RAND_328[5:0];
  _RAND_329 = {1{`RANDOM}};
  uops_3_self_index = _RAND_329[5:0];
  _RAND_330 = {1{`RANDOM}};
  uops_3_rob_inst_idx = _RAND_330[5:0];
  _RAND_331 = {1{`RANDOM}};
  uops_3_address_num = _RAND_331[5:0];
  _RAND_332 = {1{`RANDOM}};
  uops_3_uopc = _RAND_332[6:0];
  _RAND_333 = {1{`RANDOM}};
  uops_3_inst = _RAND_333[31:0];
  _RAND_334 = {1{`RANDOM}};
  uops_3_debug_inst = _RAND_334[31:0];
  _RAND_335 = {1{`RANDOM}};
  uops_3_is_rvc = _RAND_335[0:0];
  _RAND_336 = {2{`RANDOM}};
  uops_3_debug_pc = _RAND_336[39:0];
  _RAND_337 = {1{`RANDOM}};
  uops_3_iq_type = _RAND_337[2:0];
  _RAND_338 = {1{`RANDOM}};
  uops_3_fu_code = _RAND_338[9:0];
  _RAND_339 = {1{`RANDOM}};
  uops_3_ctrl_br_type = _RAND_339[3:0];
  _RAND_340 = {1{`RANDOM}};
  uops_3_ctrl_op1_sel = _RAND_340[1:0];
  _RAND_341 = {1{`RANDOM}};
  uops_3_ctrl_op2_sel = _RAND_341[2:0];
  _RAND_342 = {1{`RANDOM}};
  uops_3_ctrl_imm_sel = _RAND_342[2:0];
  _RAND_343 = {1{`RANDOM}};
  uops_3_ctrl_op_fcn = _RAND_343[3:0];
  _RAND_344 = {1{`RANDOM}};
  uops_3_ctrl_fcn_dw = _RAND_344[0:0];
  _RAND_345 = {1{`RANDOM}};
  uops_3_ctrl_csr_cmd = _RAND_345[2:0];
  _RAND_346 = {1{`RANDOM}};
  uops_3_ctrl_is_load = _RAND_346[0:0];
  _RAND_347 = {1{`RANDOM}};
  uops_3_ctrl_is_sta = _RAND_347[0:0];
  _RAND_348 = {1{`RANDOM}};
  uops_3_ctrl_is_std = _RAND_348[0:0];
  _RAND_349 = {1{`RANDOM}};
  uops_3_ctrl_op3_sel = _RAND_349[1:0];
  _RAND_350 = {1{`RANDOM}};
  uops_3_iw_state = _RAND_350[1:0];
  _RAND_351 = {1{`RANDOM}};
  uops_3_iw_p1_poisoned = _RAND_351[0:0];
  _RAND_352 = {1{`RANDOM}};
  uops_3_iw_p2_poisoned = _RAND_352[0:0];
  _RAND_353 = {1{`RANDOM}};
  uops_3_is_br = _RAND_353[0:0];
  _RAND_354 = {1{`RANDOM}};
  uops_3_is_jalr = _RAND_354[0:0];
  _RAND_355 = {1{`RANDOM}};
  uops_3_is_jal = _RAND_355[0:0];
  _RAND_356 = {1{`RANDOM}};
  uops_3_is_sfb = _RAND_356[0:0];
  _RAND_357 = {1{`RANDOM}};
  uops_3_br_mask = _RAND_357[11:0];
  _RAND_358 = {1{`RANDOM}};
  uops_3_br_tag = _RAND_358[3:0];
  _RAND_359 = {1{`RANDOM}};
  uops_3_ftq_idx = _RAND_359[4:0];
  _RAND_360 = {1{`RANDOM}};
  uops_3_edge_inst = _RAND_360[0:0];
  _RAND_361 = {1{`RANDOM}};
  uops_3_pc_lob = _RAND_361[5:0];
  _RAND_362 = {1{`RANDOM}};
  uops_3_taken = _RAND_362[0:0];
  _RAND_363 = {1{`RANDOM}};
  uops_3_imm_packed = _RAND_363[19:0];
  _RAND_364 = {1{`RANDOM}};
  uops_3_csr_addr = _RAND_364[11:0];
  _RAND_365 = {1{`RANDOM}};
  uops_3_rob_idx = _RAND_365[5:0];
  _RAND_366 = {1{`RANDOM}};
  uops_3_ldq_idx = _RAND_366[4:0];
  _RAND_367 = {1{`RANDOM}};
  uops_3_stq_idx = _RAND_367[4:0];
  _RAND_368 = {1{`RANDOM}};
  uops_3_rxq_idx = _RAND_368[1:0];
  _RAND_369 = {1{`RANDOM}};
  uops_3_pdst = _RAND_369[6:0];
  _RAND_370 = {1{`RANDOM}};
  uops_3_prs1 = _RAND_370[6:0];
  _RAND_371 = {1{`RANDOM}};
  uops_3_prs2 = _RAND_371[6:0];
  _RAND_372 = {1{`RANDOM}};
  uops_3_prs3 = _RAND_372[6:0];
  _RAND_373 = {1{`RANDOM}};
  uops_3_ppred = _RAND_373[4:0];
  _RAND_374 = {1{`RANDOM}};
  uops_3_prs1_busy = _RAND_374[0:0];
  _RAND_375 = {1{`RANDOM}};
  uops_3_prs2_busy = _RAND_375[0:0];
  _RAND_376 = {1{`RANDOM}};
  uops_3_prs3_busy = _RAND_376[0:0];
  _RAND_377 = {1{`RANDOM}};
  uops_3_ppred_busy = _RAND_377[0:0];
  _RAND_378 = {1{`RANDOM}};
  uops_3_stale_pdst = _RAND_378[6:0];
  _RAND_379 = {1{`RANDOM}};
  uops_3_exception = _RAND_379[0:0];
  _RAND_380 = {2{`RANDOM}};
  uops_3_exc_cause = _RAND_380[63:0];
  _RAND_381 = {1{`RANDOM}};
  uops_3_bypassable = _RAND_381[0:0];
  _RAND_382 = {1{`RANDOM}};
  uops_3_mem_cmd = _RAND_382[4:0];
  _RAND_383 = {1{`RANDOM}};
  uops_3_mem_size = _RAND_383[1:0];
  _RAND_384 = {1{`RANDOM}};
  uops_3_mem_signed = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  uops_3_is_fence = _RAND_385[0:0];
  _RAND_386 = {1{`RANDOM}};
  uops_3_is_fencei = _RAND_386[0:0];
  _RAND_387 = {1{`RANDOM}};
  uops_3_is_amo = _RAND_387[0:0];
  _RAND_388 = {1{`RANDOM}};
  uops_3_uses_ldq = _RAND_388[0:0];
  _RAND_389 = {1{`RANDOM}};
  uops_3_uses_stq = _RAND_389[0:0];
  _RAND_390 = {1{`RANDOM}};
  uops_3_is_sys_pc2epc = _RAND_390[0:0];
  _RAND_391 = {1{`RANDOM}};
  uops_3_is_unique = _RAND_391[0:0];
  _RAND_392 = {1{`RANDOM}};
  uops_3_flush_on_commit = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  uops_3_ldst_is_rs1 = _RAND_393[0:0];
  _RAND_394 = {1{`RANDOM}};
  uops_3_ldst = _RAND_394[5:0];
  _RAND_395 = {1{`RANDOM}};
  uops_3_lrs1 = _RAND_395[5:0];
  _RAND_396 = {1{`RANDOM}};
  uops_3_lrs2 = _RAND_396[5:0];
  _RAND_397 = {1{`RANDOM}};
  uops_3_lrs3 = _RAND_397[5:0];
  _RAND_398 = {1{`RANDOM}};
  uops_3_ldst_val = _RAND_398[0:0];
  _RAND_399 = {1{`RANDOM}};
  uops_3_dst_rtype = _RAND_399[1:0];
  _RAND_400 = {1{`RANDOM}};
  uops_3_lrs1_rtype = _RAND_400[1:0];
  _RAND_401 = {1{`RANDOM}};
  uops_3_lrs2_rtype = _RAND_401[1:0];
  _RAND_402 = {1{`RANDOM}};
  uops_3_frs3_en = _RAND_402[0:0];
  _RAND_403 = {1{`RANDOM}};
  uops_3_fp_val = _RAND_403[0:0];
  _RAND_404 = {1{`RANDOM}};
  uops_3_fp_single = _RAND_404[0:0];
  _RAND_405 = {1{`RANDOM}};
  uops_3_xcpt_pf_if = _RAND_405[0:0];
  _RAND_406 = {1{`RANDOM}};
  uops_3_xcpt_ae_if = _RAND_406[0:0];
  _RAND_407 = {1{`RANDOM}};
  uops_3_xcpt_ma_if = _RAND_407[0:0];
  _RAND_408 = {1{`RANDOM}};
  uops_3_bp_debug_if = _RAND_408[0:0];
  _RAND_409 = {1{`RANDOM}};
  uops_3_bp_xcpt_if = _RAND_409[0:0];
  _RAND_410 = {1{`RANDOM}};
  uops_3_debug_fsrc = _RAND_410[1:0];
  _RAND_411 = {1{`RANDOM}};
  uops_3_debug_tsrc = _RAND_411[1:0];
  _RAND_412 = {1{`RANDOM}};
  uops_4_switch = _RAND_412[0:0];
  _RAND_413 = {1{`RANDOM}};
  uops_4_switch_off = _RAND_413[0:0];
  _RAND_414 = {1{`RANDOM}};
  uops_4_is_unicore = _RAND_414[0:0];
  _RAND_415 = {1{`RANDOM}};
  uops_4_shift = _RAND_415[2:0];
  _RAND_416 = {1{`RANDOM}};
  uops_4_lrs3_rtype = _RAND_416[1:0];
  _RAND_417 = {1{`RANDOM}};
  uops_4_rflag = _RAND_417[0:0];
  _RAND_418 = {1{`RANDOM}};
  uops_4_wflag = _RAND_418[0:0];
  _RAND_419 = {1{`RANDOM}};
  uops_4_prflag = _RAND_419[3:0];
  _RAND_420 = {1{`RANDOM}};
  uops_4_pwflag = _RAND_420[3:0];
  _RAND_421 = {1{`RANDOM}};
  uops_4_pflag_busy = _RAND_421[0:0];
  _RAND_422 = {1{`RANDOM}};
  uops_4_stale_pflag = _RAND_422[3:0];
  _RAND_423 = {1{`RANDOM}};
  uops_4_op1_sel = _RAND_423[3:0];
  _RAND_424 = {1{`RANDOM}};
  uops_4_op2_sel = _RAND_424[3:0];
  _RAND_425 = {1{`RANDOM}};
  uops_4_split_num = _RAND_425[5:0];
  _RAND_426 = {1{`RANDOM}};
  uops_4_self_index = _RAND_426[5:0];
  _RAND_427 = {1{`RANDOM}};
  uops_4_rob_inst_idx = _RAND_427[5:0];
  _RAND_428 = {1{`RANDOM}};
  uops_4_address_num = _RAND_428[5:0];
  _RAND_429 = {1{`RANDOM}};
  uops_4_uopc = _RAND_429[6:0];
  _RAND_430 = {1{`RANDOM}};
  uops_4_inst = _RAND_430[31:0];
  _RAND_431 = {1{`RANDOM}};
  uops_4_debug_inst = _RAND_431[31:0];
  _RAND_432 = {1{`RANDOM}};
  uops_4_is_rvc = _RAND_432[0:0];
  _RAND_433 = {2{`RANDOM}};
  uops_4_debug_pc = _RAND_433[39:0];
  _RAND_434 = {1{`RANDOM}};
  uops_4_iq_type = _RAND_434[2:0];
  _RAND_435 = {1{`RANDOM}};
  uops_4_fu_code = _RAND_435[9:0];
  _RAND_436 = {1{`RANDOM}};
  uops_4_ctrl_br_type = _RAND_436[3:0];
  _RAND_437 = {1{`RANDOM}};
  uops_4_ctrl_op1_sel = _RAND_437[1:0];
  _RAND_438 = {1{`RANDOM}};
  uops_4_ctrl_op2_sel = _RAND_438[2:0];
  _RAND_439 = {1{`RANDOM}};
  uops_4_ctrl_imm_sel = _RAND_439[2:0];
  _RAND_440 = {1{`RANDOM}};
  uops_4_ctrl_op_fcn = _RAND_440[3:0];
  _RAND_441 = {1{`RANDOM}};
  uops_4_ctrl_fcn_dw = _RAND_441[0:0];
  _RAND_442 = {1{`RANDOM}};
  uops_4_ctrl_csr_cmd = _RAND_442[2:0];
  _RAND_443 = {1{`RANDOM}};
  uops_4_ctrl_is_load = _RAND_443[0:0];
  _RAND_444 = {1{`RANDOM}};
  uops_4_ctrl_is_sta = _RAND_444[0:0];
  _RAND_445 = {1{`RANDOM}};
  uops_4_ctrl_is_std = _RAND_445[0:0];
  _RAND_446 = {1{`RANDOM}};
  uops_4_ctrl_op3_sel = _RAND_446[1:0];
  _RAND_447 = {1{`RANDOM}};
  uops_4_iw_state = _RAND_447[1:0];
  _RAND_448 = {1{`RANDOM}};
  uops_4_iw_p1_poisoned = _RAND_448[0:0];
  _RAND_449 = {1{`RANDOM}};
  uops_4_iw_p2_poisoned = _RAND_449[0:0];
  _RAND_450 = {1{`RANDOM}};
  uops_4_is_br = _RAND_450[0:0];
  _RAND_451 = {1{`RANDOM}};
  uops_4_is_jalr = _RAND_451[0:0];
  _RAND_452 = {1{`RANDOM}};
  uops_4_is_jal = _RAND_452[0:0];
  _RAND_453 = {1{`RANDOM}};
  uops_4_is_sfb = _RAND_453[0:0];
  _RAND_454 = {1{`RANDOM}};
  uops_4_br_mask = _RAND_454[11:0];
  _RAND_455 = {1{`RANDOM}};
  uops_4_br_tag = _RAND_455[3:0];
  _RAND_456 = {1{`RANDOM}};
  uops_4_ftq_idx = _RAND_456[4:0];
  _RAND_457 = {1{`RANDOM}};
  uops_4_edge_inst = _RAND_457[0:0];
  _RAND_458 = {1{`RANDOM}};
  uops_4_pc_lob = _RAND_458[5:0];
  _RAND_459 = {1{`RANDOM}};
  uops_4_taken = _RAND_459[0:0];
  _RAND_460 = {1{`RANDOM}};
  uops_4_imm_packed = _RAND_460[19:0];
  _RAND_461 = {1{`RANDOM}};
  uops_4_csr_addr = _RAND_461[11:0];
  _RAND_462 = {1{`RANDOM}};
  uops_4_rob_idx = _RAND_462[5:0];
  _RAND_463 = {1{`RANDOM}};
  uops_4_ldq_idx = _RAND_463[4:0];
  _RAND_464 = {1{`RANDOM}};
  uops_4_stq_idx = _RAND_464[4:0];
  _RAND_465 = {1{`RANDOM}};
  uops_4_rxq_idx = _RAND_465[1:0];
  _RAND_466 = {1{`RANDOM}};
  uops_4_pdst = _RAND_466[6:0];
  _RAND_467 = {1{`RANDOM}};
  uops_4_prs1 = _RAND_467[6:0];
  _RAND_468 = {1{`RANDOM}};
  uops_4_prs2 = _RAND_468[6:0];
  _RAND_469 = {1{`RANDOM}};
  uops_4_prs3 = _RAND_469[6:0];
  _RAND_470 = {1{`RANDOM}};
  uops_4_ppred = _RAND_470[4:0];
  _RAND_471 = {1{`RANDOM}};
  uops_4_prs1_busy = _RAND_471[0:0];
  _RAND_472 = {1{`RANDOM}};
  uops_4_prs2_busy = _RAND_472[0:0];
  _RAND_473 = {1{`RANDOM}};
  uops_4_prs3_busy = _RAND_473[0:0];
  _RAND_474 = {1{`RANDOM}};
  uops_4_ppred_busy = _RAND_474[0:0];
  _RAND_475 = {1{`RANDOM}};
  uops_4_stale_pdst = _RAND_475[6:0];
  _RAND_476 = {1{`RANDOM}};
  uops_4_exception = _RAND_476[0:0];
  _RAND_477 = {2{`RANDOM}};
  uops_4_exc_cause = _RAND_477[63:0];
  _RAND_478 = {1{`RANDOM}};
  uops_4_bypassable = _RAND_478[0:0];
  _RAND_479 = {1{`RANDOM}};
  uops_4_mem_cmd = _RAND_479[4:0];
  _RAND_480 = {1{`RANDOM}};
  uops_4_mem_size = _RAND_480[1:0];
  _RAND_481 = {1{`RANDOM}};
  uops_4_mem_signed = _RAND_481[0:0];
  _RAND_482 = {1{`RANDOM}};
  uops_4_is_fence = _RAND_482[0:0];
  _RAND_483 = {1{`RANDOM}};
  uops_4_is_fencei = _RAND_483[0:0];
  _RAND_484 = {1{`RANDOM}};
  uops_4_is_amo = _RAND_484[0:0];
  _RAND_485 = {1{`RANDOM}};
  uops_4_uses_ldq = _RAND_485[0:0];
  _RAND_486 = {1{`RANDOM}};
  uops_4_uses_stq = _RAND_486[0:0];
  _RAND_487 = {1{`RANDOM}};
  uops_4_is_sys_pc2epc = _RAND_487[0:0];
  _RAND_488 = {1{`RANDOM}};
  uops_4_is_unique = _RAND_488[0:0];
  _RAND_489 = {1{`RANDOM}};
  uops_4_flush_on_commit = _RAND_489[0:0];
  _RAND_490 = {1{`RANDOM}};
  uops_4_ldst_is_rs1 = _RAND_490[0:0];
  _RAND_491 = {1{`RANDOM}};
  uops_4_ldst = _RAND_491[5:0];
  _RAND_492 = {1{`RANDOM}};
  uops_4_lrs1 = _RAND_492[5:0];
  _RAND_493 = {1{`RANDOM}};
  uops_4_lrs2 = _RAND_493[5:0];
  _RAND_494 = {1{`RANDOM}};
  uops_4_lrs3 = _RAND_494[5:0];
  _RAND_495 = {1{`RANDOM}};
  uops_4_ldst_val = _RAND_495[0:0];
  _RAND_496 = {1{`RANDOM}};
  uops_4_dst_rtype = _RAND_496[1:0];
  _RAND_497 = {1{`RANDOM}};
  uops_4_lrs1_rtype = _RAND_497[1:0];
  _RAND_498 = {1{`RANDOM}};
  uops_4_lrs2_rtype = _RAND_498[1:0];
  _RAND_499 = {1{`RANDOM}};
  uops_4_frs3_en = _RAND_499[0:0];
  _RAND_500 = {1{`RANDOM}};
  uops_4_fp_val = _RAND_500[0:0];
  _RAND_501 = {1{`RANDOM}};
  uops_4_fp_single = _RAND_501[0:0];
  _RAND_502 = {1{`RANDOM}};
  uops_4_xcpt_pf_if = _RAND_502[0:0];
  _RAND_503 = {1{`RANDOM}};
  uops_4_xcpt_ae_if = _RAND_503[0:0];
  _RAND_504 = {1{`RANDOM}};
  uops_4_xcpt_ma_if = _RAND_504[0:0];
  _RAND_505 = {1{`RANDOM}};
  uops_4_bp_debug_if = _RAND_505[0:0];
  _RAND_506 = {1{`RANDOM}};
  uops_4_bp_xcpt_if = _RAND_506[0:0];
  _RAND_507 = {1{`RANDOM}};
  uops_4_debug_fsrc = _RAND_507[1:0];
  _RAND_508 = {1{`RANDOM}};
  uops_4_debug_tsrc = _RAND_508[1:0];
  _RAND_509 = {1{`RANDOM}};
  uops_5_switch = _RAND_509[0:0];
  _RAND_510 = {1{`RANDOM}};
  uops_5_switch_off = _RAND_510[0:0];
  _RAND_511 = {1{`RANDOM}};
  uops_5_is_unicore = _RAND_511[0:0];
  _RAND_512 = {1{`RANDOM}};
  uops_5_shift = _RAND_512[2:0];
  _RAND_513 = {1{`RANDOM}};
  uops_5_lrs3_rtype = _RAND_513[1:0];
  _RAND_514 = {1{`RANDOM}};
  uops_5_rflag = _RAND_514[0:0];
  _RAND_515 = {1{`RANDOM}};
  uops_5_wflag = _RAND_515[0:0];
  _RAND_516 = {1{`RANDOM}};
  uops_5_prflag = _RAND_516[3:0];
  _RAND_517 = {1{`RANDOM}};
  uops_5_pwflag = _RAND_517[3:0];
  _RAND_518 = {1{`RANDOM}};
  uops_5_pflag_busy = _RAND_518[0:0];
  _RAND_519 = {1{`RANDOM}};
  uops_5_stale_pflag = _RAND_519[3:0];
  _RAND_520 = {1{`RANDOM}};
  uops_5_op1_sel = _RAND_520[3:0];
  _RAND_521 = {1{`RANDOM}};
  uops_5_op2_sel = _RAND_521[3:0];
  _RAND_522 = {1{`RANDOM}};
  uops_5_split_num = _RAND_522[5:0];
  _RAND_523 = {1{`RANDOM}};
  uops_5_self_index = _RAND_523[5:0];
  _RAND_524 = {1{`RANDOM}};
  uops_5_rob_inst_idx = _RAND_524[5:0];
  _RAND_525 = {1{`RANDOM}};
  uops_5_address_num = _RAND_525[5:0];
  _RAND_526 = {1{`RANDOM}};
  uops_5_uopc = _RAND_526[6:0];
  _RAND_527 = {1{`RANDOM}};
  uops_5_inst = _RAND_527[31:0];
  _RAND_528 = {1{`RANDOM}};
  uops_5_debug_inst = _RAND_528[31:0];
  _RAND_529 = {1{`RANDOM}};
  uops_5_is_rvc = _RAND_529[0:0];
  _RAND_530 = {2{`RANDOM}};
  uops_5_debug_pc = _RAND_530[39:0];
  _RAND_531 = {1{`RANDOM}};
  uops_5_iq_type = _RAND_531[2:0];
  _RAND_532 = {1{`RANDOM}};
  uops_5_fu_code = _RAND_532[9:0];
  _RAND_533 = {1{`RANDOM}};
  uops_5_ctrl_br_type = _RAND_533[3:0];
  _RAND_534 = {1{`RANDOM}};
  uops_5_ctrl_op1_sel = _RAND_534[1:0];
  _RAND_535 = {1{`RANDOM}};
  uops_5_ctrl_op2_sel = _RAND_535[2:0];
  _RAND_536 = {1{`RANDOM}};
  uops_5_ctrl_imm_sel = _RAND_536[2:0];
  _RAND_537 = {1{`RANDOM}};
  uops_5_ctrl_op_fcn = _RAND_537[3:0];
  _RAND_538 = {1{`RANDOM}};
  uops_5_ctrl_fcn_dw = _RAND_538[0:0];
  _RAND_539 = {1{`RANDOM}};
  uops_5_ctrl_csr_cmd = _RAND_539[2:0];
  _RAND_540 = {1{`RANDOM}};
  uops_5_ctrl_is_load = _RAND_540[0:0];
  _RAND_541 = {1{`RANDOM}};
  uops_5_ctrl_is_sta = _RAND_541[0:0];
  _RAND_542 = {1{`RANDOM}};
  uops_5_ctrl_is_std = _RAND_542[0:0];
  _RAND_543 = {1{`RANDOM}};
  uops_5_ctrl_op3_sel = _RAND_543[1:0];
  _RAND_544 = {1{`RANDOM}};
  uops_5_iw_state = _RAND_544[1:0];
  _RAND_545 = {1{`RANDOM}};
  uops_5_iw_p1_poisoned = _RAND_545[0:0];
  _RAND_546 = {1{`RANDOM}};
  uops_5_iw_p2_poisoned = _RAND_546[0:0];
  _RAND_547 = {1{`RANDOM}};
  uops_5_is_br = _RAND_547[0:0];
  _RAND_548 = {1{`RANDOM}};
  uops_5_is_jalr = _RAND_548[0:0];
  _RAND_549 = {1{`RANDOM}};
  uops_5_is_jal = _RAND_549[0:0];
  _RAND_550 = {1{`RANDOM}};
  uops_5_is_sfb = _RAND_550[0:0];
  _RAND_551 = {1{`RANDOM}};
  uops_5_br_mask = _RAND_551[11:0];
  _RAND_552 = {1{`RANDOM}};
  uops_5_br_tag = _RAND_552[3:0];
  _RAND_553 = {1{`RANDOM}};
  uops_5_ftq_idx = _RAND_553[4:0];
  _RAND_554 = {1{`RANDOM}};
  uops_5_edge_inst = _RAND_554[0:0];
  _RAND_555 = {1{`RANDOM}};
  uops_5_pc_lob = _RAND_555[5:0];
  _RAND_556 = {1{`RANDOM}};
  uops_5_taken = _RAND_556[0:0];
  _RAND_557 = {1{`RANDOM}};
  uops_5_imm_packed = _RAND_557[19:0];
  _RAND_558 = {1{`RANDOM}};
  uops_5_csr_addr = _RAND_558[11:0];
  _RAND_559 = {1{`RANDOM}};
  uops_5_rob_idx = _RAND_559[5:0];
  _RAND_560 = {1{`RANDOM}};
  uops_5_ldq_idx = _RAND_560[4:0];
  _RAND_561 = {1{`RANDOM}};
  uops_5_stq_idx = _RAND_561[4:0];
  _RAND_562 = {1{`RANDOM}};
  uops_5_rxq_idx = _RAND_562[1:0];
  _RAND_563 = {1{`RANDOM}};
  uops_5_pdst = _RAND_563[6:0];
  _RAND_564 = {1{`RANDOM}};
  uops_5_prs1 = _RAND_564[6:0];
  _RAND_565 = {1{`RANDOM}};
  uops_5_prs2 = _RAND_565[6:0];
  _RAND_566 = {1{`RANDOM}};
  uops_5_prs3 = _RAND_566[6:0];
  _RAND_567 = {1{`RANDOM}};
  uops_5_ppred = _RAND_567[4:0];
  _RAND_568 = {1{`RANDOM}};
  uops_5_prs1_busy = _RAND_568[0:0];
  _RAND_569 = {1{`RANDOM}};
  uops_5_prs2_busy = _RAND_569[0:0];
  _RAND_570 = {1{`RANDOM}};
  uops_5_prs3_busy = _RAND_570[0:0];
  _RAND_571 = {1{`RANDOM}};
  uops_5_ppred_busy = _RAND_571[0:0];
  _RAND_572 = {1{`RANDOM}};
  uops_5_stale_pdst = _RAND_572[6:0];
  _RAND_573 = {1{`RANDOM}};
  uops_5_exception = _RAND_573[0:0];
  _RAND_574 = {2{`RANDOM}};
  uops_5_exc_cause = _RAND_574[63:0];
  _RAND_575 = {1{`RANDOM}};
  uops_5_bypassable = _RAND_575[0:0];
  _RAND_576 = {1{`RANDOM}};
  uops_5_mem_cmd = _RAND_576[4:0];
  _RAND_577 = {1{`RANDOM}};
  uops_5_mem_size = _RAND_577[1:0];
  _RAND_578 = {1{`RANDOM}};
  uops_5_mem_signed = _RAND_578[0:0];
  _RAND_579 = {1{`RANDOM}};
  uops_5_is_fence = _RAND_579[0:0];
  _RAND_580 = {1{`RANDOM}};
  uops_5_is_fencei = _RAND_580[0:0];
  _RAND_581 = {1{`RANDOM}};
  uops_5_is_amo = _RAND_581[0:0];
  _RAND_582 = {1{`RANDOM}};
  uops_5_uses_ldq = _RAND_582[0:0];
  _RAND_583 = {1{`RANDOM}};
  uops_5_uses_stq = _RAND_583[0:0];
  _RAND_584 = {1{`RANDOM}};
  uops_5_is_sys_pc2epc = _RAND_584[0:0];
  _RAND_585 = {1{`RANDOM}};
  uops_5_is_unique = _RAND_585[0:0];
  _RAND_586 = {1{`RANDOM}};
  uops_5_flush_on_commit = _RAND_586[0:0];
  _RAND_587 = {1{`RANDOM}};
  uops_5_ldst_is_rs1 = _RAND_587[0:0];
  _RAND_588 = {1{`RANDOM}};
  uops_5_ldst = _RAND_588[5:0];
  _RAND_589 = {1{`RANDOM}};
  uops_5_lrs1 = _RAND_589[5:0];
  _RAND_590 = {1{`RANDOM}};
  uops_5_lrs2 = _RAND_590[5:0];
  _RAND_591 = {1{`RANDOM}};
  uops_5_lrs3 = _RAND_591[5:0];
  _RAND_592 = {1{`RANDOM}};
  uops_5_ldst_val = _RAND_592[0:0];
  _RAND_593 = {1{`RANDOM}};
  uops_5_dst_rtype = _RAND_593[1:0];
  _RAND_594 = {1{`RANDOM}};
  uops_5_lrs1_rtype = _RAND_594[1:0];
  _RAND_595 = {1{`RANDOM}};
  uops_5_lrs2_rtype = _RAND_595[1:0];
  _RAND_596 = {1{`RANDOM}};
  uops_5_frs3_en = _RAND_596[0:0];
  _RAND_597 = {1{`RANDOM}};
  uops_5_fp_val = _RAND_597[0:0];
  _RAND_598 = {1{`RANDOM}};
  uops_5_fp_single = _RAND_598[0:0];
  _RAND_599 = {1{`RANDOM}};
  uops_5_xcpt_pf_if = _RAND_599[0:0];
  _RAND_600 = {1{`RANDOM}};
  uops_5_xcpt_ae_if = _RAND_600[0:0];
  _RAND_601 = {1{`RANDOM}};
  uops_5_xcpt_ma_if = _RAND_601[0:0];
  _RAND_602 = {1{`RANDOM}};
  uops_5_bp_debug_if = _RAND_602[0:0];
  _RAND_603 = {1{`RANDOM}};
  uops_5_bp_xcpt_if = _RAND_603[0:0];
  _RAND_604 = {1{`RANDOM}};
  uops_5_debug_fsrc = _RAND_604[1:0];
  _RAND_605 = {1{`RANDOM}};
  uops_5_debug_tsrc = _RAND_605[1:0];
  _RAND_606 = {1{`RANDOM}};
  uops_6_switch = _RAND_606[0:0];
  _RAND_607 = {1{`RANDOM}};
  uops_6_switch_off = _RAND_607[0:0];
  _RAND_608 = {1{`RANDOM}};
  uops_6_is_unicore = _RAND_608[0:0];
  _RAND_609 = {1{`RANDOM}};
  uops_6_shift = _RAND_609[2:0];
  _RAND_610 = {1{`RANDOM}};
  uops_6_lrs3_rtype = _RAND_610[1:0];
  _RAND_611 = {1{`RANDOM}};
  uops_6_rflag = _RAND_611[0:0];
  _RAND_612 = {1{`RANDOM}};
  uops_6_wflag = _RAND_612[0:0];
  _RAND_613 = {1{`RANDOM}};
  uops_6_prflag = _RAND_613[3:0];
  _RAND_614 = {1{`RANDOM}};
  uops_6_pwflag = _RAND_614[3:0];
  _RAND_615 = {1{`RANDOM}};
  uops_6_pflag_busy = _RAND_615[0:0];
  _RAND_616 = {1{`RANDOM}};
  uops_6_stale_pflag = _RAND_616[3:0];
  _RAND_617 = {1{`RANDOM}};
  uops_6_op1_sel = _RAND_617[3:0];
  _RAND_618 = {1{`RANDOM}};
  uops_6_op2_sel = _RAND_618[3:0];
  _RAND_619 = {1{`RANDOM}};
  uops_6_split_num = _RAND_619[5:0];
  _RAND_620 = {1{`RANDOM}};
  uops_6_self_index = _RAND_620[5:0];
  _RAND_621 = {1{`RANDOM}};
  uops_6_rob_inst_idx = _RAND_621[5:0];
  _RAND_622 = {1{`RANDOM}};
  uops_6_address_num = _RAND_622[5:0];
  _RAND_623 = {1{`RANDOM}};
  uops_6_uopc = _RAND_623[6:0];
  _RAND_624 = {1{`RANDOM}};
  uops_6_inst = _RAND_624[31:0];
  _RAND_625 = {1{`RANDOM}};
  uops_6_debug_inst = _RAND_625[31:0];
  _RAND_626 = {1{`RANDOM}};
  uops_6_is_rvc = _RAND_626[0:0];
  _RAND_627 = {2{`RANDOM}};
  uops_6_debug_pc = _RAND_627[39:0];
  _RAND_628 = {1{`RANDOM}};
  uops_6_iq_type = _RAND_628[2:0];
  _RAND_629 = {1{`RANDOM}};
  uops_6_fu_code = _RAND_629[9:0];
  _RAND_630 = {1{`RANDOM}};
  uops_6_ctrl_br_type = _RAND_630[3:0];
  _RAND_631 = {1{`RANDOM}};
  uops_6_ctrl_op1_sel = _RAND_631[1:0];
  _RAND_632 = {1{`RANDOM}};
  uops_6_ctrl_op2_sel = _RAND_632[2:0];
  _RAND_633 = {1{`RANDOM}};
  uops_6_ctrl_imm_sel = _RAND_633[2:0];
  _RAND_634 = {1{`RANDOM}};
  uops_6_ctrl_op_fcn = _RAND_634[3:0];
  _RAND_635 = {1{`RANDOM}};
  uops_6_ctrl_fcn_dw = _RAND_635[0:0];
  _RAND_636 = {1{`RANDOM}};
  uops_6_ctrl_csr_cmd = _RAND_636[2:0];
  _RAND_637 = {1{`RANDOM}};
  uops_6_ctrl_is_load = _RAND_637[0:0];
  _RAND_638 = {1{`RANDOM}};
  uops_6_ctrl_is_sta = _RAND_638[0:0];
  _RAND_639 = {1{`RANDOM}};
  uops_6_ctrl_is_std = _RAND_639[0:0];
  _RAND_640 = {1{`RANDOM}};
  uops_6_ctrl_op3_sel = _RAND_640[1:0];
  _RAND_641 = {1{`RANDOM}};
  uops_6_iw_state = _RAND_641[1:0];
  _RAND_642 = {1{`RANDOM}};
  uops_6_iw_p1_poisoned = _RAND_642[0:0];
  _RAND_643 = {1{`RANDOM}};
  uops_6_iw_p2_poisoned = _RAND_643[0:0];
  _RAND_644 = {1{`RANDOM}};
  uops_6_is_br = _RAND_644[0:0];
  _RAND_645 = {1{`RANDOM}};
  uops_6_is_jalr = _RAND_645[0:0];
  _RAND_646 = {1{`RANDOM}};
  uops_6_is_jal = _RAND_646[0:0];
  _RAND_647 = {1{`RANDOM}};
  uops_6_is_sfb = _RAND_647[0:0];
  _RAND_648 = {1{`RANDOM}};
  uops_6_br_mask = _RAND_648[11:0];
  _RAND_649 = {1{`RANDOM}};
  uops_6_br_tag = _RAND_649[3:0];
  _RAND_650 = {1{`RANDOM}};
  uops_6_ftq_idx = _RAND_650[4:0];
  _RAND_651 = {1{`RANDOM}};
  uops_6_edge_inst = _RAND_651[0:0];
  _RAND_652 = {1{`RANDOM}};
  uops_6_pc_lob = _RAND_652[5:0];
  _RAND_653 = {1{`RANDOM}};
  uops_6_taken = _RAND_653[0:0];
  _RAND_654 = {1{`RANDOM}};
  uops_6_imm_packed = _RAND_654[19:0];
  _RAND_655 = {1{`RANDOM}};
  uops_6_csr_addr = _RAND_655[11:0];
  _RAND_656 = {1{`RANDOM}};
  uops_6_rob_idx = _RAND_656[5:0];
  _RAND_657 = {1{`RANDOM}};
  uops_6_ldq_idx = _RAND_657[4:0];
  _RAND_658 = {1{`RANDOM}};
  uops_6_stq_idx = _RAND_658[4:0];
  _RAND_659 = {1{`RANDOM}};
  uops_6_rxq_idx = _RAND_659[1:0];
  _RAND_660 = {1{`RANDOM}};
  uops_6_pdst = _RAND_660[6:0];
  _RAND_661 = {1{`RANDOM}};
  uops_6_prs1 = _RAND_661[6:0];
  _RAND_662 = {1{`RANDOM}};
  uops_6_prs2 = _RAND_662[6:0];
  _RAND_663 = {1{`RANDOM}};
  uops_6_prs3 = _RAND_663[6:0];
  _RAND_664 = {1{`RANDOM}};
  uops_6_ppred = _RAND_664[4:0];
  _RAND_665 = {1{`RANDOM}};
  uops_6_prs1_busy = _RAND_665[0:0];
  _RAND_666 = {1{`RANDOM}};
  uops_6_prs2_busy = _RAND_666[0:0];
  _RAND_667 = {1{`RANDOM}};
  uops_6_prs3_busy = _RAND_667[0:0];
  _RAND_668 = {1{`RANDOM}};
  uops_6_ppred_busy = _RAND_668[0:0];
  _RAND_669 = {1{`RANDOM}};
  uops_6_stale_pdst = _RAND_669[6:0];
  _RAND_670 = {1{`RANDOM}};
  uops_6_exception = _RAND_670[0:0];
  _RAND_671 = {2{`RANDOM}};
  uops_6_exc_cause = _RAND_671[63:0];
  _RAND_672 = {1{`RANDOM}};
  uops_6_bypassable = _RAND_672[0:0];
  _RAND_673 = {1{`RANDOM}};
  uops_6_mem_cmd = _RAND_673[4:0];
  _RAND_674 = {1{`RANDOM}};
  uops_6_mem_size = _RAND_674[1:0];
  _RAND_675 = {1{`RANDOM}};
  uops_6_mem_signed = _RAND_675[0:0];
  _RAND_676 = {1{`RANDOM}};
  uops_6_is_fence = _RAND_676[0:0];
  _RAND_677 = {1{`RANDOM}};
  uops_6_is_fencei = _RAND_677[0:0];
  _RAND_678 = {1{`RANDOM}};
  uops_6_is_amo = _RAND_678[0:0];
  _RAND_679 = {1{`RANDOM}};
  uops_6_uses_ldq = _RAND_679[0:0];
  _RAND_680 = {1{`RANDOM}};
  uops_6_uses_stq = _RAND_680[0:0];
  _RAND_681 = {1{`RANDOM}};
  uops_6_is_sys_pc2epc = _RAND_681[0:0];
  _RAND_682 = {1{`RANDOM}};
  uops_6_is_unique = _RAND_682[0:0];
  _RAND_683 = {1{`RANDOM}};
  uops_6_flush_on_commit = _RAND_683[0:0];
  _RAND_684 = {1{`RANDOM}};
  uops_6_ldst_is_rs1 = _RAND_684[0:0];
  _RAND_685 = {1{`RANDOM}};
  uops_6_ldst = _RAND_685[5:0];
  _RAND_686 = {1{`RANDOM}};
  uops_6_lrs1 = _RAND_686[5:0];
  _RAND_687 = {1{`RANDOM}};
  uops_6_lrs2 = _RAND_687[5:0];
  _RAND_688 = {1{`RANDOM}};
  uops_6_lrs3 = _RAND_688[5:0];
  _RAND_689 = {1{`RANDOM}};
  uops_6_ldst_val = _RAND_689[0:0];
  _RAND_690 = {1{`RANDOM}};
  uops_6_dst_rtype = _RAND_690[1:0];
  _RAND_691 = {1{`RANDOM}};
  uops_6_lrs1_rtype = _RAND_691[1:0];
  _RAND_692 = {1{`RANDOM}};
  uops_6_lrs2_rtype = _RAND_692[1:0];
  _RAND_693 = {1{`RANDOM}};
  uops_6_frs3_en = _RAND_693[0:0];
  _RAND_694 = {1{`RANDOM}};
  uops_6_fp_val = _RAND_694[0:0];
  _RAND_695 = {1{`RANDOM}};
  uops_6_fp_single = _RAND_695[0:0];
  _RAND_696 = {1{`RANDOM}};
  uops_6_xcpt_pf_if = _RAND_696[0:0];
  _RAND_697 = {1{`RANDOM}};
  uops_6_xcpt_ae_if = _RAND_697[0:0];
  _RAND_698 = {1{`RANDOM}};
  uops_6_xcpt_ma_if = _RAND_698[0:0];
  _RAND_699 = {1{`RANDOM}};
  uops_6_bp_debug_if = _RAND_699[0:0];
  _RAND_700 = {1{`RANDOM}};
  uops_6_bp_xcpt_if = _RAND_700[0:0];
  _RAND_701 = {1{`RANDOM}};
  uops_6_debug_fsrc = _RAND_701[1:0];
  _RAND_702 = {1{`RANDOM}};
  uops_6_debug_tsrc = _RAND_702[1:0];
  _RAND_703 = {1{`RANDOM}};
  uops_7_switch = _RAND_703[0:0];
  _RAND_704 = {1{`RANDOM}};
  uops_7_switch_off = _RAND_704[0:0];
  _RAND_705 = {1{`RANDOM}};
  uops_7_is_unicore = _RAND_705[0:0];
  _RAND_706 = {1{`RANDOM}};
  uops_7_shift = _RAND_706[2:0];
  _RAND_707 = {1{`RANDOM}};
  uops_7_lrs3_rtype = _RAND_707[1:0];
  _RAND_708 = {1{`RANDOM}};
  uops_7_rflag = _RAND_708[0:0];
  _RAND_709 = {1{`RANDOM}};
  uops_7_wflag = _RAND_709[0:0];
  _RAND_710 = {1{`RANDOM}};
  uops_7_prflag = _RAND_710[3:0];
  _RAND_711 = {1{`RANDOM}};
  uops_7_pwflag = _RAND_711[3:0];
  _RAND_712 = {1{`RANDOM}};
  uops_7_pflag_busy = _RAND_712[0:0];
  _RAND_713 = {1{`RANDOM}};
  uops_7_stale_pflag = _RAND_713[3:0];
  _RAND_714 = {1{`RANDOM}};
  uops_7_op1_sel = _RAND_714[3:0];
  _RAND_715 = {1{`RANDOM}};
  uops_7_op2_sel = _RAND_715[3:0];
  _RAND_716 = {1{`RANDOM}};
  uops_7_split_num = _RAND_716[5:0];
  _RAND_717 = {1{`RANDOM}};
  uops_7_self_index = _RAND_717[5:0];
  _RAND_718 = {1{`RANDOM}};
  uops_7_rob_inst_idx = _RAND_718[5:0];
  _RAND_719 = {1{`RANDOM}};
  uops_7_address_num = _RAND_719[5:0];
  _RAND_720 = {1{`RANDOM}};
  uops_7_uopc = _RAND_720[6:0];
  _RAND_721 = {1{`RANDOM}};
  uops_7_inst = _RAND_721[31:0];
  _RAND_722 = {1{`RANDOM}};
  uops_7_debug_inst = _RAND_722[31:0];
  _RAND_723 = {1{`RANDOM}};
  uops_7_is_rvc = _RAND_723[0:0];
  _RAND_724 = {2{`RANDOM}};
  uops_7_debug_pc = _RAND_724[39:0];
  _RAND_725 = {1{`RANDOM}};
  uops_7_iq_type = _RAND_725[2:0];
  _RAND_726 = {1{`RANDOM}};
  uops_7_fu_code = _RAND_726[9:0];
  _RAND_727 = {1{`RANDOM}};
  uops_7_ctrl_br_type = _RAND_727[3:0];
  _RAND_728 = {1{`RANDOM}};
  uops_7_ctrl_op1_sel = _RAND_728[1:0];
  _RAND_729 = {1{`RANDOM}};
  uops_7_ctrl_op2_sel = _RAND_729[2:0];
  _RAND_730 = {1{`RANDOM}};
  uops_7_ctrl_imm_sel = _RAND_730[2:0];
  _RAND_731 = {1{`RANDOM}};
  uops_7_ctrl_op_fcn = _RAND_731[3:0];
  _RAND_732 = {1{`RANDOM}};
  uops_7_ctrl_fcn_dw = _RAND_732[0:0];
  _RAND_733 = {1{`RANDOM}};
  uops_7_ctrl_csr_cmd = _RAND_733[2:0];
  _RAND_734 = {1{`RANDOM}};
  uops_7_ctrl_is_load = _RAND_734[0:0];
  _RAND_735 = {1{`RANDOM}};
  uops_7_ctrl_is_sta = _RAND_735[0:0];
  _RAND_736 = {1{`RANDOM}};
  uops_7_ctrl_is_std = _RAND_736[0:0];
  _RAND_737 = {1{`RANDOM}};
  uops_7_ctrl_op3_sel = _RAND_737[1:0];
  _RAND_738 = {1{`RANDOM}};
  uops_7_iw_state = _RAND_738[1:0];
  _RAND_739 = {1{`RANDOM}};
  uops_7_iw_p1_poisoned = _RAND_739[0:0];
  _RAND_740 = {1{`RANDOM}};
  uops_7_iw_p2_poisoned = _RAND_740[0:0];
  _RAND_741 = {1{`RANDOM}};
  uops_7_is_br = _RAND_741[0:0];
  _RAND_742 = {1{`RANDOM}};
  uops_7_is_jalr = _RAND_742[0:0];
  _RAND_743 = {1{`RANDOM}};
  uops_7_is_jal = _RAND_743[0:0];
  _RAND_744 = {1{`RANDOM}};
  uops_7_is_sfb = _RAND_744[0:0];
  _RAND_745 = {1{`RANDOM}};
  uops_7_br_mask = _RAND_745[11:0];
  _RAND_746 = {1{`RANDOM}};
  uops_7_br_tag = _RAND_746[3:0];
  _RAND_747 = {1{`RANDOM}};
  uops_7_ftq_idx = _RAND_747[4:0];
  _RAND_748 = {1{`RANDOM}};
  uops_7_edge_inst = _RAND_748[0:0];
  _RAND_749 = {1{`RANDOM}};
  uops_7_pc_lob = _RAND_749[5:0];
  _RAND_750 = {1{`RANDOM}};
  uops_7_taken = _RAND_750[0:0];
  _RAND_751 = {1{`RANDOM}};
  uops_7_imm_packed = _RAND_751[19:0];
  _RAND_752 = {1{`RANDOM}};
  uops_7_csr_addr = _RAND_752[11:0];
  _RAND_753 = {1{`RANDOM}};
  uops_7_rob_idx = _RAND_753[5:0];
  _RAND_754 = {1{`RANDOM}};
  uops_7_ldq_idx = _RAND_754[4:0];
  _RAND_755 = {1{`RANDOM}};
  uops_7_stq_idx = _RAND_755[4:0];
  _RAND_756 = {1{`RANDOM}};
  uops_7_rxq_idx = _RAND_756[1:0];
  _RAND_757 = {1{`RANDOM}};
  uops_7_pdst = _RAND_757[6:0];
  _RAND_758 = {1{`RANDOM}};
  uops_7_prs1 = _RAND_758[6:0];
  _RAND_759 = {1{`RANDOM}};
  uops_7_prs2 = _RAND_759[6:0];
  _RAND_760 = {1{`RANDOM}};
  uops_7_prs3 = _RAND_760[6:0];
  _RAND_761 = {1{`RANDOM}};
  uops_7_ppred = _RAND_761[4:0];
  _RAND_762 = {1{`RANDOM}};
  uops_7_prs1_busy = _RAND_762[0:0];
  _RAND_763 = {1{`RANDOM}};
  uops_7_prs2_busy = _RAND_763[0:0];
  _RAND_764 = {1{`RANDOM}};
  uops_7_prs3_busy = _RAND_764[0:0];
  _RAND_765 = {1{`RANDOM}};
  uops_7_ppred_busy = _RAND_765[0:0];
  _RAND_766 = {1{`RANDOM}};
  uops_7_stale_pdst = _RAND_766[6:0];
  _RAND_767 = {1{`RANDOM}};
  uops_7_exception = _RAND_767[0:0];
  _RAND_768 = {2{`RANDOM}};
  uops_7_exc_cause = _RAND_768[63:0];
  _RAND_769 = {1{`RANDOM}};
  uops_7_bypassable = _RAND_769[0:0];
  _RAND_770 = {1{`RANDOM}};
  uops_7_mem_cmd = _RAND_770[4:0];
  _RAND_771 = {1{`RANDOM}};
  uops_7_mem_size = _RAND_771[1:0];
  _RAND_772 = {1{`RANDOM}};
  uops_7_mem_signed = _RAND_772[0:0];
  _RAND_773 = {1{`RANDOM}};
  uops_7_is_fence = _RAND_773[0:0];
  _RAND_774 = {1{`RANDOM}};
  uops_7_is_fencei = _RAND_774[0:0];
  _RAND_775 = {1{`RANDOM}};
  uops_7_is_amo = _RAND_775[0:0];
  _RAND_776 = {1{`RANDOM}};
  uops_7_uses_ldq = _RAND_776[0:0];
  _RAND_777 = {1{`RANDOM}};
  uops_7_uses_stq = _RAND_777[0:0];
  _RAND_778 = {1{`RANDOM}};
  uops_7_is_sys_pc2epc = _RAND_778[0:0];
  _RAND_779 = {1{`RANDOM}};
  uops_7_is_unique = _RAND_779[0:0];
  _RAND_780 = {1{`RANDOM}};
  uops_7_flush_on_commit = _RAND_780[0:0];
  _RAND_781 = {1{`RANDOM}};
  uops_7_ldst_is_rs1 = _RAND_781[0:0];
  _RAND_782 = {1{`RANDOM}};
  uops_7_ldst = _RAND_782[5:0];
  _RAND_783 = {1{`RANDOM}};
  uops_7_lrs1 = _RAND_783[5:0];
  _RAND_784 = {1{`RANDOM}};
  uops_7_lrs2 = _RAND_784[5:0];
  _RAND_785 = {1{`RANDOM}};
  uops_7_lrs3 = _RAND_785[5:0];
  _RAND_786 = {1{`RANDOM}};
  uops_7_ldst_val = _RAND_786[0:0];
  _RAND_787 = {1{`RANDOM}};
  uops_7_dst_rtype = _RAND_787[1:0];
  _RAND_788 = {1{`RANDOM}};
  uops_7_lrs1_rtype = _RAND_788[1:0];
  _RAND_789 = {1{`RANDOM}};
  uops_7_lrs2_rtype = _RAND_789[1:0];
  _RAND_790 = {1{`RANDOM}};
  uops_7_frs3_en = _RAND_790[0:0];
  _RAND_791 = {1{`RANDOM}};
  uops_7_fp_val = _RAND_791[0:0];
  _RAND_792 = {1{`RANDOM}};
  uops_7_fp_single = _RAND_792[0:0];
  _RAND_793 = {1{`RANDOM}};
  uops_7_xcpt_pf_if = _RAND_793[0:0];
  _RAND_794 = {1{`RANDOM}};
  uops_7_xcpt_ae_if = _RAND_794[0:0];
  _RAND_795 = {1{`RANDOM}};
  uops_7_xcpt_ma_if = _RAND_795[0:0];
  _RAND_796 = {1{`RANDOM}};
  uops_7_bp_debug_if = _RAND_796[0:0];
  _RAND_797 = {1{`RANDOM}};
  uops_7_bp_xcpt_if = _RAND_797[0:0];
  _RAND_798 = {1{`RANDOM}};
  uops_7_debug_fsrc = _RAND_798[1:0];
  _RAND_799 = {1{`RANDOM}};
  uops_7_debug_tsrc = _RAND_799[1:0];
  _RAND_800 = {1{`RANDOM}};
  uops_8_switch = _RAND_800[0:0];
  _RAND_801 = {1{`RANDOM}};
  uops_8_switch_off = _RAND_801[0:0];
  _RAND_802 = {1{`RANDOM}};
  uops_8_is_unicore = _RAND_802[0:0];
  _RAND_803 = {1{`RANDOM}};
  uops_8_shift = _RAND_803[2:0];
  _RAND_804 = {1{`RANDOM}};
  uops_8_lrs3_rtype = _RAND_804[1:0];
  _RAND_805 = {1{`RANDOM}};
  uops_8_rflag = _RAND_805[0:0];
  _RAND_806 = {1{`RANDOM}};
  uops_8_wflag = _RAND_806[0:0];
  _RAND_807 = {1{`RANDOM}};
  uops_8_prflag = _RAND_807[3:0];
  _RAND_808 = {1{`RANDOM}};
  uops_8_pwflag = _RAND_808[3:0];
  _RAND_809 = {1{`RANDOM}};
  uops_8_pflag_busy = _RAND_809[0:0];
  _RAND_810 = {1{`RANDOM}};
  uops_8_stale_pflag = _RAND_810[3:0];
  _RAND_811 = {1{`RANDOM}};
  uops_8_op1_sel = _RAND_811[3:0];
  _RAND_812 = {1{`RANDOM}};
  uops_8_op2_sel = _RAND_812[3:0];
  _RAND_813 = {1{`RANDOM}};
  uops_8_split_num = _RAND_813[5:0];
  _RAND_814 = {1{`RANDOM}};
  uops_8_self_index = _RAND_814[5:0];
  _RAND_815 = {1{`RANDOM}};
  uops_8_rob_inst_idx = _RAND_815[5:0];
  _RAND_816 = {1{`RANDOM}};
  uops_8_address_num = _RAND_816[5:0];
  _RAND_817 = {1{`RANDOM}};
  uops_8_uopc = _RAND_817[6:0];
  _RAND_818 = {1{`RANDOM}};
  uops_8_inst = _RAND_818[31:0];
  _RAND_819 = {1{`RANDOM}};
  uops_8_debug_inst = _RAND_819[31:0];
  _RAND_820 = {1{`RANDOM}};
  uops_8_is_rvc = _RAND_820[0:0];
  _RAND_821 = {2{`RANDOM}};
  uops_8_debug_pc = _RAND_821[39:0];
  _RAND_822 = {1{`RANDOM}};
  uops_8_iq_type = _RAND_822[2:0];
  _RAND_823 = {1{`RANDOM}};
  uops_8_fu_code = _RAND_823[9:0];
  _RAND_824 = {1{`RANDOM}};
  uops_8_ctrl_br_type = _RAND_824[3:0];
  _RAND_825 = {1{`RANDOM}};
  uops_8_ctrl_op1_sel = _RAND_825[1:0];
  _RAND_826 = {1{`RANDOM}};
  uops_8_ctrl_op2_sel = _RAND_826[2:0];
  _RAND_827 = {1{`RANDOM}};
  uops_8_ctrl_imm_sel = _RAND_827[2:0];
  _RAND_828 = {1{`RANDOM}};
  uops_8_ctrl_op_fcn = _RAND_828[3:0];
  _RAND_829 = {1{`RANDOM}};
  uops_8_ctrl_fcn_dw = _RAND_829[0:0];
  _RAND_830 = {1{`RANDOM}};
  uops_8_ctrl_csr_cmd = _RAND_830[2:0];
  _RAND_831 = {1{`RANDOM}};
  uops_8_ctrl_is_load = _RAND_831[0:0];
  _RAND_832 = {1{`RANDOM}};
  uops_8_ctrl_is_sta = _RAND_832[0:0];
  _RAND_833 = {1{`RANDOM}};
  uops_8_ctrl_is_std = _RAND_833[0:0];
  _RAND_834 = {1{`RANDOM}};
  uops_8_ctrl_op3_sel = _RAND_834[1:0];
  _RAND_835 = {1{`RANDOM}};
  uops_8_iw_state = _RAND_835[1:0];
  _RAND_836 = {1{`RANDOM}};
  uops_8_iw_p1_poisoned = _RAND_836[0:0];
  _RAND_837 = {1{`RANDOM}};
  uops_8_iw_p2_poisoned = _RAND_837[0:0];
  _RAND_838 = {1{`RANDOM}};
  uops_8_is_br = _RAND_838[0:0];
  _RAND_839 = {1{`RANDOM}};
  uops_8_is_jalr = _RAND_839[0:0];
  _RAND_840 = {1{`RANDOM}};
  uops_8_is_jal = _RAND_840[0:0];
  _RAND_841 = {1{`RANDOM}};
  uops_8_is_sfb = _RAND_841[0:0];
  _RAND_842 = {1{`RANDOM}};
  uops_8_br_mask = _RAND_842[11:0];
  _RAND_843 = {1{`RANDOM}};
  uops_8_br_tag = _RAND_843[3:0];
  _RAND_844 = {1{`RANDOM}};
  uops_8_ftq_idx = _RAND_844[4:0];
  _RAND_845 = {1{`RANDOM}};
  uops_8_edge_inst = _RAND_845[0:0];
  _RAND_846 = {1{`RANDOM}};
  uops_8_pc_lob = _RAND_846[5:0];
  _RAND_847 = {1{`RANDOM}};
  uops_8_taken = _RAND_847[0:0];
  _RAND_848 = {1{`RANDOM}};
  uops_8_imm_packed = _RAND_848[19:0];
  _RAND_849 = {1{`RANDOM}};
  uops_8_csr_addr = _RAND_849[11:0];
  _RAND_850 = {1{`RANDOM}};
  uops_8_rob_idx = _RAND_850[5:0];
  _RAND_851 = {1{`RANDOM}};
  uops_8_ldq_idx = _RAND_851[4:0];
  _RAND_852 = {1{`RANDOM}};
  uops_8_stq_idx = _RAND_852[4:0];
  _RAND_853 = {1{`RANDOM}};
  uops_8_rxq_idx = _RAND_853[1:0];
  _RAND_854 = {1{`RANDOM}};
  uops_8_pdst = _RAND_854[6:0];
  _RAND_855 = {1{`RANDOM}};
  uops_8_prs1 = _RAND_855[6:0];
  _RAND_856 = {1{`RANDOM}};
  uops_8_prs2 = _RAND_856[6:0];
  _RAND_857 = {1{`RANDOM}};
  uops_8_prs3 = _RAND_857[6:0];
  _RAND_858 = {1{`RANDOM}};
  uops_8_ppred = _RAND_858[4:0];
  _RAND_859 = {1{`RANDOM}};
  uops_8_prs1_busy = _RAND_859[0:0];
  _RAND_860 = {1{`RANDOM}};
  uops_8_prs2_busy = _RAND_860[0:0];
  _RAND_861 = {1{`RANDOM}};
  uops_8_prs3_busy = _RAND_861[0:0];
  _RAND_862 = {1{`RANDOM}};
  uops_8_ppred_busy = _RAND_862[0:0];
  _RAND_863 = {1{`RANDOM}};
  uops_8_stale_pdst = _RAND_863[6:0];
  _RAND_864 = {1{`RANDOM}};
  uops_8_exception = _RAND_864[0:0];
  _RAND_865 = {2{`RANDOM}};
  uops_8_exc_cause = _RAND_865[63:0];
  _RAND_866 = {1{`RANDOM}};
  uops_8_bypassable = _RAND_866[0:0];
  _RAND_867 = {1{`RANDOM}};
  uops_8_mem_cmd = _RAND_867[4:0];
  _RAND_868 = {1{`RANDOM}};
  uops_8_mem_size = _RAND_868[1:0];
  _RAND_869 = {1{`RANDOM}};
  uops_8_mem_signed = _RAND_869[0:0];
  _RAND_870 = {1{`RANDOM}};
  uops_8_is_fence = _RAND_870[0:0];
  _RAND_871 = {1{`RANDOM}};
  uops_8_is_fencei = _RAND_871[0:0];
  _RAND_872 = {1{`RANDOM}};
  uops_8_is_amo = _RAND_872[0:0];
  _RAND_873 = {1{`RANDOM}};
  uops_8_uses_ldq = _RAND_873[0:0];
  _RAND_874 = {1{`RANDOM}};
  uops_8_uses_stq = _RAND_874[0:0];
  _RAND_875 = {1{`RANDOM}};
  uops_8_is_sys_pc2epc = _RAND_875[0:0];
  _RAND_876 = {1{`RANDOM}};
  uops_8_is_unique = _RAND_876[0:0];
  _RAND_877 = {1{`RANDOM}};
  uops_8_flush_on_commit = _RAND_877[0:0];
  _RAND_878 = {1{`RANDOM}};
  uops_8_ldst_is_rs1 = _RAND_878[0:0];
  _RAND_879 = {1{`RANDOM}};
  uops_8_ldst = _RAND_879[5:0];
  _RAND_880 = {1{`RANDOM}};
  uops_8_lrs1 = _RAND_880[5:0];
  _RAND_881 = {1{`RANDOM}};
  uops_8_lrs2 = _RAND_881[5:0];
  _RAND_882 = {1{`RANDOM}};
  uops_8_lrs3 = _RAND_882[5:0];
  _RAND_883 = {1{`RANDOM}};
  uops_8_ldst_val = _RAND_883[0:0];
  _RAND_884 = {1{`RANDOM}};
  uops_8_dst_rtype = _RAND_884[1:0];
  _RAND_885 = {1{`RANDOM}};
  uops_8_lrs1_rtype = _RAND_885[1:0];
  _RAND_886 = {1{`RANDOM}};
  uops_8_lrs2_rtype = _RAND_886[1:0];
  _RAND_887 = {1{`RANDOM}};
  uops_8_frs3_en = _RAND_887[0:0];
  _RAND_888 = {1{`RANDOM}};
  uops_8_fp_val = _RAND_888[0:0];
  _RAND_889 = {1{`RANDOM}};
  uops_8_fp_single = _RAND_889[0:0];
  _RAND_890 = {1{`RANDOM}};
  uops_8_xcpt_pf_if = _RAND_890[0:0];
  _RAND_891 = {1{`RANDOM}};
  uops_8_xcpt_ae_if = _RAND_891[0:0];
  _RAND_892 = {1{`RANDOM}};
  uops_8_xcpt_ma_if = _RAND_892[0:0];
  _RAND_893 = {1{`RANDOM}};
  uops_8_bp_debug_if = _RAND_893[0:0];
  _RAND_894 = {1{`RANDOM}};
  uops_8_bp_xcpt_if = _RAND_894[0:0];
  _RAND_895 = {1{`RANDOM}};
  uops_8_debug_fsrc = _RAND_895[1:0];
  _RAND_896 = {1{`RANDOM}};
  uops_8_debug_tsrc = _RAND_896[1:0];
  _RAND_897 = {1{`RANDOM}};
  uops_9_switch = _RAND_897[0:0];
  _RAND_898 = {1{`RANDOM}};
  uops_9_switch_off = _RAND_898[0:0];
  _RAND_899 = {1{`RANDOM}};
  uops_9_is_unicore = _RAND_899[0:0];
  _RAND_900 = {1{`RANDOM}};
  uops_9_shift = _RAND_900[2:0];
  _RAND_901 = {1{`RANDOM}};
  uops_9_lrs3_rtype = _RAND_901[1:0];
  _RAND_902 = {1{`RANDOM}};
  uops_9_rflag = _RAND_902[0:0];
  _RAND_903 = {1{`RANDOM}};
  uops_9_wflag = _RAND_903[0:0];
  _RAND_904 = {1{`RANDOM}};
  uops_9_prflag = _RAND_904[3:0];
  _RAND_905 = {1{`RANDOM}};
  uops_9_pwflag = _RAND_905[3:0];
  _RAND_906 = {1{`RANDOM}};
  uops_9_pflag_busy = _RAND_906[0:0];
  _RAND_907 = {1{`RANDOM}};
  uops_9_stale_pflag = _RAND_907[3:0];
  _RAND_908 = {1{`RANDOM}};
  uops_9_op1_sel = _RAND_908[3:0];
  _RAND_909 = {1{`RANDOM}};
  uops_9_op2_sel = _RAND_909[3:0];
  _RAND_910 = {1{`RANDOM}};
  uops_9_split_num = _RAND_910[5:0];
  _RAND_911 = {1{`RANDOM}};
  uops_9_self_index = _RAND_911[5:0];
  _RAND_912 = {1{`RANDOM}};
  uops_9_rob_inst_idx = _RAND_912[5:0];
  _RAND_913 = {1{`RANDOM}};
  uops_9_address_num = _RAND_913[5:0];
  _RAND_914 = {1{`RANDOM}};
  uops_9_uopc = _RAND_914[6:0];
  _RAND_915 = {1{`RANDOM}};
  uops_9_inst = _RAND_915[31:0];
  _RAND_916 = {1{`RANDOM}};
  uops_9_debug_inst = _RAND_916[31:0];
  _RAND_917 = {1{`RANDOM}};
  uops_9_is_rvc = _RAND_917[0:0];
  _RAND_918 = {2{`RANDOM}};
  uops_9_debug_pc = _RAND_918[39:0];
  _RAND_919 = {1{`RANDOM}};
  uops_9_iq_type = _RAND_919[2:0];
  _RAND_920 = {1{`RANDOM}};
  uops_9_fu_code = _RAND_920[9:0];
  _RAND_921 = {1{`RANDOM}};
  uops_9_ctrl_br_type = _RAND_921[3:0];
  _RAND_922 = {1{`RANDOM}};
  uops_9_ctrl_op1_sel = _RAND_922[1:0];
  _RAND_923 = {1{`RANDOM}};
  uops_9_ctrl_op2_sel = _RAND_923[2:0];
  _RAND_924 = {1{`RANDOM}};
  uops_9_ctrl_imm_sel = _RAND_924[2:0];
  _RAND_925 = {1{`RANDOM}};
  uops_9_ctrl_op_fcn = _RAND_925[3:0];
  _RAND_926 = {1{`RANDOM}};
  uops_9_ctrl_fcn_dw = _RAND_926[0:0];
  _RAND_927 = {1{`RANDOM}};
  uops_9_ctrl_csr_cmd = _RAND_927[2:0];
  _RAND_928 = {1{`RANDOM}};
  uops_9_ctrl_is_load = _RAND_928[0:0];
  _RAND_929 = {1{`RANDOM}};
  uops_9_ctrl_is_sta = _RAND_929[0:0];
  _RAND_930 = {1{`RANDOM}};
  uops_9_ctrl_is_std = _RAND_930[0:0];
  _RAND_931 = {1{`RANDOM}};
  uops_9_ctrl_op3_sel = _RAND_931[1:0];
  _RAND_932 = {1{`RANDOM}};
  uops_9_iw_state = _RAND_932[1:0];
  _RAND_933 = {1{`RANDOM}};
  uops_9_iw_p1_poisoned = _RAND_933[0:0];
  _RAND_934 = {1{`RANDOM}};
  uops_9_iw_p2_poisoned = _RAND_934[0:0];
  _RAND_935 = {1{`RANDOM}};
  uops_9_is_br = _RAND_935[0:0];
  _RAND_936 = {1{`RANDOM}};
  uops_9_is_jalr = _RAND_936[0:0];
  _RAND_937 = {1{`RANDOM}};
  uops_9_is_jal = _RAND_937[0:0];
  _RAND_938 = {1{`RANDOM}};
  uops_9_is_sfb = _RAND_938[0:0];
  _RAND_939 = {1{`RANDOM}};
  uops_9_br_mask = _RAND_939[11:0];
  _RAND_940 = {1{`RANDOM}};
  uops_9_br_tag = _RAND_940[3:0];
  _RAND_941 = {1{`RANDOM}};
  uops_9_ftq_idx = _RAND_941[4:0];
  _RAND_942 = {1{`RANDOM}};
  uops_9_edge_inst = _RAND_942[0:0];
  _RAND_943 = {1{`RANDOM}};
  uops_9_pc_lob = _RAND_943[5:0];
  _RAND_944 = {1{`RANDOM}};
  uops_9_taken = _RAND_944[0:0];
  _RAND_945 = {1{`RANDOM}};
  uops_9_imm_packed = _RAND_945[19:0];
  _RAND_946 = {1{`RANDOM}};
  uops_9_csr_addr = _RAND_946[11:0];
  _RAND_947 = {1{`RANDOM}};
  uops_9_rob_idx = _RAND_947[5:0];
  _RAND_948 = {1{`RANDOM}};
  uops_9_ldq_idx = _RAND_948[4:0];
  _RAND_949 = {1{`RANDOM}};
  uops_9_stq_idx = _RAND_949[4:0];
  _RAND_950 = {1{`RANDOM}};
  uops_9_rxq_idx = _RAND_950[1:0];
  _RAND_951 = {1{`RANDOM}};
  uops_9_pdst = _RAND_951[6:0];
  _RAND_952 = {1{`RANDOM}};
  uops_9_prs1 = _RAND_952[6:0];
  _RAND_953 = {1{`RANDOM}};
  uops_9_prs2 = _RAND_953[6:0];
  _RAND_954 = {1{`RANDOM}};
  uops_9_prs3 = _RAND_954[6:0];
  _RAND_955 = {1{`RANDOM}};
  uops_9_ppred = _RAND_955[4:0];
  _RAND_956 = {1{`RANDOM}};
  uops_9_prs1_busy = _RAND_956[0:0];
  _RAND_957 = {1{`RANDOM}};
  uops_9_prs2_busy = _RAND_957[0:0];
  _RAND_958 = {1{`RANDOM}};
  uops_9_prs3_busy = _RAND_958[0:0];
  _RAND_959 = {1{`RANDOM}};
  uops_9_ppred_busy = _RAND_959[0:0];
  _RAND_960 = {1{`RANDOM}};
  uops_9_stale_pdst = _RAND_960[6:0];
  _RAND_961 = {1{`RANDOM}};
  uops_9_exception = _RAND_961[0:0];
  _RAND_962 = {2{`RANDOM}};
  uops_9_exc_cause = _RAND_962[63:0];
  _RAND_963 = {1{`RANDOM}};
  uops_9_bypassable = _RAND_963[0:0];
  _RAND_964 = {1{`RANDOM}};
  uops_9_mem_cmd = _RAND_964[4:0];
  _RAND_965 = {1{`RANDOM}};
  uops_9_mem_size = _RAND_965[1:0];
  _RAND_966 = {1{`RANDOM}};
  uops_9_mem_signed = _RAND_966[0:0];
  _RAND_967 = {1{`RANDOM}};
  uops_9_is_fence = _RAND_967[0:0];
  _RAND_968 = {1{`RANDOM}};
  uops_9_is_fencei = _RAND_968[0:0];
  _RAND_969 = {1{`RANDOM}};
  uops_9_is_amo = _RAND_969[0:0];
  _RAND_970 = {1{`RANDOM}};
  uops_9_uses_ldq = _RAND_970[0:0];
  _RAND_971 = {1{`RANDOM}};
  uops_9_uses_stq = _RAND_971[0:0];
  _RAND_972 = {1{`RANDOM}};
  uops_9_is_sys_pc2epc = _RAND_972[0:0];
  _RAND_973 = {1{`RANDOM}};
  uops_9_is_unique = _RAND_973[0:0];
  _RAND_974 = {1{`RANDOM}};
  uops_9_flush_on_commit = _RAND_974[0:0];
  _RAND_975 = {1{`RANDOM}};
  uops_9_ldst_is_rs1 = _RAND_975[0:0];
  _RAND_976 = {1{`RANDOM}};
  uops_9_ldst = _RAND_976[5:0];
  _RAND_977 = {1{`RANDOM}};
  uops_9_lrs1 = _RAND_977[5:0];
  _RAND_978 = {1{`RANDOM}};
  uops_9_lrs2 = _RAND_978[5:0];
  _RAND_979 = {1{`RANDOM}};
  uops_9_lrs3 = _RAND_979[5:0];
  _RAND_980 = {1{`RANDOM}};
  uops_9_ldst_val = _RAND_980[0:0];
  _RAND_981 = {1{`RANDOM}};
  uops_9_dst_rtype = _RAND_981[1:0];
  _RAND_982 = {1{`RANDOM}};
  uops_9_lrs1_rtype = _RAND_982[1:0];
  _RAND_983 = {1{`RANDOM}};
  uops_9_lrs2_rtype = _RAND_983[1:0];
  _RAND_984 = {1{`RANDOM}};
  uops_9_frs3_en = _RAND_984[0:0];
  _RAND_985 = {1{`RANDOM}};
  uops_9_fp_val = _RAND_985[0:0];
  _RAND_986 = {1{`RANDOM}};
  uops_9_fp_single = _RAND_986[0:0];
  _RAND_987 = {1{`RANDOM}};
  uops_9_xcpt_pf_if = _RAND_987[0:0];
  _RAND_988 = {1{`RANDOM}};
  uops_9_xcpt_ae_if = _RAND_988[0:0];
  _RAND_989 = {1{`RANDOM}};
  uops_9_xcpt_ma_if = _RAND_989[0:0];
  _RAND_990 = {1{`RANDOM}};
  uops_9_bp_debug_if = _RAND_990[0:0];
  _RAND_991 = {1{`RANDOM}};
  uops_9_bp_xcpt_if = _RAND_991[0:0];
  _RAND_992 = {1{`RANDOM}};
  uops_9_debug_fsrc = _RAND_992[1:0];
  _RAND_993 = {1{`RANDOM}};
  uops_9_debug_tsrc = _RAND_993[1:0];
  _RAND_994 = {1{`RANDOM}};
  uops_10_switch = _RAND_994[0:0];
  _RAND_995 = {1{`RANDOM}};
  uops_10_switch_off = _RAND_995[0:0];
  _RAND_996 = {1{`RANDOM}};
  uops_10_is_unicore = _RAND_996[0:0];
  _RAND_997 = {1{`RANDOM}};
  uops_10_shift = _RAND_997[2:0];
  _RAND_998 = {1{`RANDOM}};
  uops_10_lrs3_rtype = _RAND_998[1:0];
  _RAND_999 = {1{`RANDOM}};
  uops_10_rflag = _RAND_999[0:0];
  _RAND_1000 = {1{`RANDOM}};
  uops_10_wflag = _RAND_1000[0:0];
  _RAND_1001 = {1{`RANDOM}};
  uops_10_prflag = _RAND_1001[3:0];
  _RAND_1002 = {1{`RANDOM}};
  uops_10_pwflag = _RAND_1002[3:0];
  _RAND_1003 = {1{`RANDOM}};
  uops_10_pflag_busy = _RAND_1003[0:0];
  _RAND_1004 = {1{`RANDOM}};
  uops_10_stale_pflag = _RAND_1004[3:0];
  _RAND_1005 = {1{`RANDOM}};
  uops_10_op1_sel = _RAND_1005[3:0];
  _RAND_1006 = {1{`RANDOM}};
  uops_10_op2_sel = _RAND_1006[3:0];
  _RAND_1007 = {1{`RANDOM}};
  uops_10_split_num = _RAND_1007[5:0];
  _RAND_1008 = {1{`RANDOM}};
  uops_10_self_index = _RAND_1008[5:0];
  _RAND_1009 = {1{`RANDOM}};
  uops_10_rob_inst_idx = _RAND_1009[5:0];
  _RAND_1010 = {1{`RANDOM}};
  uops_10_address_num = _RAND_1010[5:0];
  _RAND_1011 = {1{`RANDOM}};
  uops_10_uopc = _RAND_1011[6:0];
  _RAND_1012 = {1{`RANDOM}};
  uops_10_inst = _RAND_1012[31:0];
  _RAND_1013 = {1{`RANDOM}};
  uops_10_debug_inst = _RAND_1013[31:0];
  _RAND_1014 = {1{`RANDOM}};
  uops_10_is_rvc = _RAND_1014[0:0];
  _RAND_1015 = {2{`RANDOM}};
  uops_10_debug_pc = _RAND_1015[39:0];
  _RAND_1016 = {1{`RANDOM}};
  uops_10_iq_type = _RAND_1016[2:0];
  _RAND_1017 = {1{`RANDOM}};
  uops_10_fu_code = _RAND_1017[9:0];
  _RAND_1018 = {1{`RANDOM}};
  uops_10_ctrl_br_type = _RAND_1018[3:0];
  _RAND_1019 = {1{`RANDOM}};
  uops_10_ctrl_op1_sel = _RAND_1019[1:0];
  _RAND_1020 = {1{`RANDOM}};
  uops_10_ctrl_op2_sel = _RAND_1020[2:0];
  _RAND_1021 = {1{`RANDOM}};
  uops_10_ctrl_imm_sel = _RAND_1021[2:0];
  _RAND_1022 = {1{`RANDOM}};
  uops_10_ctrl_op_fcn = _RAND_1022[3:0];
  _RAND_1023 = {1{`RANDOM}};
  uops_10_ctrl_fcn_dw = _RAND_1023[0:0];
  _RAND_1024 = {1{`RANDOM}};
  uops_10_ctrl_csr_cmd = _RAND_1024[2:0];
  _RAND_1025 = {1{`RANDOM}};
  uops_10_ctrl_is_load = _RAND_1025[0:0];
  _RAND_1026 = {1{`RANDOM}};
  uops_10_ctrl_is_sta = _RAND_1026[0:0];
  _RAND_1027 = {1{`RANDOM}};
  uops_10_ctrl_is_std = _RAND_1027[0:0];
  _RAND_1028 = {1{`RANDOM}};
  uops_10_ctrl_op3_sel = _RAND_1028[1:0];
  _RAND_1029 = {1{`RANDOM}};
  uops_10_iw_state = _RAND_1029[1:0];
  _RAND_1030 = {1{`RANDOM}};
  uops_10_iw_p1_poisoned = _RAND_1030[0:0];
  _RAND_1031 = {1{`RANDOM}};
  uops_10_iw_p2_poisoned = _RAND_1031[0:0];
  _RAND_1032 = {1{`RANDOM}};
  uops_10_is_br = _RAND_1032[0:0];
  _RAND_1033 = {1{`RANDOM}};
  uops_10_is_jalr = _RAND_1033[0:0];
  _RAND_1034 = {1{`RANDOM}};
  uops_10_is_jal = _RAND_1034[0:0];
  _RAND_1035 = {1{`RANDOM}};
  uops_10_is_sfb = _RAND_1035[0:0];
  _RAND_1036 = {1{`RANDOM}};
  uops_10_br_mask = _RAND_1036[11:0];
  _RAND_1037 = {1{`RANDOM}};
  uops_10_br_tag = _RAND_1037[3:0];
  _RAND_1038 = {1{`RANDOM}};
  uops_10_ftq_idx = _RAND_1038[4:0];
  _RAND_1039 = {1{`RANDOM}};
  uops_10_edge_inst = _RAND_1039[0:0];
  _RAND_1040 = {1{`RANDOM}};
  uops_10_pc_lob = _RAND_1040[5:0];
  _RAND_1041 = {1{`RANDOM}};
  uops_10_taken = _RAND_1041[0:0];
  _RAND_1042 = {1{`RANDOM}};
  uops_10_imm_packed = _RAND_1042[19:0];
  _RAND_1043 = {1{`RANDOM}};
  uops_10_csr_addr = _RAND_1043[11:0];
  _RAND_1044 = {1{`RANDOM}};
  uops_10_rob_idx = _RAND_1044[5:0];
  _RAND_1045 = {1{`RANDOM}};
  uops_10_ldq_idx = _RAND_1045[4:0];
  _RAND_1046 = {1{`RANDOM}};
  uops_10_stq_idx = _RAND_1046[4:0];
  _RAND_1047 = {1{`RANDOM}};
  uops_10_rxq_idx = _RAND_1047[1:0];
  _RAND_1048 = {1{`RANDOM}};
  uops_10_pdst = _RAND_1048[6:0];
  _RAND_1049 = {1{`RANDOM}};
  uops_10_prs1 = _RAND_1049[6:0];
  _RAND_1050 = {1{`RANDOM}};
  uops_10_prs2 = _RAND_1050[6:0];
  _RAND_1051 = {1{`RANDOM}};
  uops_10_prs3 = _RAND_1051[6:0];
  _RAND_1052 = {1{`RANDOM}};
  uops_10_ppred = _RAND_1052[4:0];
  _RAND_1053 = {1{`RANDOM}};
  uops_10_prs1_busy = _RAND_1053[0:0];
  _RAND_1054 = {1{`RANDOM}};
  uops_10_prs2_busy = _RAND_1054[0:0];
  _RAND_1055 = {1{`RANDOM}};
  uops_10_prs3_busy = _RAND_1055[0:0];
  _RAND_1056 = {1{`RANDOM}};
  uops_10_ppred_busy = _RAND_1056[0:0];
  _RAND_1057 = {1{`RANDOM}};
  uops_10_stale_pdst = _RAND_1057[6:0];
  _RAND_1058 = {1{`RANDOM}};
  uops_10_exception = _RAND_1058[0:0];
  _RAND_1059 = {2{`RANDOM}};
  uops_10_exc_cause = _RAND_1059[63:0];
  _RAND_1060 = {1{`RANDOM}};
  uops_10_bypassable = _RAND_1060[0:0];
  _RAND_1061 = {1{`RANDOM}};
  uops_10_mem_cmd = _RAND_1061[4:0];
  _RAND_1062 = {1{`RANDOM}};
  uops_10_mem_size = _RAND_1062[1:0];
  _RAND_1063 = {1{`RANDOM}};
  uops_10_mem_signed = _RAND_1063[0:0];
  _RAND_1064 = {1{`RANDOM}};
  uops_10_is_fence = _RAND_1064[0:0];
  _RAND_1065 = {1{`RANDOM}};
  uops_10_is_fencei = _RAND_1065[0:0];
  _RAND_1066 = {1{`RANDOM}};
  uops_10_is_amo = _RAND_1066[0:0];
  _RAND_1067 = {1{`RANDOM}};
  uops_10_uses_ldq = _RAND_1067[0:0];
  _RAND_1068 = {1{`RANDOM}};
  uops_10_uses_stq = _RAND_1068[0:0];
  _RAND_1069 = {1{`RANDOM}};
  uops_10_is_sys_pc2epc = _RAND_1069[0:0];
  _RAND_1070 = {1{`RANDOM}};
  uops_10_is_unique = _RAND_1070[0:0];
  _RAND_1071 = {1{`RANDOM}};
  uops_10_flush_on_commit = _RAND_1071[0:0];
  _RAND_1072 = {1{`RANDOM}};
  uops_10_ldst_is_rs1 = _RAND_1072[0:0];
  _RAND_1073 = {1{`RANDOM}};
  uops_10_ldst = _RAND_1073[5:0];
  _RAND_1074 = {1{`RANDOM}};
  uops_10_lrs1 = _RAND_1074[5:0];
  _RAND_1075 = {1{`RANDOM}};
  uops_10_lrs2 = _RAND_1075[5:0];
  _RAND_1076 = {1{`RANDOM}};
  uops_10_lrs3 = _RAND_1076[5:0];
  _RAND_1077 = {1{`RANDOM}};
  uops_10_ldst_val = _RAND_1077[0:0];
  _RAND_1078 = {1{`RANDOM}};
  uops_10_dst_rtype = _RAND_1078[1:0];
  _RAND_1079 = {1{`RANDOM}};
  uops_10_lrs1_rtype = _RAND_1079[1:0];
  _RAND_1080 = {1{`RANDOM}};
  uops_10_lrs2_rtype = _RAND_1080[1:0];
  _RAND_1081 = {1{`RANDOM}};
  uops_10_frs3_en = _RAND_1081[0:0];
  _RAND_1082 = {1{`RANDOM}};
  uops_10_fp_val = _RAND_1082[0:0];
  _RAND_1083 = {1{`RANDOM}};
  uops_10_fp_single = _RAND_1083[0:0];
  _RAND_1084 = {1{`RANDOM}};
  uops_10_xcpt_pf_if = _RAND_1084[0:0];
  _RAND_1085 = {1{`RANDOM}};
  uops_10_xcpt_ae_if = _RAND_1085[0:0];
  _RAND_1086 = {1{`RANDOM}};
  uops_10_xcpt_ma_if = _RAND_1086[0:0];
  _RAND_1087 = {1{`RANDOM}};
  uops_10_bp_debug_if = _RAND_1087[0:0];
  _RAND_1088 = {1{`RANDOM}};
  uops_10_bp_xcpt_if = _RAND_1088[0:0];
  _RAND_1089 = {1{`RANDOM}};
  uops_10_debug_fsrc = _RAND_1089[1:0];
  _RAND_1090 = {1{`RANDOM}};
  uops_10_debug_tsrc = _RAND_1090[1:0];
  _RAND_1091 = {1{`RANDOM}};
  uops_11_switch = _RAND_1091[0:0];
  _RAND_1092 = {1{`RANDOM}};
  uops_11_switch_off = _RAND_1092[0:0];
  _RAND_1093 = {1{`RANDOM}};
  uops_11_is_unicore = _RAND_1093[0:0];
  _RAND_1094 = {1{`RANDOM}};
  uops_11_shift = _RAND_1094[2:0];
  _RAND_1095 = {1{`RANDOM}};
  uops_11_lrs3_rtype = _RAND_1095[1:0];
  _RAND_1096 = {1{`RANDOM}};
  uops_11_rflag = _RAND_1096[0:0];
  _RAND_1097 = {1{`RANDOM}};
  uops_11_wflag = _RAND_1097[0:0];
  _RAND_1098 = {1{`RANDOM}};
  uops_11_prflag = _RAND_1098[3:0];
  _RAND_1099 = {1{`RANDOM}};
  uops_11_pwflag = _RAND_1099[3:0];
  _RAND_1100 = {1{`RANDOM}};
  uops_11_pflag_busy = _RAND_1100[0:0];
  _RAND_1101 = {1{`RANDOM}};
  uops_11_stale_pflag = _RAND_1101[3:0];
  _RAND_1102 = {1{`RANDOM}};
  uops_11_op1_sel = _RAND_1102[3:0];
  _RAND_1103 = {1{`RANDOM}};
  uops_11_op2_sel = _RAND_1103[3:0];
  _RAND_1104 = {1{`RANDOM}};
  uops_11_split_num = _RAND_1104[5:0];
  _RAND_1105 = {1{`RANDOM}};
  uops_11_self_index = _RAND_1105[5:0];
  _RAND_1106 = {1{`RANDOM}};
  uops_11_rob_inst_idx = _RAND_1106[5:0];
  _RAND_1107 = {1{`RANDOM}};
  uops_11_address_num = _RAND_1107[5:0];
  _RAND_1108 = {1{`RANDOM}};
  uops_11_uopc = _RAND_1108[6:0];
  _RAND_1109 = {1{`RANDOM}};
  uops_11_inst = _RAND_1109[31:0];
  _RAND_1110 = {1{`RANDOM}};
  uops_11_debug_inst = _RAND_1110[31:0];
  _RAND_1111 = {1{`RANDOM}};
  uops_11_is_rvc = _RAND_1111[0:0];
  _RAND_1112 = {2{`RANDOM}};
  uops_11_debug_pc = _RAND_1112[39:0];
  _RAND_1113 = {1{`RANDOM}};
  uops_11_iq_type = _RAND_1113[2:0];
  _RAND_1114 = {1{`RANDOM}};
  uops_11_fu_code = _RAND_1114[9:0];
  _RAND_1115 = {1{`RANDOM}};
  uops_11_ctrl_br_type = _RAND_1115[3:0];
  _RAND_1116 = {1{`RANDOM}};
  uops_11_ctrl_op1_sel = _RAND_1116[1:0];
  _RAND_1117 = {1{`RANDOM}};
  uops_11_ctrl_op2_sel = _RAND_1117[2:0];
  _RAND_1118 = {1{`RANDOM}};
  uops_11_ctrl_imm_sel = _RAND_1118[2:0];
  _RAND_1119 = {1{`RANDOM}};
  uops_11_ctrl_op_fcn = _RAND_1119[3:0];
  _RAND_1120 = {1{`RANDOM}};
  uops_11_ctrl_fcn_dw = _RAND_1120[0:0];
  _RAND_1121 = {1{`RANDOM}};
  uops_11_ctrl_csr_cmd = _RAND_1121[2:0];
  _RAND_1122 = {1{`RANDOM}};
  uops_11_ctrl_is_load = _RAND_1122[0:0];
  _RAND_1123 = {1{`RANDOM}};
  uops_11_ctrl_is_sta = _RAND_1123[0:0];
  _RAND_1124 = {1{`RANDOM}};
  uops_11_ctrl_is_std = _RAND_1124[0:0];
  _RAND_1125 = {1{`RANDOM}};
  uops_11_ctrl_op3_sel = _RAND_1125[1:0];
  _RAND_1126 = {1{`RANDOM}};
  uops_11_iw_state = _RAND_1126[1:0];
  _RAND_1127 = {1{`RANDOM}};
  uops_11_iw_p1_poisoned = _RAND_1127[0:0];
  _RAND_1128 = {1{`RANDOM}};
  uops_11_iw_p2_poisoned = _RAND_1128[0:0];
  _RAND_1129 = {1{`RANDOM}};
  uops_11_is_br = _RAND_1129[0:0];
  _RAND_1130 = {1{`RANDOM}};
  uops_11_is_jalr = _RAND_1130[0:0];
  _RAND_1131 = {1{`RANDOM}};
  uops_11_is_jal = _RAND_1131[0:0];
  _RAND_1132 = {1{`RANDOM}};
  uops_11_is_sfb = _RAND_1132[0:0];
  _RAND_1133 = {1{`RANDOM}};
  uops_11_br_mask = _RAND_1133[11:0];
  _RAND_1134 = {1{`RANDOM}};
  uops_11_br_tag = _RAND_1134[3:0];
  _RAND_1135 = {1{`RANDOM}};
  uops_11_ftq_idx = _RAND_1135[4:0];
  _RAND_1136 = {1{`RANDOM}};
  uops_11_edge_inst = _RAND_1136[0:0];
  _RAND_1137 = {1{`RANDOM}};
  uops_11_pc_lob = _RAND_1137[5:0];
  _RAND_1138 = {1{`RANDOM}};
  uops_11_taken = _RAND_1138[0:0];
  _RAND_1139 = {1{`RANDOM}};
  uops_11_imm_packed = _RAND_1139[19:0];
  _RAND_1140 = {1{`RANDOM}};
  uops_11_csr_addr = _RAND_1140[11:0];
  _RAND_1141 = {1{`RANDOM}};
  uops_11_rob_idx = _RAND_1141[5:0];
  _RAND_1142 = {1{`RANDOM}};
  uops_11_ldq_idx = _RAND_1142[4:0];
  _RAND_1143 = {1{`RANDOM}};
  uops_11_stq_idx = _RAND_1143[4:0];
  _RAND_1144 = {1{`RANDOM}};
  uops_11_rxq_idx = _RAND_1144[1:0];
  _RAND_1145 = {1{`RANDOM}};
  uops_11_pdst = _RAND_1145[6:0];
  _RAND_1146 = {1{`RANDOM}};
  uops_11_prs1 = _RAND_1146[6:0];
  _RAND_1147 = {1{`RANDOM}};
  uops_11_prs2 = _RAND_1147[6:0];
  _RAND_1148 = {1{`RANDOM}};
  uops_11_prs3 = _RAND_1148[6:0];
  _RAND_1149 = {1{`RANDOM}};
  uops_11_ppred = _RAND_1149[4:0];
  _RAND_1150 = {1{`RANDOM}};
  uops_11_prs1_busy = _RAND_1150[0:0];
  _RAND_1151 = {1{`RANDOM}};
  uops_11_prs2_busy = _RAND_1151[0:0];
  _RAND_1152 = {1{`RANDOM}};
  uops_11_prs3_busy = _RAND_1152[0:0];
  _RAND_1153 = {1{`RANDOM}};
  uops_11_ppred_busy = _RAND_1153[0:0];
  _RAND_1154 = {1{`RANDOM}};
  uops_11_stale_pdst = _RAND_1154[6:0];
  _RAND_1155 = {1{`RANDOM}};
  uops_11_exception = _RAND_1155[0:0];
  _RAND_1156 = {2{`RANDOM}};
  uops_11_exc_cause = _RAND_1156[63:0];
  _RAND_1157 = {1{`RANDOM}};
  uops_11_bypassable = _RAND_1157[0:0];
  _RAND_1158 = {1{`RANDOM}};
  uops_11_mem_cmd = _RAND_1158[4:0];
  _RAND_1159 = {1{`RANDOM}};
  uops_11_mem_size = _RAND_1159[1:0];
  _RAND_1160 = {1{`RANDOM}};
  uops_11_mem_signed = _RAND_1160[0:0];
  _RAND_1161 = {1{`RANDOM}};
  uops_11_is_fence = _RAND_1161[0:0];
  _RAND_1162 = {1{`RANDOM}};
  uops_11_is_fencei = _RAND_1162[0:0];
  _RAND_1163 = {1{`RANDOM}};
  uops_11_is_amo = _RAND_1163[0:0];
  _RAND_1164 = {1{`RANDOM}};
  uops_11_uses_ldq = _RAND_1164[0:0];
  _RAND_1165 = {1{`RANDOM}};
  uops_11_uses_stq = _RAND_1165[0:0];
  _RAND_1166 = {1{`RANDOM}};
  uops_11_is_sys_pc2epc = _RAND_1166[0:0];
  _RAND_1167 = {1{`RANDOM}};
  uops_11_is_unique = _RAND_1167[0:0];
  _RAND_1168 = {1{`RANDOM}};
  uops_11_flush_on_commit = _RAND_1168[0:0];
  _RAND_1169 = {1{`RANDOM}};
  uops_11_ldst_is_rs1 = _RAND_1169[0:0];
  _RAND_1170 = {1{`RANDOM}};
  uops_11_ldst = _RAND_1170[5:0];
  _RAND_1171 = {1{`RANDOM}};
  uops_11_lrs1 = _RAND_1171[5:0];
  _RAND_1172 = {1{`RANDOM}};
  uops_11_lrs2 = _RAND_1172[5:0];
  _RAND_1173 = {1{`RANDOM}};
  uops_11_lrs3 = _RAND_1173[5:0];
  _RAND_1174 = {1{`RANDOM}};
  uops_11_ldst_val = _RAND_1174[0:0];
  _RAND_1175 = {1{`RANDOM}};
  uops_11_dst_rtype = _RAND_1175[1:0];
  _RAND_1176 = {1{`RANDOM}};
  uops_11_lrs1_rtype = _RAND_1176[1:0];
  _RAND_1177 = {1{`RANDOM}};
  uops_11_lrs2_rtype = _RAND_1177[1:0];
  _RAND_1178 = {1{`RANDOM}};
  uops_11_frs3_en = _RAND_1178[0:0];
  _RAND_1179 = {1{`RANDOM}};
  uops_11_fp_val = _RAND_1179[0:0];
  _RAND_1180 = {1{`RANDOM}};
  uops_11_fp_single = _RAND_1180[0:0];
  _RAND_1181 = {1{`RANDOM}};
  uops_11_xcpt_pf_if = _RAND_1181[0:0];
  _RAND_1182 = {1{`RANDOM}};
  uops_11_xcpt_ae_if = _RAND_1182[0:0];
  _RAND_1183 = {1{`RANDOM}};
  uops_11_xcpt_ma_if = _RAND_1183[0:0];
  _RAND_1184 = {1{`RANDOM}};
  uops_11_bp_debug_if = _RAND_1184[0:0];
  _RAND_1185 = {1{`RANDOM}};
  uops_11_bp_xcpt_if = _RAND_1185[0:0];
  _RAND_1186 = {1{`RANDOM}};
  uops_11_debug_fsrc = _RAND_1186[1:0];
  _RAND_1187 = {1{`RANDOM}};
  uops_11_debug_tsrc = _RAND_1187[1:0];
  _RAND_1188 = {1{`RANDOM}};
  uops_12_switch = _RAND_1188[0:0];
  _RAND_1189 = {1{`RANDOM}};
  uops_12_switch_off = _RAND_1189[0:0];
  _RAND_1190 = {1{`RANDOM}};
  uops_12_is_unicore = _RAND_1190[0:0];
  _RAND_1191 = {1{`RANDOM}};
  uops_12_shift = _RAND_1191[2:0];
  _RAND_1192 = {1{`RANDOM}};
  uops_12_lrs3_rtype = _RAND_1192[1:0];
  _RAND_1193 = {1{`RANDOM}};
  uops_12_rflag = _RAND_1193[0:0];
  _RAND_1194 = {1{`RANDOM}};
  uops_12_wflag = _RAND_1194[0:0];
  _RAND_1195 = {1{`RANDOM}};
  uops_12_prflag = _RAND_1195[3:0];
  _RAND_1196 = {1{`RANDOM}};
  uops_12_pwflag = _RAND_1196[3:0];
  _RAND_1197 = {1{`RANDOM}};
  uops_12_pflag_busy = _RAND_1197[0:0];
  _RAND_1198 = {1{`RANDOM}};
  uops_12_stale_pflag = _RAND_1198[3:0];
  _RAND_1199 = {1{`RANDOM}};
  uops_12_op1_sel = _RAND_1199[3:0];
  _RAND_1200 = {1{`RANDOM}};
  uops_12_op2_sel = _RAND_1200[3:0];
  _RAND_1201 = {1{`RANDOM}};
  uops_12_split_num = _RAND_1201[5:0];
  _RAND_1202 = {1{`RANDOM}};
  uops_12_self_index = _RAND_1202[5:0];
  _RAND_1203 = {1{`RANDOM}};
  uops_12_rob_inst_idx = _RAND_1203[5:0];
  _RAND_1204 = {1{`RANDOM}};
  uops_12_address_num = _RAND_1204[5:0];
  _RAND_1205 = {1{`RANDOM}};
  uops_12_uopc = _RAND_1205[6:0];
  _RAND_1206 = {1{`RANDOM}};
  uops_12_inst = _RAND_1206[31:0];
  _RAND_1207 = {1{`RANDOM}};
  uops_12_debug_inst = _RAND_1207[31:0];
  _RAND_1208 = {1{`RANDOM}};
  uops_12_is_rvc = _RAND_1208[0:0];
  _RAND_1209 = {2{`RANDOM}};
  uops_12_debug_pc = _RAND_1209[39:0];
  _RAND_1210 = {1{`RANDOM}};
  uops_12_iq_type = _RAND_1210[2:0];
  _RAND_1211 = {1{`RANDOM}};
  uops_12_fu_code = _RAND_1211[9:0];
  _RAND_1212 = {1{`RANDOM}};
  uops_12_ctrl_br_type = _RAND_1212[3:0];
  _RAND_1213 = {1{`RANDOM}};
  uops_12_ctrl_op1_sel = _RAND_1213[1:0];
  _RAND_1214 = {1{`RANDOM}};
  uops_12_ctrl_op2_sel = _RAND_1214[2:0];
  _RAND_1215 = {1{`RANDOM}};
  uops_12_ctrl_imm_sel = _RAND_1215[2:0];
  _RAND_1216 = {1{`RANDOM}};
  uops_12_ctrl_op_fcn = _RAND_1216[3:0];
  _RAND_1217 = {1{`RANDOM}};
  uops_12_ctrl_fcn_dw = _RAND_1217[0:0];
  _RAND_1218 = {1{`RANDOM}};
  uops_12_ctrl_csr_cmd = _RAND_1218[2:0];
  _RAND_1219 = {1{`RANDOM}};
  uops_12_ctrl_is_load = _RAND_1219[0:0];
  _RAND_1220 = {1{`RANDOM}};
  uops_12_ctrl_is_sta = _RAND_1220[0:0];
  _RAND_1221 = {1{`RANDOM}};
  uops_12_ctrl_is_std = _RAND_1221[0:0];
  _RAND_1222 = {1{`RANDOM}};
  uops_12_ctrl_op3_sel = _RAND_1222[1:0];
  _RAND_1223 = {1{`RANDOM}};
  uops_12_iw_state = _RAND_1223[1:0];
  _RAND_1224 = {1{`RANDOM}};
  uops_12_iw_p1_poisoned = _RAND_1224[0:0];
  _RAND_1225 = {1{`RANDOM}};
  uops_12_iw_p2_poisoned = _RAND_1225[0:0];
  _RAND_1226 = {1{`RANDOM}};
  uops_12_is_br = _RAND_1226[0:0];
  _RAND_1227 = {1{`RANDOM}};
  uops_12_is_jalr = _RAND_1227[0:0];
  _RAND_1228 = {1{`RANDOM}};
  uops_12_is_jal = _RAND_1228[0:0];
  _RAND_1229 = {1{`RANDOM}};
  uops_12_is_sfb = _RAND_1229[0:0];
  _RAND_1230 = {1{`RANDOM}};
  uops_12_br_mask = _RAND_1230[11:0];
  _RAND_1231 = {1{`RANDOM}};
  uops_12_br_tag = _RAND_1231[3:0];
  _RAND_1232 = {1{`RANDOM}};
  uops_12_ftq_idx = _RAND_1232[4:0];
  _RAND_1233 = {1{`RANDOM}};
  uops_12_edge_inst = _RAND_1233[0:0];
  _RAND_1234 = {1{`RANDOM}};
  uops_12_pc_lob = _RAND_1234[5:0];
  _RAND_1235 = {1{`RANDOM}};
  uops_12_taken = _RAND_1235[0:0];
  _RAND_1236 = {1{`RANDOM}};
  uops_12_imm_packed = _RAND_1236[19:0];
  _RAND_1237 = {1{`RANDOM}};
  uops_12_csr_addr = _RAND_1237[11:0];
  _RAND_1238 = {1{`RANDOM}};
  uops_12_rob_idx = _RAND_1238[5:0];
  _RAND_1239 = {1{`RANDOM}};
  uops_12_ldq_idx = _RAND_1239[4:0];
  _RAND_1240 = {1{`RANDOM}};
  uops_12_stq_idx = _RAND_1240[4:0];
  _RAND_1241 = {1{`RANDOM}};
  uops_12_rxq_idx = _RAND_1241[1:0];
  _RAND_1242 = {1{`RANDOM}};
  uops_12_pdst = _RAND_1242[6:0];
  _RAND_1243 = {1{`RANDOM}};
  uops_12_prs1 = _RAND_1243[6:0];
  _RAND_1244 = {1{`RANDOM}};
  uops_12_prs2 = _RAND_1244[6:0];
  _RAND_1245 = {1{`RANDOM}};
  uops_12_prs3 = _RAND_1245[6:0];
  _RAND_1246 = {1{`RANDOM}};
  uops_12_ppred = _RAND_1246[4:0];
  _RAND_1247 = {1{`RANDOM}};
  uops_12_prs1_busy = _RAND_1247[0:0];
  _RAND_1248 = {1{`RANDOM}};
  uops_12_prs2_busy = _RAND_1248[0:0];
  _RAND_1249 = {1{`RANDOM}};
  uops_12_prs3_busy = _RAND_1249[0:0];
  _RAND_1250 = {1{`RANDOM}};
  uops_12_ppred_busy = _RAND_1250[0:0];
  _RAND_1251 = {1{`RANDOM}};
  uops_12_stale_pdst = _RAND_1251[6:0];
  _RAND_1252 = {1{`RANDOM}};
  uops_12_exception = _RAND_1252[0:0];
  _RAND_1253 = {2{`RANDOM}};
  uops_12_exc_cause = _RAND_1253[63:0];
  _RAND_1254 = {1{`RANDOM}};
  uops_12_bypassable = _RAND_1254[0:0];
  _RAND_1255 = {1{`RANDOM}};
  uops_12_mem_cmd = _RAND_1255[4:0];
  _RAND_1256 = {1{`RANDOM}};
  uops_12_mem_size = _RAND_1256[1:0];
  _RAND_1257 = {1{`RANDOM}};
  uops_12_mem_signed = _RAND_1257[0:0];
  _RAND_1258 = {1{`RANDOM}};
  uops_12_is_fence = _RAND_1258[0:0];
  _RAND_1259 = {1{`RANDOM}};
  uops_12_is_fencei = _RAND_1259[0:0];
  _RAND_1260 = {1{`RANDOM}};
  uops_12_is_amo = _RAND_1260[0:0];
  _RAND_1261 = {1{`RANDOM}};
  uops_12_uses_ldq = _RAND_1261[0:0];
  _RAND_1262 = {1{`RANDOM}};
  uops_12_uses_stq = _RAND_1262[0:0];
  _RAND_1263 = {1{`RANDOM}};
  uops_12_is_sys_pc2epc = _RAND_1263[0:0];
  _RAND_1264 = {1{`RANDOM}};
  uops_12_is_unique = _RAND_1264[0:0];
  _RAND_1265 = {1{`RANDOM}};
  uops_12_flush_on_commit = _RAND_1265[0:0];
  _RAND_1266 = {1{`RANDOM}};
  uops_12_ldst_is_rs1 = _RAND_1266[0:0];
  _RAND_1267 = {1{`RANDOM}};
  uops_12_ldst = _RAND_1267[5:0];
  _RAND_1268 = {1{`RANDOM}};
  uops_12_lrs1 = _RAND_1268[5:0];
  _RAND_1269 = {1{`RANDOM}};
  uops_12_lrs2 = _RAND_1269[5:0];
  _RAND_1270 = {1{`RANDOM}};
  uops_12_lrs3 = _RAND_1270[5:0];
  _RAND_1271 = {1{`RANDOM}};
  uops_12_ldst_val = _RAND_1271[0:0];
  _RAND_1272 = {1{`RANDOM}};
  uops_12_dst_rtype = _RAND_1272[1:0];
  _RAND_1273 = {1{`RANDOM}};
  uops_12_lrs1_rtype = _RAND_1273[1:0];
  _RAND_1274 = {1{`RANDOM}};
  uops_12_lrs2_rtype = _RAND_1274[1:0];
  _RAND_1275 = {1{`RANDOM}};
  uops_12_frs3_en = _RAND_1275[0:0];
  _RAND_1276 = {1{`RANDOM}};
  uops_12_fp_val = _RAND_1276[0:0];
  _RAND_1277 = {1{`RANDOM}};
  uops_12_fp_single = _RAND_1277[0:0];
  _RAND_1278 = {1{`RANDOM}};
  uops_12_xcpt_pf_if = _RAND_1278[0:0];
  _RAND_1279 = {1{`RANDOM}};
  uops_12_xcpt_ae_if = _RAND_1279[0:0];
  _RAND_1280 = {1{`RANDOM}};
  uops_12_xcpt_ma_if = _RAND_1280[0:0];
  _RAND_1281 = {1{`RANDOM}};
  uops_12_bp_debug_if = _RAND_1281[0:0];
  _RAND_1282 = {1{`RANDOM}};
  uops_12_bp_xcpt_if = _RAND_1282[0:0];
  _RAND_1283 = {1{`RANDOM}};
  uops_12_debug_fsrc = _RAND_1283[1:0];
  _RAND_1284 = {1{`RANDOM}};
  uops_12_debug_tsrc = _RAND_1284[1:0];
  _RAND_1285 = {1{`RANDOM}};
  uops_13_switch = _RAND_1285[0:0];
  _RAND_1286 = {1{`RANDOM}};
  uops_13_switch_off = _RAND_1286[0:0];
  _RAND_1287 = {1{`RANDOM}};
  uops_13_is_unicore = _RAND_1287[0:0];
  _RAND_1288 = {1{`RANDOM}};
  uops_13_shift = _RAND_1288[2:0];
  _RAND_1289 = {1{`RANDOM}};
  uops_13_lrs3_rtype = _RAND_1289[1:0];
  _RAND_1290 = {1{`RANDOM}};
  uops_13_rflag = _RAND_1290[0:0];
  _RAND_1291 = {1{`RANDOM}};
  uops_13_wflag = _RAND_1291[0:0];
  _RAND_1292 = {1{`RANDOM}};
  uops_13_prflag = _RAND_1292[3:0];
  _RAND_1293 = {1{`RANDOM}};
  uops_13_pwflag = _RAND_1293[3:0];
  _RAND_1294 = {1{`RANDOM}};
  uops_13_pflag_busy = _RAND_1294[0:0];
  _RAND_1295 = {1{`RANDOM}};
  uops_13_stale_pflag = _RAND_1295[3:0];
  _RAND_1296 = {1{`RANDOM}};
  uops_13_op1_sel = _RAND_1296[3:0];
  _RAND_1297 = {1{`RANDOM}};
  uops_13_op2_sel = _RAND_1297[3:0];
  _RAND_1298 = {1{`RANDOM}};
  uops_13_split_num = _RAND_1298[5:0];
  _RAND_1299 = {1{`RANDOM}};
  uops_13_self_index = _RAND_1299[5:0];
  _RAND_1300 = {1{`RANDOM}};
  uops_13_rob_inst_idx = _RAND_1300[5:0];
  _RAND_1301 = {1{`RANDOM}};
  uops_13_address_num = _RAND_1301[5:0];
  _RAND_1302 = {1{`RANDOM}};
  uops_13_uopc = _RAND_1302[6:0];
  _RAND_1303 = {1{`RANDOM}};
  uops_13_inst = _RAND_1303[31:0];
  _RAND_1304 = {1{`RANDOM}};
  uops_13_debug_inst = _RAND_1304[31:0];
  _RAND_1305 = {1{`RANDOM}};
  uops_13_is_rvc = _RAND_1305[0:0];
  _RAND_1306 = {2{`RANDOM}};
  uops_13_debug_pc = _RAND_1306[39:0];
  _RAND_1307 = {1{`RANDOM}};
  uops_13_iq_type = _RAND_1307[2:0];
  _RAND_1308 = {1{`RANDOM}};
  uops_13_fu_code = _RAND_1308[9:0];
  _RAND_1309 = {1{`RANDOM}};
  uops_13_ctrl_br_type = _RAND_1309[3:0];
  _RAND_1310 = {1{`RANDOM}};
  uops_13_ctrl_op1_sel = _RAND_1310[1:0];
  _RAND_1311 = {1{`RANDOM}};
  uops_13_ctrl_op2_sel = _RAND_1311[2:0];
  _RAND_1312 = {1{`RANDOM}};
  uops_13_ctrl_imm_sel = _RAND_1312[2:0];
  _RAND_1313 = {1{`RANDOM}};
  uops_13_ctrl_op_fcn = _RAND_1313[3:0];
  _RAND_1314 = {1{`RANDOM}};
  uops_13_ctrl_fcn_dw = _RAND_1314[0:0];
  _RAND_1315 = {1{`RANDOM}};
  uops_13_ctrl_csr_cmd = _RAND_1315[2:0];
  _RAND_1316 = {1{`RANDOM}};
  uops_13_ctrl_is_load = _RAND_1316[0:0];
  _RAND_1317 = {1{`RANDOM}};
  uops_13_ctrl_is_sta = _RAND_1317[0:0];
  _RAND_1318 = {1{`RANDOM}};
  uops_13_ctrl_is_std = _RAND_1318[0:0];
  _RAND_1319 = {1{`RANDOM}};
  uops_13_ctrl_op3_sel = _RAND_1319[1:0];
  _RAND_1320 = {1{`RANDOM}};
  uops_13_iw_state = _RAND_1320[1:0];
  _RAND_1321 = {1{`RANDOM}};
  uops_13_iw_p1_poisoned = _RAND_1321[0:0];
  _RAND_1322 = {1{`RANDOM}};
  uops_13_iw_p2_poisoned = _RAND_1322[0:0];
  _RAND_1323 = {1{`RANDOM}};
  uops_13_is_br = _RAND_1323[0:0];
  _RAND_1324 = {1{`RANDOM}};
  uops_13_is_jalr = _RAND_1324[0:0];
  _RAND_1325 = {1{`RANDOM}};
  uops_13_is_jal = _RAND_1325[0:0];
  _RAND_1326 = {1{`RANDOM}};
  uops_13_is_sfb = _RAND_1326[0:0];
  _RAND_1327 = {1{`RANDOM}};
  uops_13_br_mask = _RAND_1327[11:0];
  _RAND_1328 = {1{`RANDOM}};
  uops_13_br_tag = _RAND_1328[3:0];
  _RAND_1329 = {1{`RANDOM}};
  uops_13_ftq_idx = _RAND_1329[4:0];
  _RAND_1330 = {1{`RANDOM}};
  uops_13_edge_inst = _RAND_1330[0:0];
  _RAND_1331 = {1{`RANDOM}};
  uops_13_pc_lob = _RAND_1331[5:0];
  _RAND_1332 = {1{`RANDOM}};
  uops_13_taken = _RAND_1332[0:0];
  _RAND_1333 = {1{`RANDOM}};
  uops_13_imm_packed = _RAND_1333[19:0];
  _RAND_1334 = {1{`RANDOM}};
  uops_13_csr_addr = _RAND_1334[11:0];
  _RAND_1335 = {1{`RANDOM}};
  uops_13_rob_idx = _RAND_1335[5:0];
  _RAND_1336 = {1{`RANDOM}};
  uops_13_ldq_idx = _RAND_1336[4:0];
  _RAND_1337 = {1{`RANDOM}};
  uops_13_stq_idx = _RAND_1337[4:0];
  _RAND_1338 = {1{`RANDOM}};
  uops_13_rxq_idx = _RAND_1338[1:0];
  _RAND_1339 = {1{`RANDOM}};
  uops_13_pdst = _RAND_1339[6:0];
  _RAND_1340 = {1{`RANDOM}};
  uops_13_prs1 = _RAND_1340[6:0];
  _RAND_1341 = {1{`RANDOM}};
  uops_13_prs2 = _RAND_1341[6:0];
  _RAND_1342 = {1{`RANDOM}};
  uops_13_prs3 = _RAND_1342[6:0];
  _RAND_1343 = {1{`RANDOM}};
  uops_13_ppred = _RAND_1343[4:0];
  _RAND_1344 = {1{`RANDOM}};
  uops_13_prs1_busy = _RAND_1344[0:0];
  _RAND_1345 = {1{`RANDOM}};
  uops_13_prs2_busy = _RAND_1345[0:0];
  _RAND_1346 = {1{`RANDOM}};
  uops_13_prs3_busy = _RAND_1346[0:0];
  _RAND_1347 = {1{`RANDOM}};
  uops_13_ppred_busy = _RAND_1347[0:0];
  _RAND_1348 = {1{`RANDOM}};
  uops_13_stale_pdst = _RAND_1348[6:0];
  _RAND_1349 = {1{`RANDOM}};
  uops_13_exception = _RAND_1349[0:0];
  _RAND_1350 = {2{`RANDOM}};
  uops_13_exc_cause = _RAND_1350[63:0];
  _RAND_1351 = {1{`RANDOM}};
  uops_13_bypassable = _RAND_1351[0:0];
  _RAND_1352 = {1{`RANDOM}};
  uops_13_mem_cmd = _RAND_1352[4:0];
  _RAND_1353 = {1{`RANDOM}};
  uops_13_mem_size = _RAND_1353[1:0];
  _RAND_1354 = {1{`RANDOM}};
  uops_13_mem_signed = _RAND_1354[0:0];
  _RAND_1355 = {1{`RANDOM}};
  uops_13_is_fence = _RAND_1355[0:0];
  _RAND_1356 = {1{`RANDOM}};
  uops_13_is_fencei = _RAND_1356[0:0];
  _RAND_1357 = {1{`RANDOM}};
  uops_13_is_amo = _RAND_1357[0:0];
  _RAND_1358 = {1{`RANDOM}};
  uops_13_uses_ldq = _RAND_1358[0:0];
  _RAND_1359 = {1{`RANDOM}};
  uops_13_uses_stq = _RAND_1359[0:0];
  _RAND_1360 = {1{`RANDOM}};
  uops_13_is_sys_pc2epc = _RAND_1360[0:0];
  _RAND_1361 = {1{`RANDOM}};
  uops_13_is_unique = _RAND_1361[0:0];
  _RAND_1362 = {1{`RANDOM}};
  uops_13_flush_on_commit = _RAND_1362[0:0];
  _RAND_1363 = {1{`RANDOM}};
  uops_13_ldst_is_rs1 = _RAND_1363[0:0];
  _RAND_1364 = {1{`RANDOM}};
  uops_13_ldst = _RAND_1364[5:0];
  _RAND_1365 = {1{`RANDOM}};
  uops_13_lrs1 = _RAND_1365[5:0];
  _RAND_1366 = {1{`RANDOM}};
  uops_13_lrs2 = _RAND_1366[5:0];
  _RAND_1367 = {1{`RANDOM}};
  uops_13_lrs3 = _RAND_1367[5:0];
  _RAND_1368 = {1{`RANDOM}};
  uops_13_ldst_val = _RAND_1368[0:0];
  _RAND_1369 = {1{`RANDOM}};
  uops_13_dst_rtype = _RAND_1369[1:0];
  _RAND_1370 = {1{`RANDOM}};
  uops_13_lrs1_rtype = _RAND_1370[1:0];
  _RAND_1371 = {1{`RANDOM}};
  uops_13_lrs2_rtype = _RAND_1371[1:0];
  _RAND_1372 = {1{`RANDOM}};
  uops_13_frs3_en = _RAND_1372[0:0];
  _RAND_1373 = {1{`RANDOM}};
  uops_13_fp_val = _RAND_1373[0:0];
  _RAND_1374 = {1{`RANDOM}};
  uops_13_fp_single = _RAND_1374[0:0];
  _RAND_1375 = {1{`RANDOM}};
  uops_13_xcpt_pf_if = _RAND_1375[0:0];
  _RAND_1376 = {1{`RANDOM}};
  uops_13_xcpt_ae_if = _RAND_1376[0:0];
  _RAND_1377 = {1{`RANDOM}};
  uops_13_xcpt_ma_if = _RAND_1377[0:0];
  _RAND_1378 = {1{`RANDOM}};
  uops_13_bp_debug_if = _RAND_1378[0:0];
  _RAND_1379 = {1{`RANDOM}};
  uops_13_bp_xcpt_if = _RAND_1379[0:0];
  _RAND_1380 = {1{`RANDOM}};
  uops_13_debug_fsrc = _RAND_1380[1:0];
  _RAND_1381 = {1{`RANDOM}};
  uops_13_debug_tsrc = _RAND_1381[1:0];
  _RAND_1382 = {1{`RANDOM}};
  uops_14_switch = _RAND_1382[0:0];
  _RAND_1383 = {1{`RANDOM}};
  uops_14_switch_off = _RAND_1383[0:0];
  _RAND_1384 = {1{`RANDOM}};
  uops_14_is_unicore = _RAND_1384[0:0];
  _RAND_1385 = {1{`RANDOM}};
  uops_14_shift = _RAND_1385[2:0];
  _RAND_1386 = {1{`RANDOM}};
  uops_14_lrs3_rtype = _RAND_1386[1:0];
  _RAND_1387 = {1{`RANDOM}};
  uops_14_rflag = _RAND_1387[0:0];
  _RAND_1388 = {1{`RANDOM}};
  uops_14_wflag = _RAND_1388[0:0];
  _RAND_1389 = {1{`RANDOM}};
  uops_14_prflag = _RAND_1389[3:0];
  _RAND_1390 = {1{`RANDOM}};
  uops_14_pwflag = _RAND_1390[3:0];
  _RAND_1391 = {1{`RANDOM}};
  uops_14_pflag_busy = _RAND_1391[0:0];
  _RAND_1392 = {1{`RANDOM}};
  uops_14_stale_pflag = _RAND_1392[3:0];
  _RAND_1393 = {1{`RANDOM}};
  uops_14_op1_sel = _RAND_1393[3:0];
  _RAND_1394 = {1{`RANDOM}};
  uops_14_op2_sel = _RAND_1394[3:0];
  _RAND_1395 = {1{`RANDOM}};
  uops_14_split_num = _RAND_1395[5:0];
  _RAND_1396 = {1{`RANDOM}};
  uops_14_self_index = _RAND_1396[5:0];
  _RAND_1397 = {1{`RANDOM}};
  uops_14_rob_inst_idx = _RAND_1397[5:0];
  _RAND_1398 = {1{`RANDOM}};
  uops_14_address_num = _RAND_1398[5:0];
  _RAND_1399 = {1{`RANDOM}};
  uops_14_uopc = _RAND_1399[6:0];
  _RAND_1400 = {1{`RANDOM}};
  uops_14_inst = _RAND_1400[31:0];
  _RAND_1401 = {1{`RANDOM}};
  uops_14_debug_inst = _RAND_1401[31:0];
  _RAND_1402 = {1{`RANDOM}};
  uops_14_is_rvc = _RAND_1402[0:0];
  _RAND_1403 = {2{`RANDOM}};
  uops_14_debug_pc = _RAND_1403[39:0];
  _RAND_1404 = {1{`RANDOM}};
  uops_14_iq_type = _RAND_1404[2:0];
  _RAND_1405 = {1{`RANDOM}};
  uops_14_fu_code = _RAND_1405[9:0];
  _RAND_1406 = {1{`RANDOM}};
  uops_14_ctrl_br_type = _RAND_1406[3:0];
  _RAND_1407 = {1{`RANDOM}};
  uops_14_ctrl_op1_sel = _RAND_1407[1:0];
  _RAND_1408 = {1{`RANDOM}};
  uops_14_ctrl_op2_sel = _RAND_1408[2:0];
  _RAND_1409 = {1{`RANDOM}};
  uops_14_ctrl_imm_sel = _RAND_1409[2:0];
  _RAND_1410 = {1{`RANDOM}};
  uops_14_ctrl_op_fcn = _RAND_1410[3:0];
  _RAND_1411 = {1{`RANDOM}};
  uops_14_ctrl_fcn_dw = _RAND_1411[0:0];
  _RAND_1412 = {1{`RANDOM}};
  uops_14_ctrl_csr_cmd = _RAND_1412[2:0];
  _RAND_1413 = {1{`RANDOM}};
  uops_14_ctrl_is_load = _RAND_1413[0:0];
  _RAND_1414 = {1{`RANDOM}};
  uops_14_ctrl_is_sta = _RAND_1414[0:0];
  _RAND_1415 = {1{`RANDOM}};
  uops_14_ctrl_is_std = _RAND_1415[0:0];
  _RAND_1416 = {1{`RANDOM}};
  uops_14_ctrl_op3_sel = _RAND_1416[1:0];
  _RAND_1417 = {1{`RANDOM}};
  uops_14_iw_state = _RAND_1417[1:0];
  _RAND_1418 = {1{`RANDOM}};
  uops_14_iw_p1_poisoned = _RAND_1418[0:0];
  _RAND_1419 = {1{`RANDOM}};
  uops_14_iw_p2_poisoned = _RAND_1419[0:0];
  _RAND_1420 = {1{`RANDOM}};
  uops_14_is_br = _RAND_1420[0:0];
  _RAND_1421 = {1{`RANDOM}};
  uops_14_is_jalr = _RAND_1421[0:0];
  _RAND_1422 = {1{`RANDOM}};
  uops_14_is_jal = _RAND_1422[0:0];
  _RAND_1423 = {1{`RANDOM}};
  uops_14_is_sfb = _RAND_1423[0:0];
  _RAND_1424 = {1{`RANDOM}};
  uops_14_br_mask = _RAND_1424[11:0];
  _RAND_1425 = {1{`RANDOM}};
  uops_14_br_tag = _RAND_1425[3:0];
  _RAND_1426 = {1{`RANDOM}};
  uops_14_ftq_idx = _RAND_1426[4:0];
  _RAND_1427 = {1{`RANDOM}};
  uops_14_edge_inst = _RAND_1427[0:0];
  _RAND_1428 = {1{`RANDOM}};
  uops_14_pc_lob = _RAND_1428[5:0];
  _RAND_1429 = {1{`RANDOM}};
  uops_14_taken = _RAND_1429[0:0];
  _RAND_1430 = {1{`RANDOM}};
  uops_14_imm_packed = _RAND_1430[19:0];
  _RAND_1431 = {1{`RANDOM}};
  uops_14_csr_addr = _RAND_1431[11:0];
  _RAND_1432 = {1{`RANDOM}};
  uops_14_rob_idx = _RAND_1432[5:0];
  _RAND_1433 = {1{`RANDOM}};
  uops_14_ldq_idx = _RAND_1433[4:0];
  _RAND_1434 = {1{`RANDOM}};
  uops_14_stq_idx = _RAND_1434[4:0];
  _RAND_1435 = {1{`RANDOM}};
  uops_14_rxq_idx = _RAND_1435[1:0];
  _RAND_1436 = {1{`RANDOM}};
  uops_14_pdst = _RAND_1436[6:0];
  _RAND_1437 = {1{`RANDOM}};
  uops_14_prs1 = _RAND_1437[6:0];
  _RAND_1438 = {1{`RANDOM}};
  uops_14_prs2 = _RAND_1438[6:0];
  _RAND_1439 = {1{`RANDOM}};
  uops_14_prs3 = _RAND_1439[6:0];
  _RAND_1440 = {1{`RANDOM}};
  uops_14_ppred = _RAND_1440[4:0];
  _RAND_1441 = {1{`RANDOM}};
  uops_14_prs1_busy = _RAND_1441[0:0];
  _RAND_1442 = {1{`RANDOM}};
  uops_14_prs2_busy = _RAND_1442[0:0];
  _RAND_1443 = {1{`RANDOM}};
  uops_14_prs3_busy = _RAND_1443[0:0];
  _RAND_1444 = {1{`RANDOM}};
  uops_14_ppred_busy = _RAND_1444[0:0];
  _RAND_1445 = {1{`RANDOM}};
  uops_14_stale_pdst = _RAND_1445[6:0];
  _RAND_1446 = {1{`RANDOM}};
  uops_14_exception = _RAND_1446[0:0];
  _RAND_1447 = {2{`RANDOM}};
  uops_14_exc_cause = _RAND_1447[63:0];
  _RAND_1448 = {1{`RANDOM}};
  uops_14_bypassable = _RAND_1448[0:0];
  _RAND_1449 = {1{`RANDOM}};
  uops_14_mem_cmd = _RAND_1449[4:0];
  _RAND_1450 = {1{`RANDOM}};
  uops_14_mem_size = _RAND_1450[1:0];
  _RAND_1451 = {1{`RANDOM}};
  uops_14_mem_signed = _RAND_1451[0:0];
  _RAND_1452 = {1{`RANDOM}};
  uops_14_is_fence = _RAND_1452[0:0];
  _RAND_1453 = {1{`RANDOM}};
  uops_14_is_fencei = _RAND_1453[0:0];
  _RAND_1454 = {1{`RANDOM}};
  uops_14_is_amo = _RAND_1454[0:0];
  _RAND_1455 = {1{`RANDOM}};
  uops_14_uses_ldq = _RAND_1455[0:0];
  _RAND_1456 = {1{`RANDOM}};
  uops_14_uses_stq = _RAND_1456[0:0];
  _RAND_1457 = {1{`RANDOM}};
  uops_14_is_sys_pc2epc = _RAND_1457[0:0];
  _RAND_1458 = {1{`RANDOM}};
  uops_14_is_unique = _RAND_1458[0:0];
  _RAND_1459 = {1{`RANDOM}};
  uops_14_flush_on_commit = _RAND_1459[0:0];
  _RAND_1460 = {1{`RANDOM}};
  uops_14_ldst_is_rs1 = _RAND_1460[0:0];
  _RAND_1461 = {1{`RANDOM}};
  uops_14_ldst = _RAND_1461[5:0];
  _RAND_1462 = {1{`RANDOM}};
  uops_14_lrs1 = _RAND_1462[5:0];
  _RAND_1463 = {1{`RANDOM}};
  uops_14_lrs2 = _RAND_1463[5:0];
  _RAND_1464 = {1{`RANDOM}};
  uops_14_lrs3 = _RAND_1464[5:0];
  _RAND_1465 = {1{`RANDOM}};
  uops_14_ldst_val = _RAND_1465[0:0];
  _RAND_1466 = {1{`RANDOM}};
  uops_14_dst_rtype = _RAND_1466[1:0];
  _RAND_1467 = {1{`RANDOM}};
  uops_14_lrs1_rtype = _RAND_1467[1:0];
  _RAND_1468 = {1{`RANDOM}};
  uops_14_lrs2_rtype = _RAND_1468[1:0];
  _RAND_1469 = {1{`RANDOM}};
  uops_14_frs3_en = _RAND_1469[0:0];
  _RAND_1470 = {1{`RANDOM}};
  uops_14_fp_val = _RAND_1470[0:0];
  _RAND_1471 = {1{`RANDOM}};
  uops_14_fp_single = _RAND_1471[0:0];
  _RAND_1472 = {1{`RANDOM}};
  uops_14_xcpt_pf_if = _RAND_1472[0:0];
  _RAND_1473 = {1{`RANDOM}};
  uops_14_xcpt_ae_if = _RAND_1473[0:0];
  _RAND_1474 = {1{`RANDOM}};
  uops_14_xcpt_ma_if = _RAND_1474[0:0];
  _RAND_1475 = {1{`RANDOM}};
  uops_14_bp_debug_if = _RAND_1475[0:0];
  _RAND_1476 = {1{`RANDOM}};
  uops_14_bp_xcpt_if = _RAND_1476[0:0];
  _RAND_1477 = {1{`RANDOM}};
  uops_14_debug_fsrc = _RAND_1477[1:0];
  _RAND_1478 = {1{`RANDOM}};
  uops_14_debug_tsrc = _RAND_1478[1:0];
  _RAND_1479 = {1{`RANDOM}};
  uops_15_switch = _RAND_1479[0:0];
  _RAND_1480 = {1{`RANDOM}};
  uops_15_switch_off = _RAND_1480[0:0];
  _RAND_1481 = {1{`RANDOM}};
  uops_15_is_unicore = _RAND_1481[0:0];
  _RAND_1482 = {1{`RANDOM}};
  uops_15_shift = _RAND_1482[2:0];
  _RAND_1483 = {1{`RANDOM}};
  uops_15_lrs3_rtype = _RAND_1483[1:0];
  _RAND_1484 = {1{`RANDOM}};
  uops_15_rflag = _RAND_1484[0:0];
  _RAND_1485 = {1{`RANDOM}};
  uops_15_wflag = _RAND_1485[0:0];
  _RAND_1486 = {1{`RANDOM}};
  uops_15_prflag = _RAND_1486[3:0];
  _RAND_1487 = {1{`RANDOM}};
  uops_15_pwflag = _RAND_1487[3:0];
  _RAND_1488 = {1{`RANDOM}};
  uops_15_pflag_busy = _RAND_1488[0:0];
  _RAND_1489 = {1{`RANDOM}};
  uops_15_stale_pflag = _RAND_1489[3:0];
  _RAND_1490 = {1{`RANDOM}};
  uops_15_op1_sel = _RAND_1490[3:0];
  _RAND_1491 = {1{`RANDOM}};
  uops_15_op2_sel = _RAND_1491[3:0];
  _RAND_1492 = {1{`RANDOM}};
  uops_15_split_num = _RAND_1492[5:0];
  _RAND_1493 = {1{`RANDOM}};
  uops_15_self_index = _RAND_1493[5:0];
  _RAND_1494 = {1{`RANDOM}};
  uops_15_rob_inst_idx = _RAND_1494[5:0];
  _RAND_1495 = {1{`RANDOM}};
  uops_15_address_num = _RAND_1495[5:0];
  _RAND_1496 = {1{`RANDOM}};
  uops_15_uopc = _RAND_1496[6:0];
  _RAND_1497 = {1{`RANDOM}};
  uops_15_inst = _RAND_1497[31:0];
  _RAND_1498 = {1{`RANDOM}};
  uops_15_debug_inst = _RAND_1498[31:0];
  _RAND_1499 = {1{`RANDOM}};
  uops_15_is_rvc = _RAND_1499[0:0];
  _RAND_1500 = {2{`RANDOM}};
  uops_15_debug_pc = _RAND_1500[39:0];
  _RAND_1501 = {1{`RANDOM}};
  uops_15_iq_type = _RAND_1501[2:0];
  _RAND_1502 = {1{`RANDOM}};
  uops_15_fu_code = _RAND_1502[9:0];
  _RAND_1503 = {1{`RANDOM}};
  uops_15_ctrl_br_type = _RAND_1503[3:0];
  _RAND_1504 = {1{`RANDOM}};
  uops_15_ctrl_op1_sel = _RAND_1504[1:0];
  _RAND_1505 = {1{`RANDOM}};
  uops_15_ctrl_op2_sel = _RAND_1505[2:0];
  _RAND_1506 = {1{`RANDOM}};
  uops_15_ctrl_imm_sel = _RAND_1506[2:0];
  _RAND_1507 = {1{`RANDOM}};
  uops_15_ctrl_op_fcn = _RAND_1507[3:0];
  _RAND_1508 = {1{`RANDOM}};
  uops_15_ctrl_fcn_dw = _RAND_1508[0:0];
  _RAND_1509 = {1{`RANDOM}};
  uops_15_ctrl_csr_cmd = _RAND_1509[2:0];
  _RAND_1510 = {1{`RANDOM}};
  uops_15_ctrl_is_load = _RAND_1510[0:0];
  _RAND_1511 = {1{`RANDOM}};
  uops_15_ctrl_is_sta = _RAND_1511[0:0];
  _RAND_1512 = {1{`RANDOM}};
  uops_15_ctrl_is_std = _RAND_1512[0:0];
  _RAND_1513 = {1{`RANDOM}};
  uops_15_ctrl_op3_sel = _RAND_1513[1:0];
  _RAND_1514 = {1{`RANDOM}};
  uops_15_iw_state = _RAND_1514[1:0];
  _RAND_1515 = {1{`RANDOM}};
  uops_15_iw_p1_poisoned = _RAND_1515[0:0];
  _RAND_1516 = {1{`RANDOM}};
  uops_15_iw_p2_poisoned = _RAND_1516[0:0];
  _RAND_1517 = {1{`RANDOM}};
  uops_15_is_br = _RAND_1517[0:0];
  _RAND_1518 = {1{`RANDOM}};
  uops_15_is_jalr = _RAND_1518[0:0];
  _RAND_1519 = {1{`RANDOM}};
  uops_15_is_jal = _RAND_1519[0:0];
  _RAND_1520 = {1{`RANDOM}};
  uops_15_is_sfb = _RAND_1520[0:0];
  _RAND_1521 = {1{`RANDOM}};
  uops_15_br_mask = _RAND_1521[11:0];
  _RAND_1522 = {1{`RANDOM}};
  uops_15_br_tag = _RAND_1522[3:0];
  _RAND_1523 = {1{`RANDOM}};
  uops_15_ftq_idx = _RAND_1523[4:0];
  _RAND_1524 = {1{`RANDOM}};
  uops_15_edge_inst = _RAND_1524[0:0];
  _RAND_1525 = {1{`RANDOM}};
  uops_15_pc_lob = _RAND_1525[5:0];
  _RAND_1526 = {1{`RANDOM}};
  uops_15_taken = _RAND_1526[0:0];
  _RAND_1527 = {1{`RANDOM}};
  uops_15_imm_packed = _RAND_1527[19:0];
  _RAND_1528 = {1{`RANDOM}};
  uops_15_csr_addr = _RAND_1528[11:0];
  _RAND_1529 = {1{`RANDOM}};
  uops_15_rob_idx = _RAND_1529[5:0];
  _RAND_1530 = {1{`RANDOM}};
  uops_15_ldq_idx = _RAND_1530[4:0];
  _RAND_1531 = {1{`RANDOM}};
  uops_15_stq_idx = _RAND_1531[4:0];
  _RAND_1532 = {1{`RANDOM}};
  uops_15_rxq_idx = _RAND_1532[1:0];
  _RAND_1533 = {1{`RANDOM}};
  uops_15_pdst = _RAND_1533[6:0];
  _RAND_1534 = {1{`RANDOM}};
  uops_15_prs1 = _RAND_1534[6:0];
  _RAND_1535 = {1{`RANDOM}};
  uops_15_prs2 = _RAND_1535[6:0];
  _RAND_1536 = {1{`RANDOM}};
  uops_15_prs3 = _RAND_1536[6:0];
  _RAND_1537 = {1{`RANDOM}};
  uops_15_ppred = _RAND_1537[4:0];
  _RAND_1538 = {1{`RANDOM}};
  uops_15_prs1_busy = _RAND_1538[0:0];
  _RAND_1539 = {1{`RANDOM}};
  uops_15_prs2_busy = _RAND_1539[0:0];
  _RAND_1540 = {1{`RANDOM}};
  uops_15_prs3_busy = _RAND_1540[0:0];
  _RAND_1541 = {1{`RANDOM}};
  uops_15_ppred_busy = _RAND_1541[0:0];
  _RAND_1542 = {1{`RANDOM}};
  uops_15_stale_pdst = _RAND_1542[6:0];
  _RAND_1543 = {1{`RANDOM}};
  uops_15_exception = _RAND_1543[0:0];
  _RAND_1544 = {2{`RANDOM}};
  uops_15_exc_cause = _RAND_1544[63:0];
  _RAND_1545 = {1{`RANDOM}};
  uops_15_bypassable = _RAND_1545[0:0];
  _RAND_1546 = {1{`RANDOM}};
  uops_15_mem_cmd = _RAND_1546[4:0];
  _RAND_1547 = {1{`RANDOM}};
  uops_15_mem_size = _RAND_1547[1:0];
  _RAND_1548 = {1{`RANDOM}};
  uops_15_mem_signed = _RAND_1548[0:0];
  _RAND_1549 = {1{`RANDOM}};
  uops_15_is_fence = _RAND_1549[0:0];
  _RAND_1550 = {1{`RANDOM}};
  uops_15_is_fencei = _RAND_1550[0:0];
  _RAND_1551 = {1{`RANDOM}};
  uops_15_is_amo = _RAND_1551[0:0];
  _RAND_1552 = {1{`RANDOM}};
  uops_15_uses_ldq = _RAND_1552[0:0];
  _RAND_1553 = {1{`RANDOM}};
  uops_15_uses_stq = _RAND_1553[0:0];
  _RAND_1554 = {1{`RANDOM}};
  uops_15_is_sys_pc2epc = _RAND_1554[0:0];
  _RAND_1555 = {1{`RANDOM}};
  uops_15_is_unique = _RAND_1555[0:0];
  _RAND_1556 = {1{`RANDOM}};
  uops_15_flush_on_commit = _RAND_1556[0:0];
  _RAND_1557 = {1{`RANDOM}};
  uops_15_ldst_is_rs1 = _RAND_1557[0:0];
  _RAND_1558 = {1{`RANDOM}};
  uops_15_ldst = _RAND_1558[5:0];
  _RAND_1559 = {1{`RANDOM}};
  uops_15_lrs1 = _RAND_1559[5:0];
  _RAND_1560 = {1{`RANDOM}};
  uops_15_lrs2 = _RAND_1560[5:0];
  _RAND_1561 = {1{`RANDOM}};
  uops_15_lrs3 = _RAND_1561[5:0];
  _RAND_1562 = {1{`RANDOM}};
  uops_15_ldst_val = _RAND_1562[0:0];
  _RAND_1563 = {1{`RANDOM}};
  uops_15_dst_rtype = _RAND_1563[1:0];
  _RAND_1564 = {1{`RANDOM}};
  uops_15_lrs1_rtype = _RAND_1564[1:0];
  _RAND_1565 = {1{`RANDOM}};
  uops_15_lrs2_rtype = _RAND_1565[1:0];
  _RAND_1566 = {1{`RANDOM}};
  uops_15_frs3_en = _RAND_1566[0:0];
  _RAND_1567 = {1{`RANDOM}};
  uops_15_fp_val = _RAND_1567[0:0];
  _RAND_1568 = {1{`RANDOM}};
  uops_15_fp_single = _RAND_1568[0:0];
  _RAND_1569 = {1{`RANDOM}};
  uops_15_xcpt_pf_if = _RAND_1569[0:0];
  _RAND_1570 = {1{`RANDOM}};
  uops_15_xcpt_ae_if = _RAND_1570[0:0];
  _RAND_1571 = {1{`RANDOM}};
  uops_15_xcpt_ma_if = _RAND_1571[0:0];
  _RAND_1572 = {1{`RANDOM}};
  uops_15_bp_debug_if = _RAND_1572[0:0];
  _RAND_1573 = {1{`RANDOM}};
  uops_15_bp_xcpt_if = _RAND_1573[0:0];
  _RAND_1574 = {1{`RANDOM}};
  uops_15_debug_fsrc = _RAND_1574[1:0];
  _RAND_1575 = {1{`RANDOM}};
  uops_15_debug_tsrc = _RAND_1575[1:0];
  _RAND_1576 = {1{`RANDOM}};
  value = _RAND_1576[3:0];
  _RAND_1577 = {1{`RANDOM}};
  value_1 = _RAND_1577[3:0];
  _RAND_1578 = {1{`RANDOM}};
  maybe_full = _RAND_1578[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
