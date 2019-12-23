function [action] = sigmaGreedy (table, state)
    chance = rand(1);
    if chance < 0.1
        action = randperm(4,1);
    else 
        [~ , action] = max(table(state, :));
    end
end