%Anomaly Detection and Classification for Hyperspectral Imagery
%AUTOMATIC THRESHOLDING METHOD 
function map=finddtmap(scores,far,thresholds,far_rate)

[R,L]=size(scores);
map=zeros(R,L);

Ne = find(far>=far_rate);

a=find(scores>=thresholds(Ne(1)));

map(a)=1;



end
