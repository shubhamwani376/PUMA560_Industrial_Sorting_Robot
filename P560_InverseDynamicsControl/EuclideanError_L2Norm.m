vqx = interp1(out.Time.Data(:,1),P_a(1,:),t(1,:),"spline")';
vqy = interp1(out.Time.Data(:,1),P_a(2,:),t(1,:),"spline")';
vqz = interp1(out.Time.Data(:,1),P_a(3,:),t(1,:),"spline")';
vqnorm = sqrt((x_d(:,1)-vqx).^2+(x_d(:,2)-vqy).^2+(x_d(:,3)-vqz).^2);
figure('Name','EE - Desired vs Actual Comparision (L2 norm)');
plot(t(1,:),vqnorm,'Color',[1 0 0]);
hold on;
grid on;
title('EE space - Total position error (L2-norm)');
xlim([0,8.5]);
xlabel('Time (s)');
ylabel('Euclidean Error (m)');


