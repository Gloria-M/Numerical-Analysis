% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_3b.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru calcularea solutia ecuatiei pe intervalul dat prin
% aplicarea Metodei Bisectiei.
%

% Definirea functiilor ce intra in componenta ecuatiei pentru care cautam
% solutie
y1 = @(x) exp(x) - 2;
y2 = @(x) cos (exp(x) - 2);
f = @(x) y1(x) - y2(x);

% Definirea erorii de aproximare
epsilon = 1e-5;

% Definirea intervalului [A, B]
A = 0.5;
B = 1.5;

% Calcularea solutiei aproximate prin apelarea functiei 'MetBisectie'
[xAprox, N] = MetBisectie(f, A, B, epsilon);

% Afisarea solutiei gasite
fprintf (strcat ('Solutia ecuatiei e^x - 2 - cos(e^x - 2) = 0 pe ', ...
    ' intervalul [%.2f, %.2f] este x = %.4f.\n\n'), A, B, xAprox);

% Salvarea valorii gasite pentru utilizari ulterioare
save aproximariEx3b xAprox N;