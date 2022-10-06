# ndk_const.tcl: Base parameters
# Copyright (C) 2022 CESNET, z. s. p. o.
# Author(s): Jakub Cabal <cabal@cesnet.cz>
#
# SPDX-License-Identifier: BSD-3-Clause

set OFM_PATH        $env(OFM_PATH)
set COMBO_BASE      $env(COMBO_BASE)
set FIRMWARE_BASE   $env(FIRMWARE_BASE)
set CARD_BASE       $env(CARD_BASE)
set NDK_CONST       $env(NDK_CONST)
set DEFAULT_CONST   $env(DEFAULT_CONST)
set USER_CONST      $env(USER_CONST)
set OUTPUT_NAME     $env(OUTPUT_NAME)

set CARD_COMMON_BASE $COMBO_BASE/ndk/core/intel

source $OFM_PATH/build/VhdlPkgGen.tcl
source $OFM_PATH/build/Shared.tcl

set CARD_NAME "FB4CGG3"
if {$env(ETH_PORTS) == 2} {
    set CARD_NAME "FB2CGG3"
}
# Achitecture of Clock generator
set CLOCK_GEN_ARCH "USP"
# Achitecture of PCIe module
set PCIE_MOD_ARCH "USP"
# Achitecture of Network module
set NET_MOD_ARCH "CMAC"
# Achitecture of SDM/SYSMON module
set SDM_SYSMON_ARCH "USP_IDCOMP"

VhdlPkgBegin
# ------------------------------------------------------------------------------
# ETH parameters:
# ------------------------------------------------------------------------------
# Number of Ethernet ports, must match number of items in list ETH_PORTS_SPEED!
# This board exists in two variants: FB4CGG3 (with four QSFP ports) and FB2CGG3
# (with two QSFP). Set the correct number of ETH ports according to your card.
set ETH_PORTS         $env(ETH_PORTS)
# Speed for each one of the ETH_PORTS (allowed values: 100)
# ETH_PORT_SPEED is an array where each index represents given ETH_PORT and
# each index has associated a required port speed.
# NOTE: at this moment, all ports must have same speed !
set ETH_PORT_SPEED(0) $env(ETH_PORT_SPEED)
set ETH_PORT_SPEED(1) $env(ETH_PORT_SPEED)
set ETH_PORT_SPEED(2) $env(ETH_PORT_SPEED)
set ETH_PORT_SPEED(3) $env(ETH_PORT_SPEED)
# Number of channels for each one of the ETH_PORTS (allowed values: 1 for ETH_PORT_SPEED=100, 4 for ETH_PORT_SPEED<100)
# ETH_PORT_CHAN is an array where each index represents given ETH_PORT and
# each index has associated a required number of channels this port has.
# NOTE: at this moment, all ports must have same number of channels !
set ETH_PORT_CHAN(0) $env(ETH_PORT_CHAN)
set ETH_PORT_CHAN(1) $env(ETH_PORT_CHAN)
set ETH_PORT_CHAN(2) $env(ETH_PORT_CHAN)
set ETH_PORT_CHAN(3) $env(ETH_PORT_CHAN)
# Number of lanes for each one of the ETH_PORTS
# Typical values: 4 (QSFP), 8 (QSFP-DD)
set ETH_PORT_LANES(0) 4
set ETH_PORT_LANES(1) 4
set ETH_PORT_LANES(2) 4
set ETH_PORT_LANES(3) 4

# Source default constants
source $DEFAULT_CONST
# ------------------------------------------------------------------------------
# PCIe parameters (not all combinations work):
# ------------------------------------------------------------------------------
# Supported combinations for this card:
# 1x PCIe Gen3 x16 -- PCIE_GEN=3, PCIE_ENDPOINTS=1, PCIE_ENDPOINT_MODE=0 (Note: default configuration)
# ------------------------------------------------------------------------------
# PCIe Generation (possible values: 3):
# 3 = PCIe Gen3
set PCIE_GEN           3
# PCIe endpoints (possible values: 1):
# 1 = 1x PCIe x16 in one slot
set PCIE_ENDPOINTS     1
# PCIe endpoint mode (possible values: 0):
# 0 = 1x16 lanes
set PCIE_ENDPOINT_MODE 0

# Source application constants if they exists
if {$USER_CONST ne ""} {
	source $USER_CONST
}
# ------------------------------------------------------------------------------
# DMA parameters:
# ------------------------------------------------------------------------------
# This variable can be set in COREs *.mk file or as a parameter when launching the make
set DMA_TYPE    $env(DMA_TYPE)

# Source common core const scripts
source $CARD_COMMON_BASE/config/ndk_const.tcl
# ------------------------------------------------------------------------------
# Other parameters:
# ------------------------------------------------------------------------------
set TSU_FREQUENCY 322265625

set MEM_PORTS 0
