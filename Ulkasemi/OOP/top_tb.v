

class environment;

	function new();
		$display("%0t Environment constructed", $time);
	endfunction


endclass

class test;
	
	environment env;
	
	function new();
		$display("%0t Test constructed", $time);
		env = new();
	endfunction


endclass


module top_tb;

	test test1;
	
	initial begin
		test1 = new();
	end

endmodule