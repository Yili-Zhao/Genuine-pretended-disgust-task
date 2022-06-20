%cancatenating disgust run3 and run4 for each ROI
clear all, close all, clc
clear batch matlabbatch


% subjects survived significant testing for ROI aIns and rSMG (n=45) 
sublist={'01','02','03','04','05','06','07','08','09','10','11','12',...
'13','14','15','16','17','19','20','22','23','25','26','27',...
'28','29','30','31','32','33','34','35','36','37','38','39',...
'40','41','42','43','44','45','46','47','48'};
 
for sub=1:length(sublist)
    subj = char(sublist(sub))
    sub_folder=sprintf('sub_%s',subj)
    folder_path=fullfile(source_path,sub_folder)
 cd(folder_path)

% cancatenate VOI raIns for disgust run1 and run2
 d1_voi_raIns=load('raIns_disgust_run1.mat') 
 clear xY Y
 d2_voi_raIns=load('raIns_disgust_run2.mat')
 clear xY Y
 
 s1_voi_raIns=d1_voi_raIns
 s2_voi_raIns=d2_voi_raIns
 voi_raIns_folder=sprintf('DCM_analysis/spm_files/sub_%s',subj) %individual SPM folder 
 s1_voi_raIns_path=fullfile(voi_raIns_folder,'raIns_disgust_run1.mat')
 s2_voi_raIns_path=fullfile(voi_raIns_folder,'raIns_disgust_run2.mat')
 subjvoi_raIns{1}=s1_voi_raIns_path
 subjvoi_raIns{2}=s2_voi_r_aIns_path

 voi_raIns=subjvoi_raIns{1}
 temp_voi_raIns=load(voi_raIns)
 xY=temp_voi_raIns.xY
 Y=temp_voi_raIns.Y
 for v = 2:numel(subjvoi_raIns)
            src   = load(subjvoi_raIns{v});
            Y     = [Y; src.Y ];
            xY.X0 = [xY.X0; src.xY.X0 ];
            xY.u  = [xY.u; src.xY.u ];            
 end

 filename_raIns=sprintf('VOI_raIns_disgust_sub_%s.mat',subj)
 save_file=fullfile(folder_path,filename_raIns)
 save(save_file,'xY','Y')
 clear xY Y
  
% cancatenate VOI rSMG for disgust run1 and run2

 d1_voi_rSMG=load('rSMG_disgust_run1.mat')
 clear xY Y
 d2_voi_rSMG=load('rSMG_disgust_run2.mat')
 clear xY Y
 s1_voi_rSMG=p1_voi_rSMG 
 s2_voi_rSMG=p2_voi_rSMG
 voi_rSMG_folder=sprintf('DCM_analysis/spm_files/sub_%s',subj) %individual SPM folder 
 s1_voi_rSMG_path=fullfile(voi_rSMG_folder,'rSMG_disgust_run1.mat')
 s2_voi_rSMG_path=fullfile(voi_rSMG_folder,'rSMG_disgust_run1.mat')
 subjvoi_rSMG{1}=s1_voi_rSMG_path
 subjvoi_rSMG{2}=s2_voi_rSMG_path
 voi_rSMG=subjvoi_rSMG{1}
 temp_voi_rSMG=load(voi_rSMG)
 xY=temp_voi_rSMG.xY
 Y=temp_voi_rSMG.Y
 for v = 2:numel(subjvoi_rSMG)
            src   = load(subjvoi_rSMG{v});
            Y     = [Y; src.Y ];
            xY.X0 = [xY.X0; src.xY.X0 ];
            xY.u  = [xY.u; src.xY.u ];            
 end

 filename_rSMG=sprintf('VOI_rSMG_disgust_sub_%s.mat.mat',subj)
 save_file=fullfile(folder_path,filename_rSMG)
 save(save_file,'xY','Y')
 clear xY Y
    
end

