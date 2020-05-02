% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_3c1.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru rezolvarea sistemului dat prin apelarea metodelor 
% GaussFaraPiv si GaussPivPart si afisarea solutiilor.
%
epsilon = 1e-20;

A1 = [epsilon 1; 1 1];
b1 = [1 2];

solutieC1_FP = GaussFaraPiv (A1, b1);
solutieC1_PP = GaussPivPart (A1, b1);

if solutieC1_FP ~= NaN
    fprintf('Solutia sistemului, calculata folosind metoda GAUSS FARA PIVOTARE este:\n');
    fprintf('\tx1 = %f\n\tx2 = %f\n', solutieC1_FP(1:2));
    
    fprintf('Solutia sistemului, calculata folosind metoda GAUSS PIVOTARE PARTIALA este:\n');
    fprintf('\tx1 = %f\n\tx2 = %f\n\t', solutieC1_PP(1:2));
end