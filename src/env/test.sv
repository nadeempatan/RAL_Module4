
//class //create testclass  extended from uvm_test
 // factroy registration 
 

//env handle 
//
//
//

//function new


//build phase
// Build the testbench environment 


 //run phase
 //start seq
//endclass
class test extends uvm_test;
`uvm_component_utils(test)

apb_env env;
apb_sequence seq;

function new (string name,uvm_component parent);
super.new(name,parent);
endfunction 

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
env = apb_env::type_id::create("env", this);
wr_seq = apb_seq::type_id::create("seq");
endfunction

virtual function void end_of_elaboration();
print();
endfunction

task run_phase(uvm_phase phase);
begin
phase.raise_objection(this);
seq.start(env.agent.sequencer);
#50;
phase.drop_objection(this);
end
endtask 

endclass 
