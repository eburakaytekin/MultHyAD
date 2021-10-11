function [L,Sn,ExpM,ExpT,NN,PsiN,vN,gamma]=VBMLaplace(data)

[R,C,L] = size(data); % RxC pixel number, L band number

im3=data;

NN=R*C; %number of pixel in image
ford=reshape(im3,NN,L); % vektör

%% Initilization Expectations and Hyper Parameters
betha=0;
alpha=1;
gamma=0.9;
lambda=1000;
a = 0.99;

mu0 = mean(ford,1); % Initilization expectation
SampleMean=mu0;

%Covariance Calculation
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
    
 
    aa=-(((NN-1)*L+1)/2)+1;
    ZZ=sqrt(c*gamma);
    K1=my_besselk(aa-1,ZZ);
    K2=my_besselk(aa,ZZ);
    K3=my_besselk(aa+1,ZZ);
    
    ExpZinv=(K1/K2)*((c/gamma)^(-1/2));
    ExpZ=(K3/K2)*((c/gamma)^(1/2));
    
    ExpM=((ExpZinv*NN*SampleMean)+(lambda*mu0))/(ExpZinv*NN+lambda);
    
    Cm=((ExpZinv*NN+lambda)*ExpT)^-1;
    TotalSn=transpose(Sn-ExpM)*(Sn-ExpM);
    
    c=trace(ExpT*(TotalSn+NN*Cm));
    PsiN=ExpZinv*TotalSn+lambda*((ExpM-mu0)*transpose(ExpM-mu0))+Cm*(ExpZinv*NN+lambda)+(tt+L+1)*Psi0;
    
    gamma=(L+1)/ExpZ;
    
end   
    
end