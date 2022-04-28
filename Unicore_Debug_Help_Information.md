#### BOOM-Unicore Debug Help Information 

##### 1. 显示提交指令及相关信息，包括指令计算结果（目的寄存器的数据和标志寄存器的数据）、指令地址、指令译码的微操作信息（之后通过对log进行处理，以替换为指令的实际信息）

- 显示提交的微指令的信息（core.scala）

  ```scala
  if (COMMIT_LOG_PRINTF) {
    //debug: commit information
    for (w <- 0 until coreWidth) {
      val cmt_uop = rob.io.commit.uops(w)
      when (rob.io.commit.arch_valids(w) && cmt_uop.is_unicore) {
        when(cmt_uop.is_br || cmt_uop.is_jal || cmt_uop.is_jalr) {
          dbg(
            "type" -> "[Commit Uop Information] Branch",
            "w" -> w,
            "pc" -> cmt_uop.debug_pc.toHex,
            "inst" -> cmt_uop.inst.toHex,
            "split_num" -> cmt_uop.split_num,
            "self_index" -> cmt_uop.self_index,
            "uopc" -> cmt_uop.uopc,
            "op1_sel" -> cmt_uop.op1_sel,
            "op2_sel" -> cmt_uop.op2_sel,
            "taken" -> cmt_uop.taken,
          )
        }
        .otherwise{
          dbg(
            "type" -> "[Commit Uop Information]",
            "w" -> w,
            "pc" -> cmt_uop.debug_pc.toHex,
            "inst" -> cmt_uop.inst.toHex,
            "split_num" -> cmt_uop.split_num,
            "self_index" -> cmt_uop.self_index,
            "uopc" -> cmt_uop.uopc,
            "op1_sel" -> cmt_uop.op1_sel,
            "op2_sel" -> cmt_uop.op2_sel,
            "ldst" -> cmt_uop.ldst,
            "ldst_val" -> cmt_uop.ldst_val,
            "ldst_data" -> rob.io.commit.debug_wdata(w),
            "wflag" -> cmt_uop.wflag,
            "flagdata(VCZN)" -> rob.io.commit.debug_wflagdata(w).toBin,
          )
        }
      }
    }
  }
  ```

- 单独显示提交的Load和Store指令的执行信息（lsu.scala）

  ```scala
  if (MEMTRACE_PRINTF) {
    //debug: lsq information
    when (commit_store || commit_load) {
      val uop    = Mux(commit_store, stq(idx).bits.uop, ldq(idx).bits.uop)
      val addr   = Mux(commit_store, stq(idx).bits.addr.bits, ldq(idx).bits.addr.bits)
      val stdata = Mux(commit_store, stq(idx).bits.data.bits, 0.U)
      val wbdata = Mux(commit_store, stq(idx).bits.debug_wb_data, ldq(idx).bits.debug_wb_data)
      when (uop.is_unicore) {
        when (commit_store) {
          dbg(
            "type" -> "[Commit Uop Information] Store commit",
            "pc" -> uop.debug_pc.toHex,
            "inst" -> uop.inst.toHex,
            "split_num" -> uop.split_num,
            "self_index" -> uop.self_index,
            "uopc" -> uop.uopc,
            "mem_cmd" -> uop.mem_cmd,
            "mem_addr" -> addr,
            "mem_size" -> uop.mem_size,
            "store_data" -> stdata,
            "load_data(AMO)" -> wbdata,
          )
        }
        .otherwise {
          dbg(
            "type" -> "[Commit Uop Information] Load commit",
            "pc" -> uop.debug_pc.toHex,
            "inst" -> uop.inst.toHex,
            "split_num" -> uop.split_num,
            "self_index" -> uop.self_index,
            "uopc" -> uop.uopc,
            "mem_cmd" -> uop.mem_cmd,
            "mem_addr" -> addr,
            "mem_size" -> uop.mem_size,
          )
        }
      }
    }
  }
  ```


