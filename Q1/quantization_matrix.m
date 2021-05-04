function output_matrix = quantization_matrix(quality)

     % Standard quantization matrix, also known as Q50.
     standard_quantization_matrix = [
         16  11  10  16  24   40   51   61       
         12  12  14  19  26   58   60   55
         14  13  16  24  40   57   69   56
         14  17  22  29  51   87   80   62
         18  22  37  56  68   109  103  77
         24  35  55  64  81   104  113  92
         49  64  78  87  103  121  120  101
         72  92  95  98  112  100  103  99
     ];
    
    if (quality > 50)
        quality_multiplier = (100 - quality)/50;
    else
        quality_multiplier = 50/quality;
    end
    
    quant_matrix = quality_multiplier * standard_quantization_matrix;
    quant_matrix = round(quant_matrix);
    quant_matrix = min(quant_matrix, 255);
    quant_matrix = max(quant_matrix, 1);
    
    output_matrix = quant_matrix;
end