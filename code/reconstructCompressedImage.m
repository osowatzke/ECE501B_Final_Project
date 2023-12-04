% Function computes the PSNR
%
% Inputs:
%
%   U       mxmx3 U matrix per channel
%   S       kx1x3 Main diagonal of S matrix per channel (k = min(m,n))
%   V       nxnx3 V matrix per channel
%   T       1x1x3 Mean per channel
%   r       Number of Modes
%
% Outputs:
%
%   X       mxnx3 reconstructed image
%
function X = reconstructCompressedImage(U,S,V,T,r)
    
    % Compress Image by keep only a subset of the principle components
    U = U(:,1:r,:);
    S = S(1:r,:,:);
    V = V(:,1:r,:);

    % Get size of reconstructed image
    m  = size(U,1);
    n  = size(V,1);
    ch = size(U,3);

    % Allocate empty array for reconstructed image
    X = zeros(m,n,ch);

    % Reconstruct Each Channel of Image
    for i = 1:ch
        X(:,:,i) = U(:,:,i)*diag(S(:,:,i))*V(:,:,i)' + T(:,:,i);
    end

    % Quantize Reconstructed Image
    X = uint8(X);
end