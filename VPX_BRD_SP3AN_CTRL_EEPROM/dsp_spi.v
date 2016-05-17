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
// Description:    1. DSP to FPGA DSP interface, DSP is master and FPGA is slave
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

module dsp_spi 
 (
	cs,
	rw,
	addr,
	data_w,
	data_r,
	rdy,
	DSP_SSEL1,
	DSP_SCK1,
	DSP_MISO1,
	DSP_MOSI1,
	wr_event_cng
 );
 
// ========================================================
// port declarations
// ========================================================

input 				DSP_SSEL1;
input				DSP_SCK1;
input 				DSP_MOSI1;
output 				DSP_MISO1;
output 				wr_event_cng;
output				cs;
output				rw;
output		[7:0]	addr;
output		[7:0]	data_w;
input		[7:0]	data_r;
output				rdy;          // rdy = 1, DSP SPI read addr is ready

// ========================================================
// Internal signals declarations
// ========================================================

reg 		[4:0] 	spi_c;
reg					rw = 1'b0;
reg			[7:0]	addr = 8'b0;
reg			[7:0]	data_w = 8'h0;
reg					DSP_MISO1;
reg					rdy = 1'b0;
reg   				wr_event_cng = 1'b0; 

assign 				cs = DSP_SSEL1;

// ========================================================
// Main body of the code
// ========================================================

// DSP SPI write process, input data is latched on the falling edge of DSP_SCK1
always @(negedge DSP_SCK1 or posedge DSP_SSEL1) begin	
	if(DSP_SSEL1) begin
		spi_c 		 <= 5'h0;
		rdy 		 <=	1'b0;
		wr_event_cng <= 1'b0;
	end
	
	else begin		
		case(spi_c)
			5'h0: begin
				spi_c <= spi_c + 1;
				rw <= DSP_MOSI1;	
				addr <= 8'h0;
				data_w <= 8'h0;	
				rdy <= 1'b0;
				wr_event_cng <= 1'b0;
			end

			5'h1: begin
				spi_c <= spi_c + 1;
				addr[6] <= DSP_MOSI1;
			end

			5'h2: begin
				spi_c <= spi_c + 1;
				addr[5] <= DSP_MOSI1;
			end

			5'h3: begin
				spi_c <= spi_c + 1;
				addr[4] <= DSP_MOSI1;
			end

			5'h4: begin
				spi_c <= spi_c + 1;
				addr[3] <= DSP_MOSI1;
			end

			5'h5: begin
				spi_c <= spi_c + 1;
				addr[2] <= DSP_MOSI1;
			end

			5'h6: begin
				spi_c <= spi_c + 1;
				addr[1] <= DSP_MOSI1;
			end	

			5'h7: begin
				spi_c <= spi_c + 1;
				addr[0] <= DSP_MOSI1;
				if(~rw) 
					rdy <= 1'b0; // continue to write
				else 
					rdy <= 1'b1; // start to read			
			end	

			5'h8: begin
				spi_c <= spi_c + 1;
				if(~rw) 
					data_w[7] <= DSP_MOSI1;				
				rdy <= 1'b0;
			end

			5'h9: begin
				spi_c <= spi_c + 1;
				if (~rw) 
					data_w[6] <= DSP_MOSI1;				
			end

			5'ha: begin
				spi_c <= spi_c + 1;
				if (~rw) 
					data_w[5] <= DSP_MOSI1;				
			end

			5'hb: begin
				spi_c <= spi_c + 1;
				if (~rw) 
					data_w[4] <= DSP_MOSI1;				
			end
		
			5'hc: begin
				spi_c <= spi_c + 1;
				if (~rw) 
					data_w[3] <= DSP_MOSI1;				
			end		

			5'hd: begin
				spi_c <= spi_c + 1;
				if (~rw) 
					data_w[2] <= DSP_MOSI1;				
			end	

			5'he: begin
				spi_c <= spi_c + 1;
				if (~rw) 
					data_w[1] <= DSP_MOSI1;				
			end	

			5'hf: begin
				spi_c <= spi_c + 1;
				if (~rw) begin
					data_w[0] <= DSP_MOSI1;				
					wr_event_cng <= 1'b1;
				end
				else 
					wr_event_cng <= 1'b0;		
			end	

			5'h10: begin
				spi_c 		 <= 5'h0;
				wr_event_cng <= 1'b0;				
			end
			
			default: begin
				spi_c 		 <= 5'h0;
				rw 			 <= 1'b0;
				addr 		 <= 8'b0;
				data_w  	 <= 8'h0;
				rdy 		 <=	1'b0;
				wr_event_cng <= 1'b0;
			end
		endcase		
	end
end

// DSP SPI read process, data is output on the rising edge of DSP_SCK1
always @(posedge DSP_SCK1 or posedge DSP_SSEL1) begin
	if(DSP_SSEL1) 
		DSP_MISO1 <= 1'b0;
	else begin		
		case (spi_c)		
			5'h0: DSP_MISO1 <= 1'b0;	
			5'h1: DSP_MISO1 <= 1'b0;
			5'h2: DSP_MISO1 <= 1'b0;
			5'h3: DSP_MISO1 <= 1'b0;
			5'h4: DSP_MISO1 <= 1'b0;
			5'h5: DSP_MISO1 <= 1'b0;
			5'h6: DSP_MISO1 <= 1'b0;
			5'h7: DSP_MISO1 <= 1'b0;
			5'h8: if (rw) DSP_MISO1 <= data_r[7];
			5'h9: if (rw) DSP_MISO1 <= data_r[6];
			5'ha: if (rw) DSP_MISO1 <= data_r[5];
			5'hb: if (rw) DSP_MISO1 <= data_r[4];
			5'hc: if (rw) DSP_MISO1 <= data_r[3];
			5'hd: if (rw) DSP_MISO1 <= data_r[2];
			5'he: if (rw) DSP_MISO1 <= data_r[1];
			5'hf: if (rw) DSP_MISO1 <= data_r[0];
			/*
			5'h10: begin
				if((data_w == 8'h00) && (~rw)) DSP_MISO1 <= 1'b1;
				else DSP_MISO1 <= 1'b0;																
			end
			*/
			default: DSP_MISO1 <= 1'b0;
		endcase		
	end
end

endmodule 

