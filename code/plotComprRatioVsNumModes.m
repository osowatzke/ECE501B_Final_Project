% Function plots compression ratio vs the number of modes
%
% Inputs:
%
%   imdata      mxnx3 image data
%   imName      Name of image file
%   figNum      Figure number to plot curve on (optional)
%
function plotComprRatioVsNumModes(imdata,imName,varargin)

    % Create figure for plotting
    f = figure(varargin{:});
    clf(f);

    % Determine maximum number of modes
    maxModes = min(size(imdata,[1 2]));

    % Create array of modes
    modes = 20:20:maxModes;

    % Compute compression ratio
    compressionRatio = computeCompressionRatio(imdata,modes);

    % Plot compression ratio vs number of modes
    plot(modes,compressionRatio,'LineWidth',2)
    ylabel("Compression Ratio")
    xlabel("Number of Modes")
    title(sprintf("Compression Ratio vs Number of Modes Used from %s",imName));
    xlim([0 modes(end)]);
end