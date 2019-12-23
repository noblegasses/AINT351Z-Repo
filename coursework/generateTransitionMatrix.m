clc
clear all
close all
%% a script to generate a transition matrix autmatically and save it to a file for faster load times
blockedLocations = [4 1; 6 2; 8 2; 9 2; 1 3; 3 3; 4 3; 8 3; 9 3; 1 4; 4 4; 5 4; 1 5; 4 5; 5 5; 6 5; 7 5; 10 5; 1 6; 4 6; 6 6; 7 6; 10 6;...
                4 7; 8 7; 2 8; 3 8; 4 8; 6 8; 8 8; 9 8; 2 9; 3 9; 4 9; 6 9; 9 9; 6 10;];% a list of blocked locations to correctly transition
states = 100;
actions= 4;
transitionMatrix = zeros(states,actions);%initalize an empty matrix to be filled
[bx,~]=size(blockedLocations);%get the number of blocked locations
%a list of action numbers and their directions:
%1 = north(up) ^
%2= east(right) >
%3= south(down) v
%4= west(left) <
for a = 1:actions
    for s = 1:states%for each state and action
        [x,y] = stateToCoords(s);%get the coordinates of the states
        switch a% update next state based off the aforementioned directions
            case 1
                nextX=x;
                nextY=y+1;
            case 2
                nextX=1+x;
                nextY=y;
            case 3
                nextX=x;
                nextY=y-1;
            case 4
                nextX=x-1;
                nextY=y;
        end
        for b = 1:bx%for each blocked location
            if (nextX>10 ||nextX<1||nextY>10||nextY<1||((nextX==blockedLocations(b,1))&&(nextY==blockedLocations(b,2))))
                %if move exceeds bounds, or would enter a blocked state,
                %return the original state
                nextX=x;
                nextY=y;
            end
        end
        transitionMatrix(s,a)=coordsToState(nextX,nextY); %store the state value of the next state in the matrix
    end
end

save('transitionMatrix.mat', 'transitionMatrix');%save the matrix to file for a direct import into the main code

%%%%%%%%%%%%functions below%%%%%%%%%%%%%%%
%function to give the coordinates of a given state
function [x,y] = stateToCoords(state)
    state = state-1;%start arrays from 0
    x = mod(state,10)+1; %get the remainder from dividing by 0
    y = fix(state/10)+1;% divide by 0 without remainder

end
%function to give the state from the given coordinates
function state = coordsToState(x,y)
    state = ((y-1)*10)+x;
end
