
//interface bus_if (input pclk, input presetn);
	//declare interface signals
  
//endinterface

interface apb_intf(input logic pclk,presetn);

logic [31:0] paddr;
logic pselx;
logic penable;
logic pwrite;
logic [31:0] pwdata;
logic pready;
logic [31:0] prdata;
logic pslverr;

clocking driver_cb @(posedge pclk);
default input #10 output #0;
output paddr;
output pselx;
output penable;
output pwrite;
output pwdata;
input  pready;
input  prdata;
input  pslverr;
endclocking 

clocking monitor_cb @(posedge pclk);
default input #10 output #0;
input  paddr;
input  pselx;
input  penable;
input  pwrite;
input  pwdata;
input  pready;
input  prdata;
input  pslverr;
endclocking 

modport driver_mp (output paddr, output pselx, output penable, output pwrite, output pwdata, input  pready, input  prdata, input  pslave_error, input pclk,presetn);
modport monitor_mp(input  paddr, input  pselx, input  penable, input  pwrite, input  pwdata, input  pready, input  prdata, input  pslave_error, input pclk,presetn); 

endinterface
