function [x,i] = jacobi(A,b,x0,tol)

n = length(A);
check = 0;
bool = 2;

for i = 1:n
x(i) = x0;
end
iterations = 0;

xold = x;

while bool ~=1

for i = 1:n
for j = 1:n

if j == i
continue
end

check = check +1;

if check == 1
x(i) =  b(i) - A(i,j)*xold(j);
end

if check ~= 1 && check ~= n-1
x(i) = x(i) - (A(i,j)*xold(j));

end

if check == n-1
x(i) = x(i) - xold(j) * A(i,j);
x(i) = x(i)/A(i,i);
end

end

check = 0;

for k = 1:n
if abs(x(k) - xold(k))>tol
bool = 0;
end

if abs(x(k) - xold(k))<tol
bool = 1;
end
end


if i==3 

iterations = iterations + 1;

end

end
xold(:) = x(:);
end

track = 0;
for i = 1:n
lol(i) =  x(i);
end

x = [x,iterations];


end