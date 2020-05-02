% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_2b.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru calcularea solutiilor ecuatiei pe intervalele date prin
% aplicarea Metodei Bisectiei.
%

% Definirea functiei 'f'
f = @(x) x.^3 -7 .* x.^2 + 14 .* x - 6;

% Memorarea intervalelor de lucru sub forma de matrice 'AB'
AB = [ 0, 1; 1, 3.2; 3.2, 4 ];

% Declararea erorii de aproximare a solutiei 'epsilon'
epsilon = 1e-5;

for i = 1 : size(AB, 1)
    
    % Apelarea functiei MetBisectie pentru fiecare interval
    [xAprox(i), N(i)] = MetBisectie(f, AB(i, 1), AB(i, 2), epsilon);
    
    %     Afisarea solutiilor gasite
    fprintf (strcat ('Solutia aproximata prin Metoda Bisectiei a', ...
        ' ecuatiei x^3 - 7* x^2 + 14* x - 6 = 0 pe intervalul', ...
        ' [%.2f, %.2f] este x = %.4f.\n\n'), AB(i, 1), AB(i, 2), xAprox(i));
end

% Salvarea solutiilor gasite pentru utilizari ulterioare
save aproximariEx2b xAprox N;