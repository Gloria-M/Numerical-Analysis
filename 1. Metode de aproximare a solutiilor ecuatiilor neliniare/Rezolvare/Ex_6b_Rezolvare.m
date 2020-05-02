% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_6b.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru calcularea solutiilor functiei pe intervalele date prin
% aplicarea Metodei Newton-Raphson
%

% Definirea functiei 'f'
% Definirea derivatei intai 'df'
% Definirea derivatei a doua 'ddf'
f = @(x) x.^3 -7 .* x.^2 + 14 .* x - 6;
df = @(x) 3.*x.^2 - 14 .* x + 14;
ddf = @(x) 6 .* x - 14;

% Definirea erorii de aproximare
epsilon = 10^(-3);

% Memorarea intervalelor de lucru sub forma de matrice 'AB'
AB = [0, 1.2; 2, 3.2; 3.3, 4];

% Memorarea punctelor initiale sub forma de vector 'x0'
x0 = [1, 2.5, 3.5];

for i = 1 : length(x0)
    
    A = AB(i, 1);
    B = AB(i, 2);
    x = x0(i);
    
    % Verificarea indeplinirii conditiilor necesare aplicarii metodei NR
    if verificareNR (A, B, x, f, df, ddf) == 1
        
        %      Apelarea functie 'MetNR' pentru fiecare x0 verificat
        xAprox(i) = MetNR (f, df, x, epsilon);
        
        %      Afisarea solutiilor gasite
        fprintf (strcat ('Solutia ecuatiei x^3 - 7* x^2 + 14* x - 6 = 0 pe ',...
            ' intervalul [%.2f, %.2f] este x = %.4f.\n\n'), A, B, xAprox(i));
    end
end

% Salvarea solutiilor gasite pentru utilizari ulterioare
save aproximariEx6b xAprox;