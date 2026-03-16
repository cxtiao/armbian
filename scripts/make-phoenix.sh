#!/bin/bash
set -e

echo "Preparing Phoenix firmware..."

mkdir -p phoenix
mkdir -p output

cp work/rootfs.tar.gz phoenix/

cd sunxi-pack-tools

echo "Packing firmware..."

./pack 
-c sun50iw9p1 
-p linux 
-b armbian 
-d ../phoenix/rootfs.tar.gz || true

cd ..

cp sunxi-pack-tools/out/*.img output/phoenix-h618.img 2>/dev/null || true
cp sunxi-pack-tools/output/*.img output/phoenix-h618.img 2>/dev/null || true

echo "Firmware build finished."
