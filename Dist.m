function r = Dist(p1,p2)
r = 0;
for i = 1 : length(p1)
    r = r + (p1(i) - p2(i)) * (p1(i) - p2(i));
end
r = sqrt(r);
end
