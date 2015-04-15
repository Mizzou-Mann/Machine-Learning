%% load data
setosa     = 'setosa    ';
versicolor = 'versicolor';
virginica  = 'virginica ';

[x1, x2, x3, x4, y] = textread('iris.data', '%f,%f,%f,%f,Iris-%s');

X = [x1 x2 x3 x4];
y = char(y);

X_given_setosa = X(strcomp(y, setosa), :);
X_pca_given_versicolor = X(strcomp(y, versicolor), :);
X_given_virginica = X(strcomp(y, virginica), :);

[X_given_setosa_training, X_given_setosa_test] = split(X_given_setosa);
[X_given_versicolor_training, X_given_versicolor_test] = split(X_pca_given_versicolor);
[X_given_virginica_training, X_given_virginica_test] = split(X_given_virginica);

%% (a) and (b) PCA
% dimensions to keep
m = 2;
[~,~,~,~,W] = PCA(...
    [X_given_setosa_training; X_given_versicolor_training; X_given_virginica_training]', [], m);

X_pca_given_setosa = (W * X_given_setosa_training')';
X_pca_given_versicolor = (W * X_given_versicolor_training')';
X_pca_given_virginica = (W * X_given_virginica_training')';

X_pca_given_setosa_test = (W * X_given_setosa_test')';
X_pca_given_versicolor_test = (W * X_given_versicolor_test')';
X_pca_given_virginica_test = (W * X_given_virginica_test')';

%% (c) Estimate Mu and Sigma
[Mu_setosa, Sigma_setosa] = mle(X_pca_given_setosa);
[Mu_versicolor, Sigma_versicolor] = mle(X_pca_given_versicolor);
[Mu_virginica, Sigma_virginica] = mle(X_pca_given_virginica);

%% (d) MLE classification
Theta_c1 = [Mu_setosa Sigma_setosa];
Theta_c2 = [Mu_versicolor Sigma_versicolor];
Theta_c3 = [Mu_virginica Sigma_virginica];

c_1 = classify(X_pca_given_setosa_test, Theta_c1, Theta_c2, Theta_c3);
c_2 = classify(X_pca_given_versicolor_test, Theta_c1, Theta_c2, Theta_c3);
c_3 = classify(X_pca_given_virginica_test, Theta_c1, Theta_c2, Theta_c3);

%% (e) confusion table
confusion_table(1, :) = [sum(c_1==1) sum(c_1==2) sum(c_1==3)];
confusion_table(2, :) = [sum(c_2==1) sum(c_2==2) sum(c_2==3)];
confusion_table(3, :) = [sum(c_3==1) sum(c_3==2) sum(c_3==3)];

display(confusion_table);

%% (f) plot PCA projected data
X_given_setosa_pca = PCA(X_given_setosa', [], m)';
X_given_versicolor_pca = PCA(X_pca_given_versicolor', [], m)';
X_given_virginica_pca = PCA(X_given_virginica', [], m)';

figure;
scatter(X_pca_given_setosa_test(:,1), X_pca_given_setosa_test(:,2), 'ob'); hold on;
scatter(X_pca_given_versicolor_test(:,1), X_pca_given_versicolor_test(:,2), 'xr');
scatter(X_pca_given_virginica_test(:,1), X_pca_given_virginica_test(:,2), 'dk'); hold off;