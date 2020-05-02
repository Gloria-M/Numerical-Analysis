% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_4.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru calcularea solutiei aproximate pentru sqrt(3) prin
% aplicarea Metodei Bisectiei
%

% Definirea functiei pentru care cautam radacina
f = @(x) x.^2 - 3;
% Definirea erorii de aproximare
epsilon = 1e-5;
% Definirea intervalului [A, B] in care cautam solutie
A = 1;
B = 2;

% Calcularea solutiei aproximate prin apelarea functiei 'MetBisectie'
[xAprox, N] = MetBisectie(f, A, B, epsilon);

% Afisarea solutiei gasite
fprintf (strcat ('Valoarea aproximata prin Metoda Bisectiei pentru', ...
    ' sqrt(3) este x = %.4f.\n\n'), xAprox);