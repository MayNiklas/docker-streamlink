#!/bin/sh

groupadd python -g ${GID:-1000} || echo "Group already exists."
useradd -u ${UID:-1000} -g ${GID:-1000} python || echo "User already exists."

chown -R  python:python /home/plugins
chown -R  python:python /home/script
chown -R  python:python /home/download

su python << EOF

while [ true ]; do
	streamlink $streamOptions $streamLink $streamQuality -o /home/download/$streamName"-$(date +%Y%m%d-%H%M%S)".mkv
	sleep 60s
done

EOF