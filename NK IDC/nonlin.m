function N = nonlin(q,dq)

% Extracting from input matrices
q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);
q5 = q(5);
q6 = q(6);

dq1 = dq(1);
dq2 = dq(2);
dq3 = dq(3);
dq4 = dq(4);
dq5 = dq(5);
dq6 = dq(6);

global I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 I16 I17 I18 I19 I20 I21 I22 I23 Im g1 g2 g3 g4 g5

% Coriolis matrix elements
b112=2*(-I3*sin(q2)*cos(q2)+I5*cos(q2+q2+q3) +I7*sin(q2+q3)*cos(q2+q3) -I12*sin(q2+q2+q3)-I15*2*sin(q2+q3)*cos(q2+q3)+I16*cos(q2+q2+q3)+I21*sin(q2+q3)*cos(q2+q3)+I22*(1-2*sin(q2+q3)*sin(q2+q3)))+ I10*(1-2*sin(q2+q3)*sin(q2+q3))+I11*(1-2*sin(q2)*sin(q3));

b113=2*(I5*cos(q2)*cos(q2+q3)+I7*sin(q2+q3)*cos(q2+q3)-I12*cos(q2)*sin(q2+q2)+ I15*2*sin(q2+q3)*cos(q2+q3)+I16*cos(q2)*cos(q2+q3)+I21*sin(q2+q3)*cos(q2+q3)+I22*(1-2*sin(q2+q3)*sin(q2+q3)))+I10*(1-2*sin(q2+q3)*sin(q2+q3));

b115=2*(-sin(q2+q3)*cos(q2+q3)+I15*2*sin(q2+q3)*cos(q2+q3)+I16*cos(q2)*cos(q2+q3)+I22*cos(q2+q3)*cos(q2+q3));

b123=2*(-I8*sin(q2+q3)+I13*cos(q2+q3)+I18*sin(q2+q3));

b214=I14*sin(q2+q3)+I19*sin(q2+q3)+2*I20*sin(q2+q3)*(1-0.5);

b223=2*(-I12*sin(q3)+I5*cos(q3)+I16*cos(q3));

b225=2*(I16*cos(q3)+I21);

b235=2*(I16*cos(q3)+I22);

b314=2*(I20*sin(q2+q3)*(1-0.5))+I14*sin(q2+q3)+I19*sin(q2+q3);

b412=-1*(I14*sin(q2+q3)+I19*sin(q2+q3)+2*I20*sin(q2+q3)*(1-0.5));

b412=b214;

b413=-1*(I14*sin(q2+q3)+I19*sin(q2+q3)+2*I20*sin(q2+q3)*(1-0.5));

b413=-1*b314;

b415=-I20*sin(q2+q3)-I17*sin(q2+q3);

b514=I20*sin(q2+q3)+I17*sin(q2+q3);

% Coriolis Matrix B
B = zeros(15,6);

B(1,1) = b112;
B(1,2) = b113;
B(1,4) = b115;
B(1,6) = b123;

B(2,3) = b214;
B(2,6) = b223;
B(2,8) = b225;
B(2,11) = b235;

B(3,3) = b314;

B(4,1) = b412;
B(4,2) = b412;
B(4,4) = b415;

B(5,3) = b514;

% B_n = B.*[qd1*qd2; qd1*qd3; qd2*qd3; 0; 0; 0];

% B_test = [B(1,1) B(1,2) B(1,3);
%     B(2,1) B(2,2) B(2,3);
%     B(3,1) B(3,2) B(3,3)];
% 
% B_n = B_test*[dq1*dq2; dq1*dq3; dq2*dq3];

B_n = [b112*dq1*dq2 + b113*dq1*dq3 + b123*dq2*dq3;
    b223*dq2*dq3;
    0;
    b412*dq1*dq2 + b413*dq1*dq3;
    0;
    0];

% Centrifugal matrix elements
c12 = I4*cos(q2)-I8*sin(q2+q3)-I9*sin(q2)+I13*cos(q2+q3)+I18*sin(q2+q3);
c13 = 0.5*b123;
c21 = -0.5*b112;
c23 = 0.5*b223;
c31 = -0.5*b113;
c32 = -1*c23;

c51 = -0.5*b115;
c52 = -0.5*b225;

%Centrifugal matrix C
C=zeros(6,6);

C(1,2) = c12;
C(1,3) = c13;

C(2,1) = c21;
C(2,3) = c23;

C(3,1) = c31;
C(3,2) = c32;

C(5,1) = c51;
C(5,2) = c52;

% C_n = C.*[qd1^2; qd2^2; qd3^2; 0; 0; 0];

% C_test = [C(1,1), C(1,2), C(1,3);
%     C(2,1), C(2,2), C(2,3);
%     C(3,1), C(3,2), C(3,3)];
% 
% C_n = C_test*[dq1^2; dq2^2; dq3^2];

C_n = [c12*dq2^2 + c13*dq3^2;
    c21*dq1^2 + c23*dq3^2;
    c13*dq1^2 + c32*dq2^2;
    0;
    c51*dq1^2 + c52*dq2^2;
    0];

% Gravity matrix elements
G2 = (g1*cos(q1))+(g2*sin(q2+q3))+(g3*sin(q2))+(g4*cos(q2+q3))+(g5*sin(q2+q3));
G3 = (g2*sin(q2+q3))+(g4*cos(q2+q3))+(g5*sin(q2+q3));
G5 = g5*sin(q2+q3);

% Gravity matrix G

G_n = [0; G2; G3; 0; G5; 0];

N = B_n + C_n + G_n;

end

