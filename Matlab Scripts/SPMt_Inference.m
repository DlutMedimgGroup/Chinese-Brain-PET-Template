%-----------------------------------------------------------------------
% Job saved on 10-Dec-2020 16:15:38 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
function []=SPMt_Inference(result_path)
spm_jobman('initcfg');
matlabbatch = {};
matlabbatch{1}.spm.tools.snpm.inference.SnPMmat = {[result_path,'SnPM.mat']};
matlabbatch{1}.spm.tools.snpm.inference.Thr.Vox.VoxSig.FWEth = 0.05;
matlabbatch{1}.spm.tools.snpm.inference.Tsign = -1;
matlabbatch{1}.spm.tools.snpm.inference.WriteFiltImg.WF_no = 0;
matlabbatch{1}.spm.tools.snpm.inference.Report = 'MIPtable';
spm_jobman('run',matlabbatch);
clear matlabbatch;
end

