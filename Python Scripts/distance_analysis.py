#!/usr/bin/env python3
# -*- coding: utf-8 -*-
'''
Script Name : distance_analysis.py
Author : Tian Yang
Created : 2020/05/15
Last modified :
Version :
Modification :
Description :
    PURPOSE : Calc distance error (Sum of Squered Difference) of normalised images
    INPUTS : Images' path, mask's path
    OUTPUTS : Plot a figure or save SSD result to csv
'''
import os
import re
import time
from pathlib import Path

import numba as nb
import numpy as np
import pandas as pd
import seaborn as sns
import SimpleITK as sitk
from matplotlib import pyplot as plt
from scipy.ndimage import gaussian_filter


# Sum of Square Differences (SSD)
def ssd(A, B):
    s = np.sum((A - B)**2)
    return s


def getArray(x, mask_ary):
    x = str(x)
    img = sitk.ReadImage(x)
    ary = sitk.GetArrayFromImage(img) * mask_ary
    # print('geyArray', np.shape(ary))
    return ary.reshape((-1, 1))


@nb.jit(nopython=True)
def CalcDistanceError2(ary_list):
    num = len(ary_list)
    error_value = np.zeros((num, num))
    for i in range(num):
        for j in range(num):
            # error_value[i, j] = ssd(ary_list[i], ary_list[j])
            error_value[i, j] = i
    return error_value


def CalcDistanceError(ary_list):
    num = len(ary_list)
    error_value = np.zeros((num, num))
    for i in range(num):
        error_value[i, :] = np.array(list(map(lambda x: ssd(ary_list[i], x), ary_list)))
    return error_value


if __name__ == '__main__':
    time_start = time.time()
    # mn images
    PATH = Path(r'D:\Matlab_Scripts\Chinese_PET_Template\data\all119_syn_pet_20210105/')

    mask = sitk.ReadImage(
        r"D:\Matlab_Scripts\Chinese_PET_Template\altas\cn_altas_mask_116_3_9110991_open.nii")
    mask_ary = sitk.GetArrayFromImage(mask)

    mn_img_list = list(PATH.glob('mn*.nii'))
    # e_img_list = list(PATH.glob('emn*.nii'))
    # mn_img_list += e_img_list
    # mn_img_list.sort()
    # print(mn_img_list)

    ary_list = list(map(lambda x: getArray(x, 1), mn_img_list))
    print(len(ary_list), np.shape((ary_list[1])))
    error_value = CalcDistanceError(ary_list)

    # plt.plot(error_value.mean(axis=1), 'o')

    time_end = time.time()
    print('\ntime cost', time_end - time_start, 's')

    # print(mn_img_list)
    label_list = [(str(x.name).split('_')[0]).split('mn')[1] for x in mn_img_list]
    error_value_mean = error_value.mean(axis=0)
    error_value_mean_mean = error_value_mean.mean()
    error_value_mean_std = np.std(error_value_mean)
    color = []
    sigma = 3
    for i in error_value_mean:
        if i >= error_value_mean_mean + sigma * error_value_mean_std:
            color.append('red')
        elif i <= error_value_mean_mean - sigma * error_value_mean_std:
            color.append('green')
        else:
            color.append('black')

    # d = {"label_list": label_list, "error_value_mean": error_value_mean}
    # d_df = pd.DataFrame(d)
    # d_df.to_csv(PATH / 'SSD.csv')
    # print(np.shape(error_value_mean))
    # plt.plot(error_value_mean, 'o')
    fig = plt.figure(figsize=(10, 20))
    ax = fig.add_subplot()
    ax.scatter(y=label_list, x=error_value_mean, marker=',', c=color)
    # plt.xticks(np.arange(0, np.size(error_value_mean), 1), label_list, rotation=-90)
    # plt.xticks(error_value_mean, mn_img_list)
    # plt.grid(axis='x', linestyle='-.')
    # plt.xlabel('Subjects ID')
    # plt.ylabel('SSD')
    plt.axvline(x=error_value_mean_mean, color="blue")
    plt.axvline(x=error_value_mean_mean + sigma * error_value_mean_std, color="red")
    plt.axvline(x=error_value_mean_mean - sigma * error_value_mean_std, color="green")
    plt.show()
