% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% verificareX0_NR.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'x0'      = valoarea initiala a aproximarii solutiei
%    'df'      = prima derivata a functiei 'f'
% 
% Date iesire:
%    'evaluare'= 1 / 0, functie de indeplinirea conditiei
% 
% Functia verifica daca punctul 'x0' ales indeplineste conditiile necesare
% pentru aplicarea metodei Newton-Raphson in scopul gasirii solutiei
% 
function evaluare = verificareX0_NR (x0, df)
    
% Se verifica daca f(x0) este sau nu punct critic al graficului functiei
if verificarePunctCritic (x0, df) == 1
        
% Se verifica daca tangenta dusa prin 'x0' converge spre solutie
    if verificareConvergenta (x0, df) == 1
        % Punctul x0 ales nu are f(x0) prea aproape de un punct critic al 
        % graficului functiei.
        
        evaluare = 1;
    else
        % Punctul x0 ales are f(x0) foarte aproape de un punct critic al 
        % graficului functiei, astfel sirul aproximarilor (xk)k nu va
        % converge spre o solutie a ecuatiei.
        
        evaluare = 0;
    end
else 
    % Punctul x0 ales are f(x0) punct critic al graficului functiei, astfel
    % tangenta dusa prin el va fi paralela cu axa Ox.
    
    evaluare = 0;
end
end

