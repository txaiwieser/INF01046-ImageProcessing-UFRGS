function output_image = jpeg_compression(input_image, quality)
    % Applies the baseline JPEG algorithm. 
    %
    % input_image - The image to compress.
    % quality - Integer - The compression quality - higher means less compression.
    %
    % returns - The compressed image

    % With a quality level of 50, this matrix renders both high compression
    % and excellent decompressed image quality.
    
    quant_matrix = quantization_matrix(quality);
    working_image = double(input_image);
    working_image = working_image - 128;
    
    % COMPRESSION
    
    % applies dct2 (discrete cosine transform) to each 8x8 block
    dct_image = blockproc(working_image, [8, 8], @(block_struct) dct2(block_struct.data));

    % applies round (Dij / Qij) for each 8x8 block
    compressed_image = blockproc(dct_image, [8, 8], @(block_struct) round((block_struct.data) ./ quant_matrix));

    
    % DECOMPRESSION
    
    % decoding quantized matrix (Rij = Qij x Cij)
    revert_quantization_image = blockproc(compressed_image, [8, 8], @(block_struct) quant_matrix .* block_struct.data);

    % applies idct2 (inverted discrete cosine transform) to each 8x8 block
    idct_image =  blockproc(revert_quantization_image, [8, 8], @(block_struct) idct2(block_struct.data));

	adjusted_range_image = idct_image + 128;
    output_image = mat2gray(adjusted_range_image);
end