#!/usr/bin/env bash
#
# start a peer node
# @param peer node index, Integer
#   pass in a number to represent the index of the network

geth --datadir ./datadir${@} --networkid 1114 console 2>> eth${@}.log