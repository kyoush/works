function decision(itdild_select, label, sld_ild, sld_itd)
global i
global ild
global itd
global pos
global order
if itdild_select == 1
    ild(order(i)) = sld_ild.Value;
else
    itd(order(i)) = sld_itd.Value;
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
    else
        figure(2)
        plot(itd, pos, '-o')
        xlabel('ITD [ƒÊs]')
        ylabel('“ª“à‚Å‚Ì‰¹‘œ‚ÌˆÊ’u')
        grid on
        set(gca, 'FontSize', 14)
        set(gca, 'XLim', [-1000 1000]);
        set(gca, 'YLim', [-5/4 5/4]);
    end
        
    i = 1;
else
    i = i + 1;
end
label.Text = num2str(pos(order(i)));
end