close all
clear
clc

% sample rate
srate = 1000;
time = 1:1/srate:5;
% number of samples 
n = length(time);
% poles for random interpolation
p = 15;
% noise amplitude
amp_noise = 5;

signal = interp1(rand(p,1)*20,linspace(1,p,n));
figure(1)
plot(time,signal,'k')
hold on
% adding noise to signal 
noisy_signal = signal + amp_noise*randn(size(time));
plot(time,noisy_signal,'r')
hold on

% mean-smooth filter 
k = 20;
filtered_signal = zeros(size(signal));
for i = k+1:n-k-1
    filtered_signal(i) = mean(noisy_signal(i-k:i+k));
end
plot(time,filtered_signal,'b')


