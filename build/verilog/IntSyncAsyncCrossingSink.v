module IntSyncAsyncCrossingSink(
  input   clock,
  input   reset,
  input   auto_in_sync_0,
  output  auto_out_0
);
  wire  chain_clock; // @[ShiftReg.scala 45:23]
  wire  chain_reset; // @[ShiftReg.scala 45:23]
  wire  chain_io_d; // @[ShiftReg.scala 45:23]
  wire  chain_io_q; // @[ShiftReg.scala 45:23]
  SynchronizerShiftReg_w1_d3 chain ( // @[ShiftReg.scala 45:23]
    .clock(chain_clock),
    .reset(chain_reset),
    .io_d(chain_io_d),
    .io_q(chain_io_q)
  );
  assign auto_out_0 = chain_io_q; // @[ShiftReg.scala 48:24]
  assign chain_clock = clock;
  assign chain_reset = reset;
  assign chain_io_d = auto_in_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
