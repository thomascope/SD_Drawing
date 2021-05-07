function spm_renumber_atlas(varargin)
% spm_renumber_atlas_simple(p)
% function spm_renumber_atlas(p,old,new,postfix)
% Renumber values in a image with values from a lookup array old with values from a matching 
% array new. e.g. renumber fressurfer wmparc labels do that both white matter and corresponding
% grey matter have the same value (that of the new array)
%p is an array of files to rename
%FDR option below for varargin{3} does not work

p=varargin{1};
nroi=0;
if nargin>1
    old=varargin{2};
    new=varargin{3};
    nroi=numel(old);
    if numel(new)~=nroi, error('old array number must match new array number'), end
end

if nargin>3
    postname=varargin{4};
else
    postname='_ren';
end

do_explicit_zero=0;

%Explicitly set regions to zero, e.g.if there is a binary list of FDR
%significant regions
if nargin>4
    explicit_zero=varargin{5};
    do_explicit_zero=1;
end

v=spm_vol(p);
y=spm_read_vols(v);
yout=y;
yout_otherzeros = nan(size(y));
yout_otherzeros(y~=0) = 0;
yout_othernan = nan(size(y));

output_dtype='float32'; %For freesurfer. Or perhaps use integer to have discrete atlas regions

%exclude regions from Freesurfer rwmparc_ren_brainstemSsLabels.v10.1mm.nii white
%matter relabelled
numbers_to_zero=[];

% Change the medula to the t-value of the 8th 'new' number
numbers_extra_renumber=[];

for j=1:size(numbers_extra_renumber,1)
    yout(ismember(y,numbers_extra_renumber(j,1)))=numbers_extra_renumber(j,2);
end

for j=1:numel(numbers_to_zero)
    yout(ismember(y,numbers_to_zero(j)))=0;
end

if do_explicit_zero
    new(~explicit_zero)=0;
end

for j=1:nroi
   yout(ismember(y,old(j)))=new(j);
   yout_otherzeros(ismember(y,old(j)))=new(j);
   yout_othernan(ismember(y,old(j)))=new(j);
end

[pname,fname,xname]=fileparts(v.fname);

vout =v;
vout.fname=fullfile(pname,strcat(fname,postname,xname));
vout.dt(1)=spm_type(output_dtype);

vout=spm_create_vol(vout);

for j=1:vout.dim(3)
    spm_write_plane(vout,yout(:,:,j),j);
end

vout.fname=fullfile(pname,strcat(fname,postname,'_otherzeros',xname));
vout=spm_create_vol(vout);

for j=1:vout.dim(3)
    spm_write_plane(vout,yout_otherzeros(:,:,j),j);
end

vout.fname=fullfile(pname,strcat(fname,postname,'_othernan',xname));
vout=spm_create_vol(vout);

for j=1:vout.dim(3)
    spm_write_plane(vout,yout_othernan(:,:,j),j);
end

disp('Finished renumbering image')