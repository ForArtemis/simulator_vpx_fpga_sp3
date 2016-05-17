`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:32 10/5/2015 
// Design Name: 
// Module Name:    VPX_BRD_SP3AN_CTRL 
// Project Name: 
// Target Devices: X3S400AN-FGG400
// Tool versions:  ISE-14.7
// Description:    1. sub module inst process
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

module VPX_BRD_SP3AN_CTRL
(
	// system clk input
	input				    SP3AN_GCLK,
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
	// DSP SPI interface
	input					DSPA_SSPCS1,
	input					DSPA_SSPCK,
	output					DSPA_SSPMISO,
	input					DSPA_SSPMOSI,
	
	input					DSPB_SSPCS1,
	input					DSPB_SSPCK,
	output					DSPB_SSPMISO,
	input					DSPB_SSPMOSI,
	// DSP relative power good indication input
	input					VCC_2V5_PG,
	input					VCC1V8_DSP_PG,
	input					VCC1V5_DSP_PG,
	input					VCC0V75_DSP_PG,
	// DSP relative power ctrl
	output                  VCC2V5_EN,			
	output                  VCC1V8_DSP_EN,        
	output                  VCC1V5_DSP_EN,				
	output                  VCC0V75_DSP_EN,
	// GPIO for DSP
	inout		[15:0]		DSPA_GPIO,
	inout		[15:0]		DSPB_GPIO,
	// reset input
	input					FULL_RST,
	input					DSPA_WARM_RST,
	input					DSPB_WARM_RST,
	input					V7_RST,
	output					V7_RESET,
	input					DSPA_TRGRSTZ,
	input					DSPB_TRGRSTZ,
	// DSP debug LEDs
	output		[3:0]		DSPA_DEBUG_LED,
	output		[3:0]		DSPB_DEBUG_LED,
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
	// PHY Interface	
	input					DSPA_PHY_INIT,
	input					DSPB_PHY_INIT,
	output					DSPA_PHY_RST,
	output					DSPB_PHY_RST,
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
	// Smart-Reflex
	output					DSPA_PCA9306_EN,
	output					DSPB_PCA9306_EN,
	// DSP MISC ctrl
	output					DSPA_NAND_WP,					
	output					DSPA_NOR_WP,				
	output					DSPA_EEPROM_WP,				
	output 					DSPB_NAND_WP,					
	output 					DSPB_NOR_WP,				
	output 					DSPB_EEPROM_WP,
	// VID OE ctrl	
	output 					DSPA_VID_OE, 
	output 					DSPB_VID_OE, 
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
	// SP3AN debug LEDs
	output		[7:0]		SP3AN_DEBUG_LED,
	output		[1:0]		FRONT_LED,
	// CPS1432 config
	output      [1:0]       SW_FSEL,
	output      [7:0]       SW_QFG,
	output                  SRIO_RST_N,
	output      [2:0]       SW_SPD,
	// FMC ctrl
	output 					FMC1_PG_C2M,
	output 					FMC2_PG_C2M,
	// DSP TSIP	
	output 					DSPA_TSIP0_FSA0,
	output 					DSPA_TSIP0_CLKA0,
	output 					DSPB_TSIP0_FSA0,
	output 					DSPB_TSIP0_CLKA0

); 
	
// ========================================================
// Internal signals
// ========================================================
	
// system clk 
wire					main_100mhz_clk_i;

// power good indication wire except for DSP
wire					vcc1p0_pgood_i;
wire					vcc3p3_fmc_pgood_i;
wire					vcc_vadj_fmc_pgood_i;
wire					vcc1p2_pgood_i;
wire					vcc1p8_fpga_pgood_i;
wire					vcc1p5_fpga_pgood_i;
wire					vcc0p75_fpga_pgood_i;
wire					vcc1p0_mgtavcc_pgood_i;
wire					vcc1p2_mgtavtt_pgood_i;
wire					vcc3p3_pgood_i;

// DSP SPI interface
wire					dspa_sspcs1_i;
wire					dspa_sspck_i;
wire					dspa_sspmiso_o;
wire					dspa_sspmosi_i;

wire					dspb_sspcs1_i;
wire					dspb_sspck_i;
wire					dspb_sspmiso_o;
wire					dspb_sspmosi_i;

// DSP relative power good indication wire
wire					vcc2p5_pgood_i;		
wire					vcc1p8_dsp_pgood_i;     
wire					vcc1p5_dsp_pgood_i;	    
wire					vcc0p75_dsp_pgood_i;

// board power good indication wire
wire					sys_pgood_o;

// DSP relative power ctrl
wire                    vcc2p5_en_o;			
wire                    vcc1p8_dsp_en_o;        
wire                    vcc1p5_dsp_en_o;				
wire                    vcc0p75_dsp_en_o;

// GPIO for DSP
wire		[15:0]		dspa_gpio_i;					
wire		[15:0]		dspa_gpio_o;					
wire					dspa_gpio_en;					

wire		[15:0]		dspb_gpio_i;					
wire		[15:0]		dspb_gpio_o;					
wire					dspb_gpio_en;	

// reset wire
wire					full_reset_i;					
wire					dspa_warm_reset_i;				
wire					dspb_warm_reset_i;				
wire					fpga_rst_i;						
wire					fpga_rst_o;						
wire					dspa_trgrstz_i; 				
wire					dspb_trgrstz_i; 				

// DSP debug LEDs
wire       [3:0]		dspa_debug_led_o;	
wire       [3:0]		dspb_debug_led_o;				

// DSP relative ctrl and status
wire 					dspa_porz_o;					
wire 					dspa_resetfullz_o;				
wire 					dspa_resetz_o;					
wire 					dspa_lresetz_o;					
wire 		[3:0]		dspa_coresel_o;					
wire 					dspa_resetstat_n_i;				
wire 					dspa_nmiz_o;					
wire 					dspa_lresetnmienz_o;			
wire 					dspa_bootcomplete_i;            
wire 					dspa_paclksel_o;				
wire 					dspa_hout_i;					
wire 					dspa_sysclkout_i;				
wire 					dspa_timi0_o;	

wire 					dspb_porz_o;					
wire 					dspb_resetfullz_o;				
wire 					dspb_resetz_o;					
wire 					dspb_lresetz_o;					
wire 		[3:0]		dspb_coresel_o;					
wire 					dspb_resetstat_n_i;				
wire 					dspb_nmiz_o;					
wire 					dspb_lresetnmienz_o;			
wire 					dspb_bootcomplete_i;            
wire 					dspb_paclksel_o;				
wire 					dspb_hout_i;					
wire 					dspb_sysclkout_i;				
wire 					dspb_timi0_o;	

// PHY Interface	
wire					dspa_phy_int_n_i;				
wire					dspa_phy_rst_n_o;				

wire					dspb_phy_int_n_i;				
wire					dspb_phy_rst_n_o;	

// UCD9222 ctrl
wire 					dspa_ucd9222_pg1_i;				
wire 					dspa_ucd9222_pg2_i;				
wire 					dspa_ucd9222_ena1_o;   			
wire 					dspa_ucd9222_ena2_o;			
wire 					dspa_pgucd9222_i;				
wire 					dspa_ucd9222_rst_n_o;			

wire 					dspb_ucd9222_pg1_i;				
wire 					dspb_ucd9222_pg2_i;				
wire 					dspb_ucd9222_ena1_o;   			
wire 					dspb_ucd9222_ena2_o;			
wire 					dspb_pgucd9222_i;				
wire 					dspb_ucd9222_rst_n_o;

// Smart-Reflex
wire                    dspa_pca9306_en_o;				
wire                    dspb_pca9306_en_o;				

// DSP MISC ctrl
wire 					dspa_nand_wp_o;					
wire 					dspa_nor_wp_n_o;				
wire 					dspa_eeprom_wp_o;				

wire 					dspb_nand_wp_o;					
wire 					dspb_nor_wp_n_o;				
wire 					dspb_eeprom_wp_o;				

// VID OE ctrl	
wire 					dspa_vid_oe_n_o; 
wire 					dspb_vid_oe_n_o; 

// AD9516 ctrl
wire 					ad9516_1_clock_reset_o;
wire 					ad9516_1_cs_o; 
wire 					ad9516_1_pd_o;
wire 					ad9516_1_refsel_o;
wire 					ad9516_1_sclk_o;
wire 					ad9516_1_sdi_o;
wire					ad9516_1_ld_i;

wire 					ad9516_2_clock_reset_o;
wire 					ad9516_2_cs_o; 
wire 					ad9516_2_pd_o;
wire 					ad9516_2_refsel_o;
wire 					ad9516_2_sclk_o;
wire 					ad9516_2_sdi_o;
wire 					ad9516_2_ld_i;

// SP3AN debug LEDs
wire		[7:0]		sp3an_debug_led_o;
wire		[1:0]		front_led_o;

// CPS1432 config
wire       [1:0]        sw_fsel_o;
wire       [7:0]        sw_qfg_o;
wire                    srio_rst_n_o;
wire       [2:0]        sw_spd_o;

// FMC ctrl
wire 					fmc1_pg_c2m_o;
wire 					fmc2_pg_c2m_o;

// DSP TSIP	
wire 					dspa_tsip0_fsa0_o;
wire 					dspa_tsip0_clka0_o;
wire 					dspb_tsip0_fsa0_o;
wire 					dspb_tsip0_clka0_o;	

// ========================================================
// Inst of vpx_brd_ctrl_pad module
// ========================================================

vpx_brd_ctrl_pad Inst_vpx_brd_ctrl_pad 
 (
    // system clk input
	.SP3AN_GCLK						(SP3AN_GCLK), 
    .main_100mhz_clk_i				(main_100mhz_clk_i), 
    // power good indication input except for DSP
	.VCC_1V0_PG						(VCC_1V0_PG), 
    .VCC_3V3_FMC_PG					(VCC_3V3_FMC_PG), 
    .VCC_VADJ_FMC_PG				(VCC_VADJ_FMC_PG), 
    .VCC_1V2_PG						(VCC_1V2_PG), 
    .VCC_1V8_FPGA_PG				(VCC_1V8_FPGA_PG), 
    .VCC_1V5_FPGA_PG				(VCC_1V5_FPGA_PG), 
    .VCC_0V75_FPGA_PG				(VCC_0V75_FPGA_PG), 
    .MGTAVCC_1V0_PG					(MGTAVCC_1V0_PG), 
    .MGTAVTT_1V2_PG					(MGTAVTT_1V2_PG), 
    .VCC_3V3_PG						(VCC_3V3_PG), 
    .vcc1p0_pgood_i					(vcc1p0_pgood_i), 
    .vcc3p3_fmc_pgood_i				(vcc3p3_fmc_pgood_i), 
    .vcc_vadj_fmc_pgood_i			(vcc_vadj_fmc_pgood_i), 
    .vcc1p2_pgood_i					(vcc1p2_pgood_i), 
    .vcc1p8_fpga_pgood_i			(vcc1p8_fpga_pgood_i), 
    .vcc1p5_fpga_pgood_i			(vcc1p5_fpga_pgood_i), 
    .vcc0p75_fpga_pgood_i			(vcc0p75_fpga_pgood_i), 
    .vcc1p0_mgtavcc_pgood_i			(vcc1p0_mgtavcc_pgood_i), 
    .vcc1p2_mgtavtt_pgood_i			(vcc1p2_mgtavtt_pgood_i), 
    .vcc3p3_pgood_i					(vcc3p3_pgood_i), 
	// DSP SPI interface
	.DSPA_SSPCS1					(DSPA_SSPCS1), 
    .DSPA_SSPCK						(DSPA_SSPCK), 
    .DSPA_SSPMISO					(DSPA_SSPMISO), 
    .DSPA_SSPMOSI					(DSPA_SSPMOSI), 
    .DSPB_SSPCS1					(DSPB_SSPCS1), 
    .DSPB_SSPCK						(DSPB_SSPCK), 
    .DSPB_SSPMISO					(DSPB_SSPMISO), 
    .DSPB_SSPMOSI					(DSPB_SSPMOSI), 
    .dspa_sspcs1_i					(dspa_sspcs1_i), 
    .dspa_sspck_i					(dspa_sspck_i), 
    .dspa_sspmiso_o					(dspa_sspmiso_o), 
    .dspa_sspmosi_i					(dspa_sspmosi_i), 
    .dspb_sspcs1_i					(dspb_sspcs1_i), 
    .dspb_sspck_i					(dspb_sspck_i), 
    .dspb_sspmiso_o					(dspb_sspmiso_o), 
    .dspb_sspmosi_i					(dspb_sspmosi_i), 
	// DSP relative power good indication input
	.VCC_2V5_PG						(VCC_2V5_PG), 
    .VCC1V8_DSP_PG					(VCC1V8_DSP_PG), 
    .VCC1V5_DSP_PG					(VCC1V5_DSP_PG), 
    .VCC0V75_DSP_PG					(VCC0V75_DSP_PG), 
    .vcc2p5_pgood_i					(vcc2p5_pgood_i), 
    .vcc1p8_dsp_pgood_i				(vcc1p8_dsp_pgood_i), 
    .vcc1p5_dsp_pgood_i				(vcc1p5_dsp_pgood_i), 
    .vcc0p75_dsp_pgood_i			(vcc0p75_dsp_pgood_i), 
	// board power good indication input
	.sys_pgood_o					(sys_pgood_o), 
	// DSP relative power ctrl
	.VCC2V5_EN						(VCC2V5_EN), 
    .VCC1V8_DSP_EN					(VCC1V8_DSP_EN), 
    .VCC1V5_DSP_EN					(VCC1V5_DSP_EN), 
    .VCC0V75_DSP_EN					(VCC0V75_DSP_EN), 
    .vcc2p5_en_o					(vcc2p5_en_o), 
    .vcc1p8_dsp_en_o				(vcc1p8_dsp_en_o), 
    .vcc1p5_dsp_en_o				(vcc1p5_dsp_en_o), 
    .vcc0p75_dsp_en_o				(vcc0p75_dsp_en_o), 
	// GPIO for DSP
	.DSPA_GPIO						(DSPA_GPIO), 
    .DSPB_GPIO						(DSPB_GPIO), 
    .dspa_gpio_i					(dspa_gpio_i), 
    .dspa_gpio_o					(dspa_gpio_o), 
    .dspa_gpio_en					(dspa_gpio_en), 
    .dspb_gpio_i					(dspb_gpio_i), 
    .dspb_gpio_o					(dspb_gpio_o), 
    .dspb_gpio_en					(dspb_gpio_en), 
    // reset input
	.FULL_RST						(FULL_RST), 
    .DSPA_WARM_RST					(DSPA_WARM_RST), 
    .DSPB_WARM_RST					(DSPB_WARM_RST), 
    .V7_RST							(V7_RST), 
    .V7_RESET						(V7_RESET), 
    .DSPA_TRGRSTZ					(DSPA_TRGRSTZ), 
    .DSPB_TRGRSTZ					(DSPB_TRGRSTZ), 
    .full_reset_i					(full_reset_i), 
    .dspa_warm_reset_i				(dspa_warm_reset_i), 
    .dspb_warm_reset_i				(dspb_warm_reset_i), 
    .fpga_rst_i						(fpga_rst_i), 
    .fpga_rst_o						(fpga_rst_o), 
    .dspa_trgrstz_i					(dspa_trgrstz_i), 
    .dspb_trgrstz_i					(dspb_trgrstz_i), 
	// DSP debug LEDs
	.DSPA_DEBUG_LED					(DSPA_DEBUG_LED), 
    .DSPB_DEBUG_LED					(DSPB_DEBUG_LED), 
    .dspa_debug_led_o				(dspa_debug_led_o), 
    .dspb_debug_led_o				(dspb_debug_led_o), 
	// DSP relative ctrl and status
	.DSPA_PORZ						(DSPA_PORZ), 
    .DSPA_RESETFULLZ				(DSPA_RESETFULLZ), 
    .DSPA_RESETZ					(DSPA_RESETZ), 
    .DSPA_LRESETZ					(DSPA_LRESETZ), 
    .DSPA_CORESEL					(DSPA_CORESEL), 
    .DSPA_RESETSTAT_N				(DSPA_RESETSTAT_N), 
    .DSPA_NMIZ						(DSPA_NMIZ), 
    .DSPA_LRESETNMIENZ				(DSPA_LRESETNMIENZ), 
    .DSPA_BOOTCOMPLETE				(DSPA_BOOTCOMPLETE), 
    .DSPA_PACLKSEL					(DSPA_PACLKSEL), 
    .DSPA_HOUT						(DSPA_HOUT), 
    .DSPA_SYSCLKOUT					(DSPA_SYSCLKOUT), 
    .DSPA_TIMI0						(DSPA_TIMI0), 
    .DSPB_PORZ						(DSPB_PORZ), 
    .DSPB_RESETFULLZ				(DSPB_RESETFULLZ), 
    .DSPB_RESETZ					(DSPB_RESETZ), 
    .DSPB_LRESETZ					(DSPB_LRESETZ), 
    .DSPB_CORESEL					(DSPB_CORESEL), 
    .DSPB_RESETSTAT_N				(DSPB_RESETSTAT_N), 
    .DSPB_NMIZ						(DSPB_NMIZ), 
    .DSPB_LRESETNMIENZ				(DSPB_LRESETNMIENZ), 
    .DSPB_BOOTCOMPLETE				(DSPB_BOOTCOMPLETE), 
    .DSPB_PACLKSEL					(DSPB_PACLKSEL), 
    .DSPB_HOUT						(DSPB_HOUT), 
    .DSPB_SYSCLKOUT					(DSPB_SYSCLKOUT), 
    .DSPB_TIMI0						(DSPB_TIMI0), 
    .dspa_porz_o					(dspa_porz_o), 
    .dspa_resetfullz_o				(dspa_resetfullz_o), 
    .dspa_resetz_o					(dspa_resetz_o), 
    .dspa_lresetz_o					(dspa_lresetz_o), 
    .dspa_coresel_o					(dspa_coresel_o), 
    .dspa_resetstat_n_i				(dspa_resetstat_n_i), 
    .dspa_nmiz_o					(dspa_nmiz_o), 
    .dspa_lresetnmienz_o			(dspa_lresetnmienz_o), 
    .dspa_bootcomplete_i			(dspa_bootcomplete_i), 
    .dspa_paclksel_o				(dspa_paclksel_o), 
    .dspa_hout_i					(dspa_hout_i), 
    .dspa_sysclkout_i				(dspa_sysclkout_i), 
    .dspa_timi0_o					(dspa_timi0_o), 
    .dspb_porz_o					(dspb_porz_o), 
    .dspb_resetfullz_o				(dspb_resetfullz_o), 
    .dspb_resetz_o					(dspb_resetz_o), 
    .dspb_lresetz_o					(dspb_lresetz_o), 
    .dspb_coresel_o					(dspb_coresel_o), 
    .dspb_resetstat_n_i				(dspb_resetstat_n_i), 
    .dspb_nmiz_o					(dspb_nmiz_o), 
    .dspb_lresetnmienz_o			(dspb_lresetnmienz_o), 
    .dspb_bootcomplete_i			(dspb_bootcomplete_i), 
    .dspb_paclksel_o				(dspb_paclksel_o), 
    .dspb_hout_i					(dspb_hout_i), 
    .dspb_sysclkout_i				(dspb_sysclkout_i), 
    .dspb_timi0_o					(dspb_timi0_o), 
    // PHY Interface	
	.DSPA_PHY_INIT					(DSPA_PHY_INIT), 
    .DSPB_PHY_INIT					(DSPB_PHY_INIT), 
    .DSPA_PHY_RST					(DSPA_PHY_RST), 
    .DSPB_PHY_RST					(DSPB_PHY_RST), 
    .dspa_phy_int_n_i				(dspa_phy_int_n_i), 
    .dspa_phy_rst_n_o				(dspa_phy_rst_n_o), 
    .dspb_phy_int_n_i				(dspb_phy_int_n_i), 
    .dspb_phy_rst_n_o				(dspb_phy_rst_n_o), 
    // UCD9222 ctrl
	.CVDD_A_PG						(CVDD_A_PG), 
    .VCC_1V0_DSPA_PG				(VCC_1V0_DSPA_PG), 
    .CVDD_A_EN						(CVDD_A_EN), 
    .VCC_1V0_DSPA_EN				(VCC_1V0_DSPA_EN), 
    .DSPA_UCD9222_RST				(DSPA_UCD9222_RST), 
    .UCD9222_A_PG					(UCD9222_A_PG), 
    .CVDD_B_PG						(CVDD_B_PG), 
    .VCC_1V0_DSPB_PG				(VCC_1V0_DSPB_PG), 
    .CVDD_B_EN						(CVDD_B_EN), 
    .VCC_1V0_DSPB_EN				(VCC_1V0_DSPB_EN), 
    .DSPB_UCD9222_RST				(DSPB_UCD9222_RST), 
    .UCD9222_B_PG					(UCD9222_B_PG), 
    .dspa_ucd9222_pg1_i				(dspa_ucd9222_pg1_i), 
    .dspa_ucd9222_pg2_i				(dspa_ucd9222_pg2_i), 
    .dspa_ucd9222_ena1_o			(dspa_ucd9222_ena1_o), 
    .dspa_ucd9222_ena2_o			(dspa_ucd9222_ena2_o), 
    .dspa_pgucd9222_i				(dspa_pgucd9222_i), 
    .dspa_ucd9222_rst_n_o			(dspa_ucd9222_rst_n_o), 
    .dspb_ucd9222_pg1_i				(dspb_ucd9222_pg1_i), 
    .dspb_ucd9222_pg2_i				(dspb_ucd9222_pg2_i), 
    .dspb_ucd9222_ena1_o			(dspb_ucd9222_ena1_o), 
    .dspb_ucd9222_ena2_o			(dspb_ucd9222_ena2_o), 
    .dspb_pgucd9222_i				(dspb_pgucd9222_i), 
    .dspb_ucd9222_rst_n_o			(dspb_ucd9222_rst_n_o), 
    // Smart-Reflex
	.DSPA_PCA9306_EN				(DSPA_PCA9306_EN), 
    .DSPB_PCA9306_EN				(DSPB_PCA9306_EN), 
    .dspa_pca9306_en_o				(dspa_pca9306_en_o), 
    .dspb_pca9306_en_o				(dspb_pca9306_en_o), 
	// DSP MISC ctrl	
	.DSPA_NAND_WP					(DSPA_NAND_WP), 
    .DSPA_NOR_WP					(DSPA_NOR_WP), 
    .DSPA_EEPROM_WP					(DSPA_EEPROM_WP), 
    .DSPB_NAND_WP					(DSPB_NAND_WP), 
    .DSPB_NOR_WP					(DSPB_NOR_WP), 
    .DSPB_EEPROM_WP					(DSPB_EEPROM_WP), 
    .dspa_nand_wp_o					(dspa_nand_wp_o), 
    .dspa_nor_wp_n_o				(dspa_nor_wp_n_o), 
    .dspa_eeprom_wp_o				(dspa_eeprom_wp_o), 
    .dspb_nand_wp_o					(dspb_nand_wp_o), 
    .dspb_nor_wp_n_o				(dspb_nor_wp_n_o), 
    .dspb_eeprom_wp_o				(dspb_eeprom_wp_o), 
	// VID OE ctrl		
	.DSPA_VID_OE					(DSPA_VID_OE), 
    .DSPB_VID_OE					(DSPB_VID_OE), 
    .dspa_vid_oe_n_o				(dspa_vid_oe_n_o), 
    .dspb_vid_oe_n_o				(dspb_vid_oe_n_o), 
	// AD9516 ctrl
	.AD9516_1_CLOCK_RESET			(AD9516_1_CLOCK_RESET), 
    .AD9516_1_CS					(AD9516_1_CS), 
    .AD9516_1_PD					(AD9516_1_PD), 
    .AD9516_1_REFSEL				(AD9516_1_REFSEL), 
    .AD9516_1_SCLK					(AD9516_1_SCLK), 
    .AD9516_1_SDI					(AD9516_1_SDI), 
    .AD9516_1_LD					(AD9516_1_LD), 
    .AD9516_2_CLOCK_RESET			(AD9516_2_CLOCK_RESET), 
    .AD9516_2_CS					(AD9516_2_CS), 
    .AD9516_2_PD					(AD9516_2_PD), 
    .AD9516_2_REFSEL				(AD9516_2_REFSEL), 
    .AD9516_2_SCLK					(AD9516_2_SCLK), 
    .AD9516_2_SDI					(AD9516_2_SDI), 
    .AD9516_2_LD					(AD9516_2_LD), 
    .ad9516_1_clock_reset_o			(ad9516_1_clock_reset_o), 
    .ad9516_1_cs_o					(ad9516_1_cs_o), 
    .ad9516_1_pd_o					(ad9516_1_pd_o), 
    .ad9516_1_refsel_o				(ad9516_1_refsel_o), 
    .ad9516_1_sclk_o				(ad9516_1_sclk_o), 
    .ad9516_1_sdi_o					(ad9516_1_sdi_o), 
    .ad9516_1_ld_i					(ad9516_1_ld_i), 
    .ad9516_2_clock_reset_o			(ad9516_2_clock_reset_o), 
    .ad9516_2_cs_o					(ad9516_2_cs_o), 
    .ad9516_2_pd_o					(ad9516_2_pd_o), 
    .ad9516_2_refsel_o				(ad9516_2_refsel_o), 
    .ad9516_2_sclk_o				(ad9516_2_sclk_o), 
    .ad9516_2_sdi_o					(ad9516_2_sdi_o), 
    .ad9516_2_ld_i					(ad9516_2_ld_i), 
	// SP3AN debug LEDs
	.SP3AN_DEBUG_LED				(SP3AN_DEBUG_LED), 
    .FRONT_LED						(FRONT_LED), 
    .sp3an_debug_led_o				(sp3an_debug_led_o), 
    .front_led_o					(front_led_o), 
	// CPS1432 config
	.SW_FSEL						(SW_FSEL), 
    .SW_QFG							(SW_QFG), 
    .SRIO_RST_N						(SRIO_RST_N), 
    .SW_SPD							(SW_SPD), 
    .sw_fsel_o						(sw_fsel_o), 
    .sw_qfg_o						(sw_qfg_o), 
    .srio_rst_n_o					(srio_rst_n_o), 
    .sw_spd_o						(sw_spd_o), 
	// FMC ctrl
	.FMC1_PG_C2M					(FMC1_PG_C2M), 
    .FMC2_PG_C2M					(FMC2_PG_C2M), 
    .fmc1_pg_c2m_o					(fmc1_pg_c2m_o), 
    .fmc2_pg_c2m_o					(fmc2_pg_c2m_o), 
    // DSP TSIP
	.DSPA_TSIP0_FSA0				(DSPA_TSIP0_FSA0), 
    .DSPA_TSIP0_CLKA0				(DSPA_TSIP0_CLKA0), 
    .DSPB_TSIP0_FSA0				(DSPB_TSIP0_FSA0), 
    .DSPB_TSIP0_CLKA0				(DSPB_TSIP0_CLKA0), 
    .dspa_tsip0_fsa0_o				(dspa_tsip0_fsa0_o), 
    .dspa_tsip0_clka0_o				(dspa_tsip0_clka0_o), 
    .dspb_tsip0_fsa0_o				(dspb_tsip0_fsa0_o), 
    .dspb_tsip0_clka0_o				(dspb_tsip0_clka0_o)
 );	
	
// ========================================================
// Inst of vpx_brd_ctrl_core module
// ========================================================
	
vpx_brd_ctrl_core Inst_vpx_brd_ctrl_core 
 (
    // system clk input
	.main_100mhz_clk_i		(main_100mhz_clk_i), 
    // power good indication input except for DSP
	.vcc1p0_pgood_i			(vcc1p0_pgood_i), 
    .vcc3p3_fmc_pgood_i		(vcc3p3_fmc_pgood_i), 
    .vcc_vadj_fmc_pgood_i	(vcc_vadj_fmc_pgood_i), 
    .vcc1p2_pgood_i			(vcc1p2_pgood_i), 
    .vcc1p8_fpga_pgood_i	(vcc1p8_fpga_pgood_i), 
    .vcc1p5_fpga_pgood_i	(vcc1p5_fpga_pgood_i), 
    .vcc0p75_fpga_pgood_i	(vcc0p75_fpga_pgood_i), 
    .vcc1p0_mgtavcc_pgood_i	(vcc1p0_mgtavcc_pgood_i), 
    .vcc1p2_mgtavtt_pgood_i	(vcc1p2_mgtavtt_pgood_i), 
    .vcc3p3_pgood_i			(vcc3p3_pgood_i), 
    // DSP SPI interface
	.dspa_sspcs1_i			(dspa_sspcs1_i), 
    .dspa_sspck_i			(dspa_sspck_i), 
    .dspa_sspmiso_o			(dspa_sspmiso_o), 
    .dspa_sspmosi_i			(dspa_sspmosi_i), 
    .dspb_sspcs1_i			(dspb_sspcs1_i), 
    .dspb_sspck_i			(dspb_sspck_i), 
    .dspb_sspmiso_o			(dspb_sspmiso_o), 
    .dspb_sspmosi_i			(dspb_sspmosi_i), 
	// DSP relative power good indication input
	.vcc2p5_pgood_i			(vcc2p5_pgood_i), 
    .vcc1p8_dsp_pgood_i		(vcc1p8_dsp_pgood_i), 
    .vcc1p5_dsp_pgood_i		(vcc1p5_dsp_pgood_i), 
    .vcc0p75_dsp_pgood_i	(vcc0p75_dsp_pgood_i), 
	// board power good indication
	.sys_pgood_o			(sys_pgood_o), 
    // DSP relative power ctrl output
	.vcc2p5_en_o			(vcc2p5_en_o), 
    .vcc1p8_dsp_en_o		(vcc1p8_dsp_en_o), 
    .vcc1p5_dsp_en_o		(vcc1p5_dsp_en_o), 
    .vcc0p75_dsp_en_o		(vcc0p75_dsp_en_o), 
    // DSP gpio
	.dspa_gpio_i			(dspa_gpio_i), 
    .dspa_gpio_o			(dspa_gpio_o), 
    .dspa_gpio_en			(dspa_gpio_en), 
    .dspb_gpio_i			(dspb_gpio_i), 
    .dspb_gpio_o			(dspb_gpio_o), 
    .dspb_gpio_en			(dspb_gpio_en), 
    // DSP relative reset input
	.full_reset_i			(full_reset_i), 
    .dspa_warm_reset_i		(dspa_warm_reset_i), 
    .dspb_warm_reset_i		(dspb_warm_reset_i), 
    .fpga_rst_i				(fpga_rst_i), 
    .fpga_rst_o				(fpga_rst_o), 
    .dspa_trgrstz_i			(dspa_trgrstz_i), 
    .dspb_trgrstz_i			(dspb_trgrstz_i), 
    // DSP debug leds
	.dspa_debug_led_o		(dspa_debug_led_o), 
    .dspb_debug_led_o		(dspb_debug_led_o), 
    // DSP relative ctrl and status 
	.dspa_porz_o			(dspa_porz_o), 
    .dspa_resetfullz_o		(dspa_resetfullz_o), 
    .dspa_resetz_o			(dspa_resetz_o), 
    .dspa_lresetz_o			(dspa_lresetz_o), 
    .dspa_coresel_o			(dspa_coresel_o), 
    .dspa_resetstat_n_i		(dspa_resetstat_n_i), 
    .dspa_nmiz_o			(dspa_nmiz_o), 
    .dspa_lresetnmienz_o	(dspa_lresetnmienz_o), 
    .dspa_bootcomplete_i	(dspa_bootcomplete_i), 
    .dspa_paclksel_o		(dspa_paclksel_o), 
    .dspa_hout_i			(dspa_hout_i), 
    .dspa_sysclkout_i		(dspa_sysclkout_i), 
    .dspa_timi0_o			(dspa_timi0_o), 
    .dspb_porz_o			(dspb_porz_o), 
    .dspb_resetfullz_o		(dspb_resetfullz_o), 
    .dspb_resetz_o			(dspb_resetz_o), 
    .dspb_lresetz_o			(dspb_lresetz_o), 
    .dspb_coresel_o			(dspb_coresel_o), 
    .dspb_resetstat_n_i		(dspb_resetstat_n_i), 
    .dspb_nmiz_o			(dspb_nmiz_o), 
    .dspb_lresetnmienz_o	(dspb_lresetnmienz_o), 
    .dspb_bootcomplete_i	(dspb_bootcomplete_i), 
    .dspb_paclksel_o		(dspb_paclksel_o), 
    .dspb_hout_i			(dspb_hout_i), 
    .dspb_sysclkout_i		(dspb_sysclkout_i), 
    .dspb_timi0_o			(dspb_timi0_o), 
    // DSP PHY ctrl
	.dspa_phy_int_n_i		(dspa_phy_int_n_i), 
    .dspa_phy_rst_n_o		(dspa_phy_rst_n_o), 
    .dspb_phy_int_n_i		(dspb_phy_int_n_i), 
    .dspb_phy_rst_n_o		(dspb_phy_rst_n_o), 
    // UCD9222 ctrl 
	.dspa_ucd9222_pg1_i		(dspa_ucd9222_pg1_i), 
    .dspa_ucd9222_pg2_i		(dspa_ucd9222_pg2_i), 
    .dspa_ucd9222_ena1_o	(dspa_ucd9222_ena1_o), 
    .dspa_ucd9222_ena2_o	(dspa_ucd9222_ena2_o), 
    .dspa_pgucd9222_i		(dspa_pgucd9222_i), 
    .dspa_ucd9222_rst_n_o	(dspa_ucd9222_rst_n_o), 
    .dspb_ucd9222_pg1_i		(dspb_ucd9222_pg1_i), 
    .dspb_ucd9222_pg2_i		(dspb_ucd9222_pg2_i), 
    .dspb_ucd9222_ena1_o	(dspb_ucd9222_ena1_o), 
    .dspb_ucd9222_ena2_o	(dspb_ucd9222_ena2_o), 
    .dspb_pgucd9222_i		(dspb_pgucd9222_i), 
    .dspb_ucd9222_rst_n_o	(dspb_ucd9222_rst_n_o), 
    // smart-reflex
	.dspa_pca9306_en_o		(dspa_pca9306_en_o), 
    .dspb_pca9306_en_o		(dspb_pca9306_en_o), 
    // DSP relative misc ctrl
	.dspa_nand_wp_o			(dspa_nand_wp_o), 
    .dspa_nor_wp_n_o		(dspa_nor_wp_n_o), 
    .dspa_eeprom_wp_o		(dspa_eeprom_wp_o), 
    .dspb_nand_wp_o			(dspb_nand_wp_o), 
    .dspb_nor_wp_n_o		(dspb_nor_wp_n_o), 
    .dspb_eeprom_wp_o		(dspb_eeprom_wp_o), 
    // DSP VID ctrl
	.dspa_vid_oe_n_o		(dspa_vid_oe_n_o), 
    .dspb_vid_oe_n_o		(dspb_vid_oe_n_o), 
    // AD9516 ctrl
	.ad9516_1_clock_reset_o	(ad9516_1_clock_reset_o), 
    .ad9516_1_cs_o			(ad9516_1_cs_o), 
    .ad9516_1_pd_o			(ad9516_1_pd_o), 
    .ad9516_1_refsel_o		(ad9516_1_refsel_o), 
    .ad9516_1_sclk_o		(ad9516_1_sclk_o), 
    .ad9516_1_sdi_o			(ad9516_1_sdi_o), 
    .ad9516_1_ld_i			(ad9516_1_ld_i), 
    .ad9516_2_clock_reset_o	(ad9516_2_clock_reset_o), 
    .ad9516_2_cs_o			(ad9516_2_cs_o), 
    .ad9516_2_pd_o			(ad9516_2_pd_o), 
    .ad9516_2_refsel_o		(ad9516_2_refsel_o), 
    .ad9516_2_sclk_o		(ad9516_2_sclk_o), 
    .ad9516_2_sdi_o			(ad9516_2_sdi_o), 
    .ad9516_2_ld_i			(ad9516_2_ld_i), 
    // SP3AN debug leds
	.sp3an_debug_led_o		(sp3an_debug_led_o), 
    .front_led_o			(front_led_o), 
    // SRIO bridge ctrl
	.sw_fsel_o				(sw_fsel_o), 
    .sw_qfg_o				(sw_qfg_o), 
    .srio_rst_n_o			(srio_rst_n_o), 
    .sw_spd_o				(sw_spd_o), 
    // FMC ctrl
	.fmc1_pg_c2m_o			(fmc1_pg_c2m_o), 
    .fmc2_pg_c2m_o			(fmc2_pg_c2m_o), 
    // DSP TSIP ctrl
	.dspa_tsip0_fsa0_o		(dspa_tsip0_fsa0_o), 
    .dspa_tsip0_clka0_o		(dspa_tsip0_clka0_o), 
    .dspb_tsip0_fsa0_o		(dspb_tsip0_fsa0_o), 
    .dspb_tsip0_clka0_o		(dspb_tsip0_clka0_o)
 );

endmodule 

