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
endclass
	
	


