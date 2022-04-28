module TLPLIC(
  input         clock,
  input         reset,
  input         auto_int_in_0,
  output        auto_int_out_1_0,
  output        auto_int_out_0_0,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [8:0]  auto_in_a_bits_source,
  input  [27:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [1:0]  auto_in_d_bits_size,
  output [8:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt
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
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [27:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  gateways_gateway_clock; // @[Plic.scala 156:27]
  wire  gateways_gateway_reset; // @[Plic.scala 156:27]
  wire  gateways_gateway_io_interrupt; // @[Plic.scala 156:27]
  wire  gateways_gateway_io_plic_valid; // @[Plic.scala 156:27]
  wire  gateways_gateway_io_plic_ready; // @[Plic.scala 156:27]
  wire  gateways_gateway_io_plic_complete; // @[Plic.scala 156:27]
  wire  fanin_clock; // @[Plic.scala 184:25]
  wire  fanin_reset; // @[Plic.scala 184:25]
  wire  fanin_io_prio_0; // @[Plic.scala 184:25]
  wire  fanin_io_ip; // @[Plic.scala 184:25]
  wire  fanin_io_dev; // @[Plic.scala 184:25]
  wire  fanin_io_max; // @[Plic.scala 184:25]
  wire  fanin_1_clock; // @[Plic.scala 184:25]
  wire  fanin_1_reset; // @[Plic.scala 184:25]
  wire  fanin_1_io_prio_0; // @[Plic.scala 184:25]
  wire  fanin_1_io_ip; // @[Plic.scala 184:25]
  wire  fanin_1_io_dev; // @[Plic.scala 184:25]
  wire  fanin_1_io_max; // @[Plic.scala 184:25]
  wire  out_back_clock; // @[Decoupled.scala 296:21]
  wire  out_back_reset; // @[Decoupled.scala 296:21]
  wire  out_back_io_enq_ready; // @[Decoupled.scala 296:21]
  wire  out_back_io_enq_valid; // @[Decoupled.scala 296:21]
  wire  out_back_io_enq_bits_read; // @[Decoupled.scala 296:21]
  wire [22:0] out_back_io_enq_bits_index; // @[Decoupled.scala 296:21]
  wire [63:0] out_back_io_enq_bits_data; // @[Decoupled.scala 296:21]
  wire [7:0] out_back_io_enq_bits_mask; // @[Decoupled.scala 296:21]
  wire [8:0] out_back_io_enq_bits_extra_tlrr_extra_source; // @[Decoupled.scala 296:21]
  wire [1:0] out_back_io_enq_bits_extra_tlrr_extra_size; // @[Decoupled.scala 296:21]
  wire  out_back_io_deq_ready; // @[Decoupled.scala 296:21]
  wire  out_back_io_deq_valid; // @[Decoupled.scala 296:21]
  wire  out_back_io_deq_bits_read; // @[Decoupled.scala 296:21]
  wire [22:0] out_back_io_deq_bits_index; // @[Decoupled.scala 296:21]
  wire [63:0] out_back_io_deq_bits_data; // @[Decoupled.scala 296:21]
  wire [7:0] out_back_io_deq_bits_mask; // @[Decoupled.scala 296:21]
  wire [8:0] out_back_io_deq_bits_extra_tlrr_extra_source; // @[Decoupled.scala 296:21]
  wire [1:0] out_back_io_deq_bits_extra_tlrr_extra_size; // @[Decoupled.scala 296:21]
  wire  out_back_io_count; // @[Decoupled.scala 296:21]
  reg  priority_0; // @[Plic.scala 163:31]
  reg  threshold_0; // @[Plic.scala 166:31]
  reg  threshold_1; // @[Plic.scala 166:31]
  reg  pending_0; // @[Plic.scala 168:22]
  reg  enables_0_0; // @[Plic.scala 174:26]
  reg  enables_1_0; // @[Plic.scala 174:26]
  wire [1:0] enableVec0_0 = {enables_0_0,1'h0}; // @[Cat.scala 30:58]
  wire [1:0] enableVec0_1 = {enables_1_0,1'h0}; // @[Cat.scala 30:58]
  reg  maxDevs_0; // @[Plic.scala 181:22]
  reg  maxDevs_1; // @[Plic.scala 181:22]
  reg  bundleOut_0_0_REG; // @[Plic.scala 188:41]
  reg  bundleOut_1_0_REG; // @[Plic.scala 188:41]
  wire  out_oindex_hi_hi = out_back_io_deq_bits_index[18]; // @[RegisterRouter.scala 79:24]
  wire  out_oindex_hi_lo = out_back_io_deq_bits_index[10]; // @[RegisterRouter.scala 79:24]
  wire  out_oindex_lo_hi = out_back_io_deq_bits_index[9]; // @[RegisterRouter.scala 79:24]
  wire  out_oindex_lo_lo = out_back_io_deq_bits_index[4]; // @[RegisterRouter.scala 79:24]
  wire [3:0] out_oindex = {out_oindex_hi_hi,out_oindex_hi_lo,out_oindex_lo_hi,out_oindex_lo_lo}; // @[Cat.scala 30:58]
  wire [15:0] _out_backSel_T = 16'h1 << out_oindex; // @[OneHot.scala 58:35]
  wire  out_backSel_10 = _out_backSel_T[10]; // @[RegisterRouter.scala 79:24]
  wire [22:0] out_bindex = out_back_io_deq_bits_index & 23'h7bf9ef; // @[RegisterRouter.scala 79:24]
  wire  _out_T_9 = out_bindex == 23'h0; // @[RegisterRouter.scala 79:24]
  wire  out_roready_9 = out_back_io_deq_valid & auto_in_d_ready & out_back_io_deq_bits_read & out_backSel_10 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 79:24]
  wire [7:0] out_backMask_hi_hi_hi = out_back_io_deq_bits_mask[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_hi_hi_lo = out_back_io_deq_bits_mask[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_hi_lo_hi = out_back_io_deq_bits_mask[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_hi_lo_lo = out_back_io_deq_bits_mask[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_lo_hi_hi = out_back_io_deq_bits_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_lo_hi_lo = out_back_io_deq_bits_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_lo_lo_hi = out_back_io_deq_bits_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_lo_lo_lo = out_back_io_deq_bits_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] out_backMask = {out_backMask_hi_hi_hi,out_backMask_hi_hi_lo,out_backMask_hi_lo_hi,out_backMask_hi_lo_lo,
    out_backMask_lo_hi_hi,out_backMask_lo_hi_lo,out_backMask_lo_lo_hi,out_backMask_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  out_romask_9 = |out_backMask[63:32]; // @[RegisterRouter.scala 79:24]
  wire  out_f_roready_9 = out_roready_9 & out_romask_9; // @[RegisterRouter.scala 79:24]
  wire  out_backSel_8 = _out_backSel_T[8]; // @[RegisterRouter.scala 79:24]
  wire  out_roready_12 = out_back_io_deq_valid & auto_in_d_ready & out_back_io_deq_bits_read & out_backSel_8 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 79:24]
  wire  out_f_roready_12 = out_roready_12 & out_romask_9; // @[RegisterRouter.scala 79:24]
  wire [1:0] _T = {out_f_roready_9,out_f_roready_12}; // @[Plic.scala 245:21]
  wire [1:0] _T_3 = _T - 2'h1; // @[Plic.scala 245:46]
  wire [1:0] _T_4 = _T & _T_3; // @[Plic.scala 245:28]
  wire  claiming = out_f_roready_12 & maxDevs_0 | out_f_roready_9 & maxDevs_1; // @[Plic.scala 246:96]
  wire [1:0] _claimedDevs_T = 2'h1 << claiming; // @[OneHot.scala 65:12]
  wire  claimedDevs_1 = _claimedDevs_T[1]; // @[Plic.scala 247:58]
  wire  out_woready_9 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_10 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 79:24]
  wire  out_womask_9 = &out_backMask[63:32]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_9 = out_woready_9 & out_womask_9; // @[RegisterRouter.scala 79:24]
  wire  completerDev = out_back_io_deq_bits_data[32]; // @[package.scala 154:13]
  wire [1:0] _out_completer_1_T = enableVec0_1 >> completerDev; // @[Plic.scala 295:51]
  wire  completer_1 = out_f_woready_9 & _out_completer_1_T[0]; // @[Plic.scala 295:35]
  wire  out_woready_12 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_8 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_12 = out_woready_12 & out_womask_9; // @[RegisterRouter.scala 79:24]
  wire [1:0] _out_completer_0_T = enableVec0_0 >> completerDev; // @[Plic.scala 295:51]
  wire  completer_0 = out_f_woready_12 & _out_completer_0_T[0]; // @[Plic.scala 295:35]
  wire [1:0] _T_10 = {completer_1,completer_0}; // @[Plic.scala 262:23]
  wire [1:0] _T_13 = _T_10 - 2'h1; // @[Plic.scala 262:50]
  wire [1:0] _T_14 = _T_10 & _T_13; // @[Plic.scala 262:30]
  wire [1:0] _completedDevs_T_1 = 2'h1 << completerDev; // @[OneHot.scala 65:12]
  wire [1:0] completedDevs = completer_0 | completer_1 ? _completedDevs_T_1 : 2'h0; // @[Plic.scala 264:28]
  wire  out_womask = &out_backMask[0]; // @[RegisterRouter.scala 79:24]
  wire  out_backSel_4 = _out_backSel_T[4]; // @[RegisterRouter.scala 79:24]
  wire  out_woready_0 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_4 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 79:24]
  wire  out_womask_1 = &out_backMask[1]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_1 = out_woready_0 & out_womask_1; // @[RegisterRouter.scala 79:24]
  wire  out_womask_2 = &out_backMask[32]; // @[RegisterRouter.scala 79:24]
  wire  out_backSel_0 = _out_backSel_T[0]; // @[RegisterRouter.scala 79:24]
  wire  out_woready_2 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_0 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_2 = out_woready_2 & out_womask_2; // @[RegisterRouter.scala 79:24]
  wire [32:0] out_prepend_1 = {priority_0,32'h0}; // @[Cat.scala 30:58]
  wire  out_backSel_5 = _out_backSel_T[5]; // @[RegisterRouter.scala 79:24]
  wire  out_woready_3 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_5 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_4 = out_woready_3 & out_womask_1; // @[RegisterRouter.scala 79:24]
  wire [1:0] out_prepend_3 = {pending_0,1'h0}; // @[Cat.scala 30:58]
  wire  out_f_woready_7 = out_woready_9 & out_womask; // @[RegisterRouter.scala 79:24]
  wire [1:0] out_prepend_4 = {1'h0,threshold_1}; // @[Cat.scala 30:58]
  wire [31:0] out_prepend_lo_5 = {{30'd0}, out_prepend_4}; // @[RegisterRouter.scala 79:24]
  wire [32:0] out_prepend_5 = {maxDevs_1,out_prepend_lo_5}; // @[Cat.scala 30:58]
  wire [63:0] _out_T_115 = {{31'd0}, out_prepend_5}; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_10 = out_woready_12 & out_womask; // @[RegisterRouter.scala 79:24]
  wire [1:0] out_prepend_6 = {1'h0,threshold_0}; // @[Cat.scala 30:58]
  wire [31:0] out_prepend_lo_7 = {{30'd0}, out_prepend_6}; // @[RegisterRouter.scala 79:24]
  wire [32:0] out_prepend_7 = {maxDevs_0,out_prepend_lo_7}; // @[Cat.scala 30:58]
  wire [63:0] _out_T_151 = {{31'd0}, out_prepend_7}; // @[RegisterRouter.scala 79:24]
  wire  _out_out_bits_data_T = 4'h0 == out_oindex; // @[Conditional.scala 37:30]
  wire  _out_out_bits_data_T_1 = 4'h2 == out_oindex; // @[Conditional.scala 37:30]
  wire  _out_out_bits_data_T_2 = 4'h4 == out_oindex; // @[Conditional.scala 37:30]
  wire  _out_out_bits_data_T_3 = 4'h5 == out_oindex; // @[Conditional.scala 37:30]
  wire  _out_out_bits_data_T_4 = 4'h8 == out_oindex; // @[Conditional.scala 37:30]
  wire  _out_out_bits_data_T_5 = 4'ha == out_oindex; // @[Conditional.scala 37:30]
  wire  _GEN_70 = _out_out_bits_data_T_5 ? _out_T_9 : 1'h1; // @[Conditional.scala 39:67 MuxLiteral.scala 53:32]
  wire  _GEN_71 = _out_out_bits_data_T_4 ? _out_T_9 : _GEN_70; // @[Conditional.scala 39:67 MuxLiteral.scala 53:32]
  wire  _GEN_72 = _out_out_bits_data_T_3 ? _out_T_9 : _GEN_71; // @[Conditional.scala 39:67 MuxLiteral.scala 53:32]
  wire  _GEN_73 = _out_out_bits_data_T_2 ? _out_T_9 : _GEN_72; // @[Conditional.scala 39:67 MuxLiteral.scala 53:32]
  wire  _GEN_74 = _out_out_bits_data_T_1 ? _out_T_9 : _GEN_73; // @[Conditional.scala 39:67 MuxLiteral.scala 53:32]
  wire  out_out_bits_data_out = _out_out_bits_data_T ? _out_T_9 : _GEN_74; // @[Conditional.scala 40:58 MuxLiteral.scala 53:32]
  wire [63:0] _GEN_76 = _out_out_bits_data_T_5 ? _out_T_115 : 64'h0; // @[Conditional.scala 39:67 MuxLiteral.scala 53:32]
  wire [63:0] _GEN_77 = _out_out_bits_data_T_4 ? _out_T_151 : _GEN_76; // @[Conditional.scala 39:67 MuxLiteral.scala 53:32]
  wire [63:0] _GEN_78 = _out_out_bits_data_T_3 ? {{62'd0}, enableVec0_1} : _GEN_77; // @[Conditional.scala 39:67 MuxLiteral.scala 53:32]
  wire [63:0] _GEN_79 = _out_out_bits_data_T_2 ? {{62'd0}, enableVec0_0} : _GEN_78; // @[Conditional.scala 39:67 MuxLiteral.scala 53:32]
  wire [63:0] _GEN_80 = _out_out_bits_data_T_1 ? {{62'd0}, out_prepend_3} : _GEN_79; // @[Conditional.scala 39:67 MuxLiteral.scala 53:32]
  wire [63:0] out_out_bits_data_out_1 = _out_out_bits_data_T ? {{31'd0}, out_prepend_1} : _GEN_80; // @[Conditional.scala 40:58 MuxLiteral.scala 53:32]
  wire  out_bits_read = out_back_io_deq_bits_read; // @[RegisterRouter.scala 79:24 RegisterRouter.scala 79:24]
  TLMonitor_39 monitor ( // @[Nodes.scala 24:25]
    .clock(monitor_clock),
    .reset(monitor_reset),
    .io_in_a_ready(monitor_io_in_a_ready),
    .io_in_a_valid(monitor_io_in_a_valid),
    .io_in_a_bits_opcode(monitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(monitor_io_in_a_bits_param),
    .io_in_a_bits_size(monitor_io_in_a_bits_size),
    .io_in_a_bits_source(monitor_io_in_a_bits_source),
    .io_in_a_bits_address(monitor_io_in_a_bits_address),
    .io_in_a_bits_mask(monitor_io_in_a_bits_mask),
    .io_in_a_bits_data(monitor_io_in_a_bits_data),
    .io_in_a_bits_corrupt(monitor_io_in_a_bits_corrupt),
    .io_in_d_ready(monitor_io_in_d_ready),
    .io_in_d_valid(monitor_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(monitor_io_in_d_bits_param),
    .io_in_d_bits_size(monitor_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_io_in_d_bits_source),
    .io_in_d_bits_sink(monitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(monitor_io_in_d_bits_denied),
    .io_in_d_bits_data(monitor_io_in_d_bits_data),
    .io_in_d_bits_corrupt(monitor_io_in_d_bits_corrupt)
  );
  LevelGateway gateways_gateway ( // @[Plic.scala 156:27]
    .clock(gateways_gateway_clock),
    .reset(gateways_gateway_reset),
    .io_interrupt(gateways_gateway_io_interrupt),
    .io_plic_valid(gateways_gateway_io_plic_valid),
    .io_plic_ready(gateways_gateway_io_plic_ready),
    .io_plic_complete(gateways_gateway_io_plic_complete)
  );
  PLICFanIn fanin ( // @[Plic.scala 184:25]
    .clock(fanin_clock),
    .reset(fanin_reset),
    .io_prio_0(fanin_io_prio_0),
    .io_ip(fanin_io_ip),
    .io_dev(fanin_io_dev),
    .io_max(fanin_io_max)
  );
  PLICFanIn fanin_1 ( // @[Plic.scala 184:25]
    .clock(fanin_1_clock),
    .reset(fanin_1_reset),
    .io_prio_0(fanin_1_io_prio_0),
    .io_ip(fanin_1_io_ip),
    .io_dev(fanin_1_io_dev),
    .io_max(fanin_1_io_max)
  );
  Queue_30 out_back ( // @[Decoupled.scala 296:21]
    .clock(out_back_clock),
    .reset(out_back_reset),
    .io_enq_ready(out_back_io_enq_ready),
    .io_enq_valid(out_back_io_enq_valid),
    .io_enq_bits_read(out_back_io_enq_bits_read),
    .io_enq_bits_index(out_back_io_enq_bits_index),
    .io_enq_bits_data(out_back_io_enq_bits_data),
    .io_enq_bits_mask(out_back_io_enq_bits_mask),
    .io_enq_bits_extra_tlrr_extra_source(out_back_io_enq_bits_extra_tlrr_extra_source),
    .io_enq_bits_extra_tlrr_extra_size(out_back_io_enq_bits_extra_tlrr_extra_size),
    .io_deq_ready(out_back_io_deq_ready),
    .io_deq_valid(out_back_io_deq_valid),
    .io_deq_bits_read(out_back_io_deq_bits_read),
    .io_deq_bits_index(out_back_io_deq_bits_index),
    .io_deq_bits_data(out_back_io_deq_bits_data),
    .io_deq_bits_mask(out_back_io_deq_bits_mask),
    .io_deq_bits_extra_tlrr_extra_source(out_back_io_deq_bits_extra_tlrr_extra_source),
    .io_deq_bits_extra_tlrr_extra_size(out_back_io_deq_bits_extra_tlrr_extra_size),
    .io_count(out_back_io_count)
  );
  assign auto_int_out_1_0 = bundleOut_1_0_REG > threshold_1; // @[Plic.scala 188:63]
  assign auto_int_out_0_0 = bundleOut_0_0_REG > threshold_0; // @[Plic.scala 188:63]
  assign auto_in_a_ready = out_back_io_enq_ready; // @[RegisterRouter.scala 79:24 Decoupled.scala 299:17]
  assign auto_in_d_valid = out_back_io_deq_valid; // @[RegisterRouter.scala 79:24]
  assign auto_in_d_bits_opcode = {{2'd0}, out_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 94:19]
  assign auto_in_d_bits_param = 2'h0; // @[Edges.scala 755:17 Edges.scala 757:15]
  assign auto_in_d_bits_size = out_back_io_deq_bits_extra_tlrr_extra_size; // @[RegisterRouter.scala 79:24 RegisterRouter.scala 79:24]
  assign auto_in_d_bits_source = out_back_io_deq_bits_extra_tlrr_extra_source; // @[RegisterRouter.scala 79:24 RegisterRouter.scala 79:24]
  assign auto_in_d_bits_sink = 1'h0; // @[Edges.scala 755:17 Edges.scala 760:15]
  assign auto_in_d_bits_denied = 1'h0; // @[Edges.scala 755:17 Edges.scala 761:15]
  assign auto_in_d_bits_data = out_out_bits_data_out ? out_out_bits_data_out_1 : 64'h0; // @[RegisterRouter.scala 79:24]
  assign auto_in_d_bits_corrupt = 1'h0; // @[Edges.scala 755:17 Edges.scala 763:15]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = out_back_io_enq_ready; // @[RegisterRouter.scala 79:24 Decoupled.scala 299:17]
  assign monitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = out_back_io_deq_valid; // @[RegisterRouter.scala 79:24]
  assign monitor_io_in_d_bits_opcode = {{2'd0}, out_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 94:19]
  assign monitor_io_in_d_bits_param = 2'h0; // @[Edges.scala 755:17 Edges.scala 757:15]
  assign monitor_io_in_d_bits_size = out_back_io_deq_bits_extra_tlrr_extra_size; // @[RegisterRouter.scala 79:24 RegisterRouter.scala 79:24]
  assign monitor_io_in_d_bits_source = out_back_io_deq_bits_extra_tlrr_extra_source; // @[RegisterRouter.scala 79:24 RegisterRouter.scala 79:24]
  assign monitor_io_in_d_bits_sink = 1'h0; // @[Edges.scala 755:17 Edges.scala 760:15]
  assign monitor_io_in_d_bits_denied = 1'h0; // @[Edges.scala 755:17 Edges.scala 761:15]
  assign monitor_io_in_d_bits_data = out_out_bits_data_out ? out_out_bits_data_out_1 : 64'h0; // @[RegisterRouter.scala 79:24]
  assign monitor_io_in_d_bits_corrupt = 1'h0; // @[Edges.scala 755:17 Edges.scala 763:15]
  assign gateways_gateway_clock = clock;
  assign gateways_gateway_reset = reset;
  assign gateways_gateway_io_interrupt = auto_int_in_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign gateways_gateway_io_plic_ready = ~pending_0; // @[Plic.scala 250:18]
  assign gateways_gateway_io_plic_complete = completedDevs[1]; // @[Plic.scala 265:33]
  assign fanin_clock = clock;
  assign fanin_reset = reset;
  assign fanin_io_prio_0 = priority_0; // @[Plic.scala 185:21]
  assign fanin_io_ip = enables_0_0 & pending_0; // @[Plic.scala 186:40]
  assign fanin_1_clock = clock;
  assign fanin_1_reset = reset;
  assign fanin_1_io_prio_0 = priority_0; // @[Plic.scala 185:21]
  assign fanin_1_io_ip = enables_1_0 & pending_0; // @[Plic.scala 186:40]
  assign out_back_clock = clock;
  assign out_back_reset = reset;
  assign out_back_io_enq_valid = auto_in_a_valid; // @[RegisterRouter.scala 79:24]
  assign out_back_io_enq_bits_read = auto_in_a_bits_opcode == 3'h4; // @[RegisterRouter.scala 68:36]
  assign out_back_io_enq_bits_index = auto_in_a_bits_address[25:3]; // @[RegisterRouter.scala 67:18 RegisterRouter.scala 69:19]
  assign out_back_io_enq_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign out_back_io_enq_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign out_back_io_enq_bits_extra_tlrr_extra_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign out_back_io_enq_bits_extra_tlrr_extra_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign out_back_io_deq_ready = auto_in_d_ready; // @[RegisterRouter.scala 79:24]
  always @(posedge clock) begin
    if (out_f_woready_2) begin // @[RegField.scala 74:88]
      priority_0 <= out_back_io_deq_bits_data[32]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_10) begin // @[RegField.scala 74:88]
      threshold_0 <= out_back_io_deq_bits_data[0]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_7) begin // @[RegField.scala 74:88]
      threshold_1 <= out_back_io_deq_bits_data[0]; // @[RegField.scala 74:92]
    end
    if (reset) begin // @[Plic.scala 168:22]
      pending_0 <= 1'h0; // @[Plic.scala 168:22]
    end else if (claimedDevs_1 | gateways_gateway_io_plic_valid) begin // @[Plic.scala 251:27]
      pending_0 <= ~claimedDevs_1; // @[Plic.scala 251:31]
    end
    if (out_f_woready_1) begin // @[RegField.scala 74:88]
      enables_0_0 <= out_back_io_deq_bits_data[1]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_4) begin // @[RegField.scala 74:88]
      enables_1_0 <= out_back_io_deq_bits_data[1]; // @[RegField.scala 74:92]
    end
    maxDevs_0 <= fanin_io_dev; // @[Plic.scala 187:21]
    maxDevs_1 <= fanin_1_io_dev; // @[Plic.scala 187:21]
    bundleOut_0_0_REG <= fanin_io_max; // @[Plic.scala 188:41]
    bundleOut_1_0_REG <= fanin_1_io_max; // @[Plic.scala 188:41]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_4 == 2'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Plic.scala:245 assert((claimer.asUInt & (claimer.asUInt - UInt(1))) === UInt(0)) // One-Hot\n"
            ); // @[Plic.scala 245:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_4 == 2'h0 | reset)) begin
          $fatal; // @[Plic.scala 245:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_14 == 2'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Plic.scala:262 assert((completer.asUInt & (completer.asUInt - UInt(1))) === UInt(0)) // One-Hot\n"
            ); // @[Plic.scala 262:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_14 == 2'h0 | reset)) begin
          $fatal; // @[Plic.scala 262:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(completerDev == completerDev | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: completerDev should be consistent for all harts\n    at Plic.scala:292 assert(completerDev === data.extract(log2Ceil(nDevices+1)-1, 0),\n"
            ); // @[Plic.scala 292:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(completerDev == completerDev | reset)) begin
          $fatal; // @[Plic.scala 292:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(completerDev == completerDev | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: completerDev should be consistent for all harts\n    at Plic.scala:292 assert(completerDev === data.extract(log2Ceil(nDevices+1)-1, 0),\n"
            ); // @[Plic.scala 292:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(completerDev == completerDev | reset)) begin
          $fatal; // @[Plic.scala 292:19]
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
  _RAND_0 = {1{`RANDOM}};
  priority_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  threshold_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  threshold_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  pending_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  enables_0_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  enables_1_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  maxDevs_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  maxDevs_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  bundleOut_0_0_REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  bundleOut_1_0_REG = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
