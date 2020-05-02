
% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------

%% EXERCITIUL 2 - Grafic

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calculul derivatei df
syms x
f = sin(x);
df = diff(f);
% Transformarea in functii numerice pentru f si df
fFunc = matlabFunction(f);
dfFunc = matlabFunction(df);

% Memorarea nodurilor de interpolare si a valorilor functiei si a 
% derivatelor
X = linspace(-pi/2, pi/2, 4);
Z = zHerm(X);
fZ = fFunc(Z);
dfZ = dfFunc(Z);

% Calcularea polinoamului de interpolare Hermite si afisarea acestuia
PH = MetHermiteDD(Z, fZ, dfZ, x);
fprintf('Polinomul de interpolare obtinut prin metoda Hermite DD este:\n\tP(x) = ');
disp(vpa(PH, 4));

% Salvarea figurii pentru modificari ulterioare
fPErr = figure('Name', 'Interpolare', 'NumberTitle', 'off');
set (fPErr, 'Color', 'White');

hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
a.GridColor = wesColors(11, :);
a.FontSize = 8;
a.FontName = 'Consolas';
a.Box = 'off';
a.TickDir = 'out';
a.XLim = [-pi/2 pi/2];
a.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
a.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
a.YLim = [-1.05 1.05];
a.YTick = -1:0.5:1;

% Plotarea graficului functiei f
graficF = fplot(f, [-pi/2, pi/2]);
set(graficF, 'LineStyle', '-', 'LineWidth', 1.5, 'Color', wesColors(10, :));
% Plotarea graficului polinomului de interpolare
graficP = fplot(PH, [-pi/2, pi/2]);
set(graficP, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));

% Marcarea punctelor(X, f(X)) de pornire
% Indicarea coordonatelor fiecaruia
date = plot(X(1:end), fFunc(X(1:end)), '.');
set (date, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
text (X(1)+0.02, fFunc(X(1))+0.085, '(-\pi/2,-1)', ...
    'FontName', 'Consolas', 'FontSize', 7);
text (X(2)+0.04, fFunc(X(2)), '(-\pi/6,-0.5)', ...
    'FontName', 'Consolas', 'FontSize', 7);
text (X(3)+0.04, fFunc(X(3)), '(\pi/6,0.5)', ...
    'FontName', 'Consolas', 'FontSize', 7);
text (X(4)-0.25, fFunc(X(4))-0.085, '(\pi/2,1)', ...
    'FontName', 'Consolas', 'FontSize', 7);
% Adaugarea titlului
titlu = title ('{\bfFunctia } {\itf(x)} {\bf si polinomul de interpolare } {\itP_3(x)}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f(x) , P_7(x)');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'P_7(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');

clear all;


%% EXERCITIUL 2 - Eroarea

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f'
syms x
f = sin(x);
df = diff(f);
% Transformarea in functii numerice pentru f si df
fFunc = matlabFunction(f);
dfFunc = matlabFunction(df);

% Memorarea nodurilor de interpolare si a valorilor functiei si a 
% derivatelor
X = linspace(-pi/2, pi/2, 4);
Z = zHerm(X);
fZ = fFunc(Z);
dfZ = dfFunc(Z);

% Calcularea polinomului de interpolare
PH = MetHermiteDD(Z, fZ, dfZ, x);

% Salvarea figurii pentru modificari ulterioare
fPErr = figure('Name', 'Eroarea de interpolare', 'NumberTitle', 'off');
set (fPErr, 'Color', 'White');

hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
a.GridColor = wesColors(11, :);
a.FontSize = 8;
a.FontName = 'Consolas';
a.Box = 'off';
a.TickDir = 'out';
a.XLim = [-pi/2 pi/2];
a.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
a.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
a.YLim = [0 0.000005];
a.YTick = 0:0.0000005:0.0000045;

