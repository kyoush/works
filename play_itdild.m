function play_itdild(ild, itd)
T = 2.5;
fl = 2048;

fileReader = dsp.AudioFileReader(...
    'whitenoise.wav',...
    'SamplesPerFrame', fl);
Fs = fileReader.SampleRate;
aDW = audioDeviceWriter(...
    'SampleRate', Fs);
tau = round(abs(itd) * Fs * 0.000001);
length_coeff = 50;
filter = dsp.FIRFilter(...
    'Numerator', [zeros(1, tau) 1 zeros(1, length_coeff-tau-1)]);
flag = 1;
for i = 1:Fs*T/fl
    noise = fileReader();
    if flag == 1
        for j = 1:2000
            noise(i) = noise(i) * (i/2000);
        end
        flag = 0;
    end
    if itd > 0
        sig = [filter(noise) noise];
    else
        sig = [noise filter(noise)];
    end
    
    [r, l] = const(ild);
    sig(:, 1) = sig(:, 1) .* l;
    sig(:, 2) = sig(:, 2) .* r;
    
    aDW(sig);
end
end