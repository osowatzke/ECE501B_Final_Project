r = 16;
imdata_path = fullfile(matlabroot,'toolbox/images/imdata');
imdata = imread(fullfile(imdata_path,'wagon.jpg'));
imageSize = getImageSize(imdata);
imtool(imdata);
imdata = convertToYCbCr(imdata);
[U,S,V,T] = pcaCompression(imdata,r);
compressedImageSize = getCompressedImageSize(U,S,V,T);
imdata = reconstructCompressedImage(U,S,V,T);
imdata = convertToRgb(imdata);
imtool(imdata);
compressionRatio = imageSize/compressedImageSize;
fprintf('Initial Image Size: %d Bytes\n', imageSize);
fprintf('Compressed Image Size: %d Bytes\n', compressedImageSize);
fprintf('CompressionRatio: %.4f\n',compressionRatio);

