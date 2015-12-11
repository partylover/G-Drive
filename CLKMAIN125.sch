<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK_IN" />
        <signal name="XLXN_1" />
        <signal name="RESET" />
        <signal name="CLK_GD" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="CONFIG(31:0)" />
        <signal name="CLK_PWM" />
        <signal name="XLXN_7" />
        <signal name="CLK25" />
        <signal name="CLK125" />
        <signal name="XLXN_12" />
        <port polarity="Input" name="CLK_IN" />
        <port polarity="Output" name="RESET" />
        <port polarity="Output" name="CLK_GD" />
        <port polarity="Input" name="CONFIG(31:0)" />
        <port polarity="Output" name="CLK_PWM" />
        <port polarity="Output" name="CLK25" />
        <port polarity="Output" name="CLK125" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="clk_man">
            <timestamp>2015-10-7T8:49:12</timestamp>
            <rect width="544" x="32" y="32" height="1056" />
            <line x2="32" y1="80" y2="80" x1="0" />
            <line x2="576" y1="80" y2="80" x1="608" />
            <line x2="576" y1="176" y2="176" x1="608" />
            <line x2="576" y1="272" y2="272" x1="608" />
            <line x2="576" y1="368" y2="368" x1="608" />
            <line x2="576" y1="464" y2="464" x1="608" />
            <line x2="576" y1="976" y2="976" x1="608" />
        </blockdef>
        <blockdef name="bufgmux_1">
            <timestamp>2008-10-8T15:57:24</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="clk_select">
            <timestamp>2014-1-16T8:43:37</timestamp>
            <line x2="464" y1="32" y2="32" x1="400" />
            <line x2="464" y1="96" y2="96" x1="400" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="336" x="64" y="-64" height="192" />
        </blockdef>
        <block symbolname="inv" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="I" />
            <blockpin signalname="RESET" name="O" />
        </block>
        <block symbolname="clk_man" name="XLXI_5">
            <blockpin signalname="CLK_IN" name="clk_in1" />
            <blockpin signalname="CLK125" name="clk_out1" />
            <blockpin signalname="CLK25" name="clk_out2" />
            <blockpin signalname="XLXN_3" name="clk_out3" />
            <blockpin signalname="XLXN_4" name="clk_out4" />
            <blockpin signalname="XLXN_7" name="clk_out5" />
            <blockpin signalname="XLXN_1" name="locked" />
        </block>
        <block symbolname="bufgmux_1" name="ETH_CLK_MUXi">
            <blockpin signalname="XLXN_3" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin signalname="XLXN_5" name="S" />
            <blockpin signalname="CLK_GD" name="O" />
        </block>
        <block symbolname="clk_select" name="XLXI_7">
            <blockpin signalname="CONFIG(31:0)" name="config_register(31:0)" />
            <blockpin signalname="XLXN_5" name="select_out_GD_CLK" />
            <blockpin signalname="XLXN_12" name="select_out_PWM_CLK" />
        </block>
        <block symbolname="bufgmux_1" name="XLXI_8">
            <blockpin signalname="CLK25" name="I0" />
            <blockpin signalname="XLXN_7" name="I1" />
            <blockpin signalname="XLXN_12" name="S" />
            <blockpin signalname="CLK_PWM" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="CLK_IN">
            <wire x2="1472" y1="1056" y2="1056" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="1440" y="1056" name="CLK_IN" orien="R180" />
        <instance x="2176" y="2000" name="XLXI_2" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="2112" y1="1952" y2="1952" x1="2080" />
            <wire x2="2112" y1="1952" y2="1968" x1="2112" />
            <wire x2="2176" y1="1968" y2="1968" x1="2112" />
        </branch>
        <branch name="RESET">
            <wire x2="2432" y1="1968" y2="1968" x1="2400" />
        </branch>
        <iomarker fontsize="28" x="2432" y="1968" name="RESET" orien="R0" />
        <instance x="1472" y="976" name="XLXI_5" orien="R0">
        </instance>
        <branch name="CLK_GD">
            <wire x2="2848" y1="1248" y2="1248" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="2848" y="1248" name="CLK_GD" orien="R0" />
        <instance x="2432" y="1408" name="ETH_CLK_MUXi" orien="R0">
        </instance>
        <branch name="XLXN_3">
            <wire x2="2432" y1="1248" y2="1248" x1="2080" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="2256" y1="1344" y2="1344" x1="2080" />
            <wire x2="2256" y1="1312" y2="1344" x1="2256" />
            <wire x2="2432" y1="1312" y2="1312" x1="2256" />
        </branch>
        <instance x="1680" y="752" name="XLXI_7" orien="R0">
        </instance>
        <branch name="XLXN_5">
            <wire x2="2288" y1="784" y2="784" x1="2144" />
            <wire x2="2288" y1="784" y2="1376" x1="2288" />
            <wire x2="2432" y1="1376" y2="1376" x1="2288" />
        </branch>
        <branch name="CONFIG(31:0)">
            <wire x2="1680" y1="720" y2="720" x1="1648" />
        </branch>
        <iomarker fontsize="28" x="1648" y="720" name="CONFIG(31:0)" orien="R180" />
        <text x="1984" y="1464">20Mhz</text>
        <text x="1976" y="1368">66.6Mhz</text>
        <text x="1984" y="1272">100Mhz</text>
        <text x="1992" y="1180">25Mhz</text>
        <text x="1984" y="1080">125Mhz</text>
        <branch name="CLK_PWM">
            <wire x2="2848" y1="1568" y2="1568" x1="2816" />
        </branch>
        <instance x="2432" y="1728" name="XLXI_8" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2848" y="1568" name="CLK_PWM" orien="R0" />
        <branch name="XLXN_7">
            <wire x2="2256" y1="1440" y2="1440" x1="2080" />
            <wire x2="2256" y1="1440" y2="1632" x1="2256" />
            <wire x2="2432" y1="1632" y2="1632" x1="2256" />
        </branch>
        <branch name="CLK25">
            <wire x2="2336" y1="1152" y2="1152" x1="2080" />
            <wire x2="2336" y1="1152" y2="1568" x1="2336" />
            <wire x2="2432" y1="1568" y2="1568" x1="2336" />
            <wire x2="2336" y1="1024" y2="1152" x1="2336" />
            <wire x2="2768" y1="1024" y2="1024" x1="2336" />
        </branch>
        <branch name="CLK125">
            <wire x2="2240" y1="1056" y2="1056" x1="2080" />
            <wire x2="2240" y1="928" y2="1056" x1="2240" />
            <wire x2="2768" y1="928" y2="928" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1024" name="CLK25" orien="R0" />
        <iomarker fontsize="28" x="2768" y="928" name="CLK125" orien="R0" />
        <branch name="XLXN_12">
            <wire x2="2272" y1="848" y2="848" x1="2144" />
            <wire x2="2272" y1="848" y2="1696" x1="2272" />
            <wire x2="2432" y1="1696" y2="1696" x1="2272" />
        </branch>
    </sheet>
</drawing>