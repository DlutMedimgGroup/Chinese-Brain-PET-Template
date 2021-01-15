# Chinese Brain PET Template

English | [简体中文](./README.zh_CN.md)

This repository provides a PET brain template specific to the Chinese population, and also includes programs for the building and applying of the template. This project was developed by Medical Imaging Research Group, Dalian University of Technology  ([GitHub@DlutMedimgGroup](https://github.com/DlutMedimgGroup), [Homepage](https://biomedimg-dlut-edu.cn/)) based on 119 normal Chinese <sup>18</sup>F-FDG PET brain images, and open source all data and programs. Due to the size limitation of GitHub, the dataset is stored on XXX and are free download.

## Install

The project relies on MATLAB, [SPM](https://www.fil.ion.ucl.ac.uk/spm/), [SnPM](http://www.nisox.org/Software/SnPM13/), [Tools for NIfTI and ANALYZE image](https://www.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image), Python3, [ANTsPy](https://github.com/ANTsX/ANTsPy) , and other tools and has been tested on the following environments.

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

<img src="README.assets/image-20210112161506035.png" alt="image-20210112161506035" style="zoom:50%;" />

### Building template

Use the ```ants_reg.py``` in the [Python](. /Python Scripts) program folder to registrate all images, this step needs to be done under Linux or MacOS as the SyN method in ANTsPy is used.

A mean image and a mask image are generated using the SPM Maskng toolbox. The mask image needs to be manually morphologically adjusted and all the original images are registrated to this mean image again.

The registration results are intensity normalized by ``normalisaton2mean.py`` and SSD analysis ``distance_analysis.py`` is performed to exclude data with potential metabolic abnormalities.

The mean image is built as a template based on the filtered data, while the standard deviation image ``create_template.py`` is obtained, and mask image is kept unchanged.

### Applying template to inputted image

A one-step MATLAB script is provided for user-friendly SPM analysis. This script needs MATLAB environment (SPM ，SnPM，Tools for NIfTI and ANALYZE image). When running, you need to modify the ``main.m`` in the [MATLAB](. /MATLAB Scripts) folder, set the data storage path, then it can be executed, and no other NIFTI format data should be stored under the path.

## Citation

Our work was published on XX. If our work helps, please cite:

```
cite
```

## License

[![](https://img.shields.io/badge/license-MIT-green)]()

