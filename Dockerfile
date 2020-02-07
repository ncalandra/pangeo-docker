FROM jupyterhub/singleuser

USER root

RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
  build-essential

RUN pip install \
  nbgitpuller==0.8 \
  dask==2.10 \
  distributed==2.10 \
  dask-kubernetes==0.10 \
  dask-gateway==0.6 \
  dask-labextension==1.1 \
  tornado==6.0.3 \
  bokeh==1.4 \
  graphviz==0.13
