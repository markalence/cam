function jassis = newtonmethod (f,g)

h = g - f;

derh = polyder(h);

ans = rand(1);
anss = 1;

do

anss = ans;
ans = ans - polyval(h, ans)/polyval(derh, ans);

until abs(ans - anss) < 0.0001

ans

end

