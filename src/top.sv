//`include "uvm_macros.svh"
//import uvm_pkg::*;

`include "interface.sv"
`include "testbench_pkg.svh"

module tb_top;
 //clock and reset genration 
  
   

 
 // interface and dut instatansiation
  
  initial begin
    // set interface in config_db
    //
       // Dump waves
  
  end
  initial begin
    run_test("test_name");
    //#100;
    //$finish;
  end
endmodule
