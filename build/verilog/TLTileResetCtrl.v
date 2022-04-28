module TLTileResetCtrl(
  input         clock,
  input         reset,
  input         auto_async_reset_sink_in_clock,
  input         auto_async_reset_sink_in_reset,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock,
  input         auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset,
  input         auto_tile_reset_provider_in_member_allClocks_implicit_clock_clock,
  input         auto_tile_reset_provider_in_member_allClocks_implicit_clock_reset,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock,
  output        auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset,
  output        auto_tile_reset_provider_out_member_allClocks_implicit_clock_clock,
  output        auto_tile_reset_provider_out_member_allClocks_implicit_clock_reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [8:0]  auto_in_a_bits_source,
  input  [20:0] auto_in_a_bits_address,
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
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [20:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
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
  wire  r_tile_resets_0_clock; // @[TileResetCtrl.scala 44:15]
  wire  r_tile_resets_0_reset; // @[TileResetCtrl.scala 44:15]
  wire  r_tile_resets_0_io_d; // @[TileResetCtrl.scala 44:15]
  wire  r_tile_resets_0_io_q; // @[TileResetCtrl.scala 44:15]
  wire  r_tile_resets_0_io_en; // @[TileResetCtrl.scala 44:15]
  wire  in_bits_read = auto_in_a_bits_opcode == 3'h4; // @[RegisterRouter.scala 68:36]
  wire [8:0] in_bits_index = auto_in_a_bits_address[11:3]; // @[RegisterRouter.scala 67:18 RegisterRouter.scala 69:19]
  wire [7:0] out_frontMask_lo_lo_lo = auto_in_a_bits_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_lo_lo_hi = auto_in_a_bits_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_lo_hi_lo = auto_in_a_bits_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_lo_hi_hi = auto_in_a_bits_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_hi_lo_lo = auto_in_a_bits_mask[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_hi_lo_hi = auto_in_a_bits_mask[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_hi_hi_lo = auto_in_a_bits_mask[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_hi_hi_hi = auto_in_a_bits_mask[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] out_frontMask = {out_frontMask_hi_hi_hi,out_frontMask_hi_hi_lo,out_frontMask_hi_lo_hi,
    out_frontMask_hi_lo_lo,out_frontMask_lo_hi_hi,out_frontMask_lo_hi_lo,out_frontMask_lo_lo_hi,out_frontMask_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  out_wimask = &out_frontMask[0]; // @[RegisterRouter.scala 79:24]
  wire  out_wivalid_0 = auto_in_a_valid & auto_in_d_ready & ~in_bits_read & in_bits_index == 9'h0; // @[RegisterRouter.scala 79:24]
  wire  _out_out_bits_data_T_4 = in_bits_index == 9'h0 & r_tile_resets_0_io_q; // @[RegisterRouter.scala 79:24]
  TLMonitor_52 monitor ( // @[Nodes.scala 24:25]
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
  AsyncResetRegVec_w1_i0_6 r_tile_resets_0 ( // @[TileResetCtrl.scala 44:15]
    .clock(r_tile_resets_0_clock),
    .reset(r_tile_resets_0_reset),
    .io_d(r_tile_resets_0_io_d),
    .io_q(r_tile_resets_0_io_q),
    .io_en(r_tile_resets_0_io_en)
  );
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock =
    auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset =
    auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock =
    auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset =
    auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock =
    auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset =
    auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock =
    auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset =
    auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock =
    auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset =
    auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock =
    auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset =
    auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_implicit_clock_clock =
    auto_tile_reset_provider_in_member_allClocks_implicit_clock_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tile_reset_provider_out_member_allClocks_implicit_clock_reset =
    auto_tile_reset_provider_in_member_allClocks_implicit_clock_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_in_a_ready = auto_in_d_ready; // @[RegisterRouter.scala 79:24]
  assign auto_in_d_valid = auto_in_a_valid; // @[RegisterRouter.scala 79:24]
  assign auto_in_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 94:19]
  assign auto_in_d_bits_param = 2'h0; // @[Edges.scala 755:17 Edges.scala 757:15]
  assign auto_in_d_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_in_d_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_in_d_bits_sink = 1'h0; // @[Edges.scala 755:17 Edges.scala 760:15]
  assign auto_in_d_bits_denied = 1'h0; // @[Edges.scala 755:17 Edges.scala 761:15]
  assign auto_in_d_bits_data = {{63'd0}, _out_out_bits_data_T_4}; // @[RegisterRouter.scala 79:24 RegisterRouter.scala 79:24]
  assign auto_in_d_bits_corrupt = 1'h0; // @[Edges.scala 755:17 Edges.scala 763:15]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_in_d_ready; // @[RegisterRouter.scala 79:24]
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
  assign monitor_io_in_d_valid = auto_in_a_valid; // @[RegisterRouter.scala 79:24]
  assign monitor_io_in_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 94:19]
  assign monitor_io_in_d_bits_param = 2'h0; // @[Edges.scala 755:17 Edges.scala 757:15]
  assign monitor_io_in_d_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_bits_sink = 1'h0; // @[Edges.scala 755:17 Edges.scala 760:15]
  assign monitor_io_in_d_bits_denied = 1'h0; // @[Edges.scala 755:17 Edges.scala 761:15]
  assign monitor_io_in_d_bits_data = {{63'd0}, _out_out_bits_data_T_4}; // @[RegisterRouter.scala 79:24 RegisterRouter.scala 79:24]
  assign monitor_io_in_d_bits_corrupt = 1'h0; // @[Edges.scala 755:17 Edges.scala 763:15]
  assign r_tile_resets_0_clock = clock;
  assign r_tile_resets_0_reset = auto_async_reset_sink_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign r_tile_resets_0_io_d = auto_in_a_bits_data[0]; // @[RegisterRouter.scala 79:24]
  assign r_tile_resets_0_io_en = out_wivalid_0 & out_wimask; // @[RegisterRouter.scala 79:24]
endmodule
