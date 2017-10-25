function [W,e]=rls1(x,d,N,delta,lambda,I,Wini,Pini,Xini)

%ol-original signal, 's'

%x-reference input, here the reference to noise, 'n1'

%d-desired or primary input, here the signal plus noise, 's+no'

%N-no. of taps i.e., filter length or order

%delta-inverse of estimated signal power, typically, 0<delta<1

%lambda-small positive real value approximately 0<lambda<1, closer to unity

%Wini-initial weight vector

%Xini-initial state vector i.e., initial values of reference input

%W-final weight vector

%e-error signal e=d-W*x, this is the signal recovered

%Example code: load('ecg.mat'); [W,e]=rls1(ecg,no,ecgn,4,0.1,0.9);

if (~exist('I','var')||isempty(I))
   itr = 1;
else
   itr = I;
end

if (~exist('Wini','var')||isempty(Wini))
   W = zeros(N,1);
else
   if (length(Wini)~=N)
      error('Weight initialization must match filter length');
   end
   W = Wini;
end

if (~exist('Pini','var')||isempty(Pini))
   P = diag((ones(N,1)/delta));
else
   if ((size(Pini,1)~=N) || (size(Pini,2)~=N))
      error('Initial inverse must me square NxN');
   end
   P = Pini; 
end
		
Lx = length(x);
[m,n] = size(x);
if (n>m)
   x = x.';
end

if (~exist('Xini','var')||isempty(Xini))
   x = [zeros(N-1,1); x];
else
   if (length(Xini)~=(N-1))
      error('State initialization must match filter length minus one');
   end
   x = [Xini; x];
end

for j=1:itr
    for i = 2:Lx
       X = x(i+N-1:-1:i);
       Pi = P*X;
       k = Pi/(lambda + X'*Pi);
       y(i,1) = W'*X;
       e(i,1) = d(i,1) - y(i,1);
       W = W + k*e(i,1);
       P = (P - (k*(X')*P))/lambda;
    end
end
