%��ͼ����й����ĵĴ���
function [] = Reset_Origin(ROOT)
niftiRootPath = fullfile(ROOT, '*.nii');
niftiSubs = dir(niftiRootPath);
%�����Ĵ���
for i = 1:numel(niftiSubs)
    disp(fullfile(ROOT, niftiSubs(i).name))%��ʾ��ǰ����ͼ������
    st.vol = spm_vol(fullfile(ROOT, niftiSubs(i).name));
    vs = st.vol.mat\eye(4);
    vs(1:3,4) = (st.vol.dim+1)/2;
    spm_get_space(st.vol.fname,inv(vs));
end
end