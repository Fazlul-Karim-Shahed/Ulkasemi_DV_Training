

class apb_scoreboard;
	
	mailbox mb_act;
	apb_packet pkt_act;
	apb_packet pkt_act_q[$];
	
	apb_packet pkt_act_q_store;
	logic [3:0] exp_a_out = 1;
	bit exp_c_out;
	int pass = 0;
	int fail = 0;
	int totoal = 0;
	
	
	function new(mailbox mb_act);
		//$display("%0t :: APB Scoreboard", $time);
		this.mb_act = mb_act;
	endfunction
	
	task receive_act_pkt();
	 	mb_act.get(pkt_act);
	 	pkt_act_q.push_front(pkt_act);
	 endtask
	
	 task run_scoreboard();
	
	 	forever begin
	 		fork
	 			receive_act_pkt();
	 			compare();
	 		join
		
	 	end
	
	
	 endtask
	
	
	
	 task compare();
		
	 	wait (pkt_act_q.size > 0);
		
	 	pkt_act_q_store = pkt_act_q.pop_back();
		exp_a_output();
		exp_c_output();
		
		totoal++;
		if(exp_a_out === pkt_act_q_store.a_out) begin
			//$display("PASSED");
			pass++;
		end
		else begin
			//$display("FAILED");
			fail++;
		end
		
	 	$display("%0t :: Scoreboard:: data_in: %0d, enable: %0d, load: %0d, count: %0d ===> Expected ::  Data_in: %0d, C_out: %0d, Actual::  A_OUT :  %0d, C_OUT:  %0d", $time, pkt_act_q_store.data_in, pkt_act_q_store.enable, pkt_act_q_store.load, pkt_act_q_store.count, exp_a_out, exp_c_out, pkt_act_q_store.a_out, pkt_act_q_store.c_out);
	
	 endtask
	 
	 
	 task exp_a_output();
	 
		
		if(pkt_act_q_store.enable === 0) begin
	
			exp_a_out = exp_a_out;
	
		end
		
		else begin
		
			if(pkt_act_q_store.load === 1) begin
				exp_a_out = pkt_act_q_store.data_in;
		
			end
			
			else begin
				if(pkt_act_q_store.count === 1) begin
					exp_a_out = exp_a_out + 1;
				end
				else begin
					exp_a_out = exp_a_out - 1;
				end
				
			end
		
		end	
				
		
	 endtask
	 
	 
	 task exp_c_output();
	 
		if(exp_a_out == 'd15) begin
			exp_c_out = 1;
		end
		else
			exp_c_out = 0;
	 
	 endtask
	 
	 
	 function void report_generate();
	
		$display("=============================================================================================");
		$display("%0t Total Count :: %0d, Passed Count ::: %0d, Total Failed Count ::: ", $time, totoal, pass, fail);
		$display("=============================================================================================");
		
	endfunction


endclass