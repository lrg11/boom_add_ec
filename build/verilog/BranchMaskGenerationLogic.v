module BranchMaskGenerationLogic(
  input         clock,
  input         reset,
  input         io_is_branch_0,
  input         io_is_branch_1,
  input         io_will_fire_0,
  input         io_will_fire_1,
  output [3:0]  io_br_tag_0,
  output [3:0]  io_br_tag_1,
  output [11:0] io_br_mask_0,
  output [11:0] io_br_mask_1,
  output        io_is_full_0,
  output        io_is_full_1,
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
  input         io_flush_pipeline,
  output [11:0] io_debug_branch_mask
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] branch_mask; // @[decode.scala 1013:28]
  wire [3:0] _GEN_0 = ~branch_mask[11] ? 4'hb : 4'h0; // @[decode.scala 1031:32 decode.scala 1032:20 decode.scala 1027:16]
  wire [15:0] _GEN_1 = ~branch_mask[11] ? 16'h800 : 16'h0; // @[decode.scala 1031:32 decode.scala 1033:22 decode.scala 1028:18]
  wire [3:0] _GEN_2 = ~branch_mask[10] ? 4'ha : _GEN_0; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_3 = ~branch_mask[10] ? 16'h400 : _GEN_1; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_4 = ~branch_mask[9] ? 4'h9 : _GEN_2; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_5 = ~branch_mask[9] ? 16'h200 : _GEN_3; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_6 = ~branch_mask[8] ? 4'h8 : _GEN_4; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_7 = ~branch_mask[8] ? 16'h100 : _GEN_5; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_8 = ~branch_mask[7] ? 4'h7 : _GEN_6; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_9 = ~branch_mask[7] ? 16'h80 : _GEN_7; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_10 = ~branch_mask[6] ? 4'h6 : _GEN_8; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_11 = ~branch_mask[6] ? 16'h40 : _GEN_9; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_12 = ~branch_mask[5] ? 4'h5 : _GEN_10; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_13 = ~branch_mask[5] ? 16'h20 : _GEN_11; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_14 = ~branch_mask[4] ? 4'h4 : _GEN_12; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_15 = ~branch_mask[4] ? 16'h10 : _GEN_13; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_16 = ~branch_mask[3] ? 4'h3 : _GEN_14; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_17 = ~branch_mask[3] ? 16'h8 : _GEN_15; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_18 = ~branch_mask[2] ? 4'h2 : _GEN_16; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_19 = ~branch_mask[2] ? 16'h4 : _GEN_17; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_20 = ~branch_mask[1] ? 4'h1 : _GEN_18; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_21 = ~branch_mask[1] ? 16'h2 : _GEN_19; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [15:0] _GEN_23 = ~branch_mask[0] ? 16'h1 : _GEN_21; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [11:0] tag_masks_0 = _GEN_23[11:0]; // @[decode.scala 1019:23]
  wire [11:0] _T_39 = tag_masks_0 | branch_mask; // @[decode.scala 1038:55]
  wire [11:0] _T_40 = io_is_branch_0 ? _T_39 : branch_mask; // @[decode.scala 1038:24]
  wire [3:0] _GEN_24 = ~_T_40[11] ? 4'hb : 4'h0; // @[decode.scala 1031:32 decode.scala 1032:20 decode.scala 1027:16]
  wire [15:0] _GEN_25 = ~_T_40[11] ? 16'h800 : 16'h0; // @[decode.scala 1031:32 decode.scala 1033:22 decode.scala 1028:18]
  wire [3:0] _GEN_26 = ~_T_40[10] ? 4'ha : _GEN_24; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_27 = ~_T_40[10] ? 16'h400 : _GEN_25; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_28 = ~_T_40[9] ? 4'h9 : _GEN_26; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_29 = ~_T_40[9] ? 16'h200 : _GEN_27; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_30 = ~_T_40[8] ? 4'h8 : _GEN_28; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_31 = ~_T_40[8] ? 16'h100 : _GEN_29; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_32 = ~_T_40[7] ? 4'h7 : _GEN_30; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_33 = ~_T_40[7] ? 16'h80 : _GEN_31; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_34 = ~_T_40[6] ? 4'h6 : _GEN_32; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_35 = ~_T_40[6] ? 16'h40 : _GEN_33; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_36 = ~_T_40[5] ? 4'h5 : _GEN_34; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_37 = ~_T_40[5] ? 16'h20 : _GEN_35; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_38 = ~_T_40[4] ? 4'h4 : _GEN_36; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_39 = ~_T_40[4] ? 16'h10 : _GEN_37; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_40 = ~_T_40[3] ? 4'h3 : _GEN_38; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_41 = ~_T_40[3] ? 16'h8 : _GEN_39; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_42 = ~_T_40[2] ? 4'h2 : _GEN_40; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_43 = ~_T_40[2] ? 16'h4 : _GEN_41; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [3:0] _GEN_44 = ~_T_40[1] ? 4'h1 : _GEN_42; // @[decode.scala 1031:32 decode.scala 1032:20]
  wire [15:0] _GEN_45 = ~_T_40[1] ? 16'h2 : _GEN_43; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [15:0] _GEN_47 = ~_T_40[0] ? 16'h1 : _GEN_45; // @[decode.scala 1031:32 decode.scala 1033:22]
  wire [11:0] tag_masks_1 = _GEN_47[11:0]; // @[decode.scala 1019:23]
  wire [11:0] _T_81 = ~io_brupdate_b1_resolve_mask; // @[util.scala 146:23]
  wire [11:0] _T_84 = io_will_fire_0 ? _T_39 : branch_mask; // @[decode.scala 1048:20]
  wire [11:0] _T_87 = tag_masks_1 | _T_84; // @[decode.scala 1048:51]
  wire [11:0] curr_mask = io_will_fire_1 ? _T_87 : _T_84; // @[decode.scala 1048:20]
  wire [11:0] _T_89 = io_brupdate_b2_mispredict ? io_brupdate_b2_uop_br_mask : 12'hfff; // @[decode.scala 1057:19]
  wire [11:0] _T_91 = curr_mask & _T_81; // @[util.scala 146:21]
  wire [11:0] _T_92 = _T_91 & _T_89; // @[decode.scala 1060:57]
  assign io_br_tag_0 = ~branch_mask[0] ? 4'h0 : _GEN_20; // @[decode.scala 1031:32 decode.scala 1032:20]
  assign io_br_tag_1 = ~_T_40[0] ? 4'h0 : _GEN_44; // @[decode.scala 1031:32 decode.scala 1032:20]
  assign io_br_mask_0 = branch_mask & _T_81; // @[util.scala 146:21]
  assign io_br_mask_1 = _T_84 & _T_81; // @[util.scala 146:21]
  assign io_is_full_0 = branch_mask == 12'hfff & io_is_branch_0; // @[decode.scala 1023:63]
  assign io_is_full_1 = _T_40 == 12'hfff & io_is_branch_1; // @[decode.scala 1023:63]
  assign io_debug_branch_mask = branch_mask; // @[decode.scala 1063:24]
  always @(posedge clock) begin
    if (reset) begin // @[decode.scala 1013:28]
      branch_mask <= 12'h0; // @[decode.scala 1013:28]
    end else if (io_flush_pipeline) begin // @[decode.scala 1054:28]
      branch_mask <= 12'h0; // @[decode.scala 1055:17]
    end else begin
      branch_mask <= _T_92; // @[decode.scala 1060:17]
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  branch_mask = _RAND_0[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
