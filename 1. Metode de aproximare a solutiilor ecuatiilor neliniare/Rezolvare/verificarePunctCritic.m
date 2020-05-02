% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% verificarePunctCritic.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'x0'      = valoarea initiala a aproximarii solutiei
%    'df'      = prima derivata a functiei 'f'
% 
% Date iesire:
%    'evaluare'= 1 / 0, functie de indeplinirea conditiei
% 
% Functia verifica conditia de punct critic pentru 'x0'
% 
function evaluare = verificarePunctCritic(x0, df)
if df(x0) == 0
    evaluare = 0;
else
    evaluare = 1;
end    
end

