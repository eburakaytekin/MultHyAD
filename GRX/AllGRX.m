function [AUCMeanResult,elapsedTimeResult,FARMeanResult,dtmapMeanArray]=AllGRX(data)

tic
[AUCMeanResult,FARMeanResult,dtmapMeanArray]=GRXfunc(data,map,DAT);
elapsedTimeResult = toc;

end
