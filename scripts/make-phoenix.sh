#!/bin/bash
set -e

echo "Preparing phoenix firmware..."

mkdir -p output
mkdir -p phoenix

cp work/rootfs.tar.gz phoenix/

cd sunxi-pack-tools

echo "Packing firmware..."

./pack \
  -c sun50iw9p1 \
  -p linux \
  -b armbian \
  -d ../phoenix/rootfs.tar.gz || true

mkdir -p ../output
cp out/*.img ../output/phoenix-h618.img || true

echo "Phoenix firmware created"
