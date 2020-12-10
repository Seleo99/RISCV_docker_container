FROM ubuntu:19.10

RUN apt-get update -y && apt-get install -y git gcc make g++ device-tree-compiler

RUN apt-get install -y gcc-4.8
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 50

#for gnu toolchain
RUN apt-get install -y autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev


#opam and herdtools for litmus7
RUN apt-get install -y opam 
#RUN opam init
#RUN eval $(opam env)
#RUN opam install -y herdtools7

# env paths
RUN cd / && mkdir RISCV && cd RISCV
RUN export RISCV=/RISCV
RUN export PATH=$PATH:$RISCV/bin

#incstalling RISCV GNU Toolchain

RUN cd /RISCV && \
    git clone --recursive https://github.com/riscv/riscv-gnu-toolchain
    
RUN cd riscv-gnu-toolchain
    mkdir build
    cd build
    ../configure --prefix=$RISCV --with-arch=rv32im --with-abi=ilp32
    make

# installing and making newlib & proxy kernel
RUN cd /RISCV && \
    git clone https://github.com/riscv/riscv-newlib.git
    
RUN cd /RISCV/riscv-newlib && \
    mkdir build && \
    cd build && \
    ../configure  --target=riscv64-unknown-elf && \
    make -j$(nproc) && \
    make install
    
RUN cd /RISCV && \
    git clone https://github.com/riscv/riscv-pk.git

RUN cd /RISCV/riscv-pk && \
    mkdir build && \
    cd build && \
    ../configure --prefix=$RISCV --host=riscv64-unknown-elf && \
    make && \
    make install
    
RUN cd /RISCV && \
    git clone https://github.com/riscv/riscv-isa-sim

RUN cd /RISCV/riscv-isa-sim && \
    mkdir build && \
    cd build && \ 
    ../configure --prefix=$RISCV && \
    make && \
    make install

RUN cd /RISCV && \
    git clone https://github.com/litmus-tests/litmus-tests-riscv

# pass all commands transparently into container
ENTRYPOINT ["bash", "-lc"]

