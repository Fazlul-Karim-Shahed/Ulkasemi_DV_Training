

class apb_monitor;
	
	mailbox mb_act;
	apb_packet packet_act;
	virtual apb_interface inf;
	
	
	function new(virtual apb_interface inf, mailbox mb_act);
		//$display("%0t :: APB Monitor", $time);
		this.inf = inf;
		this.mb_act = mb_act;
	endfunction
	
	task capture();
		
		forever begin
		
			@(negedge inf.clk);
			
			if(inf.resetn === 1'b1) begin
			
				packet_act = new();
				
				packet_act.a_out = inf.a_out;
				packet_act.c_out = inf.c_out;
				packet_act.load = inf.load;
				packet_act.enable = inf.enable;
				packet_act.count = inf.count;
				packet_act.data_in = inf.data_in;
				packet_act.clk = inf.clk;
				packet_act.resetn = inf.resetn;
				
				mb_act.put(packet_act);				
				
				//$display("%0t :: Monitor:: data_in: %0d, A_OUT: %0d, C_OUT: %0d", $time, packet_act.data_in, packet_act.a_out, packet_act.c_out );
			end
			
			
		
		end
	
	endtask

endclass