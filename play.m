function play(itdild_select, sld_ild, sld_itd)
global i
global ild
global itd
global order
c = 0.1;
if itdild_select == 1
    if i < 6
        if i < 3
            play_itdild(sld_ild.Value, 0);
        elseif i == 3
            play_itdild(ild(1), 0);
            pause(c)
            play_itdild(ild(9), 0);
            pause(c)            
            play_itdild(sld_ild.Value, 0);
        else
            play_itdild(ild(order(i)-2), 0);
            pause(c)
            play_itdild(ild(order(i)+2), 0);
            pause(c)            
            play_itdild(sld_ild.Value, 0);
        end
    else
        play_itdild(ild(order(i)-1), 0);
        pause(c)
        play_itdild(ild(order(i)+1), 0);
        pause(c)            
        play_itdild(sld_ild.Value, 0);
    end
else
    if i < 6
        if i < 3
            play_itdild(0, sld_itd.Value);
        elseif i == 3
            play_itdild(0, itd(1));
            pause(c)
            play_itdild(0, itd(9));
            pause(c)
            play_itdild(0, sld_itd.Value);
        else
            play_itdild(0, itd(order(i)-2));
            pause(c)
            play_itdild(0, itd(order(i)+2));
            pause(c)
            play_itdild(0, sld_itd.Value);
        end
    else
        play_itdild(0, itd(order(i)-1));
        pause(c)
        play_itdild(0, itd(order(i)+1));
        pause(c)
        play_itdild(0, sld_itd.Value);
    end
end
end