%Coriolis Matrix(B)
%syms I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 I16 I17 I18 I19 I20 I21 I22 I23 I24 I25 I26 theta1 theta2 theta3 theta4 theta5 theta6 
b112=2*(-I3*sin(theta2)*cos(theta2)+I5*cos(theta2+theta2+theta3) +I7*sin(theta2+theta3)*cos(theta2+theta3) -I12*sin(theta2+theta2+theta3)-I15*2*sin(theta2+theta3)*cos(theta2+theta3)+I16*cos(theta2+theta2+theta3)+I21*sin(theta2+theta3)*cos(theta2+theta3)+I22*(1-2*sin(theta2+theta3)*sin(theta2+theta3)))+ I10*(1-sin(theta2+theta3)*sin(theta2+theta3))+I11*(1-2*sin(theta2)*sin(theta3))
b113=2*(I5*cos(theta2)*cos(theta2+theta3)+I7*sin(theta2+theta3)*cos(theta2+theta3)-I12*cos(theta2)*sin(theta2+theta2)+ I15*2*sin(theta2+theta3)*cos(theta2+theta3)+I16*cos(theta2)*cos(theta2+theta3)+I21*sin(theta2+theta3)*cos(theta2+theta3)+I22*(1-2*sin(theta2+theta3)*sin(theta2+theta3)))+I10*(1-2*sin(theta2+theta3)*sin(theta2+theta3))
b115=2*(-sin(theta2+theta3)*cos(theta2+theta3)+I15*2*sin(theta2+theta3)*cos(theta2+theta3)+I16*cos(theta2)*cos(theta2+theta3)+I22*cos(theta2+theta3)*cos(theta2+theta3))
b123=2*(-I8*sin(theta2+theta3)+I13*cos(theta2+theta3)+I18*sin(theta2+theta3))
b214=I14*sin(theta2+theta3)+I19*sin(theta2+theta3)+2*I20*sin(theta2+theta3)*(1-0.5)
b223=2*(-I12*sin(theta3)+I5*cos(theta3)+I16*cos(theta3))
b225=2*(I16*cos(theta3)+I21)
b235=2*(I16*cos(theta3)+I22)
b314=2*(I20*sin(theta2+theta3)*(1-0.5))+I14*sin(theta2+theta3)+I19*sin(theta2+theta3)
b412=-1*(I14*sin(theta2+theta3)+I19*sin(theta2+theta3)+2*I20*sin(theta2+theta3)*(1-0.5))
b412=b214
b413=-1*(I14*sin(theta2+theta3)+I19*sin(theta2+theta3)+2*I20*sin(theta2+theta3)*(1-0.5))
b413=-1*b314
b415=-I20*sin(theta2+theta3)-I17*sin(theta2+theta3)
b514=I20*sin(theta2+theta3)+I17*sin(theta2+theta3)