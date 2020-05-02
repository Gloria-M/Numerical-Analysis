% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% GaussFaraPiv.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'A'       = matricea coeficientilor unui sistem
%    'b'       = matricea coloana a unui sistem
% 
% Date iesire:
%    'x'       = vectorul solutie a sistemului
%
% Functie pentru rezolvarea unui sistem prin metoda Gauss fara pivotare
%
function [x] = GaussFaraPiv(A, b)

[A_tri, b_tri] = SupTri_faraPivot(A, b);

if A_tri ~= NaN
    x = SubsDesc(A_tri, b_tri);
else
    x = NaN;
end
    
end

