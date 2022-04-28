module SynchronizerShiftReg_w1_d3(
  input   clock,
  input   reset,
  input   io_d,
  output  io_q
);
  wire  output_chain_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_reset; // @[ShiftReg.scala 45:23]
  wire  output_chain_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_io_q; // @[ShiftReg.scala 45:23]
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_clock),
    .reset(output_chain_reset),
    .io_d(output_chain_io_d),
    .io_q(output_chain_io_q)
  );
  assign io_q = output_chain_io_q; // @[ShiftReg.scala 48:24 ShiftReg.scala 48:24]
  assign output_chain_clock = clock;
  assign output_chain_reset = reset;
  assign output_chain_io_d = io_d; // @[SynchronizerReg.scala 173:39]
endmodule
