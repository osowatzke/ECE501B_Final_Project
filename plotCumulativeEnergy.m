% Author: Scott Thoesen
% Descr: Plot the cumulative energy of the singular values of an image
imName = 'wagon.jpg';
imdata_path = fullfile(matlabroot,'toolbox/images/imdata');
imdata = imread(fullfile(imdata_path,imName));
%imdata = convertToYCbCr(imdata);
[~,S,~,~] = pcaCompression(imdata,0);

s = zeros(size(S,1)-1,3);
for ii=1:3
    last = S(1,1,ii);
    for jj=1:size(s,1)
        last = last + S(jj+1,1,ii);
        s(jj,ii) = last;
    end
    s(:,ii) = s(:,ii)/s(end,ii);
end

ax = axes;
xAxis = linspace(1,length(s),length(s));
plot(ax,xAxis,s(:,1),xAxis,s(:,2),xAxis,s(:,3),'LineWidth',2)
%legend(ax,"Y-Channel","Cb-Channel","Cr-Channel")
legend(ax,"R-Channel","G-Channel","B-Channel")
ylabel(ax,"Cumulative Energy")
xlabel(ax,"Singular Values")
title(ax,sprintf("Cumulative Singular Value Energy of %s",imName))
