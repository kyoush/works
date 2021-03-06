function itdild2(db, delta, ildlabel, itdlabel, stop, waveform)

frame_length = 2048;
Fs = 44100;
fileReader = dsp.AudioFileReader(...
    'whitenoise.wav',...
    'SamplesPerFrame', frame_length);
aDW = audioDeviceWriter(...
    'SampleRate', Fs,...
    'SupportVariableSizeInput', 1,...
    'BufferSize', 1024);
cn = dsp.ColoredNoise(...
    'Color', 'white',...
    'SamplesPerFrame', frame_length);
flag = 1;
save = [];
filter = dsp.FIRFilter();
length_coeff = 76;
tmp = 0;
if waveform == 1
    while(isDone(fileReader) == 0 && stop.Value == 0)
        noise = fileReader();
%         noise = cn();
%         noise = wgn(1, frame_length, 1);
%         noise = noise .* 0.1;
%         noise = noise';
        drawnow limitrate
        tau = round(abs(delta.Value) * Fs * 0.000001);
        filter.Numerator = [zeros(1, tau) 1 zeros(1, length_coeff-tau-1)];
        
        if flag == 1
            for i = 1:1000
                noise(i) = noise(i) * (i/1000);
            end
            flag = 0;
        end

        %% ITD
        if delta.Value > 0
            sig = [filter(noise) noise];
        else
            sig = [noise filter(noise)];
        end
        
        %% ILD
        if db.Value == 40
            c = inf;
        elseif db.Value == -40
            c = -inf;
        else
            c = db.Value;
        end
        r = (2 .* 10.^(c./20))./(1 + 10.^(c./20));
        l = 2 ./ (1 + 10.^(c./20));
        sig(:, 1) = sig(:, 1) .* l;
        sig(:, 2) = sig(:, 2) .* r;
        
        %% update label
        l_pow = rms(sig(:, 1));
        r_pow = rms(sig(:, 2));
        a = 20 * log10(r_pow/l_pow);

        ildlabel.Text = [num2str(round(a)) ' [dB]'];

        a = sign(delta.Value) * (tau/Fs)*10^6;

        itdlabel.Text = [num2str(round(a)) ' [��s]'];

        aDW(sig);
    end
else
    filter = dsp.FIRFilter();
    sine = dsp.SineWave(...
        'Amplitude', 0.5,...
        'Frequency', 300,...
        'SampleRate', Fs,...
        'SamplesPerFrame', frame_length);
    while(stop.Value == 0)
        drawnow limitrate
%         x = 1:frame_length;
%         x = 0.5 * sin((2*pi)/(Fs/freq) * x)';
        x = sine();
        tau = round(abs(delta.Value) * Fs * 0.000001);
        filter.Numerator = [zeros(1, tau) 1 zeros(1, 50-tau-1)];
        
        %% ITD
        if delta.Value > 0
            sig = [filter(x) x];
        else
            sig = [x filter(x)];
        end
        
        %% ILD
        const = 10^(abs(db.Value)/20);
        if db.Value < 0
            sig(:, 1) = sig(:, 1) .* const;
        else
            sig(:, 2) = sig(:, 2) .* const;
        end
        
        %% update label
        l_pow = rms(sig(:, 1));
        r_pow = rms(sig(:, 2));
        a = 20 * log10(l_pow/r_pow);

        ildlabel.Text = [num2str(round(a)) ' [dB]'];

        a = sign(delta.Value) * (tau/Fs)*10^6;

        itdlabel.Text = [num2str(round(a)) ' [��s]'];
        
        aDW(sig);
    end
    release(sine)
end
stop.Value = 0;
release(aDW);
release(fileReader)
a = size(save);
for i = 1:a(1)
    plt(i) = plot(save(i, 1), save(i, 2), 'b.', 'MarkerSize', 100);
end
end