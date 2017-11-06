#!/bin/sh

_hubImage="xfrocks/xtrabackup"
_hubTag="2.4.8"

docker build \
  -t "$_hubImage" \
  -t "$_hubImage:$_hubTag" \
  .

docker push "$_hubImage"
docker push "$_hubImage:$_hubTag"
