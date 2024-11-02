


class apb_environment;
	
	apb_scoreboard scoreboard;
	apb_agent agent;
	
	mailbox mb_act;
	
	function new(virtual apb_interface inf);
		//$display("%0t :: APB Environment", $time);
		mb_act = new();
		scoreboard = new(mb_act);
		agent = new(inf, mb_act);
	endfunction

endclass