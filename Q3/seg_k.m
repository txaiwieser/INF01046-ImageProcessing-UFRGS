function [] = seg_k( I, nColors )

    figure,imshow(I),title('imagem original');
    
    %converte para L a b
    cform = makecform('srgb2lab');
    lab_I = applycform(I,cform);
    
    %agrupa as cores em a*b* usando k-means
    ab = double(lab_I(:,:,2:3));
    nrows = size(ab,1);
    ncols = size(ab,2);
    ab = reshape(ab,nrows*ncols,2);
    
    [cluster_idx,cluster_center]=kmeans(ab,nColors,'distance','sqEuclidean','Replicates',3);
    
    % rotula cada pixel da imagem com os resultados dos k-means
    pixel_labels = reshape(cluster_idx,nrows,ncols);
    figure,imshow(pixel_labels,[]),
    title('imagem rotulada pelo indice do agrupamento');
    
    % cria uma imagem para cada cor da imagem de entrada
    segmented_images = cell(1,3);
    rgb_label = repmat(pixel_labels,[1 1 3]);
    
    for k = 1:nColors
        color = I;
        color(rgb_label ~= k) = 0;
        segmented_images{k} = color;
    end
    
    for j = 1:nColors
        figure,imshow(segmented_images{j}),title(sprintf('objetos no agrupamento %d', j));
    end
    pause;
    close all;
end

