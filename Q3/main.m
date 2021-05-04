%
% Q3) Segmenta??o : (3 pontos) 
% Escolha duas imagens coloridas. Voc? deve implementar dois m?todos de segmenta??o para imagens coloridas,
% e test?-los nas duas imagens escolhidas. Um dos dois m?todos de segmenta??o deve usar um algoritmo de agrupamento.
% Escolha m?todos de segmenta??o que produzam bons resultados pois a escolha de m?todos adequados ? parte da quest?o. 
% Comente os resultados.

clc;
clear all;
close all;

chips = imread('coloredchips.png');
tic;
%5 cores serao utilizadas para a imagem
seg_k(chips, 5);
toc;

%imagem externa, atualizar path
car = imread('car.jpg');
tic;
splitmerge(car);
toc;