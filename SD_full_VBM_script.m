% Ensure correct SPM
spmpath = '/group/language/data/thomascope/spm12_fil_r6906/';
thisspm = which('spm');
if ~strcmp(thisspm(1:end-5), spmpath)
    rmpath(genpath('/imaging/local/software/spm_cbu_svn/releases/spm12_latest/'));
    rmpath(genpath('/group/language/data/thomascope/MMN/ICA_denoise/Tallie_extDCM/spm12_latestTA/'));
    addpath(spmpath)
    spm pet
end


% List of open inputs
% Segment: Volumes - cfg_files

mrilist = {
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0252/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0259/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0260/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0264/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0265/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0266/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0292/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0293/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0295/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0307/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0311/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0330/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0338/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0462/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-19361_ses-20160913/sub-19361_ses-20160913_acq-repmprage_run-02_T1w.nii.gz'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-20968_ses-20160106/sub-20968_ses-20160106_acq-repmprage_run-01_T1w.nii.gz'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25162_ses-20171208/sub-25162_ses-20171208_acq-mpragesag_run-01_T1w.nii.gz'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25162_ses-20180726/sub-25162_ses-20180726_acq-mp2ragesag_out-uni_run-01_MP2RAGE.nii.gz'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25243_ses-20151022/sub-25243_ses-20151022_acq-repmprage_run-01_T1w.nii.gz'
    '/imaging/mlr/users/tc02/SD_drawings/25243/20180525_U-ID40645/Series_020_mp2rage_sag_p3_0.75mm_UNI_Images/DATA_0020.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25548_ses-20181120/sub-25548_ses-20181120_acq-mp2ragesag_out-uni_run-01_MP2RAGE.nii.gz'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25602_ses-20161207/sub-25602_ses-20161207_acq-repmprage_run-01_T1w.nii.gz'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25785_ses-20170413/sub-25785_ses-20170413_acq-repmprage_run-02_T1w.nii.gz'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-26669_ses-20180307/sub-26669_ses-20180307_acq-repmprage_run-02_T1w.nii.gz'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-27212_ses-20180924/sub-27212_ses-20180924_acq-mp2ragesag_out-uni_run-01_MP2RAGE.nii.gz'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-27672_ses-20190719/sub-27672_ses-20190719_acq-mpragesag_run-01_T1w.nii'};

controlmrilist = {
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0252/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0259/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0260/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0264/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0265/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0266/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0292/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0293/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0295/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0307/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0311/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0330/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0338/structural/structural.nii'
    '/imaging/mlr/users/tc02/SD_Wordending/preprocess/meg08_0462/structural/structural.nii'};

SDmrilist = {
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-19361_ses-20160913/sub-19361_ses-20160913_acq-repmprage_run-02_T1w.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-20968_ses-20160106/sub-20968_ses-20160106_acq-repmprage_run-01_T1w.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25162_ses-20171208/sub-25162_ses-20171208_acq-mpragesag_run-01_T1w.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25162_ses-20180726/sub-25162_ses-20180726_acq-mp2ragesag_out-uni_run-01_MP2RAGE.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25243_ses-20151022/sub-25243_ses-20151022_acq-repmprage_run-01_T1w.nii'
    '/imaging/mlr/users/tc02/SD_drawings/25243/20180525_U-ID40645/Series_020_mp2rage_sag_p3_0.75mm_UNI_Images/DATA_0020.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25548_ses-20181120/sub-25548_ses-20181120_acq-mp2ragesag_out-uni_run-01_MP2RAGE.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25602_ses-20161207/sub-25602_ses-20161207_acq-repmprage_run-01_T1w.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-25785_ses-20170413/sub-25785_ses-20170413_acq-repmprage_run-02_T1w.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-26669_ses-20180307/sub-26669_ses-20180307_acq-repmprage_run-02_T1w.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-27212_ses-20180924/sub-27212_ses-20180924_acq-mp2ragesag_out-uni_run-01_MP2RAGE.nii'
    '/imaging/mlr/users/tc02/SD_drawings/from_simon/sub-27672_ses-20190719/sub-27672_ses-20190719_acq-mpragesag_run-01_T1w.nii'};

control_ages = [
    71
    65
    73
    60
    74
    72
    66
    61
    71
    62
    76
    59
    57
    78];

SD_ages = [
    77.27
    72.87
    63.12
    63.75
    65.13
    67.72
    69.35
    64.18
    72.87
    63.73
    65.13
    76.31];

SD_composite = [ % From the number of features
    1, 2.022857143
    2, 1.368421053
    4, 0.798974359
    5, 1.03034188
    6, 0.772222222
    7, 0.276315789
    8, 1.138762933
    9, 1.151713082
    10, 2.041958042
    11, 0.399230769
    ];%12, 1.464888664];


SD_composite_both = [ %Tanmay's familiarity and number of features corrected
    1, 4.80205252
    2, 2.46657337
    4, 1.28510225
    5, 2.3776962
    6, 1.89127754
    7, 0.30034325
    8, 1.84938225
    9, 2.53559139
    10, 4.59332582
    11, 0.75593002];

SD_composite_FAM = [ %Tanmay's familiarity corrected
    1, 2.237153904
    2, 0.960444365
    4, 0.473513495
    5, 1.0899401
    6, 0.990544521
    7, 0.203804348
    8, 0.85262589
    9, 1.279935712
    10, 1.555243547
    11, 0.221006892];

for i = 1:length(mrilist)
    if strcmp(mrilist{i}(end-2:end),'.gz')
        eval(['!gunzip ' mrilist{i}]);
        mrilist{i} = mrilist{i}(1:end-3);
    end
    if exist(mrilist{i})
        disp([mrilist{i} ' exists'])
    else
        error([mrilist{i} ' does not exist'])
    end
end

addpath('/group/language/data/thomascope/SD_Drawing/Masking')

%% First segment all the images

nrun = length(mrilist);
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_segment.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(1, nrun);

for crun = 1:nrun
    inputs{1, crun} = cellstr(mrilist{crun}); % for dartel templating
end

segmentworkedcorrectly = zeros(1,nrun);
jobs = repmat(jobfile, 1, 1);

if isempty(gcp('nocreate'))
    cbupool(nrun)
end

