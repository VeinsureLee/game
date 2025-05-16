`timescale 1ns/1ns

module tb_game;
 
  reg  [5:0]  pdata6   ; 
  wire  [4:0]  totalValueMaster5   ; 
  wire    cardReadySlave   ; 
  wire    cardReadyMaster   ; 
  reg    clock   ; 
  wire  [5:0]  pn6   ; 
  reg    load   ; 
  wire  [4:0]  totalValueSlave5   ; 
  wire  [1:0]  color2   ; 
  wire  [15:0]  bcdResults16   ; 
  wire  [3:0]  cardValue4   ; 
  reg    newGame   ; 
  wire    finishSlave   ; 
  wire    finishMaster   ; 
  wire [2:0]num_wire;
  game  
   DUT  ( 
       .pdata6 (pdata6 ) ,
      .totalValueMaster5 (totalValueMaster5 ) ,
      .cardReadySlave (cardReadySlave ) ,
      .cardReadyMaster (cardReadyMaster ) ,
      .clock (clock ) ,
      .pn6 (pn6 ) ,
      .load (load ) ,
      .totalValueSlave5 (totalValueSlave5 ) ,
      .color2 (color2 ) ,
      .bcdResults16 (bcdResults16 ) ,
      .cardValue4 (cardValue4 ) ,
      .new_Game (newGame ) ,
      .finishSlave (finishSlave ) ,
      .finishMaster (finishMaster ) ,
		.num_wire(num_wire)
		); 




always #50 clock = !clock;
initial 
	begin
	clock = 0;
	load = 0;
	newGame =0;
	pdata6 = 6'h13;
	#100 load = 1;
	#100 load = 0;
	#100 newGame = 1;
	#100 newGame =0;
	
	#8000	pdata6 = 6'h12;
	#200 load = 1;
	#200 load = 0;
	#200 newGame = 1;
	#200 newGame =0;
	
	#2000	pdata6 = 6'h1e;
	#100 load = 1;
	#100 load = 0;
	#100 newGame = 1;
	#100 newGame =0;
	
	#2000	pdata6 = 6'h21;
	#100 load = 1;
	#100 load = 0;
	#100 newGame = 1;
	#100 newGame =0;
	
	#2000	pdata6 = 6'h2d;
	#100 load = 1;
	#100 load = 0;
	#100 newGame = 1;
	#100 newGame =0;
	
	#2000	pdata6 = 6'h33;
	#100 load = 1;
	#100 load = 0;
	#100 newGame = 1;
	#100 newGame =0;
	
	#2000	pdata6 = 6'h3f;
	#100 load = 1;
	#100 load = 0;
	#100 newGame = 1;
	#100 newGame =0;
	end
endmodule
