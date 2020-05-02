% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_8d.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru calcularea solutiilor ecuatiei pe intervalele date prin
% aplicarea Metodei Secantei.
%

% Definirea functiei 'f'
f = @(x) x .^ 3 - 18 .* x - 10;

% Memorarea intervalelor de lucru sub forma de matrice 'AB'
AB = [-5, -3; -2, 1; 3, 5];
% Memorarea punctelor initiale sub forma de vectori 'x0' si 'x1'
x0 = [-4, -2, 3];
x1 = [-3, 0, 5];

% Declararea erorii de aproximare a solutiei 'epsilon'
epsilon = 10 ^ (-3);

for i = 1 : length(x0)
    
    %     Apelarea functiei 'MetSecantei' pentru fiecare interval si valorile
    %     initiale corespunzatoare
    xAprox(i) = MetSecantei (f, AB(i, 1), AB(i, 2), x0(i), x1(i), epsilon);
    
    %     Afisarea solutiilor gasite
    fprintf (strcat ('Solutia aproximata prin Metoda Secantei a', ...
        ' ecuatiei x^3 - 18* x - 10 = 0 pe intervalul [%.2f, %.2f]', ...
        ' este x = %.4f.\n\n'), AB(i, 1), AB(i, 2), xAprox(i));
end

% Salvarea solutiilor gasite pentru utilizari ulterioare
save aproximariEx8d xAprox;