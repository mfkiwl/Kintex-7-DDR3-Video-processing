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
set_param tcl.collectionResultDisplayLimit 0
set_param xicom.use_bs_reader 1
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7k325tffg676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir H:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.cache/wt [current_project]
set_property parent.project_path H:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
read_ip -quiet h:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.srcs/sources_1/ip/ADV7611_LLC/ADV7611_LLC.xci
set_property used_in_implementation false [get_files -all h:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.srcs/sources_1/ip/ADV7611_LLC/ADV7611_LLC_board.xdc]
set_property used_in_implementation false [get_files -all h:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.srcs/sources_1/ip/ADV7611_LLC/ADV7611_LLC.xdc]
set_property used_in_implementation false [get_files -all h:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.srcs/sources_1/ip/ADV7611_LLC/ADV7611_LLC_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top ADV7611_LLC -part xc7k325tffg676-1 -mode out_of_context

rename_ref -prefix_all ADV7611_LLC_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef ADV7611_LLC.dcp
create_report "ADV7611_LLC_synth_1_synth_report_utilization_0" "report_utilization -file ADV7611_LLC_utilization_synth.rpt -pb ADV7611_LLC_utilization_synth.pb"

if { [catch {
  file copy -force H:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.runs/ADV7611_LLC_synth_1/ADV7611_LLC.dcp h:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.srcs/sources_1/ip/ADV7611_LLC/ADV7611_LLC.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub h:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.srcs/sources_1/ip/ADV7611_LLC/ADV7611_LLC_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub h:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.srcs/sources_1/ip/ADV7611_LLC/ADV7611_LLC_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim h:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.srcs/sources_1/ip/ADV7611_LLC/ADV7611_LLC_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim h:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.srcs/sources_1/ip/ADV7611_LLC/ADV7611_LLC_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir H:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.ip_user_files/ip/ADV7611_LLC]} {
  catch { 
    file copy -force h:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.srcs/sources_1/ip/ADV7611_LLC/ADV7611_LLC_stub.v H:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.ip_user_files/ip/ADV7611_LLC
  }
}

if {[file isdir H:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.ip_user_files/ip/ADV7611_LLC]} {
  catch { 
    file copy -force h:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.srcs/sources_1/ip/ADV7611_LLC/ADV7611_LLC_stub.vhdl H:/Desktop/Video_new_PCB/PCB_test_project/PCB_test_DDR3_ok1/PCB_test/PCB_test.ip_user_files/ip/ADV7611_LLC
  }
}
