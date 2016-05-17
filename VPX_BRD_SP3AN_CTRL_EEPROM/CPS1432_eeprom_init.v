`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:25:45 05/13/2016 
// Design Name: 
// Module Name:    CPS1432_eeprom_init 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CPS1432_eeprom_init(
	
	input	wire	clk,
	input	wire	rst,
	
	input	wire	cfg_start,	//配置起始信号，上升沿触发配置
	
	inout	wire	SDA,
	output	wire	SCL
	
    );
	
	reg		cfg_start_r;
	always @(posedge clk) begin
		cfg_start_r <= cfg_start;
	end
	
	localparam	PORT_CONTROL_CSR_INIT_VAL = 32'hd040_0001;											
	wire		[31:0]	port_control_csr_dis[0:13];			//初始化好之前需要关闭端口
	wire		[31:0]	port_control_csr_en[0:13];			//初始化好之后打开端口	
	wire		[31:0]	port_control_csr_input_en[0:13];	//打开输入端口，可接收数据包，否则只能接收维护包，在最后使能
	genvar i;
	generate
		for (i = 0; i < 14; i = i + 1) 
		begin: port_control_csr_init
			// assign	port_control_csr_dis[i] 		= PORT_CONTROL_CSR_INIT_VAL | 32'h0080_0002;	//关闭所有端口，设置PORT_DIS和PORT_LOCKOUT																											
			// assign	port_control_csr_en[i]		 	= PORT_CONTROL_CSR_INIT_VAL & 32'hff70_fffd;	//打开端口，默认也为打开端口																							
			assign	port_control_csr_input_en[i] 	= PORT_CONTROL_CSR_INIT_VAL | 32'h0020_0000;	//重启后INPUT_PORT_EN为0，只能接收维护报，在这里置为1，使其能接收所有包
		end
	endgenerate
	
	wire	[31:0]	bcast_dev_rte_table[0:255];
	assign	bcast_dev_rte_table[1] = 3;
	assign	bcast_dev_rte_table[2] = 6;
	assign	bcast_dev_rte_table[3] = 2;
	assign	bcast_dev_rte_table[4] = 4;
	
	
	
	
	
	//对应关系
	//PortNum		DestID
	//3				1
	//6				2
	//2				3
	//4				4
	localparam	DATA_NUM = 45;//132;	//需要写入的总字节
	wire	[7:0]	eeprom_data[0 : DATA_NUM - 1];
	//寄存器为大端字节序，字节及每字节的位都相反
	assign	eeprom_data[0]					= 8'haa;	//必须为0xaa
	assign	eeprom_data[1]					= 8'haa;	//必须为0xaa
	assign	eeprom_data[2]					= 8'h00;	//configuration block个数[8:15]，总个数减一
	assign	eeprom_data[3]					= 8'h04;//8'hff;	//configuration block个数[0:7]
	//-------------配置路由表----------------
	assign	eeprom_data[4]					= 8'h04;	//The lower 8 bits of a 10-bit value that defines the number of words in configuration Block 1 
	assign	eeprom_data[5]					= 8'h38;	//Bits 0:5 of the block address	(0xe00000 + (0x4 * 0))>>2 = 0x380000
	assign	eeprom_data[6]					= 8'h00;	//Bits 6:13 of the block address
	assign	eeprom_data[7]					= 8'h00;	//Bits 14:21 of the block addres, Register addresses are always 4-byte aligned, therefore bits 22:23 are zero.	
	assign	eeprom_data[8]                  = 8'h00;	//DstID 0
	assign	eeprom_data[9]                  = 8'h03;	//DstID 1
	assign	eeprom_data[10]                 = 8'h06;    //DstID 2
	assign	eeprom_data[11]                 = 8'h02;    //DstID 3
	assign	eeprom_data[12]                 = 8'h04;    //DstID 4		
	//-------------打开端口--------------------
	// PORT_{3}_CTL_1_CSR
	assign	eeprom_data[13 + 0*8]			= 8'h00;	//The lower 8 bits of a 10-bit value that defines the number of words in configuration Block 1 
	assign	eeprom_data[14 + 0*8][1:0]		= 8'h00;	//Bits 8:9 of the 10-bit block count	
	assign	eeprom_data[14 + 0*8][7:2]		= 8'h00;	//Bits 0:5 of the block address	(0x00015c + 0x20 * 3)>>2 = 0x00006f
	assign	eeprom_data[15 + 0*8]			= 8'h00;	//Bits 6:13 of the block address
	assign	eeprom_data[16 + 0*8]			= 8'h6f;	//Bits 14:21 of the block addres, Register addresses are always 4-byte aligned, therefore bits 22:23 are zero.
	assign	eeprom_data[17 + 0*8]			= port_control_csr_input_en[3][31:24];	//内容
	assign	eeprom_data[18 + 0*8]			= port_control_csr_input_en[3][23:16];
	assign	eeprom_data[19 + 0*8]			= port_control_csr_input_en[3][15:8];
	assign	eeprom_data[20 + 0*8]			= port_control_csr_input_en[3][7:0];
	// PORT_{6}_CTL_1_CSR
	assign	eeprom_data[13 + 1*8]			= 8'h00;	//The lower 8 bits of a 10-bit value that defines the number of words in configuration Block 1 
	assign	eeprom_data[14 + 1*8][1:0]		= 8'h00;	//Bits 8:9 of the 10-bit block count	
	assign	eeprom_data[14 + 1*8][7:2]		= 8'h00;	//Bits 0:5 of the block address	(0x00015c + 0x20 * 6)>>2 = 0x000087
	assign	eeprom_data[15 + 1*8]			= 8'h00;	//Bits 6:13 of the block address
	assign	eeprom_data[16 + 1*8]			= 8'h87;	//Bits 14:21 of the block addres, Register addresses are always 4-byte aligned, therefore bits 22:23 are zero.
	assign	eeprom_data[17 + 1*8]			= port_control_csr_input_en[6][31:24];	//内容
	assign	eeprom_data[18 + 1*8]			= port_control_csr_input_en[6][23:16];
	assign	eeprom_data[19 + 1*8]			= port_control_csr_input_en[6][15:8];
	assign	eeprom_data[20 + 1*8]			= port_control_csr_input_en[6][7:0];
	// PORT_{2}_CTL_1_CSR
	assign	eeprom_data[13 + 2*8]			= 8'h00;	//The lower 8 bits of a 10-bit value that defines the number of words in configuration Block 1 
	assign	eeprom_data[14 + 2*8][1:0]		= 8'h00;	//Bits 8:9 of the 10-bit block count	
	assign	eeprom_data[14 + 2*8][7:2]		= 8'h00;	//Bits 0:5 of the block address	(0x00015c + 0x20 * 2)>>2 = 0x000067
	assign	eeprom_data[15 + 2*8]			= 8'h00;	//Bits 6:13 of the block address
	assign	eeprom_data[16 + 2*8]			= 8'h67;	//Bits 14:21 of the block addres, Register addresses are always 4-byte aligned, therefore bits 22:23 are zero.
	assign	eeprom_data[17 + 2*8]			= port_control_csr_input_en[2][31:24];	//内容
	assign	eeprom_data[18 + 2*8]			= port_control_csr_input_en[2][23:16];
	assign	eeprom_data[19 + 2*8]			= port_control_csr_input_en[2][15:8];
	assign	eeprom_data[20 + 2*8]			= port_control_csr_input_en[2][7:0];
	// PORT_{4}_CTL_1_CSR
	assign	eeprom_data[13 + 3*8]			= 8'h00;	//The lower 8 bits of a 10-bit value that defines the number of words in configuration Block 1 
	assign	eeprom_data[14 + 3*8][1:0]		= 8'h00;	//Bits 8:9 of the 10-bit block count	
	assign	eeprom_data[14 + 3*8][7:2]		= 8'h00;	//Bits 0:5 of the block address	(0x00015c + 0x20 * 4)>>2 = 0x000077
	assign	eeprom_data[15 + 3*8]			= 8'h00;	//Bits 6:13 of the block address
	assign	eeprom_data[16 + 3*8]			= 8'h77;	//Bits 14:21 of the block addres, Register addresses are always 4-byte aligned, therefore bits 22:23 are zero.
	assign	eeprom_data[17 + 3*8]			= port_control_csr_input_en[4][31:24];	//内容
	assign	eeprom_data[18 + 3*8]			= port_control_csr_input_en[4][23:16];
	assign	eeprom_data[19 + 3*8]			= port_control_csr_input_en[4][15:8];
	assign	eeprom_data[20 + 3*8]			= port_control_csr_input_en[4][7:0];
	
	
	
	(*keep = "true"*)
	reg		[7:0]	state;
	localparam	IDLE = 0;
	localparam 	STEP1 = 1, STEP2 = 2, STEP3 = 3, STEP4 = 4, STEP5 = 5, STEP6 = 6;
	reg		[15:0]	cfg_cnt;	
	wire			ACK;
	(*keep = "true"*)
	reg		[7:0]	DATA;
	reg		[15:0]	ADDR;
	reg				WR;
	reg				RD;
	
	reg		[15:0]	delay_cnt;
	//写完后会读数据
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			state 		<= IDLE;
			cfg_cnt		<= 0;
			WR			<= 0;
			RD			<= 0;
			DATA		<= 0;
			delay_cnt	<= 0;
		end
		else begin
			case(state)
				IDLE: begin
					if((cfg_start == 1)&&(cfg_start_r == 0)) begin
						//state 		<= STEP4;	//读
						state 		<= STEP1;	//写
						cfg_cnt 	<= 0;		//地址设为0
						WR			<= 0;
						RD			<= 0;
						DATA		<= 0;
						delay_cnt	<= 0;
					end
				end
				STEP1: begin
					if(delay_cnt < 2000) begin	//间隔需要至少5ms
						delay_cnt	<= delay_cnt + 1;
					end
					else begin
						WR			<= 1;
						DATA		<= eeprom_data[cfg_cnt];
						ADDR		<= cfg_cnt;
						delay_cnt	<= 0;
						state		<= STEP2;
					end
				end
				STEP2: begin
					WR		<= 0;
					if(ACK == 1) begin	//等待这组数据写完
						state <= STEP3;
					end
				end
				STEP3: begin
					if(cfg_cnt < DATA_NUM - 1) begin	//还未写完则继续
						state 	<= STEP1;
						cfg_cnt	<= cfg_cnt + 1;
					end
					else begin	//写完
						// state <= IDLE;	
						cfg_cnt	<= 0;
						state 	<= STEP4;
						WR		<= 0;
					end						
				end
				STEP4: begin		
					if(delay_cnt < 2000) begin	//间隔需要至少5ms
						delay_cnt	<= delay_cnt + 1;
					end
					else begin	
						delay_cnt	<= 0;
						RD			<= 1;
						ADDR		<= cfg_cnt;
						state		<= STEP5;
					end
				end
				STEP5: begin
					RD		<= 0;
					if(ACK == 1) begin	//等待这组数据读完
						state <= STEP6;
					end
				end
				STEP6: begin
					if(cfg_cnt < DATA_NUM - 1) begin	//还未读完则继续
						state 	<= STEP4;
						cfg_cnt	<= cfg_cnt + 1;
					end
					else begin	//读完
						state <= IDLE;	
					end						
				end		
				default: begin
					state 		<= IDLE;
					cfg_cnt		<= 0;
					WR			<= 0;
					RD			<= 0;
					DATA		<= 0;		
					delay_cnt	<= 0;					
				end
			endcase	
		end
	end
	

	
	(*keep = "true"*)
	wire	[7:0]	DATA_out;	
	
	i2c_wr i2c_wr_inst (
		.clk(clk), 
		.rst_n(~rst), 
		.wr(WR), 
		.rd(RD), 
		.addr(ADDR), 
		.data_w(DATA), 
		.data_out(DATA_out), 
		.ack(ACK), 
		.scl(SCL), 
		.sda(SDA)
    );

endmodule

