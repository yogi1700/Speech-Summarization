clc;
clear all;
% [x fs nbits] = wavread('D:\D Backup\PhD\Database\elsdsr\train\FAML_Sa.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Downloads\EpochEstimation\Bharat.wav');
% [x fs nbits] = wavread('D:\D Backup\PhD\Database\CMU_Kids_Corpus\fabm2bj2.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Downloads\Gender_Classification\women\w01ae.wav');
% [x fs nbits] = wavread('D:\D Backup\PhD\Other_Publications\Graphics\Published\Anmol_Sadanand\Internship_Code_Results\Internship\IIIT-Hindi\Input\Ba_1_1\ba_1_1.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Downloads\Gender_Classification\men\m01ae.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Downloads\glottalsource\glottalsource\SA1.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Documents\Mispronunciation\Data_phonology\Phonological_Process\Alveolarization\Yagarisidanu\Misp_1\YaDarisidanu.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Documents\Mispronunciation\Data_phonology\Phonological_Process\Alveolarization\Yagarisidanu\Misp_1\YagarisiDanu.wav');
% [x fs nbits] = wavread('C:\Users\Nitk\Documents\Mispronunciation\Data_phonology\Phonological_Process\Deaspiration\AushaDhi\Misp_1\Ausadi_1.wav');

[x fs nbits] = wavread('C:\Users\Nitk\Documents\Pendata\Experiments\Aspi_unaspi\Aspi_unaspi_exp\Data_record\K\Segmented\k_1_1\kaa_1_1.wav');
[x_1 fs_1 nbits_1] = wavread('C:\Users\Nitk\Documents\Pendata\Experiments\Aspi_unaspi\Aspi_unaspi_exp\Data_record\Kh\Segmented\Kh_1_1\khaa_1_1.wav');
t = (1/fs):(1/fs):(length(x)/fs);
t_1 = (1/fs_1):(1/fs_1):(length(x_1)/fs_1);

% [g,dg,a,ag,hpfilter_out] = iaif(x,fs);
[g,gd,a,ag] = iaif_ola(x,fs);
[g_1,gd_1,a_1,ag_1] = iaif_ola(x_1,fs_1);

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

x_norm_1 = x_1./(1.01*(abs(max(x_1))));
g_norm_1 = g_1./(1.01*(abs(max(g_1))));

% figure()
% plot(t,x_norm); hold on; plot(chk_test,Cos_X); hold off; axis tight;

for i=1:length(gci)-1
    curr=gci(i,1);
    ori_sig = x(curr,1);
	gvv_sig = g(curr,1);
    Cos_X_sig(i) = dot(ori_sig,gvv_sig)/(norm(ori_sig)*norm(gvv_sig));
end

start_x = 260;
fianl_x = 1620;
start_x_1 = 700;
fianl_x_1 = 2160;

temp_x = x(start_x:fianl_x);
temp_x_1 = x_1(start_x_1:fianl_x_1);

temp_g = g_norm(start_x:fianl_x);
temp_g_1 = g_norm_1(1,start_x_1:fianl_x_1);

pos_g = temp_g;
pos_g(pos_g<0) = 0;
pos_g_1 = temp_g_1;
pos_g_1(pos_g_1<0) = 0;

temp_t = (1/fs):(1/fs):(length(temp_x)/fs);
temp_t_1 = (1/fs_1):(1/fs_1):(length(temp_x_1)/fs_1);

figure();
% subplot(2,1,1); plot(t,x_norm); hold on; plot(((gci-9)/fs),Cos_X_sig); hold off; axis tight;
% subplot(2,1,1); plot(t(40:2000), g_norm(40:2000)); axis tight;
% subplot(2,1,2); plot(t_1(1,440:3000), g_norm_1(1,440:3000)); axis tight;
row=4;
subplot(row,2,1); plot(temp_t, temp_x, 'k'); axis tight; ylabel('Amplitude (dB)'); ylim([-0.5 0.5]); set(gca,'XTick',0:0.02:temp_t(end)); set(gca, 'FontSize', 12);
subplot(row,2,2); plot(temp_t_1, temp_x_1, 'k'); axis tight; ylim([-1 1]); ylim([-0.5 0.5]); set(gca,'XTick',0:0.02:temp_t_1(end)); set(gca, 'FontSize', 12)
subplot(row,2,3); plot(temp_t, temp_g, 'k'); axis tight; ylim([-1 1]); set(gca,'XTick',0:0.02:temp_t(end)); set(gca, 'FontSize', 12)
subplot(row,2,4); plot(temp_t_1, temp_g_1, 'k'); axis tight; ylim([-1 1]); set(gca,'XTick',0:0.02:temp_t_1(end)); set(gca, 'FontSize', 12)
subplot(row,2,5); plot(temp_t, pos_g, 'k'); axis tight; ylim([0 1]); set(gca,'XTick',0:0.02:temp_t(end)); set(gca, 'FontSize', 12)
subplot(row,2,6); plot(temp_t_1, pos_g_1, 'k'); axis tight; ylim([0 1]); set(gca,'XTick',0:0.02:temp_t_1(end)); set(gca, 'FontSize', 12)

dur_t = temp_t(430:end);
dur_t_1 = temp_t_1(550:end);
dur_g = pos_g(430:end);
dur_g_1 = pos_g_1(550:end);

subplot(row,2,7); plot(dur_t, dur_g, 'k'); axis tight; xlabel('Time(sec)'); ylim([0 1]); set(gca,'XTick',0:0.02:dur_t(end)); set(gca, 'FontSize', 12);
subplot(row,2,8); plot(dur_t_1, dur_g_1, 'k'); axis tight; xlabel('Time(sec)'); ylim([0 1]); set(gca,'XTick',0:0.02:dur_t_1(end)); set(gca, 'FontSize', 12)

figure();
subplot(2,1,1); plot(dur_g); axis tight;
subplot(2,1,2); plot(dur_g_1); axis tight;

% cycle_g = dur_g(187:380);
% cycle_g_1 = dur_g_1(205:391);
% 
% cycle_g = cycle_g(1:187);
% cycle_g_1 = cycle_g_1(1:187);
% 
% cycle_t = (1/fs):(1/fs):(length(cycle_g)/fs);
% cycle_t_1 = (1/fs_1):(1/fs_1):(length(cycle_g_1)/fs_1);
% 
% figure();
% subplot(2,1,1); plot(cycle_t, cycle_g, 'k'); axis tight; ylabel('Amplitude (dB)'); xlabel('Time(sec)'); ylim([0 1]); set(gca,'XTick',0:0.003:cycle_t(end)); set(gca, 'FontSize', 12); set(gca, 'XTickLabel', num2str(get(gca,'XTick')','%0.3f'));
% subplot(2,1,2); plot(cycle_t_1, cycle_g_1, 'k'); axis tight; ylabel('Amplitude (dB)'); xlabel('Time(sec)'); ylim([0 1]); set(gca,'XTick',0:0.003:cycle_t_1(end)); set(gca, 'FontSize', 12); set(gca, 'XTickLabel', num2str(get(gca,'XTick')','%0.3f'));

% figure();
% % subplot(2,1,1); plot(t,x_norm); hold on; plot(((gci-9)/fs),Cos_X_sig); hold off; axis tight;
% subplot(2,1,1); plot(t,g_norm); hold on; stem(((gci-9)/fs),k); plot(((gci-9)/fs),Cos_X); hold off; axis tight;
% subplot(2,1,2); plot(t,x_norm); hold on; stem(((gci-9)/fs),k); plot(t,VTC); hold off; axis tight;