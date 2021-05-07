function dartel_roi_to_mni(target,warped_atlas,path_Template6_2nmi)
%Use the Template_6_2mni.mat file generated from the 'Normalise to MNI
%space routine to put an ROI or atlas in MNI space. the ROI must be warped
%into the DARTEL average space first.

%Any representitive warped image that you want the template to match. It
%will have the same bounding box.

%Example inputs:
% target = '/imaging/tc02/vespa/scans/PNFA_VBM/tom/p00259/ppa_20218/mprage_125/smwppa_20218_mprage_125.nii';
% warped_atlas = '/home/tc02/Regionofinterestscripts/waal_nfvPPA_2mni.nii';
% path_Template6_2nmi = '/imaging/tc02/vespa/scans/PNFA_VBM/tom/p00259/ppa_20218/mprage_125/Template_6_2mni.mat'
load(path_Template6_2nmi);
M = mni.affine;
 
warped_atlas=
Nii = nifti(warped_atlas);
Nii.mat = M;
Nii.mat_intent = 4;

create(Nii);

prefix = 'r';

flags.mask = 0;
flags.mean = 0;
flags.interp = 0;
flags.which = 1; % reslice images 2:n
flags.wrap = [ 0 0 0];
flags.prefix = prefix;  

source=warped_atlas;

Ps=deblank(char(target, source));

spm_reslice(Ps,flags);