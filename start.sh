#!/usr/bin/env bash
#
# start a peer node
# @param peer node index, Integer
#   pass in a number to represent the index of the network

PORT=$(( 30300+${@} ))
RPCPORT=$(( 8050+${@} ))
geth --datadir ./chain/datadir${@} --networkid 1114 --port $PORT --rpc --rpcport $RPCPORT console 2>> chain/eth${@}.log