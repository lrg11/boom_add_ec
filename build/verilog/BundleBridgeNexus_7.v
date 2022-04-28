module BundleBridgeNexus_7(
  input         clock,
  input         reset,
  input  [31:0] auto_in,
  output [31:0] auto_out_1,
  output [31:0] auto_out_0
);
  assign auto_out_1 = auto_in; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0 = auto_in; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
