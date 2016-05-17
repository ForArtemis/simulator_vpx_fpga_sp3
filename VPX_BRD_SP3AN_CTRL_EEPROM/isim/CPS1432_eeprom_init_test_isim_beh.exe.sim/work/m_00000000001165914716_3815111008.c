/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/lrh_workspace/projects/simulator_new/fpga_projects/VPX_BRD_SP3AN_CTRL/eeprom_wr.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {2U, 0U};
static int ng3[] = {7, 0};
static unsigned int ng4[] = {4U, 0U};
static int ng5[] = {6, 0};
static unsigned int ng6[] = {8U, 0U};
static int ng7[] = {5, 0};
static unsigned int ng8[] = {16U, 0U};
static int ng9[] = {4, 0};
static unsigned int ng10[] = {32U, 0U};
static int ng11[] = {3, 0};
static unsigned int ng12[] = {64U, 0U};
static int ng13[] = {2, 0};
static unsigned int ng14[] = {128U, 0U};
static int ng15[] = {1, 0};
static unsigned int ng16[] = {256U, 0U};
static int ng17[] = {0, 0};
static unsigned int ng18[] = {512U, 0U};
static unsigned int ng19[] = {0U, 0U};
static unsigned int ng20[] = {0U, 1U};
static unsigned int ng21[] = {0U, 255U};
static unsigned int ng22[] = {2047U, 0U};
static unsigned int ng23[] = {10U, 0U};
static unsigned int ng24[] = {1024U, 0U};



static int sp_shift8in(char *t1, char *t2)
{
    char t18[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t24;
    int t25;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 6152);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(278, ng0);

LAB5:    xsi_set_current_line(279, ng0);
    t5 = (t1 + 11840);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);

LAB6:    t8 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 10, t8, 10);
    if (t9 == 1)
        goto LAB7;

LAB8:    t4 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 10, t4, 10);
    if (t9 == 1)
        goto LAB9;

