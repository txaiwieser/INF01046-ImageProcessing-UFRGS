%
% Q2) Compress?o baseada na quantiza??o vetorial: (4 pontos)
% Escolha duas imagens em tons de cinza. Voc? deve implementar um m?todo de quantiza??o vetorial para blocos 2x2 e 3x3,
% com um dicion?rio de 256 palavras (blocos). Ajuste os par?metros para obter duas taxas de compress?o, e me?a os PSNRs obtidos. 
% Comente os resultados.
%

clc;
clear all;
close all;

% Array of tuples (L, K)
qualities = {[2*2, 256], [3*3, 256]};

analyse_image('umbrela.jpg', qualities);

analyse_image('kites.jpg', qualities);

analyse_image('kitesurf.jpg', qualities);

