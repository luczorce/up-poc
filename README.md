# My First Private Ethereum Network

Here we are following a [tutorial](https://medium.com/mercuryprotocol/how-to-create-your-own-private-ethereum-blockchain-dad6af82fc9f) to create a locally running instance of an Ethereum blockchain on our machines.

## Getting Started

1. Create Accounts and store that info
  ``` bash
  geth --datadir ./chain/datadir1 account new
  geth --datadir ./chain/datadir2 account new
  ```
2. Alter the `config.chainId` and `difficulty` values in myGenesis.json. Allocate eth to the accounts you just created.
3. Instantiate your blockchain with:
  ``` bash
  geth --datadir ./chain/datadir1 init ./myGenesis.json
  ```
4. `TODO` Consider starting a bootnode `bootnode -genkey boot.key`

## Starting the Network

``` bash
geth --datadir ./chain/datadir1 --networkid 1114 console 2>> chain/eth1.log
```

Whatever the `networkid` is here is what other peers who want to connect will need to know, as well.

After you have started this network, make note of the output of the following command:

``` js
admin.nodeInfo.enode
```

This will allow us to connect peers to this network.

## Unlock the Account

In order to run transactions against this account, you'll need to [unlock](https://github.com/ethereum/go-ethereum/wiki/Managing-your-accounts#listing-accounts-and-checking-balances) it. While in the terminal, you can run:

``` js
personal.unlockAccount(address, "password", 300)
```

The 300 in this example is how long (in seconds) the account will be unlocked for.

## Profit??

You can now start the mining operation, if you have created an account with `miner.start()`

## Adding Peers to the Network

In a new terminal, instantiate a new datadir for a new peer, and start the network with a new port. You can run the bash scripts as defined below to quickly do so.

Once the network is up, you add the peer, defing the address of the inital network (what came from `admin.node.enode`)

```
admin.addPeer('REPLACE WHAT CAME FROM admin.node.enode')
```

## Helpful Hints

### Ports and Numbers to remember

* NetworkID: 1114
* RPC Port: 8050 + whichever network index (normally **8051** for the first)
* Network Port: 30300 + whichever network index (normally **30301** for the first)

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