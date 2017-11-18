# Simple Contract to Contract communcation

## Getting Started

This example is demonstrates smart contract to contract calling using a dynamic smart contract at runtime.

### Prerequisites

```
NodeJS (8.x)
Truffle (4.0.x)
```

### Running

```
1 truffle develop
2 truffle migrate 
3 Main.deployed().then((i) { return i.getDerivedData.call(); })
4 Main.deployed().then((i) { return i.setDerivedData(42); })
5 Main.deployed().then((i) { return i.getDerivedData.call(); })

You should see 42 after step 5 has been executed.