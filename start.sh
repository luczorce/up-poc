#!/usr/bin/env bash
#
# start a peer node
# @param peer node index, Integer
#   pass in a number to represent the index of the network

PORT=$(( 30300+${@} ))
geth --datadir ./datadir${@} --networkid 1114 --port $PORT console 2>> eth${@}.log