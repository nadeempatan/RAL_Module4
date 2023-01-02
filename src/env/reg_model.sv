

////////////
// The register block is placed in the top level
// // The registers are grouped together to form a register block 
//class//create reg block extended from uvm_reg_block
// create object of all the register	
//
//
//
// registration


//function new

//bulid all the register 
virtual function void build();

// create an instance for every register
//
//
//
//
//
// configure every register instance
//
//
//
//
//
// call build() function to build all regidter fields within each register
//
//
//
//
//
//create default map
//this.default_map=create_map(string name,uvm_reg_addr_t 	base_addr,int 	unsigned n_bytes, uvm_endianness_e endian,bit 	byte_addressing	 = 1)

//
//
//
//add all registers to default map 
//
//
//this.default_map.add_reg( uvm_reg rg,uvm_reg_addr_t offset,string rights="RW",	bit unmapped = 0,uvm_reg_frontdoor frontdoor =	null)

////////////

 

                  
                  
// Register definition for the register
                 // class // create reg class extended from uvm_reg class
//factory registration

	//declare all fields of register with uvm_reg_field
	//
	//
	//
// function new
 
                    
 // Build all register field objects
 //virtual function void build();
 //create and object instance for each reg field 
 //
 //
 //
 //
 //configure each field
 // configure(parent, size, lsb_pos, access, volatile,reset,has_reset,is_rand, individually accessible)
 //
 //
 //
 //
 //
 //endfunction
