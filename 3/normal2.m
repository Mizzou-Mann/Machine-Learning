% General 2-D Normal PDF
% X1 and X2 are matrices with same size
% Mu is 2*1, and Sigma is 2*2 positive-definite

function NN=normal2(X1,X2,Mu,Sigma)
    [I,J]=size(X1); % size(X1)=size(X2)
    NN=zeros(I,J);
    for i=1:I
        for j=1:J
            X=[X1(i,j);X2(i,j)]; % 2*1
            denominator=(2*pi)*sqrt(det(Sigma));
            exponent=-0.5*transpose(X-Mu)/Sigma*(X-Mu);
            NN(i,j)=1/denominator*exp(exponent);
        end
    end
end