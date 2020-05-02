% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% SubsDesc.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'A'       = matricea coeficientilor unui sistem
%    'b'       = matricea coloana a unui sistem
% 
% Date iesire:
%    'x'       = vectorul solutie a sistemului
%
% Functie pentru aflarea solutiei unui sistem reprezentat de o matrice
% superior triunghiulara prin metoda substitutiei descendente
%
function [x] = SubsDesc(A, b)

x = zeros(1, length(b));
n = length(b);

for i = n : -1 : 1
    x(i) = (b(i) - sum (A(i, 1:n) .* x(1:n)))/ A(i, i);
end
end

