function [res,min]= chk(flname,fullname,train)
instrumentObjects=instrfind;  % don't pass it anything - find all of them.
delete(instrumentObjects);
serialPort='COM1';
s = serial(serialPort,'BaudRate',9600);
fopen(s);
tic
x1=1;
x2=1;
dd=zeros(1700,3);
hh=zeros(1700,1);
i=1;
dd=[];
while toc<10  
   dat = fscanf(s); %Read Data from Serial as Float
    str = cellstr(dat);
    str=strjoin(str);
    disp(size(str));
    disp(class(str));
    disp(str);
    [num, status] = str2num(str);
    if status==1
        dd(x1,1)=num;
    end
 %dd(x1,1)=int16(dat);
  x1=x1+1;
   %hh(x2,1)=x2;
   %x2=x2+1;
end
fclose(s);

fid=fopen(fullname,'w');
fprintf(fid, '%d \n', dd');
fclose(fid);
a=load(fullname);
a1=a(2:length(a)-1);
dlmwrite(flname,a1);
[res,min]=dwt_test(flname,fullname,train);
disp(res);