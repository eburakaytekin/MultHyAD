function [nu]=fAlpha(c,d,betha)
% Estimating the shape parameter nu of
% Gamma distribution.
% Nc        : Number of pixels in the class
% numax     : maximum value of nu
numax=1;
% nuold     : current value of nu

% nu        : estimated value of nu

ExpLogZ=log(d)-psi(0,c);
f = @(alpha)(-psi(0,alpha)+log(betha)-ExpLogZ); %Jeffrey

if f(numax)>=0
    z = numax;
else
    z = fzero(f,[1e-5 numax]);
end
z(z<=0)=1e-5;
% figure
% fplot(@(x)(-psi(0,(x)/2)+((Eddel(c)/(x^2))/2)-(N)/(x)+log(1/2)),[0 100])
% fplot(@(x)-gammaln(x/2)+x*log(tau*x/2)/2-1*log(tau)-x*tau/2,[0 100])
nu=z;
end