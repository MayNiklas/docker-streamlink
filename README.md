# docker-streamlink

Archive twitch streams within a docker enviroment.

## Getting Started

These instructions will cover usage information and for the docker container

### Prerequisities


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Container Parameters

Start a detached instance.
```shell
docker run -d --rm -e streamLink='twitch.tv/LINK' -v  $(pwd)/vods:/home/download mayniki/streamlink:2.3.0
```

Or by using docker-compose:

```yml
version: '3.0'
services:
  streamlink:
    container_name: streamlink
    image: mayniki/streamlink:2.3.0
    volumes:
      - "./vods:/home/download"
    environment:
      - streamLink='twitch.tv/LINK'
      - streamQuality='best'
      - streamName='twitch'
      - streamOptions='--twitch-disable-hosting'
      - GID=1000
      - UID=1000
    stdin_open: true
    tty: true
```

```shell
docker-compose up -d
```

#### Environment Variables

* `streamLink` - link to the twitch stream
* `streamQuality` - quality setting to record
* `streamName` - included in filename
* `streamOptions` - options for streamlink
* `GID` - group ID (important for permissions!
* `UID` - user ID (important for permissions!

#### Volumes

* `/home/download` - download location

## Built With

* streamlink v2.3.0
