clc
clear all
close all
samples = 1000;
mean1 = [3; -1];
mean2 = [-3;-1'];
sigma1 = [0.5 0.95; 0.95 4];
sigma2 = [0.5 0.95; 0.95 4];
[testing1, target1] = GenerateGaussianData(samples, mean1, sigma1, mean2, sigma2);
[testing2, target2] = GenerateGaussianData(samples, mean1, sigma1, mean2, sigma2);
dataSet1 = 20*rand(2,samples) -10;
figure
hold on
subplot(2,2,1)
plot(dataSet1(1,:),dataSet1(2,:), 'g*');
[weight, output, error] = Trainer(testing1, target1(1,:));
subplot(2,2,2)
plot(output, '.')
subplot(2,2,3)
plot(error, '-')
dataSetA = [dataSet1;ones(1,size(dataSet1,2))];
newoutput = weight*dataSetA;
fida = find(newoutput<0.5);
fidb = find(newoutput>=0.5);
a = dataSetA(:,fida);
b = dataSetA(:,fidb);
subplot(2,2,4)
hold on
axis equal
plot(a(1,:), a(2,:), '.')
plot(b(1,:), b(2,:), '.')
