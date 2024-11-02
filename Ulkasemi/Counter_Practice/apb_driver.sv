
class apb_driver;

	virtual apb_interface inf;
	
	function new(virtual apb_interface inf);
		//$display("%0t :: APB Driver", $time);
		this.inf = inf;
	endfunction
	
	task apb_reset();
	
		inf.resetn <= 0;
		inf.enable <= 0;
		inf.load <= 0;
		inf.count <= 0;
		
		@(negedge inf.clk);
		inf.resetn <= 1;
		
		@(negedge inf.clk);
	
	endtask
	
	
	
	task apb_count(input int data, input int x, input bit enable, input bit load, input bit count);
		
		inf.enable <= enable;
		inf.load <= load;
		inf.data_in <= data;
		
		if(load === 1) begin
			@(negedge inf.clk);
			inf.load <= 0;
		end
		
		inf.count <= count;
		
		repeat(x) @(negedge inf.clk);
		
	
	endtask
	

endclass