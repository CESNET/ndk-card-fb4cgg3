# Modules.tcl: script to compile card
# Copyright (C) 2022 CESNET z. s. p. o.
# Author(s): Jakub Cabal <cabal@cesnet.cz>
#
# SPDX-License-Identifier: BSD-3-Clause

# Globally defined variables
global CARD_COMMON_BASE
global ETH_ENABLE
global ETH_PORT_SPEED
global BOARD
set BOARD "FB4CGG3"

# Paths
set SPI_FLASH_DRIVER_BASE "$ENTITY_BASE/comp/spi_flash_driver/"

# Components
lappend COMPONENTS [list "FPGA_COMMON"      $CARD_COMMON_BASE      $BOARD]
lappend COMPONENTS [list "SPI_FLASH_DRIVER" $SPI_FLASH_DRIVER_BASE "FULL"]

# IP sources
lappend MOD "$ENTITY_BASE/ip/pcie4_uscale_plus/pcie4_uscale_plus.xci"
lappend MOD "$ENTITY_BASE/ip/xvc_vsec/xvc_vsec.xci"
lappend MOD "$ENTITY_BASE/ip/cmac_eth_1x100g/cmac_eth_1x100g.xci"

# Top-level
lappend MOD "$ENTITY_BASE/fpga.vhd"
