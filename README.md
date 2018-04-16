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
