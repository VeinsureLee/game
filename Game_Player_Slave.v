module Game_Player_Slave (
    input new_Game,
    input clock,
	 input [3:0] cardValue4,
	 input cardReadySlave,
	 
	 output finishSlave,
	 output [4:0]totalValueSlave
);

	reg finish_flag;
	reg [4:0] totalValueSlave_Reg;
	always@(posedge clock or posedge new_Game)
	begin
		if(new_Game)
		begin
			totalValueSlave_Reg <= 0;
			finish_flag = 0;
		end
		
		else if (cardReadySlave)
		begin
			if(totalValueSlave_Reg>=20)
			begin
			
			end
		
			else if(totalValueSlave_Reg+cardValue4 < 20)
			begin
				totalValueSlave_Reg<=totalValueSlave_Reg+cardValue4;
			end
			
			else if(totalValueSlave_Reg+cardValue4 < 22)
			begin
				totalValueSlave_Reg<=totalValueSlave_Reg+cardValue4;
				finish_flag <= 1;
			end
			
			else
			begin
				if(cardValue4!=11)
				begin
					totalValueSlave_Reg <= totalValueSlave_Reg + cardValue4;
					finish_flag <= 1;
				end
				else
				begin
					totalValueSlave_Reg <= totalValueSlave_Reg +1;
					if(totalValueSlave_Reg >= 20)
						finish_flag <= 1;
				end
			end
			
		end
		
	end
    
	
	assign finishSlave = finish_flag;
	assign totalValueSlave = totalValueSlave_Reg;
endmodule