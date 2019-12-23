clc
close all
M = oneByN(1000000);
size(M)
figure
subplot(1,2,1)
hold on
plot(M,'.')
xlabel("point")
ylabel("value")
title("Random Values Plotted")
subplot(1,2,2)
hold on
histogram(M,1000)
xlabel("value")
ylabel("frequency")
title("Histogram of Values")

figure
subplot(1,2,1)
hold on
N = nByN(5000);
N = mean(N);
plot(N,'.')
xlabel("point")
ylabel("value")
title("Mean Values Plotted")
subplot(1,2,2)
hold on
histogram(N,100)
xlabel("value")
ylabel("frequency")
title("Histogram of Mean Values")

figure
subplot(1,2,1)
hold on
O = oneByRandn(5000);
plot(O,'.')
xlabel("point")
ylabel("value")
title("Normal Distribution Values Plotted")
subplot(1,2,2)
hold on
histogram(O,100)
xlabel("value")
ylabel("frequency")
title("Histogram of randn Values")

figure
hold on
P = twoByRandn(1000000);

cov(P')
plot(P(1,:),P(2,:),'.')
axis equal
xlabel("plot 1")
ylabel("plot 2")
title("normal distribution against itself")




