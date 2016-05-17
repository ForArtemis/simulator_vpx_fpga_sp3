`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:32 10/5/2015 
// Design Name: 
// Module Name:    dsp_spi 
// Project Name: 
// Target Devices: X3S400AN-FGG400
// Tool versions:  ISE-14.7
// Description:    1. input debounce filter
//
// Dependencies: 
//
// Revision:	    
//
//
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`include "params.v"

module debouncer 
 (
	clk, 		// clock source 
	reset_z, 
	signal_i,   // input source 
	signal_o    // debounced output
 );

// ========================================================
// port declarations
// ========================================================
 
input			clk;
input			reset_z;
input			signal_i;
output			signal_o;
reg				signal_o;

reg		[15:0]	clk_c;  		// counter for clock divider
reg				debounce_clk;   // clock for debounce
reg				signal_sample_1, signal_sample_2, signal_sample_3, signal_sample_4;

// ========================================================
// main body of the code
// ========================================================
 
always @(posedge clk or negedge reset_z) begin
	if (~reset_z) begin 
		clk_c <= 16'h0;
		debounce_clk <= 1'b0;
	end	
	else if (clk_c >=`debouncer_counter) begin
	    clk_c <= 16'h0;
		debounce_clk <= ~ debounce_clk;
	end	
	else begin 
	    clk_c <= clk_c + 1;
		debounce_clk <= debounce_clk;
	end	
end

always @(posedge debounce_clk or negedge reset_z) begin
	if (~reset_z) begin 
		signal_sample_1 <= 1'b1;
		signal_sample_2 <= 1'b1;
		signal_sample_3 <= 1'b1;
		signal_sample_4 <= 1'b1;
	end	
	else begin 
		signal_sample_1 <= signal_i;
		signal_sample_2 <= signal_sample_1;
		signal_sample_3 <= signal_sample_2;
		signal_sample_4 <= signal_sample_3;
	end   
end

always @(posedge clk or negedge reset_z) begin		
	if (~reset_z)  
		signal_o <= 1'b1;
	else if (signal_o == 1'b1 && 
			 signal_sample_1 == 1'b0 && 
			 signal_sample_2 == 1'b0 &&
			 signal_sample_3 == 1'b0 &&
			 signal_sample_4 == 1'b0)
		signal_o <= 1'b0;
	else if (signal_o == 1'b0 && 
			 signal_sample_1 == 1'b1 && 
			 signal_sample_2 == 1'b1 &&
			 signal_sample_3 == 1'b1 &&
			 signal_sample_4 == 1'b1)
		signal_o <= 1'b1;	
	else
		signal_o <= signal_o;
end

endmodule 

