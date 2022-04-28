module AsyncResetSynchronizerShiftReg_w4_d3_i0(
  input        clock,
  input        reset,
  input  [3:0] io_d,
  output [3:0] io_q
);
  wire  output_chain_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_reset; // @[ShiftReg.scala 45:23]
  wire  output_chain_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_io_q; // @[ShiftReg.scala 45:23]
  wire  output_chain_1_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_1_reset; // @[ShiftReg.scala 45:23]
  wire  output_chain_1_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_1_io_q; // @[ShiftReg.scala 45:23]
  wire  output_chain_2_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_2_reset; // @[ShiftReg.scala 45:23]
  wire  output_chain_2_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_2_io_q; // @[ShiftReg.scala 45:23]
  wire  output_chain_3_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_3_reset; // @[ShiftReg.scala 45:23]
  wire  output_chain_3_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_3_io_q; // @[ShiftReg.scala 45:23]
  wire  output_1 = output_chain_1_io_q; // @[ShiftReg.scala 48:24 ShiftReg.scala 48:24]
  wire  output_0 = output_chain_io_q; // @[ShiftReg.scala 48:24 ShiftReg.scala 48:24]
  wire [1:0] io_q_lo = {output_1,output_0}; // @[Cat.scala 30:58]
  wire  output_3 = output_chain_3_io_q; // @[ShiftReg.scala 48:24 ShiftReg.scala 48:24]
  wire  output_2 = output_chain_2_io_q; // @[ShiftReg.scala 48:24 ShiftReg.scala 48:24]
  wire [1:0] io_q_hi = {output_3,output_2}; // @[Cat.scala 30:58]
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_clock),
    .reset(output_chain_reset),
    .io_d(output_chain_io_d),
    .io_q(output_chain_io_q)
  );
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain_1 ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_1_clock),
    .reset(output_chain_1_reset),
    .io_d(output_chain_1_io_d),
    .io_q(output_chain_1_io_q)
  );
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain_2 ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_2_clock),
    .reset(output_chain_2_reset),
    .io_d(output_chain_2_io_d),
    .io_q(output_chain_2_io_q)
  );
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain_3 ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_3_clock),
    .reset(output_chain_3_reset),
    .io_d(output_chain_3_io_d),
    .io_q(output_chain_3_io_q)
  );
  assign io_q = {io_q_hi,io_q_lo}; // @[Cat.scala 30:58]
  assign output_chain_clock = clock;
  assign output_chain_reset = reset; // @[SynchronizerReg.scala 86:21]
  assign output_chain_io_d = io_d[0]; // @[SynchronizerReg.scala 87:41]
  assign output_chain_1_clock = clock;
  assign output_chain_1_reset = reset; // @[SynchronizerReg.scala 86:21]
  assign output_chain_1_io_d = io_d[1]; // @[SynchronizerReg.scala 87:41]
  assign output_chain_2_clock = clock;
  assign output_chain_2_reset = reset; // @[SynchronizerReg.scala 86:21]
  assign output_chain_2_io_d = io_d[2]; // @[SynchronizerReg.scala 87:41]
  assign output_chain_3_clock = clock;
  assign output_chain_3_reset = reset; // @[SynchronizerReg.scala 86:21]
  assign output_chain_3_io_d = io_d[3]; // @[SynchronizerReg.scala 87:41]
endmodule
