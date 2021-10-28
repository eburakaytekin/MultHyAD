%data -> Real HSI
%diffim -> Real HSI - Synthesized HSI

%hyperNormalize, hyperRxDetector and hyperCov functions are taken from https://github.com/isaacgerg/matlabHyperspectralToolbox

function [AUCResult,FARResult,elapsedTimeResult,dtmapArray,scoresData] = mvnd(data,DAT)


elapsedTimeTot=[];
AUCTot=[];
FARTot=[];
map=DAT.map;
[AA,BB] = size(map);
dtmapArray=zeros(10,AA*BB);

%% Real Data
[aucScoreData,FARscoreData,dtmapData]=MVNMain(data,map,DAT);

scoresData.aucScore=aucScoreData;
scoresData.FARscore=FARscoreData;
scoresData.dtmap=dtmapData;

%% Reconstruction Error Matrix 1
diffim=DAT.D1;

tic
[aucScoreDiffim,FARscoreDiffim,dtmapDiffim]=MVNMain(diffim,map,DAT);
elapsedTime = toc;

elapsedTimeTot=[elapsedTimeTot elapsedTime];
AUCTot=[AUCTot aucScoreDiffim];
FARTot=[FARTot FARscoreDiffim];

% Detection Map
dtmapArray(1,:)=dtmapDiffim;

%% Reconstruction Error Matrix 2
diffim=DAT.D2;

tic
[aucScoreDiffim,FARscoreDiffim,dtmapDiffim]=MVNMain(diffim,map,DAT);
elapsedTime = toc;

elapsedTimeTot=[elapsedTimeTot elapsedTime];
AUCTot=[AUCTot aucScoreDiffim];
FARTot=[FARTot FARscoreDiffim];

% Detection Map
dtmapArray(2,:)=dtmapDiffim;


%% Reconstruction Error Matrix 3
diffim=DAT.D3;

tic
[aucScoreDiffim,FARscoreDiffim,dtmapDiffim]=MVNMain(diffim,map,DAT);
elapsedTime = toc;

elapsedTimeTot=[elapsedTimeTot elapsedTime];
AUCTot=[AUCTot aucScoreDiffim];
FARTot=[FARTot FARscoreDiffim];

% Detection Map
dtmapArray(3,:)=dtmapDiffim;

%% Reconstruction Error Matrix 4
diffim=DAT.D1;

tic
[aucScoreDiffim,FARscoreDiffim,dtmapDiffim]=MVNMain(diffim,map,DAT);
elapsedTime = toc;

elapsedTimeTot=[elapsedTimeTot elapsedTime];
AUCTot=[AUCTot aucScoreDiffim];
FARTot=[FARTot FARscoreDiffim];

% Detection Map
dtmapArray(4,:)=dtmapDiffim;

%% Reconstruction Error Matrix 5
diffim=DAT.D5;

tic
[aucScoreDiffim,FARscoreDiffim,dtmapDiffim]=MVNMain(diffim,map,DAT);
elapsedTime = toc;

elapsedTimeTot=[elapsedTimeTot elapsedTime];
AUCTot=[AUCTot aucScoreDiffim];
FARTot=[FARTot FARscoreDiffim];

% Detection Map
dtmapArray(5,:)=dtmapDiffim;

%% Reconstruction Error Matrix 6
diffim=DAT.D6;

tic
[aucScoreDiffim,FARscoreDiffim,dtmapDiffim]=MVNMain(diffim,map,DAT);
elapsedTime = toc;

elapsedTimeTot=[elapsedTimeTot elapsedTime];
AUCTot=[AUCTot aucScoreDiffim];
FARTot=[FARTot FARscoreDiffim];

% Detection Map
dtmapArray(6,:)=dtmapDiffim;

%% Reconstruction Error Matrix 7
diffim=DAT.D7;

tic
[aucScoreDiffim,FARscoreDiffim,dtmapDiffim]=MVNMain(diffim,map,DAT);
elapsedTime = toc;

elapsedTimeTot=[elapsedTimeTot elapsedTime];
AUCTot=[AUCTot aucScoreDiffim];
FARTot=[FARTot FARscoreDiffim];

% Detection Map
dtmapArray(7,:)=dtmapDiffim;

%% Reconstruction Error Matrix 8
diffim=DAT.D8;

tic
[aucScoreDiffim,FARscoreDiffim,dtmapDiffim]=MVNMain(diffim,map,DAT);
elapsedTime = toc;

elapsedTimeTot=[elapsedTimeTot elapsedTime];
AUCTot=[AUCTot aucScoreDiffim];
FARTot=[FARTot FARscoreDiffim];

% Detection Map
dtmapArray(8,:)=dtmapDiffim;

%% Reconstruction Error Matrix 9
diffim=DAT.D9;

tic
[aucScoreDiffim,FARscoreDiffim,dtmapDiffim]=MVNMain(diffim,map,DAT);
elapsedTime = toc;

elapsedTimeTot=[elapsedTimeTot elapsedTime];
AUCTot=[AUCTot aucScoreDiffim];
FARTot=[FARTot FARscoreDiffim];

% Detection Map
dtmapArray(9,:)=dtmapDiffim;

%% Reconstruction Error Matrix 10
diffim=DAT.D10;

tic
[aucScoreDiffim,FARscoreDiffim,dtmapDiffim]=MVNMain(diffim,map,DAT);
elapsedTime = toc;

elapsedTimeTot=[elapsedTimeTot elapsedTime];
AUCTot=[AUCTot aucScoreDiffim];
FARTot=[FARTot FARscoreDiffim];

% Detection Map
dtmapArray(10,:)=dtmapDiffim;

% Detection Result Mean
% Detection Result Mean
AUCResult=mean(AUCTot);
elapsedTimeResult=mean(elapsedTimeTot);
FARResult=mean(FARTot);


end
