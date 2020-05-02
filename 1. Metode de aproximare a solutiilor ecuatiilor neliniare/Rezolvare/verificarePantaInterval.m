% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% verificarePantaInterval.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'A', 'B'  = capetele intervalului in care se cauta solutie
%    'df'      = prima derivata a functiei 'f'
% 
% Date iesire:
%    'evaluare'= 1 / 0, functie de indeplinirea conditiei
% 
% Functia verifica daca 'A' si 'B' se afla pe aceeasi panta a graficului
% functiei prin evaluarea semnului primelor derivate in punctele 'A' si 'B'
% 
function evaluare = verificarePantaInterval(A, B, df)
if df(A) * df(B) > 0
    evaluare = 1;
else
    evaluare = 0;
end
end

