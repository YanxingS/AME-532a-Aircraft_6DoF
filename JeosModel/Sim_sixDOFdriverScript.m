%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Sim_sixDOFdriverScript.m
%
% Description: This is a driver script to set up any initial conditions
% required for the 6DOF simulator which then calls the simulink model
% itself
%
%
% Created By: Jeovanny Reyes
% Created On: 02/04/2024 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; close all; clc

rEarth = 6378100; % Radius of earth in meters
% The following are the moments of inertia components
computeMassProps % Outputs Vehicle MOI along with surface area geometry and mass properties

%dcm2quat(); To go from dcm to quaternion transformation
%eul2quat(); % to go from euler angles to quaternion. default is ZYX
useJmassProps = true;

if useJmassProps
    Jxx = J(1,1);
    Jxy = J(1,2);
    Jxz = J(1,3);
    Jyx = J(2,1);
    Jyy = J(2,2);
    Jyz = J(2,3);
    Jzx = J(3,1);
    Jzy = J(3,2);
    Jzz = J(3,3);
else
    Jxx = 1;
    Jxy = 0.;
    Jyx = 2;
    Jxz = 3;
    Jzx = Jxz;
    Jyy = 2;
    Jyz = 0;
    Jzy = Jyz;
    Jzz = 2;
end

%Jmat = [Jxx Jxy -Jxz; Jyx Jyy Jyz; -Jxz Jzy Jzz];
%JmatInv = inv(Jmat);
rt = Jzz*Jxx-(Jxz^2);
LL = 0.8; % lbf*ft*s^2. Roll Body Moment
MM = 0.8; % lbf*ft*s^2. Pitch Body Moment
NN = 0.8; % lbf*ft*s^2. Yaw Body Moment
%Mext_B = [LL; MM; NN]; % Roll, Pitch and Yaw moments omatf body respectively

modelNameSim = "Sim_sixDOF";
open_system(modelNameSim)
sim(modelNameSim,'StartTime','0','StopTime','35','FixedStep','0.1');

t = ans.tout;
posBody_ecef = ans.yout.Data;
posBody_ecef_x = posBody_ecef(1,:,:);
posBody_ecef_y = posBody_ecef(2,:,:);
posBody_ecef_z = posBody_ecef(3,:,:);

figure(1)
plot (t, posBody_ecef_x(:));
title('X-Position of Aircraft w.r.t. ECEF')
ylabel('Distance (m) From Earth Origin')
xlabel('Time (s)')

figure(2)
plot (t, posBody_ecef_y(:));
title('Y-Position of Aircraft w.r.t. ECEF')
ylabel('Distance (m) From Earth Origin')
xlabel('Time (s)')

figure(3)
plot (t, posBody_ecef_z(:));
title('Z-Position of Aircraft w.r.t. ECEF')
ylabel('Distance (m) From Earth Origin')
xlabel('Time (s)')