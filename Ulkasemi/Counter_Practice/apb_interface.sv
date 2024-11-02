
interface apb_interface(input bit clk);
	
	logic resetn;
	logic enable;
	logic load;
	logic [3:0] data_in;
	logic count;
	logic [3:0] a_out;
	logic c_out;
	
	
endinterface