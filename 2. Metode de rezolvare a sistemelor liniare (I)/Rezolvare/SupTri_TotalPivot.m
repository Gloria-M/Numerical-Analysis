% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% SupTri_TotalPivot.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'A'           = matricea coeficientilor unui sistem
%    'b'           = matricea coloana a unui sistem
% 
% Date iesire:
%    'A_Tri'       = matricea superior triunghiulara a unui sistem 
%    'b_Tri'       = matricea coloana a unui sistem modificata corespunzator
%    'v_Permutari' = vector in care am retinut interschimbarile coloanelor
%
% Functie pentru transformarea matricei coeficientilor unui sistem in
% matrice superior triunghiulara prin metoda Gauss cu pivotare totala
%
function [A_Tri, b_Tri, v_Permutari] = SupTri_TotalPivot(A, b)
n = length (A);
permutari = 1 : n;
for j = 1 : n-1
    
    [m, iInd] = max (abs(A(j:n, j:n)));
    [m, jInd]= max (abs (m));
    
    if m == 0
        A_Tri = NaN;
        b_Tri = NaN;
        v_permutari = NaN;
        fprintf ('Sistemul este INCOMPATIBIL sau COMPATIBIL NEDETERMINAT\n');
        return;
    end
    
    iMax = iInd(jInd) + j - 1;
    jMax = jInd + j - 1;
    
    if iMax ~= j
        A([j iMax], :) = A ([iMax j], :);
        b([j iMax]) = b([iMax j]);
    end
    
    if jMax ~= j
        A(: ,[j jMax]) = A (:, [jMax j]);
        permutari([j jMax]) = permutari([jMax j]);
    end
    
    for i = j + 1 : n
        t = A(i, j) / A(j, j);
        
        A(i, 1:n) = A(i, 1:n) - t * A(j, 1:n);
        b(i) = b(i) - t * b(j);
    end
end

if A(n, n) ~= 0
    A_Tri = A;
    b_Tri = b;
    v_Permutari = permutari;
else
    A_Tri = NaN;
    b_Tri = NaN;
    v_Permutari = NaN;
    
    if b(n) ~=0
        fprintf ('Sistemul este INCOMPATIBIL.\n');
    else
        fprintf ('Sistemul este COMPATIBIL NEDETERMINAT.\n');
    end
end

end

