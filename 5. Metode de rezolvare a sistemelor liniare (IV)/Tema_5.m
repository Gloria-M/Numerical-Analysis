
% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------

%% EXERCITIUL 1a.

A = [3 1 1;
    1 3 1;
    1 1 3];

% Am memorat in vectorul 'p' normele pe care le calculam
p = [1 2 Inf];

for i = 1:3
    % Apelam functia 'NormaP' pentru a calcula normele 'p(i)' ale matricei
    % 'A', salvam rezultatele in vectorul 'norma' si le afisam
    norma(i) = NormaP(A, p(i));
    fprintf('\nNorma-%d a matricei A este:\n\t ||A|| = %f\n', p(i), norma(i));
    
end


%% EXERCITIUL 1b.

A = [3 1 1;
    1 3 1;
    1 1 3];
% Pentru calculul razei spectrale, folosim valorile proprii ale matricei
% 'A' calculate prin 'MetJacobiEig', cu toleranta 1e-4
razaSp = max(abs(MetJacobiEig(A, 1e-4)));

fprintf('\nRaza spectrala a matricei A este:\n\t rho(A) = %f\n', razaSp);


%% EXERCITIUL 1c.

A = [3 1 1;
    1 3 1;
    1 1 3];

% Am memorat in vectorul 'p' normele corespunzatoare numerelor de
% conditionare pe care le calculam
p = [1 2 Inf];

for i = 1:3
    
    % Pentru valorile din 'p', memoram numarul de conditionare calculat in
    % vectorul 'nrCond' si il afisam
    nrCond(i) = CondP(A, p(i));
    fprintf('\nNumarul de conditionare al matricei A este:\n\t k%d(A) = %f\n', p(i), nrCond(i));
    
end


%% EXERCITIUL 1d.

A = [3 1 1;
    1 3 1;
    1 1 3];

% Am memorat in vectorul 'p' normele pe care le calculam
p = [1 2 Inf];

for i = 1:3
    
    % Pentru fiecare 'p(i)', calculam norma si numarul de conditionare
    % corespunzatoare si le afisam
    norma(i) = norm(A, p(i));
    nrCond(i) = cond(A, p(i));
    
    fprintf('\nNorma-%d a matricei A este:\n\t ||A|| = %f\n', p(i), norma(i));
    fprintf('Numarul de conditionare al matricei A este:\n\t k%d(A) = %f\n', p(i), nrCond(i));
    
end


%% EXERCITIUL 2a.

A = [10 7 8 7;
    7 5 6 5;
    8 6 10 9;
    7 5 9 10];

b = [32 23 33 31]';

% Calculam solutia sistemului 'Ax = b' prin metoda 'GaussPivTot' si o
% afisam
x = GaussPivTot(A, b);

fprintf('\nSolutia sistemului este:\n\tx =');
disp(x);


%% EXERCITIUL 2b.

A = [10 7 8 7;
    7 5 6 5;
    8 6 10 9;
    7 5 9 10];

% Notam bPert = b + delta b
bPert = [32.1 22.9 33.1 30.9]';

% Calculam solutia perturbata 'xPert = x + delta x' a sistemului perturbat
% 'A(x + delta x) = bPert' prin metoda 'GaussPivTot' si o afisam
xPert = GaussPivTot(A, bPert);

fprintf('\nSolutia perturbata asistemului este:\n\tx =');
disp(xPert);

% Observam ca o perturbare foarte mica in b rezulta intr-o perturbare
% semnificativa in solutia x


%% EXERCITIUL 2c.

A = [10 7 8 7;
    7 5 6 5;
    8 6 10 9;
    7 5 9 10];

% Notam bPert = b + delta b
b = [32 23 33 31]';
bPert = [32.1 22.9 33.1 30.9]';

% Calculam solutia perturbata 'xPert = x + delta x' a sistemului perturbat
% 'Ax = bPert' prin metoda 'GaussPivTot'
x = [1 1 1 1]';
xPert = GaussPivTot(A, bPert)';

