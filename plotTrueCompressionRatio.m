imName = 'wagon.jpg';
imdata_path = fullfile(matlabroot,'toolbox/images/imdata');
imdata = imread(fullfile(imdata_path,imName));

% Step size for number of modes to include
nSVs = min(size(imdata(:,:,1)));
skipCount = 20;
n = floor(nSVs/skipCount)*skipCount;
compressionRatio = zeros(1,floor(nSVs/skipCount)+1);

numer = numel(imdata(:,:,1));
denom = sum(size(imdata(:,:,1)));

compressionRatio(1) = numer/denom;

for r=20:skipCount:n
    compressionRatio(ceil(r/skipCount)) = numer/(r*denom);
end

ax = axes;
xAxis = [1,linspace(20,n,floor(nSVs/skipCount))];
semilogy(ax,xAxis,compressionRatio,'LineWidth',2)
ylabel(ax,"Compression Ratio")
xlabel(ax,"Number of Modes")
title(ax,sprintf("Compression Ratio vs Number of Modes Used from %s",imName))