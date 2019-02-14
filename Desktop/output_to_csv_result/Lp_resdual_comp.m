function [LP_coeff_final, LP_residue] = Lp_resdual_comp(x, Fs, nbits, Frame_size, Frame_shift, lp_order)

x_norm = x./(1.01*abs(max(x)));    % signal between -1.0 to 1.0
%x_norm_samp = x_norm(101:420);
N = 320;
%w = hann(N);
%x_norm_samp = x_norm_samp.*w;

Corr_x = xcorr(x_norm_samp);
Corr_x_norm = Corr_x./(abs(max(Corr_x)));

A = Corr_x_norm(1:lp_order); % lp of order lp_order
r = Corr_x_norm(2:(lp_order+1));
A_topl = toeplitz(A);

LP_coeff = -inv(A_topl)*r;
LP_coeff = LP_coeff';
LP_coeff_final = [1 LP_coeff];

% inverse filtering to get residual
LP_Conv = conv(x_norm_samp,LP_coeff_final);

% Remove additional/total P samples from both ends 
LP_residue = LP_Conv(round(lp_order/2):length(LP_Conv)-round(lp_order/2)-1);

figure()
subplot(4,1,1)
plot(x_norm_samp);
subplot(4,1,2)
plot(Corr_x_norm);
subplot(4,1,3)
plot(LP_coeff_final);
subplot(4,1,4)
plot(LP_residue);