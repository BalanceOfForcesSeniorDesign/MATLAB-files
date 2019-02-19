% clear
% clc
load WalkingTrial022
t=WalkingTrial022(:,1); % Trial 1
y=WalkingTrial022(:,8); % Trial 1
t=table2array(t);
y=table2array(y);
t=(t-32210)/1000; %resetting time shift [s]
n = numel(t);
plot(t,y)