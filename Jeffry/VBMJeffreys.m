function [L,Sn,ExpM,ExpT,NN,PsiN,vN]=VBMJeffreys(data)

[R,C,L] = size(data); % RxC pixel number, L band number

im3=data;

NN=R*C; %number of pixel in image
ford=reshape(im3,NN,L); % vektör

%% Initilization Expectations and Hyper Parameters

betha=0;
alpha=0;
lambda=1000;
a = 0.99;

mu0 = mean(ford,1); % expectation mu0
SampleMean=mu0;

%covariance calculation
all_dfgt=zeros(NN,L);
for l=1:L
    all_dfgt(:,l)=ford(:,l)-mu0(l);
end
SSm=all_dfgt'*all_dfgt/NN;

Sn=ford;

Psi0 = 0.25*SSm + 0.75*diag(diag(SSm)); % Hyperparameter Psi0
PsiN=Psi0;

tt = (a*(R+L+1)-L-1)/(1-a);
vN= (tt+NN+1);

c=(NN*L+alpha+betha)/2;

%% Expectation Maximization
IterationNumber=200;

for t=1:IterationNumber
    
    ExpT=vN*(inv(PsiN));
    
 
    ExpZinv=(NN*L/2)/c;
    
    ExpM=((ExpZinv*NN*SampleMean)+(lambda*mu0))/(ExpZinv*NN+lambda);
    

    Cm=inv((ExpZinv*NN+lambda)*ExpT);
    TotalSn=transpose(Sn-ExpM)*(Sn-ExpM);
    
    c=trace(ExpT*(TotalSn+NN*Cm));
    PsiN=ExpZinv*TotalSn+lambda*((ExpM-mu0)*transpose(ExpM-mu0))+Cm*(ExpZinv*NN+lambda)+(tt+L+1)*Psi0;
    
end   
    
end