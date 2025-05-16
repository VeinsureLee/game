module Game_Ctrl (
    
	 
	 input new_Game,
    input clock,
	 input [4:0]totalValueSlave,
	 input finishMaster,
	 input finishSlave,
	 
	 output cardReadyMaster,
	 output cardReadySlave,
	 
	 output [2:0]num_wire
);
	 reg [2:0] num;
	 assign num_wire = num;
	 reg cardReadyMaster_Reg;
	 reg cardReadySlave_Reg;
	 always @(posedge clock or posedge new_Game) begin
         if (new_Game) 
		   begin
             num <= 0;
         end 
		  
		   else 
		   begin
			
				if(totalValueSlave > 21)
			   begin
					cardReadyMaster_Reg <= 0;
					cardReadySlave_Reg <= 0;
			   end
				
				else if(num[2:1]==2'b00)
				begin
					cardReadyMaster_Reg <= 0;
					cardReadySlave_Reg <= 1;
					num <= num + 1;
				end
				
				else if(num[2:1]==2'b01)
				begin
					cardReadyMaster_Reg <= 1;
					cardReadySlave_Reg <= 0;
					num <= num + 1;
				end
				
				else if(num[2:1]==2'b10)
				begin
					if(!finishSlave)
					begin
						cardReadyMaster_Reg <= 0;
						cardReadySlave_Reg <= 1;
					end
					
					else
					begin
						cardReadyMaster_Reg <= 1;
						cardReadySlave_Reg <= 0;
						num[2:1]=2'b11;
					end
				end
				
				else if(num[2:1]==2'b11)
				begin
					if(!finishMaster)
					begin
						cardReadyMaster_Reg <= 1;
						cardReadySlave_Reg <= 0;
					end
					
					else
					begin
						cardReadyMaster_Reg <= 0;
						cardReadySlave_Reg <= 0;
					end
				end
				
         end
     end
	  
     assign cardReadyMaster = cardReadyMaster_Reg;
	  assign cardReadySlave = cardReadySlave_Reg;

endmodule