function show_image_comparison(og, new, description)
    figure, imshow(new); title(description);

    fprintf('\n[%s]\n', description);
    fprintf('Input Size = %d bytes\n', numel(og));
    fprintf('Output Size = %d bytes\n', numel(new));
    fprintf('Compression: %.2f x 1 \n', double(numel(og))/double(numel(new)));

    [PSNR, SNR] = psnr(new, og);
    fprintf('SNR: %fdB [PSNR] = %fdB\n', SNR, PSNR);
    [PSNR2, SNR2] = custom_psnr(new, og);
    fprintf('SNR: %fdB [PSNR] = %fdB\n', SNR2, PSNR2);
end