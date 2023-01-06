figure('Name','Joint Positions');
plot(out.Time.Data(:,1),out.JointPosition.Data(1,:)*(180/pi));
hold on;
plot(out.Time.Data(:,1),out.JointPosition.Data(2,:)*(180/pi));
hold on;
plot(out.Time.Data(:,1),out.JointPosition.Data(3,:)*(180/pi));
grid on;
title('Joint Positions');

% xlim([0,9.4]); % for param_10
% xline(3,'--k','Phase 1');
% xline(5,'--k','Phase 2');
% xline(9,'--k','Phase 3');

xlim([0,7]); % for param_7
xline(2.1,'--k','Phase 1');
xline(4.1,'--k','Phase 2');
xline(6.9,'--k','Phase 3');

% ylim([-pi,pi]);
ylim([-180,180]); 
legend('Joint 1','Joint 2','Joint 3');
xlabel('Time (s)');
ylabel('q (deg)');

figure('Name','Joint velocities');
plot(out.Time.Data(:,1),out.JointVel.Data(1,:)*(180/pi));
hold on;
plot(out.Time.Data(:,1),out.JointVel.Data(2,:)*(180/pi));
hold on;
plot(out.Time.Data(:,1),out.JointVel.Data(3,:)*(180/pi));
grid on;
title('Joint Velocities');

% xlim([0,9.4]); % for param_10
% xline(3,'--k','Phase 1');
% xline(5,'--k','Phase 2');
% xline(9,'--k','Phase 3');

xlim([0,7]); % for param_7
xline(2.1,'--k','Phase 1');
xline(4.1,'--k','Phase 2');
xline(6.9,'--k','Phase 3');

% ylim([-pi,pi]);
ylim([-120,120]); 
legend('Joint 1','Joint 2','Joint 3');
xlabel('Time (s)');
ylabel('dq (deg/s)');
