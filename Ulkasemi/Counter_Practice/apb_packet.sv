

class apb_packet;
	
	logic resetn;
	logic clk;
	logic enable;
	logic load;
	logic [3:0] data_in;
	logic count;
	logic [3:0] a_out;
	logic c_out;
	
	
	function new();
		//$display("%0t APB Packet constructed", $time);
	endfunction


endclass