`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:45:40 12/14/2015 
// Design Name: 
// Module Name:    CNT 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CNT(
    input BTN_SOUTH,
    input BTN_WEST,
    input BTN_EAST,
    input SW0,
    input SW1,
    input SW2,
    input SW3,
    input CLOCK,
    output reg LED0,
    output reg LED1,
    output reg LED2,
    output reg LED3,
    output reg LED4,
    output reg LED5,
    output reg LED6,
    output reg LED7
    );
	 
    reg clock_new;
	 reg [29:0]counter;
	 reg [2:0]count;
	 reg [7:0]state;

	 always @(posedge CLOCK)
	 begin
	
		 if(counter==50000000)
			counter<=0;
		 else
		  counter<=counter+1;
	 end
	  
	  
	  
	 always @(posedge CLOCK)
	 begin

		 if(counter==0)
			clock_new<=0;
		 else if(counter==25000000)
			clock_new<=1;
	 
	 end
	 
	 
always @(posedge clock_new)begin
if(BTN_SOUTH==0 && SW0==1 && SW1==1)begin
if(count==6)
count<=0;
else
count<=count+1;
end

else
count<=0;
end

always @(posedge clock_new or posedge BTN_SOUTH)begin

if(BTN_SOUTH)begin
LED0<=0;
LED1<=0;
LED2<=0;
LED3<=0;
LED4<=0;
LED5<=0;
LED6<=0;
LED7<=0;
state<=0;
end
else if(BTN_SOUTH==0 && SW0==0)begin
LED0<=LED0;
LED1<=LED1;
LED2<=LED2;
LED3<=LED3;
LED4<=LED4;
LED5<=LED5;
LED6<=LED6;
LED7<=LED7;
end



else if(BTN_SOUTH==0 && SW0==1 && SW1==1)begin
case(count)
0:begin
LED0<=0;
LED1<=0;
LED2<=0;
LED3<=0;
LED4<=0;
LED5<=0;
LED6<=0;
LED7<=0;
state<=0;
end
1:begin
LED0<=0;
LED1<=1;
LED2<=0;
LED3<=0;
LED4<=0;
LED5<=0;
LED6<=0;
LED7<=0;
state<=2;
end
2:begin
LED0<=1;
LED1<=0;
LED2<=0;
LED3<=0;
LED4<=0;
LED5<=0;
LED6<=0;
LED7<=0;
state<=1;
end
3:begin
LED0<=1;
LED1<=0;
LED2<=0;
LED3<=0;
LED4<=0;
LED5<=0;
LED6<=0;
LED7<=0;
state<=1;
end
4:begin
LED0<=0;
LED1<=1;
LED2<=0;
LED3<=0;
LED4<=0;
LED5<=0;
LED6<=0;
LED7<=0;
state<=2;
end
5:begin
LED0<=0;
LED1<=1;
LED2<=1;
LED3<=0;
LED4<=0;
LED5<=0;
LED6<=0;
LED7<=0;
state<=6;
end
6:begin
LED0<=1;
LED1<=0;
LED2<=0;
LED3<=0;
LED4<=0;
LED5<=0;
LED6<=0;
LED7<=0;
state<=1;
end
endcase
end



else if(BTN_SOUTH==0 && SW0==1 && SW1==0 && SW2==1)begin
if(BTN_EAST==1 && BTN_WEST==0)begin
LED0<=state[1];
LED1<=state[2];
LED2<=state[3];
LED3<=state[4];
LED4<=state[5];
LED5<=state[6];
LED6<=state[7];
LED7<=state[0];
state[0]<=state[1];
state[1]<=state[2];
state[2]<=state[3];
state[3]<=state[4];
state[4]<=state[5];
state[5]<=state[6];
state[6]<=state[7];
state[7]<=state[0];
end
else if(BTN_EAST==0 && BTN_WEST==0)begin
LED0<=state[0];
LED1<=state[1];
LED2<=state[2];
LED3<=state[3];
LED4<=state[4];
LED5<=state[5];
LED6<=state[6];
LED7<=state[7];
end
else if(BTN_EAST==0 && BTN_WEST==1)begin
LED0<=state[7];
LED1<=state[0];
LED2<=state[1];
LED3<=state[2];
LED4<=state[3];
LED5<=state[4];
LED6<=state[5];
LED7<=state[6];
state[0]<=state[7];
state[1]<=state[0];
state[2]<=state[1];
state[3]<=state[2];
state[4]<=state[3];
state[5]<=state[4];
state[6]<=state[5];
state[7]<=state[6];
end
else if(BTN_EAST==1 && BTN_WEST==1)begin
LED0<=state[7];
LED1<=state[0];
LED2<=state[1];
LED3<=state[2];
LED4<=state[3];
LED5<=state[4];
LED6<=state[5];
LED7<=state[6];
state[0]<=state[7];
state[1]<=state[0];
state[2]<=state[1];
state[3]<=state[2];
state[4]<=state[3];
state[5]<=state[4];
state[6]<=state[5];
state[7]<=state[6];
end
end

else if(BTN_SOUTH==0 && SW0==1 && SW1==0 && SW2==0 && SW3==1)begin
if(BTN_EAST==1 && BTN_WEST==0)begin
if(state==0)
state<=0;
else
state<=state-1;
LED0<=state[0];
LED1<=state[1];
LED2<=state[2];
LED3<=state[3];
LED4<=state[4];
LED5<=state[5];
LED6<=state[6];
LED7<=state[7];

end
else if(BTN_EAST==0 && BTN_WEST==0)begin
LED0<=state[0];
LED1<=state[1];
LED2<=state[2];
LED3<=state[3];
LED4<=state[4];
LED5<=state[5];
LED6<=state[6];
LED7<=state[7];
end
else if(BTN_EAST==0 && BTN_WEST==1)begin
if(state==127)
state<=127;
else
state<=state+1;

LED0<=state[0];
LED1<=state[1];
LED2<=state[2];
LED3<=state[3];
LED4<=state[4];
LED5<=state[5];
LED6<=state[6];
LED7<=state[7];
end
else if(BTN_EAST==1 && BTN_WEST==1)begin
if(state==127)
state<=127;
else
state<=state+1;

LED0<=state[0];
LED1<=state[1];
LED2<=state[2];
LED3<=state[3];
LED4<=state[4];
LED5<=state[5];
LED6<=state[6];
LED7<=state[7];
end

end

else begin
LED0<=LED0;
LED1<=LED1;
LED2<=LED2;
LED3<=LED3;
LED4<=LED4;
LED5<=LED5;
LED6<=LED6;
LED7<=LED7;
end


end







endmodule
