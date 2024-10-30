
module top_train;
	
	int x;

	initial begin
		$display("Modelsim worked");
		x = 0;
		#2 x = 1;
		#2 x = 2;
		#2 x = 3;
		#2 x = 4;
	end

endmodule