% Plotarea graficului erorii E
graficE = fplot(abs(PH - f), [-pi/2, pi/2]);
set(graficE, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');

% Adaugarea titlului
titlu = title ('{\bfEroarea de interpolare}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('E=|f(x)-P_7(x)|');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');

clear all;


%% EXERCITIUL 4.b

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calcularea functiei numerice f
syms x
f = sin(x);
fFunc = matlabFunction(f);

v = linspace(-pi/2, pi/2, 100);

fSL = figure('Name', 'Interpolare', 'NumberTitle', 'off');
set (fSL, 'Color', 'White');

n = [2, 4, 10];

for k = 1:length(n)
    
    % Discretuzarea intervalului pentru fiecare numar de noduri n(k)
    X = linspace(-pi/2, pi/2, n(k)+1);
    Y = fFunc(X);
    
    % Calcularea functiei spline pentru fiecare punct v(i)
    for i = 1:100
        S(i) = SplineL(X, Y, v(i));
    end
    
    hold on;
    grid on;
    
    % Modificarea aspectului plotarii
    a = gca;
    a.GridColor = wesColors(11, :);
    a.FontSize = 8;
    a.FontName = 'Consolas';
    a.Box = 'off';
    a.TickDir = 'out';
    a.XLim = [-pi/2 pi/2];
    a.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
    a.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
    a.YLim = [-1.05 1.05];
    a.YTick = -1:0.5:1;
    
    % Plotarea graficului functiei f
    graficF = plot(X, Y);
    set(graficF, 'LineStyle', '-', 'LineWidth', 1.5, 'Color', wesColors(10, :));
    % Plotarea graficului functiilor spline liniare
    graficS = plot(v, S);
    set(graficS, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
    
    % Marcarea punctelor(X, f(X)) de pornire
    date = plot(X(1:end), fFunc(X(1:end)), '.');
    set (date, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
        'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
    % Adaugarea titlului
    titlu = title ('{\bfFunctia } {\itf(x)} {\bf si functia spline liniara } {\itS(x)}');
    set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
    % Adaugarea indicatiilor pe axa Ox
    axaX = xlabel ('x');
    set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
    % Adaugarea indicatiilor pe axa Oy
    axaY = ylabel ('f(x) , S(x)');
    set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
    % Adaugarea legendei
    legenda = legend('f(x)', 'S(x)');
    set(legenda, 'Location', 'SouthEast', 'Box', 'off');
    
    pause(5.0);
    % Eliberare figura pentru noul plot
    clf;
end

clear all;


%% EXERCITIUL 4.c

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f'
syms x
f = sin(x);
fFunc = matlabFunction(f);

v = linspace(-pi/2, pi/2, 100);

fSL = figure('Name', 'Interpolare', 'NumberTitle', 'off');
set (fSL, 'Color', 'White');

n = [2, 4, 10];

for k = 1:length(n)
    
    X = linspace(-pi/2, pi/2, n(k)+1);
    Y = fFunc(X);
    
    S(k, 1:100) = SplineLV(X, Y, v);
    
    hold on;
    grid on;
    
    % Modificarea aspectului plotarii
    a = gca;
    a.GridColor = wesColors(11, :);
    a.FontSize = 8;
    a.FontName = 'Consolas';
    a.Box = 'off';
    a.TickDir = 'out';
    a.XLim = [-pi/2 pi/2];
    a.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
    a.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
    a.YLim = [-1.05 1.05];
    a.YTick = -1:0.5:1;
    
    % Plotarea graficului functiei f
    graficF = plot(X, Y);
    set(graficF, 'LineStyle', '-', 'LineWidth', 1.5, 'Color', wesColors(10, :));
    % Plotarea graficului functiilor spline liniare
    graficS = plot(v, S(k, :));
    set(graficS, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
    
    % Marcarea punctelor(X, f(X)) de pornire
    date = plot(X(1:end), fFunc(X(1:end)), '.');
    set (date, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
        'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
    % Adaugarea titlului
    titlu = title ('{\bfFunctia } {\itf(x)} {\bf si functia spline liniara } {\itS(x)}');
    set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
    % Adaugarea indicatiilor pe axa Ox
    axaX = xlabel ('x');
    set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
    % Adaugarea indicatiilor pe axa Oy
    axaY = ylabel ('f(x) , S(x)');
    set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
    % Adaugarea legendei
    legenda = legend('f(x)', 'S(x)');
    set(legenda, 'Location', 'SouthEast', 'Box', 'off');
    
    pause(5.0);
    clf;
end


%% METODA HERMITE DD
%
% Date intrare:
%    'Z'       = vectorul nodurilor de interpolare
%    'fZ'      = vectorul valorilor functiei in nodurile de interpolare
%    'dfZ'     = vectorul valorilor derivatei in nodurile de interpolare
%    'x'       = variabila simbolica
%
% Date iesire:
%    'H'       = polinomul de interpolare H(x)
%    'dH'      = polinomul H'(x)
%
% Functie pentru calcularea polinomului de interpolare Hermite cu diferente
% divizate.
%
function [H, dH] = MetHermiteDD(Z, fZ, dfZ, x)

n = length(Z); % Memoram numarul de noduri de interpolare in variabila n

% Vom folosi vectorul simbolic 'xs' pentru calcularea diferentelor de forma
% (x-zi), pe care le memoram in vectorul 'difPol', unde x este simbolic
xs = x .* ones(1, n);
difPol = xs - Z;

% Apelam functia de calcul a diferentelor divizate si memoram rezultatul in
% vectorul 'DD'
DD = DivDifH(Z, fZ, dfZ);

% In 'H' vom avea, la final, forma polinomului de interpolare
% Initializam 'H' cu primul coeficient de forma unei diferente divizate
H = DD(1);

% Conform metodei de calcul Hermite, completam 'H'
for i = 2:n
% Folosim functia 'prod' pentru a efectua calcule intre elementele
% vectorilor    
   H = H + prod([DD(i), prod(difPol(1:i-1))]); 
    
end

% Folosim functia 'expand' pentru a returna 'H' calculat sub forma
% polinomiala
H = expand(H);
% Calculam si derivata polinomului 'H'
dH = diff(H);

end


%% DIFERENTE DIVIZATE HERMITE
%
% Date intrare:
%    'Z'       = vectorul nodurilor de interpolare
%    'fZ'      = vectorul valorilor functiei in nodurile de interpolare
%    'dfZ'     = vectorul valorilor derivatei in nodurile de interpolare
%
% Date iesire:
%    'ddH'     = diferentele divizate folosite in calcularea polinomului de
%                interpolare
%
% Functie pentru calcularea diferentelor divizate Hermite
%
function [ddH] = DivDifH(Z, fZ, dfZ)

n = length(Z); % Memoram numarul de noduri de interpolare in variabila n

% Initializam matricea in care vom calcula diferentele divizate cu NaN,
% deoarece, la un moment dat, va trebui sa verificam daca un element al
% matricei a fost calculat
% La final, va semana cu o matrice inferior triunghiulara (NaN deasupra 
% diagonalei), pe diagonala aflandu-se diferentele divizate de care avem
% nevoie pentru calcularea polinomului de interpolare
DD(1:n, 1:n) = NaN;

% Construim prima coloana a matricei DD
DD(1:n, 1) = fZ(1:n);

% Pentru cazurile f[xi, xi] aflate pe coloana j=2 in matricea DD, calculam
% f'(xi)
i = 2;
while i < n+1

% Pornim de la linia i=2 si parcurgem coloana din 2 in 2 linii, deoarece,
% pentru fiecare i, ne folosim de elementele de pe coloana j=1, liniile i
% si i-1
    DD(i, 2) = dfZ(i);    
    i = i + 2;
    
end

for i = 2:n

% In continuare, calculam diferentele divizate , completand mereu elementul
% aflat pe diagonala, apoi restul elementelor de pe coloana respectiva
% situate sub diagonala
    if isnan(DD(i, i))
        % Verificam daca elementul nu a fost calculat anterior, adica daca 
        % nu ne aflam in cazul f[xi, xi]
        DD(i, i) = (DD(i, i-1) - DD(i-1, i-1)) / (Z(i) - Z(1));
    end
    
    j = i + 1;
    while j <= n
        
        if isnan(DD(j, i))
            % Verificam daca elementul nu a fost calculat anterior, adica daca 
            % nu ne aflam in cazul f[xi, xi]
            DD(j, i) = (DD(j, i-1) - DD(j-1, i-1)) / (Z(j) - Z(j-i+1));
        end
        j = j + 1;
        
    end
    
end

% Returnam elementele aflate pe diagonala matricei DD
ddH = diag(DD);

end


%% NODURI INTERPOLARE HERMITE
%
% Date intrare:
%    'X'       = vectorul nodurilor date
%
% Date iesire:
%    'Z'       = vectorul nodurilor de interpolare folosite pentru
%                calcularea polinomului Hermite cu diferente divizate
%
% Functie pentru dublarea nodurilor de interpolare in metoda Hermite
%
function Z = zHerm(X)

n = length(X); % Memoram numarul nodurilor date in variabila n

% Fiecare nod dat va fi scris de doua ori in vectorul Z
for i = 1:n
   
    Z(2*i-1) = X(i);
    Z(2*i) = X(i);
    
end

end


%% METODA DE INTERPOLARE CU FUNCTIE SPLINE LINIARA
%
% Date intrare:
%    'X'       = vectorul nodurilor de interpolare
%    'Y'       = vectorul valorilor functiei in nodurile de interpolare
%    'x'       = valoarea pentru care calculam functia spline
%
% Date iesire:
%    'Sx'      = valoarea functii spline in punctul 'x'
%
% Functie pentru calcularea valorii functiei spline liniare in punctul 'x'
%
function Sx = SplineL(X, Y, x)

n = length(X);

% Verificam ca x sa apartina intervalului [X(1), X(n)]
if x < X(1) || x > X(n)    
    % Daca x nu apartine intervalului, afisam mesaj corespunzator si
    % returnam NaN
    fprintf('Valoarea x data nu apartine intervalului\n');
    Sx = NaN;
    return;
    
else
        
    % Cautam subintervalul in care se afla x, afland limita dreapta a
    % acestuia
    i = 1;
    while x > X(i+1)
        
        i = i + 1;
        
    end
    
    % Calculam valoarea functiei spline liniara in punctul x
    Sx = Y(i) + (Y(i+1) - Y(i)) / (X(i+1) - X(i)) * (x - X(i));
    
end

end


%% METODA DE INTERPOLARE CU FUNCTIE SPLINE LINIARA pentru vectori
%
% Date intrare:
%    'X'       = vectorul nodurilor de interpolare
%    'Y'       = vectorul valorilor functiei in nodurile de interpolare
%    'x'       = vector de valori pentru care calculam functia spline
%
% Date iesire:
%    'Sx'      = vector de valori ale functiei spline pentru vectorul 'x'
%
% Functie pentru calcularea valorilor functiei spline liniare in punctele
% x(i)
%
function Sx = SplineLV(X, Y, x)

n = length(X);
m = length(x);

for k = 1:m
    % Verificam ca x sa apartina intervalului [X(1), X(n)]
    if x(k) < X(1) || x(k) > X(n)
        % Daca x nu apartine intervalului returnam NaN
        Sx(k) = NaN;
        
    else
        
        % Cautam subintervalul in care se afla x, afland limita dreapta a
        % acestuia
        i = 1;
        while x(k) > X(i+1)
            
            i = i + 1;
            
        end
        
        % Calculam valoarea functiei spline liniara in punctul x
        Sx(k) = Y(i) + (Y(i+1) - Y(i)) / (X(i+1) - X(i)) * (x(k) - X(i));
        
    end
    
end

end















