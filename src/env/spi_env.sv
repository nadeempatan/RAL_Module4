class spi_env extends uvm_env;
`uvm_component_utils(apb_env)

//instance
spi_agent agent;
reg_env m_reg_env;

//constructor
function new (string name, uvm_component parent);
super.new(name, parent);
endfunction 

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
agent=apb_agent::type_id::create("agent",this);
m_reg_env=reg_env::type_id::create("m_reg_env",this);
uvm_reg::include_coverage(".", UVM_CVR_ALL);
endfunction


function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	m_reg_env.agent=agent;
	agent.monitor.connect(m_reg_env.m_apb2reg_predictor.bus.in);
	m_reg_env.m_ral_model.default_map.set_sequencer(agent.seqr.m_reg_env.m_reg2apb);
endfunction 
endclass 
