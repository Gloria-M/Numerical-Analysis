% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_3b1.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru rezolvarea sistemului dat prin apelarea metodelor 
% GaussFaraPiv, GaussPivPart, GaussPivTot si afisarea solutiilor.
%

A1 = [0 1 1; 2 1 5; 4 2 1];
b1 = [3 5 1];

solutieB1_FP = GaussFaraPiv (A1, b1);
solutieB1_PP = GaussPivPart (A1, b1);
solutieB1_PT = GaussPivTot (A1, b1);

if solutieB1_FP ~= NaN
    fprintf('Solutia sistemului, calculata folosind metoda GAUSS FARA PIVOTARE este:\n');
    fprintf('\tx1 = %f\n\tx2 = %f\n\tx3 = %f\n', solutieB1_FP(1:3));
    
    fprintf('Solutia sistemului, calculata folosind metoda GAUSS PIVOTARE PARTIALA este:\n');
    fprintf('\tx1 = %f\n\tx2 = %f\n\tx3 = %f\n', solutieB1_PP(1:3));
    
    fprintf('Solutia sistemului, calculata folosind metoda GAUSS PIVOTARE TOTALA este:\n');
    fprintf('\tx1 = %f\n\tx2 = %f\n\tx3 = %f\n', solutieB1_PT(1:3));
end