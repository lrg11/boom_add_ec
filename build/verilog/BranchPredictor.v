module BranchPredictor(
  input          clock,
  input          reset,
  input          io_f0_req_valid,
  input  [39:0]  io_f0_req_bits_pc,
  input  [63:0]  io_f0_req_bits_ghist_old_history,
  input          io_f0_req_bits_ghist_current_saw_branch_not_taken,
  input          io_f0_req_bits_ghist_new_saw_branch_not_taken,
  input          io_f0_req_bits_ghist_new_saw_branch_taken,
  input  [4:0]   io_f0_req_bits_ghist_ras_idx,
  output [39:0]  io_resp_f1_pc,
  output         io_resp_f1_preds_0_taken,
  output         io_resp_f1_preds_0_is_br,
  output         io_resp_f1_preds_0_is_jal,
  output         io_resp_f1_preds_0_predicted_pc_valid,
  output [39:0]  io_resp_f1_preds_0_predicted_pc_bits,
  output         io_resp_f1_preds_1_taken,
  output         io_resp_f1_preds_1_is_br,
  output         io_resp_f1_preds_1_is_jal,
  output         io_resp_f1_preds_1_predicted_pc_valid,
  output [39:0]  io_resp_f1_preds_1_predicted_pc_bits,
  output         io_resp_f1_preds_2_taken,
  output         io_resp_f1_preds_2_is_br,
  output         io_resp_f1_preds_2_is_jal,
  output         io_resp_f1_preds_2_predicted_pc_valid,
  output [39:0]  io_resp_f1_preds_2_predicted_pc_bits,
  output         io_resp_f1_preds_3_taken,
  output         io_resp_f1_preds_3_is_br,
  output         io_resp_f1_preds_3_is_jal,
  output         io_resp_f1_preds_3_predicted_pc_valid,
  output [39:0]  io_resp_f1_preds_3_predicted_pc_bits,
  output [119:0] io_resp_f1_meta_0,
  output         io_resp_f1_lhist_0,
  output [39:0]  io_resp_f2_pc,
  output         io_resp_f2_preds_0_taken,
  output         io_resp_f2_preds_0_is_br,
  output         io_resp_f2_preds_0_is_jal,
  output         io_resp_f2_preds_0_predicted_pc_valid,
  output [39:0]  io_resp_f2_preds_0_predicted_pc_bits,
  output         io_resp_f2_preds_1_taken,
  output         io_resp_f2_preds_1_is_br,
  output         io_resp_f2_preds_1_is_jal,
  output         io_resp_f2_preds_1_predicted_pc_valid,
  output [39:0]  io_resp_f2_preds_1_predicted_pc_bits,
  output         io_resp_f2_preds_2_taken,
  output         io_resp_f2_preds_2_is_br,
  output         io_resp_f2_preds_2_is_jal,
  output         io_resp_f2_preds_2_predicted_pc_valid,
  output [39:0]  io_resp_f2_preds_2_predicted_pc_bits,
  output         io_resp_f2_preds_3_taken,
  output         io_resp_f2_preds_3_is_br,
  output         io_resp_f2_preds_3_is_jal,
  output         io_resp_f2_preds_3_predicted_pc_valid,
  output [39:0]  io_resp_f2_preds_3_predicted_pc_bits,
  output [119:0] io_resp_f2_meta_0,
  output         io_resp_f2_lhist_0,
  output [39:0]  io_resp_f3_pc,
  output         io_resp_f3_preds_0_taken,
  output         io_resp_f3_preds_0_is_br,
  output         io_resp_f3_preds_0_is_jal,
  output         io_resp_f3_preds_0_predicted_pc_valid,
  output [39:0]  io_resp_f3_preds_0_predicted_pc_bits,
  output         io_resp_f3_preds_1_taken,
  output         io_resp_f3_preds_1_is_br,
  output         io_resp_f3_preds_1_is_jal,
  output         io_resp_f3_preds_1_predicted_pc_valid,
  output [39:0]  io_resp_f3_preds_1_predicted_pc_bits,
  output         io_resp_f3_preds_2_taken,
  output         io_resp_f3_preds_2_is_br,
  output         io_resp_f3_preds_2_is_jal,
  output         io_resp_f3_preds_2_predicted_pc_valid,
  output [39:0]  io_resp_f3_preds_2_predicted_pc_bits,
  output         io_resp_f3_preds_3_taken,
  output         io_resp_f3_preds_3_is_br,
  output         io_resp_f3_preds_3_is_jal,
  output         io_resp_f3_preds_3_predicted_pc_valid,
  output [39:0]  io_resp_f3_preds_3_predicted_pc_bits,
  output [119:0] io_resp_f3_meta_0,
  output         io_resp_f3_lhist_0,
  input          io_f3_fire,
  input          io_update_valid,
  input          io_update_bits_is_mispredict_update,
  input          io_update_bits_is_repair_update,
  input  [3:0]   io_update_bits_btb_mispredicts,
  input  [39:0]  io_update_bits_pc,
  input  [3:0]   io_update_bits_br_mask,
  input          io_update_bits_cfi_idx_valid,
  input  [1:0]   io_update_bits_cfi_idx_bits,
  input          io_update_bits_cfi_taken,
  input          io_update_bits_cfi_mispredicted,
  input          io_update_bits_cfi_is_br,
  input          io_update_bits_cfi_is_jal,
  input          io_update_bits_cfi_is_jalr,
  input  [63:0]  io_update_bits_ghist_old_history,
  input          io_update_bits_ghist_current_saw_branch_not_taken,
  input          io_update_bits_ghist_new_saw_branch_not_taken,
  input          io_update_bits_ghist_new_saw_branch_taken,
  input  [4:0]   io_update_bits_ghist_ras_idx,
  input          io_update_bits_lhist_0,
  input  [39:0]  io_update_bits_target,
  input  [119:0] io_update_bits_meta_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  banked_predictors_0_clock; // @[predictor.scala 218:19]
  wire  banked_predictors_0_reset; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_f0_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_f0_pc; // @[predictor.scala 218:19]
  wire [3:0] banked_predictors_0_io_f0_mask; // @[predictor.scala 218:19]
  wire [63:0] banked_predictors_0_io_f1_ghist; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_f1_lhist; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_0_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_0_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_0_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_0_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f1_0_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_1_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_1_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_1_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_1_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f1_1_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_2_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_2_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_2_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_2_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f1_2_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_3_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_3_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_3_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f1_3_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f1_3_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_0_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_0_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_0_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_0_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f2_0_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_1_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_1_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_1_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_1_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f2_1_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_2_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_2_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_2_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_2_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f2_2_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_3_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_3_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_3_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f2_3_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f2_3_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_0_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_0_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_0_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_0_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f3_0_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_1_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_1_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_1_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_1_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f3_1_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_2_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_2_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_2_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_2_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f3_2_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_3_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_3_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_3_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_in_0_f3_3_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_in_0_f3_3_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_0_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_0_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_0_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_0_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f1_0_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_1_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_1_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_1_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_1_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f1_1_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_2_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_2_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_2_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_2_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f1_2_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_3_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_3_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_3_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f1_3_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f1_3_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_0_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_0_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_0_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_0_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f2_0_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_1_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_1_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_1_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_1_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f2_1_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_2_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_2_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_2_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_2_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f2_2_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_3_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_3_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_3_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f2_3_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f2_3_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_0_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_0_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_0_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_0_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f3_0_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_1_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_1_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_1_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_1_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f3_1_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_2_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_2_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_2_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_2_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f3_2_predicted_pc_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_3_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_3_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_3_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_resp_f3_3_predicted_pc_valid; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_resp_f3_3_predicted_pc_bits; // @[predictor.scala 218:19]
  wire [119:0] banked_predictors_0_io_f3_meta; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_f3_fire; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_update_valid; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_update_bits_is_mispredict_update; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_update_bits_is_repair_update; // @[predictor.scala 218:19]
  wire [3:0] banked_predictors_0_io_update_bits_btb_mispredicts; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_update_bits_pc; // @[predictor.scala 218:19]
  wire [3:0] banked_predictors_0_io_update_bits_br_mask; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_update_bits_cfi_idx_valid; // @[predictor.scala 218:19]
  wire [1:0] banked_predictors_0_io_update_bits_cfi_idx_bits; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_update_bits_cfi_taken; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_update_bits_cfi_mispredicted; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_update_bits_cfi_is_br; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_update_bits_cfi_is_jal; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_update_bits_cfi_is_jalr; // @[predictor.scala 218:19]
  wire [63:0] banked_predictors_0_io_update_bits_ghist; // @[predictor.scala 218:19]
  wire  banked_predictors_0_io_update_bits_lhist; // @[predictor.scala 218:19]
  wire [39:0] banked_predictors_0_io_update_bits_target; // @[predictor.scala 218:19]
  wire [119:0] banked_predictors_0_io_update_bits_meta; // @[predictor.scala 218:19]
  wire  banked_lhist_providers_0_clock; // @[predictor.scala 228:57]
  wire  banked_lhist_providers_0_reset; // @[predictor.scala 228:57]
  wire  banked_lhist_providers_0_io_f0_valid; // @[predictor.scala 228:57]
  wire [39:0] banked_lhist_providers_0_io_f0_pc; // @[predictor.scala 228:57]
  wire  banked_lhist_providers_0_io_f1_lhist; // @[predictor.scala 228:57]
  wire  banked_lhist_providers_0_io_f3_lhist; // @[predictor.scala 228:57]
  wire  banked_lhist_providers_0_io_f3_taken_br; // @[predictor.scala 228:57]
  wire  banked_lhist_providers_0_io_f3_fire; // @[predictor.scala 228:57]
  wire  banked_lhist_providers_0_io_update_valid; // @[predictor.scala 228:57]
  wire  banked_lhist_providers_0_io_update_mispredict; // @[predictor.scala 228:57]
  wire  banked_lhist_providers_0_io_update_repair; // @[predictor.scala 228:57]
  wire [39:0] banked_lhist_providers_0_io_update_pc; // @[predictor.scala 228:57]
  wire  banked_lhist_providers_0_io_update_lhist; // @[predictor.scala 228:57]
  wire [39:0] _T = ~io_f0_req_bits_pc; // @[frontend.scala 161:33]
  wire [39:0] _T_1 = _T | 40'h7; // @[frontend.scala 161:39]
  wire [6:0] _T_7 = 7'hf << io_f0_req_bits_pc[2:1]; // @[frontend.scala 178:31]
  reg [63:0] REG; // @[predictor.scala 239:48]
  wire  _T_9 = banked_predictors_0_io_resp_f3_0_is_br & banked_predictors_0_io_resp_f3_0_predicted_pc_valid &
    banked_predictors_0_io_resp_f3_0_taken; // @[predictor.scala 293:39]
  wire  _T_11 = banked_predictors_0_io_resp_f3_1_is_br & banked_predictors_0_io_resp_f3_1_predicted_pc_valid &
    banked_predictors_0_io_resp_f3_1_taken; // @[predictor.scala 293:39]
  wire  _T_13 = banked_predictors_0_io_resp_f3_2_is_br & banked_predictors_0_io_resp_f3_2_predicted_pc_valid &
    banked_predictors_0_io_resp_f3_2_taken; // @[predictor.scala 293:39]
  wire  _T_15 = banked_predictors_0_io_resp_f3_3_is_br & banked_predictors_0_io_resp_f3_3_predicted_pc_valid &
    banked_predictors_0_io_resp_f3_3_taken; // @[predictor.scala 293:39]
  reg [39:0] REG_1; // @[predictor.scala 362:27]
  reg [39:0] REG_2; // @[predictor.scala 363:27]
  reg [39:0] REG_3; // @[predictor.scala 364:27]
  wire [39:0] _T_19 = ~io_update_bits_pc; // @[frontend.scala 161:33]
  wire [39:0] _T_20 = _T_19 | 40'h7; // @[frontend.scala 161:39]
  wire  _T_27 = io_update_bits_cfi_is_br & io_update_bits_cfi_idx_valid; // @[predictor.scala 467:36]
  wire [3:0] _T_28 = io_update_bits_br_mask >> io_update_bits_cfi_idx_bits; // @[predictor.scala 468:36]
  ComposedBranchPredictorBank banked_predictors_0 ( // @[predictor.scala 218:19]
    .clock(banked_predictors_0_clock),
    .reset(banked_predictors_0_reset),
    .io_f0_valid(banked_predictors_0_io_f0_valid),
    .io_f0_pc(banked_predictors_0_io_f0_pc),
    .io_f0_mask(banked_predictors_0_io_f0_mask),
    .io_f1_ghist(banked_predictors_0_io_f1_ghist),
    .io_f1_lhist(banked_predictors_0_io_f1_lhist),
    .io_resp_in_0_f1_0_taken(banked_predictors_0_io_resp_in_0_f1_0_taken),
    .io_resp_in_0_f1_0_is_br(banked_predictors_0_io_resp_in_0_f1_0_is_br),
    .io_resp_in_0_f1_0_is_jal(banked_predictors_0_io_resp_in_0_f1_0_is_jal),
    .io_resp_in_0_f1_0_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f1_0_predicted_pc_valid),
    .io_resp_in_0_f1_0_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f1_0_predicted_pc_bits),
    .io_resp_in_0_f1_1_taken(banked_predictors_0_io_resp_in_0_f1_1_taken),
    .io_resp_in_0_f1_1_is_br(banked_predictors_0_io_resp_in_0_f1_1_is_br),
    .io_resp_in_0_f1_1_is_jal(banked_predictors_0_io_resp_in_0_f1_1_is_jal),
    .io_resp_in_0_f1_1_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f1_1_predicted_pc_valid),
    .io_resp_in_0_f1_1_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f1_1_predicted_pc_bits),
    .io_resp_in_0_f1_2_taken(banked_predictors_0_io_resp_in_0_f1_2_taken),
    .io_resp_in_0_f1_2_is_br(banked_predictors_0_io_resp_in_0_f1_2_is_br),
    .io_resp_in_0_f1_2_is_jal(banked_predictors_0_io_resp_in_0_f1_2_is_jal),
    .io_resp_in_0_f1_2_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f1_2_predicted_pc_valid),
    .io_resp_in_0_f1_2_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f1_2_predicted_pc_bits),
    .io_resp_in_0_f1_3_taken(banked_predictors_0_io_resp_in_0_f1_3_taken),
    .io_resp_in_0_f1_3_is_br(banked_predictors_0_io_resp_in_0_f1_3_is_br),
    .io_resp_in_0_f1_3_is_jal(banked_predictors_0_io_resp_in_0_f1_3_is_jal),
    .io_resp_in_0_f1_3_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f1_3_predicted_pc_valid),
    .io_resp_in_0_f1_3_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f1_3_predicted_pc_bits),
    .io_resp_in_0_f2_0_taken(banked_predictors_0_io_resp_in_0_f2_0_taken),
    .io_resp_in_0_f2_0_is_br(banked_predictors_0_io_resp_in_0_f2_0_is_br),
    .io_resp_in_0_f2_0_is_jal(banked_predictors_0_io_resp_in_0_f2_0_is_jal),
    .io_resp_in_0_f2_0_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f2_0_predicted_pc_valid),
    .io_resp_in_0_f2_0_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f2_0_predicted_pc_bits),
    .io_resp_in_0_f2_1_taken(banked_predictors_0_io_resp_in_0_f2_1_taken),
    .io_resp_in_0_f2_1_is_br(banked_predictors_0_io_resp_in_0_f2_1_is_br),
    .io_resp_in_0_f2_1_is_jal(banked_predictors_0_io_resp_in_0_f2_1_is_jal),
    .io_resp_in_0_f2_1_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f2_1_predicted_pc_valid),
    .io_resp_in_0_f2_1_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f2_1_predicted_pc_bits),
    .io_resp_in_0_f2_2_taken(banked_predictors_0_io_resp_in_0_f2_2_taken),
    .io_resp_in_0_f2_2_is_br(banked_predictors_0_io_resp_in_0_f2_2_is_br),
    .io_resp_in_0_f2_2_is_jal(banked_predictors_0_io_resp_in_0_f2_2_is_jal),
    .io_resp_in_0_f2_2_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f2_2_predicted_pc_valid),
    .io_resp_in_0_f2_2_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f2_2_predicted_pc_bits),
    .io_resp_in_0_f2_3_taken(banked_predictors_0_io_resp_in_0_f2_3_taken),
    .io_resp_in_0_f2_3_is_br(banked_predictors_0_io_resp_in_0_f2_3_is_br),
    .io_resp_in_0_f2_3_is_jal(banked_predictors_0_io_resp_in_0_f2_3_is_jal),
    .io_resp_in_0_f2_3_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f2_3_predicted_pc_valid),
    .io_resp_in_0_f2_3_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f2_3_predicted_pc_bits),
    .io_resp_in_0_f3_0_taken(banked_predictors_0_io_resp_in_0_f3_0_taken),
    .io_resp_in_0_f3_0_is_br(banked_predictors_0_io_resp_in_0_f3_0_is_br),
    .io_resp_in_0_f3_0_is_jal(banked_predictors_0_io_resp_in_0_f3_0_is_jal),
    .io_resp_in_0_f3_0_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f3_0_predicted_pc_valid),
    .io_resp_in_0_f3_0_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f3_0_predicted_pc_bits),
    .io_resp_in_0_f3_1_taken(banked_predictors_0_io_resp_in_0_f3_1_taken),
    .io_resp_in_0_f3_1_is_br(banked_predictors_0_io_resp_in_0_f3_1_is_br),
    .io_resp_in_0_f3_1_is_jal(banked_predictors_0_io_resp_in_0_f3_1_is_jal),
    .io_resp_in_0_f3_1_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f3_1_predicted_pc_valid),
    .io_resp_in_0_f3_1_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f3_1_predicted_pc_bits),
    .io_resp_in_0_f3_2_taken(banked_predictors_0_io_resp_in_0_f3_2_taken),
    .io_resp_in_0_f3_2_is_br(banked_predictors_0_io_resp_in_0_f3_2_is_br),
    .io_resp_in_0_f3_2_is_jal(banked_predictors_0_io_resp_in_0_f3_2_is_jal),
    .io_resp_in_0_f3_2_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f3_2_predicted_pc_valid),
    .io_resp_in_0_f3_2_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f3_2_predicted_pc_bits),
    .io_resp_in_0_f3_3_taken(banked_predictors_0_io_resp_in_0_f3_3_taken),
    .io_resp_in_0_f3_3_is_br(banked_predictors_0_io_resp_in_0_f3_3_is_br),
    .io_resp_in_0_f3_3_is_jal(banked_predictors_0_io_resp_in_0_f3_3_is_jal),
    .io_resp_in_0_f3_3_predicted_pc_valid(banked_predictors_0_io_resp_in_0_f3_3_predicted_pc_valid),
    .io_resp_in_0_f3_3_predicted_pc_bits(banked_predictors_0_io_resp_in_0_f3_3_predicted_pc_bits),
    .io_resp_f1_0_taken(banked_predictors_0_io_resp_f1_0_taken),
    .io_resp_f1_0_is_br(banked_predictors_0_io_resp_f1_0_is_br),
    .io_resp_f1_0_is_jal(banked_predictors_0_io_resp_f1_0_is_jal),
    .io_resp_f1_0_predicted_pc_valid(banked_predictors_0_io_resp_f1_0_predicted_pc_valid),
    .io_resp_f1_0_predicted_pc_bits(banked_predictors_0_io_resp_f1_0_predicted_pc_bits),
    .io_resp_f1_1_taken(banked_predictors_0_io_resp_f1_1_taken),
    .io_resp_f1_1_is_br(banked_predictors_0_io_resp_f1_1_is_br),
    .io_resp_f1_1_is_jal(banked_predictors_0_io_resp_f1_1_is_jal),
    .io_resp_f1_1_predicted_pc_valid(banked_predictors_0_io_resp_f1_1_predicted_pc_valid),
    .io_resp_f1_1_predicted_pc_bits(banked_predictors_0_io_resp_f1_1_predicted_pc_bits),
    .io_resp_f1_2_taken(banked_predictors_0_io_resp_f1_2_taken),
    .io_resp_f1_2_is_br(banked_predictors_0_io_resp_f1_2_is_br),
    .io_resp_f1_2_is_jal(banked_predictors_0_io_resp_f1_2_is_jal),
    .io_resp_f1_2_predicted_pc_valid(banked_predictors_0_io_resp_f1_2_predicted_pc_valid),
    .io_resp_f1_2_predicted_pc_bits(banked_predictors_0_io_resp_f1_2_predicted_pc_bits),
    .io_resp_f1_3_taken(banked_predictors_0_io_resp_f1_3_taken),
    .io_resp_f1_3_is_br(banked_predictors_0_io_resp_f1_3_is_br),
    .io_resp_f1_3_is_jal(banked_predictors_0_io_resp_f1_3_is_jal),
    .io_resp_f1_3_predicted_pc_valid(banked_predictors_0_io_resp_f1_3_predicted_pc_valid),
    .io_resp_f1_3_predicted_pc_bits(banked_predictors_0_io_resp_f1_3_predicted_pc_bits),
    .io_resp_f2_0_taken(banked_predictors_0_io_resp_f2_0_taken),
    .io_resp_f2_0_is_br(banked_predictors_0_io_resp_f2_0_is_br),
    .io_resp_f2_0_is_jal(banked_predictors_0_io_resp_f2_0_is_jal),
    .io_resp_f2_0_predicted_pc_valid(banked_predictors_0_io_resp_f2_0_predicted_pc_valid),
    .io_resp_f2_0_predicted_pc_bits(banked_predictors_0_io_resp_f2_0_predicted_pc_bits),
    .io_resp_f2_1_taken(banked_predictors_0_io_resp_f2_1_taken),
    .io_resp_f2_1_is_br(banked_predictors_0_io_resp_f2_1_is_br),
    .io_resp_f2_1_is_jal(banked_predictors_0_io_resp_f2_1_is_jal),
    .io_resp_f2_1_predicted_pc_valid(banked_predictors_0_io_resp_f2_1_predicted_pc_valid),
    .io_resp_f2_1_predicted_pc_bits(banked_predictors_0_io_resp_f2_1_predicted_pc_bits),
    .io_resp_f2_2_taken(banked_predictors_0_io_resp_f2_2_taken),
    .io_resp_f2_2_is_br(banked_predictors_0_io_resp_f2_2_is_br),
    .io_resp_f2_2_is_jal(banked_predictors_0_io_resp_f2_2_is_jal),
    .io_resp_f2_2_predicted_pc_valid(banked_predictors_0_io_resp_f2_2_predicted_pc_valid),
    .io_resp_f2_2_predicted_pc_bits(banked_predictors_0_io_resp_f2_2_predicted_pc_bits),
    .io_resp_f2_3_taken(banked_predictors_0_io_resp_f2_3_taken),
    .io_resp_f2_3_is_br(banked_predictors_0_io_resp_f2_3_is_br),
    .io_resp_f2_3_is_jal(banked_predictors_0_io_resp_f2_3_is_jal),
    .io_resp_f2_3_predicted_pc_valid(banked_predictors_0_io_resp_f2_3_predicted_pc_valid),
    .io_resp_f2_3_predicted_pc_bits(banked_predictors_0_io_resp_f2_3_predicted_pc_bits),
    .io_resp_f3_0_taken(banked_predictors_0_io_resp_f3_0_taken),
    .io_resp_f3_0_is_br(banked_predictors_0_io_resp_f3_0_is_br),
    .io_resp_f3_0_is_jal(banked_predictors_0_io_resp_f3_0_is_jal),
    .io_resp_f3_0_predicted_pc_valid(banked_predictors_0_io_resp_f3_0_predicted_pc_valid),
    .io_resp_f3_0_predicted_pc_bits(banked_predictors_0_io_resp_f3_0_predicted_pc_bits),
    .io_resp_f3_1_taken(banked_predictors_0_io_resp_f3_1_taken),
    .io_resp_f3_1_is_br(banked_predictors_0_io_resp_f3_1_is_br),
    .io_resp_f3_1_is_jal(banked_predictors_0_io_resp_f3_1_is_jal),
    .io_resp_f3_1_predicted_pc_valid(banked_predictors_0_io_resp_f3_1_predicted_pc_valid),
    .io_resp_f3_1_predicted_pc_bits(banked_predictors_0_io_resp_f3_1_predicted_pc_bits),
    .io_resp_f3_2_taken(banked_predictors_0_io_resp_f3_2_taken),
    .io_resp_f3_2_is_br(banked_predictors_0_io_resp_f3_2_is_br),
    .io_resp_f3_2_is_jal(banked_predictors_0_io_resp_f3_2_is_jal),
    .io_resp_f3_2_predicted_pc_valid(banked_predictors_0_io_resp_f3_2_predicted_pc_valid),
    .io_resp_f3_2_predicted_pc_bits(banked_predictors_0_io_resp_f3_2_predicted_pc_bits),
    .io_resp_f3_3_taken(banked_predictors_0_io_resp_f3_3_taken),
    .io_resp_f3_3_is_br(banked_predictors_0_io_resp_f3_3_is_br),
    .io_resp_f3_3_is_jal(banked_predictors_0_io_resp_f3_3_is_jal),
    .io_resp_f3_3_predicted_pc_valid(banked_predictors_0_io_resp_f3_3_predicted_pc_valid),
    .io_resp_f3_3_predicted_pc_bits(banked_predictors_0_io_resp_f3_3_predicted_pc_bits),
    .io_f3_meta(banked_predictors_0_io_f3_meta),
    .io_f3_fire(banked_predictors_0_io_f3_fire),
    .io_update_valid(banked_predictors_0_io_update_valid),
    .io_update_bits_is_mispredict_update(banked_predictors_0_io_update_bits_is_mispredict_update),
    .io_update_bits_is_repair_update(banked_predictors_0_io_update_bits_is_repair_update),
    .io_update_bits_btb_mispredicts(banked_predictors_0_io_update_bits_btb_mispredicts),
    .io_update_bits_pc(banked_predictors_0_io_update_bits_pc),
    .io_update_bits_br_mask(banked_predictors_0_io_update_bits_br_mask),
    .io_update_bits_cfi_idx_valid(banked_predictors_0_io_update_bits_cfi_idx_valid),
    .io_update_bits_cfi_idx_bits(banked_predictors_0_io_update_bits_cfi_idx_bits),
    .io_update_bits_cfi_taken(banked_predictors_0_io_update_bits_cfi_taken),
    .io_update_bits_cfi_mispredicted(banked_predictors_0_io_update_bits_cfi_mispredicted),
    .io_update_bits_cfi_is_br(banked_predictors_0_io_update_bits_cfi_is_br),
    .io_update_bits_cfi_is_jal(banked_predictors_0_io_update_bits_cfi_is_jal),
    .io_update_bits_cfi_is_jalr(banked_predictors_0_io_update_bits_cfi_is_jalr),
    .io_update_bits_ghist(banked_predictors_0_io_update_bits_ghist),
    .io_update_bits_lhist(banked_predictors_0_io_update_bits_lhist),
    .io_update_bits_target(banked_predictors_0_io_update_bits_target),
    .io_update_bits_meta(banked_predictors_0_io_update_bits_meta)
  );
  NullLocalBranchPredictorBank banked_lhist_providers_0 ( // @[predictor.scala 228:57]
    .clock(banked_lhist_providers_0_clock),
    .reset(banked_lhist_providers_0_reset),
    .io_f0_valid(banked_lhist_providers_0_io_f0_valid),
    .io_f0_pc(banked_lhist_providers_0_io_f0_pc),
    .io_f1_lhist(banked_lhist_providers_0_io_f1_lhist),
    .io_f3_lhist(banked_lhist_providers_0_io_f3_lhist),
    .io_f3_taken_br(banked_lhist_providers_0_io_f3_taken_br),
    .io_f3_fire(banked_lhist_providers_0_io_f3_fire),
    .io_update_valid(banked_lhist_providers_0_io_update_valid),
    .io_update_mispredict(banked_lhist_providers_0_io_update_mispredict),
    .io_update_repair(banked_lhist_providers_0_io_update_repair),
    .io_update_pc(banked_lhist_providers_0_io_update_pc),
    .io_update_lhist(banked_lhist_providers_0_io_update_lhist)
  );
  assign io_resp_f1_pc = REG_1; // @[predictor.scala 362:17]
  assign io_resp_f1_preds_0_taken = banked_predictors_0_io_resp_f1_0_taken; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_0_is_br = banked_predictors_0_io_resp_f1_0_is_br; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_0_is_jal = banked_predictors_0_io_resp_f1_0_is_jal; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_0_predicted_pc_valid = banked_predictors_0_io_resp_f1_0_predicted_pc_valid; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_0_predicted_pc_bits = banked_predictors_0_io_resp_f1_0_predicted_pc_bits; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_1_taken = banked_predictors_0_io_resp_f1_1_taken; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_1_is_br = banked_predictors_0_io_resp_f1_1_is_br; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_1_is_jal = banked_predictors_0_io_resp_f1_1_is_jal; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_1_predicted_pc_valid = banked_predictors_0_io_resp_f1_1_predicted_pc_valid; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_1_predicted_pc_bits = banked_predictors_0_io_resp_f1_1_predicted_pc_bits; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_2_taken = banked_predictors_0_io_resp_f1_2_taken; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_2_is_br = banked_predictors_0_io_resp_f1_2_is_br; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_2_is_jal = banked_predictors_0_io_resp_f1_2_is_jal; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_2_predicted_pc_valid = banked_predictors_0_io_resp_f1_2_predicted_pc_valid; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_2_predicted_pc_bits = banked_predictors_0_io_resp_f1_2_predicted_pc_bits; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_3_taken = banked_predictors_0_io_resp_f1_3_taken; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_3_is_br = banked_predictors_0_io_resp_f1_3_is_br; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_3_is_jal = banked_predictors_0_io_resp_f1_3_is_jal; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_3_predicted_pc_valid = banked_predictors_0_io_resp_f1_3_predicted_pc_valid; // @[predictor.scala 298:25]
  assign io_resp_f1_preds_3_predicted_pc_bits = banked_predictors_0_io_resp_f1_3_predicted_pc_bits; // @[predictor.scala 298:25]
  assign io_resp_f1_meta_0 = 120'h0;
  assign io_resp_f1_lhist_0 = 1'h0;
  assign io_resp_f2_pc = REG_2; // @[predictor.scala 363:17]
  assign io_resp_f2_preds_0_taken = banked_predictors_0_io_resp_f2_0_taken; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_0_is_br = banked_predictors_0_io_resp_f2_0_is_br; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_0_is_jal = banked_predictors_0_io_resp_f2_0_is_jal; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_0_predicted_pc_valid = banked_predictors_0_io_resp_f2_0_predicted_pc_valid; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_0_predicted_pc_bits = banked_predictors_0_io_resp_f2_0_predicted_pc_bits; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_1_taken = banked_predictors_0_io_resp_f2_1_taken; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_1_is_br = banked_predictors_0_io_resp_f2_1_is_br; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_1_is_jal = banked_predictors_0_io_resp_f2_1_is_jal; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_1_predicted_pc_valid = banked_predictors_0_io_resp_f2_1_predicted_pc_valid; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_1_predicted_pc_bits = banked_predictors_0_io_resp_f2_1_predicted_pc_bits; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_2_taken = banked_predictors_0_io_resp_f2_2_taken; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_2_is_br = banked_predictors_0_io_resp_f2_2_is_br; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_2_is_jal = banked_predictors_0_io_resp_f2_2_is_jal; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_2_predicted_pc_valid = banked_predictors_0_io_resp_f2_2_predicted_pc_valid; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_2_predicted_pc_bits = banked_predictors_0_io_resp_f2_2_predicted_pc_bits; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_3_taken = banked_predictors_0_io_resp_f2_3_taken; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_3_is_br = banked_predictors_0_io_resp_f2_3_is_br; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_3_is_jal = banked_predictors_0_io_resp_f2_3_is_jal; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_3_predicted_pc_valid = banked_predictors_0_io_resp_f2_3_predicted_pc_valid; // @[predictor.scala 299:25]
  assign io_resp_f2_preds_3_predicted_pc_bits = banked_predictors_0_io_resp_f2_3_predicted_pc_bits; // @[predictor.scala 299:25]
  assign io_resp_f2_meta_0 = 120'h0;
  assign io_resp_f2_lhist_0 = 1'h0;
  assign io_resp_f3_pc = REG_3; // @[predictor.scala 364:17]
  assign io_resp_f3_preds_0_taken = banked_predictors_0_io_resp_f3_0_taken; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_0_is_br = banked_predictors_0_io_resp_f3_0_is_br; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_0_is_jal = banked_predictors_0_io_resp_f3_0_is_jal; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_0_predicted_pc_valid = banked_predictors_0_io_resp_f3_0_predicted_pc_valid; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_0_predicted_pc_bits = banked_predictors_0_io_resp_f3_0_predicted_pc_bits; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_1_taken = banked_predictors_0_io_resp_f3_1_taken; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_1_is_br = banked_predictors_0_io_resp_f3_1_is_br; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_1_is_jal = banked_predictors_0_io_resp_f3_1_is_jal; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_1_predicted_pc_valid = banked_predictors_0_io_resp_f3_1_predicted_pc_valid; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_1_predicted_pc_bits = banked_predictors_0_io_resp_f3_1_predicted_pc_bits; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_2_taken = banked_predictors_0_io_resp_f3_2_taken; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_2_is_br = banked_predictors_0_io_resp_f3_2_is_br; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_2_is_jal = banked_predictors_0_io_resp_f3_2_is_jal; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_2_predicted_pc_valid = banked_predictors_0_io_resp_f3_2_predicted_pc_valid; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_2_predicted_pc_bits = banked_predictors_0_io_resp_f3_2_predicted_pc_bits; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_3_taken = banked_predictors_0_io_resp_f3_3_taken; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_3_is_br = banked_predictors_0_io_resp_f3_3_is_br; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_3_is_jal = banked_predictors_0_io_resp_f3_3_is_jal; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_3_predicted_pc_valid = banked_predictors_0_io_resp_f3_3_predicted_pc_valid; // @[predictor.scala 300:25]
  assign io_resp_f3_preds_3_predicted_pc_bits = banked_predictors_0_io_resp_f3_3_predicted_pc_bits; // @[predictor.scala 300:25]
  assign io_resp_f3_meta_0 = banked_predictors_0_io_f3_meta; // @[predictor.scala 301:25]
  assign io_resp_f3_lhist_0 = banked_lhist_providers_0_io_f3_lhist; // @[predictor.scala 302:25]
  assign banked_predictors_0_clock = clock;
  assign banked_predictors_0_reset = reset;
  assign banked_predictors_0_io_f0_valid = io_f0_req_valid; // @[predictor.scala 235:38]
  assign banked_predictors_0_io_f0_pc = ~_T_1; // @[frontend.scala 161:31]
  assign banked_predictors_0_io_f0_mask = _T_7[3:0]; // @[predictor.scala 237:38]
  assign banked_predictors_0_io_f1_ghist = REG; // @[predictor.scala 239:38]
  assign banked_predictors_0_io_f1_lhist = banked_lhist_providers_0_io_f1_lhist; // @[predictor.scala 240:38]
  assign banked_predictors_0_io_resp_in_0_f1_0_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_0_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_0_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_0_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_0_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_1_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_1_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_1_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_1_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_1_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_2_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_2_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_2_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_2_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_2_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_3_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_3_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_3_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_3_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f1_3_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_0_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_0_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_0_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_0_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_0_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_1_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_1_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_1_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_1_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_1_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_2_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_2_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_2_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_2_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_2_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_3_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_3_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_3_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_3_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f2_3_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_0_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_0_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_0_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_0_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_0_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_1_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_1_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_1_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_1_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_1_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_2_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_2_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_2_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_2_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_2_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_3_taken = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_3_is_br = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_3_is_jal = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_3_predicted_pc_valid = 1'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_resp_in_0_f3_3_predicted_pc_bits = 40'h0; // @[predictor.scala 242:67 predictor.scala 242:67]
  assign banked_predictors_0_io_f3_fire = io_f3_fire; // @[predictor.scala 304:37]
  assign banked_predictors_0_io_update_valid = io_update_valid; // @[predictor.scala 394:58]
  assign banked_predictors_0_io_update_bits_is_mispredict_update = io_update_bits_is_mispredict_update; // @[predictor.scala 375:62]
  assign banked_predictors_0_io_update_bits_is_repair_update = io_update_bits_is_repair_update; // @[predictor.scala 376:62]
  assign banked_predictors_0_io_update_bits_btb_mispredicts = io_update_bits_btb_mispredicts; // @[predictor.scala 397:58]
  assign banked_predictors_0_io_update_bits_pc = ~_T_20; // @[frontend.scala 161:31]
  assign banked_predictors_0_io_update_bits_br_mask = io_update_bits_br_mask; // @[predictor.scala 396:58]
  assign banked_predictors_0_io_update_bits_cfi_idx_valid = io_update_bits_cfi_idx_valid; // @[predictor.scala 398:58]
  assign banked_predictors_0_io_update_bits_cfi_idx_bits = io_update_bits_cfi_idx_bits; // @[predictor.scala 380:58]
  assign banked_predictors_0_io_update_bits_cfi_taken = io_update_bits_cfi_taken; // @[predictor.scala 381:58]
  assign banked_predictors_0_io_update_bits_cfi_mispredicted = io_update_bits_cfi_mispredicted; // @[predictor.scala 382:58]
  assign banked_predictors_0_io_update_bits_cfi_is_br = io_update_bits_cfi_is_br; // @[predictor.scala 383:58]
  assign banked_predictors_0_io_update_bits_cfi_is_jal = io_update_bits_cfi_is_jal; // @[predictor.scala 384:58]
  assign banked_predictors_0_io_update_bits_cfi_is_jalr = io_update_bits_cfi_is_jalr; // @[predictor.scala 385:58]
  assign banked_predictors_0_io_update_bits_ghist = io_update_bits_ghist_old_history; // @[predictor.scala 399:58]
  assign banked_predictors_0_io_update_bits_lhist = io_update_bits_lhist_0; // @[predictor.scala 379:58]
  assign banked_predictors_0_io_update_bits_target = io_update_bits_target; // @[predictor.scala 386:58]
  assign banked_predictors_0_io_update_bits_meta = io_update_bits_meta_0; // @[predictor.scala 378:58]
  assign banked_lhist_providers_0_clock = clock;
  assign banked_lhist_providers_0_reset = reset;
  assign banked_lhist_providers_0_io_f0_valid = io_f0_req_valid; // @[predictor.scala 232:43]
  assign banked_lhist_providers_0_io_f0_pc = ~_T_1; // @[frontend.scala 161:31]
  assign banked_lhist_providers_0_io_f3_taken_br = _T_9 | _T_11 | _T_13 | _T_15; // @[predictor.scala 294:15]
  assign banked_lhist_providers_0_io_f3_fire = io_f3_fire; // @[predictor.scala 305:42]
  assign banked_lhist_providers_0_io_update_valid = io_update_valid & io_update_bits_br_mask != 4'h0; // @[predictor.scala 401:66]
  assign banked_lhist_providers_0_io_update_mispredict = io_update_bits_is_mispredict_update; // @[predictor.scala 388:52]
  assign banked_lhist_providers_0_io_update_repair = io_update_bits_is_repair_update; // @[predictor.scala 389:52]
  assign banked_lhist_providers_0_io_update_pc = ~_T_20; // @[frontend.scala 161:31]
  assign banked_lhist_providers_0_io_update_lhist = io_update_bits_lhist_0; // @[predictor.scala 390:52]
  always @(posedge clock) begin
    REG <= io_f0_req_bits_ghist_old_history; // @[predictor.scala 239:48]
    REG_1 <= io_f0_req_bits_pc; // @[predictor.scala 362:27]
    REG_2 <= io_resp_f1_pc; // @[predictor.scala 363:27]
    REG_3 <= io_resp_f2_pc; // @[predictor.scala 364:27]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_update_valid & _T_27 & ~(_T_28[0] | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at predictor.scala:468 assert(io.update.bits.br_mask(io.update.bits.cfi_idx.bits))\n"
            ); // @[predictor.scala 468:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_update_valid & _T_27 & ~(_T_28[0] | reset)) begin
          $fatal; // @[predictor.scala 468:13]
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
  _RAND_0 = {2{`RANDOM}};
  REG = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  REG_1 = _RAND_1[39:0];
  _RAND_2 = {2{`RANDOM}};
  REG_2 = _RAND_2[39:0];
  _RAND_3 = {2{`RANDOM}};
  REG_3 = _RAND_3[39:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
