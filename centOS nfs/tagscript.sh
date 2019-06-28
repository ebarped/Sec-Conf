#!/bin/bash
VERSION=1.0
GROUP=local/
IMAGE=centos-nfs
docker build -t $GROUP$IMAGE:$VERSION .
paplay /usr/share/sounds/freedesktop/stereo/complete.oga