//endclass
class spi_reg_block extends uvm_reg_block;
	`uvm_object_utils(spi_reg_block)

	rand status status_reg;
	rand clkdiv clkdiv_reg;
	rand spicmd spicmd_reg;
	rand spiaddr spiaddr_reg;
	rand spilen spilen_reg;
	rand spidum spidum_reg;
	rand txfifo txfifo_reg;
	rand rxfifo rxfifo_reg;
	rand intcfg intcfg_reg;
	function new(string name = "spi_reg_block");
	       	super.new(name, UVM_NO_COVERAGE);
       	endfunction
	virtual function void build();
	//create an instance for every register
	status_reg = status::type_id::create("status_reg");
	clkdiv_reg = clkdiv::type_id::create("clkdiv_reg");
	spicmd_reg = spicmd::type_id::create("spicmd_reg");
	spiaddr_reg= spiaddr:type_id::create("spiaddr_reg");
	spilen_reg = spilen::type_id::create("spilen_reg");
	spidum_reg = spidum::type_id::create("spidum_reg");
	txfifo_reg = txfifo::type_id::create("txfifo_reg");
	rxfifo_reg = rxfifo::type_id::create("rxfifo_reg");
	intcfg_reg = intcfg::type_id::create("intcfg_reg");



	//configure every register instance
	
	status_reg.configure(this,null," ");
	clkdiv_reg.configure(this,null," ");
	spicmd_reg.configure(this,null," ");
	spiaddr_reg.configure(this,null," ");
	spilen_reg.configure(this,null," ");
	spidum_reg.configure(this,null," ");
	txfifo_reg.configure(this,null," ");
	rxfifo_reg.configure(this,null," ");
	intcfg_reg.configure(this,null," ");

	
	status_reg.build();
	clkdiv_reg.build();
	spicmd_reg.build();
	spiaddr_reg.build();
	spilen_reg.build();
	spidum_reg.build();
	txfifo_reg.build();
	rxfifo_reg.build();
	intcfg_reg.build();

	spi_map = create_map("", `h0, 4, UVM_LITTLE_ENDIAN, 1);
       	this.spi_map.add_reg(status_reg, `UVM_REG_ADDR_WIDTH'h0, "RW",0); 
	this.spi_map.add_reg(clkdiv_reg, `UVM_REG_ADDR_WIDTH'h4, "RW",0);
       	this.spi_map.add_reg(spicmd_reg, `UVM_REG_ADDR_WIDTH'h8, "RW",0);
       	this.spi_map.add_reg(spiaddr_reg, `UVM_REG_ADDR_WIDTH'hc, "RW",0);
       	this.spi_map.add_reg(spilen_reg, `UVM_REG_ADDR_WIDTH'h10, "RW",0);
       	this.spi_map.add_reg(spidum_reg, `UVM_REG_ADDR_WIDTH'h14, "RW",0);
       	this.spi_map.add_reg(txfifo_reg, `UVM_REG_ADDR_WIDTH'h18, "RW",0);
       	this.spi_map.add_reg(rxfifo_reg, `UVM_REG_ADDR_WIDTH'h20, "RW",0);
       	this.spi_map.add_reg(intcfg_reg, `UVM_REG_ADDR_WIDTH'h24, "RW",0);

	
endfunction
	class status extends uvm_reg;
	`uvm_object_utils(status)

	//Status reg
	 rand uvm_reg_field CS;
	 uvm_reg_field reserved;
	 rand uvm_reg_field srst;
	 rand uvm_reg_field qwr;
	 rand uvm_reg_field qrd;
	 rand uvm_reg_field wr;
	 rand uvm_reg_field rd;

	 function new(string name = "status");
		 super.new(name,32,UVM_NO_COVERAGE);
	endfunction

        //status reg
	virtual function void build();
	this.CS=uvm_reg_field::type_id::create("CS");
	this.reserved=uvm_reg_field::type_id::create("reserved");
	this.srst=uvm_reg_field::type_id::create("srst");
	this.qwr=uvm_reg_field::type_id::create("qwr");
	this.qrd=uvm_reg_field::type_id::create("qrd");
	this.wr=uvm_reg_field::type_id::create("wr");
	this.rd=uvm_reg_field::type_id::create("rd");

	//configure each field
	this.CS.configure(this,4,8,"W",0,4'b0000,0,1,1);
	this.reserved.configure(this,3,5,"W",0,3'b000,0,0,0);
	this.srst.configure(this,1,4,"W",0,1'b0,0,1,1);
	this.qwr.configure(this,1,3,"W",0,1'b0,0,1,1);
	this.qrd.configure(this,1,2,"W",0,1'b0,0,1,1);
	this.wr.configure(this,1,1,"W",0,1'b0,0,1,1);
	this.rd.configure(this,1,0,"W",0,1'b0,0,1,1);

endfunction
endclass


class clkdiv extends uvm_reg;
	`uvm_object_utils(clkdiv)

	//clkdiv reg
	 rand uvm_reg_field CLKDIV;

	 function new(string name = "clkdiv");
		 super.new(name,32,UVM_NO_COVERAGE);
	endfunction

        //clkdiv reg
	virtual function void build();
	this.CLKDIV=uvm_reg_field::type_id::create("CLKDIV");

	//configure each field
	this.CLKDIV.configure(this,7,0,"RW",0,7'b0000000,0,1,1);

endfunction
endclass

class spicmd extends uvm_reg;
	`uvm_object_utils(spicmd)

	//Spicmd reg
	 rand uvm_reg_field SPICMD;

	 function new(string name = "spicmd");
		 super.new(name,32,UVM_NO_COVERAGE);
	endfunction

        //status reg
	virtual function void build();
	this.SPICMD=uvm_reg_field::type_id::create("SPICMD");

	//configure each field
	this.SPICMD.configure(this,32,0,"RW",0,32'b00000000000000000000000000000000,0,1,1);

endfunction
endclass

class spiaddr extends uvm_reg;
	`uvm_object_utils(spiaddr)

	//Spiaddr reg
	 rand uvm_reg_field SPIADR;

	 function new(string name = "spiaddr");
		 super.new(name,32,UVM_NO_COVERAGE);
	endfunction

        //status reg
	virtual function void build();
	this.SPIADR=uvm_reg_field::type_id::create("SPIADR");

	//configure each field
	this.SPIADR.configure(this,32,0,"RW",0,32'b00000000000000000000000000000000,0,1,1);

endfunction
endclass


class spilen extends uvm_reg;
	`uvm_object_utils(spilen)

	//Spilen reg
	 rand uvm_reg_field cmdlen;
	 rand uvm_reg_field addrlen;
	 rand uvm_reg_field datalen;

	 function new(string name = "spilen");
		 super.new(name,32,UVM_NO_COVERAGE);
	endfunction

        //spilenreg reg
	virtual function void build();
	this.cmdlen=uvm_reg_field::type_id::create("cmdlen");
	this.addrlen=uvm_reg_field::type_id::create("addrlen");
	this.datalen=uvm_reg_field::type_id::create("datalen");

	//configure each field
	this.cmdlen.configure(this,6,0,"RW",0,6'b000000,0,1,1);
	this.addrlen.configure(this,6,8,"RW",0,6'b000000,0,1,1);
	this.datalen.configure(this,15,16,"RW",0,15'b000000000000000,0,1,1);

endfunction
endclass

class spidum extends uvm_reg;
	`uvm_object_utils(spidum)

	//Spidum reg
	 rand uvm_reg_field dummywr;
	  uvm_reg_field dummyrd;

	 function new(string name = "spidum");
		 super.new(name,32,UVM_NO_COVERAGE);
	endfunction

        //spidum reg
	virtual function void build();
	this.dummywr=uvm_reg_field::type_id::create("dummywr");
	this.dummyrd=uvm_reg_field::type_id::create("dummyrd");

	//configure each field
	this.dummywr.configure(this,16,16,"RW",0,16'b0000000000000000,0,1,1);
	this.addrlen.configure(this,16,0,"RW",0,16'b0000000000000000,0,0,1);

endfunction
endclass


class txfifo extends uvm_reg;
	`uvm_object_utils(txfifo)

	//txfifo reg
	 rand uvm_reg_field tx;

	 function new(string name = "txfifo");
		 super.new(name,32,UVM_NO_COVERAGE);
	endfunction

        //txfifo reg
	virtual function void build();
	this.tx=uvm_reg_field::type_id::create("tx");

	//configure each field
	this.tx.configure(this,32,0,"W",0,32'b00000000000000000000000000000000,0,1,1);

endfunction
endclass


class rxfifo extends uvm_reg;
	`uvm_object_utils(rxfifo)

	//rxfifo reg
	  uvm_reg_field rx;

	 function new(string name = "rxfifo");
		 super.new(name,32,UVM_NO_COVERAGE);
	endfunction

        //rxfifo reg
	virtual function void build();
	this.rx=uvm_reg_field::type_id::create("rx");

	//configure each field
	this.rx.configure(this,32,0,"R",0,32'b00000000000000000000000000000000,0,0,1);

endfunction
endclass


class intcfg extends uvm_reg;
	`uvm_object_utils(intcfg)

	//intcfg reg
	 rand uvm_reg_field en;
	 rand uvm_reg_field cnten;
	 rand uvm_reg_field cntrx;
	 rand uvm_reg_field cnttx;
	 rand uvm_reg_field rhtx;
	 rand uvm_reg_field thtx;

	 function new(string name = "intcfg");
		 super.new(name,32,UVM_NO_COVERAGE);
	endfunction

        //intcfg reg
	virtual function void build();
	this.en=uvm_reg_field::type_id::create("en");
	this.cnten=uvm_reg_field::type_id::create("cnten");
	this.cntrx=uvm_reg_field::type_id::create("cntrx");
	this.cnttx=uvm_reg_field::type_id::create("cnttx");
	this.rhtx=uvm_reg_field::type_id::create("rhrx");
	this.thtx=uvm_reg_field::type_id::create("thtx");

	//configure each field
	this.en.configure(this,1,31,"RW",0,1'b0,0,1,1);
	this.cnten.configure(this,1,30,"RW",0,1'b0,0,1,1);
	this.cntrx.configure(this,5,24,"RW",0,5'b00000,0,1,1);
	this.cnttx.configure(this,5,16,"RW",0,5'b00000,0,1,1);
	this.rhtx.configure(this,5,8,"RW",0,5'b00000,0,1,1);
	this.thtx.configure(this,5,0,"RW",0,5'b00000,0,1,1);

endfunction
endclass
endclass
			  
			  
			  
			  
			  
			  
	
			  
			  
			  
			  




