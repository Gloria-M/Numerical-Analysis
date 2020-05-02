% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% MetSecantei.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'f'       = functie definita anterior
%    'A', 'B'  = capetele intervalului in care se cauta solutie
%    'x0', 'x1'= valoari initiale ale aproximarii solutiei
%    'epsilon' = eroarea de aproximare
% 
% Date iesire:
%    'xAprox'  = valoarea aproximata a solutiei
% 

function xAprox = MetSecantei(f, A, B, x0, x1, epsilon)

% Mai intai se verifica existenta unei solutii in intervalul [A, B]
% prin aplarea functiei 'verificareIntersectieOx'
if verificareIntersectieOx (A, B, f) == 1
    
% Se considera conditie de oprire valoarea absoluta a functiei 'f' evaluata
% in punctul 'x' <= eroarea de aproximare 'epsilon'
    while abs(f(x1)) > epsilon
        x = (x0 * f(x1) - x1 * f(x0)) / (f(x1) - f(x0));
        x0 = x1;
        x1 = x;
    end
    xAprox = x;
else
    return;
end
end

