% Author: O. Sowatzke
%
% Updated: 11/22/2023
%
% Subect: Function convert RGB Image data to YCbCr image data following the
% work of Xu and Kim in "Luminance Preserving Color Conversion for 24-bit
% RGB Displays"
%
function imdata = convertToYCbCr(imdata)

    % Get the original dimensions of the image [MxNx3]
    dims = size(imdata);

    % Permute the original image data so that the RGB channels are in the
    % first dimension. The resulting dimensions should be [3xMxN]
    imdata = permute(imdata,[3 1 2]);

    % Cast the resulting image to double precision and collapse the third
    % dimension
    imdata = reshape(double(imdata),3,[]);

    % Transform the data
     M = [ 0.299,  0.587,  0.114;
         -0.169, -0.332,  0.500;
          0.500, -0.419, -0.081];
    T = [0; 128; 128];
    imdata = M*imdata + T;

    % Cast the resulting image data back to uint8's
    imdata = uint8(imdata);

    % Transpose the image so the dimensions are [(MxN)x3]
    imdata = imdata.';

    % Reshape the image data so the dimensions are [3xMxN]
    imdata = reshape(imdata,dims);
end