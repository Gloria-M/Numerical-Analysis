
% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------

%% EXERCITIUL 2.b

% Definirea simbolica a functiei 'f' si transformarea in functie numerica
syms x
f = sin(x);
fFunc = matlabFunction(f);

% Declararea capetelor intervalului [a,b]
a = 0;
b = pi;

% Calcularea intervalei definite pe intervalul [a b];
IExact = double(int(f, [a b]));

% Creare dialogBox pentru selectarea metodei de catre utilizator
mesaj = ['Alegeti metoda de integrare dorita' newline ...
    'DREPTUNHGI | TRAPEZ | SIMPSON | NEWTON' newline];
titlu = 'Cuadraturi sumate';
metoda = char(inputdlg(mesaj, titlu, [1 50]));

% Declararea numarului de subintervale dorite
k = 10;

% Apelarea functiei Integrare pentru calcularea integralei conform metodei
% 'metoda' selectata de utilizator
IAprox = Integrare(fFunc, a, b, k, metoda);

% Calcularea erorii de aproximare
err = abs(IExact - IAprox);

% Afisarea erorii rezultate
fprintf ([newline 'Eroarea de aproximare a integralei folosind metoda ' ...
    upper(metoda(1)) lower(metoda(2:end)) ' este ' num2str(err, '%.7f') '.' ...
    newline]);


%% EXERCITUIUL 4 - Grafic solutii

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f(t,x)' si transformarea in functie
% numerica
syms t x
f = x * cos(t) + x^2 * cos(t);
fFunc = matlabFunction(f);

fD = figure('Name', 'Ecuatii diferentiale', 'NumberTitle', 'off');
set (fD, 'Color', 'White');

hold on;
grid on;

% Declararea numarului de noduri ale discretizarii intervalului 
% [0, t+(0,1))
N = 100;
tInterval = linspace(0, asin(log(2)), N);
% Declarare momentul initial 't0' si momentul final 'tf'
t0 = tInterval(1);
tf = tInterval(end-1);

% Calcularea exacta a solutiei ecuatiei diferentiale x' = f(t, x)
[tSol, xSol] = ode45(fFunc, tInterval(1:end-1), 1);

% Calcularea aproximata a solutiei ecuatiei diferentiale x'=f(t, x)
[tAprox, xAprox] = MetEuler(fFunc, t0, tf, 1, N-2);

hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
a.GridColor = wesColors(11, :);
a.FontSize = 8;
a.FontName = 'Consolas';
a.Box = 'off';
a.TickDir = 'out';
a.XLim = [0 asin(log(2))];
a.XTick = 0:0.15:asin(log(2));

% Plotarea graficului solutiei exacte
graficDe1 = plot(tSol, xSol);
set(graficDe1, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Plotarea graficului solutiei aproximate
graficDa1 = plot(tAprox, xAprox);
set(graficDa1, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));

