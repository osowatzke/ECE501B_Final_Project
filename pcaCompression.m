function [U,S,V,T] = pcaCompression(imdata,r)
    % Setting r==0 means use all component of the SVD
    if r == 0
        U = zeros(size(imdata,1),size(imdata,1),size(imdata,3));
        V = zeros(size(imdata,2),size(imdata,2),size(imdata,3));
        S = zeros(min(size(imdata,1),size(imdata,2)),1,size(imdata,3));
    else
        U = zeros(size(imdata,1),r,size(imdata,3));
        V = zeros(size(imdata,2),r,size(imdata,3));
        S = zeros(r,1,size(imdata,3));
    end
    
    T = zeros(1,1,size(imdata,3));
    for i = 1:size(imdata,3)
        [U(:,:,i),S(:,:,i),V(:,:,i),T(:,:,i)] = ...
            pcaChCompression(imdata(:,:,i),r);
    end
end