##### 2. 流水线异常信息，包括出现异常的一些阶段打印出来的信息，例如译码阶段、lsu和中断等，显示发生异常的指令，地址，异常类型

- running exception: 在执行过程中，发生了异常；（rob.scala，由PIPELINE_LOG_PRINTF控制）

  - 指令在Dispatch阶段之前发生的异常

    ```scala
    //debug: show the running exception information
    if (PIPELINE_LOG_PRINTF) {
      when (next_xcpt_uop.is_unicore) {
        val badvaddr_debug = AlignPCToBoundary(io.xcpt_fetch_pc, icBlockBytes) | io.enq_uops(idx).pc_lob
        dbg(
          "type" -> "[Running Exception] dispatch exception",
          "pc" -> next_xcpt_uop.debug_pc.toHex,
          "inst" -> next_xcpt_uop.inst.toHex,
          "split_num" -> next_xcpt_uop.split_num,
          "self_index" -> next_xcpt_uop.self_index,
          "uopc" -> next_xcpt_uop.uopc,
          "badvaddr" -> badvaddr_debug,
          "excpt cause" -> next_xcpt_uop.exc_cause,
        )
      }
    }
    ```

  - load/store执行时发生的异常

    ```scala
    //debug: show the running exception information
    if (PIPELINE_LOG_PRINTF) {
      when (next_xcpt_uop.is_unicore) {
        dbg(
          "type" -> "[Running Exception] lsu exception",
          "pc" -> next_xcpt_uop.debug_pc.toHex,
          "inst" -> next_xcpt_uop.inst.toHex,
          "split_num" -> next_xcpt_uop.split_num,
          "self_index" -> next_xcpt_uop.self_index,
          "uopc" -> next_xcpt_uop.uopc,
          "badvaddr" -> io.lxcpt.bits.badvaddr,
          "excpt cause" -> next_xcpt_uop.exc_cause,
        )
      }
    }
    ```

- commit exception: 最终在提交时，处理的异常；（rob.scala）

  ```scala
  //debug: show the commit instruction's exception information
  when (exception_thrown && com_xcpt_uop.is_unicore) {
    dbg(
      "type" -> "[Commit Exception] Committed exception",
      "xcpt pc" -> com_xcpt_uop.debug_pc.toHex,
      "xcpt inst" -> com_xcpt_uop.inst.toHex,
      "split_num" -> com_xcpt_uop.split_num,
      "self_index" -> com_xcpt_uop.self_index,
      "uopc" -> com_xcpt_uop.uopc,
      "badvaddr" -> r_xcpt_badvaddr,
      "xcpt cause" -> r_xcpt_uop.exc_cause,
    )
  }
  ```

##### 

##### 3. 显示dispatch成功的微指令具体的译码信号，用于判断是否译码出现了错误

- 辅助函数定义（util.scala）

  ```scala
  object UnicoreMicroOpPrint
  {
    def apply(uop: MicroOp) = {
      printf("[Micro Information]\n" + 
        "pc: 0x%x, inst: 0x%x, split_num: %d, self_index: %d, uopc: %d\n" + 
        "is_br: %d, is_jal: %d, is_jalr: %d, useLQ: %d, useSQ: %d\n" + 
        "is_amo: %d, is_fence: %d, is_fencei: %d, is_unique: %d, flush_on_commit: %d\n" + 
        "lrs1_type: %d, lrs1: %d, lrs2_type: %d, lrs2: %d, rflag: %d\n" + 
        "ldst_val: %d, ldst: %d, wflag: %d\n" + 
        "op1_sel: %d, op2_sel: %d, mem_cmd: %d, mem_size: %d, mem_signed: %d\n",
        uop.debug_pc, uop.inst, uop.split_num, uop.self_index, uop.uopc, 
        uop.is_br, uop.is_jal, uop.is_jalr, uop.uses_ldq, uop.uses_stq,
        uop.is_amo, uop.is_fence, uop.is_fencei, uop.is_unique, uop.flush_on_commit,
        uop.lrs1_rtype, uop.lrs1, uop.lrs2_rtype, uop.lrs2, uop.rflag,
        uop.ldst_val, uop.ldst, uop.wflag,
        uop.op1_sel, uop.op2_sel, uop.mem_cmd, uop.mem_size, uop.mem_signed 
      )
    }
  }
  ```

