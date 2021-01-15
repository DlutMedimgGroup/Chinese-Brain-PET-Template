%PET ͼ��ռ��׼�����������
function [] = Spatial_Normalization(ROOT, template_path)
%% ��������·��
niftiSubs = dir(strcat(ROOT, '*.nii'))
ROOT
%%��׼��
for i = 1:numel(niftiSubs)
    spm_jobman('initcfg');
    matlabbatch = {};
    disp(fullfile(ROOT, niftiSubs(i).name))%��ʾ��ǰ������������
    matlabbatch{1}.spm.tools.oldnorm.estwrite.subj.source ={fullfile(ROOT, niftiSubs(i).name)};
    matlabbatch{1}.spm.tools.oldnorm.estwrite.subj.wtsrc = '';
    matlabbatch{1}.spm.tools.oldnorm.estwrite.subj.resample ={fullfile(ROOT, niftiSubs(i).name)};
%     matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.template ={'D:\test1\cn_sim_mni_sbj116.nii,1'};%ѡ���׼���ο�ͼ��
%     matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.template ={'D:/SPM_test/template/average_percent_4090_116sub_gs2525_20200708.nii,1'};%ѡ���׼���ο�ͼ��
%     matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.template ={'C:\Program Files\MATLAB\R2018a\toolbox\spm12\toolbox\OldNorm\PET.nii,1'};%ѡ���׼���ο�ͼ��
%     matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.template ={'D:\test1\dtemplate_elastix2cn.nii,1'};%ѡ���׼���ο�ͼ��
%     matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.template ={'D:\test1\TEMPLATE_FDGPET_100.nii,1'};%ѡ���׼���ο�ͼ��
    matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.template ={char(template_path)};%ѡ���׼���ο�ͼ��
%     matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.template ={'D:\test1\stimage_114PET_iter4_origin_noInti_sim_mni.nii,1'};%ѡ���׼���ο�ͼ��

    %����������
    matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.weight = '';
    matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.smosrc = 8;
    matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.smoref = 0;
%     matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.regtype ='mni';
    matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.regtype ='mni'; %mni/subj/none
    matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.cutoff = 25;
    matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.nits = 16;
    matlabbatch{1}.spm.tools.oldnorm.estwrite.eoptions.reg = 1;
    matlabbatch{1}.spm.tools.oldnorm.estwrite.roptions.preserve = 0;
    matlabbatch{1}.spm.tools.oldnorm.estwrite.roptions.bb = [-90, -126, -72;90 ,90, 108];
%     matlabbatch{1}.spm.tools.oldnorm.estwrite.roptions.bb = [-342 ,-165, -342;342 ,165, 342];
    matlabbatch{1}.spm.tools.oldnorm.estwrite.roptions.vox = [2 2 2];
    matlabbatch{1}.spm.tools.oldnorm.estwrite.roptions.interp = 1;
    matlabbatch{1}.spm.tools.oldnorm.estwrite.roptions.wrap = [1 1 1];
    matlabbatch{1}.spm.tools.oldnorm.estwrite.roptions.prefix = 'n';
    spm_jobman('run',matlabbatch);
    clear matlabbatch;
end