% Calculam numarul de conditionare corespuzator normei-Inf a matricei 'A'
kInf = CondP(A, Inf);
fprintf('\nNumarul de conditionare al matricei A este k(A) =%f.\n', kInf);
% Observam ca numarul de conditionare este >> 1, asadar putem afirma ca
% sistemul este slab conditionat.

% Calculam erorile relative 'xErrRel' in solutia 'x' si 'bErrRel' in 'b'
% ale sistemului perturbat 'A(x + delta x) = bPert'
xErrRel = NormaP(xPert - x, Inf) / NormaP(x, Inf);
fprintf('\nEroarea relativa in x este = %f.\n', xErrRel);

bErrRel = NormaP(bPert - b, Inf) / NormaP(b, Inf);
fprintf('\nEroarea relativa in x este = %f.\n', xErrRel);

estimare = kInf * bErrRel;
fprintf('\nEstimarea = %f.\n', estimare);
% Observam ca eroarea relativa in x este egala cu estimarea


%% EXERCITIUL 2d.

A = [10 7 8 7;
    7 5 6 5;
    8 6 10 9;
    7 5 9 10];

% Notam APert = A + delta A
APert = [10 7 8.1 7.2;
    7.08 5.04 6 5;
    8 5.98 9.89 9;
    6.99 4.99 9 9.98];

b = [32 23 33 31]';

% Calculam solutia perturbata 'xPert = x + delta x' a sistemului perturbat
% '(A + delta A)(x + delta x) = b' prin metoda 'GaussPivTot'
x = [1 1 1 1]';
xPert = GaussPivTot(APert, b)';

fprintf('\nSolutia perturbata asistemului este:\n\tx =');
disp(xPert);


%% EXERCITIUL 5.1.2.a.

A = [0.2 0.01 0;
    0 1 0.04;
    0 0.02 1];
% Norma matricei (I - A) < 1, asadar MetJacobi asigura convergenta

a = [1 2 3]';

% Consideram eroarea de aproximare 'epsilon'
epsilon = 1e-5;

