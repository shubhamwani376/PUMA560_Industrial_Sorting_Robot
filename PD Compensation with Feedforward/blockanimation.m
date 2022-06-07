clc;clear all; clf;
z_block=0.35;y_block= 0.5; speed_conveyer = 0.3; dt = 0.1;
x_block_i= -0.3; x_block_f= 0.3;
% x_block_pos = x_block_i;
a2 = 0.4318; a3 = -0.0203; a6 = 0.1;
d2 = 0.2435; d3 = -0.0934; d4 = 0.4331;

L1 = Link('revolute','d', 0, 'a', 0,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L2 = Link('revolute','d', d2, 'a', 0,'alpha', -pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L3 = Link('revolute','d', d3, 'a', a2,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L4 = Link('revolute','d', d4, 'a', a3,'alpha', pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L5 = Link('revolute','d', 0, 'a', 0,'alpha', -pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L6 = Link('revolute','d', 0, 'a', 0,'alpha', pi/2, 'modified', 'qlim',[-2*pi,2*pi]);

Puma560 = SerialLink([L1 L2 L3 L4 L5 L6],'name','Puma560');
DH_Mod=[0 0 0 0 0 0];

% Tdes = vpa(simplify(Puma560.fkine(DH_Mod)),5);
% T = [Tdes.n Tdes.o Tdes.a Tdes.t;
%     0 0 0 1];
Puma560.plot(DH_Mod)
hold on
% plot3(x_block_i,y_block,z_block,'o')
for c=1:20
    Puma560.plot(DH_Mod)
    x_block_pos = x_block_i + speed_conveyer*dt*c; 
   o=plot3(x_block_pos,y_block,z_block,'ro');
   o.MarkerSize=10;
    drawnow
    pause(dt)
    set(o,'Visible','off')
%     hold off;
end