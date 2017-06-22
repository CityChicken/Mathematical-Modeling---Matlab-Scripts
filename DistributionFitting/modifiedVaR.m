function b = modifiedVaR(data, P)
[frequency, N] = histcounts(data, 'Normalization', 'pdf');
probability = 0;
mu = mean(data);
sigma = std(data);
S = skewness(data);
K = kurtosis(data);
b = 0;
for i = 1:length(frequency)
    probability = probability + frequency(i)*(N(i+1)-N(i));
    if probability >= P
        b = N(i);
        break;
    end
end
z = (b - mu)/sigma;
b = mu + (z + (1/6)*(z.^2 -1).*S + (1/24)*(z.^3 -3.*z).*K - (1/36)*(2.*z.^3 -5.*z).*S^2)*sigma;
