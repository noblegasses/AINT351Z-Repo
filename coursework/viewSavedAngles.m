clc
close all
clear all
samples = 10000;
minX= -0.6;
minY=-0.2;
maxX=-0.2;
maxY=0.2;
load('weights.mat')
length =[0.4,0.4];
origin =[0,0];
%This will take the new weight matricies and test the data based off of the
%new testing data
randomAngles = rand([2,samples])*pi; % generate 1000 random angles from 0 to pi for each joint
[~,randomEndpoints] = RevoluteForwardKinematics2D(length,randomAngles,origin);%get the endpoint positions from the forward
a=find(randomEndpoints(1,:)<=maxX&randomEndpoints(1,:)>=minX);
randomEndpoints = randomEndpoints(:,a);
randomAngles = randomAngles(:,a);
b=find(randomEndpoints(2,:)<=maxY&randomEndpoints(2,:)>=minY);
randomEndpoints = randomEndpoints(:,b);
randomAngles = randomAngles(:,b);
[networkAngles,~] = feedForwardPass(weight1, weight2, randomEndpoints);% generate a set of joint angles
[~,networkEndpoints] = RevoluteForwardKinematics2D(length,networkAngles,origin);%generate the endpoint of the
%arm from the inverse kinematics' joint angles
figure
hold on
subplot(221)
plot(randomEndpoints(1,:),randomEndpoints(2,:),'.b')
title("1055660: Random Endpoint Data")
subplot(222)
plot(randomAngles(1,:),randomAngles(2,:),'.b')
title("1055660: Random Joint Angle Data")
subplot(223)
plot(networkEndpoints(1,:),networkEndpoints(2,:),'.r')
title("1055660: Regenerated Via Inv and FWD Model Endpoints")
subplot(224)
plot(networkAngles(1,:),networkAngles(2,:),'.r')
title("1055660: Inverse Model Joint Angle")