clear
close all

%% OĻđüčûÔĖĢ
ear_canal = [135.8 138.5 121.6 119.1 126.1 134.7 130.3 126.2 124.4 131.8];

%% ÅZĖŠnüĢ
geodesic = [260 271 258 261 262 275 317 273 305 282];

%% WN
wn_ild = [25.1 22.9 21.3 19.2 23 13.8 14.6 24.9 25.2 18.3];
wn_itd = [461 705.6 1181.3 1027.8 927.8 727.8 1216.7 533.3 811.1 866.7];

%% PN
pn_ild = [19 18.9 19.4 17.9 22.7 14.5 16.7 23.7 18 14.1];
pn_itd = [500 1111.1 1150 1033.3 1305.6 1433.3 744.4 516.7 683.3 1250];

%% plot
fontsize = 14;
y = [10 35];

figure('Name', 'OĻđüčû-ILD')
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
legend('zCgmCY', 'sNmCY', 'Location', 'northeast')

figure('Name', 'OĻđüčû-ITD')
plot(ear_canal, wn_itd, 'o',...
    'MarkerFaceColor', 'b')
grid on
xlabel('OĻđüčûÔĖĢ [mm]')
ylabel('ITD [Ęs]')
ylim([300 1800])
set(gca, 'FontSize', fontsize)
hold on
plot(ear_canal, pn_itd, 's',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
legend('zCgmCY', 'sNmCY', 'Location', 'northeast')

figure('Name', 'ŠnüĢ-ILD')
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

figure('Name', 'ŠnüĢ-ITD')
plot(geodesic, wn_itd, 'o',...
    'MarkerFaceColor', 'b')
grid on
xlabel('ÅZĖŠnüĢ [mm]')
ylabel('ITD [Ęs]')
ylim([300 1800])
set(gca, 'FontSize', fontsize)
hold on
plot(geodesic, pn_itd, 's',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
legend('zCgmCY', 'sNmCY', 'Location', 'northeast')


hana_canal = 135.83;
hana_geo = 260;
kou_canal = [138.53 130.34 126.15];
kou_geo = [271 317 273];
ago_canal = [121.56 119.13 126.14 134.72 124.44 131.82];
ago_geo = [258 261 262 275 305 282];

figure('Name', 'ÅZŠnüĢ-OĻđüčû')
plot(hana_canal, hana_geo, 'o')
hold on
plot(kou_canal, kou_geo, 's',...
    'MarkerEdgeColor', 'red',...
    'MarkerFaceColor', 'red')
plot(ago_canal, ago_geo, 'o',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
grid on
ylabel('ÅZĖŠnüĢ [mm]')
xlabel('OĻđüčûÔĖĢ [mm]')
set(gca, 'FontSize', fontsize)
legend('@Ėš', 'ãŠ', ' ēĖš', 'Location', 'northwest')

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