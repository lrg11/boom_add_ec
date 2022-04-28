module BundleBridgeNexus_6(
  input   clock,
  input   reset,
  input   auto_in,
  output  auto_out
);
  assign auto_out = auto_in; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
