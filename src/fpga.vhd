-- fpga.vhd: FB4CGG3 board top level entity and architecture
-- Copyright (C) 2022 CESNET z. s. p. o.
-- Author(s): Jakub Cabal <cabal@cesnet.cz>
--
-- SPDX-License-Identifier: BSD-3-Clause

library ieee;
library unisim;
library xpm;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.combo_const.all;
use work.combo_user_const.all;

use work.math_pack.all;
use work.type_pack.all;
use work.dma_bus_pack.all;

use unisim.vcomponents.all;

entity FPGA is
port (
    -- PCIe
    PCIE_SYSCLK_P       : in    std_logic;
    PCIE_SYSCLK_N       : in    std_logic;
    PCIE_SYSRST_N       : in    std_logic;
    PCIE_RX_P           : in    std_logic_vector(16-1 downto 0);
    PCIE_RX_N           : in    std_logic_vector(16-1 downto 0);
    PCIE_TX_P           : out   std_logic_vector(16-1 downto 0);
    PCIE_TX_N           : out   std_logic_vector(16-1 downto 0);

    -- 50 MHz external clock
    REFCLK              : in    std_logic;

    -- Pulse per second
    PPS_IN              : in    std_logic;
    PPS_OUT             : out   std_logic;

    -- SF2 SPI interface
    SF2_CLK             : out   std_logic;
    SF2_NSS             : out   std_logic;
    SF2_MOSI            : out   std_logic;
    SF2_MISO            : in    std_logic;

    -- QSFP control
    QSFP0_SCL           : inout std_logic;
    QSFP0_SDA           : inout std_logic;
    --QSFP0_MODSEL_N      : out   std_logic;
    QSFP0_LPMODE        : out   std_logic;
    QSFP0_RESET_N       : out   std_logic;
    QSFP0_MODPRS_N      : in    std_logic;
    QSFP0_INT_N         : in    std_logic;

    QSFP1_SCL           : inout std_logic;
    QSFP1_SDA           : inout std_logic;
    --QSFP1_MODSEL_N      : out   std_logic;
    QSFP1_LPMODE        : out   std_logic;
    QSFP1_RESET_N       : out   std_logic;
    QSFP1_MODPRS_N      : in    std_logic;
    QSFP1_INT_N         : in    std_logic;

    QSFP2_SCL           : inout std_logic;
    QSFP2_SDA           : inout std_logic;
    --QSFP2_MODSEL_N      : out   std_logic;
    QSFP2_LPMODE        : out   std_logic;
    QSFP2_RESET_N       : out   std_logic;
    QSFP2_MODPRS_N      : in    std_logic;
    QSFP2_INT_N         : in    std_logic;

    QSFP3_SCL           : inout std_logic;
    QSFP3_SDA           : inout std_logic;
    --QSFP3_MODSEL_N      : out   std_logic;
    QSFP3_LPMODE        : out   std_logic;
    QSFP3_RESET_N       : out   std_logic;
    QSFP3_MODPRS_N      : in    std_logic;
    QSFP3_INT_N         : in    std_logic;

    -- QSFP data
    QSFP0_REFCLK_P      : in    std_logic;
    QSFP0_REFCLK_N      : in    std_logic;
    QSFP0_RX_P          : in    std_logic_vector(3 downto 0);
    QSFP0_RX_N          : in    std_logic_vector(3 downto 0);
    QSFP0_TX_P          : out   std_logic_vector(3 downto 0);
    QSFP0_TX_N          : out   std_logic_vector(3 downto 0);

    QSFP1_REFCLK_P      : in    std_logic;
    QSFP1_REFCLK_N      : in    std_logic;
    QSFP1_RX_P          : in    std_logic_vector(3 downto 0);
    QSFP1_RX_N          : in    std_logic_vector(3 downto 0);
    QSFP1_TX_P          : out   std_logic_vector(3 downto 0);
    QSFP1_TX_N          : out   std_logic_vector(3 downto 0);

    QSFP2_REFCLK_P      : in    std_logic;
    QSFP2_REFCLK_N      : in    std_logic;
    QSFP2_RX_P          : in    std_logic_vector(3 downto 0);
    QSFP2_RX_N          : in    std_logic_vector(3 downto 0);
    QSFP2_TX_P          : out   std_logic_vector(3 downto 0);
    QSFP2_TX_N          : out   std_logic_vector(3 downto 0);

    QSFP3_REFCLK_P      : in    std_logic;
    QSFP3_REFCLK_N      : in    std_logic;
    QSFP3_RX_P          : in    std_logic_vector(3 downto 0);
    QSFP3_RX_N          : in    std_logic_vector(3 downto 0);
    QSFP3_TX_P          : out   std_logic_vector(3 downto 0);
    QSFP3_TX_N          : out   std_logic_vector(3 downto 0);

    STATUS_LED_G0       : out std_logic;
    STATUS_LED_R0       : out std_logic;
    STATUS_LED_G1       : out std_logic;
    STATUS_LED_R1       : out std_logic
);
end entity;

