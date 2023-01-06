clc; clear all;

% Global varibales
global a2 a3 a6 d2 d3 d4 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 I16 I17 I18 I19 I20 I21 I22 I23 Im g1 g2 g3 g4 g5

% DH params for robots
a2 = 0.4318; a3 = -0.0203; a6 = 0.1;
d2 = 0.2435; d3 = -0.0934; d4 = 0.4331;

% Torque limits
max_torques = 0.75*[97.6 186.4 89.4 24.2 20.1 21.3]';
min_torques = -0.75*[97.6 186.4 89.4 24.2 20.1 21.3]';

% Friction Matrix
F_v = zeros(6,6);

% Inertia constants in kg.m^2
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

% Gain Matrices
K_p = diag([200 200 200 200 200 200]);
K_d = diag([40 40 40 40 40 40]);

% Trajectory inputs
dt = 0.1; % time step
x_0 = 0.4115; y_0 = 0.1501; z_0 = 0.4331;

x0=[x_0,y_0,z_0]; % home position
T0 = [1 0 0 x_0;
    0 1 0 y_0;
    0 0 1 z_0;
    0 0 0 1];
q0 = (ik(T0))';

% Conveyor - Grasp start
x_s = -0.3; y_s = 0.5; z_s = 0.35;
xs=[x_s,y_s,z_s];

% Phase 1 - Home to conveyor trajectory
tf_i = 3; % total time
wp_i=[x_0-0.2,y_0+0.2,z_s;
    x_0-0.4,y_s,z_s;
    x_s,y_s,z_s];

tseg_i = [1,1,1]; % time per segment

[t_i,xi_d,dxi_d,ddxi_d] = traj(x0,wp_i,dt,tf_i,tseg_i);

t1 = t_i; % time stamps

% Conveyor - Grasp end
x_e = 0.3; y_e = 0.5; z_e = 0.35;
xe=[x_e,y_e,z_e];

% Phase 2 - Conveyor pickup trajectory
tf_c = 2; % total time
wp_c=[x_s+0.3,y_s,z_s;
    x_e,y_e,z_e];
tseg_c = [1,1]; % time per segment

[t_c,xc_d,dxc_d,ddxc_d] = traj(xs,wp_c,dt,tf_c,tseg_c);

t2 = tf_i + t_c; % time stamps

% Place point
x_f = 0.4; y_f = -0.3; z_f = z_0;
xf=[x_f,y_f,z_f];

% Phase 3 - Conveyor to station placing trajectory
tf_p = 4; % total time
wp_p=[x_f,y_e-0.2,z_f;
    x_f,y_e-0.4,z_f;
    x_f,y_e-0.6,z_f;
    x_f,y_f,z_f];

tseg_p = [1,1,1,1]; % time per segment

[t_p,xp_d,dxp_d,ddxp_d] = traj(xe,wp_p,dt,tf_p,tseg_p);

t3 = tf_i + tf_c + t_p; % time stamps

% Phase 4 - Place station to home trajectory
tf_f = 1; % total time
wp_f=[x_0,y_0,z_0];
tseg_f = [1]; % time per segment

[t_f,xf_d,dxf_d,ddxf_d] = traj(xf,wp_f,dt,tf_f,tseg_f);

t4 = tf_i + tf_c + tf_p + t_f; % time stamps

% Combined trajectory data
t_temp = [t1, t2, t3, t4];

% Desired trajectory data points
x_d = [x0; xi_d; xc_d; xp_d; xf_d];

t = t_temp(1:95);

tf = (tf_i + tf_c + tf_p +tf_f) - 0.6; %simulating till 9.4 s

% Desired Joint Configurations
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

% Simulink model inputs
pos_traj = [t', q_d];
vel_traj = [t', dq_d];
acc_traj = [t', ddq_d];

T_m=Im;
k_v=0.5;
k_m=1/k_v;
k_TP=eye(6,6);
K_P = 500*eye(6,6);
R_a=2*eye(6,6);

K_V=10*eye(6,6);
K_A=2*eye(6,6);%wani bolta hai 6*6 hoga 
T_A=diag(T_m);
k_TV=eye(6,6);
k_TA=eye(6,6);
K_T=15*eye(6,6);
k_r=[62.61 107.36 53.09 76.01 71.91 76.73];
K_R=diag(k_r);
Exp1=K_P*K_V*K_A*T_A+K_V*k_TP*K_A/k_TP;
Exp2=K_P*K_V*K_A;
Exp3=(K_V*k_TV*K_A*T_A+K_A*k_TA)/k_TP;
Exp4=K_A*T_A*k_TA/k_TP;
K_d = 100;
F_v = zeros(6,6);% friction forces non zero 




% max_torques = [56 97 52]';
% min_torques = -[56 97 52]';


q_i = zeros(6,1);
dq_i = zeros(6,1);
q_f = (0.1).*ones(6,1);
dq_f = zeros(6,1);

G = gravity(q_i);
M = inertia(q_i);
[B,C] = corioliscentrifugal(q_i,dq_i);

%Output Data
sample=size(out.tout(:,1));
q_a = [out.JointPosition.Data(:,1),out.JointPosition.Data(:,2), out.JointPosition.Data(:,3), zeros(sample,1), zeros(sample,1), zeros(sample,1)];
Q_a = (q_a)'; % for trajectory with robot


% Actual trajectory data points
for i = 1:(length(q_a)/1000)
    T_a = fk(q_a(i*1000,:));
    [R_traj,P] = tr2rt(T_a);
    P_a(:,i) = P;
end

figure('Name','EE trajectories');
plot3(x_d(:,1),x_d(:,2),x_d(:,3),'Color',[1 0 0]); % desired trajectory
hold on;
grid on;
 plot3(P_a(1,:),P_a(2,:),P_a(3,:),'Color',[0 1 0]); % actual trajectory
legend('Desired Trajectory', 'Actual Trajectory');
title('End Effector - Desired vs Actual Trajectory');
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');