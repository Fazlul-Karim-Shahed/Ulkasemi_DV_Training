

class apb_driver;

	apb_packet packet1;
	virtual apb_interface inf;
	
	function new(virtual apb_interface inf);
		$display("%0t APB Driver constructed", $time);
		this.inf = inf;
		packet1 = new();
	endfunction
	
	task apb_reset();
		$display("%0t Task compiled", $time);
		inf.PRESETn <= 0;
		inf.PADDR <= 0;
		inf.PSEL <= 0;
		inf.PENABLE <= 0;
		inf.PWRITE <= 0;
		inf.PWDATA <= 0;
		
		@(negedge inf.PCLK);
		inf.PRESETn <= 1;
		
		@(negedge inf.PCLK);
	endtask


endclass