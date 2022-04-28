module ClockSinkDomain_4(
  input         auto_resetCtrl_async_reset_sink_in_clock,
  input         auto_resetCtrl_async_reset_sink_in_reset,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock,
  input         auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock,
  output        auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset,
  output        auto_resetCtrl_in_a_ready,
  input         auto_resetCtrl_in_a_valid,
  input  [2:0]  auto_resetCtrl_in_a_bits_opcode,
  input  [2:0]  auto_resetCtrl_in_a_bits_param,
  input  [1:0]  auto_resetCtrl_in_a_bits_size,
  input  [8:0]  auto_resetCtrl_in_a_bits_source,
  input  [20:0] auto_resetCtrl_in_a_bits_address,
  input  [7:0]  auto_resetCtrl_in_a_bits_mask,
  input  [63:0] auto_resetCtrl_in_a_bits_data,
  input         auto_resetCtrl_in_a_bits_corrupt,
  input         auto_resetCtrl_in_d_ready,
  output        auto_resetCtrl_in_d_valid,
  output [2:0]  auto_resetCtrl_in_d_bits_opcode,
  output [1:0]  auto_resetCtrl_in_d_bits_param,
  output [1:0]  auto_resetCtrl_in_d_bits_size,
  output [8:0]  auto_resetCtrl_in_d_bits_source,
  output        auto_resetCtrl_in_d_bits_sink,
  output        auto_resetCtrl_in_d_bits_denied,
  output [63:0] auto_resetCtrl_in_d_bits_data,
  output        auto_resetCtrl_in_d_bits_corrupt,
  input         auto_clock_in_clock,
  input         auto_clock_in_reset,
  output        clock,
  output        reset
);
  wire  resetCtrl_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_async_reset_sink_in_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_async_reset_sink_in_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_implicit_clock_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_in_member_allClocks_implicit_clock_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_implicit_clock_clock; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_tile_reset_provider_out_member_allClocks_implicit_clock_reset; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_in_a_ready; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_in_a_valid; // @[TileResetCtrl.scala 26:17]
  wire [2:0] resetCtrl_auto_in_a_bits_opcode; // @[TileResetCtrl.scala 26:17]
  wire [2:0] resetCtrl_auto_in_a_bits_param; // @[TileResetCtrl.scala 26:17]
  wire [1:0] resetCtrl_auto_in_a_bits_size; // @[TileResetCtrl.scala 26:17]
  wire [8:0] resetCtrl_auto_in_a_bits_source; // @[TileResetCtrl.scala 26:17]
  wire [20:0] resetCtrl_auto_in_a_bits_address; // @[TileResetCtrl.scala 26:17]
  wire [7:0] resetCtrl_auto_in_a_bits_mask; // @[TileResetCtrl.scala 26:17]
  wire [63:0] resetCtrl_auto_in_a_bits_data; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_in_a_bits_corrupt; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_in_d_ready; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_in_d_valid; // @[TileResetCtrl.scala 26:17]
  wire [2:0] resetCtrl_auto_in_d_bits_opcode; // @[TileResetCtrl.scala 26:17]
  wire [1:0] resetCtrl_auto_in_d_bits_param; // @[TileResetCtrl.scala 26:17]
  wire [1:0] resetCtrl_auto_in_d_bits_size; // @[TileResetCtrl.scala 26:17]
  wire [8:0] resetCtrl_auto_in_d_bits_source; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_in_d_bits_sink; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_in_d_bits_denied; // @[TileResetCtrl.scala 26:17]
  wire [63:0] resetCtrl_auto_in_d_bits_data; // @[TileResetCtrl.scala 26:17]
  wire  resetCtrl_auto_in_d_bits_corrupt; // @[TileResetCtrl.scala 26:17]
  TLTileResetCtrl resetCtrl ( // @[TileResetCtrl.scala 26:17]
    .clock(resetCtrl_clock),
    .reset(resetCtrl_reset),
    .auto_async_reset_sink_in_clock(resetCtrl_auto_async_reset_sink_in_clock),
    .auto_async_reset_sink_in_reset(resetCtrl_auto_async_reset_sink_in_reset),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock),
    .auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset),
    .auto_tile_reset_provider_in_member_allClocks_implicit_clock_clock(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_implicit_clock_clock),
    .auto_tile_reset_provider_in_member_allClocks_implicit_clock_reset(
      resetCtrl_auto_tile_reset_provider_in_member_allClocks_implicit_clock_reset),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset),
    .auto_tile_reset_provider_out_member_allClocks_implicit_clock_clock(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_implicit_clock_clock),
    .auto_tile_reset_provider_out_member_allClocks_implicit_clock_reset(
      resetCtrl_auto_tile_reset_provider_out_member_allClocks_implicit_clock_reset),
    .auto_in_a_ready(resetCtrl_auto_in_a_ready),
    .auto_in_a_valid(resetCtrl_auto_in_a_valid),
    .auto_in_a_bits_opcode(resetCtrl_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(resetCtrl_auto_in_a_bits_param),
    .auto_in_a_bits_size(resetCtrl_auto_in_a_bits_size),
    .auto_in_a_bits_source(resetCtrl_auto_in_a_bits_source),
    .auto_in_a_bits_address(resetCtrl_auto_in_a_bits_address),
    .auto_in_a_bits_mask(resetCtrl_auto_in_a_bits_mask),
    .auto_in_a_bits_data(resetCtrl_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(resetCtrl_auto_in_a_bits_corrupt),
    .auto_in_d_ready(resetCtrl_auto_in_d_ready),
    .auto_in_d_valid(resetCtrl_auto_in_d_valid),
    .auto_in_d_bits_opcode(resetCtrl_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(resetCtrl_auto_in_d_bits_param),
    .auto_in_d_bits_size(resetCtrl_auto_in_d_bits_size),
    .auto_in_d_bits_source(resetCtrl_auto_in_d_bits_source),
    .auto_in_d_bits_sink(resetCtrl_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(resetCtrl_auto_in_d_bits_denied),
    .auto_in_d_bits_data(resetCtrl_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(resetCtrl_auto_in_d_bits_corrupt)
  );
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_implicit_clock_clock; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset =
    resetCtrl_auto_tile_reset_provider_out_member_allClocks_implicit_clock_reset; // @[LazyModule.scala 311:12]
  assign auto_resetCtrl_in_a_ready = resetCtrl_auto_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_resetCtrl_in_d_valid = resetCtrl_auto_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_resetCtrl_in_d_bits_opcode = resetCtrl_auto_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_resetCtrl_in_d_bits_param = resetCtrl_auto_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_resetCtrl_in_d_bits_size = resetCtrl_auto_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_resetCtrl_in_d_bits_source = resetCtrl_auto_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_resetCtrl_in_d_bits_sink = resetCtrl_auto_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_resetCtrl_in_d_bits_denied = resetCtrl_auto_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_resetCtrl_in_d_bits_data = resetCtrl_auto_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_resetCtrl_in_d_bits_corrupt = resetCtrl_auto_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign resetCtrl_clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign resetCtrl_reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign resetCtrl_auto_async_reset_sink_in_clock = auto_resetCtrl_async_reset_sink_in_clock; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_async_reset_sink_in_reset = auto_resetCtrl_async_reset_sink_in_reset; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_implicit_clock_clock =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_tile_reset_provider_in_member_allClocks_implicit_clock_reset =
    auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_in_a_valid = auto_resetCtrl_in_a_valid; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_in_a_bits_opcode = auto_resetCtrl_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_in_a_bits_param = auto_resetCtrl_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_in_a_bits_size = auto_resetCtrl_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_in_a_bits_source = auto_resetCtrl_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_in_a_bits_address = auto_resetCtrl_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_in_a_bits_mask = auto_resetCtrl_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_in_a_bits_data = auto_resetCtrl_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_in_a_bits_corrupt = auto_resetCtrl_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign resetCtrl_auto_in_d_ready = auto_resetCtrl_in_d_ready; // @[LazyModule.scala 309:16]
endmodule
