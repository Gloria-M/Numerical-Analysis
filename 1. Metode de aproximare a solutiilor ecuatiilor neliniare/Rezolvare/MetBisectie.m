% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% MetBisectiei.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'f'       = functie definita anterior
%    'A', 'B'  = capetele intervalului in care se cauta solutie
%    'epsilon' = eroarea de aproximare
% 
% Date iesire:
%    'xAprox'  = valoarea aproximata a solutiei
%    'N'       = numarul de iteratii efectuate pana la gasirea 'xAprox'
% 
function [xAprox, N] = MetBisectie(f, A, B, epsilon)

% Mai intai se verifica existenta unei solutii in intervalul [A, B]
% prin aplarea functiei 'verificareIntersectieOx'
if verificareIntersectieOx (A, B, f) == 1
    a(1) = A;
    b(1) = B;
    x(1) = (a(1) + b(1)) / 2;
    N = floor (log2 ((B - A) / epsilon));
    
% Se considera conditie de oprire un numar de iteratii efectuate = 'N'
% sau o valoare nula a functiei 'f' evaluata in punctul 'xk-1'
    for k = 2 : N + 1
        if (f(x(k-1)) == 0)
            x(k) = x(k-1);
            break;
        elseif (f(a(k-1)) * f(x(k-1)) < 0)
            a(k) = a(k-1);
            b(k) = x(k-1);
            x(k) = (a(k) + b(k)) / 2;
        else
            a(k) = x(k-1);
            b(k) = b(k-1);
            x(k) = (a(k) + b(k)) / 2;
        end
    end
    
    xAprox = x(k);
else
    return;
end
end