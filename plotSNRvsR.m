%Author: Scott Thoesen
%Descr: This script plots number of modes used in a compressed image vs
%       PSNR.

% Import image
imdata_path = fullfile(matlabroot,'toolbox/images/imdata');
ref = imread(fullfile(imdata_path,'wagon.jpg'));
%imdata = convertToYCbCr(ref);
imdata = ref;

% Step size for number of modes to include
skipCount = 10;
nSVs = min(size(imdata(:,:,1)));
n = ceil(nSVs/skipCount);
pSNR = zeros(n,1);

for r=1:skipCount:nSVs
    [U,S,V,T] = pcaCompression(imdata,r);
    imR = reconstructCompressedImage(U,S,V,T);
    %imR = convertToRgb(imR);
    pSNR(ceil(r/skipCount)) = psnr(imR,ref);
end

ax = axes;
xAxis = linspace(1,nSVs,n);
plot(ax,xAxis,pSNR,'LineWidth',2)
ylabel(ax,"Peak Signal-to-Noise Ratio")
xlabel(ax,"Number of Modes")
title(ax,sprintf("PSNR vs Number of Modes Used from %s",imName))