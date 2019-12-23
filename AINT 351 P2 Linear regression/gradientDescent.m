function [yInit, yfinal, error]= gradientDescent(x,y)
M= randn(1);
mInit = M;
C = randn (1);
cInit = C;
cycles=100;
learningRate = 0.00001;
yInit = mInit*x + cInit;
for iter = 1:cycles
    mGrad = -2 * sum(x.*(y-(M*x+C)));
    cGrad = -2 * sum(y-(M*x+C));
    M= M- learningRate * mGrad;
    C = C - learningRate * cGrad; 
    error(iter) = sum((y-(M*x+C)).^2);
end
yfinal = M*x + C;
end