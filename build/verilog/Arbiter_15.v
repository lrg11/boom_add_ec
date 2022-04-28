module Arbiter_15(
  input         clock,
  input         reset,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input         io_in_0_bits_is_mispredict_update,
  input         io_in_0_bits_is_repair_update,
  input  [3:0]  io_in_0_bits_btb_mispredicts,
  input  [39:0] io_in_0_bits_pc,
  input  [3:0]  io_in_0_bits_br_mask,
  input         io_in_0_bits_cfi_idx_valid,
  input  [1:0]  io_in_0_bits_cfi_idx_bits,
  input         io_in_0_bits_cfi_taken,
  input         io_in_0_bits_cfi_mispredicted,
  input         io_in_0_bits_cfi_is_br,
  input         io_in_0_bits_cfi_is_jal,
  input         io_in_0_bits_cfi_is_jalr,
  input  [15:0] io_in_0_bits_ghist_old_history,
  input         io_in_0_bits_ghist_current_saw_branch_not_taken,
  input         io_in_0_bits_ghist_new_saw_branch_not_taken,
  input         io_in_0_bits_ghist_new_saw_branch_taken,
  input  [4:0]  io_in_0_bits_ghist_ras_idx,
  input         io_in_0_bits_lhist_0,
  input  [39:0] io_in_0_bits_target,
  input  [44:0] io_in_0_bits_meta_0,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input         io_in_1_bits_is_mispredict_update,
  input         io_in_1_bits_is_repair_update,
  input  [3:0]  io_in_1_bits_btb_mispredicts,
  input  [39:0] io_in_1_bits_pc,
  input  [3:0]  io_in_1_bits_br_mask,
  input         io_in_1_bits_cfi_idx_valid,
  input  [1:0]  io_in_1_bits_cfi_idx_bits,
  input         io_in_1_bits_cfi_taken,
  input         io_in_1_bits_cfi_mispredicted,
  input         io_in_1_bits_cfi_is_br,
  input         io_in_1_bits_cfi_is_jal,
  input         io_in_1_bits_cfi_is_jalr,
  input  [15:0] io_in_1_bits_ghist_old_history,
  input         io_in_1_bits_ghist_current_saw_branch_not_taken,
  input         io_in_1_bits_ghist_new_saw_branch_not_taken,
  input         io_in_1_bits_ghist_new_saw_branch_taken,
  input  [4:0]  io_in_1_bits_ghist_ras_idx,
  input         io_in_1_bits_lhist_0,
  input  [39:0] io_in_1_bits_target,
  input  [44:0] io_in_1_bits_meta_0,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_is_mispredict_update,
  output        io_out_bits_is_repair_update,
  output [3:0]  io_out_bits_btb_mispredicts,
  output [39:0] io_out_bits_pc,
  output [3:0]  io_out_bits_br_mask,
  output        io_out_bits_cfi_idx_valid,
  output [1:0]  io_out_bits_cfi_idx_bits,
  output        io_out_bits_cfi_taken,
  output        io_out_bits_cfi_mispredicted,
  output        io_out_bits_cfi_is_br,
  output        io_out_bits_cfi_is_jal,
  output        io_out_bits_cfi_is_jalr,
  output [15:0] io_out_bits_ghist_old_history,
  output        io_out_bits_ghist_current_saw_branch_not_taken,
  output        io_out_bits_ghist_new_saw_branch_not_taken,
  output        io_out_bits_ghist_new_saw_branch_taken,
  output [4:0]  io_out_bits_ghist_ras_idx,
  output        io_out_bits_lhist_0,
  output [39:0] io_out_bits_target,
  output [44:0] io_out_bits_meta_0,
  output        io_chosen
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 31:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 134:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 135:31]
  assign io_out_bits_is_mispredict_update = io_in_0_valid ? io_in_0_bits_is_mispredict_update :
    io_in_1_bits_is_mispredict_update; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_is_repair_update = io_in_0_valid ? io_in_0_bits_is_repair_update : io_in_1_bits_is_repair_update; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_btb_mispredicts = io_in_0_valid ? io_in_0_bits_btb_mispredicts : io_in_1_bits_btb_mispredicts; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_pc = io_in_0_valid ? io_in_0_bits_pc : io_in_1_bits_pc; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_br_mask = io_in_0_valid ? io_in_0_bits_br_mask : io_in_1_bits_br_mask; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_cfi_idx_valid = io_in_0_valid ? io_in_0_bits_cfi_idx_valid : io_in_1_bits_cfi_idx_valid; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_cfi_idx_bits = io_in_0_valid ? io_in_0_bits_cfi_idx_bits : io_in_1_bits_cfi_idx_bits; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_cfi_taken = io_in_0_valid ? io_in_0_bits_cfi_taken : io_in_1_bits_cfi_taken; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_cfi_mispredicted = io_in_0_valid ? io_in_0_bits_cfi_mispredicted : io_in_1_bits_cfi_mispredicted; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_cfi_is_br = io_in_0_valid ? io_in_0_bits_cfi_is_br : io_in_1_bits_cfi_is_br; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_cfi_is_jal = io_in_0_valid ? io_in_0_bits_cfi_is_jal : io_in_1_bits_cfi_is_jal; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_cfi_is_jalr = io_in_0_valid ? io_in_0_bits_cfi_is_jalr : io_in_1_bits_cfi_is_jalr; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_ghist_old_history = io_in_0_valid ? io_in_0_bits_ghist_old_history : io_in_1_bits_ghist_old_history
    ; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_ghist_current_saw_branch_not_taken = io_in_0_valid ?
    io_in_0_bits_ghist_current_saw_branch_not_taken : io_in_1_bits_ghist_current_saw_branch_not_taken; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_ghist_new_saw_branch_not_taken = io_in_0_valid ? io_in_0_bits_ghist_new_saw_branch_not_taken :
    io_in_1_bits_ghist_new_saw_branch_not_taken; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_ghist_new_saw_branch_taken = io_in_0_valid ? io_in_0_bits_ghist_new_saw_branch_taken :
    io_in_1_bits_ghist_new_saw_branch_taken; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_ghist_ras_idx = io_in_0_valid ? io_in_0_bits_ghist_ras_idx : io_in_1_bits_ghist_ras_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_lhist_0 = io_in_0_valid ? io_in_0_bits_lhist_0 : io_in_1_bits_lhist_0; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_target = io_in_0_valid ? io_in_0_bits_target : io_in_1_bits_target; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_meta_0 = io_in_0_valid ? io_in_0_bits_meta_0 : io_in_1_bits_meta_0; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_chosen = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 126:27 Arbiter.scala 127:17 Arbiter.scala 123:13]
endmodule
