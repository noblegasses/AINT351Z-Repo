%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all rights reserved
% Author: Dr. Ian Howard
% Associate Professor (Senior Lecturer) in Computational Neuroscience
% Centre for Robotics and Neural Systems
% Plymouth University
% A324 Portland Square
% PL4 8AA
% Plymouth, Devon, UK
% howardlab.com
% 22/09/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% run maze experiments
% you need to expand this script to run the assignment

close all
clear all
clc

% YOU NEED TO DEFINE THESE VALUES
limits = [0 10; 0 10;];

% build the maze
maze = CMazeMaze10x10(limits);

% draw the maze
maze.DrawMaze();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% init the q-table
maze = maze.InitQTable();



% test values
state = 1;
action = 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this will be used by Q-learning as follows:
q = maze.QValues(state, action);   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOU NEED TO FINISH OFF THIS FUNCTION
% get the reward from the action on the surrent state
% this will be used by Q-learning as follows:
reward = maze.RewardFunction(state, action);

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% build the transition matrix
maze = maze.BuildTransitionMatrix();
% print out values
maze.tm

% get the next state due to that action
% this will be used by Q-learning as follows:
resultingState = maze.tm(state, action);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test random start
    startingIterations=1000;
    for i = 1:startingIterations
     histo(i) = maze.RandomStartingState();% add 1000 starting states to a list
    end
%     figure
%     hold on
%     histogram(histo,[1:99])%plot the states in a histogram with whole number edges
%     title("10556660: Histogram of Starting States")
%%%%%%%%%%%%%%%%%%%%%Implemented QLearning Algorithm%%%%%%%%%%%%%%%%    
    trials = 1;% number of trials for this experiment 
    episodes =10000;%number of episodes per trial
    explorationRate=0.1;% the rate at which the algorithm takes a random action
    temporalDiscount = 0.9; 
    learningRate = 0.2;
    totals=zeros(episodes);
    stepscat=[];
    for i=1:trials
        maze = maze.InitQTable();%each trial init a clean random Q table
        for j = 1:episodes
            step = 0;% reset the number of steps and reward values for this episode
            reward = 0;
            state = maze.RandomStartingState();
            while reward == 0
            oldState = state;% save the old state
            step = step +1;% increment the number of steps take 
            action =actionSelect(maze.QValues,state,explorationRate);%generate the action the algorithm will take
            %using epsilon greedy
            state = maze.tm(state,action);% get the new state from the transition table
            reward = maze.RewardFunction(oldState,action);%check if the algorithm gives a reward
            maze.QValues(oldState, action)= maze.QValues(oldState, action) + learningRate...
                *(reward+temporalDiscount*max(maze.QValues(state,:))-max(maze.QValues(oldState,:)));
            %update your Qtable for the states and actions
            end
            steps(j) = step;% add the number of steps to a total for this trial
        end
        stepscat =[stepscat;steps];%concatenate each step count per trial
    end
    for i =1:episodes
        means(i)=mean(stepscat(:,i));%take the mean for all step i per episode
        STDeviations(i)=std(stepscat(:,i));%take the standard deviation for all step i per episode
    end
    %Graph your means and standard deviations
%     figure
%     hold on
%     errorbar(means, STDeviations)
%     title("10556660: Q-Learning in Operation Across Multiple Trials")

%%%%%%%%%%%%%%%No Explore run%%%%%%%%%%%%%%%%%%%%%%%%%%
%reset reward, state and step number
reward = 0;
i=0;
coords=[];
state =1;
%implement the preivous code with a exploration rate of 0
%and no training. Keep notes of the XY coordinates of the given states
while reward == 0
            i=i+1;
            states(i) = state;% save the old state
            step = step +1;% increment the number of steps take 
            action =actionSelect(maze.QValues,state,0);%implement the epsilon Greedy with 0 exploration rate
            state = maze.tm(state,action);% get the new state from the transition table
            reward = maze.RewardFunction(states(i),action);%check if the algorithm gives a reward
            [x,y]=maze.stateToCoords(states(i));
            coords=[coords,[x;y]];
end
coords = [coords,[10;10]];% since the code doesn't record the end state, tack it on the end 
coords = (coords-.5);%scale the coordinates and make them look a little nicer 
plot(coords(1,:),coords(2,:), 'mx-', 'linewidth',5)% plot them 
Qtable=maze.QValues;
save('Qtable.mat','Qtable')
  %%%%%%%%%%%%%%%%%%%%%%%%%Functions%%%%%%%%%%%%%%%%%%%%%%%%

function [action] = actionSelect (table, state,explorationRate)
    chance = rand(1);%chance to explore
    if chance < explorationRate%if exploring
        action = randperm(4,1);%give an action in whole numbers between 1 and 4
    else %if not exploring 
        [~ , action] = max(table(state, :));%your action is the Highest Q value per the given state
    end
end