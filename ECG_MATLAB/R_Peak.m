function [N1,X1]= R_Peak(N,X)
    %N (5000 x 1) is the X-axis i.e. time
    %X (5000 x 1) is the Y-axis i.e. electrical activiy (mV)
    %R=R_Peak(N,X) - call 
    R=ones(5000,2);
    R=R*-1;
    i=1;
    for k=2 : length(X)
        if(X(k)>X(k-1) && X(k)>X(k+1) && X(k)>=0.4)
            disp('Peak found');
            R(i,1)=X(k);
            R(i,2)=N(k);
            i=i+1;
        end
    end
    cnt=0;
    for k=1 : length(X)
        if(R(k,1)~=-1)
            cnt=cnt+1;
        end
    end
   plot(N,X);
    N1=R(1:cnt,2);
    X1=R(1:cnt,1);
    plot(N1,X1,'ro');
  % for k=1 : cnt
   %    hold on;
    %   plot(R(k,2),R(k,1),'ro');
  % end