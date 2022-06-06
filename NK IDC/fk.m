function T = fk(q)

% Extracting from input matrix
q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);
q5 = q(5);
q6 = q(6);

%Robot Definition
global a2 a3 a6 d2 d3 d4

L1 = Link('revolute','d', 0, 'a', 0,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L2 = Link('revolute','d', d2, 'a', 0,'alpha', -pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L3 = Link('revolute','d', d3, 'a', a2,'alpha', 0, 'modified', 'qlim',[-2*pi,2*pi]);
L4 = Link('revolute','d', d4, 'a', a3,'alpha', pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L5 = Link('revolute','d', 0, 'a', 0,'alpha', -pi/2, 'modified', 'qlim',[-2*pi,2*pi]);
L6 = Link('revolute','d', 0, 'a', 0,'alpha', pi/2, 'modified', 'qlim',[-2*pi,2*pi]);

Puma560 = SerialLink([L1 L2 L3 L4 L5 L6],'name','Puma560');
DH_Mod=[q1 q2 q3 q4 q5 q6];

Tdes = vpa(simplify(Puma560.fkine(DH_Mod)),5);

T = [Tdes.n Tdes.o Tdes.a Tdes.t;
    0 0 0 1];

end