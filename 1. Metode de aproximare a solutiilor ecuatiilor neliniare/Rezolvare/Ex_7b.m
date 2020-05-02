% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_7b.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru calcularea solutiilor ecuatiei pe intervalul dat prin
% aplicarea Metodei Newton-Raphson, Metodei Secantei si Metodei Pozitiei
% False
%

% Definirea functiei 'f'
% Definirea derivatei intai 'df'
% Definirea derivatei a doua 'ddf'
f = @(x) 8 .* x.^3 + 4 .* x - 1;
df = @(x) 16.*x.^2 + 4;
ddf = @(x) 32 .* x;

% Definirea erorii de aproximare
epsilon = 1e-3;

% Definirea intervalului [A, B]
A = 0;
B = 1;


% Definirea punctului initial 'NRx0'
NRx0 = 0.5;
% Aplicarea Metodei Newton-Raphson pentru valoarea initiala aleasa
x1NR = NRx0 - f(NRx0) / df(NRx0);
x2NR = x1NR - f(x1NR) / df(x1NR);

% Afisarea solutiei gasite
fprintf (strcat ('Solutia x2 aproximata prin Metoda Newton-Raphson a', ...
    ' ecuatiei 8* x^3 + 4* x - 1 = 0 pe intervalul [%.2f, %.2f]', ...
    ' este x = %.4f.\n\n'), A, B, x2NR);


% Definirea punctelor initiale 'Sx0' si 'Sx1'
Sx0 = 0;
Sx1 = 1;
% Aplicarea Metodei Secantei pentru punctele initiale alese
x2S = (Sx0 * f(Sx1) - Sx1 * f(Sx0)) / (f(Sx1) - f(Sx0));

% Afisarea solutiei gasite
fprintf (strcat ('Solutia aproximata prin Metoda Secantei a', ...
    ' ecuatiei 8* x^3 + 4* x - 1 = 0 pe intervalul [%.2f, %.2f]', ...
    ' este x = %.4f.\n\n'), A, B, x2S);


% Apelarea Metodei Pozitiei False pentru intervalul ales
x0PF = (A * f(B) - B * f(A)) / (f(B) - f(A));
if f(A) * f(x0PF) < 0
    B = x0PF;
else
    A = x0PF;
end
x1PF = (A * f(B) - B * f(A)) / (f(B) - f(A));

if f(A) * f(x1PF) < 0
    B = x1PF;
else
    A = x1PF;
end
x2PF = (A * f(B) - B * f(A)) / (f(B) - f(A));

% Afisarea solutiei gasite
fprintf (strcat ('Solutia aproximata prin Metoda Pozitiei False a', ...
    ' ecuatiei 8* x^3 + 4* x - 1 = 0 pe intervalul [0, 1]', ...
    ' este x = %.4f.\n\n'), x2PF);