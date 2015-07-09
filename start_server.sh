#!/bin/bash

NODE_EXEC="nodejs"
if [ "$1" = "debug" ]; then
	NODE_EXEC="node-debug"
	echo 'Starting Server in Debug Mode...'
else
	echo 'Starting Server...'
fi

PORT=3000 \
MONGO_URL=mongodb://localhost:27017/meteor \
ROOT_URL=http://localhost:3000/ \
METEOR_SETTINGS="$(cat settings.json)" \
nohup $NODE_EXEC main.js >/var/log/nodejs.log 2>&1 &

echo $! > server_id.txt