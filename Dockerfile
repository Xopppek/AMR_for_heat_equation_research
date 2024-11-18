FROM python:3.12

WORKDIR /src

RUN git clone https://github.com/AMReX-Codes/pyamrex.git

RUN apt update
RUN apt install -y build-essential ccache cmake g++ git libhdf5-openmpi-dev libopenmpi-dev pkg-config

RUN pip install --upgrade pip
RUN pip install --upgrade packaging setuptools wheel pytest
RUN pip install --upgrade -r pyamrex/requirements.txt

RUN cmake -S pyamrex/ -B pyamrex/build -DAMReX_SPACEDIM="1;2;3" -DAMReX_MPI=ON
RUN cmake --build pyamrex/build -j 16 --target pip_install

