module Game_Player_Master (
    input new_Game,
    input clock,
	 input [3:0] cardValue4,
	 input cardReadyMaster,
	 
	 output finishMaster,
	 output [4:0]totalValueMaster
);

	reg finish_flag;
	reg [4:0] totalValueMaster_Reg;
	always@(posedge clock or posedge new_Game)
	begin
		if(new_Game)
		begin
			totalValueMaster_Reg <= 0;
			finish_flag = 0;
		end
		
		else if (cardReadyMaster)
		begin
			if(totalValueMaster_Reg>= 20)
			begin
			
			end
			
			else if(totalValueMaster_Reg+cardValue4 < 20)
			begin
				totalValueMaster_Reg<=totalValueMaster_Reg+cardValue4;
			end
			
			else if(totalValueMaster_Reg+cardValue4 < 22)
			begin
				totalValueMaster_Reg<=totalValueMaster_Reg+cardValue4;
				finish_flag <= 1;
			end
			
			else
			begin
				if(cardValue4!=11)
				begin
					totalValueMaster_Reg <= totalValueMaster_Reg + cardValue4;
					finish_flag <= 1;
				end
				else
				begin
					totalValueMaster_Reg <= totalValueMaster_Reg +1;
					if(totalValueMaster_Reg >= 20)
						finish_flag <= 1;
				end
			end
			
				
		end
	end
    
	
	assign finishMaster = finish_flag;
   assign totalValueMaster = totalValueMaster_Reg;


endmodule