% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% GaussPivTot.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'A'       = matricea coeficientilor unui sistem
%    'b'       = matricea coloana a unui sistem
% 
% Date iesire:
%    'x'       = vectorul solutie a sistemului
%
% Functie pentru rezolvarea unui sistem prin metoda Gauss cu pivotare
% totala
%
function [x] = GaussPivTot(A, b)

[A_tri, b_tri, v_tri] = SupTri_TotalPivot(A, b);

if A_tri ~= NaN    
    solSubs = SubsDesc(A_tri, b_tri);
    
    x = zeros(1, length(v_tri));
    
    for i = 1 : length(v_tri)
        x(v_tri(i)) = solSubs(i);
    end
else
    x = NaN;
end

end

