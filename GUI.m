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

X_MIN = v(3) * 0.01;
Y_MIN = v(4) * 0.1;
WIDTH = 600;
HEIGHT = 230;
Figure_position = [X_MIN Y_MIN WIDTH HEIGHT];
color = [0.6 0.7 1];
waveform = 1;

%% figureの作成
H0 = uifigure('Position', Figure_position,...
    'NumberTitle','off',...
    'Name','ITD & ILD',...
    'MenuBar', 'none',...
    'Color', color,...
    'Units', 'pixels',...
    'Visible', 'on');

%% menu
menu = uimenu(H0,...
    'Text', 'Preference');
    menu_2 = uimenu(menu,...
        'Text', 'Wave form');
        uimenu(menu_2,...
            'Text', 'White Noise',...
            'MenuSelectedFcn', 'waveform = 1;');
        uimenu(menu_2,...
            'Text', 'Sine Wave',...
            'MenuSelectedFcn', 'waveform = 2;');

%% ラベル
label1 = uilabel(H0,...
    'Position', [WIDTH/2-10 HEIGHT-90 500 100],...
    'Text', 'ILD',...
    'FontSize', 20);
label2 = uilabel(H0,...
    'Position', [WIDTH/2-10 HEIGHT-185 500 100],...
    'Text', 'ITD',...
    'FontSize', 20);
label3 = uilabel(H0,...
    'Position', [WIDTH-35 HEIGHT-141 100 100],...
    'Text', '[dB]');
label4 = uilabel(H0,...
    'Position', [WIDTH-30 HEIGHT-240 100 100],...
    'Text', '[μs]');
label5 = uilabel(H0,...
    'Position', [WIDTH/2+50 HEIGHT-90 500 100],...
    'Text', '0 [dB]',...
    'fontsize', 20);
label6 = uilabel(H0,...
    'Position', [WIDTH/2+50 HEIGHT-185 500 100],...
    'Text', '0 [μs]',...
    'fontsize', 20);

%% Stop & Keep Button
button_stop = uibutton(H0, 'state',...
    'Position', [WIDTH-500 HEIGHT-60 80 30],...
    'Text', 'Stop');

button_keep = uibutton(H0, 'state',...
    'Position', [WIDTH-180 HEIGHT-60 80 30],...
    'BackgroundColor', [0.5 1 0.5],...
    'Text', 'Both');

%% スライダ
sld_ild = uislider(H0,...
    'Position', [WIDTH/2-250 HEIGHT-80 500 3],...
    'Limits', [-20 20]);

sld_itd = uislider(H0,...
    'Position', [WIDTH/2-250 HEIGHT-170 500 3],...
    'Limits', [-1500 1500],...
    'ValueChangingFcn',@(sld_itd, event) updatesld_ild(button_keep, sld_itd, sld_ild, event));

sld_ild.ValueChangingFcn = @(sld_ild,event) updatesld_itd(button_keep, sld_itd, sld_ild, event);

%% Reset Button
color_bt = [0.5 1 1];
button_ild = uibutton(H0,...
    'Position', [WIDTH-90 HEIGHT-60 80 30],...
    'Text', 'Clear ILD',...
    'BackgroundColor', color_bt,...
    'ButtonPushedFcn',@(button_ild, event) reset_value(sld_ild));

button_itd = uibutton(H0,...
    'Position', [WIDTH-90 HEIGHT-150 80 30],...
    'Text', 'Clear ITD',...
    'BackgroundColor', color_bt,...
    'ButtonPushedFcn',@(button_itd, event) reset_value(sld_itd));

global h
%% Play Button
button_play = uibutton(H0,...
    'Position', [WIDTH-590 HEIGHT-60 80 30],...
    'Text', 'Play',...
    'ButtonPushedFcn',@(button_play, event) itdild(sld_ild, sld_itd, label5, label6, button_stop, evalin('base', 'waveform')));
%% 決定
% button_decide = uibutton(H0,...
%     'Position', [WIDTH-400 HEIGHT-60 80 30],...
%     'Text', '決定');
%% Answer Figure
% XMIN = v(3) * 0.49;
% YMIN = v(4) * 0.1;
% WIDTH = v(3) * 0.5;
% HEIGHT = WIDTH * 4 / 5;
figpos = [1000 200 850 0];
figpos(4) = figpos(3) * 4 / 5;
global flag
global plt
global store
store.itd = [];
store.ild = [];
store.xpos = [];
store.ypos = [];
flag = 0;
f = figure('Pos', figpos,...
    'Color', [0 0 0],...
    'NumberTitle', 'off',...
    'Name', 'Sound Localization',...
    'MenuBar', 'none');

A = imread('image.jpeg');
image(A);
set(gca, 'Visible', 'off')
hold on 
% plt = plot(448, 380, 'r.', 'MarkerSize', 160);

h = images.roi.Circle(gca, 'Center', [448 380], 'Radius', 50, 'FaceAlpha', 1);

%% Bothボタンが押されたとき、itdのスライダも同時に動かす関数
function updatesld_itd(keep, sld_itd, sld_ild, event)

if keep.Value == 1
    sld_itd.Value = event.Value * sld_itd.Limits(2) / sld_ild.Limits(2);
    sld_ild.Value = event.Value;
else
    sld_ild.Value = event.Value;
end
end

%% Bothボタンが押されたとき、ildのスライダも同時に動かす関数
function updatesld_ild(keep, sld_itd, sld_ild, event)
if keep.Value == 1
    sld_ild.Value = event.Value * sld_ild.Limits(2) / sld_itd.Limits(2);
    sld_itd.Value = event.Value;
else
    sld_itd.Value = event.Value;
end
end

%% スライダの値を0にリセットする関数
function reset_value(obj)
obj.Value = 0;
end