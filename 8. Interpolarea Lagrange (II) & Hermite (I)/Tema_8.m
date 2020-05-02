
% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------

%% EXERCITIUL 5.2.

load wesColors;

% Definirea simbolica a functiei 'f'
syms x
f(x) = sin(x);

% Memorarea nodurilor de interpolare si a valorilor functiei in aceste
% noduri
Xi = linspace(-pi/2, pi/2, 4);
Yi = f(Xi);

% Calcularea polinoamelor de interpolare siafisarea lor
PNev = MetNeville(Xi, Yi, x);
fprintf('Polinomul de interpolare obtinut prin metoda Neville este:\n\tP(x) =');
disp(PNev);

PNew = MetNDD(Xi, Yi, x);
fprintf('Polinomul de interpolare obtinut prin metoda Newton este:\n\tP(x) =');
disp(vpa(PNew, 4));

% Discretizarea intervalului dat
% Calcularea valorilor functiei f pe intervalul dat
% Calcularea valorilor polinomului de interpolare pe intervalul dat
X = linspace(-pi/2, pi/2, 100);
Y = subs(f, X);
P = subs(PNew, X)

% Salvarea figurii pentru modificari ulterioare
fPDD = figure('Name', 'Interpolare', 'NumberTitle', 'off');
set (fPDD, 'Color', 'White');

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
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Plotarea graficului polinomului de interpolare
graficP = plot(X, P);
set(graficP, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));

% Marcarea punctelor(X_i, Y_i) de pornire
% Indicarea coordonatelor fiecaruia
date = plot(Xi(1:end), Yi(1:end), '.');
set (date, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
text (Xi(1)+0.02, Yi(1)+0.085, '(-\pi/2,-1)', ...
    'FontName', 'Consolas', 'FontSize', 7);
text (Xi(2)+0.04, Yi(2), '(-\pi/6,-0.5)', ...
    'FontName', 'Consolas', 'FontSize', 7);
text (Xi(3)+0.04, Yi(3), '(\pi/6,0.5)', ...
    'FontName', 'Consolas', 'FontSize', 7);
text (Xi(4)-0.25, Yi(4)-0.085, '(\pi/2,1)', ...
    'FontName', 'Consolas', 'FontSize', 7);
% Adaugarea titlului
titlu = title ('{\bfFunctia } {\itf(x)} {\bf si polinomul de interpolare } {\itP_3(x)}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f(x) , P_3(x)');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'P_3(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');


%% EXERCITIUL 5.3.

load wesColors;

% Definirea simbolica a functiei 'f'
syms x
f(x) = sin(x);

% Memorarea nodurilor de interpolare si a valorilor functiei in aceste
% noduri
Xi = linspace(-pi/2, pi/2, 4);
Yi = f(Xi);

% Calcularea polinomului de interpolare
PNev = MetNeville(Xi, Yi, x);

% Discretizarea intervalului dat
% Calcularea valorilor functiei f pe intervalul dat
% Calcularea valorilor polinomului de interpolare pe intervalul dat
X = linspace(-pi/2, pi/2, 100);
Y = subs(f, X);
P = subs(PNev, X)

% Salvarea figurii pentru modificari ulterioare
fPE = figure('Name', 'Interpolare', 'NumberTitle', 'off');
set (fPE, 'Color', 'White');

hold on;
grid on;

% Setarea axelor si modificarea aspectului plotarii
a = gca;
a.GridColor = wesColors(11, :);
a.FontSize = 8;
a.FontName = 'Consolas';
a.Box = 'off';
a.TickDir = 'out';
a.XLim = [-pi/2 pi/2];
a.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
a.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
a.YLim = [0 0.013];
a.YTick = 0:0.001:0.012;

