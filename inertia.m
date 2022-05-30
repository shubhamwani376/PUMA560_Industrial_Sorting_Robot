function M_n = inertia(q)
%Extracting from input matrix
q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);
q5 = q(5);
q6 = q(6);

% Intertial constant reference (Kg.m^2)

global I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 I16 I17 I18 I19 I20 I21 I22 I23 Im

% Inertia matrix elements
M11 = Im(1)+I1+(I3*cos(q2)*cos(q2))+(I7*sin(q2+q3)*sin(q2+q3))+(I10*sin(q2+q3)*cos(q2+q3))+(I11*sin(q2)*cos(q2))+(I21*sin(q2+q3)*sin(q2+q3))+2+(I5*cos(q2)*sin(q2+q3))+(I12*cos(q2)*cos(q2+q3))+(I15*sin(q2+q3)*sin(q2+q3))+(I16*cos(q2)*sin(q2+q3))+(I22*sin(q2+q3)*cos(q2+q3));

M12 = (I4*sin(q2))+(I8*cos(q2+q3))+(I9*cos(q2))+(I13*sin(q2+q3))-(I18*cos(q2+q3));

M13 = (I8*cos(q2+q3))+(I13*sin(q2+q3))-(I18*cos(q2+q3));

M22 = Im(2)+I2+I6+2*(I5*sin(q3)+I12*cos(q2)+I15+I16*sin(q3));

M23 = (I5*sin(q3))+I6+(I12*cos(q3))+(I16*sin(q3))+(2*I15);

M33 = Im(3)+I6+(2*I15);

M35 = I15+I17;

M44 = Im(4)+I14;

M55 = Im(5)+I17;

M66 = Im(6)+I23;

M21 = M12;

M31 = M13;

M32 = M23;

%% M Matrix with coupling interactions- Centralized Control

M = [M11 M12 M13 0 0 0;
    M21 M22 M23 0 0 0;
    M31 M32 M33 0 M35 0;
    0 0 0 M44 0 0;
    0 0 0 0 M55 0;
    0 0 0 0 0 M66];

M_n = M;

end