LAB10:    t4 = ((char*)((ng4)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 10, t4, 10);
    if (t9 == 1)
        goto LAB11;

LAB12:    t4 = ((char*)((ng6)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 10, t4, 10);
    if (t9 == 1)
        goto LAB13;

LAB14:    t4 = ((char*)((ng8)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 10, t4, 10);
    if (t9 == 1)
        goto LAB15;

LAB16:    t4 = ((char*)((ng10)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 10, t4, 10);
    if (t9 == 1)
        goto LAB17;

LAB18:    t4 = ((char*)((ng12)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 10, t4, 10);
    if (t9 == 1)
        goto LAB19;

LAB20:    t4 = ((char*)((ng14)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 10, t4, 10);
    if (t9 == 1)
        goto LAB21;

LAB22:    t4 = ((char*)((ng16)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 10, t4, 10);
    if (t9 == 1)
        goto LAB23;

LAB24:    t4 = ((char*)((ng18)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 10, t4, 10);
    if (t9 == 1)
        goto LAB25;

LAB26:
LAB28:
LAB27:    xsi_set_current_line(356, ng0);

LAB82:    xsi_set_current_line(357, ng0);
    t4 = (t1 + 5640);
    t5 = *((char **)t4);
    t4 = (t1 + 12800);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(358, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB29:
LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB7:    xsi_set_current_line(281, ng0);
    t10 = ((char*)((ng2)));
    t11 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 10, 0LL);
    goto LAB29;

LAB9:    xsi_set_current_line(283, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t10);
    t13 = (~(t12));
    t14 = *((unsigned int *)t8);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB30;

LAB31:    xsi_set_current_line(289, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB32:    goto LAB29;

LAB11:    xsi_set_current_line(291, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t10);
    t13 = (~(t12));
    t14 = *((unsigned int *)t8);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB36;

LAB37:    xsi_set_current_line(297, ng0);
    t4 = ((char*)((ng4)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB38:    goto LAB29;

LAB13:    xsi_set_current_line(299, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t10);
    t13 = (~(t12));
    t14 = *((unsigned int *)t8);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(305, ng0);
    t4 = ((char*)((ng6)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB44:    goto LAB29;

LAB15:    xsi_set_current_line(307, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t10);
    t13 = (~(t12));
    t14 = *((unsigned int *)t8);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB48;

LAB49:    xsi_set_current_line(313, ng0);
    t4 = ((char*)((ng8)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB50:    goto LAB29;

LAB17:    xsi_set_current_line(315, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t10);
    t13 = (~(t12));
    t14 = *((unsigned int *)t8);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB54;

LAB55:    xsi_set_current_line(321, ng0);
    t4 = ((char*)((ng10)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB56:    goto LAB29;

LAB19:    xsi_set_current_line(323, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t10);
    t13 = (~(t12));
    t14 = *((unsigned int *)t8);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB60;

LAB61:    xsi_set_current_line(328, ng0);
    t4 = ((char*)((ng12)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB62:    goto LAB29;

LAB21:    xsi_set_current_line(330, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t10);
    t13 = (~(t12));
    t14 = *((unsigned int *)t8);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB66;

LAB67:    xsi_set_current_line(336, ng0);
    t4 = ((char*)((ng14)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB68:    goto LAB29;

LAB23:    xsi_set_current_line(339, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t10);
    t13 = (~(t12));
    t14 = *((unsigned int *)t8);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB72;

LAB73:    xsi_set_current_line(345, ng0);
    t4 = ((char*)((ng16)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB74:    goto LAB29;

LAB25:    xsi_set_current_line(347, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t10);
    t13 = (~(t12));
    t14 = *((unsigned int *)t8);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB78;

LAB79:    xsi_set_current_line(354, ng0);
    t4 = ((char*)((ng18)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB80:    goto LAB29;

LAB30:    xsi_set_current_line(284, ng0);

LAB33:    xsi_set_current_line(285, ng0);
    t11 = (t1 + 9040U);
    t17 = *((char **)t11);
    t11 = (t1 + 12480);
    t19 = (t1 + 12480);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t18, t21, 2, t22, 32, 1);
    t23 = (t18 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (!(t24));
    if (t25 == 1)
        goto LAB34;

LAB35:    xsi_set_current_line(286, ng0);
    t4 = ((char*)((ng4)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);
    goto LAB32;

LAB34:    xsi_vlogvar_wait_assign_value(t11, t17, 0, *((unsigned int *)t18), 1, 0LL);
    goto LAB35;

LAB36:    xsi_set_current_line(292, ng0);

LAB39:    xsi_set_current_line(293, ng0);
    t11 = (t1 + 9040U);
    t17 = *((char **)t11);
    t11 = (t1 + 12480);
    t19 = (t1 + 12480);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t18, t21, 2, t22, 32, 1);
    t23 = (t18 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (!(t24));
    if (t25 == 1)
        goto LAB40;

LAB41:    xsi_set_current_line(294, ng0);
    t4 = ((char*)((ng6)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);
    goto LAB38;

LAB40:    xsi_vlogvar_wait_assign_value(t11, t17, 0, *((unsigned int *)t18), 1, 0LL);
    goto LAB41;

LAB42:    xsi_set_current_line(300, ng0);

LAB45:    xsi_set_current_line(301, ng0);
    t11 = (t1 + 9040U);
    t17 = *((char **)t11);
    t11 = (t1 + 12480);
    t19 = (t1 + 12480);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t18, t21, 2, t22, 32, 1);
    t23 = (t18 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (!(t24));
    if (t25 == 1)
        goto LAB46;

LAB47:    xsi_set_current_line(302, ng0);
    t4 = ((char*)((ng8)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);
    goto LAB44;

LAB46:    xsi_vlogvar_wait_assign_value(t11, t17, 0, *((unsigned int *)t18), 1, 0LL);
    goto LAB47;

LAB48:    xsi_set_current_line(308, ng0);

LAB51:    xsi_set_current_line(309, ng0);
    t11 = (t1 + 9040U);
    t17 = *((char **)t11);
    t11 = (t1 + 12480);
    t19 = (t1 + 12480);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng9)));
    xsi_vlog_generic_convert_bit_index(t18, t21, 2, t22, 32, 1);
    t23 = (t18 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (!(t24));
    if (t25 == 1)
        goto LAB52;

LAB53:    xsi_set_current_line(310, ng0);
    t4 = ((char*)((ng10)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);
    goto LAB50;

LAB52:    xsi_vlogvar_wait_assign_value(t11, t17, 0, *((unsigned int *)t18), 1, 0LL);
    goto LAB53;

LAB54:    xsi_set_current_line(316, ng0);

LAB57:    xsi_set_current_line(317, ng0);
    t11 = (t1 + 9040U);
    t17 = *((char **)t11);
    t11 = (t1 + 12480);
    t19 = (t1 + 12480);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng11)));
    xsi_vlog_generic_convert_bit_index(t18, t21, 2, t22, 32, 1);
    t23 = (t18 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (!(t24));
    if (t25 == 1)
        goto LAB58;

LAB59:    xsi_set_current_line(318, ng0);
    t4 = ((char*)((ng12)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);
    goto LAB56;

LAB58:    xsi_vlogvar_wait_assign_value(t11, t17, 0, *((unsigned int *)t18), 1, 0LL);
    goto LAB59;

LAB60:    xsi_set_current_line(324, ng0);

LAB63:    xsi_set_current_line(324, ng0);
    t11 = (t1 + 9040U);
    t17 = *((char **)t11);
    t11 = (t1 + 12480);
    t19 = (t1 + 12480);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng13)));
    xsi_vlog_generic_convert_bit_index(t18, t21, 2, t22, 32, 1);
    t23 = (t18 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (!(t24));
    if (t25 == 1)
        goto LAB64;

LAB65:    xsi_set_current_line(325, ng0);
    t4 = ((char*)((ng14)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);
    goto LAB62;

LAB64:    xsi_vlogvar_wait_assign_value(t11, t17, 0, *((unsigned int *)t18), 1, 0LL);
    goto LAB65;

LAB66:    xsi_set_current_line(331, ng0);

LAB69:    xsi_set_current_line(332, ng0);
    t11 = (t1 + 9040U);
    t17 = *((char **)t11);
    t11 = (t1 + 12480);
    t19 = (t1 + 12480);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng15)));
    xsi_vlog_generic_convert_bit_index(t18, t21, 2, t22, 32, 1);
    t23 = (t18 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (!(t24));
    if (t25 == 1)
        goto LAB70;

LAB71:    xsi_set_current_line(333, ng0);
    t4 = ((char*)((ng16)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);
    goto LAB68;

LAB70:    xsi_vlogvar_wait_assign_value(t11, t17, 0, *((unsigned int *)t18), 1, 0LL);
    goto LAB71;

LAB72:    xsi_set_current_line(340, ng0);

LAB75:    xsi_set_current_line(341, ng0);
    t11 = (t1 + 9040U);
    t17 = *((char **)t11);
    t11 = (t1 + 12480);
    t19 = (t1 + 12480);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng17)));
    xsi_vlog_generic_convert_bit_index(t18, t21, 2, t22, 32, 1);
    t23 = (t18 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (!(t24));
    if (t25 == 1)
        goto LAB76;

LAB77:    xsi_set_current_line(342, ng0);
    t4 = ((char*)((ng18)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);
    goto LAB74;

LAB76:    xsi_vlogvar_wait_assign_value(t11, t17, 0, *((unsigned int *)t18), 1, 0LL);
    goto LAB77;

LAB78:    xsi_set_current_line(348, ng0);

LAB81:    xsi_set_current_line(349, ng0);
    t11 = (t1 + 5504);
    t17 = *((char **)t11);
    t11 = (t1 + 12800);
    xsi_vlogvar_wait_assign_value(t11, t17, 0, 0, 1, 0LL);
    xsi_set_current_line(350, ng0);
    t4 = ((char*)((ng15)));
    t5 = (t1 + 11040);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(351, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t1 + 11840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);
    goto LAB80;

}

static int sp_shift8_out(char *t1, char *t2)
{
    char t10[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 6584);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(365, ng0);

LAB5:    xsi_set_current_line(366, ng0);
    t5 = (t1 + 11680);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);

LAB6:    t8 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 9, t8, 9);
    if (t9 == 1)
        goto LAB7;

LAB8:    t4 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 9, t4, 9);
    if (t9 == 1)
        goto LAB9;

LAB10:    t4 = ((char*)((ng4)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 9, t4, 9);
    if (t9 == 1)
        goto LAB11;

LAB12:    t4 = ((char*)((ng6)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 9, t4, 9);
    if (t9 == 1)
        goto LAB13;

LAB14:    t4 = ((char*)((ng8)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 9, t4, 9);
    if (t9 == 1)
        goto LAB15;

LAB16:    t4 = ((char*)((ng10)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 9, t4, 9);
    if (t9 == 1)
        goto LAB17;

LAB18:    t4 = ((char*)((ng12)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 9, t4, 9);
    if (t9 == 1)
        goto LAB19;

LAB20:    t4 = ((char*)((ng14)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 9, t4, 9);
    if (t9 == 1)
        goto LAB21;

LAB22:    t4 = ((char*)((ng16)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 9, t4, 9);
    if (t9 == 1)
        goto LAB23;

LAB24:
LAB25:
LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB7:    xsi_set_current_line(368, ng0);
    t11 = (t1 + 10400);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memset(t10, 0, 8);
    t14 = (t13 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t13);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB29;

LAB27:    if (*((unsigned int *)t14) == 0)
        goto LAB26;

LAB28:    t20 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t20) = 1;

LAB29:    t21 = (t10 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB30;

LAB31:    xsi_set_current_line(376, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);

LAB32:    goto LAB25;

LAB9:    xsi_set_current_line(378, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memset(t10, 0, 8);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB37;

LAB35:    if (*((unsigned int *)t11) == 0)
        goto LAB34;

LAB36:    t12 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t12) = 1;

LAB37:    t13 = (t10 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB38;

LAB39:    xsi_set_current_line(385, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);

LAB40:    goto LAB25;

LAB11:    xsi_set_current_line(387, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memset(t10, 0, 8);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB45;

LAB43:    if (*((unsigned int *)t11) == 0)
        goto LAB42;

LAB44:    t12 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t12) = 1;

LAB45:    t13 = (t10 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB46;

LAB47:    xsi_set_current_line(393, ng0);
    t4 = ((char*)((ng4)));
    t5 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);

LAB48:    goto LAB25;

LAB13:    xsi_set_current_line(395, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memset(t10, 0, 8);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB53;

LAB51:    if (*((unsigned int *)t11) == 0)
        goto LAB50;

LAB52:    t12 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t12) = 1;

LAB53:    t13 = (t10 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB54;

LAB55:    xsi_set_current_line(401, ng0);
    t4 = ((char*)((ng6)));
    t5 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);

LAB56:    goto LAB25;

LAB15:    xsi_set_current_line(403, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memset(t10, 0, 8);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB61;

LAB59:    if (*((unsigned int *)t11) == 0)
        goto LAB58;

LAB60:    t12 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t12) = 1;

LAB61:    t13 = (t10 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(409, ng0);
    t4 = ((char*)((ng8)));
    t5 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);

LAB64:    goto LAB25;

LAB17:    xsi_set_current_line(411, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memset(t10, 0, 8);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB69;

LAB67:    if (*((unsigned int *)t11) == 0)
        goto LAB66;

LAB68:    t12 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t12) = 1;

LAB69:    t13 = (t10 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB70;

LAB71:    xsi_set_current_line(417, ng0);
    t4 = ((char*)((ng10)));
    t5 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);

LAB72:    goto LAB25;

LAB19:    xsi_set_current_line(419, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memset(t10, 0, 8);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB77;

LAB75:    if (*((unsigned int *)t11) == 0)
        goto LAB74;

LAB76:    t12 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t12) = 1;

LAB77:    t13 = (t10 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB78;

LAB79:    xsi_set_current_line(425, ng0);
    t4 = ((char*)((ng12)));
    t5 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);

LAB80:    goto LAB25;

LAB21:    xsi_set_current_line(427, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memset(t10, 0, 8);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB85;

LAB83:    if (*((unsigned int *)t11) == 0)
        goto LAB82;

LAB84:    t12 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t12) = 1;

LAB85:    t13 = (t10 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB86;

LAB87:    xsi_set_current_line(433, ng0);
    t4 = ((char*)((ng14)));
    t5 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);

LAB88:    goto LAB25;

LAB23:    xsi_set_current_line(435, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memset(t10, 0, 8);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB93;

LAB91:    if (*((unsigned int *)t11) == 0)
        goto LAB90;

LAB92:    t12 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t12) = 1;

LAB93:    t13 = (t10 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB94;

LAB95:    xsi_set_current_line(441, ng0);
    t4 = ((char*)((ng16)));
    t5 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);

LAB96:    goto LAB25;

LAB26:    *((unsigned int *)t10) = 1;
    goto LAB29;

LAB30:    xsi_set_current_line(369, ng0);

LAB33:    xsi_set_current_line(370, ng0);
    t27 = (t1 + 5504);
    t28 = *((char **)t27);
    t27 = (t1 + 12640);
    xsi_vlogvar_wait_assign_value(t27, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(371, ng0);
    t4 = (t1 + 5504);
    t5 = *((char **)t4);
    t4 = (t1 + 13120);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(373, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);
    goto LAB32;

LAB34:    *((unsigned int *)t10) = 1;
    goto LAB37;

LAB38:    xsi_set_current_line(379, ng0);

LAB41:    xsi_set_current_line(380, ng0);
    t14 = (t1 + 5504);
    t20 = *((char **)t14);
    t14 = (t1 + 12640);
    xsi_vlogvar_wait_assign_value(t14, t20, 0, 0, 1, 0LL);
    xsi_set_current_line(380, ng0);
    t4 = (t1 + 5504);
    t5 = *((char **)t4);
    t4 = (t1 + 13120);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(381, ng0);
    t4 = ((char*)((ng4)));
    t5 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 9, 0LL);
    xsi_set_current_line(382, ng0);
    t4 = (t1 + 11520);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = ((char*)((ng15)));
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 8, t6, 8, t8, 32);
    t11 = (t1 + 11520);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 8, 0LL);
    goto LAB40;

LAB42:    *((unsigned int *)t10) = 1;
    goto LAB45;

LAB46:    xsi_set_current_line(388, ng0);

LAB49:    xsi_set_current_line(389, ng0);
    t14 = ((char*)((ng6)));
    t20 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t20, t14, 0, 0, 9, 0LL);
    xsi_set_current_line(390, ng0);
    t4 = (t1 + 11520);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = ((char*)((ng15)));
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 8, t6, 8, t8, 32);
    t11 = (t1 + 11520);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 8, 0LL);
    goto LAB48;

LAB50:    *((unsigned int *)t10) = 1;
    goto LAB53;

LAB54:    xsi_set_current_line(396, ng0);

LAB57:    xsi_set_current_line(397, ng0);
    t14 = ((char*)((ng8)));
    t20 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t20, t14, 0, 0, 9, 0LL);
    xsi_set_current_line(398, ng0);
    t4 = (t1 + 11520);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = ((char*)((ng15)));
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 8, t6, 8, t8, 32);
    t11 = (t1 + 11520);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 8, 0LL);
    goto LAB56;

LAB58:    *((unsigned int *)t10) = 1;
    goto LAB61;

LAB62:    xsi_set_current_line(404, ng0);

LAB65:    xsi_set_current_line(405, ng0);
    t14 = ((char*)((ng10)));
    t20 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t20, t14, 0, 0, 9, 0LL);
    xsi_set_current_line(406, ng0);
    t4 = (t1 + 11520);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = ((char*)((ng15)));
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 8, t6, 8, t8, 32);
    t11 = (t1 + 11520);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 8, 0LL);
    goto LAB64;

LAB66:    *((unsigned int *)t10) = 1;
    goto LAB69;

LAB70:    xsi_set_current_line(412, ng0);

LAB73:    xsi_set_current_line(413, ng0);
    t14 = ((char*)((ng12)));
    t20 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t20, t14, 0, 0, 9, 0LL);
    xsi_set_current_line(414, ng0);
    t4 = (t1 + 11520);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = ((char*)((ng15)));
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 8, t6, 8, t8, 32);
    t11 = (t1 + 11520);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 8, 0LL);
    goto LAB72;

LAB74:    *((unsigned int *)t10) = 1;
    goto LAB77;

LAB78:    xsi_set_current_line(420, ng0);

LAB81:    xsi_set_current_line(421, ng0);
    t14 = ((char*)((ng14)));
    t20 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t20, t14, 0, 0, 9, 0LL);
    xsi_set_current_line(422, ng0);
    t4 = (t1 + 11520);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = ((char*)((ng15)));
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 8, t6, 8, t8, 32);
    t11 = (t1 + 11520);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 8, 0LL);
    goto LAB80;

LAB82:    *((unsigned int *)t10) = 1;
    goto LAB85;

LAB86:    xsi_set_current_line(428, ng0);

LAB89:    xsi_set_current_line(429, ng0);
    t14 = ((char*)((ng16)));
    t20 = (t1 + 11680);
    xsi_vlogvar_wait_assign_value(t20, t14, 0, 0, 9, 0LL);
    xsi_set_current_line(430, ng0);
    t4 = (t1 + 11520);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = ((char*)((ng15)));
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 8, t6, 8, t8, 32);
    t11 = (t1 + 11520);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 8, 0LL);
    goto LAB88;

LAB90:    *((unsigned int *)t10) = 1;
    goto LAB93;

LAB94:    xsi_set_current_line(436, ng0);

LAB97:    xsi_set_current_line(437, ng0);
    t14 = (t1 + 5640);
    t20 = *((char **)t14);
    t14 = (t1 + 12640);
    xsi_vlogvar_wait_assign_value(t14, t20, 0, 0, 1, 0LL);
    xsi_set_current_line(438, ng0);
    t4 = (t1 + 5640);
    t5 = *((char **)t4);
    t4 = (t1 + 13120);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(438, ng0);
    t4 = ((char*)((ng15)));
    t5 = (t1 + 11040);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    goto LAB96;

}

static int sp_shift_head(char *t1, char *t2)
{
    char t10[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 7016);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(448, ng0);

LAB5:    xsi_set_current_line(449, ng0);
    t5 = (t1 + 12000);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);

LAB6:    t8 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 3, t8, 3);
    if (t9 == 1)
        goto LAB7;

LAB8:    t4 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 3, t4, 3);
    if (t9 == 1)
        goto LAB9;

LAB10:    t4 = ((char*)((ng4)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 3, t4, 3);
    if (t9 == 1)
        goto LAB11;

LAB12:
LAB13:
LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB7:    xsi_set_current_line(451, ng0);
    t11 = (t1 + 10400);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memset(t10, 0, 8);
    t14 = (t13 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t13);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB17;

LAB15:    if (*((unsigned int *)t14) == 0)
        goto LAB14;

LAB16:    t20 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t20) = 1;

LAB17:    t21 = (t10 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(459, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t1 + 12000);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);

LAB20:    goto LAB13;

LAB9:    xsi_set_current_line(461, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB22;

LAB23:    xsi_set_current_line(468, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t1 + 12000);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);

LAB24:    goto LAB13;

LAB11:    xsi_set_current_line(470, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memset(t10, 0, 8);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB29;

LAB27:    if (*((unsigned int *)t11) == 0)
        goto LAB26;

LAB28:    t12 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t12) = 1;

LAB29:    t13 = (t10 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB30;

LAB31:    xsi_set_current_line(476, ng0);
    t4 = ((char*)((ng4)));
    t5 = (t1 + 12000);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);

LAB32:    goto LAB13;

LAB14:    *((unsigned int *)t10) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(452, ng0);

LAB21:    xsi_set_current_line(453, ng0);
    t27 = (t1 + 5640);
    t28 = *((char **)t27);
    t27 = (t1 + 13120);
    xsi_vlogvar_wait_assign_value(t27, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(454, ng0);
    t4 = (t1 + 5504);
    t5 = *((char **)t4);
    t4 = (t1 + 12640);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(455, ng0);
    t4 = (t1 + 5504);
    t5 = *((char **)t4);
    t4 = (t1 + 12960);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(456, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t1 + 12000);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);
    goto LAB20;

LAB22:    xsi_set_current_line(462, ng0);

LAB25:    xsi_set_current_line(463, ng0);
    t12 = ((char*)((ng15)));
    t13 = (t1 + 11040);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(464, ng0);
    t4 = (t1 + 11200);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = ((char*)((ng15)));
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 2, t6, 2, t8, 32);
    t11 = (t1 + 11200);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 2, 0LL);
    xsi_set_current_line(465, ng0);
    t4 = ((char*)((ng4)));
    t5 = (t1 + 12000);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);
    goto LAB24;

LAB26:    *((unsigned int *)t10) = 1;
    goto LAB29;

LAB30:    xsi_set_current_line(471, ng0);

LAB33:    xsi_set_current_line(472, ng0);
    t14 = (t1 + 5640);
    t20 = *((char **)t14);
    t14 = (t1 + 12960);
    xsi_vlogvar_wait_assign_value(t14, t20, 0, 0, 1, 0LL);
    xsi_set_current_line(473, ng0);
    t4 = (t1 + 5504);
    t5 = *((char **)t4);
    t4 = (t1 + 13120);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    goto LAB32;

}

static int sp_shift_stop(char *t1, char *t2)
{
    char t10[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 7448);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(482, ng0);

LAB5:    xsi_set_current_line(483, ng0);
    t5 = (t1 + 12160);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);

LAB6:    t8 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 3, t8, 3);
    if (t9 == 1)
        goto LAB7;

LAB8:    t4 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 3, t4, 3);
    if (t9 == 1)
        goto LAB9;

