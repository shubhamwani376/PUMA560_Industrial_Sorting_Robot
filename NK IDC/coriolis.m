function B_n = coriolis(q,dq)

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

% Coriolis Matrix B
% B = zeros(15,6);
% 
% B(1,1) = b112;
% B(1,2) = b113;
% B(1,4) = b115;
% B(1,6) = b123;
% 
% B(2,3) = b214;
% B(2,6) = b223;
% B(2,8) = b225;
% B(2,11) = b235;
% 
% B(3,3) = b314;
% 
% B(4,1) = b412;
% B(4,2) = b412;
% B(4,4) = b415;
% 
% B(5,3) = b514;

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


end