parfor crun = 1:nrun
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
        segmentworkedcorrectly(crun) = 1;
    catch
        segmentworkedcorrectly(crun) = 0;
    end
end

% Now calculate the TIV and then rename all of the mc files as will be
% overwritten by DARTEL (if not smoothed)
nrun = 1;
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_TIV.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);

for crun = 1:nrun
    inputs{1, crun} = cell(length(mrilist),1);
    for i = 1:length(mrilist)
        inputs{1, crun}(i) = cellstr([mrilist{i}(1:end-4) '_seg8.mat']); % for dartel templating
    end
end
mkdir('/imaging/mlr/users/tc02/SD_drawings/preprocess/')
inputs{2,1} = ['/imaging/mlr/users/tc02/SD_drawings/preprocess/volumes_PNFA_VBM.csv'];
tiv_filename = [inputs{2,1} '.csv'];

TIVworkedcorrectly = zeros(1,nrun);
jobs = repmat(jobfile, 1, 1);

parfor crun = 1:nrun %Even though single shot, submit to parfor to avoid overloading login node
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
        TIVworkedcorrectly(crun) = 1;
    catch
        TIVworkedcorrectly(crun) = 0;
    end
end

split_stem = regexp(mrilist, '/', 'split');
old_imagepaths = cell(length(mrilist),3);
new_imagepaths = cell(length(mrilist),3);
for i = 1:length(mrilist)
    for j = 1:3
        old_imagepaths(i,j) = cellstr(['/' fullfile(split_stem{i}{1:end-1}) '/mwc' num2str(j) split_stem{i}{end}]);
        new_imagepaths(i,j) = cellstr(['/' fullfile(split_stem{i}{1:end-1}) '/mwc' num2str(j) '_ns_' split_stem{i}{end}]);
        try
            movefile(char(old_imagepaths(i,j)),char(new_imagepaths(i,j)))
        catch
            assert(~~exist(['/' fullfile(split_stem{i}{1:end-1}) '/mwc' num2str(j) '_ns_' split_stem{i}{end}]), ['Something went wrong with file ' num2str(i)])
        end
    end
end


%% Then make a DARTEL template based on only the core images (8 patients and 8 matched controls) and then
core_imagepaths = [SDmrilist; controlmrilist(1:length(SDmrilist))];

nrun = 1; % enter the number of runs here
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_dartel.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2,1);
inputs{1,1} = cell(length(core_imagepaths),1);
inputs{2,1} = cell(length(core_imagepaths),1);
split_stem = regexp(core_imagepaths, '/', 'split');

for i = 1:length(core_imagepaths)
    inputs{1,1}(i) = cellstr(['/' fullfile(split_stem{i}{1:end-1}) '/rc1' split_stem{i}{end}]);
    inputs{2,1}(i) = cellstr(['/' fullfile(split_stem{i}{1:end-1}) '/rc2' split_stem{i}{end}]);
end

dartelworkedcorrectly = zeros(1,nrun);
jobs = repmat(jobfile, 1, 1);

parfor crun = 1:nrun %Still submit as a parfor to avoid overloading a login node
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
        dartelworkedcorrectly(crun) = 1;
    catch
        dartelworkedcorrectly(crun) = 0;
    end
end

%% Then apply the DARTEL template to the remaining controls

%Find the controls not processed above

[C,ia,ib] = intersect(controlmrilist,controlmrilist(1:length(SDmrilist)),'rows');
total_control_numbers = 1:length(controlmrilist);
indexes_to_process = setdiff(total_control_numbers,ia);
remaining_control_imagepaths = controlmrilist(indexes_to_process);

nrun = 1; % enter the number of runs here
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_templated_dartel.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(8, nrun);
inputs{1,1} = cell(length(remaining_control_imagepaths),1);
inputs{2,1} = cell(length(remaining_control_imagepaths),1);

split_stem = regexp(remaining_control_imagepaths, '/', 'split');

for i = 1:length(remaining_control_imagepaths)
    inputs{1,1}(i) = cellstr(['/' fullfile(split_stem{i}{1:end-1}) '/rc1' split_stem{i}{end}]);
    inputs{2,1}(i) = cellstr(['/' fullfile(split_stem{i}{1:end-1}) '/rc2' split_stem{i}{end}]);
end

split_stem = regexp(core_imagepaths, '/', 'split');
inputs{3,1} = cellstr(['/' fullfile(split_stem{1}{1:end-1}) '/Template_1.nii']);
inputs{4,1} = cellstr(['/' fullfile(split_stem{1}{1:end-1}) '/Template_2.nii']);
inputs{5,1} = cellstr(['/' fullfile(split_stem{1}{1:end-1}) '/Template_3.nii']);
inputs{6,1} = cellstr(['/' fullfile(split_stem{1}{1:end-1}) '/Template_4.nii']);
inputs{7,1} = cellstr(['/' fullfile(split_stem{1}{1:end-1}) '/Template_5.nii']);
inputs{8,1} = cellstr(['/' fullfile(split_stem{1}{1:end-1}) '/Template_6.nii']);

path_to_template_6 = cellstr(['/' fullfile(split_stem{1}{1:end-1}) '/Template_6.nii']);

templateddartelworkedcorrectly = zeros(1,nrun);
jobs = repmat(jobfile, 1, 1);

parfor crun = 1:nrun %Still submit as a parfor to avoid overloading a login node
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
        templateddartelworkedcorrectly(crun) = 1;
    catch
        templateddartelworkedcorrectly(crun) = 0;
    end
end

%% Now normalise all scans

nrun = length(mrilist);
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_normalise.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(3, nrun);

split_stem = regexp(mrilist, '/', 'split');
split_stem_template = regexp(core_imagepaths, '/', 'split');
path_to_template_6 = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/Template_6.nii']);

for crun = 1:nrun
    inputs{1, crun} = path_to_template_6; % Normalise to MNI Space: Dartel Template - cfg_files
    inputs{2, crun} = cellstr(['/' fullfile(split_stem{crun}{1:end-1}) '/u_rc1' split_stem{crun}{end}(1:end-4) '_Template.nii']);
    if ~exist(char(inputs{2,crun}),'file')
        inputs{2, crun} = cellstr(['/' fullfile(split_stem{crun}{1:end-1}) '/u_rc1' split_stem{crun}{end}]); %Deal with the difference in naming convention depending if part of the dartel templating or not
    end
    inputs{3, crun} = cellstr(['/' fullfile(split_stem{crun}{1:end-1}) '/c1' split_stem{crun}{end}]);
