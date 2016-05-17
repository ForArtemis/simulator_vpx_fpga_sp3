`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  
// Engineer: 
// 
// Create Date:     05/08/2015
// Design Name: 
// Module Name:     ad9516_a 
// Project Name: 
// Target Devices:  
// Tool versions:   
// Description:     configure 68 registers of AD9516 using state machine
//
// Dependencies: 
//
// Revision: 
// Revision 1.00 - File Created
//          1.10 - VCO Calibration added
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ad9516_a
 (

	input      wire          clk,
	input      wire          rst_n,
	input	   wire			 set_ad9516,

	output     wire			 AD_CLOCK_RESET,
	output     wire			 AD_CS, 
	output     wire			 AD_PD,
	output     wire			 AD_REFSEL,
	output     wire          AD_SCLK,
	output     wire			 AD_SDI,
	input      wire			 AD_LD,
	output     wire          AD9516_cfg_done  // active high
 );
 
// AD9516 PIN discription

// AD_CLOCK_RESET, PIN RESET, Active Low.
// AD_CS,          PIN CS, Serial Control Port Chip Select, Active Low.
// AD_PD,          PIN PD, Chip Power-Down, Active Low.
// AD_REFSEL,      PIN REF_SEL, Reference Select, Selects REF1 (low, external clk on board) or REF2 (high, osc on board).
// AD_SCLK,        PIN SCLK, Serial Control Port Data Clock Signal.
// AD_SDI,         PIN SDIO, Serial Control Port Bidirectional Serial Data In/Out.
// AD_SYNC,        PIN SYNC, Manual Synchronizations and Manual Holdover. 
//                 This pin initiates a manual synchronization and is also used for manual holdover. Active low.
//                 By forcing the SYNC pin low and then releasing it (manual sync), reset the outputs.
// AD_LD,          PIN LD, Lock Detect (Output).
// AD_REFMON,      PIN REFMON, Reference Monitor (Output).
// AD_SDO,         PIN SDO, Serial Control Port Unidirectional Serial Data Out.
// AD_STATUS,      PIN STATUS, Status (Output).

///////////////////////////////////////Default Output///////////////////////////////////////////

assign    AD_CLOCK_RESET = 1'b1;       // output    1        0 = reset, 1 = normal
assign    AD_PD          = 1'b1;       // output    1        0 = power-down  
assign    AD_REFSEL      = 1'b0;       // output    0        0 = ref1(OSC), 1 = ref2(NULL)

////////////////////////////////Configuration Register Contents/////////////////////////////////

// 23   22  21  20  19   18   17......  8   7...... 0
// R/W_ W1  W0  A12 A11  A10  A9......  A0  D7..... D0
// 0    0   0   0   0    0

wire    [23:0]    confi_data[69:0];

/////////////////////////////////Serial Port Configuration//////////////////////////////////////

// assign confi_data[0]  = 24'h0000_DB;  //  SDO for read, SDIO for write/ LSB first/ Long instruction
assign confi_data[0]  = 24'h0000_99;  //  SDO for read, SDIO for write/ MSB first/ Long instruction
assign confi_data[1]  = 24'h0001_00;  //  Blank
assign confi_data[2]  = 24'h0002_00;  //  Reserved
assign confi_data[3]  = 24'h0003_41;  //  Reserved(AD9516-1 0x41 read only)
assign confi_data[4]  = 24'h0004_00;  //  Read Back buffer resgisters(default)

////////////////////////////////////////////PLL/////////////////////////////////////////////////

assign confi_data[5]  = 24'h0010_7C;  // on-chip VCO, positive polarity = postive/ PLL Normal operation
assign confi_data[6]  = 24'h0011_0A;  // R divider LSBs(lower eight bits), R=10 (reference input: 100Mhz,so compare: 10MHz)   
assign confi_data[7]  = 24'h0012_00;  // R divider MSBs(upper eight bits)
assign confi_data[8]  = 24'h0013_00;  // A = 0, A counter (part of N divider)
assign confi_data[9]  = 24'h0014_0F;  // B = 15, B counter (part of N divider), lower 8 bits 
assign confi_data[10] = 24'h0015_00;  // B counter (part of N divider), upper 5 bits
assign confi_data[11] = 24'h0016_05;  // DM + prescalar = 16 or 17, N=(PxB)+A=(16x15)+0 = 240 (VCO: 2.4Ghz, Fvco = Fref/R*N = 100/10*240)
assign confi_data[12] = 24'h0017_02;  // STATUS PIN ctrl, ground(default), 6ns Antibacklash pulse width
assign confi_data[13] = 24'h0018_06;  // VCO Cal step1
assign confi_data[14] = 24'h0019_40;  // Synchronous reset,P/N delay default
assign confi_data[15] = 24'h001A_00;  // LD ctrl, Digital lock detect (high = lock, low = unlock)

//assign confi_data[16] = 24'h001B_C0;  // enable VCO/ enable REF2/ disable REF1/ REFMON ground
assign confi_data[16] = 24'h001B_A0; // enable VCO/ enable REF1/ disable REF2/ REFMON ground

//assign confi_data[17] = 24'h001C_64;// select REF2/ use REF_SEL pin/ REF1 power off
assign confi_data[17] = 24'h001C_22; // select REF1/ use REF_SEL pin/ REF2 power off

assign confi_data[18] = 24'h001D_08;  // Enable LD pin Comparator
assign confi_data[19] = 24'h001E_00;  // Reserved
assign confi_data[20] = 24'h001F_00;  // read only

////////////////////////////////Fine Delay Adjust: OUT6~OUT9//////////////////////////////////////

assign confi_data[21] = 24'h00A0_01; // OUT6---delay passby / zero delay
assign confi_data[22] = 24'h00A1_00;
assign confi_data[23] = 24'h00A2_00;
assign confi_data[24] = 24'h00A3_01; // OUT7---delay passby / zero delay
assign confi_data[25] = 24'h00A4_00;
assign confi_data[26] = 24'h00A5_00;
assign confi_data[27] = 24'h00A6_01; // OUT8---delay passby / zero delay
assign confi_data[28] = 24'h00A7_00;
assign confi_data[29] = 24'h00A8_00;
assign confi_data[30] = 24'h00A9_01; // OUT9---delay passby / zero delay
assign confi_data[31] = 24'h00AA_00;
assign confi_data[32] = 24'h00AB_00;

///////////////////////////////////LVPECL Outputs,OUT0~OUT5//////////////////////////////////////

assign confi_data[33] = 24'h00F0_08; // OUT0---LVPECL differential voltage : 780mv/ turn on
assign confi_data[34] = 24'h00F1_08; // OUT1---LVPECL differential voltage : 780mv/ turn on
assign confi_data[35] = 24'h00F2_08; // OUT2---LVPECL differential voltage : 780mv/ turn on
assign confi_data[36] = 24'h00F3_08; // OUT3---LVPECL differential voltage : 780mv/ turn on
assign confi_data[37] = 24'h00F4_08; // OUT4---LVPECL differential voltage : 780mv/ turn on
assign confi_data[38] = 24'h00F5_08; // OUT5---LVPECL differential voltage : 780mv/ turn on

//////////////////////////////////////LVDS/CMOS Outputs,OUT6~OUT9///////////////////////////////

assign confi_data[39] = 24'h0140_02; // OUT6---LVDS / CMOSB turn off / turn on output
assign confi_data[40] = 24'h0141_02; // OUT7---LVDS / CMOSB turn off / turn on output
assign confi_data[41] = 24'h0142_02; // OUT8---LVDS / CMOSB turn off / turn on output
assign confi_data[42] = 24'h0143_02; // OUT9---LVDS / CMOSB turn off / turn on output

//////////////////////////////////////LVPECL Channel Dividers//////////////////////////////////
// F = VCO / D / VCO_div
assign confi_data[43] = 24'h0190_22; //Divider0(OUT0~1)--- M=2  N=2  D=N+M+2=6  (output:66.667Mhz)
assign confi_data[44] = 24'h0191_00;
assign confi_data[45] = 24'h0192_00;
assign confi_data[46] = 24'h0193_11; //Divider1(OUT2~3)--- M=1  N=1  D=N+M+2=4  (output:100Mhz)
assign confi_data[47] = 24'h0194_00;
assign confi_data[48] = 24'h0195_00;
assign confi_data[49] = 24'h0196_11; //Divider2(OUT4~5)--- M=1  N=1  D=N+M+2=4  (output:100Mhz)
assign confi_data[50] = 24'h0197_00;
assign confi_data[51] = 24'h0198_00;

/////////////////////////////////////LVDS/CMOS Channel Dividers////////////////////////////////

assign confi_data[52] = 24'h0199_11; //Divider3(OUT6~7)--- M=1  N=1  D1=N+M+2=4 (3.1)
assign confi_data[53] = 24'h019A_00; //                    no phase offset
assign confi_data[54] = 24'h019B_00; //                    M=0  N=0  D2=N+M+2=2 (3.2)
assign confi_data[55] = 24'h019C_20; //                    bypass 3.2 divider / use 3.1 divider (output:100Mhz)
assign confi_data[56] = 24'h019D_00; //                    Enable duty-cycle Correction 
assign confi_data[57] = 24'h019E_11; //Divider4(OUT8~9)--- M=1  N=1  D1=N+M+2=4 (4.1)
assign confi_data[58] = 24'h019F_00; //                    no phase offset
assign confi_data[59] = 24'h01A0_00; //                    M=0  N=0  D2=N+M+2=2 (4.2)
assign confi_data[60] = 24'h01A1_20; //                    bypass 4.2 divider / use 4.1 divider (output:100Mhz)
assign confi_data[61] = 24'h01A2_00; //                    Enable duty-cycle Correction 
assign confi_data[62] = 24'h01A3_00; //Reserved

////////////////////////////////////VCO Divider and CLK Input/////////////////////////////////

assign confi_data[63] = 24'h01E0_04; // VCO divider = 6
assign confi_data[64] = 24'h01E1_02; // Select VCO as input to VCO divider

//////////////////////////////////////////System//////////////////////////////////////////////

assign confi_data[65] = 24'h0230_00; // default
assign confi_data[66] = 24'h0231_00; // Reserved

////////////////////////////////////Updata all registers/////////////////////////////////////

assign confi_data[67] = 24'h0232_01; // Valid

////////////////////////////////////////VCO Cal step2////////////////////////////////////////
assign confi_data[68] = 24'h0018_07; 
assign confi_data[69] = 24'h0232_01; // Valid


//////////////////////////////////////state machine//////////////////////////////////////////

parameter       	 idle                = 0,
					 step1               = 1, 
					 step2               = 2,
					 step3               = 3,  
					 single_reg_select   = 4,
					 reg_select          = 5, 
					 end_state           = 6;

(* fsm_encoding = "user" *)
reg    [2:0]    state;
reg    [6:0]    cnt_reg;
reg    [4:0]    cnt_bit;
reg    [23:0]   data_temp;

reg             sen;
reg             sdata;	
reg             sclk;
reg             config_finished; // active high


always @ (posedge clk or negedge rst_n)begin
	if(!rst_n) begin
		state             <= idle;	
		sen               <= 1'b1;
		sdata             <= 1'b0;
		sclk              <= 1'b0;
		
		cnt_reg           <= 7'b0;
		cnt_bit           <= 5'd23;
		data_temp	      <= 24'b0;	
		config_finished   <= 1'b0;
	end	
	
	else if(!set_ad9516) begin
		state             <= idle;	
		sen               <= 1'b1;
		sdata             <= 1'b0;
		sclk              <= 1'b0;
		
		cnt_reg           <= 7'b0;
		cnt_bit           <= 5'd23;
		data_temp	      <= 24'b0;	
		config_finished   <= 1'b0;
	end
	
	else begin
		case(state)
			idle: begin                         			  
				sen <= 1'b1;
				sdata <= 1'b0;
				sclk <= 1'b0; 
				cnt_reg <= 7'b0;
				cnt_bit <= 5'd23;							  
				state <= step1;	
				data_temp <= 24'b0;	
				config_finished <= 1'b0;                     							  
			end  

			step1: begin
				state <= step2;
				data_temp <= confi_data[cnt_reg];
				sclk <= 1'b0;								
			end

			step2: begin
				state <= step3;
				sen   <= 1'b0;
				sdata <= data_temp[cnt_bit];
				sclk  <= 1'b0;								
			end

			step3: begin
				state <= single_reg_select;
				sclk  <= 1'b1; 
			end

			single_reg_select: begin						 
				if(cnt_bit == 5'd0) begin
					state <= reg_select;
					cnt_bit <= 5'd23;
					sen <= 1'b1;
				end
				
				else begin
					state <= step1;
					cnt_bit <= cnt_bit - 1'b1;
					sen <= 1'b0;
				end						 
			end

			reg_select: begin
				sclk <= 1'b0; 
				sen <= 1'b1;							  
				if(cnt_reg == 7'd69) begin
					state <= end_state;    
					cnt_reg <= 7'b0;									
				end
				
				else begin
					state <= step1;
					cnt_reg <= cnt_reg + 1'b1;
				end								   						  
			end									  

			end_state: begin					
				state <= end_state;
				sclk  <= 1'b0; 
				sen   <= 1'b1;	
				sdata <= 1'b0;
				config_finished <= 1'b1; 
			end							  
			
			default: begin
				state <= idle;
			end
		endcase		
	end
end
	
assign AD_CS   = sen;
assign AD_SCLK = sclk;
assign AD_SDI  = sdata;

reg		[2:0]		AD9516_LD;

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n)
		AD9516_LD <= 3'd0;
	else
		AD9516_LD <= {AD9516_LD[1:0],AD_LD};
end

assign AD9516_cfg_done = & AD9516_LD;

endmodule