LAB10:    t4 = ((char*)((ng4)));
    t9 = xsi_vlog_unsigned_case_xcompare(t7, 3, t4, 3);
    if (t9 == 1)
        goto LAB11;

LAB12:
LAB13:
LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB7:    xsi_set_current_line(485, ng0);
    t11 = (t1 + 10400);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memset(t10, 0, 8);
    t14 = (t13 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t13);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB17;

LAB15:    if (*((unsigned int *)t14) == 0)
        goto LAB14;

LAB16:    t20 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t20) = 1;

LAB17:    t21 = (t10 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(493, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t1 + 12160);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);

LAB20:    goto LAB13;

LAB9:    xsi_set_current_line(495, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB22;

LAB23:    xsi_set_current_line(501, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t1 + 12160);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);

LAB24:    goto LAB13;

LAB11:    xsi_set_current_line(503, ng0);
    t5 = (t1 + 10400);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memset(t10, 0, 8);
    t11 = (t8 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t8);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB29;

LAB27:    if (*((unsigned int *)t11) == 0)
        goto LAB26;

LAB28:    t12 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t12) = 1;

LAB29:    t13 = (t10 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t10);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB30;

LAB31:    xsi_set_current_line(511, ng0);
    t4 = ((char*)((ng4)));
    t5 = (t1 + 12160);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);

