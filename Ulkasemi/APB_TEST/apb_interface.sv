

interface apb_interface(input bit PCLK);

	logic PRESETn;
	logic [7:0] PADDR;
	logic PSEL;
	logic PENABLE;
	logic PWRITE;
	logic [31:0] PWDATA;
	logic [31:0] PRDATA; 
	
endinterface