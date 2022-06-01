%axes 6, 5 points, 3 via points
x_home=0.4115;y_home=0.1501;z_home=0.4331;

q0=[x_home,y_home,z_home];
wp=[ x_home+0.1,y_home,z_home;
    x_home+0.1,y_home+0.1,z_home;
    x_home,y_home+0.1,z_home;
    x_home,y_home,z_home];
tseg = [10,10,10,10];
tacc = tseg(1)/10;
T = linspace(0,40,400);
x_d = mstraj(wp, [], tseg, q0, 0.1, tacc);
dx_d=gradient(x_d);
ddx_d=gradient(dx_d);
% plot(x_d(:,1),x_d(:,2))
% hold on
% figure(2)
% plot(T , dx_d(:,1))
% figure(3)
% plot(ddx_d(:,1),ddx_d(:,2))