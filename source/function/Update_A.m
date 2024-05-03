function A = Update_A( lambda4, lambda5, lambda6, L, Q, U, V, O, Zs)
    % Update variable A
    
    Z = dotSeries(Zs); W = U.*V;
    At = lambda4*(Z'*Z)+lambda5*(W*(W'));
    Bt = lambda6*pinv(O);
    Ct = lambda4*(Z'*L) + lambda5*(W*Q');
    
    try
        A = sylvester(At, Bt, Ct);
    catch 
        % disp(ErrorInfo);
        % fprintf('solve sylvester error\n');
        add_value_a=trace(abs(At))/(size(At,1)*10);
        add_value_b=trace(abs(Bt))/(size(Bt,1)*10);
        At=At+add_value_a*eye(size(At,1));
        Bt=Bt+add_value_b*eye(size(Bt,1));
        A=sylvester(At, Bt, Ct);
    end
    
    A = normalize(A);
end

function data = normalize(data)
    maxVal = max(max(abs(data)));
    if maxVal > 1e12
       for i = 1 : size(data, 2)
           data(:, i) = data(:, i)/norm(data(:, i));
       end
    end
end