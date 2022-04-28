module FixedClockBroadcast(
  input   auto_in_clock,
  input   auto_in_reset,
  output  auto_out_2_clock,
  output  auto_out_2_reset,
  output  auto_out_1_clock,
  output  auto_out_1_reset,
  output  auto_out_0_clock,
  output  auto_out_0_reset
);
  assign auto_out_2_clock = auto_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_2_reset = auto_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_clock = auto_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_reset = auto_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_clock = auto_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_reset = auto_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
