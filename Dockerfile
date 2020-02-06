FROM python:3.7

RUN pip install \
  jupyterlab==1.2 \
  jupyterhub==1.1 \
  jupyter-server-proxy==1.2 \
  nbgitpuller==0.8 \
  dask==2.10 \
  distributed==2.10 \
  dask-kubernetes==0.10 \
  dask-gateway==0.6 \
  dask-labextension==1.1 \
  tornado==6 \
  bokeh==1.4 \
  graphviz==0.13