end

normaliseworkedcorrectly = zeros(1,nrun);
jobs = repmat(jobfile, 1, 1);

parfor crun = 1:nrun
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
        normaliseworkedcorrectly(crun) = 1;
    catch
        normaliseworkedcorrectly(crun) = 0;
    end
end

% %% Now do stats based on grey matter volume normalisation NB: SUBOPTIMAL due to significant loss of grey matter in patient group - better to normalise on TIVs as below.
% %split_stem_controls = regexp(controlmrilist, '/structural/', 'split');
% % Problem with normalisation for larger group: Temporary fix:
% nrun = 1;
% jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_factorial.m'};
% jobs = repmat(jobfile, 1, nrun);
% inputs = cell(3, nrun);
%
% stats_folder = {'/imaging/mlr/users/tc02/SD_drawings/preprocess/VBM_stats/factorial_full_group_vbm_greynormalised'};
% split_stem_controls = regexp(controlmrilist, '/structural/', 'split');
% split_stem_SD = regexp(SDmrilist, '/structural/', 'split');
%
% inputs{1, 1} = stats_folder;
%
% for crun = 1:nrun
%     inputs{2, 1} = cell(length(SDmrilist),1);
%     for i = 1:length(SDmrilist)
%         inputs{2,crun}(i) = cellstr([split_stem_SD{i}{1} '/structural/smwc1' split_stem_SD{i}{2}]);
%     end
%     inputs{3, 1} = cell(length(controlmrilist),1);
%     for i = 1:length(controlmrilist)
%         inputs{3,crun}(i) = cellstr([split_stem_controls{i}{1} '/structural/smwc1' split_stem_controls{i}{2}]);
%     end
% end

% spm_jobman('run', jobs, inputs{:});
%
% inputs = cell(1, nrun);
% inputs{1, 1} =  {[char(stats_folder) '/SPM.mat']};
%
% jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_estimate.m'};
% jobs = repmat(jobfile, 1, nrun);
%
% spm_jobman('run', jobs, inputs{:});
%
% jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_contrast.m'};
% jobs = repmat(jobfile, 1, nrun);
%
% spm_jobman('run', jobs, inputs{:});
%
% jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_results.m'};
% jobs = repmat(jobfile, 1, nrun);
%
% spm_jobman('run', jobs, inputs{:});

%% Now read in TIV file
if exist('tiv_filename','var')
    filename =tiv_filename;
else
    filename = ['/imaging/mlr/users/tc02/SD_drawings/preprocess/volumes_PNFA_VBM.csv'];
end
delimiter = ',';
startRow = 2;
endRow = inf;
formatSpec = '%s%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
fclose(fileID);
tiv= dataArray{2}+dataArray{3}+dataArray{4};

%% Now do group stats with TIV and age file as covariates in the ANOVA
nrun = 1;
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_factorial_TIV_age.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(6, nrun);

stats_folder = {'/imaging/mlr/users/tc02/SD_drawings/preprocess/VBM_stats/factorial_full_group_vbm_TIVnormalised_agecovaried_unsmoothedmask'};
split_stem_controls = regexp(controlmrilist, '/', 'split');
split_stem_SD = regexp(SDmrilist, '/', 'split');

inputs{1, 1} = stats_folder;

for crun = 1:nrun
    inputs{2, 1} = cell(length(SDmrilist),1);
    for i = 1:length(SDmrilist)
        inputs{2,crun}(i) = cellstr(['/' fullfile(split_stem_SD{i}{1:end-1}) '/smwc1' split_stem_SD{i}{end}]);
    end
    inputs{3, 1} = cell(length(controlmrilist),1);
    for i = 1:length(controlmrilist)
        inputs{3,crun}(i) = cellstr(['/' fullfile(split_stem_controls{i}{1:end-1}) '/smwc1' split_stem_controls{i}{end}]);
    end
end

try
    inputs{4, 1} = tiv;
catch
    tivstem = ['/imaging/mlr/users/tc02/SD_drawings/preprocess/volumes_PNFA_VBM'];
    filename = [tivstem '.csv'];
    delimiter = ',';
    startRow = 2;
    endRow = inf;
    formatSpec = '%s%f%f%f%[^\n\r]';
    fileID = fopen(filename,'r');
    dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
    fclose(fileID);
    tiv= dataArray{2}+dataArray{3}+dataArray{4};
    inputs{4, 1} = tiv;
end
inputs{5, 1} = [SD_ages; control_ages];
inputs{6, 1} = {'control_majority_unsmoothed_mask_c1_thr0.05_cons0.8.img'};

if ~exist(char(inputs{6, 1}),'file')
    core_imagepaths = [SDmrilist; controlmrilist(1:length(SDmrilist))];
    split_stem_template = regexp(core_imagepaths, '/', 'split');
    path_to_template_6 = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/Template_6.nii']);
    make_VBM_explicit_mask(controlmrilist, path_to_template_6, 'control')
end

spm_jobman('run', jobs, inputs{:});

inputs = cell(1, nrun);
inputs{1, 1} =  {[char(stats_folder) '/SPM.mat']};

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_estimate.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_contrast.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_results.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});

