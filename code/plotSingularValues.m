% Function plots cummulative energy vs the number of modes
%
% Inputs:
%
%   S           kx1x3 Main diagonal of S matrix per channel (k = min(m,n))
%   imName      Name of image file
%   figNum      Figure number to plot curve on (optional)
%
function plotSingularValues(S, imName, varargin)

    % Create figure
    f = figure(varargin{:});
    clf(f);

    % Remove singleton dimensions
    S = reshape(S,[],size(S,3));

    % Plot the singular values of each channel
    semilogy(S,'LineWidth',2);

    % Create legend
    legend("R-Channel","G-Channel","B-Channel")
    ylabel("Singular Value Magnitude")
    xlabel("Singular Value")
    title(sprintf("Singular Value Spectrum of %s",imName))
end