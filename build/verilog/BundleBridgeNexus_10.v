module BundleBridgeNexus_10(
  input         clock,
  input         reset,
  input         auto_in_0_valid,
  input  [39:0] auto_in_0_iaddr,
  input  [31:0] auto_in_0_insn,
  input  [2:0]  auto_in_0_priv,
  input         auto_in_0_exception,
  input         auto_in_0_interrupt,
  input  [63:0] auto_in_0_cause,
  input  [39:0] auto_in_0_tval,
  input         auto_in_1_valid,
  input  [39:0] auto_in_1_iaddr,
  input  [31:0] auto_in_1_insn,
  input  [2:0]  auto_in_1_priv,
  input         auto_in_1_exception,
  input         auto_in_1_interrupt,
  input  [63:0] auto_in_1_cause,
  input  [39:0] auto_in_1_tval,
  output        auto_out_0_valid,
  output [39:0] auto_out_0_iaddr,
  output [31:0] auto_out_0_insn,
  output [2:0]  auto_out_0_priv,
  output        auto_out_0_exception,
  output        auto_out_0_interrupt,
  output [63:0] auto_out_0_cause,
  output [39:0] auto_out_0_tval,
  output        auto_out_1_valid,
  output [39:0] auto_out_1_iaddr,
  output [31:0] auto_out_1_insn,
  output [2:0]  auto_out_1_priv,
  output        auto_out_1_exception,
  output        auto_out_1_interrupt,
  output [63:0] auto_out_1_cause,
  output [39:0] auto_out_1_tval
);
  assign auto_out_0_valid = auto_in_0_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_iaddr = auto_in_0_iaddr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_insn = auto_in_0_insn; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_priv = auto_in_0_priv; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_exception = auto_in_0_exception; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_interrupt = auto_in_0_interrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_cause = auto_in_0_cause; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_tval = auto_in_0_tval; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_valid = auto_in_1_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_iaddr = auto_in_1_iaddr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_insn = auto_in_1_insn; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_priv = auto_in_1_priv; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_exception = auto_in_1_exception; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_interrupt = auto_in_1_interrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_cause = auto_in_1_cause; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_tval = auto_in_1_tval; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
