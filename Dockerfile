FROM continuumio/miniconda3

RUN apt-get update

RUN apt-get -y install gcc libgdal-dev g++

RUN conda install -c conda-forge pyproj jupyter 

COPY ./GDAL-3.4.3-cp39-cp39-win_amd64.whl /install/GDAL-3.4.3-cp39-cp39-win_amd64.whl

RUN cd /install/ \
    pip install GDAL-3.4.3-cp39-cp39-win_amd64.whl

RUN pip install numpy pandas geopandas rasterio matplotlib earthpy shapely xarray

RUN pip install -U pysal

RUN pip install --global-option=build_ext --global-option="-I/usr/include/gdal" GDAL==`gdal-config --version`