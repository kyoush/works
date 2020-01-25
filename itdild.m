function itdild(db, delta, ildlabel, itdlabel, stop, waveform)
global h
global plt
global store
frame_length = 256;
Fs = 44100;
fileReader = dsp.AudioFileReader(...
    'bandpass.wav',...
    'SamplesPerFrame', frame_length);
aDW = audioDeviceWriter(...
    'SampleRate', Fs);
% cn = dsp.ColoredNoise(...
%     'Color', 'white',...
%     'SamplesPerFrame', frame_length);

pos = h.Center;
save = [];
filter = dsp.FIRFilter();
length_coeff = 100;
% tmp = 0;
if waveform == 1
    while(isDone(fileReader) == 0 && stop.Value == 0)
        if h.Selected == 1
            pos_old = pos;
            pos = h.Center;
            if pos_old == pos
                save = [save; pos];
                disp(pos)
                store.ild = [store.ild db.Value];
                store.itd = [store.itd delta.Value];
                store.xpos = [store.xpos pos(1)];
                store.ypos = [store.ypos pos(2)];
                h.Selected = 0;
            end
        end
        noise = fileReader();
%         noise = cn();
%         noise = wgn(1, frame_length, 1);
%         noise = noise .* 0.1;
%         noise = noise';
        drawnow
        tau = round(abs(delta.Value) * Fs * 0.000001);
        filter.Numerator = [zeros(1, tau) 1 zeros(1, length_coeff-tau-1)];
%         
%         if flag == 1
%             for i = 1:1000
%                 noise(i) = noise(i) * (i/1000);
%             end
%             flag = 0;
%         end

        %% ITD
        if delta.Value > 0
            sig = [filter(noise) noise];
        else
            sig = [noise filter(noise)];
        end
        
        %% ILD
        if db.Value == 40
            ild = inf;
        elseif db.Value == -40
            ild = -inf;
        else
            ild = db.Value;
        end
        r = (2 * 10^(ild/20))/(1 + 10^(ild/20));
        l = 2 / (1 + 10^(ild/20));
        sig(:, 1) = sig(:, 1) .* l;
        sig(:, 2) = sig(:, 2) .* r;
        
        %% update label
        l_pow = rms(sig(:, 1));
        r_pow = rms(sig(:, 2));
        a = 20 * log10(r_pow/l_pow);

        ildlabel.Text = [num2str(round(a)) ' [dB]'];

        a = sign(delta.Value) * (tau/Fs)*10^6;

        itdlabel.Text = [num2str(round(a)) ' [É s]'];

        aDW(sig);
    end
else
    filter = dsp.FIRFilter();
    sine = dsp.SineWave(...
        'Amplitude', 0.4,...
        'Frequency', 500,...
        'SampleRate', Fs,...
        'SamplesPerFrame', frame_length);
    scope = dsp.TimeScope(...
        'SampleRate', 44100,...
        'TimeSpan', 0.01,...
        'YLimits', [-1 1]);
    while(stop.Value == 0)
        drawnow limitrate
        %         x = 1:frame_length;
        %         x = 0.5 * sin((2*pi)/(Fs/freq) * x)';
        x = sine();
        tau = round(abs(delta.Value) * Fs * 0.000001);
        filter.Numerator = [zeros(1, tau) 1 zeros(1, length_coeff-tau-1)];
        
        %% ITD
        if delta.Value > 0
            sig = [filter(x) x];
        else
            sig = [x filter(x)];
        end
        
        %% ILD
        [r, l] = const(db.Value);
        sig(:, 1) = sig(:, 1) .* l;
        sig(:, 2) = sig(:, 2) .* r;
        
        %% update label
        l_pow = rms(sig(:, 1));
        r_pow = rms(sig(:, 2));
        a = 20 * log10(l_pow/r_pow);

        ildlabel.Text = [num2str(round(a)) ' [dB]'];

        a = sign(delta.Value) * (tau/Fs)*10^6;

        itdlabel.Text = [num2str(round(a)) ' [É s]'];
        
        scope(sig);
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
