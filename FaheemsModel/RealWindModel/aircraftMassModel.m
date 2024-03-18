%% Aircraft Mass Model

% AME 532a HW 5 Problem 3: ASW-28 Mass Model
% Faheem Chunara
% USC ID: 8660882618
% February 17, 2024

componentMassesAndGeom = ...
 [90 0.1 0.96 0.01 -0.23 0.44 0; % RightWing+Servo (s4)
 90 0.1 0.96 0.01 -0.23 -0.44 0; % LeftWing+Servo (s5)
 13 0.075 0.35 0.002 -0.76 0 -0.16; % Hor. Stab. (s2)
 0 0.08 0.002 0.18 -0.76 0 -0.09; % Vert. Stab. (s3)
 72 0.065 0.035 0.015 -0.05 0 0.03; % Battery
 106 0.87 0.07 0.07 -0.4 0 0; % Fuselage
 27 0.05 0.03 0.005 -0.05 0 0.02; % Motor Controller
 10 0.04 0.02 0.005 -0.1 0 0.02; % Radio
 20 0.05 0.01 0.01 -0.014 0 0; % 2 Servos
 40 0.03 0.02 0.02 0.02 0 0.01; % Motor
 12 0 0.26 0.025 0.05 0 0.01]; % Propeller

% Total aircraft mass (grams)
aircraftMass = sum(componentMassesAndGeom(:,1));

%% Mass of each component (grams)
m_rightWingandServo = componentMassesAndGeom(1,1);
m_leftWingandServo = componentMassesAndGeom(2,1);
m_horStab = componentMassesAndGeom(3,1);
m_vertStab = componentMassesAndGeom(4,1);
m_battery = componentMassesAndGeom(5,1);
m_fuselage = componentMassesAndGeom(6,1);
m_motorController = componentMassesAndGeom(7,1);
m_radio = componentMassesAndGeom(8,1);
m_servos = componentMassesAndGeom(9,1);
m_motor = componentMassesAndGeom(10,1);
m_propeller = componentMassesAndGeom(11,1);

%% All component sizes
rightWingandServo_x = componentMassesAndGeom(1,2);
rightWingandServo_y = componentMassesAndGeom(1,3);
rightWingandServo_z = componentMassesAndGeom(1,4);

leftWingandServo_x = componentMassesAndGeom(2,2);
leftWingandServo_y = componentMassesAndGeom(2,3);
leftWingandServo_z = componentMassesAndGeom(2,4);

horStab_x = componentMassesAndGeom(3,2);
horStab_y = componentMassesAndGeom(3,3);
horStab_z = componentMassesAndGeom(3,4);

vertStab_x = componentMassesAndGeom(4,2);
vertStab_y = componentMassesAndGeom(4,3);
vertStab_z = componentMassesAndGeom(4,4);

battery_x = componentMassesAndGeom(5,2);
battery_y = componentMassesAndGeom(5,3);
battery_z = componentMassesAndGeom(5,4);

fuselage_x = componentMassesAndGeom(6,2);
fuselage_y = componentMassesAndGeom(6,3);
fuselage_z = componentMassesAndGeom(6,4);

motorController_x = componentMassesAndGeom(7,2);
motorController_y = componentMassesAndGeom(7,3);
motorController_z = componentMassesAndGeom(7,4);

radio_x = componentMassesAndGeom(8,2);
radio_y = componentMassesAndGeom(8,3);
radio_z = componentMassesAndGeom(8,4);

servos_x = componentMassesAndGeom(9,2);
servos_y = componentMassesAndGeom(9,3);
servos_z = componentMassesAndGeom(9,4);

motor_x = componentMassesAndGeom(10,2);
motor_y = componentMassesAndGeom(10,3);
motor_z = componentMassesAndGeom(10,4);

propeller_x = componentMassesAndGeom(10,2);
propeller_y = componentMassesAndGeom(10,3);
propeller_z = componentMassesAndGeom(10,4);

