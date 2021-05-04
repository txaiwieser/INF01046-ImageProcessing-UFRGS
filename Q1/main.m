%
% Q1) Compress?o baseada no modo b?sico do JPEG: (3 pontos) 
% Escolha duas imagens em tons de cinza. Voc?? deve implementar o m??todo b??sico do JPEG (JPEG baseline),
% sem a parte de codifica????o entr??pica (i.??, sem a codifica????o de corridas e sem o c??digo de Huffman),
% e test??-lo nas duas imagens. Ajuste os par??metros para obter duas taxas de compress??o diferentes com o m??todo implementado, 
% e me??a os PSNRs obtidos. Comente os resultados.
%

clc;
clear all;
close all;

qualities = [50 10];

analyse_image('kitesurf.jpg', qualities); 

analyse_image('kites.jpg', qualities);

analyse_image('umbrela.jpg', qualities);
