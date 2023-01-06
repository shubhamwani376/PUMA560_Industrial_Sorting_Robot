## Industrobot4.0: Pick and Place PUMA 560 Robot
### Author:
[Shubham Wani](https://www.linkedin.com/in/shubhamwani/) , Nikunj Sanghai and Nitesh Kalra

## Implementation
This project implements the following features:
1. Multi-axes multi-segment Trajectory generation for Puma 560 robot for pick and place application
2. State visualization based on stick plots using Peter Corkes Robotics Toolbox for MATLAB
3. Verification of Forward and Inverse Kinematics, and RGB channels based object detection and sorting 
4. Implementation and Comparitive study of Computed Torque Control, PD Control and Inverse Dynamics Control of 6DoF arm in MATLAB Simulink
5. PID Tuning and stewarding parameters like L2 norm error at end effector, current requirements and creating videos.
6. Report writing to summarise the findings.

## Conclusion
Inverse Computed control failed
Other 2 successful, IDC has best Control
RGB layter separation deonstrated


## Video
![Video](https://github.com/shubhamwani376/MPC_Quadcopter/blob/main/Quadrotor.gif)

## Dependencies
```
MATLAB and Simulink. R2020a ed. Natick, Massachusetts: The MathWorks Inc.
Robotics toolbox by P.I. Corke @ https://petercorke.com/toolboxes/robotics-toolbox/
```
## Reference
1. Class notes MAE263C @ UCLA, Spring 22
2. Siciliano, Bruno. 2009. Robotics: Modelling, Planning and Control. Edited by Luigi Villani, Lorenzo Sciavicco, and Giuseppe Oriolo. N.p.: Springer.
3. Piltan, Farzin, Sara Emamzadeh, Zahra Hivand, and Forouzan Shahriyari. 2012. “PUMA-560 Robot Manipulator
Position Sliding Mode Control Methods Using MATLAB/SIMULINK.” International Journal of Robotic and Automation 6 (3).
4. Armstrong, Brian, Oussama Khatib, and Joel Burdick. 10.1109/ROBOT.1986.1087644. “The Explicit Dynamic Model and Inertial Parameters of the PUMA 566 Arm.” Proceedings. 1986 IEEE International Conference on Robotics and Automation, 1986, 510-518.
5. Relevant files added to folder [Reference](https://github.com/shubhamwani376/MPC_Quadcopter/tree/main/Reference)
