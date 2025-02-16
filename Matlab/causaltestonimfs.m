%%
%data = xlsread('oil and silver weekly.xlsx');

% I turned this to a comment just for a test Y = data(:,1); X = data(:,2);
%Y = data{:, 3};
%X = data{:, 4};

Y = wimf;
X = gimf1;


x = X';
t = Y';

% Choose a Training Function
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.

% Create a Fitting Network
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize,trainFcn);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
e = gsubtract(t,y);
performance = perform(net, t, y)

% View the Network
% view(net)

%% Apply trained model on Variable Y alone
y_new = net(y);
e_new = gsubtract(y, y_new);
performance_new = perform(net, t, y_new)
%%
% Calculate covariance between x and y
cov_xy = cov(x, t);
sigma_xy = cov_xy(1, 2);  % Extract covariance value from covariance matrix

% Sample size
n = length(x);

% Calculate the standard error
SE = sigma_xy / sqrt(n);

MSE1 = performance
MSE2 = performance_new

% Compute the test statistic
test_statistic = (MSE1 / MSE2) / SE;

% Calculate 1/SE
inv_SE = 1 / SE;

% Display results
disp(['Test Statistic: ', num2str(test_statistic)]);
disp(['1/SE: ', num2str(inv_SE)]);
%%
% Apply the decision logic based on test statistic comparison with 1/SE
if test_statistic < inv_SE
    disp('Accept, there is causality');
else
    disp('Reject the null. There is no causality');
end
%%