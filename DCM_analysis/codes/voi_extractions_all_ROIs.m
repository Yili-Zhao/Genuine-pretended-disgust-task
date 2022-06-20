clearvars;
close all;
clc;
clear batch matlabbatch

basedir='DCM_analysis/codes'
source_path='DCM_analysis/spm_files' %folder saving individual spm file (e.g. sub_01); raw neuroimaging data are deposited at https://doi.org/10.5281/zenodo.5604521  
sublist={'01','02','03','04','05','06','07','08','09','10','11','12',...
'13','14','15','16','17','19','20','22','23','25','26','27',...
'28','29','30','31','32','33','34','35','36','37','38','39',...
'40','41','42','43','44','45','46','47','48'};


% extracting individual voi in ROI aIns from run3 (disgust run1) 
mask_path='DCM_analysis/masks/raIns_mask.nii'

for sub=1:length(sublist)
subj = char(sublist(sub))    
mask_image=strcat(mask_path, ',1')
spmmat_name=fullfile(source_path,sprintf('sub_%s',subj),'SPM.mat') % enter each individual spm file 
spm('defaults', 'FMRI');
spm_jobman('initcfg');
matlabbatch{1}.spm.util.voi.spmmat = {spmmat_name};
matlabbatch{1}.spm.util.voi.adjust = 69;  % the index of EOI contrast of disgust run1 from the first-level contrast list
matlabbatch{1}.spm.util.voi.session = 3; %disgust runs were specified as session3 and session4 (pain runs were session1 and 2) in model specification
matlabbatch{1}.spm.util.voi.name = 'raIns_disgust_run1';
matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};
matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 73; % the index of the main effect of genuine disgust and pretended disgust (without neutral) in disgust run1
matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05; 
matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});
matlabbatch{1}.spm.util.voi.roi{2}.mask.image = {mask_image};
matlabbatch{1}.spm.util.voi.roi{2}.mask.threshold = 0.5;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 6;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2'; % searching within the mask
matlabbatch{1}.spm.util.voi.expression = 'i1 & i3'; %thresholded p<0.05 and within 6 mm sphere (the peak was the global maximum within the mask)
 
disp(['RUNNING extracting VOI for subject ' sublist{sub}])
spm_jobman('run',matlabbatch);

batch{sub}=matlabbatch 
end

clear matlabbatch sub subj

%extracting individual voi in ROI aIns from run4 (disgust run2)
for sub=1:length(sublist)
subj = char(sublist(sub))    
mask_image=strcat(mask_path, ',1')
spmmat_name=fullfile(source_path,sprintf('sub_%s',subj),'SPM.mat')
spm('defaults', 'FMRI');
spm_jobman('initcfg');
matlabbatch{1}.spm.util.voi.spmmat = {spmmat_name};
matlabbatch{1}.spm.util.voi.adjust = 70; % the index of EOI contrast of disgust run2 from the first-level contrast list
matlabbatch{1}.spm.util.voi.session = 4; %session 4
matlabbatch{1}.spm.util.voi.name = 'raIns_disgust_run2';
matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};
matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 74; % the index of the main effect of genuine disgust and pretended disgust (without neutral) in disgust run2
matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05; 
matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});
matlabbatch{1}.spm.util.voi.roi{2}.mask.image = {mask_image};
matlabbatch{1}.spm.util.voi.roi{2}.mask.threshold = 0.5;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 6;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2'; 
matlabbatch{1}.spm.util.voi.expression = 'i1 & i3'; 
 
disp(['RUNNING extracting VOI for subject ' sublist{sub}])
 spm_jobman('run',matlabbatch);

batch{sub}=matlabbatch 
end


clear matlabbatch sub subj mask_path
% extracting individual voi in ROI rSMG from run3 (disgust run1)
mask_path='DCM_analysis/masks/rSMG_mask.nii'


for sub=1:length(sublist)
subj = char(sublist(sub))    
mask_image=strcat(mask_path, ',1')
spmmat_name=fullfile(source_path,sprintf('sub_%s',subj),'SPM.mat') 
spm('defaults', 'FMRI');
spm_jobman('initcfg');
matlabbatch{1}.spm.util.voi.spmmat = {spmmat_name};
matlabbatch{1}.spm.util.voi.adjust = 69;  
matlabbatch{1}.spm.util.voi.session = 3; 
matlabbatch{1}.spm.util.voi.name = 'rSMG_disgust_run1';
matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};
matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 73; 
matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05; 
matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});
matlabbatch{1}.spm.util.voi.roi{2}.mask.image = {mask_image};
matlabbatch{1}.spm.util.voi.roi{2}.mask.threshold = 0.5;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 6;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2'; 
matlabbatch{1}.spm.util.voi.expression = 'i1 & i3'; 
 
disp(['RUNNING extracting VOI for subject ' sublist{sub}])
spm_jobman('run',matlabbatch);

batch{sub}=matlabbatch 
end

clear matlabbatch sub subj

%extracting individual voi in ROI rSMG from run4 (disgust run2)
for sub=1:length(sublist)
subj = char(sublist(sub))    
mask_image=strcat(mask_path, ',1')
spmmat_name=fullfile(source_path,sprintf('sub_%s',subj),'SPM.mat')
spm('defaults', 'FMRI');
spm_jobman('initcfg');
matlabbatch{1}.spm.util.voi.spmmat = {spmmat_name};
matlabbatch{1}.spm.util.voi.adjust = 70;  
matlabbatch{1}.spm.util.voi.session = 4; 
matlabbatch{1}.spm.util.voi.name = 'rSMG_disgust_run2';
matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};
matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 74; % the index of the main effect of genuine disgust and pretended disgust (without neutral) in disgust run2
matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05; 
matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});
matlabbatch{1}.spm.util.voi.roi{2}.mask.image = {mask_image};
matlabbatch{1}.spm.util.voi.roi{2}.mask.threshold = 0.5;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 6;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2'; 
matlabbatch{1}.spm.util.voi.expression = 'i1 & i3'; 
 