- 具体使用（core.scala，可以考虑通过比对inst/pc输出指定指令的信息）

  ```scala
  //debug: show the dispatch microOp detailed information
  if (MICROOP_LOG_PRINTF) {
    for (w <- 0 until coreWidth) {
      when (dis_fire(w) && dis_uops(w).is_unicore) {
        UnicoreMicroOpPrint(dis_uops(w))
      }
    }
  }
  ```

  

##### 4. 显示指令在流水线中每个阶段的信息

- decode stage （core.scala）

  ```scala
  //debug: show decoded uops information
  if (PIPELINE_LOG_PRINTF) {
    when(isUnicoreMode && dec_uops_total_num =/= 0.U && dec_fire.reduce(_||_)){
      for (w <- 0 until enqTranBuff_entries) {
        when (dec_vals_set(w) && dec_uops_set(w).is_unicore) {
          dbg(
            "type" -> "[Pipeline--Decode]: Decoded Valid Uops",
            "w" -> w,
            "pc" -> dec_uops_set(w).debug_pc.toHex,
            "inst" -> dec_uops_set(w).inst.toHex,
            "split_num" -> dec_uops_set(w).split_num,
            "self_index" -> dec_uops_set(w).self_index,
            "uopc" -> dec_uops_set(w).uopc,
          )
        }
      }
    }
  }
  ```

- enqTransBuffer stage （core.scala）

  ```scala
  //debug: show the enqTransBuffer stage information
  if (PIPELINE_LOG_PRINTF) {
    when(isUnicoreMode){
      for (w <- 0 until coreWidth) {
        when (tran_fire(w) && tran_uops(w).is_unicore) {
          dbg(
            "type" -> "[Pipeline--TransBuffer]: TransBuffer Output Valid Uops",
            "w" -> w,
            "pc" -> tran_uops(w).debug_pc.toHex,
            "inst" -> tran_uops(w).inst.toHex,
            "split_num" -> tran_uops(w).split_num,
            "self_index" -> tran_uops(w).self_index,
            "uopc" -> tran_uops(w).uopc,
          )
        }
      }
    }
  }
  ```

- dispatch stage (core.scala)

  ```scala
  //debug: show the dispatch stage information
  if (PIPELINE_LOG_PRINTF) {
    when(isUnicoreMode){
      for (w <- 0 until coreWidth) {
        when (dis_fire(w) && dis_uops(w).is_unicore) {
          dbg(
            "type" -> "[Pipeline--Dispatch]: valid renamed and dispatched uops",
            "w" -> w,
            "pc" -> dis_uops(w).debug_pc.toHex,
            "inst" -> dis_uops(w).inst.toHex,
            "split_num" -> dis_uops(w).split_num,
            "self_index" -> dis_uops(w).self_index,
            "uopc" -> dis_uops(w).uopc,
            "rob_idx" -> dis_uops(w).rob_idx,
            "block_rob_idx" -> dis_uops(w).rob_inst_idx
          )
        }
      }
    }
  }
  ```

