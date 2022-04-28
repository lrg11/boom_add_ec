module ComposedBranchPredictorBank(
  input         clock,
  input         reset,
  input         io_f0_valid,
  input  [39:0] io_f0_pc,
  input  [3:0]  io_f0_mask,
  input  [15:0] io_f1_ghist,
  input         io_f1_lhist,
  input         io_resp_in_0_f1_0_taken,
  input         io_resp_in_0_f1_0_is_br,
  input         io_resp_in_0_f1_0_is_jal,
  input         io_resp_in_0_f1_0_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f1_0_predicted_pc_bits,
  input         io_resp_in_0_f1_1_taken,
  input         io_resp_in_0_f1_1_is_br,
  input         io_resp_in_0_f1_1_is_jal,
  input         io_resp_in_0_f1_1_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f1_1_predicted_pc_bits,
  input         io_resp_in_0_f1_2_taken,
  input         io_resp_in_0_f1_2_is_br,
  input         io_resp_in_0_f1_2_is_jal,
  input         io_resp_in_0_f1_2_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f1_2_predicted_pc_bits,
  input         io_resp_in_0_f1_3_taken,
  input         io_resp_in_0_f1_3_is_br,
  input         io_resp_in_0_f1_3_is_jal,
  input         io_resp_in_0_f1_3_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f1_3_predicted_pc_bits,
  input         io_resp_in_0_f2_0_taken,
  input         io_resp_in_0_f2_0_is_br,
  input         io_resp_in_0_f2_0_is_jal,
  input         io_resp_in_0_f2_0_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f2_0_predicted_pc_bits,
  input         io_resp_in_0_f2_1_taken,
  input         io_resp_in_0_f2_1_is_br,
  input         io_resp_in_0_f2_1_is_jal,
  input         io_resp_in_0_f2_1_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f2_1_predicted_pc_bits,
  input         io_resp_in_0_f2_2_taken,
  input         io_resp_in_0_f2_2_is_br,
  input         io_resp_in_0_f2_2_is_jal,
  input         io_resp_in_0_f2_2_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f2_2_predicted_pc_bits,
  input         io_resp_in_0_f2_3_taken,
  input         io_resp_in_0_f2_3_is_br,
  input         io_resp_in_0_f2_3_is_jal,
  input         io_resp_in_0_f2_3_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f2_3_predicted_pc_bits,
  input         io_resp_in_0_f3_0_taken,
  input         io_resp_in_0_f3_0_is_br,
  input         io_resp_in_0_f3_0_is_jal,
  input         io_resp_in_0_f3_0_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f3_0_predicted_pc_bits,
  input         io_resp_in_0_f3_1_taken,
  input         io_resp_in_0_f3_1_is_br,
  input         io_resp_in_0_f3_1_is_jal,
  input         io_resp_in_0_f3_1_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f3_1_predicted_pc_bits,
  input         io_resp_in_0_f3_2_taken,
  input         io_resp_in_0_f3_2_is_br,
  input         io_resp_in_0_f3_2_is_jal,
  input         io_resp_in_0_f3_2_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f3_2_predicted_pc_bits,
  input         io_resp_in_0_f3_3_taken,
  input         io_resp_in_0_f3_3_is_br,
  input         io_resp_in_0_f3_3_is_jal,
  input         io_resp_in_0_f3_3_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f3_3_predicted_pc_bits,
  output        io_resp_f1_0_taken,
  output        io_resp_f1_0_is_br,
  output        io_resp_f1_0_is_jal,
  output        io_resp_f1_0_predicted_pc_valid,
  output [39:0] io_resp_f1_0_predicted_pc_bits,
  output        io_resp_f1_1_taken,
  output        io_resp_f1_1_is_br,
  output        io_resp_f1_1_is_jal,
  output        io_resp_f1_1_predicted_pc_valid,
  output [39:0] io_resp_f1_1_predicted_pc_bits,
  output        io_resp_f1_2_taken,
  output        io_resp_f1_2_is_br,
  output        io_resp_f1_2_is_jal,
  output        io_resp_f1_2_predicted_pc_valid,
  output [39:0] io_resp_f1_2_predicted_pc_bits,
  output        io_resp_f1_3_taken,
  output        io_resp_f1_3_is_br,
  output        io_resp_f1_3_is_jal,
  output        io_resp_f1_3_predicted_pc_valid,
  output [39:0] io_resp_f1_3_predicted_pc_bits,
  output        io_resp_f2_0_taken,
  output        io_resp_f2_0_is_br,
  output        io_resp_f2_0_is_jal,
  output        io_resp_f2_0_predicted_pc_valid,
  output [39:0] io_resp_f2_0_predicted_pc_bits,
  output        io_resp_f2_1_taken,
  output        io_resp_f2_1_is_br,
  output        io_resp_f2_1_is_jal,
  output        io_resp_f2_1_predicted_pc_valid,
  output [39:0] io_resp_f2_1_predicted_pc_bits,
  output        io_resp_f2_2_taken,
  output        io_resp_f2_2_is_br,
  output        io_resp_f2_2_is_jal,
  output        io_resp_f2_2_predicted_pc_valid,
  output [39:0] io_resp_f2_2_predicted_pc_bits,
  output        io_resp_f2_3_taken,
  output        io_resp_f2_3_is_br,
  output        io_resp_f2_3_is_jal,
  output        io_resp_f2_3_predicted_pc_valid,
  output [39:0] io_resp_f2_3_predicted_pc_bits,
  output        io_resp_f3_0_taken,
  output        io_resp_f3_0_is_br,
  output        io_resp_f3_0_is_jal,
  output        io_resp_f3_0_predicted_pc_valid,
  output [39:0] io_resp_f3_0_predicted_pc_bits,
  output        io_resp_f3_1_taken,
  output        io_resp_f3_1_is_br,
  output        io_resp_f3_1_is_jal,
  output        io_resp_f3_1_predicted_pc_valid,
  output [39:0] io_resp_f3_1_predicted_pc_bits,
  output        io_resp_f3_2_taken,
  output        io_resp_f3_2_is_br,
  output        io_resp_f3_2_is_jal,
  output        io_resp_f3_2_predicted_pc_valid,
  output [39:0] io_resp_f3_2_predicted_pc_bits,
  output        io_resp_f3_3_taken,
  output        io_resp_f3_3_is_br,
  output        io_resp_f3_3_is_jal,
  output        io_resp_f3_3_predicted_pc_valid,
  output [39:0] io_resp_f3_3_predicted_pc_bits,
  output [44:0] io_f3_meta,
  input         io_f3_fire,
  input         io_update_valid,
  input         io_update_bits_is_mispredict_update,
  input         io_update_bits_is_repair_update,
  input  [3:0]  io_update_bits_btb_mispredicts,
  input  [39:0] io_update_bits_pc,
  input  [3:0]  io_update_bits_br_mask,
  input         io_update_bits_cfi_idx_valid,
  input  [1:0]  io_update_bits_cfi_idx_bits,
  input         io_update_bits_cfi_taken,
  input         io_update_bits_cfi_mispredicted,
  input         io_update_bits_cfi_is_br,
  input         io_update_bits_cfi_is_jal,
  input         io_update_bits_cfi_is_jalr,
  input  [15:0] io_update_bits_ghist,
  input         io_update_bits_lhist,
  input  [39:0] io_update_bits_target,
  input  [44:0] io_update_bits_meta
);
  wire  components_2_clock; // @[config-mixins.scala 667:28]
  wire  components_2_reset; // @[config-mixins.scala 667:28]
  wire  components_2_io_f0_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_f0_pc; // @[config-mixins.scala 667:28]
  wire [3:0] components_2_io_f0_mask; // @[config-mixins.scala 667:28]
  wire [15:0] components_2_io_f1_ghist; // @[config-mixins.scala 667:28]
  wire  components_2_io_f1_lhist; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_0_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_0_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_0_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_0_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f1_0_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_1_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_1_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_1_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_1_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f1_1_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_2_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_2_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_2_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_2_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f1_2_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_3_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_3_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_3_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f1_3_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f1_3_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_0_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_0_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_0_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_0_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f2_0_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_1_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_1_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_1_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_1_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f2_1_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_2_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_2_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_2_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_2_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f2_2_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_3_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_3_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_3_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f2_3_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f2_3_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_0_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_0_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_0_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_0_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f3_0_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_1_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_1_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_1_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_1_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f3_1_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_2_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_2_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_2_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_2_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f3_2_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_3_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_3_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_3_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_in_0_f3_3_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_in_0_f3_3_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_0_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_0_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_0_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_0_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f1_0_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_1_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_1_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_1_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_1_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f1_1_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_2_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_2_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_2_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_2_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f1_2_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_3_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_3_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_3_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f1_3_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f1_3_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_0_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_0_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_0_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_0_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f2_0_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_1_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_1_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_1_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_1_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f2_1_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_2_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_2_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_2_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_2_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f2_2_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_3_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_3_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_3_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f2_3_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f2_3_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_0_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_0_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_0_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_0_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f3_0_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_1_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_1_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_1_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_1_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f3_1_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_2_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_2_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_2_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_2_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f3_2_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_3_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_3_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_3_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_resp_f3_3_predicted_pc_valid; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_resp_f3_3_predicted_pc_bits; // @[config-mixins.scala 667:28]
  wire [44:0] components_2_io_f3_meta; // @[config-mixins.scala 667:28]
  wire  components_2_io_f3_fire; // @[config-mixins.scala 667:28]
  wire  components_2_io_update_valid; // @[config-mixins.scala 667:28]
  wire  components_2_io_update_bits_is_mispredict_update; // @[config-mixins.scala 667:28]
  wire  components_2_io_update_bits_is_repair_update; // @[config-mixins.scala 667:28]
  wire [3:0] components_2_io_update_bits_btb_mispredicts; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_update_bits_pc; // @[config-mixins.scala 667:28]
  wire [3:0] components_2_io_update_bits_br_mask; // @[config-mixins.scala 667:28]
  wire  components_2_io_update_bits_cfi_idx_valid; // @[config-mixins.scala 667:28]
  wire [1:0] components_2_io_update_bits_cfi_idx_bits; // @[config-mixins.scala 667:28]
  wire  components_2_io_update_bits_cfi_taken; // @[config-mixins.scala 667:28]
  wire  components_2_io_update_bits_cfi_mispredicted; // @[config-mixins.scala 667:28]
  wire  components_2_io_update_bits_cfi_is_br; // @[config-mixins.scala 667:28]
  wire  components_2_io_update_bits_cfi_is_jal; // @[config-mixins.scala 667:28]
  wire  components_2_io_update_bits_cfi_is_jalr; // @[config-mixins.scala 667:28]
  wire [15:0] components_2_io_update_bits_ghist; // @[config-mixins.scala 667:28]
  wire  components_2_io_update_bits_lhist; // @[config-mixins.scala 667:28]
  wire [39:0] components_2_io_update_bits_target; // @[config-mixins.scala 667:28]
  wire [44:0] components_2_io_update_bits_meta; // @[config-mixins.scala 667:28]
  wire  components_1_clock; // @[config-mixins.scala 670:25]
  wire  components_1_reset; // @[config-mixins.scala 670:25]
  wire  components_1_io_f0_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_f0_pc; // @[config-mixins.scala 670:25]
  wire [3:0] components_1_io_f0_mask; // @[config-mixins.scala 670:25]
  wire [15:0] components_1_io_f1_ghist; // @[config-mixins.scala 670:25]
  wire  components_1_io_f1_lhist; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_0_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_0_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_0_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_0_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f1_0_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_1_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_1_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_1_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_1_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f1_1_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_2_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_2_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_2_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_2_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f1_2_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_3_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_3_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_3_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f1_3_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f1_3_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_0_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_0_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_0_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_0_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f2_0_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_1_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_1_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_1_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_1_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f2_1_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_2_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_2_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_2_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_2_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f2_2_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_3_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_3_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_3_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f2_3_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f2_3_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_0_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_0_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_0_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_0_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f3_0_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_1_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_1_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_1_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_1_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f3_1_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_2_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_2_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_2_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_2_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f3_2_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_3_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_3_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_3_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_in_0_f3_3_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_in_0_f3_3_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_0_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_0_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_0_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_0_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f1_0_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_1_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_1_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_1_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_1_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f1_1_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_2_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_2_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_2_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_2_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f1_2_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_3_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_3_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_3_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f1_3_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f1_3_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_0_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_0_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_0_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_0_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f2_0_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_1_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_1_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_1_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_1_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f2_1_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_2_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_2_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_2_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_2_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f2_2_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_3_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_3_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_3_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f2_3_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f2_3_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_0_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_0_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_0_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_0_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f3_0_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_1_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_1_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_1_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_1_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f3_1_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_2_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_2_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_2_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_2_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f3_2_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_3_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_3_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_3_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_resp_f3_3_predicted_pc_valid; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_resp_f3_3_predicted_pc_bits; // @[config-mixins.scala 670:25]
  wire [44:0] components_1_io_f3_meta; // @[config-mixins.scala 670:25]
  wire  components_1_io_f3_fire; // @[config-mixins.scala 670:25]
  wire  components_1_io_update_valid; // @[config-mixins.scala 670:25]
  wire  components_1_io_update_bits_is_mispredict_update; // @[config-mixins.scala 670:25]
  wire  components_1_io_update_bits_is_repair_update; // @[config-mixins.scala 670:25]
  wire [3:0] components_1_io_update_bits_btb_mispredicts; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_update_bits_pc; // @[config-mixins.scala 670:25]
  wire [3:0] components_1_io_update_bits_br_mask; // @[config-mixins.scala 670:25]
  wire  components_1_io_update_bits_cfi_idx_valid; // @[config-mixins.scala 670:25]
  wire [1:0] components_1_io_update_bits_cfi_idx_bits; // @[config-mixins.scala 670:25]
  wire  components_1_io_update_bits_cfi_taken; // @[config-mixins.scala 670:25]
  wire  components_1_io_update_bits_cfi_mispredicted; // @[config-mixins.scala 670:25]
  wire  components_1_io_update_bits_cfi_is_br; // @[config-mixins.scala 670:25]
  wire  components_1_io_update_bits_cfi_is_jal; // @[config-mixins.scala 670:25]
  wire  components_1_io_update_bits_cfi_is_jalr; // @[config-mixins.scala 670:25]
  wire [15:0] components_1_io_update_bits_ghist; // @[config-mixins.scala 670:25]
  wire  components_1_io_update_bits_lhist; // @[config-mixins.scala 670:25]
  wire [39:0] components_1_io_update_bits_target; // @[config-mixins.scala 670:25]
  wire [44:0] components_1_io_update_bits_meta; // @[config-mixins.scala 670:25]
  wire  components_0_clock; // @[config-mixins.scala 673:25]
  wire  components_0_reset; // @[config-mixins.scala 673:25]
  wire  components_0_io_f0_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_f0_pc; // @[config-mixins.scala 673:25]
  wire [3:0] components_0_io_f0_mask; // @[config-mixins.scala 673:25]
  wire [15:0] components_0_io_f1_ghist; // @[config-mixins.scala 673:25]
  wire  components_0_io_f1_lhist; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_0_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_0_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_0_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_0_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f1_0_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_1_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_1_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_1_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_1_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f1_1_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_2_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_2_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_2_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_2_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f1_2_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_3_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_3_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_3_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f1_3_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f1_3_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_0_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_0_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_0_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_0_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f2_0_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_1_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_1_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_1_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_1_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f2_1_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_2_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_2_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_2_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_2_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f2_2_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_3_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_3_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_3_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f2_3_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f2_3_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_0_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_0_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_0_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_0_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f3_0_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_1_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_1_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_1_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_1_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f3_1_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_2_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_2_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_2_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_2_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f3_2_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_3_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_3_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_3_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_in_0_f3_3_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_in_0_f3_3_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_0_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_0_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_0_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_0_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f1_0_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_1_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_1_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_1_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_1_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f1_1_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_2_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_2_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_2_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_2_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f1_2_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_3_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_3_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_3_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f1_3_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f1_3_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_0_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_0_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_0_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_0_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f2_0_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_1_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_1_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_1_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_1_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f2_1_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_2_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_2_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_2_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_2_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f2_2_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_3_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_3_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_3_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f2_3_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f2_3_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_0_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_0_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_0_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_0_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f3_0_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_1_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_1_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_1_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_1_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f3_1_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_2_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_2_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_2_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_2_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f3_2_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_3_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_3_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_3_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_resp_f3_3_predicted_pc_valid; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_resp_f3_3_predicted_pc_bits; // @[config-mixins.scala 673:25]
  wire [44:0] components_0_io_f3_meta; // @[config-mixins.scala 673:25]
  wire  components_0_io_f3_fire; // @[config-mixins.scala 673:25]
  wire  components_0_io_update_valid; // @[config-mixins.scala 673:25]
  wire  components_0_io_update_bits_is_mispredict_update; // @[config-mixins.scala 673:25]
  wire  components_0_io_update_bits_is_repair_update; // @[config-mixins.scala 673:25]
  wire [3:0] components_0_io_update_bits_btb_mispredicts; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_update_bits_pc; // @[config-mixins.scala 673:25]
  wire [3:0] components_0_io_update_bits_br_mask; // @[config-mixins.scala 673:25]
  wire  components_0_io_update_bits_cfi_idx_valid; // @[config-mixins.scala 673:25]
  wire [1:0] components_0_io_update_bits_cfi_idx_bits; // @[config-mixins.scala 673:25]
  wire  components_0_io_update_bits_cfi_taken; // @[config-mixins.scala 673:25]
  wire  components_0_io_update_bits_cfi_mispredicted; // @[config-mixins.scala 673:25]
  wire  components_0_io_update_bits_cfi_is_br; // @[config-mixins.scala 673:25]
  wire  components_0_io_update_bits_cfi_is_jal; // @[config-mixins.scala 673:25]
  wire  components_0_io_update_bits_cfi_is_jalr; // @[config-mixins.scala 673:25]
  wire [15:0] components_0_io_update_bits_ghist; // @[config-mixins.scala 673:25]
  wire  components_0_io_update_bits_lhist; // @[config-mixins.scala 673:25]
  wire [39:0] components_0_io_update_bits_target; // @[config-mixins.scala 673:25]
  wire [44:0] components_0_io_update_bits_meta; // @[config-mixins.scala 673:25]
  wire [8:0] _T_2 = {{1'd0}, components_0_io_f3_meta[7:0]}; // @[composer.scala 31:35]
  wire [9:0] _T_3 = {_T_2, 1'h0}; // @[composer.scala 31:22]
  wire [9:0] _GEN_0 = {{9'd0}, components_1_io_f3_meta[0]}; // @[composer.scala 31:35]
  wire [9:0] _T_5 = _T_3 | _GEN_0; // @[composer.scala 31:35]
  wire [41:0] _T_6 = {_T_5, 32'h0}; // @[composer.scala 31:22]
  wire [41:0] _GEN_1 = {{10'd0}, components_2_io_f3_meta[31:0]}; // @[composer.scala 31:35]
  wire [41:0] metas = _T_6 | _GEN_1; // @[composer.scala 31:35]
  TageBranchPredictorBank components_2 ( // @[config-mixins.scala 667:28]
    .clock(components_2_clock),
    .reset(components_2_reset),
    .io_f0_valid(components_2_io_f0_valid),
    .io_f0_pc(components_2_io_f0_pc),
    .io_f0_mask(components_2_io_f0_mask),
    .io_f1_ghist(components_2_io_f1_ghist),
    .io_f1_lhist(components_2_io_f1_lhist),
    .io_resp_in_0_f1_0_taken(components_2_io_resp_in_0_f1_0_taken),
    .io_resp_in_0_f1_0_is_br(components_2_io_resp_in_0_f1_0_is_br),
    .io_resp_in_0_f1_0_is_jal(components_2_io_resp_in_0_f1_0_is_jal),
    .io_resp_in_0_f1_0_predicted_pc_valid(components_2_io_resp_in_0_f1_0_predicted_pc_valid),
    .io_resp_in_0_f1_0_predicted_pc_bits(components_2_io_resp_in_0_f1_0_predicted_pc_bits),
    .io_resp_in_0_f1_1_taken(components_2_io_resp_in_0_f1_1_taken),
    .io_resp_in_0_f1_1_is_br(components_2_io_resp_in_0_f1_1_is_br),
    .io_resp_in_0_f1_1_is_jal(components_2_io_resp_in_0_f1_1_is_jal),
    .io_resp_in_0_f1_1_predicted_pc_valid(components_2_io_resp_in_0_f1_1_predicted_pc_valid),
    .io_resp_in_0_f1_1_predicted_pc_bits(components_2_io_resp_in_0_f1_1_predicted_pc_bits),
    .io_resp_in_0_f1_2_taken(components_2_io_resp_in_0_f1_2_taken),
    .io_resp_in_0_f1_2_is_br(components_2_io_resp_in_0_f1_2_is_br),
    .io_resp_in_0_f1_2_is_jal(components_2_io_resp_in_0_f1_2_is_jal),
    .io_resp_in_0_f1_2_predicted_pc_valid(components_2_io_resp_in_0_f1_2_predicted_pc_valid),
    .io_resp_in_0_f1_2_predicted_pc_bits(components_2_io_resp_in_0_f1_2_predicted_pc_bits),
    .io_resp_in_0_f1_3_taken(components_2_io_resp_in_0_f1_3_taken),
    .io_resp_in_0_f1_3_is_br(components_2_io_resp_in_0_f1_3_is_br),
    .io_resp_in_0_f1_3_is_jal(components_2_io_resp_in_0_f1_3_is_jal),
    .io_resp_in_0_f1_3_predicted_pc_valid(components_2_io_resp_in_0_f1_3_predicted_pc_valid),
    .io_resp_in_0_f1_3_predicted_pc_bits(components_2_io_resp_in_0_f1_3_predicted_pc_bits),
    .io_resp_in_0_f2_0_taken(components_2_io_resp_in_0_f2_0_taken),
    .io_resp_in_0_f2_0_is_br(components_2_io_resp_in_0_f2_0_is_br),
    .io_resp_in_0_f2_0_is_jal(components_2_io_resp_in_0_f2_0_is_jal),
    .io_resp_in_0_f2_0_predicted_pc_valid(components_2_io_resp_in_0_f2_0_predicted_pc_valid),
    .io_resp_in_0_f2_0_predicted_pc_bits(components_2_io_resp_in_0_f2_0_predicted_pc_bits),
    .io_resp_in_0_f2_1_taken(components_2_io_resp_in_0_f2_1_taken),
    .io_resp_in_0_f2_1_is_br(components_2_io_resp_in_0_f2_1_is_br),
    .io_resp_in_0_f2_1_is_jal(components_2_io_resp_in_0_f2_1_is_jal),
    .io_resp_in_0_f2_1_predicted_pc_valid(components_2_io_resp_in_0_f2_1_predicted_pc_valid),
    .io_resp_in_0_f2_1_predicted_pc_bits(components_2_io_resp_in_0_f2_1_predicted_pc_bits),
    .io_resp_in_0_f2_2_taken(components_2_io_resp_in_0_f2_2_taken),
    .io_resp_in_0_f2_2_is_br(components_2_io_resp_in_0_f2_2_is_br),
    .io_resp_in_0_f2_2_is_jal(components_2_io_resp_in_0_f2_2_is_jal),
    .io_resp_in_0_f2_2_predicted_pc_valid(components_2_io_resp_in_0_f2_2_predicted_pc_valid),
    .io_resp_in_0_f2_2_predicted_pc_bits(components_2_io_resp_in_0_f2_2_predicted_pc_bits),
    .io_resp_in_0_f2_3_taken(components_2_io_resp_in_0_f2_3_taken),
    .io_resp_in_0_f2_3_is_br(components_2_io_resp_in_0_f2_3_is_br),
    .io_resp_in_0_f2_3_is_jal(components_2_io_resp_in_0_f2_3_is_jal),
    .io_resp_in_0_f2_3_predicted_pc_valid(components_2_io_resp_in_0_f2_3_predicted_pc_valid),
    .io_resp_in_0_f2_3_predicted_pc_bits(components_2_io_resp_in_0_f2_3_predicted_pc_bits),
    .io_resp_in_0_f3_0_taken(components_2_io_resp_in_0_f3_0_taken),
    .io_resp_in_0_f3_0_is_br(components_2_io_resp_in_0_f3_0_is_br),
    .io_resp_in_0_f3_0_is_jal(components_2_io_resp_in_0_f3_0_is_jal),
    .io_resp_in_0_f3_0_predicted_pc_valid(components_2_io_resp_in_0_f3_0_predicted_pc_valid),
    .io_resp_in_0_f3_0_predicted_pc_bits(components_2_io_resp_in_0_f3_0_predicted_pc_bits),
    .io_resp_in_0_f3_1_taken(components_2_io_resp_in_0_f3_1_taken),
    .io_resp_in_0_f3_1_is_br(components_2_io_resp_in_0_f3_1_is_br),
    .io_resp_in_0_f3_1_is_jal(components_2_io_resp_in_0_f3_1_is_jal),
    .io_resp_in_0_f3_1_predicted_pc_valid(components_2_io_resp_in_0_f3_1_predicted_pc_valid),
    .io_resp_in_0_f3_1_predicted_pc_bits(components_2_io_resp_in_0_f3_1_predicted_pc_bits),
    .io_resp_in_0_f3_2_taken(components_2_io_resp_in_0_f3_2_taken),
    .io_resp_in_0_f3_2_is_br(components_2_io_resp_in_0_f3_2_is_br),
    .io_resp_in_0_f3_2_is_jal(components_2_io_resp_in_0_f3_2_is_jal),
    .io_resp_in_0_f3_2_predicted_pc_valid(components_2_io_resp_in_0_f3_2_predicted_pc_valid),
    .io_resp_in_0_f3_2_predicted_pc_bits(components_2_io_resp_in_0_f3_2_predicted_pc_bits),
    .io_resp_in_0_f3_3_taken(components_2_io_resp_in_0_f3_3_taken),
    .io_resp_in_0_f3_3_is_br(components_2_io_resp_in_0_f3_3_is_br),
    .io_resp_in_0_f3_3_is_jal(components_2_io_resp_in_0_f3_3_is_jal),
    .io_resp_in_0_f3_3_predicted_pc_valid(components_2_io_resp_in_0_f3_3_predicted_pc_valid),
    .io_resp_in_0_f3_3_predicted_pc_bits(components_2_io_resp_in_0_f3_3_predicted_pc_bits),
    .io_resp_f1_0_taken(components_2_io_resp_f1_0_taken),
    .io_resp_f1_0_is_br(components_2_io_resp_f1_0_is_br),
    .io_resp_f1_0_is_jal(components_2_io_resp_f1_0_is_jal),
    .io_resp_f1_0_predicted_pc_valid(components_2_io_resp_f1_0_predicted_pc_valid),
    .io_resp_f1_0_predicted_pc_bits(components_2_io_resp_f1_0_predicted_pc_bits),
    .io_resp_f1_1_taken(components_2_io_resp_f1_1_taken),
    .io_resp_f1_1_is_br(components_2_io_resp_f1_1_is_br),
    .io_resp_f1_1_is_jal(components_2_io_resp_f1_1_is_jal),
    .io_resp_f1_1_predicted_pc_valid(components_2_io_resp_f1_1_predicted_pc_valid),
    .io_resp_f1_1_predicted_pc_bits(components_2_io_resp_f1_1_predicted_pc_bits),
    .io_resp_f1_2_taken(components_2_io_resp_f1_2_taken),
    .io_resp_f1_2_is_br(components_2_io_resp_f1_2_is_br),
    .io_resp_f1_2_is_jal(components_2_io_resp_f1_2_is_jal),
    .io_resp_f1_2_predicted_pc_valid(components_2_io_resp_f1_2_predicted_pc_valid),
    .io_resp_f1_2_predicted_pc_bits(components_2_io_resp_f1_2_predicted_pc_bits),
    .io_resp_f1_3_taken(components_2_io_resp_f1_3_taken),
    .io_resp_f1_3_is_br(components_2_io_resp_f1_3_is_br),
    .io_resp_f1_3_is_jal(components_2_io_resp_f1_3_is_jal),
    .io_resp_f1_3_predicted_pc_valid(components_2_io_resp_f1_3_predicted_pc_valid),
    .io_resp_f1_3_predicted_pc_bits(components_2_io_resp_f1_3_predicted_pc_bits),
    .io_resp_f2_0_taken(components_2_io_resp_f2_0_taken),
    .io_resp_f2_0_is_br(components_2_io_resp_f2_0_is_br),
    .io_resp_f2_0_is_jal(components_2_io_resp_f2_0_is_jal),
    .io_resp_f2_0_predicted_pc_valid(components_2_io_resp_f2_0_predicted_pc_valid),
    .io_resp_f2_0_predicted_pc_bits(components_2_io_resp_f2_0_predicted_pc_bits),
    .io_resp_f2_1_taken(components_2_io_resp_f2_1_taken),
    .io_resp_f2_1_is_br(components_2_io_resp_f2_1_is_br),
    .io_resp_f2_1_is_jal(components_2_io_resp_f2_1_is_jal),
    .io_resp_f2_1_predicted_pc_valid(components_2_io_resp_f2_1_predicted_pc_valid),
    .io_resp_f2_1_predicted_pc_bits(components_2_io_resp_f2_1_predicted_pc_bits),
    .io_resp_f2_2_taken(components_2_io_resp_f2_2_taken),
    .io_resp_f2_2_is_br(components_2_io_resp_f2_2_is_br),
    .io_resp_f2_2_is_jal(components_2_io_resp_f2_2_is_jal),
    .io_resp_f2_2_predicted_pc_valid(components_2_io_resp_f2_2_predicted_pc_valid),
    .io_resp_f2_2_predicted_pc_bits(components_2_io_resp_f2_2_predicted_pc_bits),
    .io_resp_f2_3_taken(components_2_io_resp_f2_3_taken),
    .io_resp_f2_3_is_br(components_2_io_resp_f2_3_is_br),
    .io_resp_f2_3_is_jal(components_2_io_resp_f2_3_is_jal),
    .io_resp_f2_3_predicted_pc_valid(components_2_io_resp_f2_3_predicted_pc_valid),
    .io_resp_f2_3_predicted_pc_bits(components_2_io_resp_f2_3_predicted_pc_bits),
    .io_resp_f3_0_taken(components_2_io_resp_f3_0_taken),
    .io_resp_f3_0_is_br(components_2_io_resp_f3_0_is_br),
    .io_resp_f3_0_is_jal(components_2_io_resp_f3_0_is_jal),
    .io_resp_f3_0_predicted_pc_valid(components_2_io_resp_f3_0_predicted_pc_valid),
    .io_resp_f3_0_predicted_pc_bits(components_2_io_resp_f3_0_predicted_pc_bits),
    .io_resp_f3_1_taken(components_2_io_resp_f3_1_taken),
    .io_resp_f3_1_is_br(components_2_io_resp_f3_1_is_br),
    .io_resp_f3_1_is_jal(components_2_io_resp_f3_1_is_jal),
    .io_resp_f3_1_predicted_pc_valid(components_2_io_resp_f3_1_predicted_pc_valid),
    .io_resp_f3_1_predicted_pc_bits(components_2_io_resp_f3_1_predicted_pc_bits),
    .io_resp_f3_2_taken(components_2_io_resp_f3_2_taken),
    .io_resp_f3_2_is_br(components_2_io_resp_f3_2_is_br),
    .io_resp_f3_2_is_jal(components_2_io_resp_f3_2_is_jal),
    .io_resp_f3_2_predicted_pc_valid(components_2_io_resp_f3_2_predicted_pc_valid),
    .io_resp_f3_2_predicted_pc_bits(components_2_io_resp_f3_2_predicted_pc_bits),
    .io_resp_f3_3_taken(components_2_io_resp_f3_3_taken),
    .io_resp_f3_3_is_br(components_2_io_resp_f3_3_is_br),
    .io_resp_f3_3_is_jal(components_2_io_resp_f3_3_is_jal),
    .io_resp_f3_3_predicted_pc_valid(components_2_io_resp_f3_3_predicted_pc_valid),
    .io_resp_f3_3_predicted_pc_bits(components_2_io_resp_f3_3_predicted_pc_bits),
    .io_f3_meta(components_2_io_f3_meta),
    .io_f3_fire(components_2_io_f3_fire),
    .io_update_valid(components_2_io_update_valid),
    .io_update_bits_is_mispredict_update(components_2_io_update_bits_is_mispredict_update),
    .io_update_bits_is_repair_update(components_2_io_update_bits_is_repair_update),
    .io_update_bits_btb_mispredicts(components_2_io_update_bits_btb_mispredicts),
    .io_update_bits_pc(components_2_io_update_bits_pc),
    .io_update_bits_br_mask(components_2_io_update_bits_br_mask),
    .io_update_bits_cfi_idx_valid(components_2_io_update_bits_cfi_idx_valid),
    .io_update_bits_cfi_idx_bits(components_2_io_update_bits_cfi_idx_bits),
    .io_update_bits_cfi_taken(components_2_io_update_bits_cfi_taken),
    .io_update_bits_cfi_mispredicted(components_2_io_update_bits_cfi_mispredicted),
    .io_update_bits_cfi_is_br(components_2_io_update_bits_cfi_is_br),
    .io_update_bits_cfi_is_jal(components_2_io_update_bits_cfi_is_jal),
    .io_update_bits_cfi_is_jalr(components_2_io_update_bits_cfi_is_jalr),
    .io_update_bits_ghist(components_2_io_update_bits_ghist),
    .io_update_bits_lhist(components_2_io_update_bits_lhist),
    .io_update_bits_target(components_2_io_update_bits_target),
    .io_update_bits_meta(components_2_io_update_bits_meta)
  );
  BTBBranchPredictorBank components_1 ( // @[config-mixins.scala 670:25]
    .clock(components_1_clock),
    .reset(components_1_reset),
    .io_f0_valid(components_1_io_f0_valid),
    .io_f0_pc(components_1_io_f0_pc),
    .io_f0_mask(components_1_io_f0_mask),
    .io_f1_ghist(components_1_io_f1_ghist),
    .io_f1_lhist(components_1_io_f1_lhist),
    .io_resp_in_0_f1_0_taken(components_1_io_resp_in_0_f1_0_taken),
    .io_resp_in_0_f1_0_is_br(components_1_io_resp_in_0_f1_0_is_br),
    .io_resp_in_0_f1_0_is_jal(components_1_io_resp_in_0_f1_0_is_jal),
    .io_resp_in_0_f1_0_predicted_pc_valid(components_1_io_resp_in_0_f1_0_predicted_pc_valid),
    .io_resp_in_0_f1_0_predicted_pc_bits(components_1_io_resp_in_0_f1_0_predicted_pc_bits),
    .io_resp_in_0_f1_1_taken(components_1_io_resp_in_0_f1_1_taken),
    .io_resp_in_0_f1_1_is_br(components_1_io_resp_in_0_f1_1_is_br),
    .io_resp_in_0_f1_1_is_jal(components_1_io_resp_in_0_f1_1_is_jal),
    .io_resp_in_0_f1_1_predicted_pc_valid(components_1_io_resp_in_0_f1_1_predicted_pc_valid),
    .io_resp_in_0_f1_1_predicted_pc_bits(components_1_io_resp_in_0_f1_1_predicted_pc_bits),
    .io_resp_in_0_f1_2_taken(components_1_io_resp_in_0_f1_2_taken),
    .io_resp_in_0_f1_2_is_br(components_1_io_resp_in_0_f1_2_is_br),
    .io_resp_in_0_f1_2_is_jal(components_1_io_resp_in_0_f1_2_is_jal),
    .io_resp_in_0_f1_2_predicted_pc_valid(components_1_io_resp_in_0_f1_2_predicted_pc_valid),
    .io_resp_in_0_f1_2_predicted_pc_bits(components_1_io_resp_in_0_f1_2_predicted_pc_bits),
    .io_resp_in_0_f1_3_taken(components_1_io_resp_in_0_f1_3_taken),
    .io_resp_in_0_f1_3_is_br(components_1_io_resp_in_0_f1_3_is_br),
    .io_resp_in_0_f1_3_is_jal(components_1_io_resp_in_0_f1_3_is_jal),
    .io_resp_in_0_f1_3_predicted_pc_valid(components_1_io_resp_in_0_f1_3_predicted_pc_valid),
    .io_resp_in_0_f1_3_predicted_pc_bits(components_1_io_resp_in_0_f1_3_predicted_pc_bits),
    .io_resp_in_0_f2_0_taken(components_1_io_resp_in_0_f2_0_taken),
    .io_resp_in_0_f2_0_is_br(components_1_io_resp_in_0_f2_0_is_br),
    .io_resp_in_0_f2_0_is_jal(components_1_io_resp_in_0_f2_0_is_jal),
    .io_resp_in_0_f2_0_predicted_pc_valid(components_1_io_resp_in_0_f2_0_predicted_pc_valid),
    .io_resp_in_0_f2_0_predicted_pc_bits(components_1_io_resp_in_0_f2_0_predicted_pc_bits),
    .io_resp_in_0_f2_1_taken(components_1_io_resp_in_0_f2_1_taken),
    .io_resp_in_0_f2_1_is_br(components_1_io_resp_in_0_f2_1_is_br),
    .io_resp_in_0_f2_1_is_jal(components_1_io_resp_in_0_f2_1_is_jal),
    .io_resp_in_0_f2_1_predicted_pc_valid(components_1_io_resp_in_0_f2_1_predicted_pc_valid),
    .io_resp_in_0_f2_1_predicted_pc_bits(components_1_io_resp_in_0_f2_1_predicted_pc_bits),
    .io_resp_in_0_f2_2_taken(components_1_io_resp_in_0_f2_2_taken),
    .io_resp_in_0_f2_2_is_br(components_1_io_resp_in_0_f2_2_is_br),
    .io_resp_in_0_f2_2_is_jal(components_1_io_resp_in_0_f2_2_is_jal),
    .io_resp_in_0_f2_2_predicted_pc_valid(components_1_io_resp_in_0_f2_2_predicted_pc_valid),
    .io_resp_in_0_f2_2_predicted_pc_bits(components_1_io_resp_in_0_f2_2_predicted_pc_bits),
    .io_resp_in_0_f2_3_taken(components_1_io_resp_in_0_f2_3_taken),
    .io_resp_in_0_f2_3_is_br(components_1_io_resp_in_0_f2_3_is_br),
    .io_resp_in_0_f2_3_is_jal(components_1_io_resp_in_0_f2_3_is_jal),
    .io_resp_in_0_f2_3_predicted_pc_valid(components_1_io_resp_in_0_f2_3_predicted_pc_valid),
    .io_resp_in_0_f2_3_predicted_pc_bits(components_1_io_resp_in_0_f2_3_predicted_pc_bits),
    .io_resp_in_0_f3_0_taken(components_1_io_resp_in_0_f3_0_taken),
    .io_resp_in_0_f3_0_is_br(components_1_io_resp_in_0_f3_0_is_br),
    .io_resp_in_0_f3_0_is_jal(components_1_io_resp_in_0_f3_0_is_jal),
    .io_resp_in_0_f3_0_predicted_pc_valid(components_1_io_resp_in_0_f3_0_predicted_pc_valid),
    .io_resp_in_0_f3_0_predicted_pc_bits(components_1_io_resp_in_0_f3_0_predicted_pc_bits),
    .io_resp_in_0_f3_1_taken(components_1_io_resp_in_0_f3_1_taken),
    .io_resp_in_0_f3_1_is_br(components_1_io_resp_in_0_f3_1_is_br),
    .io_resp_in_0_f3_1_is_jal(components_1_io_resp_in_0_f3_1_is_jal),
    .io_resp_in_0_f3_1_predicted_pc_valid(components_1_io_resp_in_0_f3_1_predicted_pc_valid),
    .io_resp_in_0_f3_1_predicted_pc_bits(components_1_io_resp_in_0_f3_1_predicted_pc_bits),
    .io_resp_in_0_f3_2_taken(components_1_io_resp_in_0_f3_2_taken),
    .io_resp_in_0_f3_2_is_br(components_1_io_resp_in_0_f3_2_is_br),
    .io_resp_in_0_f3_2_is_jal(components_1_io_resp_in_0_f3_2_is_jal),
    .io_resp_in_0_f3_2_predicted_pc_valid(components_1_io_resp_in_0_f3_2_predicted_pc_valid),
    .io_resp_in_0_f3_2_predicted_pc_bits(components_1_io_resp_in_0_f3_2_predicted_pc_bits),
    .io_resp_in_0_f3_3_taken(components_1_io_resp_in_0_f3_3_taken),
    .io_resp_in_0_f3_3_is_br(components_1_io_resp_in_0_f3_3_is_br),
    .io_resp_in_0_f3_3_is_jal(components_1_io_resp_in_0_f3_3_is_jal),
    .io_resp_in_0_f3_3_predicted_pc_valid(components_1_io_resp_in_0_f3_3_predicted_pc_valid),
    .io_resp_in_0_f3_3_predicted_pc_bits(components_1_io_resp_in_0_f3_3_predicted_pc_bits),
    .io_resp_f1_0_taken(components_1_io_resp_f1_0_taken),
    .io_resp_f1_0_is_br(components_1_io_resp_f1_0_is_br),
    .io_resp_f1_0_is_jal(components_1_io_resp_f1_0_is_jal),
    .io_resp_f1_0_predicted_pc_valid(components_1_io_resp_f1_0_predicted_pc_valid),
    .io_resp_f1_0_predicted_pc_bits(components_1_io_resp_f1_0_predicted_pc_bits),
    .io_resp_f1_1_taken(components_1_io_resp_f1_1_taken),
    .io_resp_f1_1_is_br(components_1_io_resp_f1_1_is_br),
    .io_resp_f1_1_is_jal(components_1_io_resp_f1_1_is_jal),
    .io_resp_f1_1_predicted_pc_valid(components_1_io_resp_f1_1_predicted_pc_valid),
    .io_resp_f1_1_predicted_pc_bits(components_1_io_resp_f1_1_predicted_pc_bits),
    .io_resp_f1_2_taken(components_1_io_resp_f1_2_taken),
    .io_resp_f1_2_is_br(components_1_io_resp_f1_2_is_br),
    .io_resp_f1_2_is_jal(components_1_io_resp_f1_2_is_jal),
    .io_resp_f1_2_predicted_pc_valid(components_1_io_resp_f1_2_predicted_pc_valid),
    .io_resp_f1_2_predicted_pc_bits(components_1_io_resp_f1_2_predicted_pc_bits),
    .io_resp_f1_3_taken(components_1_io_resp_f1_3_taken),
    .io_resp_f1_3_is_br(components_1_io_resp_f1_3_is_br),
    .io_resp_f1_3_is_jal(components_1_io_resp_f1_3_is_jal),
    .io_resp_f1_3_predicted_pc_valid(components_1_io_resp_f1_3_predicted_pc_valid),
    .io_resp_f1_3_predicted_pc_bits(components_1_io_resp_f1_3_predicted_pc_bits),
    .io_resp_f2_0_taken(components_1_io_resp_f2_0_taken),
    .io_resp_f2_0_is_br(components_1_io_resp_f2_0_is_br),
    .io_resp_f2_0_is_jal(components_1_io_resp_f2_0_is_jal),
    .io_resp_f2_0_predicted_pc_valid(components_1_io_resp_f2_0_predicted_pc_valid),
    .io_resp_f2_0_predicted_pc_bits(components_1_io_resp_f2_0_predicted_pc_bits),
    .io_resp_f2_1_taken(components_1_io_resp_f2_1_taken),
    .io_resp_f2_1_is_br(components_1_io_resp_f2_1_is_br),
    .io_resp_f2_1_is_jal(components_1_io_resp_f2_1_is_jal),
    .io_resp_f2_1_predicted_pc_valid(components_1_io_resp_f2_1_predicted_pc_valid),
    .io_resp_f2_1_predicted_pc_bits(components_1_io_resp_f2_1_predicted_pc_bits),
    .io_resp_f2_2_taken(components_1_io_resp_f2_2_taken),
    .io_resp_f2_2_is_br(components_1_io_resp_f2_2_is_br),
    .io_resp_f2_2_is_jal(components_1_io_resp_f2_2_is_jal),
    .io_resp_f2_2_predicted_pc_valid(components_1_io_resp_f2_2_predicted_pc_valid),
    .io_resp_f2_2_predicted_pc_bits(components_1_io_resp_f2_2_predicted_pc_bits),
    .io_resp_f2_3_taken(components_1_io_resp_f2_3_taken),
    .io_resp_f2_3_is_br(components_1_io_resp_f2_3_is_br),
    .io_resp_f2_3_is_jal(components_1_io_resp_f2_3_is_jal),
    .io_resp_f2_3_predicted_pc_valid(components_1_io_resp_f2_3_predicted_pc_valid),
    .io_resp_f2_3_predicted_pc_bits(components_1_io_resp_f2_3_predicted_pc_bits),
    .io_resp_f3_0_taken(components_1_io_resp_f3_0_taken),
    .io_resp_f3_0_is_br(components_1_io_resp_f3_0_is_br),
    .io_resp_f3_0_is_jal(components_1_io_resp_f3_0_is_jal),
    .io_resp_f3_0_predicted_pc_valid(components_1_io_resp_f3_0_predicted_pc_valid),
    .io_resp_f3_0_predicted_pc_bits(components_1_io_resp_f3_0_predicted_pc_bits),
    .io_resp_f3_1_taken(components_1_io_resp_f3_1_taken),
    .io_resp_f3_1_is_br(components_1_io_resp_f3_1_is_br),
    .io_resp_f3_1_is_jal(components_1_io_resp_f3_1_is_jal),
    .io_resp_f3_1_predicted_pc_valid(components_1_io_resp_f3_1_predicted_pc_valid),
    .io_resp_f3_1_predicted_pc_bits(components_1_io_resp_f3_1_predicted_pc_bits),
    .io_resp_f3_2_taken(components_1_io_resp_f3_2_taken),
    .io_resp_f3_2_is_br(components_1_io_resp_f3_2_is_br),
    .io_resp_f3_2_is_jal(components_1_io_resp_f3_2_is_jal),
    .io_resp_f3_2_predicted_pc_valid(components_1_io_resp_f3_2_predicted_pc_valid),
    .io_resp_f3_2_predicted_pc_bits(components_1_io_resp_f3_2_predicted_pc_bits),
    .io_resp_f3_3_taken(components_1_io_resp_f3_3_taken),
    .io_resp_f3_3_is_br(components_1_io_resp_f3_3_is_br),
    .io_resp_f3_3_is_jal(components_1_io_resp_f3_3_is_jal),
    .io_resp_f3_3_predicted_pc_valid(components_1_io_resp_f3_3_predicted_pc_valid),
    .io_resp_f3_3_predicted_pc_bits(components_1_io_resp_f3_3_predicted_pc_bits),
    .io_f3_meta(components_1_io_f3_meta),
    .io_f3_fire(components_1_io_f3_fire),
    .io_update_valid(components_1_io_update_valid),
    .io_update_bits_is_mispredict_update(components_1_io_update_bits_is_mispredict_update),
    .io_update_bits_is_repair_update(components_1_io_update_bits_is_repair_update),
    .io_update_bits_btb_mispredicts(components_1_io_update_bits_btb_mispredicts),
    .io_update_bits_pc(components_1_io_update_bits_pc),
    .io_update_bits_br_mask(components_1_io_update_bits_br_mask),
    .io_update_bits_cfi_idx_valid(components_1_io_update_bits_cfi_idx_valid),
    .io_update_bits_cfi_idx_bits(components_1_io_update_bits_cfi_idx_bits),
    .io_update_bits_cfi_taken(components_1_io_update_bits_cfi_taken),
    .io_update_bits_cfi_mispredicted(components_1_io_update_bits_cfi_mispredicted),
    .io_update_bits_cfi_is_br(components_1_io_update_bits_cfi_is_br),
    .io_update_bits_cfi_is_jal(components_1_io_update_bits_cfi_is_jal),
    .io_update_bits_cfi_is_jalr(components_1_io_update_bits_cfi_is_jalr),
    .io_update_bits_ghist(components_1_io_update_bits_ghist),
    .io_update_bits_lhist(components_1_io_update_bits_lhist),
    .io_update_bits_target(components_1_io_update_bits_target),
    .io_update_bits_meta(components_1_io_update_bits_meta)
  );
  BIMBranchPredictorBank components_0 ( // @[config-mixins.scala 673:25]
    .clock(components_0_clock),
    .reset(components_0_reset),
    .io_f0_valid(components_0_io_f0_valid),
    .io_f0_pc(components_0_io_f0_pc),
    .io_f0_mask(components_0_io_f0_mask),
    .io_f1_ghist(components_0_io_f1_ghist),
    .io_f1_lhist(components_0_io_f1_lhist),
    .io_resp_in_0_f1_0_taken(components_0_io_resp_in_0_f1_0_taken),
    .io_resp_in_0_f1_0_is_br(components_0_io_resp_in_0_f1_0_is_br),
    .io_resp_in_0_f1_0_is_jal(components_0_io_resp_in_0_f1_0_is_jal),
    .io_resp_in_0_f1_0_predicted_pc_valid(components_0_io_resp_in_0_f1_0_predicted_pc_valid),
    .io_resp_in_0_f1_0_predicted_pc_bits(components_0_io_resp_in_0_f1_0_predicted_pc_bits),
    .io_resp_in_0_f1_1_taken(components_0_io_resp_in_0_f1_1_taken),
    .io_resp_in_0_f1_1_is_br(components_0_io_resp_in_0_f1_1_is_br),
    .io_resp_in_0_f1_1_is_jal(components_0_io_resp_in_0_f1_1_is_jal),
    .io_resp_in_0_f1_1_predicted_pc_valid(components_0_io_resp_in_0_f1_1_predicted_pc_valid),
    .io_resp_in_0_f1_1_predicted_pc_bits(components_0_io_resp_in_0_f1_1_predicted_pc_bits),
    .io_resp_in_0_f1_2_taken(components_0_io_resp_in_0_f1_2_taken),
    .io_resp_in_0_f1_2_is_br(components_0_io_resp_in_0_f1_2_is_br),
    .io_resp_in_0_f1_2_is_jal(components_0_io_resp_in_0_f1_2_is_jal),
    .io_resp_in_0_f1_2_predicted_pc_valid(components_0_io_resp_in_0_f1_2_predicted_pc_valid),
    .io_resp_in_0_f1_2_predicted_pc_bits(components_0_io_resp_in_0_f1_2_predicted_pc_bits),
    .io_resp_in_0_f1_3_taken(components_0_io_resp_in_0_f1_3_taken),
    .io_resp_in_0_f1_3_is_br(components_0_io_resp_in_0_f1_3_is_br),
    .io_resp_in_0_f1_3_is_jal(components_0_io_resp_in_0_f1_3_is_jal),
    .io_resp_in_0_f1_3_predicted_pc_valid(components_0_io_resp_in_0_f1_3_predicted_pc_valid),
    .io_resp_in_0_f1_3_predicted_pc_bits(components_0_io_resp_in_0_f1_3_predicted_pc_bits),
    .io_resp_in_0_f2_0_taken(components_0_io_resp_in_0_f2_0_taken),
    .io_resp_in_0_f2_0_is_br(components_0_io_resp_in_0_f2_0_is_br),
    .io_resp_in_0_f2_0_is_jal(components_0_io_resp_in_0_f2_0_is_jal),
    .io_resp_in_0_f2_0_predicted_pc_valid(components_0_io_resp_in_0_f2_0_predicted_pc_valid),
    .io_resp_in_0_f2_0_predicted_pc_bits(components_0_io_resp_in_0_f2_0_predicted_pc_bits),
    .io_resp_in_0_f2_1_taken(components_0_io_resp_in_0_f2_1_taken),
    .io_resp_in_0_f2_1_is_br(components_0_io_resp_in_0_f2_1_is_br),
    .io_resp_in_0_f2_1_is_jal(components_0_io_resp_in_0_f2_1_is_jal),
    .io_resp_in_0_f2_1_predicted_pc_valid(components_0_io_resp_in_0_f2_1_predicted_pc_valid),
    .io_resp_in_0_f2_1_predicted_pc_bits(components_0_io_resp_in_0_f2_1_predicted_pc_bits),
    .io_resp_in_0_f2_2_taken(components_0_io_resp_in_0_f2_2_taken),
    .io_resp_in_0_f2_2_is_br(components_0_io_resp_in_0_f2_2_is_br),
    .io_resp_in_0_f2_2_is_jal(components_0_io_resp_in_0_f2_2_is_jal),
    .io_resp_in_0_f2_2_predicted_pc_valid(components_0_io_resp_in_0_f2_2_predicted_pc_valid),
    .io_resp_in_0_f2_2_predicted_pc_bits(components_0_io_resp_in_0_f2_2_predicted_pc_bits),
    .io_resp_in_0_f2_3_taken(components_0_io_resp_in_0_f2_3_taken),
    .io_resp_in_0_f2_3_is_br(components_0_io_resp_in_0_f2_3_is_br),
    .io_resp_in_0_f2_3_is_jal(components_0_io_resp_in_0_f2_3_is_jal),
    .io_resp_in_0_f2_3_predicted_pc_valid(components_0_io_resp_in_0_f2_3_predicted_pc_valid),
    .io_resp_in_0_f2_3_predicted_pc_bits(components_0_io_resp_in_0_f2_3_predicted_pc_bits),
    .io_resp_in_0_f3_0_taken(components_0_io_resp_in_0_f3_0_taken),
    .io_resp_in_0_f3_0_is_br(components_0_io_resp_in_0_f3_0_is_br),
    .io_resp_in_0_f3_0_is_jal(components_0_io_resp_in_0_f3_0_is_jal),
    .io_resp_in_0_f3_0_predicted_pc_valid(components_0_io_resp_in_0_f3_0_predicted_pc_valid),
    .io_resp_in_0_f3_0_predicted_pc_bits(components_0_io_resp_in_0_f3_0_predicted_pc_bits),
    .io_resp_in_0_f3_1_taken(components_0_io_resp_in_0_f3_1_taken),
    .io_resp_in_0_f3_1_is_br(components_0_io_resp_in_0_f3_1_is_br),
    .io_resp_in_0_f3_1_is_jal(components_0_io_resp_in_0_f3_1_is_jal),
    .io_resp_in_0_f3_1_predicted_pc_valid(components_0_io_resp_in_0_f3_1_predicted_pc_valid),
    .io_resp_in_0_f3_1_predicted_pc_bits(components_0_io_resp_in_0_f3_1_predicted_pc_bits),
    .io_resp_in_0_f3_2_taken(components_0_io_resp_in_0_f3_2_taken),
    .io_resp_in_0_f3_2_is_br(components_0_io_resp_in_0_f3_2_is_br),
    .io_resp_in_0_f3_2_is_jal(components_0_io_resp_in_0_f3_2_is_jal),
    .io_resp_in_0_f3_2_predicted_pc_valid(components_0_io_resp_in_0_f3_2_predicted_pc_valid),
    .io_resp_in_0_f3_2_predicted_pc_bits(components_0_io_resp_in_0_f3_2_predicted_pc_bits),
    .io_resp_in_0_f3_3_taken(components_0_io_resp_in_0_f3_3_taken),
    .io_resp_in_0_f3_3_is_br(components_0_io_resp_in_0_f3_3_is_br),
    .io_resp_in_0_f3_3_is_jal(components_0_io_resp_in_0_f3_3_is_jal),
    .io_resp_in_0_f3_3_predicted_pc_valid(components_0_io_resp_in_0_f3_3_predicted_pc_valid),
    .io_resp_in_0_f3_3_predicted_pc_bits(components_0_io_resp_in_0_f3_3_predicted_pc_bits),
    .io_resp_f1_0_taken(components_0_io_resp_f1_0_taken),
    .io_resp_f1_0_is_br(components_0_io_resp_f1_0_is_br),
    .io_resp_f1_0_is_jal(components_0_io_resp_f1_0_is_jal),
    .io_resp_f1_0_predicted_pc_valid(components_0_io_resp_f1_0_predicted_pc_valid),
    .io_resp_f1_0_predicted_pc_bits(components_0_io_resp_f1_0_predicted_pc_bits),
    .io_resp_f1_1_taken(components_0_io_resp_f1_1_taken),
    .io_resp_f1_1_is_br(components_0_io_resp_f1_1_is_br),
    .io_resp_f1_1_is_jal(components_0_io_resp_f1_1_is_jal),
    .io_resp_f1_1_predicted_pc_valid(components_0_io_resp_f1_1_predicted_pc_valid),
    .io_resp_f1_1_predicted_pc_bits(components_0_io_resp_f1_1_predicted_pc_bits),
    .io_resp_f1_2_taken(components_0_io_resp_f1_2_taken),
    .io_resp_f1_2_is_br(components_0_io_resp_f1_2_is_br),
    .io_resp_f1_2_is_jal(components_0_io_resp_f1_2_is_jal),
    .io_resp_f1_2_predicted_pc_valid(components_0_io_resp_f1_2_predicted_pc_valid),
    .io_resp_f1_2_predicted_pc_bits(components_0_io_resp_f1_2_predicted_pc_bits),
    .io_resp_f1_3_taken(components_0_io_resp_f1_3_taken),
    .io_resp_f1_3_is_br(components_0_io_resp_f1_3_is_br),
    .io_resp_f1_3_is_jal(components_0_io_resp_f1_3_is_jal),
    .io_resp_f1_3_predicted_pc_valid(components_0_io_resp_f1_3_predicted_pc_valid),
    .io_resp_f1_3_predicted_pc_bits(components_0_io_resp_f1_3_predicted_pc_bits),
    .io_resp_f2_0_taken(components_0_io_resp_f2_0_taken),
    .io_resp_f2_0_is_br(components_0_io_resp_f2_0_is_br),
    .io_resp_f2_0_is_jal(components_0_io_resp_f2_0_is_jal),
    .io_resp_f2_0_predicted_pc_valid(components_0_io_resp_f2_0_predicted_pc_valid),
    .io_resp_f2_0_predicted_pc_bits(components_0_io_resp_f2_0_predicted_pc_bits),
    .io_resp_f2_1_taken(components_0_io_resp_f2_1_taken),
    .io_resp_f2_1_is_br(components_0_io_resp_f2_1_is_br),
    .io_resp_f2_1_is_jal(components_0_io_resp_f2_1_is_jal),
    .io_resp_f2_1_predicted_pc_valid(components_0_io_resp_f2_1_predicted_pc_valid),
    .io_resp_f2_1_predicted_pc_bits(components_0_io_resp_f2_1_predicted_pc_bits),
    .io_resp_f2_2_taken(components_0_io_resp_f2_2_taken),
    .io_resp_f2_2_is_br(components_0_io_resp_f2_2_is_br),
    .io_resp_f2_2_is_jal(components_0_io_resp_f2_2_is_jal),
    .io_resp_f2_2_predicted_pc_valid(components_0_io_resp_f2_2_predicted_pc_valid),
    .io_resp_f2_2_predicted_pc_bits(components_0_io_resp_f2_2_predicted_pc_bits),
    .io_resp_f2_3_taken(components_0_io_resp_f2_3_taken),
    .io_resp_f2_3_is_br(components_0_io_resp_f2_3_is_br),
    .io_resp_f2_3_is_jal(components_0_io_resp_f2_3_is_jal),
    .io_resp_f2_3_predicted_pc_valid(components_0_io_resp_f2_3_predicted_pc_valid),
    .io_resp_f2_3_predicted_pc_bits(components_0_io_resp_f2_3_predicted_pc_bits),
    .io_resp_f3_0_taken(components_0_io_resp_f3_0_taken),
    .io_resp_f3_0_is_br(components_0_io_resp_f3_0_is_br),
    .io_resp_f3_0_is_jal(components_0_io_resp_f3_0_is_jal),
    .io_resp_f3_0_predicted_pc_valid(components_0_io_resp_f3_0_predicted_pc_valid),
    .io_resp_f3_0_predicted_pc_bits(components_0_io_resp_f3_0_predicted_pc_bits),
    .io_resp_f3_1_taken(components_0_io_resp_f3_1_taken),
    .io_resp_f3_1_is_br(components_0_io_resp_f3_1_is_br),
    .io_resp_f3_1_is_jal(components_0_io_resp_f3_1_is_jal),
    .io_resp_f3_1_predicted_pc_valid(components_0_io_resp_f3_1_predicted_pc_valid),
    .io_resp_f3_1_predicted_pc_bits(components_0_io_resp_f3_1_predicted_pc_bits),
    .io_resp_f3_2_taken(components_0_io_resp_f3_2_taken),
    .io_resp_f3_2_is_br(components_0_io_resp_f3_2_is_br),
    .io_resp_f3_2_is_jal(components_0_io_resp_f3_2_is_jal),
    .io_resp_f3_2_predicted_pc_valid(components_0_io_resp_f3_2_predicted_pc_valid),
    .io_resp_f3_2_predicted_pc_bits(components_0_io_resp_f3_2_predicted_pc_bits),
    .io_resp_f3_3_taken(components_0_io_resp_f3_3_taken),
    .io_resp_f3_3_is_br(components_0_io_resp_f3_3_is_br),
    .io_resp_f3_3_is_jal(components_0_io_resp_f3_3_is_jal),
    .io_resp_f3_3_predicted_pc_valid(components_0_io_resp_f3_3_predicted_pc_valid),
    .io_resp_f3_3_predicted_pc_bits(components_0_io_resp_f3_3_predicted_pc_bits),
    .io_f3_meta(components_0_io_f3_meta),
    .io_f3_fire(components_0_io_f3_fire),
    .io_update_valid(components_0_io_update_valid),
    .io_update_bits_is_mispredict_update(components_0_io_update_bits_is_mispredict_update),
    .io_update_bits_is_repair_update(components_0_io_update_bits_is_repair_update),
    .io_update_bits_btb_mispredicts(components_0_io_update_bits_btb_mispredicts),
    .io_update_bits_pc(components_0_io_update_bits_pc),
    .io_update_bits_br_mask(components_0_io_update_bits_br_mask),
    .io_update_bits_cfi_idx_valid(components_0_io_update_bits_cfi_idx_valid),
    .io_update_bits_cfi_idx_bits(components_0_io_update_bits_cfi_idx_bits),
    .io_update_bits_cfi_taken(components_0_io_update_bits_cfi_taken),
    .io_update_bits_cfi_mispredicted(components_0_io_update_bits_cfi_mispredicted),
    .io_update_bits_cfi_is_br(components_0_io_update_bits_cfi_is_br),
    .io_update_bits_cfi_is_jal(components_0_io_update_bits_cfi_is_jal),
    .io_update_bits_cfi_is_jalr(components_0_io_update_bits_cfi_is_jalr),
    .io_update_bits_ghist(components_0_io_update_bits_ghist),
    .io_update_bits_lhist(components_0_io_update_bits_lhist),
    .io_update_bits_target(components_0_io_update_bits_target),
    .io_update_bits_meta(components_0_io_update_bits_meta)
  );
  assign io_resp_f1_0_taken = components_2_io_resp_f1_0_taken; // @[composer.scala 18:11]
  assign io_resp_f1_0_is_br = components_2_io_resp_f1_0_is_br; // @[composer.scala 18:11]
  assign io_resp_f1_0_is_jal = components_2_io_resp_f1_0_is_jal; // @[composer.scala 18:11]
  assign io_resp_f1_0_predicted_pc_valid = components_2_io_resp_f1_0_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f1_0_predicted_pc_bits = components_2_io_resp_f1_0_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_resp_f1_1_taken = components_2_io_resp_f1_1_taken; // @[composer.scala 18:11]
  assign io_resp_f1_1_is_br = components_2_io_resp_f1_1_is_br; // @[composer.scala 18:11]
  assign io_resp_f1_1_is_jal = components_2_io_resp_f1_1_is_jal; // @[composer.scala 18:11]
  assign io_resp_f1_1_predicted_pc_valid = components_2_io_resp_f1_1_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f1_1_predicted_pc_bits = components_2_io_resp_f1_1_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_resp_f1_2_taken = components_2_io_resp_f1_2_taken; // @[composer.scala 18:11]
  assign io_resp_f1_2_is_br = components_2_io_resp_f1_2_is_br; // @[composer.scala 18:11]
  assign io_resp_f1_2_is_jal = components_2_io_resp_f1_2_is_jal; // @[composer.scala 18:11]
  assign io_resp_f1_2_predicted_pc_valid = components_2_io_resp_f1_2_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f1_2_predicted_pc_bits = components_2_io_resp_f1_2_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_resp_f1_3_taken = components_2_io_resp_f1_3_taken; // @[composer.scala 18:11]
  assign io_resp_f1_3_is_br = components_2_io_resp_f1_3_is_br; // @[composer.scala 18:11]
  assign io_resp_f1_3_is_jal = components_2_io_resp_f1_3_is_jal; // @[composer.scala 18:11]
  assign io_resp_f1_3_predicted_pc_valid = components_2_io_resp_f1_3_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f1_3_predicted_pc_bits = components_2_io_resp_f1_3_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_resp_f2_0_taken = components_2_io_resp_f2_0_taken; // @[composer.scala 18:11]
  assign io_resp_f2_0_is_br = components_2_io_resp_f2_0_is_br; // @[composer.scala 18:11]
  assign io_resp_f2_0_is_jal = components_2_io_resp_f2_0_is_jal; // @[composer.scala 18:11]
  assign io_resp_f2_0_predicted_pc_valid = components_2_io_resp_f2_0_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f2_0_predicted_pc_bits = components_2_io_resp_f2_0_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_resp_f2_1_taken = components_2_io_resp_f2_1_taken; // @[composer.scala 18:11]
  assign io_resp_f2_1_is_br = components_2_io_resp_f2_1_is_br; // @[composer.scala 18:11]
  assign io_resp_f2_1_is_jal = components_2_io_resp_f2_1_is_jal; // @[composer.scala 18:11]
  assign io_resp_f2_1_predicted_pc_valid = components_2_io_resp_f2_1_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f2_1_predicted_pc_bits = components_2_io_resp_f2_1_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_resp_f2_2_taken = components_2_io_resp_f2_2_taken; // @[composer.scala 18:11]
  assign io_resp_f2_2_is_br = components_2_io_resp_f2_2_is_br; // @[composer.scala 18:11]
  assign io_resp_f2_2_is_jal = components_2_io_resp_f2_2_is_jal; // @[composer.scala 18:11]
  assign io_resp_f2_2_predicted_pc_valid = components_2_io_resp_f2_2_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f2_2_predicted_pc_bits = components_2_io_resp_f2_2_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_resp_f2_3_taken = components_2_io_resp_f2_3_taken; // @[composer.scala 18:11]
  assign io_resp_f2_3_is_br = components_2_io_resp_f2_3_is_br; // @[composer.scala 18:11]
  assign io_resp_f2_3_is_jal = components_2_io_resp_f2_3_is_jal; // @[composer.scala 18:11]
  assign io_resp_f2_3_predicted_pc_valid = components_2_io_resp_f2_3_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f2_3_predicted_pc_bits = components_2_io_resp_f2_3_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_resp_f3_0_taken = components_2_io_resp_f3_0_taken; // @[composer.scala 18:11]
  assign io_resp_f3_0_is_br = components_2_io_resp_f3_0_is_br; // @[composer.scala 18:11]
  assign io_resp_f3_0_is_jal = components_2_io_resp_f3_0_is_jal; // @[composer.scala 18:11]
  assign io_resp_f3_0_predicted_pc_valid = components_2_io_resp_f3_0_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f3_0_predicted_pc_bits = components_2_io_resp_f3_0_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_resp_f3_1_taken = components_2_io_resp_f3_1_taken; // @[composer.scala 18:11]
  assign io_resp_f3_1_is_br = components_2_io_resp_f3_1_is_br; // @[composer.scala 18:11]
  assign io_resp_f3_1_is_jal = components_2_io_resp_f3_1_is_jal; // @[composer.scala 18:11]
  assign io_resp_f3_1_predicted_pc_valid = components_2_io_resp_f3_1_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f3_1_predicted_pc_bits = components_2_io_resp_f3_1_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_resp_f3_2_taken = components_2_io_resp_f3_2_taken; // @[composer.scala 18:11]
  assign io_resp_f3_2_is_br = components_2_io_resp_f3_2_is_br; // @[composer.scala 18:11]
  assign io_resp_f3_2_is_jal = components_2_io_resp_f3_2_is_jal; // @[composer.scala 18:11]
  assign io_resp_f3_2_predicted_pc_valid = components_2_io_resp_f3_2_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f3_2_predicted_pc_bits = components_2_io_resp_f3_2_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_resp_f3_3_taken = components_2_io_resp_f3_3_taken; // @[composer.scala 18:11]
  assign io_resp_f3_3_is_br = components_2_io_resp_f3_3_is_br; // @[composer.scala 18:11]
  assign io_resp_f3_3_is_jal = components_2_io_resp_f3_3_is_jal; // @[composer.scala 18:11]
  assign io_resp_f3_3_predicted_pc_valid = components_2_io_resp_f3_3_predicted_pc_valid; // @[composer.scala 18:11]
  assign io_resp_f3_3_predicted_pc_bits = components_2_io_resp_f3_3_predicted_pc_bits; // @[composer.scala 18:11]
  assign io_f3_meta = {{3'd0}, metas}; // @[composer.scala 31:35]
  assign components_2_clock = clock;
  assign components_2_reset = reset;
  assign components_2_io_f0_valid = io_f0_valid; // @[composer.scala 24:20]
  assign components_2_io_f0_pc = io_f0_pc; // @[composer.scala 25:20]
  assign components_2_io_f0_mask = io_f0_mask; // @[composer.scala 26:20]
  assign components_2_io_f1_ghist = io_f1_ghist; // @[composer.scala 27:20]
  assign components_2_io_f1_lhist = io_f1_lhist; // @[composer.scala 28:20]
  assign components_2_io_resp_in_0_f1_0_taken = components_1_io_resp_f1_0_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_0_is_br = components_1_io_resp_f1_0_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_0_is_jal = components_1_io_resp_f1_0_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_0_predicted_pc_valid = components_1_io_resp_f1_0_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_0_predicted_pc_bits = components_1_io_resp_f1_0_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_1_taken = components_1_io_resp_f1_1_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_1_is_br = components_1_io_resp_f1_1_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_1_is_jal = components_1_io_resp_f1_1_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_1_predicted_pc_valid = components_1_io_resp_f1_1_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_1_predicted_pc_bits = components_1_io_resp_f1_1_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_2_taken = components_1_io_resp_f1_2_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_2_is_br = components_1_io_resp_f1_2_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_2_is_jal = components_1_io_resp_f1_2_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_2_predicted_pc_valid = components_1_io_resp_f1_2_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_2_predicted_pc_bits = components_1_io_resp_f1_2_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_3_taken = components_1_io_resp_f1_3_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_3_is_br = components_1_io_resp_f1_3_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_3_is_jal = components_1_io_resp_f1_3_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_3_predicted_pc_valid = components_1_io_resp_f1_3_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f1_3_predicted_pc_bits = components_1_io_resp_f1_3_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_0_taken = components_1_io_resp_f2_0_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_0_is_br = components_1_io_resp_f2_0_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_0_is_jal = components_1_io_resp_f2_0_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_0_predicted_pc_valid = components_1_io_resp_f2_0_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_0_predicted_pc_bits = components_1_io_resp_f2_0_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_1_taken = components_1_io_resp_f2_1_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_1_is_br = components_1_io_resp_f2_1_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_1_is_jal = components_1_io_resp_f2_1_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_1_predicted_pc_valid = components_1_io_resp_f2_1_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_1_predicted_pc_bits = components_1_io_resp_f2_1_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_2_taken = components_1_io_resp_f2_2_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_2_is_br = components_1_io_resp_f2_2_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_2_is_jal = components_1_io_resp_f2_2_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_2_predicted_pc_valid = components_1_io_resp_f2_2_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_2_predicted_pc_bits = components_1_io_resp_f2_2_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_3_taken = components_1_io_resp_f2_3_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_3_is_br = components_1_io_resp_f2_3_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_3_is_jal = components_1_io_resp_f2_3_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_3_predicted_pc_valid = components_1_io_resp_f2_3_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f2_3_predicted_pc_bits = components_1_io_resp_f2_3_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_0_taken = components_1_io_resp_f3_0_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_0_is_br = components_1_io_resp_f3_0_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_0_is_jal = components_1_io_resp_f3_0_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_0_predicted_pc_valid = components_1_io_resp_f3_0_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_0_predicted_pc_bits = components_1_io_resp_f3_0_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_1_taken = components_1_io_resp_f3_1_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_1_is_br = components_1_io_resp_f3_1_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_1_is_jal = components_1_io_resp_f3_1_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_1_predicted_pc_valid = components_1_io_resp_f3_1_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_1_predicted_pc_bits = components_1_io_resp_f3_1_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_2_taken = components_1_io_resp_f3_2_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_2_is_br = components_1_io_resp_f3_2_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_2_is_jal = components_1_io_resp_f3_2_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_2_predicted_pc_valid = components_1_io_resp_f3_2_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_2_predicted_pc_bits = components_1_io_resp_f3_2_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_3_taken = components_1_io_resp_f3_3_taken; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_3_is_br = components_1_io_resp_f3_3_is_br; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_3_is_jal = components_1_io_resp_f3_3_is_jal; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_3_predicted_pc_valid = components_1_io_resp_f3_3_predicted_pc_valid; // @[config-mixins.scala 681:30]
  assign components_2_io_resp_in_0_f3_3_predicted_pc_bits = components_1_io_resp_f3_3_predicted_pc_bits; // @[config-mixins.scala 681:30]
  assign components_2_io_f3_fire = io_f3_fire; // @[composer.scala 29:20]
  assign components_2_io_update_valid = io_update_valid; // @[composer.scala 41:17]
  assign components_2_io_update_bits_is_mispredict_update = io_update_bits_is_mispredict_update; // @[composer.scala 41:17]
  assign components_2_io_update_bits_is_repair_update = io_update_bits_is_repair_update; // @[composer.scala 41:17]
  assign components_2_io_update_bits_btb_mispredicts = io_update_bits_btb_mispredicts; // @[composer.scala 41:17]
  assign components_2_io_update_bits_pc = io_update_bits_pc; // @[composer.scala 41:17]
  assign components_2_io_update_bits_br_mask = io_update_bits_br_mask; // @[composer.scala 41:17]
  assign components_2_io_update_bits_cfi_idx_valid = io_update_bits_cfi_idx_valid; // @[composer.scala 41:17]
  assign components_2_io_update_bits_cfi_idx_bits = io_update_bits_cfi_idx_bits; // @[composer.scala 41:17]
  assign components_2_io_update_bits_cfi_taken = io_update_bits_cfi_taken; // @[composer.scala 41:17]
  assign components_2_io_update_bits_cfi_mispredicted = io_update_bits_cfi_mispredicted; // @[composer.scala 41:17]
  assign components_2_io_update_bits_cfi_is_br = io_update_bits_cfi_is_br; // @[composer.scala 41:17]
  assign components_2_io_update_bits_cfi_is_jal = io_update_bits_cfi_is_jal; // @[composer.scala 41:17]
  assign components_2_io_update_bits_cfi_is_jalr = io_update_bits_cfi_is_jalr; // @[composer.scala 41:17]
  assign components_2_io_update_bits_ghist = io_update_bits_ghist; // @[composer.scala 41:17]
  assign components_2_io_update_bits_lhist = io_update_bits_lhist; // @[composer.scala 41:17]
  assign components_2_io_update_bits_target = io_update_bits_target; // @[composer.scala 41:17]
  assign components_2_io_update_bits_meta = io_update_bits_meta; // @[composer.scala 42:27]
  assign components_1_clock = clock;
  assign components_1_reset = reset;
  assign components_1_io_f0_valid = io_f0_valid; // @[composer.scala 24:20]
  assign components_1_io_f0_pc = io_f0_pc; // @[composer.scala 25:20]
  assign components_1_io_f0_mask = io_f0_mask; // @[composer.scala 26:20]
  assign components_1_io_f1_ghist = io_f1_ghist; // @[composer.scala 27:20]
  assign components_1_io_f1_lhist = io_f1_lhist; // @[composer.scala 28:20]
  assign components_1_io_resp_in_0_f1_0_taken = components_0_io_resp_f1_0_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_0_is_br = components_0_io_resp_f1_0_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_0_is_jal = components_0_io_resp_f1_0_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_0_predicted_pc_valid = components_0_io_resp_f1_0_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_0_predicted_pc_bits = components_0_io_resp_f1_0_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_1_taken = components_0_io_resp_f1_1_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_1_is_br = components_0_io_resp_f1_1_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_1_is_jal = components_0_io_resp_f1_1_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_1_predicted_pc_valid = components_0_io_resp_f1_1_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_1_predicted_pc_bits = components_0_io_resp_f1_1_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_2_taken = components_0_io_resp_f1_2_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_2_is_br = components_0_io_resp_f1_2_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_2_is_jal = components_0_io_resp_f1_2_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_2_predicted_pc_valid = components_0_io_resp_f1_2_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_2_predicted_pc_bits = components_0_io_resp_f1_2_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_3_taken = components_0_io_resp_f1_3_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_3_is_br = components_0_io_resp_f1_3_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_3_is_jal = components_0_io_resp_f1_3_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_3_predicted_pc_valid = components_0_io_resp_f1_3_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f1_3_predicted_pc_bits = components_0_io_resp_f1_3_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_0_taken = components_0_io_resp_f2_0_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_0_is_br = components_0_io_resp_f2_0_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_0_is_jal = components_0_io_resp_f2_0_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_0_predicted_pc_valid = components_0_io_resp_f2_0_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_0_predicted_pc_bits = components_0_io_resp_f2_0_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_1_taken = components_0_io_resp_f2_1_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_1_is_br = components_0_io_resp_f2_1_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_1_is_jal = components_0_io_resp_f2_1_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_1_predicted_pc_valid = components_0_io_resp_f2_1_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_1_predicted_pc_bits = components_0_io_resp_f2_1_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_2_taken = components_0_io_resp_f2_2_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_2_is_br = components_0_io_resp_f2_2_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_2_is_jal = components_0_io_resp_f2_2_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_2_predicted_pc_valid = components_0_io_resp_f2_2_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_2_predicted_pc_bits = components_0_io_resp_f2_2_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_3_taken = components_0_io_resp_f2_3_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_3_is_br = components_0_io_resp_f2_3_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_3_is_jal = components_0_io_resp_f2_3_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_3_predicted_pc_valid = components_0_io_resp_f2_3_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f2_3_predicted_pc_bits = components_0_io_resp_f2_3_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_0_taken = components_0_io_resp_f3_0_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_0_is_br = components_0_io_resp_f3_0_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_0_is_jal = components_0_io_resp_f3_0_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_0_predicted_pc_valid = components_0_io_resp_f3_0_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_0_predicted_pc_bits = components_0_io_resp_f3_0_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_1_taken = components_0_io_resp_f3_1_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_1_is_br = components_0_io_resp_f3_1_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_1_is_jal = components_0_io_resp_f3_1_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_1_predicted_pc_valid = components_0_io_resp_f3_1_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_1_predicted_pc_bits = components_0_io_resp_f3_1_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_2_taken = components_0_io_resp_f3_2_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_2_is_br = components_0_io_resp_f3_2_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_2_is_jal = components_0_io_resp_f3_2_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_2_predicted_pc_valid = components_0_io_resp_f3_2_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_2_predicted_pc_bits = components_0_io_resp_f3_2_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_3_taken = components_0_io_resp_f3_3_taken; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_3_is_br = components_0_io_resp_f3_3_is_br; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_3_is_jal = components_0_io_resp_f3_3_is_jal; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_3_predicted_pc_valid = components_0_io_resp_f3_3_predicted_pc_valid; // @[config-mixins.scala 680:28]
  assign components_1_io_resp_in_0_f3_3_predicted_pc_bits = components_0_io_resp_f3_3_predicted_pc_bits; // @[config-mixins.scala 680:28]
  assign components_1_io_f3_fire = io_f3_fire; // @[composer.scala 29:20]
  assign components_1_io_update_valid = io_update_valid; // @[composer.scala 41:17]
  assign components_1_io_update_bits_is_mispredict_update = io_update_bits_is_mispredict_update; // @[composer.scala 41:17]
  assign components_1_io_update_bits_is_repair_update = io_update_bits_is_repair_update; // @[composer.scala 41:17]
  assign components_1_io_update_bits_btb_mispredicts = io_update_bits_btb_mispredicts; // @[composer.scala 41:17]
  assign components_1_io_update_bits_pc = io_update_bits_pc; // @[composer.scala 41:17]
  assign components_1_io_update_bits_br_mask = io_update_bits_br_mask; // @[composer.scala 41:17]
  assign components_1_io_update_bits_cfi_idx_valid = io_update_bits_cfi_idx_valid; // @[composer.scala 41:17]
  assign components_1_io_update_bits_cfi_idx_bits = io_update_bits_cfi_idx_bits; // @[composer.scala 41:17]
  assign components_1_io_update_bits_cfi_taken = io_update_bits_cfi_taken; // @[composer.scala 41:17]
  assign components_1_io_update_bits_cfi_mispredicted = io_update_bits_cfi_mispredicted; // @[composer.scala 41:17]
  assign components_1_io_update_bits_cfi_is_br = io_update_bits_cfi_is_br; // @[composer.scala 41:17]
  assign components_1_io_update_bits_cfi_is_jal = io_update_bits_cfi_is_jal; // @[composer.scala 41:17]
  assign components_1_io_update_bits_cfi_is_jalr = io_update_bits_cfi_is_jalr; // @[composer.scala 41:17]
  assign components_1_io_update_bits_ghist = io_update_bits_ghist; // @[composer.scala 41:17]
  assign components_1_io_update_bits_lhist = io_update_bits_lhist; // @[composer.scala 41:17]
  assign components_1_io_update_bits_target = io_update_bits_target; // @[composer.scala 41:17]
  assign components_1_io_update_bits_meta = {{32'd0}, io_update_bits_meta[44:32]}; // @[composer.scala 43:31]
  assign components_0_clock = clock;
  assign components_0_reset = reset;
  assign components_0_io_f0_valid = io_f0_valid; // @[composer.scala 24:20]
  assign components_0_io_f0_pc = io_f0_pc; // @[composer.scala 25:20]
  assign components_0_io_f0_mask = io_f0_mask; // @[composer.scala 26:20]
  assign components_0_io_f1_ghist = io_f1_ghist; // @[composer.scala 27:20]
  assign components_0_io_f1_lhist = io_f1_lhist; // @[composer.scala 28:20]
  assign components_0_io_resp_in_0_f1_0_taken = io_resp_in_0_f1_0_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_0_is_br = io_resp_in_0_f1_0_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_0_is_jal = io_resp_in_0_f1_0_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_0_predicted_pc_valid = io_resp_in_0_f1_0_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_0_predicted_pc_bits = io_resp_in_0_f1_0_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_1_taken = io_resp_in_0_f1_1_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_1_is_br = io_resp_in_0_f1_1_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_1_is_jal = io_resp_in_0_f1_1_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_1_predicted_pc_valid = io_resp_in_0_f1_1_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_1_predicted_pc_bits = io_resp_in_0_f1_1_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_2_taken = io_resp_in_0_f1_2_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_2_is_br = io_resp_in_0_f1_2_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_2_is_jal = io_resp_in_0_f1_2_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_2_predicted_pc_valid = io_resp_in_0_f1_2_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_2_predicted_pc_bits = io_resp_in_0_f1_2_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_3_taken = io_resp_in_0_f1_3_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_3_is_br = io_resp_in_0_f1_3_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_3_is_jal = io_resp_in_0_f1_3_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_3_predicted_pc_valid = io_resp_in_0_f1_3_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f1_3_predicted_pc_bits = io_resp_in_0_f1_3_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_0_taken = io_resp_in_0_f2_0_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_0_is_br = io_resp_in_0_f2_0_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_0_is_jal = io_resp_in_0_f2_0_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_0_predicted_pc_valid = io_resp_in_0_f2_0_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_0_predicted_pc_bits = io_resp_in_0_f2_0_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_1_taken = io_resp_in_0_f2_1_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_1_is_br = io_resp_in_0_f2_1_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_1_is_jal = io_resp_in_0_f2_1_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_1_predicted_pc_valid = io_resp_in_0_f2_1_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_1_predicted_pc_bits = io_resp_in_0_f2_1_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_2_taken = io_resp_in_0_f2_2_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_2_is_br = io_resp_in_0_f2_2_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_2_is_jal = io_resp_in_0_f2_2_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_2_predicted_pc_valid = io_resp_in_0_f2_2_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_2_predicted_pc_bits = io_resp_in_0_f2_2_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_3_taken = io_resp_in_0_f2_3_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_3_is_br = io_resp_in_0_f2_3_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_3_is_jal = io_resp_in_0_f2_3_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_3_predicted_pc_valid = io_resp_in_0_f2_3_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f2_3_predicted_pc_bits = io_resp_in_0_f2_3_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_0_taken = io_resp_in_0_f3_0_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_0_is_br = io_resp_in_0_f3_0_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_0_is_jal = io_resp_in_0_f3_0_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_0_predicted_pc_valid = io_resp_in_0_f3_0_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_0_predicted_pc_bits = io_resp_in_0_f3_0_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_1_taken = io_resp_in_0_f3_1_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_1_is_br = io_resp_in_0_f3_1_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_1_is_jal = io_resp_in_0_f3_1_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_1_predicted_pc_valid = io_resp_in_0_f3_1_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_1_predicted_pc_bits = io_resp_in_0_f3_1_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_2_taken = io_resp_in_0_f3_2_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_2_is_br = io_resp_in_0_f3_2_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_2_is_jal = io_resp_in_0_f3_2_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_2_predicted_pc_valid = io_resp_in_0_f3_2_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_2_predicted_pc_bits = io_resp_in_0_f3_2_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_3_taken = io_resp_in_0_f3_3_taken; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_3_is_br = io_resp_in_0_f3_3_is_br; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_3_is_jal = io_resp_in_0_f3_3_is_jal; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_3_predicted_pc_valid = io_resp_in_0_f3_3_predicted_pc_valid; // @[config-mixins.scala 679:28]
  assign components_0_io_resp_in_0_f3_3_predicted_pc_bits = io_resp_in_0_f3_3_predicted_pc_bits; // @[config-mixins.scala 679:28]
  assign components_0_io_f3_fire = io_f3_fire; // @[composer.scala 29:20]
  assign components_0_io_update_valid = io_update_valid; // @[composer.scala 41:17]
  assign components_0_io_update_bits_is_mispredict_update = io_update_bits_is_mispredict_update; // @[composer.scala 41:17]
  assign components_0_io_update_bits_is_repair_update = io_update_bits_is_repair_update; // @[composer.scala 41:17]
  assign components_0_io_update_bits_btb_mispredicts = io_update_bits_btb_mispredicts; // @[composer.scala 41:17]
  assign components_0_io_update_bits_pc = io_update_bits_pc; // @[composer.scala 41:17]
  assign components_0_io_update_bits_br_mask = io_update_bits_br_mask; // @[composer.scala 41:17]
  assign components_0_io_update_bits_cfi_idx_valid = io_update_bits_cfi_idx_valid; // @[composer.scala 41:17]
  assign components_0_io_update_bits_cfi_idx_bits = io_update_bits_cfi_idx_bits; // @[composer.scala 41:17]
  assign components_0_io_update_bits_cfi_taken = io_update_bits_cfi_taken; // @[composer.scala 41:17]
  assign components_0_io_update_bits_cfi_mispredicted = io_update_bits_cfi_mispredicted; // @[composer.scala 41:17]
  assign components_0_io_update_bits_cfi_is_br = io_update_bits_cfi_is_br; // @[composer.scala 41:17]
  assign components_0_io_update_bits_cfi_is_jal = io_update_bits_cfi_is_jal; // @[composer.scala 41:17]
  assign components_0_io_update_bits_cfi_is_jalr = io_update_bits_cfi_is_jalr; // @[composer.scala 41:17]
  assign components_0_io_update_bits_ghist = io_update_bits_ghist; // @[composer.scala 41:17]
  assign components_0_io_update_bits_lhist = io_update_bits_lhist; // @[composer.scala 41:17]
  assign components_0_io_update_bits_target = io_update_bits_target; // @[composer.scala 41:17]
  assign components_0_io_update_bits_meta = {{33'd0}, io_update_bits_meta[44:33]}; // @[composer.scala 43:31]
endmodule
