function threshold = findTuneThreshold(X_train, Y_true, Bs, W)
    Y_true(Y_true<1) = 0;
    B = dotSeries(Bs); Y_pred = W'*B*X_train;
    [ threshold,  ~] = TuneThreshold( Y_pred, Y_true, 1, 1);
end