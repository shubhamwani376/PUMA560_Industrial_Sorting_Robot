clear all; close all; clc
syms t1 t2 t3 t4 t5 t6 a2 a3 a6 d2 d3 d4 dt

%% Robot Definition (Symbolic)
L1 = Link('revolute','d', 0, 'a', 0,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L2 = Link('revolute','d', 0, 'a', 0,'alpha', sym(-pi/2), 'modified', 'qlim',[-2*pi,2*pi]);
L3 = Link('revolute','d', d3, 'a', a2,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L4 = Link('revolute','d', d4, 'a', a3,'alpha', sym(pi/2), 'modified', 'qlim',[-2*pi,2*pi]);
L5 = Link('revolute','d', 0, 'a', 0,'alpha', sym(-pi/2), 'modified', 'qlim',[-2*pi,2*pi]);
L6 = Link('revolute','d', 0, 'a', 0,'alpha', sym(pi/2), 'modified', 'qlim',[-2*pi,2*pi]);

%% DH Parameters (Symbolic)
Puma560 = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'Puma560')

%% Forward Kinematics (Symbolic)
DH_Mod = [t1 t2 t3 t4 t5 t6 dt];
Puma560_FK = simplify(Puma560.fkine(DH_Mod))

%Robot Definition
a2 = 0.4318; a3 = 0.0191; a6 = 0.1;
d3 = 0.1254; d4 = 0.4318;

L1 = Link('revolute','d', 0, 'a', 0,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L2 = Link('revolute','d', 0, 'a', 0,'alpha', -pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L3 = Link('revolute','d', d3, 'a', a2,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L4 = Link('revolute','d', d4, 'a', a3,'alpha', pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L5 = Link('revolute','d', 0, 'a', 0,'alpha', -pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L6 = Link('revolute','d', 0, 'a', 0,'alpha', pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
tool = transl(-0.1,0,0.13625);

Puma560 = SerialLink([L1 L2 L3 L4 L5 L6], 'tool', tool,'name','Puma560');
