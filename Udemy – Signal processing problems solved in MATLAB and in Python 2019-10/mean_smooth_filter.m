close all
clear
clc

% sample rate
srate = 1000;
time = 0:1/srate:10;
% number of samples 
n = length(time);
% poles for random interpolation
p = 15;
% noise amplitude
amp_noise = 4;

figure(1)

signal = interp1(rand(p,1)*20,linspace(1,p,n));
plot(time,signal,'k')
hold on
% adding noise to signal 
noisy_signal = signal + amp_noise*randn(size(time));
plot(time,noisy_signal,'r')
hold on

% mean-smooth filter 
k = 30;
% filtered_signal = zeros(size(signal));
filtered_signal = signal;
for i = k+1:n-k-1
    filtered_signal(i) = mean(noisy_signal(i-k:i+k));
end
plot(time,filtered_signal,'b')


