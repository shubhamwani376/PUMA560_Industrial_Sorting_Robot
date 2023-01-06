% EE space Error Analysis
% X-Direction
figure('Name','EE space - Desired vs Actual Comparision');
subplot(3,1,1)
plot(t(1,:),x_d(:,1),'Color',[1 0 0]);
hold on;
grid on;
plot(out.Time.Data(:,1),P_a(1,:),'Color',[0 1 0]);
xline(3,'--k','Phase 1');
xline(5,'--k','Phase 2');
xline(9,'--k','Phase 3');
title('EE space - Desired vs Actual Comparision (X)');
ylim([-0.4,0.6]);
legend('Desired Trajectory', 'Actual Trajectory');
xlabel('Time (s)');
ylabel('X (m)');

% Y-Direction
subplot(3,1,2)
plot(t(1,:),x_d(:,2),'Color',[1 0 0]);
hold on;
grid on;
plot(out.Time.Data(:,1),P_a(2,:),'Color',[0 1 0]);
xline(3,'--k','Phase 1');
xline(5,'--k','Phase 2');
xline(9,'--k','Phase 3');
title('EE space - Desired vs Actual Comparision (Y)');
ylim([-0.4,0.6]);
legend('Desired Trajectory', 'Actual Trajectory');
xlabel('Time (s)');
ylabel('Y (m)');

% Z-Direction
subplot(3,1,3)
plot(t(1,:),x_d(:,3),'Color',[1 0 0]);
hold on;
grid on;
plot(out.Time.Data(:,1),P_a(3,:),'Color',[0 1 0]);
xline(3,'--k','Phase 1');
xline(5,'--k','Phase 2');
xline(9,'--k','Phase 3');
title('EE space - Desired vs Actual Comparision (Z)');
ylim([-0.4,0.6]);
legend('Desired Trajectory', 'Actual Trajectory');
xlabel('Time (s)');
ylabel('Z (m)');
hold off;