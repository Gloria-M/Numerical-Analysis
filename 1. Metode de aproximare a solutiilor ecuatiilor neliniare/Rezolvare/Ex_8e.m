% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_8e.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru calcularea solutiilor ecuatiei pe intervalele date prin
% aplicarea Metodei Pozitiei False.
%

% Definirea functiei 'f'
f = @(x) x .^ 3 - 18 .* x - 10;

% Memorarea intervalelor de lucru sub forma de matrice 'AB'
AB = [-5, -3; -2, 1; 3, 5];

% Declararea erorii de aproximare a solutiei 'epsilon'
epsilon = 10 ^ (-3);

for i = 1 : length(AB)
    
    %     Apelarea functiei 'MetPozFalse' pentru fiecare interval
    xAprox(i) = MetPozFalse (f, AB(i, 1), AB(i, 2), epsilon);
    
    %     Afisarea solutiilor gasite
    fprintf (strcat ('Solutia aproximata prin Metoda Pozitiei False a', ...
        ' ecuatiei x^3 - 18* x - 10 = 0 pe intervalul [%.2f, %.2f]', ...
        ' este x = %.4f.\n\n'), AB(i, 1), AB(i, 2), xAprox(i));
end

% Salvarea solutiilor gasite pentru utilizari ulterioare
save aproximariEx8e xAprox;