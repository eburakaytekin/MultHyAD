function [PsiN,vN,L,NN,Sn,alpha,betha]=VBM_studentT(data)
[R,C,L] = size(data); % RxC pixel number, L band number

im3=data;

NN=R*C; %number of pixel in image
ford=reshape(im3,NN,L); % vector

%% Initilization Expectations and Hyper Parameters
alpha=-1; % 
betha=NN/11; 
lamb = 10000;  
a = 0.99; 

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

tt = (a*(R+L+1)-L-1)/(1-a);
vN= (tt+NN+1);

d=NN;

%% Expectation Maximization
IterationNumber=200;

for t=1:IterationNumber
    
    c=-alpha+(NN*L/2);
    % Expectations
    ExpInvZ=c/d;
    
    
    ExpT=vN*(inv(PsiN));
    
    
    % Parameters
    
    % q(m)
    ExpM=((ExpInvZ*NN*SampleMean)+(lamb*mu0))/(ExpInvZ*NN+lamb);
    
    Cm=inv((ExpInvZ*NN+lamb)*ExpT);
    
    % q(T)
    
    TotalSn=transpose(Sn-ExpM)*(Sn-ExpM);
    
    PsiN=ExpInvZ*TotalSn+lamb*((ExpM-mu0)*transpose(ExpM-mu0))+Cm*(ExpInvZ*NN+lamb)+(tt-L-1)*Psi0;
        
    d=(1/2)*(trace(ExpT*(TotalSn+NN*Cm))+betha);
    
    %alpha ve betha estimation
    [alpha]=fAlpha(c,d,betha);

    betha=-2*alpha/ExpInvZ;


       
end
end
