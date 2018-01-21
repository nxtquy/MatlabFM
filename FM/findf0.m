% Quy Chau
% May 2017
% Function plots the wav file FFT's for comparison
function [loc, peak] = findf0(y, fs, mpp)

dt = 1/fs;
L = length(y);
t = 0:dt:(length(y)*dt)-dt;

yf = ((fft(y)));
P2 = abs(yf/L);
P1 = P2(round(1:L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
magfft = P1;

f0 = 1;
n = length(f);
magsmooth = smooth(magfft,11)./smooth(magfft,301); 
magsmooth(round(5000/f0)+1:n)=0;
[peak, loc, width, prom]=findpeaks(magsmooth,f, 'MinPeakDistance',50, 'MinPeakProminence', mpp);

figure(3)
semilogy(f,magsmooth', loc, peak, 'o');
title('Smoothed FFT of sample');
xlabel('frequency (Hz)');ylabel('FFT');


end