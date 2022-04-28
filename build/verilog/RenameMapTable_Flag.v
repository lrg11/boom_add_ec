module RenameMapTable_Flag(
  input         clock,
  input         reset,
  input         io_map_reqs_0_rflag,
  input         io_map_reqs_0_wflag,
  input         io_map_reqs_1_rflag,
  input         io_map_reqs_1_wflag,
  output [3:0]  io_map_resps_0_prflag,
  output [3:0]  io_map_resps_0_stale_pflag,
  output [3:0]  io_map_resps_1_prflag,
  output [3:0]  io_map_resps_1_stale_pflag,
  input         io_remap_reqs_0_wflag,
  input  [3:0]  io_remap_reqs_0_pwflag,
  input         io_remap_reqs_0_valid,
  input         io_remap_reqs_1_wflag,
  input  [3:0]  io_remap_reqs_1_pwflag,
  input         io_remap_reqs_1_valid,
  input         io_ren_br_tags_0_valid,
  input  [3:0]  io_ren_br_tags_0_bits,
  input         io_ren_br_tags_1_valid,
  input  [3:0]  io_ren_br_tags_1_bits,
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
  input         io_rollback
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
`endif // RANDOMIZE_REG_INIT
  reg [3:0] map_table_0; // @[rename-maptable.scala 212:26]
  reg [3:0] br_snapshots_0_0; // @[rename-maptable.scala 213:25]
  reg [3:0] br_snapshots_1_0; // @[rename-maptable.scala 213:25]
  reg [3:0] br_snapshots_2_0; // @[rename-maptable.scala 213:25]
  reg [3:0] br_snapshots_3_0; // @[rename-maptable.scala 213:25]
  reg [3:0] br_snapshots_4_0; // @[rename-maptable.scala 213:25]
  reg [3:0] br_snapshots_5_0; // @[rename-maptable.scala 213:25]
  reg [3:0] br_snapshots_6_0; // @[rename-maptable.scala 213:25]
  reg [3:0] br_snapshots_7_0; // @[rename-maptable.scala 213:25]
  reg [3:0] br_snapshots_8_0; // @[rename-maptable.scala 213:25]
  reg [3:0] br_snapshots_9_0; // @[rename-maptable.scala 213:25]
  reg [3:0] br_snapshots_10_0; // @[rename-maptable.scala 213:25]
  reg [3:0] br_snapshots_11_0; // @[rename-maptable.scala 213:25]
  wire [3:0] remapped_row_1 = io_remap_reqs_0_valid ? io_remap_reqs_0_pwflag : map_table_0; // @[rename-maptable.scala 226:43]
  wire [3:0] _GEN_0 = 4'h0 == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_0_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_1 = 4'h1 == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_1_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_2 = 4'h2 == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_2_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_3 = 4'h3 == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_3_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_4 = 4'h4 == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_4_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_5 = 4'h5 == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_5_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_6 = 4'h6 == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_6_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_7 = 4'h7 == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_7_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_8 = 4'h8 == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_8_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_9 = 4'h9 == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_9_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_10 = 4'ha == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_10_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_11 = 4'hb == io_ren_br_tags_0_bits ? remapped_row_1 : br_snapshots_11_0; // @[rename-maptable.scala 248:44 rename-maptable.scala 248:44 rename-maptable.scala 213:25]
  wire [3:0] _GEN_12 = io_ren_br_tags_0_valid ? _GEN_0 : br_snapshots_0_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_13 = io_ren_br_tags_0_valid ? _GEN_1 : br_snapshots_1_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_14 = io_ren_br_tags_0_valid ? _GEN_2 : br_snapshots_2_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_15 = io_ren_br_tags_0_valid ? _GEN_3 : br_snapshots_3_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_16 = io_ren_br_tags_0_valid ? _GEN_4 : br_snapshots_4_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_17 = io_ren_br_tags_0_valid ? _GEN_5 : br_snapshots_5_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_18 = io_ren_br_tags_0_valid ? _GEN_6 : br_snapshots_6_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_19 = io_ren_br_tags_0_valid ? _GEN_7 : br_snapshots_7_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_20 = io_ren_br_tags_0_valid ? _GEN_8 : br_snapshots_8_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_21 = io_ren_br_tags_0_valid ? _GEN_9 : br_snapshots_9_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_22 = io_ren_br_tags_0_valid ? _GEN_10 : br_snapshots_10_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_23 = io_ren_br_tags_0_valid ? _GEN_11 : br_snapshots_11_0; // @[rename-maptable.scala 247:36 rename-maptable.scala 213:25]
  wire [3:0] _GEN_49 = 4'h1 == io_brupdate_b2_uop_br_tag ? br_snapshots_1_0 : br_snapshots_0_0; // @[rename-maptable.scala 254:15 rename-maptable.scala 254:15]
  wire [3:0] _GEN_50 = 4'h2 == io_brupdate_b2_uop_br_tag ? br_snapshots_2_0 : _GEN_49; // @[rename-maptable.scala 254:15 rename-maptable.scala 254:15]
  wire [3:0] _GEN_51 = 4'h3 == io_brupdate_b2_uop_br_tag ? br_snapshots_3_0 : _GEN_50; // @[rename-maptable.scala 254:15 rename-maptable.scala 254:15]
  wire [3:0] _GEN_52 = 4'h4 == io_brupdate_b2_uop_br_tag ? br_snapshots_4_0 : _GEN_51; // @[rename-maptable.scala 254:15 rename-maptable.scala 254:15]
  wire [3:0] _GEN_53 = 4'h5 == io_brupdate_b2_uop_br_tag ? br_snapshots_5_0 : _GEN_52; // @[rename-maptable.scala 254:15 rename-maptable.scala 254:15]
  wire [3:0] _GEN_54 = 4'h6 == io_brupdate_b2_uop_br_tag ? br_snapshots_6_0 : _GEN_53; // @[rename-maptable.scala 254:15 rename-maptable.scala 254:15]
  wire [3:0] _GEN_55 = 4'h7 == io_brupdate_b2_uop_br_tag ? br_snapshots_7_0 : _GEN_54; // @[rename-maptable.scala 254:15 rename-maptable.scala 254:15]
  wire [3:0] _GEN_56 = 4'h8 == io_brupdate_b2_uop_br_tag ? br_snapshots_8_0 : _GEN_55; // @[rename-maptable.scala 254:15 rename-maptable.scala 254:15]
  wire [3:0] _GEN_57 = 4'h9 == io_brupdate_b2_uop_br_tag ? br_snapshots_9_0 : _GEN_56; // @[rename-maptable.scala 254:15 rename-maptable.scala 254:15]
  assign io_map_resps_0_prflag = ~io_map_reqs_0_rflag ? map_table_0 : 4'h0; // @[rename-maptable.scala 270:34]
  assign io_map_resps_0_stale_pflag = ~io_map_reqs_0_wflag ? map_table_0 : 4'h0; // @[rename-maptable.scala 271:39]
  assign io_map_resps_1_prflag = ~io_map_reqs_1_rflag ? map_table_0 : 4'h0; // @[rename-maptable.scala 270:34]
  assign io_map_resps_1_stale_pflag = ~io_map_reqs_1_wflag ? map_table_0 : 4'h0; // @[rename-maptable.scala 271:39]
  always @(posedge clock) begin
    if (reset) begin // @[rename-maptable.scala 212:26]
      map_table_0 <= 4'h0; // @[rename-maptable.scala 212:26]
    end else if (io_brupdate_b2_mispredict) begin // @[rename-maptable.scala 252:36]
      if (4'hb == io_brupdate_b2_uop_br_tag) begin // @[rename-maptable.scala 254:15]
        map_table_0 <= br_snapshots_11_0; // @[rename-maptable.scala 254:15]
      end else if (4'ha == io_brupdate_b2_uop_br_tag) begin // @[rename-maptable.scala 254:15]
        map_table_0 <= br_snapshots_10_0; // @[rename-maptable.scala 254:15]
      end else begin
        map_table_0 <= _GEN_57;
      end
    end else if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
      map_table_0 <= io_remap_reqs_1_pwflag;
    end else if (io_remap_reqs_0_valid) begin // @[rename-maptable.scala 226:43]
      map_table_0 <= io_remap_reqs_0_pwflag;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'h0 == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_0_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_0_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_0_0 <= _GEN_12;
      end
    end else begin
      br_snapshots_0_0 <= _GEN_12;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'h1 == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_1_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_1_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_1_0 <= _GEN_13;
      end
    end else begin
      br_snapshots_1_0 <= _GEN_13;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'h2 == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_2_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_2_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_2_0 <= _GEN_14;
      end
    end else begin
      br_snapshots_2_0 <= _GEN_14;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'h3 == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_3_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_3_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_3_0 <= _GEN_15;
      end
    end else begin
      br_snapshots_3_0 <= _GEN_15;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'h4 == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_4_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_4_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_4_0 <= _GEN_16;
      end
    end else begin
      br_snapshots_4_0 <= _GEN_16;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'h5 == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_5_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_5_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_5_0 <= _GEN_17;
      end
    end else begin
      br_snapshots_5_0 <= _GEN_17;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'h6 == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_6_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_6_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_6_0 <= _GEN_18;
      end
    end else begin
      br_snapshots_6_0 <= _GEN_18;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'h7 == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_7_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_7_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_7_0 <= _GEN_19;
      end
    end else begin
      br_snapshots_7_0 <= _GEN_19;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'h8 == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_8_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_8_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_8_0 <= _GEN_20;
      end
    end else begin
      br_snapshots_8_0 <= _GEN_20;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'h9 == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_9_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_9_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_9_0 <= _GEN_21;
      end
    end else begin
      br_snapshots_9_0 <= _GEN_21;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'ha == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_10_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_10_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_10_0 <= _GEN_22;
      end
    end else begin
      br_snapshots_10_0 <= _GEN_22;
    end
    if (io_ren_br_tags_1_valid) begin // @[rename-maptable.scala 247:36]
      if (4'hb == io_ren_br_tags_1_bits) begin // @[rename-maptable.scala 248:44]
        if (io_remap_reqs_1_valid) begin // @[rename-maptable.scala 226:43]
          br_snapshots_11_0 <= io_remap_reqs_1_pwflag;
        end else begin
          br_snapshots_11_0 <= remapped_row_1;
        end
      end else begin
        br_snapshots_11_0 <= _GEN_23;
      end
    end else begin
      br_snapshots_11_0 <= _GEN_23;
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
  map_table_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  br_snapshots_0_0 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  br_snapshots_1_0 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  br_snapshots_2_0 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  br_snapshots_3_0 = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  br_snapshots_4_0 = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  br_snapshots_5_0 = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  br_snapshots_6_0 = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  br_snapshots_7_0 = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  br_snapshots_8_0 = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  br_snapshots_9_0 = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  br_snapshots_10_0 = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  br_snapshots_11_0 = _RAND_12[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
