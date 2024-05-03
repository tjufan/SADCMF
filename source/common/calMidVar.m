function Bs = calMidVar( X, U, Bs )
    % Update variable Bs
    
    if length(Bs) == 1
        Bs{1} = X * pinv(U);
    else  
        for i=1:length(Bs)
            if i == 1
                Bs{1} = X * pinv(dotSeries(Bs(2:end))*U);
            elseif i == length(Bs)
                Bs{i} = pinv(dotSeries(Bs(1:i-1))) * X * pinv(U);
            else
                At = pinv(dotSeries(Bs(1:i-1)));
                Bt = pinv(dotSeries(Bs(i+1:end))*U);
                Bs{i} = At * X * Bt;
            end
        end
    end
end