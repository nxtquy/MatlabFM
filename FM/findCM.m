% Quy Chau
% May 2017
% Heavily inspired by the great work of Eric Nguyen
% Returns location of peaks and maximum frequency
% Also returns max frequency for the purpose of bandwidth calculation
% and the tristimulus values
% factor decides how small peaks can be relative to maximum

function[loc, peak, maxf, Th] = findCM(y, fs, fig, factor)

y = y(:,1);
N = 100000;

%Plot positive domain FFT
f2 = linspace(-fs/2,fs/2,N);
yf2 = fftshift(fft(y, N));
f = f2((end/2+1):end);
yf = abs(yf2((end/2 + 1):end));

%Finds highest peak magnitude
[maxyf, ~] = max(yf);

%Find location of peaks
[peak, loc] = findpeaks(yf, f, 'MinPeakHeight', maxyf/(factor), 'MinPeakDistance',20);

if (fig ~= 0)
    figure(fig)
    plot(f, yf, loc, peak, 'o');
    if not(isempty(loc))
        xlim([0 1.2*loc(length(loc))]);
    end
    title('One-sided FFT spectrum');
    xlabel('frequency (Hz)');ylabel('Magnitude');
end

%Find bandwidth
maxf = max(loc);

%Calculate tristimulus "RGB"
T1 = 0;
T2 = 0;
T3 = 0;
loc2 = loc;
peak2 = log(peak);
ah = sum(peak2);
if (length(loc2) >= 1)
    T1 = peak2(1)/ah;
end
if (length(loc2) >= 4)
    an = (peak2(2) + peak2(3) + peak2(4));
    T2 = an/ah;
elseif (length(loc2) >= 3)
    an = (peak2(2) + peak2(3));
    T2 = an/ah;
elseif (length(loc2) >= 2)
    an = (peak2(2));
    T2 = an/ah;
end
if (length(loc2) >= 5)
    T3 = (ah - an - peak2(1)) / ah;
end

Th = [T1, T2, T3];

end