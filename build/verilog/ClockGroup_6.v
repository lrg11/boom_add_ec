module ClockGroup_6(
  input   auto_in_member_dividerOnlyClockGenerator_implicit_clock_clock,
  input   auto_in_member_dividerOnlyClockGenerator_implicit_clock_reset,
  output  auto_out_clock,
  output  auto_out_reset
);
  assign auto_out_clock = auto_in_member_dividerOnlyClockGenerator_implicit_clock_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_reset = auto_in_member_dividerOnlyClockGenerator_implicit_clock_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
