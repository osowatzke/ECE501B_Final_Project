% Function computes the PSNR
%
% Inputs:
%
%   imdata      mxnx3 reference image data
%   U           mxmx3 U matrix per channel
%   S           kx1x3 Main diagonal of S matrix per channel (k = min(m,n))
%   V           nxnx3 V matrix per channel
%   T           1x1x3 Mean per channel
%   r           Number of Modes
%
% Ouputs:
%
%   PSNR        Peak Signal to Noise Ratio
%
function pSNR = computePSNR(imdata,U,S,V,T,r)
    
    % Create empty matrix for PSNR
    pSNR = zeros(size(r));

    % Reconstruct compressed image for each mode and compute PSNR
    for i=1:length(r)
        reconstructedImage = reconstructCompressedImage(U,S,V,T,r(i));
        pSNR(i) = psnr(reconstructedImage, imdata);
    end
end