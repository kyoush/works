clear
close all

%% �O����������Ԃ̋���
ear_canal = [135.8 138.5 121.6 119.1 126.1 134.7 130.3 126.2 124.4 131.8];

%% �ŒZ�̑��n������
geodesic = [260 271 258 261 262 275 317 273 305 282];

%% WN
wn_ild = [-16.6 -14.4 -14.6 -19.5 -22.6 -15.2 -16.2 -22.3 -21.2 -16];
wn_itd = [-300 -833.3 -1016.7 -1244.4 -1011.1 -505.6 -755.6 -300 -577.8 -1411.1];

%% PN
pn_ild = [-17.8 -20.9 -14.6 -19.7 -23.1 -17.6 -11.3 -22.7 -18.4 -19.6];
pn_itd = [-350 -933.3 -516.7 -956 -1227.8 -822.2 -855.5 -494.4 -466.7 -1500];

%% plot
fontsize = 14;
y = [10 35];

figure('Name', '�O���������-ILD')
plot(ear_canal, abs(wn_ild), 'o',...
    'MarkerFaceColor', 'b')
grid on
xlabel('�O����������Ԃ̋��� [mm]')
ylabel('ILD [dB]')
ylim(y)
set(gca, 'FontSize', fontsize)
yticks([10 15 20 25 30 35])
yticklabels([-10 -15 -20 -25 -30 -35])
hold on
plot(ear_canal, abs(pn_ild), 's',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
legend('�z���C�g�m�C�Y', '�s���N�m�C�Y', 'Location', 'northeast')

figure('Name', '�O���������-ITD')
plot(ear_canal, abs(wn_itd), 'o',...
    'MarkerFaceColor', 'b')
grid on
xlabel('�O����������Ԃ̋��� [mm]')
ylabel('ITD [��s]')
ylim([300 1800])
set(gca, 'FontSize', fontsize)
yticks([400 600 800 1000 1200 1400 1600 1800])
yticklabels([-400 -600 -800 -1000 -1200 -1400 -1600 -1800])
hold on
plot(ear_canal, abs(pn_itd), 's',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
legend('�z���C�g�m�C�Y', '�s���N�m�C�Y', 'Location', 'northwest')

figure('Name', '���n������-ILD')
plot(geodesic, abs(wn_ild), 'o',...
    'MarkerFaceColor', 'b')
grid on
xlabel('�ŒZ�̑��n������ [mm]')
ylabel('ILD [dB]')
ylim(y)
set(gca, 'FontSize', fontsize)
yticks([10 15 20 25 30 35])
yticklabels([-10 -15 -20 -25 -30 -35])
hold on
plot(geodesic, abs(pn_ild), 's',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
legend('�z���C�g�m�C�Y', '�s���N�m�C�Y', 'Location', 'northeast')

figure('Name', '���n������-ITD')
plot(geodesic, abs(wn_itd), 'o',...
    'MarkerFaceColor', 'b')
grid on
xlabel('�ŒZ�̑��n������ [mm]')
ylabel('ITD [��s]')
ylim([300 1800])
set(gca, 'FontSize', fontsize)
yticks([400 600 800 1000 1200 1400 1600 1800])
yticklabels([-400 -600 -800 -1000 -1200 -1400 -1600 -1800])
hold on
plot(geodesic, abs(pn_itd), 's',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k')
legend('�z���C�g�m�C�Y', '�s���N�m�C�Y', 'Location', 'northeast')

% 
% hana_canal = 135.83;
% hana_geo = 260;
% kou_canal = [138.53 130.34 126.15];
% kou_geo = [271 317 273];
% ago_canal = [121.56 119.13 126.14 134.72 124.44 131.82];
% ago_geo = [258 261 262 275 305 282];
% 
% figure('Name', '�ŒZ���n������-�O���������')
% plot(hana_canal, hana_geo, 'o')
% hold on
% plot(kou_canal, kou_geo, 's',...
%     'MarkerEdgeColor', 'red',...
%     'MarkerFaceColor', 'red')
% plot(ago_canal, ago_geo, 'o',...
%     'MarkerEdgeColor', 'k',...
%     'MarkerFaceColor', 'k')
% grid on
% ylabel('�ŒZ�̑��n������ [mm]')
% xlabel('�O����������Ԃ̋��� [mm]')
% set(gca, 'FontSize', fontsize)
% legend('�@�̉�', '�㓪��', '�����̉�', 'Location', 'northwest')

% 
% figure('Name', '�O���������-PN_ILD')
% plot(ear_canal, pn_ild, 'o')
% grid on
% xlabel('�O����������Ԃ̋��� [mm]')
% ylabel('ILD [dB]')
% ylim(y)
% set(gca, 'FontSize', fontsize)
% 
% figure('Name', '�O���������-PN_ITD')
% plot(ear_canal, pn_itd, 'o')
% grid on
% xlabel('�O����������Ԃ̋��� [mm]')
% ylabel('ITD [��s]')
% ylim([400 1800])
% set(gca, 'FontSize', fontsize)
% 
% figure('Name', '���n������-PN_ILD')
% plot(geodesic, pn_ild, 'o')
% grid on
% xlabel('�ŒZ�̑��n������ [mm]')
% ylabel('ILD [dB]')
% ylim(y)
% set(gca, 'FontSize', fontsize)
% 
% figure('Name', '���n������-PN_ITD')
% plot(geodesic, pn_itd, 'o')
% grid on
% xlabel('�ŒZ�̑��n������ [mm]')
% ylabel('ITD [��s]')
% ylim([400 1800])
% set(gca, 'FontSize', fontsize)