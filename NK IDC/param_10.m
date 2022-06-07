clc; clear all;

% Initial configuration
% config_i = [0 0 0 0 0 0]';
% vel_i = [0 0 0 0 0 0]';

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

% Controller Simulation
out = sim("InverseDynamicsController",tf);

% Output Data
q_a = [out.JointPosition.Data(1,:); out.JointPosition.Data(2,:); out.JointPosition.Data(3,:); out.JointPosition.Data(4,:); out.JointPosition.Data(5,:); out.JointPosition.Data(6,:)];
Q_a = (q_a)'; % for trajectory with robot

% Actual trajectory data points
for i = 1:length(q_a)
    T_a = fk(q_a(:,i));
    [R_traj,P] = tr2rt(T_a);
    P_a(:,i) = P;
end

% Trajectory plots - 3D space
figure('Name','EE trajectories');
plot3(x_d(:,1),x_d(:,2),x_d(:,3),'Color',[1 0 0]); % desired trajectory
hold on;
grid on;
plot3(P_a(1,:),P_a(2,:),P_a(3,:),'Color',[0 1 0]); % actual trajectory
legend('Desired Trajectory', 'Actual Trajectory');

% EE space Error Analysis
% X-Direction
figure('Name','EE - Desired vs Actual Comparision (X)');
plot(t(1,:),x_d(:,1),'Color',[1 0 0]);
hold on;
grid on;
plot(out.Time.Data(:,1),P_a(1,:),'Color',[0 1 0]);
xline(3,'--k','Phase 1');
xline(5,'--k','Phase 2');
xline(9,'--k','Phase 3');
legend('Desired Trajectory', 'Actual Trajectory');

% Y-Direction
figure('Name','EE - Desired vs Actual Comparision (Y)');
plot(t(1,:),x_d(:,2),'Color',[1 0 0]);
hold on;
grid on;
plot(out.Time.Data(:,1),P_a(2,:),'Color',[0 1 0]);
xline(3,'--k','Phase 1');
xline(5,'--k','Phase 2');
xline(9,'--k','Phase 3');
legend('Desired Trajectory', 'Actual Trajectory');

% Z-Direction
figure('Name','EE - Desired vs Actual Comparision (Z)');
plot(t(1,:),x_d(:,3),'Color',[1 0 0]);
hold on;
grid on;
plot(out.Time.Data(:,1),P_a(3,:),'Color',[0 1 0]);
xline(3,'--k','Phase 1');
xline(5,'--k','Phase 2');
xline(9,'--k','Phase 3');
legend('Desired Trajectory', 'Actual Trajectory');
hold off;

% Trajectory with Robot
% Robot Definition
L1 = Link('revolute','d', 0, 'a', 0,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L2 = Link('revolute','d', d2, 'a', 0,'alpha', -pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L3 = Link('revolute','d', d3, 'a', a2,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L4 = Link('revolute','d', d4, 'a', a3,'alpha', pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L5 = Link('revolute','d', 0, 'a', 0,'alpha', -pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L6 = Link('revolute','d', 0, 'a', 0,'alpha', pi/2, 'modified', 'qlim',[-2*pi,2*pi]);

Puma560 = SerialLink([L1 L2 L3 L4 L5 L6],'name','Puma560');

% Initialize video
% RobotTrajectory_Video = VideoWriter('RobotTrajectory_Video','MPEG-4');
% RobotTrajectory_Video.FrameRate = 10;
% open(RobotTrajectory_Video)

figure('Name','Trajectory with robot');
for i = 1 : length(Q_a)
    Puma560.plot(Q_a(i,:),'scale',0.5);
    T_temp = Puma560.fkine(Q_a(i,:));
    [R_traj, P_traj] = tr2rt(T_temp);
    plot3(P_traj(1),P_traj(2),P_traj(3),'g*','MarkerSize',2);
    hold on;
    view(3);
    grid on;
    %     frame = getframe(gcf); %get frame
    %     writeVideo(RobotTrajectory_Video, frame);

end
% hold off;
% close(RobotTrajectory_Video);