function [PSNR, SNR]=custom_psnr(new, og)
    mean_squared_error = mean(mean((og-new).^2));
    PSNR = 10*log10(1/mean_squared_error);
    
    SNR = 10*log10(std2(double(og))^2/std2(double(og)-double(new))^2);
end