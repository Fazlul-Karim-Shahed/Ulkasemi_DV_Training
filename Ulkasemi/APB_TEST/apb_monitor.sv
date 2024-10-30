
class apb_monitor;

	apb_packet packet2;
	virtual apb_interface inf;
	mailbox mb_act;
	mailbox mb_exp;
	
	function new(virtual apb_interface inf, mailbox mb_exp, mailbox mb_act);
		$display("%0t APB Monitor constructed", $time);
		this.inf = inf;
		this.mb_act = mb_act;
		this.mb_exp = mb_exp;
		packet2 = new();
	endfunction

endclass