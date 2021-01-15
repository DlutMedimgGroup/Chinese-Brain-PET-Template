%对图像进行归中心的处理
function [] = Reset_Origin(ROOT)
niftiRootPath = fullfile(ROOT, '*.nii');
niftiSubs = dir(niftiRootPath);
%归中心处理
for i = 1:numel(niftiSubs)
    disp(fullfile(ROOT, niftiSubs(i).name))%显示当前处理图像名称
    st.vol = spm_vol(fullfile(ROOT, niftiSubs(i).name));
    vs = st.vol.mat\eye(4);
    vs(1:3,4) = (st.vol.dim+1)/2;
    spm_get_space(st.vol.fname,inv(vs));
end
end