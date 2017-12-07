# Simple Enumeration Multi Contract Example

## Getting Started
This example shows how to use enums from a seperate contract (multi-contract) from an associated contract.

### Prerequisites

```
NodeJS (8.x)
Truffle (4.0.x)
```

### Running

```
1 - truffle develop
2 - truffle migrate
3 - Test.deployed().then(function(i){return i.getTestState.call();})
4 - Test.deployed().then(function(i){return i.createTestState();})
5 - Test.deployed().then(function(i){return i.getTestState.call();})
6 - Test.deployed().then(function(i){return i.lockTestState();})
7 - Test.deployed().then(function(i){return i.getTestState.call();})
```