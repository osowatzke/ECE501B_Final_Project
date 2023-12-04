% Function performs PCA on all channels of image data
%
% Inputs:
%
%   X           mxnx3 input image data
%
% Outputs:
%
%   U           mxmx3 U matrix per channel
%   S           kx1x3 Main diagonal of S matrix per channel (k = min(m,n))
%   V           nxnx3 V matrix per channel
%   T           1x1x3 Mean per channel
%
function [U,S,V,T] = performPca(X)

    % Convert matrix to double precision
    X = double(X);

    % Get size of input matrix
    [m,n,ch] = size(X);

    % Allocate empty arrays for output
    U = zeros(m,m,ch);
    % Only saving values on main diagonal
    S = zeros(min(m,n),1,ch);
    V = zeros(n,n,ch);

    % Mean of each channel
    T = mean(X,[1 2]);

    % Subtract mean for each channel
    X = X - T;

    % Perform PCA on each channel
    for i = 1:ch
        [U(:,:,i),temp,V(:,:,i)] = svd(X(:,:,i));
        S(:,:,i) = diag(temp);
    end
end