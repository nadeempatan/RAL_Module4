

////////////
// The register block is placed in the top level
// // The registers are grouped together to form a register block 
class create reg block extended from uvm_reg_block
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
this.default_map=create_map(string name,uvm_reg_addr_t 	base_addr,int 	unsigned n_bytes, uvm_endianness_e endian,bit 	byte_addressing	 = 1)

//
//
//
//add all registers to default map 
//
//
this.default_map.add_reg( uvm_reg rg,uvm_reg_addr_t offset,string rights="RW",	bit unmapped = 0,uvm_reg_frontdoor frontdoor =	null)

////////////

 

                  
                  
// Register definition for the register
                  class // create reg class extended from uvm_reg class
//factory registration

	//declare all fields of register with uvm_reg_field
	//
	//
	//
// function new
 
                    
 // Build all register field objects
 virtual function void build();
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
 endfunction
endclass




