%% Algortimo de analise

function analyse_image(image_name, qualities)
    original_image = imread(image_name);
    gray_image = rgb2gray(original_image);
    not_compressed_image = im2double(gray_image);
    
    figure, imshow(not_compressed_image); title('Input Image');
    
    for i=1:length(qualities)
        tic;
        compressed_image = jpeg_compression(gray_image, qualities(i));
        show_image_comparison(not_compressed_image, compressed_image, sprintf('Image: %s, Quality: %d', image_name, qualities(i)));
        toc;
    end
end