FROM debian:bullseye-20201209

RUN apt-get update -qq \
    && apt-get -qq install -y \
      git g++ \
      curl zip unzip tar \
      make pkg-config \
      apt-utils

RUN git clone https://github.com/microsoft/vcpkg \
    && ./vcpkg/bootstrap-vcpkg.sh

RUN ./vcpkg/vcpkg install tesseract:x64-linux

ENV GOPATH=/go
ENV GO111MODULE=on
RUN apt-get -qq install -y golang

# Set up INCLUDE_PATH
RUN mkdir /vcpkg/include \
    && find /vcpkg/packages/*/include/* -type d | xargs -i cp -r {} /vcpkg/include \
    && cp -r /vcpkg/packages/libjpeg-turbo_x64-linux/include /vcpkg/include/libjpeg
ENV CPLUS_INCLUDE_PATH=/vcpkg/include

# Set up LIBRARY_PATH
RUN mkdir /vcpkg/lib \
    && find /vcpkg/packages/*/lib -name *.a | xargs -i cp {} /vcpkg/lib \
    && cp /vcpkg/lib/libleptonica.a /vcpkg/lib/liblept.a
ENV LD_LIBRARY_PATH=/vcpkg/lib
ENV LIBRARY_PATH=${LD_LIBRARY_PATH}

ADD . ${GOPATH}/src/github.com/otiai10/gosseract
WORKDIR ${GOPATH}/src/github.com/otiai10/gosseract

# RUN tesseract --version

# ENV GOSSERACT_CPPSTDERR_NOT_CAPTURED=1
# ENV TESS_LSTM_DISABLED=1
# CMD ["go", "test", "-v", "github.com/otiai10/gosseract"]
