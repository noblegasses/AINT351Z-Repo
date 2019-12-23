function [newState, reward] = transitionFunction(oldState, direction)
reward   = 0;
switch oldState
    case 1 
        switch direction
            case 1
                newState = 4;
            otherwise 
                newState = oldState;
        end
    case 3
        switch direction
            case 1
                newState = 6;
            otherwise
                newState = oldState;
        end
    case 4
        switch direction
            case 1 
                newState = 7;
            case 3
                newState = 1;
            otherwise
                newState = oldState;
        end
    case 5
        switch direction
            case 1
                newState = 9;
            case 3
                newState = 2;
                reward = 10;
            otherwise 
                newState = oldState;
        end
    case 6
        switch direction
            case 1
                newState = 11;
            case 3
                newState = 3;
            otherwise
                newState = oldState;
        end
    case 7
        switch direction
            case 2
                newState = 8;
            case 3
                newState = 4;
            otherwise
                newState = oldState;
        end 
    case 8 
        switch direction
            case 2
                newState = 9;
            case 4
                newState = 7;
            otherwise
                newState = oldState;
        end
    case 9
        switch direction
            case 2
                newState = 10;
            case 3
                newState = 5;
            case 4
                newState = 8;
            otherwise
                newState = oldState;
        end 
    case 10
        switch direction
            case 2
                newState = 11;
            case 4
                newState = 9;
            otherwise
                newState = oldState;
        end 
    case 11
        switch direction 
            case 3
                newState = 6;
            case 4
                newState = 10;
            otherwise
                newState = oldState;
        end
    end                   
end
  