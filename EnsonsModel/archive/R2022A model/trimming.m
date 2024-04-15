clc; clear; close all

% trimming aircraft model

Rotkin1 = [0 0 0]; % euler kin
Rotkin2 = [0 0 0 0 0 0 0 0 0]; %strap down 
Rotkin3_quat = [1 0 0 0]; %quat kin
position = [6371800 0 0];% position
unused_position = [6371800 0 0];%unused
w = [0 0 0];%body rate
v = [13 0 0];%velocity

x = [Rotkin1 Rotkin2 Rotkin3_quat position unused_position w v];

ix = [];
iu = [];
iy = [];
u = [];
y = [];

[x,u,y] = trim('ame532Project1_onedrive',x,u,y,ix,iu,iy)