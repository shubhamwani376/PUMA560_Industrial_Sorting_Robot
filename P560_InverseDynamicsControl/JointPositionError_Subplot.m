close all;
figure('Name','Joint Position Errors');
subplot(3,1,1)
plot(out.Time.Data(:,1),out.JointPositionErrors.Data(1,:)*(180/pi));
grid on;
yline(0,'--k','Desired Error');
hold on;
xlim([0,8.5]); % for param_10
xline(3,'--k','Phase 1');
xline(5,'--k','Phase 2');
xline(8.4,'--k','Phase 3');
ylim([-12,12]);
legend('Joint 1');
xlabel('Time (s)');
ylabel('Error in q1 (deg)');

subplot(3,1,2)
plot(out.Time.Data(:,1),out.JointPositionErrors.Data(2,:)*(180/pi));
grid on;
yline(0,'--k','Desired Error');
hold on;
xlim([0,8.5]); % for param_10
xline(3,'--k','Phase 1');
xline(5,'--k','Phase 2');
xline(8.4,'--k','Phase 3');
ylim([-12,12]); 
legend('Joint 2');
xlabel('Time (s)');
ylabel('Error in q2 (deg)');

subplot(3,1,3)
plot(out.Time.Data(:,1),out.JointPositionErrors.Data(3,:)*(180/pi));
grid on;
yline(0,'--k','Desired Error');
hold on;
xlim([0,8.5]); % for param_10
xline(3,'--k','Phase 1');
xline(5,'--k','Phase 2');
xline(8.4,'--k','Phase 3');
ylim([-12,12]);
legend('Joint 3');
xlabel('Time (s)');
ylabel('Error in q3 (deg)');