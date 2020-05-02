% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% MetPozFalse.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'f'       = functie definita anterior
%    'A', 'B'  = capetele intervalului in care se cauta solutie
%    'epsilon' = eroarea de aproximare
% 
% Date iesire:
%    'xAprox'  = valoarea aproximata a solutiei
% 
function xAprox = MetPozFalse(f, A, B, epsilon)

% Mai intai se verifica existenta unei solutii in intervalul [A, B]
% prin aplarea functiei 'verificareIntersectieOx'
if verificareIntersectieOx (A, B, f) == 1
    x = (A * f(B) - B * f(A)) / (f(B) - f(A));
    
% Se considera conditie de oprire valoarea absoluta a functiei 'f' evaluata
% in punctul 'x' <= eroarea de aproximare 'epsilon'
    while abs(f(x)) > epsilon
        if f(A) * f(x) < 0
            B = x;
        else
            A = x;
        end
        x = (A * f(B) - B * f(A)) / (f(B) - f(A));
    end
    xAprox = x;
else
    return;
end
end

