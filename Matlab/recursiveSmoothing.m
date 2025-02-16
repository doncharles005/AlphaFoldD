function smoothedIMF = recursiveSmoothing(imf)
    % Simple recursive smoothing method (e.g., using moving average)
    smoothFactor = 0.8;
    smoothedIMF = imf;
    for i = 2:length(imf)-1
        smoothedIMF(i) = smoothFactor * smoothedIMF(i-1) + (1-smoothFactor) * smoothedIMF(i+1);
    end
end