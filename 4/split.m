function [ training, test ] = split( dataset )
% split - Divide the dataset into trainset and testset
%   Training set : row 11 to 40
%   Test set     : row 1 to 10 and 41 to 50

    training = dataset(11:40, :);
    test = dataset([1:10 41:50], :);
end

