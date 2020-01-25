function play_itdild(ild, itd)
addpath('pa-wavplay-46c387a')
T = 1;
% T = 30;
w = 3000;

[sig, Fs] = audioread('bandpass.wav');
tau = round(abs(itd) * Fs * 0.000001);

if itd > 0
    noise = [sig(1:Fs*T) sig(tau+1:Fs*T+tau)];
else
    noise = [sig(tau+1:Fs*T+tau) sig(1:Fs*T)];
end

noise(1:w, :) = noise(1:w, :) .* [1:w]'./w;
noise(end-w+1:end, :) = noise(end-w+1:end, :) .* [3000:-1:1]'./w;


[r, l] = const(ild);
% noise(:, 1) = noise(:, 1) .* l ./ 3.1623;
% noise(:, 2) = noise(:, 2) .* r ./ 3.1623;
% 
noise(:, 1) = noise(:, 1) .* l;
noise(:, 2) = noise(:, 2) .* r;

sound(noise, Fs)
% pa_wavplay(noise, Fs, 0, 'asio')

end