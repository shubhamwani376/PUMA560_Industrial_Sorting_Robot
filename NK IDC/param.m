clc; clear all;

%Initial configuration
% config_i = [0 0 0 0 0 0]';
% vel_i = [0 0 0 0 0 0]';

%Global varibales
global a2 a3 a6 d2 d3 d4 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 I16 I17 I18 I19 I20 I21 I22 I23 Im g1 g2 g3 g4 g5

%DH params for robots
a2 = 0.4318; a3 = -0.0203; a6 = 0.1;
d2 = 0.2435; d3 = -0.0934; d4 = 0.4331; %taken from mdl_p560akb and MAE263B Final

K_p = diag([200 200 200 200 200 200]);
K_d = diag([50 50 50 50 50 50]);
F_v = zeros(6,6);

max_torques = [97.6 186.4 89.4 24.2 20.1 21.3]';
min_torques = -[97.6 186.4 89.4 24.2 20.1 21.3]';


% max_torques = [56 97 52 10 10 10]';
% min_torques = -[56 97 52 10 10 10]';

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

% Gravitational constants (N.m)
g1 = -37.2;
g2 = -8.44;
g3 = 1.02;
g4 = 0.249;
g5 = -0.0282;

%Test
% M = inertia(config_i)
% N = nonlin(config_i,vel_i)
% T = fk(config_i)

%Trajectory inputs
x_h=0.4115; y_h=0.1501; z_h=0.4331; 

x0=[x_h,y_h,z_h]; % home position
T0 = [1 0 0 x_h;
    0 1 0 y_h;
    0 0 1 z_h;
    0 0 0 1];
q0 = (ik(T0))';

wp=[ x_h+0.1,y_h,z_h;
    x_h+0.1,y_h+0.1,z_h;
    x_h,y_h+0.1,z_h;
    x_h,y_h,z_h];

dt = 0.1;
tf = 40;

%Trajectory
[t,x_d,dx_d,ddx_d] = traj(x0,wp,dt,tf);

for i = 1:length(t)
    T = [1 0 0 x_d(i,1);
        0 1 0 x_d(i,2);
        0 0 1 x_d(i,3);
        0 0 0 1];
    q_d(i,:) = ik(T);
%     J = p560.jacob0(q_d(i,:));
%     v = (q_d(i,:))';
%     test = (inv(J)*(v))';
end

for i = 1:length(t)-1
    dq_d(i,:) = (q_d(i+1,:)-q_d(i,:))/dt;
end

dq_d(length(t),:) = [0 0 0 0 0 0];

for i = 1:length(t)-1
    ddq_d(i,:) = (dq_d(i+1,:)-dq_d(i,:))/dt;
end

ddq_d(length(t),:) = [0 0 0 0 0 0];


% Inputs for simulink model
pos_traj = [t', q_d];
vel_traj = [t', dq_d];
acc_traj = [t', ddq_d];

% figure('Name','EE Trajectory plot');
% plot(x_d(:,1),x_d(:,2))
% 
% figure('Name','EE Velocity');
% plot(dx_d(:,1),dx_d(:,2))
% 
% figure('Name','EE Acceleration');
% plot(ddx_d(:,1),ddx_d(:,2))

out = sim("InverseDynamicsController",tf);
