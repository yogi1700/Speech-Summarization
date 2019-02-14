function Test_LPR()
    lp_order = 16;
    [x, Fs, nbits] = wavread('aa_f.wav');   
    
    Frame_size = 320;
    Frame_shift = 160;
    [LP_coeff, LP_residue] = Lp_resdual_comp(x, Fs, nbits, Frame_size, Frame_shift, lp_order);  