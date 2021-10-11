% PCA Index Calculation
function [index]=PCAIndexCalcCauchy(diffim,map,FiltOn)
AUCMeanTot=[];
AUCModeTot=[];

for idx = 1:size(diffim,3)
data = hyperpca(diffim,idx);
%tic
[aucMean,aucMode]=VBMCauchyG(data,map,FiltOn);
%toc
AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
end

[~,index]=max(AUCModeTot);
end