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
clear,clc,close
load WalkingTrial012
t=WalkingTrial012(:,1); % Trial 1
y=WalkingTrial012(:,8); % Trial 1
t=table2array(t);
y=table2array(y);
t=(t-32210)/1000; % [s] resetting time shift 
%% Step 1
a=find(t==48.3890);
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
%% Step 2
c=find(t==61.6840);
d=c+499;
t2=t(c:d,1);
y2=y(c:d,1); 
nfft2=length(t2);                          % Determine the number of data points
tstart2=t2(1); tfinal2=t2(end);              % The start and stop times of the signal y
fs2=1/(t2(2)-t2(1));
F2=2./fs2*fft(y2,nfft2)*(1/(tfinal2-tstart2));  % Apply Fourier transform to y(t) (next two lines)
F2=F2(1:floor(nfft2/2));                         
M_F2=abs(F2);                              % Calculate the amplitude of the sine waves    
f2=(0:(nfft2/2)-1)*(fs2/nfft2);              % Converstion of time to frequency
f2=f2.';
%% Step 3
e=find(t==72.2280);
f=e+499;
t3=t(e:f,1);
y3=y(e:f,1); 
nfft3=length(t3);                          % Determine the number of data points
tstart3=t3(1); tfinal3=t3(end);              % The start and stop times of the signal y
fs3=1/(t3(2)-t3(1));
F3=2./fs3*fft(y3,nfft3)*(1/(tfinal3-tstart3));  % Apply Fourier transform to y(t) (next two lines)
F3=F3(1:floor(nfft3/2));                           
M_F3=abs(F3);                              % Calculate the amplitude of the sine waves        
f3=(0:(nfft3/2)-1)*(fs3/nfft3);              % Converstion of time to frequency
f3=f3.';
%% Step 4
g=find(t==82.7800);
h=g+499;
t4=t(g:h,1);
y4=y(g:h,1); 
nfft4=length(t4);                          % Determine the number of data points
tstart4=t4(1); tfinal4=t4(end);              % The start and stop times of the signal y
fs4=1/(t4(2)-t4(1));
F4=2./fs4*fft(y4,nfft4)*(1/(tfinal4-tstart4));  % Apply Fourier transform to y(t) (next two lines)
F4=F4(1:floor(nfft4/2));                           
M_F4=abs(F4);                              % Calculate the amplitude of the sine waves        
f4=(0:(nfft4/2)-1)*(fs4/nfft4);              % Converstion of time to frequency
f4=f4.';
%% Step 5
j=find(t==92.3930);
k=j+499;
t5=t(j:k,1);
y5=y(j:k,1); 
nfft5=length(t5);                          % Determine the number of data points
tstart5=t5(1); tfinal5=t5(end);              % The start and stop times of the signal y
fs5=1/(t5(2)-t5(1));
F5=2./fs5*fft(y5,nfft5)*(1/(tfinal5-tstart5));  % Apply Fourier transform to y(t) (next two lines)
F5=F5(1:floor(nfft5/2));                           
M_F5=abs(F5);                              % Calculate the amplitude of the sine waves        
f5=(0:(nfft5/2)-1)*(fs5/nfft5);              % Converstion of time to frequency
f5=f5.';
%% Step 6
l=find(t==102.7140);
m=l+499;
t6=t(j:k,1);
y6=y(j:k,1); 
nfft6=length(t6);                          % Determine the number of data points
tstart6=t6(1); tfinal6=t6(end);              % The start and stop times of the signal y
fs6=1/(t6(2)-t6(1));
F6=2./fs6*fft(y6,nfft6)*(1/(tfinal6-tstart6));  % Apply Fourier transform to y(t) (next two lines)
F6=F6(1:floor(nfft6/2));                           
M_F6=abs(F6);                              % Calculate the amplitude of the sine waves        
f6=(0:(nfft6/2)-1)*(fs6/nfft6);              % Converstion of time to frequency
f6=f6.';
%% Statistical Calculations
ftab=table(f1,f2,f3,f4,f5,f6);
ftab=table2array(ftab);
fave=mean(ftab,2);
fstd=std(fave);
MFtab=table(M_F1,M_F2,M_F3,M_F4,M_F5,M_F6);
MFtab=table2array(MFtab);
MFave=mean(MFtab,2);
MFstd=std(MFave);
%% Stage Detection
for i = 1:20
    if MFave(i)>=5 
        stage(i)=1;
    else
        stage(i)=0;
    end
end
disp('Average Trial 1')
if sum(stage)>=5
    disp('Walking Stage')
else
    disp('Standing Stage')
end   
%% Plot Results
figure(1)
plot(t1,y1,t2,y2,t3,y3,t4,y4,t5,y5,t6,y6)
axis([0 140 0 200])
xlabel('Time (s)')
ylabel('Voltage Difference (V)')
title('Voltage Difference in Force Sensors')
legend('Step 1','Step 2','Step 3','Step 4','Step 5','Step 6')

figure(2)
plot(f1,M_F1,f2,M_F2,f3,M_F3,f4,M_F4,f5,M_F5,f6,M_F6)
axis([0 10 0 200])
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Amplitude Spectrum of a Periodic Waveform')
legend('Step 1','Step 2','Step 3','Step 4','Step 5','Step 6')

figure(3)
plot(fave,MFave)
axis([0 10 0 200])
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Averaged Amplitude Spectrum of a Periodic Waveform')

