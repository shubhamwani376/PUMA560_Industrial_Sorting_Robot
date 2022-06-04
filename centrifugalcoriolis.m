function [B_n,C_n] = centrifugalcoriolis(q)
%Extracting from input matrix
q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);
q5 = q(5);
q6 = q(6);

global I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 I16 I17 I18 I19 I20 I21 I22 I23 Im

%Coriolis Matrix(B)
%syms I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 I16 I17 I18 I19 I20 I21 I22 I23 I24 I25 I26 q1 q2 q3 q4 q5 q6 
b112=2*(-I3*sin(q2)*cos(q2)+I5*cos(q2+q2+q3) +I7*sin(q2+q3)*cos(q2+q3) -I12*sin(q2+q2+q3)-I15*2*sin(q2+q3)*cos(q2+q3)+I16*cos(q2+q2+q3)+I21*sin(q2+q3)*cos(q2+q3)+I22*(1-2*sin(q2+q3)*sin(q2+q3)))+ I10*(1-sin(q2+q3)*sin(q2+q3))+I11*(1-2*sin(q2)*sin(q3))
b113=2*(I5*cos(q2)*cos(q2+q3)+I7*sin(q2+q3)*cos(q2+q3)-I12*cos(q2)*sin(q2+q2)+ I15*2*sin(q2+q3)*cos(q2+q3)+I16*cos(q2)*cos(q2+q3)+I21*sin(q2+q3)*cos(q2+q3)+I22*(1-2*sin(q2+q3)*sin(q2+q3)))+I10*(1-2*sin(q2+q3)*sin(q2+q3))
b115=2*(-sin(q2+q3)*cos(q2+q3)+I15*2*sin(q2+q3)*cos(q2+q3)+I16*cos(q2)*cos(q2+q3)+I22*cos(q2+q3)*cos(q2+q3))
b123=2*(-I8*sin(q2+q3)+I13*cos(q2+q3)+I18*sin(q2+q3))
b214=I14*sin(q2+q3)+I19*sin(q2+q3)+2*I20*sin(q2+q3)*(1-0.5)
b223=2*(-I12*sin(q3)+I5*cos(q3)+I16*cos(q3))
b225=2*(I16*cos(q3)+I21)
b235=2*(I16*cos(q3)+I22)
b314=2*(I20*sin(q2+q3)*(1-0.5))+I14*sin(q2+q3)+I19*sin(q2+q3)
b412=-1*(I14*sin(q2+q3)+I19*sin(q2+q3)+2*I20*sin(q2+q3)*(1-0.5))
b412=b214
b413=-1*(I14*sin(q2+q3)+I19*sin(q2+q3)+2*I20*sin(q2+q3)*(1-0.5))
b413=-1*b314
b415=-I20*sin(q2+q3)-I17*sin(q2+q3)
b514=I20*sin(q2+q3)+I17*sin(q2+q3)

%make big matrix
B_n = zeros(15,6);


%centrifugal Matrix(C)
c12=I4*cos(q2)-I8*sin(q2+q3)-I9*sin(q2)+I13*cos(q2+q3)+I18*sin(q2+q3)
c13=0.5*b123
C21=-0.5*b112
C22=0.5*b223
c23=-0.5*b113
c31=-1*c23
c32=-0.5*b115
C52=-0.5*b225

%make big matrix
C_n=zeros(6,6);

end

