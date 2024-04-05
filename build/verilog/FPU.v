module FPU(
  input         clock,
  input         reset,
  input         io_req_valid,
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
  input  [3:0]  io_req_bits_uop_ldq_idx,
  input  [3:0]  io_req_bits_uop_stq_idx,
  input  [1:0]  io_req_bits_uop_rxq_idx,
  input  [5:0]  io_req_bits_uop_pdst,
  input  [5:0]  io_req_bits_uop_prs1,
  input  [5:0]  io_req_bits_uop_prs2,
  input  [5:0]  io_req_bits_uop_prs3,
  input  [4:0]  io_req_bits_uop_ppred,
  input         io_req_bits_uop_prs1_busy,
  input         io_req_bits_uop_prs2_busy,
  input         io_req_bits_uop_prs3_busy,
  input         io_req_bits_uop_ppred_busy,
  input  [5:0]  io_req_bits_uop_stale_pdst,
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
  input  [2:0]  io_req_bits_fcsr_rm,
  output        io_resp_valid,
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
  output [3:0]  io_resp_bits_uop_ldq_idx,
  output [3:0]  io_resp_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_uop_rxq_idx,
  output [5:0]  io_resp_bits_uop_pdst,
  output [5:0]  io_resp_bits_uop_prs1,
  output [5:0]  io_resp_bits_uop_prs2,
  output [5:0]  io_resp_bits_uop_prs3,
  output [4:0]  io_resp_bits_uop_ppred,
  output        io_resp_bits_uop_prs1_busy,
  output        io_resp_bits_uop_prs2_busy,
  output        io_resp_bits_uop_prs3_busy,
  output        io_resp_bits_uop_ppred_busy,
  output [5:0]  io_resp_bits_uop_stale_pdst,
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
  output [64:0] io_resp_bits_data,
  output        io_resp_bits_predicated,
  output        io_resp_bits_fflags_valid,
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
  output [3:0]  io_resp_bits_fflags_bits_uop_ldq_idx,
  output [3:0]  io_resp_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_fflags_bits_uop_rxq_idx,
  output [5:0]  io_resp_bits_fflags_bits_uop_pdst,
  output [5:0]  io_resp_bits_fflags_bits_uop_prs1,
  output [5:0]  io_resp_bits_fflags_bits_uop_prs2,
  output [5:0]  io_resp_bits_fflags_bits_uop_prs3,
  output [4:0]  io_resp_bits_fflags_bits_uop_ppred,
  output        io_resp_bits_fflags_bits_uop_prs1_busy,
  output        io_resp_bits_fflags_bits_uop_prs2_busy,
  output        io_resp_bits_fflags_bits_uop_prs3_busy,
  output        io_resp_bits_fflags_bits_uop_ppred_busy,
  output [5:0]  io_resp_bits_fflags_bits_uop_stale_pdst,
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
  output [4:0]  io_resp_bits_fflags_bits_flags
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  wire  fp_decoder_clock; // @[fpu.scala 179:26]
  wire  fp_decoder_reset; // @[fpu.scala 179:26]
  wire [6:0] fp_decoder_io_uopc; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_ldst; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_wen; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_ren1; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_ren2; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_ren3; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_swap12; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_swap23; // @[fpu.scala 179:26]
  wire [1:0] fp_decoder_io_sigs_typeTagIn; // @[fpu.scala 179:26]
  wire [1:0] fp_decoder_io_sigs_typeTagOut; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_fromint; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_toint; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_fastpipe; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_fma; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_div; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_sqrt; // @[fpu.scala 179:26]
  wire  fp_decoder_io_sigs_wflags; // @[fpu.scala 179:26]
  wire  dfma_clock; // @[fpu.scala 205:20]
  wire  dfma_reset; // @[fpu.scala 205:20]
  wire  dfma_io_in_valid; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_ldst; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_wen; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_ren1; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_ren2; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_ren3; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_swap12; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_swap23; // @[fpu.scala 205:20]
  wire [1:0] dfma_io_in_bits_typeTagIn; // @[fpu.scala 205:20]
  wire [1:0] dfma_io_in_bits_typeTagOut; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_fromint; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_toint; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_fastpipe; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_fma; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_div; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_sqrt; // @[fpu.scala 205:20]
  wire  dfma_io_in_bits_wflags; // @[fpu.scala 205:20]
  wire [2:0] dfma_io_in_bits_rm; // @[fpu.scala 205:20]
  wire [1:0] dfma_io_in_bits_fmaCmd; // @[fpu.scala 205:20]
  wire [1:0] dfma_io_in_bits_typ; // @[fpu.scala 205:20]
  wire [1:0] dfma_io_in_bits_fmt; // @[fpu.scala 205:20]
  wire [64:0] dfma_io_in_bits_in1; // @[fpu.scala 205:20]
  wire [64:0] dfma_io_in_bits_in2; // @[fpu.scala 205:20]
  wire [64:0] dfma_io_in_bits_in3; // @[fpu.scala 205:20]
  wire  dfma_io_out_valid; // @[fpu.scala 205:20]
  wire [64:0] dfma_io_out_bits_data; // @[fpu.scala 205:20]
  wire [4:0] dfma_io_out_bits_exc; // @[fpu.scala 205:20]
  wire  FMADecoder_clock; // @[fpu.scala 199:29]
  wire  FMADecoder_reset; // @[fpu.scala 199:29]
  wire [6:0] FMADecoder_io_uopc; // @[fpu.scala 199:29]
  wire [1:0] FMADecoder_io_cmd; // @[fpu.scala 199:29]
  wire  sfma_clock; // @[fpu.scala 209:20]
  wire  sfma_reset; // @[fpu.scala 209:20]
  wire  sfma_io_in_valid; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_ldst; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_wen; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_ren1; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_ren2; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_ren3; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_swap12; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_swap23; // @[fpu.scala 209:20]
  wire [1:0] sfma_io_in_bits_typeTagIn; // @[fpu.scala 209:20]
  wire [1:0] sfma_io_in_bits_typeTagOut; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_fromint; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_toint; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_fastpipe; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_fma; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_div; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_sqrt; // @[fpu.scala 209:20]
  wire  sfma_io_in_bits_wflags; // @[fpu.scala 209:20]
  wire [2:0] sfma_io_in_bits_rm; // @[fpu.scala 209:20]
  wire [1:0] sfma_io_in_bits_fmaCmd; // @[fpu.scala 209:20]
  wire [1:0] sfma_io_in_bits_typ; // @[fpu.scala 209:20]
  wire [1:0] sfma_io_in_bits_fmt; // @[fpu.scala 209:20]
  wire [64:0] sfma_io_in_bits_in1; // @[fpu.scala 209:20]
  wire [64:0] sfma_io_in_bits_in2; // @[fpu.scala 209:20]
  wire [64:0] sfma_io_in_bits_in3; // @[fpu.scala 209:20]
  wire  sfma_io_out_valid; // @[fpu.scala 209:20]
  wire [64:0] sfma_io_out_bits_data; // @[fpu.scala 209:20]
  wire [4:0] sfma_io_out_bits_exc; // @[fpu.scala 209:20]
  wire  FMADecoder_1_clock; // @[fpu.scala 199:29]
  wire  FMADecoder_1_reset; // @[fpu.scala 199:29]
  wire [6:0] FMADecoder_1_io_uopc; // @[fpu.scala 199:29]
  wire [1:0] FMADecoder_1_io_cmd; // @[fpu.scala 199:29]
  wire  fpiu_clock; // @[fpu.scala 213:20]
  wire  fpiu_reset; // @[fpu.scala 213:20]
  wire  fpiu_io_in_valid; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_ldst; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_wen; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_ren1; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_ren2; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_ren3; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_swap12; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_swap23; // @[fpu.scala 213:20]
  wire [1:0] fpiu_io_in_bits_typeTagIn; // @[fpu.scala 213:20]
  wire [1:0] fpiu_io_in_bits_typeTagOut; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_fromint; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_toint; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_fastpipe; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_fma; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_div; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_sqrt; // @[fpu.scala 213:20]
  wire  fpiu_io_in_bits_wflags; // @[fpu.scala 213:20]
  wire [2:0] fpiu_io_in_bits_rm; // @[fpu.scala 213:20]
  wire [1:0] fpiu_io_in_bits_fmaCmd; // @[fpu.scala 213:20]
  wire [1:0] fpiu_io_in_bits_typ; // @[fpu.scala 213:20]
  wire [1:0] fpiu_io_in_bits_fmt; // @[fpu.scala 213:20]
  wire [64:0] fpiu_io_in_bits_in1; // @[fpu.scala 213:20]
  wire [64:0] fpiu_io_in_bits_in2; // @[fpu.scala 213:20]
  wire [64:0] fpiu_io_in_bits_in3; // @[fpu.scala 213:20]
  wire  fpiu_io_out_valid; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_ldst; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_wen; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_ren1; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_ren2; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_ren3; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_swap12; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_swap23; // @[fpu.scala 213:20]
  wire [1:0] fpiu_io_out_bits_in_typeTagIn; // @[fpu.scala 213:20]
  wire [1:0] fpiu_io_out_bits_in_typeTagOut; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_fromint; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_toint; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_fastpipe; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_fma; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_div; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_sqrt; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_in_wflags; // @[fpu.scala 213:20]
  wire [2:0] fpiu_io_out_bits_in_rm; // @[fpu.scala 213:20]
  wire [1:0] fpiu_io_out_bits_in_fmaCmd; // @[fpu.scala 213:20]
  wire [1:0] fpiu_io_out_bits_in_typ; // @[fpu.scala 213:20]
  wire [1:0] fpiu_io_out_bits_in_fmt; // @[fpu.scala 213:20]
  wire [64:0] fpiu_io_out_bits_in_in1; // @[fpu.scala 213:20]
  wire [64:0] fpiu_io_out_bits_in_in2; // @[fpu.scala 213:20]
  wire [64:0] fpiu_io_out_bits_in_in3; // @[fpu.scala 213:20]
  wire  fpiu_io_out_bits_lt; // @[fpu.scala 213:20]
  wire [63:0] fpiu_io_out_bits_store; // @[fpu.scala 213:20]
  wire [63:0] fpiu_io_out_bits_toint; // @[fpu.scala 213:20]
  wire [4:0] fpiu_io_out_bits_exc; // @[fpu.scala 213:20]
  wire  FMADecoder_2_clock; // @[fpu.scala 199:29]
  wire  FMADecoder_2_reset; // @[fpu.scala 199:29]
  wire [6:0] FMADecoder_2_io_uopc; // @[fpu.scala 199:29]
  wire [1:0] FMADecoder_2_io_cmd; // @[fpu.scala 199:29]
  wire  fpmu_clock; // @[fpu.scala 222:20]
  wire  fpmu_reset; // @[fpu.scala 222:20]
  wire  fpmu_io_in_valid; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_ldst; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_wen; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_ren1; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_ren2; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_ren3; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_swap12; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_swap23; // @[fpu.scala 222:20]
  wire [1:0] fpmu_io_in_bits_typeTagIn; // @[fpu.scala 222:20]
  wire [1:0] fpmu_io_in_bits_typeTagOut; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_fromint; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_toint; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_fastpipe; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_fma; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_div; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_sqrt; // @[fpu.scala 222:20]
  wire  fpmu_io_in_bits_wflags; // @[fpu.scala 222:20]
  wire [2:0] fpmu_io_in_bits_rm; // @[fpu.scala 222:20]
  wire [1:0] fpmu_io_in_bits_fmaCmd; // @[fpu.scala 222:20]
  wire [1:0] fpmu_io_in_bits_typ; // @[fpu.scala 222:20]
  wire [1:0] fpmu_io_in_bits_fmt; // @[fpu.scala 222:20]
  wire [64:0] fpmu_io_in_bits_in1; // @[fpu.scala 222:20]
  wire [64:0] fpmu_io_in_bits_in2; // @[fpu.scala 222:20]
  wire [64:0] fpmu_io_in_bits_in3; // @[fpu.scala 222:20]
  wire  fpmu_io_out_valid; // @[fpu.scala 222:20]
  wire [64:0] fpmu_io_out_bits_data; // @[fpu.scala 222:20]
  wire [4:0] fpmu_io_out_bits_exc; // @[fpu.scala 222:20]
  wire  fpmu_io_lt; // @[fpu.scala 222:20]
  wire  _T_3 = io_req_valid & fp_decoder_io_sigs_fma; // @[fpu.scala 206:36]
  wire  _T_4 = fp_decoder_io_sigs_typeTagOut == 2'h1; // @[fpu.scala 206:74]
  wire  unswizzled_hi_hi = io_req_bits_rs1_data[31]; // @[FPU.scala 352:14]
  wire  unswizzled_hi_lo = io_req_bits_rs1_data[52]; // @[FPU.scala 353:14]
  wire [30:0] unswizzled_lo = io_req_bits_rs1_data[30:0]; // @[FPU.scala 354:14]
  wire [32:0] unswizzled = {unswizzled_hi_hi,unswizzled_hi_lo,unswizzled_lo}; // @[Cat.scala 30:58]
  wire  hi_hi = unswizzled[32]; // @[FPU.scala 268:17]
  wire [22:0] fractIn = unswizzled[22:0]; // @[FPU.scala 269:20]
  wire [8:0] expIn = unswizzled[31:23]; // @[FPU.scala 270:18]
  wire [75:0] _fractOut_T = {fractIn, 53'h0}; // @[FPU.scala 271:28]
  wire [51:0] lo = _fractOut_T[75:24]; // @[FPU.scala 271:38]
  wire [2:0] expOut_hi = expIn[8:6]; // @[FPU.scala 273:26]
  wire [11:0] _GEN_91 = {{3'd0}, expIn}; // @[FPU.scala 274:31]
  wire [11:0] _expOut_commonCase_T_1 = _GEN_91 + 12'h800; // @[FPU.scala 274:31]
  wire [11:0] expOut_commonCase = _expOut_commonCase_T_1 - 12'h100; // @[FPU.scala 274:48]
  wire [8:0] expOut_lo = expOut_commonCase[8:0]; // @[FPU.scala 275:65]
  wire [11:0] _expOut_T_3 = {expOut_hi,expOut_lo}; // @[Cat.scala 30:58]
  wire [11:0] hi_lo = expOut_hi == 3'h0 | expOut_hi >= 3'h6 ? _expOut_T_3 : expOut_commonCase; // @[FPU.scala 275:10]
  wire [64:0] floats_0 = {hi_hi,hi_lo,lo}; // @[Cat.scala 30:58]
  wire  isbox = &io_req_bits_rs1_data[64:60]; // @[FPU.scala 327:84]
  wire  unswizzled_hi_hi_1 = io_req_bits_rs2_data[31]; // @[FPU.scala 352:14]
  wire  unswizzled_hi_lo_1 = io_req_bits_rs2_data[52]; // @[FPU.scala 353:14]
  wire [30:0] unswizzled_lo_1 = io_req_bits_rs2_data[30:0]; // @[FPU.scala 354:14]
  wire [32:0] unswizzled_1 = {unswizzled_hi_hi_1,unswizzled_hi_lo_1,unswizzled_lo_1}; // @[Cat.scala 30:58]
  wire  hi_hi_1 = unswizzled_1[32]; // @[FPU.scala 268:17]
  wire [22:0] fractIn_1 = unswizzled_1[22:0]; // @[FPU.scala 269:20]
  wire [8:0] expIn_1 = unswizzled_1[31:23]; // @[FPU.scala 270:18]
  wire [75:0] _fractOut_T_1 = {fractIn_1, 53'h0}; // @[FPU.scala 271:28]
  wire [51:0] lo_1 = _fractOut_T_1[75:24]; // @[FPU.scala 271:38]
  wire [2:0] expOut_hi_1 = expIn_1[8:6]; // @[FPU.scala 273:26]
  wire [11:0] _GEN_92 = {{3'd0}, expIn_1}; // @[FPU.scala 274:31]
  wire [11:0] _expOut_commonCase_T_4 = _GEN_92 + 12'h800; // @[FPU.scala 274:31]
  wire [11:0] expOut_commonCase_1 = _expOut_commonCase_T_4 - 12'h100; // @[FPU.scala 274:48]
  wire [8:0] expOut_lo_1 = expOut_commonCase_1[8:0]; // @[FPU.scala 275:65]
  wire [11:0] _expOut_T_8 = {expOut_hi_1,expOut_lo_1}; // @[Cat.scala 30:58]
  wire [11:0] hi_lo_1 = expOut_hi_1 == 3'h0 | expOut_hi_1 >= 3'h6 ? _expOut_T_8 : expOut_commonCase_1; // @[FPU.scala 275:10]
  wire [64:0] floats_0_1 = {hi_hi_1,hi_lo_1,lo_1}; // @[Cat.scala 30:58]
  wire  isbox_1 = &io_req_bits_rs2_data[64:60]; // @[FPU.scala 327:84]
  wire  unswizzled_hi_hi_2 = io_req_bits_rs3_data[31]; // @[FPU.scala 352:14]
  wire  unswizzled_hi_lo_2 = io_req_bits_rs3_data[52]; // @[FPU.scala 353:14]
  wire [30:0] unswizzled_lo_2 = io_req_bits_rs3_data[30:0]; // @[FPU.scala 354:14]
  wire [32:0] unswizzled_2 = {unswizzled_hi_hi_2,unswizzled_hi_lo_2,unswizzled_lo_2}; // @[Cat.scala 30:58]
  wire  hi_hi_2 = unswizzled_2[32]; // @[FPU.scala 268:17]
  wire [22:0] fractIn_2 = unswizzled_2[22:0]; // @[FPU.scala 269:20]
  wire [8:0] expIn_2 = unswizzled_2[31:23]; // @[FPU.scala 270:18]
  wire [75:0] _fractOut_T_2 = {fractIn_2, 53'h0}; // @[FPU.scala 271:28]
  wire [51:0] lo_2 = _fractOut_T_2[75:24]; // @[FPU.scala 271:38]
  wire [2:0] expOut_hi_2 = expIn_2[8:6]; // @[FPU.scala 273:26]
  wire [11:0] _GEN_93 = {{3'd0}, expIn_2}; // @[FPU.scala 274:31]
  wire [11:0] _expOut_commonCase_T_7 = _GEN_93 + 12'h800; // @[FPU.scala 274:31]
  wire [11:0] expOut_commonCase_2 = _expOut_commonCase_T_7 - 12'h100; // @[FPU.scala 274:48]
  wire [8:0] expOut_lo_2 = expOut_commonCase_2[8:0]; // @[FPU.scala 275:65]
  wire [11:0] _expOut_T_13 = {expOut_hi_2,expOut_lo_2}; // @[Cat.scala 30:58]
  wire [11:0] hi_lo_2 = expOut_hi_2 == 3'h0 | expOut_hi_2 >= 3'h6 ? _expOut_T_13 : expOut_commonCase_2; // @[FPU.scala 275:10]
  wire [64:0] floats_0_2 = {hi_hi_2,hi_lo_2,lo_2}; // @[Cat.scala 30:58]
  wire  isbox_2 = &io_req_bits_rs3_data[64:60]; // @[FPU.scala 327:84]
  wire  _T_14 = fp_decoder_io_sigs_typeTagIn == 2'h0 ? 1'h0 : 1'h1; // @[fpu.scala 194:19]
  wire  _GEN_1 = io_req_bits_uop_uopc == 7'h46 ? 1'h0 : _T_14; // @[fpu.scala 195:43 fpu.scala 196:15 fpu.scala 194:13]
  wire [32:0] _T_19 = isbox ? 33'h0 : 33'he0400000; // @[FPU.scala 367:31]
  wire [32:0] _T_20 = unswizzled | _T_19; // @[FPU.scala 367:26]
  wire [32:0] _T_21 = isbox_1 ? 33'h0 : 33'he0400000; // @[FPU.scala 367:31]
  wire [32:0] _T_22 = unswizzled_1 | _T_21; // @[FPU.scala 367:26]
  wire [32:0] _T_23 = isbox_2 ? 33'h0 : 33'he0400000; // @[FPU.scala 367:31]
  wire [32:0] _T_24 = unswizzled_2 | _T_23; // @[FPU.scala 367:26]
  wire [64:0] _WIRE_1_in2 = {{32'd0}, _T_22}; // @[fpu.scala 185:19 fpu.scala 190:13]
  wire [1:0] _truncIdx_T = fp_decoder_io_sigs_typeTagIn; // @[package.scala 31:21]
  wire  truncIdx = _truncIdx_T[0]; // @[package.scala 31:49]
  wire  _T_33 = truncIdx | isbox; // @[package.scala 32:76]
  wire [64:0] _T_35 = truncIdx ? io_req_bits_rs1_data : floats_0; // @[package.scala 32:76]
  wire  _T_38 = truncIdx | isbox_1; // @[package.scala 32:76]
  wire [64:0] _T_40 = truncIdx ? io_req_bits_rs2_data : floats_0_1; // @[package.scala 32:76]
  wire [64:0] _T_41 = _T_38 ? _T_40 : 65'he008000000000000; // @[FPU.scala 364:10]
  wire  _T_43 = truncIdx | isbox_2; // @[package.scala 32:76]
  wire [64:0] _T_45 = truncIdx ? io_req_bits_rs3_data : floats_0_2; // @[package.scala 32:76]
  wire [64:0] _T_46 = _T_43 ? _T_45 : 65'he008000000000000; // @[FPU.scala 364:10]
  reg  REG; // @[fpu.scala 216:30]
  reg  fpiu_outPipe_valid; // @[Valid.scala 117:22]
  reg [63:0] fpiu_outPipe_bits_toint; // @[Reg.scala 15:16]
  reg [4:0] fpiu_outPipe_bits_exc; // @[Reg.scala 15:16]
  reg  fpiu_outPipe_valid_1; // @[Valid.scala 117:22]
  reg [63:0] fpiu_outPipe_bits_1_toint; // @[Reg.scala 15:16]
  reg [4:0] fpiu_outPipe_bits_1_exc; // @[Reg.scala 15:16]
  reg  fpiu_outPipe_valid_2; // @[Valid.scala 117:22]
  reg [63:0] fpiu_outPipe_bits_2_toint; // @[Reg.scala 15:16]
  reg [4:0] fpiu_outPipe_bits_2_exc; // @[Reg.scala 15:16]
  wire  _T_53 = io_req_valid & fp_decoder_io_sigs_fastpipe; // @[fpu.scala 223:36]
  reg  v; // @[Valid.scala 117:22]
  reg  b; // @[Reg.scala 15:16]
  reg  outPipe_valid; // @[Valid.scala 117:22]
  reg  outPipe_bits; // @[Reg.scala 15:16]
  reg  outPipe_valid_1; // @[Valid.scala 117:22]
  reg  outPipe_bits_1; // @[Reg.scala 15:16]
  reg  outPipe_bits_2; // @[Reg.scala 15:16]
  wire  _T_56 = fpiu_outPipe_valid_2 | fpmu_io_out_valid; // @[fpu.scala 229:35]
  wire  _T_57 = _T_56 | sfma_io_out_valid; // @[fpu.scala 230:38]
  wire [64:0] _T_60 = dfma_io_out_bits_data; // @[package.scala 32:76]
  wire  opts_bigger_swizzledNaN_hi_lo_lo_1 = sfma_io_out_bits_data[31]; // @[FPU.scala 335:8]
  wire  opts_bigger_swizzledNaN_lo_hi_lo_1 = sfma_io_out_bits_data[32]; // @[FPU.scala 337:8]
  wire [30:0] opts_bigger_swizzledNaN_lo_lo_1 = sfma_io_out_bits_data[30:0]; // @[FPU.scala 338:8]
  wire [64:0] opts_bigger_swizzledNaN_1 = {5'h1f,7'h7f,opts_bigger_swizzledNaN_hi_lo_lo_1,20'hfffff,
    opts_bigger_swizzledNaN_lo_hi_lo_1,opts_bigger_swizzledNaN_lo_lo_1}; // @[Cat.scala 30:58]
  wire  opts_bigger_swizzledNaN_hi_lo_lo_2 = fpmu_io_out_bits_data[31]; // @[FPU.scala 335:8]
  wire  opts_bigger_swizzledNaN_lo_hi_lo_2 = fpmu_io_out_bits_data[32]; // @[FPU.scala 337:8]
  wire [30:0] opts_bigger_swizzledNaN_lo_lo_2 = fpmu_io_out_bits_data[30:0]; // @[FPU.scala 338:8]
  wire [64:0] opts_bigger_swizzledNaN_2 = {5'h1f,7'h7f,opts_bigger_swizzledNaN_hi_lo_lo_2,20'hfffff,
    opts_bigger_swizzledNaN_lo_hi_lo_2,opts_bigger_swizzledNaN_lo_lo_2}; // @[Cat.scala 30:58]
  wire [64:0] _T_64 = outPipe_bits_2 ? fpmu_io_out_bits_data : opts_bigger_swizzledNaN_2; // @[package.scala 32:76]
  wire [64:0] fpiu_result_data = {{1'd0}, fpiu_outPipe_bits_2_toint}; // @[fpu.scala 218:26 fpu.scala 219:20]
  wire [64:0] _T_65 = fpiu_outPipe_valid_2 ? fpiu_result_data : _T_64; // @[fpu.scala 236:8]
  wire [64:0] _T_66 = sfma_io_out_valid ? opts_bigger_swizzledNaN_1 : _T_65; // @[fpu.scala 235:8]
  wire [4:0] _T_67 = fpiu_outPipe_valid_2 ? fpiu_outPipe_bits_2_exc : fpmu_io_out_bits_exc; // @[fpu.scala 242:8]
  wire [4:0] _T_68 = sfma_io_out_valid ? sfma_io_out_bits_exc : _T_67; // @[fpu.scala 241:8]
  UOPCodeFPUDecoder fp_decoder ( // @[fpu.scala 179:26]
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
  FPUFMAPipe dfma ( // @[fpu.scala 205:20]
    .clock(dfma_clock),
    .reset(dfma_reset),
    .io_in_valid(dfma_io_in_valid),
    .io_in_bits_ldst(dfma_io_in_bits_ldst),
    .io_in_bits_wen(dfma_io_in_bits_wen),
    .io_in_bits_ren1(dfma_io_in_bits_ren1),
    .io_in_bits_ren2(dfma_io_in_bits_ren2),
    .io_in_bits_ren3(dfma_io_in_bits_ren3),
    .io_in_bits_swap12(dfma_io_in_bits_swap12),
    .io_in_bits_swap23(dfma_io_in_bits_swap23),
    .io_in_bits_typeTagIn(dfma_io_in_bits_typeTagIn),
    .io_in_bits_typeTagOut(dfma_io_in_bits_typeTagOut),
    .io_in_bits_fromint(dfma_io_in_bits_fromint),
    .io_in_bits_toint(dfma_io_in_bits_toint),
    .io_in_bits_fastpipe(dfma_io_in_bits_fastpipe),
    .io_in_bits_fma(dfma_io_in_bits_fma),
    .io_in_bits_div(dfma_io_in_bits_div),
    .io_in_bits_sqrt(dfma_io_in_bits_sqrt),
    .io_in_bits_wflags(dfma_io_in_bits_wflags),
    .io_in_bits_rm(dfma_io_in_bits_rm),
    .io_in_bits_fmaCmd(dfma_io_in_bits_fmaCmd),
    .io_in_bits_typ(dfma_io_in_bits_typ),
    .io_in_bits_fmt(dfma_io_in_bits_fmt),
    .io_in_bits_in1(dfma_io_in_bits_in1),
    .io_in_bits_in2(dfma_io_in_bits_in2),
    .io_in_bits_in3(dfma_io_in_bits_in3),
    .io_out_valid(dfma_io_out_valid),
    .io_out_bits_data(dfma_io_out_bits_data),
    .io_out_bits_exc(dfma_io_out_bits_exc)
  );
  FMADecoder FMADecoder ( // @[fpu.scala 199:29]
    .clock(FMADecoder_clock),
    .reset(FMADecoder_reset),
    .io_uopc(FMADecoder_io_uopc),
    .io_cmd(FMADecoder_io_cmd)
  );
  FPUFMAPipe_1 sfma ( // @[fpu.scala 209:20]
    .clock(sfma_clock),
    .reset(sfma_reset),
    .io_in_valid(sfma_io_in_valid),
    .io_in_bits_ldst(sfma_io_in_bits_ldst),
    .io_in_bits_wen(sfma_io_in_bits_wen),
    .io_in_bits_ren1(sfma_io_in_bits_ren1),
    .io_in_bits_ren2(sfma_io_in_bits_ren2),
    .io_in_bits_ren3(sfma_io_in_bits_ren3),
    .io_in_bits_swap12(sfma_io_in_bits_swap12),
    .io_in_bits_swap23(sfma_io_in_bits_swap23),
    .io_in_bits_typeTagIn(sfma_io_in_bits_typeTagIn),
    .io_in_bits_typeTagOut(sfma_io_in_bits_typeTagOut),
    .io_in_bits_fromint(sfma_io_in_bits_fromint),
    .io_in_bits_toint(sfma_io_in_bits_toint),
    .io_in_bits_fastpipe(sfma_io_in_bits_fastpipe),
    .io_in_bits_fma(sfma_io_in_bits_fma),
    .io_in_bits_div(sfma_io_in_bits_div),
    .io_in_bits_sqrt(sfma_io_in_bits_sqrt),
    .io_in_bits_wflags(sfma_io_in_bits_wflags),
    .io_in_bits_rm(sfma_io_in_bits_rm),
    .io_in_bits_fmaCmd(sfma_io_in_bits_fmaCmd),
    .io_in_bits_typ(sfma_io_in_bits_typ),
    .io_in_bits_fmt(sfma_io_in_bits_fmt),
    .io_in_bits_in1(sfma_io_in_bits_in1),
    .io_in_bits_in2(sfma_io_in_bits_in2),
    .io_in_bits_in3(sfma_io_in_bits_in3),
    .io_out_valid(sfma_io_out_valid),
    .io_out_bits_data(sfma_io_out_bits_data),
    .io_out_bits_exc(sfma_io_out_bits_exc)
  );
  FMADecoder FMADecoder_1 ( // @[fpu.scala 199:29]
    .clock(FMADecoder_1_clock),
    .reset(FMADecoder_1_reset),
    .io_uopc(FMADecoder_1_io_uopc),
    .io_cmd(FMADecoder_1_io_cmd)
  );
  FPToInt fpiu ( // @[fpu.scala 213:20]
    .clock(fpiu_clock),
    .reset(fpiu_reset),
    .io_in_valid(fpiu_io_in_valid),
    .io_in_bits_ldst(fpiu_io_in_bits_ldst),
    .io_in_bits_wen(fpiu_io_in_bits_wen),
    .io_in_bits_ren1(fpiu_io_in_bits_ren1),
    .io_in_bits_ren2(fpiu_io_in_bits_ren2),
    .io_in_bits_ren3(fpiu_io_in_bits_ren3),
    .io_in_bits_swap12(fpiu_io_in_bits_swap12),
    .io_in_bits_swap23(fpiu_io_in_bits_swap23),
    .io_in_bits_typeTagIn(fpiu_io_in_bits_typeTagIn),
    .io_in_bits_typeTagOut(fpiu_io_in_bits_typeTagOut),
    .io_in_bits_fromint(fpiu_io_in_bits_fromint),
    .io_in_bits_toint(fpiu_io_in_bits_toint),
    .io_in_bits_fastpipe(fpiu_io_in_bits_fastpipe),
    .io_in_bits_fma(fpiu_io_in_bits_fma),
    .io_in_bits_div(fpiu_io_in_bits_div),
    .io_in_bits_sqrt(fpiu_io_in_bits_sqrt),
    .io_in_bits_wflags(fpiu_io_in_bits_wflags),
    .io_in_bits_rm(fpiu_io_in_bits_rm),
    .io_in_bits_fmaCmd(fpiu_io_in_bits_fmaCmd),
    .io_in_bits_typ(fpiu_io_in_bits_typ),
    .io_in_bits_fmt(fpiu_io_in_bits_fmt),
    .io_in_bits_in1(fpiu_io_in_bits_in1),
    .io_in_bits_in2(fpiu_io_in_bits_in2),
    .io_in_bits_in3(fpiu_io_in_bits_in3),
    .io_out_valid(fpiu_io_out_valid),
    .io_out_bits_in_ldst(fpiu_io_out_bits_in_ldst),
    .io_out_bits_in_wen(fpiu_io_out_bits_in_wen),
    .io_out_bits_in_ren1(fpiu_io_out_bits_in_ren1),
    .io_out_bits_in_ren2(fpiu_io_out_bits_in_ren2),
    .io_out_bits_in_ren3(fpiu_io_out_bits_in_ren3),
    .io_out_bits_in_swap12(fpiu_io_out_bits_in_swap12),
    .io_out_bits_in_swap23(fpiu_io_out_bits_in_swap23),
    .io_out_bits_in_typeTagIn(fpiu_io_out_bits_in_typeTagIn),
    .io_out_bits_in_typeTagOut(fpiu_io_out_bits_in_typeTagOut),
    .io_out_bits_in_fromint(fpiu_io_out_bits_in_fromint),
    .io_out_bits_in_toint(fpiu_io_out_bits_in_toint),
    .io_out_bits_in_fastpipe(fpiu_io_out_bits_in_fastpipe),
    .io_out_bits_in_fma(fpiu_io_out_bits_in_fma),
    .io_out_bits_in_div(fpiu_io_out_bits_in_div),
    .io_out_bits_in_sqrt(fpiu_io_out_bits_in_sqrt),
    .io_out_bits_in_wflags(fpiu_io_out_bits_in_wflags),
    .io_out_bits_in_rm(fpiu_io_out_bits_in_rm),
    .io_out_bits_in_fmaCmd(fpiu_io_out_bits_in_fmaCmd),
    .io_out_bits_in_typ(fpiu_io_out_bits_in_typ),
    .io_out_bits_in_fmt(fpiu_io_out_bits_in_fmt),
    .io_out_bits_in_in1(fpiu_io_out_bits_in_in1),
    .io_out_bits_in_in2(fpiu_io_out_bits_in_in2),
    .io_out_bits_in_in3(fpiu_io_out_bits_in_in3),
    .io_out_bits_lt(fpiu_io_out_bits_lt),
    .io_out_bits_store(fpiu_io_out_bits_store),
    .io_out_bits_toint(fpiu_io_out_bits_toint),
    .io_out_bits_exc(fpiu_io_out_bits_exc)
  );
  FMADecoder FMADecoder_2 ( // @[fpu.scala 199:29]
    .clock(FMADecoder_2_clock),
    .reset(FMADecoder_2_reset),
    .io_uopc(FMADecoder_2_io_uopc),
    .io_cmd(FMADecoder_2_io_cmd)
  );
  FPToFP fpmu ( // @[fpu.scala 222:20]
    .clock(fpmu_clock),
    .reset(fpmu_reset),
    .io_in_valid(fpmu_io_in_valid),
    .io_in_bits_ldst(fpmu_io_in_bits_ldst),
    .io_in_bits_wen(fpmu_io_in_bits_wen),
    .io_in_bits_ren1(fpmu_io_in_bits_ren1),
    .io_in_bits_ren2(fpmu_io_in_bits_ren2),
    .io_in_bits_ren3(fpmu_io_in_bits_ren3),
    .io_in_bits_swap12(fpmu_io_in_bits_swap12),
    .io_in_bits_swap23(fpmu_io_in_bits_swap23),
    .io_in_bits_typeTagIn(fpmu_io_in_bits_typeTagIn),
    .io_in_bits_typeTagOut(fpmu_io_in_bits_typeTagOut),
    .io_in_bits_fromint(fpmu_io_in_bits_fromint),
    .io_in_bits_toint(fpmu_io_in_bits_toint),
    .io_in_bits_fastpipe(fpmu_io_in_bits_fastpipe),
    .io_in_bits_fma(fpmu_io_in_bits_fma),
    .io_in_bits_div(fpmu_io_in_bits_div),
    .io_in_bits_sqrt(fpmu_io_in_bits_sqrt),
    .io_in_bits_wflags(fpmu_io_in_bits_wflags),
    .io_in_bits_rm(fpmu_io_in_bits_rm),
    .io_in_bits_fmaCmd(fpmu_io_in_bits_fmaCmd),
    .io_in_bits_typ(fpmu_io_in_bits_typ),
    .io_in_bits_fmt(fpmu_io_in_bits_fmt),
    .io_in_bits_in1(fpmu_io_in_bits_in1),
    .io_in_bits_in2(fpmu_io_in_bits_in2),
    .io_in_bits_in3(fpmu_io_in_bits_in3),
    .io_out_valid(fpmu_io_out_valid),
    .io_out_bits_data(fpmu_io_out_bits_data),
    .io_out_bits_exc(fpmu_io_out_bits_exc),
    .io_lt(fpmu_io_lt)
  );
  assign io_resp_valid = _T_57 | dfma_io_out_valid; // @[fpu.scala 231:38]
  assign io_resp_bits_uop_uopc = 7'h0;
  assign io_resp_bits_uop_inst = 32'h0;
  assign io_resp_bits_uop_debug_inst = 32'h0;
  assign io_resp_bits_uop_is_rvc = 1'h0;
  assign io_resp_bits_uop_debug_pc = 40'h0;
  assign io_resp_bits_uop_iq_type = 3'h0;
  assign io_resp_bits_uop_fu_code = 10'h0;
  assign io_resp_bits_uop_ctrl_br_type = 4'h0;
  assign io_resp_bits_uop_ctrl_op1_sel = 2'h0;
  assign io_resp_bits_uop_ctrl_op2_sel = 3'h0;
  assign io_resp_bits_uop_ctrl_imm_sel = 3'h0;
  assign io_resp_bits_uop_ctrl_op_fcn = 4'h0;
  assign io_resp_bits_uop_ctrl_fcn_dw = 1'h0;
  assign io_resp_bits_uop_ctrl_csr_cmd = 3'h0;
  assign io_resp_bits_uop_ctrl_is_load = 1'h0;
  assign io_resp_bits_uop_ctrl_is_sta = 1'h0;
  assign io_resp_bits_uop_ctrl_is_std = 1'h0;
  assign io_resp_bits_uop_iw_state = 2'h0;
  assign io_resp_bits_uop_iw_p1_poisoned = 1'h0;
  assign io_resp_bits_uop_iw_p2_poisoned = 1'h0;
  assign io_resp_bits_uop_is_br = 1'h0;
  assign io_resp_bits_uop_is_jalr = 1'h0;
  assign io_resp_bits_uop_is_jal = 1'h0;
  assign io_resp_bits_uop_is_sfb = 1'h0;
  assign io_resp_bits_uop_br_mask = 12'h0;
  assign io_resp_bits_uop_br_tag = 4'h0;
  assign io_resp_bits_uop_ftq_idx = 5'h0;
  assign io_resp_bits_uop_edge_inst = 1'h0;
  assign io_resp_bits_uop_pc_lob = 6'h0;
  assign io_resp_bits_uop_taken = 1'h0;
  assign io_resp_bits_uop_imm_packed = 20'h0;
  assign io_resp_bits_uop_csr_addr = 12'h0;
  assign io_resp_bits_uop_rob_idx = 6'h0;
  assign io_resp_bits_uop_ldq_idx = 4'h0;
  assign io_resp_bits_uop_stq_idx = 4'h0;
  assign io_resp_bits_uop_rxq_idx = 2'h0;
  assign io_resp_bits_uop_pdst = 6'h0;
  assign io_resp_bits_uop_prs1 = 6'h0;
  assign io_resp_bits_uop_prs2 = 6'h0;
  assign io_resp_bits_uop_prs3 = 6'h0;
  assign io_resp_bits_uop_ppred = 5'h0;
  assign io_resp_bits_uop_prs1_busy = 1'h0;
  assign io_resp_bits_uop_prs2_busy = 1'h0;
  assign io_resp_bits_uop_prs3_busy = 1'h0;
  assign io_resp_bits_uop_ppred_busy = 1'h0;
  assign io_resp_bits_uop_stale_pdst = 6'h0;
  assign io_resp_bits_uop_exception = 1'h0;
  assign io_resp_bits_uop_exc_cause = 64'h0;
  assign io_resp_bits_uop_bypassable = 1'h0;
  assign io_resp_bits_uop_mem_cmd = 5'h0;
  assign io_resp_bits_uop_mem_size = 2'h0;
  assign io_resp_bits_uop_mem_signed = 1'h0;
  assign io_resp_bits_uop_is_fence = 1'h0;
  assign io_resp_bits_uop_is_fencei = 1'h0;
  assign io_resp_bits_uop_is_amo = 1'h0;
  assign io_resp_bits_uop_uses_ldq = 1'h0;
  assign io_resp_bits_uop_uses_stq = 1'h0;
  assign io_resp_bits_uop_is_sys_pc2epc = 1'h0;
  assign io_resp_bits_uop_is_unique = 1'h0;
  assign io_resp_bits_uop_flush_on_commit = 1'h0;
  assign io_resp_bits_uop_ldst_is_rs1 = 1'h0;
  assign io_resp_bits_uop_ldst = 6'h0;
  assign io_resp_bits_uop_lrs1 = 6'h0;
  assign io_resp_bits_uop_lrs2 = 6'h0;
  assign io_resp_bits_uop_lrs3 = 6'h0;
  assign io_resp_bits_uop_ldst_val = 1'h0;
  assign io_resp_bits_uop_dst_rtype = 2'h0;
  assign io_resp_bits_uop_lrs1_rtype = 2'h0;
  assign io_resp_bits_uop_lrs2_rtype = 2'h0;
  assign io_resp_bits_uop_frs3_en = 1'h0;
  assign io_resp_bits_uop_fp_val = 1'h0;
  assign io_resp_bits_uop_fp_single = 1'h0;
  assign io_resp_bits_uop_xcpt_pf_if = 1'h0;
  assign io_resp_bits_uop_xcpt_ae_if = 1'h0;
  assign io_resp_bits_uop_xcpt_ma_if = 1'h0;
  assign io_resp_bits_uop_bp_debug_if = 1'h0;
  assign io_resp_bits_uop_bp_xcpt_if = 1'h0;
  assign io_resp_bits_uop_debug_fsrc = 2'h0;
  assign io_resp_bits_uop_debug_tsrc = 2'h0;
  assign io_resp_bits_data = dfma_io_out_valid ? _T_60 : _T_66; // @[fpu.scala 234:8]
  assign io_resp_bits_predicated = 1'h0;
  assign io_resp_bits_fflags_valid = io_resp_valid; // @[fpu.scala 246:34]
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
  assign io_resp_bits_fflags_bits_uop_ldq_idx = 4'h0;
  assign io_resp_bits_fflags_bits_uop_stq_idx = 4'h0;
  assign io_resp_bits_fflags_bits_uop_rxq_idx = 2'h0;
  assign io_resp_bits_fflags_bits_uop_pdst = 6'h0;
  assign io_resp_bits_fflags_bits_uop_prs1 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_prs2 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_prs3 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_ppred = 5'h0;
  assign io_resp_bits_fflags_bits_uop_prs1_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_prs2_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_prs3_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ppred_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_stale_pdst = 6'h0;
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
  assign io_resp_bits_fflags_bits_flags = dfma_io_out_valid ? dfma_io_out_bits_exc : _T_68; // @[fpu.scala 240:8]
  assign fp_decoder_clock = clock;
  assign fp_decoder_reset = reset;
  assign fp_decoder_io_uopc = io_req_bits_uop_uopc; // @[fpu.scala 180:22]
  assign dfma_clock = clock;
  assign dfma_reset = reset;
  assign dfma_io_in_valid = io_req_valid & fp_decoder_io_sigs_fma & fp_decoder_io_sigs_typeTagOut == 2'h1; // @[fpu.scala 206:51]
  assign dfma_io_in_bits_ldst = fp_decoder_io_sigs_ldst; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_wen = fp_decoder_io_sigs_wen; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_ren1 = fp_decoder_io_sigs_ren1; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_ren2 = fp_decoder_io_sigs_ren2; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_ren3 = fp_decoder_io_sigs_ren3; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_swap12 = fp_decoder_io_sigs_swap12; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_swap23 = fp_decoder_io_sigs_swap23; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_typeTagIn = fp_decoder_io_sigs_typeTagIn; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_typeTagOut = fp_decoder_io_sigs_typeTagOut; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_fromint = fp_decoder_io_sigs_fromint; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_toint = fp_decoder_io_sigs_toint; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_fastpipe = fp_decoder_io_sigs_fastpipe; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_fma = fp_decoder_io_sigs_fma; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_div = fp_decoder_io_sigs_div; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_sqrt = fp_decoder_io_sigs_sqrt; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_wflags = fp_decoder_io_sigs_wflags; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign dfma_io_in_bits_rm = io_req_bits_uop_imm_packed[2:0] == 3'h7 ? io_req_bits_fcsr_rm : io_req_bits_uop_imm_packed
    [2:0]; // @[fpu.scala 182:18]
  assign dfma_io_in_bits_fmaCmd = FMADecoder_io_cmd; // @[fpu.scala 185:19 fpu.scala 201:16]
  assign dfma_io_in_bits_typ = io_req_bits_uop_imm_packed[9:8]; // @[util.scala 295:59]
  assign dfma_io_in_bits_fmt = {{1'd0}, _GEN_1}; // @[fpu.scala 185:19]
  assign dfma_io_in_bits_in1 = io_req_bits_rs1_data; // @[FPU.scala 367:26]
  assign dfma_io_in_bits_in2 = io_req_bits_rs2_data; // @[FPU.scala 367:26]
  assign dfma_io_in_bits_in3 = fp_decoder_io_sigs_swap23 ? io_req_bits_rs2_data : io_req_bits_rs3_data; // @[fpu.scala 192:27 fpu.scala 192:37 fpu.scala 191:13]
  assign FMADecoder_clock = clock;
  assign FMADecoder_reset = reset;
  assign FMADecoder_io_uopc = io_req_bits_uop_uopc; // @[fpu.scala 200:25]
  assign sfma_clock = clock;
  assign sfma_reset = reset;
  assign sfma_io_in_valid = _T_3 & fp_decoder_io_sigs_typeTagOut == 2'h0; // @[fpu.scala 210:51]
  assign sfma_io_in_bits_ldst = fp_decoder_io_sigs_ldst; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_wen = fp_decoder_io_sigs_wen; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_ren1 = fp_decoder_io_sigs_ren1; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_ren2 = fp_decoder_io_sigs_ren2; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_ren3 = fp_decoder_io_sigs_ren3; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_swap12 = fp_decoder_io_sigs_swap12; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_swap23 = fp_decoder_io_sigs_swap23; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_typeTagIn = fp_decoder_io_sigs_typeTagIn; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_typeTagOut = fp_decoder_io_sigs_typeTagOut; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_fromint = fp_decoder_io_sigs_fromint; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_toint = fp_decoder_io_sigs_toint; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_fastpipe = fp_decoder_io_sigs_fastpipe; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_fma = fp_decoder_io_sigs_fma; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_div = fp_decoder_io_sigs_div; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_sqrt = fp_decoder_io_sigs_sqrt; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_wflags = fp_decoder_io_sigs_wflags; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign sfma_io_in_bits_rm = io_req_bits_uop_imm_packed[2:0] == 3'h7 ? io_req_bits_fcsr_rm : io_req_bits_uop_imm_packed
    [2:0]; // @[fpu.scala 182:18]
  assign sfma_io_in_bits_fmaCmd = FMADecoder_1_io_cmd; // @[fpu.scala 185:19 fpu.scala 201:16]
  assign sfma_io_in_bits_typ = io_req_bits_uop_imm_packed[9:8]; // @[util.scala 295:59]
  assign sfma_io_in_bits_fmt = {{1'd0}, _GEN_1}; // @[fpu.scala 185:19]
  assign sfma_io_in_bits_in1 = {{32'd0}, _T_20}; // @[fpu.scala 185:19 fpu.scala 189:13]
  assign sfma_io_in_bits_in2 = {{32'd0}, _T_22}; // @[fpu.scala 185:19 fpu.scala 190:13]
  assign sfma_io_in_bits_in3 = fp_decoder_io_sigs_swap23 ? _WIRE_1_in2 : {{32'd0}, _T_24}; // @[fpu.scala 192:27 fpu.scala 192:37 fpu.scala 191:13]
  assign FMADecoder_1_clock = clock;
  assign FMADecoder_1_reset = reset;
  assign FMADecoder_1_io_uopc = io_req_bits_uop_uopc; // @[fpu.scala 200:25]
  assign fpiu_clock = clock;
  assign fpiu_reset = reset;
  assign fpiu_io_in_valid = io_req_valid & (fp_decoder_io_sigs_toint | fp_decoder_io_sigs_fastpipe &
    fp_decoder_io_sigs_wflags); // @[fpu.scala 214:36]
  assign fpiu_io_in_bits_ldst = fp_decoder_io_sigs_ldst; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_wen = fp_decoder_io_sigs_wen; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_ren1 = fp_decoder_io_sigs_ren1; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_ren2 = fp_decoder_io_sigs_ren2; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_ren3 = fp_decoder_io_sigs_ren3; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_swap12 = fp_decoder_io_sigs_swap12; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_swap23 = fp_decoder_io_sigs_swap23; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_typeTagIn = fp_decoder_io_sigs_typeTagIn; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_typeTagOut = fp_decoder_io_sigs_typeTagOut; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_fromint = fp_decoder_io_sigs_fromint; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_toint = fp_decoder_io_sigs_toint; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_fastpipe = fp_decoder_io_sigs_fastpipe; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_fma = fp_decoder_io_sigs_fma; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_div = fp_decoder_io_sigs_div; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_sqrt = fp_decoder_io_sigs_sqrt; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_wflags = fp_decoder_io_sigs_wflags; // @[fpu.scala 185:19 fpu.scala 187:9]
  assign fpiu_io_in_bits_rm = io_req_bits_uop_imm_packed[2:0] == 3'h7 ? io_req_bits_fcsr_rm : io_req_bits_uop_imm_packed
    [2:0]; // @[fpu.scala 182:18]
  assign fpiu_io_in_bits_fmaCmd = FMADecoder_2_io_cmd; // @[fpu.scala 185:19 fpu.scala 201:16]
  assign fpiu_io_in_bits_typ = io_req_bits_uop_imm_packed[9:8]; // @[util.scala 295:59]
  assign fpiu_io_in_bits_fmt = {{1'd0}, _GEN_1}; // @[fpu.scala 185:19]
  assign fpiu_io_in_bits_in1 = _T_33 ? _T_35 : 65'he008000000000000; // @[FPU.scala 364:10]
  assign fpiu_io_in_bits_in2 = _T_38 ? _T_40 : 65'he008000000000000; // @[FPU.scala 364:10]
  assign fpiu_io_in_bits_in3 = fp_decoder_io_sigs_swap23 ? _T_41 : _T_46; // @[fpu.scala 192:27 fpu.scala 192:37 fpu.scala 191:13]
  assign FMADecoder_2_clock = clock;
  assign FMADecoder_2_reset = reset;
  assign FMADecoder_2_io_uopc = io_req_bits_uop_uopc; // @[fpu.scala 200:25]
  assign fpmu_clock = clock;
  assign fpmu_reset = reset;
  assign fpmu_io_in_valid = io_req_valid & fp_decoder_io_sigs_fastpipe; // @[fpu.scala 223:36]
  assign fpmu_io_in_bits_ldst = fpiu_io_in_bits_ldst; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_wen = fpiu_io_in_bits_wen; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_ren1 = fpiu_io_in_bits_ren1; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_ren2 = fpiu_io_in_bits_ren2; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_ren3 = fpiu_io_in_bits_ren3; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_swap12 = fpiu_io_in_bits_swap12; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_swap23 = fpiu_io_in_bits_swap23; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_typeTagIn = fpiu_io_in_bits_typeTagIn; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_typeTagOut = fpiu_io_in_bits_typeTagOut; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_fromint = fpiu_io_in_bits_fromint; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_toint = fpiu_io_in_bits_toint; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_fastpipe = fpiu_io_in_bits_fastpipe; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_fma = fpiu_io_in_bits_fma; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_div = fpiu_io_in_bits_div; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_sqrt = fpiu_io_in_bits_sqrt; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_wflags = fpiu_io_in_bits_wflags; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_rm = fpiu_io_in_bits_rm; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_fmaCmd = fpiu_io_in_bits_fmaCmd; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_typ = fpiu_io_in_bits_typ; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_fmt = fpiu_io_in_bits_fmt; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_in1 = fpiu_io_in_bits_in1; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_in2 = fpiu_io_in_bits_in2; // @[fpu.scala 224:19]
  assign fpmu_io_in_bits_in3 = fpiu_io_in_bits_in3; // @[fpu.scala 224:19]
  assign fpmu_io_lt = fpiu_io_out_bits_lt; // @[fpu.scala 225:14]
  always @(posedge clock) begin
    REG <= fpiu_io_in_valid & ~fp_decoder_io_sigs_fastpipe; // @[fpu.scala 216:48]
    if (reset) begin // @[Valid.scala 117:22]
      fpiu_outPipe_valid <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      fpiu_outPipe_valid <= REG; // @[Valid.scala 117:22]
    end
    if (REG) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_toint <= fpiu_io_out_bits_toint; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_exc <= fpiu_io_out_bits_exc; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      fpiu_outPipe_valid_1 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      fpiu_outPipe_valid_1 <= fpiu_outPipe_valid; // @[Valid.scala 117:22]
    end
    if (fpiu_outPipe_valid) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_1_toint <= fpiu_outPipe_bits_toint; // @[Reg.scala 16:23]
    end
    if (fpiu_outPipe_valid) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_1_exc <= fpiu_outPipe_bits_exc; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      fpiu_outPipe_valid_2 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      fpiu_outPipe_valid_2 <= fpiu_outPipe_valid_1; // @[Valid.scala 117:22]
    end
    if (fpiu_outPipe_valid_1) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_2_toint <= fpiu_outPipe_bits_1_toint; // @[Reg.scala 16:23]
    end
    if (fpiu_outPipe_valid_1) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_2_exc <= fpiu_outPipe_bits_1_exc; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      v <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      v <= _T_53; // @[Valid.scala 117:22]
    end
    if (_T_53) begin // @[Reg.scala 16:19]
      b <= _T_4; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid <= v; // @[Valid.scala 117:22]
    end
    if (v) begin // @[Reg.scala 16:19]
      outPipe_bits <= b; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid_1 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid_1 <= outPipe_valid; // @[Valid.scala 117:22]
    end
    if (outPipe_valid) begin // @[Reg.scala 16:19]
      outPipe_bits_1 <= outPipe_bits; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_1) begin // @[Reg.scala 16:19]
      outPipe_bits_2 <= outPipe_bits_1; // @[Reg.scala 16:23]
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
  REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  fpiu_outPipe_valid = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  fpiu_outPipe_bits_toint = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  fpiu_outPipe_bits_exc = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  fpiu_outPipe_valid_1 = _RAND_4[0:0];
  _RAND_5 = {2{`RANDOM}};
  fpiu_outPipe_bits_1_toint = _RAND_5[63:0];
  _RAND_6 = {1{`RANDOM}};
  fpiu_outPipe_bits_1_exc = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  fpiu_outPipe_valid_2 = _RAND_7[0:0];
  _RAND_8 = {2{`RANDOM}};
  fpiu_outPipe_bits_2_toint = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  fpiu_outPipe_bits_2_exc = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  v = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  b = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  outPipe_valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  outPipe_bits = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  outPipe_valid_1 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  outPipe_bits_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  outPipe_bits_2 = _RAND_16[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
