// Declare a sequence_item for the APB transaction
//class cretae bus_pkt class extended from uvm_sequence_item


//function new	
//endclass
/////////////////////

class transaction extends uvm_sequence_item;

rand bit [31:0] paddr;
rand bit pselx; 
 bit penable=1; 
rand bit pwrite;
rand bit [31:0] pwdata;
bit pready;
bit [31:0] prdata;
bit pslverr;

`uvm_object_utils_begin(transaction)
`uvm_field_int(paddr,UVM_ALL_ON)
`uvm_field_int(pselx,UVM_ALL_ON)
`uvm_field_int(penable,UVM_ALL_ON)
`uvm_field_int(pwrite,UVM_ALL_ON)
`uvm_field_int(pwdata,UVM_ALL_ON)
`uvm_field_int(pready,UVM_ALL_ON)
`uvm_field_int(prdata,UVM_ALL_ON)
`uvm_field_int(pslverr,UVM_ALL_ON)
`uvm_object_utils_end

function new(string name="transaction");
super.new(name);
endfunction 

endclass
