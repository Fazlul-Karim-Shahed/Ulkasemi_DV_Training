
class apb_base_test;
	
	apb_environment env;
	
	function new(virtual apb_interface inf);
		$display("%0t APB Base test constructed", $time);
		env = new(inf);
	endfunction
	
	task run_test();
		env.agent.driver.apb_reset();
	endtask


endclass