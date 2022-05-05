module BCD(clk, rst_n, Q_out, Load, Bcd_in);
input clk;  //時脈訊號
input rst_n; //重制訊號
input [3:0] Bcd_in;  //Bcd輸入
input Load;          //載入訊號
output [3:0] Q_out;  //4bit 輸出
reg [3:0] Q_out; 

always@ (posedge clk)
begin
if (!rst_n)  //當reset負緣觸發時計數變為0
Q_out <= 0;
else if (Q_out == 9) //當計數到9時，將計數歸0
Q_out<= 0;
else if (Load)    //當Load正緣觸發時，將輸入的數字載入
Q_out <= Bcd_in;
else
Q_out <= Q_out + 1; //計數遞加1
end
endmodule