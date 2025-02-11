% Compute Mass Properties from following table data
%% Define Aircraft Mass and Geometry Properties (using grams)
% mass xSize ySize  zSize   xLoc    yLoc    zLoc
%  1     2      3     4       5       6       7
componentMassesAndGeom = ...
[90     0.1   0.96   0.01   -0.23   0.44     0; % RightWing+Servo (s4)
90      0.1   0.96   0.01   -0.23  -0.44     0; % LeftWing+Servo (s5)
13     0.075  0.35   0.002  -0.76     0     -0.16; % Hor. Stab. (s2)
0      0.08   0.002  0.18   -0.76     0     -0.09; % Vert. Stab. (s3)
72     0.065  0.035  0.015  -0.05     0      0.03; % Battery
106    0.87   0.07   0.07   -0.4      0      0; % Fuselage
27     0.05   0.03   0.005  -0.05     0      0.02; % Motor Controller
10     0.04   0.02   0.005  -0.1      0      0.02; % Radio
20     0.05   0.01   0.01   -0.014    0      0; % 2 Servos
40     0.03   0.02   0.02    0.02     0      0.01; % Motor
12     0      0.26   0.025   0.05     0      0.01]; % Propeller

x_S2_B_B = [componentMassesAndGeom(3,5); componentMassesAndGeom(3,6); componentMassesAndGeom(3,7)];
x_S3_B_B = [componentMassesAndGeom(4,5); componentMassesAndGeom(4,6); componentMassesAndGeom(4,7)];
x_S4_B_B = [componentMassesAndGeom(1,5); componentMassesAndGeom(1,6); componentMassesAndGeom(1,7)];
x_S5_B_B = [componentMassesAndGeom(2,5); componentMassesAndGeom(2,6); componentMassesAndGeom(2,7)];

totMass = sum(componentMassesAndGeom(:,1));
compCM = zeros(length(componentMassesAndGeom),3);
for i = 1:length(componentMassesAndGeom)
    compCM(i,1) = componentMassesAndGeom(i,1) * componentMassesAndGeom(i,5); % mass * x_Loc
    compCM(i,2) = componentMassesAndGeom(i,1) * componentMassesAndGeom(i,6); % mass * y_Loc
    compCM(i,3) = componentMassesAndGeom(i,1) * componentMassesAndGeom(i,7); % mass * z_Loc
end
sumCompCM = [sum(compCM(:,1)), sum(compCM(:,3)), sum(compCM(:,3))];
% Rectangle Prism MOI:
% Ixx = 1/12*mass* (y^2 + z^2)
% Iyy = 1/12*mass* (z^2 + x^2)
% Izz = 1/12*mass* (y^2 + x^2)

% Right Wing and Left wing same MOI
[wingIxx, wingIyy, wingIzz] = compMOI( componentMassesAndGeom(1), componentMassesAndGeom(1,2),...
    componentMassesAndGeom(1,3), componentMassesAndGeom(1,4));

% Horizontal Stabilizer MOI
[horzStabIxx, horzStabIyy, horzStabIzz] = compMOI( componentMassesAndGeom(3), componentMassesAndGeom(3,2),...
    componentMassesAndGeom(3,3), componentMassesAndGeom(3,4));

% Vertical Stabilizer MOI
[vertStabIxx, vertStabIyy, vertStabIzz] = compMOI( componentMassesAndGeom(4), componentMassesAndGeom(4,2),...
    componentMassesAndGeom(4,3), componentMassesAndGeom(4,4));

% battery MOI
[batteryIxx, batteryIyy, batteryIzz] = compMOI( componentMassesAndGeom(5), componentMassesAndGeom(5,2),...
    componentMassesAndGeom(5,3), componentMassesAndGeom(5,4));

% Fuselage MOI
[fuselageIxx, fuselageIyy, fuselageIzz] = compMOI( componentMassesAndGeom(6), componentMassesAndGeom(6,2),...
    componentMassesAndGeom(6,3), componentMassesAndGeom(6,4));

% Motor Controller MOI
[motorContIxx, motorContIyy, motorContIzz] = compMOI( componentMassesAndGeom(7), componentMassesAndGeom(7,2),...
    componentMassesAndGeom(7,3), componentMassesAndGeom(7,4));

% Radio MOI
[radioIxx, radioIyy, radioIzz] = compMOI( componentMassesAndGeom(8), componentMassesAndGeom(8,2),...
    componentMassesAndGeom(8,3), componentMassesAndGeom(8,4));

% Servos MOI
[servosIxx, servosIyy, servosIzz] = compMOI( componentMassesAndGeom(9), componentMassesAndGeom(9,2),...
    componentMassesAndGeom(9,3), componentMassesAndGeom(9,4));

% Motor MOI
[motorIxx, motorIyy, motorIzz] = compMOI( componentMassesAndGeom(10), componentMassesAndGeom(10,2),...
    componentMassesAndGeom(10,3), componentMassesAndGeom(10,4));

% Propeller MOI
[propellerIxx, propellerIyy, propellerIzz] = compMOI( componentMassesAndGeom(11), componentMassesAndGeom(11,2),...
    componentMassesAndGeom(11,3), componentMassesAndGeom(11,4));

componentInertias = [wingIxx, wingIyy, wingIzz;...
                    wingIxx, wingIyy, wingIzz;...
                    horzStabIxx, horzStabIyy, horzStabIzz;...
                    vertStabIxx, vertStabIyy, vertStabIzz;...
                    batteryIxx, batteryIyy, batteryIzz;...
                    fuselageIxx, fuselageIyy, fuselageIzz;...
                    motorContIxx, motorContIyy, motorContIzz;...
                    radioIxx, radioIyy, radioIzz;...
                    servosIxx, servosIyy, servosIzz;...
                    motorIxx, motorIyy, motorIzz;...
                    propellerIxx, propellerIyy, propellerIzz
                    ];

x_cm = sumCompCM/ totMass;
x_B_B_cmR = x_cm; % Body cg in inch

% Compute Body J
J = zeros(3,3);
J(1,1) = sum(componentInertias(:,1)) + sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,6)-x_cm(2)).^2 + (componentMassesAndGeom(:,7)-x_cm(3)).^2));
J(2,2) = sum(componentInertias(:,2)) + sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,7)-x_cm(3)).^2 + (componentMassesAndGeom(:,5)-x_cm(1)).^2));
J(3,3) = sum(componentInertias(:,3)) + sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,5)-x_cm(1)).^2 + (componentMassesAndGeom(:,6)-x_cm(2)).^2));
J(1,2) = -sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,5)-x_cm(1)) .* (componentMassesAndGeom(:,6)-x_cm(2))));
J(1,3) = -sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,7)-x_cm(3)) .* (componentMassesAndGeom(:,5)-x_cm(1))));
J(2,3) = -sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,6)-x_cm(2)) .* (componentMassesAndGeom(:,7)-x_cm(3))));
J(2,1) = -1*J(1,2);
J(3,1) = -1*J(1,3);
J(3,2) = -1*J(2,3);

computeSurfacePos
computeAeroForces

function [Ixx, Iyy, Izz] = compMOI(mass, x_dim, y_dim, z_dim)

Ixx = 1/12*mass * (y_dim^2 + z_dim^2);
Iyy = 1/12*mass * (z_dim^2 + x_dim^2);
Izz = 1/12*mass * (y_dim^2 + x_dim^2);

end
