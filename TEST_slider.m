clear
close all force

v = get(0, 'MonitorPosition');

WIDTH = 750;
HEIGHT = 300;
X_MIN = v(3) - WIDTH * 2.5;
Y_MIN = v(4) - HEIGHT * 3;

Figure_position = [X_MIN Y_MIN WIDTH HEIGHT];
color = [0.6 0.7 1];
waveform = 1;
itdild_select = 1;

H0 = uifigure('Position', Figure_position,...
    'NumberTitle', 'off',...
    'Name', 'ITD & ILD',...
    'Menubar', 'none',...
    'Color', color,...
    'Units', 'pixels',...
    'Visible', 'on');

ild_min = -15-randi(13);
cg = uigauge(H0,...
    'Position', [WIDTH/2-100 HEIGHT-280 100 100],...
    'Limits', [ild_min ild_min+44]);

%% ƒXƒ‰ƒCƒ_
global old
old = 0;
sld = uislider(H0,...
    'Position', [WIDTH/2-320 HEIGHT-80 640 3],...
    'Limits', [ild_min ild_min+44],...
    'Value', ild_min+22,...
    'MajorTicks', [],...
    'ValueChangingFcn',@(sld,event) change(event, cg));

function change(sld, cg)
global old
cg.Value = sld.Value;
disp(old - sld.Value)
old = sld.Value;
end