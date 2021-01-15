clear; clc; close all;

%% Data Pre-processing
disp('====================Data Pre-processing====================')
PATH = 'D:/Matlab_Scripts/Chinese_PET_Template/';
data_path = [PATH, 'data/ad/'];
hc_path = [PATH, 'data/all119_syn_pet_20210105/'];
template = [PATH, '/altas/cn_altas_sub116_20210105.nii'];
mask = [PATH, '/altas/cn_altas_mask_116_3_9110991_open.nii'];

result_path = [PATH, '/result_ad_0105/'];
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

scan2_file = dir(strcat(hc_path, 'nm*.nii'));
scan2_list = struct2cell(scan2_file);
scan2_list = Organize_File(hc_path, scan2_list(1,:));

SPMt_Specify(result_path, scan1_list, scan2_list);
SPMt_Compute(result_path);
SPMt_Inference(result_path);
