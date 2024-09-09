#!/bin/bash

# docker attach eth-server
docker run -it --mount src=$PWD,target=/home/eth-server,type=bind eth-server