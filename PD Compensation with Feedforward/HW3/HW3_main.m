%**************************************************************************
% VERONICA J. SANTOS
% 4/15/22
% HW3_main.m
%
% This script file was originally created by L. Villani, G. Oriolo, and
% B. Siciliano in Feb. 2009.  It has been modified for MAE C163C / C263C 
% HW #3.
%**************************************************************************

% Variable initialization


global a k_r1 k_r2 pi_m pi_l

% load manipulator dynamic parameters without load mass
  param;
  pi_l = pi_m;

% gravity acceleration
  g = 9.81;

% friction matrix
  K_r = [k_r1,0;0,k_r2];
  %from gear ratio, kr from params file.
  Fm1=0.01;Fm2=0.01;
  F_m = [Fm1,0;0,Fm2];
  F_v = K_r*F_m*K_r;
  % Fm=Kr^-1*Fv*Kr^-1; from Siciliano 8.21.
% sample time of controller
  Tc = [0.001]; %1ms given in question.

% controller gains
  kp_test = 500  ; kv_test = 500 ;
  K_p = [kp_test,0;0,kp_test];
  K_d = [kv_test,0;0,kv_test];
  
% desired position
  %q_d = [pi/4;-pi/2]; %case 1
  q_d = [-pi;-3*pi/4]; %case 2

% initial position
  q_i = q_d - [0.1;0.1]; 

% duration of simulation
  t_d = [2.5]

% sample time for plots
  Ts = Tc;