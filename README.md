FSL `oxford_asl` (and `fsl_anat`) docker image 
==============================================
Docker image including a minimal selection of FSL 6.0.7.7 packages required 
to run `oxford_asl` tools from [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL) 
library.  

Find the image in Docker Hub [here](https://hub.docker.com/r/jhuguetn/fsl_oxford_asl).

Components
----------
* Ubuntu 20.04 LTS (Focal Fossa)
* conda-forge Miniforge3 23.11.0-0
* FSL 6.0.7.7 packages: 
  * fsl-oxford_asl (v4.0.29)
  * fsl-flirt (2111.2)
  * fsl-bet2 (2111.7)
  * fsl-base (2401.0)
  * fsl-utils (2203.4)
  * fsl-misc_scripts (2111.0)
  * fsl-data_standard (2208.0)

Example (registration of ASL image to T1w target space)
-----
```bash
 docker run -it --rm -v `pwd`/data:/data jhuguetn/fsl_oxford_asl \
 asl_reg -i /data/pCASL.nii.gz -s /data/T1w.nii -o /data/output
```

Credits
-------
Jordi Huguet ([BarcelonaBeta Brain Research Center](http://barcelonabeta.org))
