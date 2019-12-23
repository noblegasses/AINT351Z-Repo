clc 
close all
trainingSample = 10000;
Mean1 = [3; -1;];
Sigma1 = [0.5 .9; .9 10];
Mean2  = [-3; -1;]; 
Sigma2 = [0.5 .9; .9 12];

[trainingData, trainingTarget] = GenerateGaussianData(trainingSample , Mean1, Sigma1, Mean2, Sigma2);

testingSample = 10000;
[testingData, testingTarget] = GenerateGaussianData(testingSample , Mean1, Sigma1, Mean2, Sigma2);
fidx = find(trainingTarget(1,:) == 1);
c1data = trainingData(:,fidx);
fidx = find(testingTarget(1,:) == 0);
c2data = testingData(:,fidx);
figure 
hold on 
plot(c1data(1,:), c1data(2,:), 'b.');
plot(c2data(1,:), c2data(2,:), 'r+');
c1mean= mean(c1data');
c2mean= mean(c2data');
c1var1 = var(c1data(1,:));
c2var1 = var(c2data(1,:));
c1var2 = var(c1data(2,:));
c2var2 = var(c2data(2,:));
c1covar = [c1var1, 0; 0, c1var2]
c2covar = [c2var1,0; 0, c2var2]


trainingSample = 10000;

[trainData, trainTarget] = GenerateGaussianData(trainingSample , c1mean', c1covar, c2mean', c2covar);

testingSample = 10000;
[testData, testTarget] = GenerateGaussianData(trainingSample , c1mean', c1covar, c2mean', c2covar);
fidx = find(trainTarget(1,:) == 1);
c1data = trainData(:,fidx);
fidx = find(testTarget(1,:) == 0);
c2data = testData(:,fidx);
figure 
axis equal
hold on 
plot(c1data(1,:), c1data(2,:), 'b.');
plot(c2data(1,:), c2data(2,:), 'r+');
[class1, class2] = NaiveBayesClassifier(testingData,c1mean, c2mean, c1var1, c1var2, c2var1,c2var2);
figure
axis equal
hold on 
plot(class1(1,:),class1(2,:), 'b.')
plot(class2(1,:),class2(2,:), 'r+')