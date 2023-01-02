
// Register environment class puts together the model,adapter and predictor
//class create ral_env  extended from uvm_env
 `uvm_component_utils (reg_env)
 //function new


 //register model handle
 //adapter 
 //predictor handle
 
 //buildphase

 //create instance for model adapter and predictor
 //
 //
 
 //build model
 //
 
 //lock model
 //
 /


  //connect phase

//connect predictor to map
//

//connect predictor to adapter
//

// connect predictor to mointor analysis port


//endclass
/////////


class reg_env extends uvm_env;
	`uvm_component_utils(reg_env)

	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction
	spi_reg_block m_ral_model;
	reg2apb_adapter m_reg2apb;
	uvm_reg_predictor #(bus_pkt) m_apb2reg_predictor;

	virtual function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	m_ral_model = spi_reg_block::type_id::create("m_ral_model",this);
	m_reg2apb=reg2apb_adapter::type_id::create("m_reg2apb",this);
	m_apb2reg_predictor=uvm_reg_predictor #(bus_pkt)::type_id::create("m_apb2reg_predictor",this);
	m_ral_model.build();
	m_ral_model.lock_model();
	 uvm_config_db #(spi_reg_block)::set(null,"uvm_test_top","m_ral_model",m_ral_model);
 endfunction

 virtual function void connect_phase(uvm_phase phase);
 super.connect_phase(phase);
 m_apb2reg_predictor.map=m_ral_model.default_map;
 m_apb2reg_predictor.adapter=m_reg2apb;
 endfunction
 endclass

