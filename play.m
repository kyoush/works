function play(itdild_select, sld)
global i
global ild
global itd
global order
global num
c = 1.1;
num(i) = num(i) + 1;
if itdild_select == 1
    if i < 6
        if i == 3
            play_itdild(ild(order(i)-4), 0);
            pause(c)
            play_itdild(ild(order(i)+4), 0);
            pause(c)
            play_itdild(sld.Value, 0);
        else
            play_itdild(ild(order(i)-2), 0);
            pause(c);
            play_itdild(ild(order(i)+2), 0);
            pause(c);
            play_itdild(sld.Value, 0);
        end
    else
        play_itdild(ild(order(i)-1), 0);
        pause(c)
        play_itdild(ild(order(i)+1), 0);
        pause(c)
        play_itdild(sld.Value, 0);
    end
else
    if i < 6
        if i == 3
            play_itdild(0, itd(order(i)-4));
            pause(c)
            play_itdild(0, itd(order(i)+4));
            pause(c)
            play_itdild(0, sld.Value);
        else
            play_itdild(0, itd(order(i)-2));
            pause(c)
            play_itdild(0, itd(order(i)+2));
            pause(c)
            play_itdild(0, sld.Value);
        end
    else
        play_itdild(0, itd(order(i)-1));
        pause(c)
        play_itdild(0, itd(order(i)+1));
        pause(c)
        play_itdild(0, sld.Value);
    end
end
end