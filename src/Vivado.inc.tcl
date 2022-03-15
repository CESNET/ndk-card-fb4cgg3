# Vivado.inc.tcl: Vivado.tcl include
# Copyright (C) 2022 CESNET z.s.p.o.
# Author(s): Jakub Cabal <cabal@cesnet.cz>
#
# SPDX-License-Identifier: BSD-3-Clause

# NDK constants (populates all NDK variables from env)
source $env(NDK_CONST)

# Include common card script
source $CARD_COMMON_BASE/Vivado.inc.tcl

# Design parameters
set SYNTH_FLAGS(MODULE)    "fpga"
set SYNTH_FLAGS(FPGA)      "xcvu9p-flgb2104-2-i"
set SYNTH_FLAGS(MCS_IFACE) "SMAPx32"
set SYNTH_FLAGS(BOARD)     $CARD_NAME

# Main component
lappend HIERARCHY(COMPONENTS) [list "TOPLEVEL" $CARD_BASE/src "FULL"]

# XDC constraints for specific parts of the design
lappend SYNTH_FLAGS(CONSTR) "$CARD_BASE/constr/general.xdc"
lappend SYNTH_FLAGS(CONSTR) "$CARD_BASE/constr/pcie.xdc"
lappend SYNTH_FLAGS(CONSTR) "$CARD_BASE/constr/qsfp.xdc"
