## Industrobot4.0: Pick and Place PUMA 560 Robot
### Authors:
[Shubham Wani](https://www.linkedin.com/in/shubhamwani/) , Nikunj Sanghai and Nitesh Kalra

## Implementation
This project implements the following features:
1. Multi-axes multi-segment 3D Trajectory generation for Puma 560 robot for pick and place application
2. Trajectory is 3D [LSPB](http://www.mnrlab.com/uploads/7/3/8/3/73833313/trajectory.pdf) type with phases for Object Interception, Trajectory Tracking and Object Placement

3. State visualization based on stick plots using Peter Corkes Robotics Toolbox for MATLAB
4. Verification of Forward and Inverse Kinematics, and RGB channel separation based object detection and sorting
5. Implementation and Comparative study of Computed Torque Control, PD Control with Gravity Compensation and Inverse Dynamics Control of 6 DoF arm in MATLAB Simulink
6. PID Tuning for minimizing parameters like L2 norm error at end effector, current requirements. 
7. Report writing and creating videos to summarise the findings.

## Conclusion
1. Computed Torque Control failed and the motion was unbounded
2. PD Control with Gravity Compensation (PGDC) was partially successfull with max L2 norm error at EE ~0.09 m
PDGC had worse performance as trajectories got more aggressive.
3. Inverse Dynamics Control(IDC) had best performance with max L2 norm error at EE ~0.025 m
4. Refer to the [REPORT](https://github.com/shubhamwani376/PUMA560_Industrial_Sorting_Robot/blob/main/Project%20Report.pdf) for detailed conclusions and plots


## Video
![PGDC](https://github.com/shubhamwani376/PUMA560_Industrial_Sorting_Robot/blob/main/P560_PDControlwithGravityCompensation/PD%20Control%20Gravity.gif)
![IDC](https://github.com/shubhamwani376/PUMA560_Industrial_Sorting_Robot/blob/main/P560_InverseDynamicsControl/InverseDynamicsControl_RobotTrajectory.gif)

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
5. Relevant files added to folder [Reference](https://github.com/shubhamwani376/PUMA560_Industrial_Sorting_Robot/tree/main/Reference)