% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% verificareIntersectieOx.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'A', 'B'  = capetele intervalului in care se cauta solutie
%    'f'       = functie definita anterior
% 
% Date iesire:
%    'evaluare'= 1 / 0, functie de indeplinirea conditiei
% 
% Functia verifica daca graficul functiei 'f' pe intervalul [A, B]
% interscteaza axa Ox prin calculare semnelor valorilor f(A) si f(B)
% 
function evaluare = verificareIntersectieOx(A, B, f)
if f(A) * f(B) < 0
    evaluare = 1;
else
    evaluare = 0;
end
end

