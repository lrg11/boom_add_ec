# Parameters
CONFIG ?= MediumBoomConfig
THREADS ?= 8
FST_MODE ?= 1
EXT_PODMAN_FLAGS ?=

# PodMan directories
PODMAN_SRC_DIR := /root/bossa/generators/boom/src/main/scala
PODMAN_TARGET_DIRS := \
	/root/bossa/project/project/target \
	/root/bossa/project/target \
	/root/bossa/target \
	/root/bossa/tools/barstools/iocell/target \
	/root/bossa/generators/chipyard/target \
	/root/bossa/generators/testchipip/target \
	/root/bossa/generators/sifive-blocks/target \
	/root/bossa/generators/boom/target \
	/root/bossa/generators/rocket-chip/macros/target \
	/root/bossa/generators/rocket-chip/api-config-chipsalliance/build-rules/sbt/target \
	/root/bossa/generators/rocket-chip/hardfloat/target \
	/root/bossa/generators/rocket-chip/target
PODMAN_SIM_DIR := /root/bossa/sims/verilator
PODMAN_HARNESS_DIR := $(PODMAN_SIM_DIR)/build/TestHarness.$(CONFIG)
PODMAN_VERILOG_DIR := $(PODMAN_HARNESS_DIR)/verilog
PODMAN_BUILD_DIR := /root/build

# PodMan targets
PODMAN_VERILOG_FILE := $(PODMAN_SIM_DIR)/build/TestHarness.$(CONFIG)/verilog_files.f
PODMAN_SIM := $(PODMAN_SIM_DIR)/simulator-$(CONFIG)
PODMAN_SIM_DEBUG := $(PODMAN_SIM_DIR)/simulator-$(CONFIG)-debug
PODMAN_TOP_FIR := $(PODMAN_HARNESS_DIR)/TestHarness.$(CONFIG).fir
PODMAN_BUILD_SCRIPT := /root/build.sh

# Host directories
TOP_DIR := $(shell pwd)
HOST_BOOM_SRC_DIR := $(TOP_DIR)/src/main/scala
HOST_BOSSA_DIR := $(TOP_DIR)/bossa
define to_podman_bossa_file
$(patsubst $(HOST_BOSSA_DIR)/%,/root/bossa/%,$(1))
endef
HOST_CACHE_DIR := $(TOP_DIR)/cache
define to_host_target_dir
$(patsubst /root/bossa/%, $(HOST_CACHE_DIR)/%, $(1))
endef
HOST_TARGET_DIRS := $(call to_host_target_dir, $(PODMAN_TARGET_DIRS))
HOST_BUILD_DIR := $(TOP_DIR)/build
HOST_VERILOG_DIR := $(HOST_BUILD_DIR)/verilog

# Host files
HOST_SRCS := $(shell find $(HOST_BOOM_SRC_DIR) -name "*.scala")
HOST_BOSSA_FILES := $(shell find $(HOST_BOSSA_DIR) -type f)

# Host targets
HOST_VERILOG_FILE := $(HOST_BUILD_DIR)/verilog_files.f
SIM := $(TOP_DIR)/simulator-$(CONFIG)
SIM_DEBUG := $(TOP_DIR)/simulator-$(CONFIG)-debug
TOP_FIR := $(HOST_BUILD_DIR)/TestHarness.$(CONFIG).fir
TOP_FIR_PREV := $(HOST_BUILD_DIR)/TestHarness.$(CONFIG).prev.fir

PODMAN_BOOM_SRC_DIR := /root/bossa/generators/boom/src/main/scala
PODMAN_FLAGS := \
	$(foreach x,$(PODMAN_TARGET_DIRS),-v $(call to_host_target_dir,$(x)):$(x)) \
	$(foreach x,$(HOST_BOSSA_FILES),-v $(x):$(call to_podman_bossa_file,$(x))) \
	-v $(HOST_VERILOG_DIR):$(PODMAN_VERILOG_DIR) \
	-v $(HOST_VERILOG_FILE):$(PODMAN_VERILOG_FILE) \
	-v $(HOST_BUILD_DIR):$(PODMAN_BUILD_DIR) \
	-v $(HOST_BOOM_SRC_DIR):$(PODMAN_BOOM_SRC_DIR) \
	$(EXT_PODMAN_FLAGS)
PODMAN_MAKE := \
	make -C $(PODMAN_SIM_DIR) -j$(shell nproc) \
		CONFIG=$(CONFIG) \
		VERILATOR_THREADS=$(THREADS) \
		VERILATOR_FST_MODE=$(FST_MODE)
PODMAN_DEBUG_CMD := \
	echo \"\#!/bin/bash\" > $(PODMAN_BUILD_SCRIPT) && \
	echo \"$(PODMAN_MAKE) $(PODMAN_SIM) && cp $(PODMAN_SIM) $(PODMAN_TOP_FIR) $(PODMAN_BUILD_DIR)\" >> $(PODMAN_BUILD_SCRIPT) && \
	chmod +x $(PODMAN_BUILD_SCRIPT) && \
	bash

.PHONY: default debug clean clean-cache
default: $(SIM)
debug: $(SIM_DEBUG)
clean:
	-rm -rf $(HOST_BUILD_DIR)
clean-cache:
	-rm -rf $(HOST_CACHE_DIR)
checkstyle:
	$(SBT) $(SBT_FLAGS) scalastyle test:scalastyle
	
podman: $(HOST_TARGET_DIRS) $(HOST_VERILOG_DIR) $(HOST_VERILOG_FILE)
	touch $(TOP_FIR) && cp $(TOP_FIR) $(TOP_FIR_PREV)
	podman run -it --rm $(PODMAN_FLAGS) bossa-unicore bash -c "$(PODMAN_DEBUG_CMD)"

$(SIM): $(HOST_TARGET_DIRS) $(HOST_VERILOG_DIR) $(HOST_VERILOG_FILE) $(HOST_SRCS) $(HOST_BOSSA_FILES)
	touch $(TOP_FIR) && cp $(TOP_FIR) $(TOP_FIR_PREV)
	podman run -it --rm $(PODMAN_FLAGS) bossa-unicore bash -c \
		"$(PODMAN_MAKE) $(PODMAN_SIM) && cp $(PODMAN_SIM) $(PODMAN_TOP_FIR) $(PODMAN_BUILD_DIR)"
$(SIM_DEBUG): $(HOST_TARGET_DIRS) $(HOST_VERILOG_DIR) $(HOST_VERILOG_FILE) $(HOST_SRCS) $(HOST_BOSSA_FILES)
	touch $(TOP_FIR) && cp $(TOP_FIR) $(TOP_FIR_PREV)
	podman run -it --rm $(PODMAN_FLAGS) bossa-unicore bash -c \
		"$(PODMAN_MAKE) $(PODMAN_SIM_DEBUG) && cp $(PODMAN_SIM_DEBUG) $(PODMAN_TOP_FIR) $(PODMAN_BUILD_DIR)"

$(HOST_CACHE_DIR)/%:
	mkdir -p $@

$(HOST_VERILOG_DIR):
	mkdir -p $@

$(HOST_VERILOG_FILE):
	mkdir -p $(dir $@)
	touch $@
