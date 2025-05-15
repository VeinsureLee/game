module value_func (
    input [5:0] pn6,
    output [1:0] color2,
	 output [3:0] cardValue4
);

    
assign color2 = pn6[5:4];
assign cardValue4 = (pn6[3:0]<10&pn6[3:0]>0)?(pn6[3:0]==1?11:pn6[3:0]):10;

endmodule