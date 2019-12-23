function [output] = sigmoid(input)
%a function to calculate the sigmoid input of a single element 
output = 1/(1+exp(-input));
end
