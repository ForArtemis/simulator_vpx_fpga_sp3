`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:38 05/16/2016 
// Design Name: 
// Module Name:    iic_master 
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
module i2c_master(

	input 	wire       		clk
	
	inout   wire         	sda, 
	output	wire        	scl,
	
	input 	wire 	[2:0] 	addr, 
	input 	wire 	[7:0] 	in_data,
	output 	reg 	[7:0] 	out_data, 

	input	wire       		rd, 
	input	wire       		wr		
	
);



 


 
endmodule
