<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="DOUT_1(23:0)" />
        <signal name="DOUT_2(23:0)" />
        <signal name="DATA_IN_A(23:0)" />
        <signal name="CLK_A" />
        <signal name="ADD_B(12:0)" />
        <signal name="CLK_B" />
        <signal name="XLXN_15(12:0)" />
        <signal name="XLXN_16(0:0)" />
        <signal name="XLXN_17(12:0)" />
        <signal name="XLXN_18(0:0)" />
        <signal name="WR_A" />
        <signal name="ADD_A(13:0)" />
        <signal name="Config_register(31:0)" />
        <port polarity="Output" name="DOUT_1(23:0)" />
        <port polarity="Output" name="DOUT_2(23:0)" />
        <port polarity="Input" name="DATA_IN_A(23:0)" />
        <port polarity="Input" name="CLK_A" />
        <port polarity="Input" name="ADD_B(12:0)" />
        <port polarity="Input" name="CLK_B" />
        <port polarity="Input" name="WR_A" />
        <port polarity="Input" name="ADD_A(13:0)" />
        <port polarity="Input" name="Config_register(31:0)" />
        <blockdef name="frame_buff_mem">
            <timestamp>2013-9-25T12:41:49</timestamp>
            <rect width="512" x="32" y="32" height="1344" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="112" y2="112" style="linewidth:W" x1="0" />
            <line x2="32" y1="208" y2="208" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="32" y1="432" y2="432" style="linewidth:W" x1="0" />
            <line x2="32" y1="624" y2="624" x1="0" />
            <line x2="544" y1="368" y2="368" style="linewidth:W" x1="576" />
        </blockdef>
        <blockdef name="frame_buffer_add_mux">
            <timestamp>2013-12-3T4:27:45</timestamp>
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-12" height="24" />
            <line x2="0" y1="0" y2="0" x1="64" />
            <rect width="64" x="416" y="-204" height="24" />
            <line x2="480" y1="-192" y2="-192" x1="416" />
            <rect width="64" x="416" y="-172" height="24" />
            <line x2="480" y1="-160" y2="-160" x1="416" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="480" y1="-96" y2="-96" x1="416" />
            <line x2="480" y1="-64" y2="-64" x1="416" />
            <rect width="352" x="64" y="-256" height="280" />
        </blockdef>
        <block symbolname="frame_buff_mem" name="frame_buff_memi">
            <blockpin signalname="XLXN_15(12:0)" name="addra(12:0)" />
            <blockpin signalname="DATA_IN_A(23:0)" name="dina(23:0)" />
            <blockpin signalname="XLXN_16(0:0)" name="wea(0:0)" />
            <blockpin signalname="CLK_A" name="clka" />
            <blockpin signalname="ADD_B(12:0)" name="addrb(12:0)" />
            <blockpin signalname="CLK_B" name="clkb" />
            <blockpin signalname="DOUT_1(23:0)" name="doutb(23:0)" />
        </block>
        <block symbolname="frame_buff_mem" name="XLXI_2">
            <blockpin signalname="XLXN_17(12:0)" name="addra(12:0)" />
            <blockpin signalname="DATA_IN_A(23:0)" name="dina(23:0)" />
            <blockpin signalname="XLXN_18(0:0)" name="wea(0:0)" />
            <blockpin signalname="CLK_A" name="clka" />
            <blockpin signalname="ADD_B(12:0)" name="addrb(12:0)" />
            <blockpin signalname="CLK_B" name="clkb" />
            <blockpin signalname="DOUT_2(23:0)" name="doutb(23:0)" />
        </block>
        <block symbolname="frame_buffer_add_mux" name="XLXI_3">
            <blockpin signalname="WR_A" name="WR_IN" />
            <blockpin signalname="ADD_A(13:0)" name="ADD_IN(13:0)" />
            <blockpin signalname="XLXN_16(0:0)" name="WR_OUT_1" />
            <blockpin signalname="XLXN_18(0:0)" name="WR_OUT_2" />
            <blockpin signalname="XLXN_15(12:0)" name="ADD_OUT_1(12:0)" />
            <blockpin signalname="XLXN_17(12:0)" name="ADD_OUT_2(12:0)" />
            <blockpin signalname="CLK_A" name="CLK" />
            <blockpin signalname="Config_register(31:0)" name="Config_register(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2560" y="48" name="frame_buff_memi" orien="R0">
        </instance>
        <instance x="1744" y="1248" name="XLXI_2" orien="R0">
        </instance>
        <branch name="DOUT_1(23:0)">
            <wire x2="3168" y1="416" y2="416" x1="3136" />
        </branch>
        <branch name="DOUT_2(23:0)">
            <wire x2="2352" y1="1616" y2="1616" x1="2320" />
        </branch>
        <branch name="DATA_IN_A(23:0)">
            <wire x2="1632" y1="1360" y2="1360" x1="1248" />
            <wire x2="1744" y1="1360" y2="1360" x1="1632" />
            <wire x2="2560" y1="160" y2="160" x1="1632" />
            <wire x2="1632" y1="160" y2="1360" x1="1632" />
        </branch>
        <branch name="CLK_A">
            <wire x2="912" y1="752" y2="752" x1="832" />
            <wire x2="832" y1="752" y2="912" x1="832" />
            <wire x2="1664" y1="912" y2="912" x1="832" />
            <wire x2="1664" y1="912" y2="1520" x1="1664" />
            <wire x2="1744" y1="1520" y2="1520" x1="1664" />
            <wire x2="1664" y1="1520" y2="1520" x1="1248" />
            <wire x2="2560" y1="320" y2="320" x1="1664" />
            <wire x2="1664" y1="320" y2="912" x1="1664" />
        </branch>
        <branch name="ADD_B(12:0)">
            <wire x2="1280" y1="1680" y2="1680" x1="1248" />
            <wire x2="1696" y1="1680" y2="1680" x1="1280" />
            <wire x2="1744" y1="1680" y2="1680" x1="1696" />
            <wire x2="2560" y1="480" y2="480" x1="1696" />
            <wire x2="1696" y1="480" y2="1680" x1="1696" />
        </branch>
        <branch name="CLK_B">
            <wire x2="1280" y1="1872" y2="1872" x1="1248" />
            <wire x2="1712" y1="1872" y2="1872" x1="1280" />
            <wire x2="1744" y1="1872" y2="1872" x1="1712" />
            <wire x2="2560" y1="672" y2="672" x1="1712" />
            <wire x2="1712" y1="672" y2="1872" x1="1712" />
        </branch>
        <branch name="XLXN_15(12:0)">
            <wire x2="1968" y1="592" y2="592" x1="1392" />
            <wire x2="1968" y1="128" y2="592" x1="1968" />
            <wire x2="2560" y1="128" y2="128" x1="1968" />
        </branch>
        <branch name="XLXN_16(0:0)">
            <wire x2="1952" y1="688" y2="688" x1="1392" />
            <wire x2="1952" y1="256" y2="688" x1="1952" />
            <wire x2="2560" y1="256" y2="256" x1="1952" />
        </branch>
        <branch name="XLXN_17(12:0)">
            <wire x2="1568" y1="624" y2="624" x1="1392" />
            <wire x2="1568" y1="624" y2="1328" x1="1568" />
            <wire x2="1744" y1="1328" y2="1328" x1="1568" />
        </branch>
        <branch name="XLXN_18(0:0)">
            <wire x2="1552" y1="720" y2="720" x1="1392" />
            <wire x2="1552" y1="720" y2="1456" x1="1552" />
            <wire x2="1744" y1="1456" y2="1456" x1="1552" />
        </branch>
        <branch name="WR_A">
            <wire x2="912" y1="688" y2="688" x1="880" />
        </branch>
        <branch name="ADD_A(13:0)">
            <wire x2="912" y1="560" y2="560" x1="880" />
        </branch>
        <branch name="Config_register(31:0)">
            <wire x2="896" y1="784" y2="784" x1="480" />
            <wire x2="912" y1="784" y2="784" x1="896" />
        </branch>
        <iomarker fontsize="28" x="3168" y="416" name="DOUT_1(23:0)" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1616" name="DOUT_2(23:0)" orien="R0" />
        <iomarker fontsize="28" x="1248" y="1360" name="DATA_IN_A(23:0)" orien="R180" />
        <iomarker fontsize="28" x="1248" y="1520" name="CLK_A" orien="R180" />
        <iomarker fontsize="28" x="1248" y="1680" name="ADD_B(12:0)" orien="R180" />
        <iomarker fontsize="28" x="1248" y="1872" name="CLK_B" orien="R180" />
        <iomarker fontsize="28" x="880" y="688" name="WR_A" orien="R180" />
        <iomarker fontsize="28" x="880" y="560" name="ADD_A(13:0)" orien="R180" />
        <iomarker fontsize="28" x="480" y="784" name="Config_register(31:0)" orien="R180" />
        <instance x="912" y="784" name="XLXI_3" orien="R0">
        </instance>
    </sheet>
</drawing>