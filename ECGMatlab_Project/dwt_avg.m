function avgg = dwt_avg(ecg)
    N=ecg(:,1);
    X=ecg(:,2);   
    %plot(N,X);
    %X is vector of voltage levels
    fs=500; %sampling frequency - 250 for QT database and 500 for ECG-ID dataset
    gr=0;   %set to 1; if graph needs to be shown
    [amp,index,delay]=pan_tompkin(X,fs,0); %  amp - amplitude of Rpeaks and index f R peaks
    %check whether there are 83 samples after last R-Peak
    v1=index(length(index))+83;
    v2=length(X);
    v3=index(1)-43;
    if(v1>v2)
        index=index(1:(length(index)-1));
    end
    if(v3<1)
         index=index(2:length(index));
    end
    nr=length(index);
  
    nqrs=floor(nr/4);
    k=1;
    i=1;
    %disp(nr);
    %disp(nqrs);,
    merged1=[];
    while k<=nqrs
        SS1=[(index(i)-43):(index(i)+83)]; % taking any 4 beats. 43 samples to left and 83 to right; gives QRS Complex
        SS2=[(index(i+1)-43):(index(i+1)+83)];
        SS3=[(index(i+2)-43):(index(i+2)+83)];
        SS4=[(index(i+3)-43):(index(i+3)+83)];
        SS1=SS1';
        SS2=SS2';
        SS3=SS3';
        SS4=SS4';
        OP1=X(SS1);
        OP2=X(SS2);
        OP3=X(SS3);
        OP4=X(SS4);
        OP1=OP1';
        OP2=OP2';
        OP3=OP3';
        OP4=OP4';
        merged=[OP1 OP2 OP3 OP4];
        merged1=[merged1 ; merged];
        i=i+4;
        k=k+1;
    end
%N=[0:0.04:(length(merged)-1)*0.04]; % Time Domain
%disp(length(N));
%disp(length(merged));
%plot(N,merged);
    %disp(size(merged1,1));
   if(size(merged1,1)>1)
    avgg=mean(merged1);
   else
    avgg=merged1;
   end