function [output] = augment (input)
%a function to append a row of ones to a matrix
[~,columns] = size(input);% get the number of columns of the matrix
output = [input;ones(1,columns)];%append a row of ones with an equal number of columns
end