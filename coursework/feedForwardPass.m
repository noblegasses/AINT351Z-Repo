function [activation,a2] = feedForwardPass(weight1, weight2, input)
input= augment(input);%augment input
net = weight1*input;
 a2 = arrayfun(@sigmoid,net);%calculate sigmoid activation for layer 1 (elementwise)
 a2Hat = augment(a2);% augment a2
activation =weight2*a2Hat;%caulculate linear output activation 
end

