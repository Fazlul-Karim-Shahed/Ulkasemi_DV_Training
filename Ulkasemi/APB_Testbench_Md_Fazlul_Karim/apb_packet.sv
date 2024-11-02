

class apb_packet;
	
	logic [31:0] adata;
	logic [31:0] addr;
	logic [31:0] edata;
	
	function new();
		//$display("%0t APB Packet constructed", $time);
	endfunction


endclass