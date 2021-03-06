clear
close all force

y = [-1 -3/4 -1/2 -1/4 0 1/4 1/2 3/4 1];

ild1 = [-16 -10 -6 -4 0 2 5 9 18];
ild2 = [-16 -9 -6 -3 0 3 6 11 17];
ild3 = [-16 -9 -6 -3 0 4 6 10 16];

itd1 = [-794 -408 -249 -91 0 113 272 476 816];
itd2 = [-748 -408 -295 -113 0 113 249 476 839];
itd3 = [-771 -431 -204 -91 0 136 249 454 794];
    
ild = ild1 + ild2 + ild3;
ild = ild ./ 3;

itd = itd1 + itd2 + itd3;
itd = itd ./ 3;

figure(1)
plot(ild, y, '-o');
ylim([-5/4 5/4]);
yticks([-1 -3/4 -1/2 -1/4 0 1/4 1/2 3/4 1]);
yticklabels({'-1' '-3/4' '-1/2' '-1/4' '0' '1/4' '1/2' '3/4' '1'});
grid on
xlabel('ILD [dB]');
ylabel('頭内での音像の位置');
ax = gca;
ax.FontSize = 12;

figure(2)
plot(itd1, y, '-o');
xlim([-1000 1000]);
ylim([-5/4 5/4]);
yticks([-1 -3/4 -1/2 -1/4 0 1/4 1/2 3/4 1]);
yticklabels({'-1' '-3/4' '-1/2' '-1/4' '0' '1/4' '1/2' '3/4' '1'});
xticks([-1000 -800 -600 -400 -200 0 200 400 600 800 1000]);
grid on
xlabel('ITD [μs]');
ylabel('頭内での音像の位置');
ax = gca;
ax.FontSize = 12;