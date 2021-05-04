function show_image_comparison(og, new, l, k, description)
    figure, imshow(new); title(description);

    fprintf('\n[%s]\n', description);
    input_size = numel(og);
    output_size = k*l+numel(new)/l;
    fprintf('Input Size = %d bytes\n', input_size);
    fprintf('Output Size = %d bytes\n',output_size);
    fprintf('Compression: %.2f x 1 \n', double(input_size)/double(output_size));

    [PSNR, SNR] = psnr(new, og);
    fprintf('SNR: %fdB [PSNR] = %fdB\n', SNR, PSNR);
    [PSNR2, SNR2] = custom_psnr(new, og);
    fprintf('SNR: %fdB [PSNR] = %fdB\n', SNR2, PSNR2);
end