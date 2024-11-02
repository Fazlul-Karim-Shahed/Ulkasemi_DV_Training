
`timescale 1ns/1ps

module tb_top;

	bit clk;
	

	apb_base_test apb_test;
	apb_interface inf(clk);
	
	Binary_Counter counter(
		.CLK(inf.clk),
		.reset(inf.resetn),
		.Enable(inf.enable),
		.Load(inf.load),
		.Data_in(inf.data_in),
		.Count(inf.count),
		.A_count(inf.a_out),
		.C_out(inf.c_out)
	);
	
	
	initial forever #5 clk = ~clk;
	
	initial begin
	
		apb_test = new(inf);
		apb_test.run_test();
		
		#10 
		apb_test.env.scoreboard.report_generate();
		
		$finish;
	
	end


endmodule