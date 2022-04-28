module FixedClockBroadcast_7(
  input   auto_in_clock,
  input   auto_in_reset,
  output  auto_out_clock,
  output  auto_out_reset
);
  assign auto_out_clock = auto_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_reset = auto_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
