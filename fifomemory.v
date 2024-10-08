module fifomemory #(parameter DATASIZE = 16, // Memory data word width
					  parameter ADDRSIZE = 4) // Number of mem address bits
	(input [DATASIZE-1:0] wdata,
	 input [ADDRSIZE-1:0] waddr, raddr,
	 input wclken, wfull, wclk,
	 output [DATASIZE-1:0] rdata);
		 
	localparam DEPTH = 1<<ADDRSIZE;
	reg [DATASIZE-1:0] mem [0:DEPTH-1];
	assign rdata = mem[raddr];
	always @(posedge wclk) begin
		if (wclken && !wfull) mem[waddr] <= wdata;
	end
endmodule