- issue stage (core.scala)

  - issue uops information

    ```scala
    //debug: show the issue stage information
    if (PIPELINE_LOG_PRINTF) {
      when(isUnicoreMode){
        for (w <- 0 until exe_units.numIrfReaders) {
          when (iss_valids(w) && iss_uops(w).is_unicore) {
            dbg(
              "type" -> "[Pipeline--Issue]: issued valid Uops",
              "w" -> w,
              "pc" -> iss_uops(w).debug_pc.toHex,
              "inst" -> iss_uops(w).inst.toHex,
              "split_num" -> iss_uops(w).split_num,
              "self_index" -> iss_uops(w).self_index,
              "uopc" -> iss_uops(w).uopc,
            )
          }
        }
      }
    }
    ```

  - issue wakeup port information

    ```scala
    //debug: show IQ wakeup signal information
    if (PIPELINE_LOG_PRINTF) {
      when (isUnicoreMode && wakeup.valid && wakeup.bits.uop.is_unicore) {
        dbg(
          "type" -> "[Pipeline--WakeUp]: IQ Wakeup Input Uops Info",
          "pc" -> wakeup.bits.uop.debug_pc.toHex,
          "inst" -> wakeup.bits.uop.inst.toHex,
          "self_index" -> wakeup.bits.uop.self_index,
          "uopc" -> wakeup.bits.uop.uopc,
          "ldst" -> wakeup.bits.uop.ldst,
          "ldst_val" -> wakeup.bits.uop.ldst_val,
          "wflag" -> wakeup.bits.uop.wflag,
        )
      }
    }
    ```

- register read stage (core.scala)

  ```scala
  //debug: show rrd stage information
  if (PIPELINE_LOG_PRINTF) {
    val rrd_uop = iregister_read.io.exe_reqs(iss_idx).bits.uop
    when (isUnicoreMode && iregister_read.io.exe_reqs(iss_idx).valid && rrd_uop.is_unicore) {
      dbg(
        "type" -> "[Pipeline--RRD]: Uop Read Register Info",
        "pc" -> rrd_uop.debug_pc.toHex,
        "inst" -> rrd_uop.inst.toHex,
        "self_index" -> rrd_uop.self_index,
        "uopc" -> rrd_uop.uopc,
        "lrs1" -> rrd_uop.lrs1,
        "lrs1_type" -> rrd_uop.lrs1_rtype,
        "lrs1_data" -> iregister_read.io.exe_reqs(iss_idx).bits.rs1_data,
        "lrs2" -> rrd_uop.lrs2,
        "lrs2_type" -> rrd_uop.lrs2_rtype,
        "lrs2_data" -> iregister_read.io.exe_reqs(iss_idx).bits.rs2_data,
        "rflag" -> rrd_uop.rflag, 
        "flag_data(VCZN)" -> iregister_read.io.exe_reqs(iss_idx).bits.flagdata.toBin
      )
    }
  }
  ```

