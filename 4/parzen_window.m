function [ pdf ] = parzen_window( X, x_range, h )
% PARZEN_WINDOW density estimation
    
    pdf = zeros(length(x_range), 1);
    for i=1:length(x_range)
        x = x_range(i);
        delta = (1/sqrt(2*pi)) .* exp(-((x-X)/h).^2 / 2);
        pdf(i, 1) = sum(delta) / (length(X) * h);
    end
end