[~, detA] = GaussJordan(A);
% Verificam ca matricea 'A' sa fie inversabila
if detA ~= 0
    
    % Calculam solutia 'xJ' a sistemului, aproximata dupa 'NJ' iteratii
    % prin apelarea functiei 'MetJacobi' si afisam
    [xJ, NJ] = MetJacobi(A, a, epsilon);
    fprintf('\nSolutia aproximata prin MetJacobi a sistemului este:\n\tx =');
    disp(xJ');
    fprintf('Numarul de iteratii: %d\n', NJ);
    
else
    % Daca matricea 'A' nu este inversabila, nu putem aplica 'MetJacobi'
    fprintf('\nMetoda Jacobi nu poate fi aplicata.\n');
end


%% EXERCITIUL 5.1.2.b.

A = [4 1 2;
    0 3 1;
    2 4 8];
% Matricea A este diagonal dominanta pe linii, asadar putem apela fuctia
% MetJacobiDDL

a = [1 2 3]';

% Consideram eroarea de aproximare 'epsilon'
epsilon = 1e-5;

[~, detA] = GaussJordan(A);
% Verificam ca matricea 'A' sa fie inversabila
if detA ~= 0
    
    % Calculam solutia 'xJDDL' a sistemului, aproximata dupa 'NJJDDL'
    % iteratii prin apelarea functiei 'MetJacobiDDL' si afisam
    [xJDDL, NJDDL] = MetJacobiDDL(A, a, epsilon);
    fprintf('\nSolutia aproximata prin MetJacobiDDL a sistemului este:\n\tx =');
    disp(xJDDL');
    fprintf('Numarul de iteratii: %d\n', NJDDL);
    
else
    % Daca matricea 'A' nu este inversabila, nu putem aplica 'MetJacobiDDL'
    fprintf('\nMetoda Jacobi DDL nu poate fi aplicata.\n');
end


%% EXERCITIUL 5.1.2.c.

A = [4 2 2;
    2 10 4;
    2 4 6];
% Matricea A este simetrica si pozitiv definita, asadar inversabila.
% Pentru MetJacobiR: parametrul optim de relaxare se afla in intervalul (0,
% 2/rho(A)), asadar metoda converge.
% Pentru MetGaussSeidelR: parametrul de relaxare se afla in intervalul (0,
% 2), asadar metoda converge.

a = [1 2 3]';

% Consideram eroarea de aproximare 'epsilon'
epsilon = 1e-5;

[~, detA] = GaussJordan(A);
% Verificam ca matricea 'A' sa fie inversabila
if detA ~= 0
    
    % Calculam solutia 'xJR' a sistemului, aproximata dupa 'NJR'
    % iteratii prin apelarea functiei 'MetJacobiR' si afisam
    [xJR, NJR] = MetJacobiR(A, a, epsilon);
    fprintf('\nSolutia aproximata prin MetJacobiR a sistemului este:\n\tx =');
    disp(xJR');
    fprintf('Numarul de iteratii: %d\n', NJR);
    
    % Consideram parametrul de relaxare 'sigma'
    sigma = 1.2;
    
    % Calculam solutia 'xGSR' a sistemului, aproximata dupa 'NGSR'
    % iteratii prin apelarea functiei 'MetGaussSeidelR' si afisam
    [xGSR, NGSR] = MetGaussSeidelR(A, a, epsilon, sigma);
    fprintf('\nSolutia aproximata prin MetGaussSeidelR a sistemului este:\n\tx =');
    disp(xGSR');
    fprintf('Numarul de iteratii: %d\n', NGSR);
    
else
    % Daca matricea 'A' nu este inversabila, nu putem aplica 'MetJacobiR'
    % sau 'MetGaussSeidelR'
    fprintf('\nMetoda Iterative Relaxate nu pot fi aplicate.\n');
end;


%% EXERCITIUL 5.3. grafic

A = [4 2 2;
    2 10 4;
    2 4 6];

a = [1 2 3]';

% Consideram eroarea de aproximare 'epsilon'
epsilon = 1e-5;

% Cunoastem ca pentru ca metoda Gauss-Seidel Relaxata sa convearge,
% parametrul de relaxare trebuie sa apartina intervalului (0, 2)
% Declaram o discretizare pentru sigma pe intervalul (0, 2)
sigma = 0.05:0.01:1.95;
n = length(sigma);      % Memoram simensiunea vectorului 'sigma' in n
N = zeros(1, n);        % Initializam vectorul N

% Dorim sa studiem numarul de iteratii necesar unei aproximari corecte,
% pentru fiecare 'sigma' din intervalul (0, 2)
for i = 1:n
    % Apelam 'MetGaussSeidelR' pentru fiecare 'sigma' si memoram doar
    % numarul de iteratii efectuate
    [~, N(i)] = MetGaussSeidelR(A, a, epsilon, sigma(i));
end

brownish = [0.639 0.369 0.376];

% Declaram figura in care vom plota graficul functiei N = N(sigma)
fGSR = figure('Name', 'FunctieN(sigma)', 'NumberTitle', 'off');
set (fGSR, 'Color', 'White');

axis( [0 2 2 60]);          % Definirea limitelor axelox
hold on;
grid on;

relaxare = plot(sigma, N);  % Plotam graficul functiei

% Modificari si adaugiri pentru afisare
g = gca;
g.GridColor = [0.639 0.369 0.376];
set (gca, 'FontSize', 8, 'FontName', 'Consolas');
set (gca, 'Box', 'off');
set (gca, 'TickDir', 'out', 'XTick', [0:0.1:2], 'YTick', [0:5:60]);
set (relaxare, 'LineStyle', '-', 'LineWidth', 0.8, 'Color', 'Black');

% Adaugam titlul si indicatii pentru axele Ox si Oy
title ('{\bfGraficul functiei} {N = N(\sigma)}', ...
    'FontName', 'Consolas', 'FontSize', 11.5, 'FontWeight', 'Normal');
xlabel ('\sigma', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');
ylabel ('N', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');


%% EXERCITIUL 5.3. rezolvare

A = [4 2 2;
    2 10 4;
    2 4 6];

a = [1 2 3]';

% Consideram eroarea de aproximare 'epsilon'
epsilon = 1e-5;

% Conform graficului, observam ca numarul minim de iteratii corespunde
% parametrului de relaxare = 1, caz in care sistemul se rezolva fara
% relaxare.
% Pentru a pastra relaxarea, alegem parametrul de relaxare 'sigma = 0.9995'
% si obtinem un numar de iteratii mai mare de minim
sigma = 0.9995;

% Calculam solutia 'xGSR' a sistemului, aproximata dupa 'NGSR'
% iteratii prin apelarea functiei 'MetGaussSeidelR' si afisam
[xGSR, NGSR] = MetGaussSeidelR(A, a, epsilon, sigma);
fprintf('\nSolutia aproximata prin MetGaussSeidelR a sistemului este:\n\tx =');
disp(xGSR');
fprintf('Numarul de iteratii: %d\n', NGSR);


%% NORMA P
%
% Date intrare:
%    'A'       = matricea pentru care calculam norma
%    'p'       = norma de calculat
%
% Date iesire:
%    'norma'   = norma-p a matricei 'A'
%
% Functie pentru calcularea normei-p a unei matrice
%
function [norma] = NormaP(A, p)

% Am considerat ca norme posibile valorile 1, 2 si Inf
switch p
    % Pentru aflarea normei-1, cautam maximul dintre sumele elementelor de
    % pe fiecare coloana a matricei 'A'
    case 1
        norma = max(sum(abs(A)));
        
        % Pentru aflarea normei-2, calculam radacina valorii absolute maxime a
        % matricei 'A'
        % Pentru aflarea valorilor proprii asociate matricei 'A', am apelat
        % functia 'MetJacobiEig', considerand o toleranta de 1e-4
    case 2
        norma = sqrt(max(abs(MetJacobiEig(A'*A, 1e-4))));
        
        % Pentru aflarea normei-Inf, cautam maximul dintre sumele elementelor
        % de pe fiecare linie a matricei 'A'
    case Inf
        norma = max(sum(abs(A), 2));
        
end

end


%% NUMARUL DE CONDITIONARE
%
% Date intrare:
%    'A'       = matricea pentru care calculam numarul de conditionare
%    'p'       = norma corespunzatoare numarului de conditionare de calculat
%
% Date iesire:
%    'nrCond'  =  numarul de conditionare al matricei 'A', corespunzator
%                 normei-p
%
% Functie pentru calcularea numarului de conditionare-p al unei matrice
%
function [nrCond] = CondP(A, p)

% Pentru aflarea numarului de conditionare-p al matricei 'A', calculam
% produsul dintre normele-p ale matricei A, respectiv a inversei matricei A
% Pentru calcularea inversei matricei 'A', am apelat functia 'GaussJordan'
nrCond = NormaP(A, p) * NormaP(GaussJordan(A), p);

end


%% METODA JACOBI
%
% Date intrare:
%    'A'       = matricea sistemului
%    'b'       = vectorul coloana al sistemului
%    'epsilon' = eroarea de aproximare tolerata
%
% Date iesire:
%    'xAprox'  =  vectorul solutiei aproximate a sistemului
%    'N'       =  numarul de iteratii necesar obtinerii solutiei 'xAprox'
%
% Functie pentru calcularea iterativa a solutiei unui sistem de ecuatii
% liniare prin metoda Jacobi
%
function [xAprox, N] = MetJacobi(A, b, epsilon)

n = length(A);  % Memoram dimensiunea matricei A in variabila n
I = eye(n);     % Declaram matricea identitate I
N = 0;          % Setam numarul de iteratii la 0

% Verificam convergenta metodei pentru matricea A prin calculul normei-1 a
% matricei (I - A)
if NormaP(I - A, 1) < 1
    
    %     Initializam vectorul aproximarii de pornire
    x_0 = zeros(n, 1);
    
    % Cat timp solutia aproximata calculata depaseste eroarea tolerata
    % epsilon, continuam sa aproximam
    while (true)
        
        N = N + 1;  % Incrementam numarul de iteratii
        B = I - A;  % Notam B = I _ A pentru usurinta in scriere
        % Calculam urmatoarea aproximare x_1, functie de aproximarea de la
        % iteratia precedenta
        x_1 = B * x_0 + b;
        
        % Calculam norma-1 a diferentei primelor doua aproximari
        if N ==1
            norma1 = NormaP(x_1 - x_0, 1)
        end
        
        % Verificam daca am obtinut o aproximare suficient de aproape de
        % solutia adevarata prin calculul convergentei ultimelor doua
        % solutii obtinute
        if  NormaP(B, 1)^N / (1 - NormaP(B, 1)) * norma1 >= epsilon
            
            x_0 = x_1;
        else
            break;
        end
        
    end
    
    % Returnam ultima solutie aproximata x_1
    xAprox = x_1;
    
    % Altfel, solutia sistemului nu poate fi calculata folosind metoda Jacobi
    % Afisam mesaj corespunzator si returnam NaN
else
    fprintf('Metoda Jacobi nu asigura convergenta');
    x = NaN;
    return;
end

end


%% METODA JACOBI DDL
%
% Date intrare:
%    'A'       = matricea diagonal dominanta pe linii a sistemului
%    'a'       = vectorul coloana al sistemului
%    'epsilon' = eroarea de aproximare tolerata
%
% Date iesire:
%    'xAprox'  =  vectorul solutiei aproximate a sistemului
%    'N'       =  numarul de iteratii necesar obtinerii solutiei 'xAprox'
%
% Functie pentru calcularea iterativa a solutiei unui sistem de ecuatii
% liniare prin metoda Jacobi pentru matrice diagonal dominanta pe linii
% a sistemului
%
function [xAprox, N] = MetJacobiDDL(A, a, epsilon)

n = length(A);  % Memoram dimensiunea matricei A in variabila n

% Parcurgem matricea A pe linii, pentru a verifica daca este diagonal
% dominanta
for i = 1:n
    
    % Comparam elementul diagonal cu suma celorlalte elemente de pe linie
    if abs(A(i, i)) <= sum(abs(A(i, 1:n))) - abs(A(i, i))
        
        % Daca matricea nu este diagonal dominanta pe linii, afisam mesaj
        % corespunzator si returnam NaN
        fprintf('\nMatricea A nu este diagonal dominanta pe linii\n');
        xAprox = NaN;
        N = 0;
        return;
    end
    
end

I = eye(n);         % Declaram matricea identitate I
N = 0;              % Setam numarul de iteratii la 0
x_0 = zeros(n, 1);  % Initializam vectorul aproximarii de pornire
B = zeros(n);       % Declaram dimesiunea matricei B
b = zeros(n, 1);    % Declaram dimensiunea vectorului coloana b

% Parcurgem matricea A pe coloane
for j = 1:n
    
    % Consideram o scriere a sistemului de forma x = (I - D^-1*A)x +D^-1*a,
    % unde D^-1 reprezinta inversa matricei nule, cu diagonala egala cu
    % diagonala matricei A.
    % Astfel, notam B = I - D^-1*A si b = D^-1*a.
    % Cunoastem ca inversa unei matrice diagonale D contine pe diagonala
    % elementele matricei D la puterea -1, asadar am obtinut urmatoarele
    % formule pentru calculul B si b
    B(1:n, j) = I(1:n, j) - 1 / A(j, j) * A(1:n, j);
    b(j) = 1 / A(j, j) * a(j);
    
end

% Cat timp solutia aproximata calculata depaseste eroarea tolerata epsilon,
% continuam sa aproximam
while (true)
    
    N = N + 1;  % Incrementam numarul de iteratii
    
    % Calculam urmatoarea aproximare x_1 functie de aproximarea de la
    % iteratia precedenta
    x_1 = B * x_0 + b;
    
    % Calculam norma-Inf a diferentei primelor doua aproximari
    if N ==1
        normaInf = NormaP(x_1 - x_0, Inf)
    end
    
    % Verificam daca am obtinut o aproximare suficient de aproape de solutia
    % adevarata prin calculul convergentei ultimelor doua solutii obtinute
    if  NormaP(B, Inf)^N / (1 - NormaP(B, Inf)) * normaInf >= epsilon
        
        x_0 = x_1;
    else
        break;
    end
    
end

% Returnam ultima solutie aproximata x_1
xAprox = x_1;

end


%% METODA JACOBI RELAXATA
%
% Date intrare:
%    'A'       = matricea sistemului
%    'a'       = vectorul coloana al sistemului
%    'epsilon' = eroarea de aproximare tolerata
%
% Date iesire:
%    'xAprox'  =  vectorul solutiei aproximate a sistemului
%    'N'       =  numarul de iteratii necesar obtinerii solutiei 'xAprox'
%
% Functie pentru calcularea iterativa a solutiei unui sistem de ecuatii
% liniare prin metoda Jacobi Relaxata cu un parametru 'sigma'
%
function [xAprox, N] = MetJacobiR(A, a, epsilon)

% Consideram parametru de relaxare optim o functie de suma valorilor
% proprii minima si maxima, pe care le aflam prin apelarea functiei
% 'MetJacobiEig'
lambdaMin = min(MetJacobiEig(A, 1e-3));
lambdaMax = max(MetJacobiEig(A, 1e-3));
% Aflam parametrul optim sigma0
sigma0 = 2 / (lambdaMax + lambdaMin);

% Verificam convergenta metodei Jacobi Relaxata prin incadrarea
% parametrului de relaxare intr-un interval
if sigma0 > 0 && sigma0 < 2 / max(abs(MetJacobiEig(A, 1e-4)))
    
    n = length(A);      % Memoram dimensiunea matricei A in variabila n
    I = eye(n);         % Declaram matricea identitate I
    B = zeros(n);       % Declaram dimesiunea matricei B
    b = zeros(n, 1);    % Declaram dimensiunea vectorului coloana b
    x_0 = zeros(n, 1);  % Initializam vectorul aproximarii de pornire
    N = 0;              % Setam numarul de iteratii la 0
    
    % Consideram q0 corespunzator parametrului de relaxare optim ca functie
    % de valorile proprii minima si maxima ale matricei A
    q0 = (lambdaMax - lambdaMin) / (lambdaMax + lambdaMin);
    
    % Consideram o rescriere a sistemului de forma x = (I - sigma0*A) +
    % sigma0*a.
    % Notam B = I - sigma0*A si b = sigma0*a si obtinem urmatoarele formule
    % de calcul:
    B(1:n, 1:n) = I(1:n, 1:n) - sigma0 * A(1:n, 1:n);
    b(1:n) = sigma0 * a(1:n);
    
    % Cat timp solutia aproximata calculata depaseste eroarea tolerata
    % epsilon, continuam sa aproximam
    while (true)
        
        N = N + 1;  % Incrementam numarul de iteratii
        % Calculam urmatoarea aproximare x_1 functie de aproximarea de la
        % iteratia precedenta
        x_1 = B * x_0 + b;
        
        % Calculam norma in raport cu matricea A a diferentei primelor
        % doua aproximari
        if N ==1
            for i = 1:n
                normaA = sqrt (abs (sum (A(i, 1:n) * (x_1(i) - x_0(i)) * ...
                    (x_1(1:n) - x_0(1:n)))));
            end
        end
        
        % Verificam daca am obtinut o aproximare suficient de aproape de
        % solutia adevarata prin calculul convergentei ultimelor doua
        % solutii obtinute
        if  q0^N / (1 - q0) * normaA >= epsilon
            x_0 = x_1;
        else
            break;
        end
    end
    
    % Returnam ultima solutie aproximata
    xAprox = x_1;
    
    % Altfel, afisam mesaj corespunzator si returnam NaN
else
    fprintf('Metoda Jacobi relaxata nu asigura convergenta');
    xAprox = NaN;
    N = 0;
end

end


%% METODA GAUSS-SEIDEL RELAXATA
%
% Date intrare:
%    'A'       = matricea sistemului
%    'a'       = vectorul coloana al sistemului
%    'epsilon' = eroarea de aproximare tolerata
%    'sigma'   = parametrul de relaxare
%
% Date iesire:
%    'xAprox'  =  vectorul solutiei aproximate a sistemului
%    'N'       =  numarul de iteratii necesar obtinerii solutiei 'xAprox'
%
% Functie pentru calcularea iterativa a solutiei unui sistem de ecuatii
% liniare prin metoda Gauss-Seidel Relaxata cu un parametru 'sigma'
%
function [xAprox, N] = MetGaussSeidelR(A, a, epsilon, sigma)

% Verificam convergenta metodei Gauss-Seidel Relaxata prin incadrarea
% parametrului de relaxare in intervalul (0, 2)
if sigma > 0 && sigma < 2
    
    n = length(A);      % Memoram dimensiunea matricei A in variabila n
    x_0 = zeros(n, 1);  % Initializam vectorul aproximarii de pornire
    x_1 = x_0;          % Initializam vectorul aproximarii x_1
    N = 0;              % Setam numarul de iteratii la 0
    
    % Cat timp solutia aproximata calculata depaseste eroarea tolerata
    % epsilon, continuam sa aproximam
    while (true)
        
        N = N + 1;  % Incrementam numarul de iteratii
        
        % Consideram o rescriere a sistemului cu A = L + D + U, asadar:
        % sigma(L+D+U)*x = sigma*a, unde L = elementele din matricea A
        % aflate sub diagonala, D = elementele diagonale din matricea A,
        % U = elementele din matricea A aflate deasupra diagonalei
        % Stim ca, prin metoda Gauss-Seidel cu relaxare, avem urmatoarea
        % formula de aproximare: Xk(i) = (1-sigma)Xk-1(i) + sigma*Xk(i):
        for i = 1:n
            
            x_1(i) = (1 - sigma) * x_0(i) + sigma / A(i, i) * ...
                (a(i) - sum (A(i, 1:i-1) * x_1(1:i-1)) ...
                - sum (A(i, i+1:n) * x_0(i+1:n)));
        end
        
        % Calculam norma in raport cu matricea A a diferentei dintre
        % ultimele doua aproximari calculate
        for i = 1:n
            normaA = sqrt (abs (sum (A(i, 1:n) * (x_0(i) - x_1(i)) * ...
                (x_0(1:n) - x_1(1:n)))));
        end
        
        % Verificam daca am obtinut o aproximare suficient de aproape de
        % solutia adevarata
        if normaA >= epsilon
            x_0 = x_1;
        else
            break;
        end
    end

    %Returnam ultima solutie aproximata
    xAprox = x_1;
    
% Altfel, afisam mesaj corespunzator si retrnam NaN    
else
    fprintf('Metoda Gauss-Seidel relaxata nu asigura convergenta');
    xAprox = NaN;
    N = 0;
end


end


%% METODA JACOBI - VALORI PROPRII

function [lambda] = MetJacobiEig(A, epsilon)

n = length(A);

while sqrt(sum(sum(A(1:n, 1:n).^2)) - sum(diag(A).^2)) >= epsilon
    
    [m, pm] = max (abs(triu(A,1)));
    [~, q] = max (m);
    p = pm(q);
    
    if A(p, p) == A(q, q)
        unghi = pi / 4;
    else
        unghi = 1/2 * atan(2*A(p, q) / (A(q, q) - A(p, p)));
    end
    
    c = cos(unghi);
    s = sin(unghi);
    
    for j = 1:n
        
        if (j ~= p && j ~= q)
            
            u = A(p, j)*c - A(q, j)*s;
            v = A(q, j)*c + A(p, j)*s;
            
            A(p, j) = u;
            A(j, p) = u;
            A(q, j) = v;
            A(j, q) = v;
            
        end
    end
    u = c*c*A(p, p) - 2*c*s*A(p, q) + s*s*A(q, q);
    v = s*s*A(p, p) + 2*c*s*A(p, q) + c*c*A(q, q);
    
    A(p, p) = u;
    A(q, q) = v;
    A(p, q) = 0;
    A(q, p) = 0;
end

lambda = diag(A);

end


%% GAUSS JORDAN

function [invA, detA] = GaussJordan(A)

n = length(A);
I = eye(n);
detA = 1;

for j = 1 : n
    
    if A(j, j) == 0
        pivot = find(A(j:n, j) ~= 0);
        if isempty(pivot)
            
            fprintf ('Matricea A nu este inversabila.\n Determinatul matricei este detA = 0.\n');
            invA = NaN;
            detA = 0;
            return;
        end
        A(j, :) = A(j, :) + A(pivot(1) + j - 1, :);
        I(j, :) = I(j, :) + I(pivot(1) + j - 1, :);
    end
    
    t = 1 / A(j, j);
    A(j, :) = t * A(j, :);
    I(j, :) = t * I(j, :);
    detA = detA / t;
    
    for i = 1 : n
        
        if i ~= j
            t = A(i, j) / A(j, j);
            
            A(i, :) = A(i, :) - t * A(j, :);
            I(i, :) = I(i, :) - t * I(j, :);
        end
    end
end

invA = I;

end


%% GAUSS CU PIVOTARE TOTALA

function [x] = GaussPivTot(A, b)

[A_tri, b_tri, v_tri] = SupTri_TotalPivot(A, b);

if ~isnan(A_tri)
    solSubs = SubsDesc(A_tri, b_tri);
    
    x = zeros(1, length(v_tri));
    
    for i = 1 : length(v_tri)
        x(v_tri(i)) = solSubs(i);
    end
else
    x = NaN;
end

end


%% TRANSFORMARE IN MATRICE SUPERIOR TRIUNGHIULARA

function [A_Tri, b_Tri, v_Permutari] = SupTri_TotalPivot(A, b)
n = length (A);
permutari = 1 : n;
for j = 1 : n-1
    
    [m, iInd] = max (abs(A(j:n, j:n)));
    [m, jInd]= max (abs (m));
    
    if m == 0
        A_Tri = NaN;
        b_Tri = NaN;
        v_permutari = NaN;
        fprintf ('Sistemul este INCOMPATIBIL sau COMPATIBIL NEDETERMINAT\n');
        return;
    end
    
    iMax = iInd(jInd) + j - 1;
    jMax = jInd + j - 1;
    
    if iMax ~= j
        A([j iMax], :) = A ([iMax j], :);
        b([j iMax]) = b([iMax j]);
    end
    
    if jMax ~= j
        A(: ,[j jMax]) = A (:, [jMax j]);
        permutari([j jMax]) = permutari([jMax j]);
    end
    
    for i = j + 1 : n
        t = A(i, j) / A(j, j);
        
        A(i, 1:n) = A(i, 1:n) - t * A(j, 1:n);
        b(i) = b(i) - t * b(j);
    end
    
end

if A(n, n) ~= 0
    A_Tri = A;
    b_Tri = b;
    v_Permutari = permutari;
else
    A_Tri = NaN;
    b_Tri = NaN;
    v_Permutari = NaN;
    
    if b(n) ~=0
        fprintf ('Sistemul este INCOMPATIBIL.\n');
    else
        fprintf ('Sistemul este COMPATIBIL NEDETERMINAT.\n');
    end
end

end


%% SUBSTITUTIA DESCENDENTA

function [x] = SubsDesc(A, b)

x = zeros(1, length(b));
n = length(b);

for i = n : -1 : 1
    x(i) = (b(i) - sum (A(i, 1:n) .* x(1:n)))/ A(i, i);
end
end
