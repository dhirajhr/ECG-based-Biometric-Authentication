function ecgg = noiseremoval(ecg)
    N=ecg(:,1);
    X=ecg(:,2);
    [C,L]=wavedec(X,9,'db8');
    X1 = waverec(C,L,'db8');
    X2=X-X1;
    X3 = ecgTransientSuppression(X2', 500, 50,1.5 , 8);
    X3=X3';
    r=40/250;
    r1=60/250;
    [n,Wn] = buttord(r,r1,0.1,30);
    [b,a] = butter(n,Wn,'low');
    X4 = filter(b,a,X3);
    X5 = smooth(X4,5);
    ecgg=[N X5];
    
    