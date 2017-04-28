function [x,z] = readSolution(T, b)
[nr, nc] = size(T);
x = zeros(1, nc-1);
x(1,b(1):b(length(b)))=T(2:nr, nc);
x = x';
z = T(1,nc);
end