%% chords
c_s2 = componentMassesAndGeom(3,2);
c_s3 = componentMassesAndGeom(4,2);
c_s4 = componentMassesAndGeom(1,2);
c_s5 = componentMassesAndGeom(2,2);

%% All component locations relative to CG
rightWingandServo_xLoc = componentMassesAndGeom(1,5);
rightWingandServo_yLoc = componentMassesAndGeom(1,6);
rightWingandServo_zLoc = componentMassesAndGeom(1,7);

x_rightWingandServo_B_B = [rightWingandServo_xLoc+0.25*c_s4 rightWingandServo_yLoc rightWingandServo_zLoc];

leftWingandServo_xLoc = componentMassesAndGeom(2,5);
leftWingandServo_yLoc = componentMassesAndGeom(2,6);
leftWingandServo_zLoc = componentMassesAndGeom(2,7);

x_leftWingandServo_B_B = [leftWingandServo_xLoc+0.25*c_s5 leftWingandServo_yLoc leftWingandServo_zLoc];

horStab_xLoc = componentMassesAndGeom(3,5);
horStab_yLoc = componentMassesAndGeom(3,6);
horStab_zLoc = componentMassesAndGeom(3,7);

x_horStab_B_B = [horStab_xLoc+0.25*c_s2 horStab_yLoc horStab_zLoc];

vertStab_xLoc = componentMassesAndGeom(4,5);
vertStab_yLoc = componentMassesAndGeom(4,6);
vertStab_zLoc = componentMassesAndGeom(4,7);

x_vertStab_B_B = [vertStab_xLoc+0.25*c_s3 vertStab_yLoc vertStab_zLoc];

battery_xLoc = componentMassesAndGeom(5,5);
battery_yLoc = componentMassesAndGeom(5,6);
battery_zLoc = componentMassesAndGeom(5,7);

fuselage_xLoc = componentMassesAndGeom(6,5);
fuselage_yLoc = componentMassesAndGeom(6,6);
fuselage_zLoc = componentMassesAndGeom(6,7);

motorController_xLoc = componentMassesAndGeom(7,5);
motorController_yLoc = componentMassesAndGeom(7,6);
motorController_zLoc = componentMassesAndGeom(7,7);

radio_xLoc = componentMassesAndGeom(8,5);
radio_yLoc = componentMassesAndGeom(8,6);
radio_zLoc = componentMassesAndGeom(8,7);

servos_xLoc = componentMassesAndGeom(9,5);
servos_yLoc = componentMassesAndGeom(9,6);
servos_zLoc = componentMassesAndGeom(9,7);

motor_xLoc = componentMassesAndGeom(10,5);
motor_yLoc = componentMassesAndGeom(10,6);
motor_zLoc = componentMassesAndGeom(10,7);

propeller_xLoc = componentMassesAndGeom(10,5);
propeller_yLoc = componentMassesAndGeom(10,6);
propeller_zLoc = componentMassesAndGeom(10,7);

%% Calculate center of gravity (x_B_B_cmR)

x_B_B_cmR = (m_rightWingandServo*rightWingandServo_xLoc + ...
    m_leftWingandServo*leftWingandServo_xLoc + ...
    m_horStab*horStab_xLoc + ...
    m_vertStab*vertStab_xLoc + ...
    m_battery*battery_xLoc + ...
    m_fuselage*fuselage_xLoc + ...
    m_motorController*motorController_xLoc + ...
    m_radio*radio_xLoc + ...
    m_servos*servos_xLoc + ...
    m_motor*motor_xLoc + ...
    m_propeller*propeller_xLoc) / ...
    aircraftMass;

