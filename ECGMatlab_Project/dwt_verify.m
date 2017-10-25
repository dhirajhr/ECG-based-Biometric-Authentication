function dwt_verify()
	%srcFiles = dir('ecgdata\*.txt'); 
    % srcFiles = dir('sele0_d3_ecg\*.txt'); 
     % srcFiles = dir('ecgid_test\*.txt'); 
     srcFiles = dir('ecgid_f_test\*.txt'); 
    correct=0;
    wrong=0;
    count=length(srcFiles);
    for i = 1 : length(srcFiles)
       % fullname= strcat('ecgid_test\',srcFiles(i).name);
         fullname= strcat('ecgid_f_test\',srcFiles(i).name);
      % fullname= strcat('sele0_d3_ecg\',srcFiles(i).name);
        flname=srcFiles(i).name;
        [res,minn]=dwt_test(flname,fullname);
        if(strcmp(flname,res))
            correct=correct+1;
        else
            wrong=wrong+1;
        end
        
    end
    acc=(correct/count)*100;
    X=sprintf('correctly identified: %d',correct);
    disp(X);
    X=sprintf('Total files: %d',count);
     disp(X);
    X=sprintf('Accuracy: %f %',acc);
     disp(X);
    close all;
    