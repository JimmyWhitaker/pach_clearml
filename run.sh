#!/bin/sh
set -o xtrace

cp /pfs/config/clearml.conf ~/clearml.conf
python pytorch_mnist.py --lr 0.05 --save-location /pfs/out