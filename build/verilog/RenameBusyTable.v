module RenameBusyTable(
  input         clock,
  input         reset,
  input         io_ren_uops_0_switch,
  input         io_ren_uops_0_switch_off,
  input         io_ren_uops_0_is_unicore,
  input  [2:0]  io_ren_uops_0_shift,
  input  [1:0]  io_ren_uops_0_lrs3_rtype,
  input         io_ren_uops_0_rflag,
  input         io_ren_uops_0_wflag,
  input  [3:0]  io_ren_uops_0_prflag,
  input  [3:0]  io_ren_uops_0_pwflag,
  input         io_ren_uops_0_pflag_busy,
  input  [3:0]  io_ren_uops_0_stale_pflag,
  input  [3:0]  io_ren_uops_0_op1_sel,
  input  [3:0]  io_ren_uops_0_op2_sel,
  input  [5:0]  io_ren_uops_0_split_num,
  input  [5:0]  io_ren_uops_0_self_index,
  input  [5:0]  io_ren_uops_0_rob_inst_idx,
  input  [5:0]  io_ren_uops_0_address_num,
  input  [6:0]  io_ren_uops_0_uopc,
  input  [31:0] io_ren_uops_0_inst,
  input  [31:0] io_ren_uops_0_debug_inst,
  input         io_ren_uops_0_is_rvc,
  input  [39:0] io_ren_uops_0_debug_pc,
  input  [2:0]  io_ren_uops_0_iq_type,
  input  [9:0]  io_ren_uops_0_fu_code,
  input  [3:0]  io_ren_uops_0_ctrl_br_type,
  input  [1:0]  io_ren_uops_0_ctrl_op1_sel,
  input  [2:0]  io_ren_uops_0_ctrl_op2_sel,
  input  [2:0]  io_ren_uops_0_ctrl_imm_sel,
  input  [3:0]  io_ren_uops_0_ctrl_op_fcn,
  input         io_ren_uops_0_ctrl_fcn_dw,
  input  [2:0]  io_ren_uops_0_ctrl_csr_cmd,
  input         io_ren_uops_0_ctrl_is_load,
  input         io_ren_uops_0_ctrl_is_sta,
  input         io_ren_uops_0_ctrl_is_std,
  input  [1:0]  io_ren_uops_0_ctrl_op3_sel,
  input  [1:0]  io_ren_uops_0_iw_state,
  input         io_ren_uops_0_iw_p1_poisoned,
  input         io_ren_uops_0_iw_p2_poisoned,
  input         io_ren_uops_0_is_br,
  input         io_ren_uops_0_is_jalr,
  input         io_ren_uops_0_is_jal,
  input         io_ren_uops_0_is_sfb,
  input  [11:0] io_ren_uops_0_br_mask,
  input  [3:0]  io_ren_uops_0_br_tag,
  input  [4:0]  io_ren_uops_0_ftq_idx,
  input         io_ren_uops_0_edge_inst,
  input  [5:0]  io_ren_uops_0_pc_lob,
  input         io_ren_uops_0_taken,
  input  [19:0] io_ren_uops_0_imm_packed,
  input  [11:0] io_ren_uops_0_csr_addr,
  input  [5:0]  io_ren_uops_0_rob_idx,
  input  [4:0]  io_ren_uops_0_ldq_idx,
  input  [4:0]  io_ren_uops_0_stq_idx,
  input  [1:0]  io_ren_uops_0_rxq_idx,
  input  [6:0]  io_ren_uops_0_pdst,
  input  [6:0]  io_ren_uops_0_prs1,
  input  [6:0]  io_ren_uops_0_prs2,
  input  [6:0]  io_ren_uops_0_prs3,
  input  [4:0]  io_ren_uops_0_ppred,
  input         io_ren_uops_0_prs1_busy,
  input         io_ren_uops_0_prs2_busy,
  input         io_ren_uops_0_prs3_busy,
  input         io_ren_uops_0_ppred_busy,
  input  [6:0]  io_ren_uops_0_stale_pdst,
  input         io_ren_uops_0_exception,
  input  [63:0] io_ren_uops_0_exc_cause,
  input         io_ren_uops_0_bypassable,
  input  [4:0]  io_ren_uops_0_mem_cmd,
  input  [1:0]  io_ren_uops_0_mem_size,
  input         io_ren_uops_0_mem_signed,
  input         io_ren_uops_0_is_fence,
  input         io_ren_uops_0_is_fencei,
  input         io_ren_uops_0_is_amo,
  input         io_ren_uops_0_uses_ldq,
  input         io_ren_uops_0_uses_stq,
  input         io_ren_uops_0_is_sys_pc2epc,
  input         io_ren_uops_0_is_unique,
  input         io_ren_uops_0_flush_on_commit,
  input         io_ren_uops_0_ldst_is_rs1,
  input  [5:0]  io_ren_uops_0_ldst,
  input  [5:0]  io_ren_uops_0_lrs1,
  input  [5:0]  io_ren_uops_0_lrs2,
  input  [5:0]  io_ren_uops_0_lrs3,
  input         io_ren_uops_0_ldst_val,
  input  [1:0]  io_ren_uops_0_dst_rtype,
  input  [1:0]  io_ren_uops_0_lrs1_rtype,
  input  [1:0]  io_ren_uops_0_lrs2_rtype,
  input         io_ren_uops_0_frs3_en,
  input         io_ren_uops_0_fp_val,
  input         io_ren_uops_0_fp_single,
  input         io_ren_uops_0_xcpt_pf_if,
  input         io_ren_uops_0_xcpt_ae_if,
  input         io_ren_uops_0_xcpt_ma_if,
  input         io_ren_uops_0_bp_debug_if,
  input         io_ren_uops_0_bp_xcpt_if,
  input  [1:0]  io_ren_uops_0_debug_fsrc,
  input  [1:0]  io_ren_uops_0_debug_tsrc,
  input         io_ren_uops_1_switch,
  input         io_ren_uops_1_switch_off,
  input         io_ren_uops_1_is_unicore,
  input  [2:0]  io_ren_uops_1_shift,
  input  [1:0]  io_ren_uops_1_lrs3_rtype,
  input         io_ren_uops_1_rflag,
  input         io_ren_uops_1_wflag,
  input  [3:0]  io_ren_uops_1_prflag,
  input  [3:0]  io_ren_uops_1_pwflag,
  input         io_ren_uops_1_pflag_busy,
  input  [3:0]  io_ren_uops_1_stale_pflag,
  input  [3:0]  io_ren_uops_1_op1_sel,
  input  [3:0]  io_ren_uops_1_op2_sel,
  input  [5:0]  io_ren_uops_1_split_num,
  input  [5:0]  io_ren_uops_1_self_index,
  input  [5:0]  io_ren_uops_1_rob_inst_idx,
  input  [5:0]  io_ren_uops_1_address_num,
  input  [6:0]  io_ren_uops_1_uopc,
  input  [31:0] io_ren_uops_1_inst,
  input  [31:0] io_ren_uops_1_debug_inst,
  input         io_ren_uops_1_is_rvc,
  input  [39:0] io_ren_uops_1_debug_pc,
  input  [2:0]  io_ren_uops_1_iq_type,
  input  [9:0]  io_ren_uops_1_fu_code,
  input  [3:0]  io_ren_uops_1_ctrl_br_type,
  input  [1:0]  io_ren_uops_1_ctrl_op1_sel,
  input  [2:0]  io_ren_uops_1_ctrl_op2_sel,
  input  [2:0]  io_ren_uops_1_ctrl_imm_sel,
  input  [3:0]  io_ren_uops_1_ctrl_op_fcn,
  input         io_ren_uops_1_ctrl_fcn_dw,
  input  [2:0]  io_ren_uops_1_ctrl_csr_cmd,
  input         io_ren_uops_1_ctrl_is_load,
  input         io_ren_uops_1_ctrl_is_sta,
  input         io_ren_uops_1_ctrl_is_std,
  input  [1:0]  io_ren_uops_1_ctrl_op3_sel,
  input  [1:0]  io_ren_uops_1_iw_state,
  input         io_ren_uops_1_iw_p1_poisoned,
  input         io_ren_uops_1_iw_p2_poisoned,
  input         io_ren_uops_1_is_br,
  input         io_ren_uops_1_is_jalr,
  input         io_ren_uops_1_is_jal,
  input         io_ren_uops_1_is_sfb,
  input  [11:0] io_ren_uops_1_br_mask,
  input  [3:0]  io_ren_uops_1_br_tag,
  input  [4:0]  io_ren_uops_1_ftq_idx,
  input         io_ren_uops_1_edge_inst,
  input  [5:0]  io_ren_uops_1_pc_lob,
  input         io_ren_uops_1_taken,
  input  [19:0] io_ren_uops_1_imm_packed,
  input  [11:0] io_ren_uops_1_csr_addr,
  input  [5:0]  io_ren_uops_1_rob_idx,
  input  [4:0]  io_ren_uops_1_ldq_idx,
  input  [4:0]  io_ren_uops_1_stq_idx,
  input  [1:0]  io_ren_uops_1_rxq_idx,
  input  [6:0]  io_ren_uops_1_pdst,
  input  [6:0]  io_ren_uops_1_prs1,
  input  [6:0]  io_ren_uops_1_prs2,
  input  [6:0]  io_ren_uops_1_prs3,
  input  [4:0]  io_ren_uops_1_ppred,
  input         io_ren_uops_1_prs1_busy,
  input         io_ren_uops_1_prs2_busy,
  input         io_ren_uops_1_prs3_busy,
  input         io_ren_uops_1_ppred_busy,
  input  [6:0]  io_ren_uops_1_stale_pdst,
  input         io_ren_uops_1_exception,
  input  [63:0] io_ren_uops_1_exc_cause,
  input         io_ren_uops_1_bypassable,
  input  [4:0]  io_ren_uops_1_mem_cmd,
  input  [1:0]  io_ren_uops_1_mem_size,
  input         io_ren_uops_1_mem_signed,
  input         io_ren_uops_1_is_fence,
  input         io_ren_uops_1_is_fencei,
  input         io_ren_uops_1_is_amo,
  input         io_ren_uops_1_uses_ldq,
  input         io_ren_uops_1_uses_stq,
  input         io_ren_uops_1_is_sys_pc2epc,
  input         io_ren_uops_1_is_unique,
  input         io_ren_uops_1_flush_on_commit,
  input         io_ren_uops_1_ldst_is_rs1,
  input  [5:0]  io_ren_uops_1_ldst,
  input  [5:0]  io_ren_uops_1_lrs1,
  input  [5:0]  io_ren_uops_1_lrs2,
  input  [5:0]  io_ren_uops_1_lrs3,
  input         io_ren_uops_1_ldst_val,
  input  [1:0]  io_ren_uops_1_dst_rtype,
  input  [1:0]  io_ren_uops_1_lrs1_rtype,
  input  [1:0]  io_ren_uops_1_lrs2_rtype,
  input         io_ren_uops_1_frs3_en,
  input         io_ren_uops_1_fp_val,
  input         io_ren_uops_1_fp_single,
  input         io_ren_uops_1_xcpt_pf_if,
  input         io_ren_uops_1_xcpt_ae_if,
  input         io_ren_uops_1_xcpt_ma_if,
  input         io_ren_uops_1_bp_debug_if,
  input         io_ren_uops_1_bp_xcpt_if,
  input  [1:0]  io_ren_uops_1_debug_fsrc,
  input  [1:0]  io_ren_uops_1_debug_tsrc,
  output        io_busy_resps_0_prs1_busy,
  output        io_busy_resps_0_prs2_busy,
  output        io_busy_resps_0_prs3_busy,
  output        io_busy_resps_1_prs1_busy,
  output        io_busy_resps_1_prs2_busy,
  output        io_busy_resps_1_prs3_busy,
  input         io_rebusy_reqs_0,
  input         io_rebusy_reqs_1,
  input  [6:0]  io_wb_pdsts_0,
  input  [6:0]  io_wb_pdsts_1,
  input  [6:0]  io_wb_pdsts_2,
  input  [6:0]  io_wb_pdsts_3,
  input  [6:0]  io_wb_pdsts_4,
  input         io_wb_valids_0,
  input         io_wb_valids_1,
  input         io_wb_valids_2,
  input         io_wb_valids_3,
  input         io_wb_valids_4,
  input         io_is_unicore,
  output [79:0] io_debug_busytable
);
`ifdef RANDOMIZE_REG_INIT
  reg [95:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [79:0] busy_table; // @[rename-busytable.scala 51:27]
  wire [127:0] _T = 128'h1 << io_wb_pdsts_0; // @[OneHot.scala 58:35]
  wire [79:0] _T_2 = io_wb_valids_0 ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [127:0] _GEN_0 = {{48'd0}, _T_2}; // @[rename-busytable.scala 54:48]
  wire [127:0] _T_3 = _T & _GEN_0; // @[rename-busytable.scala 54:48]
  wire [127:0] _T_4 = 128'h1 << io_wb_pdsts_1; // @[OneHot.scala 58:35]
  wire [79:0] _T_6 = io_wb_valids_1 ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [127:0] _GEN_1 = {{48'd0}, _T_6}; // @[rename-busytable.scala 54:48]
  wire [127:0] _T_7 = _T_4 & _GEN_1; // @[rename-busytable.scala 54:48]
  wire [127:0] _T_8 = 128'h1 << io_wb_pdsts_2; // @[OneHot.scala 58:35]
  wire [79:0] _T_10 = io_wb_valids_2 ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [127:0] _GEN_2 = {{48'd0}, _T_10}; // @[rename-busytable.scala 54:48]
  wire [127:0] _T_11 = _T_8 & _GEN_2; // @[rename-busytable.scala 54:48]
  wire [127:0] _T_12 = 128'h1 << io_wb_pdsts_3; // @[OneHot.scala 58:35]
  wire [79:0] _T_14 = io_wb_valids_3 ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [127:0] _GEN_3 = {{48'd0}, _T_14}; // @[rename-busytable.scala 54:48]
  wire [127:0] _T_15 = _T_12 & _GEN_3; // @[rename-busytable.scala 54:48]
  wire [127:0] _T_16 = 128'h1 << io_wb_pdsts_4; // @[OneHot.scala 58:35]
  wire [79:0] _T_18 = io_wb_valids_4 ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [127:0] _GEN_4 = {{48'd0}, _T_18}; // @[rename-busytable.scala 54:48]
  wire [127:0] _T_19 = _T_16 & _GEN_4; // @[rename-busytable.scala 54:48]
  wire [127:0] _T_20 = _T_3 | _T_7; // @[rename-busytable.scala 54:88]
  wire [127:0] _T_21 = _T_20 | _T_11; // @[rename-busytable.scala 54:88]
  wire [127:0] _T_22 = _T_21 | _T_15; // @[rename-busytable.scala 54:88]
  wire [127:0] _T_23 = _T_22 | _T_19; // @[rename-busytable.scala 54:88]
  wire [127:0] _T_24 = ~_T_23; // @[rename-busytable.scala 53:36]
  wire [127:0] _GEN_5 = {{48'd0}, busy_table}; // @[rename-busytable.scala 53:34]
  wire [127:0] busy_table_wb = _GEN_5 & _T_24; // @[rename-busytable.scala 53:34]
  wire [127:0] _T_25 = 128'h1 << io_ren_uops_0_pdst; // @[OneHot.scala 58:35]
  wire [79:0] _T_27 = io_rebusy_reqs_0 ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [127:0] _GEN_6 = {{48'd0}, _T_27}; // @[rename-busytable.scala 57:49]
  wire [127:0] _T_28 = _T_25 & _GEN_6; // @[rename-busytable.scala 57:49]
  wire [127:0] _T_29 = 128'h1 << io_ren_uops_1_pdst; // @[OneHot.scala 58:35]
  wire [79:0] _T_31 = io_rebusy_reqs_1 ? 80'hffffffffffffffffffff : 80'h0; // @[Bitwise.scala 72:12]
  wire [127:0] _GEN_7 = {{48'd0}, _T_31}; // @[rename-busytable.scala 57:49]
  wire [127:0] _T_32 = _T_29 & _GEN_7; // @[rename-busytable.scala 57:49]
  wire [127:0] _T_33 = _T_28 | _T_32; // @[rename-busytable.scala 57:87]
  wire [127:0] busy_table_next = busy_table_wb | _T_33; // @[rename-busytable.scala 56:39]
  wire [79:0] _T_34 = busy_table >> io_ren_uops_0_prs1; // @[rename-busytable.scala 70:45]
  wire [79:0] _T_38 = busy_table >> io_ren_uops_0_prs2; // @[rename-busytable.scala 71:45]
  wire [79:0] _T_42 = busy_table >> io_ren_uops_0_prs3; // @[rename-busytable.scala 72:31]
  wire [79:0] _T_59 = busy_table >> io_ren_uops_1_prs1; // @[rename-busytable.scala 70:45]
  wire [79:0] _T_63 = busy_table >> io_ren_uops_1_prs2; // @[rename-busytable.scala 71:45]
  wire [79:0] _T_67 = busy_table >> io_ren_uops_1_prs3; // @[rename-busytable.scala 72:31]
  assign io_busy_resps_0_prs1_busy = _T_34[0]; // @[rename-busytable.scala 70:45]
  assign io_busy_resps_0_prs2_busy = _T_38[0]; // @[rename-busytable.scala 71:45]
  assign io_busy_resps_0_prs3_busy = ~io_is_unicore ? 1'h0 : _T_42[0]; // @[rename-busytable.scala 75:38]
  assign io_busy_resps_1_prs1_busy = _T_59[0]; // @[rename-busytable.scala 70:45]
  assign io_busy_resps_1_prs2_busy = _T_63[0]; // @[rename-busytable.scala 71:45]
  assign io_busy_resps_1_prs3_busy = ~io_is_unicore ? 1'h0 : _T_67[0]; // @[rename-busytable.scala 75:38]
  assign io_debug_busytable = busy_table; // @[rename-busytable.scala 78:22]
  always @(posedge clock) begin
    if (reset) begin // @[rename-busytable.scala 51:27]
      busy_table <= 80'h0; // @[rename-busytable.scala 51:27]
    end else begin
      busy_table <= busy_table_next[79:0]; // @[rename-busytable.scala 59:14]
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
  _RAND_0 = {3{`RANDOM}};
  busy_table = _RAND_0[79:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
