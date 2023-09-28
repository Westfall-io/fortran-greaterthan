# JAK HelloWorld_Fortran test

# start by building the basic container
FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

MAINTAINER Jessica Kelly <jkelly@urban.org>
RUN yum update -y
# add gfortran, debugging tools and make
RUN yum install -y gcc-gfortran gdb make

# build the hello world code
COPY HelloAgainInput.txt Makefile HelloWorld.f90 /fortran/
WORKDIR /fortran/
RUN make HelloWorld

# configure the container to run the hello world executable by default
CMD ["./HelloWorld"]
