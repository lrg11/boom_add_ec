module ResetCatchAndSync_d3(
  input   clock,
  input   reset,
  output  io_sync_reset,
  input   io_psd_test_mode,
  input   io_psd_test_mode_reset
);
  wire  io_sync_reset_chain_clock; // @[ShiftReg.scala 45:23]
  wire  io_sync_reset_chain_reset; // @[ShiftReg.scala 45:23]
  wire  io_sync_reset_chain_io_d; // @[ShiftReg.scala 45:23]
  wire  io_sync_reset_chain_io_q; // @[ShiftReg.scala 45:23]
  wire  _io_sync_reset_WIRE = io_sync_reset_chain_io_q; // @[ShiftReg.scala 48:24 ShiftReg.scala 48:24]
  wire  _io_sync_reset_T = ~_io_sync_reset_WIRE; // @[ResetCatchAndSync.scala 29:7]
  AsyncResetSynchronizerShiftReg_w1_d3_i0 io_sync_reset_chain ( // @[ShiftReg.scala 45:23]
    .clock(io_sync_reset_chain_clock),
    .reset(io_sync_reset_chain_reset),
    .io_d(io_sync_reset_chain_io_d),
    .io_q(io_sync_reset_chain_io_q)
  );
  assign io_sync_reset = io_psd_test_mode ? io_psd_test_mode_reset : _io_sync_reset_T; // @[ResetCatchAndSync.scala 28:25]
  assign io_sync_reset_chain_clock = clock;
  assign io_sync_reset_chain_reset = io_psd_test_mode ? io_psd_test_mode_reset : reset; // @[ResetCatchAndSync.scala 26:27]
  assign io_sync_reset_chain_io_d = 1'h1; // @[ShiftReg.scala 47:16]
endmodule
