`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:32 10/5/2015 
// Design Name: 
// Module Name:    params 
// Project Name: 
// Target Devices: X3S400AN-FGG400
// Tool versions:  ISE-14.7
// Description:    1. define of time parameters
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

`define	PowerOn_idle_time				24'h7a120  // 50mhz, 10ms   
`define	PowerOn_time_out				24'h2625a0 // 50mhz, 50ms   
`define	PowerOn_v2p5_time				24'h3d090  // 50mhz, 5ms
`define	PowerOn_pmbs1_time				24'h3d090  // 50mhz, 5ms
`define	PowerOn_pmbs2_time				24'h3d090  // 50mhz, 5ms
`define	PowerOn_v1p8_time				24'h3d090  // 50mhz, 5ms
`define	PowerOn_v1p5_time				24'h3d090  // 50mhz, 5ms
`define	PowerOn_v075_time				24'h3d090  // 50mhz, 5ms
`define	PowerOn_clkg_time				24'h3d090  // 50mhz, 5ms
`define	PowerOn_wait_time				24'h3d090  // 50mhz, 5ms
`define	PowerOff_delay_time				24'h3d090  // 50mhz, 5ms
`define FPGA_ireset_delay_time			16'h61a8   // 50mhz, 0.5ms
`define	debouncer_counter				16'h61a8   // 50mhz, 0.5ms               
`define POR_assert_delay_time			24'h3d090  // 50mhz, 5ms	
`define POR_release_delay_time			24'h64	   // 50mhz, 2us 
`define Resetfull_check_delay_time		24'h61a8   // 50mhz, 0.5ms 
`define Resetfull_assert_delay_time		24'h3d090  // 50mhz, 5ms
`define Resetfull_release_delay_time	24'h64     // 50mhz, 2us
`define Hardreset_check_delay_time		24'h61a8   // 50mhz, 0.5ms 
`define Hardreset_assert_delay_time		24'h3d090  // 50mhz, 5ms
`define Hardreset_release_delay_time	24'h64     // 50mhz, 2us
`define Softreset_check_delay_time		24'h61a8   // 50mhz, 0.5ms
`define Softreset_assert_delay_time		24'h3d090  // 50mhz, 5ms
`define Softreset_release_delay_time	24'h64     // 50mhz, 2us
`define DSP_GPIO_Output_delay_time      16'h0a     // 50mhz, 4 clock delay for boot