disp(['RUNNING extracting VOI for subject ' sublist{sub}])
 spm_jobman('run',matlabbatch);

batch{sub}=matlabbatch 
end

clear matlabbatch sub subj mask_path
% extracting individual voi in ROI the left olfactoray cortex from run3 (disgust run1)
mask_path='DCM_analysis/masks/l_olfac_mask.nii'


for sub=1:length(sublist)
subj = char(sublist(sub))    
mask_image=strcat(mask_path, ',1')
spmmat_name=fullfile(source_path,sprintf('sub_%s',subj),'SPM.mat') 
spm('defaults', 'FMRI');
spm_jobman('initcfg');
matlabbatch{1}.spm.util.voi.spmmat = {spmmat_name};
matlabbatch{1}.spm.util.voi.adjust = 69;  
matlabbatch{1}.spm.util.voi.session = 3; 
matlabbatch{1}.spm.util.voi.name = 'l_olfac_disgust_run1';
matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};
matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 73; 
matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05; 
matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});
matlabbatch{1}.spm.util.voi.roi{2}.mask.image = {mask_image};
matlabbatch{1}.spm.util.voi.roi{2}.mask.threshold = 0.5;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 6;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2'; 
matlabbatch{1}.spm.util.voi.expression = 'i1 & i3'; 
 
disp(['RUNNING extracting VOI for subject ' sublist{sub}])
spm_jobman('run',matlabbatch);

batch{sub}=matlabbatch 
end

clear matlabbatch sub subj

%extracting individual voi in ROI the left olfactory cortex from run4 (disgust run2)
for sub=1:length(sublist)
subj = char(sublist(sub))    
mask_image=strcat(mask_path, ',1')
spmmat_name=fullfile(source_path,sprintf('sub_%s',subj),'SPM.mat')
spm('defaults', 'FMRI');
spm_jobman('initcfg');
matlabbatch{1}.spm.util.voi.spmmat = {spmmat_name};
matlabbatch{1}.spm.util.voi.adjust = 70;  
matlabbatch{1}.spm.util.voi.session = 4; 
matlabbatch{1}.spm.util.voi.name = 'l_olfac_disgust_run2';
matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};
matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 74; % the index of the main effect of genuine disgust and pretended disgust (without neutral) in disgust run2
matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05; 
matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});
matlabbatch{1}.spm.util.voi.roi{2}.mask.image = {mask_image};
matlabbatch{1}.spm.util.voi.roi{2}.mask.threshold = 0.5;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 6;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2'; 
matlabbatch{1}.spm.util.voi.expression = 'i1 & i3'; 
 
disp(['RUNNING extracting VOI for subject ' sublist{sub}])
 spm_jobman('run',matlabbatch);

batch{sub}=matlabbatch 
end

clear matlabbatch sub subj mask_path
% extracting individual voi in ROI the right olfactoray cortex from run3 (disgust run1)
mask_path='DCM_analysis/masks/r_olfac_mask.nii'


for sub=1:length(sublist)
subj = char(sublist(sub))    
mask_image=strcat(mask_path, ',1')
spmmat_name=fullfile(source_path,sprintf('sub_%s',subj),'SPM.mat') 
spm('defaults', 'FMRI');
spm_jobman('initcfg');
matlabbatch{1}.spm.util.voi.spmmat = {spmmat_name};
matlabbatch{1}.spm.util.voi.adjust = 69;  
matlabbatch{1}.spm.util.voi.session = 3; 
matlabbatch{1}.spm.util.voi.name = 'r_olfac_disgust_run1';
matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};
matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 73; 
matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05; 
matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});
matlabbatch{1}.spm.util.voi.roi{2}.mask.image = {mask_image};
matlabbatch{1}.spm.util.voi.roi{2}.mask.threshold = 0.5;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 6;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2'; 
matlabbatch{1}.spm.util.voi.expression = 'i1 & i3'; 
 
disp(['RUNNING extracting VOI for subject ' sublist{sub}])
spm_jobman('run',matlabbatch);

batch{sub}=matlabbatch 
end

clear matlabbatch sub subj

%extracting individual voi in ROI the right olfactory cortex from run4 (disgust run2)
for sub=1:length(sublist)
subj = char(sublist(sub))    
mask_image=strcat(mask_path, ',1')
spmmat_name=fullfile(source_path,sprintf('sub_%s',subj),'SPM.mat')
spm('defaults', 'FMRI');
spm_jobman('initcfg');
matlabbatch{1}.spm.util.voi.spmmat = {spmmat_name};
matlabbatch{1}.spm.util.voi.adjust = 70;  
matlabbatch{1}.spm.util.voi.session = 4; 
matlabbatch{1}.spm.util.voi.name = 'r_olfac_disgust_run2';
matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};
matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 74; % the index of the main effect of genuine disgust and pretended disgust (without neutral) in disgust run2
matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05; 
matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});
matlabbatch{1}.spm.util.voi.roi{2}.mask.image = {mask_image};
matlabbatch{1}.spm.util.voi.roi{2}.mask.threshold = 0.5;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 6;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2'; 
matlabbatch{1}.spm.util.voi.expression = 'i1 & i3'; 
 
disp(['RUNNING extracting VOI for subject ' sublist{sub}])
 spm_jobman('run',matlabbatch);

batch{sub}=matlabbatch 
end
