FROM jupyterhub/singleuser

ENV GDAL_DISABLE_READDIR_ON_OPEN='YES'
ENV CURL_CA_BUNDLE='/etc/ssl/certs/ca-certificates.crt'
ENV CPL_VSIL_CURL_ALLOWED_EXTENSIONS='TIF'

USER root

RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
    build-essential

RUN pip install \
  nbgitpuller==0.8 \
  dask==2.11.0 \
  distributed==2.10 \
  dask-kubernetes==0.10 \
  dask-gateway==0.6.1 \
  dask-labextension==1.1 \
  tornado==6.0.3 \
  bokeh==1.4 \
  graphviz==0.13 \
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
  ipywidgets

RUN jupyter labextension install \
  @jupyter-widgets/jupyterlab-manager \
  dask-labextension
