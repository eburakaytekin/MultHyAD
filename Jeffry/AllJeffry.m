function [AUCMeanResult,AUCModeResult,elapsedTimeResult,FARMeanResult,FARModeResult,dtmapMeanArray,dtmapModeArray]=AllJeffry(DAT,FiltOn,PCAOn)
% Copyright (c) 2021, Ensar Burak Aytekin (burak.aytekin@tubitak.gov.tr)
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
% 
% Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
% Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



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