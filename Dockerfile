FROM condaforge/miniforge3:23.11.0-0

# This Docker recipe is based on and was inspired by Taylor Hanayik following example/demo repo:
# https://git.fmrib.ox.ac.uk/thanayik/fsl-docker-example-bet

LABEL description="FSL oxford_asl (+ fsl_anat) lightweight docker image"
LABEL maintainer="jhuguetn@gmail.com"

# set the working directory
#WORKDIR /tmp

ENV FSL_CONDA_CHANNEL="https://fsl.fmrib.ox.ac.uk/fsldownloads/fslconda/public"

# install 'fsl_anat' dependency: GNU basic calculator (bc)
RUN apt-get update && apt-get -y install bc
 
# install required FSL packages (FSL version 6.0.7.7) into 'base' conda environment
RUN conda install -y -n base -c $FSL_CONDA_CHANNEL \
    fsl-oxford_asl==v4.0.29 \
    fsl-flirt==2111.2 \
    fsl-bet2==2111.7 \
    fsl-base==2401.0 \
    fsl-utils==2203.4 \                
    fsl-misc_scripts==2111.0 \
    fsl-data_standard==2208.0 \
    && conda list -n base ^fsl

# set FSLDIR and FSLOUTPUTTYPE so FSL tools can use it, in this case, the FSLDIR will be the root conda directory
ENV FSLDIR="/opt/conda"
ENV FSLOUTPUTTYPE=NIFTI_GZ
ENV FSLMULTIFILEQUIT=TRUE
ENV FSLTCLSH="${FSLDIR}/bin/fsltclsh"
ENV FSLWISH="${FSLDIR}/bin/fslwish"
ENV FSL_LOAD_NIFTI_EXTENSIONS=0
ENV FSL_SKIP_GLOBAL=0

ENV PATH="/opt/conda/bin:${PATH}"

#ENTRYPOINT [ "/entrypoint" ]
