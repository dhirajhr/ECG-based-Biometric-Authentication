function [res,minn] = dwt_test(flname,fullname,train)
   fullname = strrep(fullname,'/','\'); %visual c
  train = strrep(train,'/','\'); % visual c
    x=load(fullname);
    dd=dwt_avg(x);
    %disp(length(dd));
    [C,L] = wavedec(dd,9,'haar');
    [filenames, avgg,wdc]=dwt_dataset(train);
    finall=[];
    %disp(length(C));
    %disp(size(wdc));
    for i=1 : size(wdc,1)
        tt=pdist2(C,wdc(i,:));
        finall=[finall;tt];
    end
    disp(finall);
    %disp('hi');
    [M,I]=min(abs(finall));
    
   %res=strcat('identified',filenames(I));
   res=filenames(I,:);
   disp(flname);
   disp(res);
   disp(M);
   minn=M;
    %Result verification
    