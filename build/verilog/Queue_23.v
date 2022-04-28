module Queue_23(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_is_mispredict_update,
  input         io_enq_bits_is_repair_update,
  input  [3:0]  io_enq_bits_btb_mispredicts,
  input  [39:0] io_enq_bits_pc,
  input  [3:0]  io_enq_bits_br_mask,
  input         io_enq_bits_cfi_idx_valid,
  input  [1:0]  io_enq_bits_cfi_idx_bits,
  input         io_enq_bits_cfi_taken,
  input         io_enq_bits_cfi_mispredicted,
  input         io_enq_bits_cfi_is_br,
  input         io_enq_bits_cfi_is_jal,
  input         io_enq_bits_cfi_is_jalr,
  input  [15:0] io_enq_bits_ghist_old_history,
  input         io_enq_bits_ghist_current_saw_branch_not_taken,
  input         io_enq_bits_ghist_new_saw_branch_not_taken,
  input         io_enq_bits_ghist_new_saw_branch_taken,
  input  [4:0]  io_enq_bits_ghist_ras_idx,
  input         io_enq_bits_lhist_0,
  input  [39:0] io_enq_bits_target,
  input  [44:0] io_enq_bits_meta_0,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_is_mispredict_update,
  output        io_deq_bits_is_repair_update,
  output [3:0]  io_deq_bits_btb_mispredicts,
  output [39:0] io_deq_bits_pc,
  output [3:0]  io_deq_bits_br_mask,
  output        io_deq_bits_cfi_idx_valid,
  output [1:0]  io_deq_bits_cfi_idx_bits,
  output        io_deq_bits_cfi_taken,
  output        io_deq_bits_cfi_mispredicted,
  output        io_deq_bits_cfi_is_br,
  output        io_deq_bits_cfi_is_jal,
  output        io_deq_bits_cfi_is_jalr,
  output [15:0] io_deq_bits_ghist_old_history,
  output        io_deq_bits_ghist_current_saw_branch_not_taken,
  output        io_deq_bits_ghist_new_saw_branch_not_taken,
  output        io_deq_bits_ghist_new_saw_branch_taken,
  output [4:0]  io_deq_bits_ghist_ras_idx,
  output        io_deq_bits_lhist_0,
  output [39:0] io_deq_bits_target,
  output [44:0] io_deq_bits_meta_0,
  output [1:0]  io_count
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
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
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
`endif // RANDOMIZE_REG_INIT
  reg  ram_is_mispredict_update [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_is_mispredict_update_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_is_mispredict_update_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_is_mispredict_update_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_is_mispredict_update_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_is_mispredict_update_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_is_mispredict_update_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_is_repair_update [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_is_repair_update_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_is_repair_update_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_is_repair_update_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_is_repair_update_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_is_repair_update_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_is_repair_update_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] ram_btb_mispredicts [0:1]; // @[Decoupled.scala 218:16]
  wire [3:0] ram_btb_mispredicts_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_btb_mispredicts_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [3:0] ram_btb_mispredicts_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_btb_mispredicts_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_btb_mispredicts_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_btb_mispredicts_MPORT_en; // @[Decoupled.scala 218:16]
  reg [39:0] ram_pc [0:1]; // @[Decoupled.scala 218:16]
  wire [39:0] ram_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_pc_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [39:0] ram_pc_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] ram_br_mask [0:1]; // @[Decoupled.scala 218:16]
  wire [3:0] ram_br_mask_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_br_mask_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [3:0] ram_br_mask_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_br_mask_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_br_mask_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_br_mask_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_cfi_idx_valid [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_MPORT_en; // @[Decoupled.scala 218:16]
  reg [1:0] ram_cfi_idx_bits [0:1]; // @[Decoupled.scala 218:16]
  wire [1:0] ram_cfi_idx_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_bits_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [1:0] ram_cfi_idx_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_bits_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_bits_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_cfi_taken [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_cfi_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_cfi_mispredicted [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_cfi_mispredicted_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_mispredicted_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_mispredicted_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_mispredicted_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_mispredicted_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_mispredicted_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_cfi_is_br [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_br_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_br_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_br_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_br_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_br_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_br_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_cfi_is_jal [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jal_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jal_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jal_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jal_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jal_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jal_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_cfi_is_jalr [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jalr_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jalr_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jalr_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jalr_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jalr_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_jalr_MPORT_en; // @[Decoupled.scala 218:16]
  reg [15:0] ram_ghist_old_history [0:1]; // @[Decoupled.scala 218:16]
  wire [15:0] ram_ghist_old_history_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [15:0] ram_ghist_old_history_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_ghist_current_saw_branch_not_taken [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_ghist_new_saw_branch_not_taken [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_ghist_new_saw_branch_taken [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg [4:0] ram_ghist_ras_idx [0:1]; // @[Decoupled.scala 218:16]
  wire [4:0] ram_ghist_ras_idx_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [4:0] ram_ghist_ras_idx_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_lhist_0 [0:1]; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg [39:0] ram_target [0:1]; // @[Decoupled.scala 218:16]
  wire [39:0] ram_target_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_target_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [39:0] ram_target_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_target_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_target_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_target_MPORT_en; // @[Decoupled.scala 218:16]
  reg [44:0] ram_meta_0 [0:1]; // @[Decoupled.scala 218:16]
  wire [44:0] ram_meta_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_meta_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [44:0] ram_meta_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_meta_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_meta_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_meta_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg  enq_ptr_value; // @[Counter.scala 60:40]
  reg  deq_ptr_value; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 223:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  ptr_diff = enq_ptr_value - deq_ptr_value; // @[Decoupled.scala 257:32]
  wire [1:0] _io_count_T_1 = maybe_full & ptr_match ? 2'h2 : 2'h0; // @[Decoupled.scala 259:20]
  wire [1:0] _GEN_27 = {{1'd0}, ptr_diff}; // @[Decoupled.scala 259:62]
  assign ram_is_mispredict_update_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_is_mispredict_update_io_deq_bits_MPORT_data =
    ram_is_mispredict_update[ram_is_mispredict_update_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_is_mispredict_update_MPORT_data = io_enq_bits_is_mispredict_update;
  assign ram_is_mispredict_update_MPORT_addr = enq_ptr_value;
  assign ram_is_mispredict_update_MPORT_mask = 1'h1;
  assign ram_is_mispredict_update_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_is_repair_update_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_is_repair_update_io_deq_bits_MPORT_data = ram_is_repair_update[ram_is_repair_update_io_deq_bits_MPORT_addr]
    ; // @[Decoupled.scala 218:16]
  assign ram_is_repair_update_MPORT_data = io_enq_bits_is_repair_update;
  assign ram_is_repair_update_MPORT_addr = enq_ptr_value;
  assign ram_is_repair_update_MPORT_mask = 1'h1;
  assign ram_is_repair_update_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_btb_mispredicts_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_btb_mispredicts_io_deq_bits_MPORT_data = ram_btb_mispredicts[ram_btb_mispredicts_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_btb_mispredicts_MPORT_data = io_enq_bits_btb_mispredicts;
  assign ram_btb_mispredicts_MPORT_addr = enq_ptr_value;
  assign ram_btb_mispredicts_MPORT_mask = 1'h1;
  assign ram_btb_mispredicts_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_pc_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_pc_io_deq_bits_MPORT_data = ram_pc[ram_pc_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_pc_MPORT_data = io_enq_bits_pc;
  assign ram_pc_MPORT_addr = enq_ptr_value;
  assign ram_pc_MPORT_mask = 1'h1;
  assign ram_pc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_br_mask_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_br_mask_io_deq_bits_MPORT_data = ram_br_mask[ram_br_mask_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_br_mask_MPORT_data = io_enq_bits_br_mask;
  assign ram_br_mask_MPORT_addr = enq_ptr_value;
  assign ram_br_mask_MPORT_mask = 1'h1;
  assign ram_br_mask_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_idx_valid_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_cfi_idx_valid_io_deq_bits_MPORT_data = ram_cfi_idx_valid[ram_cfi_idx_valid_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_idx_valid_MPORT_data = io_enq_bits_cfi_idx_valid;
  assign ram_cfi_idx_valid_MPORT_addr = enq_ptr_value;
  assign ram_cfi_idx_valid_MPORT_mask = 1'h1;
  assign ram_cfi_idx_valid_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_idx_bits_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_cfi_idx_bits_io_deq_bits_MPORT_data = ram_cfi_idx_bits[ram_cfi_idx_bits_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_idx_bits_MPORT_data = io_enq_bits_cfi_idx_bits;
  assign ram_cfi_idx_bits_MPORT_addr = enq_ptr_value;
  assign ram_cfi_idx_bits_MPORT_mask = 1'h1;
  assign ram_cfi_idx_bits_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_taken_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_cfi_taken_io_deq_bits_MPORT_data = ram_cfi_taken[ram_cfi_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_taken_MPORT_data = io_enq_bits_cfi_taken;
  assign ram_cfi_taken_MPORT_addr = enq_ptr_value;
  assign ram_cfi_taken_MPORT_mask = 1'h1;
  assign ram_cfi_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_mispredicted_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_cfi_mispredicted_io_deq_bits_MPORT_data = ram_cfi_mispredicted[ram_cfi_mispredicted_io_deq_bits_MPORT_addr]
    ; // @[Decoupled.scala 218:16]
  assign ram_cfi_mispredicted_MPORT_data = io_enq_bits_cfi_mispredicted;
  assign ram_cfi_mispredicted_MPORT_addr = enq_ptr_value;
  assign ram_cfi_mispredicted_MPORT_mask = 1'h1;
  assign ram_cfi_mispredicted_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_is_br_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_cfi_is_br_io_deq_bits_MPORT_data = ram_cfi_is_br[ram_cfi_is_br_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_is_br_MPORT_data = io_enq_bits_cfi_is_br;
  assign ram_cfi_is_br_MPORT_addr = enq_ptr_value;
  assign ram_cfi_is_br_MPORT_mask = 1'h1;
  assign ram_cfi_is_br_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_is_jal_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_cfi_is_jal_io_deq_bits_MPORT_data = ram_cfi_is_jal[ram_cfi_is_jal_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_is_jal_MPORT_data = io_enq_bits_cfi_is_jal;
  assign ram_cfi_is_jal_MPORT_addr = enq_ptr_value;
  assign ram_cfi_is_jal_MPORT_mask = 1'h1;
  assign ram_cfi_is_jal_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_is_jalr_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_cfi_is_jalr_io_deq_bits_MPORT_data = ram_cfi_is_jalr[ram_cfi_is_jalr_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_is_jalr_MPORT_data = io_enq_bits_cfi_is_jalr;
  assign ram_cfi_is_jalr_MPORT_addr = enq_ptr_value;
  assign ram_cfi_is_jalr_MPORT_mask = 1'h1;
  assign ram_cfi_is_jalr_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_old_history_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_ghist_old_history_io_deq_bits_MPORT_data =
    ram_ghist_old_history[ram_ghist_old_history_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_old_history_MPORT_data = io_enq_bits_ghist_old_history;
  assign ram_ghist_old_history_MPORT_addr = enq_ptr_value;
  assign ram_ghist_old_history_MPORT_mask = 1'h1;
  assign ram_ghist_old_history_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_data =
    ram_ghist_current_saw_branch_not_taken[ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_current_saw_branch_not_taken_MPORT_data = io_enq_bits_ghist_current_saw_branch_not_taken;
  assign ram_ghist_current_saw_branch_not_taken_MPORT_addr = enq_ptr_value;
  assign ram_ghist_current_saw_branch_not_taken_MPORT_mask = 1'h1;
  assign ram_ghist_current_saw_branch_not_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_data =
    ram_ghist_new_saw_branch_not_taken[ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_new_saw_branch_not_taken_MPORT_data = io_enq_bits_ghist_new_saw_branch_not_taken;
  assign ram_ghist_new_saw_branch_not_taken_MPORT_addr = enq_ptr_value;
  assign ram_ghist_new_saw_branch_not_taken_MPORT_mask = 1'h1;
  assign ram_ghist_new_saw_branch_not_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_data =
    ram_ghist_new_saw_branch_taken[ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_new_saw_branch_taken_MPORT_data = io_enq_bits_ghist_new_saw_branch_taken;
  assign ram_ghist_new_saw_branch_taken_MPORT_addr = enq_ptr_value;
  assign ram_ghist_new_saw_branch_taken_MPORT_mask = 1'h1;
  assign ram_ghist_new_saw_branch_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_ras_idx_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_ghist_ras_idx_io_deq_bits_MPORT_data = ram_ghist_ras_idx[ram_ghist_ras_idx_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_ras_idx_MPORT_data = io_enq_bits_ghist_ras_idx;
  assign ram_ghist_ras_idx_MPORT_addr = enq_ptr_value;
  assign ram_ghist_ras_idx_MPORT_mask = 1'h1;
  assign ram_ghist_ras_idx_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_lhist_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_lhist_0_io_deq_bits_MPORT_data = ram_lhist_0[ram_lhist_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_lhist_0_MPORT_data = io_enq_bits_lhist_0;
  assign ram_lhist_0_MPORT_addr = enq_ptr_value;
  assign ram_lhist_0_MPORT_mask = 1'h1;
  assign ram_lhist_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_target_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_target_io_deq_bits_MPORT_data = ram_target[ram_target_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_target_MPORT_data = io_enq_bits_target;
  assign ram_target_MPORT_addr = enq_ptr_value;
  assign ram_target_MPORT_mask = 1'h1;
  assign ram_target_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_meta_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_meta_0_io_deq_bits_MPORT_data = ram_meta_0[ram_meta_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_meta_0_MPORT_data = io_enq_bits_meta_0;
  assign ram_meta_0_MPORT_addr = enq_ptr_value;
  assign ram_meta_0_MPORT_mask = 1'h1;
  assign ram_meta_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits_is_mispredict_update = ram_is_mispredict_update_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_is_repair_update = ram_is_repair_update_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_btb_mispredicts = ram_btb_mispredicts_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_pc = ram_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_br_mask = ram_br_mask_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_idx_valid = ram_cfi_idx_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_idx_bits = ram_cfi_idx_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_taken = ram_cfi_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_mispredicted = ram_cfi_mispredicted_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_is_br = ram_cfi_is_br_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_is_jal = ram_cfi_is_jal_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_is_jalr = ram_cfi_is_jalr_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_old_history = ram_ghist_old_history_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_current_saw_branch_not_taken = ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_new_saw_branch_not_taken = ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_new_saw_branch_taken = ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_ras_idx = ram_ghist_ras_idx_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_lhist_0 = ram_lhist_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_target = ram_target_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_meta_0 = ram_meta_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_count = _io_count_T_1 | _GEN_27; // @[Decoupled.scala 259:62]
  always @(posedge clock) begin
    if(ram_is_mispredict_update_MPORT_en & ram_is_mispredict_update_MPORT_mask) begin
      ram_is_mispredict_update[ram_is_mispredict_update_MPORT_addr] <= ram_is_mispredict_update_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_is_repair_update_MPORT_en & ram_is_repair_update_MPORT_mask) begin
      ram_is_repair_update[ram_is_repair_update_MPORT_addr] <= ram_is_repair_update_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_btb_mispredicts_MPORT_en & ram_btb_mispredicts_MPORT_mask) begin
      ram_btb_mispredicts[ram_btb_mispredicts_MPORT_addr] <= ram_btb_mispredicts_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_pc_MPORT_en & ram_pc_MPORT_mask) begin
      ram_pc[ram_pc_MPORT_addr] <= ram_pc_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_br_mask_MPORT_en & ram_br_mask_MPORT_mask) begin
      ram_br_mask[ram_br_mask_MPORT_addr] <= ram_br_mask_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_idx_valid_MPORT_en & ram_cfi_idx_valid_MPORT_mask) begin
      ram_cfi_idx_valid[ram_cfi_idx_valid_MPORT_addr] <= ram_cfi_idx_valid_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_idx_bits_MPORT_en & ram_cfi_idx_bits_MPORT_mask) begin
      ram_cfi_idx_bits[ram_cfi_idx_bits_MPORT_addr] <= ram_cfi_idx_bits_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_taken_MPORT_en & ram_cfi_taken_MPORT_mask) begin
      ram_cfi_taken[ram_cfi_taken_MPORT_addr] <= ram_cfi_taken_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_mispredicted_MPORT_en & ram_cfi_mispredicted_MPORT_mask) begin
      ram_cfi_mispredicted[ram_cfi_mispredicted_MPORT_addr] <= ram_cfi_mispredicted_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_is_br_MPORT_en & ram_cfi_is_br_MPORT_mask) begin
      ram_cfi_is_br[ram_cfi_is_br_MPORT_addr] <= ram_cfi_is_br_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_is_jal_MPORT_en & ram_cfi_is_jal_MPORT_mask) begin
      ram_cfi_is_jal[ram_cfi_is_jal_MPORT_addr] <= ram_cfi_is_jal_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_is_jalr_MPORT_en & ram_cfi_is_jalr_MPORT_mask) begin
      ram_cfi_is_jalr[ram_cfi_is_jalr_MPORT_addr] <= ram_cfi_is_jalr_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ghist_old_history_MPORT_en & ram_ghist_old_history_MPORT_mask) begin
      ram_ghist_old_history[ram_ghist_old_history_MPORT_addr] <= ram_ghist_old_history_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ghist_current_saw_branch_not_taken_MPORT_en & ram_ghist_current_saw_branch_not_taken_MPORT_mask) begin
      ram_ghist_current_saw_branch_not_taken[ram_ghist_current_saw_branch_not_taken_MPORT_addr] <=
        ram_ghist_current_saw_branch_not_taken_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ghist_new_saw_branch_not_taken_MPORT_en & ram_ghist_new_saw_branch_not_taken_MPORT_mask) begin
      ram_ghist_new_saw_branch_not_taken[ram_ghist_new_saw_branch_not_taken_MPORT_addr] <=
        ram_ghist_new_saw_branch_not_taken_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ghist_new_saw_branch_taken_MPORT_en & ram_ghist_new_saw_branch_taken_MPORT_mask) begin
      ram_ghist_new_saw_branch_taken[ram_ghist_new_saw_branch_taken_MPORT_addr] <=
        ram_ghist_new_saw_branch_taken_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ghist_ras_idx_MPORT_en & ram_ghist_ras_idx_MPORT_mask) begin
      ram_ghist_ras_idx[ram_ghist_ras_idx_MPORT_addr] <= ram_ghist_ras_idx_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_lhist_0_MPORT_en & ram_lhist_0_MPORT_mask) begin
      ram_lhist_0[ram_lhist_0_MPORT_addr] <= ram_lhist_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_target_MPORT_en & ram_target_MPORT_mask) begin
      ram_target[ram_target_MPORT_addr] <= ram_target_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_meta_0_MPORT_en & ram_meta_0_MPORT_mask) begin
      ram_meta_0[ram_meta_0_MPORT_addr] <= ram_meta_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      enq_ptr_value <= 1'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 229:17]
      enq_ptr_value <= enq_ptr_value + 1'h1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Counter.scala 60:40]
      deq_ptr_value <= 1'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[Decoupled.scala 233:17]
      deq_ptr_value <= deq_ptr_value + 1'h1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_is_mispredict_update[initvar] = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_is_repair_update[initvar] = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_btb_mispredicts[initvar] = _RAND_2[3:0];
  _RAND_3 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_pc[initvar] = _RAND_3[39:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_br_mask[initvar] = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_cfi_idx_valid[initvar] = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_cfi_idx_bits[initvar] = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_cfi_taken[initvar] = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_cfi_mispredicted[initvar] = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_cfi_is_br[initvar] = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_cfi_is_jal[initvar] = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_cfi_is_jalr[initvar] = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_ghist_old_history[initvar] = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_ghist_current_saw_branch_not_taken[initvar] = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_ghist_new_saw_branch_not_taken[initvar] = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_ghist_new_saw_branch_taken[initvar] = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_ghist_ras_idx[initvar] = _RAND_16[4:0];
  _RAND_17 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_lhist_0[initvar] = _RAND_17[0:0];
  _RAND_18 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_target[initvar] = _RAND_18[39:0];
  _RAND_19 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_meta_0[initvar] = _RAND_19[44:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  enq_ptr_value = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  deq_ptr_value = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  maybe_full = _RAND_22[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
