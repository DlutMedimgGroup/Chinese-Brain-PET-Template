# Chinese Brain PET Template

English | [简体中文](./README.zh_CN.md)

This repository provides a PET brain template specific to the Chinese population, and also includes programs for the building and applying of the template. This project was developed by [Medical Imaging Research Group](https://biomedimg-dlut-edu.cn/), Dalian University of Technology based on 119 normal Chinese <sup>18</sup>F-FDG PET brain images, and open source all data and programs. The dataset is stored on NITRC ([Chinese Brain PET Template - NITRC](https://www.nitrc.org/projects/cnpet/)) and are free download.

[![DlutMedimgGroup](https://img.shields.io/badge/GitHub-DlutMedimgGroup-green?logo=github)](https://github.com/DlutMedimgGroup) [![language](https://img.shields.io/badge/language-MATLAB | Python-blue)](https://github.com/DlutMedimgGroup)

## Install

The project relies on MATLAB, [SPM](https://www.fil.ion.ucl.ac.uk/spm/), [SnPM](http://www.nisox.org/Software/SnPM13/), [Tools for NIfTI and ANALYZE image](https://www.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image), Python3, [ANTsPy](https://github.com/ANTsX/ANTsPy) , and other tools and has been fully tested on the following environments.

> **Windows 10**
>
> - MATLAB R2018a
>
> - SPM 12
>
> - SnPM v.13.1.08
>
> - Tools for NIfTI and ANALYZE image v.1.27.0.0 
>
> - Python 3.7.3 64-bit
>
> **Ubuntu 16.04.6 LTS**
>
> - Python 3.8.3 64-bit
> - ANTsPy v.0.2.6

To clone this repo:

```
git clone https://github.com/DlutMedimgGroup/Chinese-Brain-PET-Template.git
```

## Usage

<img src="./Pipeline.jpg" alt="image-20210112144350294" height=600 />

### Building template

Use the ```ants_reg.py``` in the Python Scripts folder to normalize all images, this step needs to be done under Linux or MacOS as the SyN method in ANTsPy is used.

A mean image and a mask image are generated using the SPM Masking toolbox. The mask image needs to be manually morphologically adjusted and all the original images are normalized to this mean image again.

The registration results are intensity normalized by ``normalisaton2mean.py`` and SSD analysis ``distance_analysis.py`` is performed to exclude data with potential metabolic abnormalities.

The mean image is built as a template based on the filtered data, while the standard deviation image is obtained by ``create_template.py``, and mask image can be kept unchanged.

### Applying template to inputted image

A MATLAB script is provided for user-friendly SPM analysis. This script needs MATLAB environment (SPM ，SnPM，Tools for NIfTI and ANALYZE image). When running, you need to modify the ``main.m`` in the MATLAB folder, set the image path, and no other NIFTI format data should be stored under the path.

## Citation

If our work helps, please cite:

```
coming...
```

## License

[![](https://img.shields.io/badge/license-MIT-green)]()

