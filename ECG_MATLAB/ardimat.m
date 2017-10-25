function ardimat

%delete(instrfindall);
%clear all
%clc
instrumentObjects=instrfind;  % don't pass it anything - find all of them.
delete(instrumentObjects)
clear all
arduino=serial('COM1','BaudRate',9600);
 
fopen(arduino);
 
x=linspace(1,100);
 %x=[0:0.002:9.998];
for i=1:length(x)
    y(i)=fscanf(arduino,'%f');
end
    
fclose(arduino);
disp('making plot..')
plot(x,y);
