# IPFS (private version) via Azure
IPFS offers a decentralized storage engine that can be used to drive a model that focuses is content based rather than the traditional location based.  This means that a highly redundant (fault tolerant) and immutable storage object can be created and shared.

IPFS has been working on a ["private network"](https://github.com/ipfs/go-ipfs/blob/master/docs/experimental-features.md#private-networks) feature.  The basic premise is this:

* Provide an ipfs node that will not boot and sync from public nodes.
* Provide a shared secret to members that will communicate on this private network of nodes that is required to join.

Creating these network is not difficult, however, for private networks, we can make the process a "single click" operation via Azure.  A few parameters are required to help us understand the size of your network, location, and size (performance) and in a few minutes the entire network will be created.

The high level architecture of this template is:

![hla](https://github.com/caleteeter/dapp-examples/blob/master/ipfs-azure/assets/ipfs-azure.png)
