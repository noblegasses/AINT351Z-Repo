clc
close all
clear all
origin = [0;0]; %base frame of kinematics
length = [0.4,0.4]; % length of links
samples = 10000;% the number of samples used for training and testing
hidden = 5;%the number of hidden layers
input = 2;% number of system inputs 
output = 2;% number of system outputs on the final layer

minX= -0.6;
minY=-0.2;
maxX=-0.2;
maxY=0.2;

learningRate =0.0001;
iterations = 10000;%number of times the network will be trained( a total of 50,000,000 data points will be used to train it)
[weight1, weight2]=makeWeights(output,hidden, input);% generate the weight matricies
for i = 1:iterations
    %each iteration, a new set of training data will be generated. This
    %will help the network generalize as it wont be tuned to a specific
    %dataset
    if mod(i,500) ==0
        i
    end
   initialSamples = rand([2,samples])*pi; % generate 1000 random angles from 0 to pi for each joint
   targetData = initialSamples;
    [~,inputs] = RevoluteForwardKinematics2D(length,targetData,origin);%get the endpoint positions from the forward
    a=find(inputs(1,:)<=maxX&inputs(1,:)>=minX);
    inputs = inputs(:,a);
    targetData = targetData(:,a);
    b=find(inputs(2,:)<=maxY&inputs(2,:)>=minY);
    inputs = inputs(:,b);
    targetData = targetData(:,b);
    %kinematics to be used as inputs for the inverse
    [weight1, weight2,error]=Training(weight1, weight2,learningRate, inputs, targetData);%update the trained weights and output error matrix
    meanError(i)=mean(error);% append the mean of the error matrix for future plotting
end
figure
hold on
title("1055660: Mean Error")
xlabel('Trials')
ylabel('Error')
plot(meanError)
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

save('weights.mat', 'weight1','weight2');%save weights for faster implementation