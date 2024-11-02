
class apb_base_test;

	apb_environment env;
	int data = 5;
	
	function new(virtual apb_interface inf);
		//$display("%0t :: APB Base Test", $time);
		env = new(inf);
	endfunction
	
	
	task run_test();
		
		env.agent.driver.apb_reset();
		
		fork
			
			env.agent.monitor.capture();
			env.scoreboard.run_scoreboard();
		
		join_none
	
		
		//env.agent.driver.apb_count(data, 20, 1, 1, 1);
		env.agent.driver.apb_count(data, 20, 1, 1, 1);
	
	endtask

endclass