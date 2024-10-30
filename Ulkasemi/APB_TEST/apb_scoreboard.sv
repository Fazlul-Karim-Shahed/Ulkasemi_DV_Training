
class apb_scoreboard;

	mailbox mb_exp;
	mailbox mb_act;
	
	function new(mailbox mb_exp, mailbox mb_act);
		$display("%0t APB Scoreboard constructed", $time);
		this.mb_act = mb_act;
		this.mb_exp = mb_exp;
	endfunction


endclass