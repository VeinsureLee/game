module bcd_results_show (
    
	 
	 input finishSlave,
	 input finishMaster,
	 input [4:0]totalValueSlave,
	 input [4:0]totalValueMaster,
	 
	 output [3:0]SlaveState,
	 output [3:0]MasterState,
	 output [3:0]ScoreTen,
	 output [3:0]ScoreOne
);
	 reg [3:0]SlaveStatereg;
	 reg [3:0]MasterStatereg;
	 reg [3:0]ScoreTenreg;
	 reg [3:0]ScoreOnereg;
	 always@(*)
	 begin
		 if(finishSlave)
		 begin
			 if(!finishMaster || (totalValueMaster>totalValueSlave))
			 begin
				 MasterStatereg <= 1;
				 SlaveStatereg <= 0;
				 ScoreTenreg <= totalValueMaster[4];
				 ScoreOnereg <= totalValueMaster[3:0];
			 end
			 
			 else if(totalValueMaster>21 || (totalValueMaster<totalValueSlave))
			 begin
				 MasterStatereg <= 0;
				 SlaveStatereg <= 1;
				 ScoreTenreg <= totalValueMaster[4];
				 ScoreOnereg <= totalValueMaster[3:0];
			 end
			 
			 else
			 begin
				 MasterStatereg <= 1;
				 SlaveStatereg <= 1;
				 ScoreTenreg <= totalValueMaster[4];
				 ScoreOnereg <= totalValueMaster[3:0];
			 end
				
		 end
	 end
	 
	 assign SlaveState = SlaveStatereg;
	 assign MasterState = MasterStatereg;
	 assign ScoreTen =ScoreTenreg;
	 assign ScoreOne = ScoreOnereg;

endmodule