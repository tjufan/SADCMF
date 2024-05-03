function data = normData( data )
    % Normalize the data with L2-norm
%     maxValue = max(max(abs(data)));
%     if maxValue > 1e12
%         for i = 1 : size(data, 2)
%             data(:, i) = data(:, i) / norm(data(:, i));
%         end
%     else
%         data = data;
%     end

    for i = 1 : size(data, 2)
        data(:, i) = data(:, i) / norm(data(:, i));
    end
    
end