%% Now do stats in just the SD group with TIV, age and composite score as covariates
nrun = 1;
jobfile = {'/group/language/data/thomascope/SD_Drawing/SD_Covariate_SPM_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(6, nrun);

stats_folder = {'/imaging/mlr/users/tc02/SD_drawings/preprocess/VBM_stats/Drawing_Covariate_Familiarity'};
split_stem_controls = regexp(controlmrilist, '/', 'split');
split_stem_SD = regexp(SDmrilist, '/', 'split');

inputs{1, 1} = stats_folder;

for crun = 1:nrun
    inputs{2, crun} = cell(length(SDmrilist),1);
    for i = 1:length(SDmrilist)
        inputs{2,crun}(i) = cellstr(['/' fullfile(split_stem_SD{i}{1:end-1}) '/smwc1' split_stem_SD{i}{end}]);
    end
    
end

try
    inputs{3, 1} = tiv(1:length(SDmrilist));
catch
    tivstem = ['/imaging/mlr/users/tc02/SD_drawings/preprocess/volumes_PNFA_VBM'];
    filename = [tivstem '.csv'];
    delimiter = ',';
    startRow = 2;
    endRow = inf;
    formatSpec = '%s%f%f%f%[^\n\r]';
    fileID = fopen(filename,'r');
    dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
    fclose(fileID);
    tiv= dataArray{2}+dataArray{3}+dataArray{4};
    inputs{3, 1} = tiv(1:length(SDmrilist));
end
inputs{4, 1} = [SD_ages];

for crun = 1:nrun
    omit_these = [];
    for i = 1:length(SDmrilist)
        this_cov_row = find(SD_composite(:,1)==i);
        if isempty(this_cov_row)
            warning(['No covariate for scan number ' num2str(i) ', omitting it'])
            omit_these = [omit_these, i];
            inputs{5,crun}(i,1) = NaN;
        elseif length(this_cov_row)==1
            inputs{5,crun}(i,1) = SD_composite(this_cov_row,2);
        else
            error(['More than one covariate for scan number ' num2str(i) ', check your inputs'])
        end
    end
    inputs{2, crun}(omit_these) = [];
    inputs{3, crun}(omit_these) = [];
    inputs{4, crun}(omit_these) = [];
    inputs{5, crun}(omit_these) = [];
end

inputs{6, 1} = {'control_majority_unsmoothed_mask_c1_thr0.05_cons0.8.img'};

if ~exist(char(inputs{6, 1}),'file')
    core_imagepaths = [SDmrilist; controlmrilist(1:length(SDmrilist))];
    split_stem_template = regexp(core_imagepaths, '/', 'split');
    path_to_template_6 = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/Template_6.nii']);
    make_VBM_explicit_mask(controlmrilist, path_to_template_6, 'control')
end

spm_jobman('run', jobs, inputs{:});

inputs = cell(1, nrun);
inputs{1, 1} =  {[char(stats_folder) '/SPM.mat']};

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_estimate.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});

jobfile = {'/group/language/data/thomascope/SD_Drawing/SD_Covariate_contrast_job.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_results.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});

%% Now do group stats against just the subjects in the dartel with TIV file and age as covariates in the ANOVA
nrun = 1;
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_factorial_TIV_age.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(6, nrun);

stats_folder = {'/imaging/mlr/users/tc02/SD_drawings/preprocess/VBM_stats/factorial_matched_group_vbm_TIVnormalised_agecovaried_unsmoothedmask'};
split_stem_controls = regexp(controlmrilist(1:length(SDmrilist)), '/', 'split');
split_stem_SD = regexp(SDmrilist, '/', 'split');

[C,ia,ib] = intersect(controlmrilist,controlmrilist(1:length(SDmrilist)),'rows');

inputs{1, 1} = stats_folder;

for crun = 1:nrun
    inputs{2, 1} = cell(length(SDmrilist),1);
    for i = 1:length(SDmrilist)
        inputs{2,crun}(i) = cellstr(['/' fullfile(split_stem_SD{i}{1:end-1}) '/smwc1' split_stem_SD{i}{end}]);
    end
    inputs{3, 1} = cell(length(controlmrilist),1);
    for i = 1:length(controlmrilist)
        inputs{3,crun}(i) = cellstr(['/' fullfile(split_stem_controls{i}{1:end-1}) '/smwc1' split_stem_controls{i}{end}]);
    end
end

try
    inputs{4, 1} = [tiv(1:length(SDmrilist)); tiv(ia)];
catch
    tivstem = ['/imaging/mlr/users/tc02/SD_drawings/preprocess/volumes_PNFA_VBM'];
    filename = [tivstem '.csv'];
    delimiter = ',';
    startRow = 2;
    endRow = inf;
    formatSpec = '%s%f%f%f%[^\n\r]';
    fileID = fopen(filename,'r');
    dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
    fclose(fileID);
    tiv= dataArray{2}+dataArray{3}+dataArray{4};
    inputs{4, 1} = [tiv(1:length(SDmrilist)); tiv(ia)];
end
load('VBM_ages.mat')
inputs{5, 1} = [SD_ages; controlages(ia)];
inputs{6, 1} = {'matched_control_majority_unsmoothed_mask_c1_thr0.05_cons0.8.img'};

if ~exist(char(inputs{6, 1}),'file')
    core_imagepaths = [SDmrilist; controlmrilist(1:length(SDmrilist))];
    split_stem_template = regexp(core_imagepaths, '/', 'split');
    path_to_template_6 = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/Template_6.nii']);
    make_VBM_explicit_mask(controlmrilist(1:length(SDmrilist)), path_to_template_6, 'matched_control')
end

spm_jobman('run', jobs, inputs{:});

inputs = cell(1, nrun);
inputs{1, 1} =  {[char(stats_folder) '/SPM.mat']};

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_estimate.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_contrast.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_results.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});


%% Now do single subject stats with TIV file and age covariates in the ANOVA
nrun = length(SDmrilist);
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_factorial_TIV_age_singlesubj.m'};
jobs = repmat(jobfile, 1, 1);
inputs = cell(6, nrun);

split_stem_controls = regexp(controlmrilist, '/', 'split');
split_stem_SD = regexp(SDmrilist, '/', 'split');

for crun = 1:nrun
    inputs{1, crun} = {['/imaging/mlr/users/tc02/SD_drawings/preprocess/VBM_stats/factorial_single_subject/patient_' num2str(crun)]};
    inputs{2, crun} = cellstr(['/' fullfile(split_stem_SD{crun}{1:end-1}) '/smwc1' split_stem_SD{crun}{end}]);
    inputs{3, crun} = cell(length(controlmrilist),1);
    for i = 1:length(controlmrilist)
        inputs{3,crun}(i) = cellstr(['/' fullfile(split_stem_controls{i}{1:end-1}) '/smwc1' split_stem_controls{i}{end}]);
    end
    try
        inputs{4, crun} = [tiv(crun); tiv(nrun+1:end)];
    catch
        tivstem = ['/imaging/mlr/users/tc02/SD_drawings/preprocess/volumes_PNFA_VBM'];
        filename = [tivstem '.csv'];
        delimiter = ',';
        startRow = 2;
        endRow = inf;
        formatSpec = '%s%f%f%f%[^\n\r]';
        fileID = fopen(filename,'r');
        dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
        fclose(fileID);
        tiv= dataArray{2}+dataArray{3}+dataArray{4};
        inputs{4, crun} = [tiv(crun); tiv(nrun+1:end)];
    end
    inputs{5, crun} = [SD_ages(crun); control_ages];
    inputs{6, crun} =  {'control_majority_smoothed_mask_c1_thr0.1_cons0.8.img'};
