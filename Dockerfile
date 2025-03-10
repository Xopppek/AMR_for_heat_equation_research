FROM python:3.12

WORKDIR /src

RUN git clone https://github.com/AMReX-Codes/amrex.git

RUN apt update
RUN apt install -y build-essential ccache cmake g++ git libhdf5-openmpi-dev libopenmpi-dev pkg-config
