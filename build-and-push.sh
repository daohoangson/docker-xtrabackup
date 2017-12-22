#!/bin/sh

set -e

_hubImage="xfrocks/xtrabackup"
_hubImageWithTag="$_hubImage:2.4.9"

docker build \
  -t "$_hubImage" \
  -t "$_hubImageWithTag" \
  .

while true
do
  read -p "Push $_hubImage and $_hubImageWithTag? [yN]" yn
  case $yn in
    [Yy]* ) break;;
    * )
      exit 0;;
  esac
done
docker push "$_hubImage"
docker push "$_hubImageWithTag"
