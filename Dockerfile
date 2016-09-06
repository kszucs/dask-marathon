FROM mesosphere/mesos-master:1.0.0-2.0.89.ubuntu1404
RUN apt-get update
RUN apt-get install curl -y
RUN curl -o miniconda.sh https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
RUN bash miniconda.sh -f -b -p /opt/anaconda
ENV PATH /opt/anaconda/bin:$PATH
# location of mesos packages
ENV PYTHONPATH /usr/lib/python2.7/site-packages/ 

RUN conda update conda -y
RUN conda install distributed dask pandas ipython protobuf -y -q
RUN conda clean -pt -y
