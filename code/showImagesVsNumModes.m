% Function shows the reconstructed image for different number of modes
%
% Inputs:
%
%   U       mxmx3 U matrix per channel
%   S       kx1x3 Main diagonal of S matrix per channel (k = min(m,n))
%   V       nxnx3 V matrix per channel
%   T       1x1x3 Mean per channel
%   imName  Name of image file
%   figNum  Figure number to plot curve on (optional)
%
function showImagesVsNumModes(imdata,U,S,V,T,varargin)

    % Create figure for plotting
    f = figure(varargin{:});
    clf(f);

    % Determine maximum number of modes
    maxModes = min(size(imdata,[1 2]));

    % Create array of modes
    modes = [5, 12, 25, 50, 100, 200, 400, maxModes];

    % Create tiled layout
    tiledlayout(3,3,'TileSpacing','Compact','Padding','Compact');

    % Add original image to tiled layout
    nexttile
    imshow(imdata)
    title('Original')
    
    % Compress and reconstruct image for each mode
    for r=2:9
        imR = reconstructCompressedImage(U,S,V,T,modes(r-1));
        nexttile
        imshow(imR)
        title(sprintf("r=%i", modes(r-1)))
    end
end