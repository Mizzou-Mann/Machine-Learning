% Initialization
clear all; close all; clc; warning off all;

% Setup
Nfolder = 1; % # of folders
Nfile = 10; % # of files

% Read images from input{i} folder
Im = readimages( 'input' , 1:Nfolder, 'pgm', 1:Nfile);
[R,C]=size(Im{1,1}); % # of rows and colums per image

% Convert images to vectors
Imv = mat2vec(Im);

% PCA approximation
k = [1 4 8]; % dimensions to be preserved
x_bar = mean(Imv{1}, 2); % the sample mean
[D, N] = size(Imv{1}); % # original dimensions and training samples

% (a) and (b)
% Plot a 4-by-1 subplotting system
figure;
subplot(4,1,1);
image(uint8(cell2mat(Im))); % image printing (have to convert double precision numbers into 8-bit integers)
axis image;
title('Original images');
subplot_counter = 2;

for m=k
    [~,~,~,~,W] = PCA(Imv{1}, [], m);
    W = W'; % Transpose to get column Eigenvector
    Im_approximation = zeros(D, N);
    for i=1:N
        x = Imv{1}(:, i);
        Im_approximation(:, i) = pca_approximation(x, W, x_bar);
    end
    
    % Image Reconstructing (from data points (vectors))
    Imr = vec2mat({Im_approximation}, R);
    subplot(4,1, subplot_counter);
    image(uint8(cell2mat(Imr)));
    axis image;
    title([num2str(m) ' dimension projection images']);
    subplot_counter = subplot_counter + 1;
end
colormap(gray(256));

%% (c)
% Covariance S = E[(x-x_bar) * (x-x_bar)'];
distance = Imv{1} - x_bar*ones(1,N);
S = (distance * distance') / N;
[~, D] = eig(S);
Lambda = sort(diag(D), 'descend'); % l1 > l2 > ...

for m=k
    beta_k = sum(Lambda(1:m)) / sum(Lambda);
    e_square = sum(Lambda(m+1:end));
    display(['k:', num2str(m), ' => beta_k = ', num2str(beta_k), ', e_square = ', num2str(e_square)]);
end