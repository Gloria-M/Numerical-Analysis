% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% MetNR.m - Fisier 'function'
% -------------------------------------------------------------------------
% 
% Date intrare:
%    'f'       = functie definita anterior
%    'df'      = prima derivata a functiei 'f'
%    'x0'      = valoarea initiala a aproximarii solutiei
%    'epsilon' = eroarea de aproximare
% 
% Date iesire:
%    'xAprox'  = valoarea aproximata a solutiei
% 
function xAprox = MtNR (f, df, x0, epsilon)

xi = x0 - f(x0) / df(x0);

% Se considera conditie de oprire valoarea absoluta a functiei 'f' evaluata
% in punctul 'xi' <= eroarea de aproximare 'epsilon'
while abs(f(xi)) > epsilon
    x0 = xi;
    xi = x0 - f(x0) / df(x0);
end

xAprox = xi;
end