% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% SupTri_faraPivot.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'A'       = matricea coeficientilor unui sistem
%    'b'       = matricea coloana a unui sistem
% 
% Date iesire:
%    'A_Tri'   = matricea superior triunghiulara a unui sistem 
%    'b_Tri'   = matricea coloana a unui sistem modificata corespunzator
%
% Functie pentru transformarea matricei coeficientilor unui sistem in
% matrice superior triunghiulara prin metoda Gauss fara pivotare
%
function [A_Tri, b_Tri] = SupTri_faraPivot(A, b)

n = length (A);

for j = 1 : n
    
    k = j;
    while (k < n+1) && (A(k, j) == 0)
        k = k + 1;
    end
    
    if k > n
        A_Tri = NaN;
        b_Tri = NaN;
        fprintf ('Sistemul este INCOMPATIBIL sau COMPATIBIL NEDETERMINAT\n');
        return;
    end
    
    if k ~= j
        A([j k], :) = A ([k j], :);
        b([j k]) = b([k j]);
    end
    
    for i = j + 1 : n
        t = A(i, j) / A(j, j);
        
        A(i, 1:n) = A(i, 1:n) - t * A(j, 1:n);
        b(i) = b(i) - t * b(j);
    end
end

if A(n, n)~=0
    A_Tri = A;
    b_Tri = b;
else
    A_Tri = NaN;
    b_Tri = NaN;
    
    if b(n) ~=0
        fprintf ('Sistemul este INCOMPATIBIL.\n');
    else
        fprintf ('Sistemul este COMPATIBIL NEDETERMINAT.\n');
    end
end

end

