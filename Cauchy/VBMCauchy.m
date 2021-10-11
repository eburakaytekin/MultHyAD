function [L,Sn,ExpM,ExpT,NN,PsiN,vN]=VBMCauchy(data)
[R,C,L] = size(data); % RxC pixel number, L band number

im3=data;

NN=R*C; %number of pixel in image
ford=reshape(im3,NN,L); % vector


%% Initilization Expectations and Hyper Parameters


a = 0.99; % Hyperparameter alpha

mu0 = mean(ford,1);
SampleMean=mu0;

%Covariance Calculation
all_dfgt=zeros(NN,L);
for l=1:L
    all_dfgt(:,l)=ford(:,l)-mu0(l);
end
SSm=all_dfgt'*all_dfgt/NN;

Sn=ford;

Psi0 = 0.25*SSm + 0.75*diag(diag(SSm)); % Hyper parameter Psi0
PsiN=Psi0;

tt = (a*(R+L+1)-L-1)/(1-a);
vN= (tt+L+NN+1);

c=(NN*L+1)/2;
d=NN/2;


%% Expectation Maximization
IterationNumber=200;

for idx=1:IterationNumber
    ExpT=vN*(pinv(PsiN));
    
    ExpZ=c/d;
    
    ExpM=SampleMean;
    
    Cm=pinv(ExpZ*NN*ExpT);
    
    TotalSn=transpose(Sn-ExpM)*(Sn-ExpM);
    
    PsiN=ExpZ*TotalSn+(Cm*ExpZ*NN)+(tt+L+1)*Psi0;
    
    d=(1/2)*trace(ExpT*(TotalSn+NN*Cm));
end


end
