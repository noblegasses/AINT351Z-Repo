close all
clear all
clc

% scaled maze to the best trained area of the kinematics
minX= -0.6;
minY=-0.2;
maxX=-0.2;
maxY=0.2;
limits = [minX maxX; minY maxY;];

% build the maze
maze = CMazeMaze10x10(limits);

% draw the maze
maze.DrawMaze();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load the q-table
maze = maze.loadQvalues();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% build the transition matrix
maze = maze.BuildTransitionMatrix();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load weights from file
load('weights.mat')
%reset reward, state and step number
origin = [0;0]; %base frame of kinematics
length = [0.4,0.4]; % length of links
step =0;
reward = 0;
i=0;
coords=[];
state =1;
%implement the preivous code with a exploration rate of 0
%and no training. Keep notes of the XY coordinates of the given states
while reward == 0
            i=i+1;
            states(i) = state;% save the old state 
            action =actionSelect(maze.QValues,state,0);%implement the epsilon Greedy with 0 exploration rate
            state = maze.tm(state,action);% get the new state from the transition table
            reward = maze.RewardFunction(states(i),action);%check if the algorithm gives a reward
            [x,y]=maze.stateToCoords(states(i));
            coords=[coords,[x;y]];
end
coords = [coords,[10;10]];% since the code doesn't record the end state, tack it on the end 
coords = (coords-0.5);%scale the coordinates and make them look a little nicer 
coords(1,:)=(coords(1,:)*((maxX-minX)/10))-(abs(minX));
coords(2,:)=(coords(2,:)*((maxY-minY)/10))-(abs(minY));
[angles,~]= feedForwardPass(weight1,weight2, coords);
[P1,P2] = RevoluteForwardKinematics2D(length,angles,origin);

v = VideoWriter('armEndpoint.avi');
v.FrameRate=10;
open(v);
for j = 1:i
    maze.DrawMaze();
    set(gca,"color",'k')
    xlim([minX maxX+0.2])
    ylim([minY maxY])
    hold on
    x = [origin(1),P1(1,j),P2(1,j)];
    y =[origin(2),P1(2,j),P2(2,j)];
    %axis ([minX maxX+0.2 minY maxY])
    plot(coords(1,:),coords(2,:), 'mx-', 'linewidth',5)
    plot(x,y,'-or','linewidth',2)
    %xlim([minX maxX+0.2])
    %ylim([minY maxY])
    writeVideo(v,getframe(gca));
    close(gcf)
end
close(v)
  %%%%%%%%%%%%%%%%%%%%%%%%%Functions%%%%%%%%%%%%%%%%%%%%%%%%

function [action] = actionSelect (table, state,explorationRate)
    chance = rand(1);%chance to explore
    if chance < explorationRate%if exploring
        action = randperm(4,1);%give an action in whole numbers between 1 and 4
    else %if not exploring 
        [~ , action] = max(table(state, :));%your action is the Highest Q value per the given state
    end
end