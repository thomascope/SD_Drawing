function SD_Warp_Atlas_job(dartel_flow,atlas_image)
% TEC modification from warp_ICBM_atlas_to_template.m
% Warp an image in ICBM sppace into DARTEL average image space

spm('defaults','pet');
spm_jobman('initcfg');

bb=[-90 -126 -72
     90 90 108];
vox=[1.5 1.5 1.5]; %[2 2 2];
interp=0;
prefix='w';

%-----------------------------------------------------------------------
% Job saved on 24-Jun-2016 10:06:44 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.spatial.normalise.write.subj.def = dartel_flow;
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = atlas_image;
matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = bb;
matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = vox;
matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = interp;
matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = prefix;

spm_jobman('run',matlabbatch);