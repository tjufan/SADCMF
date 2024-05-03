function J = Update_J(mu, U, V, Y)
    %Update variable J
    W = U .* V;
    J = calSVTVar(mu, W, Y);
    J = normalize(J);
end

function data = normalize(data)
    maxVal = max(max(abs(data)));
    if maxVal > 1e12
       for i = 1 : size(data, 2)
           data(:, i) = data(:, i)/norm(data(:, i));
       end
    end
end