% subjects survived significant testing for ROI the left olfactory cortex (l olfac) and the right olfactory cortex (r olfac) (n=38) 
sublist={'01','02','03','04','05','06','07','08','10','11','12',...
'13','14','15','17','19','20','22','23','25','26','27',...
'28','29','30','32','33','34','35','38','39',...
'42','43','44','45','46','47','48'};
 
for sub=1:length(sublist)
    subj = char(sublist(sub))
    sub_folder=sprintf('sub_%s',subj)
    folder_path=fullfile(source_path,sub_folder)
 cd(folder_path)

% cancatenate VOI l olfac for disgust run1 and run2
 d1_voi_l_olfac=load('l_olfac_disgust_run1.mat') % 
 clear xY Y
 d2_voi_l_olfac=load('l_olfac_disgust_run2.mat')
 clear xY Y
 
 s1_voi_l_olfac=d1_voi_l_olfac
 s2_voi_l_olfac=d2_voi_l_olfac
 voi_l_olfac_folder=sprintf('DCM_analysis/spm_files/sub_%s',subj) %individual SPM folder 
 s1_voi_l_olfac_path=fullfile(voi_l_olfac_folder,'l_olfac_disgust_run1.mat')
 s2_voi_l_olfac_path=fullfile(voi_l_olfac_folder,'l_oflac_disgust_run2.mat')
 subjvoi_l_olfac_{1}=s1_voi_l_olfac_path
 subjvoi_l_olfac_{2}=s2_voi_l_olfac_path

 voi_l_olfac=subjvoi_l_olfac{1}
 temp_voi_l_olfac=load(voi_l_olfac)
 xY=temp_voi_l_olfac.xY
 Y=temp_voi_l_olfac.Y
 for v = 2:numel(subjvoi_l_olfac)
            src   = load(subjvoi_l_olfac{v});
            Y     = [Y; src.Y ];
            xY.X0 = [xY.X0; src.xY.X0 ];
            xY.u  = [xY.u; src.xY.u ];            
 end

 filename_l_olfac=sprintf('VOI_l_olfac_disgust_sub_%s.mat',subj)
 save_file=fullfile(folder_path,filename_l_olfac)
 save(save_file,'xY','Y')
 clear xY Y
  
% cancatenate VOI r olfac for disgust run1 and run2

 d1_voi_r_olfac=load('r_olfac_disgust_run1.mat')
 clear xY Y
 d2_voi_r_olfac=load('r_olfac_disgust_run2.mat')
 clear xY Y
 s1_voi_r_olfac=p1_voi_r_olfac
 s2_voi_r_olfac=p2_voi_r_olfac
 voi_r_olfac_folder=sprintf('DCM_analysis/spm_files/sub_%s',subj) %individual SPM folder 
 s1_voi_r_olfac_path=fullfile(voi_r_olfac_folder,'r_olfac_disgust_run1.mat')
 s2_voi_r_olfac_path=fullfile(voi_r_olfac_folder,'r_olfac_disgust_run1.mat')
 subjvoi_r_olfac{1}=s1_voi_r_olfac_path
 subjvoi_r_olfac{2}=s2_voi_r_olfac_path
 voi_r_olfac=subjvoi_r_olfac{1}
 temp_voi_r_olfac=load(voi_r_olfac)
 xY=temp_voi_r_olfac.xY
 Y=temp_voi_r_olfac.Y
 for v = 2:numel(subjvoi_r_olfac)
            src   = load(subjvoi_r_olfac{v});
            Y     = [Y; src.Y ];
            xY.X0 = [xY.X0; src.xY.X0 ];
            xY.u  = [xY.u; src.xY.u ];            
 end

 filename_r_olfac=sprintf('VOI_r_olfac_disgust_sub_%s.mat.mat',subj)
 save_file=fullfile(folder_path,filename_r_olfac)
 save(save_file,'xY','Y')
 clear xY Y
    
end

 