architecture FULL of FPGA is

    -- DMA debug parameters
    constant DMA_GEN_LOOP_EN     : boolean := true;

    constant PCIE_LANES          : integer := 16;
    constant PCIE_CLKS           : integer := 1;
    constant PCIE_CONS           : integer := 1;
    constant MISC_IN_WIDTH       : integer := 64;
    constant MISC_OUT_WIDTH      : integer := 64+1+1+1;
    constant ETH_LANES           : integer := 4;
    constant DMA_MODULES         : integer := PCIE_ENDPOINTS;
    constant DMA_ENDPOINTS       : integer := PCIE_ENDPOINTS;
    constant BOARD               : string  := "FB4CGG3"; --tsel(ETH_PORTS=4,"FB4CGG3","FB2CGG3")
    constant ETH_LANE_MAP        : integer_vector(4*ETH_LANES-1 downto 0) := (3, 2, 1, 0, 3, 2, 1, 0, 3, 2, 1, 0, 3, 2, 1, 0);
    constant ETH_LANE_RXPOLARITY : std_logic_vector(4*ETH_LANES-1 downto 0) := "1000100010001000";
    constant ETH_LANE_TXPOLARITY : std_logic_vector(4*ETH_LANES-1 downto 0) := "1111111111111111";

    signal sysclk_ibuf      : std_logic;
    signal sysclk_bufg      : std_logic;
    signal sysrst_cnt       : unsigned(4 downto 0) := (others => '0');
    signal sysrst           : std_logic := '1';

    signal eth_led_g        : std_logic_vector(4*4-1 downto 0);
    signal eth_led_r        : std_logic_vector(4*4-1 downto 0);
    
    signal eth_refclk_p     : std_logic_vector(4-1 downto 0);
    signal eth_refclk_n     : std_logic_vector(4-1 downto 0);
    signal eth_rx_p         : std_logic_vector(4*ETH_LANES-1 downto 0);
    signal eth_rx_n         : std_logic_vector(4*ETH_LANES-1 downto 0);
    signal eth_tx_p         : std_logic_vector(4*ETH_LANES-1 downto 0);
    signal eth_tx_n         : std_logic_vector(4*ETH_LANES-1 downto 0);

    signal qsfp_lpmode      : std_logic_vector(4-1 downto 0) := (others => '1');
    signal qsfp_reset_n     : std_logic_vector(4-1 downto 0) := (others => '0');
    signal qsfp_scl         : std_logic_vector(4-1 downto 0) := (others => 'Z');
    signal qsfp_sda         : std_logic_vector(4-1 downto 0) := (others => 'Z');
    signal qsfp_modprs_n    : std_logic_vector(4-1 downto 0);
    signal qsfp_int_n       : std_logic_vector(4-1 downto 0);
    
    signal misc_in          : std_logic_vector(MISC_IN_WIDTH-1 downto 0) := (others => '0');
    signal misc_out         : std_logic_vector(MISC_OUT_WIDTH-1 downto 0);

    signal boot_clk         : std_logic;
    signal boot_reset       : std_logic;
    signal boot_wr_en       : std_logic;
    signal boot_wr_data     : std_logic_vector(64-1 downto 0);
    signal boot_rd_data     : std_logic_vector(64-1 downto 0);