y_B_B_cmR = (m_rightWingandServo*rightWingandServo_yLoc + ...
    m_leftWingandServo*leftWingandServo_yLoc + ...
    m_horStab*horStab_yLoc + ...
    m_vertStab*vertStab_yLoc + ...
    m_battery*battery_yLoc + ...
    m_fuselage*fuselage_yLoc + ...
    m_motorController*motorController_yLoc + ...
    m_radio*radio_yLoc + ...
    m_servos*servos_yLoc + ...
    m_motor*motor_yLoc + ...
    m_propeller*propeller_yLoc) / ...
    aircraftMass;

z_B_B_cmR = (m_rightWingandServo*rightWingandServo_zLoc + ...
    m_leftWingandServo*leftWingandServo_zLoc + ...
    m_horStab*horStab_zLoc + ...
    m_vertStab*vertStab_zLoc + ...
    m_battery*battery_zLoc + ...
    m_fuselage*fuselage_zLoc + ...
    m_motorController*motorController_zLoc + ...
    m_radio*radio_zLoc + ...
    m_servos*servos_zLoc + ...
    m_motor*motor_zLoc + ...
    m_propeller*propeller_zLoc) / ...
    aircraftMass;

CG = [x_B_B_cmR y_B_B_cmR z_B_B_cmR];

%% Inertia matrix

% RightWingandServo
Jxx_rightwingandservo = (1/12)*m_rightWingandServo*(rightWingandServo_y^2 + rightWingandServo_z^2);
Jyy_rightwingandservo = (1/12)*m_rightWingandServo*(rightWingandServo_x^2 + rightWingandServo_z^2);
Jzz_rightwingandservo = (1/12)*m_rightWingandServo*(rightWingandServo_x^2 + rightWingandServo_y^2);

% LeftWingandServo
Jxx_leftwingandservo = (1/12)*m_leftWingandServo*(leftWingandServo_y^2 + leftWingandServo_z^2);
Jyy_leftwingandservo = (1/12)*m_leftWingandServo*(leftWingandServo_x^2 + leftWingandServo_z^2);
Jzz_leftwingandservo = (1/12)*m_leftWingandServo*(leftWingandServo_x^2 + leftWingandServo_y^2);

% Horizontal Stabilizer
Jxx_horStab = (1/12)*m_horStab*(horStab_y^2 + horStab_z^2);
Jyy_horStab = (1/12)*m_horStab*(horStab_x^2 + horStab_z^2);
Jzz_horStab = (1/12)*m_horStab*(horStab_x^2 + horStab_y^2);

% Vertical Stabilizer
Jxx_vertStab = (1/12)*m_vertStab*(vertStab_y^2 + vertStab_z^2);
Jyy_vertStab = (1/12)*m_vertStab*(vertStab_x^2 + vertStab_z^2);
Jzz_vertStab = (1/12)*m_vertStab*(vertStab_x^2 + vertStab_y^2);

% Battery
Jxx_battery = (1/12)*m_battery*(battery_y^2 + battery_z^2);
Jyy_battery = (1/12)*m_battery*(battery_x^2 + battery_z^2);
Jzz_battery = (1/12)*m_battery*(battery_x^2 + battery_y^2);

% Fuselage
Jxx_fuselage = (1/12)*m_fuselage*(fuselage_y^2 + fuselage_z^2);
Jyy_fuselage = (1/12)*m_battery*(fuselage_x^2 + fuselage_z^2);
Jzz_fuselage = (1/12)*m_battery*(fuselage_x^2 + fuselage_y^2);

% motorController
Jxx_motorController = (1/12)*m_motorController*(motorController_y^2 + motorController_z^2);
Jyy_motorController = (1/12)*m_motorController*(motorController_x^2 + motorController_z^2);
Jzz_motorController = (1/12)*m_motorController*(motorController_x^2 + motorController_y^2);

% radio
Jxx_radio = (1/12)*m_radio*(radio_y^2 + radio_z^2);
Jyy_radio = (1/12)*m_radio*(radio_x^2 + radio_z^2);
Jzz_radio = (1/12)*m_radio*(radio_x^2 + radio_y^2);

