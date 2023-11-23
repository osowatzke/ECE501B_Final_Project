function sizeBytes = getCompressedImageSize(U,S,V,T)
    numCells = numel(U) + numel(S) + numel(V) + numel(T);
    sizeBytes = numCells*8;
end