LAB32:    goto LAB13;

LAB14:    *((unsigned int *)t10) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(486, ng0);

LAB21:    xsi_set_current_line(487, ng0);
    t27 = (t1 + 5504);
    t28 = *((char **)t27);
    t27 = (t1 + 12640);
    xsi_vlogvar_wait_assign_value(t27, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(488, ng0);
    t4 = (t1 + 5640);
    t5 = *((char **)t4);
    t4 = (t1 + 13120);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(489, ng0);
    t4 = (t1 + 5504);
    t5 = *((char **)t4);
    t4 = (t1 + 13280);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(490, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t1 + 12160);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);
    goto LAB20;

LAB22:    xsi_set_current_line(496, ng0);

LAB25:    xsi_set_current_line(497, ng0);
    t12 = (t1 + 11360);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t20 = ((char*)((ng15)));
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 2, t14, 2, t20, 32);
    t21 = (t1 + 11360);
    xsi_vlogvar_wait_assign_value(t21, t10, 0, 0, 2, 0LL);
    xsi_set_current_line(498, ng0);
    t4 = ((char*)((ng4)));
    t5 = (t1 + 12160);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);
    goto LAB24;

LAB26:    *((unsigned int *)t10) = 1;
    goto LAB29;

LAB30:    xsi_set_current_line(504, ng0);

LAB33:    xsi_set_current_line(505, ng0);
    t14 = (t1 + 5640);
    t20 = *((char **)t14);
    t14 = (t1 + 12960);
    xsi_vlogvar_wait_assign_value(t14, t20, 0, 0, 1, 0LL);
    xsi_set_current_line(506, ng0);
    t4 = (t1 + 5640);
    t5 = *((char **)t4);
    t4 = (t1 + 13280);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(507, ng0);
    t4 = (t1 + 5640);
    t5 = *((char **)t4);
    t4 = (t1 + 12640);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(508, ng0);
    t4 = ((char*)((ng15)));
    t5 = (t1 + 11040);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    goto LAB32;

}

static void Cont_35_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t21[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;

LAB0:    t1 = (t0 + 14200U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 12960);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t30 = *((unsigned int *)t4);
    t31 = (~(t30));
    t32 = *((unsigned int *)t14);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t34, 8);

LAB16:    t35 = (t0 + 16448);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    memset(t39, 0, 8);
    t40 = 1U;
    t41 = t40;
    t42 = (t3 + 4);
    t43 = *((unsigned int *)t3);
    t40 = (t40 & t43);
    t44 = *((unsigned int *)t42);
    t41 = (t41 & t44);
    t45 = (t39 + 4);
    t46 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t46 | t40);
    t47 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t47 | t41);
    xsi_driver_vfirst_trans(t35, 0, 0);
    t48 = (t0 + 16256);
    *((int *)t48) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 11200);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memset(t21, 0, 8);
    t22 = (t21 + 4);
    t23 = (t20 + 4);
    t24 = *((unsigned int *)t20);
    t25 = (t24 >> 1);
    t26 = (t25 & 1);
    *((unsigned int *)t21) = t26;
    t27 = *((unsigned int *)t23);
    t28 = (t27 >> 1);
    t29 = (t28 & 1);
    *((unsigned int *)t22) = t29;
    goto LAB9;

LAB10:    t34 = ((char*)((ng19)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t21, 1, t34, 1);
    goto LAB16;

LAB14:    memcpy(t3, t21, 8);
    goto LAB16;

}

static void Cont_36_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t21[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;

LAB0:    t1 = (t0 + 14448U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 13120);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t30 = *((unsigned int *)t4);
    t31 = (~(t30));
    t32 = *((unsigned int *)t14);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t34, 8);

LAB16:    t35 = (t0 + 16512);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    memset(t39, 0, 8);
    t40 = 1U;
    t41 = t40;
    t42 = (t3 + 4);
    t43 = *((unsigned int *)t3);
    t40 = (t40 & t43);
    t44 = *((unsigned int *)t42);
    t41 = (t41 & t44);
    t45 = (t39 + 4);
    t46 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t46 | t40);
    t47 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t47 | t41);
    xsi_driver_vfirst_trans(t35, 0, 0);
    t48 = (t0 + 16272);
    *((int *)t48) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 11520);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memset(t21, 0, 8);
    t22 = (t21 + 4);
    t23 = (t20 + 4);
    t24 = *((unsigned int *)t20);
    t25 = (t24 >> 7);
    t26 = (t25 & 1);
    *((unsigned int *)t21) = t26;
    t27 = *((unsigned int *)t23);
    t28 = (t27 >> 7);
    t29 = (t28 & 1);
    *((unsigned int *)t22) = t29;
    goto LAB9;

LAB10:    t34 = ((char*)((ng19)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t21, 1, t34, 1);
    goto LAB16;

LAB14:    memcpy(t3, t21, 8);
    goto LAB16;

}

static void Cont_37_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t21[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;

LAB0:    t1 = (t0 + 14696U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 13280);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t30 = *((unsigned int *)t4);
    t31 = (~(t30));
    t32 = *((unsigned int *)t14);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t34, 8);

