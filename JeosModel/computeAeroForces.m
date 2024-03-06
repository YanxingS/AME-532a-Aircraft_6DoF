% This script is to use surface area geometry to compute external forces,
% e.g. lift, drag, etc., which for right now uses data from ASW-28 model
% aircraft

% Use the following data:
n_s2 = [0; 0; -1]; n_s3 = [0; 1; 0]; n_s4 = [0; 0; -1]; n_s5 = [0; 0; -1];
CL0_s2 = 0;       CL0_s3 = 0;        CL0_s4 = 0.05;     CL0_s5 = 0.05;
e_s2 = 0.8;       e_s3 = 0.8;        e_s4 = 0.9;        e_s5 = 0.9;
i_s2 = 0;         i_s3 = 0;          i_s4 = 0.05;       i_s5 = 0.05;
CD0_s2 = 0.01;    CD0_s3 = 0.01;     CD0_s4 = 0.01;     CD0_s5 = 0.01;
CDa_s2 = 1;       CDa_s3 = 1;        CDa_s4 = 1;        CDa_s5 = 1;
a0_s2 = 0;        a0_s3 = 0;         a0_s4 = 0.05;      a0_s5 = 0.05;
CM0_s2 = 0;       CM0_s3 = 0;        CM0_s4 = -0.05;    CM0_s5 = -0.05;
CMa_s2 = 0;       CMa_s3 = 0;        CMa_s4 = 0;        CMa_s5 = 0;
ro = 1.225; % kg/m^3 at surface level

%lift_s3 = ; % Lift force for surface area 3 (Vertical Stabilizer)

function [liftSurf, dragSurf] = compLiftDrag(arSurf, v_B_A_B, cSurfL0, cSurfD0, alphaLocal0,nSurf_B, eSurf,...
                                            ro, v_infSurf, surfArea, incAngleSurf, cSurfDalpha)
% Compute the lift and drag forces at the respective surface
% arSurf -> Aspect Ratio of respective surfaace
% ro -> air density (note: varies with altitude)
% v_infSurf -> total airspeed at the surface, i.e. Velocity of body w.r.t Inertial/ECEF as
% measured in body frame (|V_B_E_B|)
% v_B_A_B -> relative airspeed, where it is typically 
% v_B_E_B - c_B_N * v_A_N_N and v_A_N_N is the velocity of air mass w.r.t. NED 
% nSurf_B -> Normal force applied at surface
% eSurf -> Oswald efficiency
% alphaLocal0 -> Minimum drag Angle of Attack

cSurfLocAlpha = 2*pi * (arSurf/(2+arSurf)); % Lift coefficient at the respective surface due to the local alpha (Angle of Attack)
alphaLocal = incAngleSurf - asin(v_B_A_B*nSurf_B/norm(v_B_A_B)); % in Radians
cSurfLift = cSurfL0 + cSurfLocAlpha * alphaLocal; % Lift coefficient of surface
cSurfDrag = cSurfD0 + cSurfDalpha *(alphaLocal - alphaLocal0)^2 + (cSurfLift^2/(pi*eSurf*arSurf));

liftSurf = cSurfLift * 0.5 * ro * (v_infSurf^2)*surfArea;
dragSurf = cSurfDrag * 0.5 * ro * (v_infSurf^2)*surfArea;
end

function [momSurf] = compAeroMom(cSurfM0, chordSurf, cSurfMalpha, alphaLocal, surfArea, v_infSurf, ro)
% Compute the Moment at the respective Surface
% v_infSurf -> total airspeed at the surface, i.e. Velocity of body w.r.t Inertial/ECEF as
% measured in body frame (|V_B_E_B|)
% ro -> air density (note: varies with altitude)
% chordSurf -> Chord of the surface area
% cSurfM0 -> Initial moment coefficient of surface
% cSurfMalpha -> Moment coefficient at the respective surface due to the
% local alpha (Angle of Attack)

cSurfMom = cSurfM0 + cSurfMalpha*alphaLocal; % Moment coefficient of surface
momSurf = cSurfMom * 0.5 * ro * (v_infSurf^2)*surfArea * chordSurf;
end