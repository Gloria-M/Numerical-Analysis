% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% Ex_3b2.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru rezolvarea sistemului dat prin apelarea metodelor
% GaussFaraPiv, GaussPivPart, GaussPivTot si afisarea solutiilor.
%
A2 = [0 1 -2; 1 -1 1; 1 0 -1];
b2 = [4 6 2];

solutieB2_FP = GaussFaraPiv (A2, b2);
solutieB2_PP = GaussPivPart (A2, b2);
solutieB2_PT = GaussPivTot (A2, b2);

if solutieB2_FP ~= NaN
    fprintf('Solutia sistemului, calculata folosind metoda GAUSS FARA PIVOTARE este:\n');
    fprintf('\tx1 = %f\n\tx2 = %f\n\tx3 = %f\n', solutieB2_FP(1:3));
    
    fprintf('Solutia sistemului, calculata folosind metoda GAUSS PIVOTARE PARTIALA este:\n');
    fprintf('\tx1 = %f\n\tx2 = %f\n\tx3 = %f\n', solutieB2_PP(1:3));
    
    fprintf('Solutia sistemului, calculata folosind metoda GAUSS PIVOTARE TOTALA este:\n');
    fprintf('\tx1 = %f\n\tx2 = %f\n\tx3 = %f\n', solutieB2_PT(1:3));
end
