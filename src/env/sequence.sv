class apb_sequence extends uvm_sequence;
`uvm_object_utils(apb_sequence)

transaction tx;
function new (string name);
super.new(name);
endfunction 
tx = transaction::type_id::create("tx");

virtual task body();
tx = transaction::type_id::create("tx");
wait_for_grant();
tx.randomize();
send_request(tx);
wait_for_item_done(); 
endtask

endclass
