%% Aero Properties

% AME 532a HW 5 Problem 5: ASW-28 Aircraft Geometry
% Faheem Chunara
% USC ID: 8660882618
% February 17, 2024

%% Compile Aero Properties given in HW5 for:
%
% s2 = Horizontal Stabilizer
% s3 = Vertical Stabilizer
% s4 = Right Wing + Servo
% s5 = Left Wing + Servo

% Horizontal Stab (s2)
n_s2 = [0; 0; -1];
CL0_s2 = 0;
e_s2 = 0.8; 
i_s2 = 0;
CD0_s2 = 0.01;
CDa_s2 = 1;
a0_s2 = 0; 
CM0_s2 = 0;
CMa_s2 = 0;

% Vertical Stabilizer (s3)
n_s3 = [0; 1; 0];
CL0_s3 = 0;
e_s3 = 0.8;
i_s3 = 0;
CD0_s3 = 0.01;
CDa_s3 = 1;
a0_s3 = 0; 
CM0_s3 = 0; 
CMa_s3 = 0;

% Right Wing + Servo (s4)
n_s4 = [0; 0; -1]; 
CL0_s4 = 0.05; 
e_s4 = 0.9;
i_s4 = 0.05;
CD0_s4 = 0.01;
CDa_s4 = 1;
a0_s4 = 0.05; 
CM0_s4 = -0.05; 
CMa_s4 = 0;

% Left Wing + Servo (s5)
n_s5 = [0; 0; -1];
CL0_s5 = 0.05;
e_s5 = 0.9;
i_s5 = 0.05;
CD0_s5 = 0.01;
CDa_s5 = 1;
a0_s5 = 0.05;
CM0_s5 = -0.05;
CMa_s5 = 0;

% Calculate Lift
CL_alpha_s2 = 2*pi*(AR_s2) / (2 + AR_s2);
CL_alpha_s3 = 2*pi*(AR_s3) / (2 + AR_s3);
CL_alpha_s4 = 2*pi*(AR_s4) / (2 + AR_s4);
CL_alpha_s5 = 2*pi*(AR_s5) / (2 + AR_s5);

% concatenate aero property values to arrays for use in simulink model
CL_alpha_All = [CL_alpha_s2 CL_alpha_s3 CL_alpha_s4 CL_alpha_s5];
CL0_All = [CL0_s2 CL0_s3 CL0_s4 CL0_s5];

a0_All = [a0_s2 a0_s3 a0_s4 a0_s5];
e_All = [e_s2 e_s3 e_s4 e_s5];

CD0_All = [CD0_s2 CD0_s3 CD0_s4 CD0_s5];
CDa_All = [CDa_s2 CDa_s3 CDa_s4 CDa_s5];

CM0_All = [CM0_s2 CM0_s3 CM0_s4 CM0_s5];
CMa_All = [CMa_s2 CMa_s3 CMa_s4 CMa_s5];

nAll = [n_s2 n_s3 n_s4 n_s5];
iAll = [i_s2 i_s3 i_s4 i_s5];