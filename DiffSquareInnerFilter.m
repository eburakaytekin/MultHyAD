function FilteredPixel=DiffSquareInnerFilter(partialdata,GuardbandSize)

FilterSize=size(partialdata,2);
ZeroPointStart=GuardbandSize;
MidPoint=round(FilterSize/2);
TotalNumberofElement=FilterSize*FilterSize-GuardbandSize*GuardbandSize;
% Filtering

partialdata(ZeroPointStart+1:ZeroPointStart+GuardbandSize,...
    ZeroPointStart+1:ZeroPointStart+GuardbandSize)=-partialdata(MidPoint,MidPoint);

FilteredPixel=sum(sum(power(partialdata-partialdata(MidPoint,MidPoint),2)))/TotalNumberofElement;

% if squareroot
FilteredPixel=sqrt(FilteredPixel);
end