function x = GaussElimination(a, b)
    tic
    n = length(b);
    x = zeros(n, 1);
    aug = [a b];
    for j = 1:n-1
        for i = j+1:n
            m = aug(i, j) / aug(j, j);
            aug(i, :) = aug(i, :) - m * aug(j, :);
        end
    end
    x(n) = aug(n, n+1) / aug(n, n);
    for k = n-1:-1:1
        x(k) = (aug(k, n+1) - aug(k, k+1:n) * x(k+1:n)) / aug(k, k);
    end
    toc
end