LAB16:    t35 = (t0 + 16576);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    memset(t39, 0, 8);
    t40 = 1U;
    t41 = t40;
    t42 = (t3 + 4);
    t43 = *((unsigned int *)t3);
    t40 = (t40 & t43);
    t44 = *((unsigned int *)t42);
    t41 = (t41 & t44);
    t45 = (t39 + 4);
    t46 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t46 | t40);
    t47 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t47 | t41);
    xsi_driver_vfirst_trans(t35, 0, 0);
    t48 = (t0 + 16288);
    *((int *)t48) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 11360);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memset(t21, 0, 8);
    t22 = (t21 + 4);
    t23 = (t20 + 4);
    t24 = *((unsigned int *)t20);
    t25 = (t24 >> 1);
    t26 = (t25 & 1);
    *((unsigned int *)t21) = t26;
    t27 = *((unsigned int *)t23);
    t28 = (t27 >> 1);
    t29 = (t28 & 1);
    *((unsigned int *)t22) = t29;
    goto LAB9;

LAB10:    t34 = ((char*)((ng19)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t21, 1, t34, 1);
    goto LAB16;

LAB14:    memcpy(t3, t21, 8);
    goto LAB16;

}

static void Cont_38_3(char *t0)
{
    char t5[8];
    char t34[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;

LAB0:    t1 = (t0 + 14944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 9520U);
    t3 = *((char **)t2);
    t2 = (t0 + 9680U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 | t7);
    *((unsigned int *)t5) = t8;
    t2 = (t3 + 4);
    t9 = (t4 + 4);
    t10 = (t5 + 4);
    t11 = *((unsigned int *)t2);
    t12 = *((unsigned int *)t9);
    t13 = (t11 | t12);
    *((unsigned int *)t10) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 != 0);
    if (t15 == 1)
        goto LAB4;

LAB5:
LAB6:    t32 = (t0 + 9840U);
    t33 = *((char **)t32);
    t35 = *((unsigned int *)t5);
    t36 = *((unsigned int *)t33);
    t37 = (t35 | t36);
    *((unsigned int *)t34) = t37;
    t32 = (t5 + 4);
    t38 = (t33 + 4);
    t39 = (t34 + 4);
    t40 = *((unsigned int *)t32);
    t41 = *((unsigned int *)t38);
    t42 = (t40 | t41);
    *((unsigned int *)t39) = t42;
    t43 = *((unsigned int *)t39);
    t44 = (t43 != 0);
    if (t44 == 1)
        goto LAB7;

LAB8:
LAB9:    t61 = (t0 + 16640);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    t64 = (t63 + 56U);
    t65 = *((char **)t64);
    memset(t65, 0, 8);
    t66 = 1U;
    t67 = t66;
    t68 = (t34 + 4);
    t69 = *((unsigned int *)t34);
    t66 = (t66 & t69);
    t70 = *((unsigned int *)t68);
    t67 = (t67 & t70);
    t71 = (t65 + 4);
    t72 = *((unsigned int *)t65);
    *((unsigned int *)t65) = (t72 | t66);
    t73 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t73 | t67);
    xsi_driver_vfirst_trans(t61, 0, 0);
    t74 = (t0 + 16304);
    *((int *)t74) = 1;

LAB1:    return;
LAB4:    t16 = *((unsigned int *)t5);
    t17 = *((unsigned int *)t10);
    *((unsigned int *)t5) = (t16 | t17);
    t18 = (t3 + 4);
    t19 = (t4 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (~(t20));
    t22 = *((unsigned int *)t3);
    t23 = (t22 & t21);
    t24 = *((unsigned int *)t19);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (~(t23));
    t29 = (~(t27));
    t30 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t30 & t28);
    t31 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t31 & t29);
    goto LAB6;

LAB7:    t45 = *((unsigned int *)t34);
    t46 = *((unsigned int *)t39);
    *((unsigned int *)t34) = (t45 | t46);
    t47 = (t5 + 4);
    t48 = (t33 + 4);
    t49 = *((unsigned int *)t47);
    t50 = (~(t49));
    t51 = *((unsigned int *)t5);
    t52 = (t51 & t50);
    t53 = *((unsigned int *)t48);
    t54 = (~(t53));
    t55 = *((unsigned int *)t33);
    t56 = (t55 & t54);
    t57 = (~(t52));
    t58 = (~(t56));
    t59 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t59 & t57);
    t60 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t60 & t58);
    goto LAB9;

}

static void Cont_39_4(char *t0)
{
    char t3[8];
    char t4[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;

LAB0:    t1 = (t0 + 15192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 12640);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t20 = *((unsigned int *)t4);
    t21 = (~(t20));
    t22 = *((unsigned int *)t14);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t18, 8);

LAB16:    t24 = (t0 + 16704);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memset(t28, 0, 8);
    t29 = 1U;
    t30 = t29;
    t31 = (t3 + 4);
    t32 = *((unsigned int *)t3);
    t29 = (t29 & t32);
    t33 = *((unsigned int *)t31);
    t30 = (t30 & t33);
    t34 = (t28 + 4);
    t35 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t35 | t29);
    t36 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t36 | t30);
    xsi_driver_vfirst_trans(t24, 0, 0);
    t37 = (t0 + 16320);
    *((int *)t37) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 10000U);
    t19 = *((char **)t18);
    goto LAB9;

LAB10:    t18 = ((char*)((ng20)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t19, 1, t18, 1);
    goto LAB16;

LAB14:    memcpy(t3, t19, 8);
    goto LAB16;

}

static void Cont_40_5(char *t0)
{
    char t3[8];
    char t4[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;

LAB0:    t1 = (t0 + 15440U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 12800);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t21 = *((unsigned int *)t4);
    t22 = (~(t21));
    t23 = *((unsigned int *)t14);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t25, 8);

LAB16:    t26 = (t0 + 16768);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memset(t30, 0, 8);
    t31 = 255U;
    t32 = t31;
    t33 = (t3 + 4);
    t34 = *((unsigned int *)t3);
    t31 = (t31 & t34);
    t35 = *((unsigned int *)t33);
    t32 = (t32 & t35);
    t36 = (t30 + 4);
    t37 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t37 | t31);
    t38 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t38 | t32);
    xsi_driver_vfirst_trans(t26, 0, 7);
    t39 = (t0 + 16336);
    *((int *)t39) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 12480);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    goto LAB9;

LAB10:    t25 = ((char*)((ng21)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 8, t20, 8, t25, 8);
    goto LAB16;

LAB14:    memcpy(t3, t20, 8);
    goto LAB16;

}

static void Always_89_6(char *t0)
{
    char t13[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;

LAB0:    t1 = (t0 + 15688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 16352);
    *((int *)t2) = 1;
    t3 = (t0 + 15720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(90, ng0);
    t4 = (t0 + 8080U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 10400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB11;

LAB9:    if (*((unsigned int *)t5) == 0)
        goto LAB8;

LAB10:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;

LAB11:    t12 = (t13 + 4);
    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = (~(t15));
    *((unsigned int *)t13) = t16;
    *((unsigned int *)t12) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB13;

LAB12:    t21 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t21 & 1U);
    t22 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t22 & 1U);
    t23 = (t0 + 10400);
    xsi_vlogvar_wait_assign_value(t23, t13, 0, 0, 1, 0LL);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(91, ng0);
    t11 = ((char*)((ng15)));
    t12 = (t0 + 10400);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB7;

LAB8:    *((unsigned int *)t13) = 1;
    goto LAB11;

LAB13:    t17 = *((unsigned int *)t13);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t17 | t18);
    t19 = *((unsigned int *)t12);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t12) = (t19 | t20);
    goto LAB12;

}

static void Always_95_7(char *t0)
{
    char t14[8];
    char t47[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    int t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;

LAB0:    t1 = (t0 + 15936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 16368);
    *((int *)t2) = 1;
    t3 = (t0 + 15968);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(96, ng0);
    t4 = (t0 + 8080U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(111, ng0);

LAB9:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 12320);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB10:    t5 = ((char*)((ng1)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t5, 11);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t2, 11);
    if (t13 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t2, 11);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t2, 11);
    if (t13 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t2, 11);
    if (t13 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng22)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t2, 11);
    if (t13 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng10)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t2, 11);
    if (t13 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng12)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t2, 11);
    if (t13 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng14)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t2, 11);
    if (t13 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng16)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t2, 11);
    if (t13 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng18)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t2, 11);
    if (t13 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng24)));
    t13 = xsi_vlog_unsigned_case_xcompare(t4, 11, t2, 11);
    if (t13 == 1)
        goto LAB33;

