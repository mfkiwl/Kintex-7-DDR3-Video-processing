# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7k325tffg676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.cache/wt [current_project]
set_property parent.project_path H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
read_verilog -library xil_defaultlib {
  H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/new/ADV7511_CLK.v
  H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/new/ADV7511_CONFIG.v
  H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/new/ADV7511_I2C.v
  H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/new/ADV7511_INTERFACE.v
  H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/new/ADV7611_CLK.v
  H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/new/ADV7611_CONFIG.v
  H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/new/ADV7611_I2C.v
  H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/new/ADV7611_INTERFACE.v
  H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/new/DDR3_interface.v
  H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/new/DDR3_state_machine_v2.v
  H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/new/PCB_test.v
}
read_ip -quiet H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/ip/mig_7series_0/mig_7series_0.xci
set_property used_in_implementation false [get_files -all h:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/ip/mig_7series_0/mig_7series_0/user_design/constraints/mig_7series_0.xdc]
set_property used_in_implementation false [get_files -all h:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/ip/mig_7series_0/mig_7series_0/user_design/constraints/mig_7series_0_ooc.xdc]

read_ip -quiet H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/ip/Video_in_ram/Video_in_ram.xci
set_property used_in_implementation false [get_files -all h:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/ip/Video_in_ram/Video_in_ram_ooc.xdc]

read_ip -quiet H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/ip/Video_out_ram/Video_out_ram.xci
set_property used_in_implementation false [get_files -all h:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/sources_1/ip/Video_out_ram/Video_out_ram_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/constrs_1/new/PCB_test.xdc
set_property used_in_implementation false [get_files H:/Desktop/PCB_test_30fps_3_no_noise_copy/PCB_test.srcs/constrs_1/new/PCB_test.xdc]


synth_design -top PCB_test -part xc7k325tffg676-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef PCB_test.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file PCB_test_utilization_synth.rpt -pb PCB_test_utilization_synth.pb"
