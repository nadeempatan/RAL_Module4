class reg2apb_adapter extends uvm_reg_adapter;
`uvm_object_utils(reg2apb_adapter)

 function new(string name = "reg2apb_adapter");
	 super.new(name);
 endfunction

 //write virtual function to convert reg to bus 
  virtual function uvm_sequence_item reg2bus (const ref uvm_reg_bus_op rw); 
     transaction tx=trancation::type_id::create("tx"); 
     tx.pwrite=(rw.kind==UVM_WRITE)?apb_rw::READ:apb_rw::WRITE;
     tx.pwdata=rw.pwdata;
     tx.paddr=rw.paddr;
     tx.psel=rw.psel;
     tx.penable=rw.penable;
     tx.prdata=rw.prdata;
     tx.pready=rw.pready;
     tx.pslverr=rw.pslaverr;
     return tx;
    


//write virtual function to convert bus to reg
  virtual function void bus2reg (uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);

  transaction tx;
  if(!$cast(tx,bus_item)begin
	  `uvm_fatal("provided bus_item is not of the correct type");
	  return
	   end
	   rw.kind=(tx.pwrite==0)? UVM_READ:UVM_WRITE;
	   rw.pwdata=tx.pwdata;
   	   rw.paddr=tx.paddr;
	   rw.psel=tx.psel;
	   rw.penable=tx.penable;
	   rw.prdata=tx.prdata;
	   rw.pready=tx.pready;
	   rw.pslverr=tx.pslaverr;
	   rw.status=UVM_IS_OK;
  endfunction
endclass
