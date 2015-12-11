
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name GD_N_C_RP -dir "D:/FPGA_project/NEWVERSION/GD_N_C_RP/planAhead_run_1" -part xc6slx16ftg256-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "GD_N_GIGABIT_8P.ucf" [current_fileset -constrset]
add_files [list {ipcore_dir/frame_buff_mem.ngc}]
add_files [list {ipcore_dir/FIFO_GTX.ngc}]
add_files [list {ipcore_dir/core_gamma_table.ngc}]
set hdlfile [add_files [list {ipcore_dir/clk_man.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files [list {ipcore_dir/core_wb_ram.ngc}]
set hdlfile [add_files [list {ipcore_dir/FIFO_GTX.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/core_gamma_table.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {TEST_MODE.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {RGB_GAMMA_SCH.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/frame_buff_mem.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/core_wb_ram.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {i2c_master.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {g_drive_controller_shift_register.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {FIFO_GTX_SCH.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ETH_TX.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ETH_SELECT_LOOP.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ETH_RX_BP.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ETH_RX.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ee_prom_control.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Driver_shift_register.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {TEMP_1820_.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {MAIN_CONTROLLER.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {GD_Drive.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ETH_Drive.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {CLKMAIN125.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {GD_N_C_RP.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top GD_N_C_RP $srcset
add_files [list {GD_N_GIGABIT_8P.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/core_gamma_table.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/core_wb_ram.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/FIFO_GTX.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/frame_buff_mem.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/gamma_tab2.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/gamma_table.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/RGB_GAMMA_TABLE.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/WB_RAMD.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16ftg256-3
