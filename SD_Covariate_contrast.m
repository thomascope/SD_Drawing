% List of open inputs
% Contrast Manager: Select SPM.mat - cfg_files
nrun = X; % enter the number of runs here
jobfile = {'/group/language/data/thomascope/SD_Drawing/SD_Covariate_contrast_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(1, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Contrast Manager: Select SPM.mat - cfg_files
end
spm('defaults', 'PET');
spm_jobman('run', jobs, inputs{:});
