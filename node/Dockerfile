FROM balenalib/raspberrypi3-debian-node:12.16-stretch-build

#必要に応じてパッケージを追加する
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    vim \
#    &&rm -rf /var/lib/apt/lists/* \
#    &&apt-get clean

RUN mkdir work/ && \
    cd work/ && \
    git clone https://github.com/kmchord9/vue-chartjs.git

WORKDIR /work/vue-chartjs

RUN echo "network-timeout 600000" >> .yarnrc && \
    yarn install && \
    yarn run build

CMD [ "yarn", "run", "start" ]
