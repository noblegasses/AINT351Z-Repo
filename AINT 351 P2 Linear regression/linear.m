clc
close all

Start = -4;
End = 6;
m = 1.6;
c = 6;
samples = 100;
mod = randn(1,samples);
X = linspace(-4,6, samples);
Y = m*X + c;
Y = Y+mod;
[yInit, yFinal, error] = gradientDescent(X,Y);
size(yInit)
figure 
subplot(1,2,1)
plot(Y,'o-b')
hold on
plot (yInit,'-r')
hold on
plot (yfinal,'-g')
xlabel('x')
ylabel('y')
title("A Regressed Noisy Line")
subplot(1,2,2)
plot(error,'*-m')
xlabel("itteration")
ylabel("error")
title("decrease in error over time")
