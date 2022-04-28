module ClockGroupAggregator_6(
  input   auto_in_member_allClocks_subsystem_cbus_0_clock,
  input   auto_in_member_allClocks_subsystem_cbus_0_reset,
  input   auto_in_member_allClocks_subsystem_mbus_0_clock,
  input   auto_in_member_allClocks_subsystem_mbus_0_reset,
  input   auto_in_member_allClocks_subsystem_fbus_0_clock,
  input   auto_in_member_allClocks_subsystem_fbus_0_reset,
  input   auto_in_member_allClocks_subsystem_pbus_0_clock,
  input   auto_in_member_allClocks_subsystem_pbus_0_reset,
  input   auto_in_member_allClocks_subsystem_sbus_1_clock,
  input   auto_in_member_allClocks_subsystem_sbus_1_reset,
  input   auto_in_member_allClocks_subsystem_sbus_0_clock,
  input   auto_in_member_allClocks_subsystem_sbus_0_reset,
  input   auto_in_member_allClocks_implicit_clock_clock,
  input   auto_in_member_allClocks_implicit_clock_reset,
  output  auto_out_5_member_subsystem_cbus_subsystem_cbus_0_clock,
  output  auto_out_5_member_subsystem_cbus_subsystem_cbus_0_reset,
  output  auto_out_4_member_subsystem_mbus_subsystem_mbus_0_clock,
  output  auto_out_4_member_subsystem_mbus_subsystem_mbus_0_reset,
  output  auto_out_3_member_subsystem_fbus_subsystem_fbus_0_clock,
  output  auto_out_3_member_subsystem_fbus_subsystem_fbus_0_reset,
  output  auto_out_2_member_subsystem_pbus_subsystem_pbus_0_clock,
  output  auto_out_2_member_subsystem_pbus_subsystem_pbus_0_reset,
  output  auto_out_1_member_subsystem_sbus_subsystem_sbus_1_clock,
  output  auto_out_1_member_subsystem_sbus_subsystem_sbus_1_reset,
  output  auto_out_1_member_subsystem_sbus_subsystem_sbus_0_clock,
  output  auto_out_1_member_subsystem_sbus_subsystem_sbus_0_reset,
  output  auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_clock,
  output  auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_reset
);
  assign auto_out_5_member_subsystem_cbus_subsystem_cbus_0_clock = auto_in_member_allClocks_subsystem_cbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_5_member_subsystem_cbus_subsystem_cbus_0_reset = auto_in_member_allClocks_subsystem_cbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_4_member_subsystem_mbus_subsystem_mbus_0_clock = auto_in_member_allClocks_subsystem_mbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_4_member_subsystem_mbus_subsystem_mbus_0_reset = auto_in_member_allClocks_subsystem_mbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_3_member_subsystem_fbus_subsystem_fbus_0_clock = auto_in_member_allClocks_subsystem_fbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_3_member_subsystem_fbus_subsystem_fbus_0_reset = auto_in_member_allClocks_subsystem_fbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_2_member_subsystem_pbus_subsystem_pbus_0_clock = auto_in_member_allClocks_subsystem_pbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_2_member_subsystem_pbus_subsystem_pbus_0_reset = auto_in_member_allClocks_subsystem_pbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_member_subsystem_sbus_subsystem_sbus_1_clock = auto_in_member_allClocks_subsystem_sbus_1_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_member_subsystem_sbus_subsystem_sbus_1_reset = auto_in_member_allClocks_subsystem_sbus_1_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_member_subsystem_sbus_subsystem_sbus_0_clock = auto_in_member_allClocks_subsystem_sbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_member_subsystem_sbus_subsystem_sbus_0_reset = auto_in_member_allClocks_subsystem_sbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_clock =
    auto_in_member_allClocks_implicit_clock_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_reset =
    auto_in_member_allClocks_implicit_clock_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
