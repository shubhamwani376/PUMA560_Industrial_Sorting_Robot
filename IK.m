%% Inverse Kinematics

function q = ik(Tdes)

%Robot Definition
% a2 = 0.4318; a3 = 0.0191; a6 = 0.1;
% d3 = 0.1254; d4 = 0.4318;


% a2 = 0.4318; a3 = -0.0203; a6 = 0.1;
% d2=0.2435; d3 = -0.0934; %d3 = 0.1254; 
% d4 = 0.4331;
global a2 a3 a6 d2 d3 d4

%Definining Tdes
% x = Tdes(1,4); y = Tdes(2,4); z = Tdes(3,4);
% r11 = Tdes(1,1); r21 = Tdes(2,1); r31 = Tdes(3,1);
% r12 = Tdes(1,2); r22 = Tdes(2,2); r32 = Tdes(3,2);
% r13 = Tdes(1,3); r23 = Tdes(2,3); r33 = Tdes(3,3);
% 
% t1 = atan2(y,x) - atan2(d3, +1*sqrt(x^2 + y^2 - d3^2)); %Joint 1
% 
% K = (x^2 + y^2 + z^2 - a2^2 - a3^2 - d3^2 - d4^2)/(2*a2);
% 
% t3 = atan2(a3,d4) - atan2(K, 1*sqrt(a3^2 + d4^2 - K^2)); %Joint 3
% 
% t23 = atan2((-a3-a2*cos(t3))*z - (cos(t1)*x+sin(t1)*y)*(d4-a2*sin(t3)), z*(a2*sin(t3)-d4) + (a3+a2*cos(t3))*(cos(t1)*x+sin(t1)*y));
% 
% t2 = t23 - t3; %Joint 2
% 
% s4 = -r13*sin(t1) + r23*cos(t1);
% c4 = -r13*cos(t1)*cos(t23) - r23*sin(t1)*cos(t23) + r33*sin(t23);
% t4 = atan2(s4, c4); %Joint 4
% 
% s5 = -r13*(cos(t1)*cos(t23)*cos(t4)+sin(t1)*sin(t4)) - r23*(sin(t1)*cos(t23)*cos(t4)-cos(t1)*sin(t4)) + r33*sin(t23)*cos(t4);
% c5 = -r13*cos(t1)*sin(t23) - r23*sin(t1)*sin(t23) - r33*cos(t23);
% t5 = atan2(s5, c5); %Joint 5
% 
% s6 = -r11*(cos(t1)*cos(t23)*sin(t4) - sin(t1)*cos(t4)) - r21*(sin(t1)*cos(t23)*sin(t4) + cos(t1)*cos(t4)) + r31*sin(t23)*sin(t4);
% c6 = r11*(cos(t5)*(cos(t1)*cos(t4)*cos(t23)+sin(t1)*sin(t4)) - cos(t1)*sin(t5)*sin(t23)) + r21*(cos(t5)*(sin(t1)*cos(t4)*cos(t23) - cos(t1)*sin(t4)) - sin(t1)*sin(t5)*sin(t23)) - r31*(sin(t5)*cos(t23) + cos(t4)*cos(t5)*sin(t23));
% t6 = atan2(s6, c6); %Joint 6
% 
% Puma560_IK = [t1,t2,t3,t4,t5,t6];

L1 = Link('revolute','d', 0, 'a', 0,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L2 = Link('revolute','d', d2, 'a', 0,'alpha', -pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L3 = Link('revolute','d', d3, 'a', a2,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L4 = Link('revolute','d', d4, 'a', a3,'alpha', pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L5 = Link('revolute','d', 0, 'a', 0,'alpha', -pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L6 = Link('revolute','d', 0, 'a', 0,'alpha', pi/2, 'modified', 'qlim',[-2*pi,2*pi]);

p560 = SerialLink([L1 L2 L3 L4 L5 L6],'name','Puma560');

q = p560.ikine(Tdes)

%p560.plot(q)

end