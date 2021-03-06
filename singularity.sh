#!/bin/bash
# generates singularity image from dat container image
# usage: ./singularity.sh after building with ./build.sh
mkdir mnt
set -e
sudo losetup -Pf container.img --show
sudo mount /dev/loop0p1 mnt # todo detect correct one from --show above
sudo singularity build --writable singularity.img mnt
sudo umount mnt
sudo losetup -D # todo figure out how to detach only ours from above, not all