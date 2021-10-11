function DataFiltered=DiffSquareFilter(data)
[R,L,C]=size(data);
FiltSize=9;
GuardbandSize=1;
MidPoint=round(FiltSize/2);
for idx=1:C
dataExtended(:,:,idx)=wextend('2D','symw',data(:,:,idx),(MidPoint-1));
end


HorizontalSelectPixel=1:FiltSize;
VerticalSelectPixel=1:FiltSize;

for upindex=1:C
    for verindex=1:R
        for horindex=1:L            
     partialdata=dataExtended(VerticalSelectPixel+verindex-1,HorizontalSelectPixel+horindex-1,upindex); 
     FilteredPixel=DiffSquareInnerFilter(partialdata,GuardbandSize);
     DataFiltered(verindex,horindex,upindex)=FilteredPixel;
     
        end
    end
        
end






end