% servos
Jxx_servos = (1/12)*m_servos*(servos_y^2 + servos_z^2);
Jyy_servos = (1/12)*m_servos*(servos_x^2 + servos_z^2);
Jzz_servos = (1/12)*m_servos*(servos_x^2 + servos_y^2);

% motor
Jxx_motor = (1/12)*m_motor*(motor_y^2 + motor_z^2);
Jyy_motor = (1/12)*m_motor*(motor_x^2 + motor_z^2);
Jzz_motor = (1/12)*m_motor*(motor_x^2 + motor_y^2);

% propeller
Jxx_propeller = (1/12)*m_propeller*(propeller_y^2 + propeller_z^2);
Jyy_propeller = (1/12)*m_propeller*(propeller_x^2 + propeller_z^2);
Jzz_propeller = (1/12)*m_propeller*(propeller_x^2 + propeller_y^2);

componentInertias_Ixx = Jxx_rightwingandservo + Jxx_leftwingandservo + Jxx_horStab + Jxx_vertStab + Jxx_battery + Jxx_fuselage + Jxx_motorController + Jxx_radio + Jxx_servos + Jxx_motor + Jxx_propeller;
componentInertias_Iyy = Jyy_rightwingandservo + Jyy_leftwingandservo + Jyy_horStab + Jyy_vertStab + Jyy_battery + Jyy_fuselage + Jyy_motorController + Jyy_radio + Jyy_servos + Jyy_motor + Jyy_propeller;
componentInertias_Izz = Jzz_rightwingandservo + Jzz_leftwingandservo + Jzz_horStab + Jzz_vertStab + Jzz_battery + Jzz_fuselage + Jzz_motorController + Jzz_radio + Jzz_servos + Jzz_motor + Jzz_propeller;

% Inertia Matrix for aircraft
Jxx = componentInertias_Ixx + sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,6)-y_B_B_cmR).^2 + (componentMassesAndGeom(:,7)-z_B_B_cmR).^2));
Jyy = componentInertias_Iyy + sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,7)-z_B_B_cmR).^2 + (componentMassesAndGeom(:,5)-x_B_B_cmR).^2));
Jzz = componentInertias_Izz + sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,5)-x_B_B_cmR).^2 + (componentMassesAndGeom(:,6)-y_B_B_cmR).^2));
Jxy = -sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,5)-x_B_B_cmR) .* (componentMassesAndGeom(:,6)-y_B_B_cmR)));
Jxz = -sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,7)-z_B_B_cmR) .* (componentMassesAndGeom(:,5)-x_B_B_cmR)));
Jyz = -sum(componentMassesAndGeom(:,1) .* ((componentMassesAndGeom(:,6)-y_B_B_cmR) .* (componentMassesAndGeom(:,7)-z_B_B_cmR)));
Jzx = Jxz;
Jzy = Jyz;
Jyx = Jxy;

J = [Jxx Jxy Jxz; Jyx Jyy Jyz; Jzx Jzy Jzz];

J(1,2) = -J(1,2);
J(1,3) = -J(1,3);
J(2,3) = -J(2,3);
J(2,1) = J(1,2);
J(3,1) = J(1,3);
J(3,2) = J(2,3);

J = [Jxx J(1,2) J(1,3); J(2,1) Jyy J(2,3); J(3,1) J(3,2) Jzz  ]
%% Print out results

% Total aircraft mass (grams)
fprintf('Total Aircraft Mass (grams): \n')
aircraftMass = sum(componentMassesAndGeom(:,1))

% Center of gravity
fprintf('Aircraft Center of Gravity relative to Nose (meters): \n')
CG = [x_B_B_cmR y_B_B_cmR z_B_B_cmR]

% Moment of inertia
fprintf('Aircraft Moment of Inertia (g*m^2): \n')
J = [Jxx Jxy Jxz; Jyx Jyy Jyz; Jzx Jzy Jzz]