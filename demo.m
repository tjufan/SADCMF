clear; clc; warning('off'); paths = genpath('./source'); addpath(paths);

optimParams.mu = 1e1;
optimParams.rho = 1.9;
optimParams.lambda1 = 400;
optimParams.lambda2 = 1;
optimParams.lambda3 = 10;
optimParams.lambda4 = 5;
optimParams.lambda5 = 10;
optimParams.alpha = 0.5;
optimParams.eta = 0.001;
optimParams.layer = 5;
optimParams.maxIter = 15;

srcPath = '../../datasets/MTSVRC/group1_vision.mat';
load(srcPath); % X_train DxN; Y_train CxN; X_test DxN; Y_test CxN; vector Cxd

[AP, CO, OE, RL, HL] = SADCMF(optimParams, X_train', Y_train', X_test', Y_test', vector');

rmpath(paths);

