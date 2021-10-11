function [auc_ABMean,auc_ABMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMstudentTG(data,map,FiltOn,DAT)

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

[PsiN,vN,L,NN,Sn,alpha,betha]=VBM_studentT(DataFiltered);

% APPROXIMATIONS
% Approximation T

ApproximationTforMean=MeanWishart(PsiN,vN);
ApproximationTforMode=ModeWishart(PsiN,vN,L);

for idx=1:NN

put=reshape(Sn(idx,:),[1 L]);  

m0=mean(put);

DetectionAlpBetMean(idx)=((alpha+L)/2)*log((1+(1/betha)*transpose(put'-m0)*ApproximationTforMean*(put'-m0)));
DetectionAlpBetMode(idx)=((alpha+L)/2)*log((1+(1/betha)*transpose(put'-m0)*ApproximationTforMode*(put'-m0)));
end


labels=reshape(map,NN,1);

%% ROC Curve
[X_DetectionMean,Y_DetectionMean,aac_ABMean,auc_ABMean]=perfcurve(labels,DetectionAlpBetMean,1);

FARMean=min(X_DetectionMean(Y_DetectionMean==1));

dtmapMean=finddtmap(DetectionAlpBetMean,X_DetectionMean,aac_ABMean,DAT.FARValue);

[X_DetectionMode,Y_DetectionMode,aac_ABMode,auc_ABMode]=perfcurve(labels,DetectionAlpBetMode,1);

FARMode=min(X_DetectionMode(Y_DetectionMode==1));

dtmapMode=finddtmap(DetectionAlpBetMode,X_DetectionMode,aac_ABMode,DAT.FARValue);

end