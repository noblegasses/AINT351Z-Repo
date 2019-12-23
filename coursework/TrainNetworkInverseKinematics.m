clc
close all
clear all
origin = [0;0]; %base frame of kinematics
length = [0.4,0.4]; % length of links
samples = 1000;% the number of samples used for training and testing
data = rand([2,1000])*pi; % generate 1000 random angles from 0 to pi for each joint
[P1,P2] = RevoluteForwardKinematics2D(length,data,origin); %P1 is midpoint P2 is end point
hidden = 10;%the number of hidden layers
input = 2;% number of system inputs 
output = 2;% number of system outputs on the final layer
[weight1, weight2]=makeWeights(output,hidden, input);% generate the weight matricies
learningRate =0.01;
iterations = 1000;%number of times the network will be trained
for i = 1:iterations 
    %each iteration, a new set of training data will be generated. This
    %will help the network generalize as it wont be tuned to a specific
    %dataset
    targetData = rand([2,1000])*pi; % generate 1000 random angles from 0 to pi for each joint
    [~,inputs] = RevoluteForwardKinematics2D(length,targetData,origin);%get the endpoint positions from the forward 
    %kinematics to be used as inputs for the inverse
    [weight1, weight2,error]=Training(weight1, weight2,learningRate, targetData, samples, inputs);%update the trained weights and output error matrix
    meanError(i)=mean(error);% append the mean of the error matrix for future plotting
end
figure 
hold on
title("1055660: Mean Error")
xlabel('Error')
ylabel('Trials')
plot(meanError)