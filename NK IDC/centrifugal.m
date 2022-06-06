function C_n = centrifugal(q,dq)

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

%Inertia constants in kg.m^2
I1 = 1.43;
I2 = 1.75;
I3 = 1.38;
I4 = 0.69;
I5 = 0.372;
I6 = 0.333;
I7 = 0.298;
I8 = -0.134;
I9 = 0.0238;
I10 = -0.0213;
I11 = -0.0142;
I12 = -0.011;
I13 = -0.00379;
I14 = 0.00164;
I15 = 0.00125;
I16 = 0.00124;
I17 = 0.000642;
I18 = 0.000431;
I19 = 0.0003;
I20 = -0.000202;
I21 = -0.0001;
I22 = -0.000058;
I23 = 0.00004;

Im = [ 1.14 4.71 0.827 0.2 0.179 0.193 ];

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


% Centrifugal matrix elements
c12 = I4*cos(q2)-I8*sin(q2+q3)-I9*sin(q2)+I13*cos(q2+q3)+I18*sin(q2+q3);
c13 = 0.5*b123;
c21 = -0.5*b112;
c23 = 0.5*b223;
c31 = -0.5*b113;
c32 = -1*c23;

c51 = -0.5*b115;
c52 = -0.5*b225;

% %Centrifugal matrix C
% C=zeros(6,6);
% 
% C(1,2) = c12;
% C(1,3) = c13;
% 
% C(2,1) = c21;
% C(2,3) = c23;
% 
% C(3,1) = c31;
% C(3,2) = c32;
% 
% C(5,1) = c51;
% C(5,2) = c52;

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


end

