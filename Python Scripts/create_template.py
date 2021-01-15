#!/usr/bin/env python3
# -*- coding: utf-8 -*-
'''
Script Name : create_template.py
Author : Tian Yang
Created : 2020/06/15
Last modified :
Version :
Modification :
Description :
    PURPOSE : Calc standard deviation image by normalized images and average image
    INPUTS : Normalized images' path, average image's path
    OUTPUTS : Standard deviation image
'''

from pathlib import Path

import numpy as np
import SimpleITK as sitk
# from scipy.ndimage import gaussian_filter

if __name__ == '__main__':
    # path
    img_path = Path(r'D:\Matlab_Scripts\Chinese_PET_Template\data\all119_syn_pet_20210105/')
    mean_path = Path(r"D:\Matlab_Scripts\Chinese_PET_Template\altas\cn_altas_20210105.nii")
    stdv_path = Path(r"D:\Matlab_Scripts\Chinese_PET_Template\altas\cn_altas_stdv_20210105.nii")

    # mean image of mn images
    mean_img = sitk.ReadImage(str(mean_path))
    mean_ary = sitk.GetArrayFromImage(mean_img)

    # OpenCV (https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html.)
    ksize = 8  # mm
    spacing = mean_img.GetSpacing()[0]
    sigma = 0.3 * ((ksize / spacing - 1) * 0.5 - 1) + 0.8
    mean_gs = sitk.SmoothingRecursiveGaussian(mean_img, sigma)
    mean_ary_gs = sitk.GetArrayFromImage(mean_gs)

    # Select mn images
    stdv_ary = np.zeros(np.shape(mean_ary))
    img_list = list(img_path.glob('mn*.nii'))
    for img_name in img_list:
        img = sitk.ReadImage(str(img_name))
        img = sitk.SmoothingRecursiveGaussian(img, sigma)
        img_ary = sitk.GetArrayFromImage(img)
        stdv_ary += np.sqrt((img_ary - mean_ary_gs)**2)

    stdv_img = sitk.GetImageFromArray(stdv_ary / len(img_list))
    stdv_img.CopyInformation(mean_img)
    sitk.WriteImage(stdv_img, str(stdv_path))
