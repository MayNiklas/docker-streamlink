ARG ARCH=
FROM ${ARCH}ubuntu:20.04

ENV streamlinkVersion=3.1.1 \
    streamLink='twitch.tv/LINK' \
    streamName='twitch' \
    streamQuality='best' \
    streamOptions='--twitch-disable-hosting' \
    TZ=Europe/Berlin \
    GID=1000 \
    UID=1000

COPY ./site.yml /root/.ansible/site.yml

RUN apt update && \
    apt install -y ansible aptitude python3-apt && \
    ansible-playbook /root/.ansible/site.yml && \
    apt-get remove -y --purge ansible python3-apt git && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    apt-get clean

ENTRYPOINT [ "/bin/sh","/home/script/entrypoint.sh" ]
