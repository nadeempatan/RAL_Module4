//`include "uvm_macros.svh"
//import uvm_pkg::*;

`include "interface.sv"
`include "testbench_pkg.svh"

//module tb_top;
 //clock and reset genration 
  
   

 
 // interface and dut instatansiation
  
 // initial begin
    // set interface in config_db
    //
       // Dump waves
  
 // end
 //// initial begin
    run_test("test_name");
    //#100;
    //$finish;
 // end
//endmodule

module tb;
bit pclk;
bit presetn;
always #10 pclk=~pclk;

initial begin
presetn=0;
#5 presetn=1;
end

apb_intf intf(pclk,presetn);

apb_slave dut(
.pclk(intf.pclk),
.presetn(intf.presetn),
.paddr(intf.paddr),
.pwdata(intf.pwdata),
.prdata(intf.prdata),
.pwrite(intf.pwrite),
.pselx(intf.pselx),
.penable(intf.penable),
.pready(intf.pready),
.pslverr(intf.pslverr)
);

initial begin
     uvm_config_db#(virtual apb_intf)::set(uvm_root::get(),"*","vif",intf);
end

initial begin
	run_test("test");
end

endmodule

