function [tableau, basis] = makeTableau(c,A,b)
n = length(A);
[nr,nc] = size(A);
tableau = zeros(nr+1,length(c)+nr+1);
r1 = [-c',zeros(1,nr+1)];
tableau(1,:) = r1(:)';
tableau(2:nr+1,1:nc)=A;
tableau(2:nr+1,nc+1:size(c)+nr)=eye(nr);
basis = (nc+1:size(c)+nr)';
tableau(2:nr+1, length(c)+nr+1) = b;
end