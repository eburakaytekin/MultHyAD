
function [aucScore,FARscore,dtmap]=MVNMain(data,map,DAT)
[R,C,L]=size(data);

NN=R*C; %number of pixel in image
data =2*hyperNormalize(data)-1;
ford_real=reshape(data(:,:,:),[R*C,L])';

scoresData = hyperRxDetector(ford_real);

labels=reshape(map,NN,1);

%% Accuracy Check Block

% ROC Curve
[X_Detection,Y_Detection,aac_AB,aucScore]=perfcurve(labels,scoresData,1);


FARscore=min(X_Detection(Y_Detection==1));

dtmap=finddtmap(scoresData,X_Detection,aac_AB,DAT.FARValue);

end