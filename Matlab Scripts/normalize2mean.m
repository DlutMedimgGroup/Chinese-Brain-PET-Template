function normalize2mean(path, mask_path)
% Gray normailzation function.
%
% normalize2mean(path, mask_path)
% 	path: image dir.
%   mask_path: path of brain mask.
%
% Example:
% 	normalize2mean('./test.nii', mask_path)
%
% NOTE: Results will be written to 'path' with suffix 'm'
%
% Email: xianbao.d # gmail.com
% Website: http://www.52souji.net/
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2011-05-04: Complete
% 2012-08-16: Modify the description and comments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mask = load_nii(mask_path);
mask_ary = mask.img;

niftiSubs = dir(strcat(path, 'n*.nii'));
%%±ê×¼»¯
for i = 1:numel(niftiSubs)
    %     class(char(fullfile(path, niftiSubs(i).name)))
    %     class('D:/test1/cn_cp_spm.nii')
    pet_img = load_nii(char(fullfile(path, niftiSubs(i).name)));
    ary = pet_img.img;
    origin = pet_img.hdr.hist.originator(1:3);
    voxel_size = pet_img.hdr.dime.pixdim(2:4);
    
    mean_percent = aver_in_percentile_range(ary .* single(mask_ary), 40, 90);
    mean1 = mean(mean_percent);
    nii = make_nii(ary/mean1, voxel_size, origin);
    save_nii(nii, char(fullfile(path, strcat('m', niftiSubs(i).name))));
end
end