begin

    sysclk_ibuf_i : IBUFG
    port map (
        I  => REFCLK,
        O  => sysclk_ibuf
    );

    sysclk_bufg_i : BUFG
    port map (
        I => sysclk_ibuf,
        O => sysclk_bufg
    );

    -- reset after power up
    process(sysclk_bufg)
    begin
        if rising_edge(sysclk_bufg) then
            if (sysrst_cnt(sysrst_cnt'high) = '0') then
                sysrst_cnt <= sysrst_cnt + 1;
            end if;
            sysrst <= not sysrst_cnt(sysrst_cnt'high);
        end if;
    end process;

    PPS_OUT <= PPS_IN;

    -- QSFP MAPPING ------------------------------------------------------------
    eth_refclk_p <= QSFP0_REFCLK_P & QSFP1_REFCLK_P & QSFP2_REFCLK_P & QSFP3_REFCLK_P;
    eth_refclk_n <= QSFP0_REFCLK_N & QSFP1_REFCLK_N & QSFP2_REFCLK_N & QSFP3_REFCLK_N;

    eth_rx_p <= QSFP0_RX_P & QSFP1_RX_P & QSFP2_RX_P & QSFP3_RX_P;
    eth_rx_n <= QSFP0_RX_N & QSFP1_RX_N & QSFP2_RX_N & QSFP3_RX_N;

    QSFP3_TX_P <= eth_tx_p(1*ETH_LANES-1 downto 0*ETH_LANES);
    QSFP3_TX_N <= eth_tx_n(1*ETH_LANES-1 downto 0*ETH_LANES);
    QSFP2_TX_P <= eth_tx_p(2*ETH_LANES-1 downto 1*ETH_LANES);
    QSFP2_TX_N <= eth_tx_n(2*ETH_LANES-1 downto 1*ETH_LANES);
    qsfp_fb4cgg3_g: if (ETH_PORTS=4) generate
        QSFP1_TX_P <= eth_tx_p(3*ETH_LANES-1 downto 2*ETH_LANES);
        QSFP1_TX_N <= eth_tx_n(3*ETH_LANES-1 downto 2*ETH_LANES);
        QSFP0_TX_P <= eth_tx_p(4*ETH_LANES-1 downto 3*ETH_LANES);
        QSFP0_TX_N <= eth_tx_n(4*ETH_LANES-1 downto 3*ETH_LANES);
    end generate;

    QSFP3_LPMODE  <= qsfp_lpmode(0);
    QSFP3_RESET_N <= qsfp_reset_n(0);
    QSFP3_SCL     <= qsfp_scl(0);
    QSFP3_SDA     <= qsfp_sda(0);
    QSFP2_LPMODE  <= qsfp_lpmode(1);
    QSFP2_RESET_N <= qsfp_reset_n(1);
    QSFP2_SCL     <= qsfp_scl(1);
    QSFP2_SDA     <= qsfp_sda(1);
    QSFP1_LPMODE  <= qsfp_lpmode(2);
    QSFP1_RESET_N <= qsfp_reset_n(2);
    QSFP1_SCL     <= qsfp_scl(2);
    QSFP1_SDA     <= qsfp_sda(2);
    QSFP0_LPMODE  <= qsfp_lpmode(3);
    QSFP0_RESET_N <= qsfp_reset_n(3);
    QSFP0_SCL     <= qsfp_scl(3);
    QSFP0_SDA     <= qsfp_sda(3);

    qsfp_modprs_n <= QSFP0_MODPRS_N & QSFP1_MODPRS_N & QSFP2_MODPRS_N & QSFP3_MODPRS_N;
    qsfp_int_n    <= QSFP0_INT_N & QSFP1_INT_N & QSFP2_INT_N & QSFP3_INT_N;

    -- SPI FLASH DRIVER --------------------------------------------------------
    boot_clk     <= misc_out(0);
    boot_reset   <= misc_out(1);
    boot_wr_en   <= misc_out(2);
    boot_wr_data <= misc_out(3+64-1 downto 3);

    misc_in <= boot_rd_data;

    spi_flash_driver_i : entity work.SPI_FLASH_DRIVER
    port map (
        CLK         => boot_clk,
        RESET       => boot_reset,

        REG_WR_DATA => boot_wr_data,
        REG_WR_EN   => boot_wr_en,
        REG_RD_DATA => boot_rd_data,

        SPI_CLK     => SF2_CLK,
        SPI_CS_N    => SF2_NSS,
        SPI_MOSI    => SF2_MOSI,
        SPI_MISO    => SF2_MISO
    );

    -- FPGA COMMON -------------------------------------------------------------
    usp_i : entity work.FPGA_COMMON
    generic map (
        SYSCLK_FREQ             => 50,

        PCIE_LANES              => PCIE_LANES,
        PCIE_CLKS               => PCIE_CLKS,
        PCIE_CONS               => PCIE_CONS,

        ETH_PORTS               => ETH_PORTS,
        ETH_PORT_SPEED          => ETH_PORT_SPEED,
        ETH_PORT_CHAN           => ETH_PORT_CHAN,
        ETH_LANES               => ETH_LANES,
        ETH_LANE_MAP            => ETH_LANE_MAP(ETH_PORTS*ETH_LANES-1 downto 0),
        ETH_LANE_RXPOLARITY     => ETH_LANE_RXPOLARITY(ETH_PORTS*ETH_LANES-1 downto 0),
        ETH_LANE_TXPOLARITY     => ETH_LANE_TXPOLARITY(ETH_PORTS*ETH_LANES-1 downto 0),

        QSFP_PORTS              => ETH_PORTS,
        QSFP_I2C_PORTS          => ETH_PORTS,
        ETH_PORT_LEDS           => 4,

        STATUS_LEDS             => 2,

        MISC_IN_WIDTH           => MISC_IN_WIDTH,
        MISC_OUT_WIDTH          => MISC_OUT_WIDTH,

        PCIE_ENDPOINTS          => PCIE_ENDPOINTS,
        PCIE_ENDPOINT_TYPE      => "USP",
        PCIE_ENDPOINT_MODE      => PCIE_ENDPOINT_MODE,

        DMA_ENDPOINTS           => DMA_ENDPOINTS,
        DMA_MODULES             => DMA_MODULES,

        DMA_RX_CHANNELS         => DMA_RX_CHANNELS/DMA_MODULES,
        DMA_TX_CHANNELS         => DMA_TX_CHANNELS/DMA_MODULES,

        BOARD                   => BOARD,
        DEVICE                  => "ULTRASCALE",

        DMA_GEN_LOOP_EN         => DMA_GEN_LOOP_EN
    )
    port map(
        SYSCLK                  => sysclk_bufg,
        SYSRST                  => sysrst,

        PCIE_SYSCLK_P(0)        => PCIE_SYSCLK_P,
        PCIE_SYSCLK_N(0)        => PCIE_SYSCLK_N,
        PCIE_SYSRST_N(0)        => PCIE_SYSRST_N,
        PCIE_RX_P               => PCIE_RX_P,
        PCIE_RX_N               => PCIE_RX_N,
        PCIE_TX_P               => PCIE_TX_P,
        PCIE_TX_N               => PCIE_TX_N,

        ETH_REFCLK_P            => eth_refclk_p(ETH_PORTS-1 downto 0),
        ETH_REFCLK_N            => eth_refclk_n(ETH_PORTS-1 downto 0),

        ETH_RX_P                => eth_rx_p(ETH_PORTS*ETH_LANES-1 downto 0),
        ETH_RX_N                => eth_rx_n(ETH_PORTS*ETH_LANES-1 downto 0),
        ETH_TX_P                => eth_tx_p(ETH_PORTS*ETH_LANES-1 downto 0),
        ETH_TX_N                => eth_tx_n(ETH_PORTS*ETH_LANES-1 downto 0),

        ETH_LED_R               => eth_led_r(ETH_PORTS*4-1 downto 0),
        ETH_LED_G               => eth_led_g(ETH_PORTS*4-1 downto 0),

        QSFP_I2C_SCL            => qsfp_scl(ETH_PORTS-1 downto 0),
        QSFP_I2C_SDA            => qsfp_sda(ETH_PORTS-1 downto 0),

        QSFP_MODSEL_N           => open,
        QSFP_LPMODE             => qsfp_lpmode(ETH_PORTS-1 downto 0),
        QSFP_RESET_N            => qsfp_reset_n(ETH_PORTS-1 downto 0),
        QSFP_MODPRS_N           => qsfp_modprs_n(ETH_PORTS-1 downto 0),
        QSFP_INT_N              => qsfp_int_n(ETH_PORTS-1 downto 0),

        STATUS_LED_G(0)         => STATUS_LED_G0,
        STATUS_LED_G(1)         => STATUS_LED_G1,
        STATUS_LED_R(0)         => STATUS_LED_R0,
        STATUS_LED_R(1)         => STATUS_LED_R1,

        MISC_IN                 => misc_in,
        MISC_OUT                => misc_out
    );

end architecture;
