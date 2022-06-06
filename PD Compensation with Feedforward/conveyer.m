clf;clc;clear all;
v_belt = 0.2;
blocks = 0;
x = zeros(20,2);
count=0;
% x_prop = cell(20,2);
x_prop(1,1) = 'r'
x_prop(1,2) = 'o';
time_update = 0.1;
A = ['r','g','b','b'];
B = ['o','s','^','d'];
while (count<50)
    if (10*rand()>8)
        blocks=blocks+1;
        x(blocks,:) = [0,0.9*rand()+0.1];
        x_prop(blocks+1,1) = randsample(A,1);
        x_prop(blocks+1,2) = randsample(B,1);
    end
    x(:,1)=x(:,1)+v_belt*time_update;
    pause(time_update)
    for c=1:blocks
        s = scatter(x(c,1),x(c,2),char(x_prop(c,1)),"filled",char(x_prop(c,2)));
        s.SizeData = 1000;
        xlim([0 1]);
        ylim([0 1]);
        drawnow
        hold on
    end
    hold off;
    count=count+1;
end
set(gca, 'Visible', 'off')
exportgraphics(gcf,'conveyer.png','Resolution',50,'BackgroundColor','black','ContentType','image')