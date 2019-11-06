function pos = start(h)
disp('start')
a = -20:1:20;
perm = randperm(41);
for i = 1:41
    x(i) = a(perm(i));
end

fl = 2048;
filereader = dsp.AudioFileReader(...
    'whitenoise.wav',...
    'SamplesPerFrame', fl);
Fs = filereader.SampleRate;
aDW = audioDeviceWriter(...
    'SampleRate', Fs);
T = 4;
save_pos = [];
n = 10;

for i = 1:n
    ild = x(i);
    const = 10^(abs(ild)/20);
    for i = 1:fl:Fs*T-fl
        noise = filereader();
        sig = [noise noise];
        if ild < 0
            sig(:, 2) = sig(:, 2) ./ const;
        else
            sig(:, 1) = sig(:, 1) ./ const;
        end
        aDW(sig);
    end
    pause
    save_pos = [save_pos; ild h.Center];
    h.Center
end
release(filereader)
release(aDW)
figure(2)
[~, I] = sort(save_pos(:, 1));
pos = zeros(n, 3);
for i = 1:n
    pos(i, :) = save_pos(I(i), :);
end
plot(pos(:, 2), pos(:, 1), '-o')
grid on
ylim([-700 700])
end