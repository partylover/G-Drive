<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="GAMMA(23:16)" />
        <signal name="GAMMA(15:0)" />
        <signal name="WE(0:0)" />
        <signal name="CLK_IN" />
        <signal name="CLK" />
        <signal name="RGB_OUT(47:0)" />
        <signal name="RGB_OUT(47:32)" />
        <signal name="RGB_OUT(31:16)" />
        <signal name="RGB_OUT(15:0)" />
        <signal name="GAMMA(23:0)" />
        <signal name="RGB_IN(23:0)" />
        <signal name="RGB_IN(23:16)" />
        <signal name="RGB_IN(15:8)" />
        <signal name="RGB_IN(7:0)" />
        <port polarity="Input" name="WE(0:0)" />
        <port polarity="Input" name="CLK_IN" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="RGB_OUT(47:0)" />
        <port polarity="Input" name="GAMMA(23:0)" />
        <port polarity="Input" name="RGB_IN(23:0)" />
        <blockdef name="core_gamma_table">
            <timestamp>2013-7-24T10:27:47</timestamp>
            <rect width="264" x="32" y="32" height="480" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="112" y2="112" style="linewidth:W" x1="0" />
            <line x2="32" y1="432" y2="432" style="linewidth:W" x1="0" />
            <line x2="32" y1="144" y2="144" style="linewidth:W" x1="0" />
            <line x2="32" y1="208" y2="208" x1="0" />
            <line x2="32" y1="480" y2="480" x1="0" />
            <line x2="304" y1="160" y2="160" style="linewidth:W" x1="336" />
        </blockdef>
        <block symbolname="core_gamma_table" name="gamma_table_R_i">
            <blockpin signalname="GAMMA(23:16)" name="addra(7:0)" />
            <blockpin signalname="GAMMA(15:0)" name="dina(15:0)" />
            <blockpin signalname="RGB_IN(23:16)" name="addrb(7:0)" />
            <blockpin signalname="WE(0:0)" name="wea(0:0)" />
            <blockpin signalname="CLK_IN" name="clka" />
            <blockpin signalname="CLK" name="clkb" />
            <blockpin signalname="RGB_OUT(47:32)" name="doutb(15:0)" />
        </block>
        <block symbolname="core_gamma_table" name="gamma_table_G_i">
            <blockpin signalname="GAMMA(23:16)" name="addra(7:0)" />
            <blockpin signalname="GAMMA(15:0)" name="dina(15:0)" />
            <blockpin signalname="RGB_IN(15:8)" name="addrb(7:0)" />
            <blockpin signalname="WE(0:0)" name="wea(0:0)" />
            <blockpin signalname="CLK_IN" name="clka" />
            <blockpin signalname="CLK" name="clkb" />
            <blockpin signalname="RGB_OUT(31:16)" name="doutb(15:0)" />
        </block>
        <block symbolname="core_gamma_table" name="gamma_table_B_i">
            <blockpin signalname="GAMMA(23:16)" name="addra(7:0)" />
            <blockpin signalname="GAMMA(15:0)" name="dina(15:0)" />
            <blockpin signalname="RGB_IN(7:0)" name="addrb(7:0)" />
            <blockpin signalname="WE(0:0)" name="wea(0:0)" />
            <blockpin signalname="CLK_IN" name="clka" />
            <blockpin signalname="CLK" name="clkb" />
            <blockpin signalname="RGB_OUT(15:0)" name="doutb(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="GAMMA(23:16)">
            <wire x2="1248" y1="336" y2="336" x1="496" />
            <wire x2="1488" y1="336" y2="336" x1="1248" />
            <wire x2="1248" y1="336" y2="1072" x1="1248" />
            <wire x2="1248" y1="1072" y2="1808" x1="1248" />
            <wire x2="1488" y1="1808" y2="1808" x1="1248" />
            <wire x2="1472" y1="1072" y2="1072" x1="1248" />
            <wire x2="1488" y1="1072" y2="1072" x1="1472" />
        </branch>
        <branch name="GAMMA(15:0)">
            <wire x2="560" y1="400" y2="400" x1="496" />
            <wire x2="560" y1="368" y2="400" x1="560" />
            <wire x2="1216" y1="368" y2="368" x1="560" />
            <wire x2="1488" y1="368" y2="368" x1="1216" />
            <wire x2="1216" y1="368" y2="1104" x1="1216" />
            <wire x2="1216" y1="1104" y2="1840" x1="1216" />
            <wire x2="1488" y1="1840" y2="1840" x1="1216" />
            <wire x2="1472" y1="1104" y2="1104" x1="1216" />
            <wire x2="1488" y1="1104" y2="1104" x1="1472" />
        </branch>
        <branch name="WE(0:0)">
            <wire x2="1184" y1="400" y2="400" x1="816" />
            <wire x2="1184" y1="400" y2="1136" x1="1184" />
            <wire x2="1184" y1="1136" y2="1872" x1="1184" />
            <wire x2="1488" y1="1872" y2="1872" x1="1184" />
            <wire x2="1472" y1="1136" y2="1136" x1="1184" />
            <wire x2="1488" y1="1136" y2="1136" x1="1472" />
            <wire x2="1488" y1="400" y2="400" x1="1184" />
        </branch>
        <branch name="CLK_IN">
            <wire x2="1120" y1="464" y2="464" x1="816" />
            <wire x2="1120" y1="464" y2="1200" x1="1120" />
            <wire x2="1120" y1="1200" y2="1936" x1="1120" />
            <wire x2="1488" y1="1936" y2="1936" x1="1120" />
            <wire x2="1472" y1="1200" y2="1200" x1="1120" />
            <wire x2="1488" y1="1200" y2="1200" x1="1472" />
            <wire x2="1488" y1="464" y2="464" x1="1120" />
        </branch>
        <branch name="CLK">
            <wire x2="1056" y1="736" y2="736" x1="704" />
            <wire x2="1056" y1="736" y2="1472" x1="1056" />
            <wire x2="1056" y1="1472" y2="2208" x1="1056" />
            <wire x2="1488" y1="2208" y2="2208" x1="1056" />
            <wire x2="1472" y1="1472" y2="1472" x1="1056" />
            <wire x2="1488" y1="1472" y2="1472" x1="1472" />
            <wire x2="1488" y1="736" y2="736" x1="1056" />
        </branch>
        <iomarker fontsize="28" x="704" y="736" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="816" y="464" name="CLK_IN" orien="R180" />
        <branch name="RGB_OUT(47:0)">
            <wire x2="2192" y1="384" y2="416" x1="2192" />
            <wire x2="2192" y1="416" y2="1152" x1="2192" />
            <wire x2="2192" y1="1152" y2="1888" x1="2192" />
            <wire x2="2192" y1="1888" y2="1952" x1="2192" />
            <wire x2="2624" y1="1952" y2="1952" x1="2192" />
        </branch>
        <bustap x2="2288" y1="416" y2="416" x1="2192" />
        <bustap x2="2288" y1="1152" y2="1152" x1="2192" />
        <bustap x2="2288" y1="1888" y2="1888" x1="2192" />
        <branch name="RGB_OUT(47:32)">
            <wire x2="1888" y1="416" y2="416" x1="1824" />
            <wire x2="1888" y1="336" y2="416" x1="1888" />
            <wire x2="2352" y1="336" y2="336" x1="1888" />
            <wire x2="2352" y1="336" y2="416" x1="2352" />
            <wire x2="2352" y1="416" y2="416" x1="2288" />
        </branch>
        <branch name="RGB_OUT(31:16)">
            <wire x2="1840" y1="1152" y2="1152" x1="1824" />
            <wire x2="1888" y1="1152" y2="1152" x1="1840" />
            <wire x2="1888" y1="1072" y2="1152" x1="1888" />
            <wire x2="2352" y1="1072" y2="1072" x1="1888" />
            <wire x2="2352" y1="1072" y2="1152" x1="2352" />
            <wire x2="2352" y1="1152" y2="1152" x1="2288" />
        </branch>
        <branch name="RGB_OUT(15:0)">
            <wire x2="1840" y1="1888" y2="1888" x1="1824" />
            <wire x2="1888" y1="1888" y2="1888" x1="1840" />
            <wire x2="2368" y1="1824" y2="1824" x1="1888" />
            <wire x2="2368" y1="1824" y2="1888" x1="2368" />
            <wire x2="1888" y1="1824" y2="1888" x1="1888" />
            <wire x2="2368" y1="1888" y2="1888" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2624" y="1952" name="RGB_OUT(47:0)" orien="R0" />
        <iomarker fontsize="28" x="816" y="400" name="WE(0:0)" orien="R180" />
        <branch name="GAMMA(23:0)">
            <wire x2="400" y1="368" y2="368" x1="320" />
            <wire x2="400" y1="368" y2="400" x1="400" />
            <wire x2="400" y1="400" y2="416" x1="400" />
            <wire x2="400" y1="320" y2="336" x1="400" />
            <wire x2="400" y1="336" y2="368" x1="400" />
        </branch>
        <iomarker fontsize="28" x="320" y="368" name="GAMMA(23:0)" orien="R180" />
        <bustap x2="496" y1="336" y2="336" x1="400" />
        <bustap x2="496" y1="400" y2="400" x1="400" />
        <branch name="RGB_IN(23:0)">
            <wire x2="688" y1="1360" y2="1360" x1="320" />
            <wire x2="688" y1="1088" y2="1136" x1="688" />
            <wire x2="688" y1="1136" y2="1200" x1="688" />
            <wire x2="688" y1="1200" y2="1264" x1="688" />
            <wire x2="688" y1="1264" y2="1360" x1="688" />
        </branch>
        <iomarker fontsize="28" x="320" y="1360" name="RGB_IN(23:0)" orien="R180" />
        <instance x="1488" y="256" name="gamma_table_R_i" orien="R0">
        </instance>
        <instance x="1488" y="992" name="gamma_table_G_i" orien="R0">
        </instance>
        <instance x="1488" y="1728" name="gamma_table_B_i" orien="R0">
        </instance>
        <bustap x2="784" y1="1136" y2="1136" x1="688" />
        <bustap x2="784" y1="1200" y2="1200" x1="688" />
        <bustap x2="784" y1="1264" y2="1264" x1="688" />
        <branch name="RGB_IN(23:16)">
            <wire x2="1136" y1="1136" y2="1136" x1="784" />
            <wire x2="1136" y1="688" y2="1136" x1="1136" />
            <wire x2="1488" y1="688" y2="688" x1="1136" />
        </branch>
        <branch name="RGB_IN(15:8)">
            <wire x2="1104" y1="1200" y2="1200" x1="784" />
            <wire x2="1104" y1="1200" y2="1424" x1="1104" />
            <wire x2="1488" y1="1424" y2="1424" x1="1104" />
        </branch>
        <branch name="RGB_IN(7:0)">
            <wire x2="1040" y1="1264" y2="1264" x1="784" />
            <wire x2="1040" y1="1264" y2="2160" x1="1040" />
            <wire x2="1488" y1="2160" y2="2160" x1="1040" />
        </branch>
    </sheet>
</drawing>