simSetSimulator "-vcssv" -exec "./simv" -args " " -uvmDebug on
debImport "-i" "-simflow" "-dbdir" "./simv.daidir"
srcTBInvokeSim
verdiSetActWin -dock widgetDock_<Member>
verdiWindowResize -win $_Verdi_1 "318" "82" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "0" "23" "1536" "793"
wvCreateWindow
srcHBSelect "top.mem_bus" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -word -line 6 -pos 2 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcAddBlockSignalToWaveform -win $_nTrace1 -line 6 -nOffset 0 -range All
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_2
verdiSetActWin -win $_InteractiveConsole_2
srcDeselectAll -win $_nTrace1
srcSelect -word -line 15 -pos 3 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
verdiSetActWin -win $_nWave3
srcDeselectAll -win $_nTrace1
srcSelect -word -line 15 -pos 3 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 15 -pos 3 -win $_nTrace1
srcAction -pos 15 3 3 -win $_nTrace1 -name "mem_bus" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcHBSelect "top.mem_bus" -win $_nTrace1
srcSetScope "top.mem_bus" -delim "." -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "top.mem_bus" -win $_nTrace1
srcHBSelect "top.mem_bus" -win $_nTrace1
srcHBSelect "top.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "top.mem_bus" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "top.mem_bus" -win $_nTrace1
srcHBSelect "top.mem_bus" -win $_nTrace1
srcHBSelect "top.mem_bus" -win $_nTrace1
srcSetScope "top.mem_bus" -delim "." -win $_nTrace1
srcHBSelect "top.mem_bus" -win $_nTrace1
verdiSetActWin -win $_nWave3
srcHBSelect "top.mem_bus" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "top.mem_bus" -win $_nTrace1
srcHBSelect "top.dut" -win $_nTrace1
srcHBSelect "top.mem_bus" -win $_nTrace1
srcHBSelect "top.mem_bus" -win $_nTrace1
srcHBSelect "top.mem_bus" -win $_nTrace1
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave3
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_2
verdiSetActWin -win $_InteractiveConsole_2
run 
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
verdiSetActWin -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectStuckSignals -win $_nWave3
wvSelectStuckSignals -win $_nWave3
wvScrollDown -win $_nWave3 0
sidSaveDesignSnapshot \
/home/st62/HW4/_SNAPSHOT/_hardcopy.snapshot \
-keynote \
{invoke directory: /home/st62/HW4
command line: -elab ./simv.daidir/kdb.elab++ -verdi
current trace scope: top.tb
memo:}
debExit
