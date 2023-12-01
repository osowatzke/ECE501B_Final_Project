% Author: Scott Thoesen
% Descr: Plot the singular values for a given image
imName = 'wagon.jpg';
imdata_path = fullfile(matlabroot,'toolbox/images/imdata');
imdata = imread(fullfile(imdata_path,imName));
%imdata = convertToYCbCr(imdata);
[~,S,~,~] = pcaCompression(imdata,0);

ax = axes;
xAxis = linspace(1,length(S),length(S));
semilogy(ax,xAxis,S(:,1),xAxis,S(:,2),xAxis,S(:,3),'LineWidth',2)
%legend(ax,"Y-Channel","Cb-Channel","Cr-Channel")
legend(ax,"R-Channel","G-Channel","B-Channel")
ylabel(ax,"Singular Value Magnitude")
xlabel(ax,"Singular Value")
title(ax,sprintf("Singular Value Spectrum of %s",imName))

