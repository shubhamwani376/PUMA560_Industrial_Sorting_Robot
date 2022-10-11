z_block=0.35;y_block= 0.5; speed_conveyer = 0.3; dt = 0.1;
x_block_i= -0.3; x_block_f= 0.3;

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
RobotTrajectory_Video = VideoWriter('RobotTrajectory_Video','MPEG-4');
RobotTrajectory_Video.FrameRate = 10;
open(RobotTrajectory_Video)

figure('Name','Trajectory with robot');
for i = 1 : length(Q_a)
    Puma560.plot(Q_a(i,:),'scale',0.5);
    xlim([-1.5,1.5]); ylim([-1.5,1.5]); zlim([-1.5,1.5]);
    T_temp = Puma560.fkine(Q_a(i,:));
    [R_traj, P_traj] = tr2rt(T_temp);
    hold on;
    plot3(P_traj(1),P_traj(2),P_traj(3),'g*','MarkerSize',2);
    x_block_pos = x_block_i + speed_conveyer*(out.tout(i)-3); 
    if (out.tout(i)>5)
        if (out.tout(i)<8.5)
            o=plot3(P_traj(1),P_traj(2),P_traj(3),'ro');
        else
            o=plot3(0.4,-0.3,0.4331,'ro');
        end
    else
        o=plot3(x_block_pos,y_block,z_block,'ro');
    end
        o.MarkerSize=10;
    drawnow
    hold on;
    view(3);
    grid on;
    frame = getframe(gcf); %get frame
    writeVideo(RobotTrajectory_Video, frame);
    set(o,'Visible','off')
    hold off;
end
close(RobotTrajectory_Video);