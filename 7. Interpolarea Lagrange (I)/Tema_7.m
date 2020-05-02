%% EXERCITIUL 1.

load wesColors;

% Declararea ecuatiilor sistemului
syms x y
f = x^2 + y^2 - 4;
g = 1/8 * x^2 - y;

% Calcularea matricei Jacobian prin apelarea functiei 'Jacobian'
J = Jacobian([x, y], [f, g]);
% Afisarea matricei Jacobian
fprintf('Matricea Jacobian a sistemului este:\n');
disp(J);

% Valorile de pornire pentru calcularea solutiilor sistemului
x01 = [-1.5 0.5];
x02 = [1.5 0.5];
epsilon = 1e-6;
% Calcularea solutiilor sistemului prin apelarea functiei Newton
[xAprox1, N1] = Newton([f, g], J, x01, epsilon);
[xAprox2, N2] = Newton([f, g], J, x02, epsilon);
% Afisarea solutiilor sistemului
fprintf('Solutiile sistemului sunt:\n\t(x1, y1) =');
disp(xAprox1);
fprintf('\t(x2, y2) =');
disp(xAprox2);

% Gruparea intr-o figura a ploturilor sub forma de tab-uri
fN1b = figure('Name', 'Metoda Newton', 'NumberTitle', 'off');
set (fN1b, 'Color', 'White');

% Crearea grupului de tab-uri
grup = uitabgroup;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GRAFICELE FUNCTIILOR
e4b = uitab(grup);
e4b.Title ='Graficele f si g';
e4b.BackgroundColor = 'White';

