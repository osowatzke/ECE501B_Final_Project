% Function plots cummulative energy vs the number of modes
%
% Inputs:
%
%   S           kx1x3 Main diagonal of S matrix per channel (k = min(m,n))
%   imName      Name of image file
%   figNum      Figure number to plot curve on (optional)
%
function plotCummulativeEnergy(S,imName,varargin)
    
    % Create figure
    f = figure(varargin{:});
    clf(f);

    % Remove singleton dimensions
    S = reshape(S,[],size(S,3));

    % Compute the Cummulative Energy
    S = filter(ones(size(S,1),1),1,S);
    S = S/S(end);

    % Plot the singular values of each channel
    semilogy(S,'LineWidth',2);

    % Create legend
    legend("R-Channel","G-Channel","B-Channel")
    ylabel("Cumulative Energy")
    xlabel("Singular Values")
    title(sprintf("Cumulative Singular Value Energy of %s",imName))
end