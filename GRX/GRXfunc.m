function [auc_GRX,FAR_GRX,dtmapMean]=GRXfunc(data,map,DAT)
% Global Reed-Xiaoli
% This function is for comparison only. No preprocessing was applied to the data.

[R,C,L] = size(data);


NN=R*C; %number of pixel in image

im3=data;
DataFiltered=reshape(im3,NN,L);

GRX = hyperRxDetector(DataFiltered');


labels=reshape(map,NN,1);
labels=double(labels);

[X_GRX,Y_GRX ,aac_ABMean, auc_GRX]=perfcurve(labels,GRX,1);

FAR_GRX=min(X_GRX(Y_GRX==1));

dtmapMean=finddtmap(GRX,X_GRX,aac_ABMean,DAT.FARValue);


end