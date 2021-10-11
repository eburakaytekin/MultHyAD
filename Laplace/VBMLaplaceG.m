function [auc_ABMean,auc_ABMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMLaplaceG(data,map,FiltOn,DAT)

[R,C,LA] = size(data);

if FiltOn==1 %stdfilt
  for Dim3=1:LA    
 DataFiltered(:,:,Dim3)=stdfilt(data(:,:,Dim3));
  end
elseif FiltOn==2 %average+square
  localMean = imboxfilt3(data,[9 9 1]); 
  data=data-localMean;
  DataFiltered=data.^2;
elseif FiltOn==3 %closing filter
 SE = strel('square', 3);
 for Dim3=1:LA    
 DataFiltered(:,:,Dim3)=imclose(data(:,:,Dim3),SE);
 end
elseif FiltOn==4 %closing filter

 localMean = imboxfilt3(data,[9 9 1]); 
 data=data-localMean;
 data=data.^2;
 SE = strel('square', 3);
 for Dim3=1:LA    
 DataFiltered(:,:,Dim3)=imclose(data(:,:,Dim3),SE);
 end
elseif FiltOn==5 % no filter
 DataFiltered=data;
end

[L,Sn,ExpM,ExpT,NN,PsiN,vN,gamma]=VBMLaplace(DataFiltered);

ApproximationTforMean=MeanWishart(PsiN,vN);
ApproximationTforMode=ModeWishart(PsiN,vN,L);

for idx=1:NN

put=reshape(Sn(idx,:),[1 L]);  

m0=mean(put);

DetectionMean(idx)=sqrt(gamma)*sqrt(transpose(put'-m0)*ApproximationTforMean*(put'-m0));
DetectionMode(idx)=sqrt(gamma)*sqrt(transpose(put'-m0)*ApproximationTforMode*(put'-m0));

end

labels=reshape(map,NN,1);

%% ROC Curve
[X_DetectionMean,Y_DetectionMean,aac_ABMean,auc_ABMean]=perfcurve(labels,DetectionMean,1);

FARMean=min(X_DetectionMean(Y_DetectionMean==1));

dtmapMean=finddtmap(DetectionMean,X_DetectionMean,aac_ABMean,DAT.FARValue);

%% ROC Curve
[X_DetectionMode,Y_DetectionMode,aac_ABMode,auc_ABMode]=perfcurve(labels,DetectionMode,1);

FARMode=min(X_DetectionMode(Y_DetectionMode==1));

dtmapMode=finddtmap(DetectionMode,X_DetectionMode,aac_ABMode,DAT.FARValue);

end