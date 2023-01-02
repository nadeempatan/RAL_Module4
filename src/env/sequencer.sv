//class //create sequencer class seqcr extended from uvm sequencer
// factory registration
//
//
//

//function new
  
 

//build phase
//endclass

class apb_sequencer extends uvm_sequencer#(transaction);
`uvm_component_utils(apb_sequencer)
function new (string name, uvm_component parent);
super.new(name, parent);
endfunction  
endclass 
