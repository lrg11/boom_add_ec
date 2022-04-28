module IntSyncSyncCrossingSink_1(
  input   clock,
  input   reset,
  input   auto_in_sync_0,
  output  auto_out_0
);
  assign auto_out_0 = auto_in_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
