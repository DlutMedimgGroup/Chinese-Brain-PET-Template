%-----------------------------------------------------------------------
% Job saved on 10-Dec-2020 10:38:26 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
function []=SPMt_Specify(result_path, scan1, scan2,mask)
spm_jobman('initcfg');
matlabbatch = {};
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.DesignName = '2 Groups: Two Sample T test; 1 scan per subject';
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.DesignFile = 'snpm_bch_ui_TwoSampT';
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.dir = {result_path};
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.scans1 = scan1;
%%
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.scans2 = scan2;
%%
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.cov = struct('c', {}, 'cname', {});
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.nPerm = 5000;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.vFWHM = [0 0 0];
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.bVolm = 1;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.ST.ST_none = 0;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.masking.tm.tm_none = 1;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.masking.im = 0;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.masking.em = {[mask, ',1']};
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.globalc.g_omit = 1;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.globalm.glonorm = 1;

spm_jobman('run',matlabbatch);
clear matlabbatch;
end