- execution stage (functional-units.scala)

  - ALU

    ```scala
    //debug: show the alu execution information about branch
    if (PIPELINE_LOG_PRINTF) {
      when(uop.is_unicore && brinfo.valid){
        dbg(
          "type" -> "[Pipeline--Execution] Branch Information",
          "pc" -> uop.debug_pc.toHex,
          "inst" -> uop.inst.toHex,
          "self_idx" -> uop.self_index,
          "uopc" -> uop.uopc,
          "is_br" -> is_br, 
          "is_jalr" -> is_jalr,
          "Op1" -> io.req.bits.rs1_data.asSInt,
          "Res_taken" -> brinfo.taken,
          "Res_misp" -> mispredict,
        )
      }
    }
    
    //debug: show the alu execution information
    if (PIPELINE_LOG_PRINTF) {
      when(uop.is_unicore && io.req.valid){
        dbg(
          "type" -> "[Pipeline--Execution] ALU Information",
          "pc" -> uop.debug_pc.toHex,
          "inst" -> uop.inst.toHex,
          "self_idx" -> uop.self_index,
          "uopc" -> uop.uopc,
          "ldst" -> uop.ldst, 
          "ldst_val" -> uop.ldst_val,
          "wflag" -> uop.wflag,
          "Op1" -> op1_data_unicore,
          "Op2" -> op2_data_unicore,
          "OpFlag(VCZN)" -> io.req.bits.flagdata.toBin, 
          "Result" -> alu_out_unicore,
          "ResFlag(VCZN)" -> Cat(flag_v.asUInt, flag_c.asUInt, flag_z.asUInt, flag_n.asUInt).toBin,
        )
      }
    }
    ```

  - MemAddrCalcUnit

    ```scala
    //debug: show the MemAddrCalcUnit execution information
    if (PIPELINE_LOG_PRINTF) {
      val uop = io.req.bits.uop
      when (uop.is_unicore && io.req.valid) {
        dbg(
          "type" -> "[Pipeline--Execution] MemAddrCalcUnit Information",
          "pc" -> uop.debug_pc.toHex,
          "inst" -> uop.inst.toHex,
          "self_idx" -> uop.self_index,
          "uopc" -> uop.uopc,
          "Op1(Base addr)" -> io.req.bits.rs1_data,
          "mem addr" -> effective_address,
          "store data" -> store_data,
          "misaligned_load" -> ma_ld,
          "misaligned_store" -> ma_st,
        )
      }
    }
    ```

  - MulUnit

    ```scala
    //debug: show the MulUnit execution information
    if (PIPELINE_LOG_PRINTF) {
      val req_uop = io.req.bits.uop
      when (req_uop.is_unicore && io.req.valid) {
        dbg(
          "type" -> "[Pipeline--Execution] MulUnit Information Request",
          "pc" -> req_uop.debug_pc.toHex,
          "inst" -> req_uop.inst.toHex,
          "self_idx" -> req_uop.self_index,
          "uopc" -> req_uop.uopc,
          "Op1" -> io.req.bits.rs1_data,
          "Op2" -> io.req.bits.rs1_data,
        )
      }
    
      val resp_uop = io.resp.bits.uop
      when (resp_uop.is_unicore && io.resp.valid) {
        dbg(
          "type" -> "[Pipeline--Execution] MulUnit Information Responese",
          "pc" -> resp_uop.debug_pc.toHex,
          "inst" -> resp_uop.inst.toHex,
          "self_idx" -> resp_uop.self_index,
          "uopc" -> resp_uop.uopc,
          "Result" -> io.resp.bits.data,
        )
      }
    }
    ```

