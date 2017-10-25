function [filenames,avgg,wdc] = dwt_dataset()
   % srcFiles = dir('ecgdata\*.txt'); 
    % srcFiles = dir('sele0_d3_ecg\*.txt'); 
  %  srcFiles = dir('ecgid_train\*.txt'); 
   srcFiles = dir('ecgid_f_train\*.txt'); 
  
    filenames=[];
    contents=[];
    avgg=[];
    wdc=[];
    for i = 1 : length(srcFiles)
        filename = srcFiles(i).name;
        filenames=[filenames;filename];
        %fullname= strcat('ecgdata\',srcFiles(i).name);
       % fullname= strcat('sele0_d3_ecg\',srcFiles(i).name);
      % fullname= strcat('ecgid_train\',srcFiles(i).name);
      fullname= strcat('ecgid_f_train\',srcFiles(i).name);
        content=load(fullname);
        tempp=dwt_avg(content);
        %disp(filename);
        %disp(size(tempp));
        avgg=[avgg;tempp];
        [C,L] = wavedec(tempp,9,'haar');
        wdc=[wdc;C];
        %contents = [contents; content];
  
    end
    %disp(size(wdc,1));
    %disp(length(wdc));