axe1 = axes('parent', e4b); 
grid on;
hold on;
% Graficul functiei f
graficF = fimplicit (f, [-3 3 -3 3]);
set (graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(2, :));
% Plotarea graficului functiei g
graficG = fimplicit (g, [-3 3 -3 3]);
set (graficG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
% Modificarea aspectului plotarii
axe1.GridColor = wesColors(2, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [-3 3];
axe1.YLim = [-3 3];
% Adaugarea titlului
titlu = title ('{\bfGraficul functiilor sistemului } {\itF = (f(x,y), g(x,y))}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x , y');
set(axaX, 'FontSize', 10, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f(x,y) , g(x,y)');
set(axaY, 'FontSize', 10, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'g(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PUNCTELE DE INTERSECTIE
e4e = uitab(grup);
e4e.Title ='Punctele de intersectie';
e4e.BackgroundColor = 'White';

axe1 = axes('parent', e4e); 
grid on;
hold on;
% Graficul functiei f
graficF = fimplicit (f, [-3 3 -3 3]);
set (graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(2, :));
% Plotarea graficului functiei g
graficG = fimplicit (g, [-3 3 -3 3]);
set (graficG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
% Modificarea aspectului plotarii
axe1.GridColor = wesColors(2, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [-3 3];
axe1.YLim = [-3 3];
% Marcarea solutiilor sistemului (punctele de intersctie)
% Indicarea coordonatelor fiecaruia
sol1 = plot(xAprox1(1),xAprox1(2), '.');
set (sol1, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
sol1Text = sprintf(strcat('(', num2str(xAprox1(1), 5), ',\n', ...
    num2str(xAprox1(2), 4), ')'));
text (xAprox1(1)-0.7, xAprox1(2)-0.2, sol1Text, ...
    'FontName', 'Consolas', 'FontSize', 7);
sol2 = plot(xAprox2(1),xAprox2(2), '.');
set (sol2, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
sol2Text = sprintf(strcat('(', num2str(xAprox2(1), 5), ',\n', ...
    num2str(xAprox2(2), 4), ')'));
text (xAprox2(1)+0.1, xAprox2(2)-0.2, sol2Text, ...
    'FontName', 'Consolas', 'FontSize', 7);
% Adaugarea titlului
titlu = title ('{\bfGraficul functiilor sistemului } {\itF = (f(x,y), g(x,y))}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x , y');
set(axaX, 'FontSize', 10, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f(x,y) , g(x,y)');
set(axaY, 'FontSize', 10, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'g(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');


%% EXERCITIUL 2.

load wesColors;

% Declararea ecuatiilor sistemului
syms x1 x2
f = x1^2 -10 * x1 + x2^2 + 8;
g = x1 * x2^2 + x1 - 10 * x2 + 8;

% Calcularea matricei Jacobian prin apelarea functiei 'Jacobian'
J = Jacobian([x1, x2], [f, g]);
% Afisarea matricei Jacobian
fprintf('Matricea Jacobian a sistemului este:\n');
disp(J);

% Valorile de pornire pentru calcularea solutiilor sistemului
x01 = [1.5 0.5];
x02 = [2.5 3];
epsilon = 1e-6;

% Calcularea solutiilor sistemului prin apelarea functiei Newton
[xAprox1, N1] = Newton([f, g], J, x01, epsilon);
[xAprox2, N2] = Newton([f, g], J, x02, epsilon);
% Afisarea solutiilor sistemului
fprintf('Solutiile sistemului sunt:\n\t(x1, y1) =');
disp(xAprox1);
fprintf('\t(x2, y2) =');
disp(xAprox2);

% Gruparea intr-o figura a ploturilor sub forma de tab-uri
fN1b = figure('Name', 'Metoda Newton', 'NumberTitle', 'off');
set (fN1b, 'Color', 'White');

% Crearea grupului de tab-uri
grup = uitabgroup;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GRAFICELE FUNCTIILOR
e4b = uitab(grup);
e4b.Title ='Graficele f si g';
e4b.BackgroundColor = 'White';

axe1 = axes('parent', e4b); 
grid on;
hold on;
% Graficul functiei f
graficF = fimplicit(f, [0 5 0 5]);
set (graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(2, :));
% Plotarea graficului functiei g
graficG = fimplicit(g, [0 5 0 5]);
set (graficG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
% Modificarea aspectului plotarii
axe1.GridColor = wesColors(2, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [0 5];
% axe1.YLim = [0 5];
% Adaugarea titlului
titlu = title ('{\bfGraficul functiilor sistemului } {\itF = (f(x,y), g(x,y))}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x , y');
set(axaX, 'FontSize', 10, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f(x,y) , g(x,y)');
set(axaY, 'FontSize', 10, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'g(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PUNCTELE DE INTERSECTIE
e4e = uitab(grup);
e4e.Title ='Punctele de intersectie';
e4e.BackgroundColor = 'White';

axe1 = axes('parent', e4e); 
grid on;
hold on;
% Graficul functiei f
graficF = fimplicit (f, [0 5 0 5]);
set (graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(2, :));
% Plotarea graficului functiei g
graficG = fimplicit (g, [0 5 0 5]);
set (graficG, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
% Modificarea aspectului plotarii
axe1.GridColor = wesColors(2, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [0 5];
axe1.YLim = [0 5];
% Marcarea solutiilor sistemului (punctele de intersctie)
% Indicarea coordonatelor fiecaruia
sol1 = plot(xAprox1(1),xAprox1(2), '.');
set (sol1, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
sol1Text = sprintf(strcat('(', num2str(xAprox1(1), 5), ',', ...
    num2str(xAprox1(2), 4), ')'));
text (xAprox1(1)-0.3, xAprox1(2)+0.19, sol1Text, ...
    'FontName', 'Consolas', 'FontSize', 7);
sol2 = plot(xAprox2(1),xAprox2(2), '.');
set (sol2, 'Marker', 'o', 'MarkerFaceColor', wesColors(10, :), ...
    'MarkerEdgeColor', 'Black', 'MarkerSize', 5.0);
sol2Text = sprintf(strcat('(', num2str(xAprox2(1), 5), ',\n', ...
    num2str(xAprox2(2), 4), ')'));
text (xAprox2(1)+0.1, xAprox2(2)-0.05, sol2Text, ...
    'FontName', 'Consolas', 'FontSize', 7);
% Adaugarea titlului
titlu = title ('{\bfGraficul functiilor sistemului } {\itF = (f(x,y), g(x,y))}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x , y');
set(axaX, 'FontSize', 10, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f(x,y) , g(x,y)');
set(axaY, 'FontSize', 10, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'g(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');


%% EXERCITIUL 4.2

load wesColors;

% Declararea functii f
syms x
f(x) = sin(x);
fFunc = matlabFunction(f);

X = linspace(-pi/2, pi/2, 4);
Y = f(X);

% Calcularea polinomului de interpolare prin cele trei metode
PD = MetDirecta(X, Y, x);
PL = MetLagrange(X, Y, x);
PN = MetN(X, Y, x);

% Calcularea valorilor polinoamelor de interpolare p intervalul dat
X_g = linspace(-pi/2, pi/2, 100);
Y_f = subs(f, X_g);
Y_D = subs(PD, X_g);
Y_L = subs(PL, X_g);
Y_N = subs(PN, X_g);

% Gruparea intr-o figura a ploturilor sub forma de tab-uri
fGr = figure('Name', 'Polinomul de interpolare', 'NumberTitle', 'off');
fGr.Color = 'White';

% Crearea grupului de tab-uri
grup = uitabgroup;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METODA DIRECTA
% Tab-ul in care este reprezentat polinomul de interpolare calculat prin
% metoda Directa
MD = uitab(grup);
MD.Title ='Metoda Directa';
MD.BackgroundColor = 'White';

axe1 = axes('parent', MD); 
grid on;
hold on;
% Graficul functiei f
graficF = plot(X_g, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Graficul polinomului calculat prin metoda directa
graficPD = plot(X_g, Y_D);
set(graficPD, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
% Setarea axelor
axe1.GridColor = wesColors(11, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [-pi/2 pi/2];
axe1.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
axe1.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
axe1.YLim = [-1.05 1.05];
axe1.YTick = -1:0.5:1;
% Marcarea punctelor(X_i, Y_i) de pornire
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
axaY = ylabel ('f(x) , P_3(x)');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'P_3(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METODA NEWTON
% Tab-ul in care este reprezentat polinomul de interpolare calculat prin
% metoda Newton
ML = uitab(grup);
ML.Title ='Metoda Lagrange';
ML.BackgroundColor = 'White';

axe1 = axes('parent', ML); 
grid on;
hold on;
graficF = plot(X_g, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Graficul polinomului calculat prin metoda Lagrange
graficPL = plot(X_g, Y_L);
set(graficPL, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
% Setarea axelor
axe1.GridColor = wesColors(11, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [-pi/2 pi/2];
axe1.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
axe1.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
axe1.YLim = [-1.05 1.05];
axe1.YTick = -1:0.5:1;
% Marcarea punctelor(X_i, Y_i) de pornire
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
axaY = ylabel ('f(x) , P_3(x)');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'P_3(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METODA NEWTON
% Tab-ul in care este reprezentat polinomul de interpolare calculat prin
% metoda Newton
MN = uitab(grup);
MN.Title = 'Metoda Newton';
MN.BackgroundColor = 'White';

axe1 = axes('parent', MN); 
grid on;
hold on;
% Graficul functiei f
graficF = plot(X_g, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Graficul polinomului calculat prin metoda Newton
graficPN = plot(X_g, Y_N);
set(graficPN, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
% Setarea axelor
axe1.GridColor = wesColors(11, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [-pi/2 pi/2];
axe1.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
axe1.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
axe1.YLim = [-1.05 1.05];
axe1.YTick = -1:0.5:1;
% Marcarea punctelor(X_i, Y_i) de pornire
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
axaY = ylabel ('f(x) , P_3(x)');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'P_3(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');



%% EXERCITIUL 4.3. Calculul erorii

load wesColors;

% Declararea functiei f
syms x
f(x) = sin(x);
fFunc = matlabFunction(f);

X = linspace(-pi/2, pi/2, 4);
Y = f(X);

% Calcularea polinomului de interpolare de grad 3 prin cele trei metode
PD = MetDirecta(X, Y, x);
PL = MetLagrange(X, Y, x);
PN = MetN(X, Y, x);

X_g = linspace(-pi/2, pi/2, 100);
% Calcularea valorilor polinoamelor de interpolare pe intervalul dat
Y_f = subs(f, X_g);
Y_D = subs(PD, X_g);
Y_L = subs(PL, X_g);
Y_N = subs(PN, X_g);

% Calcularea erorilor polinoamelor de interpolare pe intervalul dat
ED = abs(Y_f - Y_D);
EL = abs(Y_f - Y_L);
EN = abs(Y_f - Y_N);

% Gruparea intr-o figura a ploturilor sub forma de tab-uri
fE = figure('Name', 'Eroarea de interpolare', 'NumberTitle', 'off');
set (fE, 'Color', 'White');

% Crearea grupului de tab-uri
grup = uitabgroup;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METODA DIRECTA
% Tab-ul in care este reprezentata eroarea polinomul de interpolare 
% de grad 3 calculat prin metoda directa
ErrD = uitab(grup);
ErrD.Title ='Metoda Directa';
ErrD.BackgroundColor = 'White';

axe1 = axes('parent', ErrD); 
grid on;
hold on;
% Graficul erorii
graficED = plot(X_g, ED);
set(graficED, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');
% Setarea axelor
axe1.GridColor = wesColors(11, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [-5*pi/8 5*pi/8];
axe1.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
axe1.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
axe1.YLim = [0 0.013];
axe1.YTick = 0:0.001:0.012;
% Adaugarea titlului
titlu = title ('{\bfEroarea de interpolare }');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('E=|f(x)-P_3(x)|');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METODA LAGRANGE
% Tab-ul in care este reprezentata eroarea polinomul de interpolare 
% de grad 3 calculat prin metoda Lagrange
ErrL = uitab(grup);
ErrL.Title ='Metoda Lagrange';
ErrL.BackgroundColor = 'White';

axe1 = axes('parent', ErrL); 
grid on;
hold on;
% Graficul erorii
graficPL = plot(X_g, EL);
set(graficPL, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');
% Setarea axelor
axe1.GridColor = wesColors(11, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [-5*pi/8 5*pi/8];
axe1.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
axe1.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
axe1.YLim = [0 0.013];
axe1.YTick = 0:0.001:0.012;
% Adaugarea titlului
titlu = title ('{\bfEroarea de interpolare }');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('E=|f(x)-P_3(x)|');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METODA NEWTON
% Tab-ul in care este reprezentata eroarea polinomul de interpolare 
% de grad 3 calculat prin metoda Newton
ErrN = uitab(grup);
ErrN.Title = 'Metoda Newton';
ErrN.BackgroundColor = 'White';

axe1 = axes('parent', ErrN); 
grid on;
hold on;
% Graficul erorii
graficEN = plot(X_g, EN);
set(graficEN, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', 'Black');
% Setarea axelor
axe1.GridColor = wesColors(11, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [-5*pi/8 5*pi/8];
axe1.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
axe1.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
axe1.YLim = [0 0.013];
axe1.YTick = 0:0.001:0.012;
% Adaugarea titlului
titlu = title ('{\bfEroarea de interpolare }');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('E=|f(x)-P_3(x)|');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');


%% EXERCITIUL 4.4 Gradul maxim

load wesColors;

% Declararea functiei simbolice f
syms x
f(x) = sin(x);

% Calcularea polinoamului de interpolare de grad 100 prin metoda directa
XD = linspace(-pi/2, pi/2, 100);
YD = f(XD);
PD = MetDirecta(XD, YD, x);

% Calcularea polinoamelor de interpolare de grad 63 si 64 prin metoda
% Lagrange
XL1 = linspace(-pi/2, pi/2, 63);
XL2 = linspace(-pi/2, pi/2, 64);
YL1 = f(XL1);
YL2 = f(XL2);
PL1 = MetLagrange(XL1, YL1, x);
PL2 = MetLagrange(XL2, YL2, x);

% Calcularea polinoamelor de interpolare de grad 65 si 66 prin metoda
% Newton
XN1 = linspace(-pi/2, pi/2, 65);
XN2 = linspace(-pi/2, pi/2, 66);
YN1 = f(XN1);
YN2 = f(XN2);
PN1 = MetN(XN1, YN1, x);
PN2 = MetN(XN2, YN2, x);

% Calcularea valorilor polinoamelor obtinute pe intervalul [-pi/2, pi/2]
X = linspace(-pi/2, pi/2, 100);
Y_f = subs(f, X);
Y_D = subs(PD, X);
Y_L1 = subs(PL1, X);
Y_L2 = subs(PL2, X);
Y_N1 = subs(PN1, X);
Y_N2 = subs(PN2, X);

% Gruparea intr-o figura a ploturilor sub forma de tab-uri
fGr = figure('Name', 'Grad maxim', 'NumberTitle', 'off');
fGr.Color = 'White';
% Crearea grupului de tab-uri
grup = uitabgroup;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METODA DIRECTA
% Tab-ul in care este reprezentat polinomul de interpolare calculat prin
% metoda directa
MD = uitab(grup);
MD.Title ='Metoda Directa';
MD.BackgroundColor = 'White';

% Plotarea graficului principal
axe1 = axes('parent', MD, 'Position', [0.1 0.1 0.8 0.8]); 
grid on;
hold on;
graficF = plot(X, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
graficPD = plot(X, Y_D);
set(graficPD, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
% Setarile axelor
axe1.GridColor = wesColors(11, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [-pi/2 pi/2];
axe1.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
axe1.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
axe1.YLim = [-1.05 1.05];
axe1.YTick = -1:0.5:1;
% Adaugarea titlului
titlu = title ('{\bfFunctia } {\itf(x)} {\bf si polinomul de interpolare } {\itP_n(x)}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f(x) , P_{100}(x)');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'P_{100}(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');

% Plot +ZOOM pe capatul din dreapta al intervalului
axe2 = axes('parent', MD, 'Position', [0.2 0.695 0.2 0.2]);
grid on;
hold on;
% Graficul functiei f
graficF = plot(X, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Graficul polinomului de grad 100
graficPD = plot(X, Y_D);
set(graficPD, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
% Setarea axelor
axe2.GridColor = wesColors(11, :);
axe2.FontSize = 8;
axe2.FontName = 'Consolas';
axe2.Box = 'on';
axe2.TickDir = 'in';
axe2.XLim = [3*pi/8 pi/2];
axe2.XTick = ([]);
axe2.YLim = [0.75 1.05];
axe2.YTick = 0.8:0.05:1;

% Plot +ZOOM pe capatul din stanga al intervalului
axe3 = axes('parent', MD, 'Position', [0.2 0.445 0.2 0.2]);
grid on;
hold on;
% Graficul functiei f
graficF = plot(X, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Graficul polinomului de grad 100
graficPD = plot(X, Y_D);
set(graficPD, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
% Setarea axelor
axe3.GridColor = wesColors(11, :);
axe3.FontSize = 8;
axe3.FontName = 'Consolas';
axe3.Box = 'on';
axe3.TickDir = 'in';
axe3.XLim = [-pi/2 -pi/2+0.1];
axe3.XTick = ([]);
axe3.YLim = [-1.1 -0.8];
axe3.YTick = -1.05:0.05:-0.85;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METODA LAGRANGE
% Tab-ul in care este reprezentat polinomul de interpolare calculat prin
% metoda Lagrange
ML = uitab(grup, 'title','Metoda Lagrange');
ML.BackgroundColor = 'White';

% Plotarea graficului principal
axe1 = axes('parent', ML, 'Position', [0.1 0.1 0.8 0.8]); 
grid on;
hold on;
% Graficul functiei f
graficF = plot(X, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Graficele polinoamelor de grad 63 si 64 pentru evidentierea erorilor
graficPL1 = plot(X, Y_L1);
set(graficPL1, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
graficPL2 = plot(X, Y_L2);
set(graficPL2, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(5, :));
% Setarea axelor
axe1.GridColor = wesColors(11, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [-pi/2 pi/2];
axe1.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
axe1.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
axe1.YLim = [-1.05 1.05];
axe1.YTick = -1:0.5:1;
% Adaugarea titlului
titlu = title ('{\bfFunctia } {\itf(x)} {\bf si polinomul de interpolare } {\itP_n(x)}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f(x) , P_{63}(x) , P_{64}(x)');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'P_{63}(x)', 'P_{64}(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');

% Plot +ZOOM pe capatul din dreapta al intervalului
axe2 = axes('parent', ML, 'Position', [0.2 0.695 0.2 0.2]);
grid on;
hold on;
% Graficul functiei f
graficF = plot(X, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Graficele polinoamelor de grad 63 si 64 pentru evidentierea erorilor
graficPL1 = plot(X, Y_L1);
set(graficPL1, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
graficPL2 = plot(X, Y_L2);
set(graficPL2, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(5, :));
% Setarea axelor
axe2.GridColor = wesColors(11, :);
axe2.FontSize = 8;
axe2.FontName = 'Consolas';
axe2.Box = 'on';
axe2.TickDir = 'in';
axe2.XLim = [pi/2-0.1 pi/2];
axe2.XTick = ([]);
axe2.YLim = [0.75 1.05];
axe2.YTick = 0.8:0.05:1;

% Plot +ZOOM pe capatul din stanga al intervalului
axe3 = axes('parent', ML, 'Position', [0.2 0.445 0.2 0.2]);
grid on;
hold on;
% Graficul functiei f
graficF = plot(X, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Graficele polinoamelor de grad 63 si 64 pentru evidentierea erorilor
graficPL1 = plot(X, Y_L1);
set(graficPL1, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
graficPL2 = plot(X, Y_L2);
set(graficPL2, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(5, :));
% Setarea axelor
axe3.GridColor = wesColors(11, :);
axe3.FontSize = 8;
axe3.FontName = 'Consolas';
axe3.Box = 'on';
axe3.TickDir = 'in';
axe3.XLim = [-pi/2 -pi/2+0.1];
axe3.XTick = ([]);
axe3.YLim = [-1.1 -0.8];
axe3.YTick = -1.05:0.05:-0.85;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METODA NEWTON
% Tab-ul in care este reprezentat polinomul de interpolare calculat prin
% metoda Newton
MN = uitab(grup, 'title','Metoda Newton');
MN.BackgroundColor = 'White';

% Plotarea graficului principal
axe1 = axes('parent', MN, 'Position', [0.1 0.1 0.8 0.8]); 
grid on;
hold on;
% Graficul functiei f
graficF = plot(X, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Graficele polinoamelor de grad 65 si 66 pentru evidentierea erorilor
graficPN1 = plot(X, Y_N1);
set(graficPN1, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
graficPN2 = plot(X, Y_N2);
set(graficPN2, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(5, :));
% Setarea axelor
axe1.GridColor = wesColors(11, :);
axe1.FontSize = 8;
axe1.FontName = 'Consolas';
axe1.Box = 'off';
axe1.TickDir = 'out';
axe1.XLim = [-pi/2 pi/2];
axe1.XTick = ([-pi/2 -pi/4 0 pi/4 pi/2]);
axe1.XTickLabel = ({'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});
axe1.YLim = [-1.05 1.05];
axe1.YTick = -1:0.5:1;
% Adaugarea titlului
titlu = title ('{\bfFunctia } {\itf(x)} {\bf si polinomul de interpolare } {\itP_n(x)}');
set(titlu, 'FontSize', 11.5, 'FontWeight', 'Normal');
% Adaugarea indicatiilor pe axa Ox
axaX = xlabel ('x');
set(axaX, 'FontSize', 9, 'FontWeight', 'Bold');
% Adaugarea indicatiilor pe axa Oy
axaY = ylabel ('f(x) , P_{65}(x) , P_{66}(x)');
set(axaY, 'FontSize', 8, 'FontWeight', 'Bold');
% Adaugarea legendei
legenda = legend('f(x)', 'P_{65}(x)', 'P_{66}(x)');
set(legenda, 'Location', 'SouthEast', 'Box', 'off');

% Plot +ZOOM pe capatul din dreapta al intervalului
axe2 = axes('parent', MN, 'Position', [0.2 0.695 0.2 0.2]);
grid on;
hold on;
% Graficul functiei f
graficF = plot(X, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Graficele polinoamelor de grad 65 si 66 pentru evidentierea erorilor
graficPN1 = plot(X, Y_N1);
set(graficPN1, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
graficPN2 = plot(X, Y_N2);
set(graficPN2, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(5, :));
% Setarea axelor
axe2.GridColor = wesColors(11, :);
axe2.FontSize = 8;
axe2.FontName = 'Consolas';
axe2.Box = 'on';
axe2.TickDir = 'in';
axe2.XLim = [pi/2-0.1 pi/2];
axe2.XTick = ([]);
axe2.YLim = [0.75 1.05];
axe2.YTick = 0.8:0.05:1;

% Plot +ZOOM pe capatul din stanga al intervalului
axe3 = axes('parent', MN, 'Position', [0.2 0.445 0.2 0.2]);
grid on;
hold on;
% Graficul functiei f
graficF = plot(X, Y_f);
set(graficF, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(10, :));
% Graficele polinoamelor de grad 65 si 66 pentru evidentierea erorilor
graficPN1 = plot(X, Y_N1);
set(graficPN1, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(12, :));
graficPN2 = plot(X, Y_N2);
set(graficPN2, 'LineStyle', '-', 'LineWidth', 0.6, 'Color', wesColors(5, :));
% Setarea axelor
axe3.GridColor = wesColors(11, :);
axe3.FontSize = 8;
axe3.FontName = 'Consolas';
axe3.Box = 'on';
axe3.TickDir = 'in';
axe3.XLim = [-pi/2 -pi/2+0.1];
axe3.XTick = ([]);
axe3.YLim = [-1.1 -0.8];
axe3.YTick = -1.05:0.05:-0.85;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OBSERVATII
% Tab-ul in care am notat observatiile referitoare la gradul polinoamelor
% de interfolare
OBS = uitab(grup, 'title','Observatii');
OBS.BackgroundColor = 'White';
% Crearea unui textbox pentru scrierea observatiilor
obs = annotation(OBS, 'textbox', [0.1 0.1 0.8 0.8]);
t = strcat('  Polinomul de interpolare calculat prin metoda Lagrange',...
    ' isi pierde caracterul pentru gradul n > 63.', '\n\n', ...
    '  Polinomul de interpolare calculat prin metoda Newton',...
    ' isi pierde caracterul pentru gradul n > 65.', '\n\n\n\n',...
    '  Observam ca erorile semnificateve apar mai intai pentru valorile',...
    ' X_i aflate in apropirea capetelor intervalului.');
obs.String = sprintf(t);
% Setarea textului
obs.FontSize = 8;
obs.FontName = 'Consolas';
obs.EdgeColor = 'White';


%% MATRICEA JACOBIAN

function [J] = Jacobian(V_variabile, V_functii)

% Salvarea functiilor si variabilelor simbolice sub forma de cell array
V = sym2cell(V_variabile);
F = sym2cell(V_functii);

% Initializam cu zerouri matricea J de dimensiune n
n = length(F);
J = cell(n);

for i = 1:n   
    % Calculam derivatele partiale pentru a construi matricea Jacobian
    J(1:n, i) = sym2cell(diff(F(1:n), V{i}));    
end

% Convertim J in matrice simbolica
J = cell2sym(J);

end


%% METODA NEWTON

function [xAprox, N] = Newton(F, J, x0, epsilon)

V = symvar(F);
n = length(J);

A = zeros(n);
b = zeros(1, n);

N = 0;
x1 = zeros(1, n);

while (true)
    
    N = N + 1;
    
    for i = 1:n
        
        A(1:n, i) = subs(J(1:n, i), V, x0);
        b(i) =  -subs(F(i), V, x0);
        
    end
    
    y = GaussPivPart(A, b);
    x1 = y + x0;
    
    if norm(y, Inf) < epsilon
        xAprox = x1;
        return;
    end
    
    x0 = x1;
    
end

end


%% POLINOMUL DE INTERPOLARE - METODA DIRECTA

function P = MetDirecta(X, Y, x)

n = length(X);

p = 0;
while p < n
    
    A(1:n, p+1)= X(1:n) .^ p;
    p = p + 1;
    
end

a = GaussPivPart(A, Y);
P = poly2sym(a(end:-1:1), x);

end


%% POLINOMUL DE INTERPOLARE - METODA LAGRANGE

function P = MetLagrange(X, Y, x)

n = length(X);
xs = x .* ones(1, n);
difUp = xs - X;

for i = 1:n
    
    lUp = prod([prod(difUp(1:i-1)), prod(difUp(i+1:n))]);
    difDwn = X(i) .* ones(1, n) - X;
    lDwn = prod([prod(difDwn(1:i-1)), prod(difDwn(i+1:n))]);
    L(i) = prod([lUp, 1 / lDwn]);
    
end

P = sum(L(1:n) .* Y(1:n));
P = expand(P);

end


%% POLINOMUL DE INTERPOLARE - METODA NEWTON

function P = MetN(X, Y, x)

n = length(X);
xs = x .* ones(1, n);

difPol = xs - X;
divDif = DividedDiff(X, Y);
P = divDif(1);

for i = 2:n
    
    P = P + prod([divDif(i), prod(difPol(1:i-1))]);
    
end

P = expand(P);

end


%% DIVIDED DIFFERENCES

function [dDif] = DividedDiff(X, Y)

n = length(X);
DD = zeros(n);

DD(1:n, 1) = Y(1:n);

for i = 2:n
    
    DD(i, i) = (DD(i, i-1) - DD(i-1, i-1)) / (X(i) - X(1));
    
    j = i + 1;
    while j <= n
        
        DD(j, i) = (DD(j, i-1) - DD(j-1, i-1)) / (X(j) - X(j-i+1));
        j = j + 1;
        
    end
    
end

dDif = diag(DD);

end


%% GAUSS CU PIVOTARE PARTIALA

function [x] = GaussPivPart(A, b)

[A_tri, b_tri] = SupTri_PartialPivot(A, b);

if ~isnan(A_tri)
    x = SubsDesc(A_tri, b_tri);
else
    x = NaN;
end

end


%% TRANSFORMARE MATRICE SUPERIOR TRIUNGHIULARA

function [A_Tri, b_Tri] = SupTri_PartialPivot(A, b)
n = length (A);

for j = 1 : n-1
    
    [m, ind] = max(abs(A(j:n, j)));
    
    if m == 0
        A_Tri = NaN;
        b_Tri = NaN;
        fprintf ('Sistemul este INCOMPATIBIL sau COMPATIBIL NEDETERMINAT\n');
        return;
    end
    
    if ind ~= 1
        A([j ind+j-1], :) = A ([ind+j-1 j], :);
        b([j ind+j-1]) = b([ind+j-1 j]);
    end
    
    for i = j + 1 : n
        t = A(i, j) / A(j, j);
        
        A(i, 1:n) = A(i, 1:n) - t * A(j, 1:n);
        b(i) = b(i) - t * b(j);
    end
end
if A(n, n) ~= 0
    A_Tri = A;
    b_Tri = b;
else
    A_Tri = NaN;
    b_Tri = NaN;
    
    if b(n) ~=0
        fprintf ('Sistemul este INCOMPATIBIL.\n');
    else
        fprintf ('Sistemul este COMPATIBIL NEDETERMINAT.\n');
    end
end

end


%% SUBSTITUTIA DESCENDENTA

function [x] = SubsDesc(A, b)

x = zeros(1, length(b));
n = length(b);

for i = n : -1 : 1
    x(i) = (b(i) - sum (A(i, 1:n) .* x(1:n)))/ A(i, i);
end
end


