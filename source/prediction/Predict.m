function [AP,  HL, CO, OE, RL] = Predict(X, Y_true, Bs, W, threshold)
    % L_pred = zeros(size(Y_true));
    Y_true(Y_true<1) = 0;
    B = dotSeries(Bs); Y_pred = W'*B*X;
    
%     for i = 1:size(Y_pred, 2)
%          val = exp(Y_pred(:, i)); 
%          Y_pred(:, i) = val/sum(val);
%     end  
    AP = Average_precision(Y_pred, Y_true);
    CO = coverage(Y_pred, Y_true);
    OE = One_error(Y_pred, Y_true);
    RL = Ranking_loss(Y_pred, Y_true); 
    
    L_pred = Y_pred >= threshold(1,1); 
    L_pred = double(L_pred);
    HL = Hamming_loss(L_pred, Y_true); 
end