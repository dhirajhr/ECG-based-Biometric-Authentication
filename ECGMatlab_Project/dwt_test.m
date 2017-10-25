function [res,minn] = dwt_test(flname,fullname)
    x=load(fullname);
    dd=dwt_avg(x);
    %disp(length(dd));
    [C,L] = wavedec(dd,9,'haar');
    [filenames, avgg,wdc]=dwt_dataset();
    finall=[];
    %disp(length(C));
    %disp(size(wdc));
    for i=1 : size(wdc,1)
        tt=pdist2(C,wdc(i,:));
        finall=[finall;tt];
    end
    
    [M,I]=min(abs(finall));
    
   %res=strcat('identified',filenames(I));
   res=filenames(I,:);
   disp(res);
   disp(M);
   minn=M;
    %Result verification
    