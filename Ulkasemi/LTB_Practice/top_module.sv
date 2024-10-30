
module top_module;

    reg net_45, net_67, clk, rstn;
    wire net_2;


    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        net_45 = 0;
        net_67 = 0;
        rstn = 0;

        $display("Time\t CLK\t RSTN\n NET_45\t NET_67\t");

        $monitor("%0b\t %0b\t %0b\n %0b\t %0b\t", $time, clk, rstn, net_45, net_67);

        #10 net_45 = 0; net_67 = 0; rstn = 0;
        #10 net_45 = 1; net_67 = 1; rstn = 0;
        #10 net_45 = 0; net_67 = 0; rstn = 1;
        #10 net_45 = 1; net_67 = 1; rstn = 1;

        #10 $stop;
    end

endmodule