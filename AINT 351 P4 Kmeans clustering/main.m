clc
close all
sample1=10000;
sample2=10000;
mean1 =[-4; -1];
mean2 =[3; 4];
sigma1 =0.75; 
sigma2 =2.0;
[testing1, target1] = GenerateGaussianData(sample1, mean1, sigma1, mean2, sigma2);
[testing2, target2] = GenerateGaussianData(sample2, mean1, sigma1, mean2, sigma2);
fidx = find(target1(1,:) == 1);
c1data = testing1(:,fidx);
fidx = find(target2(1,:) == 0);
c2data = testing2(:,fidx);
figure 
hold on 
plot(c1data(1,:), c1data(2,:), 'b.');
plot(c2data(1,:), c2data(2,:), 'r+');
declustered = [c1data c2data];
figure 
hold on 
plot(declustered(1,:), declustered(2,:), 'b.');
clustered = KMeansAlgorithm(declustered, 2);