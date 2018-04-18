#!/usr/bin/env bash
#
# instantiate a peer node
# @param peer node index, Integer
#   pass in a number to represent the index of the network

mkdir -p chain
geth --datadir ./chain/datadir${@} init ./myGenesis.json
