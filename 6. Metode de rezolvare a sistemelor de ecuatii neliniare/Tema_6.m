
% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------

%% EXERCITIUL 3.c.

load wesColors;   % Incarcarea schemei de culori 'wesColors'

% Definirea simbolica a functiei 'g'
syms x
g = (-2*x^2 + x + 3)^(1/4);

% Salvarea figurii pentru setari ulterioare
fPF3c = figure('Name', 'Metoda Punctului Fix', 'NumberTitle', 'off');
set (fPF3c, 'Color', 'White');

axis([-1.2 1.7 -1.2 1.7]);        % Definirea limitelor axelox
hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
a.GridColor = wesColors(3, :);
set (gca, 'FontSize', 8, 'FontName', 'Consolas');
set (gca, 'Box', 'off');
set (gca, 'TickDir', 'out', 'XTick', -1:0.5:1.5, 'YTick', -1:0.5:1.5);

% Plotarea graficului functiei g
graficG = fplot (g, [-1 1.5]);
set (graficG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');

% Plotarea unui patrat cu varfurile capetele intervalului [a, b]
patrat = rectangle('Position',[-1 -1 2.5 2.5]);
patrat.EdgeColor = wesColors(3, :);
patrat.LineWidth = 0.8;

% Adaugarea titlului
titlu = title ('{\bfGraficul functiei  } {\itg(x) = (3 + x - 2x ^{ 2})^{1/4}}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 10, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('g(x)');
set(axaY, 'FontSize', 10, 'FontWeight', 'Bold');


%% EXERCITIUL 3.d.

load wesColors;   % Incarcarea schemei de culori 'wesColors'

% Definirea simbolica a functiei 'g' si calculul derivatei
syms x
g = (-2*x^2 + x + 3)^(1/4);
dg = diff(g);

% Salvarea figurii pentru setari ulterioare
fPF3d = figure('Name', 'Metoda Punctului Fix', 'NumberTitle', 'off');
fPF3d.Color = 'White';

axis([-1.1 1.6 -5 5]);        % Definirea limitelor axelox
hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
set(a, 'GridColor', wesColors(2, :));
set(a, 'FontSize', 8, 'FontName', 'Consolas');
set(a, 'Box', 'off');
set(a, 'TickDir', 'out', 'XTick', -1:0.25:1.5, 'YTick', -5:1:10);

% Plotarea graficului functiei g
graficDG = fplot (dg, [-1 1.49]);
set(graficDG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(2, :));

% Plotarea graficului derivatei functiei g
graficG = fplot (g, [-1 1.5]);
set(graficG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));

% Trasarea dreptei de ecuatie y = 1
axa1y = plot (ylim, [-1 -1]);
set(axa1y, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');
text1y = text (1.5, 1.16, 'y = 1');
set(text1y, 'FontName', 'Consolas', 'FontSize', 7);

% Trasarea dreptei de ecuatie y = -1
axa_1y = plot (ylim, [1 1]);
set(axa_1y, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');
text_1y = text (1.5, -0.84, 'y = -1');
set(text_1y, 'FontName', 'Consolas', 'FontSize', 7);

% Plotarea unui patrat pentru a evidentia intervalul pe care exista un unic
% punct fix si este asigurata convergenta la radacina functiei f
rectangle('Position', [1 1 0.25 0.25]);

% Adaugarea titlului
titlu = title ('{\bfGraficele functiilor  } {\itg\prime(x)} {\bfsi} {\itg(x)}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('g(x) , g \prime(x)');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('g\prime(x)', 'g(x)');
set(legenda, 'Location', 'NorthEast', 'Box', 'off');


%% EXERCITIUL 3.e.

% Definirea simbolica a functiei 'g' si transformarea in functie numerica
syms x
g = (-2*x^2 + x + 3)^(1/4);
gFunc = matlabFunction(g);

% Initializam aproximarea initiala 'x1' cu 1
x0 = 1;

% Cat timp nu am obtinut o aproximare tolerata, continuam iterativ
while (true)
    
    % Calculam urmatoarea aproximare 'x0'
    x1 = gFunc(x0);
    
    % Verificam daca am obtinut o aproximare suficient de buna
    if abs(x1 - x0) < 1e-5
        break;
    end
    
    x0 = x1;
    
end

% Afisam solutia aflata prin metoda punctului fix
fprintf('\n\nSolutia aproximata prin metoda punctului fix este\nx = %f', x1);


%% EXERCITIUL 3.f.

load wesColors;   % Incarcarea schemei de culori 'wesColors'

% Definirea simbolica a functiei 'g' si transformarea in functie numerica
syms x
f = x^4 + 2 * x^2 - x - 3;
fFunc = matlabFunction(f);

% Salvarea figurii pentru setari ulterioare
fPF3f = figure('Name', 'Metoda Punctului Fix', 'NumberTitle', 'off');
fPF3f.Color = 'White';

axis([-1.1 1.6 -3.9 5.9]);        % Definirea limitelor axelox
hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
set(a, 'GridColor', wesColors(2, :));
set(a, 'FontSize', 8, 'FontName', 'Consolas');
set(a, 'Box', 'off');
set(a, 'TickDir', 'out', 'XTick', -1:0.25:1.5, 'YTick', -5:1:10);

% Plotarea graficului functiei f
graficF = fplot(f, [-1 1.5]);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');

% Plotarea dreptei y pe care se afla solutia
axa0y = plot (ylim, [0 0]);
set(axa0y, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');

% Plotarea dreptei x pe care se afla solutia
axaSolx = plot([x1 x1], [-4 6]);
set(axaSolx, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');

% Plotarea solutiei aproximate si adaugarea de indicatii specifice
aproximare = plot(x1, fFunc(x1));
set (aproximare, 'Marker', 'o', 'MarkerFaceColor', wesColors(1, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 7.0);
mesajMarker = sprintf (strcat ('(', num2str (x1, 5), ',', ...
    num2str (fFunc(x1), 1), ')'));
textMarker = text (x1 + 0.025, fFunc(x1) - 0.25, mesajMarker);
set(textMarker, 'FontName', 'Consolas', 'FontSize', 7);

% Adaugarea titlului
titlu = title ('{\bfGraficul functiei} {\itf(x) = x^4 + 2x^2 - x - 3}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f(x)');
set(axaY, 'FontSize', 9, 'FontWeight', 'Bold');


%% EXERCITIUL 4.1.c

load wesColors;   % Incarcarea schemei de culori 'wesColors'

% Definirea simbolica a functiei 'g'
syms x
g = ((x + 3)/(x^2 + 2))^(1/2);

% Salvarea figurii pentru setari ulterioare
fPF4_1c = figure('Name', 'Metoda Punctului Fix', 'NumberTitle', 'off');
set (fPF4_1c, 'Color', 'White');

axis([-3.3 10 -3.2 3]);        % Definirea limitelor axelox
hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
a.GridColor = wesColors(3, :);
set (gca, 'FontSize', 8, 'FontName', 'Consolas');
set (gca, 'Box', 'off');
set (gca, 'TickDir', 'out', 'XTick', -3:10, 'YTick', -3:0.5:2.9);

% Plotarea graficului functiei g
graficG = fplot (g, [-3 20]);
set (graficG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');

% Plotarea unui patrat cu varfurile capetele intervalului [a, b]
patrat = rectangle('Position',[-3 -3 30 30]);
patrat.EdgeColor = wesColors(3, :);
patrat.LineWidth = 0.8;

% Adaugarea titlului si indicatiilor pe cele doua axe
title ('{\bfGraficul functiei  } {\itg(x) = ((x + 3)/(x ^{ 2} + 2))^{ 1/2}}', ...
    'FontName', 'Consolas', 'FontSize', 11.5, 'FontWeight', 'Normal');
xlabel ('x', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');
ylabel ('g(x)', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');


%% EXERCITIUL 4.1.d.

load wesColors;   % Incarcarea schemei de culori 'wesColors'

% Definirea simbolica a functiei 'g' si calculul derivatei
syms x
g = ((x + 3)/(x^2 + 2))^(1/2);
dg = diff(g);

% Salvarea figurii pentru setari ulterioare
fPF4_1d = figure('Name', 'Metoda Punctului Fix', 'NumberTitle', 'off');
fPF4_1d.Color = 'White';

axis([-3.3 10 -3.2 3]);        % Definirea limitelor axelox
hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
set(a, 'GridColor', wesColors(2, :));
set(a, 'FontSize', 8, 'FontName', 'Consolas');
set(a, 'Box', 'off');
set(a, 'TickDir', 'out', 'XTick', -3:10, 'YTick', -3:0.5:2.9);

% Plotarea graficului functiei g
graficDG = fplot (dg, [-3 20]);
set(graficDG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(2, :));

% Plotarea graficului derivatei functiei g
graficG = fplot (g, [-3 20]);
set(graficG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));

% Trasarea dreptei de ecuatie y = 1
axa1y = plot([-3.3 10], [1 1]);
set(axa1y, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');
text1y = text (9, 1.16, 'y = 1');
set(text1y, 'FontName', 'Consolas', 'FontSize', 7);

% Trasarea dreptei de ecuatie y = -1
axa_1y = plot([-3.3 10], [-1 -1]);
set(axa_1y, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');
text_1y = text (9, -0.84, 'y = -1');
set(text_1y, 'FontName', 'Consolas', 'FontSize', 7);

% Plotarea unui patrat pentru a evidentia intervalul pe care exista un unic
% punct fix si este asigurata convergenta la radacina functiei f
rectangle('Position', [-2.5 -2.5 5 5 ]);

% Adaugarea titlului
titlu = title ('{\bfGraficele functiilor  } {\itg\prime(x)} {\bfsi} {\itg(x)}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('g(x) , g \prime(x)');
set(axaY, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('g\prime(x)', 'g(x)');
set(legenda, 'Location', 'NorthEast', 'Box', 'off');


%% EXERCITIUL 4.1.e.

% Definirea simbolica a functiei 'g' si transformarea in functie numerica
syms x
g = ((x + 3)/(x^2 + 2))^(1/2);
gFunc = matlabFunction(g);

% Initializam aproximarea initiala 'x0' cu 1
x0 = 1;

% Cat timp nu am obtinut o aproximare tolerata, continuam iterativ
while (true)
    
    % Calculam urmatoarea aproximare 'x1'
    x1 = gFunc(x0);
    
    % Verificam daca am obtinut o aproximare suficient de buna
    if abs(x1 - x0) < 1e-5
        break;
    end
    
    x0 = x1;
    
end

% Afisam solutia aflata prin metoda punctului fix
fprintf('\n\nSolutia aproximata prin metoda punctului fix este\nx = %f', x1);


%% EXERCITIUL 4.1.f.

load wesColors;   % Incarcarea schemei de culori 'wesColors'

% Definirea simbolica a functiei 'g' si transformarea in functie numerica
syms x
f = x^4 + 2 * x^2 - x - 3;
fFunc = matlabFunction(f);

% Salvarea figurii pentru setari ulterioare
fPF4_1f = figure('Name', 'Metoda Punctului Fix', 'NumberTitle', 'off');
fPF4_1f.Color = 'White';

axis([-1.1 1.6 -3.9 5.9]);        % Definirea limitelor axelox
hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
set(a, 'GridColor', wesColors(2, :));
set(a, 'FontSize', 8, 'FontName', 'Consolas');
set(a, 'Box', 'off');
set(a, 'TickDir', 'out', 'XTick', -1:0.25:1.5, 'YTick', -5:1:10);

% Plotarea graficului functiei f
graficF = fplot(f, [-1 1.5]);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');

% Plotarea dreptei y pe care se afla solutia
axa0y = plot (ylim, [0 0]);
set(axa0y, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');

% Plotarea dreptei x pe care se afla solutia
axaSolx = plot([x1 x1], [-4 6]);
set(axaSolx, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');

% Plotarea solutiei aproximate si adaugarea de indicatii specifice
aproximare = plot(x1, fFunc(x1));
set (aproximare, 'Marker', 'o', 'MarkerFaceColor', wesColors(1, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 7.0);
mesajMarker = sprintf (strcat ('(', num2str (x1, 5), ',', ...
    num2str (fFunc(x1), 1), ')'));
textMarker = text (x1 + 0.025, fFunc(x1) - 0.25, mesajMarker);
set(textMarker, 'FontName', 'Consolas', 'FontSize', 7);

% Adaugarea titlului
titlu = title ('{\bfGraficul functiei} {\itf(x) = x^4 + 2x^2 - x - 3}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f(x)');
set(axaY, 'FontSize', 9, 'FontWeight', 'Bold');


%% EXERCITIUL 4.2.c

load wesColors;   % Incarcarea schemei de culori 'wesColors'

% Definirea simbolica a functiei 'g'
syms x
g = ((x + 3 - x^4)/2)^(1/2);

% Salvarea figurii pentru setari ulterioare
fPF4_2c = figure('Name', 'Metoda Punctului Fix', 'NumberTitle', 'off');
fPF4_2c.Color = 'White';

axis([-1.5 1.7 -1.5 1.7]);        % Definirea limitelor axelox
hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
a.GridColor = wesColors(3, :);
set (gca, 'FontSize', 8, 'FontName', 'Consolas');
set (gca, 'Box', 'off');
set (gca, 'TickDir', 'out', 'XTick', -1:0.5:1.5, 'YTick', -1:0.5:1.5);

% Plotarea graficului functiei g
graficG = fplot (g, [-1.164 1.4526]);
set (graficG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');

% Plotarea unui patrat cu varfurile capetele intervalului [a, b]
patrat = rectangle('Position',[-1.164 -1.164 1.4526+1.164 1.4526+1.164]);
patrat.EdgeColor = wesColors(3, :);
patrat.LineWidth = 0.8;

% Adaugarea titlului si indicatiilor pe cele doua axe
title ('{\bfGraficul functiei  } {\itg(x) = ((x + 3)/(x ^{ 2} + 2)) ^{1/2}}', ...
    'FontName', 'Consolas', 'FontSize', 11.5, 'FontWeight', 'Normal');
xlabel ('x', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');
ylabel ('g(x)', 'FontName', 'Consolas', 'FontSize', 10, 'FontWeight', 'Bold');


%% EXERCITIUL 4.2.d.

load wesColors;   % Incarcarea schemei de culori 'wesColors'

% Definirea simbolica a functiei 'g' si calculul derivatei
syms x
g = ((x + 3 - x^4)/2)^(1/2);
dg = diff(g);

% Salvarea figurii pentru setari ulterioare
fPF4_2d = figure('Name', 'Metoda Punctului Fix', 'NumberTitle', 'off');
fPF4_2d.Color = 'White';

axis([-1.5 1.7 -1.5 1.7]);        % Definirea limitelor axelox
hold on;
grid on;

% Modificarea aspectului plotarii
a = gca;
set(a, 'GridColor', wesColors(2, :));
set(a, 'FontSize', 8, 'FontName', 'Consolas');
set(a, 'Box', 'off');
set(a, 'TickDir', 'out', 'XTick', -1:0.5:1.5, 'YTick', -1:0.5:1.5);

% Plotarea graficului functiei g
graficDG = fplot (dg, [-1.164 1.45257]);
set(graficDG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(2, :));

% Plotarea graficului derivatei functiei g
graficG = fplot (g, [-1.164 1.45261]);
set(graficG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));

% Trasarea dreptei de ecuatie y = 1
axa1y = plot([-1.5 1.7], [1 1]);
set(axa1y, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');
text1y = text (1.45, 1.05, 'y = 1');
set(text1y, 'FontName', 'Consolas', 'FontSize', 7);

% Trasarea dreptei de ecuatie y = -1
axa_1y = plot([-1.5 1.7], [-1 -1]);
set(axa_1y, 'LineStyle', ':', 'LineWidth', 0.5, 'Color', 'Black');
text_1y = text (1.45, -0.95, 'y = -1');
set(text_1y, 'FontName', 'Consolas', 'FontSize', 7);

% Plotarea unui patrat pentru a evidentia intervalul pe care exista un unic
% punct fix si este asigurata convergenta la radacina functiei f
patrat = rectangle('Position',[-0.75 -0.75 1.85 1.85]);
patrat.EdgeColor = 'Black';
patrat.LineWidth = 0.6;

% Adaugarea titlului
titlu = title ('{\bfGraficele functiilor  } {\itg\prime(x)} {\bfsi} {\itg(x)}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('g(x) , g \prime(x)');
set(axaY, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('g\prime(x)', 'g(x)');
set(legenda, 'Location', 'NorthEast', 'Box', 'off');


%% EXERCITIUL 6.c.

% Definirea simbolica a functiilor 'g1' si 'g2' si transformarea in functii
% numerice
syms x1 x2
g1 = (x1^2 + x2^2 + 8) / 10;
g1Func = matlabFunction(g1);
g2 = (x1 * x2^2 + x1 + 8) / 10;
g2Func = matlabFunction(g2);

% Initializam aproximarea initiala 'x0' cu 1
x0 = ones(1, 2);
x1 = x0;

% Cat timp nu am obtinut o aproximare tolerata, continuam iterativ
while (true)
    
    % Calculam urmatoarea aproximare 'x1'
    x1(1) = g1Func(x0(1),x0(2));
    x1(2) = g2Func(x0(1),x0(2));
    
    % Verificam daca am obtinut o aproximare suficient de buna
    if norm(x1 - x0, Inf) < 1e-5
        break;
    end
    
    x0 = x1;
    
end

% Afisam solutia aflata prin metoda punctului fix
fprintf('\n\nSolutia aproximata prin metoda punctului fix este\nx =');
disp(x1);