end

if ~exist(char(inputs{6, 1}),'file')
    core_imagepaths = [SDmrilist; controlmrilist(1:length(SDmrilist))];
    split_stem_template = regexp(core_imagepaths, '/', 'split');
    path_to_template_6 = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/Template_6.nii']);
    make_VBM_explicit_mask(controlmrilist, path_to_template_6, 'control')
end

parfor crun = 1:nrun
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
    catch
    end
end

inputs = inputs(1,:);
for i = 1:nrun
    inputs{1,i} = {[char(inputs{1,i}) '/SPM.mat']};
end

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_estimate.m'};
jobs = repmat(jobfile, 1, 1);

parfor crun = 1:nrun
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
    catch
    end
end

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_contrast.m'};
jobs = repmat(jobfile, 1, 1);

parfor crun = 1:nrun
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
    catch
    end
end

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_results.m'};
jobs = repmat(jobfile, 1, 1);

parfor crun = 1:nrun
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
    catch
    end
end

%% Repeat single subject stats against just the controls in the dartel with TIV file and age covariates in the ANOVA
nrun = length(SDmrilist);
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_factorial_TIV_age_singlesubj.m'};
jobs = repmat(jobfile, 1, 1);
inputs = cell(6, nrun);

[C,ia,ib] = intersect(controlmrilist,controlmrilist(1:length(SDmrilist)),'rows');

split_stem_controls = regexp(controlmrilist(1:length(SDmrilist)), '/', 'split');
split_stem_SD = regexp(SDmrilist, '/', 'split');

for crun = 1:nrun
    inputs{1, crun} = {['/imaging/mlr/users/tc02/SD_drawings/preprocess/VBM_stats/factorial_single_subject_against_matched_controls/' split_stem_SD{crun}{end}(1:end-4)]};
    inputs{2, crun} = cellstr(['/' fullfile(split_stem_SD{crun}{1:end-1}) '/smwc1' split_stem_SD{crun}{end}]);
    inputs{3, crun} = cell(length(controlmrilist(1:length(SDmrilist))),1);
    for i = 1:length(controlmrilist(1:length(SDmrilist)))
        inputs{3,crun}(i) = cellstr(['/' fullfile(split_stem_controls{i}{1:end-1}) '/smwc1' split_stem_controls{i}{end}]);
    end
    try
        inputs{4, crun} = [tiv(crun); tiv(ia)];
    catch
        tivstem = ['/imaging/mlr/users/tc02/SD_drawings/preprocess/volumes_PNFA_VBM.csv'];
        filename = [tivstem '.csv'];
        delimiter = ',';
        startRow = 2;
        endRow = inf;
        formatSpec = '%s%f%f%f%[^\n\r]';
        fileID = fopen(filename,'r');
        dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
        fclose(fileID);
        tiv= dataArray{2}+dataArray{3}+dataArray{4};
        inputs{4, crun} = [tiv(crun); tiv(nrun+1:end)];
    end
    inputs{5, crun} = [SD_ages(crun); controlages(ia)];
    inputs{6, crun} =  {'matched_control_majority_smoothed_mask_c1_thr0.1_cons0.8.img'};
end

if ~exist(char(inputs{6, 1}),'file')
    core_imagepaths = [SDmrilist; controlmrilist(1:length(SDmrilist))];
    split_stem_template = regexp(core_imagepaths, '/', 'split');
    path_to_template_6 = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/Template_6.nii']);
    make_VBM_explicit_mask(controlmrilist(1:length(SDmrilist)), path_to_template_6, 'matched_control')
end

parfor crun = 1:nrun
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
    catch
    end
end

inputs = inputs(1,:);
for i = 1:nrun
    inputs{1,i} = {[char(inputs{1,i}) '/SPM.mat']};
end


%% View single subjects results cell - does not work as a standalone
for crun = 1:nrun
    spm_jobman('run', jobs, inputs{:,crun});
    
    input('press enter for next spm')
    
end

%% Make average brain by normalising MPRAGES to template and then averaging them

nrun = length(mrilist);
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_normalise_unmodulated_unsmoothed.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(3, nrun);

split_stem = regexp(mrilist, '/', 'split');
split_stem_template = regexp(core_imagepaths, '/', 'split');
path_to_template_6 = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/Template_6.nii']);


for crun = 1:nrun
    inputs{1, crun} = path_to_template_6; % Normalise to MNI Space: Dartel Template - cfg_files
    inputs{2, crun} = cellstr(['/' fullfile(split_stem{crun}{1:end-1}) '/u_rc1' split_stem{crun}{end}(1:end-4) '_Template.nii']);
    if ~exist(char(inputs{2,crun}),'file')
        inputs{2, crun} = cellstr(['/' fullfile(split_stem{crun}{1:end-1}) '/u_rc1' split_stem{crun}{end}]); %Deal with the difference in naming convention depending if part of the dartel templating or not
    end
    inputs{3, crun} = cellstr(['/' fullfile(split_stem{crun}{1:end-1}) '/' split_stem{crun}{end}]);
end

normaliseforaverageworkedcorrectly = zeros(1,nrun);
jobs = repmat(jobfile, 1, 1);

parfor crun = 1:nrun
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
        normaliseforaverageworkedcorrectly(crun) = 1;
    catch
        normaliseforaverageworkedcorrectly(crun) = 0;
    end
end

nrun = 1;
inputs = cell(2, nrun);

split_stem = regexp(core_imagepaths, '/', 'split');
inputs{1,1} = cell(length(core_imagepaths),1);

for i = 1:length(core_imagepaths)
    inputs{1,1}(i) = cellstr(['/' fullfile(split_stem{i}{1:end-1}) '//w' split_stem{i}{end}]);
end

inputs{2,1} = 'average_matchedcontrol_SD_T1head.nii';

