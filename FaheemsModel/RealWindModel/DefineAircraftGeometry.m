%% Define Aircraft Geometry

% AME 532a HW 5 Problem 4: ASW-28 Aircraft Geometry
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

%% Horizontal Stabilizer (s2)
x_B_B_s2R = [componentMassesAndGeom(3,5) componentMassesAndGeom(3,6) componentMassesAndGeom(3,7)];
c_s2 = componentMassesAndGeom(3,2);
b_s2 = componentMassesAndGeom(3,3);
S_s2 = c_s2*b_s2;
AR_s2 = b_s2 / c_s2;

%% Vertical Stabilizer (s3)
x_B_B_s3R = [componentMassesAndGeom(4,5) componentMassesAndGeom(4,6) componentMassesAndGeom(4,7)];
c_s3 = componentMassesAndGeom(4,2);
b_s3 = componentMassesAndGeom(4,4);
S_s3 = c_s3*b_s3;
AR_s3 = b_s3 / c_s3;

%% Right Wing + Servo (s4)
x_B_B_s4R = [componentMassesAndGeom(1,5) componentMassesAndGeom(1,6) componentMassesAndGeom(1,7)];
c_s4 = componentMassesAndGeom(1,2);
b_s4 = componentMassesAndGeom(1,3);
S_s4 = c_s4*b_s4;
AR_s4 = b_s4 / c_s4;

%% Left Wing + Servo (s5)
x_B_B_s5R = [componentMassesAndGeom(2,5) componentMassesAndGeom(2,6) componentMassesAndGeom(2,7)];
c_s5 = componentMassesAndGeom(2,2);
b_s5 = componentMassesAndGeom(2,3);
S_s5 = c_s5*b_s5;
AR_s5 = b_s5 / c_s5;

S_All = [S_s2 S_s3 S_s4 S_s5];
AR_All = [AR_s2 AR_s3 AR_s4 AR_s5];
c_All = [c_s2 c_s3 c_s4 c_s5];

%% Print out results

fprintf('Horizontal Stabilizer (s2) Geometry: \n')
fprintf('Chord: %0.3f m \n',c_s2)
fprintf('Span: %0.3f m \n',b_s2)
fprintf('Planform Area: %0.3f m^2 \n',S_s2)
fprintf('Aspect Ratio %0.3f m \n \n',AR_s2)

fprintf('Vertical Stabilizer (s3) Geometry: \n')
fprintf('Chord: %0.3f m \n',c_s3)
fprintf('Span: %0.3f m \n',b_s3)
fprintf('Planform Area: %0.3f m^2 \n',S_s3)
fprintf('Aspect Ratio %0.3f m \n \n',AR_s3)

fprintf('Right Wing (s4) Geometry: \n')
fprintf('Chord: %0.3f m \n',c_s4)
fprintf('Span: %0.3f m \n',b_s4)
fprintf('Planform Area: %0.3f m^2 \n',S_s4)
fprintf('Aspect Ratio %0.3f m \n \n',AR_s4)

fprintf('Right Wing (s5) Geometry: \n')
fprintf('Chord: %0.3f m \n',c_s5)
fprintf('Span: %0.3f m \n',b_s5)
fprintf('Planform Area: %0.3f m^2 \n',S_s5)
fprintf('Aspect Ratio %0.3f m \n \n',AR_s5)