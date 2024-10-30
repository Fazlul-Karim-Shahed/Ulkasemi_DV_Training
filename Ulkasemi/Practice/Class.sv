
class first;

	int age;
	string name;

	function new(string name="", int age=0);
		this.name = name;
		this.age = age;
		$display("Fist class");
	endfunction
	
	function void status();
		$display("Fist class status: Name: %0s, Age: %0d", name, age);
	endfunction
	
	function void sum(int a, int b);
		$display("Fist class sum: %0d + %0d = %0d", a, b, a+b);
	endfunction

endclass





class second extends first;
	function new(string name, int age);
		super.new(name, age);
		$display("Second class");
	endfunction
	
	function void status();
		$display("Second class status: Nothing");
	endfunction
	
endclass



class third extends second;
	function new(string name, int age);
		super.new(name, age);
		$display("Third class");
	endfunction
endclass



class forth;

	first f;

	function new();
		$display("Forth class");
		f = new("Urmi", 21);
		f.sum(10, 12);
	endfunction
endclass



module top;
	
	forth f;
	//first f;
	
	initial begin
		f = new();
	end


endmodule