function ecgfetch()
%tm is the time interval
%Fs is sampling frequency
%first arg- dataset
%second arg- [1]- unfiltered signal and [2]- filtered signal 
%third argument- number of samples


      % [tm, signal,Fs]=rdsamp('ecgiddb/Person_01/rec_1',[2],5000);
      % dlmwrite('yo.txt',signal)
      % s = num2str(A)
      %s1 = strcat(s1,...,sN)
     dataset = 'ecgiddb/';
     people=20;
     for i=1 : people
        if(i<10)
            s=num2str(i);
            s1=strcat('Person_','0',s);
        else
            s=num2str(i);
            s1=strcat('Person_',s);
        end
        ll=strcat(dataset,s1,'/','rec_1');
        ll1=strcat(dataset,s1,'/','rec_2');
        disp(ll);
        [tm, signal,Fs]=rdsamp(ll,[2],5000);
        fname=strcat('ecg_ff_train\',s1,'.txt');
        dlmwrite(fname,[tm signal]);
        
        [tm1, signal1,Fs1]=rdsamp(ll1,[2],5000);
        fname=strcat('ecg_ff_test\',s1,'.txt');
        dlmwrite(fname,[tm1 signal1]);  
     end
      
  