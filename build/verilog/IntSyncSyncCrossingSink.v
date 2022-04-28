module IntSyncSyncCrossingSink(
  input   clock,
  input   reset,
  input   auto_in_sync_0,
  input   auto_in_sync_1,
  output  auto_out_0,
  output  auto_out_1
);
  assign auto_out_0 = auto_in_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1 = auto_in_sync_1; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
