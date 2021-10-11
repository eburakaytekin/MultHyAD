function Kn=my_besselk(n,x)
Exx=exp(-x)+eps;
Ak=power((pi/(2*x)),(1/2))*Exx;
N4=(1+((4*n^2)-49)/(32*x));
N3=(1+((((4*n^2)-25)*N4)/(24*x)));
N2=(1+((((4*n^2)-9)*N3)/(16*x)));
N1=(1+((((4*n^2)-1)*N2)/(8*x)));
Kn=Ak*N1;

end