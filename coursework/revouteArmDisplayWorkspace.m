clc
close all
clear all
origin = [0;0]; %base frame of kinematics
length = [0.4,0.4]; % length of links
samples = rand([2,1000])*pi; % generate 1000 random angles from 0 to pi for each joint
[P1,P2] = RevoluteForwardKinematics2D(length,samples,origin); %P1 is midpoint P2 is end point
%%Plot results:
figure 
hold on
axis equal
title("1055660: Arm Endpoint")
xlabel('x[m]')
ylabel('y[m]')
plot(0,0,'*')
plot(P2(1,:),P2(2,:),'.')
legend ('Origin','Endpoint')
