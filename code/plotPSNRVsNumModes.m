% Function plots PSNR vs the number of modes
%
% Inputs:
%
%   imdata      mxnx3 image data
%   U           mxmx3 U matrix per channel
%   S           kx1x3 Main diagonal of S matrix per channel (k = min(m,n))
%   V           nxnx3 V matrix per channel
%   T           1x1x3 Mean per channel
%   imName      Name of image file
%   figNum      Figure number to plot curve on (optional)
%
function plotPSNRVsNumModes(imdata,U,S,V,T,imName,varargin)

    % Create figure for plotting
    f = figure(varargin{:});
    clf(f);

    % Determine maximum number of modes
    maxModes = min(size(imdata,[1 2]));

    % Create array of modes
    modes = 1:10:maxModes;

    % Compute PSNR for each mode
    pSNR = computePSNR(imdata,U,S,V,T,modes);

    % Plot PSNR Curve
    plot(modes,pSNR,'LineWidth',2)
    ylabel("Peak Signal-to-Noise Ratio")
    xlabel("Number of Modes")
    title(sprintf("PSNR vs Number of Modes Used from %s",imName))
end