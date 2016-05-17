`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   13:03:08 05/13/2016
// Design Name:   eeprom_wr
// Module Name:   D:/lrh_workspace/projects/simulator_new/fpga_projects/VPX_BRD_SP3AN_CTRL/eeprom_wr_test.v
// Project Name:  VPX_BRD_SP3AN_CTRL
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: eeprom_wr
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module eeprom_wr_test;

	// Inputs
	reg RESET;
	reg CLK;
	reg WR;
	reg RD;
	reg [10:0] ADDR;

	// Outputs
	wire SCL;
	wire ACK;

	// Bidirs
	wire SDA;
	wire [7:0] DATA;
	reg [7:0] DATA_R;
	
	assign	DATA = DATA_R;
	

	// Instantiate the Unit Under Test (UUT)
	eeprom_wr uut (
		.RESET(RESET),
		.CLK(CLK),
		.WR(WR),
		.RD(RD),
		.ADDR(ADDR),
		.SDA(SDA),
		.DATA(DATA),
		.SCL(SCL),
		.ACK(ACK)
	);

	initial begin
		// Initialize Inputs
		RESET = 1;
		CLK = 1;
		WR = 0;
		RD = 0;
		ADDR = 11'h123;
		DATA_R = 8'h45;

		// Wait 100 ns for global reset to finish
		#10;
		RESET = 0;

		// Add stimulus here
		WR = 1;
		#2;
		WR = 0;

	end

	always #1 CLK <= ~CLK;

endmodule
