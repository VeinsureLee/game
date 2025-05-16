module bcd_results_show (
    input finishSlave,
    input finishMaster,
    input [4:0] totalValueSlave,
    input [4:0] totalValueMaster,
    output [15:0] bcdResults16
);

    reg [3:0] SlaveStatereg;
    reg [3:0] MasterStatereg;
    reg [3:0] ScoreTenreg;
    reg [3:0] ScoreOnereg;

    always @(*) begin
        if ((totalValueSlave > 21) || 
            ((totalValueSlave >= 20 && totalValueSlave < 22) && 
             (totalValueMaster >= 20 && totalValueMaster < 22) && 
             (totalValueMaster > totalValueSlave))) 
        begin
            MasterStatereg = 1;
            SlaveStatereg = 0;
            ScoreTenreg = totalValueMaster / 10;
            ScoreOnereg = totalValueMaster % 10;
        end 
        else if ((totalValueMaster > 21) || 
                 ((totalValueMaster >= 20 && totalValueMaster < 22) && 
                  (totalValueSlave >= 20 && totalValueSlave < 22) && 
                  (totalValueMaster < totalValueSlave))) 
        begin
            MasterStatereg = 0;
            SlaveStatereg = 1;
            ScoreTenreg = totalValueSlave / 10;
            ScoreOnereg = totalValueSlave % 10;
        end 
        else if ((totalValueMaster == totalValueSlave) && 
                 (totalValueMaster >= 20 && totalValueMaster < 22) && 
                 (totalValueSlave >= 20 && totalValueSlave < 22)) 
        begin
            MasterStatereg = 1;
            SlaveStatereg = 1;
            ScoreTenreg = totalValueMaster / 10;
            ScoreOnereg = totalValueMaster % 10;
        end 
        else begin
            MasterStatereg = 0;
            SlaveStatereg = 0;
            ScoreTenreg = 0;
            ScoreOnereg = 0;
        end
    end

    assign bcdResults16 = {MasterStatereg, SlaveStatereg, ScoreTenreg, ScoreOnereg};

endmodule
