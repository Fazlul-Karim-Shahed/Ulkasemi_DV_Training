`timescale 1ns/1ps

module tb_top;
	
	bit pclk;
	
	apb_interface inf1(pclk);
	
	apb_base_test test1;
	
	apb_slave DUT(
	.pclk(inf1.PCLK),
	.rst_n(inf1.PRESETn),
	.paddr(inf1.PADDR),
	.pwrite(inf1.PWRITE),
	.psel(inf1.PSEL),
	.penable(inf1.PENABLE),
	.pwdata(inf1.PWDATA),
	.prdata(inf1.PRDATA),
	.pready(inf1.PREADY)
	);
	
	
	initial forever #5 pclk = ~pclk;
	
	
	initial begin
		test1 = new(inf1);
		test1.run_test();
		
		
		#10 ;
		
		test1.env.scoreboard.report_generate();

		
		
		$finish(1);
	end

endmodule