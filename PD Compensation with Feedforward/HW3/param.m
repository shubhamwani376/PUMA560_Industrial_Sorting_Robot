%PARAM  Augmented link parameters.

% L. Villani, G. Oriolo, B. Siciliano
% February 2009

% link parameters
  % lengths
    a  = [1;1];

  % masses
    m_l1  = 50;
    m_l2  = 50;

  % distances of centers of mass from joint axes
    l_1  =  0.5;
    l_2  =  0.5;

  % inertia moments relative to the centers of mass
    I_l1 = 10;
    I_l2 = I_l1;

% motor parameters
  % masses
    m_m1 = 5;
    m_m2 = 5;

  % inertia moments
    I_m1 = 0.01;
    I_m2 = 0.01;

  % transmission ratios
    k_r1 = 100;
    k_r2 = 100;

% augmented link parameters
  % masses
    m_1 = m_l1 + m_m2;
    m_2 = m_l2;

  % first moments of inertia
    m1_lC1 = m_l1*(l_1 - a(1));
    m2_lC2 = m_l2*(l_2 - a(2));

  % inertia moments relative to origins of link frames
    I_1 = I_l1 + m_l1*(l_1 - a(1))^2 + I_m2;
    I_2 = I_l2 + m_l2*(l_2 - a(2))^2;

% minimum set of dynamic parameters
  pi_m(1) = a(1)*m_1 + m1_lC1 + a(1)*m_2;
  pi_m(2) = a(1)*m1_lC1 + I_1 + k_r1^2*I_m1;
  pi_m(3) = a(2)*m_2 + m2_lC2;
  pi_m(4) = a(2)*m2_lC2 + I_2;
  pi_m(5) = I_m2;