LAB34:
LAB36:
LAB35:    xsi_set_current_line(273, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);

LAB37:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(97, ng0);

LAB8:    xsi_set_current_line(98, ng0);
    t11 = (t0 + 5640);
    t12 = *((char **)t11);
    t11 = (t0 + 12800);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 13120);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 12960);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 13280);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 12640);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 10560);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 11040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 10880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 10720);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(108, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    goto LAB7;

LAB11:    xsi_set_current_line(114, ng0);

LAB38:    xsi_set_current_line(115, ng0);
    t11 = (t0 + 5640);
    t12 = *((char **)t11);
    t11 = (t0 + 12800);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 13120);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 12960);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 13280);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 12640);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 8400U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(125, ng0);
    t2 = (t0 + 8560U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB43;

LAB44:    xsi_set_current_line(131, ng0);

LAB47:    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 10720);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 10880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);

LAB45:
LAB41:    goto LAB37;

LAB13:    xsi_set_current_line(138, ng0);

LAB48:    xsi_set_current_line(139, ng0);
    t3 = (t0 + 5640);
    t5 = *((char **)t3);
    t3 = (t0 + 12800);
    xsi_vlogvar_wait_assign_value(t3, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 13120);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(141, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 13280);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 5504);
    t3 = *((char **)t2);
    t2 = (t0 + 12960);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 5504);
    t3 = *((char **)t2);
    t2 = (t0 + 12640);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(144, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 11200);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(145, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 11360);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(146, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 12000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(147, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 11040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(148, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 10560);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    goto LAB37;

LAB15:    xsi_set_current_line(152, ng0);
    t3 = (t0 + 11040);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng17)));
    memset(t14, 0, 8);
    t15 = (t11 + 4);
    t16 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t15);
    t10 = *((unsigned int *)t16);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t16);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB52;

LAB49:    if (t21 != 0)
        goto LAB51;

LAB50:    *((unsigned int *)t14) = 1;

LAB52:    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (~(t26));
    t28 = *((unsigned int *)t14);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB53;

LAB54:    xsi_set_current_line(155, ng0);

LAB62:    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng19)));
    t3 = (t0 + 8720U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng19)));
    t11 = ((char*)((ng1)));
    t12 = ((char*)((ng19)));
    t15 = ((char*)((ng1)));
    xsi_vlogtype_concat(t14, 8, 8, 6U, t15, 1, t12, 1, t11, 1, t3, 1, t5, 3, t2, 1);
    t16 = (t0 + 11520);
    xsi_vlogvar_wait_assign_value(t16, t14, 0, 0, 8, 0LL);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 12960);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(158, ng0);
    t2 = (t0 + 5504);
    t3 = *((char **)t2);
    t2 = (t0 + 13120);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(159, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 11040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(160, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 11680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 9, 0LL);
    xsi_set_current_line(161, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);

LAB55:    goto LAB37;

LAB17:    xsi_set_current_line(164, ng0);
    t3 = (t0 + 11040);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng17)));
    memset(t14, 0, 8);
    t15 = (t11 + 4);
    t16 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t15);
    t10 = *((unsigned int *)t16);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t16);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB66;

LAB63:    if (t21 != 0)
        goto LAB65;

LAB64:    *((unsigned int *)t14) = 1;

LAB66:    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (~(t26));
    t28 = *((unsigned int *)t14);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB67;

LAB68:    xsi_set_current_line(167, ng0);

LAB76:    xsi_set_current_line(168, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 11680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 9, 0LL);
    xsi_set_current_line(169, ng0);
    t2 = (t0 + 8880U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 8);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 8);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 255U);
    t17 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t17 & 255U);
    t11 = (t0 + 11520);
    xsi_vlogvar_wait_assign_value(t11, t14, 0, 0, 8, 0LL);
    xsi_set_current_line(170, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 11040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(171, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);

LAB69:    goto LAB37;

LAB19:    xsi_set_current_line(174, ng0);
    t3 = (t0 + 11040);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng17)));
    memset(t14, 0, 8);
    t15 = (t11 + 4);
    t16 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t15);
    t10 = *((unsigned int *)t16);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t16);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB80;

LAB77:    if (t21 != 0)
        goto LAB79;

LAB78:    *((unsigned int *)t14) = 1;

LAB80:    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (~(t26));
    t28 = *((unsigned int *)t14);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB81;

LAB82:    xsi_set_current_line(177, ng0);

LAB90:    xsi_set_current_line(178, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 11040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 10720);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB91;

LAB92:
LAB93:    xsi_set_current_line(185, ng0);
    t2 = (t0 + 10880);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB95;

LAB96:
LAB97:
LAB83:    goto LAB37;

LAB21:    xsi_set_current_line(193, ng0);
    t3 = (t0 + 11040);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng17)));
    memset(t14, 0, 8);
    t15 = (t11 + 4);
    t16 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t15);
    t10 = *((unsigned int *)t16);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t16);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB102;

LAB99:    if (t21 != 0)
        goto LAB101;

LAB100:    *((unsigned int *)t14) = 1;

LAB102:    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (~(t26));
    t28 = *((unsigned int *)t14);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB103;

LAB104:    xsi_set_current_line(196, ng0);

LAB112:    xsi_set_current_line(197, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 11040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(198, ng0);
    t2 = (t0 + 10720);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB113;

LAB114:
LAB115:    xsi_set_current_line(204, ng0);
    t2 = (t0 + 10880);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB117;

LAB118:
LAB119:
LAB105:    goto LAB37;

LAB23:    xsi_set_current_line(212, ng0);
    t3 = (t0 + 11040);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng17)));
    memset(t14, 0, 8);
    t15 = (t11 + 4);
    t16 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t15);
    t10 = *((unsigned int *)t16);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t16);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB124;

LAB121:    if (t21 != 0)
        goto LAB123;

LAB122:    *((unsigned int *)t14) = 1;

LAB124:    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (~(t26));
    t28 = *((unsigned int *)t14);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB125;

LAB126:    xsi_set_current_line(215, ng0);

LAB134:    xsi_set_current_line(216, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 12160);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(217, ng0);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    xsi_set_current_line(218, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 13120);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(219, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 11040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB127:    goto LAB37;

LAB25:    xsi_set_current_line(222, ng0);
    t3 = (t0 + 11040);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng17)));
    memset(t14, 0, 8);
    t15 = (t11 + 4);
    t16 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t15);
    t10 = *((unsigned int *)t16);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t16);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB138;

LAB135:    if (t21 != 0)
        goto LAB137;

LAB136:    *((unsigned int *)t14) = 1;

LAB138:    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (~(t26));
    t28 = *((unsigned int *)t14);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB139;

LAB140:    xsi_set_current_line(225, ng0);

LAB148:    xsi_set_current_line(226, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8880U);
    t5 = *((char **)t3);
    memset(t47, 0, 8);
    t3 = (t47 + 4);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 8);
    *((unsigned int *)t47) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 8);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t10 & 7U);
    t17 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t17 & 7U);
    t12 = ((char*)((ng23)));
    xsi_vlogtype_concat(t14, 8, 8, 3U, t12, 4, t47, 3, t2, 1);
    t15 = (t0 + 11520);
    xsi_vlogvar_wait_assign_value(t15, t14, 0, 0, 8, 0LL);
    xsi_set_current_line(227, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 12960);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(228, ng0);
    t2 = (t0 + 5504);
    t3 = *((char **)t2);
    t2 = (t0 + 12640);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(229, ng0);
    t2 = (t0 + 5504);
    t3 = *((char **)t2);
    t2 = (t0 + 13120);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(230, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 11040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(231, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 11680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 9, 0LL);
    xsi_set_current_line(232, ng0);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);

LAB141:    goto LAB37;

LAB27:    xsi_set_current_line(235, ng0);
    t3 = (t0 + 11040);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng17)));
    memset(t14, 0, 8);
    t15 = (t11 + 4);
    t16 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t15);
    t10 = *((unsigned int *)t16);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t16);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB152;

LAB149:    if (t21 != 0)
        goto LAB151;

LAB150:    *((unsigned int *)t14) = 1;

LAB152:    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (~(t26));
    t28 = *((unsigned int *)t14);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB153;

