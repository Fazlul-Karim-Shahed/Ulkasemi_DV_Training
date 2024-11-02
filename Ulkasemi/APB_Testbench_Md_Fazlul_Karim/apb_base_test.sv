
class apb_base_test;
	
	apb_environment env;
	
	function new(virtual apb_interface inf);
		//$display("%0t APB Base test constructed", $time);
		env = new(inf);
	endfunction
	
	task run_test();
		env.agent.driver.apb_reset();
		
		fork
			env.agent.monitor.apb_capture();
			env.scoreboard.compare();
			
		join_none
		
		seq_wr(255);
		//con_wr(255);
		
	endtask
	
	task seq_wr(input int x);
		
		for(int i = 0; i <=x; i++) begin
			env.agent.driver.apb_write(i, $urandom);
		end
		
		for(int i = 0; i <=x; i++) begin
			env.agent.driver.apb_read(i);
		end
	
	endtask
	
	
	task con_wr(input int x);
		
		for(int i = 0; i <=x; i++) begin
			env.agent.driver.apb_write(i, $urandom);
			env.agent.driver.apb_read(i);
		end
	
	endtask
	


endclass