% Adaugarea titlului
titlu = title ('{\bfSolutia ecuatiei } {\itx'' = x\cdotcos(t) + x^2\cdotcos(t)}');
set(titlu, 'FontSize', 10.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('t');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('x');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
% Adaugarea legendei
l1 = '$$ \varphi_0(t)$$ Exact';
l2 = '$$ \varphi_0(t)$$ Aprox';
legenda = legend(' ', ' ');
set(legenda, 'Location', 'NorthWest', 'Box', 'off');
L = text(0.1,168,[l1 newline l2],'Interpreter','latex');
set(L, 'FontSize', 8);


%% EXERCITUIUL 4 - Eroarea de aproximare

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f(t,x)' si transformarea in functie
% numerica
syms t x
f = x * cos(t) + x^2 * cos(t);
fFunc = matlabFunction(f);

fD = figure('Name', 'Ecuatii diferentiale', 'NumberTitle', 'off');
set (fD, 'Color', 'White');

hold on;
grid on;

% Declararea numarului de noduri ale discretizarii intervalului 
% [0, t+(0,1))
N = 100;
tInterval = linspace(0, asin(log(2)), N);
% Declarare momentul initial 't0' si momentul final 'tf'
t0 = tInterval(1);
tf = tInterval(end-1);

% Calcularea exacta a solutiei ecuatiei diferentiale x' = f(t, x)
[tSol, xSol] = ode45(fFunc, tInterval(1:end-1), 1);

% Calcularea aproximata a solutiei ecuatiei diferentiale x'=f(t, x)
[tAprox, xAprox] = MetEuler(fFunc, t0, tf, 1, N-2);

hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
a.GridColor = wesColors(11, :);
a.FontSize = 8;
a.FontName = 'Consolas';
a.Box = 'off';
a.TickDir = 'out';
a.XLim = [0 asin(log(2))];
a.XTick = 0:0.15:asin(log(2));
a.YLim = [-2 145];

% Plotarea graficului erorii de aproximare
graficE = plot(tAprox, abs(xSol' - xAprox));
set(graficE, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(4, :));

% Adaugarea titlului
titlu = title ('Eroarea de aproximare');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('t');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('|                   |');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
l1 = '$$ \varphi_0(t)_{exact}$$ ';
l2 = '$$ \varphi_0(t)_{aprox}$$ ';
Ly = text(-0.059,47.5,[l1 '- ' l2],'Interpreter','latex');
set(Ly, 'FontSize', 9.5, 'FontWeight', 'Bold', 'Rotation', 90);

% Observatii
mesaj = ['\underline{\bf{OBS:}} ' 'Aproape de capatul ' newline ...
    'din dreapta al intervalului,' newline ...
    'eroarea de aproximare creste ' newline ...
    'brusc si devine inacceptabila.'];
obs = text(0.015, 129.5, mesaj,'Interpreter','latex');
set(obs, 'FontSize', 8, 'FontWeight', 'Normal');


%% APROXIMAREA INTEGRALEI FOLOSIND CUADRATURI SUMATE
%
% Date intrare:
%    'f'       = definitia functiei numerice 'f'
%    'a'       = limita inferioarea a intervalului
%    'b'       = limita superioara a intervalului
%    'k'       = numarul de subintervale
%    'metoda'  = metoda de calcul a integralei
%
% Date iesire:
%    'I'       = valoarea aproximata a integralei definita pe intervalul [a
%    b]
%
% Functie pentru calcularea integralei functiei 'f' definita pe intervalul
% [a b], folosind metoda de calcul 'metoda'
% 
function I = Integrare(f, a, b, k, metoda)

switch lower(metoda)
    
    case 'dreptunghi'
        
        X = linspace (a, b, 2*k-1);
        h = X(2) - X(1);
        
        I = 2 * h * sum (f(X(2:2:2*(k-1))));
        
    case 'trapez'
        
        X = linspace (a, b, k+1);
        h = X(2) - X(1);
        
        I = h / 2 * sum (f(X(1:k)) + f(X(2:k+1)));
        
    case 'simpson'
        
        X = linspace (a, b, 2*k+1);
        h = X(2) - X(1);
        
        I = h / 3 * sum (f(X(1:2:2*k-1)) + 4 * f(X(2:2:2*k)) + ...
            f(X(3:2:2*k+1)));
        
    case 'newton'
        
        X = linspace (a, b, 3*k+1);
        h = X(2) - X(1);
        
        I = 3 * h / 8 * sum (f(X(1:3:3*k-2)) + 3 * f(X(2:3:3*k-1)) + ...
            3 * f(X(3:3:3*k)) + f(X(4:3:3*k+1)));
        
end

end


%% METODA EULER EXPLICIT
%
% Date intrare:
%    'f'       = definitia functiei numerice 'f'
%    't0'      = momentul initial
%    'tf'      = momentul final
%    'x0'      = solutia la momentul initial 't0'
%    'N'       = numarul de noduri ale discretizarii intervalului [t0, tf]
%
% Date iesire:
%    '[t, x]'  = matrice a solutiilor 'x' aproximate pentru momentele 't' 
%
% Functie pentru aproximarea solutiei problemei Cauchy (f, t0, x0)
% pe intervalul [t0, tf], discretizat cu N noduri
% 
function [t, x] = MetEuler(f, t0, tf, x0, N)

% Calcularea pasului discretizarii
h = (tf - t0) / N;

% Initializarea vectorului timp cu momentul initial 't0'
t(1) = t0;
% Construirea vectorului timp 't'
for i = 2:N+1
    t(i) = t(i-1) + h;
end

% Initializarea vectorului solutie 'x' cu valoarea 'x0' la momentul 't0'
x(1) = x0;
% Calcularea solutiilor la momente de timp din intervalul [t0, tf] conform
% metodei Euler explicit
for i = 2:N+1
    x(i) = x(i-1) + h * f(t(i-1), x(i-1));
end

end








