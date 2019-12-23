function [table, newState] = update(state, table)
   learningRate =0.2;
   temporalDiscount =0.9;
    action = sigmaGreedy(table, state);
    [newState, reward] = transitionFunction (state,action);
    
    table(state, action)= table(state, action) + learningRate*(reward+temporalDiscount*max(table(newState,:))-max(table(state,:)));
end