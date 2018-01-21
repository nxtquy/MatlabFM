% Quy Chau
% May 2017
% Function takes in parameters for simple FM synthesis with two oscillators
% Inputs are fc (carrier frequency), fm (modulator frequency),
% envelopes for A and I (Amplitude and index of modulation),
% pc and pm (carrier and modulator phase),
% wave form of carrier, wave form of modulator (strings),
% and envelopes for A and I
% Plays a T-second sample of the sound

function[] =  operator2(fc, fm, A, I, pc, pm, wc, wm, T, fs)

fh1 = str2func(wc);
fh2 = str2func(wm);

t = linspace(0,T,length(A));

y = (A).*((fh1(2*pi*fc.*t-(I).*fh2(2*pi*fm.*t+pm)+pc)));

audiowrite('sample_output.wav',y,fs)
sound(y, fs) %Comment out for no fun allowed

end