FROM ubuntu:20.04 AS cpp

RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
  libopencv-dev \
  pkg-config \
  g++

COPY cpp/ /app/src

RUN g++ /app/src/stitching_multi.cpp -o /usr/local/bin/stitching_multi $(pkg-config opencv4 --cflags --libs)
RUN g++ /app/src/stitching_single.cpp -o /usr/local/bin/stitching_single $(pkg-config opencv4 --cflags --libs)

FROM ubuntu:20.04

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
  libimage-exiftool-perl \
  python3-gdal
  python3-imageio \
  python3-matplotlib \
  python3-opencv \
  python3-pandas \
  python3-pil \
  python3-pip \
  python3-pysolar \
  python3-rasterio \
  python3-sklearn \
  && pip3 install --no-cache \
  imutils==0.5.4 \
  PyExifTool==0.1.1 \
  tensorflow==2.3.2 \
  && rm -rf /var/lib/apt/lists/*

COPY --from=cpp /usr/local/bin/ /usr/local/bin/

WORKDIR /app
COPY . .
