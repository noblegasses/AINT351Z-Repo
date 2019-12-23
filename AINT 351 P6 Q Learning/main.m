clc 
clear all 
close all
state = startingState();
table = Qtable(11,4);
figure
hold  on
surf(table)
[counts, states,table] = run(table);
figure
hold on
subplot(211)
plot(counts)
subplot(212)
plot(states)
figure 
hold on 
surf(table)
