clear


Fs = 44.1e3;
T = 120;

hpink = dsp.ColoredNoise(...
    'Color', 'pink',...
    'SamplesPerFrame', Fs*T);
% x = randn(Fs*T, 1);
rng default;
x = step(hpink);

x = 0.5 * x / max(abs(x));