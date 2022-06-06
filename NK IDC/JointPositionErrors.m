figure('Name','Joint Position Errors');
plot(out.JointPositionErrors.Data(1,:));
hold on;
plot(out.JointPositionErrors.Data(2,:));
hold on;
plot(out.JointPositionErrors.Data(3,:));
grid on;
title('Joine Position Errors');
% legend('Joint 1','Joint 2','Joint 3','Joint 4','Joint 5','Joint 6');
legend('Joint 1','Joint 2','Joint 3');
xlabel('Time (s)');
ylabel('q (rad)');