% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% verificareNR.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'A', 'B'  = capetele intervalului in care se cauta solutie
%    'x0'      = valoarea initiala a aproximarii solutiei
%    'f'       = functie definita anterior
%    'df'      = prima derivata a functiei 'f'
%    'ddf'     = a doua derivata a functiei 'f'
% 
% Date iesire:
%    'evaluare'= 1 / 0, functie de indeplinirea conditiei
% 
% Functia verifica indeplinirea conditiilor necesare pentru aplicarea
% metodei Newton-Raphson in scopul gasirii solutiei
% 
function evaluareNR = verificareNR(A, B, x0, f, df, ddf)

% Mai intai se verifica existenta unei solutii in intervalul [A, B]
% prin aplarea functiei 'verificareIntersectieOx'
if verificareIntersectieOx (A, B, f) == 1
    
% Se verifica situarea pe aceeasi panta pentru capetele intervalului ales
    if verificarePantaInterval (A, B, df) == 1
        evaluare = 1;
        % Intervalul [A, B] ales este corect.
        
    else
        % Pe intervalul [A, B] ales, graficul functiei are mai multe
        % pante si contine x punct critic.
            
% Se verifica daca tangenta dusa prin 'x0' la graficul functiei 'f'
% intersecteaza axa Ox in intervalul [A, B]
        if verificareApartenentaSolutie (x0, f, ddf) == 1
            
            evaluare = 1;
            % Pornind de la x0 ales, solutia aproximata se va gasi in
            % intervalul [A, B].
            
        else
            % Pornind de la x0 ales, solutia aproximata nu se va gasi in
            % intervalul [A, B].
            
            evaluare = 0;
            fprintf ('\tAlegeti alta valoare x0.\n');
            
        end
    end
    
else
    % In intervalul [A, B] ales pot exista ori mai multe solutii ale
    % ecuatiei, ori nicio solutie.
    
    evaluare = 0;
end

if evaluare == 1
    % Intervalul ales este corect
    % Vrificare a punctului x0
        
% Se verifica starea punctului x0
    evaluareNR = verificareX0_NR(x0, df);
else
    % Intervalul ales nu este corect
    evaluareNR = 0;
    fprintf ('Alegeti alte valori pentru intervalul [A, B].\n\n');
end

