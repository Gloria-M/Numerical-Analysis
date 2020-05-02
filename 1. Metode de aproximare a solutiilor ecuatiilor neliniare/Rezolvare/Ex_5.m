% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_5.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru plotarea sub forma de animatie a graficului functiei si
% evidentierea alegerii gresite / corecte a valorii 'x0'
%

% Incarcarea schemei de culori 'wesColors'
load wesColors;

% Definirea functiei 'f'
% Definirea derivatei intai 'df'
% Definirea derivatei a doua 'ddf'
f = @(x) x.^3 -7 .* x.^2 + 14 .* x - 6;
df = @(x) 3.*x.^2 - 14 .* x + 14;
ddf = @(x) 6 .* x - 14;

% Crearea vectorului 'axaX' cu valori in intervalul [0, 2.5]
% Crearea vectorului 'axaY' cu valori f(axaX)
axaX = 0:0.1:2.5;
axaY = f(axaX);

% Crearea unei figuri pentru modificari ulterioare
fNR = figure('Name', 'Metoda Newton-Raphson', 'NumberTitle', 'off');
set (fNR, 'Color', 'White');

axis ( [0 4.2 -6 3.2] );
hold on;

axaOx = plot (xlim, [0 0]);
axa2y = plot ([2 2], [-6, f(2)]);
axaf2 = plot ([0 f(2)], [2 f(2)]);
grafic = plot (axaX, axaY);

set (gca, 'FontSize', 8, 'FontName', 'Consolas');
set (gca, 'Box', 'off');
set (gca, 'TickDir', 'out', 'XTick', [0:5], 'YTick', [-6:2:4]);
set (grafic, 'LineStyle', '-', 'LineWidth', 0.8, 'Color', 'Black');
set (axaOx, 'LineStyle', '--', 'LineWidth', 0.3, 'Color', wesColors(11, :));
set (axa2y, 'LineStyle', ':', 'LineWidth', 1, 'Color', wesColors(2, :));
set (axaf2, 'LineStyle', ':', 'LineWidth', 1, 'Color', wesColors(2, :));

title ('{\bfGraficul functiei} {\itf(x) = x^3 - 7*x^2 + 14*x - 6}', ...
    'FontName', 'Consolas', 'FontSize', 11.5, 'FontWeight', 'Normal');
xlabel ('x', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');
ylabel ('f(x)', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');

% In continuare, plotare sub forma de animatie pentru evidentierea alegerii
% gresite / corecte a punctului 'x0'
pause(1);
x0 = plot (2, f(2), '.');
set (x0, 'Marker', 'o', 'MarkerFaceColor', wesColors(2, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 6.0);
mesajx0 = sprintf (strcat ('x_0= ', num2str (2)));
textMarker = text (2.1, f(2), mesajx0, 'FontName', 'Consolas',...
    'FontSize', 8);

pause(1);
tangenta1 = refline(df(2), 6);
axis ( [0 4.2 -6 3.2] );
tangenta1.Color = wesColors(11, :);
uistack (tangenta1, 'bottom');

xAprox1 = MetNR (f, df, 2, 1e-3);
pause(0.5);
x1 = plot (xAprox1, f(xAprox1), '.');
set (x1, 'Marker', 'o', 'MarkerFaceColor', wesColors(11, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 6.0);
mesajx1 = sprintf (strcat ('x^*_ _1= ', num2str (xAprox1)));
textMarker = text (xAprox1 + 0.1, f(xAprox1), mesajx1, 'FontName', 'Consolas',...
    'FontSize', 8);

pause(2);
axa1y = plot ([1 1], [-6, f(1)]);
set (axa1y, 'LineStyle', ':', 'LineWidth', 1, 'Color', wesColors(2, :));
x0 = plot (1, f(1), '.');
set (x0, 'Marker', 'o', 'MarkerFaceColor', wesColors(2, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 6.0);
mesajx0 = sprintf (strcat ('x_0= ', num2str (1)));
textMarker = text (1.1, f(1), mesajx0, 'FontName', 'Consolas',...
    'FontSize', 8);

xAprox2 = MetNR (f, df, 1, 1e-3);

pause(0.5);
x2 = plot (xAprox2, f(xAprox2), '.');
set (x2, 'Marker', 'o', 'MarkerFaceColor', wesColors(11, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 6.0);
mesajx2 = sprintf (strcat ('x^*_ _2= ', num2str (xAprox2)));
textMarker = text (xAprox2 + 0.1, f(xAprox2), mesajx2, 'FontName', 'Consolas',...
    'FontSize', 8);