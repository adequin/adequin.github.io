function b = b_twolegs(in1,in2,in3)
%B_TWOLEGS
%    B = B_TWOLEGS(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 23.2.
%    25-Nov-2024 16:17:33

Fx = in2(1,:);
Fy = in2(2,:);
dth1 = in1(9,:);
dth2 = in1(10,:);
dth3 = in1(11,:);
dth4 = in1(12,:);
dx = in1(7,:);
dy = in1(8,:);
g = in3(19,:);
l_AC = in3(17,:);
l_A_m3 = in3(13,:);
l_B_m2 = in3(12,:);
l_C_m4 = in3(14,:);
l_OA = in3(15,:);
l_OB = in3(16,:);
l_O_m1 = in3(11,:);
m1 = in3(1,:);
m2 = in3(2,:);
m3 = in3(3,:);
m4 = in3(4,:);
tau1 = in2(3,:);
tau2 = in2(4,:);
tau3 = in2(5,:);
tau4 = in2(6,:);
th1 = in1(3,:);
th2 = in1(4,:);
th3 = in1(5,:);
th4 = in1(6,:);
t2 = cos(th1);
t3 = cos(th3);
t4 = sin(th1);
t5 = sin(th3);
t6 = th1+th2;
t7 = th3+th4;
t8 = l_C_m4.*t2;
t9 = l_C_m4.*t3;
t10 = l_OA.*t2;
t11 = l_OB.*t2;
t12 = l_OA.*t3;
t13 = l_OB.*t3;
t14 = cos(t6);
t15 = cos(t7);
t16 = l_C_m4.*t4;
t17 = l_C_m4.*t5;
t18 = l_OA.*t4;
t19 = l_OB.*t4;
t20 = l_OA.*t5;
t21 = l_OB.*t5;
t22 = sin(t6);
t23 = sin(t7);
t24 = dth1.*l_O_m1.*t2;
t25 = dth3.*l_O_m1.*t3;
t26 = dth1.*l_O_m1.*t4;
t27 = dth3.*l_O_m1.*t5;
t28 = l_AC.*t14;
t29 = l_AC.*t15;
t30 = l_A_m3.*t14;
t31 = l_A_m3.*t15;
t32 = l_B_m2.*t14;
t33 = l_B_m2.*t15;
t34 = l_AC.*t22;
t35 = l_AC.*t23;
t36 = l_A_m3.*t22;
t37 = l_A_m3.*t23;
t38 = l_B_m2.*t22;
t39 = l_B_m2.*t23;
t40 = dx+t24;
t41 = dx+t25;
t54 = dy+t26;
t55 = dy+t27;
t42 = dth1.*t28;
t43 = dth2.*t28;
t44 = dth3.*t29;
t45 = dth4.*t29;
t46 = dth1.*t30;
t47 = dth2.*t30;
t48 = dth3.*t31;
t49 = dth4.*t31;
t50 = dth1.*t32;
t51 = dth2.*t32;
t52 = dth3.*t33;
t53 = dth4.*t33;
t56 = dth1.*t34;
t57 = dth2.*t34;
t58 = dth3.*t35;
t59 = dth4.*t35;
t60 = dth1.*t36;
t61 = dth2.*t36;
t62 = dth3.*t37;
t63 = dth4.*t37;
t64 = dth1.*t38;
t65 = dth2.*t38;
t66 = dth3.*t39;
t67 = dth4.*t39;
t80 = t10+t30;
t81 = t12+t31;
t82 = t11+t32;
t83 = t13+t33;
t84 = t18+t36;
t85 = t20+t37;
t86 = t19+t38;
t87 = t21+t39;
t102 = t8+t10+t28;
t103 = t9+t12+t29;
t110 = t16+t18+t34;
t111 = t17+t20+t35;
t68 = t43.*2.0;
t69 = t45.*2.0;
t70 = t47.*2.0;
t71 = t49.*2.0;
t72 = t51.*2.0;
t73 = t53.*2.0;
t74 = t57.*2.0;
t75 = t59.*2.0;
t76 = t61.*2.0;
t77 = t63.*2.0;
t78 = t65.*2.0;
t79 = t67.*2.0;
t88 = dth1.*t80;
t89 = dth3.*t81;
t90 = dth1.*t82;
t91 = dth3.*t83;
t92 = dth1.*t84;
t93 = dth3.*t85;
t94 = dth1.*t86;
t95 = dth3.*t87;
t96 = t42+t43;
t97 = t44+t45;
t98 = t46+t47;
t99 = t48+t49;
t100 = t50+t51;
t101 = t52+t53;
t104 = t56+t57;
t105 = t58+t59;
t106 = t60+t61;
t107 = t62+t63;
t108 = t64+t65;
t109 = t66+t67;
t112 = dth1.*t110;
t113 = dth3.*t111;
t114 = dth1.*t102;
t115 = dth3.*t103;
t116 = t47+t88;
t117 = t49+t89;
t118 = t51+t90;
t119 = t53+t91;
t120 = t61+t92;
t121 = t63+t93;
t122 = t65+t94;
t123 = t67+t95;
t132 = t43+t114;
t133 = t45+t115;
t134 = t57+t112;
t135 = t59+t113;
t124 = dy+t120;
t125 = dy+t121;
t126 = dy+t122;
t127 = dy+t123;
t128 = dx+t116;
t129 = dx+t117;
t130 = dx+t118;
t131 = dx+t119;
t136 = dx+t132;
t137 = dx+t133;
t138 = dy+t134;
t139 = dy+t135;
t140 = t36.*t128.*2.0;
t141 = t37.*t129.*2.0;
t142 = t38.*t130.*2.0;
t143 = t39.*t131.*2.0;
t144 = t30.*t124.*2.0;
t145 = t31.*t125.*2.0;
t146 = t32.*t126.*2.0;
t147 = t33.*t127.*2.0;
t152 = t34.*t136.*2.0;
t153 = t35.*t137.*2.0;
t154 = t28.*t138.*2.0;
t155 = t29.*t139.*2.0;
t156 = -t154;
t157 = -t155;
et1 = tau1+dth1.*((m3.*(t80.*t120.*2.0-t84.*t116.*2.0-t80.*t124.*2.0+t84.*t128.*2.0))./2.0+(m2.*(t82.*t122.*2.0-t86.*t118.*2.0-t82.*t126.*2.0+t86.*t130.*2.0))./2.0+(m4.*(t102.*t134.*2.0-t102.*t138.*2.0-t110.*t132.*2.0+t110.*t136.*2.0))./2.0+(m1.*(l_O_m1.*t4.*t40.*2.0-l_O_m1.*t2.*t54.*2.0))./2.0)-(m1.*(t26.*t40.*2.0-t24.*t54.*2.0))./2.0+(m3.*(t116.*t124.*2.0-t120.*t128.*2.0))./2.0+(m2.*(t118.*t126.*2.0-t122.*t130.*2.0))./2.0+(m4.*(t132.*t138.*2.0-t134.*t136.*2.0))./2.0;
et2 = dth2.*((m3.*(t140-t144-t84.*t98.*2.0+t80.*t106.*2.0))./2.0+(m2.*(t142-t146-t86.*t100.*2.0+t82.*t108.*2.0))./2.0+(m4.*(t152+t156-t96.*t110.*2.0+t102.*t104.*2.0))./2.0)-g.*m3.*t84-g.*m2.*t86-g.*m4.*t110-g.*l_O_m1.*m1.*t4;
et3 = tau3+dth3.*((m3.*(t81.*t121.*2.0-t85.*t117.*2.0-t81.*t125.*2.0+t85.*t129.*2.0))./2.0+(m2.*(t83.*t123.*2.0-t87.*t119.*2.0-t83.*t127.*2.0+t87.*t131.*2.0))./2.0+(m4.*(t103.*t135.*2.0-t103.*t139.*2.0-t111.*t133.*2.0+t111.*t137.*2.0))./2.0+(m1.*(l_O_m1.*t5.*t41.*2.0-l_O_m1.*t3.*t55.*2.0))./2.0)-(m1.*(t27.*t41.*2.0-t25.*t55.*2.0))./2.0+(m3.*(t117.*t125.*2.0-t121.*t129.*2.0))./2.0+(m2.*(t119.*t127.*2.0-t123.*t131.*2.0))./2.0+(m4.*(t133.*t139.*2.0-t135.*t137.*2.0))./2.0;
et4 = dth4.*((m3.*(t141-t145-t85.*t99.*2.0+t81.*t107.*2.0))./2.0+(m2.*(t143-t147-t87.*t101.*2.0+t83.*t109.*2.0))./2.0+(m4.*(t153+t157-t97.*t111.*2.0+t103.*t105.*2.0))./2.0)-g.*m3.*t85-g.*m2.*t87-g.*m4.*t111-g.*l_O_m1.*m1.*t5;
mt1 = [Fx+dth2.*((m4.*(t56.*2.0+t74))./2.0+(m3.*(t60.*2.0+t76))./2.0+(m2.*(t64.*2.0+t78))./2.0)+dth4.*((m4.*(t58.*2.0+t75))./2.0+(m3.*(t62.*2.0+t77))./2.0+(m2.*(t66.*2.0+t79))./2.0)+dth1.*(m1.*t26+(m3.*(t76+t92.*2.0))./2.0+(m2.*(t78+t94.*2.0))./2.0+(m4.*(t74+t112.*2.0))./2.0)+dth3.*(m1.*t27+(m3.*(t77+t93.*2.0))./2.0+(m2.*(t79+t95.*2.0))./2.0+(m4.*(t75+t113.*2.0))./2.0)];
mt2 = [Fy-g.*m1.*2.0-g.*m2.*2.0-g.*m3.*2.0-g.*m4.*2.0-dth2.*((m4.*(t42.*2.0+t68))./2.0+(m3.*(t46.*2.0+t70))./2.0+(m2.*(t50.*2.0+t72))./2.0)-dth4.*((m4.*(t44.*2.0+t69))./2.0+(m3.*(t48.*2.0+t71))./2.0+(m2.*(t52.*2.0+t73))./2.0)-dth1.*(m1.*t24+(m3.*(t70+t88.*2.0))./2.0+(m2.*(t72+t90.*2.0))./2.0+(m4.*(t68+t114.*2.0))./2.0)-dth3.*(m1.*t25+(m3.*(t71+t89.*2.0))./2.0+(m2.*(t73+t91.*2.0))./2.0+(m4.*(t69+t115.*2.0))./2.0);et1+et2];
mt3 = [tau2+(m3.*(t98.*t124.*2.0-t106.*t128.*2.0))./2.0+(m2.*(t100.*t126.*2.0-t108.*t130.*2.0))./2.0+(m4.*(t96.*t138.*2.0-t104.*t136.*2.0))./2.0+dth2.*((m3.*(t140-t144-t36.*t98.*2.0+t30.*t106.*2.0))./2.0+(m2.*(t142-t146-t38.*t100.*2.0+t32.*t108.*2.0))./2.0+(m4.*(t152+t156-t34.*t96.*2.0+t28.*t104.*2.0))./2.0)+dth1.*((m3.*(t140-t144+t30.*t120.*2.0-t36.*t116.*2.0))./2.0+(m2.*(t142-t146+t32.*t122.*2.0-t38.*t118.*2.0))./2.0+(m4.*(t152+t156+t28.*t134.*2.0-t34.*t132.*2.0))./2.0)-g.*m4.*t34-g.*m3.*t36-g.*m2.*t38;et3+et4];
mt4 = [tau4+(m3.*(t99.*t125.*2.0-t107.*t129.*2.0))./2.0+(m2.*(t101.*t127.*2.0-t109.*t131.*2.0))./2.0+(m4.*(t97.*t139.*2.0-t105.*t137.*2.0))./2.0+dth4.*((m3.*(t141-t145-t37.*t99.*2.0+t31.*t107.*2.0))./2.0+(m2.*(t143-t147-t39.*t101.*2.0+t33.*t109.*2.0))./2.0+(m4.*(t153+t157-t35.*t97.*2.0+t29.*t105.*2.0))./2.0)+dth3.*((m3.*(t141-t145+t31.*t121.*2.0-t37.*t117.*2.0))./2.0+(m2.*(t143-t147+t33.*t123.*2.0-t39.*t119.*2.0))./2.0+(m4.*(t153+t157+t29.*t135.*2.0-t35.*t133.*2.0))./2.0)-g.*m4.*t35-g.*m3.*t37-g.*m2.*t39];
b = [mt1;mt2;mt3;mt4];
end