flags.dmtx = 1; %Read into data matrix
spm_imcalc(inputs{1,1},inputs{2,1},'mean(X)',flags); %Calculate mean image

split_stem = regexp(core_imagepaths, '/', 'split');
inputs{1,2} = cell(length(core_imagepaths),1);

for i = 1:length(core_imagepaths)
    inputs{1,2}(i) = cellstr(['/' fullfile(split_stem{i}{1:end-1}) '//wc1' split_stem{i}{end}]);
end

inputs{2,2} = 'average_matchedcontrol_SD_grey.nii';

flags.dmtx = 1; %Read into data matrix
spm_imcalc(inputs{1,2},inputs{2,2},'mean(X)',flags); %Calculate mean image

split_stem = regexp(core_imagepaths, '/', 'split');
inputs{1,3} = cell(length(core_imagepaths),1);

for i = 1:length(core_imagepaths)
    inputs{1,3}(i) = cellstr(['/' fullfile(split_stem{i}{1:end-1}) '//wc2' split_stem{i}{end}]);
end

inputs{2,3} = 'average_matchedcontrol_SD_white.nii';

flags.dmtx = 1; %Read into data matrix
spm_imcalc(inputs{1,3},inputs{2,3},'mean(X)',flags); %Calculate mean image

spm_imcalc(char(inputs(2,1:3)'),'average_skullstripped_matchedcontrol_SD.nii','i1.*(i2>0.05|i3>0.05)')



%% Now repeat for white matter

%% Now normalise all white matter scans

nrun = length(mrilist);
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_normalise.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(3, nrun);

split_stem = regexp(mrilist, '/', 'split');
split_stem_template = regexp(core_imagepaths, '/', 'split');
path_to_template_6 = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/Template_6.nii']);

for crun = 1:nrun
    inputs{1, crun} = path_to_template_6; % Normalise to MNI Space: Dartel Template - cfg_files
    inputs{2, crun} = cellstr(['/' fullfile(split_stem{crun}{1:end-1}) '/u_rc1' split_stem{crun}{end}(1:end-4) '_Template.nii']);
    if ~exist(char(inputs{2,crun}),'file')
        inputs{2, crun} = cellstr(['/' fullfile(split_stem{crun}{1:end-1}) '/u_rc1' split_stem{crun}{end}]); %Deal with the difference in naming convention depending if part of the dartel templating or not
    end
    inputs{3, crun} = cellstr(['/' fullfile(split_stem{crun}{1:end-1}) '/c2' split_stem{crun}{end}]);
end

normaliseworkedcorrectly = zeros(1,nrun);
jobs = repmat(jobfile, 1, 1);

parfor crun = 1:nrun
    spm('defaults', 'PET');
    spm_jobman('initcfg')
    try
        spm_jobman('run', jobs, inputs{:,crun});
        normaliseworkedcorrectly(crun) = 1;
    catch
        normaliseworkedcorrectly(crun) = 0;
    end
end


%% Now read in TIV file

if exist('tiv_filename','var')
    filename =tiv_filename;
else
    filename = ['/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/volumes_PNFA_VBM.csv'];
end
delimiter = ',';
startRow = 2;
endRow = inf;
formatSpec = '%s%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
fclose(fileID);
tiv= dataArray{2}+dataArray{3}+dataArray{4};

%% Now do white matter group stats with TIV and age file as covariates in the ANOVA
nrun = 1;
jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_factorial_TIV_age.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(6, nrun);

stats_folder = {'/imaging/mlr/users/tc02/SD_drawings/preprocess/VBM_stats/WM_factorial_full_group_vbm_TIVnormalised_agecovaried_unsmoothedmask'};
split_stem_controls = regexp(controlmrilist, '/', 'split');
split_stem_SD = regexp(SDmrilist, '/', 'split');

inputs{1, 1} = stats_folder;

for crun = 1:nrun
    inputs{2, 1} = cell(length(SDmrilist),1);
    for i = 1:length(SDmrilist)
        inputs{2,crun}(i) = cellstr(['/' fullfile(split_stem_SD{i}{1:end-1}) '/smwc2' split_stem_SD{i}{end}]);
    end
    inputs{3, 1} = cell(length(controlmrilist),1);
    for i = 1:length(controlmrilist)
        inputs{3,crun}(i) = cellstr(['/' fullfile(split_stem_controls{i}{1:end-1}) '/smwc2' split_stem_controls{i}{end}]);
    end
end

try
    inputs{4, 1} = tiv;
catch
    tivstem = ['/imaging/mlr/users/tc02/SD_drawings/preprocess/volumes_PNFA_VBM.csv'];
    filename = [tivstem '.csv'];
    delimiter = ',';
    startRow = 2;
    endRow = inf;
    formatSpec = '%s%f%f%f%[^\n\r]';
    fileID = fopen(filename,'r');
    dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
    fclose(fileID);
    tiv= dataArray{2}+dataArray{3}+dataArray{4};
    inputs{4, 1} = tiv;
end
load('VBM_ages.mat')
inputs{5, 1} = [SD_ages; controlages];
inputs{6, 1} = {'control_majority_unsmoothed_mask_c2_thr0.05_cons0.8.img'};

if ~exist(char(inputs{6, 1}),'file')
    core_imagepaths = [SDmrilist; controlmrilist(1:length(SDmrilist))];
    split_stem_template = regexp(core_imagepaths, '/', 'split');
    path_to_template_6 = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/Template_6.nii']);
    make_WM_VBM_explicit_mask(controlmrilist, path_to_template_6, 'control')
end

spm_jobman('run', jobs, inputs{:});

inputs = cell(1, nrun);
inputs{1, 1} =  {[char(stats_folder) '/SPM.mat']};

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_estimate.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_contrast.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});

jobfile = {'/imaging/mlr/users/tc02/vespa/scans/PNFA_VBM/tom/VBM_batch_results.m'};
jobs = repmat(jobfile, 1, nrun);

spm_jobman('run', jobs, inputs{:});

%% Now subparcellate the AAL atlas along the temporal lobe
% Renumbers regions 89 and 90 to 91-94 and 95-98 from back to front left
% and right
SD_Subparcellate_Temporal_Lobe_AAL

