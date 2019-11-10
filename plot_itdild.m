clear
load('itdild.mat')

ild = (ild1 + ild2 + ild3) ./ 3;
itd = (itd1 + itd2 + itd3) ./ 3;
order = [1 6 4 7 3 8 5 9 2];


ue = [0 0 1/16 1/16 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8];
sita = [1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/16 1/16 0 0];

ild = [-32 -28 -24 -20 ild 20 24 28 32];
pos = [-1.2 -1.2 -1.2 -1 pos 1 1.2 1.2 1.2];


figure(1)
errorbar(ild, pos, sita, ue, '-o')
grid on
ylim([-3/2 3/2])
xlim([-35 35 ])
xlabel('ILD [dB]')
ylabel('�����̈ʒu')
set(gca, 'FontSize', 12)
for i = 5:15
    text(ild(i)-2, pos(i)+0.1, num2str(order(i-4)), 'FontSize', 12);
end

ue = [1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/4 1/4];
sita = [1/4 1/4 1/8 1/8 1/8 1/8 1/8 1/8 1/8];

figure(2)
errorbar(itd, pos, ue, sita, '-o')
grid on
ylim([-5/4 5/4])
xlim([-1500 1500])
xlabel('ITD [��s]')
ylabel('�����̈ʒu')
set(gca, 'FontSize', 12)
for i = 1:9
    text(itd(i)+90, pos(i)-0.1, num2str(order(i)), 'FontSize', 12);
end