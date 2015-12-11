<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK_125M" />
        <signal name="RX_CLK" />
        <signal name="RX_DV" />
        <signal name="PHY_RX(7:0)" />
        <signal name="DIMMER(4:0)" />
        <signal name="PAGE" />
        <signal name="WB_EEP_WR" />
        <signal name="WR_GAMMA" />
        <signal name="DATA_GAMMA(23:0)" />
        <signal name="CONFIG_ETH(31:0)" />
        <signal name="XLXN_232(8:0)" />
        <signal name="XLXN_237(8:0)" />
        <signal name="DB1" />
        <signal name="XLXN_202(8:0)" />
        <signal name="DATA_WB(23:0)" />
        <signal name="ADD_WB(7:0)" />
        <signal name="WR_WB" />
        <signal name="PHY_RESET" />
        <signal name="DB5" />
        <signal name="DB6" />
        <signal name="DB7" />
        <signal name="DATA_WB_I(23:0)" />
        <signal name="XLXN_1(8:0)" />
        <signal name="XLXN_249(10:0)" />
        <signal name="XLXN_253" />
        <signal name="XLXN_283" />
        <signal name="XLXN_284" />
        <signal name="XLXN_285" />
        <signal name="XLXN_29(8:0)" />
        <signal name="XLXN_250(10:0)" />
        <signal name="XLXN_254" />
        <signal name="XLXN_286" />
        <signal name="XLXN_287" />
        <signal name="RX_DV2" />
        <signal name="PHY_RXD2(7:0)" />
        <signal name="RX_CLK2" />
        <signal name="XLXN_292" />
        <signal name="RESET" />
        <signal name="DB8" />
        <signal name="GTX_CLK2" />
        <signal name="PHY_TXD2(7:0)" />
        <signal name="TX_EN2" />
        <signal name="DB2" />
        <signal name="XLXN_345" />
        <signal name="PHY_MDIO" />
        <signal name="PHY_MDC" />
        <signal name="ADDRESS(13:0)" />
        <signal name="DATA(23:0)" />
        <signal name="WE" />
        <signal name="XLXN_370" />
        <signal name="XLXN_371" />
        <signal name="XLXN_372" />
        <signal name="XLXN_375" />
        <signal name="DB_1" />
        <signal name="GTX_CLK" />
        <signal name="PHY_TXD(7:0)" />
        <signal name="TX_EN" />
        <signal name="DB3" />
        <signal name="DB4" />
        <signal name="XLXN_389" />
        <signal name="BLINK_OUT" />
        <port polarity="Input" name="CLK_125M" />
        <port polarity="Input" name="RX_CLK" />
        <port polarity="Input" name="RX_DV" />
        <port polarity="Input" name="PHY_RX(7:0)" />
        <port polarity="Output" name="DIMMER(4:0)" />
        <port polarity="Output" name="PAGE" />
        <port polarity="Output" name="WB_EEP_WR" />
        <port polarity="Output" name="WR_GAMMA" />
        <port polarity="Output" name="DATA_GAMMA(23:0)" />
        <port polarity="Input" name="CONFIG_ETH(31:0)" />
        <port polarity="Output" name="DATA_WB(23:0)" />
        <port polarity="Output" name="ADD_WB(7:0)" />
        <port polarity="Output" name="WR_WB" />
        <port polarity="Output" name="PHY_RESET" />
        <port polarity="Output" name="DB5" />
        <port polarity="Output" name="DB6" />
        <port polarity="Output" name="DB7" />
        <port polarity="Input" name="DATA_WB_I(23:0)" />
        <port polarity="Input" name="RX_DV2" />
        <port polarity="Input" name="PHY_RXD2(7:0)" />
        <port polarity="Input" name="RX_CLK2" />
        <port polarity="Input" name="RESET" />
        <port polarity="Output" name="DB8" />
        <port polarity="Output" name="GTX_CLK2" />
        <port polarity="Output" name="PHY_TXD2(7:0)" />
        <port polarity="Output" name="TX_EN2" />
        <port polarity="Output" name="DB2" />
        <port polarity="Output" name="PHY_MDIO" />
        <port polarity="Output" name="PHY_MDC" />
        <port polarity="Output" name="ADDRESS(13:0)" />
        <port polarity="Output" name="DATA(23:0)" />
        <port polarity="Output" name="WE" />
        <port polarity="Output" name="DB_1" />
        <port polarity="Output" name="GTX_CLK" />
        <port polarity="Output" name="PHY_TXD(7:0)" />
        <port polarity="Output" name="TX_EN" />
        <port polarity="Output" name="DB3" />
        <port polarity="Output" name="DB4" />
        <port polarity="Output" name="BLINK_OUT" />
        <blockdef name="ETH_RX">
            <timestamp>2014-5-19T4:51:22</timestamp>
            <line x2="528" y1="592" y2="592" x1="464" />
            <line x2="0" y1="560" y2="560" x1="64" />
            <line x2="528" y1="528" y2="528" x1="464" />
            <line x2="528" y1="400" y2="400" x1="464" />
            <line x2="528" y1="432" y2="432" x1="464" />
            <line x2="528" y1="464" y2="464" x1="464" />
            <line x2="528" y1="368" y2="368" x1="464" />
            <line x2="528" y1="336" y2="336" x1="464" />
            <line x2="528" y1="304" y2="304" x1="464" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="464" y="-492" height="24" />
            <line x2="528" y1="-480" y2="-480" x1="464" />
            <rect width="64" x="464" y="-460" height="24" />
            <line x2="528" y1="-448" y2="-448" x1="464" />
            <line x2="528" y1="-416" y2="-416" x1="464" />
            <rect width="64" x="464" y="-332" height="24" />
            <line x2="528" y1="-320" y2="-320" x1="464" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <line x2="528" y1="-192" y2="-192" x1="464" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="64" x="464" y="-140" height="24" />
            <line x2="528" y1="-128" y2="-128" x1="464" />
            <line x2="528" y1="112" y2="112" x1="464" />
            <line x2="528" y1="144" y2="144" x1="464" />
            <line x2="528" y1="80" y2="80" x1="464" />
            <line x2="528" y1="48" y2="48" x1="464" />
            <line x2="528" y1="16" y2="16" x1="464" />
            <rect width="64" x="464" y="228" height="24" />
            <line x2="528" y1="240" y2="240" x1="464" />
            <rect width="64" x="464" y="260" height="24" />
            <line x2="528" y1="272" y2="272" x1="464" />
            <line x2="528" y1="208" y2="208" x1="464" />
            <rect width="64" x="0" y="196" height="24" />
            <line x2="0" y1="208" y2="208" x1="64" />
            <rect width="64" x="0" y="-156" height="24" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <line x2="528" y1="560" y2="560" x1="464" />
            <line x2="528" y1="-16" y2="-16" x1="464" />
            <line x2="528" y1="-48" y2="-48" x1="464" />
            <line x2="528" y1="-80" y2="-80" x1="464" />
            <rect width="64" x="464" y="-92" height="24" />
            <rect width="400" x="64" y="-512" height="1192" />
        </blockdef>
        <blockdef name="ETH_TX">
            <timestamp>2013-9-11T6:36:49</timestamp>
            <line x2="464" y1="-192" y2="-192" x1="400" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <rect width="64" x="400" y="-508" height="24" />
            <line x2="464" y1="-496" y2="-496" x1="400" />
            <line x2="464" y1="-528" y2="-528" x1="400" />
            <line x2="464" y1="-464" y2="-464" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <line x2="464" y1="-256" y2="-256" x1="400" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-320" y2="-320" x1="400" />
            <line x2="0" y1="-512" y2="-512" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-396" height="24" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="336" x="64" y="-576" height="472" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
        </blockdef>
        <blockdef name="FIFO_GTX_SCH">
            <timestamp>2013-9-5T7:52:31</timestamp>
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <rect width="64" x="384" y="-316" height="24" />
            <line x2="448" y1="-304" y2="-304" x1="384" />
            <rect width="64" x="0" y="-252" height="24" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="0" y1="-176" y2="-176" x1="64" />
            <rect width="64" x="384" y="-284" height="24" />
            <line x2="448" y1="-272" y2="-272" x1="384" />
            <line x2="448" y1="-176" y2="-176" x1="384" />
            <line x2="448" y1="-208" y2="-208" x1="384" />
            <line x2="384" y1="-240" y2="-240" x1="448" />
            <rect width="320" x="64" y="-320" height="204" />
        </blockdef>
        <blockdef name="ETH_RX_BP">
            <timestamp>2013-8-13T10:18:8</timestamp>
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <rect width="64" x="464" y="-268" height="24" />
            <line x2="528" y1="-256" y2="-256" x1="464" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <rect width="400" x="64" y="-320" height="248" />
        </blockdef>
        <blockdef name="ETH_SELECT_LOOP">
            <timestamp>2012-8-21T9:46:48</timestamp>
            <line x2="400" y1="-240" y2="-240" x1="336" />
            <rect width="64" x="0" y="-460" height="24" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <rect width="64" x="336" y="-460" height="24" />
            <line x2="400" y1="-448" y2="-448" x1="336" />
            <rect width="64" x="0" y="-316" height="24" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <line x2="400" y1="-368" y2="-368" x1="336" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="400" y1="-416" y2="-416" x1="336" />
            <rect width="272" x="64" y="-512" height="300" />
        </blockdef>
        <blockdef name="bufgmux_1">
            <timestamp>2008-10-8T15:57:24</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="and2b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="serial_management">
            <timestamp>2013-9-10T13:44:11</timestamp>
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-128" height="320" />
        </blockdef>
        <block symbolname="ETH_RX" name="ETH_RXi">
            <blockpin signalname="CLK_125M" name="CLK" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="RX_CLK" name="RX_CLK" />
            <blockpin signalname="RX_DV" name="RX_DV" />
            <blockpin signalname="XLXN_370" name="RX_ACTIVE_IN" />
            <blockpin signalname="PHY_RX(7:0)" name="PHY_RXD(7:0)" />
            <blockpin signalname="DATA_WB_I(23:0)" name="DATA_IN_WB(23:0)" />
            <blockpin signalname="CONFIG_ETH(31:0)" name="CONFIG_REG(31:0)" />
            <blockpin signalname="PHY_RESET" name="PHY_RESET" />
            <blockpin signalname="WE" name="WE" />
            <blockpin signalname="XLXN_375" name="WR_PHY_1" />
            <blockpin signalname="XLXN_345" name="WR_PHY_2" />
            <blockpin signalname="WR_GAMMA" name="WR_GAMMA" />
            <blockpin signalname="WR_WB" name="WR_WB" />
            <blockpin signalname="WB_EEP_WR" name="WB_EEP_WR" />
            <blockpin signalname="BLINK_OUT" name="BLINK_OUT" />
            <blockpin name="LED_ERROR_TG" />
            <blockpin name="RST_WB_BRAM" />
            <blockpin signalname="PAGE" name="PAGE" />
            <blockpin signalname="XLXN_372" name="PHY_B_RESET" />
            <blockpin signalname="XLXN_371" name="PHY_A_RESET" />
            <blockpin name="LED_OS" />
            <blockpin name="DEBUG1" />
            <blockpin name="DEBUG2" />
            <blockpin name="DEBUG3" />
            <blockpin name="DEBUG4" />
            <blockpin signalname="DB5" name="DEBUG5" />
            <blockpin signalname="DB6" name="DEBUG6" />
            <blockpin signalname="DB7" name="DEBUG7" />
            <blockpin name="DEBUG8" />
            <blockpin signalname="ADDRESS(13:0)" name="ADDRESS(13:0)" />
            <blockpin signalname="DATA(23:0)" name="DATA(23:0)" />
            <blockpin signalname="XLXN_202(8:0)" name="DATA_OUT_PHY(8:0)" />
            <blockpin signalname="DATA_GAMMA(23:0)" name="DATA_GAMMA(23:0)" />
            <blockpin signalname="DATA_WB(23:0)" name="DATA_OUT_WB(23:0)" />
            <blockpin signalname="ADD_WB(7:0)" name="ADD_WB(7:0)" />
            <blockpin signalname="DIMMER(4:0)" name="DIMMER(4:0)" />
        </block>
        <block symbolname="and2b1" name="XLXI_7">
            <blockpin signalname="XLXN_285" name="I0" />
            <blockpin signalname="XLXN_283" name="I1" />
            <blockpin signalname="XLXN_284" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_8">
            <blockpin signalname="XLXN_286" name="I0" />
            <blockpin signalname="XLXN_345" name="I1" />
            <blockpin signalname="XLXN_287" name="O" />
        </block>
        <block symbolname="ETH_RX_BP" name="ETH_RXbi">
            <blockpin signalname="XLXN_292" name="RX_CLK" />
            <blockpin signalname="RX_DV2" name="RX_DV" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="PHY_RXD2(7:0)" name="PHY_RXD(7:0)" />
            <blockpin signalname="XLXN_389" name="WR_PHY" />
            <blockpin signalname="XLXN_232(8:0)" name="DATA_OUT_PHY(8:0)" />
            <blockpin signalname="CLK_125M" name="CLK" />
            <blockpin signalname="XLXN_370" name="RX_ACTIVE" />
        </block>
        <block symbolname="bufgmux_1" name="ETH_CLK_MUXi">
            <blockpin signalname="RX_CLK" name="I0" />
            <blockpin signalname="RX_CLK2" name="I1" />
            <blockpin signalname="XLXN_370" name="S" />
            <blockpin signalname="DB1" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_36">
            <blockpin signalname="RX_CLK2" name="I" />
            <blockpin signalname="XLXN_292" name="O" />
        </block>
        <block symbolname="FIFO_GTX_SCH" name="FIFO_ETH2i">
            <blockpin signalname="RX_CLK" name="WR_CLK" />
            <blockpin signalname="XLXN_287" name="WR_EN" />
            <blockpin signalname="CLK_125M" name="RD_CLK" />
            <blockpin signalname="XLXN_254" name="RD_EN" />
            <blockpin signalname="XLXN_202(8:0)" name="DIN(8:0)" />
            <blockpin signalname="XLXN_286" name="WR_FULL" />
            <blockpin name="RD_EMPTY" />
            <blockpin signalname="XLXN_29(8:0)" name="DOUT(8:0)" />
            <blockpin signalname="XLXN_250(10:0)" name="RD_COUNT(10:0)" />
            <blockpin signalname="RESET" name="RESET" />
        </block>
        <block symbolname="FIFO_GTX_SCH" name="FIFO_ETH1i">
            <blockpin signalname="DB1" name="WR_CLK" />
            <blockpin signalname="XLXN_284" name="WR_EN" />
            <blockpin signalname="CLK_125M" name="RD_CLK" />
            <blockpin signalname="XLXN_253" name="RD_EN" />
            <blockpin signalname="XLXN_237(8:0)" name="DIN(8:0)" />
            <blockpin signalname="XLXN_285" name="WR_FULL" />
            <blockpin name="RD_EMPTY" />
            <blockpin signalname="XLXN_1(8:0)" name="DOUT(8:0)" />
            <blockpin signalname="XLXN_249(10:0)" name="RD_COUNT(10:0)" />
            <blockpin signalname="RESET" name="RESET" />
        </block>
        <block symbolname="ETH_TX" name="ETH_TX2i">
            <blockpin signalname="CLK_125M" name="CLK" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="XLXN_29(8:0)" name="DATA_IN(8:0)" />
            <blockpin signalname="XLXN_250(10:0)" name="RD_COUNT(10:0)" />
            <blockpin signalname="GTX_CLK2" name="GTX_CLK" />
            <blockpin signalname="TX_EN2" name="TX_EN" />
            <blockpin signalname="DB8" name="PHY_MDC" />
            <blockpin name="PHY_MDIO" />
            <blockpin signalname="XLXN_254" name="RD_EN" />
            <blockpin name="DEBUG1" />
            <blockpin name="DEBUG2" />
            <blockpin name="DEBUG3" />
            <blockpin name="DEBUG4" />
            <blockpin signalname="PHY_TXD2(7:0)" name="PHY_TXD(7:0)" />
        </block>
        <block symbolname="ETH_TX" name="ETH_TX1i">
            <blockpin signalname="CLK_125M" name="CLK" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="XLXN_1(8:0)" name="DATA_IN(8:0)" />
            <blockpin signalname="XLXN_249(10:0)" name="RD_COUNT(10:0)" />
            <blockpin signalname="GTX_CLK" name="GTX_CLK" />
            <blockpin signalname="TX_EN" name="TX_EN" />
            <blockpin name="PHY_MDC" />
            <blockpin name="PHY_MDIO" />
            <blockpin signalname="XLXN_253" name="RD_EN" />
            <blockpin name="DEBUG1" />
            <blockpin name="DEBUG2" />
            <blockpin name="DEBUG3" />
            <blockpin name="DEBUG4" />
            <blockpin signalname="PHY_TXD(7:0)" name="PHY_TXD(7:0)" />
        </block>
        <block symbolname="buf" name="XLXI_43">
            <blockpin signalname="XLXN_345" name="I" />
            <blockpin signalname="DB2" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_42">
            <blockpin signalname="PHY_MDIO" name="I" />
            <blockpin name="O" />
        </block>
        <block symbolname="buf" name="XLXI_40">
            <blockpin signalname="PHY_MDC" name="I" />
            <blockpin name="O" />
        </block>
        <block symbolname="serial_management" name="XLXI_44">
            <blockpin signalname="CLK_125M" name="CLK" />
            <blockpin signalname="CONFIG_ETH(31:0)" name="CONFIG_REG(31:0)" />
            <blockpin signalname="PHY_MDIO" name="MDIO" />
            <blockpin signalname="PHY_MDC" name="MDC" />
            <blockpin signalname="XLXN_371" name="PHY_RESET_A_in" />
            <blockpin signalname="XLXN_372" name="PHY_RESET_B_in" />
        </block>
        <block symbolname="ETH_SELECT_LOOP" name="ETH_SELECT_LOOPi">
            <blockpin signalname="XLXN_375" name="WR_EN1" />
            <blockpin signalname="XLXN_389" name="WR_EN2" />
            <blockpin signalname="XLXN_370" name="ENABLE1" />
            <blockpin signalname="XLXN_202(8:0)" name="DIN1(8:0)" />
            <blockpin signalname="XLXN_232(8:0)" name="DIN2(8:0)" />
            <blockpin signalname="XLXN_283" name="WR_ENO" />
            <blockpin name="ENABLE" />
            <blockpin signalname="XLXN_237(8:0)" name="ODIN1(8:0)" />
            <blockpin name="DB" />
        </block>
        <block symbolname="buf" name="XLXI_47">
            <blockpin signalname="XLXN_375" name="I" />
            <blockpin signalname="DB_1" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_45">
            <blockpin signalname="TX_EN" name="I" />
            <blockpin name="O" />
        </block>
        <block symbolname="buf" name="XLXI_50">
            <blockpin signalname="RX_DV2" name="I" />
            <blockpin signalname="DB3" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_46">
            <blockpin signalname="XLXN_389" name="I" />
            <blockpin signalname="DB4" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="CLK_125M">
            <wire x2="896" y1="576" y2="768" x1="896" />
            <wire x2="896" y1="768" y2="2976" x1="896" />
            <wire x2="1232" y1="2976" y2="2976" x1="896" />
            <wire x2="1168" y1="768" y2="768" x1="896" />
            <wire x2="3408" y1="576" y2="576" x1="896" />
            <wire x2="3408" y1="576" y2="768" x1="3408" />
            <wire x2="4032" y1="768" y2="768" x1="3408" />
            <wire x2="3408" y1="768" y2="1024" x1="3408" />
            <wire x2="3536" y1="1024" y2="1024" x1="3408" />
            <wire x2="3408" y1="1024" y2="1872" x1="3408" />
            <wire x2="3408" y1="1872" y2="2816" x1="3408" />
            <wire x2="4064" y1="2816" y2="2816" x1="3408" />
            <wire x2="3408" y1="2816" y2="3072" x1="3408" />
            <wire x2="3568" y1="3072" y2="3072" x1="3408" />
            <wire x2="3856" y1="1872" y2="1872" x1="3408" />
            <wire x2="3408" y1="336" y2="336" x1="3152" />
            <wire x2="3408" y1="336" y2="576" x1="3408" />
        </branch>
        <branch name="RX_CLK">
            <wire x2="832" y1="640" y2="640" x1="720" />
            <wire x2="832" y1="640" y2="1776" x1="832" />
            <wire x2="2624" y1="1776" y2="1776" x1="832" />
            <wire x2="832" y1="1776" y2="3248" x1="832" />
            <wire x2="3376" y1="3248" y2="3248" x1="832" />
            <wire x2="1168" y1="640" y2="640" x1="832" />
            <wire x2="3568" y1="2944" y2="2944" x1="3376" />
            <wire x2="3376" y1="2944" y2="3248" x1="3376" />
        </branch>
        <branch name="RX_DV">
            <wire x2="1008" y1="672" y2="672" x1="720" />
            <wire x2="1168" y1="672" y2="672" x1="1008" />
            <wire x2="1152" y1="288" y2="288" x1="1008" />
            <wire x2="1008" y1="288" y2="672" x1="1008" />
        </branch>
        <branch name="PHY_RX(7:0)">
            <wire x2="1168" y1="704" y2="704" x1="720" />
        </branch>
        <branch name="DIMMER(4:0)">
            <wire x2="1728" y1="800" y2="800" x1="1696" />
        </branch>
        <branch name="PAGE">
            <wire x2="1728" y1="832" y2="832" x1="1696" />
        </branch>
        <branch name="WB_EEP_WR">
            <wire x2="1728" y1="928" y2="928" x1="1696" />
        </branch>
        <branch name="WR_GAMMA">
            <wire x2="1728" y1="960" y2="960" x1="1696" />
        </branch>
        <branch name="DATA_GAMMA(23:0)">
            <wire x2="1728" y1="992" y2="992" x1="1696" />
        </branch>
        <branch name="CONFIG_ETH(31:0)">
            <wire x2="960" y1="976" y2="976" x1="720" />
            <wire x2="1168" y1="976" y2="976" x1="960" />
            <wire x2="960" y1="560" y2="976" x1="960" />
            <wire x2="3104" y1="560" y2="560" x1="960" />
            <wire x2="3104" y1="560" y2="2000" x1="3104" />
            <wire x2="3856" y1="2000" y2="2000" x1="3104" />
        </branch>
        <branch name="XLXN_232(8:0)">
            <wire x2="1936" y1="2816" y2="2816" x1="1760" />
            <wire x2="1936" y1="2176" y2="2816" x1="1936" />
            <wire x2="2624" y1="2176" y2="2176" x1="1936" />
        </branch>
        <branch name="XLXN_237(8:0)">
            <wire x2="3120" y1="2032" y2="2032" x1="3024" />
            <wire x2="3120" y1="960" y2="2032" x1="3120" />
            <wire x2="3536" y1="960" y2="960" x1="3120" />
        </branch>
        <branch name="DB1">
            <wire x2="3088" y1="1776" y2="1776" x1="3008" />
            <wire x2="3088" y1="896" y2="1776" x1="3088" />
            <wire x2="3536" y1="896" y2="896" x1="3088" />
        </branch>
        <branch name="XLXN_202(8:0)">
            <wire x2="2064" y1="1040" y2="1040" x1="1696" />
            <wire x2="2064" y1="1040" y2="2032" x1="2064" />
            <wire x2="2064" y1="2032" y2="3008" x1="2064" />
            <wire x2="3568" y1="3008" y2="3008" x1="2064" />
            <wire x2="2624" y1="2032" y2="2032" x1="2064" />
        </branch>
        <instance x="1168" y="1120" name="ETH_RXi" orien="R0">
        </instance>
        <branch name="DATA_WB(23:0)">
            <wire x2="1728" y1="1360" y2="1360" x1="1696" />
        </branch>
        <branch name="ADD_WB(7:0)">
            <wire x2="1728" y1="1392" y2="1392" x1="1696" />
        </branch>
        <branch name="WR_WB">
            <wire x2="1728" y1="1328" y2="1328" x1="1696" />
        </branch>
        <branch name="PHY_RESET">
            <wire x2="1728" y1="1136" y2="1136" x1="1696" />
        </branch>
        <branch name="DB5">
            <wire x2="1728" y1="1488" y2="1488" x1="1696" />
        </branch>
        <branch name="DB6">
            <wire x2="1728" y1="1520" y2="1520" x1="1696" />
        </branch>
        <branch name="DB7">
            <wire x2="1728" y1="1552" y2="1552" x1="1696" />
        </branch>
        <branch name="DATA_WB_I(23:0)">
            <wire x2="1168" y1="1328" y2="1328" x1="800" />
        </branch>
        <text style="fontsize:40;fontname:Arial;textcolor:rgb(0,0,255)" x="412" y="416">GIGABIT PHY 1 (LEFT INPUT)</text>
        <rect style="linecolor:rgb(0,0,255);linestyle:Dash" width="4484" x="396" y="436" height="1288" />
        <iomarker fontsize="28" x="720" y="640" name="RX_CLK" orien="R180" />
        <iomarker fontsize="28" x="720" y="672" name="RX_DV" orien="R180" />
        <iomarker fontsize="28" x="720" y="704" name="PHY_RX(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1728" y="800" name="DIMMER(4:0)" orien="R0" />
        <iomarker fontsize="28" x="1728" y="832" name="PAGE" orien="R0" />
        <iomarker fontsize="28" x="1728" y="928" name="WB_EEP_WR" orien="R0" />
        <iomarker fontsize="28" x="1728" y="960" name="WR_GAMMA" orien="R0" />
        <iomarker fontsize="28" x="1728" y="992" name="DATA_GAMMA(23:0)" orien="R0" />
        <iomarker fontsize="28" x="720" y="976" name="CONFIG_ETH(31:0)" orien="R180" />
        <iomarker fontsize="28" x="1728" y="1360" name="DATA_WB(23:0)" orien="R0" />
        <iomarker fontsize="28" x="1728" y="1392" name="ADD_WB(7:0)" orien="R0" />
        <iomarker fontsize="28" x="1728" y="1328" name="WR_WB" orien="R0" />
        <iomarker fontsize="28" x="1728" y="1488" name="DB5" orien="R0" />
        <iomarker fontsize="28" x="1728" y="1520" name="DB6" orien="R0" />
        <iomarker fontsize="28" x="1728" y="1552" name="DB7" orien="R0" />
        <iomarker fontsize="28" x="1728" y="1136" name="PHY_RESET" orien="R0" />
        <iomarker fontsize="28" x="800" y="1328" name="DATA_WB_I(23:0)" orien="R180" />
        <branch name="XLXN_1(8:0)">
            <wire x2="4032" y1="896" y2="896" x1="3984" />
        </branch>
        <branch name="XLXN_249(10:0)">
            <wire x2="4032" y1="928" y2="928" x1="3984" />
        </branch>
        <branch name="XLXN_253">
            <wire x2="4032" y1="960" y2="960" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="3152" y="336" name="CLK_125M" orien="R180" />
        <branch name="XLXN_284">
            <wire x2="3536" y1="992" y2="992" x1="3520" />
            <wire x2="3520" y1="992" y2="1168" x1="3520" />
            <wire x2="3952" y1="1168" y2="1168" x1="3520" />
            <wire x2="3952" y1="1168" y2="1248" x1="3952" />
            <wire x2="3952" y1="1248" y2="1408" x1="3952" />
            <wire x2="4208" y1="1408" y2="1408" x1="3952" />
            <wire x2="3952" y1="1248" y2="1248" x1="3888" />
        </branch>
        <branch name="XLXN_29(8:0)">
            <wire x2="4064" y1="2944" y2="2944" x1="4016" />
        </branch>
        <branch name="XLXN_250(10:0)">
            <wire x2="4064" y1="2976" y2="2976" x1="4016" />
        </branch>
        <branch name="XLXN_254">
            <wire x2="4064" y1="3008" y2="3008" x1="4016" />
        </branch>
        <branch name="XLXN_287">
            <wire x2="3568" y1="3040" y2="3040" x1="3552" />
            <wire x2="3552" y1="3040" y2="3216" x1="3552" />
            <wire x2="3984" y1="3216" y2="3216" x1="3552" />
            <wire x2="3984" y1="3216" y2="3280" x1="3984" />
            <wire x2="3984" y1="3280" y2="3312" x1="3984" />
            <wire x2="4160" y1="3312" y2="3312" x1="3984" />
            <wire x2="3984" y1="3280" y2="3280" x1="3920" />
        </branch>
        <branch name="RX_DV2">
            <wire x2="880" y1="2976" y2="2976" x1="672" />
            <wire x2="880" y1="2976" y2="3328" x1="880" />
            <wire x2="1392" y1="3328" y2="3328" x1="880" />
            <wire x2="880" y1="2816" y2="2976" x1="880" />
            <wire x2="1216" y1="2816" y2="2816" x1="880" />
            <wire x2="1232" y1="2816" y2="2816" x1="1216" />
        </branch>
        <branch name="PHY_RXD2(7:0)">
            <wire x2="1216" y1="3040" y2="3040" x1="736" />
            <wire x2="1232" y1="2848" y2="2848" x1="1216" />
            <wire x2="1216" y1="2848" y2="3040" x1="1216" />
        </branch>
        <instance x="1232" y="3072" name="ETH_RXbi" orien="R0">
        </instance>
        <text style="fontsize:40;fontname:Arial;textcolor:rgb(0,0,255)" x="424" y="2488">GIGABIT PHY 2 (RIGHT OUTPUT)</text>
        <instance x="2624" y="1936" name="ETH_CLK_MUXi" orien="R0">
        </instance>
        <branch name="RX_CLK2">
            <wire x2="576" y1="2784" y2="2784" x1="512" />
            <wire x2="592" y1="2784" y2="2784" x1="576" />
            <wire x2="2624" y1="1840" y2="1840" x1="576" />
            <wire x2="576" y1="1840" y2="2784" x1="576" />
        </branch>
        <instance x="592" y="2816" name="XLXI_36" orien="R0" />
        <iomarker fontsize="28" x="512" y="2784" name="RX_CLK2" orien="R180" />
        <branch name="XLXN_292">
            <wire x2="1232" y1="2784" y2="2784" x1="816" />
        </branch>
        <instance x="3632" y="1344" name="XLXI_7" orien="R0" />
        <branch name="XLXN_283">
            <wire x2="3040" y1="2064" y2="2064" x1="3024" />
            <wire x2="3632" y1="1216" y2="1216" x1="3040" />
            <wire x2="3040" y1="1216" y2="2064" x1="3040" />
        </branch>
        <branch name="XLXN_285">
            <wire x2="3632" y1="1280" y2="1280" x1="3568" />
            <wire x2="3568" y1="1280" y2="1360" x1="3568" />
            <wire x2="4016" y1="1360" y2="1360" x1="3568" />
            <wire x2="4016" y1="992" y2="992" x1="3984" />
            <wire x2="4016" y1="992" y2="1360" x1="4016" />
        </branch>
        <instance x="3664" y="3376" name="XLXI_8" orien="R0" />
        <branch name="XLXN_286">
            <wire x2="3600" y1="3152" y2="3312" x1="3600" />
            <wire x2="3664" y1="3312" y2="3312" x1="3600" />
            <wire x2="4032" y1="3152" y2="3152" x1="3600" />
            <wire x2="4032" y1="3040" y2="3040" x1="4016" />
            <wire x2="4032" y1="3040" y2="3152" x1="4032" />
        </branch>
        <rect style="linecolor:rgb(0,0,255);linestyle:Dash" width="4484" x="320" y="2560" height="828" />
        <instance x="3568" y="3248" name="FIFO_ETH2i" orien="R0">
        </instance>
        <instance x="3536" y="1200" name="FIFO_ETH1i" orien="R0">
        </instance>
        <branch name="RESET">
            <wire x2="912" y1="800" y2="800" x1="656" />
            <wire x2="1168" y1="800" y2="800" x1="912" />
            <wire x2="912" y1="800" y2="2944" x1="912" />
            <wire x2="1232" y1="2944" y2="2944" x1="912" />
            <wire x2="912" y1="2944" y2="3104" x1="912" />
            <wire x2="3504" y1="3104" y2="3104" x1="912" />
            <wire x2="3568" y1="3104" y2="3104" x1="3504" />
            <wire x2="4032" y1="800" y2="800" x1="3504" />
            <wire x2="3504" y1="800" y2="1056" x1="3504" />
            <wire x2="3536" y1="1056" y2="1056" x1="3504" />
            <wire x2="3504" y1="1056" y2="2848" x1="3504" />
            <wire x2="4064" y1="2848" y2="2848" x1="3504" />
            <wire x2="3504" y1="2848" y2="3104" x1="3504" />
        </branch>
        <iomarker fontsize="28" x="656" y="800" name="RESET" orien="R180" />
        <instance x="4064" y="3328" name="ETH_TX2i" orien="R0">
        </instance>
        <instance x="4032" y="1280" name="ETH_TX1i" orien="R0">
        </instance>
        <branch name="DB8">
            <wire x2="4560" y1="3136" y2="3136" x1="4528" />
        </branch>
        <iomarker fontsize="28" x="4560" y="3136" name="DB8" orien="R0" />
        <branch name="GTX_CLK2">
            <wire x2="4848" y1="2800" y2="2800" x1="4528" />
        </branch>
        <branch name="PHY_TXD2(7:0)">
            <wire x2="4848" y1="2832" y2="2832" x1="4528" />
        </branch>
        <branch name="TX_EN2">
            <wire x2="4752" y1="2864" y2="2864" x1="4528" />
            <wire x2="4752" y1="2864" y2="3008" x1="4752" />
            <wire x2="4848" y1="3008" y2="3008" x1="4752" />
            <wire x2="4848" y1="2864" y2="2864" x1="4752" />
        </branch>
        <iomarker fontsize="28" x="4848" y="2800" name="GTX_CLK2" orien="R0" />
        <iomarker fontsize="28" x="4848" y="2832" name="PHY_TXD2(7:0)" orien="R0" />
        <iomarker fontsize="28" x="4848" y="2864" name="TX_EN2" orien="R0" />
        <branch name="DB2">
            <wire x2="4432" y1="3456" y2="3456" x1="4400" />
        </branch>
        <iomarker fontsize="28" x="4432" y="3456" name="DB2" orien="R0" />
        <instance x="4176" y="3488" name="XLXI_43" orien="R0" />
        <branch name="XLXN_345">
            <wire x2="2048" y1="1104" y2="1104" x1="1696" />
            <wire x2="2048" y1="1104" y2="2064" x1="2048" />
            <wire x2="2048" y1="2064" y2="2352" x1="2048" />
            <wire x2="3440" y1="2352" y2="2352" x1="2048" />
            <wire x2="3440" y1="2352" y2="3248" x1="3440" />
            <wire x2="3520" y1="3248" y2="3248" x1="3440" />
            <wire x2="3664" y1="3248" y2="3248" x1="3520" />
            <wire x2="3520" y1="3248" y2="3456" x1="3520" />
            <wire x2="4176" y1="3456" y2="3456" x1="3520" />
        </branch>
        <instance x="4352" y="2288" name="XLXI_40" orien="R0" />
        <branch name="PHY_MDIO">
            <wire x2="4336" y1="1872" y2="1872" x1="4240" />
            <wire x2="4512" y1="1872" y2="1872" x1="4336" />
            <wire x2="4336" y1="1872" y2="2176" x1="4336" />
            <wire x2="4352" y1="2176" y2="2176" x1="4336" />
        </branch>
        <branch name="PHY_MDC">
            <wire x2="4304" y1="1936" y2="1936" x1="4240" />
            <wire x2="4304" y1="1936" y2="2256" x1="4304" />
            <wire x2="4352" y1="2256" y2="2256" x1="4304" />
            <wire x2="4512" y1="1936" y2="1936" x1="4304" />
        </branch>
        <iomarker fontsize="28" x="4512" y="1872" name="PHY_MDIO" orien="R0" />
        <iomarker fontsize="28" x="4512" y="1936" name="PHY_MDC" orien="R0" />
        <instance x="4352" y="2208" name="XLXI_42" orien="R0" />
        <branch name="ADDRESS(13:0)">
            <wire x2="1840" y1="640" y2="640" x1="1696" />
        </branch>
        <branch name="DATA(23:0)">
            <wire x2="1840" y1="672" y2="672" x1="1696" />
        </branch>
        <branch name="WE">
            <wire x2="1776" y1="704" y2="704" x1="1696" />
            <wire x2="1840" y1="704" y2="704" x1="1776" />
            <wire x2="2048" y1="208" y2="208" x1="1776" />
            <wire x2="1776" y1="208" y2="704" x1="1776" />
        </branch>
        <iomarker fontsize="28" x="1840" y="640" name="ADDRESS(13:0)" orien="R0" />
        <iomarker fontsize="28" x="1840" y="672" name="DATA(23:0)" orien="R0" />
        <iomarker fontsize="28" x="1840" y="704" name="WE" orien="R0" />
        <instance x="3856" y="1968" name="XLXI_44" orien="R0">
        </instance>
        <branch name="XLXN_370">
            <wire x2="1168" y1="1680" y2="1680" x1="1104" />
            <wire x2="1104" y1="1680" y2="1904" x1="1104" />
            <wire x2="1920" y1="1904" y2="1904" x1="1104" />
            <wire x2="2624" y1="1904" y2="1904" x1="1920" />
            <wire x2="1920" y1="1904" y2="2096" x1="1920" />
            <wire x2="2624" y1="2096" y2="2096" x1="1920" />
            <wire x2="1920" y1="2096" y2="2976" x1="1920" />
            <wire x2="1104" y1="1904" y2="2096" x1="1104" />
            <wire x2="1328" y1="2096" y2="2096" x1="1104" />
            <wire x2="1920" y1="2976" y2="2976" x1="1760" />
        </branch>
        <branch name="XLXN_371">
            <wire x2="3760" y1="1648" y2="1648" x1="1696" />
            <wire x2="3760" y1="1648" y2="2064" x1="3760" />
            <wire x2="3856" y1="2064" y2="2064" x1="3760" />
        </branch>
        <branch name="XLXN_372">
            <wire x2="3728" y1="1680" y2="1680" x1="1696" />
            <wire x2="3728" y1="1680" y2="2128" x1="3728" />
            <wire x2="3856" y1="2128" y2="2128" x1="3728" />
        </branch>
        <instance x="2624" y="2480" name="ETH_SELECT_LOOPi" orien="R0">
        </instance>
        <branch name="XLXN_375">
            <wire x2="2160" y1="1072" y2="1072" x1="1696" />
            <wire x2="2160" y1="1072" y2="2064" x1="2160" />
            <wire x2="2624" y1="2064" y2="2064" x1="2160" />
            <wire x2="2288" y1="1072" y2="1072" x1="2160" />
        </branch>
        <instance x="2288" y="1104" name="XLXI_47" orien="R0" />
        <branch name="DB_1">
            <wire x2="2544" y1="1072" y2="1072" x1="2512" />
        </branch>
        <iomarker fontsize="28" x="2544" y="1072" name="DB_1" orien="R0" />
        <instance x="4688" y="1008" name="XLXI_45" orien="R0" />
        <branch name="GTX_CLK">
            <wire x2="4576" y1="752" y2="752" x1="4496" />
            <wire x2="4608" y1="752" y2="752" x1="4576" />
        </branch>
        <branch name="PHY_TXD(7:0)">
            <wire x2="4576" y1="784" y2="784" x1="4496" />
            <wire x2="4608" y1="784" y2="784" x1="4576" />
        </branch>
        <branch name="TX_EN">
            <wire x2="4560" y1="816" y2="816" x1="4496" />
            <wire x2="4576" y1="816" y2="816" x1="4560" />
            <wire x2="4608" y1="816" y2="816" x1="4576" />
            <wire x2="4560" y1="816" y2="976" x1="4560" />
            <wire x2="4688" y1="976" y2="976" x1="4560" />
        </branch>
        <iomarker fontsize="28" x="4608" y="752" name="GTX_CLK" orien="R0" />
        <iomarker fontsize="28" x="4608" y="784" name="PHY_TXD(7:0)" orien="R0" />
        <iomarker fontsize="28" x="4608" y="816" name="TX_EN" orien="R0" />
        <branch name="DB3">
            <wire x2="1648" y1="3328" y2="3328" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1648" y="3328" name="DB3" orien="R0" />
        <iomarker fontsize="28" x="736" y="3040" name="PHY_RXD2(7:0)" orien="R180" />
        <iomarker fontsize="28" x="672" y="2976" name="RX_DV2" orien="R180" />
        <instance x="1392" y="3360" name="XLXI_50" orien="R0" />
        <branch name="DB4">
            <wire x2="2160" y1="3184" y2="3184" x1="2128" />
        </branch>
        <instance x="1904" y="3216" name="XLXI_46" orien="R0" />
        <iomarker fontsize="28" x="2160" y="3184" name="DB4" orien="R0" />
        <branch name="XLXN_389">
            <wire x2="1872" y1="2848" y2="2848" x1="1760" />
            <wire x2="1952" y1="2848" y2="2848" x1="1872" />
            <wire x2="1872" y1="2848" y2="3184" x1="1872" />
            <wire x2="1904" y1="3184" y2="3184" x1="1872" />
            <wire x2="1952" y1="2208" y2="2848" x1="1952" />
            <wire x2="2624" y1="2208" y2="2208" x1="1952" />
        </branch>
        <branch name="BLINK_OUT">
            <wire x2="1728" y1="1712" y2="1712" x1="1696" />
        </branch>
        <iomarker fontsize="28" x="1728" y="1712" name="BLINK_OUT" orien="R0" />
    </sheet>
</drawing>