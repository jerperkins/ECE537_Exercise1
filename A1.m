% Set K
K = 5;
% Set 1 x 3 mu
mu = [400,500,600];
% Set covariance matrix
covm = [10,  2,  1;
          2,  5,  0;
          1,  0,  8];;

function X_m = genGauss(K,mu,covm)

    % Get length of mu
    lenMu = length(mu);
    % Get K random lenMu-dimensional data points
    data = randn(K,lenMu);

    % chol() returns an upper triangular matrix R such that R'*R = Sigma
    R = chol(covm);

    % Transform the data to have the desired mean and covariance
    X_m = data * R + mu;
end

% Generate random Gaussian data
rgdata = genGauss(K,mu,covm);

% Testing and Verification
% The sample mean should be close to 'mu'
sample_mean = mean(rgdata);

% The sample covariance should be close to 'Sigma'
sample_cov = cov(rgdata);

% Display results to the command window
disp('--- Target Mean ---'); disp(mu);
disp('--- Sample Mean ---'); disp(sample_mean);
disp('--- Target Covariance ---'); disp(covm);
disp('--- Sample Covariance ---'); disp(sample_cov);