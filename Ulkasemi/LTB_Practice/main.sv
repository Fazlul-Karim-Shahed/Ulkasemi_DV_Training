


module main(
    input wire net_45, 
    input wire net_67,
    input wire clk, 
    input wire rstn,
    output wire net_2
);

    reg data_0;
    wire net_11;

    assign net_11 = net_67 & net_45;

    always @(posedge clk or negedge rstn) begin
        if(!rstn)
            data_0 <= 1'b0;
        else
            data_0 <= net_11;
    end

    assign net_2 = data_0;



endmodule