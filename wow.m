function Ans = wow(A,B)

n = length(A);
poo =size(B);
l=poo(2);
for k = 1:1:l

C = [A, B(:,k)];


for i = 2:n


C(i,:) = C(i,:) - (C(i,1)/C(1,1))*C(1,:);
x= sum(C(i,:)==0);
if x ~= i-1
C([i, x+1],:) = C([x+1, i],:);
C(i,:) = C(i,:) - (C(i,1)/C(1,1))*C(1,:);
end

end


for i = 3:1:n
for j = 2:i-1

C(i, :) = C(i, :) - (C(i,j)/C(j,j))*C(j, :);


end

j = 2;

end


d = C(n,n+1)/C(n,n);
z = zeros(n,1);
Z(n,1)=d;

for j = n:-1:2

C(:,n+1) = C(:,n+1)- C(:,j)*d;
C(:,j) = 0;
d = C(j-1,n+1)/C(j-1,j-1);
Z(j-1)=d;

end
Z

end