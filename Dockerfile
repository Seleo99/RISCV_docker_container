FROM ubuntu:20.10

RUN apt-get update -y && apt-get install -y git gcc make g++ device-tree-compiler

# spike build tools and dependencies
RUN apt-get install -y gcc-riscv64-unknown-elf gcc-riscv64-linux-gnu g++-riscv64-linux-gnu

# installing newlib & pk. these are not required for bare metal (see examples in README.md) 


# installing spike iself

RUN git clone https://github.com/riscv/riscv-isa-sim.git

RUN cd /riscv-isa-sim && \
    mkdir build && \
    cd build && \ 
    ../configure --prefix=/usr/local && \
    make && \
    make install

# pass all commands transparently into container
ENTRYPOINT ["bash", "-lc"]

