% trimming model
clc; clear;

ic = [0 0 0 13 0 0 0 0 0];

states = ['phi' 'theta' 'psi' 'Vx' 'Vy' 'Vz' 'p' 'q' 'r'];



[trimmed] = trim("ame532Project1_onedrive",ic,0,0);
