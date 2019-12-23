clc
close all

Start = -4;
End = 6;
A = 1.6;
B = 2.5;
C = 6;
points = 100;
X = linspace(Start,End,points);
Y = A*X.^2 + B*X +C;
mod = 1 + 5.*randn(1,points);
Y = Y + mod;
figure
hold on
plot (Y)
xlabel('X')
ylabel('Y')
title("a noisy quadratic")

Xlin = [X;ones(1,points);];
Xquad= [X.*X;X;ones(1,points);];
[BEst,BINT] = regress(Y' ,Xlin');
AL = BEst(1);
BL = BEst(2);
YLP = AL * X + repmat(BL,1,samples);
hold on
plot(YLP)
hold on
[BEst,BINT] = regress(Y', Xquad');
AQ = BEst(1);
BQ = BEst(2);
CQ = BEst(3);
YQP = AQ * X .* X + BQ * X + repmat(CQ,1,points);
plot(YQP)