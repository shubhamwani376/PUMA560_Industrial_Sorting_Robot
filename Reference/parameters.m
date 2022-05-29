clc;
clear all;
close all;
%mass of all links 
%mass array consisting of masses of all links from Link2 to Link 5 with
%last element represting mass of wrist. 
mass_array=[17.40 4.8 0.82 0.34 0.09 2.24];
grear_ratio_array=[62.61 107.36 53.69 76.01 71.91 76.73];
max_toque=[97.6 186.4 89.4 24.2 20.1 21.3];
break_raway_torque=[6.3 5.5 2.6 1.3 1.0 1.2];
position_limit=[pi 3*pi/4 3*pi/4 pi 3*pi/4 3*pi/4];
speed_limit=[8 10 10 5 5 5];
acceleration_limit=[10 12 12 8 8 8];
roc_acc_limit=[30 40 40 20 20 20];
Ix=[0 0.130 0.066 0.192 0.0018 0.0003 0.00015];
Iy=[0 0.524 0.0125 0.0154 0.0018 0.0003 0.00015];
Iz=[0.35 0.539 0.086 0.212 0.0013 0.0004 0.0004];
Imotor=[1.14 4.71 0.83 0 0.200 0.179 0.193];

