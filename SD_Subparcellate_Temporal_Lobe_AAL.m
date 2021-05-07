%% First load aal atlas and sub-parcellate the left and right ITGs, regions 89 and 90 (renumber 91-98), overwriting cerebellar regions)
regions_to_split = [89,90];
regions_to_give = [91:98];
volume_info = spm_vol('/home/tc02/PickAtlas/WFU_PickAtlas_3.0.5b/wfu_pickatlas/MNI_atlas_templates/aal_MNI_V4.nii');
aal_original = spm_read_vols(volume_info);
aal_original(ismember(aal_original,regions_to_give)) = NaN;
for i = 1:length(regions_to_split)
      these_locs = find(aal_original==regions_to_split(i)); 
      if isempty(these_locs)
          error('Region to split not found, perhaps you have already done this, check the atlas!')
      end
      [X,Y,Z] = ind2sub(size(aal_original),these_locs);
      %note higher Y index is further forwards in this atlas
      front = max(Y);
      back = min(Y);
      quarter_range = (front-back)/4;
      for j = 1:4
          aal_original(these_locs(Y>=round((back+((j-1)*quarter_range)))&Y<=round(back+((j)*quarter_range)))) = regions_to_give(j+((i-1)*length(regions_to_give)/2));
      end
end
copyfile('/home/tc02/PickAtlas/WFU_PickAtlas_3.0.5b/wfu_pickatlas/MNI_atlas_templates/aal_MNI_V4.nii','/home/tc02/PickAtlas/WFU_PickAtlas_3.0.5b/wfu_pickatlas/MNI_atlas_templates/aal_MNI_V4_backup.nii');
spm_write_vol(volume_info,aal_original);
copyfile('/home/tc02/PickAtlas/WFU_PickAtlas_3.0.5b/wfu_pickatlas/MNI_atlas_templates/aal_MNI_V4.nii',[pwd '/aal_MNI_V4_split.nii']);
copyfile('/home/tc02/PickAtlas/WFU_PickAtlas_3.0.5b/wfu_pickatlas/MNI_atlas_templates/aal_MNI_V4_backup.nii','/home/tc02/PickAtlas/WFU_PickAtlas_3.0.5b/wfu_pickatlas/MNI_atlas_templates/aal_MNI_V4.nii');

      
      