- write back stage 

  - ll and mem wb ports (core.scala, will connect to regfile and rob)

    ```scala
    //debug: show write back stage information
    if (PIPELINE_LOG_PRINTF) {
      when (isUnicoreMode) {
        val llwb_uop = ll_wbarb.io.out.bits.uop
        when (ll_wbarb.io.out.valid && llwb_uop.is_unicore && (llwb_uop.ldst_val || llwb_uop.wflag)) {
          dbg(
            "type" -> "[Pipeline--Write Back]: WB Uop Info (llwb)",
            "pc" -> llwb_uop.debug_pc.toHex,
            "inst" -> llwb_uop.inst.toHex,
            "self_index" -> llwb_uop.self_index,
            "uopc" -> llwb_uop.uopc,
            "ldst" -> llwb_uop.ldst,
            "ldst_val" -> llwb_uop.ldst_val,
            "wbdata" -> ll_wbarb.io.out.bits.data,
            "wflag" -> llwb_uop.wflag,
            "flag_data(VCZN)" -> ll_wbarb.io.out.bits.flagdata.toBin,
          )
        }
    
        for (w <- 1 until memWidth) {
          val wbresp = mem_resps(w)
          val wbuop = wbresp.bits.uop
          when (wbresp.valid && wbuop.is_unicore && (wbuop.ldst_val || wbuop.wflag)) {
            dbg(
              "type" -> "[Write Back]: WB Uop Info (Mem)",
              "pc" -> wbuop.debug_pc.toHex,
              "inst" -> wbuop.inst.toHex,
              "self_index" -> wbuop.self_index,
              "uopc" -> wbuop.uopc,
              "ldst" -> wbuop.ldst,
              "ldst_val" -> wbuop.ldst_val,
              "wbdata" -> wbresp.bits.data,
              "wflag" -> wbuop.wflag,
              "flag_data(VCZN)" -> wbresp.bits.flagdata.toBin,
            )
          }
        }
      }
    }
    ```

  - Functional Unit ports  (core.scala, will connect to regfile and rob)

    ```scala
    //debug: show write back stage information
    if (PIPELINE_LOG_PRINTF) {
      val wbuop = wbresp.bits.uop
      when (wbresp.valid && wbuop.is_unicore && (wbuop.ldst_val || wbuop.wflag)) {
        dbg(
          "type" -> "[Pipeline--Write Back]: WB Uop Info (FU)",
          "pc" -> wbuop.debug_pc.toHex,
          "inst" -> wbuop.inst.toHex,
          "self_index" -> wbuop.self_index,
          "uopc" -> wbuop.uopc,
          "ldst" -> wbuop.ldst,
          "ldst_val" -> wbuop.ldst_val,
          "wbdata" -> iregfile.io.write_ports(w_cnt).bits.data,
          "wflag" -> wbuop.wflag,
          "flag_data(VCZN)" -> wbresp.bits.flagdata.toBin,
        )
      }
    }
    ```

  - ROB Information update (rob.scala)

    ```scala
    //debug: show the writeback information to rob (fu uop)
    if (PIPELINE_LOG_PRINTF) {
      when (wb_uop.is_unicore) {
        val lsb = GetBankIdx(wb_uop.rob_inst_idx)
        val idx = GetRowIdx(wb_uop.rob_inst_idx)
        val bsy_val = blockinfo(lsb).rob_bsy(idx).bsy.asUInt
        dbg(
          "type" -> "[Pipeline--WriteBack ROB]: Mark Completed Uop (ALU)",
          "pc" -> wb_uop.debug_pc.toHex,
          "inst" -> wb_uop.inst.toHex,
          "split_num" -> wb_uop.split_num,
          "self_index" -> wb_uop.self_index,
          "uopc" -> wb_uop.uopc,
          "last cycle block_bsy(7:0)" -> bsy_val(7, 0).toBin,
        )
      }
    }
    
    //debug: show the writeback information to rob (mem)
    if (PIPELINE_LOG_PRINTF) {
      for (w <- 0 until (memWidth + 1)) {
        when (io.lsu_clr_bsy(w).valid && MatchBank(GetBankIdx(io.lsu_clr_bsy(w).bits))) {
          val cidx = GetRowIdx(io.lsu_clr_bsy(w).bits)
          when (rob_uop(cidx).is_unicore) {
            val lsb = GetBankIdx(io.lsu_clr_bsy_first_idx(w))
            val idx = GetRowIdx(io.lsu_clr_bsy_first_idx(w))
            val bsy_val = blockinfo(lsb).rob_bsy(idx).bsy.asUInt
            dbg(
              "type" -> "[Pipeline--WriteBack ROB]: Mark Completed Uop (MEM)",
              "pc" -> rob_uop(cidx).debug_pc.toHex,
              "inst" -> rob_uop(cidx).inst.toHex,
              "split_num" -> rob_uop(cidx).split_num,
              "self_index" -> rob_uop(cidx).self_index,
              "uopc" -> rob_uop(cidx).uopc,
              "last cycle block_bsy(7:0)" -> bsy_val(7, 0).toBin,
            )
          }
        }
      }
    }
    ```

- commit: rob head information  (rob.scala)

  ```scala
  //debug: show the rob head information
  if (PIPELINE_LOG_PRINTF) {
    when(rob_val(rob_head) && rob_uop(rob_head).is_unicore){
      val bsy_val = blockinfo(inst_rob_lsb).rob_bsy(inst_rob_idx).bsy.asUInt
      dbg(
        "type" -> "[ROB Head Uop Info]",
        "w" -> w,
        "pc" -> rob_uop(rob_head).debug_pc.toHex,
        "inst" -> rob_uop(rob_head).inst.toHex,
        "split_num" -> rob_uop(rob_head).split_num,
        "self_index" -> rob_uop(rob_head).self_index,
        "block_bsy_bitvec(7:0)" -> bsy_val(7, 0).toBin,
        can_commit(w),
      )
    }
  }
  ```