function [U, V, A, O, J, Y, Bs, Cs, Ds, Zs] = initialParams(X_train, Y_train, layer)
    rng('default'); 
    [d, n] = size(X_train); [c, ~] = size(Y_train);
    dims = [d, 975, 925, 875, 825, 775, 725, 675, 625, 575, 525];
    lsize = dims(layer+1); O = 1/c*eye(c); U = randn(lsize, n); V = randn(lsize, n);
    J = zeros(lsize, n); Y = zeros(lsize, n); A = randn(lsize, c); Bs = cell(layer, 1);
    Cs = cell(layer, 1); Ds = cell(layer, 1); Zs = cell(layer, 1);  
    for i = 1 : layer
        Bs{i} = randn(dims(i), dims(i+1));
        Cs{i} = randn(dims(i), dims(i+1));
        Zs{i} = randn(dims(i), dims(i+1));
        Ds{i} = randn(dims(layer-i+2), dims(layer-i+1));
    end
end