function [counts, states,table]= run(table)
            for i = 1:100
                   state = startingState();
                    [table, count] = training(state,table);
                    counts(i) = count;
                    states(i) = startingState();
            end
end