%% Now normalise atlas to template 
core_imagepaths = [SDmrilist; controlmrilist(1:length(SDmrilist))];
split_stem_template = regexp(core_imagepaths, '/', 'split');
path_to_template_6 = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/Template_6.nii']);

dartel_flow = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/y_Template_6_2mni.nii']);

if ~exist(dartel_flow{1},'file')
    matlabbatch{1}.spm.tools.dartel.popnorm.template = path_to_template_6; % Create nonlinear deformation to align the population average with MNI space
    spm_jobman('run',matlabbatch);
end

SD_Warp_Atlas_job(dartel_flow,{[pwd '/aal_MNI_V4_split.nii']})

target = '/imaging/tc02/SD_drawings/from_simon/sub-19361_ses-20160913/smwc1sub-19361_ses-20160913_acq-repmprage_run-02_T1w.nii'; % Single subject image for reslicing
warped_atlas = [pwd '/waal_MNI_V4_split.nii'];
path_Template6_2nmi = cellstr(['/' fullfile(split_stem_template{1}{1:end-1}) '/Template_6_2mni.mat']);
dartel_roi_to_mni(target,warped_atlas,char(path_Template6_2nmi))

% Now do the extraction
split_stem_SD = regexp(SDmrilist, '/', 'split');
filepath = cell(length(SDmrilist),1);
for i = 1:length(SDmrilist)
    filepath{i} = ['/' fullfile(split_stem_SD{i}{1:end-1}) '/smwc1' split_stem_SD{i}{end}];
end

mask =  {'control_majority_smoothed_mask_c1_thr0.1_cons0.8.img'};

%spm_summarise(char(filepath), '/home/tc02/Regionofinterestscripts/rwaal_nfvPPA_2mni.nii')
addpath('/home/tc02/Regionofinterestscripts/masaroi/')
masaroi(0,Inf, ['a'], char(filepath), [pwd '/rwaal_MNI_V4_split.nii'],char(mask),[],1,'aal') ;

filename = [pwd '/SD_roi_density.txt'];
movefile([pwd '/all_roi_results.txt'],filename)

roidata = importdata('SD_roi_density.txt');

try
    all_tivs = tiv;
catch
    tivstem = ['/imaging/mlr/users/tc02/SD_drawings/preprocess/volumes_PNFA_VBM'];
    filename = [tivstem '.csv'];
    delimiter = ',';
    startRow = 2;
    endRow = inf;
    formatSpec = '%s%f%f%f%[^\n\r]';
    fileID = fopen(filename,'r');
    dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
    fclose(fileID);
    tiv= dataArray{2}+dataArray{3}+dataArray{4};
    all_tivs = tiv;
end

% all_ROInames = importdata('/home/tc02/PickAtlas/WFU_PickAtlas_3.0.5b/wfu_pickatlas/MNI_atlas_templates/aal_MNI_V4.txt');
% 
% 
% ROInames = {'Frontal_Inf_Tri_L', 'Frontal_Inf_Oper_L', 'Rolandic_Oper_L', 'Putamen_L', 'Caudate_L', 'Frontal_Inf_Tri_R', 'Frontal_Inf_Oper_R', 'Rolandic_Oper_R', 'Putamen_R', 'Caudate_R'};
% ROInumbers = zeros(size(ROInames));
% for i = 1:length(ROInames)
%     thisROI_place = strfind(all_ROInames,ROInames{i});
%     thisROI_index = find(not(cellfun('isempty', thisROI_place)));
%     thisROI_number = all_ROInames{thisROI_index}(1:(thisROI_place{thisROI_index}-1));
%     ROInumbers(i) = str2num(thisROI_number);
% end
ROInumbers = [83,87,94,93,92,91,55,84,88,98,97,96,95,56]; %From subparcellation, instead of roi names.
ROInames = {'L Pole Up','L Pole Mid','L Inf Front','L Inf Mid Front','L Inf Mid Back','L Inf Back','L Fusiform','R Pole Up','R Pole Mid','R Inf Front','R Inf Mid Front','R Inf Mid Back','R Inf Back','R Fusiform'};
ROInames_noside = {'Sup Pole', 'Mid Pole','Inf Gy Front','Inf Gy Mid Front','Inf Gy Mid Back','Inf Gy Back','Fusiform Gy'};
%ROInumber is in column 1, mean is column 7, median is column 8, nonzero mean is column 14, masked mean is column 28 and median is column 29
extracted_roi_values = zeros(size(SD_composite,1),length(ROInames));
extracted_masked_roi_values = zeros(size(SD_composite,1),length(ROInames));
extracted_nonzero_roi_values = zeros(size(SD_composite,1),length(ROInames));
correctedgrey = zeros(size(SD_composite,1),1);
omit_these = [];
for i = 1:length(SDmrilist)
    this_cov_row = find(SD_composite(:,1)==i);
    if isempty(this_cov_row)
        warning(['No covariate for scan number ' num2str(i) ', omitting it'])
        omit_these = [omit_these, i];
    elseif length(this_cov_row)==1
        scantoworkon = filepath{i};
        thistiv = all_tivs(length(controlmrilist)+i); %TIV calculated for all MRIs, with controls first
        thistotalgrey = dataArray{2}(length(controlmrilist)+i);
    else
        error(['More than one covariate for scan number ' num2str(i) ', check your inputs'])
    end

    IndexC = strfind(roidata.textdata(:,1),scantoworkon);
    Index_thispatient = find(not(cellfun('isempty', IndexC)));
    Index_thispatient = Index_thispatient-1; %account for header row

    for j = 1:length(ROInames)
        IndexC = roidata.data(:,1) == ROInumbers(j);
        current_row = Index_thispatient(IndexC(Index_thispatient));
        if isempty(current_row)
            extracted_roi_values(i,j) = NaN;
            extracted_nonzero_roi_values(i,j) = NaN;
            extracted_masked_roi_values(i,j) = NaN;
        else
            extracted_roi_values(i,j) = roidata.data(current_row,7)/thistiv;
            extracted_nonzero_roi_values(i,j) = roidata.data(current_row,14)/thistiv;
            extracted_masked_roi_values(i,j) = roidata.data(current_row,28)/thistiv;
        end
    end

    correctedgrey(i) = thistotalgrey/thistiv;

