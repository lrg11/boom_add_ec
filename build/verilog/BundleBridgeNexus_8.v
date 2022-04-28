module BundleBridgeNexus_8(
  input         clock,
  input         reset,
  input         auto_in_rnmi,
  input  [31:0] auto_in_rnmi_interrupt_vector,
  input  [31:0] auto_in_rnmi_exception_vector,
  input         auto_in_unmi,
  input  [31:0] auto_in_unmi_interrupt_vector,
  input  [31:0] auto_in_unmi_exception_vector,
  output        auto_out_rnmi,
  output [31:0] auto_out_rnmi_interrupt_vector,
  output [31:0] auto_out_rnmi_exception_vector,
  output        auto_out_unmi,
  output [31:0] auto_out_unmi_interrupt_vector,
  output [31:0] auto_out_unmi_exception_vector
);
  assign auto_out_rnmi = auto_in_rnmi; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_rnmi_interrupt_vector = auto_in_rnmi_interrupt_vector; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_rnmi_exception_vector = auto_in_rnmi_exception_vector; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_unmi = auto_in_unmi; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_unmi_interrupt_vector = auto_in_unmi_interrupt_vector; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_unmi_exception_vector = auto_in_unmi_exception_vector; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
