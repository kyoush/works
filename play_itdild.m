function play_itdild(ild, itd)
T = 3.42;
fl = 4096;
w = 3000;

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
for i = 1:Fs*T/fl
    noise = fileReader();
    if i == 1
        for j = 1:w
            noise(j) = noise(j) * (j/w);
        end
    end
    if i == fix(Fs*T/fl)
        for j = w:-1:1
            noise(fl-j+1) = noise(fl-j+1) .* (j/w);
        end
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
release(fileReader)
release(aDW)
release(filter)
end