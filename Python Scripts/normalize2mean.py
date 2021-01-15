#!/usr/bin/env python3
# -*- coding: utf-8 -*-
'''
Script Name : normalize2mean.py
Author : Tian Yang
Created : 2020/05/14
Last modified :
Version :
Modification :
Description :
    PURPOSE : Intensity normalization
    INPUTS : Images' path, mask's path
    OUTPUTS : Intensity normalized images prefixed with 'm'
'''
import os
# import pysnooper
import numpy as np
import SimpleITK as sitk


# @pysnooper.snoop()
def aver_in_percentile_range(ary, percent_low=40, percent_high=90, inter='nearest'):
    # remove all zero values (PET - Air)
    ary_nozero = ary[np.where(ary)]
    low_value = np.percentile(ary_nozero, percent_low, interpolation=inter)
    high_value = np.percentile(ary_nozero, percent_high, interpolation=inter)
    ary_range = ary_nozero[(ary_nozero >= low_value) & (ary_nozero <= high_value)]
    return ary_range


def non_zero_mean(np_arr):
    exist = (np_arr != 0)
    num = np_arr.sum()
    den = exist.sum()
    return num / den


if __name__ == '__main__':
    path = r"D:\Matlab_Scripts\Chinese_PET_Template\data\all119_syn_pet_20210105/"
    mask = sitk.ReadImage(
        r"D:\Matlab_Scripts\Chinese_PET_Template\altas\cn_altas_mask_116_3_9110991_open.nii")
    mask_ary = sitk.GetArrayFromImage(mask)

    # Select nii images spatial normalized
    for filename in os.listdir(path):
        root, ext = os.path.splitext(filename)
        if root.startswith('m') and ext == '.nii':
            print('#', end="", flush=True)
            img = sitk.ReadImage(path + filename)
            ary = sitk.GetArrayFromImage(img)

            mean_type = 1
            if mean_type == 0:
                mean = non_zero_mean(ary * mask_ary)
            elif mean_type == 1:
                mean_percent = aver_in_percentile_range(ary * mask_ary)
                mean = np.mean(mean_percent)
            # print(mean, np.mean(mean_percent))

            n_img = sitk.GetImageFromArray(ary / mean)
            n_img.CopyInformation(img)
            sitk.WriteImage(n_img, path + 'm' + filename)
