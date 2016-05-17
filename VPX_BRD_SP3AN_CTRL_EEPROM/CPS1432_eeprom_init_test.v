`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:10:38 05/13/2016
// Design Name:   CPS1432_eeprom_init
// Module Name:   D:/lrh_workspace/projects/simulator_new/fpga_projects/VPX_BRD_SP3AN_CTRL/CPS1432_eeprom_init_test.v
// Project Name:  VPX_BRD_SP3AN_CTRL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPS1432_eeprom_init
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPS1432_eeprom_init_test;

	// Inputs
	reg clk;
	reg rst;
	reg cfg_start;

	// Outputs
	wire SCL;

	// Bidirs
	wire SDA;

	// Instantiate the Unit Under Test (UUT)
	CPS1432_eeprom_init uut (
		.clk(clk), 
		.rst(rst), 
		.cfg_start(cfg_start), 
		.SDA(SDA), 
		.SCL(SCL)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		cfg_start = 0;

		// Wait 100 ns for global reset to finish
		#10;
        rst = 0;
		
		// Add stimulus here
		cfg_start = 1;

	end
	
	always #1 clk <= ~clk;
      
endmodule

