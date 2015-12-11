
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name GD_N_C_RP -dir "D:/FPGA_Project/G_Drive_Ch/GD_N_C_RP_V1q/planAhead_run_1" -part xc6slx16ftg256-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/FPGA_Project/G_Drive_Ch/GD_N_C_RP_V1q/GD_N_C_RP.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/FPGA_Project/G_Drive_Ch/GD_N_C_RP_V1q} {ipcore_dir} }
add_files [list {ipcore_dir/core_gamma_table.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/core_wb_ram.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/FIFO_GTX.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/frame_buff_mem.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/gamma_tab2.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/gamma_table.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/RGB_GAMMA_TABLE.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/WB_RAMD.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "GD_N_GIGABIT_8P_C.ucf" [current_fileset -constrset]
add_files [list {GD_N_GIGABIT_8P_C.ucf}] -fileset [get_property constrset [current_run]]
link_design
