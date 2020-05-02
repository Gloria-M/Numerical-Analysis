% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% GaussPivPart.m - Fisier 'function'
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
% partiala
%
function [x] = GaussPivPart(A, b)

[A_tri, b_tri] = SupTri_PartialPivot(A, b);

if A_tri ~= NaN
    x = SubsDesc(A_tri, b_tri);
else
    x = NaN;
end
    
end

