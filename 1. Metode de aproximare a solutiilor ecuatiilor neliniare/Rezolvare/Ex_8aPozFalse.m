% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_8aPozFalse.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru plotarea graficului functiei pe intervalul ales si a
% solutiilor gasite prin Metoda Pozitiei False
%

% Incarcarea schemei de culori 'wesColors'
% Incarcarea solutiilor ecuatiei calculate anterior
load wesColors;
load aproximariEx8e;

% Definirea functiei 'f'
f = @(x) x .^ 3 - 18 .* x - 10;

% Crearea vectorului axaX cu valori in intervalul [-5, 5]
% Crearea vectorului axaY cu valori f(axaX)
axaX = -5:0.1:5;
axaY = f(axaX);

% Crearea unei figuri pentru modificari ulterioare
fGraf = figure('Name', 'Metoda Poziiei False', 'NumberTitle', 'off');
set (fGraf, 'Color', 'White');

axis ( [-5 5.9 -45 29] );       % Definirea limitelor axelox
hold on;
grid on;
axaOx = plot (xlim, [0 0]);     % Plotare axa Ox
grafic = plot (axaX, axaY);     % Plotare graficul functiei
aproximari = plot (xAprox(1:length(xAprox)), f(xAprox(1:length(xAprox))), ...
    '.');                       % Plotare solutii gasite

% Modificari si adaugiri pentru afisare
g =gca;
g.GridColor = wesColors(9, :);
set (gca, 'FontSize', 8, 'FontName', 'Consolas');
set (gca, 'Box', 'off');
set (gca, 'TickDir', 'out', 'XTick', [-5:5], 'YTick', [-45:5:25]);
set (grafic, 'LineStyle', '-', 'LineWidth', 0.8, 'Color', 'Black');
set (axaOx, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', wesColors(9, :));
set (aproximari, 'Marker', 'o', 'MarkerFaceColor', wesColors(9, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 7.0);

% Adaugare de text specific fiecarui marker
for i = 1 : length(xAprox)
    x = xAprox(i);
    y = f(xAprox(i));
    mesajMarker = sprintf (strcat ('(', num2str (x, 5), ',\n', num2str (y, 1), ')'));
    textMarker = text (x+0.2, y, mesajMarker, ...
        'FontName', 'Consolas', 'FontSize', 7);
end

% Adaugare de titlu si indicatii pentru axele Ox si Oy
title ('{\bfGraficul functiei} {\itf(x) = x^3 - 18 * x - 10}', ...
    'FontName', 'Consolas', 'FontSize', 11.5, 'FontWeight', 'Normal');
xlabel ('x', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');
ylabel ('f(x)', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');