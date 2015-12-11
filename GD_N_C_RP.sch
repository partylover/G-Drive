<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_882" />
        <signal name="C125IN" />
        <signal name="XLXN_467(7:0)" />
        <signal name="XLXN_673(13:0)" />
        <signal name="XLXN_674(23:0)" />
        <signal name="XLXN_675" />
        <signal name="XLXN_679(23:0)" />
        <signal name="XLXN_695" />
        <signal name="PHY_CLK25" />
        <signal name="FAN_OUT" />
        <signal name="DIP_SW1(2:0)" />
        <signal name="DIP_SW_BUF(7:0)" />
        <signal name="DIP_SW_SEL(7:0)" />
        <signal name="XLXN_649" />
        <signal name="DOUT_SEG(7:0)" />
        <signal name="DIGIT(2:0)" />
        <signal name="XLXN_832(4:0)" />
        <signal name="XLXN_833(0:0)" />
        <signal name="LED_OS" />
        <signal name="LED_RX" />
        <signal name="TEMPIO" />
        <signal name="PHY_RX(7:0)" />
        <signal name="RX_DV" />
        <signal name="RX_CLK" />
        <signal name="XLXN_709" />
        <signal name="RX_CLK2" />
        <signal name="PHY_RXD2(7:0)" />
        <signal name="RX_DV2" />
        <signal name="PHY_TX(7:0)" />
        <signal name="PHY_MDC" />
        <signal name="PHY_MDIO" />
        <signal name="PHY_RESET" />
        <signal name="TX_EN" />
        <signal name="TX_EN2" />
        <signal name="PHY_TXD2(7:0)" />
        <signal name="XLXN_865(7:0)" />
        <signal name="XLXN_866(23:0)" />
        <signal name="XLXN_867" />
        <signal name="OE" />
        <signal name="SCLK" />
        <signal name="STR" />
        <signal name="XLXN_868(23:0)" />
        <signal name="HA" />
        <signal name="HB" />
        <signal name="HC" />
        <signal name="Watchdog" />
        <signal name="EEPROM_SDA" />
        <signal name="EEPROM_SCL" />
        <signal name="EEPROM_WP" />
        <signal name="SR(15:0)" />
        <signal name="SG(15:0)" />
        <signal name="SB(15:0)" />
        <signal name="XLXN_962" />
        <signal name="GTX_CLK" />
        <signal name="GTX_CLK2" />
        <signal name="XLXN_966" />
        <signal name="DB1" />
        <signal name="DB2" />
        <signal name="DB3" />
        <signal name="XLXN_967(31:0)" />
        <signal name="XLXN_968" />
        <signal name="XLXN_969" />
        <signal name="HD" />
        <signal name="DB4" />
        <port polarity="Input" name="C125IN" />
        <port polarity="Output" name="PHY_CLK25" />
        <port polarity="Output" name="FAN_OUT" />
        <port polarity="Input" name="DIP_SW1(2:0)" />
        <port polarity="Input" name="DIP_SW_BUF(7:0)" />
        <port polarity="Input" name="DIP_SW_SEL(7:0)" />
        <port polarity="Output" name="DOUT_SEG(7:0)" />
        <port polarity="Output" name="DIGIT(2:0)" />
        <port polarity="Output" name="LED_OS" />
        <port polarity="Output" name="LED_RX" />
        <port polarity="BiDirectional" name="TEMPIO" />
        <port polarity="Input" name="PHY_RX(7:0)" />
        <port polarity="Input" name="RX_DV" />
        <port polarity="Input" name="RX_CLK" />
        <port polarity="Input" name="RX_CLK2" />
        <port polarity="Input" name="PHY_RXD2(7:0)" />
        <port polarity="Input" name="RX_DV2" />
        <port polarity="Output" name="PHY_TX(7:0)" />
        <port polarity="Output" name="PHY_MDC" />
        <port polarity="Output" name="PHY_MDIO" />
        <port polarity="Output" name="PHY_RESET" />
        <port polarity="Output" name="TX_EN" />
        <port polarity="Output" name="TX_EN2" />
        <port polarity="Output" name="PHY_TXD2(7:0)" />
        <port polarity="Output" name="OE" />
        <port polarity="Output" name="SCLK" />
        <port polarity="Output" name="STR" />
        <port polarity="Output" name="HA" />
        <port polarity="Output" name="HB" />
        <port polarity="Output" name="HC" />
        <port polarity="Output" name="Watchdog" />
        <port polarity="BiDirectional" name="EEPROM_SDA" />
        <port polarity="BiDirectional" name="EEPROM_SCL" />
        <port polarity="Output" name="EEPROM_WP" />
        <port polarity="Output" name="SR(15:0)" />
        <port polarity="Output" name="SG(15:0)" />
        <port polarity="Output" name="SB(15:0)" />
        <port polarity="Output" name="GTX_CLK" />
        <port polarity="Output" name="GTX_CLK2" />
        <port polarity="Output" name="DB1" />
        <port polarity="Output" name="DB2" />
        <port polarity="Output" name="DB3" />
        <port polarity="Output" name="HD" />
        <port polarity="Output" name="DB4" />
        <blockdef name="GD_Drive">
            <timestamp>2015-10-7T10:9:10</timestamp>
            <line x2="432" y1="48" y2="48" x1="368" />
            <line x2="432" y1="16" y2="16" x1="368" />
            <line x2="432" y1="-112" y2="-112" x1="368" />
            <line x2="432" y1="-80" y2="-80" x1="368" />
            <line x2="432" y1="-48" y2="-48" x1="368" />
            <line x2="432" y1="-16" y2="-16" x1="368" />
            <line x2="432" y1="-144" y2="-144" x1="368" />
            <line x2="432" y1="-368" y2="-368" x1="368" />
            <line x2="432" y1="-336" y2="-336" x1="368" />
            <line x2="432" y1="-304" y2="-304" x1="368" />
            <line x2="432" y1="-272" y2="-272" x1="368" />
            <rect width="64" x="0" y="-412" height="24" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <rect width="64" x="0" y="-1388" height="24" />
            <line x2="0" y1="-1376" y2="-1376" x1="64" />
            <rect width="64" x="0" y="-1420" height="24" />
            <line x2="0" y1="-1408" y2="-1408" x1="64" />
            <line x2="0" y1="-1344" y2="-1344" x1="64" />
            <line x2="0" y1="-1440" y2="-1440" x1="64" />
            <rect width="64" x="0" y="-1292" height="24" />
            <line x2="0" y1="-1280" y2="-1280" x1="64" />
            <rect width="64" x="0" y="-1260" height="24" />
            <line x2="0" y1="-1248" y2="-1248" x1="64" />
            <rect width="64" x="0" y="-1228" height="24" />
            <line x2="0" y1="-1216" y2="-1216" x1="64" />
            <line x2="0" y1="-720" y2="-720" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <rect width="64" x="0" y="-1180" height="24" />
            <line x2="0" y1="-1168" y2="-1168" x1="64" />
            <rect width="64" x="0" y="-1148" height="24" />
            <line x2="0" y1="-1136" y2="-1136" x1="64" />
            <line x2="0" y1="-1104" y2="-1104" x1="64" />
            <line x2="432" y1="-496" y2="-496" x1="368" />
            <line x2="432" y1="-464" y2="-464" x1="368" />
            <line x2="432" y1="-432" y2="-432" x1="368" />
            <rect width="64" x="0" y="-1084" height="24" />
            <line x2="64" y1="-1072" y2="-1072" x1="0" />
            <line x2="268" y1="-1312" y2="-1312" style="linewidth:W" x1="64" />
            <line x2="268" y1="-1184" y2="-1184" style="linewidth:W" x1="64" />
            <line x2="268" y1="-1456" y2="-1024" style="linewidth:W" x1="268" />
            <line x2="268" y1="-1456" y2="-1456" style="linewidth:W" x1="64" />
            <line x2="0" y1="-1040" y2="-1040" x1="64" />
            <line x2="268" y1="-1024" y2="-1024" style="linewidth:W" x1="64" />
            <line x2="432" y1="-208" y2="-208" x1="368" />
            <line x2="432" y1="-176" y2="-176" x1="368" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <rect width="64" x="368" y="-1692" height="24" />
            <line x2="432" y1="-1680" y2="-1680" x1="368" />
            <rect width="64" x="368" y="-1660" height="24" />
            <line x2="432" y1="-1648" y2="-1648" x1="368" />
            <rect width="64" x="368" y="-1628" height="24" />
            <line x2="432" y1="-1616" y2="-1616" x1="368" />
            <line x2="0" y1="-768" y2="-768" x1="64" />
            <line x2="0" y1="-960" y2="-960" x1="64" />
            <rect width="304" x="64" y="-1724" height="1832" />
        </blockdef>
        <blockdef name="CLKMAIN125">
            <timestamp>2014-1-16T8:44:9</timestamp>
            <line x2="384" y1="256" y2="256" x1="320" />
            <rect width="64" x="0" y="196" height="24" />
            <line x2="0" y1="208" y2="208" x1="64" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="16" y2="16" x1="320" />
            <rect width="256" x="64" y="-256" height="560" />
        </blockdef>
        <blockdef name="MAIN_CONTROLLER">
            <timestamp>2013-11-22T11:6:18</timestamp>
            <line x2="464" y1="-192" y2="-192" x1="400" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-652" height="24" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-540" height="24" />
            <line x2="0" y1="-528" y2="-528" x1="64" />
            <line x2="464" y1="-336" y2="-336" x1="400" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-720" y2="-720" x1="64" />
            <rect width="64" x="400" y="-316" height="24" />
            <line x2="464" y1="-304" y2="-304" x1="400" />
            <rect width="64" x="400" y="-284" height="24" />
            <line x2="464" y1="-272" y2="-272" x1="400" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-448" y2="-448" x1="400" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <rect width="64" x="400" y="-716" height="24" />
            <line x2="464" y1="-704" y2="-704" x1="400" />
            <rect width="64" x="400" y="-748" height="24" />
            <line x2="464" y1="-736" y2="-736" x1="400" />
            <rect width="336" x="64" y="-760" height="604" />
        </blockdef>
        <blockdef name="TEMP_1820">
            <timestamp>2013-11-22T11:6:35</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-128" height="192" />
        </blockdef>
        <blockdef name="ETH_Drive">
            <timestamp>2014-5-19T4:53:13</timestamp>
            <rect width="64" x="400" y="-412" height="24" />
            <line x2="464" y1="-400" y2="-400" x1="400" />
            <rect width="64" x="400" y="-444" height="24" />
            <line x2="464" y1="-432" y2="-432" x1="400" />
            <line x2="464" y1="-368" y2="-368" x1="400" />
            <line x2="464" y1="-496" y2="-496" x1="400" />
            <rect width="64" x="400" y="-316" height="24" />
            <line x2="464" y1="-304" y2="-304" x1="400" />
            <line x2="464" y1="-272" y2="-272" x1="400" />
            <rect width="64" x="400" y="-252" height="24" />
            <line x2="464" y1="-240" y2="-240" x1="400" />
            <rect width="64" x="0" y="-812" height="24" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-768" y2="-768" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="464" y1="-640" y2="-640" x1="400" />
            <rect width="64" x="400" y="-684" height="24" />
            <line x2="464" y1="-672" y2="-672" x1="400" />
            <line x2="464" y1="-608" y2="-608" x1="400" />
            <rect width="64" x="400" y="-812" height="24" />
            <line x2="464" y1="-800" y2="-800" x1="400" />
            <line x2="464" y1="-768" y2="-768" x1="400" />
            <line x2="464" y1="-736" y2="-736" x1="400" />
            <line x2="464" y1="-560" y2="-560" x1="400" />
            <line x2="464" y1="-528" y2="-528" x1="400" />
            <line x2="464" y1="-128" y2="-128" x1="400" />
            <rect width="64" x="400" y="-204" height="24" />
            <line x2="464" y1="-192" y2="-192" x1="400" />
            <rect width="64" x="400" y="-172" height="24" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <line x2="464" y1="208" y2="208" x1="400" />
            <line x2="464" y1="240" y2="240" x1="400" />
            <line x2="464" y1="272" y2="272" x1="400" />
            <line x2="464" y1="176" y2="176" x1="400" />
            <line x2="464" y1="80" y2="80" x1="400" />
            <line x2="464" y1="112" y2="112" x1="400" />
            <line x2="464" y1="144" y2="144" x1="400" />
            <line x2="464" y1="48" y2="48" x1="400" />
            <rect width="64" x="400" y="-108" height="24" />
            <line x2="400" y1="-96" y2="-96" x1="464" />
            <line x2="400" y1="-708" y2="-708" style="linewidth:W" x1="64" />
            <line x2="64" y1="-584" y2="-584" style="linewidth:W" x1="400" />
            <line x2="64" y1="-472" y2="-472" style="linewidth:W" x1="400" />
            <line x2="64" y1="-344" y2="-344" style="linewidth:W" x1="400" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="64" y2="64" x1="64" />
            <line x2="64" y1="-216" y2="-216" style="linewidth:W" x1="400" />
            <line x2="464" y1="-16" y2="-16" x1="400" />
            <line x2="64" y1="-40" y2="-40" style="linewidth:W" x1="400" />
            <rect width="64" x="0" y="-12" height="24" />
            <line x2="0" y1="0" y2="0" x1="64" />
            <line x2="464" y1="-64" y2="-64" x1="400" />
            <rect width="336" x="64" y="-820" height="1104" />
            <line x2="464" y1="16" y2="16" x1="400" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <block symbolname="CLKMAIN125" name="CLKMAINi">
            <blockpin signalname="C125IN" name="CLK_IN" />
            <blockpin signalname="XLXN_967(31:0)" name="CONFIG(31:0)" />
            <blockpin signalname="XLXN_649" name="RESET" />
            <blockpin signalname="XLXN_966" name="CLK_GD" />
            <blockpin signalname="PHY_CLK25" name="CLK25" />
            <blockpin signalname="XLXN_962" name="CLK125" />
            <blockpin signalname="XLXN_968" name="CLK_PWM" />
        </block>
        <block symbolname="MAIN_CONTROLLER" name="MAIN_CONTROLi">
            <blockpin signalname="XLXN_962" name="CLK" />
            <blockpin signalname="XLXN_649" name="RESET" />
            <blockpin signalname="XLXN_695" name="PAGE" />
            <blockpin signalname="DIP_SW1(2:0)" name="DIP_SW1(2:0)" />
            <blockpin signalname="DIP_SW_BUF(7:0)" name="DIP_SW2(7:0)" />
            <blockpin signalname="DIP_SW_SEL(7:0)" name="DIP_SW3(7:0)" />
            <blockpin signalname="XLXN_467(7:0)" name="TEMPIN(7:0)" />
            <blockpin signalname="LED_OS" name="LED_OS" />
            <blockpin signalname="LED_RX" name="LED_FM" />
            <blockpin signalname="FAN_OUT" name="FAN_OUT" />
            <blockpin name="ONOFF_OUT" />
            <blockpin signalname="Watchdog" name="Watchdog_trig_o" />
            <blockpin name="CONFIG1(31:0)" />
            <blockpin signalname="XLXN_967(31:0)" name="CONFIG2(31:0)" />
            <blockpin signalname="DOUT_SEG(7:0)" name="DOUT(7:0)" />
            <blockpin signalname="DIGIT(2:0)" name="DIGIT(2:0)" />
        </block>
        <block symbolname="TEMP_1820" name="temp_1820reader_i">
            <blockpin signalname="XLXN_962" name="CLK" />
            <blockpin signalname="XLXN_649" name="RESET" />
            <blockpin signalname="TEMPIO" name="OW" />
            <blockpin signalname="XLXN_467(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_36">
            <blockpin signalname="RX_CLK" name="I" />
            <blockpin signalname="XLXN_709" name="O" />
        </block>
        <block symbolname="ETH_Drive" name="ETH_DRIVEi">
            <blockpin signalname="XLXN_962" name="CLK_125M" />
            <blockpin signalname="XLXN_709" name="RX_CLK" />
            <blockpin signalname="RX_DV" name="RX_DV" />
            <blockpin signalname="PHY_RX(7:0)" name="PHY_RX(7:0)" />
            <blockpin signalname="XLXN_967(31:0)" name="CONFIG_ETH(31:0)" />
            <blockpin signalname="XLXN_868(23:0)" name="DATA_WB_I(23:0)" />
            <blockpin signalname="RX_DV2" name="RX_DV2" />
            <blockpin signalname="PHY_RXD2(7:0)" name="PHY_RXD2(7:0)" />
            <blockpin signalname="RX_CLK2" name="RX_CLK2" />
            <blockpin signalname="XLXN_649" name="RESET" />
            <blockpin signalname="XLXN_832(4:0)" name="DIMMER(4:0)" />
            <blockpin signalname="XLXN_695" name="PAGE" />
            <blockpin signalname="XLXN_882" name="WB_EEP_WR" />
            <blockpin signalname="XLXN_833(0:0)" name="WR_GAMMA" />
            <blockpin signalname="XLXN_679(23:0)" name="DATA_GAMMA(23:0)" />
            <blockpin signalname="XLXN_866(23:0)" name="DATA_WB(23:0)" />
            <blockpin signalname="XLXN_865(7:0)" name="ADD_WB(7:0)" />
            <blockpin signalname="XLXN_867" name="WR_WB" />
            <blockpin signalname="PHY_RESET" name="PHY_RESET" />
            <blockpin name="DB5" />
            <blockpin name="DB6" />
            <blockpin name="DB7" />
            <blockpin name="DB8" />
            <blockpin name="GTX_CLK2" />
            <blockpin signalname="PHY_TXD2(7:0)" name="PHY_TXD2(7:0)" />
            <blockpin signalname="TX_EN2" name="TX_EN2" />
            <blockpin name="DB2" />
            <blockpin signalname="PHY_MDIO" name="PHY_MDIO" />
            <blockpin signalname="PHY_MDC" name="PHY_MDC" />
            <blockpin signalname="XLXN_673(13:0)" name="ADDRESS(13:0)" />
            <blockpin signalname="XLXN_674(23:0)" name="DATA(23:0)" />
            <blockpin signalname="XLXN_675" name="WE" />
            <blockpin name="DB_1" />
            <blockpin name="GTX_CLK" />
            <blockpin signalname="PHY_TX(7:0)" name="PHY_TXD(7:0)" />
            <blockpin signalname="TX_EN" name="TX_EN" />
            <blockpin name="DB3" />
            <blockpin name="DB4" />
            <blockpin signalname="XLXN_969" name="BLINK_OUT" />
        </block>
        <block symbolname="bufg" name="XLXI_40">
            <blockpin signalname="XLXN_962" name="I" />
            <blockpin signalname="GTX_CLK" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_55">
            <blockpin signalname="XLXN_962" name="I" />
            <blockpin signalname="GTX_CLK2" name="O" />
        </block>
        <block symbolname="GD_Drive" name="G_DRIVEi">
            <blockpin signalname="XLXN_649" name="RESET" />
            <blockpin signalname="XLXN_709" name="CLK_FIBER" />
            <blockpin signalname="XLXN_673(13:0)" name="VIDEO_ADD(13:0)" />
            <blockpin signalname="XLXN_674(23:0)" name="VIDEO_DATA(23:0)" />
            <blockpin signalname="XLXN_675" name="VIDEO_WR" />
            <blockpin signalname="XLXN_833(0:0)" name="WE_GAMMA(0:0)" />
            <blockpin signalname="XLXN_679(23:0)" name="GAMMA(23:0)" />
            <blockpin signalname="XLXN_966" name="CLK_GD" />
            <blockpin signalname="XLXN_832(4:0)" name="DIM(4:0)" />
            <blockpin signalname="XLXN_695" name="PAGE_IN" />
            <blockpin signalname="XLXN_962" name="CLK_125" />
            <blockpin signalname="XLXN_865(7:0)" name="ADD_WB(7:0)" />
            <blockpin signalname="XLXN_866(23:0)" name="DATA_WB(23:0)" />
            <blockpin signalname="XLXN_867" name="WR_WB" />
            <blockpin signalname="XLXN_967(31:0)" name="CONFIG(31:0)" />
            <blockpin signalname="XLXN_882" name="WB_WR_TRIG" />
            <blockpin signalname="XLXN_968" name="CLK_PWM" />
            <blockpin signalname="XLXN_969" name="display_ena" />
            <blockpin signalname="EEPROM_SDA" name="SDA" />
            <blockpin signalname="EEPROM_SCL" name="SCL" />
            <blockpin signalname="SCLK" name="SCLK" />
            <blockpin signalname="STR" name="STR" />
            <blockpin signalname="OE" name="OE" />
            <blockpin signalname="XLXN_868(23:0)" name="DATA_WB_o(23:0)" />
            <blockpin signalname="HA" name="HA" />
            <blockpin signalname="HB" name="HB" />
            <blockpin signalname="HC" name="HC" />
            <blockpin signalname="HD" name="HD" />
            <blockpin signalname="DB1" name="DB1" />
            <blockpin signalname="DB2" name="DB2" />
            <blockpin signalname="DB3" name="DB3" />
            <blockpin name="DB4" />
            <blockpin signalname="EEPROM_WP" name="EEPROM_WP" />
            <blockpin name="i2c_ack_error" />
            <blockpin signalname="SR(15:0)" name="R(15:0)" />
            <blockpin signalname="SG(15:0)" name="G(15:0)" />
            <blockpin signalname="SB(15:0)" name="B(15:0)" />
            <blockpin signalname="DB4" name="MODE_Flage" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="C125IN">
            <wire x2="320" y1="1200" y2="1200" x1="304" />
            <wire x2="320" y1="1200" y2="1216" x1="320" />
            <wire x2="368" y1="1216" y2="1216" x1="320" />
        </branch>
        <branch name="XLXN_467(7:0)">
            <wire x2="1616" y1="2064" y2="2064" x1="1232" />
        </branch>
        <branch name="XLXN_673(13:0)">
            <wire x2="2624" y1="656" y2="656" x1="2080" />
        </branch>
        <branch name="XLXN_674(23:0)">
            <wire x2="2624" y1="688" y2="688" x1="2080" />
        </branch>
        <branch name="XLXN_675">
            <wire x2="2624" y1="720" y2="720" x1="2080" />
        </branch>
        <branch name="XLXN_679(23:0)">
            <wire x2="2624" y1="784" y2="784" x1="2080" />
        </branch>
        <branch name="XLXN_695">
            <wire x2="1536" y1="1632" y2="1872" x1="1536" />
            <wire x2="1616" y1="1872" y2="1872" x1="1536" />
            <wire x2="2272" y1="1632" y2="1632" x1="1536" />
            <wire x2="2272" y1="1072" y2="1072" x1="2080" />
            <wire x2="2624" y1="1072" y2="1072" x1="2272" />
            <wire x2="2272" y1="1072" y2="1632" x1="2272" />
        </branch>
        <branch name="PHY_CLK25">
            <wire x2="1024" y1="1456" y2="1456" x1="752" />
            <wire x2="1024" y1="1456" y2="1504" x1="1024" />
            <wire x2="1040" y1="1504" y2="1504" x1="1024" />
        </branch>
        <branch name="FAN_OUT">
            <wire x2="2128" y1="2256" y2="2256" x1="2080" />
        </branch>
        <branch name="DIP_SW1(2:0)">
            <wire x2="1616" y1="1920" y2="1920" x1="1536" />
        </branch>
        <branch name="DIP_SW_BUF(7:0)">
            <wire x2="1616" y1="1952" y2="1952" x1="1536" />
        </branch>
        <branch name="DIP_SW_SEL(7:0)">
            <wire x2="1616" y1="1984" y2="1984" x1="1536" />
        </branch>
        <branch name="DOUT_SEG(7:0)">
            <wire x2="2128" y1="2288" y2="2288" x1="2080" />
        </branch>
        <branch name="DIGIT(2:0)">
            <wire x2="2128" y1="2320" y2="2320" x1="2080" />
        </branch>
        <branch name="XLXN_832(4:0)">
            <wire x2="2624" y1="848" y2="848" x1="2080" />
        </branch>
        <branch name="XLXN_833(0:0)">
            <wire x2="2624" y1="816" y2="816" x1="2080" />
        </branch>
        <branch name="LED_OS">
            <wire x2="2208" y1="2144" y2="2144" x1="2080" />
        </branch>
        <branch name="LED_RX">
            <wire x2="2208" y1="2176" y2="2176" x1="2080" />
        </branch>
        <instance x="1616" y="2592" name="MAIN_CONTROLi" orien="R0">
        </instance>
        <branch name="TEMPIO">
            <wire x2="1264" y1="2128" y2="2128" x1="1232" />
        </branch>
        <instance x="848" y="2160" name="temp_1820reader_i" orien="R0">
        </instance>
        <branch name="PHY_RX(7:0)">
            <wire x2="1616" y1="288" y2="288" x1="1584" />
        </branch>
        <branch name="RX_DV">
            <wire x2="1616" y1="320" y2="320" x1="1584" />
        </branch>
        <instance x="1072" y="384" name="XLXI_36" orien="R0" />
        <branch name="RX_CLK">
            <wire x2="1072" y1="352" y2="352" x1="1040" />
        </branch>
        <branch name="XLXN_709">
            <wire x2="1344" y1="352" y2="352" x1="1296" />
            <wire x2="1616" y1="352" y2="352" x1="1344" />
            <wire x2="1344" y1="160" y2="352" x1="1344" />
            <wire x2="2512" y1="160" y2="160" x1="1344" />
            <wire x2="2512" y1="160" y2="624" x1="2512" />
            <wire x2="2624" y1="624" y2="624" x1="2512" />
        </branch>
        <branch name="RX_CLK2">
            <wire x2="1616" y1="480" y2="480" x1="1040" />
        </branch>
        <branch name="PHY_RXD2(7:0)">
            <wire x2="1616" y1="416" y2="416" x1="1584" />
        </branch>
        <branch name="RX_DV2">
            <wire x2="1616" y1="448" y2="448" x1="1584" />
        </branch>
        <branch name="PHY_TX(7:0)">
            <wire x2="2112" y1="288" y2="288" x1="2080" />
        </branch>
        <branch name="PHY_MDC">
            <wire x2="2112" y1="528" y2="528" x1="2080" />
        </branch>
        <branch name="PHY_MDIO">
            <wire x2="2112" y1="560" y2="560" x1="2080" />
        </branch>
        <branch name="PHY_RESET">
            <wire x2="2112" y1="592" y2="592" x1="2080" />
        </branch>
        <branch name="TX_EN">
            <wire x2="2112" y1="320" y2="320" x1="2080" />
        </branch>
        <branch name="TX_EN2">
            <wire x2="2112" y1="448" y2="448" x1="2080" />
        </branch>
        <branch name="PHY_TXD2(7:0)">
            <wire x2="2112" y1="416" y2="416" x1="2080" />
        </branch>
        <branch name="XLXN_865(7:0)">
            <wire x2="2624" y1="896" y2="896" x1="2080" />
        </branch>
        <branch name="XLXN_866(23:0)">
            <wire x2="2624" y1="928" y2="928" x1="2080" />
        </branch>
        <branch name="XLXN_867">
            <wire x2="2624" y1="960" y2="960" x1="2080" />
        </branch>
        <branch name="OE">
            <wire x2="3088" y1="1632" y2="1632" x1="3056" />
        </branch>
        <branch name="SCLK">
            <wire x2="3088" y1="1568" y2="1568" x1="3056" />
        </branch>
        <branch name="STR">
            <wire x2="3088" y1="1600" y2="1600" x1="3056" />
        </branch>
        <instance x="1616" y="1088" name="ETH_DRIVEi" orien="R0">
        </instance>
        <branch name="XLXN_868(23:0)">
            <wire x2="2624" y1="992" y2="992" x1="2080" />
        </branch>
        <branch name="HA">
            <wire x2="3088" y1="1696" y2="1696" x1="3056" />
        </branch>
        <branch name="HB">
            <wire x2="3088" y1="1728" y2="1728" x1="3056" />
        </branch>
        <branch name="HC">
            <wire x2="3088" y1="1760" y2="1760" x1="3056" />
        </branch>
        <branch name="Watchdog">
            <wire x2="2112" y1="2400" y2="2400" x1="2080" />
        </branch>
        <branch name="EEPROM_SDA">
            <wire x2="3200" y1="1856" y2="1856" x1="3056" />
        </branch>
        <branch name="EEPROM_SCL">
            <wire x2="3200" y1="1888" y2="1888" x1="3056" />
        </branch>
        <branch name="EEPROM_WP">
            <wire x2="3184" y1="2080" y2="2080" x1="3056" />
        </branch>
        <branch name="SR(15:0)">
            <wire x2="3088" y1="384" y2="384" x1="3056" />
        </branch>
        <branch name="SG(15:0)">
            <wire x2="3088" y1="416" y2="416" x1="3056" />
        </branch>
        <branch name="SB(15:0)">
            <wire x2="3088" y1="448" y2="448" x1="3056" />
        </branch>
        <branch name="XLXN_882">
            <wire x2="2448" y1="1024" y2="1024" x1="2080" />
            <wire x2="2624" y1="1024" y2="1024" x1="2448" />
            <wire x2="2448" y1="1024" y2="2624" x1="2448" />
            <wire x2="2848" y1="2624" y2="2624" x1="2448" />
        </branch>
        <iomarker fontsize="28" x="304" y="1200" name="C125IN" orien="R180" />
        <iomarker fontsize="28" x="2128" y="2320" name="DIGIT(2:0)" orien="R0" />
        <iomarker fontsize="28" x="2128" y="2288" name="DOUT_SEG(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2128" y="2256" name="FAN_OUT" orien="R0" />
        <iomarker fontsize="28" x="1536" y="1920" name="DIP_SW1(2:0)" orien="R180" />
        <iomarker fontsize="28" x="1536" y="1952" name="DIP_SW_BUF(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1536" y="1984" name="DIP_SW_SEL(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2208" y="2144" name="LED_OS" orien="R0" />
        <iomarker fontsize="28" x="2208" y="2176" name="LED_RX" orien="R0" />
        <iomarker fontsize="28" x="1264" y="2128" name="TEMPIO" orien="R0" />
        <iomarker fontsize="28" x="1584" y="288" name="PHY_RX(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1584" y="320" name="RX_DV" orien="R180" />
        <iomarker fontsize="28" x="1040" y="352" name="RX_CLK" orien="R180" />
        <iomarker fontsize="28" x="1040" y="480" name="RX_CLK2" orien="R180" />
        <iomarker fontsize="28" x="1584" y="416" name="PHY_RXD2(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1584" y="448" name="RX_DV2" orien="R180" />
        <iomarker fontsize="28" x="2112" y="288" name="PHY_TX(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2112" y="528" name="PHY_MDC" orien="R0" />
        <iomarker fontsize="28" x="2112" y="560" name="PHY_MDIO" orien="R0" />
        <iomarker fontsize="28" x="2112" y="592" name="PHY_RESET" orien="R0" />
        <iomarker fontsize="28" x="2112" y="320" name="TX_EN" orien="R0" />
        <iomarker fontsize="28" x="2112" y="448" name="TX_EN2" orien="R0" />
        <iomarker fontsize="28" x="2112" y="416" name="PHY_TXD2(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1632" name="OE" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1568" name="SCLK" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1600" name="STR" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1696" name="HA" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1728" name="HB" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1760" name="HC" orien="R0" />
        <iomarker fontsize="28" x="2112" y="2400" name="Watchdog" orien="R0" />
        <iomarker fontsize="28" x="3200" y="1856" name="EEPROM_SDA" orien="R0" />
        <iomarker fontsize="28" x="3200" y="1888" name="EEPROM_SCL" orien="R0" />
        <iomarker fontsize="28" x="3184" y="2080" name="EEPROM_WP" orien="R0" />
        <iomarker fontsize="28" x="3088" y="384" name="SR(15:0)" orien="R0" />
        <iomarker fontsize="28" x="3088" y="416" name="SG(15:0)" orien="R0" />
        <iomarker fontsize="28" x="3088" y="448" name="SB(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1040" y="1504" name="PHY_CLK25" orien="R0" />
        <instance x="960" y="880" name="XLXI_40" orien="R0" />
        <branch name="GTX_CLK">
            <wire x2="1216" y1="848" y2="848" x1="1184" />
        </branch>
        <branch name="GTX_CLK2">
            <wire x2="1216" y1="944" y2="944" x1="1184" />
        </branch>
        <instance x="960" y="976" name="XLXI_55" orien="R0" />
        <iomarker fontsize="28" x="1216" y="848" name="GTX_CLK" orien="R0" />
        <iomarker fontsize="28" x="1216" y="944" name="GTX_CLK2" orien="R0" />
        <branch name="XLXN_966">
            <wire x2="2608" y1="1600" y2="1600" x1="752" />
            <wire x2="2624" y1="1344" y2="1344" x1="2608" />
            <wire x2="2608" y1="1344" y2="1600" x1="2608" />
        </branch>
        <branch name="DB1">
            <wire x2="3088" y1="1952" y2="1952" x1="3056" />
        </branch>
        <branch name="DB2">
            <wire x2="3088" y1="1984" y2="1984" x1="3056" />
        </branch>
        <branch name="DB3">
            <wire x2="3088" y1="2016" y2="2016" x1="3056" />
        </branch>
        <iomarker fontsize="28" x="3088" y="1952" name="DB1" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1984" name="DB2" orien="R0" />
        <iomarker fontsize="28" x="3088" y="2016" name="DB3" orien="R0" />
        <instance x="2624" y="2064" name="G_DRIVEi" orien="R0">
        </instance>
        <branch name="XLXN_969">
            <wire x2="2624" y1="1104" y2="1104" x1="2080" />
        </branch>
        <branch name="HD">
            <wire x2="3088" y1="1792" y2="1792" x1="3056" />
        </branch>
        <iomarker fontsize="28" x="3088" y="1792" name="HD" orien="R0" />
        <instance x="368" y="1440" name="CLKMAINi" orien="R0">
        </instance>
        <branch name="XLXN_967(31:0)">
            <wire x2="368" y1="1648" y2="1648" x1="304" />
            <wire x2="304" y1="1648" y2="1824" x1="304" />
            <wire x2="1552" y1="1824" y2="1824" x1="304" />
            <wire x2="1552" y1="1088" y2="1536" x1="1552" />
            <wire x2="2144" y1="1536" y2="1536" x1="1552" />
            <wire x2="2144" y1="1536" y2="1856" x1="2144" />
            <wire x2="2384" y1="1856" y2="1856" x1="2144" />
            <wire x2="1552" y1="1536" y2="1824" x1="1552" />
            <wire x2="1616" y1="1088" y2="1088" x1="1552" />
            <wire x2="2144" y1="1856" y2="1856" x1="2080" />
            <wire x2="2384" y1="1664" y2="1856" x1="2384" />
            <wire x2="2624" y1="1664" y2="1664" x1="2384" />
        </branch>
        <branch name="XLXN_962">
            <wire x2="784" y1="1344" y2="1344" x1="752" />
            <wire x2="784" y1="1328" y2="1344" x1="784" />
            <wire x2="816" y1="1328" y2="1328" x1="784" />
            <wire x2="816" y1="1328" y2="2064" x1="816" />
            <wire x2="848" y1="2064" y2="2064" x1="816" />
            <wire x2="816" y1="2064" y2="2272" x1="816" />
            <wire x2="1616" y1="2272" y2="2272" x1="816" />
            <wire x2="928" y1="1328" y2="1328" x1="816" />
            <wire x2="928" y1="1328" y2="1392" x1="928" />
            <wire x2="2624" y1="1392" y2="1392" x1="928" />
            <wire x2="960" y1="848" y2="848" x1="816" />
            <wire x2="816" y1="848" y2="944" x1="816" />
            <wire x2="816" y1="944" y2="1120" x1="816" />
            <wire x2="816" y1="1120" y2="1328" x1="816" />
            <wire x2="1616" y1="1120" y2="1120" x1="816" />
            <wire x2="960" y1="944" y2="944" x1="816" />
        </branch>
        <branch name="XLXN_649">
            <wire x2="768" y1="1408" y2="1408" x1="752" />
            <wire x2="768" y1="1392" y2="1408" x1="768" />
            <wire x2="784" y1="1392" y2="1392" x1="768" />
            <wire x2="880" y1="1392" y2="1392" x1="784" />
            <wire x2="880" y1="1392" y2="1424" x1="880" />
            <wire x2="2624" y1="1424" y2="1424" x1="880" />
            <wire x2="784" y1="1392" y2="2192" x1="784" />
            <wire x2="848" y1="2192" y2="2192" x1="784" />
            <wire x2="784" y1="2192" y2="2336" x1="784" />
            <wire x2="1616" y1="2336" y2="2336" x1="784" />
            <wire x2="880" y1="1152" y2="1392" x1="880" />
            <wire x2="1616" y1="1152" y2="1152" x1="880" />
        </branch>
        <branch name="XLXN_968">
            <wire x2="2112" y1="1696" y2="1696" x1="752" />
            <wire x2="2112" y1="1296" y2="1696" x1="2112" />
            <wire x2="2624" y1="1296" y2="1296" x1="2112" />
        </branch>
        <branch name="DB4">
            <wire x2="3088" y1="2112" y2="2112" x1="3056" />
        </branch>
        <iomarker fontsize="28" x="3088" y="2112" name="DB4" orien="R0" />
    </sheet>
</drawing>