
class apb_monitor;

	apb_packet packet_exp;
	apb_packet packet_act;
	virtual apb_interface inf;
	mailbox mb_act;
	mailbox mb_exp;
	
	function new(virtual apb_interface inf, mailbox mb_exp, mailbox mb_act);
		//$display("%0t APB Monitor constructed", $time);
		this.inf = inf;
		this.mb_act = mb_act;
		this.mb_exp = mb_exp;
	endfunction
	
	task apb_capture();
		forever begin
			@(posedge inf.PCLK);
			
			if(inf.PSEL && inf.PENABLE) begin
				if(inf.PWRITE )begin
					packet_exp = new();
					packet_exp.addr = inf.PADDR;
					packet_exp.edata = inf.PWDATA;
					mb_exp.put(packet_exp);
					//$display("%0t Expected Address::: %0d, Data: %0d", $time, packet_exp.addr, packet_exp.edata);
					
				end
				else begin
					@(negedge inf.PCLK);
					packet_act = new();
					packet_act.addr = inf.PADDR;
					packet_act.adata = inf.PRDATA;
					mb_act.put(packet_act);
					//$display("%0t Actual Address::: %0d, Data: %0d", $time, packet_exp.addr, packet_act.adata);
				end
			end
			
		end
	endtask

endclass