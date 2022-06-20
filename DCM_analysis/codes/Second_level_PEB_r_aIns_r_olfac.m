%% PEB for the right anterior insula and the right olfactory cortex
%% Load PEB prerequisites

load('..\GCM_full_model_files\GCM_aIns_r_olfac_full_model.mat')%load the GCM file (directory of the individual DCM file) generated from the first level
M = struct();
M.Q      = 'all';
M.X      = [ones(38,1)];
M.Xnames{1} = 'mean';
M.maxit  = 256;

%%%%%%%%% PEB settings A %%%%%%%%%%%%%%%
%% Build PEB (using A parameters)
[PEB_A,RCM_A] = spm_dcm_peb(GCM,M,{'A'});
save('..\PEB_analysis\PEB_A_aIns_r_olfac.mat','PEB_A','RCM_A');

%% Automatic search A
BMA_A = spm_dcm_peb_bmc(PEB_A)
save('..\PEB_analysis\BMA_search_A_aIns_r_olfac.mat','BMA_A');

%% review A
spm_dcm_peb_review(BMA_A,GCM)
%%%%%%%%% PEB settings B %%%%%%%%%%%%%%%
%% Build PEB (using B parameters)
[PEB_B,RCM_B] = spm_dcm_peb(GCM,M,{'B'});
save('..\PEB_analysis\PEB_B_concatenate_aIns_r_olfac.mat','PEB_B','RCM_B');

%% Automatic search B
BMA_B = spm_dcm_peb_bmc(PEB_B)
save('..\PEB_analysis\BMA_search_B_aIns_r_olfac.mat','BMA_B');

%% review B
spm_dcm_peb_review(BMA_B,GCM)
%%%%%%%%%% PEB settings C %%%%%%%%%%%%%%%%%%%

%% Build PEB (using C parameters)
[PEB_C,RCM_C] = spm_dcm_peb(GCM,M,{'C'});
save('..\PEB_analysis\PEB_concatenate_aIns_r_olfac.mat','PEB_C','RCM_C');
%% Automatic search C
BMA_C = spm_dcm_peb_bmc(PEB_C)
save('..\PEB_analysis\BMA_search_C_aIns_r_olfac.mat','BMA_C');

%% review C
spm_dcm_peb_review(BMA_C,GCM)