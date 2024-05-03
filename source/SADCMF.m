function [AP, CO, OE, RL, HL] = SADCMF(Para, Xtrain, Ytrain, Xtest, Ytest, Vector)
    % base parameters
    max_mu = 1e10; lambda1 = Para.lambda1; lambda2 = Para.lambda2;  lambda3 = Para.lambda3;
    lambda4 = Para.lambda4;  lambda5 = Para.lambda5;  lambda6 = 0; mu = Para.mu; rho = Para.rho;
    alpha = Para.alpha; eta = Para.eta; maxIter = Para.maxIter;  layer = Para.layer;

    [U, V, A, O, J, K, Bs, Cs, Ds, Zs] = initialParams(Xtrain, Ytrain, layer);

    X = double(Xtrain); Y = double(Ytrain); L = double(Vector); 
    Xtest = double(Xtest); Ytest = double(Ytest); beta = 1-alpha;

    for iter = 1 : maxIter
        Bs = Update_Bs( X, U, Bs );
        U = Update_U(lambda1, lambda3, lambda5, mu, eta, X, Y, U, V, A, J, K, Bs, Ds);
        T = normData( (alpha + beta*(L*pinv(O)*L'))*X );
        Cs = Update_Cs( T, V, Cs );
        T = normData( (alpha + beta*(L*pinv(O)*L'))*X );
        V = Update_V(lambda2, lambda3, lambda5, mu, eta, T, X, Y, U, V, A, J, K, Cs, Ds);
        J = Update_J(mu, U, V, K);  
        Ds = Update_Ds( U, V, X, Ds );
        Zs = Update_Zs( L, A, Zs );
        A = Update_A( lambda4, lambda5, lambda6, L, Y, U, V, O, Zs);  
        O = Update_O(lambda2, lambda6, alpha, beta, X, L, V, A, Cs);

        % Update Y and mu
        leq = U.*V - J;
        K = K + mu*leq;
        mu = min(max_mu, mu*rho);
        disp(['iter: ', num2str(iter)]);
    end
    threshold = findTuneThreshold(X, Y, Ds, A); 
    [AP, HL, CO, OE, RL] = Predict(Xtest, Ytest, Ds, A, threshold);
end