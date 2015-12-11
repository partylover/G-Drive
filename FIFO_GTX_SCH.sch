<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="WR_CLK" />
        <signal name="WR_EN" />
        <signal name="WR_FULL" />
        <signal name="RD_CLK" />
        <signal name="RD_EN" />
        <signal name="RD_EMPTY" />
        <signal name="DIN(8:0)" />
        <signal name="DOUT(8:0)" />
        <signal name="RD_COUNT(10:0)" />
        <signal name="RESET" />
        <port polarity="Input" name="WR_CLK" />
        <port polarity="Input" name="WR_EN" />
        <port polarity="Output" name="WR_FULL" />
        <port polarity="Input" name="RD_CLK" />
        <port polarity="Input" name="RD_EN" />
        <port polarity="Output" name="RD_EMPTY" />
        <port polarity="Input" name="DIN(8:0)" />
        <port polarity="Output" name="DOUT(8:0)" />
        <port polarity="Output" name="RD_COUNT(10:0)" />
        <port polarity="Input" name="RESET" />
        <blockdef name="FIFO_GTX">
            <timestamp>2013-9-5T7:51:56</timestamp>
            <rect width="768" x="32" y="32" height="3648" />
            <line x2="32" y1="112" y2="112" x1="0" />
            <line x2="32" y1="208" y2="208" x1="0" />
            <line x2="32" y1="240" y2="240" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="32" y1="464" y2="464" x1="0" />
            <line x2="800" y1="240" y2="240" x1="832" />
            <line x2="800" y1="272" y2="272" style="linewidth:W" x1="832" />
            <line x2="800" y1="304" y2="304" x1="832" />
            <line x2="800" y1="496" y2="496" x1="832" />
            <line x2="800" y1="656" y2="656" style="linewidth:W" x1="832" />
        </blockdef>
        <block symbolname="FIFO_GTX" name="XLXI_1">
            <blockpin signalname="RESET" name="rst" />
            <blockpin signalname="WR_CLK" name="wr_clk" />
            <blockpin signalname="DIN(8:0)" name="din(8:0)" />
            <blockpin signalname="WR_EN" name="wr_en" />
            <blockpin signalname="WR_FULL" name="full" />
            <blockpin signalname="RD_CLK" name="rd_clk" />
            <blockpin signalname="DOUT(8:0)" name="dout(8:0)" />
            <blockpin signalname="RD_EN" name="rd_en" />
            <blockpin signalname="RD_EMPTY" name="empty" />
            <blockpin signalname="RD_COUNT(10:0)" name="rd_data_count(10:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="3344" y="752" name="XLXI_1" orien="R0">
        </instance>
        <branch name="WR_CLK">
            <wire x2="3344" y1="960" y2="960" x1="3312" />
        </branch>
        <iomarker fontsize="28" x="3312" y="960" name="WR_CLK" orien="R180" />
        <branch name="WR_EN">
            <wire x2="3344" y1="1024" y2="1024" x1="3312" />
        </branch>
        <iomarker fontsize="28" x="3312" y="1024" name="WR_EN" orien="R180" />
        <branch name="WR_FULL">
            <wire x2="3344" y1="1216" y2="1216" x1="3312" />
        </branch>
        <iomarker fontsize="28" x="3312" y="1216" name="WR_FULL" orien="R180" />
        <branch name="RD_CLK">
            <wire x2="4208" y1="992" y2="992" x1="4176" />
        </branch>
        <iomarker fontsize="28" x="4208" y="992" name="RD_CLK" orien="R0" />
        <branch name="RD_EN">
            <wire x2="4208" y1="1056" y2="1056" x1="4176" />
        </branch>
        <iomarker fontsize="28" x="4208" y="1056" name="RD_EN" orien="R0" />
        <branch name="RD_EMPTY">
            <wire x2="4208" y1="1248" y2="1248" x1="4176" />
        </branch>
        <iomarker fontsize="28" x="4208" y="1248" name="RD_EMPTY" orien="R0" />
        <branch name="DIN(8:0)">
            <wire x2="3344" y1="992" y2="992" x1="3312" />
        </branch>
        <iomarker fontsize="28" x="3312" y="992" name="DIN(8:0)" orien="R180" />
        <branch name="DOUT(8:0)">
            <wire x2="4208" y1="1024" y2="1024" x1="4176" />
        </branch>
        <iomarker fontsize="28" x="4208" y="1024" name="DOUT(8:0)" orien="R0" />
        <branch name="RD_COUNT(10:0)">
            <wire x2="4208" y1="1408" y2="1408" x1="4176" />
        </branch>
        <iomarker fontsize="28" x="4208" y="1408" name="RD_COUNT(10:0)" orien="R0" />
        <branch name="RESET">
            <wire x2="3344" y1="864" y2="864" x1="3312" />
        </branch>
        <iomarker fontsize="28" x="3312" y="864" name="RESET" orien="R180" />
    </sheet>
</drawing>