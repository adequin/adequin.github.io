function dJ1 = jacobian_dot_foot1(in1,in2)
%JACOBIAN_DOT_FOOT1
%    dJ1 = JACOBIAN_DOT_FOOT1(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 23.2.
%    25-Nov-2024 16:17:34

dth1 = in1(9,:);
dth2 = in1(10,:);
l_AC = in2(17,:);
l_DE = in2(18,:);
l_OB = in2(16,:);
th1 = in1(3,:);
th2 = in1(4,:);
t2 = cos(th1);
t3 = sin(th1);
t4 = th1+th2;
t5 = cos(t4);
t6 = sin(t4);
t7 = dth2.*l_AC.*t5;
t8 = dth2.*l_AC.*t6;
t9 = -t8;
dJ1 = reshape([0.0,0.0,0.0,0.0,t9-dth1.*(l_AC.*t6+l_DE.*t3+l_OB.*t3),t7+dth1.*(l_AC.*t5+l_DE.*t2+l_OB.*t2),t9-dth1.*l_AC.*t6,t7+dth1.*l_AC.*t5,0.0,0.0,0.0,0.0],[2,6]);
end