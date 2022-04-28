module DividerOnlyClockGenerator(
  input   auto_divider_only_clk_generator_in_clock,
  input   auto_divider_only_clk_generator_in_reset,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_clock,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_reset,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_clock,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_reset,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_clock,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_reset,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_clock,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_reset,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_clock,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_reset,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_clock,
  output  auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_reset,
  output  auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_clock,
  output  auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_reset
);
  wire  bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_out; // @[DividerOnlyClockGenerator.scala 133:27]
  wire  bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_in; // @[DividerOnlyClockGenerator.scala 133:27]
  ClockDividerN #(.DIV(1)) bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1 ( // @[DividerOnlyClockGenerator.scala 133:27]
    .clk_out(bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_out),
    .clk_in(bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_in)
  );
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_clock =
    bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_out; // @[Nodes.scala 1207:84 DividerOnlyClockGenerator.scala 142:19]
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_reset =
    auto_divider_only_clk_generator_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_clock =
    bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_out; // @[Nodes.scala 1207:84 DividerOnlyClockGenerator.scala 142:19]
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_reset =
    auto_divider_only_clk_generator_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_clock =
    bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_out; // @[Nodes.scala 1207:84 DividerOnlyClockGenerator.scala 142:19]
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_reset =
    auto_divider_only_clk_generator_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_clock =
    bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_out; // @[Nodes.scala 1207:84 DividerOnlyClockGenerator.scala 142:19]
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_reset =
    auto_divider_only_clk_generator_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_clock =
    bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_out; // @[Nodes.scala 1207:84 DividerOnlyClockGenerator.scala 142:19]
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_reset =
    auto_divider_only_clk_generator_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_clock =
    bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_out; // @[Nodes.scala 1207:84 DividerOnlyClockGenerator.scala 142:19]
  assign auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_reset =
    auto_divider_only_clk_generator_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_clock =
    bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_out; // @[Nodes.scala 1207:84 DividerOnlyClockGenerator.scala 142:19]
  assign auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_reset =
    auto_divider_only_clk_generator_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_member_allClocks_implicit_clock_clock_ClockDivideBy1_clk_in =
    auto_divider_only_clk_generator_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
