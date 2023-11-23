function [U,S,V,T] = pcaCompression(imdata,r)
    U = zeros(size(imdata,1),r,size(imdata,3));
    S = zeros(r,r,size(imdata,3));
    V = zeros(size(imdata,2),r,size(imdata,3));
    T = zeros(1,1,size(imdata,3));
    for i = 1:size(imdata,3)
        [U(:,:,i),S(:,:,i),V(:,:,i),T(:,:,i)] = ...
            pcaChCompression(imdata(:,:,i),r);
    end
end