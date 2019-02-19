% clear
% clc
load WalkingTrial012
t=WalkingTrial012(:,1); % Trial 1
y=WalkingTrial012(:,8); % Trial 1
t=table2array(t);
y=table2array(y);
t=(t-32210)/1000; %resetting time shift [s]
n = numel(t);
plot(t,y)
% for i = 1:n
%     plot(t(1:i,1),y(1:i,1))
%     xlabel('Time [s]')
%     ylabel('Voltage Difference [mV]')
%     pause(0.05)
% end