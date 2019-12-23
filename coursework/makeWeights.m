function [weight1, weight2] = makeWeights(outputs, hidden, inputs)
%make the weight1 matrix where it is size (inputs+bias)X#ofHiddenLayers
%%inputs is the X and Y coordinates of the endpoint, the final output is
%%the angles of joints (inverse kinematics)
weight1=(2*rand(hidden,inputs+1))-1;
%make the weight2 matrix where it is size(#ofHiddenLayers+bias)XOutputs
weight2=(2*rand(outputs,hidden+1))-1;
end

