#!/bin/bash
REGISTRY='10.100.30.100:5000'
USERNAME='huydv'
PASSWORD='12345678aA@'
IMAGE=$REGISTRY/redis-cluster
echo 'Build image...'
docker build -t $IMAGE .
echo 'Login Nexus'
docker login $REGISTRY -u $USERNAME -p $PASSWORD
echo 'Push image '$IMAGE
docker push $IMAGE:latest