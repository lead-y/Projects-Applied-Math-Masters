close
clear all

load('noise_data.mat')

%Plots the music+noise vs time
bps = 1/Fs;
t = bps*(0:(length(signal)-1));
figure
plot(t,signal)
title('Signal data - noise and music')
xlabel('time (s)')
ylabel('music signal')

%noise phase guess
figure
hold on
plot(t,signal,'LineWidth',1.5)
noise_phase_guess = noise([0.5,2,0.5],t);
plot(t,noise_phase_guess,'LineWidth',2)
ylim([-3 3.5])
title('Signal and estimated noise')
xlabel('time (s)')
ylabel('signal')
legend('signal (noise+music)', 'estimated noise')

% Y = fft(signal,512);
% Pyy = Y.* conj(Y)/512;
% f = Fs*(0:256)/512;
% figure
% plot(f,Pyy(1:257))
% title('Frequency content of y')
% xlabel('frequency (Hz)')

Y = fft(signal);

P2 = abs(Y/length(signal));
P1 = P2(1:(length(signal)/2 + 1));
P1(2:end-1) = 2*P1(2:end-1);

%FFt data
f = Fs*(0:(length(signal)/2))/length(signal);
figure
plot(f,P1)
title('FFT data')
xlabel('f (Hz)')
ylabel(' |P1(f)| ')


fun = @(x) J(x,t,signal);

x = lsqnonlin(fun,[2,.5,.5]);

purenoise = zeros(size(signal));
for i = 1:length(signal)
    time=t(i);
    purenoise(i) = noise(x,time);
end

music = signal - purenoise;
sound(music,Fs)

%functions:
function y = noise(x,t)
w1 = 304*(2*pi);
w2 = 98*(2*pi);
% w1 = 615.7298;
% w2 = 1910.0929;
y = x(1)*sin(w1*t+x(3)) + x(2)*sin(w2*t+x(3));
end
function j = J(x,t,signal)
%t and signal are constants, x is a variable
j = zeros(size(signal));
for i = 1:length(signal)
    j(i) = signal(i) - noise(x,t(i));
end
end