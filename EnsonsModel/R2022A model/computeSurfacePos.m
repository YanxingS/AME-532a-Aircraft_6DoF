% Script to compute /define position of each aero surface as defined by
% data
% in computeMassProps.m script

% Compute surface properties for Horizontal Stabilizer (S2)
x_horzStab_s2_B_B = [componentMassesAndGeom(3,5);...
                    componentMassesAndGeom(3,6);...
                    componentMassesAndGeom(3,7)]; % Location of horizontal stability w.r.t some rigid hard mount
c_s2 = componentMassesAndGeom(3,2); % Chord of surface Area 2 (Horizontal Stabilizer)
b_s2 = componentMassesAndGeom(3,3); % Span of surface Area 2 (Horizontal Stabilizer)
area_s2 = c_s2 * b_s2; % in inch
AR_s2 = b_s2/c_s2;

% Compute surface properties for Vertical Stabilizer (S3)
x_vertStab_s3_B_B = [componentMassesAndGeom(4,5);...
                    componentMassesAndGeom(4,6);...
                    componentMassesAndGeom(4,7)]; % Location of vertical stability w.r.t some rigid hard mount
c_s3 = componentMassesAndGeom(4,2); % Chord of surface Area 3 (Vertical Stabilizer
b_s3 = componentMassesAndGeom(4,4); % Span of surface Area 3 (Vertical Stabilizer
area_s3 = c_s3 * b_s3; % in inch
AR_s3 = b_s3/c_s3;

% Compute surface properties for Right Wing and Servo (S4)
x_rightWingAndServo_s4_B_B = [componentMassesAndGeom(1,5);...
                    componentMassesAndGeom(1,6);...
                    componentMassesAndGeom(1,7)]; % Location of Right Wing and Servo w.r.t rigid hard mount
c_s4 = componentMassesAndGeom(1,2); % Chord of surface Area 4 (Right Wing and Servo)
b_s4 = componentMassesAndGeom(1,3); % Span of surface Area 4 (Right Wing and Servo)
area_s4 = c_s4 * b_s4; % in inch
AR_s4 = b_s4/c_s4;

% Compute surface properties for Left Wing and Servo (S5)
x_leftWingAndServo_s5_B_B = [componentMassesAndGeom(2,5);...
                    componentMassesAndGeom(2,6);...
                    componentMassesAndGeom(2,7)]; % Location of Left Wing and Servo w.r.t rigid hard mount
c_s5 = componentMassesAndGeom(2,2); % Chord of surface Area 5 (Left Wing and Servo)
b_s5 = componentMassesAndGeom(2,3); % Span of surface Area 5 (Left Wing and Servo)
area_s5 = c_s5 * b_s5; % in inch
AR_s5 = b_s5/c_s5;
