FROM python:3.9.0-buster

ENV streamlinkVersion=2.3.0

ADD https://github.com/streamlink/streamlink/releases/download/${streamlinkVersion}/streamlink-${streamlinkVersion}.tar.gz /opt/

RUN apt-get update && apt-get upgrade -y

RUN tar -xzf /opt/streamlink-${streamlinkVersion}.tar.gz -C /opt/ && \
	rm /opt/streamlink-${streamlinkVersion}.tar.gz && \
	cd /opt/streamlink-${streamlinkVersion}/ && \
	python setup.py install

RUN mkdir /home/download
RUN mkdir /home/script
RUN mkdir /home/plugins

COPY ./entrypoint.sh /home/script
RUN ["chmod", "+x", "/home/script/entrypoint.sh"]
ENTRYPOINT [ "/home/script/entrypoint.sh" ]
