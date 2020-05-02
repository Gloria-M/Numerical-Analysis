% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% verificareConvergenta.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'x0'      = valoarea initiala a aproximarii solutiei
%    'df'      = prima derivata a functiei 'f'
% 
% Date iesire:
%    'evaluare'= 1 / 0, functie de indeplinirea conditiei
% 
% Functia verifica daca tangenta dusa prin f(x0) la graficul functiei 'f'
% intersecteaza axa Ox in proximitatea solutiei prin evaluarea primei
% derivate a functiei in punctul 'x0'
% 
function evaluare = verificareConvergenta(x0, df)

% Se considera ca tangenta converge spre o solutie a ecuatiei daca valoarea
% absoluta a primei derivate in punctul 'x0' >= valoarea aleasa 1e-1
if abs(df(x0)) < 1e-1
    evaluare = 0;
else
    evaluare = 1;
end
end