LAB154:    xsi_set_current_line(238, ng0);

LAB162:    xsi_set_current_line(239, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 12640);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(240, ng0);
    t2 = (t0 + 5640);
    t3 = *((char **)t2);
    t2 = (t0 + 13120);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(241, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 11040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(242, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 11840);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 10, 0LL);
    xsi_set_current_line(243, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);

LAB155:    goto LAB37;

LAB29:    xsi_set_current_line(246, ng0);
    t3 = (t0 + 11040);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng17)));
    memset(t14, 0, 8);
    t15 = (t11 + 4);
    t16 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t15);
    t10 = *((unsigned int *)t16);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t16);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB166;

LAB163:    if (t21 != 0)
        goto LAB165;

LAB164:    *((unsigned int *)t14) = 1;

LAB166:    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (~(t26));
    t28 = *((unsigned int *)t14);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB167;

LAB168:    xsi_set_current_line(249, ng0);

LAB176:    xsi_set_current_line(250, ng0);
    t2 = (t0 + 5504);
    t3 = *((char **)t2);
    t2 = (t0 + 13280);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(251, ng0);
    t2 = (t0 + 5504);
    t3 = *((char **)t2);
    t2 = (t0 + 12640);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(252, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 12160);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(253, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 11040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(254, ng0);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);

LAB169:    goto LAB37;

LAB31:    xsi_set_current_line(257, ng0);
    t3 = (t0 + 11040);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng17)));
    memset(t14, 0, 8);
    t15 = (t11 + 4);
    t16 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t15);
    t10 = *((unsigned int *)t16);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t16);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB180;

LAB177:    if (t21 != 0)
        goto LAB179;

LAB178:    *((unsigned int *)t14) = 1;

LAB180:    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (~(t26));
    t28 = *((unsigned int *)t14);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB181;

LAB182:    xsi_set_current_line(260, ng0);

