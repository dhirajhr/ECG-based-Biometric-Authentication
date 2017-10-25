function ardimat1
arduino=serial('COM1','BaudRate',9600);
 
fopen(arduino);
 
x=linspace(1,100);
   
for i=1:length(x)
	y(i)=fscanf(arduino,'%s');
end
	
fclose(arduino);
disp('making plot..')
plot(x,y);
