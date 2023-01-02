// Drives a given apb transaction packet to the APB interface
//class create driver clas extended from uvm driver
 // factory registration
 

 //tarnsaction and virtual interface handle
 //
 //
 
 //function new
 //
 //
 //
 //
 
 //build pahse
 //
 //
 //
 //
 
 //run pahse
   //virtual task run_phase (uvm_phase phase);



 //endtask
//endclass

class apb_driver extends uvm_driver#(transaction);
`uvm_component_utils(apb_driver)

virtual apb_intf intf;
transaction tx;

function new (string name, uvm_component parent);
super.new(name, parent);
endfunction 

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual apb_intf)::get(this,"", "vif", intf))
`uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".intf"});
endfunction: build_phase

virtual task driver_logic();
 @(posedge intf.driver_mp.pclk) begin
intf.driver_cb.pselx       <=tx.pselx;
intf.driver_cb.paddr       <=tx.paddr;
intf.driver_cb.penable     <=tx.penable;
intf.driver_cb.pwrite      <=tx.pwrite;
tx.pready		   <=intf.driver_cb.pready ;
tx.pslverr	   <=intf.driver_cb.pslverr;
if(tx.pwrite==1) begin
intf.driver_cb.pwdata      <=tx.pwdata;
end
if(tx.pwrite==0) begin
tx.prdata		   <=intf.driver_cb.prdata ;
end
end
endtask

virtual task run_phase(uvm_phase phase);
forever begin
seq_item_port.get_next_item(tx);
driver_logic();
seq_item_port.item_done();
end
endtask


endclass

