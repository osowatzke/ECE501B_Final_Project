%Author: Scott Thoesen
%Descr: This script plots number of modes used in a compressed image vs
%       Compression ratio.

% Import image
imdata_path = fullfile(matlabroot,'toolbox/images/imdata');
ref = imread(fullfile(imdata_path,'wagon.jpg'));

% Convert to get reference compression size
nSVs = min(size(ref(:,:,1)));
[U,S,V,T] = pcaCompression(ref,nSVs);
imageSize = getCompressedImageSize(U,S,V,T);

imdata = ref;
%imdata = convertToYCbCr(ref);

% Step size for number of modes to include
skipCount = 20;
n = floor(nSVs/skipCount)*skipCount;
compressionRatio = zeros(1,floor(nSVs/skipCount));

for r=20:skipCount:n
    %imR = convertToRgb(imR);
    [U,S,V,T] = pcaCompression(imdata,r);
    compressedImageSize = getCompressedImageSize(U,S,V,T);
    compressionRatio(ceil(r/skipCount)) = imageSize/compressedImageSize;
end

ax = axes;
xAxis = linspace(20,n,floor(nSVs/skipCount));
plot(ax,xAxis,compressionRatio,'LineWidth',2)
ylabel(ax,"Compression Ratio")
xlabel(ax,"Number of Modes")
title(ax,sprintf("Compression Ratio vs Number of Modes Used from %s",imName))