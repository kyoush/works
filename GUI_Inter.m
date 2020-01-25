%---------------------------------------------
% 
% GUI Program
% 
% by K.Kamura  07/06/2019
% 
%---------------------------------------------
clear
close all force

v = get(0, 'MonitorPosition');

WIDTH = 750;
HEIGHT = 250;
X_MIN = v(3) - WIDTH * 2.5;
Y_MIN = v(4) - HEIGHT * 3;

Figure_position = [X_MIN Y_MIN WIDTH HEIGHT];
color = [0.6 0.7 1];
waveform = 1;


global pos
global order

pos = [-1 -3/4 -1/2 -1/4 0 1/4 1/2 3/4 1];
order = [1 9 5 3 7 2 4 6 8];

%% figureÇÃçÏê¨
H0 = uifigure('Position', Figure_position,...
    'NumberTitle','off',...
    'Name','ITD & ILD',...
    'MenuBar', 'none',...
    'Color', color,...
    'Units', 'pixels',...
    'Visible', 'on',...
    'WindowScrollWheelFcn',@scrollFcn);

global itdild_select
global name
itdild_select = input('ILD = 1\nITD = 2\n (ì¸óÕ)>>>');
name = input('ñºëO\n (ì¸óÕ)>>>', 's');

global sld
if itdild_select == 1
    ild_min = -15 - randi(13);
    
    sld = uislider(H0,...
    'Position', [WIDTH/2-320 HEIGHT-80 640 3],...
    'Limits', [ild_min ild_min+44],...
    'Value', randi([ild_min ild_min+44]),...
    'MajorTicks', []);

else
    itd_min = -1499 - randi(1001);
    
    sld = uislider(H0,...
        'Position', [WIDTH/2-320 HEIGHT-80 640 3],...
        'Limits', [itd_min itd_min+4000],...
        'Value', randi([itd_min itd_min+4000]),...
        'MajorTicks', []);
end

global i
i = 3;
global ild
global itd
ild = [-24 0 0 0 0 0 0 0 24];
itd = [-1200 0 0 0 0 0 0 0 1200];
global num
num = [0 0 0 0 0 0 0 0 0];

button_de = uibutton(H0,...
    'Position', [WIDTH-150 HEIGHT-200 120 70],...
    'Text', 'åàíË',...
    'FontSize', 24,...
    'ButtonPushedFcn',@(button_de, event) decision(evalin('base', 'itdild_select'), sld));

button_pl = uibutton(H0,...
    'Position', [WIDTH-300 HEIGHT-200 120 70],...
    'Text', 'çƒê∂',...
    'FontSize', 24,...
    'ButtonPushedFcn',@(button_pl, event) play(evalin('base', 'itdild_select'), sld));

%% ScrollWheelFcn
function scrollFcn(~, wheel)
global itdild_select
global sld

ln = 1;
tn = 20;

if wheel.VerticalScrollCount < 0
    if itdild_select == 1
        if sld.Value + ln <= sld.Limits(2)
            sld.Value = sld.Value + ln;
        end
    else
        if sld.Value + tn <= sld.Limits(2)
            sld.Value = sld.Value + tn;
        end
    end
else
    if itdild_select == 1
        if sld.Value - ln >= sld.Limits(1)
            sld.Value = sld.Value - ln;
        end
    else
        if sld.Value - tn >= sld.Limits(1)
            sld.Value = sld.Value - tn;
        end
    end
end
end