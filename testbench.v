`timescale 1ns/1ps
module Testbench;
reg  clk;
reg  rst_n;
reg Load;
reg [3:0] Bcd_in;
output [3:0] Q_out;
parameter PERIOD = 20;
parameter real DUTY_CYCLE = 0.5;
parameter OFFSET = 0;
initial
begin
#OFFSET;
forever
begin
clk = 1'b0;
#(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
#(PERIOD*DUTY_CYCLE);
end
end
initial begin
rst_n = 1'b1;      //將重置訊號設為1
#50  rst_n = 1'b0; //經過50個時間單位，將重置訊號設為0
Load = 1'b0;       //將載入訊號設為0
#50  rst_n = 1'b1; //經過50個時間單位，將重置訊號設為1
#50  Load  = 1'b1; //經過50個時間單位，將載入訊號設為1
Bcd_in = 4'b0001;  //將bcd輸入設為1
#50  Load  = 1'b0; //經過50個時間單位，將載入訊號設為0
#50  rst_n = 1'b0; //經過50個時間單位，將重置訊號設為0
#50  rst_n = 1'b1; //經過50個時間單位，將重置訊號設為1
#1000 $finish;     //經過1000個時間單位後結束
end


BCD bcd_tb(.clk(clk),.rst_n(rst_n),.Q_out(Q_out),.Load(Load),.Bcd_in(Bcd_in));
initial begin
    $dumpfile("simple.vcd");
    $dumpvars(0, bcd_tb);
end
endmodule