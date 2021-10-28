function [Result]=AllInOne(DAT,FiltOn,PCAOn,data)
if FiltOn>0  && FiltOn<6

%% Anomaly Detection for MV Cauchy Distribution
[Result.AUCMeanCauchy,Result.AucModeCauchy,Result.elapsedTimeCauchy,...
    Result.CauFARMeanResult,Result.CauFARModeResult,...
    Result.dtmapCauMeanArray,Result.dtmapCauModeArray]=AllCauchy(DAT,FiltOn,PCAOn);

%% Anomaly Detection for MV Jeffry Distribution
[Result.AUCMeanJeffry,Result.AucModeJeffry,Result.elapsedTimeJeffry,...
    Result.SJefFARMeanResult,Result.JefFARModeResult,...
    Result.dtmapJefMeanArray,Result.dtmapJefModeArray]=AllJeffry(DAT,FiltOn,PCAOn);

%% Anomaly Detection for MV Laplace Distribution
[Result.AUCMeanLaplace,Result.AucModeLaplace,Result.elapsedTimeLaplace,...
    Result.LpcFARMeanResult,Result.LpcFARModeResult,...
    Result.dtmapLpcMeanArray,Result.dtmapLpcModeArray]=AllLaplace(DAT,FiltOn,PCAOn);


%% Anomaly Detection for MV Student-T Distribution
[Result.AUCMeanStudent,Result.AucModeStudent,Result.elapsedTimeStudent,...
    Result.StdFARMeanResult,Result.StdFARModeResult,...
    Result.dtmapStdMeanArray,Result.dtmapStdModeArray]=AllStudent(DAT,FiltOn,PCAOn);

end

%% Anomaly Detection for MV Skewed Distribution
[Result.AUCMeanSkewed,Result.AucModeSkewed,Result.elapsedTimeSkewed,Result.index,...
    Result.SkwFARMeanResult,Result.SkwFARModeResult,...
    Result.dtmapSkwMeanArray,Result.dtmapSkwModeArray]=AllSkewed(DAT,FiltOn,PCAOn);


%% Anomaly Detection for MV Normal Distribution
[Result.AUCMVN,Result.FARMVN,Result.elapsedTimeMVN,Result.dtmapMVN,Result.ScoresDataMVN]=mvnd(data,DAT);

end