module MulAddRecFNPipe(
  input         clock,
  input         reset,
  input         io_validin,
  input  [1:0]  io_op,
  input  [64:0] io_a,
  input  [64:0] io_b,
  input  [64:0] io_c,
  input  [2:0]  io_roundingMode,
  input         io_detectTininess,
  output [64:0] io_out,
  output [4:0]  io_exceptionFlags,
  output        io_validout
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [127:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
`endif // RANDOMIZE_REG_INIT
  wire [1:0] mulAddRecFNToRaw_preMul_io_op; // @[FPU.scala 808:41]
  wire [64:0] mulAddRecFNToRaw_preMul_io_a; // @[FPU.scala 808:41]
  wire [64:0] mulAddRecFNToRaw_preMul_io_b; // @[FPU.scala 808:41]
  wire [64:0] mulAddRecFNToRaw_preMul_io_c; // @[FPU.scala 808:41]
  wire [52:0] mulAddRecFNToRaw_preMul_io_mulAddA; // @[FPU.scala 808:41]
  wire [52:0] mulAddRecFNToRaw_preMul_io_mulAddB; // @[FPU.scala 808:41]
  wire [105:0] mulAddRecFNToRaw_preMul_io_mulAddC; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfA; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfB; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_signProd; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfC; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC; // @[FPU.scala 808:41]
  wire [12:0] mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant; // @[FPU.scala 808:41]
  wire [5:0] mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist; // @[FPU.scala 808:41]
  wire [54:0] mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC; // @[FPU.scala 808:41]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_signProd; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC; // @[FPU.scala 809:42]
  wire [12:0] mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant; // @[FPU.scala 809:42]
  wire [5:0] mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist; // @[FPU.scala 809:42]
  wire [54:0] mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC; // @[FPU.scala 809:42]
  wire [106:0] mulAddRecFNToRaw_postMul_io_mulAddResult; // @[FPU.scala 809:42]
  wire [2:0] mulAddRecFNToRaw_postMul_io_roundingMode; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_invalidExc; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isNaN; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isInf; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isZero; // @[FPU.scala 809:42]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_sign; // @[FPU.scala 809:42]
  wire [12:0] mulAddRecFNToRaw_postMul_io_rawOut_sExp; // @[FPU.scala 809:42]
  wire [55:0] mulAddRecFNToRaw_postMul_io_rawOut_sig; // @[FPU.scala 809:42]
  wire  roundRawFNToRecFN_io_invalidExc; // @[FPU.scala 836:35]
  wire  roundRawFNToRecFN_io_infiniteExc; // @[FPU.scala 836:35]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[FPU.scala 836:35]
  wire  roundRawFNToRecFN_io_in_isInf; // @[FPU.scala 836:35]
  wire  roundRawFNToRecFN_io_in_isZero; // @[FPU.scala 836:35]
  wire  roundRawFNToRecFN_io_in_sign; // @[FPU.scala 836:35]
  wire [12:0] roundRawFNToRecFN_io_in_sExp; // @[FPU.scala 836:35]
  wire [55:0] roundRawFNToRecFN_io_in_sig; // @[FPU.scala 836:35]
  wire [2:0] roundRawFNToRecFN_io_roundingMode; // @[FPU.scala 836:35]
  wire  roundRawFNToRecFN_io_detectTininess; // @[FPU.scala 836:35]
  wire [64:0] roundRawFNToRecFN_io_out; // @[FPU.scala 836:35]
  wire [4:0] roundRawFNToRecFN_io_exceptionFlags; // @[FPU.scala 836:35]
  wire [105:0] _mulAddResult_T = mulAddRecFNToRaw_preMul_io_mulAddA * mulAddRecFNToRaw_preMul_io_mulAddB; // @[FPU.scala 817:45]
  wire [106:0] mulAddResult = _mulAddResult_T + mulAddRecFNToRaw_preMul_io_mulAddC; // @[FPU.scala 818:50]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isSigNaNAny; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNAOrB; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfA; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroA; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfB; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroB; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_signProd; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNC; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfC; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroC; // @[Reg.scala 15:16]
  reg [12:0] mulAddRecFNToRaw_postMul_io_fromPreMul_b_sExpSum; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_doSubMags; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_CIsDominant; // @[Reg.scala 15:16]
  reg [5:0] mulAddRecFNToRaw_postMul_io_fromPreMul_b_CDom_CAlignDist; // @[Reg.scala 15:16]
  reg [54:0] mulAddRecFNToRaw_postMul_io_fromPreMul_b_highAlignedSigC; // @[Reg.scala 15:16]
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_bit0AlignedSigC; // @[Reg.scala 15:16]
  reg [106:0] mulAddRecFNToRaw_postMul_io_mulAddResult_b; // @[Reg.scala 15:16]
  reg [2:0] mulAddRecFNToRaw_postMul_io_roundingMode_b; // @[Reg.scala 15:16]
  reg [2:0] roundingMode_stage0_b; // @[Reg.scala 15:16]
  reg  detectTininess_stage0_b; // @[Reg.scala 15:16]
  reg  valid_stage0_v; // @[Valid.scala 117:22]
  reg  roundRawFNToRecFN_io_invalidExc_b; // @[Reg.scala 15:16]
  reg  roundRawFNToRecFN_io_in_b_isNaN; // @[Reg.scala 15:16]
  reg  roundRawFNToRecFN_io_in_b_isInf; // @[Reg.scala 15:16]
  reg  roundRawFNToRecFN_io_in_b_isZero; // @[Reg.scala 15:16]
  reg  roundRawFNToRecFN_io_in_b_sign; // @[Reg.scala 15:16]
  reg [12:0] roundRawFNToRecFN_io_in_b_sExp; // @[Reg.scala 15:16]
  reg [55:0] roundRawFNToRecFN_io_in_b_sig; // @[Reg.scala 15:16]
  reg [2:0] roundRawFNToRecFN_io_roundingMode_b; // @[Reg.scala 15:16]
  reg  roundRawFNToRecFN_io_detectTininess_b; // @[Reg.scala 15:16]
  reg  io_validout_v; // @[Valid.scala 117:22]
  MulAddRecFNToRaw_preMul mulAddRecFNToRaw_preMul ( // @[FPU.scala 808:41]
    .io_op(mulAddRecFNToRaw_preMul_io_op),
    .io_a(mulAddRecFNToRaw_preMul_io_a),
    .io_b(mulAddRecFNToRaw_preMul_io_b),
    .io_c(mulAddRecFNToRaw_preMul_io_c),
    .io_mulAddA(mulAddRecFNToRaw_preMul_io_mulAddA),
    .io_mulAddB(mulAddRecFNToRaw_preMul_io_mulAddB),
    .io_mulAddC(mulAddRecFNToRaw_preMul_io_mulAddC),
    .io_toPostMul_isSigNaNAny(mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny),
    .io_toPostMul_isNaNAOrB(mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB),
    .io_toPostMul_isInfA(mulAddRecFNToRaw_preMul_io_toPostMul_isInfA),
    .io_toPostMul_isZeroA(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA),
    .io_toPostMul_isInfB(mulAddRecFNToRaw_preMul_io_toPostMul_isInfB),
    .io_toPostMul_isZeroB(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB),
    .io_toPostMul_signProd(mulAddRecFNToRaw_preMul_io_toPostMul_signProd),
    .io_toPostMul_isNaNC(mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC),
    .io_toPostMul_isInfC(mulAddRecFNToRaw_preMul_io_toPostMul_isInfC),
    .io_toPostMul_isZeroC(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC),
    .io_toPostMul_sExpSum(mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum),
    .io_toPostMul_doSubMags(mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags),
    .io_toPostMul_CIsDominant(mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant),
    .io_toPostMul_CDom_CAlignDist(mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist),
    .io_toPostMul_highAlignedSigC(mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC),
    .io_toPostMul_bit0AlignedSigC(mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC)
  );
  MulAddRecFNToRaw_postMul mulAddRecFNToRaw_postMul ( // @[FPU.scala 809:42]
    .io_fromPreMul_isSigNaNAny(mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny),
    .io_fromPreMul_isNaNAOrB(mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB),
    .io_fromPreMul_isInfA(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA),
    .io_fromPreMul_isZeroA(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA),
    .io_fromPreMul_isInfB(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB),
    .io_fromPreMul_isZeroB(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB),
    .io_fromPreMul_signProd(mulAddRecFNToRaw_postMul_io_fromPreMul_signProd),
    .io_fromPreMul_isNaNC(mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC),
    .io_fromPreMul_isInfC(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC),
    .io_fromPreMul_isZeroC(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC),
    .io_fromPreMul_sExpSum(mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum),
    .io_fromPreMul_doSubMags(mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags),
    .io_fromPreMul_CIsDominant(mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant),
    .io_fromPreMul_CDom_CAlignDist(mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist),
    .io_fromPreMul_highAlignedSigC(mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC),
    .io_fromPreMul_bit0AlignedSigC(mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC),
    .io_mulAddResult(mulAddRecFNToRaw_postMul_io_mulAddResult),
    .io_roundingMode(mulAddRecFNToRaw_postMul_io_roundingMode),
    .io_invalidExc(mulAddRecFNToRaw_postMul_io_invalidExc),
    .io_rawOut_isNaN(mulAddRecFNToRaw_postMul_io_rawOut_isNaN),
    .io_rawOut_isInf(mulAddRecFNToRaw_postMul_io_rawOut_isInf),
    .io_rawOut_isZero(mulAddRecFNToRaw_postMul_io_rawOut_isZero),
    .io_rawOut_sign(mulAddRecFNToRaw_postMul_io_rawOut_sign),
    .io_rawOut_sExp(mulAddRecFNToRaw_postMul_io_rawOut_sExp),
    .io_rawOut_sig(mulAddRecFNToRaw_postMul_io_rawOut_sig)
  );
  RoundRawFNToRecFN roundRawFNToRecFN ( // @[FPU.scala 836:35]
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_infiniteExc(roundRawFNToRecFN_io_infiniteExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundRawFNToRecFN_io_roundingMode),
    .io_detectTininess(roundRawFNToRecFN_io_detectTininess),
    .io_out(roundRawFNToRecFN_io_out),
    .io_exceptionFlags(roundRawFNToRecFN_io_exceptionFlags)
  );
  assign io_out = roundRawFNToRecFN_io_out; // @[FPU.scala 847:23]
  assign io_exceptionFlags = roundRawFNToRecFN_io_exceptionFlags; // @[FPU.scala 848:23]
  assign io_validout = io_validout_v; // @[Valid.scala 112:21 Valid.scala 113:17]
  assign mulAddRecFNToRaw_preMul_io_op = io_op; // @[FPU.scala 811:35]
  assign mulAddRecFNToRaw_preMul_io_a = io_a; // @[FPU.scala 812:35]
  assign mulAddRecFNToRaw_preMul_io_b = io_b; // @[FPU.scala 813:35]
  assign mulAddRecFNToRaw_preMul_io_c = io_c; // @[FPU.scala 814:35]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isSigNaNAny; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNAOrB; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfA; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroA; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfB; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroB; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_signProd = mulAddRecFNToRaw_postMul_io_fromPreMul_b_signProd; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNC; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfC; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroC; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum = mulAddRecFNToRaw_postMul_io_fromPreMul_b_sExpSum; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags = mulAddRecFNToRaw_postMul_io_fromPreMul_b_doSubMags; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant = mulAddRecFNToRaw_postMul_io_fromPreMul_b_CIsDominant; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist =
    mulAddRecFNToRaw_postMul_io_fromPreMul_b_CDom_CAlignDist; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC =
    mulAddRecFNToRaw_postMul_io_fromPreMul_b_highAlignedSigC; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC =
    mulAddRecFNToRaw_postMul_io_fromPreMul_b_bit0AlignedSigC; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_mulAddResult = mulAddRecFNToRaw_postMul_io_mulAddResult_b; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign mulAddRecFNToRaw_postMul_io_roundingMode = mulAddRecFNToRaw_postMul_io_roundingMode_b; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign roundRawFNToRecFN_io_invalidExc = roundRawFNToRecFN_io_invalidExc_b; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign roundRawFNToRecFN_io_infiniteExc = 1'h0; // @[FPU.scala 845:38]
  assign roundRawFNToRecFN_io_in_isNaN = roundRawFNToRecFN_io_in_b_isNaN; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign roundRawFNToRecFN_io_in_isInf = roundRawFNToRecFN_io_in_b_isInf; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign roundRawFNToRecFN_io_in_isZero = roundRawFNToRecFN_io_in_b_isZero; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign roundRawFNToRecFN_io_in_sign = roundRawFNToRecFN_io_in_b_sign; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign roundRawFNToRecFN_io_in_sExp = roundRawFNToRecFN_io_in_b_sExp; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign roundRawFNToRecFN_io_in_sig = roundRawFNToRecFN_io_in_b_sig; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign roundRawFNToRecFN_io_roundingMode = roundRawFNToRecFN_io_roundingMode_b; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign roundRawFNToRecFN_io_detectTininess = roundRawFNToRecFN_io_detectTininess_b; // @[Valid.scala 112:21 Valid.scala 114:16]
  always @(posedge clock) begin
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isSigNaNAny <= mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNAOrB <= mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfA <= mulAddRecFNToRaw_preMul_io_toPostMul_isInfA; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroA <= mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfB <= mulAddRecFNToRaw_preMul_io_toPostMul_isInfB; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroB <= mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_signProd <= mulAddRecFNToRaw_preMul_io_toPostMul_signProd; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNC <= mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfC <= mulAddRecFNToRaw_preMul_io_toPostMul_isInfC; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroC <= mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_sExpSum <= mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_doSubMags <= mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_CIsDominant <= mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_CDom_CAlignDist <= mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_highAlignedSigC <= mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_bit0AlignedSigC <= mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_mulAddResult_b <= mulAddResult; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      mulAddRecFNToRaw_postMul_io_roundingMode_b <= io_roundingMode; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      roundingMode_stage0_b <= io_roundingMode; // @[Reg.scala 16:23]
    end
    if (io_validin) begin // @[Reg.scala 16:19]
      detectTininess_stage0_b <= io_detectTininess; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      valid_stage0_v <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      valid_stage0_v <= io_validin; // @[Valid.scala 117:22]
    end
    if (valid_stage0_v) begin // @[Reg.scala 16:19]
      roundRawFNToRecFN_io_invalidExc_b <= mulAddRecFNToRaw_postMul_io_invalidExc; // @[Reg.scala 16:23]
    end
    if (valid_stage0_v) begin // @[Reg.scala 16:19]
      roundRawFNToRecFN_io_in_b_isNaN <= mulAddRecFNToRaw_postMul_io_rawOut_isNaN; // @[Reg.scala 16:23]
    end
    if (valid_stage0_v) begin // @[Reg.scala 16:19]
      roundRawFNToRecFN_io_in_b_isInf <= mulAddRecFNToRaw_postMul_io_rawOut_isInf; // @[Reg.scala 16:23]
    end
    if (valid_stage0_v) begin // @[Reg.scala 16:19]
      roundRawFNToRecFN_io_in_b_isZero <= mulAddRecFNToRaw_postMul_io_rawOut_isZero; // @[Reg.scala 16:23]
    end
    if (valid_stage0_v) begin // @[Reg.scala 16:19]
      roundRawFNToRecFN_io_in_b_sign <= mulAddRecFNToRaw_postMul_io_rawOut_sign; // @[Reg.scala 16:23]
    end
    if (valid_stage0_v) begin // @[Reg.scala 16:19]
      roundRawFNToRecFN_io_in_b_sExp <= mulAddRecFNToRaw_postMul_io_rawOut_sExp; // @[Reg.scala 16:23]
    end
    if (valid_stage0_v) begin // @[Reg.scala 16:19]
      roundRawFNToRecFN_io_in_b_sig <= mulAddRecFNToRaw_postMul_io_rawOut_sig; // @[Reg.scala 16:23]
    end
    if (valid_stage0_v) begin // @[Reg.scala 16:19]
      roundRawFNToRecFN_io_roundingMode_b <= roundingMode_stage0_b; // @[Reg.scala 16:23]
    end
    if (valid_stage0_v) begin // @[Reg.scala 16:19]
      roundRawFNToRecFN_io_detectTininess_b <= detectTininess_stage0_b; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      io_validout_v <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      io_validout_v <= valid_stage0_v; // @[Valid.scala 117:22]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isSigNaNAny = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNAOrB = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfA = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroA = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfB = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroB = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_signProd = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNC = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfC = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroC = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_sExpSum = _RAND_10[12:0];
  _RAND_11 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_doSubMags = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_CIsDominant = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_CDom_CAlignDist = _RAND_13[5:0];
  _RAND_14 = {2{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_highAlignedSigC = _RAND_14[54:0];
  _RAND_15 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_bit0AlignedSigC = _RAND_15[0:0];
  _RAND_16 = {4{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_mulAddResult_b = _RAND_16[106:0];
  _RAND_17 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_roundingMode_b = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  roundingMode_stage0_b = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  detectTininess_stage0_b = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  valid_stage0_v = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  roundRawFNToRecFN_io_invalidExc_b = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  roundRawFNToRecFN_io_in_b_isNaN = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  roundRawFNToRecFN_io_in_b_isInf = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  roundRawFNToRecFN_io_in_b_isZero = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  roundRawFNToRecFN_io_in_b_sign = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  roundRawFNToRecFN_io_in_b_sExp = _RAND_26[12:0];
  _RAND_27 = {2{`RANDOM}};
  roundRawFNToRecFN_io_in_b_sig = _RAND_27[55:0];
  _RAND_28 = {1{`RANDOM}};
  roundRawFNToRecFN_io_roundingMode_b = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  roundRawFNToRecFN_io_detectTininess_b = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  io_validout_v = _RAND_30[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
