% Copyright (c) 2021, Ensar Burak Aytekin (burak.aytekin@tubitak.gov.tr)
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
% 
% Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
% Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



% MainScript

clear all
clc

addpath Data
addpath Cauchy
addpath Jeffry
addpath StudentT
addpath SkewedT
addpath Laplace
addpath GRX


% False Alarm Rate fotr Detection Map 
DAT.FARValue=0.05; 

FiltOn=1; % 1 - stdfilt, 2- average+ square, 3- closingfilter, 4- closingfilter + average+ square 5- No filter
%6 - Guardband Filter(only skewedt dist) 7-Guardband Filter( just skewedt dist) +stdfilt

PCAOn=0; % 1 - PCA On, 0 - PCA Off

% Loading Data and Definition
load 'abu-airport-2.mat' 
DAT.map=map;

load diffim_airport2_1.mat
DAT.D1=data;
load diffim_airport2_2.mat
DAT.D2=diffim;
load diffim_airport2_3.mat
DAT.D3=diffim;
load diffim_airport2_4.mat
DAT.D4=diffim;
load diffim_airport2_5.mat
DAT.D5=diffim;
load diffim_airport2_6.mat
DAT.D6=diffim;
load diffim_airport2_7.mat
DAT.D7=diffim;
load diffim_airport2_8.mat
DAT.D8=diffim;
load diffim_airport2_9.mat
DAT.D9=diffim;
load diffim_airport2_10.mat
DAT.D10=diffim;

Result=AllInOne(DAT,FiltOn,PCAOn,data);

%save('Result_diffim_airport2.mat','Result')

Result





