% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_3c2.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru rezolvarea sistemului dat prin apelarea metodelor 
% GaussPivPart si GaussPivTot si afisarea solutiilor.
%
C = 1e+20;

A2 = [1 C; 1 1];
b2 = [C 2];

solutieC2_PP = GaussPivPart (A2, b2);
solutieC2_PT = GaussPivTot (A2, b2);

if solutieC2_PP ~= NaN
    fprintf('Solutia sistemului, calculata folosind metoda GAUSS PIVOTARE PARTIALA este:\n');
    fprintf('\tx1 = %f\n\tx2 = %f\n', solutieC2_PP(1:2));
    
    fprintf('Solutia sistemului, calculata folosind metoda GAUSS PIVOTARE TOTALA este:\n');
    fprintf('\tx1 = %f\n\tx2 = %f\n\t', solutieC2_PT(1:2));
end