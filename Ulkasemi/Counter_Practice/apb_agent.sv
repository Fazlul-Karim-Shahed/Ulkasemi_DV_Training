

class apb_agent;

	apb_driver driver;
	apb_monitor monitor;
	
	function new(virtual apb_interface inf, mailbox mb_act);
		//$display("%0t :: APB Agent", $time);
		driver = new(inf);
		monitor = new(inf, mb_act);
	endfunction

endclass