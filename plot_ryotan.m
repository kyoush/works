clear
close all

%% OĻđüčûÔĖĢ
ear_canal = [135.8 138.5 121.6 119.1 126.1 134.7 130.3 126.2 124.4 131.8];

%% ÅZĖŠnüĢ
geodesic = [260 271 258 261 262 275 317 273 305 282];

%% WN
wn_ild = [27.5 24 16 13.5 19 20 16 26 23.5 16.5];
wn_itd = [524 635 1440 907 941 748 567 612.5 1043 861.5];

%% PN
pn_ild = [30.5 23.5 18 13 20 18 22 26 24.5 15];
pn_itd = [760 680.5 1712 748.5 918.5 748.5 555.5 1406 998 941];

%% plot
fontsize = 14;
y = [10 35];

figure('Name', 'OĻđüčû-WN_ILD')
plot(ear_canal, wn_ild, 'o',...
    'MarkerFaceColor', 'b')
grid on
xlabel('OĻđüčûÔĖĢ [mm]')
ylabel('ILD [dB]')
ylim(y)
set(gca, 'FontSize', fontsize)
hold on
plot(ear_canal, pn_ild, 's',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
legend('zCgmCY', 'sNmCY', 'Location', 'northwest')

figure('Name', 'OĻđüčû-WN_ITD')
plot(ear_canal, wn_itd, 'o',...
    'MarkerFaceColor', 'b')
grid on
xlabel('OĻđüčûÔĖĢ [mm]')
ylabel('ITD [Ęs]')
ylim([400 1800])
set(gca, 'FontSize', fontsize)
hold on
plot(ear_canal, pn_itd, 's',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
legend('zCgmCY', 'sNmCY', 'Location', 'northeast')

figure('Name', 'ŠnüĢ-WN_ILD')
plot(geodesic, wn_ild, 'o',...
    'MarkerFaceColor', 'b')
grid on
xlabel('ÅZĖŠnüĢ [mm]')
ylabel('ILD [dB]')
ylim(y)
set(gca, 'FontSize', fontsize)
hold on
plot(geodesic, pn_ild, 's',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
legend('zCgmCY', 'sNmCY', 'Location', 'northeast')

figure('Name', 'ŠnüĢ-WN_ITD')
plot(geodesic, wn_itd, 'o',...
    'MarkerFaceColor', 'b')
grid on
xlabel('ÅZĖŠnüĢ [mm]')
ylabel('ITD [Ęs]')
ylim([400 1800])
set(gca, 'FontSize', fontsize)
hold on
plot(geodesic, pn_itd, 's',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
legend('zCgmCY', 'sNmCY', 'Location', 'northeast')

figure('Name', 'ÅZŠnüĢ-OĻđüčû')
plot(ear_canal, geodesic, 'o',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
grid on
xlabel('ÅZĖŠnüĢ [mm]')
ylabel('OĻđüčûÔĖĢ [mm]')
set(gca, 'FontSize', fontsize)

% 
% figure('Name', 'OĻđüčû-PN_ILD')
% plot(ear_canal, pn_ild, 'o')
% grid on
% xlabel('OĻđüčûÔĖĢ [mm]')
% ylabel('ILD [dB]')
% ylim(y)
% set(gca, 'FontSize', fontsize)
% 
% figure('Name', 'OĻđüčû-PN_ITD')
% plot(ear_canal, pn_itd, 'o')
% grid on
% xlabel('OĻđüčûÔĖĢ [mm]')
% ylabel('ITD [Ęs]')
% ylim([400 1800])
% set(gca, 'FontSize', fontsize)
% 
% figure('Name', 'ŠnüĢ-PN_ILD')
% plot(geodesic, pn_ild, 'o')
% grid on
% xlabel('ÅZĖŠnüĢ [mm]')
% ylabel('ILD [dB]')
% ylim(y)
% set(gca, 'FontSize', fontsize)
% 
% figure('Name', 'ŠnüĢ-PN_ITD')
% plot(geodesic, pn_itd, 'o')
% grid on
% xlabel('ÅZĖŠnüĢ [mm]')
% ylabel('ITD [Ęs]')
% ylim([400 1800])
% set(gca, 'FontSize', fontsize)