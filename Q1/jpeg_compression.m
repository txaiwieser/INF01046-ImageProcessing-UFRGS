function output_image = jpeg_compression(input_image, quality)
    % Applies the baseline JPEG algorithm. 
    %
    % input_image - The image to compress.
    % quality - Integer - The compression quality - higher means less compression.
    %
    % returns - The compressed image

%     working_image = input_image;
    working_image = double(input_image);

    % centraliza os valores da imagem
    working_image = working_image - 128;

    % aplica a transformada do cosseno em blocos de tamanho 8
    dct_matrix = blockproc(working_image,[8, 8],@(block_struct)dct2(block_struct.data));


    original_quant_matrix = [16 11 10 16 24 40 51 61       
                             12 12 14 19 26 58 60 55
                             14 13 16 24 40 57 69 56
                             14 17 22 29 51 87 80 62
                             18 22 37 56 68 109 103 77
                             24 35 55 64 81 104 113 92
                             49 64 78 87 103 121 120 101
                             72 92 95 98 112 100 103 99];

    % modifica a matriz de quantiza??????o de acordo com a qualidade desejada 
    
    if (quality < 50)
        S = 5000/quality;
    else
        S = 200 - 2*quality;
    end

    quant_matrix = floor((S * original_quant_matrix + 50) / 100);
    quant_matrix(quant_matrix == 0) = 1;

    % quantiza??????o dos quocientes dct
    cod_matrix = blockproc(dct_matrix, [8, 8], @(block_struct) round((block_struct.data) ./ quant_matrix));

    % desquantiza??????o dos quocientes
    dequant_matrix = blockproc(cod_matrix, [8, 8], @(block_struct) quant_matrix .* block_struct.data);

    % transformada inversa do cosseno
    idct_matrix =  blockproc(dequant_matrix, [8, 8], @(block_struct)idct2(block_struct.data));

    %transforma resultado em imagem
    output_image = mat2gray(idct_matrix);

end