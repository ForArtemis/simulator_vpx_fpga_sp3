`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:32 10/5/2015 
// Design Name: 
// Module Name:    vpx_brd_ctrl_core 
// Project Name: 
// Target Devices: X3S400AN-FGG400
// Tool versions:  ISE-14.7
// Description:    1. manage power up and DSP boot configuration as well as SRIO bridge configuration
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

module vpx_brd_ctrl_core
 (
	// system clk	
	main_100mhz_clk_i,   			// FPGA 100MHZ reference clock source
	
	// other PG input except DSP's
	vcc1p0_pgood_i,
	vcc3p3_fmc_pgood_i,
	vcc_vadj_fmc_pgood_i,
	vcc1p2_pgood_i,
	vcc1p8_fpga_pgood_i,
	vcc1p5_fpga_pgood_i,
	vcc0p75_fpga_pgood_i,
	vcc1p0_mgtavcc_pgood_i,
	vcc1p2_mgtavtt_pgood_i,
	vcc3p3_pgood_i,
	
	// DSP SPI Interface, DSP is master and FPGA is slave
	dspa_sspcs1_i,		  			// DSP SPI Chip Select
	dspa_sspck_i,					// DSP SPI clock
	dspa_sspmiso_o,					// DSP SPI data input from FPGA
	dspa_sspmosi_i,         		// DSP SPI data output to FPGA
    
	dspb_sspcs1_i,		  			// DSP SPI Chip Select
	dspb_sspck_i,					// DSP SPI clock
	dspb_sspmiso_o,					// DSP SPI data input from FPGA
	dspb_sspmosi_i,         		// DSP SPI data output to FPGA
	
	// PG input for DSP
	vcc2p5_pgood_i,			
	vcc1p8_dsp_pgood_i,     
	vcc1p5_dsp_pgood_i,	    
	vcc0p75_dsp_pgood_i,	
	
	// sys power good indication
	sys_pgood_o,			
	
	// power enable ctrl for DSP
	vcc2p5_en_o,			
	vcc1p8_dsp_en_o,        
	vcc1p5_dsp_en_o,				
	vcc0p75_dsp_en_o,		
	
	// GPIO for DSP
	dspa_gpio_i,					// DSP GPIO inputs
	dspa_gpio_o,					// DSP GPIO outputs for boot strapping
	dspa_gpio_en,					// DSP GPIO IO control, 1 -> output, 0 -> input
	
	dspb_gpio_i,					// DSP GPIO inputs
	dspb_gpio_o,					// DSP GPIO outputs for boot strapping
	dspb_gpio_en,					// DSP GPIO IO control, 1 -> output, 0 -> input
	
	// RESET	
	full_reset_i,					// full reset button input
	dspa_warm_reset_i,				// warm reset button input for DSPA
	dspb_warm_reset_i,				// warm reset button input for DSPB
	fpga_rst_i,						// FPGA reset input for V7
	fpga_rst_o,						// reset to V7
	dspa_trgrstz_i, 				// trgrst from emulation card
	dspb_trgrstz_i, 				// trgrst from emulation card
	
	// DEBUG LED
	dspa_debug_led_o,				// Debug LEDs
	dspb_debug_led_o,				// Debug LEDs

	// DSP CTRL 
	dspa_porz_o,					// DSP POR
	dspa_resetfullz_o,				// DSP Full Reset
	dspa_resetz_o,					// DSP Reset
	dspa_lresetz_o,					// DSP local reset
	dspa_coresel_o,					// DSP core select
	dspa_resetstat_n_i,				// DSP resetstat
	dspa_nmiz_o,					// DSP NMI
	dspa_lresetnmienz_o,			// DSP Lreset and NMI enable
	dspa_bootcomplete_i,            // DSP boot complete indication
	dspa_paclksel_o,				// DSP PA clock select
	dspa_hout_i,					// DSP HOUT
	dspa_sysclkout_i,				// DSP SYSCLKOUT
	dspa_timi0_o,					// DSP Timier 0 and PCIESSEN boot strapping
	
	dspb_porz_o,					// DSP POR
	dspb_resetfullz_o,				// DSP Full Reset
	dspb_resetz_o,					// DSP Reset
	dspb_lresetz_o,					// DSP local reset
	dspb_coresel_o,					// DSP core select
	dspb_resetstat_n_i,				// DSP resetstat
	dspb_nmiz_o,					// DSP NMI
	dspb_lresetnmienz_o,			// DSP Lreset and NMI enable
	dspb_bootcomplete_i,            // DSP boot complete indication
	dspb_paclksel_o,				// DSP PA clock select
	dspb_hout_i,					// DSP HOUT
	dspb_sysclkout_i,				// DSP SYSCLKOUT
	dspb_timi0_o,					// DSP Timier 0 and PCIESSEN boot strapping
	
	// PHY Interface	
	dspa_phy_int_n_i,				// PHY Interrupt
	dspa_phy_rst_n_o,				// PHY reset
	
	dspb_phy_int_n_i,				// PHY Interrupt
	dspb_phy_rst_n_o,				// PHY reset
	
	// UCD9222 Interface
	dspa_ucd9222_pg1_i,				// ucd9222 #1 power good and also for the CVDD DSP core power good
	dspa_ucd9222_pg2_i,				// ucd9222 #2 power good and also for the VCC1V0 DSP core power good
	dspa_ucd9222_ena1_o,   			// ucd9222 #1 power and the CVDD DSP core power enable
	dspa_ucd9222_ena2_o,			// ucd9222 #2 power and the VCC1V0 DSP core power enable
	dspa_pgucd9222_i,				// both ucd9222 and the VCC1V0/CVDD DSP core power are valid
	dspa_ucd9222_rst_n_o,			// ucd9222 reset
	
	dspb_ucd9222_pg1_i,				// ucd9222 #1 power good and also for the CVDD DSP core power good
	dspb_ucd9222_pg2_i,				// ucd9222 #2 power good and also for the VCC1V0 DSP core power good
	dspb_ucd9222_ena1_o,   			// ucd9222 #1 power and the CVDD DSP core power enable
	dspb_ucd9222_ena2_o,			// ucd9222 #2 power and the VCC1V0 DSP core power enable
	dspb_pgucd9222_i,				// both ucd9222 and the VCC1V0/CVDD DSP core power are valid
	dspb_ucd9222_rst_n_o,			// ucd9222 reset
	
	// Smart-Reflex
	dspa_pca9306_en_o,				// smart-reflex buffer enable
	dspb_pca9306_en_o,				// smart-reflex buffer enable

	// MISC CTRL
	dspa_nand_wp_o,					// NAND flash write protect
	dspa_nor_wp_n_o,				// NOR flash write protect
	dspa_eeprom_wp_o,				// EEPROM write protect

	dspb_nand_wp_o,					// NAND flash write protect
	dspb_nor_wp_n_o,				// NOR flash write protect
	dspb_eeprom_wp_o,				// EEPROM write protect
	
	// VID OE CONTROL			
    dspa_vid_oe_n_o, 
	dspb_vid_oe_n_o, 

	// CLOCK Generator Interface for AD9516
	// AD9516_1
	ad9516_1_clock_reset_o,
	ad9516_1_cs_o, 
	ad9516_1_pd_o,
	ad9516_1_refsel_o,
	ad9516_1_sclk_o,
	ad9516_1_sdi_o,
	ad9516_1_ld_i,
	// AD9516_2
	ad9516_2_clock_reset_o,
	ad9516_2_cs_o, 
	ad9516_2_pd_o,
	ad9516_2_refsel_o,
	ad9516_2_sclk_o,
	ad9516_2_sdi_o,
	ad9516_2_ld_i,
	
	// SP3AN debug LEDs
	sp3an_debug_led_o,
	front_led_o,

	// CPS1432 Interface 
	sw_fsel_o,
	sw_qfg_o,
	srio_rst_n_o,
	sw_spd_o,

	// FMC CTRL
	fmc1_pg_c2m_o,
	fmc2_pg_c2m_o,
	
	// DSP TSIP
	dspa_tsip0_fsa0_o,
	dspa_tsip0_clka0_o,
	dspb_tsip0_fsa0_o,
	dspb_tsip0_clka0_o
 );

// ========================================================
// system clk and PG input except for DSP's
// ========================================================
 
input			main_100mhz_clk_i;

input   		vcc1p0_pgood_i;
input   		vcc3p3_fmc_pgood_i;
input   		vcc_vadj_fmc_pgood_i;
input   		vcc1p2_pgood_i;
input   		vcc1p8_fpga_pgood_i;
input   		vcc1p5_fpga_pgood_i;
input   		vcc0p75_fpga_pgood_i;
input   		vcc1p0_mgtavcc_pgood_i;
input   		vcc1p2_mgtavtt_pgood_i;
input   		vcc3p3_pgood_i;
 
// ========================================================
// DSP SPI Interface, DSP is master and FPGA is slave
// ========================================================
input			dspa_sspcs1_i;
input			dspa_sspck_i;
output			dspa_sspmiso_o;
input			dspa_sspmosi_i;

input			dspb_sspcs1_i;
input			dspb_sspck_i;
output			dspb_sspmiso_o;
input			dspb_sspmosi_i;

// ========================================================
// Power ctrl for DSP
// ========================================================

input			vcc2p5_pgood_i;
input			vcc1p8_dsp_pgood_i;
input			vcc1p5_dsp_pgood_i;
input			vcc0p75_dsp_pgood_i;

output			sys_pgood_o;

output			vcc2p5_en_o;
output			vcc1p8_dsp_en_o;
output			vcc1p5_dsp_en_o;
output			vcc0p75_dsp_en_o;

reg				vcc2p5_en_o;
reg				vcc1p8_dsp_en_o;
reg				vcc1p5_dsp_en_o;
reg				vcc0p75_dsp_en_o;

// ========================================================
// DSP GPIO
// ========================================================

input	[15:0]	dspa_gpio_i;
output	[15:0]	dspa_gpio_o;
output			dspa_gpio_en;

reg   			dspa_gpio_en;
reg 	[15:0]  dspa_gpio_ctrl_delay;

input	[15:0]	dspb_gpio_i;
output	[15:0]	dspb_gpio_o;
output			dspb_gpio_en;

reg   			dspb_gpio_en;
reg 	[15:0]  dspb_gpio_ctrl_delay;

// ========================================================
// RESET input
// ========================================================

input			full_reset_i;
input			dspa_warm_reset_i;
input			dspb_warm_reset_i;
input			fpga_rst_i;
input       	dspa_trgrstz_i;
input       	dspb_trgrstz_i;

output			fpga_rst_o;

wire			full_reset_i_f;
wire			dspa_warm_reset_i_f;
wire			dspb_warm_reset_i_f;
wire			fpga_rst_i_f;

// ========================================================
// DEBUG LEDs
// ========================================================

output	[3:0]	dspa_debug_led_o;
output	[3:0]	dspb_debug_led_o;

// ========================================================
// DSP Interface & CONTROL  
// ========================================================

output			dspa_porz_o;
output			dspa_resetfullz_o;
output			dspa_resetz_o;
output			dspa_lresetz_o;
input			dspa_resetstat_n_i;
output			dspa_lresetnmienz_o;
output	[3:0]	dspa_coresel_o;
output			dspa_nmiz_o;
output			dspa_paclksel_o;
input			dspa_hout_i;
input			dspa_bootcomplete_i;
input			dspa_sysclkout_i;
output 			dspa_timi0_o; 

reg 			dspa_timi0_o;

output			dspb_porz_o;
output			dspb_resetfullz_o;
output			dspb_resetz_o;
output			dspb_lresetz_o;
input			dspb_resetstat_n_i;
output			dspb_lresetnmienz_o;
output	[3:0]	dspb_coresel_o;
output			dspb_nmiz_o;
output			dspb_paclksel_o;
input			dspb_hout_i;
input			dspb_bootcomplete_i;
input			dspb_sysclkout_i;
output 			dspb_timi0_o; 

reg 			dspb_timi0_o;

// ========================================================
// PHY Interface  
// ========================================================

input			dspa_phy_int_n_i;
output			dspa_phy_rst_n_o;

input			dspb_phy_int_n_i;
output			dspb_phy_rst_n_o;

// ========================================================
// UCD9222 Interface 
// ========================================================

input			dspa_ucd9222_pg1_i;
input			dspa_ucd9222_pg2_i;
output			dspa_ucd9222_ena1_o;
output			dspa_ucd9222_ena2_o;
input			dspa_pgucd9222_i;
output			dspa_ucd9222_rst_n_o;

reg				dspa_ucd9222_ena1_o;
reg				dspa_ucd9222_ena2_o;
reg				dspa_ucd9222_rst_n_o;

input			dspb_ucd9222_pg1_i;
input			dspb_ucd9222_pg2_i;
output			dspb_ucd9222_ena1_o;
output			dspb_ucd9222_ena2_o;
input			dspb_pgucd9222_i;
output			dspb_ucd9222_rst_n_o;

reg				dspb_ucd9222_ena1_o;
reg				dspb_ucd9222_ena2_o;
reg				dspb_ucd9222_rst_n_o;	

// ========================================================
// Smart-Reflex  
// ========================================================

output			dspa_pca9306_en_o;
output			dspb_pca9306_en_o;

// ========================================================
// MISC CTRL 
// ========================================================

output			dspa_nand_wp_o;
output			dspa_nor_wp_n_o;
output			dspa_eeprom_wp_o;

output			dspb_nand_wp_o;
output			dspb_nor_wp_n_o;
output			dspb_eeprom_wp_o;

// ========================================================
// VID OE CONTROL 
// ========================================================

output 			dspa_vid_oe_n_o;
reg 			dspa_vid_oe_n_o = 1'b1;

output 			dspb_vid_oe_n_o;
reg 			dspb_vid_oe_n_o = 1'b1;

// ========================================================
// CLOCK GEN Interface 
// ========================================================

// AD9516_1
output			ad9516_1_clock_reset_o;
output			ad9516_1_cs_o;
output			ad9516_1_pd_o;
output			ad9516_1_refsel_o;
output			ad9516_1_sclk_o;
output			ad9516_1_sdi_o;
input			ad9516_1_ld_i;

// AD9516_2
output			ad9516_2_clock_reset_o;
output			ad9516_2_cs_o;
output			ad9516_2_pd_o;
output			ad9516_2_refsel_o;
output			ad9516_2_sclk_o;
output			ad9516_2_sdi_o;
input			ad9516_2_ld_i;

wire			ad9516_1_cfg_done;
wire			ad9516_2_cfg_done;

// ========================================================
// SP3AN debug LEDs  
// ========================================================

output	[7:0]	sp3an_debug_led_o;
output	[1:0]	front_led_o;

// ========================================================
// CPS1432 Interface  
// ========================================================

output	[1:0]	sw_fsel_o;
output	[7:0]	sw_qfg_o;
output			srio_rst_n_o;
output	[2:0]	sw_spd_o;

reg				srio_rst_n_o;

// ========================================================
// FMC CTRL 
// ========================================================

output			fmc1_pg_c2m_o;
output			fmc2_pg_c2m_o;

// ========================================================
// DSP TSIP Interface 
// ========================================================

output			dspa_tsip0_fsa0_o;
output			dspa_tsip0_clka0_o;
output			dspb_tsip0_fsa0_o;
output			dspb_tsip0_clka0_o;

reg			    dspa_tsip0_fsa0_o;
reg			    dspa_tsip0_clka0_o;
reg			    dspb_tsip0_fsa0_o;
reg			    dspb_tsip0_clka0_o;

// ========================================================
// Internal Signals 
// ========================================================

// FPGA internal reset 
wire			fpga_ireset_n; 		       

// DSP to FPGA configuration register map, 0x0 - 0x7 = 64 bit
reg		[63:0]	dspa_spi_reg = 64'b0; 
reg		[63:0]	dspb_spi_reg = 64'b0; 

// configuration register read data
reg		[7:0]	dspa_spi_r;            
reg		[7:0]	dspb_spi_r;            

// Power Sequence State-Machine
(* fsm_encoding = "user" *)
reg		[3:0]	PW_SM;		            

parameter 		SM_IDLE	  = 4'h0; 
parameter 		SM_V2P5	  = 4'h1; 
parameter 		SM_PMBS_1 = 4'h2; 
parameter 		SM_PMBS_2 = 4'h3; 
parameter 		SM_V1P8	  = 4'h4; 
parameter 		SM_V1P5	  = 4'h5; 
parameter 		SM_V075	  = 4'h6; 
parameter 		SM_CLKG	  = 4'h7;
parameter 		SM_PORWR  = 4'h8; 
parameter 		SM_WAIT	  = 4'h9; 
parameter 		SM_PWOK	  = 4'ha; 
parameter 		SM_POFF1  = 4'hb;
parameter 		SM_POFF2  = 4'hc;
parameter 		SM_FAIL	  = 4'hd;   

reg		[23:0]	PW_c;
reg		[23:0]	PW_time_out;
reg				all_power;
reg				pg_ex_dsp;

// ctrl for AD9516
reg				set_ad9516;

// for DSP TIMER0
reg				half_clk;

// power good signals sync to 50MHz clock
reg     [1:0]   vcc1p0_pgood_d;
reg     [1:0]   vcc3p3_fmc_pgood_d;
reg     [1:0]   vcc_vadj_fmc_pgood_d;
reg     [1:0]   vcc1p2_pgood_d;
reg     [1:0]   vcc1p8_fpga_pgood_d;
reg     [1:0]   vcc1p5_fpga_pgood_d;
reg     [1:0]   vcc0p75_fpga_pgood_d;
reg     [1:0]   vcc1p0_mgtavcc_pgood_d;
reg     [1:0]   vcc1p2_mgtavtt_pgood_d;
reg     [1:0]   vcc3p3_pgood_d;
reg 	[1:0] 	vcc2p5_pgood_d;
reg 	[1:0] 	vcc1p8_dsp_pgood_d;
reg 	[1:0] 	vcc1p5_dsp_pgood_d;
reg 	[1:0] 	vcc0p75_dsp_pgood_d;
reg 	[1:0] 	dspa_ucd9222_pg1_d;
reg 	[1:0] 	dspa_ucd9222_pg2_d;
reg 	[1:0] 	dspa_pgucd9222_d;
reg 	[1:0] 	dspb_ucd9222_pg1_d;
reg 	[1:0] 	dspb_ucd9222_pg2_d;
reg 	[1:0] 	dspb_pgucd9222_d;

reg 	[1:0] 	ad9516_1_ld_d;
reg 	[1:0] 	ad9516_2_ld_d;

reg 	[1:0] 	dspa_resetstat_nd;
reg 	[1:0] 	dspb_resetstat_nd;

reg     [15:0]	dspa_bm_gpio;     
reg		[15:0]	dspa_gpio;
reg     [15:0]	dspb_bm_gpio;     
reg		[15:0]	dspb_gpio;

// for DSP MISC's status SPI read, sync to DSP SPI clock
reg				dspa_phy_int_n_s1;
reg				dspa_phy_int_n_s2;
reg				dspb_phy_int_n_s1;
reg				dspb_phy_int_n_s2;
reg				fpga_rst_n_s1;
reg				fpga_rst_n_s2;
reg				dspa_warm_reset_s1;
reg				dspa_warm_reset_s2;
reg				dspb_warm_reset_s1;
reg				dspb_warm_reset_s2;
reg				full_reset_s1; 
reg				full_reset_s2; 
reg				dspa_trgrstz_s1;
reg				dspa_trgrstz_s2;
reg				dspb_trgrstz_s1;
reg				dspb_trgrstz_s2;
reg				dspa_resetstat_n; 
reg             dspa_bootcomplete_s1;
reg             dspa_bootcomplete_s2;
reg             dspa_sysclkout_s1;
reg             dspa_sysclkout_s2;
reg             dspa_hout_s1;
reg             dspa_hout_s2;
reg				dspb_resetstat_n; 
reg             dspb_bootcomplete_s1;
reg             dspb_bootcomplete_s2;
reg             dspb_sysclkout_s1;
reg             dspb_sysclkout_s2;
reg             dspb_hout_s1;
reg             dspb_hout_s2;

// for ctrl sync to main_50mhz_clk clock
reg				fullreset_n_50s1;		
reg				fullreset_n_50s2;		
reg				dspa_warmreset_n_50s1;			
reg				dspa_warmreset_n_50s2;
reg				dspb_warmreset_n_50s1;			
reg				dspb_warmreset_n_50s2;	
reg				dspa_resetstat_n_50s1;
reg				dspa_resetstat_n_50s2;
reg				dspb_resetstat_n_50s1;
reg				dspb_resetstat_n_50s2;
reg				dspa_trgrstz_50s1;
reg				dspa_trgrstz_50s2;	
reg				dspb_trgrstz_50s1;
reg				dspb_trgrstz_50s2;
reg				fpga_rst_n_50s1;
reg				fpga_rst_n_50s2;	

reg				por_req_n;  		
reg				resetfull_req_n;	
reg	    		dspa_softreset_req_n;	
reg	    		dspb_softreset_req_n;	

// POR FULL WARM reset     
wire    		dspa_por_out_n;			
wire    		dspa_resetfull_out_n;	
wire    		dspa_reset_out_n;		
wire    		dspb_por_out_n;			
wire    		dspb_resetfull_out_n;	
wire    		dspb_reset_out_n;

// DSP SPI interface
wire 			dspa_spi_rw;
wire 			dspa_spi_cs;
wire 			dspa_spi_rdy;
wire	[7:0]	dspa_spi_w;
wire	[7:0]	dspa_spi_a;
wire 			dspb_spi_rw;
wire 			dspb_spi_cs;
wire 			dspb_spi_rdy;
wire	[7:0]	dspb_spi_w;
wire	[7:0]	dspb_spi_a;

wire			power_fail_check;

// ========================================================
// Inst of clock_DCM module
// ========================================================

wire 			main_50mhz_clk;	
wire			DCM_locked;
wire			clk_10mhz;


CLK_DCM Inst_CLK_DCM
 (
    .U1_CLKIN_IN		(		main_100mhz_clk_i	), 
    .U1_RST_IN			(		1'b0				), 
    .U1_CLKDV_OUT		(		main_50mhz_clk		), 
    .U1_CLKIN_IBUFG_OUT	(							), 
    .U1_CLK0_OUT		(							), 
    .U2_CLKDV_OUT		(		clk_10mhz			), 
    .U2_CLK0_OUT		(							), 
    .U2_LOCKED_OUT		(		DCM_locked			)
 );

// ========================================================
// fpga_rst_o 
// ========================================================

reg		[7:0]	rst_r;
always @ (posedge main_50mhz_clk or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n) 
		rst_r <= 8'hff;
	else 
		rst_r <= {rst_r[6:0], fpga_rst_n_50s2};
end

assign  fpga_rst_o  = &rst_r;

// ========================================================
// SP3AN debug LEDs  
// ========================================================

assign	front_led_o[0]	=	ad9516_1_cfg_done & ad9516_2_cfg_done;
assign	front_led_o[1]	=	all_power;

reg		[25:0]		debug_led_cnt;
always @ (posedge clk_10mhz or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n)
		debug_led_cnt <= 26'b0;
	else if(all_power)
		debug_led_cnt <= debug_led_cnt + 1'b1;
	else	
		debug_led_cnt <= 26'b0;
end

assign	sp3an_debug_led_o = debug_led_cnt[25:18];

// ========================================================
// CPS1432 configuration 
// ========================================================

assign 	sw_fsel_o	= 	2'b11;  // input clk 156.25MHZ, Internal core clk 312.5MHZ	
assign	sw_spd_o	=	3'b101; // 000 -> 1.25G, 001 -> 2.5G, 01X -> 5G, 101 -> 3.125G, 11X -> 6.25G
assign  sw_qfg_o	=   8'b0;   // all port in x4 mode, lane to port map is updated via relative registers

always @ (posedge main_50mhz_clk or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n)
		srio_rst_n_o <= 1'b0;
	else if(all_power)
		srio_rst_n_o <= 1'b1;
	else
		srio_rst_n_o <= 1'b0;
end 

// ========================================================
// FMC CTRL 
// ========================================================

assign	fmc1_pg_c2m_o = all_power;
assign	fmc2_pg_c2m_o = all_power;

// ========================================================
// DSP TSIP 
// ========================================================

reg		[2:0]	clk_div;
reg		[7:0]	fs_cnt;

always @ (posedge main_50mhz_clk or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n)
		clk_div <= 2'b0;
	else if(clk_div == 2'd2)
		clk_div <= 2'b0;
	else
		clk_div <= clk_div + 1'b1;
end

always @ (posedge main_50mhz_clk or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n) begin
		dspa_tsip0_clka0_o <= 1'b0;
		dspb_tsip0_clka0_o <= 1'b0;
	end
	else if(clk_div == 2'd2) begin
		dspa_tsip0_clka0_o <= ~ dspa_tsip0_clka0_o;
		dspb_tsip0_clka0_o <= ~ dspb_tsip0_clka0_o;
	end
	else begin
		dspa_tsip0_clka0_o <= dspa_tsip0_clka0_o;
		dspb_tsip0_clka0_o <= dspb_tsip0_clka0_o;
	end
end

always @ (posedge dspa_tsip0_clka0_o or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n)
		fs_cnt <= 8'b0;
	else if(fs_cnt == 8'h7f)
		fs_cnt <= 8'b0;
	else
		fs_cnt <= fs_cnt + 1'b1;
end

always @ (posedge dspa_tsip0_clka0_o or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n) begin
		dspa_tsip0_fsa0_o <= 1'b0;
		dspb_tsip0_fsa0_o <= 1'b0;
	end
	else if(fs_cnt == 8'h7f) begin
		dspa_tsip0_fsa0_o <= 1'b1;
		dspb_tsip0_fsa0_o <= 1'b1;
	end
	else begin
		dspa_tsip0_fsa0_o <= 1'b0;
		dspb_tsip0_fsa0_o <= 1'b0;
	end
end

// ========================================================
// DSP Ctrl Assignments 
// ========================================================

// Select for the target core for LRESET and NMI
assign 	dspa_coresel_o = 4'h0;
assign 	dspb_coresel_o = 4'h0;

// Network Coprocessor (PASS PLL) input clock select
// 0 = CORECLK is used as the input to PASS PLL
// 1 = PASSCLK is used as the input to PASS PLL
assign 	dspa_paclksel_o = 1'b1;  
assign 	dspb_paclksel_o = 1'b1; 

// Enable for core selects
assign 	dspa_lresetnmienz_o = (PW_SM >= 4'h7 && PW_SM <= 4'ha) ? 1'b1 : 1'b0;
assign 	dspb_lresetnmienz_o = (PW_SM >= 4'h7 && PW_SM <= 4'ha) ? 1'b1 : 1'b0;

// Non-maskable Interrupt
assign 	dspa_nmiz_o = (PW_SM >= 4'h7 && PW_SM <= 4'hb) ? 1'b1 : 1'b0;
assign 	dspb_nmiz_o = (PW_SM >= 4'h7 && PW_SM <= 4'hb) ? 1'b1 : 1'b0;

// Warm Reset
assign 	dspa_lresetz_o = (PW_SM >= 4'h7 && PW_SM <= 4'hb) ? 1'b1 : 1'b0;
assign 	dspb_lresetz_o = (PW_SM >= 4'h7 && PW_SM <= 4'hb) ? 1'b1 : 1'b0;

// Power-on Reset
assign 	dspa_porz_o = (PW_SM >= 4'h8 && PW_SM <= 4'ha) ? dspa_por_out_n : 1'b0;
assign 	dspb_porz_o = (PW_SM >= 4'h8 && PW_SM <= 4'ha) ? dspb_por_out_n : 1'b0;

// Full Reset
assign 	dspa_resetfullz_o = (PW_SM >= 4'h9 && PW_SM <= 4'hb) ? dspa_resetfull_out_n : 1'b0;
assign 	dspb_resetfullz_o = (PW_SM >= 4'h9 && PW_SM <= 4'hb) ? dspb_resetfull_out_n : 1'b0;

// Warm Reset of non isolated portion on the IC
assign 	dspa_resetz_o = (PW_SM >= 4'h7 && PW_SM <= 4'hb) ? dspa_reset_out_n: 1'b0;
assign 	dspb_resetz_o = (PW_SM >= 4'h7 && PW_SM <= 4'hb) ? dspb_reset_out_n: 1'b0;

// Power up fail
assign  power_fail_check = (PW_SM == 4'hb || PW_SM == 4'hc || PW_SM == 4'hd)? 1'b1 : 1'b0;   

assign	sys_pgood_o = all_power;

// boot configuration
// GPIO[0]     : LENDIAN, 1 -> Little Endian, 0 -> Big Endian
// GPIO[3:1]   : BOOT DEVICE
//               000 = EMIF16
//               001 = SRIO
//               010 = SGMII(PA driven from core clk)
//               011 = SGMII(PA driven from PA clk)
//               100 = PCIe
//               101 = I2C
//               110 = SPI
//               111 = HyperLink
// GPIO[10:4]  : BOOT CFG
// GPIO[13:11] : PLL/I2C
// GPIO[15:14] : PCIESSMODE

//assign	dspa_gpio_o = 16'b0000_1000_0000_1011;  // No boot:16'h1; I2C:16'h82b; EMIF:16'h201;
assign	dspa_gpio_o = 16'h0001;  // No boot:16'h1; I2C:16'h82b; EMIF:16'h201;
//assign	dspb_gpio_o = 16'b0000_1000_0000_1011;  // No boot:16'h1; I2C:16'h82b; EMIF:16'h201;
assign	dspb_gpio_o = 16'h0001;  // No boot:16'h1; I2C:16'h82b; EMIF:16'h201;

// 0x04h = Debug LED
assign	dspa_debug_led_o = (power_fail_check) ? 4'h0 : dspa_spi_reg[35:32];								
assign	dspb_debug_led_o = (power_fail_check) ? 4'h0 : dspb_spi_reg[35:32];								

// 0x05h = PHY Control, 0 -> reset
assign 	dspa_phy_rst_n_o = (dspa_porz_o == 1'b1 && dspa_resetfullz_o == 1'b1) ? dspa_spi_reg[41] : 1'b0; 
assign 	dspb_phy_rst_n_o = (dspb_porz_o == 1'b1 && dspb_resetfullz_o == 1'b1) ? dspb_spi_reg[41] : 1'b0; 

// 0x07h = Miscellaneous
// 0 -> write protect
assign 	dspa_nand_wp_o = (PW_SM == 4'ha && dspa_resetstat_n_i == 1'b1 && dspa_gpio_en == 1'b0) ? dspa_spi_reg[56] : 1'b0;
assign 	dspb_nand_wp_o = (PW_SM == 4'ha && dspb_resetstat_n_i == 1'b1 && dspb_gpio_en == 1'b0) ? dspb_spi_reg[56] : 1'b0;
// 0 -> write protect
assign 	dspa_nor_wp_n_o = (PW_SM ==4'ha && dspa_resetstat_n_i == 1'b1 && dspa_gpio_en == 1'b0) ? dspa_spi_reg[57] : 1'b0;
assign 	dspb_nor_wp_n_o = (PW_SM ==4'ha && dspb_resetstat_n_i == 1'b1 && dspb_gpio_en == 1'b0) ? dspb_spi_reg[57] : 1'b0;

// 1 -> write protect
assign 	dspa_eeprom_wp_o = (PW_SM == 4'ha && dspa_resetstat_n_i == 1'b1 && dspa_gpio_en == 1'b0) ? dspa_spi_reg[58] : 1'b1;
assign 	dspa_pca9306_en_o = (PW_SM == 4'ha) ? dspa_spi_reg[59] : 1'b0;
assign 	dspb_eeprom_wp_o = (PW_SM == 4'ha && dspb_resetstat_n_i==1'b1 && dspb_gpio_en == 1'b0) ? dspb_spi_reg[58] : 1'b1;
assign 	dspb_pca9306_en_o = (PW_SM == 4'ha) ? dspb_spi_reg[59] : 1'b0;
 
// ========================================================
// Inst of AD9516 module
// ========================================================

ad9516_a Inst_ad9516_a 
 (
    .clk				(	clk_10mhz				), 
    .rst_n				(	fpga_ireset_n			), 
    .set_ad9516			(	set_ad9516				), 
    .AD_CLOCK_RESET		(	ad9516_1_clock_reset_o	), 
    .AD_CS				(	ad9516_1_cs_o			), 
    .AD_PD				(	ad9516_1_pd_o			), 
    .AD_REFSEL			(	ad9516_1_refsel_o		), 
    .AD_SCLK			(	ad9516_1_sclk_o			), 
    .AD_SDI				(	ad9516_1_sdi_o			), 
    .AD_LD				(	ad9516_1_ld_i			), 
    .AD9516_cfg_done	(	ad9516_1_cfg_done		)
 ); 
 
 
ad9516_b Inst_ad9516_b 
 (
    .clk				(	clk_10mhz				), 
    .rst_n				(	fpga_ireset_n			), 
    .set_ad9516			(	set_ad9516				), 
    .AD_CLOCK_RESET		(	ad9516_2_clock_reset_o	), 
    .AD_CS				(	ad9516_2_cs_o			), 
    .AD_PD				(	ad9516_2_pd_o			), 
    .AD_REFSEL			(	ad9516_2_refsel_o		), 
    .AD_SCLK			(	ad9516_2_sclk_o			), 
    .AD_SDI				(	ad9516_2_sdi_o			), 
    .AD_LD				(	ad9516_2_ld_i			), 
    .AD9516_cfg_done	(	ad9516_2_cfg_done		)
 ); 

// ========================================================
// Inst of fpga_internal_reset module
// ========================================================

fpga_internal_reset Inst_i_reset
 (
    .clk				(	main_50mhz_clk		), 
    .rst_n				(	DCM_locked			), 
    .fpga_reset_n		(	fpga_ireset_n		)
 );

// ========================================================
// Inst of dsp_spi module
// ========================================================

// DSPA's SPI interface
dsp_spi Inst_dspa_spi
 (	
    .cs				(	dspa_spi_cs		), 
    .rw				(	dspa_spi_rw		), 
    .addr			(	dspa_spi_a		), 
    .data_w			(	dspa_spi_w		), 
    .data_r			(	dspa_spi_r		), 
    .rdy			(	dspa_spi_rdy	), 
    .DSP_SSEL1		(	dspa_sspcs1_i	), 
    .DSP_SCK1		(	dspa_sspck_i	), 
    .DSP_MISO1		(	dspa_sspmiso_o	), 
    .DSP_MOSI1		(	dspa_sspmosi_i	), 
    .wr_event_cng	(	wr_event_cng_a	)
 );

reg 		wr_cng_1t_a = 1'b0;
reg 		wr_cng_2t_a = 1'b0;
reg 		wr_cng_3t_a = 1'b0;
wire 		wr_event_pulse_a;

always @(posedge main_50mhz_clk or negedge fpga_ireset_n) begin		
	if (~fpga_ireset_n) begin
		wr_cng_1t_a <= 1'b0;
		wr_cng_2t_a <= 1'b0;
		wr_cng_3t_a <= 1'b0;
	end
	else begin
		wr_cng_1t_a <= wr_event_cng_a;
		wr_cng_2t_a <= wr_cng_1t_a;
		wr_cng_3t_a <= wr_cng_2t_a;
	end
end
assign wr_event_pulse_a = wr_cng_2t_a ^ wr_cng_3t_a;

// DSPB's SPI interface
dsp_spi Inst_dspb_spi
 (	
    .cs				(	dspb_spi_cs		), 
    .rw				(	dspb_spi_rw		), 
    .addr			(	dspb_spi_a		), 
    .data_w			(	dspb_spi_w		), 
    .data_r			(	dspb_spi_r		), 
    .rdy			(	dspb_spi_rdy	), 
    .DSP_SSEL1		(	dspb_sspcs1_i	), 
    .DSP_SCK1		(	dspb_sspck_i	), 
    .DSP_MISO1		(	dspb_sspmiso_o	), 
    .DSP_MOSI1		(	dspb_sspmosi_i	), 
    .wr_event_cng	(	wr_event_cng_b	)
 );

reg 		wr_cng_1t_b = 1'b0;
reg 		wr_cng_2t_b = 1'b0;
reg 		wr_cng_3t_b = 1'b0;
wire 		wr_event_pulse_b;

always @(posedge main_50mhz_clk or negedge fpga_ireset_n) begin		
	if (~fpga_ireset_n) begin
		wr_cng_1t_b <= 1'b0;
		wr_cng_2t_b <= 1'b0;
		wr_cng_3t_b <= 1'b0;
	end
	else begin
		wr_cng_1t_b <= wr_event_cng_b;
		wr_cng_2t_b <= wr_cng_1t_b;
		wr_cng_3t_b <= wr_cng_2t_b;
	end
end
assign wr_event_pulse_b = wr_cng_2t_b ^ wr_cng_3t_b;


// ========================================================
// Inst of debouncer module
// ========================================================

debouncer Inst_debouncer_1( main_50mhz_clk, fpga_ireset_n, full_reset_i,      full_reset_i_f      );
debouncer Inst_debouncer_2( main_50mhz_clk, fpga_ireset_n, dspa_warm_reset_i, dspa_warm_reset_i_f );
debouncer Inst_debouncer_3( main_50mhz_clk, fpga_ireset_n, dspb_warm_reset_i, dspb_warm_reset_i_f );
debouncer Inst_debouncer_4( main_50mhz_clk, fpga_ireset_n, fpga_rst_i,        fpga_rst_i_f        );

// ========================================================
// synch process of ctrl signals
// ========================================================

always @(posedge main_50mhz_clk or negedge fpga_ireset_n) begin
	if (~fpga_ireset_n) begin 
		fullreset_n_50s1 <= 1'b1;
		fullreset_n_50s2 <= 1'b1;
		dspa_warmreset_n_50s1 <= 1'b1;
		dspa_warmreset_n_50s2 <= 1'b1;
		dspb_warmreset_n_50s1 <= 1'b1;
		dspb_warmreset_n_50s2 <= 1'b1;
		dspa_resetstat_n_50s1 <= 1'b1;
		dspa_resetstat_n_50s2 <= 1'b1;
		dspa_trgrstz_50s1 <= 1'b1;
		dspa_trgrstz_50s2 <= 1'b1;	
		dspb_resetstat_n_50s1 <= 1'b1;
		dspb_resetstat_n_50s2 <= 1'b1;
		dspb_trgrstz_50s1 <= 1'b1;
		dspb_trgrstz_50s2 <= 1'b1;	
		fpga_rst_n_50s1 <= 1'b1;
		fpga_rst_n_50s2 <= 1'b1;
		por_req_n <= 1'b1;
		resetfull_req_n <= 1'b1;
		dspa_softreset_req_n <= 1'b1;	
		dspb_softreset_req_n <= 1'b1;
	end	
	else begin 
		fullreset_n_50s1 <= full_reset_i_f;
		fullreset_n_50s2 <= fullreset_n_50s1;
		dspa_warmreset_n_50s1 <= dspa_warm_reset_i_f;
		dspa_warmreset_n_50s2 <= dspa_warmreset_n_50s1;
		dspb_warmreset_n_50s1 <= dspb_warm_reset_i_f;
		dspb_warmreset_n_50s2 <= dspb_warmreset_n_50s1;
		dspa_resetstat_n_50s1 <= dspa_resetstat_n_i;
		dspa_resetstat_n_50s2 <= dspa_resetstat_n_50s1;
		dspa_trgrstz_50s1 <= dspa_trgrstz_i;
		dspa_trgrstz_50s2 <= dspa_trgrstz_50s1;	
		dspb_resetstat_n_50s1 <= dspb_resetstat_n_i;
		dspb_resetstat_n_50s2 <= dspb_resetstat_n_50s1;
		dspb_trgrstz_50s1 <= dspb_trgrstz_i;
		dspb_trgrstz_50s2 <= dspb_trgrstz_50s1;	
		fpga_rst_n_50s1 <= fpga_rst_i_f;
		fpga_rst_n_50s2 <= fpga_rst_n_50s1;
		por_req_n <= 1'b1; 
	    resetfull_req_n <= fullreset_n_50s2; 
		dspa_softreset_req_n <= dspa_warmreset_n_50s2 & dspa_trgrstz_50s2;
		dspb_softreset_req_n <= dspb_warmreset_n_50s2 & dspb_trgrstz_50s2; 
	end	
end

// ========================================================
// Inst of reset_req_s module
// ========================================================

// reset for DSPA
reset_req_s Inst_reset_req_ctrl_a
 (
    .clk				(	main_50mhz_clk			), 
    .rst_n				(	fpga_ireset_n			), 
    .por_req_n			(	por_req_n				), 
    .resetfull_req_n	(	resetfull_req_n			), 
    .hreset_req_n		(	1'b1					), 
    .sreset_req_n		(	dspa_softreset_req_n	), 
    .cs_por_n			(	dspa_porz_o				), 
    .cs_resetfull_n		(	dspa_resetfullz_o		), 
    .cs_reset_n			(	dspa_resetz_o			), 
    .cs_resetstat_n		(	dspa_resetstat_n_50s2	), 
    .por_out_n			(	dspa_por_out_n			), 
    .resetfull_out_n	(	dspa_resetfull_out_n	), 
    .reset_out_n		(	dspa_reset_out_n		)
 );

// reset for DSPB
reset_req_s Inst_reset_req_ctrl_b
 (
    .clk				(	main_50mhz_clk			), 
    .rst_n				(	fpga_ireset_n			), 
    .por_req_n			(	por_req_n				), 
    .resetfull_req_n	(	resetfull_req_n			), 
    .hreset_req_n		(	1'b1					), 
    .sreset_req_n		(	dspb_softreset_req_n	), 
    .cs_por_n			(	dspb_porz_o				), 
    .cs_resetfull_n		(	dspb_resetfullz_o		), 
    .cs_reset_n			(	dspb_resetz_o			), 
    .cs_resetstat_n		(	dspb_resetstat_n_50s2	), 
    .por_out_n			(	dspb_por_out_n			), 
    .resetfull_out_n	(	dspb_resetfull_out_n	), 
    .reset_out_n		(	dspb_reset_out_n		)
 ); 
 
// ========================================================
// Signals re-sync to DSP SPI clock
// ========================================================
 
always@(posedge dspa_sspck_i or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n) begin
		dspa_bm_gpio[15:0] <= 16'h0;      
		dspa_gpio[15:0] <= 16'h0;
		dspa_phy_int_n_s1 <= 1'b1;
		dspa_phy_int_n_s2 <= 1'b1;
		dspb_bm_gpio[15:0] <= 16'h0;      
		dspb_gpio[15:0] <= 16'h0;
		dspb_phy_int_n_s1 <= 1'b1;
		dspb_phy_int_n_s2 <= 1'b1;
		fpga_rst_n_s1 <= 1'b1;
		fpga_rst_n_s2 <= 1'b1;
		dspa_warm_reset_s1 <= 1'b1;
		dspa_warm_reset_s2 <= 1'b1;
		dspb_warm_reset_s1 <= 1'b1;
		dspb_warm_reset_s2 <= 1'b1;
		full_reset_s1 <= 1'b1; 
		full_reset_s2 <= 1'b1; 
		dspa_trgrstz_s1 <= 1'b1;
		dspa_trgrstz_s2 <= 1'b1;
		dspa_resetstat_n <= 1'b0;  
		dspa_bootcomplete_s1 <= 1'b0;
		dspa_bootcomplete_s2 <= 1'b0;
		dspa_sysclkout_s1 <= 1'b0;
		dspa_sysclkout_s2 <= 1'b0;
		dspa_hout_s1 <= 1'b0;
		dspa_hout_s2 <= 1'b0;
		dspb_trgrstz_s1 <= 1'b1;
		dspb_trgrstz_s2 <= 1'b1;
		dspb_resetstat_n <= 1'b0;  
		dspb_bootcomplete_s1 <= 1'b0;
		dspb_bootcomplete_s2 <= 1'b0;
		dspb_sysclkout_s1 <= 1'b0;
		dspb_sysclkout_s2 <= 1'b0;
		dspb_hout_s1 <= 1'b0;
		dspb_hout_s2 <= 1'b0;
	end
	
	else begin
		// dspa_bm_gpio[15:0] <= 16'b0000_1000_0000_1011;     // ibl nor boot 
        // dspa_bm_gpio[15:0] <= 16'b0000_1000_0100_1011;     // ibl tftp boot 
	    dspa_bm_gpio[15:0] <= 16'b0000_1000_0010_1011;     // ibl nand boot 
		dspa_gpio[15:0] <= dspa_gpio_i[15:0];   
		dspa_phy_int_n_s1 <= dspa_phy_int_n_i;
		dspa_phy_int_n_s2 <= dspa_phy_int_n_s1;
		// dspb_bm_gpio[15:0] <= 16'b0000_1000_0000_1011;     // ibl nor boot 
        // dspb_bm_gpio[15:0] <= 16'b0000_1000_0100_1011;     // ibl tftp boot 
	    dspb_bm_gpio[15:0] <= 16'b0000_1000_0010_1011;     // ibl nand boot 
		dspb_gpio[15:0] <= dspb_gpio_i[15:0];   
		dspb_phy_int_n_s1 <= dspb_phy_int_n_i;
		dspb_phy_int_n_s2 <= dspb_phy_int_n_s1;
		fpga_rst_n_s1 <= fpga_rst_i;
		fpga_rst_n_s2 <= fpga_rst_n_s1;
		dspa_warm_reset_s1 <= dspa_warm_reset_i;
		dspa_warm_reset_s2 <= dspa_warm_reset_s1;
		dspb_warm_reset_s1 <= dspb_warm_reset_i;
		dspb_warm_reset_s2 <= dspb_warm_reset_s1;
		full_reset_s1 <= full_reset_i; 
		full_reset_s2 <= full_reset_s1; 
		dspa_trgrstz_s1 <= dspa_trgrstz_i;
		dspa_trgrstz_s2 <= dspa_trgrstz_s1;
		dspa_resetstat_n <= dspa_resetstat_n_i; 
		dspa_bootcomplete_s1 <= dspa_bootcomplete_i;
		dspa_bootcomplete_s2 <= dspa_bootcomplete_s1;
		dspa_sysclkout_s1 <= dspa_sysclkout_i;
		dspa_sysclkout_s2 <= dspa_sysclkout_s1;
		dspa_hout_s1 <= dspa_hout_i;
		dspa_hout_s2 <= dspa_hout_s1;
		dspb_trgrstz_s1 <= dspb_trgrstz_i;
		dspb_trgrstz_s2 <= dspb_trgrstz_s1;
		dspb_resetstat_n <= dspb_resetstat_n_i; 
		dspb_bootcomplete_s1 <= dspb_bootcomplete_i;
		dspb_bootcomplete_s2 <= dspb_bootcomplete_s1;
		dspb_sysclkout_s1 <= dspb_sysclkout_i;
		dspb_sysclkout_s2 <= dspb_sysclkout_s1;
		dspb_hout_s1 <= dspb_hout_i;
		dspb_hout_s2 <= dspb_hout_s1;
	end	
end	 
 
// ========================================================
// FPGA Configuration Registers
// ========================================================
 
// DSPA's register write
always@(negedge fpga_ireset_n or posedge main_50mhz_clk) begin	
	if(~fpga_ireset_n) begin 
		dspa_spi_reg[35:32]  <= 4'b0;		// 0x00 bit[3:0] Debug LED
		dspa_spi_reg[41]     <= 1'b1;   	// 0x01 bit[1] PHY Control Register  
		dspa_spi_reg[59:56]  <= 4'b0011;    // 0x07 bit[3:0] Miscellaneous Register    
	end
	
    // configuration register write	
	else if(wr_event_pulse_a) begin		 
		case(dspa_spi_a)
			8'h0: dspa_spi_reg[35:32] <= dspa_spi_w[3:0];  // Debug_LED
			8'h1: dspa_spi_reg[41] <= dspa_spi_w[1];	   // PHY control, bit 0 (RO) = PHY INIT		
			8'h7: dspa_spi_reg[59:56] <= dspa_spi_w[3:0];  // Miscellaneous Register
		endcase
	end
end

always@(*) begin
	if(~fpga_ireset_n) begin    
		dspa_spi_reg[15:0]    <= 16'b0; // 0x04 - 0x05 BM GPIO STATUS     	
		dspa_spi_reg[31:16]   <= 16'b0;	// 0x02 - 0x03 DSP GPIO STATUS	
		dspa_spi_reg[40]      <= 1'b0;  // 0x01 bit[0] PHY Control Register
		dspa_spi_reg[55:48]   <= 8'b0;  // 0x06 RESET BUTTON STATUS		
		dspa_spi_reg[62:60]   <= 3'b0;  // 0x07 Miscellaneous	
	end
	//Read Only registers
	else begin
		dspa_spi_reg[7:0] <= dspa_bm_gpio[7:0];    // 8'h4: BM GPIO (RO)
		dspa_spi_reg[15:8] <= dspa_bm_gpio[15:8];
		dspa_spi_reg[23:16] <= dspa_gpio[7:0];     // 8'h2: DSP GPIO (RO)
		dspa_spi_reg[31:24] <= dspa_gpio[15:8];
		dspa_spi_reg[40] <= dspa_phy_int_n_s2;	   // 8'h1 PHY control
		// 8'h6 Reset Button
		dspa_spi_reg[55:48] <= {3'b0,dspa_trgrstz_s2,dspa_resetstat_n,fpga_rst_n_s2,dspa_warm_reset_s2,full_reset_s2}; 
		// 8'h7 Misc
		dspa_spi_reg[62:60] <= {dspa_bootcomplete_s2, dspa_sysclkout_s2, dspa_hout_s2};     		  	  
	end
end

// DSPA's register read
always @(*) begin
	if (~fpga_ireset_n) 
		dspa_spi_r <= 8'h0;
	//configuration register read
	else if(dspa_spi_rdy) begin
		case (dspa_spi_a)					
			8'h4: dspa_spi_r <= dspa_spi_reg[7:0];           // BM_GPIO
			8'h5: dspa_spi_r <= dspa_spi_reg[15:8];
			8'h2: dspa_spi_r <= dspa_spi_reg[23:16];         // DSP_GPIO
			8'h3: dspa_spi_r <= dspa_spi_reg[31:24];
			8'h0: dspa_spi_r <= {4'h0,dspa_spi_reg[39:32]};  // debug_LED
			8'h1: dspa_spi_r <= {6'h0,dspa_spi_reg[41:40]};  // PHY control			
			8'h6: dspa_spi_r <= dspa_spi_reg[55:48];         // Reset
			8'h7: dspa_spi_r <= {1'h0,dspa_spi_reg[62:56]};  // Misc	
			default: dspa_spi_r <= 8'h0;
		endcase
	end
	else 
		dspa_spi_r <= dspa_spi_r;
end

// DSPB's register write
always@(negedge fpga_ireset_n or posedge main_50mhz_clk) begin	
	if(~fpga_ireset_n) begin 
		dspb_spi_reg[35:32]  <= 4'b0;		// 0x00 bit[3:0] Debug LED
		dspb_spi_reg[41]     <= 1'b1;   	// 0x01 bit[1] PHY Control Register  
		dspb_spi_reg[59:56]  <= 4'b0011;    // 0x07 bit[3:0] Miscellaneous Register    
	end
	
    // configuration register write	
	else if(wr_event_pulse_b) begin		 
		case(dspb_spi_a)
			8'h0: dspb_spi_reg[35:32] <= dspb_spi_w[3:0];  // Debug_LED
			8'h1: dspb_spi_reg[41] <= dspb_spi_w[1];	   // PHY control, bit 0 (RO) = PHY INIT		
			8'h7: dspb_spi_reg[59:56] <= dspb_spi_w[3:0];  // Miscellaneous Register
		endcase
	end
end

always@(*) begin
	if(~fpga_ireset_n) begin    
		dspb_spi_reg[15:0]    <= 16'b0; // 0x04 - 0x05 BM GPIO STATUS     	
		dspb_spi_reg[31:16]   <= 16'b0;	// 0x02 - 0x03 DSP GPIO STATUS	
		dspb_spi_reg[40]      <= 1'b0;  // 0x01 bit[0] PHY Control Register
		dspb_spi_reg[55:48]   <= 8'b0;  // 0x06 RESET BUTTON STATUS		
		dspb_spi_reg[62:60]   <= 3'b0;  // 0x07 Miscellaneous	
	end
	//Read Only registers
	else begin
		dspb_spi_reg[7:0] <= dspb_bm_gpio[7:0];    // 8'h4: BM GPIO (RO)
		dspb_spi_reg[15:8] <= dspb_bm_gpio[15:8];
		dspb_spi_reg[23:16] <= dspb_gpio[7:0];     // 8'h2: DSP GPIO (RO)
		dspb_spi_reg[31:24] <= dspb_gpio[15:8];
		dspb_spi_reg[40] <= dspb_phy_int_n_s2;	   // 8'h1 PHY control
		// 8'h6 Reset Button
		dspb_spi_reg[55:48] <= {3'b0,dspb_trgrstz_s2,dspb_resetstat_n,fpga_rst_n_s2,dspb_warm_reset_s2,full_reset_s2}; 
		// 8'h7 Misc
		dspb_spi_reg[62:60] <= {dspb_bootcomplete_s2, dspb_sysclkout_s2, dspb_hout_s2};     		  	  
	end
end

// DSPB's register read
always @(*) begin
	if (~fpga_ireset_n) 
		dspb_spi_r <= 8'h0;
	//configuration register read
	else if(dspb_spi_rdy) begin
		case (dspb_spi_a)					
			8'h4: dspb_spi_r <= dspb_spi_reg[7:0];           // BM_GPIO
			8'h5: dspb_spi_r <= dspb_spi_reg[15:8];
			8'h2: dspb_spi_r <= dspb_spi_reg[23:16];         // DSP_GPIO
			8'h3: dspb_spi_r <= dspb_spi_reg[31:24];
			8'h0: dspb_spi_r <= {4'h0,dspb_spi_reg[39:32]};  // debug_LED
			8'h1: dspb_spi_r <= {6'h0,dspb_spi_reg[41:40]};  // PHY control			
			8'h6: dspb_spi_r <= dspb_spi_reg[55:48];         // Reset
			8'h7: dspb_spi_r <= {1'h0,dspb_spi_reg[62:56]};  // Misc	
			default: dspb_spi_r <= 8'h0;
		endcase
	end
	else 
		dspb_spi_r <= dspb_spi_r;
end

// ========================================================
// clock for DSP Timer 0
// ========================================================
 
always @(posedge main_50mhz_clk or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n) 
		half_clk <= 1'h0;
	else 
		half_clk <= ~half_clk;
end

// ========================================================
// DSP Boot Configuration
// ========================================================

// DSPA boot 
always @(posedge main_50mhz_clk or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n) begin
		dspa_gpio_en <= 1'b1;
		dspa_gpio_ctrl_delay <= 16'h0;
		dspa_timi0_o <= 1'b0; // PCIe ctrl
	end
	
	else if((~dspa_porz_o && ~dspa_resetstat_nd[1]) || (~dspa_resetfullz_o && ~dspa_resetstat_nd[1])) begin
		dspa_gpio_en <= 1'b1;
		dspa_gpio_ctrl_delay <= 16'h0;
		dspa_timi0_o <= 1'b0; // PCIe ctrl
			
	end		
	
	else if(~dspa_resetstat_nd[1] && dspa_gpio_en ) begin
	    dspa_gpio_en <= 1'b1;
		dspa_gpio_ctrl_delay <= 16'h0;
		dspa_timi0_o <= 1'b0; // PCIe ctrl
	end		

    else if(dspa_gpio_ctrl_delay >= `DSP_GPIO_Output_delay_time) begin		
		dspa_gpio_en <= 1'b0;	
		dspa_timi0_o <= half_clk; // timer0 clock
	end
	
	else begin			
		dspa_gpio_en <= 1'b1;
		dspa_gpio_ctrl_delay <= dspa_gpio_ctrl_delay + 1;	
		dspa_timi0_o <= 1'b0; // PCIe ctrl
	end								
