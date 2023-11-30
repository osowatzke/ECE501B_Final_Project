% Author: Scott Thoesen
% Descr: Show montage of images composed of varying numbers of modes. For
%        qualitative analysis

% Import image
imdata_path = fullfile(matlabroot,'toolbox/images/imdata');
ref = imread(fullfile(imdata_path,'wagon.jpg'));
%imdata = convertToYCbCr(ref);

% Step size for number of modes to include
modes = [5, 12, 25, 50, 100, 200, 400, min(size(imdata(:,:,1)))];

t = tiledlayout(3,3,'TileSpacing','Compact','Padding','Compact');
nexttile
imshow(ref)
title('Original')

for r=2:9
    [U,S,V,T] = pcaCompression(imdata, modes(r-1));
    imR = reconstructCompressedImage(U,S,V,T);
    %imR = convertToRgb(imR);
    nexttile
    imshow(imR)
    title(sprintf("r=%i", modes(r)))
end