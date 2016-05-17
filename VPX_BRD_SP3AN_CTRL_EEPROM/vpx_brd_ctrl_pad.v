`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:32 10/5/2015 
// Design Name: 
// Module Name:    vpx_brd_ctrl_pad 
// Project Name: 
// Target Devices: X3S400AN-FGG400
// Tool versions:  ISE-14.7
// Description:    1. port process for vpx_brd_ctrl_core
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

module vpx_brd_ctrl_pad
 (
	// system clk input
	input				    SP3AN_GCLK,
	output					main_100mhz_clk_i,
		
	// power good indication input except for DSP
	input					VCC_1V0_PG,
	input					VCC_3V3_FMC_PG,
	input					VCC_VADJ_FMC_PG,
	input					VCC_1V2_PG,
	input					VCC_1V8_FPGA_PG,
	input					VCC_1V5_FPGA_PG,
	input					VCC_0V75_FPGA_PG,
	input					MGTAVCC_1V0_PG,
	input					MGTAVTT_1V2_PG,
	input					VCC_3V3_PG,
	
	output					vcc1p0_pgood_i,
	output					vcc3p3_fmc_pgood_i,
	output					vcc_vadj_fmc_pgood_i,
	output					vcc1p2_pgood_i,
	output					vcc1p8_fpga_pgood_i,
	output					vcc1p5_fpga_pgood_i,
	output					vcc0p75_fpga_pgood_i,
	output					vcc1p0_mgtavcc_pgood_i,
	output					vcc1p2_mgtavtt_pgood_i,
	output					vcc3p3_pgood_i,
	
	// DSP SPI interface
	input					DSPA_SSPCS1,
	input					DSPA_SSPCK,
	output					DSPA_SSPMISO,
	input					DSPA_SSPMOSI,
	
	input					DSPB_SSPCS1,
	input					DSPB_SSPCK,
	output					DSPB_SSPMISO,
	input					DSPB_SSPMOSI,
	
	output					dspa_sspcs1_i,
	output					dspa_sspck_i,
	input					dspa_sspmiso_o,
	output					dspa_sspmosi_i,
	
	output					dspb_sspcs1_i,
	output					dspb_sspck_i,
	input					dspb_sspmiso_o,
	output					dspb_sspmosi_i,
	
	// DSP relative power good indication input
	input					VCC_2V5_PG,
	input					VCC1V8_DSP_PG,
	input					VCC1V5_DSP_PG,
	input					VCC0V75_DSP_PG,

	output					vcc2p5_pgood_i,		
	output					vcc1p8_dsp_pgood_i,     
	output					vcc1p5_dsp_pgood_i,	    
	output					vcc0p75_dsp_pgood_i,
	
	// board power good indication input
	input					sys_pgood_o,
	
	// DSP relative power ctrl
	output                  VCC2V5_EN,			
	output                  VCC1V8_DSP_EN,        
	output                  VCC1V5_DSP_EN,				
	output                  VCC0V75_DSP_EN,

	input                   vcc2p5_en_o,			
	input                   vcc1p8_dsp_en_o,        
	input                   vcc1p5_dsp_en_o,				
	input                   vcc0p75_dsp_en_o,
	
	// GPIO for DSP
	inout		[15:0]		DSPA_GPIO,
	inout		[15:0]		DSPB_GPIO,
	
	output		[15:0]		dspa_gpio_i,					
	input		[15:0]		dspa_gpio_o,					
	input					dspa_gpio_en,					
	
	output		[15:0]		dspb_gpio_i,					
	input		[15:0]		dspb_gpio_o,					
	input					dspb_gpio_en,	
	
	// reset input
	input					FULL_RST,
	input					DSPA_WARM_RST,
	input					DSPB_WARM_RST,
	input					V7_RST,
	output					V7_RESET,
	input					DSPA_TRGRSTZ,
	input					DSPB_TRGRSTZ,
	
	output					full_reset_i,					
	output					dspa_warm_reset_i,				
	output					dspb_warm_reset_i,				
	output					fpga_rst_i,						
	input					fpga_rst_o,						
	output					dspa_trgrstz_i, 				
	output					dspb_trgrstz_i, 				
	
	// DSP debug LEDs
	output		[3:0]		DSPA_DEBUG_LED,
	output		[3:0]		DSPB_DEBUG_LED,

	input       [3:0]		dspa_debug_led_o,	
	input       [3:0]		dspb_debug_led_o,				
	
	// DSP relative ctrl and status
	output 					DSPA_PORZ,					
	output 					DSPA_RESETFULLZ,				
	output 					DSPA_RESETZ,					
	output 					DSPA_LRESETZ,					
	output 		[3:0]		DSPA_CORESEL,					
	input  					DSPA_RESETSTAT_N,				
	output 					DSPA_NMIZ,					
	output 					DSPA_LRESETNMIENZ,			
	input  					DSPA_BOOTCOMPLETE,            
	output 					DSPA_PACLKSEL,				
	input  					DSPA_HOUT,					
	input  					DSPA_SYSCLKOUT,				
	output 					DSPA_TIMI0,					
	
	output 					DSPB_PORZ,					
	output 					DSPB_RESETFULLZ,				
	output 					DSPB_RESETZ,					
	output 					DSPB_LRESETZ,					
	output 		[3:0]		DSPB_CORESEL,					
	input  					DSPB_RESETSTAT_N,				
	output 					DSPB_NMIZ,					
	output 					DSPB_LRESETNMIENZ,			
	input  					DSPB_BOOTCOMPLETE,            
	output 					DSPB_PACLKSEL,				
	input  					DSPB_HOUT,					
	input  					DSPB_SYSCLKOUT,				
	output 					DSPB_TIMI0,	

	input 					dspa_porz_o,					
	input 					dspa_resetfullz_o,				
	input 					dspa_resetz_o,					
	input 					dspa_lresetz_o,					
	input 		[3:0]		dspa_coresel_o,					
	output 					dspa_resetstat_n_i,				
	input 					dspa_nmiz_o,					
	input 					dspa_lresetnmienz_o,			
	output 					dspa_bootcomplete_i,            
	input 					dspa_paclksel_o,				
	output 					dspa_hout_i,					
	output 					dspa_sysclkout_i,				
	input 					dspa_timi0_o,	

	input 					dspb_porz_o,					
	input 					dspb_resetfullz_o,				
	input 					dspb_resetz_o,					
	input 					dspb_lresetz_o,					
	input 		[3:0]		dspb_coresel_o,					
	output 					dspb_resetstat_n_i,				
	input 					dspb_nmiz_o,					
	input 					dspb_lresetnmienz_o,			
	output 					dspb_bootcomplete_i,            
	input 					dspb_paclksel_o,				
	output 					dspb_hout_i,					
	output 					dspb_sysclkout_i,				
	input 					dspb_timi0_o,	
	
	// PHY Interface	
	input					DSPA_PHY_INIT,
	input					DSPB_PHY_INIT,

	output					DSPA_PHY_RST,
	output					DSPB_PHY_RST,
	
	output					dspa_phy_int_n_i,				
	input					dspa_phy_rst_n_o,				
	
	output					dspb_phy_int_n_i,				
	input					dspb_phy_rst_n_o,	
	
	// UCD9222 ctrl
	input					CVDD_A_PG,
	input					VCC_1V0_DSPA_PG,
	output					CVDD_A_EN,
	output					VCC_1V0_DSPA_EN,
	output					DSPA_UCD9222_RST,
	input					UCD9222_A_PG,

	input					CVDD_B_PG,
	input					VCC_1V0_DSPB_PG,
	output					CVDD_B_EN,
	output					VCC_1V0_DSPB_EN,
	output					DSPB_UCD9222_RST,
	input					UCD9222_B_PG,
	
	output 					dspa_ucd9222_pg1_i,				
	output 					dspa_ucd9222_pg2_i,				
	input 					dspa_ucd9222_ena1_o,   			
	input 					dspa_ucd9222_ena2_o,			
	output 					dspa_pgucd9222_i,				
	input 					dspa_ucd9222_rst_n_o,			
	
	output 					dspb_ucd9222_pg1_i,				
	output 					dspb_ucd9222_pg2_i,				
	input 					dspb_ucd9222_ena1_o,   			
	input 					dspb_ucd9222_ena2_o,			
	output 					dspb_pgucd9222_i,				
	input 					dspb_ucd9222_rst_n_o,

	// Smart-Reflex
	output					DSPA_PCA9306_EN,
	output					DSPB_PCA9306_EN,
	
	input                   dspa_pca9306_en_o,				
	input                   dspb_pca9306_en_o,				
	
	// DSP MISC ctrl
	output					DSPA_NAND_WP,					
	output					DSPA_NOR_WP,				
	output					DSPA_EEPROM_WP,				

	output 					DSPB_NAND_WP,					
	output 					DSPB_NOR_WP,				
	output 					DSPB_EEPROM_WP,
	
	input 					dspa_nand_wp_o,					
	input 					dspa_nor_wp_n_o,				
	input 					dspa_eeprom_wp_o,				

	input 					dspb_nand_wp_o,					
	input 					dspb_nor_wp_n_o,				
	input 					dspb_eeprom_wp_o,				
	
	// VID OE ctrl	
	output 					DSPA_VID_OE, 
	output 					DSPB_VID_OE, 

    input 					dspa_vid_oe_n_o, 
	input 					dspb_vid_oe_n_o, 
	
	// AD9516 ctrl
	output 					AD9516_1_CLOCK_RESET,
	output 					AD9516_1_CS, 
	output 					AD9516_1_PD,
	output 					AD9516_1_REFSEL,
	output 					AD9516_1_SCLK,
	output 					AD9516_1_SDI,
	input					AD9516_1_LD,
	
	output 					AD9516_2_CLOCK_RESET,
	output 					AD9516_2_CS, 
	output 					AD9516_2_PD,
	output 					AD9516_2_REFSEL,
	output 					AD9516_2_SCLK,
	output 					AD9516_2_SDI,
	input					AD9516_2_LD,
	
	input 					ad9516_1_clock_reset_o,
	input 					ad9516_1_cs_o, 
	input 					ad9516_1_pd_o,
	input 					ad9516_1_refsel_o,
	input 					ad9516_1_sclk_o,
	input 					ad9516_1_sdi_o,
	output					ad9516_1_ld_i,
	
	input 					ad9516_2_clock_reset_o,
	input 					ad9516_2_cs_o, 
	input 					ad9516_2_pd_o,
	input 					ad9516_2_refsel_o,
	input 					ad9516_2_sclk_o,
	input 					ad9516_2_sdi_o,
	output 					ad9516_2_ld_i,
	
	// SP3AN debug LEDs
	output		[7:0]		SP3AN_DEBUG_LED,
	output		[1:0]		FRONT_LED,
	
	input		[7:0]		sp3an_debug_led_o,
	input		[1:0]		front_led_o,

	// CPS1432 config
	output      [1:0]       SW_FSEL,
	output      [7:0]       SW_QFG,
	output                  SRIO_RST_N,
	output      [2:0]       SW_SPD,
	
	input       [1:0]       sw_fsel_o,
	input       [7:0]       sw_qfg_o,
	input                   srio_rst_n_o,
	input       [2:0]       sw_spd_o,

	// FMC ctrl
	output 					FMC1_PG_C2M,
	output 					FMC2_PG_C2M,
	
	input 					fmc1_pg_c2m_o,
	input 					fmc2_pg_c2m_o,
	
	// DSP TSIP	
	output 					DSPA_TSIP0_FSA0,
	output 					DSPA_TSIP0_CLKA0,
	output 					DSPB_TSIP0_FSA0,
	output 					DSPB_TSIP0_CLKA0,
	
	input 					dspa_tsip0_fsa0_o,
	input 					dspa_tsip0_clka0_o,
	input 					dspb_tsip0_fsa0_o,
	input 					dspb_tsip0_clka0_o
 );

// ========================================================
// system clk  
// ========================================================

assign	main_100mhz_clk_i	=	SP3AN_GCLK;

// ========================================================
// power good indication input except for DSP  
// ========================================================
	
assign	vcc1p0_pgood_i			=	VCC_1V0_PG;
assign	vcc3p3_fmc_pgood_i		=	VCC_3V3_FMC_PG;
assign	vcc_vadj_fmc_pgood_i	=	VCC_VADJ_FMC_PG;
assign	vcc1p2_pgood_i          =	VCC_1V2_PG;
assign	vcc1p8_fpga_pgood_i     =	VCC_1V8_FPGA_PG;
assign	vcc1p5_fpga_pgood_i     =	VCC_1V5_FPGA_PG;
assign	vcc0p75_fpga_pgood_i    =	VCC_0V75_FPGA_PG;
assign	vcc1p0_mgtavcc_pgood_i  =	MGTAVCC_1V0_PG;
assign	vcc1p2_mgtavtt_pgood_i  =	MGTAVTT_1V2_PG;
assign	vcc3p3_pgood_i          =	VCC_3V3_PG;

// ========================================================
// DSP SPI interface  
// ========================================================

assign	dspa_sspcs1_i	=	(~sys_pgood_o) ? 1'b1 : DSPA_SSPCS1;
assign	dspa_sspck_i	=	(~sys_pgood_o) ? 1'b0 : DSPA_SSPCK;
assign	DSPA_SSPMISO	=	(~sys_pgood_o) ? 1'b0 : dspa_sspcs1_i ? 1'bz : dspa_sspmiso_o;
assign	dspa_sspmosi_i	=	(~sys_pgood_o) ? 1'b0 : DSPA_SSPMOSI;

assign	dspb_sspcs1_i	=	(~sys_pgood_o) ? 1'b1 : DSPB_SSPCS1;
assign	dspb_sspck_i	=	(~sys_pgood_o) ? 1'b0 : DSPB_SSPCK;
assign	DSPB_SSPMISO	=	(~sys_pgood_o) ? 1'b0 : dspb_sspcs1_i ? 1'bz : dspb_sspmiso_o;
assign	dspb_sspmosi_i	=	(~sys_pgood_o) ? 1'b0 : DSPB_SSPMOSI;

// ========================================================
// DSP relative power good indication  
// ========================================================
	
assign	vcc2p5_pgood_i		 =   VCC_2V5_PG;
assign	vcc1p8_dsp_pgood_i   =   VCC1V8_DSP_PG; 
assign	vcc1p5_dsp_pgood_i   =   VCC1V5_DSP_PG; 
assign	vcc0p75_dsp_pgood_i  =   VCC0V75_DSP_PG;

// ========================================================
// DSP relative power ctrl 
// ========================================================

assign	VCC2V5_EN	   		 =	 vcc2p5_en_o;	
assign	VCC1V8_DSP_EN  		 =	 vcc1p8_dsp_en_o;    
assign	VCC1V5_DSP_EN		 =	 vcc1p5_dsp_en_o;		
assign	VCC0V75_DSP_EN 		 =	 vcc0p75_dsp_en_o;

// ========================================================
// GPIO for DSP 
// ========================================================

assign	dspa_gpio_i			 =	 DSPA_GPIO;
assign	DSPA_GPIO			 =	 (~sys_pgood_o) ? 16'h0 : (dspa_gpio_en ? dspa_gpio_o : 16'hz);
	
assign	dspb_gpio_i			 =	 DSPB_GPIO;
assign	DSPB_GPIO			 =	 (~sys_pgood_o) ? 16'h0 : (dspb_gpio_en ? dspb_gpio_o : 16'hz);

// ========================================================
// system reset  
// ========================================================
	
assign	full_reset_i		 =	 (~sys_pgood_o) ? 1'b1 : FULL_RST;
assign	dspa_warm_reset_i	 =	 (~sys_pgood_o) ? 1'b1 : DSPA_WARM_RST;
assign	dspb_warm_reset_i	 =	 (~sys_pgood_o) ? 1'b1 : DSPB_WARM_RST;
assign	fpga_rst_i			 =   (~sys_pgood_o) ? 1'b1 : V7_RST;
assign	V7_RESET			 =   (~sys_pgood_o) ? 1'b1 : fpga_rst_o;
assign	dspa_trgrstz_i		 =	 (~sys_pgood_o) ? 1'b1 : DSPA_TRGRSTZ;
assign	dspb_trgrstz_i		 =	 (~sys_pgood_o) ? 1'b1 : DSPB_TRGRSTZ;	
	
// ========================================================
// DSP debug LEDs  
// ========================================================
	
assign	DSPA_DEBUG_LED	 	 =	 (~sys_pgood_o) ? 4'b0 : dspa_debug_led_o;
assign	DSPB_DEBUG_LED	 	 =	 (~sys_pgood_o) ? 4'b0 : dspb_debug_led_o;

// ========================================================
// DSP relative ctrl and status  
// ========================================================

assign	DSPA_PORZ			 =	 (~sys_pgood_o) ? 1'b0 : dspa_porz_o;
assign	DSPA_RESETFULLZ		 =	 (~sys_pgood_o) ? 1'b0 : dspa_resetfullz_o;
assign	DSPA_RESETZ		     =	 (~sys_pgood_o) ? 1'b0 : dspa_resetz_o;
assign	DSPA_LRESETZ		 =	 (~sys_pgood_o) ? 1'b0 : dspa_lresetz_o;
assign	DSPA_CORESEL		 =	 (~sys_pgood_o) ? 4'b0 : dspa_coresel_o;
assign	DSPA_NMIZ		     =	 (~sys_pgood_o) ? 1'b0 : dspa_nmiz_o;
assign	DSPA_LRESETNMIENZ    =	 (~sys_pgood_o) ? 1'b0 : dspa_lresetnmienz_o;
assign	DSPA_PACLKSEL        =	 (~sys_pgood_o) ? 1'b0 : dspa_paclksel_o;
assign	DSPA_TIMI0           =	 (~sys_pgood_o) ? 1'b0 : dspa_timi0_o;
assign	dspa_bootcomplete_i  =	 (~sys_pgood_o) ? 1'b0 : DSPA_BOOTCOMPLETE;
assign	dspa_hout_i		     =	 (~sys_pgood_o) ? 1'b0 : DSPA_HOUT;
assign	dspa_sysclkout_i	 =	 (~sys_pgood_o) ? 1'b0 : DSPA_SYSCLKOUT;
assign	dspa_resetstat_n_i	 =	 (~sys_pgood_o) ? 1'b0 : DSPA_RESETSTAT_N;
	
assign	DSPB_PORZ			 =	 (~sys_pgood_o) ? 1'b0 : dspb_porz_o;
assign	DSPB_RESETFULLZ		 =	 (~sys_pgood_o) ? 1'b0 : dspb_resetfullz_o;
assign	DSPB_RESETZ		     =	 (~sys_pgood_o) ? 1'b0 : dspb_resetz_o;
assign	DSPB_LRESETZ		 =	 (~sys_pgood_o) ? 1'b0 : dspb_lresetz_o;
assign	DSPB_CORESEL		 =	 (~sys_pgood_o) ? 4'b0 : dspb_coresel_o;
assign	DSPB_NMIZ		     =	 (~sys_pgood_o) ? 1'b0 : dspb_nmiz_o;
assign	DSPB_LRESETNMIENZ    =	 (~sys_pgood_o) ? 1'b0 : dspb_lresetnmienz_o;
assign	DSPB_PACLKSEL        =	 (~sys_pgood_o) ? 1'b0 : dspb_paclksel_o;
assign	DSPB_TIMI0           =	 (~sys_pgood_o) ? 1'b0 : dspb_timi0_o;
assign	dspb_bootcomplete_i  =	 (~sys_pgood_o) ? 1'b0 : DSPB_BOOTCOMPLETE;
assign	dspb_hout_i		     =	 (~sys_pgood_o) ? 1'b0 : DSPB_HOUT;
assign	dspb_sysclkout_i	 =	 (~sys_pgood_o) ? 1'b0 : DSPB_SYSCLKOUT;
assign	dspb_resetstat_n_i	 =	 (~sys_pgood_o) ? 1'b0 : DSPB_RESETSTAT_N;	
	
// ========================================================
// PHY Interface  
// ========================================================
	
assign	DSPA_PHY_RST	 	 =	 (~sys_pgood_o) ? 1'b0 : dspa_phy_rst_n_o;	
assign	DSPB_PHY_RST	 	 =	 (~sys_pgood_o) ? 1'b0 : dspb_phy_rst_n_o;	
assign	dspa_phy_int_n_i	 =	 (~sys_pgood_o) ? 1'b0 : DSPA_PHY_INIT;	
assign	dspb_phy_int_n_i	 =	 (~sys_pgood_o) ? 1'b0 : DSPB_PHY_INIT;

// ========================================================
// UCD9222 ctrl  
// ========================================================
	
assign	CVDD_A_EN	 	 	 =	 dspa_ucd9222_ena1_o;	
assign	VCC_1V0_DSPA_EN	 	 =	 dspa_ucd9222_ena2_o;	
assign	DSPA_UCD9222_RST	 =	 dspa_ucd9222_rst_n_o;	
assign	dspa_ucd9222_pg1_i	 =	 CVDD_A_PG;
assign	dspa_ucd9222_pg2_i	 =	 VCC_1V0_DSPA_PG;
assign	dspa_pgucd9222_i	 =	 UCD9222_A_PG;

assign	CVDD_B_EN	 	 	 =	 dspb_ucd9222_ena1_o;	
assign	VCC_1V0_DSPB_EN	 	 =	 dspb_ucd9222_ena2_o;	
assign	DSPB_UCD9222_RST	 =	 dspb_ucd9222_rst_n_o;	
assign	dspb_ucd9222_pg1_i	 =	 CVDD_B_PG;
assign	dspb_ucd9222_pg2_i	 =	 VCC_1V0_DSPB_PG;
assign	dspb_pgucd9222_i	 =	 UCD9222_B_PG;	

// ========================================================
// Smart-Reflex  
// ========================================================
	
assign	DSPA_PCA9306_EN	 	=	 (~sys_pgood_o) ? 1'b0 : dspa_pca9306_en_o;	
assign	DSPB_PCA9306_EN	 	=	 (~sys_pgood_o) ? 1'b0 : dspb_pca9306_en_o;	

// ========================================================
// DSP MISC ctrl  
// ========================================================

assign	DSPA_NAND_WP	 	=	 (~sys_pgood_o) ? 1'b0 : dspa_nand_wp_o;
assign	DSPA_NOR_WP		 	=	 (~sys_pgood_o) ? 1'b0 : dspa_nor_wp_n_o;
assign	DSPA_EEPROM_WP		=	 (~sys_pgood_o) ? 1'b0 : dspa_eeprom_wp_o;

assign	DSPB_NAND_WP	 	=	 (~sys_pgood_o) ? 1'b0 : dspb_nand_wp_o;
assign	DSPB_NOR_WP		 	=	 (~sys_pgood_o) ? 1'b0 : dspb_nor_wp_n_o;
assign	DSPB_EEPROM_WP		=	 (~sys_pgood_o) ? 1'b0 : dspb_eeprom_wp_o;	
	
// ========================================================
// VID OE ctrl  
// ========================================================

assign	DSPA_VID_OE			=	 dspa_vid_oe_n_o;	
assign	DSPB_VID_OE			=	 dspb_vid_oe_n_o;	
	
// ========================================================
// AD9516 ctrl  
// ========================================================
	
assign	AD9516_1_CLOCK_RESET  =  ad9516_1_clock_reset_o;
assign	AD9516_1_CS	          =  ad9516_1_cs_o; 
assign	AD9516_1_PD	          =  ad9516_1_pd_o;
assign	AD9516_1_REFSEL	      =  ad9516_1_refsel_o;
assign	AD9516_1_SCLK	      =  ad9516_1_sclk_o;
assign	AD9516_1_SDI	      =  ad9516_1_sdi_o;
assign	ad9516_1_ld_i		  =  AD9516_1_LD;	
	
assign	AD9516_2_CLOCK_RESET  =  ad9516_2_clock_reset_o;
assign	AD9516_2_CS	          =  ad9516_2_cs_o; 
assign	AD9516_2_PD	          =  ad9516_2_pd_o;
assign	AD9516_2_REFSEL	      =  ad9516_2_refsel_o;
assign	AD9516_2_SCLK	      =  ad9516_2_sclk_o;
assign	AD9516_2_SDI	      =  ad9516_2_sdi_o;
assign	ad9516_2_ld_i		  =  AD9516_2_LD;

// ========================================================
// SP3AN debug LEDs  
// ========================================================

assign	SP3AN_DEBUG_LED		  =  sp3an_debug_led_o;
assign	FRONT_LED		  	  =  front_led_o;

// ========================================================
// CPS1432 config  
// ========================================================

assign	SW_FSEL				  =  sw_fsel_o;
assign	SW_QFG                =  sw_qfg_o;
assign	SRIO_RST_N            =  srio_rst_n_o;
assign	SW_SPD                =  sw_spd_o;

// ========================================================
// FMC ctrl  
// ========================================================

assign	FMC1_PG_C2M			  =  fmc1_pg_c2m_o;	
assign	FMC2_PG_C2M			  =  fmc2_pg_c2m_o;		
	
// ========================================================
// FMC ctrl  
// ========================================================
	
assign	DSPA_TSIP0_FSA0		  =  (~sys_pgood_o) ? 1'b0 : dspa_tsip0_fsa0_o;
assign	DSPA_TSIP0_CLKA0	  =  (~sys_pgood_o) ? 1'b0 : dspa_tsip0_clka0_o;
assign	DSPB_TSIP0_FSA0		  =  (~sys_pgood_o) ? 1'b0 : dspb_tsip0_fsa0_o;
assign	DSPB_TSIP0_CLKA0	  =  (~sys_pgood_o) ? 1'b0 : dspb_tsip0_clka0_o;
	
endmodule 