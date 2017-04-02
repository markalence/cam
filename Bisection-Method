function aw = bis(A,b,c)


pm=b;
pp=c;


do

if polyval(A,(pm+pp)/2)/polyval(A,pm) < 0
pp = (pp+pm)/2;


elseif polyval(A,(pm+pp)/2)/polyval(A,pm) > 0
pm = (pp+pm)/2;
endif



until abs (polyval(A, pp) - polyval(A, pm))<0.00001 || polyval(A,(pm+pp)/2) == 0



if polyval(A,(pm+pp)/2) == 0
(pm+pp)/2


else 
ans = pm

endif
end

