function [] = main_3()

    chips = imread('coloredchips.png');
    
    %5 cores serao utilizadas para a imagem
    seg_k(chips, 5);

    
    %imagem externa, atualizar path
    car = imread('car.jpg');
    splitmerge(car);
    pause;
    close all;
end

