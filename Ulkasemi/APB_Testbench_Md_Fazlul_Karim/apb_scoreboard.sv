
class apb_scoreboard;

	mailbox mb_exp;
	mailbox mb_act;
	
	apb_packet exp_pkt, act_pkt;
	apb_packet act_pkt_q[$];
	apb_packet exp_pkt_q[$];
	
	apb_packet pb_exp_pkt;
	apb_packet pb_act_pkt;
	
	int failedCount = 0;
	int passedCount = 0;
	int totalCount = 0;
	
	function new(mailbox mb_exp, mailbox mb_act);
		//$display("%0t APB Scoreboard constructed", $time);
		this.mb_act = mb_act;
		this.mb_exp = mb_exp;
	endfunction
	
	task receive_exp_pkt();
		mb_exp.get(exp_pkt);
		exp_pkt_q.push_front(exp_pkt);
	endtask
	
	task receive_act_pkt();
		mb_act.get(act_pkt);
		act_pkt_q.push_front(act_pkt);
	endtask
	
	task compare();
		forever begin
			fork 
				receive_exp_pkt();
				receive_act_pkt();
				chekers();
			join
		end
	endtask
	
	task chekers();
			
			wait (exp_pkt_q.size > 0);
			wait (act_pkt_q.size > 0);
			
			pb_exp_pkt = exp_pkt_q.pop_back();
			pb_act_pkt = act_pkt_q.pop_back();
			totalCount++;
			if(pb_act_pkt.addr === pb_exp_pkt.addr) begin
				if(pb_act_pkt.adata === pb_exp_pkt.edata) begin
					passedCount++;
					$display("PASSED AT ADDR: %0h EXPECTED: %0h ACTUAL: %0h", pb_act_pkt.addr, pb_exp_pkt.edata, pb_act_pkt.adata);
				end
				else begin
					failedCount++;
					$display("<<----FAILED AT ADDR: %0h EXPECTED: %0h ACTUAL: %0h---->> ", pb_act_pkt.addr, pb_exp_pkt.edata, pb_act_pkt.adata);
				end
			end
			
	endtask
	
	
	function void report_generate();
	
		$display("=============================================================================================");
		$display("%0t Total Count :: %0d, Passed Count ::: %0d, Total Failed Count ::: ", $time, totalCount, passedCount, failedCount);
		$display("=============================================================================================");
		
		
	endfunction

endclass