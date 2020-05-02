% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_3a.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru plotarea graficelor functiilor si a solutiei gasite prin
% aplicarea Metodei Bisectiei.
%

% Incarcarea schemei de culori 'wesColors'
% Incarcarea solutiilor ecuatiei calculate anterior
load wesColors;
load aproximariEx3b;

% Declararea celor doua functii 'y1' si 'y2'
y1 = @(x) exp(x) - 2;
y2 = @(x) cos (exp(x) - 2);

% Crearea vectorului 'x' cu valori in intervalul [0, pi]
% Crearea vectorului 'f1' cu valori y1(x)
% Crearea vectorului 'f2' cu valori y2(x)
x = 0:0.01:pi;
f1 = y1(x);
f2 = y2(x);

% Crearea unei figuri pentru modificari ulterioare
fGraficeY = figure('Name', 'Grafice Y', 'NumberTitle', 'off');
set (fGraficeY, 'Color', 'White');

axis ( [0 3.4 -4 23] );             % Definirea limitelor axelox
hold on;
grid on;
axa1x = plot (xlim, [1 1]);
axa_1x = plot (xlim, [-1 -1]);
graficY1 = plot (x, f1);            % Plotare graficul functiei y1
graficY2 = plot (x, f2);            % Plotare graficul functiei y2

% Plotarea punctului de intersectie a graficelor celor doua functii
intersectie = plot (xAprox, y1(xAprox));

% Modificari si adaugiri pentru afisare
g =gca;
g.GridColor = wesColors(2, :);
set (gca, 'FontSize', 8, 'FontName', 'Consolas');
set (gca, 'Box', 'off');
set (gca, 'TickDir', 'out', 'XTick', [0:0.4:3.4], 'YTick', [-4:4:20]);
set (graficY1, 'LineStyle', '-', 'LineWidth', 0.8, 'Color', wesColors(12, :));
set (graficY2, 'LineStyle', '-', 'LineWidth', 0.8, 'Color', wesColors(2, :));
set (axa1x, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');
set (axa_1x, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');
set (intersectie, 'Marker', 'o', 'MarkerFaceColor', wesColors(11, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 6.0);

% Adaugare de titlu si indicatii pentru axele Ox si Oy
title ('{\bfGraficele functiilor} {\ity = e^x - 2} {\bfsi} {\ity = cos (e^x - 2)}', ...
    'FontName', 'Consolas', 'FontSize', 11.5, 'FontWeight', 'Normal');
xlabel ('x', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');
ylabel ('y(x)', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');

% Adaugarea de informatii pentru fiecare grafic
tY1 = text (2.1, 1.6, '\downarrow y = e^x - 2', 'FontName', 'Consolas', ...
    'FontSize', 8);
tY2 = text (1.23, 6, 'y = cos(e^x - 2) \rightarrow', 'FontName', 'Consolas', ...
    'FontSize', 8);
% Adaugarea de text specific markerului din figura
mesajMarker = sprintf (strcat ('(', num2str (xAprox), ',\n', ...
    num2str (y1(xAprox)), ')'));
tMarker = text (xAprox - 0.18, y1(xAprox) + 1.5, mesajMarker, ...
    'FontName', 'Consolas', 'FontSize', 7);
