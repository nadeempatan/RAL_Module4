////////
///////////////////////////////////////
class //create  reg2apb_adapter class extended from uvm_reg_adapter;
//registration with factory	

 //function new


 //write virtual function to convert reg to bus 
  virtual function uvm_sequence_item reg2bus (const ref uvm_reg_bus_op rw); 
 

 endfunction


//write virtual function to convert bus to reg
  virtual function void bus2reg (uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);


  endfunction
endclass
///////////////
