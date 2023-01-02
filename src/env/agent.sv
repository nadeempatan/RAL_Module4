// The agent puts together the driver, sequencer and monitor 
class //create agent class extended from uvm_agent;
 // registration 
 //
 
// handle of driver sequencer and monitor

 //function new
 //

 //build phase


 // create an instance for driver ,sequencer and moitor

 //connect phase
endclass

class apb_agent extends uvm_agent;
`uvm_component_utils(apb_agent)


apb_sequencer sequencer;
apb_driver driver;
apb_monitor monitor;

function new (string name, uvm_component parent);
super.new(name, parent);
endfunction 

function void build_phase(uvm_phase phase);
super.build_phase(phase);
sequencer=apb_sequencer::type_id::create("sequencer",this);
driver=apb_driver::type_id::create("driver",this);
monitor=apb_monitor::type_id::create("monitor",this);
endfunction


function void connect_phase(uvm_phase phase);
driver.seq_item_port.connect(sequencer.seq_item_export);
endfunction 

endclass 
