clc
clear all
blockedLocations = [4 1; 6 2; 8 2; 9 2; 1 3; 3 3; 4 3; 8 3; 9 3; 1 4; 4 4; 5 4; 1 5; 4 5; 5 5; 6 5; 7 5; 10 5; 1 6; 4 6; 6 6; 7 6; 10 6; 4 7; 8 7; 2 8; 3 8; 4 8; 6 8; 8 8; 9 8; 2 9; 3 9; 4 9; 6 9; 9 9; 6 10;];
state = [1,4]; 

startingState = fix(rand*99);% generate a number from 1-99(leaving out starting state
[x,y] = f.stateToCoords(startingState);% convert your state into a set of coordinates
[~,rows] =size(f.blockedLocations); % get the number of rows of the blockedLocation matrix
for i = 1:rows+1%iterate through each row of blockedLocation
    if f.blockedLocations(i,:) == [x,y]%if any rows are equal to our X,Y coordinates
        
        startingState = f.RandomStatingState();% then recursively call this function starting state isn't blocked
        break
    end
end