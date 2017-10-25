function nlms2(ol,x,d,N,mu,alpha,Wini,Xini)

%ol-original signal, 's'

%x-reference input, here the reference to noise, 'n1'

%d-desired or primary input, here the signal plus noise, 's+no'

%N-no. of taps i.e., filter length or order

%mu-step-size or convergence parameter usually 
%(i) 0<mu<1/lambdam where lambdam is the largest diagonal value of eignvalue matrix of autocorrelation matrix of x or 
%(ii) 0<mu<(1/N*Sxm) where Sxm-maximum of PSD of x or
%(iii) 0<mu<(1/N*Px),where Px-signal power of x or approximately 
%(iv) 0<mu<1;
%lower the mu value, better the noise removal but slower the speed of
%convergence and VICE VERSA. Try changing dynamically mu according to (i)
%or (ii) or (iii) for every iteration. Add a small positive value < 0.1 to
%denominator of (ii) and (iii) in order to avoid division-by-zero in case of zero signal power

%alpha-small positive real value approximately 0<alpha<1, closer to unity

%Wini-initial weight vector

%Xini-initial state vector i.e., initial values of reference input

%W-final weight vector

%e-error signal e=d-W*x, this is the signal recovered

%Example code: load('ecg.mat'); nlms2(ecg,no,ecgn,4,0.01,0.9)

%Please refer to (1) Adaptive Filter Theory by Simon Haykin (2) PDF file
%attached to this and (3) Adaptive Signal Processing by Widrow and Stearns.

Lx = length(x);
[m,n] = size(x);
if (n>m)
   x = x.';
end

if (~exist('Wini','var')||isempty(Wini))
   W = zeros(N,1);
else
   if (length(Wini)~=N)
      error('Weight initialization does not match filter length');
   end
   W = Wini;
end

if (~exist('Xini','var')||isempty(Xini))
   x = [zeros(N-1,1); x];
else
   if (length(Xini)~=(N-1))
      error('State initialization does not match filter length minus one');
   end
   x = [Xini; x];
end

n=1:Lx;

while (1),
    for k = 1:Lx,
       X = x(k+N-1:-1:k);
       y = W'*X;
       e(k,1) = d(k,1) - y;
       p = alpha + X'*X;
       W = W + ((2*mu*e(k,1))/p)*X;
    end;
    plot(n,ol,'r',n,e,'g');
    pause(1);
end;