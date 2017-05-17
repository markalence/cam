function solution = simplexMethod(tableau, basis)
 
    lame = 0;
    copytable = tableau;
    copybasis = basis;
 
 
 
    function pivotElement = getPivot(tableau,basis)
        [nr, nc] = size(tableau);
        tableau2 = tableau;
        l = tableau(1, 1);
        tableau = tableau(1, 1:nc - 1);
        counter = 0;
        for i = 2:nc - 1
              if ismember(i,basis)
              continue
                end
            if tableau(i) < l
                counter = counter + 1;
                l = tableau(i);
                pivotCol = i;
            end
        end
        if counter == 0
            pivotCol = 1;
        end
        piv = tableau2(2:nr, pivotCol);
        b = tableau2(2:nr, nc);
        for i = 2:nr
            if b(i - 1) == 0
                vec(i - 1) = - 1;
                continue
            end
            vec(i - 1) = b(i - 1)/piv(i-1);
        end
        if vec(:) < 0
            pivotRow = 0;
            pivotElement = 1;
            return
        end
        l = max(vec);
        for i = 1:length(vec)
            if vec(:) < 0
                pivotElement = 0
            end
            if vec(i) < 0
                continue
            end
            if vec(i) < l
                l = vec(i);
            end
        end
        pivotRow = find(vec == l);
        pivotElement = [pivotRow, pivotCol]';
    end
 
 
    function newSimplex = updateTableau(tableau, basis, pivotElement)
        c = pivotElement(2, 1);
        basis(pivotElement(1)) = c;
        newBasis = basis;
        c = tableau(pivotElement(1) + 1, :);
        c = c(1, :) / c(1, pivotElement(2));
        [m, n] = size(tableau);
        for k = 1:m
            g = tableau(k, pivotElement(2)) / c(pivotElement(2));
            tableau(k, :) = tableau(k, :) - g * c;
        end
        tableau(pivotElement(1) + 1, :) = c;
        newSimplex = tableau;
    end
 
 
 
 
    function check = checkifalt(tableau, basis)
        check = 0;
        for j = 1:columns(tableau) - 1
            if tableau(1, j) == 0 && ismember(j, basis) == 0
                check = 1;
                break
            end
        end
    end
 
 
 
 
 
    function answer = findSolution(tableau, basis)
     
        x = zeros(1, length(tableau(1, :)) - 1);
        counter = 0;
        for i = 1:columns(tableau) - 1
         
            if ismember(i, basis) ~= 0
                [r, c] = find(1 == tableau(:, i));
                x(i) = tableau(r, columns(tableau));
             
            else
                x(i) = 0;
            end
        end
        answer = x;
    end
 
 
 
    function newBasis = updateBasis(basis, pivotElement)
        basis(pivotElement(1)) = pivotElement(2);
        basis = sort(basis);
        newBasis = basis;
     
    end
 
 
 
 
 
 
 function ans = newerBasis(tableau)

count = 0;
for i = 1:columns(tableau)
if length(find(0==tableau(:,i)))==rows(tableau)-1 && length(find(1==tableau(:,i)))==1
count++;
basis(count) = i;
end
end
ans = basis';
end
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
    solutionthusfar = zeros(columns(tableau) - 1, 1);
    wot = 0;
 
    do
 
    x = getPivot(tableau,basis);
 
 
    if x == 1
        solution = 0;
        return
    end
 
 
    tableau = updateTableau(tableau, basis, x);
    basis = newerBasis(tableau);
    y = findSolution(tableau, basis);
 
 
    z = copytable(1, 1:copybasis(1) - 1);
    a = x(1, 1:copybasis(1) - 1)';
    if checkifalt(tableau, basis, copybasis) == 0
        break
     
    end
 
 
 
    if tableau(1, :) >= 0 && checkifalt(tableau, basis) == 1
        wot++;
        solutionthusfar(:, wot) = y';
        
    end
 
    if wot > 1
        break
        end
 
    until 1 == 2
    
    [nr,nc] = size(solutionthusfar);
    
    if nc ==1
    z = copytable(1, 1:copybasis(1) - 1);
    a = x(1, 1:copybasis(1) - 1)';
    solution = [y, - z * a]';
   
 end
 
 if nc == 2
 solution(:,1) = [solutionthusfar(:,1); -z*a]';
 solution(:,2) = [solutionthusfar(:,2);-z*a]';
 end
 
end





