FROM debian:buster-slim
ARG hver=1.15 # HTSLIB and BCFTOOLS version
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y make wget unzip git g++ zlib1g-dev bwa samtools libncurses5-dev \
  libgdiplus libicu-dev libbz2-dev libssl-dev liblzma-dev libcurl4-openssl-dev \
  autoconf libdeflate-dev 
RUN wget https://github.com/samtools/htslib/releases/download/$hver/htslib-$hver.tar.bz2 && \
  mkdir htslib && \
  tar -xf htslib-$hver.tar.bz2 -C htslib --strip-components=1 && \
  cd htslib && \
  autoreconf -i && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -rf htslib-$hver.tar.bz2
RUN wget https://github.com/samtools/bcftools/archive/refs/tags/$hver.tar.gz && \
  mkdir bcftools && \
  tar -xf $hver.tar.gz -C bcftools --strip-components=1 && \
  cd bcftools && \
  autoreconf -i && \
  ./configure && \
  make && \
  make install && \
  cd .. && rm -rf bcftools $hver.tar.gz
RUN wget https://github.com/samtools/samtools/releases/download/$hver/samtools-$hver.tar.bz2 && \
  mkdir samtools && \
  tar -xf samtools-$hver.tar.bz2 -C samtools --strip-components=1 && \
  cd samtools && \
  ./configure && \
  make && \
  make install && \
  cd .. && rm -rf samtools samtools-$hver.tar.bz2
ENTRYPOINT ["bcftools"]
