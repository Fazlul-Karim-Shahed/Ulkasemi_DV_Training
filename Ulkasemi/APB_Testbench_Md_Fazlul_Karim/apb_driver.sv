

class apb_driver;

	apb_packet packet1;
	virtual apb_interface inf;
	
	function new(virtual apb_interface inf);
		//$display("%0t APB Driver constructed", $time);
		this.inf = inf;
		packet1 = new();
	endfunction
	
	task apb_reset();
		//$display("%0t Reset Task compiled", $time);
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
	
	task apb_write(input bit [7:0] addr,input bit [31:0] data);
		//$display("%0t Write Task compiled", $time);
		
		
		inf.PSEL <= 1;
		inf.PWRITE <= 1;
		inf.PENABLE <= 0;
		inf.PADDR <= addr;
		inf.PWDATA <= data;
		@(negedge inf.PCLK);
		
		inf.PENABLE <= 1;
		@(negedge inf.PCLK);
		
		inf.PENABLE <= 0;
		inf.PSEL <= 0;
		
	endtask
	
	task apb_read(input bit [7:0] addr);
		//$display("%0t Read Task compiled", $time);
		
		
		inf.PSEL <= 1;
		inf.PWRITE <= 0;
		inf.PENABLE <= 0;
		inf.PADDR <= addr;
	
		@(negedge inf.PCLK);
		
		inf.PENABLE <= 1;
		@(negedge inf.PCLK);
		
		inf.PENABLE <= 0;
		inf.PSEL <= 0;
		
	endtask


endclass