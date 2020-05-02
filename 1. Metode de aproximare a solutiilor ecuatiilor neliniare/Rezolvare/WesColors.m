% -------------------------------------------------------------------------
% MACIUCA GLORIA - RUXANDRA
% Grupa 344
% -------------------------------------------------------------------------
% wesColors.m - Fisier 'script'
% -------------------------------------------------------------------------
%
% Fisier pentru declararea culorilor dorite in reprezentarea ulterioara a
% figurilor
% 
greyishTeal = [0.463 0.627 0.541];
greenishBeige = [0.808 0.804 0.482];
dullOrange = [0.8 0.545 0.235];
brownish = [0.639 0.369 0.376];
reddishGrey = [0.584 0.478 0.427];
gunMetal = [0.271 0.388 0.333];
paleGold = [0.988 0.82 0.42];
silver = [0.827 0.867 0.863];
pinkishGrey = [0.776 0.694 0.616];
sand = [0.859 0.694 0.396];
pinkishTan = [0.871 0.694 0.545];
pine = [0.18 0.376 0.29];
dark = [0.153 0.133 0.235];
fadedRed = [0.82 0.212 0.184];

wesColors = [greyishTeal; greenishBeige; dullOrange; brownish; 
    reddishGrey; gunMetal; paleGold; silver; pinkishGrey; sand; 
    pinkishTan; pine; dark; fadedRed];

% Instructiune de plot pentru vizualizarea culorilor create
for i = 1 : size(wesColors, 1)
    plot(i, 6, 'Marker', 'o', 'MarkerFaceColor', wesColors(i, :), ...
        'MarkerEdgeColor', 'Black', 'MarkerSize', 10.0);
    hold on;
end

% Salvarea culorilor sub forma unei matrice pentru folosirea in diferite
% fisiere 'script'
save wesColors wesColors;