LAB190:    xsi_set_current_line(261, ng0);
    t2 = ((char*)((ng15)));
    t3 = (t0 + 10560);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(262, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 11040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(263, ng0);
    t2 = ((char*)((ng24)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);

LAB183:    goto LAB37;

LAB33:    xsi_set_current_line(266, ng0);

LAB191:    xsi_set_current_line(267, ng0);
    t3 = ((char*)((ng17)));
    t5 = (t0 + 10560);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(268, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 10720);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(269, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 10880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(270, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    goto LAB37;

LAB39:    xsi_set_current_line(121, ng0);

LAB42:    xsi_set_current_line(122, ng0);
    t5 = ((char*)((ng15)));
    t11 = (t0 + 10720);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    goto LAB41;

LAB43:    xsi_set_current_line(126, ng0);

LAB46:    xsi_set_current_line(127, ng0);
    t5 = ((char*)((ng15)));
    t11 = (t0 + 10880);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(128, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    goto LAB45;

LAB51:    t24 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB52;

LAB53:    xsi_set_current_line(153, ng0);
    t31 = (t0 + 15744);
    t32 = (t0 + 7016);
    t33 = xsi_create_subprogram_invocation(t31, 0, t0, t32, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t32, t33);

LAB58:    t34 = (t0 + 15840);
    t35 = *((char **)t34);
    t36 = (t35 + 80U);
    t37 = *((char **)t36);
    t38 = (t37 + 272U);
    t39 = *((char **)t38);
    t40 = (t39 + 0U);
    t41 = *((char **)t40);
    t42 = ((int  (*)(char *, char *))t41)(t0, t35);

LAB60:    if (t42 != 0)
        goto LAB61;

LAB56:    t35 = (t0 + 7016);
    xsi_vlog_subprogram_popinvocation(t35);

LAB57:    t43 = (t0 + 15840);
    t44 = *((char **)t43);
    t43 = (t0 + 7016);
    t45 = (t0 + 15744);
    t46 = 0;
    xsi_delete_subprogram_invocation(t43, t44, t0, t45, t46);
    goto LAB55;

LAB59:;
LAB61:    t34 = (t0 + 15936U);
    *((char **)t34) = &&LAB58;
    goto LAB1;

LAB65:    t24 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB66;

LAB67:    xsi_set_current_line(165, ng0);
    t31 = (t0 + 15744);
    t32 = (t0 + 6584);
    t33 = xsi_create_subprogram_invocation(t31, 0, t0, t32, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t32, t33);

LAB72:    t34 = (t0 + 15840);
    t35 = *((char **)t34);
    t36 = (t35 + 80U);
    t37 = *((char **)t36);
    t38 = (t37 + 272U);
    t39 = *((char **)t38);
    t40 = (t39 + 0U);
    t41 = *((char **)t40);
    t42 = ((int  (*)(char *, char *))t41)(t0, t35);

LAB74:    if (t42 != 0)
        goto LAB75;

LAB70:    t35 = (t0 + 6584);
    xsi_vlog_subprogram_popinvocation(t35);

LAB71:    t43 = (t0 + 15840);
    t44 = *((char **)t43);
    t43 = (t0 + 6584);
    t45 = (t0 + 15744);
    t46 = 0;
    xsi_delete_subprogram_invocation(t43, t44, t0, t45, t46);
    goto LAB69;

LAB73:;
LAB75:    t34 = (t0 + 15936U);
    *((char **)t34) = &&LAB72;
    goto LAB1;

LAB79:    t24 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB80;

LAB81:    xsi_set_current_line(175, ng0);
    t31 = (t0 + 15744);
    t32 = (t0 + 6584);
    t33 = xsi_create_subprogram_invocation(t31, 0, t0, t32, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t32, t33);

LAB86:    t34 = (t0 + 15840);
    t35 = *((char **)t34);
    t36 = (t35 + 80U);
    t37 = *((char **)t36);
    t38 = (t37 + 272U);
    t39 = *((char **)t38);
    t40 = (t39 + 0U);
    t41 = *((char **)t40);
    t42 = ((int  (*)(char *, char *))t41)(t0, t35);

LAB88:    if (t42 != 0)
        goto LAB89;

LAB84:    t35 = (t0 + 6584);
    xsi_vlog_subprogram_popinvocation(t35);

LAB85:    t43 = (t0 + 15840);
    t44 = *((char **)t43);
    t43 = (t0 + 6584);
    t45 = (t0 + 15744);
    t46 = 0;
    xsi_delete_subprogram_invocation(t43, t44, t0, t45, t46);
    goto LAB83;

LAB87:;
LAB89:    t34 = (t0 + 15936U);
    *((char **)t34) = &&LAB86;
    goto LAB1;

LAB91:    xsi_set_current_line(180, ng0);

LAB94:    xsi_set_current_line(181, ng0);
    t12 = ((char*)((ng1)));
    t15 = (t0 + 11680);
    xsi_vlogvar_wait_assign_value(t15, t12, 0, 0, 9, 0LL);
    xsi_set_current_line(182, ng0);
    t2 = (t0 + 8880U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 255U);
    t17 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t17 & 255U);
    t11 = (t0 + 11520);
    xsi_vlogvar_wait_assign_value(t11, t14, 0, 0, 8, 0LL);
    xsi_set_current_line(183, ng0);
    t2 = ((char*)((ng22)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    goto LAB93;

LAB95:    xsi_set_current_line(186, ng0);

LAB98:    xsi_set_current_line(187, ng0);
    t12 = ((char*)((ng2)));
    t15 = (t0 + 11200);
    xsi_vlogvar_wait_assign_value(t15, t12, 0, 0, 2, 0LL);
    xsi_set_current_line(188, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 12000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(189, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    goto LAB97;

LAB101:    t24 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB102;

LAB103:    xsi_set_current_line(194, ng0);
    t31 = (t0 + 15744);
    t32 = (t0 + 6584);
    t33 = xsi_create_subprogram_invocation(t31, 0, t0, t32, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t32, t33);

LAB108:    t34 = (t0 + 15840);
    t35 = *((char **)t34);
    t36 = (t35 + 80U);
    t37 = *((char **)t36);
    t38 = (t37 + 272U);
    t39 = *((char **)t38);
    t40 = (t39 + 0U);
    t41 = *((char **)t40);
    t42 = ((int  (*)(char *, char *))t41)(t0, t35);

LAB110:    if (t42 != 0)
        goto LAB111;

LAB106:    t35 = (t0 + 6584);
    xsi_vlog_subprogram_popinvocation(t35);

LAB107:    t43 = (t0 + 15840);
    t44 = *((char **)t43);
    t43 = (t0 + 6584);
    t45 = (t0 + 15744);
    t46 = 0;
    xsi_delete_subprogram_invocation(t43, t44, t0, t45, t46);
    goto LAB105;

LAB109:;
LAB111:    t34 = (t0 + 15936U);
    *((char **)t34) = &&LAB108;
    goto LAB1;

LAB113:    xsi_set_current_line(199, ng0);

LAB116:    xsi_set_current_line(200, ng0);
    t12 = ((char*)((ng1)));
    t15 = (t0 + 11680);
    xsi_vlogvar_wait_assign_value(t15, t12, 0, 0, 9, 0LL);
    xsi_set_current_line(201, ng0);
    t2 = (t0 + 9200U);
    t3 = *((char **)t2);
    t2 = (t0 + 11520);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(202, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    goto LAB115;

LAB117:    xsi_set_current_line(205, ng0);

LAB120:    xsi_set_current_line(206, ng0);
    t12 = ((char*)((ng2)));
    t15 = (t0 + 11200);
    xsi_vlogvar_wait_assign_value(t15, t12, 0, 0, 2, 0LL);
    xsi_set_current_line(207, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 12000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(208, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 12320);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    goto LAB119;

LAB123:    t24 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB124;

LAB125:    xsi_set_current_line(213, ng0);
    t31 = (t0 + 15744);
    t32 = (t0 + 6584);
    t33 = xsi_create_subprogram_invocation(t31, 0, t0, t32, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t32, t33);

LAB130:    t34 = (t0 + 15840);
    t35 = *((char **)t34);
    t36 = (t35 + 80U);
    t37 = *((char **)t36);
    t38 = (t37 + 272U);
    t39 = *((char **)t38);
    t40 = (t39 + 0U);
    t41 = *((char **)t40);
    t42 = ((int  (*)(char *, char *))t41)(t0, t35);

LAB132:    if (t42 != 0)
        goto LAB133;

LAB128:    t35 = (t0 + 6584);
    xsi_vlog_subprogram_popinvocation(t35);

LAB129:    t43 = (t0 + 15840);
    t44 = *((char **)t43);
    t43 = (t0 + 6584);
    t45 = (t0 + 15744);
    t46 = 0;
    xsi_delete_subprogram_invocation(t43, t44, t0, t45, t46);
    goto LAB127;

LAB131:;
LAB133:    t34 = (t0 + 15936U);
    *((char **)t34) = &&LAB130;
    goto LAB1;

LAB137:    t24 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB138;

LAB139:    xsi_set_current_line(223, ng0);
    t31 = (t0 + 15744);
    t32 = (t0 + 7016);
    t33 = xsi_create_subprogram_invocation(t31, 0, t0, t32, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t32, t33);

LAB144:    t34 = (t0 + 15840);
    t35 = *((char **)t34);
    t36 = (t35 + 80U);
    t37 = *((char **)t36);
    t38 = (t37 + 272U);
    t39 = *((char **)t38);
    t40 = (t39 + 0U);
    t41 = *((char **)t40);
    t42 = ((int  (*)(char *, char *))t41)(t0, t35);

LAB146:    if (t42 != 0)
        goto LAB147;

LAB142:    t35 = (t0 + 7016);
    xsi_vlog_subprogram_popinvocation(t35);

LAB143:    t43 = (t0 + 15840);
    t44 = *((char **)t43);
    t43 = (t0 + 7016);
    t45 = (t0 + 15744);
    t46 = 0;
    xsi_delete_subprogram_invocation(t43, t44, t0, t45, t46);
    goto LAB141;

LAB145:;
LAB147:    t34 = (t0 + 15936U);
    *((char **)t34) = &&LAB144;
    goto LAB1;

LAB151:    t24 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB152;

LAB153:    xsi_set_current_line(236, ng0);
    t31 = (t0 + 15744);
    t32 = (t0 + 6584);
    t33 = xsi_create_subprogram_invocation(t31, 0, t0, t32, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t32, t33);

LAB158:    t34 = (t0 + 15840);
    t35 = *((char **)t34);
    t36 = (t35 + 80U);
    t37 = *((char **)t36);
    t38 = (t37 + 272U);
    t39 = *((char **)t38);
    t40 = (t39 + 0U);
    t41 = *((char **)t40);
    t42 = ((int  (*)(char *, char *))t41)(t0, t35);

LAB160:    if (t42 != 0)
        goto LAB161;

LAB156:    t35 = (t0 + 6584);
    xsi_vlog_subprogram_popinvocation(t35);

LAB157:    t43 = (t0 + 15840);
    t44 = *((char **)t43);
    t43 = (t0 + 6584);
    t45 = (t0 + 15744);
    t46 = 0;
    xsi_delete_subprogram_invocation(t43, t44, t0, t45, t46);
    goto LAB155;

LAB159:;
LAB161:    t34 = (t0 + 15936U);
    *((char **)t34) = &&LAB158;
    goto LAB1;

LAB165:    t24 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB166;

LAB167:    xsi_set_current_line(247, ng0);
    t31 = (t0 + 15744);
    t32 = (t0 + 6152);
    t33 = xsi_create_subprogram_invocation(t31, 0, t0, t32, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t32, t33);

LAB172:    t34 = (t0 + 15840);
    t35 = *((char **)t34);
    t36 = (t35 + 80U);
    t37 = *((char **)t36);
    t38 = (t37 + 272U);
    t39 = *((char **)t38);
    t40 = (t39 + 0U);
    t41 = *((char **)t40);
    t42 = ((int  (*)(char *, char *))t41)(t0, t35);

LAB174:    if (t42 != 0)
        goto LAB175;

LAB170:    t35 = (t0 + 6152);
    xsi_vlog_subprogram_popinvocation(t35);

LAB171:    t43 = (t0 + 15840);
    t44 = *((char **)t43);
    t43 = (t0 + 6152);
    t45 = (t0 + 15744);
    t46 = 0;
    xsi_delete_subprogram_invocation(t43, t44, t0, t45, t46);
    goto LAB169;

LAB173:;
LAB175:    t34 = (t0 + 15936U);
    *((char **)t34) = &&LAB172;
    goto LAB1;

LAB179:    t24 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB180;

LAB181:    xsi_set_current_line(258, ng0);
    t31 = (t0 + 15744);
    t32 = (t0 + 7448);
    t33 = xsi_create_subprogram_invocation(t31, 0, t0, t32, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t32, t33);

LAB186:    t34 = (t0 + 15840);
    t35 = *((char **)t34);
    t36 = (t35 + 80U);
    t37 = *((char **)t36);
    t38 = (t37 + 272U);
    t39 = *((char **)t38);
    t40 = (t39 + 0U);
    t41 = *((char **)t40);
    t42 = ((int  (*)(char *, char *))t41)(t0, t35);

LAB188:    if (t42 != 0)
        goto LAB189;

LAB184:    t35 = (t0 + 7448);
    xsi_vlog_subprogram_popinvocation(t35);

LAB185:    t43 = (t0 + 15840);
    t44 = *((char **)t43);
    t43 = (t0 + 7448);
    t45 = (t0 + 15744);
    t46 = 0;
    xsi_delete_subprogram_invocation(t43, t44, t0, t45, t46);
    goto LAB183;

LAB187:;
LAB189:    t34 = (t0 + 15936U);
    *((char **)t34) = &&LAB186;
    goto LAB1;

}


extern void work_m_00000000001165914716_3815111008_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Cont_37_2,(void *)Cont_38_3,(void *)Cont_39_4,(void *)Cont_40_5,(void *)Always_89_6,(void *)Always_95_7};
	static char *se[] = {(void *)sp_shift8in,(void *)sp_shift8_out,(void *)sp_shift_head,(void *)sp_shift_stop};
	xsi_register_didat("work_m_00000000001165914716_3815111008", "isim/CPS1432_eeprom_init_test_isim_beh.exe.sim/work/m_00000000001165914716_3815111008.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
