% Function computes the compressed image size
%
% Inputs:
%
%   imdata              mxnx3 Input Image
%   r                   Number of Modes
%
% Outputs:
%
%   compressionRatio    Compression Ratio
%
function compressionRatio = computeCompressionRatio(imdata,r)

    % Get dimensions of input data
    [m,n,ch] = size(imdata);

    % Compute compressed image size
    % Size of U_hat, S_hat, V_hat, and T matrices
    compressedImageSize = (m*r + r + n*r + 1)*ch;

    % Compute input image size
    imageSize = m*n*ch;

    % Compute compression Ratio
    compressionRatio = imageSize./compressedImageSize;
end