function [t,x_d,dx_d,ddx_d] = traj(x0,wp,dt,tf,tseg)

% Extracting from input matrix
% q1 = q(1);
% q2 = q(2);
% q3 = q(3);
% q4 = q(4);
% q5 = q(5);
% q6 = q(6);


x_h=0.4115; y_h=0.1501; z_h=0.4331; 

tacc = tseg(1)/10;
t = [0:dt:tf-dt];
x_d = mstraj(wp, [], tseg, x0, dt, tacc);
dx_d=gradient(x_d);
ddx_d=gradient(dx_d);

end
