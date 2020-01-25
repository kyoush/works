function [r, l] = const(c)
if c == inf
    r = 2;
    l = 0;
else
    r = (2 .* 10.^(c./20))./(1 + 10.^(c./20));
    l = 2 ./ (1 + 10.^(c./20));
end
end