function [weight1, weight2,outError] = Training(weight1, weight2,learningRate, input, target)
%A batchwise function to tune the weights of the network and return the
%error
[O, a2]= feedForwardPass(weight1, weight2, input);% get the ouput and internal activations
outDelta = -(target-O); %calculate the delta term of the output layer (non-sigmoid)
weightHat = weight2(:,1:end-1);%get the weight without the bias term
backProp = (weightHat'*outDelta).*(a2.*(1-a2));% calculate the back propogation of the error
%calculate the Error Gradients for the weights
errorGradientWeight1=backProp*augment(input)';
errorGradientWeight2=outDelta*augment(a2)';
%update weights with the error
weight1 = weight1 - learningRate.*errorGradientWeight1;
weight2 = weight2 -learningRate.*errorGradientWeight2;
%calculate the error and update the array
e = outDelta.^2;
outError  = e(1,:) + e(2,:);
end

