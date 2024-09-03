#!/bin/bash
docker run -it --mount src=$PWD,target=/home/psi,type=bind eth-server
