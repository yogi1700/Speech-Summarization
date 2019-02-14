clc;
clear all;
% [x fs nbits] = wavread('D:\D Backup\PhD\Database\elsdsr\train\FAML_Sa.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Downloads\EpochEstimation\Bharat.wav');
% [x fs nbits] = wavread('D:\D Backup\PhD\Database\CMU_Kids_Corpus\fabm2bj2.wav');
%%[x fs nbits] = wavread('C:\Users\Nitk\Downloads\Gender_Classification\women\w01ae.wav');
% [x fs nbits] = wavread('D:\D Backup\PhD\Other_Publications\Graphics\Published\Anmol_Sadanand\Internship_Code_Results\Internship\IIIT-Hindi\Input\Ba_1_1\ba_1_1.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Downloads\Gender_Classification\men\m01ae.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Downloads\glottalsource\glottalsource\SA1.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Documents\Mispronunciation\Data_phonology\Phonological_Process\Alveolarization\Yagarisidanu\Misp_1\YaDarisidanu.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Documents\Mispronunciation\Data_phonology\Phonological_Process\Alveolarization\Yagarisidanu\Misp_1\YagarisiDanu.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Documents\Mispronunciation\Data_phonology\Phonological_Process\Deaspiration\AushaDhi\Misp_1\Ausadi_1.wav');

[x fs nbits] = wavread('/home/iplab/Desktop/output_to_csv_result/StewartBrand_2006_1.wav');
t = (1/fs):(1/fs):(length(x)/fs);

% [g,dg,a,ag,hpfilter_out] = iaif(x,fs);
[g,gd,a,ag] = iaif_ola(x,fs);

[rw_g,cl_g]=size(g);

if(cl_g > rw_g)
    g=g';
end

[gci slope]=zerocros(g,'p');

len=length(gci);
k=ones(len,1);
k=0.5./k;

[rw, cl] = size(x);
VTC = zeros(rw,cl);
diff_gvv_sig = zeros(rw,cl);

for chk_zff = 1:length(g)
    if(chk_zff > 1)
        diff_gvv_sig(chk_zff) = g(chk_zff)-g(chk_zff-1);
    else
        diff_gvv_sig(chk_zff) = g(chk_zff);
    end
end

% figure();
% subplot(4,1,1)
% plot(x(3000:5500)); axis tight;
% 
% subplot(4,1,2)
% plot(g(3000:5500)); axis tight;
% 
% subplot(4,1,3)
% plot(diff_gvv_sig(3000:5500)); axis tight;
% 
% diff_gvv_sig_1 = -1.*diff_gvv_sig;
% 
% subplot(4,1,4)
% plot(diff_gvv_sig_1(3000:5500)); axis tight;

chk_test=(gci-9)/fs;
% chk_test=(gci)/fs;

Cos_X = zeros(len,1);
Cos_X_sig = zeros(len,1);

for i=1:length(gci)-1
    curr=gci(i,1);
    next=gci(i+1,1);
    ori_sig = x(curr:next,1);
	gvv_sig = g(curr:next,1); % use ZFF signal without difference ....
% 	gvv_sig = diff_gvv_sig(curr:next,1);    
    Cos_X(i) = dot(ori_sig,gvv_sig)/(norm(ori_sig)*norm(gvv_sig));

%     mean_ori = mean(ori_sig);
%     mean_gvv = mean(gvv_sig);
%     
%     diff_ori = ori_sig-mean_ori;
%     diff_gvv = gvv_sig-mean_gvv;
%     
%     sq_ori = diff_ori.^2;
%     sq_gvv = diff_gvv.^2;
%     
%     Cos_X(i) = dot(diff_ori,diff_gvv)/sqrt(sum(sq_ori)*sum(sq_gvv));    
    
	for z = gci(i,1):gci(i+1,1)
        VTC(z) = Cos_X(i);
    end  
end

% figure(); 
% subplot(2,1,1); plot(t,x); axis tight;
% subplot(2,1,2); plot(t,g); hold on; stem(chk_test,k); plot(chk_test,Cos_X); hold off; axis tight;

x_norm = x./(1.01*(abs(max(x))));
g_norm = g./(1.01*(abs(max(g))));

% figure()
% plot(t,x_norm); hold on; plot(chk_test,Cos_X); hold off; axis tight;

for i=1:length(gci)-1
    curr=gci(i,1);
    ori_sig = x(curr,1);
	gvv_sig = g(curr,1);
    Cos_X_sig(i) = dot(ori_sig,gvv_sig)/(norm(ori_sig)*norm(gvv_sig));
end

figure();
subplot(2,1,1); plot(t,x_norm); hold on; plot(((gci-9)/fs),Cos_X_sig); hold off; axis tight;
subplot(2,1,2); plot(t,g_norm); hold on; stem(((gci-9)/fs),k); plot(((gci-9)/fs),Cos_X); hold off; axis tight;
subplot(2,1,3); plot(t,x_norm); hold on; stem(((gci-9)/fs),k); plot(t,VTC); hold off; axis tight;
