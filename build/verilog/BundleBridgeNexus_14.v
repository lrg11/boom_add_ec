module BundleBridgeNexus_14(
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
  input  [39:0] auto_in_1_tval
);
endmodule
