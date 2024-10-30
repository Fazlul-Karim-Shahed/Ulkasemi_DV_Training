
class Shape;
    // Abstract method (no implementation)
    function void draw(); 
        $display("Drawing a Shape");
    endfunction
endclass

class Circle extends Shape;
    function void draw();
        $display("Drawing a Circle");
    endfunction
endclass

class Square extends Shape;
    function void draw();
        $display("Drawing a Square");
    endfunction
endclass

module abstraction;
    initial begin
        Circle s1 = new();
        Square s2 = new();
        s1.draw();  // Output: Drawing a Circle
        s2.draw();  // Output: Drawing a Square
    end
endmodule
