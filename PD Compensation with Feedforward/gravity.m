function G = gravity(q)

% Extracting from input matrix
q1 = q(1);
q2 = q(2);
q3 = q(3);
% q4 = q(4);
% q5 = q(5);
% q6 = q(6);

% Gravitational constants (N.m)
%global g1 g2 g3 g4 g5

g1 = -37.2;
g2 = -8.44;
g3 = 1.02;
g4 = 0.249;
g5 = -0.0282;

% Gravity matrix elements
G2 = (g1*cos(q1))+(g2*sin(q2+q3))+(g3*sin(q2))+(g4*cos(q2+q3))+(g5*sin(q2+q3));
G3 = (g2*sin(q2+q3))+(g4*cos(q2+q3))+(g5*sin(q2+q3));
G5 = g5*sin(q2+q3);

%% Gravity Matrix
G = [0; G2; G3; 0; G5; 0];

end