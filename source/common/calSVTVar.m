function J = calSVTVar(mu, W, Y)
    % Solve the rank problem with svt method
    
    temp = W + Y/mu;
    [Us, sigma, Vs] = svd(temp, 'econ');
    sigma = diag(sigma);
    svp = length(find(sigma>1/mu));
    if svp>=1
        sigma = sigma(1:svp)-1/mu;
    else
        svp = 1;
        sigma = 0;
    end
    U = Us(:, 1:svp);
    D = diag(sigma);
    V = Vs(:, 1:svp);
    J = U*D*V';
    %J = Us(:,1:svp)*diag(sigma)*Vs(:,1:svp)';
end