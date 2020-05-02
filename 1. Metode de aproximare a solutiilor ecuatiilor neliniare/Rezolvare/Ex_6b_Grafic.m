% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_6b.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru plotarea graficului functiei si a solutiilor gasite prin
% aplicarea metodei Newton-Raphson
%

% Incarcarea schemei de culori 'wesColors'
% Incarcarea solutiilor ecuatiei calculate anterior
load wesColors;
load aproximariEx6b;

% Definirea functiei 'f'
% Definirea derivatei intai 'df'
% Definirea derivatei a doua 'ddf'
f = @(x) x.^3 -7 .* x.^2 + 14 .* x - 6;
df = @(x) 3.*x.^2 - 14 .* x + 14;
ddf = @(x) 6 .* x - 14;

% Crearea vectorului axaX cu valori in intervalul [0, 4]
% Crearea vectorului axaY cu valori f(axaX)
axaX = 0:0.1:4;
axaY = f(axaX);

% Crearea unei figuri pentru modificari ulterioare
fNR = figure('Name', 'Metoda Newton-Raphson', 'NumberTitle', 'off');
set (fNR, 'Color', 'White');

axis ( [0 4.2 -6 3.2] );        % Definirea limitelor axelox
hold on;
grid on;
axaOx = plot (xlim, [0 0]);     % Plotare axa Ox
grafic = plot (axaX, axaY);     % Plotare graficul functiei
aproximari = plot (xAprox(1:length(xAprox)), f(xAprox(1:length(xAprox))), ...
    '.');                       % Plotare solutii gasite

% Modificari si adaugiri pentru afisare
g =gca;
g.GridColor = wesColors(4, :);
set (gca, 'FontSize', 8, 'FontName', 'Consolas');
set (gca, 'Box', 'off');
set (gca, 'TickDir', 'out', 'XTick', [0:5], 'YTick', [-6:2:4]);
set (grafic, 'LineStyle', '-', 'LineWidth', 0.8, 'Color', 'Black');
set (axaOx, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', wesColors(4, :));
set (aproximari, 'Marker', 'o', 'MarkerFaceColor', wesColors(4, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 7.0);

% Adaugare de text specific fiecarui marker
for i = 1 : length(xAprox)
    x = xAprox(i);
    y = f(xAprox(i));
    mesajMarker = sprintf (strcat ('(', num2str (x, 5), ',\n', num2str (y, 1), ')'));
    textMarker = text (x+i/100, y - 0.4, mesajMarker, ...
        'FontName', 'Consolas', 'FontSize', 7);
end

% Adaugare de titlu si indicatii pentru axele Ox si Oy
title ('{\bfGraficul functiei} {\itf(x) = x^3 - 7*x^2 + 14*x - 6}', ...
    'FontName', 'Consolas', 'FontSize', 11.5, 'FontWeight', 'Normal');
xlabel ('x', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');
ylabel ('f(x)', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');