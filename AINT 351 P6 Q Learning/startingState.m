function [state] = startingState()
state  = 2;
while state == 2
    state = randperm(11,1);
end
end

