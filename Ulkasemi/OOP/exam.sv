

// virtual
class exam:

    int bangla;
    local int qp;
    protected int mark;

    function display();
        $display("Hello");;
    endfunction


endclass


class midexam extends exam:

    int bangla;
    

endclass


module tb;

    midexam mx;
    initial begin
        mx = new();

    end

endmodule