%% ME498
%David Mackey
%FFT of Test Data

%This program applies the Fourier transform to a waveform y(t) defined
% by the vectors t and y in the workspace. Note that these variables must
% be present in the MATLAB workspace in order for FFT_Code to run.
%
%  Definitions:  
%                t = time in seconds
%                y = time-domain signal
%                F = Y(omega), the Fourier coefficients
%              M_F = Amplitude portion of the frequency domain of y(t)
%                f = signal frequency in Hz
%               fs = sampling rate in Hz = 1/delta_t
%  You can calculate fs from 1/(t(2)-t(1) or 1/(t(3)-t(2)) and so on....
%           tstart = 0       in seconds
%           tfinal = t(end)  in seconds
%% Load Workspace
load WalkingTrial022
t=WalkingTrial022(:,1); % Trial 1
y=WalkingTrial022(:,8); % Trial 1
t=table2array(t);
y=table2array(y);
t=(t-32210)/1000; %resetting time shift [s]
%% FFT over 2 sec
% Trial 1
a=2001; %find(t==55.3180);
b=a+499;
t1=t(a:b,1);
y1=y(a:b,1); 
nfft1=length(t1);                          % Determine the number of data points
tstart1=t1(1); tfinal1=t1(end);              % The start and stop times of the signal y
fs1=1/(t1(2)-t1(1));
F1=2./fs1*fft(y1,nfft1)*(1/(tfinal1-tstart1));  % Apply Fourier transform to y(t) (next two lines)
F1=F1(1:floor(nfft1/2));                          
M_F1=abs(F1);                              % Calculate the amplitude of the sine waves  
f1=(0:(nfft1/2)-1)*(fs1/nfft1);              % Converstion of time to frequency
f1=f1.';
%% Stage Detection
% Trial 1
for i = 1:20
    if M_F1(i)>=5 
        state(i)=1;
    else
        state(i)=0;
    end
end
disp('Trial 1')
if sum(state)>=5
    disp('Walking State')
else
    disp('Standing State')
end
%% Plot Results
figure(1)
plot(t1,y1)
axis([0 140 0 200])
xlabel('Time (s)')
ylabel('Voltage Difference (V)')
title('Voltage Difference in Force Sensors')
legend('Step 1')%,'Step 2','Step 3','Step 4','Step 5','Step 6')


figure(2)
plot(f1,M_F1)
axis([0 10 0 200])
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Amplitude Spectrum of a Periodic Waveform')
legend('Step 1')%,'Step 2','Step 3','Step 4','Step 5','Step 6')
