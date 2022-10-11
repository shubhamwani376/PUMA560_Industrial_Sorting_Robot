%plotting L2 norm of the error
clc;
vqx = interp1(out.Time.Data(:,1),P_a(1,:),t(1,:),"spline")';
vqy = interp1(out.Time.Data(:,1),P_a(2,:),t(1,:),"spline")';
vqz = interp1(out.Time.Data(:,1),P_a(3,:),t(1,:),"spline")';
vqnorm=sqrt((x_d(:,1)-vqx).^2+(x_d(:,2)-vqy).^2+(x_d(:,3)-vqz).^2)
figure('Name','EE - Desired vs Actual Comparision (L2 norm)');

plot(t(1,:),vqnorm,'Color',[1 0 0]);
hold on;
grid on;



%plot(t(1,:),vqx,'Color',[0 1 0]);
%legend('Desired Trajectory', 'Actual Trajectory');

% % Y-Direction
% figure('Name','EE - Desired vs Actual Comparision (Y)');
% plot(t(1,:),x_d(:,2),'Color',[1 0 0]);
% hold on;
% grid on;
% plot(out.Time.Data(:,1),P_a(2,:),'Color',[0 1 0]);
% legend('Desired Trajectory', 'Actual Trajectory');
% 
% % Z-Direction
% figure('Name','EE - Desired vs Actual Comparision (Z)');
% plot(t(1,:),x_d(:,3),'Color',[1 0 0]);
% hold on;
% grid on;
% plot(out.Time.Data(:,1),P_a(3,:),'Color',[0 1 0]);
% legend('Desired Trajectory', 'Actual Trajectory');
