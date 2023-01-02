
// Monitors the APB interface for any activity and reports out
// through an analysis port
//class create monitor clas extended from uvm_monitor
//factroy registration
//

//declare analysis port and virtual interface

//function new
//
//
//
//

//run phase
 // virtual task run_phase (uvm_phase phase);





 // endtask
//endclass

class apb_monitor extends uvm_monitor;
`uvm_component_utils(apb_monitor)

uvm_analysis_port #(transaction) monitor_port;
transaction tx;
virtual apb_intf intf;

function new (string name, uvm_component parent);
super.new(name, parent);
monitor_port=new("monitor_port",this);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     tx=transaction::type_id::create("tx");
     if(!uvm_config_db#(virtual apb_intf)::get(this, "", "vif", intf))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".intf2"});
  endfunction

virtual task run_phase(uvm_phase phase);
forever begin
 @(posedge intf.monitor_mp.pclk)
 begin
 tx.paddr		=intf.monitor_cb.paddr;
 tx.pselx		=intf.monitor_cb.pselx;
 tx.penable		=intf.monitor_cb.penable;
 tx.pwrite		=intf.monitor_cb.pwrite;
 tx.pwdata		=intf.monitor_cb.pwdata;
 tx.prdata		=intf.monitor_cb.prdata;
 tx.pready		=intf.monitor_cb.pready;
 tx.pslave_error	=intf.monitor_cb.pslave_error;
end
end
endtask
endclass 
