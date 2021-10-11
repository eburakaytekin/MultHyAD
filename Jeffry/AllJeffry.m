function [AUCMeanResult,AUCModeResult,elapsedTimeResult,FARMeanResult,FARModeResult,dtmapMeanArray,dtmapModeArray]=AllJeffry(DAT,FiltOn,PCAOn)



% Initilization and Allocation
AUCMeanTot=[];
AUCModeTot=[];
elapsedTimeTot=[];
FARMeanTot=[];
FARModeTot=[];


map=DAT.map;

[AA,BB] = size(map);
dtmapMeanArray=zeros(10,AA*BB);
dtmapModeArray=zeros(10,AA*BB);

%% Reconstruction Error Matrix 1
diffim=DAT.D1;

if PCAOn==1
[index]=PCAIndexCalcJeff(diffim,map,FiltOn);   
data = hyperpca(diffim,index);
else
data=diffim;
end

tic
[aucMean,aucMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMJeffreysG(data,map,FiltOn,DAT);
elapsedTime = toc;

AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
elapsedTimeTot=[elapsedTimeTot elapsedTime];
FARMeanTot=[FARMeanTot FARMean];
FARModeTot=[FARModeTot FARMode];

% Detection Map
dtmapMeanArray(1,:)=dtmapMean;
dtmapModeArray(1,:)=dtmapMode;

%% Reconstruction Error Matrix 2
diffim=DAT.D2;

if PCAOn==1
data = hyperpca(diffim,index);
else
data=diffim;
end

tic
[aucMean,aucMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMJeffreysG(data,map,FiltOn,DAT);
elapsedTime = toc;

AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
elapsedTimeTot=[elapsedTimeTot elapsedTime];
FARMeanTot=[FARMeanTot FARMean];
FARModeTot=[FARModeTot FARMode];

% Detection Map
dtmapMeanArray(2,:)=dtmapMean;
dtmapModeArray(2,:)=dtmapMode;

%% Reconstruction Error Matrix 3
diffim=DAT.D3;

if PCAOn==1
data = hyperpca(diffim,index);
else
data=diffim;
end

tic
[aucMean,aucMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMJeffreysG(data,map,FiltOn,DAT);
elapsedTime = toc;

AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
elapsedTimeTot=[elapsedTimeTot elapsedTime];
FARMeanTot=[FARMeanTot FARMean];
FARModeTot=[FARModeTot FARMode];

% Detection Map
dtmapMeanArray(3,:)=dtmapMean;
dtmapModeArray(3,:)=dtmapMode;

%% Reconstruction Error Matrix 4
diffim=DAT.D4;

if PCAOn==1
data = hyperpca(diffim,index);
else
data=diffim;
end

tic
[aucMean,aucMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMJeffreysG(data,map,FiltOn,DAT);
elapsedTime = toc;

AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
elapsedTimeTot=[elapsedTimeTot elapsedTime];
FARMeanTot=[FARMeanTot FARMean];
FARModeTot=[FARModeTot FARMode];

% Detection Map
dtmapMeanArray(4,:)=dtmapMean;
dtmapModeArray(4,:)=dtmapMode;

%% Reconstruction Error Matrix 5

diffim=DAT.D5;

if PCAOn==1
data = hyperpca(diffim,index);
else
data=diffim;
end
   
tic
[aucMean,aucMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMJeffreysG(data,map,FiltOn,DAT);
elapsedTime = toc;

AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
elapsedTimeTot=[elapsedTimeTot elapsedTime];
FARMeanTot=[FARMeanTot FARMean];
FARModeTot=[FARModeTot FARMode];

% Detection Map
dtmapMeanArray(5,:)=dtmapMean;
dtmapModeArray(5,:)=dtmapMode;

%% Reconstruction Error Matrix 6
diffim=DAT.D6;

if PCAOn==1
data = hyperpca(diffim,index);
else
data=diffim;
end
    
tic
[aucMean,aucMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMJeffreysG(data,map,FiltOn,DAT);
elapsedTime = toc;

AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
elapsedTimeTot=[elapsedTimeTot elapsedTime];
FARMeanTot=[FARMeanTot FARMean];
FARModeTot=[FARModeTot FARMode];

% Detection Map
dtmapMeanArray(6,:)=dtmapMean;
dtmapModeArray(6,:)=dtmapMode;

%% Reconstruction Error Matrix 7
diffim=DAT.D7;

if PCAOn==1
data = hyperpca(diffim,index);
else
data=diffim;
end
   
tic
[aucMean,aucMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMJeffreysG(data,map,FiltOn,DAT);
elapsedTime = toc;

AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
elapsedTimeTot=[elapsedTimeTot elapsedTime];
FARMeanTot=[FARMeanTot FARMean];
FARModeTot=[FARModeTot FARMode];

% Detection Map
dtmapMeanArray(7,:)=dtmapMean;
dtmapModeArray(7,:)=dtmapMode;

%% Reconstruction Error Matrix 8
diffim=DAT.D8;

if PCAOn==1
data = hyperpca(diffim,index);
else
data=diffim;
end

   
tic
[aucMean,aucMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMJeffreysG(data,map,FiltOn,DAT);
elapsedTime = toc;

AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
elapsedTimeTot=[elapsedTimeTot elapsedTime];
FARMeanTot=[FARMeanTot FARMean];
FARModeTot=[FARModeTot FARMode];

% Detection Map
dtmapMeanArray(8,:)=dtmapMean;
dtmapModeArray(8,:)=dtmapMode;

%% Reconstruction Error Matrix 9
diffim=DAT.D9;

if PCAOn==1
data = hyperpca(diffim,index);
else
data=diffim;
end

tic
[aucMean,aucMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMJeffreysG(data,map,FiltOn,DAT);
elapsedTime = toc;

AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
elapsedTimeTot=[elapsedTimeTot elapsedTime];
FARMeanTot=[FARMeanTot FARMean];
FARModeTot=[FARModeTot FARMode];

% Detection Map
dtmapMeanArray(9,:)=dtmapMean;
dtmapModeArray(9,:)=dtmapMode;

%% Reconstruction Error Matrix 10
diffim=DAT.D10;

if PCAOn==1
data = hyperpca(diffim,index);
else
data=diffim;
end

tic
[aucMean,aucMode,FARMean,FARMode,dtmapMean,dtmapMode]=VBMJeffreysG(data,map,FiltOn,DAT);
elapsedTime = toc;

AUCMeanTot=[AUCMeanTot aucMean];
AUCModeTot=[AUCModeTot aucMode];
elapsedTimeTot=[elapsedTimeTot elapsedTime];
FARMeanTot=[FARMeanTot FARMean];
FARModeTot=[FARModeTot FARMode];

% Detection Map
dtmapMeanArray(10,:)=dtmapMean;
dtmapModeArray(10,:)=dtmapMode;

% Detection Result Mean
AUCMeanResult=mean(AUCMeanTot);
AUCModeResult=mean(AUCModeTot);
elapsedTimeResult=mean(elapsedTimeTot);
FARMeanResult=mean(FARMeanTot);
FARModeResult=mean(FARModeTot);
end
