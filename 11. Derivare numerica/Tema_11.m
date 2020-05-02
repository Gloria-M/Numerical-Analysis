
% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------

%% EXERCITIUL 1.b

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calculul derivatei df
syms x
f = sin(x);
df = diff(f);
% Transformarea in functii numerice pentru f si df
fFunc = matlabFunction(f);
dfFunc = matlabFunction(df);

% Definirea capetelor intervalului [a,b]
a = 0;
b = pi;
% Discretizarea intervalului [a,b]
X(2:101) = linspace(a, b, 100);
X(1) = 2 * X(2) - X(3);
X(end+1) = 2 * X(101) - X(100);

% Creare dialogBox pentru selectarea metodei de catre utilizator
metoda = questdlg('Alegeti metoda diferentelor finite dorita',...
    'DIFERENTE FINITE',...
    'PROGRESIVE', 'CENTRALE', 'REGRESIVE', ' ');

% Apelarea functiei DerivNum pentru calcularea derivatei conform metodei
% 'metoda' selectata de utilizator
DF = DerivNum(X, fFunc(X), metoda);

fSP = figure('Name', 'Derivare Numerica', 'NumberTitle', 'off');
set (fSP, 'Color', 'White');

hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
a.GridColor = wesColors(11, :);
a.FontSize = 8;
a.FontName = 'Consolas';
a.Box = 'off';
a.TickDir = 'out';
a.XLim = [0 pi];
a.XTick = ([0 pi/6 pi/3 pi/2 2*pi/3 5*pi/6 pi]);
a.XTickLabel = ({'0', '\pi/6', '\pi/3', '\pi/2', '2\pi/3', '5\pi/6', '\pi'});
a.YLim = [-1.05 1.05];
a.YTick = -1:0.5:1;

% Am observat ca folosind diferente finite centrale, obtinem o acuratete
% mult mai buna, astfel cele doua grafice aproape se suprapun
% Pentru vizibilitate mai buna, atunci cand vom calcula derivata folosind
% diferente finite centrale, vom alege grosimea liniei diferita
if strcmp(lower(metoda), 'centrale')
    wLinie = 1.5;
else
    wLinie = 0.6;
end

% Plotarea graficului derivatei functiei f
graficD = plot(X(2:end-1), dfFunc(X(2:end-1)));
set(graficD, 'LineStyle', '-', 'LineWidth', wLinie, 'Color', wesColors(10, :));
% Plotarea graficului diferentelor finite
graficDF = plot(X(2:end-1), DF);
set(graficDF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));

% Adaugarea titlului
titlu = title (['Diferente finite ' lower(metoda)]);
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f''(x) , DF(x)');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f''(x)', 'DF(x)');
set(legenda, 'Location', 'NorthEast', 'Box', 'off');

clearvars;


%% EXERCITIUL 1.c

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calculul derivatei df
syms x
f = sin(x);
df = diff(f);
% Transformarea in functii numerice pentru f si df
fFunc = matlabFunction(f);
dfFunc = matlabFunction(df);

% Definirea capetelor intervalului [a,b]
a = 0;
b = pi;
% Discretizarea intervalului [a,b]
X(2:101) = linspace(a, b, 100);
X(1) = 2 * X(2) - X(3);
X(end+1) = 2 * X(101) - X(100);

% Creare dialogBox pentru selectarea metodei de catre utilizator
metoda = questdlg('Alegeti metoda diferentelor finite dorita',...
    'DIFERENTE FINITE',...
    'PROGRESIVE', 'CENTRALE', 'REGRESIVE', ' ');

% Apelarea functiei DerivNum pentru calcularea derivatei conform metodei
% 'metoda' selectata de utilizator
DF = DerivNum(X, fFunc(X), metoda);

fSP = figure('Name', 'Eroarea de trunchiere', 'NumberTitle', 'off');
set (fSP, 'Color', 'White');

hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
a.GridColor = wesColors(11, :);
a.FontSize = 8;
a.FontName = 'Consolas';
a.Box = 'off';
a.TickDir = 'out';
a.XLim = [0 pi];
a.XTick = ([0 pi/6 pi/3 pi/2 2*pi/3 5*pi/6 pi]);
a.XTickLabel = ({'0', '\pi/6', '\pi/3', '\pi/2', '2\pi/3', '5\pi/6', '\pi'});
% Am observat ca folosind diferente finite centrale, obtinem o acuratete
% mult mai buna, astfel eroarea este mai mica
% Pentru vizibilitate mai buna, atunci cand vom calcula eroarea folosind
% diferente finite centrale, vom alege alta dimensionare pentru axa Oy
if strcmp(lower(metoda), 'centrale')
    a.YLim = [0 0.00018];
    a.YTick = 0:0.000015:0.00017;    
else
    a.YLim = [0 0.017];
    a.YTick = 0:0.002:0.016;
end

% Plotarea graficului diferentelor finite
graficE = plot(X(2:end-1), abs(DF - dfFunc(X(2:end-1))));
set(graficE, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');

% Adaugarea titlului
titlu = title (['Diferente finite ' lower(metoda)]);
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('|f''(x)-DF(x)|');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');

clearvars;


%% EXERCITIUL 2.b

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calculul derivatei 'df'
syms x
f = sin(x);
df = diff(f);
% Transformarea in functii numerice pentru 'f' si 'df'
fFunc = matlabFunction(f);
dfFunc = matlabFunction(df);

% Definirea capetelor intervalului [a,b]
a = 0;
b = pi;
% Discretizarea intervalului [a,b]
X = linspace(a, b, 100);

h = (b - a) / 99;
n = [4 6 8];

fSP = figure('Name', 'Extrapolarea Richardson', 'NumberTitle', 'off');
set (fSP, 'Color', 'White');

k = 1;
while k <= 3
    
    for i = 1:100
        % Calcularea derivatei in fiecare punct X(i)
        DF(k, i) = MetRichardson1(fFunc, X(i), h, n(k));
        
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
    a.XLim = [0 pi];
    a.XTick = ([0 pi/6 pi/3 pi/2 2*pi/3 5*pi/6 pi]);
    a.XTickLabel = ({'0', '\pi/6', '\pi/3', '\pi/2', '2\pi/3', '5\pi/6', '\pi'});
    a.YLim = [-1.05 1.05];
    a.YTick = -1:0.5:1;
    
    % Plotarea graficului derivatei exacte a functiei f
    graficdf = plot(X, dfFunc(X));
    set(graficdf, 'LineStyle', '-', 'LineWidth', 1.5, 'Color', wesColors(10, :));
    % Plotarea graficului derivatei aproximate a functiei f
    graficR = plot(X, DF(k, 1:100));
    set(graficR, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
    
    % Adaugarea titlului
    titlu = title (['Aproximarea de ordin ' num2str(n(k)) ' a derivatei']);
    set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
    % Adaugarea indicatiilor pe axa Ox
    axaX = xlabel ('x');
    set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
    % Adaugarea indicatiilor pe axa Oy
    axaY = ylabel ('f''(x) , R(x)');
    set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
    % Adaugarea legendei
    legenda = legend('f''(x)', 'R(x)');
    set(legenda, 'Location', 'NorthEast', 'Box', 'off');
    
    pause(5.0);
    % Eliberare figura pentru noul plot
    clf;
    
    k = k + 1;
end


%% EXERCITIUL 2.b

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calculul derivatei 'df'
syms x
f = sin(x);
df = diff(f);
% Transformarea in functii numerice pentru 'f' si 'df'
fFunc = matlabFunction(f);
dfFunc = matlabFunction(df);

% Definirea capetelor intervalului [a,b]
a = 0;
b = pi;
% Discretizarea intervalului [a,b]
X = linspace(a, b, 100);

h = (b - a) / 99;
n = [4 6 8];

fSP = figure('Name', 'Extrapolarea Richardson', 'NumberTitle', 'off');
set (fSP, 'Color', 'White');

k = 1;
while k <= 3
    
    for i = 1:100
        % Calcularea derivatei in fiecare punct X(i)
        DF(k, i) = MetRichardson1(fFunc, X(i), h, n(k));
        
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
    a.XLim = [0 pi];
    a.XTick = ([0 pi/6 pi/3 pi/2 2*pi/3 5*pi/6 pi]);
    a.XTickLabel = ({'0', '\pi/6', '\pi/3', '\pi/2', '2\pi/3', '5\pi/6', '\pi'});
    
    % Plotarea erorii de trunchiere
    graficE = plot(X, abs(dfFunc(X) - DF(k, 1:100)));
    set(graficE, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');
    
    % Adaugarea titlului
    titlu = title (['Eroarea de trunchiere O(h^' num2str(n(k)) ')']);
    set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
    % Adaugarea indicatiilor pe axa Ox
    axaX = xlabel ('x');
    set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
    % Adaugarea indicatiilor pe axa Oy
    axaY = ylabel ('|f''(x) - R(x)|');
    set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
    
    pause(5.0);
    % Eliberare figura pentru noul plot
    clf;
    
    k = k + 1;
end


%% EXERCITIUL 2.e

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calculul derivatei a doua 'ddf'
syms x
f = sin(x);
ddf = diff(f, 2);
% Transformarea in functii numerice pentru 'f' si 'ddf'
fFunc = matlabFunction(f);
ddfFunc = matlabFunction(ddf);

% Definirea capetelor intervalului [a,b]
a = 0;
b = pi;
% Discretizarea intervalului [a,b]
X = linspace(a, b, 100);

h = (b - a) / 99;
n = [4 6 8];

fSP = figure('Name', 'Extrapolarea Richardson', 'NumberTitle', 'off');
set (fSP, 'Color', 'White');

k = 1;
while k <= 3
    
    for i = 1:100
        % Calcularea derivatei a doua in fiecare punct X(i)
        DDF(k, i) = MetRichardson2(fFunc, X(i), h, n(k));
        
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
    a.XLim = [0 pi];
    a.XTick = ([0 pi/6 pi/3 pi/2 2*pi/3 5*pi/6 pi]);
    a.XTickLabel = ({'0', '\pi/6', '\pi/3', '\pi/2', '2\pi/3', '5\pi/6', '\pi'});
    a.YLim = [-1.05 0.05];
    a.YTick = -1:0.25:0;
    
    % Plotarea graficului derivatei a doua exacte a functiei f
    graficddf = plot(X, ddfFunc(X));
    set(graficddf, 'LineStyle', '-', 'LineWidth', 1.5, 'Color', wesColors(10, :));
    % Plotarea graficului derivatei a doua aproximate a functiei f
    graficR = plot(X, DDF(k, 1:100));
    set(graficR, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
    
    % Adaugarea titlului
    titlu = title (['Aproximarea de ordin ' num2str(n(k)) ...
        ' a derivatei a doua']);
    set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
    % Adaugarea indicatiilor pe axa Ox
    axaX = xlabel ('x');
    set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
    % Adaugarea indicatiilor pe axa Oy
    axaY = ylabel ('f''''(x) , R(x)');
    set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
    % Adaugarea legendei
    legenda = legend('f''''(x)', 'R(x)');
    set(legenda, 'Location', 'NorthEast', 'Box', 'off');
    
    pause(5.0);
    % Eliberare figura pentru noul plot
    clf;
    
    k = k + 1;
end


%% DERIVARE NUMERICA
%
% Date intrare:
%    'x'       = vectorul discretizarii intervalului de definitie
%    'y'       = vectorul valorilor functiei pentru punctele 'x(i)'
%    'metoda'  = tipul diferentelor finite folosite pentru calcul
%
% Date iesire:
%    'DF'     = valorile derivatei functiei 'f' pentru valorile 'x(i)'
%
% Functie pentru calcularea derivatei functiei 'f' pe un interval dat,
% folosind diferente finite
%
function DF = DerivNum(x, y, metoda)

switch lower(metoda)
    case 'progresive'
        
        for i = 2:length(x)-1
           DF(i-1) = (y(i+1) - y(i)) / (x(i+1) -  x(i));
        end
        
    case 'regresive'
        
        for i = 2:length(x)-1
           DF(i-1) = (y(i) - y(i-1)) / (x(i) -  x(i-1));
        end
        
    case 'centrale'
        
        for i = 2:length(x)-1
           DF(i-1) = (y(i+1) - y(i-1)) / (x(i+1) -  x(i-1));
        end
        
    otherwise
        error([newline 'Nu exista metoda ceruta / typo'])
end

end


%% EXTRAPOLAREA RICHARDSON - prima derivata
%
% Date intrare:
%    'f'       = definitia functiei numerice 'f'
%    'x'       = punctul pentru care se cauta valoarea derivatei
%    'h'       = pasul intre doua noduri consecutive ale intervalului
%    'n'       = ordinul aproximarii
%
% Date iesire:
%    'df'     = valoarea derivatei functiei 'f' in punctul 'x'
%
% Functie pentru calcularea derivatei functiei 'f' in punctul 'x', folosind
% metoda de extrapolare Richardson. 
%
function df = MetRichardson1(f, x, h, n)

% Pornim de la aproximarea derivatei folosind diferente finite centrale,
% deci obtinem o eroare de trunchiere O(h^2).
phi2 = @(x, h) (f(x+h) - f(x-h)) / (2 * h);

% Completam prima linie in matricea DF calculand derivata in 'x' folosind
% diferente finite centrale (phi2) si valori de forma h/2^i pentru h
for i = 1:n-1
    
    DF(i, 1) = phi2(x, h/(2^(i-1)));
    
end

% Continuam completarea matricei DF intr-o maniera inferior triunghiulara
% La final, pe ultima pozitie (DF(n, n-1)), vom obtine valoarea derivatei
% in punctul 'x', cu o eroare de trunchiere O(h^n)
for i = 2:n-1
   
    DF(i:n-1, i) = DF(i:n-1, i-1) + ...
        ( DF(i-1:n-2, i-1) - DF(i:n-1, i-1)) / (2^i - 1);
    
end

df = DF(end, end);

end


%% EXTRAPOLAREA RICHARDSON - a doua derivata
%
% Date intrare:
%    'f'       = definitia functiei numerice 'f'
%    'x'       = punctul pentru care se cauta valoarea derivatei
%    'h'       = pasul intre doua noduri consecutive ale intervalului
%    'n'       = ordinul aproximarii
%
% Date iesire:
%    'ddf'     = valoarea derivatei a doua a functiei 'f' in punctul 'x'
%
% Functie pentru calcularea derivatei a doua a functiei 'f' in punctul 'x',
% folosind metoda de extrapolare Richardson. 
%
function ddf = MetRichardson2(f, x, h, n)

% Pornim de la aproximarea derivatei a doua folosind diferente finite centrale,
% centrale, deci obtinem o eroare de trunchiere O(h^2).
phi2 = @(x, h) (f(x+h) + f(x-h) - 2 * f(x)) / (h ^ 2);

% Completam prima linie in matricea DDF calculand derivata a doua in 'x'
% folosind diferente finite centrale (phi2) si valori de forma h/2^i pentru
% h
for i = 1:n-1
    
    DDF(i, 1) = phi2(x, h/(2^(i-1)));
    
end

% Continuam completarea matricei DDF intr-o maniera inferior triunghiulara
% La final, pe ultima pozitie (DDF(n, n-1)), vom obtine valoarea derivatei
% a doua in punctul 'x', cu o eroare de trunchiere O(h^n)
for i = 2:n-1
   
    DDF(i:n-1, i) = DDF(i:n-1, i-1) + ...
        ( DDF(i-1:n-2, i-1) - DDF(i:n-1, i-1)) / (2^i - 1);
    
end

ddf = DDF(end, end);

end


