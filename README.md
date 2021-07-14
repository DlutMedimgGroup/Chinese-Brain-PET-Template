# Chinese Brain PET Template

## English
[简体中文](#zh-cn)

This repository provides a PET brain template specific to the Chinese population, and also includes programs for the building and applying of the template. This project was developed by [Medical Imaging Research Group](https://biomedimg-dlut-edu.cn/), Dalian University of Technology based on 116 normal Chinese <sup>18</sup>F-FDG PET brain images, and open source all data and programs. The dataset is stored on NITRC ([Chinese Brain PET Template - NITRC](https://www.nitrc.org/projects/cnpet/)) and are free for download.

[![DlutMedimgGroup](https://img.shields.io/badge/GitHub-DlutMedimgGroup-green?logo=github)](https://github.com/DlutMedimgGroup) [![language](https://img.shields.io/badge/language-MATLAB-blue)](https://github.com/DlutMedimgGroup)

### Install

This project uses MATLAB to analyze the image input by users and has been fully tested on the following environments.

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

To clone this repo:

```
git clone https://github.com/DlutMedimgGroup/Chinese-Brain-PET-Template.git
```

### Usage

A MATLAB script is provided for user-friendly SPM analysis. This script needs MATLAB environment (SPM ，SnPM，Tools for NIfTI and ANALYZE image). When running, you need to modify the ``main.m`` in the MATLAB folder, set the image path, and no other NIFTI format data should be stored under the path.

### Citation

If our work helps, please cite:

```
coming...
```

### License

[![](https://img.shields.io/github/license/DlutMedimgGroup/Chinese-Brain-PET-Template)]()

<h2 id="zh-cn">简体中文</h2>

[English](##English)

这个仓库提供了中国人种专属的PET脑模板，还包括了模板的构建与使用的程序。本项目由 [大连理工大学医学影像研究组](https://biomedimg-dlut-edu.cn/) 基于 116 例正常中国人 <sup>18</sup>F-FDG PET 脑图像完成，并开源了全部数据以及程序。数据集部分存储在NITRC上，[Chinese Brain PET Template - NITRC](https://www.nitrc.org/projects/cnpet/) , 开放免费下载。

[![DlutMedimgGroup](https://img.shields.io/badge/GitHub-DlutMedimgGroup-green?logo=github)](https://github.com/DlutMedimgGroup) [![language](https://img.shields.io/badge/language-MATLAB-blue)](https://github.com/DlutMedimgGroup)

### 安装

本项目使用MATLAB来分析用户输入的图像，并且已经在以下版本上完成测试。

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
>

下载项目源码：

```
git clone https://github.com/DlutMedimgGroup/Chinese-Brain-PET-Template.git
```

### 使用说明

为了方便用户使用我们提供的模板，我们提供了一个一键脚本用于分析输入的数据。脚本基于 MATLAB 编写，需要首先确保 MATLAB 中已有 SPM ，SnPM，Tools for NIfTI and ANALYZE image。运行时需要修改 [MATLAB](./MATLAB Scripts) 文件夹下的 ```main.m```，设置数据存放路径，即可执行，路径下不应该存放其他 NIFTI 格式的数据。

### 引用

如果我们的项目帮到了你，请引用：

```
coming...
```

### 使用许可

本项目使用 MIT 许可协议。

[![](https://img.shields.io/github/license/DlutMedimgGroup/Chinese-Brain-PET-Template)]()

