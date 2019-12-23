clc
close all
clear all
origin = [0;0]; %base frame of kinematics
length = [0.4,0.4]; % length of links
samples = 1000;
data = rand([2,1000])*pi; % generate 1000 random angles from 0 to pi for each joint
[P1,P2] = RevoluteForwardKinematics2D(length,data,origin); %P1 is midpoint P2 is end point
figure 
hold on
axis equal
title("1055660: Arm Configuration")
xlabel('x[m]')
ylabel('y[m]')
for i = 1:samples
    x = [0,P1(1,i),P2(1,i)];
    y =[0,P1(2,i),P2(2,i)];
    plot(x,y,'-ob')
end