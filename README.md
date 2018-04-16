# My First Private Ethereum Network

Here we are following a [tutorial](https://medium.com/mercuryprotocol/how-to-create-your-own-private-ethereum-blockchain-dad6af82fc9f) to create a locally running instance of an Ethereum blockchain on our machines.

## Getting Started

1. Alter the `config.chainId` and `difficulty` values in myGenesis.json
2. Instantiate your data directory with:
  ```
    geth --datadir ./datadir1 init ./myGenesis.json
  ```

## Starting the Network

``` bash
geth --datadir ./datadir1 --networkid 1114 console 2>> eth1.log
```

Whatever the `networkid` is here is what other peers who want to connect will need to know, as well.

After you have started this network, make note of the output of the following command:

```
admin.nodeInfo.enode
```

This will allow us to connect peers to this network.

You can now start the mining operation, if you have created an account with `miner.start()`

## Adding Peers to the Network

In a new terminal, instantiate a new datadir for a new peer, and start the network with a new port. You can run the bash scripts as defined below to quickly do so.

Once the network is up, you add the peer, defing the address of the inital network (what came from `admin.node.enode`)

```
admin.addPeer('REPLACE WHAT CAME FROM admin.node.enode')
```

## Helpful Hints

### Clean up, whoops

Removes the `datadir` directories and the `eth.log` files. As you add more peers to the network you will have more of these files around.

``` bash
bash cleanup.sh
```

**Please remember** to reinstantiate the data directory after doing this.

### Start Networks Quickly

In a new terminal, adds networks to the network with 1114 at subsequent ports.

``` bash
cd path/to/private/ethereum
bash start.sh 1
```

### Instantiate Peer Nodes Quickly

To be run once before you start the network

``` bash
cd path/to/private/ethereum
bash init.sh 1
```