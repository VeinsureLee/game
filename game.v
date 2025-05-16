module game(
    input new_Game,
    input clock,
	 input load,
	 input [5:0] pdata6,
	 
	 output [5:0] pn6,
	 output [1:0] color2,
	 output [3:0] cardValue4,
	 output cardReadyMaster,
	 output cardReadySlave,
	 output finishMaster,
	 output [4:0]totalValueMaster5,
	 output finishSlave,
	 output [4:0]totalValueSlave5,
	 output [15:0]  bcdResults16,
	 output [2:0]num_wire
);

    m_seq u_m_seq(
		 .new_Game(new_Game),
		 .clock(clock),
		 .load(load),
		 .pdata6(pdata6),
		 .pn6(pn6)
	);
	
	value_func u_value_func(
		 .pn6(pn6),
		 .color2(color2),
		 .cardValue4(cardValue4)
	);
	
	Game_Ctrl u_Game_Ctrl(
		 .new_Game(new_Game),
		 .clock(clock),
		 .totalValueSlave(totalValueSlave5),
		 .finishMaster(finishMaster),
		 .finishSlave(finishSlave),
		 
		 .cardReadyMaster(cardReadyMaster),
		 .cardReadySlave(cardReadySlave),
		 
		 .num_wire(num_wire)
	);
	
	Game_Player_Master u_Game_Player_Master (
		 .new_Game(new_Game),
		 .clock(clock),
		 .cardValue4(cardValue4),
		 .cardReadyMaster(cardReadyMaster),
		 
		 .finishMaster(finishMaster),
		 .totalValueMaster(totalValueMaster5)
	);
	
	Game_Player_Slave u_Game_Player_Slave (
		 .new_Game(new_Game),
		 .clock(clock),
		 .cardValue4(cardValue4),
		 .cardReadySlave(cardReadySlave),
		 
		 .finishSlave(finishSlave),
		 .totalValueSlave(totalValueSlave5)
	);
	
	bcd_results_show u_bcd_results_show (
	 .finishSlave(finishSlave),
	 .finishMaster(finishMaster),
	 .totalValueSlave(totalValueSlave5),
	 .totalValueMaster(totalValueMaster5),
	 
	 .bcdResults16(bcdResults16)
);

endmodule