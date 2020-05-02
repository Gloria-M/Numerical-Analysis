
% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------

%% EXERCITIUL 2.b

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calculul derivatei df
syms x;
f = sin(x);
df = diff(f);
% Transformarea in functii numerice pentru f si df
fFunc = matlabFunction(f);
dfFunc = matlabFunction(df);

v = linspace(-pi/2, pi/2, 100);

fSP = figure('Name', 'Interpolare', 'NumberTitle', 'off');
set (fSP, 'Color', 'White');

n = [2, 4, 10];

for k = 1:length(n)
    
    % Discretuzarea intervalului pentru fiecare numar de noduri n(k)
    X = linspace(-pi/2, pi/2, n(k)+1);
    Y = fFunc(X);
    
    % Calcularea functiei spline pentru fiecare punct v(i)
    for i = 1:100
        [S(i), dS(i)] = SplineP(X, Y, dfFunc(X(1)), v(i));
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
    % Plotarea graficului functiilor spline patratica
    graficS = plot(v, S);
    set(graficS, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
    
    % Marcarea punctelor(X, f(X)) de pornire
    date = plot(X(1:end), fFunc(X(1:end)), '.');
    set (date, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
        'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
    % Adaugarea titlului
    titlu = title ('{\bfFunctia } {\itf(x)} {\bf si functia spline patratica } {\itS(x)}');
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


%% EXERCITIUL 2.c

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calculul derivatei df
syms x;
f = sin(x);
df = diff(f);
% Transformarea in functii numerice pentru f si df
fFunc = matlabFunction(f);
dfFunc = matlabFunction(df);

v = linspace(-pi/2, pi/2, 100);

fSP = figure('Name', 'Interpolare', 'NumberTitle', 'off');
set (fSP, 'Color', 'White');

n = [2, 4, 10];

for k = 1:length(n)
    
    % Discretuzarea intervalului pentru fiecare numar de noduri n(k)
    X = linspace(-pi/2, pi/2, n(k)+1);
    Y = fFunc(X);
    
    % Calcularea functiei spline pentru vectorul v
    [S(k, 1:100), dS(k, 1:100)] = SplinePV(X, Y, dfFunc(X(1)), v);
    
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
    a.YLim = [-0.05 1.30];
    a.YTick = 0:0.25:1.5;
    
    % Plotarea graficului derivatei functiei f
    graficdF = plot(X, dfFunc(X));
    set(graficdF, 'LineStyle', '-', 'LineWidth', 1.5, 'Color', wesColors(10, :));
    % Plotarea graficului derivatelor functiilor spline patratice
    graficdS = plot(v, dS(k, :));
    set(graficdS, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
    
    % Marcarea punctelor(X, f(X)) de pornire
    date = plot(X(1:end), dfFunc(X(1:end)), '.');
    set (date, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
        'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
    % Adaugarea titlului
    titlu = title ('{\bfFunctia } {\itf`(x)} {\bf si functia spline patratica } {\itS`(x)}');
    set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
    % Adaugarea indicatiilor pe axa Ox
    axaX = xlabel ('x');
    set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
    % Adaugarea indicatiilor pe axa Oy
    axaY = ylabel ('f`(x) , S`(x)');
    set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
    % Adaugarea legendei
    legenda = legend('f`(x)', 'S`(x)');
    set(legenda, 'Location', 'SouthEast', 'Box', 'off');
    
    pause(5.0);
    % Eliberare figura pentru noul plot
    clf;
end

clear all;


%% EXERCITIUL 3.b

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calculul derivatelor df di ddf
syms x;
f = sin(x);
df = diff(f);
ddf = diff(f, 2);
% Transformarea in functii numerice pentru f, df si ddf
fFunc = matlabFunction(f);
dfFunc = matlabFunction(df);
ddfFunc = matlabFunction(ddf);

v = linspace(-pi/2, pi/2, 100);

fSC = figure('Name', 'Interpolare', 'NumberTitle', 'off');
set (fSC, 'Color', 'White');

n = [2, 4, 10];

for k = 1:length(n)
    
    % Discretuzarea intervalului pentru fiecare numar de noduri n(k)
    X = linspace(-pi/2, pi/2, n(k)+1);
    Y = fFunc(X);
    
    % Calcularea functiei spline pentru fiecare punct v(i)
    for i = 1:100
        [S(i), dS(i), ddS(i)] = SplineC(X, Y, dfFunc(X(1)), dfFunc(X(n(k)+1)), v(i));
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
    % Plotarea graficului functiilor spline cubice
    graficS = plot(v, S);
    set(graficS, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
    
    % Marcarea punctelor(X, f(X)) de pornire
    date = plot(X(1:end), fFunc(X(1:end)), '.');
    set (date, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
        'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
    % Adaugarea titlului
    titlu = title ('{\bfFunctia } {\itf(x)} {\bf si functia spline cubica } {\itS(x)}');
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


%% EXERCITIUL 3.c

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calculul derivatelor df di ddf
syms x;
f = sin(x);
df = diff(f);
ddf = diff(f, 2);
% Transformarea in functii numerice pentru f, df si ddf
fFunc = matlabFunction(f);
dfFunc = matlabFunction(df);
ddfFunc = matlabFunction(ddf);

v = linspace(-pi/2, pi/2, 100);

fSC = figure('Name', 'Interpolare', 'NumberTitle', 'off');
set (fSC, 'Color', 'White');

n = [2, 4, 10];

for k = 1:length(n)
    
    % Discretuzarea intervalului pentru fiecare numar de noduri n(k)
    X = linspace(-pi/2, pi/2, n(k)+1);
    Y = fFunc(X);
    
    % Calcularea functiei spline pentru fiecare punct v(i)
    for i = 1:100
        [S(i), dS(i), ddS(i)] = SplineC(X, Y, dfFunc(X(1)), dfFunc(X(n(k)+1)), v(i));
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
    a.YLim = [-0.05 1.55];
    a.YTick = 0:0.5:1.5;
    
    % Plotarea graficului derivatei functiei f
    graficF = plot(X, dfFunc(X));
    set(graficF, 'LineStyle', '-', 'LineWidth', 1.5, 'Color', wesColors(10, :));
    % Plotarea graficului derivatei functiilor spline cubice
    graficS = plot(v, dS);
    set(graficS, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
    
    % Marcarea punctelor(X, f(X)) de pornire
    date = plot(X(1:end), dfFunc(X(1:end)), '.');
    set (date, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
        'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
    % Adaugarea titlului
    titlu = title ('{\bfFunctia } {\itf`(x)} {\bf si functia spline cubica } {\itS`(x)}');
    set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
    % Adaugarea indicatiilor pe axa Ox
    axaX = xlabel ('x');
    set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
    % Adaugarea indicatiilor pe axa Oy
    axaY = ylabel ('f`(x) , S`(x)');
    set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
    % Adaugarea legendei
    legenda = legend('f`(x)', 'S`(x)');
    set(legenda, 'Location', 'SouthEast', 'Box', 'off');
    
    pause(5.0);
    % Eliberare figura pentru noul plot
    clf;
end

clear all;


%% EXERCITIUL 3.d

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea simbolica a functiei 'f' si calculul derivatelor df di ddf
syms x;
f = sin(x);
df = diff(f);
ddf = diff(f, 2);
% Transformarea in functii numerice pentru f, df si ddf
fFunc = matlabFunction(f);
dfFunc = matlabFunction(df);
ddfFunc = matlabFunction(ddf);

v = linspace(-pi/2, pi/2, 100);

fSC = figure('Name', 'Interpolare', 'NumberTitle', 'off');
set (fSC, 'Color', 'White');

n = [2, 4, 10];

for k = 1:length(n)
    
    % Discretuzarea intervalului pentru fiecare numar de noduri n(k)
    X = linspace(-pi/2, pi/2, n(k)+1);
    Y = fFunc(X);
    
    % Calcularea functiei spline pentru fiecare punct v(i)
    for i = 1:100
        [S(i), dS(i), ddS(i)] = SplineC(X, Y, dfFunc(X(1)), dfFunc(X(n(k)+1)), v(i));
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
    a.YLim = [-8.05 8.05];
    a.YTick = -8:1:8;
    
    % Plotarea graficului derivatei 2 functiei f
    graficF = plot(X, ddfFunc(X));
    set(graficF, 'LineStyle', '-', 'LineWidth', 1.5, 'Color', wesColors(10, :));
    % Plotarea graficului derivatei 2 a functiilor spline cubice
    graficS = plot(v, ddS);
    set(graficS, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
    
    % Marcarea punctelor(X, f(X)) de pornire
    date = plot(X(1:end), ddfFunc(X(1:end)), '.');
    set (date, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
        'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
    % Adaugarea titlului
    titlu = title ('{\bfFunctia } {\itf``(x)} {\bf si functia spline cubica } {\itS``(x)}');
    set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
    % Adaugarea indicatiilor pe axa Ox
    axaX = xlabel ('x');
    set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
    % Adaugarea indicatiilor pe axa Oy
    axaY = ylabel ('f``(x) , S``(x)');
    set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
    % Adaugarea legendei
    legenda = legend('f``(x)', 'S``(x)');
    set(legenda, 'Location', 'SouthEast', 'Box', 'off');
    
    pause(5.0);
    % Eliberare figura pentru noul plot
    clf;
end

clear all;
    

%% METODA DE INTERPOLARE CU FUNCTIE SPLINE PATRATICA
%
% Date intrare:
%    'X'       = vectorul nodurilor de interpolare
%    'Y'       = vectorul valorilor functiei in nodurile de interpolare
%    'df1'     = valoarea derivatei functiei in X(1)
%    'x'       = valoarea pentru care calculam functia spline
%
% Date iesire:
%    'Sx'      = valoarea functiei spline in punctul 'x'
%    'dSx'     = valoarea derivatei functiei 'Sx' in punctul 'x'
%
% Functie pentru calcularea valorii functiei spline patratica in punctul 'x'
%
function [Sx, dSx] = SplineP(X, Y, df1, x)

n = length(X);

% Verificam ca x sa apartina intervalului [X(1), X(n)]
if x < X(1) || x > X(n)    
    % Daca x nu apartine intervalului, afisam mesaj corespunzator si
    % returnam NaN
    fprintf('Valoarea x data nu apartine intervalului\n');
    Sx = NaN;
    dSx = NaN;
    return;
    
else
        
    % Cautam subintervalul in care se afla x, afland limita dreapta a
    % acestuia
    i = 1;
    while x > X(i+1)
        
        i = i + 1;
        
    end
    
    % Calculam valorile termenului 'b' pentru k = 1:i-1, pornind de la
    % b1 = f'(x1)
    b(1) = df1;    
    for k = 2:i
       
        b(k) = 2 / (X(k) - X(k-1)) * (Y(k) - Y(k-1)) - b(k-1);
        
    end
    
    % Calculam termenii 'a' si 'c' pentru 'i'
    a = Y(i);
    c = 1 / ((X(i+1) - X(i))^2) * (Y(i+1) - Y(i) - (X(i+1) - X(i)) * b(i));
    
    % Calculam valoarea functiei spline patratica in punctul x si a
    % derivatei
    Sx = a + b(i) * (x - X(i)) + c * ((x - X(i))^2);
    dSx = b(i) + 2 * c * (x - X(i));
    
end

end
    

%% METODA DE INTERPOLARE CU FUNCTIE SPLINE PATRATICA pentru vectori
%
% Date intrare:
%    'X'       = vectorul nodurilor de interpolare
%    'Y'       = vectorul valorilor functiei in nodurile de interpolare
%    'df1'     = valoarea derivatei functiei in X(1)
%    'x'       = vector de valori pentru care calculam functia spline
%
% Date iesire:
%    'Sx'      = vector al valoarilor functiilor spline pentru vectorul 'x'
%    'dSx'     = vector al valoarilor derivatelor functiilor 'Sx'
%
% Functie pentru calcularea valorii functiei spline patratica pentru x(i)
%
function [Sx, dSx] = SplinePV(X, Y, df1, x)

n = length(X);
m = length(x);

for p = 1:m
    % Verificam ca x sa apartina intervalului [X(1), X(n)]
    if x(p) < X(1) || x(p) > X(n)
        % Daca x nu apartine intervalului returnam NaN
        Sx(p) = NaN;
        dSx(p) = NaN;
        return;
        
    else
        
        % Cautam subintervalul in care se afla x, afland limita dreapta a
        % acestuia
        i = 1;
        while x(p) > X(i+1)
            
            i = i + 1;
            
        end
        
        % Calculam valorile termenului 'b' pentru k = 1:i-1, pornind de la
        % b1 = f'(x1)
        b(1) = df1;
        for k = 2:i
            
            b(k) = 2 / (X(k) - X(k-1)) * (Y(k) - Y(k-1)) - b(k-1);
            
        end
        
        % Calculam termenii 'a' si 'c' pentru 'i'
        a = Y(i);
        c = 1 / ((X(i+1) - X(i))^2) * (Y(i+1) - Y(i) - (X(i+1) - X(i)) * b(i));
        
        % Calculam valoarea functiei spline patratica in punctul x si a
        % derivatei
        Sx(p) = a + b(i) * (x(p) - X(i)) + c * ((x(p) - X(i))^2);
        dSx(p) = b(i) + 2 * c * (x(p) - X(i));
        
    end
    
end

end


%% METODA DE INTERPOLARE CU FUNCTIE SPLINE CUBICA
%
% Date intrare:
%    'X'       = vectorul nodurilor de interpolare
%    'Y'       = vectorul valorilor functiei in nodurile de interpolare
%    'df1'     = valoarea derivatei functiei in X(1)
%    'df2'     = valoarea derivatei functiei in X(n)
%    'x'       = valoarea pentru care calculam functia spline
%
% Date iesire:
%    'Sx'      = valoarea functiei spline in punctul 'x'
%    'dSx'     = valoarea primei derivatei functiei 'Sx'
%    'ddSx'    = valoarea derivatei a doua pentru functia 'Sx'
%
% Functie pentru calcularea valorii functiei spline cubica in punctul 'x'
%
function [Sx, dSx, ddSx] = SplineC(X, Y, df1, df2, x)

n = length(X);
h = X(2) - X(1);

% Verificam ca x sa apartina intervalului [X(1), X(n)]
if x < X(1) || x > X(n)    
    % Daca x nu apartine intervalului, afisam mesaj corespunzator si
    % returnam NaN
    fprintf('Valoarea x data nu apartine intervalului\n');
    Sx = NaN;
    dSx = NaN;
    ddSx = NaN;
    return;
    
else
    
    % Scriem matricele sistemului de ecuatii pentru calcularea termenului b
    % B - matricea coeficientilor
    B = zeros(n);
    B(1, 1) = 1;
    B(n, n) = 1;
    % R - matricea rezultatelor
    R(1) = df1;
    R(n) = df2;
    
    for i = 2:n-1
       
        B(i, i-1) = 1;
        B(i, i) = 4;
        B(i, i+1) = 1;
        
        R(i) = 3 / h * (Y(i+1) - Y(i-1));
        
    end
        
    % Cautam subintervalul in care se afla x, afland limita dreapta a
    % acestuia
    i = 1;
    while x > X(i+1)
        
        i = i + 1;
        
    end
    
    % Calculam valorile termenului 'b' pentru k = 1:i-1, pornind de la
    % b1 = f'(x1)
    b(1) = df1;    
    for k = 2:i
       
        b(k) = 2 / (X(k) - X(k-1)) * (Y(k) - Y(k-1)) - b(k-1);
        
    end
    
    [b, ~] = MetJacobiDDL(B, R, 1e-5);
    
    % Calculam termenii 'a' si 'c' pentru 'i'
    a = Y(i);
    c = 3 / (h^2) * (Y(i+1) - Y(i)) - (b(i+1) + 2*b(i)) / h;
    d = -2 / (h^3) * (Y(i+1) - Y(i)) + (b(i+1) + b(i)) / (h^2);
    
    % Calculam valoarea functiei spline patratica in punctul x si a
    % derivatei
    Sx = a + b(i) * (x - X(i)) + c * ((x - X(i))^2) + d * ((x - X(i))^3);
    dSx = b(i) + 2 * c * (x - X(i)) + 3 * d * ((x - X(i))^2);
    ddSx = 2 * c + 6 * d * (x - X(i));
    
end

end


%% METODA DE INTERPOLARE CU FUNCTIE SPLINE CUBICA pentru vectori
%
% Date intrare:
%    'X'       = vectorul nodurilor de interpolare
%    'Y'       = vectorul valorilor functiei in nodurile de interpolare
%    'df1'     = valoarea derivatei functiei in X(1)
%    'df2'     = valoarea derivatei functiei in X(n)
%    'x'       = vector de valori pentru care calculam functia spline
%
% Date iesire:
%    'Sx'      = vector de valori alefunctiei spline pentru 'x'
%    'dSx'     = vector de valori ale primei derivate pentru 'Sx'
%    'ddSx'    = vector de valori ale derivatei a doua pentru 'Sx'
%
% Functie pentru calcularea valorilor functiilor spline cubice in punctele 'x(i)'
%
function [Sx, dSx, ddSx] = SplineCV(X, Y, df1, df2, x)

n = length(X);
m = length(x);
h = X(2) - X(1);

for p = 1:m
    % Verificam ca x sa apartina intervalului [X(1), X(n)]
    if x(p) < X(1) || x(p) > X(n)
        % Daca x nu apartine intervalului, afisam mesaj corespunzator si
        % returnam NaN
        fprintf('Valoarea x data nu apartine intervalului\n');
        Sx(p) = NaN;
        dSx(p) = NaN;
        ddSx(p) = NaN;
        return;
        
    else
        
        % Scriem matricele sistemului de ecuatii pentru calcularea termenului b
        % B - matricea coeficientilor
        B = zeros(n);
        B(1, 1) = 1;
        B(n, n) = 1;
        % R - matricea rezultatelor
        R(1) = df1;
        R(n) = df2;
        
        for i = 2:n-1
            
            B(i, i-1) = 1;
            B(i, i) = 4;
            B(i, i+1) = 1;
            
            R(i) = 3 / h * (Y(i+1) - Y(i-1));
            
        end
        
        % Cautam subintervalul in care se afla x, afland limita dreapta a
        % acestuia
        i = 1;
        while x(p) > X(i+1)
            
            i = i + 1;
            
        end
        
        % Calculam valorile termenului 'b' pentru k = 1:i-1, pornind de la
        % b1 = f'(x1)
        b(1) = df1;
        for k = 2:i
            
            b(k) = 2 / (X(k) - X(k-1)) * (Y(k) - Y(k-1)) - b(k-1);
            
        end
        
        [b, ~] = MetJacobiDDL(B, R, 1e-5);
        
        % Calculam termenii 'a' si 'c' pentru 'i'
        a = Y(i);
        c = 3 / (h^2) * (Y(i+1) - Y(i)) - (b(i+1) + 2*b(i)) / h;
        d = -2 / (h^3) * (Y(i+1) - Y(i)) + (b(i+1) + b(i)) / (h^2);
        
        % Calculam valoarea functiei spline patratica in punctul x si a
        % derivatei
        Sx(p) = a + b(i) * (x(p) - X(i)) + c * ((x(p) - X(i))^2) + d * ((x(p) - X(i))^3);
        dSx(p) = b(i) + 2 * c * (x(p) - X(i)) + 3 * d * ((x(p) - X(i))^2);
        ddSx(p) = 2 * c + 6 * d * (x(p) - X(i));
        
    end
    
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
        normaInf = NormaP(x_1 - x_0, Inf);
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
