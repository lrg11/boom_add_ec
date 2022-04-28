module BundleBridgeNexus_17(
  input         clock,
  input         reset,
  input  [31:0] auto_in,
  output [31:0] auto_out
);
  assign auto_out = auto_in; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
