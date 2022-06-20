clear all, close all, clc
clear batch matlabbatch


raw_data_path='DCM_analysis/raw_data' % individual neuroimaging data; can be downloaded from: https://zenodo.org/record/6663071#.Yq-0sOjMKUk 
source_path='DCM_analysis/preproc_data_disgust'   %%% path directs to indivial preprocessed files (by runs)
output_path= 'DCM_analysis/DCM_model_specification' % saving individual spm file of DCM model specification
logfile_path='DCM_analysis/log_files'  %behavioral log files containing timing, condition and ratings
rp_dir='/home/zhaoy90/mnt/p/userdata/zhaoy90/ZHAO_Yili/EIAS_fmri/scrubbing/rp_files' % path; realignUnwarp nii files
mask_dir='/home/zhaoy90/mnt/p/userdata/zhaoy90/ZHAO_Yili_scanix_new/spm12/toolbox/FieldMap/brainmask.nii'

sublist={'01','02','03','04','05','06','07','08','09','10','11','12',...
'13','14','15','16','17','19','20','22','23','25','26','27',...
'28','29','30','31','32','33','34','35','36','37','38','39',...
'40','41','42','43','44','45','46','47','48'};


TR=1200; %ms

for sub= 1: length(sublist)
   
      subj = char(sublist(sub))


%%%%%%%%%%%%%%% disgust run1 %%%%%%%%%%%%% 
%get the number of scans/frames 
%%%note that, here we calculated the number of raw IMA file for each run, while the downloaded raw data was saved as nii.gz files 
raw_path=fullfile(raw_data_path,'Run1_FOV')
sessnum_1=dir([raw_path '/*.IMA']) 
scan1_number=size(sessnum_1,1)
%%%

preproc_subfolder=sprintf('run_id_1_subject_id_%s',subj)
allfiledir=fullfile(source_path,preproc_subfolder)

for i=1:scan1_number
   scanname=sprintf('swuasub-%s_run_1_bold.nii,%d',subj,i);
   scanlist1{i,1}= fullfile(allfiledir, scanname);   
   
end

clear R;
 
%%%%%%%%%%%%%%% disgust run2 %%%%%%%%%%%%% 
%get the number of scans/frames 
%%%note that, here we calculated the number of raw IMA file for each run, while the downloaded raw data was saved as nii.gz files 
raw_path=fullfile(raw_data_path,'Run2_FOV')
sessnum_2=dir([raw_path '/*.IMA'])
scan2_number=size(sessnum_2,1)
%%%
preproc_subfolder=sprintf('run_id_2_subject_id_%s',subj)
allfiledir=fullfile(source_path,preproc_subfolder)

for i=1:scan2_number
    
   scanname=sprintf('swuasub-%s_run_2_bold.nii,%d',subj,scan1_number+i);
   
   scanlist2{i,1}= fullfile(allfiledir,scanname);
      
end  

clear R;
 
scanlist_D1=scanlist1;
scannumber_D1=scan1_number;
scanlist_D2=scanlist2;
scannumber_D2=scan2_number;
 

%% concatenate scans by run
scanlist_all_order_disgust=[scanlist_D1;scanlist_D2]

clear scanlist1 scanlist2 scanlist3 scanlist4

output_dir=fullfile(output_path,sprintf('sub_%s',subj))

spm_jobman('initcfg');  

% disgust_run_1_logfile 
disgustsess_dir=fullfile(logfile_path,sprintf('Subject_0%s',subj),'Disgust')
cd(disgustsess_dir)
disgustsess_1_file= dir([disgustsess_dir,'/','*D1*.mat']); 
disgustsess_1_name=char(disgustsess_1_file.name)
load(disgustsess_1_name)

vid_ontime_1=results.disgustsess.vid_ontime/1000;
vid_offtime_1=results.disgustsess.vid_offtime/1000;
vid_condition_1=results.disgustsess.vid_condition;

%disgust_run_2_logfile
disgustsess_2_file= dir([disgustsess_dir,'/','*D2*.mat']);
disgustsess_2_name=char(disgustsess_2_file.name)
load(disgustsess_2_name)

vid_ontime_2=(results.disgustsess.vid_ontime+scannumber_D1*TR)/1000;
vid_offtime_2=(results.disgustsess.vid_offtime+scannumber_D1*TR)/1000;
vid_condition_2=results.disgustsess.vid_condition;

%cancatenate timing and conditions of disgust run1 and runs 
vid_ontime_disgust=[vid_ontime_1,vid_ontime_2]
vid_offtime_disgust=[vid_offtime_1,vid_offtime_2]
vid_condition_disgust=[vid_condition_1,vid_condition_2]

%% run model specifications with concatanated runs
matlabbatch{1}.spm.stats.fmri_spec.dir = {output_dir};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 1.2;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 52;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 26;
matlabbatch{1}.spm.stats.fmri_spec.sess.scans = scanlist_all_order_disgust;

matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).name = 'disgust_ex_main_effect';
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).onset = vid_ontime_disgust(mod(vid_condition_disgust,2)==1);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).duration = vid_offtime_disgust(mod(vid_condition_disgust,2)==1)-vid_ontime_disgust(mod(vid_condition_disgust,2)==1);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).orth = 1;

matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).name = 'disgust_genuine_ex';
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).onset = vid_ontime_disgust(vid_condition_disgust==1);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).duration = vid_offtime_disgust(vid_condition_disgust==1)-vid_ontime_disgust(vid_condition_disgust==1);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).orth = 1;

matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).name = 'disgust_pretended_ex';
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).onset = vid_ontime_disgust(vid_condition_disgust==3);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).duration = vid_offtime_disgust(vid_condition_disgust==3)-vid_ontime_disgust(vid_condition_disgust==3);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).orth = 1;

matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = -Inf;
matlabbatch{1}.spm.stats.fmri_spec.mask = {mask_dir};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';

spm_jobman('run',matlabbatch)


end 


