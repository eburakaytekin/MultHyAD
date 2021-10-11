function [SkewCoeff,auc_ABMean,auc_ABMode,...
    FARMean,FARMode,dtmapMean,dtmapMode]=SkewTGlobalFunc(data,map,SkewCoeff,FiltOn,DAT)


[R,C,LA] = size(data);

FiltOn=1;

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
elseif FiltOn==6 % GuardFilter    
    DataFiltered=DiffSquareFilter(data);   
elseif FiltOn==7 % GuardFilter + stdfilt 
    DataFiltered=DiffSquareFilter(data);  
    for Dim3=1:LA
        DataFiltered(:,:,Dim3)=stdfilt(DataFiltered(:,:,Dim3));
    end    
end


[L,Sn,ExpM,ExpT,NN,PsiN,vN,bb,alpha,betha]=VBMSkewT(DataFiltered,SkewCoeff);

[RA,CA,LA] = size(DataFiltered);

ApproximationTforMean=MeanWishart(PsiN,vN);
ApproximationTforMode=ModeWishart(PsiN,vN,L);

DetectionMean=zeros(1,NN);
DetectionMode=zeros(1,NN);

for idx=1:NN
    
    put=reshape(Sn(idx,:),[1 L]);
    
    m0=mean(put);
    DetectionMean(idx)=((-2*alpha+L)/2)*log(1+(1/betha)*transpose(put'-m0)*ApproximationTforMean*(put'-m0))-...
        transpose(put'-m0)*ApproximationTforMean*bb';
    DetectionMode(idx)=((-2*alpha+L)/2)*log(1+(1/betha)*transpose(put'-m0)*ApproximationTforMode*(put'-m0))-...
        transpose(put'-m0)*ApproximationTforMean*bb';
    
end

labels=reshape(map,R*C,1);

%% ROC Curve
[FAR_Mean,Y_DetectionMean,aac_ABMean,auc_ABMean]=perfcurve(labels,DetectionMean,1,'XCrit','fpr');

%  figure(1);
%   semilogx(FAR_Mean,Y_DetectionMean,'LineWidth',2);
% 
%   xlabel('FAR');
%   ylabel('Pd');

FARMean=min(FAR_Mean(Y_DetectionMean==1));

dtmapMean=finddtmap(DetectionMean,FAR_Mean,aac_ABMean,DAT.FARValue);


%% ROC Curve
[FAR_Mode,Y_DetectionMode,aac_ABMode,auc_ABMode]=perfcurve(labels,DetectionMode,1);

% figure(2);
% semilogx(X_DetectionMode,Y_DetectionMode,'LineWidth',2);
%
% xlabel('FAR');
% ylabel('Pd');

FARMode=min(FAR_Mode(Y_DetectionMode==1));

dtmapMode=finddtmap(DetectionMode,FAR_Mode,aac_ABMode,DAT.FARValue);

end