end
extracted_roi_values(omit_these,:) = [];
extracted_masked_roi_values(omit_these,:) = [];
extracted_nonzero_roi_values(omit_these,:) = [];
correctedgrey(omit_these,:) = [];

figure
set(gcf,'color','w')
hold on
[rho,~] = corr(SD_composite(:,2),extracted_masked_roi_values,'type','Spearman');
plot(rho(1:floor(length(rho)/2)),'b')
plot(rho(1+ceil(length(rho)/2):end),'r')
legend({'Left','Right'},'location','southeast')
set(gca,'xtick',[1:length(ROInames_noside)],'xticklabels',ROInames_noside,'XTickLabelRotation',45,'TickLabelInterpreter','none')
xlim([0 length(ROInames_noside)+1])
ylim([-1 0.1])
ylabel('Spearman Correlation')
plot([0 length(ROInames_noside)],[-0.745 -0.745],'k--')
plot([0 length(ROInames_noside)],[-0.648 -0.648],'k--')
plot([0 length(ROInames_noside)],[-0.564 -0.564],'k--')
plot([0 length(ROInames_noside)],[0 0],'k-')
text(length(ROInames_noside)+0.1,-0.564,'p<0.05')
text(length(ROInames_noside)+0.1,-0.648,'p<0.025')
text(length(ROInames_noside)+0.1,-0.745,'p<0.01')
title('Composite Score to Grey Matter Volume')
spm_renumber_atlas('./rwaal_MNI_V4_split.nii',[ROInumbers(1:(length(ROInumbers)/2)-1),ROInumbers(1+(length(ROInumbers)/2):end-1)],[rho(1:(length(ROInumbers)/2)-1),rho(1+(length(ROInumbers)/2):end-1)],'_Composite') %Omit the fusiform to make it neater

figure
set(gcf,'color','w')
hold on
[rho,~] = corr(SD_composite_FAM(:,2),extracted_masked_roi_values,'type','Spearman');
plot(rho(1:floor(length(rho)/2)),'b')
plot(rho(1+ceil(length(rho)/2):end),'r')
legend({'Left','Right'},'location','southeast')
set(gca,'xtick',[1:length(ROInames_noside)],'xticklabels',ROInames_noside,'XTickLabelRotation',45,'TickLabelInterpreter','none')
xlim([0 length(ROInames_noside)+1])
ylim([-1 0.1])
ylabel('Spearman Correlation')
plot([0 length(ROInames_noside)],[-0.745 -0.745],'k--')
plot([0 length(ROInames_noside)],[-0.648 -0.648],'k--')
plot([0 length(ROInames_noside)],[-0.564 -0.564],'k--')
plot([0 length(ROInames_noside)],[0 0],'k-')
text(length(ROInames_noside)+0.1,-0.564,'p<0.05')
text(length(ROInames_noside)+0.1,-0.648,'p<0.025')
text(length(ROInames_noside)+0.1,-0.745,'p<0.01')
title('Familiarity Score to Grey Matter Volume')
spm_renumber_atlas('./rwaal_MNI_V4_split.nii',[ROInumbers(1:(length(ROInumbers)/2)-1),ROInumbers(1+(length(ROInumbers)/2):end-1)],[rho(1:(length(ROInumbers)/2)-1),rho(1+(length(ROInumbers)/2):end-1)],'_Familiarity') %Omit the fusiform to make it neater

figure
set(gcf,'color','w')
hold on
[rho,~] = corr(SD_composite_both(:,2),extracted_masked_roi_values,'type','Spearman');
plot(rho(1:floor(length(rho)/2)),'b')
plot(rho(1+ceil(length(rho)/2):end),'r')
legend({'Left','Right'},'location','southeast')
set(gca,'xtick',[1:length(ROInames_noside)],'xticklabels',ROInames_noside,'XTickLabelRotation',45,'TickLabelInterpreter','none')
xlim([0 length(ROInames_noside)+1])
ylim([-1 0.1])
ylabel('Spearman Correlation')
plot([0 length(ROInames_noside)],[-0.745 -0.745],'k--')
plot([0 length(ROInames_noside)],[-0.648 -0.648],'k--')
plot([0 length(ROInames_noside)],[-0.564 -0.564],'k--')
plot([0 length(ROInames_noside)],[0 0],'k-')
text(length(ROInames_noside)+0.1,-0.564,'p<0.05')
text(length(ROInames_noside)+0.1,-0.648,'p<0.025')
text(length(ROInames_noside)+0.1,-0.745,'p<0.01')
title('Combined Score to Grey Matter Volume')
spm_renumber_atlas('./rwaal_MNI_V4_split.nii',[ROInumbers(1:(length(ROInumbers)/2)-1),ROInumbers(1+(length(ROInumbers)/2):end-1)],[rho(1:(length(ROInumbers)/2)-1),rho(1+(length(ROInumbers)/2):end-1)],'_Combined') %Omit the fusiform to make it neater

%% Now create some figures for visualisation

Group_dir = '/imaging/mlr/users/tc02/SD_drawings/preprocess/VBM_stats/factorial_full_group_vbm_TIVnormalised_agecovaried_unsmoothedmask';

Single_Subject_Pathstem = '/imaging/mlr/users/tc02/SD_drawings/preprocess/VBM_stats/factorial_single_subject/patient_';

cfg.plots = [1:2];
cfg.symmetricity = 'symmetrical';
% cfg.normalise = 1;
% cfg.threshold = [5 40];
cfg.inflate = 10;

addpath(genpath('/group/language/data/thomascope/MMN/ICA_denoise/VBM/visualisation_2020'))

cfg.normalise = 0;

cfg.threshold = [3.505 12.99]; %p=0.0001 unc

if ~exist('./figures','dir')
    mkdir('./figures')
end

jp_spm8_surfacerender2_version_tc([Group_dir '/spmT_0002.nii'],'jet',cfg)
savepath = ['./figures/Overall_group'];
eval(['export_fig ' savepath '.png -transparent -m2.5'])
close all

for i = 1:length(SDmrilist)
jp_spm8_surfacerender2_version_tc([Single_Subject_Pathstem num2str(i) '/spmT_0002.nii'],'jet',cfg)
savepath = ['./figures/patient_' num2str(i)];
eval(['export_fig ' savepath '.png -transparent -m2.5'])
close all
end


%%
matlabpool close