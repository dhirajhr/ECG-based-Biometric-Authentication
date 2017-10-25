function D = radontrans(ecg,x)

% N is X-axis (time) 5000 x 1
% X is Y-axis (voltage) 5000 x 1
%Firstly, load('ecg.txt') will give 5000 x 2 matrix
% X is image file name
N= ecg(:,1);
X= ecg(:,2);
%D=radontrans(N,X)
    plot(N,X); %ecg signal
    axis off;
    saveas(gcf,x);
   clf('reset');
    dd=imread(x);
    %Frame = getframe(gcf);
    %dd=Frame.cdata;
    II=rgb2gray(dd); % grayscale signal without axes
    imshow(II);
    %applying morphological operation : dilation and erosion, and finally
    %median filtering
    SE=ones(3,3);
    %IM2 = imdilate(II,SE);
    %IM3 = imerode(IM2,SE);
     IM4 = medfilt2(II);
    theta=0:180;
    [R,xp] = radon(IM4,theta); %radon transform
    %R=projections(IM4,theta);
    disp(size(R));
    imshow(R,[],'Xdata',theta,'Ydata',xp,'InitialMagnification','fit');
    xlabel('\theta (degrees)');
    ylabel('x''');
    axis on;
    S=nanstd(R); % variance
    D=pdist(R,'seuclidean',S);% standard euclidean distance 
    D=D';
    %C=cov(D,D1)
    %C gives 4 x 4 matrix 
    %p=C(1,2)/(std(D)*std(D1)) - pearson corelation coefficient
    %dilation, erosion and median filter remaining.
    %ECG-ID dataset used, try it on QT dataset.