% Plotarea graficului erorii E
graficE = plot(X, abs(Y-P));
set(graficE, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');

% Adaugarea titlului
titlu = title ('{\bfGraficul erorii } {\itE = |f(x)-P_3(x)|}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('E = |f(x) - P_3(x)|');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');


%% POLINOMUL DE INTERPOLARE - METODA NEVILLE
%
% Date intrare:
%    'X'       = vectorul nodurilor de interpolare
%    'Y'       = vectorul valorilor functiei in nodurile de interpolare
%    'x'       = variabila simbolica
%
% Date iesire:
%    'dDif'    = diferentele divizate folosite in calcularea polinomului de
%                interpolare
%
% Functie pentru calcularea diferentelor divizate Newton
%
function P = MetNeville(X, Y, x)

n = length(X); % Memoram numarul de noduri de interpolare in variabila n

% Initializam matricea in care vom calcula diferentele divizate cu 0
% La final, va fi de forma unei matrici inferior triunghiulare, pe
% diagonala aflandu-se diferentele divizate de care avem nevoie pentru
% calcularea polinomului de interpolare
DD = cell(n);
% Construim prima coloana a matricei DD
DD(1:n, 1) = sym2cell(Y(1:n));

% Vom folosi vectorul simbolic 'xs' pentru calcularea diferentelor de forma
% (x-xi), pe care le memoram in vectorul 'difS', unde x este simbolic
xs = x .* ones(1, n);
difS = xs - X;

for i = 2:n
    
    % In continuare, calculam diferentele divizate , completand mereu elementul
    % aflat pe diagonala, apoi restul elementelor de pe coloana respectiva
    % situate sub diagonala
    DD(i, i) = sym2cell((prod([difS(1), DD(i, i-1)]) - ...
        prod([difS(i), DD(i-1, i-1)])) / (X(i) - X(1)));
    
    j = i + 1;
    while j <= n
        
        DD(j, i) = sym2cell((prod([difS(j-i+1), DD(j, i-1)]) - ...
            prod([difS(j), DD(j-1, i-1)])) /(X(j) - X(j-i+1)));
        
        j = j + 1;
        
    end
    
end

% In ultimul element din matricea 'DD' se va afla valoarea polinomului de
% interpolare
P = cell2sym(DD(n, n));
% Folosim functia 'expand' pentru a returna 'P' sub forma polinomiala
P = expand(P);

end


%% POLINOMUL DE INTERPOLARE - METODA NEWTON (diferente divizate)
%
% Date intrare:
%    'X'       = vectorul nodurilor de interpolare
%    'Y'       = vectorul valorilor functiei in nodurile de interpolare
%    'x'       = variabila simbolica
%
% Date iesire:
%    'P'       = Polinomul de interpolare P(x)
%
% Functie pentru calcularea polinomului de interpolare prin metoda Newton
% cu diferente divizate
%
function P = MetNDD(X, Y, x)

n = length(X); % Memoram numarul de noduri de interpolare in variabila n

% Vom folosi vectorul simbolic 'xs' pentru calcularea diferentelor de forma
% (x-xi), pe care le memoram in vectorul 'difPol', unde x este simbolic
xs = x .* ones(1, n);
difPol = xs - X;

% Apelam functia de calcul a diferentelor divizate si memoram rezultatul in
% vectirul 'difDiv'
divDif = DividedDiff(X, Y);

% In 'P' vom avea, la final, forma polinomului de interpolare
% Initializam 'P' cu primul coeficient de forma unei diferente divizate
P = divDif(1);

% Conform metodei de calcul Newton, adaugam la 'P'
for i = 2:n
% Folosim functia 'prod' pentru a efectua calcule intre elementele
% vectorilor
    P = P + prod([divDif(i), prod(difPol(1:i-1))]);
    
end

% Folosim functia 'expand' pentru a returna 'P' calculat sub forma
% polinomiala
P = expand(P);

end


%% DIVIDED DIFFRENCES - NEWTON
%
% Date intrare:
%    'X'       = vectorul nodurilor de interpolare
%    'Y'       = vectorul valorilor functiei in nodurile de interpolare
%
% Date iesire:
%    'dDif'    = diferentele divizate folosite in calcularea polinomului de
%                interpolare
%
% Functie pentru calcularea diferentelor divizate Neville
%
function dDif = DividedDiff(X, Y)

n = length(X); % Memoram numarul de noduri de interpolare in variabila n

% Initializam matricea in care vom calcula diferentele divizate cu 0
% La final, va fi de forma unei matrici inferior triunghiulare, pe
% diagonala aflandu-se diferentele divizate de care avem nevoie pentru
% calcularea polinomului de interpolare
DD = zeros(n);
% Construim prima coloana a matricei DD
DD(1:n, 1) = Y(1:n);

for i = 2:n
    
% In continuare, calculam diferentele divizate , completand mereu elementul
% aflat pe diagonala, apoi restul elementelor de pe coloana respectiva
% situate sub diagonala
    DD(i, i) = (DD(i, i-1) - DD(i-1, i-1)) / (X(i) - X(1));
    
    j = i + 1;
    while j <= n
        
        DD(j, i) = (DD(j, i-1) - DD(j-1, i-1)) / (X(j) - X(j-i+1));
        j = j + 1;
        
    end
    
end

% Returnam elementele aflate pe diagonala matricei DD
dDif = diag(DD);

end

