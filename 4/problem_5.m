% Initialization
clear all; close all; clc; warning off all;

% Setup
Nfolder = 5; % # of folders (one person per folder)
Nfile = 10; % # of files

% Read images from input{i} folder
Im = readimages( 'ImageFaceID/input' , 1:Nfolder, 'pgm', 1:Nfile);
[R, C]=size(Im{1,1}); % # of rows and colums per image

% Convert images to vectors
Imv = mat2vec(Im);
X_training = [Imv{1}(:, 1:5) Imv{2}(:, 1:5) Imv{3}(:, 1:5) Imv{4}(:, 1:5) Imv{5}(:, 1:5)];
X_test = [Imv{1}(:, 6:10) Imv{2}(:, 6:10) Imv{3}(:, 6:10) Imv{4}(:, 6:10) Imv{5}(:, 6:10)];

% PCA approximation
M = [1 4 10]; % dimensions to be preserved
K = [1 3 5]; % # of neighbors in Knn
% Both the training targets (labels) and test targets
% since our training and set are order in symmetry
targets = [ones(1,5) ones(1,5)*2 ones(1,5)*3 ones(1,5)*4 ones(1,5)*5];
targets_size = length(targets);
error_rate_table = ones(3, 3);

row = 1;
col = 1;
for m=M
    [~,~,~,~,W] = PCA(X_training, [], m);
    X_training_pca = W * X_training;
    X_test_pca = W * X_test;
    
    for k=K
        classification = Nearest_Neighbor(X_training_pca, targets, X_test_pca, k);
        error_rate_table(row, col) = 1 - (sum(classification == targets) / targets_size);
        row = row + 1;
    end
    col = col + 1;
    row = 1;
end

display(error_rate_table);