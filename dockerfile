FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ America/Fort_Wayne

RUN apt-get update \ 
    && apt-get install -yq tzdata locales \
    && rm -rf /var/lib/apt/lists/* \    
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen \
    && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && dpkg-reconfigure tzdata 

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

CMD ["/bin/bash"]