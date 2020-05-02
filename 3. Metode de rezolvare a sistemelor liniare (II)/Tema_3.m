% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------

%% Exercitiul 2b.

A = [4 2 2;
    2 10 4;
    2 4 6];

[invA, detA] = GaussJordan(A);

if detA ~= 0
    
    fprintf('Inversa matricei A este:\nInv(A) = \n');
    disp(invA);
    fprintf('Dterminantul matricei A este det(A) = %f.\n', detA);
    
end


%% Exercitiul 2c.

A = [4 2 2;
    2 10 4;
    2 4 6];

b = [12 30 10]';

[invA, detA] = GaussJordan(A);

if detA ~= 0
    
    x = invA * b;
    fprintf('Solutia sistemului este:\n');
    disp(x');
    
end


%% Exercitiul 5c.

A = [0 1 1;
    2 1 5;
    4 2 1];

b = [3 5 1];

[L, U, x] = FactLU(A, b);

if ~isnan(x)
    
    fprintf('Solutia sistemului este:\n');
    disp(x);
    
end


%% Exercitiul 7b.

A = [1 2 3;
    2 5 8;
    3 8 14];

b = [-5 -14 -25];

[x, L] = FactCholesky(A, b);

if ~isnan(x)
    
    fprintf('Solutia sistemului este:\n');
    disp(x);
    
end


%% Gauss-Jordan

function [invA, detA] = GaussJordan(A)

n = length(A);
I = eye(n);
detA = 1;

for j = 1 : n
    
    if A(j, j) == 0
        pivot = find(A(j:n, j) ~= 0);
        if isempty(pivot)
            
            fprintf ('Matricea A nu este inversabila.\n Determinatul matricei este detA = 0.\n');
            invA = NaN;
            detA = 0;
            return;
        end
        A(j, :) = A(j, :) + A(pivot(1) + j - 1, :);
        I(j, :) = I(j, :) + I(pivot(1) + j - 1, :);
    end
    
    t = 1 / A(j, j);
    A(j, :) = t * A(j, :);
    I(j, :) = t * I(j, :);
    detA = detA / t;
    
    for i = 1 : n
        
        if i ~= j
            t = A(i, j) / A(j, j);
            
            A(i, :) = A(i, :) - t * A(j, :);
            I(i, :) = I(i, :) - t * I(j, :);
        end
    end
end

invA = I;

end


%% FACTORIZAREA LU

function [L, U, x] = FactLU(A, b)

n = length(A);
L = eye(n);

for j = 1 : n-1
    
    [m, ind] = max(abs(A(j:n, j)));
    
    if m == 0
        L = NaN;
        U = NaN;
        x = NaN;
        fprintf ('Sistemul este INCOMPATIBIL sau COMPATIBIL NEDETERMINAT\n');
        return;
    end
    
    if ind ~= 1
        A([j ind+j-1], :) = A ([ind+j-1 j], :);
        b([j ind+j-1]) = b([ind+j-1 j]);
        
        L([j ind+j-1], 1:j-1) = L([ind+j-1 j], 1:j-1);
    end
    
    for i = j + 1 : n
        t = A(i, j) / A(j, j);
        
        A(i, 1:n) = A(i, 1:n) - t * A(j, 1:n);
        
        L(i, j) = t;
    end
end

if A(n, n) ~= 0
    U = A;
else
    L = NaN;
    U = NaN;
    x = NaN;
    
    if b(n) ~=0
        fprintf ('Sistemul este INCOMPATIBIL.\n');
    else
        fprintf ('Sistemul este COMPATIBIL NEDETERMINAT.\n');
    end
end

y = SubsAsc(L, b);
x = SubsDesc(U, y);

end


%% FACTORIZAREA CHOLESKY

function [x, L] = FactCholesky(A, b)

if A == A'
    
    n = length(A);
    L = zeros(n);
    
    for i = 1 : n
        for j = 1 : i
            
            if i == j
                
                if A(i, j) - sum(L(i, 1:i-1).^2) > 0
                    L(i, j) = abs(sqrt(A(i, j) - sum(L(i, 1:i-1).^2)));
                else
                    fprintf ('Nu se poate aplica factorizarea Cholesky asupra matricei A.\n');
                    L = NaN;
                    x = NaN;
                    return;
                end
                
            else
                L(i, j) = 1 / L(j, j) * (A(i, j) - sum(L(i, 1:j-1) .* L(j, 1:j-1)));
            end
        end
    end
else
    fprintf ('Matricea A nu este simetrica.\n');
    L = NaN;
    x = NaN;
    return;
end
x = SubsDesc(L', SubsAsc(L, b));

end


%% SUBSTITUTIA ASCENDENTA

function [x] = SubsAsc(A, b)

x = zeros(1, length(b));
n = length(b);

for i = 1 : n
    x(i) = (b(i) - sum (A(i, 1:n) .* x(1:n)))/ A(i, i);
end

end


%% SUBSTITUTIA DESCENDENTA

function [x] = SubsDesc(A, b)

x = zeros(1, length(b));
n = length(b);

for i = n : -1 : 1
    x(i) = (b(i) - sum (A(i, 1:n) .* x(1:n)))/ A(i, i);
end
end
