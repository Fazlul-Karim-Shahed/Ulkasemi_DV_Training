
module top_module;

    int arr[2:0][3:0];

    initial begin
        foreach(arr[i,j]) begin
            $display("array[%0d][%0d] = %0d", i, j, arr[i][j]);
        end
    end

endmodule