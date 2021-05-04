%% Algortimo de analise

function analyse_image(image_name, ls_and_ks)
    original_image = imread(image_name);
    not_compressed_image = rgb2gray(original_image);
    
    figure, imshow(not_compressed_image); title('Input Image');
    for i=1:length(ls_and_ks)
        tic;
        l = ls_and_ks{i}(1);
        k = ls_and_ks{i}(2);
        compressed_image = quantizacao_c_kmeans(not_compressed_image, l, k);
        show_image_comparison(not_compressed_image, compressed_image, l, k, sprintf('Image: %s, L: %d, K: %d', image_name, l, k));
        toc;
    end
end