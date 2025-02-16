
% Load the data from Excel
filePath = 'G:\2018\Documents\papers\Portfolio finance\AlphaFoldD\Geopolitics data.xlsx';
data = readtable(filePath);

% Extract the Brent time series data from the third column
Brent = data{:, 3};

% Run AlphaFoldD decomposition
[imf, residual] = AlphaFoldD(Brent);

% Display each IMF and the residual
numIMFs = size(imf, 4);
figure;
for i = 1:numIMFs
    subplot(numIMFs + 1, 1, i);
    plot(imf(:, i));
    title(['IMF ' num2str(i)]);
end

% Plot the residual
subplot(numIMFs + 1, 1, numIMFs + 1);
plot(residual);
title('Residual');
