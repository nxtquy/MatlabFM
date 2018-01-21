% Quy Chau
% May 2017
% Function takes in parameters for simple FM synthesis with two oscillators
% Inputs are fc (carrier frequency), fm (modulator frequency),
% envelopes for A and I (Amplitude and index of modulation),
% pc and pm (carrier and modulator phase),
% wave form of carrier, wave form of modulator (strings),
% and envelopes for A and I
% Plays a T-second sample of the sound

function[] =  operator(fc, fm, A, I, pc, pm, wc, wm, T, fs)

fh1 = str2func(wc);
fh2 = str2func(wm);

t = linspace(0,T,length(A));

y = (A).*((fh1(2*pi*fc.*t-(I).*fh2(2*pi*fm.*t+pm)+pc)));
% y_delay = (A).*((fh1(2*pi*fc.*(t-1)-(I).*fh2(2*pi*fm.*(t-1)+pm)+pc)));
figure(6)
plot(t,y)
title('Operator output');
xlabel('time (s)');ylabel('Amplitude');

audiowrite('sample_output.wav',y,fs)
sound(y, fs)
% sound(y_delay, fs)

%Plot output fft

dt = 1/fs;
L = length(y);
t = 0:dt:(length(y)*dt)-dt;

yf = fft(y);
P2 = abs(yf/L);
P1 = P2(round(1:L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
magfft = P1;

f0 = 1;
n = length(f);
magsmooth = smooth(magfft,11)./smooth(magfft,301); magsmooth(round(5000/f0)+1:n)=0;
[peak, loc, width, prom]=findpeaks(magsmooth,f, 'MinPeakDistance',50, 'MinPeakProminence', 1.5);

figure(7)
semilogy(f,magsmooth', loc, peak, 'o');
title('Smoothed FFT of output');
xlabel('frequency (Hz)');ylabel('FFT');

disp('actual output peaks: ')
disp(loc)


end