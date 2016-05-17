`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:32 10/5/2015 
// Design Name: 
// Module Name:    fpga_internal_reset 
// Project Name: 
// Target Devices: X3S400AN-FGG400
// Tool versions:  ISE-14.7
// Description:    1. generate internal async reset 
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

module fpga_internal_reset 
 (
	clk,				// Clock input for the timing delay counter
	rst_n,				// Reset input to this block
    fpga_reset_n		// Output to FPGA internal Reset
 );

// ========================================================
// port declarations
// ========================================================

input			clk;
input			rst_n;
output			fpga_reset_n;
reg				fpga_reset_n;

// ========================================================
// Internal signals declarations
// ========================================================

reg		[15:0]	fpga_reset_counter;
  
// Reset Mechanism State-Machine
(* fsm_encoding = "user" *) 
reg		[1:0]	reset_st;	
	
parameter 		idle 			= 			2'h0; 
parameter 		reset_assert 	= 			2'h1; 
parameter 		reset_release 	= 			2'h2;

// ========================================================
// Main body of the code
// ========================================================

always @(posedge clk or negedge rst_n) begin		
	if(~rst_n) begin
		reset_st <= idle;
		fpga_reset_n <= 1'b0;		 
		fpga_reset_counter <= 16'b0;
	end
	else begin  
		case(reset_st)
			idle: begin		
				fpga_reset_n <= 1'b0;		 
				fpga_reset_counter <= 16'b0;
				if(rst_n) 
					reset_st <= reset_assert;
				else
					reset_st <= idle;
			end

			reset_assert: begin	
				fpga_reset_n <= 1'b0;	
				if(fpga_reset_counter >= `FPGA_ireset_delay_time) begin //0.5ms
					reset_st <= reset_release;
					fpga_reset_counter <= 16'b0;
				end	
				else begin
					reset_st <= reset_assert;
					fpga_reset_counter <= fpga_reset_counter + 1;
				end	
			end

			reset_release: begin	
				fpga_reset_n <= 1'b1;
				fpga_reset_counter <= 16'b0;
				reset_st <= reset_release;
			end

			default: begin
				reset_st <= idle;
				fpga_reset_n <= 1'b1;
				fpga_reset_counter <= 16'b0;
			end                       
		endcase 	
	end
end	  
endmodule 

