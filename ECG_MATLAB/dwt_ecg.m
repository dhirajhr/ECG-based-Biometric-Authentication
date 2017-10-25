function D = dwt_ecg(ecg)
%N=ecg(:,1);
X=ecg(:,1);
%some changes for arduino
%f voltage levels
fs=500; %sampling frequency - 250 for QT database
gr=0;   %set to 1; if graph needs to be shown
[amp,index,delay]=pan_tompkin(X,fs,gr); %  amp - amplitude of Rpeaks and index f R peaks
SS1=[(index(5)-43):(index(5)+83)]; % taking any 4 beats. 43 samples to left and 83 to right; gives QRS Complex
SS2=[(index(6)-43):(index(6)+83)];
SS3=[(index(7)-43):(index(7)+83)];
SS4=[(index(8)-43):(index(8)+83)];
SS1=SS1';
SS2=SS2';
SS3=SS3';
SS4=SS4';
OP1=X(SS1);
OP2=X(SS2);
OP3=X(SS3);
OP4=X(SS4);
OP1=OP1';
OP2=OP2';
OP3=OP3';
OP4=OP4';
merged=[OP1 OP2 OP3 OP4];% merging 4 QRS Complexes
N=[0:0.04:(length(merged)-1)*0.04]; % Time Domain
disp(length(N));
disp(length(merged));
plot(N,merged);
[C,L] = wavedec(merged,9,'haar'); % Haar Wavelet Decomposition at level 9
subplot(1,2,1);
plot(C);

subplot(1,2,2);
plot(L);
D=C;