clear all; close all; clc

% function M_n = inertia(q1,q2,q3,q4,q5,q6)
% Extracting from input matrix
% q1 = q(1);
% q2 = q(2);
% q3 = q(3);
% q4 = q(4);
% q5 = q(5);
% q6 = q(6);

% Intertial constant reference (Kg.m^2)
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

Im=[1.14 4.71 0.827 0.2 0.179 0.193];

% Inertia matrix elements
M11 = Im(1)+I1+(I3*cos(q2)*cos(q2))+(I7*sin(q2+q3)*sin(q2+q3))+(I10*sin(q2+q3)*cos(q2+q3))+(I11*sin(q2)*cos(q2))+(I21*sin(q2+q3)*sin(q2+q3))+2+(I5*cos(q2)*sin(q2+q3))+(I12*cos(q2)*cos(q2+q3))+(I15*sin(q2+q3)*sin(q2+q3))+(I16*cos(q2)*sin(q2+q3))+(I22*sin(q2+q3)*cos(q2+q3));

M12 = (I4*sin(q2))+(I8*cos(q2+q3))+(I9*cos(q2))+(I13*sin(q2+q3))-(I18*cos(q2+q3));

M13 = (I8*cos(q2+q3))+(I13*sin(q2+q3))-(I18*cos(q2+q3));

M22 = Im(2)+I2+I6+2*(I5*sin(q3)+I12*cos(q2)+I15+I16*sin(q3));

M23 = (I5*sin(q3))+I6+(I12*cos(q3))+(I16*sin(q3))+(2*I15);

M33 = Im(3)+I6+(2*I15);

M35 = I15+I17;

M44 = Im(4)+I14;

M55 = Im(5)+I17;

M66 = Im(6)+I23;

M21 = M12;

M31 = M13;

M32 = M23;

%% M Matrix with coupling interactions- Centralized Control

M = [M11 M12 M13 0 0 0;
    M21 M22 M23 0 0 0;
    M31 M32 M33 0 M35 0;
    0 0 0 M44 0 0;
    0 0 0 0 M55 0;
    0 0 0 0 0 M66];

% M_n = M;

% end

