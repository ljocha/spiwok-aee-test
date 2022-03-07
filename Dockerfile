FROM nvcr.io/nvidia/tensorflow:22.02-tf2-py3

ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Europe/Prague

RUN apt update
RUN apt install -y python3-notebook
RUN apt install -y python3-pip

RUN pip3 install mdtraj
RUN pip3 install jupyterhub

WORKDIR /work
ENV HOME /home/jovyan

RUN useradd -m -u 1000 jovyan
COPY ./ /work
RUN chown -R 1000:1000 /work /home/jovyan

CMD jupyter notebook --ip 0.0.0.0 --port 8888 

