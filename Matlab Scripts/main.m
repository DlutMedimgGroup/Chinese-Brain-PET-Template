clear; clc; close all;

%% Data Pre-processing
disp('====================Data Pre-processing====================')
PATH = 'D:/Matlab_Scripts/Chinese_PET_Template/';
data_path = [PATH, 'epliepsy/YANG_SU_ZHEN/'];
hc_path = ['D:/myGit/Chinese-Brain-PET-Template/Dataset/Normalized-images/'];
% hc_path = ['D:/Matlab_Scripts/Chinese_PET_Template/data/zj_dl/'];
% template = ['D:/Matlab_Scripts/Chinese_PET_Template/epliepsy/zj_dl-template.nii'];
template = ['D:/myGit/Chinese-Brain-PET-Template/Template/CN_PET_TEMPLATE.nii'];
mask = ['D:/myGit/Chinese-Brain-PET-Template/Template/CN_PET_TEMPLATE_MASK.nii'];

result_path = [data_path, '/result/'];
mkdir(result_path);

% Reset Origin to Center
Reset_Origin(data_path);

%% SPM Spatial Normalise
disp('====================SPM Spatial Normalise====================')
Spatial_Normalization(data_path, template);

%% Gray Normalise
disp('====================Gray Normalise====================')
normalize2mean(data_path, mask);

%% SnPM{t}
disp('====================SnPM{t}====================')
scan1_file = dir(strcat(data_path, 'mn*.nii'));
scan1_list = struct2cell(scan1_file);
scan1_list = Organize_File(data_path, scan1_list(1,:));

scan2_file = dir(strcat(hc_path, 'mn*.nii'));
scan2_list = struct2cell(scan2_file);
scan2_list = Organize_File(hc_path, scan2_list(1,:));

SPMt_Specify(result_path, scan1_list, scan2_list, mask);
SPMt_Compute(result_path);
SPMt_Inference(result_path);
