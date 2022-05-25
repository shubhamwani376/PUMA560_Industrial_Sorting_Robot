clear
%Set up robot
mdl_puma560
%Maximum torque limits from Table 2.17 page 47 of the book:
% "Visual Control of Robots: High performance Visual Servoing"
% by P. corke
% http://www.petercorke.com/bluebook/book.pdf
max_torques = [56 97 52 10 10 10];
min_torques = -[56 97 52 10 10 10];
%Set up control parameters
KP = 200
KD = 50
