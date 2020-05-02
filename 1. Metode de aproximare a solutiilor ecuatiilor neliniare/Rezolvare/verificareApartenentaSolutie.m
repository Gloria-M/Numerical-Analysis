% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% verificareApartenentaSolutie.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'x0'      = valoarea initiala a aproximarii solutiei
%    'f'       = functie definita anterior
%    'df'      = prima derivata a functiei 'f'
% 
% Date iesire:
%    'evaluare'= 1 / 0, functie de indeplinirea conditiei
% 
% Functia verifica daca tangenta dusa prin f(x0) la graficul functiei 'f'
% intersecteaza axa Ox in intervalul [A, B]
% 
function evaluare = verificareApartenentaSolutie(x0, f, ddf)
if f(x0) * ddf(x0) < 0
    evaluare = 0;
    fprintf ('Solutia aproximata nu va apartine intervalului ales.\n');
else
    evaluare = 1;
end
end

