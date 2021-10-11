function [L,Sn,ExpM,ExpT,NN,PsiN,vN,bb,alpha,betha]=VBMSkewT(data,SkewCoeff)

[R,C,L] = size(data); % RxC pixel number, L band number

im3=data;

NN=R*C; %number of pixel in image
ford=reshape(im3,NN,L); % vector

%% Initilization Expectations and Hyper Parameters

alpha=L/2;
betha=alpha/2;
lambda=1000;
p = 0.99;

mu0 = mean(ford,1); % Initilization expectation
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

tt = ((NN-L-1)*p+L+1)/1-p;
vN= (tt+NN+1);

c=(NN*L+alpha+betha)/2;

bb=ones(1,L)*SkewCoeff; % Skew parameter 
d=NN;

%% Expectation Maximization
IterationNumber=200;

for t=1:IterationNumber
    
    
    ExpT=vN*(inv(PsiN));
    
 
    aa=alpha-(NN*L/2);
    ZZ=sqrt(c*d);
    K1=my_besselk(aa-1,ZZ);
    K2=my_besselk(aa,ZZ);
    K3=my_besselk(aa+1,ZZ);
    
    ExpZinv=(K1/K2)*((d/c)^(-1/2));
    ExpZ=(K3/K2)*((d/c)^(1/2));
    
    ExpM=((ExpZinv*NN*SampleMean)-NN*bb+(lambda*mu0))/(ExpZinv*NN+lambda);
    
    Cm=((ExpZinv*NN+lambda)*ExpT)^-1;
    
    TotalSn=transpose(Sn-ExpM)*(Sn-ExpM);
    
    TotalBB=transpose(bb)*sum((Sn-ExpM-(ExpZ*bb/2)),1);
    
    c=trace(ExpT*(NN*bb.*transpose(bb)));
        
    PsiN=ExpZinv*TotalSn-2*TotalBB+lambda*((ExpM-mu0)*transpose(ExpM-mu0))+Cm*(ExpZinv*NN+lambda)+(tt-L-1)*Psi0;
    
    betha=-(2*alpha)/ExpZinv;
    d=(trace(ExpT*(TotalSn+NN*Cm))+betha);
    
    lambda=L/(trace(ExpT*(TotalSn+Cm)));
    mu0=ExpM;
end   
    
end