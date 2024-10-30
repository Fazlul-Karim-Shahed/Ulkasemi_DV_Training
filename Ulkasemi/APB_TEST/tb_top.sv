`timescale 1ns/1ps

module tb_top;
	
	bit pclk;
	
	apb_interface inf1(pclk);
	apb_base_test test1;
	
	
	initial forever #5 pclk = ~pclk;
	
	
	initial begin
		test1 = new(inf1);
		test1.run_test();
		#1 ;
		
		$finish(1);
	end

endmodule