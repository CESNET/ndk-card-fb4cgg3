# Vivado.inc.tcl: Vivado.tcl include
# Copyright (C) 2022 CESNET z.s.p.o.
# Author(s): Jakub Cabal <cabal@cesnet.cz>
#            Vladislav Valek <valekv@cesnet.cz>
#
# SPDX-License-Identifier: BSD-3-Clause

# Source configuration files(populates all variables from env)
source $env(CORE_BASE)/config/core_bootstrap.tcl

# Include CORE script
source $CORE_BASE/Vivado.inc.tcl

# Design parameters
set SYNTH_FLAGS(MODULE)    "fpga"
set SYNTH_FLAGS(FPGA)      "xcvu9p-flgb2104-2-i"
set SYNTH_FLAGS(MCS_IFACE) "SMAPx32"
set SYNTH_FLAGS(BOARD)     $CARD_NAME

# Optimization directives for implementation
set SYNTH_FLAGS(SOPT_DIRECTIVE)  "Explore"
set SYNTH_FLAGS(PLACE_DIRECTIVE) "Explore"
set SYNTH_FLAGS(POPT_DIRECTIVE)  "Explore"
set SYNTH_FLAGS(ROUTE_DIRECTIVE) "Explore"

# Main component
lappend HIERARCHY(COMPONENTS) [list "TOPLEVEL" $CARD_BASE/src "FULL"]

# XDC constraints for specific parts of the design
lappend SYNTH_FLAGS(CONSTR) "$CARD_BASE/constr/general.xdc"
lappend SYNTH_FLAGS(CONSTR) "$CARD_BASE/constr/pcie.xdc"
lappend SYNTH_FLAGS(CONSTR) "$CARD_BASE/constr/qsfp.xdc"
if {$ETH_PORTS == 2} {
    lappend SYNTH_FLAGS(CONSTR) "$CARD_BASE/constr/qsfp_fb2_only.xdc"
}
lappend SYNTH_FLAGS(CONSTR) [list "$CARD_BASE/constr/qsfp_loc.xdc" USED_IN implementation]
