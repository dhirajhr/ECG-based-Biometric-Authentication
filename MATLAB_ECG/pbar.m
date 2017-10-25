function pbar() 
    N=50;    %total number of parfor iterations
     hbar = parfor_progressbar(N,'Computing...');  %create the progress bar
     a=load('Person_02.txt');
     parfor i=1:N,
         
         pan_tompkin(a(:,2),500,0);      % computation
         hbar.iterate(1);   % update progress by one iteration
     end
     close(hbar);   %close progress bar
