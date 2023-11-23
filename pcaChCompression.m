function [U,S,V,T] = pcaChCompression(imdata,r)
    imdata = double(imdata);
    T = mean(imdata,'all');
    imdata = imdata - T;
    [U,S,V] = svd(imdata);
    U = U(:,1:r);
    S = diag(S(1:r,1:r));
    V = V(:,1:r);
end