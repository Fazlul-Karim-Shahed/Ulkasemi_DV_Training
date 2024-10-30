

class car;

    string carName;
    int carWheel;
    int carSeat;

    function new(string carName = "ABC", int carWheel = 4, int carSeat = 5);

        this.carName = carName;
        this.carWheel = carWheel;
        this.carSeat= carSeat;
        
    endfunction

    function void printCarSpec();
        $display("Car Name :: %0s, Car Wheel :: %0d, Car Seat: :: %0d", carName, carWheel, carSeat);
        
    endfunction

endclass




class supercar extends car;

    int carMaxSpeed;
    string carBody;
    bit carSpoiler;

    function new(string carName = "", int carWheel = 0, int carSeat = 0, int carMaxSpeed, string carBody, bit carSpoiler);
		super.new(carName, carWheel, carSeat);
        this.carMaxSpeed = carMaxSpeed;
        this.carBody = carBody;
        this.carSpoiler = carSpoiler;
    endfunction
	
	function void printCarSpec();
        $display("Car Name :: %0s, Car Wheel :: %0d, Car Seat: :: %0d, Car Max Speed :: %0d, Car Body :: %0s, Car Spoiler :: %0s", carName, carWheel, carSeat, carMaxSpeed, carBody, carSpoiler===1'b1 ? "YES" : "NO");
    endfunction

endclass





module factory;

car c_bmw;
supercar sc1;

initial begin
    c_bmw = new("BMW", 4,4);
    c_bmw.printCarSpec();
	
	sc1 = new("Toyota", 4, 4, 400, "Carbon Fiber", 1);
	sc1.printCarSpec();
end
    
endmodule