% PCA Index Calculation
function [index]=PCAIndexCalcSkewed(diffim,map,pSkewCoeff,FiltOn)
AUCMeanTot=[];
AUCModeTot=[];

for idx = 1:size(diffim,3)
data = hyperpca(diffim,idx);
%tic
[~,aucMean,aucMode]=SkewTGlobalFunc(data,map,pSkewCoeff,FiltOn);
%toc
AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
end

[~,index]=max(AUCModeTot);
end