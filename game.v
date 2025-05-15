module game #(
    parameter N = 6
)(
    input new_Game,
    input clock,
	 input load,
	 input [N-1:0] pdata6,
	 output reg [N-1:0] prbs_out
);

    reg [N-1:0] lfsr;

    always @(posedge clock or posedge new_Game) begin
        if (new_Game) begin
            lfsr <= pdata6;  
				prbs_out <= pdata6;
        end else begin
            // 假设使用 x^6 + x^5 + 1 作为本源多项式
            lfsr <= {lfsr[N-2:0], lfsr[5] ^ lfsr[4]};
				prbs_out <= lfsr;
        end
    end

endmodule