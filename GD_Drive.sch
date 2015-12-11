<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_6(12:0)" />
        <signal name="RESET" />
        <signal name="XLXN_4(23:0)" />
        <signal name="XLXN_1(13:0)" />
        <signal name="XLXN_2(23:0)" />
        <signal name="CLK_FIBER" />
        <signal name="VIDEO_ADD(13:0)" />
        <signal name="VIDEO_DATA(23:0)" />
        <signal name="VIDEO_WR" />
        <signal name="WE_GAMMA(0:0)" />
        <signal name="GAMMA(23:0)" />
        <signal name="CLK_GD" />
        <signal name="XLXN_185(7:0)" />
        <signal name="XLXN_186(3:0)" />
        <signal name="XLXN_187" />
        <signal name="XLXN_188" />
        <signal name="SCLK" />
        <signal name="STR" />
        <signal name="OE" />
        <signal name="XLXN_422(47:0)" />
        <signal name="XLXN_426(47:0)" />
        <signal name="DIM(4:0)" />
        <signal name="PAGE_IN" />
        <signal name="XLXN_487" />
        <signal name="XLXN_488" />
        <signal name="CLK_125" />
        <signal name="ADD_WB(7:0)" />
        <signal name="DATA_WB(23:0)" />
        <signal name="WR_WB" />
        <signal name="DATA_WB_o(23:0)" />
        <signal name="HA" />
        <signal name="HB" />
        <signal name="HC" />
        <signal name="HD" />
        <signal name="XLXN_885(6:0)" />
        <signal name="XLXN_886(7:0)" />
        <signal name="XLXN_887" />
        <signal name="XLXN_888" />
        <signal name="XLXN_890(7:0)" />
        <signal name="XLXN_891(23:0)" />
        <signal name="XLXN_892(7:0)" />
        <signal name="XLXN_893(0:0)" />
        <signal name="SDA" />
        <signal name="SCL" />
        <signal name="XLXN_876(23:0)" />
        <signal name="XLXN_425" />
        <signal name="CONFIG(31:0)" />
        <signal name="WB_WR_TRIG" />
        <signal name="XLXN_899(7:0)" />
        <signal name="XLXN_900" />
        <signal name="XLXN_901" />
        <signal name="DB1" />
        <signal name="DB2" />
        <signal name="DB3" />
        <signal name="DB4" />
        <signal name="EEPROM_WP" />
        <signal name="i2c_ack_error" />
        <signal name="XLXN_1008" />
        <signal name="R(15:0)" />
        <signal name="G(15:0)" />
        <signal name="B(15:0)" />
        <signal name="XLXN_1012" />
        <signal name="XLXN_1016(47:0)" />
        <signal name="XLXN_1017(0:0)" />
        <signal name="XLXN_1018(23:0)" />
        <signal name="CLK_PWM" />
        <signal name="XLXN_1021" />
        <signal name="XLXN_1022" />
        <signal name="display_ena" />
        <signal name="XLXN_1023(4:0)" />
        <signal name="XLXN_1024(4:0)" />
        <signal name="XLXN_1025" />
        <signal name="MODE_Flage" />
        <port polarity="Input" name="RESET" />
        <port polarity="Input" name="CLK_FIBER" />
        <port polarity="Input" name="VIDEO_ADD(13:0)" />
        <port polarity="Input" name="VIDEO_DATA(23:0)" />
        <port polarity="Input" name="VIDEO_WR" />
        <port polarity="Input" name="WE_GAMMA(0:0)" />
        <port polarity="Input" name="GAMMA(23:0)" />
        <port polarity="Input" name="CLK_GD" />
        <port polarity="Output" name="SCLK" />
        <port polarity="Output" name="STR" />
        <port polarity="Output" name="OE" />
        <port polarity="Input" name="DIM(4:0)" />
        <port polarity="Input" name="PAGE_IN" />
        <port polarity="Input" name="CLK_125" />
        <port polarity="Input" name="ADD_WB(7:0)" />
        <port polarity="Input" name="DATA_WB(23:0)" />
        <port polarity="Input" name="WR_WB" />
        <port polarity="Output" name="DATA_WB_o(23:0)" />
        <port polarity="Output" name="HA" />
        <port polarity="Output" name="HB" />
        <port polarity="Output" name="HC" />
        <port polarity="Output" name="HD" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="Input" name="CONFIG(31:0)" />
        <port polarity="Input" name="WB_WR_TRIG" />
        <port polarity="Output" name="DB1" />
        <port polarity="Output" name="DB2" />
        <port polarity="Output" name="DB3" />
        <port polarity="Output" name="DB4" />
        <port polarity="Output" name="EEPROM_WP" />
        <port polarity="Output" name="i2c_ack_error" />
        <port polarity="Output" name="R(15:0)" />
        <port polarity="Output" name="G(15:0)" />
        <port polarity="Output" name="B(15:0)" />
        <port polarity="Input" name="CLK_PWM" />
        <port polarity="Input" name="display_ena" />
        <port polarity="Output" name="MODE_Flage" />
        <blockdef name="TEST_MODE">
            <timestamp>2013-7-26T6:56:34</timestamp>
            <rect width="32" x="0" y="68" height="24" />
            <line x2="0" y1="80" y2="80" x1="32" />
            <line x2="0" y1="48" y2="48" x1="32" />
            <line x2="0" y1="-192" y2="-192" x1="32" />
            <line x2="0" y1="-224" y2="-224" style="linewidth:W" x1="32" />
            <line x2="0" y1="-256" y2="-256" style="linewidth:W" x1="32" />
            <line x2="320" y1="-256" y2="-256" style="linewidth:W" x1="288" />
            <line x2="320" y1="-224" y2="-224" style="linewidth:W" x1="288" />
            <rect width="256" x="32" y="-304" height="408" />
            <rect width="32" x="288" y="-204" height="24" />
            <line x2="320" y1="-192" y2="-192" x1="288" />
            <rect width="32" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="32" />
            <line x2="0" y1="-32" y2="-32" x1="32" />
            <line x2="320" y1="0" y2="0" x1="288" />
            <line x2="320" y1="-288" y2="-288" x1="288" />
            <rect width="32" x="288" y="-140" height="24" />
            <line x2="320" y1="-128" y2="-128" x1="288" />
        </blockdef>
        <blockdef name="RGB_GAMMA_SCH">
            <timestamp>2013-6-28T11:2:35</timestamp>
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-92" height="24" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <line x2="0" y1="-16" y2="-16" x1="64" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <rect width="64" x="336" y="-316" height="24" />
            <line x2="400" y1="-304" y2="-304" x1="336" />
            <rect width="272" x="64" y="-384" height="432" />
        </blockdef>
        <blockdef name="bufgmux_1">
            <timestamp>2008-10-8T15:57:24</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="core_wb_ram">
            <timestamp>2013-8-6T3:53:3</timestamp>
            <rect width="272" x="32" y="56" height="584" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="112" y2="112" style="linewidth:W" x1="0" />
            <line x2="32" y1="208" y2="208" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="32" y1="432" y2="432" style="linewidth:W" x1="0" />
            <line x2="32" y1="464" y2="464" style="linewidth:W" x1="0" />
            <line x2="32" y1="560" y2="560" style="linewidth:W" x1="0" />
            <line x2="32" y1="624" y2="624" x1="0" />
            <line x2="304" y1="432" y2="432" style="linewidth:W" x1="336" />
            <line x2="304" y1="80" y2="80" style="linewidth:W" x1="336" />
        </blockdef>
        <blockdef name="i2c_master">
            <timestamp>2013-8-21T3:57:17</timestamp>
            <rect width="256" x="64" y="-384" height="288" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="384" y1="-240" y2="-240" x1="320" />
            <line x2="384" y1="-112" y2="-112" x1="320" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <line x2="384" y1="-144" y2="-144" x1="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <rect width="64" x="0" y="-204" height="24" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-224" y2="-224" x1="0" />
        </blockdef>
        <blockdef name="ee_prom_control">
            <timestamp>2014-5-15T5:38:48</timestamp>
            <line x2="592" y1="-48" y2="-48" x1="528" />
            <rect width="64" x="96" y="-76" height="24" />
            <line x2="96" y1="-64" y2="-64" x1="160" />
            <line x2="96" y1="-80" y2="-80" x1="160" />
            <rect width="64" x="96" y="-332" height="24" />
            <line x2="96" y1="-320" y2="-320" x1="160" />
            <rect width="64" x="528" y="-188" height="24" />
            <line x2="592" y1="-176" y2="-176" x1="528" />
            <rect width="64" x="528" y="-156" height="24" />
            <line x2="592" y1="-144" y2="-144" x1="528" />
            <line x2="592" y1="-112" y2="-112" x1="528" />
            <rect width="64" x="528" y="-284" height="24" />
            <line x2="528" y1="-272" y2="-272" x1="592" />
            <line x2="528" y1="-304" y2="-304" x1="592" />
            <rect width="64" x="528" y="-444" height="24" />
            <line x2="592" y1="-432" y2="-432" x1="528" />
            <rect width="64" x="528" y="-412" height="24" />
            <line x2="592" y1="-400" y2="-400" x1="528" />
            <line x2="592" y1="-368" y2="-368" x1="528" />
            <line x2="592" y1="-336" y2="-336" x1="528" />
            <line x2="96" y1="-128" y2="-128" x1="160" />
            <line x2="96" y1="-512" y2="-512" x1="160" />
            <rect width="64" x="96" y="-556" height="24" />
            <line x2="96" y1="-544" y2="-544" x1="160" />
            <line x2="96" y1="-224" y2="-224" x1="160" />
            <line x2="160" y1="-480" y2="-480" x1="96" />
            <line x2="592" y1="-464" y2="-464" x1="528" />
            <line x2="592" y1="-496" y2="-496" x1="528" />
            <line x2="592" y1="-528" y2="-528" x1="528" />
            <line x2="592" y1="-560" y2="-560" x1="528" />
            <rect width="368" x="160" y="-616" height="596" />
            <line x2="592" y1="-592" y2="-592" x1="528" />
        </blockdef>
        <blockdef name="g_drive_controller_shif_register">
            <timestamp>2014-7-24T4:37:24</timestamp>
            <line x2="464" y1="-336" y2="-336" x1="400" />
            <line x2="0" y1="-512" y2="-512" x1="64" />
            <rect width="64" x="400" y="-1132" height="24" />
            <line x2="464" y1="-1120" y2="-1120" x1="400" />
            <line x2="464" y1="-720" y2="-720" x1="400" />
            <line x2="464" y1="-688" y2="-688" x1="400" />
            <rect width="64" x="400" y="-1036" height="24" />
            <line x2="464" y1="-1024" y2="-1024" x1="400" />
            <line x2="0" y1="-720" y2="-720" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="400" y="-1004" height="24" />
            <line x2="464" y1="-992" y2="-992" x1="400" />
            <line x2="464" y1="-960" y2="-960" x1="400" />
            <line x2="464" y1="-928" y2="-928" x1="400" />
            <line x2="464" y1="-752" y2="-752" x1="400" />
            <line x2="464" y1="-608" y2="-608" x1="400" />
            <line x2="464" y1="-576" y2="-576" x1="400" />
            <line x2="464" y1="-640" y2="-640" x1="400" />
            <rect width="64" x="400" y="-908" height="24" />
            <line x2="464" y1="-896" y2="-896" x1="400" />
            <rect width="64" x="0" y="-412" height="24" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <rect width="64" x="400" y="-380" height="24" />
            <line x2="464" y1="-368" y2="-368" x1="400" />
            <line x2="464" y1="-528" y2="-528" x1="400" />
            <line x2="464" y1="-496" y2="-496" x1="400" />
            <line x2="464" y1="-464" y2="-464" x1="400" />
            <line x2="464" y1="-432" y2="-432" x1="400" />
            <line x2="400" y1="-304" y2="-304" x1="464" />
            <line x2="464" y1="-1056" y2="-1056" x1="400" />
            <rect width="64" x="0" y="-1132" height="24" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <line x2="0" y1="-768" y2="-768" x1="64" />
            <line x2="464" y1="-864" y2="-864" x1="400" />
            <rect width="336" x="64" y="-1152" height="904" />
            <rect width="64" x="400" y="-1100" height="24" />
            <line x2="464" y1="-1088" y2="-1088" x1="400" />
            <rect width="64" x="0" y="-1068" height="24" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
        </blockdef>
        <blockdef name="Driver_shift_register">
            <timestamp>2015-2-23T6:29:51</timestamp>
            <rect width="64" x="0" y="4" height="24" />
            <line x2="0" y1="16" y2="16" x1="64" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="0" y1="-16" y2="-16" x1="64" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <rect width="64" x="0" y="-220" height="24" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <rect width="64" x="0" y="-252" height="24" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <line x2="0" y1="-176" y2="-176" x1="64" />
            <rect width="64" x="0" y="-124" height="24" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <rect width="64" x="304" y="-492" height="24" />
            <line x2="368" y1="-480" y2="-480" x1="304" />
            <rect width="64" x="304" y="-460" height="24" />
            <line x2="368" y1="-448" y2="-448" x1="304" />
            <rect width="64" x="304" y="-428" height="24" />
            <line x2="368" y1="-416" y2="-416" x1="304" />
            <rect width="64" x="0" y="-524" height="24" />
            <line x2="0" y1="-512" y2="-512" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-380" height="24" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <rect width="240" x="64" y="-528" height="560" />
        </blockdef>
        <blockdef name="sch_frame_buffer">
            <timestamp>2013-12-3T4:28:59</timestamp>
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-316" height="24" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <rect width="64" x="0" y="-348" height="24" />
            <line x2="0" y1="-336" y2="-336" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <rect width="64" x="416" y="-92" height="24" />
            <line x2="480" y1="-80" y2="-80" x1="416" />
            <rect width="64" x="416" y="-140" height="24" />
            <line x2="480" y1="-128" y2="-128" x1="416" />
            <rect width="352" x="64" y="-364" height="352" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="RGB_GAMMA_SCH" name="RGB_GAMMA_SCH2_i">
            <blockpin signalname="WE_GAMMA(0:0)" name="WE(0:0)" />
            <blockpin signalname="CLK_FIBER" name="CLK_IN" />
            <blockpin signalname="CLK_GD" name="CLK" />
            <blockpin signalname="GAMMA(23:0)" name="GAMMA(23:0)" />
            <blockpin signalname="XLXN_4(23:0)" name="RGB_IN(23:0)" />
            <blockpin signalname="XLXN_422(47:0)" name="RGB_OUT(47:0)" />
        </block>
        <block symbolname="bufgmux_1" name="CLK_GD_MUXi">
            <blockpin signalname="CLK_FIBER" name="I0" />
            <blockpin signalname="CLK_125" name="I1" />
            <blockpin signalname="XLXN_488" name="S" />
            <blockpin signalname="XLXN_487" name="O" />
        </block>
        <block symbolname="TEST_MODE" name="TEST_MODEi">
            <blockpin signalname="VIDEO_WR" name="WE_IN" />
            <blockpin signalname="CLK_125" name="CLK" />
            <blockpin signalname="VIDEO_DATA(23:0)" name="DATA_IN(23:0)" />
            <blockpin signalname="VIDEO_ADD(13:0)" name="ADD_IN(13:0)" />
            <blockpin signalname="CONFIG(31:0)" name="Config_register(31:0)" />
            <blockpin signalname="XLXN_2(23:0)" name="DATA_OUT(23:0)" />
            <blockpin signalname="XLXN_1(13:0)" name="ADD_OUT(13:0)" />
            <blockpin signalname="XLXN_1017(0:0)" name="WE_OUT(0:0)" />
            <blockpin signalname="DIM(4:0)" name="DIM_IN(4:0)" />
            <blockpin signalname="PAGE_IN" name="ACTIVE_IN" />
            <blockpin signalname="XLXN_425" name="ACTIVE_OUT" />
            <blockpin signalname="XLXN_488" name="select_clk" />
            <blockpin signalname="XLXN_1024(4:0)" name="DIM_O(4:0)" />
        </block>
        <block symbolname="ee_prom_control" name="ee_prom_control_i">
            <blockpin signalname="XLXN_1008" name="BUSY_I2C_i" />
            <blockpin signalname="CLK_GD" name="CLK" />
            <blockpin signalname="XLXN_900" name="driver_busy" />
            <blockpin signalname="RESET" name="reset" />
            <blockpin signalname="WB_WR_TRIG" name="WB_WR_TRIG" />
            <blockpin signalname="XLXN_876(23:0)" name="DATA_IN_WB_RAM(23:0)" />
            <blockpin signalname="XLXN_899(7:0)" name="ADD_IN_WB_RAM(7:0)" />
            <blockpin signalname="XLXN_890(7:0)" name="DATA_I2C_i(7:0)" />
            <blockpin signalname="CONFIG(31:0)" name="Config_register(31:0)" />
            <blockpin signalname="XLXN_893(0:0)" name="WR_RAM" />
            <blockpin signalname="XLXN_887" name="ENA_I2C_o" />
            <blockpin signalname="XLXN_888" name="RW_I2C_o" />
            <blockpin signalname="XLXN_901" name="ADD_BUS_BUSY" />
            <blockpin signalname="DB1" name="DB1" />
            <blockpin signalname="DB2" name="DB2" />
            <blockpin signalname="DB3" name="DB3" />
            <blockpin signalname="DB4" name="DB4" />
            <blockpin signalname="EEPROM_WP" name="EEPROM_WP" />
            <blockpin signalname="XLXN_891(23:0)" name="DATA_OUT_WB_RAM(23:0)" />
            <blockpin signalname="XLXN_892(7:0)" name="ADD_OUT_WB_RAM(7:0)" />
            <blockpin signalname="XLXN_885(6:0)" name="ADD_I2C_o(6:0)" />
            <blockpin signalname="XLXN_886(7:0)" name="DATA_I2C_o(7:0)" />
            <blockpin signalname="XLXN_1022" name="BLINK_OUT" />
        </block>
        <block symbolname="i2c_master" name="i2c_master_i">
            <blockpin signalname="XLXN_886(7:0)" name="data_wr(7:0)" />
            <blockpin signalname="XLXN_885(6:0)" name="addr(6:0)" />
            <blockpin signalname="i2c_ack_error" name="ack_error" />
            <blockpin signalname="SCL" name="scl" />
            <blockpin signalname="RESET" name="reset_n" />
            <blockpin signalname="CLK_GD" name="clk" />
            <blockpin signalname="SDA" name="sda" />
            <blockpin signalname="XLXN_887" name="ena" />
            <blockpin signalname="XLXN_888" name="rw" />
            <blockpin signalname="XLXN_890(7:0)" name="data_rd(7:0)" />
            <blockpin signalname="XLXN_1008" name="busy" />
        </block>
        <block symbolname="g_drive_controller_shif_register" name="g_drive_controller_shif_register_i">
            <blockpin signalname="CLK_GD" name="CLK" />
            <blockpin signalname="CLK_PWM" name="CLK_PWM" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="XLXN_425" name="PAGE" />
            <blockpin signalname="XLXN_901" name="ADD_BUS_WB_BUSY" />
            <blockpin signalname="XLXN_876(23:0)" name="DATA_WB(23:0)" />
            <blockpin signalname="XLXN_1024(4:0)" name="DIMMER(4:0)" />
            <blockpin signalname="XLXN_187" name="display_enable" />
            <blockpin signalname="XLXN_188" name="config_enable" />
            <blockpin signalname="XLXN_1025" name="MODE" />
            <blockpin signalname="XLXN_1021" name="MODE_PWM" />
            <blockpin signalname="XLXN_900" name="SEND_WB_BUSY" />
            <blockpin signalname="STR" name="STROBE1" />
            <blockpin signalname="OE" name="OE1" />
            <blockpin signalname="SCLK" name="CLK_OUT1" />
            <blockpin name="STROBE2" />
            <blockpin name="OE2" />
            <blockpin name="CLK_OUT2" />
            <blockpin signalname="HA" name="HA" />
            <blockpin signalname="HB" name="HB" />
            <blockpin signalname="HC" name="HC" />
            <blockpin signalname="HD" name="HD" />
            <blockpin signalname="XLXN_6(12:0)" name="ADDRESS(12:0)" />
            <blockpin signalname="XLXN_185(7:0)" name="DATA(7:0)" />
            <blockpin signalname="XLXN_899(7:0)" name="ADDRESS_WB(7:0)" />
            <blockpin signalname="XLXN_186(3:0)" name="ROW_select(3:0)" />
            <blockpin signalname="XLXN_426(47:0)" name="config_data(47:0)" />
            <blockpin signalname="XLXN_1023(4:0)" name="DIMMER_o(4:0)" />
            <blockpin signalname="CONFIG(31:0)" name="Config_register(31:0)" />
        </block>
        <block symbolname="Driver_shift_register" name="Driver_shift_register_i">
            <blockpin signalname="CLK_GD" name="CLK" />
            <blockpin signalname="XLXN_1025" name="MODE" />
            <blockpin signalname="XLXN_1021" name="MODE_PWM" />
            <blockpin signalname="XLXN_188" name="CONFIG_EN" />
            <blockpin signalname="XLXN_187" name="display_enable" />
            <blockpin signalname="display_ena" name="display_enable1" />
            <blockpin signalname="XLXN_1022" name="display_enable2" />
            <blockpin signalname="XLXN_1016(47:0)" name="RGB(47:0)" />
            <blockpin signalname="XLXN_422(47:0)" name="RGB_B(47:0)" />
            <blockpin signalname="XLXN_185(7:0)" name="DATA(7:0)" />
            <blockpin signalname="XLXN_186(3:0)" name="ROW(3:0)" />
            <blockpin signalname="XLXN_1023(4:0)" name="DIMMER(4:0)" />
            <blockpin signalname="XLXN_426(47:0)" name="DATA_CONFIG(47:0)" />
            <blockpin signalname="R(15:0)" name="R_o(15:0)" />
            <blockpin signalname="G(15:0)" name="G_o(15:0)" />
            <blockpin signalname="B(15:0)" name="B_o(15:0)" />
            <blockpin signalname="CONFIG(31:0)" name="Config_register(31:0)" />
        </block>
        <block symbolname="RGB_GAMMA_SCH" name="RGB_GAMMA_SCH1_i">
            <blockpin signalname="WE_GAMMA(0:0)" name="WE(0:0)" />
            <blockpin signalname="CLK_FIBER" name="CLK_IN" />
            <blockpin signalname="CLK_GD" name="CLK" />
            <blockpin signalname="GAMMA(23:0)" name="GAMMA(23:0)" />
            <blockpin signalname="XLXN_1018(23:0)" name="RGB_IN(23:0)" />
            <blockpin signalname="XLXN_1016(47:0)" name="RGB_OUT(47:0)" />
        </block>
        <block symbolname="sch_frame_buffer" name="sch_frame_buffer_i">
            <blockpin signalname="XLXN_2(23:0)" name="DATA_IN_A(23:0)" />
            <blockpin signalname="XLXN_487" name="CLK_A" />
            <blockpin signalname="XLXN_6(12:0)" name="ADD_B(12:0)" />
            <blockpin signalname="CLK_GD" name="CLK_B" />
            <blockpin signalname="XLXN_1017(0:0)" name="WR_A" />
            <blockpin signalname="XLXN_1(13:0)" name="ADD_A(13:0)" />
            <blockpin signalname="XLXN_1018(23:0)" name="DOUT_1(23:0)" />
            <blockpin signalname="XLXN_4(23:0)" name="DOUT_2(23:0)" />
            <blockpin signalname="CONFIG(31:0)" name="Config_register(31:0)" />
        </block>
        <block symbolname="core_wb_ram" name="WB_RAMi">
            <blockpin signalname="ADD_WB(7:0)" name="addra(7:0)" />
            <blockpin signalname="DATA_WB(23:0)" name="dina(23:0)" />
            <blockpin signalname="WR_WB" name="wea(0:0)" />
            <blockpin signalname="CLK_FIBER" name="clka" />
            <blockpin signalname="XLXN_892(7:0)" name="addrb(7:0)" />
            <blockpin signalname="XLXN_891(23:0)" name="dinb(23:0)" />
            <blockpin signalname="XLXN_893(0:0)" name="web(0:0)" />
            <blockpin signalname="CLK_GD" name="clkb" />
            <blockpin signalname="XLXN_876(23:0)" name="doutb(23:0)" />
            <blockpin signalname="DATA_WB_o(23:0)" name="douta(23:0)" />
        </block>
        <block symbolname="buf" name="XLXI_1">
            <blockpin signalname="XLXN_1025" name="I" />
            <blockpin signalname="MODE_Flage" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2368" y="1056" name="RGB_GAMMA_SCH2_i" orien="R0">
        </instance>
        <instance x="928" y="304" name="CLK_GD_MUXi" orien="R0">
        </instance>
        <instance x="960" y="672" name="TEST_MODEi" orien="R0">
        </instance>
        <iomarker fontsize="28" x="928" y="416" name="VIDEO_ADD(13:0)" orien="R180" />
        <iomarker fontsize="28" x="928" y="448" name="VIDEO_DATA(23:0)" orien="R180" />
        <iomarker fontsize="28" x="928" y="480" name="VIDEO_WR" orien="R180" />
        <iomarker fontsize="28" x="2304" y="1712" name="SCLK" orien="R0" />
        <iomarker fontsize="28" x="2304" y="1744" name="STR" orien="R0" />
        <iomarker fontsize="28" x="2304" y="1776" name="OE" orien="R0" />
        <iomarker fontsize="28" x="2112" y="1088" name="GAMMA(23:0)" orien="R180" />
        <iomarker fontsize="28" x="928" y="512" name="DIM(4:0)" orien="R180" />
        <iomarker fontsize="28" x="896" y="640" name="PAGE_IN" orien="R180" />
        <iomarker fontsize="28" x="480" y="144" name="CLK_FIBER" orien="R180" />
        <iomarker fontsize="28" x="464" y="208" name="CLK_125" orien="R180" />
        <iomarker fontsize="28" x="1520" y="1792" name="RESET" orien="R180" />
        <iomarker fontsize="28" x="464" y="1504" name="CLK_GD" orien="R180" />
        <iomarker fontsize="28" x="816" y="2016" name="ADD_WB(7:0)" orien="R180" />
        <iomarker fontsize="28" x="816" y="2048" name="DATA_WB(23:0)" orien="R180" />
        <iomarker fontsize="28" x="816" y="2144" name="WR_WB" orien="R180" />
        <iomarker fontsize="28" x="1216" y="2016" name="DATA_WB_o(23:0)" orien="R0" />
        <iomarker fontsize="28" x="432" y="752" name="CONFIG(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2240" y="1936" name="HA" orien="R0" />
        <iomarker fontsize="28" x="2240" y="1968" name="HB" orien="R0" />
        <iomarker fontsize="28" x="2240" y="2000" name="HC" orien="R0" />
        <iomarker fontsize="28" x="2240" y="2032" name="HD" orien="R0" />
        <instance x="2224" y="2640" name="ee_prom_control_i" orien="R0">
        </instance>
        <iomarker fontsize="28" x="3392" y="2416" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="3392" y="2448" name="SCL" orien="R0" />
        <iomarker fontsize="28" x="2176" y="2416" name="WB_WR_TRIG" orien="R180" />
        <branch name="XLXN_6(12:0)">
            <wire x2="1600" y1="624" y2="624" x1="1536" />
            <wire x2="1536" y1="624" y2="1248" x1="1536" />
            <wire x2="2272" y1="1248" y2="1248" x1="1536" />
            <wire x2="2272" y1="1248" y2="1344" x1="2272" />
            <wire x2="2272" y1="1344" y2="1344" x1="2208" />
        </branch>
        <branch name="RESET">
            <wire x2="1616" y1="1792" y2="1792" x1="1520" />
            <wire x2="1744" y1="1792" y2="1792" x1="1616" />
            <wire x2="1616" y1="1792" y2="2560" x1="1616" />
            <wire x2="1616" y1="2560" y2="2704" x1="1616" />
            <wire x2="2960" y1="2704" y2="2704" x1="1616" />
            <wire x2="2320" y1="2560" y2="2560" x1="1616" />
            <wire x2="2960" y1="2448" y2="2704" x1="2960" />
            <wire x2="2976" y1="2448" y2="2448" x1="2960" />
        </branch>
        <branch name="XLXN_4(23:0)">
            <wire x2="2176" y1="672" y2="672" x1="2080" />
            <wire x2="2176" y1="672" y2="704" x1="2176" />
            <wire x2="2368" y1="704" y2="704" x1="2176" />
        </branch>
        <branch name="XLXN_1(13:0)">
            <wire x2="1600" y1="416" y2="416" x1="1280" />
        </branch>
        <branch name="XLXN_2(23:0)">
            <wire x2="1600" y1="448" y2="448" x1="1280" />
        </branch>
        <branch name="CLK_FIBER">
            <wire x2="528" y1="144" y2="144" x1="480" />
            <wire x2="528" y1="144" y2="1136" x1="528" />
            <wire x2="2304" y1="1136" y2="1136" x1="528" />
            <wire x2="528" y1="1136" y2="2208" x1="528" />
            <wire x2="848" y1="2208" y2="2208" x1="528" />
            <wire x2="928" y1="144" y2="144" x1="528" />
            <wire x2="2384" y1="496" y2="496" x1="2304" />
            <wire x2="2304" y1="496" y2="1040" x1="2304" />
            <wire x2="2304" y1="1040" y2="1136" x1="2304" />
            <wire x2="2368" y1="1040" y2="1040" x1="2304" />
        </branch>
        <branch name="VIDEO_ADD(13:0)">
            <wire x2="960" y1="416" y2="416" x1="928" />
        </branch>
        <branch name="VIDEO_DATA(23:0)">
            <wire x2="960" y1="448" y2="448" x1="928" />
        </branch>
        <branch name="VIDEO_WR">
            <wire x2="960" y1="480" y2="480" x1="928" />
        </branch>
        <branch name="WE_GAMMA(0:0)">
            <wire x2="2352" y1="976" y2="976" x1="2112" />
            <wire x2="2368" y1="976" y2="976" x1="2352" />
            <wire x2="2384" y1="432" y2="432" x1="2352" />
            <wire x2="2352" y1="432" y2="976" x1="2352" />
        </branch>
        <branch name="GAMMA(23:0)">
            <wire x2="2320" y1="1088" y2="1088" x1="2112" />
            <wire x2="2368" y1="1088" y2="1088" x1="2320" />
            <wire x2="2384" y1="544" y2="544" x1="2320" />
            <wire x2="2320" y1="544" y2="1088" x1="2320" />
        </branch>
        <branch name="CLK_GD">
            <wire x2="560" y1="1504" y2="1504" x1="464" />
            <wire x2="560" y1="1504" y2="1744" x1="560" />
            <wire x2="1568" y1="1744" y2="1744" x1="560" />
            <wire x2="1744" y1="1744" y2="1744" x1="1568" />
            <wire x2="1568" y1="1744" y2="2512" x1="1568" />
            <wire x2="1568" y1="2512" y2="2688" x1="1568" />
            <wire x2="2944" y1="2688" y2="2688" x1="1568" />
            <wire x2="2320" y1="2512" y2="2512" x1="1568" />
            <wire x2="560" y1="1744" y2="2560" x1="560" />
            <wire x2="848" y1="2560" y2="2560" x1="560" />
            <wire x2="1392" y1="1504" y2="1504" x1="560" />
            <wire x2="1600" y1="688" y2="688" x1="1392" />
            <wire x2="1392" y1="688" y2="1168" x1="1392" />
            <wire x2="1392" y1="1168" y2="1504" x1="1392" />
            <wire x2="2272" y1="1168" y2="1168" x1="1392" />
            <wire x2="2464" y1="1168" y2="1168" x1="2272" />
            <wire x2="2464" y1="1168" y2="1360" x1="2464" />
            <wire x2="2896" y1="1360" y2="1360" x1="2464" />
            <wire x2="2384" y1="208" y2="208" x1="2272" />
            <wire x2="2272" y1="208" y2="752" x1="2272" />
            <wire x2="2368" y1="752" y2="752" x1="2272" />
            <wire x2="2272" y1="752" y2="1168" x1="2272" />
            <wire x2="2976" y1="2416" y2="2416" x1="2944" />
            <wire x2="2944" y1="2416" y2="2688" x1="2944" />
        </branch>
        <branch name="XLXN_185(7:0)">
            <wire x2="2896" y1="1440" y2="1440" x1="2208" />
        </branch>
        <branch name="XLXN_186(3:0)">
            <wire x2="2896" y1="1472" y2="1472" x1="2208" />
        </branch>
        <branch name="XLXN_187">
            <wire x2="2896" y1="1504" y2="1504" x1="2208" />
        </branch>
        <branch name="XLXN_188">
            <wire x2="2896" y1="1536" y2="1536" x1="2208" />
        </branch>
        <branch name="SCLK">
            <wire x2="2304" y1="1712" y2="1712" x1="2208" />
        </branch>
        <branch name="STR">
            <wire x2="2304" y1="1744" y2="1744" x1="2208" />
        </branch>
        <branch name="OE">
            <wire x2="2304" y1="1776" y2="1776" x1="2208" />
        </branch>
        <branch name="XLXN_422(47:0)">
            <wire x2="2800" y1="752" y2="752" x1="2768" />
            <wire x2="2800" y1="752" y2="1200" x1="2800" />
            <wire x2="2896" y1="1200" y2="1200" x1="2800" />
        </branch>
        <branch name="XLXN_426(47:0)">
            <wire x2="2896" y1="1568" y2="1568" x1="2208" />
        </branch>
        <branch name="DIM(4:0)">
            <wire x2="960" y1="512" y2="512" x1="928" />
        </branch>
        <branch name="PAGE_IN">
            <wire x2="960" y1="640" y2="640" x1="896" />
        </branch>
        <branch name="XLXN_487">
            <wire x2="1440" y1="144" y2="144" x1="1312" />
            <wire x2="1440" y1="144" y2="512" x1="1440" />
            <wire x2="1600" y1="512" y2="512" x1="1440" />
        </branch>
        <branch name="XLXN_488">
            <wire x2="928" y1="272" y2="272" x1="848" />
            <wire x2="848" y1="272" y2="352" x1="848" />
            <wire x2="1344" y1="352" y2="352" x1="848" />
            <wire x2="1344" y1="352" y2="384" x1="1344" />
            <wire x2="1344" y1="384" y2="384" x1="1280" />
        </branch>
        <branch name="CLK_125">
            <wire x2="496" y1="208" y2="208" x1="464" />
            <wire x2="496" y1="208" y2="720" x1="496" />
            <wire x2="960" y1="720" y2="720" x1="496" />
            <wire x2="928" y1="208" y2="208" x1="496" />
        </branch>
        <branch name="ADD_WB(7:0)">
            <wire x2="848" y1="2016" y2="2016" x1="816" />
        </branch>
        <branch name="DATA_WB(23:0)">
            <wire x2="848" y1="2048" y2="2048" x1="816" />
        </branch>
        <branch name="WR_WB">
            <wire x2="848" y1="2144" y2="2144" x1="816" />
        </branch>
        <branch name="DATA_WB_o(23:0)">
            <wire x2="1216" y1="2016" y2="2016" x1="1184" />
        </branch>
        <branch name="HA">
            <wire x2="2240" y1="1936" y2="1936" x1="2208" />
        </branch>
        <branch name="HB">
            <wire x2="2240" y1="1968" y2="1968" x1="2208" />
        </branch>
        <branch name="HC">
            <wire x2="2240" y1="2000" y2="2000" x1="2208" />
        </branch>
        <branch name="HD">
            <wire x2="2240" y1="2032" y2="2032" x1="2208" />
        </branch>
        <branch name="XLXN_885(6:0)">
            <wire x2="2976" y1="2208" y2="2208" x1="2816" />
        </branch>
        <branch name="XLXN_886(7:0)">
            <wire x2="2976" y1="2240" y2="2240" x1="2816" />
        </branch>
        <branch name="XLXN_887">
            <wire x2="2976" y1="2272" y2="2272" x1="2816" />
        </branch>
        <branch name="XLXN_888">
            <wire x2="2976" y1="2304" y2="2304" x1="2816" />
        </branch>
        <branch name="XLXN_890(7:0)">
            <wire x2="2976" y1="2368" y2="2368" x1="2816" />
        </branch>
        <branch name="XLXN_891(23:0)">
            <wire x2="848" y1="2400" y2="2400" x1="784" />
            <wire x2="784" y1="2400" y2="2640" x1="784" />
            <wire x2="2880" y1="2640" y2="2640" x1="784" />
            <wire x2="2880" y1="2464" y2="2464" x1="2816" />
            <wire x2="2880" y1="2464" y2="2640" x1="2880" />
        </branch>
        <branch name="XLXN_892(7:0)">
            <wire x2="848" y1="2368" y2="2368" x1="800" />
            <wire x2="800" y1="2368" y2="2624" x1="800" />
            <wire x2="2864" y1="2624" y2="2624" x1="800" />
            <wire x2="2864" y1="2496" y2="2496" x1="2816" />
            <wire x2="2864" y1="2496" y2="2624" x1="2864" />
        </branch>
        <branch name="XLXN_893(0:0)">
            <wire x2="848" y1="2496" y2="2496" x1="816" />
            <wire x2="816" y1="2496" y2="2608" x1="816" />
            <wire x2="2848" y1="2608" y2="2608" x1="816" />
            <wire x2="2848" y1="2528" y2="2528" x1="2816" />
            <wire x2="2848" y1="2528" y2="2608" x1="2848" />
        </branch>
        <branch name="SDA">
            <wire x2="3392" y1="2416" y2="2416" x1="3360" />
        </branch>
        <branch name="SCL">
            <wire x2="3392" y1="2448" y2="2448" x1="3360" />
        </branch>
        <branch name="XLXN_876(23:0)">
            <wire x2="1536" y1="2368" y2="2368" x1="1184" />
            <wire x2="1536" y1="2064" y2="2320" x1="1536" />
            <wire x2="1536" y1="2320" y2="2368" x1="1536" />
            <wire x2="2320" y1="2320" y2="2320" x1="1536" />
            <wire x2="1744" y1="2064" y2="2064" x1="1536" />
        </branch>
        <branch name="XLXN_425">
            <wire x2="1344" y1="672" y2="672" x1="1280" />
            <wire x2="1344" y1="672" y2="1568" x1="1344" />
            <wire x2="1664" y1="1568" y2="1568" x1="1344" />
            <wire x2="1664" y1="1568" y2="1952" x1="1664" />
            <wire x2="1744" y1="1952" y2="1952" x1="1664" />
        </branch>
        <branch name="CONFIG(31:0)">
            <wire x2="880" y1="752" y2="752" x1="432" />
            <wire x2="960" y1="752" y2="752" x1="880" />
            <wire x2="880" y1="752" y2="848" x1="880" />
            <wire x2="880" y1="848" y2="1392" x1="880" />
            <wire x2="1648" y1="1392" y2="1392" x1="880" />
            <wire x2="1648" y1="1392" y2="1408" x1="1648" />
            <wire x2="1648" y1="1408" y2="2576" x1="1648" />
            <wire x2="2320" y1="2576" y2="2576" x1="1648" />
            <wire x2="1744" y1="1408" y2="1408" x1="1648" />
            <wire x2="1504" y1="848" y2="848" x1="880" />
            <wire x2="1600" y1="720" y2="720" x1="1504" />
            <wire x2="1504" y1="720" y2="848" x1="1504" />
            <wire x2="2544" y1="1184" y2="1184" x1="1648" />
            <wire x2="2544" y1="1184" y2="1696" x1="2544" />
            <wire x2="2896" y1="1696" y2="1696" x1="2544" />
            <wire x2="1648" y1="1184" y2="1392" x1="1648" />
        </branch>
        <branch name="WB_WR_TRIG">
            <wire x2="2320" y1="2416" y2="2416" x1="2176" />
        </branch>
        <branch name="XLXN_899(7:0)">
            <wire x2="2320" y1="2096" y2="2096" x1="2208" />
        </branch>
        <branch name="XLXN_900">
            <wire x2="2320" y1="2128" y2="2128" x1="2208" />
        </branch>
        <branch name="XLXN_901">
            <wire x2="2320" y1="2160" y2="2160" x1="2208" />
        </branch>
        <instance x="2976" y="2560" name="i2c_master_i" orien="R0">
        </instance>
        <branch name="DB1">
            <wire x2="2848" y1="2080" y2="2080" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="2848" y="2080" name="DB1" orien="R0" />
        <branch name="DB2">
            <wire x2="2848" y1="2112" y2="2112" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="2848" y="2112" name="DB2" orien="R0" />
        <branch name="DB3">
            <wire x2="2848" y1="2144" y2="2144" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="2848" y="2144" name="DB3" orien="R0" />
        <branch name="DB4">
            <wire x2="2848" y1="2176" y2="2176" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="2848" y="2176" name="DB4" orien="R0" />
        <branch name="EEPROM_WP">
            <wire x2="2832" y1="2592" y2="2592" x1="2816" />
            <wire x2="2832" y1="2544" y2="2592" x1="2832" />
            <wire x2="3200" y1="2544" y2="2544" x1="2832" />
        </branch>
        <iomarker fontsize="28" x="3200" y="2544" name="EEPROM_WP" orien="R0" />
        <branch name="i2c_ack_error">
            <wire x2="3088" y1="2480" y2="2656" x1="3088" />
            <wire x2="3168" y1="2656" y2="2656" x1="3088" />
            <wire x2="3376" y1="2480" y2="2480" x1="3088" />
            <wire x2="3376" y1="2320" y2="2320" x1="3360" />
            <wire x2="3376" y1="2320" y2="2480" x1="3376" />
        </branch>
        <iomarker fontsize="28" x="3168" y="2656" name="i2c_ack_error" orien="R0" />
        <branch name="XLXN_1008">
            <wire x2="2976" y1="2336" y2="2336" x1="2816" />
        </branch>
        <instance x="1744" y="2464" name="g_drive_controller_shif_register_i" orien="R0">
        </instance>
        <instance x="2896" y="1680" name="Driver_shift_register_i" orien="R0">
        </instance>
        <branch name="R(15:0)">
            <wire x2="3296" y1="1200" y2="1200" x1="3264" />
        </branch>
        <branch name="G(15:0)">
            <wire x2="3296" y1="1232" y2="1232" x1="3264" />
        </branch>
        <branch name="B(15:0)">
            <wire x2="3296" y1="1264" y2="1264" x1="3264" />
        </branch>
        <iomarker fontsize="28" x="3296" y="1200" name="R(15:0)" orien="R0" />
        <iomarker fontsize="28" x="3296" y="1232" name="G(15:0)" orien="R0" />
        <iomarker fontsize="28" x="3296" y="1264" name="B(15:0)" orien="R0" />
        <instance x="2384" y="512" name="RGB_GAMMA_SCH1_i" orien="R0">
        </instance>
        <branch name="XLXN_1016(47:0)">
            <wire x2="2848" y1="208" y2="208" x1="2784" />
            <wire x2="2848" y1="208" y2="1168" x1="2848" />
            <wire x2="2896" y1="1168" y2="1168" x1="2848" />
        </branch>
        <branch name="XLXN_1017(0:0)">
            <wire x2="1600" y1="480" y2="480" x1="1280" />
        </branch>
        <branch name="XLXN_1018(23:0)">
            <wire x2="2224" y1="624" y2="624" x1="2080" />
            <wire x2="2224" y1="160" y2="624" x1="2224" />
            <wire x2="2384" y1="160" y2="160" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="2112" y="976" name="WE_GAMMA(0:0)" orien="R180" />
        <instance x="1600" y="752" name="sch_frame_buffer_i" orien="R0">
        </instance>
        <instance x="848" y="1936" name="WB_RAMi" orien="R0">
        </instance>
        <branch name="CLK_PWM">
            <wire x2="1728" y1="1696" y2="1696" x1="1488" />
            <wire x2="1744" y1="1696" y2="1696" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="1488" y="1696" name="CLK_PWM" orien="R180" />
        <branch name="XLXN_1021">
            <wire x2="2896" y1="1600" y2="1600" x1="2208" />
        </branch>
        <branch name="XLXN_1022">
            <wire x2="2832" y1="2048" y2="2048" x1="2816" />
            <wire x2="2832" y1="1984" y2="2048" x1="2832" />
            <wire x2="2848" y1="1984" y2="1984" x1="2832" />
            <wire x2="2848" y1="1664" y2="1984" x1="2848" />
            <wire x2="2896" y1="1664" y2="1664" x1="2848" />
        </branch>
        <branch name="display_ena">
            <wire x2="2896" y1="1632" y2="1632" x1="2864" />
        </branch>
        <iomarker fontsize="28" x="2864" y="1632" name="display_ena" orien="R180" />
        <branch name="XLXN_1023(4:0)">
            <wire x2="2448" y1="1376" y2="1376" x1="2208" />
            <wire x2="2448" y1="1312" y2="1376" x1="2448" />
            <wire x2="2896" y1="1312" y2="1312" x1="2448" />
        </branch>
        <branch name="XLXN_1024(4:0)">
            <wire x2="1488" y1="544" y2="544" x1="1280" />
            <wire x2="1488" y1="544" y2="1344" x1="1488" />
            <wire x2="1744" y1="1344" y2="1344" x1="1488" />
        </branch>
        <instance x="2544" y="1856" name="XLXI_1" orien="R0" />
        <branch name="XLXN_1025">
            <wire x2="2512" y1="1408" y2="1408" x1="2208" />
            <wire x2="2896" y1="1408" y2="1408" x1="2512" />
            <wire x2="2512" y1="1408" y2="1824" x1="2512" />
            <wire x2="2544" y1="1824" y2="1824" x1="2512" />
        </branch>
        <branch name="MODE_Flage">
            <wire x2="2800" y1="1824" y2="1824" x1="2768" />
        </branch>
        <iomarker fontsize="28" x="2800" y="1824" name="MODE_Flage" orien="R0" />
    </sheet>
</drawing>