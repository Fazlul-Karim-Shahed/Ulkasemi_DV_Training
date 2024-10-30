
class apb_environment;

	apb_agent agent;
	apb_scoreboard scoreboard;
	
	mailbox mb_exp;
	mailbox mb_act;
	
	function new(virtual apb_interface inf);
	
		$display("%0t APB Environment constructed", $time);
		mb_exp = new();
		mb_act = new();
		scoreboard = new(mb_exp, mb_act);
		agent = new(inf, mb_exp, mb_act);
	endfunction


endclass