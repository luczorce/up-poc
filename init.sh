#!/usr/bin/env bash
#
# instantiate a peer node
# @param peer node index, Integer
#   pass in a number to represent the index of the network

geth --datadir ./datadir${@} init ./myGenesis.json
