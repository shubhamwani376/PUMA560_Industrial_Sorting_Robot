%axes 6, 5 points, 3 via points
clear all;clc;
x_home=0.4115;y_home=0.1501;z_home=0.4331;

q0=[x_home,y_home,z_home];
wp=[ x_home+0.1,y_home,z_home];
%     x_home+0.1,y_home+0.1,z_home;
%     x_home,y_home+0.1,z_home;
%     x_home,y_home,z_home];
%mstraj(p, [], 0.1, [], qd0, qdf, options)
%tseg = [100,100,100,100];
tseg = [100];
%tacc = [2,2,2,2];
tacc = 3;
traj = mstraj(wp, [], tseg, q0, 0.1, tacc, [])
%traj = mstraj(wp, [], tseg, q0, 0.1, tacc, [])