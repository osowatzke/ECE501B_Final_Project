% Script performs image compression using PCA and outputs plots for the
% project report. These plots include: the singular values, cummulative
% energy, images vs number of modes, PSNR vs number of modes, and
% compression ratio vs number of modes.
%

% Load image
imName = 'wagon.jpg';
imdata_path = fullfile(matlabroot,'toolbox/images/imdata');
imdata = imread(fullfile(imdata_path,imName));

% Perform PCA on image
[U,S,V,T] = performPca(imdata);

% Initial figure number
figNum = 1;

% Plot singular values
plotSingularValues(S,imName,figNum);
figNum = figNum + 1;

% Plot cummulative energy
plotCummulativeEnergy(S,imName,figNum);
figNum = figNum + 1;

% Show image vs the number of modes
showImagesVsNumModes(imdata,U,S,V,T,figNum);
figNum = figNum + 1;

% Plot Compression Ratio vs number of modes
plotComprRatioVsNumModes(imdata,imName,figNum);
figNum = figNum + 1;

% Plot PSNR vs numebr of modes
plotPSNRVsNumModes(imdata,U,S,V,T,imName,figNum);
figNum = figNum + 1;
