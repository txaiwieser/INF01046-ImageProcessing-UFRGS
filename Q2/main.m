%
% Q2) Compress?o baseada na quantiza??o vetorial: (4 pontos)
% Escolha duas imagens em tons de cinza. Voc? deve implementar um m?todo de quantiza??o vetorial para blocos 2x2 e 3x3,
% com um dicion?rio de 256 palavras (blocos). Ajuste os par?metros para obter duas taxas de compress?o, e me?a os PSNRs obtidos. 
% Comente os resultados.
%

clc;
clear all;
close all;

analyse_image('test.jpg', {[4, 256]});

% analyse_image('kitesurf.jpg', {[4, 256]});
% 
% analyse_image('kites.jpg', {[4, 256]});
% 
% analyse_image('umbrela.jpg', {[4, 256]});
