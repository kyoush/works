clear
close all
load('itdild.mat')

ild = (ild1 + ild2 + ild3) ./ 3;
S_ild = std([ild1; ild2; ild3]);
S_ild = [zeros(1, 4) S_ild zeros(1, 4)];
itd = (itd1 + itd2 + itd3) ./ 3;
S_itd = std([itd1; itd2; itd3]);
S_itd = [zeros(1, 4) S_itd zeros(1, 4)];
order = [1 6 4 7 3 8 5 9 2];


ue = [0 0 1/16 1/16 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8];
sita = [1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/16 1/16 0 0];

ild = [-32 -28 -24 -20 ild 20 24 28 32];
pos_old = pos;
pos = [-1.2 -1.2 -1.1 -1 pos 1 1.1 1.2 1.2];

s = '頭外';
figure(1)
errorbar(ild, pos, sita, ue, S_ild, S_ild, '-o')
grid on
ylim([-3/2 3/2])
xlim([-35 35 ])
xlabel('ILD [dB]')
ylabel('音像の位置')
set(gca, 'FontSize', 12)
yticks([-1.5 -1.2 -1 -0.5 0 0.5 1 1.2 1.5]);
yticklabels({'-1.5', s, '-1', '-0.5', '0', '0.5', '1', s, '1.5'});
hold on
plot(ild_old, pos_old, '--o')
for i = 5:13
    text(ild(i)-2, pos(i)+0.1, num2str(order(i-4)), 'FontSize', 12);
end
legend('今回のデータ', '前回のデータ', 'Location', 'northwest')

ue = [1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/4 1/4 1/4 1/4 1/4 1/4];
sita = [1/4 1/4 1/4 1/4 1/4 1/4 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8];

itd = [-1500 -1300 -1100 -1000 itd 1000 1100 1300 1500];

figure(2)
errorbar(itd, pos, ue, sita, S_itd, S_itd, '-o')
grid on
ylim([-3/2 3/2])
xlim([-1700 1700])
xlabel('ITD [μs]')
ylabel('音像の位置')
set(gca, 'FontSize', 12)
yticks([-1.5 -1.2 -1 -0.5 0 0.5 1 1.2 1.5]);
yticklabels({'-1.5', s, '-1', '-0.5', '0', '0.5', '1', s, '1.5'});
for i = 5:13
    text(itd(i)-80, pos(i)+0.2, num2str(order(i-4)), 'FontSize', 12);
end
hold on
plot(itd_old, pos_old, '--o')
legend('今回のデータ', '前回のデータ', 'Location', 'northwest')