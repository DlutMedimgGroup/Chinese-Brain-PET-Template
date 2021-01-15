%-----------------------------------------------------------------------
% Job saved on 10-Dec-2020 15:46:50 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
function []=SPMt_Compute(result_path)
spm_jobman('initcfg');
matlabbatch = {};
matlabbatch{1}.spm.tools.snpm.cp.snpmcfg = {[result_path,'SnPMcfg.mat']};

spm_jobman('run',matlabbatch);
clear matlabbatch;
end