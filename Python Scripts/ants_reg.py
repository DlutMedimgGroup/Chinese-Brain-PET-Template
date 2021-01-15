#!/usr/bin/env python3
# -*- coding: utf-8 -*-
'''
Script Name : ants_reg.py
Author : Tian Yang
Created : 2021/01/08
Last modified :
Version :
Modification :
Description :
    PURPOSE : Registration volumes to a template (Rigid + SyN recommended)
    INPUTS : Images' path and template's path
    OUTPUTS : Spatial normalised images prefixed with 'n'
'''

import time
from pathlib import Path
import SimpleITK as sitk
import ants


def antsReg(fix_path, move_path, save_path, reg='SyN'):
    start_time = time.time()
    fix_img = ants.image_read(fix_path)
    move_img = ants.image_read(move_path)
    outs = ants.registration(fix_img, move_img, type_of_transform='Rigid')
    reg_img_rigid = outs['warpedmovout']
    re_reg = ants.registration(fix_img, reg_img_rigid, type_of_transform=reg)
    reg_img = re_reg['warpedmovout']
    ants.image_write(reg_img, save_path)
    print(save_path)
    return time.time() - start_time


if __name__ == "__main__":
    # template
    fixed_path = Path(r"/home/ty/data/cn_altas_116_mn_9110991.nii")         # PET template
    # fixed_path = Path(r"/home/ty/data/Chinese-2020-altas/scbt2020.nii")   # Chinese2020 template

    # images' path
    move_list = list(Path(r"/home/ty/data/all119").glob('*.nii'))
    for m in move_list:
        save_path = m.parent.parent / ('m' + str(m.name))
        outs = antsReg(str(fixed_path), str(m), str(save_path), reg='SyN')
        print(outs, 's')
