
% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------

%% Exercitiul 2

A = [1 1 0;
     1 0 1;
     0 1 1];
b = [1 2 5]';

[Q, R, x] = MetGivens(A, b);

fprintf('Solutia sistemului Ax=b dat este:\n \tx =');
disp(x);


%% Exercitiul 3

A = [3 1 1;
     1 3 1;
     1 1 3];

epsilon = 1e-4; 

lambda = MetJacobi(A, epsilon);

fprintf('Valorile proprii asociate matricei A sunt:\n\tlambda =');
disp(lambda');


%% METODA GIVENS
% 
% Date intrare:
%    'A'       = matricea coeficientilor unui sistem
%    'b'       = matricea coloana a unui sistem
% 
% Date iesire:
%    'Q'       = matrice ortogonala
%    'R'       = matrice superior triunghulara rezultata in urma rotatiilor
%    'x'       = vectorul solutie a sistemului
%
% Functie pentru aflarea solutiei unui sistem prin descompunerea QR
% folosind metoda Givens a rotatiilor
%
function [Q, R, x] = MetGivens(A, b)

n = length(A);  % Memoram dimensiunea matricei A in variabila n
Q = eye(n);     % Initializam matricea Q sub forma de matrice identitate

% Urmarim sa obtinem o matrice superior triunghiulara, asadar vom urmari
% elementele aflate sub diagonala principala (i>j)
for i = 2:n
    for j = 1:i-1
        
%         Daca valoarea elementului este diferita de 0, vom construi o
%         matrice de rotatie cu valorile necesare obtinerii 0 in A(i, j)
        if A(i, j) ~=0
            
%             Calculam ipotenuza corespunzatoare fiecarui vector coloana
%             din matricea A
            ip = sqrt(A(j, j)^2 +A(i, j)^2);
%             Calculam valorile sin si cos pentru generarea unei matrici de
%             rotatie
            c = A(j, j)/ip;
            s = A(i, j)/ip;
            
%             Matricea de rotatie va avea forma matricei identitate, cu
%             exceptia elementelor aflate la intersectia liniilor i si j si
%             a coloanelor i si j
%             Prin urmare, in matricea obtinuta dupa aplicarea rotatiei, se
%             vor modifica doar elementele aflate pe liniile i si j
            u(1, 1:n) = c*A(j, 1:n) + s*A(i, 1:n);
            v(1, 1:n) = c*A(i, 1:n) - s*A(j, 1:n);
            A(j, 1:n) = u(1, 1:n);
            A(i, 1:n) = v(1, 1:n);
            
%             Matricea Q contine toate transformarile de rotatie aplicate
%             matricei A
%             Vom completa matricea Q pentru fiecare noua rotatie
            u(1, 1:n) = c*Q(j, 1:n) + s*Q(i, 1:n);
            v(1, 1:n) = c*Q(i, 1:n) - s*Q(j, 1:n);
            Q(j, 1:n) = u(1, 1:n);
            Q(i, 1:n) = v(1, 1:n);
        end
    end
end

% Cum matricea Q contine toate transformarile de rotatie, pentru a obtine o
% matrice b corespunzatoare matricei A rotite, procedam astfel:
b = Q * b;
R = A;
Q = Q';

% Pentru a afla solutia sistemului, apelam functia SubsDesc pentru matricea
% superior triunghiulara R si matricea b
x = SubsDesc(R, b);

end


%% METODA JACOBI
% 
% Date intrare:
%    'A'       = matrice simetrica
%    'epsilon' = toleranta
% 
% Date iesire:
%    'lambda'  = vectorul ce contine valorile proprii asociate matricei A
%
% Functie pentru aflarea valorilor proprii asociate unei matrici prin
% rotirea succesiva a matricei A, pana aceasta devine diagonala
%

function [lambda] = MetJacobi(A, epsilon)

n = length(A);  % Memoram dimensiunea matricei A in variabila n

% Urmarim sa obtinem o matrice diagonala, asadar impumen conditia ca
% elementele care nu se afla pe diagonala sa fie cat mai aproape de 0, prin
% compararea cu valoarea tolerata epsilon
while sqrt(sum(sum(A(1:n, 1:n).^2)) - sum(diag(A).^2)) > epsilon
  
%     Cautam valoarea maxima absoluta a elementelor aflate deasupra
%     diagonalei principale
    [m, pm] = max (abs(triu(A,1)));
    [m, q] = max (m);
    p = pm(q);
    
%     Calculam unghiul de rotatie functie de valoarea elementelor A(p, p)
%     si A(q, q)
    if A(p, p) == A(q, q)        
        unghi = pi / 4;
    else
        unghi = 1/2 * atan(2*A(p, q) / (A(q, q) - A(p, p)));
    end
    
%     Calculam valorile sin si cos pentru unghiul aflat
    s = sin(unghi);
    c = cos(unghi);
    
%     Vom roti matricea A cu unghiul calculat
%     Dupa aplicarea rotatiei, se vor modifica doar elementele aflate pe 
%     liniile i si j
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

% Im matricea A au ramas, pe diagonala, valorile proprii asociate
lambda = diag(A);

end

%% SUBSTITUTIA DESCENDENTA
% 
% Date intrare:
%    'A'       = matricea coeficientilor unui sistem
%    'b'       = matricea coloana a unui sistem
% 
% Date iesire:
%    'x'       = vectorul solutie a sistemului
%
% Functie pentru aflarea solutiei unui sistem reprezentat de o matrice
% superior triunghiulara prin metoda substitutiei descendente
%
function [x] = SubsDesc(A, b)

x = zeros(1, length(b));
n = length(b);

for i = n : -1 : 1
    x(i) = (b(i) - sum (A(i, 1:n) .* x(1:n)))/ A(i, i);
end
end
