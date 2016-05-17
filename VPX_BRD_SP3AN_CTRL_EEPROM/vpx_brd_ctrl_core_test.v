`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:41:48 05/16/2016
// Design Name:   vpx_brd_ctrl_core
// Module Name:   D:/lrh_workspace/projects/simulator_new/fpga_projects/VPX_BRD_SP3AN_CTRL/vpx_brd_ctrl_core_test.v
// Project Name:  VPX_BRD_SP3AN_CTRL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vpx_brd_ctrl_core
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vpx_brd_ctrl_core_test;

	// Inputs
	reg main_100mhz_clk_i;
	reg vcc1p0_pgood_i;
	reg vcc3p3_fmc_pgood_i;
	reg vcc_vadj_fmc_pgood_i;
	reg vcc1p2_pgood_i;
	reg vcc1p8_fpga_pgood_i;
	reg vcc1p5_fpga_pgood_i;
	reg vcc0p75_fpga_pgood_i;
	reg vcc1p0_mgtavcc_pgood_i;
	reg vcc1p2_mgtavtt_pgood_i;
	reg vcc3p3_pgood_i;
	reg dspa_sspcs1_i;
	reg dspa_sspck_i;
	reg dspa_sspmosi_i;
	reg dspb_sspcs1_i;
	reg dspb_sspck_i;
	reg dspb_sspmosi_i;
	reg vcc2p5_pgood_i;
	reg vcc1p8_dsp_pgood_i;
	reg vcc1p5_dsp_pgood_i;
	reg vcc0p75_dsp_pgood_i;
	reg [15:0] dspa_gpio_i;
	reg [15:0] dspb_gpio_i;
	reg full_reset_i;
	reg dspa_warm_reset_i;
	reg dspb_warm_reset_i;
	reg fpga_rst_i;
	reg dspa_trgrstz_i;
	reg dspb_trgrstz_i;
	reg dspa_resetstat_n_i;
	reg dspa_bootcomplete_i;
	reg dspa_hout_i;
	reg dspa_sysclkout_i;
	reg dspb_resetstat_n_i;
	reg dspb_bootcomplete_i;
	reg dspb_hout_i;
	reg dspb_sysclkout_i;
	reg dspa_phy_int_n_i;
	reg dspb_phy_int_n_i;
	reg dspa_ucd9222_pg1_i;
	reg dspa_ucd9222_pg2_i;
	reg dspa_pgucd9222_i;
	reg dspb_ucd9222_pg1_i;
	reg dspb_ucd9222_pg2_i;
	reg dspb_pgucd9222_i;
	reg ad9516_1_ld_i;
	reg ad9516_2_ld_i;

	// Outputs
	wire dspa_sspmiso_o;
	wire dspb_sspmiso_o;
	wire sys_pgood_o;
	wire vcc2p5_en_o;
	wire vcc1p8_dsp_en_o;
	wire vcc1p5_dsp_en_o;
	wire vcc0p75_dsp_en_o;
	wire [15:0] dspa_gpio_o;
	wire dspa_gpio_en;
	wire [15:0] dspb_gpio_o;
	wire dspb_gpio_en;
	wire fpga_rst_o;
	wire [3:0] dspa_debug_led_o;
	wire [3:0] dspb_debug_led_o;
	wire dspa_porz_o;
	wire dspa_resetfullz_o;
	wire dspa_resetz_o;
	wire dspa_lresetz_o;
	wire [3:0] dspa_coresel_o;
	wire dspa_nmiz_o;
	wire dspa_lresetnmienz_o;
	wire dspa_paclksel_o;
	wire dspa_timi0_o;
	wire dspb_porz_o;
	wire dspb_resetfullz_o;
	wire dspb_resetz_o;
	wire dspb_lresetz_o;
	wire [3:0] dspb_coresel_o;
	wire dspb_nmiz_o;
	wire dspb_lresetnmienz_o;
	wire dspb_paclksel_o;
	wire dspb_timi0_o;
	wire dspa_phy_rst_n_o;
	wire dspb_phy_rst_n_o;
	wire dspa_ucd9222_ena1_o;
	wire dspa_ucd9222_ena2_o;
	wire dspa_ucd9222_rst_n_o;
	wire dspb_ucd9222_ena1_o;
	wire dspb_ucd9222_ena2_o;
	wire dspb_ucd9222_rst_n_o;
	wire dspa_pca9306_en_o;
	wire dspb_pca9306_en_o;
	wire dspa_nand_wp_o;
	wire dspa_nor_wp_n_o;
	wire dspa_eeprom_wp_o;
	wire dspb_nand_wp_o;
	wire dspb_nor_wp_n_o;
	wire dspb_eeprom_wp_o;
	wire dspa_vid_oe_n_o;
	wire dspb_vid_oe_n_o;
	wire ad9516_1_clock_reset_o;
	wire ad9516_1_cs_o;
	wire ad9516_1_pd_o;
	wire ad9516_1_refsel_o;
	wire ad9516_1_sclk_o;
	wire ad9516_1_sdi_o;
	wire ad9516_2_clock_reset_o;
	wire ad9516_2_cs_o;
	wire ad9516_2_pd_o;
	wire ad9516_2_refsel_o;
	wire ad9516_2_sclk_o;
	wire ad9516_2_sdi_o;
	wire [7:0] sp3an_debug_led_o;
	wire [1:0] front_led_o;
	wire [1:0] sw_fsel_o;
	wire [7:0] sw_qfg_o;
	wire srio_rst_n_o;
	wire [2:0] sw_spd_o;
	wire fmc1_pg_c2m_o;
	wire fmc2_pg_c2m_o;
	wire dspa_tsip0_fsa0_o;
	wire dspa_tsip0_clka0_o;
	wire dspb_tsip0_fsa0_o;
	wire dspb_tsip0_clka0_o;
	wire SCL;

	// Bidirs
	wire SDA;

	// Instantiate the Unit Under Test (UUT)
	vpx_brd_ctrl_core uut (
		.main_100mhz_clk_i(main_100mhz_clk_i), 
		.vcc1p0_pgood_i(vcc1p0_pgood_i), 
		.vcc3p3_fmc_pgood_i(vcc3p3_fmc_pgood_i), 
		.vcc_vadj_fmc_pgood_i(vcc_vadj_fmc_pgood_i), 
		.vcc1p2_pgood_i(vcc1p2_pgood_i), 
		.vcc1p8_fpga_pgood_i(vcc1p8_fpga_pgood_i), 
		.vcc1p5_fpga_pgood_i(vcc1p5_fpga_pgood_i), 
		.vcc0p75_fpga_pgood_i(vcc0p75_fpga_pgood_i), 
		.vcc1p0_mgtavcc_pgood_i(vcc1p0_mgtavcc_pgood_i), 
		.vcc1p2_mgtavtt_pgood_i(vcc1p2_mgtavtt_pgood_i), 
		.vcc3p3_pgood_i(vcc3p3_pgood_i), 
		.dspa_sspcs1_i(dspa_sspcs1_i), 
		.dspa_sspck_i(dspa_sspck_i), 
		.dspa_sspmiso_o(dspa_sspmiso_o), 
		.dspa_sspmosi_i(dspa_sspmosi_i), 
		.dspb_sspcs1_i(dspb_sspcs1_i), 
		.dspb_sspck_i(dspb_sspck_i), 
		.dspb_sspmiso_o(dspb_sspmiso_o), 
		.dspb_sspmosi_i(dspb_sspmosi_i), 
		.vcc2p5_pgood_i(vcc2p5_pgood_i), 
		.vcc1p8_dsp_pgood_i(vcc1p8_dsp_pgood_i), 
		.vcc1p5_dsp_pgood_i(vcc1p5_dsp_pgood_i), 
		.vcc0p75_dsp_pgood_i(vcc0p75_dsp_pgood_i), 
		.sys_pgood_o(sys_pgood_o), 
		.vcc2p5_en_o(vcc2p5_en_o), 
		.vcc1p8_dsp_en_o(vcc1p8_dsp_en_o), 
		.vcc1p5_dsp_en_o(vcc1p5_dsp_en_o), 
		.vcc0p75_dsp_en_o(vcc0p75_dsp_en_o), 
		.dspa_gpio_i(dspa_gpio_i), 
		.dspa_gpio_o(dspa_gpio_o), 
		.dspa_gpio_en(dspa_gpio_en), 
		.dspb_gpio_i(dspb_gpio_i), 
		.dspb_gpio_o(dspb_gpio_o), 
		.dspb_gpio_en(dspb_gpio_en), 
		.full_reset_i(full_reset_i), 
		.dspa_warm_reset_i(dspa_warm_reset_i), 
		.dspb_warm_reset_i(dspb_warm_reset_i), 
		.fpga_rst_i(fpga_rst_i), 
		.fpga_rst_o(fpga_rst_o), 
		.dspa_trgrstz_i(dspa_trgrstz_i), 
		.dspb_trgrstz_i(dspb_trgrstz_i), 
		.dspa_debug_led_o(dspa_debug_led_o), 
		.dspb_debug_led_o(dspb_debug_led_o), 
		.dspa_porz_o(dspa_porz_o), 
		.dspa_resetfullz_o(dspa_resetfullz_o), 
		.dspa_resetz_o(dspa_resetz_o), 
		.dspa_lresetz_o(dspa_lresetz_o), 
		.dspa_coresel_o(dspa_coresel_o), 
		.dspa_resetstat_n_i(dspa_resetstat_n_i), 
		.dspa_nmiz_o(dspa_nmiz_o), 
		.dspa_lresetnmienz_o(dspa_lresetnmienz_o), 
		.dspa_bootcomplete_i(dspa_bootcomplete_i), 
		.dspa_paclksel_o(dspa_paclksel_o), 
		.dspa_hout_i(dspa_hout_i), 
		.dspa_sysclkout_i(dspa_sysclkout_i), 
		.dspa_timi0_o(dspa_timi0_o), 
		.dspb_porz_o(dspb_porz_o), 
		.dspb_resetfullz_o(dspb_resetfullz_o), 
		.dspb_resetz_o(dspb_resetz_o), 
		.dspb_lresetz_o(dspb_lresetz_o), 
		.dspb_coresel_o(dspb_coresel_o), 
		.dspb_resetstat_n_i(dspb_resetstat_n_i), 
		.dspb_nmiz_o(dspb_nmiz_o), 
		.dspb_lresetnmienz_o(dspb_lresetnmienz_o), 
		.dspb_bootcomplete_i(dspb_bootcomplete_i), 
		.dspb_paclksel_o(dspb_paclksel_o), 
		.dspb_hout_i(dspb_hout_i), 
		.dspb_sysclkout_i(dspb_sysclkout_i), 
		.dspb_timi0_o(dspb_timi0_o), 
		.dspa_phy_int_n_i(dspa_phy_int_n_i), 
		.dspa_phy_rst_n_o(dspa_phy_rst_n_o), 
		.dspb_phy_int_n_i(dspb_phy_int_n_i), 
		.dspb_phy_rst_n_o(dspb_phy_rst_n_o), 
		.dspa_ucd9222_pg1_i(dspa_ucd9222_pg1_i), 
		.dspa_ucd9222_pg2_i(dspa_ucd9222_pg2_i), 
		.dspa_ucd9222_ena1_o(dspa_ucd9222_ena1_o), 
		.dspa_ucd9222_ena2_o(dspa_ucd9222_ena2_o), 
		.dspa_pgucd9222_i(dspa_pgucd9222_i), 
		.dspa_ucd9222_rst_n_o(dspa_ucd9222_rst_n_o), 
		.dspb_ucd9222_pg1_i(dspb_ucd9222_pg1_i), 
		.dspb_ucd9222_pg2_i(dspb_ucd9222_pg2_i), 
		.dspb_ucd9222_ena1_o(dspb_ucd9222_ena1_o), 
		.dspb_ucd9222_ena2_o(dspb_ucd9222_ena2_o), 
		.dspb_pgucd9222_i(dspb_pgucd9222_i), 
		.dspb_ucd9222_rst_n_o(dspb_ucd9222_rst_n_o), 
		.dspa_pca9306_en_o(dspa_pca9306_en_o), 
		.dspb_pca9306_en_o(dspb_pca9306_en_o), 
		.dspa_nand_wp_o(dspa_nand_wp_o), 
		.dspa_nor_wp_n_o(dspa_nor_wp_n_o), 
		.dspa_eeprom_wp_o(dspa_eeprom_wp_o), 
		.dspb_nand_wp_o(dspb_nand_wp_o), 
		.dspb_nor_wp_n_o(dspb_nor_wp_n_o), 
		.dspb_eeprom_wp_o(dspb_eeprom_wp_o), 
		.dspa_vid_oe_n_o(dspa_vid_oe_n_o), 
		.dspb_vid_oe_n_o(dspb_vid_oe_n_o), 
		.ad9516_1_clock_reset_o(ad9516_1_clock_reset_o), 
		.ad9516_1_cs_o(ad9516_1_cs_o), 
		.ad9516_1_pd_o(ad9516_1_pd_o), 
		.ad9516_1_refsel_o(ad9516_1_refsel_o), 
		.ad9516_1_sclk_o(ad9516_1_sclk_o), 
		.ad9516_1_sdi_o(ad9516_1_sdi_o), 
		.ad9516_1_ld_i(ad9516_1_ld_i), 
		.ad9516_2_clock_reset_o(ad9516_2_clock_reset_o), 
		.ad9516_2_cs_o(ad9516_2_cs_o), 
		.ad9516_2_pd_o(ad9516_2_pd_o), 
		.ad9516_2_refsel_o(ad9516_2_refsel_o), 
		.ad9516_2_sclk_o(ad9516_2_sclk_o), 
		.ad9516_2_sdi_o(ad9516_2_sdi_o), 
		.ad9516_2_ld_i(ad9516_2_ld_i), 
		.sp3an_debug_led_o(sp3an_debug_led_o), 
		.front_led_o(front_led_o), 
		.sw_fsel_o(sw_fsel_o), 
		.sw_qfg_o(sw_qfg_o), 
		.srio_rst_n_o(srio_rst_n_o), 
		.sw_spd_o(sw_spd_o), 
		.fmc1_pg_c2m_o(fmc1_pg_c2m_o), 
		.fmc2_pg_c2m_o(fmc2_pg_c2m_o), 
		.dspa_tsip0_fsa0_o(dspa_tsip0_fsa0_o), 
		.dspa_tsip0_clka0_o(dspa_tsip0_clka0_o), 
		.dspb_tsip0_fsa0_o(dspb_tsip0_fsa0_o), 
		.dspb_tsip0_clka0_o(dspb_tsip0_clka0_o), 
		.SDA(SDA), 
		.SCL(SCL)
	);

	initial begin
		// Initialize Inputs
		main_100mhz_clk_i = 0;
		vcc1p0_pgood_i = 0;
		vcc3p3_fmc_pgood_i = 0;
		vcc_vadj_fmc_pgood_i = 0;
		vcc1p2_pgood_i = 0;
		vcc1p8_fpga_pgood_i = 0;
		vcc1p5_fpga_pgood_i = 0;
		vcc0p75_fpga_pgood_i = 0;
		vcc1p0_mgtavcc_pgood_i = 0;
		vcc1p2_mgtavtt_pgood_i = 0;
		vcc3p3_pgood_i = 0;
		dspa_sspcs1_i = 0;
		dspa_sspck_i = 0;
		dspa_sspmosi_i = 0;
		dspb_sspcs1_i = 0;
		dspb_sspck_i = 0;
		dspb_sspmosi_i = 0;
		vcc2p5_pgood_i = 0;
		vcc1p8_dsp_pgood_i = 0;
		vcc1p5_dsp_pgood_i = 0;
		vcc0p75_dsp_pgood_i = 0;
		dspa_gpio_i = 0;
		dspb_gpio_i = 0;
		full_reset_i = 0;
		dspa_warm_reset_i = 0;
		dspb_warm_reset_i = 0;
		fpga_rst_i = 0;
		dspa_trgrstz_i = 0;
		dspb_trgrstz_i = 0;
		dspa_resetstat_n_i = 0;
		dspa_bootcomplete_i = 0;
		dspa_hout_i = 0;
		dspa_sysclkout_i = 0;
		dspb_resetstat_n_i = 0;
		dspb_bootcomplete_i = 0;
		dspb_hout_i = 0;
		dspb_sysclkout_i = 0;
		dspa_phy_int_n_i = 0;
		dspb_phy_int_n_i = 0;
		dspa_ucd9222_pg1_i = 0;
		dspa_ucd9222_pg2_i = 0;
		dspa_pgucd9222_i = 0;
		dspb_ucd9222_pg1_i = 0;
		dspb_ucd9222_pg2_i = 0;
		dspb_pgucd9222_i = 0;
		ad9516_1_ld_i = 0;
		ad9516_2_ld_i = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

