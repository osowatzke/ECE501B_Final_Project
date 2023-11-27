function [U,S,V,T] = pcaChCompression(imdata,r)
    imdata = double(imdata);
    T = mean(imdata,'all');
    imdata = imdata - T;
    [U,S,V] = svd(imdata);
    S = diag(S);

    if r ~= 0
        U = U(:,1:r);
        S = S(1:r);
        V = V(:,1:r);
    end
end