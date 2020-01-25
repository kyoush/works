function decision(itdild_select, sld)
global i
global ild
global itd
global pos
global order
global name
global num

if itdild_select == 1
    ild(order(i)) = sld.Value;

    ild_min = -15 - randi(13);

    sld.Limits = [ild_min ild_min+44];
    sld.Value = randi([ild_min ild_min+44]);
    
else
    itd(order(i)) = sld.Value;

    itd_min = -1499 - randi(1001);

    sld.Limits = [itd_min itd_min+4000];
    sld.Value = randi([itd_min itd_min+4000]);
    
end
if i == 9
    if itdild_select == 1
        figure(2)
        plot(ild, pos, '-o')
        xlabel('ILD [dB]')
        ylabel('“ª“à‚Å‚Ì‰¹‘œ‚ÌˆÊ’u')
        grid on
        set(gca, 'FontSize', 14)
        set(gca, 'XLim', [-20 20]);
        set(gca, 'YLim', [-5/4 5/4]);
        filename = strcat(name, '_ild');
        save(filename, 'ild', 'num');
        disp('save ild')
    else
        figure(2)
        plot(itd, pos, '-o')
        xlabel('ITD [ƒÊs]')
        ylabel('“ª“à‚Å‚Ì‰¹‘œ‚ÌˆÊ’u')
        grid on
        set(gca, 'FontSize', 14)
        set(gca, 'XLim', [-1500 1500]);
        set(gca, 'YLim', [-5/4 5/4]);
        filename = strcat(name, '_itd');
        save(filename, 'itd', 'num');
        disp('save itd')
    end
    i = 3;
else
    i = i + 1;
end
end