end


// DSPB boot 
always @(posedge main_50mhz_clk or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n) begin
		dspb_gpio_en <= 1'b1;
		dspb_gpio_ctrl_delay <= 16'h0;
		dspb_timi0_o <= 1'b0; // PCIe ctrl
	end
	
	else if((~dspb_porz_o && ~dspb_resetstat_nd[1]) || (~dspb_resetfullz_o && ~dspb_resetstat_nd[1])) begin
		dspb_gpio_en <= 1'b1;
		dspb_gpio_ctrl_delay <= 16'h0;
		dspb_timi0_o <= 1'b0; // PCIe ctrl
			
	end		
	
	else if(~dspb_resetstat_nd[1] && dspb_gpio_en ) begin
	    dspb_gpio_en <= 1'b1;
		dspb_gpio_ctrl_delay <= 16'h0;
		dspb_timi0_o <= 1'b0; // PCIe ctrl
	end		

    else if(dspb_gpio_ctrl_delay >= `DSP_GPIO_Output_delay_time) begin		
		dspb_gpio_en <= 1'b0;	
		dspb_timi0_o <= half_clk; // timer0 clock
	end
	
	else begin			
		dspb_gpio_en <= 1'b1;
		dspb_gpio_ctrl_delay <= dspb_gpio_ctrl_delay + 1;	
		dspb_timi0_o <= 1'b0; // PCIe ctrl
	end								
end		

// ========================================================
// Power Control & Sequence
// ========================================================
 
always @(posedge main_50mhz_clk or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n) 
		pg_ex_dsp <= 1'b0;
	else 
		pg_ex_dsp <= vcc1p0_pgood_d[1] & vcc3p3_fmc_pgood_d[1] & vcc_vadj_fmc_pgood_d[1] &
		             vcc1p2_pgood_d[1] & vcc1p8_fpga_pgood_d[1] & vcc1p5_fpga_pgood_d[1] &
					 vcc0p75_fpga_pgood_d[1] & vcc1p0_mgtavcc_pgood_d[1] & vcc1p2_mgtavtt_pgood_d[1] &
					 vcc3p3_pgood_d[1];
end	 
  
always @(posedge main_50mhz_clk or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n) 
		all_power <= 1'b0;
	else 
		all_power <= vcc2p5_pgood_d[1] & dspa_ucd9222_pg1_d[1] & dspa_ucd9222_pg2_d[1] & dspa_pgucd9222_d[1] & 
		             dspb_ucd9222_pg1_d[1] & dspb_ucd9222_pg2_d[1] & dspb_pgucd9222_d[1] &
					 vcc1p8_dsp_pgood_d[1] & vcc1p5_dsp_pgood_d[1] & vcc0p75_dsp_pgood_d[1] & 
					 vcc1p0_pgood_d[1] & vcc3p3_fmc_pgood_d[1] & vcc_vadj_fmc_pgood_d[1] &
		             vcc1p2_pgood_d[1] & vcc1p8_fpga_pgood_d[1] & vcc1p5_fpga_pgood_d[1] &
					 vcc0p75_fpga_pgood_d[1] & vcc1p0_mgtavcc_pgood_d[1] & vcc1p2_mgtavtt_pgood_d[1] &
					 vcc3p3_pgood_d[1];
end	

// ========================================================
// main body of the code
// ========================================================

always @(posedge main_50mhz_clk or negedge fpga_ireset_n) begin
	if(~fpga_ireset_n) begin
		PW_SM <= SM_IDLE;
		dspa_ucd9222_ena1_o <= 1'b0;
		dspa_ucd9222_ena2_o <= 1'b0;
		dspa_ucd9222_rst_n_o <= 1'b1;			 
		dspb_ucd9222_ena1_o <= 1'b0;
		dspb_ucd9222_ena2_o <= 1'b0;
		dspb_ucd9222_rst_n_o <= 1'b1;
		vcc1p5_dsp_en_o <= 1'b0;
		vcc1p8_dsp_en_o <= 1'b0;
		vcc0p75_dsp_en_o <= 1'b0;
		vcc2p5_en_o <= 1'b0;
		PW_c <= 24'h0;
		PW_time_out <= 24'h0;
        vcc2p5_pgood_d <= 2'b00;
        vcc1p8_dsp_pgood_d <= 2'b00;
        vcc1p5_dsp_pgood_d <= 2'b00;
        vcc0p75_dsp_pgood_d<= 2'b00;
        dspa_ucd9222_pg1_d <= 2'b00;
        dspa_ucd9222_pg2_d <= 2'b00;
        dspa_pgucd9222_d <= 2'b00;
		dspb_ucd9222_pg1_d <= 2'b00;
        dspb_ucd9222_pg2_d <= 2'b00;
        dspb_pgucd9222_d <= 2'b00;
		vcc1p0_pgood_d <= 2'b00;
		vcc3p3_fmc_pgood_d <= 2'b00;
		vcc_vadj_fmc_pgood_d <= 2'b00;
		vcc1p2_pgood_d <= 2'b00;
		vcc1p8_fpga_pgood_d <= 2'b00;
		vcc1p5_fpga_pgood_d <= 2'b00;
		vcc0p75_fpga_pgood_d <= 2'b00;
		vcc1p0_mgtavcc_pgood_d <= 2'b00;
		vcc1p2_mgtavtt_pgood_d <= 2'b00;
		vcc3p3_pgood_d <= 2'b00;
        ad9516_1_ld_d <= 2'b00;
        ad9516_2_ld_d <= 2'b00;
        dspa_resetstat_nd  <= 2'b00;
		dspb_resetstat_nd  <= 2'b00;
		set_ad9516 <= 1'b0;
		dspa_vid_oe_n_o <= 1'b1;
		dspb_vid_oe_n_o <= 1'b1;
	end
	else begin
        vcc2p5_pgood_d         <= {vcc2p5_pgood_d[0],vcc2p5_pgood_i};
        vcc1p8_dsp_pgood_d     <= {vcc1p8_dsp_pgood_d[0],vcc1p8_dsp_pgood_i};
        vcc1p5_dsp_pgood_d     <= {vcc1p5_dsp_pgood_d[0],vcc1p5_dsp_pgood_i};
        vcc0p75_dsp_pgood_d    <= {vcc0p75_dsp_pgood_d[0],vcc0p75_dsp_pgood_i};
        dspa_ucd9222_pg1_d     <= {dspa_ucd9222_pg1_d[0],dspa_ucd9222_pg1_i};
        dspa_ucd9222_pg2_d     <= {dspa_ucd9222_pg2_d[0],dspa_ucd9222_pg2_i};
		dspa_pgucd9222_d       <= {dspa_pgucd9222_d[0],dspa_pgucd9222_i};
		dspb_ucd9222_pg1_d     <= {dspb_ucd9222_pg1_d[0],dspb_ucd9222_pg1_i};
        dspb_ucd9222_pg2_d     <= {dspb_ucd9222_pg2_d[0],dspb_ucd9222_pg2_i};
		dspb_pgucd9222_d       <= {dspb_pgucd9222_d[0],dspb_pgucd9222_i};
		vcc1p0_pgood_d 		   <= {vcc1p0_pgood_d[0],vcc1p0_pgood_i};
		vcc3p3_fmc_pgood_d 	   <= {vcc3p3_fmc_pgood_d[0],vcc3p3_fmc_pgood_i};
		vcc_vadj_fmc_pgood_d   <= {vcc_vadj_fmc_pgood_d[0],vcc_vadj_fmc_pgood_i};
		vcc1p2_pgood_d 		   <= {vcc1p2_pgood_d[0],vcc1p2_pgood_i};
		vcc1p8_fpga_pgood_d    <= {vcc1p8_fpga_pgood_d[0],vcc1p8_fpga_pgood_i};
		vcc1p5_fpga_pgood_d    <= {vcc1p5_fpga_pgood_d[0],vcc1p5_fpga_pgood_i};
		vcc0p75_fpga_pgood_d   <= {vcc0p75_fpga_pgood_d[0],vcc0p75_fpga_pgood_i};
		vcc1p0_mgtavcc_pgood_d <= {vcc1p0_mgtavcc_pgood_d[0],vcc1p0_mgtavcc_pgood_i};
		vcc1p2_mgtavtt_pgood_d <= {vcc1p2_mgtavtt_pgood_d[0],vcc1p2_mgtavtt_pgood_i};
		vcc3p3_pgood_d 		   <= {vcc3p3_pgood_d[0],vcc3p3_pgood_i};
		ad9516_1_ld_d 		   <= {ad9516_1_ld_d[0],ad9516_1_cfg_done};
        ad9516_2_ld_d 		   <= {ad9516_2_ld_d[0],ad9516_2_cfg_done};
		dspa_resetstat_nd      <= {dspa_resetstat_nd[0],dspa_resetstat_n_i};
	    dspb_resetstat_nd      <= {dspb_resetstat_nd[0],dspb_resetstat_n_i};

		// main state machine
		case (PW_SM)
			// upon power on, wait until pg_ex_dsp is valid, then wait for another 10ms
			SM_IDLE: begin
				if(pg_ex_dsp) begin
					if(PW_c >= `PowerOn_idle_time) begin // 10ms
						PW_SM      <= SM_V2P5;
						PW_c       <= 24'h0;
					end
					else begin
						PW_SM                <= SM_IDLE;
						dspa_ucd9222_ena1_o  <= 1'b0;
						dspa_ucd9222_ena2_o  <= 1'b0;
						dspa_ucd9222_rst_n_o <= 1'b1;
						dspb_ucd9222_ena1_o  <= 1'b0;
						dspb_ucd9222_ena2_o  <= 1'b0;
						dspb_ucd9222_rst_n_o <= 1'b1;
						vcc1p5_dsp_en_o      <= 1'b0;
						vcc1p8_dsp_en_o      <= 1'b0;
						vcc0p75_dsp_en_o     <= 1'b0;
						vcc2p5_en_o          <= 1'b0;
						PW_time_out 		 <= 24'h0;
						PW_c                 <= PW_c + 1'b1;
						set_ad9516 		 	 <= 1'b0;
						dspa_vid_oe_n_o      <= 1'b1;
						dspb_vid_oe_n_o      <= 1'b1;						
					end  
				end
				else begin
					PW_SM                <= SM_IDLE;
					dspa_ucd9222_ena1_o  <= 1'b0;
					dspa_ucd9222_ena2_o  <= 1'b0;
					dspa_ucd9222_rst_n_o <= 1'b1;
					dspb_ucd9222_ena1_o  <= 1'b0;
					dspb_ucd9222_ena2_o  <= 1'b0;
					dspb_ucd9222_rst_n_o <= 1'b1;
					vcc1p5_dsp_en_o      <= 1'b0;
					vcc1p8_dsp_en_o      <= 1'b0;
					vcc0p75_dsp_en_o     <= 1'b0;
					vcc2p5_en_o          <= 1'b0;
					PW_c                 <= 24'h0;
					PW_time_out 		 <= 24'h0;
					set_ad9516 		     <= 1'b0;
					dspa_vid_oe_n_o      <= 1'b1;
					dspb_vid_oe_n_o      <= 1'b1;
				end
			end
			// VCC_2V5 power up
			SM_V2P5: begin
				if(pg_ex_dsp) begin
					vcc2p5_en_o <= 1'b1;
					if(PW_time_out >= `PowerOn_time_out) begin
						PW_SM <= SM_FAIL;
						PW_time_out <= 24'h0;
					end
					else
						PW_time_out <= PW_time_out + 1'b1;
					if(vcc2p5_pgood_d[1]) begin
						if(PW_c >= `PowerOn_v2p5_time) begin // 5ms
							PW_SM <= SM_PMBS_1;
							PW_c  <= 24'h0;
							PW_time_out <= 24'h0;
						end
						else begin
							PW_SM <= SM_V2P5;
							PW_c  <= PW_c + 1'b1;
						end
					end
					else begin
						PW_SM <= SM_V2P5;
						PW_c <= 24'h0;
					end
				end
				else 
					PW_SM <= SM_FAIL;
			end
			// CVDD, VCC_1V0_DSP power up
			SM_PMBS_1: begin
				if(pg_ex_dsp) begin
					dspa_ucd9222_ena1_o <= 1'b1;
					dspa_ucd9222_ena2_o <= 1'b1;								 
					dspb_ucd9222_ena1_o <= 1'b1;
					dspb_ucd9222_ena2_o <= 1'b1;
					if(PW_c >= `PowerOn_pmbs1_time) begin // 5ms
						PW_SM <= SM_PMBS_2;
						PW_c  <= 24'h0;
					end
					else begin
						PW_SM <= SM_PMBS_1;
						PW_c  <= PW_c + 1'b1;
					end
				end
				else 
					PW_SM <= SM_FAIL;
			end
			
			SM_PMBS_2: begin
				if(pg_ex_dsp) begin
					if(PW_time_out >= `PowerOn_time_out) begin
						PW_SM <= SM_FAIL;
						PW_time_out <= 24'h0;
					end
					else
						PW_time_out <= PW_time_out + 1'b1;
					if(dspa_ucd9222_pg1_d[1] & dspa_ucd9222_pg2_d[1] & dspa_pgucd9222_d[1] & dspb_ucd9222_pg1_d[1] & dspb_ucd9222_pg2_d[1] & dspb_pgucd9222_d[1]) begin	
						if(PW_c >= `PowerOn_pmbs2_time) begin // 5ms
							PW_SM <= SM_V1P8;
							PW_c  <= 24'h0;
							PW_time_out <= 24'h0;
						end
						else begin
							PW_SM <= SM_PMBS_2;
							PW_c  <= PW_c + 1'b1;
						end
					end
					else begin
						PW_SM <= SM_PMBS_2;
						PW_c  <= 24'h0;
					end
				end
				else
					PW_SM <= SM_FAIL;
			end
			// VCC_1V8_DSP power up, AD9516 configuration
			SM_V1P8: begin
				if(pg_ex_dsp) begin
					vcc1p8_dsp_en_o <= 1'b1;
					if(PW_time_out >= `PowerOn_time_out) begin
						PW_SM <= SM_FAIL;
						PW_time_out <= 24'h0;
					end
					else
						PW_time_out <= PW_time_out + 1'b1;
					if(vcc1p8_dsp_pgood_d[1]) begin
						if(PW_c >= `PowerOn_v1p8_time) begin // 5ms
							PW_SM <= SM_V1P5;
							PW_c  <= 24'h0;
							set_ad9516 <= 1'b1;
							PW_time_out <= 24'h0;
						end
						else begin	
							PW_SM <= SM_V1P8;
							PW_c <= PW_c + 1'b1;	
						end	
					end
					else begin
						PW_SM <= SM_V1P8;
						PW_c  <= 24'h0;
					end
				end
				else 
					PW_SM <= SM_FAIL;
			end
			// VCC_1V5_DSP power up, enable UCD9222 VID
			SM_V1P5: begin
				if(pg_ex_dsp) begin
					vcc1p5_dsp_en_o <= 1'b1;						 							 
					if(PW_time_out >= `PowerOn_time_out) begin
						PW_SM <= SM_FAIL;
						PW_time_out <= 24'h0;
					end
					else
						PW_time_out <= PW_time_out + 1'b1;
					if(vcc1p5_dsp_pgood_d[1]) begin 	
						if(PW_c >= `PowerOn_v1p5_time) begin // 5ms
						   dspa_vid_oe_n_o <= 1'b0;		
						   dspb_vid_oe_n_o <= 1'b0;	
						   PW_SM <= SM_V075;
						   PW_c  <= 24'h0;
						   PW_time_out <= 24'h0;
						end
						else begin
							 PW_SM <= SM_V1P5;
							 PW_c  <= PW_c + 1'b1;
						end
					 end
					 else begin
						  PW_SM <= SM_V1P5;
						  PW_c  <= 24'h0;
					 end
				end
				else 
					PW_SM <= SM_FAIL; 
			end
			// VCC_0V75_DSP power up
			SM_V075: begin
				if(pg_ex_dsp) begin
					vcc0p75_dsp_en_o <= 1'b1;
					if(PW_time_out >= `PowerOn_time_out) begin
						PW_SM <= SM_FAIL;
						PW_time_out <= 24'h0;
					end
					else
						PW_time_out <= PW_time_out + 1'b1;
					if(vcc0p75_dsp_pgood_d[1]) begin	
						if(PW_c >= `PowerOn_v075_time) begin // 5ms
							PW_SM <= SM_CLKG;
							PW_c  <= 24'h0;
							PW_time_out <= 24'h0;
						end
						else begin
							 PW_SM <= SM_V075;
							 PW_c  <= PW_c + 1'b1;
						end
					 end
					 else begin			
						PW_SM <= SM_V075;
						PW_c  <= 24'h0;
					 end
				end
				else
					PW_SM <= SM_FAIL; 
			end
			// AD9516 PLL locked check, reset de-asserted 	
			SM_CLKG: begin
				if(all_power) begin
					if(PW_time_out >= `PowerOn_time_out) begin
						PW_SM <= SM_FAIL;
						PW_time_out <= 24'h0;
					end
					else
						PW_time_out <= PW_time_out + 1'b1;
					if(ad9516_1_ld_d[1] & ad9516_2_ld_d[1]) begin
						if(PW_c >= `PowerOn_clkg_time) begin // 5ms
						   PW_SM <= SM_PORWR;
						   PW_c  <= 24'h0;
						   set_ad9516 <= 1'b0;
						   PW_time_out <= 24'h0;
						end
						else begin
							PW_SM <= SM_CLKG;
							PW_c  <= PW_c + 1'b1;
						end
                    end
                    else begin			
                        PW_SM <= SM_CLKG;
						PW_c  <= 24'h0;
                    end
				end
				else
					PW_SM <= SM_POFF1;
			end
			// POR de-asserted
			SM_PORWR: begin
				if(all_power) begin
					if(PW_c >= `PowerOn_wait_time) begin // 5ms
					   PW_SM <= SM_WAIT;
					   PW_c  <= 24'h0;
					end
					else begin
					   PW_SM <= SM_PORWR;
					   PW_c  <= PW_c + 1'b1;
					end
				end
				else 
					PW_SM <= SM_POFF1;
			end
            // resetfull de-asserted
            SM_WAIT: begin
				if(all_power) begin
					if(PW_time_out >= `PowerOn_time_out) begin
						PW_SM <= SM_FAIL;
						PW_time_out <= 24'h0;
					end
					else
						PW_time_out <= PW_time_out + 1'b1;
					if(dspa_resetstat_nd[1]) begin	
						if(PW_c >= `PowerOn_wait_time) begin // 5ms
							PW_SM <= SM_PWOK;
							PW_c  <= 24'h0;
							PW_time_out <= 24'h0;
						end
						else begin
							PW_SM <= SM_WAIT;
							PW_c  <= PW_c + 1'b1;
						end
					end
					else begin			
						PW_SM <= SM_WAIT;
						PW_c  <= 24'h0;
					end
				end
				else
					PW_SM <= SM_POFF1;
            end
			// power up finish, keep checking all_power in case of power fail and power down
			SM_PWOK: begin			
				if(~all_power)
					PW_SM <= SM_POFF1;
				else                                  
					PW_SM <= SM_PWOK;								
			end
			// normal power down process
			SM_POFF1: begin
				if(PW_c >= `PowerOff_delay_time) begin // 5ms
					PW_SM <= SM_POFF2;
					PW_c  <= 24'h0;
				end
				else begin  
					PW_SM <= SM_POFF1;
					PW_c  <= PW_c + 1'b1;
				end  
			end	
			
            SM_POFF2: begin
				PW_SM <= SM_POFF2;
				dspa_ucd9222_ena1_o <= 1'b0;
				dspa_ucd9222_ena2_o <= 1'b0;
				dspa_ucd9222_rst_n_o <= 1'b1;			
				dspb_ucd9222_ena1_o <= 1'b0;
				dspb_ucd9222_ena2_o <= 1'b0;
				dspb_ucd9222_rst_n_o <= 1'b1;
				vcc1p5_dsp_en_o <= 1'b0;
				vcc1p8_dsp_en_o <= 1'b0;
				vcc0p75_dsp_en_o <= 1'b0;
				vcc2p5_en_o <= 1'b0;
				PW_c <= 24'b0;
				PW_time_out <= 24'h0;
				set_ad9516 <= 1'b0;
				dspa_vid_oe_n_o <= 1'b1;
				dspb_vid_oe_n_o <= 1'b1;
            end
			// power fail in the power up process
            SM_FAIL: begin	
				PW_SM                <= SM_FAIL;
				dspa_ucd9222_ena1_o  <= 1'b0;
				dspa_ucd9222_ena2_o  <= 1'b0;
				dspa_ucd9222_rst_n_o <= 1'b1;
				dspb_ucd9222_ena1_o  <= 1'b0;
				dspb_ucd9222_ena2_o  <= 1'b0;
				dspb_ucd9222_rst_n_o <= 1'b1;
				vcc1p5_dsp_en_o      <= 1'b0;
				vcc1p8_dsp_en_o      <= 1'b0;
				vcc0p75_dsp_en_o     <= 1'b0;
				vcc2p5_en_o          <= 1'b0;
				PW_c                 <= 24'h0;
				PW_time_out 		 <= 24'h0;
				set_ad9516 		     <= 1'b0;
				dspa_vid_oe_n_o      <= 1'b1;
				dspb_vid_oe_n_o      <= 1'b1;
            end  
			
			default: PW_SM <= SM_IDLE;
		endcase
	end
end

endmodule 

