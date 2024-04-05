module Queue_21(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [39:0] io_enq_bits_pc,
  input  [63:0] io_enq_bits_data,
  input  [3:0]  io_enq_bits_mask,
  input         io_enq_bits_xcpt_pf_inst,
  input         io_enq_bits_xcpt_ae_inst,
  input  [63:0] io_enq_bits_ghist_old_history,
  input         io_enq_bits_ghist_current_saw_branch_not_taken,
  input         io_enq_bits_ghist_new_saw_branch_not_taken,
  input         io_enq_bits_ghist_new_saw_branch_taken,
  input  [4:0]  io_enq_bits_ghist_ras_idx,
  input  [1:0]  io_enq_bits_fsrc,
  input  [1:0]  io_enq_bits_tsrc,
  input         io_deq_ready,
  output        io_deq_valid,
  output [39:0] io_deq_bits_pc,
  output [63:0] io_deq_bits_data,
  output [3:0]  io_deq_bits_mask,
  output        io_deq_bits_xcpt_pf_inst,
  output        io_deq_bits_xcpt_ae_inst,
  output [63:0] io_deq_bits_ghist_old_history,
  output        io_deq_bits_ghist_current_saw_branch_not_taken,
  output        io_deq_bits_ghist_new_saw_branch_not_taken,
  output        io_deq_bits_ghist_new_saw_branch_taken,
  output [4:0]  io_deq_bits_ghist_ras_idx,
  output [1:0]  io_deq_bits_fsrc,
  output [1:0]  io_deq_bits_tsrc,
  output        io_count
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  reg [39:0] ram_pc [0:0]; // @[Decoupled.scala 218:16]
  wire [39:0] ram_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_pc_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [39:0] ram_pc_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_en; // @[Decoupled.scala 218:16]
  reg [63:0] ram_data [0:0]; // @[Decoupled.scala 218:16]
  wire [63:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [63:0] ram_data_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_data_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] ram_mask [0:0]; // @[Decoupled.scala 218:16]
  wire [3:0] ram_mask_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_mask_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [3:0] ram_mask_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_mask_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_mask_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_mask_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_xcpt_pf_inst [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_inst_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_inst_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_inst_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_inst_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_inst_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_inst_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_xcpt_ae_inst [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_inst_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_inst_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_inst_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_inst_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_inst_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_inst_MPORT_en; // @[Decoupled.scala 218:16]
  reg [63:0] ram_ghist_old_history [0:0]; // @[Decoupled.scala 218:16]
  wire [63:0] ram_ghist_old_history_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [63:0] ram_ghist_old_history_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_ghist_current_saw_branch_not_taken [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_ghist_new_saw_branch_not_taken [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_ghist_new_saw_branch_taken [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg [4:0] ram_ghist_ras_idx [0:0]; // @[Decoupled.scala 218:16]
  wire [4:0] ram_ghist_ras_idx_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [4:0] ram_ghist_ras_idx_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_MPORT_en; // @[Decoupled.scala 218:16]
  reg [1:0] ram_fsrc [0:0]; // @[Decoupled.scala 218:16]
  wire [1:0] ram_fsrc_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_fsrc_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [1:0] ram_fsrc_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_fsrc_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_fsrc_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_fsrc_MPORT_en; // @[Decoupled.scala 218:16]
  reg [1:0] ram_tsrc [0:0]; // @[Decoupled.scala 218:16]
  wire [1:0] ram_tsrc_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_tsrc_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [1:0] ram_tsrc_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_tsrc_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_tsrc_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_tsrc_MPORT_en; // @[Decoupled.scala 218:16]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 224:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  assign ram_pc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_pc_io_deq_bits_MPORT_data = ram_pc[ram_pc_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_pc_MPORT_data = io_enq_bits_pc;
  assign ram_pc_MPORT_addr = 1'h0;
  assign ram_pc_MPORT_mask = 1'h1;
  assign ram_pc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_data_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = 1'h0;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_mask_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_mask_io_deq_bits_MPORT_data = ram_mask[ram_mask_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_mask_MPORT_data = io_enq_bits_mask;
  assign ram_mask_MPORT_addr = 1'h0;
  assign ram_mask_MPORT_mask = 1'h1;
  assign ram_mask_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_xcpt_pf_inst_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_xcpt_pf_inst_io_deq_bits_MPORT_data = ram_xcpt_pf_inst[ram_xcpt_pf_inst_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_xcpt_pf_inst_MPORT_data = io_enq_bits_xcpt_pf_inst;
  assign ram_xcpt_pf_inst_MPORT_addr = 1'h0;
  assign ram_xcpt_pf_inst_MPORT_mask = 1'h1;
  assign ram_xcpt_pf_inst_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_xcpt_ae_inst_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_xcpt_ae_inst_io_deq_bits_MPORT_data = ram_xcpt_ae_inst[ram_xcpt_ae_inst_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_xcpt_ae_inst_MPORT_data = io_enq_bits_xcpt_ae_inst;
  assign ram_xcpt_ae_inst_MPORT_addr = 1'h0;
  assign ram_xcpt_ae_inst_MPORT_mask = 1'h1;
  assign ram_xcpt_ae_inst_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_old_history_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ghist_old_history_io_deq_bits_MPORT_data =
    ram_ghist_old_history[ram_ghist_old_history_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_old_history_MPORT_data = io_enq_bits_ghist_old_history;
  assign ram_ghist_old_history_MPORT_addr = 1'h0;
  assign ram_ghist_old_history_MPORT_mask = 1'h1;
  assign ram_ghist_old_history_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_data =
    ram_ghist_current_saw_branch_not_taken[ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_current_saw_branch_not_taken_MPORT_data = io_enq_bits_ghist_current_saw_branch_not_taken;
  assign ram_ghist_current_saw_branch_not_taken_MPORT_addr = 1'h0;
  assign ram_ghist_current_saw_branch_not_taken_MPORT_mask = 1'h1;
  assign ram_ghist_current_saw_branch_not_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_data =
    ram_ghist_new_saw_branch_not_taken[ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_new_saw_branch_not_taken_MPORT_data = io_enq_bits_ghist_new_saw_branch_not_taken;
  assign ram_ghist_new_saw_branch_not_taken_MPORT_addr = 1'h0;
  assign ram_ghist_new_saw_branch_not_taken_MPORT_mask = 1'h1;
  assign ram_ghist_new_saw_branch_not_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_data =
    ram_ghist_new_saw_branch_taken[ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_new_saw_branch_taken_MPORT_data = io_enq_bits_ghist_new_saw_branch_taken;
  assign ram_ghist_new_saw_branch_taken_MPORT_addr = 1'h0;
  assign ram_ghist_new_saw_branch_taken_MPORT_mask = 1'h1;
  assign ram_ghist_new_saw_branch_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_ras_idx_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ghist_ras_idx_io_deq_bits_MPORT_data = ram_ghist_ras_idx[ram_ghist_ras_idx_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_ras_idx_MPORT_data = io_enq_bits_ghist_ras_idx;
  assign ram_ghist_ras_idx_MPORT_addr = 1'h0;
  assign ram_ghist_ras_idx_MPORT_mask = 1'h1;
  assign ram_ghist_ras_idx_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_fsrc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_fsrc_io_deq_bits_MPORT_data = ram_fsrc[ram_fsrc_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_fsrc_MPORT_data = io_enq_bits_fsrc;
  assign ram_fsrc_MPORT_addr = 1'h0;
  assign ram_fsrc_MPORT_mask = 1'h1;
  assign ram_fsrc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_tsrc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_tsrc_io_deq_bits_MPORT_data = ram_tsrc[ram_tsrc_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_tsrc_MPORT_data = io_enq_bits_tsrc;
  assign ram_tsrc_MPORT_addr = 1'h0;
  assign ram_tsrc_MPORT_mask = 1'h1;
  assign ram_tsrc_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = io_deq_ready | empty; // @[Decoupled.scala 254:25 Decoupled.scala 254:40 Decoupled.scala 241:16]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits_pc = ram_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_mask = ram_mask_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_xcpt_pf_inst = ram_xcpt_pf_inst_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_xcpt_ae_inst = ram_xcpt_ae_inst_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_old_history = ram_ghist_old_history_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_current_saw_branch_not_taken = ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_new_saw_branch_not_taken = ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_new_saw_branch_taken = ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_ras_idx = ram_ghist_ras_idx_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_fsrc = ram_fsrc_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_tsrc = ram_tsrc_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_count = maybe_full; // @[Decoupled.scala 259:62]
  always @(posedge clock) begin
    if(ram_pc_MPORT_en & ram_pc_MPORT_mask) begin
      ram_pc[ram_pc_MPORT_addr] <= ram_pc_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_mask_MPORT_en & ram_mask_MPORT_mask) begin
      ram_mask[ram_mask_MPORT_addr] <= ram_mask_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_xcpt_pf_inst_MPORT_en & ram_xcpt_pf_inst_MPORT_mask) begin
      ram_xcpt_pf_inst[ram_xcpt_pf_inst_MPORT_addr] <= ram_xcpt_pf_inst_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_xcpt_ae_inst_MPORT_en & ram_xcpt_ae_inst_MPORT_mask) begin
      ram_xcpt_ae_inst[ram_xcpt_ae_inst_MPORT_addr] <= ram_xcpt_ae_inst_MPORT_data; // @[Decoupled.scala 218:16]
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
    if(ram_fsrc_MPORT_en & ram_fsrc_MPORT_mask) begin
      ram_fsrc[ram_fsrc_MPORT_addr] <= ram_fsrc_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_tsrc_MPORT_en & ram_tsrc_MPORT_mask) begin
      ram_tsrc[ram_tsrc_MPORT_addr] <= ram_tsrc_MPORT_data; // @[Decoupled.scala 218:16]
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
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_pc[initvar] = _RAND_0[39:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_data[initvar] = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_mask[initvar] = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_xcpt_pf_inst[initvar] = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_xcpt_ae_inst[initvar] = _RAND_4[0:0];
  _RAND_5 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ghist_old_history[initvar] = _RAND_5[63:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ghist_current_saw_branch_not_taken[initvar] = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ghist_new_saw_branch_not_taken[initvar] = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ghist_new_saw_branch_taken[initvar] = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ghist_ras_idx[initvar] = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_fsrc[initvar] = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_tsrc[initvar] = _RAND_11[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  maybe_full = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
