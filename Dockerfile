FROM jupyterhub/singleuser:1.2

# Environment Variables for rasterio and GDAL
ENV GDAL_DISABLE_READDIR_ON_OPEN='YES'
ENV CURL_CA_BUNDLE='/etc/ssl/certs/ca-certificates.crt'
ENV CPL_VSIL_CURL_ALLOWED_EXTENSIONS='TIF'

USER root

# Add build essential for building some python libraries
RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
    build-essential \
    ffmpeg

# Configure single user jupyter lab settings
RUN python -m pip install s3contents

COPY jupyter_notebook_config.py /home/jovyan/.jupyter/jupyter_notebook_config.py

# Conda Installs :(
RUN conda install -y -c conda-forge pynio pyngl

# Install packages used for python development
RUN python -m pip install \
  nbgitpuller==0.9.0 \
  dask==2.30.0 \
  distributed==2.30.1 \
  dask-kubernetes==0.11.0 \
  dask-gateway==0.9.0 \
  dask-xgboost==0.1.11 \
  dask-labextension==3.0.0 \
  tensorflow==2.3.1 \
  tornado==6.1 \
  bokeh==2.2.3 \
  graphviz==0.14.2 \
  xarray \
  sat-search \
  scipy \
  boto3 \
  pandas \
  geopandas \
  rasterio \
  matplotlib \
  seaborn \
  zarr \
  ipywidgets \
  ephem \
  h5netcdf \
  scikit-learn \
  dask-ml

# Install jupyter lab extensions
RUN jupyter labextension install \
  @jupyter-widgets/jupyterlab-manager \
  dask-labextension
