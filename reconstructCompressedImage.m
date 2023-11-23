function imdata = reconstructCompressedImage(U,S,V,T)
    imdata = zeros(size(U,1),size(V,1),size(U,3),'uint8');
    for i = 1:size(imdata,3)
        imdata(:,:,i) = uint8(U(:,:,i)*diag(S(:,:,i))*V(:,:,i)' + T(:,:,i));
    end
end