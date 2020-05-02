% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_2c.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru plotarea graficului functiei si a solutiilor gasite prin
% aplicarea Metodei Bisectiei.
%

% Incarcarea schemei de culori 'wesColors'
% Incarcarea solutiilor ecuatiei calculate anterior
load wesColors;
load aproximariEx2b;

% Definirea functiei 'f'
f = @(x) x.^3 -7 .* x.^2 + 14 .* x - 6;

% Crearea unei figuri pentru modificari ulterioare
fBisectie = figure('Name', 'Metoda Bisectiei', 'NumberTitle', 'off');
set (fBisectie, 'Color', 'White');

% Crearea vectorului axaX cu valori in intervalul [0, 4]
% Crearea vectorului axaY cu valori f(axaX)
axaX = 0:0.1:4;
axaY = f(axaX);

axis ( [0 4.2 -6 3.2] );        % Definirea limitelor axelor
hold on;
grid on;                        % Activare grid in figura
axaOx = plot (xlim, [0 0]);     % Plotare axa Ox
grafic = plot (axaX, axaY);     % Plotare graficul functiei 'f'
aproximari = plot (xAprox(1:length(xAprox)), f(xAprox(1:length(xAprox))), ...
    '.');                       % Plotare solutii gasite

% In continuare, o serie de modificari si adaugiri efectuate asupra figurii
% pentru un aspect personalizat
g =gca;
g.GridColor = wesColors(1, :);
set (gca, 'FontSize', 8, 'FontName', 'Consolas');
set (gca, 'Box', 'off');
set (gca, 'TickDir', 'out', 'XTick', [0:5], 'YTick', [-6:2:4]);
set (grafic, 'LineStyle', '-', 'LineWidth', 0.8, 'Color', 'Black');
set (axaOx, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', wesColors(1, :));
set (aproximari, 'Marker', 'o', 'MarkerFaceColor', wesColors(1, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 7.0);

% Adaugarea de text specific fiecarui marker de pe grafic
for i = 1 : length(xAprox)
    x = xAprox(i);
    y = f(xAprox(i));
    mesajMarker = sprintf (strcat ('(', num2str (x, 5), ',\n', num2str (y, 1), ')'));
    textMarker = text (x+i/100, y - 0.4, mesajMarker, ...
        'FontName', 'Consolas', 'FontSize', 7);
end

% Adaugarea titlului si indicatiilor axelor Ox si Oy
title ('{\bfGraficul functiei} {\itf(x) = x^3 - 7*x^2 + 14*x - 6}', ...
    'FontName', 'Consolas', 'FontSize', 11.5, 'FontWeight', 'Normal');
xlabel ('x', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');
ylabel ('f(x)', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');


